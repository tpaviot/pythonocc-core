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
		%feature("autodoc", "* Reverses the interior/exterior status of each side of the object. So, to take the complement of an object means to reverse the interior/exterior status of its boundary, i.e. inside becomes outside. The method returns the complementary orientation, following the rules in the table below: FORWARD REVERSED REVERSED FORWARD INTERNAL EXTERNAL EXTERNAL INTERNAL //! Complement complements the material side. Inside becomes outside.
	:param Or:
	:type Or: TopAbs_Orientation
	:rtype: TopAbs_Orientation") Complement;
		static TopAbs_Orientation Complement (const TopAbs_Orientation Or);

		/****************** Compose ******************/
		%feature("compactdefaultargs") Compose;
		%feature("autodoc", "* Compose the Orientation <Or1> and <Or2>. This composition is not symmetric (if you switch <Or1> and <Or2> the result is different). It assumes that <Or1> is the Orientation of a Shape S1 containing a Shape S2 of Orientation Or2. The result is the cumulated orientation of S2 in S1. The composition law is : //! \ Or2 FORWARD REVERSED INTERNAL EXTERNAL Or1 ------------------------------------- FORWARD | FORWARD REVERSED INTERNAL EXTERNAL | REVERSED | REVERSED FORWARD INTERNAL EXTERNAL | INTERNAL | INTERNAL INTERNAL INTERNAL INTERNAL | EXTERNAL | EXTERNAL EXTERNAL EXTERNAL EXTERNAL Note: The top corner in the table is the most important for the purposes of Open CASCADE topology and shape sharing.
	:param Or1:
	:type Or1: TopAbs_Orientation
	:param Or2:
	:type Or2: TopAbs_Orientation
	:rtype: TopAbs_Orientation") Compose;
		static TopAbs_Orientation Compose (const TopAbs_Orientation Or1,const TopAbs_Orientation Or2);

		/****************** Print ******************/
		%feature("compactdefaultargs") Print;
		%feature("autodoc", "* Prints the name of Shape type as a String on the Stream.
	:param theShapeType:
	:type theShapeType: TopAbs_ShapeEnum
	:param theStream:
	:type theStream: Standard_OStream
	:rtype: Standard_OStream") Print;
		static Standard_OStream & Print (const TopAbs_ShapeEnum theShapeType,Standard_OStream & theStream);

		/****************** Print ******************/
		%feature("compactdefaultargs") Print;
		%feature("autodoc", "* Prints the name of the Orientation as a String on the Stream.
	:param theOrientation:
	:type theOrientation: TopAbs_Orientation
	:param theStream:
	:type theStream: Standard_OStream
	:rtype: Standard_OStream") Print;
		static Standard_OStream & Print (const TopAbs_Orientation theOrientation,Standard_OStream & theStream);

		/****************** Print ******************/
		%feature("compactdefaultargs") Print;
		%feature("autodoc", "* Prints the name of the State <St> as a String on the Stream <S> and returns <S>.
	:param St:
	:type St: TopAbs_State
	:param S:
	:type S: Standard_OStream
	:rtype: Standard_OStream") Print;
		static Standard_OStream & Print (const TopAbs_State St,Standard_OStream & S);

		/****************** Reverse ******************/
		%feature("compactdefaultargs") Reverse;
		%feature("autodoc", "* xchanges the interior/exterior status of the two sides. This is what happens when the sense of direction is reversed. The following rules apply: //! FORWARD REVERSED REVERSED FORWARD INTERNAL INTERNAL EXTERNAL EXTERNAL //! Reverse exchange the material sides.
	:param Or:
	:type Or: TopAbs_Orientation
	:rtype: TopAbs_Orientation") Reverse;
		static TopAbs_Orientation Reverse (const TopAbs_Orientation Or);

		/****************** ShapeOrientationFromString ******************/
		%feature("compactdefaultargs") ShapeOrientationFromString;
		%feature("autodoc", "* Returns the shape orientation from the given string identifier (using case-insensitive comparison). @param theOrientationString string identifier returns shape orientation or TopAbs_FORWARD if string identifier is invalid
	:param theOrientationString:
	:type theOrientationString: char *
	:rtype: TopAbs_Orientation") ShapeOrientationFromString;
		static TopAbs_Orientation ShapeOrientationFromString (const char * theOrientationString);

		/****************** ShapeOrientationFromString ******************/
		%feature("compactdefaultargs") ShapeOrientationFromString;
		%feature("autodoc", "* Determines the shape orientation from the given string identifier (using case-insensitive comparison). @param theOrientationString string identifier @param theOrientation detected shape orientation returns True if string identifier is known
	:param theOrientationString:
	:type theOrientationString: char *
	:param theOrientation:
	:type theOrientation: TopAbs_Orientation
	:rtype: bool") ShapeOrientationFromString;
		static Standard_Boolean ShapeOrientationFromString (const char * theOrientationString,TopAbs_Orientation & theOrientation);

		/****************** ShapeOrientationToString ******************/
		%feature("compactdefaultargs") ShapeOrientationToString;
		%feature("autodoc", "* Returns the string name for a given shape orientation. @param theOrientation shape orientation returns string identifier from the list FORWARD, REVERSED, INTERNAL, EXTERNAL
	:param theOrientation:
	:type theOrientation: TopAbs_Orientation
	:rtype: char *") ShapeOrientationToString;
		static const char * ShapeOrientationToString (TopAbs_Orientation theOrientation);

		/****************** ShapeTypeFromString ******************/
		%feature("compactdefaultargs") ShapeTypeFromString;
		%feature("autodoc", "* Returns the shape type from the given string identifier (using case-insensitive comparison). @param theTypeString string identifier returns shape type or TopAbs_SHAPE if string identifier is invalid
	:param theTypeString:
	:type theTypeString: char *
	:rtype: TopAbs_ShapeEnum") ShapeTypeFromString;
		static TopAbs_ShapeEnum ShapeTypeFromString (const char * theTypeString);

		/****************** ShapeTypeFromString ******************/
		%feature("compactdefaultargs") ShapeTypeFromString;
		%feature("autodoc", "* Determines the shape type from the given string identifier (using case-insensitive comparison). @param theTypeString string identifier @param theType detected shape type returns True if string identifier is known
	:param theTypeString:
	:type theTypeString: char *
	:param theType:
	:type theType: TopAbs_ShapeEnum
	:rtype: bool") ShapeTypeFromString;
		static Standard_Boolean ShapeTypeFromString (const char * theTypeString,TopAbs_ShapeEnum & theType);

		/****************** ShapeTypeToString ******************/
		%feature("compactdefaultargs") ShapeTypeToString;
		%feature("autodoc", "* Returns the string name for a given shape type. @param theType shape type returns string identifier from the list COMPOUND, COMPSOLID, SOLID, SHELL, FACE, WIRE, EDGE, VERTEX, SHAPE
	:param theType:
	:type theType: TopAbs_ShapeEnum
	:rtype: char *") ShapeTypeToString;
		static const char * ShapeTypeToString (TopAbs_ShapeEnum theType);

};


%extend TopAbs {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/* harray1 classes */
/* harray2 classes */
/* hsequence classes */
