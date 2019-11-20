/*
Copyright 2008-2019 Thomas Paviot (tpaviot@gmail.com)

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
		%feature("autodoc", "* Returns a unit vector with the combination (1,0,0)
	:rtype: gp_Dir") DX;
		static const gp_Dir  DX ();

		/****************** DX2d ******************/
		%feature("compactdefaultargs") DX2d;
		%feature("autodoc", "* Returns a unit vector with the combinations (1,0)
	:rtype: gp_Dir2d") DX2d;
		static const gp_Dir2d  DX2d ();

		/****************** DY ******************/
		%feature("compactdefaultargs") DY;
		%feature("autodoc", "* Returns a unit vector with the combination (0,1,0)
	:rtype: gp_Dir") DY;
		static const gp_Dir  DY ();

		/****************** DY2d ******************/
		%feature("compactdefaultargs") DY2d;
		%feature("autodoc", "* Returns a unit vector with the combinations (0,1)
	:rtype: gp_Dir2d") DY2d;
		static const gp_Dir2d  DY2d ();

		/****************** DZ ******************/
		%feature("compactdefaultargs") DZ;
		%feature("autodoc", "* Returns a unit vector with the combination (0,0,1)
	:rtype: gp_Dir") DZ;
		static const gp_Dir  DZ ();

		/****************** OX ******************/
		%feature("compactdefaultargs") OX;
		%feature("autodoc", "* Identifies an axis where its origin is Origin and its unit vector coordinates X = 1.0, Y = Z = 0.0
	:rtype: gp_Ax1") OX;
		static const gp_Ax1  OX ();

		/****************** OX2d ******************/
		%feature("compactdefaultargs") OX2d;
		%feature("autodoc", "* Identifies an axis where its origin is Origin2d and its unit vector coordinates are: X = 1.0, Y = 0.0
	:rtype: gp_Ax2d") OX2d;
		static const gp_Ax2d  OX2d ();

		/****************** OY ******************/
		%feature("compactdefaultargs") OY;
		%feature("autodoc", "* Identifies an axis where its origin is Origin and its unit vector coordinates Y = 1.0, X = Z = 0.0
	:rtype: gp_Ax1") OY;
		static const gp_Ax1  OY ();

		/****************** OY2d ******************/
		%feature("compactdefaultargs") OY2d;
		%feature("autodoc", "* Identifies an axis where its origin is Origin2d and its unit vector coordinates are Y = 1.0, X = 0.0
	:rtype: gp_Ax2d") OY2d;
		static const gp_Ax2d  OY2d ();

		/****************** OZ ******************/
		%feature("compactdefaultargs") OZ;
		%feature("autodoc", "* Identifies an axis where its origin is Origin and its unit vector coordinates Z = 1.0, Y = X = 0.0
	:rtype: gp_Ax1") OZ;
		static const gp_Ax1  OZ ();

		/****************** Origin ******************/
		%feature("compactdefaultargs") Origin;
		%feature("autodoc", "* Identifies a Cartesian point with coordinates X = Y = Z = 0.0.0
	:rtype: gp_Pnt") Origin;
		static const gp_Pnt  Origin ();

		/****************** Origin2d ******************/
		%feature("compactdefaultargs") Origin2d;
		%feature("autodoc", "* Identifies a Cartesian point with coordinates X = Y = 0.0
	:rtype: gp_Pnt2d") Origin2d;
		static const gp_Pnt2d  Origin2d ();

		/****************** Resolution ******************/
		%feature("compactdefaultargs") Resolution;
		%feature("autodoc", "* Method of package gp //! In geometric computations, defines the tolerance criterion used to determine when two numbers can be considered equal. Many class functions use this tolerance criterion, for example, to avoid division by zero in geometric computations. In the documentation, tolerance criterion is always referred to as gp::Resolution().
	:rtype: float") Resolution;
		static Standard_Real Resolution ();

		/****************** XOY ******************/
		%feature("compactdefaultargs") XOY;
		%feature("autodoc", "* Identifies a coordinate system where its origin is Origin, and its 'main Direction' and 'X Direction' coordinates Z = 1.0, X = Y =0.0 and X direction coordinates X = 1.0, Y = Z = 0.0
	:rtype: gp_Ax2") XOY;
		static const gp_Ax2  XOY ();

		/****************** YOZ ******************/
		%feature("compactdefaultargs") YOZ;
		%feature("autodoc", "* Identifies a coordinate system where its origin is Origin, and its 'main Direction' and 'X Direction' coordinates X = 1.0, Z = Y =0.0 and X direction coordinates Y = 1.0, X = Z = 0.0 In 2D space
	:rtype: gp_Ax2") YOZ;
		static const gp_Ax2  YOZ ();

		/****************** ZOX ******************/
		%feature("compactdefaultargs") ZOX;
		%feature("autodoc", "* Identifies a coordinate system where its origin is Origin, and its 'main Direction' and 'X Direction' coordinates Y = 1.0, X = Z =0.0 and X direction coordinates Z = 1.0, X = Y = 0.0
	:rtype: gp_Ax2") ZOX;
		static const gp_Ax2  ZOX ();

};


%extend gp {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************
* class gp_Ax1 *
***************/
%nodefaultctor gp_Ax1;
class gp_Ax1 {
	public:
		/****************** Angle ******************/
		%feature("compactdefaultargs") Angle;
		%feature("autodoc", "* Computes the angular value, in radians, between <self>.Direction() and <Other>.Direction(). Returns the angle between 0 and 2*PI radians.
	:param Other:
	:type Other: gp_Ax1
	:rtype: float") Angle;
		Standard_Real Angle (const gp_Ax1 & Other);

		/****************** Direction ******************/
		%feature("compactdefaultargs") Direction;
		%feature("autodoc", "* Returns the direction of <self>.
	:rtype: gp_Dir") Direction;
		const gp_Dir  Direction ();

		/****************** IsCoaxial ******************/
		%feature("compactdefaultargs") IsCoaxial;
		%feature("autodoc", "* Returns True if : . the angle between <self> and <Other> is lower or equal to <AngularTolerance> and . the distance between <self>.Location() and <Other> is lower or equal to <LinearTolerance> and . the distance between <Other>.Location() and <self> is lower or equal to LinearTolerance.
	:param Other:
	:type Other: gp_Ax1
	:param AngularTolerance:
	:type AngularTolerance: float
	:param LinearTolerance:
	:type LinearTolerance: float
	:rtype: bool") IsCoaxial;
		Standard_Boolean IsCoaxial (const gp_Ax1 & Other,const Standard_Real AngularTolerance,const Standard_Real LinearTolerance);

		/****************** IsNormal ******************/
		%feature("compactdefaultargs") IsNormal;
		%feature("autodoc", "* Returns True if the direction of the <self> and <Other> are normal to each other. That is, if the angle between the two axes is equal to Pi/2. Note: the tolerance criterion is given by AngularTolerance..
	:param Other:
	:type Other: gp_Ax1
	:param AngularTolerance:
	:type AngularTolerance: float
	:rtype: bool") IsNormal;
		Standard_Boolean IsNormal (const gp_Ax1 & Other,const Standard_Real AngularTolerance);

		/****************** IsOpposite ******************/
		%feature("compactdefaultargs") IsOpposite;
		%feature("autodoc", "* Returns True if the direction of <self> and <Other> are parallel with opposite orientation. That is, if the angle between the two axes is equal to Pi. Note: the tolerance criterion is given by AngularTolerance.
	:param Other:
	:type Other: gp_Ax1
	:param AngularTolerance:
	:type AngularTolerance: float
	:rtype: bool") IsOpposite;
		Standard_Boolean IsOpposite (const gp_Ax1 & Other,const Standard_Real AngularTolerance);

		/****************** IsParallel ******************/
		%feature("compactdefaultargs") IsParallel;
		%feature("autodoc", "* Returns True if the direction of <self> and <Other> are parallel with same orientation or opposite orientation. That is, if the angle between the two axes is equal to 0 or Pi. Note: the tolerance criterion is given by AngularTolerance.
	:param Other:
	:type Other: gp_Ax1
	:param AngularTolerance:
	:type AngularTolerance: float
	:rtype: bool") IsParallel;
		Standard_Boolean IsParallel (const gp_Ax1 & Other,const Standard_Real AngularTolerance);

		/****************** Location ******************/
		%feature("compactdefaultargs") Location;
		%feature("autodoc", "* Returns the location point of <self>.
	:rtype: gp_Pnt") Location;
		const gp_Pnt  Location ();

		/****************** Mirror ******************/
		%feature("compactdefaultargs") Mirror;
		%feature("autodoc", "* Performs the symmetrical transformation of an axis placement with respect to the point P which is the center of the symmetry and assigns the result to this axis.
	:param P:
	:type P: gp_Pnt
	:rtype: None") Mirror;
		void Mirror (const gp_Pnt & P);

		/****************** Mirror ******************/
		%feature("compactdefaultargs") Mirror;
		%feature("autodoc", "* Performs the symmetrical transformation of an axis placement with respect to an axis placement which is the axis of the symmetry and assigns the result to this axis.
	:param A1:
	:type A1: gp_Ax1
	:rtype: None") Mirror;
		void Mirror (const gp_Ax1 & A1);

		/****************** Mirror ******************/
		%feature("compactdefaultargs") Mirror;
		%feature("autodoc", "* Performs the symmetrical transformation of an axis placement with respect to a plane. The axis placement <A2> locates the plane of the symmetry : (Location, XDirection, YDirection) and assigns the result to this axis.
	:param A2:
	:type A2: gp_Ax2
	:rtype: None") Mirror;
		void Mirror (const gp_Ax2 & A2);

		/****************** Mirrored ******************/
		%feature("compactdefaultargs") Mirrored;
		%feature("autodoc", "* Performs the symmetrical transformation of an axis placement with respect to the point P which is the center of the symmetry and creates a new axis.
	:param P:
	:type P: gp_Pnt
	:rtype: Standard_NODISCARD gp_Ax1") Mirrored;
		Standard_NODISCARD gp_Ax1 Mirrored (const gp_Pnt & P);

		/****************** Mirrored ******************/
		%feature("compactdefaultargs") Mirrored;
		%feature("autodoc", "* Performs the symmetrical transformation of an axis placement with respect to an axis placement which is the axis of the symmetry and creates a new axis.
	:param A1:
	:type A1: gp_Ax1
	:rtype: Standard_NODISCARD gp_Ax1") Mirrored;
		Standard_NODISCARD gp_Ax1 Mirrored (const gp_Ax1 & A1);

		/****************** Mirrored ******************/
		%feature("compactdefaultargs") Mirrored;
		%feature("autodoc", "* Performs the symmetrical transformation of an axis placement with respect to a plane. The axis placement <A2> locates the plane of the symmetry : (Location, XDirection, YDirection) and creates a new axis.
	:param A2:
	:type A2: gp_Ax2
	:rtype: Standard_NODISCARD gp_Ax1") Mirrored;
		Standard_NODISCARD gp_Ax1 Mirrored (const gp_Ax2 & A2);

		/****************** Reverse ******************/
		%feature("compactdefaultargs") Reverse;
		%feature("autodoc", "* Reverses the unit vector of this axis. and assigns the result to this axis.
	:rtype: None") Reverse;
		void Reverse ();

		/****************** Reversed ******************/
		%feature("compactdefaultargs") Reversed;
		%feature("autodoc", "* Reverses the unit vector of this axis and creates a new one.
	:rtype: Standard_NODISCARD gp_Ax1") Reversed;
		Standard_NODISCARD gp_Ax1 Reversed ();

		/****************** Rotate ******************/
		%feature("compactdefaultargs") Rotate;
		%feature("autodoc", "* Rotates this axis at an angle Ang (in radians) about the axis A1 and assigns the result to this axis.
	:param A1:
	:type A1: gp_Ax1
	:param Ang:
	:type Ang: float
	:rtype: None") Rotate;
		void Rotate (const gp_Ax1 & A1,const Standard_Real Ang);

		/****************** Rotated ******************/
		%feature("compactdefaultargs") Rotated;
		%feature("autodoc", "* Rotates this axis at an angle Ang (in radians) about the axis A1 and creates a new one.
	:param A1:
	:type A1: gp_Ax1
	:param Ang:
	:type Ang: float
	:rtype: Standard_NODISCARD gp_Ax1") Rotated;
		Standard_NODISCARD gp_Ax1 Rotated (const gp_Ax1 & A1,const Standard_Real Ang);

		/****************** Scale ******************/
		%feature("compactdefaultargs") Scale;
		%feature("autodoc", "* Applies a scaling transformation to this axis with: - scale factor S, and - center P and assigns the result to this axis.
	:param P:
	:type P: gp_Pnt
	:param S:
	:type S: float
	:rtype: None") Scale;
		void Scale (const gp_Pnt & P,const Standard_Real S);

		/****************** Scaled ******************/
		%feature("compactdefaultargs") Scaled;
		%feature("autodoc", "* Applies a scaling transformation to this axis with: - scale factor S, and - center P and creates a new axis.
	:param P:
	:type P: gp_Pnt
	:param S:
	:type S: float
	:rtype: Standard_NODISCARD gp_Ax1") Scaled;
		Standard_NODISCARD gp_Ax1 Scaled (const gp_Pnt & P,const Standard_Real S);

		/****************** SetDirection ******************/
		%feature("compactdefaultargs") SetDirection;
		%feature("autodoc", "* Assigns V as the 'Direction' of this axis.
	:param V:
	:type V: gp_Dir
	:rtype: None") SetDirection;
		void SetDirection (const gp_Dir & V);

		/****************** SetLocation ******************/
		%feature("compactdefaultargs") SetLocation;
		%feature("autodoc", "* Assigns P as the origin of this axis.
	:param P:
	:type P: gp_Pnt
	:rtype: None") SetLocation;
		void SetLocation (const gp_Pnt & P);

		/****************** Transform ******************/
		%feature("compactdefaultargs") Transform;
		%feature("autodoc", "* Applies the transformation T to this axis. and assigns the result to this axis.
	:param T:
	:type T: gp_Trsf
	:rtype: None") Transform;
		void Transform (const gp_Trsf & T);

		/****************** Transformed ******************/
		%feature("compactdefaultargs") Transformed;
		%feature("autodoc", "* Applies the transformation T to this axis and creates a new one. //! Translates an axis plaxement in the direction of the vector <V>. The magnitude of the translation is the vector's magnitude.
	:param T:
	:type T: gp_Trsf
	:rtype: Standard_NODISCARD gp_Ax1") Transformed;
		Standard_NODISCARD gp_Ax1 Transformed (const gp_Trsf & T);

		/****************** Translate ******************/
		%feature("compactdefaultargs") Translate;
		%feature("autodoc", "* Translates this axis by the vector V, and assigns the result to this axis.
	:param V:
	:type V: gp_Vec
	:rtype: None") Translate;
		void Translate (const gp_Vec & V);

		/****************** Translate ******************/
		%feature("compactdefaultargs") Translate;
		%feature("autodoc", "* Translates this axis by: the vector (P1, P2) defined from point P1 to point P2. and assigns the result to this axis.
	:param P1:
	:type P1: gp_Pnt
	:param P2:
	:type P2: gp_Pnt
	:rtype: None") Translate;
		void Translate (const gp_Pnt & P1,const gp_Pnt & P2);

		/****************** Translated ******************/
		%feature("compactdefaultargs") Translated;
		%feature("autodoc", "* Translates this axis by the vector V, and creates a new one.
	:param V:
	:type V: gp_Vec
	:rtype: Standard_NODISCARD gp_Ax1") Translated;
		Standard_NODISCARD gp_Ax1 Translated (const gp_Vec & V);

		/****************** Translated ******************/
		%feature("compactdefaultargs") Translated;
		%feature("autodoc", "* Translates this axis by: the vector (P1, P2) defined from point P1 to point P2. and creates a new one.
	:param P1:
	:type P1: gp_Pnt
	:param P2:
	:type P2: gp_Pnt
	:rtype: Standard_NODISCARD gp_Ax1") Translated;
		Standard_NODISCARD gp_Ax1 Translated (const gp_Pnt & P1,const gp_Pnt & P2);

		/****************** gp_Ax1 ******************/
		%feature("compactdefaultargs") gp_Ax1;
		%feature("autodoc", "* Creates an axis object representing Z axis of the reference co-ordinate system.
	:rtype: None") gp_Ax1;
		 gp_Ax1 ();

		/****************** gp_Ax1 ******************/
		%feature("compactdefaultargs") gp_Ax1;
		%feature("autodoc", "* P is the location point and V is the direction of <self>.
	:param P:
	:type P: gp_Pnt
	:param V:
	:type V: gp_Dir
	:rtype: None") gp_Ax1;
		 gp_Ax1 (const gp_Pnt & P,const gp_Dir & V);

};


%extend gp_Ax1 {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************
* class gp_Ax2 *
***************/
%nodefaultctor gp_Ax2;
class gp_Ax2 {
	public:
		/****************** Angle ******************/
		%feature("compactdefaultargs") Angle;
		%feature("autodoc", "* Computes the angular value, in radians, between the main direction of <self> and the main direction of <Other>. Returns the angle between 0 and PI in radians.
	:param Other:
	:type Other: gp_Ax2
	:rtype: float") Angle;
		Standard_Real Angle (const gp_Ax2 & Other);

		/****************** Axis ******************/
		%feature("compactdefaultargs") Axis;
		%feature("autodoc", "* Returns the main axis of <self>. It is the 'Location' point and the main 'Direction'.
	:rtype: gp_Ax1") Axis;
		const gp_Ax1  Axis ();

		/****************** Direction ******************/
		%feature("compactdefaultargs") Direction;
		%feature("autodoc", "* Returns the main direction of <self>.
	:rtype: gp_Dir") Direction;
		const gp_Dir  Direction ();

		/****************** IsCoplanar ******************/
		%feature("compactdefaultargs") IsCoplanar;
		%feature("autodoc", ":param Other:
	:type Other: gp_Ax2
	:param LinearTolerance:
	:type LinearTolerance: float
	:param AngularTolerance:
	:type AngularTolerance: float
	:rtype: bool") IsCoplanar;
		Standard_Boolean IsCoplanar (const gp_Ax2 & Other,const Standard_Real LinearTolerance,const Standard_Real AngularTolerance);

		/****************** IsCoplanar ******************/
		%feature("compactdefaultargs") IsCoplanar;
		%feature("autodoc", "* Returns True if . the distance between <self> and the 'Location' point of A1 is lower of equal to LinearTolerance and . the main direction of <self> and the direction of A1 are normal. Note: the tolerance criterion for angular equality is given by AngularTolerance.
	:param A1:
	:type A1: gp_Ax1
	:param LinearTolerance:
	:type LinearTolerance: float
	:param AngularTolerance:
	:type AngularTolerance: float
	:rtype: bool") IsCoplanar;
		Standard_Boolean IsCoplanar (const gp_Ax1 & A1,const Standard_Real LinearTolerance,const Standard_Real AngularTolerance);

		/****************** Location ******************/
		%feature("compactdefaultargs") Location;
		%feature("autodoc", "* Returns the 'Location' point (origin) of <self>.
	:rtype: gp_Pnt") Location;
		const gp_Pnt  Location ();

		/****************** Mirror ******************/
		%feature("compactdefaultargs") Mirror;
		%feature("autodoc", "* Performs a symmetrical transformation of this coordinate system with respect to: - the point P, and assigns the result to this coordinate system. Warning This transformation is always performed on the origin. In case of a reflection with respect to a point: - the main direction of the coordinate system is not changed, and - the 'X Direction' and the 'Y Direction' are simply reversed In case of a reflection with respect to an axis or a plane: - the transformation is applied to the 'X Direction' and the 'Y Direction', then - the 'main Direction' is recomputed as the cross product 'X Direction' ^ 'Y Direction'. This maintains the right-handed property of the coordinate system.
	:param P:
	:type P: gp_Pnt
	:rtype: None") Mirror;
		void Mirror (const gp_Pnt & P);

		/****************** Mirror ******************/
		%feature("compactdefaultargs") Mirror;
		%feature("autodoc", "* Performs a symmetrical transformation of this coordinate system with respect to: - the axis A1, and assigns the result to this coordinate systeme. Warning This transformation is always performed on the origin. In case of a reflection with respect to a point: - the main direction of the coordinate system is not changed, and - the 'X Direction' and the 'Y Direction' are simply reversed In case of a reflection with respect to an axis or a plane: - the transformation is applied to the 'X Direction' and the 'Y Direction', then - the 'main Direction' is recomputed as the cross product 'X Direction' ^ 'Y Direction'. This maintains the right-handed property of the coordinate system.
	:param A1:
	:type A1: gp_Ax1
	:rtype: None") Mirror;
		void Mirror (const gp_Ax1 & A1);

		/****************** Mirror ******************/
		%feature("compactdefaultargs") Mirror;
		%feature("autodoc", "* Performs a symmetrical transformation of this coordinate system with respect to: - the plane defined by the origin, 'X Direction' and 'Y Direction' of coordinate system A2 and assigns the result to this coordinate systeme. Warning This transformation is always performed on the origin. In case of a reflection with respect to a point: - the main direction of the coordinate system is not changed, and - the 'X Direction' and the 'Y Direction' are simply reversed In case of a reflection with respect to an axis or a plane: - the transformation is applied to the 'X Direction' and the 'Y Direction', then - the 'main Direction' is recomputed as the cross product 'X Direction' ^ 'Y Direction'. This maintains the right-handed property of the coordinate system.
	:param A2:
	:type A2: gp_Ax2
	:rtype: None") Mirror;
		void Mirror (const gp_Ax2 & A2);

		/****************** Mirrored ******************/
		%feature("compactdefaultargs") Mirrored;
		%feature("autodoc", "* Performs a symmetrical transformation of this coordinate system with respect to: - the point P, and creates a new one. Warning This transformation is always performed on the origin. In case of a reflection with respect to a point: - the main direction of the coordinate system is not changed, and - the 'X Direction' and the 'Y Direction' are simply reversed In case of a reflection with respect to an axis or a plane: - the transformation is applied to the 'X Direction' and the 'Y Direction', then - the 'main Direction' is recomputed as the cross product 'X Direction' ^ 'Y Direction'. This maintains the right-handed property of the coordinate system.
	:param P:
	:type P: gp_Pnt
	:rtype: Standard_NODISCARD gp_Ax2") Mirrored;
		Standard_NODISCARD gp_Ax2 Mirrored (const gp_Pnt & P);

		/****************** Mirrored ******************/
		%feature("compactdefaultargs") Mirrored;
		%feature("autodoc", "* Performs a symmetrical transformation of this coordinate system with respect to: - the axis A1, and creates a new one. Warning This transformation is always performed on the origin. In case of a reflection with respect to a point: - the main direction of the coordinate system is not changed, and - the 'X Direction' and the 'Y Direction' are simply reversed In case of a reflection with respect to an axis or a plane: - the transformation is applied to the 'X Direction' and the 'Y Direction', then - the 'main Direction' is recomputed as the cross product 'X Direction' ^ 'Y Direction'. This maintains the right-handed property of the coordinate system.
	:param A1:
	:type A1: gp_Ax1
	:rtype: Standard_NODISCARD gp_Ax2") Mirrored;
		Standard_NODISCARD gp_Ax2 Mirrored (const gp_Ax1 & A1);

		/****************** Mirrored ******************/
		%feature("compactdefaultargs") Mirrored;
		%feature("autodoc", "* Performs a symmetrical transformation of this coordinate system with respect to: - the plane defined by the origin, 'X Direction' and 'Y Direction' of coordinate system A2 and creates a new one. Warning This transformation is always performed on the origin. In case of a reflection with respect to a point: - the main direction of the coordinate system is not changed, and - the 'X Direction' and the 'Y Direction' are simply reversed In case of a reflection with respect to an axis or a plane: - the transformation is applied to the 'X Direction' and the 'Y Direction', then - the 'main Direction' is recomputed as the cross product 'X Direction' ^ 'Y Direction'. This maintains the right-handed property of the coordinate system.
	:param A2:
	:type A2: gp_Ax2
	:rtype: Standard_NODISCARD gp_Ax2") Mirrored;
		Standard_NODISCARD gp_Ax2 Mirrored (const gp_Ax2 & A2);

		/****************** Rotate ******************/
		%feature("compactdefaultargs") Rotate;
		%feature("autodoc", ":param A1:
	:type A1: gp_Ax1
	:param Ang:
	:type Ang: float
	:rtype: None") Rotate;
		void Rotate (const gp_Ax1 & A1,const Standard_Real Ang);

		/****************** Rotated ******************/
		%feature("compactdefaultargs") Rotated;
		%feature("autodoc", "* Rotates an axis placement. <A1> is the axis of the rotation . Ang is the angular value of the rotation in radians.
	:param A1:
	:type A1: gp_Ax1
	:param Ang:
	:type Ang: float
	:rtype: Standard_NODISCARD gp_Ax2") Rotated;
		Standard_NODISCARD gp_Ax2 Rotated (const gp_Ax1 & A1,const Standard_Real Ang);

		/****************** Scale ******************/
		%feature("compactdefaultargs") Scale;
		%feature("autodoc", ":param P:
	:type P: gp_Pnt
	:param S:
	:type S: float
	:rtype: None") Scale;
		void Scale (const gp_Pnt & P,const Standard_Real S);

		/****************** Scaled ******************/
		%feature("compactdefaultargs") Scaled;
		%feature("autodoc", "* Applies a scaling transformation on the axis placement. The 'Location' point of the axisplacement is modified. Warnings : If the scale <S> is negative : . the main direction of the axis placement is not changed. . The 'XDirection' and the 'YDirection' are reversed. So the axis placement stay right handed.
	:param P:
	:type P: gp_Pnt
	:param S:
	:type S: float
	:rtype: Standard_NODISCARD gp_Ax2") Scaled;
		Standard_NODISCARD gp_Ax2 Scaled (const gp_Pnt & P,const Standard_Real S);

		/****************** SetAxis ******************/
		%feature("compactdefaultargs") SetAxis;
		%feature("autodoc", "* Assigns the origin and 'main Direction' of the axis A1 to this coordinate system, then recomputes its 'X Direction' and 'Y Direction'. Note: The new 'X Direction' is computed as follows: new 'X Direction' = V1 ^(previous 'X Direction' ^ V) where V is the 'Direction' of A1. Exceptions Standard_ConstructionError if A1 is parallel to the 'X Direction' of this coordinate system.
	:param A1:
	:type A1: gp_Ax1
	:rtype: None") SetAxis;
		void SetAxis (const gp_Ax1 & A1);

		/****************** SetDirection ******************/
		%feature("compactdefaultargs") SetDirection;
		%feature("autodoc", "* Changes the 'main Direction' of this coordinate system, then recomputes its 'X Direction' and 'Y Direction'. Note: the new 'X Direction' is computed as follows: new 'X Direction' = V ^ (previous 'X Direction' ^ V) Exceptions Standard_ConstructionError if V is parallel to the 'X Direction' of this coordinate system.
	:param V:
	:type V: gp_Dir
	:rtype: None") SetDirection;
		void SetDirection (const gp_Dir & V);

		/****************** SetLocation ******************/
		%feature("compactdefaultargs") SetLocation;
		%feature("autodoc", "* Changes the 'Location' point (origin) of <self>.
	:param P:
	:type P: gp_Pnt
	:rtype: None") SetLocation;
		void SetLocation (const gp_Pnt & P);

		/****************** SetXDirection ******************/
		%feature("compactdefaultargs") SetXDirection;
		%feature("autodoc", "* Changes the 'Xdirection' of <self>. The main direction 'Direction' is not modified, the 'Ydirection' is modified. If <Vx> is not normal to the main direction then <XDirection> is computed as follows XDirection = Direction ^ (Vx ^ Direction). Exceptions Standard_ConstructionError if Vx or Vy is parallel to the 'main Direction' of this coordinate system.
	:param Vx:
	:type Vx: gp_Dir
	:rtype: None") SetXDirection;
		void SetXDirection (const gp_Dir & Vx);

		/****************** SetYDirection ******************/
		%feature("compactdefaultargs") SetYDirection;
		%feature("autodoc", "* Changes the 'Ydirection' of <self>. The main direction is not modified but the 'Xdirection' is changed. If <Vy> is not normal to the main direction then 'YDirection' is computed as follows YDirection = Direction ^ (<Vy> ^ Direction). Exceptions Standard_ConstructionError if Vx or Vy is parallel to the 'main Direction' of this coordinate system.
	:param Vy:
	:type Vy: gp_Dir
	:rtype: None") SetYDirection;
		void SetYDirection (const gp_Dir & Vy);

		/****************** Transform ******************/
		%feature("compactdefaultargs") Transform;
		%feature("autodoc", ":param T:
	:type T: gp_Trsf
	:rtype: None") Transform;
		void Transform (const gp_Trsf & T);

		/****************** Transformed ******************/
		%feature("compactdefaultargs") Transformed;
		%feature("autodoc", "* Transforms an axis placement with a Trsf. The 'Location' point, the 'XDirection' and the 'YDirection' are transformed with T. The resulting main 'Direction' of <self> is the cross product between the 'XDirection' and the 'YDirection' after transformation.
	:param T:
	:type T: gp_Trsf
	:rtype: Standard_NODISCARD gp_Ax2") Transformed;
		Standard_NODISCARD gp_Ax2 Transformed (const gp_Trsf & T);

		/****************** Translate ******************/
		%feature("compactdefaultargs") Translate;
		%feature("autodoc", ":param V:
	:type V: gp_Vec
	:rtype: None") Translate;
		void Translate (const gp_Vec & V);

		/****************** Translate ******************/
		%feature("compactdefaultargs") Translate;
		%feature("autodoc", ":param P1:
	:type P1: gp_Pnt
	:param P2:
	:type P2: gp_Pnt
	:rtype: None") Translate;
		void Translate (const gp_Pnt & P1,const gp_Pnt & P2);

		/****************** Translated ******************/
		%feature("compactdefaultargs") Translated;
		%feature("autodoc", "* Translates an axis plaxement in the direction of the vector <V>. The magnitude of the translation is the vector's magnitude.
	:param V:
	:type V: gp_Vec
	:rtype: Standard_NODISCARD gp_Ax2") Translated;
		Standard_NODISCARD gp_Ax2 Translated (const gp_Vec & V);

		/****************** Translated ******************/
		%feature("compactdefaultargs") Translated;
		%feature("autodoc", "* Translates an axis placement from the point <P1> to the point <P2>.
	:param P1:
	:type P1: gp_Pnt
	:param P2:
	:type P2: gp_Pnt
	:rtype: Standard_NODISCARD gp_Ax2") Translated;
		Standard_NODISCARD gp_Ax2 Translated (const gp_Pnt & P1,const gp_Pnt & P2);

		/****************** XDirection ******************/
		%feature("compactdefaultargs") XDirection;
		%feature("autodoc", "* Returns the 'XDirection' of <self>.
	:rtype: gp_Dir") XDirection;
		const gp_Dir  XDirection ();

		/****************** YDirection ******************/
		%feature("compactdefaultargs") YDirection;
		%feature("autodoc", "* Returns the 'YDirection' of <self>.
	:rtype: gp_Dir") YDirection;
		const gp_Dir  YDirection ();

		/****************** gp_Ax2 ******************/
		%feature("compactdefaultargs") gp_Ax2;
		%feature("autodoc", "* Creates an object corresponding to the reference coordinate system (OXYZ).
	:rtype: None") gp_Ax2;
		 gp_Ax2 ();

		/****************** gp_Ax2 ******************/
		%feature("compactdefaultargs") gp_Ax2;
		%feature("autodoc", "* Creates an axis placement with an origin P such that: - N is the Direction, and - the 'X Direction' is normal to N, in the plane defined by the vectors (N, Vx): 'X Direction' = (N ^ Vx) ^ N, Exception: raises ConstructionError if N and Vx are parallel (same or opposite orientation).
	:param P:
	:type P: gp_Pnt
	:param N:
	:type N: gp_Dir
	:param Vx:
	:type Vx: gp_Dir
	:rtype: None") gp_Ax2;
		 gp_Ax2 (const gp_Pnt & P,const gp_Dir & N,const gp_Dir & Vx);

		/****************** gp_Ax2 ******************/
		%feature("compactdefaultargs") gp_Ax2;
		%feature("autodoc", "* Creates - a coordinate system with an origin P, where V gives the 'main Direction' (here, 'X Direction' and 'Y Direction' are defined automatically).
	:param P:
	:type P: gp_Pnt
	:param V:
	:type V: gp_Dir
	:rtype: None") gp_Ax2;
		 gp_Ax2 (const gp_Pnt & P,const gp_Dir & V);

};


%extend gp_Ax2 {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************
* class gp_Ax22d *
*****************/
%nodefaultctor gp_Ax22d;
class gp_Ax22d {
	public:
		/****************** Location ******************/
		%feature("compactdefaultargs") Location;
		%feature("autodoc", "* Returns the 'Location' point (origin) of <self>.
	:rtype: gp_Pnt2d") Location;
		const gp_Pnt2d  Location ();

		/****************** Mirror ******************/
		%feature("compactdefaultargs") Mirror;
		%feature("autodoc", ":param P:
	:type P: gp_Pnt2d
	:rtype: None") Mirror;
		void Mirror (const gp_Pnt2d & P);

		/****************** Mirror ******************/
		%feature("compactdefaultargs") Mirror;
		%feature("autodoc", ":param A:
	:type A: gp_Ax2d
	:rtype: None") Mirror;
		void Mirror (const gp_Ax2d & A);

		/****************** Mirrored ******************/
		%feature("compactdefaultargs") Mirrored;
		%feature("autodoc", "* Performs the symmetrical transformation of an axis placement with respect to the point P which is the center of the symmetry. Warnings : The main direction of the axis placement is not changed. The 'XDirection' and the 'YDirection' are reversed. So the axis placement stay right handed.
	:param P:
	:type P: gp_Pnt2d
	:rtype: Standard_NODISCARD gp_Ax22d") Mirrored;
		Standard_NODISCARD gp_Ax22d Mirrored (const gp_Pnt2d & P);

		/****************** Mirrored ******************/
		%feature("compactdefaultargs") Mirrored;
		%feature("autodoc", "* Performs the symmetrical transformation of an axis placement with respect to an axis placement which is the axis of the symmetry. The transformation is performed on the 'Location' point, on the 'XDirection' and 'YDirection'. The resulting main 'Direction' is the cross product between the 'XDirection' and the 'YDirection' after transformation.
	:param A:
	:type A: gp_Ax2d
	:rtype: Standard_NODISCARD gp_Ax22d") Mirrored;
		Standard_NODISCARD gp_Ax22d Mirrored (const gp_Ax2d & A);

		/****************** Rotate ******************/
		%feature("compactdefaultargs") Rotate;
		%feature("autodoc", ":param P:
	:type P: gp_Pnt2d
	:param Ang:
	:type Ang: float
	:rtype: None") Rotate;
		void Rotate (const gp_Pnt2d & P,const Standard_Real Ang);

		/****************** Rotated ******************/
		%feature("compactdefaultargs") Rotated;
		%feature("autodoc", "* Rotates an axis placement. <A1> is the axis of the rotation . Ang is the angular value of the rotation in radians.
	:param P:
	:type P: gp_Pnt2d
	:param Ang:
	:type Ang: float
	:rtype: Standard_NODISCARD gp_Ax22d") Rotated;
		Standard_NODISCARD gp_Ax22d Rotated (const gp_Pnt2d & P,const Standard_Real Ang);

		/****************** Scale ******************/
		%feature("compactdefaultargs") Scale;
		%feature("autodoc", ":param P:
	:type P: gp_Pnt2d
	:param S:
	:type S: float
	:rtype: None") Scale;
		void Scale (const gp_Pnt2d & P,const Standard_Real S);

		/****************** Scaled ******************/
		%feature("compactdefaultargs") Scaled;
		%feature("autodoc", "* Applies a scaling transformation on the axis placement. The 'Location' point of the axisplacement is modified. Warnings : If the scale <S> is negative : . the main direction of the axis placement is not changed. . The 'XDirection' and the 'YDirection' are reversed. So the axis placement stay right handed.
	:param P:
	:type P: gp_Pnt2d
	:param S:
	:type S: float
	:rtype: Standard_NODISCARD gp_Ax22d") Scaled;
		Standard_NODISCARD gp_Ax22d Scaled (const gp_Pnt2d & P,const Standard_Real S);

		/****************** SetAxis ******************/
		%feature("compactdefaultargs") SetAxis;
		%feature("autodoc", "* Assigns the origin and the two unit vectors of the coordinate system A1 to this coordinate system.
	:param A1:
	:type A1: gp_Ax22d
	:rtype: None") SetAxis;
		void SetAxis (const gp_Ax22d & A1);

		/****************** SetLocation ******************/
		%feature("compactdefaultargs") SetLocation;
		%feature("autodoc", "* Changes the 'Location' point (origin) of <self>.
	:param P:
	:type P: gp_Pnt2d
	:rtype: None") SetLocation;
		void SetLocation (const gp_Pnt2d & P);

		/****************** SetXAxis ******************/
		%feature("compactdefaultargs") SetXAxis;
		%feature("autodoc", "* Changes the XAxis and YAxis ('Location' point and 'Direction') of <self>. The 'YDirection' is recomputed in the same sense as before.
	:param A1:
	:type A1: gp_Ax2d
	:rtype: None") SetXAxis;
		void SetXAxis (const gp_Ax2d & A1);

		/****************** SetXDirection ******************/
		%feature("compactdefaultargs") SetXDirection;
		%feature("autodoc", "* Assigns Vx to the 'X Direction' of this coordinate system. The other unit vector of this coordinate system is recomputed, normal to Vx , without modifying the orientation (right-handed or left-handed) of this coordinate system.
	:param Vx:
	:type Vx: gp_Dir2d
	:rtype: None") SetXDirection;
		void SetXDirection (const gp_Dir2d & Vx);

		/****************** SetYAxis ******************/
		%feature("compactdefaultargs") SetYAxis;
		%feature("autodoc", "* Changes the XAxis and YAxis ('Location' point and 'Direction') of <self>. The 'XDirection' is recomputed in the same sense as before.
	:param A1:
	:type A1: gp_Ax2d
	:rtype: None") SetYAxis;
		void SetYAxis (const gp_Ax2d & A1);

		/****************** SetYDirection ******************/
		%feature("compactdefaultargs") SetYDirection;
		%feature("autodoc", "* Assignsr Vy to the 'Y Direction' of this coordinate system. The other unit vector of this coordinate system is recomputed, normal to Vy, without modifying the orientation (right-handed or left-handed) of this coordinate system.
	:param Vy:
	:type Vy: gp_Dir2d
	:rtype: None") SetYDirection;
		void SetYDirection (const gp_Dir2d & Vy);

		/****************** Transform ******************/
		%feature("compactdefaultargs") Transform;
		%feature("autodoc", ":param T:
	:type T: gp_Trsf2d
	:rtype: None") Transform;
		void Transform (const gp_Trsf2d & T);

		/****************** Transformed ******************/
		%feature("compactdefaultargs") Transformed;
		%feature("autodoc", "* Transforms an axis placement with a Trsf. The 'Location' point, the 'XDirection' and the 'YDirection' are transformed with T. The resulting main 'Direction' of <self> is the cross product between the 'XDirection' and the 'YDirection' after transformation.
	:param T:
	:type T: gp_Trsf2d
	:rtype: Standard_NODISCARD gp_Ax22d") Transformed;
		Standard_NODISCARD gp_Ax22d Transformed (const gp_Trsf2d & T);

		/****************** Translate ******************/
		%feature("compactdefaultargs") Translate;
		%feature("autodoc", ":param V:
	:type V: gp_Vec2d
	:rtype: None") Translate;
		void Translate (const gp_Vec2d & V);

		/****************** Translate ******************/
		%feature("compactdefaultargs") Translate;
		%feature("autodoc", ":param P1:
	:type P1: gp_Pnt2d
	:param P2:
	:type P2: gp_Pnt2d
	:rtype: None") Translate;
		void Translate (const gp_Pnt2d & P1,const gp_Pnt2d & P2);

		/****************** Translated ******************/
		%feature("compactdefaultargs") Translated;
		%feature("autodoc", "* Translates an axis plaxement in the direction of the vector <V>. The magnitude of the translation is the vector's magnitude.
	:param V:
	:type V: gp_Vec2d
	:rtype: Standard_NODISCARD gp_Ax22d") Translated;
		Standard_NODISCARD gp_Ax22d Translated (const gp_Vec2d & V);

		/****************** Translated ******************/
		%feature("compactdefaultargs") Translated;
		%feature("autodoc", "* Translates an axis placement from the point <P1> to the point <P2>.
	:param P1:
	:type P1: gp_Pnt2d
	:param P2:
	:type P2: gp_Pnt2d
	:rtype: Standard_NODISCARD gp_Ax22d") Translated;
		Standard_NODISCARD gp_Ax22d Translated (const gp_Pnt2d & P1,const gp_Pnt2d & P2);

		/****************** XAxis ******************/
		%feature("compactdefaultargs") XAxis;
		%feature("autodoc", "* Returns an axis, for which - the origin is that of this coordinate system, and - the unit vector is either the 'X Direction' of this coordinate system. Note: the result is the 'X Axis' of this coordinate system.
	:rtype: gp_Ax2d") XAxis;
		gp_Ax2d XAxis ();

		/****************** XDirection ******************/
		%feature("compactdefaultargs") XDirection;
		%feature("autodoc", "* Returns the 'XDirection' of <self>.
	:rtype: gp_Dir2d") XDirection;
		const gp_Dir2d  XDirection ();

		/****************** YAxis ******************/
		%feature("compactdefaultargs") YAxis;
		%feature("autodoc", "* Returns an axis, for which - the origin is that of this coordinate system, and - the unit vector is either the 'Y Direction' of this coordinate system. Note: the result is the 'Y Axis' of this coordinate system.
	:rtype: gp_Ax2d") YAxis;
		gp_Ax2d YAxis ();

		/****************** YDirection ******************/
		%feature("compactdefaultargs") YDirection;
		%feature("autodoc", "* Returns the 'YDirection' of <self>.
	:rtype: gp_Dir2d") YDirection;
		const gp_Dir2d  YDirection ();

		/****************** gp_Ax22d ******************/
		%feature("compactdefaultargs") gp_Ax22d;
		%feature("autodoc", "* Creates an object representing the reference co-ordinate system (OXY).
	:rtype: None") gp_Ax22d;
		 gp_Ax22d ();

		/****************** gp_Ax22d ******************/
		%feature("compactdefaultargs") gp_Ax22d;
		%feature("autodoc", "* Creates a coordinate system with origin P and where: - Vx is the 'X Direction', and - the 'Y Direction' is orthogonal to Vx and oriented so that the cross products Vx^'Y Direction' and Vx^Vy have the same sign. Raises ConstructionError if Vx and Vy are parallel (same or opposite orientation).
	:param P:
	:type P: gp_Pnt2d
	:param Vx:
	:type Vx: gp_Dir2d
	:param Vy:
	:type Vy: gp_Dir2d
	:rtype: None") gp_Ax22d;
		 gp_Ax22d (const gp_Pnt2d & P,const gp_Dir2d & Vx,const gp_Dir2d & Vy);

		/****************** gp_Ax22d ******************/
		%feature("compactdefaultargs") gp_Ax22d;
		%feature("autodoc", "* Creates - a coordinate system with origin P and 'X Direction' V, which is: - right-handed if Sense is true (default value), or - left-handed if Sense is false
	:param P:
	:type P: gp_Pnt2d
	:param V:
	:type V: gp_Dir2d
	:param Sense: default value is Standard_True
	:type Sense: bool
	:rtype: None") gp_Ax22d;
		 gp_Ax22d (const gp_Pnt2d & P,const gp_Dir2d & V,const Standard_Boolean Sense = Standard_True);

		/****************** gp_Ax22d ******************/
		%feature("compactdefaultargs") gp_Ax22d;
		%feature("autodoc", "* Creates - a coordinate system where its origin is the origin of A and its 'X Direction' is the unit vector of A, which is: - right-handed if Sense is true (default value), or - left-handed if Sense is false.
	:param A:
	:type A: gp_Ax2d
	:param Sense: default value is Standard_True
	:type Sense: bool
	:rtype: None") gp_Ax22d;
		 gp_Ax22d (const gp_Ax2d & A,const Standard_Boolean Sense = Standard_True);

};


%extend gp_Ax22d {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************
* class gp_Ax2d *
****************/
%nodefaultctor gp_Ax2d;
class gp_Ax2d {
	public:
		/****************** Angle ******************/
		%feature("compactdefaultargs") Angle;
		%feature("autodoc", "* Computes the angle, in radians, between this axis and the axis Other. The value of the angle is between -Pi and Pi.
	:param Other:
	:type Other: gp_Ax2d
	:rtype: float") Angle;
		Standard_Real Angle (const gp_Ax2d & Other);

		/****************** Direction ******************/
		%feature("compactdefaultargs") Direction;
		%feature("autodoc", "* Returns the direction of <self>.
	:rtype: gp_Dir2d") Direction;
		const gp_Dir2d  Direction ();

		/****************** IsCoaxial ******************/
		%feature("compactdefaultargs") IsCoaxial;
		%feature("autodoc", "* Returns True if : . the angle between <self> and <Other> is lower or equal to <AngularTolerance> and . the distance between <self>.Location() and <Other> is lower or equal to <LinearTolerance> and . the distance between <Other>.Location() and <self> is lower or equal to LinearTolerance.
	:param Other:
	:type Other: gp_Ax2d
	:param AngularTolerance:
	:type AngularTolerance: float
	:param LinearTolerance:
	:type LinearTolerance: float
	:rtype: bool") IsCoaxial;
		Standard_Boolean IsCoaxial (const gp_Ax2d & Other,const Standard_Real AngularTolerance,const Standard_Real LinearTolerance);

		/****************** IsNormal ******************/
		%feature("compactdefaultargs") IsNormal;
		%feature("autodoc", "* Returns true if this axis and the axis Other are normal to each other. That is, if the angle between the two axes is equal to Pi/2 or -Pi/2. Note: the tolerance criterion is given by AngularTolerance.
	:param Other:
	:type Other: gp_Ax2d
	:param AngularTolerance:
	:type AngularTolerance: float
	:rtype: bool") IsNormal;
		Standard_Boolean IsNormal (const gp_Ax2d & Other,const Standard_Real AngularTolerance);

		/****************** IsOpposite ******************/
		%feature("compactdefaultargs") IsOpposite;
		%feature("autodoc", "* Returns true if this axis and the axis Other are parallel, and have opposite orientations. That is, if the angle between the two axes is equal to Pi or -Pi. Note: the tolerance criterion is given by AngularTolerance.
	:param Other:
	:type Other: gp_Ax2d
	:param AngularTolerance:
	:type AngularTolerance: float
	:rtype: bool") IsOpposite;
		Standard_Boolean IsOpposite (const gp_Ax2d & Other,const Standard_Real AngularTolerance);

		/****************** IsParallel ******************/
		%feature("compactdefaultargs") IsParallel;
		%feature("autodoc", "* Returns true if this axis and the axis Other are parallel, and have either the same or opposite orientations. That is, if the angle between the two axes is equal to 0, Pi or -Pi. Note: the tolerance criterion is given by AngularTolerance.
	:param Other:
	:type Other: gp_Ax2d
	:param AngularTolerance:
	:type AngularTolerance: float
	:rtype: bool") IsParallel;
		Standard_Boolean IsParallel (const gp_Ax2d & Other,const Standard_Real AngularTolerance);

		/****************** Location ******************/
		%feature("compactdefaultargs") Location;
		%feature("autodoc", "* Returns the origin of <self>.
	:rtype: gp_Pnt2d") Location;
		const gp_Pnt2d  Location ();

		/****************** Mirror ******************/
		%feature("compactdefaultargs") Mirror;
		%feature("autodoc", ":param P:
	:type P: gp_Pnt2d
	:rtype: None") Mirror;
		void Mirror (const gp_Pnt2d & P);

		/****************** Mirror ******************/
		%feature("compactdefaultargs") Mirror;
		%feature("autodoc", ":param A:
	:type A: gp_Ax2d
	:rtype: None") Mirror;
		void Mirror (const gp_Ax2d & A);

		/****************** Mirrored ******************/
		%feature("compactdefaultargs") Mirrored;
		%feature("autodoc", "* Performs the symmetrical transformation of an axis placement with respect to the point P which is the center of the symmetry.
	:param P:
	:type P: gp_Pnt2d
	:rtype: Standard_NODISCARD gp_Ax2d") Mirrored;
		Standard_NODISCARD gp_Ax2d Mirrored (const gp_Pnt2d & P);

		/****************** Mirrored ******************/
		%feature("compactdefaultargs") Mirrored;
		%feature("autodoc", "* Performs the symmetrical transformation of an axis placement with respect to an axis placement which is the axis of the symmetry.
	:param A:
	:type A: gp_Ax2d
	:rtype: Standard_NODISCARD gp_Ax2d") Mirrored;
		Standard_NODISCARD gp_Ax2d Mirrored (const gp_Ax2d & A);

		/****************** Reverse ******************/
		%feature("compactdefaultargs") Reverse;
		%feature("autodoc", "* Reverses the direction of <self> and assigns the result to this axis.
	:rtype: None") Reverse;
		void Reverse ();

		/****************** Reversed ******************/
		%feature("compactdefaultargs") Reversed;
		%feature("autodoc", "* Computes a new axis placement with a direction opposite to the direction of <self>.
	:rtype: Standard_NODISCARD gp_Ax2d") Reversed;
		Standard_NODISCARD gp_Ax2d Reversed ();

		/****************** Rotate ******************/
		%feature("compactdefaultargs") Rotate;
		%feature("autodoc", ":param P:
	:type P: gp_Pnt2d
	:param Ang:
	:type Ang: float
	:rtype: None") Rotate;
		void Rotate (const gp_Pnt2d & P,const Standard_Real Ang);

		/****************** Rotated ******************/
		%feature("compactdefaultargs") Rotated;
		%feature("autodoc", "* Rotates an axis placement. <P> is the center of the rotation . Ang is the angular value of the rotation in radians.
	:param P:
	:type P: gp_Pnt2d
	:param Ang:
	:type Ang: float
	:rtype: Standard_NODISCARD gp_Ax2d") Rotated;
		Standard_NODISCARD gp_Ax2d Rotated (const gp_Pnt2d & P,const Standard_Real Ang);

		/****************** Scale ******************/
		%feature("compactdefaultargs") Scale;
		%feature("autodoc", ":param P:
	:type P: gp_Pnt2d
	:param S:
	:type S: float
	:rtype: None") Scale;
		void Scale (const gp_Pnt2d & P,const Standard_Real S);

		/****************** Scaled ******************/
		%feature("compactdefaultargs") Scaled;
		%feature("autodoc", "* Applies a scaling transformation on the axis placement. The 'Location' point of the axisplacement is modified. The 'Direction' is reversed if the scale is negative.
	:param P:
	:type P: gp_Pnt2d
	:param S:
	:type S: float
	:rtype: Standard_NODISCARD gp_Ax2d") Scaled;
		Standard_NODISCARD gp_Ax2d Scaled (const gp_Pnt2d & P,const Standard_Real S);

		/****************** SetDirection ******************/
		%feature("compactdefaultargs") SetDirection;
		%feature("autodoc", "* Changes the direction of <self>.
	:param V:
	:type V: gp_Dir2d
	:rtype: None") SetDirection;
		void SetDirection (const gp_Dir2d & V);

		/****************** SetLocation ******************/
		%feature("compactdefaultargs") SetLocation;
		%feature("autodoc", "* Changes the 'Location' point (origin) of <self>.
	:param Locat:
	:type Locat: gp_Pnt2d
	:rtype: None") SetLocation;
		void SetLocation (const gp_Pnt2d & Locat);

		/****************** Transform ******************/
		%feature("compactdefaultargs") Transform;
		%feature("autodoc", ":param T:
	:type T: gp_Trsf2d
	:rtype: None") Transform;
		void Transform (const gp_Trsf2d & T);

		/****************** Transformed ******************/
		%feature("compactdefaultargs") Transformed;
		%feature("autodoc", "* Transforms an axis placement with a Trsf.
	:param T:
	:type T: gp_Trsf2d
	:rtype: Standard_NODISCARD gp_Ax2d") Transformed;
		Standard_NODISCARD gp_Ax2d Transformed (const gp_Trsf2d & T);

		/****************** Translate ******************/
		%feature("compactdefaultargs") Translate;
		%feature("autodoc", ":param V:
	:type V: gp_Vec2d
	:rtype: None") Translate;
		void Translate (const gp_Vec2d & V);

		/****************** Translate ******************/
		%feature("compactdefaultargs") Translate;
		%feature("autodoc", ":param P1:
	:type P1: gp_Pnt2d
	:param P2:
	:type P2: gp_Pnt2d
	:rtype: None") Translate;
		void Translate (const gp_Pnt2d & P1,const gp_Pnt2d & P2);

		/****************** Translated ******************/
		%feature("compactdefaultargs") Translated;
		%feature("autodoc", "* Translates an axis placement in the direction of the vector <V>. The magnitude of the translation is the vector's magnitude.
	:param V:
	:type V: gp_Vec2d
	:rtype: Standard_NODISCARD gp_Ax2d") Translated;
		Standard_NODISCARD gp_Ax2d Translated (const gp_Vec2d & V);

		/****************** Translated ******************/
		%feature("compactdefaultargs") Translated;
		%feature("autodoc", "* Translates an axis placement from the point <P1> to the point <P2>.
	:param P1:
	:type P1: gp_Pnt2d
	:param P2:
	:type P2: gp_Pnt2d
	:rtype: Standard_NODISCARD gp_Ax2d") Translated;
		Standard_NODISCARD gp_Ax2d Translated (const gp_Pnt2d & P1,const gp_Pnt2d & P2);

		/****************** gp_Ax2d ******************/
		%feature("compactdefaultargs") gp_Ax2d;
		%feature("autodoc", "* Creates an axis object representing X axis of the reference co-ordinate system.
	:rtype: None") gp_Ax2d;
		 gp_Ax2d ();

		/****************** gp_Ax2d ******************/
		%feature("compactdefaultargs") gp_Ax2d;
		%feature("autodoc", "* Creates an Ax2d. <P> is the 'Location' point of the axis placement and V is the 'Direction' of the axis placement.
	:param P:
	:type P: gp_Pnt2d
	:param V:
	:type V: gp_Dir2d
	:rtype: None") gp_Ax2d;
		 gp_Ax2d (const gp_Pnt2d & P,const gp_Dir2d & V);

};


%extend gp_Ax2d {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************
* class gp_Ax3 *
***************/
%nodefaultctor gp_Ax3;
class gp_Ax3 {
	public:
		/****************** Angle ******************/
		%feature("compactdefaultargs") Angle;
		%feature("autodoc", "* Computes the angular value between the main direction of <self> and the main direction of <Other>. Returns the angle between 0 and PI in radians.
	:param Other:
	:type Other: gp_Ax3
	:rtype: float") Angle;
		Standard_Real Angle (const gp_Ax3 & Other);

		/****************** Ax2 ******************/
		%feature("compactdefaultargs") Ax2;
		%feature("autodoc", "* Computes a right-handed coordinate system with the same 'X Direction' and 'Y Direction' as those of this coordinate system, then recomputes the 'main Direction'. If this coordinate system is right-handed, the result returned is the same coordinate system. If this coordinate system is left-handed, the result is reversed.
	:rtype: gp_Ax2") Ax2;
		gp_Ax2 Ax2 ();

		/****************** Axis ******************/
		%feature("compactdefaultargs") Axis;
		%feature("autodoc", "* Returns the main axis of <self>. It is the 'Location' point and the main 'Direction'.
	:rtype: gp_Ax1") Axis;
		const gp_Ax1  Axis ();

		/****************** Direct ******************/
		%feature("compactdefaultargs") Direct;
		%feature("autodoc", "* Returns True if the coordinate system is right-handed. i.e. XDirection().Crossed(YDirection()).Dot(Direction()) > 0
	:rtype: bool") Direct;
		Standard_Boolean Direct ();

		/****************** Direction ******************/
		%feature("compactdefaultargs") Direction;
		%feature("autodoc", "* Returns the main direction of <self>.
	:rtype: gp_Dir") Direction;
		const gp_Dir  Direction ();

		/****************** IsCoplanar ******************/
		%feature("compactdefaultargs") IsCoplanar;
		%feature("autodoc", "* Returns True if . the distance between the 'Location' point of <self> and <Other> is lower or equal to LinearTolerance and . the distance between the 'Location' point of <Other> and <self> is lower or equal to LinearTolerance and . the main direction of <self> and the main direction of <Other> are parallel (same or opposite orientation).
	:param Other:
	:type Other: gp_Ax3
	:param LinearTolerance:
	:type LinearTolerance: float
	:param AngularTolerance:
	:type AngularTolerance: float
	:rtype: bool") IsCoplanar;
		Standard_Boolean IsCoplanar (const gp_Ax3 & Other,const Standard_Real LinearTolerance,const Standard_Real AngularTolerance);

		/****************** IsCoplanar ******************/
		%feature("compactdefaultargs") IsCoplanar;
		%feature("autodoc", "* Returns True if . the distance between <self> and the 'Location' point of A1 is lower of equal to LinearTolerance and . the distance between A1 and the 'Location' point of <self> is lower or equal to LinearTolerance and . the main direction of <self> and the direction of A1 are normal.
	:param A1:
	:type A1: gp_Ax1
	:param LinearTolerance:
	:type LinearTolerance: float
	:param AngularTolerance:
	:type AngularTolerance: float
	:rtype: bool") IsCoplanar;
		Standard_Boolean IsCoplanar (const gp_Ax1 & A1,const Standard_Real LinearTolerance,const Standard_Real AngularTolerance);

		/****************** Location ******************/
		%feature("compactdefaultargs") Location;
		%feature("autodoc", "* Returns the 'Location' point (origin) of <self>.
	:rtype: gp_Pnt") Location;
		const gp_Pnt  Location ();

		/****************** Mirror ******************/
		%feature("compactdefaultargs") Mirror;
		%feature("autodoc", ":param P:
	:type P: gp_Pnt
	:rtype: None") Mirror;
		void Mirror (const gp_Pnt & P);

		/****************** Mirror ******************/
		%feature("compactdefaultargs") Mirror;
		%feature("autodoc", ":param A1:
	:type A1: gp_Ax1
	:rtype: None") Mirror;
		void Mirror (const gp_Ax1 & A1);

		/****************** Mirror ******************/
		%feature("compactdefaultargs") Mirror;
		%feature("autodoc", ":param A2:
	:type A2: gp_Ax2
	:rtype: None") Mirror;
		void Mirror (const gp_Ax2 & A2);

		/****************** Mirrored ******************/
		%feature("compactdefaultargs") Mirrored;
		%feature("autodoc", "* Performs the symmetrical transformation of an axis placement with respect to the point P which is the center of the symmetry. Warnings : The main direction of the axis placement is not changed. The 'XDirection' and the 'YDirection' are reversed. So the axis placement stay right handed.
	:param P:
	:type P: gp_Pnt
	:rtype: Standard_NODISCARD gp_Ax3") Mirrored;
		Standard_NODISCARD gp_Ax3 Mirrored (const gp_Pnt & P);

		/****************** Mirrored ******************/
		%feature("compactdefaultargs") Mirrored;
		%feature("autodoc", "* Performs the symmetrical transformation of an axis placement with respect to an axis placement which is the axis of the symmetry. The transformation is performed on the 'Location' point, on the 'XDirection' and 'YDirection'. The resulting main 'Direction' is the cross product between the 'XDirection' and the 'YDirection' after transformation.
	:param A1:
	:type A1: gp_Ax1
	:rtype: Standard_NODISCARD gp_Ax3") Mirrored;
		Standard_NODISCARD gp_Ax3 Mirrored (const gp_Ax1 & A1);

		/****************** Mirrored ******************/
		%feature("compactdefaultargs") Mirrored;
		%feature("autodoc", "* Performs the symmetrical transformation of an axis placement with respect to a plane. The axis placement <A2> locates the plane of the symmetry : (Location, XDirection, YDirection). The transformation is performed on the 'Location' point, on the 'XDirection' and 'YDirection'. The resulting main 'Direction' is the cross product between the 'XDirection' and the 'YDirection' after transformation.
	:param A2:
	:type A2: gp_Ax2
	:rtype: Standard_NODISCARD gp_Ax3") Mirrored;
		Standard_NODISCARD gp_Ax3 Mirrored (const gp_Ax2 & A2);

		/****************** Rotate ******************/
		%feature("compactdefaultargs") Rotate;
		%feature("autodoc", ":param A1:
	:type A1: gp_Ax1
	:param Ang:
	:type Ang: float
	:rtype: None") Rotate;
		void Rotate (const gp_Ax1 & A1,const Standard_Real Ang);

		/****************** Rotated ******************/
		%feature("compactdefaultargs") Rotated;
		%feature("autodoc", "* Rotates an axis placement. <A1> is the axis of the rotation . Ang is the angular value of the rotation in radians.
	:param A1:
	:type A1: gp_Ax1
	:param Ang:
	:type Ang: float
	:rtype: Standard_NODISCARD gp_Ax3") Rotated;
		Standard_NODISCARD gp_Ax3 Rotated (const gp_Ax1 & A1,const Standard_Real Ang);

		/****************** Scale ******************/
		%feature("compactdefaultargs") Scale;
		%feature("autodoc", ":param P:
	:type P: gp_Pnt
	:param S:
	:type S: float
	:rtype: None") Scale;
		void Scale (const gp_Pnt & P,const Standard_Real S);

		/****************** Scaled ******************/
		%feature("compactdefaultargs") Scaled;
		%feature("autodoc", "* Applies a scaling transformation on the axis placement. The 'Location' point of the axisplacement is modified. Warnings : If the scale <S> is negative : . the main direction of the axis placement is not changed. . The 'XDirection' and the 'YDirection' are reversed. So the axis placement stay right handed.
	:param P:
	:type P: gp_Pnt
	:param S:
	:type S: float
	:rtype: Standard_NODISCARD gp_Ax3") Scaled;
		Standard_NODISCARD gp_Ax3 Scaled (const gp_Pnt & P,const Standard_Real S);

		/****************** SetAxis ******************/
		%feature("compactdefaultargs") SetAxis;
		%feature("autodoc", "* Assigns the origin and 'main Direction' of the axis A1 to this coordinate system, then recomputes its 'X Direction' and 'Y Direction'. Note: - The new 'X Direction' is computed as follows: new 'X Direction' = V1 ^(previous 'X Direction' ^ V) where V is the 'Direction' of A1. - The orientation of this coordinate system (right-handed or left-handed) is not modified. Raises ConstructionError if the 'Direction' of <A1> and the 'XDirection' of <self> are parallel (same or opposite orientation) because it is impossible to calculate the new 'XDirection' and the new 'YDirection'.
	:param A1:
	:type A1: gp_Ax1
	:rtype: None") SetAxis;
		void SetAxis (const gp_Ax1 & A1);

		/****************** SetDirection ******************/
		%feature("compactdefaultargs") SetDirection;
		%feature("autodoc", "* Changes the main direction of this coordinate system, then recomputes its 'X Direction' and 'Y Direction'. Note: - The new 'X Direction' is computed as follows: new 'X Direction' = V ^ (previous 'X Direction' ^ V). - The orientation of this coordinate system (left- or right-handed) is not modified. Raises ConstructionError if <V< and the previous 'XDirection' are parallel because it is impossible to calculate the new 'XDirection' and the new 'YDirection'.
	:param V:
	:type V: gp_Dir
	:rtype: None") SetDirection;
		void SetDirection (const gp_Dir & V);

		/****************** SetLocation ******************/
		%feature("compactdefaultargs") SetLocation;
		%feature("autodoc", "* Changes the 'Location' point (origin) of <self>.
	:param P:
	:type P: gp_Pnt
	:rtype: None") SetLocation;
		void SetLocation (const gp_Pnt & P);

		/****************** SetXDirection ******************/
		%feature("compactdefaultargs") SetXDirection;
		%feature("autodoc", "* Changes the 'Xdirection' of <self>. The main direction 'Direction' is not modified, the 'Ydirection' is modified. If <Vx> is not normal to the main direction then <XDirection> is computed as follows XDirection = Direction ^ (Vx ^ Direction). Raises ConstructionError if <Vx> is parallel (same or opposite orientation) to the main direction of <self>
	:param Vx:
	:type Vx: gp_Dir
	:rtype: None") SetXDirection;
		void SetXDirection (const gp_Dir & Vx);

		/****************** SetYDirection ******************/
		%feature("compactdefaultargs") SetYDirection;
		%feature("autodoc", "* Changes the 'Ydirection' of <self>. The main direction is not modified but the 'Xdirection' is changed. If <Vy> is not normal to the main direction then 'YDirection' is computed as follows YDirection = Direction ^ (<Vy> ^ Direction). Raises ConstructionError if <Vy> is parallel to the main direction of <self>
	:param Vy:
	:type Vy: gp_Dir
	:rtype: None") SetYDirection;
		void SetYDirection (const gp_Dir & Vy);

		/****************** Transform ******************/
		%feature("compactdefaultargs") Transform;
		%feature("autodoc", ":param T:
	:type T: gp_Trsf
	:rtype: None") Transform;
		void Transform (const gp_Trsf & T);

		/****************** Transformed ******************/
		%feature("compactdefaultargs") Transformed;
		%feature("autodoc", "* Transforms an axis placement with a Trsf. The 'Location' point, the 'XDirection' and the 'YDirection' are transformed with T. The resulting main 'Direction' of <self> is the cross product between the 'XDirection' and the 'YDirection' after transformation.
	:param T:
	:type T: gp_Trsf
	:rtype: Standard_NODISCARD gp_Ax3") Transformed;
		Standard_NODISCARD gp_Ax3 Transformed (const gp_Trsf & T);

		/****************** Translate ******************/
		%feature("compactdefaultargs") Translate;
		%feature("autodoc", ":param V:
	:type V: gp_Vec
	:rtype: None") Translate;
		void Translate (const gp_Vec & V);

		/****************** Translate ******************/
		%feature("compactdefaultargs") Translate;
		%feature("autodoc", ":param P1:
	:type P1: gp_Pnt
	:param P2:
	:type P2: gp_Pnt
	:rtype: None") Translate;
		void Translate (const gp_Pnt & P1,const gp_Pnt & P2);

		/****************** Translated ******************/
		%feature("compactdefaultargs") Translated;
		%feature("autodoc", "* Translates an axis plaxement in the direction of the vector <V>. The magnitude of the translation is the vector's magnitude.
	:param V:
	:type V: gp_Vec
	:rtype: Standard_NODISCARD gp_Ax3") Translated;
		Standard_NODISCARD gp_Ax3 Translated (const gp_Vec & V);

		/****************** Translated ******************/
		%feature("compactdefaultargs") Translated;
		%feature("autodoc", "* Translates an axis placement from the point <P1> to the point <P2>.
	:param P1:
	:type P1: gp_Pnt
	:param P2:
	:type P2: gp_Pnt
	:rtype: Standard_NODISCARD gp_Ax3") Translated;
		Standard_NODISCARD gp_Ax3 Translated (const gp_Pnt & P1,const gp_Pnt & P2);

		/****************** XDirection ******************/
		%feature("compactdefaultargs") XDirection;
		%feature("autodoc", "* Returns the 'XDirection' of <self>.
	:rtype: gp_Dir") XDirection;
		const gp_Dir  XDirection ();

		/****************** XReverse ******************/
		%feature("compactdefaultargs") XReverse;
		%feature("autodoc", "* Reverses the X direction of <self>.
	:rtype: None") XReverse;
		void XReverse ();

		/****************** YDirection ******************/
		%feature("compactdefaultargs") YDirection;
		%feature("autodoc", "* Returns the 'YDirection' of <self>.
	:rtype: gp_Dir") YDirection;
		const gp_Dir  YDirection ();

		/****************** YReverse ******************/
		%feature("compactdefaultargs") YReverse;
		%feature("autodoc", "* Reverses the Y direction of <self>.
	:rtype: None") YReverse;
		void YReverse ();

		/****************** ZReverse ******************/
		%feature("compactdefaultargs") ZReverse;
		%feature("autodoc", "* Reverses the Z direction of <self>.
	:rtype: None") ZReverse;
		void ZReverse ();

		/****************** gp_Ax3 ******************/
		%feature("compactdefaultargs") gp_Ax3;
		%feature("autodoc", "* Creates an object corresponding to the reference coordinate system (OXYZ).
	:rtype: None") gp_Ax3;
		 gp_Ax3 ();

		/****************** gp_Ax3 ******************/
		%feature("compactdefaultargs") gp_Ax3;
		%feature("autodoc", "* Creates a coordinate system from a right-handed coordinate system.
	:param A:
	:type A: gp_Ax2
	:rtype: None") gp_Ax3;
		 gp_Ax3 (const gp_Ax2 & A);

		/****************** gp_Ax3 ******************/
		%feature("compactdefaultargs") gp_Ax3;
		%feature("autodoc", "* Creates a right handed axis placement with the 'Location' point P and two directions, N gives the 'Direction' and Vx gives the 'XDirection'. Raises ConstructionError if N and Vx are parallel (same or opposite orientation).
	:param P:
	:type P: gp_Pnt
	:param N:
	:type N: gp_Dir
	:param Vx:
	:type Vx: gp_Dir
	:rtype: None") gp_Ax3;
		 gp_Ax3 (const gp_Pnt & P,const gp_Dir & N,const gp_Dir & Vx);

		/****************** gp_Ax3 ******************/
		%feature("compactdefaultargs") gp_Ax3;
		%feature("autodoc", "* Creates an axis placement with the 'Location' point <P> and the normal direction <V>.
	:param P:
	:type P: gp_Pnt
	:param V:
	:type V: gp_Dir
	:rtype: None") gp_Ax3;
		 gp_Ax3 (const gp_Pnt & P,const gp_Dir & V);

};


%extend gp_Ax3 {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************
* class gp_Circ *
****************/
%nodefaultctor gp_Circ;
class gp_Circ {
	public:
		/****************** Area ******************/
		%feature("compactdefaultargs") Area;
		%feature("autodoc", "* Computes the area of the circle.
	:rtype: float") Area;
		Standard_Real Area ();

		/****************** Axis ******************/
		%feature("compactdefaultargs") Axis;
		%feature("autodoc", "* Returns the main axis of the circle. It is the axis perpendicular to the plane of the circle, passing through the 'Location' point (center) of the circle.
	:rtype: gp_Ax1") Axis;
		const gp_Ax1  Axis ();

		/****************** Contains ******************/
		%feature("compactdefaultargs") Contains;
		%feature("autodoc", "* Returns True if the point P is on the circumference. The distance between <self> and <P> must be lower or equal to LinearTolerance.
	:param P:
	:type P: gp_Pnt
	:param LinearTolerance:
	:type LinearTolerance: float
	:rtype: bool") Contains;
		Standard_Boolean Contains (const gp_Pnt & P,const Standard_Real LinearTolerance);

		/****************** Distance ******************/
		%feature("compactdefaultargs") Distance;
		%feature("autodoc", "* Computes the minimum of distance between the point P and any point on the circumference of the circle.
	:param P:
	:type P: gp_Pnt
	:rtype: float") Distance;
		Standard_Real Distance (const gp_Pnt & P);

		/****************** Length ******************/
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "* Computes the circumference of the circle.
	:rtype: float") Length;
		Standard_Real Length ();

		/****************** Location ******************/
		%feature("compactdefaultargs") Location;
		%feature("autodoc", "* Returns the center of the circle. It is the 'Location' point of the local coordinate system of the circle
	:rtype: gp_Pnt") Location;
		const gp_Pnt  Location ();

		/****************** Mirror ******************/
		%feature("compactdefaultargs") Mirror;
		%feature("autodoc", ":param P:
	:type P: gp_Pnt
	:rtype: None") Mirror;
		void Mirror (const gp_Pnt & P);

		/****************** Mirror ******************/
		%feature("compactdefaultargs") Mirror;
		%feature("autodoc", ":param A1:
	:type A1: gp_Ax1
	:rtype: None") Mirror;
		void Mirror (const gp_Ax1 & A1);

		/****************** Mirror ******************/
		%feature("compactdefaultargs") Mirror;
		%feature("autodoc", ":param A2:
	:type A2: gp_Ax2
	:rtype: None") Mirror;
		void Mirror (const gp_Ax2 & A2);

		/****************** Mirrored ******************/
		%feature("compactdefaultargs") Mirrored;
		%feature("autodoc", "* Performs the symmetrical transformation of a circle with respect to the point P which is the center of the symmetry.
	:param P:
	:type P: gp_Pnt
	:rtype: Standard_NODISCARD gp_Circ") Mirrored;
		Standard_NODISCARD gp_Circ Mirrored (const gp_Pnt & P);

		/****************** Mirrored ******************/
		%feature("compactdefaultargs") Mirrored;
		%feature("autodoc", "* Performs the symmetrical transformation of a circle with respect to an axis placement which is the axis of the symmetry.
	:param A1:
	:type A1: gp_Ax1
	:rtype: Standard_NODISCARD gp_Circ") Mirrored;
		Standard_NODISCARD gp_Circ Mirrored (const gp_Ax1 & A1);

		/****************** Mirrored ******************/
		%feature("compactdefaultargs") Mirrored;
		%feature("autodoc", "* Performs the symmetrical transformation of a circle with respect to a plane. The axis placement A2 locates the plane of the of the symmetry : (Location, XDirection, YDirection).
	:param A2:
	:type A2: gp_Ax2
	:rtype: Standard_NODISCARD gp_Circ") Mirrored;
		Standard_NODISCARD gp_Circ Mirrored (const gp_Ax2 & A2);

		/****************** Position ******************/
		%feature("compactdefaultargs") Position;
		%feature("autodoc", "* Returns the position of the circle. It is the local coordinate system of the circle.
	:rtype: gp_Ax2") Position;
		const gp_Ax2  Position ();

		/****************** Radius ******************/
		%feature("compactdefaultargs") Radius;
		%feature("autodoc", "* Returns the radius of this circle.
	:rtype: float") Radius;
		Standard_Real Radius ();

		/****************** Rotate ******************/
		%feature("compactdefaultargs") Rotate;
		%feature("autodoc", ":param A1:
	:type A1: gp_Ax1
	:param Ang:
	:type Ang: float
	:rtype: None") Rotate;
		void Rotate (const gp_Ax1 & A1,const Standard_Real Ang);

		/****************** Rotated ******************/
		%feature("compactdefaultargs") Rotated;
		%feature("autodoc", "* Rotates a circle. A1 is the axis of the rotation. Ang is the angular value of the rotation in radians.
	:param A1:
	:type A1: gp_Ax1
	:param Ang:
	:type Ang: float
	:rtype: Standard_NODISCARD gp_Circ") Rotated;
		Standard_NODISCARD gp_Circ Rotated (const gp_Ax1 & A1,const Standard_Real Ang);

		/****************** Scale ******************/
		%feature("compactdefaultargs") Scale;
		%feature("autodoc", ":param P:
	:type P: gp_Pnt
	:param S:
	:type S: float
	:rtype: None") Scale;
		void Scale (const gp_Pnt & P,const Standard_Real S);

		/****************** Scaled ******************/
		%feature("compactdefaultargs") Scaled;
		%feature("autodoc", "* Scales a circle. S is the scaling value. Warnings : If S is negative the radius stay positive but the 'XAxis' and the 'YAxis' are reversed as for an ellipse.
	:param P:
	:type P: gp_Pnt
	:param S:
	:type S: float
	:rtype: Standard_NODISCARD gp_Circ") Scaled;
		Standard_NODISCARD gp_Circ Scaled (const gp_Pnt & P,const Standard_Real S);

		/****************** SetAxis ******************/
		%feature("compactdefaultargs") SetAxis;
		%feature("autodoc", "* Changes the main axis of the circle. It is the axis perpendicular to the plane of the circle. Raises ConstructionError if the direction of A1 is parallel to the 'XAxis' of the circle.
	:param A1:
	:type A1: gp_Ax1
	:rtype: None") SetAxis;
		void SetAxis (const gp_Ax1 & A1);

		/****************** SetLocation ******************/
		%feature("compactdefaultargs") SetLocation;
		%feature("autodoc", "* Changes the 'Location' point (center) of the circle.
	:param P:
	:type P: gp_Pnt
	:rtype: None") SetLocation;
		void SetLocation (const gp_Pnt & P);

		/****************** SetPosition ******************/
		%feature("compactdefaultargs") SetPosition;
		%feature("autodoc", "* Changes the position of the circle.
	:param A2:
	:type A2: gp_Ax2
	:rtype: None") SetPosition;
		void SetPosition (const gp_Ax2 & A2);

		/****************** SetRadius ******************/
		%feature("compactdefaultargs") SetRadius;
		%feature("autodoc", "* Modifies the radius of this circle. Warning. This class does not prevent the creation of a circle where Radius is null. Exceptions Standard_ConstructionError if Radius is negative.
	:param Radius:
	:type Radius: float
	:rtype: None") SetRadius;
		void SetRadius (const Standard_Real Radius);

		/****************** SquareDistance ******************/
		%feature("compactdefaultargs") SquareDistance;
		%feature("autodoc", "* Computes the square distance between <self> and the point P.
	:param P:
	:type P: gp_Pnt
	:rtype: float") SquareDistance;
		Standard_Real SquareDistance (const gp_Pnt & P);

		/****************** Transform ******************/
		%feature("compactdefaultargs") Transform;
		%feature("autodoc", ":param T:
	:type T: gp_Trsf
	:rtype: None") Transform;
		void Transform (const gp_Trsf & T);

		/****************** Transformed ******************/
		%feature("compactdefaultargs") Transformed;
		%feature("autodoc", "* Transforms a circle with the transformation T from class Trsf.
	:param T:
	:type T: gp_Trsf
	:rtype: Standard_NODISCARD gp_Circ") Transformed;
		Standard_NODISCARD gp_Circ Transformed (const gp_Trsf & T);

		/****************** Translate ******************/
		%feature("compactdefaultargs") Translate;
		%feature("autodoc", ":param V:
	:type V: gp_Vec
	:rtype: None") Translate;
		void Translate (const gp_Vec & V);

		/****************** Translate ******************/
		%feature("compactdefaultargs") Translate;
		%feature("autodoc", ":param P1:
	:type P1: gp_Pnt
	:param P2:
	:type P2: gp_Pnt
	:rtype: None") Translate;
		void Translate (const gp_Pnt & P1,const gp_Pnt & P2);

		/****************** Translated ******************/
		%feature("compactdefaultargs") Translated;
		%feature("autodoc", "* Translates a circle in the direction of the vector V. The magnitude of the translation is the vector's magnitude.
	:param V:
	:type V: gp_Vec
	:rtype: Standard_NODISCARD gp_Circ") Translated;
		Standard_NODISCARD gp_Circ Translated (const gp_Vec & V);

		/****************** Translated ******************/
		%feature("compactdefaultargs") Translated;
		%feature("autodoc", "* Translates a circle from the point P1 to the point P2.
	:param P1:
	:type P1: gp_Pnt
	:param P2:
	:type P2: gp_Pnt
	:rtype: Standard_NODISCARD gp_Circ") Translated;
		Standard_NODISCARD gp_Circ Translated (const gp_Pnt & P1,const gp_Pnt & P2);

		/****************** XAxis ******************/
		%feature("compactdefaultargs") XAxis;
		%feature("autodoc", "* Returns the 'XAxis' of the circle. This axis is perpendicular to the axis of the conic. This axis and the 'Yaxis' define the plane of the conic.
	:rtype: gp_Ax1") XAxis;
		gp_Ax1 XAxis ();

		/****************** YAxis ******************/
		%feature("compactdefaultargs") YAxis;
		%feature("autodoc", "* Returns the 'YAxis' of the circle. This axis and the 'Xaxis' define the plane of the conic. The 'YAxis' is perpendicular to the 'Xaxis'.
	:rtype: gp_Ax1") YAxis;
		gp_Ax1 YAxis ();

		/****************** gp_Circ ******************/
		%feature("compactdefaultargs") gp_Circ;
		%feature("autodoc", "* Creates an indefinite circle.
	:rtype: None") gp_Circ;
		 gp_Circ ();

		/****************** gp_Circ ******************/
		%feature("compactdefaultargs") gp_Circ;
		%feature("autodoc", "* A2 locates the circle and gives its orientation in 3D space. Warnings : It is not forbidden to create a circle with Radius = 0.0 Raises ConstructionError if Radius < 0.0
	:param A2:
	:type A2: gp_Ax2
	:param Radius:
	:type Radius: float
	:rtype: None") gp_Circ;
		 gp_Circ (const gp_Ax2 & A2,const Standard_Real Radius);

};


%extend gp_Circ {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************
* class gp_Circ2d *
******************/
%nodefaultctor gp_Circ2d;
class gp_Circ2d {
	public:
		/****************** Area ******************/
		%feature("compactdefaultargs") Area;
		%feature("autodoc", "* Computes the area of the circle.
	:rtype: float") Area;
		Standard_Real Area ();

		/****************** Axis ******************/
		%feature("compactdefaultargs") Axis;
		%feature("autodoc", "* returns the position of the circle.
	:rtype: gp_Ax22d") Axis;
		const gp_Ax22d  Axis ();

		/****************** Coefficients ******************/
		%feature("compactdefaultargs") Coefficients;
		%feature("autodoc", "* Returns the normalized coefficients from the implicit equation of the circle : A * (X**2) + B * (Y**2) + 2*C*(X*Y) + 2*D*X + 2*E*Y + F = 0.0
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
	:rtype: None") Coefficients;
		void Coefficients (Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);

		/****************** Contains ******************/
		%feature("compactdefaultargs") Contains;
		%feature("autodoc", "* Does <self> contain P ? Returns True if the distance between P and any point on the circumference of the circle is lower of equal to <LinearTolerance>.
	:param P:
	:type P: gp_Pnt2d
	:param LinearTolerance:
	:type LinearTolerance: float
	:rtype: bool") Contains;
		Standard_Boolean Contains (const gp_Pnt2d & P,const Standard_Real LinearTolerance);

		/****************** Distance ******************/
		%feature("compactdefaultargs") Distance;
		%feature("autodoc", "* Computes the minimum of distance between the point P and any point on the circumference of the circle.
	:param P:
	:type P: gp_Pnt2d
	:rtype: float") Distance;
		Standard_Real Distance (const gp_Pnt2d & P);

		/****************** IsDirect ******************/
		%feature("compactdefaultargs") IsDirect;
		%feature("autodoc", "* Returns true if the local coordinate system is direct and false in the other case.
	:rtype: bool") IsDirect;
		Standard_Boolean IsDirect ();

		/****************** Length ******************/
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "* computes the circumference of the circle.
	:rtype: float") Length;
		Standard_Real Length ();

		/****************** Location ******************/
		%feature("compactdefaultargs") Location;
		%feature("autodoc", "* Returns the location point (center) of the circle.
	:rtype: gp_Pnt2d") Location;
		const gp_Pnt2d  Location ();

		/****************** Mirror ******************/
		%feature("compactdefaultargs") Mirror;
		%feature("autodoc", ":param P:
	:type P: gp_Pnt2d
	:rtype: None") Mirror;
		void Mirror (const gp_Pnt2d & P);

		/****************** Mirror ******************/
		%feature("compactdefaultargs") Mirror;
		%feature("autodoc", ":param A:
	:type A: gp_Ax2d
	:rtype: None") Mirror;
		void Mirror (const gp_Ax2d & A);

		/****************** Mirrored ******************/
		%feature("compactdefaultargs") Mirrored;
		%feature("autodoc", "* Performs the symmetrical transformation of a circle with respect to the point P which is the center of the symmetry
	:param P:
	:type P: gp_Pnt2d
	:rtype: Standard_NODISCARD gp_Circ2d") Mirrored;
		Standard_NODISCARD gp_Circ2d Mirrored (const gp_Pnt2d & P);

		/****************** Mirrored ******************/
		%feature("compactdefaultargs") Mirrored;
		%feature("autodoc", "* Performs the symmetrical transformation of a circle with respect to an axis placement which is the axis of the symmetry.
	:param A:
	:type A: gp_Ax2d
	:rtype: Standard_NODISCARD gp_Circ2d") Mirrored;
		Standard_NODISCARD gp_Circ2d Mirrored (const gp_Ax2d & A);

		/****************** Position ******************/
		%feature("compactdefaultargs") Position;
		%feature("autodoc", "* returns the position of the circle. Idem Axis(me).
	:rtype: gp_Ax22d") Position;
		const gp_Ax22d  Position ();

		/****************** Radius ******************/
		%feature("compactdefaultargs") Radius;
		%feature("autodoc", "* Returns the radius value of the circle.
	:rtype: float") Radius;
		Standard_Real Radius ();

		/****************** Reverse ******************/
		%feature("compactdefaultargs") Reverse;
		%feature("autodoc", "* Reverses the orientation of the local coordinate system of this circle (the 'Y Direction' is reversed) and therefore changes the implicit orientation of this circle. Reverse assigns the result to this circle,
	:rtype: None") Reverse;
		void Reverse ();

		/****************** Reversed ******************/
		%feature("compactdefaultargs") Reversed;
		%feature("autodoc", "* Reverses the orientation of the local coordinate system of this circle (the 'Y Direction' is reversed) and therefore changes the implicit orientation of this circle. Reversed creates a new circle.
	:rtype: Standard_NODISCARD gp_Circ2d") Reversed;
		Standard_NODISCARD gp_Circ2d Reversed ();

		/****************** Rotate ******************/
		%feature("compactdefaultargs") Rotate;
		%feature("autodoc", ":param P:
	:type P: gp_Pnt2d
	:param Ang:
	:type Ang: float
	:rtype: None") Rotate;
		void Rotate (const gp_Pnt2d & P,const Standard_Real Ang);

		/****************** Rotated ******************/
		%feature("compactdefaultargs") Rotated;
		%feature("autodoc", "* Rotates a circle. P is the center of the rotation. Ang is the angular value of the rotation in radians.
	:param P:
	:type P: gp_Pnt2d
	:param Ang:
	:type Ang: float
	:rtype: Standard_NODISCARD gp_Circ2d") Rotated;
		Standard_NODISCARD gp_Circ2d Rotated (const gp_Pnt2d & P,const Standard_Real Ang);

		/****************** Scale ******************/
		%feature("compactdefaultargs") Scale;
		%feature("autodoc", ":param P:
	:type P: gp_Pnt2d
	:param S:
	:type S: float
	:rtype: None") Scale;
		void Scale (const gp_Pnt2d & P,const Standard_Real S);

		/****************** Scaled ******************/
		%feature("compactdefaultargs") Scaled;
		%feature("autodoc", "* Scales a circle. S is the scaling value. Warnings : If S is negative the radius stay positive but the 'XAxis' and the 'YAxis' are reversed as for an ellipse.
	:param P:
	:type P: gp_Pnt2d
	:param S:
	:type S: float
	:rtype: Standard_NODISCARD gp_Circ2d") Scaled;
		Standard_NODISCARD gp_Circ2d Scaled (const gp_Pnt2d & P,const Standard_Real S);

		/****************** SetAxis ******************/
		%feature("compactdefaultargs") SetAxis;
		%feature("autodoc", "* Changes the X axis of the circle.
	:param A:
	:type A: gp_Ax22d
	:rtype: None") SetAxis;
		void SetAxis (const gp_Ax22d & A);

		/****************** SetLocation ******************/
		%feature("compactdefaultargs") SetLocation;
		%feature("autodoc", "* Changes the location point (center) of the circle.
	:param P:
	:type P: gp_Pnt2d
	:rtype: None") SetLocation;
		void SetLocation (const gp_Pnt2d & P);

		/****************** SetRadius ******************/
		%feature("compactdefaultargs") SetRadius;
		%feature("autodoc", "* Modifies the radius of this circle. This class does not prevent the creation of a circle where Radius is null. Exceptions Standard_ConstructionError if Radius is negative.
	:param Radius:
	:type Radius: float
	:rtype: None") SetRadius;
		void SetRadius (const Standard_Real Radius);

		/****************** SetXAxis ******************/
		%feature("compactdefaultargs") SetXAxis;
		%feature("autodoc", "* Changes the X axis of the circle.
	:param A:
	:type A: gp_Ax2d
	:rtype: None") SetXAxis;
		void SetXAxis (const gp_Ax2d & A);

		/****************** SetYAxis ******************/
		%feature("compactdefaultargs") SetYAxis;
		%feature("autodoc", "* Changes the Y axis of the circle.
	:param A:
	:type A: gp_Ax2d
	:rtype: None") SetYAxis;
		void SetYAxis (const gp_Ax2d & A);

		/****************** SquareDistance ******************/
		%feature("compactdefaultargs") SquareDistance;
		%feature("autodoc", "* Computes the square distance between <self> and the point P.
	:param P:
	:type P: gp_Pnt2d
	:rtype: float") SquareDistance;
		Standard_Real SquareDistance (const gp_Pnt2d & P);

		/****************** Transform ******************/
		%feature("compactdefaultargs") Transform;
		%feature("autodoc", ":param T:
	:type T: gp_Trsf2d
	:rtype: None") Transform;
		void Transform (const gp_Trsf2d & T);

		/****************** Transformed ******************/
		%feature("compactdefaultargs") Transformed;
		%feature("autodoc", "* Transforms a circle with the transformation T from class Trsf2d.
	:param T:
	:type T: gp_Trsf2d
	:rtype: Standard_NODISCARD gp_Circ2d") Transformed;
		Standard_NODISCARD gp_Circ2d Transformed (const gp_Trsf2d & T);

		/****************** Translate ******************/
		%feature("compactdefaultargs") Translate;
		%feature("autodoc", ":param V:
	:type V: gp_Vec2d
	:rtype: None") Translate;
		void Translate (const gp_Vec2d & V);

		/****************** Translate ******************/
		%feature("compactdefaultargs") Translate;
		%feature("autodoc", ":param P1:
	:type P1: gp_Pnt2d
	:param P2:
	:type P2: gp_Pnt2d
	:rtype: None") Translate;
		void Translate (const gp_Pnt2d & P1,const gp_Pnt2d & P2);

		/****************** Translated ******************/
		%feature("compactdefaultargs") Translated;
		%feature("autodoc", "* Translates a circle in the direction of the vector V. The magnitude of the translation is the vector's magnitude.
	:param V:
	:type V: gp_Vec2d
	:rtype: Standard_NODISCARD gp_Circ2d") Translated;
		Standard_NODISCARD gp_Circ2d Translated (const gp_Vec2d & V);

		/****************** Translated ******************/
		%feature("compactdefaultargs") Translated;
		%feature("autodoc", "* Translates a circle from the point P1 to the point P2.
	:param P1:
	:type P1: gp_Pnt2d
	:param P2:
	:type P2: gp_Pnt2d
	:rtype: Standard_NODISCARD gp_Circ2d") Translated;
		Standard_NODISCARD gp_Circ2d Translated (const gp_Pnt2d & P1,const gp_Pnt2d & P2);

		/****************** XAxis ******************/
		%feature("compactdefaultargs") XAxis;
		%feature("autodoc", "* returns the X axis of the circle.
	:rtype: gp_Ax2d") XAxis;
		gp_Ax2d XAxis ();

		/****************** YAxis ******************/
		%feature("compactdefaultargs") YAxis;
		%feature("autodoc", "* Returns the Y axis of the circle. Reverses the direction of the circle.
	:rtype: gp_Ax2d") YAxis;
		gp_Ax2d YAxis ();

		/****************** gp_Circ2d ******************/
		%feature("compactdefaultargs") gp_Circ2d;
		%feature("autodoc", "* creates an indefinite circle.
	:rtype: None") gp_Circ2d;
		 gp_Circ2d ();

		/****************** gp_Circ2d ******************/
		%feature("compactdefaultargs") gp_Circ2d;
		%feature("autodoc", "* The location point of XAxis is the center of the circle. Warnings : It is not forbidden to create a circle with Radius = 0.0 Raises ConstructionError if Radius < 0.0. Raised if Radius < 0.0.
	:param XAxis:
	:type XAxis: gp_Ax2d
	:param Radius:
	:type Radius: float
	:param Sense: default value is Standard_True
	:type Sense: bool
	:rtype: None") gp_Circ2d;
		 gp_Circ2d (const gp_Ax2d & XAxis,const Standard_Real Radius,const Standard_Boolean Sense = Standard_True);

		/****************** gp_Circ2d ******************/
		%feature("compactdefaultargs") gp_Circ2d;
		%feature("autodoc", "* Axis defines the Xaxis and Yaxis of the circle which defines the origin and the sense of parametrization. The location point of Axis is the center of the circle. Warnings : It is not forbidden to create a circle with Radius = 0.0 Raises ConstructionError if Radius < 0.0. Raised if Radius < 0.0.
	:param Axis:
	:type Axis: gp_Ax22d
	:param Radius:
	:type Radius: float
	:rtype: None") gp_Circ2d;
		 gp_Circ2d (const gp_Ax22d & Axis,const Standard_Real Radius);

};


%extend gp_Circ2d {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************
* class gp_Cone *
****************/
%nodefaultctor gp_Cone;
class gp_Cone {
	public:
		/****************** Apex ******************/
		%feature("compactdefaultargs") Apex;
		%feature("autodoc", "* Computes the cone's top. The Apex of the cone is on the negative side of the symmetry axis of the cone.
	:rtype: gp_Pnt") Apex;
		gp_Pnt Apex ();

		/****************** Axis ******************/
		%feature("compactdefaultargs") Axis;
		%feature("autodoc", "* returns the symmetry axis of the cone.
	:rtype: gp_Ax1") Axis;
		const gp_Ax1  Axis ();

		/****************** Coefficients ******************/
		%feature("compactdefaultargs") Coefficients;
		%feature("autodoc", "* Computes the coefficients of the implicit equation of the quadric in the absolute cartesian coordinates system : A1.X**2 + A2.Y**2 + A3.Z**2 + 2.(B1.X.Y + B2.X.Z + B3.Y.Z) + 2.(C1.X + C2.Y + C3.Z) + D = 0.0
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
	:rtype: None") Coefficients;
		void Coefficients (Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);

		/****************** Direct ******************/
		%feature("compactdefaultargs") Direct;
		%feature("autodoc", "* Returns true if the local coordinate system of this cone is right-handed.
	:rtype: bool") Direct;
		Standard_Boolean Direct ();

		/****************** Location ******************/
		%feature("compactdefaultargs") Location;
		%feature("autodoc", "* returns the 'Location' point of the cone.
	:rtype: gp_Pnt") Location;
		const gp_Pnt  Location ();

		/****************** Mirror ******************/
		%feature("compactdefaultargs") Mirror;
		%feature("autodoc", ":param P:
	:type P: gp_Pnt
	:rtype: None") Mirror;
		void Mirror (const gp_Pnt & P);

		/****************** Mirror ******************/
		%feature("compactdefaultargs") Mirror;
		%feature("autodoc", ":param A1:
	:type A1: gp_Ax1
	:rtype: None") Mirror;
		void Mirror (const gp_Ax1 & A1);

		/****************** Mirror ******************/
		%feature("compactdefaultargs") Mirror;
		%feature("autodoc", ":param A2:
	:type A2: gp_Ax2
	:rtype: None") Mirror;
		void Mirror (const gp_Ax2 & A2);

		/****************** Mirrored ******************/
		%feature("compactdefaultargs") Mirrored;
		%feature("autodoc", "* Performs the symmetrical transformation of a cone with respect to the point P which is the center of the symmetry.
	:param P:
	:type P: gp_Pnt
	:rtype: Standard_NODISCARD gp_Cone") Mirrored;
		Standard_NODISCARD gp_Cone Mirrored (const gp_Pnt & P);

		/****************** Mirrored ******************/
		%feature("compactdefaultargs") Mirrored;
		%feature("autodoc", "* Performs the symmetrical transformation of a cone with respect to an axis placement which is the axis of the symmetry.
	:param A1:
	:type A1: gp_Ax1
	:rtype: Standard_NODISCARD gp_Cone") Mirrored;
		Standard_NODISCARD gp_Cone Mirrored (const gp_Ax1 & A1);

		/****************** Mirrored ******************/
		%feature("compactdefaultargs") Mirrored;
		%feature("autodoc", "* Performs the symmetrical transformation of a cone with respect to a plane. The axis placement A2 locates the plane of the of the symmetry : (Location, XDirection, YDirection).
	:param A2:
	:type A2: gp_Ax2
	:rtype: Standard_NODISCARD gp_Cone") Mirrored;
		Standard_NODISCARD gp_Cone Mirrored (const gp_Ax2 & A2);

		/****************** Position ******************/
		%feature("compactdefaultargs") Position;
		%feature("autodoc", "* Returns the local coordinates system of the cone.
	:rtype: gp_Ax3") Position;
		const gp_Ax3  Position ();

		/****************** RefRadius ******************/
		%feature("compactdefaultargs") RefRadius;
		%feature("autodoc", "* Returns the radius of the cone in the reference plane.
	:rtype: float") RefRadius;
		Standard_Real RefRadius ();

		/****************** Rotate ******************/
		%feature("compactdefaultargs") Rotate;
		%feature("autodoc", ":param A1:
	:type A1: gp_Ax1
	:param Ang:
	:type Ang: float
	:rtype: None") Rotate;
		void Rotate (const gp_Ax1 & A1,const Standard_Real Ang);

		/****************** Rotated ******************/
		%feature("compactdefaultargs") Rotated;
		%feature("autodoc", "* Rotates a cone. A1 is the axis of the rotation. Ang is the angular value of the rotation in radians.
	:param A1:
	:type A1: gp_Ax1
	:param Ang:
	:type Ang: float
	:rtype: Standard_NODISCARD gp_Cone") Rotated;
		Standard_NODISCARD gp_Cone Rotated (const gp_Ax1 & A1,const Standard_Real Ang);

		/****************** Scale ******************/
		%feature("compactdefaultargs") Scale;
		%feature("autodoc", ":param P:
	:type P: gp_Pnt
	:param S:
	:type S: float
	:rtype: None") Scale;
		void Scale (const gp_Pnt & P,const Standard_Real S);

		/****************** Scaled ******************/
		%feature("compactdefaultargs") Scaled;
		%feature("autodoc", "* Scales a cone. S is the scaling value. The absolute value of S is used to scale the cone
	:param P:
	:type P: gp_Pnt
	:param S:
	:type S: float
	:rtype: Standard_NODISCARD gp_Cone") Scaled;
		Standard_NODISCARD gp_Cone Scaled (const gp_Pnt & P,const Standard_Real S);

		/****************** SemiAngle ******************/
		%feature("compactdefaultargs") SemiAngle;
		%feature("autodoc", "* Returns the half-angle at the apex of this cone. Attention! Semi-angle can be negative.
	:rtype: float") SemiAngle;
		Standard_Real SemiAngle ();

		/****************** SetAxis ******************/
		%feature("compactdefaultargs") SetAxis;
		%feature("autodoc", "* Changes the symmetry axis of the cone. Raises ConstructionError the direction of A1 is parallel to the 'XDirection' of the coordinate system of the cone.
	:param A1:
	:type A1: gp_Ax1
	:rtype: None") SetAxis;
		void SetAxis (const gp_Ax1 & A1);

		/****************** SetLocation ******************/
		%feature("compactdefaultargs") SetLocation;
		%feature("autodoc", "* Changes the location of the cone.
	:param Loc:
	:type Loc: gp_Pnt
	:rtype: None") SetLocation;
		void SetLocation (const gp_Pnt & Loc);

		/****************** SetPosition ******************/
		%feature("compactdefaultargs") SetPosition;
		%feature("autodoc", "* Changes the local coordinate system of the cone. This coordinate system defines the reference plane of the cone.
	:param A3:
	:type A3: gp_Ax3
	:rtype: None") SetPosition;
		void SetPosition (const gp_Ax3 & A3);

		/****************** SetRadius ******************/
		%feature("compactdefaultargs") SetRadius;
		%feature("autodoc", "* Changes the radius of the cone in the reference plane of the cone. Raised if R < 0.0
	:param R:
	:type R: float
	:rtype: None") SetRadius;
		void SetRadius (const Standard_Real R);

		/****************** SetSemiAngle ******************/
		%feature("compactdefaultargs") SetSemiAngle;
		%feature("autodoc", "* Changes the semi-angle of the cone. Semi-angle can be negative. Its absolute value Abs(Ang) is in range ]0,PI/2[. Raises ConstructionError if Abs(Ang) < Resolution from gp or Abs(Ang) >= PI/2 - Resolution
	:param Ang:
	:type Ang: float
	:rtype: None") SetSemiAngle;
		void SetSemiAngle (const Standard_Real Ang);

		/****************** Transform ******************/
		%feature("compactdefaultargs") Transform;
		%feature("autodoc", ":param T:
	:type T: gp_Trsf
	:rtype: None") Transform;
		void Transform (const gp_Trsf & T);

		/****************** Transformed ******************/
		%feature("compactdefaultargs") Transformed;
		%feature("autodoc", "* Transforms a cone with the transformation T from class Trsf.
	:param T:
	:type T: gp_Trsf
	:rtype: Standard_NODISCARD gp_Cone") Transformed;
		Standard_NODISCARD gp_Cone Transformed (const gp_Trsf & T);

		/****************** Translate ******************/
		%feature("compactdefaultargs") Translate;
		%feature("autodoc", ":param V:
	:type V: gp_Vec
	:rtype: None") Translate;
		void Translate (const gp_Vec & V);

		/****************** Translate ******************/
		%feature("compactdefaultargs") Translate;
		%feature("autodoc", ":param P1:
	:type P1: gp_Pnt
	:param P2:
	:type P2: gp_Pnt
	:rtype: None") Translate;
		void Translate (const gp_Pnt & P1,const gp_Pnt & P2);

		/****************** Translated ******************/
		%feature("compactdefaultargs") Translated;
		%feature("autodoc", "* Translates a cone in the direction of the vector V. The magnitude of the translation is the vector's magnitude.
	:param V:
	:type V: gp_Vec
	:rtype: Standard_NODISCARD gp_Cone") Translated;
		Standard_NODISCARD gp_Cone Translated (const gp_Vec & V);

		/****************** Translated ******************/
		%feature("compactdefaultargs") Translated;
		%feature("autodoc", "* Translates a cone from the point P1 to the point P2.
	:param P1:
	:type P1: gp_Pnt
	:param P2:
	:type P2: gp_Pnt
	:rtype: Standard_NODISCARD gp_Cone") Translated;
		Standard_NODISCARD gp_Cone Translated (const gp_Pnt & P1,const gp_Pnt & P2);

		/****************** UReverse ******************/
		%feature("compactdefaultargs") UReverse;
		%feature("autodoc", "* Reverses the U parametrization of the cone reversing the YAxis.
	:rtype: None") UReverse;
		void UReverse ();

		/****************** VReverse ******************/
		%feature("compactdefaultargs") VReverse;
		%feature("autodoc", "* Reverses the V parametrization of the cone reversing the ZAxis.
	:rtype: None") VReverse;
		void VReverse ();

		/****************** XAxis ******************/
		%feature("compactdefaultargs") XAxis;
		%feature("autodoc", "* Returns the XAxis of the reference plane.
	:rtype: gp_Ax1") XAxis;
		gp_Ax1 XAxis ();

		/****************** YAxis ******************/
		%feature("compactdefaultargs") YAxis;
		%feature("autodoc", "* Returns the YAxis of the reference plane.
	:rtype: gp_Ax1") YAxis;
		gp_Ax1 YAxis ();

		/****************** gp_Cone ******************/
		%feature("compactdefaultargs") gp_Cone;
		%feature("autodoc", "* Creates an indefinite Cone.
	:rtype: None") gp_Cone;
		 gp_Cone ();

		/****************** gp_Cone ******************/
		%feature("compactdefaultargs") gp_Cone;
		%feature("autodoc", "* Creates an infinite conical surface. A3 locates the cone in the space and defines the reference plane of the surface. Ang is the conical surface semi-angle. Its absolute value is in range ]0, PI/2[. Radius is the radius of the circle in the reference plane of the cone. Raises ConstructionError * if Radius is lower than 0.0 * Abs(Ang) < Resolution from gp or Abs(Ang) >= (PI/2) - Resolution.
	:param A3:
	:type A3: gp_Ax3
	:param Ang:
	:type Ang: float
	:param Radius:
	:type Radius: float
	:rtype: None") gp_Cone;
		 gp_Cone (const gp_Ax3 & A3,const Standard_Real Ang,const Standard_Real Radius);

};


%extend gp_Cone {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************
* class gp_Cylinder *
********************/
%nodefaultctor gp_Cylinder;
class gp_Cylinder {
	public:
		/****************** Axis ******************/
		%feature("compactdefaultargs") Axis;
		%feature("autodoc", "* Returns the symmetry axis of the cylinder.
	:rtype: gp_Ax1") Axis;
		const gp_Ax1  Axis ();

		/****************** Coefficients ******************/
		%feature("compactdefaultargs") Coefficients;
		%feature("autodoc", "* Computes the coefficients of the implicit equation of the quadric in the absolute cartesian coordinate system : A1.X**2 + A2.Y**2 + A3.Z**2 + 2.(B1.X.Y + B2.X.Z + B3.Y.Z) + 2.(C1.X + C2.Y + C3.Z) + D = 0.0
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
	:rtype: None") Coefficients;
		void Coefficients (Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);

		/****************** Direct ******************/
		%feature("compactdefaultargs") Direct;
		%feature("autodoc", "* Returns true if the local coordinate system of this cylinder is right-handed.
	:rtype: bool") Direct;
		Standard_Boolean Direct ();

		/****************** Location ******************/
		%feature("compactdefaultargs") Location;
		%feature("autodoc", "* Returns the 'Location' point of the cylinder.
	:rtype: gp_Pnt") Location;
		const gp_Pnt  Location ();

		/****************** Mirror ******************/
		%feature("compactdefaultargs") Mirror;
		%feature("autodoc", ":param P:
	:type P: gp_Pnt
	:rtype: None") Mirror;
		void Mirror (const gp_Pnt & P);

		/****************** Mirror ******************/
		%feature("compactdefaultargs") Mirror;
		%feature("autodoc", ":param A1:
	:type A1: gp_Ax1
	:rtype: None") Mirror;
		void Mirror (const gp_Ax1 & A1);

		/****************** Mirror ******************/
		%feature("compactdefaultargs") Mirror;
		%feature("autodoc", ":param A2:
	:type A2: gp_Ax2
	:rtype: None") Mirror;
		void Mirror (const gp_Ax2 & A2);

		/****************** Mirrored ******************/
		%feature("compactdefaultargs") Mirrored;
		%feature("autodoc", "* Performs the symmetrical transformation of a cylinder with respect to the point P which is the center of the symmetry.
	:param P:
	:type P: gp_Pnt
	:rtype: Standard_NODISCARD gp_Cylinder") Mirrored;
		Standard_NODISCARD gp_Cylinder Mirrored (const gp_Pnt & P);

		/****************** Mirrored ******************/
		%feature("compactdefaultargs") Mirrored;
		%feature("autodoc", "* Performs the symmetrical transformation of a cylinder with respect to an axis placement which is the axis of the symmetry.
	:param A1:
	:type A1: gp_Ax1
	:rtype: Standard_NODISCARD gp_Cylinder") Mirrored;
		Standard_NODISCARD gp_Cylinder Mirrored (const gp_Ax1 & A1);

		/****************** Mirrored ******************/
		%feature("compactdefaultargs") Mirrored;
		%feature("autodoc", "* Performs the symmetrical transformation of a cylinder with respect to a plane. The axis placement A2 locates the plane of the of the symmetry : (Location, XDirection, YDirection).
	:param A2:
	:type A2: gp_Ax2
	:rtype: Standard_NODISCARD gp_Cylinder") Mirrored;
		Standard_NODISCARD gp_Cylinder Mirrored (const gp_Ax2 & A2);

		/****************** Position ******************/
		%feature("compactdefaultargs") Position;
		%feature("autodoc", "* Returns the local coordinate system of the cylinder.
	:rtype: gp_Ax3") Position;
		const gp_Ax3  Position ();

		/****************** Radius ******************/
		%feature("compactdefaultargs") Radius;
		%feature("autodoc", "* Returns the radius of the cylinder.
	:rtype: float") Radius;
		Standard_Real Radius ();

		/****************** Rotate ******************/
		%feature("compactdefaultargs") Rotate;
		%feature("autodoc", ":param A1:
	:type A1: gp_Ax1
	:param Ang:
	:type Ang: float
	:rtype: None") Rotate;
		void Rotate (const gp_Ax1 & A1,const Standard_Real Ang);

		/****************** Rotated ******************/
		%feature("compactdefaultargs") Rotated;
		%feature("autodoc", "* Rotates a cylinder. A1 is the axis of the rotation. Ang is the angular value of the rotation in radians.
	:param A1:
	:type A1: gp_Ax1
	:param Ang:
	:type Ang: float
	:rtype: Standard_NODISCARD gp_Cylinder") Rotated;
		Standard_NODISCARD gp_Cylinder Rotated (const gp_Ax1 & A1,const Standard_Real Ang);

		/****************** Scale ******************/
		%feature("compactdefaultargs") Scale;
		%feature("autodoc", ":param P:
	:type P: gp_Pnt
	:param S:
	:type S: float
	:rtype: None") Scale;
		void Scale (const gp_Pnt & P,const Standard_Real S);

		/****************** Scaled ******************/
		%feature("compactdefaultargs") Scaled;
		%feature("autodoc", "* Scales a cylinder. S is the scaling value. The absolute value of S is used to scale the cylinder
	:param P:
	:type P: gp_Pnt
	:param S:
	:type S: float
	:rtype: Standard_NODISCARD gp_Cylinder") Scaled;
		Standard_NODISCARD gp_Cylinder Scaled (const gp_Pnt & P,const Standard_Real S);

		/****************** SetAxis ******************/
		%feature("compactdefaultargs") SetAxis;
		%feature("autodoc", "* Changes the symmetry axis of the cylinder. Raises ConstructionError if the direction of A1 is parallel to the 'XDirection' of the coordinate system of the cylinder.
	:param A1:
	:type A1: gp_Ax1
	:rtype: None") SetAxis;
		void SetAxis (const gp_Ax1 & A1);

		/****************** SetLocation ******************/
		%feature("compactdefaultargs") SetLocation;
		%feature("autodoc", "* Changes the location of the surface.
	:param Loc:
	:type Loc: gp_Pnt
	:rtype: None") SetLocation;
		void SetLocation (const gp_Pnt & Loc);

		/****************** SetPosition ******************/
		%feature("compactdefaultargs") SetPosition;
		%feature("autodoc", "* Change the local coordinate system of the surface.
	:param A3:
	:type A3: gp_Ax3
	:rtype: None") SetPosition;
		void SetPosition (const gp_Ax3 & A3);

		/****************** SetRadius ******************/
		%feature("compactdefaultargs") SetRadius;
		%feature("autodoc", "* Modifies the radius of this cylinder. Exceptions Standard_ConstructionError if R is negative.
	:param R:
	:type R: float
	:rtype: None") SetRadius;
		void SetRadius (const Standard_Real R);

		/****************** Transform ******************/
		%feature("compactdefaultargs") Transform;
		%feature("autodoc", ":param T:
	:type T: gp_Trsf
	:rtype: None") Transform;
		void Transform (const gp_Trsf & T);

		/****************** Transformed ******************/
		%feature("compactdefaultargs") Transformed;
		%feature("autodoc", "* Transforms a cylinder with the transformation T from class Trsf.
	:param T:
	:type T: gp_Trsf
	:rtype: Standard_NODISCARD gp_Cylinder") Transformed;
		Standard_NODISCARD gp_Cylinder Transformed (const gp_Trsf & T);

		/****************** Translate ******************/
		%feature("compactdefaultargs") Translate;
		%feature("autodoc", ":param V:
	:type V: gp_Vec
	:rtype: None") Translate;
		void Translate (const gp_Vec & V);

		/****************** Translate ******************/
		%feature("compactdefaultargs") Translate;
		%feature("autodoc", ":param P1:
	:type P1: gp_Pnt
	:param P2:
	:type P2: gp_Pnt
	:rtype: None") Translate;
		void Translate (const gp_Pnt & P1,const gp_Pnt & P2);

		/****************** Translated ******************/
		%feature("compactdefaultargs") Translated;
		%feature("autodoc", "* Translates a cylinder in the direction of the vector V. The magnitude of the translation is the vector's magnitude.
	:param V:
	:type V: gp_Vec
	:rtype: Standard_NODISCARD gp_Cylinder") Translated;
		Standard_NODISCARD gp_Cylinder Translated (const gp_Vec & V);

		/****************** Translated ******************/
		%feature("compactdefaultargs") Translated;
		%feature("autodoc", "* Translates a cylinder from the point P1 to the point P2.
	:param P1:
	:type P1: gp_Pnt
	:param P2:
	:type P2: gp_Pnt
	:rtype: Standard_NODISCARD gp_Cylinder") Translated;
		Standard_NODISCARD gp_Cylinder Translated (const gp_Pnt & P1,const gp_Pnt & P2);

		/****************** UReverse ******************/
		%feature("compactdefaultargs") UReverse;
		%feature("autodoc", "* Reverses the U parametrization of the cylinder reversing the YAxis.
	:rtype: None") UReverse;
		void UReverse ();

		/****************** VReverse ******************/
		%feature("compactdefaultargs") VReverse;
		%feature("autodoc", "* Reverses the V parametrization of the plane reversing the Axis.
	:rtype: None") VReverse;
		void VReverse ();

		/****************** XAxis ******************/
		%feature("compactdefaultargs") XAxis;
		%feature("autodoc", "* Returns the axis X of the cylinder.
	:rtype: gp_Ax1") XAxis;
		gp_Ax1 XAxis ();

		/****************** YAxis ******************/
		%feature("compactdefaultargs") YAxis;
		%feature("autodoc", "* Returns the axis Y of the cylinder.
	:rtype: gp_Ax1") YAxis;
		gp_Ax1 YAxis ();

		/****************** gp_Cylinder ******************/
		%feature("compactdefaultargs") gp_Cylinder;
		%feature("autodoc", "* Creates a indefinite cylinder.
	:rtype: None") gp_Cylinder;
		 gp_Cylinder ();

		/****************** gp_Cylinder ******************/
		%feature("compactdefaultargs") gp_Cylinder;
		%feature("autodoc", "* Creates a cylinder of radius Radius, whose axis is the 'main Axis' of A3. A3 is the local coordinate system of the cylinder. Raises ConstructionErrord if R < 0.0
	:param A3:
	:type A3: gp_Ax3
	:param Radius:
	:type Radius: float
	:rtype: None") gp_Cylinder;
		 gp_Cylinder (const gp_Ax3 & A3,const Standard_Real Radius);

};


%extend gp_Cylinder {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************
* class gp_Dir *
***************/
%nodefaultctor gp_Dir;
class gp_Dir {
	public:
		/****************** Angle ******************/
		%feature("compactdefaultargs") Angle;
		%feature("autodoc", "* Computes the angular value in radians between <self> and <Other>. This value is always positive in 3D space. Returns the angle in the range [0, PI]
	:param Other:
	:type Other: gp_Dir
	:rtype: float") Angle;
		Standard_Real Angle (const gp_Dir & Other);

		/****************** AngleWithRef ******************/
		%feature("compactdefaultargs") AngleWithRef;
		%feature("autodoc", "* Computes the angular value between <self> and <Other>. <VRef> is the direction of reference normal to <self> and <Other> and its orientation gives the positive sense of rotation. If the cross product <self> ^ <Other> has the same orientation as <VRef> the angular value is positive else negative. Returns the angular value in the range -PI and PI (in radians). Raises DomainError if <self> and <Other> are not parallel this exception is raised when <VRef> is in the same plane as <self> and <Other> The tolerance criterion is Resolution from package gp.
	:param Other:
	:type Other: gp_Dir
	:param VRef:
	:type VRef: gp_Dir
	:rtype: float") AngleWithRef;
		Standard_Real AngleWithRef (const gp_Dir & Other,const gp_Dir & VRef);

		/****************** Coord ******************/
		%feature("compactdefaultargs") Coord;
		%feature("autodoc", "* Returns the coordinate of range Index : Index = 1 => X is returned Index = 2 => Y is returned Index = 3 => Z is returned Exceptions Standard_OutOfRange if Index is not 1, 2, or 3.
	:param Index:
	:type Index: int
	:rtype: float") Coord;
		Standard_Real Coord (const Standard_Integer Index);

		/****************** Coord ******************/
		%feature("compactdefaultargs") Coord;
		%feature("autodoc", "* Returns for the unit vector its three coordinates Xv, Yv, and Zv.
	:param Xv:
	:type Xv: float &
	:param Yv:
	:type Yv: float &
	:param Zv:
	:type Zv: float &
	:rtype: None") Coord;
		void Coord (Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);

		/****************** Cross ******************/
		%feature("compactdefaultargs") Cross;
		%feature("autodoc", "* Computes the cross product between two directions Raises the exception ConstructionError if the two directions are parallel because the computed vector cannot be normalized to create a direction.
	:param Right:
	:type Right: gp_Dir
	:rtype: None") Cross;
		void Cross (const gp_Dir & Right);

		/****************** CrossCross ******************/
		%feature("compactdefaultargs") CrossCross;
		%feature("autodoc", ":param V1:
	:type V1: gp_Dir
	:param V2:
	:type V2: gp_Dir
	:rtype: None") CrossCross;
		void CrossCross (const gp_Dir & V1,const gp_Dir & V2);

		/****************** CrossCrossed ******************/
		%feature("compactdefaultargs") CrossCrossed;
		%feature("autodoc", "* Computes the double vector product this ^ (V1 ^ V2). - CrossCrossed creates a new unit vector. Exceptions Standard_ConstructionError if: - V1 and V2 are parallel, or - this unit vector and (V1 ^ V2) are parallel. This is because, in these conditions, the computed vector is null and cannot be normalized.
	:param V1:
	:type V1: gp_Dir
	:param V2:
	:type V2: gp_Dir
	:rtype: Standard_NODISCARD gp_Dir") CrossCrossed;
		Standard_NODISCARD gp_Dir CrossCrossed (const gp_Dir & V1,const gp_Dir & V2);

		/****************** Crossed ******************/
		%feature("compactdefaultargs") Crossed;
		%feature("autodoc", "* Computes the triple vector product. <self> ^ (V1 ^ V2) Raises the exception ConstructionError if V1 and V2 are parallel or <self> and (V1^V2) are parallel because the computed vector can't be normalized to create a direction.
	:param Right:
	:type Right: gp_Dir
	:rtype: Standard_NODISCARD gp_Dir") Crossed;
		Standard_NODISCARD gp_Dir Crossed (const gp_Dir & Right);

		/****************** Dot ******************/
		%feature("compactdefaultargs") Dot;
		%feature("autodoc", "* Computes the scalar product
	:param Other:
	:type Other: gp_Dir
	:rtype: float") Dot;
		Standard_Real Dot (const gp_Dir & Other);

		/****************** DotCross ******************/
		%feature("compactdefaultargs") DotCross;
		%feature("autodoc", "* Computes the triple scalar product <self> * (V1 ^ V2). Warnings : The computed vector V1' = V1 ^ V2 is not normalized to create a unitary vector. So this method never raises an exception even if V1 and V2 are parallel.
	:param V1:
	:type V1: gp_Dir
	:param V2:
	:type V2: gp_Dir
	:rtype: float") DotCross;
		Standard_Real DotCross (const gp_Dir & V1,const gp_Dir & V2);

		/****************** IsEqual ******************/
		%feature("compactdefaultargs") IsEqual;
		%feature("autodoc", "* Returns True if the angle between the two directions is lower or equal to AngularTolerance.
	:param Other:
	:type Other: gp_Dir
	:param AngularTolerance:
	:type AngularTolerance: float
	:rtype: bool") IsEqual;
		Standard_Boolean IsEqual (const gp_Dir & Other,const Standard_Real AngularTolerance);

		/****************** IsNormal ******************/
		%feature("compactdefaultargs") IsNormal;
		%feature("autodoc", "* Returns True if the angle between this unit vector and the unit vector Other is equal to Pi/2 (normal).
	:param Other:
	:type Other: gp_Dir
	:param AngularTolerance:
	:type AngularTolerance: float
	:rtype: bool") IsNormal;
		Standard_Boolean IsNormal (const gp_Dir & Other,const Standard_Real AngularTolerance);

		/****************** IsOpposite ******************/
		%feature("compactdefaultargs") IsOpposite;
		%feature("autodoc", "* Returns True if the angle between this unit vector and the unit vector Other is equal to Pi (opposite).
	:param Other:
	:type Other: gp_Dir
	:param AngularTolerance:
	:type AngularTolerance: float
	:rtype: bool") IsOpposite;
		Standard_Boolean IsOpposite (const gp_Dir & Other,const Standard_Real AngularTolerance);

		/****************** IsParallel ******************/
		%feature("compactdefaultargs") IsParallel;
		%feature("autodoc", "* Returns true if the angle between this unit vector and the unit vector Other is equal to 0 or to Pi. Note: the tolerance criterion is given by AngularTolerance.
	:param Other:
	:type Other: gp_Dir
	:param AngularTolerance:
	:type AngularTolerance: float
	:rtype: bool") IsParallel;
		Standard_Boolean IsParallel (const gp_Dir & Other,const Standard_Real AngularTolerance);

		/****************** Mirror ******************/
		%feature("compactdefaultargs") Mirror;
		%feature("autodoc", ":param V:
	:type V: gp_Dir
	:rtype: None") Mirror;
		void Mirror (const gp_Dir & V);

		/****************** Mirror ******************/
		%feature("compactdefaultargs") Mirror;
		%feature("autodoc", ":param A1:
	:type A1: gp_Ax1
	:rtype: None") Mirror;
		void Mirror (const gp_Ax1 & A1);

		/****************** Mirror ******************/
		%feature("compactdefaultargs") Mirror;
		%feature("autodoc", ":param A2:
	:type A2: gp_Ax2
	:rtype: None") Mirror;
		void Mirror (const gp_Ax2 & A2);

		/****************** Mirrored ******************/
		%feature("compactdefaultargs") Mirrored;
		%feature("autodoc", "* Performs the symmetrical transformation of a direction with respect to the direction V which is the center of the symmetry.
	:param V:
	:type V: gp_Dir
	:rtype: Standard_NODISCARD gp_Dir") Mirrored;
		Standard_NODISCARD gp_Dir Mirrored (const gp_Dir & V);

		/****************** Mirrored ******************/
		%feature("compactdefaultargs") Mirrored;
		%feature("autodoc", "* Performs the symmetrical transformation of a direction with respect to an axis placement which is the axis of the symmetry.
	:param A1:
	:type A1: gp_Ax1
	:rtype: Standard_NODISCARD gp_Dir") Mirrored;
		Standard_NODISCARD gp_Dir Mirrored (const gp_Ax1 & A1);

		/****************** Mirrored ******************/
		%feature("compactdefaultargs") Mirrored;
		%feature("autodoc", "* Performs the symmetrical transformation of a direction with respect to a plane. The axis placement A2 locates the plane of the symmetry : (Location, XDirection, YDirection).
	:param A2:
	:type A2: gp_Ax2
	:rtype: Standard_NODISCARD gp_Dir") Mirrored;
		Standard_NODISCARD gp_Dir Mirrored (const gp_Ax2 & A2);

		/****************** Reverse ******************/
		%feature("compactdefaultargs") Reverse;
		%feature("autodoc", ":rtype: None") Reverse;
		void Reverse ();

		/****************** Reversed ******************/
		%feature("compactdefaultargs") Reversed;
		%feature("autodoc", "* Reverses the orientation of a direction geometric transformations Performs the symmetrical transformation of a direction with respect to the direction V which is the center of the symmetry.]
	:rtype: Standard_NODISCARD gp_Dir") Reversed;
		Standard_NODISCARD gp_Dir Reversed ();

		/****************** Rotate ******************/
		%feature("compactdefaultargs") Rotate;
		%feature("autodoc", ":param A1:
	:type A1: gp_Ax1
	:param Ang:
	:type Ang: float
	:rtype: None") Rotate;
		void Rotate (const gp_Ax1 & A1,const Standard_Real Ang);

		/****************** Rotated ******************/
		%feature("compactdefaultargs") Rotated;
		%feature("autodoc", "* Rotates a direction. A1 is the axis of the rotation. Ang is the angular value of the rotation in radians.
	:param A1:
	:type A1: gp_Ax1
	:param Ang:
	:type Ang: float
	:rtype: Standard_NODISCARD gp_Dir") Rotated;
		Standard_NODISCARD gp_Dir Rotated (const gp_Ax1 & A1,const Standard_Real Ang);

		/****************** SetCoord ******************/
		%feature("compactdefaultargs") SetCoord;
		%feature("autodoc", "* For this unit vector, assigns the value Xi to: - the X coordinate if Index is 1, or - the Y coordinate if Index is 2, or - the Z coordinate if Index is 3, and then normalizes it. Warning Remember that all the coordinates of a unit vector are implicitly modified when any single one is changed directly. Exceptions Standard_OutOfRange if Index is not 1, 2, or 3. Standard_ConstructionError if either of the following is less than or equal to gp::Resolution(): - Sqrt(Xv*Xv + Yv*Yv + Zv*Zv), or - the modulus of the number triple formed by the new value Xi and the two other coordinates of this vector that were not directly modified.
	:param Index:
	:type Index: int
	:param Xi:
	:type Xi: float
	:rtype: None") SetCoord;
		void SetCoord (const Standard_Integer Index,const Standard_Real Xi);

		/****************** SetCoord ******************/
		%feature("compactdefaultargs") SetCoord;
		%feature("autodoc", "* For this unit vector, assigns the values Xv, Yv and Zv to its three coordinates. Remember that all the coordinates of a unit vector are implicitly modified when any single one is changed directly.
	:param Xv:
	:type Xv: float
	:param Yv:
	:type Yv: float
	:param Zv:
	:type Zv: float
	:rtype: None") SetCoord;
		void SetCoord (const Standard_Real Xv,const Standard_Real Yv,const Standard_Real Zv);

		/****************** SetX ******************/
		%feature("compactdefaultargs") SetX;
		%feature("autodoc", "* Assigns the given value to the X coordinate of this unit vector.
	:param X:
	:type X: float
	:rtype: None") SetX;
		void SetX (const Standard_Real X);

		/****************** SetXYZ ******************/
		%feature("compactdefaultargs") SetXYZ;
		%feature("autodoc", "* Assigns the three coordinates of Coord to this unit vector.
	:param Coord:
	:type Coord: gp_XYZ
	:rtype: None") SetXYZ;
		void SetXYZ (const gp_XYZ & Coord);

		/****************** SetY ******************/
		%feature("compactdefaultargs") SetY;
		%feature("autodoc", "* Assigns the given value to the Y coordinate of this unit vector.
	:param Y:
	:type Y: float
	:rtype: None") SetY;
		void SetY (const Standard_Real Y);

		/****************** SetZ ******************/
		%feature("compactdefaultargs") SetZ;
		%feature("autodoc", "* Assigns the given value to the Z coordinate of this unit vector.
	:param Z:
	:type Z: float
	:rtype: None") SetZ;
		void SetZ (const Standard_Real Z);

		/****************** Transform ******************/
		%feature("compactdefaultargs") Transform;
		%feature("autodoc", ":param T:
	:type T: gp_Trsf
	:rtype: None") Transform;
		void Transform (const gp_Trsf & T);

		/****************** Transformed ******************/
		%feature("compactdefaultargs") Transformed;
		%feature("autodoc", "* Transforms a direction with a 'Trsf' from gp. Warnings : If the scale factor of the 'Trsf' T is negative then the direction <self> is reversed.
	:param T:
	:type T: gp_Trsf
	:rtype: Standard_NODISCARD gp_Dir") Transformed;
		Standard_NODISCARD gp_Dir Transformed (const gp_Trsf & T);

		/****************** X ******************/
		%feature("compactdefaultargs") X;
		%feature("autodoc", "* Returns the X coordinate for a unit vector.
	:rtype: float") X;
		Standard_Real X ();

		/****************** XYZ ******************/
		%feature("compactdefaultargs") XYZ;
		%feature("autodoc", "* for this unit vector, returns its three coordinates as a number triplea.
	:rtype: gp_XYZ") XYZ;
		const gp_XYZ  XYZ ();

		/****************** Y ******************/
		%feature("compactdefaultargs") Y;
		%feature("autodoc", "* Returns the Y coordinate for a unit vector.
	:rtype: float") Y;
		Standard_Real Y ();

		/****************** Z ******************/
		%feature("compactdefaultargs") Z;
		%feature("autodoc", "* Returns the Z coordinate for a unit vector.
	:rtype: float") Z;
		Standard_Real Z ();

		/****************** gp_Dir ******************/
		%feature("compactdefaultargs") gp_Dir;
		%feature("autodoc", "* Creates a direction corresponding to X axis.
	:rtype: None") gp_Dir;
		 gp_Dir ();

		/****************** gp_Dir ******************/
		%feature("compactdefaultargs") gp_Dir;
		%feature("autodoc", "* Normalizes the vector V and creates a direction. Raises ConstructionError if V.Magnitude() <= Resolution.
	:param V:
	:type V: gp_Vec
	:rtype: None") gp_Dir;
		 gp_Dir (const gp_Vec & V);

		/****************** gp_Dir ******************/
		%feature("compactdefaultargs") gp_Dir;
		%feature("autodoc", "* Creates a direction from a triplet of coordinates. Raises ConstructionError if Coord.Modulus() <= Resolution from gp.
	:param Coord:
	:type Coord: gp_XYZ
	:rtype: None") gp_Dir;
		 gp_Dir (const gp_XYZ & Coord);

		/****************** gp_Dir ******************/
		%feature("compactdefaultargs") gp_Dir;
		%feature("autodoc", "* Creates a direction with its 3 cartesian coordinates. Raises ConstructionError if Sqrt(Xv*Xv + Yv*Yv + Zv*Zv) <= Resolution Modification of the direction's coordinates If Sqrt (X*X + Y*Y + Z*Z) <= Resolution from gp where X, Y ,Z are the new coordinates it is not possible to construct the direction and the method raises the exception ConstructionError.
	:param Xv:
	:type Xv: float
	:param Yv:
	:type Yv: float
	:param Zv:
	:type Zv: float
	:rtype: None") gp_Dir;
		 gp_Dir (const Standard_Real Xv,const Standard_Real Yv,const Standard_Real Zv);

		/****************** operator * ******************/
		%feature("compactdefaultargs") operator *;
		%feature("autodoc", ":param Other:
	:type Other: gp_Dir
	:rtype: float") operator *;
		Standard_Real operator * (const gp_Dir & Other);

		/****************** operator - ******************/
		%feature("compactdefaultargs") operator -;
		%feature("autodoc", ":rtype: Standard_NODISCARD gp_Dir") operator -;
		Standard_NODISCARD gp_Dir operator - ();

};


%extend gp_Dir {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************
* class gp_Dir2d *
*****************/
%nodefaultctor gp_Dir2d;
class gp_Dir2d {
	public:
		/****************** Angle ******************/
		%feature("compactdefaultargs") Angle;
		%feature("autodoc", "* Computes the angular value in radians between <self> and <Other>. Returns the angle in the range [-PI, PI].
	:param Other:
	:type Other: gp_Dir2d
	:rtype: float") Angle;
		Standard_Real Angle (const gp_Dir2d & Other);

		/****************** Coord ******************/
		%feature("compactdefaultargs") Coord;
		%feature("autodoc", "* For this unit vector returns the coordinate of range Index : Index = 1 => X is returned Index = 2 => Y is returned Raises OutOfRange if Index != {1, 2}.
	:param Index:
	:type Index: int
	:rtype: float") Coord;
		Standard_Real Coord (const Standard_Integer Index);

		/****************** Coord ******************/
		%feature("compactdefaultargs") Coord;
		%feature("autodoc", "* For this unit vector returns its two coordinates Xv and Yv. Raises OutOfRange if Index != {1, 2}.
	:param Xv:
	:type Xv: float &
	:param Yv:
	:type Yv: float &
	:rtype: None") Coord;
		void Coord (Standard_Real &OutValue,Standard_Real &OutValue);

		/****************** Crossed ******************/
		%feature("compactdefaultargs") Crossed;
		%feature("autodoc", "* Computes the cross product between two directions.
	:param Right:
	:type Right: gp_Dir2d
	:rtype: Standard_NODISCARD float") Crossed;
		Standard_NODISCARD Standard_Real Crossed (const gp_Dir2d & Right);

		/****************** Dot ******************/
		%feature("compactdefaultargs") Dot;
		%feature("autodoc", "* Computes the scalar product
	:param Other:
	:type Other: gp_Dir2d
	:rtype: float") Dot;
		Standard_Real Dot (const gp_Dir2d & Other);

		/****************** IsEqual ******************/
		%feature("compactdefaultargs") IsEqual;
		%feature("autodoc", "* Returns True if the two vectors have the same direction i.e. the angle between this unit vector and the unit vector Other is less than or equal to AngularTolerance.
	:param Other:
	:type Other: gp_Dir2d
	:param AngularTolerance:
	:type AngularTolerance: float
	:rtype: bool") IsEqual;
		Standard_Boolean IsEqual (const gp_Dir2d & Other,const Standard_Real AngularTolerance);

		/****************** IsNormal ******************/
		%feature("compactdefaultargs") IsNormal;
		%feature("autodoc", "* Returns True if the angle between this unit vector and the unit vector Other is equal to Pi/2 or -Pi/2 (normal) i.e. Abs(Abs(<self>.Angle(Other)) - PI/2.) <= AngularTolerance
	:param Other:
	:type Other: gp_Dir2d
	:param AngularTolerance:
	:type AngularTolerance: float
	:rtype: bool") IsNormal;
		Standard_Boolean IsNormal (const gp_Dir2d & Other,const Standard_Real AngularTolerance);

		/****************** IsOpposite ******************/
		%feature("compactdefaultargs") IsOpposite;
		%feature("autodoc", "* Returns True if the angle between this unit vector and the unit vector Other is equal to Pi or -Pi (opposite). i.e. PI - Abs(<self>.Angle(Other)) <= AngularTolerance
	:param Other:
	:type Other: gp_Dir2d
	:param AngularTolerance:
	:type AngularTolerance: float
	:rtype: bool") IsOpposite;
		Standard_Boolean IsOpposite (const gp_Dir2d & Other,const Standard_Real AngularTolerance);

		/****************** IsParallel ******************/
		%feature("compactdefaultargs") IsParallel;
		%feature("autodoc", "* returns true if if the angle between this unit vector and unit vector Other is equal to 0, Pi or -Pi. i.e. Abs(Angle(<self>, Other)) <= AngularTolerance or PI - Abs(Angle(<self>, Other)) <= AngularTolerance
	:param Other:
	:type Other: gp_Dir2d
	:param AngularTolerance:
	:type AngularTolerance: float
	:rtype: bool") IsParallel;
		Standard_Boolean IsParallel (const gp_Dir2d & Other,const Standard_Real AngularTolerance);

		/****************** Mirror ******************/
		%feature("compactdefaultargs") Mirror;
		%feature("autodoc", ":param V:
	:type V: gp_Dir2d
	:rtype: None") Mirror;
		void Mirror (const gp_Dir2d & V);

		/****************** Mirror ******************/
		%feature("compactdefaultargs") Mirror;
		%feature("autodoc", ":param A:
	:type A: gp_Ax2d
	:rtype: None") Mirror;
		void Mirror (const gp_Ax2d & A);

		/****************** Mirrored ******************/
		%feature("compactdefaultargs") Mirrored;
		%feature("autodoc", "* Performs the symmetrical transformation of a direction with respect to the direction V which is the center of the symmetry.
	:param V:
	:type V: gp_Dir2d
	:rtype: Standard_NODISCARD gp_Dir2d") Mirrored;
		Standard_NODISCARD gp_Dir2d Mirrored (const gp_Dir2d & V);

		/****************** Mirrored ******************/
		%feature("compactdefaultargs") Mirrored;
		%feature("autodoc", "* Performs the symmetrical transformation of a direction with respect to an axis placement which is the axis of the symmetry.
	:param A:
	:type A: gp_Ax2d
	:rtype: Standard_NODISCARD gp_Dir2d") Mirrored;
		Standard_NODISCARD gp_Dir2d Mirrored (const gp_Ax2d & A);

		/****************** Reverse ******************/
		%feature("compactdefaultargs") Reverse;
		%feature("autodoc", ":rtype: None") Reverse;
		void Reverse ();

		/****************** Reversed ******************/
		%feature("compactdefaultargs") Reversed;
		%feature("autodoc", "* Reverses the orientation of a direction
	:rtype: Standard_NODISCARD gp_Dir2d") Reversed;
		Standard_NODISCARD gp_Dir2d Reversed ();

		/****************** Rotate ******************/
		%feature("compactdefaultargs") Rotate;
		%feature("autodoc", ":param Ang:
	:type Ang: float
	:rtype: None") Rotate;
		void Rotate (const Standard_Real Ang);

		/****************** Rotated ******************/
		%feature("compactdefaultargs") Rotated;
		%feature("autodoc", "* Rotates a direction. Ang is the angular value of the rotation in radians.
	:param Ang:
	:type Ang: float
	:rtype: Standard_NODISCARD gp_Dir2d") Rotated;
		Standard_NODISCARD gp_Dir2d Rotated (const Standard_Real Ang);

		/****************** SetCoord ******************/
		%feature("compactdefaultargs") SetCoord;
		%feature("autodoc", "* For this unit vector, assigns: the value Xi to: - the X coordinate if Index is 1, or - the Y coordinate if Index is 2, and then normalizes it. Warning Remember that all the coordinates of a unit vector are implicitly modified when any single one is changed directly. Exceptions Standard_OutOfRange if Index is not 1 or 2. Standard_ConstructionError if either of the following is less than or equal to gp::Resolution(): - Sqrt(Xv*Xv + Yv*Yv), or - the modulus of the number pair formed by the new value Xi and the other coordinate of this vector that was not directly modified. Raises OutOfRange if Index != {1, 2}.
	:param Index:
	:type Index: int
	:param Xi:
	:type Xi: float
	:rtype: None") SetCoord;
		void SetCoord (const Standard_Integer Index,const Standard_Real Xi);

		/****************** SetCoord ******************/
		%feature("compactdefaultargs") SetCoord;
		%feature("autodoc", "* For this unit vector, assigns: - the values Xv and Yv to its two coordinates, Warning Remember that all the coordinates of a unit vector are implicitly modified when any single one is changed directly. Exceptions Standard_OutOfRange if Index is not 1 or 2. Standard_ConstructionError if either of the following is less than or equal to gp::Resolution(): - Sqrt(Xv*Xv + Yv*Yv), or - the modulus of the number pair formed by the new value Xi and the other coordinate of this vector that was not directly modified. Raises OutOfRange if Index != {1, 2}.
	:param Xv:
	:type Xv: float
	:param Yv:
	:type Yv: float
	:rtype: None") SetCoord;
		void SetCoord (const Standard_Real Xv,const Standard_Real Yv);

		/****************** SetX ******************/
		%feature("compactdefaultargs") SetX;
		%feature("autodoc", "* Assigns the given value to the X coordinate of this unit vector, and then normalizes it. Warning Remember that all the coordinates of a unit vector are implicitly modified when any single one is changed directly. Exceptions Standard_ConstructionError if either of the following is less than or equal to gp::Resolution(): - the modulus of Coord, or - the modulus of the number pair formed from the new X or Y coordinate and the other coordinate of this vector that was not directly modified.
	:param X:
	:type X: float
	:rtype: None") SetX;
		void SetX (const Standard_Real X);

		/****************** SetXY ******************/
		%feature("compactdefaultargs") SetXY;
		%feature("autodoc", "* Assigns: - the two coordinates of Coord to this unit vector, and then normalizes it. Warning Remember that all the coordinates of a unit vector are implicitly modified when any single one is changed directly. Exceptions Standard_ConstructionError if either of the following is less than or equal to gp::Resolution(): - the modulus of Coord, or - the modulus of the number pair formed from the new X or Y coordinate and the other coordinate of this vector that was not directly modified.
	:param Coord:
	:type Coord: gp_XY
	:rtype: None") SetXY;
		void SetXY (const gp_XY & Coord);

		/****************** SetY ******************/
		%feature("compactdefaultargs") SetY;
		%feature("autodoc", "* Assigns the given value to the Y coordinate of this unit vector, and then normalizes it. Warning Remember that all the coordinates of a unit vector are implicitly modified when any single one is changed directly. Exceptions Standard_ConstructionError if either of the following is less than or equal to gp::Resolution(): - the modulus of Coord, or - the modulus of the number pair formed from the new X or Y coordinate and the other coordinate of this vector that was not directly modified.
	:param Y:
	:type Y: float
	:rtype: None") SetY;
		void SetY (const Standard_Real Y);

		/****************** Transform ******************/
		%feature("compactdefaultargs") Transform;
		%feature("autodoc", ":param T:
	:type T: gp_Trsf2d
	:rtype: None") Transform;
		void Transform (const gp_Trsf2d & T);

		/****************** Transformed ******************/
		%feature("compactdefaultargs") Transformed;
		%feature("autodoc", "* Transforms a direction with the 'Trsf' T. Warnings : If the scale factor of the 'Trsf' T is negative then the direction <self> is reversed.
	:param T:
	:type T: gp_Trsf2d
	:rtype: Standard_NODISCARD gp_Dir2d") Transformed;
		Standard_NODISCARD gp_Dir2d Transformed (const gp_Trsf2d & T);

		/****************** X ******************/
		%feature("compactdefaultargs") X;
		%feature("autodoc", "* For this unit vector, returns its X coordinate.
	:rtype: float") X;
		Standard_Real X ();

		/****************** XY ******************/
		%feature("compactdefaultargs") XY;
		%feature("autodoc", "* For this unit vector, returns its two coordinates as a number pair. Comparison between Directions The precision value is an input data.
	:rtype: gp_XY") XY;
		const gp_XY  XY ();

		/****************** Y ******************/
		%feature("compactdefaultargs") Y;
		%feature("autodoc", "* For this unit vector, returns its Y coordinate.
	:rtype: float") Y;
		Standard_Real Y ();

		/****************** gp_Dir2d ******************/
		%feature("compactdefaultargs") gp_Dir2d;
		%feature("autodoc", "* Creates a direction corresponding to X axis.
	:rtype: None") gp_Dir2d;
		 gp_Dir2d ();

		/****************** gp_Dir2d ******************/
		%feature("compactdefaultargs") gp_Dir2d;
		%feature("autodoc", "* Normalizes the vector V and creates a Direction. Raises ConstructionError if V.Magnitude() <= Resolution from gp.
	:param V:
	:type V: gp_Vec2d
	:rtype: None") gp_Dir2d;
		 gp_Dir2d (const gp_Vec2d & V);

		/****************** gp_Dir2d ******************/
		%feature("compactdefaultargs") gp_Dir2d;
		%feature("autodoc", "* Creates a Direction from a doublet of coordinates. Raises ConstructionError if Coord.Modulus() <= Resolution from gp.
	:param Coord:
	:type Coord: gp_XY
	:rtype: None") gp_Dir2d;
		 gp_Dir2d (const gp_XY & Coord);

		/****************** gp_Dir2d ******************/
		%feature("compactdefaultargs") gp_Dir2d;
		%feature("autodoc", "* Creates a Direction with its 2 cartesian coordinates. Raises ConstructionError if Sqrt(Xv*Xv + Yv*Yv) <= Resolution from gp.
	:param Xv:
	:type Xv: float
	:param Yv:
	:type Yv: float
	:rtype: None") gp_Dir2d;
		 gp_Dir2d (const Standard_Real Xv,const Standard_Real Yv);

		/****************** operator * ******************/
		%feature("compactdefaultargs") operator *;
		%feature("autodoc", ":param Other:
	:type Other: gp_Dir2d
	:rtype: float") operator *;
		Standard_Real operator * (const gp_Dir2d & Other);

		/****************** operator - ******************/
		%feature("compactdefaultargs") operator -;
		%feature("autodoc", ":rtype: Standard_NODISCARD gp_Dir2d") operator -;
		Standard_NODISCARD gp_Dir2d operator - ();

};


%extend gp_Dir2d {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************
* class gp_Elips *
*****************/
%nodefaultctor gp_Elips;
class gp_Elips {
	public:
		/****************** Area ******************/
		%feature("compactdefaultargs") Area;
		%feature("autodoc", "* Computes the area of the Ellipse.
	:rtype: float") Area;
		Standard_Real Area ();

		/****************** Axis ******************/
		%feature("compactdefaultargs") Axis;
		%feature("autodoc", "* Computes the axis normal to the plane of the ellipse.
	:rtype: gp_Ax1") Axis;
		const gp_Ax1  Axis ();

		/****************** Directrix1 ******************/
		%feature("compactdefaultargs") Directrix1;
		%feature("autodoc", "* Computes the first or second directrix of this ellipse. These are the lines, in the plane of the ellipse, normal to the major axis, at a distance equal to MajorRadius/e from the center of the ellipse, where e is the eccentricity of the ellipse. The first directrix (Directrix1) is on the positive side of the major axis. The second directrix (Directrix2) is on the negative side. The directrix is returned as an axis (gp_Ax1 object), the origin of which is situated on the 'X Axis' of the local coordinate system of this ellipse. Exceptions Standard_ConstructionError if the eccentricity is null (the ellipse has degenerated into a circle).
	:rtype: gp_Ax1") Directrix1;
		gp_Ax1 Directrix1 ();

		/****************** Directrix2 ******************/
		%feature("compactdefaultargs") Directrix2;
		%feature("autodoc", "* This line is obtained by the symmetrical transformation of 'Directrix1' with respect to the 'YAxis' of the ellipse. Exceptions Standard_ConstructionError if the eccentricity is null (the ellipse has degenerated into a circle).
	:rtype: gp_Ax1") Directrix2;
		gp_Ax1 Directrix2 ();

		/****************** Eccentricity ******************/
		%feature("compactdefaultargs") Eccentricity;
		%feature("autodoc", "* Returns the eccentricity of the ellipse between 0.0 and 1.0 If f is the distance between the center of the ellipse and the Focus1 then the eccentricity e = f / MajorRadius. Raises ConstructionError if MajorRadius = 0.0
	:rtype: float") Eccentricity;
		Standard_Real Eccentricity ();

		/****************** Focal ******************/
		%feature("compactdefaultargs") Focal;
		%feature("autodoc", "* Computes the focal distance. It is the distance between the two focus focus1 and focus2 of the ellipse.
	:rtype: float") Focal;
		Standard_Real Focal ();

		/****************** Focus1 ******************/
		%feature("compactdefaultargs") Focus1;
		%feature("autodoc", "* Returns the first focus of the ellipse. This focus is on the positive side of the 'XAxis' of the ellipse.
	:rtype: gp_Pnt") Focus1;
		gp_Pnt Focus1 ();

		/****************** Focus2 ******************/
		%feature("compactdefaultargs") Focus2;
		%feature("autodoc", "* Returns the second focus of the ellipse. This focus is on the negative side of the 'XAxis' of the ellipse.
	:rtype: gp_Pnt") Focus2;
		gp_Pnt Focus2 ();

		/****************** Location ******************/
		%feature("compactdefaultargs") Location;
		%feature("autodoc", "* Returns the center of the ellipse. It is the 'Location' point of the coordinate system of the ellipse.
	:rtype: gp_Pnt") Location;
		const gp_Pnt  Location ();

		/****************** MajorRadius ******************/
		%feature("compactdefaultargs") MajorRadius;
		%feature("autodoc", "* Returns the major radius of the ellipse.
	:rtype: float") MajorRadius;
		Standard_Real MajorRadius ();

		/****************** MinorRadius ******************/
		%feature("compactdefaultargs") MinorRadius;
		%feature("autodoc", "* Returns the minor radius of the ellipse.
	:rtype: float") MinorRadius;
		Standard_Real MinorRadius ();

		/****************** Mirror ******************/
		%feature("compactdefaultargs") Mirror;
		%feature("autodoc", ":param P:
	:type P: gp_Pnt
	:rtype: None") Mirror;
		void Mirror (const gp_Pnt & P);

		/****************** Mirror ******************/
		%feature("compactdefaultargs") Mirror;
		%feature("autodoc", ":param A1:
	:type A1: gp_Ax1
	:rtype: None") Mirror;
		void Mirror (const gp_Ax1 & A1);

		/****************** Mirror ******************/
		%feature("compactdefaultargs") Mirror;
		%feature("autodoc", ":param A2:
	:type A2: gp_Ax2
	:rtype: None") Mirror;
		void Mirror (const gp_Ax2 & A2);

		/****************** Mirrored ******************/
		%feature("compactdefaultargs") Mirrored;
		%feature("autodoc", "* Performs the symmetrical transformation of an ellipse with respect to the point P which is the center of the symmetry.
	:param P:
	:type P: gp_Pnt
	:rtype: Standard_NODISCARD gp_Elips") Mirrored;
		Standard_NODISCARD gp_Elips Mirrored (const gp_Pnt & P);

		/****************** Mirrored ******************/
		%feature("compactdefaultargs") Mirrored;
		%feature("autodoc", "* Performs the symmetrical transformation of an ellipse with respect to an axis placement which is the axis of the symmetry.
	:param A1:
	:type A1: gp_Ax1
	:rtype: Standard_NODISCARD gp_Elips") Mirrored;
		Standard_NODISCARD gp_Elips Mirrored (const gp_Ax1 & A1);

		/****************** Mirrored ******************/
		%feature("compactdefaultargs") Mirrored;
		%feature("autodoc", "* Performs the symmetrical transformation of an ellipse with respect to a plane. The axis placement A2 locates the plane of the symmetry (Location, XDirection, YDirection).
	:param A2:
	:type A2: gp_Ax2
	:rtype: Standard_NODISCARD gp_Elips") Mirrored;
		Standard_NODISCARD gp_Elips Mirrored (const gp_Ax2 & A2);

		/****************** Parameter ******************/
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "* Returns p = (1 - e * e) * MajorRadius where e is the eccentricity of the ellipse. Returns 0 if MajorRadius = 0
	:rtype: float") Parameter;
		Standard_Real Parameter ();

		/****************** Position ******************/
		%feature("compactdefaultargs") Position;
		%feature("autodoc", "* Returns the coordinate system of the ellipse.
	:rtype: gp_Ax2") Position;
		const gp_Ax2  Position ();

		/****************** Rotate ******************/
		%feature("compactdefaultargs") Rotate;
		%feature("autodoc", ":param A1:
	:type A1: gp_Ax1
	:param Ang:
	:type Ang: float
	:rtype: None") Rotate;
		void Rotate (const gp_Ax1 & A1,const Standard_Real Ang);

		/****************** Rotated ******************/
		%feature("compactdefaultargs") Rotated;
		%feature("autodoc", "* Rotates an ellipse. A1 is the axis of the rotation. Ang is the angular value of the rotation in radians.
	:param A1:
	:type A1: gp_Ax1
	:param Ang:
	:type Ang: float
	:rtype: Standard_NODISCARD gp_Elips") Rotated;
		Standard_NODISCARD gp_Elips Rotated (const gp_Ax1 & A1,const Standard_Real Ang);

		/****************** Scale ******************/
		%feature("compactdefaultargs") Scale;
		%feature("autodoc", ":param P:
	:type P: gp_Pnt
	:param S:
	:type S: float
	:rtype: None") Scale;
		void Scale (const gp_Pnt & P,const Standard_Real S);

		/****************** Scaled ******************/
		%feature("compactdefaultargs") Scaled;
		%feature("autodoc", "* Scales an ellipse. S is the scaling value.
	:param P:
	:type P: gp_Pnt
	:param S:
	:type S: float
	:rtype: Standard_NODISCARD gp_Elips") Scaled;
		Standard_NODISCARD gp_Elips Scaled (const gp_Pnt & P,const Standard_Real S);

		/****************** SetAxis ******************/
		%feature("compactdefaultargs") SetAxis;
		%feature("autodoc", "* Changes the axis normal to the plane of the ellipse. It modifies the definition of this plane. The 'XAxis' and the 'YAxis' are recomputed. The local coordinate system is redefined so that: - its origin and 'main Direction' become those of the axis A1 (the 'X Direction' and 'Y Direction' are then recomputed in the same way as for any gp_Ax2), or Raises ConstructionError if the direction of A1 is parallel to the direction of the 'XAxis' of the ellipse.
	:param A1:
	:type A1: gp_Ax1
	:rtype: None") SetAxis;
		void SetAxis (const gp_Ax1 & A1);

		/****************** SetLocation ******************/
		%feature("compactdefaultargs") SetLocation;
		%feature("autodoc", "* Modifies this ellipse, by redefining its local coordinate so that its origin becomes P.
	:param P:
	:type P: gp_Pnt
	:rtype: None") SetLocation;
		void SetLocation (const gp_Pnt & P);

		/****************** SetMajorRadius ******************/
		%feature("compactdefaultargs") SetMajorRadius;
		%feature("autodoc", "* The major radius of the ellipse is on the 'XAxis' (major axis) of the ellipse. Raises ConstructionError if MajorRadius < MinorRadius.
	:param MajorRadius:
	:type MajorRadius: float
	:rtype: None") SetMajorRadius;
		void SetMajorRadius (const Standard_Real MajorRadius);

		/****************** SetMinorRadius ******************/
		%feature("compactdefaultargs") SetMinorRadius;
		%feature("autodoc", "* The minor radius of the ellipse is on the 'YAxis' (minor axis) of the ellipse. Raises ConstructionError if MinorRadius > MajorRadius or MinorRadius < 0.
	:param MinorRadius:
	:type MinorRadius: float
	:rtype: None") SetMinorRadius;
		void SetMinorRadius (const Standard_Real MinorRadius);

		/****************** SetPosition ******************/
		%feature("compactdefaultargs") SetPosition;
		%feature("autodoc", "* Modifies this ellipse, by redefining its local coordinate so that it becomes A2e.
	:param A2:
	:type A2: gp_Ax2
	:rtype: None") SetPosition;
		void SetPosition (const gp_Ax2 & A2);

		/****************** Transform ******************/
		%feature("compactdefaultargs") Transform;
		%feature("autodoc", ":param T:
	:type T: gp_Trsf
	:rtype: None") Transform;
		void Transform (const gp_Trsf & T);

		/****************** Transformed ******************/
		%feature("compactdefaultargs") Transformed;
		%feature("autodoc", "* Transforms an ellipse with the transformation T from class Trsf.
	:param T:
	:type T: gp_Trsf
	:rtype: Standard_NODISCARD gp_Elips") Transformed;
		Standard_NODISCARD gp_Elips Transformed (const gp_Trsf & T);

		/****************** Translate ******************/
		%feature("compactdefaultargs") Translate;
		%feature("autodoc", ":param V:
	:type V: gp_Vec
	:rtype: None") Translate;
		void Translate (const gp_Vec & V);

		/****************** Translate ******************/
		%feature("compactdefaultargs") Translate;
		%feature("autodoc", ":param P1:
	:type P1: gp_Pnt
	:param P2:
	:type P2: gp_Pnt
	:rtype: None") Translate;
		void Translate (const gp_Pnt & P1,const gp_Pnt & P2);

		/****************** Translated ******************/
		%feature("compactdefaultargs") Translated;
		%feature("autodoc", "* Translates an ellipse in the direction of the vector V. The magnitude of the translation is the vector's magnitude.
	:param V:
	:type V: gp_Vec
	:rtype: Standard_NODISCARD gp_Elips") Translated;
		Standard_NODISCARD gp_Elips Translated (const gp_Vec & V);

		/****************** Translated ******************/
		%feature("compactdefaultargs") Translated;
		%feature("autodoc", "* Translates an ellipse from the point P1 to the point P2.
	:param P1:
	:type P1: gp_Pnt
	:param P2:
	:type P2: gp_Pnt
	:rtype: Standard_NODISCARD gp_Elips") Translated;
		Standard_NODISCARD gp_Elips Translated (const gp_Pnt & P1,const gp_Pnt & P2);

		/****************** XAxis ******************/
		%feature("compactdefaultargs") XAxis;
		%feature("autodoc", "* Returns the 'XAxis' of the ellipse whose origin is the center of this ellipse. It is the major axis of the ellipse.
	:rtype: gp_Ax1") XAxis;
		gp_Ax1 XAxis ();

		/****************** YAxis ******************/
		%feature("compactdefaultargs") YAxis;
		%feature("autodoc", "* Returns the 'YAxis' of the ellipse whose unit vector is the 'X Direction' or the 'Y Direction' of the local coordinate system of this ellipse. This is the minor axis of the ellipse.
	:rtype: gp_Ax1") YAxis;
		gp_Ax1 YAxis ();

		/****************** gp_Elips ******************/
		%feature("compactdefaultargs") gp_Elips;
		%feature("autodoc", "* Creates an indefinite ellipse.
	:rtype: None") gp_Elips;
		 gp_Elips ();

		/****************** gp_Elips ******************/
		%feature("compactdefaultargs") gp_Elips;
		%feature("autodoc", "* The major radius of the ellipse is on the 'XAxis' and the minor radius is on the 'YAxis' of the ellipse. The 'XAxis' is defined with the 'XDirection' of A2 and the 'YAxis' is defined with the 'YDirection' of A2. Warnings : It is not forbidden to create an ellipse with MajorRadius = MinorRadius. Raises ConstructionError if MajorRadius < MinorRadius or MinorRadius < 0.
	:param A2:
	:type A2: gp_Ax2
	:param MajorRadius:
	:type MajorRadius: float
	:param MinorRadius:
	:type MinorRadius: float
	:rtype: None") gp_Elips;
		 gp_Elips (const gp_Ax2 & A2,const Standard_Real MajorRadius,const Standard_Real MinorRadius);

};


%extend gp_Elips {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************
* class gp_Elips2d *
*******************/
%nodefaultctor gp_Elips2d;
class gp_Elips2d {
	public:
		/****************** Area ******************/
		%feature("compactdefaultargs") Area;
		%feature("autodoc", "* Computes the area of the ellipse.
	:rtype: float") Area;
		Standard_Real Area ();

		/****************** Axis ******************/
		%feature("compactdefaultargs") Axis;
		%feature("autodoc", "* Returns the major axis of the ellipse.
	:rtype: gp_Ax22d") Axis;
		const gp_Ax22d  Axis ();

		/****************** Coefficients ******************/
		%feature("compactdefaultargs") Coefficients;
		%feature("autodoc", "* Returns the coefficients of the implicit equation of the ellipse. A * (X**2) + B * (Y**2) + 2*C*(X*Y) + 2*D*X + 2*E*Y + F = 0.
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
	:rtype: None") Coefficients;
		void Coefficients (Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);

		/****************** Directrix1 ******************/
		%feature("compactdefaultargs") Directrix1;
		%feature("autodoc", "* This directrix is the line normal to the XAxis of the ellipse in the local plane (Z = 0) at a distance d = MajorRadius / e from the center of the ellipse, where e is the eccentricity of the ellipse. This line is parallel to the 'YAxis'. The intersection point between directrix1 and the 'XAxis' is the location point of the directrix1. This point is on the positive side of the 'XAxis'. //! Raised if Eccentricity = 0.0. (The ellipse degenerates into a circle)
	:rtype: gp_Ax2d") Directrix1;
		gp_Ax2d Directrix1 ();

		/****************** Directrix2 ******************/
		%feature("compactdefaultargs") Directrix2;
		%feature("autodoc", "* This line is obtained by the symmetrical transformation of 'Directrix1' with respect to the minor axis of the ellipse. //! Raised if Eccentricity = 0.0. (The ellipse degenerates into a circle).
	:rtype: gp_Ax2d") Directrix2;
		gp_Ax2d Directrix2 ();

		/****************** Eccentricity ******************/
		%feature("compactdefaultargs") Eccentricity;
		%feature("autodoc", "* Returns the eccentricity of the ellipse between 0.0 and 1.0 If f is the distance between the center of the ellipse and the Focus1 then the eccentricity e = f / MajorRadius. Returns 0 if MajorRadius = 0.
	:rtype: float") Eccentricity;
		Standard_Real Eccentricity ();

		/****************** Focal ******************/
		%feature("compactdefaultargs") Focal;
		%feature("autodoc", "* Returns the distance between the center of the ellipse and focus1 or focus2.
	:rtype: float") Focal;
		Standard_Real Focal ();

		/****************** Focus1 ******************/
		%feature("compactdefaultargs") Focus1;
		%feature("autodoc", "* Returns the first focus of the ellipse. This focus is on the positive side of the major axis of the ellipse.
	:rtype: gp_Pnt2d") Focus1;
		gp_Pnt2d Focus1 ();

		/****************** Focus2 ******************/
		%feature("compactdefaultargs") Focus2;
		%feature("autodoc", "* Returns the second focus of the ellipse. This focus is on the negative side of the major axis of the ellipse.
	:rtype: gp_Pnt2d") Focus2;
		gp_Pnt2d Focus2 ();

		/****************** IsDirect ******************/
		%feature("compactdefaultargs") IsDirect;
		%feature("autodoc", "* Returns true if the local coordinate system is direct and false in the other case.
	:rtype: bool") IsDirect;
		Standard_Boolean IsDirect ();

		/****************** Location ******************/
		%feature("compactdefaultargs") Location;
		%feature("autodoc", "* Returns the center of the ellipse.
	:rtype: gp_Pnt2d") Location;
		const gp_Pnt2d  Location ();

		/****************** MajorRadius ******************/
		%feature("compactdefaultargs") MajorRadius;
		%feature("autodoc", "* Returns the major radius of the Ellipse.
	:rtype: float") MajorRadius;
		Standard_Real MajorRadius ();

		/****************** MinorRadius ******************/
		%feature("compactdefaultargs") MinorRadius;
		%feature("autodoc", "* Returns the minor radius of the Ellipse.
	:rtype: float") MinorRadius;
		Standard_Real MinorRadius ();

		/****************** Mirror ******************/
		%feature("compactdefaultargs") Mirror;
		%feature("autodoc", ":param P:
	:type P: gp_Pnt2d
	:rtype: None") Mirror;
		void Mirror (const gp_Pnt2d & P);

		/****************** Mirror ******************/
		%feature("compactdefaultargs") Mirror;
		%feature("autodoc", ":param A:
	:type A: gp_Ax2d
	:rtype: None") Mirror;
		void Mirror (const gp_Ax2d & A);

		/****************** Mirrored ******************/
		%feature("compactdefaultargs") Mirrored;
		%feature("autodoc", "* Performs the symmetrical transformation of a ellipse with respect to the point P which is the center of the symmetry
	:param P:
	:type P: gp_Pnt2d
	:rtype: Standard_NODISCARD gp_Elips2d") Mirrored;
		Standard_NODISCARD gp_Elips2d Mirrored (const gp_Pnt2d & P);

		/****************** Mirrored ******************/
		%feature("compactdefaultargs") Mirrored;
		%feature("autodoc", "* Performs the symmetrical transformation of a ellipse with respect to an axis placement which is the axis of the symmetry.
	:param A:
	:type A: gp_Ax2d
	:rtype: Standard_NODISCARD gp_Elips2d") Mirrored;
		Standard_NODISCARD gp_Elips2d Mirrored (const gp_Ax2d & A);

		/****************** Parameter ******************/
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "* Returns p = (1 - e * e) * MajorRadius where e is the eccentricity of the ellipse. Returns 0 if MajorRadius = 0
	:rtype: float") Parameter;
		Standard_Real Parameter ();

		/****************** Reverse ******************/
		%feature("compactdefaultargs") Reverse;
		%feature("autodoc", ":rtype: None") Reverse;
		void Reverse ();

		/****************** Reversed ******************/
		%feature("compactdefaultargs") Reversed;
		%feature("autodoc", ":rtype: Standard_NODISCARD gp_Elips2d") Reversed;
		Standard_NODISCARD gp_Elips2d Reversed ();

		/****************** Rotate ******************/
		%feature("compactdefaultargs") Rotate;
		%feature("autodoc", ":param P:
	:type P: gp_Pnt2d
	:param Ang:
	:type Ang: float
	:rtype: None") Rotate;
		void Rotate (const gp_Pnt2d & P,const Standard_Real Ang);

		/****************** Rotated ******************/
		%feature("compactdefaultargs") Rotated;
		%feature("autodoc", ":param P:
	:type P: gp_Pnt2d
	:param Ang:
	:type Ang: float
	:rtype: Standard_NODISCARD gp_Elips2d") Rotated;
		Standard_NODISCARD gp_Elips2d Rotated (const gp_Pnt2d & P,const Standard_Real Ang);

		/****************** Scale ******************/
		%feature("compactdefaultargs") Scale;
		%feature("autodoc", ":param P:
	:type P: gp_Pnt2d
	:param S:
	:type S: float
	:rtype: None") Scale;
		void Scale (const gp_Pnt2d & P,const Standard_Real S);

		/****************** Scaled ******************/
		%feature("compactdefaultargs") Scaled;
		%feature("autodoc", "* Scales a ellipse. S is the scaling value.
	:param P:
	:type P: gp_Pnt2d
	:param S:
	:type S: float
	:rtype: Standard_NODISCARD gp_Elips2d") Scaled;
		Standard_NODISCARD gp_Elips2d Scaled (const gp_Pnt2d & P,const Standard_Real S);

		/****************** SetAxis ******************/
		%feature("compactdefaultargs") SetAxis;
		%feature("autodoc", "* Modifies this ellipse, by redefining its local coordinate system so that it becomes A.
	:param A:
	:type A: gp_Ax22d
	:rtype: None") SetAxis;
		void SetAxis (const gp_Ax22d & A);

		/****************** SetLocation ******************/
		%feature("compactdefaultargs") SetLocation;
		%feature("autodoc", "* Modifies this ellipse, by redefining its local coordinate system so that - its origin becomes P.
	:param P:
	:type P: gp_Pnt2d
	:rtype: None") SetLocation;
		void SetLocation (const gp_Pnt2d & P);

		/****************** SetMajorRadius ******************/
		%feature("compactdefaultargs") SetMajorRadius;
		%feature("autodoc", "* Changes the value of the major radius. Raises ConstructionError if MajorRadius < MinorRadius.
	:param MajorRadius:
	:type MajorRadius: float
	:rtype: None") SetMajorRadius;
		void SetMajorRadius (const Standard_Real MajorRadius);

		/****************** SetMinorRadius ******************/
		%feature("compactdefaultargs") SetMinorRadius;
		%feature("autodoc", "* Changes the value of the minor radius. Raises ConstructionError if MajorRadius < MinorRadius or MinorRadius < 0.0
	:param MinorRadius:
	:type MinorRadius: float
	:rtype: None") SetMinorRadius;
		void SetMinorRadius (const Standard_Real MinorRadius);

		/****************** SetXAxis ******************/
		%feature("compactdefaultargs") SetXAxis;
		%feature("autodoc", "* Modifies this ellipse, by redefining its local coordinate system so that its origin and its 'X Direction' become those of the axis A. The 'Y Direction' is then recomputed. The orientation of the local coordinate system is not modified.
	:param A:
	:type A: gp_Ax2d
	:rtype: None") SetXAxis;
		void SetXAxis (const gp_Ax2d & A);

		/****************** SetYAxis ******************/
		%feature("compactdefaultargs") SetYAxis;
		%feature("autodoc", "* Modifies this ellipse, by redefining its local coordinate system so that its origin and its 'Y Direction' become those of the axis A. The 'X Direction' is then recomputed. The orientation of the local coordinate system is not modified.
	:param A:
	:type A: gp_Ax2d
	:rtype: None") SetYAxis;
		void SetYAxis (const gp_Ax2d & A);

		/****************** Transform ******************/
		%feature("compactdefaultargs") Transform;
		%feature("autodoc", ":param T:
	:type T: gp_Trsf2d
	:rtype: None") Transform;
		void Transform (const gp_Trsf2d & T);

		/****************** Transformed ******************/
		%feature("compactdefaultargs") Transformed;
		%feature("autodoc", "* Transforms an ellipse with the transformation T from class Trsf2d.
	:param T:
	:type T: gp_Trsf2d
	:rtype: Standard_NODISCARD gp_Elips2d") Transformed;
		Standard_NODISCARD gp_Elips2d Transformed (const gp_Trsf2d & T);

		/****************** Translate ******************/
		%feature("compactdefaultargs") Translate;
		%feature("autodoc", ":param V:
	:type V: gp_Vec2d
	:rtype: None") Translate;
		void Translate (const gp_Vec2d & V);

		/****************** Translate ******************/
		%feature("compactdefaultargs") Translate;
		%feature("autodoc", ":param P1:
	:type P1: gp_Pnt2d
	:param P2:
	:type P2: gp_Pnt2d
	:rtype: None") Translate;
		void Translate (const gp_Pnt2d & P1,const gp_Pnt2d & P2);

		/****************** Translated ******************/
		%feature("compactdefaultargs") Translated;
		%feature("autodoc", "* Translates a ellipse in the direction of the vector V. The magnitude of the translation is the vector's magnitude.
	:param V:
	:type V: gp_Vec2d
	:rtype: Standard_NODISCARD gp_Elips2d") Translated;
		Standard_NODISCARD gp_Elips2d Translated (const gp_Vec2d & V);

		/****************** Translated ******************/
		%feature("compactdefaultargs") Translated;
		%feature("autodoc", "* Translates a ellipse from the point P1 to the point P2.
	:param P1:
	:type P1: gp_Pnt2d
	:param P2:
	:type P2: gp_Pnt2d
	:rtype: Standard_NODISCARD gp_Elips2d") Translated;
		Standard_NODISCARD gp_Elips2d Translated (const gp_Pnt2d & P1,const gp_Pnt2d & P2);

		/****************** XAxis ******************/
		%feature("compactdefaultargs") XAxis;
		%feature("autodoc", "* Returns the major axis of the ellipse.
	:rtype: gp_Ax2d") XAxis;
		gp_Ax2d XAxis ();

		/****************** YAxis ******************/
		%feature("compactdefaultargs") YAxis;
		%feature("autodoc", "* Returns the minor axis of the ellipse. Reverses the direction of the circle.
	:rtype: gp_Ax2d") YAxis;
		gp_Ax2d YAxis ();

		/****************** gp_Elips2d ******************/
		%feature("compactdefaultargs") gp_Elips2d;
		%feature("autodoc", "* Creates an indefinite ellipse.
	:rtype: None") gp_Elips2d;
		 gp_Elips2d ();

		/****************** gp_Elips2d ******************/
		%feature("compactdefaultargs") gp_Elips2d;
		%feature("autodoc", "* Creates an ellipse with the major axis, the major and the minor radius. The location of the MajorAxis is the center of the ellipse. The sense of parametrization is given by Sense. Warnings : It is possible to create an ellipse with MajorRadius = MinorRadius. Raises ConstructionError if MajorRadius < MinorRadius or MinorRadius < 0.0
	:param MajorAxis:
	:type MajorAxis: gp_Ax2d
	:param MajorRadius:
	:type MajorRadius: float
	:param MinorRadius:
	:type MinorRadius: float
	:param Sense: default value is Standard_True
	:type Sense: bool
	:rtype: None") gp_Elips2d;
		 gp_Elips2d (const gp_Ax2d & MajorAxis,const Standard_Real MajorRadius,const Standard_Real MinorRadius,const Standard_Boolean Sense = Standard_True);

		/****************** gp_Elips2d ******************/
		%feature("compactdefaultargs") gp_Elips2d;
		%feature("autodoc", "* Creates an ellipse with radii MajorRadius and MinorRadius, positioned in the plane by coordinate system A where: - the origin of A is the center of the ellipse, - the 'X Direction' of A defines the major axis of the ellipse, that is, the major radius MajorRadius is measured along this axis, and - the 'Y Direction' of A defines the minor axis of the ellipse, that is, the minor radius MinorRadius is measured along this axis, and - the orientation (direct or indirect sense) of A gives the orientation of the ellipse. Warnings : It is possible to create an ellipse with MajorRadius = MinorRadius. Raises ConstructionError if MajorRadius < MinorRadius or MinorRadius < 0.0
	:param A:
	:type A: gp_Ax22d
	:param MajorRadius:
	:type MajorRadius: float
	:param MinorRadius:
	:type MinorRadius: float
	:rtype: None") gp_Elips2d;
		 gp_Elips2d (const gp_Ax22d & A,const Standard_Real MajorRadius,const Standard_Real MinorRadius);

};


%extend gp_Elips2d {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************
* class gp_GTrsf *
*****************/
%nodefaultctor gp_GTrsf;
class gp_GTrsf {
	public:
		/****************** Form ******************/
		%feature("compactdefaultargs") Form;
		%feature("autodoc", "* Returns the nature of the transformation. It can be an identity transformation, a rotation, a translation, a mirror transformation (relative to a point, an axis or a plane), a scaling transformation, a compound transformation or some other type of transformation.
	:rtype: gp_TrsfForm") Form;
		gp_TrsfForm Form ();

		/****************** Invert ******************/
		%feature("compactdefaultargs") Invert;
		%feature("autodoc", ":rtype: None") Invert;
		void Invert ();

		/****************** Inverted ******************/
		%feature("compactdefaultargs") Inverted;
		%feature("autodoc", "* Computes the reverse transformation. Raises an exception if the matrix of the transformation is not inversible.
	:rtype: Standard_NODISCARD gp_GTrsf") Inverted;
		Standard_NODISCARD gp_GTrsf Inverted ();

		/****************** IsNegative ******************/
		%feature("compactdefaultargs") IsNegative;
		%feature("autodoc", "* Returns true if the determinant of the vectorial part of this transformation is negative.
	:rtype: bool") IsNegative;
		Standard_Boolean IsNegative ();

		/****************** IsSingular ******************/
		%feature("compactdefaultargs") IsSingular;
		%feature("autodoc", "* Returns true if this transformation is singular (and therefore, cannot be inverted). Note: The Gauss LU decomposition is used to invert the transformation matrix. Consequently, the transformation is considered as singular if the largest pivot found is less than or equal to gp::Resolution(). Warning If this transformation is singular, it cannot be inverted.
	:rtype: bool") IsSingular;
		Standard_Boolean IsSingular ();

		/****************** Multiplied ******************/
		%feature("compactdefaultargs") Multiplied;
		%feature("autodoc", "* Computes the transformation composed from T and <self>. In a C++ implementation you can also write Tcomposed = <self> * T. Example : GTrsf T1, T2, Tcomp; ............... //composition : Tcomp = T2.Multiplied(T1); // or (Tcomp = T2 * T1) // transformation of a point XYZ P(10.,3.,4.); XYZ P1(P); Tcomp.Transforms(P1); //using Tcomp XYZ P2(P); T1.Transforms(P2); //using T1 then T2 T2.Transforms(P2); // P1 = P2 !!!
	:param T:
	:type T: gp_GTrsf
	:rtype: Standard_NODISCARD gp_GTrsf") Multiplied;
		Standard_NODISCARD gp_GTrsf Multiplied (const gp_GTrsf & T);

		/****************** Multiply ******************/
		%feature("compactdefaultargs") Multiply;
		%feature("autodoc", "* Computes the transformation composed with <self> and T. <self> = <self> * T
	:param T:
	:type T: gp_GTrsf
	:rtype: None") Multiply;
		void Multiply (const gp_GTrsf & T);

		/****************** Power ******************/
		%feature("compactdefaultargs") Power;
		%feature("autodoc", ":param N:
	:type N: int
	:rtype: None") Power;
		void Power (const Standard_Integer N);

		/****************** Powered ******************/
		%feature("compactdefaultargs") Powered;
		%feature("autodoc", "* Computes: - the product of this transformation multiplied by itself N times, if N is positive, or - the product of the inverse of this transformation multiplied by itself |N| times, if N is negative. If N equals zero, the result is equal to the Identity transformation. I.e.: <self> * <self> * .......* <self>, N time. if N =0 <self> = Identity if N < 0 <self> = <self>.Inverse() *...........* <self>.Inverse(). //! Raises an exception if N < 0 and if the matrix of the transformation not inversible.
	:param N:
	:type N: int
	:rtype: Standard_NODISCARD gp_GTrsf") Powered;
		Standard_NODISCARD gp_GTrsf Powered (const Standard_Integer N);

		/****************** PreMultiply ******************/
		%feature("compactdefaultargs") PreMultiply;
		%feature("autodoc", "* Computes the product of the transformation T and this transformation and assigns the result to this transformation. this = T * this
	:param T:
	:type T: gp_GTrsf
	:rtype: None") PreMultiply;
		void PreMultiply (const gp_GTrsf & T);

		/****************** SetAffinity ******************/
		%feature("compactdefaultargs") SetAffinity;
		%feature("autodoc", "* Changes this transformation into an affinity of ratio Ratio with respect to the axis A1. Note: an affinity is a point-by-point transformation that transforms any point P into a point P' such that if H is the orthogonal projection of P on the axis A1 or the plane A2, the vectors HP and HP' satisfy: HP' = Ratio * HP.
	:param A1:
	:type A1: gp_Ax1
	:param Ratio:
	:type Ratio: float
	:rtype: None") SetAffinity;
		void SetAffinity (const gp_Ax1 & A1,const Standard_Real Ratio);

		/****************** SetAffinity ******************/
		%feature("compactdefaultargs") SetAffinity;
		%feature("autodoc", "* Changes this transformation into an affinity of ratio Ratio with respect to the plane defined by the origin, the 'X Direction' and the 'Y Direction' of coordinate system A2. Note: an affinity is a point-by-point transformation that transforms any point P into a point P' such that if H is the orthogonal projection of P on the axis A1 or the plane A2, the vectors HP and HP' satisfy: HP' = Ratio * HP.
	:param A2:
	:type A2: gp_Ax2
	:param Ratio:
	:type Ratio: float
	:rtype: None") SetAffinity;
		void SetAffinity (const gp_Ax2 & A2,const Standard_Real Ratio);

		/****************** SetForm ******************/
		%feature("compactdefaultargs") SetForm;
		%feature("autodoc", "* verify and set the shape of the GTrsf Other or CompoundTrsf Ex : myGTrsf.SetValue(row1,col1,val1); myGTrsf.SetValue(row2,col2,val2); ... myGTrsf.SetForm();
	:rtype: None") SetForm;
		void SetForm ();

		/****************** SetTranslationPart ******************/
		%feature("compactdefaultargs") SetTranslationPart;
		%feature("autodoc", "* Replaces the translation part of this transformation by the coordinates of the number triple Coord.
	:param Coord:
	:type Coord: gp_XYZ
	:rtype: None") SetTranslationPart;
		void SetTranslationPart (const gp_XYZ & Coord);

		/****************** SetTrsf ******************/
		%feature("compactdefaultargs") SetTrsf;
		%feature("autodoc", "* Assigns the vectorial and translation parts of T to this transformation.
	:param T:
	:type T: gp_Trsf
	:rtype: None") SetTrsf;
		void SetTrsf (const gp_Trsf & T);

		/****************** SetValue ******************/
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "* Replaces the coefficient (Row, Col) of the matrix representing this transformation by Value. Raises OutOfRange if Row < 1 or Row > 3 or Col < 1 or Col > 4
	:param Row:
	:type Row: int
	:param Col:
	:type Col: int
	:param Value:
	:type Value: float
	:rtype: None") SetValue;
		void SetValue (const Standard_Integer Row,const Standard_Integer Col,const Standard_Real Value);

		/****************** SetVectorialPart ******************/
		%feature("compactdefaultargs") SetVectorialPart;
		%feature("autodoc", "* Replaces the vectorial part of this transformation by Matrix.
	:param Matrix:
	:type Matrix: gp_Mat
	:rtype: None") SetVectorialPart;
		void SetVectorialPart (const gp_Mat & Matrix);

		/****************** Transforms ******************/
		%feature("compactdefaultargs") Transforms;
		%feature("autodoc", ":param Coord:
	:type Coord: gp_XYZ
	:rtype: None") Transforms;
		void Transforms (gp_XYZ & Coord);

		/****************** Transforms ******************/
		%feature("compactdefaultargs") Transforms;
		%feature("autodoc", "* Transforms a triplet XYZ with a GTrsf.
	:param X:
	:type X: float &
	:param Y:
	:type Y: float &
	:param Z:
	:type Z: float &
	:rtype: None") Transforms;
		void Transforms (Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);

		/****************** TranslationPart ******************/
		%feature("compactdefaultargs") TranslationPart;
		%feature("autodoc", "* Returns the translation part of the GTrsf.
	:rtype: gp_XYZ") TranslationPart;
		const gp_XYZ  TranslationPart ();

		/****************** Trsf ******************/
		%feature("compactdefaultargs") Trsf;
		%feature("autodoc", ":rtype: gp_Trsf") Trsf;
		gp_Trsf Trsf ();

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "* Returns the coefficients of the global matrix of transformation. Raises OutOfRange if Row < 1 or Row > 3 or Col < 1 or Col > 4
	:param Row:
	:type Row: int
	:param Col:
	:type Col: int
	:rtype: float") Value;
		Standard_Real Value (const Standard_Integer Row,const Standard_Integer Col);

		/****************** VectorialPart ******************/
		%feature("compactdefaultargs") VectorialPart;
		%feature("autodoc", "* Computes the vectorial part of the GTrsf. The returned Matrix is a 3*3 matrix.
	:rtype: gp_Mat") VectorialPart;
		const gp_Mat  VectorialPart ();

		/****************** gp_GTrsf ******************/
		%feature("compactdefaultargs") gp_GTrsf;
		%feature("autodoc", "* Returns the Identity transformation.
	:rtype: None") gp_GTrsf;
		 gp_GTrsf ();

		/****************** gp_GTrsf ******************/
		%feature("compactdefaultargs") gp_GTrsf;
		%feature("autodoc", "* Converts the gp_Trsf transformation T into a general transformation, i.e. Returns a GTrsf with the same matrix of coefficients as the Trsf T.
	:param T:
	:type T: gp_Trsf
	:rtype: None") gp_GTrsf;
		 gp_GTrsf (const gp_Trsf & T);

		/****************** gp_GTrsf ******************/
		%feature("compactdefaultargs") gp_GTrsf;
		%feature("autodoc", "* Creates a transformation based on the matrix M and the vector V where M defines the vectorial part of the transformation, and V the translation part, or
	:param M:
	:type M: gp_Mat
	:param V:
	:type V: gp_XYZ
	:rtype: None") gp_GTrsf;
		 gp_GTrsf (const gp_Mat & M,const gp_XYZ & V);

		/****************** operator * ******************/
		%feature("compactdefaultargs") operator *;
		%feature("autodoc", ":param T:
	:type T: gp_GTrsf
	:rtype: Standard_NODISCARD gp_GTrsf") operator *;
		Standard_NODISCARD gp_GTrsf operator * (const gp_GTrsf & T);


        %extend{
            void __imul_wrapper__(const gp_GTrsf  other) {
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
%nodefaultctor gp_GTrsf2d;
class gp_GTrsf2d {
	public:
		/****************** Form ******************/
		%feature("compactdefaultargs") Form;
		%feature("autodoc", "* Returns the nature of the transformation. It can be an identity transformation, a rotation, a translation, a mirror transformation (relative to a point or axis), a scaling transformation, a compound transformation or some other type of transformation.
	:rtype: gp_TrsfForm") Form;
		gp_TrsfForm Form ();

		/****************** Invert ******************/
		%feature("compactdefaultargs") Invert;
		%feature("autodoc", ":rtype: None") Invert;
		void Invert ();

		/****************** Inverted ******************/
		%feature("compactdefaultargs") Inverted;
		%feature("autodoc", "* Computes the reverse transformation. Raised an exception if the matrix of the transformation is not inversible.
	:rtype: Standard_NODISCARD gp_GTrsf2d") Inverted;
		Standard_NODISCARD gp_GTrsf2d Inverted ();

		/****************** IsNegative ******************/
		%feature("compactdefaultargs") IsNegative;
		%feature("autodoc", "* Returns true if the determinant of the vectorial part of this transformation is negative.
	:rtype: bool") IsNegative;
		Standard_Boolean IsNegative ();

		/****************** IsSingular ******************/
		%feature("compactdefaultargs") IsSingular;
		%feature("autodoc", "* Returns true if this transformation is singular (and therefore, cannot be inverted). Note: The Gauss LU decomposition is used to invert the transformation matrix. Consequently, the transformation is considered as singular if the largest pivot found is less than or equal to gp::Resolution(). Warning If this transformation is singular, it cannot be inverted.
	:rtype: bool") IsSingular;
		Standard_Boolean IsSingular ();

		/****************** Multiplied ******************/
		%feature("compactdefaultargs") Multiplied;
		%feature("autodoc", "* Computes the transformation composed with T and <self>. In a C++ implementation you can also write Tcomposed = <self> * T. Example : GTrsf2d T1, T2, Tcomp; ............... //composition : Tcomp = T2.Multiplied(T1); // or (Tcomp = T2 * T1) // transformation of a point XY P(10.,3.); XY P1(P); Tcomp.Transforms(P1); //using Tcomp XY P2(P); T1.Transforms(P2); //using T1 then T2 T2.Transforms(P2); // P1 = P2 !!!
	:param T:
	:type T: gp_GTrsf2d
	:rtype: Standard_NODISCARD gp_GTrsf2d") Multiplied;
		Standard_NODISCARD gp_GTrsf2d Multiplied (const gp_GTrsf2d & T);

		/****************** Multiply ******************/
		%feature("compactdefaultargs") Multiply;
		%feature("autodoc", ":param T:
	:type T: gp_GTrsf2d
	:rtype: None") Multiply;
		void Multiply (const gp_GTrsf2d & T);

		/****************** Power ******************/
		%feature("compactdefaultargs") Power;
		%feature("autodoc", ":param N:
	:type N: int
	:rtype: None") Power;
		void Power (const Standard_Integer N);

		/****************** Powered ******************/
		%feature("compactdefaultargs") Powered;
		%feature("autodoc", "* Computes the following composition of transformations <self> * <self> * .......* <self>, N time. if N = 0 <self> = Identity if N < 0 <self> = <self>.Inverse() *...........* <self>.Inverse(). //! Raises an exception if N < 0 and if the matrix of the transformation is not inversible.
	:param N:
	:type N: int
	:rtype: Standard_NODISCARD gp_GTrsf2d") Powered;
		Standard_NODISCARD gp_GTrsf2d Powered (const Standard_Integer N);

		/****************** PreMultiply ******************/
		%feature("compactdefaultargs") PreMultiply;
		%feature("autodoc", "* Computes the product of the transformation T and this transformation, and assigns the result to this transformation: this = T * this
	:param T:
	:type T: gp_GTrsf2d
	:rtype: None") PreMultiply;
		void PreMultiply (const gp_GTrsf2d & T);

		/****************** SetAffinity ******************/
		%feature("compactdefaultargs") SetAffinity;
		%feature("autodoc", "* Changes this transformation into an affinity of ratio Ratio with respect to the axis A. Note: An affinity is a point-by-point transformation that transforms any point P into a point P' such that if H is the orthogonal projection of P on the axis A, the vectors HP and HP' satisfy: HP' = Ratio * HP.
	:param A:
	:type A: gp_Ax2d
	:param Ratio:
	:type Ratio: float
	:rtype: None") SetAffinity;
		void SetAffinity (const gp_Ax2d & A,const Standard_Real Ratio);

		/****************** SetTranslationPart ******************/
		%feature("compactdefaultargs") SetTranslationPart;
		%feature("autodoc", "* Replacesthe translation part of this transformation by the coordinates of the number pair Coord.
	:param Coord:
	:type Coord: gp_XY
	:rtype: None") SetTranslationPart;
		void SetTranslationPart (const gp_XY & Coord);

		/****************** SetTrsf2d ******************/
		%feature("compactdefaultargs") SetTrsf2d;
		%feature("autodoc", "* Assigns the vectorial and translation parts of T to this transformation.
	:param T:
	:type T: gp_Trsf2d
	:rtype: None") SetTrsf2d;
		void SetTrsf2d (const gp_Trsf2d & T);

		/****************** SetValue ******************/
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "* Replaces the coefficient (Row, Col) of the matrix representing this transformation by Value, Raises OutOfRange if Row < 1 or Row > 2 or Col < 1 or Col > 3
	:param Row:
	:type Row: int
	:param Col:
	:type Col: int
	:param Value:
	:type Value: float
	:rtype: None") SetValue;
		void SetValue (const Standard_Integer Row,const Standard_Integer Col,const Standard_Real Value);

		/****************** SetVectorialPart ******************/
		%feature("compactdefaultargs") SetVectorialPart;
		%feature("autodoc", "* Replaces the vectorial part of this transformation by Matrix.
	:param Matrix:
	:type Matrix: gp_Mat2d
	:rtype: None") SetVectorialPart;
		void SetVectorialPart (const gp_Mat2d & Matrix);

		/****************** Transformed ******************/
		%feature("compactdefaultargs") Transformed;
		%feature("autodoc", ":param Coord:
	:type Coord: gp_XY
	:rtype: Standard_NODISCARD gp_XY") Transformed;
		Standard_NODISCARD gp_XY Transformed (const gp_XY & Coord);

		/****************** Transforms ******************/
		%feature("compactdefaultargs") Transforms;
		%feature("autodoc", ":param Coord:
	:type Coord: gp_XY
	:rtype: None") Transforms;
		void Transforms (gp_XY & Coord);

		/****************** Transforms ******************/
		%feature("compactdefaultargs") Transforms;
		%feature("autodoc", "* Applies this transformation to the coordinates: - of the number pair Coord, or - X and Y. //! Note: - Transforms modifies X, Y, or the coordinate pair Coord, while - Transformed creates a new coordinate pair.
	:param X:
	:type X: float &
	:param Y:
	:type Y: float &
	:rtype: None") Transforms;
		void Transforms (Standard_Real &OutValue,Standard_Real &OutValue);

		/****************** TranslationPart ******************/
		%feature("compactdefaultargs") TranslationPart;
		%feature("autodoc", "* Returns the translation part of the GTrsf2d.
	:rtype: gp_XY") TranslationPart;
		const gp_XY  TranslationPart ();

		/****************** Trsf2d ******************/
		%feature("compactdefaultargs") Trsf2d;
		%feature("autodoc", "* Converts this transformation into a gp_Trsf2d transformation. Exceptions Standard_ConstructionError if this transformation cannot be converted, i.e. if its form is gp_Other.
	:rtype: gp_Trsf2d") Trsf2d;
		gp_Trsf2d Trsf2d ();

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "* Returns the coefficients of the global matrix of transformation. Raised OutOfRange if Row < 1 or Row > 2 or Col < 1 or Col > 3
	:param Row:
	:type Row: int
	:param Col:
	:type Col: int
	:rtype: float") Value;
		Standard_Real Value (const Standard_Integer Row,const Standard_Integer Col);

		/****************** VectorialPart ******************/
		%feature("compactdefaultargs") VectorialPart;
		%feature("autodoc", "* Computes the vectorial part of the GTrsf2d. The returned Matrix is a 2*2 matrix.
	:rtype: gp_Mat2d") VectorialPart;
		const gp_Mat2d  VectorialPart ();

		/****************** gp_GTrsf2d ******************/
		%feature("compactdefaultargs") gp_GTrsf2d;
		%feature("autodoc", "* returns identity transformation.
	:rtype: None") gp_GTrsf2d;
		 gp_GTrsf2d ();

		/****************** gp_GTrsf2d ******************/
		%feature("compactdefaultargs") gp_GTrsf2d;
		%feature("autodoc", "* Converts the gp_Trsf2d transformation T into a general transformation.
	:param T:
	:type T: gp_Trsf2d
	:rtype: None") gp_GTrsf2d;
		 gp_GTrsf2d (const gp_Trsf2d & T);

		/****************** gp_GTrsf2d ******************/
		%feature("compactdefaultargs") gp_GTrsf2d;
		%feature("autodoc", "* Creates a transformation based on the matrix M and the vector V where M defines the vectorial part of the transformation, and V the translation part.
	:param M:
	:type M: gp_Mat2d
	:param V:
	:type V: gp_XY
	:rtype: None") gp_GTrsf2d;
		 gp_GTrsf2d (const gp_Mat2d & M,const gp_XY & V);

		/****************** operator * ******************/
		%feature("compactdefaultargs") operator *;
		%feature("autodoc", ":param T:
	:type T: gp_GTrsf2d
	:rtype: Standard_NODISCARD gp_GTrsf2d") operator *;
		Standard_NODISCARD gp_GTrsf2d operator * (const gp_GTrsf2d & T);


        %extend{
            void __imul_wrapper__(const gp_GTrsf2d  other) {
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
%nodefaultctor gp_Hypr;
class gp_Hypr {
	public:
		/****************** Asymptote1 ******************/
		%feature("compactdefaultargs") Asymptote1;
		%feature("autodoc", "* In the local coordinate system of the hyperbola the equation of the hyperbola is (X*X)/(A*A) - (Y*Y)/(B*B) = 1.0 and the equation of the first asymptote is Y = (B/A)*X where A is the major radius and B is the minor radius. Raises ConstructionError if MajorRadius = 0.0
	:rtype: gp_Ax1") Asymptote1;
		gp_Ax1 Asymptote1 ();

		/****************** Asymptote2 ******************/
		%feature("compactdefaultargs") Asymptote2;
		%feature("autodoc", "* In the local coordinate system of the hyperbola the equation of the hyperbola is (X*X)/(A*A) - (Y*Y)/(B*B) = 1.0 and the equation of the first asymptote is Y = -(B/A)*X. where A is the major radius and B is the minor radius. Raises ConstructionError if MajorRadius = 0.0
	:rtype: gp_Ax1") Asymptote2;
		gp_Ax1 Asymptote2 ();

		/****************** Axis ******************/
		%feature("compactdefaultargs") Axis;
		%feature("autodoc", "* Returns the axis passing through the center, and normal to the plane of this hyperbola.
	:rtype: gp_Ax1") Axis;
		const gp_Ax1  Axis ();

		/****************** ConjugateBranch1 ******************/
		%feature("compactdefaultargs") ConjugateBranch1;
		%feature("autodoc", "* Computes the branch of hyperbola which is on the positive side of the 'YAxis' of <self>.
	:rtype: gp_Hypr") ConjugateBranch1;
		gp_Hypr ConjugateBranch1 ();

		/****************** ConjugateBranch2 ******************/
		%feature("compactdefaultargs") ConjugateBranch2;
		%feature("autodoc", "* Computes the branch of hyperbola which is on the negative side of the 'YAxis' of <self>.
	:rtype: gp_Hypr") ConjugateBranch2;
		gp_Hypr ConjugateBranch2 ();

		/****************** Directrix1 ******************/
		%feature("compactdefaultargs") Directrix1;
		%feature("autodoc", "* This directrix is the line normal to the XAxis of the hyperbola in the local plane (Z = 0) at a distance d = MajorRadius / e from the center of the hyperbola, where e is the eccentricity of the hyperbola. This line is parallel to the 'YAxis'. The intersection point between the directrix1 and the 'XAxis' is the 'Location' point of the directrix1. This point is on the positive side of the 'XAxis'.
	:rtype: gp_Ax1") Directrix1;
		gp_Ax1 Directrix1 ();

		/****************** Directrix2 ******************/
		%feature("compactdefaultargs") Directrix2;
		%feature("autodoc", "* This line is obtained by the symmetrical transformation of 'Directrix1' with respect to the 'YAxis' of the hyperbola.
	:rtype: gp_Ax1") Directrix2;
		gp_Ax1 Directrix2 ();

		/****************** Eccentricity ******************/
		%feature("compactdefaultargs") Eccentricity;
		%feature("autodoc", "* Returns the excentricity of the hyperbola (e > 1). If f is the distance between the location of the hyperbola and the Focus1 then the eccentricity e = f / MajorRadius. Raises DomainError if MajorRadius = 0.0
	:rtype: float") Eccentricity;
		Standard_Real Eccentricity ();

		/****************** Focal ******************/
		%feature("compactdefaultargs") Focal;
		%feature("autodoc", "* Computes the focal distance. It is the distance between the the two focus of the hyperbola.
	:rtype: float") Focal;
		Standard_Real Focal ();

		/****************** Focus1 ******************/
		%feature("compactdefaultargs") Focus1;
		%feature("autodoc", "* Returns the first focus of the hyperbola. This focus is on the positive side of the 'XAxis' of the hyperbola.
	:rtype: gp_Pnt") Focus1;
		gp_Pnt Focus1 ();

		/****************** Focus2 ******************/
		%feature("compactdefaultargs") Focus2;
		%feature("autodoc", "* Returns the second focus of the hyperbola. This focus is on the negative side of the 'XAxis' of the hyperbola.
	:rtype: gp_Pnt") Focus2;
		gp_Pnt Focus2 ();

		/****************** Location ******************/
		%feature("compactdefaultargs") Location;
		%feature("autodoc", "* Returns the location point of the hyperbola. It is the intersection point between the 'XAxis' and the 'YAxis'.
	:rtype: gp_Pnt") Location;
		const gp_Pnt  Location ();

		/****************** MajorRadius ******************/
		%feature("compactdefaultargs") MajorRadius;
		%feature("autodoc", "* Returns the major radius of the hyperbola. It is the radius on the 'XAxis' of the hyperbola.
	:rtype: float") MajorRadius;
		Standard_Real MajorRadius ();

		/****************** MinorRadius ******************/
		%feature("compactdefaultargs") MinorRadius;
		%feature("autodoc", "* Returns the minor radius of the hyperbola. It is the radius on the 'YAxis' of the hyperbola.
	:rtype: float") MinorRadius;
		Standard_Real MinorRadius ();

		/****************** Mirror ******************/
		%feature("compactdefaultargs") Mirror;
		%feature("autodoc", ":param P:
	:type P: gp_Pnt
	:rtype: None") Mirror;
		void Mirror (const gp_Pnt & P);

		/****************** Mirror ******************/
		%feature("compactdefaultargs") Mirror;
		%feature("autodoc", ":param A1:
	:type A1: gp_Ax1
	:rtype: None") Mirror;
		void Mirror (const gp_Ax1 & A1);

		/****************** Mirror ******************/
		%feature("compactdefaultargs") Mirror;
		%feature("autodoc", ":param A2:
	:type A2: gp_Ax2
	:rtype: None") Mirror;
		void Mirror (const gp_Ax2 & A2);

		/****************** Mirrored ******************/
		%feature("compactdefaultargs") Mirrored;
		%feature("autodoc", "* Performs the symmetrical transformation of an hyperbola with respect to the point P which is the center of the symmetry.
	:param P:
	:type P: gp_Pnt
	:rtype: Standard_NODISCARD gp_Hypr") Mirrored;
		Standard_NODISCARD gp_Hypr Mirrored (const gp_Pnt & P);

		/****************** Mirrored ******************/
		%feature("compactdefaultargs") Mirrored;
		%feature("autodoc", "* Performs the symmetrical transformation of an hyperbola with respect to an axis placement which is the axis of the symmetry.
	:param A1:
	:type A1: gp_Ax1
	:rtype: Standard_NODISCARD gp_Hypr") Mirrored;
		Standard_NODISCARD gp_Hypr Mirrored (const gp_Ax1 & A1);

		/****************** Mirrored ******************/
		%feature("compactdefaultargs") Mirrored;
		%feature("autodoc", "* Performs the symmetrical transformation of an hyperbola with respect to a plane. The axis placement A2 locates the plane of the symmetry (Location, XDirection, YDirection).
	:param A2:
	:type A2: gp_Ax2
	:rtype: Standard_NODISCARD gp_Hypr") Mirrored;
		Standard_NODISCARD gp_Hypr Mirrored (const gp_Ax2 & A2);

		/****************** OtherBranch ******************/
		%feature("compactdefaultargs") OtherBranch;
		%feature("autodoc", "* Returns the branch of hyperbola obtained by doing the symmetrical transformation of <self> with respect to the 'YAxis' of <self>.
	:rtype: gp_Hypr") OtherBranch;
		gp_Hypr OtherBranch ();

		/****************** Parameter ******************/
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "* Returns p = (e * e - 1) * MajorRadius where e is the eccentricity of the hyperbola. Raises DomainError if MajorRadius = 0.0
	:rtype: float") Parameter;
		Standard_Real Parameter ();

		/****************** Position ******************/
		%feature("compactdefaultargs") Position;
		%feature("autodoc", "* Returns the coordinate system of the hyperbola.
	:rtype: gp_Ax2") Position;
		const gp_Ax2  Position ();

		/****************** Rotate ******************/
		%feature("compactdefaultargs") Rotate;
		%feature("autodoc", ":param A1:
	:type A1: gp_Ax1
	:param Ang:
	:type Ang: float
	:rtype: None") Rotate;
		void Rotate (const gp_Ax1 & A1,const Standard_Real Ang);

		/****************** Rotated ******************/
		%feature("compactdefaultargs") Rotated;
		%feature("autodoc", "* Rotates an hyperbola. A1 is the axis of the rotation. Ang is the angular value of the rotation in radians.
	:param A1:
	:type A1: gp_Ax1
	:param Ang:
	:type Ang: float
	:rtype: Standard_NODISCARD gp_Hypr") Rotated;
		Standard_NODISCARD gp_Hypr Rotated (const gp_Ax1 & A1,const Standard_Real Ang);

		/****************** Scale ******************/
		%feature("compactdefaultargs") Scale;
		%feature("autodoc", ":param P:
	:type P: gp_Pnt
	:param S:
	:type S: float
	:rtype: None") Scale;
		void Scale (const gp_Pnt & P,const Standard_Real S);

		/****************** Scaled ******************/
		%feature("compactdefaultargs") Scaled;
		%feature("autodoc", "* Scales an hyperbola. S is the scaling value.
	:param P:
	:type P: gp_Pnt
	:param S:
	:type S: float
	:rtype: Standard_NODISCARD gp_Hypr") Scaled;
		Standard_NODISCARD gp_Hypr Scaled (const gp_Pnt & P,const Standard_Real S);

		/****************** SetAxis ******************/
		%feature("compactdefaultargs") SetAxis;
		%feature("autodoc", "* Modifies this hyperbola, by redefining its local coordinate system so that: - its origin and 'main Direction' become those of the axis A1 (the 'X Direction' and 'Y Direction' are then recomputed in the same way as for any gp_Ax2). Raises ConstructionError if the direction of A1 is parallel to the direction of the 'XAxis' of the hyperbola.
	:param A1:
	:type A1: gp_Ax1
	:rtype: None") SetAxis;
		void SetAxis (const gp_Ax1 & A1);

		/****************** SetLocation ******************/
		%feature("compactdefaultargs") SetLocation;
		%feature("autodoc", "* Modifies this hyperbola, by redefining its local coordinate system so that its origin becomes P.
	:param P:
	:type P: gp_Pnt
	:rtype: None") SetLocation;
		void SetLocation (const gp_Pnt & P);

		/****************** SetMajorRadius ******************/
		%feature("compactdefaultargs") SetMajorRadius;
		%feature("autodoc", "* Modifies the major radius of this hyperbola. Exceptions Standard_ConstructionError if MajorRadius is negative.
	:param MajorRadius:
	:type MajorRadius: float
	:rtype: None") SetMajorRadius;
		void SetMajorRadius (const Standard_Real MajorRadius);

		/****************** SetMinorRadius ******************/
		%feature("compactdefaultargs") SetMinorRadius;
		%feature("autodoc", "* Modifies the minor radius of this hyperbola. Exceptions Standard_ConstructionError if MinorRadius is negative.
	:param MinorRadius:
	:type MinorRadius: float
	:rtype: None") SetMinorRadius;
		void SetMinorRadius (const Standard_Real MinorRadius);

		/****************** SetPosition ******************/
		%feature("compactdefaultargs") SetPosition;
		%feature("autodoc", "* Modifies this hyperbola, by redefining its local coordinate system so that it becomes A2.
	:param A2:
	:type A2: gp_Ax2
	:rtype: None") SetPosition;
		void SetPosition (const gp_Ax2 & A2);

		/****************** Transform ******************/
		%feature("compactdefaultargs") Transform;
		%feature("autodoc", ":param T:
	:type T: gp_Trsf
	:rtype: None") Transform;
		void Transform (const gp_Trsf & T);

		/****************** Transformed ******************/
		%feature("compactdefaultargs") Transformed;
		%feature("autodoc", "* Transforms an hyperbola with the transformation T from class Trsf.
	:param T:
	:type T: gp_Trsf
	:rtype: Standard_NODISCARD gp_Hypr") Transformed;
		Standard_NODISCARD gp_Hypr Transformed (const gp_Trsf & T);

		/****************** Translate ******************/
		%feature("compactdefaultargs") Translate;
		%feature("autodoc", ":param V:
	:type V: gp_Vec
	:rtype: None") Translate;
		void Translate (const gp_Vec & V);

		/****************** Translate ******************/
		%feature("compactdefaultargs") Translate;
		%feature("autodoc", ":param P1:
	:type P1: gp_Pnt
	:param P2:
	:type P2: gp_Pnt
	:rtype: None") Translate;
		void Translate (const gp_Pnt & P1,const gp_Pnt & P2);

		/****************** Translated ******************/
		%feature("compactdefaultargs") Translated;
		%feature("autodoc", "* Translates an hyperbola in the direction of the vector V. The magnitude of the translation is the vector's magnitude.
	:param V:
	:type V: gp_Vec
	:rtype: Standard_NODISCARD gp_Hypr") Translated;
		Standard_NODISCARD gp_Hypr Translated (const gp_Vec & V);

		/****************** Translated ******************/
		%feature("compactdefaultargs") Translated;
		%feature("autodoc", "* Translates an hyperbola from the point P1 to the point P2.
	:param P1:
	:type P1: gp_Pnt
	:param P2:
	:type P2: gp_Pnt
	:rtype: Standard_NODISCARD gp_Hypr") Translated;
		Standard_NODISCARD gp_Hypr Translated (const gp_Pnt & P1,const gp_Pnt & P2);

		/****************** XAxis ******************/
		%feature("compactdefaultargs") XAxis;
		%feature("autodoc", "* Computes an axis, whose - the origin is the center of this hyperbola, and - the unit vector is the 'X Direction' of the local coordinate system of this hyperbola. These axes are, the major axis (the 'X Axis') and of this hyperboReturns the 'XAxis' of the hyperbola.
	:rtype: gp_Ax1") XAxis;
		gp_Ax1 XAxis ();

		/****************** YAxis ******************/
		%feature("compactdefaultargs") YAxis;
		%feature("autodoc", "* Computes an axis, whose - the origin is the center of this hyperbola, and - the unit vector is the 'Y Direction' of the local coordinate system of this hyperbola. These axes are the minor axis (the 'Y Axis') of this hyperbola
	:rtype: gp_Ax1") YAxis;
		gp_Ax1 YAxis ();

		/****************** gp_Hypr ******************/
		%feature("compactdefaultargs") gp_Hypr;
		%feature("autodoc", "* Creates of an indefinite hyperbola.
	:rtype: None") gp_Hypr;
		 gp_Hypr ();

		/****************** gp_Hypr ******************/
		%feature("compactdefaultargs") gp_Hypr;
		%feature("autodoc", "* Creates a hyperbola with radii MajorRadius and MinorRadius, positioned in the space by the coordinate system A2 such that: - the origin of A2 is the center of the hyperbola, - the 'X Direction' of A2 defines the major axis of the hyperbola, that is, the major radius MajorRadius is measured along this axis, and - the 'Y Direction' of A2 defines the minor axis of the hyperbola, that is, the minor radius MinorRadius is measured along this axis. Note: This class does not prevent the creation of a hyperbola where: - MajorAxis is equal to MinorAxis, or - MajorAxis is less than MinorAxis. Exceptions Standard_ConstructionError if MajorAxis or MinorAxis is negative. Raises ConstructionError if MajorRadius < 0.0 or MinorRadius < 0.0 Raised if MajorRadius < 0.0 or MinorRadius < 0.0
	:param A2:
	:type A2: gp_Ax2
	:param MajorRadius:
	:type MajorRadius: float
	:param MinorRadius:
	:type MinorRadius: float
	:rtype: None") gp_Hypr;
		 gp_Hypr (const gp_Ax2 & A2,const Standard_Real MajorRadius,const Standard_Real MinorRadius);

};


%extend gp_Hypr {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************
* class gp_Hypr2d *
******************/
%nodefaultctor gp_Hypr2d;
class gp_Hypr2d {
	public:
		/****************** Asymptote1 ******************/
		%feature("compactdefaultargs") Asymptote1;
		%feature("autodoc", "* In the local coordinate system of the hyperbola the equation of the hyperbola is (X*X)/(A*A) - (Y*Y)/(B*B) = 1.0 and the equation of the first asymptote is Y = (B/A)*X where A is the major radius of the hyperbola and B the minor radius of the hyperbola. Raises ConstructionError if MajorRadius = 0.0
	:rtype: gp_Ax2d") Asymptote1;
		gp_Ax2d Asymptote1 ();

		/****************** Asymptote2 ******************/
		%feature("compactdefaultargs") Asymptote2;
		%feature("autodoc", "* In the local coordinate system of the hyperbola the equation of the hyperbola is (X*X)/(A*A) - (Y*Y)/(B*B) = 1.0 and the equation of the first asymptote is Y = -(B/A)*X where A is the major radius of the hyperbola and B the minor radius of the hyperbola. Raises ConstructionError if MajorRadius = 0.0
	:rtype: gp_Ax2d") Asymptote2;
		gp_Ax2d Asymptote2 ();

		/****************** Axis ******************/
		%feature("compactdefaultargs") Axis;
		%feature("autodoc", "* Returns the axisplacement of the hyperbola.
	:rtype: gp_Ax22d") Axis;
		const gp_Ax22d  Axis ();

		/****************** Coefficients ******************/
		%feature("compactdefaultargs") Coefficients;
		%feature("autodoc", "* Computes the coefficients of the implicit equation of the hyperbola : A * (X**2) + B * (Y**2) + 2*C*(X*Y) + 2*D*X + 2*E*Y + F = 0.
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
	:rtype: None") Coefficients;
		void Coefficients (Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);

		/****************** ConjugateBranch1 ******************/
		%feature("compactdefaultargs") ConjugateBranch1;
		%feature("autodoc", "* Computes the branch of hyperbola which is on the positive side of the 'YAxis' of <self>.
	:rtype: gp_Hypr2d") ConjugateBranch1;
		gp_Hypr2d ConjugateBranch1 ();

		/****************** ConjugateBranch2 ******************/
		%feature("compactdefaultargs") ConjugateBranch2;
		%feature("autodoc", "* Computes the branch of hyperbola which is on the negative side of the 'YAxis' of <self>.
	:rtype: gp_Hypr2d") ConjugateBranch2;
		gp_Hypr2d ConjugateBranch2 ();

		/****************** Directrix1 ******************/
		%feature("compactdefaultargs") Directrix1;
		%feature("autodoc", "* Computes the directrix which is the line normal to the XAxis of the hyperbola in the local plane (Z = 0) at a distance d = MajorRadius / e from the center of the hyperbola, where e is the eccentricity of the hyperbola. This line is parallel to the 'YAxis'. The intersection point between the 'Directrix1' and the 'XAxis' is the 'Location' point of the 'Directrix1'. This point is on the positive side of the 'XAxis'.
	:rtype: gp_Ax2d") Directrix1;
		gp_Ax2d Directrix1 ();

		/****************** Directrix2 ******************/
		%feature("compactdefaultargs") Directrix2;
		%feature("autodoc", "* This line is obtained by the symmetrical transformation of 'Directrix1' with respect to the 'YAxis' of the hyperbola.
	:rtype: gp_Ax2d") Directrix2;
		gp_Ax2d Directrix2 ();

		/****************** Eccentricity ******************/
		%feature("compactdefaultargs") Eccentricity;
		%feature("autodoc", "* Returns the excentricity of the hyperbola (e > 1). If f is the distance between the location of the hyperbola and the Focus1 then the eccentricity e = f / MajorRadius. Raises DomainError if MajorRadius = 0.0.
	:rtype: float") Eccentricity;
		Standard_Real Eccentricity ();

		/****************** Focal ******************/
		%feature("compactdefaultargs") Focal;
		%feature("autodoc", "* Computes the focal distance. It is the distance between the 'Location' of the hyperbola and 'Focus1' or 'Focus2'.
	:rtype: float") Focal;
		Standard_Real Focal ();

		/****************** Focus1 ******************/
		%feature("compactdefaultargs") Focus1;
		%feature("autodoc", "* Returns the first focus of the hyperbola. This focus is on the positive side of the 'XAxis' of the hyperbola.
	:rtype: gp_Pnt2d") Focus1;
		gp_Pnt2d Focus1 ();

		/****************** Focus2 ******************/
		%feature("compactdefaultargs") Focus2;
		%feature("autodoc", "* Returns the second focus of the hyperbola. This focus is on the negative side of the 'XAxis' of the hyperbola.
	:rtype: gp_Pnt2d") Focus2;
		gp_Pnt2d Focus2 ();

		/****************** IsDirect ******************/
		%feature("compactdefaultargs") IsDirect;
		%feature("autodoc", "* Returns true if the local coordinate system is direct and false in the other case.
	:rtype: bool") IsDirect;
		Standard_Boolean IsDirect ();

		/****************** Location ******************/
		%feature("compactdefaultargs") Location;
		%feature("autodoc", "* Returns the location point of the hyperbola. It is the intersection point between the 'XAxis' and the 'YAxis'.
	:rtype: gp_Pnt2d") Location;
		const gp_Pnt2d  Location ();

		/****************** MajorRadius ******************/
		%feature("compactdefaultargs") MajorRadius;
		%feature("autodoc", "* Returns the major radius of the hyperbola (it is the radius corresponding to the 'XAxis' of the hyperbola).
	:rtype: float") MajorRadius;
		Standard_Real MajorRadius ();

		/****************** MinorRadius ******************/
		%feature("compactdefaultargs") MinorRadius;
		%feature("autodoc", "* Returns the minor radius of the hyperbola (it is the radius corresponding to the 'YAxis' of the hyperbola).
	:rtype: float") MinorRadius;
		Standard_Real MinorRadius ();

		/****************** Mirror ******************/
		%feature("compactdefaultargs") Mirror;
		%feature("autodoc", ":param P:
	:type P: gp_Pnt2d
	:rtype: None") Mirror;
		void Mirror (const gp_Pnt2d & P);

		/****************** Mirror ******************/
		%feature("compactdefaultargs") Mirror;
		%feature("autodoc", ":param A:
	:type A: gp_Ax2d
	:rtype: None") Mirror;
		void Mirror (const gp_Ax2d & A);

		/****************** Mirrored ******************/
		%feature("compactdefaultargs") Mirrored;
		%feature("autodoc", "* Performs the symmetrical transformation of an hyperbola with respect to the point P which is the center of the symmetry.
	:param P:
	:type P: gp_Pnt2d
	:rtype: Standard_NODISCARD gp_Hypr2d") Mirrored;
		Standard_NODISCARD gp_Hypr2d Mirrored (const gp_Pnt2d & P);

		/****************** Mirrored ******************/
		%feature("compactdefaultargs") Mirrored;
		%feature("autodoc", "* Performs the symmetrical transformation of an hyperbola with respect to an axis placement which is the axis of the symmetry.
	:param A:
	:type A: gp_Ax2d
	:rtype: Standard_NODISCARD gp_Hypr2d") Mirrored;
		Standard_NODISCARD gp_Hypr2d Mirrored (const gp_Ax2d & A);

		/****************** OtherBranch ******************/
		%feature("compactdefaultargs") OtherBranch;
		%feature("autodoc", "* Returns the branch of hyperbola obtained by doing the symmetrical transformation of <self> with respect to the 'YAxis' of <self>.
	:rtype: gp_Hypr2d") OtherBranch;
		gp_Hypr2d OtherBranch ();

		/****************** Parameter ******************/
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "* Returns p = (e * e - 1) * MajorRadius where e is the eccentricity of the hyperbola. Raises DomainError if MajorRadius = 0.0
	:rtype: float") Parameter;
		Standard_Real Parameter ();

		/****************** Reverse ******************/
		%feature("compactdefaultargs") Reverse;
		%feature("autodoc", ":rtype: None") Reverse;
		void Reverse ();

		/****************** Reversed ******************/
		%feature("compactdefaultargs") Reversed;
		%feature("autodoc", "* Reverses the orientation of the local coordinate system of this hyperbola (the 'Y Axis' is reversed). Therefore, the implicit orientation of this hyperbola is reversed. Note: - Reverse assigns the result to this hyperbola, while - Reversed creates a new one.
	:rtype: Standard_NODISCARD gp_Hypr2d") Reversed;
		Standard_NODISCARD gp_Hypr2d Reversed ();

		/****************** Rotate ******************/
		%feature("compactdefaultargs") Rotate;
		%feature("autodoc", ":param P:
	:type P: gp_Pnt2d
	:param Ang:
	:type Ang: float
	:rtype: None") Rotate;
		void Rotate (const gp_Pnt2d & P,const Standard_Real Ang);

		/****************** Rotated ******************/
		%feature("compactdefaultargs") Rotated;
		%feature("autodoc", "* Rotates an hyperbola. P is the center of the rotation. Ang is the angular value of the rotation in radians.
	:param P:
	:type P: gp_Pnt2d
	:param Ang:
	:type Ang: float
	:rtype: Standard_NODISCARD gp_Hypr2d") Rotated;
		Standard_NODISCARD gp_Hypr2d Rotated (const gp_Pnt2d & P,const Standard_Real Ang);

		/****************** Scale ******************/
		%feature("compactdefaultargs") Scale;
		%feature("autodoc", ":param P:
	:type P: gp_Pnt2d
	:param S:
	:type S: float
	:rtype: None") Scale;
		void Scale (const gp_Pnt2d & P,const Standard_Real S);

		/****************** Scaled ******************/
		%feature("compactdefaultargs") Scaled;
		%feature("autodoc", "* Scales an hyperbola. <S> is the scaling value. If <S> is positive only the location point is modified. But if <S> is negative the 'XAxis' is reversed and the 'YAxis' too.
	:param P:
	:type P: gp_Pnt2d
	:param S:
	:type S: float
	:rtype: Standard_NODISCARD gp_Hypr2d") Scaled;
		Standard_NODISCARD gp_Hypr2d Scaled (const gp_Pnt2d & P,const Standard_Real S);

		/****************** SetAxis ******************/
		%feature("compactdefaultargs") SetAxis;
		%feature("autodoc", "* Modifies this hyperbola, by redefining its local coordinate system so that it becomes A.
	:param A:
	:type A: gp_Ax22d
	:rtype: None") SetAxis;
		void SetAxis (const gp_Ax22d & A);

		/****************** SetLocation ******************/
		%feature("compactdefaultargs") SetLocation;
		%feature("autodoc", "* Modifies this hyperbola, by redefining its local coordinate system so that its origin becomes P.
	:param P:
	:type P: gp_Pnt2d
	:rtype: None") SetLocation;
		void SetLocation (const gp_Pnt2d & P);

		/****************** SetMajorRadius ******************/
		%feature("compactdefaultargs") SetMajorRadius;
		%feature("autodoc", "* Modifies the major or minor radius of this hyperbola. Exceptions Standard_ConstructionError if MajorRadius or MinorRadius is negative.
	:param MajorRadius:
	:type MajorRadius: float
	:rtype: None") SetMajorRadius;
		void SetMajorRadius (const Standard_Real MajorRadius);

		/****************** SetMinorRadius ******************/
		%feature("compactdefaultargs") SetMinorRadius;
		%feature("autodoc", "* Modifies the major or minor radius of this hyperbola. Exceptions Standard_ConstructionError if MajorRadius or MinorRadius is negative.
	:param MinorRadius:
	:type MinorRadius: float
	:rtype: None") SetMinorRadius;
		void SetMinorRadius (const Standard_Real MinorRadius);

		/****************** SetXAxis ******************/
		%feature("compactdefaultargs") SetXAxis;
		%feature("autodoc", "* Changes the major axis of the hyperbola. The minor axis is recomputed and the location of the hyperbola too.
	:param A:
	:type A: gp_Ax2d
	:rtype: None") SetXAxis;
		void SetXAxis (const gp_Ax2d & A);

		/****************** SetYAxis ******************/
		%feature("compactdefaultargs") SetYAxis;
		%feature("autodoc", "* Changes the minor axis of the hyperbola.The minor axis is recomputed and the location of the hyperbola too.
	:param A:
	:type A: gp_Ax2d
	:rtype: None") SetYAxis;
		void SetYAxis (const gp_Ax2d & A);

		/****************** Transform ******************/
		%feature("compactdefaultargs") Transform;
		%feature("autodoc", ":param T:
	:type T: gp_Trsf2d
	:rtype: None") Transform;
		void Transform (const gp_Trsf2d & T);

		/****************** Transformed ******************/
		%feature("compactdefaultargs") Transformed;
		%feature("autodoc", "* Transforms an hyperbola with the transformation T from class Trsf2d.
	:param T:
	:type T: gp_Trsf2d
	:rtype: Standard_NODISCARD gp_Hypr2d") Transformed;
		Standard_NODISCARD gp_Hypr2d Transformed (const gp_Trsf2d & T);

		/****************** Translate ******************/
		%feature("compactdefaultargs") Translate;
		%feature("autodoc", ":param V:
	:type V: gp_Vec2d
	:rtype: None") Translate;
		void Translate (const gp_Vec2d & V);

		/****************** Translate ******************/
		%feature("compactdefaultargs") Translate;
		%feature("autodoc", ":param P1:
	:type P1: gp_Pnt2d
	:param P2:
	:type P2: gp_Pnt2d
	:rtype: None") Translate;
		void Translate (const gp_Pnt2d & P1,const gp_Pnt2d & P2);

		/****************** Translated ******************/
		%feature("compactdefaultargs") Translated;
		%feature("autodoc", "* Translates an hyperbola in the direction of the vector V. The magnitude of the translation is the vector's magnitude.
	:param V:
	:type V: gp_Vec2d
	:rtype: Standard_NODISCARD gp_Hypr2d") Translated;
		Standard_NODISCARD gp_Hypr2d Translated (const gp_Vec2d & V);

		/****************** Translated ******************/
		%feature("compactdefaultargs") Translated;
		%feature("autodoc", "* Translates an hyperbola from the point P1 to the point P2.
	:param P1:
	:type P1: gp_Pnt2d
	:param P2:
	:type P2: gp_Pnt2d
	:rtype: Standard_NODISCARD gp_Hypr2d") Translated;
		Standard_NODISCARD gp_Hypr2d Translated (const gp_Pnt2d & P1,const gp_Pnt2d & P2);

		/****************** XAxis ******************/
		%feature("compactdefaultargs") XAxis;
		%feature("autodoc", "* Computes an axis whose - the origin is the center of this hyperbola, and - the unit vector is the 'X Direction' or 'Y Direction' respectively of the local coordinate system of this hyperbola Returns the major axis of the hyperbola.
	:rtype: gp_Ax2d") XAxis;
		gp_Ax2d XAxis ();

		/****************** YAxis ******************/
		%feature("compactdefaultargs") YAxis;
		%feature("autodoc", "* Computes an axis whose - the origin is the center of this hyperbola, and - the unit vector is the 'X Direction' or 'Y Direction' respectively of the local coordinate system of this hyperbola Returns the minor axis of the hyperbola.
	:rtype: gp_Ax2d") YAxis;
		gp_Ax2d YAxis ();

		/****************** gp_Hypr2d ******************/
		%feature("compactdefaultargs") gp_Hypr2d;
		%feature("autodoc", "* Creates of an indefinite hyperbola.
	:rtype: None") gp_Hypr2d;
		 gp_Hypr2d ();

		/****************** gp_Hypr2d ******************/
		%feature("compactdefaultargs") gp_Hypr2d;
		%feature("autodoc", "* Creates a hyperbola with radii MajorRadius and MinorRadius, centered on the origin of MajorAxis and where the unit vector of MajorAxis is the 'X Direction' of the local coordinate system of the hyperbola. This coordinate system is direct if Sense is true (the default value), and indirect if Sense is false. Warnings : It is yet possible to create an Hyperbola with MajorRadius <= MinorRadius. Raises ConstructionError if MajorRadius < 0.0 or MinorRadius < 0.0
	:param MajorAxis:
	:type MajorAxis: gp_Ax2d
	:param MajorRadius:
	:type MajorRadius: float
	:param MinorRadius:
	:type MinorRadius: float
	:param Sense: default value is Standard_True
	:type Sense: bool
	:rtype: None") gp_Hypr2d;
		 gp_Hypr2d (const gp_Ax2d & MajorAxis,const Standard_Real MajorRadius,const Standard_Real MinorRadius,const Standard_Boolean Sense = Standard_True);

		/****************** gp_Hypr2d ******************/
		%feature("compactdefaultargs") gp_Hypr2d;
		%feature("autodoc", "* a hyperbola with radii MajorRadius and MinorRadius, positioned in the plane by coordinate system A where: - the origin of A is the center of the hyperbola, - the 'X Direction' of A defines the major axis of the hyperbola, that is, the major radius MajorRadius is measured along this axis, and - the 'Y Direction' of A defines the minor axis of the hyperbola, that is, the minor radius MinorRadius is measured along this axis, and - the orientation (direct or indirect sense) of A gives the implicit orientation of the hyperbola. Warnings : It is yet possible to create an Hyperbola with MajorRadius <= MinorRadius. Raises ConstructionError if MajorRadius < 0.0 or MinorRadius < 0.0
	:param A:
	:type A: gp_Ax22d
	:param MajorRadius:
	:type MajorRadius: float
	:param MinorRadius:
	:type MinorRadius: float
	:rtype: None") gp_Hypr2d;
		 gp_Hypr2d (const gp_Ax22d & A,const Standard_Real MajorRadius,const Standard_Real MinorRadius);

};


%extend gp_Hypr2d {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************
* class gp_Lin *
***************/
%nodefaultctor gp_Lin;
class gp_Lin {
	public:
		/****************** Angle ******************/
		%feature("compactdefaultargs") Angle;
		%feature("autodoc", "* Computes the angle between two lines in radians.
	:param Other:
	:type Other: gp_Lin
	:rtype: float") Angle;
		Standard_Real Angle (const gp_Lin & Other);

		/****************** Contains ******************/
		%feature("compactdefaultargs") Contains;
		%feature("autodoc", "* Returns true if this line contains the point P, that is, if the distance between point P and this line is less than or equal to LinearTolerance..
	:param P:
	:type P: gp_Pnt
	:param LinearTolerance:
	:type LinearTolerance: float
	:rtype: bool") Contains;
		Standard_Boolean Contains (const gp_Pnt & P,const Standard_Real LinearTolerance);

		/****************** Direction ******************/
		%feature("compactdefaultargs") Direction;
		%feature("autodoc", "* Returns the direction of the line.
	:rtype: gp_Dir") Direction;
		const gp_Dir  Direction ();

		/****************** Distance ******************/
		%feature("compactdefaultargs") Distance;
		%feature("autodoc", "* Computes the distance between <self> and the point P.
	:param P:
	:type P: gp_Pnt
	:rtype: float") Distance;
		Standard_Real Distance (const gp_Pnt & P);

		/****************** Distance ******************/
		%feature("compactdefaultargs") Distance;
		%feature("autodoc", "* Computes the distance between two lines.
	:param Other:
	:type Other: gp_Lin
	:rtype: float") Distance;
		Standard_Real Distance (const gp_Lin & Other);

		/****************** Location ******************/
		%feature("compactdefaultargs") Location;
		%feature("autodoc", "* Returns the location point (origin) of the line.
	:rtype: gp_Pnt") Location;
		const gp_Pnt  Location ();

		/****************** Mirror ******************/
		%feature("compactdefaultargs") Mirror;
		%feature("autodoc", ":param P:
	:type P: gp_Pnt
	:rtype: None") Mirror;
		void Mirror (const gp_Pnt & P);

		/****************** Mirror ******************/
		%feature("compactdefaultargs") Mirror;
		%feature("autodoc", ":param A1:
	:type A1: gp_Ax1
	:rtype: None") Mirror;
		void Mirror (const gp_Ax1 & A1);

		/****************** Mirror ******************/
		%feature("compactdefaultargs") Mirror;
		%feature("autodoc", ":param A2:
	:type A2: gp_Ax2
	:rtype: None") Mirror;
		void Mirror (const gp_Ax2 & A2);

		/****************** Mirrored ******************/
		%feature("compactdefaultargs") Mirrored;
		%feature("autodoc", "* Performs the symmetrical transformation of a line with respect to the point P which is the center of the symmetry.
	:param P:
	:type P: gp_Pnt
	:rtype: Standard_NODISCARD gp_Lin") Mirrored;
		Standard_NODISCARD gp_Lin Mirrored (const gp_Pnt & P);

		/****************** Mirrored ******************/
		%feature("compactdefaultargs") Mirrored;
		%feature("autodoc", "* Performs the symmetrical transformation of a line with respect to an axis placement which is the axis of the symmetry.
	:param A1:
	:type A1: gp_Ax1
	:rtype: Standard_NODISCARD gp_Lin") Mirrored;
		Standard_NODISCARD gp_Lin Mirrored (const gp_Ax1 & A1);

		/****************** Mirrored ******************/
		%feature("compactdefaultargs") Mirrored;
		%feature("autodoc", "* Performs the symmetrical transformation of a line with respect to a plane. The axis placement <A2> locates the plane of the symmetry : (Location, XDirection, YDirection).
	:param A2:
	:type A2: gp_Ax2
	:rtype: Standard_NODISCARD gp_Lin") Mirrored;
		Standard_NODISCARD gp_Lin Mirrored (const gp_Ax2 & A2);

		/****************** Normal ******************/
		%feature("compactdefaultargs") Normal;
		%feature("autodoc", "* Computes the line normal to the direction of <self>, passing through the point P. Raises ConstructionError if the distance between <self> and the point P is lower or equal to Resolution from gp because there is an infinity of solutions in 3D space.
	:param P:
	:type P: gp_Pnt
	:rtype: gp_Lin") Normal;
		gp_Lin Normal (const gp_Pnt & P);

		/****************** Position ******************/
		%feature("compactdefaultargs") Position;
		%feature("autodoc", "* Returns the axis placement one axis whith the same location and direction as <self>.
	:rtype: gp_Ax1") Position;
		const gp_Ax1  Position ();

		/****************** Reverse ******************/
		%feature("compactdefaultargs") Reverse;
		%feature("autodoc", ":rtype: None") Reverse;
		void Reverse ();

		/****************** Reversed ******************/
		%feature("compactdefaultargs") Reversed;
		%feature("autodoc", "* Reverses the direction of the line. Note: - Reverse assigns the result to this line, while - Reversed creates a new one.
	:rtype: Standard_NODISCARD gp_Lin") Reversed;
		Standard_NODISCARD gp_Lin Reversed ();

		/****************** Rotate ******************/
		%feature("compactdefaultargs") Rotate;
		%feature("autodoc", ":param A1:
	:type A1: gp_Ax1
	:param Ang:
	:type Ang: float
	:rtype: None") Rotate;
		void Rotate (const gp_Ax1 & A1,const Standard_Real Ang);

		/****************** Rotated ******************/
		%feature("compactdefaultargs") Rotated;
		%feature("autodoc", "* Rotates a line. A1 is the axis of the rotation. Ang is the angular value of the rotation in radians.
	:param A1:
	:type A1: gp_Ax1
	:param Ang:
	:type Ang: float
	:rtype: Standard_NODISCARD gp_Lin") Rotated;
		Standard_NODISCARD gp_Lin Rotated (const gp_Ax1 & A1,const Standard_Real Ang);

		/****************** Scale ******************/
		%feature("compactdefaultargs") Scale;
		%feature("autodoc", ":param P:
	:type P: gp_Pnt
	:param S:
	:type S: float
	:rtype: None") Scale;
		void Scale (const gp_Pnt & P,const Standard_Real S);

		/****************** Scaled ******************/
		%feature("compactdefaultargs") Scaled;
		%feature("autodoc", "* Scales a line. S is the scaling value. The 'Location' point (origin) of the line is modified. The 'Direction' is reversed if the scale is negative.
	:param P:
	:type P: gp_Pnt
	:param S:
	:type S: float
	:rtype: Standard_NODISCARD gp_Lin") Scaled;
		Standard_NODISCARD gp_Lin Scaled (const gp_Pnt & P,const Standard_Real S);

		/****************** SetDirection ******************/
		%feature("compactdefaultargs") SetDirection;
		%feature("autodoc", "* Changes the direction of the line.
	:param V:
	:type V: gp_Dir
	:rtype: None") SetDirection;
		void SetDirection (const gp_Dir & V);

		/****************** SetLocation ******************/
		%feature("compactdefaultargs") SetLocation;
		%feature("autodoc", "* Changes the location point (origin) of the line.
	:param P:
	:type P: gp_Pnt
	:rtype: None") SetLocation;
		void SetLocation (const gp_Pnt & P);

		/****************** SetPosition ******************/
		%feature("compactdefaultargs") SetPosition;
		%feature("autodoc", "* Complete redefinition of the line. The 'Location' point of <A1> is the origin of the line. The 'Direction' of <A1> is the direction of the line.
	:param A1:
	:type A1: gp_Ax1
	:rtype: None") SetPosition;
		void SetPosition (const gp_Ax1 & A1);

		/****************** SquareDistance ******************/
		%feature("compactdefaultargs") SquareDistance;
		%feature("autodoc", "* Computes the square distance between <self> and the point P.
	:param P:
	:type P: gp_Pnt
	:rtype: float") SquareDistance;
		Standard_Real SquareDistance (const gp_Pnt & P);

		/****************** SquareDistance ******************/
		%feature("compactdefaultargs") SquareDistance;
		%feature("autodoc", "* Computes the square distance between two lines.
	:param Other:
	:type Other: gp_Lin
	:rtype: float") SquareDistance;
		Standard_Real SquareDistance (const gp_Lin & Other);

		/****************** Transform ******************/
		%feature("compactdefaultargs") Transform;
		%feature("autodoc", ":param T:
	:type T: gp_Trsf
	:rtype: None") Transform;
		void Transform (const gp_Trsf & T);

		/****************** Transformed ******************/
		%feature("compactdefaultargs") Transformed;
		%feature("autodoc", "* Transforms a line with the transformation T from class Trsf.
	:param T:
	:type T: gp_Trsf
	:rtype: Standard_NODISCARD gp_Lin") Transformed;
		Standard_NODISCARD gp_Lin Transformed (const gp_Trsf & T);

		/****************** Translate ******************/
		%feature("compactdefaultargs") Translate;
		%feature("autodoc", ":param V:
	:type V: gp_Vec
	:rtype: None") Translate;
		void Translate (const gp_Vec & V);

		/****************** Translate ******************/
		%feature("compactdefaultargs") Translate;
		%feature("autodoc", ":param P1:
	:type P1: gp_Pnt
	:param P2:
	:type P2: gp_Pnt
	:rtype: None") Translate;
		void Translate (const gp_Pnt & P1,const gp_Pnt & P2);

		/****************** Translated ******************/
		%feature("compactdefaultargs") Translated;
		%feature("autodoc", "* Translates a line in the direction of the vector V. The magnitude of the translation is the vector's magnitude.
	:param V:
	:type V: gp_Vec
	:rtype: Standard_NODISCARD gp_Lin") Translated;
		Standard_NODISCARD gp_Lin Translated (const gp_Vec & V);

		/****************** Translated ******************/
		%feature("compactdefaultargs") Translated;
		%feature("autodoc", "* Translates a line from the point P1 to the point P2.
	:param P1:
	:type P1: gp_Pnt
	:param P2:
	:type P2: gp_Pnt
	:rtype: Standard_NODISCARD gp_Lin") Translated;
		Standard_NODISCARD gp_Lin Translated (const gp_Pnt & P1,const gp_Pnt & P2);

		/****************** gp_Lin ******************/
		%feature("compactdefaultargs") gp_Lin;
		%feature("autodoc", "* Creates a Line corresponding to Z axis of the reference coordinate system.
	:rtype: None") gp_Lin;
		 gp_Lin ();

		/****************** gp_Lin ******************/
		%feature("compactdefaultargs") gp_Lin;
		%feature("autodoc", "* Creates a line defined by axis A1.
	:param A1:
	:type A1: gp_Ax1
	:rtype: None") gp_Lin;
		 gp_Lin (const gp_Ax1 & A1);

		/****************** gp_Lin ******************/
		%feature("compactdefaultargs") gp_Lin;
		%feature("autodoc", "* Creates a line passing through point P and parallel to vector V (P and V are, respectively, the origin and the unit vector of the positioning axis of the line).
	:param P:
	:type P: gp_Pnt
	:param V:
	:type V: gp_Dir
	:rtype: None") gp_Lin;
		 gp_Lin (const gp_Pnt & P,const gp_Dir & V);

};


%extend gp_Lin {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************
* class gp_Lin2d *
*****************/
%nodefaultctor gp_Lin2d;
class gp_Lin2d {
	public:
		/****************** Angle ******************/
		%feature("compactdefaultargs") Angle;
		%feature("autodoc", "* Computes the angle between two lines in radians.
	:param Other:
	:type Other: gp_Lin2d
	:rtype: float") Angle;
		Standard_Real Angle (const gp_Lin2d & Other);

		/****************** Coefficients ******************/
		%feature("compactdefaultargs") Coefficients;
		%feature("autodoc", "* Returns the normalized coefficients of the line : A * X + B * Y + C = 0.
	:param A:
	:type A: float &
	:param B:
	:type B: float &
	:param C:
	:type C: float &
	:rtype: None") Coefficients;
		void Coefficients (Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);

		/****************** Contains ******************/
		%feature("compactdefaultargs") Contains;
		%feature("autodoc", "* Returns true if this line contains the point P, that is, if the distance between point P and this line is less than or equal to LinearTolerance.
	:param P:
	:type P: gp_Pnt2d
	:param LinearTolerance:
	:type LinearTolerance: float
	:rtype: bool") Contains;
		Standard_Boolean Contains (const gp_Pnt2d & P,const Standard_Real LinearTolerance);

		/****************** Direction ******************/
		%feature("compactdefaultargs") Direction;
		%feature("autodoc", "* Returns the direction of the line.
	:rtype: gp_Dir2d") Direction;
		const gp_Dir2d  Direction ();

		/****************** Distance ******************/
		%feature("compactdefaultargs") Distance;
		%feature("autodoc", "* Computes the distance between <self> and the point <P>.
	:param P:
	:type P: gp_Pnt2d
	:rtype: float") Distance;
		Standard_Real Distance (const gp_Pnt2d & P);

		/****************** Distance ******************/
		%feature("compactdefaultargs") Distance;
		%feature("autodoc", "* Computes the distance between two lines.
	:param Other:
	:type Other: gp_Lin2d
	:rtype: float") Distance;
		Standard_Real Distance (const gp_Lin2d & Other);

		/****************** Location ******************/
		%feature("compactdefaultargs") Location;
		%feature("autodoc", "* Returns the location point (origin) of the line.
	:rtype: gp_Pnt2d") Location;
		const gp_Pnt2d  Location ();

		/****************** Mirror ******************/
		%feature("compactdefaultargs") Mirror;
		%feature("autodoc", ":param P:
	:type P: gp_Pnt2d
	:rtype: None") Mirror;
		void Mirror (const gp_Pnt2d & P);

		/****************** Mirror ******************/
		%feature("compactdefaultargs") Mirror;
		%feature("autodoc", ":param A:
	:type A: gp_Ax2d
	:rtype: None") Mirror;
		void Mirror (const gp_Ax2d & A);

		/****************** Mirrored ******************/
		%feature("compactdefaultargs") Mirrored;
		%feature("autodoc", "* Performs the symmetrical transformation of a line with respect to the point <P> which is the center of the symmetry
	:param P:
	:type P: gp_Pnt2d
	:rtype: Standard_NODISCARD gp_Lin2d") Mirrored;
		Standard_NODISCARD gp_Lin2d Mirrored (const gp_Pnt2d & P);

		/****************** Mirrored ******************/
		%feature("compactdefaultargs") Mirrored;
		%feature("autodoc", "* Performs the symmetrical transformation of a line with respect to an axis placement which is the axis of the symmetry.
	:param A:
	:type A: gp_Ax2d
	:rtype: Standard_NODISCARD gp_Lin2d") Mirrored;
		Standard_NODISCARD gp_Lin2d Mirrored (const gp_Ax2d & A);

		/****************** Normal ******************/
		%feature("compactdefaultargs") Normal;
		%feature("autodoc", "* Computes the line normal to the direction of <self>, passing through the point <P>.
	:param P:
	:type P: gp_Pnt2d
	:rtype: gp_Lin2d") Normal;
		gp_Lin2d Normal (const gp_Pnt2d & P);

		/****************** Position ******************/
		%feature("compactdefaultargs") Position;
		%feature("autodoc", "* Returns the axis placement one axis whith the same location and direction as <self>.
	:rtype: gp_Ax2d") Position;
		const gp_Ax2d  Position ();

		/****************** Reverse ******************/
		%feature("compactdefaultargs") Reverse;
		%feature("autodoc", ":rtype: None") Reverse;
		void Reverse ();

		/****************** Reversed ******************/
		%feature("compactdefaultargs") Reversed;
		%feature("autodoc", "* Reverses the positioning axis of this line. Note: - Reverse assigns the result to this line, while - Reversed creates a new one.
	:rtype: Standard_NODISCARD gp_Lin2d") Reversed;
		Standard_NODISCARD gp_Lin2d Reversed ();

		/****************** Rotate ******************/
		%feature("compactdefaultargs") Rotate;
		%feature("autodoc", ":param P:
	:type P: gp_Pnt2d
	:param Ang:
	:type Ang: float
	:rtype: None") Rotate;
		void Rotate (const gp_Pnt2d & P,const Standard_Real Ang);

		/****************** Rotated ******************/
		%feature("compactdefaultargs") Rotated;
		%feature("autodoc", "* Rotates a line. P is the center of the rotation. Ang is the angular value of the rotation in radians.
	:param P:
	:type P: gp_Pnt2d
	:param Ang:
	:type Ang: float
	:rtype: Standard_NODISCARD gp_Lin2d") Rotated;
		Standard_NODISCARD gp_Lin2d Rotated (const gp_Pnt2d & P,const Standard_Real Ang);

		/****************** Scale ******************/
		%feature("compactdefaultargs") Scale;
		%feature("autodoc", ":param P:
	:type P: gp_Pnt2d
	:param S:
	:type S: float
	:rtype: None") Scale;
		void Scale (const gp_Pnt2d & P,const Standard_Real S);

		/****************** Scaled ******************/
		%feature("compactdefaultargs") Scaled;
		%feature("autodoc", "* Scales a line. S is the scaling value. Only the origin of the line is modified.
	:param P:
	:type P: gp_Pnt2d
	:param S:
	:type S: float
	:rtype: Standard_NODISCARD gp_Lin2d") Scaled;
		Standard_NODISCARD gp_Lin2d Scaled (const gp_Pnt2d & P,const Standard_Real S);

		/****************** SetDirection ******************/
		%feature("compactdefaultargs") SetDirection;
		%feature("autodoc", "* Changes the direction of the line.
	:param V:
	:type V: gp_Dir2d
	:rtype: None") SetDirection;
		void SetDirection (const gp_Dir2d & V);

		/****************** SetLocation ******************/
		%feature("compactdefaultargs") SetLocation;
		%feature("autodoc", "* Changes the origin of the line.
	:param P:
	:type P: gp_Pnt2d
	:rtype: None") SetLocation;
		void SetLocation (const gp_Pnt2d & P);

		/****************** SetPosition ******************/
		%feature("compactdefaultargs") SetPosition;
		%feature("autodoc", "* Complete redefinition of the line. The 'Location' point of <A> is the origin of the line. The 'Direction' of <A> is the direction of the line.
	:param A:
	:type A: gp_Ax2d
	:rtype: None") SetPosition;
		void SetPosition (const gp_Ax2d & A);

		/****************** SquareDistance ******************/
		%feature("compactdefaultargs") SquareDistance;
		%feature("autodoc", "* Computes the square distance between <self> and the point <P>.
	:param P:
	:type P: gp_Pnt2d
	:rtype: float") SquareDistance;
		Standard_Real SquareDistance (const gp_Pnt2d & P);

		/****************** SquareDistance ******************/
		%feature("compactdefaultargs") SquareDistance;
		%feature("autodoc", "* Computes the square distance between two lines.
	:param Other:
	:type Other: gp_Lin2d
	:rtype: float") SquareDistance;
		Standard_Real SquareDistance (const gp_Lin2d & Other);

		/****************** Transform ******************/
		%feature("compactdefaultargs") Transform;
		%feature("autodoc", ":param T:
	:type T: gp_Trsf2d
	:rtype: None") Transform;
		void Transform (const gp_Trsf2d & T);

		/****************** Transformed ******************/
		%feature("compactdefaultargs") Transformed;
		%feature("autodoc", "* Transforms a line with the transformation T from class Trsf2d.
	:param T:
	:type T: gp_Trsf2d
	:rtype: Standard_NODISCARD gp_Lin2d") Transformed;
		Standard_NODISCARD gp_Lin2d Transformed (const gp_Trsf2d & T);

		/****************** Translate ******************/
		%feature("compactdefaultargs") Translate;
		%feature("autodoc", ":param V:
	:type V: gp_Vec2d
	:rtype: None") Translate;
		void Translate (const gp_Vec2d & V);

		/****************** Translate ******************/
		%feature("compactdefaultargs") Translate;
		%feature("autodoc", ":param P1:
	:type P1: gp_Pnt2d
	:param P2:
	:type P2: gp_Pnt2d
	:rtype: None") Translate;
		void Translate (const gp_Pnt2d & P1,const gp_Pnt2d & P2);

		/****************** Translated ******************/
		%feature("compactdefaultargs") Translated;
		%feature("autodoc", "* Translates a line in the direction of the vector V. The magnitude of the translation is the vector's magnitude.
	:param V:
	:type V: gp_Vec2d
	:rtype: Standard_NODISCARD gp_Lin2d") Translated;
		Standard_NODISCARD gp_Lin2d Translated (const gp_Vec2d & V);

		/****************** Translated ******************/
		%feature("compactdefaultargs") Translated;
		%feature("autodoc", "* Translates a line from the point P1 to the point P2.
	:param P1:
	:type P1: gp_Pnt2d
	:param P2:
	:type P2: gp_Pnt2d
	:rtype: Standard_NODISCARD gp_Lin2d") Translated;
		Standard_NODISCARD gp_Lin2d Translated (const gp_Pnt2d & P1,const gp_Pnt2d & P2);

		/****************** gp_Lin2d ******************/
		%feature("compactdefaultargs") gp_Lin2d;
		%feature("autodoc", "* Creates a Line corresponding to X axis of the reference coordinate system.
	:rtype: None") gp_Lin2d;
		 gp_Lin2d ();

		/****************** gp_Lin2d ******************/
		%feature("compactdefaultargs") gp_Lin2d;
		%feature("autodoc", "* Creates a line located with A.
	:param A:
	:type A: gp_Ax2d
	:rtype: None") gp_Lin2d;
		 gp_Lin2d (const gp_Ax2d & A);

		/****************** gp_Lin2d ******************/
		%feature("compactdefaultargs") gp_Lin2d;
		%feature("autodoc", "* <P> is the location point (origin) of the line and <V> is the direction of the line.
	:param P:
	:type P: gp_Pnt2d
	:param V:
	:type V: gp_Dir2d
	:rtype: None") gp_Lin2d;
		 gp_Lin2d (const gp_Pnt2d & P,const gp_Dir2d & V);

		/****************** gp_Lin2d ******************/
		%feature("compactdefaultargs") gp_Lin2d;
		%feature("autodoc", "* Creates the line from the equation A*X + B*Y + C = 0.0 Raises ConstructionError if Sqrt(A*A + B*B) <= Resolution from gp. Raised if Sqrt(A*A + B*B) <= Resolution from gp.
	:param A:
	:type A: float
	:param B:
	:type B: float
	:param C:
	:type C: float
	:rtype: None") gp_Lin2d;
		 gp_Lin2d (const Standard_Real A,const Standard_Real B,const Standard_Real C);

};


%extend gp_Lin2d {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************
* class gp_Mat *
***************/
%nodefaultctor gp_Mat;
class gp_Mat {
	public:
		/****************** Add ******************/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", ":param Other:
	:type Other: gp_Mat
	:rtype: None") Add;
		void Add (const gp_Mat & Other);

		/****************** Added ******************/
		%feature("compactdefaultargs") Added;
		%feature("autodoc", "* Computes the sum of this matrix and the matrix Other for each coefficient of the matrix : <self>.Coef(i,j) + <Other>.Coef(i,j)
	:param Other:
	:type Other: gp_Mat
	:rtype: Standard_NODISCARD gp_Mat") Added;
		Standard_NODISCARD gp_Mat Added (const gp_Mat & Other);


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
		%feature("autodoc", "* Returns the column of Col index. Raises OutOfRange if Col < 1 or Col > 3
	:param Col:
	:type Col: int
	:rtype: gp_XYZ") Column;
		gp_XYZ Column (const Standard_Integer Col);

		/****************** Determinant ******************/
		%feature("compactdefaultargs") Determinant;
		%feature("autodoc", "* Computes the determinant of the matrix.
	:rtype: float") Determinant;
		Standard_Real Determinant ();

		/****************** Diagonal ******************/
		%feature("compactdefaultargs") Diagonal;
		%feature("autodoc", "* Returns the main diagonal of the matrix.
	:rtype: gp_XYZ") Diagonal;
		gp_XYZ Diagonal ();

		/****************** Divide ******************/
		%feature("compactdefaultargs") Divide;
		%feature("autodoc", ":param Scalar:
	:type Scalar: float
	:rtype: None") Divide;
		void Divide (const Standard_Real Scalar);

		/****************** Divided ******************/
		%feature("compactdefaultargs") Divided;
		%feature("autodoc", "* Divides all the coefficients of the matrix by Scalar
	:param Scalar:
	:type Scalar: float
	:rtype: Standard_NODISCARD gp_Mat") Divided;
		Standard_NODISCARD gp_Mat Divided (const Standard_Real Scalar);


        %feature("autodoc", "1");
        %extend{
            std::string DumpJsonToString(int depth=-1) {
            std::stringstream s;
            self->DumpJson(s, depth);
            return s.str();}
        };
        		/****************** Invert ******************/
		%feature("compactdefaultargs") Invert;
		%feature("autodoc", ":rtype: None") Invert;
		void Invert ();

		/****************** Inverted ******************/
		%feature("compactdefaultargs") Inverted;
		%feature("autodoc", "* Inverses the matrix and raises if the matrix is singular. - Invert assigns the result to this matrix, while - Inverted creates a new one. Warning The Gauss LU decomposition is used to invert the matrix. Consequently, the matrix is considered as singular if the largest pivot found is less than or equal to gp::Resolution(). Exceptions Standard_ConstructionError if this matrix is singular, and therefore cannot be inverted.
	:rtype: Standard_NODISCARD gp_Mat") Inverted;
		Standard_NODISCARD gp_Mat Inverted ();

		/****************** IsSingular ******************/
		%feature("compactdefaultargs") IsSingular;
		%feature("autodoc", "* The Gauss LU decomposition is used to invert the matrix (see Math package) so the matrix is considered as singular if the largest pivot found is lower or equal to Resolution from gp.
	:rtype: bool") IsSingular;
		Standard_Boolean IsSingular ();

		/****************** Multiplied ******************/
		%feature("compactdefaultargs") Multiplied;
		%feature("autodoc", "* Computes the product of two matrices <self> * <Other>
	:param Other:
	:type Other: gp_Mat
	:rtype: Standard_NODISCARD gp_Mat") Multiplied;
		Standard_NODISCARD gp_Mat Multiplied (const gp_Mat & Other);

		/****************** Multiplied ******************/
		%feature("compactdefaultargs") Multiplied;
		%feature("autodoc", ":param Scalar:
	:type Scalar: float
	:rtype: Standard_NODISCARD gp_Mat") Multiplied;
		Standard_NODISCARD gp_Mat Multiplied (const Standard_Real Scalar);

		/****************** Multiply ******************/
		%feature("compactdefaultargs") Multiply;
		%feature("autodoc", "* Computes the product of two matrices <self> = <Other> * <self>.
	:param Other:
	:type Other: gp_Mat
	:rtype: None") Multiply;
		void Multiply (const gp_Mat & Other);

		/****************** Multiply ******************/
		%feature("compactdefaultargs") Multiply;
		%feature("autodoc", "* Multiplies all the coefficients of the matrix by Scalar
	:param Scalar:
	:type Scalar: float
	:rtype: None") Multiply;
		void Multiply (const Standard_Real Scalar);

		/****************** Power ******************/
		%feature("compactdefaultargs") Power;
		%feature("autodoc", ":param N:
	:type N: int
	:rtype: None") Power;
		void Power (const Standard_Integer N);

		/****************** Powered ******************/
		%feature("compactdefaultargs") Powered;
		%feature("autodoc", "* Computes <self> = <self> * <self> * .......* <self>, N time. if N = 0 <self> = Identity if N < 0 <self> = <self>.Invert() *...........* <self>.Invert(). If N < 0 an exception will be raised if the matrix is not inversible
	:param N:
	:type N: int
	:rtype: Standard_NODISCARD gp_Mat") Powered;
		Standard_NODISCARD gp_Mat Powered (const Standard_Integer N);

		/****************** PreMultiply ******************/
		%feature("compactdefaultargs") PreMultiply;
		%feature("autodoc", ":param Other:
	:type Other: gp_Mat
	:rtype: None") PreMultiply;
		void PreMultiply (const gp_Mat & Other);

		/****************** Row ******************/
		%feature("compactdefaultargs") Row;
		%feature("autodoc", "* returns the row of Row index. Raises OutOfRange if Row < 1 or Row > 3
	:param Row:
	:type Row: int
	:rtype: gp_XYZ") Row;
		gp_XYZ Row (const Standard_Integer Row);

		/****************** SetCol ******************/
		%feature("compactdefaultargs") SetCol;
		%feature("autodoc", "* Assigns the three coordinates of Value to the column of index Col of this matrix. Raises OutOfRange if Col < 1 or Col > 3.
	:param Col:
	:type Col: int
	:param Value:
	:type Value: gp_XYZ
	:rtype: None") SetCol;
		void SetCol (const Standard_Integer Col,const gp_XYZ & Value);

		/****************** SetCols ******************/
		%feature("compactdefaultargs") SetCols;
		%feature("autodoc", "* Assigns the number triples Col1, Col2, Col3 to the three columns of this matrix.
	:param Col1:
	:type Col1: gp_XYZ
	:param Col2:
	:type Col2: gp_XYZ
	:param Col3:
	:type Col3: gp_XYZ
	:rtype: None") SetCols;
		void SetCols (const gp_XYZ & Col1,const gp_XYZ & Col2,const gp_XYZ & Col3);

		/****************** SetCross ******************/
		%feature("compactdefaultargs") SetCross;
		%feature("autodoc", "* Modifies the matrix M so that applying it to any number triple (X, Y, Z) produces the same result as the cross product of Ref and the number triple (X, Y, Z): i.e.: M * {X,Y,Z}t = Ref.Cross({X, Y ,Z}) this matrix is anti symmetric. To apply this matrix to the triplet {XYZ} is the same as to do the cross product between the triplet Ref and the triplet {XYZ}. Note: this matrix is anti-symmetric.
	:param Ref:
	:type Ref: gp_XYZ
	:rtype: None") SetCross;
		void SetCross (const gp_XYZ & Ref);

		/****************** SetDiagonal ******************/
		%feature("compactdefaultargs") SetDiagonal;
		%feature("autodoc", "* Modifies the main diagonal of the matrix. <self>.Value (1, 1) = X1 <self>.Value (2, 2) = X2 <self>.Value (3, 3) = X3 The other coefficients of the matrix are not modified.
	:param X1:
	:type X1: float
	:param X2:
	:type X2: float
	:param X3:
	:type X3: float
	:rtype: None") SetDiagonal;
		void SetDiagonal (const Standard_Real X1,const Standard_Real X2,const Standard_Real X3);

		/****************** SetDot ******************/
		%feature("compactdefaultargs") SetDot;
		%feature("autodoc", "* Modifies this matrix so that applying it to any number triple (X, Y, Z) produces the same result as the scalar product of Ref and the number triple (X, Y, Z): this * (X,Y,Z) = Ref.(X,Y,Z) Note: this matrix is symmetric.
	:param Ref:
	:type Ref: gp_XYZ
	:rtype: None") SetDot;
		void SetDot (const gp_XYZ & Ref);

		/****************** SetIdentity ******************/
		%feature("compactdefaultargs") SetIdentity;
		%feature("autodoc", "* Modifies this matrix so that it represents the Identity matrix.
	:rtype: None") SetIdentity;
		void SetIdentity ();

		/****************** SetRotation ******************/
		%feature("compactdefaultargs") SetRotation;
		%feature("autodoc", "* Modifies this matrix so that it represents a rotation. Ang is the angular value in radians and the XYZ axis gives the direction of the rotation. Raises ConstructionError if XYZ.Modulus() <= Resolution()
	:param Axis:
	:type Axis: gp_XYZ
	:param Ang:
	:type Ang: float
	:rtype: None") SetRotation;
		void SetRotation (const gp_XYZ & Axis,const Standard_Real Ang);

		/****************** SetRow ******************/
		%feature("compactdefaultargs") SetRow;
		%feature("autodoc", "* Assigns the three coordinates of Value to the row of index Row of this matrix. Raises OutOfRange if Row < 1 or Row > 3.
	:param Row:
	:type Row: int
	:param Value:
	:type Value: gp_XYZ
	:rtype: None") SetRow;
		void SetRow (const Standard_Integer Row,const gp_XYZ & Value);

		/****************** SetRows ******************/
		%feature("compactdefaultargs") SetRows;
		%feature("autodoc", "* Assigns the number triples Row1, Row2, Row3 to the three rows of this matrix.
	:param Row1:
	:type Row1: gp_XYZ
	:param Row2:
	:type Row2: gp_XYZ
	:param Row3:
	:type Row3: gp_XYZ
	:rtype: None") SetRows;
		void SetRows (const gp_XYZ & Row1,const gp_XYZ & Row2,const gp_XYZ & Row3);

		/****************** SetScale ******************/
		%feature("compactdefaultargs") SetScale;
		%feature("autodoc", "* Modifies the the matrix so that it represents a scaling transformation, where S is the scale factor. : | S 0.0 0.0 | <self> = | 0.0 S 0.0 | | 0.0 0.0 S |
	:param S:
	:type S: float
	:rtype: None") SetScale;
		void SetScale (const Standard_Real S);

		/****************** SetValue ******************/
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "* Assigns <Value> to the coefficient of row Row, column Col of this matrix. Raises OutOfRange if Row < 1 or Row > 3 or Col < 1 or Col > 3
	:param Row:
	:type Row: int
	:param Col:
	:type Col: int
	:param Value:
	:type Value: float
	:rtype: None") SetValue;
		void SetValue (const Standard_Integer Row,const Standard_Integer Col,const Standard_Real Value);

		/****************** Subtract ******************/
		%feature("compactdefaultargs") Subtract;
		%feature("autodoc", ":param Other:
	:type Other: gp_Mat
	:rtype: None") Subtract;
		void Subtract (const gp_Mat & Other);

		/****************** Subtracted ******************/
		%feature("compactdefaultargs") Subtracted;
		%feature("autodoc", "* cOmputes for each coefficient of the matrix : <self>.Coef(i,j) - <Other>.Coef(i,j)
	:param Other:
	:type Other: gp_Mat
	:rtype: Standard_NODISCARD gp_Mat") Subtracted;
		Standard_NODISCARD gp_Mat Subtracted (const gp_Mat & Other);

		/****************** Transpose ******************/
		%feature("compactdefaultargs") Transpose;
		%feature("autodoc", ":rtype: None") Transpose;
		void Transpose ();

		/****************** Transposed ******************/
		%feature("compactdefaultargs") Transposed;
		%feature("autodoc", "* Transposes the matrix. A(j, i) -> A (i, j)
	:rtype: Standard_NODISCARD gp_Mat") Transposed;
		Standard_NODISCARD gp_Mat Transposed ();

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "* Returns the coefficient of range (Row, Col) Raises OutOfRange if Row < 1 or Row > 3 or Col < 1 or Col > 3
	:param Row:
	:type Row: int
	:param Col:
	:type Col: int
	:rtype: float") Value;
		const Standard_Real & Value (const Standard_Integer Row,const Standard_Integer Col);

		/****************** gp_Mat ******************/
		%feature("compactdefaultargs") gp_Mat;
		%feature("autodoc", "* creates a matrix with null coefficients.
	:rtype: None") gp_Mat;
		 gp_Mat ();

		/****************** gp_Mat ******************/
		%feature("compactdefaultargs") gp_Mat;
		%feature("autodoc", ":param a11:
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
	:rtype: None") gp_Mat;
		 gp_Mat (const Standard_Real a11,const Standard_Real a12,const Standard_Real a13,const Standard_Real a21,const Standard_Real a22,const Standard_Real a23,const Standard_Real a31,const Standard_Real a32,const Standard_Real a33);

		/****************** gp_Mat ******************/
		%feature("compactdefaultargs") gp_Mat;
		%feature("autodoc", "* Creates a matrix. Col1, Col2, Col3 are the 3 columns of the matrix.
	:param Col1:
	:type Col1: gp_XYZ
	:param Col2:
	:type Col2: gp_XYZ
	:param Col3:
	:type Col3: gp_XYZ
	:rtype: None") gp_Mat;
		 gp_Mat (const gp_XYZ & Col1,const gp_XYZ & Col2,const gp_XYZ & Col3);

		/****************** operator * ******************/
		%feature("compactdefaultargs") operator *;
		%feature("autodoc", ":param Other:
	:type Other: gp_Mat
	:rtype: Standard_NODISCARD gp_Mat") operator *;
		Standard_NODISCARD gp_Mat operator * (const gp_Mat & Other);

		/****************** operator * ******************/
		%feature("compactdefaultargs") operator *;
		%feature("autodoc", ":param Scalar:
	:type Scalar: float
	:rtype: Standard_NODISCARD gp_Mat") operator *;
		Standard_NODISCARD gp_Mat operator * (const Standard_Real Scalar);


        %extend{
            void __imul_wrapper__(const gp_Mat  other) {
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
		%feature("autodoc", ":param Other:
	:type Other: gp_Mat
	:rtype: Standard_NODISCARD gp_Mat") operator +;
		Standard_NODISCARD gp_Mat operator + (const gp_Mat & Other);


        %extend{
            void __iadd_wrapper__(const gp_Mat  other) {
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
		%feature("autodoc", ":param Other:
	:type Other: gp_Mat
	:rtype: Standard_NODISCARD gp_Mat") operator -;
		Standard_NODISCARD gp_Mat operator - (const gp_Mat & Other);


        %extend{
            void __isub_wrapper__(const gp_Mat  other) {
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
		%feature("autodoc", ":param Scalar:
	:type Scalar: float
	:rtype: Standard_NODISCARD gp_Mat") operator /;
		Standard_NODISCARD gp_Mat operator / (const Standard_Real Scalar);


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
%nodefaultctor gp_Mat2d;
class gp_Mat2d {
	public:
		/****************** Add ******************/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", ":param Other:
	:type Other: gp_Mat2d
	:rtype: None") Add;
		void Add (const gp_Mat2d & Other);

		/****************** Added ******************/
		%feature("compactdefaultargs") Added;
		%feature("autodoc", "* Computes the sum of this matrix and the matrix Other.for each coefficient of the matrix : <self>.Coef(i,j) + <Other>.Coef(i,j) Note: - operator += assigns the result to this matrix, while - operator + creates a new one.
	:param Other:
	:type Other: gp_Mat2d
	:rtype: Standard_NODISCARD gp_Mat2d") Added;
		Standard_NODISCARD gp_Mat2d Added (const gp_Mat2d & Other);


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
		%feature("autodoc", "* Returns the column of Col index. Raises OutOfRange if Col < 1 or Col > 2
	:param Col:
	:type Col: int
	:rtype: gp_XY") Column;
		gp_XY Column (const Standard_Integer Col);

		/****************** Determinant ******************/
		%feature("compactdefaultargs") Determinant;
		%feature("autodoc", "* Computes the determinant of the matrix.
	:rtype: float") Determinant;
		Standard_Real Determinant ();

		/****************** Diagonal ******************/
		%feature("compactdefaultargs") Diagonal;
		%feature("autodoc", "* Returns the main diagonal of the matrix.
	:rtype: gp_XY") Diagonal;
		gp_XY Diagonal ();

		/****************** Divide ******************/
		%feature("compactdefaultargs") Divide;
		%feature("autodoc", ":param Scalar:
	:type Scalar: float
	:rtype: None") Divide;
		void Divide (const Standard_Real Scalar);

		/****************** Divided ******************/
		%feature("compactdefaultargs") Divided;
		%feature("autodoc", "* Divides all the coefficients of the matrix by a scalar.
	:param Scalar:
	:type Scalar: float
	:rtype: Standard_NODISCARD gp_Mat2d") Divided;
		Standard_NODISCARD gp_Mat2d Divided (const Standard_Real Scalar);

		/****************** Invert ******************/
		%feature("compactdefaultargs") Invert;
		%feature("autodoc", ":rtype: None") Invert;
		void Invert ();

		/****************** Inverted ******************/
		%feature("compactdefaultargs") Inverted;
		%feature("autodoc", "* Inverses the matrix and raises exception if the matrix is singular.
	:rtype: Standard_NODISCARD gp_Mat2d") Inverted;
		Standard_NODISCARD gp_Mat2d Inverted ();

		/****************** IsSingular ******************/
		%feature("compactdefaultargs") IsSingular;
		%feature("autodoc", "* Returns true if this matrix is singular (and therefore, cannot be inverted). The Gauss LU decomposition is used to invert the matrix so the matrix is considered as singular if the largest pivot found is lower or equal to Resolution from gp.
	:rtype: bool") IsSingular;
		Standard_Boolean IsSingular ();

		/****************** Multiplied ******************/
		%feature("compactdefaultargs") Multiplied;
		%feature("autodoc", ":param Other:
	:type Other: gp_Mat2d
	:rtype: Standard_NODISCARD gp_Mat2d") Multiplied;
		Standard_NODISCARD gp_Mat2d Multiplied (const gp_Mat2d & Other);

		/****************** Multiplied ******************/
		%feature("compactdefaultargs") Multiplied;
		%feature("autodoc", ":param Scalar:
	:type Scalar: float
	:rtype: Standard_NODISCARD gp_Mat2d") Multiplied;
		Standard_NODISCARD gp_Mat2d Multiplied (const Standard_Real Scalar);

		/****************** Multiply ******************/
		%feature("compactdefaultargs") Multiply;
		%feature("autodoc", "* Computes the product of two matrices <self> * <Other>
	:param Other:
	:type Other: gp_Mat2d
	:rtype: None") Multiply;
		void Multiply (const gp_Mat2d & Other);

		/****************** Multiply ******************/
		%feature("compactdefaultargs") Multiply;
		%feature("autodoc", "* Multiplies all the coefficients of the matrix by a scalar.
	:param Scalar:
	:type Scalar: float
	:rtype: None") Multiply;
		void Multiply (const Standard_Real Scalar);

		/****************** Power ******************/
		%feature("compactdefaultargs") Power;
		%feature("autodoc", ":param N:
	:type N: int
	:rtype: None") Power;
		void Power (const Standard_Integer N);

		/****************** Powered ******************/
		%feature("compactdefaultargs") Powered;
		%feature("autodoc", "* computes <self> = <self> * <self> * .......* <self>, N time. if N = 0 <self> = Identity if N < 0 <self> = <self>.Invert() *...........* <self>.Invert(). If N < 0 an exception can be raised if the matrix is not inversible
	:param N:
	:type N: int
	:rtype: Standard_NODISCARD gp_Mat2d") Powered;
		Standard_NODISCARD gp_Mat2d Powered (const Standard_Integer N);

		/****************** PreMultiply ******************/
		%feature("compactdefaultargs") PreMultiply;
		%feature("autodoc", "* Modifies this matrix by premultiplying it by the matrix Other <self> = Other * <self>.
	:param Other:
	:type Other: gp_Mat2d
	:rtype: None") PreMultiply;
		void PreMultiply (const gp_Mat2d & Other);

		/****************** Row ******************/
		%feature("compactdefaultargs") Row;
		%feature("autodoc", "* Returns the row of index Row. Raised if Row < 1 or Row > 2
	:param Row:
	:type Row: int
	:rtype: gp_XY") Row;
		gp_XY Row (const Standard_Integer Row);

		/****************** SetCol ******************/
		%feature("compactdefaultargs") SetCol;
		%feature("autodoc", "* Assigns the two coordinates of Value to the column of range Col of this matrix Raises OutOfRange if Col < 1 or Col > 2.
	:param Col:
	:type Col: int
	:param Value:
	:type Value: gp_XY
	:rtype: None") SetCol;
		void SetCol (const Standard_Integer Col,const gp_XY & Value);

		/****************** SetCols ******************/
		%feature("compactdefaultargs") SetCols;
		%feature("autodoc", "* Assigns the number pairs Col1, Col2 to the two columns of this matrix
	:param Col1:
	:type Col1: gp_XY
	:param Col2:
	:type Col2: gp_XY
	:rtype: None") SetCols;
		void SetCols (const gp_XY & Col1,const gp_XY & Col2);

		/****************** SetDiagonal ******************/
		%feature("compactdefaultargs") SetDiagonal;
		%feature("autodoc", "* Modifies the main diagonal of the matrix. <self>.Value (1, 1) = X1 <self>.Value (2, 2) = X2 The other coefficients of the matrix are not modified.
	:param X1:
	:type X1: float
	:param X2:
	:type X2: float
	:rtype: None") SetDiagonal;
		void SetDiagonal (const Standard_Real X1,const Standard_Real X2);

		/****************** SetIdentity ******************/
		%feature("compactdefaultargs") SetIdentity;
		%feature("autodoc", "* Modifies this matrix, so that it represents the Identity matrix.
	:rtype: None") SetIdentity;
		void SetIdentity ();

		/****************** SetRotation ******************/
		%feature("compactdefaultargs") SetRotation;
		%feature("autodoc", "* Modifies this matrix, so that it representso a rotation. Ang is the angular value in radian of the rotation.
	:param Ang:
	:type Ang: float
	:rtype: None") SetRotation;
		void SetRotation (const Standard_Real Ang);

		/****************** SetRow ******************/
		%feature("compactdefaultargs") SetRow;
		%feature("autodoc", "* Assigns the two coordinates of Value to the row of index Row of this matrix. Raises OutOfRange if Row < 1 or Row > 2.
	:param Row:
	:type Row: int
	:param Value:
	:type Value: gp_XY
	:rtype: None") SetRow;
		void SetRow (const Standard_Integer Row,const gp_XY & Value);

		/****************** SetRows ******************/
		%feature("compactdefaultargs") SetRows;
		%feature("autodoc", "* Assigns the number pairs Row1, Row2 to the two rows of this matrix.
	:param Row1:
	:type Row1: gp_XY
	:param Row2:
	:type Row2: gp_XY
	:rtype: None") SetRows;
		void SetRows (const gp_XY & Row1,const gp_XY & Row2);

		/****************** SetScale ******************/
		%feature("compactdefaultargs") SetScale;
		%feature("autodoc", "* Modifies the matrix such that it represents a scaling transformation, where S is the scale factor : | S 0.0 | <self> = | 0.0 S |
	:param S:
	:type S: float
	:rtype: None") SetScale;
		void SetScale (const Standard_Real S);

		/****************** SetValue ******************/
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "* Assigns <Value> to the coefficient of row Row, column Col of this matrix. Raises OutOfRange if Row < 1 or Row > 2 or Col < 1 or Col > 2
	:param Row:
	:type Row: int
	:param Col:
	:type Col: int
	:param Value:
	:type Value: float
	:rtype: None") SetValue;
		void SetValue (const Standard_Integer Row,const Standard_Integer Col,const Standard_Real Value);

		/****************** Subtract ******************/
		%feature("compactdefaultargs") Subtract;
		%feature("autodoc", ":param Other:
	:type Other: gp_Mat2d
	:rtype: None") Subtract;
		void Subtract (const gp_Mat2d & Other);

		/****************** Subtracted ******************/
		%feature("compactdefaultargs") Subtracted;
		%feature("autodoc", "* Computes for each coefficient of the matrix : <self>.Coef(i,j) - <Other>.Coef(i,j)
	:param Other:
	:type Other: gp_Mat2d
	:rtype: Standard_NODISCARD gp_Mat2d") Subtracted;
		Standard_NODISCARD gp_Mat2d Subtracted (const gp_Mat2d & Other);

		/****************** Transpose ******************/
		%feature("compactdefaultargs") Transpose;
		%feature("autodoc", ":rtype: None") Transpose;
		void Transpose ();

		/****************** Transposed ******************/
		%feature("compactdefaultargs") Transposed;
		%feature("autodoc", "* Transposes the matrix. A(j, i) -> A (i, j)
	:rtype: Standard_NODISCARD gp_Mat2d") Transposed;
		Standard_NODISCARD gp_Mat2d Transposed ();

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "* Returns the coefficient of range (Row, Col) Raises OutOfRange if Row < 1 or Row > 2 or Col < 1 or Col > 2
	:param Row:
	:type Row: int
	:param Col:
	:type Col: int
	:rtype: float") Value;
		const Standard_Real & Value (const Standard_Integer Row,const Standard_Integer Col);

		/****************** gp_Mat2d ******************/
		%feature("compactdefaultargs") gp_Mat2d;
		%feature("autodoc", "* Creates a matrix with null coefficients.
	:rtype: None") gp_Mat2d;
		 gp_Mat2d ();

		/****************** gp_Mat2d ******************/
		%feature("compactdefaultargs") gp_Mat2d;
		%feature("autodoc", "* Col1, Col2 are the 2 columns of the matrix.
	:param Col1:
	:type Col1: gp_XY
	:param Col2:
	:type Col2: gp_XY
	:rtype: None") gp_Mat2d;
		 gp_Mat2d (const gp_XY & Col1,const gp_XY & Col2);

		/****************** operator * ******************/
		%feature("compactdefaultargs") operator *;
		%feature("autodoc", ":param Other:
	:type Other: gp_Mat2d
	:rtype: Standard_NODISCARD gp_Mat2d") operator *;
		Standard_NODISCARD gp_Mat2d operator * (const gp_Mat2d & Other);

		/****************** operator * ******************/
		%feature("compactdefaultargs") operator *;
		%feature("autodoc", ":param Scalar:
	:type Scalar: float
	:rtype: Standard_NODISCARD gp_Mat2d") operator *;
		Standard_NODISCARD gp_Mat2d operator * (const Standard_Real Scalar);


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
		%feature("autodoc", ":param Other:
	:type Other: gp_Mat2d
	:rtype: Standard_NODISCARD gp_Mat2d") operator +;
		Standard_NODISCARD gp_Mat2d operator + (const gp_Mat2d & Other);


        %extend{
            void __iadd_wrapper__(const gp_Mat2d  other) {
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
		%feature("autodoc", ":param Other:
	:type Other: gp_Mat2d
	:rtype: Standard_NODISCARD gp_Mat2d") operator -;
		Standard_NODISCARD gp_Mat2d operator - (const gp_Mat2d & Other);


        %extend{
            void __isub_wrapper__(const gp_Mat2d  other) {
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
		%feature("autodoc", ":param Scalar:
	:type Scalar: float
	:rtype: Standard_NODISCARD gp_Mat2d") operator /;
		Standard_NODISCARD gp_Mat2d operator / (const Standard_Real Scalar);


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
%nodefaultctor gp_Parab;
class gp_Parab {
	public:
		/****************** Axis ******************/
		%feature("compactdefaultargs") Axis;
		%feature("autodoc", "* Returns the main axis of the parabola. It is the axis normal to the plane of the parabola passing through the vertex of the parabola.
	:rtype: gp_Ax1") Axis;
		const gp_Ax1  Axis ();

		/****************** Directrix ******************/
		%feature("compactdefaultargs") Directrix;
		%feature("autodoc", "* Computes the directrix of this parabola. The directrix is: - a line parallel to the 'Y Direction' of the local coordinate system of this parabola, and - located on the negative side of the axis of symmetry, at a distance from the apex which is equal to the focal length of this parabola. The directrix is returned as an axis (a gp_Ax1 object), the origin of which is situated on the 'X Axis' of this parabola.
	:rtype: gp_Ax1") Directrix;
		gp_Ax1 Directrix ();

		/****************** Focal ******************/
		%feature("compactdefaultargs") Focal;
		%feature("autodoc", "* Returns the distance between the vertex and the focus of the parabola.
	:rtype: float") Focal;
		Standard_Real Focal ();

		/****************** Focus ******************/
		%feature("compactdefaultargs") Focus;
		%feature("autodoc", "* - Computes the focus of the parabola.
	:rtype: gp_Pnt") Focus;
		gp_Pnt Focus ();

		/****************** Location ******************/
		%feature("compactdefaultargs") Location;
		%feature("autodoc", "* Returns the vertex of the parabola. It is the 'Location' point of the coordinate system of the parabola.
	:rtype: gp_Pnt") Location;
		const gp_Pnt  Location ();

		/****************** Mirror ******************/
		%feature("compactdefaultargs") Mirror;
		%feature("autodoc", ":param P:
	:type P: gp_Pnt
	:rtype: None") Mirror;
		void Mirror (const gp_Pnt & P);

		/****************** Mirror ******************/
		%feature("compactdefaultargs") Mirror;
		%feature("autodoc", ":param A1:
	:type A1: gp_Ax1
	:rtype: None") Mirror;
		void Mirror (const gp_Ax1 & A1);

		/****************** Mirror ******************/
		%feature("compactdefaultargs") Mirror;
		%feature("autodoc", ":param A2:
	:type A2: gp_Ax2
	:rtype: None") Mirror;
		void Mirror (const gp_Ax2 & A2);

		/****************** Mirrored ******************/
		%feature("compactdefaultargs") Mirrored;
		%feature("autodoc", "* Performs the symmetrical transformation of a parabola with respect to the point P which is the center of the symmetry.
	:param P:
	:type P: gp_Pnt
	:rtype: Standard_NODISCARD gp_Parab") Mirrored;
		Standard_NODISCARD gp_Parab Mirrored (const gp_Pnt & P);

		/****************** Mirrored ******************/
		%feature("compactdefaultargs") Mirrored;
		%feature("autodoc", "* Performs the symmetrical transformation of a parabola with respect to an axis placement which is the axis of the symmetry.
	:param A1:
	:type A1: gp_Ax1
	:rtype: Standard_NODISCARD gp_Parab") Mirrored;
		Standard_NODISCARD gp_Parab Mirrored (const gp_Ax1 & A1);

		/****************** Mirrored ******************/
		%feature("compactdefaultargs") Mirrored;
		%feature("autodoc", "* Performs the symmetrical transformation of a parabola with respect to a plane. The axis placement A2 locates the plane of the symmetry (Location, XDirection, YDirection).
	:param A2:
	:type A2: gp_Ax2
	:rtype: Standard_NODISCARD gp_Parab") Mirrored;
		Standard_NODISCARD gp_Parab Mirrored (const gp_Ax2 & A2);

		/****************** Parameter ******************/
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "* Computes the parameter of the parabola. It is the distance between the focus and the directrix of the parabola. This distance is twice the focal length.
	:rtype: float") Parameter;
		Standard_Real Parameter ();

		/****************** Position ******************/
		%feature("compactdefaultargs") Position;
		%feature("autodoc", "* Returns the local coordinate system of the parabola.
	:rtype: gp_Ax2") Position;
		const gp_Ax2  Position ();

		/****************** Rotate ******************/
		%feature("compactdefaultargs") Rotate;
		%feature("autodoc", ":param A1:
	:type A1: gp_Ax1
	:param Ang:
	:type Ang: float
	:rtype: None") Rotate;
		void Rotate (const gp_Ax1 & A1,const Standard_Real Ang);

		/****************** Rotated ******************/
		%feature("compactdefaultargs") Rotated;
		%feature("autodoc", "* Rotates a parabola. A1 is the axis of the rotation. Ang is the angular value of the rotation in radians.
	:param A1:
	:type A1: gp_Ax1
	:param Ang:
	:type Ang: float
	:rtype: Standard_NODISCARD gp_Parab") Rotated;
		Standard_NODISCARD gp_Parab Rotated (const gp_Ax1 & A1,const Standard_Real Ang);

		/****************** Scale ******************/
		%feature("compactdefaultargs") Scale;
		%feature("autodoc", ":param P:
	:type P: gp_Pnt
	:param S:
	:type S: float
	:rtype: None") Scale;
		void Scale (const gp_Pnt & P,const Standard_Real S);

		/****************** Scaled ******************/
		%feature("compactdefaultargs") Scaled;
		%feature("autodoc", "* Scales a parabola. S is the scaling value. If S is negative the direction of the symmetry axis XAxis is reversed and the direction of the YAxis too.
	:param P:
	:type P: gp_Pnt
	:param S:
	:type S: float
	:rtype: Standard_NODISCARD gp_Parab") Scaled;
		Standard_NODISCARD gp_Parab Scaled (const gp_Pnt & P,const Standard_Real S);

		/****************** SetAxis ******************/
		%feature("compactdefaultargs") SetAxis;
		%feature("autodoc", "* Modifies this parabola by redefining its local coordinate system so that - its origin and 'main Direction' become those of the axis A1 (the 'X Direction' and 'Y Direction' are then recomputed in the same way as for any gp_Ax2) Raises ConstructionError if the direction of A1 is parallel to the previous XAxis of the parabola.
	:param A1:
	:type A1: gp_Ax1
	:rtype: None") SetAxis;
		void SetAxis (const gp_Ax1 & A1);

		/****************** SetFocal ******************/
		%feature("compactdefaultargs") SetFocal;
		%feature("autodoc", "* Changes the focal distance of the parabola. Raises ConstructionError if Focal < 0.0
	:param Focal:
	:type Focal: float
	:rtype: None") SetFocal;
		void SetFocal (const Standard_Real Focal);

		/****************** SetLocation ******************/
		%feature("compactdefaultargs") SetLocation;
		%feature("autodoc", "* Changes the location of the parabola. It is the vertex of the parabola.
	:param P:
	:type P: gp_Pnt
	:rtype: None") SetLocation;
		void SetLocation (const gp_Pnt & P);

		/****************** SetPosition ******************/
		%feature("compactdefaultargs") SetPosition;
		%feature("autodoc", "* Changes the local coordinate system of the parabola.
	:param A2:
	:type A2: gp_Ax2
	:rtype: None") SetPosition;
		void SetPosition (const gp_Ax2 & A2);

		/****************** Transform ******************/
		%feature("compactdefaultargs") Transform;
		%feature("autodoc", ":param T:
	:type T: gp_Trsf
	:rtype: None") Transform;
		void Transform (const gp_Trsf & T);

		/****************** Transformed ******************/
		%feature("compactdefaultargs") Transformed;
		%feature("autodoc", "* Transforms a parabola with the transformation T from class Trsf.
	:param T:
	:type T: gp_Trsf
	:rtype: Standard_NODISCARD gp_Parab") Transformed;
		Standard_NODISCARD gp_Parab Transformed (const gp_Trsf & T);

		/****************** Translate ******************/
		%feature("compactdefaultargs") Translate;
		%feature("autodoc", ":param V:
	:type V: gp_Vec
	:rtype: None") Translate;
		void Translate (const gp_Vec & V);

		/****************** Translate ******************/
		%feature("compactdefaultargs") Translate;
		%feature("autodoc", ":param P1:
	:type P1: gp_Pnt
	:param P2:
	:type P2: gp_Pnt
	:rtype: None") Translate;
		void Translate (const gp_Pnt & P1,const gp_Pnt & P2);

		/****************** Translated ******************/
		%feature("compactdefaultargs") Translated;
		%feature("autodoc", "* Translates a parabola in the direction of the vector V. The magnitude of the translation is the vector's magnitude.
	:param V:
	:type V: gp_Vec
	:rtype: Standard_NODISCARD gp_Parab") Translated;
		Standard_NODISCARD gp_Parab Translated (const gp_Vec & V);

		/****************** Translated ******************/
		%feature("compactdefaultargs") Translated;
		%feature("autodoc", "* Translates a parabola from the point P1 to the point P2.
	:param P1:
	:type P1: gp_Pnt
	:param P2:
	:type P2: gp_Pnt
	:rtype: Standard_NODISCARD gp_Parab") Translated;
		Standard_NODISCARD gp_Parab Translated (const gp_Pnt & P1,const gp_Pnt & P2);

		/****************** XAxis ******************/
		%feature("compactdefaultargs") XAxis;
		%feature("autodoc", "* Returns the symmetry axis of the parabola. The location point of the axis is the vertex of the parabola.
	:rtype: gp_Ax1") XAxis;
		gp_Ax1 XAxis ();

		/****************** YAxis ******************/
		%feature("compactdefaultargs") YAxis;
		%feature("autodoc", "* It is an axis parallel to the directrix of the parabola. The location point of this axis is the vertex of the parabola.
	:rtype: gp_Ax1") YAxis;
		gp_Ax1 YAxis ();

		/****************** gp_Parab ******************/
		%feature("compactdefaultargs") gp_Parab;
		%feature("autodoc", "* Creates an indefinite Parabola.
	:rtype: None") gp_Parab;
		 gp_Parab ();

		/****************** gp_Parab ******************/
		%feature("compactdefaultargs") gp_Parab;
		%feature("autodoc", "* Creates a parabola with its local coordinate system 'A2' and it's focal length 'Focal'. The XDirection of A2 defines the axis of symmetry of the parabola. The YDirection of A2 is parallel to the directrix of the parabola. The Location point of A2 is the vertex of the parabola Raises ConstructionError if Focal < 0.0 Raised if Focal < 0.0
	:param A2:
	:type A2: gp_Ax2
	:param Focal:
	:type Focal: float
	:rtype: None") gp_Parab;
		 gp_Parab (const gp_Ax2 & A2,const Standard_Real Focal);

		/****************** gp_Parab ******************/
		%feature("compactdefaultargs") gp_Parab;
		%feature("autodoc", "* D is the directrix of the parabola and F the focus point. The symmetry axis (XAxis) of the parabola is normal to the directrix and pass through the focus point F, but its location point is the vertex of the parabola. The YAxis of the parabola is parallel to D and its location point is the vertex of the parabola. The normal to the plane of the parabola is the cross product between the XAxis and the YAxis.
	:param D:
	:type D: gp_Ax1
	:param F:
	:type F: gp_Pnt
	:rtype: None") gp_Parab;
		 gp_Parab (const gp_Ax1 & D,const gp_Pnt & F);

};


%extend gp_Parab {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************
* class gp_Parab2d *
*******************/
%nodefaultctor gp_Parab2d;
class gp_Parab2d {
	public:
		/****************** Axis ******************/
		%feature("compactdefaultargs") Axis;
		%feature("autodoc", "* Returns the local coordinate system of the parabola. The 'Location' point of this axis is the vertex of the parabola.
	:rtype: gp_Ax22d") Axis;
		gp_Ax22d Axis ();

		/****************** Coefficients ******************/
		%feature("compactdefaultargs") Coefficients;
		%feature("autodoc", "* Computes the coefficients of the implicit equation of the parabola (in WCS - World Coordinate System). A * (X**2) + B * (Y**2) + 2*C*(X*Y) + 2*D*X + 2*E*Y + F = 0.
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
	:rtype: None") Coefficients;
		void Coefficients (Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);

		/****************** Directrix ******************/
		%feature("compactdefaultargs") Directrix;
		%feature("autodoc", "* Computes the directrix of the parabola. The directrix is: - a line parallel to the 'Y Direction' of the local coordinate system of this parabola, and - located on the negative side of the axis of symmetry, at a distance from the apex which is equal to the focal length of this parabola. The directrix is returned as an axis (a gp_Ax2d object), the origin of which is situated on the 'X Axis' of this parabola.
	:rtype: gp_Ax2d") Directrix;
		gp_Ax2d Directrix ();

		/****************** Focal ******************/
		%feature("compactdefaultargs") Focal;
		%feature("autodoc", "* Returns the distance between the vertex and the focus of the parabola.
	:rtype: float") Focal;
		Standard_Real Focal ();

		/****************** Focus ******************/
		%feature("compactdefaultargs") Focus;
		%feature("autodoc", "* Returns the focus of the parabola.
	:rtype: gp_Pnt2d") Focus;
		gp_Pnt2d Focus ();

		/****************** IsDirect ******************/
		%feature("compactdefaultargs") IsDirect;
		%feature("autodoc", "* Returns true if the local coordinate system is direct and false in the other case.
	:rtype: bool") IsDirect;
		Standard_Boolean IsDirect ();

		/****************** Location ******************/
		%feature("compactdefaultargs") Location;
		%feature("autodoc", "* Returns the vertex of the parabola.
	:rtype: gp_Pnt2d") Location;
		gp_Pnt2d Location ();

		/****************** Mirror ******************/
		%feature("compactdefaultargs") Mirror;
		%feature("autodoc", ":param P:
	:type P: gp_Pnt2d
	:rtype: None") Mirror;
		void Mirror (const gp_Pnt2d & P);

		/****************** Mirror ******************/
		%feature("compactdefaultargs") Mirror;
		%feature("autodoc", ":param A:
	:type A: gp_Ax2d
	:rtype: None") Mirror;
		void Mirror (const gp_Ax2d & A);

		/****************** MirrorAxis ******************/
		%feature("compactdefaultargs") MirrorAxis;
		%feature("autodoc", "* Returns the symmetry axis of the parabola. The 'Location' point of this axis is the vertex of the parabola.
	:rtype: gp_Ax2d") MirrorAxis;
		gp_Ax2d MirrorAxis ();

		/****************** Mirrored ******************/
		%feature("compactdefaultargs") Mirrored;
		%feature("autodoc", "* Performs the symmetrical transformation of a parabola with respect to the point P which is the center of the symmetry
	:param P:
	:type P: gp_Pnt2d
	:rtype: Standard_NODISCARD gp_Parab2d") Mirrored;
		Standard_NODISCARD gp_Parab2d Mirrored (const gp_Pnt2d & P);

		/****************** Mirrored ******************/
		%feature("compactdefaultargs") Mirrored;
		%feature("autodoc", "* Performs the symmetrical transformation of a parabola with respect to an axis placement which is the axis of the symmetry.
	:param A:
	:type A: gp_Ax2d
	:rtype: Standard_NODISCARD gp_Parab2d") Mirrored;
		Standard_NODISCARD gp_Parab2d Mirrored (const gp_Ax2d & A);

		/****************** Parameter ******************/
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "* Returns the distance between the focus and the directrix of the parabola.
	:rtype: float") Parameter;
		Standard_Real Parameter ();

		/****************** Reverse ******************/
		%feature("compactdefaultargs") Reverse;
		%feature("autodoc", ":rtype: None") Reverse;
		void Reverse ();

		/****************** Reversed ******************/
		%feature("compactdefaultargs") Reversed;
		%feature("autodoc", "* Reverses the orientation of the local coordinate system of this parabola (the 'Y Direction' is reversed). Therefore, the implicit orientation of this parabola is reversed. Note: - Reverse assigns the result to this parabola, while - Reversed creates a new one.
	:rtype: Standard_NODISCARD gp_Parab2d") Reversed;
		Standard_NODISCARD gp_Parab2d Reversed ();

		/****************** Rotate ******************/
		%feature("compactdefaultargs") Rotate;
		%feature("autodoc", ":param P:
	:type P: gp_Pnt2d
	:param Ang:
	:type Ang: float
	:rtype: None") Rotate;
		void Rotate (const gp_Pnt2d & P,const Standard_Real Ang);

		/****************** Rotated ******************/
		%feature("compactdefaultargs") Rotated;
		%feature("autodoc", "* Rotates a parabola. P is the center of the rotation. Ang is the angular value of the rotation in radians.
	:param P:
	:type P: gp_Pnt2d
	:param Ang:
	:type Ang: float
	:rtype: Standard_NODISCARD gp_Parab2d") Rotated;
		Standard_NODISCARD gp_Parab2d Rotated (const gp_Pnt2d & P,const Standard_Real Ang);

		/****************** Scale ******************/
		%feature("compactdefaultargs") Scale;
		%feature("autodoc", ":param P:
	:type P: gp_Pnt2d
	:param S:
	:type S: float
	:rtype: None") Scale;
		void Scale (const gp_Pnt2d & P,const Standard_Real S);

		/****************** Scaled ******************/
		%feature("compactdefaultargs") Scaled;
		%feature("autodoc", "* Scales a parabola. S is the scaling value. If S is negative the direction of the symmetry axis 'XAxis' is reversed and the direction of the 'YAxis' too.
	:param P:
	:type P: gp_Pnt2d
	:param S:
	:type S: float
	:rtype: Standard_NODISCARD gp_Parab2d") Scaled;
		Standard_NODISCARD gp_Parab2d Scaled (const gp_Pnt2d & P,const Standard_Real S);

		/****************** SetAxis ******************/
		%feature("compactdefaultargs") SetAxis;
		%feature("autodoc", "* Changes the local coordinate system of the parabola. The 'Location' point of A becomes the vertex of the parabola.
	:param A:
	:type A: gp_Ax22d
	:rtype: None") SetAxis;
		void SetAxis (const gp_Ax22d & A);

		/****************** SetFocal ******************/
		%feature("compactdefaultargs") SetFocal;
		%feature("autodoc", "* Changes the focal distance of the parabola Warnings : It is possible to have Focal = 0. Raises ConstructionError if Focal < 0.0
	:param Focal:
	:type Focal: float
	:rtype: None") SetFocal;
		void SetFocal (const Standard_Real Focal);

		/****************** SetLocation ******************/
		%feature("compactdefaultargs") SetLocation;
		%feature("autodoc", "* Changes the 'Location' point of the parabola. It is the vertex of the parabola.
	:param P:
	:type P: gp_Pnt2d
	:rtype: None") SetLocation;
		void SetLocation (const gp_Pnt2d & P);

		/****************** SetMirrorAxis ******************/
		%feature("compactdefaultargs") SetMirrorAxis;
		%feature("autodoc", "* Modifies this parabola, by redefining its local coordinate system so that its origin and 'X Direction' become those of the axis MA. The 'Y Direction' of the local coordinate system is then recomputed. The orientation of the local coordinate system is not modified.
	:param A:
	:type A: gp_Ax2d
	:rtype: None") SetMirrorAxis;
		void SetMirrorAxis (const gp_Ax2d & A);

		/****************** Transform ******************/
		%feature("compactdefaultargs") Transform;
		%feature("autodoc", ":param T:
	:type T: gp_Trsf2d
	:rtype: None") Transform;
		void Transform (const gp_Trsf2d & T);

		/****************** Transformed ******************/
		%feature("compactdefaultargs") Transformed;
		%feature("autodoc", "* Transforms an parabola with the transformation T from class Trsf2d.
	:param T:
	:type T: gp_Trsf2d
	:rtype: Standard_NODISCARD gp_Parab2d") Transformed;
		Standard_NODISCARD gp_Parab2d Transformed (const gp_Trsf2d & T);

		/****************** Translate ******************/
		%feature("compactdefaultargs") Translate;
		%feature("autodoc", ":param V:
	:type V: gp_Vec2d
	:rtype: None") Translate;
		void Translate (const gp_Vec2d & V);

		/****************** Translate ******************/
		%feature("compactdefaultargs") Translate;
		%feature("autodoc", ":param P1:
	:type P1: gp_Pnt2d
	:param P2:
	:type P2: gp_Pnt2d
	:rtype: None") Translate;
		void Translate (const gp_Pnt2d & P1,const gp_Pnt2d & P2);

		/****************** Translated ******************/
		%feature("compactdefaultargs") Translated;
		%feature("autodoc", "* Translates a parabola in the direction of the vector V. The magnitude of the translation is the vector's magnitude.
	:param V:
	:type V: gp_Vec2d
	:rtype: Standard_NODISCARD gp_Parab2d") Translated;
		Standard_NODISCARD gp_Parab2d Translated (const gp_Vec2d & V);

		/****************** Translated ******************/
		%feature("compactdefaultargs") Translated;
		%feature("autodoc", "* Translates a parabola from the point P1 to the point P2.
	:param P1:
	:type P1: gp_Pnt2d
	:param P2:
	:type P2: gp_Pnt2d
	:rtype: Standard_NODISCARD gp_Parab2d") Translated;
		Standard_NODISCARD gp_Parab2d Translated (const gp_Pnt2d & P1,const gp_Pnt2d & P2);

		/****************** gp_Parab2d ******************/
		%feature("compactdefaultargs") gp_Parab2d;
		%feature("autodoc", "* Creates an indefinite parabola.
	:rtype: None") gp_Parab2d;
		 gp_Parab2d ();

		/****************** gp_Parab2d ******************/
		%feature("compactdefaultargs") gp_Parab2d;
		%feature("autodoc", "* Creates a parabola with its vertex point, its axis of symmetry ('XAxis') and its focal length. The sense of parametrization is given by theSense. If theSense == True (by default) then right-handed coordinate system is used, otherwise - left-handed. Warnings : It is possible to have FocalLength = 0. In this case, the parabola looks like a line, which is parallel to the symmetry-axis. Raises ConstructionError if FocalLength < 0.0
	:param theMirrorAxis:
	:type theMirrorAxis: gp_Ax2d
	:param theFocalLength:
	:type theFocalLength: float
	:param theSense: default value is Standard_True
	:type theSense: bool
	:rtype: None") gp_Parab2d;
		 gp_Parab2d (const gp_Ax2d & theMirrorAxis,const Standard_Real theFocalLength,const Standard_Boolean theSense = Standard_True);

		/****************** gp_Parab2d ******************/
		%feature("compactdefaultargs") gp_Parab2d;
		%feature("autodoc", "* Creates a parabola with its vertex point, its axis of symmetry ('XAxis'), correspond Y-axis and its focal length. Warnings : It is possible to have FocalLength = 0. In this case, the parabola looks like a line, which is parallel to the symmetry-axis. Raises ConstructionError if Focal < 0.0
	:param theAxes:
	:type theAxes: gp_Ax22d
	:param theFocalLength:
	:type theFocalLength: float
	:rtype: None") gp_Parab2d;
		 gp_Parab2d (const gp_Ax22d & theAxes,const Standard_Real theFocalLength);

		/****************** gp_Parab2d ******************/
		%feature("compactdefaultargs") gp_Parab2d;
		%feature("autodoc", "* Creates a parabola with the directrix and the focus point. Y-axis of the parabola (in User Coordinate System - UCS) is the direction of theDirectrix. X-axis always directs from theDirectrix to theFocus point and always comes through theFocus. Apex of the parabola is a middle point between the theFocus and the intersection point of theDirectrix and the X-axis. Warnings : It is possible to have FocalLength = 0 (when theFocus lies in theDirectrix). In this case, X-direction of the parabola is defined by theSense parameter. If theSense == True (by default) then right-handed coordinate system is used, otherwise - left-handed. Result parabola will look like a line, which is perpendicular to the directrix.
	:param theDirectrix:
	:type theDirectrix: gp_Ax2d
	:param theFocus:
	:type theFocus: gp_Pnt2d
	:param theSense: default value is Standard_True
	:type theSense: bool
	:rtype: None") gp_Parab2d;
		 gp_Parab2d (const gp_Ax2d & theDirectrix,const gp_Pnt2d & theFocus,const Standard_Boolean theSense = Standard_True);

};


%extend gp_Parab2d {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************
* class gp_Pln *
***************/
%nodefaultctor gp_Pln;
class gp_Pln {
	public:
		/****************** Axis ******************/
		%feature("compactdefaultargs") Axis;
		%feature("autodoc", "* Returns the plane's normal Axis.
	:rtype: gp_Ax1") Axis;
		const gp_Ax1  Axis ();

		/****************** Coefficients ******************/
		%feature("compactdefaultargs") Coefficients;
		%feature("autodoc", "* Returns the coefficients of the plane's cartesian equation : A * X + B * Y + C * Z + D = 0.
	:param A:
	:type A: float &
	:param B:
	:type B: float &
	:param C:
	:type C: float &
	:param D:
	:type D: float &
	:rtype: None") Coefficients;
		void Coefficients (Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);

		/****************** Contains ******************/
		%feature("compactdefaultargs") Contains;
		%feature("autodoc", "* Returns true if this plane contains the point P. This means that - the distance between point P and this plane is less than or equal to LinearTolerance, or - line L is normal to the 'main Axis' of the local coordinate system of this plane, within the tolerance AngularTolerance, and the distance between the origin of line L and this plane is less than or equal to LinearTolerance.
	:param P:
	:type P: gp_Pnt
	:param LinearTolerance:
	:type LinearTolerance: float
	:rtype: bool") Contains;
		Standard_Boolean Contains (const gp_Pnt & P,const Standard_Real LinearTolerance);

		/****************** Contains ******************/
		%feature("compactdefaultargs") Contains;
		%feature("autodoc", "* Returns true if this plane contains the line L. This means that - the distance between point P and this plane is less than or equal to LinearTolerance, or - line L is normal to the 'main Axis' of the local coordinate system of this plane, within the tolerance AngularTolerance, and the distance between the origin of line L and this plane is less than or equal to LinearTolerance.
	:param L:
	:type L: gp_Lin
	:param LinearTolerance:
	:type LinearTolerance: float
	:param AngularTolerance:
	:type AngularTolerance: float
	:rtype: bool") Contains;
		Standard_Boolean Contains (const gp_Lin & L,const Standard_Real LinearTolerance,const Standard_Real AngularTolerance);

		/****************** Direct ******************/
		%feature("compactdefaultargs") Direct;
		%feature("autodoc", "* returns true if the Ax3 is right handed.
	:rtype: bool") Direct;
		Standard_Boolean Direct ();

		/****************** Distance ******************/
		%feature("compactdefaultargs") Distance;
		%feature("autodoc", "* Computes the distance between <self> and the point <P>.
	:param P:
	:type P: gp_Pnt
	:rtype: float") Distance;
		Standard_Real Distance (const gp_Pnt & P);

		/****************** Distance ******************/
		%feature("compactdefaultargs") Distance;
		%feature("autodoc", "* Computes the distance between <self> and the line <L>.
	:param L:
	:type L: gp_Lin
	:rtype: float") Distance;
		Standard_Real Distance (const gp_Lin & L);

		/****************** Distance ******************/
		%feature("compactdefaultargs") Distance;
		%feature("autodoc", "* Computes the distance between two planes.
	:param Other:
	:type Other: gp_Pln
	:rtype: float") Distance;
		Standard_Real Distance (const gp_Pln & Other);

		/****************** Location ******************/
		%feature("compactdefaultargs") Location;
		%feature("autodoc", "* Returns the plane's location (origin).
	:rtype: gp_Pnt") Location;
		const gp_Pnt  Location ();

		/****************** Mirror ******************/
		%feature("compactdefaultargs") Mirror;
		%feature("autodoc", ":param P:
	:type P: gp_Pnt
	:rtype: None") Mirror;
		void Mirror (const gp_Pnt & P);

		/****************** Mirror ******************/
		%feature("compactdefaultargs") Mirror;
		%feature("autodoc", ":param A1:
	:type A1: gp_Ax1
	:rtype: None") Mirror;
		void Mirror (const gp_Ax1 & A1);

		/****************** Mirror ******************/
		%feature("compactdefaultargs") Mirror;
		%feature("autodoc", ":param A2:
	:type A2: gp_Ax2
	:rtype: None") Mirror;
		void Mirror (const gp_Ax2 & A2);

		/****************** Mirrored ******************/
		%feature("compactdefaultargs") Mirrored;
		%feature("autodoc", "* Performs the symmetrical transformation of a plane with respect to the point <P> which is the center of the symmetry Warnings : The normal direction to the plane is not changed. The 'XAxis' and the 'YAxis' are reversed.
	:param P:
	:type P: gp_Pnt
	:rtype: Standard_NODISCARD gp_Pln") Mirrored;
		Standard_NODISCARD gp_Pln Mirrored (const gp_Pnt & P);

		/****************** Mirrored ******************/
		%feature("compactdefaultargs") Mirrored;
		%feature("autodoc", "* Performs the symmetrical transformation of a plane with respect to an axis placement which is the axis of the symmetry. The transformation is performed on the 'Location' point, on the 'XAxis' and the 'YAxis'. The resulting normal direction is the cross product between the 'XDirection' and the 'YDirection' after transformation if the initial plane was right handed, else it is the opposite.
	:param A1:
	:type A1: gp_Ax1
	:rtype: Standard_NODISCARD gp_Pln") Mirrored;
		Standard_NODISCARD gp_Pln Mirrored (const gp_Ax1 & A1);

		/****************** Mirrored ******************/
		%feature("compactdefaultargs") Mirrored;
		%feature("autodoc", "* Performs the symmetrical transformation of a plane with respect to an axis placement. The axis placement <A2> locates the plane of the symmetry. The transformation is performed on the 'Location' point, on the 'XAxis' and the 'YAxis'. The resulting normal direction is the cross product between the 'XDirection' and the 'YDirection' after transformation if the initial plane was right handed, else it is the opposite.
	:param A2:
	:type A2: gp_Ax2
	:rtype: Standard_NODISCARD gp_Pln") Mirrored;
		Standard_NODISCARD gp_Pln Mirrored (const gp_Ax2 & A2);

		/****************** Position ******************/
		%feature("compactdefaultargs") Position;
		%feature("autodoc", "* Returns the local coordinate system of the plane .
	:rtype: gp_Ax3") Position;
		const gp_Ax3  Position ();

		/****************** Rotate ******************/
		%feature("compactdefaultargs") Rotate;
		%feature("autodoc", ":param A1:
	:type A1: gp_Ax1
	:param Ang:
	:type Ang: float
	:rtype: None") Rotate;
		void Rotate (const gp_Ax1 & A1,const Standard_Real Ang);

		/****************** Rotated ******************/
		%feature("compactdefaultargs") Rotated;
		%feature("autodoc", "* rotates a plane. A1 is the axis of the rotation. Ang is the angular value of the rotation in radians.
	:param A1:
	:type A1: gp_Ax1
	:param Ang:
	:type Ang: float
	:rtype: Standard_NODISCARD gp_Pln") Rotated;
		Standard_NODISCARD gp_Pln Rotated (const gp_Ax1 & A1,const Standard_Real Ang);

		/****************** Scale ******************/
		%feature("compactdefaultargs") Scale;
		%feature("autodoc", ":param P:
	:type P: gp_Pnt
	:param S:
	:type S: float
	:rtype: None") Scale;
		void Scale (const gp_Pnt & P,const Standard_Real S);

		/****************** Scaled ******************/
		%feature("compactdefaultargs") Scaled;
		%feature("autodoc", "* Scales a plane. S is the scaling value.
	:param P:
	:type P: gp_Pnt
	:param S:
	:type S: float
	:rtype: Standard_NODISCARD gp_Pln") Scaled;
		Standard_NODISCARD gp_Pln Scaled (const gp_Pnt & P,const Standard_Real S);

		/****************** SetAxis ******************/
		%feature("compactdefaultargs") SetAxis;
		%feature("autodoc", "* Modifies this plane, by redefining its local coordinate system so that - its origin and 'main Direction' become those of the axis A1 (the 'X Direction' and 'Y Direction' are then recomputed). Raises ConstructionError if the A1 is parallel to the 'XAxis' of the plane.
	:param A1:
	:type A1: gp_Ax1
	:rtype: None") SetAxis;
		void SetAxis (const gp_Ax1 & A1);

		/****************** SetLocation ******************/
		%feature("compactdefaultargs") SetLocation;
		%feature("autodoc", "* Changes the origin of the plane.
	:param Loc:
	:type Loc: gp_Pnt
	:rtype: None") SetLocation;
		void SetLocation (const gp_Pnt & Loc);

		/****************** SetPosition ******************/
		%feature("compactdefaultargs") SetPosition;
		%feature("autodoc", "* Changes the local coordinate system of the plane.
	:param A3:
	:type A3: gp_Ax3
	:rtype: None") SetPosition;
		void SetPosition (const gp_Ax3 & A3);

		/****************** SquareDistance ******************/
		%feature("compactdefaultargs") SquareDistance;
		%feature("autodoc", "* Computes the square distance between <self> and the point <P>.
	:param P:
	:type P: gp_Pnt
	:rtype: float") SquareDistance;
		Standard_Real SquareDistance (const gp_Pnt & P);

		/****************** SquareDistance ******************/
		%feature("compactdefaultargs") SquareDistance;
		%feature("autodoc", "* Computes the square distance between <self> and the line <L>.
	:param L:
	:type L: gp_Lin
	:rtype: float") SquareDistance;
		Standard_Real SquareDistance (const gp_Lin & L);

		/****************** SquareDistance ******************/
		%feature("compactdefaultargs") SquareDistance;
		%feature("autodoc", "* Computes the square distance between two planes.
	:param Other:
	:type Other: gp_Pln
	:rtype: float") SquareDistance;
		Standard_Real SquareDistance (const gp_Pln & Other);

		/****************** Transform ******************/
		%feature("compactdefaultargs") Transform;
		%feature("autodoc", ":param T:
	:type T: gp_Trsf
	:rtype: None") Transform;
		void Transform (const gp_Trsf & T);

		/****************** Transformed ******************/
		%feature("compactdefaultargs") Transformed;
		%feature("autodoc", "* Transforms a plane with the transformation T from class Trsf. The transformation is performed on the 'Location' point, on the 'XAxis' and the 'YAxis'. The resulting normal direction is the cross product between the 'XDirection' and the 'YDirection' after transformation.
	:param T:
	:type T: gp_Trsf
	:rtype: Standard_NODISCARD gp_Pln") Transformed;
		Standard_NODISCARD gp_Pln Transformed (const gp_Trsf & T);

		/****************** Translate ******************/
		%feature("compactdefaultargs") Translate;
		%feature("autodoc", ":param V:
	:type V: gp_Vec
	:rtype: None") Translate;
		void Translate (const gp_Vec & V);

		/****************** Translate ******************/
		%feature("compactdefaultargs") Translate;
		%feature("autodoc", ":param P1:
	:type P1: gp_Pnt
	:param P2:
	:type P2: gp_Pnt
	:rtype: None") Translate;
		void Translate (const gp_Pnt & P1,const gp_Pnt & P2);

		/****************** Translated ******************/
		%feature("compactdefaultargs") Translated;
		%feature("autodoc", "* Translates a plane in the direction of the vector V. The magnitude of the translation is the vector's magnitude.
	:param V:
	:type V: gp_Vec
	:rtype: Standard_NODISCARD gp_Pln") Translated;
		Standard_NODISCARD gp_Pln Translated (const gp_Vec & V);

		/****************** Translated ******************/
		%feature("compactdefaultargs") Translated;
		%feature("autodoc", "* Translates a plane from the point P1 to the point P2.
	:param P1:
	:type P1: gp_Pnt
	:param P2:
	:type P2: gp_Pnt
	:rtype: Standard_NODISCARD gp_Pln") Translated;
		Standard_NODISCARD gp_Pln Translated (const gp_Pnt & P1,const gp_Pnt & P2);

		/****************** UReverse ******************/
		%feature("compactdefaultargs") UReverse;
		%feature("autodoc", "* Reverses the U parametrization of the plane reversing the XAxis.
	:rtype: None") UReverse;
		void UReverse ();

		/****************** VReverse ******************/
		%feature("compactdefaultargs") VReverse;
		%feature("autodoc", "* Reverses the V parametrization of the plane reversing the YAxis.
	:rtype: None") VReverse;
		void VReverse ();

		/****************** XAxis ******************/
		%feature("compactdefaultargs") XAxis;
		%feature("autodoc", "* Returns the X axis of the plane.
	:rtype: gp_Ax1") XAxis;
		gp_Ax1 XAxis ();

		/****************** YAxis ******************/
		%feature("compactdefaultargs") YAxis;
		%feature("autodoc", "* Returns the Y axis of the plane.
	:rtype: gp_Ax1") YAxis;
		gp_Ax1 YAxis ();

		/****************** gp_Pln ******************/
		%feature("compactdefaultargs") gp_Pln;
		%feature("autodoc", "* Creates a plane coincident with OXY plane of the reference coordinate system.
	:rtype: None") gp_Pln;
		 gp_Pln ();

		/****************** gp_Pln ******************/
		%feature("compactdefaultargs") gp_Pln;
		%feature("autodoc", "* The coordinate system of the plane is defined with the axis placement A3. The 'Direction' of A3 defines the normal to the plane. The 'Location' of A3 defines the location (origin) of the plane. The 'XDirection' and 'YDirection' of A3 define the 'XAxis' and the 'YAxis' of the plane used to parametrize the plane.
	:param A3:
	:type A3: gp_Ax3
	:rtype: None") gp_Pln;
		 gp_Pln (const gp_Ax3 & A3);

		/****************** gp_Pln ******************/
		%feature("compactdefaultargs") gp_Pln;
		%feature("autodoc", "* Creates a plane with the 'Location' point <P> and the normal direction <V>.
	:param P:
	:type P: gp_Pnt
	:param V:
	:type V: gp_Dir
	:rtype: None") gp_Pln;
		 gp_Pln (const gp_Pnt & P,const gp_Dir & V);

		/****************** gp_Pln ******************/
		%feature("compactdefaultargs") gp_Pln;
		%feature("autodoc", "* Creates a plane from its cartesian equation : A * X + B * Y + C * Z + D = 0.0 Raises ConstructionError if Sqrt (A*A + B*B + C*C) <= Resolution from gp.
	:param A:
	:type A: float
	:param B:
	:type B: float
	:param C:
	:type C: float
	:param D:
	:type D: float
	:rtype: None") gp_Pln;
		 gp_Pln (const Standard_Real A,const Standard_Real B,const Standard_Real C,const Standard_Real D);

};


%extend gp_Pln {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************
* class gp_Pnt *
***************/
%nodefaultctor gp_Pnt;
class gp_Pnt {
	public:
		/****************** BaryCenter ******************/
		%feature("compactdefaultargs") BaryCenter;
		%feature("autodoc", "* Assigns the result of the following expression to this point (Alpha*this + Beta*P) / (Alpha + Beta)
	:param Alpha:
	:type Alpha: float
	:param P:
	:type P: gp_Pnt
	:param Beta:
	:type Beta: float
	:rtype: None") BaryCenter;
		void BaryCenter (const Standard_Real Alpha,const gp_Pnt & P,const Standard_Real Beta);

		/****************** ChangeCoord ******************/
		%feature("compactdefaultargs") ChangeCoord;
		%feature("autodoc", "* Returns the coordinates of this point. Note: This syntax allows direct modification of the returned value.
	:rtype: gp_XYZ") ChangeCoord;
		gp_XYZ  ChangeCoord ();

		/****************** Coord ******************/
		%feature("compactdefaultargs") Coord;
		%feature("autodoc", "* Returns the coordinate of corresponding to the value of Index : Index = 1 => X is returned Index = 2 => Y is returned Index = 3 => Z is returned Raises OutOfRange if Index != {1, 2, 3}. Raised if Index != {1, 2, 3}.
	:param Index:
	:type Index: int
	:rtype: float") Coord;
		Standard_Real Coord (const Standard_Integer Index);

		/****************** Coord ******************/
		%feature("compactdefaultargs") Coord;
		%feature("autodoc", "* For this point gives its three coordinates Xp, Yp and Zp.
	:param Xp:
	:type Xp: float &
	:param Yp:
	:type Yp: float &
	:param Zp:
	:type Zp: float &
	:rtype: None") Coord;
		void Coord (Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);

		/****************** Coord ******************/
		%feature("compactdefaultargs") Coord;
		%feature("autodoc", "* For this point, returns its three coordinates as a XYZ object.
	:rtype: gp_XYZ") Coord;
		const gp_XYZ  Coord ();

		/****************** Distance ******************/
		%feature("compactdefaultargs") Distance;
		%feature("autodoc", "* Computes the distance between two points.
	:param Other:
	:type Other: gp_Pnt
	:rtype: float") Distance;
		Standard_Real Distance (const gp_Pnt & Other);

		/****************** IsEqual ******************/
		%feature("compactdefaultargs") IsEqual;
		%feature("autodoc", "* Comparison Returns True if the distance between the two points is lower or equal to LinearTolerance.
	:param Other:
	:type Other: gp_Pnt
	:param LinearTolerance:
	:type LinearTolerance: float
	:rtype: bool") IsEqual;
		Standard_Boolean IsEqual (const gp_Pnt & Other,const Standard_Real LinearTolerance);

		/****************** Mirror ******************/
		%feature("compactdefaultargs") Mirror;
		%feature("autodoc", "* Performs the symmetrical transformation of a point with respect to the point P which is the center of the symmetry.
	:param P:
	:type P: gp_Pnt
	:rtype: None") Mirror;
		void Mirror (const gp_Pnt & P);

		/****************** Mirror ******************/
		%feature("compactdefaultargs") Mirror;
		%feature("autodoc", ":param A1:
	:type A1: gp_Ax1
	:rtype: None") Mirror;
		void Mirror (const gp_Ax1 & A1);

		/****************** Mirror ******************/
		%feature("compactdefaultargs") Mirror;
		%feature("autodoc", ":param A2:
	:type A2: gp_Ax2
	:rtype: None") Mirror;
		void Mirror (const gp_Ax2 & A2);

		/****************** Mirrored ******************/
		%feature("compactdefaultargs") Mirrored;
		%feature("autodoc", "* Performs the symmetrical transformation of a point with respect to an axis placement which is the axis of the symmetry.
	:param P:
	:type P: gp_Pnt
	:rtype: Standard_NODISCARD gp_Pnt") Mirrored;
		Standard_NODISCARD gp_Pnt Mirrored (const gp_Pnt & P);

		/****************** Mirrored ******************/
		%feature("compactdefaultargs") Mirrored;
		%feature("autodoc", "* Performs the symmetrical transformation of a point with respect to a plane. The axis placement A2 locates the plane of the symmetry : (Location, XDirection, YDirection).
	:param A1:
	:type A1: gp_Ax1
	:rtype: Standard_NODISCARD gp_Pnt") Mirrored;
		Standard_NODISCARD gp_Pnt Mirrored (const gp_Ax1 & A1);

		/****************** Mirrored ******************/
		%feature("compactdefaultargs") Mirrored;
		%feature("autodoc", "* Rotates a point. A1 is the axis of the rotation. Ang is the angular value of the rotation in radians.
	:param A2:
	:type A2: gp_Ax2
	:rtype: Standard_NODISCARD gp_Pnt") Mirrored;
		Standard_NODISCARD gp_Pnt Mirrored (const gp_Ax2 & A2);

		/****************** Rotate ******************/
		%feature("compactdefaultargs") Rotate;
		%feature("autodoc", ":param A1:
	:type A1: gp_Ax1
	:param Ang:
	:type Ang: float
	:rtype: None") Rotate;
		void Rotate (const gp_Ax1 & A1,const Standard_Real Ang);

		/****************** Rotated ******************/
		%feature("compactdefaultargs") Rotated;
		%feature("autodoc", "* Scales a point. S is the scaling value.
	:param A1:
	:type A1: gp_Ax1
	:param Ang:
	:type Ang: float
	:rtype: Standard_NODISCARD gp_Pnt") Rotated;
		Standard_NODISCARD gp_Pnt Rotated (const gp_Ax1 & A1,const Standard_Real Ang);

		/****************** Scale ******************/
		%feature("compactdefaultargs") Scale;
		%feature("autodoc", ":param P:
	:type P: gp_Pnt
	:param S:
	:type S: float
	:rtype: None") Scale;
		void Scale (const gp_Pnt & P,const Standard_Real S);

		/****************** Scaled ******************/
		%feature("compactdefaultargs") Scaled;
		%feature("autodoc", "* Transforms a point with the transformation T.
	:param P:
	:type P: gp_Pnt
	:param S:
	:type S: float
	:rtype: Standard_NODISCARD gp_Pnt") Scaled;
		Standard_NODISCARD gp_Pnt Scaled (const gp_Pnt & P,const Standard_Real S);

		/****************** SetCoord ******************/
		%feature("compactdefaultargs") SetCoord;
		%feature("autodoc", "* Changes the coordinate of range Index : Index = 1 => X is modified Index = 2 => Y is modified Index = 3 => Z is modified Raised if Index != {1, 2, 3}.
	:param Index:
	:type Index: int
	:param Xi:
	:type Xi: float
	:rtype: None") SetCoord;
		void SetCoord (const Standard_Integer Index,const Standard_Real Xi);

		/****************** SetCoord ******************/
		%feature("compactdefaultargs") SetCoord;
		%feature("autodoc", "* For this point, assigns the values Xp, Yp and Zp to its three coordinates.
	:param Xp:
	:type Xp: float
	:param Yp:
	:type Yp: float
	:param Zp:
	:type Zp: float
	:rtype: None") SetCoord;
		void SetCoord (const Standard_Real Xp,const Standard_Real Yp,const Standard_Real Zp);

		/****************** SetX ******************/
		%feature("compactdefaultargs") SetX;
		%feature("autodoc", "* Assigns the given value to the X coordinate of this point.
	:param X:
	:type X: float
	:rtype: None") SetX;
		void SetX (const Standard_Real X);

		/****************** SetXYZ ******************/
		%feature("compactdefaultargs") SetXYZ;
		%feature("autodoc", "* Assigns the three coordinates of Coord to this point.
	:param Coord:
	:type Coord: gp_XYZ
	:rtype: None") SetXYZ;
		void SetXYZ (const gp_XYZ & Coord);

		/****************** SetY ******************/
		%feature("compactdefaultargs") SetY;
		%feature("autodoc", "* Assigns the given value to the Y coordinate of this point.
	:param Y:
	:type Y: float
	:rtype: None") SetY;
		void SetY (const Standard_Real Y);

		/****************** SetZ ******************/
		%feature("compactdefaultargs") SetZ;
		%feature("autodoc", "* Assigns the given value to the Z coordinate of this point.
	:param Z:
	:type Z: float
	:rtype: None") SetZ;
		void SetZ (const Standard_Real Z);

		/****************** SquareDistance ******************/
		%feature("compactdefaultargs") SquareDistance;
		%feature("autodoc", "* Computes the square distance between two points.
	:param Other:
	:type Other: gp_Pnt
	:rtype: float") SquareDistance;
		Standard_Real SquareDistance (const gp_Pnt & Other);

		/****************** Transform ******************/
		%feature("compactdefaultargs") Transform;
		%feature("autodoc", ":param T:
	:type T: gp_Trsf
	:rtype: None") Transform;
		void Transform (const gp_Trsf & T);

		/****************** Transformed ******************/
		%feature("compactdefaultargs") Transformed;
		%feature("autodoc", "* Translates a point in the direction of the vector V. The magnitude of the translation is the vector's magnitude.
	:param T:
	:type T: gp_Trsf
	:rtype: Standard_NODISCARD gp_Pnt") Transformed;
		Standard_NODISCARD gp_Pnt Transformed (const gp_Trsf & T);

		/****************** Translate ******************/
		%feature("compactdefaultargs") Translate;
		%feature("autodoc", ":param V:
	:type V: gp_Vec
	:rtype: None") Translate;
		void Translate (const gp_Vec & V);

		/****************** Translate ******************/
		%feature("compactdefaultargs") Translate;
		%feature("autodoc", ":param P1:
	:type P1: gp_Pnt
	:param P2:
	:type P2: gp_Pnt
	:rtype: None") Translate;
		void Translate (const gp_Pnt & P1,const gp_Pnt & P2);

		/****************** Translated ******************/
		%feature("compactdefaultargs") Translated;
		%feature("autodoc", "* Translates a point from the point P1 to the point P2.
	:param V:
	:type V: gp_Vec
	:rtype: Standard_NODISCARD gp_Pnt") Translated;
		Standard_NODISCARD gp_Pnt Translated (const gp_Vec & V);

		/****************** Translated ******************/
		%feature("compactdefaultargs") Translated;
		%feature("autodoc", ":param P1:
	:type P1: gp_Pnt
	:param P2:
	:type P2: gp_Pnt
	:rtype: Standard_NODISCARD gp_Pnt") Translated;
		Standard_NODISCARD gp_Pnt Translated (const gp_Pnt & P1,const gp_Pnt & P2);

		/****************** X ******************/
		%feature("compactdefaultargs") X;
		%feature("autodoc", "* For this point, returns its X coordinate.
	:rtype: float") X;
		Standard_Real X ();

		/****************** XYZ ******************/
		%feature("compactdefaultargs") XYZ;
		%feature("autodoc", "* For this point, returns its three coordinates as a XYZ object.
	:rtype: gp_XYZ") XYZ;
		const gp_XYZ  XYZ ();

		/****************** Y ******************/
		%feature("compactdefaultargs") Y;
		%feature("autodoc", "* For this point, returns its Y coordinate.
	:rtype: float") Y;
		Standard_Real Y ();

		/****************** Z ******************/
		%feature("compactdefaultargs") Z;
		%feature("autodoc", "* For this point, returns its Z coordinate.
	:rtype: float") Z;
		Standard_Real Z ();

		/****************** gp_Pnt ******************/
		%feature("compactdefaultargs") gp_Pnt;
		%feature("autodoc", "* Creates a point with zero coordinates.
	:rtype: None") gp_Pnt;
		 gp_Pnt ();

		/****************** gp_Pnt ******************/
		%feature("compactdefaultargs") gp_Pnt;
		%feature("autodoc", "* Creates a point from a XYZ object.
	:param Coord:
	:type Coord: gp_XYZ
	:rtype: None") gp_Pnt;
		 gp_Pnt (const gp_XYZ & Coord);

		/****************** gp_Pnt ******************/
		%feature("compactdefaultargs") gp_Pnt;
		%feature("autodoc", "* Creates a point with its 3 cartesian's coordinates : Xp, Yp, Zp.
	:param Xp:
	:type Xp: float
	:param Yp:
	:type Yp: float
	:param Zp:
	:type Zp: float
	:rtype: None") gp_Pnt;
		 gp_Pnt (const Standard_Real Xp,const Standard_Real Yp,const Standard_Real Zp);

};


%extend gp_Pnt {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************
* class gp_Pnt2d *
*****************/
%nodefaultctor gp_Pnt2d;
class gp_Pnt2d {
	public:
		/****************** ChangeCoord ******************/
		%feature("compactdefaultargs") ChangeCoord;
		%feature("autodoc", "* Returns the coordinates of this point. Note: This syntax allows direct modification of the returned value.
	:rtype: gp_XY") ChangeCoord;
		gp_XY  ChangeCoord ();

		/****************** Coord ******************/
		%feature("compactdefaultargs") Coord;
		%feature("autodoc", "* Returns the coordinate of range Index : Index = 1 => X is returned Index = 2 => Y is returned Raises OutOfRange if Index != {1, 2}.
	:param Index:
	:type Index: int
	:rtype: float") Coord;
		Standard_Real Coord (const Standard_Integer Index);

		/****************** Coord ******************/
		%feature("compactdefaultargs") Coord;
		%feature("autodoc", "* For this point returns its two coordinates as a number pair.
	:param Xp:
	:type Xp: float &
	:param Yp:
	:type Yp: float &
	:rtype: None") Coord;
		void Coord (Standard_Real &OutValue,Standard_Real &OutValue);

		/****************** Coord ******************/
		%feature("compactdefaultargs") Coord;
		%feature("autodoc", "* For this point, returns its two coordinates as a number pair.
	:rtype: gp_XY") Coord;
		const gp_XY  Coord ();

		/****************** Distance ******************/
		%feature("compactdefaultargs") Distance;
		%feature("autodoc", "* Computes the distance between two points.
	:param Other:
	:type Other: gp_Pnt2d
	:rtype: float") Distance;
		Standard_Real Distance (const gp_Pnt2d & Other);

		/****************** IsEqual ******************/
		%feature("compactdefaultargs") IsEqual;
		%feature("autodoc", "* Comparison Returns True if the distance between the two points is lower or equal to LinearTolerance.
	:param Other:
	:type Other: gp_Pnt2d
	:param LinearTolerance:
	:type LinearTolerance: float
	:rtype: bool") IsEqual;
		Standard_Boolean IsEqual (const gp_Pnt2d & Other,const Standard_Real LinearTolerance);

		/****************** Mirror ******************/
		%feature("compactdefaultargs") Mirror;
		%feature("autodoc", "* Performs the symmetrical transformation of a point with respect to the point P which is the center of the symmetry.
	:param P:
	:type P: gp_Pnt2d
	:rtype: None") Mirror;
		void Mirror (const gp_Pnt2d & P);

		/****************** Mirror ******************/
		%feature("compactdefaultargs") Mirror;
		%feature("autodoc", ":param A:
	:type A: gp_Ax2d
	:rtype: None") Mirror;
		void Mirror (const gp_Ax2d & A);

		/****************** Mirrored ******************/
		%feature("compactdefaultargs") Mirrored;
		%feature("autodoc", "* Performs the symmetrical transformation of a point with respect to an axis placement which is the axis
	:param P:
	:type P: gp_Pnt2d
	:rtype: Standard_NODISCARD gp_Pnt2d") Mirrored;
		Standard_NODISCARD gp_Pnt2d Mirrored (const gp_Pnt2d & P);

		/****************** Mirrored ******************/
		%feature("compactdefaultargs") Mirrored;
		%feature("autodoc", "* Rotates a point. A1 is the axis of the rotation. Ang is the angular value of the rotation in radians.
	:param A:
	:type A: gp_Ax2d
	:rtype: Standard_NODISCARD gp_Pnt2d") Mirrored;
		Standard_NODISCARD gp_Pnt2d Mirrored (const gp_Ax2d & A);

		/****************** Rotate ******************/
		%feature("compactdefaultargs") Rotate;
		%feature("autodoc", ":param P:
	:type P: gp_Pnt2d
	:param Ang:
	:type Ang: float
	:rtype: None") Rotate;
		void Rotate (const gp_Pnt2d & P,const Standard_Real Ang);

		/****************** Rotated ******************/
		%feature("compactdefaultargs") Rotated;
		%feature("autodoc", "* Scales a point. S is the scaling value.
	:param P:
	:type P: gp_Pnt2d
	:param Ang:
	:type Ang: float
	:rtype: Standard_NODISCARD gp_Pnt2d") Rotated;
		Standard_NODISCARD gp_Pnt2d Rotated (const gp_Pnt2d & P,const Standard_Real Ang);

		/****************** Scale ******************/
		%feature("compactdefaultargs") Scale;
		%feature("autodoc", ":param P:
	:type P: gp_Pnt2d
	:param S:
	:type S: float
	:rtype: None") Scale;
		void Scale (const gp_Pnt2d & P,const Standard_Real S);

		/****************** Scaled ******************/
		%feature("compactdefaultargs") Scaled;
		%feature("autodoc", "* Transforms a point with the transformation T.
	:param P:
	:type P: gp_Pnt2d
	:param S:
	:type S: float
	:rtype: Standard_NODISCARD gp_Pnt2d") Scaled;
		Standard_NODISCARD gp_Pnt2d Scaled (const gp_Pnt2d & P,const Standard_Real S);

		/****************** SetCoord ******************/
		%feature("compactdefaultargs") SetCoord;
		%feature("autodoc", "* Assigns the value Xi to the coordinate that corresponds to Index: Index = 1 => X is modified Index = 2 => Y is modified Raises OutOfRange if Index != {1, 2}.
	:param Index:
	:type Index: int
	:param Xi:
	:type Xi: float
	:rtype: None") SetCoord;
		void SetCoord (const Standard_Integer Index,const Standard_Real Xi);

		/****************** SetCoord ******************/
		%feature("compactdefaultargs") SetCoord;
		%feature("autodoc", "* For this point, assigns the values Xp and Yp to its two coordinates
	:param Xp:
	:type Xp: float
	:param Yp:
	:type Yp: float
	:rtype: None") SetCoord;
		void SetCoord (const Standard_Real Xp,const Standard_Real Yp);

		/****************** SetX ******************/
		%feature("compactdefaultargs") SetX;
		%feature("autodoc", "* Assigns the given value to the X coordinate of this point.
	:param X:
	:type X: float
	:rtype: None") SetX;
		void SetX (const Standard_Real X);

		/****************** SetXY ******************/
		%feature("compactdefaultargs") SetXY;
		%feature("autodoc", "* Assigns the two coordinates of Coord to this point.
	:param Coord:
	:type Coord: gp_XY
	:rtype: None") SetXY;
		void SetXY (const gp_XY & Coord);

		/****************** SetY ******************/
		%feature("compactdefaultargs") SetY;
		%feature("autodoc", "* Assigns the given value to the Y coordinate of this point.
	:param Y:
	:type Y: float
	:rtype: None") SetY;
		void SetY (const Standard_Real Y);

		/****************** SquareDistance ******************/
		%feature("compactdefaultargs") SquareDistance;
		%feature("autodoc", "* Computes the square distance between two points.
	:param Other:
	:type Other: gp_Pnt2d
	:rtype: float") SquareDistance;
		Standard_Real SquareDistance (const gp_Pnt2d & Other);

		/****************** Transform ******************/
		%feature("compactdefaultargs") Transform;
		%feature("autodoc", ":param T:
	:type T: gp_Trsf2d
	:rtype: None") Transform;
		void Transform (const gp_Trsf2d & T);

		/****************** Transformed ******************/
		%feature("compactdefaultargs") Transformed;
		%feature("autodoc", "* Translates a point in the direction of the vector V. The magnitude of the translation is the vector's magnitude.
	:param T:
	:type T: gp_Trsf2d
	:rtype: Standard_NODISCARD gp_Pnt2d") Transformed;
		Standard_NODISCARD gp_Pnt2d Transformed (const gp_Trsf2d & T);

		/****************** Translate ******************/
		%feature("compactdefaultargs") Translate;
		%feature("autodoc", ":param V:
	:type V: gp_Vec2d
	:rtype: None") Translate;
		void Translate (const gp_Vec2d & V);

		/****************** Translate ******************/
		%feature("compactdefaultargs") Translate;
		%feature("autodoc", ":param P1:
	:type P1: gp_Pnt2d
	:param P2:
	:type P2: gp_Pnt2d
	:rtype: None") Translate;
		void Translate (const gp_Pnt2d & P1,const gp_Pnt2d & P2);

		/****************** Translated ******************/
		%feature("compactdefaultargs") Translated;
		%feature("autodoc", "* Translates a point from the point P1 to the point P2.
	:param V:
	:type V: gp_Vec2d
	:rtype: Standard_NODISCARD gp_Pnt2d") Translated;
		Standard_NODISCARD gp_Pnt2d Translated (const gp_Vec2d & V);

		/****************** Translated ******************/
		%feature("compactdefaultargs") Translated;
		%feature("autodoc", ":param P1:
	:type P1: gp_Pnt2d
	:param P2:
	:type P2: gp_Pnt2d
	:rtype: Standard_NODISCARD gp_Pnt2d") Translated;
		Standard_NODISCARD gp_Pnt2d Translated (const gp_Pnt2d & P1,const gp_Pnt2d & P2);

		/****************** X ******************/
		%feature("compactdefaultargs") X;
		%feature("autodoc", "* For this point, returns its X coordinate.
	:rtype: float") X;
		Standard_Real X ();

		/****************** XY ******************/
		%feature("compactdefaultargs") XY;
		%feature("autodoc", "* For this point, returns its two coordinates as a number pair.
	:rtype: gp_XY") XY;
		const gp_XY  XY ();

		/****************** Y ******************/
		%feature("compactdefaultargs") Y;
		%feature("autodoc", "* For this point, returns its Y coordinate.
	:rtype: float") Y;
		Standard_Real Y ();

		/****************** gp_Pnt2d ******************/
		%feature("compactdefaultargs") gp_Pnt2d;
		%feature("autodoc", "* Creates a point with zero coordinates.
	:rtype: None") gp_Pnt2d;
		 gp_Pnt2d ();

		/****************** gp_Pnt2d ******************/
		%feature("compactdefaultargs") gp_Pnt2d;
		%feature("autodoc", "* Creates a point with a doublet of coordinates.
	:param Coord:
	:type Coord: gp_XY
	:rtype: None") gp_Pnt2d;
		 gp_Pnt2d (const gp_XY & Coord);

		/****************** gp_Pnt2d ******************/
		%feature("compactdefaultargs") gp_Pnt2d;
		%feature("autodoc", "* Creates a point with its 2 cartesian's coordinates : Xp, Yp.
	:param Xp:
	:type Xp: float
	:param Yp:
	:type Yp: float
	:rtype: None") gp_Pnt2d;
		 gp_Pnt2d (const Standard_Real Xp,const Standard_Real Yp);

};


%extend gp_Pnt2d {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************
* class gp_Quaternion *
**********************/
%nodefaultctor gp_Quaternion;
class gp_Quaternion {
	public:
		/****************** Add ******************/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "* Adds componnets of other quaternion; result is 'rotations mix'
	:param theOther:
	:type theOther: gp_Quaternion
	:rtype: None") Add;
		void Add (const gp_Quaternion & theOther);

		/****************** Added ******************/
		%feature("compactdefaultargs") Added;
		%feature("autodoc", "* Makes sum of quaternion components; result is 'rotations mix'
	:param theOther:
	:type theOther: gp_Quaternion
	:rtype: Standard_NODISCARD gp_Quaternion") Added;
		Standard_NODISCARD gp_Quaternion Added (const gp_Quaternion & theOther);

		/****************** Dot ******************/
		%feature("compactdefaultargs") Dot;
		%feature("autodoc", "* Computes inner product / scalar product / Dot
	:param theOther:
	:type theOther: gp_Quaternion
	:rtype: float") Dot;
		Standard_Real Dot (const gp_Quaternion & theOther);

		/****************** GetEulerAngles ******************/
		%feature("compactdefaultargs") GetEulerAngles;
		%feature("autodoc", "* Returns Euler angles describing current rotation
	:param theOrder:
	:type theOrder: gp_EulerSequence
	:param theAlpha:
	:type theAlpha: float &
	:param theBeta:
	:type theBeta: float &
	:param theGamma:
	:type theGamma: float &
	:rtype: None") GetEulerAngles;
		void GetEulerAngles (const gp_EulerSequence theOrder,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);

		/****************** GetMatrix ******************/
		%feature("compactdefaultargs") GetMatrix;
		%feature("autodoc", "* Returns rotation operation as 3*3 matrix
	:rtype: gp_Mat") GetMatrix;
		gp_Mat GetMatrix ();

		/****************** GetRotationAngle ******************/
		%feature("compactdefaultargs") GetRotationAngle;
		%feature("autodoc", "* Return rotation angle from -PI to PI
	:rtype: float") GetRotationAngle;
		Standard_Real GetRotationAngle ();

		/****************** GetVectorAndAngle ******************/
		%feature("compactdefaultargs") GetVectorAndAngle;
		%feature("autodoc", "* Convert a quaternion to Axis+Angle representation, preserve the axis direction and angle from -PI to +PI
	:param theAxis:
	:type theAxis: gp_Vec
	:param theAngle:
	:type theAngle: float &
	:rtype: None") GetVectorAndAngle;
		void GetVectorAndAngle (gp_Vec & theAxis,Standard_Real &OutValue);

		/****************** Invert ******************/
		%feature("compactdefaultargs") Invert;
		%feature("autodoc", "* Inverts quaternion (both rotation direction and norm)
	:rtype: None") Invert;
		void Invert ();

		/****************** Inverted ******************/
		%feature("compactdefaultargs") Inverted;
		%feature("autodoc", "* Return inversed quaternion q^-1
	:rtype: Standard_NODISCARD gp_Quaternion") Inverted;
		Standard_NODISCARD gp_Quaternion Inverted ();

		/****************** IsEqual ******************/
		%feature("compactdefaultargs") IsEqual;
		%feature("autodoc", "* Simple equal test without precision
	:param theOther:
	:type theOther: gp_Quaternion
	:rtype: bool") IsEqual;
		Standard_Boolean IsEqual (const gp_Quaternion & theOther);

		/****************** Multiplied ******************/
		%feature("compactdefaultargs") Multiplied;
		%feature("autodoc", "* Multiply function - work the same as Matrices multiplying. qq' = (cross(v,v') + wv' + w'v, ww' - dot(v,v')) Result is rotation combination: q' than q (here q=this, q'=theQ). Notices than: qq' != q'q; qq^-1 = q;
	:param theOther:
	:type theOther: gp_Quaternion
	:rtype: Standard_NODISCARD gp_Quaternion") Multiplied;
		Standard_NODISCARD gp_Quaternion Multiplied (const gp_Quaternion & theOther);

		/****************** Multiply ******************/
		%feature("compactdefaultargs") Multiply;
		%feature("autodoc", "* Adds rotation by multiplication
	:param theOther:
	:type theOther: gp_Quaternion
	:rtype: None") Multiply;
		void Multiply (const gp_Quaternion & theOther);

		/****************** Multiply ******************/
		%feature("compactdefaultargs") Multiply;
		%feature("autodoc", "* Rotates vector by quaternion as rotation operator
	:param theVec:
	:type theVec: gp_Vec
	:rtype: gp_Vec") Multiply;
		gp_Vec Multiply (const gp_Vec & theVec);

		/****************** Negated ******************/
		%feature("compactdefaultargs") Negated;
		%feature("autodoc", "* Returns quaternion with all components negated. Note that this operation does not affect neither rotation operator defined by quaternion nor its norm.
	:rtype: Standard_NODISCARD gp_Quaternion") Negated;
		Standard_NODISCARD gp_Quaternion Negated ();

		/****************** Norm ******************/
		%feature("compactdefaultargs") Norm;
		%feature("autodoc", "* Returns norm of quaternion
	:rtype: float") Norm;
		Standard_Real Norm ();

		/****************** Normalize ******************/
		%feature("compactdefaultargs") Normalize;
		%feature("autodoc", "* Scale quaternion that its norm goes to 1. The appearing of 0 magnitude or near is a error, so we can be sure that can divide by magnitude
	:rtype: None") Normalize;
		void Normalize ();

		/****************** Normalized ******************/
		%feature("compactdefaultargs") Normalized;
		%feature("autodoc", "* Returns quaternion scaled so that its norm goes to 1.
	:rtype: Standard_NODISCARD gp_Quaternion") Normalized;
		Standard_NODISCARD gp_Quaternion Normalized ();

		/****************** Reverse ******************/
		%feature("compactdefaultargs") Reverse;
		%feature("autodoc", "* Reverse direction of rotation (conjugate quaternion)
	:rtype: None") Reverse;
		void Reverse ();

		/****************** Reversed ******************/
		%feature("compactdefaultargs") Reversed;
		%feature("autodoc", "* Return rotation with reversed direction (conjugated quaternion)
	:rtype: Standard_NODISCARD gp_Quaternion") Reversed;
		Standard_NODISCARD gp_Quaternion Reversed ();

		/****************** Scale ******************/
		%feature("compactdefaultargs") Scale;
		%feature("autodoc", "* Scale all components by quaternion by theScale; note that rotation is not changed by this operation (except 0-scaling)
	:param theScale:
	:type theScale: float
	:rtype: None") Scale;
		void Scale (const Standard_Real theScale);

		/****************** Scaled ******************/
		%feature("compactdefaultargs") Scaled;
		%feature("autodoc", "* Returns scaled quaternion
	:param theScale:
	:type theScale: float
	:rtype: Standard_NODISCARD gp_Quaternion") Scaled;
		Standard_NODISCARD gp_Quaternion Scaled (const Standard_Real theScale);

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", ":param x:
	:type x: float
	:param y:
	:type y: float
	:param z:
	:type z: float
	:param w:
	:type w: float
	:rtype: None") Set;
		void Set (const Standard_Real x,const Standard_Real y,const Standard_Real z,const Standard_Real w);

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", ":param theQuaternion:
	:type theQuaternion: gp_Quaternion
	:rtype: None") Set;
		void Set (const gp_Quaternion & theQuaternion);

		/****************** SetEulerAngles ******************/
		%feature("compactdefaultargs") SetEulerAngles;
		%feature("autodoc", "* Create a unit quaternion representing rotation defined by generalized Euler angles
	:param theOrder:
	:type theOrder: gp_EulerSequence
	:param theAlpha:
	:type theAlpha: float
	:param theBeta:
	:type theBeta: float
	:param theGamma:
	:type theGamma: float
	:rtype: None") SetEulerAngles;
		void SetEulerAngles (const gp_EulerSequence theOrder,const Standard_Real theAlpha,const Standard_Real theBeta,const Standard_Real theGamma);

		/****************** SetIdent ******************/
		%feature("compactdefaultargs") SetIdent;
		%feature("autodoc", "* Make identity quaternion (zero-rotation)
	:rtype: None") SetIdent;
		void SetIdent ();

		/****************** SetMatrix ******************/
		%feature("compactdefaultargs") SetMatrix;
		%feature("autodoc", "* Create a unit quaternion by rotation matrix matrix must contain only rotation (not scale or shear) //! For numerical stability we find first the greatest component of quaternion and than search others from this one
	:param theMat:
	:type theMat: gp_Mat
	:rtype: None") SetMatrix;
		void SetMatrix (const gp_Mat & theMat);

		/****************** SetRotation ******************/
		%feature("compactdefaultargs") SetRotation;
		%feature("autodoc", "* Sets quaternion to shortest-arc rotation producing vector theVecTo from vector theVecFrom. If vectors theVecFrom and theVecTo are opposite then rotation axis is computed as theVecFrom ^ (1,0,0) or theVecFrom ^ (0,0,1).
	:param theVecFrom:
	:type theVecFrom: gp_Vec
	:param theVecTo:
	:type theVecTo: gp_Vec
	:rtype: None") SetRotation;
		void SetRotation (const gp_Vec & theVecFrom,const gp_Vec & theVecTo);

		/****************** SetRotation ******************/
		%feature("compactdefaultargs") SetRotation;
		%feature("autodoc", "* Sets quaternion to shortest-arc rotation producing vector theVecTo from vector theVecFrom. If vectors theVecFrom and theVecTo are opposite then rotation axis is computed as theVecFrom ^ theHelpCrossVec.
	:param theVecFrom:
	:type theVecFrom: gp_Vec
	:param theVecTo:
	:type theVecTo: gp_Vec
	:param theHelpCrossVec:
	:type theHelpCrossVec: gp_Vec
	:rtype: None") SetRotation;
		void SetRotation (const gp_Vec & theVecFrom,const gp_Vec & theVecTo,const gp_Vec & theHelpCrossVec);

		/****************** SetVectorAndAngle ******************/
		%feature("compactdefaultargs") SetVectorAndAngle;
		%feature("autodoc", "* Create a unit quaternion from Axis+Angle representation
	:param theAxis:
	:type theAxis: gp_Vec
	:param theAngle:
	:type theAngle: float
	:rtype: None") SetVectorAndAngle;
		void SetVectorAndAngle (const gp_Vec & theAxis,const Standard_Real theAngle);

		/****************** SquareNorm ******************/
		%feature("compactdefaultargs") SquareNorm;
		%feature("autodoc", "* Returns square norm of quaternion
	:rtype: float") SquareNorm;
		Standard_Real SquareNorm ();

		/****************** StabilizeLength ******************/
		%feature("compactdefaultargs") StabilizeLength;
		%feature("autodoc", "* Stabilize quaternion length within 1 - 1/4. This operation is a lot faster than normalization and preserve length goes to 0 or infinity
	:rtype: None") StabilizeLength;
		void StabilizeLength ();

		/****************** Subtract ******************/
		%feature("compactdefaultargs") Subtract;
		%feature("autodoc", "* Subtracts componnets of other quaternion; result is 'rotations mix'
	:param theOther:
	:type theOther: gp_Quaternion
	:rtype: None") Subtract;
		void Subtract (const gp_Quaternion & theOther);

		/****************** Subtracted ******************/
		%feature("compactdefaultargs") Subtracted;
		%feature("autodoc", "* Makes difference of quaternion components; result is 'rotations mix'
	:param theOther:
	:type theOther: gp_Quaternion
	:rtype: Standard_NODISCARD gp_Quaternion") Subtracted;
		Standard_NODISCARD gp_Quaternion Subtracted (const gp_Quaternion & theOther);

		/****************** W ******************/
		%feature("compactdefaultargs") W;
		%feature("autodoc", ":rtype: float") W;
		Standard_Real W ();

		/****************** X ******************/
		%feature("compactdefaultargs") X;
		%feature("autodoc", ":rtype: float") X;
		Standard_Real X ();

		/****************** Y ******************/
		%feature("compactdefaultargs") Y;
		%feature("autodoc", ":rtype: float") Y;
		Standard_Real Y ();

		/****************** Z ******************/
		%feature("compactdefaultargs") Z;
		%feature("autodoc", ":rtype: float") Z;
		Standard_Real Z ();

		/****************** gp_Quaternion ******************/
		%feature("compactdefaultargs") gp_Quaternion;
		%feature("autodoc", "* Creates an identity quaternion
	:rtype: None") gp_Quaternion;
		 gp_Quaternion ();

		/****************** gp_Quaternion ******************/
		%feature("compactdefaultargs") gp_Quaternion;
		%feature("autodoc", "* Creates quaternion directly from component values
	:param x:
	:type x: float
	:param y:
	:type y: float
	:param z:
	:type z: float
	:param w:
	:type w: float
	:rtype: None") gp_Quaternion;
		 gp_Quaternion (const Standard_Real x,const Standard_Real y,const Standard_Real z,const Standard_Real w);

		/****************** gp_Quaternion ******************/
		%feature("compactdefaultargs") gp_Quaternion;
		%feature("autodoc", "* Creates copy of another quaternion
	:param theToCopy:
	:type theToCopy: gp_Quaternion
	:rtype: None") gp_Quaternion;
		 gp_Quaternion (const gp_Quaternion & theToCopy);

		/****************** gp_Quaternion ******************/
		%feature("compactdefaultargs") gp_Quaternion;
		%feature("autodoc", "* Creates quaternion representing shortest-arc rotation operator producing vector theVecTo from vector theVecFrom.
	:param theVecFrom:
	:type theVecFrom: gp_Vec
	:param theVecTo:
	:type theVecTo: gp_Vec
	:rtype: None") gp_Quaternion;
		 gp_Quaternion (const gp_Vec & theVecFrom,const gp_Vec & theVecTo);

		/****************** gp_Quaternion ******************/
		%feature("compactdefaultargs") gp_Quaternion;
		%feature("autodoc", "* Creates quaternion representing shortest-arc rotation operator producing vector theVecTo from vector theVecFrom. Additional vector theHelpCrossVec defines preferred direction for rotation and is used when theVecTo and theVecFrom are directed oppositely.
	:param theVecFrom:
	:type theVecFrom: gp_Vec
	:param theVecTo:
	:type theVecTo: gp_Vec
	:param theHelpCrossVec:
	:type theHelpCrossVec: gp_Vec
	:rtype: None") gp_Quaternion;
		 gp_Quaternion (const gp_Vec & theVecFrom,const gp_Vec & theVecTo,const gp_Vec & theHelpCrossVec);

		/****************** gp_Quaternion ******************/
		%feature("compactdefaultargs") gp_Quaternion;
		%feature("autodoc", "* Creates quaternion representing rotation on angle theAngle around vector theAxis
	:param theAxis:
	:type theAxis: gp_Vec
	:param theAngle:
	:type theAngle: float
	:rtype: None") gp_Quaternion;
		 gp_Quaternion (const gp_Vec & theAxis,const Standard_Real theAngle);

		/****************** gp_Quaternion ******************/
		%feature("compactdefaultargs") gp_Quaternion;
		%feature("autodoc", "* Creates quaternion from rotation matrix 3*3 (which should be orthonormal skew-symmetric matrix)
	:param theMat:
	:type theMat: gp_Mat
	:rtype: None") gp_Quaternion;
		 gp_Quaternion (const gp_Mat & theMat);

		/****************** operator * ******************/
		%feature("compactdefaultargs") operator *;
		%feature("autodoc", ":param theScale:
	:type theScale: float
	:rtype: Standard_NODISCARD gp_Quaternion") operator *;
		Standard_NODISCARD gp_Quaternion operator * (const Standard_Real theScale);

		/****************** operator * ******************/
		%feature("compactdefaultargs") operator *;
		%feature("autodoc", ":param theOther:
	:type theOther: gp_Quaternion
	:rtype: Standard_NODISCARD gp_Quaternion") operator *;
		Standard_NODISCARD gp_Quaternion operator * (const gp_Quaternion & theOther);

		/****************** operator * ******************/
		%feature("compactdefaultargs") operator *;
		%feature("autodoc", ":param theVec:
	:type theVec: gp_Vec
	:rtype: gp_Vec") operator *;
		gp_Vec operator * (const gp_Vec & theVec);


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
            void __imul_wrapper__(const gp_Quaternion  other) {
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
		%feature("autodoc", ":param theOther:
	:type theOther: gp_Quaternion
	:rtype: Standard_NODISCARD gp_Quaternion") operator +;
		Standard_NODISCARD gp_Quaternion operator + (const gp_Quaternion & theOther);


        %extend{
            void __iadd_wrapper__(const gp_Quaternion  other) {
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
		%feature("autodoc", ":rtype: Standard_NODISCARD gp_Quaternion") operator -;
		Standard_NODISCARD gp_Quaternion operator - ();

		/****************** operator - ******************/
		%feature("compactdefaultargs") operator -;
		%feature("autodoc", ":param theOther:
	:type theOther: gp_Quaternion
	:rtype: Standard_NODISCARD gp_Quaternion") operator -;
		Standard_NODISCARD gp_Quaternion operator - (const gp_Quaternion & theOther);


        %extend{
            void __isub_wrapper__(const gp_Quaternion  other) {
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
%nodefaultctor gp_QuaternionNLerp;
class gp_QuaternionNLerp {
	public:
		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "* Initialize the tool with Start and End values.
	:param theQStart:
	:type theQStart: gp_Quaternion
	:param theQEnd:
	:type theQEnd: gp_Quaternion
	:rtype: None") Init;
		void Init (const gp_Quaternion & theQStart,const gp_Quaternion & theQEnd);

		/****************** InitFromUnit ******************/
		%feature("compactdefaultargs") InitFromUnit;
		%feature("autodoc", "* Initialize the tool with Start and End unit quaternions.
	:param theQStart:
	:type theQStart: gp_Quaternion
	:param theQEnd:
	:type theQEnd: gp_Quaternion
	:rtype: None") InitFromUnit;
		void InitFromUnit (const gp_Quaternion & theQStart,const gp_Quaternion & theQEnd);

		/****************** Interpolate ******************/
		%feature("compactdefaultargs") Interpolate;
		%feature("autodoc", "* Compute interpolated quaternion between two quaternions. @param theStart first quaternion @param theEnd second quaternion @param theT normalized interpolation coefficient within 0..1 range, with 0 pointing to theStart and 1 to theEnd.
	:param theQStart:
	:type theQStart: gp_Quaternion
	:param theQEnd:
	:type theQEnd: gp_Quaternion
	:param theT:
	:type theT: float
	:rtype: gp_Quaternion") Interpolate;
		static gp_Quaternion Interpolate (const gp_Quaternion & theQStart,const gp_Quaternion & theQEnd,Standard_Real theT);

		/****************** Interpolate ******************/
		%feature("compactdefaultargs") Interpolate;
		%feature("autodoc", "* Set interpolated quaternion for theT position (from 0.0 to 1.0)
	:param theT:
	:type theT: float
	:param theResultQ:
	:type theResultQ: gp_Quaternion
	:rtype: None") Interpolate;
		void Interpolate (Standard_Real theT,gp_Quaternion & theResultQ);

		/****************** gp_QuaternionNLerp ******************/
		%feature("compactdefaultargs") gp_QuaternionNLerp;
		%feature("autodoc", "* Empty constructor,
	:rtype: None") gp_QuaternionNLerp;
		 gp_QuaternionNLerp ();

		/****************** gp_QuaternionNLerp ******************/
		%feature("compactdefaultargs") gp_QuaternionNLerp;
		%feature("autodoc", "* Constructor with initialization.
	:param theQStart:
	:type theQStart: gp_Quaternion
	:param theQEnd:
	:type theQEnd: gp_Quaternion
	:rtype: None") gp_QuaternionNLerp;
		 gp_QuaternionNLerp (const gp_Quaternion & theQStart,const gp_Quaternion & theQEnd);

};


%extend gp_QuaternionNLerp {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************
* class gp_QuaternionSLerp *
***************************/
%nodefaultctor gp_QuaternionSLerp;
class gp_QuaternionSLerp {
	public:
		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "* Initialize the tool with Start and End values.
	:param theQStart:
	:type theQStart: gp_Quaternion
	:param theQEnd:
	:type theQEnd: gp_Quaternion
	:rtype: None") Init;
		void Init (const gp_Quaternion & theQStart,const gp_Quaternion & theQEnd);

		/****************** InitFromUnit ******************/
		%feature("compactdefaultargs") InitFromUnit;
		%feature("autodoc", "* Initialize the tool with Start and End unit quaternions.
	:param theQStart:
	:type theQStart: gp_Quaternion
	:param theQEnd:
	:type theQEnd: gp_Quaternion
	:rtype: None") InitFromUnit;
		void InitFromUnit (const gp_Quaternion & theQStart,const gp_Quaternion & theQEnd);

		/****************** Interpolate ******************/
		%feature("compactdefaultargs") Interpolate;
		%feature("autodoc", "* Compute interpolated quaternion between two quaternions. @param theStart first quaternion @param theEnd second quaternion @param theT normalized interpolation coefficient within 0..1 range, with 0 pointing to theStart and 1 to theEnd.
	:param theQStart:
	:type theQStart: gp_Quaternion
	:param theQEnd:
	:type theQEnd: gp_Quaternion
	:param theT:
	:type theT: float
	:rtype: gp_Quaternion") Interpolate;
		static gp_Quaternion Interpolate (const gp_Quaternion & theQStart,const gp_Quaternion & theQEnd,Standard_Real theT);

		/****************** Interpolate ******************/
		%feature("compactdefaultargs") Interpolate;
		%feature("autodoc", "* Set interpolated quaternion for theT position (from 0.0 to 1.0)
	:param theT:
	:type theT: float
	:param theResultQ:
	:type theResultQ: gp_Quaternion
	:rtype: None") Interpolate;
		void Interpolate (Standard_Real theT,gp_Quaternion & theResultQ);

		/****************** gp_QuaternionSLerp ******************/
		%feature("compactdefaultargs") gp_QuaternionSLerp;
		%feature("autodoc", "* Empty constructor,
	:rtype: None") gp_QuaternionSLerp;
		 gp_QuaternionSLerp ();

		/****************** gp_QuaternionSLerp ******************/
		%feature("compactdefaultargs") gp_QuaternionSLerp;
		%feature("autodoc", "* Constructor with initialization.
	:param theQStart:
	:type theQStart: gp_Quaternion
	:param theQEnd:
	:type theQEnd: gp_Quaternion
	:rtype: None") gp_QuaternionSLerp;
		 gp_QuaternionSLerp (const gp_Quaternion & theQStart,const gp_Quaternion & theQEnd);

};


%extend gp_QuaternionSLerp {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************
* class gp_Sphere *
******************/
%nodefaultctor gp_Sphere;
class gp_Sphere {
	public:
		/****************** Area ******************/
		%feature("compactdefaultargs") Area;
		%feature("autodoc", "* Computes the aera of the sphere.
	:rtype: float") Area;
		Standard_Real Area ();

		/****************** Coefficients ******************/
		%feature("compactdefaultargs") Coefficients;
		%feature("autodoc", "* Computes the coefficients of the implicit equation of the quadric in the absolute cartesian coordinates system : A1.X**2 + A2.Y**2 + A3.Z**2 + 2.(B1.X.Y + B2.X.Z + B3.Y.Z) + 2.(C1.X + C2.Y + C3.Z) + D = 0.0
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
	:rtype: None") Coefficients;
		void Coefficients (Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);

		/****************** Direct ******************/
		%feature("compactdefaultargs") Direct;
		%feature("autodoc", "* Returns true if the local coordinate system of this sphere is right-handed.
	:rtype: bool") Direct;
		Standard_Boolean Direct ();

		/****************** Location ******************/
		%feature("compactdefaultargs") Location;
		%feature("autodoc", "* --- Purpose ; Returns the center of the sphere.
	:rtype: gp_Pnt") Location;
		const gp_Pnt  Location ();

		/****************** Mirror ******************/
		%feature("compactdefaultargs") Mirror;
		%feature("autodoc", ":param P:
	:type P: gp_Pnt
	:rtype: None") Mirror;
		void Mirror (const gp_Pnt & P);

		/****************** Mirror ******************/
		%feature("compactdefaultargs") Mirror;
		%feature("autodoc", ":param A1:
	:type A1: gp_Ax1
	:rtype: None") Mirror;
		void Mirror (const gp_Ax1 & A1);

		/****************** Mirror ******************/
		%feature("compactdefaultargs") Mirror;
		%feature("autodoc", ":param A2:
	:type A2: gp_Ax2
	:rtype: None") Mirror;
		void Mirror (const gp_Ax2 & A2);

		/****************** Mirrored ******************/
		%feature("compactdefaultargs") Mirrored;
		%feature("autodoc", "* Performs the symmetrical transformation of a sphere with respect to the point P which is the center of the symmetry.
	:param P:
	:type P: gp_Pnt
	:rtype: Standard_NODISCARD gp_Sphere") Mirrored;
		Standard_NODISCARD gp_Sphere Mirrored (const gp_Pnt & P);

		/****************** Mirrored ******************/
		%feature("compactdefaultargs") Mirrored;
		%feature("autodoc", "* Performs the symmetrical transformation of a sphere with respect to an axis placement which is the axis of the symmetry.
	:param A1:
	:type A1: gp_Ax1
	:rtype: Standard_NODISCARD gp_Sphere") Mirrored;
		Standard_NODISCARD gp_Sphere Mirrored (const gp_Ax1 & A1);

		/****************** Mirrored ******************/
		%feature("compactdefaultargs") Mirrored;
		%feature("autodoc", "* Performs the symmetrical transformation of a sphere with respect to a plane. The axis placement A2 locates the plane of the of the symmetry : (Location, XDirection, YDirection).
	:param A2:
	:type A2: gp_Ax2
	:rtype: Standard_NODISCARD gp_Sphere") Mirrored;
		Standard_NODISCARD gp_Sphere Mirrored (const gp_Ax2 & A2);

		/****************** Position ******************/
		%feature("compactdefaultargs") Position;
		%feature("autodoc", "* Returns the local coordinates system of the sphere.
	:rtype: gp_Ax3") Position;
		const gp_Ax3  Position ();

		/****************** Radius ******************/
		%feature("compactdefaultargs") Radius;
		%feature("autodoc", "* Returns the radius of the sphere.
	:rtype: float") Radius;
		Standard_Real Radius ();

		/****************** Rotate ******************/
		%feature("compactdefaultargs") Rotate;
		%feature("autodoc", ":param A1:
	:type A1: gp_Ax1
	:param Ang:
	:type Ang: float
	:rtype: None") Rotate;
		void Rotate (const gp_Ax1 & A1,const Standard_Real Ang);

		/****************** Rotated ******************/
		%feature("compactdefaultargs") Rotated;
		%feature("autodoc", "* Rotates a sphere. A1 is the axis of the rotation. Ang is the angular value of the rotation in radians.
	:param A1:
	:type A1: gp_Ax1
	:param Ang:
	:type Ang: float
	:rtype: Standard_NODISCARD gp_Sphere") Rotated;
		Standard_NODISCARD gp_Sphere Rotated (const gp_Ax1 & A1,const Standard_Real Ang);

		/****************** Scale ******************/
		%feature("compactdefaultargs") Scale;
		%feature("autodoc", ":param P:
	:type P: gp_Pnt
	:param S:
	:type S: float
	:rtype: None") Scale;
		void Scale (const gp_Pnt & P,const Standard_Real S);

		/****************** Scaled ******************/
		%feature("compactdefaultargs") Scaled;
		%feature("autodoc", "* Scales a sphere. S is the scaling value. The absolute value of S is used to scale the sphere
	:param P:
	:type P: gp_Pnt
	:param S:
	:type S: float
	:rtype: Standard_NODISCARD gp_Sphere") Scaled;
		Standard_NODISCARD gp_Sphere Scaled (const gp_Pnt & P,const Standard_Real S);

		/****************** SetLocation ******************/
		%feature("compactdefaultargs") SetLocation;
		%feature("autodoc", "* Changes the center of the sphere.
	:param Loc:
	:type Loc: gp_Pnt
	:rtype: None") SetLocation;
		void SetLocation (const gp_Pnt & Loc);

		/****************** SetPosition ******************/
		%feature("compactdefaultargs") SetPosition;
		%feature("autodoc", "* Changes the local coordinate system of the sphere.
	:param A3:
	:type A3: gp_Ax3
	:rtype: None") SetPosition;
		void SetPosition (const gp_Ax3 & A3);

		/****************** SetRadius ******************/
		%feature("compactdefaultargs") SetRadius;
		%feature("autodoc", "* Assigns R the radius of the Sphere. Warnings : It is not forbidden to create a sphere with null radius. Raises ConstructionError if R < 0.0
	:param R:
	:type R: float
	:rtype: None") SetRadius;
		void SetRadius (const Standard_Real R);

		/****************** Transform ******************/
		%feature("compactdefaultargs") Transform;
		%feature("autodoc", ":param T:
	:type T: gp_Trsf
	:rtype: None") Transform;
		void Transform (const gp_Trsf & T);

		/****************** Transformed ******************/
		%feature("compactdefaultargs") Transformed;
		%feature("autodoc", "* Transforms a sphere with the transformation T from class Trsf.
	:param T:
	:type T: gp_Trsf
	:rtype: Standard_NODISCARD gp_Sphere") Transformed;
		Standard_NODISCARD gp_Sphere Transformed (const gp_Trsf & T);

		/****************** Translate ******************/
		%feature("compactdefaultargs") Translate;
		%feature("autodoc", ":param V:
	:type V: gp_Vec
	:rtype: None") Translate;
		void Translate (const gp_Vec & V);

		/****************** Translate ******************/
		%feature("compactdefaultargs") Translate;
		%feature("autodoc", ":param P1:
	:type P1: gp_Pnt
	:param P2:
	:type P2: gp_Pnt
	:rtype: None") Translate;
		void Translate (const gp_Pnt & P1,const gp_Pnt & P2);

		/****************** Translated ******************/
		%feature("compactdefaultargs") Translated;
		%feature("autodoc", "* Translates a sphere in the direction of the vector V. The magnitude of the translation is the vector's magnitude.
	:param V:
	:type V: gp_Vec
	:rtype: Standard_NODISCARD gp_Sphere") Translated;
		Standard_NODISCARD gp_Sphere Translated (const gp_Vec & V);

		/****************** Translated ******************/
		%feature("compactdefaultargs") Translated;
		%feature("autodoc", "* Translates a sphere from the point P1 to the point P2.
	:param P1:
	:type P1: gp_Pnt
	:param P2:
	:type P2: gp_Pnt
	:rtype: Standard_NODISCARD gp_Sphere") Translated;
		Standard_NODISCARD gp_Sphere Translated (const gp_Pnt & P1,const gp_Pnt & P2);

		/****************** UReverse ******************/
		%feature("compactdefaultargs") UReverse;
		%feature("autodoc", "* Reverses the U parametrization of the sphere reversing the YAxis.
	:rtype: None") UReverse;
		void UReverse ();

		/****************** VReverse ******************/
		%feature("compactdefaultargs") VReverse;
		%feature("autodoc", "* Reverses the V parametrization of the sphere reversing the ZAxis.
	:rtype: None") VReverse;
		void VReverse ();

		/****************** Volume ******************/
		%feature("compactdefaultargs") Volume;
		%feature("autodoc", "* Computes the volume of the sphere
	:rtype: float") Volume;
		Standard_Real Volume ();

		/****************** XAxis ******************/
		%feature("compactdefaultargs") XAxis;
		%feature("autodoc", "* Returns the axis X of the sphere.
	:rtype: gp_Ax1") XAxis;
		gp_Ax1 XAxis ();

		/****************** YAxis ******************/
		%feature("compactdefaultargs") YAxis;
		%feature("autodoc", "* Returns the axis Y of the sphere.
	:rtype: gp_Ax1") YAxis;
		gp_Ax1 YAxis ();

		/****************** gp_Sphere ******************/
		%feature("compactdefaultargs") gp_Sphere;
		%feature("autodoc", "* Creates an indefinite sphere.
	:rtype: None") gp_Sphere;
		 gp_Sphere ();

		/****************** gp_Sphere ******************/
		%feature("compactdefaultargs") gp_Sphere;
		%feature("autodoc", "* Constructs a sphere with radius Radius, centered on the origin of A3. A3 is the local coordinate system of the sphere. Warnings : It is not forbidden to create a sphere with null radius. Raises ConstructionError if Radius < 0.0
	:param A3:
	:type A3: gp_Ax3
	:param Radius:
	:type Radius: float
	:rtype: None") gp_Sphere;
		 gp_Sphere (const gp_Ax3 & A3,const Standard_Real Radius);

};


%extend gp_Sphere {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************
* class gp_Torus *
*****************/
%nodefaultctor gp_Torus;
class gp_Torus {
	public:
		/****************** Area ******************/
		%feature("compactdefaultargs") Area;
		%feature("autodoc", "* Computes the area of the torus.
	:rtype: float") Area;
		Standard_Real Area ();

		/****************** Axis ******************/
		%feature("compactdefaultargs") Axis;
		%feature("autodoc", "* returns the symmetry axis of the torus.
	:rtype: gp_Ax1") Axis;
		const gp_Ax1  Axis ();

		/****************** Direct ******************/
		%feature("compactdefaultargs") Direct;
		%feature("autodoc", "* returns true if the Ax3, the local coordinate system of this torus, is right handed.
	:rtype: bool") Direct;
		Standard_Boolean Direct ();

		/****************** Location ******************/
		%feature("compactdefaultargs") Location;
		%feature("autodoc", "* Returns the Torus's location.
	:rtype: gp_Pnt") Location;
		const gp_Pnt  Location ();

		/****************** MajorRadius ******************/
		%feature("compactdefaultargs") MajorRadius;
		%feature("autodoc", "* returns the major radius of the torus.
	:rtype: float") MajorRadius;
		Standard_Real MajorRadius ();

		/****************** MinorRadius ******************/
		%feature("compactdefaultargs") MinorRadius;
		%feature("autodoc", "* returns the minor radius of the torus.
	:rtype: float") MinorRadius;
		Standard_Real MinorRadius ();

		/****************** Mirror ******************/
		%feature("compactdefaultargs") Mirror;
		%feature("autodoc", ":param P:
	:type P: gp_Pnt
	:rtype: None") Mirror;
		void Mirror (const gp_Pnt & P);

		/****************** Mirror ******************/
		%feature("compactdefaultargs") Mirror;
		%feature("autodoc", ":param A1:
	:type A1: gp_Ax1
	:rtype: None") Mirror;
		void Mirror (const gp_Ax1 & A1);

		/****************** Mirror ******************/
		%feature("compactdefaultargs") Mirror;
		%feature("autodoc", ":param A2:
	:type A2: gp_Ax2
	:rtype: None") Mirror;
		void Mirror (const gp_Ax2 & A2);

		/****************** Mirrored ******************/
		%feature("compactdefaultargs") Mirrored;
		%feature("autodoc", "* Performs the symmetrical transformation of a torus with respect to the point P which is the center of the symmetry.
	:param P:
	:type P: gp_Pnt
	:rtype: Standard_NODISCARD gp_Torus") Mirrored;
		Standard_NODISCARD gp_Torus Mirrored (const gp_Pnt & P);

		/****************** Mirrored ******************/
		%feature("compactdefaultargs") Mirrored;
		%feature("autodoc", "* Performs the symmetrical transformation of a torus with respect to an axis placement which is the axis of the symmetry.
	:param A1:
	:type A1: gp_Ax1
	:rtype: Standard_NODISCARD gp_Torus") Mirrored;
		Standard_NODISCARD gp_Torus Mirrored (const gp_Ax1 & A1);

		/****************** Mirrored ******************/
		%feature("compactdefaultargs") Mirrored;
		%feature("autodoc", "* Performs the symmetrical transformation of a torus with respect to a plane. The axis placement A2 locates the plane of the of the symmetry : (Location, XDirection, YDirection).
	:param A2:
	:type A2: gp_Ax2
	:rtype: Standard_NODISCARD gp_Torus") Mirrored;
		Standard_NODISCARD gp_Torus Mirrored (const gp_Ax2 & A2);

		/****************** Position ******************/
		%feature("compactdefaultargs") Position;
		%feature("autodoc", "* Returns the local coordinates system of the torus.
	:rtype: gp_Ax3") Position;
		const gp_Ax3  Position ();

		/****************** Rotate ******************/
		%feature("compactdefaultargs") Rotate;
		%feature("autodoc", ":param A1:
	:type A1: gp_Ax1
	:param Ang:
	:type Ang: float
	:rtype: None") Rotate;
		void Rotate (const gp_Ax1 & A1,const Standard_Real Ang);

		/****************** Rotated ******************/
		%feature("compactdefaultargs") Rotated;
		%feature("autodoc", "* Rotates a torus. A1 is the axis of the rotation. Ang is the angular value of the rotation in radians.
	:param A1:
	:type A1: gp_Ax1
	:param Ang:
	:type Ang: float
	:rtype: Standard_NODISCARD gp_Torus") Rotated;
		Standard_NODISCARD gp_Torus Rotated (const gp_Ax1 & A1,const Standard_Real Ang);

		/****************** Scale ******************/
		%feature("compactdefaultargs") Scale;
		%feature("autodoc", ":param P:
	:type P: gp_Pnt
	:param S:
	:type S: float
	:rtype: None") Scale;
		void Scale (const gp_Pnt & P,const Standard_Real S);

		/****************** Scaled ******************/
		%feature("compactdefaultargs") Scaled;
		%feature("autodoc", "* Scales a torus. S is the scaling value. The absolute value of S is used to scale the torus
	:param P:
	:type P: gp_Pnt
	:param S:
	:type S: float
	:rtype: Standard_NODISCARD gp_Torus") Scaled;
		Standard_NODISCARD gp_Torus Scaled (const gp_Pnt & P,const Standard_Real S);

		/****************** SetAxis ******************/
		%feature("compactdefaultargs") SetAxis;
		%feature("autodoc", "* Modifies this torus, by redefining its local coordinate system so that: - its origin and 'main Direction' become those of the axis A1 (the 'X Direction' and 'Y Direction' are then recomputed). Raises ConstructionError if the direction of A1 is parallel to the 'XDirection' of the coordinate system of the toroidal surface.
	:param A1:
	:type A1: gp_Ax1
	:rtype: None") SetAxis;
		void SetAxis (const gp_Ax1 & A1);

		/****************** SetLocation ******************/
		%feature("compactdefaultargs") SetLocation;
		%feature("autodoc", "* Changes the location of the torus.
	:param Loc:
	:type Loc: gp_Pnt
	:rtype: None") SetLocation;
		void SetLocation (const gp_Pnt & Loc);

		/****************** SetMajorRadius ******************/
		%feature("compactdefaultargs") SetMajorRadius;
		%feature("autodoc", "* Assigns value to the major radius of this torus. Raises ConstructionError if MajorRadius - MinorRadius <= Resolution()
	:param MajorRadius:
	:type MajorRadius: float
	:rtype: None") SetMajorRadius;
		void SetMajorRadius (const Standard_Real MajorRadius);

		/****************** SetMinorRadius ******************/
		%feature("compactdefaultargs") SetMinorRadius;
		%feature("autodoc", "* Assigns value to the minor radius of this torus. Raises ConstructionError if MinorRadius < 0.0 or if MajorRadius - MinorRadius <= Resolution from gp.
	:param MinorRadius:
	:type MinorRadius: float
	:rtype: None") SetMinorRadius;
		void SetMinorRadius (const Standard_Real MinorRadius);

		/****************** SetPosition ******************/
		%feature("compactdefaultargs") SetPosition;
		%feature("autodoc", "* Changes the local coordinate system of the surface.
	:param A3:
	:type A3: gp_Ax3
	:rtype: None") SetPosition;
		void SetPosition (const gp_Ax3 & A3);

		/****************** Transform ******************/
		%feature("compactdefaultargs") Transform;
		%feature("autodoc", ":param T:
	:type T: gp_Trsf
	:rtype: None") Transform;
		void Transform (const gp_Trsf & T);

		/****************** Transformed ******************/
		%feature("compactdefaultargs") Transformed;
		%feature("autodoc", "* Transforms a torus with the transformation T from class Trsf.
	:param T:
	:type T: gp_Trsf
	:rtype: Standard_NODISCARD gp_Torus") Transformed;
		Standard_NODISCARD gp_Torus Transformed (const gp_Trsf & T);

		/****************** Translate ******************/
		%feature("compactdefaultargs") Translate;
		%feature("autodoc", ":param V:
	:type V: gp_Vec
	:rtype: None") Translate;
		void Translate (const gp_Vec & V);

		/****************** Translate ******************/
		%feature("compactdefaultargs") Translate;
		%feature("autodoc", ":param P1:
	:type P1: gp_Pnt
	:param P2:
	:type P2: gp_Pnt
	:rtype: None") Translate;
		void Translate (const gp_Pnt & P1,const gp_Pnt & P2);

		/****************** Translated ******************/
		%feature("compactdefaultargs") Translated;
		%feature("autodoc", "* Translates a torus in the direction of the vector V. The magnitude of the translation is the vector's magnitude.
	:param V:
	:type V: gp_Vec
	:rtype: Standard_NODISCARD gp_Torus") Translated;
		Standard_NODISCARD gp_Torus Translated (const gp_Vec & V);

		/****************** Translated ******************/
		%feature("compactdefaultargs") Translated;
		%feature("autodoc", "* Translates a torus from the point P1 to the point P2.
	:param P1:
	:type P1: gp_Pnt
	:param P2:
	:type P2: gp_Pnt
	:rtype: Standard_NODISCARD gp_Torus") Translated;
		Standard_NODISCARD gp_Torus Translated (const gp_Pnt & P1,const gp_Pnt & P2);

		/****************** UReverse ******************/
		%feature("compactdefaultargs") UReverse;
		%feature("autodoc", "* Reverses the U parametrization of the torus reversing the YAxis.
	:rtype: None") UReverse;
		void UReverse ();

		/****************** VReverse ******************/
		%feature("compactdefaultargs") VReverse;
		%feature("autodoc", "* Reverses the V parametrization of the torus reversing the ZAxis.
	:rtype: None") VReverse;
		void VReverse ();

		/****************** Volume ******************/
		%feature("compactdefaultargs") Volume;
		%feature("autodoc", "* Computes the volume of the torus.
	:rtype: float") Volume;
		Standard_Real Volume ();

		/****************** XAxis ******************/
		%feature("compactdefaultargs") XAxis;
		%feature("autodoc", "* returns the axis X of the torus.
	:rtype: gp_Ax1") XAxis;
		gp_Ax1 XAxis ();

		/****************** YAxis ******************/
		%feature("compactdefaultargs") YAxis;
		%feature("autodoc", "* returns the axis Y of the torus.
	:rtype: gp_Ax1") YAxis;
		gp_Ax1 YAxis ();

		/****************** gp_Torus ******************/
		%feature("compactdefaultargs") gp_Torus;
		%feature("autodoc", "* creates an indefinite Torus.
	:rtype: None") gp_Torus;
		 gp_Torus ();

		/****************** gp_Torus ******************/
		%feature("compactdefaultargs") gp_Torus;
		%feature("autodoc", "* a torus centered on the origin of coordinate system A3, with major radius MajorRadius and minor radius MinorRadius, and with the reference plane defined by the origin, the 'X Direction' and the 'Y Direction' of A3. Warnings : It is not forbidden to create a torus with MajorRadius = MinorRadius = 0.0 Raises ConstructionError if MinorRadius < 0.0 or if MajorRadius < 0.0
	:param A3:
	:type A3: gp_Ax3
	:param MajorRadius:
	:type MajorRadius: float
	:param MinorRadius:
	:type MinorRadius: float
	:rtype: None") gp_Torus;
		 gp_Torus (const gp_Ax3 & A3,const Standard_Real MajorRadius,const Standard_Real MinorRadius);

};


%extend gp_Torus {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************
* class gp_Trsf *
****************/
%nodefaultctor gp_Trsf;
class gp_Trsf {
	public:

        %feature("autodoc", "1");
        %extend{
            std::string DumpJsonToString(int depth=-1) {
            std::stringstream s;
            self->DumpJson(s, depth);
            return s.str();}
        };
        		/****************** Form ******************/
		%feature("compactdefaultargs") Form;
		%feature("autodoc", "* Returns the nature of the transformation. It can be: an identity transformation, a rotation, a translation, a mirror transformation (relative to a point, an axis or a plane), a scaling transformation, or a compound transformation.
	:rtype: gp_TrsfForm") Form;
		gp_TrsfForm Form ();

		/****************** GetRotation ******************/
		%feature("compactdefaultargs") GetRotation;
		%feature("autodoc", "* Returns the boolean True if there is non-zero rotation. In the presence of rotation, the output parameters store the axis and the angle of rotation. The method always returns positive value 'theAngle', i.e., 0. < theAngle <= PI. Note that this rotation is defined only by the vectorial part of the transformation; generally you would need to check also the translational part to obtain the axis (gp_Ax1) of rotation.
	:param theAxis:
	:type theAxis: gp_XYZ
	:param theAngle:
	:type theAngle: float &
	:rtype: bool") GetRotation;
		Standard_Boolean GetRotation (gp_XYZ & theAxis,Standard_Real &OutValue);

		/****************** GetRotation ******************/
		%feature("compactdefaultargs") GetRotation;
		%feature("autodoc", "* Returns quaternion representing rotational part of the transformation.
	:rtype: gp_Quaternion") GetRotation;
		gp_Quaternion GetRotation ();

		/****************** HVectorialPart ******************/
		%feature("compactdefaultargs") HVectorialPart;
		%feature("autodoc", "* Computes the homogeneous vectorial part of the transformation. It is a 3*3 matrix which doesn't include the scale factor. In other words, the vectorial part of this transformation is equal to its homogeneous vectorial part, multiplied by the scale factor. The coefficients of this matrix must be multiplied by the scale factor to obtain the coefficients of the transformation.
	:rtype: gp_Mat") HVectorialPart;
		const gp_Mat  HVectorialPart ();

		/****************** Invert ******************/
		%feature("compactdefaultargs") Invert;
		%feature("autodoc", ":rtype: None") Invert;
		void Invert ();

		/****************** Inverted ******************/
		%feature("compactdefaultargs") Inverted;
		%feature("autodoc", "* Computes the reverse transformation Raises an exception if the matrix of the transformation is not inversible, it means that the scale factor is lower or equal to Resolution from package gp. Computes the transformation composed with T and <self>. In a C++ implementation you can also write Tcomposed = <self> * T. Example : Trsf T1, T2, Tcomp; ............... Tcomp = T2.Multiplied(T1); // or (Tcomp = T2 * T1) Pnt P1(10.,3.,4.); Pnt P2 = P1.Transformed(Tcomp); //using Tcomp Pnt P3 = P1.Transformed(T1); //using T1 then T2 P3.Transform(T2); // P3 = P2 !!!
	:rtype: Standard_NODISCARD gp_Trsf") Inverted;
		Standard_NODISCARD gp_Trsf Inverted ();

		/****************** IsNegative ******************/
		%feature("compactdefaultargs") IsNegative;
		%feature("autodoc", "* Returns true if the determinant of the vectorial part of this transformation is negative.
	:rtype: bool") IsNegative;
		Standard_Boolean IsNegative ();

		/****************** Multiplied ******************/
		%feature("compactdefaultargs") Multiplied;
		%feature("autodoc", ":param T:
	:type T: gp_Trsf
	:rtype: Standard_NODISCARD gp_Trsf") Multiplied;
		Standard_NODISCARD gp_Trsf Multiplied (const gp_Trsf & T);

		/****************** Multiply ******************/
		%feature("compactdefaultargs") Multiply;
		%feature("autodoc", "* Computes the transformation composed with <self> and T. <self> = <self> * T
	:param T:
	:type T: gp_Trsf
	:rtype: None") Multiply;
		void Multiply (const gp_Trsf & T);

		/****************** Power ******************/
		%feature("compactdefaultargs") Power;
		%feature("autodoc", ":param N:
	:type N: int
	:rtype: None") Power;
		void Power (const Standard_Integer N);

		/****************** Powered ******************/
		%feature("compactdefaultargs") Powered;
		%feature("autodoc", "* Computes the following composition of transformations <self> * <self> * .......* <self>, N time. if N = 0 <self> = Identity if N < 0 <self> = <self>.Inverse() *...........* <self>.Inverse(). //! Raises if N < 0 and if the matrix of the transformation not inversible.
	:param N:
	:type N: int
	:rtype: Standard_NODISCARD gp_Trsf") Powered;
		Standard_NODISCARD gp_Trsf Powered (const Standard_Integer N);

		/****************** PreMultiply ******************/
		%feature("compactdefaultargs") PreMultiply;
		%feature("autodoc", "* Computes the transformation composed with <self> and T. <self> = T * <self>
	:param T:
	:type T: gp_Trsf
	:rtype: None") PreMultiply;
		void PreMultiply (const gp_Trsf & T);

		/****************** ScaleFactor ******************/
		%feature("compactdefaultargs") ScaleFactor;
		%feature("autodoc", "* Returns the scale factor.
	:rtype: float") ScaleFactor;
		Standard_Real ScaleFactor ();

		/****************** SetDisplacement ******************/
		%feature("compactdefaultargs") SetDisplacement;
		%feature("autodoc", "* Modifies this transformation so that it transforms the coordinate system defined by FromSystem1 into the one defined by ToSystem2. After this modification, this transformation transforms: - the origin of FromSystem1 into the origin of ToSystem2, - the 'X Direction' of FromSystem1 into the 'X Direction' of ToSystem2, - the 'Y Direction' of FromSystem1 into the 'Y Direction' of ToSystem2, and - the 'main Direction' of FromSystem1 into the 'main Direction' of ToSystem2. Warning When you know the coordinates of a point in one coordinate system and you want to express these coordinates in another one, do not use the transformation resulting from this function. Use the transformation that results from SetTransformation instead. SetDisplacement and SetTransformation create related transformations: the vectorial part of one is the inverse of the vectorial part of the other.
	:param FromSystem1:
	:type FromSystem1: gp_Ax3
	:param ToSystem2:
	:type ToSystem2: gp_Ax3
	:rtype: None") SetDisplacement;
		void SetDisplacement (const gp_Ax3 & FromSystem1,const gp_Ax3 & ToSystem2);

		/****************** SetForm ******************/
		%feature("compactdefaultargs") SetForm;
		%feature("autodoc", ":param P:
	:type P: gp_TrsfForm
	:rtype: None") SetForm;
		void SetForm (const gp_TrsfForm P);

		/****************** SetMirror ******************/
		%feature("compactdefaultargs") SetMirror;
		%feature("autodoc", "* Makes the transformation into a symmetrical transformation. P is the center of the symmetry.
	:param P:
	:type P: gp_Pnt
	:rtype: None") SetMirror;
		void SetMirror (const gp_Pnt & P);

		/****************** SetMirror ******************/
		%feature("compactdefaultargs") SetMirror;
		%feature("autodoc", "* Makes the transformation into a symmetrical transformation. A1 is the center of the axial symmetry.
	:param A1:
	:type A1: gp_Ax1
	:rtype: None") SetMirror;
		void SetMirror (const gp_Ax1 & A1);

		/****************** SetMirror ******************/
		%feature("compactdefaultargs") SetMirror;
		%feature("autodoc", "* Makes the transformation into a symmetrical transformation. A2 is the center of the planar symmetry and defines the plane of symmetry by its origin, 'X Direction' and 'Y Direction'.
	:param A2:
	:type A2: gp_Ax2
	:rtype: None") SetMirror;
		void SetMirror (const gp_Ax2 & A2);

		/****************** SetRotation ******************/
		%feature("compactdefaultargs") SetRotation;
		%feature("autodoc", "* Changes the transformation into a rotation. A1 is the rotation axis and Ang is the angular value of the rotation in radians.
	:param A1:
	:type A1: gp_Ax1
	:param Ang:
	:type Ang: float
	:rtype: None") SetRotation;
		void SetRotation (const gp_Ax1 & A1,const Standard_Real Ang);

		/****************** SetRotation ******************/
		%feature("compactdefaultargs") SetRotation;
		%feature("autodoc", "* Changes the transformation into a rotation defined by quaternion. Note that rotation is performed around origin, i.e. no translation is involved.
	:param R:
	:type R: gp_Quaternion
	:rtype: None") SetRotation;
		void SetRotation (const gp_Quaternion & R);

		/****************** SetScale ******************/
		%feature("compactdefaultargs") SetScale;
		%feature("autodoc", "* Changes the transformation into a scale. P is the center of the scale and S is the scaling value. Raises ConstructionError If <S> is null.
	:param P:
	:type P: gp_Pnt
	:param S:
	:type S: float
	:rtype: None") SetScale;
		void SetScale (const gp_Pnt & P,const Standard_Real S);

		/****************** SetScaleFactor ******************/
		%feature("compactdefaultargs") SetScaleFactor;
		%feature("autodoc", "* Modifies the scale factor. Raises ConstructionError If S is null.
	:param S:
	:type S: float
	:rtype: None") SetScaleFactor;
		void SetScaleFactor (const Standard_Real S);

		/****************** SetTransformation ******************/
		%feature("compactdefaultargs") SetTransformation;
		%feature("autodoc", "* Modifies this transformation so that it transforms the coordinates of any point, (x, y, z), relative to a source coordinate system into the coordinates (x', y', z') which are relative to a target coordinate system, but which represent the same point The transformation is from the coordinate system 'FromSystem1' to the coordinate system 'ToSystem2'. Example : In a C++ implementation : Real x1, y1, z1; // are the coordinates of a point in the // local system FromSystem1 Real x2, y2, z2; // are the coordinates of a point in the // local system ToSystem2 gp_Pnt P1 (x1, y1, z1) Trsf T; T.SetTransformation (FromSystem1, ToSystem2); gp_Pnt P2 = P1.Transformed (T); P2.Coord (x2, y2, z2);
	:param FromSystem1:
	:type FromSystem1: gp_Ax3
	:param ToSystem2:
	:type ToSystem2: gp_Ax3
	:rtype: None") SetTransformation;
		void SetTransformation (const gp_Ax3 & FromSystem1,const gp_Ax3 & ToSystem2);

		/****************** SetTransformation ******************/
		%feature("compactdefaultargs") SetTransformation;
		%feature("autodoc", "* Modifies this transformation so that it transforms the coordinates of any point, (x, y, z), relative to a source coordinate system into the coordinates (x', y', z') which are relative to a target coordinate system, but which represent the same point The transformation is from the default coordinate system {P(0.,0.,0.), VX (1.,0.,0.), VY (0.,1.,0.), VZ (0., 0. ,1.) } to the local coordinate system defined with the Ax3 ToSystem. Use in the same way as the previous method. FromSystem1 is defaulted to the absolute coordinate system.
	:param ToSystem:
	:type ToSystem: gp_Ax3
	:rtype: None") SetTransformation;
		void SetTransformation (const gp_Ax3 & ToSystem);

		/****************** SetTransformation ******************/
		%feature("compactdefaultargs") SetTransformation;
		%feature("autodoc", "* Sets transformation by directly specified rotation and translation.
	:param R:
	:type R: gp_Quaternion
	:param T:
	:type T: gp_Vec
	:rtype: None") SetTransformation;
		void SetTransformation (const gp_Quaternion & R,const gp_Vec & T);

		/****************** SetTranslation ******************/
		%feature("compactdefaultargs") SetTranslation;
		%feature("autodoc", "* Changes the transformation into a translation. V is the vector of the translation.
	:param V:
	:type V: gp_Vec
	:rtype: None") SetTranslation;
		void SetTranslation (const gp_Vec & V);

		/****************** SetTranslation ******************/
		%feature("compactdefaultargs") SetTranslation;
		%feature("autodoc", "* Makes the transformation into a translation where the translation vector is the vector (P1, P2) defined from point P1 to point P2.
	:param P1:
	:type P1: gp_Pnt
	:param P2:
	:type P2: gp_Pnt
	:rtype: None") SetTranslation;
		void SetTranslation (const gp_Pnt & P1,const gp_Pnt & P2);

		/****************** SetTranslationPart ******************/
		%feature("compactdefaultargs") SetTranslationPart;
		%feature("autodoc", "* Replaces the translation vector with the vector V.
	:param V:
	:type V: gp_Vec
	:rtype: None") SetTranslationPart;
		void SetTranslationPart (const gp_Vec & V);

		/****************** SetValues ******************/
		%feature("compactdefaultargs") SetValues;
		%feature("autodoc", "* Sets the coefficients of the transformation. The transformation of the point x,y,z is the point x',y',z' with : //! x' = a11 x + a12 y + a13 z + a14 y' = a21 x + a22 y + a23 z + a24 z' = a31 x + a32 y + a33 z + a34 //! The method Value(i,j) will return aij. Raises ConstructionError if the determinant of the aij is null. The matrix is orthogonalized before future using.
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
	:rtype: None") SetValues;
		void SetValues (const Standard_Real a11,const Standard_Real a12,const Standard_Real a13,const Standard_Real a14,const Standard_Real a21,const Standard_Real a22,const Standard_Real a23,const Standard_Real a24,const Standard_Real a31,const Standard_Real a32,const Standard_Real a33,const Standard_Real a34);

		/****************** Transforms ******************/
		%feature("compactdefaultargs") Transforms;
		%feature("autodoc", ":param X:
	:type X: float &
	:param Y:
	:type Y: float &
	:param Z:
	:type Z: float &
	:rtype: None") Transforms;
		void Transforms (Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);

		/****************** Transforms ******************/
		%feature("compactdefaultargs") Transforms;
		%feature("autodoc", "* Transformation of a triplet XYZ with a Trsf
	:param Coord:
	:type Coord: gp_XYZ
	:rtype: None") Transforms;
		void Transforms (gp_XYZ & Coord);

		/****************** TranslationPart ******************/
		%feature("compactdefaultargs") TranslationPart;
		%feature("autodoc", "* Returns the translation part of the transformation's matrix
	:rtype: gp_XYZ") TranslationPart;
		const gp_XYZ  TranslationPart ();

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "* Returns the coefficients of the transformation's matrix. It is a 3 rows * 4 columns matrix. This coefficient includes the scale factor. Raises OutOfRanged if Row < 1 or Row > 3 or Col < 1 or Col > 4
	:param Row:
	:type Row: int
	:param Col:
	:type Col: int
	:rtype: float") Value;
		Standard_Real Value (const Standard_Integer Row,const Standard_Integer Col);

		/****************** VectorialPart ******************/
		%feature("compactdefaultargs") VectorialPart;
		%feature("autodoc", "* Returns the vectorial part of the transformation. It is a 3*3 matrix which includes the scale factor.
	:rtype: gp_Mat") VectorialPart;
		gp_Mat VectorialPart ();

		/****************** gp_Trsf ******************/
		%feature("compactdefaultargs") gp_Trsf;
		%feature("autodoc", "* Returns the identity transformation.
	:rtype: None") gp_Trsf;
		 gp_Trsf ();

		/****************** gp_Trsf ******************/
		%feature("compactdefaultargs") gp_Trsf;
		%feature("autodoc", "* Creates a 3D transformation from the 2D transformation T. The resulting transformation has a homogeneous vectorial part, V3, and a translation part, T3, built from T: a11 a12 0 a13 V3 = a21 a22 0 T3 = a23 0 0 1. 0 It also has the same scale factor as T. This guarantees (by projection) that the transformation which would be performed by T in a plane (2D space) is performed by the resulting transformation in the xOy plane of the 3D space, (i.e. in the plane defined by the origin (0., 0., 0.) and the vectors DX (1., 0., 0.), and DY (0., 1., 0.)). The scale factor is applied to the entire space.
	:param T:
	:type T: gp_Trsf2d
	:rtype: None") gp_Trsf;
		 gp_Trsf (const gp_Trsf2d & T);

		/****************** operator * ******************/
		%feature("compactdefaultargs") operator *;
		%feature("autodoc", ":param T:
	:type T: gp_Trsf
	:rtype: Standard_NODISCARD gp_Trsf") operator *;
		Standard_NODISCARD gp_Trsf operator * (const gp_Trsf & T);


        %extend{
            void __imul_wrapper__(const gp_Trsf  other) {
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
	}
};

/******************
* class gp_Trsf2d *
******************/
%nodefaultctor gp_Trsf2d;
class gp_Trsf2d {
	public:
		/****************** Form ******************/
		%feature("compactdefaultargs") Form;
		%feature("autodoc", "* Returns the nature of the transformation. It can be an identity transformation, a rotation, a translation, a mirror (relative to a point or an axis), a scaling transformation, or a compound transformation.
	:rtype: gp_TrsfForm") Form;
		gp_TrsfForm Form ();

		/****************** HVectorialPart ******************/
		%feature("compactdefaultargs") HVectorialPart;
		%feature("autodoc", "* Returns the homogeneous vectorial part of the transformation. It is a 2*2 matrix which doesn't include the scale factor. The coefficients of this matrix must be multiplied by the scale factor to obtain the coefficients of the transformation.
	:rtype: gp_Mat2d") HVectorialPart;
		const gp_Mat2d  HVectorialPart ();

		/****************** Invert ******************/
		%feature("compactdefaultargs") Invert;
		%feature("autodoc", ":rtype: None") Invert;
		void Invert ();

		/****************** Inverted ******************/
		%feature("compactdefaultargs") Inverted;
		%feature("autodoc", "* Computes the reverse transformation. Raises an exception if the matrix of the transformation is not inversible, it means that the scale factor is lower or equal to Resolution from package gp.
	:rtype: Standard_NODISCARD gp_Trsf2d") Inverted;
		Standard_NODISCARD gp_Trsf2d Inverted ();

		/****************** IsNegative ******************/
		%feature("compactdefaultargs") IsNegative;
		%feature("autodoc", "* Returns true if the determinant of the vectorial part of this transformation is negative..
	:rtype: bool") IsNegative;
		Standard_Boolean IsNegative ();

		/****************** Multiplied ******************/
		%feature("compactdefaultargs") Multiplied;
		%feature("autodoc", ":param T:
	:type T: gp_Trsf2d
	:rtype: Standard_NODISCARD gp_Trsf2d") Multiplied;
		Standard_NODISCARD gp_Trsf2d Multiplied (const gp_Trsf2d & T);

		/****************** Multiply ******************/
		%feature("compactdefaultargs") Multiply;
		%feature("autodoc", "* Computes the transformation composed from <self> and T. <self> = <self> * T
	:param T:
	:type T: gp_Trsf2d
	:rtype: None") Multiply;
		void Multiply (const gp_Trsf2d & T);

		/****************** Power ******************/
		%feature("compactdefaultargs") Power;
		%feature("autodoc", ":param N:
	:type N: int
	:rtype: None") Power;
		void Power (const Standard_Integer N);

		/****************** Powered ******************/
		%feature("compactdefaultargs") Powered;
		%feature("autodoc", "* Computes the following composition of transformations <self> * <self> * .......* <self>, N time. if N = 0 <self> = Identity if N < 0 <self> = <self>.Inverse() *...........* <self>.Inverse(). //! Raises if N < 0 and if the matrix of the transformation not inversible.
	:param N:
	:type N: int
	:rtype: gp_Trsf2d") Powered;
		gp_Trsf2d Powered (const Standard_Integer N);

		/****************** PreMultiply ******************/
		%feature("compactdefaultargs") PreMultiply;
		%feature("autodoc", "* Computes the transformation composed from <self> and T. <self> = T * <self>
	:param T:
	:type T: gp_Trsf2d
	:rtype: None") PreMultiply;
		void PreMultiply (const gp_Trsf2d & T);

		/****************** RotationPart ******************/
		%feature("compactdefaultargs") RotationPart;
		%feature("autodoc", "* Returns the angle corresponding to the rotational component of the transformation matrix (operation opposite to SetRotation()).
	:rtype: float") RotationPart;
		Standard_Real RotationPart ();

		/****************** ScaleFactor ******************/
		%feature("compactdefaultargs") ScaleFactor;
		%feature("autodoc", "* Returns the scale factor.
	:rtype: float") ScaleFactor;
		Standard_Real ScaleFactor ();

		/****************** SetMirror ******************/
		%feature("compactdefaultargs") SetMirror;
		%feature("autodoc", "* Changes the transformation into a symmetrical transformation. P is the center of the symmetry.
	:param P:
	:type P: gp_Pnt2d
	:rtype: None") SetMirror;
		void SetMirror (const gp_Pnt2d & P);

		/****************** SetMirror ******************/
		%feature("compactdefaultargs") SetMirror;
		%feature("autodoc", "* Changes the transformation into a symmetrical transformation. A is the center of the axial symmetry.
	:param A:
	:type A: gp_Ax2d
	:rtype: None") SetMirror;
		void SetMirror (const gp_Ax2d & A);

		/****************** SetRotation ******************/
		%feature("compactdefaultargs") SetRotation;
		%feature("autodoc", "* Changes the transformation into a rotation. P is the rotation's center and Ang is the angular value of the rotation in radian.
	:param P:
	:type P: gp_Pnt2d
	:param Ang:
	:type Ang: float
	:rtype: None") SetRotation;
		void SetRotation (const gp_Pnt2d & P,const Standard_Real Ang);

		/****************** SetScale ******************/
		%feature("compactdefaultargs") SetScale;
		%feature("autodoc", "* Changes the transformation into a scale. P is the center of the scale and S is the scaling value.
	:param P:
	:type P: gp_Pnt2d
	:param S:
	:type S: float
	:rtype: None") SetScale;
		void SetScale (const gp_Pnt2d & P,const Standard_Real S);

		/****************** SetScaleFactor ******************/
		%feature("compactdefaultargs") SetScaleFactor;
		%feature("autodoc", "* Modifies the scale factor.
	:param S:
	:type S: float
	:rtype: None") SetScaleFactor;
		void SetScaleFactor (const Standard_Real S);

		/****************** SetTransformation ******************/
		%feature("compactdefaultargs") SetTransformation;
		%feature("autodoc", "* Changes a transformation allowing passage from the coordinate system 'FromSystem1' to the coordinate system 'ToSystem2'.
	:param FromSystem1:
	:type FromSystem1: gp_Ax2d
	:param ToSystem2:
	:type ToSystem2: gp_Ax2d
	:rtype: None") SetTransformation;
		void SetTransformation (const gp_Ax2d & FromSystem1,const gp_Ax2d & ToSystem2);

		/****************** SetTransformation ******************/
		%feature("compactdefaultargs") SetTransformation;
		%feature("autodoc", "* Changes the transformation allowing passage from the basic coordinate system {P(0.,0.,0.), VX (1.,0.,0.), VY (0.,1.,0.)} to the local coordinate system defined with the Ax2d ToSystem.
	:param ToSystem:
	:type ToSystem: gp_Ax2d
	:rtype: None") SetTransformation;
		void SetTransformation (const gp_Ax2d & ToSystem);

		/****************** SetTranslation ******************/
		%feature("compactdefaultargs") SetTranslation;
		%feature("autodoc", "* Changes the transformation into a translation. V is the vector of the translation.
	:param V:
	:type V: gp_Vec2d
	:rtype: None") SetTranslation;
		void SetTranslation (const gp_Vec2d & V);

		/****************** SetTranslation ******************/
		%feature("compactdefaultargs") SetTranslation;
		%feature("autodoc", "* Makes the transformation into a translation from the point P1 to the point P2.
	:param P1:
	:type P1: gp_Pnt2d
	:param P2:
	:type P2: gp_Pnt2d
	:rtype: None") SetTranslation;
		void SetTranslation (const gp_Pnt2d & P1,const gp_Pnt2d & P2);

		/****************** SetTranslationPart ******************/
		%feature("compactdefaultargs") SetTranslationPart;
		%feature("autodoc", "* Replaces the translation vector with V.
	:param V:
	:type V: gp_Vec2d
	:rtype: None") SetTranslationPart;
		void SetTranslationPart (const gp_Vec2d & V);

		/****************** SetValues ******************/
		%feature("compactdefaultargs") SetValues;
		%feature("autodoc", "* Sets the coefficients of the transformation. The transformation of the point x,y is the point x',y' with : //! x' = a11 x + a12 y + a13 y' = a21 x + a22 y + a23 //! The method Value(i,j) will return aij. Raises ConstructionError if the determinant of the aij is null. If the matrix as not a uniform scale it will be orthogonalized before future using.
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
	:rtype: None") SetValues;
		void SetValues (const Standard_Real a11,const Standard_Real a12,const Standard_Real a13,const Standard_Real a21,const Standard_Real a22,const Standard_Real a23);

		/****************** Transforms ******************/
		%feature("compactdefaultargs") Transforms;
		%feature("autodoc", ":param X:
	:type X: float &
	:param Y:
	:type Y: float &
	:rtype: None") Transforms;
		void Transforms (Standard_Real &OutValue,Standard_Real &OutValue);

		/****************** Transforms ******************/
		%feature("compactdefaultargs") Transforms;
		%feature("autodoc", "* Transforms a doublet XY with a Trsf2d
	:param Coord:
	:type Coord: gp_XY
	:rtype: None") Transforms;
		void Transforms (gp_XY & Coord);

		/****************** TranslationPart ******************/
		%feature("compactdefaultargs") TranslationPart;
		%feature("autodoc", "* Returns the translation part of the transformation's matrix
	:rtype: gp_XY") TranslationPart;
		const gp_XY  TranslationPart ();

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "* Returns the coefficients of the transformation's matrix. It is a 2 rows * 3 columns matrix. Raises OutOfRange if Row < 1 or Row > 2 or Col < 1 or Col > 3
	:param Row:
	:type Row: int
	:param Col:
	:type Col: int
	:rtype: float") Value;
		Standard_Real Value (const Standard_Integer Row,const Standard_Integer Col);

		/****************** VectorialPart ******************/
		%feature("compactdefaultargs") VectorialPart;
		%feature("autodoc", "* Returns the vectorial part of the transformation. It is a 2*2 matrix which includes the scale factor.
	:rtype: gp_Mat2d") VectorialPart;
		gp_Mat2d VectorialPart ();

		/****************** gp_Trsf2d ******************/
		%feature("compactdefaultargs") gp_Trsf2d;
		%feature("autodoc", "* Returns identity transformation.
	:rtype: None") gp_Trsf2d;
		 gp_Trsf2d ();

		/****************** gp_Trsf2d ******************/
		%feature("compactdefaultargs") gp_Trsf2d;
		%feature("autodoc", "* Creates a 2d transformation in the XY plane from a 3d transformation .
	:param T:
	:type T: gp_Trsf
	:rtype: None") gp_Trsf2d;
		 gp_Trsf2d (const gp_Trsf & T);

		/****************** operator * ******************/
		%feature("compactdefaultargs") operator *;
		%feature("autodoc", ":param T:
	:type T: gp_Trsf2d
	:rtype: Standard_NODISCARD gp_Trsf2d") operator *;
		Standard_NODISCARD gp_Trsf2d operator * (const gp_Trsf2d & T);


        %extend{
            void __imul_wrapper__(const gp_Trsf2d  other) {
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
%nodefaultctor gp_Vec;
class gp_Vec {
	public:
		/****************** Add ******************/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "* Adds two vectors
	:param Other:
	:type Other: gp_Vec
	:rtype: None") Add;
		void Add (const gp_Vec & Other);

		/****************** Added ******************/
		%feature("compactdefaultargs") Added;
		%feature("autodoc", "* Adds two vectors
	:param Other:
	:type Other: gp_Vec
	:rtype: Standard_NODISCARD gp_Vec") Added;
		Standard_NODISCARD gp_Vec Added (const gp_Vec & Other);

		/****************** Angle ******************/
		%feature("compactdefaultargs") Angle;
		%feature("autodoc", "* Computes the angular value between <self> and <Other> Returns the angle value between 0 and PI in radian. Raises VectorWithNullMagnitude if <self>.Magnitude() <= Resolution from gp or Other.Magnitude() <= Resolution because the angular value is indefinite if one of the vectors has a null magnitude.
	:param Other:
	:type Other: gp_Vec
	:rtype: float") Angle;
		Standard_Real Angle (const gp_Vec & Other);

		/****************** AngleWithRef ******************/
		%feature("compactdefaultargs") AngleWithRef;
		%feature("autodoc", "* Computes the angle, in radians, between this vector and vector Other. The result is a value between -Pi and Pi. For this, VRef defines the positive sense of rotation: the angular value is positive, if the cross product this ^ Other has the same orientation as VRef relative to the plane defined by the vectors this and Other. Otherwise, the angular value is negative. Exceptions gp_VectorWithNullMagnitude if the magnitude of this vector, the vector Other, or the vector VRef is less than or equal to gp::Resolution(). Standard_DomainError if this vector, the vector Other, and the vector VRef are coplanar, unless this vector and the vector Other are parallel.
	:param Other:
	:type Other: gp_Vec
	:param VRef:
	:type VRef: gp_Vec
	:rtype: float") AngleWithRef;
		Standard_Real AngleWithRef (const gp_Vec & Other,const gp_Vec & VRef);

		/****************** Coord ******************/
		%feature("compactdefaultargs") Coord;
		%feature("autodoc", "* Returns the coordinate of range Index : Index = 1 => X is returned Index = 2 => Y is returned Index = 3 => Z is returned Raised if Index != {1, 2, 3}.
	:param Index:
	:type Index: int
	:rtype: float") Coord;
		Standard_Real Coord (const Standard_Integer Index);

		/****************** Coord ******************/
		%feature("compactdefaultargs") Coord;
		%feature("autodoc", "* For this vector returns its three coordinates Xv, Yv, and Zvinline
	:param Xv:
	:type Xv: float &
	:param Yv:
	:type Yv: float &
	:param Zv:
	:type Zv: float &
	:rtype: None") Coord;
		void Coord (Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);

		/****************** Cross ******************/
		%feature("compactdefaultargs") Cross;
		%feature("autodoc", "* computes the cross product between two vectors
	:param Right:
	:type Right: gp_Vec
	:rtype: None") Cross;
		void Cross (const gp_Vec & Right);

		/****************** CrossCross ******************/
		%feature("compactdefaultargs") CrossCross;
		%feature("autodoc", "* Computes the triple vector product. <self> ^= (V1 ^ V2)
	:param V1:
	:type V1: gp_Vec
	:param V2:
	:type V2: gp_Vec
	:rtype: None") CrossCross;
		void CrossCross (const gp_Vec & V1,const gp_Vec & V2);

		/****************** CrossCrossed ******************/
		%feature("compactdefaultargs") CrossCrossed;
		%feature("autodoc", "* Computes the triple vector product. <self> ^ (V1 ^ V2)
	:param V1:
	:type V1: gp_Vec
	:param V2:
	:type V2: gp_Vec
	:rtype: Standard_NODISCARD gp_Vec") CrossCrossed;
		Standard_NODISCARD gp_Vec CrossCrossed (const gp_Vec & V1,const gp_Vec & V2);

		/****************** CrossMagnitude ******************/
		%feature("compactdefaultargs") CrossMagnitude;
		%feature("autodoc", "* Computes the magnitude of the cross product between <self> and Right. Returns || <self> ^ Right ||
	:param Right:
	:type Right: gp_Vec
	:rtype: float") CrossMagnitude;
		Standard_Real CrossMagnitude (const gp_Vec & Right);

		/****************** CrossSquareMagnitude ******************/
		%feature("compactdefaultargs") CrossSquareMagnitude;
		%feature("autodoc", "* Computes the square magnitude of the cross product between <self> and Right. Returns || <self> ^ Right ||**2
	:param Right:
	:type Right: gp_Vec
	:rtype: float") CrossSquareMagnitude;
		Standard_Real CrossSquareMagnitude (const gp_Vec & Right);

		/****************** Crossed ******************/
		%feature("compactdefaultargs") Crossed;
		%feature("autodoc", "* computes the cross product between two vectors
	:param Right:
	:type Right: gp_Vec
	:rtype: Standard_NODISCARD gp_Vec") Crossed;
		Standard_NODISCARD gp_Vec Crossed (const gp_Vec & Right);

		/****************** Divide ******************/
		%feature("compactdefaultargs") Divide;
		%feature("autodoc", "* Divides a vector by a scalar
	:param Scalar:
	:type Scalar: float
	:rtype: None") Divide;
		void Divide (const Standard_Real Scalar);

		/****************** Divided ******************/
		%feature("compactdefaultargs") Divided;
		%feature("autodoc", "* Divides a vector by a scalar
	:param Scalar:
	:type Scalar: float
	:rtype: Standard_NODISCARD gp_Vec") Divided;
		Standard_NODISCARD gp_Vec Divided (const Standard_Real Scalar);

		/****************** Dot ******************/
		%feature("compactdefaultargs") Dot;
		%feature("autodoc", "* computes the scalar product
	:param Other:
	:type Other: gp_Vec
	:rtype: float") Dot;
		Standard_Real Dot (const gp_Vec & Other);

		/****************** DotCross ******************/
		%feature("compactdefaultargs") DotCross;
		%feature("autodoc", "* Computes the triple scalar product <self> * (V1 ^ V2).
	:param V1:
	:type V1: gp_Vec
	:param V2:
	:type V2: gp_Vec
	:rtype: float") DotCross;
		Standard_Real DotCross (const gp_Vec & V1,const gp_Vec & V2);

		/****************** IsEqual ******************/
		%feature("compactdefaultargs") IsEqual;
		%feature("autodoc", "* Returns True if the two vectors have the same magnitude value and the same direction. The precision values are LinearTolerance for the magnitude and AngularTolerance for the direction.
	:param Other:
	:type Other: gp_Vec
	:param LinearTolerance:
	:type LinearTolerance: float
	:param AngularTolerance:
	:type AngularTolerance: float
	:rtype: bool") IsEqual;
		Standard_Boolean IsEqual (const gp_Vec & Other,const Standard_Real LinearTolerance,const Standard_Real AngularTolerance);

		/****************** IsNormal ******************/
		%feature("compactdefaultargs") IsNormal;
		%feature("autodoc", "* Returns True if abs(<self>.Angle(Other) - PI/2.) <= AngularTolerance Raises VectorWithNullMagnitude if <self>.Magnitude() <= Resolution or Other.Magnitude() <= Resolution from gp
	:param Other:
	:type Other: gp_Vec
	:param AngularTolerance:
	:type AngularTolerance: float
	:rtype: bool") IsNormal;
		Standard_Boolean IsNormal (const gp_Vec & Other,const Standard_Real AngularTolerance);

		/****************** IsOpposite ******************/
		%feature("compactdefaultargs") IsOpposite;
		%feature("autodoc", "* Returns True if PI - <self>.Angle(Other) <= AngularTolerance Raises VectorWithNullMagnitude if <self>.Magnitude() <= Resolution or Other.Magnitude() <= Resolution from gp
	:param Other:
	:type Other: gp_Vec
	:param AngularTolerance:
	:type AngularTolerance: float
	:rtype: bool") IsOpposite;
		Standard_Boolean IsOpposite (const gp_Vec & Other,const Standard_Real AngularTolerance);

		/****************** IsParallel ******************/
		%feature("compactdefaultargs") IsParallel;
		%feature("autodoc", "* Returns True if Angle(<self>, Other) <= AngularTolerance or PI - Angle(<self>, Other) <= AngularTolerance This definition means that two parallel vectors cannot define a plane but two vectors with opposite directions are considered as parallel. Raises VectorWithNullMagnitude if <self>.Magnitude() <= Resolution or Other.Magnitude() <= Resolution from gp
	:param Other:
	:type Other: gp_Vec
	:param AngularTolerance:
	:type AngularTolerance: float
	:rtype: bool") IsParallel;
		Standard_Boolean IsParallel (const gp_Vec & Other,const Standard_Real AngularTolerance);

		/****************** Magnitude ******************/
		%feature("compactdefaultargs") Magnitude;
		%feature("autodoc", "* Computes the magnitude of this vector.
	:rtype: float") Magnitude;
		Standard_Real Magnitude ();

		/****************** Mirror ******************/
		%feature("compactdefaultargs") Mirror;
		%feature("autodoc", ":param V:
	:type V: gp_Vec
	:rtype: None") Mirror;
		void Mirror (const gp_Vec & V);

		/****************** Mirror ******************/
		%feature("compactdefaultargs") Mirror;
		%feature("autodoc", ":param A1:
	:type A1: gp_Ax1
	:rtype: None") Mirror;
		void Mirror (const gp_Ax1 & A1);

		/****************** Mirror ******************/
		%feature("compactdefaultargs") Mirror;
		%feature("autodoc", ":param A2:
	:type A2: gp_Ax2
	:rtype: None") Mirror;
		void Mirror (const gp_Ax2 & A2);

		/****************** Mirrored ******************/
		%feature("compactdefaultargs") Mirrored;
		%feature("autodoc", "* Performs the symmetrical transformation of a vector with respect to the vector V which is the center of the symmetry.
	:param V:
	:type V: gp_Vec
	:rtype: Standard_NODISCARD gp_Vec") Mirrored;
		Standard_NODISCARD gp_Vec Mirrored (const gp_Vec & V);

		/****************** Mirrored ******************/
		%feature("compactdefaultargs") Mirrored;
		%feature("autodoc", "* Performs the symmetrical transformation of a vector with respect to an axis placement which is the axis of the symmetry.
	:param A1:
	:type A1: gp_Ax1
	:rtype: Standard_NODISCARD gp_Vec") Mirrored;
		Standard_NODISCARD gp_Vec Mirrored (const gp_Ax1 & A1);

		/****************** Mirrored ******************/
		%feature("compactdefaultargs") Mirrored;
		%feature("autodoc", "* Performs the symmetrical transformation of a vector with respect to a plane. The axis placement A2 locates the plane of the symmetry : (Location, XDirection, YDirection).
	:param A2:
	:type A2: gp_Ax2
	:rtype: Standard_NODISCARD gp_Vec") Mirrored;
		Standard_NODISCARD gp_Vec Mirrored (const gp_Ax2 & A2);

		/****************** Multiplied ******************/
		%feature("compactdefaultargs") Multiplied;
		%feature("autodoc", "* Multiplies a vector by a scalar
	:param Scalar:
	:type Scalar: float
	:rtype: Standard_NODISCARD gp_Vec") Multiplied;
		Standard_NODISCARD gp_Vec Multiplied (const Standard_Real Scalar);

		/****************** Multiply ******************/
		%feature("compactdefaultargs") Multiply;
		%feature("autodoc", "* Multiplies a vector by a scalar
	:param Scalar:
	:type Scalar: float
	:rtype: None") Multiply;
		void Multiply (const Standard_Real Scalar);

		/****************** Normalize ******************/
		%feature("compactdefaultargs") Normalize;
		%feature("autodoc", "* normalizes a vector Raises an exception if the magnitude of the vector is lower or equal to Resolution from gp.
	:rtype: None") Normalize;
		void Normalize ();

		/****************** Normalized ******************/
		%feature("compactdefaultargs") Normalized;
		%feature("autodoc", "* normalizes a vector Raises an exception if the magnitude of the vector is lower or equal to Resolution from gp.
	:rtype: Standard_NODISCARD gp_Vec") Normalized;
		Standard_NODISCARD gp_Vec Normalized ();

		/****************** Reverse ******************/
		%feature("compactdefaultargs") Reverse;
		%feature("autodoc", "* Reverses the direction of a vector
	:rtype: None") Reverse;
		void Reverse ();

		/****************** Reversed ******************/
		%feature("compactdefaultargs") Reversed;
		%feature("autodoc", "* Reverses the direction of a vector
	:rtype: Standard_NODISCARD gp_Vec") Reversed;
		Standard_NODISCARD gp_Vec Reversed ();

		/****************** Rotate ******************/
		%feature("compactdefaultargs") Rotate;
		%feature("autodoc", ":param A1:
	:type A1: gp_Ax1
	:param Ang:
	:type Ang: float
	:rtype: None") Rotate;
		void Rotate (const gp_Ax1 & A1,const Standard_Real Ang);

		/****************** Rotated ******************/
		%feature("compactdefaultargs") Rotated;
		%feature("autodoc", "* Rotates a vector. A1 is the axis of the rotation. Ang is the angular value of the rotation in radians.
	:param A1:
	:type A1: gp_Ax1
	:param Ang:
	:type Ang: float
	:rtype: Standard_NODISCARD gp_Vec") Rotated;
		Standard_NODISCARD gp_Vec Rotated (const gp_Ax1 & A1,const Standard_Real Ang);

		/****************** Scale ******************/
		%feature("compactdefaultargs") Scale;
		%feature("autodoc", ":param S:
	:type S: float
	:rtype: None") Scale;
		void Scale (const Standard_Real S);

		/****************** Scaled ******************/
		%feature("compactdefaultargs") Scaled;
		%feature("autodoc", "* Scales a vector. S is the scaling value.
	:param S:
	:type S: float
	:rtype: Standard_NODISCARD gp_Vec") Scaled;
		Standard_NODISCARD gp_Vec Scaled (const Standard_Real S);

		/****************** SetCoord ******************/
		%feature("compactdefaultargs") SetCoord;
		%feature("autodoc", "* Changes the coordinate of range Index Index = 1 => X is modified Index = 2 => Y is modified Index = 3 => Z is modified Raised if Index != {1, 2, 3}.
	:param Index:
	:type Index: int
	:param Xi:
	:type Xi: float
	:rtype: None") SetCoord;
		void SetCoord (const Standard_Integer Index,const Standard_Real Xi);

		/****************** SetCoord ******************/
		%feature("compactdefaultargs") SetCoord;
		%feature("autodoc", "* For this vector, assigns - the values Xv, Yv and Zv to its three coordinates.
	:param Xv:
	:type Xv: float
	:param Yv:
	:type Yv: float
	:param Zv:
	:type Zv: float
	:rtype: None") SetCoord;
		void SetCoord (const Standard_Real Xv,const Standard_Real Yv,const Standard_Real Zv);

		/****************** SetLinearForm ******************/
		%feature("compactdefaultargs") SetLinearForm;
		%feature("autodoc", "* <self> is set to the following linear form : A1 * V1 + A2 * V2 + A3 * V3 + V4
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
	:rtype: None") SetLinearForm;
		void SetLinearForm (const Standard_Real A1,const gp_Vec & V1,const Standard_Real A2,const gp_Vec & V2,const Standard_Real A3,const gp_Vec & V3,const gp_Vec & V4);

		/****************** SetLinearForm ******************/
		%feature("compactdefaultargs") SetLinearForm;
		%feature("autodoc", "* <self> is set to the following linear form : A1 * V1 + A2 * V2 + A3 * V3
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
	:rtype: None") SetLinearForm;
		void SetLinearForm (const Standard_Real A1,const gp_Vec & V1,const Standard_Real A2,const gp_Vec & V2,const Standard_Real A3,const gp_Vec & V3);

		/****************** SetLinearForm ******************/
		%feature("compactdefaultargs") SetLinearForm;
		%feature("autodoc", "* <self> is set to the following linear form : A1 * V1 + A2 * V2 + V3
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
	:rtype: None") SetLinearForm;
		void SetLinearForm (const Standard_Real A1,const gp_Vec & V1,const Standard_Real A2,const gp_Vec & V2,const gp_Vec & V3);

		/****************** SetLinearForm ******************/
		%feature("compactdefaultargs") SetLinearForm;
		%feature("autodoc", "* <self> is set to the following linear form : A1 * V1 + A2 * V2
	:param A1:
	:type A1: float
	:param V1:
	:type V1: gp_Vec
	:param A2:
	:type A2: float
	:param V2:
	:type V2: gp_Vec
	:rtype: None") SetLinearForm;
		void SetLinearForm (const Standard_Real A1,const gp_Vec & V1,const Standard_Real A2,const gp_Vec & V2);

		/****************** SetLinearForm ******************/
		%feature("compactdefaultargs") SetLinearForm;
		%feature("autodoc", "* <self> is set to the following linear form : A1 * V1 + V2
	:param A1:
	:type A1: float
	:param V1:
	:type V1: gp_Vec
	:param V2:
	:type V2: gp_Vec
	:rtype: None") SetLinearForm;
		void SetLinearForm (const Standard_Real A1,const gp_Vec & V1,const gp_Vec & V2);

		/****************** SetLinearForm ******************/
		%feature("compactdefaultargs") SetLinearForm;
		%feature("autodoc", "* <self> is set to the following linear form : V1 + V2
	:param V1:
	:type V1: gp_Vec
	:param V2:
	:type V2: gp_Vec
	:rtype: None") SetLinearForm;
		void SetLinearForm (const gp_Vec & V1,const gp_Vec & V2);

		/****************** SetX ******************/
		%feature("compactdefaultargs") SetX;
		%feature("autodoc", "* Assigns the given value to the X coordinate of this vector.
	:param X:
	:type X: float
	:rtype: None") SetX;
		void SetX (const Standard_Real X);

		/****************** SetXYZ ******************/
		%feature("compactdefaultargs") SetXYZ;
		%feature("autodoc", "* Assigns the three coordinates of Coord to this vector.
	:param Coord:
	:type Coord: gp_XYZ
	:rtype: None") SetXYZ;
		void SetXYZ (const gp_XYZ & Coord);

		/****************** SetY ******************/
		%feature("compactdefaultargs") SetY;
		%feature("autodoc", "* Assigns the given value to the X coordinate of this vector.
	:param Y:
	:type Y: float
	:rtype: None") SetY;
		void SetY (const Standard_Real Y);

		/****************** SetZ ******************/
		%feature("compactdefaultargs") SetZ;
		%feature("autodoc", "* Assigns the given value to the X coordinate of this vector.
	:param Z:
	:type Z: float
	:rtype: None") SetZ;
		void SetZ (const Standard_Real Z);

		/****************** SquareMagnitude ******************/
		%feature("compactdefaultargs") SquareMagnitude;
		%feature("autodoc", "* Computes the square magnitude of this vector.
	:rtype: float") SquareMagnitude;
		Standard_Real SquareMagnitude ();

		/****************** Subtract ******************/
		%feature("compactdefaultargs") Subtract;
		%feature("autodoc", "* Subtracts two vectors
	:param Right:
	:type Right: gp_Vec
	:rtype: None") Subtract;
		void Subtract (const gp_Vec & Right);

		/****************** Subtracted ******************/
		%feature("compactdefaultargs") Subtracted;
		%feature("autodoc", "* Subtracts two vectors
	:param Right:
	:type Right: gp_Vec
	:rtype: Standard_NODISCARD gp_Vec") Subtracted;
		Standard_NODISCARD gp_Vec Subtracted (const gp_Vec & Right);

		/****************** Transform ******************/
		%feature("compactdefaultargs") Transform;
		%feature("autodoc", "* Transforms a vector with the transformation T.
	:param T:
	:type T: gp_Trsf
	:rtype: None") Transform;
		void Transform (const gp_Trsf & T);

		/****************** Transformed ******************/
		%feature("compactdefaultargs") Transformed;
		%feature("autodoc", "* Transforms a vector with the transformation T.
	:param T:
	:type T: gp_Trsf
	:rtype: Standard_NODISCARD gp_Vec") Transformed;
		Standard_NODISCARD gp_Vec Transformed (const gp_Trsf & T);

		/****************** X ******************/
		%feature("compactdefaultargs") X;
		%feature("autodoc", "* For this vector, returns its X coordinate.
	:rtype: float") X;
		Standard_Real X ();

		/****************** XYZ ******************/
		%feature("compactdefaultargs") XYZ;
		%feature("autodoc", "* For this vector, returns - its three coordinates as a number triple
	:rtype: gp_XYZ") XYZ;
		const gp_XYZ  XYZ ();

		/****************** Y ******************/
		%feature("compactdefaultargs") Y;
		%feature("autodoc", "* For this vector, returns its Y coordinate.
	:rtype: float") Y;
		Standard_Real Y ();

		/****************** Z ******************/
		%feature("compactdefaultargs") Z;
		%feature("autodoc", "* For this vector, returns its Z coordinate.
	:rtype: float") Z;
		Standard_Real Z ();

		/****************** gp_Vec ******************/
		%feature("compactdefaultargs") gp_Vec;
		%feature("autodoc", "* Creates a zero vector.
	:rtype: None") gp_Vec;
		 gp_Vec ();

		/****************** gp_Vec ******************/
		%feature("compactdefaultargs") gp_Vec;
		%feature("autodoc", "* Creates a unitary vector from a direction V.
	:param V:
	:type V: gp_Dir
	:rtype: None") gp_Vec;
		 gp_Vec (const gp_Dir & V);

		/****************** gp_Vec ******************/
		%feature("compactdefaultargs") gp_Vec;
		%feature("autodoc", "* Creates a vector with a triplet of coordinates.
	:param Coord:
	:type Coord: gp_XYZ
	:rtype: None") gp_Vec;
		 gp_Vec (const gp_XYZ & Coord);

		/****************** gp_Vec ******************/
		%feature("compactdefaultargs") gp_Vec;
		%feature("autodoc", "* Creates a point with its three cartesian coordinates.
	:param Xv:
	:type Xv: float
	:param Yv:
	:type Yv: float
	:param Zv:
	:type Zv: float
	:rtype: None") gp_Vec;
		 gp_Vec (const Standard_Real Xv,const Standard_Real Yv,const Standard_Real Zv);

		/****************** gp_Vec ******************/
		%feature("compactdefaultargs") gp_Vec;
		%feature("autodoc", "* Creates a vector from two points. The length of the vector is the distance between P1 and P2
	:param P1:
	:type P1: gp_Pnt
	:param P2:
	:type P2: gp_Pnt
	:rtype: None") gp_Vec;
		 gp_Vec (const gp_Pnt & P1,const gp_Pnt & P2);

		/****************** operator * ******************/
		%feature("compactdefaultargs") operator *;
		%feature("autodoc", ":param Scalar:
	:type Scalar: float
	:rtype: Standard_NODISCARD gp_Vec") operator *;
		Standard_NODISCARD gp_Vec operator * (const Standard_Real Scalar);

		/****************** operator * ******************/
		%feature("compactdefaultargs") operator *;
		%feature("autodoc", ":param Other:
	:type Other: gp_Vec
	:rtype: float") operator *;
		Standard_Real operator * (const gp_Vec & Other);


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
		%feature("autodoc", ":param Other:
	:type Other: gp_Vec
	:rtype: Standard_NODISCARD gp_Vec") operator +;
		Standard_NODISCARD gp_Vec operator + (const gp_Vec & Other);


        %extend{
            void __iadd_wrapper__(const gp_Vec  other) {
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
		%feature("autodoc", ":param Right:
	:type Right: gp_Vec
	:rtype: Standard_NODISCARD gp_Vec") operator -;
		Standard_NODISCARD gp_Vec operator - (const gp_Vec & Right);

		/****************** operator - ******************/
		%feature("compactdefaultargs") operator -;
		%feature("autodoc", ":rtype: Standard_NODISCARD gp_Vec") operator -;
		Standard_NODISCARD gp_Vec operator - ();


        %extend{
            void __isub_wrapper__(const gp_Vec  other) {
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
		%feature("autodoc", ":param Scalar:
	:type Scalar: float
	:rtype: Standard_NODISCARD gp_Vec") operator /;
		Standard_NODISCARD gp_Vec operator / (const Standard_Real Scalar);


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
%nodefaultctor gp_Vec2d;
class gp_Vec2d {
	public:
		/****************** Add ******************/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", ":param Other:
	:type Other: gp_Vec2d
	:rtype: None") Add;
		void Add (const gp_Vec2d & Other);

		/****************** Added ******************/
		%feature("compactdefaultargs") Added;
		%feature("autodoc", "* Adds two vectors
	:param Other:
	:type Other: gp_Vec2d
	:rtype: Standard_NODISCARD gp_Vec2d") Added;
		Standard_NODISCARD gp_Vec2d Added (const gp_Vec2d & Other);

		/****************** Angle ******************/
		%feature("compactdefaultargs") Angle;
		%feature("autodoc", "* Computes the angular value between <self> and <Other> returns the angle value between -PI and PI in radian. The orientation is from <self> to Other. The positive sense is the trigonometric sense. Raises VectorWithNullMagnitude if <self>.Magnitude() <= Resolution from gp or Other.Magnitude() <= Resolution because the angular value is indefinite if one of the vectors has a null magnitude.
	:param Other:
	:type Other: gp_Vec2d
	:rtype: float") Angle;
		Standard_Real Angle (const gp_Vec2d & Other);

		/****************** Coord ******************/
		%feature("compactdefaultargs") Coord;
		%feature("autodoc", "* Returns the coordinate of range Index : Index = 1 => X is returned Index = 2 => Y is returned Raised if Index != {1, 2}.
	:param Index:
	:type Index: int
	:rtype: float") Coord;
		Standard_Real Coord (const Standard_Integer Index);

		/****************** Coord ******************/
		%feature("compactdefaultargs") Coord;
		%feature("autodoc", "* For this vector, returns its two coordinates Xv and Yv
	:param Xv:
	:type Xv: float &
	:param Yv:
	:type Yv: float &
	:rtype: None") Coord;
		void Coord (Standard_Real &OutValue,Standard_Real &OutValue);

		/****************** CrossMagnitude ******************/
		%feature("compactdefaultargs") CrossMagnitude;
		%feature("autodoc", "* Computes the magnitude of the cross product between <self> and Right. Returns || <self> ^ Right ||
	:param Right:
	:type Right: gp_Vec2d
	:rtype: float") CrossMagnitude;
		Standard_Real CrossMagnitude (const gp_Vec2d & Right);

		/****************** CrossSquareMagnitude ******************/
		%feature("compactdefaultargs") CrossSquareMagnitude;
		%feature("autodoc", "* Computes the square magnitude of the cross product between <self> and Right. Returns || <self> ^ Right ||**2
	:param Right:
	:type Right: gp_Vec2d
	:rtype: float") CrossSquareMagnitude;
		Standard_Real CrossSquareMagnitude (const gp_Vec2d & Right);

		/****************** Crossed ******************/
		%feature("compactdefaultargs") Crossed;
		%feature("autodoc", "* Computes the crossing product between two vectors
	:param Right:
	:type Right: gp_Vec2d
	:rtype: Standard_NODISCARD float") Crossed;
		Standard_NODISCARD Standard_Real Crossed (const gp_Vec2d & Right);

		/****************** Divide ******************/
		%feature("compactdefaultargs") Divide;
		%feature("autodoc", ":param Scalar:
	:type Scalar: float
	:rtype: None") Divide;
		void Divide (const Standard_Real Scalar);

		/****************** Divided ******************/
		%feature("compactdefaultargs") Divided;
		%feature("autodoc", "* divides a vector by a scalar
	:param Scalar:
	:type Scalar: float
	:rtype: Standard_NODISCARD gp_Vec2d") Divided;
		Standard_NODISCARD gp_Vec2d Divided (const Standard_Real Scalar);

		/****************** Dot ******************/
		%feature("compactdefaultargs") Dot;
		%feature("autodoc", "* Computes the scalar product
	:param Other:
	:type Other: gp_Vec2d
	:rtype: float") Dot;
		Standard_Real Dot (const gp_Vec2d & Other);

		/****************** GetNormal ******************/
		%feature("compactdefaultargs") GetNormal;
		%feature("autodoc", ":rtype: gp_Vec2d") GetNormal;
		gp_Vec2d GetNormal ();

		/****************** IsEqual ******************/
		%feature("compactdefaultargs") IsEqual;
		%feature("autodoc", "* Returns True if the two vectors have the same magnitude value and the same direction. The precision values are LinearTolerance for the magnitude and AngularTolerance for the direction.
	:param Other:
	:type Other: gp_Vec2d
	:param LinearTolerance:
	:type LinearTolerance: float
	:param AngularTolerance:
	:type AngularTolerance: float
	:rtype: bool") IsEqual;
		Standard_Boolean IsEqual (const gp_Vec2d & Other,const Standard_Real LinearTolerance,const Standard_Real AngularTolerance);

		/****************** IsNormal ******************/
		%feature("compactdefaultargs") IsNormal;
		%feature("autodoc", "* Returns True if abs(Abs(<self>.Angle(Other)) - PI/2.) <= AngularTolerance Raises VectorWithNullMagnitude if <self>.Magnitude() <= Resolution or Other.Magnitude() <= Resolution from gp.
	:param Other:
	:type Other: gp_Vec2d
	:param AngularTolerance:
	:type AngularTolerance: float
	:rtype: bool") IsNormal;
		Standard_Boolean IsNormal (const gp_Vec2d & Other,const Standard_Real AngularTolerance);

		/****************** IsOpposite ******************/
		%feature("compactdefaultargs") IsOpposite;
		%feature("autodoc", "* Returns True if PI - Abs(<self>.Angle(Other)) <= AngularTolerance Raises VectorWithNullMagnitude if <self>.Magnitude() <= Resolution or Other.Magnitude() <= Resolution from gp.
	:param Other:
	:type Other: gp_Vec2d
	:param AngularTolerance:
	:type AngularTolerance: float
	:rtype: bool") IsOpposite;
		Standard_Boolean IsOpposite (const gp_Vec2d & Other,const Standard_Real AngularTolerance);

		/****************** IsParallel ******************/
		%feature("compactdefaultargs") IsParallel;
		%feature("autodoc", "* Returns true if Abs(Angle(<self>, Other)) <= AngularTolerance or PI - Abs(Angle(<self>, Other)) <= AngularTolerance Two vectors with opposite directions are considered as parallel. Raises VectorWithNullMagnitude if <self>.Magnitude() <= Resolution or Other.Magnitude() <= Resolution from gp
	:param Other:
	:type Other: gp_Vec2d
	:param AngularTolerance:
	:type AngularTolerance: float
	:rtype: bool") IsParallel;
		Standard_Boolean IsParallel (const gp_Vec2d & Other,const Standard_Real AngularTolerance);

		/****************** Magnitude ******************/
		%feature("compactdefaultargs") Magnitude;
		%feature("autodoc", "* Computes the magnitude of this vector.
	:rtype: float") Magnitude;
		Standard_Real Magnitude ();

		/****************** Mirror ******************/
		%feature("compactdefaultargs") Mirror;
		%feature("autodoc", "* Performs the symmetrical transformation of a vector with respect to the vector V which is the center of the symmetry.
	:param V:
	:type V: gp_Vec2d
	:rtype: None") Mirror;
		void Mirror (const gp_Vec2d & V);

		/****************** Mirror ******************/
		%feature("compactdefaultargs") Mirror;
		%feature("autodoc", "* Performs the symmetrical transformation of a vector with respect to an axis placement which is the axis of the symmetry.
	:param A1:
	:type A1: gp_Ax2d
	:rtype: None") Mirror;
		void Mirror (const gp_Ax2d & A1);

		/****************** Mirrored ******************/
		%feature("compactdefaultargs") Mirrored;
		%feature("autodoc", "* Performs the symmetrical transformation of a vector with respect to the vector V which is the center of the symmetry.
	:param V:
	:type V: gp_Vec2d
	:rtype: Standard_NODISCARD gp_Vec2d") Mirrored;
		Standard_NODISCARD gp_Vec2d Mirrored (const gp_Vec2d & V);

		/****************** Mirrored ******************/
		%feature("compactdefaultargs") Mirrored;
		%feature("autodoc", "* Performs the symmetrical transformation of a vector with respect to an axis placement which is the axis of the symmetry.
	:param A1:
	:type A1: gp_Ax2d
	:rtype: Standard_NODISCARD gp_Vec2d") Mirrored;
		Standard_NODISCARD gp_Vec2d Mirrored (const gp_Ax2d & A1);

		/****************** Multiplied ******************/
		%feature("compactdefaultargs") Multiplied;
		%feature("autodoc", "* Normalizes a vector Raises an exception if the magnitude of the vector is lower or equal to Resolution from package gp.
	:param Scalar:
	:type Scalar: float
	:rtype: Standard_NODISCARD gp_Vec2d") Multiplied;
		Standard_NODISCARD gp_Vec2d Multiplied (const Standard_Real Scalar);

		/****************** Multiply ******************/
		%feature("compactdefaultargs") Multiply;
		%feature("autodoc", ":param Scalar:
	:type Scalar: float
	:rtype: None") Multiply;
		void Multiply (const Standard_Real Scalar);

		/****************** Normalize ******************/
		%feature("compactdefaultargs") Normalize;
		%feature("autodoc", ":rtype: None") Normalize;
		void Normalize ();

		/****************** Normalized ******************/
		%feature("compactdefaultargs") Normalized;
		%feature("autodoc", "* Normalizes a vector Raises an exception if the magnitude of the vector is lower or equal to Resolution from package gp. Reverses the direction of a vector
	:rtype: Standard_NODISCARD gp_Vec2d") Normalized;
		Standard_NODISCARD gp_Vec2d Normalized ();

		/****************** Reverse ******************/
		%feature("compactdefaultargs") Reverse;
		%feature("autodoc", ":rtype: None") Reverse;
		void Reverse ();

		/****************** Reversed ******************/
		%feature("compactdefaultargs") Reversed;
		%feature("autodoc", "* Reverses the direction of a vector
	:rtype: Standard_NODISCARD gp_Vec2d") Reversed;
		Standard_NODISCARD gp_Vec2d Reversed ();

		/****************** Rotate ******************/
		%feature("compactdefaultargs") Rotate;
		%feature("autodoc", ":param Ang:
	:type Ang: float
	:rtype: None") Rotate;
		void Rotate (const Standard_Real Ang);

		/****************** Rotated ******************/
		%feature("compactdefaultargs") Rotated;
		%feature("autodoc", "* Rotates a vector. Ang is the angular value of the rotation in radians.
	:param Ang:
	:type Ang: float
	:rtype: Standard_NODISCARD gp_Vec2d") Rotated;
		Standard_NODISCARD gp_Vec2d Rotated (const Standard_Real Ang);

		/****************** Scale ******************/
		%feature("compactdefaultargs") Scale;
		%feature("autodoc", ":param S:
	:type S: float
	:rtype: None") Scale;
		void Scale (const Standard_Real S);

		/****************** Scaled ******************/
		%feature("compactdefaultargs") Scaled;
		%feature("autodoc", "* Scales a vector. S is the scaling value.
	:param S:
	:type S: float
	:rtype: Standard_NODISCARD gp_Vec2d") Scaled;
		Standard_NODISCARD gp_Vec2d Scaled (const Standard_Real S);

		/****************** SetCoord ******************/
		%feature("compactdefaultargs") SetCoord;
		%feature("autodoc", "* Changes the coordinate of range Index Index = 1 => X is modified Index = 2 => Y is modified Raises OutOfRange if Index != {1, 2}.
	:param Index:
	:type Index: int
	:param Xi:
	:type Xi: float
	:rtype: None") SetCoord;
		void SetCoord (const Standard_Integer Index,const Standard_Real Xi);

		/****************** SetCoord ******************/
		%feature("compactdefaultargs") SetCoord;
		%feature("autodoc", "* For this vector, assigns the values Xv and Yv to its two coordinates
	:param Xv:
	:type Xv: float
	:param Yv:
	:type Yv: float
	:rtype: None") SetCoord;
		void SetCoord (const Standard_Real Xv,const Standard_Real Yv);

		/****************** SetLinearForm ******************/
		%feature("compactdefaultargs") SetLinearForm;
		%feature("autodoc", "* <self> is set to the following linear form : A1 * V1 + A2 * V2 + V3
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
	:rtype: None") SetLinearForm;
		void SetLinearForm (const Standard_Real A1,const gp_Vec2d & V1,const Standard_Real A2,const gp_Vec2d & V2,const gp_Vec2d & V3);

		/****************** SetLinearForm ******************/
		%feature("compactdefaultargs") SetLinearForm;
		%feature("autodoc", "* <self> is set to the following linear form : A1 * V1 + A2 * V2
	:param A1:
	:type A1: float
	:param V1:
	:type V1: gp_Vec2d
	:param A2:
	:type A2: float
	:param V2:
	:type V2: gp_Vec2d
	:rtype: None") SetLinearForm;
		void SetLinearForm (const Standard_Real A1,const gp_Vec2d & V1,const Standard_Real A2,const gp_Vec2d & V2);

		/****************** SetLinearForm ******************/
		%feature("compactdefaultargs") SetLinearForm;
		%feature("autodoc", "* <self> is set to the following linear form : A1 * V1 + V2
	:param A1:
	:type A1: float
	:param V1:
	:type V1: gp_Vec2d
	:param V2:
	:type V2: gp_Vec2d
	:rtype: None") SetLinearForm;
		void SetLinearForm (const Standard_Real A1,const gp_Vec2d & V1,const gp_Vec2d & V2);

		/****************** SetLinearForm ******************/
		%feature("compactdefaultargs") SetLinearForm;
		%feature("autodoc", "* <self> is set to the following linear form : Left + Right
	:param Left:
	:type Left: gp_Vec2d
	:param Right:
	:type Right: gp_Vec2d
	:rtype: None") SetLinearForm;
		void SetLinearForm (const gp_Vec2d & Left,const gp_Vec2d & Right);

		/****************** SetX ******************/
		%feature("compactdefaultargs") SetX;
		%feature("autodoc", "* Assigns the given value to the X coordinate of this vector.
	:param X:
	:type X: float
	:rtype: None") SetX;
		void SetX (const Standard_Real X);

		/****************** SetXY ******************/
		%feature("compactdefaultargs") SetXY;
		%feature("autodoc", "* Assigns the two coordinates of Coord to this vector.
	:param Coord:
	:type Coord: gp_XY
	:rtype: None") SetXY;
		void SetXY (const gp_XY & Coord);

		/****************** SetY ******************/
		%feature("compactdefaultargs") SetY;
		%feature("autodoc", "* Assigns the given value to the Y coordinate of this vector.
	:param Y:
	:type Y: float
	:rtype: None") SetY;
		void SetY (const Standard_Real Y);

		/****************** SquareMagnitude ******************/
		%feature("compactdefaultargs") SquareMagnitude;
		%feature("autodoc", "* Computes the square magnitude of this vector.
	:rtype: float") SquareMagnitude;
		Standard_Real SquareMagnitude ();

		/****************** Subtract ******************/
		%feature("compactdefaultargs") Subtract;
		%feature("autodoc", "* Subtracts two vectors
	:param Right:
	:type Right: gp_Vec2d
	:rtype: None") Subtract;
		void Subtract (const gp_Vec2d & Right);

		/****************** Subtracted ******************/
		%feature("compactdefaultargs") Subtracted;
		%feature("autodoc", "* Subtracts two vectors
	:param Right:
	:type Right: gp_Vec2d
	:rtype: Standard_NODISCARD gp_Vec2d") Subtracted;
		Standard_NODISCARD gp_Vec2d Subtracted (const gp_Vec2d & Right);

		/****************** Transform ******************/
		%feature("compactdefaultargs") Transform;
		%feature("autodoc", ":param T:
	:type T: gp_Trsf2d
	:rtype: None") Transform;
		void Transform (const gp_Trsf2d & T);

		/****************** Transformed ******************/
		%feature("compactdefaultargs") Transformed;
		%feature("autodoc", "* Transforms a vector with a Trsf from gp.
	:param T:
	:type T: gp_Trsf2d
	:rtype: Standard_NODISCARD gp_Vec2d") Transformed;
		Standard_NODISCARD gp_Vec2d Transformed (const gp_Trsf2d & T);

		/****************** X ******************/
		%feature("compactdefaultargs") X;
		%feature("autodoc", "* For this vector, returns its X coordinate.
	:rtype: float") X;
		Standard_Real X ();

		/****************** XY ******************/
		%feature("compactdefaultargs") XY;
		%feature("autodoc", "* For this vector, returns its two coordinates as a number pair
	:rtype: gp_XY") XY;
		const gp_XY  XY ();

		/****************** Y ******************/
		%feature("compactdefaultargs") Y;
		%feature("autodoc", "* For this vector, returns its Y coordinate.
	:rtype: float") Y;
		Standard_Real Y ();

		/****************** gp_Vec2d ******************/
		%feature("compactdefaultargs") gp_Vec2d;
		%feature("autodoc", "* Creates a zero vector.
	:rtype: None") gp_Vec2d;
		 gp_Vec2d ();

		/****************** gp_Vec2d ******************/
		%feature("compactdefaultargs") gp_Vec2d;
		%feature("autodoc", "* Creates a unitary vector from a direction V.
	:param V:
	:type V: gp_Dir2d
	:rtype: None") gp_Vec2d;
		 gp_Vec2d (const gp_Dir2d & V);

		/****************** gp_Vec2d ******************/
		%feature("compactdefaultargs") gp_Vec2d;
		%feature("autodoc", "* Creates a vector with a doublet of coordinates.
	:param Coord:
	:type Coord: gp_XY
	:rtype: None") gp_Vec2d;
		 gp_Vec2d (const gp_XY & Coord);

		/****************** gp_Vec2d ******************/
		%feature("compactdefaultargs") gp_Vec2d;
		%feature("autodoc", "* Creates a point with its two Cartesian coordinates.
	:param Xv:
	:type Xv: float
	:param Yv:
	:type Yv: float
	:rtype: None") gp_Vec2d;
		 gp_Vec2d (const Standard_Real Xv,const Standard_Real Yv);

		/****************** gp_Vec2d ******************/
		%feature("compactdefaultargs") gp_Vec2d;
		%feature("autodoc", "* Creates a vector from two points. The length of the vector is the distance between P1 and P2
	:param P1:
	:type P1: gp_Pnt2d
	:param P2:
	:type P2: gp_Pnt2d
	:rtype: None") gp_Vec2d;
		 gp_Vec2d (const gp_Pnt2d & P1,const gp_Pnt2d & P2);

		/****************** operator * ******************/
		%feature("compactdefaultargs") operator *;
		%feature("autodoc", ":param Other:
	:type Other: gp_Vec2d
	:rtype: float") operator *;
		Standard_Real operator * (const gp_Vec2d & Other);

		/****************** operator * ******************/
		%feature("compactdefaultargs") operator *;
		%feature("autodoc", ":param Scalar:
	:type Scalar: float
	:rtype: Standard_NODISCARD gp_Vec2d") operator *;
		Standard_NODISCARD gp_Vec2d operator * (const Standard_Real Scalar);


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
		%feature("autodoc", ":param Other:
	:type Other: gp_Vec2d
	:rtype: Standard_NODISCARD gp_Vec2d") operator +;
		Standard_NODISCARD gp_Vec2d operator + (const gp_Vec2d & Other);


        %extend{
            void __iadd_wrapper__(const gp_Vec2d  other) {
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
		%feature("autodoc", ":rtype: Standard_NODISCARD gp_Vec2d") operator -;
		Standard_NODISCARD gp_Vec2d operator - ();

		/****************** operator - ******************/
		%feature("compactdefaultargs") operator -;
		%feature("autodoc", ":param Right:
	:type Right: gp_Vec2d
	:rtype: Standard_NODISCARD gp_Vec2d") operator -;
		Standard_NODISCARD gp_Vec2d operator - (const gp_Vec2d & Right);


        %extend{
            void __isub_wrapper__(const gp_Vec2d  other) {
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
		%feature("autodoc", ":param Scalar:
	:type Scalar: float
	:rtype: Standard_NODISCARD gp_Vec2d") operator /;
		Standard_NODISCARD gp_Vec2d operator / (const Standard_Real Scalar);


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
%nodefaultctor gp_XY;
class gp_XY {
	public:
		/****************** Add ******************/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "* Computes the sum of this number pair and number pair Other <self>.X() = <self>.X() + Other.X() <self>.Y() = <self>.Y() + Other.Y()
	:param Other:
	:type Other: gp_XY
	:rtype: None") Add;
		void Add (const gp_XY & Other);

		/****************** Added ******************/
		%feature("compactdefaultargs") Added;
		%feature("autodoc", "* Computes the sum of this number pair and number pair Other new.X() = <self>.X() + Other.X() new.Y() = <self>.Y() + Other.Y()
	:param Other:
	:type Other: gp_XY
	:rtype: Standard_NODISCARD gp_XY") Added;
		Standard_NODISCARD gp_XY Added (const gp_XY & Other);


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
		%feature("autodoc", "* returns the coordinate of range Index : Index = 1 => X is returned Index = 2 => Y is returned Raises OutOfRange if Index != {1, 2}.
	:param Index:
	:type Index: int
	:rtype: float") Coord;
		Standard_Real Coord (const Standard_Integer Index);

		/****************** Coord ******************/
		%feature("compactdefaultargs") Coord;
		%feature("autodoc", "* For this number pair, returns its coordinates X and Y.
	:param X:
	:type X: float &
	:param Y:
	:type Y: float &
	:rtype: None") Coord;
		void Coord (Standard_Real &OutValue,Standard_Real &OutValue);

		/****************** CrossMagnitude ******************/
		%feature("compactdefaultargs") CrossMagnitude;
		%feature("autodoc", "* computes the magnitude of the cross product between <self> and Right. Returns || <self> ^ Right ||
	:param Right:
	:type Right: gp_XY
	:rtype: float") CrossMagnitude;
		Standard_Real CrossMagnitude (const gp_XY & Right);

		/****************** CrossSquareMagnitude ******************/
		%feature("compactdefaultargs") CrossSquareMagnitude;
		%feature("autodoc", "* computes the square magnitude of the cross product between <self> and Right. Returns || <self> ^ Right ||**2
	:param Right:
	:type Right: gp_XY
	:rtype: float") CrossSquareMagnitude;
		Standard_Real CrossSquareMagnitude (const gp_XY & Right);

		/****************** Crossed ******************/
		%feature("compactdefaultargs") Crossed;
		%feature("autodoc", "* Real D = <self>.X() * Other.Y() - <self>.Y() * Other.X()
	:param Right:
	:type Right: gp_XY
	:rtype: Standard_NODISCARD float") Crossed;
		Standard_NODISCARD Standard_Real Crossed (const gp_XY & Right);

		/****************** Divide ******************/
		%feature("compactdefaultargs") Divide;
		%feature("autodoc", "* divides <self> by a real.
	:param Scalar:
	:type Scalar: float
	:rtype: None") Divide;
		void Divide (const Standard_Real Scalar);

		/****************** Divided ******************/
		%feature("compactdefaultargs") Divided;
		%feature("autodoc", "* Divides <self> by a real.
	:param Scalar:
	:type Scalar: float
	:rtype: Standard_NODISCARD gp_XY") Divided;
		Standard_NODISCARD gp_XY Divided (const Standard_Real Scalar);

		/****************** Dot ******************/
		%feature("compactdefaultargs") Dot;
		%feature("autodoc", "* Computes the scalar product between <self> and Other
	:param Other:
	:type Other: gp_XY
	:rtype: float") Dot;
		Standard_Real Dot (const gp_XY & Other);

		/****************** IsEqual ******************/
		%feature("compactdefaultargs") IsEqual;
		%feature("autodoc", "* Returns true if the coordinates of this number pair are equal to the respective coordinates of the number pair Other, within the specified tolerance Tolerance. I.e.: abs(<self>.X() - Other.X()) <= Tolerance and abs(<self>.Y() - Other.Y()) <= Tolerance and computations
	:param Other:
	:type Other: gp_XY
	:param Tolerance:
	:type Tolerance: float
	:rtype: bool") IsEqual;
		Standard_Boolean IsEqual (const gp_XY & Other,const Standard_Real Tolerance);

		/****************** Modulus ******************/
		%feature("compactdefaultargs") Modulus;
		%feature("autodoc", "* Computes Sqrt (X*X + Y*Y) where X and Y are the two coordinates of this number pair.
	:rtype: float") Modulus;
		Standard_Real Modulus ();

		/****************** Multiplied ******************/
		%feature("compactdefaultargs") Multiplied;
		%feature("autodoc", "* New.X() = <self>.X() * Scalar; New.Y() = <self>.Y() * Scalar;
	:param Scalar:
	:type Scalar: float
	:rtype: Standard_NODISCARD gp_XY") Multiplied;
		Standard_NODISCARD gp_XY Multiplied (const Standard_Real Scalar);

		/****************** Multiplied ******************/
		%feature("compactdefaultargs") Multiplied;
		%feature("autodoc", "* new.X() = <self>.X() * Other.X(); new.Y() = <self>.Y() * Other.Y();
	:param Other:
	:type Other: gp_XY
	:rtype: Standard_NODISCARD gp_XY") Multiplied;
		Standard_NODISCARD gp_XY Multiplied (const gp_XY & Other);

		/****************** Multiplied ******************/
		%feature("compactdefaultargs") Multiplied;
		%feature("autodoc", "* New = Matrix * <self>
	:param Matrix:
	:type Matrix: gp_Mat2d
	:rtype: Standard_NODISCARD gp_XY") Multiplied;
		Standard_NODISCARD gp_XY Multiplied (const gp_Mat2d & Matrix);

		/****************** Multiply ******************/
		%feature("compactdefaultargs") Multiply;
		%feature("autodoc", "* <self>.X() = <self>.X() * Scalar; <self>.Y() = <self>.Y() * Scalar;
	:param Scalar:
	:type Scalar: float
	:rtype: None") Multiply;
		void Multiply (const Standard_Real Scalar);

		/****************** Multiply ******************/
		%feature("compactdefaultargs") Multiply;
		%feature("autodoc", "* <self>.X() = <self>.X() * Other.X(); <self>.Y() = <self>.Y() * Other.Y();
	:param Other:
	:type Other: gp_XY
	:rtype: None") Multiply;
		void Multiply (const gp_XY & Other);

		/****************** Multiply ******************/
		%feature("compactdefaultargs") Multiply;
		%feature("autodoc", "* <self> = Matrix * <self>
	:param Matrix:
	:type Matrix: gp_Mat2d
	:rtype: None") Multiply;
		void Multiply (const gp_Mat2d & Matrix);

		/****************** Normalize ******************/
		%feature("compactdefaultargs") Normalize;
		%feature("autodoc", "* <self>.X() = <self>.X()/ <self>.Modulus() <self>.Y() = <self>.Y()/ <self>.Modulus() Raises ConstructionError if <self>.Modulus() <= Resolution from gp
	:rtype: None") Normalize;
		void Normalize ();

		/****************** Normalized ******************/
		%feature("compactdefaultargs") Normalized;
		%feature("autodoc", "* New.X() = <self>.X()/ <self>.Modulus() New.Y() = <self>.Y()/ <self>.Modulus() Raises ConstructionError if <self>.Modulus() <= Resolution from gp
	:rtype: Standard_NODISCARD gp_XY") Normalized;
		Standard_NODISCARD gp_XY Normalized ();

		/****************** Reverse ******************/
		%feature("compactdefaultargs") Reverse;
		%feature("autodoc", "* <self>.X() = -<self>.X() <self>.Y() = -<self>.Y()
	:rtype: None") Reverse;
		void Reverse ();

		/****************** Reversed ******************/
		%feature("compactdefaultargs") Reversed;
		%feature("autodoc", "* New.X() = -<self>.X() New.Y() = -<self>.Y()
	:rtype: Standard_NODISCARD gp_XY") Reversed;
		Standard_NODISCARD gp_XY Reversed ();

		/****************** SetCoord ******************/
		%feature("compactdefaultargs") SetCoord;
		%feature("autodoc", "* modifies the coordinate of range Index Index = 1 => X is modified Index = 2 => Y is modified Raises OutOfRange if Index != {1, 2}.
	:param Index:
	:type Index: int
	:param Xi:
	:type Xi: float
	:rtype: None") SetCoord;
		void SetCoord (const Standard_Integer Index,const Standard_Real Xi);

		/****************** SetCoord ******************/
		%feature("compactdefaultargs") SetCoord;
		%feature("autodoc", "* For this number pair, assigns the values X and Y to its coordinates
	:param X:
	:type X: float
	:param Y:
	:type Y: float
	:rtype: None") SetCoord;
		void SetCoord (const Standard_Real X,const Standard_Real Y);

		/****************** SetLinearForm ******************/
		%feature("compactdefaultargs") SetLinearForm;
		%feature("autodoc", "* Computes the following linear combination and assigns the result to this number pair: A1 * XY1 + A2 * XY2
	:param A1:
	:type A1: float
	:param XY1:
	:type XY1: gp_XY
	:param A2:
	:type A2: float
	:param XY2:
	:type XY2: gp_XY
	:rtype: None") SetLinearForm;
		void SetLinearForm (const Standard_Real A1,const gp_XY & XY1,const Standard_Real A2,const gp_XY & XY2);

		/****************** SetLinearForm ******************/
		%feature("compactdefaultargs") SetLinearForm;
		%feature("autodoc", "* -- Computes the following linear combination and assigns the result to this number pair: A1 * XY1 + A2 * XY2 + XY3
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
	:rtype: None") SetLinearForm;
		void SetLinearForm (const Standard_Real A1,const gp_XY & XY1,const Standard_Real A2,const gp_XY & XY2,const gp_XY & XY3);

		/****************** SetLinearForm ******************/
		%feature("compactdefaultargs") SetLinearForm;
		%feature("autodoc", "* Computes the following linear combination and assigns the result to this number pair: A1 * XY1 + XY2
	:param A1:
	:type A1: float
	:param XY1:
	:type XY1: gp_XY
	:param XY2:
	:type XY2: gp_XY
	:rtype: None") SetLinearForm;
		void SetLinearForm (const Standard_Real A1,const gp_XY & XY1,const gp_XY & XY2);

		/****************** SetLinearForm ******************/
		%feature("compactdefaultargs") SetLinearForm;
		%feature("autodoc", "* Computes the following linear combination and assigns the result to this number pair: XY1 + XY2
	:param XY1:
	:type XY1: gp_XY
	:param XY2:
	:type XY2: gp_XY
	:rtype: None") SetLinearForm;
		void SetLinearForm (const gp_XY & XY1,const gp_XY & XY2);

		/****************** SetX ******************/
		%feature("compactdefaultargs") SetX;
		%feature("autodoc", "* Assigns the given value to the X coordinate of this number pair.
	:param X:
	:type X: float
	:rtype: None") SetX;
		void SetX (const Standard_Real X);

		/****************** SetY ******************/
		%feature("compactdefaultargs") SetY;
		%feature("autodoc", "* Assigns the given value to the Y coordinate of this number pair.
	:param Y:
	:type Y: float
	:rtype: None") SetY;
		void SetY (const Standard_Real Y);

		/****************** SquareModulus ******************/
		%feature("compactdefaultargs") SquareModulus;
		%feature("autodoc", "* Computes X*X + Y*Y where X and Y are the two coordinates of this number pair.
	:rtype: float") SquareModulus;
		Standard_Real SquareModulus ();

		/****************** Subtract ******************/
		%feature("compactdefaultargs") Subtract;
		%feature("autodoc", "* <self>.X() = <self>.X() - Other.X() <self>.Y() = <self>.Y() - Other.Y()
	:param Right:
	:type Right: gp_XY
	:rtype: None") Subtract;
		void Subtract (const gp_XY & Right);

		/****************** Subtracted ******************/
		%feature("compactdefaultargs") Subtracted;
		%feature("autodoc", "* new.X() = <self>.X() - Other.X() new.Y() = <self>.Y() - Other.Y()
	:param Right:
	:type Right: gp_XY
	:rtype: Standard_NODISCARD gp_XY") Subtracted;
		Standard_NODISCARD gp_XY Subtracted (const gp_XY & Right);

		/****************** X ******************/
		%feature("compactdefaultargs") X;
		%feature("autodoc", "* Returns the X coordinate of this number pair.
	:rtype: float") X;
		Standard_Real X ();

		/****************** Y ******************/
		%feature("compactdefaultargs") Y;
		%feature("autodoc", "* Returns the Y coordinate of this number pair.
	:rtype: float") Y;
		Standard_Real Y ();

		/****************** gp_XY ******************/
		%feature("compactdefaultargs") gp_XY;
		%feature("autodoc", "* Creates XY object with zero coordinates (0,0).
	:rtype: None") gp_XY;
		 gp_XY ();

		/****************** gp_XY ******************/
		%feature("compactdefaultargs") gp_XY;
		%feature("autodoc", "* a number pair defined by the XY coordinates
	:param X:
	:type X: float
	:param Y:
	:type Y: float
	:rtype: None") gp_XY;
		 gp_XY (const Standard_Real X,const Standard_Real Y);

		/****************** operator * ******************/
		%feature("compactdefaultargs") operator *;
		%feature("autodoc", ":param Other:
	:type Other: gp_XY
	:rtype: float") operator *;
		Standard_Real operator * (const gp_XY & Other);

		/****************** operator * ******************/
		%feature("compactdefaultargs") operator *;
		%feature("autodoc", ":param Scalar:
	:type Scalar: float
	:rtype: Standard_NODISCARD gp_XY") operator *;
		Standard_NODISCARD gp_XY operator * (const Standard_Real Scalar);

		/****************** operator * ******************/
		%feature("compactdefaultargs") operator *;
		%feature("autodoc", ":param Matrix:
	:type Matrix: gp_Mat2d
	:rtype: Standard_NODISCARD gp_XY") operator *;
		Standard_NODISCARD gp_XY operator * (const gp_Mat2d & Matrix);


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
            void __imul_wrapper__(const gp_XY  other) {
            *self *= other;
            }
        }
        %pythoncode {
        def __imul__(self, right):
            self.__imul_wrapper__(right)
            return self
        }
        
        %extend{
            void __imul_wrapper__(const gp_Mat2d  other) {
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
		%feature("autodoc", ":param Other:
	:type Other: gp_XY
	:rtype: Standard_NODISCARD gp_XY") operator +;
		Standard_NODISCARD gp_XY operator + (const gp_XY & Other);


        %extend{
            void __iadd_wrapper__(const gp_XY  other) {
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
		%feature("autodoc", ":rtype: Standard_NODISCARD gp_XY") operator -;
		Standard_NODISCARD gp_XY operator - ();

		/****************** operator - ******************/
		%feature("compactdefaultargs") operator -;
		%feature("autodoc", ":param Right:
	:type Right: gp_XY
	:rtype: Standard_NODISCARD gp_XY") operator -;
		Standard_NODISCARD gp_XY operator - (const gp_XY & Right);


        %extend{
            void __isub_wrapper__(const gp_XY  other) {
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
		%feature("autodoc", ":param Scalar:
	:type Scalar: float
	:rtype: Standard_NODISCARD gp_XY") operator /;
		Standard_NODISCARD gp_XY operator / (const Standard_Real Scalar);


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
%nodefaultctor gp_XYZ;
class gp_XYZ {
	public:
		/****************** Add ******************/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "* <self>.X() = <self>.X() + Other.X() <self>.Y() = <self>.Y() + Other.Y() <self>.Z() = <self>.Z() + Other.Z()
	:param Other:
	:type Other: gp_XYZ
	:rtype: None") Add;
		void Add (const gp_XYZ & Other);

		/****************** Added ******************/
		%feature("compactdefaultargs") Added;
		%feature("autodoc", "* new.X() = <self>.X() + Other.X() new.Y() = <self>.Y() + Other.Y() new.Z() = <self>.Z() + Other.Z()
	:param Other:
	:type Other: gp_XYZ
	:rtype: Standard_NODISCARD gp_XYZ") Added;
		Standard_NODISCARD gp_XYZ Added (const gp_XYZ & Other);


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
		%feature("autodoc", "* Returns a ptr to coordinates location. Is useful for algorithms, but DOES NOT PERFORM ANY CHECKS!
	:rtype: inline float *") ChangeData;
		inline Standard_Real * ChangeData ();

		/****************** Coord ******************/
		%feature("compactdefaultargs") Coord;
		%feature("autodoc", "* returns the coordinate of range Index : Index = 1 => X is returned Index = 2 => Y is returned Index = 3 => Z is returned //! Raises OutOfRange if Index != {1, 2, 3}.
	:param Index:
	:type Index: int
	:rtype: float") Coord;
		Standard_Real Coord (const Standard_Integer Index);

		/****************** Coord ******************/
		%feature("compactdefaultargs") Coord;
		%feature("autodoc", ":param X:
	:type X: float &
	:param Y:
	:type Y: float &
	:param Z:
	:type Z: float &
	:rtype: None") Coord;
		void Coord (Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);

		/****************** Cross ******************/
		%feature("compactdefaultargs") Cross;
		%feature("autodoc", "* <self>.X() = <self>.Y() * Other.Z() - <self>.Z() * Other.Y() <self>.Y() = <self>.Z() * Other.X() - <self>.X() * Other.Z() <self>.Z() = <self>.X() * Other.Y() - <self>.Y() * Other.X()
	:param Right:
	:type Right: gp_XYZ
	:rtype: None") Cross;
		void Cross (const gp_XYZ & Right);

		/****************** CrossCross ******************/
		%feature("compactdefaultargs") CrossCross;
		%feature("autodoc", "* Triple vector product Computes <self> = <self>.Cross(Coord1.Cross(Coord2))
	:param Coord1:
	:type Coord1: gp_XYZ
	:param Coord2:
	:type Coord2: gp_XYZ
	:rtype: None") CrossCross;
		void CrossCross (const gp_XYZ & Coord1,const gp_XYZ & Coord2);

		/****************** CrossCrossed ******************/
		%feature("compactdefaultargs") CrossCrossed;
		%feature("autodoc", "* Triple vector product computes New = <self>.Cross(Coord1.Cross(Coord2))
	:param Coord1:
	:type Coord1: gp_XYZ
	:param Coord2:
	:type Coord2: gp_XYZ
	:rtype: Standard_NODISCARD gp_XYZ") CrossCrossed;
		Standard_NODISCARD gp_XYZ CrossCrossed (const gp_XYZ & Coord1,const gp_XYZ & Coord2);

		/****************** CrossMagnitude ******************/
		%feature("compactdefaultargs") CrossMagnitude;
		%feature("autodoc", "* Computes the magnitude of the cross product between <self> and Right. Returns || <self> ^ Right ||
	:param Right:
	:type Right: gp_XYZ
	:rtype: float") CrossMagnitude;
		Standard_Real CrossMagnitude (const gp_XYZ & Right);

		/****************** CrossSquareMagnitude ******************/
		%feature("compactdefaultargs") CrossSquareMagnitude;
		%feature("autodoc", "* Computes the square magnitude of the cross product between <self> and Right. Returns || <self> ^ Right ||**2
	:param Right:
	:type Right: gp_XYZ
	:rtype: float") CrossSquareMagnitude;
		Standard_Real CrossSquareMagnitude (const gp_XYZ & Right);

		/****************** Crossed ******************/
		%feature("compactdefaultargs") Crossed;
		%feature("autodoc", "* new.X() = <self>.Y() * Other.Z() - <self>.Z() * Other.Y() new.Y() = <self>.Z() * Other.X() - <self>.X() * Other.Z() new.Z() = <self>.X() * Other.Y() - <self>.Y() * Other.X()
	:param Right:
	:type Right: gp_XYZ
	:rtype: Standard_NODISCARD gp_XYZ") Crossed;
		Standard_NODISCARD gp_XYZ Crossed (const gp_XYZ & Right);

		/****************** Divide ******************/
		%feature("compactdefaultargs") Divide;
		%feature("autodoc", "* divides <self> by a real.
	:param Scalar:
	:type Scalar: float
	:rtype: None") Divide;
		void Divide (const Standard_Real Scalar);

		/****************** Divided ******************/
		%feature("compactdefaultargs") Divided;
		%feature("autodoc", "* divides <self> by a real.
	:param Scalar:
	:type Scalar: float
	:rtype: Standard_NODISCARD gp_XYZ") Divided;
		Standard_NODISCARD gp_XYZ Divided (const Standard_Real Scalar);

		/****************** Dot ******************/
		%feature("compactdefaultargs") Dot;
		%feature("autodoc", "* computes the scalar product between <self> and Other
	:param Other:
	:type Other: gp_XYZ
	:rtype: float") Dot;
		Standard_Real Dot (const gp_XYZ & Other);

		/****************** DotCross ******************/
		%feature("compactdefaultargs") DotCross;
		%feature("autodoc", "* computes the triple scalar product
	:param Coord1:
	:type Coord1: gp_XYZ
	:param Coord2:
	:type Coord2: gp_XYZ
	:rtype: float") DotCross;
		Standard_Real DotCross (const gp_XYZ & Coord1,const gp_XYZ & Coord2);


        %feature("autodoc", "1");
        %extend{
            std::string DumpJsonToString(int depth=-1) {
            std::stringstream s;
            self->DumpJson(s, depth);
            return s.str();}
        };
        		/****************** GetData ******************/
		%feature("compactdefaultargs") GetData;
		%feature("autodoc", "* Returns a const ptr to coordinates location. Is useful for algorithms, but DOES NOT PERFORM ANY CHECKS!
	:rtype: inline  float *") GetData;
		inline const Standard_Real * GetData ();

		/****************** IsEqual ******************/
		%feature("compactdefaultargs") IsEqual;
		%feature("autodoc", "* Returns True if he coordinates of this XYZ object are equal to the respective coordinates Other, within the specified tolerance Tolerance. I.e.: abs(<self>.X() - Other.X()) <= Tolerance and abs(<self>.Y() - Other.Y()) <= Tolerance and abs(<self>.Z() - Other.Z()) <= Tolerance.
	:param Other:
	:type Other: gp_XYZ
	:param Tolerance:
	:type Tolerance: float
	:rtype: bool") IsEqual;
		Standard_Boolean IsEqual (const gp_XYZ & Other,const Standard_Real Tolerance);

		/****************** Modulus ******************/
		%feature("compactdefaultargs") Modulus;
		%feature("autodoc", "* computes Sqrt (X*X + Y*Y + Z*Z) where X, Y and Z are the three coordinates of this XYZ object.
	:rtype: float") Modulus;
		Standard_Real Modulus ();

		/****************** Multiplied ******************/
		%feature("compactdefaultargs") Multiplied;
		%feature("autodoc", "* New.X() = <self>.X() * Scalar; New.Y() = <self>.Y() * Scalar; New.Z() = <self>.Z() * Scalar;
	:param Scalar:
	:type Scalar: float
	:rtype: Standard_NODISCARD gp_XYZ") Multiplied;
		Standard_NODISCARD gp_XYZ Multiplied (const Standard_Real Scalar);

		/****************** Multiplied ******************/
		%feature("compactdefaultargs") Multiplied;
		%feature("autodoc", "* new.X() = <self>.X() * Other.X(); new.Y() = <self>.Y() * Other.Y(); new.Z() = <self>.Z() * Other.Z();
	:param Other:
	:type Other: gp_XYZ
	:rtype: Standard_NODISCARD gp_XYZ") Multiplied;
		Standard_NODISCARD gp_XYZ Multiplied (const gp_XYZ & Other);

		/****************** Multiplied ******************/
		%feature("compactdefaultargs") Multiplied;
		%feature("autodoc", "* New = Matrix * <self>
	:param Matrix:
	:type Matrix: gp_Mat
	:rtype: Standard_NODISCARD gp_XYZ") Multiplied;
		Standard_NODISCARD gp_XYZ Multiplied (const gp_Mat & Matrix);

		/****************** Multiply ******************/
		%feature("compactdefaultargs") Multiply;
		%feature("autodoc", "* <self>.X() = <self>.X() * Scalar; <self>.Y() = <self>.Y() * Scalar; <self>.Z() = <self>.Z() * Scalar;
	:param Scalar:
	:type Scalar: float
	:rtype: None") Multiply;
		void Multiply (const Standard_Real Scalar);

		/****************** Multiply ******************/
		%feature("compactdefaultargs") Multiply;
		%feature("autodoc", "* <self>.X() = <self>.X() * Other.X(); <self>.Y() = <self>.Y() * Other.Y(); <self>.Z() = <self>.Z() * Other.Z();
	:param Other:
	:type Other: gp_XYZ
	:rtype: None") Multiply;
		void Multiply (const gp_XYZ & Other);

		/****************** Multiply ******************/
		%feature("compactdefaultargs") Multiply;
		%feature("autodoc", "* <self> = Matrix * <self>
	:param Matrix:
	:type Matrix: gp_Mat
	:rtype: None") Multiply;
		void Multiply (const gp_Mat & Matrix);

		/****************** Normalize ******************/
		%feature("compactdefaultargs") Normalize;
		%feature("autodoc", "* <self>.X() = <self>.X()/ <self>.Modulus() <self>.Y() = <self>.Y()/ <self>.Modulus() <self>.Z() = <self>.Z()/ <self>.Modulus() Raised if <self>.Modulus() <= Resolution from gp
	:rtype: None") Normalize;
		void Normalize ();

		/****************** Normalized ******************/
		%feature("compactdefaultargs") Normalized;
		%feature("autodoc", "* New.X() = <self>.X()/ <self>.Modulus() New.Y() = <self>.Y()/ <self>.Modulus() New.Z() = <self>.Z()/ <self>.Modulus() Raised if <self>.Modulus() <= Resolution from gp
	:rtype: Standard_NODISCARD gp_XYZ") Normalized;
		Standard_NODISCARD gp_XYZ Normalized ();

		/****************** Reverse ******************/
		%feature("compactdefaultargs") Reverse;
		%feature("autodoc", "* <self>.X() = -<self>.X() <self>.Y() = -<self>.Y() <self>.Z() = -<self>.Z()
	:rtype: None") Reverse;
		void Reverse ();

		/****************** Reversed ******************/
		%feature("compactdefaultargs") Reversed;
		%feature("autodoc", "* New.X() = -<self>.X() New.Y() = -<self>.Y() New.Z() = -<self>.Z()
	:rtype: Standard_NODISCARD gp_XYZ") Reversed;
		Standard_NODISCARD gp_XYZ Reversed ();

		/****************** SetCoord ******************/
		%feature("compactdefaultargs") SetCoord;
		%feature("autodoc", "* For this XYZ object, assigns the values X, Y and Z to its three coordinates
	:param X:
	:type X: float
	:param Y:
	:type Y: float
	:param Z:
	:type Z: float
	:rtype: None") SetCoord;
		void SetCoord (const Standard_Real X,const Standard_Real Y,const Standard_Real Z);

		/****************** SetCoord ******************/
		%feature("compactdefaultargs") SetCoord;
		%feature("autodoc", "* modifies the coordinate of range Index Index = 1 => X is modified Index = 2 => Y is modified Index = 3 => Z is modified Raises OutOfRange if Index != {1, 2, 3}.
	:param Index:
	:type Index: int
	:param Xi:
	:type Xi: float
	:rtype: None") SetCoord;
		void SetCoord (const Standard_Integer Index,const Standard_Real Xi);

		/****************** SetLinearForm ******************/
		%feature("compactdefaultargs") SetLinearForm;
		%feature("autodoc", "* <self> is set to the following linear form : A1 * XYZ1 + A2 * XYZ2 + A3 * XYZ3 + XYZ4
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
	:rtype: None") SetLinearForm;
		void SetLinearForm (const Standard_Real A1,const gp_XYZ & XYZ1,const Standard_Real A2,const gp_XYZ & XYZ2,const Standard_Real A3,const gp_XYZ & XYZ3,const gp_XYZ & XYZ4);

		/****************** SetLinearForm ******************/
		%feature("compactdefaultargs") SetLinearForm;
		%feature("autodoc", "* <self> is set to the following linear form : A1 * XYZ1 + A2 * XYZ2 + A3 * XYZ3
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
	:rtype: None") SetLinearForm;
		void SetLinearForm (const Standard_Real A1,const gp_XYZ & XYZ1,const Standard_Real A2,const gp_XYZ & XYZ2,const Standard_Real A3,const gp_XYZ & XYZ3);

		/****************** SetLinearForm ******************/
		%feature("compactdefaultargs") SetLinearForm;
		%feature("autodoc", "* <self> is set to the following linear form : A1 * XYZ1 + A2 * XYZ2 + XYZ3
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
	:rtype: None") SetLinearForm;
		void SetLinearForm (const Standard_Real A1,const gp_XYZ & XYZ1,const Standard_Real A2,const gp_XYZ & XYZ2,const gp_XYZ & XYZ3);

		/****************** SetLinearForm ******************/
		%feature("compactdefaultargs") SetLinearForm;
		%feature("autodoc", "* <self> is set to the following linear form : A1 * XYZ1 + A2 * XYZ2
	:param A1:
	:type A1: float
	:param XYZ1:
	:type XYZ1: gp_XYZ
	:param A2:
	:type A2: float
	:param XYZ2:
	:type XYZ2: gp_XYZ
	:rtype: None") SetLinearForm;
		void SetLinearForm (const Standard_Real A1,const gp_XYZ & XYZ1,const Standard_Real A2,const gp_XYZ & XYZ2);

		/****************** SetLinearForm ******************/
		%feature("compactdefaultargs") SetLinearForm;
		%feature("autodoc", "* <self> is set to the following linear form : A1 * XYZ1 + XYZ2
	:param A1:
	:type A1: float
	:param XYZ1:
	:type XYZ1: gp_XYZ
	:param XYZ2:
	:type XYZ2: gp_XYZ
	:rtype: None") SetLinearForm;
		void SetLinearForm (const Standard_Real A1,const gp_XYZ & XYZ1,const gp_XYZ & XYZ2);

		/****************** SetLinearForm ******************/
		%feature("compactdefaultargs") SetLinearForm;
		%feature("autodoc", "* <self> is set to the following linear form : XYZ1 + XYZ2
	:param XYZ1:
	:type XYZ1: gp_XYZ
	:param XYZ2:
	:type XYZ2: gp_XYZ
	:rtype: None") SetLinearForm;
		void SetLinearForm (const gp_XYZ & XYZ1,const gp_XYZ & XYZ2);

		/****************** SetX ******************/
		%feature("compactdefaultargs") SetX;
		%feature("autodoc", "* Assigns the given value to the X coordinate
	:param X:
	:type X: float
	:rtype: None") SetX;
		void SetX (const Standard_Real X);

		/****************** SetY ******************/
		%feature("compactdefaultargs") SetY;
		%feature("autodoc", "* Assigns the given value to the Y coordinate
	:param Y:
	:type Y: float
	:rtype: None") SetY;
		void SetY (const Standard_Real Y);

		/****************** SetZ ******************/
		%feature("compactdefaultargs") SetZ;
		%feature("autodoc", "* Assigns the given value to the Z coordinate
	:param Z:
	:type Z: float
	:rtype: None") SetZ;
		void SetZ (const Standard_Real Z);

		/****************** SquareModulus ******************/
		%feature("compactdefaultargs") SquareModulus;
		%feature("autodoc", "* Computes X*X + Y*Y + Z*Z where X, Y and Z are the three coordinates of this XYZ object.
	:rtype: float") SquareModulus;
		Standard_Real SquareModulus ();

		/****************** Subtract ******************/
		%feature("compactdefaultargs") Subtract;
		%feature("autodoc", "* <self>.X() = <self>.X() - Other.X() <self>.Y() = <self>.Y() - Other.Y() <self>.Z() = <self>.Z() - Other.Z()
	:param Right:
	:type Right: gp_XYZ
	:rtype: None") Subtract;
		void Subtract (const gp_XYZ & Right);

		/****************** Subtracted ******************/
		%feature("compactdefaultargs") Subtracted;
		%feature("autodoc", "* new.X() = <self>.X() - Other.X() new.Y() = <self>.Y() - Other.Y() new.Z() = <self>.Z() - Other.Z()
	:param Right:
	:type Right: gp_XYZ
	:rtype: Standard_NODISCARD gp_XYZ") Subtracted;
		Standard_NODISCARD gp_XYZ Subtracted (const gp_XYZ & Right);

		/****************** X ******************/
		%feature("compactdefaultargs") X;
		%feature("autodoc", "* Returns the X coordinate
	:rtype: float") X;
		Standard_Real X ();

		/****************** Y ******************/
		%feature("compactdefaultargs") Y;
		%feature("autodoc", "* Returns the Y coordinate
	:rtype: float") Y;
		Standard_Real Y ();

		/****************** Z ******************/
		%feature("compactdefaultargs") Z;
		%feature("autodoc", "* Returns the Z coordinate
	:rtype: float") Z;
		Standard_Real Z ();

		/****************** gp_XYZ ******************/
		%feature("compactdefaultargs") gp_XYZ;
		%feature("autodoc", "* Creates an XYZ object with zero co-ordinates (0,0,0)
	:rtype: None") gp_XYZ;
		 gp_XYZ ();

		/****************** gp_XYZ ******************/
		%feature("compactdefaultargs") gp_XYZ;
		%feature("autodoc", "* creates an XYZ with given coordinates
	:param X:
	:type X: float
	:param Y:
	:type Y: float
	:param Z:
	:type Z: float
	:rtype: None") gp_XYZ;
		 gp_XYZ (const Standard_Real X,const Standard_Real Y,const Standard_Real Z);

		/****************** operator * ******************/
		%feature("compactdefaultargs") operator *;
		%feature("autodoc", ":param Other:
	:type Other: gp_XYZ
	:rtype: float") operator *;
		Standard_Real operator * (const gp_XYZ & Other);

		/****************** operator * ******************/
		%feature("compactdefaultargs") operator *;
		%feature("autodoc", ":param Scalar:
	:type Scalar: float
	:rtype: Standard_NODISCARD gp_XYZ") operator *;
		Standard_NODISCARD gp_XYZ operator * (const Standard_Real Scalar);

		/****************** operator * ******************/
		%feature("compactdefaultargs") operator *;
		%feature("autodoc", ":param Matrix:
	:type Matrix: gp_Mat
	:rtype: Standard_NODISCARD gp_XYZ") operator *;
		Standard_NODISCARD gp_XYZ operator * (const gp_Mat & Matrix);


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
            void __imul_wrapper__(const gp_XYZ  other) {
            *self *= other;
            }
        }
        %pythoncode {
        def __imul__(self, right):
            self.__imul_wrapper__(right)
            return self
        }
        
        %extend{
            void __imul_wrapper__(const gp_Mat  other) {
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
		%feature("autodoc", ":param Other:
	:type Other: gp_XYZ
	:rtype: Standard_NODISCARD gp_XYZ") operator +;
		Standard_NODISCARD gp_XYZ operator + (const gp_XYZ & Other);


        %extend{
            void __iadd_wrapper__(const gp_XYZ  other) {
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
		%feature("autodoc", ":param Right:
	:type Right: gp_XYZ
	:rtype: Standard_NODISCARD gp_XYZ") operator -;
		Standard_NODISCARD gp_XYZ operator - (const gp_XYZ & Right);


        %extend{
            void __isub_wrapper__(const gp_XYZ  other) {
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
		%feature("autodoc", ":param Scalar:
	:type Scalar: float
	:rtype: Standard_NODISCARD gp_XYZ") operator /;
		Standard_NODISCARD gp_XYZ operator / (const Standard_Real Scalar);


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

/* harray1 class */
/* harray2 class */
/* harray2 class */
