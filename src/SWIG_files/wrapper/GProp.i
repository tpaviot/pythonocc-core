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
enum GProp_EquaType {
	GProp_Plane = 0,
	GProp_Line = 1,
	GProp_Point = 2,
	GProp_Space = 3,
	GProp_None = 4,
};

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

class GProp_EquaType(IntEnum):
	GProp_Plane = 0
	GProp_Line = 1
	GProp_Point = 2
	GProp_Space = 3
	GProp_None = 4
GProp_Plane = GProp_EquaType.GProp_Plane
GProp_Line = GProp_EquaType.GProp_Line
GProp_Point = GProp_EquaType.GProp_Point
GProp_Space = GProp_EquaType.GProp_Space
GProp_None = GProp_EquaType.GProp_None

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
		/****** md5 signature: a466dd40c73cd64b8fa1fa939a38baea ******/
		%feature("compactdefaultargs") HOperator;
		%feature("autodoc", "
Parameters
----------
G: gp_Pnt
Q: gp_Pnt
Mass: float
Operator: gp_Mat

Return
-------
None

Description
-----------
methods of package Computes the matrix Operator, referred to as the 'Huyghens Operator' of a geometric system at the point Q of the space, using the following data: - Mass, i.e. the mass of the system, - G, the center of mass of the system. The 'Huyghens Operator' is used to compute Inertia/Q, the matrix of inertia of the system at the point Q using Huyghens' theorem: Inertia/Q = Inertia/G + HOperator (Q, G, Mass) where Inertia/G is the matrix of inertia of the system relative to its center of mass as returned by the function MatrixOfInertia on any GProp_GProps object.
") HOperator;
		static void HOperator(const gp_Pnt & G, const gp_Pnt & Q, const Standard_Real Mass, gp_Mat & Operator);

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
		/****** md5 signature: 8e1a98d9439da447f111534a87af8a49 ******/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "
Parameters
----------
Item: GProp_GProps
Density: float (optional, default to 1.0)

Return
-------
None

Description
-----------
Either - initializes the global properties retained by this framework from those retained by the framework Item, or - brings together the global properties still retained by this framework with those retained by the framework Item. The value Density, which is 1.0 by default, is used as the density of the system analysed by Item. Sometimes the density will have already been given at the time of construction of the framework Item. This may be the case for example, if Item is a GProp_PGProps framework built to compute the global properties of a set of points ; or another GProp_GProps object which already retains composite global properties. In these cases the real density was perhaps already taken into account at the time of construction of Item. Note that this is not checked: if the density of parts of the system is taken into account two or more times, results of the computation will be false. Notes: - The point relative to which the inertia of Item is computed (i.e. the reference point of Item) may be different from the reference point in this framework. Huygens' theorem is applied automatically to transfer inertia values to the reference point in this framework. - The function Add is used once per component of the system. After that, you use the interrogation functions available to access values computed for the system. - The system whose global properties are already brought together by this framework is referred to as the current system. However, the current system is not retained by this framework, which maintains only its global properties. Exceptions Standard_DomainError if Density is less than or equal to gp::Resolution().
") Add;
		void Add(const GProp_GProps & Item, const Standard_Real Density = 1.0);

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
		/****** md5 signature: 83051d7e192d0c36782eba6ee49a8a36 ******/
		%feature("compactdefaultargs") Mass;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns the mass of the current system. If no density is attached to the components of the current system the returned value corresponds to: - the total length of the edges of the current system if this framework retains only linear properties, as is the case for example, when using only the LinearProperties function to combine properties of lines from shapes, or - the total area of the faces of the current system if this framework retains only surface properties, as is the case for example, when using only the SurfaceProperties function to combine properties of surfaces from shapes, or - the total volume of the solids of the current system if this framework retains only volume properties, as is the case for example, when using only the VolumeProperties function to combine properties of volumes from solids. Warning A length, an area, or a volume is computed in the current data unit system. The mass of a single object is obtained by multiplying its length, its area or its volume by the given density. You must be consistent with respect to the units used.
") Mass;
		Standard_Real Mass();

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
		/****** md5 signature: 4bb9b5f6aa9cb432a016a427eb6652ac ******/
		%feature("compactdefaultargs") MomentOfInertia;
		%feature("autodoc", "
Parameters
----------
A: gp_Ax1

Return
-------
float

Description
-----------
computes the moment of inertia of the material system about the axis A.
") MomentOfInertia;
		Standard_Real MomentOfInertia(const gp_Ax1 & A);

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
		/****** md5 signature: 79bfb57014f564d130074f689b492ef4 ******/
		%feature("compactdefaultargs") RadiusOfGyration;
		%feature("autodoc", "
Parameters
----------
A: gp_Ax1

Return
-------
float

Description
-----------
Returns the radius of gyration of the current system about the axis A.
") RadiusOfGyration;
		Standard_Real RadiusOfGyration(const gp_Ax1 & A);

		/****** GProp_GProps::StaticMoments ******/
		/****** md5 signature: 0890040a9dc262c29a0c933318eacd9e ******/
		%feature("compactdefaultargs") StaticMoments;
		%feature("autodoc", "
Parameters
----------

Return
-------
Ix: float
Iy: float
Iz: float

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

/************************
* class GProp_PEquation *
************************/
class GProp_PEquation {
	public:
		/****** GProp_PEquation::GProp_PEquation ******/
		/****** md5 signature: a71eb2d5280cc2a6390e01f9682fd56d ******/
		%feature("compactdefaultargs") GProp_PEquation;
		%feature("autodoc", "
Parameters
----------
Pnts: TColgp_Array1OfPnt
Tol: float

Return
-------
None

Description
-----------
Constructs a framework to analyze the collection of points Pnts and computes: - the mean point if the points in question are considered to be coincident within the precision Tol, or - the mean line if they are considered to be collinear within the precision Tol, or - the mean plane if they are considered to be coplanar within the precision Tol, or - the minimal box which contains all the points. Use: - the functions IsPoint, IsLinear, IsPlanar and IsSpace to find the result of the analysis, and - the function Point, Line, Plane or Box to access the computed result.
") GProp_PEquation;
		 GProp_PEquation(const TColgp_Array1OfPnt & Pnts, const Standard_Real Tol);

		/****** GProp_PEquation::Box ******/
		/****** md5 signature: bca19c1c14c56e681bd9167cd56c0774 ******/
		%feature("compactdefaultargs") Box;
		%feature("autodoc", "
Parameters
----------
P: gp_Pnt
V1: gp_Vec
V2: gp_Vec
V3: gp_Vec

Return
-------
None

Description
-----------
Returns the definition of the smallest box which contains all the points analyzed by this framework if, according to the given precision value, the points are considered to be neither coincident, nor collinear and nor coplanar. This box is centered on the barycenter P of the collection of points. Its sides are parallel to the three vectors V1, V2 and V3, the length of which is the length of the box in the corresponding direction. Note: Vectors V1, V2 and V3 are parallel to the three axes of principal inertia of the system composed of the collection of points where each point is of equal mass. Exceptions Standard_NoSuchObject if, according to the given precision, the points analyzed by this framework are considered to be coincident, collinear or coplanar.
") Box;
		void Box(gp_Pnt & P, gp_Vec & V1, gp_Vec & V2, gp_Vec & V3);

		/****** GProp_PEquation::IsLinear ******/
		/****** md5 signature: 89acec5ff8595f84f569d04cc9ef001b ******/
		%feature("compactdefaultargs") IsLinear;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if, according to the given tolerance, the points analyzed by this framework are colinear. Use the function Line to access the computed result.
") IsLinear;
		Standard_Boolean IsLinear();

		/****** GProp_PEquation::IsPlanar ******/
		/****** md5 signature: c4cb6ad82acdd7a7d12e9af1bea21482 ******/
		%feature("compactdefaultargs") IsPlanar;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if, according to the given tolerance, the points analyzed by this framework are coplanar. Use the function Plane to access the computed result.
") IsPlanar;
		Standard_Boolean IsPlanar();

		/****** GProp_PEquation::IsPoint ******/
		/****** md5 signature: 64dc7ed350d49695713d262fc8866a96 ******/
		%feature("compactdefaultargs") IsPoint;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if, according to the given tolerance, the points analyzed by this framework are coincident. Use the function Point to access the computed result.
") IsPoint;
		Standard_Boolean IsPoint();

		/****** GProp_PEquation::IsSpace ******/
		/****** md5 signature: 84400c28862f8e38d2c6859e84d6cce5 ******/
		%feature("compactdefaultargs") IsSpace;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if, according to the given tolerance value, the points analyzed by this framework are neither coincident, nor collinear, nor coplanar. Use the function Box to query the smallest box that includes the collection of points.
") IsSpace;
		Standard_Boolean IsSpace();

		/****** GProp_PEquation::Line ******/
		/****** md5 signature: 63e1fa189ca3bcfdb401241217a93bfb ******/
		%feature("compactdefaultargs") Line;
		%feature("autodoc", "Return
-------
gp_Lin

Description
-----------
Returns the mean line passing near all the points analyzed by this framework if, according to the given precision value, the points are considered to be collinear. Exceptions Standard_NoSuchObject if, according to the given precision, the points analyzed by this framework are considered to be: - coincident, or - not collinear.
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
Returns the mean plane passing near all the points analyzed by this framework if, according to the given precision, the points are considered to be coplanar. Exceptions Standard_NoSuchObject if, according to the given precision value, the points analyzed by this framework are considered to be: - coincident, or - collinear, or - not coplanar.
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
Returns the mean point of all the points analyzed by this framework if, according to the given precision, the points are considered to be coincident. Exceptions Standard_NoSuchObject if, according to the given precision, the points analyzed by this framework are not considered to be coincident.
") Point;
		gp_Pnt Point();

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
		/****** md5 signature: 6cae14e0c77332299f80fd61f6967d42 ******/
		%feature("compactdefaultargs") HasSymmetryAxis;
		%feature("autodoc", "Return
-------
bool

Description
-----------
returns true if the geometric system has an axis of symmetry. For comparing moments relative tolerance 1.e-10 is used. Usually it is enough for objects, restricted by faces with analytical geometry.
") HasSymmetryAxis;
		Standard_Boolean HasSymmetryAxis();

		/****** GProp_PrincipalProps::HasSymmetryAxis ******/
		/****** md5 signature: 0aa705126b824246c5a299d56663b6c9 ******/
		%feature("compactdefaultargs") HasSymmetryAxis;
		%feature("autodoc", "
Parameters
----------
aTol: float

Return
-------
bool

Description
-----------
returns true if the geometric system has an axis of symmetry. aTol is relative tolerance for checking equality of moments If aTol == 0, relative tolerance is ~ 1.e-16 (Epsilon(I)).
") HasSymmetryAxis;
		Standard_Boolean HasSymmetryAxis(const Standard_Real aTol);

		/****** GProp_PrincipalProps::HasSymmetryPoint ******/
		/****** md5 signature: 3e2a65c11bbd13e34d348df47540c2dc ******/
		%feature("compactdefaultargs") HasSymmetryPoint;
		%feature("autodoc", "Return
-------
bool

Description
-----------
returns true if the geometric system has a point of symmetry. For comparing moments relative tolerance 1.e-10 is used. Usually it is enough for objects, restricted by faces with analytical geometry.
") HasSymmetryPoint;
		Standard_Boolean HasSymmetryPoint();

		/****** GProp_PrincipalProps::HasSymmetryPoint ******/
		/****** md5 signature: fbe20b9573893063e40615b48635d22a ******/
		%feature("compactdefaultargs") HasSymmetryPoint;
		%feature("autodoc", "
Parameters
----------
aTol: float

Return
-------
bool

Description
-----------
returns true if the geometric system has a point of symmetry. aTol is relative tolerance for checking equality of moments If aTol == 0, relative tolerance is ~ 1.e-16 (Epsilon(I)).
") HasSymmetryPoint;
		Standard_Boolean HasSymmetryPoint(const Standard_Real aTol);

		/****** GProp_PrincipalProps::Moments ******/
		/****** md5 signature: d751b72efb004ed33a0c2f0bf791fd13 ******/
		%feature("compactdefaultargs") Moments;
		%feature("autodoc", "
Parameters
----------

Return
-------
Ixx: float
Iyy: float
Izz: float

Description
-----------
Ixx, Iyy and Izz return the principal moments of inertia in the current system. Notes: - If the current system has an axis of symmetry, two of the three values Ixx, Iyy and Izz are equal. They indicate which eigen vectors define an infinity of axes of principal inertia. - If the current system has a center of symmetry, Ixx, Iyy and Izz are equal.
") Moments;
		void Moments(Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** GProp_PrincipalProps::RadiusOfGyration ******/
		/****** md5 signature: 910d4031dd34fe6a2998ad550f095e42 ******/
		%feature("compactdefaultargs") RadiusOfGyration;
		%feature("autodoc", "
Parameters
----------

Return
-------
Rxx: float
Ryy: float
Rzz: float

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
		/****** md5 signature: 38783d313f12cce818e6fe31c9e7ce61 ******/
		%feature("compactdefaultargs") GProp_CelGProps;
		%feature("autodoc", "
Parameters
----------
C: gp_Circ
U1: float
U2: float
CLocation: gp_Pnt

Return
-------
None

Description
-----------
No available documentation.
") GProp_CelGProps;
		 GProp_CelGProps(const gp_Circ & C, const Standard_Real U1, const Standard_Real U2, const gp_Pnt & CLocation);

		/****** GProp_CelGProps::GProp_CelGProps ******/
		/****** md5 signature: af3236e24bbb4154f760035b31468103 ******/
		%feature("compactdefaultargs") GProp_CelGProps;
		%feature("autodoc", "
Parameters
----------
C: gp_Lin
U1: float
U2: float
CLocation: gp_Pnt

Return
-------
None

Description
-----------
No available documentation.
") GProp_CelGProps;
		 GProp_CelGProps(const gp_Lin & C, const Standard_Real U1, const Standard_Real U2, const gp_Pnt & CLocation);

		/****** GProp_CelGProps::Perform ******/
		/****** md5 signature: 555bf1d19cee19166e3b252af5a382c3 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
C: gp_Circ
U1: float
U2: float

Return
-------
None

Description
-----------
No available documentation.
") Perform;
		void Perform(const gp_Circ & C, const Standard_Real U1, const Standard_Real U2);

		/****** GProp_CelGProps::Perform ******/
		/****** md5 signature: 4da414c18b71ead967da2733b859a03c ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
C: gp_Lin
U1: float
U2: float

Return
-------
None

Description
-----------
No available documentation.
") Perform;
		void Perform(const gp_Lin & C, const Standard_Real U1, const Standard_Real U2);

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
Initializes a framework to compute global properties on a set of points. The point relative to which the inertia of the system is computed will be the origin (0, 0, 0) of the absolute Cartesian coordinate system. At initialization, the framework is empty, i.e. it retains no dimensional information such as mass and inertia. It is, however, now able to keep global properties of a set of points while new points are added using the AddPoint function. The set of points whose global properties are brought together by this framework will then be referred to as the current system. The current system is, however, not kept by this framework, which only keeps that system's global properties. Note that the current system may be more complex than a set of points.
") GProp_PGProps;
		 GProp_PGProps();

		/****** GProp_PGProps::GProp_PGProps ******/
		/****** md5 signature: abf710bab7da008bfddba4ddda2de6d3 ******/
		%feature("compactdefaultargs") GProp_PGProps;
		%feature("autodoc", "
Parameters
----------
Pnts: TColgp_Array1OfPnt

Return
-------
None

Description
-----------
computes the global properties of the system of points Pnts. The density of the points are defaulted to all being 1.
") GProp_PGProps;
		 GProp_PGProps(const TColgp_Array1OfPnt & Pnts);

		/****** GProp_PGProps::GProp_PGProps ******/
		/****** md5 signature: 22cf856957e5f48db792928ade5c3b83 ******/
		%feature("compactdefaultargs") GProp_PGProps;
		%feature("autodoc", "
Parameters
----------
Pnts: TColgp_Array2OfPnt

Return
-------
None

Description
-----------
computes the global properties of the system of points Pnts. The density of the points are defaulted to all being 1.
") GProp_PGProps;
		 GProp_PGProps(const TColgp_Array2OfPnt & Pnts);

		/****** GProp_PGProps::GProp_PGProps ******/
		/****** md5 signature: 19027229461ec4bd6cbd93a14f0400ac ******/
		%feature("compactdefaultargs") GProp_PGProps;
		%feature("autodoc", "
Parameters
----------
Pnts: TColgp_Array1OfPnt
Density: TColStd_Array1OfReal

Return
-------
None

Description
-----------
computes the global properties of the system of points Pnts. A density is associated with each point. //! raises if a density is lower or equal to Resolution from package gp. //! raises if the length of Pnts and the length of Density is not the same.
") GProp_PGProps;
		 GProp_PGProps(const TColgp_Array1OfPnt & Pnts, const TColStd_Array1OfReal & Density);

		/****** GProp_PGProps::GProp_PGProps ******/
		/****** md5 signature: c52133b8dd3a294376b3f080a67615a2 ******/
		%feature("compactdefaultargs") GProp_PGProps;
		%feature("autodoc", "
Parameters
----------
Pnts: TColgp_Array2OfPnt
Density: TColStd_Array2OfReal

Return
-------
None

Description
-----------
computes the global properties of the system of points Pnts. A density is associated with each point. //! Raised if a density is lower or equal to Resolution from package gp. //! Raised if the length of Pnts and the length of Density is not the same.
") GProp_PGProps;
		 GProp_PGProps(const TColgp_Array2OfPnt & Pnts, const TColStd_Array2OfReal & Density);

		/****** GProp_PGProps::AddPoint ******/
		/****** md5 signature: 2ea2f551e1b5581fc41aa89fc11778ff ******/
		%feature("compactdefaultargs") AddPoint;
		%feature("autodoc", "
Parameters
----------
P: gp_Pnt

Return
-------
None

Description
-----------
Brings together the global properties already retained by this framework with those induced by the point Pnt. Pnt may be the first point of the current system. A point mass is attached to the point Pnt, it is either equal to 1. or to Density.
") AddPoint;
		void AddPoint(const gp_Pnt & P);

		/****** GProp_PGProps::AddPoint ******/
		/****** md5 signature: c2da05cb4a50d8302a14e112037bc3ac ******/
		%feature("compactdefaultargs") AddPoint;
		%feature("autodoc", "
Parameters
----------
P: gp_Pnt
Density: float

Return
-------
None

Description
-----------
Adds a new point P with its density in the system of points Exceptions Standard_DomainError if the mass value Density is less than gp::Resolution().
") AddPoint;
		void AddPoint(const gp_Pnt & P, const Standard_Real Density);

		/****** GProp_PGProps::Barycentre ******/
		/****** md5 signature: afb1594aad3296cbfc54bcd81423481c ******/
		%feature("compactdefaultargs") Barycentre;
		%feature("autodoc", "
Parameters
----------
Pnts: TColgp_Array1OfPnt

Return
-------
gp_Pnt

Description
-----------
Computes the barycentre of a set of points. The density of the points is defaulted to 1.
") Barycentre;
		static gp_Pnt Barycentre(const TColgp_Array1OfPnt & Pnts);

		/****** GProp_PGProps::Barycentre ******/
		/****** md5 signature: a4a2c81c86f4e8f3daa4540c1d9b477e ******/
		%feature("compactdefaultargs") Barycentre;
		%feature("autodoc", "
Parameters
----------
Pnts: TColgp_Array2OfPnt

Return
-------
gp_Pnt

Description
-----------
Computes the barycentre of a set of points. The density of the points is defaulted to 1.
") Barycentre;
		static gp_Pnt Barycentre(const TColgp_Array2OfPnt & Pnts);

		/****** GProp_PGProps::Barycentre ******/
		/****** md5 signature: 4cbbe613dac041dade2fdba9d8a337bb ******/
		%feature("compactdefaultargs") Barycentre;
		%feature("autodoc", "
Parameters
----------
Pnts: TColgp_Array1OfPnt
Density: TColStd_Array1OfReal
G: gp_Pnt

Return
-------
Mass: float

Description
-----------
Computes the barycentre of a set of points. A density is associated with each point. //! raises if a density is lower or equal to Resolution from package gp. //! Raised if the length of Pnts and the length of Density is not the same.
") Barycentre;
		static void Barycentre(const TColgp_Array1OfPnt & Pnts, const TColStd_Array1OfReal & Density, Standard_Real &OutValue, gp_Pnt & G);

		/****** GProp_PGProps::Barycentre ******/
		/****** md5 signature: be82701e70a85d3bb53cea92cc45e64c ******/
		%feature("compactdefaultargs") Barycentre;
		%feature("autodoc", "
Parameters
----------
Pnts: TColgp_Array2OfPnt
Density: TColStd_Array2OfReal
G: gp_Pnt

Return
-------
Mass: float

Description
-----------
Computes the barycentre of a set of points. A density is associated with each point. //! Raised if a density is lower or equal to Resolution from package gp. //! Raised if the length of Pnts and the length of Density is not the same.
") Barycentre;
		static void Barycentre(const TColgp_Array2OfPnt & Pnts, const TColStd_Array2OfReal & Density, Standard_Real &OutValue, gp_Pnt & G);

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
		/****** md5 signature: 249d8eb1fe3627f6288f686c878caf29 ******/
		%feature("compactdefaultargs") GProp_SelGProps;
		%feature("autodoc", "
Parameters
----------
S: gp_Cylinder
Alpha1: float
Alpha2: float
Z1: float
Z2: float
SLocation: gp_Pnt

Return
-------
None

Description
-----------
No available documentation.
") GProp_SelGProps;
		 GProp_SelGProps(const gp_Cylinder & S, const Standard_Real Alpha1, const Standard_Real Alpha2, const Standard_Real Z1, const Standard_Real Z2, const gp_Pnt & SLocation);

		/****** GProp_SelGProps::GProp_SelGProps ******/
		/****** md5 signature: 00ae919f928823371930530d7e69742a ******/
		%feature("compactdefaultargs") GProp_SelGProps;
		%feature("autodoc", "
Parameters
----------
S: gp_Cone
Alpha1: float
Alpha2: float
Z1: float
Z2: float
SLocation: gp_Pnt

Return
-------
None

Description
-----------
No available documentation.
") GProp_SelGProps;
		 GProp_SelGProps(const gp_Cone & S, const Standard_Real Alpha1, const Standard_Real Alpha2, const Standard_Real Z1, const Standard_Real Z2, const gp_Pnt & SLocation);

		/****** GProp_SelGProps::GProp_SelGProps ******/
		/****** md5 signature: be51388a1e65300cd33232dbd0111762 ******/
		%feature("compactdefaultargs") GProp_SelGProps;
		%feature("autodoc", "
Parameters
----------
S: gp_Sphere
Teta1: float
Teta2: float
Alpha1: float
Alpha2: float
SLocation: gp_Pnt

Return
-------
None

Description
-----------
No available documentation.
") GProp_SelGProps;
		 GProp_SelGProps(const gp_Sphere & S, const Standard_Real Teta1, const Standard_Real Teta2, const Standard_Real Alpha1, const Standard_Real Alpha2, const gp_Pnt & SLocation);

		/****** GProp_SelGProps::GProp_SelGProps ******/
		/****** md5 signature: 2c50c2f68d34d7cbfc89381c3fc4e2a6 ******/
		%feature("compactdefaultargs") GProp_SelGProps;
		%feature("autodoc", "
Parameters
----------
S: gp_Torus
Teta1: float
Teta2: float
Alpha1: float
Alpha2: float
SLocation: gp_Pnt

Return
-------
None

Description
-----------
No available documentation.
") GProp_SelGProps;
		 GProp_SelGProps(const gp_Torus & S, const Standard_Real Teta1, const Standard_Real Teta2, const Standard_Real Alpha1, const Standard_Real Alpha2, const gp_Pnt & SLocation);

		/****** GProp_SelGProps::Perform ******/
		/****** md5 signature: aa88246a465af78e2a092355ba6a2945 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
S: gp_Cylinder
Alpha1: float
Alpha2: float
Z1: float
Z2: float

Return
-------
None

Description
-----------
No available documentation.
") Perform;
		void Perform(const gp_Cylinder & S, const Standard_Real Alpha1, const Standard_Real Alpha2, const Standard_Real Z1, const Standard_Real Z2);

		/****** GProp_SelGProps::Perform ******/
		/****** md5 signature: bdd366e6e7778deb047f954433ea9245 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
S: gp_Cone
Alpha1: float
Alpha2: float
Z1: float
Z2: float

Return
-------
None

Description
-----------
No available documentation.
") Perform;
		void Perform(const gp_Cone & S, const Standard_Real Alpha1, const Standard_Real Alpha2, const Standard_Real Z1, const Standard_Real Z2);

		/****** GProp_SelGProps::Perform ******/
		/****** md5 signature: a2de47315a8157c82ade74d8de910c63 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
S: gp_Sphere
Teta1: float
Teta2: float
Alpha1: float
Alpha2: float

Return
-------
None

Description
-----------
No available documentation.
") Perform;
		void Perform(const gp_Sphere & S, const Standard_Real Teta1, const Standard_Real Teta2, const Standard_Real Alpha1, const Standard_Real Alpha2);

		/****** GProp_SelGProps::Perform ******/
		/****** md5 signature: a8e736a1b9510a0d2fd1bd51e7f224cb ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
S: gp_Torus
Teta1: float
Teta2: float
Alpha1: float
Alpha2: float

Return
-------
None

Description
-----------
No available documentation.
") Perform;
		void Perform(const gp_Torus & S, const Standard_Real Teta1, const Standard_Real Teta2, const Standard_Real Alpha1, const Standard_Real Alpha2);

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
		/****** md5 signature: 59ad9f8ff3c1764bb28d04eccb8b5d38 ******/
		%feature("compactdefaultargs") GProp_VelGProps;
		%feature("autodoc", "
Parameters
----------
S: gp_Cylinder
Alpha1: float
Alpha2: float
Z1: float
Z2: float
VLocation: gp_Pnt

Return
-------
None

Description
-----------
No available documentation.
") GProp_VelGProps;
		 GProp_VelGProps(const gp_Cylinder & S, const Standard_Real Alpha1, const Standard_Real Alpha2, const Standard_Real Z1, const Standard_Real Z2, const gp_Pnt & VLocation);

		/****** GProp_VelGProps::GProp_VelGProps ******/
		/****** md5 signature: dda3738b390cd4869b6e608a2940917f ******/
		%feature("compactdefaultargs") GProp_VelGProps;
		%feature("autodoc", "
Parameters
----------
S: gp_Cone
Alpha1: float
Alpha2: float
Z1: float
Z2: float
VLocation: gp_Pnt

Return
-------
None

Description
-----------
No available documentation.
") GProp_VelGProps;
		 GProp_VelGProps(const gp_Cone & S, const Standard_Real Alpha1, const Standard_Real Alpha2, const Standard_Real Z1, const Standard_Real Z2, const gp_Pnt & VLocation);

		/****** GProp_VelGProps::GProp_VelGProps ******/
		/****** md5 signature: 74903c77eb4bb2b9272585917114a353 ******/
		%feature("compactdefaultargs") GProp_VelGProps;
		%feature("autodoc", "
Parameters
----------
S: gp_Sphere
Teta1: float
Teta2: float
Alpha1: float
Alpha2: float
VLocation: gp_Pnt

Return
-------
None

Description
-----------
No available documentation.
") GProp_VelGProps;
		 GProp_VelGProps(const gp_Sphere & S, const Standard_Real Teta1, const Standard_Real Teta2, const Standard_Real Alpha1, const Standard_Real Alpha2, const gp_Pnt & VLocation);

		/****** GProp_VelGProps::GProp_VelGProps ******/
		/****** md5 signature: 928d6d86eeb2451197b858dae60e1c62 ******/
		%feature("compactdefaultargs") GProp_VelGProps;
		%feature("autodoc", "
Parameters
----------
S: gp_Torus
Teta1: float
Teta2: float
Alpha1: float
Alpha2: float
VLocation: gp_Pnt

Return
-------
None

Description
-----------
No available documentation.
") GProp_VelGProps;
		 GProp_VelGProps(const gp_Torus & S, const Standard_Real Teta1, const Standard_Real Teta2, const Standard_Real Alpha1, const Standard_Real Alpha2, const gp_Pnt & VLocation);

		/****** GProp_VelGProps::Perform ******/
		/****** md5 signature: aa88246a465af78e2a092355ba6a2945 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
S: gp_Cylinder
Alpha1: float
Alpha2: float
Z1: float
Z2: float

Return
-------
None

Description
-----------
No available documentation.
") Perform;
		void Perform(const gp_Cylinder & S, const Standard_Real Alpha1, const Standard_Real Alpha2, const Standard_Real Z1, const Standard_Real Z2);

		/****** GProp_VelGProps::Perform ******/
		/****** md5 signature: bdd366e6e7778deb047f954433ea9245 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
S: gp_Cone
Alpha1: float
Alpha2: float
Z1: float
Z2: float

Return
-------
None

Description
-----------
No available documentation.
") Perform;
		void Perform(const gp_Cone & S, const Standard_Real Alpha1, const Standard_Real Alpha2, const Standard_Real Z1, const Standard_Real Z2);

		/****** GProp_VelGProps::Perform ******/
		/****** md5 signature: a2de47315a8157c82ade74d8de910c63 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
S: gp_Sphere
Teta1: float
Teta2: float
Alpha1: float
Alpha2: float

Return
-------
None

Description
-----------
No available documentation.
") Perform;
		void Perform(const gp_Sphere & S, const Standard_Real Teta1, const Standard_Real Teta2, const Standard_Real Alpha1, const Standard_Real Alpha2);

		/****** GProp_VelGProps::Perform ******/
		/****** md5 signature: a8e736a1b9510a0d2fd1bd51e7f224cb ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
S: gp_Torus
Teta1: float
Teta2: float
Alpha1: float
Alpha2: float

Return
-------
None

Description
-----------
No available documentation.
") Perform;
		void Perform(const gp_Torus & S, const Standard_Real Teta1, const Standard_Real Teta2, const Standard_Real Alpha1, const Standard_Real Alpha2);

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
