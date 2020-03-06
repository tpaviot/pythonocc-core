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
%define TDATASTDDOCSTRING
"TDataStd module, see official documentation at
https://www.opencascade.com/doc/occt-7.4.0/refman/html/package_tdatastd.html"
%enddef
%module (package="OCC.Core", docstring=TDATASTDDOCSTRING) TDataStd


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
#include<TDataStd_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<TColStd_module.hxx>
#include<TDF_module.hxx>
#include<TCollection_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import TColStd.i
%import TDF.i
%import TCollection.i

%pythoncode {
from OCC.Core.Exception import *
};

/* public enums */
enum TDataStd_RealEnum {
	TDataStd_SCALAR = 0,
	TDataStd_LENGTH = 1,
	TDataStd_ANGULAR = 2,
};

/* end public enums declaration */

/* python proy classes for enums */
%pythoncode {

class TDataStd_RealEnum:
	TDataStd_SCALAR = 0
	TDataStd_LENGTH = 1
	TDataStd_ANGULAR = 2
};
/* end python proxy for enums */

/* handles */
%wrap_handle(TDataStd_AsciiString)
%wrap_handle(TDataStd_BooleanArray)
%wrap_handle(TDataStd_BooleanList)
%wrap_handle(TDataStd_ByteArray)
%wrap_handle(TDataStd_Comment)
%wrap_handle(TDataStd_Current)
%wrap_handle(TDataStd_DeltaOnModificationOfByteArray)
%wrap_handle(TDataStd_DeltaOnModificationOfExtStringArray)
%wrap_handle(TDataStd_DeltaOnModificationOfIntArray)
%wrap_handle(TDataStd_DeltaOnModificationOfIntPackedMap)
%wrap_handle(TDataStd_DeltaOnModificationOfRealArray)
%wrap_handle(TDataStd_Directory)
%wrap_handle(TDataStd_Expression)
%wrap_handle(TDataStd_ExtStringArray)
%wrap_handle(TDataStd_ExtStringList)
%wrap_handle(TDataStd_HDataMapOfStringByte)
%wrap_handle(TDataStd_HDataMapOfStringHArray1OfInteger)
%wrap_handle(TDataStd_HDataMapOfStringHArray1OfReal)
%wrap_handle(TDataStd_HDataMapOfStringInteger)
%wrap_handle(TDataStd_HDataMapOfStringReal)
%wrap_handle(TDataStd_HDataMapOfStringString)
%wrap_handle(TDataStd_IntPackedMap)
%wrap_handle(TDataStd_Integer)
%wrap_handle(TDataStd_IntegerArray)
%wrap_handle(TDataStd_IntegerList)
%wrap_handle(TDataStd_Name)
%wrap_handle(TDataStd_NamedData)
%wrap_handle(TDataStd_NoteBook)
%wrap_handle(TDataStd_Real)
%wrap_handle(TDataStd_RealArray)
%wrap_handle(TDataStd_RealList)
%wrap_handle(TDataStd_ReferenceArray)
%wrap_handle(TDataStd_ReferenceList)
%wrap_handle(TDataStd_Relation)
%wrap_handle(TDataStd_Tick)
%wrap_handle(TDataStd_TreeNode)
%wrap_handle(TDataStd_UAttribute)
%wrap_handle(TDataStd_Variable)
%wrap_handle(TDataStd_HLabelArray1)
/* end handles declaration */

/* templates */
%template(TDataStd_DataMapOfStringByte) NCollection_DataMap<TCollection_ExtendedString,Standard_Byte,TCollection_ExtendedString>;
%template(TDataStd_DataMapOfStringHArray1OfInteger) NCollection_DataMap<TCollection_ExtendedString,opencascade::handle<TColStd_HArray1OfInteger>,TCollection_ExtendedString>;
%template(TDataStd_DataMapOfStringHArray1OfReal) NCollection_DataMap<TCollection_ExtendedString,opencascade::handle<TColStd_HArray1OfReal>,TCollection_ExtendedString>;
%template(TDataStd_DataMapOfStringReal) NCollection_DataMap<TCollection_ExtendedString,Standard_Real,TCollection_ExtendedString>;
%template(TDataStd_DataMapOfStringString) NCollection_DataMap<TCollection_ExtendedString,TCollection_ExtendedString,TCollection_ExtendedString>;
%template(TDataStd_LabelArray1) NCollection_Array1<TDF_Label>;

%extend NCollection_Array1<TDF_Label> {
    %pythoncode {
    def __getitem__(self, index):
        if index + self.Lower() > self.Upper():
            raise IndexError("index out of range")
        else:
            return self.Value(index + self.Lower())

    def __setitem__(self, index, value):
        if index + self.Lower() > self.Upper():
            raise IndexError("index out of range")
        else:
            self.SetValue(index + self.Lower(), value)

    def __len__(self):
        return self.Length()

    def __iter__(self):
        self.low = self.Lower()
        self.up = self.Upper()
        self.current = self.Lower() - 1
        return self

    def next(self):
        if self.current >= self.Upper():
            raise StopIteration
        else:
            self.current += 1
        return self.Value(self.current)

    __next__ = next
    }
};
%template(TDataStd_ListIteratorOfListOfByte) NCollection_TListIterator<Standard_Byte>;
%template(TDataStd_ListIteratorOfListOfExtendedString) NCollection_TListIterator<TCollection_ExtendedString>;
%template(TDataStd_ListOfByte) NCollection_List<Standard_Byte>;
%template(TDataStd_ListOfExtendedString) NCollection_List<TCollection_ExtendedString>;
/* end templates declaration */

/* typedefs */
typedef NCollection_DataMap<TCollection_ExtendedString, Standard_Byte, TCollection_ExtendedString>::Iterator TDataStd_DataMapIteratorOfDataMapOfStringByte;
typedef NCollection_DataMap<TCollection_ExtendedString, opencascade::handle<TColStd_HArray1OfInteger>, TCollection_ExtendedString>::Iterator TDataStd_DataMapIteratorOfDataMapOfStringHArray1OfInteger;
typedef NCollection_DataMap<TCollection_ExtendedString, opencascade::handle<TColStd_HArray1OfReal>, TCollection_ExtendedString>::Iterator TDataStd_DataMapIteratorOfDataMapOfStringHArray1OfReal;
typedef NCollection_DataMap<TCollection_ExtendedString, Standard_Real, TCollection_ExtendedString>::Iterator TDataStd_DataMapIteratorOfDataMapOfStringReal;
typedef NCollection_DataMap<TCollection_ExtendedString, TCollection_ExtendedString, TCollection_ExtendedString>::Iterator TDataStd_DataMapIteratorOfDataMapOfStringString;
typedef NCollection_DataMap<TCollection_ExtendedString, Standard_Byte, TCollection_ExtendedString> TDataStd_DataMapOfStringByte;
typedef NCollection_DataMap<TCollection_ExtendedString, opencascade::handle<TColStd_HArray1OfInteger>, TCollection_ExtendedString> TDataStd_DataMapOfStringHArray1OfInteger;
typedef NCollection_DataMap<TCollection_ExtendedString, opencascade::handle<TColStd_HArray1OfReal>, TCollection_ExtendedString> TDataStd_DataMapOfStringHArray1OfReal;
typedef NCollection_DataMap<TCollection_ExtendedString, Standard_Real, TCollection_ExtendedString> TDataStd_DataMapOfStringReal;
typedef NCollection_DataMap<TCollection_ExtendedString, TCollection_ExtendedString, TCollection_ExtendedString> TDataStd_DataMapOfStringString;
typedef NCollection_Array1<TDF_Label> TDataStd_LabelArray1;
typedef NCollection_List<Standard_Byte>::Iterator TDataStd_ListIteratorOfListOfByte;
typedef NCollection_List<TCollection_ExtendedString>::Iterator TDataStd_ListIteratorOfListOfExtendedString;
typedef NCollection_List<Standard_Byte> TDataStd_ListOfByte;
typedef NCollection_List<TCollection_ExtendedString> TDataStd_ListOfExtendedString;
typedef TDataStd_TreeNode * TDataStd_PtrTreeNode;
/* end typedefs declaration */

/*****************
* class TDataStd *
*****************/
%rename(tdatastd) TDataStd;
class TDataStd {
	public:
		/****************** IDList ******************/
		%feature("compactdefaultargs") IDList;
		%feature("autodoc", "Appends to <anidlist> the list of the attributes ids of this package. caution: <anidlist> is not cleared before use.

Parameters
----------
anIDList: TDF_IDList

Returns
-------
None
") IDList;
		static void IDList(TDF_IDList & anIDList);

};


%extend TDataStd {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************
* class TDataStd_AsciiString *
*****************************/
class TDataStd_AsciiString : public TDF_Attribute {
	public:
		/****************** TDataStd_AsciiString ******************/
		%feature("compactdefaultargs") TDataStd_AsciiString;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") TDataStd_AsciiString;
		 TDataStd_AsciiString();


        %feature("autodoc", "1");
        %extend{
            std::string DumpToString() {
            std::stringstream s;
            self->Dump(s);
            return s.str();}
        };
		/****************** Get ******************/
		%feature("compactdefaultargs") Get;
		%feature("autodoc", "No available documentation.

Returns
-------
TCollection_AsciiString
") Get;
		const TCollection_AsciiString & Get();

		/****************** GetID ******************/
		%feature("compactdefaultargs") GetID;
		%feature("autodoc", "Class methods ============= returns the guid of the attribute.

Returns
-------
Standard_GUID
") GetID;
		static const Standard_GUID & GetID();

		/****************** ID ******************/
		%feature("compactdefaultargs") ID;
		%feature("autodoc", "No available documentation.

Returns
-------
Standard_GUID
") ID;
		const Standard_GUID & ID();

		/****************** IsEmpty ******************/
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsEmpty;
		Standard_Boolean IsEmpty();

		/****************** NewEmpty ******************/
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TDF_Attribute>
") NewEmpty;
		opencascade::handle<TDF_Attribute> NewEmpty();

		/****************** Paste ******************/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "No available documentation.

Parameters
----------
into: TDF_Attribute
RT: TDF_RelocationTable

Returns
-------
None
") Paste;
		void Paste(const opencascade::handle<TDF_Attribute> & into, const opencascade::handle<TDF_RelocationTable> & RT);

		/****************** Restore ******************/
		%feature("compactdefaultargs") Restore;
		%feature("autodoc", "No available documentation.

Parameters
----------
with: TDF_Attribute

Returns
-------
None
") Restore;
		void Restore(const opencascade::handle<TDF_Attribute> & with);

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "Finds, or creates an asciistring attribute and sets the string. the asciistring attribute is returned. asciistring methods ===================.

Parameters
----------
label: TDF_Label
string: TCollection_AsciiString

Returns
-------
opencascade::handle<TDataStd_AsciiString>
") Set;
		static opencascade::handle<TDataStd_AsciiString> Set(const TDF_Label & label, const TCollection_AsciiString & string);

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "Finds, or creates, an asciistring attribute with explicit user defined <guid> and sets <string>. the name attribute is returned. .

Parameters
----------
label: TDF_Label
guid: Standard_GUID
string: TCollection_AsciiString

Returns
-------
opencascade::handle<TDataStd_AsciiString>
") Set;
		static opencascade::handle<TDataStd_AsciiString> Set(const TDF_Label & label, const Standard_GUID & guid, const TCollection_AsciiString & string);

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: TCollection_AsciiString

Returns
-------
None
") Set;
		void Set(const TCollection_AsciiString & S);

		/****************** SetID ******************/
		%feature("compactdefaultargs") SetID;
		%feature("autodoc", "Sets the explicit user defined guid to the attribute.

Parameters
----------
guid: Standard_GUID

Returns
-------
None
") SetID;
		void SetID(const Standard_GUID & guid);

		/****************** SetID ******************/
		%feature("compactdefaultargs") SetID;
		%feature("autodoc", "Sets default guid for the attribute.

Returns
-------
None
") SetID;
		void SetID();

};


%make_alias(TDataStd_AsciiString)

%extend TDataStd_AsciiString {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************
* class TDataStd_BooleanArray *
******************************/
class TDataStd_BooleanArray : public TDF_Attribute {
	public:
		/****************** TDataStd_BooleanArray ******************/
		%feature("compactdefaultargs") TDataStd_BooleanArray;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") TDataStd_BooleanArray;
		 TDataStd_BooleanArray();


        %feature("autodoc", "1");
        %extend{
            std::string DumpToString() {
            std::stringstream s;
            self->Dump(s);
            return s.str();}
        };
		/****************** GetID ******************/
		%feature("compactdefaultargs") GetID;
		%feature("autodoc", "Static methods ============== returns an id for array.

Returns
-------
Standard_GUID
") GetID;
		static const Standard_GUID & GetID();

		/****************** ID ******************/
		%feature("compactdefaultargs") ID;
		%feature("autodoc", "No available documentation.

Returns
-------
Standard_GUID
") ID;
		const Standard_GUID & ID();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Initialize the inner array with bounds from <lower> to <upper>.

Parameters
----------
lower: int
upper: int

Returns
-------
None
") Init;
		void Init(const Standard_Integer lower, const Standard_Integer upper);

		/****************** InternalArray ******************/
		%feature("compactdefaultargs") InternalArray;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TColStd_HArray1OfByte>
") InternalArray;
		const opencascade::handle<TColStd_HArray1OfByte> & InternalArray();

		/****************** Length ******************/
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "Returns the number of elements in the array.

Returns
-------
int
") Length;
		Standard_Integer Length();

		/****************** Lower ******************/
		%feature("compactdefaultargs") Lower;
		%feature("autodoc", "Returns the lower boundary of the array.

Returns
-------
int
") Lower;
		Standard_Integer Lower();

		/****************** NewEmpty ******************/
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TDF_Attribute>
") NewEmpty;
		opencascade::handle<TDF_Attribute> NewEmpty();

		/****************** Paste ******************/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "No available documentation.

Parameters
----------
into: TDF_Attribute
RT: TDF_RelocationTable

Returns
-------
None
") Paste;
		void Paste(const opencascade::handle<TDF_Attribute> & into, const opencascade::handle<TDF_RelocationTable> & RT);

		/****************** Restore ******************/
		%feature("compactdefaultargs") Restore;
		%feature("autodoc", "No available documentation.

Parameters
----------
with: TDF_Attribute

Returns
-------
None
") Restore;
		void Restore(const opencascade::handle<TDF_Attribute> & with);

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "Finds or creates an attribute with internal boolean array.

Parameters
----------
label: TDF_Label
lower: int
upper: int

Returns
-------
opencascade::handle<TDataStd_BooleanArray>
") Set;
		static opencascade::handle<TDataStd_BooleanArray> Set(const TDF_Label & label, const Standard_Integer lower, const Standard_Integer upper);

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "Finds or creates an attribute with the array using explicit user defined <guid>.

Parameters
----------
label: TDF_Label
theGuid: Standard_GUID
lower: int
upper: int

Returns
-------
opencascade::handle<TDataStd_BooleanArray>
") Set;
		static opencascade::handle<TDataStd_BooleanArray> Set(const TDF_Label & label, const Standard_GUID & theGuid, const Standard_Integer lower, const Standard_Integer upper);

		/****************** SetID ******************/
		%feature("compactdefaultargs") SetID;
		%feature("autodoc", "Sets the explicit guid (user defined) for the attribute.

Parameters
----------
theGuid: Standard_GUID

Returns
-------
None
") SetID;
		void SetID(const Standard_GUID & theGuid);

		/****************** SetID ******************/
		%feature("compactdefaultargs") SetID;
		%feature("autodoc", "Sets default guid for the attribute.

Returns
-------
None
") SetID;
		void SetID();

		/****************** SetInternalArray ******************/
		%feature("compactdefaultargs") SetInternalArray;
		%feature("autodoc", "No available documentation.

Parameters
----------
values: TColStd_HArray1OfByte

Returns
-------
None
") SetInternalArray;
		void SetInternalArray(const opencascade::handle<TColStd_HArray1OfByte> & values);

		/****************** SetValue ******************/
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "Sets the <index>th element of the array to <value> outofrange exception is raised if <index> doesn't respect lower and upper bounds of the internal array.

Parameters
----------
index: int
value: bool

Returns
-------
None
") SetValue;
		void SetValue(const Standard_Integer index, const Standard_Boolean value);

		/****************** Upper ******************/
		%feature("compactdefaultargs") Upper;
		%feature("autodoc", "Returns the upper boundary of the array.

Returns
-------
int
") Upper;
		Standard_Integer Upper();

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Return the value of the <index>th element of the array.

Parameters
----------
Index: int

Returns
-------
bool
") Value;
		Standard_Boolean Value(const Standard_Integer Index);

};


%make_alias(TDataStd_BooleanArray)

%extend TDataStd_BooleanArray {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************
* class TDataStd_BooleanList *
*****************************/
class TDataStd_BooleanList : public TDF_Attribute {
	public:
		/****************** TDataStd_BooleanList ******************/
		%feature("compactdefaultargs") TDataStd_BooleanList;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") TDataStd_BooleanList;
		 TDataStd_BooleanList();

		/****************** Append ******************/
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "No available documentation.

Parameters
----------
value: bool

Returns
-------
None
") Append;
		void Append(const Standard_Boolean value);

		/****************** Clear ******************/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Clear;
		void Clear();


        %feature("autodoc", "1");
        %extend{
            std::string DumpToString() {
            std::stringstream s;
            self->Dump(s);
            return s.str();}
        };
		/****************** Extent ******************/
		%feature("compactdefaultargs") Extent;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") Extent;
		Standard_Integer Extent();

		/****************** First ******************/
		%feature("compactdefaultargs") First;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") First;
		Standard_Boolean First();

		/****************** GetID ******************/
		%feature("compactdefaultargs") GetID;
		%feature("autodoc", "Static methods ============== returns the id of the list of booleans attribute.

Returns
-------
Standard_GUID
") GetID;
		static const Standard_GUID & GetID();

		/****************** ID ******************/
		%feature("compactdefaultargs") ID;
		%feature("autodoc", "No available documentation.

Returns
-------
Standard_GUID
") ID;
		const Standard_GUID & ID();

		/****************** InsertAfter ******************/
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "Inserts the <value> after the <index> position. the indices start with 1 .. extent().

Parameters
----------
index: int
after_value: bool

Returns
-------
bool
") InsertAfter;
		Standard_Boolean InsertAfter(const Standard_Integer index, const Standard_Boolean after_value);

		/****************** InsertBefore ******************/
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "Inserts the <value> before the <index> position. the indices start with 1 .. extent().

Parameters
----------
index: int
before_value: bool

Returns
-------
bool
") InsertBefore;
		Standard_Boolean InsertBefore(const Standard_Integer index, const Standard_Boolean before_value);

		/****************** IsEmpty ******************/
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsEmpty;
		Standard_Boolean IsEmpty();

		/****************** Last ******************/
		%feature("compactdefaultargs") Last;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") Last;
		Standard_Boolean Last();

		/****************** List ******************/
		%feature("compactdefaultargs") List;
		%feature("autodoc", "1 - means true, 0 - means false.

Returns
-------
TDataStd_ListOfByte
") List;
		const TDataStd_ListOfByte & List();

		/****************** NewEmpty ******************/
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TDF_Attribute>
") NewEmpty;
		opencascade::handle<TDF_Attribute> NewEmpty();

		/****************** Paste ******************/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "No available documentation.

Parameters
----------
Into: TDF_Attribute
RT: TDF_RelocationTable

Returns
-------
None
") Paste;
		void Paste(const opencascade::handle<TDF_Attribute> & Into, const opencascade::handle<TDF_RelocationTable> & RT);

		/****************** Prepend ******************/
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "No available documentation.

Parameters
----------
value: bool

Returns
-------
None
") Prepend;
		void Prepend(const Standard_Boolean value);

		/****************** Remove ******************/
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "Removes a value at <index> position.

Parameters
----------
index: int

Returns
-------
bool
") Remove;
		Standard_Boolean Remove(const Standard_Integer index);

		/****************** Restore ******************/
		%feature("compactdefaultargs") Restore;
		%feature("autodoc", "No available documentation.

Parameters
----------
With: TDF_Attribute

Returns
-------
None
") Restore;
		void Restore(const opencascade::handle<TDF_Attribute> & With);

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "Finds or creates a list of boolean values attribute.

Parameters
----------
label: TDF_Label

Returns
-------
opencascade::handle<TDataStd_BooleanList>
") Set;
		static opencascade::handle<TDataStd_BooleanList> Set(const TDF_Label & label);

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "Finds or creates a list of boolean values attribute with explicit user defined <guid>.

Parameters
----------
label: TDF_Label
theGuid: Standard_GUID

Returns
-------
opencascade::handle<TDataStd_BooleanList>
") Set;
		static opencascade::handle<TDataStd_BooleanList> Set(const TDF_Label & label, const Standard_GUID & theGuid);

		/****************** SetID ******************/
		%feature("compactdefaultargs") SetID;
		%feature("autodoc", "Sets the explicit guid (user defined) for the attribute.

Parameters
----------
theGuid: Standard_GUID

Returns
-------
None
") SetID;
		void SetID(const Standard_GUID & theGuid);

		/****************** SetID ******************/
		%feature("compactdefaultargs") SetID;
		%feature("autodoc", "Sets default guid for the attribute.

Returns
-------
None
") SetID;
		void SetID();

};


%make_alias(TDataStd_BooleanList)

%extend TDataStd_BooleanList {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************
* class TDataStd_ByteArray *
***************************/
class TDataStd_ByteArray : public TDF_Attribute {
	public:
		/****************** TDataStd_ByteArray ******************/
		%feature("compactdefaultargs") TDataStd_ByteArray;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") TDataStd_ByteArray;
		 TDataStd_ByteArray();

		/****************** ChangeArray ******************/
		%feature("compactdefaultargs") ChangeArray;
		%feature("autodoc", "Sets the inner array <myvalue> of the attribute to <newarray>. if value of <newarray> differs from <myvalue>, backup performed and myvalue refers to new instance of harray1ofinteger that holds <newarray> values. if <ischeckitems> equal true each item of <newarray> will be checked with each item of <myvalue> for coincidence (to avoid backup).

Parameters
----------
newArray: TColStd_HArray1OfByte
isCheckItems: bool,optional
	default value is Standard_True

Returns
-------
None
") ChangeArray;
		void ChangeArray(const opencascade::handle<TColStd_HArray1OfByte> & newArray, const Standard_Boolean isCheckItems = Standard_True);

		/****************** DeltaOnModification ******************/
		%feature("compactdefaultargs") DeltaOnModification;
		%feature("autodoc", "Makes a deltaonmodification between <self> and <anoldattribute>.

Parameters
----------
anOldAttribute: TDF_Attribute

Returns
-------
opencascade::handle<TDF_DeltaOnModification>
") DeltaOnModification;
		virtual opencascade::handle<TDF_DeltaOnModification> DeltaOnModification(const opencascade::handle<TDF_Attribute> & anOldAttribute);


        %feature("autodoc", "1");
        %extend{
            std::string DumpToString() {
            std::stringstream s;
            self->Dump(s);
            return s.str();}
        };
		/****************** GetDelta ******************/
		%feature("compactdefaultargs") GetDelta;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") GetDelta;
		Standard_Boolean GetDelta();

		/****************** GetID ******************/
		%feature("compactdefaultargs") GetID;
		%feature("autodoc", "Static methods ============== returns an id for array.

Returns
-------
Standard_GUID
") GetID;
		static const Standard_GUID & GetID();

		/****************** ID ******************/
		%feature("compactdefaultargs") ID;
		%feature("autodoc", "No available documentation.

Returns
-------
Standard_GUID
") ID;
		const Standard_GUID & ID();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Initialize the inner array with bounds from <lower> to <upper>.

Parameters
----------
lower: int
upper: int

Returns
-------
None
") Init;
		void Init(const Standard_Integer lower, const Standard_Integer upper);

		/****************** InternalArray ******************/
		%feature("compactdefaultargs") InternalArray;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TColStd_HArray1OfByte>
") InternalArray;
		const opencascade::handle<TColStd_HArray1OfByte> & InternalArray();

		/****************** Length ******************/
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "Returns the number of elements in the array.

Returns
-------
int
") Length;
		Standard_Integer Length();

		/****************** Lower ******************/
		%feature("compactdefaultargs") Lower;
		%feature("autodoc", "Returns the lower boundary of the array.

Returns
-------
int
") Lower;
		Standard_Integer Lower();

		/****************** NewEmpty ******************/
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TDF_Attribute>
") NewEmpty;
		opencascade::handle<TDF_Attribute> NewEmpty();

		/****************** Paste ******************/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "No available documentation.

Parameters
----------
into: TDF_Attribute
RT: TDF_RelocationTable

Returns
-------
None
") Paste;
		void Paste(const opencascade::handle<TDF_Attribute> & into, const opencascade::handle<TDF_RelocationTable> & RT);

		/****************** Restore ******************/
		%feature("compactdefaultargs") Restore;
		%feature("autodoc", "No available documentation.

Parameters
----------
with: TDF_Attribute

Returns
-------
None
") Restore;
		void Restore(const opencascade::handle<TDF_Attribute> & with);

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "Finds or creates an attribute with the array on the specified label. if <isdelta> == false, defaultdeltaonmodification is used. if <isdelta> == true, deltaonmodification of the current attribute is used. if attribute is already set, all input parameters are refused and the found attribute is returned.

Parameters
----------
label: TDF_Label
lower: int
upper: int
isDelta: bool,optional
	default value is Standard_False

Returns
-------
opencascade::handle<TDataStd_ByteArray>
") Set;
		static opencascade::handle<TDataStd_ByteArray> Set(const TDF_Label & label, const Standard_Integer lower, const Standard_Integer upper, const Standard_Boolean isDelta = Standard_False);

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "Finds or creates an attribute with byte array and explicit user defined <guid> on the specified label.

Parameters
----------
label: TDF_Label
theGuid: Standard_GUID
lower: int
upper: int
isDelta: bool,optional
	default value is Standard_False

Returns
-------
opencascade::handle<TDataStd_ByteArray>
") Set;
		static opencascade::handle<TDataStd_ByteArray> Set(const TDF_Label & label, const Standard_GUID & theGuid, const Standard_Integer lower, const Standard_Integer upper, const Standard_Boolean isDelta = Standard_False);

		/****************** SetDelta ******************/
		%feature("compactdefaultargs") SetDelta;
		%feature("autodoc", "For internal use only!.

Parameters
----------
isDelta: bool

Returns
-------
None
") SetDelta;
		void SetDelta(const Standard_Boolean isDelta);

		/****************** SetID ******************/
		%feature("compactdefaultargs") SetID;
		%feature("autodoc", "Sets the explicit guid (user defined) for the attribute.

Parameters
----------
theGuid: Standard_GUID

Returns
-------
None
") SetID;
		void SetID(const Standard_GUID & theGuid);

		/****************** SetID ******************/
		%feature("compactdefaultargs") SetID;
		%feature("autodoc", "Sets default guid for the attribute.

Returns
-------
None
") SetID;
		void SetID();

		/****************** SetValue ******************/
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "Sets the <index>th element of the array to <value> outofrange exception is raised if <index> doesn't respect lower and upper bounds of the internal array.

Parameters
----------
index: int
value: Standard_Byte

Returns
-------
None
") SetValue;
		void SetValue(const Standard_Integer index, const Standard_Byte value);

		/****************** Upper ******************/
		%feature("compactdefaultargs") Upper;
		%feature("autodoc", "Returns the upper boundary of the array.

Returns
-------
int
") Upper;
		Standard_Integer Upper();

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Return the value of the <index>th element of the array.

Parameters
----------
Index: int

Returns
-------
Standard_Byte
") Value;
		Standard_Byte Value(const Standard_Integer Index);

};


%make_alias(TDataStd_ByteArray)

%extend TDataStd_ByteArray {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************************
* class TDataStd_ChildNodeIterator *
***********************************/
class TDataStd_ChildNodeIterator {
	public:
		/****************** TDataStd_ChildNodeIterator ******************/
		%feature("compactdefaultargs") TDataStd_ChildNodeIterator;
		%feature("autodoc", "Creates an empty iterator.

Returns
-------
None
") TDataStd_ChildNodeIterator;
		 TDataStd_ChildNodeIterator();

		/****************** TDataStd_ChildNodeIterator ******************/
		%feature("compactdefaultargs") TDataStd_ChildNodeIterator;
		%feature("autodoc", "Iterates on the childstepren of the given step. if <alllevels> option is set to true, it explores not only the first, but all the sub step levels.

Parameters
----------
aTreeNode: TDataStd_TreeNode
allLevels: bool,optional
	default value is Standard_False

Returns
-------
None
") TDataStd_ChildNodeIterator;
		 TDataStd_ChildNodeIterator(const opencascade::handle<TDataStd_TreeNode> & aTreeNode, const Standard_Boolean allLevels = Standard_False);

		/****************** Initialize ******************/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "Initializes the iteration on the children step of the given step. if <alllevels> option is set to true, it explores not only the first, but all the sub step levels.

Parameters
----------
aTreeNode: TDataStd_TreeNode
allLevels: bool,optional
	default value is Standard_False

Returns
-------
None
") Initialize;
		void Initialize(const opencascade::handle<TDataStd_TreeNode> & aTreeNode, const Standard_Boolean allLevels = Standard_False);

		/****************** More ******************/
		%feature("compactdefaultargs") More;
		%feature("autodoc", "Returns true if there is a current item in the iteration.

Returns
-------
bool
") More;
		Standard_Boolean More();

		/****************** Next ******************/
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "Move to the next item.

Returns
-------
None
") Next;
		void Next();

		/****************** NextBrother ******************/
		%feature("compactdefaultargs") NextBrother;
		%feature("autodoc", "Move to the next brother. if there is none, go up etc. this method is interesting only with 'alllevels' behavior, because it avoids to explore the current step childstepren.

Returns
-------
None
") NextBrother;
		void NextBrother();

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Returns the current item; a null step if there is no one.

Returns
-------
opencascade::handle<TDataStd_TreeNode>
") Value;
		const opencascade::handle<TDataStd_TreeNode> & Value();

};


%extend TDataStd_ChildNodeIterator {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************
* class TDataStd_Comment *
*************************/
class TDataStd_Comment : public TDF_Attribute {
	public:
		/****************** TDataStd_Comment ******************/
		%feature("compactdefaultargs") TDataStd_Comment;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") TDataStd_Comment;
		 TDataStd_Comment();

		/****************** AfterRetrieval ******************/
		%feature("compactdefaultargs") AfterRetrieval;
		%feature("autodoc", "No available documentation.

Parameters
----------
forceIt: bool,optional
	default value is Standard_False

Returns
-------
bool
") AfterRetrieval;
		Standard_Boolean AfterRetrieval(const Standard_Boolean forceIt = Standard_False);


        %feature("autodoc", "1");
        %extend{
            std::string DumpToString() {
            std::stringstream s;
            self->Dump(s);
            return s.str();}
        };
		/****************** Get ******************/
		%feature("compactdefaultargs") Get;
		%feature("autodoc", "Returns the comment attribute.

Returns
-------
TCollection_ExtendedString
") Get;
		const TCollection_ExtendedString & Get();

		/****************** GetID ******************/
		%feature("compactdefaultargs") GetID;
		%feature("autodoc", "Class methods ============= returns the guid for comments.

Returns
-------
Standard_GUID
") GetID;
		static const Standard_GUID & GetID();

		/****************** ID ******************/
		%feature("compactdefaultargs") ID;
		%feature("autodoc", "No available documentation.

Returns
-------
Standard_GUID
") ID;
		const Standard_GUID & ID();

		/****************** NewEmpty ******************/
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TDF_Attribute>
") NewEmpty;
		opencascade::handle<TDF_Attribute> NewEmpty();

		/****************** Paste ******************/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "No available documentation.

Parameters
----------
into: TDF_Attribute
RT: TDF_RelocationTable

Returns
-------
None
") Paste;
		void Paste(const opencascade::handle<TDF_Attribute> & into, const opencascade::handle<TDF_RelocationTable> & RT);

		/****************** Restore ******************/
		%feature("compactdefaultargs") Restore;
		%feature("autodoc", "No available documentation.

Parameters
----------
with: TDF_Attribute

Returns
-------
None
") Restore;
		void Restore(const opencascade::handle<TDF_Attribute> & with);

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "Find, or create a comment attribute. the comment attribute is returned.

Parameters
----------
label: TDF_Label

Returns
-------
opencascade::handle<TDataStd_Comment>
") Set;
		static opencascade::handle<TDataStd_Comment> Set(const TDF_Label & label);

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "Finds, or creates a comment attribute and sets the string. the comment attribute is returned. comment methods ============.

Parameters
----------
label: TDF_Label
string: TCollection_ExtendedString

Returns
-------
opencascade::handle<TDataStd_Comment>
") Set;
		static opencascade::handle<TDataStd_Comment> Set(const TDF_Label & label, const TCollection_ExtendedString & string);

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: TCollection_ExtendedString

Returns
-------
None
") Set;
		void Set(const TCollection_ExtendedString & S);

};


%make_alias(TDataStd_Comment)

%extend TDataStd_Comment {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************
* class TDataStd_Current *
*************************/
class TDataStd_Current : public TDF_Attribute {
	public:
		/****************** TDataStd_Current ******************/
		%feature("compactdefaultargs") TDataStd_Current;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") TDataStd_Current;
		 TDataStd_Current();


        %feature("autodoc", "1");
        %extend{
            std::string DumpToString() {
            std::stringstream s;
            self->Dump(s);
            return s.str();}
        };
		/****************** Get ******************/
		%feature("compactdefaultargs") Get;
		%feature("autodoc", "Returns current of <acces> framework. raise if (!has).

Parameters
----------
acces: TDF_Label

Returns
-------
TDF_Label
") Get;
		static TDF_Label Get(const TDF_Label & acces);

		/****************** GetID ******************/
		%feature("compactdefaultargs") GetID;
		%feature("autodoc", "Class methods =============.

Returns
-------
Standard_GUID
") GetID;
		static const Standard_GUID & GetID();

		/****************** GetLabel ******************/
		%feature("compactdefaultargs") GetLabel;
		%feature("autodoc", "No available documentation.

Returns
-------
TDF_Label
") GetLabel;
		TDF_Label GetLabel();

		/****************** Has ******************/
		%feature("compactdefaultargs") Has;
		%feature("autodoc", "Returns true if a current label is managed in <acces> framework. class methods =============.

Parameters
----------
acces: TDF_Label

Returns
-------
bool
") Has;
		static Standard_Boolean Has(const TDF_Label & acces);

		/****************** ID ******************/
		%feature("compactdefaultargs") ID;
		%feature("autodoc", "No available documentation.

Returns
-------
Standard_GUID
") ID;
		const Standard_GUID & ID();

		/****************** NewEmpty ******************/
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TDF_Attribute>
") NewEmpty;
		opencascade::handle<TDF_Attribute> NewEmpty();

		/****************** Paste ******************/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "No available documentation.

Parameters
----------
Into: TDF_Attribute
RT: TDF_RelocationTable

Returns
-------
None
") Paste;
		void Paste(const opencascade::handle<TDF_Attribute> & Into, const opencascade::handle<TDF_RelocationTable> & RT);

		/****************** Restore ******************/
		%feature("compactdefaultargs") Restore;
		%feature("autodoc", "No available documentation.

Parameters
----------
With: TDF_Attribute

Returns
-------
None
") Restore;
		void Restore(const opencascade::handle<TDF_Attribute> & With);

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "Set <l> as current of <l> framework.

Parameters
----------
L: TDF_Label

Returns
-------
None
") Set;
		static void Set(const TDF_Label & L);

		/****************** SetLabel ******************/
		%feature("compactdefaultargs") SetLabel;
		%feature("autodoc", "No available documentation.

Parameters
----------
current: TDF_Label

Returns
-------
None
") SetLabel;
		void SetLabel(const TDF_Label & current);

};


%make_alias(TDataStd_Current)

%extend TDataStd_Current {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************************************
* class TDataStd_DeltaOnModificationOfByteArray *
************************************************/
class TDataStd_DeltaOnModificationOfByteArray : public TDF_DeltaOnModification {
	public:
		/****************** TDataStd_DeltaOnModificationOfByteArray ******************/
		%feature("compactdefaultargs") TDataStd_DeltaOnModificationOfByteArray;
		%feature("autodoc", "Initializes a tdf_deltaonmodification.

Parameters
----------
Arr: TDataStd_ByteArray

Returns
-------
None
") TDataStd_DeltaOnModificationOfByteArray;
		 TDataStd_DeltaOnModificationOfByteArray(const opencascade::handle<TDataStd_ByteArray> & Arr);

		/****************** Apply ******************/
		%feature("compactdefaultargs") Apply;
		%feature("autodoc", "Applies the delta to the attribute.

Returns
-------
None
") Apply;
		virtual void Apply();

};


%make_alias(TDataStd_DeltaOnModificationOfByteArray)

%extend TDataStd_DeltaOnModificationOfByteArray {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************************************
* class TDataStd_DeltaOnModificationOfExtStringArray *
*****************************************************/
class TDataStd_DeltaOnModificationOfExtStringArray : public TDF_DeltaOnModification {
	public:
		/****************** TDataStd_DeltaOnModificationOfExtStringArray ******************/
		%feature("compactdefaultargs") TDataStd_DeltaOnModificationOfExtStringArray;
		%feature("autodoc", "Initializes a tdf_deltaonmodification.

Parameters
----------
Arr: TDataStd_ExtStringArray

Returns
-------
None
") TDataStd_DeltaOnModificationOfExtStringArray;
		 TDataStd_DeltaOnModificationOfExtStringArray(const opencascade::handle<TDataStd_ExtStringArray> & Arr);

		/****************** Apply ******************/
		%feature("compactdefaultargs") Apply;
		%feature("autodoc", "Applies the delta to the attribute.

Returns
-------
None
") Apply;
		virtual void Apply();

};


%make_alias(TDataStd_DeltaOnModificationOfExtStringArray)

%extend TDataStd_DeltaOnModificationOfExtStringArray {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************************************
* class TDataStd_DeltaOnModificationOfIntArray *
***********************************************/
class TDataStd_DeltaOnModificationOfIntArray : public TDF_DeltaOnModification {
	public:
		/****************** TDataStd_DeltaOnModificationOfIntArray ******************/
		%feature("compactdefaultargs") TDataStd_DeltaOnModificationOfIntArray;
		%feature("autodoc", "Initializes a tdf_deltaonmodification.

Parameters
----------
Arr: TDataStd_IntegerArray

Returns
-------
None
") TDataStd_DeltaOnModificationOfIntArray;
		 TDataStd_DeltaOnModificationOfIntArray(const opencascade::handle<TDataStd_IntegerArray> & Arr);

		/****************** Apply ******************/
		%feature("compactdefaultargs") Apply;
		%feature("autodoc", "Applies the delta to the attribute.

Returns
-------
None
") Apply;
		virtual void Apply();

};


%make_alias(TDataStd_DeltaOnModificationOfIntArray)

%extend TDataStd_DeltaOnModificationOfIntArray {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************************************
* class TDataStd_DeltaOnModificationOfIntPackedMap *
***************************************************/
class TDataStd_DeltaOnModificationOfIntPackedMap : public TDF_DeltaOnModification {
	public:
		/****************** TDataStd_DeltaOnModificationOfIntPackedMap ******************/
		%feature("compactdefaultargs") TDataStd_DeltaOnModificationOfIntPackedMap;
		%feature("autodoc", "Initializes a tdf_deltaonmodification.

Parameters
----------
Arr: TDataStd_IntPackedMap

Returns
-------
None
") TDataStd_DeltaOnModificationOfIntPackedMap;
		 TDataStd_DeltaOnModificationOfIntPackedMap(const opencascade::handle<TDataStd_IntPackedMap> & Arr);

		/****************** Apply ******************/
		%feature("compactdefaultargs") Apply;
		%feature("autodoc", "Applies the delta to the attribute.

Returns
-------
None
") Apply;
		virtual void Apply();

};


%make_alias(TDataStd_DeltaOnModificationOfIntPackedMap)

%extend TDataStd_DeltaOnModificationOfIntPackedMap {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************************************
* class TDataStd_DeltaOnModificationOfRealArray *
************************************************/
class TDataStd_DeltaOnModificationOfRealArray : public TDF_DeltaOnModification {
	public:
		/****************** TDataStd_DeltaOnModificationOfRealArray ******************/
		%feature("compactdefaultargs") TDataStd_DeltaOnModificationOfRealArray;
		%feature("autodoc", "Initializes a tdf_deltaonmodification.

Parameters
----------
Arr: TDataStd_RealArray

Returns
-------
None
") TDataStd_DeltaOnModificationOfRealArray;
		 TDataStd_DeltaOnModificationOfRealArray(const opencascade::handle<TDataStd_RealArray> & Arr);

		/****************** Apply ******************/
		%feature("compactdefaultargs") Apply;
		%feature("autodoc", "Applies the delta to the attribute.

Returns
-------
None
") Apply;
		virtual void Apply();

};


%make_alias(TDataStd_DeltaOnModificationOfRealArray)

%extend TDataStd_DeltaOnModificationOfRealArray {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************
* class TDataStd_Directory *
***************************/
class TDataStd_Directory : public TDF_Attribute {
	public:
		/****************** TDataStd_Directory ******************/
		%feature("compactdefaultargs") TDataStd_Directory;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") TDataStd_Directory;
		 TDataStd_Directory();

		/****************** AddDirectory ******************/
		%feature("compactdefaultargs") AddDirectory;
		%feature("autodoc", "Creates a new sub-label and sets the sub-directory dir on that label.

Parameters
----------
dir: TDataStd_Directory

Returns
-------
opencascade::handle<TDataStd_Directory>
") AddDirectory;
		static opencascade::handle<TDataStd_Directory> AddDirectory(const opencascade::handle<TDataStd_Directory> & dir);


        %feature("autodoc", "1");
        %extend{
            std::string DumpToString() {
            std::stringstream s;
            self->Dump(s);
            return s.str();}
        };
		/****************** Find ******************/
		%feature("compactdefaultargs") Find;
		%feature("autodoc", "Class methods ============= searches for a directory attribute on the label current, or on one of the father labels of current. if a directory attribute is found, true is returned, and the attribute found is set as d.

Parameters
----------
current: TDF_Label
D: TDataStd_Directory

Returns
-------
bool
") Find;
		static Standard_Boolean Find(const TDF_Label & current, opencascade::handle<TDataStd_Directory> & D);

		/****************** GetID ******************/
		%feature("compactdefaultargs") GetID;
		%feature("autodoc", "Directory methods ===============.

Returns
-------
Standard_GUID
") GetID;
		static const Standard_GUID & GetID();

		/****************** ID ******************/
		%feature("compactdefaultargs") ID;
		%feature("autodoc", "No available documentation.

Returns
-------
Standard_GUID
") ID;
		const Standard_GUID & ID();

		/****************** MakeObjectLabel ******************/
		%feature("compactdefaultargs") MakeObjectLabel;
		%feature("autodoc", "Makes new label and returns it to insert other object attributes (sketch,part...etc...).

Parameters
----------
dir: TDataStd_Directory

Returns
-------
TDF_Label
") MakeObjectLabel;
		static TDF_Label MakeObjectLabel(const opencascade::handle<TDataStd_Directory> & dir);

		/****************** New ******************/
		%feature("compactdefaultargs") New;
		%feature("autodoc", "Creates an enpty directory attribute, located at <label>. raises if <label> has attribute.

Parameters
----------
label: TDF_Label

Returns
-------
opencascade::handle<TDataStd_Directory>
") New;
		static opencascade::handle<TDataStd_Directory> New(const TDF_Label & label);

		/****************** NewEmpty ******************/
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TDF_Attribute>
") NewEmpty;
		opencascade::handle<TDF_Attribute> NewEmpty();

		/****************** Paste ******************/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "No available documentation.

Parameters
----------
into: TDF_Attribute
RT: TDF_RelocationTable

Returns
-------
None
") Paste;
		void Paste(const opencascade::handle<TDF_Attribute> & into, const opencascade::handle<TDF_RelocationTable> & RT);

		/****************** References ******************/
		%feature("compactdefaultargs") References;
		%feature("autodoc", "No available documentation.

Parameters
----------
DS: TDF_DataSet

Returns
-------
None
") References;
		virtual void References(const opencascade::handle<TDF_DataSet> & DS);

		/****************** Restore ******************/
		%feature("compactdefaultargs") Restore;
		%feature("autodoc", "No available documentation.

Parameters
----------
with: TDF_Attribute

Returns
-------
None
") Restore;
		void Restore(const opencascade::handle<TDF_Attribute> & with);

};


%make_alias(TDataStd_Directory)

%extend TDataStd_Directory {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************
* class TDataStd_Expression *
****************************/
class TDataStd_Expression : public TDF_Attribute {
	public:
		/****************** TDataStd_Expression ******************/
		%feature("compactdefaultargs") TDataStd_Expression;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") TDataStd_Expression;
		 TDataStd_Expression();


        %feature("autodoc", "1");
        %extend{
            std::string DumpToString() {
            std::stringstream s;
            self->Dump(s);
            return s.str();}
        };
		/****************** GetExpression ******************/
		%feature("compactdefaultargs") GetExpression;
		%feature("autodoc", "No available documentation.

Returns
-------
TCollection_ExtendedString
") GetExpression;
		const TCollection_ExtendedString & GetExpression();

		/****************** GetID ******************/
		%feature("compactdefaultargs") GetID;
		%feature("autodoc", "Class methods =============.

Returns
-------
Standard_GUID
") GetID;
		static const Standard_GUID & GetID();

		/****************** GetVariables ******************/
		%feature("compactdefaultargs") GetVariables;
		%feature("autodoc", "No available documentation.

Returns
-------
TDF_AttributeList
") GetVariables;
		TDF_AttributeList & GetVariables();

		/****************** ID ******************/
		%feature("compactdefaultargs") ID;
		%feature("autodoc", "No available documentation.

Returns
-------
Standard_GUID
") ID;
		const Standard_GUID & ID();

		/****************** Name ******************/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "Build and return the expression name.

Returns
-------
TCollection_ExtendedString
") Name;
		TCollection_ExtendedString Name();

		/****************** NewEmpty ******************/
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TDF_Attribute>
") NewEmpty;
		opencascade::handle<TDF_Attribute> NewEmpty();

		/****************** Paste ******************/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "No available documentation.

Parameters
----------
Into: TDF_Attribute
RT: TDF_RelocationTable

Returns
-------
None
") Paste;
		void Paste(const opencascade::handle<TDF_Attribute> & Into, const opencascade::handle<TDF_RelocationTable> & RT);

		/****************** Restore ******************/
		%feature("compactdefaultargs") Restore;
		%feature("autodoc", "No available documentation.

Parameters
----------
With: TDF_Attribute

Returns
-------
None
") Restore;
		void Restore(const opencascade::handle<TDF_Attribute> & With);

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "Find, or create, an expression attribute. expressionmethods ============.

Parameters
----------
label: TDF_Label

Returns
-------
opencascade::handle<TDataStd_Expression>
") Set;
		static opencascade::handle<TDataStd_Expression> Set(const TDF_Label & label);

		/****************** SetExpression ******************/
		%feature("compactdefaultargs") SetExpression;
		%feature("autodoc", "No available documentation.

Parameters
----------
E: TCollection_ExtendedString

Returns
-------
None
") SetExpression;
		void SetExpression(const TCollection_ExtendedString & E);

};


%make_alias(TDataStd_Expression)

%extend TDataStd_Expression {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************
* class TDataStd_ExtStringArray *
********************************/
class TDataStd_ExtStringArray : public TDF_Attribute {
	public:
		/****************** TDataStd_ExtStringArray ******************/
		%feature("compactdefaultargs") TDataStd_ExtStringArray;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") TDataStd_ExtStringArray;
		 TDataStd_ExtStringArray();

		/****************** Array ******************/
		%feature("compactdefaultargs") Array;
		%feature("autodoc", "Return the inner array of the extstringarray attribute.

Returns
-------
opencascade::handle<TColStd_HArray1OfExtendedString>
") Array;
		const opencascade::handle<TColStd_HArray1OfExtendedString> & Array();

		/****************** ChangeArray ******************/
		%feature("compactdefaultargs") ChangeArray;
		%feature("autodoc", "Sets the inner array <myvalue> of the extstringarray attribute to <newarray>. if value of <newarray> differs from <myvalue>, backup performed and myvalue refers to new instance of harray1ofextendedstring that holds <newarray> values if <ischeckitems> equal true each item of <newarray> will be checked with each item of <myvalue> for coincidence (to avoid backup).

Parameters
----------
newArray: TColStd_HArray1OfExtendedString
isCheckItems: bool,optional
	default value is Standard_True

Returns
-------
None
") ChangeArray;
		void ChangeArray(const opencascade::handle<TColStd_HArray1OfExtendedString> & newArray, const Standard_Boolean isCheckItems = Standard_True);

		/****************** DeltaOnModification ******************/
		%feature("compactdefaultargs") DeltaOnModification;
		%feature("autodoc", "Makes a deltaonmodification between <self> and <anoldattribute>.

Parameters
----------
anOldAttribute: TDF_Attribute

Returns
-------
opencascade::handle<TDF_DeltaOnModification>
") DeltaOnModification;
		virtual opencascade::handle<TDF_DeltaOnModification> DeltaOnModification(const opencascade::handle<TDF_Attribute> & anOldAttribute);


        %feature("autodoc", "1");
        %extend{
            std::string DumpToString() {
            std::stringstream s;
            self->Dump(s);
            return s.str();}
        };
		/****************** GetDelta ******************/
		%feature("compactdefaultargs") GetDelta;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") GetDelta;
		Standard_Boolean GetDelta();

		/****************** GetID ******************/
		%feature("compactdefaultargs") GetID;
		%feature("autodoc", "Class methods ============= returns the guid for the attribute.

Returns
-------
Standard_GUID
") GetID;
		static const Standard_GUID & GetID();

		/****************** ID ******************/
		%feature("compactdefaultargs") ID;
		%feature("autodoc", "No available documentation.

Returns
-------
Standard_GUID
") ID;
		const Standard_GUID & ID();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Initializes the inner array with bounds from <lower> to <upper>.

Parameters
----------
lower: int
upper: int

Returns
-------
None
") Init;
		void Init(const Standard_Integer lower, const Standard_Integer upper);

		/****************** Length ******************/
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "Return the number of elements of <self>.

Returns
-------
int
") Length;
		Standard_Integer Length();

		/****************** Lower ******************/
		%feature("compactdefaultargs") Lower;
		%feature("autodoc", "Return the lower bound.

Returns
-------
int
") Lower;
		Standard_Integer Lower();

		/****************** NewEmpty ******************/
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TDF_Attribute>
") NewEmpty;
		opencascade::handle<TDF_Attribute> NewEmpty();

		/****************** Paste ******************/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "No available documentation.

Parameters
----------
Into: TDF_Attribute
RT: TDF_RelocationTable

Returns
-------
None
") Paste;
		void Paste(const opencascade::handle<TDF_Attribute> & Into, const opencascade::handle<TDF_RelocationTable> & RT);

		/****************** Restore ******************/
		%feature("compactdefaultargs") Restore;
		%feature("autodoc", "No available documentation.

Parameters
----------
With: TDF_Attribute

Returns
-------
None
") Restore;
		void Restore(const opencascade::handle<TDF_Attribute> & With);

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "Finds, or creates, an extstringarray attribute with <lower> and <upper> bounds on the specified label. if <isdelta> == false, defaultdeltaonmodification is used. if <isdelta> == true, deltaonmodification of the current attribute is used. if attribute is already set, all input parameters are refused and the found attribute is returned.

Parameters
----------
label: TDF_Label
lower: int
upper: int
isDelta: bool,optional
	default value is Standard_False

Returns
-------
opencascade::handle<TDataStd_ExtStringArray>
") Set;
		static opencascade::handle<TDataStd_ExtStringArray> Set(const TDF_Label & label, const Standard_Integer lower, const Standard_Integer upper, const Standard_Boolean isDelta = Standard_False);

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "Finds, or creates, an extstringarray attribute with explicit user defined <guid>. the extstringarray attribute is returned.

Parameters
----------
label: TDF_Label
theGuid: Standard_GUID
lower: int
upper: int
isDelta: bool,optional
	default value is Standard_False

Returns
-------
opencascade::handle<TDataStd_ExtStringArray>
") Set;
		static opencascade::handle<TDataStd_ExtStringArray> Set(const TDF_Label & label, const Standard_GUID & theGuid, const Standard_Integer lower, const Standard_Integer upper, const Standard_Boolean isDelta = Standard_False);

		/****************** SetDelta ******************/
		%feature("compactdefaultargs") SetDelta;
		%feature("autodoc", "For internal use only!.

Parameters
----------
isDelta: bool

Returns
-------
None
") SetDelta;
		void SetDelta(const Standard_Boolean isDelta);

		/****************** SetID ******************/
		%feature("compactdefaultargs") SetID;
		%feature("autodoc", "Sets the explicit guid (user defined) for the attribute.

Parameters
----------
theGuid: Standard_GUID

Returns
-------
None
") SetID;
		void SetID(const Standard_GUID & theGuid);

		/****************** SetID ******************/
		%feature("compactdefaultargs") SetID;
		%feature("autodoc", "Sets default guid for the attribute.

Returns
-------
None
") SetID;
		void SetID();

		/****************** SetValue ******************/
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "Sets the <index>th element of the array to <value> outofrange exception is raised if <index> doesn't respect lower and upper bounds of the internal array.

Parameters
----------
Index: int
Value: TCollection_ExtendedString

Returns
-------
None
") SetValue;
		void SetValue(const Standard_Integer Index, const TCollection_ExtendedString & Value);

		/****************** Upper ******************/
		%feature("compactdefaultargs") Upper;
		%feature("autodoc", "Return the upper bound.

Returns
-------
int
") Upper;
		Standard_Integer Upper();

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Returns the value of the <index>th element of the array.

Parameters
----------
Index: int

Returns
-------
TCollection_ExtendedString
") Value;
		const TCollection_ExtendedString & Value(const Standard_Integer Index);

};


%make_alias(TDataStd_ExtStringArray)

%extend TDataStd_ExtStringArray {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************
* class TDataStd_ExtStringList *
*******************************/
class TDataStd_ExtStringList : public TDF_Attribute {
	public:
		/****************** TDataStd_ExtStringList ******************/
		%feature("compactdefaultargs") TDataStd_ExtStringList;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") TDataStd_ExtStringList;
		 TDataStd_ExtStringList();

		/****************** Append ******************/
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "No available documentation.

Parameters
----------
value: TCollection_ExtendedString

Returns
-------
None
") Append;
		void Append(const TCollection_ExtendedString & value);

		/****************** Clear ******************/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Clear;
		void Clear();


        %feature("autodoc", "1");
        %extend{
            std::string DumpToString() {
            std::stringstream s;
            self->Dump(s);
            return s.str();}
        };
		/****************** Extent ******************/
		%feature("compactdefaultargs") Extent;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") Extent;
		Standard_Integer Extent();

		/****************** First ******************/
		%feature("compactdefaultargs") First;
		%feature("autodoc", "No available documentation.

Returns
-------
TCollection_ExtendedString
") First;
		const TCollection_ExtendedString & First();

		/****************** GetID ******************/
		%feature("compactdefaultargs") GetID;
		%feature("autodoc", "Static methods ============== returns the id of the list of strings attribute.

Returns
-------
Standard_GUID
") GetID;
		static const Standard_GUID & GetID();

		/****************** ID ******************/
		%feature("compactdefaultargs") ID;
		%feature("autodoc", "No available documentation.

Returns
-------
Standard_GUID
") ID;
		const Standard_GUID & ID();

		/****************** InsertAfter ******************/
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "Inserts the <value> after the first meet of <after_value>.

Parameters
----------
value: TCollection_ExtendedString
after_value: TCollection_ExtendedString

Returns
-------
bool
") InsertAfter;
		Standard_Boolean InsertAfter(const TCollection_ExtendedString & value, const TCollection_ExtendedString & after_value);

		/****************** InsertAfter ******************/
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "Inserts the <value> after the <index> position. the indices start with 1 .. extent().

Parameters
----------
index: int
after_value: TCollection_ExtendedString

Returns
-------
bool
") InsertAfter;
		Standard_Boolean InsertAfter(const Standard_Integer index, const TCollection_ExtendedString & after_value);

		/****************** InsertBefore ******************/
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "Inserts the <value> before the first meet of <before_value>.

Parameters
----------
value: TCollection_ExtendedString
before_value: TCollection_ExtendedString

Returns
-------
bool
") InsertBefore;
		Standard_Boolean InsertBefore(const TCollection_ExtendedString & value, const TCollection_ExtendedString & before_value);

		/****************** InsertBefore ******************/
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "Inserts the <value> before the <index> position. the indices start with 1 .. extent().

Parameters
----------
index: int
before_value: TCollection_ExtendedString

Returns
-------
bool
") InsertBefore;
		Standard_Boolean InsertBefore(const Standard_Integer index, const TCollection_ExtendedString & before_value);

		/****************** IsEmpty ******************/
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsEmpty;
		Standard_Boolean IsEmpty();

		/****************** Last ******************/
		%feature("compactdefaultargs") Last;
		%feature("autodoc", "No available documentation.

Returns
-------
TCollection_ExtendedString
") Last;
		const TCollection_ExtendedString & Last();

		/****************** List ******************/
		%feature("compactdefaultargs") List;
		%feature("autodoc", "No available documentation.

Returns
-------
TDataStd_ListOfExtendedString
") List;
		const TDataStd_ListOfExtendedString & List();

		/****************** NewEmpty ******************/
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TDF_Attribute>
") NewEmpty;
		opencascade::handle<TDF_Attribute> NewEmpty();

		/****************** Paste ******************/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "No available documentation.

Parameters
----------
Into: TDF_Attribute
RT: TDF_RelocationTable

Returns
-------
None
") Paste;
		void Paste(const opencascade::handle<TDF_Attribute> & Into, const opencascade::handle<TDF_RelocationTable> & RT);

		/****************** Prepend ******************/
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "No available documentation.

Parameters
----------
value: TCollection_ExtendedString

Returns
-------
None
") Prepend;
		void Prepend(const TCollection_ExtendedString & value);

		/****************** Remove ******************/
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "Removes the first meet of the <value>.

Parameters
----------
value: TCollection_ExtendedString

Returns
-------
bool
") Remove;
		Standard_Boolean Remove(const TCollection_ExtendedString & value);

		/****************** Remove ******************/
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "Removes a value at <index> position.

Parameters
----------
index: int

Returns
-------
bool
") Remove;
		Standard_Boolean Remove(const Standard_Integer index);

		/****************** Restore ******************/
		%feature("compactdefaultargs") Restore;
		%feature("autodoc", "No available documentation.

Parameters
----------
With: TDF_Attribute

Returns
-------
None
") Restore;
		void Restore(const opencascade::handle<TDF_Attribute> & With);

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "Finds or creates a list of string values attribute with explicit user defined <guid>.

Parameters
----------
label: TDF_Label

Returns
-------
opencascade::handle<TDataStd_ExtStringList>
") Set;
		static opencascade::handle<TDataStd_ExtStringList> Set(const TDF_Label & label);

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "Finds or creates a list of string values attribute.

Parameters
----------
label: TDF_Label
theGuid: Standard_GUID

Returns
-------
opencascade::handle<TDataStd_ExtStringList>
") Set;
		static opencascade::handle<TDataStd_ExtStringList> Set(const TDF_Label & label, const Standard_GUID & theGuid);

		/****************** SetID ******************/
		%feature("compactdefaultargs") SetID;
		%feature("autodoc", "Sets the explicit guid (user defined) for the attribute.

Parameters
----------
theGuid: Standard_GUID

Returns
-------
None
") SetID;
		void SetID(const Standard_GUID & theGuid);

		/****************** SetID ******************/
		%feature("compactdefaultargs") SetID;
		%feature("autodoc", "Sets default guid for the attribute.

Returns
-------
None
") SetID;
		void SetID();

};


%make_alias(TDataStd_ExtStringList)

%extend TDataStd_ExtStringList {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************************
* class TDataStd_HDataMapOfStringByte *
**************************************/
class TDataStd_HDataMapOfStringByte : public Standard_Transient {
	public:
		/****************** TDataStd_HDataMapOfStringByte ******************/
		%feature("compactdefaultargs") TDataStd_HDataMapOfStringByte;
		%feature("autodoc", "No available documentation.

Parameters
----------
NbBuckets: int,optional
	default value is 1

Returns
-------
None
") TDataStd_HDataMapOfStringByte;
		 TDataStd_HDataMapOfStringByte(const Standard_Integer NbBuckets = 1);

		/****************** TDataStd_HDataMapOfStringByte ******************/
		%feature("compactdefaultargs") TDataStd_HDataMapOfStringByte;
		%feature("autodoc", "No available documentation.

Parameters
----------
theOther: TDataStd_DataMapOfStringByte

Returns
-------
None
") TDataStd_HDataMapOfStringByte;
		 TDataStd_HDataMapOfStringByte(const TDataStd_DataMapOfStringByte & theOther);

		/****************** ChangeMap ******************/
		%feature("compactdefaultargs") ChangeMap;
		%feature("autodoc", "No available documentation.

Returns
-------
TDataStd_DataMapOfStringByte
") ChangeMap;
		TDataStd_DataMapOfStringByte & ChangeMap();

		/****************** Map ******************/
		%feature("compactdefaultargs") Map;
		%feature("autodoc", "No available documentation.

Returns
-------
TDataStd_DataMapOfStringByte
") Map;
		const TDataStd_DataMapOfStringByte & Map();

};


%make_alias(TDataStd_HDataMapOfStringByte)

%extend TDataStd_HDataMapOfStringByte {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************************************
* class TDataStd_HDataMapOfStringHArray1OfInteger *
**************************************************/
class TDataStd_HDataMapOfStringHArray1OfInteger : public Standard_Transient {
	public:
		/****************** TDataStd_HDataMapOfStringHArray1OfInteger ******************/
		%feature("compactdefaultargs") TDataStd_HDataMapOfStringHArray1OfInteger;
		%feature("autodoc", "No available documentation.

Parameters
----------
NbBuckets: int,optional
	default value is 1

Returns
-------
None
") TDataStd_HDataMapOfStringHArray1OfInteger;
		 TDataStd_HDataMapOfStringHArray1OfInteger(const Standard_Integer NbBuckets = 1);

		/****************** TDataStd_HDataMapOfStringHArray1OfInteger ******************/
		%feature("compactdefaultargs") TDataStd_HDataMapOfStringHArray1OfInteger;
		%feature("autodoc", "No available documentation.

Parameters
----------
theOther: TDataStd_DataMapOfStringHArray1OfInteger

Returns
-------
None
") TDataStd_HDataMapOfStringHArray1OfInteger;
		 TDataStd_HDataMapOfStringHArray1OfInteger(const TDataStd_DataMapOfStringHArray1OfInteger & theOther);

		/****************** ChangeMap ******************/
		%feature("compactdefaultargs") ChangeMap;
		%feature("autodoc", "No available documentation.

Returns
-------
TDataStd_DataMapOfStringHArray1OfInteger
") ChangeMap;
		TDataStd_DataMapOfStringHArray1OfInteger & ChangeMap();

		/****************** Map ******************/
		%feature("compactdefaultargs") Map;
		%feature("autodoc", "No available documentation.

Returns
-------
TDataStd_DataMapOfStringHArray1OfInteger
") Map;
		const TDataStd_DataMapOfStringHArray1OfInteger & Map();

};


%make_alias(TDataStd_HDataMapOfStringHArray1OfInteger)

%extend TDataStd_HDataMapOfStringHArray1OfInteger {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************************************
* class TDataStd_HDataMapOfStringHArray1OfReal *
***********************************************/
class TDataStd_HDataMapOfStringHArray1OfReal : public Standard_Transient {
	public:
		/****************** TDataStd_HDataMapOfStringHArray1OfReal ******************/
		%feature("compactdefaultargs") TDataStd_HDataMapOfStringHArray1OfReal;
		%feature("autodoc", "No available documentation.

Parameters
----------
NbBuckets: int,optional
	default value is 1

Returns
-------
None
") TDataStd_HDataMapOfStringHArray1OfReal;
		 TDataStd_HDataMapOfStringHArray1OfReal(const Standard_Integer NbBuckets = 1);

		/****************** TDataStd_HDataMapOfStringHArray1OfReal ******************/
		%feature("compactdefaultargs") TDataStd_HDataMapOfStringHArray1OfReal;
		%feature("autodoc", "No available documentation.

Parameters
----------
theOther: TDataStd_DataMapOfStringHArray1OfReal

Returns
-------
None
") TDataStd_HDataMapOfStringHArray1OfReal;
		 TDataStd_HDataMapOfStringHArray1OfReal(const TDataStd_DataMapOfStringHArray1OfReal & theOther);

		/****************** ChangeMap ******************/
		%feature("compactdefaultargs") ChangeMap;
		%feature("autodoc", "No available documentation.

Returns
-------
TDataStd_DataMapOfStringHArray1OfReal
") ChangeMap;
		TDataStd_DataMapOfStringHArray1OfReal & ChangeMap();

		/****************** Map ******************/
		%feature("compactdefaultargs") Map;
		%feature("autodoc", "No available documentation.

Returns
-------
TDataStd_DataMapOfStringHArray1OfReal
") Map;
		const TDataStd_DataMapOfStringHArray1OfReal & Map();

};


%make_alias(TDataStd_HDataMapOfStringHArray1OfReal)

%extend TDataStd_HDataMapOfStringHArray1OfReal {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************************
* class TDataStd_HDataMapOfStringInteger *
*****************************************/
class TDataStd_HDataMapOfStringInteger : public Standard_Transient {
	public:
		/****************** TDataStd_HDataMapOfStringInteger ******************/
		%feature("compactdefaultargs") TDataStd_HDataMapOfStringInteger;
		%feature("autodoc", "No available documentation.

Parameters
----------
NbBuckets: int,optional
	default value is 1

Returns
-------
None
") TDataStd_HDataMapOfStringInteger;
		 TDataStd_HDataMapOfStringInteger(const Standard_Integer NbBuckets = 1);

		/****************** TDataStd_HDataMapOfStringInteger ******************/
		%feature("compactdefaultargs") TDataStd_HDataMapOfStringInteger;
		%feature("autodoc", "No available documentation.

Parameters
----------
theOther: TColStd_DataMapOfStringInteger

Returns
-------
None
") TDataStd_HDataMapOfStringInteger;
		 TDataStd_HDataMapOfStringInteger(const TColStd_DataMapOfStringInteger & theOther);

		/****************** ChangeMap ******************/
		%feature("compactdefaultargs") ChangeMap;
		%feature("autodoc", "No available documentation.

Returns
-------
TColStd_DataMapOfStringInteger
") ChangeMap;
		TColStd_DataMapOfStringInteger & ChangeMap();

		/****************** Map ******************/
		%feature("compactdefaultargs") Map;
		%feature("autodoc", "No available documentation.

Returns
-------
TColStd_DataMapOfStringInteger
") Map;
		const TColStd_DataMapOfStringInteger & Map();

};


%make_alias(TDataStd_HDataMapOfStringInteger)

%extend TDataStd_HDataMapOfStringInteger {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************************
* class TDataStd_HDataMapOfStringReal *
**************************************/
class TDataStd_HDataMapOfStringReal : public Standard_Transient {
	public:
		/****************** TDataStd_HDataMapOfStringReal ******************/
		%feature("compactdefaultargs") TDataStd_HDataMapOfStringReal;
		%feature("autodoc", "No available documentation.

Parameters
----------
NbBuckets: int,optional
	default value is 1

Returns
-------
None
") TDataStd_HDataMapOfStringReal;
		 TDataStd_HDataMapOfStringReal(const Standard_Integer NbBuckets = 1);

		/****************** TDataStd_HDataMapOfStringReal ******************/
		%feature("compactdefaultargs") TDataStd_HDataMapOfStringReal;
		%feature("autodoc", "No available documentation.

Parameters
----------
theOther: TDataStd_DataMapOfStringReal

Returns
-------
None
") TDataStd_HDataMapOfStringReal;
		 TDataStd_HDataMapOfStringReal(const TDataStd_DataMapOfStringReal & theOther);

		/****************** ChangeMap ******************/
		%feature("compactdefaultargs") ChangeMap;
		%feature("autodoc", "No available documentation.

Returns
-------
TDataStd_DataMapOfStringReal
") ChangeMap;
		TDataStd_DataMapOfStringReal & ChangeMap();

		/****************** Map ******************/
		%feature("compactdefaultargs") Map;
		%feature("autodoc", "No available documentation.

Returns
-------
TDataStd_DataMapOfStringReal
") Map;
		const TDataStd_DataMapOfStringReal & Map();

};


%make_alias(TDataStd_HDataMapOfStringReal)

%extend TDataStd_HDataMapOfStringReal {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************************
* class TDataStd_HDataMapOfStringString *
****************************************/
class TDataStd_HDataMapOfStringString : public Standard_Transient {
	public:
		/****************** TDataStd_HDataMapOfStringString ******************/
		%feature("compactdefaultargs") TDataStd_HDataMapOfStringString;
		%feature("autodoc", "No available documentation.

Parameters
----------
NbBuckets: int,optional
	default value is 1

Returns
-------
None
") TDataStd_HDataMapOfStringString;
		 TDataStd_HDataMapOfStringString(const Standard_Integer NbBuckets = 1);

		/****************** TDataStd_HDataMapOfStringString ******************/
		%feature("compactdefaultargs") TDataStd_HDataMapOfStringString;
		%feature("autodoc", "No available documentation.

Parameters
----------
theOther: TDataStd_DataMapOfStringString

Returns
-------
None
") TDataStd_HDataMapOfStringString;
		 TDataStd_HDataMapOfStringString(const TDataStd_DataMapOfStringString & theOther);

		/****************** ChangeMap ******************/
		%feature("compactdefaultargs") ChangeMap;
		%feature("autodoc", "No available documentation.

Returns
-------
TDataStd_DataMapOfStringString
") ChangeMap;
		TDataStd_DataMapOfStringString & ChangeMap();

		/****************** Map ******************/
		%feature("compactdefaultargs") Map;
		%feature("autodoc", "No available documentation.

Returns
-------
TDataStd_DataMapOfStringString
") Map;
		const TDataStd_DataMapOfStringString & Map();

};


%make_alias(TDataStd_HDataMapOfStringString)

%extend TDataStd_HDataMapOfStringString {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************
* class TDataStd_IntPackedMap *
******************************/
class TDataStd_IntPackedMap : public TDF_Attribute {
	public:
		/****************** TDataStd_IntPackedMap ******************/
		%feature("compactdefaultargs") TDataStd_IntPackedMap;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") TDataStd_IntPackedMap;
		 TDataStd_IntPackedMap();

		/****************** Add ******************/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "No available documentation.

Parameters
----------
theKey: int

Returns
-------
bool
") Add;
		Standard_Boolean Add(const Standard_Integer theKey);

		/****************** ChangeMap ******************/
		%feature("compactdefaultargs") ChangeMap;
		%feature("autodoc", "No available documentation.

Parameters
----------
theMap: TColStd_HPackedMapOfInteger

Returns
-------
bool
") ChangeMap;
		Standard_Boolean ChangeMap(const opencascade::handle<TColStd_HPackedMapOfInteger> & theMap);

		/****************** ChangeMap ******************/
		%feature("compactdefaultargs") ChangeMap;
		%feature("autodoc", "No available documentation.

Parameters
----------
theMap: TColStd_PackedMapOfInteger

Returns
-------
bool
") ChangeMap;
		Standard_Boolean ChangeMap(const TColStd_PackedMapOfInteger & theMap);

		/****************** Clear ******************/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") Clear;
		Standard_Boolean Clear();

		/****************** Contains ******************/
		%feature("compactdefaultargs") Contains;
		%feature("autodoc", "No available documentation.

Parameters
----------
theKey: int

Returns
-------
bool
") Contains;
		Standard_Boolean Contains(const Standard_Integer theKey);

		/****************** DeltaOnModification ******************/
		%feature("compactdefaultargs") DeltaOnModification;
		%feature("autodoc", "Makes a deltaonmodification between <self> and <anoldattribute>.

Parameters
----------
anOldAttribute: TDF_Attribute

Returns
-------
opencascade::handle<TDF_DeltaOnModification>
") DeltaOnModification;
		virtual opencascade::handle<TDF_DeltaOnModification> DeltaOnModification(const opencascade::handle<TDF_Attribute> & anOldAttribute);


        %feature("autodoc", "1");
        %extend{
            std::string DumpToString() {
            std::stringstream s;
            self->Dump(s);
            return s.str();}
        };
		/****************** Extent ******************/
		%feature("compactdefaultargs") Extent;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") Extent;
		Standard_Integer Extent();

		/****************** GetDelta ******************/
		%feature("compactdefaultargs") GetDelta;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") GetDelta;
		Standard_Boolean GetDelta();

		/****************** GetHMap ******************/
		%feature("compactdefaultargs") GetHMap;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TColStd_HPackedMapOfInteger>
") GetHMap;
		const opencascade::handle<TColStd_HPackedMapOfInteger> & GetHMap();

		/****************** GetID ******************/
		%feature("compactdefaultargs") GetID;
		%feature("autodoc", "Class methods ============= returns the guid of the attribute.

Returns
-------
Standard_GUID
") GetID;
		static const Standard_GUID & GetID();

		/****************** GetMap ******************/
		%feature("compactdefaultargs") GetMap;
		%feature("autodoc", "No available documentation.

Returns
-------
TColStd_PackedMapOfInteger
") GetMap;
		const TColStd_PackedMapOfInteger & GetMap();

		/****************** ID ******************/
		%feature("compactdefaultargs") ID;
		%feature("autodoc", "No available documentation.

Returns
-------
Standard_GUID
") ID;
		const Standard_GUID & ID();

		/****************** IsEmpty ******************/
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsEmpty;
		Standard_Boolean IsEmpty();

		/****************** NewEmpty ******************/
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TDF_Attribute>
") NewEmpty;
		opencascade::handle<TDF_Attribute> NewEmpty();

		/****************** Paste ******************/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "No available documentation.

Parameters
----------
into: TDF_Attribute
RT: TDF_RelocationTable

Returns
-------
None
") Paste;
		void Paste(const opencascade::handle<TDF_Attribute> & into, const opencascade::handle<TDF_RelocationTable> & RT);

		/****************** Remove ******************/
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "No available documentation.

Parameters
----------
theKey: int

Returns
-------
bool
") Remove;
		Standard_Boolean Remove(const Standard_Integer theKey);

		/****************** Restore ******************/
		%feature("compactdefaultargs") Restore;
		%feature("autodoc", "No available documentation.

Parameters
----------
with: TDF_Attribute

Returns
-------
None
") Restore;
		void Restore(const opencascade::handle<TDF_Attribute> & with);

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "Finds or creates an integer map attribute on the given label. if <isdelta> == false, defaultdeltaonmodification is used. if <isdelta> == true, deltaonmodification of the current attribute is used. if attribute is already set, input parameter <isdelta> is refused and the found attribute returned. attribute methods ===================.

Parameters
----------
label: TDF_Label
isDelta: bool,optional
	default value is Standard_False

Returns
-------
opencascade::handle<TDataStd_IntPackedMap>
") Set;
		static opencascade::handle<TDataStd_IntPackedMap> Set(const TDF_Label & label, const Standard_Boolean isDelta = Standard_False);

		/****************** SetDelta ******************/
		%feature("compactdefaultargs") SetDelta;
		%feature("autodoc", "For internal use only!.

Parameters
----------
isDelta: bool

Returns
-------
None
") SetDelta;
		void SetDelta(const Standard_Boolean isDelta);

};


%make_alias(TDataStd_IntPackedMap)

%extend TDataStd_IntPackedMap {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************
* class TDataStd_Integer *
*************************/
class TDataStd_Integer : public TDF_Attribute {
	public:
		/****************** TDataStd_Integer ******************/
		%feature("compactdefaultargs") TDataStd_Integer;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") TDataStd_Integer;
		 TDataStd_Integer();


        %feature("autodoc", "1");
        %extend{
            std::string DumpToString() {
            std::stringstream s;
            self->Dump(s);
            return s.str();}
        };
		/****************** Get ******************/
		%feature("compactdefaultargs") Get;
		%feature("autodoc", "Returns the integer value contained in the attribute.

Returns
-------
int
") Get;
		Standard_Integer Get();

		/****************** GetID ******************/
		%feature("compactdefaultargs") GetID;
		%feature("autodoc", "Class methods ============= returns the guid for integers.

Returns
-------
Standard_GUID
") GetID;
		static const Standard_GUID & GetID();

		/****************** ID ******************/
		%feature("compactdefaultargs") ID;
		%feature("autodoc", "No available documentation.

Returns
-------
Standard_GUID
") ID;
		const Standard_GUID & ID();

		/****************** IsCaptured ******************/
		%feature("compactdefaultargs") IsCaptured;
		%feature("autodoc", "Returns true if there is a reference on the same label.

Returns
-------
bool
") IsCaptured;
		Standard_Boolean IsCaptured();

		/****************** NewEmpty ******************/
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TDF_Attribute>
") NewEmpty;
		opencascade::handle<TDF_Attribute> NewEmpty();

		/****************** Paste ******************/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "No available documentation.

Parameters
----------
Into: TDF_Attribute
RT: TDF_RelocationTable

Returns
-------
None
") Paste;
		void Paste(const opencascade::handle<TDF_Attribute> & Into, const opencascade::handle<TDF_RelocationTable> & RT);

		/****************** Restore ******************/
		%feature("compactdefaultargs") Restore;
		%feature("autodoc", "No available documentation.

Parameters
----------
With: TDF_Attribute

Returns
-------
None
") Restore;
		void Restore(const opencascade::handle<TDF_Attribute> & With);

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "Finds, or creates, an integer attribute and sets <value> the integer attribute is returned.

Parameters
----------
label: TDF_Label
value: int

Returns
-------
opencascade::handle<TDataStd_Integer>
") Set;
		static opencascade::handle<TDataStd_Integer> Set(const TDF_Label & label, const Standard_Integer value);

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "Finds, or creates, an integer attribute with explicit user defined <guid> and sets <value>. the integer attribute is returned. .

Parameters
----------
label: TDF_Label
guid: Standard_GUID
value: int

Returns
-------
opencascade::handle<TDataStd_Integer>
") Set;
		static opencascade::handle<TDataStd_Integer> Set(const TDF_Label & label, const Standard_GUID & guid, const Standard_Integer value);

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "Integer methods ===============.

Parameters
----------
V: int

Returns
-------
None
") Set;
		void Set(const Standard_Integer V);

		/****************** SetID ******************/
		%feature("compactdefaultargs") SetID;
		%feature("autodoc", "Sets the explicit guid (user defined) for the attribute.

Parameters
----------
guid: Standard_GUID

Returns
-------
None
") SetID;
		void SetID(const Standard_GUID & guid);

		/****************** SetID ******************/
		%feature("compactdefaultargs") SetID;
		%feature("autodoc", "Sets default guid for the attribute.

Returns
-------
None
") SetID;
		void SetID();

};


%make_alias(TDataStd_Integer)

%extend TDataStd_Integer {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************
* class TDataStd_IntegerArray *
******************************/
class TDataStd_IntegerArray : public TDF_Attribute {
	public:
		/****************** TDataStd_IntegerArray ******************/
		%feature("compactdefaultargs") TDataStd_IntegerArray;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") TDataStd_IntegerArray;
		 TDataStd_IntegerArray();

		/****************** Array ******************/
		%feature("compactdefaultargs") Array;
		%feature("autodoc", "Return the inner array of the integerarray attribute.

Returns
-------
opencascade::handle<TColStd_HArray1OfInteger>
") Array;
		const opencascade::handle<TColStd_HArray1OfInteger> & Array();

		/****************** ChangeArray ******************/
		%feature("compactdefaultargs") ChangeArray;
		%feature("autodoc", "Sets the inner array <myvalue> of the integerarray attribute to <newarray>. if value of <newarray> differs from <myvalue>, backup performed and myvalue refers to new instance of harray1ofinteger that holds <newarray> values if <ischeckitems> equal true each item of <newarray> will be checked with each item of <myvalue> for coincidence (to avoid backup).

Parameters
----------
newArray: TColStd_HArray1OfInteger
isCheckItems: bool,optional
	default value is Standard_True

Returns
-------
None
") ChangeArray;
		void ChangeArray(const opencascade::handle<TColStd_HArray1OfInteger> & newArray, const Standard_Boolean isCheckItems = Standard_True);

		/****************** DeltaOnModification ******************/
		%feature("compactdefaultargs") DeltaOnModification;
		%feature("autodoc", "Makes a deltaonmodification between <self> and <anoldattribute>.

Parameters
----------
anOldAttribute: TDF_Attribute

Returns
-------
opencascade::handle<TDF_DeltaOnModification>
") DeltaOnModification;
		virtual opencascade::handle<TDF_DeltaOnModification> DeltaOnModification(const opencascade::handle<TDF_Attribute> & anOldAttribute);


        %feature("autodoc", "1");
        %extend{
            std::string DumpToString() {
            std::stringstream s;
            self->Dump(s);
            return s.str();}
        };
		/****************** GetDelta ******************/
		%feature("compactdefaultargs") GetDelta;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") GetDelta;
		Standard_Boolean GetDelta();

		/****************** GetID ******************/
		%feature("compactdefaultargs") GetID;
		%feature("autodoc", "Class methods ============= returns the guid for arrays of integers.

Returns
-------
Standard_GUID
") GetID;
		static const Standard_GUID & GetID();

		/****************** ID ******************/
		%feature("compactdefaultargs") ID;
		%feature("autodoc", "No available documentation.

Returns
-------
Standard_GUID
") ID;
		const Standard_GUID & ID();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Initialize the inner array with bounds from <lower> to <upper>.

Parameters
----------
lower: int
upper: int

Returns
-------
None
") Init;
		void Init(const Standard_Integer lower, const Standard_Integer upper);

		/****************** Length ******************/
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "Returns the length of this array of integers in terms of the number of elements it contains.

Returns
-------
int
") Length;
		Standard_Integer Length();

		/****************** Lower ******************/
		%feature("compactdefaultargs") Lower;
		%feature("autodoc", "Returns the lower boundary of this array of integers.

Returns
-------
int
") Lower;
		Standard_Integer Lower();

		/****************** NewEmpty ******************/
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TDF_Attribute>
") NewEmpty;
		opencascade::handle<TDF_Attribute> NewEmpty();

		/****************** Paste ******************/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "Note. uses inside changearray() method.

Parameters
----------
Into: TDF_Attribute
RT: TDF_RelocationTable

Returns
-------
None
") Paste;
		void Paste(const opencascade::handle<TDF_Attribute> & Into, const opencascade::handle<TDF_RelocationTable> & RT);

		/****************** Restore ******************/
		%feature("compactdefaultargs") Restore;
		%feature("autodoc", "No available documentation.

Parameters
----------
With: TDF_Attribute

Returns
-------
None
") Restore;
		void Restore(const opencascade::handle<TDF_Attribute> & With);

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "Finds or creates on the <label> an integer array attribute with the specified <lower> and <upper> boundaries. if <isdelta> == false, defaultdeltaonmodification is used. if <isdelta> == true, deltaonmodification of the current attribute is used. if attribute is already set, all input parameters are refused and the found attribute is returned.

Parameters
----------
label: TDF_Label
lower: int
upper: int
isDelta: bool,optional
	default value is Standard_False

Returns
-------
opencascade::handle<TDataStd_IntegerArray>
") Set;
		static opencascade::handle<TDataStd_IntegerArray> Set(const TDF_Label & label, const Standard_Integer lower, const Standard_Integer upper, const Standard_Boolean isDelta = Standard_False);

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "Finds, or creates, an integerarray attribute with explicit user defined <guid>. the integerarray attribute is returned.

Parameters
----------
label: TDF_Label
theGuid: Standard_GUID
lower: int
upper: int
isDelta: bool,optional
	default value is Standard_False

Returns
-------
opencascade::handle<TDataStd_IntegerArray>
") Set;
		static opencascade::handle<TDataStd_IntegerArray> Set(const TDF_Label & label, const Standard_GUID & theGuid, const Standard_Integer lower, const Standard_Integer upper, const Standard_Boolean isDelta = Standard_False);

		/****************** SetDelta ******************/
		%feature("compactdefaultargs") SetDelta;
		%feature("autodoc", "For internal use only!.

Parameters
----------
isDelta: bool

Returns
-------
None
") SetDelta;
		void SetDelta(const Standard_Boolean isDelta);

		/****************** SetID ******************/
		%feature("compactdefaultargs") SetID;
		%feature("autodoc", "Sets the explicit guid (user defined) for the attribute.

Parameters
----------
theGuid: Standard_GUID

Returns
-------
None
") SetID;
		void SetID(const Standard_GUID & theGuid);

		/****************** SetID ******************/
		%feature("compactdefaultargs") SetID;
		%feature("autodoc", "Sets default guid for the attribute.

Returns
-------
None
") SetID;
		void SetID();

		/****************** SetValue ******************/
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "Sets the <index>th element of the array to <value> outofrange exception is raised if <index> doesn't respect lower and upper bounds of the internal array.

Parameters
----------
Index: int
Value: int

Returns
-------
None
") SetValue;
		void SetValue(const Standard_Integer Index, const Standard_Integer Value);

		/****************** Upper ******************/
		%feature("compactdefaultargs") Upper;
		%feature("autodoc", "Return the upper boundary of this array of integers.

Returns
-------
int
") Upper;
		Standard_Integer Upper();

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Return the value of the <index>th element of the array.

Parameters
----------
Index: int

Returns
-------
int
") Value;
		Standard_Integer Value(const Standard_Integer Index);

};


%make_alias(TDataStd_IntegerArray)

%extend TDataStd_IntegerArray {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************
* class TDataStd_IntegerList *
*****************************/
class TDataStd_IntegerList : public TDF_Attribute {
	public:
		/****************** TDataStd_IntegerList ******************/
		%feature("compactdefaultargs") TDataStd_IntegerList;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") TDataStd_IntegerList;
		 TDataStd_IntegerList();

		/****************** Append ******************/
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "No available documentation.

Parameters
----------
value: int

Returns
-------
None
") Append;
		void Append(const Standard_Integer value);

		/****************** Clear ******************/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Clear;
		void Clear();


        %feature("autodoc", "1");
        %extend{
            std::string DumpToString() {
            std::stringstream s;
            self->Dump(s);
            return s.str();}
        };
		/****************** Extent ******************/
		%feature("compactdefaultargs") Extent;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") Extent;
		Standard_Integer Extent();

		/****************** First ******************/
		%feature("compactdefaultargs") First;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") First;
		Standard_Integer First();

		/****************** GetID ******************/
		%feature("compactdefaultargs") GetID;
		%feature("autodoc", "Static methods ============== returns the id of the list of integer attribute.

Returns
-------
Standard_GUID
") GetID;
		static const Standard_GUID & GetID();

		/****************** ID ******************/
		%feature("compactdefaultargs") ID;
		%feature("autodoc", "No available documentation.

Returns
-------
Standard_GUID
") ID;
		const Standard_GUID & ID();

		/****************** InsertAfter ******************/
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "Inserts the <value> after the first meet of <after_value>.

Parameters
----------
value: int
after_value: int

Returns
-------
bool
") InsertAfter;
		Standard_Boolean InsertAfter(const Standard_Integer value, const Standard_Integer after_value);

		/****************** InsertAfterByIndex ******************/
		%feature("compactdefaultargs") InsertAfterByIndex;
		%feature("autodoc", "Inserts the <value> after the <index> position. the indices start with 1 .. extent().

Parameters
----------
index: int
after_value: int

Returns
-------
bool
") InsertAfterByIndex;
		Standard_Boolean InsertAfterByIndex(const Standard_Integer index, const Standard_Integer after_value);

		/****************** InsertBefore ******************/
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "Inserts the <value> before the first meet of <before_value>.

Parameters
----------
value: int
before_value: int

Returns
-------
bool
") InsertBefore;
		Standard_Boolean InsertBefore(const Standard_Integer value, const Standard_Integer before_value);

		/****************** InsertBeforeByIndex ******************/
		%feature("compactdefaultargs") InsertBeforeByIndex;
		%feature("autodoc", "Inserts the <value> before the <index> position. the indices start with 1 .. extent().

Parameters
----------
index: int
before_value: int

Returns
-------
bool
") InsertBeforeByIndex;
		Standard_Boolean InsertBeforeByIndex(const Standard_Integer index, const Standard_Integer before_value);

		/****************** IsEmpty ******************/
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsEmpty;
		Standard_Boolean IsEmpty();

		/****************** Last ******************/
		%feature("compactdefaultargs") Last;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") Last;
		Standard_Integer Last();

		/****************** List ******************/
		%feature("compactdefaultargs") List;
		%feature("autodoc", "No available documentation.

Returns
-------
TColStd_ListOfInteger
") List;
		const TColStd_ListOfInteger & List();

		/****************** NewEmpty ******************/
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TDF_Attribute>
") NewEmpty;
		opencascade::handle<TDF_Attribute> NewEmpty();

		/****************** Paste ******************/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "No available documentation.

Parameters
----------
Into: TDF_Attribute
RT: TDF_RelocationTable

Returns
-------
None
") Paste;
		void Paste(const opencascade::handle<TDF_Attribute> & Into, const opencascade::handle<TDF_RelocationTable> & RT);

		/****************** Prepend ******************/
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "No available documentation.

Parameters
----------
value: int

Returns
-------
None
") Prepend;
		void Prepend(const Standard_Integer value);

		/****************** Remove ******************/
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "Removes the first meet of the <value>.

Parameters
----------
value: int

Returns
-------
bool
") Remove;
		Standard_Boolean Remove(const Standard_Integer value);

		/****************** RemoveByIndex ******************/
		%feature("compactdefaultargs") RemoveByIndex;
		%feature("autodoc", "Removes a value at <index> position.

Parameters
----------
index: int

Returns
-------
bool
") RemoveByIndex;
		Standard_Boolean RemoveByIndex(const Standard_Integer index);

		/****************** Restore ******************/
		%feature("compactdefaultargs") Restore;
		%feature("autodoc", "No available documentation.

Parameters
----------
With: TDF_Attribute

Returns
-------
None
") Restore;
		void Restore(const opencascade::handle<TDF_Attribute> & With);

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "Finds or creates a list of integer values attribute.

Parameters
----------
label: TDF_Label

Returns
-------
opencascade::handle<TDataStd_IntegerList>
") Set;
		static opencascade::handle<TDataStd_IntegerList> Set(const TDF_Label & label);

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "Finds or creates a list of integer values attribute with explicit user defined <guid>.

Parameters
----------
label: TDF_Label
theGuid: Standard_GUID

Returns
-------
opencascade::handle<TDataStd_IntegerList>
") Set;
		static opencascade::handle<TDataStd_IntegerList> Set(const TDF_Label & label, const Standard_GUID & theGuid);

		/****************** SetID ******************/
		%feature("compactdefaultargs") SetID;
		%feature("autodoc", "Sets the explicit guid (user defined) for the attribute.

Parameters
----------
theGuid: Standard_GUID

Returns
-------
None
") SetID;
		void SetID(const Standard_GUID & theGuid);

		/****************** SetID ******************/
		%feature("compactdefaultargs") SetID;
		%feature("autodoc", "Sets default guid for the attribute.

Returns
-------
None
") SetID;
		void SetID();

};


%make_alias(TDataStd_IntegerList)

%extend TDataStd_IntegerList {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************
* class TDataStd_Name *
**********************/
class TDataStd_Name : public TDF_Attribute {
	public:
		/****************** TDataStd_Name ******************/
		%feature("compactdefaultargs") TDataStd_Name;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") TDataStd_Name;
		 TDataStd_Name();


        %feature("autodoc", "1");
        %extend{
            std::string DumpToString() {
            std::stringstream s;
            self->Dump(s);
            return s.str();}
        };
		/****************** Get ******************/
		%feature("compactdefaultargs") Get;
		%feature("autodoc", "Returns the name contained in this name attribute.

Returns
-------
TCollection_ExtendedString
") Get;
		const TCollection_ExtendedString & Get();

		/****************** GetID ******************/
		%feature("compactdefaultargs") GetID;
		%feature("autodoc", "Class methods working on the name itself ======================================== returns the guid for name attributes.

Returns
-------
Standard_GUID
") GetID;
		static const Standard_GUID & GetID();

		/****************** ID ******************/
		%feature("compactdefaultargs") ID;
		%feature("autodoc", "No available documentation.

Returns
-------
Standard_GUID
") ID;
		const Standard_GUID & ID();

		/****************** NewEmpty ******************/
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TDF_Attribute>
") NewEmpty;
		opencascade::handle<TDF_Attribute> NewEmpty();

		/****************** Paste ******************/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "No available documentation.

Parameters
----------
into: TDF_Attribute
RT: TDF_RelocationTable

Returns
-------
None
") Paste;
		void Paste(const opencascade::handle<TDF_Attribute> & into, const opencascade::handle<TDF_RelocationTable> & RT);

		/****************** Restore ******************/
		%feature("compactdefaultargs") Restore;
		%feature("autodoc", "No available documentation.

Parameters
----------
with: TDF_Attribute

Returns
-------
None
") Restore;
		void Restore(const opencascade::handle<TDF_Attribute> & with);

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "Creates (if does not exist) and sets the name in the name attribute. from any label <l> search in father labels (l is not concerned) the first name attribute.if found set it in <father>. class methods working on the name tree ====================================== search in the whole tdf_data the name attribute which fit with <fullpath>. returns true if found. search under <currentlabel> a label which fit with <name>. returns true if found. shortcut which avoids building a listofextendedstrin. search in the whole tdf_data the label which fit with name returns true if found. tools methods to translate path <-> pathlist =========================================== move to draw for draw test we may provide this tool method which convert a path in a sequence of string to call after the findlabel methods. example: if it's given 'assembly:part_1:sketch_5' it will return in <pathlist> the list of 3 strings: 'assembly','part_1','sketch_5'. move to draw from <pathlist> build the string path name methods ============.

Parameters
----------
label: TDF_Label
string: TCollection_ExtendedString

Returns
-------
opencascade::handle<TDataStd_Name>
") Set;
		static opencascade::handle<TDataStd_Name> Set(const TDF_Label & label, const TCollection_ExtendedString & string);

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "Finds, or creates, a name attribute with explicit user defined <guid> and sets <string>. the name attribute is returned. .

Parameters
----------
label: TDF_Label
guid: Standard_GUID
string: TCollection_ExtendedString

Returns
-------
opencascade::handle<TDataStd_Name>
") Set;
		static opencascade::handle<TDataStd_Name> Set(const TDF_Label & label, const Standard_GUID & guid, const TCollection_ExtendedString & string);

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "Sets <s> as name. raises if <s> is not a valid name.

Parameters
----------
S: TCollection_ExtendedString

Returns
-------
None
") Set;
		void Set(const TCollection_ExtendedString & S);

		/****************** SetID ******************/
		%feature("compactdefaultargs") SetID;
		%feature("autodoc", "Sets the explicit user defined guid to the attribute.

Parameters
----------
guid: Standard_GUID

Returns
-------
None
") SetID;
		void SetID(const Standard_GUID & guid);

		/****************** SetID ******************/
		%feature("compactdefaultargs") SetID;
		%feature("autodoc", "Sets default guid for the attribute.

Returns
-------
None
") SetID;
		void SetID();

};


%make_alias(TDataStd_Name)

%extend TDataStd_Name {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************
* class TDataStd_NamedData *
***************************/
class TDataStd_NamedData : public TDF_Attribute {
	public:
		/****************** TDataStd_NamedData ******************/
		%feature("compactdefaultargs") TDataStd_NamedData;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") TDataStd_NamedData;
		 TDataStd_NamedData();

		/****************** ChangeArraysOfIntegers ******************/
		%feature("compactdefaultargs") ChangeArraysOfIntegers;
		%feature("autodoc", "Replace the container content by new content of the <thearraysofintegers>.

Parameters
----------
theArraysOfIntegers: TDataStd_DataMapOfStringHArray1OfInteger

Returns
-------
None
") ChangeArraysOfIntegers;
		void ChangeArraysOfIntegers(const TDataStd_DataMapOfStringHArray1OfInteger & theArraysOfIntegers);

		/****************** ChangeArraysOfReals ******************/
		%feature("compactdefaultargs") ChangeArraysOfReals;
		%feature("autodoc", "Replace the container content by new content of the <thearraysofreals>.

Parameters
----------
theArraysOfReals: TDataStd_DataMapOfStringHArray1OfReal

Returns
-------
None
") ChangeArraysOfReals;
		void ChangeArraysOfReals(const TDataStd_DataMapOfStringHArray1OfReal & theArraysOfReals);

		/****************** ChangeBytes ******************/
		%feature("compactdefaultargs") ChangeBytes;
		%feature("autodoc", "Replace the container content by new content of the <thebytes>.

Parameters
----------
theBytes: TDataStd_DataMapOfStringByte

Returns
-------
None
") ChangeBytes;
		void ChangeBytes(const TDataStd_DataMapOfStringByte & theBytes);

		/****************** ChangeIntegers ******************/
		%feature("compactdefaultargs") ChangeIntegers;
		%feature("autodoc", "Replace the container content by new content of the <theintegers>.

Parameters
----------
theIntegers: TColStd_DataMapOfStringInteger

Returns
-------
None
") ChangeIntegers;
		void ChangeIntegers(const TColStd_DataMapOfStringInteger & theIntegers);

		/****************** ChangeReals ******************/
		%feature("compactdefaultargs") ChangeReals;
		%feature("autodoc", "Replace the container content by new content of the <thereals>.

Parameters
----------
theReals: TDataStd_DataMapOfStringReal

Returns
-------
None
") ChangeReals;
		void ChangeReals(const TDataStd_DataMapOfStringReal & theReals);

		/****************** ChangeStrings ******************/
		%feature("compactdefaultargs") ChangeStrings;
		%feature("autodoc", "Replace the container content by new content of the <thestrings>.

Parameters
----------
theStrings: TDataStd_DataMapOfStringString

Returns
-------
None
") ChangeStrings;
		void ChangeStrings(const TDataStd_DataMapOfStringString & theStrings);


        %feature("autodoc", "1");
        %extend{
            std::string DumpToString() {
            std::stringstream s;
            self->Dump(s);
            return s.str();}
        };
		/****************** GetArrayOfIntegers ******************/
		%feature("compactdefaultargs") GetArrayOfIntegers;
		%feature("autodoc", "Returns the named array of integer values. it returns a null handle if there is no such a named array of integers (use hasarrayofintegers()).

Parameters
----------
theName: TCollection_ExtendedString

Returns
-------
opencascade::handle<TColStd_HArray1OfInteger>
") GetArrayOfIntegers;
		const opencascade::handle<TColStd_HArray1OfInteger> & GetArrayOfIntegers(const TCollection_ExtendedString & theName);

		/****************** GetArrayOfReals ******************/
		%feature("compactdefaultargs") GetArrayOfReals;
		%feature("autodoc", "Returns the named array of real values. it returns a null handle if there is no such a named array of reals (use hasarrayofreals()).

Parameters
----------
theName: TCollection_ExtendedString

Returns
-------
opencascade::handle<TColStd_HArray1OfReal>
") GetArrayOfReals;
		const opencascade::handle<TColStd_HArray1OfReal> & GetArrayOfReals(const TCollection_ExtendedString & theName);

		/****************** GetArraysOfIntegersContainer ******************/
		%feature("compactdefaultargs") GetArraysOfIntegersContainer;
		%feature("autodoc", "Returns the internal container of named arrays of integer values.

Returns
-------
TDataStd_DataMapOfStringHArray1OfInteger
") GetArraysOfIntegersContainer;
		const TDataStd_DataMapOfStringHArray1OfInteger & GetArraysOfIntegersContainer();

		/****************** GetArraysOfRealsContainer ******************/
		%feature("compactdefaultargs") GetArraysOfRealsContainer;
		%feature("autodoc", "Returns the internal container of named arrays of real values.

Returns
-------
TDataStd_DataMapOfStringHArray1OfReal
") GetArraysOfRealsContainer;
		const TDataStd_DataMapOfStringHArray1OfReal & GetArraysOfRealsContainer();

		/****************** GetByte ******************/
		%feature("compactdefaultargs") GetByte;
		%feature("autodoc", "Returns the named byte. it returns 0 if there is no such a named byte (use hasbyte()).

Parameters
----------
theName: TCollection_ExtendedString

Returns
-------
Standard_Byte
") GetByte;
		Standard_Byte GetByte(const TCollection_ExtendedString & theName);

		/****************** GetBytesContainer ******************/
		%feature("compactdefaultargs") GetBytesContainer;
		%feature("autodoc", "Returns the internal container of named bytes.

Returns
-------
TDataStd_DataMapOfStringByte
") GetBytesContainer;
		const TDataStd_DataMapOfStringByte & GetBytesContainer();

		/****************** GetID ******************/
		%feature("compactdefaultargs") GetID;
		%feature("autodoc", "Static methods ============== returns the id of the named data attribute.

Returns
-------
Standard_GUID
") GetID;
		static const Standard_GUID & GetID();

		/****************** GetInteger ******************/
		%feature("compactdefaultargs") GetInteger;
		%feature("autodoc", "Returns the integer value specified by the name. it returns 0 if internal map doesn't contain the specified integer (use hasinteger() to check before).

Parameters
----------
theName: TCollection_ExtendedString

Returns
-------
int
") GetInteger;
		Standard_Integer GetInteger(const TCollection_ExtendedString & theName);

		/****************** GetIntegersContainer ******************/
		%feature("compactdefaultargs") GetIntegersContainer;
		%feature("autodoc", "Returns the internal container of named integers.

Returns
-------
TColStd_DataMapOfStringInteger
") GetIntegersContainer;
		const TColStd_DataMapOfStringInteger & GetIntegersContainer();

		/****************** GetReal ******************/
		%feature("compactdefaultargs") GetReal;
		%feature("autodoc", "Returns the named real. it returns 0.0 if there is no such a named real (use hasreal()).

Parameters
----------
theName: TCollection_ExtendedString

Returns
-------
float
") GetReal;
		Standard_Real GetReal(const TCollection_ExtendedString & theName);

		/****************** GetRealsContainer ******************/
		%feature("compactdefaultargs") GetRealsContainer;
		%feature("autodoc", "Returns the internal container of named reals.

Returns
-------
TDataStd_DataMapOfStringReal
") GetRealsContainer;
		const TDataStd_DataMapOfStringReal & GetRealsContainer();

		/****************** GetString ******************/
		%feature("compactdefaultargs") GetString;
		%feature("autodoc", "Returns the named string. it returns an empty string if there is no such a named string (use hasstring()).

Parameters
----------
theName: TCollection_ExtendedString

Returns
-------
TCollection_ExtendedString
") GetString;
		const TCollection_ExtendedString & GetString(const TCollection_ExtendedString & theName);

		/****************** GetStringsContainer ******************/
		%feature("compactdefaultargs") GetStringsContainer;
		%feature("autodoc", "Returns the internal container of named strings.

Returns
-------
TDataStd_DataMapOfStringString
") GetStringsContainer;
		const TDataStd_DataMapOfStringString & GetStringsContainer();

		/****************** HasArrayOfIntegers ******************/
		%feature("compactdefaultargs") HasArrayOfIntegers;
		%feature("autodoc", "Returns true if the attribute contains this named array of integer values.

Parameters
----------
theName: TCollection_ExtendedString

Returns
-------
bool
") HasArrayOfIntegers;
		Standard_Boolean HasArrayOfIntegers(const TCollection_ExtendedString & theName);

		/****************** HasArrayOfReals ******************/
		%feature("compactdefaultargs") HasArrayOfReals;
		%feature("autodoc", "Returns true if the attribute contains this named array of real values.

Parameters
----------
theName: TCollection_ExtendedString

Returns
-------
bool
") HasArrayOfReals;
		Standard_Boolean HasArrayOfReals(const TCollection_ExtendedString & theName);

		/****************** HasArraysOfIntegers ******************/
		%feature("compactdefaultargs") HasArraysOfIntegers;
		%feature("autodoc", "Returns true if there are some named arrays of integer values in the attribute.

Returns
-------
bool
") HasArraysOfIntegers;
		Standard_Boolean HasArraysOfIntegers();

		/****************** HasArraysOfReals ******************/
		%feature("compactdefaultargs") HasArraysOfReals;
		%feature("autodoc", "Returns true if there are some named arrays of real values in the attribute.

Returns
-------
bool
") HasArraysOfReals;
		Standard_Boolean HasArraysOfReals();

		/****************** HasByte ******************/
		%feature("compactdefaultargs") HasByte;
		%feature("autodoc", "Returns true if the attribute contains this named byte.

Parameters
----------
theName: TCollection_ExtendedString

Returns
-------
bool
") HasByte;
		Standard_Boolean HasByte(const TCollection_ExtendedString & theName);

		/****************** HasBytes ******************/
		%feature("compactdefaultargs") HasBytes;
		%feature("autodoc", "Returns true if there are some named bytes in the attribute.

Returns
-------
bool
") HasBytes;
		Standard_Boolean HasBytes();

		/****************** HasInteger ******************/
		%feature("compactdefaultargs") HasInteger;
		%feature("autodoc", "Returns true if the attribute contains specified by name integer value.

Parameters
----------
theName: TCollection_ExtendedString

Returns
-------
bool
") HasInteger;
		Standard_Boolean HasInteger(const TCollection_ExtendedString & theName);

		/****************** HasIntegers ******************/
		%feature("compactdefaultargs") HasIntegers;
		%feature("autodoc", "Returns true if at least one named integer value is kept in the attribute.

Returns
-------
bool
") HasIntegers;
		Standard_Boolean HasIntegers();

		/****************** HasReal ******************/
		%feature("compactdefaultargs") HasReal;
		%feature("autodoc", "Returns true if the attribute contains a real specified by name.

Parameters
----------
theName: TCollection_ExtendedString

Returns
-------
bool
") HasReal;
		Standard_Boolean HasReal(const TCollection_ExtendedString & theName);

		/****************** HasReals ******************/
		%feature("compactdefaultargs") HasReals;
		%feature("autodoc", "Returns true if at least one named real value is kept in the attribute.

Returns
-------
bool
") HasReals;
		Standard_Boolean HasReals();

		/****************** HasString ******************/
		%feature("compactdefaultargs") HasString;
		%feature("autodoc", "Returns true if the attribute contains this named string.

Parameters
----------
theName: TCollection_ExtendedString

Returns
-------
bool
") HasString;
		Standard_Boolean HasString(const TCollection_ExtendedString & theName);

		/****************** HasStrings ******************/
		%feature("compactdefaultargs") HasStrings;
		%feature("autodoc", "Returns true if there are some named strings in the attribute.

Returns
-------
bool
") HasStrings;
		Standard_Boolean HasStrings();

		/****************** ID ******************/
		%feature("compactdefaultargs") ID;
		%feature("autodoc", "No available documentation.

Returns
-------
Standard_GUID
") ID;
		const Standard_GUID & ID();

		/****************** NewEmpty ******************/
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TDF_Attribute>
") NewEmpty;
		opencascade::handle<TDF_Attribute> NewEmpty();

		/****************** Paste ******************/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "No available documentation.

Parameters
----------
Into: TDF_Attribute
RT: TDF_RelocationTable

Returns
-------
None
") Paste;
		void Paste(const opencascade::handle<TDF_Attribute> & Into, const opencascade::handle<TDF_RelocationTable> & RT);

		/****************** Restore ******************/
		%feature("compactdefaultargs") Restore;
		%feature("autodoc", "No available documentation.

Parameters
----------
With: TDF_Attribute

Returns
-------
None
") Restore;
		void Restore(const opencascade::handle<TDF_Attribute> & With);

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "Finds or creates a named data attribute.

Parameters
----------
label: TDF_Label

Returns
-------
opencascade::handle<TDataStd_NamedData>
") Set;
		static opencascade::handle<TDataStd_NamedData> Set(const TDF_Label & label);

		/****************** SetArrayOfIntegers ******************/
		%feature("compactdefaultargs") SetArrayOfIntegers;
		%feature("autodoc", "Defines a named array of integer values. if the array already exists, it changes its value to <thearrayofintegers>.

Parameters
----------
theName: TCollection_ExtendedString
theArrayOfIntegers: TColStd_HArray1OfInteger

Returns
-------
None
") SetArrayOfIntegers;
		void SetArrayOfIntegers(const TCollection_ExtendedString & theName, const opencascade::handle<TColStd_HArray1OfInteger> & theArrayOfIntegers);

		/****************** SetArrayOfReals ******************/
		%feature("compactdefaultargs") SetArrayOfReals;
		%feature("autodoc", "Defines a named array of real values. if the array already exists, it changes its value to <thearrayofreals>.

Parameters
----------
theName: TCollection_ExtendedString
theArrayOfReals: TColStd_HArray1OfReal

Returns
-------
None
") SetArrayOfReals;
		void SetArrayOfReals(const TCollection_ExtendedString & theName, const opencascade::handle<TColStd_HArray1OfReal> & theArrayOfReals);

		/****************** SetByte ******************/
		%feature("compactdefaultargs") SetByte;
		%feature("autodoc", "Defines a named byte. if the byte already exists, it changes its value to <thebyte>.

Parameters
----------
theName: TCollection_ExtendedString
theByte: Standard_Byte

Returns
-------
None
") SetByte;
		void SetByte(const TCollection_ExtendedString & theName, const Standard_Byte theByte);

		/****************** SetInteger ******************/
		%feature("compactdefaultargs") SetInteger;
		%feature("autodoc", "Defines a named integer. if the integer already exists, it changes its value to <theinteger>.

Parameters
----------
theName: TCollection_ExtendedString
theInteger: int

Returns
-------
None
") SetInteger;
		void SetInteger(const TCollection_ExtendedString & theName, const Standard_Integer theInteger);

		/****************** SetReal ******************/
		%feature("compactdefaultargs") SetReal;
		%feature("autodoc", "Defines a named real. if the real already exists, it changes its value to <thereal>.

Parameters
----------
theName: TCollection_ExtendedString
theReal: float

Returns
-------
None
") SetReal;
		void SetReal(const TCollection_ExtendedString & theName, const Standard_Real theReal);

		/****************** SetString ******************/
		%feature("compactdefaultargs") SetString;
		%feature("autodoc", "Defines a named string. if the string already exists, it changes its value to <thestring>.

Parameters
----------
theName: TCollection_ExtendedString
theString: TCollection_ExtendedString

Returns
-------
None
") SetString;
		void SetString(const TCollection_ExtendedString & theName, const TCollection_ExtendedString & theString);

};


%make_alias(TDataStd_NamedData)

%extend TDataStd_NamedData {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************
* class TDataStd_NoteBook *
**************************/
class TDataStd_NoteBook : public TDF_Attribute {
	public:
		/****************** TDataStd_NoteBook ******************/
		%feature("compactdefaultargs") TDataStd_NoteBook;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") TDataStd_NoteBook;
		 TDataStd_NoteBook();

		/****************** Append ******************/
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "Tool to create an integer attribute from <value>, insert it in a new son label of <self>. the real attribute is returned.

Parameters
----------
value: float
isExported: bool,optional
	default value is Standard_False

Returns
-------
opencascade::handle<TDataStd_Real>
") Append;
		opencascade::handle<TDataStd_Real> Append(const Standard_Real value, const Standard_Boolean isExported = Standard_False);

		/****************** Append ******************/
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "Tool to create an real attribute from <value>, insert it in a new son label of <self>. the integer attribute is returned.

Parameters
----------
value: int
isExported: bool,optional
	default value is Standard_False

Returns
-------
opencascade::handle<TDataStd_Integer>
") Append;
		opencascade::handle<TDataStd_Integer> Append(const Standard_Integer value, const Standard_Boolean isExported = Standard_False);


        %feature("autodoc", "1");
        %extend{
            std::string DumpToString() {
            std::stringstream s;
            self->Dump(s);
            return s.str();}
        };
		/****************** Find ******************/
		%feature("compactdefaultargs") Find;
		%feature("autodoc", "Class methods ============= try to retrieve a notebook attribute at <current> label or in fathers label of <current>. returns true if found and set <n>.

Parameters
----------
current: TDF_Label
N: TDataStd_NoteBook

Returns
-------
bool
") Find;
		static Standard_Boolean Find(const TDF_Label & current, opencascade::handle<TDataStd_NoteBook> & N);

		/****************** GetID ******************/
		%feature("compactdefaultargs") GetID;
		%feature("autodoc", "Notebook methods ===============.

Returns
-------
Standard_GUID
") GetID;
		static const Standard_GUID & GetID();

		/****************** ID ******************/
		%feature("compactdefaultargs") ID;
		%feature("autodoc", "No available documentation.

Returns
-------
Standard_GUID
") ID;
		const Standard_GUID & ID();

		/****************** New ******************/
		%feature("compactdefaultargs") New;
		%feature("autodoc", "Create an enpty notebook attribute, located at <label>. raises if <label> has attribute.

Parameters
----------
label: TDF_Label

Returns
-------
opencascade::handle<TDataStd_NoteBook>
") New;
		static opencascade::handle<TDataStd_NoteBook> New(const TDF_Label & label);

		/****************** NewEmpty ******************/
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TDF_Attribute>
") NewEmpty;
		opencascade::handle<TDF_Attribute> NewEmpty();

		/****************** Paste ******************/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "No available documentation.

Parameters
----------
into: TDF_Attribute
RT: TDF_RelocationTable

Returns
-------
None
") Paste;
		void Paste(const opencascade::handle<TDF_Attribute> & into, const opencascade::handle<TDF_RelocationTable> & RT);

		/****************** Restore ******************/
		%feature("compactdefaultargs") Restore;
		%feature("autodoc", "No available documentation.

Parameters
----------
with: TDF_Attribute

Returns
-------
None
") Restore;
		void Restore(const opencascade::handle<TDF_Attribute> & with);

};


%make_alias(TDataStd_NoteBook)

%extend TDataStd_NoteBook {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************
* class TDataStd_Real *
**********************/
class TDataStd_Real : public TDF_Attribute {
	public:
		/****************** TDataStd_Real ******************/
		%feature("compactdefaultargs") TDataStd_Real;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") TDataStd_Real;
		 TDataStd_Real();


        %feature("autodoc", "1");
        %extend{
            std::string DumpToString() {
            std::stringstream s;
            self->Dump(s);
            return s.str();}
        };
		/****************** Get ******************/
		%feature("compactdefaultargs") Get;
		%feature("autodoc", "Returns the real number value contained in the attribute.

Returns
-------
float
") Get;
		Standard_Real Get();

		/****************** GetDimension ******************/
		%feature("compactdefaultargs") GetDimension;
		%feature("autodoc", "Obsolete method that will be removed in next versions. this field is not supported in the persistence mechanism.

Returns
-------
TDataStd_RealEnum
") GetDimension;
		TDataStd_RealEnum GetDimension();

		/****************** GetID ******************/
		%feature("compactdefaultargs") GetID;
		%feature("autodoc", "Class methods ============= returns the default guid for real numbers.

Returns
-------
Standard_GUID
") GetID;
		static const Standard_GUID & GetID();

		/****************** ID ******************/
		%feature("compactdefaultargs") ID;
		%feature("autodoc", "No available documentation.

Returns
-------
Standard_GUID
") ID;
		const Standard_GUID & ID();

		/****************** IsCaptured ******************/
		%feature("compactdefaultargs") IsCaptured;
		%feature("autodoc", "Returns true if there is a reference on the same label.

Returns
-------
bool
") IsCaptured;
		Standard_Boolean IsCaptured();

		/****************** NewEmpty ******************/
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TDF_Attribute>
") NewEmpty;
		opencascade::handle<TDF_Attribute> NewEmpty();

		/****************** Paste ******************/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "No available documentation.

Parameters
----------
Into: TDF_Attribute
RT: TDF_RelocationTable

Returns
-------
None
") Paste;
		void Paste(const opencascade::handle<TDF_Attribute> & Into, const opencascade::handle<TDF_RelocationTable> & RT);

		/****************** Restore ******************/
		%feature("compactdefaultargs") Restore;
		%feature("autodoc", "No available documentation.

Parameters
----------
With: TDF_Attribute

Returns
-------
None
") Restore;
		void Restore(const opencascade::handle<TDF_Attribute> & With);

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "Finds, or creates, a real attribute with default guid and sets <value>. the real attribute is returned. the real dimension is scalar by default. use setdimension to overwrite. real methods ============.

Parameters
----------
label: TDF_Label
value: float

Returns
-------
opencascade::handle<TDataStd_Real>
") Set;
		static opencascade::handle<TDataStd_Real> Set(const TDF_Label & label, const Standard_Real value);

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "Finds, or creates, a real attribute with explicit guid and sets <value>. the real attribute is returned. real methods ============.

Parameters
----------
label: TDF_Label
guid: Standard_GUID
value: float

Returns
-------
opencascade::handle<TDataStd_Real>
") Set;
		static opencascade::handle<TDataStd_Real> Set(const TDF_Label & label, const Standard_GUID & guid, const Standard_Real value);

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "Sets the real number v.

Parameters
----------
V: float

Returns
-------
None
") Set;
		void Set(const Standard_Real V);

		/****************** SetDimension ******************/
		%feature("compactdefaultargs") SetDimension;
		%feature("autodoc", "Obsolete method that will be removed in next versions. this field is not supported in the persistence mechanism.

Parameters
----------
DIM: TDataStd_RealEnum

Returns
-------
None
") SetDimension;
		void SetDimension(const TDataStd_RealEnum DIM);

		/****************** SetID ******************/
		%feature("compactdefaultargs") SetID;
		%feature("autodoc", "Sets the explicit guid for the attribute.

Parameters
----------
guid: Standard_GUID

Returns
-------
None
") SetID;
		void SetID(const Standard_GUID & guid);

		/****************** SetID ******************/
		%feature("compactdefaultargs") SetID;
		%feature("autodoc", "Sets default guid for the attribute.

Returns
-------
None
") SetID;
		void SetID();

};


%make_alias(TDataStd_Real)

%extend TDataStd_Real {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************
* class TDataStd_RealArray *
***************************/
class TDataStd_RealArray : public TDF_Attribute {
	public:
		/****************** TDataStd_RealArray ******************/
		%feature("compactdefaultargs") TDataStd_RealArray;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") TDataStd_RealArray;
		 TDataStd_RealArray();

		/****************** Array ******************/
		%feature("compactdefaultargs") Array;
		%feature("autodoc", "Returns the handle of this array of reals.

Returns
-------
opencascade::handle<TColStd_HArray1OfReal>
") Array;
		const opencascade::handle<TColStd_HArray1OfReal> & Array();

		/****************** ChangeArray ******************/
		%feature("compactdefaultargs") ChangeArray;
		%feature("autodoc", "Sets the inner array <myvalue> of the realarray attribute to <newarray>. if value of <newarray> differs from <myvalue>, backup performed and myvalue refers to new instance of harray1ofreal that holds <newarray> values if <ischeckitems> equal true each item of <newarray> will be checked with each item of <myvalue> for coincidence (to avoid backup).

Parameters
----------
newArray: TColStd_HArray1OfReal
isCheckItems: bool,optional
	default value is Standard_True

Returns
-------
None
") ChangeArray;
		void ChangeArray(const opencascade::handle<TColStd_HArray1OfReal> & newArray, const Standard_Boolean isCheckItems = Standard_True);

		/****************** DeltaOnModification ******************/
		%feature("compactdefaultargs") DeltaOnModification;
		%feature("autodoc", "Makes a deltaonmodification between <self> and <anoldattribute>.

Parameters
----------
anOldAttribute: TDF_Attribute

Returns
-------
opencascade::handle<TDF_DeltaOnModification>
") DeltaOnModification;
		virtual opencascade::handle<TDF_DeltaOnModification> DeltaOnModification(const opencascade::handle<TDF_Attribute> & anOldAttribute);


        %feature("autodoc", "1");
        %extend{
            std::string DumpToString() {
            std::stringstream s;
            self->Dump(s);
            return s.str();}
        };
		/****************** GetDelta ******************/
		%feature("compactdefaultargs") GetDelta;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") GetDelta;
		Standard_Boolean GetDelta();

		/****************** GetID ******************/
		%feature("compactdefaultargs") GetID;
		%feature("autodoc", "Class methods ============= returns the guid for arrays of reals.

Returns
-------
Standard_GUID
") GetID;
		static const Standard_GUID & GetID();

		/****************** ID ******************/
		%feature("compactdefaultargs") ID;
		%feature("autodoc", "No available documentation.

Returns
-------
Standard_GUID
") ID;
		const Standard_GUID & ID();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Initialize the inner array with bounds from <lower> to <upper>.

Parameters
----------
lower: int
upper: int

Returns
-------
None
") Init;
		void Init(const Standard_Integer lower, const Standard_Integer upper);

		/****************** Length ******************/
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "Returns the number of elements of the array of reals in terms of the number of elements it contains.

Returns
-------
int
") Length;
		Standard_Integer Length();

		/****************** Lower ******************/
		%feature("compactdefaultargs") Lower;
		%feature("autodoc", "Returns the lower boundary of the array.

Returns
-------
int
") Lower;
		Standard_Integer Lower();

		/****************** NewEmpty ******************/
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TDF_Attribute>
") NewEmpty;
		opencascade::handle<TDF_Attribute> NewEmpty();

		/****************** Paste ******************/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "Note. uses inside changearray() method.

Parameters
----------
Into: TDF_Attribute
RT: TDF_RelocationTable

Returns
-------
None
") Paste;
		void Paste(const opencascade::handle<TDF_Attribute> & Into, const opencascade::handle<TDF_RelocationTable> & RT);

		/****************** Restore ******************/
		%feature("compactdefaultargs") Restore;
		%feature("autodoc", "No available documentation.

Parameters
----------
With: TDF_Attribute

Returns
-------
None
") Restore;
		void Restore(const opencascade::handle<TDF_Attribute> & With);

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "Finds or creates on the <label> a real array attribute with the specified <lower> and <upper> boundaries. if <isdelta> == false, defaultdeltaonmodification is used. if <isdelta> == true, deltaonmodification of the current attribute is used. if attribute is already set, input parameter <isdelta> is refused and the found attribute returned.

Parameters
----------
label: TDF_Label
lower: int
upper: int
isDelta: bool,optional
	default value is Standard_False

Returns
-------
opencascade::handle<TDataStd_RealArray>
") Set;
		static opencascade::handle<TDataStd_RealArray> Set(const TDF_Label & label, const Standard_Integer lower, const Standard_Integer upper, const Standard_Boolean isDelta = Standard_False);

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "Finds, or creates, an realarray attribute with explicit user defined <guid>. the realarray attribute is returned.

Parameters
----------
label: TDF_Label
theGuid: Standard_GUID
lower: int
upper: int
isDelta: bool,optional
	default value is Standard_False

Returns
-------
opencascade::handle<TDataStd_RealArray>
") Set;
		static opencascade::handle<TDataStd_RealArray> Set(const TDF_Label & label, const Standard_GUID & theGuid, const Standard_Integer lower, const Standard_Integer upper, const Standard_Boolean isDelta = Standard_False);

		/****************** SetDelta ******************/
		%feature("compactdefaultargs") SetDelta;
		%feature("autodoc", "For internal use only!.

Parameters
----------
isDelta: bool

Returns
-------
None
") SetDelta;
		void SetDelta(const Standard_Boolean isDelta);

		/****************** SetID ******************/
		%feature("compactdefaultargs") SetID;
		%feature("autodoc", "Sets the explicit guid (user defined) for the attribute.

Parameters
----------
theGuid: Standard_GUID

Returns
-------
None
") SetID;
		void SetID(const Standard_GUID & theGuid);

		/****************** SetID ******************/
		%feature("compactdefaultargs") SetID;
		%feature("autodoc", "Sets default guid for the attribute.

Returns
-------
None
") SetID;
		void SetID();

		/****************** SetValue ******************/
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "Sets the <index>th element of the array to <value> outofrange exception is raised if <index> doesn't respect lower and upper bounds of the internal array.

Parameters
----------
Index: int
Value: float

Returns
-------
None
") SetValue;
		void SetValue(const Standard_Integer Index, const Standard_Real Value);

		/****************** Upper ******************/
		%feature("compactdefaultargs") Upper;
		%feature("autodoc", "Returns the upper boundary of the array.

Returns
-------
int
") Upper;
		Standard_Integer Upper();

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Return the value of the <index>th element of the array.

Parameters
----------
Index: int

Returns
-------
float
") Value;
		Standard_Real Value(const Standard_Integer Index);

};


%make_alias(TDataStd_RealArray)

%extend TDataStd_RealArray {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************
* class TDataStd_RealList *
**************************/
class TDataStd_RealList : public TDF_Attribute {
	public:
		/****************** TDataStd_RealList ******************/
		%feature("compactdefaultargs") TDataStd_RealList;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") TDataStd_RealList;
		 TDataStd_RealList();

		/****************** Append ******************/
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "No available documentation.

Parameters
----------
value: float

Returns
-------
None
") Append;
		void Append(const Standard_Real value);

		/****************** Clear ******************/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Clear;
		void Clear();


        %feature("autodoc", "1");
        %extend{
            std::string DumpToString() {
            std::stringstream s;
            self->Dump(s);
            return s.str();}
        };
		/****************** Extent ******************/
		%feature("compactdefaultargs") Extent;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") Extent;
		Standard_Integer Extent();

		/****************** First ******************/
		%feature("compactdefaultargs") First;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") First;
		Standard_Real First();

		/****************** GetID ******************/
		%feature("compactdefaultargs") GetID;
		%feature("autodoc", "Static methods ============== returns the id of the list of doubles attribute.

Returns
-------
Standard_GUID
") GetID;
		static const Standard_GUID & GetID();

		/****************** ID ******************/
		%feature("compactdefaultargs") ID;
		%feature("autodoc", "No available documentation.

Returns
-------
Standard_GUID
") ID;
		const Standard_GUID & ID();

		/****************** InsertAfter ******************/
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "Inserts the <value> after the first meet of <after_value>.

Parameters
----------
value: float
after_value: float

Returns
-------
bool
") InsertAfter;
		Standard_Boolean InsertAfter(const Standard_Real value, const Standard_Real after_value);

		/****************** InsertAfterByIndex ******************/
		%feature("compactdefaultargs") InsertAfterByIndex;
		%feature("autodoc", "Inserts the <value> after the <index> position. the indices start with 1 .. extent().

Parameters
----------
index: int
after_value: float

Returns
-------
bool
") InsertAfterByIndex;
		Standard_Boolean InsertAfterByIndex(const Standard_Integer index, const Standard_Real after_value);

		/****************** InsertBefore ******************/
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "Inserts the <value> before the first meet of <before_value>.

Parameters
----------
value: float
before_value: float

Returns
-------
bool
") InsertBefore;
		Standard_Boolean InsertBefore(const Standard_Real value, const Standard_Real before_value);

		/****************** InsertBeforeByIndex ******************/
		%feature("compactdefaultargs") InsertBeforeByIndex;
		%feature("autodoc", "Inserts the <value> before the <index> position. the indices start with 1 .. extent().

Parameters
----------
index: int
before_value: float

Returns
-------
bool
") InsertBeforeByIndex;
		Standard_Boolean InsertBeforeByIndex(const Standard_Integer index, const Standard_Real before_value);

		/****************** IsEmpty ******************/
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsEmpty;
		Standard_Boolean IsEmpty();

		/****************** Last ******************/
		%feature("compactdefaultargs") Last;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") Last;
		Standard_Real Last();

		/****************** List ******************/
		%feature("compactdefaultargs") List;
		%feature("autodoc", "No available documentation.

Returns
-------
TColStd_ListOfReal
") List;
		const TColStd_ListOfReal & List();

		/****************** NewEmpty ******************/
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TDF_Attribute>
") NewEmpty;
		opencascade::handle<TDF_Attribute> NewEmpty();

		/****************** Paste ******************/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "No available documentation.

Parameters
----------
Into: TDF_Attribute
RT: TDF_RelocationTable

Returns
-------
None
") Paste;
		void Paste(const opencascade::handle<TDF_Attribute> & Into, const opencascade::handle<TDF_RelocationTable> & RT);

		/****************** Prepend ******************/
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "No available documentation.

Parameters
----------
value: float

Returns
-------
None
") Prepend;
		void Prepend(const Standard_Real value);

		/****************** Remove ******************/
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "Removes the first meet of the <value>.

Parameters
----------
value: float

Returns
-------
bool
") Remove;
		Standard_Boolean Remove(const Standard_Real value);

		/****************** RemoveByIndex ******************/
		%feature("compactdefaultargs") RemoveByIndex;
		%feature("autodoc", "Removes a value at <index> position.

Parameters
----------
index: int

Returns
-------
bool
") RemoveByIndex;
		Standard_Boolean RemoveByIndex(const Standard_Integer index);

		/****************** Restore ******************/
		%feature("compactdefaultargs") Restore;
		%feature("autodoc", "No available documentation.

Parameters
----------
With: TDF_Attribute

Returns
-------
None
") Restore;
		void Restore(const opencascade::handle<TDF_Attribute> & With);

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "Finds or creates a list of double values attribute.

Parameters
----------
label: TDF_Label

Returns
-------
opencascade::handle<TDataStd_RealList>
") Set;
		static opencascade::handle<TDataStd_RealList> Set(const TDF_Label & label);

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "Finds or creates a list of double values attribute with explicit user defined <guid>.

Parameters
----------
label: TDF_Label
theGuid: Standard_GUID

Returns
-------
opencascade::handle<TDataStd_RealList>
") Set;
		static opencascade::handle<TDataStd_RealList> Set(const TDF_Label & label, const Standard_GUID & theGuid);

		/****************** SetID ******************/
		%feature("compactdefaultargs") SetID;
		%feature("autodoc", "Sets the explicit guid (user defined) for the attribute.

Parameters
----------
theGuid: Standard_GUID

Returns
-------
None
") SetID;
		void SetID(const Standard_GUID & theGuid);

		/****************** SetID ******************/
		%feature("compactdefaultargs") SetID;
		%feature("autodoc", "Sets default guid for the attribute.

Returns
-------
None
") SetID;
		void SetID();

};


%make_alias(TDataStd_RealList)

%extend TDataStd_RealList {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************
* class TDataStd_ReferenceArray *
********************************/
class TDataStd_ReferenceArray : public TDF_Attribute {
	public:
		/****************** TDataStd_ReferenceArray ******************/
		%feature("compactdefaultargs") TDataStd_ReferenceArray;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") TDataStd_ReferenceArray;
		 TDataStd_ReferenceArray();


        %feature("autodoc", "1");
        %extend{
            std::string DumpToString() {
            std::stringstream s;
            self->Dump(s);
            return s.str();}
        };
		/****************** GetID ******************/
		%feature("compactdefaultargs") GetID;
		%feature("autodoc", "Static methods ============== returns the id of the array of references (labels) attribute.

Returns
-------
Standard_GUID
") GetID;
		static const Standard_GUID & GetID();

		/****************** ID ******************/
		%feature("compactdefaultargs") ID;
		%feature("autodoc", "No available documentation.

Returns
-------
Standard_GUID
") ID;
		const Standard_GUID & ID();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Initialize the inner array with bounds from <lower> to <upper>.

Parameters
----------
lower: int
upper: int

Returns
-------
None
") Init;
		void Init(const Standard_Integer lower, const Standard_Integer upper);

		/****************** InternalArray ******************/
		%feature("compactdefaultargs") InternalArray;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TDataStd_HLabelArray1>
") InternalArray;
		const opencascade::handle<TDataStd_HLabelArray1> & InternalArray();

		/****************** Length ******************/
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "Returns the number of elements in the array.

Returns
-------
int
") Length;
		Standard_Integer Length();

		/****************** Lower ******************/
		%feature("compactdefaultargs") Lower;
		%feature("autodoc", "Returns the lower boundary of the array.

Returns
-------
int
") Lower;
		Standard_Integer Lower();

		/****************** NewEmpty ******************/
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TDF_Attribute>
") NewEmpty;
		opencascade::handle<TDF_Attribute> NewEmpty();

		/****************** Paste ******************/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "No available documentation.

Parameters
----------
Into: TDF_Attribute
RT: TDF_RelocationTable

Returns
-------
None
") Paste;
		void Paste(const opencascade::handle<TDF_Attribute> & Into, const opencascade::handle<TDF_RelocationTable> & RT);

		/****************** References ******************/
		%feature("compactdefaultargs") References;
		%feature("autodoc", "No available documentation.

Parameters
----------
DS: TDF_DataSet

Returns
-------
None
") References;
		virtual void References(const opencascade::handle<TDF_DataSet> & DS);

		/****************** Restore ******************/
		%feature("compactdefaultargs") Restore;
		%feature("autodoc", "No available documentation.

Parameters
----------
With: TDF_Attribute

Returns
-------
None
") Restore;
		void Restore(const opencascade::handle<TDF_Attribute> & With);

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "Finds or creates an array of reference values (labels) attribute.

Parameters
----------
label: TDF_Label
lower: int
upper: int

Returns
-------
opencascade::handle<TDataStd_ReferenceArray>
") Set;
		static opencascade::handle<TDataStd_ReferenceArray> Set(const TDF_Label & label, const Standard_Integer lower, const Standard_Integer upper);

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "Finds or creates an array of reference values (labels) attribute with explicit user defined <guid>.

Parameters
----------
label: TDF_Label
theGuid: Standard_GUID
lower: int
upper: int

Returns
-------
opencascade::handle<TDataStd_ReferenceArray>
") Set;
		static opencascade::handle<TDataStd_ReferenceArray> Set(const TDF_Label & label, const Standard_GUID & theGuid, const Standard_Integer lower, const Standard_Integer upper);

		/****************** SetID ******************/
		%feature("compactdefaultargs") SetID;
		%feature("autodoc", "Sets the explicit guid (user defined) for the attribute.

Parameters
----------
theGuid: Standard_GUID

Returns
-------
None
") SetID;
		void SetID(const Standard_GUID & theGuid);

		/****************** SetID ******************/
		%feature("compactdefaultargs") SetID;
		%feature("autodoc", "Sets default guid for the attribute.

Returns
-------
None
") SetID;
		void SetID();

		/****************** SetInternalArray ******************/
		%feature("compactdefaultargs") SetInternalArray;
		%feature("autodoc", "No available documentation.

Parameters
----------
values: TDataStd_HLabelArray1
isCheckItems: bool,optional
	default value is Standard_True

Returns
-------
None
") SetInternalArray;
		void SetInternalArray(const opencascade::handle<TDataStd_HLabelArray1> & values, const Standard_Boolean isCheckItems = Standard_True);

		/****************** SetValue ******************/
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "Sets the <index>th element of the array to <value> outofrange exception is raised if <index> doesn't respect lower and upper bounds of the internal array.

Parameters
----------
index: int
value: TDF_Label

Returns
-------
None
") SetValue;
		void SetValue(const Standard_Integer index, const TDF_Label & value);

		/****************** Upper ******************/
		%feature("compactdefaultargs") Upper;
		%feature("autodoc", "Returns the upper boundary of the array.

Returns
-------
int
") Upper;
		Standard_Integer Upper();

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Returns the value of the <index>th element of the array.

Parameters
----------
Index: int

Returns
-------
TDF_Label
") Value;
		TDF_Label Value(const Standard_Integer Index);

};


%make_alias(TDataStd_ReferenceArray)

%extend TDataStd_ReferenceArray {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************
* class TDataStd_ReferenceList *
*******************************/
class TDataStd_ReferenceList : public TDF_Attribute {
	public:
		/****************** TDataStd_ReferenceList ******************/
		%feature("compactdefaultargs") TDataStd_ReferenceList;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") TDataStd_ReferenceList;
		 TDataStd_ReferenceList();

		/****************** Append ******************/
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "No available documentation.

Parameters
----------
value: TDF_Label

Returns
-------
None
") Append;
		void Append(const TDF_Label & value);

		/****************** Clear ******************/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Clear;
		void Clear();


        %feature("autodoc", "1");
        %extend{
            std::string DumpToString() {
            std::stringstream s;
            self->Dump(s);
            return s.str();}
        };
		/****************** Extent ******************/
		%feature("compactdefaultargs") Extent;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") Extent;
		Standard_Integer Extent();

		/****************** First ******************/
		%feature("compactdefaultargs") First;
		%feature("autodoc", "No available documentation.

Returns
-------
TDF_Label
") First;
		const TDF_Label & First();

		/****************** GetID ******************/
		%feature("compactdefaultargs") GetID;
		%feature("autodoc", "Static methods ============== returns the id of the list of references (labels) attribute.

Returns
-------
Standard_GUID
") GetID;
		static const Standard_GUID & GetID();

		/****************** ID ******************/
		%feature("compactdefaultargs") ID;
		%feature("autodoc", "No available documentation.

Returns
-------
Standard_GUID
") ID;
		const Standard_GUID & ID();

		/****************** InsertAfter ******************/
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "Inserts the <value> after the first meet of <after_value>.

Parameters
----------
value: TDF_Label
after_value: TDF_Label

Returns
-------
bool
") InsertAfter;
		Standard_Boolean InsertAfter(const TDF_Label & value, const TDF_Label & after_value);

		/****************** InsertAfter ******************/
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "Inserts the label after the <index> position. the indices start with 1 .. extent().

Parameters
----------
index: int
after_value: TDF_Label

Returns
-------
bool
") InsertAfter;
		Standard_Boolean InsertAfter(const Standard_Integer index, const TDF_Label & after_value);

		/****************** InsertBefore ******************/
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "Inserts the <value> before the first meet of <before_value>.

Parameters
----------
value: TDF_Label
before_value: TDF_Label

Returns
-------
bool
") InsertBefore;
		Standard_Boolean InsertBefore(const TDF_Label & value, const TDF_Label & before_value);

		/****************** InsertBefore ******************/
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "Inserts the label before the <index> position. the indices start with 1 .. extent().

Parameters
----------
index: int
before_value: TDF_Label

Returns
-------
bool
") InsertBefore;
		Standard_Boolean InsertBefore(const Standard_Integer index, const TDF_Label & before_value);

		/****************** IsEmpty ******************/
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsEmpty;
		Standard_Boolean IsEmpty();

		/****************** Last ******************/
		%feature("compactdefaultargs") Last;
		%feature("autodoc", "No available documentation.

Returns
-------
TDF_Label
") Last;
		const TDF_Label & Last();

		/****************** List ******************/
		%feature("compactdefaultargs") List;
		%feature("autodoc", "No available documentation.

Returns
-------
TDF_LabelList
") List;
		const TDF_LabelList & List();

		/****************** NewEmpty ******************/
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TDF_Attribute>
") NewEmpty;
		opencascade::handle<TDF_Attribute> NewEmpty();

		/****************** Paste ******************/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "No available documentation.

Parameters
----------
Into: TDF_Attribute
RT: TDF_RelocationTable

Returns
-------
None
") Paste;
		void Paste(const opencascade::handle<TDF_Attribute> & Into, const opencascade::handle<TDF_RelocationTable> & RT);

		/****************** Prepend ******************/
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "No available documentation.

Parameters
----------
value: TDF_Label

Returns
-------
None
") Prepend;
		void Prepend(const TDF_Label & value);

		/****************** References ******************/
		%feature("compactdefaultargs") References;
		%feature("autodoc", "No available documentation.

Parameters
----------
DS: TDF_DataSet

Returns
-------
None
") References;
		virtual void References(const opencascade::handle<TDF_DataSet> & DS);

		/****************** Remove ******************/
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "Removes the first meet of the <value>.

Parameters
----------
value: TDF_Label

Returns
-------
bool
") Remove;
		Standard_Boolean Remove(const TDF_Label & value);

		/****************** Remove ******************/
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "Removes a label at 'index' position.

Parameters
----------
index: int

Returns
-------
bool
") Remove;
		Standard_Boolean Remove(const Standard_Integer index);

		/****************** Restore ******************/
		%feature("compactdefaultargs") Restore;
		%feature("autodoc", "No available documentation.

Parameters
----------
With: TDF_Attribute

Returns
-------
None
") Restore;
		void Restore(const opencascade::handle<TDF_Attribute> & With);

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "Finds or creates a list of reference values (labels) attribute.

Parameters
----------
label: TDF_Label

Returns
-------
opencascade::handle<TDataStd_ReferenceList>
") Set;
		static opencascade::handle<TDataStd_ReferenceList> Set(const TDF_Label & label);

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "Finds or creates a list of reference values (labels) attribute with explicit user defined <guid>.

Parameters
----------
label: TDF_Label
theGuid: Standard_GUID

Returns
-------
opencascade::handle<TDataStd_ReferenceList>
") Set;
		static opencascade::handle<TDataStd_ReferenceList> Set(const TDF_Label & label, const Standard_GUID & theGuid);

		/****************** SetID ******************/
		%feature("compactdefaultargs") SetID;
		%feature("autodoc", "Sets the explicit guid (user defined) for the attribute.

Parameters
----------
theGuid: Standard_GUID

Returns
-------
None
") SetID;
		void SetID(const Standard_GUID & theGuid);

		/****************** SetID ******************/
		%feature("compactdefaultargs") SetID;
		%feature("autodoc", "Sets default guid for the attribute.

Returns
-------
None
") SetID;
		void SetID();

};


%make_alias(TDataStd_ReferenceList)

%extend TDataStd_ReferenceList {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************
* class TDataStd_Relation *
**************************/
class TDataStd_Relation : public TDF_Attribute {
	public:
		/****************** TDataStd_Relation ******************/
		%feature("compactdefaultargs") TDataStd_Relation;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") TDataStd_Relation;
		 TDataStd_Relation();


        %feature("autodoc", "1");
        %extend{
            std::string DumpToString() {
            std::stringstream s;
            self->Dump(s);
            return s.str();}
        };
		/****************** GetID ******************/
		%feature("compactdefaultargs") GetID;
		%feature("autodoc", "Class methods =============.

Returns
-------
Standard_GUID
") GetID;
		static const Standard_GUID & GetID();

		/****************** GetRelation ******************/
		%feature("compactdefaultargs") GetRelation;
		%feature("autodoc", "No available documentation.

Returns
-------
TCollection_ExtendedString
") GetRelation;
		const TCollection_ExtendedString & GetRelation();

		/****************** GetVariables ******************/
		%feature("compactdefaultargs") GetVariables;
		%feature("autodoc", "No available documentation.

Returns
-------
TDF_AttributeList
") GetVariables;
		TDF_AttributeList & GetVariables();

		/****************** ID ******************/
		%feature("compactdefaultargs") ID;
		%feature("autodoc", "No available documentation.

Returns
-------
Standard_GUID
") ID;
		const Standard_GUID & ID();

		/****************** Name ******************/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "Build and return the relation name.

Returns
-------
TCollection_ExtendedString
") Name;
		TCollection_ExtendedString Name();

		/****************** NewEmpty ******************/
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TDF_Attribute>
") NewEmpty;
		opencascade::handle<TDF_Attribute> NewEmpty();

		/****************** Paste ******************/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "No available documentation.

Parameters
----------
Into: TDF_Attribute
RT: TDF_RelocationTable

Returns
-------
None
") Paste;
		void Paste(const opencascade::handle<TDF_Attribute> & Into, const opencascade::handle<TDF_RelocationTable> & RT);

		/****************** Restore ******************/
		%feature("compactdefaultargs") Restore;
		%feature("autodoc", "No available documentation.

Parameters
----------
With: TDF_Attribute

Returns
-------
None
") Restore;
		void Restore(const opencascade::handle<TDF_Attribute> & With);

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "Find, or create, an relation attribute. real methods ============.

Parameters
----------
label: TDF_Label

Returns
-------
opencascade::handle<TDataStd_Relation>
") Set;
		static opencascade::handle<TDataStd_Relation> Set(const TDF_Label & label);

		/****************** SetRelation ******************/
		%feature("compactdefaultargs") SetRelation;
		%feature("autodoc", "No available documentation.

Parameters
----------
E: TCollection_ExtendedString

Returns
-------
None
") SetRelation;
		void SetRelation(const TCollection_ExtendedString & E);

};


%make_alias(TDataStd_Relation)

%extend TDataStd_Relation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************
* class TDataStd_Tick *
**********************/
class TDataStd_Tick : public TDF_Attribute {
	public:
		/****************** TDataStd_Tick ******************/
		%feature("compactdefaultargs") TDataStd_Tick;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") TDataStd_Tick;
		 TDataStd_Tick();


        %feature("autodoc", "1");
        %extend{
            std::string DumpToString() {
            std::stringstream s;
            self->Dump(s);
            return s.str();}
        };
		/****************** GetID ******************/
		%feature("compactdefaultargs") GetID;
		%feature("autodoc", "Static methods ==============.

Returns
-------
Standard_GUID
") GetID;
		static const Standard_GUID & GetID();

		/****************** ID ******************/
		%feature("compactdefaultargs") ID;
		%feature("autodoc", "No available documentation.

Returns
-------
Standard_GUID
") ID;
		const Standard_GUID & ID();

		/****************** NewEmpty ******************/
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TDF_Attribute>
") NewEmpty;
		opencascade::handle<TDF_Attribute> NewEmpty();

		/****************** Paste ******************/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "No available documentation.

Parameters
----------
Into: TDF_Attribute
RT: TDF_RelocationTable

Returns
-------
None
") Paste;
		void Paste(const opencascade::handle<TDF_Attribute> & Into, const opencascade::handle<TDF_RelocationTable> & RT);

		/****************** Restore ******************/
		%feature("compactdefaultargs") Restore;
		%feature("autodoc", "No available documentation.

Parameters
----------
With: TDF_Attribute

Returns
-------
None
") Restore;
		void Restore(const opencascade::handle<TDF_Attribute> & With);

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "Find, or create, a tick attribute. tick methods ============.

Parameters
----------
label: TDF_Label

Returns
-------
opencascade::handle<TDataStd_Tick>
") Set;
		static opencascade::handle<TDataStd_Tick> Set(const TDF_Label & label);

};


%make_alias(TDataStd_Tick)

%extend TDataStd_Tick {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************
* class TDataStd_TreeNode *
**************************/
class TDataStd_TreeNode : public TDF_Attribute {
	public:
		/****************** TDataStd_TreeNode ******************/
		%feature("compactdefaultargs") TDataStd_TreeNode;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") TDataStd_TreeNode;
		 TDataStd_TreeNode();

		/****************** AfterAddition ******************/
		%feature("compactdefaultargs") AfterAddition;
		%feature("autodoc", "Connect the treenode to its father child list.

Returns
-------
None
") AfterAddition;
		virtual void AfterAddition();

		/****************** AfterResume ******************/
		%feature("compactdefaultargs") AfterResume;
		%feature("autodoc", "Reconnect the treenode to its father child list.

Returns
-------
None
") AfterResume;
		virtual void AfterResume();

		/****************** AfterUndo ******************/
		%feature("compactdefaultargs") AfterUndo;
		%feature("autodoc", "Reconnect the treenode, if necessary. implementation of attribute methods: ===================================.

Parameters
----------
anAttDelta: TDF_AttributeDelta
forceIt: bool,optional
	default value is Standard_False

Returns
-------
bool
") AfterUndo;
		virtual Standard_Boolean AfterUndo(const opencascade::handle<TDF_AttributeDelta> & anAttDelta, const Standard_Boolean forceIt = Standard_False);

		/****************** Append ******************/
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "Insert the treenode <child> as last child of <self>. if the insertion is successful <self> becomes the father of <child>.

Parameters
----------
Child: TDataStd_TreeNode

Returns
-------
bool
") Append;
		Standard_Boolean Append(const opencascade::handle<TDataStd_TreeNode> & Child);

		/****************** BeforeForget ******************/
		%feature("compactdefaultargs") BeforeForget;
		%feature("autodoc", "Disconnect the treenode from its father child list.

Returns
-------
None
") BeforeForget;
		virtual void BeforeForget();

		/****************** BeforeUndo ******************/
		%feature("compactdefaultargs") BeforeUndo;
		%feature("autodoc", "Disconnect the treenode, if necessary.

Parameters
----------
anAttDelta: TDF_AttributeDelta
forceIt: bool,optional
	default value is Standard_False

Returns
-------
bool
") BeforeUndo;
		virtual Standard_Boolean BeforeUndo(const opencascade::handle<TDF_AttributeDelta> & anAttDelta, const Standard_Boolean forceIt = Standard_False);

		/****************** Depth ******************/
		%feature("compactdefaultargs") Depth;
		%feature("autodoc", "Returns the depth of this tree node in the overall tree node structure. in other words, the number of father tree nodes of this one is returned.

Returns
-------
int
") Depth;
		Standard_Integer Depth();


        %feature("autodoc", "1");
        %extend{
            std::string DumpToString() {
            std::stringstream s;
            self->Dump(s);
            return s.str();}
        };
		/****************** Father ******************/
		%feature("compactdefaultargs") Father;
		%feature("autodoc", "Returns the father treenode of <self>. null if root.

Returns
-------
opencascade::handle<TDataStd_TreeNode>
") Father;
		opencascade::handle<TDataStd_TreeNode> Father();

		/****************** Find ******************/
		%feature("compactdefaultargs") Find;
		%feature("autodoc", "Class methods working on the node =================================== returns true if the tree node t is found on the label l. otherwise, false is returned.

Parameters
----------
L: TDF_Label
T: TDataStd_TreeNode

Returns
-------
bool
") Find;
		static Standard_Boolean Find(const TDF_Label & L, opencascade::handle<TDataStd_TreeNode> & T);

		/****************** FindLast ******************/
		%feature("compactdefaultargs") FindLast;
		%feature("autodoc", "Returns the last child tree node in this tree node object. to set fields =============.

Returns
-------
opencascade::handle<TDataStd_TreeNode>
") FindLast;
		opencascade::handle<TDataStd_TreeNode> FindLast();

		/****************** First ******************/
		%feature("compactdefaultargs") First;
		%feature("autodoc", "Returns the first child tree node in this tree node object.

Returns
-------
opencascade::handle<TDataStd_TreeNode>
") First;
		opencascade::handle<TDataStd_TreeNode> First();

		/****************** GetDefaultTreeID ******************/
		%feature("compactdefaultargs") GetDefaultTreeID;
		%feature("autodoc", "Returns a default tree id. this id is used by the <set> method without explicit tree id. instance methods: ================.

Returns
-------
Standard_GUID
") GetDefaultTreeID;
		static const Standard_GUID & GetDefaultTreeID();

		/****************** HasFather ******************/
		%feature("compactdefaultargs") HasFather;
		%feature("autodoc", "Returns true if this tree node attribute has a father tree node.

Returns
-------
bool
") HasFather;
		Standard_Boolean HasFather();

		/****************** HasFirst ******************/
		%feature("compactdefaultargs") HasFirst;
		%feature("autodoc", "Returns true if this tree node attribute has a first child tree node.

Returns
-------
bool
") HasFirst;
		Standard_Boolean HasFirst();

		/****************** HasLast ******************/
		%feature("compactdefaultargs") HasLast;
		%feature("autodoc", "Returns true if this tree node attribute has a last child tree node.

Returns
-------
bool
") HasLast;
		Standard_Boolean HasLast();

		/****************** HasNext ******************/
		%feature("compactdefaultargs") HasNext;
		%feature("autodoc", "Returns true if this tree node attribute has a next tree node.

Returns
-------
bool
") HasNext;
		Standard_Boolean HasNext();

		/****************** HasPrevious ******************/
		%feature("compactdefaultargs") HasPrevious;
		%feature("autodoc", "Returns true if this tree node attribute has a previous tree node.

Returns
-------
bool
") HasPrevious;
		Standard_Boolean HasPrevious();

		/****************** ID ******************/
		%feature("compactdefaultargs") ID;
		%feature("autodoc", "Returns the tree id (default or explicit one depending onthe set method used).

Returns
-------
Standard_GUID
") ID;
		const Standard_GUID & ID();

		/****************** InsertAfter ******************/
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "Inserts the treenode <node> after <self>. if insertion is successful <self> and <node> belongs to the same father.

Parameters
----------
Node: TDataStd_TreeNode

Returns
-------
bool
") InsertAfter;
		Standard_Boolean InsertAfter(const opencascade::handle<TDataStd_TreeNode> & Node);

		/****************** InsertBefore ******************/
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "Inserts the treenode <node> before <self>. if insertion is successful <self> and <node> belongs to the same father.

Parameters
----------
Node: TDataStd_TreeNode

Returns
-------
bool
") InsertBefore;
		Standard_Boolean InsertBefore(const opencascade::handle<TDataStd_TreeNode> & Node);

		/****************** IsAscendant ******************/
		%feature("compactdefaultargs") IsAscendant;
		%feature("autodoc", "Returns true if this tree node attribute is an ascendant of of. in other words, if it is a father or the father of a father of of.

Parameters
----------
of: TDataStd_TreeNode

Returns
-------
bool
") IsAscendant;
		Standard_Boolean IsAscendant(const opencascade::handle<TDataStd_TreeNode> & of);

		/****************** IsChild ******************/
		%feature("compactdefaultargs") IsChild;
		%feature("autodoc", "Returns true if this tree node attribute is a child of of.

Parameters
----------
of: TDataStd_TreeNode

Returns
-------
bool
") IsChild;
		Standard_Boolean IsChild(const opencascade::handle<TDataStd_TreeNode> & of);

		/****************** IsDescendant ******************/
		%feature("compactdefaultargs") IsDescendant;
		%feature("autodoc", "Returns true if this tree node attribute is a descendant of of. in other words, if it is a child or the child of a child of of.

Parameters
----------
of: TDataStd_TreeNode

Returns
-------
bool
") IsDescendant;
		Standard_Boolean IsDescendant(const opencascade::handle<TDataStd_TreeNode> & of);

		/****************** IsFather ******************/
		%feature("compactdefaultargs") IsFather;
		%feature("autodoc", "Returns true if this tree node attribute is a father of of.

Parameters
----------
of: TDataStd_TreeNode

Returns
-------
bool
") IsFather;
		Standard_Boolean IsFather(const opencascade::handle<TDataStd_TreeNode> & of);

		/****************** IsRoot ******************/
		%feature("compactdefaultargs") IsRoot;
		%feature("autodoc", "Returns true if this tree node attribute is the ultimate father in the tree.

Returns
-------
bool
") IsRoot;
		Standard_Boolean IsRoot();

		/****************** Last ******************/
		%feature("compactdefaultargs") Last;
		%feature("autodoc", "Returns the last child tree node in this tree node object.

Returns
-------
opencascade::handle<TDataStd_TreeNode>
") Last;
		opencascade::handle<TDataStd_TreeNode> Last();

		/****************** NbChildren ******************/
		%feature("compactdefaultargs") NbChildren;
		%feature("autodoc", "Returns the number of child nodes. if <alllevels> is true, the method counts children of all levels (children of children ...).

Parameters
----------
allLevels: bool,optional
	default value is Standard_False

Returns
-------
int
") NbChildren;
		Standard_Integer NbChildren(const Standard_Boolean allLevels = Standard_False);

		/****************** NewEmpty ******************/
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TDF_Attribute>
") NewEmpty;
		virtual opencascade::handle<TDF_Attribute> NewEmpty();

		/****************** Next ******************/
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "Returns the next tree node in this tree node attribute. warning this tree node is null if it is the last one in this tree node attribute.returns the next treenode of <self>. null if last.

Returns
-------
opencascade::handle<TDataStd_TreeNode>
") Next;
		opencascade::handle<TDataStd_TreeNode> Next();

		/****************** Paste ******************/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "No available documentation.

Parameters
----------
into: TDF_Attribute
RT: TDF_RelocationTable

Returns
-------
None
") Paste;
		virtual void Paste(const opencascade::handle<TDF_Attribute> & into, const opencascade::handle<TDF_RelocationTable> & RT);

		/****************** Prepend ******************/
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "Insert the the treenode <child> as first child of <self>. if the insertion is successful <self> becomes the father of <child>.

Parameters
----------
Child: TDataStd_TreeNode

Returns
-------
bool
") Prepend;
		Standard_Boolean Prepend(const opencascade::handle<TDataStd_TreeNode> & Child);

		/****************** Previous ******************/
		%feature("compactdefaultargs") Previous;
		%feature("autodoc", "Returns the previous tree node of this tree node attribute. warning this tree node is null if it is the first one in this tree node attribute.

Returns
-------
opencascade::handle<TDataStd_TreeNode>
") Previous;
		opencascade::handle<TDataStd_TreeNode> Previous();

		/****************** References ******************/
		%feature("compactdefaultargs") References;
		%feature("autodoc", "No available documentation.

Parameters
----------
aDataSet: TDF_DataSet

Returns
-------
None
") References;
		virtual void References(const opencascade::handle<TDF_DataSet> & aDataSet);

		/****************** Remove ******************/
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "Removes this tree node attribute from its father node. the result is that this attribute becomes a root node.

Returns
-------
bool
") Remove;
		Standard_Boolean Remove();

		/****************** Restore ******************/
		%feature("compactdefaultargs") Restore;
		%feature("autodoc", "No available documentation.

Parameters
----------
with: TDF_Attribute

Returns
-------
None
") Restore;
		virtual void Restore(const opencascade::handle<TDF_Attribute> & with);

		/****************** Root ******************/
		%feature("compactdefaultargs") Root;
		%feature("autodoc", "Returns the ultimate father of this tree node attribute.

Returns
-------
opencascade::handle<TDataStd_TreeNode>
") Root;
		opencascade::handle<TDataStd_TreeNode> Root();

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "Finds or creates a treenode attribute on the label <l> with the default tree id, returned by the method <getdefaulttreeid>. returns the created/found treenode attribute.

Parameters
----------
L: TDF_Label

Returns
-------
opencascade::handle<TDataStd_TreeNode>
") Set;
		static opencascade::handle<TDataStd_TreeNode> Set(const TDF_Label & L);

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "Finds or creates a treenode attribute on the label <l>, with an explicit tree id. <explicittreeid> is the id returned by <tdf_attribute::id> method. returns the found/created treenode attribute.

Parameters
----------
L: TDF_Label
ExplicitTreeID: Standard_GUID

Returns
-------
opencascade::handle<TDataStd_TreeNode>
") Set;
		static opencascade::handle<TDataStd_TreeNode> Set(const TDF_Label & L, const Standard_GUID & ExplicitTreeID);

		/****************** SetFather ******************/
		%feature("compactdefaultargs") SetFather;
		%feature("autodoc", "No available documentation.

Parameters
----------
F: TDataStd_TreeNode

Returns
-------
None
") SetFather;
		void SetFather(const opencascade::handle<TDataStd_TreeNode> & F);

		/****************** SetFirst ******************/
		%feature("compactdefaultargs") SetFirst;
		%feature("autodoc", "No available documentation.

Parameters
----------
F: TDataStd_TreeNode

Returns
-------
None
") SetFirst;
		void SetFirst(const opencascade::handle<TDataStd_TreeNode> & F);

		/****************** SetLast ******************/
		%feature("compactdefaultargs") SetLast;
		%feature("autodoc", "Treenode callback: ==================.

Parameters
----------
F: TDataStd_TreeNode

Returns
-------
None
") SetLast;
		void SetLast(const opencascade::handle<TDataStd_TreeNode> & F);

		/****************** SetNext ******************/
		%feature("compactdefaultargs") SetNext;
		%feature("autodoc", "No available documentation.

Parameters
----------
F: TDataStd_TreeNode

Returns
-------
None
") SetNext;
		void SetNext(const opencascade::handle<TDataStd_TreeNode> & F);

		/****************** SetPrevious ******************/
		%feature("compactdefaultargs") SetPrevious;
		%feature("autodoc", "No available documentation.

Parameters
----------
F: TDataStd_TreeNode

Returns
-------
None
") SetPrevious;
		void SetPrevious(const opencascade::handle<TDataStd_TreeNode> & F);

		/****************** SetTreeID ******************/
		%feature("compactdefaultargs") SetTreeID;
		%feature("autodoc", "No available documentation.

Parameters
----------
explicitID: Standard_GUID

Returns
-------
None
") SetTreeID;
		void SetTreeID(const Standard_GUID & explicitID);

};


%make_alias(TDataStd_TreeNode)

%extend TDataStd_TreeNode {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************
* class TDataStd_UAttribute *
****************************/
class TDataStd_UAttribute : public TDF_Attribute {
	public:
		/****************** TDataStd_UAttribute ******************/
		%feature("compactdefaultargs") TDataStd_UAttribute;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") TDataStd_UAttribute;
		 TDataStd_UAttribute();


        %feature("autodoc", "1");
        %extend{
            std::string DumpToString() {
            std::stringstream s;
            self->Dump(s);
            return s.str();}
        };
		/****************** ID ******************/
		%feature("compactdefaultargs") ID;
		%feature("autodoc", "No available documentation.

Returns
-------
Standard_GUID
") ID;
		const Standard_GUID & ID();

		/****************** NewEmpty ******************/
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TDF_Attribute>
") NewEmpty;
		opencascade::handle<TDF_Attribute> NewEmpty();

		/****************** Paste ******************/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "No available documentation.

Parameters
----------
into: TDF_Attribute
RT: TDF_RelocationTable

Returns
-------
None
") Paste;
		void Paste(const opencascade::handle<TDF_Attribute> & into, const opencascade::handle<TDF_RelocationTable> & RT);

		/****************** References ******************/
		%feature("compactdefaultargs") References;
		%feature("autodoc", "No available documentation.

Parameters
----------
DS: TDF_DataSet

Returns
-------
None
") References;
		virtual void References(const opencascade::handle<TDF_DataSet> & DS);

		/****************** Restore ******************/
		%feature("compactdefaultargs") Restore;
		%feature("autodoc", "No available documentation.

Parameters
----------
with: TDF_Attribute

Returns
-------
None
") Restore;
		void Restore(const opencascade::handle<TDF_Attribute> & with);

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "Api class methods ============= find, or create, a uattribute attribute with <localid> as local guid. the uattribute attribute is returned. uattribute methods ============.

Parameters
----------
label: TDF_Label
LocalID: Standard_GUID

Returns
-------
opencascade::handle<TDataStd_UAttribute>
") Set;
		static opencascade::handle<TDataStd_UAttribute> Set(const TDF_Label & label, const Standard_GUID & LocalID);

		/****************** SetID ******************/
		%feature("compactdefaultargs") SetID;
		%feature("autodoc", "No available documentation.

Parameters
----------
LocalID: Standard_GUID

Returns
-------
None
") SetID;
		void SetID(const Standard_GUID & LocalID);

};


%make_alias(TDataStd_UAttribute)

%extend TDataStd_UAttribute {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************
* class TDataStd_Variable *
**************************/
class TDataStd_Variable : public TDF_Attribute {
	public:
		/****************** TDataStd_Variable ******************/
		%feature("compactdefaultargs") TDataStd_Variable;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") TDataStd_Variable;
		 TDataStd_Variable();

		/****************** Assign ******************/
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "Create(if doesn't exist) and returns the assigned expression attribute. fill it after.

Returns
-------
opencascade::handle<TDataStd_Expression>
") Assign;
		opencascade::handle<TDataStd_Expression> Assign();

		/****************** Constant ******************/
		%feature("compactdefaultargs") Constant;
		%feature("autodoc", "If <status> is true, this variable will not be modified by the solver.

Parameters
----------
status: bool

Returns
-------
None
") Constant;
		void Constant(const Standard_Boolean status);

		/****************** Desassign ******************/
		%feature("compactdefaultargs") Desassign;
		%feature("autodoc", "If <self> is assigned delete the associated expression attribute.

Returns
-------
None
") Desassign;
		void Desassign();


        %feature("autodoc", "1");
        %extend{
            std::string DumpToString() {
            std::stringstream s;
            self->Dump(s);
            return s.str();}
        };
		/****************** Expression ******************/
		%feature("compactdefaultargs") Expression;
		%feature("autodoc", "If <self> is assigned, returns associated expression attribute.

Returns
-------
opencascade::handle<TDataStd_Expression>
") Expression;
		opencascade::handle<TDataStd_Expression> Expression();

		/****************** Get ******************/
		%feature("compactdefaultargs") Get;
		%feature("autodoc", "Returns value stored in associated real attribute.

Returns
-------
float
") Get;
		Standard_Real Get();

		/****************** GetID ******************/
		%feature("compactdefaultargs") GetID;
		%feature("autodoc", "Class methods =============.

Returns
-------
Standard_GUID
") GetID;
		static const Standard_GUID & GetID();

		/****************** ID ******************/
		%feature("compactdefaultargs") ID;
		%feature("autodoc", "No available documentation.

Returns
-------
Standard_GUID
") ID;
		const Standard_GUID & ID();

		/****************** IsAssigned ******************/
		%feature("compactdefaultargs") IsAssigned;
		%feature("autodoc", "Returns true if an expression attribute is associated. create(if doesn't exist), set and returns the assigned expression attribute.

Returns
-------
bool
") IsAssigned;
		Standard_Boolean IsAssigned();

		/****************** IsCaptured ******************/
		%feature("compactdefaultargs") IsCaptured;
		%feature("autodoc", "Shortcut for <real()->iscaptured()>.

Returns
-------
bool
") IsCaptured;
		Standard_Boolean IsCaptured();

		/****************** IsConstant ******************/
		%feature("compactdefaultargs") IsConstant;
		%feature("autodoc", "A constant value is not modified by regeneration.

Returns
-------
bool
") IsConstant;
		Standard_Boolean IsConstant();

		/****************** IsValued ******************/
		%feature("compactdefaultargs") IsValued;
		%feature("autodoc", "Returns true if a real attribute is associated.

Returns
-------
bool
") IsValued;
		Standard_Boolean IsValued();

		/****************** Name ******************/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "Set or change the name of the variable, in myunknown and my associated name attribute.

Parameters
----------
string: TCollection_ExtendedString

Returns
-------
None
") Name;
		void Name(const TCollection_ExtendedString & string);

		/****************** Name ******************/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "Returns string stored in the associated name attribute.

Returns
-------
TCollection_ExtendedString
") Name;
		const TCollection_ExtendedString & Name();

		/****************** NewEmpty ******************/
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TDF_Attribute>
") NewEmpty;
		opencascade::handle<TDF_Attribute> NewEmpty();

		/****************** Paste ******************/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "No available documentation.

Parameters
----------
Into: TDF_Attribute
RT: TDF_RelocationTable

Returns
-------
None
") Paste;
		void Paste(const opencascade::handle<TDF_Attribute> & Into, const opencascade::handle<TDF_RelocationTable> & RT);

		/****************** Real ******************/
		%feature("compactdefaultargs") Real;
		%feature("autodoc", "Returns associated real attribute.

Returns
-------
opencascade::handle<TDataStd_Real>
") Real;
		opencascade::handle<TDataStd_Real> Real();

		/****************** References ******************/
		%feature("compactdefaultargs") References;
		%feature("autodoc", "To export reference to the associated name attribute.

Parameters
----------
DS: TDF_DataSet

Returns
-------
None
") References;
		virtual void References(const opencascade::handle<TDF_DataSet> & DS);

		/****************** Restore ******************/
		%feature("compactdefaultargs") Restore;
		%feature("autodoc", "No available documentation.

Parameters
----------
With: TDF_Attribute

Returns
-------
None
") Restore;
		void Restore(const opencascade::handle<TDF_Attribute> & With);

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "Find, or create, a variable attribute. real methods ============.

Parameters
----------
label: TDF_Label

Returns
-------
opencascade::handle<TDataStd_Variable>
") Set;
		static opencascade::handle<TDataStd_Variable> Set(const TDF_Label & label);

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "Retrieve or create the associated real attribute and set the value <value>.

Parameters
----------
value: float

Returns
-------
None
") Set;
		void Set(const Standard_Real value);

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "Obsolete method that will be removed in next versions. the dimension argument is not supported in the persistence mechanism.

Parameters
----------
value: float
dimension: TDataStd_RealEnum

Returns
-------
None
") Set;
		void Set(const Standard_Real value, const TDataStd_RealEnum dimension);

		/****************** Unit ******************/
		%feature("compactdefaultargs") Unit;
		%feature("autodoc", "No available documentation.

Parameters
----------
unit: TCollection_AsciiString

Returns
-------
None
") Unit;
		void Unit(const TCollection_AsciiString & unit);

		/****************** Unit ******************/
		%feature("compactdefaultargs") Unit;
		%feature("autodoc", "To read/write fields ===================.

Returns
-------
TCollection_AsciiString
") Unit;
		const TCollection_AsciiString & Unit();

};


%make_alias(TDataStd_Variable)

%extend TDataStd_Variable {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/* harray1 classes */
class TDataStd_HLabelArray1 : public  TDataStd_LabelArray1, public Standard_Transient {
  public:
    TDataStd_HLabelArray1(const Standard_Integer theLower, const Standard_Integer theUpper);
    TDataStd_HLabelArray1(const Standard_Integer theLower, const Standard_Integer theUpper, const  TDataStd_LabelArray1::value_type& theValue);
    TDataStd_HLabelArray1(const  TDataStd_LabelArray1& theOther);
    const  TDataStd_LabelArray1& Array1();
     TDataStd_LabelArray1& ChangeArray1();
};
%make_alias(TDataStd_HLabelArray1)


/* harray2 classes */
/* hsequence classes */
