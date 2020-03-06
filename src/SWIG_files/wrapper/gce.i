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
%define GCEDOCSTRING
"gce module, see official documentation at
https://www.opencascade.com/doc/occt-7.4.0/refman/html/package_gce.html"
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
%include ../common/Operators.i
%include ../common/OccHandle.i


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

/* python proy classes for enums */
%pythoncode {

class gce_ErrorType:
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
		/****************** gce_MakeMirror ******************/
		%feature("compactdefaultargs") gce_MakeMirror;
		%feature("autodoc", "No available documentation.

Parameters
----------
Point: gp_Pnt

Returns
-------
None
") gce_MakeMirror;
		 gce_MakeMirror(const gp_Pnt & Point);

		/****************** gce_MakeMirror ******************/
		%feature("compactdefaultargs") gce_MakeMirror;
		%feature("autodoc", "No available documentation.

Parameters
----------
Axis: gp_Ax1

Returns
-------
None
") gce_MakeMirror;
		 gce_MakeMirror(const gp_Ax1 & Axis);

		/****************** gce_MakeMirror ******************/
		%feature("compactdefaultargs") gce_MakeMirror;
		%feature("autodoc", "No available documentation.

Parameters
----------
Line: gp_Lin

Returns
-------
None
") gce_MakeMirror;
		 gce_MakeMirror(const gp_Lin & Line);

		/****************** gce_MakeMirror ******************/
		%feature("compactdefaultargs") gce_MakeMirror;
		%feature("autodoc", "Makes a symmetry transformation af axis defined by <point> and <direc>.

Parameters
----------
Point: gp_Pnt
Direc: gp_Dir

Returns
-------
None
") gce_MakeMirror;
		 gce_MakeMirror(const gp_Pnt & Point, const gp_Dir & Direc);

		/****************** gce_MakeMirror ******************/
		%feature("compactdefaultargs") gce_MakeMirror;
		%feature("autodoc", "Makes a symmetry transformation of plane <plane>.

Parameters
----------
Plane: gp_Pln

Returns
-------
None
") gce_MakeMirror;
		 gce_MakeMirror(const gp_Pln & Plane);

		/****************** gce_MakeMirror ******************/
		%feature("compactdefaultargs") gce_MakeMirror;
		%feature("autodoc", "Makes a symmetry transformation of plane <plane>.

Parameters
----------
Plane: gp_Ax2

Returns
-------
None
") gce_MakeMirror;
		 gce_MakeMirror(const gp_Ax2 & Plane);

		/****************** Operator ******************/
		%feature("compactdefaultargs") Operator;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Trsf
") Operator;
		const gp_Trsf Operator();

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Returns the constructed transformation.

Returns
-------
gp_Trsf
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
		/****************** gce_MakeMirror2d ******************/
		%feature("compactdefaultargs") gce_MakeMirror2d;
		%feature("autodoc", "No available documentation.

Parameters
----------
Point: gp_Pnt2d

Returns
-------
None
") gce_MakeMirror2d;
		 gce_MakeMirror2d(const gp_Pnt2d & Point);

		/****************** gce_MakeMirror2d ******************/
		%feature("compactdefaultargs") gce_MakeMirror2d;
		%feature("autodoc", "No available documentation.

Parameters
----------
Axis: gp_Ax2d

Returns
-------
None
") gce_MakeMirror2d;
		 gce_MakeMirror2d(const gp_Ax2d & Axis);

		/****************** gce_MakeMirror2d ******************/
		%feature("compactdefaultargs") gce_MakeMirror2d;
		%feature("autodoc", "No available documentation.

Parameters
----------
Line: gp_Lin2d

Returns
-------
None
") gce_MakeMirror2d;
		 gce_MakeMirror2d(const gp_Lin2d & Line);

		/****************** gce_MakeMirror2d ******************/
		%feature("compactdefaultargs") gce_MakeMirror2d;
		%feature("autodoc", "Makes a symmetry transformation af axis defined by <point> and <direc>.

Parameters
----------
Point: gp_Pnt2d
Direc: gp_Dir2d

Returns
-------
None
") gce_MakeMirror2d;
		 gce_MakeMirror2d(const gp_Pnt2d & Point, const gp_Dir2d & Direc);

		/****************** Operator ******************/
		%feature("compactdefaultargs") Operator;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Trsf2d
") Operator;
		const gp_Trsf2d Operator();

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Returns the constructed transformation.

Returns
-------
gp_Trsf2d
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
		/****************** gce_MakeRotation ******************/
		%feature("compactdefaultargs") gce_MakeRotation;
		%feature("autodoc", "Constructs a rotation through angle angle about the axis defined by the line line.

Parameters
----------
Line: gp_Lin
Angle: float

Returns
-------
None
") gce_MakeRotation;
		 gce_MakeRotation(const gp_Lin & Line, const Standard_Real Angle);

		/****************** gce_MakeRotation ******************/
		%feature("compactdefaultargs") gce_MakeRotation;
		%feature("autodoc", "Constructs a rotation through angle angle about the axis defined by the axis axis.

Parameters
----------
Axis: gp_Ax1
Angle: float

Returns
-------
None
") gce_MakeRotation;
		 gce_MakeRotation(const gp_Ax1 & Axis, const Standard_Real Angle);

		/****************** gce_MakeRotation ******************/
		%feature("compactdefaultargs") gce_MakeRotation;
		%feature("autodoc", "Constructs a rotation through angle angle about the axis defined by: the point point and the unit vector direc.

Parameters
----------
Point: gp_Pnt
Direc: gp_Dir
Angle: float

Returns
-------
None
") gce_MakeRotation;
		 gce_MakeRotation(const gp_Pnt & Point, const gp_Dir & Direc, const Standard_Real Angle);

		/****************** Operator ******************/
		%feature("compactdefaultargs") Operator;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Trsf
") Operator;
		const gp_Trsf Operator();

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Returns the constructed transformation.

Returns
-------
gp_Trsf
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
		/****************** gce_MakeRotation2d ******************/
		%feature("compactdefaultargs") gce_MakeRotation2d;
		%feature("autodoc", "Constructs a rotation through angle angle about the center point.

Parameters
----------
Point: gp_Pnt2d
Angle: float

Returns
-------
None
") gce_MakeRotation2d;
		 gce_MakeRotation2d(const gp_Pnt2d & Point, const Standard_Real Angle);

		/****************** Operator ******************/
		%feature("compactdefaultargs") Operator;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Trsf2d
") Operator;
		const gp_Trsf2d Operator();

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Returns the constructed transformation.

Returns
-------
gp_Trsf2d
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
		/****************** gce_MakeScale ******************/
		%feature("compactdefaultargs") gce_MakeScale;
		%feature("autodoc", "Constructs a scaling transformation with - point as the center of the transformation, and - scale as the scale factor.

Parameters
----------
Point: gp_Pnt
Scale: float

Returns
-------
None
") gce_MakeScale;
		 gce_MakeScale(const gp_Pnt & Point, const Standard_Real Scale);

		/****************** Operator ******************/
		%feature("compactdefaultargs") Operator;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Trsf
") Operator;
		const gp_Trsf Operator();

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Returns the constructed transformation.

Returns
-------
gp_Trsf
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
		/****************** gce_MakeScale2d ******************/
		%feature("compactdefaultargs") gce_MakeScale2d;
		%feature("autodoc", "Constructs a scaling transformation with: - point as the center of the transformation, and - scale as the scale factor.

Parameters
----------
Point: gp_Pnt2d
Scale: float

Returns
-------
None
") gce_MakeScale2d;
		 gce_MakeScale2d(const gp_Pnt2d & Point, const Standard_Real Scale);

		/****************** Operator ******************/
		%feature("compactdefaultargs") Operator;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Trsf2d
") Operator;
		const gp_Trsf2d Operator();

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Returns the constructed transformation.

Returns
-------
gp_Trsf2d
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
		/****************** gce_MakeTranslation ******************/
		%feature("compactdefaultargs") gce_MakeTranslation;
		%feature("autodoc", "Constructs a translation along the vector ' vect'.

Parameters
----------
Vect: gp_Vec

Returns
-------
None
") gce_MakeTranslation;
		 gce_MakeTranslation(const gp_Vec & Vect);

		/****************** gce_MakeTranslation ******************/
		%feature("compactdefaultargs") gce_MakeTranslation;
		%feature("autodoc", "Constructs a translation along the vector (point1,point2) defined from the point point1 to the point point2.

Parameters
----------
Point1: gp_Pnt
Point2: gp_Pnt

Returns
-------
None
") gce_MakeTranslation;
		 gce_MakeTranslation(const gp_Pnt & Point1, const gp_Pnt & Point2);

		/****************** Operator ******************/
		%feature("compactdefaultargs") Operator;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Trsf
") Operator;
		const gp_Trsf Operator();

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Returns the constructed transformation.

Returns
-------
gp_Trsf
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
		/****************** gce_MakeTranslation2d ******************/
		%feature("compactdefaultargs") gce_MakeTranslation2d;
		%feature("autodoc", "Constructs a translation along the vector vect.

Parameters
----------
Vect: gp_Vec2d

Returns
-------
None
") gce_MakeTranslation2d;
		 gce_MakeTranslation2d(const gp_Vec2d & Vect);

		/****************** gce_MakeTranslation2d ******************/
		%feature("compactdefaultargs") gce_MakeTranslation2d;
		%feature("autodoc", "Constructs a translation along the vector (point1,point2) defined from the point point1 to the point point2.

Parameters
----------
Point1: gp_Pnt2d
Point2: gp_Pnt2d

Returns
-------
None
") gce_MakeTranslation2d;
		 gce_MakeTranslation2d(const gp_Pnt2d & Point1, const gp_Pnt2d & Point2);

		/****************** Operator ******************/
		%feature("compactdefaultargs") Operator;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Trsf2d
") Operator;
		const gp_Trsf2d Operator();

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Returns the constructed transformation.

Returns
-------
gp_Trsf2d
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
		/****************** IsDone ******************/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Returns true if the construction is successful.

Returns
-------
bool
") IsDone;
		Standard_Boolean IsDone();

		/****************** Status ******************/
		%feature("compactdefaultargs") Status;
		%feature("autodoc", "Returns the status of the construction: - gce_done, if the construction is successful, or - another value of the gce_errortype enumeration indicating why the construction failed.

Returns
-------
gce_ErrorType
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
		/****************** gce_MakeCirc ******************/
		%feature("compactdefaultargs") gce_MakeCirc;
		%feature("autodoc", "A2 locates the circle and gives its orientation in 3d space. warnings : it is not forbidden to create a circle with radius = 0.0 the status is 'negativeradius' if radius < 0.0.

Parameters
----------
A2: gp_Ax2
Radius: float

Returns
-------
None
") gce_MakeCirc;
		 gce_MakeCirc(const gp_Ax2 & A2, const Standard_Real Radius);

		/****************** gce_MakeCirc ******************/
		%feature("compactdefaultargs") gce_MakeCirc;
		%feature("autodoc", "Makes a circ from gp <thecirc> coaxial to another circ <circ> at a distance <dist>. if dist is greater than zero the result is encloses the circle <circ>, else the result is enclosed by the circle <circ>.

Parameters
----------
Circ: gp_Circ
Dist: float

Returns
-------
None
") gce_MakeCirc;
		 gce_MakeCirc(const gp_Circ & Circ, const Standard_Real Dist);

		/****************** gce_MakeCirc ******************/
		%feature("compactdefaultargs") gce_MakeCirc;
		%feature("autodoc", "Makes a circ from gp <thecirc> coaxial to another circ <circ> and passing through a pnt2d <point>.

Parameters
----------
Circ: gp_Circ
Point: gp_Pnt

Returns
-------
None
") gce_MakeCirc;
		 gce_MakeCirc(const gp_Circ & Circ, const gp_Pnt & Point);

		/****************** gce_MakeCirc ******************/
		%feature("compactdefaultargs") gce_MakeCirc;
		%feature("autodoc", "Makes a circ from gp <thecirc> passing through 3 pnt2d <p1>,<p2>,<p3>.

Parameters
----------
P1: gp_Pnt
P2: gp_Pnt
P3: gp_Pnt

Returns
-------
None
") gce_MakeCirc;
		 gce_MakeCirc(const gp_Pnt & P1, const gp_Pnt & P2, const gp_Pnt & P3);

		/****************** gce_MakeCirc ******************/
		%feature("compactdefaultargs") gce_MakeCirc;
		%feature("autodoc", "Makes a circ from gp <thecirc> with its center <center> and the normal of its plane <norm> and its radius <radius>.

Parameters
----------
Center: gp_Pnt
Norm: gp_Dir
Radius: float

Returns
-------
None
") gce_MakeCirc;
		 gce_MakeCirc(const gp_Pnt & Center, const gp_Dir & Norm, const Standard_Real Radius);

		/****************** gce_MakeCirc ******************/
		%feature("compactdefaultargs") gce_MakeCirc;
		%feature("autodoc", "Makes a circ from gp <thecirc> with its center <center> and the normal of its plane <plane> and its radius <radius>.

Parameters
----------
Center: gp_Pnt
Plane: gp_Pln
Radius: float

Returns
-------
None
") gce_MakeCirc;
		 gce_MakeCirc(const gp_Pnt & Center, const gp_Pln & Plane, const Standard_Real Radius);

		/****************** gce_MakeCirc ******************/
		%feature("compactdefaultargs") gce_MakeCirc;
		%feature("autodoc", "Makes a circ from gp <thecirc> with its center <center> and a point <ptaxis> giving the normal of its plane <plane> and its radius <radius>.

Parameters
----------
Center: gp_Pnt
Ptaxis: gp_Pnt
Radius: float

Returns
-------
None
") gce_MakeCirc;
		 gce_MakeCirc(const gp_Pnt & Center, const gp_Pnt & Ptaxis, const Standard_Real Radius);

		/****************** gce_MakeCirc ******************/
		%feature("compactdefaultargs") gce_MakeCirc;
		%feature("autodoc", "Makes a circ from gp <thecirc> with its center <center> and its radius <radius>. warning the makecirc class does not prevent the construction of a circle with a null radius. if an error occurs (that is, when isdone returns false), the status function returns: - gce_negative radius if: - radius is less than 0.0, or - dist is less than 0.0 and the absolute value of dist is greater than the radius of circ; - gce_intersectionerror if the points p1, p2 and p3 are collinear, and the three are not coincident; - gce_confusedpoints if two of the three points p1, p2 and p3 are coincident; or - gce_nullaxis if center and ptaxis are coincident.

Parameters
----------
Axis: gp_Ax1
Radius: float

Returns
-------
None
") gce_MakeCirc;
		 gce_MakeCirc(const gp_Ax1 & Axis, const Standard_Real Radius);

		/****************** Operator ******************/
		%feature("compactdefaultargs") Operator;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Circ
") Operator;
		const gp_Circ Operator();

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Returns the constructed circle. exceptions stdfail_notdone if no circle is constructed.

Returns
-------
gp_Circ
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
		/****************** gce_MakeCirc2d ******************/
		%feature("compactdefaultargs") gce_MakeCirc2d;
		%feature("autodoc", "The location point of xaxis is the center of the circle. warnings : it is not forbidden to create a circle with radius = 0.0 if sense is true the local coordinate system of the solution is direct and non direct in the other case. the status is 'negativeradius' if radius < 0.0.

Parameters
----------
XAxis: gp_Ax2d
Radius: float
Sense: bool,optional
	default value is Standard_True

Returns
-------
None
") gce_MakeCirc2d;
		 gce_MakeCirc2d(const gp_Ax2d & XAxis, const Standard_Real Radius, const Standard_Boolean Sense = Standard_True);

		/****************** gce_MakeCirc2d ******************/
		%feature("compactdefaultargs") gce_MakeCirc2d;
		%feature("autodoc", "The location point of axis is the center of the circle. warnings : it is not forbidden to create a circle with radius = 0.0.

Parameters
----------
Axis: gp_Ax22d
Radius: float

Returns
-------
None
") gce_MakeCirc2d;
		 gce_MakeCirc2d(const gp_Ax22d & Axis, const Standard_Real Radius);

		/****************** gce_MakeCirc2d ******************/
		%feature("compactdefaultargs") gce_MakeCirc2d;
		%feature("autodoc", "Makes a circ2d from gp <thecirc> concentric with another circ2d <circ> with a distance <dist>. if dist is greater than zero the result encloses the circle <circ>, else the result is enclosed by the circle <circ>. the local coordinate system of the solution is the same as circ.

Parameters
----------
Circ: gp_Circ2d
Dist: float

Returns
-------
None
") gce_MakeCirc2d;
		 gce_MakeCirc2d(const gp_Circ2d & Circ, const Standard_Real Dist);

		/****************** gce_MakeCirc2d ******************/
		%feature("compactdefaultargs") gce_MakeCirc2d;
		%feature("autodoc", "Makes a circ2d from gp <thecirc> concentric with another circ2d <circ> and passing through a pnt2d <point>. the local coordinate system of the solution is the same as circ.

Parameters
----------
Circ: gp_Circ2d
Point: gp_Pnt2d

Returns
-------
None
") gce_MakeCirc2d;
		 gce_MakeCirc2d(const gp_Circ2d & Circ, const gp_Pnt2d & Point);

		/****************** gce_MakeCirc2d ******************/
		%feature("compactdefaultargs") gce_MakeCirc2d;
		%feature("autodoc", "Makes a circ2d from gp <thecirc> passing through 3 pnt2d <p1>,<p2>,<p3>. the local coordinate system of the solution is given by the three points p1, p2, p3.

Parameters
----------
P1: gp_Pnt2d
P2: gp_Pnt2d
P3: gp_Pnt2d

Returns
-------
None
") gce_MakeCirc2d;
		 gce_MakeCirc2d(const gp_Pnt2d & P1, const gp_Pnt2d & P2, const gp_Pnt2d & P3);

		/****************** gce_MakeCirc2d ******************/
		%feature("compactdefaultargs") gce_MakeCirc2d;
		%feature("autodoc", "Makes a circ2d from gp <thecirc> with its center <center> and its radius <radius>. if sense is true the local coordinate system of the solution is direct and non direct in the other case.

Parameters
----------
Center: gp_Pnt2d
Radius: float
Sense: bool,optional
	default value is Standard_True

Returns
-------
None
") gce_MakeCirc2d;
		 gce_MakeCirc2d(const gp_Pnt2d & Center, const Standard_Real Radius, const Standard_Boolean Sense = Standard_True);

		/****************** gce_MakeCirc2d ******************/
		%feature("compactdefaultargs") gce_MakeCirc2d;
		%feature("autodoc", "Makes a circ2d from gp <thecirc> with its center <center> and a point giving the radius. if sense is true the local coordinate system of the solution is direct and non direct in the other case.

Parameters
----------
Center: gp_Pnt2d
Point: gp_Pnt2d
Sense: bool,optional
	default value is Standard_True

Returns
-------
None
") gce_MakeCirc2d;
		 gce_MakeCirc2d(const gp_Pnt2d & Center, const gp_Pnt2d & Point, const Standard_Boolean Sense = Standard_True);

		/****************** Operator ******************/
		%feature("compactdefaultargs") Operator;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Circ2d
") Operator;
		const gp_Circ2d Operator();

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Returns the constructed circle. exceptions stdfail_notdone if no circle is constructed.

Returns
-------
gp_Circ2d
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
		/****************** gce_MakeCone ******************/
		%feature("compactdefaultargs") gce_MakeCone;
		%feature("autodoc", "Creates an infinite conical surface. a2 locates the cone in the space and defines the reference plane of the surface. ang is the conical surface semi-angle between 0 and pi/2 radians. radius is the radius of the circle in the reference plane of the cone. if radius is lower than 0.0 the status is ' if ang < resolution from gp or ang >= (pi/2) - resolution.

Parameters
----------
A2: gp_Ax2
Ang: float
Radius: float

Returns
-------
None
") gce_MakeCone;
		 gce_MakeCone(const gp_Ax2 & A2, const Standard_Real Ang, const Standard_Real Radius);

		/****************** gce_MakeCone ******************/
		%feature("compactdefaultargs") gce_MakeCone;
		%feature("autodoc", "Makes a cone from gp <thecone> coaxial to another cone <cone> and passing through a pnt <point>.

Parameters
----------
Cone: gp_Cone
Point: gp_Pnt

Returns
-------
None
") gce_MakeCone;
		 gce_MakeCone(const gp_Cone & Cone, const gp_Pnt & Point);

		/****************** gce_MakeCone ******************/
		%feature("compactdefaultargs") gce_MakeCone;
		%feature("autodoc", "Makes a cone from gp <thecone> coaxial to another cone <cone> at the distance <dist> which can be greater or lower than zero.

Parameters
----------
Cone: gp_Cone
Dist: float

Returns
-------
None
") gce_MakeCone;
		 gce_MakeCone(const gp_Cone & Cone, const Standard_Real Dist);

		/****************** gce_MakeCone ******************/
		%feature("compactdefaultargs") gce_MakeCone;
		%feature("autodoc", "Makes a cone from gp <thecone> by four points <p1>, <p2>,<p3> and <p4>. its axis is <p1p2> and the radius of its base is the distance between <p3> and <p1p2>. the distance between <p4> and <p1p2> is the radius of the section passing through <p4>. if <p1> and <p2> are confused or <p3> and <p4> are confused we have the status 'confusedpoints' if <p1>,<p2>,<p3>,<p4> are colinear we have the status 'colinearpoints' if <p3p4> is perpendicular to <p1p2> we have the status 'nullangle'. <p3p4> is colinear to <p1p2> we have the status 'nullangle'.

Parameters
----------
P1: gp_Pnt
P2: gp_Pnt
P3: gp_Pnt
P4: gp_Pnt

Returns
-------
None
") gce_MakeCone;
		 gce_MakeCone(const gp_Pnt & P1, const gp_Pnt & P2, const gp_Pnt & P3, const gp_Pnt & P4);

		/****************** gce_MakeCone ******************/
		%feature("compactdefaultargs") gce_MakeCone;
		%feature("autodoc", "Makes a cone by its axis <axis> and and two points. the distance between <p1> and the axis is the radius of the section passing through <p1>. the distance between <p2> and the axis is the radius of the section passing through <p2>. if <p1p2> is colinear to <axis> we have the status 'nullangle' if <p3p4> is perpendicular to <axis> we have the status 'nullangle' if <p1> and <p2> are confused we have the status 'confusedpoints'.

Parameters
----------
Axis: gp_Ax1
P1: gp_Pnt
P2: gp_Pnt

Returns
-------
None
") gce_MakeCone;
		 gce_MakeCone(const gp_Ax1 & Axis, const gp_Pnt & P1, const gp_Pnt & P2);

		/****************** gce_MakeCone ******************/
		%feature("compactdefaultargs") gce_MakeCone;
		%feature("autodoc", "Makes a cone by its axis <axis> and and two points. the distance between <p1> and the axis is the radius of the section passing through <p1> the distance between <p2> and the axis is the radius of the section passing through <p2> if <p1p2> is colinear to <axis> we have the status 'nullangle' if <p3p4> is perpendicular to <axis> we have the status 'nullangle' if <p1> and <p2> are confused we have the status 'confusedpoints'.

Parameters
----------
Axis: gp_Lin
P1: gp_Pnt
P2: gp_Pnt

Returns
-------
None
") gce_MakeCone;
		 gce_MakeCone(const gp_Lin & Axis, const gp_Pnt & P1, const gp_Pnt & P2);

		/****************** gce_MakeCone ******************/
		%feature("compactdefaultargs") gce_MakeCone;
		%feature("autodoc", "Makes a cone with two points and two radius. the axis of the solution is the line passing through <p1> and <p2>. <r1> is the radius of the section passing through <p1> and <r2> the radius of the section passing through <p2>. if <p1> and <p2> are confused we have the status 'nullaxis'. warning if an error occurs (that is, when isdone returns false), the status function returns: - gce_negativeradius if radius, r1 or r2 is less than 0.0; - gce_badangle if ang is less than gp::resolution() or greater than pi/2.- gp::resolution(); - gce_confusedpoints if p1 and p2 or p3 and p4 are coincident; - gce_nullaxis if the points p1 and p2, are coincident (5th syntax only); - gce_nullangle if: - the vector joining p1 to p2 is parallel to either axis or the line joining p3 to p4, or - r1 and r2 are equal, (that is, their difference is less than gp::resolution()); or - gce_nullradius if: - the vector joining p1 to p2 is perpendicular to the line joining p3 to p4, - the vector joining p1 to p2 is perpendicular to axis, or - p1, p2, p3, and p4 are collinear.

Parameters
----------
P1: gp_Pnt
P2: gp_Pnt
R1: float
R2: float

Returns
-------
None
") gce_MakeCone;
		 gce_MakeCone(const gp_Pnt & P1, const gp_Pnt & P2, const Standard_Real R1, const Standard_Real R2);

		/****************** Operator ******************/
		%feature("compactdefaultargs") Operator;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Cone
") Operator;
		const gp_Cone Operator();

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Returns the constructed cone. exceptions stdfail_notdone if no cone is constructed.

Returns
-------
gp_Cone
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
		/****************** gce_MakeCylinder ******************/
		%feature("compactdefaultargs") gce_MakeCylinder;
		%feature("autodoc", "<a2> is the local cartesian coordinate system of <self>. the status is 'negativeradius' if r < 0.0.

Parameters
----------
A2: gp_Ax2
Radius: float

Returns
-------
None
") gce_MakeCylinder;
		 gce_MakeCylinder(const gp_Ax2 & A2, const Standard_Real Radius);

		/****************** gce_MakeCylinder ******************/
		%feature("compactdefaultargs") gce_MakeCylinder;
		%feature("autodoc", "Makes a cylinder from gp <thecylinder> coaxial to another cylinder <cylinder> and passing through a pnt <point>.

Parameters
----------
Cyl: gp_Cylinder
Point: gp_Pnt

Returns
-------
None
") gce_MakeCylinder;
		 gce_MakeCylinder(const gp_Cylinder & Cyl, const gp_Pnt & Point);

		/****************** gce_MakeCylinder ******************/
		%feature("compactdefaultargs") gce_MakeCylinder;
		%feature("autodoc", "Makes a cylinder from gp <thecylinder> coaxial to another cylinder <cylinder> at the distance <dist> which can be greater or lower than zero. the radius of the result is the absolute value of the radius of <cyl> plus <dist>.

Parameters
----------
Cyl: gp_Cylinder
Dist: float

Returns
-------
None
") gce_MakeCylinder;
		 gce_MakeCylinder(const gp_Cylinder & Cyl, const Standard_Real Dist);

		/****************** gce_MakeCylinder ******************/
		%feature("compactdefaultargs") gce_MakeCylinder;
		%feature("autodoc", "Makes a cylinder from gp <thecylinder> with 3 points <p1>,<p2>,<p3>. its axis is <p1p2> and its radius is the distance between <p3> and <p1p2>.

Parameters
----------
P1: gp_Pnt
P2: gp_Pnt
P3: gp_Pnt

Returns
-------
None
") gce_MakeCylinder;
		 gce_MakeCylinder(const gp_Pnt & P1, const gp_Pnt & P2, const gp_Pnt & P3);

		/****************** gce_MakeCylinder ******************/
		%feature("compactdefaultargs") gce_MakeCylinder;
		%feature("autodoc", "Makes a cylinder by its axis <axis> and radius <radius>.

Parameters
----------
Axis: gp_Ax1
Radius: float

Returns
-------
None
") gce_MakeCylinder;
		 gce_MakeCylinder(const gp_Ax1 & Axis, const Standard_Real Radius);

		/****************** gce_MakeCylinder ******************/
		%feature("compactdefaultargs") gce_MakeCylinder;
		%feature("autodoc", "Makes a cylinder by its circular base. warning if an error occurs (that is, when isdone returns false), the status function returns: - gce_negativeradius if: - radius is less than 0.0, or - dist is negative and has an absolute value which is greater than the radius of cyl; or - gce_confusedpoints if points p1 and p2 are coincident.

Parameters
----------
Circ: gp_Circ

Returns
-------
None
") gce_MakeCylinder;
		 gce_MakeCylinder(const gp_Circ & Circ);

		/****************** Operator ******************/
		%feature("compactdefaultargs") Operator;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Cylinder
") Operator;
		const gp_Cylinder Operator();

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Returns the constructed cylinder. exceptions stdfail_notdone if no cylinder is constructed.

Returns
-------
gp_Cylinder
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
		/****************** gce_MakeDir ******************/
		%feature("compactdefaultargs") gce_MakeDir;
		%feature("autodoc", "Normalizes the vector v and creates a direction. status is 'nullvector' if v.magnitude() <= resolution.

Parameters
----------
V: gp_Vec

Returns
-------
None
") gce_MakeDir;
		 gce_MakeDir(const gp_Vec & V);

		/****************** gce_MakeDir ******************/
		%feature("compactdefaultargs") gce_MakeDir;
		%feature("autodoc", "Creates a direction from a triplet of coordinates. status is 'nullvector' if coord.modulus() <= resolution from gp.

Parameters
----------
Coord: gp_XYZ

Returns
-------
None
") gce_MakeDir;
		 gce_MakeDir(const gp_XYZ & Coord);

		/****************** gce_MakeDir ******************/
		%feature("compactdefaultargs") gce_MakeDir;
		%feature("autodoc", "Creates a direction with its 3 cartesian coordinates. status is 'nullvector' if sqrt(xv*xv + yv*yv + zv*zv) <= resolution.

Parameters
----------
Xv: float
Yv: float
Zv: float

Returns
-------
None
") gce_MakeDir;
		 gce_MakeDir(const Standard_Real Xv, const Standard_Real Yv, const Standard_Real Zv);

		/****************** gce_MakeDir ******************/
		%feature("compactdefaultargs") gce_MakeDir;
		%feature("autodoc", "Make a dir from gp <thedir> passing through 2 pnt <p1>,<p2>. status is 'confusedpoints' if <p1> and <p2> are confused. warning if an error occurs (that is, when isdone returns false), the status function returns: - gce_confusedpoints if points p1 and p2 are coincident, or - gce_nullvector if one of the following is less than or equal to gp::resolution(): - the magnitude of vector v, - the modulus of coord, - sqrt(xv*xv + yv*yv + zv*zv).

Parameters
----------
P1: gp_Pnt
P2: gp_Pnt

Returns
-------
None
") gce_MakeDir;
		 gce_MakeDir(const gp_Pnt & P1, const gp_Pnt & P2);

		/****************** Operator ******************/
		%feature("compactdefaultargs") Operator;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Dir
") Operator;
		const gp_Dir Operator();

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Returns the constructed unit vector. exceptions stdfail_notdone if no unit vector is constructed.

Returns
-------
gp_Dir
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
		/****************** gce_MakeDir2d ******************/
		%feature("compactdefaultargs") gce_MakeDir2d;
		%feature("autodoc", "Normalizes the vector v and creates a direction. status is 'nullvector' if v.magnitude() <= resolution.

Parameters
----------
V: gp_Vec2d

Returns
-------
None
") gce_MakeDir2d;
		 gce_MakeDir2d(const gp_Vec2d & V);

		/****************** gce_MakeDir2d ******************/
		%feature("compactdefaultargs") gce_MakeDir2d;
		%feature("autodoc", "Creates a direction from a triplet of coordinates. status is 'nullvector' if coord.modulus() <= resolution from gp.

Parameters
----------
Coord: gp_XY

Returns
-------
None
") gce_MakeDir2d;
		 gce_MakeDir2d(const gp_XY & Coord);

		/****************** gce_MakeDir2d ******************/
		%feature("compactdefaultargs") gce_MakeDir2d;
		%feature("autodoc", "Creates a direction with its 3 cartesian coordinates. status is 'nullvector' if sqrt(xv*xv + yv*yv ) <= resolution.

Parameters
----------
Xv: float
Yv: float

Returns
-------
None
") gce_MakeDir2d;
		 gce_MakeDir2d(const Standard_Real Xv, const Standard_Real Yv);

		/****************** gce_MakeDir2d ******************/
		%feature("compactdefaultargs") gce_MakeDir2d;
		%feature("autodoc", "Make a dir2d from gp <thedir> passing through 2 pnt <p1>,<p2>. status is 'confusedpoints' if <p1> and <p2> are confused. warning if an error occurs (that is, when isdone returns false), the status function returns: - gce_confusedpoints if points p1 and p2 are coincident, or - gce_nullvector if one of the following is less than or equal to gp::resolution(): - the magnitude of vector v, - the modulus of coord, - sqrt(xv*xv + yv*yv).

Parameters
----------
P1: gp_Pnt2d
P2: gp_Pnt2d

Returns
-------
None
") gce_MakeDir2d;
		 gce_MakeDir2d(const gp_Pnt2d & P1, const gp_Pnt2d & P2);

		/****************** Operator ******************/
		%feature("compactdefaultargs") Operator;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Dir2d
") Operator;
		const gp_Dir2d Operator();

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Returns the constructed unit vector. exceptions stdfail_notdone if no unit vector is constructed.

Returns
-------
gp_Dir2d
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
		/****************** gce_MakeElips ******************/
		%feature("compactdefaultargs") gce_MakeElips;
		%feature("autodoc", "The major radius of the ellipse is on the 'xaxis' and the minor radius is on the 'yaxis' of the ellipse. the 'xaxis' is defined with the 'xdirection' of a2 and the 'yaxis' is defined with the 'ydirection' of a2. warnings : it is not forbidden to create an ellipse with majorradius = minorradius.

Parameters
----------
A2: gp_Ax2
MajorRadius: float
MinorRadius: float

Returns
-------
None
") gce_MakeElips;
		 gce_MakeElips(const gp_Ax2 & A2, const Standard_Real MajorRadius, const Standard_Real MinorRadius);

		/****************** gce_MakeElips ******************/
		%feature("compactdefaultargs") gce_MakeElips;
		%feature("autodoc", "Make an ellipse with its center and two points. warning the makeelips class does not prevent the construction of an ellipse where the majorradius is equal to the minorradius. if an error occurs (that is, when isdone returns false), the status function returns: - gce_invertradius if majorradius is less than minorradius; - gce_negativeradius if minorradius is less than 0.0; - gce_nullaxis if the points s1 and center are coincident; or - gce_invertaxis if: - the major radius computed with center and s1 is less than the minor radius computed with center, s1 and s2, or - center, s1 and s2 are collinear.

Parameters
----------
S1: gp_Pnt
S2: gp_Pnt
Center: gp_Pnt

Returns
-------
None
") gce_MakeElips;
		 gce_MakeElips(const gp_Pnt & S1, const gp_Pnt & S2, const gp_Pnt & Center);

		/****************** Operator ******************/
		%feature("compactdefaultargs") Operator;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Elips
") Operator;
		const gp_Elips Operator();

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Returns the constructed ellipse. exceptions stdfail_notdone if no ellipse is constructed.

Returns
-------
gp_Elips
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
		/****************** gce_MakeElips2d ******************/
		%feature("compactdefaultargs") gce_MakeElips2d;
		%feature("autodoc", "Creates an ellipse with the major axis, the major and the minor radius. the location of the majoraxis is the center of the ellipse. the sense of parametrization is given by sense. it is possible to create an ellipse with majorradius = minorradius. the status is 'invertradius' if majorradius < minorradius or 'negativeradius' if minorradius < 0.0.

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
") gce_MakeElips2d;
		 gce_MakeElips2d(const gp_Ax2d & MajorAxis, const Standard_Real MajorRadius, const Standard_Real MinorRadius, const Standard_Boolean Sense = Standard_True);

		/****************** gce_MakeElips2d ******************/
		%feature("compactdefaultargs") gce_MakeElips2d;
		%feature("autodoc", "Axis defines the xaxis and yaxis of the ellipse which defines the origin and the sense of parametrization. creates an ellipse with the axisplacement the major and the minor radius. the location of axis is the center of the ellipse. it is possible to create an ellipse with majorradius = minorradius. the status is 'invertradius' if majorradius < minorradius or 'negativeradius' if minorradius < 0.0.

Parameters
----------
A: gp_Ax22d
MajorRadius: float
MinorRadius: float

Returns
-------
None
") gce_MakeElips2d;
		 gce_MakeElips2d(const gp_Ax22d & A, const Standard_Real MajorRadius, const Standard_Real MinorRadius);

		/****************** gce_MakeElips2d ******************/
		%feature("compactdefaultargs") gce_MakeElips2d;
		%feature("autodoc", "Makes an elips2d with its center and two points. the sense of parametrization is given by s1, s2, and center. depending on the constructor, the implicit orientation of the ellipse is: - the sense defined by a, - the sense defined by points center, s1 and s2, - the trigonometric sense if sense is not given or is true, or - the opposite if sense is false. it is possible to construct an ellipse where the major and minor radii are equal. warning if an error occurs (that is, when isdone returns false), the status function returns: - gce_invertradius if majorradius is less than minorradius, - gce_negativeradius if majorradius or minorradius is less than 0.0, - gce_nullaxis if points s1, s2 and center are collinear, or - gce_invertaxis if the major radius computed with center and s1 is less than the minor radius computed with center, s1 and s2.

Parameters
----------
S1: gp_Pnt2d
S2: gp_Pnt2d
Center: gp_Pnt2d

Returns
-------
None
") gce_MakeElips2d;
		 gce_MakeElips2d(const gp_Pnt2d & S1, const gp_Pnt2d & S2, const gp_Pnt2d & Center);

		/****************** Operator ******************/
		%feature("compactdefaultargs") Operator;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Elips2d
") Operator;
		const gp_Elips2d Operator();

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Returns the constructed ellipse. exceptions stdfail_notdone if no ellipse is constructed.

Returns
-------
gp_Elips2d
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
		/****************** gce_MakeHypr ******************/
		%feature("compactdefaultargs") gce_MakeHypr;
		%feature("autodoc", "A2 is the local coordinate system of the hyperbola. in the local coordinates system a2 the equation of the hyperbola is : x*x / majorradius*majorradius - y*y / minorradius*minorradius = 1.0 it is not forbidden to create an hyperbola with majorradius = minorradius. for the hyperbola the majorradius can be lower than the minorradius. the status is 'negativeradius' if majorradius < 0.0 and 'invertradius' if minorradius > majorradius.

Parameters
----------
A2: gp_Ax2
MajorRadius: float
MinorRadius: float

Returns
-------
None
") gce_MakeHypr;
		 gce_MakeHypr(const gp_Ax2 & A2, const Standard_Real MajorRadius, const Standard_Real MinorRadius);

		/****************** gce_MakeHypr ******************/
		%feature("compactdefaultargs") gce_MakeHypr;
		%feature("autodoc", "Constructs a hyperbola - centered on the point center, where: - the plane of the hyperbola is defined by center, s1 and s2, - its major axis is defined by center and s1, - its major radius is the distance between center and s1, and - its minor radius is the distance between s2 and the major axis. warning if an error occurs (that is, when isdone returns false), the status function returns: - gce_negativeradius if majorradius is less than 0.0; - gce_invertradius if: - the major radius (computed with center, s1) is less than the minor radius (computed with center, s1 and s2), or - majorradius is less than minorradius; or - gce_colinearpoints if s1, s2 and center are collinear.

Parameters
----------
S1: gp_Pnt
S2: gp_Pnt
Center: gp_Pnt

Returns
-------
None
") gce_MakeHypr;
		 gce_MakeHypr(const gp_Pnt & S1, const gp_Pnt & S2, const gp_Pnt & Center);

		/****************** Operator ******************/
		%feature("compactdefaultargs") Operator;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Hypr
") Operator;
		const gp_Hypr Operator();

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Returns the constructed hyperbola. exceptions stdfail_notdone if no hyperbola is constructed.

Returns
-------
gp_Hypr
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
		/****************** gce_MakeHypr2d ******************/
		%feature("compactdefaultargs") gce_MakeHypr2d;
		%feature("autodoc", "Constructs a hyperbola centered on the point center, where: - the major axis of the hyperbola is defined by center and point s1, - the major radius is the distance between center and s1, and - the minor radius is the distance between point s2 and the major axis.

Parameters
----------
S1: gp_Pnt2d
S2: gp_Pnt2d
Center: gp_Pnt2d

Returns
-------
None
") gce_MakeHypr2d;
		 gce_MakeHypr2d(const gp_Pnt2d & S1, const gp_Pnt2d & S2, const gp_Pnt2d & Center);

		/****************** gce_MakeHypr2d ******************/
		%feature("compactdefaultargs") gce_MakeHypr2d;
		%feature("autodoc", "Constructs a hyperbola with major and minor radii majorradius and minorradius, where: - the center of the hyperbola is the origin of the axis majoraxis, and - the major axis is defined by majoraxis if sense is true, or the opposite axis to majoraxis if sense is false; or - centered on the origin of the coordinate system a, with major and minor radii majorradius and minorradius, where its major axis is the 'x axis' of a (a is the local coordinate system of the hyperbola).

Parameters
----------
MajorAxis: gp_Ax2d
MajorRadius: float
MinorRadius: float
Sense: bool

Returns
-------
None
") gce_MakeHypr2d;
		 gce_MakeHypr2d(const gp_Ax2d & MajorAxis, const Standard_Real MajorRadius, const Standard_Real MinorRadius, const Standard_Boolean Sense);

		/****************** gce_MakeHypr2d ******************/
		%feature("compactdefaultargs") gce_MakeHypr2d;
		%feature("autodoc", "Creates a hypr2d centered on the origin of the coordinate system a, with major and minor radii majorradius and minorradius, where its major axis is the 'x axis' of a (a is the local coordinate system of the hyperbola).

Parameters
----------
A: gp_Ax22d
MajorRadius: float
MinorRadius: float

Returns
-------
None
") gce_MakeHypr2d;
		 gce_MakeHypr2d(const gp_Ax22d & A, const Standard_Real MajorRadius, const Standard_Real MinorRadius);

		/****************** Operator ******************/
		%feature("compactdefaultargs") Operator;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Hypr2d
") Operator;
		const gp_Hypr2d Operator();

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Returns the constructed hyperbola. exceptions stdfail_notdone if no hyperbola is constructed.

Returns
-------
gp_Hypr2d
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
		/****************** gce_MakeLin ******************/
		%feature("compactdefaultargs") gce_MakeLin;
		%feature("autodoc", "Creates a line located along the axis a1.

Parameters
----------
A1: gp_Ax1

Returns
-------
None
") gce_MakeLin;
		 gce_MakeLin(const gp_Ax1 & A1);

		/****************** gce_MakeLin ******************/
		%feature("compactdefaultargs") gce_MakeLin;
		%feature("autodoc", "<p> is the location point (origin) of the line and <v> is the direction of the line.

Parameters
----------
P: gp_Pnt
V: gp_Dir

Returns
-------
None
") gce_MakeLin;
		 gce_MakeLin(const gp_Pnt & P, const gp_Dir & V);

		/****************** gce_MakeLin ******************/
		%feature("compactdefaultargs") gce_MakeLin;
		%feature("autodoc", "Make a lin from gp <thelin> parallel to another lin <lin> and passing through a pnt <point>.

Parameters
----------
Lin: gp_Lin
Point: gp_Pnt

Returns
-------
None
") gce_MakeLin;
		 gce_MakeLin(const gp_Lin & Lin, const gp_Pnt & Point);

		/****************** gce_MakeLin ******************/
		%feature("compactdefaultargs") gce_MakeLin;
		%feature("autodoc", "Make a lin from gp <thelin> passing through 2 pnt <p1>,<p2>. it returns false if <p1> and <p2> are confused.

Parameters
----------
P1: gp_Pnt
P2: gp_Pnt

Returns
-------
None
") gce_MakeLin;
		 gce_MakeLin(const gp_Pnt & P1, const gp_Pnt & P2);

		/****************** Operator ******************/
		%feature("compactdefaultargs") Operator;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Lin
") Operator;
		const gp_Lin Operator();

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Returns the constructed line. exceptions stdfail_notdone is raised if no line is constructed.

Returns
-------
gp_Lin
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
		/****************** gce_MakeLin2d ******************/
		%feature("compactdefaultargs") gce_MakeLin2d;
		%feature("autodoc", "Creates a line located with a.

Parameters
----------
A: gp_Ax2d

Returns
-------
None
") gce_MakeLin2d;
		 gce_MakeLin2d(const gp_Ax2d & A);

		/****************** gce_MakeLin2d ******************/
		%feature("compactdefaultargs") gce_MakeLin2d;
		%feature("autodoc", "<p> is the location point (origin) of the line and <v> is the direction of the line.

Parameters
----------
P: gp_Pnt2d
V: gp_Dir2d

Returns
-------
None
") gce_MakeLin2d;
		 gce_MakeLin2d(const gp_Pnt2d & P, const gp_Dir2d & V);

		/****************** gce_MakeLin2d ******************/
		%feature("compactdefaultargs") gce_MakeLin2d;
		%feature("autodoc", "Creates the line from the equation a*x + b*y + c = 0.0 the status is 'nullaxis'if sqrt(a*a + b*b) <= resolution from gp.

Parameters
----------
A: float
B: float
C: float

Returns
-------
None
") gce_MakeLin2d;
		 gce_MakeLin2d(const Standard_Real A, const Standard_Real B, const Standard_Real C);

		/****************** gce_MakeLin2d ******************/
		%feature("compactdefaultargs") gce_MakeLin2d;
		%feature("autodoc", "Make a lin2d from gp <thelin> parallel to another lin2d <lin> at a distance <dist>. if dist is greater than zero the result is on the right of the line <lin>, else the result is on the left of the line <lin>.

Parameters
----------
Lin: gp_Lin2d
Dist: float

Returns
-------
None
") gce_MakeLin2d;
		 gce_MakeLin2d(const gp_Lin2d & Lin, const Standard_Real Dist);

		/****************** gce_MakeLin2d ******************/
		%feature("compactdefaultargs") gce_MakeLin2d;
		%feature("autodoc", "Make a lin2d from gp <thelin> parallel to another lin2d <lin> and passing through a pnt2d <point>.

Parameters
----------
Lin: gp_Lin2d
Point: gp_Pnt2d

Returns
-------
None
") gce_MakeLin2d;
		 gce_MakeLin2d(const gp_Lin2d & Lin, const gp_Pnt2d & Point);

		/****************** gce_MakeLin2d ******************/
		%feature("compactdefaultargs") gce_MakeLin2d;
		%feature("autodoc", "Make a lin2d from gp <thelin> passing through 2 pnt2d <p1>,<p2>. it returns false if <p1> and <p2> are confused. warning if an error occurs (that is, when isdone returns false), the status function returns: - gce_nullaxis if sqrt(a*a + b*b) is less than or equal to gp::resolution(), or - gce_confusedpoints if points p1 and p2 are coincident.

Parameters
----------
P1: gp_Pnt2d
P2: gp_Pnt2d

Returns
-------
None
") gce_MakeLin2d;
		 gce_MakeLin2d(const gp_Pnt2d & P1, const gp_Pnt2d & P2);

		/****************** Operator ******************/
		%feature("compactdefaultargs") Operator;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Lin2d
") Operator;
		gp_Lin2d Operator();

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Returns the constructed line. exceptions stdfail_notdone if no line is constructed.

Returns
-------
gp_Lin2d
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
		/****************** gce_MakeParab ******************/
		%feature("compactdefaultargs") gce_MakeParab;
		%feature("autodoc", "--- purpose ; creates a parabola with its local coordinate system 'a2' and it's focal length 'focal'. the xdirection of a2 defines the axis of symmetry of the parabola. the ydirection of a2 is parallel to the directrix of the parabola. the location point of a2 is the vertex of the parabola the status is 'nullfocuslength' if focal < 0.0.

Parameters
----------
A2: gp_Ax2
Focal: float

Returns
-------
None
") gce_MakeParab;
		 gce_MakeParab(const gp_Ax2 & A2, const Standard_Real Focal);

		/****************** gce_MakeParab ******************/
		%feature("compactdefaultargs") gce_MakeParab;
		%feature("autodoc", "D is the directrix of the parabola and f the focus point. the symmetry axis (xaxis) of the parabola is normal to the directrix and pass through the focus point f, but its location point is the vertex of the parabola. the yaxis of the parabola is parallel to d and its location point is the vertex of the parabola. the normal to the plane of the parabola is the cross product between the xaxis and the yaxis.

Parameters
----------
D: gp_Ax1
F: gp_Pnt

Returns
-------
None
") gce_MakeParab;
		 gce_MakeParab(const gp_Ax1 & D, const gp_Pnt & F);

		/****************** Operator ******************/
		%feature("compactdefaultargs") Operator;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Parab
") Operator;
		const gp_Parab Operator();

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Returns the constructed parabola. exceptions stdfail_notdone if no parabola is constructed.

Returns
-------
gp_Parab
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
		/****************** gce_MakeParab2d ******************/
		%feature("compactdefaultargs") gce_MakeParab2d;
		%feature("autodoc", "Creates a parabola with its axis of symmetry ('mirroraxis') and its focal length. warnings : it is possible to have focal = 0. the status is 'nullfocallength' raised if focal < 0.0.

Parameters
----------
MirrorAxis: gp_Ax2d
Focal: float
Sense: bool,optional
	default value is Standard_True

Returns
-------
None
") gce_MakeParab2d;
		 gce_MakeParab2d(const gp_Ax2d & MirrorAxis, const Standard_Real Focal, const Standard_Boolean Sense = Standard_True);

		/****************** gce_MakeParab2d ******************/
		%feature("compactdefaultargs") gce_MakeParab2d;
		%feature("autodoc", "Creates a parabola with its local coordinate system <a> and its focal length. warnings : it is possible to have focal = 0. the status is 'nullfocallength' raised if focal < 0.0.

Parameters
----------
A: gp_Ax22d
Focal: float

Returns
-------
None
") gce_MakeParab2d;
		 gce_MakeParab2d(const gp_Ax22d & A, const Standard_Real Focal);

		/****************** gce_MakeParab2d ******************/
		%feature("compactdefaultargs") gce_MakeParab2d;
		%feature("autodoc", "Creates a parabola with the directrix and the focus point. the sense of parametrization is given by sense.

Parameters
----------
D: gp_Ax2d
F: gp_Pnt2d
Sense: bool,optional
	default value is Standard_True

Returns
-------
None
") gce_MakeParab2d;
		 gce_MakeParab2d(const gp_Ax2d & D, const gp_Pnt2d & F, const Standard_Boolean Sense = Standard_True);

		/****************** gce_MakeParab2d ******************/
		%feature("compactdefaultargs") gce_MakeParab2d;
		%feature("autodoc", "Make an parab2d with s1 as the focal point and center as the apex of the parabola warning the makeparab2d class does not prevent the construction of a parabola with a null focal distance. if an error occurs (that is, when isdone returns false), the status function returns: - gce_nullfocuslength if focal is less than 0.0, or - gce_nullaxis if s1 and center are coincident.

Parameters
----------
S1: gp_Pnt2d
Center: gp_Pnt2d
Sense: bool,optional
	default value is Standard_True

Returns
-------
None
") gce_MakeParab2d;
		 gce_MakeParab2d(const gp_Pnt2d & S1, const gp_Pnt2d & Center, const Standard_Boolean Sense = Standard_True);

		/****************** Operator ******************/
		%feature("compactdefaultargs") Operator;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Parab2d
") Operator;
		const gp_Parab2d Operator();

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Returns the constructed parabola. exceptions stdfail_notdone if no parabola is constructed.

Returns
-------
gp_Parab2d
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
		/****************** gce_MakePln ******************/
		%feature("compactdefaultargs") gce_MakePln;
		%feature("autodoc", "The coordinate system of the plane is defined with the axis placement a2. the 'direction' of a2 defines the normal to the plane. the 'location' of a2 defines the location (origin) of the plane. the 'xdirection' and 'ydirection' of a2 define the 'xaxis' and the 'yaxis' of the plane used to parametrize the plane.

Parameters
----------
A2: gp_Ax2

Returns
-------
None
") gce_MakePln;
		 gce_MakePln(const gp_Ax2 & A2);

		/****************** gce_MakePln ******************/
		%feature("compactdefaultargs") gce_MakePln;
		%feature("autodoc", "Creates a plane with the 'location' point <p> and the normal direction <v>.

Parameters
----------
P: gp_Pnt
V: gp_Dir

Returns
-------
None
") gce_MakePln;
		 gce_MakePln(const gp_Pnt & P, const gp_Dir & V);

		/****************** gce_MakePln ******************/
		%feature("compactdefaultargs") gce_MakePln;
		%feature("autodoc", "Creates a plane from its cartesian equation : a * x + b * y + c * z + d = 0.0 //! the status is 'badequation' if sqrt (a*a + b*b + c*c) <= resolution from gp.

Parameters
----------
A: float
B: float
C: float
D: float

Returns
-------
None
") gce_MakePln;
		 gce_MakePln(const Standard_Real A, const Standard_Real B, const Standard_Real C, const Standard_Real D);

		/****************** gce_MakePln ******************/
		%feature("compactdefaultargs") gce_MakePln;
		%feature("autodoc", "Make a pln from gp <thepln> parallel to another pln <pln> and passing through a pnt <point>.

Parameters
----------
Pln: gp_Pln
Point: gp_Pnt

Returns
-------
None
") gce_MakePln;
		 gce_MakePln(const gp_Pln & Pln, const gp_Pnt & Point);

		/****************** gce_MakePln ******************/
		%feature("compactdefaultargs") gce_MakePln;
		%feature("autodoc", "Make a pln from gp <thepln> parallel to another pln <pln> at the distance <dist> which can be greater or less than zero. in the first case the result is at the distance <dist> to the plane <pln> in the direction of the normal to <pln>. otherwize it is in the opposite direction.

Parameters
----------
Pln: gp_Pln
Dist: float

Returns
-------
None
") gce_MakePln;
		 gce_MakePln(const gp_Pln & Pln, const Standard_Real Dist);

		/****************** gce_MakePln ******************/
		%feature("compactdefaultargs") gce_MakePln;
		%feature("autodoc", "Make a pln from gp <thepln> passing through 3 pnt <p1>,<p2>,<p3>. it returns false if <p1> <p2> <p3> are confused.

Parameters
----------
P1: gp_Pnt
P2: gp_Pnt
P3: gp_Pnt

Returns
-------
None
") gce_MakePln;
		 gce_MakePln(const gp_Pnt & P1, const gp_Pnt & P2, const gp_Pnt & P3);

		/****************** gce_MakePln ******************/
		%feature("compactdefaultargs") gce_MakePln;
		%feature("autodoc", "Make a pln from gp <thepln> perpendicular to the line passing through <p1>,<p2>. the status is 'confusedpoints' if <p1> <p2> are confused.

Parameters
----------
P1: gp_Pnt
P2: gp_Pnt

Returns
-------
None
") gce_MakePln;
		 gce_MakePln(const gp_Pnt & P1, const gp_Pnt & P2);

		/****************** gce_MakePln ******************/
		%feature("compactdefaultargs") gce_MakePln;
		%feature("autodoc", "Make a pln passing through the location of <axis>and normal to the direction of <axis>. warning - if an error occurs (that is, when isdone returns false), the status function returns: - gce_badequation if sqrt(a*a + b*b + c*c) is less than or equal to gp::resolution(), - gce_confusedpoints if p1 and p2 are coincident, or - gce_colinearpoints if p1, p2 and p3 are collinear.

Parameters
----------
Axis: gp_Ax1

Returns
-------
None
") gce_MakePln;
		 gce_MakePln(const gp_Ax1 & Axis);

		/****************** Operator ******************/
		%feature("compactdefaultargs") Operator;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Pln
") Operator;
		const gp_Pln Operator();

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Returns the constructed plane. exceptions stdfail_notdone if no plane is constructed.

Returns
-------
gp_Pln
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
