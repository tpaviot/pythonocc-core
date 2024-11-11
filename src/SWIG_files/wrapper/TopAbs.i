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
%define TOPABSDOCSTRING
"TopAbs module, see official documentation at
https://dev.opencascade.org/doc/occt-7.7.0/refman/html/package_topabs.html"
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
%include ../common/EnumTemplates.i
%include ../common/Operators.i
%include ../common/OccHandle.i
%include ../common/IOStream.i
%include ../common/ArrayMacros.i


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
from enum import IntEnum
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

/* python proxy classes for enums */
%pythoncode {

class TopAbs_Orientation(IntEnum):
	TopAbs_FORWARD = 0
	TopAbs_REVERSED = 1
	TopAbs_INTERNAL = 2
	TopAbs_EXTERNAL = 3
TopAbs_FORWARD = TopAbs_Orientation.TopAbs_FORWARD
TopAbs_REVERSED = TopAbs_Orientation.TopAbs_REVERSED
TopAbs_INTERNAL = TopAbs_Orientation.TopAbs_INTERNAL
TopAbs_EXTERNAL = TopAbs_Orientation.TopAbs_EXTERNAL

class TopAbs_ShapeEnum(IntEnum):
	TopAbs_COMPOUND = 0
	TopAbs_COMPSOLID = 1
	TopAbs_SOLID = 2
	TopAbs_SHELL = 3
	TopAbs_FACE = 4
	TopAbs_WIRE = 5
	TopAbs_EDGE = 6
	TopAbs_VERTEX = 7
	TopAbs_SHAPE = 8
TopAbs_COMPOUND = TopAbs_ShapeEnum.TopAbs_COMPOUND
TopAbs_COMPSOLID = TopAbs_ShapeEnum.TopAbs_COMPSOLID
TopAbs_SOLID = TopAbs_ShapeEnum.TopAbs_SOLID
TopAbs_SHELL = TopAbs_ShapeEnum.TopAbs_SHELL
TopAbs_FACE = TopAbs_ShapeEnum.TopAbs_FACE
TopAbs_WIRE = TopAbs_ShapeEnum.TopAbs_WIRE
TopAbs_EDGE = TopAbs_ShapeEnum.TopAbs_EDGE
TopAbs_VERTEX = TopAbs_ShapeEnum.TopAbs_VERTEX
TopAbs_SHAPE = TopAbs_ShapeEnum.TopAbs_SHAPE

class TopAbs_State(IntEnum):
	TopAbs_IN = 0
	TopAbs_OUT = 1
	TopAbs_ON = 2
	TopAbs_UNKNOWN = 3
TopAbs_IN = TopAbs_State.TopAbs_IN
TopAbs_OUT = TopAbs_State.TopAbs_OUT
TopAbs_ON = TopAbs_State.TopAbs_ON
TopAbs_UNKNOWN = TopAbs_State.TopAbs_UNKNOWN
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
		/**** md5 signature: d36735cb2b4d8defcd8da7a47d45737d ****/
		%feature("compactdefaultargs") Complement;
		%feature("autodoc", "
Parameters
----------
Or: TopAbs_Orientation

Return
-------
TopAbs_Orientation

Description
-----------
Reverses the interior/exterior status of each side of the object. so, to take the complement of an object means to reverse the interior/exterior status of its boundary, i.e. inside becomes outside. the method returns the complementary orientation, following the rules in the table below: forward reversed reversed forward internal external external internal //! complement complements the material side. inside becomes outside.
") Complement;
		static TopAbs_Orientation Complement(const TopAbs_Orientation Or);

		/****************** Compose ******************/
		/**** md5 signature: 6d609448eff18789b8606e52047834a9 ****/
		%feature("compactdefaultargs") Compose;
		%feature("autodoc", "
Parameters
----------
Or1: TopAbs_Orientation
Or2: TopAbs_Orientation

Return
-------
TopAbs_Orientation

Description
-----------
Compose the orientation <or1> and <or2>. this composition is not symmetric (if you switch <or1> and <or2> the result is different). it assumes that <or1> is the orientation of a shape s1 containing a shape s2 of orientation or2. the result is the cumulated orientation of s2 in s1. the composition law is: //! \ or2 forward reversed internal external or1 ------------------------------------- forward | forward reversed internal external | reversed | reversed forward internal external | internal | internal internal internal internal | external | external external external external note: the top corner in the table is the most important for the purposes of open cascade topology and shape sharing.
") Compose;
		static TopAbs_Orientation Compose(const TopAbs_Orientation Or1, const TopAbs_Orientation Or2);

		/****************** Print ******************/
		/**** md5 signature: f2bc915db789eecaddaf7f8a542302b9 ****/
		%feature("compactdefaultargs") Print;
		%feature("autodoc", "
Parameters
----------
theShapeType: TopAbs_ShapeEnum

Return
-------
theStream: Standard_OStream

Description
-----------
Prints the name of shape type as a string on the stream.
") Print;
		static Standard_OStream & Print(const TopAbs_ShapeEnum theShapeType, std::ostream &OutValue);

		/****************** Print ******************/
		/**** md5 signature: 6ad8c3d2eaff28edc070aae5129544a1 ****/
		%feature("compactdefaultargs") Print;
		%feature("autodoc", "
Parameters
----------
theOrientation: TopAbs_Orientation

Return
-------
theStream: Standard_OStream

Description
-----------
Prints the name of the orientation as a string on the stream.
") Print;
		static Standard_OStream & Print(const TopAbs_Orientation theOrientation, std::ostream &OutValue);

		/****************** Print ******************/
		/**** md5 signature: 9a9b3768d9e4f7b3106175734ca85d5b ****/
		%feature("compactdefaultargs") Print;
		%feature("autodoc", "
Parameters
----------
St: TopAbs_State

Return
-------
S: Standard_OStream

Description
-----------
Prints the name of the state <st> as a string on the stream <s> and returns <s>.
") Print;
		static Standard_OStream & Print(const TopAbs_State St, std::ostream &OutValue);

		/****************** Reverse ******************/
		/**** md5 signature: 24070ddabf8011f0d7eb29a4dc573a82 ****/
		%feature("compactdefaultargs") Reverse;
		%feature("autodoc", "
Parameters
----------
Or: TopAbs_Orientation

Return
-------
TopAbs_Orientation

Description
-----------
Xchanges the interior/exterior status of the two sides. this is what happens when the sense of direction is reversed. the following rules apply: //! forward reversed reversed forward internal internal external external //! reverse exchange the material sides.
") Reverse;
		static TopAbs_Orientation Reverse(const TopAbs_Orientation Or);

		/****************** ShapeOrientationFromString ******************/
		/**** md5 signature: d56c822166135ec6bcf030a0a5131e19 ****/
		%feature("compactdefaultargs") ShapeOrientationFromString;
		%feature("autodoc", "
Parameters
----------
theOrientationString: str

Return
-------
TopAbs_Orientation

Description
-----------
Returns the shape orientation from the given string identifier (using case-insensitive comparison). @param theorientationstring string identifier return shape orientation or topabs_forward if string identifier is invalid.
") ShapeOrientationFromString;
		static TopAbs_Orientation ShapeOrientationFromString(Standard_CString theOrientationString);

		/****************** ShapeOrientationFromString ******************/
		/**** md5 signature: 4bd3a8b6506d611c099d1cd778dd9fa2 ****/
		%feature("compactdefaultargs") ShapeOrientationFromString;
		%feature("autodoc", "
Parameters
----------
theOrientationString: str

Return
-------
theOrientation: TopAbs_Orientation

Description
-----------
Determines the shape orientation from the given string identifier (using case-insensitive comparison). @param theorientationstring string identifier @param theorientation detected shape orientation return true if string identifier is known.
") ShapeOrientationFromString;
		static Standard_Boolean ShapeOrientationFromString(Standard_CString theOrientationString, TopAbs_Orientation &OutValue);

		/****************** ShapeOrientationToString ******************/
		/**** md5 signature: 08fa460365bf4bd2ca48f9d91582fbaa ****/
		%feature("compactdefaultargs") ShapeOrientationToString;
		%feature("autodoc", "
Parameters
----------
theOrientation: TopAbs_Orientation

Return
-------
str

Description
-----------
Returns the string name for a given shape orientation. @param theorientation shape orientation return string identifier from the list forward, reversed, internal, external.
") ShapeOrientationToString;
		static Standard_CString ShapeOrientationToString(TopAbs_Orientation theOrientation);

		/****************** ShapeTypeFromString ******************/
		/**** md5 signature: ae0bd90ac4739a50df48b85c8da99f5d ****/
		%feature("compactdefaultargs") ShapeTypeFromString;
		%feature("autodoc", "
Parameters
----------
theTypeString: str

Return
-------
TopAbs_ShapeEnum

Description
-----------
Returns the shape type from the given string identifier (using case-insensitive comparison). @param thetypestring string identifier return shape type or topabs_shape if string identifier is invalid.
") ShapeTypeFromString;
		static TopAbs_ShapeEnum ShapeTypeFromString(Standard_CString theTypeString);

		/****************** ShapeTypeFromString ******************/
		/**** md5 signature: d787d966b2bad997712c62065f94654d ****/
		%feature("compactdefaultargs") ShapeTypeFromString;
		%feature("autodoc", "
Parameters
----------
theTypeString: str

Return
-------
theType: TopAbs_ShapeEnum

Description
-----------
Determines the shape type from the given string identifier (using case-insensitive comparison). @param thetypestring string identifier @param thetype detected shape type return true if string identifier is known.
") ShapeTypeFromString;
		static Standard_Boolean ShapeTypeFromString(Standard_CString theTypeString, TopAbs_ShapeEnum &OutValue);

		/****************** ShapeTypeToString ******************/
		/**** md5 signature: 47d69b9834372b84634fd7993fa38cf6 ****/
		%feature("compactdefaultargs") ShapeTypeToString;
		%feature("autodoc", "
Parameters
----------
theType: TopAbs_ShapeEnum

Return
-------
str

Description
-----------
Returns the string name for a given shape type. @param thetype shape type return string identifier from the list compound, compsolid, solid, shell, face, wire, edge, vertex, shape.
") ShapeTypeToString;
		static Standard_CString ShapeTypeToString(TopAbs_ShapeEnum theType);

};


%extend TopAbs {
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
def topabs_Complement(*args):
	return topabs.Complement(*args)

@deprecated
def topabs_Compose(*args):
	return topabs.Compose(*args)

@deprecated
def topabs_Print(*args):
	return topabs.Print(*args)

@deprecated
def topabs_Print(*args):
	return topabs.Print(*args)

@deprecated
def topabs_Print(*args):
	return topabs.Print(*args)

@deprecated
def topabs_Reverse(*args):
	return topabs.Reverse(*args)

@deprecated
def topabs_ShapeOrientationFromString(*args):
	return topabs.ShapeOrientationFromString(*args)

@deprecated
def topabs_ShapeOrientationFromString(*args):
	return topabs.ShapeOrientationFromString(*args)

@deprecated
def topabs_ShapeOrientationToString(*args):
	return topabs.ShapeOrientationToString(*args)

@deprecated
def topabs_ShapeTypeFromString(*args):
	return topabs.ShapeTypeFromString(*args)

@deprecated
def topabs_ShapeTypeFromString(*args):
	return topabs.ShapeTypeFromString(*args)

@deprecated
def topabs_ShapeTypeToString(*args):
	return topabs.ShapeTypeToString(*args)

}
