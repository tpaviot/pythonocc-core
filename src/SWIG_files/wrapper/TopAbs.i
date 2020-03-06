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
%define TOPABSDOCSTRING
"TopAbs module, see official documentation at
https://www.opencascade.com/doc/occt-7.4.0/refman/html/package_topabs.html"
%enddef
%module (package="OCC.Core", docstring=TOPABSDOCSTRING) TopAbs


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
#include<TopAbs_module.hxx>

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

%pythoncode {
from OCC.Core.Exception import *
};

/* public enums */
enum TopAbs_Orientation {
	TopAbs_FORWARD = 0,
	TopAbs_REVERSED = 1,
	TopAbs_INTERNAL = 2,
	TopAbs_EXTERNAL = 3,
};

enum TopAbs_ShapeEnum {
	TopAbs_COMPOUND = 0,
	TopAbs_COMPSOLID = 1,
	TopAbs_SOLID = 2,
	TopAbs_SHELL = 3,
	TopAbs_FACE = 4,
	TopAbs_WIRE = 5,
	TopAbs_EDGE = 6,
	TopAbs_VERTEX = 7,
	TopAbs_SHAPE = 8,
};

enum TopAbs_State {
	TopAbs_IN = 0,
	TopAbs_OUT = 1,
	TopAbs_ON = 2,
	TopAbs_UNKNOWN = 3,
};

/* end public enums declaration */

/* python proy classes for enums */
%pythoncode {

class TopAbs_Orientation:
	TopAbs_FORWARD = 0
	TopAbs_REVERSED = 1
	TopAbs_INTERNAL = 2
	TopAbs_EXTERNAL = 3

class TopAbs_ShapeEnum:
	TopAbs_COMPOUND = 0
	TopAbs_COMPSOLID = 1
	TopAbs_SOLID = 2
	TopAbs_SHELL = 3
	TopAbs_FACE = 4
	TopAbs_WIRE = 5
	TopAbs_EDGE = 6
	TopAbs_VERTEX = 7
	TopAbs_SHAPE = 8

class TopAbs_State:
	TopAbs_IN = 0
	TopAbs_OUT = 1
	TopAbs_ON = 2
	TopAbs_UNKNOWN = 3
};
/* end python proxy for enums */

/* handles */
/* end handles declaration */

/* templates */
/* end templates declaration */

/* typedefs */
/* end typedefs declaration */

/***************
* class TopAbs *
***************/
%rename(topabs) TopAbs;
class TopAbs {
	public:
		/****************** Complement ******************/
		%feature("compactdefaultargs") Complement;
		%feature("autodoc", "Reverses the interior/exterior status of each side of the object. so, to take the complement of an object means to reverse the interior/exterior status of its boundary, i.e. inside becomes outside. the method returns the complementary orientation, following the rules in the table below: forward reversed reversed forward internal external external internal //! complement complements the material side. inside becomes outside.

Parameters
----------
Or: TopAbs_Orientation

Returns
-------
TopAbs_Orientation
") Complement;
		static TopAbs_Orientation Complement(const TopAbs_Orientation Or);

		/****************** Compose ******************/
		%feature("compactdefaultargs") Compose;
		%feature("autodoc", "Compose the orientation <or1> and <or2>. this composition is not symmetric (if you switch <or1> and <or2> the result is different). it assumes that <or1> is the orientation of a shape s1 containing a shape s2 of orientation or2. the result is the cumulated orientation of s2 in s1. the composition law is : //! \ or2 forward reversed internal external or1 ------------------------------------- forward | forward reversed internal external | reversed | reversed forward internal external | internal | internal internal internal internal | external | external external external external note: the top corner in the table is the most important for the purposes of open cascade topology and shape sharing.

Parameters
----------
Or1: TopAbs_Orientation
Or2: TopAbs_Orientation

Returns
-------
TopAbs_Orientation
") Compose;
		static TopAbs_Orientation Compose(const TopAbs_Orientation Or1, const TopAbs_Orientation Or2);

		/****************** Reverse ******************/
		%feature("compactdefaultargs") Reverse;
		%feature("autodoc", "Xchanges the interior/exterior status of the two sides. this is what happens when the sense of direction is reversed. the following rules apply: //! forward reversed reversed forward internal internal external external //! reverse exchange the material sides.

Parameters
----------
Or: TopAbs_Orientation

Returns
-------
TopAbs_Orientation
") Reverse;
		static TopAbs_Orientation Reverse(const TopAbs_Orientation Or);

		/****************** ShapeOrientationFromString ******************/
		%feature("compactdefaultargs") ShapeOrientationFromString;
		%feature("autodoc", "Returns the shape orientation from the given string identifier (using case-insensitive comparison). @param theorientationstring string identifier returns shape orientation or topabs_forward if string identifier is invalid.

Parameters
----------
theOrientationString: char *

Returns
-------
TopAbs_Orientation
") ShapeOrientationFromString;
		static TopAbs_Orientation ShapeOrientationFromString(const char * theOrientationString);

		/****************** ShapeOrientationFromString ******************/
		%feature("compactdefaultargs") ShapeOrientationFromString;
		%feature("autodoc", "Determines the shape orientation from the given string identifier (using case-insensitive comparison). @param theorientationstring string identifier @param theorientation detected shape orientation returns true if string identifier is known.

Parameters
----------
theOrientationString: char *
theOrientation: TopAbs_Orientation

Returns
-------
bool
") ShapeOrientationFromString;
		static Standard_Boolean ShapeOrientationFromString(const char * theOrientationString, TopAbs_Orientation & theOrientation);

		/****************** ShapeOrientationToString ******************/
		%feature("compactdefaultargs") ShapeOrientationToString;
		%feature("autodoc", "Returns the string name for a given shape orientation. @param theorientation shape orientation returns string identifier from the list forward, reversed, internal, external.

Parameters
----------
theOrientation: TopAbs_Orientation

Returns
-------
char *
") ShapeOrientationToString;
		static const char * ShapeOrientationToString(TopAbs_Orientation theOrientation);

		/****************** ShapeTypeFromString ******************/
		%feature("compactdefaultargs") ShapeTypeFromString;
		%feature("autodoc", "Returns the shape type from the given string identifier (using case-insensitive comparison). @param thetypestring string identifier returns shape type or topabs_shape if string identifier is invalid.

Parameters
----------
theTypeString: char *

Returns
-------
TopAbs_ShapeEnum
") ShapeTypeFromString;
		static TopAbs_ShapeEnum ShapeTypeFromString(const char * theTypeString);

		/****************** ShapeTypeFromString ******************/
		%feature("compactdefaultargs") ShapeTypeFromString;
		%feature("autodoc", "Determines the shape type from the given string identifier (using case-insensitive comparison). @param thetypestring string identifier @param thetype detected shape type returns true if string identifier is known.

Parameters
----------
theTypeString: char *
theType: TopAbs_ShapeEnum

Returns
-------
bool
") ShapeTypeFromString;
		static Standard_Boolean ShapeTypeFromString(const char * theTypeString, TopAbs_ShapeEnum & theType);

		/****************** ShapeTypeToString ******************/
		%feature("compactdefaultargs") ShapeTypeToString;
		%feature("autodoc", "Returns the string name for a given shape type. @param thetype shape type returns string identifier from the list compound, compsolid, solid, shell, face, wire, edge, vertex, shape.

Parameters
----------
theType: TopAbs_ShapeEnum

Returns
-------
char *
") ShapeTypeToString;
		static const char * ShapeTypeToString(TopAbs_ShapeEnum theType);

};


%extend TopAbs {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/* harray1 classes */
/* harray2 classes */
/* hsequence classes */
