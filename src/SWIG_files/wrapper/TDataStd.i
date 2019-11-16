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
%define TDATASTDDOCSTRING
"TDataStd module, see official documentation at
https://www.opencascade.com/doc/occt-7.4.0/refman/html/package_TDataStd.html"
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
/* public enums */
enum TDataStd_RealEnum {
	TDataStd_SCALAR = 0,
	TDataStd_LENGTH = 1,
	TDataStd_ANGULAR = 2,
};

/* end public enums declaration */

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
%template(TDataStd_DataMapOfStringHArray1OfInteger) NCollection_DataMap <TCollection_ExtendedString , opencascade::handle <TColStd_HArray1OfInteger>, TCollection_ExtendedString>;
%template(TDataStd_DataMapOfStringByte) NCollection_DataMap <TCollection_ExtendedString , Standard_Byte , TCollection_ExtendedString>;
%template(TDataStd_LabelArray1) NCollection_Array1 <TDF_Label>;

%extend NCollection_Array1 <TDF_Label> {
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
%template(TDataStd_DataMapOfStringString) NCollection_DataMap <TCollection_ExtendedString , TCollection_ExtendedString , TCollection_ExtendedString>;
%template(TDataStd_ListOfExtendedString) NCollection_List <TCollection_ExtendedString>;
%template(TDataStd_ListIteratorOfListOfExtendedString) NCollection_TListIterator<TCollection_ExtendedString>;
%template(TDataStd_ListOfByte) NCollection_List <Standard_Byte>;
%template(TDataStd_ListIteratorOfListOfByte) NCollection_TListIterator<Standard_Byte>;
%template(TDataStd_DataMapOfStringHArray1OfReal) NCollection_DataMap <TCollection_ExtendedString , opencascade::handle <TColStd_HArray1OfReal>, TCollection_ExtendedString>;
%template(TDataStd_DataMapOfStringReal) NCollection_DataMap <TCollection_ExtendedString , Standard_Real , TCollection_ExtendedString>;
/* end templates declaration */

/* typedefs */
typedef NCollection_DataMap <TCollection_ExtendedString , opencascade::handle <TColStd_HArray1OfInteger>, TCollection_ExtendedString> TDataStd_DataMapOfStringHArray1OfInteger;
typedef NCollection_DataMap <TCollection_ExtendedString , opencascade::handle <TColStd_HArray1OfInteger>, TCollection_ExtendedString>::Iterator TDataStd_DataMapIteratorOfDataMapOfStringHArray1OfInteger;
typedef NCollection_DataMap <TCollection_ExtendedString , Standard_Byte , TCollection_ExtendedString> TDataStd_DataMapOfStringByte;
typedef NCollection_DataMap <TCollection_ExtendedString , Standard_Byte , TCollection_ExtendedString>::Iterator TDataStd_DataMapIteratorOfDataMapOfStringByte;
typedef NCollection_Array1 <TDF_Label> TDataStd_LabelArray1;
typedef NCollection_DataMap <TCollection_ExtendedString , TCollection_ExtendedString , TCollection_ExtendedString> TDataStd_DataMapOfStringString;
typedef NCollection_DataMap <TCollection_ExtendedString , TCollection_ExtendedString , TCollection_ExtendedString>::Iterator TDataStd_DataMapIteratorOfDataMapOfStringString;
typedef NCollection_List <TCollection_ExtendedString> TDataStd_ListOfExtendedString;
typedef NCollection_List <TCollection_ExtendedString>::Iterator TDataStd_ListIteratorOfListOfExtendedString;
typedef NCollection_List <Standard_Byte> TDataStd_ListOfByte;
typedef NCollection_List <Standard_Byte>::Iterator TDataStd_ListIteratorOfListOfByte;
typedef TDataStd_TreeNode * TDataStd_PtrTreeNode;
typedef NCollection_DataMap <TCollection_ExtendedString , opencascade::handle <TColStd_HArray1OfReal>, TCollection_ExtendedString> TDataStd_DataMapOfStringHArray1OfReal;
typedef NCollection_DataMap <TCollection_ExtendedString , opencascade::handle <TColStd_HArray1OfReal>, TCollection_ExtendedString>::Iterator TDataStd_DataMapIteratorOfDataMapOfStringHArray1OfReal;
typedef NCollection_DataMap <TCollection_ExtendedString , Standard_Real , TCollection_ExtendedString> TDataStd_DataMapOfStringReal;
typedef NCollection_DataMap <TCollection_ExtendedString , Standard_Real , TCollection_ExtendedString>::Iterator TDataStd_DataMapIteratorOfDataMapOfStringReal;
/* end typedefs declaration */

%rename(tdatastd) TDataStd;
class TDataStd {
	public:
		%feature("compactdefaultargs") IDList;
		%feature("autodoc", "	* Appends to <anIDList> the list of the attributes IDs of this package. CAUTION: <anIDList> is NOT cleared before use.

	:param anIDList:
	:type anIDList: TDF_IDList &
	:rtype: void
") IDList;
		static void IDList (TDF_IDList & anIDList);
		%feature("compactdefaultargs") Print;
		%feature("autodoc", "	* Prints the name of the real dimension <DIM> as a String on the Stream <S> and returns <S>.

	:param DIM:
	:type DIM: TDataStd_RealEnum
	:param S:
	:type S: Standard_OStream &
	:rtype: Standard_OStream
") Print;
		static Standard_OStream & Print (const TDataStd_RealEnum DIM,Standard_OStream & S);
};


%extend TDataStd {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TDataStd_AsciiString;
class TDataStd_AsciiString : public TDF_Attribute {
	public:

        %feature("autodoc", "1");
        %extend{
            std::string DumpToString() {
            std::stringstream s;
            self->Dump(s);
            return s.str();}
        };
        		%feature("compactdefaultargs") Get;
		%feature("autodoc", "	:rtype: TCollection_AsciiString
") Get;
		const TCollection_AsciiString & Get ();
		%feature("compactdefaultargs") GetID;
		%feature("autodoc", "	* class methods ============= Returns the GUID of the attribute.

	:rtype: Standard_GUID
") GetID;
		static const Standard_GUID & GetID ();
		%feature("compactdefaultargs") ID;
		%feature("autodoc", "	:rtype: Standard_GUID
") ID;
		const Standard_GUID & ID ();
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "	:rtype: bool
") IsEmpty;
		Standard_Boolean IsEmpty ();
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "	:rtype: opencascade::handle<TDF_Attribute>
") NewEmpty;
		opencascade::handle<TDF_Attribute> NewEmpty ();
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	:param into:
	:type into: opencascade::handle<TDF_Attribute> &
	:param RT:
	:type RT: opencascade::handle<TDF_RelocationTable> &
	:rtype: None
") Paste;
		void Paste (const opencascade::handle<TDF_Attribute> & into,const opencascade::handle<TDF_RelocationTable> & RT);
		%feature("compactdefaultargs") Restore;
		%feature("autodoc", "	:param with:
	:type with: opencascade::handle<TDF_Attribute> &
	:rtype: None
") Restore;
		void Restore (const opencascade::handle<TDF_Attribute> & with);
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "	* Finds, or creates an AsciiString attribute and sets the string. the AsciiString attribute is returned. AsciiString methods ===================

	:param label:
	:type label: TDF_Label &
	:param string:
	:type string: TCollection_AsciiString &
	:rtype: opencascade::handle<TDataStd_AsciiString>
") Set;
		static opencascade::handle<TDataStd_AsciiString> Set (const TDF_Label & label,const TCollection_AsciiString & string);
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "	* Finds, or creates, an AsciiString attribute with explicit user defined <guid> and sets <string>. The Name attribute is returned.

	:param label:
	:type label: TDF_Label &
	:param guid:
	:type guid: Standard_GUID &
	:param string:
	:type string: TCollection_AsciiString &
	:rtype: opencascade::handle<TDataStd_AsciiString>
") Set;
		static opencascade::handle<TDataStd_AsciiString> Set (const TDF_Label & label,const Standard_GUID & guid,const TCollection_AsciiString & string);
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "	:param S:
	:type S: TCollection_AsciiString &
	:rtype: None
") Set;
		void Set (const TCollection_AsciiString & S);
		%feature("compactdefaultargs") SetID;
		%feature("autodoc", "	* Sets the explicit user defined GUID to the attribute.

	:param guid:
	:type guid: Standard_GUID &
	:rtype: None
") SetID;
		void SetID (const Standard_GUID & guid);
		%feature("compactdefaultargs") SetID;
		%feature("autodoc", "	* Sets default GUID for the attribute.

	:rtype: None
") SetID;
		void SetID ();
		%feature("compactdefaultargs") TDataStd_AsciiString;
		%feature("autodoc", "	:rtype: None
") TDataStd_AsciiString;
		 TDataStd_AsciiString ();
};


%make_alias(TDataStd_AsciiString)

%extend TDataStd_AsciiString {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TDataStd_BooleanArray;
class TDataStd_BooleanArray : public TDF_Attribute {
	public:

        %feature("autodoc", "1");
        %extend{
            std::string DumpToString() {
            std::stringstream s;
            self->Dump(s);
            return s.str();}
        };
        		%feature("compactdefaultargs") GetID;
		%feature("autodoc", "	* Static methods ============== Returns an ID for array.

	:rtype: Standard_GUID
") GetID;
		static const Standard_GUID & GetID ();
		%feature("compactdefaultargs") ID;
		%feature("autodoc", "	:rtype: Standard_GUID
") ID;
		const Standard_GUID & ID ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	* Initialize the inner array with bounds from <lower> to <upper>

	:param lower:
	:type lower: int
	:param upper:
	:type upper: int
	:rtype: None
") Init;
		void Init (const Standard_Integer lower,const Standard_Integer upper);
		%feature("compactdefaultargs") InternalArray;
		%feature("autodoc", "	:rtype: opencascade::handle<TColStd_HArray1OfByte>
") InternalArray;
		const opencascade::handle<TColStd_HArray1OfByte> & InternalArray ();
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "	* Returns the number of elements in the array.

	:rtype: int
") Length;
		Standard_Integer Length ();
		%feature("compactdefaultargs") Lower;
		%feature("autodoc", "	* Returns the lower boundary of the array.

	:rtype: int
") Lower;
		Standard_Integer Lower ();
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "	:rtype: opencascade::handle<TDF_Attribute>
") NewEmpty;
		opencascade::handle<TDF_Attribute> NewEmpty ();
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	:param into:
	:type into: opencascade::handle<TDF_Attribute> &
	:param RT:
	:type RT: opencascade::handle<TDF_RelocationTable> &
	:rtype: None
") Paste;
		void Paste (const opencascade::handle<TDF_Attribute> & into,const opencascade::handle<TDF_RelocationTable> & RT);
		%feature("compactdefaultargs") Restore;
		%feature("autodoc", "	:param with:
	:type with: opencascade::handle<TDF_Attribute> &
	:rtype: None
") Restore;
		void Restore (const opencascade::handle<TDF_Attribute> & with);
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "	* Finds or creates an attribute with internal boolean array.

	:param label:
	:type label: TDF_Label &
	:param lower:
	:type lower: int
	:param upper:
	:type upper: int
	:rtype: opencascade::handle<TDataStd_BooleanArray>
") Set;
		static opencascade::handle<TDataStd_BooleanArray> Set (const TDF_Label & label,const Standard_Integer lower,const Standard_Integer upper);
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "	* Finds or creates an attribute with the array using explicit user defined <guid>.

	:param label:
	:type label: TDF_Label &
	:param theGuid:
	:type theGuid: Standard_GUID &
	:param lower:
	:type lower: int
	:param upper:
	:type upper: int
	:rtype: opencascade::handle<TDataStd_BooleanArray>
") Set;
		static opencascade::handle<TDataStd_BooleanArray> Set (const TDF_Label & label,const Standard_GUID & theGuid,const Standard_Integer lower,const Standard_Integer upper);
		%feature("compactdefaultargs") SetID;
		%feature("autodoc", "	* Sets the explicit GUID (user defined) for the attribute.

	:param theGuid:
	:type theGuid: Standard_GUID &
	:rtype: None
") SetID;
		void SetID (const Standard_GUID & theGuid);
		%feature("compactdefaultargs") SetID;
		%feature("autodoc", "	* Sets default GUID for the attribute.

	:rtype: None
") SetID;
		void SetID ();
		%feature("compactdefaultargs") SetInternalArray;
		%feature("autodoc", "	:param values:
	:type values: opencascade::handle<TColStd_HArray1OfByte> &
	:rtype: None
") SetInternalArray;
		void SetInternalArray (const opencascade::handle<TColStd_HArray1OfByte> & values);
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	* Sets the <Index>th element of the array to <Value> OutOfRange exception is raised if <Index> doesn't respect Lower and Upper bounds of the internal array.

	:param index:
	:type index: int
	:param value:
	:type value: bool
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer index,const Standard_Boolean value);
		%feature("compactdefaultargs") TDataStd_BooleanArray;
		%feature("autodoc", "	:rtype: None
") TDataStd_BooleanArray;
		 TDataStd_BooleanArray ();
		%feature("compactdefaultargs") Upper;
		%feature("autodoc", "	* Returns the upper boundary of the array.

	:rtype: int
") Upper;
		Standard_Integer Upper ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	* Return the value of the <Index>th element of the array.

	:param Index:
	:type Index: int
	:rtype: bool
") Value;
		Standard_Boolean Value (const Standard_Integer Index);
};


%make_alias(TDataStd_BooleanArray)

%extend TDataStd_BooleanArray {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TDataStd_BooleanList;
class TDataStd_BooleanList : public TDF_Attribute {
	public:
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param value:
	:type value: bool
	:rtype: None
") Append;
		void Append (const Standard_Boolean value);
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();

        %feature("autodoc", "1");
        %extend{
            std::string DumpToString() {
            std::stringstream s;
            self->Dump(s);
            return s.str();}
        };
        		%feature("compactdefaultargs") Extent;
		%feature("autodoc", "	:rtype: int
") Extent;
		Standard_Integer Extent ();
		%feature("compactdefaultargs") First;
		%feature("autodoc", "	:rtype: bool
") First;
		Standard_Boolean First ();
		%feature("compactdefaultargs") GetID;
		%feature("autodoc", "	* Static methods ============== Returns the ID of the list of booleans attribute.

	:rtype: Standard_GUID
") GetID;
		static const Standard_GUID & GetID ();
		%feature("compactdefaultargs") ID;
		%feature("autodoc", "	:rtype: Standard_GUID
") ID;
		const Standard_GUID & ID ();
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	* Inserts the <value> after the <index> position. The indices start with 1 .. Extent().

	:param index:
	:type index: int
	:param after_value:
	:type after_value: bool
	:rtype: bool
") InsertAfter;
		Standard_Boolean InsertAfter (const Standard_Integer index,const Standard_Boolean after_value);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	* Inserts the <value> before the <index> position. The indices start with 1 .. Extent().

	:param index:
	:type index: int
	:param before_value:
	:type before_value: bool
	:rtype: bool
") InsertBefore;
		Standard_Boolean InsertBefore (const Standard_Integer index,const Standard_Boolean before_value);
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "	:rtype: bool
") IsEmpty;
		Standard_Boolean IsEmpty ();
		%feature("compactdefaultargs") Last;
		%feature("autodoc", "	:rtype: bool
") Last;
		Standard_Boolean Last ();
		%feature("compactdefaultargs") List;
		%feature("autodoc", "	* 1 - means True, 0 - means False.

	:rtype: TDataStd_ListOfByte
") List;
		const TDataStd_ListOfByte & List ();
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "	:rtype: opencascade::handle<TDF_Attribute>
") NewEmpty;
		opencascade::handle<TDF_Attribute> NewEmpty ();
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	:param Into:
	:type Into: opencascade::handle<TDF_Attribute> &
	:param RT:
	:type RT: opencascade::handle<TDF_RelocationTable> &
	:rtype: None
") Paste;
		void Paste (const opencascade::handle<TDF_Attribute> & Into,const opencascade::handle<TDF_RelocationTable> & RT);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param value:
	:type value: bool
	:rtype: None
") Prepend;
		void Prepend (const Standard_Boolean value);
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	* Removes a value at <index> position.

	:param index:
	:type index: int
	:rtype: bool
") Remove;
		Standard_Boolean Remove (const Standard_Integer index);
		%feature("compactdefaultargs") Restore;
		%feature("autodoc", "	:param With:
	:type With: opencascade::handle<TDF_Attribute> &
	:rtype: None
") Restore;
		void Restore (const opencascade::handle<TDF_Attribute> & With);
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "	* Finds or creates a list of boolean values attribute.

	:param label:
	:type label: TDF_Label &
	:rtype: opencascade::handle<TDataStd_BooleanList>
") Set;
		static opencascade::handle<TDataStd_BooleanList> Set (const TDF_Label & label);
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "	* Finds or creates a list of boolean values attribute with explicit user defined <guid>.

	:param label:
	:type label: TDF_Label &
	:param theGuid:
	:type theGuid: Standard_GUID &
	:rtype: opencascade::handle<TDataStd_BooleanList>
") Set;
		static opencascade::handle<TDataStd_BooleanList> Set (const TDF_Label & label,const Standard_GUID & theGuid);
		%feature("compactdefaultargs") SetID;
		%feature("autodoc", "	* Sets the explicit GUID (user defined) for the attribute.

	:param theGuid:
	:type theGuid: Standard_GUID &
	:rtype: None
") SetID;
		void SetID (const Standard_GUID & theGuid);
		%feature("compactdefaultargs") SetID;
		%feature("autodoc", "	* Sets default GUID for the attribute.

	:rtype: None
") SetID;
		void SetID ();
		%feature("compactdefaultargs") TDataStd_BooleanList;
		%feature("autodoc", "	:rtype: None
") TDataStd_BooleanList;
		 TDataStd_BooleanList ();
};


%make_alias(TDataStd_BooleanList)

%extend TDataStd_BooleanList {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TDataStd_ByteArray;
class TDataStd_ByteArray : public TDF_Attribute {
	public:
		%feature("compactdefaultargs") ChangeArray;
		%feature("autodoc", "	* Sets the inner array <myValue> of the attribute to <newArray>. If value of <newArray> differs from <myValue>, Backup performed and myValue refers to new instance of HArray1OfInteger that holds <newArray> values. If <isCheckItems> equal True each item of <newArray> will be checked with each item of <myValue> for coincidence (to avoid backup).

	:param newArray:
	:type newArray: opencascade::handle<TColStd_HArray1OfByte> &
	:param isCheckItems: default value is Standard_True
	:type isCheckItems: bool
	:rtype: None
") ChangeArray;
		void ChangeArray (const opencascade::handle<TColStd_HArray1OfByte> & newArray,const Standard_Boolean isCheckItems = Standard_True);
		%feature("compactdefaultargs") DeltaOnModification;
		%feature("autodoc", "	* Makes a DeltaOnModification between <self> and <anOldAttribute>.

	:param anOldAttribute:
	:type anOldAttribute: opencascade::handle<TDF_Attribute> &
	:rtype: opencascade::handle<TDF_DeltaOnModification>
") DeltaOnModification;
		virtual opencascade::handle<TDF_DeltaOnModification> DeltaOnModification (const opencascade::handle<TDF_Attribute> & anOldAttribute);

        %feature("autodoc", "1");
        %extend{
            std::string DumpToString() {
            std::stringstream s;
            self->Dump(s);
            return s.str();}
        };
        		%feature("compactdefaultargs") GetDelta;
		%feature("autodoc", "	:rtype: bool
") GetDelta;
		Standard_Boolean GetDelta ();
		%feature("compactdefaultargs") GetID;
		%feature("autodoc", "	* Static methods ============== Returns an ID for array.

	:rtype: Standard_GUID
") GetID;
		static const Standard_GUID & GetID ();
		%feature("compactdefaultargs") ID;
		%feature("autodoc", "	:rtype: Standard_GUID
") ID;
		const Standard_GUID & ID ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	* Initialize the inner array with bounds from <lower> to <upper>

	:param lower:
	:type lower: int
	:param upper:
	:type upper: int
	:rtype: None
") Init;
		void Init (const Standard_Integer lower,const Standard_Integer upper);
		%feature("compactdefaultargs") InternalArray;
		%feature("autodoc", "	:rtype: opencascade::handle<TColStd_HArray1OfByte>
") InternalArray;
		const opencascade::handle<TColStd_HArray1OfByte> & InternalArray ();
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "	* Returns the number of elements in the array.

	:rtype: int
") Length;
		Standard_Integer Length ();
		%feature("compactdefaultargs") Lower;
		%feature("autodoc", "	* Returns the lower boundary of the array.

	:rtype: int
") Lower;
		Standard_Integer Lower ();
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "	:rtype: opencascade::handle<TDF_Attribute>
") NewEmpty;
		opencascade::handle<TDF_Attribute> NewEmpty ();
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	:param into:
	:type into: opencascade::handle<TDF_Attribute> &
	:param RT:
	:type RT: opencascade::handle<TDF_RelocationTable> &
	:rtype: None
") Paste;
		void Paste (const opencascade::handle<TDF_Attribute> & into,const opencascade::handle<TDF_RelocationTable> & RT);
		%feature("compactdefaultargs") Restore;
		%feature("autodoc", "	:param with:
	:type with: opencascade::handle<TDF_Attribute> &
	:rtype: None
") Restore;
		void Restore (const opencascade::handle<TDF_Attribute> & with);
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "	* Finds or creates an attribute with the array on the specified label. If <isDelta> == False, DefaultDeltaOnModification is used. If <isDelta> == True, DeltaOnModification of the current attribute is used. If attribute is already set, all input parameters are refused and the found attribute is returned.

	:param label:
	:type label: TDF_Label &
	:param lower:
	:type lower: int
	:param upper:
	:type upper: int
	:param isDelta: default value is Standard_False
	:type isDelta: bool
	:rtype: opencascade::handle<TDataStd_ByteArray>
") Set;
		static opencascade::handle<TDataStd_ByteArray> Set (const TDF_Label & label,const Standard_Integer lower,const Standard_Integer upper,const Standard_Boolean isDelta = Standard_False);
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "	* Finds or creates an attribute with byte array and explicit user defined <guid> on the specified label.

	:param label:
	:type label: TDF_Label &
	:param theGuid:
	:type theGuid: Standard_GUID &
	:param lower:
	:type lower: int
	:param upper:
	:type upper: int
	:param isDelta: default value is Standard_False
	:type isDelta: bool
	:rtype: opencascade::handle<TDataStd_ByteArray>
") Set;
		static opencascade::handle<TDataStd_ByteArray> Set (const TDF_Label & label,const Standard_GUID & theGuid,const Standard_Integer lower,const Standard_Integer upper,const Standard_Boolean isDelta = Standard_False);
		%feature("compactdefaultargs") SetDelta;
		%feature("autodoc", "	* for internal use only!

	:param isDelta:
	:type isDelta: bool
	:rtype: None
") SetDelta;
		void SetDelta (const Standard_Boolean isDelta);
		%feature("compactdefaultargs") SetID;
		%feature("autodoc", "	* Sets the explicit GUID (user defined) for the attribute.

	:param theGuid:
	:type theGuid: Standard_GUID &
	:rtype: None
") SetID;
		void SetID (const Standard_GUID & theGuid);
		%feature("compactdefaultargs") SetID;
		%feature("autodoc", "	* Sets default GUID for the attribute.

	:rtype: None
") SetID;
		void SetID ();
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	* Sets the <Index>th element of the array to <Value> OutOfRange exception is raised if <Index> doesn't respect Lower and Upper bounds of the internal array.

	:param index:
	:type index: int
	:param value:
	:type value: Standard_Byte
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer index,const Standard_Byte value);
		%feature("compactdefaultargs") TDataStd_ByteArray;
		%feature("autodoc", "	:rtype: None
") TDataStd_ByteArray;
		 TDataStd_ByteArray ();
		%feature("compactdefaultargs") Upper;
		%feature("autodoc", "	* Returns the upper boundary of the array.

	:rtype: int
") Upper;
		Standard_Integer Upper ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	* Return the value of the <Index>th element of the array.

	:param Index:
	:type Index: int
	:rtype: Standard_Byte
") Value;
		Standard_Byte Value (const Standard_Integer Index);
};


%make_alias(TDataStd_ByteArray)

%extend TDataStd_ByteArray {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TDataStd_ChildNodeIterator;
class TDataStd_ChildNodeIterator {
	public:
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "	* Initializes the iteration on the Children Step of the given Step. If <allLevels> option is set to true, it explores not only the first, but all the sub Step levels.

	:param aTreeNode:
	:type aTreeNode: opencascade::handle<TDataStd_TreeNode> &
	:param allLevels: default value is Standard_False
	:type allLevels: bool
	:rtype: None
") Initialize;
		void Initialize (const opencascade::handle<TDataStd_TreeNode> & aTreeNode,const Standard_Boolean allLevels = Standard_False);
		%feature("compactdefaultargs") More;
		%feature("autodoc", "	* Returns True if there is a current Item in the iteration.

	:rtype: bool
") More;
		Standard_Boolean More ();
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "	* Move to the next Item

	:rtype: None
") Next;
		void Next ();
		%feature("compactdefaultargs") NextBrother;
		%feature("autodoc", "	* Move to the next Brother. If there is none, go up etc. This method is interesting only with 'allLevels' behavior, because it avoids to explore the current Step ChildStepren.

	:rtype: None
") NextBrother;
		void NextBrother ();
		%feature("compactdefaultargs") TDataStd_ChildNodeIterator;
		%feature("autodoc", "	* Creates an empty iterator.

	:rtype: None
") TDataStd_ChildNodeIterator;
		 TDataStd_ChildNodeIterator ();
		%feature("compactdefaultargs") TDataStd_ChildNodeIterator;
		%feature("autodoc", "	* Iterates on the ChildStepren of the given Step. If <allLevels> option is set to true, it explores not only the first, but all the sub Step levels.

	:param aTreeNode:
	:type aTreeNode: opencascade::handle<TDataStd_TreeNode> &
	:param allLevels: default value is Standard_False
	:type allLevels: bool
	:rtype: None
") TDataStd_ChildNodeIterator;
		 TDataStd_ChildNodeIterator (const opencascade::handle<TDataStd_TreeNode> & aTreeNode,const Standard_Boolean allLevels = Standard_False);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	* Returns the current item; a null Step if there is no one.

	:rtype: opencascade::handle<TDataStd_TreeNode>
") Value;
		const opencascade::handle<TDataStd_TreeNode> & Value ();
};


%extend TDataStd_ChildNodeIterator {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TDataStd_Comment;
class TDataStd_Comment : public TDF_Attribute {
	public:
		%feature("compactdefaultargs") AfterRetrieval;
		%feature("autodoc", "	:param forceIt: default value is Standard_False
	:type forceIt: bool
	:rtype: bool
") AfterRetrieval;
		Standard_Boolean AfterRetrieval (const Standard_Boolean forceIt = Standard_False);

        %feature("autodoc", "1");
        %extend{
            std::string DumpToString() {
            std::stringstream s;
            self->Dump(s);
            return s.str();}
        };
        		%feature("compactdefaultargs") Get;
		%feature("autodoc", "	* Returns the comment attribute.

	:rtype: TCollection_ExtendedString
") Get;
		const TCollection_ExtendedString & Get ();
		%feature("compactdefaultargs") GetID;
		%feature("autodoc", "	* class methods ============= Returns the GUID for comments.

	:rtype: Standard_GUID
") GetID;
		static const Standard_GUID & GetID ();
		%feature("compactdefaultargs") ID;
		%feature("autodoc", "	:rtype: Standard_GUID
") ID;
		const Standard_GUID & ID ();
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "	:rtype: opencascade::handle<TDF_Attribute>
") NewEmpty;
		opencascade::handle<TDF_Attribute> NewEmpty ();
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	:param into:
	:type into: opencascade::handle<TDF_Attribute> &
	:param RT:
	:type RT: opencascade::handle<TDF_RelocationTable> &
	:rtype: None
") Paste;
		void Paste (const opencascade::handle<TDF_Attribute> & into,const opencascade::handle<TDF_RelocationTable> & RT);
		%feature("compactdefaultargs") Restore;
		%feature("autodoc", "	:param with:
	:type with: opencascade::handle<TDF_Attribute> &
	:rtype: None
") Restore;
		void Restore (const opencascade::handle<TDF_Attribute> & with);
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "	* Find, or create a Comment attribute. the Comment attribute is returned.

	:param label:
	:type label: TDF_Label &
	:rtype: opencascade::handle<TDataStd_Comment>
") Set;
		static opencascade::handle<TDataStd_Comment> Set (const TDF_Label & label);
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "	* Finds, or creates a Comment attribute and sets the string. the Comment attribute is returned. Comment methods ============

	:param label:
	:type label: TDF_Label &
	:param string:
	:type string: TCollection_ExtendedString &
	:rtype: opencascade::handle<TDataStd_Comment>
") Set;
		static opencascade::handle<TDataStd_Comment> Set (const TDF_Label & label,const TCollection_ExtendedString & string);
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "	:param S:
	:type S: TCollection_ExtendedString &
	:rtype: None
") Set;
		void Set (const TCollection_ExtendedString & S);
		%feature("compactdefaultargs") TDataStd_Comment;
		%feature("autodoc", "	:rtype: None
") TDataStd_Comment;
		 TDataStd_Comment ();
};


%make_alias(TDataStd_Comment)

%extend TDataStd_Comment {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TDataStd_Current;
class TDataStd_Current : public TDF_Attribute {
	public:

        %feature("autodoc", "1");
        %extend{
            std::string DumpToString() {
            std::stringstream s;
            self->Dump(s);
            return s.str();}
        };
        		%feature("compactdefaultargs") Get;
		%feature("autodoc", "	* returns current of <acces> Framework. raise if (!Has)

	:param acces:
	:type acces: TDF_Label &
	:rtype: TDF_Label
") Get;
		static TDF_Label Get (const TDF_Label & acces);
		%feature("compactdefaultargs") GetID;
		%feature("autodoc", "	* class methods =============

	:rtype: Standard_GUID
") GetID;
		static const Standard_GUID & GetID ();
		%feature("compactdefaultargs") GetLabel;
		%feature("autodoc", "	:rtype: TDF_Label
") GetLabel;
		TDF_Label GetLabel ();
		%feature("compactdefaultargs") Has;
		%feature("autodoc", "	* returns True if a current label is managed in <acces> Framework. class methods =============

	:param acces:
	:type acces: TDF_Label &
	:rtype: bool
") Has;
		static Standard_Boolean Has (const TDF_Label & acces);
		%feature("compactdefaultargs") ID;
		%feature("autodoc", "	:rtype: Standard_GUID
") ID;
		const Standard_GUID & ID ();
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "	:rtype: opencascade::handle<TDF_Attribute>
") NewEmpty;
		opencascade::handle<TDF_Attribute> NewEmpty ();
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	:param Into:
	:type Into: opencascade::handle<TDF_Attribute> &
	:param RT:
	:type RT: opencascade::handle<TDF_RelocationTable> &
	:rtype: None
") Paste;
		void Paste (const opencascade::handle<TDF_Attribute> & Into,const opencascade::handle<TDF_RelocationTable> & RT);
		%feature("compactdefaultargs") Restore;
		%feature("autodoc", "	:param With:
	:type With: opencascade::handle<TDF_Attribute> &
	:rtype: None
") Restore;
		void Restore (const opencascade::handle<TDF_Attribute> & With);
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "	* Set <L> as current of <L> Framework.

	:param L:
	:type L: TDF_Label &
	:rtype: void
") Set;
		static void Set (const TDF_Label & L);
		%feature("compactdefaultargs") SetLabel;
		%feature("autodoc", "	:param current:
	:type current: TDF_Label &
	:rtype: None
") SetLabel;
		void SetLabel (const TDF_Label & current);
		%feature("compactdefaultargs") TDataStd_Current;
		%feature("autodoc", "	:rtype: None
") TDataStd_Current;
		 TDataStd_Current ();
};


%make_alias(TDataStd_Current)

%extend TDataStd_Current {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TDataStd_DeltaOnModificationOfByteArray;
class TDataStd_DeltaOnModificationOfByteArray : public TDF_DeltaOnModification {
	public:
		%feature("compactdefaultargs") Apply;
		%feature("autodoc", "	* Applies the delta to the attribute.

	:rtype: void
") Apply;
		virtual void Apply ();
		%feature("compactdefaultargs") TDataStd_DeltaOnModificationOfByteArray;
		%feature("autodoc", "	* Initializes a TDF_DeltaOnModification.

	:param Arr:
	:type Arr: opencascade::handle<TDataStd_ByteArray> &
	:rtype: None
") TDataStd_DeltaOnModificationOfByteArray;
		 TDataStd_DeltaOnModificationOfByteArray (const opencascade::handle<TDataStd_ByteArray> & Arr);
};


%make_alias(TDataStd_DeltaOnModificationOfByteArray)

%extend TDataStd_DeltaOnModificationOfByteArray {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TDataStd_DeltaOnModificationOfExtStringArray;
class TDataStd_DeltaOnModificationOfExtStringArray : public TDF_DeltaOnModification {
	public:
		%feature("compactdefaultargs") Apply;
		%feature("autodoc", "	* Applies the delta to the attribute.

	:rtype: void
") Apply;
		virtual void Apply ();
		%feature("compactdefaultargs") TDataStd_DeltaOnModificationOfExtStringArray;
		%feature("autodoc", "	* Initializes a TDF_DeltaOnModification.

	:param Arr:
	:type Arr: opencascade::handle<TDataStd_ExtStringArray> &
	:rtype: None
") TDataStd_DeltaOnModificationOfExtStringArray;
		 TDataStd_DeltaOnModificationOfExtStringArray (const opencascade::handle<TDataStd_ExtStringArray> & Arr);
};


%make_alias(TDataStd_DeltaOnModificationOfExtStringArray)

%extend TDataStd_DeltaOnModificationOfExtStringArray {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TDataStd_DeltaOnModificationOfIntArray;
class TDataStd_DeltaOnModificationOfIntArray : public TDF_DeltaOnModification {
	public:
		%feature("compactdefaultargs") Apply;
		%feature("autodoc", "	* Applies the delta to the attribute.

	:rtype: void
") Apply;
		virtual void Apply ();
		%feature("compactdefaultargs") TDataStd_DeltaOnModificationOfIntArray;
		%feature("autodoc", "	* Initializes a TDF_DeltaOnModification.

	:param Arr:
	:type Arr: opencascade::handle<TDataStd_IntegerArray> &
	:rtype: None
") TDataStd_DeltaOnModificationOfIntArray;
		 TDataStd_DeltaOnModificationOfIntArray (const opencascade::handle<TDataStd_IntegerArray> & Arr);
};


%make_alias(TDataStd_DeltaOnModificationOfIntArray)

%extend TDataStd_DeltaOnModificationOfIntArray {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TDataStd_DeltaOnModificationOfIntPackedMap;
class TDataStd_DeltaOnModificationOfIntPackedMap : public TDF_DeltaOnModification {
	public:
		%feature("compactdefaultargs") Apply;
		%feature("autodoc", "	* Applies the delta to the attribute.

	:rtype: void
") Apply;
		virtual void Apply ();
		%feature("compactdefaultargs") TDataStd_DeltaOnModificationOfIntPackedMap;
		%feature("autodoc", "	* Initializes a TDF_DeltaOnModification.

	:param Arr:
	:type Arr: opencascade::handle<TDataStd_IntPackedMap> &
	:rtype: None
") TDataStd_DeltaOnModificationOfIntPackedMap;
		 TDataStd_DeltaOnModificationOfIntPackedMap (const opencascade::handle<TDataStd_IntPackedMap> & Arr);
};


%make_alias(TDataStd_DeltaOnModificationOfIntPackedMap)

%extend TDataStd_DeltaOnModificationOfIntPackedMap {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TDataStd_DeltaOnModificationOfRealArray;
class TDataStd_DeltaOnModificationOfRealArray : public TDF_DeltaOnModification {
	public:
		%feature("compactdefaultargs") Apply;
		%feature("autodoc", "	* Applies the delta to the attribute.

	:rtype: void
") Apply;
		virtual void Apply ();
		%feature("compactdefaultargs") TDataStd_DeltaOnModificationOfRealArray;
		%feature("autodoc", "	* Initializes a TDF_DeltaOnModification.

	:param Arr:
	:type Arr: opencascade::handle<TDataStd_RealArray> &
	:rtype: None
") TDataStd_DeltaOnModificationOfRealArray;
		 TDataStd_DeltaOnModificationOfRealArray (const opencascade::handle<TDataStd_RealArray> & Arr);
};


%make_alias(TDataStd_DeltaOnModificationOfRealArray)

%extend TDataStd_DeltaOnModificationOfRealArray {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TDataStd_Directory;
class TDataStd_Directory : public TDF_Attribute {
	public:
		%feature("compactdefaultargs") AddDirectory;
		%feature("autodoc", "	* Creates a new sub-label and sets the sub-directory dir on that label.

	:param dir:
	:type dir: opencascade::handle<TDataStd_Directory> &
	:rtype: opencascade::handle<TDataStd_Directory>
") AddDirectory;
		static opencascade::handle<TDataStd_Directory> AddDirectory (const opencascade::handle<TDataStd_Directory> & dir);

        %feature("autodoc", "1");
        %extend{
            std::string DumpToString() {
            std::stringstream s;
            self->Dump(s);
            return s.str();}
        };
        		%feature("compactdefaultargs") Find;
		%feature("autodoc", "	* class methods ============= Searches for a directory attribute on the label current, or on one of the father labels of current. If a directory attribute is found, true is returned, and the attribute found is set as D.

	:param current:
	:type current: TDF_Label &
	:param D:
	:type D: opencascade::handle<TDataStd_Directory> &
	:rtype: bool
") Find;
		static Standard_Boolean Find (const TDF_Label & current,opencascade::handle<TDataStd_Directory> & D);
		%feature("compactdefaultargs") GetID;
		%feature("autodoc", "	* Directory methods ===============

	:rtype: Standard_GUID
") GetID;
		static const Standard_GUID & GetID ();
		%feature("compactdefaultargs") ID;
		%feature("autodoc", "	:rtype: Standard_GUID
") ID;
		const Standard_GUID & ID ();
		%feature("compactdefaultargs") MakeObjectLabel;
		%feature("autodoc", "	* Makes new label and returns it to insert other object attributes (sketch,part...etc...)

	:param dir:
	:type dir: opencascade::handle<TDataStd_Directory> &
	:rtype: TDF_Label
") MakeObjectLabel;
		static TDF_Label MakeObjectLabel (const opencascade::handle<TDataStd_Directory> & dir);
		%feature("compactdefaultargs") New;
		%feature("autodoc", "	* Creates an enpty Directory attribute, located at <label>. Raises if <label> has attribute

	:param label:
	:type label: TDF_Label &
	:rtype: opencascade::handle<TDataStd_Directory>
") New;
		static opencascade::handle<TDataStd_Directory> New (const TDF_Label & label);
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "	:rtype: opencascade::handle<TDF_Attribute>
") NewEmpty;
		opencascade::handle<TDF_Attribute> NewEmpty ();
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	:param into:
	:type into: opencascade::handle<TDF_Attribute> &
	:param RT:
	:type RT: opencascade::handle<TDF_RelocationTable> &
	:rtype: None
") Paste;
		void Paste (const opencascade::handle<TDF_Attribute> & into,const opencascade::handle<TDF_RelocationTable> & RT);
		%feature("compactdefaultargs") References;
		%feature("autodoc", "	:param DS:
	:type DS: opencascade::handle<TDF_DataSet> &
	:rtype: void
") References;
		virtual void References (const opencascade::handle<TDF_DataSet> & DS);
		%feature("compactdefaultargs") Restore;
		%feature("autodoc", "	:param with:
	:type with: opencascade::handle<TDF_Attribute> &
	:rtype: None
") Restore;
		void Restore (const opencascade::handle<TDF_Attribute> & with);
		%feature("compactdefaultargs") TDataStd_Directory;
		%feature("autodoc", "	:rtype: None
") TDataStd_Directory;
		 TDataStd_Directory ();
};


%make_alias(TDataStd_Directory)

%extend TDataStd_Directory {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TDataStd_Expression;
class TDataStd_Expression : public TDF_Attribute {
	public:

        %feature("autodoc", "1");
        %extend{
            std::string DumpToString() {
            std::stringstream s;
            self->Dump(s);
            return s.str();}
        };
        		%feature("compactdefaultargs") GetExpression;
		%feature("autodoc", "	:rtype: TCollection_ExtendedString
") GetExpression;
		const TCollection_ExtendedString & GetExpression ();
		%feature("compactdefaultargs") GetID;
		%feature("autodoc", "	* class methods =============

	:rtype: Standard_GUID
") GetID;
		static const Standard_GUID & GetID ();
		%feature("compactdefaultargs") GetVariables;
		%feature("autodoc", "	:rtype: TDF_AttributeList
") GetVariables;
		TDF_AttributeList & GetVariables ();
		%feature("compactdefaultargs") ID;
		%feature("autodoc", "	:rtype: Standard_GUID
") ID;
		const Standard_GUID & ID ();
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "	* build and return the expression name

	:rtype: TCollection_ExtendedString
") Name;
		TCollection_ExtendedString Name ();
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "	:rtype: opencascade::handle<TDF_Attribute>
") NewEmpty;
		opencascade::handle<TDF_Attribute> NewEmpty ();
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	:param Into:
	:type Into: opencascade::handle<TDF_Attribute> &
	:param RT:
	:type RT: opencascade::handle<TDF_RelocationTable> &
	:rtype: None
") Paste;
		void Paste (const opencascade::handle<TDF_Attribute> & Into,const opencascade::handle<TDF_RelocationTable> & RT);
		%feature("compactdefaultargs") Restore;
		%feature("autodoc", "	:param With:
	:type With: opencascade::handle<TDF_Attribute> &
	:rtype: None
") Restore;
		void Restore (const opencascade::handle<TDF_Attribute> & With);
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "	* Find, or create, an Expression attribute. Expressionmethods ============

	:param label:
	:type label: TDF_Label &
	:rtype: opencascade::handle<TDataStd_Expression>
") Set;
		static opencascade::handle<TDataStd_Expression> Set (const TDF_Label & label);
		%feature("compactdefaultargs") SetExpression;
		%feature("autodoc", "	:param E:
	:type E: TCollection_ExtendedString &
	:rtype: None
") SetExpression;
		void SetExpression (const TCollection_ExtendedString & E);
		%feature("compactdefaultargs") TDataStd_Expression;
		%feature("autodoc", "	:rtype: None
") TDataStd_Expression;
		 TDataStd_Expression ();
};


%make_alias(TDataStd_Expression)

%extend TDataStd_Expression {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TDataStd_ExtStringArray;
class TDataStd_ExtStringArray : public TDF_Attribute {
	public:
		%feature("compactdefaultargs") Array;
		%feature("autodoc", "	* Return the inner array of the ExtStringArray attribute

	:rtype: opencascade::handle<TColStd_HArray1OfExtendedString>
") Array;
		const opencascade::handle<TColStd_HArray1OfExtendedString> & Array ();
		%feature("compactdefaultargs") ChangeArray;
		%feature("autodoc", "	* Sets the inner array <myValue> of the ExtStringArray attribute to <newArray>. If value of <newArray> differs from <myValue>, Backup performed and myValue refers to new instance of HArray1OfExtendedString that holds <newArray> values If <isCheckItems> equal True each item of <newArray> will be checked with each item of <myValue> for coincidence (to avoid backup).

	:param newArray:
	:type newArray: opencascade::handle<TColStd_HArray1OfExtendedString> &
	:param isCheckItems: default value is Standard_True
	:type isCheckItems: bool
	:rtype: None
") ChangeArray;
		void ChangeArray (const opencascade::handle<TColStd_HArray1OfExtendedString> & newArray,const Standard_Boolean isCheckItems = Standard_True);
		%feature("compactdefaultargs") DeltaOnModification;
		%feature("autodoc", "	* Makes a DeltaOnModification between <self> and <anOldAttribute>.

	:param anOldAttribute:
	:type anOldAttribute: opencascade::handle<TDF_Attribute> &
	:rtype: opencascade::handle<TDF_DeltaOnModification>
") DeltaOnModification;
		virtual opencascade::handle<TDF_DeltaOnModification> DeltaOnModification (const opencascade::handle<TDF_Attribute> & anOldAttribute);

        %feature("autodoc", "1");
        %extend{
            std::string DumpToString() {
            std::stringstream s;
            self->Dump(s);
            return s.str();}
        };
        		%feature("compactdefaultargs") GetDelta;
		%feature("autodoc", "	:rtype: bool
") GetDelta;
		Standard_Boolean GetDelta ();
		%feature("compactdefaultargs") GetID;
		%feature("autodoc", "	* class methods ============= Returns the GUID for the attribute.

	:rtype: Standard_GUID
") GetID;
		static const Standard_GUID & GetID ();
		%feature("compactdefaultargs") ID;
		%feature("autodoc", "	:rtype: Standard_GUID
") ID;
		const Standard_GUID & ID ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	* Initializes the inner array with bounds from <lower> to <upper>

	:param lower:
	:type lower: int
	:param upper:
	:type upper: int
	:rtype: None
") Init;
		void Init (const Standard_Integer lower,const Standard_Integer upper);
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "	* Return the number of elements of <self>.

	:rtype: int
") Length;
		Standard_Integer Length ();
		%feature("compactdefaultargs") Lower;
		%feature("autodoc", "	* Return the lower bound.

	:rtype: int
") Lower;
		Standard_Integer Lower ();
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "	:rtype: opencascade::handle<TDF_Attribute>
") NewEmpty;
		opencascade::handle<TDF_Attribute> NewEmpty ();
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	:param Into:
	:type Into: opencascade::handle<TDF_Attribute> &
	:param RT:
	:type RT: opencascade::handle<TDF_RelocationTable> &
	:rtype: None
") Paste;
		void Paste (const opencascade::handle<TDF_Attribute> & Into,const opencascade::handle<TDF_RelocationTable> & RT);
		%feature("compactdefaultargs") Restore;
		%feature("autodoc", "	:param With:
	:type With: opencascade::handle<TDF_Attribute> &
	:rtype: None
") Restore;
		void Restore (const opencascade::handle<TDF_Attribute> & With);
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "	* Finds, or creates, an ExtStringArray attribute with <lower> and <upper> bounds on the specified label. If <isDelta> == False, DefaultDeltaOnModification is used. If <isDelta> == True, DeltaOnModification of the current attribute is used. If attribute is already set, all input parameters are refused and the found attribute is returned.

	:param label:
	:type label: TDF_Label &
	:param lower:
	:type lower: int
	:param upper:
	:type upper: int
	:param isDelta: default value is Standard_False
	:type isDelta: bool
	:rtype: opencascade::handle<TDataStd_ExtStringArray>
") Set;
		static opencascade::handle<TDataStd_ExtStringArray> Set (const TDF_Label & label,const Standard_Integer lower,const Standard_Integer upper,const Standard_Boolean isDelta = Standard_False);
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "	* Finds, or creates, an ExtStringArray attribute with explicit user defined <guid>. The ExtStringArray attribute is returned.

	:param label:
	:type label: TDF_Label &
	:param theGuid:
	:type theGuid: Standard_GUID &
	:param lower:
	:type lower: int
	:param upper:
	:type upper: int
	:param isDelta: default value is Standard_False
	:type isDelta: bool
	:rtype: opencascade::handle<TDataStd_ExtStringArray>
") Set;
		static opencascade::handle<TDataStd_ExtStringArray> Set (const TDF_Label & label,const Standard_GUID & theGuid,const Standard_Integer lower,const Standard_Integer upper,const Standard_Boolean isDelta = Standard_False);
		%feature("compactdefaultargs") SetDelta;
		%feature("autodoc", "	* for internal use only!

	:param isDelta:
	:type isDelta: bool
	:rtype: None
") SetDelta;
		void SetDelta (const Standard_Boolean isDelta);
		%feature("compactdefaultargs") SetID;
		%feature("autodoc", "	* Sets the explicit GUID (user defined) for the attribute.

	:param theGuid:
	:type theGuid: Standard_GUID &
	:rtype: None
") SetID;
		void SetID (const Standard_GUID & theGuid);
		%feature("compactdefaultargs") SetID;
		%feature("autodoc", "	* Sets default GUID for the attribute.

	:rtype: None
") SetID;
		void SetID ();
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	* Sets the <Index>th element of the array to <Value> OutOfRange exception is raised if <Index> doesn't respect Lower and Upper bounds of the internal array.

	:param Index:
	:type Index: int
	:param Value:
	:type Value: TCollection_ExtendedString &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const TCollection_ExtendedString & Value);
		%feature("compactdefaultargs") TDataStd_ExtStringArray;
		%feature("autodoc", "	:rtype: None
") TDataStd_ExtStringArray;
		 TDataStd_ExtStringArray ();
		%feature("compactdefaultargs") Upper;
		%feature("autodoc", "	* Return the upper bound

	:rtype: int
") Upper;
		Standard_Integer Upper ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	* Returns the value of the <Index>th element of the array

	:param Index:
	:type Index: int
	:rtype: TCollection_ExtendedString
") Value;
		const TCollection_ExtendedString & Value (const Standard_Integer Index);
};


%make_alias(TDataStd_ExtStringArray)

%extend TDataStd_ExtStringArray {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TDataStd_ExtStringList;
class TDataStd_ExtStringList : public TDF_Attribute {
	public:
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param value:
	:type value: TCollection_ExtendedString &
	:rtype: None
") Append;
		void Append (const TCollection_ExtendedString & value);
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();

        %feature("autodoc", "1");
        %extend{
            std::string DumpToString() {
            std::stringstream s;
            self->Dump(s);
            return s.str();}
        };
        		%feature("compactdefaultargs") Extent;
		%feature("autodoc", "	:rtype: int
") Extent;
		Standard_Integer Extent ();
		%feature("compactdefaultargs") First;
		%feature("autodoc", "	:rtype: TCollection_ExtendedString
") First;
		const TCollection_ExtendedString & First ();
		%feature("compactdefaultargs") GetID;
		%feature("autodoc", "	* Static methods ============== Returns the ID of the list of strings attribute.

	:rtype: Standard_GUID
") GetID;
		static const Standard_GUID & GetID ();
		%feature("compactdefaultargs") ID;
		%feature("autodoc", "	:rtype: Standard_GUID
") ID;
		const Standard_GUID & ID ();
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	* Inserts the <value> after the first meet of <after_value>.

	:param value:
	:type value: TCollection_ExtendedString &
	:param after_value:
	:type after_value: TCollection_ExtendedString &
	:rtype: bool
") InsertAfter;
		Standard_Boolean InsertAfter (const TCollection_ExtendedString & value,const TCollection_ExtendedString & after_value);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	* Inserts the <value> after the <index> position. The indices start with 1 .. Extent().

	:param index:
	:type index: int
	:param after_value:
	:type after_value: TCollection_ExtendedString &
	:rtype: bool
") InsertAfter;
		Standard_Boolean InsertAfter (const Standard_Integer index,const TCollection_ExtendedString & after_value);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	* Inserts the <value> before the first meet of <before_value>.

	:param value:
	:type value: TCollection_ExtendedString &
	:param before_value:
	:type before_value: TCollection_ExtendedString &
	:rtype: bool
") InsertBefore;
		Standard_Boolean InsertBefore (const TCollection_ExtendedString & value,const TCollection_ExtendedString & before_value);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	* Inserts the <value> before the <index> position. The indices start with 1 .. Extent().

	:param index:
	:type index: int
	:param before_value:
	:type before_value: TCollection_ExtendedString &
	:rtype: bool
") InsertBefore;
		Standard_Boolean InsertBefore (const Standard_Integer index,const TCollection_ExtendedString & before_value);
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "	:rtype: bool
") IsEmpty;
		Standard_Boolean IsEmpty ();
		%feature("compactdefaultargs") Last;
		%feature("autodoc", "	:rtype: TCollection_ExtendedString
") Last;
		const TCollection_ExtendedString & Last ();
		%feature("compactdefaultargs") List;
		%feature("autodoc", "	:rtype: TDataStd_ListOfExtendedString
") List;
		const TDataStd_ListOfExtendedString & List ();
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "	:rtype: opencascade::handle<TDF_Attribute>
") NewEmpty;
		opencascade::handle<TDF_Attribute> NewEmpty ();
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	:param Into:
	:type Into: opencascade::handle<TDF_Attribute> &
	:param RT:
	:type RT: opencascade::handle<TDF_RelocationTable> &
	:rtype: None
") Paste;
		void Paste (const opencascade::handle<TDF_Attribute> & Into,const opencascade::handle<TDF_RelocationTable> & RT);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param value:
	:type value: TCollection_ExtendedString &
	:rtype: None
") Prepend;
		void Prepend (const TCollection_ExtendedString & value);
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	* Removes the first meet of the <value>.

	:param value:
	:type value: TCollection_ExtendedString &
	:rtype: bool
") Remove;
		Standard_Boolean Remove (const TCollection_ExtendedString & value);
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	* Removes a value at <index> position.

	:param index:
	:type index: int
	:rtype: bool
") Remove;
		Standard_Boolean Remove (const Standard_Integer index);
		%feature("compactdefaultargs") Restore;
		%feature("autodoc", "	:param With:
	:type With: opencascade::handle<TDF_Attribute> &
	:rtype: None
") Restore;
		void Restore (const opencascade::handle<TDF_Attribute> & With);
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "	* Finds or creates a list of string values attribute with explicit user defined <guid>.

	:param label:
	:type label: TDF_Label &
	:rtype: opencascade::handle<TDataStd_ExtStringList>
") Set;
		static opencascade::handle<TDataStd_ExtStringList> Set (const TDF_Label & label);
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "	* Finds or creates a list of string values attribute.

	:param label:
	:type label: TDF_Label &
	:param theGuid:
	:type theGuid: Standard_GUID &
	:rtype: opencascade::handle<TDataStd_ExtStringList>
") Set;
		static opencascade::handle<TDataStd_ExtStringList> Set (const TDF_Label & label,const Standard_GUID & theGuid);
		%feature("compactdefaultargs") SetID;
		%feature("autodoc", "	* Sets the explicit GUID (user defined) for the attribute.

	:param theGuid:
	:type theGuid: Standard_GUID &
	:rtype: None
") SetID;
		void SetID (const Standard_GUID & theGuid);
		%feature("compactdefaultargs") SetID;
		%feature("autodoc", "	* Sets default GUID for the attribute.

	:rtype: None
") SetID;
		void SetID ();
		%feature("compactdefaultargs") TDataStd_ExtStringList;
		%feature("autodoc", "	:rtype: None
") TDataStd_ExtStringList;
		 TDataStd_ExtStringList ();
};


%make_alias(TDataStd_ExtStringList)

%extend TDataStd_ExtStringList {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TDataStd_HDataMapOfStringByte;
class TDataStd_HDataMapOfStringByte : public Standard_Transient {
	public:
		%feature("compactdefaultargs") ChangeMap;
		%feature("autodoc", "	:rtype: TDataStd_DataMapOfStringByte
") ChangeMap;
		TDataStd_DataMapOfStringByte & ChangeMap ();
		%feature("compactdefaultargs") Map;
		%feature("autodoc", "	:rtype: TDataStd_DataMapOfStringByte
") Map;
		const TDataStd_DataMapOfStringByte & Map ();
		%feature("compactdefaultargs") TDataStd_HDataMapOfStringByte;
		%feature("autodoc", "	:param NbBuckets: default value is 1
	:type NbBuckets: int
	:rtype: None
") TDataStd_HDataMapOfStringByte;
		 TDataStd_HDataMapOfStringByte (const Standard_Integer NbBuckets = 1);
		%feature("compactdefaultargs") TDataStd_HDataMapOfStringByte;
		%feature("autodoc", "	:param theOther:
	:type theOther: TDataStd_DataMapOfStringByte &
	:rtype: None
") TDataStd_HDataMapOfStringByte;
		 TDataStd_HDataMapOfStringByte (const TDataStd_DataMapOfStringByte & theOther);
};


%make_alias(TDataStd_HDataMapOfStringByte)

%extend TDataStd_HDataMapOfStringByte {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TDataStd_HDataMapOfStringHArray1OfInteger;
class TDataStd_HDataMapOfStringHArray1OfInteger : public Standard_Transient {
	public:
		%feature("compactdefaultargs") ChangeMap;
		%feature("autodoc", "	:rtype: TDataStd_DataMapOfStringHArray1OfInteger
") ChangeMap;
		TDataStd_DataMapOfStringHArray1OfInteger & ChangeMap ();
		%feature("compactdefaultargs") Map;
		%feature("autodoc", "	:rtype: TDataStd_DataMapOfStringHArray1OfInteger
") Map;
		const TDataStd_DataMapOfStringHArray1OfInteger & Map ();
		%feature("compactdefaultargs") TDataStd_HDataMapOfStringHArray1OfInteger;
		%feature("autodoc", "	:param NbBuckets: default value is 1
	:type NbBuckets: int
	:rtype: None
") TDataStd_HDataMapOfStringHArray1OfInteger;
		 TDataStd_HDataMapOfStringHArray1OfInteger (const Standard_Integer NbBuckets = 1);
		%feature("compactdefaultargs") TDataStd_HDataMapOfStringHArray1OfInteger;
		%feature("autodoc", "	:param theOther:
	:type theOther: TDataStd_DataMapOfStringHArray1OfInteger &
	:rtype: None
") TDataStd_HDataMapOfStringHArray1OfInteger;
		 TDataStd_HDataMapOfStringHArray1OfInteger (const TDataStd_DataMapOfStringHArray1OfInteger & theOther);
};


%make_alias(TDataStd_HDataMapOfStringHArray1OfInteger)

%extend TDataStd_HDataMapOfStringHArray1OfInteger {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TDataStd_HDataMapOfStringHArray1OfReal;
class TDataStd_HDataMapOfStringHArray1OfReal : public Standard_Transient {
	public:
		%feature("compactdefaultargs") ChangeMap;
		%feature("autodoc", "	:rtype: TDataStd_DataMapOfStringHArray1OfReal
") ChangeMap;
		TDataStd_DataMapOfStringHArray1OfReal & ChangeMap ();
		%feature("compactdefaultargs") Map;
		%feature("autodoc", "	:rtype: TDataStd_DataMapOfStringHArray1OfReal
") Map;
		const TDataStd_DataMapOfStringHArray1OfReal & Map ();
		%feature("compactdefaultargs") TDataStd_HDataMapOfStringHArray1OfReal;
		%feature("autodoc", "	:param NbBuckets: default value is 1
	:type NbBuckets: int
	:rtype: None
") TDataStd_HDataMapOfStringHArray1OfReal;
		 TDataStd_HDataMapOfStringHArray1OfReal (const Standard_Integer NbBuckets = 1);
		%feature("compactdefaultargs") TDataStd_HDataMapOfStringHArray1OfReal;
		%feature("autodoc", "	:param theOther:
	:type theOther: TDataStd_DataMapOfStringHArray1OfReal &
	:rtype: None
") TDataStd_HDataMapOfStringHArray1OfReal;
		 TDataStd_HDataMapOfStringHArray1OfReal (const TDataStd_DataMapOfStringHArray1OfReal & theOther);
};


%make_alias(TDataStd_HDataMapOfStringHArray1OfReal)

%extend TDataStd_HDataMapOfStringHArray1OfReal {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TDataStd_HDataMapOfStringInteger;
class TDataStd_HDataMapOfStringInteger : public Standard_Transient {
	public:
		%feature("compactdefaultargs") ChangeMap;
		%feature("autodoc", "	:rtype: TColStd_DataMapOfStringInteger
") ChangeMap;
		TColStd_DataMapOfStringInteger & ChangeMap ();
		%feature("compactdefaultargs") Map;
		%feature("autodoc", "	:rtype: TColStd_DataMapOfStringInteger
") Map;
		const TColStd_DataMapOfStringInteger & Map ();
		%feature("compactdefaultargs") TDataStd_HDataMapOfStringInteger;
		%feature("autodoc", "	:param NbBuckets: default value is 1
	:type NbBuckets: int
	:rtype: None
") TDataStd_HDataMapOfStringInteger;
		 TDataStd_HDataMapOfStringInteger (const Standard_Integer NbBuckets = 1);
		%feature("compactdefaultargs") TDataStd_HDataMapOfStringInteger;
		%feature("autodoc", "	:param theOther:
	:type theOther: TColStd_DataMapOfStringInteger &
	:rtype: None
") TDataStd_HDataMapOfStringInteger;
		 TDataStd_HDataMapOfStringInteger (const TColStd_DataMapOfStringInteger & theOther);
};


%make_alias(TDataStd_HDataMapOfStringInteger)

%extend TDataStd_HDataMapOfStringInteger {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TDataStd_HDataMapOfStringReal;
class TDataStd_HDataMapOfStringReal : public Standard_Transient {
	public:
		%feature("compactdefaultargs") ChangeMap;
		%feature("autodoc", "	:rtype: TDataStd_DataMapOfStringReal
") ChangeMap;
		TDataStd_DataMapOfStringReal & ChangeMap ();
		%feature("compactdefaultargs") Map;
		%feature("autodoc", "	:rtype: TDataStd_DataMapOfStringReal
") Map;
		const TDataStd_DataMapOfStringReal & Map ();
		%feature("compactdefaultargs") TDataStd_HDataMapOfStringReal;
		%feature("autodoc", "	:param NbBuckets: default value is 1
	:type NbBuckets: int
	:rtype: None
") TDataStd_HDataMapOfStringReal;
		 TDataStd_HDataMapOfStringReal (const Standard_Integer NbBuckets = 1);
		%feature("compactdefaultargs") TDataStd_HDataMapOfStringReal;
		%feature("autodoc", "	:param theOther:
	:type theOther: TDataStd_DataMapOfStringReal &
	:rtype: None
") TDataStd_HDataMapOfStringReal;
		 TDataStd_HDataMapOfStringReal (const TDataStd_DataMapOfStringReal & theOther);
};


%make_alias(TDataStd_HDataMapOfStringReal)

%extend TDataStd_HDataMapOfStringReal {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TDataStd_HDataMapOfStringString;
class TDataStd_HDataMapOfStringString : public Standard_Transient {
	public:
		%feature("compactdefaultargs") ChangeMap;
		%feature("autodoc", "	:rtype: TDataStd_DataMapOfStringString
") ChangeMap;
		TDataStd_DataMapOfStringString & ChangeMap ();
		%feature("compactdefaultargs") Map;
		%feature("autodoc", "	:rtype: TDataStd_DataMapOfStringString
") Map;
		const TDataStd_DataMapOfStringString & Map ();
		%feature("compactdefaultargs") TDataStd_HDataMapOfStringString;
		%feature("autodoc", "	:param NbBuckets: default value is 1
	:type NbBuckets: int
	:rtype: None
") TDataStd_HDataMapOfStringString;
		 TDataStd_HDataMapOfStringString (const Standard_Integer NbBuckets = 1);
		%feature("compactdefaultargs") TDataStd_HDataMapOfStringString;
		%feature("autodoc", "	:param theOther:
	:type theOther: TDataStd_DataMapOfStringString &
	:rtype: None
") TDataStd_HDataMapOfStringString;
		 TDataStd_HDataMapOfStringString (const TDataStd_DataMapOfStringString & theOther);
};


%make_alias(TDataStd_HDataMapOfStringString)

%extend TDataStd_HDataMapOfStringString {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TDataStd_IntPackedMap;
class TDataStd_IntPackedMap : public TDF_Attribute {
	public:
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "	:param theKey:
	:type theKey: int
	:rtype: bool
") Add;
		Standard_Boolean Add (const Standard_Integer theKey);
		%feature("compactdefaultargs") ChangeMap;
		%feature("autodoc", "	:param theMap:
	:type theMap: opencascade::handle<TColStd_HPackedMapOfInteger> &
	:rtype: bool
") ChangeMap;
		Standard_Boolean ChangeMap (const opencascade::handle<TColStd_HPackedMapOfInteger> & theMap);
		%feature("compactdefaultargs") ChangeMap;
		%feature("autodoc", "	:param theMap:
	:type theMap: TColStd_PackedMapOfInteger &
	:rtype: bool
") ChangeMap;
		Standard_Boolean ChangeMap (const TColStd_PackedMapOfInteger & theMap);
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: bool
") Clear;
		Standard_Boolean Clear ();
		%feature("compactdefaultargs") Contains;
		%feature("autodoc", "	:param theKey:
	:type theKey: int
	:rtype: bool
") Contains;
		Standard_Boolean Contains (const Standard_Integer theKey);
		%feature("compactdefaultargs") DeltaOnModification;
		%feature("autodoc", "	* Makes a DeltaOnModification between <self> and <anOldAttribute>.

	:param anOldAttribute:
	:type anOldAttribute: opencascade::handle<TDF_Attribute> &
	:rtype: opencascade::handle<TDF_DeltaOnModification>
") DeltaOnModification;
		virtual opencascade::handle<TDF_DeltaOnModification> DeltaOnModification (const opencascade::handle<TDF_Attribute> & anOldAttribute);

        %feature("autodoc", "1");
        %extend{
            std::string DumpToString() {
            std::stringstream s;
            self->Dump(s);
            return s.str();}
        };
        		%feature("compactdefaultargs") Extent;
		%feature("autodoc", "	:rtype: int
") Extent;
		Standard_Integer Extent ();
		%feature("compactdefaultargs") GetDelta;
		%feature("autodoc", "	:rtype: bool
") GetDelta;
		Standard_Boolean GetDelta ();
		%feature("compactdefaultargs") GetHMap;
		%feature("autodoc", "	:rtype: opencascade::handle<TColStd_HPackedMapOfInteger>
") GetHMap;
		const opencascade::handle<TColStd_HPackedMapOfInteger> & GetHMap ();
		%feature("compactdefaultargs") GetID;
		%feature("autodoc", "	* class methods ============= Returns the GUID of the attribute.

	:rtype: Standard_GUID
") GetID;
		static const Standard_GUID & GetID ();
		%feature("compactdefaultargs") GetMap;
		%feature("autodoc", "	:rtype: TColStd_PackedMapOfInteger
") GetMap;
		const TColStd_PackedMapOfInteger & GetMap ();
		%feature("compactdefaultargs") ID;
		%feature("autodoc", "	:rtype: Standard_GUID
") ID;
		const Standard_GUID & ID ();
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "	:rtype: bool
") IsEmpty;
		Standard_Boolean IsEmpty ();
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "	:rtype: opencascade::handle<TDF_Attribute>
") NewEmpty;
		opencascade::handle<TDF_Attribute> NewEmpty ();
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	:param into:
	:type into: opencascade::handle<TDF_Attribute> &
	:param RT:
	:type RT: opencascade::handle<TDF_RelocationTable> &
	:rtype: None
") Paste;
		void Paste (const opencascade::handle<TDF_Attribute> & into,const opencascade::handle<TDF_RelocationTable> & RT);
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	:param theKey:
	:type theKey: int
	:rtype: bool
") Remove;
		Standard_Boolean Remove (const Standard_Integer theKey);
		%feature("compactdefaultargs") Restore;
		%feature("autodoc", "	:param with:
	:type with: opencascade::handle<TDF_Attribute> &
	:rtype: None
") Restore;
		void Restore (const opencascade::handle<TDF_Attribute> & with);
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "	* Finds or creates an integer map attribute on the given label. If <isDelta> == False, DefaultDeltaOnModification is used. If <isDelta> == True, DeltaOnModification of the current attribute is used. If attribute is already set, input parameter <isDelta> is refused and the found attribute returned. Attribute methods ===================

	:param label:
	:type label: TDF_Label &
	:param isDelta: default value is Standard_False
	:type isDelta: bool
	:rtype: opencascade::handle<TDataStd_IntPackedMap>
") Set;
		static opencascade::handle<TDataStd_IntPackedMap> Set (const TDF_Label & label,const Standard_Boolean isDelta = Standard_False);
		%feature("compactdefaultargs") SetDelta;
		%feature("autodoc", "	* for internal use only!

	:param isDelta:
	:type isDelta: bool
	:rtype: None
") SetDelta;
		void SetDelta (const Standard_Boolean isDelta);
		%feature("compactdefaultargs") TDataStd_IntPackedMap;
		%feature("autodoc", "	:rtype: None
") TDataStd_IntPackedMap;
		 TDataStd_IntPackedMap ();
};


%make_alias(TDataStd_IntPackedMap)

%extend TDataStd_IntPackedMap {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TDataStd_Integer;
class TDataStd_Integer : public TDF_Attribute {
	public:

        %feature("autodoc", "1");
        %extend{
            std::string DumpToString() {
            std::stringstream s;
            self->Dump(s);
            return s.str();}
        };
        		%feature("compactdefaultargs") Get;
		%feature("autodoc", "	* Returns the integer value contained in the attribute.

	:rtype: int
") Get;
		Standard_Integer Get ();
		%feature("compactdefaultargs") GetID;
		%feature("autodoc", "	* class methods ============= Returns the GUID for integers.

	:rtype: Standard_GUID
") GetID;
		static const Standard_GUID & GetID ();
		%feature("compactdefaultargs") ID;
		%feature("autodoc", "	:rtype: Standard_GUID
") ID;
		const Standard_GUID & ID ();
		%feature("compactdefaultargs") IsCaptured;
		%feature("autodoc", "	* Returns True if there is a reference on the same label

	:rtype: bool
") IsCaptured;
		Standard_Boolean IsCaptured ();
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "	:rtype: opencascade::handle<TDF_Attribute>
") NewEmpty;
		opencascade::handle<TDF_Attribute> NewEmpty ();
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	:param Into:
	:type Into: opencascade::handle<TDF_Attribute> &
	:param RT:
	:type RT: opencascade::handle<TDF_RelocationTable> &
	:rtype: None
") Paste;
		void Paste (const opencascade::handle<TDF_Attribute> & Into,const opencascade::handle<TDF_RelocationTable> & RT);
		%feature("compactdefaultargs") Restore;
		%feature("autodoc", "	:param With:
	:type With: opencascade::handle<TDF_Attribute> &
	:rtype: None
") Restore;
		void Restore (const opencascade::handle<TDF_Attribute> & With);
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "	* Finds, or creates, an Integer attribute and sets <value> the Integer attribute is returned.

	:param label:
	:type label: TDF_Label &
	:param value:
	:type value: int
	:rtype: opencascade::handle<TDataStd_Integer>
") Set;
		static opencascade::handle<TDataStd_Integer> Set (const TDF_Label & label,const Standard_Integer value);
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "	* Finds, or creates, an Integer attribute with explicit user defined <guid> and sets <value>. The Integer attribute is returned.

	:param label:
	:type label: TDF_Label &
	:param guid:
	:type guid: Standard_GUID &
	:param value:
	:type value: int
	:rtype: opencascade::handle<TDataStd_Integer>
") Set;
		static opencascade::handle<TDataStd_Integer> Set (const TDF_Label & label,const Standard_GUID & guid,const Standard_Integer value);
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "	* Integer methods ===============

	:param V:
	:type V: int
	:rtype: None
") Set;
		void Set (const Standard_Integer V);
		%feature("compactdefaultargs") SetID;
		%feature("autodoc", "	* Sets the explicit GUID (user defined) for the attribute.

	:param guid:
	:type guid: Standard_GUID &
	:rtype: None
") SetID;
		void SetID (const Standard_GUID & guid);
		%feature("compactdefaultargs") SetID;
		%feature("autodoc", "	* Sets default GUID for the attribute.

	:rtype: None
") SetID;
		void SetID ();
		%feature("compactdefaultargs") TDataStd_Integer;
		%feature("autodoc", "	:rtype: None
") TDataStd_Integer;
		 TDataStd_Integer ();
};


%make_alias(TDataStd_Integer)

%extend TDataStd_Integer {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TDataStd_IntegerArray;
class TDataStd_IntegerArray : public TDF_Attribute {
	public:
		%feature("compactdefaultargs") Array;
		%feature("autodoc", "	* Return the inner array of the IntegerArray attribute

	:rtype: opencascade::handle<TColStd_HArray1OfInteger>
") Array;
		const opencascade::handle<TColStd_HArray1OfInteger> & Array ();
		%feature("compactdefaultargs") ChangeArray;
		%feature("autodoc", "	* Sets the inner array <myValue> of the IntegerArray attribute to <newArray>. If value of <newArray> differs from <myValue>, Backup performed and myValue refers to new instance of HArray1OfInteger that holds <newArray> values If <isCheckItems> equal True each item of <newArray> will be checked with each item of <myValue> for coincidence (to avoid backup).

	:param newArray:
	:type newArray: opencascade::handle<TColStd_HArray1OfInteger> &
	:param isCheckItems: default value is Standard_True
	:type isCheckItems: bool
	:rtype: None
") ChangeArray;
		void ChangeArray (const opencascade::handle<TColStd_HArray1OfInteger> & newArray,const Standard_Boolean isCheckItems = Standard_True);
		%feature("compactdefaultargs") DeltaOnModification;
		%feature("autodoc", "	* Makes a DeltaOnModification between <self> and <anOldAttribute>.

	:param anOldAttribute:
	:type anOldAttribute: opencascade::handle<TDF_Attribute> &
	:rtype: opencascade::handle<TDF_DeltaOnModification>
") DeltaOnModification;
		virtual opencascade::handle<TDF_DeltaOnModification> DeltaOnModification (const opencascade::handle<TDF_Attribute> & anOldAttribute);

        %feature("autodoc", "1");
        %extend{
            std::string DumpToString() {
            std::stringstream s;
            self->Dump(s);
            return s.str();}
        };
        		%feature("compactdefaultargs") GetDelta;
		%feature("autodoc", "	:rtype: bool
") GetDelta;
		Standard_Boolean GetDelta ();
		%feature("compactdefaultargs") GetID;
		%feature("autodoc", "	* class methods ============= Returns the GUID for arrays of integers.

	:rtype: Standard_GUID
") GetID;
		static const Standard_GUID & GetID ();
		%feature("compactdefaultargs") ID;
		%feature("autodoc", "	:rtype: Standard_GUID
") ID;
		const Standard_GUID & ID ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	* Initialize the inner array with bounds from <lower> to <upper>

	:param lower:
	:type lower: int
	:param upper:
	:type upper: int
	:rtype: None
") Init;
		void Init (const Standard_Integer lower,const Standard_Integer upper);
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "	* Returns the length of this array of integers in terms of the number of elements it contains.

	:rtype: int
") Length;
		Standard_Integer Length ();
		%feature("compactdefaultargs") Lower;
		%feature("autodoc", "	* Returns the lower boundary of this array of integers.

	:rtype: int
") Lower;
		Standard_Integer Lower ();
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "	:rtype: opencascade::handle<TDF_Attribute>
") NewEmpty;
		opencascade::handle<TDF_Attribute> NewEmpty ();
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	* Note. Uses inside ChangeArray() method

	:param Into:
	:type Into: opencascade::handle<TDF_Attribute> &
	:param RT:
	:type RT: opencascade::handle<TDF_RelocationTable> &
	:rtype: None
") Paste;
		void Paste (const opencascade::handle<TDF_Attribute> & Into,const opencascade::handle<TDF_RelocationTable> & RT);
		%feature("compactdefaultargs") Restore;
		%feature("autodoc", "	:param With:
	:type With: opencascade::handle<TDF_Attribute> &
	:rtype: None
") Restore;
		void Restore (const opencascade::handle<TDF_Attribute> & With);
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "	* Finds or creates on the <label> an integer array attribute with the specified <lower> and <upper> boundaries. If <isDelta> == False, DefaultDeltaOnModification is used. If <isDelta> == True, DeltaOnModification of the current attribute is used. If attribute is already set, all input parameters are refused and the found attribute is returned.

	:param label:
	:type label: TDF_Label &
	:param lower:
	:type lower: int
	:param upper:
	:type upper: int
	:param isDelta: default value is Standard_False
	:type isDelta: bool
	:rtype: opencascade::handle<TDataStd_IntegerArray>
") Set;
		static opencascade::handle<TDataStd_IntegerArray> Set (const TDF_Label & label,const Standard_Integer lower,const Standard_Integer upper,const Standard_Boolean isDelta = Standard_False);
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "	* Finds, or creates, an IntegerArray attribute with explicit user defined <guid>. The IntegerArray attribute is returned.

	:param label:
	:type label: TDF_Label &
	:param theGuid:
	:type theGuid: Standard_GUID &
	:param lower:
	:type lower: int
	:param upper:
	:type upper: int
	:param isDelta: default value is Standard_False
	:type isDelta: bool
	:rtype: opencascade::handle<TDataStd_IntegerArray>
") Set;
		static opencascade::handle<TDataStd_IntegerArray> Set (const TDF_Label & label,const Standard_GUID & theGuid,const Standard_Integer lower,const Standard_Integer upper,const Standard_Boolean isDelta = Standard_False);
		%feature("compactdefaultargs") SetDelta;
		%feature("autodoc", "	* for internal use only!

	:param isDelta:
	:type isDelta: bool
	:rtype: None
") SetDelta;
		void SetDelta (const Standard_Boolean isDelta);
		%feature("compactdefaultargs") SetID;
		%feature("autodoc", "	* Sets the explicit GUID (user defined) for the attribute.

	:param theGuid:
	:type theGuid: Standard_GUID &
	:rtype: None
") SetID;
		void SetID (const Standard_GUID & theGuid);
		%feature("compactdefaultargs") SetID;
		%feature("autodoc", "	* Sets default GUID for the attribute.

	:rtype: None
") SetID;
		void SetID ();
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	* Sets the <Index>th element of the array to <Value> OutOfRange exception is raised if <Index> doesn't respect Lower and Upper bounds of the internal array.

	:param Index:
	:type Index: int
	:param Value:
	:type Value: int
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const Standard_Integer Value);
		%feature("compactdefaultargs") TDataStd_IntegerArray;
		%feature("autodoc", "	:rtype: None
") TDataStd_IntegerArray;
		 TDataStd_IntegerArray ();
		%feature("compactdefaultargs") Upper;
		%feature("autodoc", "	* Return the upper boundary of this array of integers.

	:rtype: int
") Upper;
		Standard_Integer Upper ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	* Return the value of the <Index>th element of the array

	:param Index:
	:type Index: int
	:rtype: int
") Value;
		Standard_Integer Value (const Standard_Integer Index);
};


%make_alias(TDataStd_IntegerArray)

%extend TDataStd_IntegerArray {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TDataStd_IntegerList;
class TDataStd_IntegerList : public TDF_Attribute {
	public:
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param value:
	:type value: int
	:rtype: None
") Append;
		void Append (const Standard_Integer value);
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();

        %feature("autodoc", "1");
        %extend{
            std::string DumpToString() {
            std::stringstream s;
            self->Dump(s);
            return s.str();}
        };
        		%feature("compactdefaultargs") Extent;
		%feature("autodoc", "	:rtype: int
") Extent;
		Standard_Integer Extent ();
		%feature("compactdefaultargs") First;
		%feature("autodoc", "	:rtype: int
") First;
		Standard_Integer First ();
		%feature("compactdefaultargs") GetID;
		%feature("autodoc", "	* Static methods ============== Returns the ID of the list of integer attribute.

	:rtype: Standard_GUID
") GetID;
		static const Standard_GUID & GetID ();
		%feature("compactdefaultargs") ID;
		%feature("autodoc", "	:rtype: Standard_GUID
") ID;
		const Standard_GUID & ID ();
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	* Inserts the <value> after the first meet of <after_value>.

	:param value:
	:type value: int
	:param after_value:
	:type after_value: int
	:rtype: bool
") InsertAfter;
		Standard_Boolean InsertAfter (const Standard_Integer value,const Standard_Integer after_value);
		%feature("compactdefaultargs") InsertAfterByIndex;
		%feature("autodoc", "	* Inserts the <value> after the <index> position. The indices start with 1 .. Extent().

	:param index:
	:type index: int
	:param after_value:
	:type after_value: int
	:rtype: bool
") InsertAfterByIndex;
		Standard_Boolean InsertAfterByIndex (const Standard_Integer index,const Standard_Integer after_value);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	* Inserts the <value> before the first meet of <before_value>.

	:param value:
	:type value: int
	:param before_value:
	:type before_value: int
	:rtype: bool
") InsertBefore;
		Standard_Boolean InsertBefore (const Standard_Integer value,const Standard_Integer before_value);
		%feature("compactdefaultargs") InsertBeforeByIndex;
		%feature("autodoc", "	* Inserts the <value> before the <index> position. The indices start with 1 .. Extent().

	:param index:
	:type index: int
	:param before_value:
	:type before_value: int
	:rtype: bool
") InsertBeforeByIndex;
		Standard_Boolean InsertBeforeByIndex (const Standard_Integer index,const Standard_Integer before_value);
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "	:rtype: bool
") IsEmpty;
		Standard_Boolean IsEmpty ();
		%feature("compactdefaultargs") Last;
		%feature("autodoc", "	:rtype: int
") Last;
		Standard_Integer Last ();
		%feature("compactdefaultargs") List;
		%feature("autodoc", "	:rtype: TColStd_ListOfInteger
") List;
		const TColStd_ListOfInteger & List ();
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "	:rtype: opencascade::handle<TDF_Attribute>
") NewEmpty;
		opencascade::handle<TDF_Attribute> NewEmpty ();
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	:param Into:
	:type Into: opencascade::handle<TDF_Attribute> &
	:param RT:
	:type RT: opencascade::handle<TDF_RelocationTable> &
	:rtype: None
") Paste;
		void Paste (const opencascade::handle<TDF_Attribute> & Into,const opencascade::handle<TDF_RelocationTable> & RT);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param value:
	:type value: int
	:rtype: None
") Prepend;
		void Prepend (const Standard_Integer value);
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	* Removes the first meet of the <value>.

	:param value:
	:type value: int
	:rtype: bool
") Remove;
		Standard_Boolean Remove (const Standard_Integer value);
		%feature("compactdefaultargs") RemoveByIndex;
		%feature("autodoc", "	* Removes a value at <index> position.

	:param index:
	:type index: int
	:rtype: bool
") RemoveByIndex;
		Standard_Boolean RemoveByIndex (const Standard_Integer index);
		%feature("compactdefaultargs") Restore;
		%feature("autodoc", "	:param With:
	:type With: opencascade::handle<TDF_Attribute> &
	:rtype: None
") Restore;
		void Restore (const opencascade::handle<TDF_Attribute> & With);
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "	* Finds or creates a list of integer values attribute.

	:param label:
	:type label: TDF_Label &
	:rtype: opencascade::handle<TDataStd_IntegerList>
") Set;
		static opencascade::handle<TDataStd_IntegerList> Set (const TDF_Label & label);
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "	* Finds or creates a list of integer values attribute with explicit user defined <guid>.

	:param label:
	:type label: TDF_Label &
	:param theGuid:
	:type theGuid: Standard_GUID &
	:rtype: opencascade::handle<TDataStd_IntegerList>
") Set;
		static opencascade::handle<TDataStd_IntegerList> Set (const TDF_Label & label,const Standard_GUID & theGuid);
		%feature("compactdefaultargs") SetID;
		%feature("autodoc", "	* Sets the explicit GUID (user defined) for the attribute.

	:param theGuid:
	:type theGuid: Standard_GUID &
	:rtype: None
") SetID;
		void SetID (const Standard_GUID & theGuid);
		%feature("compactdefaultargs") SetID;
		%feature("autodoc", "	* Sets default GUID for the attribute.

	:rtype: None
") SetID;
		void SetID ();
		%feature("compactdefaultargs") TDataStd_IntegerList;
		%feature("autodoc", "	:rtype: None
") TDataStd_IntegerList;
		 TDataStd_IntegerList ();
};


%make_alias(TDataStd_IntegerList)

%extend TDataStd_IntegerList {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TDataStd_Name;
class TDataStd_Name : public TDF_Attribute {
	public:

        %feature("autodoc", "1");
        %extend{
            std::string DumpToString() {
            std::stringstream s;
            self->Dump(s);
            return s.str();}
        };
        		%feature("compactdefaultargs") Get;
		%feature("autodoc", "	* Returns the name contained in this name attribute.

	:rtype: TCollection_ExtendedString
") Get;
		const TCollection_ExtendedString & Get ();
		%feature("compactdefaultargs") GetID;
		%feature("autodoc", "	* class methods working on the name itself ======================================== Returns the GUID for name attributes.

	:rtype: Standard_GUID
") GetID;
		static const Standard_GUID & GetID ();
		%feature("compactdefaultargs") ID;
		%feature("autodoc", "	:rtype: Standard_GUID
") ID;
		const Standard_GUID & ID ();
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "	:rtype: opencascade::handle<TDF_Attribute>
") NewEmpty;
		opencascade::handle<TDF_Attribute> NewEmpty ();
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	:param into:
	:type into: opencascade::handle<TDF_Attribute> &
	:param RT:
	:type RT: opencascade::handle<TDF_RelocationTable> &
	:rtype: None
") Paste;
		void Paste (const opencascade::handle<TDF_Attribute> & into,const opencascade::handle<TDF_RelocationTable> & RT);
		%feature("compactdefaultargs") Restore;
		%feature("autodoc", "	:param with:
	:type with: opencascade::handle<TDF_Attribute> &
	:rtype: None
") Restore;
		void Restore (const opencascade::handle<TDF_Attribute> & with);
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "	* Creates (if does not exist) and sets the name in the name attribute. from any label <L> search in father labels (L is not concerned) the first name attribute.if found set it in <father>. class methods working on the name tree ====================================== Search in the whole TDF_Data the Name attribute which fit with <fullPath>. Returns True if found. Search under <currentLabel> a label which fit with <name>. Returns True if found. Shortcut which avoids building a ListOfExtendedStrin. Search in the whole TDF_Data the label which fit with name Returns True if found. tools methods to translate path <-> pathlist =========================================== move to draw For Draw test we may provide this tool method which convert a path in a sequence of string to call after the FindLabel methods. Example: if it's given 'Assembly:Part_1:Sketch_5' it will return in <pathlist> the list of 3 strings: 'Assembly','Part_1','Sketch_5'. move to draw from <pathlist> build the string path Name methods ============

	:param label:
	:type label: TDF_Label &
	:param string:
	:type string: TCollection_ExtendedString &
	:rtype: opencascade::handle<TDataStd_Name>
") Set;
		static opencascade::handle<TDataStd_Name> Set (const TDF_Label & label,const TCollection_ExtendedString & string);
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "	* Finds, or creates, a Name attribute with explicit user defined <guid> and sets <string>. The Name attribute is returned.

	:param label:
	:type label: TDF_Label &
	:param guid:
	:type guid: Standard_GUID &
	:param string:
	:type string: TCollection_ExtendedString &
	:rtype: opencascade::handle<TDataStd_Name>
") Set;
		static opencascade::handle<TDataStd_Name> Set (const TDF_Label & label,const Standard_GUID & guid,const TCollection_ExtendedString & string);
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "	* Sets <S> as name. Raises if <S> is not a valid name.

	:param S:
	:type S: TCollection_ExtendedString &
	:rtype: None
") Set;
		void Set (const TCollection_ExtendedString & S);
		%feature("compactdefaultargs") SetID;
		%feature("autodoc", "	* Sets the explicit user defined GUID to the attribute.

	:param guid:
	:type guid: Standard_GUID &
	:rtype: None
") SetID;
		void SetID (const Standard_GUID & guid);
		%feature("compactdefaultargs") SetID;
		%feature("autodoc", "	* Sets default GUID for the attribute.

	:rtype: None
") SetID;
		void SetID ();
		%feature("compactdefaultargs") TDataStd_Name;
		%feature("autodoc", "	:rtype: None
") TDataStd_Name;
		 TDataStd_Name ();
};


%make_alias(TDataStd_Name)

%extend TDataStd_Name {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TDataStd_NamedData;
class TDataStd_NamedData : public TDF_Attribute {
	public:
		%feature("compactdefaultargs") ChangeArraysOfIntegers;
		%feature("autodoc", "	* Replace the container content by new content of the <theArraysOfIntegers>.

	:param theArraysOfIntegers:
	:type theArraysOfIntegers: TDataStd_DataMapOfStringHArray1OfInteger &
	:rtype: None
") ChangeArraysOfIntegers;
		void ChangeArraysOfIntegers (const TDataStd_DataMapOfStringHArray1OfInteger & theArraysOfIntegers);
		%feature("compactdefaultargs") ChangeArraysOfReals;
		%feature("autodoc", "	* Replace the container content by new content of the <theArraysOfReals>.

	:param theArraysOfReals:
	:type theArraysOfReals: TDataStd_DataMapOfStringHArray1OfReal &
	:rtype: None
") ChangeArraysOfReals;
		void ChangeArraysOfReals (const TDataStd_DataMapOfStringHArray1OfReal & theArraysOfReals);
		%feature("compactdefaultargs") ChangeBytes;
		%feature("autodoc", "	* Replace the container content by new content of the <theBytes>.

	:param theBytes:
	:type theBytes: TDataStd_DataMapOfStringByte &
	:rtype: None
") ChangeBytes;
		void ChangeBytes (const TDataStd_DataMapOfStringByte & theBytes);
		%feature("compactdefaultargs") ChangeIntegers;
		%feature("autodoc", "	* Replace the container content by new content of the <theIntegers>.

	:param theIntegers:
	:type theIntegers: TColStd_DataMapOfStringInteger &
	:rtype: None
") ChangeIntegers;
		void ChangeIntegers (const TColStd_DataMapOfStringInteger & theIntegers);
		%feature("compactdefaultargs") ChangeReals;
		%feature("autodoc", "	* Replace the container content by new content of the <theReals>.

	:param theReals:
	:type theReals: TDataStd_DataMapOfStringReal &
	:rtype: None
") ChangeReals;
		void ChangeReals (const TDataStd_DataMapOfStringReal & theReals);
		%feature("compactdefaultargs") ChangeStrings;
		%feature("autodoc", "	* Replace the container content by new content of the <theStrings>.

	:param theStrings:
	:type theStrings: TDataStd_DataMapOfStringString &
	:rtype: None
") ChangeStrings;
		void ChangeStrings (const TDataStd_DataMapOfStringString & theStrings);

        %feature("autodoc", "1");
        %extend{
            std::string DumpToString() {
            std::stringstream s;
            self->Dump(s);
            return s.str();}
        };
        		%feature("compactdefaultargs") GetArrayOfIntegers;
		%feature("autodoc", "	* Returns the named array of integer values. It returns a NULL Handle if there is no such a named array of integers (use HasArrayOfIntegers()).

	:param theName:
	:type theName: TCollection_ExtendedString &
	:rtype: opencascade::handle<TColStd_HArray1OfInteger>
") GetArrayOfIntegers;
		const opencascade::handle<TColStd_HArray1OfInteger> & GetArrayOfIntegers (const TCollection_ExtendedString & theName);
		%feature("compactdefaultargs") GetArrayOfReals;
		%feature("autodoc", "	* Returns the named array of real values. It returns a NULL Handle if there is no such a named array of reals (use HasArrayOfReals()).

	:param theName:
	:type theName: TCollection_ExtendedString &
	:rtype: opencascade::handle<TColStd_HArray1OfReal>
") GetArrayOfReals;
		const opencascade::handle<TColStd_HArray1OfReal> & GetArrayOfReals (const TCollection_ExtendedString & theName);
		%feature("compactdefaultargs") GetArraysOfIntegersContainer;
		%feature("autodoc", "	* Returns the internal container of named arrays of integer values.

	:rtype: TDataStd_DataMapOfStringHArray1OfInteger
") GetArraysOfIntegersContainer;
		const TDataStd_DataMapOfStringHArray1OfInteger & GetArraysOfIntegersContainer ();
		%feature("compactdefaultargs") GetArraysOfRealsContainer;
		%feature("autodoc", "	* Returns the internal container of named arrays of real values.

	:rtype: TDataStd_DataMapOfStringHArray1OfReal
") GetArraysOfRealsContainer;
		const TDataStd_DataMapOfStringHArray1OfReal & GetArraysOfRealsContainer ();
		%feature("compactdefaultargs") GetByte;
		%feature("autodoc", "	* Returns the named byte. It returns 0 if there is no such a named byte (use HasByte()).

	:param theName:
	:type theName: TCollection_ExtendedString &
	:rtype: Standard_Byte
") GetByte;
		Standard_Byte GetByte (const TCollection_ExtendedString & theName);
		%feature("compactdefaultargs") GetBytesContainer;
		%feature("autodoc", "	* Returns the internal container of named bytes.

	:rtype: TDataStd_DataMapOfStringByte
") GetBytesContainer;
		const TDataStd_DataMapOfStringByte & GetBytesContainer ();
		%feature("compactdefaultargs") GetID;
		%feature("autodoc", "	* Static methods ============== Returns the ID of the named data attribute.

	:rtype: Standard_GUID
") GetID;
		static const Standard_GUID & GetID ();
		%feature("compactdefaultargs") GetInteger;
		%feature("autodoc", "	* Returns the integer value specified by the Name. It returns 0 if internal map doesn't contain the specified integer (use HasInteger() to check before).

	:param theName:
	:type theName: TCollection_ExtendedString &
	:rtype: int
") GetInteger;
		Standard_Integer GetInteger (const TCollection_ExtendedString & theName);
		%feature("compactdefaultargs") GetIntegersContainer;
		%feature("autodoc", "	* Returns the internal container of named integers.

	:rtype: TColStd_DataMapOfStringInteger
") GetIntegersContainer;
		const TColStd_DataMapOfStringInteger & GetIntegersContainer ();
		%feature("compactdefaultargs") GetReal;
		%feature("autodoc", "	* Returns the named real. It returns 0.0 if there is no such a named real (use HasReal()).

	:param theName:
	:type theName: TCollection_ExtendedString &
	:rtype: float
") GetReal;
		Standard_Real GetReal (const TCollection_ExtendedString & theName);
		%feature("compactdefaultargs") GetRealsContainer;
		%feature("autodoc", "	* Returns the internal container of named reals.

	:rtype: TDataStd_DataMapOfStringReal
") GetRealsContainer;
		const TDataStd_DataMapOfStringReal & GetRealsContainer ();
		%feature("compactdefaultargs") GetString;
		%feature("autodoc", "	* Returns the named string. It returns an empty string if there is no such a named string (use HasString()).

	:param theName:
	:type theName: TCollection_ExtendedString &
	:rtype: TCollection_ExtendedString
") GetString;
		const TCollection_ExtendedString & GetString (const TCollection_ExtendedString & theName);
		%feature("compactdefaultargs") GetStringsContainer;
		%feature("autodoc", "	* Returns the internal container of named strings.

	:rtype: TDataStd_DataMapOfStringString
") GetStringsContainer;
		const TDataStd_DataMapOfStringString & GetStringsContainer ();
		%feature("compactdefaultargs") HasArrayOfIntegers;
		%feature("autodoc", "	* Returns true if the attribute contains this named array of integer values.

	:param theName:
	:type theName: TCollection_ExtendedString &
	:rtype: bool
") HasArrayOfIntegers;
		Standard_Boolean HasArrayOfIntegers (const TCollection_ExtendedString & theName);
		%feature("compactdefaultargs") HasArrayOfReals;
		%feature("autodoc", "	* Returns true if the attribute contains this named array of real values.

	:param theName:
	:type theName: TCollection_ExtendedString &
	:rtype: bool
") HasArrayOfReals;
		Standard_Boolean HasArrayOfReals (const TCollection_ExtendedString & theName);
		%feature("compactdefaultargs") HasArraysOfIntegers;
		%feature("autodoc", "	* Returns true if there are some named arrays of integer values in the attribute.

	:rtype: bool
") HasArraysOfIntegers;
		Standard_Boolean HasArraysOfIntegers ();
		%feature("compactdefaultargs") HasArraysOfReals;
		%feature("autodoc", "	* Returns true if there are some named arrays of real values in the attribute.

	:rtype: bool
") HasArraysOfReals;
		Standard_Boolean HasArraysOfReals ();
		%feature("compactdefaultargs") HasByte;
		%feature("autodoc", "	* Returns true if the attribute contains this named byte.

	:param theName:
	:type theName: TCollection_ExtendedString &
	:rtype: bool
") HasByte;
		Standard_Boolean HasByte (const TCollection_ExtendedString & theName);
		%feature("compactdefaultargs") HasBytes;
		%feature("autodoc", "	* Returns true if there are some named bytes in the attribute.

	:rtype: bool
") HasBytes;
		Standard_Boolean HasBytes ();
		%feature("compactdefaultargs") HasInteger;
		%feature("autodoc", "	* Returns true if the attribute contains specified by Name integer value.

	:param theName:
	:type theName: TCollection_ExtendedString &
	:rtype: bool
") HasInteger;
		Standard_Boolean HasInteger (const TCollection_ExtendedString & theName);
		%feature("compactdefaultargs") HasIntegers;
		%feature("autodoc", "	* Returns true if at least one named integer value is kept in the attribute.

	:rtype: bool
") HasIntegers;
		Standard_Boolean HasIntegers ();
		%feature("compactdefaultargs") HasReal;
		%feature("autodoc", "	* Returns true if the attribute contains a real specified by Name.

	:param theName:
	:type theName: TCollection_ExtendedString &
	:rtype: bool
") HasReal;
		Standard_Boolean HasReal (const TCollection_ExtendedString & theName);
		%feature("compactdefaultargs") HasReals;
		%feature("autodoc", "	* Returns true if at least one named real value is kept in the attribute.

	:rtype: bool
") HasReals;
		Standard_Boolean HasReals ();
		%feature("compactdefaultargs") HasString;
		%feature("autodoc", "	* Returns true if the attribute contains this named string.

	:param theName:
	:type theName: TCollection_ExtendedString &
	:rtype: bool
") HasString;
		Standard_Boolean HasString (const TCollection_ExtendedString & theName);
		%feature("compactdefaultargs") HasStrings;
		%feature("autodoc", "	* Returns true if there are some named strings in the attribute.

	:rtype: bool
") HasStrings;
		Standard_Boolean HasStrings ();
		%feature("compactdefaultargs") ID;
		%feature("autodoc", "	:rtype: Standard_GUID
") ID;
		const Standard_GUID & ID ();
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "	:rtype: opencascade::handle<TDF_Attribute>
") NewEmpty;
		opencascade::handle<TDF_Attribute> NewEmpty ();
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	:param Into:
	:type Into: opencascade::handle<TDF_Attribute> &
	:param RT:
	:type RT: opencascade::handle<TDF_RelocationTable> &
	:rtype: None
") Paste;
		void Paste (const opencascade::handle<TDF_Attribute> & Into,const opencascade::handle<TDF_RelocationTable> & RT);
		%feature("compactdefaultargs") Restore;
		%feature("autodoc", "	:param With:
	:type With: opencascade::handle<TDF_Attribute> &
	:rtype: None
") Restore;
		void Restore (const opencascade::handle<TDF_Attribute> & With);
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "	* Finds or creates a named data attribute.

	:param label:
	:type label: TDF_Label &
	:rtype: opencascade::handle<TDataStd_NamedData>
") Set;
		static opencascade::handle<TDataStd_NamedData> Set (const TDF_Label & label);
		%feature("compactdefaultargs") SetArrayOfIntegers;
		%feature("autodoc", "	* Defines a named array of integer values. If the array already exists, it changes its value to <theArrayOfIntegers>.

	:param theName:
	:type theName: TCollection_ExtendedString &
	:param theArrayOfIntegers:
	:type theArrayOfIntegers: opencascade::handle<TColStd_HArray1OfInteger> &
	:rtype: None
") SetArrayOfIntegers;
		void SetArrayOfIntegers (const TCollection_ExtendedString & theName,const opencascade::handle<TColStd_HArray1OfInteger> & theArrayOfIntegers);
		%feature("compactdefaultargs") SetArrayOfReals;
		%feature("autodoc", "	* Defines a named array of real values. If the array already exists, it changes its value to <theArrayOfReals>.

	:param theName:
	:type theName: TCollection_ExtendedString &
	:param theArrayOfReals:
	:type theArrayOfReals: opencascade::handle<TColStd_HArray1OfReal> &
	:rtype: None
") SetArrayOfReals;
		void SetArrayOfReals (const TCollection_ExtendedString & theName,const opencascade::handle<TColStd_HArray1OfReal> & theArrayOfReals);
		%feature("compactdefaultargs") SetByte;
		%feature("autodoc", "	* Defines a named byte. If the byte already exists, it changes its value to <theByte>.

	:param theName:
	:type theName: TCollection_ExtendedString &
	:param theByte:
	:type theByte: Standard_Byte
	:rtype: None
") SetByte;
		void SetByte (const TCollection_ExtendedString & theName,const Standard_Byte theByte);
		%feature("compactdefaultargs") SetInteger;
		%feature("autodoc", "	* Defines a named integer. If the integer already exists, it changes its value to <theInteger>.

	:param theName:
	:type theName: TCollection_ExtendedString &
	:param theInteger:
	:type theInteger: int
	:rtype: None
") SetInteger;
		void SetInteger (const TCollection_ExtendedString & theName,const Standard_Integer theInteger);
		%feature("compactdefaultargs") SetReal;
		%feature("autodoc", "	* Defines a named real. If the real already exists, it changes its value to <theReal>.

	:param theName:
	:type theName: TCollection_ExtendedString &
	:param theReal:
	:type theReal: float
	:rtype: None
") SetReal;
		void SetReal (const TCollection_ExtendedString & theName,const Standard_Real theReal);
		%feature("compactdefaultargs") SetString;
		%feature("autodoc", "	* Defines a named string. If the string already exists, it changes its value to <theString>.

	:param theName:
	:type theName: TCollection_ExtendedString &
	:param theString:
	:type theString: TCollection_ExtendedString &
	:rtype: None
") SetString;
		void SetString (const TCollection_ExtendedString & theName,const TCollection_ExtendedString & theString);
		%feature("compactdefaultargs") TDataStd_NamedData;
		%feature("autodoc", "	:rtype: None
") TDataStd_NamedData;
		 TDataStd_NamedData ();
};


%make_alias(TDataStd_NamedData)

%extend TDataStd_NamedData {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TDataStd_NoteBook;
class TDataStd_NoteBook : public TDF_Attribute {
	public:
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	* Tool to Create an Integer attribute from <value>, Insert it in a new son label of <self>. The Real attribute is returned.

	:param value:
	:type value: float
	:param isExported: default value is Standard_False
	:type isExported: bool
	:rtype: opencascade::handle<TDataStd_Real>
") Append;
		opencascade::handle<TDataStd_Real> Append (const Standard_Real value,const Standard_Boolean isExported = Standard_False);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	* Tool to Create an Real attribute from <value>, Insert it in a new son label of <self>. The Integer attribute is returned.

	:param value:
	:type value: int
	:param isExported: default value is Standard_False
	:type isExported: bool
	:rtype: opencascade::handle<TDataStd_Integer>
") Append;
		opencascade::handle<TDataStd_Integer> Append (const Standard_Integer value,const Standard_Boolean isExported = Standard_False);

        %feature("autodoc", "1");
        %extend{
            std::string DumpToString() {
            std::stringstream s;
            self->Dump(s);
            return s.str();}
        };
        		%feature("compactdefaultargs") Find;
		%feature("autodoc", "	* class methods ============= try to retrieve a NoteBook attribute at <current> label or in fathers label of <current>. Returns True if found and set <N>.

	:param current:
	:type current: TDF_Label &
	:param N:
	:type N: opencascade::handle<TDataStd_NoteBook> &
	:rtype: bool
") Find;
		static Standard_Boolean Find (const TDF_Label & current,opencascade::handle<TDataStd_NoteBook> & N);
		%feature("compactdefaultargs") GetID;
		%feature("autodoc", "	* NoteBook methods ===============

	:rtype: Standard_GUID
") GetID;
		static const Standard_GUID & GetID ();
		%feature("compactdefaultargs") ID;
		%feature("autodoc", "	:rtype: Standard_GUID
") ID;
		const Standard_GUID & ID ();
		%feature("compactdefaultargs") New;
		%feature("autodoc", "	* Create an enpty NoteBook attribute, located at <label>. Raises if <label> has attribute

	:param label:
	:type label: TDF_Label &
	:rtype: opencascade::handle<TDataStd_NoteBook>
") New;
		static opencascade::handle<TDataStd_NoteBook> New (const TDF_Label & label);
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "	:rtype: opencascade::handle<TDF_Attribute>
") NewEmpty;
		opencascade::handle<TDF_Attribute> NewEmpty ();
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	:param into:
	:type into: opencascade::handle<TDF_Attribute> &
	:param RT:
	:type RT: opencascade::handle<TDF_RelocationTable> &
	:rtype: None
") Paste;
		void Paste (const opencascade::handle<TDF_Attribute> & into,const opencascade::handle<TDF_RelocationTable> & RT);
		%feature("compactdefaultargs") Restore;
		%feature("autodoc", "	:param with:
	:type with: opencascade::handle<TDF_Attribute> &
	:rtype: None
") Restore;
		void Restore (const opencascade::handle<TDF_Attribute> & with);
		%feature("compactdefaultargs") TDataStd_NoteBook;
		%feature("autodoc", "	:rtype: None
") TDataStd_NoteBook;
		 TDataStd_NoteBook ();
};


%make_alias(TDataStd_NoteBook)

%extend TDataStd_NoteBook {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TDataStd_Real;
class TDataStd_Real : public TDF_Attribute {
	public:

        %feature("autodoc", "1");
        %extend{
            std::string DumpToString() {
            std::stringstream s;
            self->Dump(s);
            return s.str();}
        };
        		%feature("compactdefaultargs") Get;
		%feature("autodoc", "	* Returns the real number value contained in the attribute.

	:rtype: float
") Get;
		Standard_Real Get ();
		%feature("compactdefaultargs") GetDimension;
		%feature("autodoc", "	* Obsolete method that will be removed in next versions. This field is not supported in the persistence mechanism.

	:rtype: TDataStd_RealEnum
") GetDimension;
		TDataStd_RealEnum GetDimension ();
		%feature("compactdefaultargs") GetID;
		%feature("autodoc", "	* class methods ============= Returns the default GUID for real numbers.

	:rtype: Standard_GUID
") GetID;
		static const Standard_GUID & GetID ();
		%feature("compactdefaultargs") ID;
		%feature("autodoc", "	:rtype: Standard_GUID
") ID;
		const Standard_GUID & ID ();
		%feature("compactdefaultargs") IsCaptured;
		%feature("autodoc", "	* Returns True if there is a reference on the same label

	:rtype: bool
") IsCaptured;
		Standard_Boolean IsCaptured ();
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "	:rtype: opencascade::handle<TDF_Attribute>
") NewEmpty;
		opencascade::handle<TDF_Attribute> NewEmpty ();
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	:param Into:
	:type Into: opencascade::handle<TDF_Attribute> &
	:param RT:
	:type RT: opencascade::handle<TDF_RelocationTable> &
	:rtype: None
") Paste;
		void Paste (const opencascade::handle<TDF_Attribute> & Into,const opencascade::handle<TDF_RelocationTable> & RT);
		%feature("compactdefaultargs") Restore;
		%feature("autodoc", "	:param With:
	:type With: opencascade::handle<TDF_Attribute> &
	:rtype: None
") Restore;
		void Restore (const opencascade::handle<TDF_Attribute> & With);
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "	* Finds, or creates, a Real attribute with default GUID and sets <value>. The Real attribute is returned. The Real dimension is Scalar by default. Use SetDimension to overwrite. Real methods ============

	:param label:
	:type label: TDF_Label &
	:param value:
	:type value: float
	:rtype: opencascade::handle<TDataStd_Real>
") Set;
		static opencascade::handle<TDataStd_Real> Set (const TDF_Label & label,const Standard_Real value);
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "	* Finds, or creates, a Real attribute with explicit GUID and sets <value>. The Real attribute is returned. Real methods ============

	:param label:
	:type label: TDF_Label &
	:param guid:
	:type guid: Standard_GUID &
	:param value:
	:type value: float
	:rtype: opencascade::handle<TDataStd_Real>
") Set;
		static opencascade::handle<TDataStd_Real> Set (const TDF_Label & label,const Standard_GUID & guid,const Standard_Real value);
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "	* Sets the real number V.

	:param V:
	:type V: float
	:rtype: None
") Set;
		void Set (const Standard_Real V);
		%feature("compactdefaultargs") SetDimension;
		%feature("autodoc", "	* Obsolete method that will be removed in next versions. This field is not supported in the persistence mechanism.

	:param DIM:
	:type DIM: TDataStd_RealEnum
	:rtype: None
") SetDimension;
		void SetDimension (const TDataStd_RealEnum DIM);
		%feature("compactdefaultargs") SetID;
		%feature("autodoc", "	* Sets the explicit GUID for the attribute.

	:param guid:
	:type guid: Standard_GUID &
	:rtype: None
") SetID;
		void SetID (const Standard_GUID & guid);
		%feature("compactdefaultargs") SetID;
		%feature("autodoc", "	* Sets default GUID for the attribute.

	:rtype: None
") SetID;
		void SetID ();
		%feature("compactdefaultargs") TDataStd_Real;
		%feature("autodoc", "	:rtype: None
") TDataStd_Real;
		 TDataStd_Real ();
};


%make_alias(TDataStd_Real)

%extend TDataStd_Real {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TDataStd_RealArray;
class TDataStd_RealArray : public TDF_Attribute {
	public:
		%feature("compactdefaultargs") Array;
		%feature("autodoc", "	* Returns the handle of this array of reals.

	:rtype: opencascade::handle<TColStd_HArray1OfReal>
") Array;
		const opencascade::handle<TColStd_HArray1OfReal> & Array ();
		%feature("compactdefaultargs") ChangeArray;
		%feature("autodoc", "	* Sets the inner array <myValue> of the RealArray attribute to <newArray>. If value of <newArray> differs from <myValue>, Backup performed and myValue refers to new instance of HArray1OfReal that holds <newArray> values If <isCheckItems> equal True each item of <newArray> will be checked with each item of <myValue> for coincidence (to avoid backup).

	:param newArray:
	:type newArray: opencascade::handle<TColStd_HArray1OfReal> &
	:param isCheckItems: default value is Standard_True
	:type isCheckItems: bool
	:rtype: None
") ChangeArray;
		void ChangeArray (const opencascade::handle<TColStd_HArray1OfReal> & newArray,const Standard_Boolean isCheckItems = Standard_True);
		%feature("compactdefaultargs") DeltaOnModification;
		%feature("autodoc", "	* Makes a DeltaOnModification between <self> and <anOldAttribute>.

	:param anOldAttribute:
	:type anOldAttribute: opencascade::handle<TDF_Attribute> &
	:rtype: opencascade::handle<TDF_DeltaOnModification>
") DeltaOnModification;
		virtual opencascade::handle<TDF_DeltaOnModification> DeltaOnModification (const opencascade::handle<TDF_Attribute> & anOldAttribute);

        %feature("autodoc", "1");
        %extend{
            std::string DumpToString() {
            std::stringstream s;
            self->Dump(s);
            return s.str();}
        };
        		%feature("compactdefaultargs") GetDelta;
		%feature("autodoc", "	:rtype: bool
") GetDelta;
		Standard_Boolean GetDelta ();
		%feature("compactdefaultargs") GetID;
		%feature("autodoc", "	* class methods ============= Returns the GUID for arrays of reals.

	:rtype: Standard_GUID
") GetID;
		static const Standard_GUID & GetID ();
		%feature("compactdefaultargs") ID;
		%feature("autodoc", "	:rtype: Standard_GUID
") ID;
		const Standard_GUID & ID ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	* Initialize the inner array with bounds from <lower> to <upper>

	:param lower:
	:type lower: int
	:param upper:
	:type upper: int
	:rtype: None
") Init;
		void Init (const Standard_Integer lower,const Standard_Integer upper);
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "	* Returns the number of elements of the array of reals in terms of the number of elements it contains.

	:rtype: int
") Length;
		Standard_Integer Length ();
		%feature("compactdefaultargs") Lower;
		%feature("autodoc", "	* Returns the lower boundary of the array.

	:rtype: int
") Lower;
		Standard_Integer Lower ();
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "	:rtype: opencascade::handle<TDF_Attribute>
") NewEmpty;
		opencascade::handle<TDF_Attribute> NewEmpty ();
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	* Note. Uses inside ChangeArray() method

	:param Into:
	:type Into: opencascade::handle<TDF_Attribute> &
	:param RT:
	:type RT: opencascade::handle<TDF_RelocationTable> &
	:rtype: None
") Paste;
		void Paste (const opencascade::handle<TDF_Attribute> & Into,const opencascade::handle<TDF_RelocationTable> & RT);
		%feature("compactdefaultargs") Restore;
		%feature("autodoc", "	:param With:
	:type With: opencascade::handle<TDF_Attribute> &
	:rtype: None
") Restore;
		void Restore (const opencascade::handle<TDF_Attribute> & With);
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "	* Finds or creates on the <label> a real array attribute with the specified <lower> and <upper> boundaries. If <isDelta> == False, DefaultDeltaOnModification is used. If <isDelta> == True, DeltaOnModification of the current attribute is used. If attribute is already set, input parameter <isDelta> is refused and the found attribute returned.

	:param label:
	:type label: TDF_Label &
	:param lower:
	:type lower: int
	:param upper:
	:type upper: int
	:param isDelta: default value is Standard_False
	:type isDelta: bool
	:rtype: opencascade::handle<TDataStd_RealArray>
") Set;
		static opencascade::handle<TDataStd_RealArray> Set (const TDF_Label & label,const Standard_Integer lower,const Standard_Integer upper,const Standard_Boolean isDelta = Standard_False);
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "	* Finds, or creates, an RealArray attribute with explicit user defined <guid>. The RealArray attribute is returned.

	:param label:
	:type label: TDF_Label &
	:param theGuid:
	:type theGuid: Standard_GUID &
	:param lower:
	:type lower: int
	:param upper:
	:type upper: int
	:param isDelta: default value is Standard_False
	:type isDelta: bool
	:rtype: opencascade::handle<TDataStd_RealArray>
") Set;
		static opencascade::handle<TDataStd_RealArray> Set (const TDF_Label & label,const Standard_GUID & theGuid,const Standard_Integer lower,const Standard_Integer upper,const Standard_Boolean isDelta = Standard_False);
		%feature("compactdefaultargs") SetDelta;
		%feature("autodoc", "	* for internal use only!

	:param isDelta:
	:type isDelta: bool
	:rtype: None
") SetDelta;
		void SetDelta (const Standard_Boolean isDelta);
		%feature("compactdefaultargs") SetID;
		%feature("autodoc", "	* Sets the explicit GUID (user defined) for the attribute.

	:param theGuid:
	:type theGuid: Standard_GUID &
	:rtype: None
") SetID;
		void SetID (const Standard_GUID & theGuid);
		%feature("compactdefaultargs") SetID;
		%feature("autodoc", "	* Sets default GUID for the attribute.

	:rtype: None
") SetID;
		void SetID ();
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	* Sets the <Index>th element of the array to <Value> OutOfRange exception is raised if <Index> doesn't respect Lower and Upper bounds of the internal array.

	:param Index:
	:type Index: int
	:param Value:
	:type Value: float
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const Standard_Real Value);
		%feature("compactdefaultargs") TDataStd_RealArray;
		%feature("autodoc", "	:rtype: None
") TDataStd_RealArray;
		 TDataStd_RealArray ();
		%feature("compactdefaultargs") Upper;
		%feature("autodoc", "	* Returns the upper boundary of the array.

	:rtype: int
") Upper;
		Standard_Integer Upper ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	* Return the value of the <Index>th element of the array

	:param Index:
	:type Index: int
	:rtype: float
") Value;
		Standard_Real Value (const Standard_Integer Index);
};


%make_alias(TDataStd_RealArray)

%extend TDataStd_RealArray {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TDataStd_RealList;
class TDataStd_RealList : public TDF_Attribute {
	public:
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param value:
	:type value: float
	:rtype: None
") Append;
		void Append (const Standard_Real value);
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();

        %feature("autodoc", "1");
        %extend{
            std::string DumpToString() {
            std::stringstream s;
            self->Dump(s);
            return s.str();}
        };
        		%feature("compactdefaultargs") Extent;
		%feature("autodoc", "	:rtype: int
") Extent;
		Standard_Integer Extent ();
		%feature("compactdefaultargs") First;
		%feature("autodoc", "	:rtype: float
") First;
		Standard_Real First ();
		%feature("compactdefaultargs") GetID;
		%feature("autodoc", "	* Static methods ============== Returns the ID of the list of doubles attribute.

	:rtype: Standard_GUID
") GetID;
		static const Standard_GUID & GetID ();
		%feature("compactdefaultargs") ID;
		%feature("autodoc", "	:rtype: Standard_GUID
") ID;
		const Standard_GUID & ID ();
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	* Inserts the <value> after the first meet of <after_value>.

	:param value:
	:type value: float
	:param after_value:
	:type after_value: float
	:rtype: bool
") InsertAfter;
		Standard_Boolean InsertAfter (const Standard_Real value,const Standard_Real after_value);
		%feature("compactdefaultargs") InsertAfterByIndex;
		%feature("autodoc", "	* Inserts the <value> after the <index> position. The indices start with 1 .. Extent().

	:param index:
	:type index: int
	:param after_value:
	:type after_value: float
	:rtype: bool
") InsertAfterByIndex;
		Standard_Boolean InsertAfterByIndex (const Standard_Integer index,const Standard_Real after_value);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	* Inserts the <value> before the first meet of <before_value>.

	:param value:
	:type value: float
	:param before_value:
	:type before_value: float
	:rtype: bool
") InsertBefore;
		Standard_Boolean InsertBefore (const Standard_Real value,const Standard_Real before_value);
		%feature("compactdefaultargs") InsertBeforeByIndex;
		%feature("autodoc", "	* Inserts the <value> before the <index> position. The indices start with 1 .. Extent().

	:param index:
	:type index: int
	:param before_value:
	:type before_value: float
	:rtype: bool
") InsertBeforeByIndex;
		Standard_Boolean InsertBeforeByIndex (const Standard_Integer index,const Standard_Real before_value);
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "	:rtype: bool
") IsEmpty;
		Standard_Boolean IsEmpty ();
		%feature("compactdefaultargs") Last;
		%feature("autodoc", "	:rtype: float
") Last;
		Standard_Real Last ();
		%feature("compactdefaultargs") List;
		%feature("autodoc", "	:rtype: TColStd_ListOfReal
") List;
		const TColStd_ListOfReal & List ();
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "	:rtype: opencascade::handle<TDF_Attribute>
") NewEmpty;
		opencascade::handle<TDF_Attribute> NewEmpty ();
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	:param Into:
	:type Into: opencascade::handle<TDF_Attribute> &
	:param RT:
	:type RT: opencascade::handle<TDF_RelocationTable> &
	:rtype: None
") Paste;
		void Paste (const opencascade::handle<TDF_Attribute> & Into,const opencascade::handle<TDF_RelocationTable> & RT);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param value:
	:type value: float
	:rtype: None
") Prepend;
		void Prepend (const Standard_Real value);
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	* Removes the first meet of the <value>.

	:param value:
	:type value: float
	:rtype: bool
") Remove;
		Standard_Boolean Remove (const Standard_Real value);
		%feature("compactdefaultargs") RemoveByIndex;
		%feature("autodoc", "	* Removes a value at <index> position.

	:param index:
	:type index: int
	:rtype: bool
") RemoveByIndex;
		Standard_Boolean RemoveByIndex (const Standard_Integer index);
		%feature("compactdefaultargs") Restore;
		%feature("autodoc", "	:param With:
	:type With: opencascade::handle<TDF_Attribute> &
	:rtype: None
") Restore;
		void Restore (const opencascade::handle<TDF_Attribute> & With);
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "	* Finds or creates a list of double values attribute.

	:param label:
	:type label: TDF_Label &
	:rtype: opencascade::handle<TDataStd_RealList>
") Set;
		static opencascade::handle<TDataStd_RealList> Set (const TDF_Label & label);
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "	* Finds or creates a list of double values attribute with explicit user defined <guid>.

	:param label:
	:type label: TDF_Label &
	:param theGuid:
	:type theGuid: Standard_GUID &
	:rtype: opencascade::handle<TDataStd_RealList>
") Set;
		static opencascade::handle<TDataStd_RealList> Set (const TDF_Label & label,const Standard_GUID & theGuid);
		%feature("compactdefaultargs") SetID;
		%feature("autodoc", "	* Sets the explicit GUID (user defined) for the attribute.

	:param theGuid:
	:type theGuid: Standard_GUID &
	:rtype: None
") SetID;
		void SetID (const Standard_GUID & theGuid);
		%feature("compactdefaultargs") SetID;
		%feature("autodoc", "	* Sets default GUID for the attribute.

	:rtype: None
") SetID;
		void SetID ();
		%feature("compactdefaultargs") TDataStd_RealList;
		%feature("autodoc", "	:rtype: None
") TDataStd_RealList;
		 TDataStd_RealList ();
};


%make_alias(TDataStd_RealList)

%extend TDataStd_RealList {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TDataStd_ReferenceArray;
class TDataStd_ReferenceArray : public TDF_Attribute {
	public:

        %feature("autodoc", "1");
        %extend{
            std::string DumpToString() {
            std::stringstream s;
            self->Dump(s);
            return s.str();}
        };
        		%feature("compactdefaultargs") GetID;
		%feature("autodoc", "	* Static methods ============== Returns the ID of the array of references (labels) attribute.

	:rtype: Standard_GUID
") GetID;
		static const Standard_GUID & GetID ();
		%feature("compactdefaultargs") ID;
		%feature("autodoc", "	:rtype: Standard_GUID
") ID;
		const Standard_GUID & ID ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	* Initialize the inner array with bounds from <lower> to <upper>

	:param lower:
	:type lower: int
	:param upper:
	:type upper: int
	:rtype: None
") Init;
		void Init (const Standard_Integer lower,const Standard_Integer upper);
		%feature("compactdefaultargs") InternalArray;
		%feature("autodoc", "	:rtype: opencascade::handle<TDataStd_HLabelArray1>
") InternalArray;
		const opencascade::handle<TDataStd_HLabelArray1> & InternalArray ();
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "	* Returns the number of elements in the array.

	:rtype: int
") Length;
		Standard_Integer Length ();
		%feature("compactdefaultargs") Lower;
		%feature("autodoc", "	* Returns the lower boundary of the array.

	:rtype: int
") Lower;
		Standard_Integer Lower ();
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "	:rtype: opencascade::handle<TDF_Attribute>
") NewEmpty;
		opencascade::handle<TDF_Attribute> NewEmpty ();
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	:param Into:
	:type Into: opencascade::handle<TDF_Attribute> &
	:param RT:
	:type RT: opencascade::handle<TDF_RelocationTable> &
	:rtype: None
") Paste;
		void Paste (const opencascade::handle<TDF_Attribute> & Into,const opencascade::handle<TDF_RelocationTable> & RT);
		%feature("compactdefaultargs") References;
		%feature("autodoc", "	:param DS:
	:type DS: opencascade::handle<TDF_DataSet> &
	:rtype: void
") References;
		virtual void References (const opencascade::handle<TDF_DataSet> & DS);
		%feature("compactdefaultargs") Restore;
		%feature("autodoc", "	:param With:
	:type With: opencascade::handle<TDF_Attribute> &
	:rtype: None
") Restore;
		void Restore (const opencascade::handle<TDF_Attribute> & With);
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "	* Finds or creates an array of reference values (labels) attribute.

	:param label:
	:type label: TDF_Label &
	:param lower:
	:type lower: int
	:param upper:
	:type upper: int
	:rtype: opencascade::handle<TDataStd_ReferenceArray>
") Set;
		static opencascade::handle<TDataStd_ReferenceArray> Set (const TDF_Label & label,const Standard_Integer lower,const Standard_Integer upper);
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "	* Finds or creates an array of reference values (labels) attribute with explicit user defined <guid>.

	:param label:
	:type label: TDF_Label &
	:param theGuid:
	:type theGuid: Standard_GUID &
	:param lower:
	:type lower: int
	:param upper:
	:type upper: int
	:rtype: opencascade::handle<TDataStd_ReferenceArray>
") Set;
		static opencascade::handle<TDataStd_ReferenceArray> Set (const TDF_Label & label,const Standard_GUID & theGuid,const Standard_Integer lower,const Standard_Integer upper);
		%feature("compactdefaultargs") SetID;
		%feature("autodoc", "	* Sets the explicit GUID (user defined) for the attribute.

	:param theGuid:
	:type theGuid: Standard_GUID &
	:rtype: None
") SetID;
		void SetID (const Standard_GUID & theGuid);
		%feature("compactdefaultargs") SetID;
		%feature("autodoc", "	* Sets default GUID for the attribute.

	:rtype: None
") SetID;
		void SetID ();
		%feature("compactdefaultargs") SetInternalArray;
		%feature("autodoc", "	:param values:
	:type values: opencascade::handle<TDataStd_HLabelArray1> &
	:param isCheckItems: default value is Standard_True
	:type isCheckItems: bool
	:rtype: None
") SetInternalArray;
		void SetInternalArray (const opencascade::handle<TDataStd_HLabelArray1> & values,const Standard_Boolean isCheckItems = Standard_True);
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	* Sets the <Index>th element of the array to <Value> OutOfRange exception is raised if <Index> doesn't respect Lower and Upper bounds of the internal array.

	:param index:
	:type index: int
	:param value:
	:type value: TDF_Label &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer index,const TDF_Label & value);
		%feature("compactdefaultargs") TDataStd_ReferenceArray;
		%feature("autodoc", "	:rtype: None
") TDataStd_ReferenceArray;
		 TDataStd_ReferenceArray ();
		%feature("compactdefaultargs") Upper;
		%feature("autodoc", "	* Returns the upper boundary of the array.

	:rtype: int
") Upper;
		Standard_Integer Upper ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	* Returns the value of the <Index>th element of the array.

	:param Index:
	:type Index: int
	:rtype: TDF_Label
") Value;
		TDF_Label Value (const Standard_Integer Index);
};


%make_alias(TDataStd_ReferenceArray)

%extend TDataStd_ReferenceArray {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TDataStd_ReferenceList;
class TDataStd_ReferenceList : public TDF_Attribute {
	public:
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param value:
	:type value: TDF_Label &
	:rtype: None
") Append;
		void Append (const TDF_Label & value);
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();

        %feature("autodoc", "1");
        %extend{
            std::string DumpToString() {
            std::stringstream s;
            self->Dump(s);
            return s.str();}
        };
        		%feature("compactdefaultargs") Extent;
		%feature("autodoc", "	:rtype: int
") Extent;
		Standard_Integer Extent ();
		%feature("compactdefaultargs") First;
		%feature("autodoc", "	:rtype: TDF_Label
") First;
		const TDF_Label & First ();
		%feature("compactdefaultargs") GetID;
		%feature("autodoc", "	* Static methods ============== Returns the ID of the list of references (labels) attribute.

	:rtype: Standard_GUID
") GetID;
		static const Standard_GUID & GetID ();
		%feature("compactdefaultargs") ID;
		%feature("autodoc", "	:rtype: Standard_GUID
") ID;
		const Standard_GUID & ID ();
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	* Inserts the <value> after the first meet of <after_value>.

	:param value:
	:type value: TDF_Label &
	:param after_value:
	:type after_value: TDF_Label &
	:rtype: bool
") InsertAfter;
		Standard_Boolean InsertAfter (const TDF_Label & value,const TDF_Label & after_value);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	* Inserts the label after the <index> position. The indices start with 1 .. Extent().

	:param index:
	:type index: int
	:param after_value:
	:type after_value: TDF_Label &
	:rtype: bool
") InsertAfter;
		Standard_Boolean InsertAfter (const Standard_Integer index,const TDF_Label & after_value);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	* Inserts the <value> before the first meet of <before_value>.

	:param value:
	:type value: TDF_Label &
	:param before_value:
	:type before_value: TDF_Label &
	:rtype: bool
") InsertBefore;
		Standard_Boolean InsertBefore (const TDF_Label & value,const TDF_Label & before_value);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	* Inserts the label before the <index> position. The indices start with 1 .. Extent().

	:param index:
	:type index: int
	:param before_value:
	:type before_value: TDF_Label &
	:rtype: bool
") InsertBefore;
		Standard_Boolean InsertBefore (const Standard_Integer index,const TDF_Label & before_value);
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "	:rtype: bool
") IsEmpty;
		Standard_Boolean IsEmpty ();
		%feature("compactdefaultargs") Last;
		%feature("autodoc", "	:rtype: TDF_Label
") Last;
		const TDF_Label & Last ();
		%feature("compactdefaultargs") List;
		%feature("autodoc", "	:rtype: TDF_LabelList
") List;
		const TDF_LabelList & List ();
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "	:rtype: opencascade::handle<TDF_Attribute>
") NewEmpty;
		opencascade::handle<TDF_Attribute> NewEmpty ();
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	:param Into:
	:type Into: opencascade::handle<TDF_Attribute> &
	:param RT:
	:type RT: opencascade::handle<TDF_RelocationTable> &
	:rtype: None
") Paste;
		void Paste (const opencascade::handle<TDF_Attribute> & Into,const opencascade::handle<TDF_RelocationTable> & RT);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param value:
	:type value: TDF_Label &
	:rtype: None
") Prepend;
		void Prepend (const TDF_Label & value);
		%feature("compactdefaultargs") References;
		%feature("autodoc", "	:param DS:
	:type DS: opencascade::handle<TDF_DataSet> &
	:rtype: void
") References;
		virtual void References (const opencascade::handle<TDF_DataSet> & DS);
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	* Removes the first meet of the <value>.

	:param value:
	:type value: TDF_Label &
	:rtype: bool
") Remove;
		Standard_Boolean Remove (const TDF_Label & value);
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	* Removes a label at 'index' position.

	:param index:
	:type index: int
	:rtype: bool
") Remove;
		Standard_Boolean Remove (const Standard_Integer index);
		%feature("compactdefaultargs") Restore;
		%feature("autodoc", "	:param With:
	:type With: opencascade::handle<TDF_Attribute> &
	:rtype: None
") Restore;
		void Restore (const opencascade::handle<TDF_Attribute> & With);
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "	* Finds or creates a list of reference values (labels) attribute.

	:param label:
	:type label: TDF_Label &
	:rtype: opencascade::handle<TDataStd_ReferenceList>
") Set;
		static opencascade::handle<TDataStd_ReferenceList> Set (const TDF_Label & label);
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "	* Finds or creates a list of reference values (labels) attribute with explicit user defined <guid>.

	:param label:
	:type label: TDF_Label &
	:param theGuid:
	:type theGuid: Standard_GUID &
	:rtype: opencascade::handle<TDataStd_ReferenceList>
") Set;
		static opencascade::handle<TDataStd_ReferenceList> Set (const TDF_Label & label,const Standard_GUID & theGuid);
		%feature("compactdefaultargs") SetID;
		%feature("autodoc", "	* Sets the explicit GUID (user defined) for the attribute.

	:param theGuid:
	:type theGuid: Standard_GUID &
	:rtype: None
") SetID;
		void SetID (const Standard_GUID & theGuid);
		%feature("compactdefaultargs") SetID;
		%feature("autodoc", "	* Sets default GUID for the attribute.

	:rtype: None
") SetID;
		void SetID ();
		%feature("compactdefaultargs") TDataStd_ReferenceList;
		%feature("autodoc", "	:rtype: None
") TDataStd_ReferenceList;
		 TDataStd_ReferenceList ();
};


%make_alias(TDataStd_ReferenceList)

%extend TDataStd_ReferenceList {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TDataStd_Relation;
class TDataStd_Relation : public TDF_Attribute {
	public:

        %feature("autodoc", "1");
        %extend{
            std::string DumpToString() {
            std::stringstream s;
            self->Dump(s);
            return s.str();}
        };
        		%feature("compactdefaultargs") GetID;
		%feature("autodoc", "	* class methods =============

	:rtype: Standard_GUID
") GetID;
		static const Standard_GUID & GetID ();
		%feature("compactdefaultargs") GetRelation;
		%feature("autodoc", "	:rtype: TCollection_ExtendedString
") GetRelation;
		const TCollection_ExtendedString & GetRelation ();
		%feature("compactdefaultargs") GetVariables;
		%feature("autodoc", "	:rtype: TDF_AttributeList
") GetVariables;
		TDF_AttributeList & GetVariables ();
		%feature("compactdefaultargs") ID;
		%feature("autodoc", "	:rtype: Standard_GUID
") ID;
		const Standard_GUID & ID ();
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "	* build and return the relation name

	:rtype: TCollection_ExtendedString
") Name;
		TCollection_ExtendedString Name ();
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "	:rtype: opencascade::handle<TDF_Attribute>
") NewEmpty;
		opencascade::handle<TDF_Attribute> NewEmpty ();
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	:param Into:
	:type Into: opencascade::handle<TDF_Attribute> &
	:param RT:
	:type RT: opencascade::handle<TDF_RelocationTable> &
	:rtype: None
") Paste;
		void Paste (const opencascade::handle<TDF_Attribute> & Into,const opencascade::handle<TDF_RelocationTable> & RT);
		%feature("compactdefaultargs") Restore;
		%feature("autodoc", "	:param With:
	:type With: opencascade::handle<TDF_Attribute> &
	:rtype: None
") Restore;
		void Restore (const opencascade::handle<TDF_Attribute> & With);
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "	* Find, or create, an Relation attribute. Real methods ============

	:param label:
	:type label: TDF_Label &
	:rtype: opencascade::handle<TDataStd_Relation>
") Set;
		static opencascade::handle<TDataStd_Relation> Set (const TDF_Label & label);
		%feature("compactdefaultargs") SetRelation;
		%feature("autodoc", "	:param E:
	:type E: TCollection_ExtendedString &
	:rtype: None
") SetRelation;
		void SetRelation (const TCollection_ExtendedString & E);
		%feature("compactdefaultargs") TDataStd_Relation;
		%feature("autodoc", "	:rtype: None
") TDataStd_Relation;
		 TDataStd_Relation ();
};


%make_alias(TDataStd_Relation)

%extend TDataStd_Relation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TDataStd_Tick;
class TDataStd_Tick : public TDF_Attribute {
	public:

        %feature("autodoc", "1");
        %extend{
            std::string DumpToString() {
            std::stringstream s;
            self->Dump(s);
            return s.str();}
        };
        		%feature("compactdefaultargs") GetID;
		%feature("autodoc", "	* Static methods ==============

	:rtype: Standard_GUID
") GetID;
		static const Standard_GUID & GetID ();
		%feature("compactdefaultargs") ID;
		%feature("autodoc", "	:rtype: Standard_GUID
") ID;
		const Standard_GUID & ID ();
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "	:rtype: opencascade::handle<TDF_Attribute>
") NewEmpty;
		opencascade::handle<TDF_Attribute> NewEmpty ();
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	:param Into:
	:type Into: opencascade::handle<TDF_Attribute> &
	:param RT:
	:type RT: opencascade::handle<TDF_RelocationTable> &
	:rtype: None
") Paste;
		void Paste (const opencascade::handle<TDF_Attribute> & Into,const opencascade::handle<TDF_RelocationTable> & RT);
		%feature("compactdefaultargs") Restore;
		%feature("autodoc", "	:param With:
	:type With: opencascade::handle<TDF_Attribute> &
	:rtype: None
") Restore;
		void Restore (const opencascade::handle<TDF_Attribute> & With);
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "	* Find, or create, a Tick attribute. Tick methods ============

	:param label:
	:type label: TDF_Label &
	:rtype: opencascade::handle<TDataStd_Tick>
") Set;
		static opencascade::handle<TDataStd_Tick> Set (const TDF_Label & label);
		%feature("compactdefaultargs") TDataStd_Tick;
		%feature("autodoc", "	:rtype: None
") TDataStd_Tick;
		 TDataStd_Tick ();
};


%make_alias(TDataStd_Tick)

%extend TDataStd_Tick {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TDataStd_TreeNode;
class TDataStd_TreeNode : public TDF_Attribute {
	public:
		%feature("compactdefaultargs") AfterAddition;
		%feature("autodoc", "	* Connect the TreeNode to its father child list

	:rtype: void
") AfterAddition;
		virtual void AfterAddition ();
		%feature("compactdefaultargs") AfterResume;
		%feature("autodoc", "	* Reconnect the TreeNode to its father child list.

	:rtype: void
") AfterResume;
		virtual void AfterResume ();
		%feature("compactdefaultargs") AfterUndo;
		%feature("autodoc", "	* Reconnect the TreeNode, if necessary. Implementation of Attribute methods: ===================================

	:param anAttDelta:
	:type anAttDelta: opencascade::handle<TDF_AttributeDelta> &
	:param forceIt: default value is Standard_False
	:type forceIt: bool
	:rtype: bool
") AfterUndo;
		virtual Standard_Boolean AfterUndo (const opencascade::handle<TDF_AttributeDelta> & anAttDelta,const Standard_Boolean forceIt = Standard_False);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	* Insert the TreeNode <Child> as last child of <self>. If the insertion is successful <self> becomes the Father of <Child>.

	:param Child:
	:type Child: opencascade::handle<TDataStd_TreeNode> &
	:rtype: bool
") Append;
		Standard_Boolean Append (const opencascade::handle<TDataStd_TreeNode> & Child);
		%feature("compactdefaultargs") BeforeForget;
		%feature("autodoc", "	* Disconnect the TreeNode from its Father child list

	:rtype: void
") BeforeForget;
		virtual void BeforeForget ();
		%feature("compactdefaultargs") BeforeUndo;
		%feature("autodoc", "	* Disconnect the TreeNode, if necessary.

	:param anAttDelta:
	:type anAttDelta: opencascade::handle<TDF_AttributeDelta> &
	:param forceIt: default value is Standard_False
	:type forceIt: bool
	:rtype: bool
") BeforeUndo;
		virtual Standard_Boolean BeforeUndo (const opencascade::handle<TDF_AttributeDelta> & anAttDelta,const Standard_Boolean forceIt = Standard_False);
		%feature("compactdefaultargs") Depth;
		%feature("autodoc", "	* Returns the depth of this tree node in the overall tree node structure. In other words, the number of father tree nodes of this one is returned.

	:rtype: int
") Depth;
		Standard_Integer Depth ();

        %feature("autodoc", "1");
        %extend{
            std::string DumpToString() {
            std::stringstream s;
            self->Dump(s);
            return s.str();}
        };
        		%feature("compactdefaultargs") Father;
		%feature("autodoc", "	* Returns the father TreeNode of <self>. Null if root.

	:rtype: opencascade::handle<TDataStd_TreeNode>
") Father;
		opencascade::handle<TDataStd_TreeNode> Father ();
		%feature("compactdefaultargs") Find;
		%feature("autodoc", "	* class methods working on the node =================================== Returns true if the tree node T is found on the label L. Otherwise, false is returned.

	:param L:
	:type L: TDF_Label &
	:param T:
	:type T: opencascade::handle<TDataStd_TreeNode> &
	:rtype: bool
") Find;
		static Standard_Boolean Find (const TDF_Label & L,opencascade::handle<TDataStd_TreeNode> & T);
		%feature("compactdefaultargs") FindLast;
		%feature("autodoc", "	* Returns the last child tree node in this tree node object. to set fields =============

	:rtype: opencascade::handle<TDataStd_TreeNode>
") FindLast;
		opencascade::handle<TDataStd_TreeNode> FindLast ();
		%feature("compactdefaultargs") First;
		%feature("autodoc", "	* Returns the first child tree node in this tree node object.

	:rtype: opencascade::handle<TDataStd_TreeNode>
") First;
		opencascade::handle<TDataStd_TreeNode> First ();
		%feature("compactdefaultargs") GetDefaultTreeID;
		%feature("autodoc", "	* returns a default tree ID. this ID is used by the <Set> method without explicit tree ID. Instance methods: ================

	:rtype: Standard_GUID
") GetDefaultTreeID;
		static const Standard_GUID & GetDefaultTreeID ();
		%feature("compactdefaultargs") HasFather;
		%feature("autodoc", "	* Returns true if this tree node attribute has a father tree node.

	:rtype: bool
") HasFather;
		Standard_Boolean HasFather ();
		%feature("compactdefaultargs") HasFirst;
		%feature("autodoc", "	* Returns true if this tree node attribute has a first child tree node.

	:rtype: bool
") HasFirst;
		Standard_Boolean HasFirst ();
		%feature("compactdefaultargs") HasLast;
		%feature("autodoc", "	* Returns true if this tree node attribute has a last child tree node.

	:rtype: bool
") HasLast;
		Standard_Boolean HasLast ();
		%feature("compactdefaultargs") HasNext;
		%feature("autodoc", "	* Returns true if this tree node attribute has a next tree node.

	:rtype: bool
") HasNext;
		Standard_Boolean HasNext ();
		%feature("compactdefaultargs") HasPrevious;
		%feature("autodoc", "	* Returns true if this tree node attribute has a previous tree node.

	:rtype: bool
") HasPrevious;
		Standard_Boolean HasPrevious ();
		%feature("compactdefaultargs") ID;
		%feature("autodoc", "	* Returns the tree ID (default or explicit one depending onthe Set method used).

	:rtype: Standard_GUID
") ID;
		const Standard_GUID & ID ();
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	* Inserts the TreeNode <Node> after <self>. If insertion is successful <self> and <Node> belongs to the same Father.

	:param Node:
	:type Node: opencascade::handle<TDataStd_TreeNode> &
	:rtype: bool
") InsertAfter;
		Standard_Boolean InsertAfter (const opencascade::handle<TDataStd_TreeNode> & Node);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	* Inserts the TreeNode <Node> before <self>. If insertion is successful <self> and <Node> belongs to the same Father.

	:param Node:
	:type Node: opencascade::handle<TDataStd_TreeNode> &
	:rtype: bool
") InsertBefore;
		Standard_Boolean InsertBefore (const opencascade::handle<TDataStd_TreeNode> & Node);
		%feature("compactdefaultargs") IsAscendant;
		%feature("autodoc", "	* Returns true if this tree node attribute is an ascendant of of. In other words, if it is a father or the father of a father of of.

	:param of:
	:type of: opencascade::handle<TDataStd_TreeNode> &
	:rtype: bool
") IsAscendant;
		Standard_Boolean IsAscendant (const opencascade::handle<TDataStd_TreeNode> & of);
		%feature("compactdefaultargs") IsChild;
		%feature("autodoc", "	* Returns true if this tree node attribute is a child of of.

	:param of:
	:type of: opencascade::handle<TDataStd_TreeNode> &
	:rtype: bool
") IsChild;
		Standard_Boolean IsChild (const opencascade::handle<TDataStd_TreeNode> & of);
		%feature("compactdefaultargs") IsDescendant;
		%feature("autodoc", "	* Returns true if this tree node attribute is a descendant of of. In other words, if it is a child or the child of a child of of.

	:param of:
	:type of: opencascade::handle<TDataStd_TreeNode> &
	:rtype: bool
") IsDescendant;
		Standard_Boolean IsDescendant (const opencascade::handle<TDataStd_TreeNode> & of);
		%feature("compactdefaultargs") IsFather;
		%feature("autodoc", "	* Returns true if this tree node attribute is a father of of.

	:param of:
	:type of: opencascade::handle<TDataStd_TreeNode> &
	:rtype: bool
") IsFather;
		Standard_Boolean IsFather (const opencascade::handle<TDataStd_TreeNode> & of);
		%feature("compactdefaultargs") IsRoot;
		%feature("autodoc", "	* Returns true if this tree node attribute is the ultimate father in the tree.

	:rtype: bool
") IsRoot;
		Standard_Boolean IsRoot ();
		%feature("compactdefaultargs") Last;
		%feature("autodoc", "	* Returns the last child tree node in this tree node object.

	:rtype: opencascade::handle<TDataStd_TreeNode>
") Last;
		opencascade::handle<TDataStd_TreeNode> Last ();
		%feature("compactdefaultargs") NbChildren;
		%feature("autodoc", "	* Returns the number of child nodes. If <allLevels> is true, the method counts children of all levels (children of children ...)

	:param allLevels: default value is Standard_False
	:type allLevels: bool
	:rtype: int
") NbChildren;
		Standard_Integer NbChildren (const Standard_Boolean allLevels = Standard_False);
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "	:rtype: opencascade::handle<TDF_Attribute>
") NewEmpty;
		virtual opencascade::handle<TDF_Attribute> NewEmpty ();
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "	* Returns the next tree node in this tree node attribute. Warning This tree node is null if it is the last one in this tree node attribute.Returns the next TreeNode of <self>. Null if last.

	:rtype: opencascade::handle<TDataStd_TreeNode>
") Next;
		opencascade::handle<TDataStd_TreeNode> Next ();
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	:param into:
	:type into: opencascade::handle<TDF_Attribute> &
	:param RT:
	:type RT: opencascade::handle<TDF_RelocationTable> &
	:rtype: void
") Paste;
		virtual void Paste (const opencascade::handle<TDF_Attribute> & into,const opencascade::handle<TDF_RelocationTable> & RT);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	* Insert the the TreeNode <Child> as first child of <self>. If the insertion is successful <self> becomes the Father of <Child>

	:param Child:
	:type Child: opencascade::handle<TDataStd_TreeNode> &
	:rtype: bool
") Prepend;
		Standard_Boolean Prepend (const opencascade::handle<TDataStd_TreeNode> & Child);
		%feature("compactdefaultargs") Previous;
		%feature("autodoc", "	* Returns the previous tree node of this tree node attribute. Warning This tree node is null if it is the first one in this tree node attribute.

	:rtype: opencascade::handle<TDataStd_TreeNode>
") Previous;
		opencascade::handle<TDataStd_TreeNode> Previous ();
		%feature("compactdefaultargs") References;
		%feature("autodoc", "	:param aDataSet:
	:type aDataSet: opencascade::handle<TDF_DataSet> &
	:rtype: void
") References;
		virtual void References (const opencascade::handle<TDF_DataSet> & aDataSet);
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	* Removes this tree node attribute from its father node. The result is that this attribute becomes a root node.

	:rtype: bool
") Remove;
		Standard_Boolean Remove ();
		%feature("compactdefaultargs") Restore;
		%feature("autodoc", "	:param with:
	:type with: opencascade::handle<TDF_Attribute> &
	:rtype: void
") Restore;
		virtual void Restore (const opencascade::handle<TDF_Attribute> & with);
		%feature("compactdefaultargs") Root;
		%feature("autodoc", "	* Returns the ultimate father of this tree node attribute.

	:rtype: opencascade::handle<TDataStd_TreeNode>
") Root;
		opencascade::handle<TDataStd_TreeNode> Root ();
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "	* Finds or Creates a TreeNode attribute on the label <L> with the default tree ID, returned by the method <GetDefaultTreeID>. Returns the created/found TreeNode attribute.

	:param L:
	:type L: TDF_Label &
	:rtype: opencascade::handle<TDataStd_TreeNode>
") Set;
		static opencascade::handle<TDataStd_TreeNode> Set (const TDF_Label & L);
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "	* Finds or Creates a TreeNode attribute on the label <L>, with an explicit tree ID. <ExplicitTreeID> is the ID returned by <TDF_Attribute::ID> method. Returns the found/created TreeNode attribute.

	:param L:
	:type L: TDF_Label &
	:param ExplicitTreeID:
	:type ExplicitTreeID: Standard_GUID &
	:rtype: opencascade::handle<TDataStd_TreeNode>
") Set;
		static opencascade::handle<TDataStd_TreeNode> Set (const TDF_Label & L,const Standard_GUID & ExplicitTreeID);
		%feature("compactdefaultargs") SetFather;
		%feature("autodoc", "	:param F:
	:type F: opencascade::handle<TDataStd_TreeNode> &
	:rtype: None
") SetFather;
		void SetFather (const opencascade::handle<TDataStd_TreeNode> & F);
		%feature("compactdefaultargs") SetFirst;
		%feature("autodoc", "	:param F:
	:type F: opencascade::handle<TDataStd_TreeNode> &
	:rtype: None
") SetFirst;
		void SetFirst (const opencascade::handle<TDataStd_TreeNode> & F);
		%feature("compactdefaultargs") SetLast;
		%feature("autodoc", "	* TreeNode callback: ==================

	:param F:
	:type F: opencascade::handle<TDataStd_TreeNode> &
	:rtype: None
") SetLast;
		void SetLast (const opencascade::handle<TDataStd_TreeNode> & F);
		%feature("compactdefaultargs") SetNext;
		%feature("autodoc", "	:param F:
	:type F: opencascade::handle<TDataStd_TreeNode> &
	:rtype: None
") SetNext;
		void SetNext (const opencascade::handle<TDataStd_TreeNode> & F);
		%feature("compactdefaultargs") SetPrevious;
		%feature("autodoc", "	:param F:
	:type F: opencascade::handle<TDataStd_TreeNode> &
	:rtype: None
") SetPrevious;
		void SetPrevious (const opencascade::handle<TDataStd_TreeNode> & F);
		%feature("compactdefaultargs") SetTreeID;
		%feature("autodoc", "	:param explicitID:
	:type explicitID: Standard_GUID &
	:rtype: None
") SetTreeID;
		void SetTreeID (const Standard_GUID & explicitID);
		%feature("compactdefaultargs") TDataStd_TreeNode;
		%feature("autodoc", "	:rtype: None
") TDataStd_TreeNode;
		 TDataStd_TreeNode ();
};


%make_alias(TDataStd_TreeNode)

%extend TDataStd_TreeNode {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TDataStd_UAttribute;
class TDataStd_UAttribute : public TDF_Attribute {
	public:

        %feature("autodoc", "1");
        %extend{
            std::string DumpToString() {
            std::stringstream s;
            self->Dump(s);
            return s.str();}
        };
        		%feature("compactdefaultargs") ID;
		%feature("autodoc", "	:rtype: Standard_GUID
") ID;
		const Standard_GUID & ID ();
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "	:rtype: opencascade::handle<TDF_Attribute>
") NewEmpty;
		opencascade::handle<TDF_Attribute> NewEmpty ();
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	:param into:
	:type into: opencascade::handle<TDF_Attribute> &
	:param RT:
	:type RT: opencascade::handle<TDF_RelocationTable> &
	:rtype: None
") Paste;
		void Paste (const opencascade::handle<TDF_Attribute> & into,const opencascade::handle<TDF_RelocationTable> & RT);
		%feature("compactdefaultargs") References;
		%feature("autodoc", "	:param DS:
	:type DS: opencascade::handle<TDF_DataSet> &
	:rtype: void
") References;
		virtual void References (const opencascade::handle<TDF_DataSet> & DS);
		%feature("compactdefaultargs") Restore;
		%feature("autodoc", "	:param with:
	:type with: opencascade::handle<TDF_Attribute> &
	:rtype: None
") Restore;
		void Restore (const opencascade::handle<TDF_Attribute> & with);
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "	* api class methods ============= Find, or create, a UAttribute attribute with <LocalID> as Local GUID. The UAttribute attribute is returned. UAttribute methods ============

	:param label:
	:type label: TDF_Label &
	:param LocalID:
	:type LocalID: Standard_GUID &
	:rtype: opencascade::handle<TDataStd_UAttribute>
") Set;
		static opencascade::handle<TDataStd_UAttribute> Set (const TDF_Label & label,const Standard_GUID & LocalID);
		%feature("compactdefaultargs") SetID;
		%feature("autodoc", "	:param LocalID:
	:type LocalID: Standard_GUID &
	:rtype: None
") SetID;
		void SetID (const Standard_GUID & LocalID);
		%feature("compactdefaultargs") TDataStd_UAttribute;
		%feature("autodoc", "	:rtype: None
") TDataStd_UAttribute;
		 TDataStd_UAttribute ();
};


%make_alias(TDataStd_UAttribute)

%extend TDataStd_UAttribute {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TDataStd_Variable;
class TDataStd_Variable : public TDF_Attribute {
	public:
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	* create(if doesn't exist) and returns the assigned expression attribute. fill it after.

	:rtype: opencascade::handle<TDataStd_Expression>
") Assign;
		opencascade::handle<TDataStd_Expression> Assign ();
		%feature("compactdefaultargs") Constant;
		%feature("autodoc", "	* if <status> is True, this variable will not be modified by the solver.

	:param status:
	:type status: bool
	:rtype: None
") Constant;
		void Constant (const Standard_Boolean status);
		%feature("compactdefaultargs") Desassign;
		%feature("autodoc", "	* if <self> is assigned delete the associated expression attribute.

	:rtype: None
") Desassign;
		void Desassign ();

        %feature("autodoc", "1");
        %extend{
            std::string DumpToString() {
            std::stringstream s;
            self->Dump(s);
            return s.str();}
        };
        		%feature("compactdefaultargs") Expression;
		%feature("autodoc", "	* if <self> is assigned, returns associated Expression attribute.

	:rtype: opencascade::handle<TDataStd_Expression>
") Expression;
		opencascade::handle<TDataStd_Expression> Expression ();
		%feature("compactdefaultargs") Get;
		%feature("autodoc", "	* returns value stored in associated Real attribute.

	:rtype: float
") Get;
		Standard_Real Get ();
		%feature("compactdefaultargs") GetID;
		%feature("autodoc", "	* class methods =============

	:rtype: Standard_GUID
") GetID;
		static const Standard_GUID & GetID ();
		%feature("compactdefaultargs") ID;
		%feature("autodoc", "	:rtype: Standard_GUID
") ID;
		const Standard_GUID & ID ();
		%feature("compactdefaultargs") IsAssigned;
		%feature("autodoc", "	* returns True if an Expression attribute is associated. create(if doesn't exist), set and returns the assigned expression attribute.

	:rtype: bool
") IsAssigned;
		Standard_Boolean IsAssigned ();
		%feature("compactdefaultargs") IsCaptured;
		%feature("autodoc", "	* shortcut for <Real()->IsCaptured()>

	:rtype: bool
") IsCaptured;
		Standard_Boolean IsCaptured ();
		%feature("compactdefaultargs") IsConstant;
		%feature("autodoc", "	* A constant value is not modified by regeneration.

	:rtype: bool
") IsConstant;
		Standard_Boolean IsConstant ();
		%feature("compactdefaultargs") IsValued;
		%feature("autodoc", "	* returns True if a Real attribute is associated.

	:rtype: bool
") IsValued;
		Standard_Boolean IsValued ();
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "	* set or change the name of the variable, in myUnknown and my associated Name attribute.

	:param string:
	:type string: TCollection_ExtendedString &
	:rtype: None
") Name;
		void Name (const TCollection_ExtendedString & string);
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "	* returns string stored in the associated Name attribute.

	:rtype: TCollection_ExtendedString
") Name;
		const TCollection_ExtendedString & Name ();
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "	:rtype: opencascade::handle<TDF_Attribute>
") NewEmpty;
		opencascade::handle<TDF_Attribute> NewEmpty ();
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	:param Into:
	:type Into: opencascade::handle<TDF_Attribute> &
	:param RT:
	:type RT: opencascade::handle<TDF_RelocationTable> &
	:rtype: None
") Paste;
		void Paste (const opencascade::handle<TDF_Attribute> & Into,const opencascade::handle<TDF_RelocationTable> & RT);
		%feature("compactdefaultargs") Real;
		%feature("autodoc", "	* returns associated Real attribute.

	:rtype: opencascade::handle<TDataStd_Real>
") Real;
		opencascade::handle<TDataStd_Real> Real ();
		%feature("compactdefaultargs") References;
		%feature("autodoc", "	* to export reference to the associated Name attribute.

	:param DS:
	:type DS: opencascade::handle<TDF_DataSet> &
	:rtype: void
") References;
		virtual void References (const opencascade::handle<TDF_DataSet> & DS);
		%feature("compactdefaultargs") Restore;
		%feature("autodoc", "	:param With:
	:type With: opencascade::handle<TDF_Attribute> &
	:rtype: None
") Restore;
		void Restore (const opencascade::handle<TDF_Attribute> & With);
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "	* Find, or create, a Variable attribute. Real methods ============

	:param label:
	:type label: TDF_Label &
	:rtype: opencascade::handle<TDataStd_Variable>
") Set;
		static opencascade::handle<TDataStd_Variable> Set (const TDF_Label & label);
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "	* retrieve or create the associated real attribute and set the value <value>.

	:param value:
	:type value: float
	:rtype: None
") Set;
		void Set (const Standard_Real value);
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "	* Obsolete method that will be removed in next versions. The dimension argument is not supported in the persistence mechanism.

	:param value:
	:type value: float
	:param dimension:
	:type dimension: TDataStd_RealEnum
	:rtype: None
") Set;
		void Set (const Standard_Real value,const TDataStd_RealEnum dimension);
		%feature("compactdefaultargs") TDataStd_Variable;
		%feature("autodoc", "	:rtype: None
") TDataStd_Variable;
		 TDataStd_Variable ();
		%feature("compactdefaultargs") Unit;
		%feature("autodoc", "	:param unit:
	:type unit: TCollection_AsciiString &
	:rtype: None
") Unit;
		void Unit (const TCollection_AsciiString & unit);
		%feature("compactdefaultargs") Unit;
		%feature("autodoc", "	* to read/write fields ===================

	:rtype: TCollection_AsciiString
") Unit;
		const TCollection_AsciiString & Unit ();
};


%make_alias(TDataStd_Variable)

%extend TDataStd_Variable {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
/* harray1 class */
class TDataStd_HLabelArray1 : public  TDataStd_LabelArray1, public Standard_Transient {
  public:
    TDataStd_HLabelArray1(const Standard_Integer theLower, const Standard_Integer theUpper);
    TDataStd_HLabelArray1(const Standard_Integer theLower, const Standard_Integer theUpper, const  TDataStd_LabelArray1::value_type& theValue);
    TDataStd_HLabelArray1(const  TDataStd_LabelArray1& theOther);
    const  TDataStd_LabelArray1& Array1();
     TDataStd_LabelArray1& ChangeArray1();
};
%make_alias(TDataStd_HLabelArray1)


/* harray2 class */
/* harray2 class */
