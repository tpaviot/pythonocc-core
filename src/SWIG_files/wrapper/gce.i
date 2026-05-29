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
%define GCEDOCSTRING
"gce module, see official documentation at
https://dev.opencascade.org/doc/occt-7.9.0/refman/html/package_gce.html"
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
Constructs a central symmetry about a point. 
Input parameter: Point center point.
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
Constructs an axial symmetry about an axis. 
Input parameter: Axis mirror axis.
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
Constructs an axial symmetry about a line. 
Input parameter: Line mirror line.
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
Constructs an axial symmetry about an axis defined by point and direction. 
Input parameter: Point point on the axis 
Input parameter: Direc axis direction.
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
Constructs a planar symmetry about a plane. 
Input parameter: Plane mirror plane.
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
Constructs a planar symmetry about a plane. 
Input parameter: Plane mirror plane.
") gce_MakeMirror;
		 gce_MakeMirror(const gp_Ax2 & Plane);

		/****** gce_MakeMirror::Operator ******/
		/****** md5 signature: 575676c949e30845e1c1c43ef47540a8 ******/
		%feature("compactdefaultargs") Operator;
		%feature("autodoc", "Return
-------
gp_Trsf

Description
-----------
Alias for Value() returning a copy. 
Return: resulting transformation.
") Operator;
		gp_Trsf Operator();

		/****** gce_MakeMirror::Value ******/
		/****** md5 signature: 1a1c0ee31a7acb966675b285067f5d9c ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Return
-------
gp_Trsf

Description
-----------
Returns the constructed transformation. 
Return: resulting transformation.
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
Constructs a central symmetry about a point. 
Input parameter: Point center point.
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
Constructs an axial symmetry about an axis. 
Input parameter: Axis mirror axis.
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
Constructs an axial symmetry about a line. 
Input parameter: Line mirror line.
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
Constructs an axial symmetry about an axis defined by point and direction. 
Input parameter: Point point on the axis 
Input parameter: Direc axis direction.
") gce_MakeMirror2d;
		 gce_MakeMirror2d(const gp_Pnt2d & Point, const gp_Dir2d & Direc);

		/****** gce_MakeMirror2d::Operator ******/
		/****** md5 signature: 9c2ecd3b06e0d4258aefcf3ab4687f94 ******/
		%feature("compactdefaultargs") Operator;
		%feature("autodoc", "Return
-------
gp_Trsf2d

Description
-----------
Alias for Value() returning a copy. 
Return: resulting transformation.
") Operator;
		gp_Trsf2d Operator();

		/****** gce_MakeMirror2d::Value ******/
		/****** md5 signature: 7e81229e88786c4e4655049c893c29a1 ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Return
-------
gp_Trsf2d

Description
-----------
Returns the constructed transformation. 
Return: resulting transformation.
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
		/****** md5 signature: ee7273d75a9931c988f03494be7e822f ******/
		%feature("compactdefaultargs") gce_MakeRotation;
		%feature("autodoc", "
Parameters
----------
Line: gp_Lin
Angle: double

Return
-------
None

Description
-----------
Constructs a rotation around the axis defined by a line. 
Input parameter: Line rotation axis 
Input parameter: Angle rotation angle in radians.
") gce_MakeRotation;
		 gce_MakeRotation(const gp_Lin & Line, const double Angle);

		/****** gce_MakeRotation::gce_MakeRotation ******/
		/****** md5 signature: 279f91daa2ed51fb07eb8b4c67e76df2 ******/
		%feature("compactdefaultargs") gce_MakeRotation;
		%feature("autodoc", "
Parameters
----------
Axis: gp_Ax1
Angle: double

Return
-------
None

Description
-----------
Constructs a rotation around an axis. 
Input parameter: Axis rotation axis 
Input parameter: Angle rotation angle in radians.
") gce_MakeRotation;
		 gce_MakeRotation(const gp_Ax1 & Axis, const double Angle);

		/****** gce_MakeRotation::gce_MakeRotation ******/
		/****** md5 signature: 48fd73f29237838225e0a5fc5f211044 ******/
		%feature("compactdefaultargs") gce_MakeRotation;
		%feature("autodoc", "
Parameters
----------
Point: gp_Pnt
Direc: gp_Dir
Angle: double

Return
-------
None

Description
-----------
Constructs a rotation around an axis defined by point and direction. 
Input parameter: Point point on the axis 
Input parameter: Direc axis direction 
Input parameter: Angle rotation angle in radians.
") gce_MakeRotation;
		 gce_MakeRotation(const gp_Pnt & Point, const gp_Dir & Direc, const double Angle);

		/****** gce_MakeRotation::Operator ******/
		/****** md5 signature: 575676c949e30845e1c1c43ef47540a8 ******/
		%feature("compactdefaultargs") Operator;
		%feature("autodoc", "Return
-------
gp_Trsf

Description
-----------
Alias for Value() returning a copy. 
Return: resulting transformation.
") Operator;
		gp_Trsf Operator();

		/****** gce_MakeRotation::Value ******/
		/****** md5 signature: 1a1c0ee31a7acb966675b285067f5d9c ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Return
-------
gp_Trsf

Description
-----------
Returns the constructed transformation. 
Return: resulting transformation.
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
		/****** md5 signature: 6f6dcb47b9629fabc1341aa18ac71207 ******/
		%feature("compactdefaultargs") gce_MakeRotation2d;
		%feature("autodoc", "
Parameters
----------
Point: gp_Pnt2d
Angle: double

Return
-------
None

Description
-----------
Constructs a rotation around a point in 2D. 
Input parameter: Point rotation center 
Input parameter: Angle rotation angle in radians.
") gce_MakeRotation2d;
		 gce_MakeRotation2d(const gp_Pnt2d & Point, const double Angle);

		/****** gce_MakeRotation2d::Operator ******/
		/****** md5 signature: 9c2ecd3b06e0d4258aefcf3ab4687f94 ******/
		%feature("compactdefaultargs") Operator;
		%feature("autodoc", "Return
-------
gp_Trsf2d

Description
-----------
Alias for Value() returning a copy. 
Return: resulting transformation.
") Operator;
		gp_Trsf2d Operator();

		/****** gce_MakeRotation2d::Value ******/
		/****** md5 signature: 7e81229e88786c4e4655049c893c29a1 ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Return
-------
gp_Trsf2d

Description
-----------
Returns the constructed transformation. 
Return: resulting transformation.
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
		/****** md5 signature: 72bdb49f5521eb739385114bbab6cd23 ******/
		%feature("compactdefaultargs") gce_MakeScale;
		%feature("autodoc", "
Parameters
----------
Point: gp_Pnt
Scale: double

Return
-------
None

Description
-----------
Constructs a scaling transformation. 
Input parameter: Point center of scaling 
Input parameter: Scale scale factor.
") gce_MakeScale;
		 gce_MakeScale(const gp_Pnt & Point, const double Scale);

		/****** gce_MakeScale::Operator ******/
		/****** md5 signature: 575676c949e30845e1c1c43ef47540a8 ******/
		%feature("compactdefaultargs") Operator;
		%feature("autodoc", "Return
-------
gp_Trsf

Description
-----------
Alias for Value() returning a copy. 
Return: resulting transformation.
") Operator;
		gp_Trsf Operator();

		/****** gce_MakeScale::Value ******/
		/****** md5 signature: 1a1c0ee31a7acb966675b285067f5d9c ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Return
-------
gp_Trsf

Description
-----------
Returns the constructed transformation. 
Return: resulting transformation.
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
		/****** md5 signature: d5e15ffdca453ad23549a465f7c0d61b ******/
		%feature("compactdefaultargs") gce_MakeScale2d;
		%feature("autodoc", "
Parameters
----------
Point: gp_Pnt2d
Scale: double

Return
-------
None

Description
-----------
Constructs a scaling transformation. 
Input parameter: Point center of scaling 
Input parameter: Scale scale factor.
") gce_MakeScale2d;
		 gce_MakeScale2d(const gp_Pnt2d & Point, const double Scale);

		/****** gce_MakeScale2d::Operator ******/
		/****** md5 signature: 9c2ecd3b06e0d4258aefcf3ab4687f94 ******/
		%feature("compactdefaultargs") Operator;
		%feature("autodoc", "Return
-------
gp_Trsf2d

Description
-----------
Alias for Value() returning a copy. 
Return: resulting transformation.
") Operator;
		gp_Trsf2d Operator();

		/****** gce_MakeScale2d::Value ******/
		/****** md5 signature: 7e81229e88786c4e4655049c893c29a1 ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Return
-------
gp_Trsf2d

Description
-----------
Returns the constructed transformation. 
Return: resulting transformation.
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
Constructs a translation from a vector. 
Input parameter: Vect translation vector.
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
Constructs a translation from two points. 
Input parameter: Point1 start point 
Input parameter: Point2 end point.
") gce_MakeTranslation;
		 gce_MakeTranslation(const gp_Pnt & Point1, const gp_Pnt & Point2);

		/****** gce_MakeTranslation::Operator ******/
		/****** md5 signature: 575676c949e30845e1c1c43ef47540a8 ******/
		%feature("compactdefaultargs") Operator;
		%feature("autodoc", "Return
-------
gp_Trsf

Description
-----------
Alias for Value() returning a copy. 
Return: resulting transformation.
") Operator;
		gp_Trsf Operator();

		/****** gce_MakeTranslation::Value ******/
		/****** md5 signature: 1a1c0ee31a7acb966675b285067f5d9c ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Return
-------
gp_Trsf

Description
-----------
Returns the constructed transformation. 
Return: resulting transformation.
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
Constructs a translation from a vector. 
Input parameter: Vect translation vector.
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
Constructs a translation from two points. 
Input parameter: Point1 start point 
Input parameter: Point2 end point.
") gce_MakeTranslation2d;
		 gce_MakeTranslation2d(const gp_Pnt2d & Point1, const gp_Pnt2d & Point2);

		/****** gce_MakeTranslation2d::Operator ******/
		/****** md5 signature: 9c2ecd3b06e0d4258aefcf3ab4687f94 ******/
		%feature("compactdefaultargs") Operator;
		%feature("autodoc", "Return
-------
gp_Trsf2d

Description
-----------
Alias for Value() returning a copy. 
Return: resulting transformation.
") Operator;
		gp_Trsf2d Operator();

		/****** gce_MakeTranslation2d::Value ******/
		/****** md5 signature: 7e81229e88786c4e4655049c893c29a1 ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Return
-------
gp_Trsf2d

Description
-----------
Returns the constructed transformation. 
Return: resulting transformation.
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
		/****** md5 signature: 05e29e49040d98b489fbc7af11aabb8e ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if the construction is successful. 
Return: true if status is `gce_Done`.
") IsDone;
		bool IsDone();

		/****** gce_Root::IsError ******/
		/****** md5 signature: 926e3ad6adc82382f85c46ca0724537b ******/
		%feature("compactdefaultargs") IsError;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if the construction has failed. 
Return: true if status is not `gce_Done`.
") IsError;
		bool IsError();

		/****** gce_Root::Status ******/
		/****** md5 signature: 66f985f20df8a3d887a3bcea9f94ad53 ******/
		%feature("compactdefaultargs") Status;
		%feature("autodoc", "Return
-------
gce_ErrorType

Description
-----------
Returns the status of the construction: - gce_Done, if the construction is successful, or - another value of the gce_ErrorType enumeration indicating why the construction failed. 
Return: construction status.
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
		/****** md5 signature: 5a2154f1dd8212e0849bd1d487edcbc1 ******/
		%feature("compactdefaultargs") gce_MakeCirc;
		%feature("autodoc", "
Parameters
----------
A2: gp_Ax2
Radius: double

Return
-------
None

Description
-----------
Creates a circle from axis placement and radius. @note Construction fails with `gce_NegativeRadius` if `Radius` is negative. 
Input parameter: A2 local coordinate system 
Input parameter: Radius radius value.
") gce_MakeCirc;
		 gce_MakeCirc(const gp_Ax2 & A2, const double Radius);

		/****** gce_MakeCirc::gce_MakeCirc ******/
		/****** md5 signature: 5d78d19a3d4b7234e44cc12990b749af ******/
		%feature("compactdefaultargs") gce_MakeCirc;
		%feature("autodoc", "
Parameters
----------
Circ: gp_Circ
Dist: double

Return
-------
None

Description
-----------
Creates a circle coaxial to input circle at signed distance. @note If `Dist` is positive, the result encloses `Circ`. @note If `Dist` is negative, the result is enclosed by `Circ`. 
Input parameter: Circ source circle 
Input parameter: Dist signed distance.
") gce_MakeCirc;
		 gce_MakeCirc(const gp_Circ & Circ, const double Dist);

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
Creates a circle coaxial to input circle and passing through a point. 
Input parameter: Circ source circle 
Input parameter: Point reference point.
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
Creates a circle passing through three points. 
Input parameter: P1 first point 
Input parameter: P2 second point 
Input parameter: P3 third point.
") gce_MakeCirc;
		 gce_MakeCirc(const gp_Pnt & P1, const gp_Pnt & P2, const gp_Pnt & P3);

		/****** gce_MakeCirc::gce_MakeCirc ******/
		/****** md5 signature: d4ed3da86d7f7a4149ea24703f6515cd ******/
		%feature("compactdefaultargs") gce_MakeCirc;
		%feature("autodoc", "
Parameters
----------
Center: gp_Pnt
Norm: gp_Dir
Radius: double

Return
-------
None

Description
-----------
Creates a circle from center, plane normal and radius. 
Input parameter: Center center point 
Input parameter: Norm input value 
Input parameter: Radius radius value.
") gce_MakeCirc;
		 gce_MakeCirc(const gp_Pnt & Center, const gp_Dir & Norm, const double Radius);

		/****** gce_MakeCirc::gce_MakeCirc ******/
		/****** md5 signature: 2b2099d282ce15448e55fcab75db596a ******/
		%feature("compactdefaultargs") gce_MakeCirc;
		%feature("autodoc", "
Parameters
----------
Center: gp_Pnt
Plane: gp_Pln
Radius: double

Return
-------
None

Description
-----------
Creates a circle from center, reference plane and radius. 
Input parameter: Center center point 
Input parameter: Plane reference plane 
Input parameter: Radius radius value.
") gce_MakeCirc;
		 gce_MakeCirc(const gp_Pnt & Center, const gp_Pln & Plane, const double Radius);

		/****** gce_MakeCirc::gce_MakeCirc ******/
		/****** md5 signature: 5bcd7d688252809f7321280188df6cfa ******/
		%feature("compactdefaultargs") gce_MakeCirc;
		%feature("autodoc", "
Parameters
----------
Center: gp_Pnt
Ptaxis: gp_Pnt
Radius: double

Return
-------
None

Description
-----------
Creates a circle from center, axis-defining point and radius. 
Input parameter: Center center point 
Input parameter: Ptaxis point defining axis direction 
Input parameter: Radius radius value.
") gce_MakeCirc;
		 gce_MakeCirc(const gp_Pnt & Center, const gp_Pnt & Ptaxis, const double Radius);

		/****** gce_MakeCirc::gce_MakeCirc ******/
		/****** md5 signature: d7788f9a9f205deec14d607390e20790 ******/
		%feature("compactdefaultargs") gce_MakeCirc;
		%feature("autodoc", "
Parameters
----------
Axis: gp_Ax1
Radius: double

Return
-------
None

Description
-----------
Creates a circle from axis and radius. @note Construction fails with `gce_NegativeRadius` if `Radius` is negative. 
Input parameter: Axis axis definition 
Input parameter: Radius radius value.
") gce_MakeCirc;
		 gce_MakeCirc(const gp_Ax1 & Axis, const double Radius);

		/****** gce_MakeCirc::Operator ******/
		/****** md5 signature: 2ce2437dab317404afb18bb17eee61ec ******/
		%feature("compactdefaultargs") Operator;
		%feature("autodoc", "Return
-------
gp_Circ

Description
-----------
Alias for Value() returning a copy. 
Return: resulting object.
") Operator;
		gp_Circ Operator();

		/****** gce_MakeCirc::Value ******/
		/****** md5 signature: c56b9c2cad29727eb572682c1d680252 ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Return
-------
gp_Circ

Description
-----------
Returns the constructed circle. Exceptions StdFail_NotDone if no circle is constructed. 
Return: resulting circle.
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
		/****** md5 signature: eafe5f1dba6c301bccbfbc64fc47b6e9 ******/
		%feature("compactdefaultargs") gce_MakeCirc2d;
		%feature("autodoc", "
Parameters
----------
XAxis: gp_Ax2d
Radius: double
Sense: bool (optional, default to true)

Return
-------
None

Description
-----------
Creates a circle from axis and radius. @note The location of `XAxis` is the circle center. @note Construction fails with `gce_NegativeRadius` if `Radius` is negative. 
Input parameter: XAxis axis placement 
Input parameter: Radius radius value 
Input parameter: Sense orientation flag.
") gce_MakeCirc2d;
		 gce_MakeCirc2d(const gp_Ax2d & XAxis, const double Radius, const bool Sense = true);

		/****** gce_MakeCirc2d::gce_MakeCirc2d ******/
		/****** md5 signature: 05ed7db72777e3d48d5a46d25b0b5d6c ******/
		%feature("compactdefaultargs") gce_MakeCirc2d;
		%feature("autodoc", "
Parameters
----------
Axis: gp_Ax22d
Radius: double

Return
-------
None

Description
-----------
Creates a circle from local coordinate system and radius. @note The location of `Axis` is the circle center. @note Construction fails with `gce_NegativeRadius` if `Radius` is negative. 
Input parameter: Axis axis definition 
Input parameter: Radius radius value.
") gce_MakeCirc2d;
		 gce_MakeCirc2d(const gp_Ax22d & Axis, const double Radius);

		/****** gce_MakeCirc2d::gce_MakeCirc2d ******/
		/****** md5 signature: 729af6e4cbb00ba8ee60f9e8f6527abc ******/
		%feature("compactdefaultargs") gce_MakeCirc2d;
		%feature("autodoc", "
Parameters
----------
Circ: gp_Circ2d
Dist: double

Return
-------
None

Description
-----------
Creates a circle concentric to input circle with signed offset. @note Result radius is `Abs(Circ.Radius() + Dist)`. 
Input parameter: Circ source circle 
Input parameter: Dist signed distance.
") gce_MakeCirc2d;
		 gce_MakeCirc2d(const gp_Circ2d & Circ, const double Dist);

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
Creates a circle concentric to input circle and passing through a point. 
Input parameter: Circ source circle 
Input parameter: Point reference point.
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
Creates a circle passing through three points. @note The local coordinate system of the result is derived from input points. 
Input parameter: P1 first point 
Input parameter: P2 second point 
Input parameter: P3 third point.
") gce_MakeCirc2d;
		 gce_MakeCirc2d(const gp_Pnt2d & P1, const gp_Pnt2d & P2, const gp_Pnt2d & P3);

		/****** gce_MakeCirc2d::gce_MakeCirc2d ******/
		/****** md5 signature: fd0c9ffe8589267670b372ac36dc6e99 ******/
		%feature("compactdefaultargs") gce_MakeCirc2d;
		%feature("autodoc", "
Parameters
----------
Center: gp_Pnt2d
Radius: double
Sense: bool (optional, default to true)

Return
-------
None

Description
-----------
Creates a circle from center and radius. @note Construction fails with `gce_NegativeRadius` if `Radius` is negative. 
Input parameter: Center center point 
Input parameter: Radius radius value 
Input parameter: Sense orientation flag.
") gce_MakeCirc2d;
		 gce_MakeCirc2d(const gp_Pnt2d & Center, const double Radius, const bool Sense = true);

		/****** gce_MakeCirc2d::gce_MakeCirc2d ******/
		/****** md5 signature: 30ebe99d9df77d161d628743456d236f ******/
		%feature("compactdefaultargs") gce_MakeCirc2d;
		%feature("autodoc", "
Parameters
----------
Center: gp_Pnt2d
Point: gp_Pnt2d
Sense: bool (optional, default to true)

Return
-------
None

Description
-----------
Creates a circle from center and one point on circle. @note `Sense` controls result orientation. 
Input parameter: Center center point 
Input parameter: Point reference point 
Input parameter: Sense orientation flag.
") gce_MakeCirc2d;
		 gce_MakeCirc2d(const gp_Pnt2d & Center, const gp_Pnt2d & Point, const bool Sense = true);

		/****** gce_MakeCirc2d::Operator ******/
		/****** md5 signature: 8ec6f3b2d3a8928dcda647dd068e960b ******/
		%feature("compactdefaultargs") Operator;
		%feature("autodoc", "Return
-------
gp_Circ2d

Description
-----------
Alias for Value() returning a copy. 
Return: resulting object.
") Operator;
		gp_Circ2d Operator();

		/****** gce_MakeCirc2d::Value ******/
		/****** md5 signature: 6e34b8d406e23e4dff2a4f9b65064186 ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Return
-------
gp_Circ2d

Description
-----------
Returns the constructed circle. Exceptions StdFail_NotDone if no circle is constructed. 
Return: resulting circle.
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
		/****** md5 signature: 522ffbd1d0be7f3651a8cbf7797be45c ******/
		%feature("compactdefaultargs") gce_MakeCone;
		%feature("autodoc", "
Parameters
----------
A2: gp_Ax2
Ang: double
Radius: double

Return
-------
None

Description
-----------
Creates a cone from axis placement, semi-angle and reference radius. @note `A2` defines cone position and reference section plane. @note `Ang` is the cone semi-angle (radians), expected in ]0, PI/2[. @note Construction fails with `gce_NegativeRadius` if `Radius` is negative. @note Construction fails with `gce_BadAngle` if `Ang <= gp::Resolution()` or `PI/2 - Ang <= gp::Resolution()`. 
Input parameter: A2 local coordinate system 
Input parameter: Ang angle value 
Input parameter: Radius radius value.
") gce_MakeCone;
		 gce_MakeCone(const gp_Ax2 & A2, const double Ang, const double Radius);

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
Creates a cone coaxial to input cone and passing through a point. @note Construction fails with `gce_NegativeRadius` when no non-negative solution radius can be found. 
Input parameter: Cone source cone 
Input parameter: Point reference point.
") gce_MakeCone;
		 gce_MakeCone(const gp_Cone & Cone, const gp_Pnt & Point);

		/****** gce_MakeCone::gce_MakeCone ******/
		/****** md5 signature: 8e4c0b7e110920c40991c7eca13a2ace ******/
		%feature("compactdefaultargs") gce_MakeCone;
		%feature("autodoc", "
Parameters
----------
Cone: gp_Cone
Dist: double

Return
-------
None

Description
-----------
Creates a cone coaxial to input cone at signed distance. @note Construction fails with `gce_NullAngle` if semi-angle cosine is numerically too small. @note Construction fails with `gce_NegativeRadius` if resulting radius is negative. 
Input parameter: Cone source cone 
Input parameter: Dist signed distance.
") gce_MakeCone;
		 gce_MakeCone(const gp_Cone & Cone, const double Dist);

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
Creates a cone from four points. @note `P1` and `P2` define the axis direction. @note Distance from `P3` to that axis defines base radius. @note Distance from `P4` to that axis defines radius of section through `P4`. @note Construction fails with `gce_ConfusedPoints` if `P1`/`P2` or `P3`/`P4` are coincident. @note Construction fails with `gce_NullAngle` if section distances produce zero cone angle. @note Construction fails with `gce_NullRadius` for degenerate right-angle or zero-angle radius configuration. 
Input parameter: P1 first point 
Input parameter: P2 second point 
Input parameter: P3 third point 
Input parameter: P4 fourth point.
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
Creates a cone from axis and two points. @note Distance from `P1` to axis gives first section radius. @note Distance from `P2` to axis gives second section radius. @note Error status is propagated from the 4-point construction. 
Input parameter: Axis axis definition 
Input parameter: P1 first point 
Input parameter: P2 second point.
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
Creates a cone from line axis and two points. @note Distance from `P1` to axis gives first section radius. @note Distance from `P2` to axis gives second section radius. @note Error status is propagated from the 4-point construction. 
Input parameter: Axis axis definition 
Input parameter: P1 first point 
Input parameter: P2 second point.
") gce_MakeCone;
		 gce_MakeCone(const gp_Lin & Axis, const gp_Pnt & P1, const gp_Pnt & P2);

		/****** gce_MakeCone::gce_MakeCone ******/
		/****** md5 signature: 0b0a114f999f3fe168ed2f363709e064 ******/
		%feature("compactdefaultargs") gce_MakeCone;
		%feature("autodoc", "
Parameters
----------
P1: gp_Pnt
P2: gp_Pnt
R1: double
R2: double

Return
-------
None

Description
-----------
Creates a cone from two axis points and two section radii. @note The axis is the line passing through `P1` and `P2`. @note `R1` is section radius at `P1`, `R2` is section radius at `P2`. @note Construction fails with `gce_NullAxis` if `P1` and `P2` are coincident. @note Construction fails with `gce_NegativeRadius` if `R1` or `R2` is negative. @note Construction fails with `gce_NullAngle` for degenerate zero-angle or right-angle configurations. 
Input parameter: P1 first point 
Input parameter: P2 second point 
Input parameter: R1 first radius value 
Input parameter: R2 second radius value.
") gce_MakeCone;
		 gce_MakeCone(const gp_Pnt & P1, const gp_Pnt & P2, const double R1, const double R2);

		/****** gce_MakeCone::Operator ******/
		/****** md5 signature: cc24dc5c8d4cd6d2cb2ee006a45b89c7 ******/
		%feature("compactdefaultargs") Operator;
		%feature("autodoc", "Return
-------
gp_Cone

Description
-----------
Alias for Value() returning a copy. 
Return: resulting object.
") Operator;
		gp_Cone Operator();

		/****** gce_MakeCone::Value ******/
		/****** md5 signature: 02c9f577d520a037ce99491b9df1cfd1 ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Return
-------
gp_Cone

Description
-----------
Returns the constructed cone. Exceptions StdFail_NotDone if no cone is constructed. 
Return: resulting cone.
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
		/****** md5 signature: 0ebfb7851558d5a209c34a129df75ece ******/
		%feature("compactdefaultargs") gce_MakeCylinder;
		%feature("autodoc", "
Parameters
----------
A2: gp_Ax2
Radius: double

Return
-------
None

Description
-----------
Creates a cylinder from axis placement and radius. @note Construction fails with `gce_NegativeRadius` if `Radius` is negative. 
Input parameter: A2 local coordinate system 
Input parameter: Radius radius value.
") gce_MakeCylinder;
		 gce_MakeCylinder(const gp_Ax2 & A2, const double Radius);

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
Creates a cylinder coaxial to input cylinder and passing through a point. 
Input parameter: Cyl source cylinder 
Input parameter: Point reference point.
") gce_MakeCylinder;
		 gce_MakeCylinder(const gp_Cylinder & Cyl, const gp_Pnt & Point);

		/****** gce_MakeCylinder::gce_MakeCylinder ******/
		/****** md5 signature: 513ec1e2b08ed2d5e31152f45a0bcfcc ******/
		%feature("compactdefaultargs") gce_MakeCylinder;
		%feature("autodoc", "
Parameters
----------
Cyl: gp_Cylinder
Dist: double

Return
-------
None

Description
-----------
Creates a cylinder coaxial to input cylinder at signed distance. @note Construction fails with `gce_NegativeRadius` if resulting radius is negative. 
Input parameter: Cyl source cylinder 
Input parameter: Dist signed distance.
") gce_MakeCylinder;
		 gce_MakeCylinder(const gp_Cylinder & Cyl, const double Dist);

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
Creates a cylinder from three points. @note Axis is defined by points `P1` and `P2`. @note Radius is the distance from `P3` to that axis. 
Input parameter: P1 first point 
Input parameter: P2 second point 
Input parameter: P3 third point.
") gce_MakeCylinder;
		 gce_MakeCylinder(const gp_Pnt & P1, const gp_Pnt & P2, const gp_Pnt & P3);

		/****** gce_MakeCylinder::gce_MakeCylinder ******/
		/****** md5 signature: 0be74a76c77fe1a135ba5e229d45f1e8 ******/
		%feature("compactdefaultargs") gce_MakeCylinder;
		%feature("autodoc", "
Parameters
----------
Axis: gp_Ax1
Radius: double

Return
-------
None

Description
-----------
Makes a Cylinder by its axis <Axis> and radius <Radius>. 
Input parameter: Axis axis definition 
Input parameter: Radius radius value.
") gce_MakeCylinder;
		 gce_MakeCylinder(const gp_Ax1 & Axis, const double Radius);

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
Creates a cylinder from circular base. @note The resulting cylinder axis equals the circle axis. @note This constructor succeeds for any valid `Circ`. 
Input parameter: Circ source circle.
") gce_MakeCylinder;
		 gce_MakeCylinder(const gp_Circ & Circ);

		/****** gce_MakeCylinder::Operator ******/
		/****** md5 signature: 8cc6c2525b11ae867e04baba5b597667 ******/
		%feature("compactdefaultargs") Operator;
		%feature("autodoc", "Return
-------
gp_Cylinder

Description
-----------
Alias for Value() returning a copy. 
Return: resulting object.
") Operator;
		gp_Cylinder Operator();

		/****** gce_MakeCylinder::Value ******/
		/****** md5 signature: da4d9f56aaab1049dff371cefab5afb9 ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Return
-------
gp_Cylinder

Description
-----------
Returns the constructed cylinder. Exceptions StdFail_NotDone if no cylinder is constructed. 
Return: resulting cylinder.
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
Normalizes the vector V and creates a direction. @note Construction fails with `gce_NullVector` if `V.Magnitude() <= gp::Resolution()`. 
Input parameter: V direction vector.
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
Creates a direction from a coordinate vector. @note Construction fails with `gce_NullVector` if `Coord.Modulus() <= gp::Resolution()`. 
Input parameter: Coord coordinate vector.
") gce_MakeDir;
		 gce_MakeDir(const gp_XYZ & Coord);

		/****** gce_MakeDir::gce_MakeDir ******/
		/****** md5 signature: faa7fcf4119b99cc8f5efd87891f49ea ******/
		%feature("compactdefaultargs") gce_MakeDir;
		%feature("autodoc", "
Parameters
----------
Xv: double
Yv: double
Zv: double

Return
-------
None

Description
-----------
Creates a direction with its 3 cartesian coordinates. @note Construction fails with `gce_NullVector` if `Xv*Xv + Yv*Yv + Zv*Zv <= gp::Resolution()`. 
Input parameter: Xv X coordinate value 
Input parameter: Yv Y coordinate value 
Input parameter: Zv Z coordinate value.
") gce_MakeDir;
		 gce_MakeDir(const double Xv, const double Yv, const double Zv);

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
Creates a direction from two points. @note Construction fails with `gce_ConfusedPoints` if points are coincident. 
Input parameter: P1 first point 
Input parameter: P2 second point.
") gce_MakeDir;
		 gce_MakeDir(const gp_Pnt & P1, const gp_Pnt & P2);

		/****** gce_MakeDir::Operator ******/
		/****** md5 signature: 0be4cef983e5e2668e1a28d45c8f531b ******/
		%feature("compactdefaultargs") Operator;
		%feature("autodoc", "Return
-------
gp_Dir

Description
-----------
Alias for Value() returning a copy. 
Return: resulting object.
") Operator;
		gp_Dir Operator();

		/****** gce_MakeDir::Value ******/
		/****** md5 signature: 6cade6871f82c45a3a9f9daeeaa354dd ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Return
-------
gp_Dir

Description
-----------
Returns the constructed unit vector. Exceptions StdFail_NotDone if no unit vector is constructed. 
Return: resulting direction.
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
Normalizes the vector V and creates a direction. @note Construction fails with `gce_NullVector` if `V.Magnitude() <= gp::Resolution()`. 
Input parameter: V direction vector.
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
Creates a direction from a coordinate vector. @note Construction fails with `gce_NullVector` if `Coord.Modulus() <= gp::Resolution()`. 
Input parameter: Coord coordinate vector.
") gce_MakeDir2d;
		 gce_MakeDir2d(const gp_XY & Coord);

		/****** gce_MakeDir2d::gce_MakeDir2d ******/
		/****** md5 signature: 5f9fb56f96cfd660ef9528ba866d1179 ******/
		%feature("compactdefaultargs") gce_MakeDir2d;
		%feature("autodoc", "
Parameters
----------
Xv: double
Yv: double

Return
-------
None

Description
-----------
Creates a direction with its two cartesian coordinates. @note Construction fails with `gce_NullVector` if `Xv*Xv + Yv*Yv <= gp::Resolution()`. 
Input parameter: Xv X coordinate value 
Input parameter: Yv Y coordinate value.
") gce_MakeDir2d;
		 gce_MakeDir2d(const double Xv, const double Yv);

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
Creates a direction from two points. @note Construction fails with `gce_ConfusedPoints` if points are coincident. 
Input parameter: P1 first point 
Input parameter: P2 second point.
") gce_MakeDir2d;
		 gce_MakeDir2d(const gp_Pnt2d & P1, const gp_Pnt2d & P2);

		/****** gce_MakeDir2d::Operator ******/
		/****** md5 signature: f654c88192c82049f6c2e53189b0de88 ******/
		%feature("compactdefaultargs") Operator;
		%feature("autodoc", "Return
-------
gp_Dir2d

Description
-----------
Alias for Value() returning a copy. 
Return: resulting object.
") Operator;
		gp_Dir2d Operator();

		/****** gce_MakeDir2d::Value ******/
		/****** md5 signature: 95c4f74c31512119650ef1e0185cdb45 ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Return
-------
gp_Dir2d

Description
-----------
Returns the constructed unit vector. Exceptions StdFail_NotDone if no unit vector is constructed. 
Return: resulting direction.
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
		/****** md5 signature: b564cb0e1eb48bb66242b2ffdf47ac07 ******/
		%feature("compactdefaultargs") gce_MakeElips;
		%feature("autodoc", "
Parameters
----------
A2: gp_Ax2
MajorRadius: double
MinorRadius: double

Return
-------
None

Description
-----------
The major radius of the ellipse is on the 'XAxis' and the minor radius is on the 'YAxis' of the ellipse. The 'XAxis' is defined with the 'XDirection' of A2 and the 'YAxis' is defined with the 'YDirection' of A2. @note It is possible to create an ellipse with `MajorRadius == MinorRadius`. @note Construction fails with `gce_InvertRadius` if `MajorRadius < MinorRadius`. @note Construction fails with `gce_NegativeRadius` if `MinorRadius < 0.0`. 
Input parameter: A2 local coordinate system 
Input parameter: MajorRadius major radius value 
Input parameter: MinorRadius minor radius value.
") gce_MakeElips;
		 gce_MakeElips(const gp_Ax2 & A2, const double MajorRadius, const double MinorRadius);

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
Creates an ellipse from center and two points. @note `S1` defines major radius direction and value. @note Minor radius is computed as distance from `S2` to major axis. @note Construction fails with `gce_NullAxis` if `S1` and `Center` coincide. @note Construction fails with `gce_InvertAxis` when computed minor radius is null/greater than major radius, or when points are collinear. 
Input parameter: S1 first point 
Input parameter: S2 second point 
Input parameter: Center center point.
") gce_MakeElips;
		 gce_MakeElips(const gp_Pnt & S1, const gp_Pnt & S2, const gp_Pnt & Center);

		/****** gce_MakeElips::Operator ******/
		/****** md5 signature: 6657f13a47dcc30661b81beef66716f7 ******/
		%feature("compactdefaultargs") Operator;
		%feature("autodoc", "Return
-------
gp_Elips

Description
-----------
Alias for Value() returning a copy. 
Return: resulting object.
") Operator;
		gp_Elips Operator();

		/****** gce_MakeElips::Value ******/
		/****** md5 signature: 1ceba8ecb59c6d271bb293c3462f36d4 ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Return
-------
gp_Elips

Description
-----------
Returns the constructed ellipse. Exceptions StdFail_NotDone if no ellipse is constructed. 
Return: resulting ellipse.
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
		/****** md5 signature: 64f7bfefef6230fcecc4328aeb81163e ******/
		%feature("compactdefaultargs") gce_MakeElips2d;
		%feature("autodoc", "
Parameters
----------
MajorAxis: gp_Ax2d
MajorRadius: double
MinorRadius: double
Sense: bool (optional, default to true)

Return
-------
None

Description
-----------
Creates an ellipse with the major axis, the major and the minor radius. The location of the MajorAxis is the center of the ellipse. The sense of parametrization is given by Sense. It is possible to create an ellipse with MajorRadius = MinorRadius. @note Construction fails with `gce_InvertRadius` if `MajorRadius < MinorRadius`. @note Construction fails with `gce_NegativeRadius` if `MajorRadius < 0.0`. 
Input parameter: MajorAxis major axis placement 
Input parameter: MajorRadius major radius value 
Input parameter: MinorRadius minor radius value 
Input parameter: Sense orientation flag.
") gce_MakeElips2d;
		 gce_MakeElips2d(const gp_Ax2d & MajorAxis, const double MajorRadius, const double MinorRadius, const bool Sense = true);

		/****** gce_MakeElips2d::gce_MakeElips2d ******/
		/****** md5 signature: 36a870eb57bbb2ada0749cb1085ea4f4 ******/
		%feature("compactdefaultargs") gce_MakeElips2d;
		%feature("autodoc", "
Parameters
----------
A: gp_Ax22d
MajorRadius: double
MinorRadius: double

Return
-------
None

Description
-----------
Axis defines the Xaxis and Yaxis of the ellipse which defines the origin and the sense of parametrization. Creates an ellipse with the AxisPlacement the major and the minor radius. The location of Axis is the center of the ellipse. It is possible to create an ellipse with MajorRadius = MinorRadius. @note Construction fails with `gce_InvertRadius` if `MajorRadius < MinorRadius`. @note Construction fails with `gce_NegativeRadius` if `MajorRadius < 0.0`. 
Input parameter: A local coordinate system 
Input parameter: MajorRadius major radius value 
Input parameter: MinorRadius minor radius value.
") gce_MakeElips2d;
		 gce_MakeElips2d(const gp_Ax22d & A, const double MajorRadius, const double MinorRadius);

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
Creates an ellipse from center and two points. @note `S1` defines major radius direction and value. @note Minor radius is computed as distance from `S2` to major axis. @note Construction fails with `gce_NullAxis` when computed minor radius is null. @note Construction fails with `gce_InvertAxis` when computed minor radius exceeds major radius. 
Input parameter: S1 first point 
Input parameter: S2 second point 
Input parameter: Center center point.
") gce_MakeElips2d;
		 gce_MakeElips2d(const gp_Pnt2d & S1, const gp_Pnt2d & S2, const gp_Pnt2d & Center);

		/****** gce_MakeElips2d::Operator ******/
		/****** md5 signature: bdcf24d8aa8217362378bf2a65f30fa1 ******/
		%feature("compactdefaultargs") Operator;
		%feature("autodoc", "Return
-------
gp_Elips2d

Description
-----------
Alias for Value() returning a copy. 
Return: resulting object.
") Operator;
		gp_Elips2d Operator();

		/****** gce_MakeElips2d::Value ******/
		/****** md5 signature: 1c976738000b0a4e556a0bc829bf127a ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Return
-------
gp_Elips2d

Description
-----------
Returns the constructed ellipse. Exceptions StdFail_NotDone if no ellipse is constructed. 
Return: resulting ellipse.
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
		/****** md5 signature: bed2ddf6ebf4bc830cc757aa66bb7da0 ******/
		%feature("compactdefaultargs") gce_MakeHypr;
		%feature("autodoc", "
Parameters
----------
A2: gp_Ax2
MajorRadius: double
MinorRadius: double

Return
-------
None

Description
-----------
Creates a hyperbola from a local coordinate system and radii. @note In the local coordinate system of `A2`, the equation is `X*X / (MajorRadius*MajorRadius) - Y*Y / (MinorRadius*MinorRadius) = 1.0`. @note Construction with `MajorRadius == MinorRadius` is valid. @note Construction fails with `gce_NegativeRadius` if `MajorRadius < 0.0` or `MinorRadius < 0.0`. 
Input parameter: A2 local coordinate system 
Input parameter: MajorRadius major radius value 
Input parameter: MinorRadius minor radius value.
") gce_MakeHypr;
		 gce_MakeHypr(const gp_Ax2 & A2, const double MajorRadius, const double MinorRadius);

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
Creates a hyperbola from center and two points. @note `Center` is the hyperbola center, `Center`-`S1` defines the major axis, major radius is `Distance(Center, S1)`, and minor radius is distance from `S2` to this major axis. @note Construction fails with `gce_ConfusedPoints` if any two of `S1`, `S2`, and `Center` are coincident. @note Construction fails with `gce_ColinearPoints` if `S1`, `S2`, and `Center` are collinear. 
Input parameter: S1 first point 
Input parameter: S2 second point 
Input parameter: Center center point.
") gce_MakeHypr;
		 gce_MakeHypr(const gp_Pnt & S1, const gp_Pnt & S2, const gp_Pnt & Center);

		/****** gce_MakeHypr::Operator ******/
		/****** md5 signature: faf8fd4ca93fb6790329903ac4fd0cf6 ******/
		%feature("compactdefaultargs") Operator;
		%feature("autodoc", "Return
-------
gp_Hypr

Description
-----------
Alias for Value() returning a copy. 
Return: resulting object.
") Operator;
		gp_Hypr Operator();

		/****** gce_MakeHypr::Value ******/
		/****** md5 signature: 0ef6822db68d8f80c1cacffff7e34e77 ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Return
-------
gp_Hypr

Description
-----------
Returns the constructed hyperbola. Exceptions StdFail_NotDone if no hyperbola is constructed. 
Return: resulting hyperbola.
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
Creates a hyperbola from center and two points. @note `Center` is the hyperbola center, `Center`-`S1` defines major axis, major radius is `Distance(Center, S1)`, and minor radius is distance from `S2` to this major axis. @note Construction fails with `gce_ConfusedPoints` if any two of `S1`, `S2`, and `Center` are coincident. @note Construction fails with `gce_ColinearPoints` if `S1`, `S2`, and `Center` are collinear. 
Input parameter: S1 first point 
Input parameter: S2 second point 
Input parameter: Center center point.
") gce_MakeHypr2d;
		 gce_MakeHypr2d(const gp_Pnt2d & S1, const gp_Pnt2d & S2, const gp_Pnt2d & Center);

		/****** gce_MakeHypr2d::gce_MakeHypr2d ******/
		/****** md5 signature: 7bad155cf8a28d5fe05a9ef1b8f43322 ******/
		%feature("compactdefaultargs") gce_MakeHypr2d;
		%feature("autodoc", "
Parameters
----------
MajorAxis: gp_Ax2d
MajorRadius: double
MinorRadius: double
Sense: bool

Return
-------
None

Description
-----------
Creates a hyperbola from major axis and radii. @note Center is located at `MajorAxis.Location()`. @note If `Sense` is `false`, the opposite direction of `MajorAxis` is used. @note Construction fails with `gce_NegativeRadius` if `MajorRadius < 0.0` or `MinorRadius < 0.0`. 
Input parameter: MajorAxis major axis placement 
Input parameter: MajorRadius major radius value 
Input parameter: MinorRadius minor radius value 
Input parameter: Sense orientation flag.
") gce_MakeHypr2d;
		 gce_MakeHypr2d(const gp_Ax2d & MajorAxis, const double MajorRadius, const double MinorRadius, const bool Sense);

		/****** gce_MakeHypr2d::gce_MakeHypr2d ******/
		/****** md5 signature: 1373f66bf6b770e81c80c880a1afbf71 ******/
		%feature("compactdefaultargs") gce_MakeHypr2d;
		%feature("autodoc", "
Parameters
----------
A: gp_Ax22d
MajorRadius: double
MinorRadius: double

Return
-------
None

Description
-----------
Creates a hyperbola from local coordinate system and radii. @note The result is centered at `A.Location()`, and its major axis follows the X axis direction of `A`. @note Construction fails with `gce_NegativeRadius` if `MajorRadius < 0.0` or `MinorRadius < 0.0`. 
Input parameter: A local coordinate system 
Input parameter: MajorRadius major radius value 
Input parameter: MinorRadius minor radius value.
") gce_MakeHypr2d;
		 gce_MakeHypr2d(const gp_Ax22d & A, const double MajorRadius, const double MinorRadius);

		/****** gce_MakeHypr2d::Operator ******/
		/****** md5 signature: 2d11cd446506a67e935404a3c1e10e97 ******/
		%feature("compactdefaultargs") Operator;
		%feature("autodoc", "Return
-------
gp_Hypr2d

Description
-----------
Alias for Value() returning a copy. 
Return: resulting object.
") Operator;
		gp_Hypr2d Operator();

		/****** gce_MakeHypr2d::Value ******/
		/****** md5 signature: 73ea3f0a9dee5724ac79486c1a3e0de5 ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Return
-------
gp_Hypr2d

Description
-----------
Returns the constructed hyperbola. Exceptions StdFail_NotDone if no hyperbola is constructed. 
Return: resulting hyperbola.
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
Creates a line located along the axis A1. @note The location of `A1` is the line origin. 
Input parameter: A1 axis placement.
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
Input parameter: P point 
Input parameter: V direction vector.
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
Creates a line parallel to input line and passing through a point. 
Input parameter: Lin source line 
Input parameter: Point reference point.
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
Creates a line passing through two points. @note Construction fails with `gce_ConfusedPoints` if points are coincident. 
Input parameter: P1 first point 
Input parameter: P2 second point.
") gce_MakeLin;
		 gce_MakeLin(const gp_Pnt & P1, const gp_Pnt & P2);

		/****** gce_MakeLin::Operator ******/
		/****** md5 signature: dc158d39bfb710cdd3eaec612ea65e19 ******/
		%feature("compactdefaultargs") Operator;
		%feature("autodoc", "Return
-------
gp_Lin

Description
-----------
Alias for Value() returning a copy. 
Return: resulting object.
") Operator;
		gp_Lin Operator();

		/****** gce_MakeLin::Value ******/
		/****** md5 signature: aa51ff7220c70b92e8cbc04404c62b4a ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Return
-------
gp_Lin

Description
-----------
Returns the constructed line. Exceptions StdFail_NotDone is raised if no line is constructed. 
Return: resulting line.
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
Creates a line located with A. @note The location of `A` is the line origin. 
Input parameter: A local coordinate system.
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
Input parameter: P point 
Input parameter: V direction vector.
") gce_MakeLin2d;
		 gce_MakeLin2d(const gp_Pnt2d & P, const gp_Dir2d & V);

		/****** gce_MakeLin2d::gce_MakeLin2d ******/
		/****** md5 signature: 9b91e66b8fbe13a19692dd897d500a8e ******/
		%feature("compactdefaultargs") gce_MakeLin2d;
		%feature("autodoc", "
Parameters
----------
A: double
B: double
C: double

Return
-------
None

Description
-----------
Creates the line from the equation A*X + B*Y + C = 0.0 @note Construction fails with `gce_NullAxis` if `A*A + B*B <= gp::Resolution()`. 
Input parameter: A equation coefficient A 
Input parameter: B equation coefficient B 
Input parameter: C equation coefficient C.
") gce_MakeLin2d;
		 gce_MakeLin2d(const double A, const double B, const double C);

		/****** gce_MakeLin2d::gce_MakeLin2d ******/
		/****** md5 signature: 89f5d368be07348bad3d54300f1f5b93 ******/
		%feature("compactdefaultargs") gce_MakeLin2d;
		%feature("autodoc", "
Parameters
----------
Lin: gp_Lin2d
Dist: double

Return
-------
None

Description
-----------
Creates a line parallel to input line at signed distance. @note If `Dist` is positive, the result is on the right side of `Lin` (in line local orientation), otherwise on the left. 
Input parameter: Lin source line 
Input parameter: Dist signed distance.
") gce_MakeLin2d;
		 gce_MakeLin2d(const gp_Lin2d & Lin, const double Dist);

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
Creates a line parallel to input line and passing through a point. 
Input parameter: Lin source line 
Input parameter: Point reference point.
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
Creates a line passing through two points. @note Construction fails with `gce_ConfusedPoints` if `P1` and `P2` are coincident. 
Input parameter: P1 first point 
Input parameter: P2 second point.
") gce_MakeLin2d;
		 gce_MakeLin2d(const gp_Pnt2d & P1, const gp_Pnt2d & P2);

		/****** gce_MakeLin2d::Operator ******/
		/****** md5 signature: 026cf3ebe694d466c5477a81a236162a ******/
		%feature("compactdefaultargs") Operator;
		%feature("autodoc", "Return
-------
gp_Lin2d

Description
-----------
Alias for Value() returning a copy. 
Return: resulting object.
") Operator;
		gp_Lin2d Operator();

		/****** gce_MakeLin2d::Value ******/
		/****** md5 signature: ad85fc6f7f2db351c63a3dd2ec52cad0 ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Return
-------
gp_Lin2d

Description
-----------
Returns the constructed line. Exceptions StdFail_NotDone if no line is constructed. 
Return: resulting line.
") Value;
		const gp_Lin2d Value();

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
		/****** md5 signature: c8a76e733b7f7cf1b66d556c8b7ab5a3 ******/
		%feature("compactdefaultargs") gce_MakeParab;
		%feature("autodoc", "
Parameters
----------
A2: gp_Ax2
Focal: double

Return
-------
None

Description
-----------
Creates a parabola from local coordinate system and focal length. 
Input parameter: A2 local coordinate system of the parabola 
Input parameter: Focal focal length @note `TheError` is set to `gce_NullFocusLength` if `Focal < 0.0`.
") gce_MakeParab;
		 gce_MakeParab(const gp_Ax2 & A2, const double Focal);

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
Creates a parabola from directrix and focus. 
Input parameter: D directrix of the parabola 
Input parameter: F focus point of the parabola.
") gce_MakeParab;
		 gce_MakeParab(const gp_Ax1 & D, const gp_Pnt & F);

		/****** gce_MakeParab::Operator ******/
		/****** md5 signature: 2196f413dbc84dd96fb8cdcfe817e0a2 ******/
		%feature("compactdefaultargs") Operator;
		%feature("autodoc", "Return
-------
gp_Parab

Description
-----------
Alias for Value() returning a copy. 
Return: resulting parabola.
") Operator;
		gp_Parab Operator();

		/****** gce_MakeParab::Value ******/
		/****** md5 signature: 9ee9c4b368b21971b46e44b72348fe43 ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Return
-------
gp_Parab

Description
-----------
Returns the constructed parabola. 
Return: resulting parabola @throw StdFail_NotDone if construction has failed.
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
		/****** md5 signature: ec8ad927a35675adf939c805bc04b245 ******/
		%feature("compactdefaultargs") gce_MakeParab2d;
		%feature("autodoc", "
Parameters
----------
MirrorAxis: gp_Ax2d
Focal: double
Sense: bool (optional, default to true)

Return
-------
None

Description
-----------
Creates a parabola from symmetry axis and focal length. 
Input parameter: MirrorAxis symmetry axis of the parabola 
Input parameter: Focal focal length 
Input parameter: Sense orientation of parametrization @note `Focal = 0` is accepted. @note `TheError` is set to `gce_NullFocusLength` if `Focal < 0.0`.
") gce_MakeParab2d;
		 gce_MakeParab2d(const gp_Ax2d & MirrorAxis, const double Focal, const bool Sense = true);

		/****** gce_MakeParab2d::gce_MakeParab2d ******/
		/****** md5 signature: a1319e6f7158932a24c25047df5a04e1 ******/
		%feature("compactdefaultargs") gce_MakeParab2d;
		%feature("autodoc", "
Parameters
----------
A: gp_Ax22d
Focal: double

Return
-------
None

Description
-----------
Creates a parabola from full local coordinate system and focal length. 
Input parameter: A local coordinate system of the parabola 
Input parameter: Focal focal length @note `Focal = 0` is accepted. @note `TheError` is set to `gce_NullFocusLength` if `Focal < 0.0`.
") gce_MakeParab2d;
		 gce_MakeParab2d(const gp_Ax22d & A, const double Focal);

		/****** gce_MakeParab2d::gce_MakeParab2d ******/
		/****** md5 signature: b47d8e3628df3fdcdf79046cf9401355 ******/
		%feature("compactdefaultargs") gce_MakeParab2d;
		%feature("autodoc", "
Parameters
----------
D: gp_Ax2d
F: gp_Pnt2d
Sense: bool (optional, default to true)

Return
-------
None

Description
-----------
Creates a parabola from directrix and focus. 
Input parameter: D directrix of the parabola 
Input parameter: F focus point of the parabola 
Input parameter: Sense orientation of parametrization.
") gce_MakeParab2d;
		 gce_MakeParab2d(const gp_Ax2d & D, const gp_Pnt2d & F, const bool Sense = true);

		/****** gce_MakeParab2d::gce_MakeParab2d ******/
		/****** md5 signature: 7b52f3d75c4287cfb53dfbecde617e21 ******/
		%feature("compactdefaultargs") gce_MakeParab2d;
		%feature("autodoc", "
Parameters
----------
S1: gp_Pnt2d
Center: gp_Pnt2d
Sense: bool (optional, default to true)

Return
-------
None

Description
-----------
Creates a parabola from focus and vertex. 
Input parameter: S1 focus point 
Input parameter: Center vertex point 
Input parameter: Sense orientation of parametrization @note The class does not prevent zero focal distance. @note `TheError` is set to `gce_NullAxis` if `S1` and `Center` are coincident.
") gce_MakeParab2d;
		 gce_MakeParab2d(const gp_Pnt2d & S1, const gp_Pnt2d & Center, const bool Sense = true);

		/****** gce_MakeParab2d::Operator ******/
		/****** md5 signature: f2e0e2f8525909d1c2ca673f1a89b614 ******/
		%feature("compactdefaultargs") Operator;
		%feature("autodoc", "Return
-------
gp_Parab2d

Description
-----------
Alias for Value() returning a copy. 
Return: resulting parabola.
") Operator;
		gp_Parab2d Operator();

		/****** gce_MakeParab2d::Value ******/
		/****** md5 signature: a8d0aaf5b68fb92d9a86783219d160c6 ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Return
-------
gp_Parab2d

Description
-----------
Returns the constructed parabola. 
Return: resulting parabola @throw StdFail_NotDone if construction has failed.
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
Input parameter: A2 local coordinate system.
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
Input parameter: P point 
Input parameter: V direction vector.
") gce_MakePln;
		 gce_MakePln(const gp_Pnt & P, const gp_Dir & V);

		/****** gce_MakePln::gce_MakePln ******/
		/****** md5 signature: 99d80fa877a24d4e4905f554c280cc04 ******/
		%feature("compactdefaultargs") gce_MakePln;
		%feature("autodoc", "
Parameters
----------
A: double
B: double
C: double
D: double

Return
-------
None

Description
-----------
Creates a plane from its cartesian equation: A * X + B * Y + C * Z + D = 0.0 //! @note Construction fails with `gce_BadEquation` if `A*A + B*B + C*C <= gp::Resolution()`. 
Input parameter: A equation coefficient A 
Input parameter: B equation coefficient B 
Input parameter: C equation coefficient C 
Input parameter: D equation constant term.
") gce_MakePln;
		 gce_MakePln(const double A, const double B, const double C, const double D);

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
Creates a plane parallel to input plane and passing through a point. 
Input parameter: Pln source plane 
Input parameter: Point reference point.
") gce_MakePln;
		 gce_MakePln(const gp_Pln & Pln, const gp_Pnt & Point);

		/****** gce_MakePln::gce_MakePln ******/
		/****** md5 signature: 5e1651f544d6c0d4ad6279e653f90158 ******/
		%feature("compactdefaultargs") gce_MakePln;
		%feature("autodoc", "
Parameters
----------
Pln: gp_Pln
Dist: double

Return
-------
None

Description
-----------
Creates a plane parallel to input plane at signed distance. @note Positive `Dist` shifts along the plane normal, negative in opposite direction. 
Input parameter: Pln source plane 
Input parameter: Dist signed distance.
") gce_MakePln;
		 gce_MakePln(const gp_Pln & Pln, const double Dist);

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
Creates a plane through three points. @note Construction fails with `gce_ColinearPoints` if points are collinear. 
Input parameter: P1 first point 
Input parameter: P2 second point 
Input parameter: P3 third point.
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
Creates a plane through `P1`, normal to direction (`P1`,`P2`). @note Construction fails with `gce_ConfusedPoints` if `P1` and `P2` coincide. 
Input parameter: P1 first point 
Input parameter: P2 second point.
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
Make a pln passing through the location of <Axis>and normal to the Direction of <Axis>. @note This constructor always succeeds for valid `Axis`. 
Input parameter: Axis axis definition.
") gce_MakePln;
		 gce_MakePln(const gp_Ax1 & Axis);

		/****** gce_MakePln::Operator ******/
		/****** md5 signature: 6a238304729e0dcb95027ef253a83210 ******/
		%feature("compactdefaultargs") Operator;
		%feature("autodoc", "Return
-------
gp_Pln

Description
-----------
Alias for Value() returning a copy. 
Return: resulting object.
") Operator;
		gp_Pln Operator();

		/****** gce_MakePln::Value ******/
		/****** md5 signature: 900f98bc0780d72b62895393b324439d ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Return
-------
gp_Pln

Description
-----------
Returns the constructed plane. Exceptions StdFail_NotDone if no plane is constructed. 
Return: resulting plane.
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
