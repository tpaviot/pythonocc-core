/*
Copyright 2008-2014 Thomas Paviot (tpaviot@gmail.com)


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
%include ../common/StandardDefines.i
%include ../common/ExceptionCatcher.i
%include ../common/FunctionTransformers.i
%include ../common/Operators.i

%include TColStd_headers.i

/* typedefs */
/* end typedefs declaration */

/* public enums */
/* end public enums declaration */

%nodefaultctor TColStd_Array1OfAsciiString;
class TColStd_Array1OfAsciiString {
	public:
		%feature("autodoc", "Args:
	Low(Standard_Integer)
	Up(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") TColStd_Array1OfAsciiString;
		 TColStd_Array1OfAsciiString (const Standard_Integer Low,const Standard_Integer Up);
		%feature("autodoc", "Args:
	Item(TCollection_AsciiString)
	Low(Standard_Integer)
	Up(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") TColStd_Array1OfAsciiString;
		 TColStd_Array1OfAsciiString (const TCollection_AsciiString & Item,const Standard_Integer Low,const Standard_Integer Up);
		%feature("autodoc", "Args:
	V(TCollection_AsciiString)

Returns:
	None

No detailed docstring for this function.") Init;
		void Init (const TCollection_AsciiString & V);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Destroy;
		void Destroy ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsAllocated;
		Standard_Boolean IsAllocated ();
		%feature("autodoc", "Args:
	Other(TColStd_Array1OfAsciiString)

Returns:
	TColStd_Array1OfAsciiString

No detailed docstring for this function.") Assign;
		const TColStd_Array1OfAsciiString & Assign (const TColStd_Array1OfAsciiString & Other);
		%feature("autodoc", "Args:
	Other(TColStd_Array1OfAsciiString)

Returns:
	TColStd_Array1OfAsciiString

No detailed docstring for this function.") operator=;
		const TColStd_Array1OfAsciiString & operator = (const TColStd_Array1OfAsciiString & Other);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Length;
		Standard_Integer Length ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Lower;
		Standard_Integer Lower ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Upper;
		Standard_Integer Upper ();
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	Value(TCollection_AsciiString)

Returns:
	None

No detailed docstring for this function.") SetValue;
		void SetValue (const Standard_Integer Index,const TCollection_AsciiString & Value);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	TCollection_AsciiString

No detailed docstring for this function.") Value;
		const TCollection_AsciiString & Value (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	TCollection_AsciiString

No detailed docstring for this function.") ChangeValue;
		TCollection_AsciiString & ChangeValue (const Standard_Integer Index);
};


%feature("shadow") TColStd_Array1OfAsciiString::~TColStd_Array1OfAsciiString %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TColStd_Array1OfAsciiString {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor TColStd_Array1OfBoolean;
class TColStd_Array1OfBoolean {
	public:
		%feature("autodoc", "Args:
	Low(Standard_Integer)
	Up(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") TColStd_Array1OfBoolean;
		 TColStd_Array1OfBoolean (const Standard_Integer Low,const Standard_Integer Up);
		%feature("autodoc", "Args:
	Item(Standard_Boolean)
	Low(Standard_Integer)
	Up(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") TColStd_Array1OfBoolean;
		 TColStd_Array1OfBoolean (const Standard_Boolean & Item,const Standard_Integer Low,const Standard_Integer Up);
		%feature("autodoc", "Args:
	V(Standard_Boolean)

Returns:
	None

No detailed docstring for this function.") Init;
		void Init (const Standard_Boolean & V);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Destroy;
		void Destroy ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsAllocated;
		Standard_Boolean IsAllocated ();
		%feature("autodoc", "Args:
	Other(TColStd_Array1OfBoolean)

Returns:
	TColStd_Array1OfBoolean

No detailed docstring for this function.") Assign;
		const TColStd_Array1OfBoolean & Assign (const TColStd_Array1OfBoolean & Other);
		%feature("autodoc", "Args:
	Other(TColStd_Array1OfBoolean)

Returns:
	TColStd_Array1OfBoolean

No detailed docstring for this function.") operator=;
		const TColStd_Array1OfBoolean & operator = (const TColStd_Array1OfBoolean & Other);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Length;
		Standard_Integer Length ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Lower;
		Standard_Integer Lower ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Upper;
		Standard_Integer Upper ();
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	Value(Standard_Boolean)

Returns:
	None

No detailed docstring for this function.") SetValue;
		void SetValue (const Standard_Integer Index,const Standard_Boolean & Value);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Standard_Boolean

No detailed docstring for this function.") Value;
		const Standard_Boolean & Value (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Standard_Boolean

No detailed docstring for this function.") ChangeValue;
		Standard_Boolean & ChangeValue (const Standard_Integer Index);
};


%feature("shadow") TColStd_Array1OfBoolean::~TColStd_Array1OfBoolean %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TColStd_Array1OfBoolean {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor TColStd_Array1OfByte;
class TColStd_Array1OfByte {
	public:
		%feature("autodoc", "Args:
	Low(Standard_Integer)
	Up(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") TColStd_Array1OfByte;
		 TColStd_Array1OfByte (const Standard_Integer Low,const Standard_Integer Up);
		%feature("autodoc", "Args:
	Item(Standard_Byte)
	Low(Standard_Integer)
	Up(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") TColStd_Array1OfByte;
		 TColStd_Array1OfByte (const Standard_Byte & Item,const Standard_Integer Low,const Standard_Integer Up);
		%feature("autodoc", "Args:
	V(Standard_Byte)

Returns:
	None

No detailed docstring for this function.") Init;
		void Init (const Standard_Byte & V);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Destroy;
		void Destroy ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsAllocated;
		Standard_Boolean IsAllocated ();
		%feature("autodoc", "Args:
	Other(TColStd_Array1OfByte)

Returns:
	TColStd_Array1OfByte

No detailed docstring for this function.") Assign;
		const TColStd_Array1OfByte & Assign (const TColStd_Array1OfByte & Other);
		%feature("autodoc", "Args:
	Other(TColStd_Array1OfByte)

Returns:
	TColStd_Array1OfByte

No detailed docstring for this function.") operator=;
		const TColStd_Array1OfByte & operator = (const TColStd_Array1OfByte & Other);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Length;
		Standard_Integer Length ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Lower;
		Standard_Integer Lower ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Upper;
		Standard_Integer Upper ();
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	Value(Standard_Byte)

Returns:
	None

No detailed docstring for this function.") SetValue;
		void SetValue (const Standard_Integer Index,const Standard_Byte & Value);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Standard_Byte

No detailed docstring for this function.") Value;
		const Standard_Byte & Value (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Standard_Byte

No detailed docstring for this function.") ChangeValue;
		Standard_Byte & ChangeValue (const Standard_Integer Index);
};


%feature("shadow") TColStd_Array1OfByte::~TColStd_Array1OfByte %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TColStd_Array1OfByte {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor TColStd_Array1OfCharacter;
class TColStd_Array1OfCharacter {
	public:
		%feature("autodoc", "Args:
	Low(Standard_Integer)
	Up(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") TColStd_Array1OfCharacter;
		 TColStd_Array1OfCharacter (const Standard_Integer Low,const Standard_Integer Up);
		%feature("autodoc", "Args:
	Item(Standard_Character)
	Low(Standard_Integer)
	Up(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") TColStd_Array1OfCharacter;
		 TColStd_Array1OfCharacter (const Standard_Character & Item,const Standard_Integer Low,const Standard_Integer Up);
		%feature("autodoc", "Args:
	V(Standard_Character)

Returns:
	None

No detailed docstring for this function.") Init;
		void Init (const Standard_Character & V);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Destroy;
		void Destroy ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsAllocated;
		Standard_Boolean IsAllocated ();
		%feature("autodoc", "Args:
	Other(TColStd_Array1OfCharacter)

Returns:
	TColStd_Array1OfCharacter

No detailed docstring for this function.") Assign;
		const TColStd_Array1OfCharacter & Assign (const TColStd_Array1OfCharacter & Other);
		%feature("autodoc", "Args:
	Other(TColStd_Array1OfCharacter)

Returns:
	TColStd_Array1OfCharacter

No detailed docstring for this function.") operator=;
		const TColStd_Array1OfCharacter & operator = (const TColStd_Array1OfCharacter & Other);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Length;
		Standard_Integer Length ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Lower;
		Standard_Integer Lower ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Upper;
		Standard_Integer Upper ();
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	Value(Standard_Character)

Returns:
	None

No detailed docstring for this function.") SetValue;
		void SetValue (const Standard_Integer Index,const Standard_Character & Value);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Standard_Character

No detailed docstring for this function.") Value;
		const Standard_Character & Value (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Standard_Character

No detailed docstring for this function.") ChangeValue;
		Standard_Character & ChangeValue (const Standard_Integer Index);
};


%feature("shadow") TColStd_Array1OfCharacter::~TColStd_Array1OfCharacter %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TColStd_Array1OfCharacter {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor TColStd_Array1OfExtendedString;
class TColStd_Array1OfExtendedString {
	public:
		%feature("autodoc", "Args:
	Low(Standard_Integer)
	Up(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") TColStd_Array1OfExtendedString;
		 TColStd_Array1OfExtendedString (const Standard_Integer Low,const Standard_Integer Up);
		%feature("autodoc", "Args:
	Item(TCollection_ExtendedString)
	Low(Standard_Integer)
	Up(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") TColStd_Array1OfExtendedString;
		 TColStd_Array1OfExtendedString (const TCollection_ExtendedString & Item,const Standard_Integer Low,const Standard_Integer Up);
		%feature("autodoc", "Args:
	V(TCollection_ExtendedString)

Returns:
	None

No detailed docstring for this function.") Init;
		void Init (const TCollection_ExtendedString & V);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Destroy;
		void Destroy ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsAllocated;
		Standard_Boolean IsAllocated ();
		%feature("autodoc", "Args:
	Other(TColStd_Array1OfExtendedString)

Returns:
	TColStd_Array1OfExtendedString

No detailed docstring for this function.") Assign;
		const TColStd_Array1OfExtendedString & Assign (const TColStd_Array1OfExtendedString & Other);
		%feature("autodoc", "Args:
	Other(TColStd_Array1OfExtendedString)

Returns:
	TColStd_Array1OfExtendedString

No detailed docstring for this function.") operator=;
		const TColStd_Array1OfExtendedString & operator = (const TColStd_Array1OfExtendedString & Other);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Length;
		Standard_Integer Length ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Lower;
		Standard_Integer Lower ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Upper;
		Standard_Integer Upper ();
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	Value(TCollection_ExtendedString)

Returns:
	None

No detailed docstring for this function.") SetValue;
		void SetValue (const Standard_Integer Index,const TCollection_ExtendedString & Value);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	TCollection_ExtendedString

No detailed docstring for this function.") Value;
		const TCollection_ExtendedString & Value (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	TCollection_ExtendedString

No detailed docstring for this function.") ChangeValue;
		TCollection_ExtendedString & ChangeValue (const Standard_Integer Index);
};


%feature("shadow") TColStd_Array1OfExtendedString::~TColStd_Array1OfExtendedString %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TColStd_Array1OfExtendedString {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor TColStd_Array1OfInteger;
class TColStd_Array1OfInteger {
	public:
		%feature("autodoc", "Args:
	Low(Standard_Integer)
	Up(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") TColStd_Array1OfInteger;
		 TColStd_Array1OfInteger (const Standard_Integer Low,const Standard_Integer Up);
		%feature("autodoc", "Args:
	Item(Standard_Integer)
	Low(Standard_Integer)
	Up(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") TColStd_Array1OfInteger;
		 TColStd_Array1OfInteger (Standard_Integer &OutValue,const Standard_Integer Low,const Standard_Integer Up);
		%feature("autodoc", "Args:
	V(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Init;
		void Init (Standard_Integer &OutValue);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Destroy;
		void Destroy ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsAllocated;
		Standard_Boolean IsAllocated ();
		%feature("autodoc", "Args:
	Other(TColStd_Array1OfInteger)

Returns:
	TColStd_Array1OfInteger

No detailed docstring for this function.") Assign;
		const TColStd_Array1OfInteger & Assign (const TColStd_Array1OfInteger & Other);
		%feature("autodoc", "Args:
	Other(TColStd_Array1OfInteger)

Returns:
	TColStd_Array1OfInteger

No detailed docstring for this function.") operator=;
		const TColStd_Array1OfInteger & operator = (const TColStd_Array1OfInteger & Other);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Length;
		Standard_Integer Length ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Lower;
		Standard_Integer Lower ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Upper;
		Standard_Integer Upper ();
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	Value(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") SetValue;
		void SetValue (const Standard_Integer Index,Standard_Integer &OutValue);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Standard_Integer

No detailed docstring for this function.") Value;
		const Standard_Integer & Value (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Standard_Integer

No detailed docstring for this function.") ChangeValue;
		Standard_Integer & ChangeValue (const Standard_Integer Index);
};


%feature("shadow") TColStd_Array1OfInteger::~TColStd_Array1OfInteger %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TColStd_Array1OfInteger {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor TColStd_Array1OfListOfInteger;
class TColStd_Array1OfListOfInteger {
	public:
		%feature("autodoc", "Args:
	Low(Standard_Integer)
	Up(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") TColStd_Array1OfListOfInteger;
		 TColStd_Array1OfListOfInteger (const Standard_Integer Low,const Standard_Integer Up);
		%feature("autodoc", "Args:
	Item(TColStd_ListOfInteger)
	Low(Standard_Integer)
	Up(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") TColStd_Array1OfListOfInteger;
		 TColStd_Array1OfListOfInteger (const TColStd_ListOfInteger & Item,const Standard_Integer Low,const Standard_Integer Up);
		%feature("autodoc", "Args:
	V(TColStd_ListOfInteger)

Returns:
	None

No detailed docstring for this function.") Init;
		void Init (const TColStd_ListOfInteger & V);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Destroy;
		void Destroy ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsAllocated;
		Standard_Boolean IsAllocated ();
		%feature("autodoc", "Args:
	Other(TColStd_Array1OfListOfInteger)

Returns:
	TColStd_Array1OfListOfInteger

No detailed docstring for this function.") Assign;
		const TColStd_Array1OfListOfInteger & Assign (const TColStd_Array1OfListOfInteger & Other);
		%feature("autodoc", "Args:
	Other(TColStd_Array1OfListOfInteger)

Returns:
	TColStd_Array1OfListOfInteger

No detailed docstring for this function.") operator=;
		const TColStd_Array1OfListOfInteger & operator = (const TColStd_Array1OfListOfInteger & Other);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Length;
		Standard_Integer Length ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Lower;
		Standard_Integer Lower ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Upper;
		Standard_Integer Upper ();
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	Value(TColStd_ListOfInteger)

Returns:
	None

No detailed docstring for this function.") SetValue;
		void SetValue (const Standard_Integer Index,const TColStd_ListOfInteger & Value);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	TColStd_ListOfInteger

No detailed docstring for this function.") Value;
		const TColStd_ListOfInteger & Value (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	TColStd_ListOfInteger

No detailed docstring for this function.") ChangeValue;
		TColStd_ListOfInteger & ChangeValue (const Standard_Integer Index);
};


%feature("shadow") TColStd_Array1OfListOfInteger::~TColStd_Array1OfListOfInteger %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TColStd_Array1OfListOfInteger {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor TColStd_Array1OfReal;
class TColStd_Array1OfReal {
	public:
		%feature("autodoc", "Args:
	Low(Standard_Integer)
	Up(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") TColStd_Array1OfReal;
		 TColStd_Array1OfReal (const Standard_Integer Low,const Standard_Integer Up);
		%feature("autodoc", "Args:
	Item(Standard_Real)
	Low(Standard_Integer)
	Up(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") TColStd_Array1OfReal;
		 TColStd_Array1OfReal (Standard_Real &OutValue,const Standard_Integer Low,const Standard_Integer Up);
		%feature("autodoc", "Args:
	V(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Init;
		void Init (Standard_Real &OutValue);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Destroy;
		void Destroy ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsAllocated;
		Standard_Boolean IsAllocated ();
		%feature("autodoc", "Args:
	Other(TColStd_Array1OfReal)

Returns:
	TColStd_Array1OfReal

No detailed docstring for this function.") Assign;
		const TColStd_Array1OfReal & Assign (const TColStd_Array1OfReal & Other);
		%feature("autodoc", "Args:
	Other(TColStd_Array1OfReal)

Returns:
	TColStd_Array1OfReal

No detailed docstring for this function.") operator=;
		const TColStd_Array1OfReal & operator = (const TColStd_Array1OfReal & Other);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Length;
		Standard_Integer Length ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Lower;
		Standard_Integer Lower ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Upper;
		Standard_Integer Upper ();
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	Value(Standard_Real)

Returns:
	None

No detailed docstring for this function.") SetValue;
		void SetValue (const Standard_Integer Index,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Standard_Real

No detailed docstring for this function.") Value;
		const Standard_Real & Value (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Standard_Real

No detailed docstring for this function.") ChangeValue;
		Standard_Real & ChangeValue (const Standard_Integer Index);
};


%feature("shadow") TColStd_Array1OfReal::~TColStd_Array1OfReal %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TColStd_Array1OfReal {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor TColStd_Array1OfTransient;
class TColStd_Array1OfTransient {
	public:
		%feature("autodoc", "Args:
	Low(Standard_Integer)
	Up(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") TColStd_Array1OfTransient;
		 TColStd_Array1OfTransient (const Standard_Integer Low,const Standard_Integer Up);
		%feature("autodoc", "Args:
	Item(Handle_Standard_Transient)
	Low(Standard_Integer)
	Up(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") TColStd_Array1OfTransient;
		 TColStd_Array1OfTransient (const Handle_Standard_Transient & Item,const Standard_Integer Low,const Standard_Integer Up);
		%feature("autodoc", "Args:
	V(Handle_Standard_Transient)

Returns:
	None

No detailed docstring for this function.") Init;
		void Init (const Handle_Standard_Transient & V);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Destroy;
		void Destroy ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsAllocated;
		Standard_Boolean IsAllocated ();
		%feature("autodoc", "Args:
	Other(TColStd_Array1OfTransient)

Returns:
	TColStd_Array1OfTransient

No detailed docstring for this function.") Assign;
		const TColStd_Array1OfTransient & Assign (const TColStd_Array1OfTransient & Other);
		%feature("autodoc", "Args:
	Other(TColStd_Array1OfTransient)

Returns:
	TColStd_Array1OfTransient

No detailed docstring for this function.") operator=;
		const TColStd_Array1OfTransient & operator = (const TColStd_Array1OfTransient & Other);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Length;
		Standard_Integer Length ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Lower;
		Standard_Integer Lower ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Upper;
		Standard_Integer Upper ();
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	Value(Handle_Standard_Transient)

Returns:
	None

No detailed docstring for this function.") SetValue;
		void SetValue (const Standard_Integer Index,const Handle_Standard_Transient & Value);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Handle_Standard_Transient

No detailed docstring for this function.") Value;
		const Handle_Standard_Transient & Value (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Handle_Standard_Transient

No detailed docstring for this function.") ChangeValue;
		Handle_Standard_Transient & ChangeValue (const Standard_Integer Index);
};


%feature("shadow") TColStd_Array1OfTransient::~TColStd_Array1OfTransient %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TColStd_Array1OfTransient {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor TColStd_Array2OfBoolean;
class TColStd_Array2OfBoolean {
	public:
		%feature("autodoc", "Args:
	R1(Standard_Integer)
	R2(Standard_Integer)
	C1(Standard_Integer)
	C2(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") TColStd_Array2OfBoolean;
		 TColStd_Array2OfBoolean (const Standard_Integer R1,const Standard_Integer R2,const Standard_Integer C1,const Standard_Integer C2);
		%feature("autodoc", "Args:
	Item(Standard_Boolean)
	R1(Standard_Integer)
	R2(Standard_Integer)
	C1(Standard_Integer)
	C2(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") TColStd_Array2OfBoolean;
		 TColStd_Array2OfBoolean (const Standard_Boolean & Item,const Standard_Integer R1,const Standard_Integer R2,const Standard_Integer C1,const Standard_Integer C2);
		%feature("autodoc", "Args:
	V(Standard_Boolean)

Returns:
	None

No detailed docstring for this function.") Init;
		void Init (const Standard_Boolean & V);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Destroy;
		void Destroy ();
		%feature("autodoc", "Args:
	Other(TColStd_Array2OfBoolean)

Returns:
	TColStd_Array2OfBoolean

No detailed docstring for this function.") Assign;
		const TColStd_Array2OfBoolean & Assign (const TColStd_Array2OfBoolean & Other);
		%feature("autodoc", "Args:
	Other(TColStd_Array2OfBoolean)

Returns:
	TColStd_Array2OfBoolean

No detailed docstring for this function.") operator=;
		const TColStd_Array2OfBoolean & operator = (const TColStd_Array2OfBoolean & Other);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") ColLength;
		Standard_Integer ColLength ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") RowLength;
		Standard_Integer RowLength ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") LowerCol;
		Standard_Integer LowerCol ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") LowerRow;
		Standard_Integer LowerRow ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") UpperCol;
		Standard_Integer UpperCol ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") UpperRow;
		Standard_Integer UpperRow ();
		%feature("autodoc", "Args:
	Row(Standard_Integer)
	Col(Standard_Integer)
	Value(Standard_Boolean)

Returns:
	None

No detailed docstring for this function.") SetValue;
		void SetValue (const Standard_Integer Row,const Standard_Integer Col,const Standard_Boolean & Value);
		%feature("autodoc", "Args:
	Row(Standard_Integer)
	Col(Standard_Integer)

Returns:
	Standard_Boolean

No detailed docstring for this function.") Value;
		const Standard_Boolean & Value (const Standard_Integer Row,const Standard_Integer Col);
		%feature("autodoc", "Args:
	Row(Standard_Integer)
	Col(Standard_Integer)

Returns:
	Standard_Boolean

No detailed docstring for this function.") ChangeValue;
		Standard_Boolean & ChangeValue (const Standard_Integer Row,const Standard_Integer Col);
};


%feature("shadow") TColStd_Array2OfBoolean::~TColStd_Array2OfBoolean %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TColStd_Array2OfBoolean {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor TColStd_Array2OfCharacter;
class TColStd_Array2OfCharacter {
	public:
		%feature("autodoc", "Args:
	R1(Standard_Integer)
	R2(Standard_Integer)
	C1(Standard_Integer)
	C2(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") TColStd_Array2OfCharacter;
		 TColStd_Array2OfCharacter (const Standard_Integer R1,const Standard_Integer R2,const Standard_Integer C1,const Standard_Integer C2);
		%feature("autodoc", "Args:
	Item(Standard_Character)
	R1(Standard_Integer)
	R2(Standard_Integer)
	C1(Standard_Integer)
	C2(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") TColStd_Array2OfCharacter;
		 TColStd_Array2OfCharacter (const Standard_Character & Item,const Standard_Integer R1,const Standard_Integer R2,const Standard_Integer C1,const Standard_Integer C2);
		%feature("autodoc", "Args:
	V(Standard_Character)

Returns:
	None

No detailed docstring for this function.") Init;
		void Init (const Standard_Character & V);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Destroy;
		void Destroy ();
		%feature("autodoc", "Args:
	Other(TColStd_Array2OfCharacter)

Returns:
	TColStd_Array2OfCharacter

No detailed docstring for this function.") Assign;
		const TColStd_Array2OfCharacter & Assign (const TColStd_Array2OfCharacter & Other);
		%feature("autodoc", "Args:
	Other(TColStd_Array2OfCharacter)

Returns:
	TColStd_Array2OfCharacter

No detailed docstring for this function.") operator=;
		const TColStd_Array2OfCharacter & operator = (const TColStd_Array2OfCharacter & Other);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") ColLength;
		Standard_Integer ColLength ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") RowLength;
		Standard_Integer RowLength ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") LowerCol;
		Standard_Integer LowerCol ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") LowerRow;
		Standard_Integer LowerRow ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") UpperCol;
		Standard_Integer UpperCol ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") UpperRow;
		Standard_Integer UpperRow ();
		%feature("autodoc", "Args:
	Row(Standard_Integer)
	Col(Standard_Integer)
	Value(Standard_Character)

Returns:
	None

No detailed docstring for this function.") SetValue;
		void SetValue (const Standard_Integer Row,const Standard_Integer Col,const Standard_Character & Value);
		%feature("autodoc", "Args:
	Row(Standard_Integer)
	Col(Standard_Integer)

Returns:
	Standard_Character

No detailed docstring for this function.") Value;
		const Standard_Character & Value (const Standard_Integer Row,const Standard_Integer Col);
		%feature("autodoc", "Args:
	Row(Standard_Integer)
	Col(Standard_Integer)

Returns:
	Standard_Character

No detailed docstring for this function.") ChangeValue;
		Standard_Character & ChangeValue (const Standard_Integer Row,const Standard_Integer Col);
};


%feature("shadow") TColStd_Array2OfCharacter::~TColStd_Array2OfCharacter %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TColStd_Array2OfCharacter {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor TColStd_Array2OfInteger;
class TColStd_Array2OfInteger {
	public:
		%feature("autodoc", "Args:
	R1(Standard_Integer)
	R2(Standard_Integer)
	C1(Standard_Integer)
	C2(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") TColStd_Array2OfInteger;
		 TColStd_Array2OfInteger (const Standard_Integer R1,const Standard_Integer R2,const Standard_Integer C1,const Standard_Integer C2);
		%feature("autodoc", "Args:
	Item(Standard_Integer)
	R1(Standard_Integer)
	R2(Standard_Integer)
	C1(Standard_Integer)
	C2(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") TColStd_Array2OfInteger;
		 TColStd_Array2OfInteger (Standard_Integer &OutValue,const Standard_Integer R1,const Standard_Integer R2,const Standard_Integer C1,const Standard_Integer C2);
		%feature("autodoc", "Args:
	V(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Init;
		void Init (Standard_Integer &OutValue);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Destroy;
		void Destroy ();
		%feature("autodoc", "Args:
	Other(TColStd_Array2OfInteger)

Returns:
	TColStd_Array2OfInteger

No detailed docstring for this function.") Assign;
		const TColStd_Array2OfInteger & Assign (const TColStd_Array2OfInteger & Other);
		%feature("autodoc", "Args:
	Other(TColStd_Array2OfInteger)

Returns:
	TColStd_Array2OfInteger

No detailed docstring for this function.") operator=;
		const TColStd_Array2OfInteger & operator = (const TColStd_Array2OfInteger & Other);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") ColLength;
		Standard_Integer ColLength ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") RowLength;
		Standard_Integer RowLength ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") LowerCol;
		Standard_Integer LowerCol ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") LowerRow;
		Standard_Integer LowerRow ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") UpperCol;
		Standard_Integer UpperCol ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") UpperRow;
		Standard_Integer UpperRow ();
		%feature("autodoc", "Args:
	Row(Standard_Integer)
	Col(Standard_Integer)
	Value(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") SetValue;
		void SetValue (const Standard_Integer Row,const Standard_Integer Col,Standard_Integer &OutValue);
		%feature("autodoc", "Args:
	Row(Standard_Integer)
	Col(Standard_Integer)

Returns:
	Standard_Integer

No detailed docstring for this function.") Value;
		const Standard_Integer & Value (const Standard_Integer Row,const Standard_Integer Col);
		%feature("autodoc", "Args:
	Row(Standard_Integer)
	Col(Standard_Integer)

Returns:
	Standard_Integer

No detailed docstring for this function.") ChangeValue;
		Standard_Integer & ChangeValue (const Standard_Integer Row,const Standard_Integer Col);
};


%feature("shadow") TColStd_Array2OfInteger::~TColStd_Array2OfInteger %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TColStd_Array2OfInteger {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor TColStd_Array2OfReal;
class TColStd_Array2OfReal {
	public:
		%feature("autodoc", "Args:
	R1(Standard_Integer)
	R2(Standard_Integer)
	C1(Standard_Integer)
	C2(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") TColStd_Array2OfReal;
		 TColStd_Array2OfReal (const Standard_Integer R1,const Standard_Integer R2,const Standard_Integer C1,const Standard_Integer C2);
		%feature("autodoc", "Args:
	Item(Standard_Real)
	R1(Standard_Integer)
	R2(Standard_Integer)
	C1(Standard_Integer)
	C2(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") TColStd_Array2OfReal;
		 TColStd_Array2OfReal (Standard_Real &OutValue,const Standard_Integer R1,const Standard_Integer R2,const Standard_Integer C1,const Standard_Integer C2);
		%feature("autodoc", "Args:
	V(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Init;
		void Init (Standard_Real &OutValue);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Destroy;
		void Destroy ();
		%feature("autodoc", "Args:
	Other(TColStd_Array2OfReal)

Returns:
	TColStd_Array2OfReal

No detailed docstring for this function.") Assign;
		const TColStd_Array2OfReal & Assign (const TColStd_Array2OfReal & Other);
		%feature("autodoc", "Args:
	Other(TColStd_Array2OfReal)

Returns:
	TColStd_Array2OfReal

No detailed docstring for this function.") operator=;
		const TColStd_Array2OfReal & operator = (const TColStd_Array2OfReal & Other);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") ColLength;
		Standard_Integer ColLength ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") RowLength;
		Standard_Integer RowLength ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") LowerCol;
		Standard_Integer LowerCol ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") LowerRow;
		Standard_Integer LowerRow ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") UpperCol;
		Standard_Integer UpperCol ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") UpperRow;
		Standard_Integer UpperRow ();
		%feature("autodoc", "Args:
	Row(Standard_Integer)
	Col(Standard_Integer)
	Value(Standard_Real)

Returns:
	None

No detailed docstring for this function.") SetValue;
		void SetValue (const Standard_Integer Row,const Standard_Integer Col,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	Row(Standard_Integer)
	Col(Standard_Integer)

Returns:
	Standard_Real

No detailed docstring for this function.") Value;
		const Standard_Real & Value (const Standard_Integer Row,const Standard_Integer Col);
		%feature("autodoc", "Args:
	Row(Standard_Integer)
	Col(Standard_Integer)

Returns:
	Standard_Real

No detailed docstring for this function.") ChangeValue;
		Standard_Real & ChangeValue (const Standard_Integer Row,const Standard_Integer Col);
};


%feature("shadow") TColStd_Array2OfReal::~TColStd_Array2OfReal %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TColStd_Array2OfReal {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor TColStd_Array2OfTransient;
class TColStd_Array2OfTransient {
	public:
		%feature("autodoc", "Args:
	R1(Standard_Integer)
	R2(Standard_Integer)
	C1(Standard_Integer)
	C2(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") TColStd_Array2OfTransient;
		 TColStd_Array2OfTransient (const Standard_Integer R1,const Standard_Integer R2,const Standard_Integer C1,const Standard_Integer C2);
		%feature("autodoc", "Args:
	Item(Handle_Standard_Transient)
	R1(Standard_Integer)
	R2(Standard_Integer)
	C1(Standard_Integer)
	C2(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") TColStd_Array2OfTransient;
		 TColStd_Array2OfTransient (const Handle_Standard_Transient & Item,const Standard_Integer R1,const Standard_Integer R2,const Standard_Integer C1,const Standard_Integer C2);
		%feature("autodoc", "Args:
	V(Handle_Standard_Transient)

Returns:
	None

No detailed docstring for this function.") Init;
		void Init (const Handle_Standard_Transient & V);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Destroy;
		void Destroy ();
		%feature("autodoc", "Args:
	Other(TColStd_Array2OfTransient)

Returns:
	TColStd_Array2OfTransient

No detailed docstring for this function.") Assign;
		const TColStd_Array2OfTransient & Assign (const TColStd_Array2OfTransient & Other);
		%feature("autodoc", "Args:
	Other(TColStd_Array2OfTransient)

Returns:
	TColStd_Array2OfTransient

No detailed docstring for this function.") operator=;
		const TColStd_Array2OfTransient & operator = (const TColStd_Array2OfTransient & Other);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") ColLength;
		Standard_Integer ColLength ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") RowLength;
		Standard_Integer RowLength ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") LowerCol;
		Standard_Integer LowerCol ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") LowerRow;
		Standard_Integer LowerRow ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") UpperCol;
		Standard_Integer UpperCol ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") UpperRow;
		Standard_Integer UpperRow ();
		%feature("autodoc", "Args:
	Row(Standard_Integer)
	Col(Standard_Integer)
	Value(Handle_Standard_Transient)

Returns:
	None

No detailed docstring for this function.") SetValue;
		void SetValue (const Standard_Integer Row,const Standard_Integer Col,const Handle_Standard_Transient & Value);
		%feature("autodoc", "Args:
	Row(Standard_Integer)
	Col(Standard_Integer)

Returns:
	Handle_Standard_Transient

No detailed docstring for this function.") Value;
		const Handle_Standard_Transient & Value (const Standard_Integer Row,const Standard_Integer Col);
		%feature("autodoc", "Args:
	Row(Standard_Integer)
	Col(Standard_Integer)

Returns:
	Handle_Standard_Transient

No detailed docstring for this function.") ChangeValue;
		Handle_Standard_Transient & ChangeValue (const Standard_Integer Row,const Standard_Integer Col);
};


%feature("shadow") TColStd_Array2OfTransient::~TColStd_Array2OfTransient %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TColStd_Array2OfTransient {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor TColStd_DataMapIteratorOfDataMapOfAsciiStringInteger;
class TColStd_DataMapIteratorOfDataMapOfAsciiStringInteger : public TCollection_BasicMapIterator {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") TColStd_DataMapIteratorOfDataMapOfAsciiStringInteger;
		 TColStd_DataMapIteratorOfDataMapOfAsciiStringInteger ();
		%feature("autodoc", "Args:
	aMap(TColStd_DataMapOfAsciiStringInteger)

Returns:
	None

No detailed docstring for this function.") TColStd_DataMapIteratorOfDataMapOfAsciiStringInteger;
		 TColStd_DataMapIteratorOfDataMapOfAsciiStringInteger (const TColStd_DataMapOfAsciiStringInteger & aMap);
		%feature("autodoc", "Args:
	aMap(TColStd_DataMapOfAsciiStringInteger)

Returns:
	None

No detailed docstring for this function.") Initialize;
		void Initialize (const TColStd_DataMapOfAsciiStringInteger & aMap);
		%feature("autodoc", "Args:
	None
Returns:
	TCollection_AsciiString

No detailed docstring for this function.") Key;
		const TCollection_AsciiString & Key ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Value;
		const Standard_Integer & Value ();
};


%feature("shadow") TColStd_DataMapIteratorOfDataMapOfAsciiStringInteger::~TColStd_DataMapIteratorOfDataMapOfAsciiStringInteger %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TColStd_DataMapIteratorOfDataMapOfAsciiStringInteger {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor TColStd_DataMapIteratorOfDataMapOfIntegerInteger;
class TColStd_DataMapIteratorOfDataMapOfIntegerInteger : public TCollection_BasicMapIterator {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") TColStd_DataMapIteratorOfDataMapOfIntegerInteger;
		 TColStd_DataMapIteratorOfDataMapOfIntegerInteger ();
		%feature("autodoc", "Args:
	aMap(TColStd_DataMapOfIntegerInteger)

Returns:
	None

No detailed docstring for this function.") TColStd_DataMapIteratorOfDataMapOfIntegerInteger;
		 TColStd_DataMapIteratorOfDataMapOfIntegerInteger (const TColStd_DataMapOfIntegerInteger & aMap);
		%feature("autodoc", "Args:
	aMap(TColStd_DataMapOfIntegerInteger)

Returns:
	None

No detailed docstring for this function.") Initialize;
		void Initialize (const TColStd_DataMapOfIntegerInteger & aMap);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Key;
		const Standard_Integer & Key ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Value;
		const Standard_Integer & Value ();
};


%feature("shadow") TColStd_DataMapIteratorOfDataMapOfIntegerInteger::~TColStd_DataMapIteratorOfDataMapOfIntegerInteger %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TColStd_DataMapIteratorOfDataMapOfIntegerInteger {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor TColStd_DataMapIteratorOfDataMapOfIntegerListOfInteger;
class TColStd_DataMapIteratorOfDataMapOfIntegerListOfInteger : public TCollection_BasicMapIterator {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") TColStd_DataMapIteratorOfDataMapOfIntegerListOfInteger;
		 TColStd_DataMapIteratorOfDataMapOfIntegerListOfInteger ();
		%feature("autodoc", "Args:
	aMap(TColStd_DataMapOfIntegerListOfInteger)

Returns:
	None

No detailed docstring for this function.") TColStd_DataMapIteratorOfDataMapOfIntegerListOfInteger;
		 TColStd_DataMapIteratorOfDataMapOfIntegerListOfInteger (const TColStd_DataMapOfIntegerListOfInteger & aMap);
		%feature("autodoc", "Args:
	aMap(TColStd_DataMapOfIntegerListOfInteger)

Returns:
	None

No detailed docstring for this function.") Initialize;
		void Initialize (const TColStd_DataMapOfIntegerListOfInteger & aMap);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Key;
		const Standard_Integer & Key ();
		%feature("autodoc", "Args:
	None
Returns:
	TColStd_ListOfInteger

No detailed docstring for this function.") Value;
		const TColStd_ListOfInteger & Value ();
};


%feature("shadow") TColStd_DataMapIteratorOfDataMapOfIntegerListOfInteger::~TColStd_DataMapIteratorOfDataMapOfIntegerListOfInteger %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TColStd_DataMapIteratorOfDataMapOfIntegerListOfInteger {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor TColStd_DataMapIteratorOfDataMapOfIntegerReal;
class TColStd_DataMapIteratorOfDataMapOfIntegerReal : public TCollection_BasicMapIterator {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") TColStd_DataMapIteratorOfDataMapOfIntegerReal;
		 TColStd_DataMapIteratorOfDataMapOfIntegerReal ();
		%feature("autodoc", "Args:
	aMap(TColStd_DataMapOfIntegerReal)

Returns:
	None

No detailed docstring for this function.") TColStd_DataMapIteratorOfDataMapOfIntegerReal;
		 TColStd_DataMapIteratorOfDataMapOfIntegerReal (const TColStd_DataMapOfIntegerReal & aMap);
		%feature("autodoc", "Args:
	aMap(TColStd_DataMapOfIntegerReal)

Returns:
	None

No detailed docstring for this function.") Initialize;
		void Initialize (const TColStd_DataMapOfIntegerReal & aMap);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Key;
		const Standard_Integer & Key ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

No detailed docstring for this function.") Value;
		const Standard_Real & Value ();
};


%feature("shadow") TColStd_DataMapIteratorOfDataMapOfIntegerReal::~TColStd_DataMapIteratorOfDataMapOfIntegerReal %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TColStd_DataMapIteratorOfDataMapOfIntegerReal {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor TColStd_DataMapIteratorOfDataMapOfIntegerTransient;
class TColStd_DataMapIteratorOfDataMapOfIntegerTransient : public TCollection_BasicMapIterator {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") TColStd_DataMapIteratorOfDataMapOfIntegerTransient;
		 TColStd_DataMapIteratorOfDataMapOfIntegerTransient ();
		%feature("autodoc", "Args:
	aMap(TColStd_DataMapOfIntegerTransient)

Returns:
	None

No detailed docstring for this function.") TColStd_DataMapIteratorOfDataMapOfIntegerTransient;
		 TColStd_DataMapIteratorOfDataMapOfIntegerTransient (const TColStd_DataMapOfIntegerTransient & aMap);
		%feature("autodoc", "Args:
	aMap(TColStd_DataMapOfIntegerTransient)

Returns:
	None

No detailed docstring for this function.") Initialize;
		void Initialize (const TColStd_DataMapOfIntegerTransient & aMap);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Key;
		const Standard_Integer & Key ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Standard_Transient

No detailed docstring for this function.") Value;
		const Handle_Standard_Transient & Value ();
};


%feature("shadow") TColStd_DataMapIteratorOfDataMapOfIntegerTransient::~TColStd_DataMapIteratorOfDataMapOfIntegerTransient %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TColStd_DataMapIteratorOfDataMapOfIntegerTransient {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor TColStd_DataMapIteratorOfDataMapOfStringInteger;
class TColStd_DataMapIteratorOfDataMapOfStringInteger : public TCollection_BasicMapIterator {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") TColStd_DataMapIteratorOfDataMapOfStringInteger;
		 TColStd_DataMapIteratorOfDataMapOfStringInteger ();
		%feature("autodoc", "Args:
	aMap(TColStd_DataMapOfStringInteger)

Returns:
	None

No detailed docstring for this function.") TColStd_DataMapIteratorOfDataMapOfStringInteger;
		 TColStd_DataMapIteratorOfDataMapOfStringInteger (const TColStd_DataMapOfStringInteger & aMap);
		%feature("autodoc", "Args:
	aMap(TColStd_DataMapOfStringInteger)

Returns:
	None

No detailed docstring for this function.") Initialize;
		void Initialize (const TColStd_DataMapOfStringInteger & aMap);
		%feature("autodoc", "Args:
	None
Returns:
	TCollection_ExtendedString

No detailed docstring for this function.") Key;
		const TCollection_ExtendedString & Key ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Value;
		const Standard_Integer & Value ();
};


%feature("shadow") TColStd_DataMapIteratorOfDataMapOfStringInteger::~TColStd_DataMapIteratorOfDataMapOfStringInteger %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TColStd_DataMapIteratorOfDataMapOfStringInteger {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor TColStd_DataMapIteratorOfDataMapOfTransientTransient;
class TColStd_DataMapIteratorOfDataMapOfTransientTransient : public TCollection_BasicMapIterator {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") TColStd_DataMapIteratorOfDataMapOfTransientTransient;
		 TColStd_DataMapIteratorOfDataMapOfTransientTransient ();
		%feature("autodoc", "Args:
	aMap(TColStd_DataMapOfTransientTransient)

Returns:
	None

No detailed docstring for this function.") TColStd_DataMapIteratorOfDataMapOfTransientTransient;
		 TColStd_DataMapIteratorOfDataMapOfTransientTransient (const TColStd_DataMapOfTransientTransient & aMap);
		%feature("autodoc", "Args:
	aMap(TColStd_DataMapOfTransientTransient)

Returns:
	None

No detailed docstring for this function.") Initialize;
		void Initialize (const TColStd_DataMapOfTransientTransient & aMap);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Standard_Transient

No detailed docstring for this function.") Key;
		const Handle_Standard_Transient & Key ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Standard_Transient

No detailed docstring for this function.") Value;
		const Handle_Standard_Transient & Value ();
};


%feature("shadow") TColStd_DataMapIteratorOfDataMapOfTransientTransient::~TColStd_DataMapIteratorOfDataMapOfTransientTransient %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TColStd_DataMapIteratorOfDataMapOfTransientTransient {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor TColStd_DataMapNodeOfDataMapOfAsciiStringInteger;
class TColStd_DataMapNodeOfDataMapOfAsciiStringInteger : public TCollection_MapNode {
	public:
		%feature("autodoc", "Args:
	K(TCollection_AsciiString)
	I(Standard_Integer)
	n(TCollection_MapNodePtr)

Returns:
	None

No detailed docstring for this function.") TColStd_DataMapNodeOfDataMapOfAsciiStringInteger;
		 TColStd_DataMapNodeOfDataMapOfAsciiStringInteger (const TCollection_AsciiString & K,Standard_Integer &OutValue,const TCollection_MapNodePtr & n);
		%feature("autodoc", "Args:
	None
Returns:
	TCollection_AsciiString

No detailed docstring for this function.") Key;
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


%feature("shadow") TColStd_DataMapNodeOfDataMapOfAsciiStringInteger::~TColStd_DataMapNodeOfDataMapOfAsciiStringInteger %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TColStd_DataMapNodeOfDataMapOfAsciiStringInteger {
	void _kill_pointed() {
		delete $self;
	}
};
%extend TColStd_DataMapNodeOfDataMapOfAsciiStringInteger {
	Handle_TColStd_DataMapNodeOfDataMapOfAsciiStringInteger GetHandle() {
	return *(Handle_TColStd_DataMapNodeOfDataMapOfAsciiStringInteger*) &$self;
	}
};

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
    TColStd_DataMapNodeOfDataMapOfAsciiStringInteger* GetObject() {
    return (TColStd_DataMapNodeOfDataMapOfAsciiStringInteger*)$self->Access();
    }
};
%feature("shadow") Handle_TColStd_DataMapNodeOfDataMapOfAsciiStringInteger::~Handle_TColStd_DataMapNodeOfDataMapOfAsciiStringInteger %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_TColStd_DataMapNodeOfDataMapOfAsciiStringInteger {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor TColStd_DataMapNodeOfDataMapOfIntegerInteger;
class TColStd_DataMapNodeOfDataMapOfIntegerInteger : public TCollection_MapNode {
	public:
		%feature("autodoc", "Args:
	K(Standard_Integer)
	I(Standard_Integer)
	n(TCollection_MapNodePtr)

Returns:
	None

No detailed docstring for this function.") TColStd_DataMapNodeOfDataMapOfIntegerInteger;
		 TColStd_DataMapNodeOfDataMapOfIntegerInteger (Standard_Integer &OutValue,Standard_Integer &OutValue,const TCollection_MapNodePtr & n);

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


%feature("shadow") TColStd_DataMapNodeOfDataMapOfIntegerInteger::~TColStd_DataMapNodeOfDataMapOfIntegerInteger %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TColStd_DataMapNodeOfDataMapOfIntegerInteger {
	void _kill_pointed() {
		delete $self;
	}
};
%extend TColStd_DataMapNodeOfDataMapOfIntegerInteger {
	Handle_TColStd_DataMapNodeOfDataMapOfIntegerInteger GetHandle() {
	return *(Handle_TColStd_DataMapNodeOfDataMapOfIntegerInteger*) &$self;
	}
};

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
    TColStd_DataMapNodeOfDataMapOfIntegerInteger* GetObject() {
    return (TColStd_DataMapNodeOfDataMapOfIntegerInteger*)$self->Access();
    }
};
%feature("shadow") Handle_TColStd_DataMapNodeOfDataMapOfIntegerInteger::~Handle_TColStd_DataMapNodeOfDataMapOfIntegerInteger %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_TColStd_DataMapNodeOfDataMapOfIntegerInteger {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor TColStd_DataMapNodeOfDataMapOfIntegerListOfInteger;
class TColStd_DataMapNodeOfDataMapOfIntegerListOfInteger : public TCollection_MapNode {
	public:
		%feature("autodoc", "Args:
	K(Standard_Integer)
	I(TColStd_ListOfInteger)
	n(TCollection_MapNodePtr)

Returns:
	None

No detailed docstring for this function.") TColStd_DataMapNodeOfDataMapOfIntegerListOfInteger;
		 TColStd_DataMapNodeOfDataMapOfIntegerListOfInteger (Standard_Integer &OutValue,const TColStd_ListOfInteger & I,const TCollection_MapNodePtr & n);

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
            		%feature("autodoc", "Args:
	None
Returns:
	TColStd_ListOfInteger

No detailed docstring for this function.") Value;
		TColStd_ListOfInteger & Value ();
};


%feature("shadow") TColStd_DataMapNodeOfDataMapOfIntegerListOfInteger::~TColStd_DataMapNodeOfDataMapOfIntegerListOfInteger %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TColStd_DataMapNodeOfDataMapOfIntegerListOfInteger {
	void _kill_pointed() {
		delete $self;
	}
};
%extend TColStd_DataMapNodeOfDataMapOfIntegerListOfInteger {
	Handle_TColStd_DataMapNodeOfDataMapOfIntegerListOfInteger GetHandle() {
	return *(Handle_TColStd_DataMapNodeOfDataMapOfIntegerListOfInteger*) &$self;
	}
};

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
    TColStd_DataMapNodeOfDataMapOfIntegerListOfInteger* GetObject() {
    return (TColStd_DataMapNodeOfDataMapOfIntegerListOfInteger*)$self->Access();
    }
};
%feature("shadow") Handle_TColStd_DataMapNodeOfDataMapOfIntegerListOfInteger::~Handle_TColStd_DataMapNodeOfDataMapOfIntegerListOfInteger %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_TColStd_DataMapNodeOfDataMapOfIntegerListOfInteger {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor TColStd_DataMapNodeOfDataMapOfIntegerReal;
class TColStd_DataMapNodeOfDataMapOfIntegerReal : public TCollection_MapNode {
	public:
		%feature("autodoc", "Args:
	K(Standard_Integer)
	I(Standard_Real)
	n(TCollection_MapNodePtr)

Returns:
	None

No detailed docstring for this function.") TColStd_DataMapNodeOfDataMapOfIntegerReal;
		 TColStd_DataMapNodeOfDataMapOfIntegerReal (Standard_Integer &OutValue,Standard_Real &OutValue,const TCollection_MapNodePtr & n);

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


%feature("shadow") TColStd_DataMapNodeOfDataMapOfIntegerReal::~TColStd_DataMapNodeOfDataMapOfIntegerReal %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TColStd_DataMapNodeOfDataMapOfIntegerReal {
	void _kill_pointed() {
		delete $self;
	}
};
%extend TColStd_DataMapNodeOfDataMapOfIntegerReal {
	Handle_TColStd_DataMapNodeOfDataMapOfIntegerReal GetHandle() {
	return *(Handle_TColStd_DataMapNodeOfDataMapOfIntegerReal*) &$self;
	}
};

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
    TColStd_DataMapNodeOfDataMapOfIntegerReal* GetObject() {
    return (TColStd_DataMapNodeOfDataMapOfIntegerReal*)$self->Access();
    }
};
%feature("shadow") Handle_TColStd_DataMapNodeOfDataMapOfIntegerReal::~Handle_TColStd_DataMapNodeOfDataMapOfIntegerReal %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_TColStd_DataMapNodeOfDataMapOfIntegerReal {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor TColStd_DataMapNodeOfDataMapOfIntegerTransient;
class TColStd_DataMapNodeOfDataMapOfIntegerTransient : public TCollection_MapNode {
	public:
		%feature("autodoc", "Args:
	K(Standard_Integer)
	I(Handle_Standard_Transient)
	n(TCollection_MapNodePtr)

Returns:
	None

No detailed docstring for this function.") TColStd_DataMapNodeOfDataMapOfIntegerTransient;
		 TColStd_DataMapNodeOfDataMapOfIntegerTransient (Standard_Integer &OutValue,const Handle_Standard_Transient & I,const TCollection_MapNodePtr & n);

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
            		%feature("autodoc", "Args:
	None
Returns:
	Handle_Standard_Transient

No detailed docstring for this function.") Value;
		Handle_Standard_Transient & Value ();
};


%feature("shadow") TColStd_DataMapNodeOfDataMapOfIntegerTransient::~TColStd_DataMapNodeOfDataMapOfIntegerTransient %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TColStd_DataMapNodeOfDataMapOfIntegerTransient {
	void _kill_pointed() {
		delete $self;
	}
};
%extend TColStd_DataMapNodeOfDataMapOfIntegerTransient {
	Handle_TColStd_DataMapNodeOfDataMapOfIntegerTransient GetHandle() {
	return *(Handle_TColStd_DataMapNodeOfDataMapOfIntegerTransient*) &$self;
	}
};

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
    TColStd_DataMapNodeOfDataMapOfIntegerTransient* GetObject() {
    return (TColStd_DataMapNodeOfDataMapOfIntegerTransient*)$self->Access();
    }
};
%feature("shadow") Handle_TColStd_DataMapNodeOfDataMapOfIntegerTransient::~Handle_TColStd_DataMapNodeOfDataMapOfIntegerTransient %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_TColStd_DataMapNodeOfDataMapOfIntegerTransient {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor TColStd_DataMapNodeOfDataMapOfStringInteger;
class TColStd_DataMapNodeOfDataMapOfStringInteger : public TCollection_MapNode {
	public:
		%feature("autodoc", "Args:
	K(TCollection_ExtendedString)
	I(Standard_Integer)
	n(TCollection_MapNodePtr)

Returns:
	None

No detailed docstring for this function.") TColStd_DataMapNodeOfDataMapOfStringInteger;
		 TColStd_DataMapNodeOfDataMapOfStringInteger (const TCollection_ExtendedString & K,Standard_Integer &OutValue,const TCollection_MapNodePtr & n);
		%feature("autodoc", "Args:
	None
Returns:
	TCollection_ExtendedString

No detailed docstring for this function.") Key;
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


%feature("shadow") TColStd_DataMapNodeOfDataMapOfStringInteger::~TColStd_DataMapNodeOfDataMapOfStringInteger %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TColStd_DataMapNodeOfDataMapOfStringInteger {
	void _kill_pointed() {
		delete $self;
	}
};
%extend TColStd_DataMapNodeOfDataMapOfStringInteger {
	Handle_TColStd_DataMapNodeOfDataMapOfStringInteger GetHandle() {
	return *(Handle_TColStd_DataMapNodeOfDataMapOfStringInteger*) &$self;
	}
};

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
    TColStd_DataMapNodeOfDataMapOfStringInteger* GetObject() {
    return (TColStd_DataMapNodeOfDataMapOfStringInteger*)$self->Access();
    }
};
%feature("shadow") Handle_TColStd_DataMapNodeOfDataMapOfStringInteger::~Handle_TColStd_DataMapNodeOfDataMapOfStringInteger %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_TColStd_DataMapNodeOfDataMapOfStringInteger {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor TColStd_DataMapNodeOfDataMapOfTransientTransient;
class TColStd_DataMapNodeOfDataMapOfTransientTransient : public TCollection_MapNode {
	public:
		%feature("autodoc", "Args:
	K(Handle_Standard_Transient)
	I(Handle_Standard_Transient)
	n(TCollection_MapNodePtr)

Returns:
	None

No detailed docstring for this function.") TColStd_DataMapNodeOfDataMapOfTransientTransient;
		 TColStd_DataMapNodeOfDataMapOfTransientTransient (const Handle_Standard_Transient & K,const Handle_Standard_Transient & I,const TCollection_MapNodePtr & n);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Standard_Transient

No detailed docstring for this function.") Key;
		Handle_Standard_Transient & Key ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Standard_Transient

No detailed docstring for this function.") Value;
		Handle_Standard_Transient & Value ();
};


%feature("shadow") TColStd_DataMapNodeOfDataMapOfTransientTransient::~TColStd_DataMapNodeOfDataMapOfTransientTransient %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TColStd_DataMapNodeOfDataMapOfTransientTransient {
	void _kill_pointed() {
		delete $self;
	}
};
%extend TColStd_DataMapNodeOfDataMapOfTransientTransient {
	Handle_TColStd_DataMapNodeOfDataMapOfTransientTransient GetHandle() {
	return *(Handle_TColStd_DataMapNodeOfDataMapOfTransientTransient*) &$self;
	}
};

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
    TColStd_DataMapNodeOfDataMapOfTransientTransient* GetObject() {
    return (TColStd_DataMapNodeOfDataMapOfTransientTransient*)$self->Access();
    }
};
%feature("shadow") Handle_TColStd_DataMapNodeOfDataMapOfTransientTransient::~Handle_TColStd_DataMapNodeOfDataMapOfTransientTransient %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_TColStd_DataMapNodeOfDataMapOfTransientTransient {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor TColStd_DataMapOfAsciiStringInteger;
class TColStd_DataMapOfAsciiStringInteger : public TCollection_BasicMap {
	public:
		%feature("autodoc", "Args:
	NbBuckets(Standard_Integer)=1

Returns:
	None

No detailed docstring for this function.") TColStd_DataMapOfAsciiStringInteger;
		 TColStd_DataMapOfAsciiStringInteger (const Standard_Integer NbBuckets = 1);
		%feature("autodoc", "Args:
	Other(TColStd_DataMapOfAsciiStringInteger)

Returns:
	TColStd_DataMapOfAsciiStringInteger

No detailed docstring for this function.") Assign;
		TColStd_DataMapOfAsciiStringInteger & Assign (const TColStd_DataMapOfAsciiStringInteger & Other);
		%feature("autodoc", "Args:
	Other(TColStd_DataMapOfAsciiStringInteger)

Returns:
	TColStd_DataMapOfAsciiStringInteger

No detailed docstring for this function.") operator=;
		TColStd_DataMapOfAsciiStringInteger & operator = (const TColStd_DataMapOfAsciiStringInteger & Other);
		%feature("autodoc", "Args:
	NbBuckets(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") ReSize;
		void ReSize (const Standard_Integer NbBuckets);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	K(TCollection_AsciiString)
	I(Standard_Integer)

Returns:
	Standard_Boolean

No detailed docstring for this function.") Bind;
		Standard_Boolean Bind (const TCollection_AsciiString & K,Standard_Integer &OutValue);
		%feature("autodoc", "Args:
	K(TCollection_AsciiString)

Returns:
	Standard_Boolean

No detailed docstring for this function.") IsBound;
		Standard_Boolean IsBound (const TCollection_AsciiString & K);
		%feature("autodoc", "Args:
	K(TCollection_AsciiString)

Returns:
	Standard_Boolean

No detailed docstring for this function.") UnBind;
		Standard_Boolean UnBind (const TCollection_AsciiString & K);
		%feature("autodoc", "Args:
	K(TCollection_AsciiString)

Returns:
	Standard_Integer

No detailed docstring for this function.") Find;
		const Standard_Integer & Find (const TCollection_AsciiString & K);
		%feature("autodoc", "Args:
	K(TCollection_AsciiString)

Returns:
	Standard_Integer

No detailed docstring for this function.") ChangeFind;
		Standard_Integer & ChangeFind (const TCollection_AsciiString & K);
		%feature("autodoc", "Args:
	K(TCollection_AsciiString)

Returns:
	Standard_Address

No detailed docstring for this function.") Find1;
		Standard_Address Find1 (const TCollection_AsciiString & K);
		%feature("autodoc", "Args:
	K(TCollection_AsciiString)

Returns:
	Standard_Address

No detailed docstring for this function.") ChangeFind1;
		Standard_Address ChangeFind1 (const TCollection_AsciiString & K);
};


%feature("shadow") TColStd_DataMapOfAsciiStringInteger::~TColStd_DataMapOfAsciiStringInteger %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TColStd_DataMapOfAsciiStringInteger {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor TColStd_DataMapOfIntegerInteger;
class TColStd_DataMapOfIntegerInteger : public TCollection_BasicMap {
	public:
		%feature("autodoc", "Args:
	NbBuckets(Standard_Integer)=1

Returns:
	None

No detailed docstring for this function.") TColStd_DataMapOfIntegerInteger;
		 TColStd_DataMapOfIntegerInteger (const Standard_Integer NbBuckets = 1);
		%feature("autodoc", "Args:
	Other(TColStd_DataMapOfIntegerInteger)

Returns:
	TColStd_DataMapOfIntegerInteger

No detailed docstring for this function.") Assign;
		TColStd_DataMapOfIntegerInteger & Assign (const TColStd_DataMapOfIntegerInteger & Other);
		%feature("autodoc", "Args:
	Other(TColStd_DataMapOfIntegerInteger)

Returns:
	TColStd_DataMapOfIntegerInteger

No detailed docstring for this function.") operator=;
		TColStd_DataMapOfIntegerInteger & operator = (const TColStd_DataMapOfIntegerInteger & Other);
		%feature("autodoc", "Args:
	NbBuckets(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") ReSize;
		void ReSize (const Standard_Integer NbBuckets);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	K(Standard_Integer)
	I(Standard_Integer)

Returns:
	Standard_Boolean

No detailed docstring for this function.") Bind;
		Standard_Boolean Bind (Standard_Integer &OutValue,Standard_Integer &OutValue);
		%feature("autodoc", "Args:
	K(Standard_Integer)

Returns:
	Standard_Boolean

No detailed docstring for this function.") IsBound;
		Standard_Boolean IsBound (Standard_Integer &OutValue);
		%feature("autodoc", "Args:
	K(Standard_Integer)

Returns:
	Standard_Boolean

No detailed docstring for this function.") UnBind;
		Standard_Boolean UnBind (Standard_Integer &OutValue);
		%feature("autodoc", "Args:
	K(Standard_Integer)

Returns:
	Standard_Integer

No detailed docstring for this function.") Find;
		const Standard_Integer & Find (Standard_Integer &OutValue);
		%feature("autodoc", "Args:
	K(Standard_Integer)

Returns:
	Standard_Integer

No detailed docstring for this function.") ChangeFind;
		Standard_Integer & ChangeFind (Standard_Integer &OutValue);
		%feature("autodoc", "Args:
	K(Standard_Integer)

Returns:
	Standard_Address

No detailed docstring for this function.") Find1;
		Standard_Address Find1 (Standard_Integer &OutValue);
		%feature("autodoc", "Args:
	K(Standard_Integer)

Returns:
	Standard_Address

No detailed docstring for this function.") ChangeFind1;
		Standard_Address ChangeFind1 (Standard_Integer &OutValue);
};


%feature("shadow") TColStd_DataMapOfIntegerInteger::~TColStd_DataMapOfIntegerInteger %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TColStd_DataMapOfIntegerInteger {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor TColStd_DataMapOfIntegerListOfInteger;
class TColStd_DataMapOfIntegerListOfInteger : public TCollection_BasicMap {
	public:
		%feature("autodoc", "Args:
	NbBuckets(Standard_Integer)=1

Returns:
	None

No detailed docstring for this function.") TColStd_DataMapOfIntegerListOfInteger;
		 TColStd_DataMapOfIntegerListOfInteger (const Standard_Integer NbBuckets = 1);
		%feature("autodoc", "Args:
	Other(TColStd_DataMapOfIntegerListOfInteger)

Returns:
	TColStd_DataMapOfIntegerListOfInteger

No detailed docstring for this function.") Assign;
		TColStd_DataMapOfIntegerListOfInteger & Assign (const TColStd_DataMapOfIntegerListOfInteger & Other);
		%feature("autodoc", "Args:
	Other(TColStd_DataMapOfIntegerListOfInteger)

Returns:
	TColStd_DataMapOfIntegerListOfInteger

No detailed docstring for this function.") operator=;
		TColStd_DataMapOfIntegerListOfInteger & operator = (const TColStd_DataMapOfIntegerListOfInteger & Other);
		%feature("autodoc", "Args:
	NbBuckets(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") ReSize;
		void ReSize (const Standard_Integer NbBuckets);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	K(Standard_Integer)
	I(TColStd_ListOfInteger)

Returns:
	Standard_Boolean

No detailed docstring for this function.") Bind;
		Standard_Boolean Bind (Standard_Integer &OutValue,const TColStd_ListOfInteger & I);
		%feature("autodoc", "Args:
	K(Standard_Integer)

Returns:
	Standard_Boolean

No detailed docstring for this function.") IsBound;
		Standard_Boolean IsBound (Standard_Integer &OutValue);
		%feature("autodoc", "Args:
	K(Standard_Integer)

Returns:
	Standard_Boolean

No detailed docstring for this function.") UnBind;
		Standard_Boolean UnBind (Standard_Integer &OutValue);
		%feature("autodoc", "Args:
	K(Standard_Integer)

Returns:
	TColStd_ListOfInteger

No detailed docstring for this function.") Find;
		const TColStd_ListOfInteger & Find (Standard_Integer &OutValue);
		%feature("autodoc", "Args:
	K(Standard_Integer)

Returns:
	TColStd_ListOfInteger

No detailed docstring for this function.") ChangeFind;
		TColStd_ListOfInteger & ChangeFind (Standard_Integer &OutValue);
		%feature("autodoc", "Args:
	K(Standard_Integer)

Returns:
	Standard_Address

No detailed docstring for this function.") Find1;
		Standard_Address Find1 (Standard_Integer &OutValue);
		%feature("autodoc", "Args:
	K(Standard_Integer)

Returns:
	Standard_Address

No detailed docstring for this function.") ChangeFind1;
		Standard_Address ChangeFind1 (Standard_Integer &OutValue);
};


%feature("shadow") TColStd_DataMapOfIntegerListOfInteger::~TColStd_DataMapOfIntegerListOfInteger %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TColStd_DataMapOfIntegerListOfInteger {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor TColStd_DataMapOfIntegerReal;
class TColStd_DataMapOfIntegerReal : public TCollection_BasicMap {
	public:
		%feature("autodoc", "Args:
	NbBuckets(Standard_Integer)=1

Returns:
	None

No detailed docstring for this function.") TColStd_DataMapOfIntegerReal;
		 TColStd_DataMapOfIntegerReal (const Standard_Integer NbBuckets = 1);
		%feature("autodoc", "Args:
	Other(TColStd_DataMapOfIntegerReal)

Returns:
	TColStd_DataMapOfIntegerReal

No detailed docstring for this function.") Assign;
		TColStd_DataMapOfIntegerReal & Assign (const TColStd_DataMapOfIntegerReal & Other);
		%feature("autodoc", "Args:
	Other(TColStd_DataMapOfIntegerReal)

Returns:
	TColStd_DataMapOfIntegerReal

No detailed docstring for this function.") operator=;
		TColStd_DataMapOfIntegerReal & operator = (const TColStd_DataMapOfIntegerReal & Other);
		%feature("autodoc", "Args:
	NbBuckets(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") ReSize;
		void ReSize (const Standard_Integer NbBuckets);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	K(Standard_Integer)
	I(Standard_Real)

Returns:
	Standard_Boolean

No detailed docstring for this function.") Bind;
		Standard_Boolean Bind (Standard_Integer &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	K(Standard_Integer)

Returns:
	Standard_Boolean

No detailed docstring for this function.") IsBound;
		Standard_Boolean IsBound (Standard_Integer &OutValue);
		%feature("autodoc", "Args:
	K(Standard_Integer)

Returns:
	Standard_Boolean

No detailed docstring for this function.") UnBind;
		Standard_Boolean UnBind (Standard_Integer &OutValue);
		%feature("autodoc", "Args:
	K(Standard_Integer)

Returns:
	Standard_Real

No detailed docstring for this function.") Find;
		const Standard_Real & Find (Standard_Integer &OutValue);
		%feature("autodoc", "Args:
	K(Standard_Integer)

Returns:
	Standard_Real

No detailed docstring for this function.") ChangeFind;
		Standard_Real & ChangeFind (Standard_Integer &OutValue);
		%feature("autodoc", "Args:
	K(Standard_Integer)

Returns:
	Standard_Address

No detailed docstring for this function.") Find1;
		Standard_Address Find1 (Standard_Integer &OutValue);
		%feature("autodoc", "Args:
	K(Standard_Integer)

Returns:
	Standard_Address

No detailed docstring for this function.") ChangeFind1;
		Standard_Address ChangeFind1 (Standard_Integer &OutValue);
};


%feature("shadow") TColStd_DataMapOfIntegerReal::~TColStd_DataMapOfIntegerReal %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TColStd_DataMapOfIntegerReal {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor TColStd_DataMapOfIntegerTransient;
class TColStd_DataMapOfIntegerTransient : public TCollection_BasicMap {
	public:
		%feature("autodoc", "Args:
	NbBuckets(Standard_Integer)=1

Returns:
	None

No detailed docstring for this function.") TColStd_DataMapOfIntegerTransient;
		 TColStd_DataMapOfIntegerTransient (const Standard_Integer NbBuckets = 1);
		%feature("autodoc", "Args:
	Other(TColStd_DataMapOfIntegerTransient)

Returns:
	TColStd_DataMapOfIntegerTransient

No detailed docstring for this function.") Assign;
		TColStd_DataMapOfIntegerTransient & Assign (const TColStd_DataMapOfIntegerTransient & Other);
		%feature("autodoc", "Args:
	Other(TColStd_DataMapOfIntegerTransient)

Returns:
	TColStd_DataMapOfIntegerTransient

No detailed docstring for this function.") operator=;
		TColStd_DataMapOfIntegerTransient & operator = (const TColStd_DataMapOfIntegerTransient & Other);
		%feature("autodoc", "Args:
	NbBuckets(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") ReSize;
		void ReSize (const Standard_Integer NbBuckets);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	K(Standard_Integer)
	I(Handle_Standard_Transient)

Returns:
	Standard_Boolean

No detailed docstring for this function.") Bind;
		Standard_Boolean Bind (Standard_Integer &OutValue,const Handle_Standard_Transient & I);
		%feature("autodoc", "Args:
	K(Standard_Integer)

Returns:
	Standard_Boolean

No detailed docstring for this function.") IsBound;
		Standard_Boolean IsBound (Standard_Integer &OutValue);
		%feature("autodoc", "Args:
	K(Standard_Integer)

Returns:
	Standard_Boolean

No detailed docstring for this function.") UnBind;
		Standard_Boolean UnBind (Standard_Integer &OutValue);
		%feature("autodoc", "Args:
	K(Standard_Integer)

Returns:
	Handle_Standard_Transient

No detailed docstring for this function.") Find;
		const Handle_Standard_Transient & Find (Standard_Integer &OutValue);
		%feature("autodoc", "Args:
	K(Standard_Integer)

Returns:
	Handle_Standard_Transient

No detailed docstring for this function.") ChangeFind;
		Handle_Standard_Transient & ChangeFind (Standard_Integer &OutValue);
		%feature("autodoc", "Args:
	K(Standard_Integer)

Returns:
	Standard_Address

No detailed docstring for this function.") Find1;
		Standard_Address Find1 (Standard_Integer &OutValue);
		%feature("autodoc", "Args:
	K(Standard_Integer)

Returns:
	Standard_Address

No detailed docstring for this function.") ChangeFind1;
		Standard_Address ChangeFind1 (Standard_Integer &OutValue);
};


%feature("shadow") TColStd_DataMapOfIntegerTransient::~TColStd_DataMapOfIntegerTransient %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TColStd_DataMapOfIntegerTransient {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor TColStd_DataMapOfStringInteger;
class TColStd_DataMapOfStringInteger : public TCollection_BasicMap {
	public:
		%feature("autodoc", "Args:
	NbBuckets(Standard_Integer)=1

Returns:
	None

No detailed docstring for this function.") TColStd_DataMapOfStringInteger;
		 TColStd_DataMapOfStringInteger (const Standard_Integer NbBuckets = 1);
		%feature("autodoc", "Args:
	Other(TColStd_DataMapOfStringInteger)

Returns:
	TColStd_DataMapOfStringInteger

No detailed docstring for this function.") Assign;
		TColStd_DataMapOfStringInteger & Assign (const TColStd_DataMapOfStringInteger & Other);
		%feature("autodoc", "Args:
	Other(TColStd_DataMapOfStringInteger)

Returns:
	TColStd_DataMapOfStringInteger

No detailed docstring for this function.") operator=;
		TColStd_DataMapOfStringInteger & operator = (const TColStd_DataMapOfStringInteger & Other);
		%feature("autodoc", "Args:
	NbBuckets(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") ReSize;
		void ReSize (const Standard_Integer NbBuckets);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	K(TCollection_ExtendedString)
	I(Standard_Integer)

Returns:
	Standard_Boolean

No detailed docstring for this function.") Bind;
		Standard_Boolean Bind (const TCollection_ExtendedString & K,Standard_Integer &OutValue);
		%feature("autodoc", "Args:
	K(TCollection_ExtendedString)

Returns:
	Standard_Boolean

No detailed docstring for this function.") IsBound;
		Standard_Boolean IsBound (const TCollection_ExtendedString & K);
		%feature("autodoc", "Args:
	K(TCollection_ExtendedString)

Returns:
	Standard_Boolean

No detailed docstring for this function.") UnBind;
		Standard_Boolean UnBind (const TCollection_ExtendedString & K);
		%feature("autodoc", "Args:
	K(TCollection_ExtendedString)

Returns:
	Standard_Integer

No detailed docstring for this function.") Find;
		const Standard_Integer & Find (const TCollection_ExtendedString & K);
		%feature("autodoc", "Args:
	K(TCollection_ExtendedString)

Returns:
	Standard_Integer

No detailed docstring for this function.") ChangeFind;
		Standard_Integer & ChangeFind (const TCollection_ExtendedString & K);
		%feature("autodoc", "Args:
	K(TCollection_ExtendedString)

Returns:
	Standard_Address

No detailed docstring for this function.") Find1;
		Standard_Address Find1 (const TCollection_ExtendedString & K);
		%feature("autodoc", "Args:
	K(TCollection_ExtendedString)

Returns:
	Standard_Address

No detailed docstring for this function.") ChangeFind1;
		Standard_Address ChangeFind1 (const TCollection_ExtendedString & K);
};


%feature("shadow") TColStd_DataMapOfStringInteger::~TColStd_DataMapOfStringInteger %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TColStd_DataMapOfStringInteger {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor TColStd_DataMapOfTransientTransient;
class TColStd_DataMapOfTransientTransient : public TCollection_BasicMap {
	public:
		%feature("autodoc", "Args:
	NbBuckets(Standard_Integer)=1

Returns:
	None

No detailed docstring for this function.") TColStd_DataMapOfTransientTransient;
		 TColStd_DataMapOfTransientTransient (const Standard_Integer NbBuckets = 1);
		%feature("autodoc", "Args:
	Other(TColStd_DataMapOfTransientTransient)

Returns:
	TColStd_DataMapOfTransientTransient

No detailed docstring for this function.") Assign;
		TColStd_DataMapOfTransientTransient & Assign (const TColStd_DataMapOfTransientTransient & Other);
		%feature("autodoc", "Args:
	Other(TColStd_DataMapOfTransientTransient)

Returns:
	TColStd_DataMapOfTransientTransient

No detailed docstring for this function.") operator=;
		TColStd_DataMapOfTransientTransient & operator = (const TColStd_DataMapOfTransientTransient & Other);
		%feature("autodoc", "Args:
	NbBuckets(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") ReSize;
		void ReSize (const Standard_Integer NbBuckets);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	K(Handle_Standard_Transient)
	I(Handle_Standard_Transient)

Returns:
	Standard_Boolean

No detailed docstring for this function.") Bind;
		Standard_Boolean Bind (const Handle_Standard_Transient & K,const Handle_Standard_Transient & I);
		%feature("autodoc", "Args:
	K(Handle_Standard_Transient)

Returns:
	Standard_Boolean

No detailed docstring for this function.") IsBound;
		Standard_Boolean IsBound (const Handle_Standard_Transient & K);
		%feature("autodoc", "Args:
	K(Handle_Standard_Transient)

Returns:
	Standard_Boolean

No detailed docstring for this function.") UnBind;
		Standard_Boolean UnBind (const Handle_Standard_Transient & K);
		%feature("autodoc", "Args:
	K(Handle_Standard_Transient)

Returns:
	Handle_Standard_Transient

No detailed docstring for this function.") Find;
		const Handle_Standard_Transient & Find (const Handle_Standard_Transient & K);
		%feature("autodoc", "Args:
	K(Handle_Standard_Transient)

Returns:
	Handle_Standard_Transient

No detailed docstring for this function.") ChangeFind;
		Handle_Standard_Transient & ChangeFind (const Handle_Standard_Transient & K);
		%feature("autodoc", "Args:
	K(Handle_Standard_Transient)

Returns:
	Standard_Address

No detailed docstring for this function.") Find1;
		Standard_Address Find1 (const Handle_Standard_Transient & K);
		%feature("autodoc", "Args:
	K(Handle_Standard_Transient)

Returns:
	Standard_Address

No detailed docstring for this function.") ChangeFind1;
		Standard_Address ChangeFind1 (const Handle_Standard_Transient & K);
};


%feature("shadow") TColStd_DataMapOfTransientTransient::~TColStd_DataMapOfTransientTransient %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TColStd_DataMapOfTransientTransient {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor TColStd_HArray1OfAsciiString;
class TColStd_HArray1OfAsciiString : public MMgt_TShared {
	public:
		%feature("autodoc", "Args:
	Low(Standard_Integer)
	Up(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") TColStd_HArray1OfAsciiString;
		 TColStd_HArray1OfAsciiString (const Standard_Integer Low,const Standard_Integer Up);
		%feature("autodoc", "Args:
	Low(Standard_Integer)
	Up(Standard_Integer)
	V(TCollection_AsciiString)

Returns:
	None

No detailed docstring for this function.") TColStd_HArray1OfAsciiString;
		 TColStd_HArray1OfAsciiString (const Standard_Integer Low,const Standard_Integer Up,const TCollection_AsciiString & V);
		%feature("autodoc", "Args:
	V(TCollection_AsciiString)

Returns:
	None

No detailed docstring for this function.") Init;
		void Init (const TCollection_AsciiString & V);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Length;
		Standard_Integer Length ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Lower;
		Standard_Integer Lower ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Upper;
		Standard_Integer Upper ();
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	Value(TCollection_AsciiString)

Returns:
	None

No detailed docstring for this function.") SetValue;
		void SetValue (const Standard_Integer Index,const TCollection_AsciiString & Value);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	TCollection_AsciiString

No detailed docstring for this function.") Value;
		const TCollection_AsciiString & Value (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	TCollection_AsciiString

No detailed docstring for this function.") ChangeValue;
		TCollection_AsciiString & ChangeValue (const Standard_Integer Index);
		%feature("autodoc", "Args:
	None
Returns:
	TColStd_Array1OfAsciiString

No detailed docstring for this function.") Array1;
		const TColStd_Array1OfAsciiString & Array1 ();
		%feature("autodoc", "Args:
	None
Returns:
	TColStd_Array1OfAsciiString

No detailed docstring for this function.") ChangeArray1;
		TColStd_Array1OfAsciiString & ChangeArray1 ();
};


%feature("shadow") TColStd_HArray1OfAsciiString::~TColStd_HArray1OfAsciiString %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TColStd_HArray1OfAsciiString {
	void _kill_pointed() {
		delete $self;
	}
};
%extend TColStd_HArray1OfAsciiString {
	Handle_TColStd_HArray1OfAsciiString GetHandle() {
	return *(Handle_TColStd_HArray1OfAsciiString*) &$self;
	}
};

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
    TColStd_HArray1OfAsciiString* GetObject() {
    return (TColStd_HArray1OfAsciiString*)$self->Access();
    }
};
%feature("shadow") Handle_TColStd_HArray1OfAsciiString::~Handle_TColStd_HArray1OfAsciiString %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_TColStd_HArray1OfAsciiString {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor TColStd_HArray1OfBoolean;
class TColStd_HArray1OfBoolean : public MMgt_TShared {
	public:
		%feature("autodoc", "Args:
	Low(Standard_Integer)
	Up(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") TColStd_HArray1OfBoolean;
		 TColStd_HArray1OfBoolean (const Standard_Integer Low,const Standard_Integer Up);
		%feature("autodoc", "Args:
	Low(Standard_Integer)
	Up(Standard_Integer)
	V(Standard_Boolean)

Returns:
	None

No detailed docstring for this function.") TColStd_HArray1OfBoolean;
		 TColStd_HArray1OfBoolean (const Standard_Integer Low,const Standard_Integer Up,const Standard_Boolean & V);
		%feature("autodoc", "Args:
	V(Standard_Boolean)

Returns:
	None

No detailed docstring for this function.") Init;
		void Init (const Standard_Boolean & V);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Length;
		Standard_Integer Length ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Lower;
		Standard_Integer Lower ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Upper;
		Standard_Integer Upper ();
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	Value(Standard_Boolean)

Returns:
	None

No detailed docstring for this function.") SetValue;
		void SetValue (const Standard_Integer Index,const Standard_Boolean & Value);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Standard_Boolean

No detailed docstring for this function.") Value;
		const Standard_Boolean & Value (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Standard_Boolean

No detailed docstring for this function.") ChangeValue;
		Standard_Boolean & ChangeValue (const Standard_Integer Index);
		%feature("autodoc", "Args:
	None
Returns:
	TColStd_Array1OfBoolean

No detailed docstring for this function.") Array1;
		const TColStd_Array1OfBoolean & Array1 ();
		%feature("autodoc", "Args:
	None
Returns:
	TColStd_Array1OfBoolean

No detailed docstring for this function.") ChangeArray1;
		TColStd_Array1OfBoolean & ChangeArray1 ();
};


%feature("shadow") TColStd_HArray1OfBoolean::~TColStd_HArray1OfBoolean %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TColStd_HArray1OfBoolean {
	void _kill_pointed() {
		delete $self;
	}
};
%extend TColStd_HArray1OfBoolean {
	Handle_TColStd_HArray1OfBoolean GetHandle() {
	return *(Handle_TColStd_HArray1OfBoolean*) &$self;
	}
};

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
    TColStd_HArray1OfBoolean* GetObject() {
    return (TColStd_HArray1OfBoolean*)$self->Access();
    }
};
%feature("shadow") Handle_TColStd_HArray1OfBoolean::~Handle_TColStd_HArray1OfBoolean %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_TColStd_HArray1OfBoolean {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor TColStd_HArray1OfByte;
class TColStd_HArray1OfByte : public MMgt_TShared {
	public:
		%feature("autodoc", "Args:
	Low(Standard_Integer)
	Up(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") TColStd_HArray1OfByte;
		 TColStd_HArray1OfByte (const Standard_Integer Low,const Standard_Integer Up);
		%feature("autodoc", "Args:
	Low(Standard_Integer)
	Up(Standard_Integer)
	V(Standard_Byte)

Returns:
	None

No detailed docstring for this function.") TColStd_HArray1OfByte;
		 TColStd_HArray1OfByte (const Standard_Integer Low,const Standard_Integer Up,const Standard_Byte & V);
		%feature("autodoc", "Args:
	V(Standard_Byte)

Returns:
	None

No detailed docstring for this function.") Init;
		void Init (const Standard_Byte & V);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Length;
		Standard_Integer Length ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Lower;
		Standard_Integer Lower ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Upper;
		Standard_Integer Upper ();
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	Value(Standard_Byte)

Returns:
	None

No detailed docstring for this function.") SetValue;
		void SetValue (const Standard_Integer Index,const Standard_Byte & Value);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Standard_Byte

No detailed docstring for this function.") Value;
		const Standard_Byte & Value (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Standard_Byte

No detailed docstring for this function.") ChangeValue;
		Standard_Byte & ChangeValue (const Standard_Integer Index);
		%feature("autodoc", "Args:
	None
Returns:
	TColStd_Array1OfByte

No detailed docstring for this function.") Array1;
		const TColStd_Array1OfByte & Array1 ();
		%feature("autodoc", "Args:
	None
Returns:
	TColStd_Array1OfByte

No detailed docstring for this function.") ChangeArray1;
		TColStd_Array1OfByte & ChangeArray1 ();
};


%feature("shadow") TColStd_HArray1OfByte::~TColStd_HArray1OfByte %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TColStd_HArray1OfByte {
	void _kill_pointed() {
		delete $self;
	}
};
%extend TColStd_HArray1OfByte {
	Handle_TColStd_HArray1OfByte GetHandle() {
	return *(Handle_TColStd_HArray1OfByte*) &$self;
	}
};

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
    TColStd_HArray1OfByte* GetObject() {
    return (TColStd_HArray1OfByte*)$self->Access();
    }
};
%feature("shadow") Handle_TColStd_HArray1OfByte::~Handle_TColStd_HArray1OfByte %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_TColStd_HArray1OfByte {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor TColStd_HArray1OfCharacter;
class TColStd_HArray1OfCharacter : public MMgt_TShared {
	public:
		%feature("autodoc", "Args:
	Low(Standard_Integer)
	Up(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") TColStd_HArray1OfCharacter;
		 TColStd_HArray1OfCharacter (const Standard_Integer Low,const Standard_Integer Up);
		%feature("autodoc", "Args:
	Low(Standard_Integer)
	Up(Standard_Integer)
	V(Standard_Character)

Returns:
	None

No detailed docstring for this function.") TColStd_HArray1OfCharacter;
		 TColStd_HArray1OfCharacter (const Standard_Integer Low,const Standard_Integer Up,const Standard_Character & V);
		%feature("autodoc", "Args:
	V(Standard_Character)

Returns:
	None

No detailed docstring for this function.") Init;
		void Init (const Standard_Character & V);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Length;
		Standard_Integer Length ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Lower;
		Standard_Integer Lower ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Upper;
		Standard_Integer Upper ();
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	Value(Standard_Character)

Returns:
	None

No detailed docstring for this function.") SetValue;
		void SetValue (const Standard_Integer Index,const Standard_Character & Value);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Standard_Character

No detailed docstring for this function.") Value;
		const Standard_Character & Value (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Standard_Character

No detailed docstring for this function.") ChangeValue;
		Standard_Character & ChangeValue (const Standard_Integer Index);
		%feature("autodoc", "Args:
	None
Returns:
	TColStd_Array1OfCharacter

No detailed docstring for this function.") Array1;
		const TColStd_Array1OfCharacter & Array1 ();
		%feature("autodoc", "Args:
	None
Returns:
	TColStd_Array1OfCharacter

No detailed docstring for this function.") ChangeArray1;
		TColStd_Array1OfCharacter & ChangeArray1 ();
};


%feature("shadow") TColStd_HArray1OfCharacter::~TColStd_HArray1OfCharacter %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TColStd_HArray1OfCharacter {
	void _kill_pointed() {
		delete $self;
	}
};
%extend TColStd_HArray1OfCharacter {
	Handle_TColStd_HArray1OfCharacter GetHandle() {
	return *(Handle_TColStd_HArray1OfCharacter*) &$self;
	}
};

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
    TColStd_HArray1OfCharacter* GetObject() {
    return (TColStd_HArray1OfCharacter*)$self->Access();
    }
};
%feature("shadow") Handle_TColStd_HArray1OfCharacter::~Handle_TColStd_HArray1OfCharacter %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_TColStd_HArray1OfCharacter {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor TColStd_HArray1OfExtendedString;
class TColStd_HArray1OfExtendedString : public MMgt_TShared {
	public:
		%feature("autodoc", "Args:
	Low(Standard_Integer)
	Up(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") TColStd_HArray1OfExtendedString;
		 TColStd_HArray1OfExtendedString (const Standard_Integer Low,const Standard_Integer Up);
		%feature("autodoc", "Args:
	Low(Standard_Integer)
	Up(Standard_Integer)
	V(TCollection_ExtendedString)

Returns:
	None

No detailed docstring for this function.") TColStd_HArray1OfExtendedString;
		 TColStd_HArray1OfExtendedString (const Standard_Integer Low,const Standard_Integer Up,const TCollection_ExtendedString & V);
		%feature("autodoc", "Args:
	V(TCollection_ExtendedString)

Returns:
	None

No detailed docstring for this function.") Init;
		void Init (const TCollection_ExtendedString & V);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Length;
		Standard_Integer Length ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Lower;
		Standard_Integer Lower ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Upper;
		Standard_Integer Upper ();
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	Value(TCollection_ExtendedString)

Returns:
	None

No detailed docstring for this function.") SetValue;
		void SetValue (const Standard_Integer Index,const TCollection_ExtendedString & Value);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	TCollection_ExtendedString

No detailed docstring for this function.") Value;
		const TCollection_ExtendedString & Value (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	TCollection_ExtendedString

No detailed docstring for this function.") ChangeValue;
		TCollection_ExtendedString & ChangeValue (const Standard_Integer Index);
		%feature("autodoc", "Args:
	None
Returns:
	TColStd_Array1OfExtendedString

No detailed docstring for this function.") Array1;
		const TColStd_Array1OfExtendedString & Array1 ();
		%feature("autodoc", "Args:
	None
Returns:
	TColStd_Array1OfExtendedString

No detailed docstring for this function.") ChangeArray1;
		TColStd_Array1OfExtendedString & ChangeArray1 ();
};


%feature("shadow") TColStd_HArray1OfExtendedString::~TColStd_HArray1OfExtendedString %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TColStd_HArray1OfExtendedString {
	void _kill_pointed() {
		delete $self;
	}
};
%extend TColStd_HArray1OfExtendedString {
	Handle_TColStd_HArray1OfExtendedString GetHandle() {
	return *(Handle_TColStd_HArray1OfExtendedString*) &$self;
	}
};

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
    TColStd_HArray1OfExtendedString* GetObject() {
    return (TColStd_HArray1OfExtendedString*)$self->Access();
    }
};
%feature("shadow") Handle_TColStd_HArray1OfExtendedString::~Handle_TColStd_HArray1OfExtendedString %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_TColStd_HArray1OfExtendedString {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor TColStd_HArray1OfInteger;
class TColStd_HArray1OfInteger : public MMgt_TShared {
	public:
		%feature("autodoc", "Args:
	Low(Standard_Integer)
	Up(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") TColStd_HArray1OfInteger;
		 TColStd_HArray1OfInteger (const Standard_Integer Low,const Standard_Integer Up);
		%feature("autodoc", "Args:
	Low(Standard_Integer)
	Up(Standard_Integer)
	V(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") TColStd_HArray1OfInteger;
		 TColStd_HArray1OfInteger (const Standard_Integer Low,const Standard_Integer Up,Standard_Integer &OutValue);
		%feature("autodoc", "Args:
	V(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Init;
		void Init (Standard_Integer &OutValue);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Length;
		Standard_Integer Length ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Lower;
		Standard_Integer Lower ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Upper;
		Standard_Integer Upper ();
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	Value(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") SetValue;
		void SetValue (const Standard_Integer Index,Standard_Integer &OutValue);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Standard_Integer

No detailed docstring for this function.") Value;
		const Standard_Integer & Value (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Standard_Integer

No detailed docstring for this function.") ChangeValue;
		Standard_Integer & ChangeValue (const Standard_Integer Index);
		%feature("autodoc", "Args:
	None
Returns:
	TColStd_Array1OfInteger

No detailed docstring for this function.") Array1;
		const TColStd_Array1OfInteger & Array1 ();
		%feature("autodoc", "Args:
	None
Returns:
	TColStd_Array1OfInteger

No detailed docstring for this function.") ChangeArray1;
		TColStd_Array1OfInteger & ChangeArray1 ();
};


%feature("shadow") TColStd_HArray1OfInteger::~TColStd_HArray1OfInteger %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TColStd_HArray1OfInteger {
	void _kill_pointed() {
		delete $self;
	}
};
%extend TColStd_HArray1OfInteger {
	Handle_TColStd_HArray1OfInteger GetHandle() {
	return *(Handle_TColStd_HArray1OfInteger*) &$self;
	}
};

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
    TColStd_HArray1OfInteger* GetObject() {
    return (TColStd_HArray1OfInteger*)$self->Access();
    }
};
%feature("shadow") Handle_TColStd_HArray1OfInteger::~Handle_TColStd_HArray1OfInteger %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_TColStd_HArray1OfInteger {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor TColStd_HArray1OfListOfInteger;
class TColStd_HArray1OfListOfInteger : public MMgt_TShared {
	public:
		%feature("autodoc", "Args:
	Low(Standard_Integer)
	Up(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") TColStd_HArray1OfListOfInteger;
		 TColStd_HArray1OfListOfInteger (const Standard_Integer Low,const Standard_Integer Up);
		%feature("autodoc", "Args:
	Low(Standard_Integer)
	Up(Standard_Integer)
	V(TColStd_ListOfInteger)

Returns:
	None

No detailed docstring for this function.") TColStd_HArray1OfListOfInteger;
		 TColStd_HArray1OfListOfInteger (const Standard_Integer Low,const Standard_Integer Up,const TColStd_ListOfInteger & V);
		%feature("autodoc", "Args:
	V(TColStd_ListOfInteger)

Returns:
	None

No detailed docstring for this function.") Init;
		void Init (const TColStd_ListOfInteger & V);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Length;
		Standard_Integer Length ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Lower;
		Standard_Integer Lower ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Upper;
		Standard_Integer Upper ();
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	Value(TColStd_ListOfInteger)

Returns:
	None

No detailed docstring for this function.") SetValue;
		void SetValue (const Standard_Integer Index,const TColStd_ListOfInteger & Value);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	TColStd_ListOfInteger

No detailed docstring for this function.") Value;
		const TColStd_ListOfInteger & Value (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	TColStd_ListOfInteger

No detailed docstring for this function.") ChangeValue;
		TColStd_ListOfInteger & ChangeValue (const Standard_Integer Index);
		%feature("autodoc", "Args:
	None
Returns:
	TColStd_Array1OfListOfInteger

No detailed docstring for this function.") Array1;
		const TColStd_Array1OfListOfInteger & Array1 ();
		%feature("autodoc", "Args:
	None
Returns:
	TColStd_Array1OfListOfInteger

No detailed docstring for this function.") ChangeArray1;
		TColStd_Array1OfListOfInteger & ChangeArray1 ();
};


%feature("shadow") TColStd_HArray1OfListOfInteger::~TColStd_HArray1OfListOfInteger %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TColStd_HArray1OfListOfInteger {
	void _kill_pointed() {
		delete $self;
	}
};
%extend TColStd_HArray1OfListOfInteger {
	Handle_TColStd_HArray1OfListOfInteger GetHandle() {
	return *(Handle_TColStd_HArray1OfListOfInteger*) &$self;
	}
};

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
    TColStd_HArray1OfListOfInteger* GetObject() {
    return (TColStd_HArray1OfListOfInteger*)$self->Access();
    }
};
%feature("shadow") Handle_TColStd_HArray1OfListOfInteger::~Handle_TColStd_HArray1OfListOfInteger %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_TColStd_HArray1OfListOfInteger {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor TColStd_HArray1OfReal;
class TColStd_HArray1OfReal : public MMgt_TShared {
	public:
		%feature("autodoc", "Args:
	Low(Standard_Integer)
	Up(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") TColStd_HArray1OfReal;
		 TColStd_HArray1OfReal (const Standard_Integer Low,const Standard_Integer Up);
		%feature("autodoc", "Args:
	Low(Standard_Integer)
	Up(Standard_Integer)
	V(Standard_Real)

Returns:
	None

No detailed docstring for this function.") TColStd_HArray1OfReal;
		 TColStd_HArray1OfReal (const Standard_Integer Low,const Standard_Integer Up,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	V(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Init;
		void Init (Standard_Real &OutValue);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Length;
		Standard_Integer Length ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Lower;
		Standard_Integer Lower ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Upper;
		Standard_Integer Upper ();
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	Value(Standard_Real)

Returns:
	None

No detailed docstring for this function.") SetValue;
		void SetValue (const Standard_Integer Index,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Standard_Real

No detailed docstring for this function.") Value;
		const Standard_Real & Value (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Standard_Real

No detailed docstring for this function.") ChangeValue;
		Standard_Real & ChangeValue (const Standard_Integer Index);
		%feature("autodoc", "Args:
	None
Returns:
	TColStd_Array1OfReal

No detailed docstring for this function.") Array1;
		const TColStd_Array1OfReal & Array1 ();
		%feature("autodoc", "Args:
	None
Returns:
	TColStd_Array1OfReal

No detailed docstring for this function.") ChangeArray1;
		TColStd_Array1OfReal & ChangeArray1 ();
};


%feature("shadow") TColStd_HArray1OfReal::~TColStd_HArray1OfReal %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TColStd_HArray1OfReal {
	void _kill_pointed() {
		delete $self;
	}
};
%extend TColStd_HArray1OfReal {
	Handle_TColStd_HArray1OfReal GetHandle() {
	return *(Handle_TColStd_HArray1OfReal*) &$self;
	}
};

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
    TColStd_HArray1OfReal* GetObject() {
    return (TColStd_HArray1OfReal*)$self->Access();
    }
};
%feature("shadow") Handle_TColStd_HArray1OfReal::~Handle_TColStd_HArray1OfReal %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_TColStd_HArray1OfReal {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor TColStd_HArray1OfTransient;
class TColStd_HArray1OfTransient : public MMgt_TShared {
	public:
		%feature("autodoc", "Args:
	Low(Standard_Integer)
	Up(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") TColStd_HArray1OfTransient;
		 TColStd_HArray1OfTransient (const Standard_Integer Low,const Standard_Integer Up);
		%feature("autodoc", "Args:
	Low(Standard_Integer)
	Up(Standard_Integer)
	V(Handle_Standard_Transient)

Returns:
	None

No detailed docstring for this function.") TColStd_HArray1OfTransient;
		 TColStd_HArray1OfTransient (const Standard_Integer Low,const Standard_Integer Up,const Handle_Standard_Transient & V);
		%feature("autodoc", "Args:
	V(Handle_Standard_Transient)

Returns:
	None

No detailed docstring for this function.") Init;
		void Init (const Handle_Standard_Transient & V);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Length;
		Standard_Integer Length ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Lower;
		Standard_Integer Lower ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Upper;
		Standard_Integer Upper ();
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	Value(Handle_Standard_Transient)

Returns:
	None

No detailed docstring for this function.") SetValue;
		void SetValue (const Standard_Integer Index,const Handle_Standard_Transient & Value);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Handle_Standard_Transient

No detailed docstring for this function.") Value;
		const Handle_Standard_Transient & Value (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Handle_Standard_Transient

No detailed docstring for this function.") ChangeValue;
		Handle_Standard_Transient & ChangeValue (const Standard_Integer Index);
		%feature("autodoc", "Args:
	None
Returns:
	TColStd_Array1OfTransient

No detailed docstring for this function.") Array1;
		const TColStd_Array1OfTransient & Array1 ();
		%feature("autodoc", "Args:
	None
Returns:
	TColStd_Array1OfTransient

No detailed docstring for this function.") ChangeArray1;
		TColStd_Array1OfTransient & ChangeArray1 ();
};


%feature("shadow") TColStd_HArray1OfTransient::~TColStd_HArray1OfTransient %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TColStd_HArray1OfTransient {
	void _kill_pointed() {
		delete $self;
	}
};
%extend TColStd_HArray1OfTransient {
	Handle_TColStd_HArray1OfTransient GetHandle() {
	return *(Handle_TColStd_HArray1OfTransient*) &$self;
	}
};

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
    TColStd_HArray1OfTransient* GetObject() {
    return (TColStd_HArray1OfTransient*)$self->Access();
    }
};
%feature("shadow") Handle_TColStd_HArray1OfTransient::~Handle_TColStd_HArray1OfTransient %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_TColStd_HArray1OfTransient {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor TColStd_HArray2OfBoolean;
class TColStd_HArray2OfBoolean : public MMgt_TShared {
	public:
		%feature("autodoc", "Args:
	R1(Standard_Integer)
	R2(Standard_Integer)
	C1(Standard_Integer)
	C2(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") TColStd_HArray2OfBoolean;
		 TColStd_HArray2OfBoolean (const Standard_Integer R1,const Standard_Integer R2,const Standard_Integer C1,const Standard_Integer C2);
		%feature("autodoc", "Args:
	R1(Standard_Integer)
	R2(Standard_Integer)
	C1(Standard_Integer)
	C2(Standard_Integer)
	V(Standard_Boolean)

Returns:
	None

No detailed docstring for this function.") TColStd_HArray2OfBoolean;
		 TColStd_HArray2OfBoolean (const Standard_Integer R1,const Standard_Integer R2,const Standard_Integer C1,const Standard_Integer C2,const Standard_Boolean & V);
		%feature("autodoc", "Args:
	V(Standard_Boolean)

Returns:
	None

No detailed docstring for this function.") Init;
		void Init (const Standard_Boolean & V);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") ColLength;
		Standard_Integer ColLength ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") RowLength;
		Standard_Integer RowLength ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") LowerCol;
		Standard_Integer LowerCol ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") LowerRow;
		Standard_Integer LowerRow ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") UpperCol;
		Standard_Integer UpperCol ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") UpperRow;
		Standard_Integer UpperRow ();
		%feature("autodoc", "Args:
	Row(Standard_Integer)
	Col(Standard_Integer)
	Value(Standard_Boolean)

Returns:
	None

No detailed docstring for this function.") SetValue;
		void SetValue (const Standard_Integer Row,const Standard_Integer Col,const Standard_Boolean & Value);
		%feature("autodoc", "Args:
	Row(Standard_Integer)
	Col(Standard_Integer)

Returns:
	Standard_Boolean

No detailed docstring for this function.") Value;
		const Standard_Boolean & Value (const Standard_Integer Row,const Standard_Integer Col);
		%feature("autodoc", "Args:
	Row(Standard_Integer)
	Col(Standard_Integer)

Returns:
	Standard_Boolean

No detailed docstring for this function.") ChangeValue;
		Standard_Boolean & ChangeValue (const Standard_Integer Row,const Standard_Integer Col);
		%feature("autodoc", "Args:
	None
Returns:
	TColStd_Array2OfBoolean

No detailed docstring for this function.") Array2;
		const TColStd_Array2OfBoolean & Array2 ();
		%feature("autodoc", "Args:
	None
Returns:
	TColStd_Array2OfBoolean

No detailed docstring for this function.") ChangeArray2;
		TColStd_Array2OfBoolean & ChangeArray2 ();
};


%feature("shadow") TColStd_HArray2OfBoolean::~TColStd_HArray2OfBoolean %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TColStd_HArray2OfBoolean {
	void _kill_pointed() {
		delete $self;
	}
};
%extend TColStd_HArray2OfBoolean {
	Handle_TColStd_HArray2OfBoolean GetHandle() {
	return *(Handle_TColStd_HArray2OfBoolean*) &$self;
	}
};

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
    TColStd_HArray2OfBoolean* GetObject() {
    return (TColStd_HArray2OfBoolean*)$self->Access();
    }
};
%feature("shadow") Handle_TColStd_HArray2OfBoolean::~Handle_TColStd_HArray2OfBoolean %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_TColStd_HArray2OfBoolean {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor TColStd_HArray2OfCharacter;
class TColStd_HArray2OfCharacter : public MMgt_TShared {
	public:
		%feature("autodoc", "Args:
	R1(Standard_Integer)
	R2(Standard_Integer)
	C1(Standard_Integer)
	C2(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") TColStd_HArray2OfCharacter;
		 TColStd_HArray2OfCharacter (const Standard_Integer R1,const Standard_Integer R2,const Standard_Integer C1,const Standard_Integer C2);
		%feature("autodoc", "Args:
	R1(Standard_Integer)
	R2(Standard_Integer)
	C1(Standard_Integer)
	C2(Standard_Integer)
	V(Standard_Character)

Returns:
	None

No detailed docstring for this function.") TColStd_HArray2OfCharacter;
		 TColStd_HArray2OfCharacter (const Standard_Integer R1,const Standard_Integer R2,const Standard_Integer C1,const Standard_Integer C2,const Standard_Character & V);
		%feature("autodoc", "Args:
	V(Standard_Character)

Returns:
	None

No detailed docstring for this function.") Init;
		void Init (const Standard_Character & V);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") ColLength;
		Standard_Integer ColLength ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") RowLength;
		Standard_Integer RowLength ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") LowerCol;
		Standard_Integer LowerCol ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") LowerRow;
		Standard_Integer LowerRow ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") UpperCol;
		Standard_Integer UpperCol ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") UpperRow;
		Standard_Integer UpperRow ();
		%feature("autodoc", "Args:
	Row(Standard_Integer)
	Col(Standard_Integer)
	Value(Standard_Character)

Returns:
	None

No detailed docstring for this function.") SetValue;
		void SetValue (const Standard_Integer Row,const Standard_Integer Col,const Standard_Character & Value);
		%feature("autodoc", "Args:
	Row(Standard_Integer)
	Col(Standard_Integer)

Returns:
	Standard_Character

No detailed docstring for this function.") Value;
		const Standard_Character & Value (const Standard_Integer Row,const Standard_Integer Col);
		%feature("autodoc", "Args:
	Row(Standard_Integer)
	Col(Standard_Integer)

Returns:
	Standard_Character

No detailed docstring for this function.") ChangeValue;
		Standard_Character & ChangeValue (const Standard_Integer Row,const Standard_Integer Col);
		%feature("autodoc", "Args:
	None
Returns:
	TColStd_Array2OfCharacter

No detailed docstring for this function.") Array2;
		const TColStd_Array2OfCharacter & Array2 ();
		%feature("autodoc", "Args:
	None
Returns:
	TColStd_Array2OfCharacter

No detailed docstring for this function.") ChangeArray2;
		TColStd_Array2OfCharacter & ChangeArray2 ();
};


%feature("shadow") TColStd_HArray2OfCharacter::~TColStd_HArray2OfCharacter %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TColStd_HArray2OfCharacter {
	void _kill_pointed() {
		delete $self;
	}
};
%extend TColStd_HArray2OfCharacter {
	Handle_TColStd_HArray2OfCharacter GetHandle() {
	return *(Handle_TColStd_HArray2OfCharacter*) &$self;
	}
};

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
    TColStd_HArray2OfCharacter* GetObject() {
    return (TColStd_HArray2OfCharacter*)$self->Access();
    }
};
%feature("shadow") Handle_TColStd_HArray2OfCharacter::~Handle_TColStd_HArray2OfCharacter %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_TColStd_HArray2OfCharacter {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor TColStd_HArray2OfInteger;
class TColStd_HArray2OfInteger : public MMgt_TShared {
	public:
		%feature("autodoc", "Args:
	R1(Standard_Integer)
	R2(Standard_Integer)
	C1(Standard_Integer)
	C2(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") TColStd_HArray2OfInteger;
		 TColStd_HArray2OfInteger (const Standard_Integer R1,const Standard_Integer R2,const Standard_Integer C1,const Standard_Integer C2);
		%feature("autodoc", "Args:
	R1(Standard_Integer)
	R2(Standard_Integer)
	C1(Standard_Integer)
	C2(Standard_Integer)
	V(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") TColStd_HArray2OfInteger;
		 TColStd_HArray2OfInteger (const Standard_Integer R1,const Standard_Integer R2,const Standard_Integer C1,const Standard_Integer C2,Standard_Integer &OutValue);
		%feature("autodoc", "Args:
	V(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Init;
		void Init (Standard_Integer &OutValue);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") ColLength;
		Standard_Integer ColLength ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") RowLength;
		Standard_Integer RowLength ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") LowerCol;
		Standard_Integer LowerCol ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") LowerRow;
		Standard_Integer LowerRow ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") UpperCol;
		Standard_Integer UpperCol ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") UpperRow;
		Standard_Integer UpperRow ();
		%feature("autodoc", "Args:
	Row(Standard_Integer)
	Col(Standard_Integer)
	Value(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") SetValue;
		void SetValue (const Standard_Integer Row,const Standard_Integer Col,Standard_Integer &OutValue);
		%feature("autodoc", "Args:
	Row(Standard_Integer)
	Col(Standard_Integer)

Returns:
	Standard_Integer

No detailed docstring for this function.") Value;
		const Standard_Integer & Value (const Standard_Integer Row,const Standard_Integer Col);
		%feature("autodoc", "Args:
	Row(Standard_Integer)
	Col(Standard_Integer)

Returns:
	Standard_Integer

No detailed docstring for this function.") ChangeValue;
		Standard_Integer & ChangeValue (const Standard_Integer Row,const Standard_Integer Col);
		%feature("autodoc", "Args:
	None
Returns:
	TColStd_Array2OfInteger

No detailed docstring for this function.") Array2;
		const TColStd_Array2OfInteger & Array2 ();
		%feature("autodoc", "Args:
	None
Returns:
	TColStd_Array2OfInteger

No detailed docstring for this function.") ChangeArray2;
		TColStd_Array2OfInteger & ChangeArray2 ();
};


%feature("shadow") TColStd_HArray2OfInteger::~TColStd_HArray2OfInteger %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TColStd_HArray2OfInteger {
	void _kill_pointed() {
		delete $self;
	}
};
%extend TColStd_HArray2OfInteger {
	Handle_TColStd_HArray2OfInteger GetHandle() {
	return *(Handle_TColStd_HArray2OfInteger*) &$self;
	}
};

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
    TColStd_HArray2OfInteger* GetObject() {
    return (TColStd_HArray2OfInteger*)$self->Access();
    }
};
%feature("shadow") Handle_TColStd_HArray2OfInteger::~Handle_TColStd_HArray2OfInteger %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_TColStd_HArray2OfInteger {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor TColStd_HArray2OfReal;
class TColStd_HArray2OfReal : public MMgt_TShared {
	public:
		%feature("autodoc", "Args:
	R1(Standard_Integer)
	R2(Standard_Integer)
	C1(Standard_Integer)
	C2(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") TColStd_HArray2OfReal;
		 TColStd_HArray2OfReal (const Standard_Integer R1,const Standard_Integer R2,const Standard_Integer C1,const Standard_Integer C2);
		%feature("autodoc", "Args:
	R1(Standard_Integer)
	R2(Standard_Integer)
	C1(Standard_Integer)
	C2(Standard_Integer)
	V(Standard_Real)

Returns:
	None

No detailed docstring for this function.") TColStd_HArray2OfReal;
		 TColStd_HArray2OfReal (const Standard_Integer R1,const Standard_Integer R2,const Standard_Integer C1,const Standard_Integer C2,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	V(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Init;
		void Init (Standard_Real &OutValue);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") ColLength;
		Standard_Integer ColLength ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") RowLength;
		Standard_Integer RowLength ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") LowerCol;
		Standard_Integer LowerCol ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") LowerRow;
		Standard_Integer LowerRow ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") UpperCol;
		Standard_Integer UpperCol ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") UpperRow;
		Standard_Integer UpperRow ();
		%feature("autodoc", "Args:
	Row(Standard_Integer)
	Col(Standard_Integer)
	Value(Standard_Real)

Returns:
	None

No detailed docstring for this function.") SetValue;
		void SetValue (const Standard_Integer Row,const Standard_Integer Col,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	Row(Standard_Integer)
	Col(Standard_Integer)

Returns:
	Standard_Real

No detailed docstring for this function.") Value;
		const Standard_Real & Value (const Standard_Integer Row,const Standard_Integer Col);
		%feature("autodoc", "Args:
	Row(Standard_Integer)
	Col(Standard_Integer)

Returns:
	Standard_Real

No detailed docstring for this function.") ChangeValue;
		Standard_Real & ChangeValue (const Standard_Integer Row,const Standard_Integer Col);
		%feature("autodoc", "Args:
	None
Returns:
	TColStd_Array2OfReal

No detailed docstring for this function.") Array2;
		const TColStd_Array2OfReal & Array2 ();
		%feature("autodoc", "Args:
	None
Returns:
	TColStd_Array2OfReal

No detailed docstring for this function.") ChangeArray2;
		TColStd_Array2OfReal & ChangeArray2 ();
};


%feature("shadow") TColStd_HArray2OfReal::~TColStd_HArray2OfReal %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TColStd_HArray2OfReal {
	void _kill_pointed() {
		delete $self;
	}
};
%extend TColStd_HArray2OfReal {
	Handle_TColStd_HArray2OfReal GetHandle() {
	return *(Handle_TColStd_HArray2OfReal*) &$self;
	}
};

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
    TColStd_HArray2OfReal* GetObject() {
    return (TColStd_HArray2OfReal*)$self->Access();
    }
};
%feature("shadow") Handle_TColStd_HArray2OfReal::~Handle_TColStd_HArray2OfReal %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_TColStd_HArray2OfReal {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor TColStd_HArray2OfTransient;
class TColStd_HArray2OfTransient : public MMgt_TShared {
	public:
		%feature("autodoc", "Args:
	R1(Standard_Integer)
	R2(Standard_Integer)
	C1(Standard_Integer)
	C2(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") TColStd_HArray2OfTransient;
		 TColStd_HArray2OfTransient (const Standard_Integer R1,const Standard_Integer R2,const Standard_Integer C1,const Standard_Integer C2);
		%feature("autodoc", "Args:
	R1(Standard_Integer)
	R2(Standard_Integer)
	C1(Standard_Integer)
	C2(Standard_Integer)
	V(Handle_Standard_Transient)

Returns:
	None

No detailed docstring for this function.") TColStd_HArray2OfTransient;
		 TColStd_HArray2OfTransient (const Standard_Integer R1,const Standard_Integer R2,const Standard_Integer C1,const Standard_Integer C2,const Handle_Standard_Transient & V);
		%feature("autodoc", "Args:
	V(Handle_Standard_Transient)

Returns:
	None

No detailed docstring for this function.") Init;
		void Init (const Handle_Standard_Transient & V);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") ColLength;
		Standard_Integer ColLength ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") RowLength;
		Standard_Integer RowLength ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") LowerCol;
		Standard_Integer LowerCol ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") LowerRow;
		Standard_Integer LowerRow ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") UpperCol;
		Standard_Integer UpperCol ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") UpperRow;
		Standard_Integer UpperRow ();
		%feature("autodoc", "Args:
	Row(Standard_Integer)
	Col(Standard_Integer)
	Value(Handle_Standard_Transient)

Returns:
	None

No detailed docstring for this function.") SetValue;
		void SetValue (const Standard_Integer Row,const Standard_Integer Col,const Handle_Standard_Transient & Value);
		%feature("autodoc", "Args:
	Row(Standard_Integer)
	Col(Standard_Integer)

Returns:
	Handle_Standard_Transient

No detailed docstring for this function.") Value;
		const Handle_Standard_Transient & Value (const Standard_Integer Row,const Standard_Integer Col);
		%feature("autodoc", "Args:
	Row(Standard_Integer)
	Col(Standard_Integer)

Returns:
	Handle_Standard_Transient

No detailed docstring for this function.") ChangeValue;
		Handle_Standard_Transient & ChangeValue (const Standard_Integer Row,const Standard_Integer Col);
		%feature("autodoc", "Args:
	None
Returns:
	TColStd_Array2OfTransient

No detailed docstring for this function.") Array2;
		const TColStd_Array2OfTransient & Array2 ();
		%feature("autodoc", "Args:
	None
Returns:
	TColStd_Array2OfTransient

No detailed docstring for this function.") ChangeArray2;
		TColStd_Array2OfTransient & ChangeArray2 ();
};


%feature("shadow") TColStd_HArray2OfTransient::~TColStd_HArray2OfTransient %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TColStd_HArray2OfTransient {
	void _kill_pointed() {
		delete $self;
	}
};
%extend TColStd_HArray2OfTransient {
	Handle_TColStd_HArray2OfTransient GetHandle() {
	return *(Handle_TColStd_HArray2OfTransient*) &$self;
	}
};

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
    TColStd_HArray2OfTransient* GetObject() {
    return (TColStd_HArray2OfTransient*)$self->Access();
    }
};
%feature("shadow") Handle_TColStd_HArray2OfTransient::~Handle_TColStd_HArray2OfTransient %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_TColStd_HArray2OfTransient {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor TColStd_HPackedMapOfInteger;
class TColStd_HPackedMapOfInteger : public MMgt_TShared {
	public:
		%feature("autodoc", "Args:
	NbBuckets(Standard_Integer)=1

Returns:
	None

No detailed docstring for this function.") TColStd_HPackedMapOfInteger;
		 TColStd_HPackedMapOfInteger (const Standard_Integer NbBuckets = 1);
		%feature("autodoc", "Args:
	theOther(TColStd_PackedMapOfInteger)

Returns:
	None

No detailed docstring for this function.") TColStd_HPackedMapOfInteger;
		 TColStd_HPackedMapOfInteger (const TColStd_PackedMapOfInteger & theOther);
		%feature("autodoc", "Args:
	None
Returns:
	TColStd_PackedMapOfInteger

No detailed docstring for this function.") Map;
		const TColStd_PackedMapOfInteger & Map ();
		%feature("autodoc", "Args:
	None
Returns:
	TColStd_PackedMapOfInteger

No detailed docstring for this function.") ChangeMap;
		TColStd_PackedMapOfInteger & ChangeMap ();
};


%feature("shadow") TColStd_HPackedMapOfInteger::~TColStd_HPackedMapOfInteger %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TColStd_HPackedMapOfInteger {
	void _kill_pointed() {
		delete $self;
	}
};
%extend TColStd_HPackedMapOfInteger {
	Handle_TColStd_HPackedMapOfInteger GetHandle() {
	return *(Handle_TColStd_HPackedMapOfInteger*) &$self;
	}
};

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
    TColStd_HPackedMapOfInteger* GetObject() {
    return (TColStd_HPackedMapOfInteger*)$self->Access();
    }
};
%feature("shadow") Handle_TColStd_HPackedMapOfInteger::~Handle_TColStd_HPackedMapOfInteger %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_TColStd_HPackedMapOfInteger {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor TColStd_HSequenceOfAsciiString;
class TColStd_HSequenceOfAsciiString : public MMgt_TShared {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") TColStd_HSequenceOfAsciiString;
		 TColStd_HSequenceOfAsciiString ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsEmpty;
		Standard_Boolean IsEmpty ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Length;
		Standard_Integer Length ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	anItem(TCollection_AsciiString)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (const TCollection_AsciiString & anItem);
		%feature("autodoc", "Args:
	aSequence(Handle_TColStd_HSequenceOfAsciiString)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (const Handle_TColStd_HSequenceOfAsciiString & aSequence);
		%feature("autodoc", "Args:
	anItem(TCollection_AsciiString)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (const TCollection_AsciiString & anItem);
		%feature("autodoc", "Args:
	aSequence(Handle_TColStd_HSequenceOfAsciiString)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (const Handle_TColStd_HSequenceOfAsciiString & aSequence);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Reverse;
		void Reverse ();
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)
	anItem(TCollection_AsciiString)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Standard_Integer anIndex,const TCollection_AsciiString & anItem);
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)
	aSequence(Handle_TColStd_HSequenceOfAsciiString)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Standard_Integer anIndex,const Handle_TColStd_HSequenceOfAsciiString & aSequence);
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)
	anItem(TCollection_AsciiString)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Standard_Integer anIndex,const TCollection_AsciiString & anItem);
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)
	aSequence(Handle_TColStd_HSequenceOfAsciiString)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Standard_Integer anIndex,const Handle_TColStd_HSequenceOfAsciiString & aSequence);
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)
	anOtherIndex(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Exchange;
		void Exchange (const Standard_Integer anIndex,const Standard_Integer anOtherIndex);
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)

Returns:
	Handle_TColStd_HSequenceOfAsciiString

No detailed docstring for this function.") Split;
		Handle_TColStd_HSequenceOfAsciiString Split (const Standard_Integer anIndex);
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)
	anItem(TCollection_AsciiString)

Returns:
	None

No detailed docstring for this function.") SetValue;
		void SetValue (const Standard_Integer anIndex,const TCollection_AsciiString & anItem);
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)

Returns:
	TCollection_AsciiString

No detailed docstring for this function.") Value;
		const TCollection_AsciiString & Value (const Standard_Integer anIndex);
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)

Returns:
	TCollection_AsciiString

No detailed docstring for this function.") ChangeValue;
		TCollection_AsciiString & ChangeValue (const Standard_Integer anIndex);
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Remove;
		void Remove (const Standard_Integer anIndex);
		%feature("autodoc", "Args:
	fromIndex(Standard_Integer)
	toIndex(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Remove;
		void Remove (const Standard_Integer fromIndex,const Standard_Integer toIndex);
		%feature("autodoc", "Args:
	None
Returns:
	TColStd_SequenceOfAsciiString

No detailed docstring for this function.") Sequence;
		const TColStd_SequenceOfAsciiString & Sequence ();
		%feature("autodoc", "Args:
	None
Returns:
	TColStd_SequenceOfAsciiString

No detailed docstring for this function.") ChangeSequence;
		TColStd_SequenceOfAsciiString & ChangeSequence ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_TColStd_HSequenceOfAsciiString

No detailed docstring for this function.") ShallowCopy;
		Handle_TColStd_HSequenceOfAsciiString ShallowCopy ();
};


%feature("shadow") TColStd_HSequenceOfAsciiString::~TColStd_HSequenceOfAsciiString %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TColStd_HSequenceOfAsciiString {
	void _kill_pointed() {
		delete $self;
	}
};
%extend TColStd_HSequenceOfAsciiString {
	Handle_TColStd_HSequenceOfAsciiString GetHandle() {
	return *(Handle_TColStd_HSequenceOfAsciiString*) &$self;
	}
};

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
    TColStd_HSequenceOfAsciiString* GetObject() {
    return (TColStd_HSequenceOfAsciiString*)$self->Access();
    }
};
%feature("shadow") Handle_TColStd_HSequenceOfAsciiString::~Handle_TColStd_HSequenceOfAsciiString %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_TColStd_HSequenceOfAsciiString {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor TColStd_HSequenceOfExtendedString;
class TColStd_HSequenceOfExtendedString : public MMgt_TShared {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") TColStd_HSequenceOfExtendedString;
		 TColStd_HSequenceOfExtendedString ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsEmpty;
		Standard_Boolean IsEmpty ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Length;
		Standard_Integer Length ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	anItem(TCollection_ExtendedString)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (const TCollection_ExtendedString & anItem);
		%feature("autodoc", "Args:
	aSequence(Handle_TColStd_HSequenceOfExtendedString)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (const Handle_TColStd_HSequenceOfExtendedString & aSequence);
		%feature("autodoc", "Args:
	anItem(TCollection_ExtendedString)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (const TCollection_ExtendedString & anItem);
		%feature("autodoc", "Args:
	aSequence(Handle_TColStd_HSequenceOfExtendedString)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (const Handle_TColStd_HSequenceOfExtendedString & aSequence);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Reverse;
		void Reverse ();
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)
	anItem(TCollection_ExtendedString)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Standard_Integer anIndex,const TCollection_ExtendedString & anItem);
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)
	aSequence(Handle_TColStd_HSequenceOfExtendedString)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Standard_Integer anIndex,const Handle_TColStd_HSequenceOfExtendedString & aSequence);
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)
	anItem(TCollection_ExtendedString)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Standard_Integer anIndex,const TCollection_ExtendedString & anItem);
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)
	aSequence(Handle_TColStd_HSequenceOfExtendedString)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Standard_Integer anIndex,const Handle_TColStd_HSequenceOfExtendedString & aSequence);
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)
	anOtherIndex(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Exchange;
		void Exchange (const Standard_Integer anIndex,const Standard_Integer anOtherIndex);
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)

Returns:
	Handle_TColStd_HSequenceOfExtendedString

No detailed docstring for this function.") Split;
		Handle_TColStd_HSequenceOfExtendedString Split (const Standard_Integer anIndex);
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)
	anItem(TCollection_ExtendedString)

Returns:
	None

No detailed docstring for this function.") SetValue;
		void SetValue (const Standard_Integer anIndex,const TCollection_ExtendedString & anItem);
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)

Returns:
	TCollection_ExtendedString

No detailed docstring for this function.") Value;
		const TCollection_ExtendedString & Value (const Standard_Integer anIndex);
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)

Returns:
	TCollection_ExtendedString

No detailed docstring for this function.") ChangeValue;
		TCollection_ExtendedString & ChangeValue (const Standard_Integer anIndex);
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Remove;
		void Remove (const Standard_Integer anIndex);
		%feature("autodoc", "Args:
	fromIndex(Standard_Integer)
	toIndex(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Remove;
		void Remove (const Standard_Integer fromIndex,const Standard_Integer toIndex);
		%feature("autodoc", "Args:
	None
Returns:
	TColStd_SequenceOfExtendedString

No detailed docstring for this function.") Sequence;
		const TColStd_SequenceOfExtendedString & Sequence ();
		%feature("autodoc", "Args:
	None
Returns:
	TColStd_SequenceOfExtendedString

No detailed docstring for this function.") ChangeSequence;
		TColStd_SequenceOfExtendedString & ChangeSequence ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_TColStd_HSequenceOfExtendedString

No detailed docstring for this function.") ShallowCopy;
		Handle_TColStd_HSequenceOfExtendedString ShallowCopy ();
};


%feature("shadow") TColStd_HSequenceOfExtendedString::~TColStd_HSequenceOfExtendedString %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TColStd_HSequenceOfExtendedString {
	void _kill_pointed() {
		delete $self;
	}
};
%extend TColStd_HSequenceOfExtendedString {
	Handle_TColStd_HSequenceOfExtendedString GetHandle() {
	return *(Handle_TColStd_HSequenceOfExtendedString*) &$self;
	}
};

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
    TColStd_HSequenceOfExtendedString* GetObject() {
    return (TColStd_HSequenceOfExtendedString*)$self->Access();
    }
};
%feature("shadow") Handle_TColStd_HSequenceOfExtendedString::~Handle_TColStd_HSequenceOfExtendedString %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_TColStd_HSequenceOfExtendedString {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor TColStd_HSequenceOfHAsciiString;
class TColStd_HSequenceOfHAsciiString : public MMgt_TShared {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") TColStd_HSequenceOfHAsciiString;
		 TColStd_HSequenceOfHAsciiString ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsEmpty;
		Standard_Boolean IsEmpty ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Length;
		Standard_Integer Length ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	anItem(Handle_TCollection_HAsciiString)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (const Handle_TCollection_HAsciiString & anItem);
		%feature("autodoc", "Args:
	aSequence(Handle_TColStd_HSequenceOfHAsciiString)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (const Handle_TColStd_HSequenceOfHAsciiString & aSequence);
		%feature("autodoc", "Args:
	anItem(Handle_TCollection_HAsciiString)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (const Handle_TCollection_HAsciiString & anItem);
		%feature("autodoc", "Args:
	aSequence(Handle_TColStd_HSequenceOfHAsciiString)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (const Handle_TColStd_HSequenceOfHAsciiString & aSequence);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Reverse;
		void Reverse ();
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)
	anItem(Handle_TCollection_HAsciiString)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Standard_Integer anIndex,const Handle_TCollection_HAsciiString & anItem);
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)
	aSequence(Handle_TColStd_HSequenceOfHAsciiString)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Standard_Integer anIndex,const Handle_TColStd_HSequenceOfHAsciiString & aSequence);
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)
	anItem(Handle_TCollection_HAsciiString)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Standard_Integer anIndex,const Handle_TCollection_HAsciiString & anItem);
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)
	aSequence(Handle_TColStd_HSequenceOfHAsciiString)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Standard_Integer anIndex,const Handle_TColStd_HSequenceOfHAsciiString & aSequence);
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)
	anOtherIndex(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Exchange;
		void Exchange (const Standard_Integer anIndex,const Standard_Integer anOtherIndex);
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)

Returns:
	Handle_TColStd_HSequenceOfHAsciiString

No detailed docstring for this function.") Split;
		Handle_TColStd_HSequenceOfHAsciiString Split (const Standard_Integer anIndex);
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)
	anItem(Handle_TCollection_HAsciiString)

Returns:
	None

No detailed docstring for this function.") SetValue;
		void SetValue (const Standard_Integer anIndex,const Handle_TCollection_HAsciiString & anItem);
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)

Returns:
	Handle_TCollection_HAsciiString

No detailed docstring for this function.") Value;
		const Handle_TCollection_HAsciiString & Value (const Standard_Integer anIndex);
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)

Returns:
	Handle_TCollection_HAsciiString

No detailed docstring for this function.") ChangeValue;
		Handle_TCollection_HAsciiString & ChangeValue (const Standard_Integer anIndex);
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Remove;
		void Remove (const Standard_Integer anIndex);
		%feature("autodoc", "Args:
	fromIndex(Standard_Integer)
	toIndex(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Remove;
		void Remove (const Standard_Integer fromIndex,const Standard_Integer toIndex);
		%feature("autodoc", "Args:
	None
Returns:
	TColStd_SequenceOfHAsciiString

No detailed docstring for this function.") Sequence;
		const TColStd_SequenceOfHAsciiString & Sequence ();
		%feature("autodoc", "Args:
	None
Returns:
	TColStd_SequenceOfHAsciiString

No detailed docstring for this function.") ChangeSequence;
		TColStd_SequenceOfHAsciiString & ChangeSequence ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_TColStd_HSequenceOfHAsciiString

No detailed docstring for this function.") ShallowCopy;
		Handle_TColStd_HSequenceOfHAsciiString ShallowCopy ();
};


%feature("shadow") TColStd_HSequenceOfHAsciiString::~TColStd_HSequenceOfHAsciiString %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TColStd_HSequenceOfHAsciiString {
	void _kill_pointed() {
		delete $self;
	}
};
%extend TColStd_HSequenceOfHAsciiString {
	Handle_TColStd_HSequenceOfHAsciiString GetHandle() {
	return *(Handle_TColStd_HSequenceOfHAsciiString*) &$self;
	}
};

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
    TColStd_HSequenceOfHAsciiString* GetObject() {
    return (TColStd_HSequenceOfHAsciiString*)$self->Access();
    }
};
%feature("shadow") Handle_TColStd_HSequenceOfHAsciiString::~Handle_TColStd_HSequenceOfHAsciiString %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_TColStd_HSequenceOfHAsciiString {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor TColStd_HSequenceOfHExtendedString;
class TColStd_HSequenceOfHExtendedString : public MMgt_TShared {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") TColStd_HSequenceOfHExtendedString;
		 TColStd_HSequenceOfHExtendedString ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsEmpty;
		Standard_Boolean IsEmpty ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Length;
		Standard_Integer Length ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	anItem(Handle_TCollection_HExtendedString)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (const Handle_TCollection_HExtendedString & anItem);
		%feature("autodoc", "Args:
	aSequence(Handle_TColStd_HSequenceOfHExtendedString)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (const Handle_TColStd_HSequenceOfHExtendedString & aSequence);
		%feature("autodoc", "Args:
	anItem(Handle_TCollection_HExtendedString)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (const Handle_TCollection_HExtendedString & anItem);
		%feature("autodoc", "Args:
	aSequence(Handle_TColStd_HSequenceOfHExtendedString)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (const Handle_TColStd_HSequenceOfHExtendedString & aSequence);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Reverse;
		void Reverse ();
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)
	anItem(Handle_TCollection_HExtendedString)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Standard_Integer anIndex,const Handle_TCollection_HExtendedString & anItem);
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)
	aSequence(Handle_TColStd_HSequenceOfHExtendedString)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Standard_Integer anIndex,const Handle_TColStd_HSequenceOfHExtendedString & aSequence);
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)
	anItem(Handle_TCollection_HExtendedString)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Standard_Integer anIndex,const Handle_TCollection_HExtendedString & anItem);
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)
	aSequence(Handle_TColStd_HSequenceOfHExtendedString)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Standard_Integer anIndex,const Handle_TColStd_HSequenceOfHExtendedString & aSequence);
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)
	anOtherIndex(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Exchange;
		void Exchange (const Standard_Integer anIndex,const Standard_Integer anOtherIndex);
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)

Returns:
	Handle_TColStd_HSequenceOfHExtendedString

No detailed docstring for this function.") Split;
		Handle_TColStd_HSequenceOfHExtendedString Split (const Standard_Integer anIndex);
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)
	anItem(Handle_TCollection_HExtendedString)

Returns:
	None

No detailed docstring for this function.") SetValue;
		void SetValue (const Standard_Integer anIndex,const Handle_TCollection_HExtendedString & anItem);
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)

Returns:
	Handle_TCollection_HExtendedString

No detailed docstring for this function.") Value;
		const Handle_TCollection_HExtendedString & Value (const Standard_Integer anIndex);
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)

Returns:
	Handle_TCollection_HExtendedString

No detailed docstring for this function.") ChangeValue;
		Handle_TCollection_HExtendedString & ChangeValue (const Standard_Integer anIndex);
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Remove;
		void Remove (const Standard_Integer anIndex);
		%feature("autodoc", "Args:
	fromIndex(Standard_Integer)
	toIndex(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Remove;
		void Remove (const Standard_Integer fromIndex,const Standard_Integer toIndex);
		%feature("autodoc", "Args:
	None
Returns:
	TColStd_SequenceOfHExtendedString

No detailed docstring for this function.") Sequence;
		const TColStd_SequenceOfHExtendedString & Sequence ();
		%feature("autodoc", "Args:
	None
Returns:
	TColStd_SequenceOfHExtendedString

No detailed docstring for this function.") ChangeSequence;
		TColStd_SequenceOfHExtendedString & ChangeSequence ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_TColStd_HSequenceOfHExtendedString

No detailed docstring for this function.") ShallowCopy;
		Handle_TColStd_HSequenceOfHExtendedString ShallowCopy ();
};


%feature("shadow") TColStd_HSequenceOfHExtendedString::~TColStd_HSequenceOfHExtendedString %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TColStd_HSequenceOfHExtendedString {
	void _kill_pointed() {
		delete $self;
	}
};
%extend TColStd_HSequenceOfHExtendedString {
	Handle_TColStd_HSequenceOfHExtendedString GetHandle() {
	return *(Handle_TColStd_HSequenceOfHExtendedString*) &$self;
	}
};

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
    TColStd_HSequenceOfHExtendedString* GetObject() {
    return (TColStd_HSequenceOfHExtendedString*)$self->Access();
    }
};
%feature("shadow") Handle_TColStd_HSequenceOfHExtendedString::~Handle_TColStd_HSequenceOfHExtendedString %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_TColStd_HSequenceOfHExtendedString {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor TColStd_HSequenceOfInteger;
class TColStd_HSequenceOfInteger : public MMgt_TShared {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") TColStd_HSequenceOfInteger;
		 TColStd_HSequenceOfInteger ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsEmpty;
		Standard_Boolean IsEmpty ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Length;
		Standard_Integer Length ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	anItem(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (Standard_Integer &OutValue);
		%feature("autodoc", "Args:
	aSequence(Handle_TColStd_HSequenceOfInteger)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (const Handle_TColStd_HSequenceOfInteger & aSequence);
		%feature("autodoc", "Args:
	anItem(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (Standard_Integer &OutValue);
		%feature("autodoc", "Args:
	aSequence(Handle_TColStd_HSequenceOfInteger)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (const Handle_TColStd_HSequenceOfInteger & aSequence);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Reverse;
		void Reverse ();
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)
	anItem(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Standard_Integer anIndex,Standard_Integer &OutValue);
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)
	aSequence(Handle_TColStd_HSequenceOfInteger)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Standard_Integer anIndex,const Handle_TColStd_HSequenceOfInteger & aSequence);
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)
	anItem(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Standard_Integer anIndex,Standard_Integer &OutValue);
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)
	aSequence(Handle_TColStd_HSequenceOfInteger)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Standard_Integer anIndex,const Handle_TColStd_HSequenceOfInteger & aSequence);
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)
	anOtherIndex(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Exchange;
		void Exchange (const Standard_Integer anIndex,const Standard_Integer anOtherIndex);
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)

Returns:
	Handle_TColStd_HSequenceOfInteger

No detailed docstring for this function.") Split;
		Handle_TColStd_HSequenceOfInteger Split (const Standard_Integer anIndex);
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)
	anItem(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") SetValue;
		void SetValue (const Standard_Integer anIndex,Standard_Integer &OutValue);
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)

Returns:
	Standard_Integer

No detailed docstring for this function.") Value;
		const Standard_Integer & Value (const Standard_Integer anIndex);
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)

Returns:
	Standard_Integer

No detailed docstring for this function.") ChangeValue;
		Standard_Integer & ChangeValue (const Standard_Integer anIndex);
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Remove;
		void Remove (const Standard_Integer anIndex);
		%feature("autodoc", "Args:
	fromIndex(Standard_Integer)
	toIndex(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Remove;
		void Remove (const Standard_Integer fromIndex,const Standard_Integer toIndex);
		%feature("autodoc", "Args:
	None
Returns:
	TColStd_SequenceOfInteger

No detailed docstring for this function.") Sequence;
		const TColStd_SequenceOfInteger & Sequence ();
		%feature("autodoc", "Args:
	None
Returns:
	TColStd_SequenceOfInteger

No detailed docstring for this function.") ChangeSequence;
		TColStd_SequenceOfInteger & ChangeSequence ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_TColStd_HSequenceOfInteger

No detailed docstring for this function.") ShallowCopy;
		Handle_TColStd_HSequenceOfInteger ShallowCopy ();
};


%feature("shadow") TColStd_HSequenceOfInteger::~TColStd_HSequenceOfInteger %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TColStd_HSequenceOfInteger {
	void _kill_pointed() {
		delete $self;
	}
};
%extend TColStd_HSequenceOfInteger {
	Handle_TColStd_HSequenceOfInteger GetHandle() {
	return *(Handle_TColStd_HSequenceOfInteger*) &$self;
	}
};

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
    TColStd_HSequenceOfInteger* GetObject() {
    return (TColStd_HSequenceOfInteger*)$self->Access();
    }
};
%feature("shadow") Handle_TColStd_HSequenceOfInteger::~Handle_TColStd_HSequenceOfInteger %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_TColStd_HSequenceOfInteger {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor TColStd_HSequenceOfReal;
class TColStd_HSequenceOfReal : public MMgt_TShared {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") TColStd_HSequenceOfReal;
		 TColStd_HSequenceOfReal ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsEmpty;
		Standard_Boolean IsEmpty ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Length;
		Standard_Integer Length ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	anItem(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (Standard_Real &OutValue);
		%feature("autodoc", "Args:
	aSequence(Handle_TColStd_HSequenceOfReal)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (const Handle_TColStd_HSequenceOfReal & aSequence);
		%feature("autodoc", "Args:
	anItem(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (Standard_Real &OutValue);
		%feature("autodoc", "Args:
	aSequence(Handle_TColStd_HSequenceOfReal)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (const Handle_TColStd_HSequenceOfReal & aSequence);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Reverse;
		void Reverse ();
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)
	anItem(Standard_Real)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Standard_Integer anIndex,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)
	aSequence(Handle_TColStd_HSequenceOfReal)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Standard_Integer anIndex,const Handle_TColStd_HSequenceOfReal & aSequence);
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)
	anItem(Standard_Real)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Standard_Integer anIndex,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)
	aSequence(Handle_TColStd_HSequenceOfReal)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Standard_Integer anIndex,const Handle_TColStd_HSequenceOfReal & aSequence);
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)
	anOtherIndex(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Exchange;
		void Exchange (const Standard_Integer anIndex,const Standard_Integer anOtherIndex);
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)

Returns:
	Handle_TColStd_HSequenceOfReal

No detailed docstring for this function.") Split;
		Handle_TColStd_HSequenceOfReal Split (const Standard_Integer anIndex);
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)
	anItem(Standard_Real)

Returns:
	None

No detailed docstring for this function.") SetValue;
		void SetValue (const Standard_Integer anIndex,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)

Returns:
	Standard_Real

No detailed docstring for this function.") Value;
		const Standard_Real & Value (const Standard_Integer anIndex);
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)

Returns:
	Standard_Real

No detailed docstring for this function.") ChangeValue;
		Standard_Real & ChangeValue (const Standard_Integer anIndex);
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Remove;
		void Remove (const Standard_Integer anIndex);
		%feature("autodoc", "Args:
	fromIndex(Standard_Integer)
	toIndex(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Remove;
		void Remove (const Standard_Integer fromIndex,const Standard_Integer toIndex);
		%feature("autodoc", "Args:
	None
Returns:
	TColStd_SequenceOfReal

No detailed docstring for this function.") Sequence;
		const TColStd_SequenceOfReal & Sequence ();
		%feature("autodoc", "Args:
	None
Returns:
	TColStd_SequenceOfReal

No detailed docstring for this function.") ChangeSequence;
		TColStd_SequenceOfReal & ChangeSequence ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_TColStd_HSequenceOfReal

No detailed docstring for this function.") ShallowCopy;
		Handle_TColStd_HSequenceOfReal ShallowCopy ();
};


%feature("shadow") TColStd_HSequenceOfReal::~TColStd_HSequenceOfReal %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TColStd_HSequenceOfReal {
	void _kill_pointed() {
		delete $self;
	}
};
%extend TColStd_HSequenceOfReal {
	Handle_TColStd_HSequenceOfReal GetHandle() {
	return *(Handle_TColStd_HSequenceOfReal*) &$self;
	}
};

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
    TColStd_HSequenceOfReal* GetObject() {
    return (TColStd_HSequenceOfReal*)$self->Access();
    }
};
%feature("shadow") Handle_TColStd_HSequenceOfReal::~Handle_TColStd_HSequenceOfReal %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_TColStd_HSequenceOfReal {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor TColStd_HSequenceOfTransient;
class TColStd_HSequenceOfTransient : public MMgt_TShared {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") TColStd_HSequenceOfTransient;
		 TColStd_HSequenceOfTransient ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsEmpty;
		Standard_Boolean IsEmpty ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Length;
		Standard_Integer Length ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	anItem(Handle_Standard_Transient)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (const Handle_Standard_Transient & anItem);
		%feature("autodoc", "Args:
	aSequence(Handle_TColStd_HSequenceOfTransient)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (const Handle_TColStd_HSequenceOfTransient & aSequence);
		%feature("autodoc", "Args:
	anItem(Handle_Standard_Transient)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (const Handle_Standard_Transient & anItem);
		%feature("autodoc", "Args:
	aSequence(Handle_TColStd_HSequenceOfTransient)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (const Handle_TColStd_HSequenceOfTransient & aSequence);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Reverse;
		void Reverse ();
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)
	anItem(Handle_Standard_Transient)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Standard_Integer anIndex,const Handle_Standard_Transient & anItem);
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)
	aSequence(Handle_TColStd_HSequenceOfTransient)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Standard_Integer anIndex,const Handle_TColStd_HSequenceOfTransient & aSequence);
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)
	anItem(Handle_Standard_Transient)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Standard_Integer anIndex,const Handle_Standard_Transient & anItem);
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)
	aSequence(Handle_TColStd_HSequenceOfTransient)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Standard_Integer anIndex,const Handle_TColStd_HSequenceOfTransient & aSequence);
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)
	anOtherIndex(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Exchange;
		void Exchange (const Standard_Integer anIndex,const Standard_Integer anOtherIndex);
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)

Returns:
	Handle_TColStd_HSequenceOfTransient

No detailed docstring for this function.") Split;
		Handle_TColStd_HSequenceOfTransient Split (const Standard_Integer anIndex);
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)
	anItem(Handle_Standard_Transient)

Returns:
	None

No detailed docstring for this function.") SetValue;
		void SetValue (const Standard_Integer anIndex,const Handle_Standard_Transient & anItem);
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)

Returns:
	Handle_Standard_Transient

No detailed docstring for this function.") Value;
		const Handle_Standard_Transient & Value (const Standard_Integer anIndex);
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)

Returns:
	Handle_Standard_Transient

No detailed docstring for this function.") ChangeValue;
		Handle_Standard_Transient & ChangeValue (const Standard_Integer anIndex);
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Remove;
		void Remove (const Standard_Integer anIndex);
		%feature("autodoc", "Args:
	fromIndex(Standard_Integer)
	toIndex(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Remove;
		void Remove (const Standard_Integer fromIndex,const Standard_Integer toIndex);
		%feature("autodoc", "Args:
	None
Returns:
	TColStd_SequenceOfTransient

No detailed docstring for this function.") Sequence;
		const TColStd_SequenceOfTransient & Sequence ();
		%feature("autodoc", "Args:
	None
Returns:
	TColStd_SequenceOfTransient

No detailed docstring for this function.") ChangeSequence;
		TColStd_SequenceOfTransient & ChangeSequence ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_TColStd_HSequenceOfTransient

No detailed docstring for this function.") ShallowCopy;
		Handle_TColStd_HSequenceOfTransient ShallowCopy ();
};


%feature("shadow") TColStd_HSequenceOfTransient::~TColStd_HSequenceOfTransient %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TColStd_HSequenceOfTransient {
	void _kill_pointed() {
		delete $self;
	}
};
%extend TColStd_HSequenceOfTransient {
	Handle_TColStd_HSequenceOfTransient GetHandle() {
	return *(Handle_TColStd_HSequenceOfTransient*) &$self;
	}
};

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
    TColStd_HSequenceOfTransient* GetObject() {
    return (TColStd_HSequenceOfTransient*)$self->Access();
    }
};
%feature("shadow") Handle_TColStd_HSequenceOfTransient::~Handle_TColStd_HSequenceOfTransient %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_TColStd_HSequenceOfTransient {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor TColStd_HSetOfInteger;
class TColStd_HSetOfInteger : public MMgt_TShared {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") TColStd_HSetOfInteger;
		 TColStd_HSetOfInteger ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Extent;
		Standard_Integer Extent ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsEmpty;
		Standard_Boolean IsEmpty ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	T(Standard_Integer)

Returns:
	Standard_Boolean

No detailed docstring for this function.") Add;
		Standard_Boolean Add (Standard_Integer &OutValue);
		%feature("autodoc", "Args:
	T(Standard_Integer)

Returns:
	Standard_Boolean

No detailed docstring for this function.") Remove;
		Standard_Boolean Remove (Standard_Integer &OutValue);
		%feature("autodoc", "Args:
	B(Handle_TColStd_HSetOfInteger)

Returns:
	Handle_TColStd_HSetOfInteger

No detailed docstring for this function.") Union;
		Handle_TColStd_HSetOfInteger Union (const Handle_TColStd_HSetOfInteger & B);
		%feature("autodoc", "Args:
	B(Handle_TColStd_HSetOfInteger)

Returns:
	Handle_TColStd_HSetOfInteger

No detailed docstring for this function.") Intersection;
		Handle_TColStd_HSetOfInteger Intersection (const Handle_TColStd_HSetOfInteger & B);
		%feature("autodoc", "Args:
	B(Handle_TColStd_HSetOfInteger)

Returns:
	Handle_TColStd_HSetOfInteger

No detailed docstring for this function.") Difference;
		Handle_TColStd_HSetOfInteger Difference (const Handle_TColStd_HSetOfInteger & B);
		%feature("autodoc", "Args:
	T(Standard_Integer)

Returns:
	Standard_Boolean

No detailed docstring for this function.") Contains;
		Standard_Boolean Contains (Standard_Integer &OutValue);
		%feature("autodoc", "Args:
	S(Handle_TColStd_HSetOfInteger)

Returns:
	Standard_Boolean

No detailed docstring for this function.") IsASubset;
		Standard_Boolean IsASubset (const Handle_TColStd_HSetOfInteger & S);
		%feature("autodoc", "Args:
	S(Handle_TColStd_HSetOfInteger)

Returns:
	Standard_Boolean

No detailed docstring for this function.") IsAProperSubset;
		Standard_Boolean IsAProperSubset (const Handle_TColStd_HSetOfInteger & S);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_TColStd_HSetOfInteger

No detailed docstring for this function.") ShallowCopy;
		Handle_TColStd_HSetOfInteger ShallowCopy ();
		%feature("autodoc", "Args:
	None
Returns:
	TColStd_SetOfInteger

No detailed docstring for this function.") Set;
		const TColStd_SetOfInteger & Set ();
		%feature("autodoc", "Args:
	None
Returns:
	TColStd_SetOfInteger

No detailed docstring for this function.") ChangeSet;
		TColStd_SetOfInteger & ChangeSet ();
};


%feature("shadow") TColStd_HSetOfInteger::~TColStd_HSetOfInteger %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TColStd_HSetOfInteger {
	void _kill_pointed() {
		delete $self;
	}
};
%extend TColStd_HSetOfInteger {
	Handle_TColStd_HSetOfInteger GetHandle() {
	return *(Handle_TColStd_HSetOfInteger*) &$self;
	}
};

%nodefaultctor Handle_TColStd_HSetOfInteger;
class Handle_TColStd_HSetOfInteger : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_TColStd_HSetOfInteger();
        Handle_TColStd_HSetOfInteger(const Handle_TColStd_HSetOfInteger &aHandle);
        Handle_TColStd_HSetOfInteger(const TColStd_HSetOfInteger *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_TColStd_HSetOfInteger DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_TColStd_HSetOfInteger {
    TColStd_HSetOfInteger* GetObject() {
    return (TColStd_HSetOfInteger*)$self->Access();
    }
};
%feature("shadow") Handle_TColStd_HSetOfInteger::~Handle_TColStd_HSetOfInteger %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_TColStd_HSetOfInteger {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor TColStd_HSetOfReal;
class TColStd_HSetOfReal : public MMgt_TShared {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") TColStd_HSetOfReal;
		 TColStd_HSetOfReal ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Extent;
		Standard_Integer Extent ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsEmpty;
		Standard_Boolean IsEmpty ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	T(Standard_Real)

Returns:
	Standard_Boolean

No detailed docstring for this function.") Add;
		Standard_Boolean Add (Standard_Real &OutValue);
		%feature("autodoc", "Args:
	T(Standard_Real)

Returns:
	Standard_Boolean

No detailed docstring for this function.") Remove;
		Standard_Boolean Remove (Standard_Real &OutValue);
		%feature("autodoc", "Args:
	B(Handle_TColStd_HSetOfReal)

Returns:
	Handle_TColStd_HSetOfReal

No detailed docstring for this function.") Union;
		Handle_TColStd_HSetOfReal Union (const Handle_TColStd_HSetOfReal & B);
		%feature("autodoc", "Args:
	B(Handle_TColStd_HSetOfReal)

Returns:
	Handle_TColStd_HSetOfReal

No detailed docstring for this function.") Intersection;
		Handle_TColStd_HSetOfReal Intersection (const Handle_TColStd_HSetOfReal & B);
		%feature("autodoc", "Args:
	B(Handle_TColStd_HSetOfReal)

Returns:
	Handle_TColStd_HSetOfReal

No detailed docstring for this function.") Difference;
		Handle_TColStd_HSetOfReal Difference (const Handle_TColStd_HSetOfReal & B);
		%feature("autodoc", "Args:
	T(Standard_Real)

Returns:
	Standard_Boolean

No detailed docstring for this function.") Contains;
		Standard_Boolean Contains (Standard_Real &OutValue);
		%feature("autodoc", "Args:
	S(Handle_TColStd_HSetOfReal)

Returns:
	Standard_Boolean

No detailed docstring for this function.") IsASubset;
		Standard_Boolean IsASubset (const Handle_TColStd_HSetOfReal & S);
		%feature("autodoc", "Args:
	S(Handle_TColStd_HSetOfReal)

Returns:
	Standard_Boolean

No detailed docstring for this function.") IsAProperSubset;
		Standard_Boolean IsAProperSubset (const Handle_TColStd_HSetOfReal & S);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_TColStd_HSetOfReal

No detailed docstring for this function.") ShallowCopy;
		Handle_TColStd_HSetOfReal ShallowCopy ();
		%feature("autodoc", "Args:
	None
Returns:
	TColStd_SetOfReal

No detailed docstring for this function.") Set;
		const TColStd_SetOfReal & Set ();
		%feature("autodoc", "Args:
	None
Returns:
	TColStd_SetOfReal

No detailed docstring for this function.") ChangeSet;
		TColStd_SetOfReal & ChangeSet ();
};


%feature("shadow") TColStd_HSetOfReal::~TColStd_HSetOfReal %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TColStd_HSetOfReal {
	void _kill_pointed() {
		delete $self;
	}
};
%extend TColStd_HSetOfReal {
	Handle_TColStd_HSetOfReal GetHandle() {
	return *(Handle_TColStd_HSetOfReal*) &$self;
	}
};

%nodefaultctor Handle_TColStd_HSetOfReal;
class Handle_TColStd_HSetOfReal : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_TColStd_HSetOfReal();
        Handle_TColStd_HSetOfReal(const Handle_TColStd_HSetOfReal &aHandle);
        Handle_TColStd_HSetOfReal(const TColStd_HSetOfReal *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_TColStd_HSetOfReal DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_TColStd_HSetOfReal {
    TColStd_HSetOfReal* GetObject() {
    return (TColStd_HSetOfReal*)$self->Access();
    }
};
%feature("shadow") Handle_TColStd_HSetOfReal::~Handle_TColStd_HSetOfReal %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_TColStd_HSetOfReal {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor TColStd_HSetOfTransient;
class TColStd_HSetOfTransient : public MMgt_TShared {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") TColStd_HSetOfTransient;
		 TColStd_HSetOfTransient ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Extent;
		Standard_Integer Extent ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsEmpty;
		Standard_Boolean IsEmpty ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	T(Handle_Standard_Transient)

Returns:
	Standard_Boolean

No detailed docstring for this function.") Add;
		Standard_Boolean Add (const Handle_Standard_Transient & T);
		%feature("autodoc", "Args:
	T(Handle_Standard_Transient)

Returns:
	Standard_Boolean

No detailed docstring for this function.") Remove;
		Standard_Boolean Remove (const Handle_Standard_Transient & T);
		%feature("autodoc", "Args:
	B(Handle_TColStd_HSetOfTransient)

Returns:
	Handle_TColStd_HSetOfTransient

No detailed docstring for this function.") Union;
		Handle_TColStd_HSetOfTransient Union (const Handle_TColStd_HSetOfTransient & B);
		%feature("autodoc", "Args:
	B(Handle_TColStd_HSetOfTransient)

Returns:
	Handle_TColStd_HSetOfTransient

No detailed docstring for this function.") Intersection;
		Handle_TColStd_HSetOfTransient Intersection (const Handle_TColStd_HSetOfTransient & B);
		%feature("autodoc", "Args:
	B(Handle_TColStd_HSetOfTransient)

Returns:
	Handle_TColStd_HSetOfTransient

No detailed docstring for this function.") Difference;
		Handle_TColStd_HSetOfTransient Difference (const Handle_TColStd_HSetOfTransient & B);
		%feature("autodoc", "Args:
	T(Handle_Standard_Transient)

Returns:
	Standard_Boolean

No detailed docstring for this function.") Contains;
		Standard_Boolean Contains (const Handle_Standard_Transient & T);
		%feature("autodoc", "Args:
	S(Handle_TColStd_HSetOfTransient)

Returns:
	Standard_Boolean

No detailed docstring for this function.") IsASubset;
		Standard_Boolean IsASubset (const Handle_TColStd_HSetOfTransient & S);
		%feature("autodoc", "Args:
	S(Handle_TColStd_HSetOfTransient)

Returns:
	Standard_Boolean

No detailed docstring for this function.") IsAProperSubset;
		Standard_Boolean IsAProperSubset (const Handle_TColStd_HSetOfTransient & S);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_TColStd_HSetOfTransient

No detailed docstring for this function.") ShallowCopy;
		Handle_TColStd_HSetOfTransient ShallowCopy ();
		%feature("autodoc", "Args:
	None
Returns:
	TColStd_SetOfTransient

No detailed docstring for this function.") Set;
		const TColStd_SetOfTransient & Set ();
		%feature("autodoc", "Args:
	None
Returns:
	TColStd_SetOfTransient

No detailed docstring for this function.") ChangeSet;
		TColStd_SetOfTransient & ChangeSet ();
};


%feature("shadow") TColStd_HSetOfTransient::~TColStd_HSetOfTransient %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TColStd_HSetOfTransient {
	void _kill_pointed() {
		delete $self;
	}
};
%extend TColStd_HSetOfTransient {
	Handle_TColStd_HSetOfTransient GetHandle() {
	return *(Handle_TColStd_HSetOfTransient*) &$self;
	}
};

%nodefaultctor Handle_TColStd_HSetOfTransient;
class Handle_TColStd_HSetOfTransient : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_TColStd_HSetOfTransient();
        Handle_TColStd_HSetOfTransient(const Handle_TColStd_HSetOfTransient &aHandle);
        Handle_TColStd_HSetOfTransient(const TColStd_HSetOfTransient *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_TColStd_HSetOfTransient DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_TColStd_HSetOfTransient {
    TColStd_HSetOfTransient* GetObject() {
    return (TColStd_HSetOfTransient*)$self->Access();
    }
};
%feature("shadow") Handle_TColStd_HSetOfTransient::~Handle_TColStd_HSetOfTransient %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_TColStd_HSetOfTransient {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor TColStd_IndexedDataMapNodeOfIndexedDataMapOfTransientTransient;
class TColStd_IndexedDataMapNodeOfIndexedDataMapOfTransientTransient : public TCollection_MapNode {
	public:
		%feature("autodoc", "Args:
	K1(Handle_Standard_Transient)
	K2(Standard_Integer)
	I(Handle_Standard_Transient)
	n1(TCollection_MapNodePtr)
	n2(TCollection_MapNodePtr)

Returns:
	None

No detailed docstring for this function.") TColStd_IndexedDataMapNodeOfIndexedDataMapOfTransientTransient;
		 TColStd_IndexedDataMapNodeOfIndexedDataMapOfTransientTransient (const Handle_Standard_Transient & K1,const Standard_Integer K2,const Handle_Standard_Transient & I,const TCollection_MapNodePtr & n1,const TCollection_MapNodePtr & n2);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Standard_Transient

No detailed docstring for this function.") Key1;
		Handle_Standard_Transient & Key1 ();

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
            		%feature("autodoc", "Args:
	None
Returns:
	TCollection_MapNodePtr

No detailed docstring for this function.") Next2;
		TCollection_MapNodePtr & Next2 ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Standard_Transient

No detailed docstring for this function.") Value;
		Handle_Standard_Transient & Value ();
};


%feature("shadow") TColStd_IndexedDataMapNodeOfIndexedDataMapOfTransientTransient::~TColStd_IndexedDataMapNodeOfIndexedDataMapOfTransientTransient %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TColStd_IndexedDataMapNodeOfIndexedDataMapOfTransientTransient {
	void _kill_pointed() {
		delete $self;
	}
};
%extend TColStd_IndexedDataMapNodeOfIndexedDataMapOfTransientTransient {
	Handle_TColStd_IndexedDataMapNodeOfIndexedDataMapOfTransientTransient GetHandle() {
	return *(Handle_TColStd_IndexedDataMapNodeOfIndexedDataMapOfTransientTransient*) &$self;
	}
};

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
    TColStd_IndexedDataMapNodeOfIndexedDataMapOfTransientTransient* GetObject() {
    return (TColStd_IndexedDataMapNodeOfIndexedDataMapOfTransientTransient*)$self->Access();
    }
};
%feature("shadow") Handle_TColStd_IndexedDataMapNodeOfIndexedDataMapOfTransientTransient::~Handle_TColStd_IndexedDataMapNodeOfIndexedDataMapOfTransientTransient %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_TColStd_IndexedDataMapNodeOfIndexedDataMapOfTransientTransient {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor TColStd_IndexedDataMapOfTransientTransient;
class TColStd_IndexedDataMapOfTransientTransient : public TCollection_BasicMap {
	public:
		%feature("autodoc", "Args:
	NbBuckets(Standard_Integer)=1

Returns:
	None

No detailed docstring for this function.") TColStd_IndexedDataMapOfTransientTransient;
		 TColStd_IndexedDataMapOfTransientTransient (const Standard_Integer NbBuckets = 1);
		%feature("autodoc", "Args:
	Other(TColStd_IndexedDataMapOfTransientTransient)

Returns:
	TColStd_IndexedDataMapOfTransientTransient

No detailed docstring for this function.") Assign;
		TColStd_IndexedDataMapOfTransientTransient & Assign (const TColStd_IndexedDataMapOfTransientTransient & Other);
		%feature("autodoc", "Args:
	Other(TColStd_IndexedDataMapOfTransientTransient)

Returns:
	TColStd_IndexedDataMapOfTransientTransient

No detailed docstring for this function.") operator=;
		TColStd_IndexedDataMapOfTransientTransient & operator = (const TColStd_IndexedDataMapOfTransientTransient & Other);
		%feature("autodoc", "Args:
	NbBuckets(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") ReSize;
		void ReSize (const Standard_Integer NbBuckets);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	K(Handle_Standard_Transient)
	I(Handle_Standard_Transient)

Returns:
	Standard_Integer

No detailed docstring for this function.") Add;
		Standard_Integer Add (const Handle_Standard_Transient & K,const Handle_Standard_Transient & I);
		%feature("autodoc", "Args:
	I(Standard_Integer)
	K(Handle_Standard_Transient)
	T(Handle_Standard_Transient)

Returns:
	None

No detailed docstring for this function.") Substitute;
		void Substitute (const Standard_Integer I,const Handle_Standard_Transient & K,const Handle_Standard_Transient & T);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") RemoveLast;
		void RemoveLast ();
		%feature("autodoc", "Args:
	K(Handle_Standard_Transient)

Returns:
	Standard_Boolean

No detailed docstring for this function.") Contains;
		Standard_Boolean Contains (const Handle_Standard_Transient & K);
		%feature("autodoc", "Args:
	I(Standard_Integer)

Returns:
	Handle_Standard_Transient

No detailed docstring for this function.") FindKey;
		const Handle_Standard_Transient & FindKey (const Standard_Integer I);
		%feature("autodoc", "Args:
	I(Standard_Integer)

Returns:
	Handle_Standard_Transient

No detailed docstring for this function.") FindFromIndex;
		const Handle_Standard_Transient & FindFromIndex (const Standard_Integer I);
		%feature("autodoc", "Args:
	I(Standard_Integer)

Returns:
	Handle_Standard_Transient

No detailed docstring for this function.") ChangeFromIndex;
		Handle_Standard_Transient & ChangeFromIndex (const Standard_Integer I);
		%feature("autodoc", "Args:
	K(Handle_Standard_Transient)

Returns:
	Standard_Integer

No detailed docstring for this function.") FindIndex;
		Standard_Integer FindIndex (const Handle_Standard_Transient & K);
		%feature("autodoc", "Args:
	K(Handle_Standard_Transient)

Returns:
	Handle_Standard_Transient

No detailed docstring for this function.") FindFromKey;
		const Handle_Standard_Transient & FindFromKey (const Handle_Standard_Transient & K);
		%feature("autodoc", "Args:
	K(Handle_Standard_Transient)

Returns:
	Handle_Standard_Transient

No detailed docstring for this function.") ChangeFromKey;
		Handle_Standard_Transient & ChangeFromKey (const Handle_Standard_Transient & K);
		%feature("autodoc", "Args:
	K(Handle_Standard_Transient)

Returns:
	Standard_Address

No detailed docstring for this function.") FindFromKey1;
		Standard_Address FindFromKey1 (const Handle_Standard_Transient & K);
		%feature("autodoc", "Args:
	K(Handle_Standard_Transient)

Returns:
	Standard_Address

No detailed docstring for this function.") ChangeFromKey1;
		Standard_Address ChangeFromKey1 (const Handle_Standard_Transient & K);
};


%feature("shadow") TColStd_IndexedDataMapOfTransientTransient::~TColStd_IndexedDataMapOfTransientTransient %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TColStd_IndexedDataMapOfTransientTransient {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor TColStd_IndexedMapNodeOfIndexedMapOfInteger;
class TColStd_IndexedMapNodeOfIndexedMapOfInteger : public TCollection_MapNode {
	public:
		%feature("autodoc", "Args:
	K1(Standard_Integer)
	K2(Standard_Integer)
	n1(TCollection_MapNodePtr)
	n2(TCollection_MapNodePtr)

Returns:
	None

No detailed docstring for this function.") TColStd_IndexedMapNodeOfIndexedMapOfInteger;
		 TColStd_IndexedMapNodeOfIndexedMapOfInteger (Standard_Integer &OutValue,const Standard_Integer K2,const TCollection_MapNodePtr & n1,const TCollection_MapNodePtr & n2);

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
            		%feature("autodoc", "Args:
	None
Returns:
	TCollection_MapNodePtr

No detailed docstring for this function.") Next2;
		TCollection_MapNodePtr & Next2 ();
};


%feature("shadow") TColStd_IndexedMapNodeOfIndexedMapOfInteger::~TColStd_IndexedMapNodeOfIndexedMapOfInteger %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TColStd_IndexedMapNodeOfIndexedMapOfInteger {
	void _kill_pointed() {
		delete $self;
	}
};
%extend TColStd_IndexedMapNodeOfIndexedMapOfInteger {
	Handle_TColStd_IndexedMapNodeOfIndexedMapOfInteger GetHandle() {
	return *(Handle_TColStd_IndexedMapNodeOfIndexedMapOfInteger*) &$self;
	}
};

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
    TColStd_IndexedMapNodeOfIndexedMapOfInteger* GetObject() {
    return (TColStd_IndexedMapNodeOfIndexedMapOfInteger*)$self->Access();
    }
};
%feature("shadow") Handle_TColStd_IndexedMapNodeOfIndexedMapOfInteger::~Handle_TColStd_IndexedMapNodeOfIndexedMapOfInteger %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_TColStd_IndexedMapNodeOfIndexedMapOfInteger {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor TColStd_IndexedMapNodeOfIndexedMapOfReal;
class TColStd_IndexedMapNodeOfIndexedMapOfReal : public TCollection_MapNode {
	public:
		%feature("autodoc", "Args:
	K1(Standard_Real)
	K2(Standard_Integer)
	n1(TCollection_MapNodePtr)
	n2(TCollection_MapNodePtr)

Returns:
	None

No detailed docstring for this function.") TColStd_IndexedMapNodeOfIndexedMapOfReal;
		 TColStd_IndexedMapNodeOfIndexedMapOfReal (Standard_Real &OutValue,const Standard_Integer K2,const TCollection_MapNodePtr & n1,const TCollection_MapNodePtr & n2);

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
            		%feature("autodoc", "Args:
	None
Returns:
	TCollection_MapNodePtr

No detailed docstring for this function.") Next2;
		TCollection_MapNodePtr & Next2 ();
};


%feature("shadow") TColStd_IndexedMapNodeOfIndexedMapOfReal::~TColStd_IndexedMapNodeOfIndexedMapOfReal %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TColStd_IndexedMapNodeOfIndexedMapOfReal {
	void _kill_pointed() {
		delete $self;
	}
};
%extend TColStd_IndexedMapNodeOfIndexedMapOfReal {
	Handle_TColStd_IndexedMapNodeOfIndexedMapOfReal GetHandle() {
	return *(Handle_TColStd_IndexedMapNodeOfIndexedMapOfReal*) &$self;
	}
};

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
    TColStd_IndexedMapNodeOfIndexedMapOfReal* GetObject() {
    return (TColStd_IndexedMapNodeOfIndexedMapOfReal*)$self->Access();
    }
};
%feature("shadow") Handle_TColStd_IndexedMapNodeOfIndexedMapOfReal::~Handle_TColStd_IndexedMapNodeOfIndexedMapOfReal %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_TColStd_IndexedMapNodeOfIndexedMapOfReal {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor TColStd_IndexedMapNodeOfIndexedMapOfTransient;
class TColStd_IndexedMapNodeOfIndexedMapOfTransient : public TCollection_MapNode {
	public:
		%feature("autodoc", "Args:
	K1(Handle_Standard_Transient)
	K2(Standard_Integer)
	n1(TCollection_MapNodePtr)
	n2(TCollection_MapNodePtr)

Returns:
	None

No detailed docstring for this function.") TColStd_IndexedMapNodeOfIndexedMapOfTransient;
		 TColStd_IndexedMapNodeOfIndexedMapOfTransient (const Handle_Standard_Transient & K1,const Standard_Integer K2,const TCollection_MapNodePtr & n1,const TCollection_MapNodePtr & n2);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Standard_Transient

No detailed docstring for this function.") Key1;
		Handle_Standard_Transient & Key1 ();

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
            		%feature("autodoc", "Args:
	None
Returns:
	TCollection_MapNodePtr

No detailed docstring for this function.") Next2;
		TCollection_MapNodePtr & Next2 ();
};


%feature("shadow") TColStd_IndexedMapNodeOfIndexedMapOfTransient::~TColStd_IndexedMapNodeOfIndexedMapOfTransient %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TColStd_IndexedMapNodeOfIndexedMapOfTransient {
	void _kill_pointed() {
		delete $self;
	}
};
%extend TColStd_IndexedMapNodeOfIndexedMapOfTransient {
	Handle_TColStd_IndexedMapNodeOfIndexedMapOfTransient GetHandle() {
	return *(Handle_TColStd_IndexedMapNodeOfIndexedMapOfTransient*) &$self;
	}
};

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
    TColStd_IndexedMapNodeOfIndexedMapOfTransient* GetObject() {
    return (TColStd_IndexedMapNodeOfIndexedMapOfTransient*)$self->Access();
    }
};
%feature("shadow") Handle_TColStd_IndexedMapNodeOfIndexedMapOfTransient::~Handle_TColStd_IndexedMapNodeOfIndexedMapOfTransient %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_TColStd_IndexedMapNodeOfIndexedMapOfTransient {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor TColStd_IndexedMapOfInteger;
class TColStd_IndexedMapOfInteger : public TCollection_BasicMap {
	public:
		%feature("autodoc", "Args:
	NbBuckets(Standard_Integer)=1

Returns:
	None

No detailed docstring for this function.") TColStd_IndexedMapOfInteger;
		 TColStd_IndexedMapOfInteger (const Standard_Integer NbBuckets = 1);
		%feature("autodoc", "Args:
	Other(TColStd_IndexedMapOfInteger)

Returns:
	TColStd_IndexedMapOfInteger

No detailed docstring for this function.") Assign;
		TColStd_IndexedMapOfInteger & Assign (const TColStd_IndexedMapOfInteger & Other);
		%feature("autodoc", "Args:
	Other(TColStd_IndexedMapOfInteger)

Returns:
	TColStd_IndexedMapOfInteger

No detailed docstring for this function.") operator=;
		TColStd_IndexedMapOfInteger & operator = (const TColStd_IndexedMapOfInteger & Other);
		%feature("autodoc", "Args:
	NbBuckets(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") ReSize;
		void ReSize (const Standard_Integer NbBuckets);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	K(Standard_Integer)

Returns:
	Standard_Integer

No detailed docstring for this function.") Add;
		Standard_Integer Add (Standard_Integer &OutValue);
		%feature("autodoc", "Args:
	I(Standard_Integer)
	K(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Substitute;
		void Substitute (const Standard_Integer I,Standard_Integer &OutValue);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") RemoveLast;
		void RemoveLast ();
		%feature("autodoc", "Args:
	K(Standard_Integer)

Returns:
	Standard_Boolean

No detailed docstring for this function.") Contains;
		Standard_Boolean Contains (Standard_Integer &OutValue);
		%feature("autodoc", "Args:
	I(Standard_Integer)

Returns:
	Standard_Integer

No detailed docstring for this function.") FindKey;
		const Standard_Integer & FindKey (const Standard_Integer I);
		%feature("autodoc", "Args:
	K(Standard_Integer)

Returns:
	Standard_Integer

No detailed docstring for this function.") FindIndex;
		Standard_Integer FindIndex (Standard_Integer &OutValue);
};


%feature("shadow") TColStd_IndexedMapOfInteger::~TColStd_IndexedMapOfInteger %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TColStd_IndexedMapOfInteger {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor TColStd_IndexedMapOfReal;
class TColStd_IndexedMapOfReal : public TCollection_BasicMap {
	public:
		%feature("autodoc", "Args:
	NbBuckets(Standard_Integer)=1

Returns:
	None

No detailed docstring for this function.") TColStd_IndexedMapOfReal;
		 TColStd_IndexedMapOfReal (const Standard_Integer NbBuckets = 1);
		%feature("autodoc", "Args:
	Other(TColStd_IndexedMapOfReal)

Returns:
	TColStd_IndexedMapOfReal

No detailed docstring for this function.") Assign;
		TColStd_IndexedMapOfReal & Assign (const TColStd_IndexedMapOfReal & Other);
		%feature("autodoc", "Args:
	Other(TColStd_IndexedMapOfReal)

Returns:
	TColStd_IndexedMapOfReal

No detailed docstring for this function.") operator=;
		TColStd_IndexedMapOfReal & operator = (const TColStd_IndexedMapOfReal & Other);
		%feature("autodoc", "Args:
	NbBuckets(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") ReSize;
		void ReSize (const Standard_Integer NbBuckets);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	K(Standard_Real)

Returns:
	Standard_Integer

No detailed docstring for this function.") Add;
		Standard_Integer Add (Standard_Real &OutValue);
		%feature("autodoc", "Args:
	I(Standard_Integer)
	K(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Substitute;
		void Substitute (const Standard_Integer I,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") RemoveLast;
		void RemoveLast ();
		%feature("autodoc", "Args:
	K(Standard_Real)

Returns:
	Standard_Boolean

No detailed docstring for this function.") Contains;
		Standard_Boolean Contains (Standard_Real &OutValue);
		%feature("autodoc", "Args:
	I(Standard_Integer)

Returns:
	Standard_Real

No detailed docstring for this function.") FindKey;
		const Standard_Real & FindKey (const Standard_Integer I);
		%feature("autodoc", "Args:
	K(Standard_Real)

Returns:
	Standard_Integer

No detailed docstring for this function.") FindIndex;
		Standard_Integer FindIndex (Standard_Real &OutValue);
};


%feature("shadow") TColStd_IndexedMapOfReal::~TColStd_IndexedMapOfReal %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TColStd_IndexedMapOfReal {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor TColStd_IndexedMapOfTransient;
class TColStd_IndexedMapOfTransient : public TCollection_BasicMap {
	public:
		%feature("autodoc", "Args:
	NbBuckets(Standard_Integer)=1

Returns:
	None

No detailed docstring for this function.") TColStd_IndexedMapOfTransient;
		 TColStd_IndexedMapOfTransient (const Standard_Integer NbBuckets = 1);
		%feature("autodoc", "Args:
	Other(TColStd_IndexedMapOfTransient)

Returns:
	TColStd_IndexedMapOfTransient

No detailed docstring for this function.") Assign;
		TColStd_IndexedMapOfTransient & Assign (const TColStd_IndexedMapOfTransient & Other);
		%feature("autodoc", "Args:
	Other(TColStd_IndexedMapOfTransient)

Returns:
	TColStd_IndexedMapOfTransient

No detailed docstring for this function.") operator=;
		TColStd_IndexedMapOfTransient & operator = (const TColStd_IndexedMapOfTransient & Other);
		%feature("autodoc", "Args:
	NbBuckets(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") ReSize;
		void ReSize (const Standard_Integer NbBuckets);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	K(Handle_Standard_Transient)

Returns:
	Standard_Integer

No detailed docstring for this function.") Add;
		Standard_Integer Add (const Handle_Standard_Transient & K);
		%feature("autodoc", "Args:
	I(Standard_Integer)
	K(Handle_Standard_Transient)

Returns:
	None

No detailed docstring for this function.") Substitute;
		void Substitute (const Standard_Integer I,const Handle_Standard_Transient & K);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") RemoveLast;
		void RemoveLast ();
		%feature("autodoc", "Args:
	K(Handle_Standard_Transient)

Returns:
	Standard_Boolean

No detailed docstring for this function.") Contains;
		Standard_Boolean Contains (const Handle_Standard_Transient & K);
		%feature("autodoc", "Args:
	I(Standard_Integer)

Returns:
	Handle_Standard_Transient

No detailed docstring for this function.") FindKey;
		const Handle_Standard_Transient & FindKey (const Standard_Integer I);
		%feature("autodoc", "Args:
	K(Handle_Standard_Transient)

Returns:
	Standard_Integer

No detailed docstring for this function.") FindIndex;
		Standard_Integer FindIndex (const Handle_Standard_Transient & K);
};


%feature("shadow") TColStd_IndexedMapOfTransient::~TColStd_IndexedMapOfTransient %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TColStd_IndexedMapOfTransient {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor TColStd_ListIteratorOfListOfAsciiString;
class TColStd_ListIteratorOfListOfAsciiString {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") TColStd_ListIteratorOfListOfAsciiString;
		 TColStd_ListIteratorOfListOfAsciiString ();
		%feature("autodoc", "Args:
	L(TColStd_ListOfAsciiString)

Returns:
	None

No detailed docstring for this function.") TColStd_ListIteratorOfListOfAsciiString;
		 TColStd_ListIteratorOfListOfAsciiString (const TColStd_ListOfAsciiString & L);
		%feature("autodoc", "Args:
	L(TColStd_ListOfAsciiString)

Returns:
	None

No detailed docstring for this function.") Initialize;
		void Initialize (const TColStd_ListOfAsciiString & L);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") More;
		Standard_Boolean More ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Next;
		void Next ();
		%feature("autodoc", "Args:
	None
Returns:
	TCollection_AsciiString

No detailed docstring for this function.") Value;
		TCollection_AsciiString & Value ();
};


%feature("shadow") TColStd_ListIteratorOfListOfAsciiString::~TColStd_ListIteratorOfListOfAsciiString %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TColStd_ListIteratorOfListOfAsciiString {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor TColStd_ListIteratorOfListOfInteger;
class TColStd_ListIteratorOfListOfInteger {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") TColStd_ListIteratorOfListOfInteger;
		 TColStd_ListIteratorOfListOfInteger ();
		%feature("autodoc", "Args:
	L(TColStd_ListOfInteger)

Returns:
	None

No detailed docstring for this function.") TColStd_ListIteratorOfListOfInteger;
		 TColStd_ListIteratorOfListOfInteger (const TColStd_ListOfInteger & L);
		%feature("autodoc", "Args:
	L(TColStd_ListOfInteger)

Returns:
	None

No detailed docstring for this function.") Initialize;
		void Initialize (const TColStd_ListOfInteger & L);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") More;
		Standard_Boolean More ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Next;
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


%feature("shadow") TColStd_ListIteratorOfListOfInteger::~TColStd_ListIteratorOfListOfInteger %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TColStd_ListIteratorOfListOfInteger {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor TColStd_ListIteratorOfListOfReal;
class TColStd_ListIteratorOfListOfReal {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") TColStd_ListIteratorOfListOfReal;
		 TColStd_ListIteratorOfListOfReal ();
		%feature("autodoc", "Args:
	L(TColStd_ListOfReal)

Returns:
	None

No detailed docstring for this function.") TColStd_ListIteratorOfListOfReal;
		 TColStd_ListIteratorOfListOfReal (const TColStd_ListOfReal & L);
		%feature("autodoc", "Args:
	L(TColStd_ListOfReal)

Returns:
	None

No detailed docstring for this function.") Initialize;
		void Initialize (const TColStd_ListOfReal & L);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") More;
		Standard_Boolean More ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Next;
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


%feature("shadow") TColStd_ListIteratorOfListOfReal::~TColStd_ListIteratorOfListOfReal %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TColStd_ListIteratorOfListOfReal {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor TColStd_ListIteratorOfListOfTransient;
class TColStd_ListIteratorOfListOfTransient {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") TColStd_ListIteratorOfListOfTransient;
		 TColStd_ListIteratorOfListOfTransient ();
		%feature("autodoc", "Args:
	L(TColStd_ListOfTransient)

Returns:
	None

No detailed docstring for this function.") TColStd_ListIteratorOfListOfTransient;
		 TColStd_ListIteratorOfListOfTransient (const TColStd_ListOfTransient & L);
		%feature("autodoc", "Args:
	L(TColStd_ListOfTransient)

Returns:
	None

No detailed docstring for this function.") Initialize;
		void Initialize (const TColStd_ListOfTransient & L);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") More;
		Standard_Boolean More ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Next;
		void Next ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Standard_Transient

No detailed docstring for this function.") Value;
		Handle_Standard_Transient & Value ();
};


%feature("shadow") TColStd_ListIteratorOfListOfTransient::~TColStd_ListIteratorOfListOfTransient %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TColStd_ListIteratorOfListOfTransient {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor TColStd_ListIteratorOfSetListOfSetOfInteger;
class TColStd_ListIteratorOfSetListOfSetOfInteger {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") TColStd_ListIteratorOfSetListOfSetOfInteger;
		 TColStd_ListIteratorOfSetListOfSetOfInteger ();
		%feature("autodoc", "Args:
	L(TColStd_SetListOfSetOfInteger)

Returns:
	None

No detailed docstring for this function.") TColStd_ListIteratorOfSetListOfSetOfInteger;
		 TColStd_ListIteratorOfSetListOfSetOfInteger (const TColStd_SetListOfSetOfInteger & L);
		%feature("autodoc", "Args:
	L(TColStd_SetListOfSetOfInteger)

Returns:
	None

No detailed docstring for this function.") Initialize;
		void Initialize (const TColStd_SetListOfSetOfInteger & L);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") More;
		Standard_Boolean More ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Next;
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


%feature("shadow") TColStd_ListIteratorOfSetListOfSetOfInteger::~TColStd_ListIteratorOfSetListOfSetOfInteger %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TColStd_ListIteratorOfSetListOfSetOfInteger {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor TColStd_ListIteratorOfSetListOfSetOfReal;
class TColStd_ListIteratorOfSetListOfSetOfReal {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") TColStd_ListIteratorOfSetListOfSetOfReal;
		 TColStd_ListIteratorOfSetListOfSetOfReal ();
		%feature("autodoc", "Args:
	L(TColStd_SetListOfSetOfReal)

Returns:
	None

No detailed docstring for this function.") TColStd_ListIteratorOfSetListOfSetOfReal;
		 TColStd_ListIteratorOfSetListOfSetOfReal (const TColStd_SetListOfSetOfReal & L);
		%feature("autodoc", "Args:
	L(TColStd_SetListOfSetOfReal)

Returns:
	None

No detailed docstring for this function.") Initialize;
		void Initialize (const TColStd_SetListOfSetOfReal & L);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") More;
		Standard_Boolean More ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Next;
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


%feature("shadow") TColStd_ListIteratorOfSetListOfSetOfReal::~TColStd_ListIteratorOfSetListOfSetOfReal %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TColStd_ListIteratorOfSetListOfSetOfReal {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor TColStd_ListIteratorOfSetListOfSetOfTransient;
class TColStd_ListIteratorOfSetListOfSetOfTransient {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") TColStd_ListIteratorOfSetListOfSetOfTransient;
		 TColStd_ListIteratorOfSetListOfSetOfTransient ();
		%feature("autodoc", "Args:
	L(TColStd_SetListOfSetOfTransient)

Returns:
	None

No detailed docstring for this function.") TColStd_ListIteratorOfSetListOfSetOfTransient;
		 TColStd_ListIteratorOfSetListOfSetOfTransient (const TColStd_SetListOfSetOfTransient & L);
		%feature("autodoc", "Args:
	L(TColStd_SetListOfSetOfTransient)

Returns:
	None

No detailed docstring for this function.") Initialize;
		void Initialize (const TColStd_SetListOfSetOfTransient & L);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") More;
		Standard_Boolean More ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Next;
		void Next ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Standard_Transient

No detailed docstring for this function.") Value;
		Handle_Standard_Transient & Value ();
};


%feature("shadow") TColStd_ListIteratorOfSetListOfSetOfTransient::~TColStd_ListIteratorOfSetListOfSetOfTransient %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TColStd_ListIteratorOfSetListOfSetOfTransient {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor TColStd_ListNodeOfListOfAsciiString;
class TColStd_ListNodeOfListOfAsciiString : public TCollection_MapNode {
	public:
		%feature("autodoc", "Args:
	I(TCollection_AsciiString)
	n(TCollection_MapNodePtr)

Returns:
	None

No detailed docstring for this function.") TColStd_ListNodeOfListOfAsciiString;
		 TColStd_ListNodeOfListOfAsciiString (const TCollection_AsciiString & I,const TCollection_MapNodePtr & n);
		%feature("autodoc", "Args:
	None
Returns:
	TCollection_AsciiString

No detailed docstring for this function.") Value;
		TCollection_AsciiString & Value ();
};


%feature("shadow") TColStd_ListNodeOfListOfAsciiString::~TColStd_ListNodeOfListOfAsciiString %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TColStd_ListNodeOfListOfAsciiString {
	void _kill_pointed() {
		delete $self;
	}
};
%extend TColStd_ListNodeOfListOfAsciiString {
	Handle_TColStd_ListNodeOfListOfAsciiString GetHandle() {
	return *(Handle_TColStd_ListNodeOfListOfAsciiString*) &$self;
	}
};

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
    TColStd_ListNodeOfListOfAsciiString* GetObject() {
    return (TColStd_ListNodeOfListOfAsciiString*)$self->Access();
    }
};
%feature("shadow") Handle_TColStd_ListNodeOfListOfAsciiString::~Handle_TColStd_ListNodeOfListOfAsciiString %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_TColStd_ListNodeOfListOfAsciiString {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor TColStd_ListNodeOfListOfInteger;
class TColStd_ListNodeOfListOfInteger : public TCollection_MapNode {
	public:
		%feature("autodoc", "Args:
	I(Standard_Integer)
	n(TCollection_MapNodePtr)

Returns:
	None

No detailed docstring for this function.") TColStd_ListNodeOfListOfInteger;
		 TColStd_ListNodeOfListOfInteger (Standard_Integer &OutValue,const TCollection_MapNodePtr & n);

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


%feature("shadow") TColStd_ListNodeOfListOfInteger::~TColStd_ListNodeOfListOfInteger %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TColStd_ListNodeOfListOfInteger {
	void _kill_pointed() {
		delete $self;
	}
};
%extend TColStd_ListNodeOfListOfInteger {
	Handle_TColStd_ListNodeOfListOfInteger GetHandle() {
	return *(Handle_TColStd_ListNodeOfListOfInteger*) &$self;
	}
};

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
    TColStd_ListNodeOfListOfInteger* GetObject() {
    return (TColStd_ListNodeOfListOfInteger*)$self->Access();
    }
};
%feature("shadow") Handle_TColStd_ListNodeOfListOfInteger::~Handle_TColStd_ListNodeOfListOfInteger %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_TColStd_ListNodeOfListOfInteger {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor TColStd_ListNodeOfListOfReal;
class TColStd_ListNodeOfListOfReal : public TCollection_MapNode {
	public:
		%feature("autodoc", "Args:
	I(Standard_Real)
	n(TCollection_MapNodePtr)

Returns:
	None

No detailed docstring for this function.") TColStd_ListNodeOfListOfReal;
		 TColStd_ListNodeOfListOfReal (Standard_Real &OutValue,const TCollection_MapNodePtr & n);

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


%feature("shadow") TColStd_ListNodeOfListOfReal::~TColStd_ListNodeOfListOfReal %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TColStd_ListNodeOfListOfReal {
	void _kill_pointed() {
		delete $self;
	}
};
%extend TColStd_ListNodeOfListOfReal {
	Handle_TColStd_ListNodeOfListOfReal GetHandle() {
	return *(Handle_TColStd_ListNodeOfListOfReal*) &$self;
	}
};

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
    TColStd_ListNodeOfListOfReal* GetObject() {
    return (TColStd_ListNodeOfListOfReal*)$self->Access();
    }
};
%feature("shadow") Handle_TColStd_ListNodeOfListOfReal::~Handle_TColStd_ListNodeOfListOfReal %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_TColStd_ListNodeOfListOfReal {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor TColStd_ListNodeOfListOfTransient;
class TColStd_ListNodeOfListOfTransient : public TCollection_MapNode {
	public:
		%feature("autodoc", "Args:
	I(Handle_Standard_Transient)
	n(TCollection_MapNodePtr)

Returns:
	None

No detailed docstring for this function.") TColStd_ListNodeOfListOfTransient;
		 TColStd_ListNodeOfListOfTransient (const Handle_Standard_Transient & I,const TCollection_MapNodePtr & n);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Standard_Transient

No detailed docstring for this function.") Value;
		Handle_Standard_Transient & Value ();
};


%feature("shadow") TColStd_ListNodeOfListOfTransient::~TColStd_ListNodeOfListOfTransient %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TColStd_ListNodeOfListOfTransient {
	void _kill_pointed() {
		delete $self;
	}
};
%extend TColStd_ListNodeOfListOfTransient {
	Handle_TColStd_ListNodeOfListOfTransient GetHandle() {
	return *(Handle_TColStd_ListNodeOfListOfTransient*) &$self;
	}
};

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
    TColStd_ListNodeOfListOfTransient* GetObject() {
    return (TColStd_ListNodeOfListOfTransient*)$self->Access();
    }
};
%feature("shadow") Handle_TColStd_ListNodeOfListOfTransient::~Handle_TColStd_ListNodeOfListOfTransient %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_TColStd_ListNodeOfListOfTransient {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor TColStd_ListNodeOfSetListOfSetOfInteger;
class TColStd_ListNodeOfSetListOfSetOfInteger : public TCollection_MapNode {
	public:
		%feature("autodoc", "Args:
	I(Standard_Integer)
	n(TCollection_MapNodePtr)

Returns:
	None

No detailed docstring for this function.") TColStd_ListNodeOfSetListOfSetOfInteger;
		 TColStd_ListNodeOfSetListOfSetOfInteger (Standard_Integer &OutValue,const TCollection_MapNodePtr & n);

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


%feature("shadow") TColStd_ListNodeOfSetListOfSetOfInteger::~TColStd_ListNodeOfSetListOfSetOfInteger %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TColStd_ListNodeOfSetListOfSetOfInteger {
	void _kill_pointed() {
		delete $self;
	}
};
%extend TColStd_ListNodeOfSetListOfSetOfInteger {
	Handle_TColStd_ListNodeOfSetListOfSetOfInteger GetHandle() {
	return *(Handle_TColStd_ListNodeOfSetListOfSetOfInteger*) &$self;
	}
};

%nodefaultctor Handle_TColStd_ListNodeOfSetListOfSetOfInteger;
class Handle_TColStd_ListNodeOfSetListOfSetOfInteger : public Handle_TCollection_MapNode {

    public:
        // constructors
        Handle_TColStd_ListNodeOfSetListOfSetOfInteger();
        Handle_TColStd_ListNodeOfSetListOfSetOfInteger(const Handle_TColStd_ListNodeOfSetListOfSetOfInteger &aHandle);
        Handle_TColStd_ListNodeOfSetListOfSetOfInteger(const TColStd_ListNodeOfSetListOfSetOfInteger *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_TColStd_ListNodeOfSetListOfSetOfInteger DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_TColStd_ListNodeOfSetListOfSetOfInteger {
    TColStd_ListNodeOfSetListOfSetOfInteger* GetObject() {
    return (TColStd_ListNodeOfSetListOfSetOfInteger*)$self->Access();
    }
};
%feature("shadow") Handle_TColStd_ListNodeOfSetListOfSetOfInteger::~Handle_TColStd_ListNodeOfSetListOfSetOfInteger %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_TColStd_ListNodeOfSetListOfSetOfInteger {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor TColStd_ListNodeOfSetListOfSetOfReal;
class TColStd_ListNodeOfSetListOfSetOfReal : public TCollection_MapNode {
	public:
		%feature("autodoc", "Args:
	I(Standard_Real)
	n(TCollection_MapNodePtr)

Returns:
	None

No detailed docstring for this function.") TColStd_ListNodeOfSetListOfSetOfReal;
		 TColStd_ListNodeOfSetListOfSetOfReal (Standard_Real &OutValue,const TCollection_MapNodePtr & n);

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


%feature("shadow") TColStd_ListNodeOfSetListOfSetOfReal::~TColStd_ListNodeOfSetListOfSetOfReal %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TColStd_ListNodeOfSetListOfSetOfReal {
	void _kill_pointed() {
		delete $self;
	}
};
%extend TColStd_ListNodeOfSetListOfSetOfReal {
	Handle_TColStd_ListNodeOfSetListOfSetOfReal GetHandle() {
	return *(Handle_TColStd_ListNodeOfSetListOfSetOfReal*) &$self;
	}
};

%nodefaultctor Handle_TColStd_ListNodeOfSetListOfSetOfReal;
class Handle_TColStd_ListNodeOfSetListOfSetOfReal : public Handle_TCollection_MapNode {

    public:
        // constructors
        Handle_TColStd_ListNodeOfSetListOfSetOfReal();
        Handle_TColStd_ListNodeOfSetListOfSetOfReal(const Handle_TColStd_ListNodeOfSetListOfSetOfReal &aHandle);
        Handle_TColStd_ListNodeOfSetListOfSetOfReal(const TColStd_ListNodeOfSetListOfSetOfReal *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_TColStd_ListNodeOfSetListOfSetOfReal DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_TColStd_ListNodeOfSetListOfSetOfReal {
    TColStd_ListNodeOfSetListOfSetOfReal* GetObject() {
    return (TColStd_ListNodeOfSetListOfSetOfReal*)$self->Access();
    }
};
%feature("shadow") Handle_TColStd_ListNodeOfSetListOfSetOfReal::~Handle_TColStd_ListNodeOfSetListOfSetOfReal %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_TColStd_ListNodeOfSetListOfSetOfReal {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor TColStd_ListNodeOfSetListOfSetOfTransient;
class TColStd_ListNodeOfSetListOfSetOfTransient : public TCollection_MapNode {
	public:
		%feature("autodoc", "Args:
	I(Handle_Standard_Transient)
	n(TCollection_MapNodePtr)

Returns:
	None

No detailed docstring for this function.") TColStd_ListNodeOfSetListOfSetOfTransient;
		 TColStd_ListNodeOfSetListOfSetOfTransient (const Handle_Standard_Transient & I,const TCollection_MapNodePtr & n);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Standard_Transient

No detailed docstring for this function.") Value;
		Handle_Standard_Transient & Value ();
};


%feature("shadow") TColStd_ListNodeOfSetListOfSetOfTransient::~TColStd_ListNodeOfSetListOfSetOfTransient %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TColStd_ListNodeOfSetListOfSetOfTransient {
	void _kill_pointed() {
		delete $self;
	}
};
%extend TColStd_ListNodeOfSetListOfSetOfTransient {
	Handle_TColStd_ListNodeOfSetListOfSetOfTransient GetHandle() {
	return *(Handle_TColStd_ListNodeOfSetListOfSetOfTransient*) &$self;
	}
};

%nodefaultctor Handle_TColStd_ListNodeOfSetListOfSetOfTransient;
class Handle_TColStd_ListNodeOfSetListOfSetOfTransient : public Handle_TCollection_MapNode {

    public:
        // constructors
        Handle_TColStd_ListNodeOfSetListOfSetOfTransient();
        Handle_TColStd_ListNodeOfSetListOfSetOfTransient(const Handle_TColStd_ListNodeOfSetListOfSetOfTransient &aHandle);
        Handle_TColStd_ListNodeOfSetListOfSetOfTransient(const TColStd_ListNodeOfSetListOfSetOfTransient *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_TColStd_ListNodeOfSetListOfSetOfTransient DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_TColStd_ListNodeOfSetListOfSetOfTransient {
    TColStd_ListNodeOfSetListOfSetOfTransient* GetObject() {
    return (TColStd_ListNodeOfSetListOfSetOfTransient*)$self->Access();
    }
};
%feature("shadow") Handle_TColStd_ListNodeOfSetListOfSetOfTransient::~Handle_TColStd_ListNodeOfSetListOfSetOfTransient %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_TColStd_ListNodeOfSetListOfSetOfTransient {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor TColStd_ListOfAsciiString;
class TColStd_ListOfAsciiString {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") TColStd_ListOfAsciiString;
		 TColStd_ListOfAsciiString ();
		%feature("autodoc", "Args:
	Other(TColStd_ListOfAsciiString)

Returns:
	None

No detailed docstring for this function.") Assign;
		void Assign (const TColStd_ListOfAsciiString & Other);
		%feature("autodoc", "Args:
	Other(TColStd_ListOfAsciiString)

Returns:
	None

No detailed docstring for this function.") operator=;
		void operator = (const TColStd_ListOfAsciiString & Other);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Extent;
		Standard_Integer Extent ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsEmpty;
		Standard_Boolean IsEmpty ();
		%feature("autodoc", "Args:
	I(TCollection_AsciiString)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (const TCollection_AsciiString & I);
		%feature("autodoc", "Args:
	I(TCollection_AsciiString)
	theIt(TColStd_ListIteratorOfListOfAsciiString)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (const TCollection_AsciiString & I,TColStd_ListIteratorOfListOfAsciiString & theIt);
		%feature("autodoc", "Args:
	Other(TColStd_ListOfAsciiString)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (TColStd_ListOfAsciiString & Other);
		%feature("autodoc", "Args:
	I(TCollection_AsciiString)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (const TCollection_AsciiString & I);
		%feature("autodoc", "Args:
	I(TCollection_AsciiString)
	theIt(TColStd_ListIteratorOfListOfAsciiString)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (const TCollection_AsciiString & I,TColStd_ListIteratorOfListOfAsciiString & theIt);
		%feature("autodoc", "Args:
	Other(TColStd_ListOfAsciiString)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (TColStd_ListOfAsciiString & Other);
		%feature("autodoc", "Args:
	None
Returns:
	TCollection_AsciiString

No detailed docstring for this function.") First;
		TCollection_AsciiString & First ();
		%feature("autodoc", "Args:
	None
Returns:
	TCollection_AsciiString

No detailed docstring for this function.") Last;
		TCollection_AsciiString & Last ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") RemoveFirst;
		void RemoveFirst ();
		%feature("autodoc", "Args:
	It(TColStd_ListIteratorOfListOfAsciiString)

Returns:
	None

No detailed docstring for this function.") Remove;
		void Remove (TColStd_ListIteratorOfListOfAsciiString & It);
		%feature("autodoc", "Args:
	I(TCollection_AsciiString)
	It(TColStd_ListIteratorOfListOfAsciiString)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const TCollection_AsciiString & I,TColStd_ListIteratorOfListOfAsciiString & It);
		%feature("autodoc", "Args:
	Other(TColStd_ListOfAsciiString)
	It(TColStd_ListIteratorOfListOfAsciiString)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (TColStd_ListOfAsciiString & Other,TColStd_ListIteratorOfListOfAsciiString & It);
		%feature("autodoc", "Args:
	I(TCollection_AsciiString)
	It(TColStd_ListIteratorOfListOfAsciiString)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const TCollection_AsciiString & I,TColStd_ListIteratorOfListOfAsciiString & It);
		%feature("autodoc", "Args:
	Other(TColStd_ListOfAsciiString)
	It(TColStd_ListIteratorOfListOfAsciiString)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (TColStd_ListOfAsciiString & Other,TColStd_ListIteratorOfListOfAsciiString & It);
};


%feature("shadow") TColStd_ListOfAsciiString::~TColStd_ListOfAsciiString %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TColStd_ListOfAsciiString {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor TColStd_ListOfInteger;
class TColStd_ListOfInteger {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") TColStd_ListOfInteger;
		 TColStd_ListOfInteger ();
		%feature("autodoc", "Args:
	Other(TColStd_ListOfInteger)

Returns:
	None

No detailed docstring for this function.") Assign;
		void Assign (const TColStd_ListOfInteger & Other);
		%feature("autodoc", "Args:
	Other(TColStd_ListOfInteger)

Returns:
	None

No detailed docstring for this function.") operator=;
		void operator = (const TColStd_ListOfInteger & Other);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Extent;
		Standard_Integer Extent ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsEmpty;
		Standard_Boolean IsEmpty ();
		%feature("autodoc", "Args:
	I(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (Standard_Integer &OutValue);
		%feature("autodoc", "Args:
	I(Standard_Integer)
	theIt(TColStd_ListIteratorOfListOfInteger)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (Standard_Integer &OutValue,TColStd_ListIteratorOfListOfInteger & theIt);
		%feature("autodoc", "Args:
	Other(TColStd_ListOfInteger)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (TColStd_ListOfInteger & Other);
		%feature("autodoc", "Args:
	I(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (Standard_Integer &OutValue);
		%feature("autodoc", "Args:
	I(Standard_Integer)
	theIt(TColStd_ListIteratorOfListOfInteger)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (Standard_Integer &OutValue,TColStd_ListIteratorOfListOfInteger & theIt);
		%feature("autodoc", "Args:
	Other(TColStd_ListOfInteger)

Returns:
	None

No detailed docstring for this function.") Append;
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
            		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") RemoveFirst;
		void RemoveFirst ();
		%feature("autodoc", "Args:
	It(TColStd_ListIteratorOfListOfInteger)

Returns:
	None

No detailed docstring for this function.") Remove;
		void Remove (TColStd_ListIteratorOfListOfInteger & It);
		%feature("autodoc", "Args:
	I(Standard_Integer)
	It(TColStd_ListIteratorOfListOfInteger)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (Standard_Integer &OutValue,TColStd_ListIteratorOfListOfInteger & It);
		%feature("autodoc", "Args:
	Other(TColStd_ListOfInteger)
	It(TColStd_ListIteratorOfListOfInteger)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (TColStd_ListOfInteger & Other,TColStd_ListIteratorOfListOfInteger & It);
		%feature("autodoc", "Args:
	I(Standard_Integer)
	It(TColStd_ListIteratorOfListOfInteger)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (Standard_Integer &OutValue,TColStd_ListIteratorOfListOfInteger & It);
		%feature("autodoc", "Args:
	Other(TColStd_ListOfInteger)
	It(TColStd_ListIteratorOfListOfInteger)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (TColStd_ListOfInteger & Other,TColStd_ListIteratorOfListOfInteger & It);
};


%feature("shadow") TColStd_ListOfInteger::~TColStd_ListOfInteger %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TColStd_ListOfInteger {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor TColStd_ListOfReal;
class TColStd_ListOfReal {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") TColStd_ListOfReal;
		 TColStd_ListOfReal ();
		%feature("autodoc", "Args:
	Other(TColStd_ListOfReal)

Returns:
	None

No detailed docstring for this function.") Assign;
		void Assign (const TColStd_ListOfReal & Other);
		%feature("autodoc", "Args:
	Other(TColStd_ListOfReal)

Returns:
	None

No detailed docstring for this function.") operator=;
		void operator = (const TColStd_ListOfReal & Other);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Extent;
		Standard_Integer Extent ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsEmpty;
		Standard_Boolean IsEmpty ();
		%feature("autodoc", "Args:
	I(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (Standard_Real &OutValue);
		%feature("autodoc", "Args:
	I(Standard_Real)
	theIt(TColStd_ListIteratorOfListOfReal)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (Standard_Real &OutValue,TColStd_ListIteratorOfListOfReal & theIt);
		%feature("autodoc", "Args:
	Other(TColStd_ListOfReal)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (TColStd_ListOfReal & Other);
		%feature("autodoc", "Args:
	I(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (Standard_Real &OutValue);
		%feature("autodoc", "Args:
	I(Standard_Real)
	theIt(TColStd_ListIteratorOfListOfReal)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (Standard_Real &OutValue,TColStd_ListIteratorOfListOfReal & theIt);
		%feature("autodoc", "Args:
	Other(TColStd_ListOfReal)

Returns:
	None

No detailed docstring for this function.") Append;
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
            		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") RemoveFirst;
		void RemoveFirst ();
		%feature("autodoc", "Args:
	It(TColStd_ListIteratorOfListOfReal)

Returns:
	None

No detailed docstring for this function.") Remove;
		void Remove (TColStd_ListIteratorOfListOfReal & It);
		%feature("autodoc", "Args:
	I(Standard_Real)
	It(TColStd_ListIteratorOfListOfReal)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (Standard_Real &OutValue,TColStd_ListIteratorOfListOfReal & It);
		%feature("autodoc", "Args:
	Other(TColStd_ListOfReal)
	It(TColStd_ListIteratorOfListOfReal)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (TColStd_ListOfReal & Other,TColStd_ListIteratorOfListOfReal & It);
		%feature("autodoc", "Args:
	I(Standard_Real)
	It(TColStd_ListIteratorOfListOfReal)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (Standard_Real &OutValue,TColStd_ListIteratorOfListOfReal & It);
		%feature("autodoc", "Args:
	Other(TColStd_ListOfReal)
	It(TColStd_ListIteratorOfListOfReal)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (TColStd_ListOfReal & Other,TColStd_ListIteratorOfListOfReal & It);
};


%feature("shadow") TColStd_ListOfReal::~TColStd_ListOfReal %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TColStd_ListOfReal {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor TColStd_ListOfTransient;
class TColStd_ListOfTransient {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") TColStd_ListOfTransient;
		 TColStd_ListOfTransient ();
		%feature("autodoc", "Args:
	Other(TColStd_ListOfTransient)

Returns:
	None

No detailed docstring for this function.") Assign;
		void Assign (const TColStd_ListOfTransient & Other);
		%feature("autodoc", "Args:
	Other(TColStd_ListOfTransient)

Returns:
	None

No detailed docstring for this function.") operator=;
		void operator = (const TColStd_ListOfTransient & Other);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Extent;
		Standard_Integer Extent ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsEmpty;
		Standard_Boolean IsEmpty ();
		%feature("autodoc", "Args:
	I(Handle_Standard_Transient)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (const Handle_Standard_Transient & I);
		%feature("autodoc", "Args:
	I(Handle_Standard_Transient)
	theIt(TColStd_ListIteratorOfListOfTransient)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (const Handle_Standard_Transient & I,TColStd_ListIteratorOfListOfTransient & theIt);
		%feature("autodoc", "Args:
	Other(TColStd_ListOfTransient)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (TColStd_ListOfTransient & Other);
		%feature("autodoc", "Args:
	I(Handle_Standard_Transient)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (const Handle_Standard_Transient & I);
		%feature("autodoc", "Args:
	I(Handle_Standard_Transient)
	theIt(TColStd_ListIteratorOfListOfTransient)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (const Handle_Standard_Transient & I,TColStd_ListIteratorOfListOfTransient & theIt);
		%feature("autodoc", "Args:
	Other(TColStd_ListOfTransient)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (TColStd_ListOfTransient & Other);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Standard_Transient

No detailed docstring for this function.") First;
		Handle_Standard_Transient & First ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Standard_Transient

No detailed docstring for this function.") Last;
		Handle_Standard_Transient & Last ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") RemoveFirst;
		void RemoveFirst ();
		%feature("autodoc", "Args:
	It(TColStd_ListIteratorOfListOfTransient)

Returns:
	None

No detailed docstring for this function.") Remove;
		void Remove (TColStd_ListIteratorOfListOfTransient & It);
		%feature("autodoc", "Args:
	I(Handle_Standard_Transient)
	It(TColStd_ListIteratorOfListOfTransient)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Handle_Standard_Transient & I,TColStd_ListIteratorOfListOfTransient & It);
		%feature("autodoc", "Args:
	Other(TColStd_ListOfTransient)
	It(TColStd_ListIteratorOfListOfTransient)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (TColStd_ListOfTransient & Other,TColStd_ListIteratorOfListOfTransient & It);
		%feature("autodoc", "Args:
	I(Handle_Standard_Transient)
	It(TColStd_ListIteratorOfListOfTransient)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Handle_Standard_Transient & I,TColStd_ListIteratorOfListOfTransient & It);
		%feature("autodoc", "Args:
	Other(TColStd_ListOfTransient)
	It(TColStd_ListIteratorOfListOfTransient)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (TColStd_ListOfTransient & Other,TColStd_ListIteratorOfListOfTransient & It);
};


%feature("shadow") TColStd_ListOfTransient::~TColStd_ListOfTransient %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TColStd_ListOfTransient {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor TColStd_MapIntegerHasher;
class TColStd_MapIntegerHasher {
	public:
		%feature("autodoc", "Args:
	K(Standard_Integer)
	Upper(Standard_Integer)

Returns:
	static Standard_Integer

No detailed docstring for this function.") HashCode;
		static Standard_Integer HashCode (Standard_Integer &OutValue,const Standard_Integer Upper);
		%feature("autodoc", "Args:
	K1(Standard_Integer)
	K2(Standard_Integer)

Returns:
	static Standard_Boolean

No detailed docstring for this function.") IsEqual;
		static Standard_Boolean IsEqual (Standard_Integer &OutValue,Standard_Integer &OutValue);
};


%feature("shadow") TColStd_MapIntegerHasher::~TColStd_MapIntegerHasher %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TColStd_MapIntegerHasher {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor TColStd_MapIteratorOfMapOfAsciiString;
class TColStd_MapIteratorOfMapOfAsciiString : public TCollection_BasicMapIterator {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") TColStd_MapIteratorOfMapOfAsciiString;
		 TColStd_MapIteratorOfMapOfAsciiString ();
		%feature("autodoc", "Args:
	aMap(TColStd_MapOfAsciiString)

Returns:
	None

No detailed docstring for this function.") TColStd_MapIteratorOfMapOfAsciiString;
		 TColStd_MapIteratorOfMapOfAsciiString (const TColStd_MapOfAsciiString & aMap);
		%feature("autodoc", "Args:
	aMap(TColStd_MapOfAsciiString)

Returns:
	None

No detailed docstring for this function.") Initialize;
		void Initialize (const TColStd_MapOfAsciiString & aMap);
		%feature("autodoc", "Args:
	None
Returns:
	TCollection_AsciiString

No detailed docstring for this function.") Key;
		const TCollection_AsciiString & Key ();
};


%feature("shadow") TColStd_MapIteratorOfMapOfAsciiString::~TColStd_MapIteratorOfMapOfAsciiString %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TColStd_MapIteratorOfMapOfAsciiString {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor TColStd_MapIteratorOfMapOfInteger;
class TColStd_MapIteratorOfMapOfInteger : public TCollection_BasicMapIterator {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") TColStd_MapIteratorOfMapOfInteger;
		 TColStd_MapIteratorOfMapOfInteger ();
		%feature("autodoc", "Args:
	aMap(TColStd_MapOfInteger)

Returns:
	None

No detailed docstring for this function.") TColStd_MapIteratorOfMapOfInteger;
		 TColStd_MapIteratorOfMapOfInteger (const TColStd_MapOfInteger & aMap);
		%feature("autodoc", "Args:
	aMap(TColStd_MapOfInteger)

Returns:
	None

No detailed docstring for this function.") Initialize;
		void Initialize (const TColStd_MapOfInteger & aMap);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Key;
		const Standard_Integer & Key ();
};


%feature("shadow") TColStd_MapIteratorOfMapOfInteger::~TColStd_MapIteratorOfMapOfInteger %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TColStd_MapIteratorOfMapOfInteger {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor TColStd_MapIteratorOfMapOfReal;
class TColStd_MapIteratorOfMapOfReal : public TCollection_BasicMapIterator {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") TColStd_MapIteratorOfMapOfReal;
		 TColStd_MapIteratorOfMapOfReal ();
		%feature("autodoc", "Args:
	aMap(TColStd_MapOfReal)

Returns:
	None

No detailed docstring for this function.") TColStd_MapIteratorOfMapOfReal;
		 TColStd_MapIteratorOfMapOfReal (const TColStd_MapOfReal & aMap);
		%feature("autodoc", "Args:
	aMap(TColStd_MapOfReal)

Returns:
	None

No detailed docstring for this function.") Initialize;
		void Initialize (const TColStd_MapOfReal & aMap);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

No detailed docstring for this function.") Key;
		const Standard_Real & Key ();
};


%feature("shadow") TColStd_MapIteratorOfMapOfReal::~TColStd_MapIteratorOfMapOfReal %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TColStd_MapIteratorOfMapOfReal {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor TColStd_MapIteratorOfMapOfTransient;
class TColStd_MapIteratorOfMapOfTransient : public TCollection_BasicMapIterator {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") TColStd_MapIteratorOfMapOfTransient;
		 TColStd_MapIteratorOfMapOfTransient ();
		%feature("autodoc", "Args:
	aMap(TColStd_MapOfTransient)

Returns:
	None

No detailed docstring for this function.") TColStd_MapIteratorOfMapOfTransient;
		 TColStd_MapIteratorOfMapOfTransient (const TColStd_MapOfTransient & aMap);
		%feature("autodoc", "Args:
	aMap(TColStd_MapOfTransient)

Returns:
	None

No detailed docstring for this function.") Initialize;
		void Initialize (const TColStd_MapOfTransient & aMap);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Standard_Transient

No detailed docstring for this function.") Key;
		const Handle_Standard_Transient & Key ();
};


%feature("shadow") TColStd_MapIteratorOfMapOfTransient::~TColStd_MapIteratorOfMapOfTransient %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TColStd_MapIteratorOfMapOfTransient {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor TColStd_MapIteratorOfPackedMapOfInteger;
class TColStd_MapIteratorOfPackedMapOfInteger : public TCollection_BasicMapIterator {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

/// Empty Constructor.") TColStd_MapIteratorOfPackedMapOfInteger;
		 TColStd_MapIteratorOfPackedMapOfInteger ();
		%feature("autodoc", "Args:
	&(TColStd_PackedMapOfInteger)

Returns:
	None

/// Constructor.") TColStd_MapIteratorOfPackedMapOfInteger;
		 TColStd_MapIteratorOfPackedMapOfInteger (const TColStd_PackedMapOfInteger &);
		%feature("autodoc", "Args:
	&(TColStd_PackedMapOfInteger)

Returns:
	None

/// Re-initialize with the same or another Map instance.") Initialize;
		void Initialize (const TColStd_PackedMapOfInteger &);
		%feature("autodoc", "Args:
	None
Returns:
	None

/// Restart the iteraton") Reset;
		void Reset ();
		%feature("autodoc", "Args:
	None
Returns:
	inline Standard_Integer

/// Query the iterated key. Defined in TColStd_PackedMapOfInteger.cxx") Key;
		inline Standard_Integer Key ();
		%feature("autodoc", "Args:
	None
Returns:
	None

/// Increment the iterator") Next;
		void Next ();
};


%feature("shadow") TColStd_MapIteratorOfPackedMapOfInteger::~TColStd_MapIteratorOfPackedMapOfInteger %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TColStd_MapIteratorOfPackedMapOfInteger {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor TColStd_MapOfAsciiString;
class TColStd_MapOfAsciiString : public TCollection_BasicMap {
	public:
		%feature("autodoc", "Args:
	NbBuckets(Standard_Integer)=1

Returns:
	None

No detailed docstring for this function.") TColStd_MapOfAsciiString;
		 TColStd_MapOfAsciiString (const Standard_Integer NbBuckets = 1);
		%feature("autodoc", "Args:
	Other(TColStd_MapOfAsciiString)

Returns:
	TColStd_MapOfAsciiString

No detailed docstring for this function.") Assign;
		TColStd_MapOfAsciiString & Assign (const TColStd_MapOfAsciiString & Other);
		%feature("autodoc", "Args:
	Other(TColStd_MapOfAsciiString)

Returns:
	TColStd_MapOfAsciiString

No detailed docstring for this function.") operator=;
		TColStd_MapOfAsciiString & operator = (const TColStd_MapOfAsciiString & Other);
		%feature("autodoc", "Args:
	NbBuckets(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") ReSize;
		void ReSize (const Standard_Integer NbBuckets);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	aKey(TCollection_AsciiString)

Returns:
	Standard_Boolean

No detailed docstring for this function.") Add;
		Standard_Boolean Add (const TCollection_AsciiString & aKey);
		%feature("autodoc", "Args:
	aKey(TCollection_AsciiString)

Returns:
	Standard_Boolean

No detailed docstring for this function.") Contains;
		Standard_Boolean Contains (const TCollection_AsciiString & aKey);
		%feature("autodoc", "Args:
	aKey(TCollection_AsciiString)

Returns:
	Standard_Boolean

No detailed docstring for this function.") Remove;
		Standard_Boolean Remove (const TCollection_AsciiString & aKey);
};


%feature("shadow") TColStd_MapOfAsciiString::~TColStd_MapOfAsciiString %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TColStd_MapOfAsciiString {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor TColStd_MapOfInteger;
class TColStd_MapOfInteger : public TCollection_BasicMap {
	public:
		%feature("autodoc", "Args:
	NbBuckets(Standard_Integer)=1

Returns:
	None

No detailed docstring for this function.") TColStd_MapOfInteger;
		 TColStd_MapOfInteger (const Standard_Integer NbBuckets = 1);
		%feature("autodoc", "Args:
	Other(TColStd_MapOfInteger)

Returns:
	TColStd_MapOfInteger

No detailed docstring for this function.") Assign;
		TColStd_MapOfInteger & Assign (const TColStd_MapOfInteger & Other);
		%feature("autodoc", "Args:
	Other(TColStd_MapOfInteger)

Returns:
	TColStd_MapOfInteger

No detailed docstring for this function.") operator=;
		TColStd_MapOfInteger & operator = (const TColStd_MapOfInteger & Other);
		%feature("autodoc", "Args:
	NbBuckets(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") ReSize;
		void ReSize (const Standard_Integer NbBuckets);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	aKey(Standard_Integer)

Returns:
	Standard_Boolean

No detailed docstring for this function.") Add;
		Standard_Boolean Add (Standard_Integer &OutValue);
		%feature("autodoc", "Args:
	aKey(Standard_Integer)

Returns:
	Standard_Boolean

No detailed docstring for this function.") Contains;
		Standard_Boolean Contains (Standard_Integer &OutValue);
		%feature("autodoc", "Args:
	aKey(Standard_Integer)

Returns:
	Standard_Boolean

No detailed docstring for this function.") Remove;
		Standard_Boolean Remove (Standard_Integer &OutValue);
};


%feature("shadow") TColStd_MapOfInteger::~TColStd_MapOfInteger %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TColStd_MapOfInteger {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor TColStd_MapOfReal;
class TColStd_MapOfReal : public TCollection_BasicMap {
	public:
		%feature("autodoc", "Args:
	NbBuckets(Standard_Integer)=1

Returns:
	None

No detailed docstring for this function.") TColStd_MapOfReal;
		 TColStd_MapOfReal (const Standard_Integer NbBuckets = 1);
		%feature("autodoc", "Args:
	Other(TColStd_MapOfReal)

Returns:
	TColStd_MapOfReal

No detailed docstring for this function.") Assign;
		TColStd_MapOfReal & Assign (const TColStd_MapOfReal & Other);
		%feature("autodoc", "Args:
	Other(TColStd_MapOfReal)

Returns:
	TColStd_MapOfReal

No detailed docstring for this function.") operator=;
		TColStd_MapOfReal & operator = (const TColStd_MapOfReal & Other);
		%feature("autodoc", "Args:
	NbBuckets(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") ReSize;
		void ReSize (const Standard_Integer NbBuckets);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	aKey(Standard_Real)

Returns:
	Standard_Boolean

No detailed docstring for this function.") Add;
		Standard_Boolean Add (Standard_Real &OutValue);
		%feature("autodoc", "Args:
	aKey(Standard_Real)

Returns:
	Standard_Boolean

No detailed docstring for this function.") Contains;
		Standard_Boolean Contains (Standard_Real &OutValue);
		%feature("autodoc", "Args:
	aKey(Standard_Real)

Returns:
	Standard_Boolean

No detailed docstring for this function.") Remove;
		Standard_Boolean Remove (Standard_Real &OutValue);
};


%feature("shadow") TColStd_MapOfReal::~TColStd_MapOfReal %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TColStd_MapOfReal {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor TColStd_MapOfTransient;
class TColStd_MapOfTransient : public TCollection_BasicMap {
	public:
		%feature("autodoc", "Args:
	NbBuckets(Standard_Integer)=1

Returns:
	None

No detailed docstring for this function.") TColStd_MapOfTransient;
		 TColStd_MapOfTransient (const Standard_Integer NbBuckets = 1);
		%feature("autodoc", "Args:
	Other(TColStd_MapOfTransient)

Returns:
	TColStd_MapOfTransient

No detailed docstring for this function.") Assign;
		TColStd_MapOfTransient & Assign (const TColStd_MapOfTransient & Other);
		%feature("autodoc", "Args:
	Other(TColStd_MapOfTransient)

Returns:
	TColStd_MapOfTransient

No detailed docstring for this function.") operator=;
		TColStd_MapOfTransient & operator = (const TColStd_MapOfTransient & Other);
		%feature("autodoc", "Args:
	NbBuckets(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") ReSize;
		void ReSize (const Standard_Integer NbBuckets);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	aKey(Handle_Standard_Transient)

Returns:
	Standard_Boolean

No detailed docstring for this function.") Add;
		Standard_Boolean Add (const Handle_Standard_Transient & aKey);
		%feature("autodoc", "Args:
	aKey(Handle_Standard_Transient)

Returns:
	Standard_Boolean

No detailed docstring for this function.") Contains;
		Standard_Boolean Contains (const Handle_Standard_Transient & aKey);
		%feature("autodoc", "Args:
	aKey(Handle_Standard_Transient)

Returns:
	Standard_Boolean

No detailed docstring for this function.") Remove;
		Standard_Boolean Remove (const Handle_Standard_Transient & aKey);
};


%feature("shadow") TColStd_MapOfTransient::~TColStd_MapOfTransient %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TColStd_MapOfTransient {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor TColStd_MapRealHasher;
class TColStd_MapRealHasher {
	public:
		%feature("autodoc", "Args:
	K(Standard_Real)
	Upper(Standard_Integer)

Returns:
	static Standard_Integer

No detailed docstring for this function.") HashCode;
		static Standard_Integer HashCode (Standard_Real &OutValue,const Standard_Integer Upper);
		%feature("autodoc", "Args:
	K1(Standard_Real)
	K2(Standard_Real)

Returns:
	static Standard_Boolean

No detailed docstring for this function.") IsEqual;
		static Standard_Boolean IsEqual (Standard_Real &OutValue,Standard_Real &OutValue);
};


%feature("shadow") TColStd_MapRealHasher::~TColStd_MapRealHasher %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TColStd_MapRealHasher {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor TColStd_MapTransientHasher;
class TColStd_MapTransientHasher {
	public:
		%feature("autodoc", "Args:
	K(Handle_Standard_Transient)
	Upper(Standard_Integer)

Returns:
	static Standard_Integer

No detailed docstring for this function.") HashCode;
		static Standard_Integer HashCode (const Handle_Standard_Transient & K,const Standard_Integer Upper);
		%feature("autodoc", "Args:
	K1(Handle_Standard_Transient)
	K2(Handle_Standard_Transient)

Returns:
	static Standard_Boolean

No detailed docstring for this function.") IsEqual;
		static Standard_Boolean IsEqual (const Handle_Standard_Transient & K1,const Handle_Standard_Transient & K2);
};


%feature("shadow") TColStd_MapTransientHasher::~TColStd_MapTransientHasher %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TColStd_MapTransientHasher {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor TColStd_QueueNodeOfQueueOfInteger;
class TColStd_QueueNodeOfQueueOfInteger : public TCollection_MapNode {
	public:
		%feature("autodoc", "Args:
	I(Standard_Integer)
	n(TCollection_MapNodePtr)

Returns:
	None

No detailed docstring for this function.") TColStd_QueueNodeOfQueueOfInteger;
		 TColStd_QueueNodeOfQueueOfInteger (Standard_Integer &OutValue,const TCollection_MapNodePtr & n);

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


%feature("shadow") TColStd_QueueNodeOfQueueOfInteger::~TColStd_QueueNodeOfQueueOfInteger %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TColStd_QueueNodeOfQueueOfInteger {
	void _kill_pointed() {
		delete $self;
	}
};
%extend TColStd_QueueNodeOfQueueOfInteger {
	Handle_TColStd_QueueNodeOfQueueOfInteger GetHandle() {
	return *(Handle_TColStd_QueueNodeOfQueueOfInteger*) &$self;
	}
};

%nodefaultctor Handle_TColStd_QueueNodeOfQueueOfInteger;
class Handle_TColStd_QueueNodeOfQueueOfInteger : public Handle_TCollection_MapNode {

    public:
        // constructors
        Handle_TColStd_QueueNodeOfQueueOfInteger();
        Handle_TColStd_QueueNodeOfQueueOfInteger(const Handle_TColStd_QueueNodeOfQueueOfInteger &aHandle);
        Handle_TColStd_QueueNodeOfQueueOfInteger(const TColStd_QueueNodeOfQueueOfInteger *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_TColStd_QueueNodeOfQueueOfInteger DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_TColStd_QueueNodeOfQueueOfInteger {
    TColStd_QueueNodeOfQueueOfInteger* GetObject() {
    return (TColStd_QueueNodeOfQueueOfInteger*)$self->Access();
    }
};
%feature("shadow") Handle_TColStd_QueueNodeOfQueueOfInteger::~Handle_TColStd_QueueNodeOfQueueOfInteger %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_TColStd_QueueNodeOfQueueOfInteger {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor TColStd_QueueNodeOfQueueOfReal;
class TColStd_QueueNodeOfQueueOfReal : public TCollection_MapNode {
	public:
		%feature("autodoc", "Args:
	I(Standard_Real)
	n(TCollection_MapNodePtr)

Returns:
	None

No detailed docstring for this function.") TColStd_QueueNodeOfQueueOfReal;
		 TColStd_QueueNodeOfQueueOfReal (Standard_Real &OutValue,const TCollection_MapNodePtr & n);

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


%feature("shadow") TColStd_QueueNodeOfQueueOfReal::~TColStd_QueueNodeOfQueueOfReal %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TColStd_QueueNodeOfQueueOfReal {
	void _kill_pointed() {
		delete $self;
	}
};
%extend TColStd_QueueNodeOfQueueOfReal {
	Handle_TColStd_QueueNodeOfQueueOfReal GetHandle() {
	return *(Handle_TColStd_QueueNodeOfQueueOfReal*) &$self;
	}
};

%nodefaultctor Handle_TColStd_QueueNodeOfQueueOfReal;
class Handle_TColStd_QueueNodeOfQueueOfReal : public Handle_TCollection_MapNode {

    public:
        // constructors
        Handle_TColStd_QueueNodeOfQueueOfReal();
        Handle_TColStd_QueueNodeOfQueueOfReal(const Handle_TColStd_QueueNodeOfQueueOfReal &aHandle);
        Handle_TColStd_QueueNodeOfQueueOfReal(const TColStd_QueueNodeOfQueueOfReal *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_TColStd_QueueNodeOfQueueOfReal DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_TColStd_QueueNodeOfQueueOfReal {
    TColStd_QueueNodeOfQueueOfReal* GetObject() {
    return (TColStd_QueueNodeOfQueueOfReal*)$self->Access();
    }
};
%feature("shadow") Handle_TColStd_QueueNodeOfQueueOfReal::~Handle_TColStd_QueueNodeOfQueueOfReal %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_TColStd_QueueNodeOfQueueOfReal {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor TColStd_QueueNodeOfQueueOfTransient;
class TColStd_QueueNodeOfQueueOfTransient : public TCollection_MapNode {
	public:
		%feature("autodoc", "Args:
	I(Handle_Standard_Transient)
	n(TCollection_MapNodePtr)

Returns:
	None

No detailed docstring for this function.") TColStd_QueueNodeOfQueueOfTransient;
		 TColStd_QueueNodeOfQueueOfTransient (const Handle_Standard_Transient & I,const TCollection_MapNodePtr & n);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Standard_Transient

No detailed docstring for this function.") Value;
		Handle_Standard_Transient & Value ();
};


%feature("shadow") TColStd_QueueNodeOfQueueOfTransient::~TColStd_QueueNodeOfQueueOfTransient %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TColStd_QueueNodeOfQueueOfTransient {
	void _kill_pointed() {
		delete $self;
	}
};
%extend TColStd_QueueNodeOfQueueOfTransient {
	Handle_TColStd_QueueNodeOfQueueOfTransient GetHandle() {
	return *(Handle_TColStd_QueueNodeOfQueueOfTransient*) &$self;
	}
};

%nodefaultctor Handle_TColStd_QueueNodeOfQueueOfTransient;
class Handle_TColStd_QueueNodeOfQueueOfTransient : public Handle_TCollection_MapNode {

    public:
        // constructors
        Handle_TColStd_QueueNodeOfQueueOfTransient();
        Handle_TColStd_QueueNodeOfQueueOfTransient(const Handle_TColStd_QueueNodeOfQueueOfTransient &aHandle);
        Handle_TColStd_QueueNodeOfQueueOfTransient(const TColStd_QueueNodeOfQueueOfTransient *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_TColStd_QueueNodeOfQueueOfTransient DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_TColStd_QueueNodeOfQueueOfTransient {
    TColStd_QueueNodeOfQueueOfTransient* GetObject() {
    return (TColStd_QueueNodeOfQueueOfTransient*)$self->Access();
    }
};
%feature("shadow") Handle_TColStd_QueueNodeOfQueueOfTransient::~Handle_TColStd_QueueNodeOfQueueOfTransient %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_TColStd_QueueNodeOfQueueOfTransient {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor TColStd_QueueOfInteger;
class TColStd_QueueOfInteger {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") TColStd_QueueOfInteger;
		 TColStd_QueueOfInteger ();
		%feature("autodoc", "Args:
	Other(TColStd_QueueOfInteger)

Returns:
	TColStd_QueueOfInteger

No detailed docstring for this function.") Assign;
		const TColStd_QueueOfInteger & Assign (const TColStd_QueueOfInteger & Other);
		%feature("autodoc", "Args:
	Other(TColStd_QueueOfInteger)

Returns:
	TColStd_QueueOfInteger

No detailed docstring for this function.") operator=;
		const TColStd_QueueOfInteger & operator = (const TColStd_QueueOfInteger & Other);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Length;
		Standard_Integer Length ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsEmpty;
		Standard_Boolean IsEmpty ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Front;
		const Standard_Integer & Front ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	T(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Push;
		void Push (Standard_Integer &OutValue);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Pop;
		void Pop ();

            %feature("autodoc","1");
            %extend {
                Standard_Integer GetChangeFront() {
                return (Standard_Integer) $self->ChangeFront();
                }
            };
            %feature("autodoc","1");
            %extend {
                void SetChangeFront(Standard_Integer value ) {
                $self->ChangeFront()=value;
                }
            };
            };


%feature("shadow") TColStd_QueueOfInteger::~TColStd_QueueOfInteger %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TColStd_QueueOfInteger {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor TColStd_QueueOfReal;
class TColStd_QueueOfReal {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") TColStd_QueueOfReal;
		 TColStd_QueueOfReal ();
		%feature("autodoc", "Args:
	Other(TColStd_QueueOfReal)

Returns:
	TColStd_QueueOfReal

No detailed docstring for this function.") Assign;
		const TColStd_QueueOfReal & Assign (const TColStd_QueueOfReal & Other);
		%feature("autodoc", "Args:
	Other(TColStd_QueueOfReal)

Returns:
	TColStd_QueueOfReal

No detailed docstring for this function.") operator=;
		const TColStd_QueueOfReal & operator = (const TColStd_QueueOfReal & Other);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Length;
		Standard_Integer Length ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsEmpty;
		Standard_Boolean IsEmpty ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

No detailed docstring for this function.") Front;
		const Standard_Real & Front ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	T(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Push;
		void Push (Standard_Real &OutValue);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Pop;
		void Pop ();

            %feature("autodoc","1");
            %extend {
                Standard_Real GetChangeFront() {
                return (Standard_Real) $self->ChangeFront();
                }
            };
            %feature("autodoc","1");
            %extend {
                void SetChangeFront(Standard_Real value ) {
                $self->ChangeFront()=value;
                }
            };
            };


%feature("shadow") TColStd_QueueOfReal::~TColStd_QueueOfReal %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TColStd_QueueOfReal {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor TColStd_QueueOfTransient;
class TColStd_QueueOfTransient {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") TColStd_QueueOfTransient;
		 TColStd_QueueOfTransient ();
		%feature("autodoc", "Args:
	Other(TColStd_QueueOfTransient)

Returns:
	TColStd_QueueOfTransient

No detailed docstring for this function.") Assign;
		const TColStd_QueueOfTransient & Assign (const TColStd_QueueOfTransient & Other);
		%feature("autodoc", "Args:
	Other(TColStd_QueueOfTransient)

Returns:
	TColStd_QueueOfTransient

No detailed docstring for this function.") operator=;
		const TColStd_QueueOfTransient & operator = (const TColStd_QueueOfTransient & Other);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Length;
		Standard_Integer Length ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsEmpty;
		Standard_Boolean IsEmpty ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Standard_Transient

No detailed docstring for this function.") Front;
		const Handle_Standard_Transient & Front ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	T(Handle_Standard_Transient)

Returns:
	None

No detailed docstring for this function.") Push;
		void Push (const Handle_Standard_Transient & T);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Pop;
		void Pop ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Standard_Transient

No detailed docstring for this function.") ChangeFront;
		Handle_Standard_Transient & ChangeFront ();
};


%feature("shadow") TColStd_QueueOfTransient::~TColStd_QueueOfTransient %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TColStd_QueueOfTransient {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor TColStd_SequenceNodeOfSequenceOfAddress;
class TColStd_SequenceNodeOfSequenceOfAddress : public TCollection_SeqNode {
	public:
		%feature("autodoc", "Args:
	I(Standard_Address)
	n(TCollection_SeqNodePtr)
	p(TCollection_SeqNodePtr)

Returns:
	None

No detailed docstring for this function.") TColStd_SequenceNodeOfSequenceOfAddress;
		 TColStd_SequenceNodeOfSequenceOfAddress (const Standard_Address & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Address

No detailed docstring for this function.") Value;
		Standard_Address & Value ();
};


%feature("shadow") TColStd_SequenceNodeOfSequenceOfAddress::~TColStd_SequenceNodeOfSequenceOfAddress %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TColStd_SequenceNodeOfSequenceOfAddress {
	void _kill_pointed() {
		delete $self;
	}
};
%extend TColStd_SequenceNodeOfSequenceOfAddress {
	Handle_TColStd_SequenceNodeOfSequenceOfAddress GetHandle() {
	return *(Handle_TColStd_SequenceNodeOfSequenceOfAddress*) &$self;
	}
};

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
    TColStd_SequenceNodeOfSequenceOfAddress* GetObject() {
    return (TColStd_SequenceNodeOfSequenceOfAddress*)$self->Access();
    }
};
%feature("shadow") Handle_TColStd_SequenceNodeOfSequenceOfAddress::~Handle_TColStd_SequenceNodeOfSequenceOfAddress %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_TColStd_SequenceNodeOfSequenceOfAddress {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor TColStd_SequenceNodeOfSequenceOfAsciiString;
class TColStd_SequenceNodeOfSequenceOfAsciiString : public TCollection_SeqNode {
	public:
		%feature("autodoc", "Args:
	I(TCollection_AsciiString)
	n(TCollection_SeqNodePtr)
	p(TCollection_SeqNodePtr)

Returns:
	None

No detailed docstring for this function.") TColStd_SequenceNodeOfSequenceOfAsciiString;
		 TColStd_SequenceNodeOfSequenceOfAsciiString (const TCollection_AsciiString & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("autodoc", "Args:
	None
Returns:
	TCollection_AsciiString

No detailed docstring for this function.") Value;
		TCollection_AsciiString & Value ();
};


%feature("shadow") TColStd_SequenceNodeOfSequenceOfAsciiString::~TColStd_SequenceNodeOfSequenceOfAsciiString %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TColStd_SequenceNodeOfSequenceOfAsciiString {
	void _kill_pointed() {
		delete $self;
	}
};
%extend TColStd_SequenceNodeOfSequenceOfAsciiString {
	Handle_TColStd_SequenceNodeOfSequenceOfAsciiString GetHandle() {
	return *(Handle_TColStd_SequenceNodeOfSequenceOfAsciiString*) &$self;
	}
};

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
    TColStd_SequenceNodeOfSequenceOfAsciiString* GetObject() {
    return (TColStd_SequenceNodeOfSequenceOfAsciiString*)$self->Access();
    }
};
%feature("shadow") Handle_TColStd_SequenceNodeOfSequenceOfAsciiString::~Handle_TColStd_SequenceNodeOfSequenceOfAsciiString %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_TColStd_SequenceNodeOfSequenceOfAsciiString {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor TColStd_SequenceNodeOfSequenceOfBoolean;
class TColStd_SequenceNodeOfSequenceOfBoolean : public TCollection_SeqNode {
	public:
		%feature("autodoc", "Args:
	I(Standard_Boolean)
	n(TCollection_SeqNodePtr)
	p(TCollection_SeqNodePtr)

Returns:
	None

No detailed docstring for this function.") TColStd_SequenceNodeOfSequenceOfBoolean;
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


%feature("shadow") TColStd_SequenceNodeOfSequenceOfBoolean::~TColStd_SequenceNodeOfSequenceOfBoolean %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TColStd_SequenceNodeOfSequenceOfBoolean {
	void _kill_pointed() {
		delete $self;
	}
};
%extend TColStd_SequenceNodeOfSequenceOfBoolean {
	Handle_TColStd_SequenceNodeOfSequenceOfBoolean GetHandle() {
	return *(Handle_TColStd_SequenceNodeOfSequenceOfBoolean*) &$self;
	}
};

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
    TColStd_SequenceNodeOfSequenceOfBoolean* GetObject() {
    return (TColStd_SequenceNodeOfSequenceOfBoolean*)$self->Access();
    }
};
%feature("shadow") Handle_TColStd_SequenceNodeOfSequenceOfBoolean::~Handle_TColStd_SequenceNodeOfSequenceOfBoolean %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_TColStd_SequenceNodeOfSequenceOfBoolean {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor TColStd_SequenceNodeOfSequenceOfExtendedString;
class TColStd_SequenceNodeOfSequenceOfExtendedString : public TCollection_SeqNode {
	public:
		%feature("autodoc", "Args:
	I(TCollection_ExtendedString)
	n(TCollection_SeqNodePtr)
	p(TCollection_SeqNodePtr)

Returns:
	None

No detailed docstring for this function.") TColStd_SequenceNodeOfSequenceOfExtendedString;
		 TColStd_SequenceNodeOfSequenceOfExtendedString (const TCollection_ExtendedString & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("autodoc", "Args:
	None
Returns:
	TCollection_ExtendedString

No detailed docstring for this function.") Value;
		TCollection_ExtendedString & Value ();
};


%feature("shadow") TColStd_SequenceNodeOfSequenceOfExtendedString::~TColStd_SequenceNodeOfSequenceOfExtendedString %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TColStd_SequenceNodeOfSequenceOfExtendedString {
	void _kill_pointed() {
		delete $self;
	}
};
%extend TColStd_SequenceNodeOfSequenceOfExtendedString {
	Handle_TColStd_SequenceNodeOfSequenceOfExtendedString GetHandle() {
	return *(Handle_TColStd_SequenceNodeOfSequenceOfExtendedString*) &$self;
	}
};

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
    TColStd_SequenceNodeOfSequenceOfExtendedString* GetObject() {
    return (TColStd_SequenceNodeOfSequenceOfExtendedString*)$self->Access();
    }
};
%feature("shadow") Handle_TColStd_SequenceNodeOfSequenceOfExtendedString::~Handle_TColStd_SequenceNodeOfSequenceOfExtendedString %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_TColStd_SequenceNodeOfSequenceOfExtendedString {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor TColStd_SequenceNodeOfSequenceOfHAsciiString;
class TColStd_SequenceNodeOfSequenceOfHAsciiString : public TCollection_SeqNode {
	public:
		%feature("autodoc", "Args:
	I(Handle_TCollection_HAsciiString)
	n(TCollection_SeqNodePtr)
	p(TCollection_SeqNodePtr)

Returns:
	None

No detailed docstring for this function.") TColStd_SequenceNodeOfSequenceOfHAsciiString;
		 TColStd_SequenceNodeOfSequenceOfHAsciiString (const Handle_TCollection_HAsciiString & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_TCollection_HAsciiString

No detailed docstring for this function.") Value;
		Handle_TCollection_HAsciiString & Value ();
};


%feature("shadow") TColStd_SequenceNodeOfSequenceOfHAsciiString::~TColStd_SequenceNodeOfSequenceOfHAsciiString %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TColStd_SequenceNodeOfSequenceOfHAsciiString {
	void _kill_pointed() {
		delete $self;
	}
};
%extend TColStd_SequenceNodeOfSequenceOfHAsciiString {
	Handle_TColStd_SequenceNodeOfSequenceOfHAsciiString GetHandle() {
	return *(Handle_TColStd_SequenceNodeOfSequenceOfHAsciiString*) &$self;
	}
};

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
    TColStd_SequenceNodeOfSequenceOfHAsciiString* GetObject() {
    return (TColStd_SequenceNodeOfSequenceOfHAsciiString*)$self->Access();
    }
};
%feature("shadow") Handle_TColStd_SequenceNodeOfSequenceOfHAsciiString::~Handle_TColStd_SequenceNodeOfSequenceOfHAsciiString %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_TColStd_SequenceNodeOfSequenceOfHAsciiString {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor TColStd_SequenceNodeOfSequenceOfHExtendedString;
class TColStd_SequenceNodeOfSequenceOfHExtendedString : public TCollection_SeqNode {
	public:
		%feature("autodoc", "Args:
	I(Handle_TCollection_HExtendedString)
	n(TCollection_SeqNodePtr)
	p(TCollection_SeqNodePtr)

Returns:
	None

No detailed docstring for this function.") TColStd_SequenceNodeOfSequenceOfHExtendedString;
		 TColStd_SequenceNodeOfSequenceOfHExtendedString (const Handle_TCollection_HExtendedString & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_TCollection_HExtendedString

No detailed docstring for this function.") Value;
		Handle_TCollection_HExtendedString & Value ();
};


%feature("shadow") TColStd_SequenceNodeOfSequenceOfHExtendedString::~TColStd_SequenceNodeOfSequenceOfHExtendedString %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TColStd_SequenceNodeOfSequenceOfHExtendedString {
	void _kill_pointed() {
		delete $self;
	}
};
%extend TColStd_SequenceNodeOfSequenceOfHExtendedString {
	Handle_TColStd_SequenceNodeOfSequenceOfHExtendedString GetHandle() {
	return *(Handle_TColStd_SequenceNodeOfSequenceOfHExtendedString*) &$self;
	}
};

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
    TColStd_SequenceNodeOfSequenceOfHExtendedString* GetObject() {
    return (TColStd_SequenceNodeOfSequenceOfHExtendedString*)$self->Access();
    }
};
%feature("shadow") Handle_TColStd_SequenceNodeOfSequenceOfHExtendedString::~Handle_TColStd_SequenceNodeOfSequenceOfHExtendedString %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_TColStd_SequenceNodeOfSequenceOfHExtendedString {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor TColStd_SequenceNodeOfSequenceOfInteger;
class TColStd_SequenceNodeOfSequenceOfInteger : public TCollection_SeqNode {
	public:
		%feature("autodoc", "Args:
	I(Standard_Integer)
	n(TCollection_SeqNodePtr)
	p(TCollection_SeqNodePtr)

Returns:
	None

No detailed docstring for this function.") TColStd_SequenceNodeOfSequenceOfInteger;
		 TColStd_SequenceNodeOfSequenceOfInteger (Standard_Integer &OutValue,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);

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


%feature("shadow") TColStd_SequenceNodeOfSequenceOfInteger::~TColStd_SequenceNodeOfSequenceOfInteger %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TColStd_SequenceNodeOfSequenceOfInteger {
	void _kill_pointed() {
		delete $self;
	}
};
%extend TColStd_SequenceNodeOfSequenceOfInteger {
	Handle_TColStd_SequenceNodeOfSequenceOfInteger GetHandle() {
	return *(Handle_TColStd_SequenceNodeOfSequenceOfInteger*) &$self;
	}
};

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
    TColStd_SequenceNodeOfSequenceOfInteger* GetObject() {
    return (TColStd_SequenceNodeOfSequenceOfInteger*)$self->Access();
    }
};
%feature("shadow") Handle_TColStd_SequenceNodeOfSequenceOfInteger::~Handle_TColStd_SequenceNodeOfSequenceOfInteger %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_TColStd_SequenceNodeOfSequenceOfInteger {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor TColStd_SequenceNodeOfSequenceOfReal;
class TColStd_SequenceNodeOfSequenceOfReal : public TCollection_SeqNode {
	public:
		%feature("autodoc", "Args:
	I(Standard_Real)
	n(TCollection_SeqNodePtr)
	p(TCollection_SeqNodePtr)

Returns:
	None

No detailed docstring for this function.") TColStd_SequenceNodeOfSequenceOfReal;
		 TColStd_SequenceNodeOfSequenceOfReal (Standard_Real &OutValue,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);

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


%feature("shadow") TColStd_SequenceNodeOfSequenceOfReal::~TColStd_SequenceNodeOfSequenceOfReal %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TColStd_SequenceNodeOfSequenceOfReal {
	void _kill_pointed() {
		delete $self;
	}
};
%extend TColStd_SequenceNodeOfSequenceOfReal {
	Handle_TColStd_SequenceNodeOfSequenceOfReal GetHandle() {
	return *(Handle_TColStd_SequenceNodeOfSequenceOfReal*) &$self;
	}
};

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
    TColStd_SequenceNodeOfSequenceOfReal* GetObject() {
    return (TColStd_SequenceNodeOfSequenceOfReal*)$self->Access();
    }
};
%feature("shadow") Handle_TColStd_SequenceNodeOfSequenceOfReal::~Handle_TColStd_SequenceNodeOfSequenceOfReal %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_TColStd_SequenceNodeOfSequenceOfReal {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor TColStd_SequenceNodeOfSequenceOfTransient;
class TColStd_SequenceNodeOfSequenceOfTransient : public TCollection_SeqNode {
	public:
		%feature("autodoc", "Args:
	I(Handle_Standard_Transient)
	n(TCollection_SeqNodePtr)
	p(TCollection_SeqNodePtr)

Returns:
	None

No detailed docstring for this function.") TColStd_SequenceNodeOfSequenceOfTransient;
		 TColStd_SequenceNodeOfSequenceOfTransient (const Handle_Standard_Transient & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Standard_Transient

No detailed docstring for this function.") Value;
		Handle_Standard_Transient & Value ();
};


%feature("shadow") TColStd_SequenceNodeOfSequenceOfTransient::~TColStd_SequenceNodeOfSequenceOfTransient %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TColStd_SequenceNodeOfSequenceOfTransient {
	void _kill_pointed() {
		delete $self;
	}
};
%extend TColStd_SequenceNodeOfSequenceOfTransient {
	Handle_TColStd_SequenceNodeOfSequenceOfTransient GetHandle() {
	return *(Handle_TColStd_SequenceNodeOfSequenceOfTransient*) &$self;
	}
};

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
    TColStd_SequenceNodeOfSequenceOfTransient* GetObject() {
    return (TColStd_SequenceNodeOfSequenceOfTransient*)$self->Access();
    }
};
%feature("shadow") Handle_TColStd_SequenceNodeOfSequenceOfTransient::~Handle_TColStd_SequenceNodeOfSequenceOfTransient %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_TColStd_SequenceNodeOfSequenceOfTransient {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor TColStd_SequenceOfAddress;
class TColStd_SequenceOfAddress : public TCollection_BaseSequence {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") TColStd_SequenceOfAddress;
		 TColStd_SequenceOfAddress ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	Other(TColStd_SequenceOfAddress)

Returns:
	TColStd_SequenceOfAddress

No detailed docstring for this function.") Assign;
		const TColStd_SequenceOfAddress & Assign (const TColStd_SequenceOfAddress & Other);
		%feature("autodoc", "Args:
	Other(TColStd_SequenceOfAddress)

Returns:
	TColStd_SequenceOfAddress

No detailed docstring for this function.") operator=;
		const TColStd_SequenceOfAddress & operator = (const TColStd_SequenceOfAddress & Other);
		%feature("autodoc", "Args:
	T(Standard_Address)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (const Standard_Address & T);
		%feature("autodoc", "Args:
	S(TColStd_SequenceOfAddress)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (TColStd_SequenceOfAddress & S);
		%feature("autodoc", "Args:
	T(Standard_Address)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (const Standard_Address & T);
		%feature("autodoc", "Args:
	S(TColStd_SequenceOfAddress)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (TColStd_SequenceOfAddress & S);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	T(Standard_Address)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const Standard_Address & T);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	S(TColStd_SequenceOfAddress)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Standard_Integer Index,TColStd_SequenceOfAddress & S);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	T(Standard_Address)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const Standard_Address & T);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	S(TColStd_SequenceOfAddress)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Standard_Integer Index,TColStd_SequenceOfAddress & S);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Address

No detailed docstring for this function.") First;
		const Standard_Address & First ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Address

No detailed docstring for this function.") Last;
		const Standard_Address & Last ();
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	Sub(TColStd_SequenceOfAddress)

Returns:
	None

No detailed docstring for this function.") Split;
		void Split (const Standard_Integer Index,TColStd_SequenceOfAddress & Sub);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Standard_Address

No detailed docstring for this function.") Value;
		const Standard_Address & Value (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	I(Standard_Address)

Returns:
	None

No detailed docstring for this function.") SetValue;
		void SetValue (const Standard_Integer Index,const Standard_Address & I);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Standard_Address

No detailed docstring for this function.") ChangeValue;
		Standard_Address & ChangeValue (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Remove;
		void Remove (const Standard_Integer Index);
		%feature("autodoc", "Args:
	FromIndex(Standard_Integer)
	ToIndex(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Remove;
		void Remove (const Standard_Integer FromIndex,const Standard_Integer ToIndex);
};


%feature("shadow") TColStd_SequenceOfAddress::~TColStd_SequenceOfAddress %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TColStd_SequenceOfAddress {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor TColStd_SequenceOfAsciiString;
class TColStd_SequenceOfAsciiString : public TCollection_BaseSequence {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") TColStd_SequenceOfAsciiString;
		 TColStd_SequenceOfAsciiString ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	Other(TColStd_SequenceOfAsciiString)

Returns:
	TColStd_SequenceOfAsciiString

No detailed docstring for this function.") Assign;
		const TColStd_SequenceOfAsciiString & Assign (const TColStd_SequenceOfAsciiString & Other);
		%feature("autodoc", "Args:
	Other(TColStd_SequenceOfAsciiString)

Returns:
	TColStd_SequenceOfAsciiString

No detailed docstring for this function.") operator=;
		const TColStd_SequenceOfAsciiString & operator = (const TColStd_SequenceOfAsciiString & Other);
		%feature("autodoc", "Args:
	T(TCollection_AsciiString)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (const TCollection_AsciiString & T);
		%feature("autodoc", "Args:
	S(TColStd_SequenceOfAsciiString)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (TColStd_SequenceOfAsciiString & S);
		%feature("autodoc", "Args:
	T(TCollection_AsciiString)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (const TCollection_AsciiString & T);
		%feature("autodoc", "Args:
	S(TColStd_SequenceOfAsciiString)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (TColStd_SequenceOfAsciiString & S);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	T(TCollection_AsciiString)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const TCollection_AsciiString & T);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	S(TColStd_SequenceOfAsciiString)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Standard_Integer Index,TColStd_SequenceOfAsciiString & S);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	T(TCollection_AsciiString)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const TCollection_AsciiString & T);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	S(TColStd_SequenceOfAsciiString)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Standard_Integer Index,TColStd_SequenceOfAsciiString & S);
		%feature("autodoc", "Args:
	None
Returns:
	TCollection_AsciiString

No detailed docstring for this function.") First;
		const TCollection_AsciiString & First ();
		%feature("autodoc", "Args:
	None
Returns:
	TCollection_AsciiString

No detailed docstring for this function.") Last;
		const TCollection_AsciiString & Last ();
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	Sub(TColStd_SequenceOfAsciiString)

Returns:
	None

No detailed docstring for this function.") Split;
		void Split (const Standard_Integer Index,TColStd_SequenceOfAsciiString & Sub);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	TCollection_AsciiString

No detailed docstring for this function.") Value;
		const TCollection_AsciiString & Value (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	I(TCollection_AsciiString)

Returns:
	None

No detailed docstring for this function.") SetValue;
		void SetValue (const Standard_Integer Index,const TCollection_AsciiString & I);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	TCollection_AsciiString

No detailed docstring for this function.") ChangeValue;
		TCollection_AsciiString & ChangeValue (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Remove;
		void Remove (const Standard_Integer Index);
		%feature("autodoc", "Args:
	FromIndex(Standard_Integer)
	ToIndex(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Remove;
		void Remove (const Standard_Integer FromIndex,const Standard_Integer ToIndex);
};


%feature("shadow") TColStd_SequenceOfAsciiString::~TColStd_SequenceOfAsciiString %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TColStd_SequenceOfAsciiString {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor TColStd_SequenceOfBoolean;
class TColStd_SequenceOfBoolean : public TCollection_BaseSequence {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") TColStd_SequenceOfBoolean;
		 TColStd_SequenceOfBoolean ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	Other(TColStd_SequenceOfBoolean)

Returns:
	TColStd_SequenceOfBoolean

No detailed docstring for this function.") Assign;
		const TColStd_SequenceOfBoolean & Assign (const TColStd_SequenceOfBoolean & Other);
		%feature("autodoc", "Args:
	Other(TColStd_SequenceOfBoolean)

Returns:
	TColStd_SequenceOfBoolean

No detailed docstring for this function.") operator=;
		const TColStd_SequenceOfBoolean & operator = (const TColStd_SequenceOfBoolean & Other);
		%feature("autodoc", "Args:
	T(Standard_Boolean)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (const Standard_Boolean & T);
		%feature("autodoc", "Args:
	S(TColStd_SequenceOfBoolean)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (TColStd_SequenceOfBoolean & S);
		%feature("autodoc", "Args:
	T(Standard_Boolean)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (const Standard_Boolean & T);
		%feature("autodoc", "Args:
	S(TColStd_SequenceOfBoolean)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (TColStd_SequenceOfBoolean & S);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	T(Standard_Boolean)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const Standard_Boolean & T);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	S(TColStd_SequenceOfBoolean)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Standard_Integer Index,TColStd_SequenceOfBoolean & S);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	T(Standard_Boolean)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const Standard_Boolean & T);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	S(TColStd_SequenceOfBoolean)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Standard_Integer Index,TColStd_SequenceOfBoolean & S);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") First;
		const Standard_Boolean & First ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") Last;
		const Standard_Boolean & Last ();
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	Sub(TColStd_SequenceOfBoolean)

Returns:
	None

No detailed docstring for this function.") Split;
		void Split (const Standard_Integer Index,TColStd_SequenceOfBoolean & Sub);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Standard_Boolean

No detailed docstring for this function.") Value;
		const Standard_Boolean & Value (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	I(Standard_Boolean)

Returns:
	None

No detailed docstring for this function.") SetValue;
		void SetValue (const Standard_Integer Index,const Standard_Boolean & I);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Standard_Boolean

No detailed docstring for this function.") ChangeValue;
		Standard_Boolean & ChangeValue (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Remove;
		void Remove (const Standard_Integer Index);
		%feature("autodoc", "Args:
	FromIndex(Standard_Integer)
	ToIndex(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Remove;
		void Remove (const Standard_Integer FromIndex,const Standard_Integer ToIndex);
};


%feature("shadow") TColStd_SequenceOfBoolean::~TColStd_SequenceOfBoolean %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TColStd_SequenceOfBoolean {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor TColStd_SequenceOfExtendedString;
class TColStd_SequenceOfExtendedString : public TCollection_BaseSequence {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") TColStd_SequenceOfExtendedString;
		 TColStd_SequenceOfExtendedString ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	Other(TColStd_SequenceOfExtendedString)

Returns:
	TColStd_SequenceOfExtendedString

No detailed docstring for this function.") Assign;
		const TColStd_SequenceOfExtendedString & Assign (const TColStd_SequenceOfExtendedString & Other);
		%feature("autodoc", "Args:
	Other(TColStd_SequenceOfExtendedString)

Returns:
	TColStd_SequenceOfExtendedString

No detailed docstring for this function.") operator=;
		const TColStd_SequenceOfExtendedString & operator = (const TColStd_SequenceOfExtendedString & Other);
		%feature("autodoc", "Args:
	T(TCollection_ExtendedString)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (const TCollection_ExtendedString & T);
		%feature("autodoc", "Args:
	S(TColStd_SequenceOfExtendedString)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (TColStd_SequenceOfExtendedString & S);
		%feature("autodoc", "Args:
	T(TCollection_ExtendedString)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (const TCollection_ExtendedString & T);
		%feature("autodoc", "Args:
	S(TColStd_SequenceOfExtendedString)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (TColStd_SequenceOfExtendedString & S);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	T(TCollection_ExtendedString)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const TCollection_ExtendedString & T);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	S(TColStd_SequenceOfExtendedString)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Standard_Integer Index,TColStd_SequenceOfExtendedString & S);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	T(TCollection_ExtendedString)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const TCollection_ExtendedString & T);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	S(TColStd_SequenceOfExtendedString)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Standard_Integer Index,TColStd_SequenceOfExtendedString & S);
		%feature("autodoc", "Args:
	None
Returns:
	TCollection_ExtendedString

No detailed docstring for this function.") First;
		const TCollection_ExtendedString & First ();
		%feature("autodoc", "Args:
	None
Returns:
	TCollection_ExtendedString

No detailed docstring for this function.") Last;
		const TCollection_ExtendedString & Last ();
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	Sub(TColStd_SequenceOfExtendedString)

Returns:
	None

No detailed docstring for this function.") Split;
		void Split (const Standard_Integer Index,TColStd_SequenceOfExtendedString & Sub);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	TCollection_ExtendedString

No detailed docstring for this function.") Value;
		const TCollection_ExtendedString & Value (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	I(TCollection_ExtendedString)

Returns:
	None

No detailed docstring for this function.") SetValue;
		void SetValue (const Standard_Integer Index,const TCollection_ExtendedString & I);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	TCollection_ExtendedString

No detailed docstring for this function.") ChangeValue;
		TCollection_ExtendedString & ChangeValue (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Remove;
		void Remove (const Standard_Integer Index);
		%feature("autodoc", "Args:
	FromIndex(Standard_Integer)
	ToIndex(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Remove;
		void Remove (const Standard_Integer FromIndex,const Standard_Integer ToIndex);
};


%feature("shadow") TColStd_SequenceOfExtendedString::~TColStd_SequenceOfExtendedString %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TColStd_SequenceOfExtendedString {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor TColStd_SequenceOfHAsciiString;
class TColStd_SequenceOfHAsciiString : public TCollection_BaseSequence {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") TColStd_SequenceOfHAsciiString;
		 TColStd_SequenceOfHAsciiString ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	Other(TColStd_SequenceOfHAsciiString)

Returns:
	TColStd_SequenceOfHAsciiString

No detailed docstring for this function.") Assign;
		const TColStd_SequenceOfHAsciiString & Assign (const TColStd_SequenceOfHAsciiString & Other);
		%feature("autodoc", "Args:
	Other(TColStd_SequenceOfHAsciiString)

Returns:
	TColStd_SequenceOfHAsciiString

No detailed docstring for this function.") operator=;
		const TColStd_SequenceOfHAsciiString & operator = (const TColStd_SequenceOfHAsciiString & Other);
		%feature("autodoc", "Args:
	T(Handle_TCollection_HAsciiString)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (const Handle_TCollection_HAsciiString & T);
		%feature("autodoc", "Args:
	S(TColStd_SequenceOfHAsciiString)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (TColStd_SequenceOfHAsciiString & S);
		%feature("autodoc", "Args:
	T(Handle_TCollection_HAsciiString)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (const Handle_TCollection_HAsciiString & T);
		%feature("autodoc", "Args:
	S(TColStd_SequenceOfHAsciiString)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (TColStd_SequenceOfHAsciiString & S);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	T(Handle_TCollection_HAsciiString)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const Handle_TCollection_HAsciiString & T);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	S(TColStd_SequenceOfHAsciiString)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Standard_Integer Index,TColStd_SequenceOfHAsciiString & S);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	T(Handle_TCollection_HAsciiString)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const Handle_TCollection_HAsciiString & T);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	S(TColStd_SequenceOfHAsciiString)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Standard_Integer Index,TColStd_SequenceOfHAsciiString & S);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_TCollection_HAsciiString

No detailed docstring for this function.") First;
		const Handle_TCollection_HAsciiString & First ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_TCollection_HAsciiString

No detailed docstring for this function.") Last;
		const Handle_TCollection_HAsciiString & Last ();
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	Sub(TColStd_SequenceOfHAsciiString)

Returns:
	None

No detailed docstring for this function.") Split;
		void Split (const Standard_Integer Index,TColStd_SequenceOfHAsciiString & Sub);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Handle_TCollection_HAsciiString

No detailed docstring for this function.") Value;
		const Handle_TCollection_HAsciiString & Value (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	I(Handle_TCollection_HAsciiString)

Returns:
	None

No detailed docstring for this function.") SetValue;
		void SetValue (const Standard_Integer Index,const Handle_TCollection_HAsciiString & I);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Handle_TCollection_HAsciiString

No detailed docstring for this function.") ChangeValue;
		Handle_TCollection_HAsciiString & ChangeValue (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Remove;
		void Remove (const Standard_Integer Index);
		%feature("autodoc", "Args:
	FromIndex(Standard_Integer)
	ToIndex(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Remove;
		void Remove (const Standard_Integer FromIndex,const Standard_Integer ToIndex);
};


%feature("shadow") TColStd_SequenceOfHAsciiString::~TColStd_SequenceOfHAsciiString %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TColStd_SequenceOfHAsciiString {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor TColStd_SequenceOfHExtendedString;
class TColStd_SequenceOfHExtendedString : public TCollection_BaseSequence {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") TColStd_SequenceOfHExtendedString;
		 TColStd_SequenceOfHExtendedString ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	Other(TColStd_SequenceOfHExtendedString)

Returns:
	TColStd_SequenceOfHExtendedString

No detailed docstring for this function.") Assign;
		const TColStd_SequenceOfHExtendedString & Assign (const TColStd_SequenceOfHExtendedString & Other);
		%feature("autodoc", "Args:
	Other(TColStd_SequenceOfHExtendedString)

Returns:
	TColStd_SequenceOfHExtendedString

No detailed docstring for this function.") operator=;
		const TColStd_SequenceOfHExtendedString & operator = (const TColStd_SequenceOfHExtendedString & Other);
		%feature("autodoc", "Args:
	T(Handle_TCollection_HExtendedString)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (const Handle_TCollection_HExtendedString & T);
		%feature("autodoc", "Args:
	S(TColStd_SequenceOfHExtendedString)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (TColStd_SequenceOfHExtendedString & S);
		%feature("autodoc", "Args:
	T(Handle_TCollection_HExtendedString)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (const Handle_TCollection_HExtendedString & T);
		%feature("autodoc", "Args:
	S(TColStd_SequenceOfHExtendedString)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (TColStd_SequenceOfHExtendedString & S);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	T(Handle_TCollection_HExtendedString)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const Handle_TCollection_HExtendedString & T);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	S(TColStd_SequenceOfHExtendedString)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Standard_Integer Index,TColStd_SequenceOfHExtendedString & S);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	T(Handle_TCollection_HExtendedString)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const Handle_TCollection_HExtendedString & T);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	S(TColStd_SequenceOfHExtendedString)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Standard_Integer Index,TColStd_SequenceOfHExtendedString & S);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_TCollection_HExtendedString

No detailed docstring for this function.") First;
		const Handle_TCollection_HExtendedString & First ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_TCollection_HExtendedString

No detailed docstring for this function.") Last;
		const Handle_TCollection_HExtendedString & Last ();
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	Sub(TColStd_SequenceOfHExtendedString)

Returns:
	None

No detailed docstring for this function.") Split;
		void Split (const Standard_Integer Index,TColStd_SequenceOfHExtendedString & Sub);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Handle_TCollection_HExtendedString

No detailed docstring for this function.") Value;
		const Handle_TCollection_HExtendedString & Value (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	I(Handle_TCollection_HExtendedString)

Returns:
	None

No detailed docstring for this function.") SetValue;
		void SetValue (const Standard_Integer Index,const Handle_TCollection_HExtendedString & I);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Handle_TCollection_HExtendedString

No detailed docstring for this function.") ChangeValue;
		Handle_TCollection_HExtendedString & ChangeValue (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Remove;
		void Remove (const Standard_Integer Index);
		%feature("autodoc", "Args:
	FromIndex(Standard_Integer)
	ToIndex(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Remove;
		void Remove (const Standard_Integer FromIndex,const Standard_Integer ToIndex);
};


%feature("shadow") TColStd_SequenceOfHExtendedString::~TColStd_SequenceOfHExtendedString %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TColStd_SequenceOfHExtendedString {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor TColStd_SequenceOfInteger;
class TColStd_SequenceOfInteger : public TCollection_BaseSequence {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") TColStd_SequenceOfInteger;
		 TColStd_SequenceOfInteger ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	Other(TColStd_SequenceOfInteger)

Returns:
	TColStd_SequenceOfInteger

No detailed docstring for this function.") Assign;
		const TColStd_SequenceOfInteger & Assign (const TColStd_SequenceOfInteger & Other);
		%feature("autodoc", "Args:
	Other(TColStd_SequenceOfInteger)

Returns:
	TColStd_SequenceOfInteger

No detailed docstring for this function.") operator=;
		const TColStd_SequenceOfInteger & operator = (const TColStd_SequenceOfInteger & Other);
		%feature("autodoc", "Args:
	T(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (Standard_Integer &OutValue);
		%feature("autodoc", "Args:
	S(TColStd_SequenceOfInteger)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (TColStd_SequenceOfInteger & S);
		%feature("autodoc", "Args:
	T(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (Standard_Integer &OutValue);
		%feature("autodoc", "Args:
	S(TColStd_SequenceOfInteger)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (TColStd_SequenceOfInteger & S);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	T(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Standard_Integer Index,Standard_Integer &OutValue);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	S(TColStd_SequenceOfInteger)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Standard_Integer Index,TColStd_SequenceOfInteger & S);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	T(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Standard_Integer Index,Standard_Integer &OutValue);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	S(TColStd_SequenceOfInteger)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Standard_Integer Index,TColStd_SequenceOfInteger & S);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") First;
		const Standard_Integer & First ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Last;
		const Standard_Integer & Last ();
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	Sub(TColStd_SequenceOfInteger)

Returns:
	None

No detailed docstring for this function.") Split;
		void Split (const Standard_Integer Index,TColStd_SequenceOfInteger & Sub);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Standard_Integer

No detailed docstring for this function.") Value;
		const Standard_Integer & Value (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	I(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") SetValue;
		void SetValue (const Standard_Integer Index,Standard_Integer &OutValue);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Standard_Integer

No detailed docstring for this function.") ChangeValue;
		Standard_Integer & ChangeValue (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Remove;
		void Remove (const Standard_Integer Index);
		%feature("autodoc", "Args:
	FromIndex(Standard_Integer)
	ToIndex(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Remove;
		void Remove (const Standard_Integer FromIndex,const Standard_Integer ToIndex);
};


%feature("shadow") TColStd_SequenceOfInteger::~TColStd_SequenceOfInteger %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TColStd_SequenceOfInteger {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor TColStd_SequenceOfReal;
class TColStd_SequenceOfReal : public TCollection_BaseSequence {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") TColStd_SequenceOfReal;
		 TColStd_SequenceOfReal ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	Other(TColStd_SequenceOfReal)

Returns:
	TColStd_SequenceOfReal

No detailed docstring for this function.") Assign;
		const TColStd_SequenceOfReal & Assign (const TColStd_SequenceOfReal & Other);
		%feature("autodoc", "Args:
	Other(TColStd_SequenceOfReal)

Returns:
	TColStd_SequenceOfReal

No detailed docstring for this function.") operator=;
		const TColStd_SequenceOfReal & operator = (const TColStd_SequenceOfReal & Other);
		%feature("autodoc", "Args:
	T(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (Standard_Real &OutValue);
		%feature("autodoc", "Args:
	S(TColStd_SequenceOfReal)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (TColStd_SequenceOfReal & S);
		%feature("autodoc", "Args:
	T(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (Standard_Real &OutValue);
		%feature("autodoc", "Args:
	S(TColStd_SequenceOfReal)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (TColStd_SequenceOfReal & S);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	T(Standard_Real)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Standard_Integer Index,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	S(TColStd_SequenceOfReal)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Standard_Integer Index,TColStd_SequenceOfReal & S);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	T(Standard_Real)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Standard_Integer Index,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	S(TColStd_SequenceOfReal)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Standard_Integer Index,TColStd_SequenceOfReal & S);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

No detailed docstring for this function.") First;
		const Standard_Real & First ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

No detailed docstring for this function.") Last;
		const Standard_Real & Last ();
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	Sub(TColStd_SequenceOfReal)

Returns:
	None

No detailed docstring for this function.") Split;
		void Split (const Standard_Integer Index,TColStd_SequenceOfReal & Sub);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Standard_Real

No detailed docstring for this function.") Value;
		const Standard_Real & Value (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	I(Standard_Real)

Returns:
	None

No detailed docstring for this function.") SetValue;
		void SetValue (const Standard_Integer Index,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Standard_Real

No detailed docstring for this function.") ChangeValue;
		Standard_Real & ChangeValue (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Remove;
		void Remove (const Standard_Integer Index);
		%feature("autodoc", "Args:
	FromIndex(Standard_Integer)
	ToIndex(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Remove;
		void Remove (const Standard_Integer FromIndex,const Standard_Integer ToIndex);
};


%feature("shadow") TColStd_SequenceOfReal::~TColStd_SequenceOfReal %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TColStd_SequenceOfReal {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor TColStd_SequenceOfTransient;
class TColStd_SequenceOfTransient : public TCollection_BaseSequence {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") TColStd_SequenceOfTransient;
		 TColStd_SequenceOfTransient ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	Other(TColStd_SequenceOfTransient)

Returns:
	TColStd_SequenceOfTransient

No detailed docstring for this function.") Assign;
		const TColStd_SequenceOfTransient & Assign (const TColStd_SequenceOfTransient & Other);
		%feature("autodoc", "Args:
	Other(TColStd_SequenceOfTransient)

Returns:
	TColStd_SequenceOfTransient

No detailed docstring for this function.") operator=;
		const TColStd_SequenceOfTransient & operator = (const TColStd_SequenceOfTransient & Other);
		%feature("autodoc", "Args:
	T(Handle_Standard_Transient)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (const Handle_Standard_Transient & T);
		%feature("autodoc", "Args:
	S(TColStd_SequenceOfTransient)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (TColStd_SequenceOfTransient & S);
		%feature("autodoc", "Args:
	T(Handle_Standard_Transient)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (const Handle_Standard_Transient & T);
		%feature("autodoc", "Args:
	S(TColStd_SequenceOfTransient)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (TColStd_SequenceOfTransient & S);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	T(Handle_Standard_Transient)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const Handle_Standard_Transient & T);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	S(TColStd_SequenceOfTransient)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Standard_Integer Index,TColStd_SequenceOfTransient & S);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	T(Handle_Standard_Transient)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const Handle_Standard_Transient & T);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	S(TColStd_SequenceOfTransient)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Standard_Integer Index,TColStd_SequenceOfTransient & S);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Standard_Transient

No detailed docstring for this function.") First;
		const Handle_Standard_Transient & First ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Standard_Transient

No detailed docstring for this function.") Last;
		const Handle_Standard_Transient & Last ();
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	Sub(TColStd_SequenceOfTransient)

Returns:
	None

No detailed docstring for this function.") Split;
		void Split (const Standard_Integer Index,TColStd_SequenceOfTransient & Sub);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Handle_Standard_Transient

No detailed docstring for this function.") Value;
		const Handle_Standard_Transient & Value (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	I(Handle_Standard_Transient)

Returns:
	None

No detailed docstring for this function.") SetValue;
		void SetValue (const Standard_Integer Index,const Handle_Standard_Transient & I);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Handle_Standard_Transient

No detailed docstring for this function.") ChangeValue;
		Handle_Standard_Transient & ChangeValue (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Remove;
		void Remove (const Standard_Integer Index);
		%feature("autodoc", "Args:
	FromIndex(Standard_Integer)
	ToIndex(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Remove;
		void Remove (const Standard_Integer FromIndex,const Standard_Integer ToIndex);
};


%feature("shadow") TColStd_SequenceOfTransient::~TColStd_SequenceOfTransient %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TColStd_SequenceOfTransient {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor TColStd_SetIteratorOfSetOfInteger;
class TColStd_SetIteratorOfSetOfInteger {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") TColStd_SetIteratorOfSetOfInteger;
		 TColStd_SetIteratorOfSetOfInteger ();
		%feature("autodoc", "Args:
	S(TColStd_SetOfInteger)

Returns:
	None

No detailed docstring for this function.") TColStd_SetIteratorOfSetOfInteger;
		 TColStd_SetIteratorOfSetOfInteger (const TColStd_SetOfInteger & S);
		%feature("autodoc", "Args:
	S(TColStd_SetOfInteger)

Returns:
	None

No detailed docstring for this function.") Initialize;
		void Initialize (const TColStd_SetOfInteger & S);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") More;
		Standard_Boolean More ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Next;
		void Next ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Value;
		const Standard_Integer & Value ();
};


%feature("shadow") TColStd_SetIteratorOfSetOfInteger::~TColStd_SetIteratorOfSetOfInteger %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TColStd_SetIteratorOfSetOfInteger {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor TColStd_SetIteratorOfSetOfReal;
class TColStd_SetIteratorOfSetOfReal {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") TColStd_SetIteratorOfSetOfReal;
		 TColStd_SetIteratorOfSetOfReal ();
		%feature("autodoc", "Args:
	S(TColStd_SetOfReal)

Returns:
	None

No detailed docstring for this function.") TColStd_SetIteratorOfSetOfReal;
		 TColStd_SetIteratorOfSetOfReal (const TColStd_SetOfReal & S);
		%feature("autodoc", "Args:
	S(TColStd_SetOfReal)

Returns:
	None

No detailed docstring for this function.") Initialize;
		void Initialize (const TColStd_SetOfReal & S);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") More;
		Standard_Boolean More ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Next;
		void Next ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

No detailed docstring for this function.") Value;
		const Standard_Real & Value ();
};


%feature("shadow") TColStd_SetIteratorOfSetOfReal::~TColStd_SetIteratorOfSetOfReal %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TColStd_SetIteratorOfSetOfReal {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor TColStd_SetIteratorOfSetOfTransient;
class TColStd_SetIteratorOfSetOfTransient {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") TColStd_SetIteratorOfSetOfTransient;
		 TColStd_SetIteratorOfSetOfTransient ();
		%feature("autodoc", "Args:
	S(TColStd_SetOfTransient)

Returns:
	None

No detailed docstring for this function.") TColStd_SetIteratorOfSetOfTransient;
		 TColStd_SetIteratorOfSetOfTransient (const TColStd_SetOfTransient & S);
		%feature("autodoc", "Args:
	S(TColStd_SetOfTransient)

Returns:
	None

No detailed docstring for this function.") Initialize;
		void Initialize (const TColStd_SetOfTransient & S);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") More;
		Standard_Boolean More ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Next;
		void Next ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Standard_Transient

No detailed docstring for this function.") Value;
		const Handle_Standard_Transient & Value ();
};


%feature("shadow") TColStd_SetIteratorOfSetOfTransient::~TColStd_SetIteratorOfSetOfTransient %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TColStd_SetIteratorOfSetOfTransient {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor TColStd_SetListOfSetOfInteger;
class TColStd_SetListOfSetOfInteger {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") TColStd_SetListOfSetOfInteger;
		 TColStd_SetListOfSetOfInteger ();
		%feature("autodoc", "Args:
	Other(TColStd_SetListOfSetOfInteger)

Returns:
	None

No detailed docstring for this function.") Assign;
		void Assign (const TColStd_SetListOfSetOfInteger & Other);
		%feature("autodoc", "Args:
	Other(TColStd_SetListOfSetOfInteger)

Returns:
	None

No detailed docstring for this function.") operator=;
		void operator = (const TColStd_SetListOfSetOfInteger & Other);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Extent;
		Standard_Integer Extent ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsEmpty;
		Standard_Boolean IsEmpty ();
		%feature("autodoc", "Args:
	I(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (Standard_Integer &OutValue);
		%feature("autodoc", "Args:
	I(Standard_Integer)
	theIt(TColStd_ListIteratorOfSetListOfSetOfInteger)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (Standard_Integer &OutValue,TColStd_ListIteratorOfSetListOfSetOfInteger & theIt);
		%feature("autodoc", "Args:
	Other(TColStd_SetListOfSetOfInteger)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (TColStd_SetListOfSetOfInteger & Other);
		%feature("autodoc", "Args:
	I(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (Standard_Integer &OutValue);
		%feature("autodoc", "Args:
	I(Standard_Integer)
	theIt(TColStd_ListIteratorOfSetListOfSetOfInteger)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (Standard_Integer &OutValue,TColStd_ListIteratorOfSetListOfSetOfInteger & theIt);
		%feature("autodoc", "Args:
	Other(TColStd_SetListOfSetOfInteger)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (TColStd_SetListOfSetOfInteger & Other);

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
            		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") RemoveFirst;
		void RemoveFirst ();
		%feature("autodoc", "Args:
	It(TColStd_ListIteratorOfSetListOfSetOfInteger)

Returns:
	None

No detailed docstring for this function.") Remove;
		void Remove (TColStd_ListIteratorOfSetListOfSetOfInteger & It);
		%feature("autodoc", "Args:
	I(Standard_Integer)
	It(TColStd_ListIteratorOfSetListOfSetOfInteger)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (Standard_Integer &OutValue,TColStd_ListIteratorOfSetListOfSetOfInteger & It);
		%feature("autodoc", "Args:
	Other(TColStd_SetListOfSetOfInteger)
	It(TColStd_ListIteratorOfSetListOfSetOfInteger)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (TColStd_SetListOfSetOfInteger & Other,TColStd_ListIteratorOfSetListOfSetOfInteger & It);
		%feature("autodoc", "Args:
	I(Standard_Integer)
	It(TColStd_ListIteratorOfSetListOfSetOfInteger)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (Standard_Integer &OutValue,TColStd_ListIteratorOfSetListOfSetOfInteger & It);
		%feature("autodoc", "Args:
	Other(TColStd_SetListOfSetOfInteger)
	It(TColStd_ListIteratorOfSetListOfSetOfInteger)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (TColStd_SetListOfSetOfInteger & Other,TColStd_ListIteratorOfSetListOfSetOfInteger & It);
};


%feature("shadow") TColStd_SetListOfSetOfInteger::~TColStd_SetListOfSetOfInteger %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TColStd_SetListOfSetOfInteger {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor TColStd_SetListOfSetOfReal;
class TColStd_SetListOfSetOfReal {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") TColStd_SetListOfSetOfReal;
		 TColStd_SetListOfSetOfReal ();
		%feature("autodoc", "Args:
	Other(TColStd_SetListOfSetOfReal)

Returns:
	None

No detailed docstring for this function.") Assign;
		void Assign (const TColStd_SetListOfSetOfReal & Other);
		%feature("autodoc", "Args:
	Other(TColStd_SetListOfSetOfReal)

Returns:
	None

No detailed docstring for this function.") operator=;
		void operator = (const TColStd_SetListOfSetOfReal & Other);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Extent;
		Standard_Integer Extent ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsEmpty;
		Standard_Boolean IsEmpty ();
		%feature("autodoc", "Args:
	I(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (Standard_Real &OutValue);
		%feature("autodoc", "Args:
	I(Standard_Real)
	theIt(TColStd_ListIteratorOfSetListOfSetOfReal)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (Standard_Real &OutValue,TColStd_ListIteratorOfSetListOfSetOfReal & theIt);
		%feature("autodoc", "Args:
	Other(TColStd_SetListOfSetOfReal)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (TColStd_SetListOfSetOfReal & Other);
		%feature("autodoc", "Args:
	I(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (Standard_Real &OutValue);
		%feature("autodoc", "Args:
	I(Standard_Real)
	theIt(TColStd_ListIteratorOfSetListOfSetOfReal)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (Standard_Real &OutValue,TColStd_ListIteratorOfSetListOfSetOfReal & theIt);
		%feature("autodoc", "Args:
	Other(TColStd_SetListOfSetOfReal)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (TColStd_SetListOfSetOfReal & Other);

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
            		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") RemoveFirst;
		void RemoveFirst ();
		%feature("autodoc", "Args:
	It(TColStd_ListIteratorOfSetListOfSetOfReal)

Returns:
	None

No detailed docstring for this function.") Remove;
		void Remove (TColStd_ListIteratorOfSetListOfSetOfReal & It);
		%feature("autodoc", "Args:
	I(Standard_Real)
	It(TColStd_ListIteratorOfSetListOfSetOfReal)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (Standard_Real &OutValue,TColStd_ListIteratorOfSetListOfSetOfReal & It);
		%feature("autodoc", "Args:
	Other(TColStd_SetListOfSetOfReal)
	It(TColStd_ListIteratorOfSetListOfSetOfReal)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (TColStd_SetListOfSetOfReal & Other,TColStd_ListIteratorOfSetListOfSetOfReal & It);
		%feature("autodoc", "Args:
	I(Standard_Real)
	It(TColStd_ListIteratorOfSetListOfSetOfReal)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (Standard_Real &OutValue,TColStd_ListIteratorOfSetListOfSetOfReal & It);
		%feature("autodoc", "Args:
	Other(TColStd_SetListOfSetOfReal)
	It(TColStd_ListIteratorOfSetListOfSetOfReal)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (TColStd_SetListOfSetOfReal & Other,TColStd_ListIteratorOfSetListOfSetOfReal & It);
};


%feature("shadow") TColStd_SetListOfSetOfReal::~TColStd_SetListOfSetOfReal %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TColStd_SetListOfSetOfReal {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor TColStd_SetListOfSetOfTransient;
class TColStd_SetListOfSetOfTransient {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") TColStd_SetListOfSetOfTransient;
		 TColStd_SetListOfSetOfTransient ();
		%feature("autodoc", "Args:
	Other(TColStd_SetListOfSetOfTransient)

Returns:
	None

No detailed docstring for this function.") Assign;
		void Assign (const TColStd_SetListOfSetOfTransient & Other);
		%feature("autodoc", "Args:
	Other(TColStd_SetListOfSetOfTransient)

Returns:
	None

No detailed docstring for this function.") operator=;
		void operator = (const TColStd_SetListOfSetOfTransient & Other);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Extent;
		Standard_Integer Extent ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsEmpty;
		Standard_Boolean IsEmpty ();
		%feature("autodoc", "Args:
	I(Handle_Standard_Transient)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (const Handle_Standard_Transient & I);
		%feature("autodoc", "Args:
	I(Handle_Standard_Transient)
	theIt(TColStd_ListIteratorOfSetListOfSetOfTransient)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (const Handle_Standard_Transient & I,TColStd_ListIteratorOfSetListOfSetOfTransient & theIt);
		%feature("autodoc", "Args:
	Other(TColStd_SetListOfSetOfTransient)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (TColStd_SetListOfSetOfTransient & Other);
		%feature("autodoc", "Args:
	I(Handle_Standard_Transient)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (const Handle_Standard_Transient & I);
		%feature("autodoc", "Args:
	I(Handle_Standard_Transient)
	theIt(TColStd_ListIteratorOfSetListOfSetOfTransient)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (const Handle_Standard_Transient & I,TColStd_ListIteratorOfSetListOfSetOfTransient & theIt);
		%feature("autodoc", "Args:
	Other(TColStd_SetListOfSetOfTransient)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (TColStd_SetListOfSetOfTransient & Other);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Standard_Transient

No detailed docstring for this function.") First;
		Handle_Standard_Transient & First ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Standard_Transient

No detailed docstring for this function.") Last;
		Handle_Standard_Transient & Last ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") RemoveFirst;
		void RemoveFirst ();
		%feature("autodoc", "Args:
	It(TColStd_ListIteratorOfSetListOfSetOfTransient)

Returns:
	None

No detailed docstring for this function.") Remove;
		void Remove (TColStd_ListIteratorOfSetListOfSetOfTransient & It);
		%feature("autodoc", "Args:
	I(Handle_Standard_Transient)
	It(TColStd_ListIteratorOfSetListOfSetOfTransient)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Handle_Standard_Transient & I,TColStd_ListIteratorOfSetListOfSetOfTransient & It);
		%feature("autodoc", "Args:
	Other(TColStd_SetListOfSetOfTransient)
	It(TColStd_ListIteratorOfSetListOfSetOfTransient)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (TColStd_SetListOfSetOfTransient & Other,TColStd_ListIteratorOfSetListOfSetOfTransient & It);
		%feature("autodoc", "Args:
	I(Handle_Standard_Transient)
	It(TColStd_ListIteratorOfSetListOfSetOfTransient)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Handle_Standard_Transient & I,TColStd_ListIteratorOfSetListOfSetOfTransient & It);
		%feature("autodoc", "Args:
	Other(TColStd_SetListOfSetOfTransient)
	It(TColStd_ListIteratorOfSetListOfSetOfTransient)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (TColStd_SetListOfSetOfTransient & Other,TColStd_ListIteratorOfSetListOfSetOfTransient & It);
};


%feature("shadow") TColStd_SetListOfSetOfTransient::~TColStd_SetListOfSetOfTransient %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TColStd_SetListOfSetOfTransient {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor TColStd_SetOfInteger;
class TColStd_SetOfInteger {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") TColStd_SetOfInteger;
		 TColStd_SetOfInteger ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Extent;
		Standard_Integer Extent ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsEmpty;
		Standard_Boolean IsEmpty ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	T(Standard_Integer)

Returns:
	Standard_Boolean

No detailed docstring for this function.") Add;
		Standard_Boolean Add (Standard_Integer &OutValue);
		%feature("autodoc", "Args:
	T(Standard_Integer)

Returns:
	Standard_Boolean

No detailed docstring for this function.") Remove;
		Standard_Boolean Remove (Standard_Integer &OutValue);
		%feature("autodoc", "Args:
	B(TColStd_SetOfInteger)

Returns:
	None

No detailed docstring for this function.") Union;
		void Union (const TColStd_SetOfInteger & B);
		%feature("autodoc", "Args:
	B(TColStd_SetOfInteger)

Returns:
	None

No detailed docstring for this function.") Intersection;
		void Intersection (const TColStd_SetOfInteger & B);
		%feature("autodoc", "Args:
	B(TColStd_SetOfInteger)

Returns:
	None

No detailed docstring for this function.") Difference;
		void Difference (const TColStd_SetOfInteger & B);
		%feature("autodoc", "Args:
	T(Standard_Integer)

Returns:
	Standard_Boolean

No detailed docstring for this function.") Contains;
		Standard_Boolean Contains (Standard_Integer &OutValue);
		%feature("autodoc", "Args:
	S(TColStd_SetOfInteger)

Returns:
	Standard_Boolean

No detailed docstring for this function.") IsASubset;
		Standard_Boolean IsASubset (const TColStd_SetOfInteger & S);
		%feature("autodoc", "Args:
	S(TColStd_SetOfInteger)

Returns:
	Standard_Boolean

No detailed docstring for this function.") IsAProperSubset;
		Standard_Boolean IsAProperSubset (const TColStd_SetOfInteger & S);
};


%feature("shadow") TColStd_SetOfInteger::~TColStd_SetOfInteger %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TColStd_SetOfInteger {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor TColStd_SetOfReal;
class TColStd_SetOfReal {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") TColStd_SetOfReal;
		 TColStd_SetOfReal ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Extent;
		Standard_Integer Extent ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsEmpty;
		Standard_Boolean IsEmpty ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	T(Standard_Real)

Returns:
	Standard_Boolean

No detailed docstring for this function.") Add;
		Standard_Boolean Add (Standard_Real &OutValue);
		%feature("autodoc", "Args:
	T(Standard_Real)

Returns:
	Standard_Boolean

No detailed docstring for this function.") Remove;
		Standard_Boolean Remove (Standard_Real &OutValue);
		%feature("autodoc", "Args:
	B(TColStd_SetOfReal)

Returns:
	None

No detailed docstring for this function.") Union;
		void Union (const TColStd_SetOfReal & B);
		%feature("autodoc", "Args:
	B(TColStd_SetOfReal)

Returns:
	None

No detailed docstring for this function.") Intersection;
		void Intersection (const TColStd_SetOfReal & B);
		%feature("autodoc", "Args:
	B(TColStd_SetOfReal)

Returns:
	None

No detailed docstring for this function.") Difference;
		void Difference (const TColStd_SetOfReal & B);
		%feature("autodoc", "Args:
	T(Standard_Real)

Returns:
	Standard_Boolean

No detailed docstring for this function.") Contains;
		Standard_Boolean Contains (Standard_Real &OutValue);
		%feature("autodoc", "Args:
	S(TColStd_SetOfReal)

Returns:
	Standard_Boolean

No detailed docstring for this function.") IsASubset;
		Standard_Boolean IsASubset (const TColStd_SetOfReal & S);
		%feature("autodoc", "Args:
	S(TColStd_SetOfReal)

Returns:
	Standard_Boolean

No detailed docstring for this function.") IsAProperSubset;
		Standard_Boolean IsAProperSubset (const TColStd_SetOfReal & S);
};


%feature("shadow") TColStd_SetOfReal::~TColStd_SetOfReal %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TColStd_SetOfReal {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor TColStd_SetOfTransient;
class TColStd_SetOfTransient {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") TColStd_SetOfTransient;
		 TColStd_SetOfTransient ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Extent;
		Standard_Integer Extent ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsEmpty;
		Standard_Boolean IsEmpty ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	T(Handle_Standard_Transient)

Returns:
	Standard_Boolean

No detailed docstring for this function.") Add;
		Standard_Boolean Add (const Handle_Standard_Transient & T);
		%feature("autodoc", "Args:
	T(Handle_Standard_Transient)

Returns:
	Standard_Boolean

No detailed docstring for this function.") Remove;
		Standard_Boolean Remove (const Handle_Standard_Transient & T);
		%feature("autodoc", "Args:
	B(TColStd_SetOfTransient)

Returns:
	None

No detailed docstring for this function.") Union;
		void Union (const TColStd_SetOfTransient & B);
		%feature("autodoc", "Args:
	B(TColStd_SetOfTransient)

Returns:
	None

No detailed docstring for this function.") Intersection;
		void Intersection (const TColStd_SetOfTransient & B);
		%feature("autodoc", "Args:
	B(TColStd_SetOfTransient)

Returns:
	None

No detailed docstring for this function.") Difference;
		void Difference (const TColStd_SetOfTransient & B);
		%feature("autodoc", "Args:
	T(Handle_Standard_Transient)

Returns:
	Standard_Boolean

No detailed docstring for this function.") Contains;
		Standard_Boolean Contains (const Handle_Standard_Transient & T);
		%feature("autodoc", "Args:
	S(TColStd_SetOfTransient)

Returns:
	Standard_Boolean

No detailed docstring for this function.") IsASubset;
		Standard_Boolean IsASubset (const TColStd_SetOfTransient & S);
		%feature("autodoc", "Args:
	S(TColStd_SetOfTransient)

Returns:
	Standard_Boolean

No detailed docstring for this function.") IsAProperSubset;
		Standard_Boolean IsAProperSubset (const TColStd_SetOfTransient & S);
};


%feature("shadow") TColStd_SetOfTransient::~TColStd_SetOfTransient %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TColStd_SetOfTransient {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor TColStd_StackIteratorOfStackOfInteger;
class TColStd_StackIteratorOfStackOfInteger {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") TColStd_StackIteratorOfStackOfInteger;
		 TColStd_StackIteratorOfStackOfInteger ();
		%feature("autodoc", "Args:
	S(TColStd_StackOfInteger)

Returns:
	None

No detailed docstring for this function.") TColStd_StackIteratorOfStackOfInteger;
		 TColStd_StackIteratorOfStackOfInteger (const TColStd_StackOfInteger & S);
		%feature("autodoc", "Args:
	S(TColStd_StackOfInteger)

Returns:
	None

No detailed docstring for this function.") Initialize;
		void Initialize (const TColStd_StackOfInteger & S);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") More;
		Standard_Boolean More ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Next;
		void Next ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Value;
		const Standard_Integer & Value ();
};


%feature("shadow") TColStd_StackIteratorOfStackOfInteger::~TColStd_StackIteratorOfStackOfInteger %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TColStd_StackIteratorOfStackOfInteger {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor TColStd_StackIteratorOfStackOfReal;
class TColStd_StackIteratorOfStackOfReal {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") TColStd_StackIteratorOfStackOfReal;
		 TColStd_StackIteratorOfStackOfReal ();
		%feature("autodoc", "Args:
	S(TColStd_StackOfReal)

Returns:
	None

No detailed docstring for this function.") TColStd_StackIteratorOfStackOfReal;
		 TColStd_StackIteratorOfStackOfReal (const TColStd_StackOfReal & S);
		%feature("autodoc", "Args:
	S(TColStd_StackOfReal)

Returns:
	None

No detailed docstring for this function.") Initialize;
		void Initialize (const TColStd_StackOfReal & S);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") More;
		Standard_Boolean More ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Next;
		void Next ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

No detailed docstring for this function.") Value;
		const Standard_Real & Value ();
};


%feature("shadow") TColStd_StackIteratorOfStackOfReal::~TColStd_StackIteratorOfStackOfReal %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TColStd_StackIteratorOfStackOfReal {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor TColStd_StackIteratorOfStackOfTransient;
class TColStd_StackIteratorOfStackOfTransient {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") TColStd_StackIteratorOfStackOfTransient;
		 TColStd_StackIteratorOfStackOfTransient ();
		%feature("autodoc", "Args:
	S(TColStd_StackOfTransient)

Returns:
	None

No detailed docstring for this function.") TColStd_StackIteratorOfStackOfTransient;
		 TColStd_StackIteratorOfStackOfTransient (const TColStd_StackOfTransient & S);
		%feature("autodoc", "Args:
	S(TColStd_StackOfTransient)

Returns:
	None

No detailed docstring for this function.") Initialize;
		void Initialize (const TColStd_StackOfTransient & S);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") More;
		Standard_Boolean More ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Next;
		void Next ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Standard_Transient

No detailed docstring for this function.") Value;
		const Handle_Standard_Transient & Value ();
};


%feature("shadow") TColStd_StackIteratorOfStackOfTransient::~TColStd_StackIteratorOfStackOfTransient %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TColStd_StackIteratorOfStackOfTransient {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor TColStd_StackNodeOfStackOfInteger;
class TColStd_StackNodeOfStackOfInteger : public TCollection_MapNode {
	public:
		%feature("autodoc", "Args:
	I(Standard_Integer)
	n(TCollection_MapNodePtr)

Returns:
	None

No detailed docstring for this function.") TColStd_StackNodeOfStackOfInteger;
		 TColStd_StackNodeOfStackOfInteger (Standard_Integer &OutValue,const TCollection_MapNodePtr & n);

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


%feature("shadow") TColStd_StackNodeOfStackOfInteger::~TColStd_StackNodeOfStackOfInteger %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TColStd_StackNodeOfStackOfInteger {
	void _kill_pointed() {
		delete $self;
	}
};
%extend TColStd_StackNodeOfStackOfInteger {
	Handle_TColStd_StackNodeOfStackOfInteger GetHandle() {
	return *(Handle_TColStd_StackNodeOfStackOfInteger*) &$self;
	}
};

%nodefaultctor Handle_TColStd_StackNodeOfStackOfInteger;
class Handle_TColStd_StackNodeOfStackOfInteger : public Handle_TCollection_MapNode {

    public:
        // constructors
        Handle_TColStd_StackNodeOfStackOfInteger();
        Handle_TColStd_StackNodeOfStackOfInteger(const Handle_TColStd_StackNodeOfStackOfInteger &aHandle);
        Handle_TColStd_StackNodeOfStackOfInteger(const TColStd_StackNodeOfStackOfInteger *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_TColStd_StackNodeOfStackOfInteger DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_TColStd_StackNodeOfStackOfInteger {
    TColStd_StackNodeOfStackOfInteger* GetObject() {
    return (TColStd_StackNodeOfStackOfInteger*)$self->Access();
    }
};
%feature("shadow") Handle_TColStd_StackNodeOfStackOfInteger::~Handle_TColStd_StackNodeOfStackOfInteger %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_TColStd_StackNodeOfStackOfInteger {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor TColStd_StackNodeOfStackOfReal;
class TColStd_StackNodeOfStackOfReal : public TCollection_MapNode {
	public:
		%feature("autodoc", "Args:
	I(Standard_Real)
	n(TCollection_MapNodePtr)

Returns:
	None

No detailed docstring for this function.") TColStd_StackNodeOfStackOfReal;
		 TColStd_StackNodeOfStackOfReal (Standard_Real &OutValue,const TCollection_MapNodePtr & n);

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


%feature("shadow") TColStd_StackNodeOfStackOfReal::~TColStd_StackNodeOfStackOfReal %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TColStd_StackNodeOfStackOfReal {
	void _kill_pointed() {
		delete $self;
	}
};
%extend TColStd_StackNodeOfStackOfReal {
	Handle_TColStd_StackNodeOfStackOfReal GetHandle() {
	return *(Handle_TColStd_StackNodeOfStackOfReal*) &$self;
	}
};

%nodefaultctor Handle_TColStd_StackNodeOfStackOfReal;
class Handle_TColStd_StackNodeOfStackOfReal : public Handle_TCollection_MapNode {

    public:
        // constructors
        Handle_TColStd_StackNodeOfStackOfReal();
        Handle_TColStd_StackNodeOfStackOfReal(const Handle_TColStd_StackNodeOfStackOfReal &aHandle);
        Handle_TColStd_StackNodeOfStackOfReal(const TColStd_StackNodeOfStackOfReal *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_TColStd_StackNodeOfStackOfReal DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_TColStd_StackNodeOfStackOfReal {
    TColStd_StackNodeOfStackOfReal* GetObject() {
    return (TColStd_StackNodeOfStackOfReal*)$self->Access();
    }
};
%feature("shadow") Handle_TColStd_StackNodeOfStackOfReal::~Handle_TColStd_StackNodeOfStackOfReal %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_TColStd_StackNodeOfStackOfReal {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor TColStd_StackNodeOfStackOfTransient;
class TColStd_StackNodeOfStackOfTransient : public TCollection_MapNode {
	public:
		%feature("autodoc", "Args:
	I(Handle_Standard_Transient)
	n(TCollection_MapNodePtr)

Returns:
	None

No detailed docstring for this function.") TColStd_StackNodeOfStackOfTransient;
		 TColStd_StackNodeOfStackOfTransient (const Handle_Standard_Transient & I,const TCollection_MapNodePtr & n);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Standard_Transient

No detailed docstring for this function.") Value;
		Handle_Standard_Transient & Value ();
};


%feature("shadow") TColStd_StackNodeOfStackOfTransient::~TColStd_StackNodeOfStackOfTransient %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TColStd_StackNodeOfStackOfTransient {
	void _kill_pointed() {
		delete $self;
	}
};
%extend TColStd_StackNodeOfStackOfTransient {
	Handle_TColStd_StackNodeOfStackOfTransient GetHandle() {
	return *(Handle_TColStd_StackNodeOfStackOfTransient*) &$self;
	}
};

%nodefaultctor Handle_TColStd_StackNodeOfStackOfTransient;
class Handle_TColStd_StackNodeOfStackOfTransient : public Handle_TCollection_MapNode {

    public:
        // constructors
        Handle_TColStd_StackNodeOfStackOfTransient();
        Handle_TColStd_StackNodeOfStackOfTransient(const Handle_TColStd_StackNodeOfStackOfTransient &aHandle);
        Handle_TColStd_StackNodeOfStackOfTransient(const TColStd_StackNodeOfStackOfTransient *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_TColStd_StackNodeOfStackOfTransient DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_TColStd_StackNodeOfStackOfTransient {
    TColStd_StackNodeOfStackOfTransient* GetObject() {
    return (TColStd_StackNodeOfStackOfTransient*)$self->Access();
    }
};
%feature("shadow") Handle_TColStd_StackNodeOfStackOfTransient::~Handle_TColStd_StackNodeOfStackOfTransient %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_TColStd_StackNodeOfStackOfTransient {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor TColStd_StackOfInteger;
class TColStd_StackOfInteger {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") TColStd_StackOfInteger;
		 TColStd_StackOfInteger ();
		%feature("autodoc", "Args:
	Other(TColStd_StackOfInteger)

Returns:
	TColStd_StackOfInteger

No detailed docstring for this function.") Assign;
		const TColStd_StackOfInteger & Assign (const TColStd_StackOfInteger & Other);
		%feature("autodoc", "Args:
	Other(TColStd_StackOfInteger)

Returns:
	TColStd_StackOfInteger

No detailed docstring for this function.") operator=;
		const TColStd_StackOfInteger & operator = (const TColStd_StackOfInteger & Other);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsEmpty;
		Standard_Boolean IsEmpty ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Depth;
		Standard_Integer Depth ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Top;
		const Standard_Integer & Top ();
		%feature("autodoc", "Args:
	I(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Push;
		void Push (Standard_Integer &OutValue);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Pop;
		void Pop ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Clear;
		void Clear ();

            %feature("autodoc","1");
            %extend {
                Standard_Integer GetChangeTop() {
                return (Standard_Integer) $self->ChangeTop();
                }
            };
            %feature("autodoc","1");
            %extend {
                void SetChangeTop(Standard_Integer value ) {
                $self->ChangeTop()=value;
                }
            };
            };


%feature("shadow") TColStd_StackOfInteger::~TColStd_StackOfInteger %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TColStd_StackOfInteger {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor TColStd_StackOfReal;
class TColStd_StackOfReal {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") TColStd_StackOfReal;
		 TColStd_StackOfReal ();
		%feature("autodoc", "Args:
	Other(TColStd_StackOfReal)

Returns:
	TColStd_StackOfReal

No detailed docstring for this function.") Assign;
		const TColStd_StackOfReal & Assign (const TColStd_StackOfReal & Other);
		%feature("autodoc", "Args:
	Other(TColStd_StackOfReal)

Returns:
	TColStd_StackOfReal

No detailed docstring for this function.") operator=;
		const TColStd_StackOfReal & operator = (const TColStd_StackOfReal & Other);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsEmpty;
		Standard_Boolean IsEmpty ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Depth;
		Standard_Integer Depth ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

No detailed docstring for this function.") Top;
		const Standard_Real & Top ();
		%feature("autodoc", "Args:
	I(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Push;
		void Push (Standard_Real &OutValue);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Pop;
		void Pop ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Clear;
		void Clear ();

            %feature("autodoc","1");
            %extend {
                Standard_Real GetChangeTop() {
                return (Standard_Real) $self->ChangeTop();
                }
            };
            %feature("autodoc","1");
            %extend {
                void SetChangeTop(Standard_Real value ) {
                $self->ChangeTop()=value;
                }
            };
            };


%feature("shadow") TColStd_StackOfReal::~TColStd_StackOfReal %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TColStd_StackOfReal {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor TColStd_StackOfTransient;
class TColStd_StackOfTransient {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") TColStd_StackOfTransient;
		 TColStd_StackOfTransient ();
		%feature("autodoc", "Args:
	Other(TColStd_StackOfTransient)

Returns:
	TColStd_StackOfTransient

No detailed docstring for this function.") Assign;
		const TColStd_StackOfTransient & Assign (const TColStd_StackOfTransient & Other);
		%feature("autodoc", "Args:
	Other(TColStd_StackOfTransient)

Returns:
	TColStd_StackOfTransient

No detailed docstring for this function.") operator=;
		const TColStd_StackOfTransient & operator = (const TColStd_StackOfTransient & Other);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsEmpty;
		Standard_Boolean IsEmpty ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Depth;
		Standard_Integer Depth ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Standard_Transient

No detailed docstring for this function.") Top;
		const Handle_Standard_Transient & Top ();
		%feature("autodoc", "Args:
	I(Handle_Standard_Transient)

Returns:
	None

No detailed docstring for this function.") Push;
		void Push (const Handle_Standard_Transient & I);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Pop;
		void Pop ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Standard_Transient

No detailed docstring for this function.") ChangeTop;
		Handle_Standard_Transient & ChangeTop ();
};


%feature("shadow") TColStd_StackOfTransient::~TColStd_StackOfTransient %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TColStd_StackOfTransient {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor TColStd_StdMapNodeOfMapOfAsciiString;
class TColStd_StdMapNodeOfMapOfAsciiString : public TCollection_MapNode {
	public:
		%feature("autodoc", "Args:
	K(TCollection_AsciiString)
	n(TCollection_MapNodePtr)

Returns:
	None

No detailed docstring for this function.") TColStd_StdMapNodeOfMapOfAsciiString;
		 TColStd_StdMapNodeOfMapOfAsciiString (const TCollection_AsciiString & K,const TCollection_MapNodePtr & n);
		%feature("autodoc", "Args:
	None
Returns:
	TCollection_AsciiString

No detailed docstring for this function.") Key;
		TCollection_AsciiString & Key ();
};


%feature("shadow") TColStd_StdMapNodeOfMapOfAsciiString::~TColStd_StdMapNodeOfMapOfAsciiString %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TColStd_StdMapNodeOfMapOfAsciiString {
	void _kill_pointed() {
		delete $self;
	}
};
%extend TColStd_StdMapNodeOfMapOfAsciiString {
	Handle_TColStd_StdMapNodeOfMapOfAsciiString GetHandle() {
	return *(Handle_TColStd_StdMapNodeOfMapOfAsciiString*) &$self;
	}
};

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
    TColStd_StdMapNodeOfMapOfAsciiString* GetObject() {
    return (TColStd_StdMapNodeOfMapOfAsciiString*)$self->Access();
    }
};
%feature("shadow") Handle_TColStd_StdMapNodeOfMapOfAsciiString::~Handle_TColStd_StdMapNodeOfMapOfAsciiString %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_TColStd_StdMapNodeOfMapOfAsciiString {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor TColStd_StdMapNodeOfMapOfInteger;
class TColStd_StdMapNodeOfMapOfInteger : public TCollection_MapNode {
	public:
		%feature("autodoc", "Args:
	K(Standard_Integer)
	n(TCollection_MapNodePtr)

Returns:
	None

No detailed docstring for this function.") TColStd_StdMapNodeOfMapOfInteger;
		 TColStd_StdMapNodeOfMapOfInteger (Standard_Integer &OutValue,const TCollection_MapNodePtr & n);

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


%feature("shadow") TColStd_StdMapNodeOfMapOfInteger::~TColStd_StdMapNodeOfMapOfInteger %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TColStd_StdMapNodeOfMapOfInteger {
	void _kill_pointed() {
		delete $self;
	}
};
%extend TColStd_StdMapNodeOfMapOfInteger {
	Handle_TColStd_StdMapNodeOfMapOfInteger GetHandle() {
	return *(Handle_TColStd_StdMapNodeOfMapOfInteger*) &$self;
	}
};

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
    TColStd_StdMapNodeOfMapOfInteger* GetObject() {
    return (TColStd_StdMapNodeOfMapOfInteger*)$self->Access();
    }
};
%feature("shadow") Handle_TColStd_StdMapNodeOfMapOfInteger::~Handle_TColStd_StdMapNodeOfMapOfInteger %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_TColStd_StdMapNodeOfMapOfInteger {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor TColStd_StdMapNodeOfMapOfReal;
class TColStd_StdMapNodeOfMapOfReal : public TCollection_MapNode {
	public:
		%feature("autodoc", "Args:
	K(Standard_Real)
	n(TCollection_MapNodePtr)

Returns:
	None

No detailed docstring for this function.") TColStd_StdMapNodeOfMapOfReal;
		 TColStd_StdMapNodeOfMapOfReal (Standard_Real &OutValue,const TCollection_MapNodePtr & n);

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


%feature("shadow") TColStd_StdMapNodeOfMapOfReal::~TColStd_StdMapNodeOfMapOfReal %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TColStd_StdMapNodeOfMapOfReal {
	void _kill_pointed() {
		delete $self;
	}
};
%extend TColStd_StdMapNodeOfMapOfReal {
	Handle_TColStd_StdMapNodeOfMapOfReal GetHandle() {
	return *(Handle_TColStd_StdMapNodeOfMapOfReal*) &$self;
	}
};

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
    TColStd_StdMapNodeOfMapOfReal* GetObject() {
    return (TColStd_StdMapNodeOfMapOfReal*)$self->Access();
    }
};
%feature("shadow") Handle_TColStd_StdMapNodeOfMapOfReal::~Handle_TColStd_StdMapNodeOfMapOfReal %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_TColStd_StdMapNodeOfMapOfReal {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor TColStd_StdMapNodeOfMapOfTransient;
class TColStd_StdMapNodeOfMapOfTransient : public TCollection_MapNode {
	public:
		%feature("autodoc", "Args:
	K(Handle_Standard_Transient)
	n(TCollection_MapNodePtr)

Returns:
	None

No detailed docstring for this function.") TColStd_StdMapNodeOfMapOfTransient;
		 TColStd_StdMapNodeOfMapOfTransient (const Handle_Standard_Transient & K,const TCollection_MapNodePtr & n);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Standard_Transient

No detailed docstring for this function.") Key;
		Handle_Standard_Transient & Key ();
};


%feature("shadow") TColStd_StdMapNodeOfMapOfTransient::~TColStd_StdMapNodeOfMapOfTransient %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TColStd_StdMapNodeOfMapOfTransient {
	void _kill_pointed() {
		delete $self;
	}
};
%extend TColStd_StdMapNodeOfMapOfTransient {
	Handle_TColStd_StdMapNodeOfMapOfTransient GetHandle() {
	return *(Handle_TColStd_StdMapNodeOfMapOfTransient*) &$self;
	}
};

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
    TColStd_StdMapNodeOfMapOfTransient* GetObject() {
    return (TColStd_StdMapNodeOfMapOfTransient*)$self->Access();
    }
};
%feature("shadow") Handle_TColStd_StdMapNodeOfMapOfTransient::~Handle_TColStd_StdMapNodeOfMapOfTransient %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_TColStd_StdMapNodeOfMapOfTransient {
    void _kill_pointed() {
        delete $self;
    }
};

