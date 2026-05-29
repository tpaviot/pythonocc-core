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
%define GPROPDOCSTRING
"GProp module, see official documentation at
https://dev.opencascade.org/doc/occt-7.9.0/refman/html/package_gprop.html"
%enddef
%module (package="OCC.Core", docstring=GPROPDOCSTRING) GProp


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
#include<GProp_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<gp_module.hxx>
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
%import TColgp.i
%import TColStd.i

%pythoncode {
from enum import IntEnum
from OCC.Core.Exception import *
};

/* public enums */
enum GProp_ValueType {
	GProp_Mass = 0,
	GProp_CenterMassX = 1,
	GProp_CenterMassY = 2,
	GProp_CenterMassZ = 3,
	GProp_InertiaXX = 4,
	GProp_InertiaYY = 5,
	GProp_InertiaZZ = 6,
	GProp_InertiaXY = 7,
	GProp_InertiaXZ = 8,
	GProp_InertiaYZ = 9,
	GProp_Unknown = 10,
};

/* end public enums declaration */

/* python proxy classes for enums */
%pythoncode {

class GProp_ValueType(IntEnum):
	GProp_Mass = 0
	GProp_CenterMassX = 1
	GProp_CenterMassY = 2
	GProp_CenterMassZ = 3
	GProp_InertiaXX = 4
	GProp_InertiaYY = 5
	GProp_InertiaZZ = 6
	GProp_InertiaXY = 7
	GProp_InertiaXZ = 8
	GProp_InertiaYZ = 9
	GProp_Unknown = 10
GProp_Mass = GProp_ValueType.GProp_Mass
GProp_CenterMassX = GProp_ValueType.GProp_CenterMassX
GProp_CenterMassY = GProp_ValueType.GProp_CenterMassY
GProp_CenterMassZ = GProp_ValueType.GProp_CenterMassZ
GProp_InertiaXX = GProp_ValueType.GProp_InertiaXX
GProp_InertiaYY = GProp_ValueType.GProp_InertiaYY
GProp_InertiaZZ = GProp_ValueType.GProp_InertiaZZ
GProp_InertiaXY = GProp_ValueType.GProp_InertiaXY
GProp_InertiaXZ = GProp_ValueType.GProp_InertiaXZ
GProp_InertiaYZ = GProp_ValueType.GProp_InertiaYZ
GProp_Unknown = GProp_ValueType.GProp_Unknown
};
/* end python proxy for enums */

/* handles */
/* end handles declaration */

/* templates */
/* end templates declaration */

/* typedefs */
/* end typedefs declaration */

/**************
* class GProp *
**************/
%rename(gprop) GProp;
class GProp {
	public:
		/****** GProp::HOperator ******/
		/****** md5 signature: 4980040d24aa5aaa333426a457841853 ******/
		%feature("compactdefaultargs") HOperator;
		%feature("autodoc", "
Parameters
----------
G: gp_Pnt
Q: gp_Pnt
Mass: double
Operator: gp_Mat

Return
-------
None

Description
-----------
methods of package Computes the matrix Operator, referred to as the 'Huyghens Operator' of a geometric system at the point Q of the space, using the following data: - Mass, i.e. the mass of the system, - G, the center of mass of the system. The 'Huyghens Operator' is used to compute Inertia/Q, the matrix of inertia of the system at the point Q using Huyghens' theorem: Inertia/Q = Inertia/G + HOperator (Q, G, Mass) where Inertia/G is the matrix of inertia of the system relative to its center of mass as returned by the function MatrixOfInertia on any GProp_GProps object.
") HOperator;
		static void HOperator(const gp_Pnt & G, const gp_Pnt & Q, const double Mass, gp_Mat & Operator);

};


%extend GProp {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************
* class GProp_GProps *
*********************/
class GProp_GProps {
	public:
		/****** GProp_GProps::GProp_GProps ******/
		/****** md5 signature: 724a1f7efbfd6075fd5b33dce9f3fc1e ******/
		%feature("compactdefaultargs") GProp_GProps;
		%feature("autodoc", "Return
-------
None

Description
-----------
The origin (0, 0, 0) of the absolute Cartesian coordinate system is used to compute the global properties.
") GProp_GProps;
		 GProp_GProps();

		/****** GProp_GProps::GProp_GProps ******/
		/****** md5 signature: 5161631c7b51e73b531a2d56f3a2fb17 ******/
		%feature("compactdefaultargs") GProp_GProps;
		%feature("autodoc", "
Parameters
----------
SystemLocation: gp_Pnt

Return
-------
None

Description
-----------
The point SystemLocation is used to compute the global properties of the system. For greater accuracy, define this point close to the location of the system; for example a point near the centre of mass of the system. //! At initialization the framework is empty: it retains no dimensional information such as mass or inertia. It is, however, ready to bring together global properties of various other systems whose global properties have already been computed using another framework. To do this, use Add() to define the components of the system, once per component, and then use the interrogation functions to access the computed values. //! 
Input parameter: SystemLocation reference point of the system used for  inertia accumulation.
") GProp_GProps;
		 GProp_GProps(const gp_Pnt & SystemLocation);

		/****** GProp_GProps::Add ******/
		/****** md5 signature: 6afaa8a1376a584de7a087a680afac4b ******/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "
Parameters
----------
Item: GProp_GProps
Density: double (optional, default to 1.0)

Return
-------
None

Description
-----------
Either: - initializes the global properties retained by this framework from those retained by the framework Item, or - brings together the global properties retained by this framework with those retained by the framework Item. //! The value Density (1.0 by default) is used as the density of the system analysed by Item. Sometimes the density has already been accounted for at construction time of Item - for example when Item is a GProp_PGProps framework built to compute the global properties of a set of weighted points, or another GProp_GProps object that already retains composite global properties. In these cases the real density was already taken into account at construction of Item. Note that this is not checked: if the density of parts of the system is taken into account two or more times, the result of the computation will be wrong. //! Notes: - The reference point of Item may differ from the reference point of this framework. Huygens' theorem is applied automatically to transfer inertia values to the reference point of this framework. - Add() is used once per component of the system. After all components are composed, the interrogation functions return values for the system as a whole. - The system whose global properties have been brought together by this framework is referred to as the 'current system'. The current system itself is not retained: only its global properties are. //! 
Input parameter: Item framework holding the global properties of the  component to compose 
Input parameter: Density density of the component (default 1.0) @throws Standard_DomainError if Density is less than or equal to gp::Resolution().
") Add;
		void Add(const GProp_GProps & Item, const double Density = 1.0);

		/****** GProp_GProps::CentreOfMass ******/
		/****** md5 signature: cc115d71b78f41e570b7265dbdcab224 ******/
		%feature("compactdefaultargs") CentreOfMass;
		%feature("autodoc", "Return
-------
gp_Pnt

Description
-----------
Returns the centre of mass of the current system. With a uniform gravitational field this is also the centre of gravity. The coordinates returned for the centre of mass are expressed in the absolute Cartesian coordinate system.
") CentreOfMass;
		gp_Pnt CentreOfMass();

		/****** GProp_GProps::Mass ******/
		/****** md5 signature: 66da788acb9e988f1bfd50432117140e ******/
		%feature("compactdefaultargs") Mass;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns the mass of the current system. //! If no density has been attached to the components of the current system, the returned value corresponds to: - the total length of the edges of the current system if this framework retains only linear properties (for example, when using only LinearProperties() to combine properties of lines from shapes), or - the total area of the faces of the current system if this framework retains only surface properties (for example, when using only SurfaceProperties() to combine properties of surfaces from shapes), or - the total volume of the solids of the current system if this framework retains only volume properties (for example, when using only VolumeProperties() to combine properties of volumes from solids). //! @warning A length, an area or a volume is computed in the current unit system. The mass of a single object is its length, area or volume multiplied by its density. Be consistent with respect to the units used.
") Mass;
		double Mass();

		/****** GProp_GProps::MatrixOfInertia ******/
		/****** md5 signature: f3c9ee609f5710f3a7d3f3cfca9ac896 ******/
		%feature("compactdefaultargs") MatrixOfInertia;
		%feature("autodoc", "Return
-------
gp_Mat

Description
-----------
Returns the matrix of inertia. It is a symmetric matrix whose coefficients are the quadratic moments of inertia: @verbatim  | Ixx Ixy Ixz | matrix = | Ixy Iyy Iyz |  | Ixz Iyz Izz | @endverbatim Ixx, Iyy, Izz are the moments of inertia; Ixy, Ixz, Iyz are the products of inertia. //! The matrix of inertia is returned in the central coordinate system (G, Gx, Gy, Gz), where G is the centre of mass of the system and Gx, Gy, Gz are parallel to the X(1, 0, 0), Y(0, 1, 0) and Z(0, 0, 1) directions of the absolute Cartesian coordinate system. To compute the matrix of inertia at another location use GProp::HOperator() (Huygens' theorem).
") MatrixOfInertia;
		gp_Mat MatrixOfInertia();

		/****** GProp_GProps::MomentOfInertia ******/
		/****** md5 signature: 53edd54db7511dd635d4d8c9e6fd155a ******/
		%feature("compactdefaultargs") MomentOfInertia;
		%feature("autodoc", "
Parameters
----------
A: gp_Ax1

Return
-------
double

Description
-----------
Computes the moment of inertia of the system about the axis A. 
Input parameter: A axis about which the moment of inertia is computed.
") MomentOfInertia;
		double MomentOfInertia(const gp_Ax1 & A);

		/****** GProp_GProps::PrincipalProperties ******/
		/****** md5 signature: 4ddeac27ac94e791681cd80d5252ce61 ******/
		%feature("compactdefaultargs") PrincipalProperties;
		%feature("autodoc", "Return
-------
GProp_PrincipalProps

Description
-----------
Computes the principal properties of inertia of the current system. There is always a set of axes for which the products of inertia of a geometric system are equal to 0 - i.e. the matrix of inertia of the system is diagonal. These axes are the principal axes of inertia; their origin coincides with the centre of mass of the system. The associated moments are called the principal moments of inertia. //! This function computes the eigen values and eigen vectors of the matrix of inertia of the system. Results are stored in a GProp_PrincipalProps framework which can be queried to access the value sought.
") PrincipalProperties;
		GProp_PrincipalProps PrincipalProperties();

		/****** GProp_GProps::RadiusOfGyration ******/
		/****** md5 signature: 3477f79f41e5b6e79d014f7e5296911b ******/
		%feature("compactdefaultargs") RadiusOfGyration;
		%feature("autodoc", "
Parameters
----------
A: gp_Ax1

Return
-------
double

Description
-----------
Returns the radius of gyration of the current system about the axis A. 
Input parameter: A axis about which the radius of gyration is computed.
") RadiusOfGyration;
		double RadiusOfGyration(const gp_Ax1 & A);

		/****** GProp_GProps::StaticMoments ******/
		/****** md5 signature: 50ea5e5339f0f112a548489675fb44c8 ******/
		%feature("compactdefaultargs") StaticMoments;
		%feature("autodoc", "
Parameters
----------

Return
-------
Ix: double
Iy: double
Iz: double

Description
-----------
Returns the static moments of inertia of the current system - i.e. the moments of inertia about the three axes of the absolute Cartesian coordinate system. //! @param[out] Ix static moment of inertia about X @param[out] Iy static moment of inertia about Y @param[out] Iz static moment of inertia about Z.
") StaticMoments;
		void StaticMoments(Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

};


%extend GProp_GProps {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************
* class GProp_PEquation *
************************/
class GProp_PEquation {
	public:
/* public enums */
enum class Type {
	None = 0,
	Point = 1,
	Line = 2,
	Plane = 3,
	Space = 4,
};

/* end public enums declaration */

/* python proxy classes for enums */
%pythoncode {

class Type(IntEnum):
	None_ = 0
	Point = 1
	Line = 2
	Plane = 3
	Space = 4
None_ = Type.None_
Point = Type.Point
Line = Type.Line
Plane = Type.Plane
Space = Type.Space
};
/* end python proxy for enums */

		/****** GProp_PEquation::GProp_PEquation ******/
		/****** md5 signature: 7979bb24427006969fb54a8fc0e63e88 ******/
		%feature("compactdefaultargs") GProp_PEquation;
		%feature("autodoc", "
Parameters
----------
thePnts: TColgp_Array1OfPnt
theTol: double

Return
-------
None

Description
-----------
Constructs the analysis from a set of points and a tolerance. 
Input parameter: thePnts array of points to analyze 
Input parameter: theTol tolerance for dimensional collapse detection.
") GProp_PEquation;
		 GProp_PEquation(const TColgp_Array1OfPnt & thePnts, double theTol);

		/****** GProp_PEquation::Barycentre ******/
		/****** md5 signature: 2ba49f69b10cb9b11715997e97764240 ******/
		%feature("compactdefaultargs") Barycentre;
		%feature("autodoc", "Return
-------
gp_Pnt

Description
-----------
Returns the centre of mass of the cloud (always valid after construction).
") Barycentre;
		const gp_Pnt Barycentre();

		/****** GProp_PEquation::Box ******/
		/****** md5 signature: e1c81a80f9e365452f626099b2f83c69 ******/
		%feature("compactdefaultargs") Box;
		%feature("autodoc", "
Parameters
----------
theP: gp_Pnt
theV1: gp_Vec
theV2: gp_Vec
theV3: gp_Vec

Return
-------
None

Description
-----------
Returns a bounding box aligned with the principal axes. @param[out] theP corner of the box (minimum projection on principal axes) @param[out] theV1 first box edge vector (along first principal axis) @param[out] theV2 second box edge vector (along second principal axis) @param[out] theV3 third box edge vector (along third principal axis) @throws Standard_NoSuchObject if !IsSpace().
") Box;
		void Box(gp_Pnt & theP, gp_Vec & theV1, gp_Vec & theV2, gp_Vec & theV3);

		/****** GProp_PEquation::Extent ******/
		/****** md5 signature: a6392d996884cbc93c40b0b28810eda2 ******/
		%feature("compactdefaultargs") Extent;
		%feature("autodoc", "
Parameters
----------
theIndex: int

Return
-------
double

Description
-----------
Returns the extent (max - min projection) along principal axis @p theIndex (1, 2 or 3).
") Extent;
		double Extent(int theIndex);

		/****** GProp_PEquation::GetType ******/
		/****** md5 signature: 7b162c3246df9a86c3dfdae041099d44 ******/
		%feature("compactdefaultargs") GetType;
		%feature("autodoc", "Return
-------
GProp_PEquation::Type

Description
-----------
Returns the type of the fitted entity.
") GetType;
		GProp_PEquation::Type GetType();

		/****** GProp_PEquation::IsLinear ******/
		/****** md5 signature: 9b70f67d4c8eea4cbdfd5eb230c86993 ******/
		%feature("compactdefaultargs") IsLinear;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if points are collinear within tolerance.
") IsLinear;
		bool IsLinear();

		/****** GProp_PEquation::IsPlanar ******/
		/****** md5 signature: 21812541de26861da5a85e1a313d8bbf ******/
		%feature("compactdefaultargs") IsPlanar;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if points are coplanar within tolerance.
") IsPlanar;
		bool IsPlanar();

		/****** GProp_PEquation::IsPoint ******/
		/****** md5 signature: 5cd2a9426d7520d2276fb03975354eaa ******/
		%feature("compactdefaultargs") IsPoint;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if points are coincident within tolerance.
") IsPoint;
		bool IsPoint();

		/****** GProp_PEquation::IsSpace ******/
		/****** md5 signature: e055ff639aeb6d670d601cab0cf4e60d ******/
		%feature("compactdefaultargs") IsSpace;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if points span 3D space.
") IsSpace;
		bool IsSpace();

		/****** GProp_PEquation::Line ******/
		/****** md5 signature: 63e1fa189ca3bcfdb401241217a93bfb ******/
		%feature("compactdefaultargs") Line;
		%feature("autodoc", "Return
-------
gp_Lin

Description
-----------
Returns the mean line. @throws Standard_NoSuchObject if !IsLinear().
") Line;
		gp_Lin Line();

		/****** GProp_PEquation::Plane ******/
		/****** md5 signature: 722ec8a1cda087d25cc539584e9de6e6 ******/
		%feature("compactdefaultargs") Plane;
		%feature("autodoc", "Return
-------
gp_Pln

Description
-----------
Returns the mean plane. @throws Standard_NoSuchObject if !IsPlanar().
") Plane;
		gp_Pln Plane();

		/****** GProp_PEquation::Point ******/
		/****** md5 signature: aacd847206090cc43a493e5072f97000 ******/
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "Return
-------
gp_Pnt

Description
-----------
Returns the mean point. @throws Standard_NoSuchObject if !IsPoint().
") Point;
		gp_Pnt Point();

		/****** GProp_PEquation::PrincipalAxis ******/
		/****** md5 signature: 0567eed8a44aa405b5a20e8f95bfd05f ******/
		%feature("compactdefaultargs") PrincipalAxis;
		%feature("autodoc", "
Parameters
----------
theIndex: int

Return
-------
gp_Vec

Description
-----------
Returns the unit principal axis at @p theIndex (1, 2 or 3), ordered by eigenvalue.
") PrincipalAxis;
		const gp_Vec PrincipalAxis(int theIndex);

};


%extend GProp_PEquation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************
* class GProp_PrincipalProps *
*****************************/
class GProp_PrincipalProps {
	public:
		/****** GProp_PrincipalProps::GProp_PrincipalProps ******/
		/****** md5 signature: c75156a91a1a133c54de225ca51a82c6 ******/
		%feature("compactdefaultargs") GProp_PrincipalProps;
		%feature("autodoc", "Return
-------
None

Description
-----------
creates an undefined PrincipalProps.
") GProp_PrincipalProps;
		 GProp_PrincipalProps();

		/****** GProp_PrincipalProps::FirstAxisOfInertia ******/
		/****** md5 signature: b4829aa8547627dd0dedb28506a7f9a2 ******/
		%feature("compactdefaultargs") FirstAxisOfInertia;
		%feature("autodoc", "Return
-------
gp_Vec

Description
-----------
returns the first axis of inertia. //! if the system has a point of symmetry there is an infinity of solutions. It is not possible to defines the three axis of inertia.
") FirstAxisOfInertia;
		const gp_Vec FirstAxisOfInertia();

		/****** GProp_PrincipalProps::HasSymmetryAxis ******/
		/****** md5 signature: 010448148fde8102522d1b334bc7c85b ******/
		%feature("compactdefaultargs") HasSymmetryAxis;
		%feature("autodoc", "Return
-------
bool

Description
-----------
returns true if the geometric system has an axis of symmetry. For comparing moments relative tolerance 1.e-10 is used. Usually it is enough for objects, restricted by faces with analytical geometry.
") HasSymmetryAxis;
		bool HasSymmetryAxis();

		/****** GProp_PrincipalProps::HasSymmetryAxis ******/
		/****** md5 signature: 9903bbbe434244d5a5dc193269218f1e ******/
		%feature("compactdefaultargs") HasSymmetryAxis;
		%feature("autodoc", "
Parameters
----------
aTol: double

Return
-------
bool

Description
-----------
returns true if the geometric system has an axis of symmetry. aTol is relative tolerance for checking equality of moments If aTol == 0, relative tolerance is ~ 1.e-16 (Epsilon(I)).
") HasSymmetryAxis;
		bool HasSymmetryAxis(const double aTol);

		/****** GProp_PrincipalProps::HasSymmetryPoint ******/
		/****** md5 signature: 7e15ea67e85381f357ccc81564108030 ******/
		%feature("compactdefaultargs") HasSymmetryPoint;
		%feature("autodoc", "Return
-------
bool

Description
-----------
returns true if the geometric system has a point of symmetry. For comparing moments relative tolerance 1.e-10 is used. Usually it is enough for objects, restricted by faces with analytical geometry.
") HasSymmetryPoint;
		bool HasSymmetryPoint();

		/****** GProp_PrincipalProps::HasSymmetryPoint ******/
		/****** md5 signature: 151c6b130e2748887a8f212ad8e8bca5 ******/
		%feature("compactdefaultargs") HasSymmetryPoint;
		%feature("autodoc", "
Parameters
----------
aTol: double

Return
-------
bool

Description
-----------
returns true if the geometric system has a point of symmetry. aTol is relative tolerance for checking equality of moments If aTol == 0, relative tolerance is ~ 1.e-16 (Epsilon(I)).
") HasSymmetryPoint;
		bool HasSymmetryPoint(const double aTol);

		/****** GProp_PrincipalProps::Moments ******/
		/****** md5 signature: f60bc113b886b5e3e41cbb14a08c363e ******/
		%feature("compactdefaultargs") Moments;
		%feature("autodoc", "
Parameters
----------

Return
-------
Ixx: double
Iyy: double
Izz: double

Description
-----------
Ixx, Iyy and Izz return the principal moments of inertia in the current system. Notes: - If the current system has an axis of symmetry, two of the three values Ixx, Iyy and Izz are equal. They indicate which eigen vectors define an infinity of axes of principal inertia. - If the current system has a center of symmetry, Ixx, Iyy and Izz are equal.
") Moments;
		void Moments(Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** GProp_PrincipalProps::RadiusOfGyration ******/
		/****** md5 signature: b35d66db05a653c1cb61f3d69e706ada ******/
		%feature("compactdefaultargs") RadiusOfGyration;
		%feature("autodoc", "
Parameters
----------

Return
-------
Rxx: double
Ryy: double
Rzz: double

Description
-----------
Returns the principal radii of gyration Rxx, Ryy and Rzz are the radii of gyration of the current system about its three principal axes of inertia. Note that: - If the current system has an axis of symmetry, two of the three values Rxx, Ryy and Rzz are equal. - If the current system has a center of symmetry, Rxx, Ryy and Rzz are equal.
") RadiusOfGyration;
		void RadiusOfGyration(Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** GProp_PrincipalProps::SecondAxisOfInertia ******/
		/****** md5 signature: 5303fc919d81728a0f6fe776c517baf1 ******/
		%feature("compactdefaultargs") SecondAxisOfInertia;
		%feature("autodoc", "Return
-------
gp_Vec

Description
-----------
returns the second axis of inertia. //! if the system has a point of symmetry or an axis of symmetry the second and the third axis of symmetry are undefined.
") SecondAxisOfInertia;
		const gp_Vec SecondAxisOfInertia();

		/****** GProp_PrincipalProps::ThirdAxisOfInertia ******/
		/****** md5 signature: 84e1e0302d5f16ebfc8d315a15bc0c0f ******/
		%feature("compactdefaultargs") ThirdAxisOfInertia;
		%feature("autodoc", "Return
-------
gp_Vec

Description
-----------
returns the third axis of inertia. This and the above functions return the first, second or third eigen vector of the matrix of inertia of the current system. The first, second and third principal axis of inertia pass through the center of mass of the current system. They are respectively parallel to these three eigen vectors. Note that: - If the current system has an axis of symmetry, any axis is an axis of principal inertia if it passes through the center of mass of the system, and runs parallel to a linear combination of the two eigen vectors of the matrix of inertia, corresponding to the two eigen values which are equal. If the current system has a center of symmetry, any axis passing through the center of mass of the system is an axis of principal inertia. Use the functions HasSymmetryAxis and HasSymmetryPoint to check these particular cases, where the returned eigen vectors define an infinity of principal axis of inertia. - The Moments function can be used to know which of the three eigen vectors corresponds to the two eigen values which are equal. //! if the system has a point of symmetry or an axis of symmetry the second and the third axis of symmetry are undefined.
") ThirdAxisOfInertia;
		const gp_Vec ThirdAxisOfInertia();

};


%extend GProp_PrincipalProps {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************
* class GProp_CelGProps *
************************/
class GProp_CelGProps : public GProp_GProps {
	public:
		/****** GProp_CelGProps::GProp_CelGProps ******/
		/****** md5 signature: 5d8fe972b919ac927abf7c4e27f7e3c4 ******/
		%feature("compactdefaultargs") GProp_CelGProps;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") GProp_CelGProps;
		 GProp_CelGProps();

		/****** GProp_CelGProps::GProp_CelGProps ******/
		/****** md5 signature: eb090438e9a1f0925ff4e356cd731480 ******/
		%feature("compactdefaultargs") GProp_CelGProps;
		%feature("autodoc", "
Parameters
----------
C: gp_Circ
CLocation: gp_Pnt

Return
-------
None

Description
-----------
No available documentation.
") GProp_CelGProps;
		 GProp_CelGProps(const gp_Circ & C, const gp_Pnt & CLocation);

		/****** GProp_CelGProps::GProp_CelGProps ******/
		/****** md5 signature: 2eeb6784e2d919333dc556d7865a94b2 ******/
		%feature("compactdefaultargs") GProp_CelGProps;
		%feature("autodoc", "
Parameters
----------
C: gp_Circ
U1: double
U2: double
CLocation: gp_Pnt

Return
-------
None

Description
-----------
No available documentation.
") GProp_CelGProps;
		 GProp_CelGProps(const gp_Circ & C, const double U1, const double U2, const gp_Pnt & CLocation);

		/****** GProp_CelGProps::GProp_CelGProps ******/
		/****** md5 signature: 3ee54df5016c00b0c406f0998db2b650 ******/
		%feature("compactdefaultargs") GProp_CelGProps;
		%feature("autodoc", "
Parameters
----------
C: gp_Lin
U1: double
U2: double
CLocation: gp_Pnt

Return
-------
None

Description
-----------
No available documentation.
") GProp_CelGProps;
		 GProp_CelGProps(const gp_Lin & C, const double U1, const double U2, const gp_Pnt & CLocation);

		/****** GProp_CelGProps::Perform ******/
		/****** md5 signature: 0d3d51ccba11aa9bad6be73adc989a3c ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
C: gp_Circ
U1: double
U2: double

Return
-------
None

Description
-----------
No available documentation.
") Perform;
		void Perform(const gp_Circ & C, const double U1, const double U2);

		/****** GProp_CelGProps::Perform ******/
		/****** md5 signature: 0a68fb72481d5adb1f59634c637496b5 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
C: gp_Lin
U1: double
U2: double

Return
-------
None

Description
-----------
No available documentation.
") Perform;
		void Perform(const gp_Lin & C, const double U1, const double U2);

		/****** GProp_CelGProps::SetLocation ******/
		/****** md5 signature: 5ed92b27e15802cdea187cf4e43b346a ******/
		%feature("compactdefaultargs") SetLocation;
		%feature("autodoc", "
Parameters
----------
CLocation: gp_Pnt

Return
-------
None

Description
-----------
No available documentation.
") SetLocation;
		void SetLocation(const gp_Pnt & CLocation);

};


%extend GProp_CelGProps {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************
* class GProp_PGProps *
**********************/
class GProp_PGProps : public GProp_GProps {
	public:
		/****** GProp_PGProps::GProp_PGProps ******/
		/****** md5 signature: 5afb633b4bba5ef112587d854c43a182 ******/
		%feature("compactdefaultargs") GProp_PGProps;
		%feature("autodoc", "Return
-------
None

Description
-----------
Creates an empty point set, located at the origin, with zero mass.
") GProp_PGProps;
		 GProp_PGProps();

		/****** GProp_PGProps::GProp_PGProps ******/
		/****** md5 signature: dfbad8c22ad70b29eeab1c9a3ad88c39 ******/
		%feature("compactdefaultargs") GProp_PGProps;
		%feature("autodoc", "
Parameters
----------
thePnts: TColgp_Array1OfPnt

Return
-------
None

Description
-----------
Creates a point set from an array of points (unit mass each).
") GProp_PGProps;
		 GProp_PGProps(const TColgp_Array1OfPnt & thePnts);

		/****** GProp_PGProps::GProp_PGProps ******/
		/****** md5 signature: 42263d4b0e6edc06c5a8541d2b71616a ******/
		%feature("compactdefaultargs") GProp_PGProps;
		%feature("autodoc", "
Parameters
----------
thePnts: TColgp_Array2OfPnt

Return
-------
None

Description
-----------
Creates a point set from a 2D array of points (unit mass each).
") GProp_PGProps;
		 GProp_PGProps(const TColgp_Array2OfPnt & thePnts);

		/****** GProp_PGProps::GProp_PGProps ******/
		/****** md5 signature: c77da662b918067ac1bef13b5aef061b ******/
		%feature("compactdefaultargs") GProp_PGProps;
		%feature("autodoc", "
Parameters
----------
thePnts: TColgp_Array1OfPnt
theDensity: TColStd_Array1OfReal

Return
-------
None

Description
-----------
Creates a point set from points and corresponding densities. 
Input parameter: thePnts point array 
Input parameter: theDensity per-point mass array (same length as thePnts) @throws Standard_DomainError if a density <= gp::Resolution() or if the arrays have different lengths.
") GProp_PGProps;
		 GProp_PGProps(const TColgp_Array1OfPnt & thePnts, const TColStd_Array1OfReal & theDensity);

		/****** GProp_PGProps::GProp_PGProps ******/
		/****** md5 signature: b473cab02cdbe519cd04907d2c4dd0d5 ******/
		%feature("compactdefaultargs") GProp_PGProps;
		%feature("autodoc", "
Parameters
----------
thePnts: TColgp_Array2OfPnt
theDensity: TColStd_Array2OfReal

Return
-------
None

Description
-----------
Creates a point set from 2D arrays of points and corresponding densities. 
Input parameter: thePnts point array 
Input parameter: theDensity per-point mass array (same dimensions as thePnts) @throws Standard_DomainError on dimension mismatch or non-positive density.
") GProp_PGProps;
		 GProp_PGProps(const TColgp_Array2OfPnt & thePnts, const TColStd_Array2OfReal & theDensity);

		/****** GProp_PGProps::AddPoint ******/
		/****** md5 signature: 6ed34d767ae674a2f121e86af56dbab3 ******/
		%feature("compactdefaultargs") AddPoint;
		%feature("autodoc", "
Parameters
----------
thePnt: gp_Pnt

Return
-------
None

Description
-----------
Adds a point with unit mass.
") AddPoint;
		void AddPoint(const gp_Pnt & thePnt);

		/****** GProp_PGProps::AddPoint ******/
		/****** md5 signature: 1c3814a48ae6df99875540c37e9d21ec ******/
		%feature("compactdefaultargs") AddPoint;
		%feature("autodoc", "
Parameters
----------
thePnt: gp_Pnt
theDensity: double

Return
-------
None

Description
-----------
Adds a point with a given mass. @throws Standard_DomainError if theDensity <= gp::Resolution().
") AddPoint;
		void AddPoint(const gp_Pnt & thePnt, double theDensity);

		/****** GProp_PGProps::Barycentre ******/
		/****** md5 signature: fe4ba47b818fd7ae6a740fc06f4fd5bd ******/
		%feature("compactdefaultargs") Barycentre;
		%feature("autodoc", "
Parameters
----------
thePnts: TColgp_Array1OfPnt

Return
-------
gp_Pnt

Description
-----------
Computes the barycentre of a set of points (unit mass).
") Barycentre;
		static gp_Pnt Barycentre(const TColgp_Array1OfPnt & thePnts);

		/****** GProp_PGProps::Barycentre ******/
		/****** md5 signature: ad8abbc9c32bc46b87e209258378ed7b ******/
		%feature("compactdefaultargs") Barycentre;
		%feature("autodoc", "
Parameters
----------
thePnts: TColgp_Array2OfPnt

Return
-------
gp_Pnt

Description
-----------
Computes the barycentre of a 2D array of points (unit mass).
") Barycentre;
		static gp_Pnt Barycentre(const TColgp_Array2OfPnt & thePnts);

		/****** GProp_PGProps::Barycentre ******/
		/****** md5 signature: 83a477436cea6b2b61d7535035dcfc24 ******/
		%feature("compactdefaultargs") Barycentre;
		%feature("autodoc", "
Parameters
----------
thePnts: TColgp_Array1OfPnt
theDensity: TColStd_Array1OfReal
theG: gp_Pnt

Return
-------
theMass: double

Description
-----------
Computes the weighted barycentre and total mass of a set of points. 
Input parameter: thePnts point array 
Input parameter: theDensity per-point mass array @param[out] theMass total mass (sum of densities) @param[out] theG weighted barycentre @throws Standard_DimensionError on length mismatch.
") Barycentre;
		static void Barycentre(const TColgp_Array1OfPnt & thePnts, const TColStd_Array1OfReal & theDensity, Standard_Real &OutValue, gp_Pnt & theG);

		/****** GProp_PGProps::Barycentre ******/
		/****** md5 signature: d2a4719c786bf59a8a47f2a2d90dfcaf ******/
		%feature("compactdefaultargs") Barycentre;
		%feature("autodoc", "
Parameters
----------
thePnts: TColgp_Array2OfPnt
theDensity: TColStd_Array2OfReal
theG: gp_Pnt

Return
-------
theMass: double

Description
-----------
Computes the weighted barycentre and total mass for a 2D point array. @throws Standard_DimensionError on dimension mismatch.
") Barycentre;
		static void Barycentre(const TColgp_Array2OfPnt & thePnts, const TColStd_Array2OfReal & theDensity, Standard_Real &OutValue, gp_Pnt & theG);

};


%extend GProp_PGProps {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************
* class GProp_SelGProps *
************************/
class GProp_SelGProps : public GProp_GProps {
	public:
		/****** GProp_SelGProps::GProp_SelGProps ******/
		/****** md5 signature: ccefe93bbfd3839c7140ce928a1b161b ******/
		%feature("compactdefaultargs") GProp_SelGProps;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") GProp_SelGProps;
		 GProp_SelGProps();

		/****** GProp_SelGProps::GProp_SelGProps ******/
		/****** md5 signature: 89a0c9c77d65065dd4513a7ccdec41c9 ******/
		%feature("compactdefaultargs") GProp_SelGProps;
		%feature("autodoc", "
Parameters
----------
S: gp_Cylinder
Alpha1: double
Alpha2: double
Z1: double
Z2: double
SLocation: gp_Pnt

Return
-------
None

Description
-----------
No available documentation.
") GProp_SelGProps;
		 GProp_SelGProps(const gp_Cylinder & S, const double Alpha1, const double Alpha2, const double Z1, const double Z2, const gp_Pnt & SLocation);

		/****** GProp_SelGProps::GProp_SelGProps ******/
		/****** md5 signature: fc77e9628d1d20aacd8616e644e1ad15 ******/
		%feature("compactdefaultargs") GProp_SelGProps;
		%feature("autodoc", "
Parameters
----------
S: gp_Cone
Alpha1: double
Alpha2: double
Z1: double
Z2: double
SLocation: gp_Pnt

Return
-------
None

Description
-----------
No available documentation.
") GProp_SelGProps;
		 GProp_SelGProps(const gp_Cone & S, const double Alpha1, const double Alpha2, const double Z1, const double Z2, const gp_Pnt & SLocation);

		/****** GProp_SelGProps::GProp_SelGProps ******/
		/****** md5 signature: 079fd34147110ec6c8fb1112aba19a32 ******/
		%feature("compactdefaultargs") GProp_SelGProps;
		%feature("autodoc", "
Parameters
----------
S: gp_Sphere
Teta1: double
Teta2: double
Alpha1: double
Alpha2: double
SLocation: gp_Pnt

Return
-------
None

Description
-----------
No available documentation.
") GProp_SelGProps;
		 GProp_SelGProps(const gp_Sphere & S, const double Teta1, const double Teta2, const double Alpha1, const double Alpha2, const gp_Pnt & SLocation);

		/****** GProp_SelGProps::GProp_SelGProps ******/
		/****** md5 signature: 450035a1da5c8a78c4d26a6f8cdcc742 ******/
		%feature("compactdefaultargs") GProp_SelGProps;
		%feature("autodoc", "
Parameters
----------
S: gp_Torus
Teta1: double
Teta2: double
Alpha1: double
Alpha2: double
SLocation: gp_Pnt

Return
-------
None

Description
-----------
No available documentation.
") GProp_SelGProps;
		 GProp_SelGProps(const gp_Torus & S, const double Teta1, const double Teta2, const double Alpha1, const double Alpha2, const gp_Pnt & SLocation);

		/****** GProp_SelGProps::Perform ******/
		/****** md5 signature: 899cc0d4c9781ee9e8f541b58d1ba309 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
S: gp_Cylinder
Alpha1: double
Alpha2: double
Z1: double
Z2: double

Return
-------
None

Description
-----------
No available documentation.
") Perform;
		void Perform(const gp_Cylinder & S, const double Alpha1, const double Alpha2, const double Z1, const double Z2);

		/****** GProp_SelGProps::Perform ******/
		/****** md5 signature: 0fda972d131210036f162035cb7602b3 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
S: gp_Cone
Alpha1: double
Alpha2: double
Z1: double
Z2: double

Return
-------
None

Description
-----------
No available documentation.
") Perform;
		void Perform(const gp_Cone & S, const double Alpha1, const double Alpha2, const double Z1, const double Z2);

		/****** GProp_SelGProps::Perform ******/
		/****** md5 signature: f79f35327b48e9598ffcfc75321142a4 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
S: gp_Sphere
Teta1: double
Teta2: double
Alpha1: double
Alpha2: double

Return
-------
None

Description
-----------
No available documentation.
") Perform;
		void Perform(const gp_Sphere & S, const double Teta1, const double Teta2, const double Alpha1, const double Alpha2);

		/****** GProp_SelGProps::Perform ******/
		/****** md5 signature: d988fe2ccee717dfc38d4410a32142ab ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
S: gp_Torus
Teta1: double
Teta2: double
Alpha1: double
Alpha2: double

Return
-------
None

Description
-----------
No available documentation.
") Perform;
		void Perform(const gp_Torus & S, const double Teta1, const double Teta2, const double Alpha1, const double Alpha2);

		/****** GProp_SelGProps::SetLocation ******/
		/****** md5 signature: 21f84731f7ae4a935b732f676863a0d9 ******/
		%feature("compactdefaultargs") SetLocation;
		%feature("autodoc", "
Parameters
----------
SLocation: gp_Pnt

Return
-------
None

Description
-----------
No available documentation.
") SetLocation;
		void SetLocation(const gp_Pnt & SLocation);

};


%extend GProp_SelGProps {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************
* class GProp_VelGProps *
************************/
class GProp_VelGProps : public GProp_GProps {
	public:
		/****** GProp_VelGProps::GProp_VelGProps ******/
		/****** md5 signature: 5c4cdc1f9c9e72630c7b5696957670bd ******/
		%feature("compactdefaultargs") GProp_VelGProps;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") GProp_VelGProps;
		 GProp_VelGProps();

		/****** GProp_VelGProps::GProp_VelGProps ******/
		/****** md5 signature: 103795447c019d6430985b53f321228b ******/
		%feature("compactdefaultargs") GProp_VelGProps;
		%feature("autodoc", "
Parameters
----------
S: gp_Cylinder
Alpha1: double
Alpha2: double
Z1: double
Z2: double
VLocation: gp_Pnt

Return
-------
None

Description
-----------
No available documentation.
") GProp_VelGProps;
		 GProp_VelGProps(const gp_Cylinder & S, const double Alpha1, const double Alpha2, const double Z1, const double Z2, const gp_Pnt & VLocation);

		/****** GProp_VelGProps::GProp_VelGProps ******/
		/****** md5 signature: 912047fd8d2ac566313c778252fc9c43 ******/
		%feature("compactdefaultargs") GProp_VelGProps;
		%feature("autodoc", "
Parameters
----------
S: gp_Cone
Alpha1: double
Alpha2: double
Z1: double
Z2: double
VLocation: gp_Pnt

Return
-------
None

Description
-----------
No available documentation.
") GProp_VelGProps;
		 GProp_VelGProps(const gp_Cone & S, const double Alpha1, const double Alpha2, const double Z1, const double Z2, const gp_Pnt & VLocation);

		/****** GProp_VelGProps::GProp_VelGProps ******/
		/****** md5 signature: 4f888be983e6ebd6fcfd66f1f58b981f ******/
		%feature("compactdefaultargs") GProp_VelGProps;
		%feature("autodoc", "
Parameters
----------
S: gp_Sphere
Teta1: double
Teta2: double
Alpha1: double
Alpha2: double
VLocation: gp_Pnt

Return
-------
None

Description
-----------
No available documentation.
") GProp_VelGProps;
		 GProp_VelGProps(const gp_Sphere & S, const double Teta1, const double Teta2, const double Alpha1, const double Alpha2, const gp_Pnt & VLocation);

		/****** GProp_VelGProps::GProp_VelGProps ******/
		/****** md5 signature: 65ce0221750e635a1b20cf34a1a5b825 ******/
		%feature("compactdefaultargs") GProp_VelGProps;
		%feature("autodoc", "
Parameters
----------
S: gp_Torus
Teta1: double
Teta2: double
Alpha1: double
Alpha2: double
VLocation: gp_Pnt

Return
-------
None

Description
-----------
No available documentation.
") GProp_VelGProps;
		 GProp_VelGProps(const gp_Torus & S, const double Teta1, const double Teta2, const double Alpha1, const double Alpha2, const gp_Pnt & VLocation);

		/****** GProp_VelGProps::Perform ******/
		/****** md5 signature: 899cc0d4c9781ee9e8f541b58d1ba309 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
S: gp_Cylinder
Alpha1: double
Alpha2: double
Z1: double
Z2: double

Return
-------
None

Description
-----------
No available documentation.
") Perform;
		void Perform(const gp_Cylinder & S, const double Alpha1, const double Alpha2, const double Z1, const double Z2);

		/****** GProp_VelGProps::Perform ******/
		/****** md5 signature: 0fda972d131210036f162035cb7602b3 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
S: gp_Cone
Alpha1: double
Alpha2: double
Z1: double
Z2: double

Return
-------
None

Description
-----------
No available documentation.
") Perform;
		void Perform(const gp_Cone & S, const double Alpha1, const double Alpha2, const double Z1, const double Z2);

		/****** GProp_VelGProps::Perform ******/
		/****** md5 signature: f79f35327b48e9598ffcfc75321142a4 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
S: gp_Sphere
Teta1: double
Teta2: double
Alpha1: double
Alpha2: double

Return
-------
None

Description
-----------
No available documentation.
") Perform;
		void Perform(const gp_Sphere & S, const double Teta1, const double Teta2, const double Alpha1, const double Alpha2);

		/****** GProp_VelGProps::Perform ******/
		/****** md5 signature: d988fe2ccee717dfc38d4410a32142ab ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
S: gp_Torus
Teta1: double
Teta2: double
Alpha1: double
Alpha2: double

Return
-------
None

Description
-----------
No available documentation.
") Perform;
		void Perform(const gp_Torus & S, const double Teta1, const double Teta2, const double Alpha1, const double Alpha2);

		/****** GProp_VelGProps::SetLocation ******/
		/****** md5 signature: 13648852ef1c389d29559ab743f5f9e2 ******/
		%feature("compactdefaultargs") SetLocation;
		%feature("autodoc", "
Parameters
----------
VLocation: gp_Pnt

Return
-------
None

Description
-----------
No available documentation.
") SetLocation;
		void SetLocation(const gp_Pnt & VLocation);

};


%extend GProp_VelGProps {
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
def gprop_HOperator(*args):
	return gprop.HOperator(*args)

@deprecated
def GProp_PGProps_Barycentre(*args):
	return GProp_PGProps.Barycentre(*args)

@deprecated
def GProp_PGProps_Barycentre(*args):
	return GProp_PGProps.Barycentre(*args)

@deprecated
def GProp_PGProps_Barycentre(*args):
	return GProp_PGProps.Barycentre(*args)

@deprecated
def GProp_PGProps_Barycentre(*args):
	return GProp_PGProps.Barycentre(*args)

}
