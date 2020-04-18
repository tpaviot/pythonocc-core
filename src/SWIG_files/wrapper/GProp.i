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
%define GPROPDOCSTRING
"GProp module, see official documentation at
https://www.opencascade.com/doc/occt-7.4.0/refman/html/package_gprop.html"
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
%include ../common/Operators.i
%include ../common/OccHandle.i


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

/* python proy classes for enums */
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
		/****************** HOperator ******************/
		%feature("compactdefaultargs") HOperator;
		%feature("autodoc", "Methods of package computes the matrix operator, referred to as the 'huyghens operator' of a geometric system at the point q of the space, using the following data : - mass, i.e. the mass of the system, - g, the center of mass of the system. the 'huyghens operator' is used to compute inertia/q, the matrix of inertia of the system at the point q using huyghens' theorem : inertia/q = inertia/g + hoperator (q, g, mass) where inertia/g is the matrix of inertia of the system relative to its center of mass as returned by the function matrixofinertia on any gprop_gprops object.

Parameters
----------
G: gp_Pnt
Q: gp_Pnt
Mass: float
Operator: gp_Mat

Returns
-------
None
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
		/****************** GProp_GProps ******************/
		%feature("compactdefaultargs") GProp_GProps;
		%feature("autodoc", "The origin (0, 0, 0) of the absolute cartesian coordinate system is used to compute the global properties.

Returns
-------
None
") GProp_GProps;
		 GProp_GProps();

		/****************** GProp_GProps ******************/
		%feature("compactdefaultargs") GProp_GProps;
		%feature("autodoc", "The point systemlocation is used to compute the gobal properties of the system. for more accuracy it is better to define this point closed to the location of the system. for example it could be a point around the centre of mass of the system. this point is referred to as the reference point for this framework. for greater accuracy it is better for the reference point to be close to the location of the system. it can, for example, be a point near the center of mass of the system. at initialization, the framework is empty; i.e. it retains no dimensional information such as mass, or inertia. however, it is now able to bring together global properties of various other systems, whose global properties have already been computed using another framework. to do this, use the function add to define the components of the system. use it once per component of the system, and then use the interrogation functions available to access the computed values.

Parameters
----------
SystemLocation: gp_Pnt

Returns
-------
None
") GProp_GProps;
		 GProp_GProps(const gp_Pnt & SystemLocation);

		/****************** Add ******************/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "Either - initializes the global properties retained by this framework from those retained by the framework item, or - brings together the global properties still retained by this framework with those retained by the framework item. the value density, which is 1.0 by default, is used as the density of the system analysed by item. sometimes the density will have already been given at the time of construction of the framework item. this may be the case for example, if item is a gprop_pgprops framework built to compute the global properties of a set of points ; or another gprop_gprops object which already retains composite global properties. in these cases the real density was perhaps already taken into account at the time of construction of item. note that this is not checked: if the density of parts of the system is taken into account two or more times, results of the computation will be false. notes : - the point relative to which the inertia of item is computed (i.e. the reference point of item) may be different from the reference point in this framework. huygens' theorem is applied automatically to transfer inertia values to the reference point in this framework. - the function add is used once per component of the system. after that, you use the interrogation functions available to access values computed for the system. - the system whose global properties are already brought together by this framework is referred to as the current system. however, the current system is not retained by this framework, which maintains only its global properties. exceptions standard_domainerror if density is less than or equal to gp::resolution().

Parameters
----------
Item: GProp_GProps
Density: float,optional
	default value is 1.0

Returns
-------
None
") Add;
		void Add(const GProp_GProps & Item, const Standard_Real Density = 1.0);

		/****************** CentreOfMass ******************/
		%feature("compactdefaultargs") CentreOfMass;
		%feature("autodoc", "Returns the center of mass of the current system. if the gravitational field is uniform, it is the center of gravity. the coordinates returned for the center of mass are expressed in the absolute cartesian coordinate system.

Returns
-------
gp_Pnt
") CentreOfMass;
		gp_Pnt CentreOfMass();

		/****************** Mass ******************/
		%feature("compactdefaultargs") Mass;
		%feature("autodoc", "Returns the mass of the current system. if no density is attached to the components of the current system the returned value corresponds to : - the total length of the edges of the current system if this framework retains only linear properties, as is the case for example, when using only the linearproperties function to combine properties of lines from shapes, or - the total area of the faces of the current system if this framework retains only surface properties, as is the case for example, when using only the surfaceproperties function to combine properties of surfaces from shapes, or - the total volume of the solids of the current system if this framework retains only volume properties, as is the case for example, when using only the volumeproperties function to combine properties of volumes from solids. warning a length, an area, or a volume is computed in the current data unit system. the mass of a single object is obtained by multiplying its length, its area or its volume by the given density. you must be consistent with respect to the units used.

Returns
-------
float
") Mass;
		Standard_Real Mass();

		/****************** MatrixOfInertia ******************/
		%feature("compactdefaultargs") MatrixOfInertia;
		%feature("autodoc", "Returns the matrix of inertia. it is a symmetrical matrix. the coefficients of the matrix are the quadratic moments of inertia. //! | ixx ixy ixz | matrix = | ixy iyy iyz | | ixz iyz izz | //! the moments of inertia are denoted by ixx, iyy, izz. the products of inertia are denoted by ixy, ixz, iyz. the matrix of inertia is returned in the central coordinate system (g, gx, gy, gz) where g is the centre of mass of the system and gx, gy, gz the directions parallel to the x(1,0,0) y(0,1,0) z(0,0,1) directions of the absolute cartesian coordinate system. it is possible to compute the matrix of inertia at another location point using the huyghens theorem (you can use the method of package gprop : hoperator).

Returns
-------
gp_Mat
") MatrixOfInertia;
		gp_Mat MatrixOfInertia();

		/****************** MomentOfInertia ******************/
		%feature("compactdefaultargs") MomentOfInertia;
		%feature("autodoc", "Computes the moment of inertia of the material system about the axis a.

Parameters
----------
A: gp_Ax1

Returns
-------
float
") MomentOfInertia;
		Standard_Real MomentOfInertia(const gp_Ax1 & A);

		/****************** PrincipalProperties ******************/
		%feature("compactdefaultargs") PrincipalProperties;
		%feature("autodoc", "Computes the principal properties of inertia of the current system. there is always a set of axes for which the products of inertia of a geometric system are equal to 0; i.e. the matrix of inertia of the system is diagonal. these axes are the principal axes of inertia. their origin is coincident with the center of mass of the system. the associated moments are called the principal moments of inertia. this function computes the eigen values and the eigen vectors of the matrix of inertia of the system. results are stored by using a presentation framework of principal properties of inertia (gprop_principalprops object) which may be queried to access the value sought.

Returns
-------
GProp_PrincipalProps
") PrincipalProperties;
		GProp_PrincipalProps PrincipalProperties();

		/****************** RadiusOfGyration ******************/
		%feature("compactdefaultargs") RadiusOfGyration;
		%feature("autodoc", "Returns the radius of gyration of the current system about the axis a.

Parameters
----------
A: gp_Ax1

Returns
-------
float
") RadiusOfGyration;
		Standard_Real RadiusOfGyration(const gp_Ax1 & A);

		/****************** StaticMoments ******************/
		%feature("compactdefaultargs") StaticMoments;
		%feature("autodoc", "Returns ix, iy, iz, the static moments of inertia of the current system; i.e. the moments of inertia about the three axes of the cartesian coordinate system.

Parameters
----------

Returns
-------
Ix: float
Iy: float
Iz: float
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
		/****************** GProp_PEquation ******************/
		%feature("compactdefaultargs") GProp_PEquation;
		%feature("autodoc", "Constructs a framework to analyze the collection of points pnts and computes: - the mean point if the points in question are considered to be coincident within the precision tol, or - the mean line if they are considered to be collinear within the precision tol, or - the mean plane if they are considered to be coplanar within the precision tol, or - the minimal box which contains all the points. use : - the functions ispoint, islinear, isplanar and isspace to find the result of the analysis, and - the function point, line, plane or box to access the computed result.

Parameters
----------
Pnts: TColgp_Array1OfPnt
Tol: float

Returns
-------
None
") GProp_PEquation;
		 GProp_PEquation(const TColgp_Array1OfPnt & Pnts, const Standard_Real Tol);

		/****************** Box ******************/
		%feature("compactdefaultargs") Box;
		%feature("autodoc", "Returns the definition of the smallest box which contains all the points analyzed by this framework if, according to the given precision value, the points are considered to be neither coincident, nor collinear and nor coplanar. this box is centered on the barycenter p of the collection of points. its sides are parallel to the three vectors v1, v2 and v3, the length of which is the length of the box in the corresponding direction. note: vectors v1, v2 and v3 are parallel to the three axes of principal inertia of the system composed of the collection of points where each point is of equal mass. exceptions standard_nosuchobject if, according to the given precision, the points analyzed by this framework are considered to be coincident, collinear or coplanar.

Parameters
----------
P: gp_Pnt
V1: gp_Vec
V2: gp_Vec
V3: gp_Vec

Returns
-------
None
") Box;
		void Box(gp_Pnt & P, gp_Vec & V1, gp_Vec & V2, gp_Vec & V3);

		/****************** IsLinear ******************/
		%feature("compactdefaultargs") IsLinear;
		%feature("autodoc", "Returns true if, according to the given tolerance, the points analyzed by this framework are colinear. use the function line to access the computed result.

Returns
-------
bool
") IsLinear;
		Standard_Boolean IsLinear();

		/****************** IsPlanar ******************/
		%feature("compactdefaultargs") IsPlanar;
		%feature("autodoc", "Returns true if, according to the given tolerance, the points analyzed by this framework are coplanar. use the function plane to access the computed result.

Returns
-------
bool
") IsPlanar;
		Standard_Boolean IsPlanar();

		/****************** IsPoint ******************/
		%feature("compactdefaultargs") IsPoint;
		%feature("autodoc", "Returns true if, according to the given tolerance, the points analyzed by this framework are coincident. use the function point to access the computed result.

Returns
-------
bool
") IsPoint;
		Standard_Boolean IsPoint();

		/****************** IsSpace ******************/
		%feature("compactdefaultargs") IsSpace;
		%feature("autodoc", "Returns true if, according to the given tolerance value, the points analyzed by this framework are neither coincident, nor collinear, nor coplanar. use the function box to query the smallest box that includes the collection of points.

Returns
-------
bool
") IsSpace;
		Standard_Boolean IsSpace();

		/****************** Line ******************/
		%feature("compactdefaultargs") Line;
		%feature("autodoc", "Returns the mean line passing near all the points analyzed by this framework if, according to the given precision value, the points are considered to be collinear. exceptions standard_nosuchobject if, according to the given precision, the points analyzed by this framework are considered to be: - coincident, or - not collinear.

Returns
-------
gp_Lin
") Line;
		gp_Lin Line();

		/****************** Plane ******************/
		%feature("compactdefaultargs") Plane;
		%feature("autodoc", "Returns the mean plane passing near all the points analyzed by this framework if, according to the given precision, the points are considered to be coplanar. exceptions standard_nosuchobject if, according to the given precision value, the points analyzed by this framework are considered to be: - coincident, or - collinear, or - not coplanar.

Returns
-------
gp_Pln
") Plane;
		gp_Pln Plane();

		/****************** Point ******************/
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "Returns the mean point of all the points analyzed by this framework if, according to the given precision, the points are considered to be coincident. exceptions standard_nosuchobject if, according to the given precision, the points analyzed by this framework are not considered to be coincident.

Returns
-------
gp_Pnt
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
		/****************** GProp_PrincipalProps ******************/
		%feature("compactdefaultargs") GProp_PrincipalProps;
		%feature("autodoc", "Creates an undefined principalprops.

Returns
-------
None
") GProp_PrincipalProps;
		 GProp_PrincipalProps();

		/****************** FirstAxisOfInertia ******************/
		%feature("compactdefaultargs") FirstAxisOfInertia;
		%feature("autodoc", "Returns the first axis of inertia. //! if the system has a point of symmetry there is an infinity of solutions. it is not possible to defines the three axis of inertia.

Returns
-------
gp_Vec
") FirstAxisOfInertia;
		const gp_Vec FirstAxisOfInertia();

		/****************** HasSymmetryAxis ******************/
		%feature("compactdefaultargs") HasSymmetryAxis;
		%feature("autodoc", "Returns true if the geometric system has an axis of symmetry. for comparing moments relative tolerance 1.e-10 is used. usually it is enough for objects, restricted by faces with analitycal geometry.

Returns
-------
bool
") HasSymmetryAxis;
		Standard_Boolean HasSymmetryAxis();

		/****************** HasSymmetryAxis ******************/
		%feature("compactdefaultargs") HasSymmetryAxis;
		%feature("autodoc", "Returns true if the geometric system has an axis of symmetry. atol is relative tolerance for cheking equality of moments if atol == 0, relative tolerance is ~ 1.e-16 (epsilon(i)).

Parameters
----------
aTol: float

Returns
-------
bool
") HasSymmetryAxis;
		Standard_Boolean HasSymmetryAxis(const Standard_Real aTol);

		/****************** HasSymmetryPoint ******************/
		%feature("compactdefaultargs") HasSymmetryPoint;
		%feature("autodoc", "Returns true if the geometric system has a point of symmetry. for comparing moments relative tolerance 1.e-10 is used. usually it is enough for objects, restricted by faces with analitycal geometry.

Returns
-------
bool
") HasSymmetryPoint;
		Standard_Boolean HasSymmetryPoint();

		/****************** HasSymmetryPoint ******************/
		%feature("compactdefaultargs") HasSymmetryPoint;
		%feature("autodoc", "Returns true if the geometric system has a point of symmetry. atol is relative tolerance for cheking equality of moments if atol == 0, relative tolerance is ~ 1.e-16 (epsilon(i)).

Parameters
----------
aTol: float

Returns
-------
bool
") HasSymmetryPoint;
		Standard_Boolean HasSymmetryPoint(const Standard_Real aTol);

		/****************** Moments ******************/
		%feature("compactdefaultargs") Moments;
		%feature("autodoc", "Ixx, iyy and izz return the principal moments of inertia in the current system. notes : - if the current system has an axis of symmetry, two of the three values ixx, iyy and izz are equal. they indicate which eigen vectors define an infinity of axes of principal inertia. - if the current system has a center of symmetry, ixx, iyy and izz are equal.

Parameters
----------

Returns
-------
Ixx: float
Iyy: float
Izz: float
") Moments;
		void Moments(Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** RadiusOfGyration ******************/
		%feature("compactdefaultargs") RadiusOfGyration;
		%feature("autodoc", "Returns the principal radii of gyration rxx, ryy and rzz are the radii of gyration of the current system about its three principal axes of inertia. note that: - if the current system has an axis of symmetry, two of the three values rxx, ryy and rzz are equal. - if the current system has a center of symmetry, rxx, ryy and rzz are equal.

Parameters
----------

Returns
-------
Rxx: float
Ryy: float
Rzz: float
") RadiusOfGyration;
		void RadiusOfGyration(Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** SecondAxisOfInertia ******************/
		%feature("compactdefaultargs") SecondAxisOfInertia;
		%feature("autodoc", "Returns the second axis of inertia. //! if the system has a point of symmetry or an axis of symmetry the second and the third axis of symmetry are undefined.

Returns
-------
gp_Vec
") SecondAxisOfInertia;
		const gp_Vec SecondAxisOfInertia();

		/****************** ThirdAxisOfInertia ******************/
		%feature("compactdefaultargs") ThirdAxisOfInertia;
		%feature("autodoc", "Returns the third axis of inertia. this and the above functions return the first, second or third eigen vector of the matrix of inertia of the current system. the first, second and third principal axis of inertia pass through the center of mass of the current system. they are respectively parallel to these three eigen vectors. note that: - if the current system has an axis of symmetry, any axis is an axis of principal inertia if it passes through the center of mass of the system, and runs parallel to a linear combination of the two eigen vectors of the matrix of inertia, corresponding to the two eigen values which are equal. if the current system has a center of symmetry, any axis passing through the center of mass of the system is an axis of principal inertia. use the functions hassymmetryaxis and hassymmetrypoint to check these particular cases, where the returned eigen vectors define an infinity of principal axis of inertia. - the moments function can be used to know which of the three eigen vectors corresponds to the two eigen values which are equal. //! if the system has a point of symmetry or an axis of symmetry the second and the third axis of symmetry are undefined.

Returns
-------
gp_Vec
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
		/****************** GProp_CelGProps ******************/
		%feature("compactdefaultargs") GProp_CelGProps;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") GProp_CelGProps;
		 GProp_CelGProps();

		/****************** GProp_CelGProps ******************/
		%feature("compactdefaultargs") GProp_CelGProps;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: gp_Circ
CLocation: gp_Pnt

Returns
-------
None
") GProp_CelGProps;
		 GProp_CelGProps(const gp_Circ & C, const gp_Pnt & CLocation);

		/****************** GProp_CelGProps ******************/
		%feature("compactdefaultargs") GProp_CelGProps;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: gp_Circ
U1: float
U2: float
CLocation: gp_Pnt

Returns
-------
None
") GProp_CelGProps;
		 GProp_CelGProps(const gp_Circ & C, const Standard_Real U1, const Standard_Real U2, const gp_Pnt & CLocation);

		/****************** GProp_CelGProps ******************/
		%feature("compactdefaultargs") GProp_CelGProps;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: gp_Lin
U1: float
U2: float
CLocation: gp_Pnt

Returns
-------
None
") GProp_CelGProps;
		 GProp_CelGProps(const gp_Lin & C, const Standard_Real U1, const Standard_Real U2, const gp_Pnt & CLocation);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: gp_Circ
U1: float
U2: float

Returns
-------
None
") Perform;
		void Perform(const gp_Circ & C, const Standard_Real U1, const Standard_Real U2);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: gp_Lin
U1: float
U2: float

Returns
-------
None
") Perform;
		void Perform(const gp_Lin & C, const Standard_Real U1, const Standard_Real U2);

		/****************** SetLocation ******************/
		%feature("compactdefaultargs") SetLocation;
		%feature("autodoc", "No available documentation.

Parameters
----------
CLocation: gp_Pnt

Returns
-------
None
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
		/****************** GProp_PGProps ******************/
		%feature("compactdefaultargs") GProp_PGProps;
		%feature("autodoc", "Initializes a framework to compute global properties on a set of points. the point relative to which the inertia of the system is computed will be the origin (0, 0, 0) of the absolute cartesian coordinate system. at initialization, the framework is empty, i.e. it retains no dimensional information such as mass and inertia. it is, however, now able to keep global properties of a set of points while new points are added using the addpoint function. the set of points whose global properties are brought together by this framework will then be referred to as the current system. the current system is, however, not kept by this framework, which only keeps that system's global properties. note that the current system may be more complex than a set of points.

Returns
-------
None
") GProp_PGProps;
		 GProp_PGProps();

		/****************** GProp_PGProps ******************/
		%feature("compactdefaultargs") GProp_PGProps;
		%feature("autodoc", "Computes the global properties of the system of points pnts. the density of the points are defaulted to all being 1.

Parameters
----------
Pnts: TColgp_Array1OfPnt

Returns
-------
None
") GProp_PGProps;
		 GProp_PGProps(const TColgp_Array1OfPnt & Pnts);

		/****************** GProp_PGProps ******************/
		%feature("compactdefaultargs") GProp_PGProps;
		%feature("autodoc", "Computes the global properties of the system of points pnts. the density of the points are defaulted to all being 1.

Parameters
----------
Pnts: TColgp_Array2OfPnt

Returns
-------
None
") GProp_PGProps;
		 GProp_PGProps(const TColgp_Array2OfPnt & Pnts);

		/****************** GProp_PGProps ******************/
		%feature("compactdefaultargs") GProp_PGProps;
		%feature("autodoc", "Computes the global properties of the system of points pnts. a density is associated with each point. //! raises if a density is lower or equal to resolution from package gp. //! raises if the length of pnts and the length of density is not the same.

Parameters
----------
Pnts: TColgp_Array1OfPnt
Density: TColStd_Array1OfReal

Returns
-------
None
") GProp_PGProps;
		 GProp_PGProps(const TColgp_Array1OfPnt & Pnts, const TColStd_Array1OfReal & Density);

		/****************** GProp_PGProps ******************/
		%feature("compactdefaultargs") GProp_PGProps;
		%feature("autodoc", "Computes the global properties of the system of points pnts. a density is associated with each point. //! raised if a density is lower or equal to resolution from package gp. //! raised if the length of pnts and the length of density is not the same.

Parameters
----------
Pnts: TColgp_Array2OfPnt
Density: TColStd_Array2OfReal

Returns
-------
None
") GProp_PGProps;
		 GProp_PGProps(const TColgp_Array2OfPnt & Pnts, const TColStd_Array2OfReal & Density);

		/****************** AddPoint ******************/
		%feature("compactdefaultargs") AddPoint;
		%feature("autodoc", "Brings together the global properties already retained by this framework with those induced by the point pnt. pnt may be the first point of the current system. a point mass is attached to the point pnt, it is either equal to 1. or to density.

Parameters
----------
P: gp_Pnt

Returns
-------
None
") AddPoint;
		void AddPoint(const gp_Pnt & P);

		/****************** AddPoint ******************/
		%feature("compactdefaultargs") AddPoint;
		%feature("autodoc", "Adds a new point p with its density in the system of points exceptions standard_domainerror if the mass value density is less than gp::resolution().

Parameters
----------
P: gp_Pnt
Density: float

Returns
-------
None
") AddPoint;
		void AddPoint(const gp_Pnt & P, const Standard_Real Density);

		/****************** Barycentre ******************/
		%feature("compactdefaultargs") Barycentre;
		%feature("autodoc", "Computes the barycentre of a set of points. the density of the points is defaulted to 1.

Parameters
----------
Pnts: TColgp_Array1OfPnt

Returns
-------
gp_Pnt
") Barycentre;
		static gp_Pnt Barycentre(const TColgp_Array1OfPnt & Pnts);

		/****************** Barycentre ******************/
		%feature("compactdefaultargs") Barycentre;
		%feature("autodoc", "Computes the barycentre of a set of points. the density of the points is defaulted to 1.

Parameters
----------
Pnts: TColgp_Array2OfPnt

Returns
-------
gp_Pnt
") Barycentre;
		static gp_Pnt Barycentre(const TColgp_Array2OfPnt & Pnts);

		/****************** Barycentre ******************/
		%feature("compactdefaultargs") Barycentre;
		%feature("autodoc", "Computes the barycentre of a set of points. a density is associated with each point. //! raises if a density is lower or equal to resolution from package gp. //! raised if the length of pnts and the length of density is not the same.

Parameters
----------
Pnts: TColgp_Array1OfPnt
Density: TColStd_Array1OfReal
G: gp_Pnt

Returns
-------
Mass: float
") Barycentre;
		static void Barycentre(const TColgp_Array1OfPnt & Pnts, const TColStd_Array1OfReal & Density, Standard_Real &OutValue, gp_Pnt & G);

		/****************** Barycentre ******************/
		%feature("compactdefaultargs") Barycentre;
		%feature("autodoc", "Computes the barycentre of a set of points. a density is associated with each point. //! raised if a density is lower or equal to resolution from package gp. //! raised if the length of pnts and the length of density is not the same.

Parameters
----------
Pnts: TColgp_Array2OfPnt
Density: TColStd_Array2OfReal
G: gp_Pnt

Returns
-------
Mass: float
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
		/****************** GProp_SelGProps ******************/
		%feature("compactdefaultargs") GProp_SelGProps;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") GProp_SelGProps;
		 GProp_SelGProps();

		/****************** GProp_SelGProps ******************/
		%feature("compactdefaultargs") GProp_SelGProps;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: gp_Cylinder
Alpha1: float
Alpha2: float
Z1: float
Z2: float
SLocation: gp_Pnt

Returns
-------
None
") GProp_SelGProps;
		 GProp_SelGProps(const gp_Cylinder & S, const Standard_Real Alpha1, const Standard_Real Alpha2, const Standard_Real Z1, const Standard_Real Z2, const gp_Pnt & SLocation);

		/****************** GProp_SelGProps ******************/
		%feature("compactdefaultargs") GProp_SelGProps;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: gp_Cone
Alpha1: float
Alpha2: float
Z1: float
Z2: float
SLocation: gp_Pnt

Returns
-------
None
") GProp_SelGProps;
		 GProp_SelGProps(const gp_Cone & S, const Standard_Real Alpha1, const Standard_Real Alpha2, const Standard_Real Z1, const Standard_Real Z2, const gp_Pnt & SLocation);

		/****************** GProp_SelGProps ******************/
		%feature("compactdefaultargs") GProp_SelGProps;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: gp_Sphere
Teta1: float
Teta2: float
Alpha1: float
Alpha2: float
SLocation: gp_Pnt

Returns
-------
None
") GProp_SelGProps;
		 GProp_SelGProps(const gp_Sphere & S, const Standard_Real Teta1, const Standard_Real Teta2, const Standard_Real Alpha1, const Standard_Real Alpha2, const gp_Pnt & SLocation);

		/****************** GProp_SelGProps ******************/
		%feature("compactdefaultargs") GProp_SelGProps;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: gp_Torus
Teta1: float
Teta2: float
Alpha1: float
Alpha2: float
SLocation: gp_Pnt

Returns
-------
None
") GProp_SelGProps;
		 GProp_SelGProps(const gp_Torus & S, const Standard_Real Teta1, const Standard_Real Teta2, const Standard_Real Alpha1, const Standard_Real Alpha2, const gp_Pnt & SLocation);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: gp_Cylinder
Alpha1: float
Alpha2: float
Z1: float
Z2: float

Returns
-------
None
") Perform;
		void Perform(const gp_Cylinder & S, const Standard_Real Alpha1, const Standard_Real Alpha2, const Standard_Real Z1, const Standard_Real Z2);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: gp_Cone
Alpha1: float
Alpha2: float
Z1: float
Z2: float

Returns
-------
None
") Perform;
		void Perform(const gp_Cone & S, const Standard_Real Alpha1, const Standard_Real Alpha2, const Standard_Real Z1, const Standard_Real Z2);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: gp_Sphere
Teta1: float
Teta2: float
Alpha1: float
Alpha2: float

Returns
-------
None
") Perform;
		void Perform(const gp_Sphere & S, const Standard_Real Teta1, const Standard_Real Teta2, const Standard_Real Alpha1, const Standard_Real Alpha2);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: gp_Torus
Teta1: float
Teta2: float
Alpha1: float
Alpha2: float

Returns
-------
None
") Perform;
		void Perform(const gp_Torus & S, const Standard_Real Teta1, const Standard_Real Teta2, const Standard_Real Alpha1, const Standard_Real Alpha2);

		/****************** SetLocation ******************/
		%feature("compactdefaultargs") SetLocation;
		%feature("autodoc", "No available documentation.

Parameters
----------
SLocation: gp_Pnt

Returns
-------
None
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
		/****************** GProp_VelGProps ******************/
		%feature("compactdefaultargs") GProp_VelGProps;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") GProp_VelGProps;
		 GProp_VelGProps();

		/****************** GProp_VelGProps ******************/
		%feature("compactdefaultargs") GProp_VelGProps;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: gp_Cylinder
Alpha1: float
Alpha2: float
Z1: float
Z2: float
VLocation: gp_Pnt

Returns
-------
None
") GProp_VelGProps;
		 GProp_VelGProps(const gp_Cylinder & S, const Standard_Real Alpha1, const Standard_Real Alpha2, const Standard_Real Z1, const Standard_Real Z2, const gp_Pnt & VLocation);

		/****************** GProp_VelGProps ******************/
		%feature("compactdefaultargs") GProp_VelGProps;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: gp_Cone
Alpha1: float
Alpha2: float
Z1: float
Z2: float
VLocation: gp_Pnt

Returns
-------
None
") GProp_VelGProps;
		 GProp_VelGProps(const gp_Cone & S, const Standard_Real Alpha1, const Standard_Real Alpha2, const Standard_Real Z1, const Standard_Real Z2, const gp_Pnt & VLocation);

		/****************** GProp_VelGProps ******************/
		%feature("compactdefaultargs") GProp_VelGProps;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: gp_Sphere
Teta1: float
Teta2: float
Alpha1: float
Alpha2: float
VLocation: gp_Pnt

Returns
-------
None
") GProp_VelGProps;
		 GProp_VelGProps(const gp_Sphere & S, const Standard_Real Teta1, const Standard_Real Teta2, const Standard_Real Alpha1, const Standard_Real Alpha2, const gp_Pnt & VLocation);

		/****************** GProp_VelGProps ******************/
		%feature("compactdefaultargs") GProp_VelGProps;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: gp_Torus
Teta1: float
Teta2: float
Alpha1: float
Alpha2: float
VLocation: gp_Pnt

Returns
-------
None
") GProp_VelGProps;
		 GProp_VelGProps(const gp_Torus & S, const Standard_Real Teta1, const Standard_Real Teta2, const Standard_Real Alpha1, const Standard_Real Alpha2, const gp_Pnt & VLocation);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: gp_Cylinder
Alpha1: float
Alpha2: float
Z1: float
Z2: float

Returns
-------
None
") Perform;
		void Perform(const gp_Cylinder & S, const Standard_Real Alpha1, const Standard_Real Alpha2, const Standard_Real Z1, const Standard_Real Z2);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: gp_Cone
Alpha1: float
Alpha2: float
Z1: float
Z2: float

Returns
-------
None
") Perform;
		void Perform(const gp_Cone & S, const Standard_Real Alpha1, const Standard_Real Alpha2, const Standard_Real Z1, const Standard_Real Z2);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: gp_Sphere
Teta1: float
Teta2: float
Alpha1: float
Alpha2: float

Returns
-------
None
") Perform;
		void Perform(const gp_Sphere & S, const Standard_Real Teta1, const Standard_Real Teta2, const Standard_Real Alpha1, const Standard_Real Alpha2);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: gp_Torus
Teta1: float
Teta2: float
Alpha1: float
Alpha2: float

Returns
-------
None
") Perform;
		void Perform(const gp_Torus & S, const Standard_Real Teta1, const Standard_Real Teta2, const Standard_Real Alpha1, const Standard_Real Alpha2);

		/****************** SetLocation ******************/
		%feature("compactdefaultargs") SetLocation;
		%feature("autodoc", "No available documentation.

Parameters
----------
VLocation: gp_Pnt

Returns
-------
None
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
