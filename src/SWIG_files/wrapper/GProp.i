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
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import gp.i

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
typedef PointSetLib_Equation GProp_PEquation;
typedef PointSetLib_Props GProp_PGProps;
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
The origin (0, 0, 0) of the absolute cartesian coordinate system is used to compute the global properties.
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
The point SystemLocation is used to compute the global properties of the system. For more accuracy it is better to define this point closed to the location of the system. For example it could be a point around the centre of mass of the system. This point is referred to as the reference point for this framework. For greater accuracy it is better for the reference point to be close to the location of the system. It can, for example, be a point near the center of mass of the system. At initialization, the framework is empty; i.e. it retains no dimensional information such as mass, or inertia. However, it is now able to bring together global properties of various other systems, whose global properties have already been computed using another framework. To do this, use the function Add to define the components of the system. Use it once per component of the system, and then use the interrogation functions available to access the computed values.
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
Either - initializes the global properties retained by this framework from those retained by the framework Item, or - brings together the global properties still retained by this framework with those retained by the framework Item. The value Density, which is 1.0 by default, is used as the density of the system analysed by Item. Sometimes the density will have already been given at the time of construction of the framework Item. This may be the case for example, if Item is a GProp_PGProps framework built to compute the global properties of a set of points ; or another GProp_GProps object which already retains composite global properties. In these cases the real density was perhaps already taken into account at the time of construction of Item. Note that this is not checked: if the density of parts of the system is taken into account two or more times, results of the computation will be false. Notes: - The point relative to which the inertia of Item is computed (i.e. the reference point of Item) may be different from the reference point in this framework. Huygens' theorem is applied automatically to transfer inertia values to the reference point in this framework. - The function Add is used once per component of the system. After that, you use the interrogation functions available to access values computed for the system. - The system whose global properties are already brought together by this framework is referred to as the current system. However, the current system is not retained by this framework, which maintains only its global properties. Exceptions Standard_DomainError if Density is less than or equal to gp::Resolution().
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
Returns the center of mass of the current system. If the gravitational field is uniform, it is the center of gravity. The coordinates returned for the center of mass are expressed in the absolute Cartesian coordinate system.
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
Returns the mass of the current system. If no density is attached to the components of the current system the returned value corresponds to: - the total length of the edges of the current system if this framework retains only linear properties, as is the case for example, when using only the LinearProperties function to combine properties of lines from shapes, or - the total area of the faces of the current system if this framework retains only surface properties, as is the case for example, when using only the SurfaceProperties function to combine properties of surfaces from shapes, or - the total volume of the solids of the current system if this framework retains only volume properties, as is the case for example, when using only the VolumeProperties function to combine properties of volumes from solids. Warning A length, an area, or a volume is computed in the current data unit system. The mass of a single object is obtained by multiplying its length, its area or its volume by the given density. You must be consistent with respect to the units used.
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
returns the matrix of inertia. It is a symmetrical matrix. The coefficients of the matrix are the quadratic moments of inertia. //! | Ixx Ixy Ixz | matrix = | Ixy Iyy Iyz | | Ixz Iyz Izz | //! The moments of inertia are denoted by Ixx, Iyy, Izz. The products of inertia are denoted by Ixy, Ixz, Iyz. The matrix of inertia is returned in the central coordinate system (G, Gx, Gy, Gz) where G is the centre of mass of the system and Gx, Gy, Gz the directions parallel to the X(1,0,0) Y(0,1,0) Z(0,0,1) directions of the absolute cartesian coordinate system. It is possible to compute the matrix of inertia at another location point using the Huyghens theorem (you can use the method of package GProp: HOperator).
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
computes the moment of inertia of the material system about the axis A.
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
Computes the principal properties of inertia of the current system. There is always a set of axes for which the products of inertia of a geometric system are equal to 0; i.e. the matrix of inertia of the system is diagonal. These axes are the principal axes of inertia. Their origin is coincident with the center of mass of the system. The associated moments are called the principal moments of inertia. This function computes the eigen values and the eigen vectors of the matrix of inertia of the system. Results are stored by using a presentation framework of principal properties of inertia (GProp_PrincipalProps object) which may be queried to access the value sought.
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
Returns Ix, Iy, Iz, the static moments of inertia of the current system; i.e. the moments of inertia about the three axes of the Cartesian coordinate system.
") StaticMoments;
		void StaticMoments(Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

};


%extend GProp_GProps {
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

}
