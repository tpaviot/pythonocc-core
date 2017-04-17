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
%module (package="OCC") TColStd

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


%include TColStd_headers.i


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
/* end public enums declaration */

%nodefaultctor TColStd_Array1OfAsciiString;
class TColStd_Array1OfAsciiString {
	public:
		%feature("compactdefaultargs") TColStd_Array1OfAsciiString;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") TColStd_Array1OfAsciiString;
		 TColStd_Array1OfAsciiString (const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") TColStd_Array1OfAsciiString;
		%feature("autodoc", "	:param Item:
	:type Item: TCollection_AsciiString &
	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") TColStd_Array1OfAsciiString;
		 TColStd_Array1OfAsciiString (const TCollection_AsciiString & Item,const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param V:
	:type V: TCollection_AsciiString &
	:rtype: None
") Init;
		void Init (const TCollection_AsciiString & V);
		%feature("compactdefaultargs") Destroy;
		%feature("autodoc", "	:rtype: None
") Destroy;
		void Destroy ();
		%feature("compactdefaultargs") IsAllocated;
		%feature("autodoc", "	:rtype: bool
") IsAllocated;
		Standard_Boolean IsAllocated ();
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: TColStd_Array1OfAsciiString &
	:rtype: TColStd_Array1OfAsciiString
") Assign;
		const TColStd_Array1OfAsciiString & Assign (const TColStd_Array1OfAsciiString & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: TColStd_Array1OfAsciiString &
	:rtype: TColStd_Array1OfAsciiString
") operator =;
		const TColStd_Array1OfAsciiString & operator = (const TColStd_Array1OfAsciiString & Other);
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "	:rtype: int
") Length;
		Standard_Integer Length ();
		%feature("compactdefaultargs") Lower;
		%feature("autodoc", "	:rtype: int
") Lower;
		Standard_Integer Lower ();
		%feature("compactdefaultargs") Upper;
		%feature("autodoc", "	:rtype: int
") Upper;
		Standard_Integer Upper ();
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param Value:
	:type Value: TCollection_AsciiString &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const TCollection_AsciiString & Value);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: TCollection_AsciiString
") Value;
		const TCollection_AsciiString & Value (const Standard_Integer Index);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: TCollection_AsciiString
") ChangeValue;
		TCollection_AsciiString & ChangeValue (const Standard_Integer Index);
};


%extend TColStd_Array1OfAsciiString {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TColStd_Array1OfBoolean;
class TColStd_Array1OfBoolean {
	public:
		%feature("compactdefaultargs") TColStd_Array1OfBoolean;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") TColStd_Array1OfBoolean;
		 TColStd_Array1OfBoolean (const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") TColStd_Array1OfBoolean;
		%feature("autodoc", "	:param Item:
	:type Item: bool
	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") TColStd_Array1OfBoolean;
		 TColStd_Array1OfBoolean (const Standard_Boolean & Item,const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param V:
	:type V: bool
	:rtype: None
") Init;
		void Init (const Standard_Boolean & V);
		%feature("compactdefaultargs") Destroy;
		%feature("autodoc", "	:rtype: None
") Destroy;
		void Destroy ();
		%feature("compactdefaultargs") IsAllocated;
		%feature("autodoc", "	:rtype: bool
") IsAllocated;
		Standard_Boolean IsAllocated ();
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: TColStd_Array1OfBoolean &
	:rtype: TColStd_Array1OfBoolean
") Assign;
		const TColStd_Array1OfBoolean & Assign (const TColStd_Array1OfBoolean & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: TColStd_Array1OfBoolean &
	:rtype: TColStd_Array1OfBoolean
") operator =;
		const TColStd_Array1OfBoolean & operator = (const TColStd_Array1OfBoolean & Other);
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "	:rtype: int
") Length;
		Standard_Integer Length ();
		%feature("compactdefaultargs") Lower;
		%feature("autodoc", "	:rtype: int
") Lower;
		Standard_Integer Lower ();
		%feature("compactdefaultargs") Upper;
		%feature("autodoc", "	:rtype: int
") Upper;
		Standard_Integer Upper ();
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param Value:
	:type Value: bool
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const Standard_Boolean & Value);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: bool
") Value;
		const Standard_Boolean & Value (const Standard_Integer Index);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: bool
") ChangeValue;
		Standard_Boolean & ChangeValue (const Standard_Integer Index);
};


%extend TColStd_Array1OfBoolean {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TColStd_Array1OfByte;
class TColStd_Array1OfByte {
	public:
		%feature("compactdefaultargs") TColStd_Array1OfByte;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") TColStd_Array1OfByte;
		 TColStd_Array1OfByte (const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") TColStd_Array1OfByte;
		%feature("autodoc", "	:param Item:
	:type Item: Standard_Byte &
	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") TColStd_Array1OfByte;
		 TColStd_Array1OfByte (const Standard_Byte & Item,const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param V:
	:type V: Standard_Byte &
	:rtype: None
") Init;
		void Init (const Standard_Byte & V);
		%feature("compactdefaultargs") Destroy;
		%feature("autodoc", "	:rtype: None
") Destroy;
		void Destroy ();
		%feature("compactdefaultargs") IsAllocated;
		%feature("autodoc", "	:rtype: bool
") IsAllocated;
		Standard_Boolean IsAllocated ();
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: TColStd_Array1OfByte &
	:rtype: TColStd_Array1OfByte
") Assign;
		const TColStd_Array1OfByte & Assign (const TColStd_Array1OfByte & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: TColStd_Array1OfByte &
	:rtype: TColStd_Array1OfByte
") operator =;
		const TColStd_Array1OfByte & operator = (const TColStd_Array1OfByte & Other);
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "	:rtype: int
") Length;
		Standard_Integer Length ();
		%feature("compactdefaultargs") Lower;
		%feature("autodoc", "	:rtype: int
") Lower;
		Standard_Integer Lower ();
		%feature("compactdefaultargs") Upper;
		%feature("autodoc", "	:rtype: int
") Upper;
		Standard_Integer Upper ();
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param Value:
	:type Value: Standard_Byte &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const Standard_Byte & Value);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Standard_Byte
") Value;
		const Standard_Byte & Value (const Standard_Integer Index);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Standard_Byte
") ChangeValue;
		Standard_Byte & ChangeValue (const Standard_Integer Index);
};


%extend TColStd_Array1OfByte {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TColStd_Array1OfCharacter;
class TColStd_Array1OfCharacter {
	public:
		%feature("compactdefaultargs") TColStd_Array1OfCharacter;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") TColStd_Array1OfCharacter;
		 TColStd_Array1OfCharacter (const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") TColStd_Array1OfCharacter;
		%feature("autodoc", "	:param Item:
	:type Item: Standard_Character &
	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") TColStd_Array1OfCharacter;
		 TColStd_Array1OfCharacter (const Standard_Character & Item,const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param V:
	:type V: Standard_Character &
	:rtype: None
") Init;
		void Init (const Standard_Character & V);
		%feature("compactdefaultargs") Destroy;
		%feature("autodoc", "	:rtype: None
") Destroy;
		void Destroy ();
		%feature("compactdefaultargs") IsAllocated;
		%feature("autodoc", "	:rtype: bool
") IsAllocated;
		Standard_Boolean IsAllocated ();
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: TColStd_Array1OfCharacter &
	:rtype: TColStd_Array1OfCharacter
") Assign;
		const TColStd_Array1OfCharacter & Assign (const TColStd_Array1OfCharacter & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: TColStd_Array1OfCharacter &
	:rtype: TColStd_Array1OfCharacter
") operator =;
		const TColStd_Array1OfCharacter & operator = (const TColStd_Array1OfCharacter & Other);
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "	:rtype: int
") Length;
		Standard_Integer Length ();
		%feature("compactdefaultargs") Lower;
		%feature("autodoc", "	:rtype: int
") Lower;
		Standard_Integer Lower ();
		%feature("compactdefaultargs") Upper;
		%feature("autodoc", "	:rtype: int
") Upper;
		Standard_Integer Upper ();
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param Value:
	:type Value: Standard_Character &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const Standard_Character & Value);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Standard_Character
") Value;
		const Standard_Character & Value (const Standard_Integer Index);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Standard_Character
") ChangeValue;
		Standard_Character & ChangeValue (const Standard_Integer Index);
};


%extend TColStd_Array1OfCharacter {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TColStd_Array1OfExtendedString;
class TColStd_Array1OfExtendedString {
	public:
		%feature("compactdefaultargs") TColStd_Array1OfExtendedString;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") TColStd_Array1OfExtendedString;
		 TColStd_Array1OfExtendedString (const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") TColStd_Array1OfExtendedString;
		%feature("autodoc", "	:param Item:
	:type Item: TCollection_ExtendedString &
	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") TColStd_Array1OfExtendedString;
		 TColStd_Array1OfExtendedString (const TCollection_ExtendedString & Item,const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param V:
	:type V: TCollection_ExtendedString &
	:rtype: None
") Init;
		void Init (const TCollection_ExtendedString & V);
		%feature("compactdefaultargs") Destroy;
		%feature("autodoc", "	:rtype: None
") Destroy;
		void Destroy ();
		%feature("compactdefaultargs") IsAllocated;
		%feature("autodoc", "	:rtype: bool
") IsAllocated;
		Standard_Boolean IsAllocated ();
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: TColStd_Array1OfExtendedString &
	:rtype: TColStd_Array1OfExtendedString
") Assign;
		const TColStd_Array1OfExtendedString & Assign (const TColStd_Array1OfExtendedString & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: TColStd_Array1OfExtendedString &
	:rtype: TColStd_Array1OfExtendedString
") operator =;
		const TColStd_Array1OfExtendedString & operator = (const TColStd_Array1OfExtendedString & Other);
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "	:rtype: int
") Length;
		Standard_Integer Length ();
		%feature("compactdefaultargs") Lower;
		%feature("autodoc", "	:rtype: int
") Lower;
		Standard_Integer Lower ();
		%feature("compactdefaultargs") Upper;
		%feature("autodoc", "	:rtype: int
") Upper;
		Standard_Integer Upper ();
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param Value:
	:type Value: TCollection_ExtendedString &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const TCollection_ExtendedString & Value);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: TCollection_ExtendedString
") Value;
		const TCollection_ExtendedString & Value (const Standard_Integer Index);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: TCollection_ExtendedString
") ChangeValue;
		TCollection_ExtendedString & ChangeValue (const Standard_Integer Index);
};


%extend TColStd_Array1OfExtendedString {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TColStd_Array1OfInteger;
class TColStd_Array1OfInteger {
	public:
		%feature("compactdefaultargs") TColStd_Array1OfInteger;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") TColStd_Array1OfInteger;
		 TColStd_Array1OfInteger (const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") TColStd_Array1OfInteger;
		%feature("autodoc", "	:param Item:
	:type Item: int &
	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") TColStd_Array1OfInteger;
		 TColStd_Array1OfInteger (const Standard_Integer & Item,const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param V:
	:type V: int &
	:rtype: None
") Init;
		void Init (const Standard_Integer & V);
		%feature("compactdefaultargs") Destroy;
		%feature("autodoc", "	:rtype: None
") Destroy;
		void Destroy ();
		%feature("compactdefaultargs") IsAllocated;
		%feature("autodoc", "	:rtype: bool
") IsAllocated;
		Standard_Boolean IsAllocated ();
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: TColStd_Array1OfInteger &
	:rtype: TColStd_Array1OfInteger
") Assign;
		const TColStd_Array1OfInteger & Assign (const TColStd_Array1OfInteger & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: TColStd_Array1OfInteger &
	:rtype: TColStd_Array1OfInteger
") operator =;
		const TColStd_Array1OfInteger & operator = (const TColStd_Array1OfInteger & Other);
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "	:rtype: int
") Length;
		Standard_Integer Length ();
		%feature("compactdefaultargs") Lower;
		%feature("autodoc", "	:rtype: int
") Lower;
		Standard_Integer Lower ();
		%feature("compactdefaultargs") Upper;
		%feature("autodoc", "	:rtype: int
") Upper;
		Standard_Integer Upper ();
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param Value:
	:type Value: int &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const Standard_Integer & Value);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: int
") Value;
		const Standard_Integer & Value (const Standard_Integer Index);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: int
") ChangeValue;
		Standard_Integer & ChangeValue (const Standard_Integer Index);
};


%extend TColStd_Array1OfInteger {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TColStd_Array1OfListOfInteger;
class TColStd_Array1OfListOfInteger {
	public:
		%feature("compactdefaultargs") TColStd_Array1OfListOfInteger;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") TColStd_Array1OfListOfInteger;
		 TColStd_Array1OfListOfInteger (const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") TColStd_Array1OfListOfInteger;
		%feature("autodoc", "	:param Item:
	:type Item: TColStd_ListOfInteger &
	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") TColStd_Array1OfListOfInteger;
		 TColStd_Array1OfListOfInteger (const TColStd_ListOfInteger & Item,const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param V:
	:type V: TColStd_ListOfInteger &
	:rtype: None
") Init;
		void Init (const TColStd_ListOfInteger & V);
		%feature("compactdefaultargs") Destroy;
		%feature("autodoc", "	:rtype: None
") Destroy;
		void Destroy ();
		%feature("compactdefaultargs") IsAllocated;
		%feature("autodoc", "	:rtype: bool
") IsAllocated;
		Standard_Boolean IsAllocated ();
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: TColStd_Array1OfListOfInteger &
	:rtype: TColStd_Array1OfListOfInteger
") Assign;
		const TColStd_Array1OfListOfInteger & Assign (const TColStd_Array1OfListOfInteger & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: TColStd_Array1OfListOfInteger &
	:rtype: TColStd_Array1OfListOfInteger
") operator =;
		const TColStd_Array1OfListOfInteger & operator = (const TColStd_Array1OfListOfInteger & Other);
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "	:rtype: int
") Length;
		Standard_Integer Length ();
		%feature("compactdefaultargs") Lower;
		%feature("autodoc", "	:rtype: int
") Lower;
		Standard_Integer Lower ();
		%feature("compactdefaultargs") Upper;
		%feature("autodoc", "	:rtype: int
") Upper;
		Standard_Integer Upper ();
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param Value:
	:type Value: TColStd_ListOfInteger &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const TColStd_ListOfInteger & Value);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: TColStd_ListOfInteger
") Value;
		const TColStd_ListOfInteger & Value (const Standard_Integer Index);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: TColStd_ListOfInteger
") ChangeValue;
		TColStd_ListOfInteger & ChangeValue (const Standard_Integer Index);
};


%extend TColStd_Array1OfListOfInteger {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TColStd_Array1OfReal;
class TColStd_Array1OfReal {
	public:
		%feature("compactdefaultargs") TColStd_Array1OfReal;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") TColStd_Array1OfReal;
		 TColStd_Array1OfReal (const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") TColStd_Array1OfReal;
		%feature("autodoc", "	:param Item:
	:type Item: float &
	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") TColStd_Array1OfReal;
		 TColStd_Array1OfReal (const Standard_Real & Item,const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param V:
	:type V: float &
	:rtype: None
") Init;
		void Init (const Standard_Real & V);
		%feature("compactdefaultargs") Destroy;
		%feature("autodoc", "	:rtype: None
") Destroy;
		void Destroy ();
		%feature("compactdefaultargs") IsAllocated;
		%feature("autodoc", "	:rtype: bool
") IsAllocated;
		Standard_Boolean IsAllocated ();
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: TColStd_Array1OfReal &
	:rtype: TColStd_Array1OfReal
") Assign;
		const TColStd_Array1OfReal & Assign (const TColStd_Array1OfReal & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: TColStd_Array1OfReal &
	:rtype: TColStd_Array1OfReal
") operator =;
		const TColStd_Array1OfReal & operator = (const TColStd_Array1OfReal & Other);
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "	:rtype: int
") Length;
		Standard_Integer Length ();
		%feature("compactdefaultargs") Lower;
		%feature("autodoc", "	:rtype: int
") Lower;
		Standard_Integer Lower ();
		%feature("compactdefaultargs") Upper;
		%feature("autodoc", "	:rtype: int
") Upper;
		Standard_Integer Upper ();
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param Value:
	:type Value: float &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const Standard_Real & Value);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: float
") Value;
		const Standard_Real & Value (const Standard_Integer Index);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: float
") ChangeValue;
		Standard_Real & ChangeValue (const Standard_Integer Index);
};


%extend TColStd_Array1OfReal {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TColStd_Array1OfTransient;
class TColStd_Array1OfTransient {
	public:
		%feature("compactdefaultargs") TColStd_Array1OfTransient;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") TColStd_Array1OfTransient;
		 TColStd_Array1OfTransient (const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") TColStd_Array1OfTransient;
		%feature("autodoc", "	:param Item:
	:type Item: Handle_Standard_Transient &
	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") TColStd_Array1OfTransient;
		 TColStd_Array1OfTransient (const Handle_Standard_Transient & Item,const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param V:
	:type V: Handle_Standard_Transient &
	:rtype: None
") Init;
		void Init (const Handle_Standard_Transient & V);
		%feature("compactdefaultargs") Destroy;
		%feature("autodoc", "	:rtype: None
") Destroy;
		void Destroy ();
		%feature("compactdefaultargs") IsAllocated;
		%feature("autodoc", "	:rtype: bool
") IsAllocated;
		Standard_Boolean IsAllocated ();
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: TColStd_Array1OfTransient &
	:rtype: TColStd_Array1OfTransient
") Assign;
		const TColStd_Array1OfTransient & Assign (const TColStd_Array1OfTransient & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: TColStd_Array1OfTransient &
	:rtype: TColStd_Array1OfTransient
") operator =;
		const TColStd_Array1OfTransient & operator = (const TColStd_Array1OfTransient & Other);
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "	:rtype: int
") Length;
		Standard_Integer Length ();
		%feature("compactdefaultargs") Lower;
		%feature("autodoc", "	:rtype: int
") Lower;
		Standard_Integer Lower ();
		%feature("compactdefaultargs") Upper;
		%feature("autodoc", "	:rtype: int
") Upper;
		Standard_Integer Upper ();
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param Value:
	:type Value: Handle_Standard_Transient &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const Handle_Standard_Transient & Value);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Handle_Standard_Transient
") Value;
		Handle_Standard_Transient Value (const Standard_Integer Index);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Handle_Standard_Transient
") ChangeValue;
		Handle_Standard_Transient ChangeValue (const Standard_Integer Index);
};


%extend TColStd_Array1OfTransient {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TColStd_Array2OfBoolean;
class TColStd_Array2OfBoolean {
	public:
		%feature("compactdefaultargs") TColStd_Array2OfBoolean;
		%feature("autodoc", "	:param R1:
	:type R1: int
	:param R2:
	:type R2: int
	:param C1:
	:type C1: int
	:param C2:
	:type C2: int
	:rtype: None
") TColStd_Array2OfBoolean;
		 TColStd_Array2OfBoolean (const Standard_Integer R1,const Standard_Integer R2,const Standard_Integer C1,const Standard_Integer C2);
		%feature("compactdefaultargs") TColStd_Array2OfBoolean;
		%feature("autodoc", "	:param Item:
	:type Item: bool
	:param R1:
	:type R1: int
	:param R2:
	:type R2: int
	:param C1:
	:type C1: int
	:param C2:
	:type C2: int
	:rtype: None
") TColStd_Array2OfBoolean;
		 TColStd_Array2OfBoolean (const Standard_Boolean & Item,const Standard_Integer R1,const Standard_Integer R2,const Standard_Integer C1,const Standard_Integer C2);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param V:
	:type V: bool
	:rtype: None
") Init;
		void Init (const Standard_Boolean & V);
		%feature("compactdefaultargs") Destroy;
		%feature("autodoc", "	:rtype: None
") Destroy;
		void Destroy ();
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: TColStd_Array2OfBoolean &
	:rtype: TColStd_Array2OfBoolean
") Assign;
		const TColStd_Array2OfBoolean & Assign (const TColStd_Array2OfBoolean & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: TColStd_Array2OfBoolean &
	:rtype: TColStd_Array2OfBoolean
") operator =;
		const TColStd_Array2OfBoolean & operator = (const TColStd_Array2OfBoolean & Other);
		%feature("compactdefaultargs") ColLength;
		%feature("autodoc", "	:rtype: int
") ColLength;
		Standard_Integer ColLength ();
		%feature("compactdefaultargs") RowLength;
		%feature("autodoc", "	:rtype: int
") RowLength;
		Standard_Integer RowLength ();
		%feature("compactdefaultargs") LowerCol;
		%feature("autodoc", "	:rtype: int
") LowerCol;
		Standard_Integer LowerCol ();
		%feature("compactdefaultargs") LowerRow;
		%feature("autodoc", "	:rtype: int
") LowerRow;
		Standard_Integer LowerRow ();
		%feature("compactdefaultargs") UpperCol;
		%feature("autodoc", "	:rtype: int
") UpperCol;
		Standard_Integer UpperCol ();
		%feature("compactdefaultargs") UpperRow;
		%feature("autodoc", "	:rtype: int
") UpperRow;
		Standard_Integer UpperRow ();
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param Row:
	:type Row: int
	:param Col:
	:type Col: int
	:param Value:
	:type Value: bool
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Row,const Standard_Integer Col,const Standard_Boolean & Value);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Row:
	:type Row: int
	:param Col:
	:type Col: int
	:rtype: bool
") Value;
		const Standard_Boolean & Value (const Standard_Integer Row,const Standard_Integer Col);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Row:
	:type Row: int
	:param Col:
	:type Col: int
	:rtype: bool
") ChangeValue;
		Standard_Boolean & ChangeValue (const Standard_Integer Row,const Standard_Integer Col);
};


%extend TColStd_Array2OfBoolean {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TColStd_Array2OfCharacter;
class TColStd_Array2OfCharacter {
	public:
		%feature("compactdefaultargs") TColStd_Array2OfCharacter;
		%feature("autodoc", "	:param R1:
	:type R1: int
	:param R2:
	:type R2: int
	:param C1:
	:type C1: int
	:param C2:
	:type C2: int
	:rtype: None
") TColStd_Array2OfCharacter;
		 TColStd_Array2OfCharacter (const Standard_Integer R1,const Standard_Integer R2,const Standard_Integer C1,const Standard_Integer C2);
		%feature("compactdefaultargs") TColStd_Array2OfCharacter;
		%feature("autodoc", "	:param Item:
	:type Item: Standard_Character &
	:param R1:
	:type R1: int
	:param R2:
	:type R2: int
	:param C1:
	:type C1: int
	:param C2:
	:type C2: int
	:rtype: None
") TColStd_Array2OfCharacter;
		 TColStd_Array2OfCharacter (const Standard_Character & Item,const Standard_Integer R1,const Standard_Integer R2,const Standard_Integer C1,const Standard_Integer C2);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param V:
	:type V: Standard_Character &
	:rtype: None
") Init;
		void Init (const Standard_Character & V);
		%feature("compactdefaultargs") Destroy;
		%feature("autodoc", "	:rtype: None
") Destroy;
		void Destroy ();
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: TColStd_Array2OfCharacter &
	:rtype: TColStd_Array2OfCharacter
") Assign;
		const TColStd_Array2OfCharacter & Assign (const TColStd_Array2OfCharacter & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: TColStd_Array2OfCharacter &
	:rtype: TColStd_Array2OfCharacter
") operator =;
		const TColStd_Array2OfCharacter & operator = (const TColStd_Array2OfCharacter & Other);
		%feature("compactdefaultargs") ColLength;
		%feature("autodoc", "	:rtype: int
") ColLength;
		Standard_Integer ColLength ();
		%feature("compactdefaultargs") RowLength;
		%feature("autodoc", "	:rtype: int
") RowLength;
		Standard_Integer RowLength ();
		%feature("compactdefaultargs") LowerCol;
		%feature("autodoc", "	:rtype: int
") LowerCol;
		Standard_Integer LowerCol ();
		%feature("compactdefaultargs") LowerRow;
		%feature("autodoc", "	:rtype: int
") LowerRow;
		Standard_Integer LowerRow ();
		%feature("compactdefaultargs") UpperCol;
		%feature("autodoc", "	:rtype: int
") UpperCol;
		Standard_Integer UpperCol ();
		%feature("compactdefaultargs") UpperRow;
		%feature("autodoc", "	:rtype: int
") UpperRow;
		Standard_Integer UpperRow ();
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param Row:
	:type Row: int
	:param Col:
	:type Col: int
	:param Value:
	:type Value: Standard_Character &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Row,const Standard_Integer Col,const Standard_Character & Value);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Row:
	:type Row: int
	:param Col:
	:type Col: int
	:rtype: Standard_Character
") Value;
		const Standard_Character & Value (const Standard_Integer Row,const Standard_Integer Col);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Row:
	:type Row: int
	:param Col:
	:type Col: int
	:rtype: Standard_Character
") ChangeValue;
		Standard_Character & ChangeValue (const Standard_Integer Row,const Standard_Integer Col);
};


%extend TColStd_Array2OfCharacter {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TColStd_Array2OfInteger;
class TColStd_Array2OfInteger {
	public:
		%feature("compactdefaultargs") TColStd_Array2OfInteger;
		%feature("autodoc", "	:param R1:
	:type R1: int
	:param R2:
	:type R2: int
	:param C1:
	:type C1: int
	:param C2:
	:type C2: int
	:rtype: None
") TColStd_Array2OfInteger;
		 TColStd_Array2OfInteger (const Standard_Integer R1,const Standard_Integer R2,const Standard_Integer C1,const Standard_Integer C2);
		%feature("compactdefaultargs") TColStd_Array2OfInteger;
		%feature("autodoc", "	:param Item:
	:type Item: int &
	:param R1:
	:type R1: int
	:param R2:
	:type R2: int
	:param C1:
	:type C1: int
	:param C2:
	:type C2: int
	:rtype: None
") TColStd_Array2OfInteger;
		 TColStd_Array2OfInteger (const Standard_Integer & Item,const Standard_Integer R1,const Standard_Integer R2,const Standard_Integer C1,const Standard_Integer C2);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param V:
	:type V: int &
	:rtype: None
") Init;
		void Init (const Standard_Integer & V);
		%feature("compactdefaultargs") Destroy;
		%feature("autodoc", "	:rtype: None
") Destroy;
		void Destroy ();
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: TColStd_Array2OfInteger &
	:rtype: TColStd_Array2OfInteger
") Assign;
		const TColStd_Array2OfInteger & Assign (const TColStd_Array2OfInteger & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: TColStd_Array2OfInteger &
	:rtype: TColStd_Array2OfInteger
") operator =;
		const TColStd_Array2OfInteger & operator = (const TColStd_Array2OfInteger & Other);
		%feature("compactdefaultargs") ColLength;
		%feature("autodoc", "	:rtype: int
") ColLength;
		Standard_Integer ColLength ();
		%feature("compactdefaultargs") RowLength;
		%feature("autodoc", "	:rtype: int
") RowLength;
		Standard_Integer RowLength ();
		%feature("compactdefaultargs") LowerCol;
		%feature("autodoc", "	:rtype: int
") LowerCol;
		Standard_Integer LowerCol ();
		%feature("compactdefaultargs") LowerRow;
		%feature("autodoc", "	:rtype: int
") LowerRow;
		Standard_Integer LowerRow ();
		%feature("compactdefaultargs") UpperCol;
		%feature("autodoc", "	:rtype: int
") UpperCol;
		Standard_Integer UpperCol ();
		%feature("compactdefaultargs") UpperRow;
		%feature("autodoc", "	:rtype: int
") UpperRow;
		Standard_Integer UpperRow ();
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param Row:
	:type Row: int
	:param Col:
	:type Col: int
	:param Value:
	:type Value: int &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Row,const Standard_Integer Col,const Standard_Integer & Value);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Row:
	:type Row: int
	:param Col:
	:type Col: int
	:rtype: int
") Value;
		const Standard_Integer & Value (const Standard_Integer Row,const Standard_Integer Col);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Row:
	:type Row: int
	:param Col:
	:type Col: int
	:rtype: int
") ChangeValue;
		Standard_Integer & ChangeValue (const Standard_Integer Row,const Standard_Integer Col);
};


%extend TColStd_Array2OfInteger {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TColStd_Array2OfReal;
class TColStd_Array2OfReal {
	public:
		%feature("compactdefaultargs") TColStd_Array2OfReal;
		%feature("autodoc", "	:param R1:
	:type R1: int
	:param R2:
	:type R2: int
	:param C1:
	:type C1: int
	:param C2:
	:type C2: int
	:rtype: None
") TColStd_Array2OfReal;
		 TColStd_Array2OfReal (const Standard_Integer R1,const Standard_Integer R2,const Standard_Integer C1,const Standard_Integer C2);
		%feature("compactdefaultargs") TColStd_Array2OfReal;
		%feature("autodoc", "	:param Item:
	:type Item: float &
	:param R1:
	:type R1: int
	:param R2:
	:type R2: int
	:param C1:
	:type C1: int
	:param C2:
	:type C2: int
	:rtype: None
") TColStd_Array2OfReal;
		 TColStd_Array2OfReal (const Standard_Real & Item,const Standard_Integer R1,const Standard_Integer R2,const Standard_Integer C1,const Standard_Integer C2);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param V:
	:type V: float &
	:rtype: None
") Init;
		void Init (const Standard_Real & V);
		%feature("compactdefaultargs") Destroy;
		%feature("autodoc", "	:rtype: None
") Destroy;
		void Destroy ();
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: TColStd_Array2OfReal &
	:rtype: TColStd_Array2OfReal
") Assign;
		const TColStd_Array2OfReal & Assign (const TColStd_Array2OfReal & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: TColStd_Array2OfReal &
	:rtype: TColStd_Array2OfReal
") operator =;
		const TColStd_Array2OfReal & operator = (const TColStd_Array2OfReal & Other);
		%feature("compactdefaultargs") ColLength;
		%feature("autodoc", "	:rtype: int
") ColLength;
		Standard_Integer ColLength ();
		%feature("compactdefaultargs") RowLength;
		%feature("autodoc", "	:rtype: int
") RowLength;
		Standard_Integer RowLength ();
		%feature("compactdefaultargs") LowerCol;
		%feature("autodoc", "	:rtype: int
") LowerCol;
		Standard_Integer LowerCol ();
		%feature("compactdefaultargs") LowerRow;
		%feature("autodoc", "	:rtype: int
") LowerRow;
		Standard_Integer LowerRow ();
		%feature("compactdefaultargs") UpperCol;
		%feature("autodoc", "	:rtype: int
") UpperCol;
		Standard_Integer UpperCol ();
		%feature("compactdefaultargs") UpperRow;
		%feature("autodoc", "	:rtype: int
") UpperRow;
		Standard_Integer UpperRow ();
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param Row:
	:type Row: int
	:param Col:
	:type Col: int
	:param Value:
	:type Value: float &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Row,const Standard_Integer Col,const Standard_Real & Value);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Row:
	:type Row: int
	:param Col:
	:type Col: int
	:rtype: float
") Value;
		const Standard_Real & Value (const Standard_Integer Row,const Standard_Integer Col);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Row:
	:type Row: int
	:param Col:
	:type Col: int
	:rtype: float
") ChangeValue;
		Standard_Real & ChangeValue (const Standard_Integer Row,const Standard_Integer Col);
};


%extend TColStd_Array2OfReal {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TColStd_Array2OfTransient;
class TColStd_Array2OfTransient {
	public:
		%feature("compactdefaultargs") TColStd_Array2OfTransient;
		%feature("autodoc", "	:param R1:
	:type R1: int
	:param R2:
	:type R2: int
	:param C1:
	:type C1: int
	:param C2:
	:type C2: int
	:rtype: None
") TColStd_Array2OfTransient;
		 TColStd_Array2OfTransient (const Standard_Integer R1,const Standard_Integer R2,const Standard_Integer C1,const Standard_Integer C2);
		%feature("compactdefaultargs") TColStd_Array2OfTransient;
		%feature("autodoc", "	:param Item:
	:type Item: Handle_Standard_Transient &
	:param R1:
	:type R1: int
	:param R2:
	:type R2: int
	:param C1:
	:type C1: int
	:param C2:
	:type C2: int
	:rtype: None
") TColStd_Array2OfTransient;
		 TColStd_Array2OfTransient (const Handle_Standard_Transient & Item,const Standard_Integer R1,const Standard_Integer R2,const Standard_Integer C1,const Standard_Integer C2);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param V:
	:type V: Handle_Standard_Transient &
	:rtype: None
") Init;
		void Init (const Handle_Standard_Transient & V);
		%feature("compactdefaultargs") Destroy;
		%feature("autodoc", "	:rtype: None
") Destroy;
		void Destroy ();
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: TColStd_Array2OfTransient &
	:rtype: TColStd_Array2OfTransient
") Assign;
		const TColStd_Array2OfTransient & Assign (const TColStd_Array2OfTransient & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: TColStd_Array2OfTransient &
	:rtype: TColStd_Array2OfTransient
") operator =;
		const TColStd_Array2OfTransient & operator = (const TColStd_Array2OfTransient & Other);
		%feature("compactdefaultargs") ColLength;
		%feature("autodoc", "	:rtype: int
") ColLength;
		Standard_Integer ColLength ();
		%feature("compactdefaultargs") RowLength;
		%feature("autodoc", "	:rtype: int
") RowLength;
		Standard_Integer RowLength ();
		%feature("compactdefaultargs") LowerCol;
		%feature("autodoc", "	:rtype: int
") LowerCol;
		Standard_Integer LowerCol ();
		%feature("compactdefaultargs") LowerRow;
		%feature("autodoc", "	:rtype: int
") LowerRow;
		Standard_Integer LowerRow ();
		%feature("compactdefaultargs") UpperCol;
		%feature("autodoc", "	:rtype: int
") UpperCol;
		Standard_Integer UpperCol ();
		%feature("compactdefaultargs") UpperRow;
		%feature("autodoc", "	:rtype: int
") UpperRow;
		Standard_Integer UpperRow ();
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param Row:
	:type Row: int
	:param Col:
	:type Col: int
	:param Value:
	:type Value: Handle_Standard_Transient &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Row,const Standard_Integer Col,const Handle_Standard_Transient & Value);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Row:
	:type Row: int
	:param Col:
	:type Col: int
	:rtype: Handle_Standard_Transient
") Value;
		Handle_Standard_Transient Value (const Standard_Integer Row,const Standard_Integer Col);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Row:
	:type Row: int
	:param Col:
	:type Col: int
	:rtype: Handle_Standard_Transient
") ChangeValue;
		Handle_Standard_Transient ChangeValue (const Standard_Integer Row,const Standard_Integer Col);
};


%extend TColStd_Array2OfTransient {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TColStd_DataMapIteratorOfDataMapOfAsciiStringInteger;
class TColStd_DataMapIteratorOfDataMapOfAsciiStringInteger : public TCollection_BasicMapIterator {
	public:
		%feature("compactdefaultargs") TColStd_DataMapIteratorOfDataMapOfAsciiStringInteger;
		%feature("autodoc", "	:rtype: None
") TColStd_DataMapIteratorOfDataMapOfAsciiStringInteger;
		 TColStd_DataMapIteratorOfDataMapOfAsciiStringInteger ();
		%feature("compactdefaultargs") TColStd_DataMapIteratorOfDataMapOfAsciiStringInteger;
		%feature("autodoc", "	:param aMap:
	:type aMap: TColStd_DataMapOfAsciiStringInteger &
	:rtype: None
") TColStd_DataMapIteratorOfDataMapOfAsciiStringInteger;
		 TColStd_DataMapIteratorOfDataMapOfAsciiStringInteger (const TColStd_DataMapOfAsciiStringInteger & aMap);
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "	:param aMap:
	:type aMap: TColStd_DataMapOfAsciiStringInteger &
	:rtype: None
") Initialize;
		void Initialize (const TColStd_DataMapOfAsciiStringInteger & aMap);
		%feature("compactdefaultargs") Key;
		%feature("autodoc", "	:rtype: TCollection_AsciiString
") Key;
		const TCollection_AsciiString & Key ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: int
") Value;
		const Standard_Integer & Value ();
};


%extend TColStd_DataMapIteratorOfDataMapOfAsciiStringInteger {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TColStd_DataMapIteratorOfDataMapOfIntegerInteger;
class TColStd_DataMapIteratorOfDataMapOfIntegerInteger : public TCollection_BasicMapIterator {
	public:
		%feature("compactdefaultargs") TColStd_DataMapIteratorOfDataMapOfIntegerInteger;
		%feature("autodoc", "	:rtype: None
") TColStd_DataMapIteratorOfDataMapOfIntegerInteger;
		 TColStd_DataMapIteratorOfDataMapOfIntegerInteger ();
		%feature("compactdefaultargs") TColStd_DataMapIteratorOfDataMapOfIntegerInteger;
		%feature("autodoc", "	:param aMap:
	:type aMap: TColStd_DataMapOfIntegerInteger &
	:rtype: None
") TColStd_DataMapIteratorOfDataMapOfIntegerInteger;
		 TColStd_DataMapIteratorOfDataMapOfIntegerInteger (const TColStd_DataMapOfIntegerInteger & aMap);
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "	:param aMap:
	:type aMap: TColStd_DataMapOfIntegerInteger &
	:rtype: None
") Initialize;
		void Initialize (const TColStd_DataMapOfIntegerInteger & aMap);
		%feature("compactdefaultargs") Key;
		%feature("autodoc", "	:rtype: int
") Key;
		const Standard_Integer & Key ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: int
") Value;
		const Standard_Integer & Value ();
};


%extend TColStd_DataMapIteratorOfDataMapOfIntegerInteger {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TColStd_DataMapIteratorOfDataMapOfIntegerListOfInteger;
class TColStd_DataMapIteratorOfDataMapOfIntegerListOfInteger : public TCollection_BasicMapIterator {
	public:
		%feature("compactdefaultargs") TColStd_DataMapIteratorOfDataMapOfIntegerListOfInteger;
		%feature("autodoc", "	:rtype: None
") TColStd_DataMapIteratorOfDataMapOfIntegerListOfInteger;
		 TColStd_DataMapIteratorOfDataMapOfIntegerListOfInteger ();
		%feature("compactdefaultargs") TColStd_DataMapIteratorOfDataMapOfIntegerListOfInteger;
		%feature("autodoc", "	:param aMap:
	:type aMap: TColStd_DataMapOfIntegerListOfInteger &
	:rtype: None
") TColStd_DataMapIteratorOfDataMapOfIntegerListOfInteger;
		 TColStd_DataMapIteratorOfDataMapOfIntegerListOfInteger (const TColStd_DataMapOfIntegerListOfInteger & aMap);
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "	:param aMap:
	:type aMap: TColStd_DataMapOfIntegerListOfInteger &
	:rtype: None
") Initialize;
		void Initialize (const TColStd_DataMapOfIntegerListOfInteger & aMap);
		%feature("compactdefaultargs") Key;
		%feature("autodoc", "	:rtype: int
") Key;
		const Standard_Integer & Key ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: TColStd_ListOfInteger
") Value;
		const TColStd_ListOfInteger & Value ();
};


%extend TColStd_DataMapIteratorOfDataMapOfIntegerListOfInteger {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TColStd_DataMapIteratorOfDataMapOfIntegerReal;
class TColStd_DataMapIteratorOfDataMapOfIntegerReal : public TCollection_BasicMapIterator {
	public:
		%feature("compactdefaultargs") TColStd_DataMapIteratorOfDataMapOfIntegerReal;
		%feature("autodoc", "	:rtype: None
") TColStd_DataMapIteratorOfDataMapOfIntegerReal;
		 TColStd_DataMapIteratorOfDataMapOfIntegerReal ();
		%feature("compactdefaultargs") TColStd_DataMapIteratorOfDataMapOfIntegerReal;
		%feature("autodoc", "	:param aMap:
	:type aMap: TColStd_DataMapOfIntegerReal &
	:rtype: None
") TColStd_DataMapIteratorOfDataMapOfIntegerReal;
		 TColStd_DataMapIteratorOfDataMapOfIntegerReal (const TColStd_DataMapOfIntegerReal & aMap);
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "	:param aMap:
	:type aMap: TColStd_DataMapOfIntegerReal &
	:rtype: None
") Initialize;
		void Initialize (const TColStd_DataMapOfIntegerReal & aMap);
		%feature("compactdefaultargs") Key;
		%feature("autodoc", "	:rtype: int
") Key;
		const Standard_Integer & Key ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: float
") Value;
		const Standard_Real & Value ();
};


%extend TColStd_DataMapIteratorOfDataMapOfIntegerReal {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TColStd_DataMapIteratorOfDataMapOfIntegerTransient;
class TColStd_DataMapIteratorOfDataMapOfIntegerTransient : public TCollection_BasicMapIterator {
	public:
		%feature("compactdefaultargs") TColStd_DataMapIteratorOfDataMapOfIntegerTransient;
		%feature("autodoc", "	:rtype: None
") TColStd_DataMapIteratorOfDataMapOfIntegerTransient;
		 TColStd_DataMapIteratorOfDataMapOfIntegerTransient ();
		%feature("compactdefaultargs") TColStd_DataMapIteratorOfDataMapOfIntegerTransient;
		%feature("autodoc", "	:param aMap:
	:type aMap: TColStd_DataMapOfIntegerTransient &
	:rtype: None
") TColStd_DataMapIteratorOfDataMapOfIntegerTransient;
		 TColStd_DataMapIteratorOfDataMapOfIntegerTransient (const TColStd_DataMapOfIntegerTransient & aMap);
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "	:param aMap:
	:type aMap: TColStd_DataMapOfIntegerTransient &
	:rtype: None
") Initialize;
		void Initialize (const TColStd_DataMapOfIntegerTransient & aMap);
		%feature("compactdefaultargs") Key;
		%feature("autodoc", "	:rtype: int
") Key;
		const Standard_Integer & Key ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: Handle_Standard_Transient
") Value;
		Handle_Standard_Transient Value ();
};


%extend TColStd_DataMapIteratorOfDataMapOfIntegerTransient {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TColStd_DataMapIteratorOfDataMapOfStringInteger;
class TColStd_DataMapIteratorOfDataMapOfStringInteger : public TCollection_BasicMapIterator {
	public:
		%feature("compactdefaultargs") TColStd_DataMapIteratorOfDataMapOfStringInteger;
		%feature("autodoc", "	:rtype: None
") TColStd_DataMapIteratorOfDataMapOfStringInteger;
		 TColStd_DataMapIteratorOfDataMapOfStringInteger ();
		%feature("compactdefaultargs") TColStd_DataMapIteratorOfDataMapOfStringInteger;
		%feature("autodoc", "	:param aMap:
	:type aMap: TColStd_DataMapOfStringInteger &
	:rtype: None
") TColStd_DataMapIteratorOfDataMapOfStringInteger;
		 TColStd_DataMapIteratorOfDataMapOfStringInteger (const TColStd_DataMapOfStringInteger & aMap);
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "	:param aMap:
	:type aMap: TColStd_DataMapOfStringInteger &
	:rtype: None
") Initialize;
		void Initialize (const TColStd_DataMapOfStringInteger & aMap);
		%feature("compactdefaultargs") Key;
		%feature("autodoc", "	:rtype: TCollection_ExtendedString
") Key;
		const TCollection_ExtendedString & Key ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: int
") Value;
		const Standard_Integer & Value ();
};


%extend TColStd_DataMapIteratorOfDataMapOfStringInteger {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TColStd_DataMapIteratorOfDataMapOfTransientTransient;
class TColStd_DataMapIteratorOfDataMapOfTransientTransient : public TCollection_BasicMapIterator {
	public:
		%feature("compactdefaultargs") TColStd_DataMapIteratorOfDataMapOfTransientTransient;
		%feature("autodoc", "	:rtype: None
") TColStd_DataMapIteratorOfDataMapOfTransientTransient;
		 TColStd_DataMapIteratorOfDataMapOfTransientTransient ();
		%feature("compactdefaultargs") TColStd_DataMapIteratorOfDataMapOfTransientTransient;
		%feature("autodoc", "	:param aMap:
	:type aMap: TColStd_DataMapOfTransientTransient &
	:rtype: None
") TColStd_DataMapIteratorOfDataMapOfTransientTransient;
		 TColStd_DataMapIteratorOfDataMapOfTransientTransient (const TColStd_DataMapOfTransientTransient & aMap);
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "	:param aMap:
	:type aMap: TColStd_DataMapOfTransientTransient &
	:rtype: None
") Initialize;
		void Initialize (const TColStd_DataMapOfTransientTransient & aMap);
		%feature("compactdefaultargs") Key;
		%feature("autodoc", "	:rtype: Handle_Standard_Transient
") Key;
		Handle_Standard_Transient Key ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: Handle_Standard_Transient
") Value;
		Handle_Standard_Transient Value ();
};


%extend TColStd_DataMapIteratorOfDataMapOfTransientTransient {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TColStd_DataMapNodeOfDataMapOfAsciiStringInteger;
class TColStd_DataMapNodeOfDataMapOfAsciiStringInteger : public TCollection_MapNode {
	public:
		%feature("compactdefaultargs") TColStd_DataMapNodeOfDataMapOfAsciiStringInteger;
		%feature("autodoc", "	:param K:
	:type K: TCollection_AsciiString &
	:param I:
	:type I: int &
	:param n:
	:type n: TCollection_MapNodePtr &
	:rtype: None
") TColStd_DataMapNodeOfDataMapOfAsciiStringInteger;
		 TColStd_DataMapNodeOfDataMapOfAsciiStringInteger (const TCollection_AsciiString & K,const Standard_Integer & I,const TCollection_MapNodePtr & n);
		%feature("compactdefaultargs") Key;
		%feature("autodoc", "	:rtype: TCollection_AsciiString
") Key;
		TCollection_AsciiString & Key ();

            %feature("autodoc","1");
            %extend {
                Standard_Integer GetValue() {
                return (Standard_Integer) $self->Value();
                }
            };
            %feature("autodoc","1");
            %extend {
                void SetValue(Standard_Integer value ) {
                $self->Value()=value;
                }
            };
            };


%extend TColStd_DataMapNodeOfDataMapOfAsciiStringInteger {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_TColStd_DataMapNodeOfDataMapOfAsciiStringInteger(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_TColStd_DataMapNodeOfDataMapOfAsciiStringInteger::Handle_TColStd_DataMapNodeOfDataMapOfAsciiStringInteger %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_TColStd_DataMapNodeOfDataMapOfAsciiStringInteger;
class Handle_TColStd_DataMapNodeOfDataMapOfAsciiStringInteger : public Handle_TCollection_MapNode {

    public:
        // constructors
        Handle_TColStd_DataMapNodeOfDataMapOfAsciiStringInteger();
        Handle_TColStd_DataMapNodeOfDataMapOfAsciiStringInteger(const Handle_TColStd_DataMapNodeOfDataMapOfAsciiStringInteger &aHandle);
        Handle_TColStd_DataMapNodeOfDataMapOfAsciiStringInteger(const TColStd_DataMapNodeOfDataMapOfAsciiStringInteger *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_TColStd_DataMapNodeOfDataMapOfAsciiStringInteger DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_TColStd_DataMapNodeOfDataMapOfAsciiStringInteger {
    TColStd_DataMapNodeOfDataMapOfAsciiStringInteger* _get_reference() {
    return (TColStd_DataMapNodeOfDataMapOfAsciiStringInteger*)$self->Access();
    }
};

%extend Handle_TColStd_DataMapNodeOfDataMapOfAsciiStringInteger {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend TColStd_DataMapNodeOfDataMapOfAsciiStringInteger {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TColStd_DataMapNodeOfDataMapOfIntegerInteger;
class TColStd_DataMapNodeOfDataMapOfIntegerInteger : public TCollection_MapNode {
	public:
		%feature("compactdefaultargs") TColStd_DataMapNodeOfDataMapOfIntegerInteger;
		%feature("autodoc", "	:param K:
	:type K: int &
	:param I:
	:type I: int &
	:param n:
	:type n: TCollection_MapNodePtr &
	:rtype: None
") TColStd_DataMapNodeOfDataMapOfIntegerInteger;
		 TColStd_DataMapNodeOfDataMapOfIntegerInteger (const Standard_Integer & K,const Standard_Integer & I,const TCollection_MapNodePtr & n);

            %feature("autodoc","1");
            %extend {
                Standard_Integer GetKey() {
                return (Standard_Integer) $self->Key();
                }
            };
            %feature("autodoc","1");
            %extend {
                void SetKey(Standard_Integer value ) {
                $self->Key()=value;
                }
            };
            
            %feature("autodoc","1");
            %extend {
                Standard_Integer GetValue() {
                return (Standard_Integer) $self->Value();
                }
            };
            %feature("autodoc","1");
            %extend {
                void SetValue(Standard_Integer value ) {
                $self->Value()=value;
                }
            };
            };


%extend TColStd_DataMapNodeOfDataMapOfIntegerInteger {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_TColStd_DataMapNodeOfDataMapOfIntegerInteger(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_TColStd_DataMapNodeOfDataMapOfIntegerInteger::Handle_TColStd_DataMapNodeOfDataMapOfIntegerInteger %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_TColStd_DataMapNodeOfDataMapOfIntegerInteger;
class Handle_TColStd_DataMapNodeOfDataMapOfIntegerInteger : public Handle_TCollection_MapNode {

    public:
        // constructors
        Handle_TColStd_DataMapNodeOfDataMapOfIntegerInteger();
        Handle_TColStd_DataMapNodeOfDataMapOfIntegerInteger(const Handle_TColStd_DataMapNodeOfDataMapOfIntegerInteger &aHandle);
        Handle_TColStd_DataMapNodeOfDataMapOfIntegerInteger(const TColStd_DataMapNodeOfDataMapOfIntegerInteger *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_TColStd_DataMapNodeOfDataMapOfIntegerInteger DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_TColStd_DataMapNodeOfDataMapOfIntegerInteger {
    TColStd_DataMapNodeOfDataMapOfIntegerInteger* _get_reference() {
    return (TColStd_DataMapNodeOfDataMapOfIntegerInteger*)$self->Access();
    }
};

%extend Handle_TColStd_DataMapNodeOfDataMapOfIntegerInteger {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend TColStd_DataMapNodeOfDataMapOfIntegerInteger {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TColStd_DataMapNodeOfDataMapOfIntegerListOfInteger;
class TColStd_DataMapNodeOfDataMapOfIntegerListOfInteger : public TCollection_MapNode {
	public:
		%feature("compactdefaultargs") TColStd_DataMapNodeOfDataMapOfIntegerListOfInteger;
		%feature("autodoc", "	:param K:
	:type K: int &
	:param I:
	:type I: TColStd_ListOfInteger &
	:param n:
	:type n: TCollection_MapNodePtr &
	:rtype: None
") TColStd_DataMapNodeOfDataMapOfIntegerListOfInteger;
		 TColStd_DataMapNodeOfDataMapOfIntegerListOfInteger (const Standard_Integer & K,const TColStd_ListOfInteger & I,const TCollection_MapNodePtr & n);

            %feature("autodoc","1");
            %extend {
                Standard_Integer GetKey() {
                return (Standard_Integer) $self->Key();
                }
            };
            %feature("autodoc","1");
            %extend {
                void SetKey(Standard_Integer value ) {
                $self->Key()=value;
                }
            };
            		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: TColStd_ListOfInteger
") Value;
		TColStd_ListOfInteger & Value ();
};


%extend TColStd_DataMapNodeOfDataMapOfIntegerListOfInteger {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_TColStd_DataMapNodeOfDataMapOfIntegerListOfInteger(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_TColStd_DataMapNodeOfDataMapOfIntegerListOfInteger::Handle_TColStd_DataMapNodeOfDataMapOfIntegerListOfInteger %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_TColStd_DataMapNodeOfDataMapOfIntegerListOfInteger;
class Handle_TColStd_DataMapNodeOfDataMapOfIntegerListOfInteger : public Handle_TCollection_MapNode {

    public:
        // constructors
        Handle_TColStd_DataMapNodeOfDataMapOfIntegerListOfInteger();
        Handle_TColStd_DataMapNodeOfDataMapOfIntegerListOfInteger(const Handle_TColStd_DataMapNodeOfDataMapOfIntegerListOfInteger &aHandle);
        Handle_TColStd_DataMapNodeOfDataMapOfIntegerListOfInteger(const TColStd_DataMapNodeOfDataMapOfIntegerListOfInteger *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_TColStd_DataMapNodeOfDataMapOfIntegerListOfInteger DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_TColStd_DataMapNodeOfDataMapOfIntegerListOfInteger {
    TColStd_DataMapNodeOfDataMapOfIntegerListOfInteger* _get_reference() {
    return (TColStd_DataMapNodeOfDataMapOfIntegerListOfInteger*)$self->Access();
    }
};

%extend Handle_TColStd_DataMapNodeOfDataMapOfIntegerListOfInteger {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend TColStd_DataMapNodeOfDataMapOfIntegerListOfInteger {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TColStd_DataMapNodeOfDataMapOfIntegerReal;
class TColStd_DataMapNodeOfDataMapOfIntegerReal : public TCollection_MapNode {
	public:
		%feature("compactdefaultargs") TColStd_DataMapNodeOfDataMapOfIntegerReal;
		%feature("autodoc", "	:param K:
	:type K: int &
	:param I:
	:type I: float &
	:param n:
	:type n: TCollection_MapNodePtr &
	:rtype: None
") TColStd_DataMapNodeOfDataMapOfIntegerReal;
		 TColStd_DataMapNodeOfDataMapOfIntegerReal (const Standard_Integer & K,const Standard_Real & I,const TCollection_MapNodePtr & n);

            %feature("autodoc","1");
            %extend {
                Standard_Integer GetKey() {
                return (Standard_Integer) $self->Key();
                }
            };
            %feature("autodoc","1");
            %extend {
                void SetKey(Standard_Integer value ) {
                $self->Key()=value;
                }
            };
            
            %feature("autodoc","1");
            %extend {
                Standard_Real GetValue() {
                return (Standard_Real) $self->Value();
                }
            };
            %feature("autodoc","1");
            %extend {
                void SetValue(Standard_Real value ) {
                $self->Value()=value;
                }
            };
            };


%extend TColStd_DataMapNodeOfDataMapOfIntegerReal {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_TColStd_DataMapNodeOfDataMapOfIntegerReal(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_TColStd_DataMapNodeOfDataMapOfIntegerReal::Handle_TColStd_DataMapNodeOfDataMapOfIntegerReal %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_TColStd_DataMapNodeOfDataMapOfIntegerReal;
class Handle_TColStd_DataMapNodeOfDataMapOfIntegerReal : public Handle_TCollection_MapNode {

    public:
        // constructors
        Handle_TColStd_DataMapNodeOfDataMapOfIntegerReal();
        Handle_TColStd_DataMapNodeOfDataMapOfIntegerReal(const Handle_TColStd_DataMapNodeOfDataMapOfIntegerReal &aHandle);
        Handle_TColStd_DataMapNodeOfDataMapOfIntegerReal(const TColStd_DataMapNodeOfDataMapOfIntegerReal *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_TColStd_DataMapNodeOfDataMapOfIntegerReal DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_TColStd_DataMapNodeOfDataMapOfIntegerReal {
    TColStd_DataMapNodeOfDataMapOfIntegerReal* _get_reference() {
    return (TColStd_DataMapNodeOfDataMapOfIntegerReal*)$self->Access();
    }
};

%extend Handle_TColStd_DataMapNodeOfDataMapOfIntegerReal {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend TColStd_DataMapNodeOfDataMapOfIntegerReal {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TColStd_DataMapNodeOfDataMapOfIntegerTransient;
class TColStd_DataMapNodeOfDataMapOfIntegerTransient : public TCollection_MapNode {
	public:
		%feature("compactdefaultargs") TColStd_DataMapNodeOfDataMapOfIntegerTransient;
		%feature("autodoc", "	:param K:
	:type K: int &
	:param I:
	:type I: Handle_Standard_Transient &
	:param n:
	:type n: TCollection_MapNodePtr &
	:rtype: None
") TColStd_DataMapNodeOfDataMapOfIntegerTransient;
		 TColStd_DataMapNodeOfDataMapOfIntegerTransient (const Standard_Integer & K,const Handle_Standard_Transient & I,const TCollection_MapNodePtr & n);

            %feature("autodoc","1");
            %extend {
                Standard_Integer GetKey() {
                return (Standard_Integer) $self->Key();
                }
            };
            %feature("autodoc","1");
            %extend {
                void SetKey(Standard_Integer value ) {
                $self->Key()=value;
                }
            };
            		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: Handle_Standard_Transient
") Value;
		Handle_Standard_Transient Value ();
};


%extend TColStd_DataMapNodeOfDataMapOfIntegerTransient {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_TColStd_DataMapNodeOfDataMapOfIntegerTransient(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_TColStd_DataMapNodeOfDataMapOfIntegerTransient::Handle_TColStd_DataMapNodeOfDataMapOfIntegerTransient %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_TColStd_DataMapNodeOfDataMapOfIntegerTransient;
class Handle_TColStd_DataMapNodeOfDataMapOfIntegerTransient : public Handle_TCollection_MapNode {

    public:
        // constructors
        Handle_TColStd_DataMapNodeOfDataMapOfIntegerTransient();
        Handle_TColStd_DataMapNodeOfDataMapOfIntegerTransient(const Handle_TColStd_DataMapNodeOfDataMapOfIntegerTransient &aHandle);
        Handle_TColStd_DataMapNodeOfDataMapOfIntegerTransient(const TColStd_DataMapNodeOfDataMapOfIntegerTransient *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_TColStd_DataMapNodeOfDataMapOfIntegerTransient DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_TColStd_DataMapNodeOfDataMapOfIntegerTransient {
    TColStd_DataMapNodeOfDataMapOfIntegerTransient* _get_reference() {
    return (TColStd_DataMapNodeOfDataMapOfIntegerTransient*)$self->Access();
    }
};

%extend Handle_TColStd_DataMapNodeOfDataMapOfIntegerTransient {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend TColStd_DataMapNodeOfDataMapOfIntegerTransient {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TColStd_DataMapNodeOfDataMapOfStringInteger;
class TColStd_DataMapNodeOfDataMapOfStringInteger : public TCollection_MapNode {
	public:
		%feature("compactdefaultargs") TColStd_DataMapNodeOfDataMapOfStringInteger;
		%feature("autodoc", "	:param K:
	:type K: TCollection_ExtendedString &
	:param I:
	:type I: int &
	:param n:
	:type n: TCollection_MapNodePtr &
	:rtype: None
") TColStd_DataMapNodeOfDataMapOfStringInteger;
		 TColStd_DataMapNodeOfDataMapOfStringInteger (const TCollection_ExtendedString & K,const Standard_Integer & I,const TCollection_MapNodePtr & n);
		%feature("compactdefaultargs") Key;
		%feature("autodoc", "	:rtype: TCollection_ExtendedString
") Key;
		TCollection_ExtendedString & Key ();

            %feature("autodoc","1");
            %extend {
                Standard_Integer GetValue() {
                return (Standard_Integer) $self->Value();
                }
            };
            %feature("autodoc","1");
            %extend {
                void SetValue(Standard_Integer value ) {
                $self->Value()=value;
                }
            };
            };


%extend TColStd_DataMapNodeOfDataMapOfStringInteger {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_TColStd_DataMapNodeOfDataMapOfStringInteger(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_TColStd_DataMapNodeOfDataMapOfStringInteger::Handle_TColStd_DataMapNodeOfDataMapOfStringInteger %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_TColStd_DataMapNodeOfDataMapOfStringInteger;
class Handle_TColStd_DataMapNodeOfDataMapOfStringInteger : public Handle_TCollection_MapNode {

    public:
        // constructors
        Handle_TColStd_DataMapNodeOfDataMapOfStringInteger();
        Handle_TColStd_DataMapNodeOfDataMapOfStringInteger(const Handle_TColStd_DataMapNodeOfDataMapOfStringInteger &aHandle);
        Handle_TColStd_DataMapNodeOfDataMapOfStringInteger(const TColStd_DataMapNodeOfDataMapOfStringInteger *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_TColStd_DataMapNodeOfDataMapOfStringInteger DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_TColStd_DataMapNodeOfDataMapOfStringInteger {
    TColStd_DataMapNodeOfDataMapOfStringInteger* _get_reference() {
    return (TColStd_DataMapNodeOfDataMapOfStringInteger*)$self->Access();
    }
};

%extend Handle_TColStd_DataMapNodeOfDataMapOfStringInteger {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend TColStd_DataMapNodeOfDataMapOfStringInteger {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TColStd_DataMapNodeOfDataMapOfTransientTransient;
class TColStd_DataMapNodeOfDataMapOfTransientTransient : public TCollection_MapNode {
	public:
		%feature("compactdefaultargs") TColStd_DataMapNodeOfDataMapOfTransientTransient;
		%feature("autodoc", "	:param K:
	:type K: Handle_Standard_Transient &
	:param I:
	:type I: Handle_Standard_Transient &
	:param n:
	:type n: TCollection_MapNodePtr &
	:rtype: None
") TColStd_DataMapNodeOfDataMapOfTransientTransient;
		 TColStd_DataMapNodeOfDataMapOfTransientTransient (const Handle_Standard_Transient & K,const Handle_Standard_Transient & I,const TCollection_MapNodePtr & n);
		%feature("compactdefaultargs") Key;
		%feature("autodoc", "	:rtype: Handle_Standard_Transient
") Key;
		Handle_Standard_Transient Key ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: Handle_Standard_Transient
") Value;
		Handle_Standard_Transient Value ();
};


%extend TColStd_DataMapNodeOfDataMapOfTransientTransient {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_TColStd_DataMapNodeOfDataMapOfTransientTransient(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_TColStd_DataMapNodeOfDataMapOfTransientTransient::Handle_TColStd_DataMapNodeOfDataMapOfTransientTransient %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_TColStd_DataMapNodeOfDataMapOfTransientTransient;
class Handle_TColStd_DataMapNodeOfDataMapOfTransientTransient : public Handle_TCollection_MapNode {

    public:
        // constructors
        Handle_TColStd_DataMapNodeOfDataMapOfTransientTransient();
        Handle_TColStd_DataMapNodeOfDataMapOfTransientTransient(const Handle_TColStd_DataMapNodeOfDataMapOfTransientTransient &aHandle);
        Handle_TColStd_DataMapNodeOfDataMapOfTransientTransient(const TColStd_DataMapNodeOfDataMapOfTransientTransient *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_TColStd_DataMapNodeOfDataMapOfTransientTransient DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_TColStd_DataMapNodeOfDataMapOfTransientTransient {
    TColStd_DataMapNodeOfDataMapOfTransientTransient* _get_reference() {
    return (TColStd_DataMapNodeOfDataMapOfTransientTransient*)$self->Access();
    }
};

%extend Handle_TColStd_DataMapNodeOfDataMapOfTransientTransient {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend TColStd_DataMapNodeOfDataMapOfTransientTransient {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TColStd_DataMapOfAsciiStringInteger;
class TColStd_DataMapOfAsciiStringInteger : public TCollection_BasicMap {
	public:
		%feature("compactdefaultargs") TColStd_DataMapOfAsciiStringInteger;
		%feature("autodoc", "	:param NbBuckets: default value is 1
	:type NbBuckets: int
	:rtype: None
") TColStd_DataMapOfAsciiStringInteger;
		 TColStd_DataMapOfAsciiStringInteger (const Standard_Integer NbBuckets = 1);
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: TColStd_DataMapOfAsciiStringInteger &
	:rtype: TColStd_DataMapOfAsciiStringInteger
") Assign;
		TColStd_DataMapOfAsciiStringInteger & Assign (const TColStd_DataMapOfAsciiStringInteger & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: TColStd_DataMapOfAsciiStringInteger &
	:rtype: TColStd_DataMapOfAsciiStringInteger
") operator =;
		TColStd_DataMapOfAsciiStringInteger & operator = (const TColStd_DataMapOfAsciiStringInteger & Other);
		%feature("compactdefaultargs") ReSize;
		%feature("autodoc", "	:param NbBuckets:
	:type NbBuckets: int
	:rtype: None
") ReSize;
		void ReSize (const Standard_Integer NbBuckets);
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") Bind;
		%feature("autodoc", "	:param K:
	:type K: TCollection_AsciiString &
	:param I:
	:type I: int &
	:rtype: bool
") Bind;
		Standard_Boolean Bind (const TCollection_AsciiString & K,const Standard_Integer & I);
		%feature("compactdefaultargs") IsBound;
		%feature("autodoc", "	:param K:
	:type K: TCollection_AsciiString &
	:rtype: bool
") IsBound;
		Standard_Boolean IsBound (const TCollection_AsciiString & K);
		%feature("compactdefaultargs") UnBind;
		%feature("autodoc", "	:param K:
	:type K: TCollection_AsciiString &
	:rtype: bool
") UnBind;
		Standard_Boolean UnBind (const TCollection_AsciiString & K);
		%feature("compactdefaultargs") Find;
		%feature("autodoc", "	:param K:
	:type K: TCollection_AsciiString &
	:rtype: int
") Find;
		const Standard_Integer & Find (const TCollection_AsciiString & K);
		%feature("compactdefaultargs") ChangeFind;
		%feature("autodoc", "	:param K:
	:type K: TCollection_AsciiString &
	:rtype: int
") ChangeFind;
		Standard_Integer & ChangeFind (const TCollection_AsciiString & K);
		%feature("compactdefaultargs") Find1;
		%feature("autodoc", "	:param K:
	:type K: TCollection_AsciiString &
	:rtype: Standard_Address
") Find1;
		Standard_Address Find1 (const TCollection_AsciiString & K);
		%feature("compactdefaultargs") ChangeFind1;
		%feature("autodoc", "	:param K:
	:type K: TCollection_AsciiString &
	:rtype: Standard_Address
") ChangeFind1;
		Standard_Address ChangeFind1 (const TCollection_AsciiString & K);
};


%extend TColStd_DataMapOfAsciiStringInteger {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TColStd_DataMapOfIntegerInteger;
class TColStd_DataMapOfIntegerInteger : public TCollection_BasicMap {
	public:
		%feature("compactdefaultargs") TColStd_DataMapOfIntegerInteger;
		%feature("autodoc", "	:param NbBuckets: default value is 1
	:type NbBuckets: int
	:rtype: None
") TColStd_DataMapOfIntegerInteger;
		 TColStd_DataMapOfIntegerInteger (const Standard_Integer NbBuckets = 1);
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: TColStd_DataMapOfIntegerInteger &
	:rtype: TColStd_DataMapOfIntegerInteger
") Assign;
		TColStd_DataMapOfIntegerInteger & Assign (const TColStd_DataMapOfIntegerInteger & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: TColStd_DataMapOfIntegerInteger &
	:rtype: TColStd_DataMapOfIntegerInteger
") operator =;
		TColStd_DataMapOfIntegerInteger & operator = (const TColStd_DataMapOfIntegerInteger & Other);
		%feature("compactdefaultargs") ReSize;
		%feature("autodoc", "	:param NbBuckets:
	:type NbBuckets: int
	:rtype: None
") ReSize;
		void ReSize (const Standard_Integer NbBuckets);
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") Bind;
		%feature("autodoc", "	:param K:
	:type K: int &
	:param I:
	:type I: int &
	:rtype: bool
") Bind;
		Standard_Boolean Bind (const Standard_Integer & K,const Standard_Integer & I);
		%feature("compactdefaultargs") IsBound;
		%feature("autodoc", "	:param K:
	:type K: int &
	:rtype: bool
") IsBound;
		Standard_Boolean IsBound (const Standard_Integer & K);
		%feature("compactdefaultargs") UnBind;
		%feature("autodoc", "	:param K:
	:type K: int &
	:rtype: bool
") UnBind;
		Standard_Boolean UnBind (const Standard_Integer & K);
		%feature("compactdefaultargs") Find;
		%feature("autodoc", "	:param K:
	:type K: int &
	:rtype: int
") Find;
		const Standard_Integer & Find (const Standard_Integer & K);
		%feature("compactdefaultargs") ChangeFind;
		%feature("autodoc", "	:param K:
	:type K: int &
	:rtype: int
") ChangeFind;
		Standard_Integer & ChangeFind (const Standard_Integer & K);
		%feature("compactdefaultargs") Find1;
		%feature("autodoc", "	:param K:
	:type K: int &
	:rtype: Standard_Address
") Find1;
		Standard_Address Find1 (const Standard_Integer & K);
		%feature("compactdefaultargs") ChangeFind1;
		%feature("autodoc", "	:param K:
	:type K: int &
	:rtype: Standard_Address
") ChangeFind1;
		Standard_Address ChangeFind1 (const Standard_Integer & K);
};


%extend TColStd_DataMapOfIntegerInteger {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TColStd_DataMapOfIntegerListOfInteger;
class TColStd_DataMapOfIntegerListOfInteger : public TCollection_BasicMap {
	public:
		%feature("compactdefaultargs") TColStd_DataMapOfIntegerListOfInteger;
		%feature("autodoc", "	:param NbBuckets: default value is 1
	:type NbBuckets: int
	:rtype: None
") TColStd_DataMapOfIntegerListOfInteger;
		 TColStd_DataMapOfIntegerListOfInteger (const Standard_Integer NbBuckets = 1);
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: TColStd_DataMapOfIntegerListOfInteger &
	:rtype: TColStd_DataMapOfIntegerListOfInteger
") Assign;
		TColStd_DataMapOfIntegerListOfInteger & Assign (const TColStd_DataMapOfIntegerListOfInteger & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: TColStd_DataMapOfIntegerListOfInteger &
	:rtype: TColStd_DataMapOfIntegerListOfInteger
") operator =;
		TColStd_DataMapOfIntegerListOfInteger & operator = (const TColStd_DataMapOfIntegerListOfInteger & Other);
		%feature("compactdefaultargs") ReSize;
		%feature("autodoc", "	:param NbBuckets:
	:type NbBuckets: int
	:rtype: None
") ReSize;
		void ReSize (const Standard_Integer NbBuckets);
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") Bind;
		%feature("autodoc", "	:param K:
	:type K: int &
	:param I:
	:type I: TColStd_ListOfInteger &
	:rtype: bool
") Bind;
		Standard_Boolean Bind (const Standard_Integer & K,const TColStd_ListOfInteger & I);
		%feature("compactdefaultargs") IsBound;
		%feature("autodoc", "	:param K:
	:type K: int &
	:rtype: bool
") IsBound;
		Standard_Boolean IsBound (const Standard_Integer & K);
		%feature("compactdefaultargs") UnBind;
		%feature("autodoc", "	:param K:
	:type K: int &
	:rtype: bool
") UnBind;
		Standard_Boolean UnBind (const Standard_Integer & K);
		%feature("compactdefaultargs") Find;
		%feature("autodoc", "	:param K:
	:type K: int &
	:rtype: TColStd_ListOfInteger
") Find;
		const TColStd_ListOfInteger & Find (const Standard_Integer & K);
		%feature("compactdefaultargs") ChangeFind;
		%feature("autodoc", "	:param K:
	:type K: int &
	:rtype: TColStd_ListOfInteger
") ChangeFind;
		TColStd_ListOfInteger & ChangeFind (const Standard_Integer & K);
		%feature("compactdefaultargs") Find1;
		%feature("autodoc", "	:param K:
	:type K: int &
	:rtype: Standard_Address
") Find1;
		Standard_Address Find1 (const Standard_Integer & K);
		%feature("compactdefaultargs") ChangeFind1;
		%feature("autodoc", "	:param K:
	:type K: int &
	:rtype: Standard_Address
") ChangeFind1;
		Standard_Address ChangeFind1 (const Standard_Integer & K);
};


%extend TColStd_DataMapOfIntegerListOfInteger {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TColStd_DataMapOfIntegerReal;
class TColStd_DataMapOfIntegerReal : public TCollection_BasicMap {
	public:
		%feature("compactdefaultargs") TColStd_DataMapOfIntegerReal;
		%feature("autodoc", "	:param NbBuckets: default value is 1
	:type NbBuckets: int
	:rtype: None
") TColStd_DataMapOfIntegerReal;
		 TColStd_DataMapOfIntegerReal (const Standard_Integer NbBuckets = 1);
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: TColStd_DataMapOfIntegerReal &
	:rtype: TColStd_DataMapOfIntegerReal
") Assign;
		TColStd_DataMapOfIntegerReal & Assign (const TColStd_DataMapOfIntegerReal & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: TColStd_DataMapOfIntegerReal &
	:rtype: TColStd_DataMapOfIntegerReal
") operator =;
		TColStd_DataMapOfIntegerReal & operator = (const TColStd_DataMapOfIntegerReal & Other);
		%feature("compactdefaultargs") ReSize;
		%feature("autodoc", "	:param NbBuckets:
	:type NbBuckets: int
	:rtype: None
") ReSize;
		void ReSize (const Standard_Integer NbBuckets);
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") Bind;
		%feature("autodoc", "	:param K:
	:type K: int &
	:param I:
	:type I: float &
	:rtype: bool
") Bind;
		Standard_Boolean Bind (const Standard_Integer & K,const Standard_Real & I);
		%feature("compactdefaultargs") IsBound;
		%feature("autodoc", "	:param K:
	:type K: int &
	:rtype: bool
") IsBound;
		Standard_Boolean IsBound (const Standard_Integer & K);
		%feature("compactdefaultargs") UnBind;
		%feature("autodoc", "	:param K:
	:type K: int &
	:rtype: bool
") UnBind;
		Standard_Boolean UnBind (const Standard_Integer & K);
		%feature("compactdefaultargs") Find;
		%feature("autodoc", "	:param K:
	:type K: int &
	:rtype: float
") Find;
		const Standard_Real & Find (const Standard_Integer & K);
		%feature("compactdefaultargs") ChangeFind;
		%feature("autodoc", "	:param K:
	:type K: int &
	:rtype: float
") ChangeFind;
		Standard_Real & ChangeFind (const Standard_Integer & K);
		%feature("compactdefaultargs") Find1;
		%feature("autodoc", "	:param K:
	:type K: int &
	:rtype: Standard_Address
") Find1;
		Standard_Address Find1 (const Standard_Integer & K);
		%feature("compactdefaultargs") ChangeFind1;
		%feature("autodoc", "	:param K:
	:type K: int &
	:rtype: Standard_Address
") ChangeFind1;
		Standard_Address ChangeFind1 (const Standard_Integer & K);
};


%extend TColStd_DataMapOfIntegerReal {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TColStd_DataMapOfIntegerTransient;
class TColStd_DataMapOfIntegerTransient : public TCollection_BasicMap {
	public:
		%feature("compactdefaultargs") TColStd_DataMapOfIntegerTransient;
		%feature("autodoc", "	:param NbBuckets: default value is 1
	:type NbBuckets: int
	:rtype: None
") TColStd_DataMapOfIntegerTransient;
		 TColStd_DataMapOfIntegerTransient (const Standard_Integer NbBuckets = 1);
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: TColStd_DataMapOfIntegerTransient &
	:rtype: TColStd_DataMapOfIntegerTransient
") Assign;
		TColStd_DataMapOfIntegerTransient & Assign (const TColStd_DataMapOfIntegerTransient & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: TColStd_DataMapOfIntegerTransient &
	:rtype: TColStd_DataMapOfIntegerTransient
") operator =;
		TColStd_DataMapOfIntegerTransient & operator = (const TColStd_DataMapOfIntegerTransient & Other);
		%feature("compactdefaultargs") ReSize;
		%feature("autodoc", "	:param NbBuckets:
	:type NbBuckets: int
	:rtype: None
") ReSize;
		void ReSize (const Standard_Integer NbBuckets);
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") Bind;
		%feature("autodoc", "	:param K:
	:type K: int &
	:param I:
	:type I: Handle_Standard_Transient &
	:rtype: bool
") Bind;
		Standard_Boolean Bind (const Standard_Integer & K,const Handle_Standard_Transient & I);
		%feature("compactdefaultargs") IsBound;
		%feature("autodoc", "	:param K:
	:type K: int &
	:rtype: bool
") IsBound;
		Standard_Boolean IsBound (const Standard_Integer & K);
		%feature("compactdefaultargs") UnBind;
		%feature("autodoc", "	:param K:
	:type K: int &
	:rtype: bool
") UnBind;
		Standard_Boolean UnBind (const Standard_Integer & K);
		%feature("compactdefaultargs") Find;
		%feature("autodoc", "	:param K:
	:type K: int &
	:rtype: Handle_Standard_Transient
") Find;
		Handle_Standard_Transient Find (const Standard_Integer & K);
		%feature("compactdefaultargs") ChangeFind;
		%feature("autodoc", "	:param K:
	:type K: int &
	:rtype: Handle_Standard_Transient
") ChangeFind;
		Handle_Standard_Transient ChangeFind (const Standard_Integer & K);
		%feature("compactdefaultargs") Find1;
		%feature("autodoc", "	:param K:
	:type K: int &
	:rtype: Standard_Address
") Find1;
		Standard_Address Find1 (const Standard_Integer & K);
		%feature("compactdefaultargs") ChangeFind1;
		%feature("autodoc", "	:param K:
	:type K: int &
	:rtype: Standard_Address
") ChangeFind1;
		Standard_Address ChangeFind1 (const Standard_Integer & K);
};


%extend TColStd_DataMapOfIntegerTransient {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TColStd_DataMapOfStringInteger;
class TColStd_DataMapOfStringInteger : public TCollection_BasicMap {
	public:
		%feature("compactdefaultargs") TColStd_DataMapOfStringInteger;
		%feature("autodoc", "	:param NbBuckets: default value is 1
	:type NbBuckets: int
	:rtype: None
") TColStd_DataMapOfStringInteger;
		 TColStd_DataMapOfStringInteger (const Standard_Integer NbBuckets = 1);
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: TColStd_DataMapOfStringInteger &
	:rtype: TColStd_DataMapOfStringInteger
") Assign;
		TColStd_DataMapOfStringInteger & Assign (const TColStd_DataMapOfStringInteger & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: TColStd_DataMapOfStringInteger &
	:rtype: TColStd_DataMapOfStringInteger
") operator =;
		TColStd_DataMapOfStringInteger & operator = (const TColStd_DataMapOfStringInteger & Other);
		%feature("compactdefaultargs") ReSize;
		%feature("autodoc", "	:param NbBuckets:
	:type NbBuckets: int
	:rtype: None
") ReSize;
		void ReSize (const Standard_Integer NbBuckets);
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") Bind;
		%feature("autodoc", "	:param K:
	:type K: TCollection_ExtendedString &
	:param I:
	:type I: int &
	:rtype: bool
") Bind;
		Standard_Boolean Bind (const TCollection_ExtendedString & K,const Standard_Integer & I);
		%feature("compactdefaultargs") IsBound;
		%feature("autodoc", "	:param K:
	:type K: TCollection_ExtendedString &
	:rtype: bool
") IsBound;
		Standard_Boolean IsBound (const TCollection_ExtendedString & K);
		%feature("compactdefaultargs") UnBind;
		%feature("autodoc", "	:param K:
	:type K: TCollection_ExtendedString &
	:rtype: bool
") UnBind;
		Standard_Boolean UnBind (const TCollection_ExtendedString & K);
		%feature("compactdefaultargs") Find;
		%feature("autodoc", "	:param K:
	:type K: TCollection_ExtendedString &
	:rtype: int
") Find;
		const Standard_Integer & Find (const TCollection_ExtendedString & K);
		%feature("compactdefaultargs") ChangeFind;
		%feature("autodoc", "	:param K:
	:type K: TCollection_ExtendedString &
	:rtype: int
") ChangeFind;
		Standard_Integer & ChangeFind (const TCollection_ExtendedString & K);
		%feature("compactdefaultargs") Find1;
		%feature("autodoc", "	:param K:
	:type K: TCollection_ExtendedString &
	:rtype: Standard_Address
") Find1;
		Standard_Address Find1 (const TCollection_ExtendedString & K);
		%feature("compactdefaultargs") ChangeFind1;
		%feature("autodoc", "	:param K:
	:type K: TCollection_ExtendedString &
	:rtype: Standard_Address
") ChangeFind1;
		Standard_Address ChangeFind1 (const TCollection_ExtendedString & K);
};


%extend TColStd_DataMapOfStringInteger {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TColStd_DataMapOfTransientTransient;
class TColStd_DataMapOfTransientTransient : public TCollection_BasicMap {
	public:
		%feature("compactdefaultargs") TColStd_DataMapOfTransientTransient;
		%feature("autodoc", "	:param NbBuckets: default value is 1
	:type NbBuckets: int
	:rtype: None
") TColStd_DataMapOfTransientTransient;
		 TColStd_DataMapOfTransientTransient (const Standard_Integer NbBuckets = 1);
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: TColStd_DataMapOfTransientTransient &
	:rtype: TColStd_DataMapOfTransientTransient
") Assign;
		TColStd_DataMapOfTransientTransient & Assign (const TColStd_DataMapOfTransientTransient & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: TColStd_DataMapOfTransientTransient &
	:rtype: TColStd_DataMapOfTransientTransient
") operator =;
		TColStd_DataMapOfTransientTransient & operator = (const TColStd_DataMapOfTransientTransient & Other);
		%feature("compactdefaultargs") ReSize;
		%feature("autodoc", "	:param NbBuckets:
	:type NbBuckets: int
	:rtype: None
") ReSize;
		void ReSize (const Standard_Integer NbBuckets);
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") Bind;
		%feature("autodoc", "	:param K:
	:type K: Handle_Standard_Transient &
	:param I:
	:type I: Handle_Standard_Transient &
	:rtype: bool
") Bind;
		Standard_Boolean Bind (const Handle_Standard_Transient & K,const Handle_Standard_Transient & I);
		%feature("compactdefaultargs") IsBound;
		%feature("autodoc", "	:param K:
	:type K: Handle_Standard_Transient &
	:rtype: bool
") IsBound;
		Standard_Boolean IsBound (const Handle_Standard_Transient & K);
		%feature("compactdefaultargs") UnBind;
		%feature("autodoc", "	:param K:
	:type K: Handle_Standard_Transient &
	:rtype: bool
") UnBind;
		Standard_Boolean UnBind (const Handle_Standard_Transient & K);
		%feature("compactdefaultargs") Find;
		%feature("autodoc", "	:param K:
	:type K: Handle_Standard_Transient &
	:rtype: Handle_Standard_Transient
") Find;
		Handle_Standard_Transient Find (const Handle_Standard_Transient & K);
		%feature("compactdefaultargs") ChangeFind;
		%feature("autodoc", "	:param K:
	:type K: Handle_Standard_Transient &
	:rtype: Handle_Standard_Transient
") ChangeFind;
		Handle_Standard_Transient ChangeFind (const Handle_Standard_Transient & K);
		%feature("compactdefaultargs") Find1;
		%feature("autodoc", "	:param K:
	:type K: Handle_Standard_Transient &
	:rtype: Standard_Address
") Find1;
		Standard_Address Find1 (const Handle_Standard_Transient & K);
		%feature("compactdefaultargs") ChangeFind1;
		%feature("autodoc", "	:param K:
	:type K: Handle_Standard_Transient &
	:rtype: Standard_Address
") ChangeFind1;
		Standard_Address ChangeFind1 (const Handle_Standard_Transient & K);
};


%extend TColStd_DataMapOfTransientTransient {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TColStd_HArray1OfAsciiString;
class TColStd_HArray1OfAsciiString : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") TColStd_HArray1OfAsciiString;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") TColStd_HArray1OfAsciiString;
		 TColStd_HArray1OfAsciiString (const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") TColStd_HArray1OfAsciiString;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:param V:
	:type V: TCollection_AsciiString &
	:rtype: None
") TColStd_HArray1OfAsciiString;
		 TColStd_HArray1OfAsciiString (const Standard_Integer Low,const Standard_Integer Up,const TCollection_AsciiString & V);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param V:
	:type V: TCollection_AsciiString &
	:rtype: None
") Init;
		void Init (const TCollection_AsciiString & V);
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "	:rtype: int
") Length;
		Standard_Integer Length ();
		%feature("compactdefaultargs") Lower;
		%feature("autodoc", "	:rtype: int
") Lower;
		Standard_Integer Lower ();
		%feature("compactdefaultargs") Upper;
		%feature("autodoc", "	:rtype: int
") Upper;
		Standard_Integer Upper ();
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param Value:
	:type Value: TCollection_AsciiString &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const TCollection_AsciiString & Value);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: TCollection_AsciiString
") Value;
		const TCollection_AsciiString & Value (const Standard_Integer Index);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: TCollection_AsciiString
") ChangeValue;
		TCollection_AsciiString & ChangeValue (const Standard_Integer Index);
		%feature("compactdefaultargs") Array1;
		%feature("autodoc", "	:rtype: TColStd_Array1OfAsciiString
") Array1;
		const TColStd_Array1OfAsciiString & Array1 ();
		%feature("compactdefaultargs") ChangeArray1;
		%feature("autodoc", "	:rtype: TColStd_Array1OfAsciiString
") ChangeArray1;
		TColStd_Array1OfAsciiString & ChangeArray1 ();
};


%extend TColStd_HArray1OfAsciiString {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_TColStd_HArray1OfAsciiString(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_TColStd_HArray1OfAsciiString::Handle_TColStd_HArray1OfAsciiString %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_TColStd_HArray1OfAsciiString;
class Handle_TColStd_HArray1OfAsciiString : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_TColStd_HArray1OfAsciiString();
        Handle_TColStd_HArray1OfAsciiString(const Handle_TColStd_HArray1OfAsciiString &aHandle);
        Handle_TColStd_HArray1OfAsciiString(const TColStd_HArray1OfAsciiString *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_TColStd_HArray1OfAsciiString DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_TColStd_HArray1OfAsciiString {
    TColStd_HArray1OfAsciiString* _get_reference() {
    return (TColStd_HArray1OfAsciiString*)$self->Access();
    }
};

%extend Handle_TColStd_HArray1OfAsciiString {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend TColStd_HArray1OfAsciiString {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TColStd_HArray1OfBoolean;
class TColStd_HArray1OfBoolean : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") TColStd_HArray1OfBoolean;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") TColStd_HArray1OfBoolean;
		 TColStd_HArray1OfBoolean (const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") TColStd_HArray1OfBoolean;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:param V:
	:type V: bool
	:rtype: None
") TColStd_HArray1OfBoolean;
		 TColStd_HArray1OfBoolean (const Standard_Integer Low,const Standard_Integer Up,const Standard_Boolean & V);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param V:
	:type V: bool
	:rtype: None
") Init;
		void Init (const Standard_Boolean & V);
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "	:rtype: int
") Length;
		Standard_Integer Length ();
		%feature("compactdefaultargs") Lower;
		%feature("autodoc", "	:rtype: int
") Lower;
		Standard_Integer Lower ();
		%feature("compactdefaultargs") Upper;
		%feature("autodoc", "	:rtype: int
") Upper;
		Standard_Integer Upper ();
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param Value:
	:type Value: bool
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const Standard_Boolean & Value);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: bool
") Value;
		const Standard_Boolean & Value (const Standard_Integer Index);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: bool
") ChangeValue;
		Standard_Boolean & ChangeValue (const Standard_Integer Index);
		%feature("compactdefaultargs") Array1;
		%feature("autodoc", "	:rtype: TColStd_Array1OfBoolean
") Array1;
		const TColStd_Array1OfBoolean & Array1 ();
		%feature("compactdefaultargs") ChangeArray1;
		%feature("autodoc", "	:rtype: TColStd_Array1OfBoolean
") ChangeArray1;
		TColStd_Array1OfBoolean & ChangeArray1 ();
};


%extend TColStd_HArray1OfBoolean {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_TColStd_HArray1OfBoolean(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_TColStd_HArray1OfBoolean::Handle_TColStd_HArray1OfBoolean %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_TColStd_HArray1OfBoolean;
class Handle_TColStd_HArray1OfBoolean : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_TColStd_HArray1OfBoolean();
        Handle_TColStd_HArray1OfBoolean(const Handle_TColStd_HArray1OfBoolean &aHandle);
        Handle_TColStd_HArray1OfBoolean(const TColStd_HArray1OfBoolean *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_TColStd_HArray1OfBoolean DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_TColStd_HArray1OfBoolean {
    TColStd_HArray1OfBoolean* _get_reference() {
    return (TColStd_HArray1OfBoolean*)$self->Access();
    }
};

%extend Handle_TColStd_HArray1OfBoolean {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend TColStd_HArray1OfBoolean {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TColStd_HArray1OfByte;
class TColStd_HArray1OfByte : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") TColStd_HArray1OfByte;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") TColStd_HArray1OfByte;
		 TColStd_HArray1OfByte (const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") TColStd_HArray1OfByte;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:param V:
	:type V: Standard_Byte &
	:rtype: None
") TColStd_HArray1OfByte;
		 TColStd_HArray1OfByte (const Standard_Integer Low,const Standard_Integer Up,const Standard_Byte & V);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param V:
	:type V: Standard_Byte &
	:rtype: None
") Init;
		void Init (const Standard_Byte & V);
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "	:rtype: int
") Length;
		Standard_Integer Length ();
		%feature("compactdefaultargs") Lower;
		%feature("autodoc", "	:rtype: int
") Lower;
		Standard_Integer Lower ();
		%feature("compactdefaultargs") Upper;
		%feature("autodoc", "	:rtype: int
") Upper;
		Standard_Integer Upper ();
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param Value:
	:type Value: Standard_Byte &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const Standard_Byte & Value);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Standard_Byte
") Value;
		const Standard_Byte & Value (const Standard_Integer Index);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Standard_Byte
") ChangeValue;
		Standard_Byte & ChangeValue (const Standard_Integer Index);
		%feature("compactdefaultargs") Array1;
		%feature("autodoc", "	:rtype: TColStd_Array1OfByte
") Array1;
		const TColStd_Array1OfByte & Array1 ();
		%feature("compactdefaultargs") ChangeArray1;
		%feature("autodoc", "	:rtype: TColStd_Array1OfByte
") ChangeArray1;
		TColStd_Array1OfByte & ChangeArray1 ();
};


%extend TColStd_HArray1OfByte {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_TColStd_HArray1OfByte(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_TColStd_HArray1OfByte::Handle_TColStd_HArray1OfByte %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_TColStd_HArray1OfByte;
class Handle_TColStd_HArray1OfByte : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_TColStd_HArray1OfByte();
        Handle_TColStd_HArray1OfByte(const Handle_TColStd_HArray1OfByte &aHandle);
        Handle_TColStd_HArray1OfByte(const TColStd_HArray1OfByte *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_TColStd_HArray1OfByte DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_TColStd_HArray1OfByte {
    TColStd_HArray1OfByte* _get_reference() {
    return (TColStd_HArray1OfByte*)$self->Access();
    }
};

%extend Handle_TColStd_HArray1OfByte {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend TColStd_HArray1OfByte {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TColStd_HArray1OfCharacter;
class TColStd_HArray1OfCharacter : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") TColStd_HArray1OfCharacter;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") TColStd_HArray1OfCharacter;
		 TColStd_HArray1OfCharacter (const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") TColStd_HArray1OfCharacter;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:param V:
	:type V: Standard_Character &
	:rtype: None
") TColStd_HArray1OfCharacter;
		 TColStd_HArray1OfCharacter (const Standard_Integer Low,const Standard_Integer Up,const Standard_Character & V);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param V:
	:type V: Standard_Character &
	:rtype: None
") Init;
		void Init (const Standard_Character & V);
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "	:rtype: int
") Length;
		Standard_Integer Length ();
		%feature("compactdefaultargs") Lower;
		%feature("autodoc", "	:rtype: int
") Lower;
		Standard_Integer Lower ();
		%feature("compactdefaultargs") Upper;
		%feature("autodoc", "	:rtype: int
") Upper;
		Standard_Integer Upper ();
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param Value:
	:type Value: Standard_Character &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const Standard_Character & Value);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Standard_Character
") Value;
		const Standard_Character & Value (const Standard_Integer Index);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Standard_Character
") ChangeValue;
		Standard_Character & ChangeValue (const Standard_Integer Index);
		%feature("compactdefaultargs") Array1;
		%feature("autodoc", "	:rtype: TColStd_Array1OfCharacter
") Array1;
		const TColStd_Array1OfCharacter & Array1 ();
		%feature("compactdefaultargs") ChangeArray1;
		%feature("autodoc", "	:rtype: TColStd_Array1OfCharacter
") ChangeArray1;
		TColStd_Array1OfCharacter & ChangeArray1 ();
};


%extend TColStd_HArray1OfCharacter {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_TColStd_HArray1OfCharacter(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_TColStd_HArray1OfCharacter::Handle_TColStd_HArray1OfCharacter %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_TColStd_HArray1OfCharacter;
class Handle_TColStd_HArray1OfCharacter : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_TColStd_HArray1OfCharacter();
        Handle_TColStd_HArray1OfCharacter(const Handle_TColStd_HArray1OfCharacter &aHandle);
        Handle_TColStd_HArray1OfCharacter(const TColStd_HArray1OfCharacter *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_TColStd_HArray1OfCharacter DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_TColStd_HArray1OfCharacter {
    TColStd_HArray1OfCharacter* _get_reference() {
    return (TColStd_HArray1OfCharacter*)$self->Access();
    }
};

%extend Handle_TColStd_HArray1OfCharacter {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend TColStd_HArray1OfCharacter {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TColStd_HArray1OfExtendedString;
class TColStd_HArray1OfExtendedString : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") TColStd_HArray1OfExtendedString;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") TColStd_HArray1OfExtendedString;
		 TColStd_HArray1OfExtendedString (const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") TColStd_HArray1OfExtendedString;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:param V:
	:type V: TCollection_ExtendedString &
	:rtype: None
") TColStd_HArray1OfExtendedString;
		 TColStd_HArray1OfExtendedString (const Standard_Integer Low,const Standard_Integer Up,const TCollection_ExtendedString & V);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param V:
	:type V: TCollection_ExtendedString &
	:rtype: None
") Init;
		void Init (const TCollection_ExtendedString & V);
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "	:rtype: int
") Length;
		Standard_Integer Length ();
		%feature("compactdefaultargs") Lower;
		%feature("autodoc", "	:rtype: int
") Lower;
		Standard_Integer Lower ();
		%feature("compactdefaultargs") Upper;
		%feature("autodoc", "	:rtype: int
") Upper;
		Standard_Integer Upper ();
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param Value:
	:type Value: TCollection_ExtendedString &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const TCollection_ExtendedString & Value);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: TCollection_ExtendedString
") Value;
		const TCollection_ExtendedString & Value (const Standard_Integer Index);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: TCollection_ExtendedString
") ChangeValue;
		TCollection_ExtendedString & ChangeValue (const Standard_Integer Index);
		%feature("compactdefaultargs") Array1;
		%feature("autodoc", "	:rtype: TColStd_Array1OfExtendedString
") Array1;
		const TColStd_Array1OfExtendedString & Array1 ();
		%feature("compactdefaultargs") ChangeArray1;
		%feature("autodoc", "	:rtype: TColStd_Array1OfExtendedString
") ChangeArray1;
		TColStd_Array1OfExtendedString & ChangeArray1 ();
};


%extend TColStd_HArray1OfExtendedString {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_TColStd_HArray1OfExtendedString(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_TColStd_HArray1OfExtendedString::Handle_TColStd_HArray1OfExtendedString %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_TColStd_HArray1OfExtendedString;
class Handle_TColStd_HArray1OfExtendedString : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_TColStd_HArray1OfExtendedString();
        Handle_TColStd_HArray1OfExtendedString(const Handle_TColStd_HArray1OfExtendedString &aHandle);
        Handle_TColStd_HArray1OfExtendedString(const TColStd_HArray1OfExtendedString *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_TColStd_HArray1OfExtendedString DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_TColStd_HArray1OfExtendedString {
    TColStd_HArray1OfExtendedString* _get_reference() {
    return (TColStd_HArray1OfExtendedString*)$self->Access();
    }
};

%extend Handle_TColStd_HArray1OfExtendedString {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend TColStd_HArray1OfExtendedString {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TColStd_HArray1OfInteger;
class TColStd_HArray1OfInteger : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") TColStd_HArray1OfInteger;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") TColStd_HArray1OfInteger;
		 TColStd_HArray1OfInteger (const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") TColStd_HArray1OfInteger;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:param V:
	:type V: int &
	:rtype: None
") TColStd_HArray1OfInteger;
		 TColStd_HArray1OfInteger (const Standard_Integer Low,const Standard_Integer Up,const Standard_Integer & V);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param V:
	:type V: int &
	:rtype: None
") Init;
		void Init (const Standard_Integer & V);
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "	:rtype: int
") Length;
		Standard_Integer Length ();
		%feature("compactdefaultargs") Lower;
		%feature("autodoc", "	:rtype: int
") Lower;
		Standard_Integer Lower ();
		%feature("compactdefaultargs") Upper;
		%feature("autodoc", "	:rtype: int
") Upper;
		Standard_Integer Upper ();
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param Value:
	:type Value: int &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const Standard_Integer & Value);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: int
") Value;
		const Standard_Integer & Value (const Standard_Integer Index);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: int
") ChangeValue;
		Standard_Integer & ChangeValue (const Standard_Integer Index);
		%feature("compactdefaultargs") Array1;
		%feature("autodoc", "	:rtype: TColStd_Array1OfInteger
") Array1;
		const TColStd_Array1OfInteger & Array1 ();
		%feature("compactdefaultargs") ChangeArray1;
		%feature("autodoc", "	:rtype: TColStd_Array1OfInteger
") ChangeArray1;
		TColStd_Array1OfInteger & ChangeArray1 ();
};


%extend TColStd_HArray1OfInteger {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_TColStd_HArray1OfInteger(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_TColStd_HArray1OfInteger::Handle_TColStd_HArray1OfInteger %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_TColStd_HArray1OfInteger;
class Handle_TColStd_HArray1OfInteger : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_TColStd_HArray1OfInteger();
        Handle_TColStd_HArray1OfInteger(const Handle_TColStd_HArray1OfInteger &aHandle);
        Handle_TColStd_HArray1OfInteger(const TColStd_HArray1OfInteger *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_TColStd_HArray1OfInteger DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_TColStd_HArray1OfInteger {
    TColStd_HArray1OfInteger* _get_reference() {
    return (TColStd_HArray1OfInteger*)$self->Access();
    }
};

%extend Handle_TColStd_HArray1OfInteger {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend TColStd_HArray1OfInteger {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TColStd_HArray1OfListOfInteger;
class TColStd_HArray1OfListOfInteger : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") TColStd_HArray1OfListOfInteger;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") TColStd_HArray1OfListOfInteger;
		 TColStd_HArray1OfListOfInteger (const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") TColStd_HArray1OfListOfInteger;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:param V:
	:type V: TColStd_ListOfInteger &
	:rtype: None
") TColStd_HArray1OfListOfInteger;
		 TColStd_HArray1OfListOfInteger (const Standard_Integer Low,const Standard_Integer Up,const TColStd_ListOfInteger & V);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param V:
	:type V: TColStd_ListOfInteger &
	:rtype: None
") Init;
		void Init (const TColStd_ListOfInteger & V);
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "	:rtype: int
") Length;
		Standard_Integer Length ();
		%feature("compactdefaultargs") Lower;
		%feature("autodoc", "	:rtype: int
") Lower;
		Standard_Integer Lower ();
		%feature("compactdefaultargs") Upper;
		%feature("autodoc", "	:rtype: int
") Upper;
		Standard_Integer Upper ();
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param Value:
	:type Value: TColStd_ListOfInteger &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const TColStd_ListOfInteger & Value);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: TColStd_ListOfInteger
") Value;
		const TColStd_ListOfInteger & Value (const Standard_Integer Index);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: TColStd_ListOfInteger
") ChangeValue;
		TColStd_ListOfInteger & ChangeValue (const Standard_Integer Index);
		%feature("compactdefaultargs") Array1;
		%feature("autodoc", "	:rtype: TColStd_Array1OfListOfInteger
") Array1;
		const TColStd_Array1OfListOfInteger & Array1 ();
		%feature("compactdefaultargs") ChangeArray1;
		%feature("autodoc", "	:rtype: TColStd_Array1OfListOfInteger
") ChangeArray1;
		TColStd_Array1OfListOfInteger & ChangeArray1 ();
};


%extend TColStd_HArray1OfListOfInteger {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_TColStd_HArray1OfListOfInteger(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_TColStd_HArray1OfListOfInteger::Handle_TColStd_HArray1OfListOfInteger %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_TColStd_HArray1OfListOfInteger;
class Handle_TColStd_HArray1OfListOfInteger : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_TColStd_HArray1OfListOfInteger();
        Handle_TColStd_HArray1OfListOfInteger(const Handle_TColStd_HArray1OfListOfInteger &aHandle);
        Handle_TColStd_HArray1OfListOfInteger(const TColStd_HArray1OfListOfInteger *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_TColStd_HArray1OfListOfInteger DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_TColStd_HArray1OfListOfInteger {
    TColStd_HArray1OfListOfInteger* _get_reference() {
    return (TColStd_HArray1OfListOfInteger*)$self->Access();
    }
};

%extend Handle_TColStd_HArray1OfListOfInteger {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend TColStd_HArray1OfListOfInteger {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TColStd_HArray1OfReal;
class TColStd_HArray1OfReal : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") TColStd_HArray1OfReal;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") TColStd_HArray1OfReal;
		 TColStd_HArray1OfReal (const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") TColStd_HArray1OfReal;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:param V:
	:type V: float &
	:rtype: None
") TColStd_HArray1OfReal;
		 TColStd_HArray1OfReal (const Standard_Integer Low,const Standard_Integer Up,const Standard_Real & V);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param V:
	:type V: float &
	:rtype: None
") Init;
		void Init (const Standard_Real & V);
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "	:rtype: int
") Length;
		Standard_Integer Length ();
		%feature("compactdefaultargs") Lower;
		%feature("autodoc", "	:rtype: int
") Lower;
		Standard_Integer Lower ();
		%feature("compactdefaultargs") Upper;
		%feature("autodoc", "	:rtype: int
") Upper;
		Standard_Integer Upper ();
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param Value:
	:type Value: float &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const Standard_Real & Value);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: float
") Value;
		const Standard_Real & Value (const Standard_Integer Index);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: float
") ChangeValue;
		Standard_Real & ChangeValue (const Standard_Integer Index);
		%feature("compactdefaultargs") Array1;
		%feature("autodoc", "	:rtype: TColStd_Array1OfReal
") Array1;
		const TColStd_Array1OfReal & Array1 ();
		%feature("compactdefaultargs") ChangeArray1;
		%feature("autodoc", "	:rtype: TColStd_Array1OfReal
") ChangeArray1;
		TColStd_Array1OfReal & ChangeArray1 ();
};


%extend TColStd_HArray1OfReal {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_TColStd_HArray1OfReal(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_TColStd_HArray1OfReal::Handle_TColStd_HArray1OfReal %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_TColStd_HArray1OfReal;
class Handle_TColStd_HArray1OfReal : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_TColStd_HArray1OfReal();
        Handle_TColStd_HArray1OfReal(const Handle_TColStd_HArray1OfReal &aHandle);
        Handle_TColStd_HArray1OfReal(const TColStd_HArray1OfReal *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_TColStd_HArray1OfReal DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_TColStd_HArray1OfReal {
    TColStd_HArray1OfReal* _get_reference() {
    return (TColStd_HArray1OfReal*)$self->Access();
    }
};

%extend Handle_TColStd_HArray1OfReal {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend TColStd_HArray1OfReal {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TColStd_HArray1OfTransient;
class TColStd_HArray1OfTransient : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") TColStd_HArray1OfTransient;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") TColStd_HArray1OfTransient;
		 TColStd_HArray1OfTransient (const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") TColStd_HArray1OfTransient;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:param V:
	:type V: Handle_Standard_Transient &
	:rtype: None
") TColStd_HArray1OfTransient;
		 TColStd_HArray1OfTransient (const Standard_Integer Low,const Standard_Integer Up,const Handle_Standard_Transient & V);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param V:
	:type V: Handle_Standard_Transient &
	:rtype: None
") Init;
		void Init (const Handle_Standard_Transient & V);
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "	:rtype: int
") Length;
		Standard_Integer Length ();
		%feature("compactdefaultargs") Lower;
		%feature("autodoc", "	:rtype: int
") Lower;
		Standard_Integer Lower ();
		%feature("compactdefaultargs") Upper;
		%feature("autodoc", "	:rtype: int
") Upper;
		Standard_Integer Upper ();
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param Value:
	:type Value: Handle_Standard_Transient &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const Handle_Standard_Transient & Value);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Handle_Standard_Transient
") Value;
		Handle_Standard_Transient Value (const Standard_Integer Index);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Handle_Standard_Transient
") ChangeValue;
		Handle_Standard_Transient ChangeValue (const Standard_Integer Index);
		%feature("compactdefaultargs") Array1;
		%feature("autodoc", "	:rtype: TColStd_Array1OfTransient
") Array1;
		const TColStd_Array1OfTransient & Array1 ();
		%feature("compactdefaultargs") ChangeArray1;
		%feature("autodoc", "	:rtype: TColStd_Array1OfTransient
") ChangeArray1;
		TColStd_Array1OfTransient & ChangeArray1 ();
};


%extend TColStd_HArray1OfTransient {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_TColStd_HArray1OfTransient(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_TColStd_HArray1OfTransient::Handle_TColStd_HArray1OfTransient %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_TColStd_HArray1OfTransient;
class Handle_TColStd_HArray1OfTransient : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_TColStd_HArray1OfTransient();
        Handle_TColStd_HArray1OfTransient(const Handle_TColStd_HArray1OfTransient &aHandle);
        Handle_TColStd_HArray1OfTransient(const TColStd_HArray1OfTransient *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_TColStd_HArray1OfTransient DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_TColStd_HArray1OfTransient {
    TColStd_HArray1OfTransient* _get_reference() {
    return (TColStd_HArray1OfTransient*)$self->Access();
    }
};

%extend Handle_TColStd_HArray1OfTransient {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend TColStd_HArray1OfTransient {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TColStd_HArray2OfBoolean;
class TColStd_HArray2OfBoolean : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") TColStd_HArray2OfBoolean;
		%feature("autodoc", "	:param R1:
	:type R1: int
	:param R2:
	:type R2: int
	:param C1:
	:type C1: int
	:param C2:
	:type C2: int
	:rtype: None
") TColStd_HArray2OfBoolean;
		 TColStd_HArray2OfBoolean (const Standard_Integer R1,const Standard_Integer R2,const Standard_Integer C1,const Standard_Integer C2);
		%feature("compactdefaultargs") TColStd_HArray2OfBoolean;
		%feature("autodoc", "	:param R1:
	:type R1: int
	:param R2:
	:type R2: int
	:param C1:
	:type C1: int
	:param C2:
	:type C2: int
	:param V:
	:type V: bool
	:rtype: None
") TColStd_HArray2OfBoolean;
		 TColStd_HArray2OfBoolean (const Standard_Integer R1,const Standard_Integer R2,const Standard_Integer C1,const Standard_Integer C2,const Standard_Boolean & V);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param V:
	:type V: bool
	:rtype: None
") Init;
		void Init (const Standard_Boolean & V);
		%feature("compactdefaultargs") ColLength;
		%feature("autodoc", "	:rtype: int
") ColLength;
		Standard_Integer ColLength ();
		%feature("compactdefaultargs") RowLength;
		%feature("autodoc", "	:rtype: int
") RowLength;
		Standard_Integer RowLength ();
		%feature("compactdefaultargs") LowerCol;
		%feature("autodoc", "	:rtype: int
") LowerCol;
		Standard_Integer LowerCol ();
		%feature("compactdefaultargs") LowerRow;
		%feature("autodoc", "	:rtype: int
") LowerRow;
		Standard_Integer LowerRow ();
		%feature("compactdefaultargs") UpperCol;
		%feature("autodoc", "	:rtype: int
") UpperCol;
		Standard_Integer UpperCol ();
		%feature("compactdefaultargs") UpperRow;
		%feature("autodoc", "	:rtype: int
") UpperRow;
		Standard_Integer UpperRow ();
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param Row:
	:type Row: int
	:param Col:
	:type Col: int
	:param Value:
	:type Value: bool
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Row,const Standard_Integer Col,const Standard_Boolean & Value);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Row:
	:type Row: int
	:param Col:
	:type Col: int
	:rtype: bool
") Value;
		const Standard_Boolean & Value (const Standard_Integer Row,const Standard_Integer Col);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Row:
	:type Row: int
	:param Col:
	:type Col: int
	:rtype: bool
") ChangeValue;
		Standard_Boolean & ChangeValue (const Standard_Integer Row,const Standard_Integer Col);
		%feature("compactdefaultargs") Array2;
		%feature("autodoc", "	:rtype: TColStd_Array2OfBoolean
") Array2;
		const TColStd_Array2OfBoolean & Array2 ();
		%feature("compactdefaultargs") ChangeArray2;
		%feature("autodoc", "	:rtype: TColStd_Array2OfBoolean
") ChangeArray2;
		TColStd_Array2OfBoolean & ChangeArray2 ();
};


%extend TColStd_HArray2OfBoolean {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_TColStd_HArray2OfBoolean(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_TColStd_HArray2OfBoolean::Handle_TColStd_HArray2OfBoolean %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_TColStd_HArray2OfBoolean;
class Handle_TColStd_HArray2OfBoolean : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_TColStd_HArray2OfBoolean();
        Handle_TColStd_HArray2OfBoolean(const Handle_TColStd_HArray2OfBoolean &aHandle);
        Handle_TColStd_HArray2OfBoolean(const TColStd_HArray2OfBoolean *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_TColStd_HArray2OfBoolean DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_TColStd_HArray2OfBoolean {
    TColStd_HArray2OfBoolean* _get_reference() {
    return (TColStd_HArray2OfBoolean*)$self->Access();
    }
};

%extend Handle_TColStd_HArray2OfBoolean {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend TColStd_HArray2OfBoolean {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TColStd_HArray2OfCharacter;
class TColStd_HArray2OfCharacter : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") TColStd_HArray2OfCharacter;
		%feature("autodoc", "	:param R1:
	:type R1: int
	:param R2:
	:type R2: int
	:param C1:
	:type C1: int
	:param C2:
	:type C2: int
	:rtype: None
") TColStd_HArray2OfCharacter;
		 TColStd_HArray2OfCharacter (const Standard_Integer R1,const Standard_Integer R2,const Standard_Integer C1,const Standard_Integer C2);
		%feature("compactdefaultargs") TColStd_HArray2OfCharacter;
		%feature("autodoc", "	:param R1:
	:type R1: int
	:param R2:
	:type R2: int
	:param C1:
	:type C1: int
	:param C2:
	:type C2: int
	:param V:
	:type V: Standard_Character &
	:rtype: None
") TColStd_HArray2OfCharacter;
		 TColStd_HArray2OfCharacter (const Standard_Integer R1,const Standard_Integer R2,const Standard_Integer C1,const Standard_Integer C2,const Standard_Character & V);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param V:
	:type V: Standard_Character &
	:rtype: None
") Init;
		void Init (const Standard_Character & V);
		%feature("compactdefaultargs") ColLength;
		%feature("autodoc", "	:rtype: int
") ColLength;
		Standard_Integer ColLength ();
		%feature("compactdefaultargs") RowLength;
		%feature("autodoc", "	:rtype: int
") RowLength;
		Standard_Integer RowLength ();
		%feature("compactdefaultargs") LowerCol;
		%feature("autodoc", "	:rtype: int
") LowerCol;
		Standard_Integer LowerCol ();
		%feature("compactdefaultargs") LowerRow;
		%feature("autodoc", "	:rtype: int
") LowerRow;
		Standard_Integer LowerRow ();
		%feature("compactdefaultargs") UpperCol;
		%feature("autodoc", "	:rtype: int
") UpperCol;
		Standard_Integer UpperCol ();
		%feature("compactdefaultargs") UpperRow;
		%feature("autodoc", "	:rtype: int
") UpperRow;
		Standard_Integer UpperRow ();
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param Row:
	:type Row: int
	:param Col:
	:type Col: int
	:param Value:
	:type Value: Standard_Character &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Row,const Standard_Integer Col,const Standard_Character & Value);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Row:
	:type Row: int
	:param Col:
	:type Col: int
	:rtype: Standard_Character
") Value;
		const Standard_Character & Value (const Standard_Integer Row,const Standard_Integer Col);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Row:
	:type Row: int
	:param Col:
	:type Col: int
	:rtype: Standard_Character
") ChangeValue;
		Standard_Character & ChangeValue (const Standard_Integer Row,const Standard_Integer Col);
		%feature("compactdefaultargs") Array2;
		%feature("autodoc", "	:rtype: TColStd_Array2OfCharacter
") Array2;
		const TColStd_Array2OfCharacter & Array2 ();
		%feature("compactdefaultargs") ChangeArray2;
		%feature("autodoc", "	:rtype: TColStd_Array2OfCharacter
") ChangeArray2;
		TColStd_Array2OfCharacter & ChangeArray2 ();
};


%extend TColStd_HArray2OfCharacter {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_TColStd_HArray2OfCharacter(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_TColStd_HArray2OfCharacter::Handle_TColStd_HArray2OfCharacter %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_TColStd_HArray2OfCharacter;
class Handle_TColStd_HArray2OfCharacter : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_TColStd_HArray2OfCharacter();
        Handle_TColStd_HArray2OfCharacter(const Handle_TColStd_HArray2OfCharacter &aHandle);
        Handle_TColStd_HArray2OfCharacter(const TColStd_HArray2OfCharacter *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_TColStd_HArray2OfCharacter DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_TColStd_HArray2OfCharacter {
    TColStd_HArray2OfCharacter* _get_reference() {
    return (TColStd_HArray2OfCharacter*)$self->Access();
    }
};

%extend Handle_TColStd_HArray2OfCharacter {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend TColStd_HArray2OfCharacter {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TColStd_HArray2OfInteger;
class TColStd_HArray2OfInteger : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") TColStd_HArray2OfInteger;
		%feature("autodoc", "	:param R1:
	:type R1: int
	:param R2:
	:type R2: int
	:param C1:
	:type C1: int
	:param C2:
	:type C2: int
	:rtype: None
") TColStd_HArray2OfInteger;
		 TColStd_HArray2OfInteger (const Standard_Integer R1,const Standard_Integer R2,const Standard_Integer C1,const Standard_Integer C2);
		%feature("compactdefaultargs") TColStd_HArray2OfInteger;
		%feature("autodoc", "	:param R1:
	:type R1: int
	:param R2:
	:type R2: int
	:param C1:
	:type C1: int
	:param C2:
	:type C2: int
	:param V:
	:type V: int &
	:rtype: None
") TColStd_HArray2OfInteger;
		 TColStd_HArray2OfInteger (const Standard_Integer R1,const Standard_Integer R2,const Standard_Integer C1,const Standard_Integer C2,const Standard_Integer & V);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param V:
	:type V: int &
	:rtype: None
") Init;
		void Init (const Standard_Integer & V);
		%feature("compactdefaultargs") ColLength;
		%feature("autodoc", "	:rtype: int
") ColLength;
		Standard_Integer ColLength ();
		%feature("compactdefaultargs") RowLength;
		%feature("autodoc", "	:rtype: int
") RowLength;
		Standard_Integer RowLength ();
		%feature("compactdefaultargs") LowerCol;
		%feature("autodoc", "	:rtype: int
") LowerCol;
		Standard_Integer LowerCol ();
		%feature("compactdefaultargs") LowerRow;
		%feature("autodoc", "	:rtype: int
") LowerRow;
		Standard_Integer LowerRow ();
		%feature("compactdefaultargs") UpperCol;
		%feature("autodoc", "	:rtype: int
") UpperCol;
		Standard_Integer UpperCol ();
		%feature("compactdefaultargs") UpperRow;
		%feature("autodoc", "	:rtype: int
") UpperRow;
		Standard_Integer UpperRow ();
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param Row:
	:type Row: int
	:param Col:
	:type Col: int
	:param Value:
	:type Value: int &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Row,const Standard_Integer Col,const Standard_Integer & Value);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Row:
	:type Row: int
	:param Col:
	:type Col: int
	:rtype: int
") Value;
		const Standard_Integer & Value (const Standard_Integer Row,const Standard_Integer Col);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Row:
	:type Row: int
	:param Col:
	:type Col: int
	:rtype: int
") ChangeValue;
		Standard_Integer & ChangeValue (const Standard_Integer Row,const Standard_Integer Col);
		%feature("compactdefaultargs") Array2;
		%feature("autodoc", "	:rtype: TColStd_Array2OfInteger
") Array2;
		const TColStd_Array2OfInteger & Array2 ();
		%feature("compactdefaultargs") ChangeArray2;
		%feature("autodoc", "	:rtype: TColStd_Array2OfInteger
") ChangeArray2;
		TColStd_Array2OfInteger & ChangeArray2 ();
};


%extend TColStd_HArray2OfInteger {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_TColStd_HArray2OfInteger(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_TColStd_HArray2OfInteger::Handle_TColStd_HArray2OfInteger %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_TColStd_HArray2OfInteger;
class Handle_TColStd_HArray2OfInteger : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_TColStd_HArray2OfInteger();
        Handle_TColStd_HArray2OfInteger(const Handle_TColStd_HArray2OfInteger &aHandle);
        Handle_TColStd_HArray2OfInteger(const TColStd_HArray2OfInteger *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_TColStd_HArray2OfInteger DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_TColStd_HArray2OfInteger {
    TColStd_HArray2OfInteger* _get_reference() {
    return (TColStd_HArray2OfInteger*)$self->Access();
    }
};

%extend Handle_TColStd_HArray2OfInteger {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend TColStd_HArray2OfInteger {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TColStd_HArray2OfReal;
class TColStd_HArray2OfReal : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") TColStd_HArray2OfReal;
		%feature("autodoc", "	:param R1:
	:type R1: int
	:param R2:
	:type R2: int
	:param C1:
	:type C1: int
	:param C2:
	:type C2: int
	:rtype: None
") TColStd_HArray2OfReal;
		 TColStd_HArray2OfReal (const Standard_Integer R1,const Standard_Integer R2,const Standard_Integer C1,const Standard_Integer C2);
		%feature("compactdefaultargs") TColStd_HArray2OfReal;
		%feature("autodoc", "	:param R1:
	:type R1: int
	:param R2:
	:type R2: int
	:param C1:
	:type C1: int
	:param C2:
	:type C2: int
	:param V:
	:type V: float &
	:rtype: None
") TColStd_HArray2OfReal;
		 TColStd_HArray2OfReal (const Standard_Integer R1,const Standard_Integer R2,const Standard_Integer C1,const Standard_Integer C2,const Standard_Real & V);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param V:
	:type V: float &
	:rtype: None
") Init;
		void Init (const Standard_Real & V);
		%feature("compactdefaultargs") ColLength;
		%feature("autodoc", "	:rtype: int
") ColLength;
		Standard_Integer ColLength ();
		%feature("compactdefaultargs") RowLength;
		%feature("autodoc", "	:rtype: int
") RowLength;
		Standard_Integer RowLength ();
		%feature("compactdefaultargs") LowerCol;
		%feature("autodoc", "	:rtype: int
") LowerCol;
		Standard_Integer LowerCol ();
		%feature("compactdefaultargs") LowerRow;
		%feature("autodoc", "	:rtype: int
") LowerRow;
		Standard_Integer LowerRow ();
		%feature("compactdefaultargs") UpperCol;
		%feature("autodoc", "	:rtype: int
") UpperCol;
		Standard_Integer UpperCol ();
		%feature("compactdefaultargs") UpperRow;
		%feature("autodoc", "	:rtype: int
") UpperRow;
		Standard_Integer UpperRow ();
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param Row:
	:type Row: int
	:param Col:
	:type Col: int
	:param Value:
	:type Value: float &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Row,const Standard_Integer Col,const Standard_Real & Value);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Row:
	:type Row: int
	:param Col:
	:type Col: int
	:rtype: float
") Value;
		const Standard_Real & Value (const Standard_Integer Row,const Standard_Integer Col);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Row:
	:type Row: int
	:param Col:
	:type Col: int
	:rtype: float
") ChangeValue;
		Standard_Real & ChangeValue (const Standard_Integer Row,const Standard_Integer Col);
		%feature("compactdefaultargs") Array2;
		%feature("autodoc", "	:rtype: TColStd_Array2OfReal
") Array2;
		const TColStd_Array2OfReal & Array2 ();
		%feature("compactdefaultargs") ChangeArray2;
		%feature("autodoc", "	:rtype: TColStd_Array2OfReal
") ChangeArray2;
		TColStd_Array2OfReal & ChangeArray2 ();
};


%extend TColStd_HArray2OfReal {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_TColStd_HArray2OfReal(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_TColStd_HArray2OfReal::Handle_TColStd_HArray2OfReal %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_TColStd_HArray2OfReal;
class Handle_TColStd_HArray2OfReal : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_TColStd_HArray2OfReal();
        Handle_TColStd_HArray2OfReal(const Handle_TColStd_HArray2OfReal &aHandle);
        Handle_TColStd_HArray2OfReal(const TColStd_HArray2OfReal *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_TColStd_HArray2OfReal DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_TColStd_HArray2OfReal {
    TColStd_HArray2OfReal* _get_reference() {
    return (TColStd_HArray2OfReal*)$self->Access();
    }
};

%extend Handle_TColStd_HArray2OfReal {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend TColStd_HArray2OfReal {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TColStd_HArray2OfTransient;
class TColStd_HArray2OfTransient : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") TColStd_HArray2OfTransient;
		%feature("autodoc", "	:param R1:
	:type R1: int
	:param R2:
	:type R2: int
	:param C1:
	:type C1: int
	:param C2:
	:type C2: int
	:rtype: None
") TColStd_HArray2OfTransient;
		 TColStd_HArray2OfTransient (const Standard_Integer R1,const Standard_Integer R2,const Standard_Integer C1,const Standard_Integer C2);
		%feature("compactdefaultargs") TColStd_HArray2OfTransient;
		%feature("autodoc", "	:param R1:
	:type R1: int
	:param R2:
	:type R2: int
	:param C1:
	:type C1: int
	:param C2:
	:type C2: int
	:param V:
	:type V: Handle_Standard_Transient &
	:rtype: None
") TColStd_HArray2OfTransient;
		 TColStd_HArray2OfTransient (const Standard_Integer R1,const Standard_Integer R2,const Standard_Integer C1,const Standard_Integer C2,const Handle_Standard_Transient & V);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param V:
	:type V: Handle_Standard_Transient &
	:rtype: None
") Init;
		void Init (const Handle_Standard_Transient & V);
		%feature("compactdefaultargs") ColLength;
		%feature("autodoc", "	:rtype: int
") ColLength;
		Standard_Integer ColLength ();
		%feature("compactdefaultargs") RowLength;
		%feature("autodoc", "	:rtype: int
") RowLength;
		Standard_Integer RowLength ();
		%feature("compactdefaultargs") LowerCol;
		%feature("autodoc", "	:rtype: int
") LowerCol;
		Standard_Integer LowerCol ();
		%feature("compactdefaultargs") LowerRow;
		%feature("autodoc", "	:rtype: int
") LowerRow;
		Standard_Integer LowerRow ();
		%feature("compactdefaultargs") UpperCol;
		%feature("autodoc", "	:rtype: int
") UpperCol;
		Standard_Integer UpperCol ();
		%feature("compactdefaultargs") UpperRow;
		%feature("autodoc", "	:rtype: int
") UpperRow;
		Standard_Integer UpperRow ();
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param Row:
	:type Row: int
	:param Col:
	:type Col: int
	:param Value:
	:type Value: Handle_Standard_Transient &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Row,const Standard_Integer Col,const Handle_Standard_Transient & Value);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Row:
	:type Row: int
	:param Col:
	:type Col: int
	:rtype: Handle_Standard_Transient
") Value;
		Handle_Standard_Transient Value (const Standard_Integer Row,const Standard_Integer Col);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Row:
	:type Row: int
	:param Col:
	:type Col: int
	:rtype: Handle_Standard_Transient
") ChangeValue;
		Handle_Standard_Transient ChangeValue (const Standard_Integer Row,const Standard_Integer Col);
		%feature("compactdefaultargs") Array2;
		%feature("autodoc", "	:rtype: TColStd_Array2OfTransient
") Array2;
		const TColStd_Array2OfTransient & Array2 ();
		%feature("compactdefaultargs") ChangeArray2;
		%feature("autodoc", "	:rtype: TColStd_Array2OfTransient
") ChangeArray2;
		TColStd_Array2OfTransient & ChangeArray2 ();
};


%extend TColStd_HArray2OfTransient {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_TColStd_HArray2OfTransient(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_TColStd_HArray2OfTransient::Handle_TColStd_HArray2OfTransient %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_TColStd_HArray2OfTransient;
class Handle_TColStd_HArray2OfTransient : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_TColStd_HArray2OfTransient();
        Handle_TColStd_HArray2OfTransient(const Handle_TColStd_HArray2OfTransient &aHandle);
        Handle_TColStd_HArray2OfTransient(const TColStd_HArray2OfTransient *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_TColStd_HArray2OfTransient DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_TColStd_HArray2OfTransient {
    TColStd_HArray2OfTransient* _get_reference() {
    return (TColStd_HArray2OfTransient*)$self->Access();
    }
};

%extend Handle_TColStd_HArray2OfTransient {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend TColStd_HArray2OfTransient {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TColStd_HPackedMapOfInteger;
class TColStd_HPackedMapOfInteger : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") TColStd_HPackedMapOfInteger;
		%feature("autodoc", "	:param NbBuckets: default value is 1
	:type NbBuckets: int
	:rtype: None
") TColStd_HPackedMapOfInteger;
		 TColStd_HPackedMapOfInteger (const Standard_Integer NbBuckets = 1);
		%feature("compactdefaultargs") TColStd_HPackedMapOfInteger;
		%feature("autodoc", "	:param theOther:
	:type theOther: TColStd_PackedMapOfInteger &
	:rtype: None
") TColStd_HPackedMapOfInteger;
		 TColStd_HPackedMapOfInteger (const TColStd_PackedMapOfInteger & theOther);
		%feature("compactdefaultargs") Map;
		%feature("autodoc", "	:rtype: TColStd_PackedMapOfInteger
") Map;
		const TColStd_PackedMapOfInteger & Map ();
		%feature("compactdefaultargs") ChangeMap;
		%feature("autodoc", "	:rtype: TColStd_PackedMapOfInteger
") ChangeMap;
		TColStd_PackedMapOfInteger & ChangeMap ();
};


%extend TColStd_HPackedMapOfInteger {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_TColStd_HPackedMapOfInteger(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_TColStd_HPackedMapOfInteger::Handle_TColStd_HPackedMapOfInteger %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_TColStd_HPackedMapOfInteger;
class Handle_TColStd_HPackedMapOfInteger : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_TColStd_HPackedMapOfInteger();
        Handle_TColStd_HPackedMapOfInteger(const Handle_TColStd_HPackedMapOfInteger &aHandle);
        Handle_TColStd_HPackedMapOfInteger(const TColStd_HPackedMapOfInteger *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_TColStd_HPackedMapOfInteger DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_TColStd_HPackedMapOfInteger {
    TColStd_HPackedMapOfInteger* _get_reference() {
    return (TColStd_HPackedMapOfInteger*)$self->Access();
    }
};

%extend Handle_TColStd_HPackedMapOfInteger {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend TColStd_HPackedMapOfInteger {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TColStd_HSequenceOfAsciiString;
class TColStd_HSequenceOfAsciiString : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") TColStd_HSequenceOfAsciiString;
		%feature("autodoc", "	:rtype: None
") TColStd_HSequenceOfAsciiString;
		 TColStd_HSequenceOfAsciiString ();
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "	:rtype: bool
") IsEmpty;
		Standard_Boolean IsEmpty ();
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "	:rtype: int
") Length;
		Standard_Integer Length ();
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param anItem:
	:type anItem: TCollection_AsciiString &
	:rtype: None
") Append;
		void Append (const TCollection_AsciiString & anItem);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param aSequence:
	:type aSequence: Handle_TColStd_HSequenceOfAsciiString &
	:rtype: None
") Append;
		void Append (const Handle_TColStd_HSequenceOfAsciiString & aSequence);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param anItem:
	:type anItem: TCollection_AsciiString &
	:rtype: None
") Prepend;
		void Prepend (const TCollection_AsciiString & anItem);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param aSequence:
	:type aSequence: Handle_TColStd_HSequenceOfAsciiString &
	:rtype: None
") Prepend;
		void Prepend (const Handle_TColStd_HSequenceOfAsciiString & aSequence);
		%feature("compactdefaultargs") Reverse;
		%feature("autodoc", "	:rtype: None
") Reverse;
		void Reverse ();
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:param anItem:
	:type anItem: TCollection_AsciiString &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer anIndex,const TCollection_AsciiString & anItem);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:param aSequence:
	:type aSequence: Handle_TColStd_HSequenceOfAsciiString &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer anIndex,const Handle_TColStd_HSequenceOfAsciiString & aSequence);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:param anItem:
	:type anItem: TCollection_AsciiString &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer anIndex,const TCollection_AsciiString & anItem);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:param aSequence:
	:type aSequence: Handle_TColStd_HSequenceOfAsciiString &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer anIndex,const Handle_TColStd_HSequenceOfAsciiString & aSequence);
		%feature("compactdefaultargs") Exchange;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:param anOtherIndex:
	:type anOtherIndex: int
	:rtype: None
") Exchange;
		void Exchange (const Standard_Integer anIndex,const Standard_Integer anOtherIndex);
		%feature("compactdefaultargs") Split;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:rtype: Handle_TColStd_HSequenceOfAsciiString
") Split;
		Handle_TColStd_HSequenceOfAsciiString Split (const Standard_Integer anIndex);
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:param anItem:
	:type anItem: TCollection_AsciiString &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer anIndex,const TCollection_AsciiString & anItem);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:rtype: TCollection_AsciiString
") Value;
		const TCollection_AsciiString & Value (const Standard_Integer anIndex);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:rtype: TCollection_AsciiString
") ChangeValue;
		TCollection_AsciiString & ChangeValue (const Standard_Integer anIndex);
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:rtype: None
") Remove;
		void Remove (const Standard_Integer anIndex);
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	:param fromIndex:
	:type fromIndex: int
	:param toIndex:
	:type toIndex: int
	:rtype: None
") Remove;
		void Remove (const Standard_Integer fromIndex,const Standard_Integer toIndex);
		%feature("compactdefaultargs") Sequence;
		%feature("autodoc", "	:rtype: TColStd_SequenceOfAsciiString
") Sequence;
		const TColStd_SequenceOfAsciiString & Sequence ();
		%feature("compactdefaultargs") ChangeSequence;
		%feature("autodoc", "	:rtype: TColStd_SequenceOfAsciiString
") ChangeSequence;
		TColStd_SequenceOfAsciiString & ChangeSequence ();
};


%extend TColStd_HSequenceOfAsciiString {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_TColStd_HSequenceOfAsciiString(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_TColStd_HSequenceOfAsciiString::Handle_TColStd_HSequenceOfAsciiString %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_TColStd_HSequenceOfAsciiString;
class Handle_TColStd_HSequenceOfAsciiString : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_TColStd_HSequenceOfAsciiString();
        Handle_TColStd_HSequenceOfAsciiString(const Handle_TColStd_HSequenceOfAsciiString &aHandle);
        Handle_TColStd_HSequenceOfAsciiString(const TColStd_HSequenceOfAsciiString *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_TColStd_HSequenceOfAsciiString DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_TColStd_HSequenceOfAsciiString {
    TColStd_HSequenceOfAsciiString* _get_reference() {
    return (TColStd_HSequenceOfAsciiString*)$self->Access();
    }
};

%extend Handle_TColStd_HSequenceOfAsciiString {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend TColStd_HSequenceOfAsciiString {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TColStd_HSequenceOfExtendedString;
class TColStd_HSequenceOfExtendedString : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") TColStd_HSequenceOfExtendedString;
		%feature("autodoc", "	:rtype: None
") TColStd_HSequenceOfExtendedString;
		 TColStd_HSequenceOfExtendedString ();
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "	:rtype: bool
") IsEmpty;
		Standard_Boolean IsEmpty ();
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "	:rtype: int
") Length;
		Standard_Integer Length ();
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param anItem:
	:type anItem: TCollection_ExtendedString &
	:rtype: None
") Append;
		void Append (const TCollection_ExtendedString & anItem);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param aSequence:
	:type aSequence: Handle_TColStd_HSequenceOfExtendedString &
	:rtype: None
") Append;
		void Append (const Handle_TColStd_HSequenceOfExtendedString & aSequence);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param anItem:
	:type anItem: TCollection_ExtendedString &
	:rtype: None
") Prepend;
		void Prepend (const TCollection_ExtendedString & anItem);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param aSequence:
	:type aSequence: Handle_TColStd_HSequenceOfExtendedString &
	:rtype: None
") Prepend;
		void Prepend (const Handle_TColStd_HSequenceOfExtendedString & aSequence);
		%feature("compactdefaultargs") Reverse;
		%feature("autodoc", "	:rtype: None
") Reverse;
		void Reverse ();
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:param anItem:
	:type anItem: TCollection_ExtendedString &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer anIndex,const TCollection_ExtendedString & anItem);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:param aSequence:
	:type aSequence: Handle_TColStd_HSequenceOfExtendedString &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer anIndex,const Handle_TColStd_HSequenceOfExtendedString & aSequence);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:param anItem:
	:type anItem: TCollection_ExtendedString &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer anIndex,const TCollection_ExtendedString & anItem);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:param aSequence:
	:type aSequence: Handle_TColStd_HSequenceOfExtendedString &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer anIndex,const Handle_TColStd_HSequenceOfExtendedString & aSequence);
		%feature("compactdefaultargs") Exchange;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:param anOtherIndex:
	:type anOtherIndex: int
	:rtype: None
") Exchange;
		void Exchange (const Standard_Integer anIndex,const Standard_Integer anOtherIndex);
		%feature("compactdefaultargs") Split;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:rtype: Handle_TColStd_HSequenceOfExtendedString
") Split;
		Handle_TColStd_HSequenceOfExtendedString Split (const Standard_Integer anIndex);
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:param anItem:
	:type anItem: TCollection_ExtendedString &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer anIndex,const TCollection_ExtendedString & anItem);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:rtype: TCollection_ExtendedString
") Value;
		const TCollection_ExtendedString & Value (const Standard_Integer anIndex);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:rtype: TCollection_ExtendedString
") ChangeValue;
		TCollection_ExtendedString & ChangeValue (const Standard_Integer anIndex);
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:rtype: None
") Remove;
		void Remove (const Standard_Integer anIndex);
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	:param fromIndex:
	:type fromIndex: int
	:param toIndex:
	:type toIndex: int
	:rtype: None
") Remove;
		void Remove (const Standard_Integer fromIndex,const Standard_Integer toIndex);
		%feature("compactdefaultargs") Sequence;
		%feature("autodoc", "	:rtype: TColStd_SequenceOfExtendedString
") Sequence;
		const TColStd_SequenceOfExtendedString & Sequence ();
		%feature("compactdefaultargs") ChangeSequence;
		%feature("autodoc", "	:rtype: TColStd_SequenceOfExtendedString
") ChangeSequence;
		TColStd_SequenceOfExtendedString & ChangeSequence ();
};


%extend TColStd_HSequenceOfExtendedString {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_TColStd_HSequenceOfExtendedString(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_TColStd_HSequenceOfExtendedString::Handle_TColStd_HSequenceOfExtendedString %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_TColStd_HSequenceOfExtendedString;
class Handle_TColStd_HSequenceOfExtendedString : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_TColStd_HSequenceOfExtendedString();
        Handle_TColStd_HSequenceOfExtendedString(const Handle_TColStd_HSequenceOfExtendedString &aHandle);
        Handle_TColStd_HSequenceOfExtendedString(const TColStd_HSequenceOfExtendedString *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_TColStd_HSequenceOfExtendedString DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_TColStd_HSequenceOfExtendedString {
    TColStd_HSequenceOfExtendedString* _get_reference() {
    return (TColStd_HSequenceOfExtendedString*)$self->Access();
    }
};

%extend Handle_TColStd_HSequenceOfExtendedString {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend TColStd_HSequenceOfExtendedString {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TColStd_HSequenceOfHAsciiString;
class TColStd_HSequenceOfHAsciiString : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") TColStd_HSequenceOfHAsciiString;
		%feature("autodoc", "	:rtype: None
") TColStd_HSequenceOfHAsciiString;
		 TColStd_HSequenceOfHAsciiString ();
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "	:rtype: bool
") IsEmpty;
		Standard_Boolean IsEmpty ();
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "	:rtype: int
") Length;
		Standard_Integer Length ();
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param anItem:
	:type anItem: Handle_TCollection_HAsciiString &
	:rtype: None
") Append;
		void Append (const Handle_TCollection_HAsciiString & anItem);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param aSequence:
	:type aSequence: Handle_TColStd_HSequenceOfHAsciiString &
	:rtype: None
") Append;
		void Append (const Handle_TColStd_HSequenceOfHAsciiString & aSequence);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param anItem:
	:type anItem: Handle_TCollection_HAsciiString &
	:rtype: None
") Prepend;
		void Prepend (const Handle_TCollection_HAsciiString & anItem);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param aSequence:
	:type aSequence: Handle_TColStd_HSequenceOfHAsciiString &
	:rtype: None
") Prepend;
		void Prepend (const Handle_TColStd_HSequenceOfHAsciiString & aSequence);
		%feature("compactdefaultargs") Reverse;
		%feature("autodoc", "	:rtype: None
") Reverse;
		void Reverse ();
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:param anItem:
	:type anItem: Handle_TCollection_HAsciiString &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer anIndex,const Handle_TCollection_HAsciiString & anItem);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:param aSequence:
	:type aSequence: Handle_TColStd_HSequenceOfHAsciiString &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer anIndex,const Handle_TColStd_HSequenceOfHAsciiString & aSequence);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:param anItem:
	:type anItem: Handle_TCollection_HAsciiString &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer anIndex,const Handle_TCollection_HAsciiString & anItem);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:param aSequence:
	:type aSequence: Handle_TColStd_HSequenceOfHAsciiString &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer anIndex,const Handle_TColStd_HSequenceOfHAsciiString & aSequence);
		%feature("compactdefaultargs") Exchange;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:param anOtherIndex:
	:type anOtherIndex: int
	:rtype: None
") Exchange;
		void Exchange (const Standard_Integer anIndex,const Standard_Integer anOtherIndex);
		%feature("compactdefaultargs") Split;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:rtype: Handle_TColStd_HSequenceOfHAsciiString
") Split;
		Handle_TColStd_HSequenceOfHAsciiString Split (const Standard_Integer anIndex);
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:param anItem:
	:type anItem: Handle_TCollection_HAsciiString &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer anIndex,const Handle_TCollection_HAsciiString & anItem);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:rtype: Handle_TCollection_HAsciiString
") Value;
		Handle_TCollection_HAsciiString Value (const Standard_Integer anIndex);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:rtype: Handle_TCollection_HAsciiString
") ChangeValue;
		Handle_TCollection_HAsciiString ChangeValue (const Standard_Integer anIndex);
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:rtype: None
") Remove;
		void Remove (const Standard_Integer anIndex);
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	:param fromIndex:
	:type fromIndex: int
	:param toIndex:
	:type toIndex: int
	:rtype: None
") Remove;
		void Remove (const Standard_Integer fromIndex,const Standard_Integer toIndex);
		%feature("compactdefaultargs") Sequence;
		%feature("autodoc", "	:rtype: TColStd_SequenceOfHAsciiString
") Sequence;
		const TColStd_SequenceOfHAsciiString & Sequence ();
		%feature("compactdefaultargs") ChangeSequence;
		%feature("autodoc", "	:rtype: TColStd_SequenceOfHAsciiString
") ChangeSequence;
		TColStd_SequenceOfHAsciiString & ChangeSequence ();
};


%extend TColStd_HSequenceOfHAsciiString {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_TColStd_HSequenceOfHAsciiString(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_TColStd_HSequenceOfHAsciiString::Handle_TColStd_HSequenceOfHAsciiString %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_TColStd_HSequenceOfHAsciiString;
class Handle_TColStd_HSequenceOfHAsciiString : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_TColStd_HSequenceOfHAsciiString();
        Handle_TColStd_HSequenceOfHAsciiString(const Handle_TColStd_HSequenceOfHAsciiString &aHandle);
        Handle_TColStd_HSequenceOfHAsciiString(const TColStd_HSequenceOfHAsciiString *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_TColStd_HSequenceOfHAsciiString DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_TColStd_HSequenceOfHAsciiString {
    TColStd_HSequenceOfHAsciiString* _get_reference() {
    return (TColStd_HSequenceOfHAsciiString*)$self->Access();
    }
};

%extend Handle_TColStd_HSequenceOfHAsciiString {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend TColStd_HSequenceOfHAsciiString {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TColStd_HSequenceOfHExtendedString;
class TColStd_HSequenceOfHExtendedString : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") TColStd_HSequenceOfHExtendedString;
		%feature("autodoc", "	:rtype: None
") TColStd_HSequenceOfHExtendedString;
		 TColStd_HSequenceOfHExtendedString ();
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "	:rtype: bool
") IsEmpty;
		Standard_Boolean IsEmpty ();
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "	:rtype: int
") Length;
		Standard_Integer Length ();
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param anItem:
	:type anItem: Handle_TCollection_HExtendedString &
	:rtype: None
") Append;
		void Append (const Handle_TCollection_HExtendedString & anItem);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param aSequence:
	:type aSequence: Handle_TColStd_HSequenceOfHExtendedString &
	:rtype: None
") Append;
		void Append (const Handle_TColStd_HSequenceOfHExtendedString & aSequence);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param anItem:
	:type anItem: Handle_TCollection_HExtendedString &
	:rtype: None
") Prepend;
		void Prepend (const Handle_TCollection_HExtendedString & anItem);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param aSequence:
	:type aSequence: Handle_TColStd_HSequenceOfHExtendedString &
	:rtype: None
") Prepend;
		void Prepend (const Handle_TColStd_HSequenceOfHExtendedString & aSequence);
		%feature("compactdefaultargs") Reverse;
		%feature("autodoc", "	:rtype: None
") Reverse;
		void Reverse ();
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:param anItem:
	:type anItem: Handle_TCollection_HExtendedString &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer anIndex,const Handle_TCollection_HExtendedString & anItem);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:param aSequence:
	:type aSequence: Handle_TColStd_HSequenceOfHExtendedString &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer anIndex,const Handle_TColStd_HSequenceOfHExtendedString & aSequence);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:param anItem:
	:type anItem: Handle_TCollection_HExtendedString &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer anIndex,const Handle_TCollection_HExtendedString & anItem);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:param aSequence:
	:type aSequence: Handle_TColStd_HSequenceOfHExtendedString &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer anIndex,const Handle_TColStd_HSequenceOfHExtendedString & aSequence);
		%feature("compactdefaultargs") Exchange;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:param anOtherIndex:
	:type anOtherIndex: int
	:rtype: None
") Exchange;
		void Exchange (const Standard_Integer anIndex,const Standard_Integer anOtherIndex);
		%feature("compactdefaultargs") Split;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:rtype: Handle_TColStd_HSequenceOfHExtendedString
") Split;
		Handle_TColStd_HSequenceOfHExtendedString Split (const Standard_Integer anIndex);
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:param anItem:
	:type anItem: Handle_TCollection_HExtendedString &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer anIndex,const Handle_TCollection_HExtendedString & anItem);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:rtype: Handle_TCollection_HExtendedString
") Value;
		Handle_TCollection_HExtendedString Value (const Standard_Integer anIndex);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:rtype: Handle_TCollection_HExtendedString
") ChangeValue;
		Handle_TCollection_HExtendedString ChangeValue (const Standard_Integer anIndex);
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:rtype: None
") Remove;
		void Remove (const Standard_Integer anIndex);
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	:param fromIndex:
	:type fromIndex: int
	:param toIndex:
	:type toIndex: int
	:rtype: None
") Remove;
		void Remove (const Standard_Integer fromIndex,const Standard_Integer toIndex);
		%feature("compactdefaultargs") Sequence;
		%feature("autodoc", "	:rtype: TColStd_SequenceOfHExtendedString
") Sequence;
		const TColStd_SequenceOfHExtendedString & Sequence ();
		%feature("compactdefaultargs") ChangeSequence;
		%feature("autodoc", "	:rtype: TColStd_SequenceOfHExtendedString
") ChangeSequence;
		TColStd_SequenceOfHExtendedString & ChangeSequence ();
};


%extend TColStd_HSequenceOfHExtendedString {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_TColStd_HSequenceOfHExtendedString(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_TColStd_HSequenceOfHExtendedString::Handle_TColStd_HSequenceOfHExtendedString %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_TColStd_HSequenceOfHExtendedString;
class Handle_TColStd_HSequenceOfHExtendedString : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_TColStd_HSequenceOfHExtendedString();
        Handle_TColStd_HSequenceOfHExtendedString(const Handle_TColStd_HSequenceOfHExtendedString &aHandle);
        Handle_TColStd_HSequenceOfHExtendedString(const TColStd_HSequenceOfHExtendedString *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_TColStd_HSequenceOfHExtendedString DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_TColStd_HSequenceOfHExtendedString {
    TColStd_HSequenceOfHExtendedString* _get_reference() {
    return (TColStd_HSequenceOfHExtendedString*)$self->Access();
    }
};

%extend Handle_TColStd_HSequenceOfHExtendedString {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend TColStd_HSequenceOfHExtendedString {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TColStd_HSequenceOfInteger;
class TColStd_HSequenceOfInteger : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") TColStd_HSequenceOfInteger;
		%feature("autodoc", "	:rtype: None
") TColStd_HSequenceOfInteger;
		 TColStd_HSequenceOfInteger ();
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "	:rtype: bool
") IsEmpty;
		Standard_Boolean IsEmpty ();
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "	:rtype: int
") Length;
		Standard_Integer Length ();
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param anItem:
	:type anItem: int &
	:rtype: None
") Append;
		void Append (const Standard_Integer & anItem);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param aSequence:
	:type aSequence: Handle_TColStd_HSequenceOfInteger &
	:rtype: None
") Append;
		void Append (const Handle_TColStd_HSequenceOfInteger & aSequence);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param anItem:
	:type anItem: int &
	:rtype: None
") Prepend;
		void Prepend (const Standard_Integer & anItem);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param aSequence:
	:type aSequence: Handle_TColStd_HSequenceOfInteger &
	:rtype: None
") Prepend;
		void Prepend (const Handle_TColStd_HSequenceOfInteger & aSequence);
		%feature("compactdefaultargs") Reverse;
		%feature("autodoc", "	:rtype: None
") Reverse;
		void Reverse ();
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:param anItem:
	:type anItem: int &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer anIndex,const Standard_Integer & anItem);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:param aSequence:
	:type aSequence: Handle_TColStd_HSequenceOfInteger &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer anIndex,const Handle_TColStd_HSequenceOfInteger & aSequence);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:param anItem:
	:type anItem: int &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer anIndex,const Standard_Integer & anItem);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:param aSequence:
	:type aSequence: Handle_TColStd_HSequenceOfInteger &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer anIndex,const Handle_TColStd_HSequenceOfInteger & aSequence);
		%feature("compactdefaultargs") Exchange;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:param anOtherIndex:
	:type anOtherIndex: int
	:rtype: None
") Exchange;
		void Exchange (const Standard_Integer anIndex,const Standard_Integer anOtherIndex);
		%feature("compactdefaultargs") Split;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:rtype: Handle_TColStd_HSequenceOfInteger
") Split;
		Handle_TColStd_HSequenceOfInteger Split (const Standard_Integer anIndex);
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:param anItem:
	:type anItem: int &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer anIndex,const Standard_Integer & anItem);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:rtype: int
") Value;
		const Standard_Integer & Value (const Standard_Integer anIndex);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:rtype: int
") ChangeValue;
		Standard_Integer & ChangeValue (const Standard_Integer anIndex);
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:rtype: None
") Remove;
		void Remove (const Standard_Integer anIndex);
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	:param fromIndex:
	:type fromIndex: int
	:param toIndex:
	:type toIndex: int
	:rtype: None
") Remove;
		void Remove (const Standard_Integer fromIndex,const Standard_Integer toIndex);
		%feature("compactdefaultargs") Sequence;
		%feature("autodoc", "	:rtype: TColStd_SequenceOfInteger
") Sequence;
		const TColStd_SequenceOfInteger & Sequence ();
		%feature("compactdefaultargs") ChangeSequence;
		%feature("autodoc", "	:rtype: TColStd_SequenceOfInteger
") ChangeSequence;
		TColStd_SequenceOfInteger & ChangeSequence ();
};


%extend TColStd_HSequenceOfInteger {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_TColStd_HSequenceOfInteger(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_TColStd_HSequenceOfInteger::Handle_TColStd_HSequenceOfInteger %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_TColStd_HSequenceOfInteger;
class Handle_TColStd_HSequenceOfInteger : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_TColStd_HSequenceOfInteger();
        Handle_TColStd_HSequenceOfInteger(const Handle_TColStd_HSequenceOfInteger &aHandle);
        Handle_TColStd_HSequenceOfInteger(const TColStd_HSequenceOfInteger *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_TColStd_HSequenceOfInteger DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_TColStd_HSequenceOfInteger {
    TColStd_HSequenceOfInteger* _get_reference() {
    return (TColStd_HSequenceOfInteger*)$self->Access();
    }
};

%extend Handle_TColStd_HSequenceOfInteger {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend TColStd_HSequenceOfInteger {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TColStd_HSequenceOfReal;
class TColStd_HSequenceOfReal : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") TColStd_HSequenceOfReal;
		%feature("autodoc", "	:rtype: None
") TColStd_HSequenceOfReal;
		 TColStd_HSequenceOfReal ();
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "	:rtype: bool
") IsEmpty;
		Standard_Boolean IsEmpty ();
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "	:rtype: int
") Length;
		Standard_Integer Length ();
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param anItem:
	:type anItem: float &
	:rtype: None
") Append;
		void Append (const Standard_Real & anItem);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param aSequence:
	:type aSequence: Handle_TColStd_HSequenceOfReal &
	:rtype: None
") Append;
		void Append (const Handle_TColStd_HSequenceOfReal & aSequence);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param anItem:
	:type anItem: float &
	:rtype: None
") Prepend;
		void Prepend (const Standard_Real & anItem);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param aSequence:
	:type aSequence: Handle_TColStd_HSequenceOfReal &
	:rtype: None
") Prepend;
		void Prepend (const Handle_TColStd_HSequenceOfReal & aSequence);
		%feature("compactdefaultargs") Reverse;
		%feature("autodoc", "	:rtype: None
") Reverse;
		void Reverse ();
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:param anItem:
	:type anItem: float &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer anIndex,const Standard_Real & anItem);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:param aSequence:
	:type aSequence: Handle_TColStd_HSequenceOfReal &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer anIndex,const Handle_TColStd_HSequenceOfReal & aSequence);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:param anItem:
	:type anItem: float &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer anIndex,const Standard_Real & anItem);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:param aSequence:
	:type aSequence: Handle_TColStd_HSequenceOfReal &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer anIndex,const Handle_TColStd_HSequenceOfReal & aSequence);
		%feature("compactdefaultargs") Exchange;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:param anOtherIndex:
	:type anOtherIndex: int
	:rtype: None
") Exchange;
		void Exchange (const Standard_Integer anIndex,const Standard_Integer anOtherIndex);
		%feature("compactdefaultargs") Split;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:rtype: Handle_TColStd_HSequenceOfReal
") Split;
		Handle_TColStd_HSequenceOfReal Split (const Standard_Integer anIndex);
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:param anItem:
	:type anItem: float &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer anIndex,const Standard_Real & anItem);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:rtype: float
") Value;
		const Standard_Real & Value (const Standard_Integer anIndex);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:rtype: float
") ChangeValue;
		Standard_Real & ChangeValue (const Standard_Integer anIndex);
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:rtype: None
") Remove;
		void Remove (const Standard_Integer anIndex);
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	:param fromIndex:
	:type fromIndex: int
	:param toIndex:
	:type toIndex: int
	:rtype: None
") Remove;
		void Remove (const Standard_Integer fromIndex,const Standard_Integer toIndex);
		%feature("compactdefaultargs") Sequence;
		%feature("autodoc", "	:rtype: TColStd_SequenceOfReal
") Sequence;
		const TColStd_SequenceOfReal & Sequence ();
		%feature("compactdefaultargs") ChangeSequence;
		%feature("autodoc", "	:rtype: TColStd_SequenceOfReal
") ChangeSequence;
		TColStd_SequenceOfReal & ChangeSequence ();
};


%extend TColStd_HSequenceOfReal {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_TColStd_HSequenceOfReal(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_TColStd_HSequenceOfReal::Handle_TColStd_HSequenceOfReal %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_TColStd_HSequenceOfReal;
class Handle_TColStd_HSequenceOfReal : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_TColStd_HSequenceOfReal();
        Handle_TColStd_HSequenceOfReal(const Handle_TColStd_HSequenceOfReal &aHandle);
        Handle_TColStd_HSequenceOfReal(const TColStd_HSequenceOfReal *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_TColStd_HSequenceOfReal DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_TColStd_HSequenceOfReal {
    TColStd_HSequenceOfReal* _get_reference() {
    return (TColStd_HSequenceOfReal*)$self->Access();
    }
};

%extend Handle_TColStd_HSequenceOfReal {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend TColStd_HSequenceOfReal {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TColStd_HSequenceOfTransient;
class TColStd_HSequenceOfTransient : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") TColStd_HSequenceOfTransient;
		%feature("autodoc", "	:rtype: None
") TColStd_HSequenceOfTransient;
		 TColStd_HSequenceOfTransient ();
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "	:rtype: bool
") IsEmpty;
		Standard_Boolean IsEmpty ();
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "	:rtype: int
") Length;
		Standard_Integer Length ();
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param anItem:
	:type anItem: Handle_Standard_Transient &
	:rtype: None
") Append;
		void Append (const Handle_Standard_Transient & anItem);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param aSequence:
	:type aSequence: Handle_TColStd_HSequenceOfTransient &
	:rtype: None
") Append;
		void Append (const Handle_TColStd_HSequenceOfTransient & aSequence);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param anItem:
	:type anItem: Handle_Standard_Transient &
	:rtype: None
") Prepend;
		void Prepend (const Handle_Standard_Transient & anItem);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param aSequence:
	:type aSequence: Handle_TColStd_HSequenceOfTransient &
	:rtype: None
") Prepend;
		void Prepend (const Handle_TColStd_HSequenceOfTransient & aSequence);
		%feature("compactdefaultargs") Reverse;
		%feature("autodoc", "	:rtype: None
") Reverse;
		void Reverse ();
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:param anItem:
	:type anItem: Handle_Standard_Transient &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer anIndex,const Handle_Standard_Transient & anItem);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:param aSequence:
	:type aSequence: Handle_TColStd_HSequenceOfTransient &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer anIndex,const Handle_TColStd_HSequenceOfTransient & aSequence);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:param anItem:
	:type anItem: Handle_Standard_Transient &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer anIndex,const Handle_Standard_Transient & anItem);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:param aSequence:
	:type aSequence: Handle_TColStd_HSequenceOfTransient &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer anIndex,const Handle_TColStd_HSequenceOfTransient & aSequence);
		%feature("compactdefaultargs") Exchange;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:param anOtherIndex:
	:type anOtherIndex: int
	:rtype: None
") Exchange;
		void Exchange (const Standard_Integer anIndex,const Standard_Integer anOtherIndex);
		%feature("compactdefaultargs") Split;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:rtype: Handle_TColStd_HSequenceOfTransient
") Split;
		Handle_TColStd_HSequenceOfTransient Split (const Standard_Integer anIndex);
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:param anItem:
	:type anItem: Handle_Standard_Transient &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer anIndex,const Handle_Standard_Transient & anItem);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:rtype: Handle_Standard_Transient
") Value;
		Handle_Standard_Transient Value (const Standard_Integer anIndex);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:rtype: Handle_Standard_Transient
") ChangeValue;
		Handle_Standard_Transient ChangeValue (const Standard_Integer anIndex);
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:rtype: None
") Remove;
		void Remove (const Standard_Integer anIndex);
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	:param fromIndex:
	:type fromIndex: int
	:param toIndex:
	:type toIndex: int
	:rtype: None
") Remove;
		void Remove (const Standard_Integer fromIndex,const Standard_Integer toIndex);
		%feature("compactdefaultargs") Sequence;
		%feature("autodoc", "	:rtype: TColStd_SequenceOfTransient
") Sequence;
		const TColStd_SequenceOfTransient & Sequence ();
		%feature("compactdefaultargs") ChangeSequence;
		%feature("autodoc", "	:rtype: TColStd_SequenceOfTransient
") ChangeSequence;
		TColStd_SequenceOfTransient & ChangeSequence ();
};


%extend TColStd_HSequenceOfTransient {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_TColStd_HSequenceOfTransient(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_TColStd_HSequenceOfTransient::Handle_TColStd_HSequenceOfTransient %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_TColStd_HSequenceOfTransient;
class Handle_TColStd_HSequenceOfTransient : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_TColStd_HSequenceOfTransient();
        Handle_TColStd_HSequenceOfTransient(const Handle_TColStd_HSequenceOfTransient &aHandle);
        Handle_TColStd_HSequenceOfTransient(const TColStd_HSequenceOfTransient *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_TColStd_HSequenceOfTransient DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_TColStd_HSequenceOfTransient {
    TColStd_HSequenceOfTransient* _get_reference() {
    return (TColStd_HSequenceOfTransient*)$self->Access();
    }
};

%extend Handle_TColStd_HSequenceOfTransient {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend TColStd_HSequenceOfTransient {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TColStd_IndexedDataMapNodeOfIndexedDataMapOfTransientTransient;
class TColStd_IndexedDataMapNodeOfIndexedDataMapOfTransientTransient : public TCollection_MapNode {
	public:
		%feature("compactdefaultargs") TColStd_IndexedDataMapNodeOfIndexedDataMapOfTransientTransient;
		%feature("autodoc", "	:param K1:
	:type K1: Handle_Standard_Transient &
	:param K2:
	:type K2: int
	:param I:
	:type I: Handle_Standard_Transient &
	:param n1:
	:type n1: TCollection_MapNodePtr &
	:param n2:
	:type n2: TCollection_MapNodePtr &
	:rtype: None
") TColStd_IndexedDataMapNodeOfIndexedDataMapOfTransientTransient;
		 TColStd_IndexedDataMapNodeOfIndexedDataMapOfTransientTransient (const Handle_Standard_Transient & K1,const Standard_Integer K2,const Handle_Standard_Transient & I,const TCollection_MapNodePtr & n1,const TCollection_MapNodePtr & n2);
		%feature("compactdefaultargs") Key1;
		%feature("autodoc", "	:rtype: Handle_Standard_Transient
") Key1;
		Handle_Standard_Transient Key1 ();

            %feature("autodoc","1");
            %extend {
                Standard_Integer GetKey2() {
                return (Standard_Integer) $self->Key2();
                }
            };
            %feature("autodoc","1");
            %extend {
                void SetKey2(Standard_Integer value ) {
                $self->Key2()=value;
                }
            };
            		%feature("compactdefaultargs") Next2;
		%feature("autodoc", "	:rtype: TCollection_MapNodePtr
") Next2;
		TCollection_MapNodePtr & Next2 ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: Handle_Standard_Transient
") Value;
		Handle_Standard_Transient Value ();
};


%extend TColStd_IndexedDataMapNodeOfIndexedDataMapOfTransientTransient {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_TColStd_IndexedDataMapNodeOfIndexedDataMapOfTransientTransient(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_TColStd_IndexedDataMapNodeOfIndexedDataMapOfTransientTransient::Handle_TColStd_IndexedDataMapNodeOfIndexedDataMapOfTransientTransient %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_TColStd_IndexedDataMapNodeOfIndexedDataMapOfTransientTransient;
class Handle_TColStd_IndexedDataMapNodeOfIndexedDataMapOfTransientTransient : public Handle_TCollection_MapNode {

    public:
        // constructors
        Handle_TColStd_IndexedDataMapNodeOfIndexedDataMapOfTransientTransient();
        Handle_TColStd_IndexedDataMapNodeOfIndexedDataMapOfTransientTransient(const Handle_TColStd_IndexedDataMapNodeOfIndexedDataMapOfTransientTransient &aHandle);
        Handle_TColStd_IndexedDataMapNodeOfIndexedDataMapOfTransientTransient(const TColStd_IndexedDataMapNodeOfIndexedDataMapOfTransientTransient *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_TColStd_IndexedDataMapNodeOfIndexedDataMapOfTransientTransient DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_TColStd_IndexedDataMapNodeOfIndexedDataMapOfTransientTransient {
    TColStd_IndexedDataMapNodeOfIndexedDataMapOfTransientTransient* _get_reference() {
    return (TColStd_IndexedDataMapNodeOfIndexedDataMapOfTransientTransient*)$self->Access();
    }
};

%extend Handle_TColStd_IndexedDataMapNodeOfIndexedDataMapOfTransientTransient {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend TColStd_IndexedDataMapNodeOfIndexedDataMapOfTransientTransient {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TColStd_IndexedDataMapOfTransientTransient;
class TColStd_IndexedDataMapOfTransientTransient : public TCollection_BasicMap {
	public:
		%feature("compactdefaultargs") TColStd_IndexedDataMapOfTransientTransient;
		%feature("autodoc", "	:param NbBuckets: default value is 1
	:type NbBuckets: int
	:rtype: None
") TColStd_IndexedDataMapOfTransientTransient;
		 TColStd_IndexedDataMapOfTransientTransient (const Standard_Integer NbBuckets = 1);
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: TColStd_IndexedDataMapOfTransientTransient &
	:rtype: TColStd_IndexedDataMapOfTransientTransient
") Assign;
		TColStd_IndexedDataMapOfTransientTransient & Assign (const TColStd_IndexedDataMapOfTransientTransient & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: TColStd_IndexedDataMapOfTransientTransient &
	:rtype: TColStd_IndexedDataMapOfTransientTransient
") operator =;
		TColStd_IndexedDataMapOfTransientTransient & operator = (const TColStd_IndexedDataMapOfTransientTransient & Other);
		%feature("compactdefaultargs") ReSize;
		%feature("autodoc", "	:param NbBuckets:
	:type NbBuckets: int
	:rtype: None
") ReSize;
		void ReSize (const Standard_Integer NbBuckets);
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "	:param K:
	:type K: Handle_Standard_Transient &
	:param I:
	:type I: Handle_Standard_Transient &
	:rtype: int
") Add;
		Standard_Integer Add (const Handle_Standard_Transient & K,const Handle_Standard_Transient & I);
		%feature("compactdefaultargs") Substitute;
		%feature("autodoc", "	:param I:
	:type I: int
	:param K:
	:type K: Handle_Standard_Transient &
	:param T:
	:type T: Handle_Standard_Transient &
	:rtype: None
") Substitute;
		void Substitute (const Standard_Integer I,const Handle_Standard_Transient & K,const Handle_Standard_Transient & T);
		%feature("compactdefaultargs") RemoveLast;
		%feature("autodoc", "	:rtype: None
") RemoveLast;
		void RemoveLast ();
		%feature("compactdefaultargs") Contains;
		%feature("autodoc", "	:param K:
	:type K: Handle_Standard_Transient &
	:rtype: bool
") Contains;
		Standard_Boolean Contains (const Handle_Standard_Transient & K);
		%feature("compactdefaultargs") FindKey;
		%feature("autodoc", "	:param I:
	:type I: int
	:rtype: Handle_Standard_Transient
") FindKey;
		Handle_Standard_Transient FindKey (const Standard_Integer I);
		%feature("compactdefaultargs") FindFromIndex;
		%feature("autodoc", "	:param I:
	:type I: int
	:rtype: Handle_Standard_Transient
") FindFromIndex;
		Handle_Standard_Transient FindFromIndex (const Standard_Integer I);
		%feature("compactdefaultargs") ChangeFromIndex;
		%feature("autodoc", "	:param I:
	:type I: int
	:rtype: Handle_Standard_Transient
") ChangeFromIndex;
		Handle_Standard_Transient ChangeFromIndex (const Standard_Integer I);
		%feature("compactdefaultargs") FindIndex;
		%feature("autodoc", "	:param K:
	:type K: Handle_Standard_Transient &
	:rtype: int
") FindIndex;
		Standard_Integer FindIndex (const Handle_Standard_Transient & K);
		%feature("compactdefaultargs") FindFromKey;
		%feature("autodoc", "	:param K:
	:type K: Handle_Standard_Transient &
	:rtype: Handle_Standard_Transient
") FindFromKey;
		Handle_Standard_Transient FindFromKey (const Handle_Standard_Transient & K);
		%feature("compactdefaultargs") ChangeFromKey;
		%feature("autodoc", "	:param K:
	:type K: Handle_Standard_Transient &
	:rtype: Handle_Standard_Transient
") ChangeFromKey;
		Handle_Standard_Transient ChangeFromKey (const Handle_Standard_Transient & K);
		%feature("compactdefaultargs") FindFromKey1;
		%feature("autodoc", "	:param K:
	:type K: Handle_Standard_Transient &
	:rtype: Standard_Address
") FindFromKey1;
		Standard_Address FindFromKey1 (const Handle_Standard_Transient & K);
		%feature("compactdefaultargs") ChangeFromKey1;
		%feature("autodoc", "	:param K:
	:type K: Handle_Standard_Transient &
	:rtype: Standard_Address
") ChangeFromKey1;
		Standard_Address ChangeFromKey1 (const Handle_Standard_Transient & K);
};


%extend TColStd_IndexedDataMapOfTransientTransient {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TColStd_IndexedMapNodeOfIndexedMapOfInteger;
class TColStd_IndexedMapNodeOfIndexedMapOfInteger : public TCollection_MapNode {
	public:
		%feature("compactdefaultargs") TColStd_IndexedMapNodeOfIndexedMapOfInteger;
		%feature("autodoc", "	:param K1:
	:type K1: int &
	:param K2:
	:type K2: int
	:param n1:
	:type n1: TCollection_MapNodePtr &
	:param n2:
	:type n2: TCollection_MapNodePtr &
	:rtype: None
") TColStd_IndexedMapNodeOfIndexedMapOfInteger;
		 TColStd_IndexedMapNodeOfIndexedMapOfInteger (const Standard_Integer & K1,const Standard_Integer K2,const TCollection_MapNodePtr & n1,const TCollection_MapNodePtr & n2);

            %feature("autodoc","1");
            %extend {
                Standard_Integer GetKey1() {
                return (Standard_Integer) $self->Key1();
                }
            };
            %feature("autodoc","1");
            %extend {
                void SetKey1(Standard_Integer value ) {
                $self->Key1()=value;
                }
            };
            
            %feature("autodoc","1");
            %extend {
                Standard_Integer GetKey2() {
                return (Standard_Integer) $self->Key2();
                }
            };
            %feature("autodoc","1");
            %extend {
                void SetKey2(Standard_Integer value ) {
                $self->Key2()=value;
                }
            };
            		%feature("compactdefaultargs") Next2;
		%feature("autodoc", "	:rtype: TCollection_MapNodePtr
") Next2;
		TCollection_MapNodePtr & Next2 ();
};


%extend TColStd_IndexedMapNodeOfIndexedMapOfInteger {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_TColStd_IndexedMapNodeOfIndexedMapOfInteger(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_TColStd_IndexedMapNodeOfIndexedMapOfInteger::Handle_TColStd_IndexedMapNodeOfIndexedMapOfInteger %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_TColStd_IndexedMapNodeOfIndexedMapOfInteger;
class Handle_TColStd_IndexedMapNodeOfIndexedMapOfInteger : public Handle_TCollection_MapNode {

    public:
        // constructors
        Handle_TColStd_IndexedMapNodeOfIndexedMapOfInteger();
        Handle_TColStd_IndexedMapNodeOfIndexedMapOfInteger(const Handle_TColStd_IndexedMapNodeOfIndexedMapOfInteger &aHandle);
        Handle_TColStd_IndexedMapNodeOfIndexedMapOfInteger(const TColStd_IndexedMapNodeOfIndexedMapOfInteger *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_TColStd_IndexedMapNodeOfIndexedMapOfInteger DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_TColStd_IndexedMapNodeOfIndexedMapOfInteger {
    TColStd_IndexedMapNodeOfIndexedMapOfInteger* _get_reference() {
    return (TColStd_IndexedMapNodeOfIndexedMapOfInteger*)$self->Access();
    }
};

%extend Handle_TColStd_IndexedMapNodeOfIndexedMapOfInteger {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend TColStd_IndexedMapNodeOfIndexedMapOfInteger {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TColStd_IndexedMapNodeOfIndexedMapOfReal;
class TColStd_IndexedMapNodeOfIndexedMapOfReal : public TCollection_MapNode {
	public:
		%feature("compactdefaultargs") TColStd_IndexedMapNodeOfIndexedMapOfReal;
		%feature("autodoc", "	:param K1:
	:type K1: float &
	:param K2:
	:type K2: int
	:param n1:
	:type n1: TCollection_MapNodePtr &
	:param n2:
	:type n2: TCollection_MapNodePtr &
	:rtype: None
") TColStd_IndexedMapNodeOfIndexedMapOfReal;
		 TColStd_IndexedMapNodeOfIndexedMapOfReal (const Standard_Real & K1,const Standard_Integer K2,const TCollection_MapNodePtr & n1,const TCollection_MapNodePtr & n2);

            %feature("autodoc","1");
            %extend {
                Standard_Real GetKey1() {
                return (Standard_Real) $self->Key1();
                }
            };
            %feature("autodoc","1");
            %extend {
                void SetKey1(Standard_Real value ) {
                $self->Key1()=value;
                }
            };
            
            %feature("autodoc","1");
            %extend {
                Standard_Integer GetKey2() {
                return (Standard_Integer) $self->Key2();
                }
            };
            %feature("autodoc","1");
            %extend {
                void SetKey2(Standard_Integer value ) {
                $self->Key2()=value;
                }
            };
            		%feature("compactdefaultargs") Next2;
		%feature("autodoc", "	:rtype: TCollection_MapNodePtr
") Next2;
		TCollection_MapNodePtr & Next2 ();
};


%extend TColStd_IndexedMapNodeOfIndexedMapOfReal {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_TColStd_IndexedMapNodeOfIndexedMapOfReal(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_TColStd_IndexedMapNodeOfIndexedMapOfReal::Handle_TColStd_IndexedMapNodeOfIndexedMapOfReal %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_TColStd_IndexedMapNodeOfIndexedMapOfReal;
class Handle_TColStd_IndexedMapNodeOfIndexedMapOfReal : public Handle_TCollection_MapNode {

    public:
        // constructors
        Handle_TColStd_IndexedMapNodeOfIndexedMapOfReal();
        Handle_TColStd_IndexedMapNodeOfIndexedMapOfReal(const Handle_TColStd_IndexedMapNodeOfIndexedMapOfReal &aHandle);
        Handle_TColStd_IndexedMapNodeOfIndexedMapOfReal(const TColStd_IndexedMapNodeOfIndexedMapOfReal *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_TColStd_IndexedMapNodeOfIndexedMapOfReal DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_TColStd_IndexedMapNodeOfIndexedMapOfReal {
    TColStd_IndexedMapNodeOfIndexedMapOfReal* _get_reference() {
    return (TColStd_IndexedMapNodeOfIndexedMapOfReal*)$self->Access();
    }
};

%extend Handle_TColStd_IndexedMapNodeOfIndexedMapOfReal {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend TColStd_IndexedMapNodeOfIndexedMapOfReal {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TColStd_IndexedMapNodeOfIndexedMapOfTransient;
class TColStd_IndexedMapNodeOfIndexedMapOfTransient : public TCollection_MapNode {
	public:
		%feature("compactdefaultargs") TColStd_IndexedMapNodeOfIndexedMapOfTransient;
		%feature("autodoc", "	:param K1:
	:type K1: Handle_Standard_Transient &
	:param K2:
	:type K2: int
	:param n1:
	:type n1: TCollection_MapNodePtr &
	:param n2:
	:type n2: TCollection_MapNodePtr &
	:rtype: None
") TColStd_IndexedMapNodeOfIndexedMapOfTransient;
		 TColStd_IndexedMapNodeOfIndexedMapOfTransient (const Handle_Standard_Transient & K1,const Standard_Integer K2,const TCollection_MapNodePtr & n1,const TCollection_MapNodePtr & n2);
		%feature("compactdefaultargs") Key1;
		%feature("autodoc", "	:rtype: Handle_Standard_Transient
") Key1;
		Handle_Standard_Transient Key1 ();

            %feature("autodoc","1");
            %extend {
                Standard_Integer GetKey2() {
                return (Standard_Integer) $self->Key2();
                }
            };
            %feature("autodoc","1");
            %extend {
                void SetKey2(Standard_Integer value ) {
                $self->Key2()=value;
                }
            };
            		%feature("compactdefaultargs") Next2;
		%feature("autodoc", "	:rtype: TCollection_MapNodePtr
") Next2;
		TCollection_MapNodePtr & Next2 ();
};


%extend TColStd_IndexedMapNodeOfIndexedMapOfTransient {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_TColStd_IndexedMapNodeOfIndexedMapOfTransient(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_TColStd_IndexedMapNodeOfIndexedMapOfTransient::Handle_TColStd_IndexedMapNodeOfIndexedMapOfTransient %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_TColStd_IndexedMapNodeOfIndexedMapOfTransient;
class Handle_TColStd_IndexedMapNodeOfIndexedMapOfTransient : public Handle_TCollection_MapNode {

    public:
        // constructors
        Handle_TColStd_IndexedMapNodeOfIndexedMapOfTransient();
        Handle_TColStd_IndexedMapNodeOfIndexedMapOfTransient(const Handle_TColStd_IndexedMapNodeOfIndexedMapOfTransient &aHandle);
        Handle_TColStd_IndexedMapNodeOfIndexedMapOfTransient(const TColStd_IndexedMapNodeOfIndexedMapOfTransient *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_TColStd_IndexedMapNodeOfIndexedMapOfTransient DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_TColStd_IndexedMapNodeOfIndexedMapOfTransient {
    TColStd_IndexedMapNodeOfIndexedMapOfTransient* _get_reference() {
    return (TColStd_IndexedMapNodeOfIndexedMapOfTransient*)$self->Access();
    }
};

%extend Handle_TColStd_IndexedMapNodeOfIndexedMapOfTransient {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend TColStd_IndexedMapNodeOfIndexedMapOfTransient {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TColStd_IndexedMapOfInteger;
class TColStd_IndexedMapOfInteger : public TCollection_BasicMap {
	public:
		%feature("compactdefaultargs") TColStd_IndexedMapOfInteger;
		%feature("autodoc", "	:param NbBuckets: default value is 1
	:type NbBuckets: int
	:rtype: None
") TColStd_IndexedMapOfInteger;
		 TColStd_IndexedMapOfInteger (const Standard_Integer NbBuckets = 1);
		%feature("compactdefaultargs") TColStd_IndexedMapOfInteger;
		%feature("autodoc", "	:param Other:
	:type Other: TColStd_IndexedMapOfInteger &
	:rtype: None
") TColStd_IndexedMapOfInteger;
		 TColStd_IndexedMapOfInteger (const TColStd_IndexedMapOfInteger & Other);
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: TColStd_IndexedMapOfInteger &
	:rtype: TColStd_IndexedMapOfInteger
") Assign;
		TColStd_IndexedMapOfInteger & Assign (const TColStd_IndexedMapOfInteger & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: TColStd_IndexedMapOfInteger &
	:rtype: TColStd_IndexedMapOfInteger
") operator =;
		TColStd_IndexedMapOfInteger & operator = (const TColStd_IndexedMapOfInteger & Other);
		%feature("compactdefaultargs") ReSize;
		%feature("autodoc", "	:param NbBuckets:
	:type NbBuckets: int
	:rtype: None
") ReSize;
		void ReSize (const Standard_Integer NbBuckets);
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "	:param K:
	:type K: int &
	:rtype: int
") Add;
		Standard_Integer Add (const Standard_Integer & K);
		%feature("compactdefaultargs") Substitute;
		%feature("autodoc", "	:param I:
	:type I: int
	:param K:
	:type K: int &
	:rtype: None
") Substitute;
		void Substitute (const Standard_Integer I,const Standard_Integer & K);
		%feature("compactdefaultargs") RemoveLast;
		%feature("autodoc", "	:rtype: None
") RemoveLast;
		void RemoveLast ();
		%feature("compactdefaultargs") Contains;
		%feature("autodoc", "	:param K:
	:type K: int &
	:rtype: bool
") Contains;
		Standard_Boolean Contains (const Standard_Integer & K);
		%feature("compactdefaultargs") FindKey;
		%feature("autodoc", "	:param I:
	:type I: int
	:rtype: int
") FindKey;
		const Standard_Integer & FindKey (const Standard_Integer I);
		%feature("compactdefaultargs") FindIndex;
		%feature("autodoc", "	:param K:
	:type K: int &
	:rtype: int
") FindIndex;
		Standard_Integer FindIndex (const Standard_Integer & K);
};


%extend TColStd_IndexedMapOfInteger {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TColStd_IndexedMapOfReal;
class TColStd_IndexedMapOfReal : public TCollection_BasicMap {
	public:
		%feature("compactdefaultargs") TColStd_IndexedMapOfReal;
		%feature("autodoc", "	:param NbBuckets: default value is 1
	:type NbBuckets: int
	:rtype: None
") TColStd_IndexedMapOfReal;
		 TColStd_IndexedMapOfReal (const Standard_Integer NbBuckets = 1);
		%feature("compactdefaultargs") TColStd_IndexedMapOfReal;
		%feature("autodoc", "	:param Other:
	:type Other: TColStd_IndexedMapOfReal &
	:rtype: None
") TColStd_IndexedMapOfReal;
		 TColStd_IndexedMapOfReal (const TColStd_IndexedMapOfReal & Other);
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: TColStd_IndexedMapOfReal &
	:rtype: TColStd_IndexedMapOfReal
") Assign;
		TColStd_IndexedMapOfReal & Assign (const TColStd_IndexedMapOfReal & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: TColStd_IndexedMapOfReal &
	:rtype: TColStd_IndexedMapOfReal
") operator =;
		TColStd_IndexedMapOfReal & operator = (const TColStd_IndexedMapOfReal & Other);
		%feature("compactdefaultargs") ReSize;
		%feature("autodoc", "	:param NbBuckets:
	:type NbBuckets: int
	:rtype: None
") ReSize;
		void ReSize (const Standard_Integer NbBuckets);
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "	:param K:
	:type K: float &
	:rtype: int
") Add;
		Standard_Integer Add (const Standard_Real & K);
		%feature("compactdefaultargs") Substitute;
		%feature("autodoc", "	:param I:
	:type I: int
	:param K:
	:type K: float &
	:rtype: None
") Substitute;
		void Substitute (const Standard_Integer I,const Standard_Real & K);
		%feature("compactdefaultargs") RemoveLast;
		%feature("autodoc", "	:rtype: None
") RemoveLast;
		void RemoveLast ();
		%feature("compactdefaultargs") Contains;
		%feature("autodoc", "	:param K:
	:type K: float &
	:rtype: bool
") Contains;
		Standard_Boolean Contains (const Standard_Real & K);
		%feature("compactdefaultargs") FindKey;
		%feature("autodoc", "	:param I:
	:type I: int
	:rtype: float
") FindKey;
		const Standard_Real & FindKey (const Standard_Integer I);
		%feature("compactdefaultargs") FindIndex;
		%feature("autodoc", "	:param K:
	:type K: float &
	:rtype: int
") FindIndex;
		Standard_Integer FindIndex (const Standard_Real & K);
};


%extend TColStd_IndexedMapOfReal {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TColStd_IndexedMapOfTransient;
class TColStd_IndexedMapOfTransient : public TCollection_BasicMap {
	public:
		%feature("compactdefaultargs") TColStd_IndexedMapOfTransient;
		%feature("autodoc", "	:param NbBuckets: default value is 1
	:type NbBuckets: int
	:rtype: None
") TColStd_IndexedMapOfTransient;
		 TColStd_IndexedMapOfTransient (const Standard_Integer NbBuckets = 1);
		%feature("compactdefaultargs") TColStd_IndexedMapOfTransient;
		%feature("autodoc", "	:param Other:
	:type Other: TColStd_IndexedMapOfTransient &
	:rtype: None
") TColStd_IndexedMapOfTransient;
		 TColStd_IndexedMapOfTransient (const TColStd_IndexedMapOfTransient & Other);
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: TColStd_IndexedMapOfTransient &
	:rtype: TColStd_IndexedMapOfTransient
") Assign;
		TColStd_IndexedMapOfTransient & Assign (const TColStd_IndexedMapOfTransient & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: TColStd_IndexedMapOfTransient &
	:rtype: TColStd_IndexedMapOfTransient
") operator =;
		TColStd_IndexedMapOfTransient & operator = (const TColStd_IndexedMapOfTransient & Other);
		%feature("compactdefaultargs") ReSize;
		%feature("autodoc", "	:param NbBuckets:
	:type NbBuckets: int
	:rtype: None
") ReSize;
		void ReSize (const Standard_Integer NbBuckets);
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "	:param K:
	:type K: Handle_Standard_Transient &
	:rtype: int
") Add;
		Standard_Integer Add (const Handle_Standard_Transient & K);
		%feature("compactdefaultargs") Substitute;
		%feature("autodoc", "	:param I:
	:type I: int
	:param K:
	:type K: Handle_Standard_Transient &
	:rtype: None
") Substitute;
		void Substitute (const Standard_Integer I,const Handle_Standard_Transient & K);
		%feature("compactdefaultargs") RemoveLast;
		%feature("autodoc", "	:rtype: None
") RemoveLast;
		void RemoveLast ();
		%feature("compactdefaultargs") Contains;
		%feature("autodoc", "	:param K:
	:type K: Handle_Standard_Transient &
	:rtype: bool
") Contains;
		Standard_Boolean Contains (const Handle_Standard_Transient & K);
		%feature("compactdefaultargs") FindKey;
		%feature("autodoc", "	:param I:
	:type I: int
	:rtype: Handle_Standard_Transient
") FindKey;
		Handle_Standard_Transient FindKey (const Standard_Integer I);
		%feature("compactdefaultargs") FindIndex;
		%feature("autodoc", "	:param K:
	:type K: Handle_Standard_Transient &
	:rtype: int
") FindIndex;
		Standard_Integer FindIndex (const Handle_Standard_Transient & K);
};


%extend TColStd_IndexedMapOfTransient {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TColStd_ListIteratorOfListOfAsciiString;
class TColStd_ListIteratorOfListOfAsciiString {
	public:
		%feature("compactdefaultargs") TColStd_ListIteratorOfListOfAsciiString;
		%feature("autodoc", "	:rtype: None
") TColStd_ListIteratorOfListOfAsciiString;
		 TColStd_ListIteratorOfListOfAsciiString ();
		%feature("compactdefaultargs") TColStd_ListIteratorOfListOfAsciiString;
		%feature("autodoc", "	:param L:
	:type L: TColStd_ListOfAsciiString &
	:rtype: None
") TColStd_ListIteratorOfListOfAsciiString;
		 TColStd_ListIteratorOfListOfAsciiString (const TColStd_ListOfAsciiString & L);
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "	:param L:
	:type L: TColStd_ListOfAsciiString &
	:rtype: None
") Initialize;
		void Initialize (const TColStd_ListOfAsciiString & L);
		%feature("compactdefaultargs") More;
		%feature("autodoc", "	:rtype: bool
") More;
		Standard_Boolean More ();
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "	:rtype: None
") Next;
		void Next ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: TCollection_AsciiString
") Value;
		TCollection_AsciiString & Value ();
};


%extend TColStd_ListIteratorOfListOfAsciiString {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TColStd_ListIteratorOfListOfInteger;
class TColStd_ListIteratorOfListOfInteger {
	public:
		%feature("compactdefaultargs") TColStd_ListIteratorOfListOfInteger;
		%feature("autodoc", "	:rtype: None
") TColStd_ListIteratorOfListOfInteger;
		 TColStd_ListIteratorOfListOfInteger ();
		%feature("compactdefaultargs") TColStd_ListIteratorOfListOfInteger;
		%feature("autodoc", "	:param L:
	:type L: TColStd_ListOfInteger &
	:rtype: None
") TColStd_ListIteratorOfListOfInteger;
		 TColStd_ListIteratorOfListOfInteger (const TColStd_ListOfInteger & L);
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "	:param L:
	:type L: TColStd_ListOfInteger &
	:rtype: None
") Initialize;
		void Initialize (const TColStd_ListOfInteger & L);
		%feature("compactdefaultargs") More;
		%feature("autodoc", "	:rtype: bool
") More;
		Standard_Boolean More ();
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "	:rtype: None
") Next;
		void Next ();

            %feature("autodoc","1");
            %extend {
                Standard_Integer GetValue() {
                return (Standard_Integer) $self->Value();
                }
            };
            %feature("autodoc","1");
            %extend {
                void SetValue(Standard_Integer value ) {
                $self->Value()=value;
                }
            };
            };


%extend TColStd_ListIteratorOfListOfInteger {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TColStd_ListIteratorOfListOfReal;
class TColStd_ListIteratorOfListOfReal {
	public:
		%feature("compactdefaultargs") TColStd_ListIteratorOfListOfReal;
		%feature("autodoc", "	:rtype: None
") TColStd_ListIteratorOfListOfReal;
		 TColStd_ListIteratorOfListOfReal ();
		%feature("compactdefaultargs") TColStd_ListIteratorOfListOfReal;
		%feature("autodoc", "	:param L:
	:type L: TColStd_ListOfReal &
	:rtype: None
") TColStd_ListIteratorOfListOfReal;
		 TColStd_ListIteratorOfListOfReal (const TColStd_ListOfReal & L);
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "	:param L:
	:type L: TColStd_ListOfReal &
	:rtype: None
") Initialize;
		void Initialize (const TColStd_ListOfReal & L);
		%feature("compactdefaultargs") More;
		%feature("autodoc", "	:rtype: bool
") More;
		Standard_Boolean More ();
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "	:rtype: None
") Next;
		void Next ();

            %feature("autodoc","1");
            %extend {
                Standard_Real GetValue() {
                return (Standard_Real) $self->Value();
                }
            };
            %feature("autodoc","1");
            %extend {
                void SetValue(Standard_Real value ) {
                $self->Value()=value;
                }
            };
            };


%extend TColStd_ListIteratorOfListOfReal {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TColStd_ListIteratorOfListOfTransient;
class TColStd_ListIteratorOfListOfTransient {
	public:
		%feature("compactdefaultargs") TColStd_ListIteratorOfListOfTransient;
		%feature("autodoc", "	:rtype: None
") TColStd_ListIteratorOfListOfTransient;
		 TColStd_ListIteratorOfListOfTransient ();
		%feature("compactdefaultargs") TColStd_ListIteratorOfListOfTransient;
		%feature("autodoc", "	:param L:
	:type L: TColStd_ListOfTransient &
	:rtype: None
") TColStd_ListIteratorOfListOfTransient;
		 TColStd_ListIteratorOfListOfTransient (const TColStd_ListOfTransient & L);
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "	:param L:
	:type L: TColStd_ListOfTransient &
	:rtype: None
") Initialize;
		void Initialize (const TColStd_ListOfTransient & L);
		%feature("compactdefaultargs") More;
		%feature("autodoc", "	:rtype: bool
") More;
		Standard_Boolean More ();
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "	:rtype: None
") Next;
		void Next ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: Handle_Standard_Transient
") Value;
		Handle_Standard_Transient Value ();
};


%extend TColStd_ListIteratorOfListOfTransient {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TColStd_ListNodeOfListOfAsciiString;
class TColStd_ListNodeOfListOfAsciiString : public TCollection_MapNode {
	public:
		%feature("compactdefaultargs") TColStd_ListNodeOfListOfAsciiString;
		%feature("autodoc", "	:param I:
	:type I: TCollection_AsciiString &
	:param n:
	:type n: TCollection_MapNodePtr &
	:rtype: None
") TColStd_ListNodeOfListOfAsciiString;
		 TColStd_ListNodeOfListOfAsciiString (const TCollection_AsciiString & I,const TCollection_MapNodePtr & n);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: TCollection_AsciiString
") Value;
		TCollection_AsciiString & Value ();
};


%extend TColStd_ListNodeOfListOfAsciiString {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_TColStd_ListNodeOfListOfAsciiString(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_TColStd_ListNodeOfListOfAsciiString::Handle_TColStd_ListNodeOfListOfAsciiString %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_TColStd_ListNodeOfListOfAsciiString;
class Handle_TColStd_ListNodeOfListOfAsciiString : public Handle_TCollection_MapNode {

    public:
        // constructors
        Handle_TColStd_ListNodeOfListOfAsciiString();
        Handle_TColStd_ListNodeOfListOfAsciiString(const Handle_TColStd_ListNodeOfListOfAsciiString &aHandle);
        Handle_TColStd_ListNodeOfListOfAsciiString(const TColStd_ListNodeOfListOfAsciiString *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_TColStd_ListNodeOfListOfAsciiString DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_TColStd_ListNodeOfListOfAsciiString {
    TColStd_ListNodeOfListOfAsciiString* _get_reference() {
    return (TColStd_ListNodeOfListOfAsciiString*)$self->Access();
    }
};

%extend Handle_TColStd_ListNodeOfListOfAsciiString {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend TColStd_ListNodeOfListOfAsciiString {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TColStd_ListNodeOfListOfInteger;
class TColStd_ListNodeOfListOfInteger : public TCollection_MapNode {
	public:
		%feature("compactdefaultargs") TColStd_ListNodeOfListOfInteger;
		%feature("autodoc", "	:param I:
	:type I: int &
	:param n:
	:type n: TCollection_MapNodePtr &
	:rtype: None
") TColStd_ListNodeOfListOfInteger;
		 TColStd_ListNodeOfListOfInteger (const Standard_Integer & I,const TCollection_MapNodePtr & n);

            %feature("autodoc","1");
            %extend {
                Standard_Integer GetValue() {
                return (Standard_Integer) $self->Value();
                }
            };
            %feature("autodoc","1");
            %extend {
                void SetValue(Standard_Integer value ) {
                $self->Value()=value;
                }
            };
            };


%extend TColStd_ListNodeOfListOfInteger {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_TColStd_ListNodeOfListOfInteger(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_TColStd_ListNodeOfListOfInteger::Handle_TColStd_ListNodeOfListOfInteger %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_TColStd_ListNodeOfListOfInteger;
class Handle_TColStd_ListNodeOfListOfInteger : public Handle_TCollection_MapNode {

    public:
        // constructors
        Handle_TColStd_ListNodeOfListOfInteger();
        Handle_TColStd_ListNodeOfListOfInteger(const Handle_TColStd_ListNodeOfListOfInteger &aHandle);
        Handle_TColStd_ListNodeOfListOfInteger(const TColStd_ListNodeOfListOfInteger *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_TColStd_ListNodeOfListOfInteger DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_TColStd_ListNodeOfListOfInteger {
    TColStd_ListNodeOfListOfInteger* _get_reference() {
    return (TColStd_ListNodeOfListOfInteger*)$self->Access();
    }
};

%extend Handle_TColStd_ListNodeOfListOfInteger {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend TColStd_ListNodeOfListOfInteger {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TColStd_ListNodeOfListOfReal;
class TColStd_ListNodeOfListOfReal : public TCollection_MapNode {
	public:
		%feature("compactdefaultargs") TColStd_ListNodeOfListOfReal;
		%feature("autodoc", "	:param I:
	:type I: float &
	:param n:
	:type n: TCollection_MapNodePtr &
	:rtype: None
") TColStd_ListNodeOfListOfReal;
		 TColStd_ListNodeOfListOfReal (const Standard_Real & I,const TCollection_MapNodePtr & n);

            %feature("autodoc","1");
            %extend {
                Standard_Real GetValue() {
                return (Standard_Real) $self->Value();
                }
            };
            %feature("autodoc","1");
            %extend {
                void SetValue(Standard_Real value ) {
                $self->Value()=value;
                }
            };
            };


%extend TColStd_ListNodeOfListOfReal {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_TColStd_ListNodeOfListOfReal(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_TColStd_ListNodeOfListOfReal::Handle_TColStd_ListNodeOfListOfReal %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_TColStd_ListNodeOfListOfReal;
class Handle_TColStd_ListNodeOfListOfReal : public Handle_TCollection_MapNode {

    public:
        // constructors
        Handle_TColStd_ListNodeOfListOfReal();
        Handle_TColStd_ListNodeOfListOfReal(const Handle_TColStd_ListNodeOfListOfReal &aHandle);
        Handle_TColStd_ListNodeOfListOfReal(const TColStd_ListNodeOfListOfReal *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_TColStd_ListNodeOfListOfReal DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_TColStd_ListNodeOfListOfReal {
    TColStd_ListNodeOfListOfReal* _get_reference() {
    return (TColStd_ListNodeOfListOfReal*)$self->Access();
    }
};

%extend Handle_TColStd_ListNodeOfListOfReal {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend TColStd_ListNodeOfListOfReal {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TColStd_ListNodeOfListOfTransient;
class TColStd_ListNodeOfListOfTransient : public TCollection_MapNode {
	public:
		%feature("compactdefaultargs") TColStd_ListNodeOfListOfTransient;
		%feature("autodoc", "	:param I:
	:type I: Handle_Standard_Transient &
	:param n:
	:type n: TCollection_MapNodePtr &
	:rtype: None
") TColStd_ListNodeOfListOfTransient;
		 TColStd_ListNodeOfListOfTransient (const Handle_Standard_Transient & I,const TCollection_MapNodePtr & n);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: Handle_Standard_Transient
") Value;
		Handle_Standard_Transient Value ();
};


%extend TColStd_ListNodeOfListOfTransient {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_TColStd_ListNodeOfListOfTransient(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_TColStd_ListNodeOfListOfTransient::Handle_TColStd_ListNodeOfListOfTransient %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_TColStd_ListNodeOfListOfTransient;
class Handle_TColStd_ListNodeOfListOfTransient : public Handle_TCollection_MapNode {

    public:
        // constructors
        Handle_TColStd_ListNodeOfListOfTransient();
        Handle_TColStd_ListNodeOfListOfTransient(const Handle_TColStd_ListNodeOfListOfTransient &aHandle);
        Handle_TColStd_ListNodeOfListOfTransient(const TColStd_ListNodeOfListOfTransient *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_TColStd_ListNodeOfListOfTransient DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_TColStd_ListNodeOfListOfTransient {
    TColStd_ListNodeOfListOfTransient* _get_reference() {
    return (TColStd_ListNodeOfListOfTransient*)$self->Access();
    }
};

%extend Handle_TColStd_ListNodeOfListOfTransient {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend TColStd_ListNodeOfListOfTransient {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TColStd_ListOfAsciiString;
class TColStd_ListOfAsciiString {
	public:
		%feature("compactdefaultargs") TColStd_ListOfAsciiString;
		%feature("autodoc", "	:rtype: None
") TColStd_ListOfAsciiString;
		 TColStd_ListOfAsciiString ();
		%feature("compactdefaultargs") TColStd_ListOfAsciiString;
		%feature("autodoc", "	:param Other:
	:type Other: TColStd_ListOfAsciiString &
	:rtype: None
") TColStd_ListOfAsciiString;
		 TColStd_ListOfAsciiString (const TColStd_ListOfAsciiString & Other);
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: TColStd_ListOfAsciiString &
	:rtype: None
") Assign;
		void Assign (const TColStd_ListOfAsciiString & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: TColStd_ListOfAsciiString &
	:rtype: None
") operator =;
		void operator = (const TColStd_ListOfAsciiString & Other);
		%feature("compactdefaultargs") Extent;
		%feature("autodoc", "	:rtype: int
") Extent;
		Standard_Integer Extent ();
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "	:rtype: bool
") IsEmpty;
		Standard_Boolean IsEmpty ();
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param I:
	:type I: TCollection_AsciiString &
	:rtype: None
") Prepend;
		void Prepend (const TCollection_AsciiString & I);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param I:
	:type I: TCollection_AsciiString &
	:param theIt:
	:type theIt: TColStd_ListIteratorOfListOfAsciiString &
	:rtype: None
") Prepend;
		void Prepend (const TCollection_AsciiString & I,TColStd_ListIteratorOfListOfAsciiString & theIt);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param Other:
	:type Other: TColStd_ListOfAsciiString &
	:rtype: None
") Prepend;
		void Prepend (TColStd_ListOfAsciiString & Other);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param I:
	:type I: TCollection_AsciiString &
	:rtype: None
") Append;
		void Append (const TCollection_AsciiString & I);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param I:
	:type I: TCollection_AsciiString &
	:param theIt:
	:type theIt: TColStd_ListIteratorOfListOfAsciiString &
	:rtype: None
") Append;
		void Append (const TCollection_AsciiString & I,TColStd_ListIteratorOfListOfAsciiString & theIt);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param Other:
	:type Other: TColStd_ListOfAsciiString &
	:rtype: None
") Append;
		void Append (TColStd_ListOfAsciiString & Other);
		%feature("compactdefaultargs") First;
		%feature("autodoc", "	:rtype: TCollection_AsciiString
") First;
		TCollection_AsciiString & First ();
		%feature("compactdefaultargs") Last;
		%feature("autodoc", "	:rtype: TCollection_AsciiString
") Last;
		TCollection_AsciiString & Last ();
		%feature("compactdefaultargs") RemoveFirst;
		%feature("autodoc", "	:rtype: None
") RemoveFirst;
		void RemoveFirst ();
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	:param It:
	:type It: TColStd_ListIteratorOfListOfAsciiString &
	:rtype: None
") Remove;
		void Remove (TColStd_ListIteratorOfListOfAsciiString & It);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param I:
	:type I: TCollection_AsciiString &
	:param It:
	:type It: TColStd_ListIteratorOfListOfAsciiString &
	:rtype: None
") InsertBefore;
		void InsertBefore (const TCollection_AsciiString & I,TColStd_ListIteratorOfListOfAsciiString & It);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param Other:
	:type Other: TColStd_ListOfAsciiString &
	:param It:
	:type It: TColStd_ListIteratorOfListOfAsciiString &
	:rtype: None
") InsertBefore;
		void InsertBefore (TColStd_ListOfAsciiString & Other,TColStd_ListIteratorOfListOfAsciiString & It);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param I:
	:type I: TCollection_AsciiString &
	:param It:
	:type It: TColStd_ListIteratorOfListOfAsciiString &
	:rtype: None
") InsertAfter;
		void InsertAfter (const TCollection_AsciiString & I,TColStd_ListIteratorOfListOfAsciiString & It);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param Other:
	:type Other: TColStd_ListOfAsciiString &
	:param It:
	:type It: TColStd_ListIteratorOfListOfAsciiString &
	:rtype: None
") InsertAfter;
		void InsertAfter (TColStd_ListOfAsciiString & Other,TColStd_ListIteratorOfListOfAsciiString & It);
};


%extend TColStd_ListOfAsciiString {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TColStd_ListOfInteger;
class TColStd_ListOfInteger {
	public:
		%feature("compactdefaultargs") TColStd_ListOfInteger;
		%feature("autodoc", "	:rtype: None
") TColStd_ListOfInteger;
		 TColStd_ListOfInteger ();
		%feature("compactdefaultargs") TColStd_ListOfInteger;
		%feature("autodoc", "	:param Other:
	:type Other: TColStd_ListOfInteger &
	:rtype: None
") TColStd_ListOfInteger;
		 TColStd_ListOfInteger (const TColStd_ListOfInteger & Other);
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: TColStd_ListOfInteger &
	:rtype: None
") Assign;
		void Assign (const TColStd_ListOfInteger & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: TColStd_ListOfInteger &
	:rtype: None
") operator =;
		void operator = (const TColStd_ListOfInteger & Other);
		%feature("compactdefaultargs") Extent;
		%feature("autodoc", "	:rtype: int
") Extent;
		Standard_Integer Extent ();
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "	:rtype: bool
") IsEmpty;
		Standard_Boolean IsEmpty ();
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param I:
	:type I: int &
	:rtype: None
") Prepend;
		void Prepend (const Standard_Integer & I);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param I:
	:type I: int &
	:param theIt:
	:type theIt: TColStd_ListIteratorOfListOfInteger &
	:rtype: None
") Prepend;
		void Prepend (const Standard_Integer & I,TColStd_ListIteratorOfListOfInteger & theIt);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param Other:
	:type Other: TColStd_ListOfInteger &
	:rtype: None
") Prepend;
		void Prepend (TColStd_ListOfInteger & Other);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param I:
	:type I: int &
	:rtype: None
") Append;
		void Append (const Standard_Integer & I);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param I:
	:type I: int &
	:param theIt:
	:type theIt: TColStd_ListIteratorOfListOfInteger &
	:rtype: None
") Append;
		void Append (const Standard_Integer & I,TColStd_ListIteratorOfListOfInteger & theIt);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param Other:
	:type Other: TColStd_ListOfInteger &
	:rtype: None
") Append;
		void Append (TColStd_ListOfInteger & Other);

            %feature("autodoc","1");
            %extend {
                Standard_Integer GetFirst() {
                return (Standard_Integer) $self->First();
                }
            };
            %feature("autodoc","1");
            %extend {
                void SetFirst(Standard_Integer value ) {
                $self->First()=value;
                }
            };
            
            %feature("autodoc","1");
            %extend {
                Standard_Integer GetLast() {
                return (Standard_Integer) $self->Last();
                }
            };
            %feature("autodoc","1");
            %extend {
                void SetLast(Standard_Integer value ) {
                $self->Last()=value;
                }
            };
            		%feature("compactdefaultargs") RemoveFirst;
		%feature("autodoc", "	:rtype: None
") RemoveFirst;
		void RemoveFirst ();
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	:param It:
	:type It: TColStd_ListIteratorOfListOfInteger &
	:rtype: None
") Remove;
		void Remove (TColStd_ListIteratorOfListOfInteger & It);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param I:
	:type I: int &
	:param It:
	:type It: TColStd_ListIteratorOfListOfInteger &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer & I,TColStd_ListIteratorOfListOfInteger & It);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param Other:
	:type Other: TColStd_ListOfInteger &
	:param It:
	:type It: TColStd_ListIteratorOfListOfInteger &
	:rtype: None
") InsertBefore;
		void InsertBefore (TColStd_ListOfInteger & Other,TColStd_ListIteratorOfListOfInteger & It);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param I:
	:type I: int &
	:param It:
	:type It: TColStd_ListIteratorOfListOfInteger &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer & I,TColStd_ListIteratorOfListOfInteger & It);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param Other:
	:type Other: TColStd_ListOfInteger &
	:param It:
	:type It: TColStd_ListIteratorOfListOfInteger &
	:rtype: None
") InsertAfter;
		void InsertAfter (TColStd_ListOfInteger & Other,TColStd_ListIteratorOfListOfInteger & It);
};


%extend TColStd_ListOfInteger {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TColStd_ListOfReal;
class TColStd_ListOfReal {
	public:
		%feature("compactdefaultargs") TColStd_ListOfReal;
		%feature("autodoc", "	:rtype: None
") TColStd_ListOfReal;
		 TColStd_ListOfReal ();
		%feature("compactdefaultargs") TColStd_ListOfReal;
		%feature("autodoc", "	:param Other:
	:type Other: TColStd_ListOfReal &
	:rtype: None
") TColStd_ListOfReal;
		 TColStd_ListOfReal (const TColStd_ListOfReal & Other);
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: TColStd_ListOfReal &
	:rtype: None
") Assign;
		void Assign (const TColStd_ListOfReal & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: TColStd_ListOfReal &
	:rtype: None
") operator =;
		void operator = (const TColStd_ListOfReal & Other);
		%feature("compactdefaultargs") Extent;
		%feature("autodoc", "	:rtype: int
") Extent;
		Standard_Integer Extent ();
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "	:rtype: bool
") IsEmpty;
		Standard_Boolean IsEmpty ();
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param I:
	:type I: float &
	:rtype: None
") Prepend;
		void Prepend (const Standard_Real & I);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param I:
	:type I: float &
	:param theIt:
	:type theIt: TColStd_ListIteratorOfListOfReal &
	:rtype: None
") Prepend;
		void Prepend (const Standard_Real & I,TColStd_ListIteratorOfListOfReal & theIt);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param Other:
	:type Other: TColStd_ListOfReal &
	:rtype: None
") Prepend;
		void Prepend (TColStd_ListOfReal & Other);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param I:
	:type I: float &
	:rtype: None
") Append;
		void Append (const Standard_Real & I);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param I:
	:type I: float &
	:param theIt:
	:type theIt: TColStd_ListIteratorOfListOfReal &
	:rtype: None
") Append;
		void Append (const Standard_Real & I,TColStd_ListIteratorOfListOfReal & theIt);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param Other:
	:type Other: TColStd_ListOfReal &
	:rtype: None
") Append;
		void Append (TColStd_ListOfReal & Other);

            %feature("autodoc","1");
            %extend {
                Standard_Real GetFirst() {
                return (Standard_Real) $self->First();
                }
            };
            %feature("autodoc","1");
            %extend {
                void SetFirst(Standard_Real value ) {
                $self->First()=value;
                }
            };
            
            %feature("autodoc","1");
            %extend {
                Standard_Real GetLast() {
                return (Standard_Real) $self->Last();
                }
            };
            %feature("autodoc","1");
            %extend {
                void SetLast(Standard_Real value ) {
                $self->Last()=value;
                }
            };
            		%feature("compactdefaultargs") RemoveFirst;
		%feature("autodoc", "	:rtype: None
") RemoveFirst;
		void RemoveFirst ();
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	:param It:
	:type It: TColStd_ListIteratorOfListOfReal &
	:rtype: None
") Remove;
		void Remove (TColStd_ListIteratorOfListOfReal & It);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param I:
	:type I: float &
	:param It:
	:type It: TColStd_ListIteratorOfListOfReal &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Real & I,TColStd_ListIteratorOfListOfReal & It);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param Other:
	:type Other: TColStd_ListOfReal &
	:param It:
	:type It: TColStd_ListIteratorOfListOfReal &
	:rtype: None
") InsertBefore;
		void InsertBefore (TColStd_ListOfReal & Other,TColStd_ListIteratorOfListOfReal & It);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param I:
	:type I: float &
	:param It:
	:type It: TColStd_ListIteratorOfListOfReal &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Real & I,TColStd_ListIteratorOfListOfReal & It);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param Other:
	:type Other: TColStd_ListOfReal &
	:param It:
	:type It: TColStd_ListIteratorOfListOfReal &
	:rtype: None
") InsertAfter;
		void InsertAfter (TColStd_ListOfReal & Other,TColStd_ListIteratorOfListOfReal & It);
};


%extend TColStd_ListOfReal {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TColStd_ListOfTransient;
class TColStd_ListOfTransient {
	public:
		%feature("compactdefaultargs") TColStd_ListOfTransient;
		%feature("autodoc", "	:rtype: None
") TColStd_ListOfTransient;
		 TColStd_ListOfTransient ();
		%feature("compactdefaultargs") TColStd_ListOfTransient;
		%feature("autodoc", "	:param Other:
	:type Other: TColStd_ListOfTransient &
	:rtype: None
") TColStd_ListOfTransient;
		 TColStd_ListOfTransient (const TColStd_ListOfTransient & Other);
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: TColStd_ListOfTransient &
	:rtype: None
") Assign;
		void Assign (const TColStd_ListOfTransient & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: TColStd_ListOfTransient &
	:rtype: None
") operator =;
		void operator = (const TColStd_ListOfTransient & Other);
		%feature("compactdefaultargs") Extent;
		%feature("autodoc", "	:rtype: int
") Extent;
		Standard_Integer Extent ();
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "	:rtype: bool
") IsEmpty;
		Standard_Boolean IsEmpty ();
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param I:
	:type I: Handle_Standard_Transient &
	:rtype: None
") Prepend;
		void Prepend (const Handle_Standard_Transient & I);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param I:
	:type I: Handle_Standard_Transient &
	:param theIt:
	:type theIt: TColStd_ListIteratorOfListOfTransient &
	:rtype: None
") Prepend;
		void Prepend (const Handle_Standard_Transient & I,TColStd_ListIteratorOfListOfTransient & theIt);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param Other:
	:type Other: TColStd_ListOfTransient &
	:rtype: None
") Prepend;
		void Prepend (TColStd_ListOfTransient & Other);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param I:
	:type I: Handle_Standard_Transient &
	:rtype: None
") Append;
		void Append (const Handle_Standard_Transient & I);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param I:
	:type I: Handle_Standard_Transient &
	:param theIt:
	:type theIt: TColStd_ListIteratorOfListOfTransient &
	:rtype: None
") Append;
		void Append (const Handle_Standard_Transient & I,TColStd_ListIteratorOfListOfTransient & theIt);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param Other:
	:type Other: TColStd_ListOfTransient &
	:rtype: None
") Append;
		void Append (TColStd_ListOfTransient & Other);
		%feature("compactdefaultargs") First;
		%feature("autodoc", "	:rtype: Handle_Standard_Transient
") First;
		Handle_Standard_Transient First ();
		%feature("compactdefaultargs") Last;
		%feature("autodoc", "	:rtype: Handle_Standard_Transient
") Last;
		Handle_Standard_Transient Last ();
		%feature("compactdefaultargs") RemoveFirst;
		%feature("autodoc", "	:rtype: None
") RemoveFirst;
		void RemoveFirst ();
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	:param It:
	:type It: TColStd_ListIteratorOfListOfTransient &
	:rtype: None
") Remove;
		void Remove (TColStd_ListIteratorOfListOfTransient & It);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param I:
	:type I: Handle_Standard_Transient &
	:param It:
	:type It: TColStd_ListIteratorOfListOfTransient &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Handle_Standard_Transient & I,TColStd_ListIteratorOfListOfTransient & It);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param Other:
	:type Other: TColStd_ListOfTransient &
	:param It:
	:type It: TColStd_ListIteratorOfListOfTransient &
	:rtype: None
") InsertBefore;
		void InsertBefore (TColStd_ListOfTransient & Other,TColStd_ListIteratorOfListOfTransient & It);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param I:
	:type I: Handle_Standard_Transient &
	:param It:
	:type It: TColStd_ListIteratorOfListOfTransient &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Handle_Standard_Transient & I,TColStd_ListIteratorOfListOfTransient & It);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param Other:
	:type Other: TColStd_ListOfTransient &
	:param It:
	:type It: TColStd_ListIteratorOfListOfTransient &
	:rtype: None
") InsertAfter;
		void InsertAfter (TColStd_ListOfTransient & Other,TColStd_ListIteratorOfListOfTransient & It);
};


%extend TColStd_ListOfTransient {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
class TColStd_MapIntegerHasher {
	public:
		%feature("compactdefaultargs") HashCode;
		%feature("autodoc", "	:param K:
	:type K: int &
	:param Upper:
	:type Upper: int
	:rtype: int
") HashCode;
		static Standard_Integer HashCode (const Standard_Integer & K,const Standard_Integer Upper);
		%feature("compactdefaultargs") IsEqual;
		%feature("autodoc", "	:param K1:
	:type K1: int &
	:param K2:
	:type K2: int &
	:rtype: bool
") IsEqual;
		static Standard_Boolean IsEqual (const Standard_Integer & K1,const Standard_Integer & K2);
};


%extend TColStd_MapIntegerHasher {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TColStd_MapIteratorOfMapOfAsciiString;
class TColStd_MapIteratorOfMapOfAsciiString : public TCollection_BasicMapIterator {
	public:
		%feature("compactdefaultargs") TColStd_MapIteratorOfMapOfAsciiString;
		%feature("autodoc", "	:rtype: None
") TColStd_MapIteratorOfMapOfAsciiString;
		 TColStd_MapIteratorOfMapOfAsciiString ();
		%feature("compactdefaultargs") TColStd_MapIteratorOfMapOfAsciiString;
		%feature("autodoc", "	:param aMap:
	:type aMap: TColStd_MapOfAsciiString &
	:rtype: None
") TColStd_MapIteratorOfMapOfAsciiString;
		 TColStd_MapIteratorOfMapOfAsciiString (const TColStd_MapOfAsciiString & aMap);
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "	:param aMap:
	:type aMap: TColStd_MapOfAsciiString &
	:rtype: None
") Initialize;
		void Initialize (const TColStd_MapOfAsciiString & aMap);
		%feature("compactdefaultargs") Key;
		%feature("autodoc", "	:rtype: TCollection_AsciiString
") Key;
		const TCollection_AsciiString & Key ();
};


%extend TColStd_MapIteratorOfMapOfAsciiString {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TColStd_MapIteratorOfMapOfInteger;
class TColStd_MapIteratorOfMapOfInteger : public TCollection_BasicMapIterator {
	public:
		%feature("compactdefaultargs") TColStd_MapIteratorOfMapOfInteger;
		%feature("autodoc", "	:rtype: None
") TColStd_MapIteratorOfMapOfInteger;
		 TColStd_MapIteratorOfMapOfInteger ();
		%feature("compactdefaultargs") TColStd_MapIteratorOfMapOfInteger;
		%feature("autodoc", "	:param aMap:
	:type aMap: TColStd_MapOfInteger &
	:rtype: None
") TColStd_MapIteratorOfMapOfInteger;
		 TColStd_MapIteratorOfMapOfInteger (const TColStd_MapOfInteger & aMap);
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "	:param aMap:
	:type aMap: TColStd_MapOfInteger &
	:rtype: None
") Initialize;
		void Initialize (const TColStd_MapOfInteger & aMap);
		%feature("compactdefaultargs") Key;
		%feature("autodoc", "	:rtype: int
") Key;
		const Standard_Integer & Key ();
};


%extend TColStd_MapIteratorOfMapOfInteger {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TColStd_MapIteratorOfMapOfReal;
class TColStd_MapIteratorOfMapOfReal : public TCollection_BasicMapIterator {
	public:
		%feature("compactdefaultargs") TColStd_MapIteratorOfMapOfReal;
		%feature("autodoc", "	:rtype: None
") TColStd_MapIteratorOfMapOfReal;
		 TColStd_MapIteratorOfMapOfReal ();
		%feature("compactdefaultargs") TColStd_MapIteratorOfMapOfReal;
		%feature("autodoc", "	:param aMap:
	:type aMap: TColStd_MapOfReal &
	:rtype: None
") TColStd_MapIteratorOfMapOfReal;
		 TColStd_MapIteratorOfMapOfReal (const TColStd_MapOfReal & aMap);
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "	:param aMap:
	:type aMap: TColStd_MapOfReal &
	:rtype: None
") Initialize;
		void Initialize (const TColStd_MapOfReal & aMap);
		%feature("compactdefaultargs") Key;
		%feature("autodoc", "	:rtype: float
") Key;
		const Standard_Real & Key ();
};


%extend TColStd_MapIteratorOfMapOfReal {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TColStd_MapIteratorOfMapOfTransient;
class TColStd_MapIteratorOfMapOfTransient : public TCollection_BasicMapIterator {
	public:
		%feature("compactdefaultargs") TColStd_MapIteratorOfMapOfTransient;
		%feature("autodoc", "	:rtype: None
") TColStd_MapIteratorOfMapOfTransient;
		 TColStd_MapIteratorOfMapOfTransient ();
		%feature("compactdefaultargs") TColStd_MapIteratorOfMapOfTransient;
		%feature("autodoc", "	:param aMap:
	:type aMap: TColStd_MapOfTransient &
	:rtype: None
") TColStd_MapIteratorOfMapOfTransient;
		 TColStd_MapIteratorOfMapOfTransient (const TColStd_MapOfTransient & aMap);
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "	:param aMap:
	:type aMap: TColStd_MapOfTransient &
	:rtype: None
") Initialize;
		void Initialize (const TColStd_MapOfTransient & aMap);
		%feature("compactdefaultargs") Key;
		%feature("autodoc", "	:rtype: Handle_Standard_Transient
") Key;
		Handle_Standard_Transient Key ();
};


%extend TColStd_MapIteratorOfMapOfTransient {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TColStd_MapIteratorOfPackedMapOfInteger;
class TColStd_MapIteratorOfPackedMapOfInteger : public TCollection_BasicMapIterator {
	public:
		%feature("compactdefaultargs") TColStd_MapIteratorOfPackedMapOfInteger;
		%feature("autodoc", "	* /// Empty Constructor.

	:rtype: None
") TColStd_MapIteratorOfPackedMapOfInteger;
		 TColStd_MapIteratorOfPackedMapOfInteger ();
		%feature("compactdefaultargs") TColStd_MapIteratorOfPackedMapOfInteger;
		%feature("autodoc", "	* /// Constructor.

	:param &:
	:type &: TColStd_PackedMapOfInteger
	:rtype: None
") TColStd_MapIteratorOfPackedMapOfInteger;
		 TColStd_MapIteratorOfPackedMapOfInteger (const TColStd_PackedMapOfInteger &);
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "	* /// Re-initialize with the same or another Map instance.

	:param &:
	:type &: TColStd_PackedMapOfInteger
	:rtype: None
") Initialize;
		void Initialize (const TColStd_PackedMapOfInteger &);
		%feature("compactdefaultargs") Reset;
		%feature("autodoc", "	* /// Restart the iteraton

	:rtype: None
") Reset;
		void Reset ();
		%feature("compactdefaultargs") Key;
		%feature("autodoc", "	* /// Query the iterated key. Defined in TColStd_PackedMapOfInteger.cxx

	:rtype: inline int
") Key;
		inline Standard_Integer Key ();
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "	* /// Increment the iterator

	:rtype: None
") Next;
		void Next ();
};


%extend TColStd_MapIteratorOfPackedMapOfInteger {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TColStd_MapOfAsciiString;
class TColStd_MapOfAsciiString : public TCollection_BasicMap {
	public:
		%feature("compactdefaultargs") TColStd_MapOfAsciiString;
		%feature("autodoc", "	:param NbBuckets: default value is 1
	:type NbBuckets: int
	:rtype: None
") TColStd_MapOfAsciiString;
		 TColStd_MapOfAsciiString (const Standard_Integer NbBuckets = 1);
		%feature("compactdefaultargs") TColStd_MapOfAsciiString;
		%feature("autodoc", "	:param Other:
	:type Other: TColStd_MapOfAsciiString &
	:rtype: None
") TColStd_MapOfAsciiString;
		 TColStd_MapOfAsciiString (const TColStd_MapOfAsciiString & Other);
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: TColStd_MapOfAsciiString &
	:rtype: TColStd_MapOfAsciiString
") Assign;
		TColStd_MapOfAsciiString & Assign (const TColStd_MapOfAsciiString & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: TColStd_MapOfAsciiString &
	:rtype: TColStd_MapOfAsciiString
") operator =;
		TColStd_MapOfAsciiString & operator = (const TColStd_MapOfAsciiString & Other);
		%feature("compactdefaultargs") ReSize;
		%feature("autodoc", "	:param NbBuckets:
	:type NbBuckets: int
	:rtype: None
") ReSize;
		void ReSize (const Standard_Integer NbBuckets);
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "	:param aKey:
	:type aKey: TCollection_AsciiString &
	:rtype: bool
") Add;
		Standard_Boolean Add (const TCollection_AsciiString & aKey);
		%feature("compactdefaultargs") Contains;
		%feature("autodoc", "	:param aKey:
	:type aKey: TCollection_AsciiString &
	:rtype: bool
") Contains;
		Standard_Boolean Contains (const TCollection_AsciiString & aKey);
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	:param aKey:
	:type aKey: TCollection_AsciiString &
	:rtype: bool
") Remove;
		Standard_Boolean Remove (const TCollection_AsciiString & aKey);
};


%extend TColStd_MapOfAsciiString {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TColStd_MapOfInteger;
class TColStd_MapOfInteger : public TCollection_BasicMap {
	public:
		%feature("compactdefaultargs") TColStd_MapOfInteger;
		%feature("autodoc", "	:param NbBuckets: default value is 1
	:type NbBuckets: int
	:rtype: None
") TColStd_MapOfInteger;
		 TColStd_MapOfInteger (const Standard_Integer NbBuckets = 1);
		%feature("compactdefaultargs") TColStd_MapOfInteger;
		%feature("autodoc", "	:param Other:
	:type Other: TColStd_MapOfInteger &
	:rtype: None
") TColStd_MapOfInteger;
		 TColStd_MapOfInteger (const TColStd_MapOfInteger & Other);
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: TColStd_MapOfInteger &
	:rtype: TColStd_MapOfInteger
") Assign;
		TColStd_MapOfInteger & Assign (const TColStd_MapOfInteger & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: TColStd_MapOfInteger &
	:rtype: TColStd_MapOfInteger
") operator =;
		TColStd_MapOfInteger & operator = (const TColStd_MapOfInteger & Other);
		%feature("compactdefaultargs") ReSize;
		%feature("autodoc", "	:param NbBuckets:
	:type NbBuckets: int
	:rtype: None
") ReSize;
		void ReSize (const Standard_Integer NbBuckets);
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "	:param aKey:
	:type aKey: int &
	:rtype: bool
") Add;
		Standard_Boolean Add (const Standard_Integer & aKey);
		%feature("compactdefaultargs") Contains;
		%feature("autodoc", "	:param aKey:
	:type aKey: int &
	:rtype: bool
") Contains;
		Standard_Boolean Contains (const Standard_Integer & aKey);
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	:param aKey:
	:type aKey: int &
	:rtype: bool
") Remove;
		Standard_Boolean Remove (const Standard_Integer & aKey);
};


%extend TColStd_MapOfInteger {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TColStd_MapOfReal;
class TColStd_MapOfReal : public TCollection_BasicMap {
	public:
		%feature("compactdefaultargs") TColStd_MapOfReal;
		%feature("autodoc", "	:param NbBuckets: default value is 1
	:type NbBuckets: int
	:rtype: None
") TColStd_MapOfReal;
		 TColStd_MapOfReal (const Standard_Integer NbBuckets = 1);
		%feature("compactdefaultargs") TColStd_MapOfReal;
		%feature("autodoc", "	:param Other:
	:type Other: TColStd_MapOfReal &
	:rtype: None
") TColStd_MapOfReal;
		 TColStd_MapOfReal (const TColStd_MapOfReal & Other);
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: TColStd_MapOfReal &
	:rtype: TColStd_MapOfReal
") Assign;
		TColStd_MapOfReal & Assign (const TColStd_MapOfReal & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: TColStd_MapOfReal &
	:rtype: TColStd_MapOfReal
") operator =;
		TColStd_MapOfReal & operator = (const TColStd_MapOfReal & Other);
		%feature("compactdefaultargs") ReSize;
		%feature("autodoc", "	:param NbBuckets:
	:type NbBuckets: int
	:rtype: None
") ReSize;
		void ReSize (const Standard_Integer NbBuckets);
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "	:param aKey:
	:type aKey: float &
	:rtype: bool
") Add;
		Standard_Boolean Add (const Standard_Real & aKey);
		%feature("compactdefaultargs") Contains;
		%feature("autodoc", "	:param aKey:
	:type aKey: float &
	:rtype: bool
") Contains;
		Standard_Boolean Contains (const Standard_Real & aKey);
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	:param aKey:
	:type aKey: float &
	:rtype: bool
") Remove;
		Standard_Boolean Remove (const Standard_Real & aKey);
};


%extend TColStd_MapOfReal {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TColStd_MapOfTransient;
class TColStd_MapOfTransient : public TCollection_BasicMap {
	public:
		%feature("compactdefaultargs") TColStd_MapOfTransient;
		%feature("autodoc", "	:param NbBuckets: default value is 1
	:type NbBuckets: int
	:rtype: None
") TColStd_MapOfTransient;
		 TColStd_MapOfTransient (const Standard_Integer NbBuckets = 1);
		%feature("compactdefaultargs") TColStd_MapOfTransient;
		%feature("autodoc", "	:param Other:
	:type Other: TColStd_MapOfTransient &
	:rtype: None
") TColStd_MapOfTransient;
		 TColStd_MapOfTransient (const TColStd_MapOfTransient & Other);
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: TColStd_MapOfTransient &
	:rtype: TColStd_MapOfTransient
") Assign;
		TColStd_MapOfTransient & Assign (const TColStd_MapOfTransient & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: TColStd_MapOfTransient &
	:rtype: TColStd_MapOfTransient
") operator =;
		TColStd_MapOfTransient & operator = (const TColStd_MapOfTransient & Other);
		%feature("compactdefaultargs") ReSize;
		%feature("autodoc", "	:param NbBuckets:
	:type NbBuckets: int
	:rtype: None
") ReSize;
		void ReSize (const Standard_Integer NbBuckets);
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "	:param aKey:
	:type aKey: Handle_Standard_Transient &
	:rtype: bool
") Add;
		Standard_Boolean Add (const Handle_Standard_Transient & aKey);
		%feature("compactdefaultargs") Contains;
		%feature("autodoc", "	:param aKey:
	:type aKey: Handle_Standard_Transient &
	:rtype: bool
") Contains;
		Standard_Boolean Contains (const Handle_Standard_Transient & aKey);
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	:param aKey:
	:type aKey: Handle_Standard_Transient &
	:rtype: bool
") Remove;
		Standard_Boolean Remove (const Handle_Standard_Transient & aKey);
};


%extend TColStd_MapOfTransient {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
class TColStd_MapRealHasher {
	public:
		%feature("compactdefaultargs") HashCode;
		%feature("autodoc", "	:param K:
	:type K: float &
	:param Upper:
	:type Upper: int
	:rtype: int
") HashCode;
		static Standard_Integer HashCode (const Standard_Real & K,const Standard_Integer Upper);
		%feature("compactdefaultargs") IsEqual;
		%feature("autodoc", "	:param K1:
	:type K1: float &
	:param K2:
	:type K2: float &
	:rtype: bool
") IsEqual;
		static Standard_Boolean IsEqual (const Standard_Real & K1,const Standard_Real & K2);
};


%extend TColStd_MapRealHasher {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
class TColStd_MapTransientHasher {
	public:
		%feature("compactdefaultargs") HashCode;
		%feature("autodoc", "	:param K:
	:type K: Handle_Standard_Transient &
	:param Upper:
	:type Upper: int
	:rtype: int
") HashCode;
		static Standard_Integer HashCode (const Handle_Standard_Transient & K,const Standard_Integer Upper);
		%feature("compactdefaultargs") IsEqual;
		%feature("autodoc", "	:param K1:
	:type K1: Handle_Standard_Transient &
	:param K2:
	:type K2: Handle_Standard_Transient &
	:rtype: bool
") IsEqual;
		static Standard_Boolean IsEqual (const Handle_Standard_Transient & K1,const Handle_Standard_Transient & K2);
};


%extend TColStd_MapTransientHasher {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TColStd_SequenceNodeOfSequenceOfAddress;
class TColStd_SequenceNodeOfSequenceOfAddress : public TCollection_SeqNode {
	public:
		%feature("compactdefaultargs") TColStd_SequenceNodeOfSequenceOfAddress;
		%feature("autodoc", "	:param I:
	:type I: Standard_Address &
	:param n:
	:type n: TCollection_SeqNodePtr &
	:param p:
	:type p: TCollection_SeqNodePtr &
	:rtype: None
") TColStd_SequenceNodeOfSequenceOfAddress;
		 TColStd_SequenceNodeOfSequenceOfAddress (const Standard_Address & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: Standard_Address
") Value;
		Standard_Address & Value ();
};


%extend TColStd_SequenceNodeOfSequenceOfAddress {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_TColStd_SequenceNodeOfSequenceOfAddress(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_TColStd_SequenceNodeOfSequenceOfAddress::Handle_TColStd_SequenceNodeOfSequenceOfAddress %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_TColStd_SequenceNodeOfSequenceOfAddress;
class Handle_TColStd_SequenceNodeOfSequenceOfAddress : public Handle_TCollection_SeqNode {

    public:
        // constructors
        Handle_TColStd_SequenceNodeOfSequenceOfAddress();
        Handle_TColStd_SequenceNodeOfSequenceOfAddress(const Handle_TColStd_SequenceNodeOfSequenceOfAddress &aHandle);
        Handle_TColStd_SequenceNodeOfSequenceOfAddress(const TColStd_SequenceNodeOfSequenceOfAddress *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_TColStd_SequenceNodeOfSequenceOfAddress DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_TColStd_SequenceNodeOfSequenceOfAddress {
    TColStd_SequenceNodeOfSequenceOfAddress* _get_reference() {
    return (TColStd_SequenceNodeOfSequenceOfAddress*)$self->Access();
    }
};

%extend Handle_TColStd_SequenceNodeOfSequenceOfAddress {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend TColStd_SequenceNodeOfSequenceOfAddress {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TColStd_SequenceNodeOfSequenceOfAsciiString;
class TColStd_SequenceNodeOfSequenceOfAsciiString : public TCollection_SeqNode {
	public:
		%feature("compactdefaultargs") TColStd_SequenceNodeOfSequenceOfAsciiString;
		%feature("autodoc", "	:param I:
	:type I: TCollection_AsciiString &
	:param n:
	:type n: TCollection_SeqNodePtr &
	:param p:
	:type p: TCollection_SeqNodePtr &
	:rtype: None
") TColStd_SequenceNodeOfSequenceOfAsciiString;
		 TColStd_SequenceNodeOfSequenceOfAsciiString (const TCollection_AsciiString & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: TCollection_AsciiString
") Value;
		TCollection_AsciiString & Value ();
};


%extend TColStd_SequenceNodeOfSequenceOfAsciiString {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_TColStd_SequenceNodeOfSequenceOfAsciiString(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_TColStd_SequenceNodeOfSequenceOfAsciiString::Handle_TColStd_SequenceNodeOfSequenceOfAsciiString %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_TColStd_SequenceNodeOfSequenceOfAsciiString;
class Handle_TColStd_SequenceNodeOfSequenceOfAsciiString : public Handle_TCollection_SeqNode {

    public:
        // constructors
        Handle_TColStd_SequenceNodeOfSequenceOfAsciiString();
        Handle_TColStd_SequenceNodeOfSequenceOfAsciiString(const Handle_TColStd_SequenceNodeOfSequenceOfAsciiString &aHandle);
        Handle_TColStd_SequenceNodeOfSequenceOfAsciiString(const TColStd_SequenceNodeOfSequenceOfAsciiString *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_TColStd_SequenceNodeOfSequenceOfAsciiString DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_TColStd_SequenceNodeOfSequenceOfAsciiString {
    TColStd_SequenceNodeOfSequenceOfAsciiString* _get_reference() {
    return (TColStd_SequenceNodeOfSequenceOfAsciiString*)$self->Access();
    }
};

%extend Handle_TColStd_SequenceNodeOfSequenceOfAsciiString {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend TColStd_SequenceNodeOfSequenceOfAsciiString {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TColStd_SequenceNodeOfSequenceOfBoolean;
class TColStd_SequenceNodeOfSequenceOfBoolean : public TCollection_SeqNode {
	public:
		%feature("compactdefaultargs") TColStd_SequenceNodeOfSequenceOfBoolean;
		%feature("autodoc", "	:param I:
	:type I: bool
	:param n:
	:type n: TCollection_SeqNodePtr &
	:param p:
	:type p: TCollection_SeqNodePtr &
	:rtype: None
") TColStd_SequenceNodeOfSequenceOfBoolean;
		 TColStd_SequenceNodeOfSequenceOfBoolean (const Standard_Boolean & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);

            %feature("autodoc","1");
            %extend {
                Standard_Boolean GetValue() {
                return (Standard_Boolean) $self->Value();
                }
            };
            %feature("autodoc","1");
            %extend {
                void SetValue(Standard_Boolean value ) {
                $self->Value()=value;
                }
            };
            };


%extend TColStd_SequenceNodeOfSequenceOfBoolean {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_TColStd_SequenceNodeOfSequenceOfBoolean(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_TColStd_SequenceNodeOfSequenceOfBoolean::Handle_TColStd_SequenceNodeOfSequenceOfBoolean %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_TColStd_SequenceNodeOfSequenceOfBoolean;
class Handle_TColStd_SequenceNodeOfSequenceOfBoolean : public Handle_TCollection_SeqNode {

    public:
        // constructors
        Handle_TColStd_SequenceNodeOfSequenceOfBoolean();
        Handle_TColStd_SequenceNodeOfSequenceOfBoolean(const Handle_TColStd_SequenceNodeOfSequenceOfBoolean &aHandle);
        Handle_TColStd_SequenceNodeOfSequenceOfBoolean(const TColStd_SequenceNodeOfSequenceOfBoolean *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_TColStd_SequenceNodeOfSequenceOfBoolean DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_TColStd_SequenceNodeOfSequenceOfBoolean {
    TColStd_SequenceNodeOfSequenceOfBoolean* _get_reference() {
    return (TColStd_SequenceNodeOfSequenceOfBoolean*)$self->Access();
    }
};

%extend Handle_TColStd_SequenceNodeOfSequenceOfBoolean {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend TColStd_SequenceNodeOfSequenceOfBoolean {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TColStd_SequenceNodeOfSequenceOfExtendedString;
class TColStd_SequenceNodeOfSequenceOfExtendedString : public TCollection_SeqNode {
	public:
		%feature("compactdefaultargs") TColStd_SequenceNodeOfSequenceOfExtendedString;
		%feature("autodoc", "	:param I:
	:type I: TCollection_ExtendedString &
	:param n:
	:type n: TCollection_SeqNodePtr &
	:param p:
	:type p: TCollection_SeqNodePtr &
	:rtype: None
") TColStd_SequenceNodeOfSequenceOfExtendedString;
		 TColStd_SequenceNodeOfSequenceOfExtendedString (const TCollection_ExtendedString & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: TCollection_ExtendedString
") Value;
		TCollection_ExtendedString & Value ();
};


%extend TColStd_SequenceNodeOfSequenceOfExtendedString {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_TColStd_SequenceNodeOfSequenceOfExtendedString(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_TColStd_SequenceNodeOfSequenceOfExtendedString::Handle_TColStd_SequenceNodeOfSequenceOfExtendedString %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_TColStd_SequenceNodeOfSequenceOfExtendedString;
class Handle_TColStd_SequenceNodeOfSequenceOfExtendedString : public Handle_TCollection_SeqNode {

    public:
        // constructors
        Handle_TColStd_SequenceNodeOfSequenceOfExtendedString();
        Handle_TColStd_SequenceNodeOfSequenceOfExtendedString(const Handle_TColStd_SequenceNodeOfSequenceOfExtendedString &aHandle);
        Handle_TColStd_SequenceNodeOfSequenceOfExtendedString(const TColStd_SequenceNodeOfSequenceOfExtendedString *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_TColStd_SequenceNodeOfSequenceOfExtendedString DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_TColStd_SequenceNodeOfSequenceOfExtendedString {
    TColStd_SequenceNodeOfSequenceOfExtendedString* _get_reference() {
    return (TColStd_SequenceNodeOfSequenceOfExtendedString*)$self->Access();
    }
};

%extend Handle_TColStd_SequenceNodeOfSequenceOfExtendedString {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend TColStd_SequenceNodeOfSequenceOfExtendedString {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TColStd_SequenceNodeOfSequenceOfHAsciiString;
class TColStd_SequenceNodeOfSequenceOfHAsciiString : public TCollection_SeqNode {
	public:
		%feature("compactdefaultargs") TColStd_SequenceNodeOfSequenceOfHAsciiString;
		%feature("autodoc", "	:param I:
	:type I: Handle_TCollection_HAsciiString &
	:param n:
	:type n: TCollection_SeqNodePtr &
	:param p:
	:type p: TCollection_SeqNodePtr &
	:rtype: None
") TColStd_SequenceNodeOfSequenceOfHAsciiString;
		 TColStd_SequenceNodeOfSequenceOfHAsciiString (const Handle_TCollection_HAsciiString & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: Handle_TCollection_HAsciiString
") Value;
		Handle_TCollection_HAsciiString Value ();
};


%extend TColStd_SequenceNodeOfSequenceOfHAsciiString {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_TColStd_SequenceNodeOfSequenceOfHAsciiString(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_TColStd_SequenceNodeOfSequenceOfHAsciiString::Handle_TColStd_SequenceNodeOfSequenceOfHAsciiString %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_TColStd_SequenceNodeOfSequenceOfHAsciiString;
class Handle_TColStd_SequenceNodeOfSequenceOfHAsciiString : public Handle_TCollection_SeqNode {

    public:
        // constructors
        Handle_TColStd_SequenceNodeOfSequenceOfHAsciiString();
        Handle_TColStd_SequenceNodeOfSequenceOfHAsciiString(const Handle_TColStd_SequenceNodeOfSequenceOfHAsciiString &aHandle);
        Handle_TColStd_SequenceNodeOfSequenceOfHAsciiString(const TColStd_SequenceNodeOfSequenceOfHAsciiString *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_TColStd_SequenceNodeOfSequenceOfHAsciiString DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_TColStd_SequenceNodeOfSequenceOfHAsciiString {
    TColStd_SequenceNodeOfSequenceOfHAsciiString* _get_reference() {
    return (TColStd_SequenceNodeOfSequenceOfHAsciiString*)$self->Access();
    }
};

%extend Handle_TColStd_SequenceNodeOfSequenceOfHAsciiString {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend TColStd_SequenceNodeOfSequenceOfHAsciiString {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TColStd_SequenceNodeOfSequenceOfHExtendedString;
class TColStd_SequenceNodeOfSequenceOfHExtendedString : public TCollection_SeqNode {
	public:
		%feature("compactdefaultargs") TColStd_SequenceNodeOfSequenceOfHExtendedString;
		%feature("autodoc", "	:param I:
	:type I: Handle_TCollection_HExtendedString &
	:param n:
	:type n: TCollection_SeqNodePtr &
	:param p:
	:type p: TCollection_SeqNodePtr &
	:rtype: None
") TColStd_SequenceNodeOfSequenceOfHExtendedString;
		 TColStd_SequenceNodeOfSequenceOfHExtendedString (const Handle_TCollection_HExtendedString & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: Handle_TCollection_HExtendedString
") Value;
		Handle_TCollection_HExtendedString Value ();
};


%extend TColStd_SequenceNodeOfSequenceOfHExtendedString {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_TColStd_SequenceNodeOfSequenceOfHExtendedString(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_TColStd_SequenceNodeOfSequenceOfHExtendedString::Handle_TColStd_SequenceNodeOfSequenceOfHExtendedString %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_TColStd_SequenceNodeOfSequenceOfHExtendedString;
class Handle_TColStd_SequenceNodeOfSequenceOfHExtendedString : public Handle_TCollection_SeqNode {

    public:
        // constructors
        Handle_TColStd_SequenceNodeOfSequenceOfHExtendedString();
        Handle_TColStd_SequenceNodeOfSequenceOfHExtendedString(const Handle_TColStd_SequenceNodeOfSequenceOfHExtendedString &aHandle);
        Handle_TColStd_SequenceNodeOfSequenceOfHExtendedString(const TColStd_SequenceNodeOfSequenceOfHExtendedString *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_TColStd_SequenceNodeOfSequenceOfHExtendedString DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_TColStd_SequenceNodeOfSequenceOfHExtendedString {
    TColStd_SequenceNodeOfSequenceOfHExtendedString* _get_reference() {
    return (TColStd_SequenceNodeOfSequenceOfHExtendedString*)$self->Access();
    }
};

%extend Handle_TColStd_SequenceNodeOfSequenceOfHExtendedString {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend TColStd_SequenceNodeOfSequenceOfHExtendedString {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TColStd_SequenceNodeOfSequenceOfInteger;
class TColStd_SequenceNodeOfSequenceOfInteger : public TCollection_SeqNode {
	public:
		%feature("compactdefaultargs") TColStd_SequenceNodeOfSequenceOfInteger;
		%feature("autodoc", "	:param I:
	:type I: int &
	:param n:
	:type n: TCollection_SeqNodePtr &
	:param p:
	:type p: TCollection_SeqNodePtr &
	:rtype: None
") TColStd_SequenceNodeOfSequenceOfInteger;
		 TColStd_SequenceNodeOfSequenceOfInteger (const Standard_Integer & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);

            %feature("autodoc","1");
            %extend {
                Standard_Integer GetValue() {
                return (Standard_Integer) $self->Value();
                }
            };
            %feature("autodoc","1");
            %extend {
                void SetValue(Standard_Integer value ) {
                $self->Value()=value;
                }
            };
            };


%extend TColStd_SequenceNodeOfSequenceOfInteger {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_TColStd_SequenceNodeOfSequenceOfInteger(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_TColStd_SequenceNodeOfSequenceOfInteger::Handle_TColStd_SequenceNodeOfSequenceOfInteger %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_TColStd_SequenceNodeOfSequenceOfInteger;
class Handle_TColStd_SequenceNodeOfSequenceOfInteger : public Handle_TCollection_SeqNode {

    public:
        // constructors
        Handle_TColStd_SequenceNodeOfSequenceOfInteger();
        Handle_TColStd_SequenceNodeOfSequenceOfInteger(const Handle_TColStd_SequenceNodeOfSequenceOfInteger &aHandle);
        Handle_TColStd_SequenceNodeOfSequenceOfInteger(const TColStd_SequenceNodeOfSequenceOfInteger *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_TColStd_SequenceNodeOfSequenceOfInteger DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_TColStd_SequenceNodeOfSequenceOfInteger {
    TColStd_SequenceNodeOfSequenceOfInteger* _get_reference() {
    return (TColStd_SequenceNodeOfSequenceOfInteger*)$self->Access();
    }
};

%extend Handle_TColStd_SequenceNodeOfSequenceOfInteger {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend TColStd_SequenceNodeOfSequenceOfInteger {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TColStd_SequenceNodeOfSequenceOfReal;
class TColStd_SequenceNodeOfSequenceOfReal : public TCollection_SeqNode {
	public:
		%feature("compactdefaultargs") TColStd_SequenceNodeOfSequenceOfReal;
		%feature("autodoc", "	:param I:
	:type I: float &
	:param n:
	:type n: TCollection_SeqNodePtr &
	:param p:
	:type p: TCollection_SeqNodePtr &
	:rtype: None
") TColStd_SequenceNodeOfSequenceOfReal;
		 TColStd_SequenceNodeOfSequenceOfReal (const Standard_Real & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);

            %feature("autodoc","1");
            %extend {
                Standard_Real GetValue() {
                return (Standard_Real) $self->Value();
                }
            };
            %feature("autodoc","1");
            %extend {
                void SetValue(Standard_Real value ) {
                $self->Value()=value;
                }
            };
            };


%extend TColStd_SequenceNodeOfSequenceOfReal {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_TColStd_SequenceNodeOfSequenceOfReal(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_TColStd_SequenceNodeOfSequenceOfReal::Handle_TColStd_SequenceNodeOfSequenceOfReal %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_TColStd_SequenceNodeOfSequenceOfReal;
class Handle_TColStd_SequenceNodeOfSequenceOfReal : public Handle_TCollection_SeqNode {

    public:
        // constructors
        Handle_TColStd_SequenceNodeOfSequenceOfReal();
        Handle_TColStd_SequenceNodeOfSequenceOfReal(const Handle_TColStd_SequenceNodeOfSequenceOfReal &aHandle);
        Handle_TColStd_SequenceNodeOfSequenceOfReal(const TColStd_SequenceNodeOfSequenceOfReal *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_TColStd_SequenceNodeOfSequenceOfReal DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_TColStd_SequenceNodeOfSequenceOfReal {
    TColStd_SequenceNodeOfSequenceOfReal* _get_reference() {
    return (TColStd_SequenceNodeOfSequenceOfReal*)$self->Access();
    }
};

%extend Handle_TColStd_SequenceNodeOfSequenceOfReal {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend TColStd_SequenceNodeOfSequenceOfReal {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TColStd_SequenceNodeOfSequenceOfTransient;
class TColStd_SequenceNodeOfSequenceOfTransient : public TCollection_SeqNode {
	public:
		%feature("compactdefaultargs") TColStd_SequenceNodeOfSequenceOfTransient;
		%feature("autodoc", "	:param I:
	:type I: Handle_Standard_Transient &
	:param n:
	:type n: TCollection_SeqNodePtr &
	:param p:
	:type p: TCollection_SeqNodePtr &
	:rtype: None
") TColStd_SequenceNodeOfSequenceOfTransient;
		 TColStd_SequenceNodeOfSequenceOfTransient (const Handle_Standard_Transient & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: Handle_Standard_Transient
") Value;
		Handle_Standard_Transient Value ();
};


%extend TColStd_SequenceNodeOfSequenceOfTransient {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_TColStd_SequenceNodeOfSequenceOfTransient(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_TColStd_SequenceNodeOfSequenceOfTransient::Handle_TColStd_SequenceNodeOfSequenceOfTransient %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_TColStd_SequenceNodeOfSequenceOfTransient;
class Handle_TColStd_SequenceNodeOfSequenceOfTransient : public Handle_TCollection_SeqNode {

    public:
        // constructors
        Handle_TColStd_SequenceNodeOfSequenceOfTransient();
        Handle_TColStd_SequenceNodeOfSequenceOfTransient(const Handle_TColStd_SequenceNodeOfSequenceOfTransient &aHandle);
        Handle_TColStd_SequenceNodeOfSequenceOfTransient(const TColStd_SequenceNodeOfSequenceOfTransient *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_TColStd_SequenceNodeOfSequenceOfTransient DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_TColStd_SequenceNodeOfSequenceOfTransient {
    TColStd_SequenceNodeOfSequenceOfTransient* _get_reference() {
    return (TColStd_SequenceNodeOfSequenceOfTransient*)$self->Access();
    }
};

%extend Handle_TColStd_SequenceNodeOfSequenceOfTransient {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend TColStd_SequenceNodeOfSequenceOfTransient {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TColStd_SequenceOfAddress;
class TColStd_SequenceOfAddress : public TCollection_BaseSequence {
	public:
		%feature("compactdefaultargs") TColStd_SequenceOfAddress;
		%feature("autodoc", "	:rtype: None
") TColStd_SequenceOfAddress;
		 TColStd_SequenceOfAddress ();
		%feature("compactdefaultargs") TColStd_SequenceOfAddress;
		%feature("autodoc", "	:param Other:
	:type Other: TColStd_SequenceOfAddress &
	:rtype: None
") TColStd_SequenceOfAddress;
		 TColStd_SequenceOfAddress (const TColStd_SequenceOfAddress & Other);
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: TColStd_SequenceOfAddress &
	:rtype: TColStd_SequenceOfAddress
") Assign;
		const TColStd_SequenceOfAddress & Assign (const TColStd_SequenceOfAddress & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: TColStd_SequenceOfAddress &
	:rtype: TColStd_SequenceOfAddress
") operator =;
		const TColStd_SequenceOfAddress & operator = (const TColStd_SequenceOfAddress & Other);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param T:
	:type T: Standard_Address &
	:rtype: None
") Append;
		void Append (const Standard_Address & T);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param S:
	:type S: TColStd_SequenceOfAddress &
	:rtype: None
") Append;
		void Append (TColStd_SequenceOfAddress & S);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param T:
	:type T: Standard_Address &
	:rtype: None
") Prepend;
		void Prepend (const Standard_Address & T);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param S:
	:type S: TColStd_SequenceOfAddress &
	:rtype: None
") Prepend;
		void Prepend (TColStd_SequenceOfAddress & S);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param T:
	:type T: Standard_Address &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const Standard_Address & T);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param S:
	:type S: TColStd_SequenceOfAddress &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,TColStd_SequenceOfAddress & S);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param T:
	:type T: Standard_Address &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const Standard_Address & T);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param S:
	:type S: TColStd_SequenceOfAddress &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,TColStd_SequenceOfAddress & S);
		%feature("compactdefaultargs") First;
		%feature("autodoc", "	:rtype: Standard_Address
") First;
		const Standard_Address & First ();
		%feature("compactdefaultargs") Last;
		%feature("autodoc", "	:rtype: Standard_Address
") Last;
		const Standard_Address & Last ();
		%feature("compactdefaultargs") Split;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param Sub:
	:type Sub: TColStd_SequenceOfAddress &
	:rtype: None
") Split;
		void Split (const Standard_Integer Index,TColStd_SequenceOfAddress & Sub);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Standard_Address
") Value;
		const Standard_Address & Value (const Standard_Integer Index);
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param I:
	:type I: Standard_Address &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const Standard_Address & I);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Standard_Address
") ChangeValue;
		Standard_Address & ChangeValue (const Standard_Integer Index);
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: None
") Remove;
		void Remove (const Standard_Integer Index);
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	:param FromIndex:
	:type FromIndex: int
	:param ToIndex:
	:type ToIndex: int
	:rtype: None
") Remove;
		void Remove (const Standard_Integer FromIndex,const Standard_Integer ToIndex);
};


%extend TColStd_SequenceOfAddress {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TColStd_SequenceOfAsciiString;
class TColStd_SequenceOfAsciiString : public TCollection_BaseSequence {
	public:
		%feature("compactdefaultargs") TColStd_SequenceOfAsciiString;
		%feature("autodoc", "	:rtype: None
") TColStd_SequenceOfAsciiString;
		 TColStd_SequenceOfAsciiString ();
		%feature("compactdefaultargs") TColStd_SequenceOfAsciiString;
		%feature("autodoc", "	:param Other:
	:type Other: TColStd_SequenceOfAsciiString &
	:rtype: None
") TColStd_SequenceOfAsciiString;
		 TColStd_SequenceOfAsciiString (const TColStd_SequenceOfAsciiString & Other);
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: TColStd_SequenceOfAsciiString &
	:rtype: TColStd_SequenceOfAsciiString
") Assign;
		const TColStd_SequenceOfAsciiString & Assign (const TColStd_SequenceOfAsciiString & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: TColStd_SequenceOfAsciiString &
	:rtype: TColStd_SequenceOfAsciiString
") operator =;
		const TColStd_SequenceOfAsciiString & operator = (const TColStd_SequenceOfAsciiString & Other);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param T:
	:type T: TCollection_AsciiString &
	:rtype: None
") Append;
		void Append (const TCollection_AsciiString & T);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param S:
	:type S: TColStd_SequenceOfAsciiString &
	:rtype: None
") Append;
		void Append (TColStd_SequenceOfAsciiString & S);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param T:
	:type T: TCollection_AsciiString &
	:rtype: None
") Prepend;
		void Prepend (const TCollection_AsciiString & T);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param S:
	:type S: TColStd_SequenceOfAsciiString &
	:rtype: None
") Prepend;
		void Prepend (TColStd_SequenceOfAsciiString & S);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param T:
	:type T: TCollection_AsciiString &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const TCollection_AsciiString & T);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param S:
	:type S: TColStd_SequenceOfAsciiString &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,TColStd_SequenceOfAsciiString & S);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param T:
	:type T: TCollection_AsciiString &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const TCollection_AsciiString & T);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param S:
	:type S: TColStd_SequenceOfAsciiString &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,TColStd_SequenceOfAsciiString & S);
		%feature("compactdefaultargs") First;
		%feature("autodoc", "	:rtype: TCollection_AsciiString
") First;
		const TCollection_AsciiString & First ();
		%feature("compactdefaultargs") Last;
		%feature("autodoc", "	:rtype: TCollection_AsciiString
") Last;
		const TCollection_AsciiString & Last ();
		%feature("compactdefaultargs") Split;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param Sub:
	:type Sub: TColStd_SequenceOfAsciiString &
	:rtype: None
") Split;
		void Split (const Standard_Integer Index,TColStd_SequenceOfAsciiString & Sub);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: TCollection_AsciiString
") Value;
		const TCollection_AsciiString & Value (const Standard_Integer Index);
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param I:
	:type I: TCollection_AsciiString &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const TCollection_AsciiString & I);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: TCollection_AsciiString
") ChangeValue;
		TCollection_AsciiString & ChangeValue (const Standard_Integer Index);
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: None
") Remove;
		void Remove (const Standard_Integer Index);
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	:param FromIndex:
	:type FromIndex: int
	:param ToIndex:
	:type ToIndex: int
	:rtype: None
") Remove;
		void Remove (const Standard_Integer FromIndex,const Standard_Integer ToIndex);
};


%extend TColStd_SequenceOfAsciiString {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TColStd_SequenceOfBoolean;
class TColStd_SequenceOfBoolean : public TCollection_BaseSequence {
	public:
		%feature("compactdefaultargs") TColStd_SequenceOfBoolean;
		%feature("autodoc", "	:rtype: None
") TColStd_SequenceOfBoolean;
		 TColStd_SequenceOfBoolean ();
		%feature("compactdefaultargs") TColStd_SequenceOfBoolean;
		%feature("autodoc", "	:param Other:
	:type Other: TColStd_SequenceOfBoolean &
	:rtype: None
") TColStd_SequenceOfBoolean;
		 TColStd_SequenceOfBoolean (const TColStd_SequenceOfBoolean & Other);
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: TColStd_SequenceOfBoolean &
	:rtype: TColStd_SequenceOfBoolean
") Assign;
		const TColStd_SequenceOfBoolean & Assign (const TColStd_SequenceOfBoolean & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: TColStd_SequenceOfBoolean &
	:rtype: TColStd_SequenceOfBoolean
") operator =;
		const TColStd_SequenceOfBoolean & operator = (const TColStd_SequenceOfBoolean & Other);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param T:
	:type T: bool
	:rtype: None
") Append;
		void Append (const Standard_Boolean & T);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param S:
	:type S: TColStd_SequenceOfBoolean &
	:rtype: None
") Append;
		void Append (TColStd_SequenceOfBoolean & S);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param T:
	:type T: bool
	:rtype: None
") Prepend;
		void Prepend (const Standard_Boolean & T);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param S:
	:type S: TColStd_SequenceOfBoolean &
	:rtype: None
") Prepend;
		void Prepend (TColStd_SequenceOfBoolean & S);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param T:
	:type T: bool
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const Standard_Boolean & T);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param S:
	:type S: TColStd_SequenceOfBoolean &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,TColStd_SequenceOfBoolean & S);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param T:
	:type T: bool
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const Standard_Boolean & T);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param S:
	:type S: TColStd_SequenceOfBoolean &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,TColStd_SequenceOfBoolean & S);
		%feature("compactdefaultargs") First;
		%feature("autodoc", "	:rtype: bool
") First;
		const Standard_Boolean & First ();
		%feature("compactdefaultargs") Last;
		%feature("autodoc", "	:rtype: bool
") Last;
		const Standard_Boolean & Last ();
		%feature("compactdefaultargs") Split;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param Sub:
	:type Sub: TColStd_SequenceOfBoolean &
	:rtype: None
") Split;
		void Split (const Standard_Integer Index,TColStd_SequenceOfBoolean & Sub);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: bool
") Value;
		const Standard_Boolean & Value (const Standard_Integer Index);
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param I:
	:type I: bool
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const Standard_Boolean & I);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: bool
") ChangeValue;
		Standard_Boolean & ChangeValue (const Standard_Integer Index);
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: None
") Remove;
		void Remove (const Standard_Integer Index);
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	:param FromIndex:
	:type FromIndex: int
	:param ToIndex:
	:type ToIndex: int
	:rtype: None
") Remove;
		void Remove (const Standard_Integer FromIndex,const Standard_Integer ToIndex);
};


%extend TColStd_SequenceOfBoolean {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TColStd_SequenceOfExtendedString;
class TColStd_SequenceOfExtendedString : public TCollection_BaseSequence {
	public:
		%feature("compactdefaultargs") TColStd_SequenceOfExtendedString;
		%feature("autodoc", "	:rtype: None
") TColStd_SequenceOfExtendedString;
		 TColStd_SequenceOfExtendedString ();
		%feature("compactdefaultargs") TColStd_SequenceOfExtendedString;
		%feature("autodoc", "	:param Other:
	:type Other: TColStd_SequenceOfExtendedString &
	:rtype: None
") TColStd_SequenceOfExtendedString;
		 TColStd_SequenceOfExtendedString (const TColStd_SequenceOfExtendedString & Other);
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: TColStd_SequenceOfExtendedString &
	:rtype: TColStd_SequenceOfExtendedString
") Assign;
		const TColStd_SequenceOfExtendedString & Assign (const TColStd_SequenceOfExtendedString & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: TColStd_SequenceOfExtendedString &
	:rtype: TColStd_SequenceOfExtendedString
") operator =;
		const TColStd_SequenceOfExtendedString & operator = (const TColStd_SequenceOfExtendedString & Other);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param T:
	:type T: TCollection_ExtendedString &
	:rtype: None
") Append;
		void Append (const TCollection_ExtendedString & T);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param S:
	:type S: TColStd_SequenceOfExtendedString &
	:rtype: None
") Append;
		void Append (TColStd_SequenceOfExtendedString & S);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param T:
	:type T: TCollection_ExtendedString &
	:rtype: None
") Prepend;
		void Prepend (const TCollection_ExtendedString & T);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param S:
	:type S: TColStd_SequenceOfExtendedString &
	:rtype: None
") Prepend;
		void Prepend (TColStd_SequenceOfExtendedString & S);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param T:
	:type T: TCollection_ExtendedString &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const TCollection_ExtendedString & T);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param S:
	:type S: TColStd_SequenceOfExtendedString &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,TColStd_SequenceOfExtendedString & S);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param T:
	:type T: TCollection_ExtendedString &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const TCollection_ExtendedString & T);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param S:
	:type S: TColStd_SequenceOfExtendedString &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,TColStd_SequenceOfExtendedString & S);
		%feature("compactdefaultargs") First;
		%feature("autodoc", "	:rtype: TCollection_ExtendedString
") First;
		const TCollection_ExtendedString & First ();
		%feature("compactdefaultargs") Last;
		%feature("autodoc", "	:rtype: TCollection_ExtendedString
") Last;
		const TCollection_ExtendedString & Last ();
		%feature("compactdefaultargs") Split;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param Sub:
	:type Sub: TColStd_SequenceOfExtendedString &
	:rtype: None
") Split;
		void Split (const Standard_Integer Index,TColStd_SequenceOfExtendedString & Sub);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: TCollection_ExtendedString
") Value;
		const TCollection_ExtendedString & Value (const Standard_Integer Index);
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param I:
	:type I: TCollection_ExtendedString &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const TCollection_ExtendedString & I);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: TCollection_ExtendedString
") ChangeValue;
		TCollection_ExtendedString & ChangeValue (const Standard_Integer Index);
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: None
") Remove;
		void Remove (const Standard_Integer Index);
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	:param FromIndex:
	:type FromIndex: int
	:param ToIndex:
	:type ToIndex: int
	:rtype: None
") Remove;
		void Remove (const Standard_Integer FromIndex,const Standard_Integer ToIndex);
};


%extend TColStd_SequenceOfExtendedString {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TColStd_SequenceOfHAsciiString;
class TColStd_SequenceOfHAsciiString : public TCollection_BaseSequence {
	public:
		%feature("compactdefaultargs") TColStd_SequenceOfHAsciiString;
		%feature("autodoc", "	:rtype: None
") TColStd_SequenceOfHAsciiString;
		 TColStd_SequenceOfHAsciiString ();
		%feature("compactdefaultargs") TColStd_SequenceOfHAsciiString;
		%feature("autodoc", "	:param Other:
	:type Other: TColStd_SequenceOfHAsciiString &
	:rtype: None
") TColStd_SequenceOfHAsciiString;
		 TColStd_SequenceOfHAsciiString (const TColStd_SequenceOfHAsciiString & Other);
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: TColStd_SequenceOfHAsciiString &
	:rtype: TColStd_SequenceOfHAsciiString
") Assign;
		const TColStd_SequenceOfHAsciiString & Assign (const TColStd_SequenceOfHAsciiString & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: TColStd_SequenceOfHAsciiString &
	:rtype: TColStd_SequenceOfHAsciiString
") operator =;
		const TColStd_SequenceOfHAsciiString & operator = (const TColStd_SequenceOfHAsciiString & Other);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param T:
	:type T: Handle_TCollection_HAsciiString &
	:rtype: None
") Append;
		void Append (const Handle_TCollection_HAsciiString & T);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param S:
	:type S: TColStd_SequenceOfHAsciiString &
	:rtype: None
") Append;
		void Append (TColStd_SequenceOfHAsciiString & S);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param T:
	:type T: Handle_TCollection_HAsciiString &
	:rtype: None
") Prepend;
		void Prepend (const Handle_TCollection_HAsciiString & T);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param S:
	:type S: TColStd_SequenceOfHAsciiString &
	:rtype: None
") Prepend;
		void Prepend (TColStd_SequenceOfHAsciiString & S);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param T:
	:type T: Handle_TCollection_HAsciiString &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const Handle_TCollection_HAsciiString & T);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param S:
	:type S: TColStd_SequenceOfHAsciiString &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,TColStd_SequenceOfHAsciiString & S);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param T:
	:type T: Handle_TCollection_HAsciiString &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const Handle_TCollection_HAsciiString & T);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param S:
	:type S: TColStd_SequenceOfHAsciiString &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,TColStd_SequenceOfHAsciiString & S);
		%feature("compactdefaultargs") First;
		%feature("autodoc", "	:rtype: Handle_TCollection_HAsciiString
") First;
		Handle_TCollection_HAsciiString First ();
		%feature("compactdefaultargs") Last;
		%feature("autodoc", "	:rtype: Handle_TCollection_HAsciiString
") Last;
		Handle_TCollection_HAsciiString Last ();
		%feature("compactdefaultargs") Split;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param Sub:
	:type Sub: TColStd_SequenceOfHAsciiString &
	:rtype: None
") Split;
		void Split (const Standard_Integer Index,TColStd_SequenceOfHAsciiString & Sub);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Handle_TCollection_HAsciiString
") Value;
		Handle_TCollection_HAsciiString Value (const Standard_Integer Index);
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param I:
	:type I: Handle_TCollection_HAsciiString &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const Handle_TCollection_HAsciiString & I);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Handle_TCollection_HAsciiString
") ChangeValue;
		Handle_TCollection_HAsciiString ChangeValue (const Standard_Integer Index);
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: None
") Remove;
		void Remove (const Standard_Integer Index);
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	:param FromIndex:
	:type FromIndex: int
	:param ToIndex:
	:type ToIndex: int
	:rtype: None
") Remove;
		void Remove (const Standard_Integer FromIndex,const Standard_Integer ToIndex);
};


%extend TColStd_SequenceOfHAsciiString {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TColStd_SequenceOfHExtendedString;
class TColStd_SequenceOfHExtendedString : public TCollection_BaseSequence {
	public:
		%feature("compactdefaultargs") TColStd_SequenceOfHExtendedString;
		%feature("autodoc", "	:rtype: None
") TColStd_SequenceOfHExtendedString;
		 TColStd_SequenceOfHExtendedString ();
		%feature("compactdefaultargs") TColStd_SequenceOfHExtendedString;
		%feature("autodoc", "	:param Other:
	:type Other: TColStd_SequenceOfHExtendedString &
	:rtype: None
") TColStd_SequenceOfHExtendedString;
		 TColStd_SequenceOfHExtendedString (const TColStd_SequenceOfHExtendedString & Other);
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: TColStd_SequenceOfHExtendedString &
	:rtype: TColStd_SequenceOfHExtendedString
") Assign;
		const TColStd_SequenceOfHExtendedString & Assign (const TColStd_SequenceOfHExtendedString & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: TColStd_SequenceOfHExtendedString &
	:rtype: TColStd_SequenceOfHExtendedString
") operator =;
		const TColStd_SequenceOfHExtendedString & operator = (const TColStd_SequenceOfHExtendedString & Other);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param T:
	:type T: Handle_TCollection_HExtendedString &
	:rtype: None
") Append;
		void Append (const Handle_TCollection_HExtendedString & T);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param S:
	:type S: TColStd_SequenceOfHExtendedString &
	:rtype: None
") Append;
		void Append (TColStd_SequenceOfHExtendedString & S);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param T:
	:type T: Handle_TCollection_HExtendedString &
	:rtype: None
") Prepend;
		void Prepend (const Handle_TCollection_HExtendedString & T);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param S:
	:type S: TColStd_SequenceOfHExtendedString &
	:rtype: None
") Prepend;
		void Prepend (TColStd_SequenceOfHExtendedString & S);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param T:
	:type T: Handle_TCollection_HExtendedString &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const Handle_TCollection_HExtendedString & T);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param S:
	:type S: TColStd_SequenceOfHExtendedString &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,TColStd_SequenceOfHExtendedString & S);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param T:
	:type T: Handle_TCollection_HExtendedString &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const Handle_TCollection_HExtendedString & T);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param S:
	:type S: TColStd_SequenceOfHExtendedString &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,TColStd_SequenceOfHExtendedString & S);
		%feature("compactdefaultargs") First;
		%feature("autodoc", "	:rtype: Handle_TCollection_HExtendedString
") First;
		Handle_TCollection_HExtendedString First ();
		%feature("compactdefaultargs") Last;
		%feature("autodoc", "	:rtype: Handle_TCollection_HExtendedString
") Last;
		Handle_TCollection_HExtendedString Last ();
		%feature("compactdefaultargs") Split;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param Sub:
	:type Sub: TColStd_SequenceOfHExtendedString &
	:rtype: None
") Split;
		void Split (const Standard_Integer Index,TColStd_SequenceOfHExtendedString & Sub);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Handle_TCollection_HExtendedString
") Value;
		Handle_TCollection_HExtendedString Value (const Standard_Integer Index);
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param I:
	:type I: Handle_TCollection_HExtendedString &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const Handle_TCollection_HExtendedString & I);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Handle_TCollection_HExtendedString
") ChangeValue;
		Handle_TCollection_HExtendedString ChangeValue (const Standard_Integer Index);
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: None
") Remove;
		void Remove (const Standard_Integer Index);
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	:param FromIndex:
	:type FromIndex: int
	:param ToIndex:
	:type ToIndex: int
	:rtype: None
") Remove;
		void Remove (const Standard_Integer FromIndex,const Standard_Integer ToIndex);
};


%extend TColStd_SequenceOfHExtendedString {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TColStd_SequenceOfInteger;
class TColStd_SequenceOfInteger : public TCollection_BaseSequence {
	public:
		%feature("compactdefaultargs") TColStd_SequenceOfInteger;
		%feature("autodoc", "	:rtype: None
") TColStd_SequenceOfInteger;
		 TColStd_SequenceOfInteger ();
		%feature("compactdefaultargs") TColStd_SequenceOfInteger;
		%feature("autodoc", "	:param Other:
	:type Other: TColStd_SequenceOfInteger &
	:rtype: None
") TColStd_SequenceOfInteger;
		 TColStd_SequenceOfInteger (const TColStd_SequenceOfInteger & Other);
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: TColStd_SequenceOfInteger &
	:rtype: TColStd_SequenceOfInteger
") Assign;
		const TColStd_SequenceOfInteger & Assign (const TColStd_SequenceOfInteger & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: TColStd_SequenceOfInteger &
	:rtype: TColStd_SequenceOfInteger
") operator =;
		const TColStd_SequenceOfInteger & operator = (const TColStd_SequenceOfInteger & Other);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param T:
	:type T: int &
	:rtype: None
") Append;
		void Append (const Standard_Integer & T);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param S:
	:type S: TColStd_SequenceOfInteger &
	:rtype: None
") Append;
		void Append (TColStd_SequenceOfInteger & S);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param T:
	:type T: int &
	:rtype: None
") Prepend;
		void Prepend (const Standard_Integer & T);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param S:
	:type S: TColStd_SequenceOfInteger &
	:rtype: None
") Prepend;
		void Prepend (TColStd_SequenceOfInteger & S);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param T:
	:type T: int &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const Standard_Integer & T);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param S:
	:type S: TColStd_SequenceOfInteger &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,TColStd_SequenceOfInteger & S);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param T:
	:type T: int &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const Standard_Integer & T);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param S:
	:type S: TColStd_SequenceOfInteger &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,TColStd_SequenceOfInteger & S);
		%feature("compactdefaultargs") First;
		%feature("autodoc", "	:rtype: int
") First;
		const Standard_Integer & First ();
		%feature("compactdefaultargs") Last;
		%feature("autodoc", "	:rtype: int
") Last;
		const Standard_Integer & Last ();
		%feature("compactdefaultargs") Split;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param Sub:
	:type Sub: TColStd_SequenceOfInteger &
	:rtype: None
") Split;
		void Split (const Standard_Integer Index,TColStd_SequenceOfInteger & Sub);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: int
") Value;
		const Standard_Integer & Value (const Standard_Integer Index);
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param I:
	:type I: int &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const Standard_Integer & I);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: int
") ChangeValue;
		Standard_Integer & ChangeValue (const Standard_Integer Index);
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: None
") Remove;
		void Remove (const Standard_Integer Index);
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	:param FromIndex:
	:type FromIndex: int
	:param ToIndex:
	:type ToIndex: int
	:rtype: None
") Remove;
		void Remove (const Standard_Integer FromIndex,const Standard_Integer ToIndex);
};


%extend TColStd_SequenceOfInteger {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TColStd_SequenceOfReal;
class TColStd_SequenceOfReal : public TCollection_BaseSequence {
	public:
		%feature("compactdefaultargs") TColStd_SequenceOfReal;
		%feature("autodoc", "	:rtype: None
") TColStd_SequenceOfReal;
		 TColStd_SequenceOfReal ();
		%feature("compactdefaultargs") TColStd_SequenceOfReal;
		%feature("autodoc", "	:param Other:
	:type Other: TColStd_SequenceOfReal &
	:rtype: None
") TColStd_SequenceOfReal;
		 TColStd_SequenceOfReal (const TColStd_SequenceOfReal & Other);
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: TColStd_SequenceOfReal &
	:rtype: TColStd_SequenceOfReal
") Assign;
		const TColStd_SequenceOfReal & Assign (const TColStd_SequenceOfReal & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: TColStd_SequenceOfReal &
	:rtype: TColStd_SequenceOfReal
") operator =;
		const TColStd_SequenceOfReal & operator = (const TColStd_SequenceOfReal & Other);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param T:
	:type T: float &
	:rtype: None
") Append;
		void Append (const Standard_Real & T);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param S:
	:type S: TColStd_SequenceOfReal &
	:rtype: None
") Append;
		void Append (TColStd_SequenceOfReal & S);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param T:
	:type T: float &
	:rtype: None
") Prepend;
		void Prepend (const Standard_Real & T);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param S:
	:type S: TColStd_SequenceOfReal &
	:rtype: None
") Prepend;
		void Prepend (TColStd_SequenceOfReal & S);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param T:
	:type T: float &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const Standard_Real & T);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param S:
	:type S: TColStd_SequenceOfReal &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,TColStd_SequenceOfReal & S);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param T:
	:type T: float &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const Standard_Real & T);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param S:
	:type S: TColStd_SequenceOfReal &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,TColStd_SequenceOfReal & S);
		%feature("compactdefaultargs") First;
		%feature("autodoc", "	:rtype: float
") First;
		const Standard_Real & First ();
		%feature("compactdefaultargs") Last;
		%feature("autodoc", "	:rtype: float
") Last;
		const Standard_Real & Last ();
		%feature("compactdefaultargs") Split;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param Sub:
	:type Sub: TColStd_SequenceOfReal &
	:rtype: None
") Split;
		void Split (const Standard_Integer Index,TColStd_SequenceOfReal & Sub);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: float
") Value;
		const Standard_Real & Value (const Standard_Integer Index);
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param I:
	:type I: float &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const Standard_Real & I);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: float
") ChangeValue;
		Standard_Real & ChangeValue (const Standard_Integer Index);
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: None
") Remove;
		void Remove (const Standard_Integer Index);
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	:param FromIndex:
	:type FromIndex: int
	:param ToIndex:
	:type ToIndex: int
	:rtype: None
") Remove;
		void Remove (const Standard_Integer FromIndex,const Standard_Integer ToIndex);
};


%extend TColStd_SequenceOfReal {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TColStd_SequenceOfTransient;
class TColStd_SequenceOfTransient : public TCollection_BaseSequence {
	public:
		%feature("compactdefaultargs") TColStd_SequenceOfTransient;
		%feature("autodoc", "	:rtype: None
") TColStd_SequenceOfTransient;
		 TColStd_SequenceOfTransient ();
		%feature("compactdefaultargs") TColStd_SequenceOfTransient;
		%feature("autodoc", "	:param Other:
	:type Other: TColStd_SequenceOfTransient &
	:rtype: None
") TColStd_SequenceOfTransient;
		 TColStd_SequenceOfTransient (const TColStd_SequenceOfTransient & Other);
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: TColStd_SequenceOfTransient &
	:rtype: TColStd_SequenceOfTransient
") Assign;
		const TColStd_SequenceOfTransient & Assign (const TColStd_SequenceOfTransient & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: TColStd_SequenceOfTransient &
	:rtype: TColStd_SequenceOfTransient
") operator =;
		const TColStd_SequenceOfTransient & operator = (const TColStd_SequenceOfTransient & Other);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param T:
	:type T: Handle_Standard_Transient &
	:rtype: None
") Append;
		void Append (const Handle_Standard_Transient & T);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param S:
	:type S: TColStd_SequenceOfTransient &
	:rtype: None
") Append;
		void Append (TColStd_SequenceOfTransient & S);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param T:
	:type T: Handle_Standard_Transient &
	:rtype: None
") Prepend;
		void Prepend (const Handle_Standard_Transient & T);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param S:
	:type S: TColStd_SequenceOfTransient &
	:rtype: None
") Prepend;
		void Prepend (TColStd_SequenceOfTransient & S);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param T:
	:type T: Handle_Standard_Transient &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const Handle_Standard_Transient & T);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param S:
	:type S: TColStd_SequenceOfTransient &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,TColStd_SequenceOfTransient & S);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param T:
	:type T: Handle_Standard_Transient &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const Handle_Standard_Transient & T);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param S:
	:type S: TColStd_SequenceOfTransient &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,TColStd_SequenceOfTransient & S);
		%feature("compactdefaultargs") First;
		%feature("autodoc", "	:rtype: Handle_Standard_Transient
") First;
		Handle_Standard_Transient First ();
		%feature("compactdefaultargs") Last;
		%feature("autodoc", "	:rtype: Handle_Standard_Transient
") Last;
		Handle_Standard_Transient Last ();
		%feature("compactdefaultargs") Split;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param Sub:
	:type Sub: TColStd_SequenceOfTransient &
	:rtype: None
") Split;
		void Split (const Standard_Integer Index,TColStd_SequenceOfTransient & Sub);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Handle_Standard_Transient
") Value;
		Handle_Standard_Transient Value (const Standard_Integer Index);
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param I:
	:type I: Handle_Standard_Transient &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const Handle_Standard_Transient & I);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Handle_Standard_Transient
") ChangeValue;
		Handle_Standard_Transient ChangeValue (const Standard_Integer Index);
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: None
") Remove;
		void Remove (const Standard_Integer Index);
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	:param FromIndex:
	:type FromIndex: int
	:param ToIndex:
	:type ToIndex: int
	:rtype: None
") Remove;
		void Remove (const Standard_Integer FromIndex,const Standard_Integer ToIndex);
};


%extend TColStd_SequenceOfTransient {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TColStd_StdMapNodeOfMapOfAsciiString;
class TColStd_StdMapNodeOfMapOfAsciiString : public TCollection_MapNode {
	public:
		%feature("compactdefaultargs") TColStd_StdMapNodeOfMapOfAsciiString;
		%feature("autodoc", "	:param K:
	:type K: TCollection_AsciiString &
	:param n:
	:type n: TCollection_MapNodePtr &
	:rtype: None
") TColStd_StdMapNodeOfMapOfAsciiString;
		 TColStd_StdMapNodeOfMapOfAsciiString (const TCollection_AsciiString & K,const TCollection_MapNodePtr & n);
		%feature("compactdefaultargs") Key;
		%feature("autodoc", "	:rtype: TCollection_AsciiString
") Key;
		TCollection_AsciiString & Key ();
};


%extend TColStd_StdMapNodeOfMapOfAsciiString {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_TColStd_StdMapNodeOfMapOfAsciiString(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_TColStd_StdMapNodeOfMapOfAsciiString::Handle_TColStd_StdMapNodeOfMapOfAsciiString %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_TColStd_StdMapNodeOfMapOfAsciiString;
class Handle_TColStd_StdMapNodeOfMapOfAsciiString : public Handle_TCollection_MapNode {

    public:
        // constructors
        Handle_TColStd_StdMapNodeOfMapOfAsciiString();
        Handle_TColStd_StdMapNodeOfMapOfAsciiString(const Handle_TColStd_StdMapNodeOfMapOfAsciiString &aHandle);
        Handle_TColStd_StdMapNodeOfMapOfAsciiString(const TColStd_StdMapNodeOfMapOfAsciiString *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_TColStd_StdMapNodeOfMapOfAsciiString DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_TColStd_StdMapNodeOfMapOfAsciiString {
    TColStd_StdMapNodeOfMapOfAsciiString* _get_reference() {
    return (TColStd_StdMapNodeOfMapOfAsciiString*)$self->Access();
    }
};

%extend Handle_TColStd_StdMapNodeOfMapOfAsciiString {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend TColStd_StdMapNodeOfMapOfAsciiString {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TColStd_StdMapNodeOfMapOfInteger;
class TColStd_StdMapNodeOfMapOfInteger : public TCollection_MapNode {
	public:
		%feature("compactdefaultargs") TColStd_StdMapNodeOfMapOfInteger;
		%feature("autodoc", "	:param K:
	:type K: int &
	:param n:
	:type n: TCollection_MapNodePtr &
	:rtype: None
") TColStd_StdMapNodeOfMapOfInteger;
		 TColStd_StdMapNodeOfMapOfInteger (const Standard_Integer & K,const TCollection_MapNodePtr & n);

            %feature("autodoc","1");
            %extend {
                Standard_Integer GetKey() {
                return (Standard_Integer) $self->Key();
                }
            };
            %feature("autodoc","1");
            %extend {
                void SetKey(Standard_Integer value ) {
                $self->Key()=value;
                }
            };
            };


%extend TColStd_StdMapNodeOfMapOfInteger {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_TColStd_StdMapNodeOfMapOfInteger(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_TColStd_StdMapNodeOfMapOfInteger::Handle_TColStd_StdMapNodeOfMapOfInteger %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_TColStd_StdMapNodeOfMapOfInteger;
class Handle_TColStd_StdMapNodeOfMapOfInteger : public Handle_TCollection_MapNode {

    public:
        // constructors
        Handle_TColStd_StdMapNodeOfMapOfInteger();
        Handle_TColStd_StdMapNodeOfMapOfInteger(const Handle_TColStd_StdMapNodeOfMapOfInteger &aHandle);
        Handle_TColStd_StdMapNodeOfMapOfInteger(const TColStd_StdMapNodeOfMapOfInteger *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_TColStd_StdMapNodeOfMapOfInteger DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_TColStd_StdMapNodeOfMapOfInteger {
    TColStd_StdMapNodeOfMapOfInteger* _get_reference() {
    return (TColStd_StdMapNodeOfMapOfInteger*)$self->Access();
    }
};

%extend Handle_TColStd_StdMapNodeOfMapOfInteger {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend TColStd_StdMapNodeOfMapOfInteger {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TColStd_StdMapNodeOfMapOfReal;
class TColStd_StdMapNodeOfMapOfReal : public TCollection_MapNode {
	public:
		%feature("compactdefaultargs") TColStd_StdMapNodeOfMapOfReal;
		%feature("autodoc", "	:param K:
	:type K: float &
	:param n:
	:type n: TCollection_MapNodePtr &
	:rtype: None
") TColStd_StdMapNodeOfMapOfReal;
		 TColStd_StdMapNodeOfMapOfReal (const Standard_Real & K,const TCollection_MapNodePtr & n);

            %feature("autodoc","1");
            %extend {
                Standard_Real GetKey() {
                return (Standard_Real) $self->Key();
                }
            };
            %feature("autodoc","1");
            %extend {
                void SetKey(Standard_Real value ) {
                $self->Key()=value;
                }
            };
            };


%extend TColStd_StdMapNodeOfMapOfReal {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_TColStd_StdMapNodeOfMapOfReal(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_TColStd_StdMapNodeOfMapOfReal::Handle_TColStd_StdMapNodeOfMapOfReal %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_TColStd_StdMapNodeOfMapOfReal;
class Handle_TColStd_StdMapNodeOfMapOfReal : public Handle_TCollection_MapNode {

    public:
        // constructors
        Handle_TColStd_StdMapNodeOfMapOfReal();
        Handle_TColStd_StdMapNodeOfMapOfReal(const Handle_TColStd_StdMapNodeOfMapOfReal &aHandle);
        Handle_TColStd_StdMapNodeOfMapOfReal(const TColStd_StdMapNodeOfMapOfReal *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_TColStd_StdMapNodeOfMapOfReal DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_TColStd_StdMapNodeOfMapOfReal {
    TColStd_StdMapNodeOfMapOfReal* _get_reference() {
    return (TColStd_StdMapNodeOfMapOfReal*)$self->Access();
    }
};

%extend Handle_TColStd_StdMapNodeOfMapOfReal {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend TColStd_StdMapNodeOfMapOfReal {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TColStd_StdMapNodeOfMapOfTransient;
class TColStd_StdMapNodeOfMapOfTransient : public TCollection_MapNode {
	public:
		%feature("compactdefaultargs") TColStd_StdMapNodeOfMapOfTransient;
		%feature("autodoc", "	:param K:
	:type K: Handle_Standard_Transient &
	:param n:
	:type n: TCollection_MapNodePtr &
	:rtype: None
") TColStd_StdMapNodeOfMapOfTransient;
		 TColStd_StdMapNodeOfMapOfTransient (const Handle_Standard_Transient & K,const TCollection_MapNodePtr & n);
		%feature("compactdefaultargs") Key;
		%feature("autodoc", "	:rtype: Handle_Standard_Transient
") Key;
		Handle_Standard_Transient Key ();
};


%extend TColStd_StdMapNodeOfMapOfTransient {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_TColStd_StdMapNodeOfMapOfTransient(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_TColStd_StdMapNodeOfMapOfTransient::Handle_TColStd_StdMapNodeOfMapOfTransient %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_TColStd_StdMapNodeOfMapOfTransient;
class Handle_TColStd_StdMapNodeOfMapOfTransient : public Handle_TCollection_MapNode {

    public:
        // constructors
        Handle_TColStd_StdMapNodeOfMapOfTransient();
        Handle_TColStd_StdMapNodeOfMapOfTransient(const Handle_TColStd_StdMapNodeOfMapOfTransient &aHandle);
        Handle_TColStd_StdMapNodeOfMapOfTransient(const TColStd_StdMapNodeOfMapOfTransient *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_TColStd_StdMapNodeOfMapOfTransient DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_TColStd_StdMapNodeOfMapOfTransient {
    TColStd_StdMapNodeOfMapOfTransient* _get_reference() {
    return (TColStd_StdMapNodeOfMapOfTransient*)$self->Access();
    }
};

%extend Handle_TColStd_StdMapNodeOfMapOfTransient {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend TColStd_StdMapNodeOfMapOfTransient {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
