/*
Copyright 2008-2017 Thomas Paviot (tpaviot@gmail.com)


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
%module (package="OCC") TopAbs

#pragma SWIG nowarn=504,325,503

%{
#ifdef WNT
#pragma warning(disable : 4716)
#endif
%}

%include ../common/CommonIncludes.i
%include ../common/ExceptionCatcher.i
%include ../common/FunctionTransformers.i
%include ../common/Operators.i


%include TopAbs_headers.i


%pythoncode {
def register_handle(handle, base_object):
    """
    Inserts the handle into the base object to
    prevent memory corruption in certain cases
    """
    try:
        if base_object.IsKind("Standard_Transient"):
            base_object.thisHandle = handle
            base_object.thisown = False
    except:
        pass
};

/* typedefs */
/* end typedefs declaration */

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

%rename(topabs) TopAbs;
class TopAbs {
	public:
		%feature("compactdefaultargs") Compose;
		%feature("autodoc", "	* Compose the Orientation <Or1> and <Or2>. This composition is not symmetric (if you switch <Or1> and <Or2> the result is different). It assumes that <Or1> is the Orientation of a Shape S1 containing a Shape S2 of Orientation Or2. The result is the cumulated orientation of S2 in S1. The composition law is : //! \ Or2 FORWARD REVERSED INTERNAL EXTERNAL Or1 ------------------------------------- FORWARD | FORWARD REVERSED INTERNAL EXTERNAL | REVERSED | REVERSED FORWARD INTERNAL EXTERNAL | INTERNAL | INTERNAL INTERNAL INTERNAL INTERNAL | EXTERNAL | EXTERNAL EXTERNAL EXTERNAL EXTERNAL Note: The top corner in the table is the most important for the purposes of Open CASCADE topology and shape sharing.

	:param Or1:
	:type Or1: TopAbs_Orientation
	:param Or2:
	:type Or2: TopAbs_Orientation
	:rtype: TopAbs_Orientation
") Compose;
		static TopAbs_Orientation Compose (const TopAbs_Orientation Or1,const TopAbs_Orientation Or2);
		%feature("compactdefaultargs") Reverse;
		%feature("autodoc", "	* xchanges the interior/exterior status of the two sides. This is what happens when the sense of direction is reversed. The following rules apply: //! FORWARD REVERSED REVERSED FORWARD INTERNAL INTERNAL EXTERNAL EXTERNAL //! Reverse exchange the material sides.

	:param Or:
	:type Or: TopAbs_Orientation
	:rtype: TopAbs_Orientation
") Reverse;
		static TopAbs_Orientation Reverse (const TopAbs_Orientation Or);
		%feature("compactdefaultargs") Complement;
		%feature("autodoc", "	* Reverses the interior/exterior status of each side of the object. So, to take the complement of an object means to reverse the interior/exterior status of its boundary, i.e. inside becomes outside. The method returns the complementary orientation, following the rules in the table below: FORWARD REVERSED REVERSED FORWARD INTERNAL EXTERNAL EXTERNAL INTERNAL //! Complement complements the material side. Inside becomes outside.

	:param Or:
	:type Or: TopAbs_Orientation
	:rtype: TopAbs_Orientation
") Complement;
		static TopAbs_Orientation Complement (const TopAbs_Orientation Or);
		%feature("compactdefaultargs") Print;
		%feature("autodoc", "	* Prints the name of Shape <SEq> as a String on the Stream <S> and returns <S>.

	:param SE:
	:type SE: TopAbs_ShapeEnum
	:param S:
	:type S: Standard_OStream &
	:rtype: Standard_OStream
") Print;
		static Standard_OStream & Print (const TopAbs_ShapeEnum SE,Standard_OStream & S);
		%feature("compactdefaultargs") Print;
		%feature("autodoc", "	* Prints the name of the Orientation <Or> as a String on the Stream <S> and returns <S>.

	:param Or:
	:type Or: TopAbs_Orientation
	:param S:
	:type S: Standard_OStream &
	:rtype: Standard_OStream
") Print;
		static Standard_OStream & Print (const TopAbs_Orientation Or,Standard_OStream & S);
		%feature("compactdefaultargs") Print;
		%feature("autodoc", "	* Prints the name of the State <St> as a String on the Stream <S> and returns <S>.

	:param St:
	:type St: TopAbs_State
	:param S:
	:type S: Standard_OStream &
	:rtype: Standard_OStream
") Print;
		static Standard_OStream & Print (const TopAbs_State St,Standard_OStream & S);
};


%extend TopAbs {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
