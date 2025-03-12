/*
Copyright 2008-2024 Thomas Paviot (tpaviot@gmail.com)

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
%define GCEDOCSTRING
"gce module, see official documentation at
https://dev.opencascade.org/doc/occt-7.8.0/refman/html/package_gce.html"
%enddef
%module (package="OCC.Core", docstring=GCEDOCSTRING) gce


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
#include<gce_module.hxx>

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
enum gce_ErrorType {
	gce_Done = 0,
	gce_ConfusedPoints = 1,
	gce_NegativeRadius = 2,
	gce_ColinearPoints = 3,
	gce_IntersectionError = 4,
	gce_NullAxis = 5,
	gce_NullAngle = 6,
	gce_NullRadius = 7,
	gce_InvertAxis = 8,
	gce_BadAngle = 9,
	gce_InvertRadius = 10,
	gce_NullFocusLength = 11,
	gce_NullVector = 12,
	gce_BadEquation = 13,
};

/* end public enums declaration */

/* python proxy classes for enums */
%pythoncode {

class gce_ErrorType(IntEnum):
	gce_Done = 0
	gce_ConfusedPoints = 1
	gce_NegativeRadius = 2
	gce_ColinearPoints = 3
	gce_IntersectionError = 4
	gce_NullAxis = 5
	gce_NullAngle = 6
	gce_NullRadius = 7
	gce_InvertAxis = 8
	gce_BadAngle = 9
	gce_InvertRadius = 10
	gce_NullFocusLength = 11
	gce_NullVector = 12
	gce_BadEquation = 13
gce_Done = gce_ErrorType.gce_Done
gce_ConfusedPoints = gce_ErrorType.gce_ConfusedPoints
gce_NegativeRadius = gce_ErrorType.gce_NegativeRadius
gce_ColinearPoints = gce_ErrorType.gce_ColinearPoints
gce_IntersectionError = gce_ErrorType.gce_IntersectionError
gce_NullAxis = gce_ErrorType.gce_NullAxis
gce_NullAngle = gce_ErrorType.gce_NullAngle
gce_NullRadius = gce_ErrorType.gce_NullRadius
gce_InvertAxis = gce_ErrorType.gce_InvertAxis
gce_BadAngle = gce_ErrorType.gce_BadAngle
gce_InvertRadius = gce_ErrorType.gce_InvertRadius
gce_NullFocusLength = gce_ErrorType.gce_NullFocusLength
gce_NullVector = gce_ErrorType.gce_NullVector
gce_BadEquation = gce_ErrorType.gce_BadEquation
};
/* end python proxy for enums */

/* handles */
/* end handles declaration */

/* templates */
/* end templates declaration */

/* typedefs */
/* end typedefs declaration */

/***********************
* class gce_MakeMirror *
***********************/
class gce_MakeMirror {
	public:
		/****** gce_MakeMirror::gce_MakeMirror ******/
		/****** md5 signature: 3edba066f9e916005498ef7357739621 ******/
		%feature("compactdefaultargs") gce_MakeMirror;
		%feature("autodoc", "
Parameters
----------
Point: gp_Pnt

Return
-------
None

Description
-----------
No available documentation.
") gce_MakeMirror;
		 gce_MakeMirror(const gp_Pnt & Point);

		/****** gce_MakeMirror::gce_MakeMirror ******/
		/****** md5 signature: 6313d51b16bcf1d8744025b9675662e7 ******/
		%feature("compactdefaultargs") gce_MakeMirror;
		%feature("autodoc", "
Parameters
----------
Axis: gp_Ax1

Return
-------
None

Description
-----------
No available documentation.
") gce_MakeMirror;
		 gce_MakeMirror(const gp_Ax1 & Axis);

		/****** gce_MakeMirror::gce_MakeMirror ******/
		/****** md5 signature: 933662d8a9e8c957c0e6dc5c8f6271df ******/
		%feature("compactdefaultargs") gce_MakeMirror;
		%feature("autodoc", "
Parameters
----------
Line: gp_Lin

Return
-------
None

Description
-----------
No available documentation.
") gce_MakeMirror;
		 gce_MakeMirror(const gp_Lin & Line);

		/****** gce_MakeMirror::gce_MakeMirror ******/
		/****** md5 signature: 4ab0d33d100f7c3d1b2d3f83b1743db8 ******/
		%feature("compactdefaultargs") gce_MakeMirror;
		%feature("autodoc", "
Parameters
----------
Point: gp_Pnt
Direc: gp_Dir

Return
-------
None

Description
-----------
Makes a symmetry transformation af axis defined by <Point> and <Direc>.
") gce_MakeMirror;
		 gce_MakeMirror(const gp_Pnt & Point, const gp_Dir & Direc);

		/****** gce_MakeMirror::gce_MakeMirror ******/
		/****** md5 signature: b4f3e38fc024573daeeee70612824b63 ******/
		%feature("compactdefaultargs") gce_MakeMirror;
		%feature("autodoc", "
Parameters
----------
Plane: gp_Pln

Return
-------
None

Description
-----------
Makes a symmetry transformation of plane <Plane>.
") gce_MakeMirror;
		 gce_MakeMirror(const gp_Pln & Plane);

		/****** gce_MakeMirror::gce_MakeMirror ******/
		/****** md5 signature: 33ba2b094d8272394ad9df3621fb8b34 ******/
		%feature("compactdefaultargs") gce_MakeMirror;
		%feature("autodoc", "
Parameters
----------
Plane: gp_Ax2

Return
-------
None

Description
-----------
Makes a symmetry transformation of plane <Plane>.
") gce_MakeMirror;
		 gce_MakeMirror(const gp_Ax2 & Plane);

		/****** gce_MakeMirror::Operator ******/
		/****** md5 signature: 92d86884748a1ae45ea139b0fe57dfaf ******/
		%feature("compactdefaultargs") Operator;
		%feature("autodoc", "Return
-------
gp_Trsf

Description
-----------
No available documentation.
") Operator;
		const gp_Trsf Operator();

		/****** gce_MakeMirror::Value ******/
		/****** md5 signature: 1a1c0ee31a7acb966675b285067f5d9c ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Return
-------
gp_Trsf

Description
-----------
Returns the constructed transformation.
") Value;
		const gp_Trsf Value();

};


%extend gce_MakeMirror {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************
* class gce_MakeMirror2d *
*************************/
class gce_MakeMirror2d {
	public:
		/****** gce_MakeMirror2d::gce_MakeMirror2d ******/
		/****** md5 signature: 09ad4a85d4551dacba5a39cc262ee8e2 ******/
		%feature("compactdefaultargs") gce_MakeMirror2d;
		%feature("autodoc", "
Parameters
----------
Point: gp_Pnt2d

Return
-------
None

Description
-----------
No available documentation.
") gce_MakeMirror2d;
		 gce_MakeMirror2d(const gp_Pnt2d & Point);

		/****** gce_MakeMirror2d::gce_MakeMirror2d ******/
		/****** md5 signature: f993a964de4d867d4778f6ed56b280b0 ******/
		%feature("compactdefaultargs") gce_MakeMirror2d;
		%feature("autodoc", "
Parameters
----------
Axis: gp_Ax2d

Return
-------
None

Description
-----------
No available documentation.
") gce_MakeMirror2d;
		 gce_MakeMirror2d(const gp_Ax2d & Axis);

		/****** gce_MakeMirror2d::gce_MakeMirror2d ******/
		/****** md5 signature: 70ddab457d85563064e3dcf2edf579a5 ******/
		%feature("compactdefaultargs") gce_MakeMirror2d;
		%feature("autodoc", "
Parameters
----------
Line: gp_Lin2d

Return
-------
None

Description
-----------
No available documentation.
") gce_MakeMirror2d;
		 gce_MakeMirror2d(const gp_Lin2d & Line);

		/****** gce_MakeMirror2d::gce_MakeMirror2d ******/
		/****** md5 signature: 6db8d192baa66a235809439a9c8ecf80 ******/
		%feature("compactdefaultargs") gce_MakeMirror2d;
		%feature("autodoc", "
Parameters
----------
Point: gp_Pnt2d
Direc: gp_Dir2d

Return
-------
None

Description
-----------
Makes a symmetry transformation af axis defined by <Point> and <Direc>.
") gce_MakeMirror2d;
		 gce_MakeMirror2d(const gp_Pnt2d & Point, const gp_Dir2d & Direc);

		/****** gce_MakeMirror2d::Operator ******/
		/****** md5 signature: d43f7114e4c40728110426cd21450647 ******/
		%feature("compactdefaultargs") Operator;
		%feature("autodoc", "Return
-------
gp_Trsf2d

Description
-----------
No available documentation.
") Operator;
		const gp_Trsf2d Operator();

		/****** gce_MakeMirror2d::Value ******/
		/****** md5 signature: 7e81229e88786c4e4655049c893c29a1 ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Return
-------
gp_Trsf2d

Description
-----------
Returns the constructed transformation.
") Value;
		const gp_Trsf2d Value();

};


%extend gce_MakeMirror2d {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************
* class gce_MakeRotation *
*************************/
class gce_MakeRotation {
	public:
		/****** gce_MakeRotation::gce_MakeRotation ******/
		/****** md5 signature: df19e48caf418b11233c29e068bb8afa ******/
		%feature("compactdefaultargs") gce_MakeRotation;
		%feature("autodoc", "
Parameters
----------
Line: gp_Lin
Angle: float

Return
-------
None

Description
-----------
Constructs a rotation through angle Angle about the axis defined by the line Line.
") gce_MakeRotation;
		 gce_MakeRotation(const gp_Lin & Line, const Standard_Real Angle);

		/****** gce_MakeRotation::gce_MakeRotation ******/
		/****** md5 signature: 3318eae9541094efb3994031a6a4c50e ******/
		%feature("compactdefaultargs") gce_MakeRotation;
		%feature("autodoc", "
Parameters
----------
Axis: gp_Ax1
Angle: float

Return
-------
None

Description
-----------
Constructs a rotation through angle Angle about the axis defined by the axis Axis.
") gce_MakeRotation;
		 gce_MakeRotation(const gp_Ax1 & Axis, const Standard_Real Angle);

		/****** gce_MakeRotation::gce_MakeRotation ******/
		/****** md5 signature: 7525703a9c8a9ca6173951e102f468d2 ******/
		%feature("compactdefaultargs") gce_MakeRotation;
		%feature("autodoc", "
Parameters
----------
Point: gp_Pnt
Direc: gp_Dir
Angle: float

Return
-------
None

Description
-----------
Constructs a rotation through angle Angle about the axis defined by: the point Point and the unit vector Direc.
") gce_MakeRotation;
		 gce_MakeRotation(const gp_Pnt & Point, const gp_Dir & Direc, const Standard_Real Angle);

		/****** gce_MakeRotation::Operator ******/
		/****** md5 signature: 92d86884748a1ae45ea139b0fe57dfaf ******/
		%feature("compactdefaultargs") Operator;
		%feature("autodoc", "Return
-------
gp_Trsf

Description
-----------
No available documentation.
") Operator;
		const gp_Trsf Operator();

		/****** gce_MakeRotation::Value ******/
		/****** md5 signature: 1a1c0ee31a7acb966675b285067f5d9c ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Return
-------
gp_Trsf

Description
-----------
Returns the constructed transformation.
") Value;
		const gp_Trsf Value();

};


%extend gce_MakeRotation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************
* class gce_MakeRotation2d *
***************************/
class gce_MakeRotation2d {
	public:
		/****** gce_MakeRotation2d::gce_MakeRotation2d ******/
		/****** md5 signature: 1af38bc8048802241ae9613f65ddb51e ******/
		%feature("compactdefaultargs") gce_MakeRotation2d;
		%feature("autodoc", "
Parameters
----------
Point: gp_Pnt2d
Angle: float

Return
-------
None

Description
-----------
Constructs a rotation through angle Angle about the center Point.
") gce_MakeRotation2d;
		 gce_MakeRotation2d(const gp_Pnt2d & Point, const Standard_Real Angle);

		/****** gce_MakeRotation2d::Operator ******/
		/****** md5 signature: d43f7114e4c40728110426cd21450647 ******/
		%feature("compactdefaultargs") Operator;
		%feature("autodoc", "Return
-------
gp_Trsf2d

Description
-----------
No available documentation.
") Operator;
		const gp_Trsf2d Operator();

		/****** gce_MakeRotation2d::Value ******/
		/****** md5 signature: 7e81229e88786c4e4655049c893c29a1 ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Return
-------
gp_Trsf2d

Description
-----------
Returns the constructed transformation.
") Value;
		const gp_Trsf2d Value();

};


%extend gce_MakeRotation2d {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************
* class gce_MakeScale *
**********************/
class gce_MakeScale {
	public:
		/****** gce_MakeScale::gce_MakeScale ******/
		/****** md5 signature: edfc372e364f88b0d902938c0551c4ca ******/
		%feature("compactdefaultargs") gce_MakeScale;
		%feature("autodoc", "
Parameters
----------
Point: gp_Pnt
Scale: float

Return
-------
None

Description
-----------
Constructs a scaling transformation with - Point as the center of the transformation, and - Scale as the scale factor.
") gce_MakeScale;
		 gce_MakeScale(const gp_Pnt & Point, const Standard_Real Scale);

		/****** gce_MakeScale::Operator ******/
		/****** md5 signature: 92d86884748a1ae45ea139b0fe57dfaf ******/
		%feature("compactdefaultargs") Operator;
		%feature("autodoc", "Return
-------
gp_Trsf

Description
-----------
No available documentation.
") Operator;
		const gp_Trsf Operator();

		/****** gce_MakeScale::Value ******/
		/****** md5 signature: 1a1c0ee31a7acb966675b285067f5d9c ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Return
-------
gp_Trsf

Description
-----------
Returns the constructed transformation.
") Value;
		const gp_Trsf Value();

};


%extend gce_MakeScale {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************
* class gce_MakeScale2d *
************************/
class gce_MakeScale2d {
	public:
		/****** gce_MakeScale2d::gce_MakeScale2d ******/
		/****** md5 signature: a98f01f49404a90d5f22d8585d05f06c ******/
		%feature("compactdefaultargs") gce_MakeScale2d;
		%feature("autodoc", "
Parameters
----------
Point: gp_Pnt2d
Scale: float

Return
-------
None

Description
-----------
Constructs a scaling transformation with: - Point as the center of the transformation, and - Scale as the scale factor.
") gce_MakeScale2d;
		 gce_MakeScale2d(const gp_Pnt2d & Point, const Standard_Real Scale);

		/****** gce_MakeScale2d::Operator ******/
		/****** md5 signature: d43f7114e4c40728110426cd21450647 ******/
		%feature("compactdefaultargs") Operator;
		%feature("autodoc", "Return
-------
gp_Trsf2d

Description
-----------
No available documentation.
") Operator;
		const gp_Trsf2d Operator();

		/****** gce_MakeScale2d::Value ******/
		/****** md5 signature: 7e81229e88786c4e4655049c893c29a1 ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Return
-------
gp_Trsf2d

Description
-----------
Returns the constructed transformation.
") Value;
		const gp_Trsf2d Value();

};


%extend gce_MakeScale2d {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************
* class gce_MakeTranslation *
****************************/
class gce_MakeTranslation {
	public:
		/****** gce_MakeTranslation::gce_MakeTranslation ******/
		/****** md5 signature: 593dd39b0df7e3e3bc782f6028a6501e ******/
		%feature("compactdefaultargs") gce_MakeTranslation;
		%feature("autodoc", "
Parameters
----------
Vect: gp_Vec

Return
-------
None

Description
-----------
Constructs a translation along the vector ' Vect'.
") gce_MakeTranslation;
		 gce_MakeTranslation(const gp_Vec & Vect);

		/****** gce_MakeTranslation::gce_MakeTranslation ******/
		/****** md5 signature: 9c06384e77c7133b92db474a921da449 ******/
		%feature("compactdefaultargs") gce_MakeTranslation;
		%feature("autodoc", "
Parameters
----------
Point1: gp_Pnt
Point2: gp_Pnt

Return
-------
None

Description
-----------
Constructs a translation along the vector (Point1,Point2) defined from the point Point1 to the point Point2.
") gce_MakeTranslation;
		 gce_MakeTranslation(const gp_Pnt & Point1, const gp_Pnt & Point2);

		/****** gce_MakeTranslation::Operator ******/
		/****** md5 signature: 92d86884748a1ae45ea139b0fe57dfaf ******/
		%feature("compactdefaultargs") Operator;
		%feature("autodoc", "Return
-------
gp_Trsf

Description
-----------
No available documentation.
") Operator;
		const gp_Trsf Operator();

		/****** gce_MakeTranslation::Value ******/
		/****** md5 signature: 1a1c0ee31a7acb966675b285067f5d9c ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Return
-------
gp_Trsf

Description
-----------
Returns the constructed transformation.
") Value;
		const gp_Trsf Value();

};


%extend gce_MakeTranslation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************
* class gce_MakeTranslation2d *
******************************/
class gce_MakeTranslation2d {
	public:
		/****** gce_MakeTranslation2d::gce_MakeTranslation2d ******/
		/****** md5 signature: b67bafdc1b7c42163abc25a33e099ae8 ******/
		%feature("compactdefaultargs") gce_MakeTranslation2d;
		%feature("autodoc", "
Parameters
----------
Vect: gp_Vec2d

Return
-------
None

Description
-----------
Constructs a translation along the vector Vect.
") gce_MakeTranslation2d;
		 gce_MakeTranslation2d(const gp_Vec2d & Vect);

		/****** gce_MakeTranslation2d::gce_MakeTranslation2d ******/
		/****** md5 signature: 3ab97a720b6462aa9bb686d0f5d94736 ******/
		%feature("compactdefaultargs") gce_MakeTranslation2d;
		%feature("autodoc", "
Parameters
----------
Point1: gp_Pnt2d
Point2: gp_Pnt2d

Return
-------
None

Description
-----------
Constructs a translation along the vector (Point1,Point2) defined from the point Point1 to the point Point2.
") gce_MakeTranslation2d;
		 gce_MakeTranslation2d(const gp_Pnt2d & Point1, const gp_Pnt2d & Point2);

		/****** gce_MakeTranslation2d::Operator ******/
		/****** md5 signature: d43f7114e4c40728110426cd21450647 ******/
		%feature("compactdefaultargs") Operator;
		%feature("autodoc", "Return
-------
gp_Trsf2d

Description
-----------
No available documentation.
") Operator;
		const gp_Trsf2d Operator();

		/****** gce_MakeTranslation2d::Value ******/
		/****** md5 signature: 7e81229e88786c4e4655049c893c29a1 ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Return
-------
gp_Trsf2d

Description
-----------
Returns the constructed transformation.
") Value;
		const gp_Trsf2d Value();

};


%extend gce_MakeTranslation2d {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************
* class gce_Root *
*****************/
class gce_Root {
	public:
		/****** gce_Root::IsDone ******/
		/****** md5 signature: ec0624071ec7da54b3d9dacc7bcb05f9 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if the construction is successful.
") IsDone;
		Standard_Boolean IsDone();

		/****** gce_Root::Status ******/
		/****** md5 signature: 40beeec4d25ee1f3f94752c410640458 ******/
		%feature("compactdefaultargs") Status;
		%feature("autodoc", "Return
-------
gce_ErrorType

Description
-----------
Returns the status of the construction: - gce_Done, if the construction is successful, or - another value of the gce_ErrorType enumeration indicating why the construction failed.
") Status;
		gce_ErrorType Status();

};


%extend gce_Root {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************
* class gce_MakeCirc *
*********************/
class gce_MakeCirc : public gce_Root {
	public:
		/****** gce_MakeCirc::gce_MakeCirc ******/
		/****** md5 signature: 5b625d89fbd666f1a8023cec0aeb8365 ******/
		%feature("compactdefaultargs") gce_MakeCirc;
		%feature("autodoc", "
Parameters
----------
A2: gp_Ax2
Radius: float

Return
-------
None

Description
-----------
A2 locates the circle and gives its orientation in 3D space. Warnings: It is not forbidden to create a circle with Radius = 0.0 The status is 'NegativeRadius' if Radius < 0.0.
") gce_MakeCirc;
		 gce_MakeCirc(const gp_Ax2 & A2, const Standard_Real Radius);

		/****** gce_MakeCirc::gce_MakeCirc ******/
		/****** md5 signature: 7dcb60dacaa1140beb4f2629accdc561 ******/
		%feature("compactdefaultargs") gce_MakeCirc;
		%feature("autodoc", "
Parameters
----------
Circ: gp_Circ
Dist: float

Return
-------
None

Description
-----------
Makes a Circ from gp <TheCirc> coaxial to another Circ <Circ> at a distance <Dist>. If Dist is greater than zero the result is encloses the circle <Circ>, else the result is enclosed by the circle <Circ>.
") gce_MakeCirc;
		 gce_MakeCirc(const gp_Circ & Circ, const Standard_Real Dist);

		/****** gce_MakeCirc::gce_MakeCirc ******/
		/****** md5 signature: f4ef45259d23246abd5f7be839391ef7 ******/
		%feature("compactdefaultargs") gce_MakeCirc;
		%feature("autodoc", "
Parameters
----------
Circ: gp_Circ
Point: gp_Pnt

Return
-------
None

Description
-----------
Makes a Circ from gp <TheCirc> coaxial to another Circ <Circ> and passing through a Pnt2d <Point>.
") gce_MakeCirc;
		 gce_MakeCirc(const gp_Circ & Circ, const gp_Pnt & Point);

		/****** gce_MakeCirc::gce_MakeCirc ******/
		/****** md5 signature: c4da009f7971c26de2f0ade00adbc60a ******/
		%feature("compactdefaultargs") gce_MakeCirc;
		%feature("autodoc", "
Parameters
----------
P1: gp_Pnt
P2: gp_Pnt
P3: gp_Pnt

Return
-------
None

Description
-----------
Makes a Circ from gp <TheCirc> passing through 3 Pnt2d <P1>,<P2>,<P3>.
") gce_MakeCirc;
		 gce_MakeCirc(const gp_Pnt & P1, const gp_Pnt & P2, const gp_Pnt & P3);

		/****** gce_MakeCirc::gce_MakeCirc ******/
		/****** md5 signature: 7c220d9ab2c95647068d495f932deaa5 ******/
		%feature("compactdefaultargs") gce_MakeCirc;
		%feature("autodoc", "
Parameters
----------
Center: gp_Pnt
Norm: gp_Dir
Radius: float

Return
-------
None

Description
-----------
Makes a Circ from gp <TheCirc> with its center <Center> and the normal of its plane <Norm> and its radius <Radius>.
") gce_MakeCirc;
		 gce_MakeCirc(const gp_Pnt & Center, const gp_Dir & Norm, const Standard_Real Radius);

		/****** gce_MakeCirc::gce_MakeCirc ******/
		/****** md5 signature: 7d9dd2bc4253309e13ec992ff2116ef2 ******/
		%feature("compactdefaultargs") gce_MakeCirc;
		%feature("autodoc", "
Parameters
----------
Center: gp_Pnt
Plane: gp_Pln
Radius: float

Return
-------
None

Description
-----------
Makes a Circ from gp <TheCirc> with its center <Center> and the normal of its plane <Plane> and its radius <Radius>.
") gce_MakeCirc;
		 gce_MakeCirc(const gp_Pnt & Center, const gp_Pln & Plane, const Standard_Real Radius);

		/****** gce_MakeCirc::gce_MakeCirc ******/
		/****** md5 signature: 9febcfcdfde56ed1f961fb14e5fe8d85 ******/
		%feature("compactdefaultargs") gce_MakeCirc;
		%feature("autodoc", "
Parameters
----------
Center: gp_Pnt
Ptaxis: gp_Pnt
Radius: float

Return
-------
None

Description
-----------
Makes a Circ from gp <TheCirc> with its center <Center> and a point <Ptaxis> giving the normal of its plane <Plane> and its radius <Radius>.
") gce_MakeCirc;
		 gce_MakeCirc(const gp_Pnt & Center, const gp_Pnt & Ptaxis, const Standard_Real Radius);

		/****** gce_MakeCirc::gce_MakeCirc ******/
		/****** md5 signature: 0f435660b5e072ef03cb247333dc8408 ******/
		%feature("compactdefaultargs") gce_MakeCirc;
		%feature("autodoc", "
Parameters
----------
Axis: gp_Ax1
Radius: float

Return
-------
None

Description
-----------
Makes a Circ from gp <TheCirc> with its center <Center> and its radius <Radius>. Warning The MakeCirc class does not prevent the construction of a circle with a null radius. If an error occurs (that is, when IsDone returns false), the Status function returns: - gce_Negative Radius if: - Radius is less than 0.0, or - Dist is less than 0.0 and the absolute value of Dist is greater than the radius of Circ; - gce_IntersectionError if the points P1, P2 and P3 are collinear, and the three are not coincident; - gce_ConfusedPoints if two of the three points P1, P2 and P3 are coincident; or - gce_NullAxis if Center and Ptaxis are coincident.
") gce_MakeCirc;
		 gce_MakeCirc(const gp_Ax1 & Axis, const Standard_Real Radius);

		/****** gce_MakeCirc::Operator ******/
		/****** md5 signature: dbcc55b2dfd1665dc8cbbade36bb0ccd ******/
		%feature("compactdefaultargs") Operator;
		%feature("autodoc", "Return
-------
gp_Circ

Description
-----------
No available documentation.
") Operator;
		const gp_Circ Operator();

		/****** gce_MakeCirc::Value ******/
		/****** md5 signature: c56b9c2cad29727eb572682c1d680252 ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Return
-------
gp_Circ

Description
-----------
Returns the constructed circle. Exceptions StdFail_NotDone if no circle is constructed.
") Value;
		const gp_Circ Value();

};


%extend gce_MakeCirc {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************
* class gce_MakeCirc2d *
***********************/
class gce_MakeCirc2d : public gce_Root {
	public:
		/****** gce_MakeCirc2d::gce_MakeCirc2d ******/
		/****** md5 signature: 97296d0a26b6a7971a9d1f48a32741ee ******/
		%feature("compactdefaultargs") gce_MakeCirc2d;
		%feature("autodoc", "
Parameters
----------
XAxis: gp_Ax2d
Radius: float
Sense: bool (optional, default to Standard_True)

Return
-------
None

Description
-----------
The location point of XAxis is the center of the circle. Warnings: It is not forbidden to create a circle with Radius = 0.0 If Sense is true the local coordinate system of the solution is direct and non direct in the other case. The status is 'NegativeRadius' if Radius < 0.0.
") gce_MakeCirc2d;
		 gce_MakeCirc2d(const gp_Ax2d & XAxis, const Standard_Real Radius, const Standard_Boolean Sense = Standard_True);

		/****** gce_MakeCirc2d::gce_MakeCirc2d ******/
		/****** md5 signature: 7c5ff5b108e8901b2b0406be4fddccfb ******/
		%feature("compactdefaultargs") gce_MakeCirc2d;
		%feature("autodoc", "
Parameters
----------
Axis: gp_Ax22d
Radius: float

Return
-------
None

Description
-----------
The location point of Axis is the center of the circle. Warnings: It is not forbidden to create a circle with Radius = 0.0.
") gce_MakeCirc2d;
		 gce_MakeCirc2d(const gp_Ax22d & Axis, const Standard_Real Radius);

		/****** gce_MakeCirc2d::gce_MakeCirc2d ******/
		/****** md5 signature: 1013b2f939d4f4adb48fd38eba0d3582 ******/
		%feature("compactdefaultargs") gce_MakeCirc2d;
		%feature("autodoc", "
Parameters
----------
Circ: gp_Circ2d
Dist: float

Return
-------
None

Description
-----------
Makes a Circ2d from gp <TheCirc> concentric with another circ2d <Circ> with a distance <Dist>. If Dist is greater than zero the result encloses the circle <Circ>, else the result is enclosed by the circle <Circ>. The local coordinate system of the solution is the same as Circ.
") gce_MakeCirc2d;
		 gce_MakeCirc2d(const gp_Circ2d & Circ, const Standard_Real Dist);

		/****** gce_MakeCirc2d::gce_MakeCirc2d ******/
		/****** md5 signature: eea2dfaa1e189699e115527f96e52787 ******/
		%feature("compactdefaultargs") gce_MakeCirc2d;
		%feature("autodoc", "
Parameters
----------
Circ: gp_Circ2d
Point: gp_Pnt2d

Return
-------
None

Description
-----------
Makes a Circ2d from gp <TheCirc> concentric with another circ2d <Circ> and passing through a Pnt2d <Point>. The local coordinate system of the solution is the same as Circ.
") gce_MakeCirc2d;
		 gce_MakeCirc2d(const gp_Circ2d & Circ, const gp_Pnt2d & Point);

		/****** gce_MakeCirc2d::gce_MakeCirc2d ******/
		/****** md5 signature: 33957562164d1aea311f6229f58a18a5 ******/
		%feature("compactdefaultargs") gce_MakeCirc2d;
		%feature("autodoc", "
Parameters
----------
P1: gp_Pnt2d
P2: gp_Pnt2d
P3: gp_Pnt2d

Return
-------
None

Description
-----------
Makes a Circ2d from gp <TheCirc> passing through 3 Pnt2d <P1>,<P2>,<P3>. The local coordinate system of the solution is given by the three points P1, P2, P3.
") gce_MakeCirc2d;
		 gce_MakeCirc2d(const gp_Pnt2d & P1, const gp_Pnt2d & P2, const gp_Pnt2d & P3);

		/****** gce_MakeCirc2d::gce_MakeCirc2d ******/
		/****** md5 signature: 924d9dd9d3817fe77a06cd6d9c344910 ******/
		%feature("compactdefaultargs") gce_MakeCirc2d;
		%feature("autodoc", "
Parameters
----------
Center: gp_Pnt2d
Radius: float
Sense: bool (optional, default to Standard_True)

Return
-------
None

Description
-----------
Makes a Circ2d from gp <TheCirc> with its center <Center> and its radius <Radius>. If Sense is true the local coordinate system of the solution is direct and non direct in the other case.
") gce_MakeCirc2d;
		 gce_MakeCirc2d(const gp_Pnt2d & Center, const Standard_Real Radius, const Standard_Boolean Sense = Standard_True);

		/****** gce_MakeCirc2d::gce_MakeCirc2d ******/
		/****** md5 signature: 5a9916ff7077e42693f61c5c37a04737 ******/
		%feature("compactdefaultargs") gce_MakeCirc2d;
		%feature("autodoc", "
Parameters
----------
Center: gp_Pnt2d
Point: gp_Pnt2d
Sense: bool (optional, default to Standard_True)

Return
-------
None

Description
-----------
Makes a Circ2d from gp <TheCirc> with its center <Center> and a point giving the radius. If Sense is true the local coordinate system of the solution is direct and non direct in the other case.
") gce_MakeCirc2d;
		 gce_MakeCirc2d(const gp_Pnt2d & Center, const gp_Pnt2d & Point, const Standard_Boolean Sense = Standard_True);

		/****** gce_MakeCirc2d::Operator ******/
		/****** md5 signature: cf9d2f148952b7f4645058a2303d7c96 ******/
		%feature("compactdefaultargs") Operator;
		%feature("autodoc", "Return
-------
gp_Circ2d

Description
-----------
No available documentation.
") Operator;
		const gp_Circ2d Operator();

		/****** gce_MakeCirc2d::Value ******/
		/****** md5 signature: 6e34b8d406e23e4dff2a4f9b65064186 ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Return
-------
gp_Circ2d

Description
-----------
Returns the constructed circle. Exceptions StdFail_NotDone if no circle is constructed.
") Value;
		const gp_Circ2d Value();

};


%extend gce_MakeCirc2d {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************
* class gce_MakeCone *
*********************/
class gce_MakeCone : public gce_Root {
	public:
		/****** gce_MakeCone::gce_MakeCone ******/
		/****** md5 signature: bbbc2d1d4417405dab5288a7e17b86c4 ******/
		%feature("compactdefaultargs") gce_MakeCone;
		%feature("autodoc", "
Parameters
----------
A2: gp_Ax2
Ang: float
Radius: float

Return
-------
None

Description
-----------
Creates an infinite conical surface. A2 locates the cone in the space and defines the reference plane of the surface. Ang is the conical surface semi-angle between 0 and PI/2 radians. Radius is the radius of the circle in the reference plane of the cone. If Radius is lower than 0.0 the status is ' If Ang < Resolution from gp or Ang >= (PI/2) - Resolution.
") gce_MakeCone;
		 gce_MakeCone(const gp_Ax2 & A2, const Standard_Real Ang, const Standard_Real Radius);

		/****** gce_MakeCone::gce_MakeCone ******/
		/****** md5 signature: a9b9d94f2a154c486d091bae80e735ec ******/
		%feature("compactdefaultargs") gce_MakeCone;
		%feature("autodoc", "
Parameters
----------
Cone: gp_Cone
Point: gp_Pnt

Return
-------
None

Description
-----------
Makes a Cone from gp <TheCone> coaxial to another Cone <Cone> and passing through a Pnt <Point>.
") gce_MakeCone;
		 gce_MakeCone(const gp_Cone & Cone, const gp_Pnt & Point);

		/****** gce_MakeCone::gce_MakeCone ******/
		/****** md5 signature: 175a7ac79286abbe577c9422afa31180 ******/
		%feature("compactdefaultargs") gce_MakeCone;
		%feature("autodoc", "
Parameters
----------
Cone: gp_Cone
Dist: float

Return
-------
None

Description
-----------
Makes a Cone from gp <TheCone> coaxial to another Cone <Cone> at the distance <Dist> which can be greater or lower than zero.
") gce_MakeCone;
		 gce_MakeCone(const gp_Cone & Cone, const Standard_Real Dist);

		/****** gce_MakeCone::gce_MakeCone ******/
		/****** md5 signature: 7a4f596ee6ff385497286ad6cbea42a2 ******/
		%feature("compactdefaultargs") gce_MakeCone;
		%feature("autodoc", "
Parameters
----------
P1: gp_Pnt
P2: gp_Pnt
P3: gp_Pnt
P4: gp_Pnt

Return
-------
None

Description
-----------
Makes a Cone from gp <TheCone> by four points <P1>, <P2>,<P3> and <P4>. Its axis is <P1P2> and the radius of its base is the distance between <P3> and <P1P2>. The distance between <P4> and <P1P2> is the radius of the section passing through <P4>. If <P1> and <P2> are confused or <P3> and <P4> are confused we have the status 'ConfusedPoints' if <P1>,<P2>,<P3>,<P4> are colinear we have the status 'ColinearPoints' If <P3P4> is perpendicular to <P1P2> we have the status 'NullAngle'. <P3P4> is colinear to <P1P2> we have the status 'NullAngle'.
") gce_MakeCone;
		 gce_MakeCone(const gp_Pnt & P1, const gp_Pnt & P2, const gp_Pnt & P3, const gp_Pnt & P4);

		/****** gce_MakeCone::gce_MakeCone ******/
		/****** md5 signature: 4efcb63150abec208f95498ff7e9184f ******/
		%feature("compactdefaultargs") gce_MakeCone;
		%feature("autodoc", "
Parameters
----------
Axis: gp_Ax1
P1: gp_Pnt
P2: gp_Pnt

Return
-------
None

Description
-----------
Makes a Cone by its axis <Axis> and two points. The distance between <P1> and the axis is the radius of the section passing through <P1>. The distance between <P2> and the axis is the radius of the section passing through <P2>. If <P1P2> is colinear to <Axis> we have the status 'NullAngle' If <P3P4> is perpendicular to <Axis> we have the status 'NullAngle' If <P1> and <P2> are confused we have the status 'ConfusedPoints'.
") gce_MakeCone;
		 gce_MakeCone(const gp_Ax1 & Axis, const gp_Pnt & P1, const gp_Pnt & P2);

		/****** gce_MakeCone::gce_MakeCone ******/
		/****** md5 signature: 52bd38f3e9183528e21d7586e6d00968 ******/
		%feature("compactdefaultargs") gce_MakeCone;
		%feature("autodoc", "
Parameters
----------
Axis: gp_Lin
P1: gp_Pnt
P2: gp_Pnt

Return
-------
None

Description
-----------
Makes a Cone by its axis <Axis> and two points. The distance between <P1> and the axis is the radius of the section passing through <P1> The distance between <P2> and the axis is the radius of the section passing through <P2> If <P1P2> is colinear to <Axis> we have the status 'NullAngle' If <P3P4> is perpendicular to <Axis> we have the status 'NullAngle' If <P1> and <P2> are confused we have the status 'ConfusedPoints'.
") gce_MakeCone;
		 gce_MakeCone(const gp_Lin & Axis, const gp_Pnt & P1, const gp_Pnt & P2);

		/****** gce_MakeCone::gce_MakeCone ******/
		/****** md5 signature: 55ea3a019234ba10f5c6e35c27313ba9 ******/
		%feature("compactdefaultargs") gce_MakeCone;
		%feature("autodoc", "
Parameters
----------
P1: gp_Pnt
P2: gp_Pnt
R1: float
R2: float

Return
-------
None

Description
-----------
Makes a Cone with two points and two radius. The axis of the solution is the line passing through <P1> and <P2>. <R1> is the radius of the section passing through <P1> and <R2> the radius of the section passing through <P2>. If <P1> and <P2> are confused we have the status 'NullAxis'. Warning If an error occurs (that is, when IsDone returns false), the Status function returns: - gce_NegativeRadius if Radius, R1 or R2 is less than 0.0; - gce_BadAngle if Ang is less than gp::Resolution() or greater than Pi/2.- gp::Resolution(); - gce_ConfusedPoints if P1 and P2 or P3 and P4 are coincident; - gce_NullAxis if the points P1 and P2, are coincident (5th syntax only); - gce_NullAngle if: - the vector joining P1 to P2 is parallel to either Axis or the line joining P3 to P4, or - R1 and R2 are equal, (that is, their difference is less than gp::Resolution()); or - gce_NullRadius if: - the vector joining P1 to P2 is perpendicular to the line joining P3 to P4, - the vector joining P1 to P2 is perpendicular to Axis, or - P1, P2, P3, and P4 are collinear.
") gce_MakeCone;
		 gce_MakeCone(const gp_Pnt & P1, const gp_Pnt & P2, const Standard_Real R1, const Standard_Real R2);

		/****** gce_MakeCone::Operator ******/
		/****** md5 signature: f7abe807483c643f4916710e04970bce ******/
		%feature("compactdefaultargs") Operator;
		%feature("autodoc", "Return
-------
gp_Cone

Description
-----------
No available documentation.
") Operator;
		const gp_Cone Operator();

		/****** gce_MakeCone::Value ******/
		/****** md5 signature: 02c9f577d520a037ce99491b9df1cfd1 ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Return
-------
gp_Cone

Description
-----------
Returns the constructed cone. Exceptions StdFail_NotDone if no cone is constructed.
") Value;
		const gp_Cone Value();

};


%extend gce_MakeCone {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************
* class gce_MakeCylinder *
*************************/
class gce_MakeCylinder : public gce_Root {
	public:
		/****** gce_MakeCylinder::gce_MakeCylinder ******/
		/****** md5 signature: a5cac3082deaa7d017cb316d9e2e3a3b ******/
		%feature("compactdefaultargs") gce_MakeCylinder;
		%feature("autodoc", "
Parameters
----------
A2: gp_Ax2
Radius: float

Return
-------
None

Description
-----------
<A2> is the local cartesian coordinate system of <self>. The status is 'NegativeRadius' if R < 0.0.
") gce_MakeCylinder;
		 gce_MakeCylinder(const gp_Ax2 & A2, const Standard_Real Radius);

		/****** gce_MakeCylinder::gce_MakeCylinder ******/
		/****** md5 signature: a0ab9b390c9f44effb709bd3b4ebd456 ******/
		%feature("compactdefaultargs") gce_MakeCylinder;
		%feature("autodoc", "
Parameters
----------
Cyl: gp_Cylinder
Point: gp_Pnt

Return
-------
None

Description
-----------
Makes a Cylinder from gp <TheCylinder> coaxial to another Cylinder <Cylinder> and passing through a Pnt <Point>.
") gce_MakeCylinder;
		 gce_MakeCylinder(const gp_Cylinder & Cyl, const gp_Pnt & Point);

		/****** gce_MakeCylinder::gce_MakeCylinder ******/
		/****** md5 signature: aeb2a8c6276c2176ceb6e9a2c4f1f936 ******/
		%feature("compactdefaultargs") gce_MakeCylinder;
		%feature("autodoc", "
Parameters
----------
Cyl: gp_Cylinder
Dist: float

Return
-------
None

Description
-----------
Makes a Cylinder from gp <TheCylinder> coaxial to another Cylinder <Cylinder> at the distance <Dist> which can be greater or lower than zero. The radius of the result is the absolute value of the radius of <Cyl> plus <Dist>.
") gce_MakeCylinder;
		 gce_MakeCylinder(const gp_Cylinder & Cyl, const Standard_Real Dist);

		/****** gce_MakeCylinder::gce_MakeCylinder ******/
		/****** md5 signature: e50745b60281ab75200a7652897ea6ac ******/
		%feature("compactdefaultargs") gce_MakeCylinder;
		%feature("autodoc", "
Parameters
----------
P1: gp_Pnt
P2: gp_Pnt
P3: gp_Pnt

Return
-------
None

Description
-----------
Makes a Cylinder from gp <TheCylinder> with 3 points <P1>,<P2>,<P3>. Its axis is <P1P2> and its radius is the distance between <P3> and <P1P2>.
") gce_MakeCylinder;
		 gce_MakeCylinder(const gp_Pnt & P1, const gp_Pnt & P2, const gp_Pnt & P3);

		/****** gce_MakeCylinder::gce_MakeCylinder ******/
		/****** md5 signature: b68abebbe13127525cf170a7bd7d2a82 ******/
		%feature("compactdefaultargs") gce_MakeCylinder;
		%feature("autodoc", "
Parameters
----------
Axis: gp_Ax1
Radius: float

Return
-------
None

Description
-----------
Makes a Cylinder by its axis <Axis> and radius <Radius>.
") gce_MakeCylinder;
		 gce_MakeCylinder(const gp_Ax1 & Axis, const Standard_Real Radius);

		/****** gce_MakeCylinder::gce_MakeCylinder ******/
		/****** md5 signature: b4eec50813559cae35f14ba1ef53b454 ******/
		%feature("compactdefaultargs") gce_MakeCylinder;
		%feature("autodoc", "
Parameters
----------
Circ: gp_Circ

Return
-------
None

Description
-----------
Makes a Cylinder by its circular base. Warning If an error occurs (that is, when IsDone returns false), the Status function returns: - gce_NegativeRadius if: - Radius is less than 0.0, or - Dist is negative and has an absolute value which is greater than the radius of Cyl; or - gce_ConfusedPoints if points P1 and P2 are coincident.
") gce_MakeCylinder;
		 gce_MakeCylinder(const gp_Circ & Circ);

		/****** gce_MakeCylinder::Operator ******/
		/****** md5 signature: 89de000120c9ef5be549a6d587782f06 ******/
		%feature("compactdefaultargs") Operator;
		%feature("autodoc", "Return
-------
gp_Cylinder

Description
-----------
No available documentation.
") Operator;
		const gp_Cylinder Operator();

		/****** gce_MakeCylinder::Value ******/
		/****** md5 signature: da4d9f56aaab1049dff371cefab5afb9 ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Return
-------
gp_Cylinder

Description
-----------
Returns the constructed cylinder. Exceptions StdFail_NotDone if no cylinder is constructed.
") Value;
		const gp_Cylinder Value();

};


%extend gce_MakeCylinder {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************
* class gce_MakeDir *
********************/
class gce_MakeDir : public gce_Root {
	public:
		/****** gce_MakeDir::gce_MakeDir ******/
		/****** md5 signature: 25cef2ce83a88a4eda319bd69960741f ******/
		%feature("compactdefaultargs") gce_MakeDir;
		%feature("autodoc", "
Parameters
----------
V: gp_Vec

Return
-------
None

Description
-----------
Normalizes the vector V and creates a direction. Status is 'NullVector' if V.Magnitude() <= Resolution.
") gce_MakeDir;
		 gce_MakeDir(const gp_Vec & V);

		/****** gce_MakeDir::gce_MakeDir ******/
		/****** md5 signature: f814e77268e641484432a1b53566dcbc ******/
		%feature("compactdefaultargs") gce_MakeDir;
		%feature("autodoc", "
Parameters
----------
Coord: gp_XYZ

Return
-------
None

Description
-----------
Creates a direction from a triplet of coordinates. Status is 'NullVector' if Coord.Modulus() <= Resolution from gp.
") gce_MakeDir;
		 gce_MakeDir(const gp_XYZ & Coord);

		/****** gce_MakeDir::gce_MakeDir ******/
		/****** md5 signature: b7262f62de52f8272f8e4291edde1b95 ******/
		%feature("compactdefaultargs") gce_MakeDir;
		%feature("autodoc", "
Parameters
----------
Xv: float
Yv: float
Zv: float

Return
-------
None

Description
-----------
Creates a direction with its 3 cartesian coordinates. Status is 'NullVector' if Sqrt(Xv*Xv + Yv*Yv + Zv*Zv) <= Resolution.
") gce_MakeDir;
		 gce_MakeDir(const Standard_Real Xv, const Standard_Real Yv, const Standard_Real Zv);

		/****** gce_MakeDir::gce_MakeDir ******/
		/****** md5 signature: 1df03283e475e0bc14eab29744567903 ******/
		%feature("compactdefaultargs") gce_MakeDir;
		%feature("autodoc", "
Parameters
----------
P1: gp_Pnt
P2: gp_Pnt

Return
-------
None

Description
-----------
Make a Dir from gp <TheDir> passing through 2 Pnt <P1>,<P2>. Status is 'ConfusedPoints' if <p1> and <P2> are confused. Warning If an error occurs (that is, when IsDone returns false), the Status function returns: - gce_ConfusedPoints if points P1 and P2 are coincident, or - gce_NullVector if one of the following is less than or equal to gp::Resolution(): - the magnitude of vector V, - the modulus of Coord, - Sqrt(Xv*Xv + Yv*Yv + Zv*Zv).
") gce_MakeDir;
		 gce_MakeDir(const gp_Pnt & P1, const gp_Pnt & P2);

		/****** gce_MakeDir::Operator ******/
		/****** md5 signature: ebcd79c703ce6d758a496e6f61efab70 ******/
		%feature("compactdefaultargs") Operator;
		%feature("autodoc", "Return
-------
gp_Dir

Description
-----------
No available documentation.
") Operator;
		const gp_Dir Operator();

		/****** gce_MakeDir::Value ******/
		/****** md5 signature: 6cade6871f82c45a3a9f9daeeaa354dd ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Return
-------
gp_Dir

Description
-----------
Returns the constructed unit vector. Exceptions StdFail_NotDone if no unit vector is constructed.
") Value;
		const gp_Dir Value();

};


%extend gce_MakeDir {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************
* class gce_MakeDir2d *
**********************/
class gce_MakeDir2d : public gce_Root {
	public:
		/****** gce_MakeDir2d::gce_MakeDir2d ******/
		/****** md5 signature: c4e51086975bc96547c5ef87ff6a6043 ******/
		%feature("compactdefaultargs") gce_MakeDir2d;
		%feature("autodoc", "
Parameters
----------
V: gp_Vec2d

Return
-------
None

Description
-----------
Normalizes the vector V and creates a direction. Status is 'NullVector' if V.Magnitude() <= Resolution.
") gce_MakeDir2d;
		 gce_MakeDir2d(const gp_Vec2d & V);

		/****** gce_MakeDir2d::gce_MakeDir2d ******/
		/****** md5 signature: a71a5fdecb14b33bda22825b5ad5d25a ******/
		%feature("compactdefaultargs") gce_MakeDir2d;
		%feature("autodoc", "
Parameters
----------
Coord: gp_XY

Return
-------
None

Description
-----------
Creates a direction from a triplet of coordinates. Status is 'NullVector' if Coord.Modulus() <= Resolution from gp.
") gce_MakeDir2d;
		 gce_MakeDir2d(const gp_XY & Coord);

		/****** gce_MakeDir2d::gce_MakeDir2d ******/
		/****** md5 signature: 9bb822e5b2db0bd52d7b8ae53cfe9e23 ******/
		%feature("compactdefaultargs") gce_MakeDir2d;
		%feature("autodoc", "
Parameters
----------
Xv: float
Yv: float

Return
-------
None

Description
-----------
Creates a direction with its 3 cartesian coordinates. Status is 'NullVector' if Sqrt(Xv*Xv + Yv*Yv ) <= Resolution.
") gce_MakeDir2d;
		 gce_MakeDir2d(const Standard_Real Xv, const Standard_Real Yv);

		/****** gce_MakeDir2d::gce_MakeDir2d ******/
		/****** md5 signature: 613f5b53beb256d1ae0d488c9dd43258 ******/
		%feature("compactdefaultargs") gce_MakeDir2d;
		%feature("autodoc", "
Parameters
----------
P1: gp_Pnt2d
P2: gp_Pnt2d

Return
-------
None

Description
-----------
Make a Dir2d from gp <TheDir> passing through 2 Pnt <P1>,<P2>. Status is 'ConfusedPoints' if <P1> and <P2> are confused. Warning If an error occurs (that is, when IsDone returns false), the Status function returns: - gce_ConfusedPoints if points P1 and P2 are coincident, or - gce_NullVector if one of the following is less than or equal to gp::Resolution(): - the magnitude of vector V, - the modulus of Coord, - Sqrt(Xv*Xv + Yv*Yv).
") gce_MakeDir2d;
		 gce_MakeDir2d(const gp_Pnt2d & P1, const gp_Pnt2d & P2);

		/****** gce_MakeDir2d::Operator ******/
		/****** md5 signature: de9d9d5c81f4b4d3f697b61803a6e275 ******/
		%feature("compactdefaultargs") Operator;
		%feature("autodoc", "Return
-------
gp_Dir2d

Description
-----------
No available documentation.
") Operator;
		const gp_Dir2d Operator();

		/****** gce_MakeDir2d::Value ******/
		/****** md5 signature: 95c4f74c31512119650ef1e0185cdb45 ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Return
-------
gp_Dir2d

Description
-----------
Returns the constructed unit vector. Exceptions StdFail_NotDone if no unit vector is constructed.
") Value;
		const gp_Dir2d Value();

};


%extend gce_MakeDir2d {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************
* class gce_MakeElips *
**********************/
class gce_MakeElips : public gce_Root {
	public:
		/****** gce_MakeElips::gce_MakeElips ******/
		/****** md5 signature: bdc72b79b440f4ce797a38ca3182d8ec ******/
		%feature("compactdefaultargs") gce_MakeElips;
		%feature("autodoc", "
Parameters
----------
A2: gp_Ax2
MajorRadius: float
MinorRadius: float

Return
-------
None

Description
-----------
The major radius of the ellipse is on the 'XAxis' and the minor radius is on the 'YAxis' of the ellipse. The 'XAxis' is defined with the 'XDirection' of A2 and the 'YAxis' is defined with the 'YDirection' of A2. Warnings: It is not forbidden to create an ellipse with MajorRadius = MinorRadius.
") gce_MakeElips;
		 gce_MakeElips(const gp_Ax2 & A2, const Standard_Real MajorRadius, const Standard_Real MinorRadius);

		/****** gce_MakeElips::gce_MakeElips ******/
		/****** md5 signature: 523df1e61724124c5bc5e363bfb75ecd ******/
		%feature("compactdefaultargs") gce_MakeElips;
		%feature("autodoc", "
Parameters
----------
S1: gp_Pnt
S2: gp_Pnt
Center: gp_Pnt

Return
-------
None

Description
-----------
Make an ellipse with its center and two points. Warning The MakeElips class does not prevent the construction of an ellipse where the MajorRadius is equal to the MinorRadius. If an error occurs (that is, when IsDone returns false), the Status function returns: - gce_InvertRadius if MajorRadius is less than MinorRadius; - gce_NegativeRadius if MinorRadius is less than 0.0; - gce_NullAxis if the points S1 and Center are coincident; or - gce_InvertAxis if: - the major radius computed with Center and S1 is less than the minor radius computed with Center, S1 and S2, or - Center, S1 and S2 are collinear.
") gce_MakeElips;
		 gce_MakeElips(const gp_Pnt & S1, const gp_Pnt & S2, const gp_Pnt & Center);

		/****** gce_MakeElips::Operator ******/
		/****** md5 signature: f3fea3019802c727135b0df30b0d4839 ******/
		%feature("compactdefaultargs") Operator;
		%feature("autodoc", "Return
-------
gp_Elips

Description
-----------
No available documentation.
") Operator;
		const gp_Elips Operator();

		/****** gce_MakeElips::Value ******/
		/****** md5 signature: 1ceba8ecb59c6d271bb293c3462f36d4 ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Return
-------
gp_Elips

Description
-----------
Returns the constructed ellipse. Exceptions StdFail_NotDone if no ellipse is constructed.
") Value;
		const gp_Elips Value();

};


%extend gce_MakeElips {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************
* class gce_MakeElips2d *
************************/
class gce_MakeElips2d : public gce_Root {
	public:
		/****** gce_MakeElips2d::gce_MakeElips2d ******/
		/****** md5 signature: c32306f1f9d41e11c2e62edc01f4ce3f ******/
		%feature("compactdefaultargs") gce_MakeElips2d;
		%feature("autodoc", "
Parameters
----------
MajorAxis: gp_Ax2d
MajorRadius: float
MinorRadius: float
Sense: bool (optional, default to Standard_True)

Return
-------
None

Description
-----------
Creates an ellipse with the major axis, the major and the minor radius. The location of the MajorAxis is the center of the ellipse. The sense of parametrization is given by Sense. It is possible to create an ellipse with MajorRadius = MinorRadius. the status is 'InvertRadius' if MajorRadius < MinorRadius or 'NegativeRadius' if MinorRadius < 0.0.
") gce_MakeElips2d;
		 gce_MakeElips2d(const gp_Ax2d & MajorAxis, const Standard_Real MajorRadius, const Standard_Real MinorRadius, const Standard_Boolean Sense = Standard_True);

		/****** gce_MakeElips2d::gce_MakeElips2d ******/
		/****** md5 signature: 582d7495e039f1bd42a740af436f64d2 ******/
		%feature("compactdefaultargs") gce_MakeElips2d;
		%feature("autodoc", "
Parameters
----------
A: gp_Ax22d
MajorRadius: float
MinorRadius: float

Return
-------
None

Description
-----------
Axis defines the Xaxis and Yaxis of the ellipse which defines the origin and the sense of parametrization. Creates an ellipse with the AxisPlacement the major and the minor radius. The location of Axis is the center of the ellipse. It is possible to create an ellipse with MajorRadius = MinorRadius. the status is 'InvertRadius' if MajorRadius < MinorRadius or 'NegativeRadius' if MinorRadius < 0.0.
") gce_MakeElips2d;
		 gce_MakeElips2d(const gp_Ax22d & A, const Standard_Real MajorRadius, const Standard_Real MinorRadius);

		/****** gce_MakeElips2d::gce_MakeElips2d ******/
		/****** md5 signature: e70f578745ef9172de32fe1b60fd5c5e ******/
		%feature("compactdefaultargs") gce_MakeElips2d;
		%feature("autodoc", "
Parameters
----------
S1: gp_Pnt2d
S2: gp_Pnt2d
Center: gp_Pnt2d

Return
-------
None

Description
-----------
Makes an Elips2d with its center and two points. The sense of parametrization is given by S1, S2, and Center. Depending on the constructor, the implicit orientation of the ellipse is: - the sense defined by A, - the sense defined by points Center, S1 and S2, - the trigonometric sense if Sense is not given or is true, or - the opposite if Sense is false. It is possible to construct an ellipse where the major and minor radii are equal. Warning If an error occurs (that is, when IsDone returns false), the Status function returns: - gce_InvertRadius if MajorRadius is less than MinorRadius, - gce_NegativeRadius if MajorRadius or MinorRadius is less than 0.0, - gce_NullAxis if points S1, S2 and Center are collinear, or - gce_InvertAxis if the major radius computed with Center and S1 is less than the minor radius computed with Center, S1 and S2.
") gce_MakeElips2d;
		 gce_MakeElips2d(const gp_Pnt2d & S1, const gp_Pnt2d & S2, const gp_Pnt2d & Center);

		/****** gce_MakeElips2d::Operator ******/
		/****** md5 signature: b6aa9ec04219e31f24228d53458d0b48 ******/
		%feature("compactdefaultargs") Operator;
		%feature("autodoc", "Return
-------
gp_Elips2d

Description
-----------
No available documentation.
") Operator;
		const gp_Elips2d Operator();

		/****** gce_MakeElips2d::Value ******/
		/****** md5 signature: 1c976738000b0a4e556a0bc829bf127a ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Return
-------
gp_Elips2d

Description
-----------
Returns the constructed ellipse. Exceptions StdFail_NotDone if no ellipse is constructed.
") Value;
		const gp_Elips2d Value();

};


%extend gce_MakeElips2d {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************
* class gce_MakeHypr *
*********************/
class gce_MakeHypr : public gce_Root {
	public:
		/****** gce_MakeHypr::gce_MakeHypr ******/
		/****** md5 signature: c201b6e5ee6710477fcd7fec17048bfd ******/
		%feature("compactdefaultargs") gce_MakeHypr;
		%feature("autodoc", "
Parameters
----------
A2: gp_Ax2
MajorRadius: float
MinorRadius: float

Return
-------
None

Description
-----------
A2 is the local coordinate system of the hyperbola. In the local coordinates system A2 the equation of the hyperbola is: X*X / MajorRadius*MajorRadius - Y*Y / MinorRadius*MinorRadius = 1.0 It is not forbidden to create an Hyperbola with MajorRadius = MinorRadius. For the hyperbola the MajorRadius can be lower than the MinorRadius. The status is 'NegativeRadius' if MajorRadius < 0.0 and 'InvertRadius' if MinorRadius > MajorRadius.
") gce_MakeHypr;
		 gce_MakeHypr(const gp_Ax2 & A2, const Standard_Real MajorRadius, const Standard_Real MinorRadius);

		/****** gce_MakeHypr::gce_MakeHypr ******/
		/****** md5 signature: 53445e80c158dadee2d4cedc8aec6153 ******/
		%feature("compactdefaultargs") gce_MakeHypr;
		%feature("autodoc", "
Parameters
----------
S1: gp_Pnt
S2: gp_Pnt
Center: gp_Pnt

Return
-------
None

Description
-----------
Constructs a hyperbola - centered on the point Center, where: - the plane of the hyperbola is defined by Center, S1 and S2, - its major axis is defined by Center and S1, - its major radius is the distance between Center and S1, and - its minor radius is the distance between S2 and the major axis. Warning If an error occurs (that is, when IsDone returns false), the Status function returns: - gce_NegativeRadius if MajorRadius is less than 0.0; - gce_InvertRadius if: - the major radius (computed with Center, S1) is less than the minor radius (computed with Center, S1 and S2), or - MajorRadius is less than MinorRadius; or - gce_ColinearPoints if S1, S2 and Center are collinear.
") gce_MakeHypr;
		 gce_MakeHypr(const gp_Pnt & S1, const gp_Pnt & S2, const gp_Pnt & Center);

		/****** gce_MakeHypr::Operator ******/
		/****** md5 signature: f86704a2693b43c3e6e18d334cb634ff ******/
		%feature("compactdefaultargs") Operator;
		%feature("autodoc", "Return
-------
gp_Hypr

Description
-----------
No available documentation.
") Operator;
		const gp_Hypr Operator();

		/****** gce_MakeHypr::Value ******/
		/****** md5 signature: 0ef6822db68d8f80c1cacffff7e34e77 ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Return
-------
gp_Hypr

Description
-----------
Returns the constructed hyperbola. Exceptions StdFail_NotDone if no hyperbola is constructed.
") Value;
		const gp_Hypr Value();

};


%extend gce_MakeHypr {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************
* class gce_MakeHypr2d *
***********************/
class gce_MakeHypr2d : public gce_Root {
	public:
		/****** gce_MakeHypr2d::gce_MakeHypr2d ******/
		/****** md5 signature: df015fa1aa374911d8f050b29318e310 ******/
		%feature("compactdefaultargs") gce_MakeHypr2d;
		%feature("autodoc", "
Parameters
----------
S1: gp_Pnt2d
S2: gp_Pnt2d
Center: gp_Pnt2d

Return
-------
None

Description
-----------
Constructs a hyperbola centered on the point Center, where: - the major axis of the hyperbola is defined by Center and point S1, - the major radius is the distance between Center and S1, and - the minor radius is the distance between point S2 and the major axis.
") gce_MakeHypr2d;
		 gce_MakeHypr2d(const gp_Pnt2d & S1, const gp_Pnt2d & S2, const gp_Pnt2d & Center);

		/****** gce_MakeHypr2d::gce_MakeHypr2d ******/
		/****** md5 signature: cdb3a263078fc9f8c2aaca4b539c5539 ******/
		%feature("compactdefaultargs") gce_MakeHypr2d;
		%feature("autodoc", "
Parameters
----------
MajorAxis: gp_Ax2d
MajorRadius: float
MinorRadius: float
Sense: bool

Return
-------
None

Description
-----------
Constructs a hyperbola with major and minor radii MajorRadius and MinorRadius, where: - the center of the hyperbola is the origin of the axis MajorAxis, and - the major axis is defined by MajorAxis if Sense is true, or the opposite axis to MajorAxis if Sense is false; or - centered on the origin of the coordinate system A, with major and minor radii MajorRadius and MinorRadius, where its major axis is the 'X Axis' of A (A is the local coordinate system of the hyperbola).
") gce_MakeHypr2d;
		 gce_MakeHypr2d(const gp_Ax2d & MajorAxis, const Standard_Real MajorRadius, const Standard_Real MinorRadius, const Standard_Boolean Sense);

		/****** gce_MakeHypr2d::gce_MakeHypr2d ******/
		/****** md5 signature: d61034c611b846414513068fb9862bd7 ******/
		%feature("compactdefaultargs") gce_MakeHypr2d;
		%feature("autodoc", "
Parameters
----------
A: gp_Ax22d
MajorRadius: float
MinorRadius: float

Return
-------
None

Description
-----------
Creates a Hypr2d centered on the origin of the coordinate system A, with major and minor radii MajorRadius and MinorRadius, where its major axis is the 'X Axis' of A (A is the local coordinate system of the hyperbola).
") gce_MakeHypr2d;
		 gce_MakeHypr2d(const gp_Ax22d & A, const Standard_Real MajorRadius, const Standard_Real MinorRadius);

		/****** gce_MakeHypr2d::Operator ******/
		/****** md5 signature: fd43f022828acd350a1fc7270cf03f96 ******/
		%feature("compactdefaultargs") Operator;
		%feature("autodoc", "Return
-------
gp_Hypr2d

Description
-----------
No available documentation.
") Operator;
		const gp_Hypr2d Operator();

		/****** gce_MakeHypr2d::Value ******/
		/****** md5 signature: 73ea3f0a9dee5724ac79486c1a3e0de5 ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Return
-------
gp_Hypr2d

Description
-----------
Returns the constructed hyperbola. Exceptions StdFail_NotDone if no hyperbola is constructed.
") Value;
		const gp_Hypr2d Value();

};


%extend gce_MakeHypr2d {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************
* class gce_MakeLin *
********************/
class gce_MakeLin : public gce_Root {
	public:
		/****** gce_MakeLin::gce_MakeLin ******/
		/****** md5 signature: d1a151ebb24171af77d5e22e7440e754 ******/
		%feature("compactdefaultargs") gce_MakeLin;
		%feature("autodoc", "
Parameters
----------
A1: gp_Ax1

Return
-------
None

Description
-----------
Creates a line located along the axis A1.
") gce_MakeLin;
		 gce_MakeLin(const gp_Ax1 & A1);

		/****** gce_MakeLin::gce_MakeLin ******/
		/****** md5 signature: 05e2860fa45004f3e349f0c19bee5411 ******/
		%feature("compactdefaultargs") gce_MakeLin;
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
<P> is the location point (origin) of the line and <V> is the direction of the line.
") gce_MakeLin;
		 gce_MakeLin(const gp_Pnt & P, const gp_Dir & V);

		/****** gce_MakeLin::gce_MakeLin ******/
		/****** md5 signature: d1d3b5deb2b7b5c3d6d6e14808ed4c56 ******/
		%feature("compactdefaultargs") gce_MakeLin;
		%feature("autodoc", "
Parameters
----------
Lin: gp_Lin
Point: gp_Pnt

Return
-------
None

Description
-----------
Make a Lin from gp <TheLin> parallel to another Lin <Lin> and passing through a Pnt <Point>.
") gce_MakeLin;
		 gce_MakeLin(const gp_Lin & Lin, const gp_Pnt & Point);

		/****** gce_MakeLin::gce_MakeLin ******/
		/****** md5 signature: 87f2d4a0a3932e94eb5983903c6ae458 ******/
		%feature("compactdefaultargs") gce_MakeLin;
		%feature("autodoc", "
Parameters
----------
P1: gp_Pnt
P2: gp_Pnt

Return
-------
None

Description
-----------
Make a Lin from gp <TheLin> passing through 2 Pnt <P1>,<P2>. It returns false if <p1> and <P2> are confused.
") gce_MakeLin;
		 gce_MakeLin(const gp_Pnt & P1, const gp_Pnt & P2);

		/****** gce_MakeLin::Operator ******/
		/****** md5 signature: b64abf88dbd83b1695b35b247ec38d6e ******/
		%feature("compactdefaultargs") Operator;
		%feature("autodoc", "Return
-------
gp_Lin

Description
-----------
No available documentation.
") Operator;
		const gp_Lin Operator();

		/****** gce_MakeLin::Value ******/
		/****** md5 signature: aa51ff7220c70b92e8cbc04404c62b4a ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Return
-------
gp_Lin

Description
-----------
Returns the constructed line. Exceptions StdFail_NotDone is raised if no line is constructed.
") Value;
		const gp_Lin Value();

};


%extend gce_MakeLin {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************
* class gce_MakeLin2d *
**********************/
class gce_MakeLin2d : public gce_Root {
	public:
		/****** gce_MakeLin2d::gce_MakeLin2d ******/
		/****** md5 signature: a24a37f0c41dd7c49319e47bba652976 ******/
		%feature("compactdefaultargs") gce_MakeLin2d;
		%feature("autodoc", "
Parameters
----------
A: gp_Ax2d

Return
-------
None

Description
-----------
Creates a line located with A.
") gce_MakeLin2d;
		 gce_MakeLin2d(const gp_Ax2d & A);

		/****** gce_MakeLin2d::gce_MakeLin2d ******/
		/****** md5 signature: c0d391b5b1605a42922b79c435fb9d40 ******/
		%feature("compactdefaultargs") gce_MakeLin2d;
		%feature("autodoc", "
Parameters
----------
P: gp_Pnt2d
V: gp_Dir2d

Return
-------
None

Description
-----------
<P> is the location point (origin) of the line and <V> is the direction of the line.
") gce_MakeLin2d;
		 gce_MakeLin2d(const gp_Pnt2d & P, const gp_Dir2d & V);

		/****** gce_MakeLin2d::gce_MakeLin2d ******/
		/****** md5 signature: 8d5ed2feefdc542926272b2c8072a7ca ******/
		%feature("compactdefaultargs") gce_MakeLin2d;
		%feature("autodoc", "
Parameters
----------
A: float
B: float
C: float

Return
-------
None

Description
-----------
Creates the line from the equation A*X + B*Y + C = 0.0 the status is 'NullAxis'if Sqrt(A*A + B*B) <= Resolution from gp.
") gce_MakeLin2d;
		 gce_MakeLin2d(const Standard_Real A, const Standard_Real B, const Standard_Real C);

		/****** gce_MakeLin2d::gce_MakeLin2d ******/
		/****** md5 signature: b85383246ca972f79e398952bee2d399 ******/
		%feature("compactdefaultargs") gce_MakeLin2d;
		%feature("autodoc", "
Parameters
----------
Lin: gp_Lin2d
Dist: float

Return
-------
None

Description
-----------
Make a Lin2d from gp <TheLin> parallel to another Lin2d <Lin> at a distance <Dist>. If Dist is greater than zero the result is on the right of the Line <Lin>, else the result is on the left of the Line <Lin>.
") gce_MakeLin2d;
		 gce_MakeLin2d(const gp_Lin2d & Lin, const Standard_Real Dist);

		/****** gce_MakeLin2d::gce_MakeLin2d ******/
		/****** md5 signature: 35631e65b93d7fbc96242188e420ef64 ******/
		%feature("compactdefaultargs") gce_MakeLin2d;
		%feature("autodoc", "
Parameters
----------
Lin: gp_Lin2d
Point: gp_Pnt2d

Return
-------
None

Description
-----------
Make a Lin2d from gp <TheLin> parallel to another Lin2d <Lin> and passing through a Pnt2d <Point>.
") gce_MakeLin2d;
		 gce_MakeLin2d(const gp_Lin2d & Lin, const gp_Pnt2d & Point);

		/****** gce_MakeLin2d::gce_MakeLin2d ******/
		/****** md5 signature: 31a39630dd7a4f5d771f9decf68aa23e ******/
		%feature("compactdefaultargs") gce_MakeLin2d;
		%feature("autodoc", "
Parameters
----------
P1: gp_Pnt2d
P2: gp_Pnt2d

Return
-------
None

Description
-----------
Make a Lin2d from gp <TheLin> passing through 2 Pnt2d <P1>,<P2>. It returns false if <P1> and <P2> are confused. Warning If an error occurs (that is, when IsDone returns false), the Status function returns: - gce_NullAxis if Sqrt(A*A + B*B) is less than or equal to gp::Resolution(), or - gce_ConfusedPoints if points P1 and P2 are coincident.
") gce_MakeLin2d;
		 gce_MakeLin2d(const gp_Pnt2d & P1, const gp_Pnt2d & P2);

		/****** gce_MakeLin2d::Operator ******/
		/****** md5 signature: 023c9ab652161c11f3ee3a9be608e755 ******/
		%feature("compactdefaultargs") Operator;
		%feature("autodoc", "Return
-------
gp_Lin2d

Description
-----------
No available documentation.
") Operator;
		gp_Lin2d Operator();

		/****** gce_MakeLin2d::Value ******/
		/****** md5 signature: 61baf2972e07bf24588bc99e320b2b19 ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Return
-------
gp_Lin2d

Description
-----------
Returns the constructed line. Exceptions StdFail_NotDone if no line is constructed.
") Value;
		gp_Lin2d Value();

};


%extend gce_MakeLin2d {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************
* class gce_MakeParab *
**********************/
class gce_MakeParab : public gce_Root {
	public:
		/****** gce_MakeParab::gce_MakeParab ******/
		/****** md5 signature: f08fbe7e258b403fe51b74d48892fa19 ******/
		%feature("compactdefaultargs") gce_MakeParab;
		%feature("autodoc", "
Parameters
----------
A2: gp_Ax2
Focal: float

Return
-------
None

Description
-----------
--- Purpose ; Creates a parabola with its local coordinate system 'A2' and it's focal length 'Focal'. The XDirection of A2 defines the axis of symmetry of the parabola. The YDirection of A2 is parallel to the directrix of the parabola. The Location point of A2 is the vertex of the parabola The status is 'NullFocusLength' if Focal < 0.0.
") gce_MakeParab;
		 gce_MakeParab(const gp_Ax2 & A2, const Standard_Real Focal);

		/****** gce_MakeParab::gce_MakeParab ******/
		/****** md5 signature: b981c9a0d1c6568b7681d85a6996dc0b ******/
		%feature("compactdefaultargs") gce_MakeParab;
		%feature("autodoc", "
Parameters
----------
D: gp_Ax1
F: gp_Pnt

Return
-------
None

Description
-----------
D is the directrix of the parabola and F the focus point. The symmetry axis (XAxis) of the parabola is normal to the directrix and pass through the focus point F, but its location point is the vertex of the parabola. The YAxis of the parabola is parallel to D and its location point is the vertex of the parabola. The normal to the plane of the parabola is the cross product between the XAxis and the YAxis.
") gce_MakeParab;
		 gce_MakeParab(const gp_Ax1 & D, const gp_Pnt & F);

		/****** gce_MakeParab::Operator ******/
		/****** md5 signature: 9993dff4c546c7aaf19499a00d62e367 ******/
		%feature("compactdefaultargs") Operator;
		%feature("autodoc", "Return
-------
gp_Parab

Description
-----------
No available documentation.
") Operator;
		const gp_Parab Operator();

		/****** gce_MakeParab::Value ******/
		/****** md5 signature: 9ee9c4b368b21971b46e44b72348fe43 ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Return
-------
gp_Parab

Description
-----------
Returns the constructed parabola. Exceptions StdFail_NotDone if no parabola is constructed.
") Value;
		const gp_Parab Value();

};


%extend gce_MakeParab {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************
* class gce_MakeParab2d *
************************/
class gce_MakeParab2d : public gce_Root {
	public:
		/****** gce_MakeParab2d::gce_MakeParab2d ******/
		/****** md5 signature: 6ce4462f53bd0da3914f6f44fe9817db ******/
		%feature("compactdefaultargs") gce_MakeParab2d;
		%feature("autodoc", "
Parameters
----------
MirrorAxis: gp_Ax2d
Focal: float
Sense: bool (optional, default to Standard_True)

Return
-------
None

Description
-----------
Creates a parabola with its axis of symmetry ('MirrorAxis') and its focal length. Warnings: It is possible to have Focal = 0. The status is 'NullFocalLength' Raised if Focal < 0.0.
") gce_MakeParab2d;
		 gce_MakeParab2d(const gp_Ax2d & MirrorAxis, const Standard_Real Focal, const Standard_Boolean Sense = Standard_True);

		/****** gce_MakeParab2d::gce_MakeParab2d ******/
		/****** md5 signature: 7ac1061505380e563342481c72192db7 ******/
		%feature("compactdefaultargs") gce_MakeParab2d;
		%feature("autodoc", "
Parameters
----------
A: gp_Ax22d
Focal: float

Return
-------
None

Description
-----------
Creates a parabola with its local coordinate system <A> and its focal length. Warnings: It is possible to have Focal = 0. The status is 'NullFocalLength' Raised if Focal < 0.0.
") gce_MakeParab2d;
		 gce_MakeParab2d(const gp_Ax22d & A, const Standard_Real Focal);

		/****** gce_MakeParab2d::gce_MakeParab2d ******/
		/****** md5 signature: 63315b4c462767705ecbd25cf6f640b5 ******/
		%feature("compactdefaultargs") gce_MakeParab2d;
		%feature("autodoc", "
Parameters
----------
D: gp_Ax2d
F: gp_Pnt2d
Sense: bool (optional, default to Standard_True)

Return
-------
None

Description
-----------
Creates a parabola with the directrix and the focus point. The sense of parametrization is given by Sense.
") gce_MakeParab2d;
		 gce_MakeParab2d(const gp_Ax2d & D, const gp_Pnt2d & F, const Standard_Boolean Sense = Standard_True);

		/****** gce_MakeParab2d::gce_MakeParab2d ******/
		/****** md5 signature: 3fddf1794aa324b04a5bc2dcab4a2c45 ******/
		%feature("compactdefaultargs") gce_MakeParab2d;
		%feature("autodoc", "
Parameters
----------
S1: gp_Pnt2d
Center: gp_Pnt2d
Sense: bool (optional, default to Standard_True)

Return
-------
None

Description
-----------
Make an Parab2d with S1 as the Focal point and Center as the apex of the parabola Warning The MakeParab2d class does not prevent the construction of a parabola with a null focal distance. If an error occurs (that is, when IsDone returns false), the Status function returns: - gce_NullFocusLength if Focal is less than 0.0, or - gce_NullAxis if S1 and Center are coincident.
") gce_MakeParab2d;
		 gce_MakeParab2d(const gp_Pnt2d & S1, const gp_Pnt2d & Center, const Standard_Boolean Sense = Standard_True);

		/****** gce_MakeParab2d::Operator ******/
		/****** md5 signature: 8aebdbe718ee347ad06db951c0275618 ******/
		%feature("compactdefaultargs") Operator;
		%feature("autodoc", "Return
-------
gp_Parab2d

Description
-----------
No available documentation.
") Operator;
		const gp_Parab2d Operator();

		/****** gce_MakeParab2d::Value ******/
		/****** md5 signature: a8d0aaf5b68fb92d9a86783219d160c6 ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Return
-------
gp_Parab2d

Description
-----------
Returns the constructed parabola. Exceptions StdFail_NotDone if no parabola is constructed.
") Value;
		const gp_Parab2d Value();

};


%extend gce_MakeParab2d {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************
* class gce_MakePln *
********************/
class gce_MakePln : public gce_Root {
	public:
		/****** gce_MakePln::gce_MakePln ******/
		/****** md5 signature: dd9fb0732287bd6d2a6568ddce18eb4b ******/
		%feature("compactdefaultargs") gce_MakePln;
		%feature("autodoc", "
Parameters
----------
A2: gp_Ax2

Return
-------
None

Description
-----------
The coordinate system of the plane is defined with the axis placement A2. The 'Direction' of A2 defines the normal to the plane. The 'Location' of A2 defines the location (origin) of the plane. The 'XDirection' and 'YDirection' of A2 define the 'XAxis' and the 'YAxis' of the plane used to parametrize the plane.
") gce_MakePln;
		 gce_MakePln(const gp_Ax2 & A2);

		/****** gce_MakePln::gce_MakePln ******/
		/****** md5 signature: f8334e17ec748cf3079e1c76d962557e ******/
		%feature("compactdefaultargs") gce_MakePln;
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
Creates a plane with the 'Location' point <P> and the normal direction <V>.
") gce_MakePln;
		 gce_MakePln(const gp_Pnt & P, const gp_Dir & V);

		/****** gce_MakePln::gce_MakePln ******/
		/****** md5 signature: a213676464280b8bf7f7ed394b0911c4 ******/
		%feature("compactdefaultargs") gce_MakePln;
		%feature("autodoc", "
Parameters
----------
A: float
B: float
C: float
D: float

Return
-------
None

Description
-----------
Creates a plane from its cartesian equation: A * X + B * Y + C * Z + D = 0.0 //! the status is 'BadEquation' if Sqrt (A*A + B*B + C*C) <= Resolution from gp.
") gce_MakePln;
		 gce_MakePln(const Standard_Real A, const Standard_Real B, const Standard_Real C, const Standard_Real D);

		/****** gce_MakePln::gce_MakePln ******/
		/****** md5 signature: 41b365f831ce1f3eb7bd59d1ef04a467 ******/
		%feature("compactdefaultargs") gce_MakePln;
		%feature("autodoc", "
Parameters
----------
Pln: gp_Pln
Point: gp_Pnt

Return
-------
None

Description
-----------
Make a Pln from gp <ThePln> parallel to another Pln <Pln> and passing through a Pnt <Point>.
") gce_MakePln;
		 gce_MakePln(const gp_Pln & Pln, const gp_Pnt & Point);

		/****** gce_MakePln::gce_MakePln ******/
		/****** md5 signature: 2d1af5be7261492c27624b5286909af0 ******/
		%feature("compactdefaultargs") gce_MakePln;
		%feature("autodoc", "
Parameters
----------
Pln: gp_Pln
Dist: float

Return
-------
None

Description
-----------
Make a Pln from gp <ThePln> parallel to another Pln <Pln> at the distance <Dist> which can be greater or less than zero. In the first case the result is at the distance <Dist> to the plane <Pln> in the direction of the normal to <Pln>. Otherwise it is in the opposite direction.
") gce_MakePln;
		 gce_MakePln(const gp_Pln & Pln, const Standard_Real Dist);

		/****** gce_MakePln::gce_MakePln ******/
		/****** md5 signature: 79f90be52176b290dea97ec2916fdfb2 ******/
		%feature("compactdefaultargs") gce_MakePln;
		%feature("autodoc", "
Parameters
----------
P1: gp_Pnt
P2: gp_Pnt
P3: gp_Pnt

Return
-------
None

Description
-----------
Make a Pln from gp <ThePln> passing through 3 Pnt <P1>,<P2>,<P3>. It returns false if <P1> <P2> <P3> are confused.
") gce_MakePln;
		 gce_MakePln(const gp_Pnt & P1, const gp_Pnt & P2, const gp_Pnt & P3);

		/****** gce_MakePln::gce_MakePln ******/
		/****** md5 signature: 8942573ee512e62a8c2fbafbc8bf4401 ******/
		%feature("compactdefaultargs") gce_MakePln;
		%feature("autodoc", "
Parameters
----------
P1: gp_Pnt
P2: gp_Pnt

Return
-------
None

Description
-----------
Make a Pln from gp <ThePln> perpendicular to the line passing through <P1>,<P2>. The status is 'ConfusedPoints' if <P1> <P2> are confused.
") gce_MakePln;
		 gce_MakePln(const gp_Pnt & P1, const gp_Pnt & P2);

		/****** gce_MakePln::gce_MakePln ******/
		/****** md5 signature: be3b94197ba40784fd74de5956b4c315 ******/
		%feature("compactdefaultargs") gce_MakePln;
		%feature("autodoc", "
Parameters
----------
Axis: gp_Ax1

Return
-------
None

Description
-----------
Make a pln passing through the location of <Axis>and normal to the Direction of <Axis>. Warning - If an error occurs (that is, when IsDone returns false), the Status function returns: - gce_BadEquation if Sqrt(A*A + B*B + C*C) is less than or equal to gp::Resolution(), - gce_ConfusedPoints if P1 and P2 are coincident, or - gce_ColinearPoints if P1, P2 and P3 are collinear.
") gce_MakePln;
		 gce_MakePln(const gp_Ax1 & Axis);

		/****** gce_MakePln::Operator ******/
		/****** md5 signature: aba4ca1f8a2e6f82a8fd2c02b81ce1dc ******/
		%feature("compactdefaultargs") Operator;
		%feature("autodoc", "Return
-------
gp_Pln

Description
-----------
No available documentation.
") Operator;
		const gp_Pln Operator();

		/****** gce_MakePln::Value ******/
		/****** md5 signature: 900f98bc0780d72b62895393b324439d ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Return
-------
gp_Pln

Description
-----------
Returns the constructed plane. Exceptions StdFail_NotDone if no plane is constructed.
") Value;
		const gp_Pln Value();

};


%extend gce_MakePln {
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
