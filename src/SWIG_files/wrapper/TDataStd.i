/*
Copyright 2008-2025 Thomas Paviot (tpaviot@gmail.com)

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
https://dev.opencascade.org/doc/occt-7.9.0/refman/html/package_tdatastd.html"
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
%include ../common/EnumTemplates.i
%include ../common/Operators.i
%include ../common/OccHandle.i
%include ../common/IOStream.i
%include ../common/ArrayMacros.i


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
from enum import IntEnum
from OCC.Core.Exception import *
};

/* public enums */
enum TDataStd_RealEnum {
	TDataStd_SCALAR = 0,
	TDataStd_LENGTH = 1,
	TDataStd_ANGULAR = 2,
};

/* end public enums declaration */

/* python proxy classes for enums */
%pythoncode {

class TDataStd_RealEnum(IntEnum):
	TDataStd_SCALAR = 0
	TDataStd_LENGTH = 1
	TDataStd_ANGULAR = 2
TDataStd_SCALAR = TDataStd_RealEnum.TDataStd_SCALAR
TDataStd_LENGTH = TDataStd_RealEnum.TDataStd_LENGTH
TDataStd_ANGULAR = TDataStd_RealEnum.TDataStd_ANGULAR
};
/* end python proxy for enums */

/* handles */
%wrap_handle(TDataStd_AsciiString)
%wrap_handle(TDataStd_BooleanArray)
%wrap_handle(TDataStd_BooleanList)
%wrap_handle(TDataStd_ByteArray)
%wrap_handle(TDataStd_Current)
%wrap_handle(TDataStd_DeltaOnModificationOfByteArray)
%wrap_handle(TDataStd_DeltaOnModificationOfExtStringArray)
%wrap_handle(TDataStd_DeltaOnModificationOfIntArray)
%wrap_handle(TDataStd_DeltaOnModificationOfIntPackedMap)
%wrap_handle(TDataStd_DeltaOnModificationOfRealArray)
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
%wrap_handle(TDataStd_NamedData)
%wrap_handle(TDataStd_Real)
%wrap_handle(TDataStd_RealArray)
%wrap_handle(TDataStd_RealList)
%wrap_handle(TDataStd_ReferenceArray)
%wrap_handle(TDataStd_ReferenceList)
%wrap_handle(TDataStd_TreeNode)
%wrap_handle(TDataStd_UAttribute)
%wrap_handle(TDataStd_Variable)
%wrap_handle(TDataStd_Comment)
%wrap_handle(TDataStd_Directory)
%wrap_handle(TDataStd_Name)
%wrap_handle(TDataStd_NoteBook)
%wrap_handle(TDataStd_Relation)
%wrap_handle(TDataStd_Tick)
/* end handles declaration */

/* templates */
%ignore NCollection_DataMap<TCollection_ExtendedString,uint8_t>::Items;
%ignore NCollection_DataMap<TCollection_ExtendedString,uint8_t>::KeyValues;
%template(TDataStd_DataMapOfStringByte) NCollection_DataMap<TCollection_ExtendedString,uint8_t>;
%ignore NCollection_DataMap<TCollection_ExtendedString,opencascade::handle<TColStd_HArray1OfInteger>>::Items;
%ignore NCollection_DataMap<TCollection_ExtendedString,opencascade::handle<TColStd_HArray1OfInteger>>::KeyValues;
%template(TDataStd_DataMapOfStringHArray1OfInteger) NCollection_DataMap<TCollection_ExtendedString,opencascade::handle<TColStd_HArray1OfInteger>>;
%ignore NCollection_DataMap<TCollection_ExtendedString,opencascade::handle<TColStd_HArray1OfReal>>::Items;
%ignore NCollection_DataMap<TCollection_ExtendedString,opencascade::handle<TColStd_HArray1OfReal>>::KeyValues;
%template(TDataStd_DataMapOfStringHArray1OfReal) NCollection_DataMap<TCollection_ExtendedString,opencascade::handle<TColStd_HArray1OfReal>>;
%ignore NCollection_DataMap<TCollection_ExtendedString,double>::Items;
%ignore NCollection_DataMap<TCollection_ExtendedString,double>::KeyValues;
%template(TDataStd_DataMapOfStringReal) NCollection_DataMap<TCollection_ExtendedString,double>;
%ignore NCollection_DataMap<TCollection_ExtendedString,TCollection_ExtendedString>::Items;
%ignore NCollection_DataMap<TCollection_ExtendedString,TCollection_ExtendedString>::KeyValues;
%template(TDataStd_DataMapOfStringString) NCollection_DataMap<TCollection_ExtendedString,TCollection_ExtendedString>;
%template(TDataStd_LabelArray1) NCollection_Array1<TDF_Label>;
Array1ExtendIter(TDF_Label)

%template(TDataStd_ListIteratorOfListOfByte) NCollection_TListIterator<uint8_t>;
%template(TDataStd_ListIteratorOfListOfExtendedString) NCollection_TListIterator<TCollection_ExtendedString>;
%template(TDataStd_ListOfByte) NCollection_List<uint8_t>;

%extend NCollection_List<uint8_t> {
    %pythoncode {
    def __len__(self):
        return self.Size()
    }
};
%template(TDataStd_ListOfExtendedString) NCollection_List<TCollection_ExtendedString>;

%extend NCollection_List<TCollection_ExtendedString> {
    %pythoncode {
    def __len__(self):
        return self.Size()
    }
};
/* end templates declaration */

/* typedefs */
typedef NCollection_DataMap<TCollection_ExtendedString, uint8_t>::Iterator TDataStd_DataMapIteratorOfDataMapOfStringByte;
typedef NCollection_DataMap<TCollection_ExtendedString, opencascade::handle<TColStd_HArray1OfInteger>>::Iterator TDataStd_DataMapIteratorOfDataMapOfStringHArray1OfInteger;
typedef NCollection_DataMap<TCollection_ExtendedString, opencascade::handle<TColStd_HArray1OfReal>>::Iterator TDataStd_DataMapIteratorOfDataMapOfStringHArray1OfReal;
typedef NCollection_DataMap<TCollection_ExtendedString, double>::Iterator TDataStd_DataMapIteratorOfDataMapOfStringReal;
typedef NCollection_DataMap<TCollection_ExtendedString, TCollection_ExtendedString>::Iterator TDataStd_DataMapIteratorOfDataMapOfStringString;
typedef NCollection_DataMap<TCollection_ExtendedString, uint8_t> TDataStd_DataMapOfStringByte;
typedef NCollection_DataMap<TCollection_ExtendedString, opencascade::handle<TColStd_HArray1OfInteger>> TDataStd_DataMapOfStringHArray1OfInteger;
typedef NCollection_DataMap<TCollection_ExtendedString, opencascade::handle<TColStd_HArray1OfReal>> TDataStd_DataMapOfStringHArray1OfReal;
typedef NCollection_DataMap<TCollection_ExtendedString, double> TDataStd_DataMapOfStringReal;
typedef NCollection_DataMap<TCollection_ExtendedString, TCollection_ExtendedString> TDataStd_DataMapOfStringString;
typedef NCollection_HArray1<TDF_Label> TDataStd_HLabelArray1;
typedef NCollection_Array1<TDF_Label> TDataStd_LabelArray1;
typedef NCollection_List<uint8_t>::Iterator TDataStd_ListIteratorOfListOfByte;
typedef NCollection_List<TCollection_ExtendedString>::Iterator TDataStd_ListIteratorOfListOfExtendedString;
typedef NCollection_List<uint8_t> TDataStd_ListOfByte;
typedef NCollection_List<TCollection_ExtendedString> TDataStd_ListOfExtendedString;
/* end typedefs declaration */

/*****************
* class TDataStd *
*****************/
%rename(tdatastd) TDataStd;
class TDataStd {
	public:
		/****** TDataStd::IDList ******/
		/****** md5 signature: 13c09c8b61f14a9cf4c6ae6a05704f7d ******/
		%feature("compactdefaultargs") IDList;
		%feature("autodoc", "
Parameters
----------
anIDList: NCollection_List<Standard_GUID>

Return
-------
None

Description
-----------
Appends to <anIDList> the list of the attributes IDs of this package. CAUTION: <anIDList> is NOT cleared before use.
") IDList;
		static void IDList(NCollection_List<Standard_GUID> & anIDList);

		/****** TDataStd::Print ******/
		/****** md5 signature: 34ef93cfb1f41df788d00d50ea442396 ******/
		%feature("compactdefaultargs") Print;
		%feature("autodoc", "
Parameters
----------
DIM: TDataStd_RealEnum

Return
-------
S: Standard_OStream

Description
-----------
Prints the name of the real dimension <DIM> as a String on the Stream <S> and returns <S>.
") Print;
		static Standard_OStream & Print(const TDataStd_RealEnum DIM, std::ostream &OutValue);

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
		/****** TDataStd_AsciiString::TDataStd_AsciiString ******/
		/****** md5 signature: b19c5694ec2985d51a2182fae37071f2 ******/
		%feature("compactdefaultargs") TDataStd_AsciiString;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") TDataStd_AsciiString;
		 TDataStd_AsciiString();

		/****** TDataStd_AsciiString::Dump ******/
		/****** md5 signature: c3832f0735de2bdac14af95fe6ce7de3 ******/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "
Parameters
----------

Return
-------
anOS: Standard_OStream

Description
-----------
No available documentation.
") Dump;
		Standard_OStream & Dump(std::ostream &OutValue);


        /****************** DumpJson ******************/
        %feature("autodoc", "
Parameters
----------
depth: int, default=-1

Return
-------
str

Description
-----------
Dump the object to JSON string.
") DumpJson;
        %extend{
            std::string DumpJson(int depth=-1) {
            std::stringstream s;
            self->DumpJson(s, depth);
            return "{" + s.str() + "}" ;}
        };
		/****** TDataStd_AsciiString::Get ******/
		/****** md5 signature: 94caccb04996b56934ce7de2990ed44f ******/
		%feature("compactdefaultargs") Get;
		%feature("autodoc", "Return
-------
TCollection_AsciiString

Description
-----------
No available documentation.
") Get;
		const TCollection_AsciiString & Get();

		/****** TDataStd_AsciiString::GetID ******/
		/****** md5 signature: afe6002d90f641ca3ea8c9ae9f8fe97c ******/
		%feature("compactdefaultargs") GetID;
		%feature("autodoc", "Return
-------
Standard_GUID

Description
-----------
class methods ============= Returns the GUID of the attribute.
") GetID;
		static const Standard_GUID & GetID();

		/****** TDataStd_AsciiString::ID ******/
		/****** md5 signature: 90e2a7836a98c0274891df8231c5ae76 ******/
		%feature("compactdefaultargs") ID;
		%feature("autodoc", "Return
-------
Standard_GUID

Description
-----------
No available documentation.
") ID;
		const Standard_GUID & ID();

		/****** TDataStd_AsciiString::IsEmpty ******/
		/****** md5 signature: 03c43b1186186edcd7d757f16ac1f505 ******/
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsEmpty;
		bool IsEmpty();

		/****** TDataStd_AsciiString::NewEmpty ******/
		/****** md5 signature: 4ebad80fa2cacb9f9e231bbb83a29a98 ******/
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "Return
-------
opencascade::handle<TDF_Attribute>

Description
-----------
No available documentation.
") NewEmpty;
		opencascade::handle<TDF_Attribute> NewEmpty();

		/****** TDataStd_AsciiString::Paste ******/
		/****** md5 signature: bfece7a0e37cb5034ac0b2a8c488da37 ******/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "
Parameters
----------
into: TDF_Attribute
RT: TDF_RelocationTable

Return
-------
None

Description
-----------
No available documentation.
") Paste;
		void Paste(const opencascade::handle<TDF_Attribute> & into, const opencascade::handle<TDF_RelocationTable> & RT);

		/****** TDataStd_AsciiString::Restore ******/
		/****** md5 signature: 8bde8d15cc1907242b8c43fe6eb18f19 ******/
		%feature("compactdefaultargs") Restore;
		%feature("autodoc", "
Parameters
----------
with: TDF_Attribute

Return
-------
None

Description
-----------
No available documentation.
") Restore;
		void Restore(const opencascade::handle<TDF_Attribute> & with);

		/****** TDataStd_AsciiString::Set ******/
		/****** md5 signature: b2e84438f8ca86c70cba4bebb4881db6 ******/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "
Parameters
----------
label: TDF_Label
string: str

Return
-------
opencascade::handle<TDataStd_AsciiString>

Description
-----------
Finds, or creates an AsciiString attribute and sets the string. the AsciiString attribute is returned. AsciiString methods ===================.
") Set;
		static opencascade::handle<TDataStd_AsciiString> Set(const TDF_Label & label, TCollection_AsciiString string);

		/****** TDataStd_AsciiString::Set ******/
		/****** md5 signature: 8e0373c564c384eab06dd600329d309e ******/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "
Parameters
----------
label: TDF_Label
guid: Standard_GUID
string: str

Return
-------
opencascade::handle<TDataStd_AsciiString>

Description
-----------
Finds, or creates, an AsciiString attribute with explicit user defined <guid> and sets <string>. The Name attribute is returned.
") Set;
		static opencascade::handle<TDataStd_AsciiString> Set(const TDF_Label & label, const Standard_GUID & guid, TCollection_AsciiString string);

		/****** TDataStd_AsciiString::Set ******/
		/****** md5 signature: 42b969f7de2537345586a3005c1ea20a ******/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "
Parameters
----------
S: str

Return
-------
None

Description
-----------
No available documentation.
") Set;
		void Set(TCollection_AsciiString S);

		/****** TDataStd_AsciiString::SetID ******/
		/****** md5 signature: 64789516907731f72c16acfd42a0f70f ******/
		%feature("compactdefaultargs") SetID;
		%feature("autodoc", "
Parameters
----------
guid: Standard_GUID

Return
-------
None

Description
-----------
Sets the explicit user defined GUID to the attribute.
") SetID;
		void SetID(const Standard_GUID & guid);

		/****** TDataStd_AsciiString::SetID ******/
		/****** md5 signature: 1c04912b49b7be6319020f1d75526111 ******/
		%feature("compactdefaultargs") SetID;
		%feature("autodoc", "Return
-------
None

Description
-----------
Sets default GUID for the attribute.
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
		/****** TDataStd_BooleanArray::TDataStd_BooleanArray ******/
		/****** md5 signature: 0b32f7d0a04ce20135713469b7833f5b ******/
		%feature("compactdefaultargs") TDataStd_BooleanArray;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") TDataStd_BooleanArray;
		 TDataStd_BooleanArray();

		/****** TDataStd_BooleanArray::Dump ******/
		/****** md5 signature: 4b2e787c4f1bb61723a71c7b2716a47b ******/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "
Parameters
----------

Return
-------
OS: Standard_OStream

Description
-----------
No available documentation.
") Dump;
		Standard_OStream & Dump(std::ostream &OutValue);


        /****************** DumpJson ******************/
        %feature("autodoc", "
Parameters
----------
depth: int, default=-1

Return
-------
str

Description
-----------
Dump the object to JSON string.
") DumpJson;
        %extend{
            std::string DumpJson(int depth=-1) {
            std::stringstream s;
            self->DumpJson(s, depth);
            return "{" + s.str() + "}" ;}
        };
		/****** TDataStd_BooleanArray::GetID ******/
		/****** md5 signature: afe6002d90f641ca3ea8c9ae9f8fe97c ******/
		%feature("compactdefaultargs") GetID;
		%feature("autodoc", "Return
-------
Standard_GUID

Description
-----------
Static methods ============== Returns an ID for array.
") GetID;
		static const Standard_GUID & GetID();

		/****** TDataStd_BooleanArray::ID ******/
		/****** md5 signature: 90e2a7836a98c0274891df8231c5ae76 ******/
		%feature("compactdefaultargs") ID;
		%feature("autodoc", "Return
-------
Standard_GUID

Description
-----------
No available documentation.
") ID;
		const Standard_GUID & ID();

		/****** TDataStd_BooleanArray::Init ******/
		/****** md5 signature: 9817520653ab29d149c0b92193743f1d ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
lower: int
upper: int

Return
-------
None

Description
-----------
Initialize the inner array with bounds from <lower> to <upper>.
") Init;
		void Init(const int lower, const int upper);

		/****** TDataStd_BooleanArray::InternalArray ******/
		/****** md5 signature: da89edd2480e70ea7838439f3620154c ******/
		%feature("compactdefaultargs") InternalArray;
		%feature("autodoc", "Return
-------
opencascade::handle<NCollection_HArray1<uint8_t>>

Description
-----------
No available documentation.
") InternalArray;
		const opencascade::handle<NCollection_HArray1<uint8_t>> & InternalArray();

		/****** TDataStd_BooleanArray::Length ******/
		/****** md5 signature: f07a384d0f09ac6092cb8ed89442c8a8 ******/
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of elements in the array.
") Length;
		int Length();

		/****** TDataStd_BooleanArray::Lower ******/
		/****** md5 signature: ed303acc20e6a8f86d94712204278487 ******/
		%feature("compactdefaultargs") Lower;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the lower boundary of the array.
") Lower;
		int Lower();

		/****** TDataStd_BooleanArray::NewEmpty ******/
		/****** md5 signature: 4ebad80fa2cacb9f9e231bbb83a29a98 ******/
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "Return
-------
opencascade::handle<TDF_Attribute>

Description
-----------
No available documentation.
") NewEmpty;
		opencascade::handle<TDF_Attribute> NewEmpty();

		/****** TDataStd_BooleanArray::Paste ******/
		/****** md5 signature: bfece7a0e37cb5034ac0b2a8c488da37 ******/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "
Parameters
----------
into: TDF_Attribute
RT: TDF_RelocationTable

Return
-------
None

Description
-----------
No available documentation.
") Paste;
		void Paste(const opencascade::handle<TDF_Attribute> & into, const opencascade::handle<TDF_RelocationTable> & RT);

		/****** TDataStd_BooleanArray::Restore ******/
		/****** md5 signature: 8bde8d15cc1907242b8c43fe6eb18f19 ******/
		%feature("compactdefaultargs") Restore;
		%feature("autodoc", "
Parameters
----------
with: TDF_Attribute

Return
-------
None

Description
-----------
No available documentation.
") Restore;
		void Restore(const opencascade::handle<TDF_Attribute> & with);

		/****** TDataStd_BooleanArray::Set ******/
		/****** md5 signature: 5cd45fa70924e1060b1823c5b5747b79 ******/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "
Parameters
----------
label: TDF_Label
lower: int
upper: int

Return
-------
opencascade::handle<TDataStd_BooleanArray>

Description
-----------
Finds or creates an attribute with internal boolean array.
") Set;
		static opencascade::handle<TDataStd_BooleanArray> Set(const TDF_Label & label, const int lower, const int upper);

		/****** TDataStd_BooleanArray::Set ******/
		/****** md5 signature: 8c6689f89afeaf4e9cb37ab5c27b2708 ******/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "
Parameters
----------
label: TDF_Label
theGuid: Standard_GUID
lower: int
upper: int

Return
-------
opencascade::handle<TDataStd_BooleanArray>

Description
-----------
Finds or creates an attribute with the array using explicit user defined <guid>.
") Set;
		static opencascade::handle<TDataStd_BooleanArray> Set(const TDF_Label & label, const Standard_GUID & theGuid, const int lower, const int upper);

		/****** TDataStd_BooleanArray::SetID ******/
		/****** md5 signature: 07ce9c4a6ca92424a2ebf50c156bd3b5 ******/
		%feature("compactdefaultargs") SetID;
		%feature("autodoc", "
Parameters
----------
theGuid: Standard_GUID

Return
-------
None

Description
-----------
Sets the explicit GUID (user defined) for the attribute.
") SetID;
		void SetID(const Standard_GUID & theGuid);

		/****** TDataStd_BooleanArray::SetID ******/
		/****** md5 signature: 1c04912b49b7be6319020f1d75526111 ******/
		%feature("compactdefaultargs") SetID;
		%feature("autodoc", "Return
-------
None

Description
-----------
Sets default GUID for the attribute.
") SetID;
		void SetID();

		/****** TDataStd_BooleanArray::SetInternalArray ******/
		/****** md5 signature: 56e78928a2bb87576002f65ad94fe623 ******/
		%feature("compactdefaultargs") SetInternalArray;
		%feature("autodoc", "
Parameters
----------
values: NCollection_HArray1<uint8_t

Return
-------
None

Description
-----------
No available documentation.
") SetInternalArray;
		void SetInternalArray(const opencascade::handle<NCollection_HArray1<uint8_t> > & values);

		/****** TDataStd_BooleanArray::SetValue ******/
		/****** md5 signature: 848214bcea36dd5fd13328455e58f3c3 ******/
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "
Parameters
----------
index: int
value: bool

Return
-------
None

Description
-----------
Sets the <Index>th element of the array to <Value> OutOfRange exception is raised if <Index> doesn't respect Lower and Upper bounds of the internal array.
") SetValue;
		void SetValue(const int index, const bool value);

		/****** TDataStd_BooleanArray::Upper ******/
		/****** md5 signature: a53a7ba7d20e7ec35b8de8d721ea431d ******/
		%feature("compactdefaultargs") Upper;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the upper boundary of the array.
") Upper;
		int Upper();

		/****** TDataStd_BooleanArray::Value ******/
		/****** md5 signature: 68d57515e4e49131f4805c8fe79896d9 ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
bool

Description
-----------
Return the value of the <Index>th element of the array.
") Value;
		bool Value(const int Index);

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
		/****** TDataStd_BooleanList::TDataStd_BooleanList ******/
		/****** md5 signature: d0238f239d1b7bcaae79bd0503a12a8c ******/
		%feature("compactdefaultargs") TDataStd_BooleanList;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") TDataStd_BooleanList;
		 TDataStd_BooleanList();

		/****** TDataStd_BooleanList::Append ******/
		/****** md5 signature: 4300e81d5a32b1c434afb0ea03fc09e2 ******/
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "
Parameters
----------
value: bool

Return
-------
None

Description
-----------
No available documentation.
") Append;
		void Append(const bool value);

		/****** TDataStd_BooleanList::Clear ******/
		/****** md5 signature: ae54be580b423a6eadbe062e0bdb44c2 ******/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Clear;
		void Clear();

		/****** TDataStd_BooleanList::Dump ******/
		/****** md5 signature: c3832f0735de2bdac14af95fe6ce7de3 ******/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "
Parameters
----------

Return
-------
anOS: Standard_OStream

Description
-----------
No available documentation.
") Dump;
		Standard_OStream & Dump(std::ostream &OutValue);


        /****************** DumpJson ******************/
        %feature("autodoc", "
Parameters
----------
depth: int, default=-1

Return
-------
str

Description
-----------
Dump the object to JSON string.
") DumpJson;
        %extend{
            std::string DumpJson(int depth=-1) {
            std::stringstream s;
            self->DumpJson(s, depth);
            return "{" + s.str() + "}" ;}
        };
		/****** TDataStd_BooleanList::Extent ******/
		/****** md5 signature: 1c9a99c4f72ae2188a5b950ee752d850 ******/
		%feature("compactdefaultargs") Extent;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") Extent;
		int Extent();

		/****** TDataStd_BooleanList::First ******/
		/****** md5 signature: 924519942978881e8a2afbe61a35d5a7 ******/
		%feature("compactdefaultargs") First;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") First;
		bool First();

		/****** TDataStd_BooleanList::GetID ******/
		/****** md5 signature: afe6002d90f641ca3ea8c9ae9f8fe97c ******/
		%feature("compactdefaultargs") GetID;
		%feature("autodoc", "Return
-------
Standard_GUID

Description
-----------
Static methods ============== Returns the ID of the list of booleans attribute.
") GetID;
		static const Standard_GUID & GetID();

		/****** TDataStd_BooleanList::ID ******/
		/****** md5 signature: 90e2a7836a98c0274891df8231c5ae76 ******/
		%feature("compactdefaultargs") ID;
		%feature("autodoc", "Return
-------
Standard_GUID

Description
-----------
No available documentation.
") ID;
		const Standard_GUID & ID();

		/****** TDataStd_BooleanList::InsertAfter ******/
		/****** md5 signature: 0e1a0c7fcfce682907cb15a80b71a754 ******/
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "
Parameters
----------
index: int
after_value: bool

Return
-------
bool

Description
-----------
Inserts the <value> after the <index> position. The indices start with 1 .. Extent().
") InsertAfter;
		bool InsertAfter(const int index, const bool after_value);

		/****** TDataStd_BooleanList::InsertBefore ******/
		/****** md5 signature: 761021eba387cb7b10a8e1e8947362ad ******/
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "
Parameters
----------
index: int
before_value: bool

Return
-------
bool

Description
-----------
Inserts the <value> before the <index> position. The indices start with 1 .. Extent().
") InsertBefore;
		bool InsertBefore(const int index, const bool before_value);

		/****** TDataStd_BooleanList::IsEmpty ******/
		/****** md5 signature: 03c43b1186186edcd7d757f16ac1f505 ******/
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsEmpty;
		bool IsEmpty();

		/****** TDataStd_BooleanList::Last ******/
		/****** md5 signature: 2be9114eba68b381bf5b1166809d00a4 ******/
		%feature("compactdefaultargs") Last;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") Last;
		bool Last();

		/****** TDataStd_BooleanList::List ******/
		/****** md5 signature: de436db6056d31c6f6f74de2e77bf87a ******/
		%feature("compactdefaultargs") List;
		%feature("autodoc", "Return
-------
NCollection_List<uint8_t>

Description
-----------
1 - means True, 0 - means False.
") List;
		const NCollection_List<uint8_t> & List();

		/****** TDataStd_BooleanList::NewEmpty ******/
		/****** md5 signature: 4ebad80fa2cacb9f9e231bbb83a29a98 ******/
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "Return
-------
opencascade::handle<TDF_Attribute>

Description
-----------
No available documentation.
") NewEmpty;
		opencascade::handle<TDF_Attribute> NewEmpty();

		/****** TDataStd_BooleanList::Paste ******/
		/****** md5 signature: bfece7a0e37cb5034ac0b2a8c488da37 ******/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "
Parameters
----------
Into: TDF_Attribute
RT: TDF_RelocationTable

Return
-------
None

Description
-----------
No available documentation.
") Paste;
		void Paste(const opencascade::handle<TDF_Attribute> & Into, const opencascade::handle<TDF_RelocationTable> & RT);

		/****** TDataStd_BooleanList::Prepend ******/
		/****** md5 signature: de30b1698f1845cb9a013e5cbe93aa44 ******/
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "
Parameters
----------
value: bool

Return
-------
None

Description
-----------
No available documentation.
") Prepend;
		void Prepend(const bool value);

		/****** TDataStd_BooleanList::Remove ******/
		/****** md5 signature: d991364949bd4864a2863cd5382583d6 ******/
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "
Parameters
----------
index: int

Return
-------
bool

Description
-----------
Removes a value at <index> position.
") Remove;
		bool Remove(const int index);

		/****** TDataStd_BooleanList::Restore ******/
		/****** md5 signature: 8bde8d15cc1907242b8c43fe6eb18f19 ******/
		%feature("compactdefaultargs") Restore;
		%feature("autodoc", "
Parameters
----------
With: TDF_Attribute

Return
-------
None

Description
-----------
No available documentation.
") Restore;
		void Restore(const opencascade::handle<TDF_Attribute> & With);

		/****** TDataStd_BooleanList::Set ******/
		/****** md5 signature: d080f3069cde31d54542fa06fc2e27b3 ******/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "
Parameters
----------
label: TDF_Label

Return
-------
opencascade::handle<TDataStd_BooleanList>

Description
-----------
Finds or creates a list of boolean values attribute.
") Set;
		static opencascade::handle<TDataStd_BooleanList> Set(const TDF_Label & label);

		/****** TDataStd_BooleanList::Set ******/
		/****** md5 signature: 7b1b0d48c0569068c398f407ed046375 ******/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "
Parameters
----------
label: TDF_Label
theGuid: Standard_GUID

Return
-------
opencascade::handle<TDataStd_BooleanList>

Description
-----------
Finds or creates a list of boolean values attribute with explicit user defined <guid>.
") Set;
		static opencascade::handle<TDataStd_BooleanList> Set(const TDF_Label & label, const Standard_GUID & theGuid);

		/****** TDataStd_BooleanList::SetID ******/
		/****** md5 signature: 07ce9c4a6ca92424a2ebf50c156bd3b5 ******/
		%feature("compactdefaultargs") SetID;
		%feature("autodoc", "
Parameters
----------
theGuid: Standard_GUID

Return
-------
None

Description
-----------
Sets the explicit GUID (user defined) for the attribute.
") SetID;
		void SetID(const Standard_GUID & theGuid);

		/****** TDataStd_BooleanList::SetID ******/
		/****** md5 signature: 1c04912b49b7be6319020f1d75526111 ******/
		%feature("compactdefaultargs") SetID;
		%feature("autodoc", "Return
-------
None

Description
-----------
Sets default GUID for the attribute.
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
		/****** TDataStd_ByteArray::TDataStd_ByteArray ******/
		/****** md5 signature: 312202423f8cbebabac8f711c331908a ******/
		%feature("compactdefaultargs") TDataStd_ByteArray;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") TDataStd_ByteArray;
		 TDataStd_ByteArray();

		/****** TDataStd_ByteArray::ChangeArray ******/
		/****** md5 signature: 69781b8c99636d81c24b75bf54a9310c ******/
		%feature("compactdefaultargs") ChangeArray;
		%feature("autodoc", "
Parameters
----------
newArray: NCollection_HArray1<uint8_t
isCheckItems: bool (optional, default to true)

Return
-------
None

Description
-----------
Sets the inner array <myValue> of the attribute to <newArray>. If value of <newArray> differs from <myValue>, Backup performed and myValue refers to new instance of HArray1OfInteger that holds <newArray> values. If <isCheckItems> equal True each item of <newArray> will be checked with each item of <myValue> for coincidence (to avoid backup).
") ChangeArray;
		void ChangeArray(const opencascade::handle<NCollection_HArray1<uint8_t> > & newArray, const bool isCheckItems = true);

		/****** TDataStd_ByteArray::DeltaOnModification ******/
		/****** md5 signature: dcdd915c66595b49f08644d07738621a ******/
		%feature("compactdefaultargs") DeltaOnModification;
		%feature("autodoc", "
Parameters
----------
anOldAttribute: TDF_Attribute

Return
-------
opencascade::handle<TDF_DeltaOnModification>

Description
-----------
Makes a DeltaOnModification between <self> and <anOldAttribute>.
") DeltaOnModification;
		opencascade::handle<TDF_DeltaOnModification> DeltaOnModification(const opencascade::handle<TDF_Attribute> & anOldAttribute);

		/****** TDataStd_ByteArray::Dump ******/
		/****** md5 signature: 4b2e787c4f1bb61723a71c7b2716a47b ******/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "
Parameters
----------

Return
-------
OS: Standard_OStream

Description
-----------
No available documentation.
") Dump;
		Standard_OStream & Dump(std::ostream &OutValue);


        /****************** DumpJson ******************/
        %feature("autodoc", "
Parameters
----------
depth: int, default=-1

Return
-------
str

Description
-----------
Dump the object to JSON string.
") DumpJson;
        %extend{
            std::string DumpJson(int depth=-1) {
            std::stringstream s;
            self->DumpJson(s, depth);
            return "{" + s.str() + "}" ;}
        };
		/****** TDataStd_ByteArray::GetDelta ******/
		/****** md5 signature: 48d284b77526180b9fca72a2b1a82618 ******/
		%feature("compactdefaultargs") GetDelta;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") GetDelta;
		bool GetDelta();

		/****** TDataStd_ByteArray::GetID ******/
		/****** md5 signature: afe6002d90f641ca3ea8c9ae9f8fe97c ******/
		%feature("compactdefaultargs") GetID;
		%feature("autodoc", "Return
-------
Standard_GUID

Description
-----------
Static methods ============== Returns an ID for array.
") GetID;
		static const Standard_GUID & GetID();

		/****** TDataStd_ByteArray::ID ******/
		/****** md5 signature: 90e2a7836a98c0274891df8231c5ae76 ******/
		%feature("compactdefaultargs") ID;
		%feature("autodoc", "Return
-------
Standard_GUID

Description
-----------
No available documentation.
") ID;
		const Standard_GUID & ID();

		/****** TDataStd_ByteArray::Init ******/
		/****** md5 signature: 9817520653ab29d149c0b92193743f1d ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
lower: int
upper: int

Return
-------
None

Description
-----------
Initialize the inner array with bounds from <lower> to <upper>.
") Init;
		void Init(const int lower, const int upper);

		/****** TDataStd_ByteArray::InternalArray ******/
		/****** md5 signature: d89248914edcee65cbf5468ebf30b4ee ******/
		%feature("compactdefaultargs") InternalArray;
		%feature("autodoc", "Return
-------
opencascade::handle<NCollection_HArray1<uint8_t>>

Description
-----------
No available documentation.
") InternalArray;
		const opencascade::handle<NCollection_HArray1<uint8_t>> & InternalArray();

		/****** TDataStd_ByteArray::Length ******/
		/****** md5 signature: f07a384d0f09ac6092cb8ed89442c8a8 ******/
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of elements in the array.
") Length;
		int Length();

		/****** TDataStd_ByteArray::Lower ******/
		/****** md5 signature: ed303acc20e6a8f86d94712204278487 ******/
		%feature("compactdefaultargs") Lower;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the lower boundary of the array.
") Lower;
		int Lower();

		/****** TDataStd_ByteArray::NewEmpty ******/
		/****** md5 signature: 4ebad80fa2cacb9f9e231bbb83a29a98 ******/
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "Return
-------
opencascade::handle<TDF_Attribute>

Description
-----------
No available documentation.
") NewEmpty;
		opencascade::handle<TDF_Attribute> NewEmpty();

		/****** TDataStd_ByteArray::Paste ******/
		/****** md5 signature: bfece7a0e37cb5034ac0b2a8c488da37 ******/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "
Parameters
----------
into: TDF_Attribute
RT: TDF_RelocationTable

Return
-------
None

Description
-----------
No available documentation.
") Paste;
		void Paste(const opencascade::handle<TDF_Attribute> & into, const opencascade::handle<TDF_RelocationTable> & RT);

		/****** TDataStd_ByteArray::Restore ******/
		/****** md5 signature: 8bde8d15cc1907242b8c43fe6eb18f19 ******/
		%feature("compactdefaultargs") Restore;
		%feature("autodoc", "
Parameters
----------
with: TDF_Attribute

Return
-------
None

Description
-----------
No available documentation.
") Restore;
		void Restore(const opencascade::handle<TDF_Attribute> & with);

		/****** TDataStd_ByteArray::Set ******/
		/****** md5 signature: 8082796fd4482f7d3434d69365097656 ******/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "
Parameters
----------
label: TDF_Label
lower: int
upper: int
isDelta: bool (optional, default to false)

Return
-------
opencascade::handle<TDataStd_ByteArray>

Description
-----------
Finds or creates an attribute with the array on the specified label. If <isDelta> == False, DefaultDeltaOnModification is used. If <isDelta> == True, DeltaOnModification of the current attribute is used. If attribute is already set, all input parameters are refused and the found attribute is returned.
") Set;
		static opencascade::handle<TDataStd_ByteArray> Set(const TDF_Label & label, const int lower, const int upper, const bool isDelta = false);

		/****** TDataStd_ByteArray::Set ******/
		/****** md5 signature: 99d27673ab65e27a1a3d697db265e887 ******/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "
Parameters
----------
label: TDF_Label
theGuid: Standard_GUID
lower: int
upper: int
isDelta: bool (optional, default to false)

Return
-------
opencascade::handle<TDataStd_ByteArray>

Description
-----------
Finds or creates an attribute with byte array and explicit user defined <guid> on the specified label.
") Set;
		static opencascade::handle<TDataStd_ByteArray> Set(const TDF_Label & label, const Standard_GUID & theGuid, const int lower, const int upper, const bool isDelta = false);

		/****** TDataStd_ByteArray::SetDelta ******/
		/****** md5 signature: ed3080f13a07eb95c0be3f5630b6c6b3 ******/
		%feature("compactdefaultargs") SetDelta;
		%feature("autodoc", "
Parameters
----------
isDelta: bool

Return
-------
None

Description
-----------
for internal use only!.
") SetDelta;
		void SetDelta(const bool isDelta);

		/****** TDataStd_ByteArray::SetID ******/
		/****** md5 signature: 07ce9c4a6ca92424a2ebf50c156bd3b5 ******/
		%feature("compactdefaultargs") SetID;
		%feature("autodoc", "
Parameters
----------
theGuid: Standard_GUID

Return
-------
None

Description
-----------
Sets the explicit GUID (user defined) for the attribute.
") SetID;
		void SetID(const Standard_GUID & theGuid);

		/****** TDataStd_ByteArray::SetID ******/
		/****** md5 signature: 1c04912b49b7be6319020f1d75526111 ******/
		%feature("compactdefaultargs") SetID;
		%feature("autodoc", "Return
-------
None

Description
-----------
Sets default GUID for the attribute.
") SetID;
		void SetID();

		/****** TDataStd_ByteArray::SetValue ******/
		/****** md5 signature: 6172a725ca3406c59806fa29f68cebff ******/
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "
Parameters
----------
index: int
value: uint8_t

Return
-------
None

Description
-----------
Sets the <Index>th element of the array to <Value> OutOfRange exception is raised if <Index> doesn't respect Lower and Upper bounds of the internal array.
") SetValue;
		void SetValue(const int index, const uint8_t value);

		/****** TDataStd_ByteArray::Upper ******/
		/****** md5 signature: a53a7ba7d20e7ec35b8de8d721ea431d ******/
		%feature("compactdefaultargs") Upper;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the upper boundary of the array.
") Upper;
		int Upper();

		/****** TDataStd_ByteArray::Value ******/
		/****** md5 signature: 8aacd98ef2d4c8532900a4227551d6dc ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
uint8_t

Description
-----------
Return the value of the <Index>th element of the array.
") Value;
		uint8_t Value(const int Index);

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
		/****** TDataStd_ChildNodeIterator::TDataStd_ChildNodeIterator ******/
		/****** md5 signature: e24e9f860884bd7756dfeb3da3a53cf1 ******/
		%feature("compactdefaultargs") TDataStd_ChildNodeIterator;
		%feature("autodoc", "Return
-------
None

Description
-----------
Creates an empty iterator.
") TDataStd_ChildNodeIterator;
		 TDataStd_ChildNodeIterator();

		/****** TDataStd_ChildNodeIterator::TDataStd_ChildNodeIterator ******/
		/****** md5 signature: 290b85fbd63528dea7b44a80e06ab2b8 ******/
		%feature("compactdefaultargs") TDataStd_ChildNodeIterator;
		%feature("autodoc", "
Parameters
----------
aTreeNode: TDataStd_TreeNode
allLevels: bool (optional, default to false)

Return
-------
None

Description
-----------
Iterates on the ChildStepren of the given Step. If <allLevels> option is set to true, it explores not only the first, but all the sub Step levels.
") TDataStd_ChildNodeIterator;
		 TDataStd_ChildNodeIterator(const opencascade::handle<TDataStd_TreeNode> & aTreeNode, const bool allLevels = false);

		/****** TDataStd_ChildNodeIterator::Initialize ******/
		/****** md5 signature: 873dc7229ed4853039e0157c03d8d8e4 ******/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "
Parameters
----------
aTreeNode: TDataStd_TreeNode
allLevels: bool (optional, default to false)

Return
-------
None

Description
-----------
Initializes the iteration on the Children Step of the given Step. If <allLevels> option is set to true, it explores not only the first, but all the sub Step levels.
") Initialize;
		void Initialize(const opencascade::handle<TDataStd_TreeNode> & aTreeNode, const bool allLevels = false);

		/****** TDataStd_ChildNodeIterator::More ******/
		/****** md5 signature: 0a7b505ff53e438121f2c208f8ae7ce8 ******/
		%feature("compactdefaultargs") More;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if there is a current Item in the iteration.
") More;
		bool More();

		/****** TDataStd_ChildNodeIterator::Next ******/
		/****** md5 signature: f35c0df5f1d7c877986db18081404532 ******/
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "Return
-------
None

Description
-----------
Move to the next Item.
") Next;
		void Next();

		/****** TDataStd_ChildNodeIterator::NextBrother ******/
		/****** md5 signature: 5986fa6a611b7b5fcfac587700960b73 ******/
		%feature("compactdefaultargs") NextBrother;
		%feature("autodoc", "Return
-------
None

Description
-----------
Move to the next Brother. If there is none, go up etc. This method is interesting only with 'allLevels' behavior, because it avoids to explore the current Step ChildStepren.
") NextBrother;
		void NextBrother();

		/****** TDataStd_ChildNodeIterator::Value ******/
		/****** md5 signature: fd1d39f23af9d5b18ee9477ee459afe3 ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Return
-------
opencascade::handle<TDataStd_TreeNode>

Description
-----------
Returns the current item; a null Step if there is no one.
") Value;
		const opencascade::handle<TDataStd_TreeNode> & Value();

};


%extend TDataStd_ChildNodeIterator {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************
* class TDataStd_Current *
*************************/
class TDataStd_Current : public TDF_Attribute {
	public:
		/****** TDataStd_Current::TDataStd_Current ******/
		/****** md5 signature: a578a0c756fb9b24dc8123cef48bcd7e ******/
		%feature("compactdefaultargs") TDataStd_Current;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") TDataStd_Current;
		 TDataStd_Current();

		/****** TDataStd_Current::Dump ******/
		/****** md5 signature: c3832f0735de2bdac14af95fe6ce7de3 ******/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "
Parameters
----------

Return
-------
anOS: Standard_OStream

Description
-----------
No available documentation.
") Dump;
		Standard_OStream & Dump(std::ostream &OutValue);


        /****************** DumpJson ******************/
        %feature("autodoc", "
Parameters
----------
depth: int, default=-1

Return
-------
str

Description
-----------
Dump the object to JSON string.
") DumpJson;
        %extend{
            std::string DumpJson(int depth=-1) {
            std::stringstream s;
            self->DumpJson(s, depth);
            return "{" + s.str() + "}" ;}
        };
		/****** TDataStd_Current::Get ******/
		/****** md5 signature: d34c5545c54e0e96d2b5128d71a2e61c ******/
		%feature("compactdefaultargs") Get;
		%feature("autodoc", "
Parameters
----------
acces: TDF_Label

Return
-------
TDF_Label

Description
-----------
returns current of <acces> Framework. raise if (!Has).
") Get;
		static TDF_Label Get(const TDF_Label & acces);

		/****** TDataStd_Current::GetID ******/
		/****** md5 signature: afe6002d90f641ca3ea8c9ae9f8fe97c ******/
		%feature("compactdefaultargs") GetID;
		%feature("autodoc", "Return
-------
Standard_GUID

Description
-----------
class methods =============.
") GetID;
		static const Standard_GUID & GetID();

		/****** TDataStd_Current::GetLabel ******/
		/****** md5 signature: b7ae9617d4db4ef8a9995ea610f01207 ******/
		%feature("compactdefaultargs") GetLabel;
		%feature("autodoc", "Return
-------
TDF_Label

Description
-----------
No available documentation.
") GetLabel;
		TDF_Label GetLabel();

		/****** TDataStd_Current::Has ******/
		/****** md5 signature: 4be26c703c22566df918a80d7bc3bd8a ******/
		%feature("compactdefaultargs") Has;
		%feature("autodoc", "
Parameters
----------
acces: TDF_Label

Return
-------
bool

Description
-----------
returns True if a current label is managed in <acces> Framework. class methods =============.
") Has;
		static bool Has(const TDF_Label & acces);

		/****** TDataStd_Current::ID ******/
		/****** md5 signature: 90e2a7836a98c0274891df8231c5ae76 ******/
		%feature("compactdefaultargs") ID;
		%feature("autodoc", "Return
-------
Standard_GUID

Description
-----------
No available documentation.
") ID;
		const Standard_GUID & ID();

		/****** TDataStd_Current::NewEmpty ******/
		/****** md5 signature: 4ebad80fa2cacb9f9e231bbb83a29a98 ******/
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "Return
-------
opencascade::handle<TDF_Attribute>

Description
-----------
No available documentation.
") NewEmpty;
		opencascade::handle<TDF_Attribute> NewEmpty();

		/****** TDataStd_Current::Paste ******/
		/****** md5 signature: bfece7a0e37cb5034ac0b2a8c488da37 ******/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "
Parameters
----------
Into: TDF_Attribute
RT: TDF_RelocationTable

Return
-------
None

Description
-----------
No available documentation.
") Paste;
		void Paste(const opencascade::handle<TDF_Attribute> & Into, const opencascade::handle<TDF_RelocationTable> & RT);

		/****** TDataStd_Current::Restore ******/
		/****** md5 signature: 8bde8d15cc1907242b8c43fe6eb18f19 ******/
		%feature("compactdefaultargs") Restore;
		%feature("autodoc", "
Parameters
----------
With: TDF_Attribute

Return
-------
None

Description
-----------
No available documentation.
") Restore;
		void Restore(const opencascade::handle<TDF_Attribute> & With);

		/****** TDataStd_Current::Set ******/
		/****** md5 signature: c2e44d4fdec9fa8ba87c71cb8e4eb45c ******/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "
Parameters
----------
L: TDF_Label

Return
-------
None

Description
-----------
Set <L> as current of <L> Framework.
") Set;
		static void Set(const TDF_Label & L);

		/****** TDataStd_Current::SetLabel ******/
		/****** md5 signature: 205c3acad49e703edb1fd5d07a53b864 ******/
		%feature("compactdefaultargs") SetLabel;
		%feature("autodoc", "
Parameters
----------
current: TDF_Label

Return
-------
None

Description
-----------
No available documentation.
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
		/****** TDataStd_DeltaOnModificationOfByteArray::TDataStd_DeltaOnModificationOfByteArray ******/
		/****** md5 signature: 528c157ef8098f8c29d6c7dca27ebda7 ******/
		%feature("compactdefaultargs") TDataStd_DeltaOnModificationOfByteArray;
		%feature("autodoc", "
Parameters
----------
Arr: TDataStd_ByteArray

Return
-------
None

Description
-----------
Initializes a TDF_DeltaOnModification.
") TDataStd_DeltaOnModificationOfByteArray;
		 TDataStd_DeltaOnModificationOfByteArray(const opencascade::handle<TDataStd_ByteArray> & Arr);

		/****** TDataStd_DeltaOnModificationOfByteArray::Apply ******/
		/****** md5 signature: c812de41f6107ab4b6caba68a166b811 ******/
		%feature("compactdefaultargs") Apply;
		%feature("autodoc", "Return
-------
None

Description
-----------
Applies the delta to the attribute.
") Apply;
		void Apply();

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
		/****** TDataStd_DeltaOnModificationOfExtStringArray::TDataStd_DeltaOnModificationOfExtStringArray ******/
		/****** md5 signature: 2d3f13a7b13375945170c948d07e85c3 ******/
		%feature("compactdefaultargs") TDataStd_DeltaOnModificationOfExtStringArray;
		%feature("autodoc", "
Parameters
----------
Arr: TDataStd_ExtStringArray

Return
-------
None

Description
-----------
Initializes a TDF_DeltaOnModification.
") TDataStd_DeltaOnModificationOfExtStringArray;
		 TDataStd_DeltaOnModificationOfExtStringArray(const opencascade::handle<TDataStd_ExtStringArray> & Arr);

		/****** TDataStd_DeltaOnModificationOfExtStringArray::Apply ******/
		/****** md5 signature: c812de41f6107ab4b6caba68a166b811 ******/
		%feature("compactdefaultargs") Apply;
		%feature("autodoc", "Return
-------
None

Description
-----------
Applies the delta to the attribute.
") Apply;
		void Apply();

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
		/****** TDataStd_DeltaOnModificationOfIntArray::TDataStd_DeltaOnModificationOfIntArray ******/
		/****** md5 signature: 11d477566085ea45cc0e45d9fb9bd111 ******/
		%feature("compactdefaultargs") TDataStd_DeltaOnModificationOfIntArray;
		%feature("autodoc", "
Parameters
----------
Arr: TDataStd_IntegerArray

Return
-------
None

Description
-----------
Initializes a TDF_DeltaOnModification.
") TDataStd_DeltaOnModificationOfIntArray;
		 TDataStd_DeltaOnModificationOfIntArray(const opencascade::handle<TDataStd_IntegerArray> & Arr);

		/****** TDataStd_DeltaOnModificationOfIntArray::Apply ******/
		/****** md5 signature: c812de41f6107ab4b6caba68a166b811 ******/
		%feature("compactdefaultargs") Apply;
		%feature("autodoc", "Return
-------
None

Description
-----------
Applies the delta to the attribute.
") Apply;
		void Apply();

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
		/****** TDataStd_DeltaOnModificationOfIntPackedMap::TDataStd_DeltaOnModificationOfIntPackedMap ******/
		/****** md5 signature: c2522035fee7e2418446871fd2b0939f ******/
		%feature("compactdefaultargs") TDataStd_DeltaOnModificationOfIntPackedMap;
		%feature("autodoc", "
Parameters
----------
Arr: TDataStd_IntPackedMap

Return
-------
None

Description
-----------
Initializes a TDF_DeltaOnModification.
") TDataStd_DeltaOnModificationOfIntPackedMap;
		 TDataStd_DeltaOnModificationOfIntPackedMap(const opencascade::handle<TDataStd_IntPackedMap> & Arr);

		/****** TDataStd_DeltaOnModificationOfIntPackedMap::Apply ******/
		/****** md5 signature: c812de41f6107ab4b6caba68a166b811 ******/
		%feature("compactdefaultargs") Apply;
		%feature("autodoc", "Return
-------
None

Description
-----------
Applies the delta to the attribute.
") Apply;
		void Apply();

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
		/****** TDataStd_DeltaOnModificationOfRealArray::TDataStd_DeltaOnModificationOfRealArray ******/
		/****** md5 signature: 5828e30462ebc925f56d0fa2310fd76b ******/
		%feature("compactdefaultargs") TDataStd_DeltaOnModificationOfRealArray;
		%feature("autodoc", "
Parameters
----------
Arr: TDataStd_RealArray

Return
-------
None

Description
-----------
Initializes a TDF_DeltaOnModification.
") TDataStd_DeltaOnModificationOfRealArray;
		 TDataStd_DeltaOnModificationOfRealArray(const opencascade::handle<TDataStd_RealArray> & Arr);

		/****** TDataStd_DeltaOnModificationOfRealArray::Apply ******/
		/****** md5 signature: c812de41f6107ab4b6caba68a166b811 ******/
		%feature("compactdefaultargs") Apply;
		%feature("autodoc", "Return
-------
None

Description
-----------
Applies the delta to the attribute.
") Apply;
		void Apply();

};


%make_alias(TDataStd_DeltaOnModificationOfRealArray)

%extend TDataStd_DeltaOnModificationOfRealArray {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************
* class TDataStd_Expression *
****************************/
class TDataStd_Expression : public TDF_Attribute {
	public:
		/****** TDataStd_Expression::TDataStd_Expression ******/
		/****** md5 signature: 939eb7d0a029c8982cdcdfdef991f0bc ******/
		%feature("compactdefaultargs") TDataStd_Expression;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") TDataStd_Expression;
		 TDataStd_Expression();

		/****** TDataStd_Expression::Dump ******/
		/****** md5 signature: c3832f0735de2bdac14af95fe6ce7de3 ******/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "
Parameters
----------

Return
-------
anOS: Standard_OStream

Description
-----------
No available documentation.
") Dump;
		Standard_OStream & Dump(std::ostream &OutValue);


        /****************** DumpJson ******************/
        %feature("autodoc", "
Parameters
----------
depth: int, default=-1

Return
-------
str

Description
-----------
Dump the object to JSON string.
") DumpJson;
        %extend{
            std::string DumpJson(int depth=-1) {
            std::stringstream s;
            self->DumpJson(s, depth);
            return "{" + s.str() + "}" ;}
        };
		/****** TDataStd_Expression::GetExpression ******/
		/****** md5 signature: fdf0cd52b1c54e1dcbcfca5ccc5ef545 ******/
		%feature("compactdefaultargs") GetExpression;
		%feature("autodoc", "Return
-------
TCollection_ExtendedString

Description
-----------
No available documentation.
") GetExpression;
		const TCollection_ExtendedString & GetExpression();

		/****** TDataStd_Expression::GetID ******/
		/****** md5 signature: afe6002d90f641ca3ea8c9ae9f8fe97c ******/
		%feature("compactdefaultargs") GetID;
		%feature("autodoc", "Return
-------
Standard_GUID

Description
-----------
class methods =============.
") GetID;
		static const Standard_GUID & GetID();

		/****** TDataStd_Expression::GetVariables ******/
		/****** md5 signature: bf9d30ce9cc8c37e15f30e0bd7a60bdf ******/
		%feature("compactdefaultargs") GetVariables;
		%feature("autodoc", "Return
-------
NCollection_List<opencascade::handle<TDF_Attribute>>

Description
-----------
No available documentation.
") GetVariables;
		NCollection_List<opencascade::handle<TDF_Attribute>> & GetVariables();

		/****** TDataStd_Expression::ID ******/
		/****** md5 signature: 90e2a7836a98c0274891df8231c5ae76 ******/
		%feature("compactdefaultargs") ID;
		%feature("autodoc", "Return
-------
Standard_GUID

Description
-----------
No available documentation.
") ID;
		const Standard_GUID & ID();

		/****** TDataStd_Expression::Name ******/
		/****** md5 signature: a9e55299a1405b3a2863469f1a67f9cd ******/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "Return
-------
TCollection_ExtendedString

Description
-----------
build and return the expression name.
") Name;
		TCollection_ExtendedString Name();

		/****** TDataStd_Expression::NewEmpty ******/
		/****** md5 signature: 4ebad80fa2cacb9f9e231bbb83a29a98 ******/
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "Return
-------
opencascade::handle<TDF_Attribute>

Description
-----------
No available documentation.
") NewEmpty;
		opencascade::handle<TDF_Attribute> NewEmpty();

		/****** TDataStd_Expression::Paste ******/
		/****** md5 signature: bfece7a0e37cb5034ac0b2a8c488da37 ******/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "
Parameters
----------
Into: TDF_Attribute
RT: TDF_RelocationTable

Return
-------
None

Description
-----------
No available documentation.
") Paste;
		void Paste(const opencascade::handle<TDF_Attribute> & Into, const opencascade::handle<TDF_RelocationTable> & RT);

		/****** TDataStd_Expression::Restore ******/
		/****** md5 signature: 8bde8d15cc1907242b8c43fe6eb18f19 ******/
		%feature("compactdefaultargs") Restore;
		%feature("autodoc", "
Parameters
----------
With: TDF_Attribute

Return
-------
None

Description
-----------
No available documentation.
") Restore;
		void Restore(const opencascade::handle<TDF_Attribute> & With);

		/****** TDataStd_Expression::Set ******/
		/****** md5 signature: e53eb091d541b581beabbed924a69572 ******/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "
Parameters
----------
label: TDF_Label

Return
-------
opencascade::handle<TDataStd_Expression>

Description
-----------
Find, or create, an Expression attribute. Expressionmethods ============.
") Set;
		static opencascade::handle<TDataStd_Expression> Set(const TDF_Label & label);

		/****** TDataStd_Expression::SetExpression ******/
		/****** md5 signature: 8d6173b1816680fcec94f1d55a3ab1c0 ******/
		%feature("compactdefaultargs") SetExpression;
		%feature("autodoc", "
Parameters
----------
E: str

Return
-------
None

Description
-----------
No available documentation.
") SetExpression;
		void SetExpression(TCollection_ExtendedString E);

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
		/****** TDataStd_ExtStringArray::TDataStd_ExtStringArray ******/
		/****** md5 signature: 2e933b03a799e9e1cecedbcf1c15d8e4 ******/
		%feature("compactdefaultargs") TDataStd_ExtStringArray;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") TDataStd_ExtStringArray;
		 TDataStd_ExtStringArray();

		/****** TDataStd_ExtStringArray::Array ******/
		/****** md5 signature: 41a46359beec1f9354075f89fd422039 ******/
		%feature("compactdefaultargs") Array;
		%feature("autodoc", "Return
-------
opencascade::handle<NCollection_HArray1<TCollection_ExtendedString>>

Description
-----------
Return the inner array of the ExtStringArray attribute.
") Array;
		const opencascade::handle<NCollection_HArray1<TCollection_ExtendedString>> & Array();

		/****** TDataStd_ExtStringArray::ChangeArray ******/
		/****** md5 signature: 9801affe705697324d9c29b8714610e7 ******/
		%feature("compactdefaultargs") ChangeArray;
		%feature("autodoc", "
Parameters
----------
newArray: NCollection_HArray1<TCollection_ExtendedString
isCheckItems: bool (optional, default to true)

Return
-------
None

Description
-----------
Sets the inner array <myValue> of the ExtStringArray attribute to <newArray>. If value of <newArray> differs from <myValue>, Backup performed and myValue refers to new instance of HArray1OfExtendedString that holds <newArray> values If <isCheckItems> equal True each item of <newArray> will be checked with each item of <myValue> for coincidence (to avoid backup).
") ChangeArray;
		void ChangeArray(const opencascade::handle<NCollection_HArray1<TCollection_ExtendedString> > & newArray, const bool isCheckItems = true);

		/****** TDataStd_ExtStringArray::DeltaOnModification ******/
		/****** md5 signature: dcdd915c66595b49f08644d07738621a ******/
		%feature("compactdefaultargs") DeltaOnModification;
		%feature("autodoc", "
Parameters
----------
anOldAttribute: TDF_Attribute

Return
-------
opencascade::handle<TDF_DeltaOnModification>

Description
-----------
Makes a DeltaOnModification between <self> and <anOldAttribute>.
") DeltaOnModification;
		opencascade::handle<TDF_DeltaOnModification> DeltaOnModification(const opencascade::handle<TDF_Attribute> & anOldAttribute);

		/****** TDataStd_ExtStringArray::Dump ******/
		/****** md5 signature: c3832f0735de2bdac14af95fe6ce7de3 ******/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "
Parameters
----------

Return
-------
anOS: Standard_OStream

Description
-----------
No available documentation.
") Dump;
		Standard_OStream & Dump(std::ostream &OutValue);


        /****************** DumpJson ******************/
        %feature("autodoc", "
Parameters
----------
depth: int, default=-1

Return
-------
str

Description
-----------
Dump the object to JSON string.
") DumpJson;
        %extend{
            std::string DumpJson(int depth=-1) {
            std::stringstream s;
            self->DumpJson(s, depth);
            return "{" + s.str() + "}" ;}
        };
		/****** TDataStd_ExtStringArray::GetDelta ******/
		/****** md5 signature: 48d284b77526180b9fca72a2b1a82618 ******/
		%feature("compactdefaultargs") GetDelta;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") GetDelta;
		bool GetDelta();

		/****** TDataStd_ExtStringArray::GetID ******/
		/****** md5 signature: afe6002d90f641ca3ea8c9ae9f8fe97c ******/
		%feature("compactdefaultargs") GetID;
		%feature("autodoc", "Return
-------
Standard_GUID

Description
-----------
class methods ============= Returns the GUID for the attribute.
") GetID;
		static const Standard_GUID & GetID();

		/****** TDataStd_ExtStringArray::ID ******/
		/****** md5 signature: 90e2a7836a98c0274891df8231c5ae76 ******/
		%feature("compactdefaultargs") ID;
		%feature("autodoc", "Return
-------
Standard_GUID

Description
-----------
No available documentation.
") ID;
		const Standard_GUID & ID();

		/****** TDataStd_ExtStringArray::Init ******/
		/****** md5 signature: 9817520653ab29d149c0b92193743f1d ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
lower: int
upper: int

Return
-------
None

Description
-----------
Initializes the inner array with bounds from <lower> to <upper>.
") Init;
		void Init(const int lower, const int upper);

		/****** TDataStd_ExtStringArray::Length ******/
		/****** md5 signature: f07a384d0f09ac6092cb8ed89442c8a8 ******/
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "Return
-------
int

Description
-----------
Return the number of elements of <self>.
") Length;
		int Length();

		/****** TDataStd_ExtStringArray::Lower ******/
		/****** md5 signature: ed303acc20e6a8f86d94712204278487 ******/
		%feature("compactdefaultargs") Lower;
		%feature("autodoc", "Return
-------
int

Description
-----------
Return the lower bound.
") Lower;
		int Lower();

		/****** TDataStd_ExtStringArray::NewEmpty ******/
		/****** md5 signature: 4ebad80fa2cacb9f9e231bbb83a29a98 ******/
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "Return
-------
opencascade::handle<TDF_Attribute>

Description
-----------
No available documentation.
") NewEmpty;
		opencascade::handle<TDF_Attribute> NewEmpty();

		/****** TDataStd_ExtStringArray::Paste ******/
		/****** md5 signature: bfece7a0e37cb5034ac0b2a8c488da37 ******/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "
Parameters
----------
Into: TDF_Attribute
RT: TDF_RelocationTable

Return
-------
None

Description
-----------
No available documentation.
") Paste;
		void Paste(const opencascade::handle<TDF_Attribute> & Into, const opencascade::handle<TDF_RelocationTable> & RT);

		/****** TDataStd_ExtStringArray::Restore ******/
		/****** md5 signature: 8bde8d15cc1907242b8c43fe6eb18f19 ******/
		%feature("compactdefaultargs") Restore;
		%feature("autodoc", "
Parameters
----------
With: TDF_Attribute

Return
-------
None

Description
-----------
No available documentation.
") Restore;
		void Restore(const opencascade::handle<TDF_Attribute> & With);

		/****** TDataStd_ExtStringArray::Set ******/
		/****** md5 signature: 413d36ce1292abf11443df40f3a9343e ******/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "
Parameters
----------
label: TDF_Label
lower: int
upper: int
isDelta: bool (optional, default to false)

Return
-------
opencascade::handle<TDataStd_ExtStringArray>

Description
-----------
Finds, or creates, an ExtStringArray attribute with <lower> and <upper> bounds on the specified label. If <isDelta> == False, DefaultDeltaOnModification is used. If <isDelta> == True, DeltaOnModification of the current attribute is used. If attribute is already set, all input parameters are refused and the found attribute is returned.
") Set;
		static opencascade::handle<TDataStd_ExtStringArray> Set(const TDF_Label & label, const int lower, const int upper, const bool isDelta = false);

		/****** TDataStd_ExtStringArray::Set ******/
		/****** md5 signature: acc6ce1580cf5d702de7b603fa928731 ******/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "
Parameters
----------
label: TDF_Label
theGuid: Standard_GUID
lower: int
upper: int
isDelta: bool (optional, default to false)

Return
-------
opencascade::handle<TDataStd_ExtStringArray>

Description
-----------
Finds, or creates, an ExtStringArray attribute with explicit user defined <guid>. The ExtStringArray attribute is returned.
") Set;
		static opencascade::handle<TDataStd_ExtStringArray> Set(const TDF_Label & label, const Standard_GUID & theGuid, const int lower, const int upper, const bool isDelta = false);

		/****** TDataStd_ExtStringArray::SetDelta ******/
		/****** md5 signature: ed3080f13a07eb95c0be3f5630b6c6b3 ******/
		%feature("compactdefaultargs") SetDelta;
		%feature("autodoc", "
Parameters
----------
isDelta: bool

Return
-------
None

Description
-----------
for internal use only!.
") SetDelta;
		void SetDelta(const bool isDelta);

		/****** TDataStd_ExtStringArray::SetID ******/
		/****** md5 signature: 07ce9c4a6ca92424a2ebf50c156bd3b5 ******/
		%feature("compactdefaultargs") SetID;
		%feature("autodoc", "
Parameters
----------
theGuid: Standard_GUID

Return
-------
None

Description
-----------
Sets the explicit GUID (user defined) for the attribute.
") SetID;
		void SetID(const Standard_GUID & theGuid);

		/****** TDataStd_ExtStringArray::SetID ******/
		/****** md5 signature: 1c04912b49b7be6319020f1d75526111 ******/
		%feature("compactdefaultargs") SetID;
		%feature("autodoc", "Return
-------
None

Description
-----------
Sets default GUID for the attribute.
") SetID;
		void SetID();

		/****** TDataStd_ExtStringArray::SetValue ******/
		/****** md5 signature: faf0738736713344bd7e793953109095 ******/
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "
Parameters
----------
Index: int
Value: str

Return
-------
None

Description
-----------
Sets the <Index>th element of the array to <Value> OutOfRange exception is raised if <Index> doesn't respect Lower and Upper bounds of the internal array.
") SetValue;
		void SetValue(const int Index, TCollection_ExtendedString Value);

		/****** TDataStd_ExtStringArray::Upper ******/
		/****** md5 signature: a53a7ba7d20e7ec35b8de8d721ea431d ******/
		%feature("compactdefaultargs") Upper;
		%feature("autodoc", "Return
-------
int

Description
-----------
Return the upper bound.
") Upper;
		int Upper();

		/****** TDataStd_ExtStringArray::Value ******/
		/****** md5 signature: 82c9525e923f83a69b50a33747c0aea0 ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
TCollection_ExtendedString

Description
-----------
Returns the value of the <Index>th element of the array.
") Value;
		const TCollection_ExtendedString & Value(const int Index);

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
		/****** TDataStd_ExtStringList::TDataStd_ExtStringList ******/
		/****** md5 signature: 26fea186ced25401b227ef31dbc36a0b ******/
		%feature("compactdefaultargs") TDataStd_ExtStringList;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") TDataStd_ExtStringList;
		 TDataStd_ExtStringList();

		/****** TDataStd_ExtStringList::Append ******/
		/****** md5 signature: 17033042cfaf021e49aafaf281a7b600 ******/
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "
Parameters
----------
value: str

Return
-------
None

Description
-----------
No available documentation.
") Append;
		void Append(TCollection_ExtendedString value);

		/****** TDataStd_ExtStringList::Clear ******/
		/****** md5 signature: ae54be580b423a6eadbe062e0bdb44c2 ******/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Clear;
		void Clear();

		/****** TDataStd_ExtStringList::Dump ******/
		/****** md5 signature: c3832f0735de2bdac14af95fe6ce7de3 ******/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "
Parameters
----------

Return
-------
anOS: Standard_OStream

Description
-----------
No available documentation.
") Dump;
		Standard_OStream & Dump(std::ostream &OutValue);


        /****************** DumpJson ******************/
        %feature("autodoc", "
Parameters
----------
depth: int, default=-1

Return
-------
str

Description
-----------
Dump the object to JSON string.
") DumpJson;
        %extend{
            std::string DumpJson(int depth=-1) {
            std::stringstream s;
            self->DumpJson(s, depth);
            return "{" + s.str() + "}" ;}
        };
		/****** TDataStd_ExtStringList::Extent ******/
		/****** md5 signature: 1c9a99c4f72ae2188a5b950ee752d850 ******/
		%feature("compactdefaultargs") Extent;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") Extent;
		int Extent();

		/****** TDataStd_ExtStringList::First ******/
		/****** md5 signature: 3f1d3d89a785e40474e1a5651c9efbec ******/
		%feature("compactdefaultargs") First;
		%feature("autodoc", "Return
-------
TCollection_ExtendedString

Description
-----------
No available documentation.
") First;
		const TCollection_ExtendedString & First();

		/****** TDataStd_ExtStringList::GetID ******/
		/****** md5 signature: afe6002d90f641ca3ea8c9ae9f8fe97c ******/
		%feature("compactdefaultargs") GetID;
		%feature("autodoc", "Return
-------
Standard_GUID

Description
-----------
Static methods ============== Returns the ID of the list of strings attribute.
") GetID;
		static const Standard_GUID & GetID();

		/****** TDataStd_ExtStringList::ID ******/
		/****** md5 signature: 90e2a7836a98c0274891df8231c5ae76 ******/
		%feature("compactdefaultargs") ID;
		%feature("autodoc", "Return
-------
Standard_GUID

Description
-----------
No available documentation.
") ID;
		const Standard_GUID & ID();

		/****** TDataStd_ExtStringList::InsertAfter ******/
		/****** md5 signature: 1a70422dbcdd529f6655290f6e28634c ******/
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "
Parameters
----------
value: str
after_value: str

Return
-------
bool

Description
-----------
Inserts the <value> after the first meet of <after_value>.
") InsertAfter;
		bool InsertAfter(TCollection_ExtendedString value, TCollection_ExtendedString after_value);

		/****** TDataStd_ExtStringList::InsertAfter ******/
		/****** md5 signature: ed9ef46cf527383f0111e8b23b1639c5 ******/
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "
Parameters
----------
index: int
after_value: str

Return
-------
bool

Description
-----------
Inserts the <value> after the <index> position. The indices start with 1 .. Extent().
") InsertAfter;
		bool InsertAfter(const int index, TCollection_ExtendedString after_value);

		/****** TDataStd_ExtStringList::InsertBefore ******/
		/****** md5 signature: 7e818f2ff6568272c48b92892bd6d79b ******/
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "
Parameters
----------
value: str
before_value: str

Return
-------
bool

Description
-----------
Inserts the <value> before the first meet of <before_value>.
") InsertBefore;
		bool InsertBefore(TCollection_ExtendedString value, TCollection_ExtendedString before_value);

		/****** TDataStd_ExtStringList::InsertBefore ******/
		/****** md5 signature: 0a5eac8bfe1ab36c51f7ae42feb14eb9 ******/
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "
Parameters
----------
index: int
before_value: str

Return
-------
bool

Description
-----------
Inserts the <value> before the <index> position. The indices start with 1 .. Extent().
") InsertBefore;
		bool InsertBefore(const int index, TCollection_ExtendedString before_value);

		/****** TDataStd_ExtStringList::IsEmpty ******/
		/****** md5 signature: 03c43b1186186edcd7d757f16ac1f505 ******/
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsEmpty;
		bool IsEmpty();

		/****** TDataStd_ExtStringList::Last ******/
		/****** md5 signature: bbe7512cc0b24fd20ee696e0517ad9d2 ******/
		%feature("compactdefaultargs") Last;
		%feature("autodoc", "Return
-------
TCollection_ExtendedString

Description
-----------
No available documentation.
") Last;
		const TCollection_ExtendedString & Last();

		/****** TDataStd_ExtStringList::List ******/
		/****** md5 signature: 382533ae060729c41c05beadf9be0cfd ******/
		%feature("compactdefaultargs") List;
		%feature("autodoc", "Return
-------
NCollection_List<TCollection_ExtendedString>

Description
-----------
No available documentation.
") List;
		const NCollection_List<TCollection_ExtendedString> & List();

		/****** TDataStd_ExtStringList::NewEmpty ******/
		/****** md5 signature: 4ebad80fa2cacb9f9e231bbb83a29a98 ******/
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "Return
-------
opencascade::handle<TDF_Attribute>

Description
-----------
No available documentation.
") NewEmpty;
		opencascade::handle<TDF_Attribute> NewEmpty();

		/****** TDataStd_ExtStringList::Paste ******/
		/****** md5 signature: bfece7a0e37cb5034ac0b2a8c488da37 ******/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "
Parameters
----------
Into: TDF_Attribute
RT: TDF_RelocationTable

Return
-------
None

Description
-----------
No available documentation.
") Paste;
		void Paste(const opencascade::handle<TDF_Attribute> & Into, const opencascade::handle<TDF_RelocationTable> & RT);

		/****** TDataStd_ExtStringList::Prepend ******/
		/****** md5 signature: cf8ec1439a3483441dea24ed3f849802 ******/
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "
Parameters
----------
value: str

Return
-------
None

Description
-----------
No available documentation.
") Prepend;
		void Prepend(TCollection_ExtendedString value);

		/****** TDataStd_ExtStringList::Remove ******/
		/****** md5 signature: 5f9d01dbbef528524b9702d4bf45be31 ******/
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "
Parameters
----------
value: str

Return
-------
bool

Description
-----------
Removes the first meet of the <value>.
") Remove;
		bool Remove(TCollection_ExtendedString value);

		/****** TDataStd_ExtStringList::Remove ******/
		/****** md5 signature: d991364949bd4864a2863cd5382583d6 ******/
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "
Parameters
----------
index: int

Return
-------
bool

Description
-----------
Removes a value at <index> position.
") Remove;
		bool Remove(const int index);

		/****** TDataStd_ExtStringList::Restore ******/
		/****** md5 signature: 8bde8d15cc1907242b8c43fe6eb18f19 ******/
		%feature("compactdefaultargs") Restore;
		%feature("autodoc", "
Parameters
----------
With: TDF_Attribute

Return
-------
None

Description
-----------
No available documentation.
") Restore;
		void Restore(const opencascade::handle<TDF_Attribute> & With);

		/****** TDataStd_ExtStringList::Set ******/
		/****** md5 signature: 4293bb8b79b6502b9e2fe5213c4ee024 ******/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "
Parameters
----------
label: TDF_Label

Return
-------
opencascade::handle<TDataStd_ExtStringList>

Description
-----------
Finds or creates a list of string values attribute with explicit user defined <guid>.
") Set;
		static opencascade::handle<TDataStd_ExtStringList> Set(const TDF_Label & label);

		/****** TDataStd_ExtStringList::Set ******/
		/****** md5 signature: 624a244ee7a119ff27a90322c6e7c40f ******/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "
Parameters
----------
label: TDF_Label
theGuid: Standard_GUID

Return
-------
opencascade::handle<TDataStd_ExtStringList>

Description
-----------
Finds or creates a list of string values attribute.
") Set;
		static opencascade::handle<TDataStd_ExtStringList> Set(const TDF_Label & label, const Standard_GUID & theGuid);

		/****** TDataStd_ExtStringList::SetID ******/
		/****** md5 signature: 07ce9c4a6ca92424a2ebf50c156bd3b5 ******/
		%feature("compactdefaultargs") SetID;
		%feature("autodoc", "
Parameters
----------
theGuid: Standard_GUID

Return
-------
None

Description
-----------
Sets the explicit GUID (user defined) for the attribute.
") SetID;
		void SetID(const Standard_GUID & theGuid);

		/****** TDataStd_ExtStringList::SetID ******/
		/****** md5 signature: 1c04912b49b7be6319020f1d75526111 ******/
		%feature("compactdefaultargs") SetID;
		%feature("autodoc", "Return
-------
None

Description
-----------
Sets default GUID for the attribute.
") SetID;
		void SetID();

};


%make_alias(TDataStd_ExtStringList)

%extend TDataStd_ExtStringList {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************
* class TDataStd_GenericEmpty *
******************************/
/**********************************
* class TDataStd_GenericExtString *
**********************************/
/**************************************
* class TDataStd_HDataMapOfStringByte *
**************************************/
class TDataStd_HDataMapOfStringByte : public Standard_Transient {
	public:
		/****** TDataStd_HDataMapOfStringByte::TDataStd_HDataMapOfStringByte ******/
		/****** md5 signature: 36151e02d33546d773fa2208432bbfa3 ******/
		%feature("compactdefaultargs") TDataStd_HDataMapOfStringByte;
		%feature("autodoc", "
Parameters
----------
NbBuckets: int (optional, default to 1)

Return
-------
None

Description
-----------
No available documentation.
") TDataStd_HDataMapOfStringByte;
		 TDataStd_HDataMapOfStringByte(const int NbBuckets = 1);

		/****** TDataStd_HDataMapOfStringByte::TDataStd_HDataMapOfStringByte ******/
		/****** md5 signature: 650be4e280c79fb43ce80fef1229d2ef ******/
		%feature("compactdefaultargs") TDataStd_HDataMapOfStringByte;
		%feature("autodoc", "
Parameters
----------
theOther: NCollection_DataMap<TCollection_ExtendedString, uint8_t>

Return
-------
None

Description
-----------
No available documentation.
") TDataStd_HDataMapOfStringByte;
		 TDataStd_HDataMapOfStringByte(const NCollection_DataMap<TCollection_ExtendedString, uint8_t> & theOther);

		/****** TDataStd_HDataMapOfStringByte::ChangeMap ******/
		/****** md5 signature: f25d2fa3a6be2c71ea4bb6a4b353bbcc ******/
		%feature("compactdefaultargs") ChangeMap;
		%feature("autodoc", "Return
-------
NCollection_DataMap<TCollection_ExtendedString, uint8_t>

Description
-----------
No available documentation.
") ChangeMap;
		NCollection_DataMap<TCollection_ExtendedString, uint8_t> & ChangeMap();

		/****** TDataStd_HDataMapOfStringByte::Map ******/
		/****** md5 signature: 5e6a1284ff530878fb79a84804e5fd36 ******/
		%feature("compactdefaultargs") Map;
		%feature("autodoc", "Return
-------
NCollection_DataMap<TCollection_ExtendedString, uint8_t>

Description
-----------
No available documentation.
") Map;
		const NCollection_DataMap<TCollection_ExtendedString, uint8_t> & Map();

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
		/****** TDataStd_HDataMapOfStringHArray1OfInteger::TDataStd_HDataMapOfStringHArray1OfInteger ******/
		/****** md5 signature: 378aaef1914c3e44626ae1037381f179 ******/
		%feature("compactdefaultargs") TDataStd_HDataMapOfStringHArray1OfInteger;
		%feature("autodoc", "
Parameters
----------
NbBuckets: int (optional, default to 1)

Return
-------
None

Description
-----------
No available documentation.
") TDataStd_HDataMapOfStringHArray1OfInteger;
		 TDataStd_HDataMapOfStringHArray1OfInteger(const int NbBuckets = 1);

		/****** TDataStd_HDataMapOfStringHArray1OfInteger::TDataStd_HDataMapOfStringHArray1OfInteger ******/
		/****** md5 signature: 1ef9d14f533d94e7bbba322c9bcbb0bb ******/
		%feature("compactdefaultargs") TDataStd_HDataMapOfStringHArray1OfInteger;
		%feature("autodoc", "
Parameters
----------
theOther: NCollection_HArray1<int

Return
-------
None

Description
-----------
No available documentation.
") TDataStd_HDataMapOfStringHArray1OfInteger;
		 TDataStd_HDataMapOfStringHArray1OfInteger(const NCollection_DataMap<TCollection_ExtendedString, opencascade::handle<NCollection_HArray1<int> > > & theOther);

		/****** TDataStd_HDataMapOfStringHArray1OfInteger::ChangeMap ******/
		/****** md5 signature: 7b884a7f6270351f39baeb1630165358 ******/
		%feature("compactdefaultargs") ChangeMap;
		%feature("autodoc", "Return
-------
NCollection_DataMap<TCollection_ExtendedString, opencascade::handle<NCollection_HArray1<int>>>

Description
-----------
No available documentation.
") ChangeMap;
		NCollection_DataMap<TCollection_ExtendedString, opencascade::handle<NCollection_HArray1<int>>> & ChangeMap();

		/****** TDataStd_HDataMapOfStringHArray1OfInteger::Map ******/
		/****** md5 signature: e71d4bf5539a22163368464c550ac4d0 ******/
		%feature("compactdefaultargs") Map;
		%feature("autodoc", "Return
-------
NCollection_DataMap<TCollection_ExtendedString, opencascade::handle<NCollection_HArray1<int>>>

Description
-----------
No available documentation.
") Map;
		const NCollection_DataMap<TCollection_ExtendedString, opencascade::handle<NCollection_HArray1<int>>> & Map();

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
		/****** TDataStd_HDataMapOfStringHArray1OfReal::TDataStd_HDataMapOfStringHArray1OfReal ******/
		/****** md5 signature: 988e91bde93ad3a42a7f5c5938d38800 ******/
		%feature("compactdefaultargs") TDataStd_HDataMapOfStringHArray1OfReal;
		%feature("autodoc", "
Parameters
----------
NbBuckets: int (optional, default to 1)

Return
-------
None

Description
-----------
No available documentation.
") TDataStd_HDataMapOfStringHArray1OfReal;
		 TDataStd_HDataMapOfStringHArray1OfReal(const int NbBuckets = 1);

		/****** TDataStd_HDataMapOfStringHArray1OfReal::TDataStd_HDataMapOfStringHArray1OfReal ******/
		/****** md5 signature: f2e11a002bbfe6142fc993a20258d6b2 ******/
		%feature("compactdefaultargs") TDataStd_HDataMapOfStringHArray1OfReal;
		%feature("autodoc", "
Parameters
----------
theOther: NCollection_HArray1<double

Return
-------
None

Description
-----------
No available documentation.
") TDataStd_HDataMapOfStringHArray1OfReal;
		 TDataStd_HDataMapOfStringHArray1OfReal(const NCollection_DataMap<TCollection_ExtendedString, opencascade::handle<NCollection_HArray1<double> > > & theOther);

		/****** TDataStd_HDataMapOfStringHArray1OfReal::ChangeMap ******/
		/****** md5 signature: 2299b3cdec329e77bd0cdecc056632d2 ******/
		%feature("compactdefaultargs") ChangeMap;
		%feature("autodoc", "Return
-------
NCollection_DataMap<TCollection_ExtendedString, opencascade::handle<NCollection_HArray1<double>>>

Description
-----------
No available documentation.
") ChangeMap;
		NCollection_DataMap<TCollection_ExtendedString, opencascade::handle<NCollection_HArray1<double>>> & ChangeMap();

		/****** TDataStd_HDataMapOfStringHArray1OfReal::Map ******/
		/****** md5 signature: d0990736972c1d8354f84f1a4ed0e974 ******/
		%feature("compactdefaultargs") Map;
		%feature("autodoc", "Return
-------
NCollection_DataMap<TCollection_ExtendedString, opencascade::handle<NCollection_HArray1<double>>>

Description
-----------
No available documentation.
") Map;
		const NCollection_DataMap<TCollection_ExtendedString, opencascade::handle<NCollection_HArray1<double>>> & Map();

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
		/****** TDataStd_HDataMapOfStringInteger::TDataStd_HDataMapOfStringInteger ******/
		/****** md5 signature: b272c07bde7fb1077edfa6436836cb83 ******/
		%feature("compactdefaultargs") TDataStd_HDataMapOfStringInteger;
		%feature("autodoc", "
Parameters
----------
NbBuckets: int (optional, default to 1)

Return
-------
None

Description
-----------
No available documentation.
") TDataStd_HDataMapOfStringInteger;
		 TDataStd_HDataMapOfStringInteger(const int NbBuckets = 1);

		/****** TDataStd_HDataMapOfStringInteger::TDataStd_HDataMapOfStringInteger ******/
		/****** md5 signature: 944a25811e1bd219a5fe47cc8b0d2b8c ******/
		%feature("compactdefaultargs") TDataStd_HDataMapOfStringInteger;
		%feature("autodoc", "
Parameters
----------
theOther: NCollection_DataMap<TCollection_ExtendedString, int>

Return
-------
None

Description
-----------
No available documentation.
") TDataStd_HDataMapOfStringInteger;
		 TDataStd_HDataMapOfStringInteger(const NCollection_DataMap<TCollection_ExtendedString, int> & theOther);

		/****** TDataStd_HDataMapOfStringInteger::ChangeMap ******/
		/****** md5 signature: bbc64500a252b5d1177543f20cf828cd ******/
		%feature("compactdefaultargs") ChangeMap;
		%feature("autodoc", "Return
-------
NCollection_DataMap<TCollection_ExtendedString, int>

Description
-----------
No available documentation.
") ChangeMap;
		NCollection_DataMap<TCollection_ExtendedString, int> & ChangeMap();

		/****** TDataStd_HDataMapOfStringInteger::Map ******/
		/****** md5 signature: ea6f9bd2903ee4e7de326f59f5f7fe0b ******/
		%feature("compactdefaultargs") Map;
		%feature("autodoc", "Return
-------
NCollection_DataMap<TCollection_ExtendedString, int>

Description
-----------
No available documentation.
") Map;
		const NCollection_DataMap<TCollection_ExtendedString, int> & Map();

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
		/****** TDataStd_HDataMapOfStringReal::TDataStd_HDataMapOfStringReal ******/
		/****** md5 signature: 1c6e4aceb77101cc84d9b233df719dd0 ******/
		%feature("compactdefaultargs") TDataStd_HDataMapOfStringReal;
		%feature("autodoc", "
Parameters
----------
NbBuckets: int (optional, default to 1)

Return
-------
None

Description
-----------
No available documentation.
") TDataStd_HDataMapOfStringReal;
		 TDataStd_HDataMapOfStringReal(const int NbBuckets = 1);

		/****** TDataStd_HDataMapOfStringReal::TDataStd_HDataMapOfStringReal ******/
		/****** md5 signature: cfbe612156b512c68719f9785479a0f7 ******/
		%feature("compactdefaultargs") TDataStd_HDataMapOfStringReal;
		%feature("autodoc", "
Parameters
----------
theOther: NCollection_DataMap<TCollection_ExtendedString, double>

Return
-------
None

Description
-----------
No available documentation.
") TDataStd_HDataMapOfStringReal;
		 TDataStd_HDataMapOfStringReal(const NCollection_DataMap<TCollection_ExtendedString, double> & theOther);

		/****** TDataStd_HDataMapOfStringReal::ChangeMap ******/
		/****** md5 signature: 62dbc4dc76d69ed8d81e7b8ce6e53760 ******/
		%feature("compactdefaultargs") ChangeMap;
		%feature("autodoc", "Return
-------
NCollection_DataMap<TCollection_ExtendedString, double>

Description
-----------
No available documentation.
") ChangeMap;
		NCollection_DataMap<TCollection_ExtendedString, double> & ChangeMap();

		/****** TDataStd_HDataMapOfStringReal::Map ******/
		/****** md5 signature: c06e389766508e1ad1efbf382f7c67a5 ******/
		%feature("compactdefaultargs") Map;
		%feature("autodoc", "Return
-------
NCollection_DataMap<TCollection_ExtendedString, double>

Description
-----------
No available documentation.
") Map;
		const NCollection_DataMap<TCollection_ExtendedString, double> & Map();

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
		/****** TDataStd_HDataMapOfStringString::TDataStd_HDataMapOfStringString ******/
		/****** md5 signature: 3e01b8a462c2fd8306fd984b444aee21 ******/
		%feature("compactdefaultargs") TDataStd_HDataMapOfStringString;
		%feature("autodoc", "
Parameters
----------
NbBuckets: int (optional, default to 1)

Return
-------
None

Description
-----------
No available documentation.
") TDataStd_HDataMapOfStringString;
		 TDataStd_HDataMapOfStringString(const int NbBuckets = 1);

		/****** TDataStd_HDataMapOfStringString::TDataStd_HDataMapOfStringString ******/
		/****** md5 signature: 7e6571c9352609cce44d9742c8b49ebd ******/
		%feature("compactdefaultargs") TDataStd_HDataMapOfStringString;
		%feature("autodoc", "
Parameters
----------
theOther: NCollection_DataMap<TCollection_ExtendedString, TCollection_ExtendedString>

Return
-------
None

Description
-----------
No available documentation.
") TDataStd_HDataMapOfStringString;
		 TDataStd_HDataMapOfStringString(const NCollection_DataMap<TCollection_ExtendedString, TCollection_ExtendedString> & theOther);

		/****** TDataStd_HDataMapOfStringString::ChangeMap ******/
		/****** md5 signature: 04004d52a8d232412fb2730b8d63f1ea ******/
		%feature("compactdefaultargs") ChangeMap;
		%feature("autodoc", "Return
-------
NCollection_DataMap<TCollection_ExtendedString, TCollection_ExtendedString>

Description
-----------
No available documentation.
") ChangeMap;
		NCollection_DataMap<TCollection_ExtendedString, TCollection_ExtendedString> & ChangeMap();

		/****** TDataStd_HDataMapOfStringString::Map ******/
		/****** md5 signature: ac2be5d3f36be6a3b1a4b00bcfd8048a ******/
		%feature("compactdefaultargs") Map;
		%feature("autodoc", "Return
-------
NCollection_DataMap<TCollection_ExtendedString, TCollection_ExtendedString>

Description
-----------
No available documentation.
") Map;
		const NCollection_DataMap<TCollection_ExtendedString, TCollection_ExtendedString> & Map();

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
		/****** TDataStd_IntPackedMap::TDataStd_IntPackedMap ******/
		/****** md5 signature: 44e5a1a57bd959cbf2e00dda897be7a2 ******/
		%feature("compactdefaultargs") TDataStd_IntPackedMap;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") TDataStd_IntPackedMap;
		 TDataStd_IntPackedMap();

		/****** TDataStd_IntPackedMap::Add ******/
		/****** md5 signature: 7626e5d23ef371b57d1bad7fa2013e5b ******/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "
Parameters
----------
theKey: int

Return
-------
bool

Description
-----------
No available documentation.
") Add;
		bool Add(const int theKey);

		/****** TDataStd_IntPackedMap::ChangeMap ******/
		/****** md5 signature: aa0b83a8db31442e2ec9158ab45d65c6 ******/
		%feature("compactdefaultargs") ChangeMap;
		%feature("autodoc", "
Parameters
----------
theMap: TColStd_HPackedMapOfInteger

Return
-------
bool

Description
-----------
No available documentation.
") ChangeMap;
		bool ChangeMap(const opencascade::handle<TColStd_HPackedMapOfInteger> & theMap);

		/****** TDataStd_IntPackedMap::ChangeMap ******/
		/****** md5 signature: fe2cb45a42512ac7f66bff461607781e ******/
		%feature("compactdefaultargs") ChangeMap;
		%feature("autodoc", "
Parameters
----------
theMap: TColStd_PackedMapOfInteger

Return
-------
bool

Description
-----------
No available documentation.
") ChangeMap;
		bool ChangeMap(const TColStd_PackedMapOfInteger & theMap);

		/****** TDataStd_IntPackedMap::Clear ******/
		/****** md5 signature: f0582b6634f128157d9a55f725294745 ******/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") Clear;
		bool Clear();

		/****** TDataStd_IntPackedMap::Contains ******/
		/****** md5 signature: eb133c24c162a1d88300fbac6f522bab ******/
		%feature("compactdefaultargs") Contains;
		%feature("autodoc", "
Parameters
----------
theKey: int

Return
-------
bool

Description
-----------
No available documentation.
") Contains;
		bool Contains(const int theKey);

		/****** TDataStd_IntPackedMap::DeltaOnModification ******/
		/****** md5 signature: dcdd915c66595b49f08644d07738621a ******/
		%feature("compactdefaultargs") DeltaOnModification;
		%feature("autodoc", "
Parameters
----------
anOldAttribute: TDF_Attribute

Return
-------
opencascade::handle<TDF_DeltaOnModification>

Description
-----------
Makes a DeltaOnModification between <self> and <anOldAttribute>.
") DeltaOnModification;
		opencascade::handle<TDF_DeltaOnModification> DeltaOnModification(const opencascade::handle<TDF_Attribute> & anOldAttribute);

		/****** TDataStd_IntPackedMap::Dump ******/
		/****** md5 signature: c3832f0735de2bdac14af95fe6ce7de3 ******/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "
Parameters
----------

Return
-------
anOS: Standard_OStream

Description
-----------
No available documentation.
") Dump;
		Standard_OStream & Dump(std::ostream &OutValue);


        /****************** DumpJson ******************/
        %feature("autodoc", "
Parameters
----------
depth: int, default=-1

Return
-------
str

Description
-----------
Dump the object to JSON string.
") DumpJson;
        %extend{
            std::string DumpJson(int depth=-1) {
            std::stringstream s;
            self->DumpJson(s, depth);
            return "{" + s.str() + "}" ;}
        };
		/****** TDataStd_IntPackedMap::Extent ******/
		/****** md5 signature: 5ab265087cc74fd902b499a31008b06c ******/
		%feature("compactdefaultargs") Extent;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") Extent;
		int Extent();

		/****** TDataStd_IntPackedMap::GetDelta ******/
		/****** md5 signature: 48d284b77526180b9fca72a2b1a82618 ******/
		%feature("compactdefaultargs") GetDelta;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") GetDelta;
		bool GetDelta();

		/****** TDataStd_IntPackedMap::GetHMap ******/
		/****** md5 signature: b4f08d4f76579674f567faee1618fdb9 ******/
		%feature("compactdefaultargs") GetHMap;
		%feature("autodoc", "Return
-------
opencascade::handle<TColStd_HPackedMapOfInteger>

Description
-----------
No available documentation.
") GetHMap;
		const opencascade::handle<TColStd_HPackedMapOfInteger> & GetHMap();

		/****** TDataStd_IntPackedMap::GetID ******/
		/****** md5 signature: afe6002d90f641ca3ea8c9ae9f8fe97c ******/
		%feature("compactdefaultargs") GetID;
		%feature("autodoc", "Return
-------
Standard_GUID

Description
-----------
class methods ============= Returns the GUID of the attribute.
") GetID;
		static const Standard_GUID & GetID();

		/****** TDataStd_IntPackedMap::GetMap ******/
		/****** md5 signature: a9371f625855767a17c749d635a51f1e ******/
		%feature("compactdefaultargs") GetMap;
		%feature("autodoc", "Return
-------
TColStd_PackedMapOfInteger

Description
-----------
No available documentation.
") GetMap;
		const TColStd_PackedMapOfInteger & GetMap();

		/****** TDataStd_IntPackedMap::ID ******/
		/****** md5 signature: 90e2a7836a98c0274891df8231c5ae76 ******/
		%feature("compactdefaultargs") ID;
		%feature("autodoc", "Return
-------
Standard_GUID

Description
-----------
No available documentation.
") ID;
		const Standard_GUID & ID();

		/****** TDataStd_IntPackedMap::IsEmpty ******/
		/****** md5 signature: 70a41d5fe65955a28167088305fc6991 ******/
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsEmpty;
		bool IsEmpty();

		/****** TDataStd_IntPackedMap::NewEmpty ******/
		/****** md5 signature: 4ebad80fa2cacb9f9e231bbb83a29a98 ******/
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "Return
-------
opencascade::handle<TDF_Attribute>

Description
-----------
No available documentation.
") NewEmpty;
		opencascade::handle<TDF_Attribute> NewEmpty();

		/****** TDataStd_IntPackedMap::Paste ******/
		/****** md5 signature: bfece7a0e37cb5034ac0b2a8c488da37 ******/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "
Parameters
----------
into: TDF_Attribute
RT: TDF_RelocationTable

Return
-------
None

Description
-----------
No available documentation.
") Paste;
		void Paste(const opencascade::handle<TDF_Attribute> & into, const opencascade::handle<TDF_RelocationTable> & RT);

		/****** TDataStd_IntPackedMap::Remove ******/
		/****** md5 signature: 837fd793b49ffa29a344acd2e1f1bbce ******/
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "
Parameters
----------
theKey: int

Return
-------
bool

Description
-----------
No available documentation.
") Remove;
		bool Remove(const int theKey);

		/****** TDataStd_IntPackedMap::Restore ******/
		/****** md5 signature: 8bde8d15cc1907242b8c43fe6eb18f19 ******/
		%feature("compactdefaultargs") Restore;
		%feature("autodoc", "
Parameters
----------
with: TDF_Attribute

Return
-------
None

Description
-----------
No available documentation.
") Restore;
		void Restore(const opencascade::handle<TDF_Attribute> & with);

		/****** TDataStd_IntPackedMap::Set ******/
		/****** md5 signature: d687526f05fe6edda859c3561211299a ******/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "
Parameters
----------
label: TDF_Label
isDelta: bool (optional, default to false)

Return
-------
opencascade::handle<TDataStd_IntPackedMap>

Description
-----------
Finds or creates an integer map attribute on the given label. If <isDelta> == False, DefaultDeltaOnModification is used. If <isDelta> == True, DeltaOnModification of the current attribute is used. If attribute is already set, input parameter <isDelta> is refused and the found attribute returned. Attribute methods ===================.
") Set;
		static opencascade::handle<TDataStd_IntPackedMap> Set(const TDF_Label & label, const bool isDelta = false);

		/****** TDataStd_IntPackedMap::SetDelta ******/
		/****** md5 signature: ed3080f13a07eb95c0be3f5630b6c6b3 ******/
		%feature("compactdefaultargs") SetDelta;
		%feature("autodoc", "
Parameters
----------
isDelta: bool

Return
-------
None

Description
-----------
for internal use only!.
") SetDelta;
		void SetDelta(const bool isDelta);

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
		/****** TDataStd_Integer::TDataStd_Integer ******/
		/****** md5 signature: 3a5577c108fd9a03f49db7ce67d309a3 ******/
		%feature("compactdefaultargs") TDataStd_Integer;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") TDataStd_Integer;
		 TDataStd_Integer();

		/****** TDataStd_Integer::Dump ******/
		/****** md5 signature: c3832f0735de2bdac14af95fe6ce7de3 ******/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "
Parameters
----------

Return
-------
anOS: Standard_OStream

Description
-----------
No available documentation.
") Dump;
		Standard_OStream & Dump(std::ostream &OutValue);


        /****************** DumpJson ******************/
        %feature("autodoc", "
Parameters
----------
depth: int, default=-1

Return
-------
str

Description
-----------
Dump the object to JSON string.
") DumpJson;
        %extend{
            std::string DumpJson(int depth=-1) {
            std::stringstream s;
            self->DumpJson(s, depth);
            return "{" + s.str() + "}" ;}
        };
		/****** TDataStd_Integer::Get ******/
		/****** md5 signature: 02cc734fc3bf23ff1b84c211da4f6523 ******/
		%feature("compactdefaultargs") Get;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the integer value contained in the attribute.
") Get;
		int Get();

		/****** TDataStd_Integer::GetID ******/
		/****** md5 signature: afe6002d90f641ca3ea8c9ae9f8fe97c ******/
		%feature("compactdefaultargs") GetID;
		%feature("autodoc", "Return
-------
Standard_GUID

Description
-----------
class methods ============= Returns the GUID for integers.
") GetID;
		static const Standard_GUID & GetID();

		/****** TDataStd_Integer::ID ******/
		/****** md5 signature: 90e2a7836a98c0274891df8231c5ae76 ******/
		%feature("compactdefaultargs") ID;
		%feature("autodoc", "Return
-------
Standard_GUID

Description
-----------
No available documentation.
") ID;
		const Standard_GUID & ID();

		/****** TDataStd_Integer::IsCaptured ******/
		/****** md5 signature: cf2f28168b4c46b554434756df96061d ******/
		%feature("compactdefaultargs") IsCaptured;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if there is a reference on the same label.
") IsCaptured;
		bool IsCaptured();

		/****** TDataStd_Integer::NewEmpty ******/
		/****** md5 signature: 4ebad80fa2cacb9f9e231bbb83a29a98 ******/
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "Return
-------
opencascade::handle<TDF_Attribute>

Description
-----------
No available documentation.
") NewEmpty;
		opencascade::handle<TDF_Attribute> NewEmpty();

		/****** TDataStd_Integer::Paste ******/
		/****** md5 signature: bfece7a0e37cb5034ac0b2a8c488da37 ******/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "
Parameters
----------
Into: TDF_Attribute
RT: TDF_RelocationTable

Return
-------
None

Description
-----------
No available documentation.
") Paste;
		void Paste(const opencascade::handle<TDF_Attribute> & Into, const opencascade::handle<TDF_RelocationTable> & RT);

		/****** TDataStd_Integer::Restore ******/
		/****** md5 signature: 8bde8d15cc1907242b8c43fe6eb18f19 ******/
		%feature("compactdefaultargs") Restore;
		%feature("autodoc", "
Parameters
----------
With: TDF_Attribute

Return
-------
None

Description
-----------
No available documentation.
") Restore;
		void Restore(const opencascade::handle<TDF_Attribute> & With);

		/****** TDataStd_Integer::Set ******/
		/****** md5 signature: e830f671dfe5b5fdb4019d34bf54292a ******/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "
Parameters
----------
label: TDF_Label
value: int

Return
-------
opencascade::handle<TDataStd_Integer>

Description
-----------
Finds, or creates, an Integer attribute and sets <value> the Integer attribute is returned.
") Set;
		static opencascade::handle<TDataStd_Integer> Set(const TDF_Label & label, const int value);

		/****** TDataStd_Integer::Set ******/
		/****** md5 signature: bdf3ccb6b9a417e3200ae0b283b5b133 ******/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "
Parameters
----------
label: TDF_Label
guid: Standard_GUID
value: int

Return
-------
opencascade::handle<TDataStd_Integer>

Description
-----------
Finds, or creates, an Integer attribute with explicit user defined <guid> and sets <value>. The Integer attribute is returned.
") Set;
		static opencascade::handle<TDataStd_Integer> Set(const TDF_Label & label, const Standard_GUID & guid, const int value);

		/****** TDataStd_Integer::Set ******/
		/****** md5 signature: 76b4a8c39d1f4844b3fdc01b2b74ac98 ******/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "
Parameters
----------
V: int

Return
-------
None

Description
-----------
Integer methods ===============.
") Set;
		void Set(const int V);

		/****** TDataStd_Integer::SetID ******/
		/****** md5 signature: 64789516907731f72c16acfd42a0f70f ******/
		%feature("compactdefaultargs") SetID;
		%feature("autodoc", "
Parameters
----------
guid: Standard_GUID

Return
-------
None

Description
-----------
Sets the explicit GUID (user defined) for the attribute.
") SetID;
		void SetID(const Standard_GUID & guid);

		/****** TDataStd_Integer::SetID ******/
		/****** md5 signature: 1c04912b49b7be6319020f1d75526111 ******/
		%feature("compactdefaultargs") SetID;
		%feature("autodoc", "Return
-------
None

Description
-----------
Sets default GUID for the attribute.
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
		/****** TDataStd_IntegerArray::TDataStd_IntegerArray ******/
		/****** md5 signature: 706638100b3f6adc9decce72f072c950 ******/
		%feature("compactdefaultargs") TDataStd_IntegerArray;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") TDataStd_IntegerArray;
		 TDataStd_IntegerArray();

		/****** TDataStd_IntegerArray::Array ******/
		/****** md5 signature: 3ac6c5ff6faadd4fa7ebd9ab99090f27 ******/
		%feature("compactdefaultargs") Array;
		%feature("autodoc", "Return
-------
opencascade::handle<NCollection_HArray1<int>>

Description
-----------
Return the inner array of the IntegerArray attribute.
") Array;
		const opencascade::handle<NCollection_HArray1<int>> & Array();

		/****** TDataStd_IntegerArray::ChangeArray ******/
		/****** md5 signature: b76f2a5f24bace08a34c441cd87057b6 ******/
		%feature("compactdefaultargs") ChangeArray;
		%feature("autodoc", "
Parameters
----------
newArray: NCollection_HArray1<int
isCheckItems: bool (optional, default to true)

Return
-------
None

Description
-----------
Sets the inner array <myValue> of the IntegerArray attribute to <newArray>. If value of <newArray> differs from <myValue>, Backup performed and myValue refers to new instance of HArray1OfInteger that holds <newArray> values If <isCheckItems> equal True each item of <newArray> will be checked with each item of <myValue> for coincidence (to avoid backup).
") ChangeArray;
		void ChangeArray(const opencascade::handle<NCollection_HArray1<int> > & newArray, const bool isCheckItems = true);

		/****** TDataStd_IntegerArray::DeltaOnModification ******/
		/****** md5 signature: dcdd915c66595b49f08644d07738621a ******/
		%feature("compactdefaultargs") DeltaOnModification;
		%feature("autodoc", "
Parameters
----------
anOldAttribute: TDF_Attribute

Return
-------
opencascade::handle<TDF_DeltaOnModification>

Description
-----------
Makes a DeltaOnModification between <self> and <anOldAttribute>.
") DeltaOnModification;
		opencascade::handle<TDF_DeltaOnModification> DeltaOnModification(const opencascade::handle<TDF_Attribute> & anOldAttribute);

		/****** TDataStd_IntegerArray::Dump ******/
		/****** md5 signature: c3832f0735de2bdac14af95fe6ce7de3 ******/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "
Parameters
----------

Return
-------
anOS: Standard_OStream

Description
-----------
No available documentation.
") Dump;
		Standard_OStream & Dump(std::ostream &OutValue);


        /****************** DumpJson ******************/
        %feature("autodoc", "
Parameters
----------
depth: int, default=-1

Return
-------
str

Description
-----------
Dump the object to JSON string.
") DumpJson;
        %extend{
            std::string DumpJson(int depth=-1) {
            std::stringstream s;
            self->DumpJson(s, depth);
            return "{" + s.str() + "}" ;}
        };
		/****** TDataStd_IntegerArray::GetDelta ******/
		/****** md5 signature: 48d284b77526180b9fca72a2b1a82618 ******/
		%feature("compactdefaultargs") GetDelta;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") GetDelta;
		bool GetDelta();

		/****** TDataStd_IntegerArray::GetID ******/
		/****** md5 signature: afe6002d90f641ca3ea8c9ae9f8fe97c ******/
		%feature("compactdefaultargs") GetID;
		%feature("autodoc", "Return
-------
Standard_GUID

Description
-----------
class methods ============= Returns the GUID for arrays of integers.
") GetID;
		static const Standard_GUID & GetID();

		/****** TDataStd_IntegerArray::ID ******/
		/****** md5 signature: 90e2a7836a98c0274891df8231c5ae76 ******/
		%feature("compactdefaultargs") ID;
		%feature("autodoc", "Return
-------
Standard_GUID

Description
-----------
No available documentation.
") ID;
		const Standard_GUID & ID();

		/****** TDataStd_IntegerArray::Init ******/
		/****** md5 signature: 9817520653ab29d149c0b92193743f1d ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
lower: int
upper: int

Return
-------
None

Description
-----------
Initialize the inner array with bounds from <lower> to <upper>.
") Init;
		void Init(const int lower, const int upper);

		/****** TDataStd_IntegerArray::Length ******/
		/****** md5 signature: f07a384d0f09ac6092cb8ed89442c8a8 ******/
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the length of this array of integers in terms of the number of elements it contains.
") Length;
		int Length();

		/****** TDataStd_IntegerArray::Lower ******/
		/****** md5 signature: ed303acc20e6a8f86d94712204278487 ******/
		%feature("compactdefaultargs") Lower;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the lower boundary of this array of integers.
") Lower;
		int Lower();

		/****** TDataStd_IntegerArray::NewEmpty ******/
		/****** md5 signature: 4ebad80fa2cacb9f9e231bbb83a29a98 ******/
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "Return
-------
opencascade::handle<TDF_Attribute>

Description
-----------
No available documentation.
") NewEmpty;
		opencascade::handle<TDF_Attribute> NewEmpty();

		/****** TDataStd_IntegerArray::Paste ******/
		/****** md5 signature: bfece7a0e37cb5034ac0b2a8c488da37 ******/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "
Parameters
----------
Into: TDF_Attribute
RT: TDF_RelocationTable

Return
-------
None

Description
-----------
Note. Uses inside ChangeArray() method.
") Paste;
		void Paste(const opencascade::handle<TDF_Attribute> & Into, const opencascade::handle<TDF_RelocationTable> & RT);

		/****** TDataStd_IntegerArray::Restore ******/
		/****** md5 signature: 8bde8d15cc1907242b8c43fe6eb18f19 ******/
		%feature("compactdefaultargs") Restore;
		%feature("autodoc", "
Parameters
----------
With: TDF_Attribute

Return
-------
None

Description
-----------
No available documentation.
") Restore;
		void Restore(const opencascade::handle<TDF_Attribute> & With);

		/****** TDataStd_IntegerArray::Set ******/
		/****** md5 signature: 83a9c6d7e70c57c9d1204ef82817bcdb ******/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "
Parameters
----------
label: TDF_Label
lower: int
upper: int
isDelta: bool (optional, default to false)

Return
-------
opencascade::handle<TDataStd_IntegerArray>

Description
-----------
Finds or creates on the <label> an integer array attribute with the specified <lower> and <upper> boundaries. If <isDelta> == False, DefaultDeltaOnModification is used. If <isDelta> == True, DeltaOnModification of the current attribute is used. If attribute is already set, all input parameters are refused and the found attribute is returned.
") Set;
		static opencascade::handle<TDataStd_IntegerArray> Set(const TDF_Label & label, const int lower, const int upper, const bool isDelta = false);

		/****** TDataStd_IntegerArray::Set ******/
		/****** md5 signature: 146635a533c16705c6767d77721e7cc0 ******/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "
Parameters
----------
label: TDF_Label
theGuid: Standard_GUID
lower: int
upper: int
isDelta: bool (optional, default to false)

Return
-------
opencascade::handle<TDataStd_IntegerArray>

Description
-----------
Finds, or creates, an IntegerArray attribute with explicit user defined <guid>. The IntegerArray attribute is returned.
") Set;
		static opencascade::handle<TDataStd_IntegerArray> Set(const TDF_Label & label, const Standard_GUID & theGuid, const int lower, const int upper, const bool isDelta = false);

		/****** TDataStd_IntegerArray::SetDelta ******/
		/****** md5 signature: ed3080f13a07eb95c0be3f5630b6c6b3 ******/
		%feature("compactdefaultargs") SetDelta;
		%feature("autodoc", "
Parameters
----------
isDelta: bool

Return
-------
None

Description
-----------
for internal use only!.
") SetDelta;
		void SetDelta(const bool isDelta);

		/****** TDataStd_IntegerArray::SetID ******/
		/****** md5 signature: 07ce9c4a6ca92424a2ebf50c156bd3b5 ******/
		%feature("compactdefaultargs") SetID;
		%feature("autodoc", "
Parameters
----------
theGuid: Standard_GUID

Return
-------
None

Description
-----------
Sets the explicit GUID (user defined) for the attribute.
") SetID;
		void SetID(const Standard_GUID & theGuid);

		/****** TDataStd_IntegerArray::SetID ******/
		/****** md5 signature: 1c04912b49b7be6319020f1d75526111 ******/
		%feature("compactdefaultargs") SetID;
		%feature("autodoc", "Return
-------
None

Description
-----------
Sets default GUID for the attribute.
") SetID;
		void SetID();

		/****** TDataStd_IntegerArray::SetValue ******/
		/****** md5 signature: e20e3c4bec5b2d07c5a46a22ba90cb46 ******/
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "
Parameters
----------
Index: int
Value: int

Return
-------
None

Description
-----------
Sets the <Index>th element of the array to <Value> OutOfRange exception is raised if <Index> doesn't respect Lower and Upper bounds of the internal array.
") SetValue;
		void SetValue(const int Index, const int Value);

		/****** TDataStd_IntegerArray::Upper ******/
		/****** md5 signature: a53a7ba7d20e7ec35b8de8d721ea431d ******/
		%feature("compactdefaultargs") Upper;
		%feature("autodoc", "Return
-------
int

Description
-----------
Return the upper boundary of this array of integers.
") Upper;
		int Upper();

		/****** TDataStd_IntegerArray::Value ******/
		/****** md5 signature: 426a56d79fbcc8276c5f22fe754d6d82 ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
int

Description
-----------
Return the value of the <Index>th element of the array.
") Value;
		int Value(const int Index);

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
		/****** TDataStd_IntegerList::TDataStd_IntegerList ******/
		/****** md5 signature: 0df1536880a297e3370d9e9e26d824a7 ******/
		%feature("compactdefaultargs") TDataStd_IntegerList;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") TDataStd_IntegerList;
		 TDataStd_IntegerList();

		/****** TDataStd_IntegerList::Append ******/
		/****** md5 signature: a0bcfcea0d11db2254b413a5e26e7037 ******/
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "
Parameters
----------
value: int

Return
-------
None

Description
-----------
No available documentation.
") Append;
		void Append(const int value);

		/****** TDataStd_IntegerList::Clear ******/
		/****** md5 signature: ae54be580b423a6eadbe062e0bdb44c2 ******/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Clear;
		void Clear();

		/****** TDataStd_IntegerList::Dump ******/
		/****** md5 signature: c3832f0735de2bdac14af95fe6ce7de3 ******/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "
Parameters
----------

Return
-------
anOS: Standard_OStream

Description
-----------
No available documentation.
") Dump;
		Standard_OStream & Dump(std::ostream &OutValue);


        /****************** DumpJson ******************/
        %feature("autodoc", "
Parameters
----------
depth: int, default=-1

Return
-------
str

Description
-----------
Dump the object to JSON string.
") DumpJson;
        %extend{
            std::string DumpJson(int depth=-1) {
            std::stringstream s;
            self->DumpJson(s, depth);
            return "{" + s.str() + "}" ;}
        };
		/****** TDataStd_IntegerList::Extent ******/
		/****** md5 signature: 1c9a99c4f72ae2188a5b950ee752d850 ******/
		%feature("compactdefaultargs") Extent;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") Extent;
		int Extent();

		/****** TDataStd_IntegerList::First ******/
		/****** md5 signature: 9976e21cdb70063ea164065ef482c38d ******/
		%feature("compactdefaultargs") First;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") First;
		int First();

		/****** TDataStd_IntegerList::GetID ******/
		/****** md5 signature: afe6002d90f641ca3ea8c9ae9f8fe97c ******/
		%feature("compactdefaultargs") GetID;
		%feature("autodoc", "Return
-------
Standard_GUID

Description
-----------
Static methods ============== Returns the ID of the list of integer attribute.
") GetID;
		static const Standard_GUID & GetID();

		/****** TDataStd_IntegerList::ID ******/
		/****** md5 signature: 90e2a7836a98c0274891df8231c5ae76 ******/
		%feature("compactdefaultargs") ID;
		%feature("autodoc", "Return
-------
Standard_GUID

Description
-----------
No available documentation.
") ID;
		const Standard_GUID & ID();

		/****** TDataStd_IntegerList::InsertAfter ******/
		/****** md5 signature: 71f4af299488b556303f54d97f41d60e ******/
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "
Parameters
----------
value: int
after_value: int

Return
-------
bool

Description
-----------
Inserts the <value> after the first meet of <after_value>.
") InsertAfter;
		bool InsertAfter(const int value, const int after_value);

		/****** TDataStd_IntegerList::InsertAfterByIndex ******/
		/****** md5 signature: 36f7a7cd493a4b95ccb2f058e17320cb ******/
		%feature("compactdefaultargs") InsertAfterByIndex;
		%feature("autodoc", "
Parameters
----------
index: int
after_value: int

Return
-------
bool

Description
-----------
Inserts the <value> after the <index> position. The indices start with 1 .. Extent().
") InsertAfterByIndex;
		bool InsertAfterByIndex(const int index, const int after_value);

		/****** TDataStd_IntegerList::InsertBefore ******/
		/****** md5 signature: 2e9864147df7d785ba1b898ea584da4b ******/
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "
Parameters
----------
value: int
before_value: int

Return
-------
bool

Description
-----------
Inserts the <value> before the first meet of <before_value>.
") InsertBefore;
		bool InsertBefore(const int value, const int before_value);

		/****** TDataStd_IntegerList::InsertBeforeByIndex ******/
		/****** md5 signature: 2ab0b3bf2efe1d81a710be01466cdc47 ******/
		%feature("compactdefaultargs") InsertBeforeByIndex;
		%feature("autodoc", "
Parameters
----------
index: int
before_value: int

Return
-------
bool

Description
-----------
Inserts the <value> before the <index> position. The indices start with 1 .. Extent().
") InsertBeforeByIndex;
		bool InsertBeforeByIndex(const int index, const int before_value);

		/****** TDataStd_IntegerList::IsEmpty ******/
		/****** md5 signature: 03c43b1186186edcd7d757f16ac1f505 ******/
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsEmpty;
		bool IsEmpty();

		/****** TDataStd_IntegerList::Last ******/
		/****** md5 signature: 205142323c0fda3122bd3306b13c1b5e ******/
		%feature("compactdefaultargs") Last;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") Last;
		int Last();

		/****** TDataStd_IntegerList::List ******/
		/****** md5 signature: ad47c2b9326a15179c03efbac077ad1d ******/
		%feature("compactdefaultargs") List;
		%feature("autodoc", "Return
-------
NCollection_List<int>

Description
-----------
No available documentation.
") List;
		const NCollection_List<int> & List();

		/****** TDataStd_IntegerList::NewEmpty ******/
		/****** md5 signature: 4ebad80fa2cacb9f9e231bbb83a29a98 ******/
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "Return
-------
opencascade::handle<TDF_Attribute>

Description
-----------
No available documentation.
") NewEmpty;
		opencascade::handle<TDF_Attribute> NewEmpty();

		/****** TDataStd_IntegerList::Paste ******/
		/****** md5 signature: bfece7a0e37cb5034ac0b2a8c488da37 ******/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "
Parameters
----------
Into: TDF_Attribute
RT: TDF_RelocationTable

Return
-------
None

Description
-----------
No available documentation.
") Paste;
		void Paste(const opencascade::handle<TDF_Attribute> & Into, const opencascade::handle<TDF_RelocationTable> & RT);

		/****** TDataStd_IntegerList::Prepend ******/
		/****** md5 signature: ba30a6ae8f7fc984860a79e5829e0f5d ******/
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "
Parameters
----------
value: int

Return
-------
None

Description
-----------
No available documentation.
") Prepend;
		void Prepend(const int value);

		/****** TDataStd_IntegerList::Remove ******/
		/****** md5 signature: 142b40d34f9476f3c47f84ebd6da3f87 ******/
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "
Parameters
----------
value: int

Return
-------
bool

Description
-----------
Removes the first meet of the <value>.
") Remove;
		bool Remove(const int value);

		/****** TDataStd_IntegerList::RemoveByIndex ******/
		/****** md5 signature: 9b68125fdff25de6dfd4bb3d97245836 ******/
		%feature("compactdefaultargs") RemoveByIndex;
		%feature("autodoc", "
Parameters
----------
index: int

Return
-------
bool

Description
-----------
Removes a value at <index> position.
") RemoveByIndex;
		bool RemoveByIndex(const int index);

		/****** TDataStd_IntegerList::Restore ******/
		/****** md5 signature: 8bde8d15cc1907242b8c43fe6eb18f19 ******/
		%feature("compactdefaultargs") Restore;
		%feature("autodoc", "
Parameters
----------
With: TDF_Attribute

Return
-------
None

Description
-----------
No available documentation.
") Restore;
		void Restore(const opencascade::handle<TDF_Attribute> & With);

		/****** TDataStd_IntegerList::Set ******/
		/****** md5 signature: 0080ea7602a11fe85e3a98252ab54b21 ******/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "
Parameters
----------
label: TDF_Label

Return
-------
opencascade::handle<TDataStd_IntegerList>

Description
-----------
Finds or creates a list of integer values attribute.
") Set;
		static opencascade::handle<TDataStd_IntegerList> Set(const TDF_Label & label);

		/****** TDataStd_IntegerList::Set ******/
		/****** md5 signature: ba70c86f1a85366d39edc3cf10d53734 ******/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "
Parameters
----------
label: TDF_Label
theGuid: Standard_GUID

Return
-------
opencascade::handle<TDataStd_IntegerList>

Description
-----------
Finds or creates a list of integer values attribute with explicit user defined <guid>.
") Set;
		static opencascade::handle<TDataStd_IntegerList> Set(const TDF_Label & label, const Standard_GUID & theGuid);

		/****** TDataStd_IntegerList::SetID ******/
		/****** md5 signature: 07ce9c4a6ca92424a2ebf50c156bd3b5 ******/
		%feature("compactdefaultargs") SetID;
		%feature("autodoc", "
Parameters
----------
theGuid: Standard_GUID

Return
-------
None

Description
-----------
Sets the explicit GUID (user defined) for the attribute.
") SetID;
		void SetID(const Standard_GUID & theGuid);

		/****** TDataStd_IntegerList::SetID ******/
		/****** md5 signature: 1c04912b49b7be6319020f1d75526111 ******/
		%feature("compactdefaultargs") SetID;
		%feature("autodoc", "Return
-------
None

Description
-----------
Sets default GUID for the attribute.
") SetID;
		void SetID();

};


%make_alias(TDataStd_IntegerList)

%extend TDataStd_IntegerList {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************
* class TDataStd_NamedData *
***************************/
class TDataStd_NamedData : public TDF_Attribute {
	public:
		/****** TDataStd_NamedData::TDataStd_NamedData ******/
		/****** md5 signature: 2d40f04eab0a5d40041eb0d605cfe90e ******/
		%feature("compactdefaultargs") TDataStd_NamedData;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") TDataStd_NamedData;
		 TDataStd_NamedData();

		/****** TDataStd_NamedData::ChangeArraysOfIntegers ******/
		/****** md5 signature: 01783afecaade2d455f428d29f9488bb ******/
		%feature("compactdefaultargs") ChangeArraysOfIntegers;
		%feature("autodoc", "
Parameters
----------
theArraysOfIntegers: NCollection_HArray1<int

Return
-------
None

Description
-----------
Replace the container content by new content of the <theArraysOfIntegers>.
") ChangeArraysOfIntegers;
		void ChangeArraysOfIntegers(const NCollection_DataMap<TCollection_ExtendedString, opencascade::handle<NCollection_HArray1<int> > > & theArraysOfIntegers);

		/****** TDataStd_NamedData::ChangeArraysOfReals ******/
		/****** md5 signature: 9e06093b825e9d701cc4370a47d40532 ******/
		%feature("compactdefaultargs") ChangeArraysOfReals;
		%feature("autodoc", "
Parameters
----------
theArraysOfReals: NCollection_HArray1<double

Return
-------
None

Description
-----------
Replace the container content by new content of the <theArraysOfReals>.
") ChangeArraysOfReals;
		void ChangeArraysOfReals(const NCollection_DataMap<TCollection_ExtendedString, opencascade::handle<NCollection_HArray1<double> > > & theArraysOfReals);

		/****** TDataStd_NamedData::ChangeBytes ******/
		/****** md5 signature: eccf66fe581c6a433ab10fefcf0f1873 ******/
		%feature("compactdefaultargs") ChangeBytes;
		%feature("autodoc", "
Parameters
----------
theBytes: NCollection_DataMap<TCollection_ExtendedString, uint8_t>

Return
-------
None

Description
-----------
Replace the container content by new content of the <theBytes>.
") ChangeBytes;
		void ChangeBytes(const NCollection_DataMap<TCollection_ExtendedString, uint8_t> & theBytes);

		/****** TDataStd_NamedData::ChangeIntegers ******/
		/****** md5 signature: b423bf2099cf0e6df5607c0a7e646d11 ******/
		%feature("compactdefaultargs") ChangeIntegers;
		%feature("autodoc", "
Parameters
----------
theIntegers: NCollection_DataMap<TCollection_ExtendedString, int>

Return
-------
None

Description
-----------
Replace the container content by new content of the <theIntegers>.
") ChangeIntegers;
		void ChangeIntegers(const NCollection_DataMap<TCollection_ExtendedString, int> & theIntegers);

		/****** TDataStd_NamedData::ChangeReals ******/
		/****** md5 signature: 968451bd143cf17065b6651dc131092b ******/
		%feature("compactdefaultargs") ChangeReals;
		%feature("autodoc", "
Parameters
----------
theReals: NCollection_DataMap<TCollection_ExtendedString, double>

Return
-------
None

Description
-----------
Replace the container content by new content of the <theReals>.
") ChangeReals;
		void ChangeReals(const NCollection_DataMap<TCollection_ExtendedString, double> & theReals);

		/****** TDataStd_NamedData::ChangeStrings ******/
		/****** md5 signature: 03a31a6b82edb86ef1840d5c7829bebf ******/
		%feature("compactdefaultargs") ChangeStrings;
		%feature("autodoc", "
Parameters
----------
theStrings: NCollection_DataMap<TCollection_ExtendedString, TCollection_ExtendedString>

Return
-------
None

Description
-----------
Replace the container content by new content of the <theStrings>.
") ChangeStrings;
		void ChangeStrings(const NCollection_DataMap<TCollection_ExtendedString, TCollection_ExtendedString> & theStrings);

		/****** TDataStd_NamedData::Clear ******/
		/****** md5 signature: 75abd67f132413fc11c19201aabf1126 ******/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "Return
-------
None

Description
-----------
Clear data.
") Clear;
		void Clear();

		/****** TDataStd_NamedData::Dump ******/
		/****** md5 signature: c3832f0735de2bdac14af95fe6ce7de3 ******/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "
Parameters
----------

Return
-------
anOS: Standard_OStream

Description
-----------
No available documentation.
") Dump;
		Standard_OStream & Dump(std::ostream &OutValue);


        /****************** DumpJson ******************/
        %feature("autodoc", "
Parameters
----------
depth: int, default=-1

Return
-------
str

Description
-----------
Dump the object to JSON string.
") DumpJson;
        %extend{
            std::string DumpJson(int depth=-1) {
            std::stringstream s;
            self->DumpJson(s, depth);
            return "{" + s.str() + "}" ;}
        };
		/****** TDataStd_NamedData::GetArrayOfIntegers ******/
		/****** md5 signature: 68be4e2e4a8dee686a4d7d06ba8596a1 ******/
		%feature("compactdefaultargs") GetArrayOfIntegers;
		%feature("autodoc", "
Parameters
----------
theName: str

Return
-------
opencascade::handle<NCollection_HArray1<int>>

Description
-----------
Returns the named array of integer values. It returns a NULL Handle if there is no such a named array of integers (use HasArrayOfIntegers()).
") GetArrayOfIntegers;
		const opencascade::handle<NCollection_HArray1<int>> & GetArrayOfIntegers(TCollection_ExtendedString theName);

		/****** TDataStd_NamedData::GetArrayOfReals ******/
		/****** md5 signature: 4b07348b7ff7e8d6afa3b42f8c59b9d6 ******/
		%feature("compactdefaultargs") GetArrayOfReals;
		%feature("autodoc", "
Parameters
----------
theName: str

Return
-------
opencascade::handle<NCollection_HArray1<double>>

Description
-----------
Returns the named array of real values. It returns a NULL Handle if there is no such a named array of reals (use HasArrayOfReals()).
") GetArrayOfReals;
		const opencascade::handle<NCollection_HArray1<double>> & GetArrayOfReals(TCollection_ExtendedString theName);

		/****** TDataStd_NamedData::GetArraysOfIntegersContainer ******/
		/****** md5 signature: cf977acc7f469d36984569613d43db4a ******/
		%feature("compactdefaultargs") GetArraysOfIntegersContainer;
		%feature("autodoc", "Return
-------
NCollection_DataMap<TCollection_ExtendedString, opencascade::handle<NCollection_HArray1<int>>>

Description
-----------
Returns the internal container of named arrays of integer values.
") GetArraysOfIntegersContainer;
		const NCollection_DataMap<TCollection_ExtendedString, opencascade::handle<NCollection_HArray1<int>>> & GetArraysOfIntegersContainer();

		/****** TDataStd_NamedData::GetArraysOfRealsContainer ******/
		/****** md5 signature: 61ebbbc5b18d4639a6832102c99db856 ******/
		%feature("compactdefaultargs") GetArraysOfRealsContainer;
		%feature("autodoc", "Return
-------
NCollection_DataMap<TCollection_ExtendedString, opencascade::handle<NCollection_HArray1<double>>>

Description
-----------
Returns the internal container of named arrays of real values.
") GetArraysOfRealsContainer;
		const NCollection_DataMap<TCollection_ExtendedString, opencascade::handle<NCollection_HArray1<double>>> & GetArraysOfRealsContainer();

		/****** TDataStd_NamedData::GetByte ******/
		/****** md5 signature: ec50a8a97fb11a6d684e0c664bad2492 ******/
		%feature("compactdefaultargs") GetByte;
		%feature("autodoc", "
Parameters
----------
theName: str

Return
-------
uint8_t

Description
-----------
Returns the named byte. It returns 0 if there is no such a named byte (use HasByte()).
") GetByte;
		uint8_t GetByte(TCollection_ExtendedString theName);

		/****** TDataStd_NamedData::GetBytesContainer ******/
		/****** md5 signature: af46b7287dafb3f2965c413cf4ffb0c7 ******/
		%feature("compactdefaultargs") GetBytesContainer;
		%feature("autodoc", "Return
-------
NCollection_DataMap<TCollection_ExtendedString, uint8_t>

Description
-----------
Returns the internal container of named bytes.
") GetBytesContainer;
		const NCollection_DataMap<TCollection_ExtendedString, uint8_t> & GetBytesContainer();

		/****** TDataStd_NamedData::GetID ******/
		/****** md5 signature: afe6002d90f641ca3ea8c9ae9f8fe97c ******/
		%feature("compactdefaultargs") GetID;
		%feature("autodoc", "Return
-------
Standard_GUID

Description
-----------
Returns the ID of the named data attribute.
") GetID;
		static const Standard_GUID & GetID();

		/****** TDataStd_NamedData::GetInteger ******/
		/****** md5 signature: 8f3f4338bed25c87d55148fbfdeee34a ******/
		%feature("compactdefaultargs") GetInteger;
		%feature("autodoc", "
Parameters
----------
theName: str

Return
-------
int

Description
-----------
Returns the integer value specified by the Name. It returns 0 if internal map doesn't contain the specified integer (use HasInteger() to check before).
") GetInteger;
		int GetInteger(TCollection_ExtendedString theName);

		/****** TDataStd_NamedData::GetIntegersContainer ******/
		/****** md5 signature: 05369bbd458091ec5769292fd92ff0fd ******/
		%feature("compactdefaultargs") GetIntegersContainer;
		%feature("autodoc", "Return
-------
NCollection_DataMap<TCollection_ExtendedString, int>

Description
-----------
Returns the internal container of named integers.
") GetIntegersContainer;
		const NCollection_DataMap<TCollection_ExtendedString, int> & GetIntegersContainer();

		/****** TDataStd_NamedData::GetReal ******/
		/****** md5 signature: 12b3ad6ec8942b8b8553a5af56c22bda ******/
		%feature("compactdefaultargs") GetReal;
		%feature("autodoc", "
Parameters
----------
theName: str

Return
-------
double

Description
-----------
Returns the named real. It returns 0.0 if there is no such a named real (use HasReal()).
") GetReal;
		double GetReal(TCollection_ExtendedString theName);

		/****** TDataStd_NamedData::GetRealsContainer ******/
		/****** md5 signature: 959506b3399d93d6ff47d9ffff7a92d4 ******/
		%feature("compactdefaultargs") GetRealsContainer;
		%feature("autodoc", "Return
-------
NCollection_DataMap<TCollection_ExtendedString, double>

Description
-----------
Returns the internal container of named reals.
") GetRealsContainer;
		const NCollection_DataMap<TCollection_ExtendedString, double> & GetRealsContainer();

		/****** TDataStd_NamedData::GetString ******/
		/****** md5 signature: 431d366e9e5181ba3f9d7b2cb04484f9 ******/
		%feature("compactdefaultargs") GetString;
		%feature("autodoc", "
Parameters
----------
theName: str

Return
-------
TCollection_ExtendedString

Description
-----------
Returns the named string. It returns an empty string if there is no such a named string (use HasString()).
") GetString;
		const TCollection_ExtendedString & GetString(TCollection_ExtendedString theName);

		/****** TDataStd_NamedData::GetStringsContainer ******/
		/****** md5 signature: 802a49ca0d08caca9ed096b9786ff325 ******/
		%feature("compactdefaultargs") GetStringsContainer;
		%feature("autodoc", "Return
-------
NCollection_DataMap<TCollection_ExtendedString, TCollection_ExtendedString>

Description
-----------
Returns the internal container of named strings.
") GetStringsContainer;
		const NCollection_DataMap<TCollection_ExtendedString, TCollection_ExtendedString> & GetStringsContainer();

		/****** TDataStd_NamedData::HasArrayOfIntegers ******/
		/****** md5 signature: f4bf7cccf14d928a4b296e2a77889a56 ******/
		%feature("compactdefaultargs") HasArrayOfIntegers;
		%feature("autodoc", "
Parameters
----------
theName: str

Return
-------
bool

Description
-----------
Returns true if the attribute contains this named array of integer values.
") HasArrayOfIntegers;
		bool HasArrayOfIntegers(TCollection_ExtendedString theName);

		/****** TDataStd_NamedData::HasArrayOfReals ******/
		/****** md5 signature: 57f87f90c31de8533f8e1c4ee915aadb ******/
		%feature("compactdefaultargs") HasArrayOfReals;
		%feature("autodoc", "
Parameters
----------
theName: str

Return
-------
bool

Description
-----------
Returns true if the attribute contains this named array of real values.
") HasArrayOfReals;
		bool HasArrayOfReals(TCollection_ExtendedString theName);

		/****** TDataStd_NamedData::HasArraysOfIntegers ******/
		/****** md5 signature: 4e4423a3ed4ad7e38136285603cc0dba ******/
		%feature("compactdefaultargs") HasArraysOfIntegers;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if there are some named arrays of integer values in the attribute.
") HasArraysOfIntegers;
		bool HasArraysOfIntegers();

		/****** TDataStd_NamedData::HasArraysOfReals ******/
		/****** md5 signature: 51a1dbc65583121cbdfe7fbac5111490 ******/
		%feature("compactdefaultargs") HasArraysOfReals;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if there are some named arrays of real values in the attribute.
") HasArraysOfReals;
		bool HasArraysOfReals();

		/****** TDataStd_NamedData::HasByte ******/
		/****** md5 signature: 98124358e9ca0ae839123d6e8142bb1b ******/
		%feature("compactdefaultargs") HasByte;
		%feature("autodoc", "
Parameters
----------
theName: str

Return
-------
bool

Description
-----------
Returns true if the attribute contains this named byte.
") HasByte;
		bool HasByte(TCollection_ExtendedString theName);

		/****** TDataStd_NamedData::HasBytes ******/
		/****** md5 signature: 06c1e291393f81ab6f406ecc90ab1368 ******/
		%feature("compactdefaultargs") HasBytes;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if there are some named bytes in the attribute.
") HasBytes;
		bool HasBytes();

		/****** TDataStd_NamedData::HasDeferredData ******/
		/****** md5 signature: bcbba61d77cd4aa53fabe373e0bdb7a0 ******/
		%feature("compactdefaultargs") HasDeferredData;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if some data is not loaded from deferred storage and can be loaded using LoadDeferredData(). //! Late-load interface allows to avoid loading auxiliary data into memory until it is needed by application and also speed up reader by skipping data chunks in file. This feature requires file format having special structure, and usually implies read-only access, therefore default implementation will return False here. //! Late-load elements require special attention to ensure data consistency, as such elements are created in undefined state (no data) and Undo/Redo mechanism will not work until deferred data being loaded. //! Usage scenarios: - Application displays model in read-only way. Late-load elements are loaded temporarily on demand and immediately unloaded. theNamedData->LoadDeferredData (true); TCollection_AsciiString aValue = theNamedData->GetString (theKey); theNamedData->UnloadDeferredData(); - Application saves the model into another format. All late-load elements should be loaded (at least temporary during operation). - Application modifies the model. Late-load element should be loaded with removed link to deferred storage, so that Undo()/Redo() will work as expected since loading. theNamedData->LoadDeferredData (false); theNamedData->SetString (theKey, theNewValue);.
") HasDeferredData;
		virtual bool HasDeferredData();

		/****** TDataStd_NamedData::HasInteger ******/
		/****** md5 signature: f500acfb628c33f3e4abdf7ab51bc8ef ******/
		%feature("compactdefaultargs") HasInteger;
		%feature("autodoc", "
Parameters
----------
theName: str

Return
-------
bool

Description
-----------
Returns true if the attribute contains specified by Name integer value.
") HasInteger;
		bool HasInteger(TCollection_ExtendedString theName);

		/****** TDataStd_NamedData::HasIntegers ******/
		/****** md5 signature: 331b1bccdc8eb46ca03377b971b19367 ******/
		%feature("compactdefaultargs") HasIntegers;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if at least one named integer value is kept in the attribute.
") HasIntegers;
		bool HasIntegers();

		/****** TDataStd_NamedData::HasReal ******/
		/****** md5 signature: 9c8da1043f976176e85595bb177c432f ******/
		%feature("compactdefaultargs") HasReal;
		%feature("autodoc", "
Parameters
----------
theName: str

Return
-------
bool

Description
-----------
Returns true if the attribute contains a real specified by Name.
") HasReal;
		bool HasReal(TCollection_ExtendedString theName);

		/****** TDataStd_NamedData::HasReals ******/
		/****** md5 signature: d532ca678cb69eed2d275ac31f133e88 ******/
		%feature("compactdefaultargs") HasReals;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if at least one named real value is kept in the attribute.
") HasReals;
		bool HasReals();

		/****** TDataStd_NamedData::HasString ******/
		/****** md5 signature: f2c0d5b8269663924b088e22b3d56079 ******/
		%feature("compactdefaultargs") HasString;
		%feature("autodoc", "
Parameters
----------
theName: str

Return
-------
bool

Description
-----------
Returns true if the attribute contains this named string.
") HasString;
		bool HasString(TCollection_ExtendedString theName);

		/****** TDataStd_NamedData::HasStrings ******/
		/****** md5 signature: 6409c610ed9e02442074418b0e5a879f ******/
		%feature("compactdefaultargs") HasStrings;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if there are some named strings in the attribute.
") HasStrings;
		bool HasStrings();

		/****** TDataStd_NamedData::ID ******/
		/****** md5 signature: 90e2a7836a98c0274891df8231c5ae76 ******/
		%feature("compactdefaultargs") ID;
		%feature("autodoc", "Return
-------
Standard_GUID

Description
-----------
No available documentation.
") ID;
		const Standard_GUID & ID();

		/****** TDataStd_NamedData::LoadDeferredData ******/
		/****** md5 signature: 928215be73fce4e024bb642935f2607c ******/
		%feature("compactdefaultargs") LoadDeferredData;
		%feature("autodoc", "
Parameters
----------
theToKeepDeferred: bool (optional, default to false)

Return
-------
bool

Description
-----------
Load data from deferred storage, without calling Backup(). As result, the content of the object will be overridden by data from deferred storage (which is normally read-only). 
Input parameter: theToKeepDeferred when True, the link to deferred storage will be preserved  so that it will be possible calling UnloadDeferredData()  afterwards for releasing memory 
Return: False if deferred storage is unavailable or deferred data has been already loaded.
") LoadDeferredData;
		virtual bool LoadDeferredData(bool theToKeepDeferred = false);

		/****** TDataStd_NamedData::NewEmpty ******/
		/****** md5 signature: 4ebad80fa2cacb9f9e231bbb83a29a98 ******/
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "Return
-------
opencascade::handle<TDF_Attribute>

Description
-----------
No available documentation.
") NewEmpty;
		opencascade::handle<TDF_Attribute> NewEmpty();

		/****** TDataStd_NamedData::Paste ******/
		/****** md5 signature: bfece7a0e37cb5034ac0b2a8c488da37 ******/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "
Parameters
----------
Into: TDF_Attribute
RT: TDF_RelocationTable

Return
-------
None

Description
-----------
No available documentation.
") Paste;
		void Paste(const opencascade::handle<TDF_Attribute> & Into, const opencascade::handle<TDF_RelocationTable> & RT);

		/****** TDataStd_NamedData::Restore ******/
		/****** md5 signature: 8bde8d15cc1907242b8c43fe6eb18f19 ******/
		%feature("compactdefaultargs") Restore;
		%feature("autodoc", "
Parameters
----------
With: TDF_Attribute

Return
-------
None

Description
-----------
No available documentation.
") Restore;
		void Restore(const opencascade::handle<TDF_Attribute> & With);

		/****** TDataStd_NamedData::Set ******/
		/****** md5 signature: ee0f0e4a73047eda396551b327a75125 ******/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "
Parameters
----------
label: TDF_Label

Return
-------
opencascade::handle<TDataStd_NamedData>

Description
-----------
Finds or creates a named data attribute.
") Set;
		static opencascade::handle<TDataStd_NamedData> Set(const TDF_Label & label);

		/****** TDataStd_NamedData::SetArrayOfIntegers ******/
		/****** md5 signature: 3f609e30d99740cb21ba02ef49e01aad ******/
		%feature("compactdefaultargs") SetArrayOfIntegers;
		%feature("autodoc", "
Parameters
----------
theName: str
theArrayOfIntegers: NCollection_HArray1<int

Return
-------
None

Description
-----------
Defines a named array of integer values. 
Input parameter: theName key 
Input parameter: theArrayOfIntegers new value, overrides existing (passed array will be copied by value!).
") SetArrayOfIntegers;
		void SetArrayOfIntegers(TCollection_ExtendedString theName, const opencascade::handle<NCollection_HArray1<int> > & theArrayOfIntegers);

		/****** TDataStd_NamedData::SetArrayOfReals ******/
		/****** md5 signature: 07dd4ccfdcec4e8f0946b17d2faa8ad6 ******/
		%feature("compactdefaultargs") SetArrayOfReals;
		%feature("autodoc", "
Parameters
----------
theName: str
theArrayOfReals: NCollection_HArray1<double

Return
-------
None

Description
-----------
Defines a named array of real values. 
Input parameter: theName key 
Input parameter: theArrayOfReals new value, overrides existing (passed array will be copied by value!).
") SetArrayOfReals;
		void SetArrayOfReals(TCollection_ExtendedString theName, const opencascade::handle<NCollection_HArray1<double> > & theArrayOfReals);

		/****** TDataStd_NamedData::SetByte ******/
		/****** md5 signature: 7dc2dc2d1d062a7821b2e285bbb970a6 ******/
		%feature("compactdefaultargs") SetByte;
		%feature("autodoc", "
Parameters
----------
theName: str
theByte: uint8_t

Return
-------
None

Description
-----------
Defines a named byte. If the byte already exists, it changes its value to <theByte>.
") SetByte;
		void SetByte(TCollection_ExtendedString theName, const uint8_t theByte);

		/****** TDataStd_NamedData::SetInteger ******/
		/****** md5 signature: dab093e8e98dc600de5f59f35391a64e ******/
		%feature("compactdefaultargs") SetInteger;
		%feature("autodoc", "
Parameters
----------
theName: str
theInteger: int

Return
-------
None

Description
-----------
Defines a named integer. If the integer already exists, it changes its value to <theInteger>.
") SetInteger;
		void SetInteger(TCollection_ExtendedString theName, const int theInteger);

		/****** TDataStd_NamedData::SetReal ******/
		/****** md5 signature: 84958fc5d0cfc03f7b67d1baf2236c45 ******/
		%feature("compactdefaultargs") SetReal;
		%feature("autodoc", "
Parameters
----------
theName: str
theReal: double

Return
-------
None

Description
-----------
Defines a named real. If the real already exists, it changes its value to <theReal>.
") SetReal;
		void SetReal(TCollection_ExtendedString theName, const double theReal);

		/****** TDataStd_NamedData::SetString ******/
		/****** md5 signature: a95bad6b9ababf6273e290a39194b37c ******/
		%feature("compactdefaultargs") SetString;
		%feature("autodoc", "
Parameters
----------
theName: str
theString: str

Return
-------
None

Description
-----------
Defines a named string. If the string already exists, it changes its value to <theString>.
") SetString;
		void SetString(TCollection_ExtendedString theName, TCollection_ExtendedString theString);

		/****** TDataStd_NamedData::UnloadDeferredData ******/
		/****** md5 signature: d80868dff34b2caeb404e101256d554e ******/
		%feature("compactdefaultargs") UnloadDeferredData;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Releases data if object has connected deferred storage, without calling Backup(). WARNING! This operation does not unload modifications to deferred storage (normally it is read-only), so that modifications will be discarded (if any). 
Return: False if object has no deferred data.
") UnloadDeferredData;
		virtual bool UnloadDeferredData();

		/****** TDataStd_NamedData::clear ******/
		/****** md5 signature: ae54be580b423a6eadbe062e0bdb44c2 ******/
		%feature("compactdefaultargs") clear;
		%feature("autodoc", "Return
-------
None

Description
-----------
Clear data without calling Backup().
") clear;
		void clear();

		/****** TDataStd_NamedData::setArrayOfIntegers ******/
		/****** md5 signature: 64d6f72c6d30d80be3201668e11fbdac ******/
		%feature("compactdefaultargs") setArrayOfIntegers;
		%feature("autodoc", "
Parameters
----------
theName: str
theArrayOfIntegers: NCollection_HArray1<int

Return
-------
None

Description
-----------
Defines a named array of integer values (without calling Backup).
") setArrayOfIntegers;
		void setArrayOfIntegers(TCollection_ExtendedString theName, const opencascade::handle<NCollection_HArray1<int> > & theArrayOfIntegers);

		/****** TDataStd_NamedData::setArrayOfReals ******/
		/****** md5 signature: 7a4fcc8d7aa64ea98538e17af71d95b6 ******/
		%feature("compactdefaultargs") setArrayOfReals;
		%feature("autodoc", "
Parameters
----------
theName: str
theArrayOfReals: NCollection_HArray1<double

Return
-------
None

Description
-----------
Defines a named array of real values (without calling Backup).
") setArrayOfReals;
		void setArrayOfReals(TCollection_ExtendedString theName, const opencascade::handle<NCollection_HArray1<double> > & theArrayOfReals);

		/****** TDataStd_NamedData::setByte ******/
		/****** md5 signature: 7dc2dc2d1d062a7821b2e285bbb970a6 ******/
		%feature("compactdefaultargs") setByte;
		%feature("autodoc", "
Parameters
----------
theName: str
theByte: uint8_t

Return
-------
None

Description
-----------
Defines a named byte (without calling Backup).
") setByte;
		void setByte(TCollection_ExtendedString theName, const uint8_t theByte);

		/****** TDataStd_NamedData::setInteger ******/
		/****** md5 signature: dab093e8e98dc600de5f59f35391a64e ******/
		%feature("compactdefaultargs") setInteger;
		%feature("autodoc", "
Parameters
----------
theName: str
theInteger: int

Return
-------
None

Description
-----------
Defines a named integer (without calling Backup).
") setInteger;
		void setInteger(TCollection_ExtendedString theName, const int theInteger);

		/****** TDataStd_NamedData::setReal ******/
		/****** md5 signature: 84958fc5d0cfc03f7b67d1baf2236c45 ******/
		%feature("compactdefaultargs") setReal;
		%feature("autodoc", "
Parameters
----------
theName: str
theReal: double

Return
-------
None

Description
-----------
Defines a named real (without calling Backup).
") setReal;
		void setReal(TCollection_ExtendedString theName, const double theReal);

		/****** TDataStd_NamedData::setString ******/
		/****** md5 signature: a95bad6b9ababf6273e290a39194b37c ******/
		%feature("compactdefaultargs") setString;
		%feature("autodoc", "
Parameters
----------
theName: str
theString: str

Return
-------
None

Description
-----------
Defines a named string (without calling Backup).
") setString;
		void setString(TCollection_ExtendedString theName, TCollection_ExtendedString theString);

};


%make_alias(TDataStd_NamedData)

%extend TDataStd_NamedData {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************
* class TDataStd_Real *
**********************/
class TDataStd_Real : public TDF_Attribute {
	public:
		/****** TDataStd_Real::TDataStd_Real ******/
		/****** md5 signature: 1b268198c9b981bf2466bac3ef98f3b2 ******/
		%feature("compactdefaultargs") TDataStd_Real;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") TDataStd_Real;
		 TDataStd_Real();

		/****** TDataStd_Real::Dump ******/
		/****** md5 signature: c3832f0735de2bdac14af95fe6ce7de3 ******/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "
Parameters
----------

Return
-------
anOS: Standard_OStream

Description
-----------
No available documentation.
") Dump;
		Standard_OStream & Dump(std::ostream &OutValue);


        /****************** DumpJson ******************/
        %feature("autodoc", "
Parameters
----------
depth: int, default=-1

Return
-------
str

Description
-----------
Dump the object to JSON string.
") DumpJson;
        %extend{
            std::string DumpJson(int depth=-1) {
            std::stringstream s;
            self->DumpJson(s, depth);
            return "{" + s.str() + "}" ;}
        };
		/****** TDataStd_Real::Get ******/
		/****** md5 signature: cdec7cab9884d7fced97581bfac75b03 ******/
		%feature("compactdefaultargs") Get;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns the real number value contained in the attribute.
") Get;
		double Get();

		/****** TDataStd_Real::GetDimension ******/
		/****** md5 signature: 853aef0fdf2cdedcc5c6a512c960301d ******/
		%feature("compactdefaultargs") GetDimension;
		%feature("autodoc", "Return
-------
TDataStd_RealEnum

Description
-----------
No available documentation.
") GetDimension;
		TDataStd_RealEnum GetDimension();

		/****** TDataStd_Real::GetID ******/
		/****** md5 signature: afe6002d90f641ca3ea8c9ae9f8fe97c ******/
		%feature("compactdefaultargs") GetID;
		%feature("autodoc", "Return
-------
Standard_GUID

Description
-----------
class methods ============= Returns the default GUID for real numbers.
") GetID;
		static const Standard_GUID & GetID();

		/****** TDataStd_Real::ID ******/
		/****** md5 signature: 90e2a7836a98c0274891df8231c5ae76 ******/
		%feature("compactdefaultargs") ID;
		%feature("autodoc", "Return
-------
Standard_GUID

Description
-----------
No available documentation.
") ID;
		const Standard_GUID & ID();

		/****** TDataStd_Real::IsCaptured ******/
		/****** md5 signature: cf2f28168b4c46b554434756df96061d ******/
		%feature("compactdefaultargs") IsCaptured;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if there is a reference on the same label.
") IsCaptured;
		bool IsCaptured();

		/****** TDataStd_Real::NewEmpty ******/
		/****** md5 signature: 4ebad80fa2cacb9f9e231bbb83a29a98 ******/
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "Return
-------
opencascade::handle<TDF_Attribute>

Description
-----------
No available documentation.
") NewEmpty;
		opencascade::handle<TDF_Attribute> NewEmpty();

		/****** TDataStd_Real::Paste ******/
		/****** md5 signature: bfece7a0e37cb5034ac0b2a8c488da37 ******/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "
Parameters
----------
Into: TDF_Attribute
RT: TDF_RelocationTable

Return
-------
None

Description
-----------
No available documentation.
") Paste;
		void Paste(const opencascade::handle<TDF_Attribute> & Into, const opencascade::handle<TDF_RelocationTable> & RT);

		/****** TDataStd_Real::Restore ******/
		/****** md5 signature: 8bde8d15cc1907242b8c43fe6eb18f19 ******/
		%feature("compactdefaultargs") Restore;
		%feature("autodoc", "
Parameters
----------
With: TDF_Attribute

Return
-------
None

Description
-----------
No available documentation.
") Restore;
		void Restore(const opencascade::handle<TDF_Attribute> & With);

		/****** TDataStd_Real::Set ******/
		/****** md5 signature: e51fb0b1abfcefa757d2ddf6e9dd3003 ******/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "
Parameters
----------
label: TDF_Label
value: double

Return
-------
opencascade::handle<TDataStd_Real>

Description
-----------
Finds, or creates, a Real attribute with default GUID and sets <value>. The Real attribute is returned. The Real dimension is Scalar by default. Use SetDimension to overwrite. Real methods ============.
") Set;
		static opencascade::handle<TDataStd_Real> Set(const TDF_Label & label, const double value);

		/****** TDataStd_Real::Set ******/
		/****** md5 signature: 930617982f7b67acef92fe02f080a7e3 ******/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "
Parameters
----------
label: TDF_Label
guid: Standard_GUID
value: double

Return
-------
opencascade::handle<TDataStd_Real>

Description
-----------
Finds, or creates, a Real attribute with explicit GUID and sets <value>. The Real attribute is returned. Real methods ============.
") Set;
		static opencascade::handle<TDataStd_Real> Set(const TDF_Label & label, const Standard_GUID & guid, const double value);

		/****** TDataStd_Real::Set ******/
		/****** md5 signature: 1cadab7f5c63236c1c56e965a1ebc64f ******/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "
Parameters
----------
V: double

Return
-------
None

Description
-----------
Sets the real number V.
") Set;
		void Set(const double V);

		/****** TDataStd_Real::SetDimension ******/
		/****** md5 signature: 3c462beef751a3f1526e4a72979eac82 ******/
		%feature("compactdefaultargs") SetDimension;
		%feature("autodoc", "
Parameters
----------
DIM: TDataStd_RealEnum

Return
-------
None

Description
-----------
No available documentation.
") SetDimension;
		void SetDimension(const TDataStd_RealEnum DIM);

		/****** TDataStd_Real::SetID ******/
		/****** md5 signature: 64789516907731f72c16acfd42a0f70f ******/
		%feature("compactdefaultargs") SetID;
		%feature("autodoc", "
Parameters
----------
guid: Standard_GUID

Return
-------
None

Description
-----------
Sets the explicit GUID for the attribute.
") SetID;
		void SetID(const Standard_GUID & guid);

		/****** TDataStd_Real::SetID ******/
		/****** md5 signature: 1c04912b49b7be6319020f1d75526111 ******/
		%feature("compactdefaultargs") SetID;
		%feature("autodoc", "Return
-------
None

Description
-----------
Sets default GUID for the attribute.
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
		/****** TDataStd_RealArray::TDataStd_RealArray ******/
		/****** md5 signature: 9662f533d274472ddb78bfdccfe5ef29 ******/
		%feature("compactdefaultargs") TDataStd_RealArray;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") TDataStd_RealArray;
		 TDataStd_RealArray();

		/****** TDataStd_RealArray::Array ******/
		/****** md5 signature: cea9509c05e20ff803d8442bb289aa17 ******/
		%feature("compactdefaultargs") Array;
		%feature("autodoc", "Return
-------
opencascade::handle<NCollection_HArray1<double>>

Description
-----------
Returns the handle of this array of reals.
") Array;
		const opencascade::handle<NCollection_HArray1<double>> & Array();

		/****** TDataStd_RealArray::ChangeArray ******/
		/****** md5 signature: d5c452ac8a4e4490f7de91cf8f237c16 ******/
		%feature("compactdefaultargs") ChangeArray;
		%feature("autodoc", "
Parameters
----------
newArray: NCollection_HArray1<double
isCheckItems: bool (optional, default to true)

Return
-------
None

Description
-----------
Sets the inner array <myValue> of the RealArray attribute to <newArray>. If value of <newArray> differs from <myValue>, Backup performed and myValue refers to new instance of HArray1OfReal that holds <newArray> values If <isCheckItems> equal True each item of <newArray> will be checked with each item of <myValue> for coincidence (to avoid backup).
") ChangeArray;
		void ChangeArray(const opencascade::handle<NCollection_HArray1<double> > & newArray, const bool isCheckItems = true);

		/****** TDataStd_RealArray::DeltaOnModification ******/
		/****** md5 signature: dcdd915c66595b49f08644d07738621a ******/
		%feature("compactdefaultargs") DeltaOnModification;
		%feature("autodoc", "
Parameters
----------
anOldAttribute: TDF_Attribute

Return
-------
opencascade::handle<TDF_DeltaOnModification>

Description
-----------
Makes a DeltaOnModification between <self> and <anOldAttribute>.
") DeltaOnModification;
		opencascade::handle<TDF_DeltaOnModification> DeltaOnModification(const opencascade::handle<TDF_Attribute> & anOldAttribute);

		/****** TDataStd_RealArray::Dump ******/
		/****** md5 signature: c3832f0735de2bdac14af95fe6ce7de3 ******/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "
Parameters
----------

Return
-------
anOS: Standard_OStream

Description
-----------
No available documentation.
") Dump;
		Standard_OStream & Dump(std::ostream &OutValue);


        /****************** DumpJson ******************/
        %feature("autodoc", "
Parameters
----------
depth: int, default=-1

Return
-------
str

Description
-----------
Dump the object to JSON string.
") DumpJson;
        %extend{
            std::string DumpJson(int depth=-1) {
            std::stringstream s;
            self->DumpJson(s, depth);
            return "{" + s.str() + "}" ;}
        };
		/****** TDataStd_RealArray::GetDelta ******/
		/****** md5 signature: 48d284b77526180b9fca72a2b1a82618 ******/
		%feature("compactdefaultargs") GetDelta;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") GetDelta;
		bool GetDelta();

		/****** TDataStd_RealArray::GetID ******/
		/****** md5 signature: afe6002d90f641ca3ea8c9ae9f8fe97c ******/
		%feature("compactdefaultargs") GetID;
		%feature("autodoc", "Return
-------
Standard_GUID

Description
-----------
class methods ============= Returns the GUID for arrays of reals.
") GetID;
		static const Standard_GUID & GetID();

		/****** TDataStd_RealArray::ID ******/
		/****** md5 signature: 90e2a7836a98c0274891df8231c5ae76 ******/
		%feature("compactdefaultargs") ID;
		%feature("autodoc", "Return
-------
Standard_GUID

Description
-----------
No available documentation.
") ID;
		const Standard_GUID & ID();

		/****** TDataStd_RealArray::Init ******/
		/****** md5 signature: 9817520653ab29d149c0b92193743f1d ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
lower: int
upper: int

Return
-------
None

Description
-----------
Initialize the inner array with bounds from <lower> to <upper>.
") Init;
		void Init(const int lower, const int upper);

		/****** TDataStd_RealArray::Length ******/
		/****** md5 signature: f07a384d0f09ac6092cb8ed89442c8a8 ******/
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of elements of the array of reals in terms of the number of elements it contains.
") Length;
		int Length();

		/****** TDataStd_RealArray::Lower ******/
		/****** md5 signature: ed303acc20e6a8f86d94712204278487 ******/
		%feature("compactdefaultargs") Lower;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the lower boundary of the array.
") Lower;
		int Lower();

		/****** TDataStd_RealArray::NewEmpty ******/
		/****** md5 signature: 4ebad80fa2cacb9f9e231bbb83a29a98 ******/
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "Return
-------
opencascade::handle<TDF_Attribute>

Description
-----------
No available documentation.
") NewEmpty;
		opencascade::handle<TDF_Attribute> NewEmpty();

		/****** TDataStd_RealArray::Paste ******/
		/****** md5 signature: bfece7a0e37cb5034ac0b2a8c488da37 ******/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "
Parameters
----------
Into: TDF_Attribute
RT: TDF_RelocationTable

Return
-------
None

Description
-----------
Note. Uses inside ChangeArray() method.
") Paste;
		void Paste(const opencascade::handle<TDF_Attribute> & Into, const opencascade::handle<TDF_RelocationTable> & RT);

		/****** TDataStd_RealArray::Restore ******/
		/****** md5 signature: 8bde8d15cc1907242b8c43fe6eb18f19 ******/
		%feature("compactdefaultargs") Restore;
		%feature("autodoc", "
Parameters
----------
With: TDF_Attribute

Return
-------
None

Description
-----------
No available documentation.
") Restore;
		void Restore(const opencascade::handle<TDF_Attribute> & With);

		/****** TDataStd_RealArray::Set ******/
		/****** md5 signature: 84f62ee7597b49a711569fb99e174aba ******/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "
Parameters
----------
label: TDF_Label
lower: int
upper: int
isDelta: bool (optional, default to false)

Return
-------
opencascade::handle<TDataStd_RealArray>

Description
-----------
Finds or creates on the <label> a real array attribute with the specified <lower> and <upper> boundaries. If <isDelta> == False, DefaultDeltaOnModification is used. If <isDelta> == True, DeltaOnModification of the current attribute is used. If attribute is already set, input parameter <isDelta> is refused and the found attribute returned.
") Set;
		static opencascade::handle<TDataStd_RealArray> Set(const TDF_Label & label, const int lower, const int upper, const bool isDelta = false);

		/****** TDataStd_RealArray::Set ******/
		/****** md5 signature: 08f5b260f3dd2b889fc5978c39136fd1 ******/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "
Parameters
----------
label: TDF_Label
theGuid: Standard_GUID
lower: int
upper: int
isDelta: bool (optional, default to false)

Return
-------
opencascade::handle<TDataStd_RealArray>

Description
-----------
Finds, or creates, an RealArray attribute with explicit user defined <guid>. The RealArray attribute is returned.
") Set;
		static opencascade::handle<TDataStd_RealArray> Set(const TDF_Label & label, const Standard_GUID & theGuid, const int lower, const int upper, const bool isDelta = false);

		/****** TDataStd_RealArray::SetDelta ******/
		/****** md5 signature: ed3080f13a07eb95c0be3f5630b6c6b3 ******/
		%feature("compactdefaultargs") SetDelta;
		%feature("autodoc", "
Parameters
----------
isDelta: bool

Return
-------
None

Description
-----------
for internal use only!.
") SetDelta;
		void SetDelta(const bool isDelta);

		/****** TDataStd_RealArray::SetID ******/
		/****** md5 signature: 07ce9c4a6ca92424a2ebf50c156bd3b5 ******/
		%feature("compactdefaultargs") SetID;
		%feature("autodoc", "
Parameters
----------
theGuid: Standard_GUID

Return
-------
None

Description
-----------
Sets the explicit GUID (user defined) for the attribute.
") SetID;
		void SetID(const Standard_GUID & theGuid);

		/****** TDataStd_RealArray::SetID ******/
		/****** md5 signature: 1c04912b49b7be6319020f1d75526111 ******/
		%feature("compactdefaultargs") SetID;
		%feature("autodoc", "Return
-------
None

Description
-----------
Sets default GUID for the attribute.
") SetID;
		void SetID();

		/****** TDataStd_RealArray::SetValue ******/
		/****** md5 signature: f1780ee435aa2f659d29090e5b509982 ******/
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "
Parameters
----------
Index: int
Value: double

Return
-------
None

Description
-----------
Sets the <Index>th element of the array to <Value> OutOfRange exception is raised if <Index> doesn't respect Lower and Upper bounds of the internal array.
") SetValue;
		void SetValue(const int Index, const double Value);

		/****** TDataStd_RealArray::Upper ******/
		/****** md5 signature: a53a7ba7d20e7ec35b8de8d721ea431d ******/
		%feature("compactdefaultargs") Upper;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the upper boundary of the array.
") Upper;
		int Upper();

		/****** TDataStd_RealArray::Value ******/
		/****** md5 signature: aff42ae108ec5c597d8f60d14b71f54d ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
double

Description
-----------
Return the value of the <Index>th element of the array.
") Value;
		double Value(const int Index);

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
		/****** TDataStd_RealList::TDataStd_RealList ******/
		/****** md5 signature: 42942f0efdf2510391f7fa4dbeca5a46 ******/
		%feature("compactdefaultargs") TDataStd_RealList;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") TDataStd_RealList;
		 TDataStd_RealList();

		/****** TDataStd_RealList::Append ******/
		/****** md5 signature: a868ba6ea3e8407fe2f7c33fa841fff6 ******/
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "
Parameters
----------
value: double

Return
-------
None

Description
-----------
No available documentation.
") Append;
		void Append(const double value);

		/****** TDataStd_RealList::Clear ******/
		/****** md5 signature: ae54be580b423a6eadbe062e0bdb44c2 ******/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Clear;
		void Clear();

		/****** TDataStd_RealList::Dump ******/
		/****** md5 signature: c3832f0735de2bdac14af95fe6ce7de3 ******/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "
Parameters
----------

Return
-------
anOS: Standard_OStream

Description
-----------
No available documentation.
") Dump;
		Standard_OStream & Dump(std::ostream &OutValue);


        /****************** DumpJson ******************/
        %feature("autodoc", "
Parameters
----------
depth: int, default=-1

Return
-------
str

Description
-----------
Dump the object to JSON string.
") DumpJson;
        %extend{
            std::string DumpJson(int depth=-1) {
            std::stringstream s;
            self->DumpJson(s, depth);
            return "{" + s.str() + "}" ;}
        };
		/****** TDataStd_RealList::Extent ******/
		/****** md5 signature: 1c9a99c4f72ae2188a5b950ee752d850 ******/
		%feature("compactdefaultargs") Extent;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") Extent;
		int Extent();

		/****** TDataStd_RealList::First ******/
		/****** md5 signature: 61ce69da508d1629f019b1eaed06f2ac ******/
		%feature("compactdefaultargs") First;
		%feature("autodoc", "Return
-------
double

Description
-----------
No available documentation.
") First;
		double First();

		/****** TDataStd_RealList::GetID ******/
		/****** md5 signature: afe6002d90f641ca3ea8c9ae9f8fe97c ******/
		%feature("compactdefaultargs") GetID;
		%feature("autodoc", "Return
-------
Standard_GUID

Description
-----------
Static methods ============== Returns the ID of the list of doubles attribute.
") GetID;
		static const Standard_GUID & GetID();

		/****** TDataStd_RealList::ID ******/
		/****** md5 signature: 90e2a7836a98c0274891df8231c5ae76 ******/
		%feature("compactdefaultargs") ID;
		%feature("autodoc", "Return
-------
Standard_GUID

Description
-----------
No available documentation.
") ID;
		const Standard_GUID & ID();

		/****** TDataStd_RealList::InsertAfter ******/
		/****** md5 signature: 0c0ac6e10b587fe6cef4b1e1e020df2e ******/
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "
Parameters
----------
value: double
after_value: double

Return
-------
bool

Description
-----------
Inserts the <value> after the first meet of <after_value>.
") InsertAfter;
		bool InsertAfter(const double value, const double after_value);

		/****** TDataStd_RealList::InsertAfterByIndex ******/
		/****** md5 signature: a4a1ca7f2d24325e91b28379d42dce14 ******/
		%feature("compactdefaultargs") InsertAfterByIndex;
		%feature("autodoc", "
Parameters
----------
index: int
after_value: double

Return
-------
bool

Description
-----------
Inserts the <value> after the <index> position. The indices start with 1 .. Extent().
") InsertAfterByIndex;
		bool InsertAfterByIndex(const int index, const double after_value);

		/****** TDataStd_RealList::InsertBefore ******/
		/****** md5 signature: b919ae0dcfcee0c025b9750c7f2bbff9 ******/
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "
Parameters
----------
value: double
before_value: double

Return
-------
bool

Description
-----------
Inserts the <value> before the first meet of <before_value>.
") InsertBefore;
		bool InsertBefore(const double value, const double before_value);

		/****** TDataStd_RealList::InsertBeforeByIndex ******/
		/****** md5 signature: f5763b0fed52ee8407fa0c6dbbb6e733 ******/
		%feature("compactdefaultargs") InsertBeforeByIndex;
		%feature("autodoc", "
Parameters
----------
index: int
before_value: double

Return
-------
bool

Description
-----------
Inserts the <value> before the <index> position. The indices start with 1 .. Extent().
") InsertBeforeByIndex;
		bool InsertBeforeByIndex(const int index, const double before_value);

		/****** TDataStd_RealList::IsEmpty ******/
		/****** md5 signature: 03c43b1186186edcd7d757f16ac1f505 ******/
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsEmpty;
		bool IsEmpty();

		/****** TDataStd_RealList::Last ******/
		/****** md5 signature: f68736fde4f79ad5767aa65cfae8fd87 ******/
		%feature("compactdefaultargs") Last;
		%feature("autodoc", "Return
-------
double

Description
-----------
No available documentation.
") Last;
		double Last();

		/****** TDataStd_RealList::List ******/
		/****** md5 signature: 600c8dc236df1b669c8ec10ec605286e ******/
		%feature("compactdefaultargs") List;
		%feature("autodoc", "Return
-------
NCollection_List<double>

Description
-----------
No available documentation.
") List;
		const NCollection_List<double> & List();

		/****** TDataStd_RealList::NewEmpty ******/
		/****** md5 signature: 4ebad80fa2cacb9f9e231bbb83a29a98 ******/
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "Return
-------
opencascade::handle<TDF_Attribute>

Description
-----------
No available documentation.
") NewEmpty;
		opencascade::handle<TDF_Attribute> NewEmpty();

		/****** TDataStd_RealList::Paste ******/
		/****** md5 signature: bfece7a0e37cb5034ac0b2a8c488da37 ******/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "
Parameters
----------
Into: TDF_Attribute
RT: TDF_RelocationTable

Return
-------
None

Description
-----------
No available documentation.
") Paste;
		void Paste(const opencascade::handle<TDF_Attribute> & Into, const opencascade::handle<TDF_RelocationTable> & RT);

		/****** TDataStd_RealList::Prepend ******/
		/****** md5 signature: dee7580e185ee865679ed8f59101c407 ******/
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "
Parameters
----------
value: double

Return
-------
None

Description
-----------
No available documentation.
") Prepend;
		void Prepend(const double value);

		/****** TDataStd_RealList::Remove ******/
		/****** md5 signature: 9da726c90d588b8c2168132de3664a6c ******/
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "
Parameters
----------
value: double

Return
-------
bool

Description
-----------
Removes the first meet of the <value>.
") Remove;
		bool Remove(const double value);

		/****** TDataStd_RealList::RemoveByIndex ******/
		/****** md5 signature: 9b68125fdff25de6dfd4bb3d97245836 ******/
		%feature("compactdefaultargs") RemoveByIndex;
		%feature("autodoc", "
Parameters
----------
index: int

Return
-------
bool

Description
-----------
Removes a value at <index> position.
") RemoveByIndex;
		bool RemoveByIndex(const int index);

		/****** TDataStd_RealList::Restore ******/
		/****** md5 signature: 8bde8d15cc1907242b8c43fe6eb18f19 ******/
		%feature("compactdefaultargs") Restore;
		%feature("autodoc", "
Parameters
----------
With: TDF_Attribute

Return
-------
None

Description
-----------
No available documentation.
") Restore;
		void Restore(const opencascade::handle<TDF_Attribute> & With);

		/****** TDataStd_RealList::Set ******/
		/****** md5 signature: 25df734a0b2fb4b7a75d6713d1fd3588 ******/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "
Parameters
----------
label: TDF_Label

Return
-------
opencascade::handle<TDataStd_RealList>

Description
-----------
Finds or creates a list of double values attribute.
") Set;
		static opencascade::handle<TDataStd_RealList> Set(const TDF_Label & label);

		/****** TDataStd_RealList::Set ******/
		/****** md5 signature: f917736d49a3e6292d0083e7d44899a9 ******/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "
Parameters
----------
label: TDF_Label
theGuid: Standard_GUID

Return
-------
opencascade::handle<TDataStd_RealList>

Description
-----------
Finds or creates a list of double values attribute with explicit user defined <guid>.
") Set;
		static opencascade::handle<TDataStd_RealList> Set(const TDF_Label & label, const Standard_GUID & theGuid);

		/****** TDataStd_RealList::SetID ******/
		/****** md5 signature: 07ce9c4a6ca92424a2ebf50c156bd3b5 ******/
		%feature("compactdefaultargs") SetID;
		%feature("autodoc", "
Parameters
----------
theGuid: Standard_GUID

Return
-------
None

Description
-----------
Sets the explicit GUID (user defined) for the attribute.
") SetID;
		void SetID(const Standard_GUID & theGuid);

		/****** TDataStd_RealList::SetID ******/
		/****** md5 signature: 1c04912b49b7be6319020f1d75526111 ******/
		%feature("compactdefaultargs") SetID;
		%feature("autodoc", "Return
-------
None

Description
-----------
Sets default GUID for the attribute.
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
		/****** TDataStd_ReferenceArray::TDataStd_ReferenceArray ******/
		/****** md5 signature: f9ae20c1be39b2ccafd6846ba6fa40b3 ******/
		%feature("compactdefaultargs") TDataStd_ReferenceArray;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") TDataStd_ReferenceArray;
		 TDataStd_ReferenceArray();

		/****** TDataStd_ReferenceArray::Dump ******/
		/****** md5 signature: c3832f0735de2bdac14af95fe6ce7de3 ******/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "
Parameters
----------

Return
-------
anOS: Standard_OStream

Description
-----------
No available documentation.
") Dump;
		Standard_OStream & Dump(std::ostream &OutValue);


        /****************** DumpJson ******************/
        %feature("autodoc", "
Parameters
----------
depth: int, default=-1

Return
-------
str

Description
-----------
Dump the object to JSON string.
") DumpJson;
        %extend{
            std::string DumpJson(int depth=-1) {
            std::stringstream s;
            self->DumpJson(s, depth);
            return "{" + s.str() + "}" ;}
        };
		/****** TDataStd_ReferenceArray::GetID ******/
		/****** md5 signature: afe6002d90f641ca3ea8c9ae9f8fe97c ******/
		%feature("compactdefaultargs") GetID;
		%feature("autodoc", "Return
-------
Standard_GUID

Description
-----------
Static methods ============== Returns the ID of the array of references (labels) attribute.
") GetID;
		static const Standard_GUID & GetID();

		/****** TDataStd_ReferenceArray::ID ******/
		/****** md5 signature: 90e2a7836a98c0274891df8231c5ae76 ******/
		%feature("compactdefaultargs") ID;
		%feature("autodoc", "Return
-------
Standard_GUID

Description
-----------
No available documentation.
") ID;
		const Standard_GUID & ID();

		/****** TDataStd_ReferenceArray::Init ******/
		/****** md5 signature: 9817520653ab29d149c0b92193743f1d ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
lower: int
upper: int

Return
-------
None

Description
-----------
Initialize the inner array with bounds from <lower> to <upper>.
") Init;
		void Init(const int lower, const int upper);

		/****** TDataStd_ReferenceArray::InternalArray ******/
		/****** md5 signature: 854d0ce3f03380afedc49a1b8da8d427 ******/
		%feature("compactdefaultargs") InternalArray;
		%feature("autodoc", "Return
-------
opencascade::handle<NCollection_HArray1<TDF_Label>>

Description
-----------
No available documentation.
") InternalArray;
		const opencascade::handle<NCollection_HArray1<TDF_Label>> & InternalArray();

		/****** TDataStd_ReferenceArray::Length ******/
		/****** md5 signature: f07a384d0f09ac6092cb8ed89442c8a8 ******/
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of elements in the array.
") Length;
		int Length();

		/****** TDataStd_ReferenceArray::Lower ******/
		/****** md5 signature: ed303acc20e6a8f86d94712204278487 ******/
		%feature("compactdefaultargs") Lower;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the lower boundary of the array.
") Lower;
		int Lower();

		/****** TDataStd_ReferenceArray::NewEmpty ******/
		/****** md5 signature: 4ebad80fa2cacb9f9e231bbb83a29a98 ******/
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "Return
-------
opencascade::handle<TDF_Attribute>

Description
-----------
No available documentation.
") NewEmpty;
		opencascade::handle<TDF_Attribute> NewEmpty();

		/****** TDataStd_ReferenceArray::Paste ******/
		/****** md5 signature: bfece7a0e37cb5034ac0b2a8c488da37 ******/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "
Parameters
----------
Into: TDF_Attribute
RT: TDF_RelocationTable

Return
-------
None

Description
-----------
No available documentation.
") Paste;
		void Paste(const opencascade::handle<TDF_Attribute> & Into, const opencascade::handle<TDF_RelocationTable> & RT);

		/****** TDataStd_ReferenceArray::References ******/
		/****** md5 signature: 3409f0ad6db182e1a72fab7b19e8b252 ******/
		%feature("compactdefaultargs") References;
		%feature("autodoc", "
Parameters
----------
DS: TDF_DataSet

Return
-------
None

Description
-----------
No available documentation.
") References;
		void References(const opencascade::handle<TDF_DataSet> & DS);

		/****** TDataStd_ReferenceArray::Restore ******/
		/****** md5 signature: 8bde8d15cc1907242b8c43fe6eb18f19 ******/
		%feature("compactdefaultargs") Restore;
		%feature("autodoc", "
Parameters
----------
With: TDF_Attribute

Return
-------
None

Description
-----------
No available documentation.
") Restore;
		void Restore(const opencascade::handle<TDF_Attribute> & With);

		/****** TDataStd_ReferenceArray::Set ******/
		/****** md5 signature: 9dea4920517f5d754eea2c4624c9efb0 ******/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "
Parameters
----------
label: TDF_Label
lower: int
upper: int

Return
-------
opencascade::handle<TDataStd_ReferenceArray>

Description
-----------
Finds or creates an array of reference values (labels) attribute.
") Set;
		static opencascade::handle<TDataStd_ReferenceArray> Set(const TDF_Label & label, const int lower, const int upper);

		/****** TDataStd_ReferenceArray::Set ******/
		/****** md5 signature: d9e9ea26027200bad4a1d481042603bc ******/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "
Parameters
----------
label: TDF_Label
theGuid: Standard_GUID
lower: int
upper: int

Return
-------
opencascade::handle<TDataStd_ReferenceArray>

Description
-----------
Finds or creates an array of reference values (labels) attribute with explicit user defined <guid>.
") Set;
		static opencascade::handle<TDataStd_ReferenceArray> Set(const TDF_Label & label, const Standard_GUID & theGuid, const int lower, const int upper);

		/****** TDataStd_ReferenceArray::SetID ******/
		/****** md5 signature: 07ce9c4a6ca92424a2ebf50c156bd3b5 ******/
		%feature("compactdefaultargs") SetID;
		%feature("autodoc", "
Parameters
----------
theGuid: Standard_GUID

Return
-------
None

Description
-----------
Sets the explicit GUID (user defined) for the attribute.
") SetID;
		void SetID(const Standard_GUID & theGuid);

		/****** TDataStd_ReferenceArray::SetID ******/
		/****** md5 signature: 1c04912b49b7be6319020f1d75526111 ******/
		%feature("compactdefaultargs") SetID;
		%feature("autodoc", "Return
-------
None

Description
-----------
Sets default GUID for the attribute.
") SetID;
		void SetID();

		/****** TDataStd_ReferenceArray::SetInternalArray ******/
		/****** md5 signature: 439a7c79ba1c97ae2311040ce167b844 ******/
		%feature("compactdefaultargs") SetInternalArray;
		%feature("autodoc", "
Parameters
----------
values: NCollection_HArray1<TDF_Label
isCheckItems: bool (optional, default to true)

Return
-------
None

Description
-----------
No available documentation.
") SetInternalArray;
		void SetInternalArray(const opencascade::handle<NCollection_HArray1<TDF_Label> > & values, const bool isCheckItems = true);

		/****** TDataStd_ReferenceArray::SetValue ******/
		/****** md5 signature: e6ebbe0b478dd8722d3a179a797e039f ******/
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "
Parameters
----------
index: int
value: TDF_Label

Return
-------
None

Description
-----------
Sets the <Index>th element of the array to <Value> OutOfRange exception is raised if <Index> doesn't respect Lower and Upper bounds of the internal array.
") SetValue;
		void SetValue(const int index, const TDF_Label & value);

		/****** TDataStd_ReferenceArray::Upper ******/
		/****** md5 signature: a53a7ba7d20e7ec35b8de8d721ea431d ******/
		%feature("compactdefaultargs") Upper;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the upper boundary of the array.
") Upper;
		int Upper();

		/****** TDataStd_ReferenceArray::Value ******/
		/****** md5 signature: f5969e497c47ab94b4d1132a988b6e1d ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
TDF_Label

Description
-----------
Returns the value of the <Index>th element of the array.
") Value;
		TDF_Label Value(const int Index);

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
		/****** TDataStd_ReferenceList::TDataStd_ReferenceList ******/
		/****** md5 signature: 25070f96c4fd52d8b05deda12be35cbd ******/
		%feature("compactdefaultargs") TDataStd_ReferenceList;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") TDataStd_ReferenceList;
		 TDataStd_ReferenceList();

		/****** TDataStd_ReferenceList::Append ******/
		/****** md5 signature: 67dd102a074ac568d6ab7e7e8e9594f5 ******/
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "
Parameters
----------
value: TDF_Label

Return
-------
None

Description
-----------
No available documentation.
") Append;
		void Append(const TDF_Label & value);

		/****** TDataStd_ReferenceList::Clear ******/
		/****** md5 signature: ae54be580b423a6eadbe062e0bdb44c2 ******/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Clear;
		void Clear();

		/****** TDataStd_ReferenceList::Dump ******/
		/****** md5 signature: c3832f0735de2bdac14af95fe6ce7de3 ******/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "
Parameters
----------

Return
-------
anOS: Standard_OStream

Description
-----------
No available documentation.
") Dump;
		Standard_OStream & Dump(std::ostream &OutValue);


        /****************** DumpJson ******************/
        %feature("autodoc", "
Parameters
----------
depth: int, default=-1

Return
-------
str

Description
-----------
Dump the object to JSON string.
") DumpJson;
        %extend{
            std::string DumpJson(int depth=-1) {
            std::stringstream s;
            self->DumpJson(s, depth);
            return "{" + s.str() + "}" ;}
        };
		/****** TDataStd_ReferenceList::Extent ******/
		/****** md5 signature: 1c9a99c4f72ae2188a5b950ee752d850 ******/
		%feature("compactdefaultargs") Extent;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") Extent;
		int Extent();

		/****** TDataStd_ReferenceList::First ******/
		/****** md5 signature: fc0dfb1b8118d546191271893de453b4 ******/
		%feature("compactdefaultargs") First;
		%feature("autodoc", "Return
-------
TDF_Label

Description
-----------
No available documentation.
") First;
		const TDF_Label & First();

		/****** TDataStd_ReferenceList::GetID ******/
		/****** md5 signature: afe6002d90f641ca3ea8c9ae9f8fe97c ******/
		%feature("compactdefaultargs") GetID;
		%feature("autodoc", "Return
-------
Standard_GUID

Description
-----------
Static methods ============== Returns the ID of the list of references (labels) attribute.
") GetID;
		static const Standard_GUID & GetID();

		/****** TDataStd_ReferenceList::ID ******/
		/****** md5 signature: 90e2a7836a98c0274891df8231c5ae76 ******/
		%feature("compactdefaultargs") ID;
		%feature("autodoc", "Return
-------
Standard_GUID

Description
-----------
No available documentation.
") ID;
		const Standard_GUID & ID();

		/****** TDataStd_ReferenceList::InsertAfter ******/
		/****** md5 signature: 12dae0814c226b9f39ca9102190aa2ea ******/
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "
Parameters
----------
value: TDF_Label
after_value: TDF_Label

Return
-------
bool

Description
-----------
Inserts the <value> after the first meet of <after_value>.
") InsertAfter;
		bool InsertAfter(const TDF_Label & value, const TDF_Label & after_value);

		/****** TDataStd_ReferenceList::InsertAfter ******/
		/****** md5 signature: 808554350ed8ed5fe081cffa629a53b1 ******/
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "
Parameters
----------
index: int
after_value: TDF_Label

Return
-------
bool

Description
-----------
Inserts the label after the <index> position. The indices start with 1 .. Extent().
") InsertAfter;
		bool InsertAfter(const int index, const TDF_Label & after_value);

		/****** TDataStd_ReferenceList::InsertBefore ******/
		/****** md5 signature: bf0d2c816f30abebdc540887cc986834 ******/
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "
Parameters
----------
value: TDF_Label
before_value: TDF_Label

Return
-------
bool

Description
-----------
Inserts the <value> before the first meet of <before_value>.
") InsertBefore;
		bool InsertBefore(const TDF_Label & value, const TDF_Label & before_value);

		/****** TDataStd_ReferenceList::InsertBefore ******/
		/****** md5 signature: 44f7a6f11e277ac7bbe3a8ae4308b0fb ******/
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "
Parameters
----------
index: int
before_value: TDF_Label

Return
-------
bool

Description
-----------
Inserts the label before the <index> position. The indices start with 1 .. Extent().
") InsertBefore;
		bool InsertBefore(const int index, const TDF_Label & before_value);

		/****** TDataStd_ReferenceList::IsEmpty ******/
		/****** md5 signature: 03c43b1186186edcd7d757f16ac1f505 ******/
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsEmpty;
		bool IsEmpty();

		/****** TDataStd_ReferenceList::Last ******/
		/****** md5 signature: af545a63ea1ddbfde05f358f8ed64bbf ******/
		%feature("compactdefaultargs") Last;
		%feature("autodoc", "Return
-------
TDF_Label

Description
-----------
No available documentation.
") Last;
		const TDF_Label & Last();

		/****** TDataStd_ReferenceList::List ******/
		/****** md5 signature: 16efd318043eba5da1394db415346b14 ******/
		%feature("compactdefaultargs") List;
		%feature("autodoc", "Return
-------
NCollection_List<TDF_Label>

Description
-----------
No available documentation.
") List;
		const NCollection_List<TDF_Label> & List();

		/****** TDataStd_ReferenceList::NewEmpty ******/
		/****** md5 signature: 4ebad80fa2cacb9f9e231bbb83a29a98 ******/
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "Return
-------
opencascade::handle<TDF_Attribute>

Description
-----------
No available documentation.
") NewEmpty;
		opencascade::handle<TDF_Attribute> NewEmpty();

		/****** TDataStd_ReferenceList::Paste ******/
		/****** md5 signature: bfece7a0e37cb5034ac0b2a8c488da37 ******/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "
Parameters
----------
Into: TDF_Attribute
RT: TDF_RelocationTable

Return
-------
None

Description
-----------
No available documentation.
") Paste;
		void Paste(const opencascade::handle<TDF_Attribute> & Into, const opencascade::handle<TDF_RelocationTable> & RT);

		/****** TDataStd_ReferenceList::Prepend ******/
		/****** md5 signature: 29390ecea2ffb98e63c05b9ac6f31106 ******/
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "
Parameters
----------
value: TDF_Label

Return
-------
None

Description
-----------
No available documentation.
") Prepend;
		void Prepend(const TDF_Label & value);

		/****** TDataStd_ReferenceList::References ******/
		/****** md5 signature: 3409f0ad6db182e1a72fab7b19e8b252 ******/
		%feature("compactdefaultargs") References;
		%feature("autodoc", "
Parameters
----------
DS: TDF_DataSet

Return
-------
None

Description
-----------
No available documentation.
") References;
		void References(const opencascade::handle<TDF_DataSet> & DS);

		/****** TDataStd_ReferenceList::Remove ******/
		/****** md5 signature: 2d5eb84aaf53c63fdb56f4c09294f34c ******/
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "
Parameters
----------
value: TDF_Label

Return
-------
bool

Description
-----------
Removes the first meet of the <value>.
") Remove;
		bool Remove(const TDF_Label & value);

		/****** TDataStd_ReferenceList::Remove ******/
		/****** md5 signature: d991364949bd4864a2863cd5382583d6 ******/
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "
Parameters
----------
index: int

Return
-------
bool

Description
-----------
Removes a label at 'index' position.
") Remove;
		bool Remove(const int index);

		/****** TDataStd_ReferenceList::Restore ******/
		/****** md5 signature: 8bde8d15cc1907242b8c43fe6eb18f19 ******/
		%feature("compactdefaultargs") Restore;
		%feature("autodoc", "
Parameters
----------
With: TDF_Attribute

Return
-------
None

Description
-----------
No available documentation.
") Restore;
		void Restore(const opencascade::handle<TDF_Attribute> & With);

		/****** TDataStd_ReferenceList::Set ******/
		/****** md5 signature: 038c01f2e83d5efcae1d85b38806104a ******/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "
Parameters
----------
label: TDF_Label

Return
-------
opencascade::handle<TDataStd_ReferenceList>

Description
-----------
Finds or creates a list of reference values (labels) attribute.
") Set;
		static opencascade::handle<TDataStd_ReferenceList> Set(const TDF_Label & label);

		/****** TDataStd_ReferenceList::Set ******/
		/****** md5 signature: 3d3d73a8d333ef4e01397b43d9e36b9c ******/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "
Parameters
----------
label: TDF_Label
theGuid: Standard_GUID

Return
-------
opencascade::handle<TDataStd_ReferenceList>

Description
-----------
Finds or creates a list of reference values (labels) attribute with explicit user defined <guid>.
") Set;
		static opencascade::handle<TDataStd_ReferenceList> Set(const TDF_Label & label, const Standard_GUID & theGuid);

		/****** TDataStd_ReferenceList::SetID ******/
		/****** md5 signature: 07ce9c4a6ca92424a2ebf50c156bd3b5 ******/
		%feature("compactdefaultargs") SetID;
		%feature("autodoc", "
Parameters
----------
theGuid: Standard_GUID

Return
-------
None

Description
-----------
Sets the explicit GUID (user defined) for the attribute.
") SetID;
		void SetID(const Standard_GUID & theGuid);

		/****** TDataStd_ReferenceList::SetID ******/
		/****** md5 signature: 1c04912b49b7be6319020f1d75526111 ******/
		%feature("compactdefaultargs") SetID;
		%feature("autodoc", "Return
-------
None

Description
-----------
Sets default GUID for the attribute.
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
* class TDataStd_TreeNode *
**************************/
class TDataStd_TreeNode : public TDF_Attribute {
	public:
		/****** TDataStd_TreeNode::TDataStd_TreeNode ******/
		/****** md5 signature: dca7a5049eca9ac2b28ef3448b6457b1 ******/
		%feature("compactdefaultargs") TDataStd_TreeNode;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") TDataStd_TreeNode;
		 TDataStd_TreeNode();

		/****** TDataStd_TreeNode::AfterAddition ******/
		/****** md5 signature: 677f303b9af6a36d9152349a9ea5b00e ******/
		%feature("compactdefaultargs") AfterAddition;
		%feature("autodoc", "Return
-------
None

Description
-----------
Connect the TreeNode to its father child list.
") AfterAddition;
		void AfterAddition();

		/****** TDataStd_TreeNode::AfterResume ******/
		/****** md5 signature: 725997b4942a96537f8067a0c4d51cec ******/
		%feature("compactdefaultargs") AfterResume;
		%feature("autodoc", "Return
-------
None

Description
-----------
Reconnect the TreeNode to its father child list.
") AfterResume;
		void AfterResume();

		/****** TDataStd_TreeNode::AfterUndo ******/
		/****** md5 signature: 1c658357444dc4e0bd0f4b66ab6d7e3c ******/
		%feature("compactdefaultargs") AfterUndo;
		%feature("autodoc", "
Parameters
----------
anAttDelta: TDF_AttributeDelta
forceIt: bool (optional, default to false)

Return
-------
bool

Description
-----------
Reconnect the TreeNode, if necessary. Implementation of Attribute methods: ===================================.
") AfterUndo;
		bool AfterUndo(const opencascade::handle<TDF_AttributeDelta> & anAttDelta, const bool forceIt = false);

		/****** TDataStd_TreeNode::Append ******/
		/****** md5 signature: 6ee5bb0d6d7288d0becd089cb6edfbd7 ******/
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "
Parameters
----------
Child: TDataStd_TreeNode

Return
-------
bool

Description
-----------
Insert the TreeNode <Child> as last child of <self>. If the insertion is successful <self> becomes the Father of <Child>.
") Append;
		bool Append(const opencascade::handle<TDataStd_TreeNode> & Child);

		/****** TDataStd_TreeNode::BeforeForget ******/
		/****** md5 signature: 62cb9500c708360c96952b8784c42662 ******/
		%feature("compactdefaultargs") BeforeForget;
		%feature("autodoc", "Return
-------
None

Description
-----------
Disconnect the TreeNode from its Father child list.
") BeforeForget;
		void BeforeForget();

		/****** TDataStd_TreeNode::BeforeUndo ******/
		/****** md5 signature: 4022cd53002aaa4282f3bc50d4d2b7c9 ******/
		%feature("compactdefaultargs") BeforeUndo;
		%feature("autodoc", "
Parameters
----------
anAttDelta: TDF_AttributeDelta
forceIt: bool (optional, default to false)

Return
-------
bool

Description
-----------
Disconnect the TreeNode, if necessary.
") BeforeUndo;
		bool BeforeUndo(const opencascade::handle<TDF_AttributeDelta> & anAttDelta, const bool forceIt = false);

		/****** TDataStd_TreeNode::Depth ******/
		/****** md5 signature: e4c9db75653d1cf3256add259c83cc30 ******/
		%feature("compactdefaultargs") Depth;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the depth of this tree node in the overall tree node structure. In other words, the number of father tree nodes of this one is returned.
") Depth;
		int Depth();

		/****** TDataStd_TreeNode::Dump ******/
		/****** md5 signature: c3832f0735de2bdac14af95fe6ce7de3 ******/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "
Parameters
----------

Return
-------
anOS: Standard_OStream

Description
-----------
No available documentation.
") Dump;
		Standard_OStream & Dump(std::ostream &OutValue);


        /****************** DumpJson ******************/
        %feature("autodoc", "
Parameters
----------
depth: int, default=-1

Return
-------
str

Description
-----------
Dump the object to JSON string.
") DumpJson;
        %extend{
            std::string DumpJson(int depth=-1) {
            std::stringstream s;
            self->DumpJson(s, depth);
            return "{" + s.str() + "}" ;}
        };
		/****** TDataStd_TreeNode::Father ******/
		/****** md5 signature: fd4e43dbfa571e1a17a926e895f43183 ******/
		%feature("compactdefaultargs") Father;
		%feature("autodoc", "Return
-------
opencascade::handle<TDataStd_TreeNode>

Description
-----------
Returns the father TreeNode of <self>. Null if root.
") Father;
		opencascade::handle<TDataStd_TreeNode> Father();

		/****** TDataStd_TreeNode::Find ******/
		/****** md5 signature: 453a68370e0b2a851d0923f331bd7c2b ******/
		%feature("compactdefaultargs") Find;
		%feature("autodoc", "
Parameters
----------
L: TDF_Label
T: TDataStd_TreeNode

Return
-------
bool

Description
-----------
class methods working on the node ================================= Returns true if the tree node T is found on the label L. Otherwise, false is returned.
") Find;
		static bool Find(const TDF_Label & L, opencascade::handle<TDataStd_TreeNode> & T);

		/****** TDataStd_TreeNode::FindLast ******/
		/****** md5 signature: df608722d221823bc8cb3ad3b7b4a692 ******/
		%feature("compactdefaultargs") FindLast;
		%feature("autodoc", "Return
-------
opencascade::handle<TDataStd_TreeNode>

Description
-----------
Returns the last child tree node in this tree node object. to set fields =============.
") FindLast;
		opencascade::handle<TDataStd_TreeNode> FindLast();

		/****** TDataStd_TreeNode::First ******/
		/****** md5 signature: 8c741b9684c32d7bddac2e26fdd5ca54 ******/
		%feature("compactdefaultargs") First;
		%feature("autodoc", "Return
-------
opencascade::handle<TDataStd_TreeNode>

Description
-----------
Returns the first child tree node in this tree node object.
") First;
		opencascade::handle<TDataStd_TreeNode> First();

		/****** TDataStd_TreeNode::GetDefaultTreeID ******/
		/****** md5 signature: 14296d31cb2a3f8590adaf8d487eff37 ******/
		%feature("compactdefaultargs") GetDefaultTreeID;
		%feature("autodoc", "Return
-------
Standard_GUID

Description
-----------
returns a default tree ID. this ID is used by the <Set> method without explicit tree ID. Instance methods: ================.
") GetDefaultTreeID;
		static const Standard_GUID & GetDefaultTreeID();

		/****** TDataStd_TreeNode::HasFather ******/
		/****** md5 signature: 6291cd31a97f883a347476179f77964e ******/
		%feature("compactdefaultargs") HasFather;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if this tree node attribute has a father tree node.
") HasFather;
		bool HasFather();

		/****** TDataStd_TreeNode::HasFirst ******/
		/****** md5 signature: e3709213009e15725519759b7df9f369 ******/
		%feature("compactdefaultargs") HasFirst;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if this tree node attribute has a first child tree node.
") HasFirst;
		bool HasFirst();

		/****** TDataStd_TreeNode::HasLast ******/
		/****** md5 signature: 4082d38197ae024e78ace22387297878 ******/
		%feature("compactdefaultargs") HasLast;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if this tree node attribute has a last child tree node.
") HasLast;
		bool HasLast();

		/****** TDataStd_TreeNode::HasNext ******/
		/****** md5 signature: b93b476ff34c150e5f570f25289b4277 ******/
		%feature("compactdefaultargs") HasNext;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if this tree node attribute has a next tree node.
") HasNext;
		bool HasNext();

		/****** TDataStd_TreeNode::HasPrevious ******/
		/****** md5 signature: 419d43a5d100367ba53c59734b719e4f ******/
		%feature("compactdefaultargs") HasPrevious;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if this tree node attribute has a previous tree node.
") HasPrevious;
		bool HasPrevious();

		/****** TDataStd_TreeNode::ID ******/
		/****** md5 signature: 90e2a7836a98c0274891df8231c5ae76 ******/
		%feature("compactdefaultargs") ID;
		%feature("autodoc", "Return
-------
Standard_GUID

Description
-----------
Returns the tree ID (default or explicit one depending on the Set method used).
") ID;
		const Standard_GUID & ID();

		/****** TDataStd_TreeNode::InsertAfter ******/
		/****** md5 signature: 385678217ef65ab30bfcc789138c5d45 ******/
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "
Parameters
----------
Node: TDataStd_TreeNode

Return
-------
bool

Description
-----------
Inserts the TreeNode <Node> after <self>. If insertion is successful <self> and <Node> belongs to the same Father.
") InsertAfter;
		bool InsertAfter(const opencascade::handle<TDataStd_TreeNode> & Node);

		/****** TDataStd_TreeNode::InsertBefore ******/
		/****** md5 signature: 789c6c44f6ac1c550aaa36de910b4cb7 ******/
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "
Parameters
----------
Node: TDataStd_TreeNode

Return
-------
bool

Description
-----------
Inserts the TreeNode <Node> before <self>. If insertion is successful <self> and <Node> belongs to the same Father.
") InsertBefore;
		bool InsertBefore(const opencascade::handle<TDataStd_TreeNode> & Node);

		/****** TDataStd_TreeNode::IsAscendant ******/
		/****** md5 signature: fe9b88186da49833ba857554c681387c ******/
		%feature("compactdefaultargs") IsAscendant;
		%feature("autodoc", "
Parameters
----------
of: TDataStd_TreeNode

Return
-------
bool

Description
-----------
Returns true if this tree node attribute is an ascendant of of. In other words, if it is a father or the father of a father of of.
") IsAscendant;
		bool IsAscendant(const opencascade::handle<TDataStd_TreeNode> & of);

		/****** TDataStd_TreeNode::IsChild ******/
		/****** md5 signature: 23334ea8b42500d2fc1d385b4778d166 ******/
		%feature("compactdefaultargs") IsChild;
		%feature("autodoc", "
Parameters
----------
of: TDataStd_TreeNode

Return
-------
bool

Description
-----------
Returns true if this tree node attribute is a child of of.
") IsChild;
		bool IsChild(const opencascade::handle<TDataStd_TreeNode> & of);

		/****** TDataStd_TreeNode::IsDescendant ******/
		/****** md5 signature: 5107c22564abc12d6ecb6f6d046e71c6 ******/
		%feature("compactdefaultargs") IsDescendant;
		%feature("autodoc", "
Parameters
----------
of: TDataStd_TreeNode

Return
-------
bool

Description
-----------
Returns true if this tree node attribute is a descendant of of. In other words, if it is a child or the child of a child of of.
") IsDescendant;
		bool IsDescendant(const opencascade::handle<TDataStd_TreeNode> & of);

		/****** TDataStd_TreeNode::IsFather ******/
		/****** md5 signature: 258c54a9a444d24a702c437bc0b63015 ******/
		%feature("compactdefaultargs") IsFather;
		%feature("autodoc", "
Parameters
----------
of: TDataStd_TreeNode

Return
-------
bool

Description
-----------
Returns true if this tree node attribute is a father of of.
") IsFather;
		bool IsFather(const opencascade::handle<TDataStd_TreeNode> & of);

		/****** TDataStd_TreeNode::IsRoot ******/
		/****** md5 signature: 18ba18ee7533a731adf6bd6fdf3afbe1 ******/
		%feature("compactdefaultargs") IsRoot;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if this tree node attribute is the ultimate father in the tree.
") IsRoot;
		bool IsRoot();

		/****** TDataStd_TreeNode::Last ******/
		/****** md5 signature: dd80e1aab4a3cf89b9ab90cc94e8a94b ******/
		%feature("compactdefaultargs") Last;
		%feature("autodoc", "Return
-------
opencascade::handle<TDataStd_TreeNode>

Description
-----------
Returns the last child tree node in this tree node object.
") Last;
		opencascade::handle<TDataStd_TreeNode> Last();

		/****** TDataStd_TreeNode::NbChildren ******/
		/****** md5 signature: 5622765a35fad6bf062ec84b145911a9 ******/
		%feature("compactdefaultargs") NbChildren;
		%feature("autodoc", "
Parameters
----------
allLevels: bool (optional, default to false)

Return
-------
int

Description
-----------
Returns the number of child nodes. If <allLevels> is true, the method counts children of all levels (children of children ...).
") NbChildren;
		int NbChildren(const bool allLevels = false);

		/****** TDataStd_TreeNode::NewEmpty ******/
		/****** md5 signature: 4ebad80fa2cacb9f9e231bbb83a29a98 ******/
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "Return
-------
opencascade::handle<TDF_Attribute>

Description
-----------
No available documentation.
") NewEmpty;
		opencascade::handle<TDF_Attribute> NewEmpty();

		/****** TDataStd_TreeNode::Next ******/
		/****** md5 signature: b7ef516aa02e857cd54615aeec6e9a2c ******/
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "Return
-------
opencascade::handle<TDataStd_TreeNode>

Description
-----------
Returns the next tree node in this tree node attribute. Warning This tree node is null if it is the last one in this tree node attribute.Returns the next TreeNode of <self>. Null if last.
") Next;
		opencascade::handle<TDataStd_TreeNode> Next();

		/****** TDataStd_TreeNode::Paste ******/
		/****** md5 signature: bfece7a0e37cb5034ac0b2a8c488da37 ******/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "
Parameters
----------
into: TDF_Attribute
RT: TDF_RelocationTable

Return
-------
None

Description
-----------
No available documentation.
") Paste;
		void Paste(const opencascade::handle<TDF_Attribute> & into, const opencascade::handle<TDF_RelocationTable> & RT);

		/****** TDataStd_TreeNode::Prepend ******/
		/****** md5 signature: 25aa1edea9256507b6a992107fde0201 ******/
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "
Parameters
----------
Child: TDataStd_TreeNode

Return
-------
bool

Description
-----------
Insert the the TreeNode <Child> as first child of <self>. If the insertion is successful <self> becomes the Father of <Child>.
") Prepend;
		bool Prepend(const opencascade::handle<TDataStd_TreeNode> & Child);

		/****** TDataStd_TreeNode::Previous ******/
		/****** md5 signature: 50ea57789edf52100d8b819a6cfce9c5 ******/
		%feature("compactdefaultargs") Previous;
		%feature("autodoc", "Return
-------
opencascade::handle<TDataStd_TreeNode>

Description
-----------
Returns the previous tree node of this tree node attribute. Warning This tree node is null if it is the first one in this tree node attribute.
") Previous;
		opencascade::handle<TDataStd_TreeNode> Previous();

		/****** TDataStd_TreeNode::References ******/
		/****** md5 signature: 3de62c613451bbbead6f06af1452fc25 ******/
		%feature("compactdefaultargs") References;
		%feature("autodoc", "
Parameters
----------
aDataSet: TDF_DataSet

Return
-------
None

Description
-----------
No available documentation.
") References;
		void References(const opencascade::handle<TDF_DataSet> & aDataSet);

		/****** TDataStd_TreeNode::Remove ******/
		/****** md5 signature: 84d1d98f88a479dff52517b40252b937 ******/
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Removes this tree node attribute from its father node. The result is that this attribute becomes a root node.
") Remove;
		bool Remove();

		/****** TDataStd_TreeNode::Restore ******/
		/****** md5 signature: 8bde8d15cc1907242b8c43fe6eb18f19 ******/
		%feature("compactdefaultargs") Restore;
		%feature("autodoc", "
Parameters
----------
with: TDF_Attribute

Return
-------
None

Description
-----------
No available documentation.
") Restore;
		void Restore(const opencascade::handle<TDF_Attribute> & with);

		/****** TDataStd_TreeNode::Root ******/
		/****** md5 signature: b560926c389e71646912319417b31c46 ******/
		%feature("compactdefaultargs") Root;
		%feature("autodoc", "Return
-------
opencascade::handle<TDataStd_TreeNode>

Description
-----------
Returns the ultimate father of this tree node attribute.
") Root;
		opencascade::handle<TDataStd_TreeNode> Root();

		/****** TDataStd_TreeNode::Set ******/
		/****** md5 signature: 0e560cb594fa76566a8fef0528bb0ce5 ******/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "
Parameters
----------
L: TDF_Label

Return
-------
opencascade::handle<TDataStd_TreeNode>

Description
-----------
Finds or Creates a TreeNode attribute on the label <L> with the default tree ID, returned by the method <GetDefaultTreeID>. Returns the created/found TreeNode attribute.
") Set;
		static opencascade::handle<TDataStd_TreeNode> Set(const TDF_Label & L);

		/****** TDataStd_TreeNode::Set ******/
		/****** md5 signature: 41dbcb3a832ce17c367cb87aa170666d ******/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "
Parameters
----------
L: TDF_Label
ExplicitTreeID: Standard_GUID

Return
-------
opencascade::handle<TDataStd_TreeNode>

Description
-----------
Finds or Creates a TreeNode attribute on the label <L>, with an explicit tree ID. <ExplicitTreeID> is the ID returned by <TDF_Attribute::ID> method. Returns the found/created TreeNode attribute.
") Set;
		static opencascade::handle<TDataStd_TreeNode> Set(const TDF_Label & L, const Standard_GUID & ExplicitTreeID);

		/****** TDataStd_TreeNode::SetFather ******/
		/****** md5 signature: 5c90554030fe273c8d98304977406bdf ******/
		%feature("compactdefaultargs") SetFather;
		%feature("autodoc", "
Parameters
----------
F: TDataStd_TreeNode

Return
-------
None

Description
-----------
No available documentation.
") SetFather;
		void SetFather(const opencascade::handle<TDataStd_TreeNode> & F);

		/****** TDataStd_TreeNode::SetFirst ******/
		/****** md5 signature: 7c3fc87af77b268390ae99888fa7e5b0 ******/
		%feature("compactdefaultargs") SetFirst;
		%feature("autodoc", "
Parameters
----------
F: TDataStd_TreeNode

Return
-------
None

Description
-----------
No available documentation.
") SetFirst;
		void SetFirst(const opencascade::handle<TDataStd_TreeNode> & F);

		/****** TDataStd_TreeNode::SetLast ******/
		/****** md5 signature: 4350ab355e0160ea841c55f57912d497 ******/
		%feature("compactdefaultargs") SetLast;
		%feature("autodoc", "
Parameters
----------
F: TDataStd_TreeNode

Return
-------
None

Description
-----------
TreeNode callback: ==================.
") SetLast;
		void SetLast(const opencascade::handle<TDataStd_TreeNode> & F);

		/****** TDataStd_TreeNode::SetNext ******/
		/****** md5 signature: ca46a64af09edf6a1f8d98a710df01b4 ******/
		%feature("compactdefaultargs") SetNext;
		%feature("autodoc", "
Parameters
----------
F: TDataStd_TreeNode

Return
-------
None

Description
-----------
No available documentation.
") SetNext;
		void SetNext(const opencascade::handle<TDataStd_TreeNode> & F);

		/****** TDataStd_TreeNode::SetPrevious ******/
		/****** md5 signature: d26f09139b26f6f18dca7b85cb543a94 ******/
		%feature("compactdefaultargs") SetPrevious;
		%feature("autodoc", "
Parameters
----------
F: TDataStd_TreeNode

Return
-------
None

Description
-----------
No available documentation.
") SetPrevious;
		void SetPrevious(const opencascade::handle<TDataStd_TreeNode> & F);

		/****** TDataStd_TreeNode::SetTreeID ******/
		/****** md5 signature: cfa8d89e44a86f9a82818f7f1cd8daa7 ******/
		%feature("compactdefaultargs") SetTreeID;
		%feature("autodoc", "
Parameters
----------
explicitID: Standard_GUID

Return
-------
None

Description
-----------
No available documentation.
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
		/****** TDataStd_UAttribute::TDataStd_UAttribute ******/
		/****** md5 signature: e09592884d78e23e95832ca7feda862f ******/
		%feature("compactdefaultargs") TDataStd_UAttribute;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") TDataStd_UAttribute;
		 TDataStd_UAttribute();

		/****** TDataStd_UAttribute::Dump ******/
		/****** md5 signature: c3832f0735de2bdac14af95fe6ce7de3 ******/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "
Parameters
----------

Return
-------
anOS: Standard_OStream

Description
-----------
No available documentation.
") Dump;
		Standard_OStream & Dump(std::ostream &OutValue);


        /****************** DumpJson ******************/
        %feature("autodoc", "
Parameters
----------
depth: int, default=-1

Return
-------
str

Description
-----------
Dump the object to JSON string.
") DumpJson;
        %extend{
            std::string DumpJson(int depth=-1) {
            std::stringstream s;
            self->DumpJson(s, depth);
            return "{" + s.str() + "}" ;}
        };
		/****** TDataStd_UAttribute::ID ******/
		/****** md5 signature: 90e2a7836a98c0274891df8231c5ae76 ******/
		%feature("compactdefaultargs") ID;
		%feature("autodoc", "Return
-------
Standard_GUID

Description
-----------
No available documentation.
") ID;
		const Standard_GUID & ID();

		/****** TDataStd_UAttribute::NewEmpty ******/
		/****** md5 signature: 4ebad80fa2cacb9f9e231bbb83a29a98 ******/
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "Return
-------
opencascade::handle<TDF_Attribute>

Description
-----------
No available documentation.
") NewEmpty;
		opencascade::handle<TDF_Attribute> NewEmpty();

		/****** TDataStd_UAttribute::Paste ******/
		/****** md5 signature: bfece7a0e37cb5034ac0b2a8c488da37 ******/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "
Parameters
----------
into: TDF_Attribute
RT: TDF_RelocationTable

Return
-------
None

Description
-----------
No available documentation.
") Paste;
		void Paste(const opencascade::handle<TDF_Attribute> & into, const opencascade::handle<TDF_RelocationTable> & RT);

		/****** TDataStd_UAttribute::References ******/
		/****** md5 signature: 3409f0ad6db182e1a72fab7b19e8b252 ******/
		%feature("compactdefaultargs") References;
		%feature("autodoc", "
Parameters
----------
DS: TDF_DataSet

Return
-------
None

Description
-----------
No available documentation.
") References;
		void References(const opencascade::handle<TDF_DataSet> & DS);

		/****** TDataStd_UAttribute::Restore ******/
		/****** md5 signature: 8bde8d15cc1907242b8c43fe6eb18f19 ******/
		%feature("compactdefaultargs") Restore;
		%feature("autodoc", "
Parameters
----------
with: TDF_Attribute

Return
-------
None

Description
-----------
No available documentation.
") Restore;
		void Restore(const opencascade::handle<TDF_Attribute> & with);

		/****** TDataStd_UAttribute::Set ******/
		/****** md5 signature: 7751fba6a220616bf9ae6502b5400ca7 ******/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "
Parameters
----------
label: TDF_Label
LocalID: Standard_GUID

Return
-------
opencascade::handle<TDataStd_UAttribute>

Description
-----------
api class methods ============= Find, or create, a UAttribute attribute with <LocalID> as Local GUID. The UAttribute attribute is returned. UAttribute methods ============.
") Set;
		static opencascade::handle<TDataStd_UAttribute> Set(const TDF_Label & label, const Standard_GUID & LocalID);

		/****** TDataStd_UAttribute::SetID ******/
		/****** md5 signature: c133cc6cb23cd2bf7f12d1540cac493e ******/
		%feature("compactdefaultargs") SetID;
		%feature("autodoc", "
Parameters
----------
LocalID: Standard_GUID

Return
-------
None

Description
-----------
No available documentation.
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
		/****** TDataStd_Variable::TDataStd_Variable ******/
		/****** md5 signature: 4ec8127b5d81f09b24dad6747249b629 ******/
		%feature("compactdefaultargs") TDataStd_Variable;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") TDataStd_Variable;
		 TDataStd_Variable();

		/****** TDataStd_Variable::Assign ******/
		/****** md5 signature: c451102694526ce4c4c866a33ae2be92 ******/
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "Return
-------
opencascade::handle<TDataStd_Expression>

Description
-----------
create(if doesn't exist) and returns the assigned expression attribute. fill it after.
") Assign;
		opencascade::handle<TDataStd_Expression> Assign();

		/****** TDataStd_Variable::Constant ******/
		/****** md5 signature: d6072e21c1527cb923eb2c923c6936ed ******/
		%feature("compactdefaultargs") Constant;
		%feature("autodoc", "
Parameters
----------
status: bool

Return
-------
None

Description
-----------
if <status> is True, this variable will not be modified by the solver.
") Constant;
		void Constant(const bool status);

		/****** TDataStd_Variable::Desassign ******/
		/****** md5 signature: 8f4faa2a3ab87866fdd97cd3044ed35f ******/
		%feature("compactdefaultargs") Desassign;
		%feature("autodoc", "Return
-------
None

Description
-----------
if <self> is assigned delete the associated expression attribute.
") Desassign;
		void Desassign();

		/****** TDataStd_Variable::Dump ******/
		/****** md5 signature: c3832f0735de2bdac14af95fe6ce7de3 ******/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "
Parameters
----------

Return
-------
anOS: Standard_OStream

Description
-----------
No available documentation.
") Dump;
		Standard_OStream & Dump(std::ostream &OutValue);


        /****************** DumpJson ******************/
        %feature("autodoc", "
Parameters
----------
depth: int, default=-1

Return
-------
str

Description
-----------
Dump the object to JSON string.
") DumpJson;
        %extend{
            std::string DumpJson(int depth=-1) {
            std::stringstream s;
            self->DumpJson(s, depth);
            return "{" + s.str() + "}" ;}
        };
		/****** TDataStd_Variable::Expression ******/
		/****** md5 signature: 02085d2fcb8779a8d70fbdbc746f552b ******/
		%feature("compactdefaultargs") Expression;
		%feature("autodoc", "Return
-------
opencascade::handle<TDataStd_Expression>

Description
-----------
if <self> is assigned, returns associated Expression attribute.
") Expression;
		opencascade::handle<TDataStd_Expression> Expression();

		/****** TDataStd_Variable::Get ******/
		/****** md5 signature: cdec7cab9884d7fced97581bfac75b03 ******/
		%feature("compactdefaultargs") Get;
		%feature("autodoc", "Return
-------
double

Description
-----------
returns value stored in associated Real attribute.
") Get;
		double Get();

		/****** TDataStd_Variable::GetID ******/
		/****** md5 signature: afe6002d90f641ca3ea8c9ae9f8fe97c ******/
		%feature("compactdefaultargs") GetID;
		%feature("autodoc", "Return
-------
Standard_GUID

Description
-----------
class methods =============.
") GetID;
		static const Standard_GUID & GetID();

		/****** TDataStd_Variable::ID ******/
		/****** md5 signature: 90e2a7836a98c0274891df8231c5ae76 ******/
		%feature("compactdefaultargs") ID;
		%feature("autodoc", "Return
-------
Standard_GUID

Description
-----------
No available documentation.
") ID;
		const Standard_GUID & ID();

		/****** TDataStd_Variable::IsAssigned ******/
		/****** md5 signature: 5383a3792b4e2fbee6d4ae6e4a3cba26 ******/
		%feature("compactdefaultargs") IsAssigned;
		%feature("autodoc", "Return
-------
bool

Description
-----------
returns True if an Expression attribute is associated. create(if doesn't exist), set and returns the assigned expression attribute.
") IsAssigned;
		bool IsAssigned();

		/****** TDataStd_Variable::IsCaptured ******/
		/****** md5 signature: cf2f28168b4c46b554434756df96061d ******/
		%feature("compactdefaultargs") IsCaptured;
		%feature("autodoc", "Return
-------
bool

Description
-----------
shortcut for <Real()->IsCaptured()>.
") IsCaptured;
		bool IsCaptured();

		/****** TDataStd_Variable::IsConstant ******/
		/****** md5 signature: 004cfe784b2152966984d86bf19ad8a1 ******/
		%feature("compactdefaultargs") IsConstant;
		%feature("autodoc", "Return
-------
bool

Description
-----------
A constant value is not modified by regeneration.
") IsConstant;
		bool IsConstant();

		/****** TDataStd_Variable::IsValued ******/
		/****** md5 signature: 4ec1710cd8e2174a455c45285bbb2741 ******/
		%feature("compactdefaultargs") IsValued;
		%feature("autodoc", "Return
-------
bool

Description
-----------
returns True if a Real attribute is associated.
") IsValued;
		bool IsValued();

		/****** TDataStd_Variable::Name ******/
		/****** md5 signature: b8987714305e6d22bbd8f16f26c9c23b ******/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "
Parameters
----------
string: str

Return
-------
None

Description
-----------
set or change the name of the variable, in myUnknown and my associated Name attribute.
") Name;
		void Name(TCollection_ExtendedString string);

		/****** TDataStd_Variable::Name ******/
		/****** md5 signature: c14575b7951e7423490c17784a80a010 ******/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "Return
-------
TCollection_ExtendedString

Description
-----------
returns string stored in the associated Name attribute.
") Name;
		const TCollection_ExtendedString & Name();

		/****** TDataStd_Variable::NewEmpty ******/
		/****** md5 signature: 4ebad80fa2cacb9f9e231bbb83a29a98 ******/
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "Return
-------
opencascade::handle<TDF_Attribute>

Description
-----------
No available documentation.
") NewEmpty;
		opencascade::handle<TDF_Attribute> NewEmpty();

		/****** TDataStd_Variable::Paste ******/
		/****** md5 signature: bfece7a0e37cb5034ac0b2a8c488da37 ******/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "
Parameters
----------
Into: TDF_Attribute
RT: TDF_RelocationTable

Return
-------
None

Description
-----------
No available documentation.
") Paste;
		void Paste(const opencascade::handle<TDF_Attribute> & Into, const opencascade::handle<TDF_RelocationTable> & RT);

		/****** TDataStd_Variable::Real ******/
		/****** md5 signature: c2ab2344bfa4c17273df0069e321e3a4 ******/
		%feature("compactdefaultargs") Real;
		%feature("autodoc", "Return
-------
opencascade::handle<TDataStd_Real>

Description
-----------
returns associated Real attribute.
") Real;
		opencascade::handle<TDataStd_Real> Real();

		/****** TDataStd_Variable::References ******/
		/****** md5 signature: 3409f0ad6db182e1a72fab7b19e8b252 ******/
		%feature("compactdefaultargs") References;
		%feature("autodoc", "
Parameters
----------
DS: TDF_DataSet

Return
-------
None

Description
-----------
to export reference to the associated Name attribute.
") References;
		void References(const opencascade::handle<TDF_DataSet> & DS);

		/****** TDataStd_Variable::Restore ******/
		/****** md5 signature: 8bde8d15cc1907242b8c43fe6eb18f19 ******/
		%feature("compactdefaultargs") Restore;
		%feature("autodoc", "
Parameters
----------
With: TDF_Attribute

Return
-------
None

Description
-----------
No available documentation.
") Restore;
		void Restore(const opencascade::handle<TDF_Attribute> & With);

		/****** TDataStd_Variable::Set ******/
		/****** md5 signature: e4af0d77170a04f8e261b9fb4c4bf390 ******/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "
Parameters
----------
label: TDF_Label

Return
-------
opencascade::handle<TDataStd_Variable>

Description
-----------
Find, or create, a Variable attribute. Real methods ============.
") Set;
		static opencascade::handle<TDataStd_Variable> Set(const TDF_Label & label);

		/****** TDataStd_Variable::Set ******/
		/****** md5 signature: 22b3f2af08bb65a5140e31d4b4b4ee09 ******/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "
Parameters
----------
value: double

Return
-------
None

Description
-----------
retrieve or create the associated real attribute and set the value <value>.
") Set;
		void Set(const double value);

		/****** TDataStd_Variable::Set ******/
		/****** md5 signature: 97e2eda5adb1741156a2c12a87038163 ******/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "
Parameters
----------
value: double
dimension: TDataStd_RealEnum

Return
-------
None

Description
-----------
No available documentation.
") Set;
		void Set(const double value, const TDataStd_RealEnum dimension);

		/****** TDataStd_Variable::Unit ******/
		/****** md5 signature: ff494f2fc5727fcec0378c41ef16d7cb ******/
		%feature("compactdefaultargs") Unit;
		%feature("autodoc", "
Parameters
----------
unit: str

Return
-------
None

Description
-----------
No available documentation.
") Unit;
		void Unit(TCollection_AsciiString unit);

		/****** TDataStd_Variable::Unit ******/
		/****** md5 signature: dc6e549ec212bbf5cb33509a7a23a55a ******/
		%feature("compactdefaultargs") Unit;
		%feature("autodoc", "Return
-------
TCollection_AsciiString

Description
-----------
to read/write fields ====================.
") Unit;
		const TCollection_AsciiString & Unit();

};


%make_alias(TDataStd_Variable)

%extend TDataStd_Variable {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************
* class TDataStd_Comment *
*************************/
class TDataStd_Comment : public TDataStd_GenericExtString {
	public:
		/****** TDataStd_Comment::TDataStd_Comment ******/
		/****** md5 signature: 2f2c3741ccbac7a5d1ce3d382dc2c16b ******/
		%feature("compactdefaultargs") TDataStd_Comment;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") TDataStd_Comment;
		 TDataStd_Comment();

		/****** TDataStd_Comment::Dump ******/
		/****** md5 signature: c3832f0735de2bdac14af95fe6ce7de3 ******/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "
Parameters
----------

Return
-------
anOS: Standard_OStream

Description
-----------
No available documentation.
") Dump;
		Standard_OStream & Dump(std::ostream &OutValue);

		/****** TDataStd_Comment::GetID ******/
		/****** md5 signature: afe6002d90f641ca3ea8c9ae9f8fe97c ******/
		%feature("compactdefaultargs") GetID;
		%feature("autodoc", "Return
-------
Standard_GUID

Description
-----------
class methods ============= Returns the GUID for comments.
") GetID;
		static const Standard_GUID & GetID();

		/****** TDataStd_Comment::Set ******/
		/****** md5 signature: 7aff9273210ae7933d1765a52bf89a49 ******/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "
Parameters
----------
label: TDF_Label

Return
-------
opencascade::handle<TDataStd_Comment>

Description
-----------
Find, or create a Comment attribute. the Comment attribute is returned.
") Set;
		static opencascade::handle<TDataStd_Comment> Set(const TDF_Label & label);

		/****** TDataStd_Comment::Set ******/
		/****** md5 signature: 503a74ff2909b31d3824ac4b11ac2e74 ******/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "
Parameters
----------
label: TDF_Label
string: str

Return
-------
opencascade::handle<TDataStd_Comment>

Description
-----------
Finds, or creates a Comment attribute and sets the string. the Comment attribute is returned. Comment methods ============.
") Set;
		static opencascade::handle<TDataStd_Comment> Set(const TDF_Label & label, TCollection_ExtendedString string);

		/****** TDataStd_Comment::Set ******/
		/****** md5 signature: 1acf2e7ab06e9c57f1dcbe19bf1cc78f ******/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "
Parameters
----------
S: str

Return
-------
None

Description
-----------
No available documentation.
") Set;
		void Set(TCollection_ExtendedString S);

		/****** TDataStd_Comment::SetID ******/
		/****** md5 signature: 64789516907731f72c16acfd42a0f70f ******/
		%feature("compactdefaultargs") SetID;
		%feature("autodoc", "
Parameters
----------
guid: Standard_GUID

Return
-------
None

Description
-----------
Sets the explicit user defined GUID to the attribute.
") SetID;
		void SetID(const Standard_GUID & guid);

		/****** TDataStd_Comment::SetID ******/
		/****** md5 signature: 1c04912b49b7be6319020f1d75526111 ******/
		%feature("compactdefaultargs") SetID;
		%feature("autodoc", "Return
-------
None

Description
-----------
Sets default GUID for the attribute.
") SetID;
		void SetID();

};


%make_alias(TDataStd_Comment)

%extend TDataStd_Comment {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************
* class TDataStd_Directory *
***************************/
class TDataStd_Directory : public TDataStd_GenericEmpty {
	public:
		/****** TDataStd_Directory::TDataStd_Directory ******/
		/****** md5 signature: d3b9d572e9a0f0079e175d56a6a09a8a ******/
		%feature("compactdefaultargs") TDataStd_Directory;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") TDataStd_Directory;
		 TDataStd_Directory();

		/****** TDataStd_Directory::AddDirectory ******/
		/****** md5 signature: 5c4f99d9e3566f6f2c2df77d03517116 ******/
		%feature("compactdefaultargs") AddDirectory;
		%feature("autodoc", "
Parameters
----------
dir: TDataStd_Directory

Return
-------
opencascade::handle<TDataStd_Directory>

Description
-----------
Creates a new sub-label and sets the sub-directory dir on that label.
") AddDirectory;
		static opencascade::handle<TDataStd_Directory> AddDirectory(const opencascade::handle<TDataStd_Directory> & dir);

		/****** TDataStd_Directory::Dump ******/
		/****** md5 signature: c3832f0735de2bdac14af95fe6ce7de3 ******/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "
Parameters
----------

Return
-------
anOS: Standard_OStream

Description
-----------
No available documentation.
") Dump;
		Standard_OStream & Dump(std::ostream &OutValue);

		/****** TDataStd_Directory::Find ******/
		/****** md5 signature: 5bce92acf7a0fbd2a99a82729a4459e9 ******/
		%feature("compactdefaultargs") Find;
		%feature("autodoc", "
Parameters
----------
current: TDF_Label
D: TDataStd_Directory

Return
-------
bool

Description
-----------
class methods ============= Searches for a directory attribute on the label current, or on one of the father labels of current. If a directory attribute is found, true is returned, and the attribute found is set as D.
") Find;
		static bool Find(const TDF_Label & current, opencascade::handle<TDataStd_Directory> & D);

		/****** TDataStd_Directory::GetID ******/
		/****** md5 signature: afe6002d90f641ca3ea8c9ae9f8fe97c ******/
		%feature("compactdefaultargs") GetID;
		%feature("autodoc", "Return
-------
Standard_GUID

Description
-----------
Directory methods ===============.
") GetID;
		static const Standard_GUID & GetID();

		/****** TDataStd_Directory::ID ******/
		/****** md5 signature: 90e2a7836a98c0274891df8231c5ae76 ******/
		%feature("compactdefaultargs") ID;
		%feature("autodoc", "Return
-------
Standard_GUID

Description
-----------
No available documentation.
") ID;
		const Standard_GUID & ID();

		/****** TDataStd_Directory::MakeObjectLabel ******/
		/****** md5 signature: db423c43f233e6e25e616ab0b00559be ******/
		%feature("compactdefaultargs") MakeObjectLabel;
		%feature("autodoc", "
Parameters
----------
dir: TDataStd_Directory

Return
-------
TDF_Label

Description
-----------
Makes new label and returns it to insert other object attributes (sketch,part...etc...).
") MakeObjectLabel;
		static TDF_Label MakeObjectLabel(const opencascade::handle<TDataStd_Directory> & dir);

		/****** TDataStd_Directory::New ******/
		/****** md5 signature: 5df5803fde1fbb05cfc38fb2ecf2de6c ******/
		%feature("compactdefaultargs") New;
		%feature("autodoc", "
Parameters
----------
label: TDF_Label

Return
-------
opencascade::handle<TDataStd_Directory>

Description
-----------
Creates an empty Directory attribute, located at <label>. Raises if <label> has attribute.
") New;
		static opencascade::handle<TDataStd_Directory> New(const TDF_Label & label);

};


%make_alias(TDataStd_Directory)

%extend TDataStd_Directory {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************
* class TDataStd_Name *
**********************/
class TDataStd_Name : public TDataStd_GenericExtString {
	public:
		/****** TDataStd_Name::TDataStd_Name ******/
		/****** md5 signature: bb0eed56139ed947031c6e938967fa41 ******/
		%feature("compactdefaultargs") TDataStd_Name;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") TDataStd_Name;
		 TDataStd_Name();

		/****** TDataStd_Name::Dump ******/
		/****** md5 signature: c3832f0735de2bdac14af95fe6ce7de3 ******/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "
Parameters
----------

Return
-------
anOS: Standard_OStream

Description
-----------
No available documentation.
") Dump;
		Standard_OStream & Dump(std::ostream &OutValue);

		/****** TDataStd_Name::GetID ******/
		/****** md5 signature: afe6002d90f641ca3ea8c9ae9f8fe97c ******/
		%feature("compactdefaultargs") GetID;
		%feature("autodoc", "Return
-------
Standard_GUID

Description
-----------
class methods working on the name itself ======================================== Returns the GUID for name attributes.
") GetID;
		static const Standard_GUID & GetID();

		/****** TDataStd_Name::Set ******/
		/****** md5 signature: bfbe265f341d6a99b31e5f340b9002d9 ******/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "
Parameters
----------
label: TDF_Label
string: str

Return
-------
opencascade::handle<TDataStd_Name>

Description
-----------
Creates (if does not exist) and sets the name in the name attribute. from any label <L> search in father labels (L is not concerned) the first name attribute. if found set it in <father>. class methods working on the name tree ====================================== Search in the whole TDF_Data the Name attribute which fit with <fullPath>. Returns True if found. Search under <currentLabel> a label which fit with <name>. Returns True if found. Shortcut which avoids building a ListOfExtendedStrin. Search in the whole TDF_Data the label which fit with name Returns True if found. tools methods to translate path <-> pathlist =========================================== move to draw For Draw test we may provide this tool method which convert a path in a sequence of string to call after the FindLabel methods. Example: if it's given 'Assembly:Part_1:Sketch_5' it will return in <pathlist> the list of 3 strings: 'Assembly','Part_1','Sketch_5'. move to draw from <pathlist> build the string path Name methods ============.
") Set;
		static opencascade::handle<TDataStd_Name> Set(const TDF_Label & label, TCollection_ExtendedString string);

		/****** TDataStd_Name::Set ******/
		/****** md5 signature: d6ce2b5adb6750199ce8d7f1e385b58f ******/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "
Parameters
----------
label: TDF_Label
guid: Standard_GUID
string: str

Return
-------
opencascade::handle<TDataStd_Name>

Description
-----------
Finds, or creates, a Name attribute with explicit user defined <guid> and sets <string>. The Name attribute is returned.
") Set;
		static opencascade::handle<TDataStd_Name> Set(const TDF_Label & label, const Standard_GUID & guid, TCollection_ExtendedString string);

		/****** TDataStd_Name::Set ******/
		/****** md5 signature: 1acf2e7ab06e9c57f1dcbe19bf1cc78f ******/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "
Parameters
----------
S: str

Return
-------
None

Description
-----------
Sets <S> as name. Raises if <S> is not a valid name.
") Set;
		void Set(TCollection_ExtendedString S);

		/****** TDataStd_Name::SetID ******/
		/****** md5 signature: 64789516907731f72c16acfd42a0f70f ******/
		%feature("compactdefaultargs") SetID;
		%feature("autodoc", "
Parameters
----------
guid: Standard_GUID

Return
-------
None

Description
-----------
Sets the explicit user defined GUID to the attribute.
") SetID;
		void SetID(const Standard_GUID & guid);

		/****** TDataStd_Name::SetID ******/
		/****** md5 signature: 1c04912b49b7be6319020f1d75526111 ******/
		%feature("compactdefaultargs") SetID;
		%feature("autodoc", "Return
-------
None

Description
-----------
Sets default GUID for the attribute.
") SetID;
		void SetID();

};


%make_alias(TDataStd_Name)

%extend TDataStd_Name {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************
* class TDataStd_NoteBook *
**************************/
class TDataStd_NoteBook : public TDataStd_GenericEmpty {
	public:
		/****** TDataStd_NoteBook::TDataStd_NoteBook ******/
		/****** md5 signature: 9d531eae5ef1dd7b80ad3d6be9ce2a48 ******/
		%feature("compactdefaultargs") TDataStd_NoteBook;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") TDataStd_NoteBook;
		 TDataStd_NoteBook();

		/****** TDataStd_NoteBook::Append ******/
		/****** md5 signature: d681ce394d4d019f0886c46d2442be09 ******/
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "
Parameters
----------
value: double
isExported: bool (optional, default to false)

Return
-------
opencascade::handle<TDataStd_Real>

Description
-----------
Tool to Create an Integer attribute from <value>, Insert it in a new son label of <self>. The Real attribute is returned.
") Append;
		opencascade::handle<TDataStd_Real> Append(const double value, const bool isExported = false);

		/****** TDataStd_NoteBook::Append ******/
		/****** md5 signature: 39d8309fbd6e6bb96e3dafac1f18d924 ******/
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "
Parameters
----------
value: int
isExported: bool (optional, default to false)

Return
-------
opencascade::handle<TDataStd_Integer>

Description
-----------
Tool to Create an Real attribute from <value>, Insert it in a new son label of <self>. The Integer attribute is returned.
") Append;
		opencascade::handle<TDataStd_Integer> Append(const int value, const bool isExported = false);

		/****** TDataStd_NoteBook::Dump ******/
		/****** md5 signature: c3832f0735de2bdac14af95fe6ce7de3 ******/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "
Parameters
----------

Return
-------
anOS: Standard_OStream

Description
-----------
No available documentation.
") Dump;
		Standard_OStream & Dump(std::ostream &OutValue);

		/****** TDataStd_NoteBook::Find ******/
		/****** md5 signature: 853ec91d352dbc7705011f839ce97bf2 ******/
		%feature("compactdefaultargs") Find;
		%feature("autodoc", "
Parameters
----------
current: TDF_Label
N: TDataStd_NoteBook

Return
-------
bool

Description
-----------
class methods ============= try to retrieve a NoteBook attribute at <current> label or in fathers label of <current>. Returns True if found and set <N>.
") Find;
		static bool Find(const TDF_Label & current, opencascade::handle<TDataStd_NoteBook> & N);

		/****** TDataStd_NoteBook::GetID ******/
		/****** md5 signature: afe6002d90f641ca3ea8c9ae9f8fe97c ******/
		%feature("compactdefaultargs") GetID;
		%feature("autodoc", "Return
-------
Standard_GUID

Description
-----------
NoteBook methods ===============.
") GetID;
		static const Standard_GUID & GetID();

		/****** TDataStd_NoteBook::ID ******/
		/****** md5 signature: 90e2a7836a98c0274891df8231c5ae76 ******/
		%feature("compactdefaultargs") ID;
		%feature("autodoc", "Return
-------
Standard_GUID

Description
-----------
No available documentation.
") ID;
		const Standard_GUID & ID();

		/****** TDataStd_NoteBook::New ******/
		/****** md5 signature: a02ef42106eb0cec4504ab57a99400d3 ******/
		%feature("compactdefaultargs") New;
		%feature("autodoc", "
Parameters
----------
label: TDF_Label

Return
-------
opencascade::handle<TDataStd_NoteBook>

Description
-----------
Create an enpty NoteBook attribute, located at <label>. Raises if <label> has attribute.
") New;
		static opencascade::handle<TDataStd_NoteBook> New(const TDF_Label & label);

};


%make_alias(TDataStd_NoteBook)

%extend TDataStd_NoteBook {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************
* class TDataStd_Relation *
**************************/
class TDataStd_Relation : public TDataStd_Expression {
	public:
		/****** TDataStd_Relation::TDataStd_Relation ******/
		/****** md5 signature: e2728d158cd6835bfe4ededc5ccddf26 ******/
		%feature("compactdefaultargs") TDataStd_Relation;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") TDataStd_Relation;
		 TDataStd_Relation();

		/****** TDataStd_Relation::Dump ******/
		/****** md5 signature: c3832f0735de2bdac14af95fe6ce7de3 ******/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "
Parameters
----------

Return
-------
anOS: Standard_OStream

Description
-----------
No available documentation.
") Dump;
		Standard_OStream & Dump(std::ostream &OutValue);


        /****************** DumpJson ******************/
        %feature("autodoc", "
Parameters
----------
depth: int, default=-1

Return
-------
str

Description
-----------
Dump the object to JSON string.
") DumpJson;
        %extend{
            std::string DumpJson(int depth=-1) {
            std::stringstream s;
            self->DumpJson(s, depth);
            return "{" + s.str() + "}" ;}
        };
		/****** TDataStd_Relation::GetID ******/
		/****** md5 signature: afe6002d90f641ca3ea8c9ae9f8fe97c ******/
		%feature("compactdefaultargs") GetID;
		%feature("autodoc", "Return
-------
Standard_GUID

Description
-----------
class methods =============.
") GetID;
		static const Standard_GUID & GetID();

		/****** TDataStd_Relation::GetRelation ******/
		/****** md5 signature: 9a760a60866ee882febabe61f33bef73 ******/
		%feature("compactdefaultargs") GetRelation;
		%feature("autodoc", "Return
-------
TCollection_ExtendedString

Description
-----------
No available documentation.
") GetRelation;
		const TCollection_ExtendedString & GetRelation();

		/****** TDataStd_Relation::ID ******/
		/****** md5 signature: 90e2a7836a98c0274891df8231c5ae76 ******/
		%feature("compactdefaultargs") ID;
		%feature("autodoc", "Return
-------
Standard_GUID

Description
-----------
No available documentation.
") ID;
		const Standard_GUID & ID();

		/****** TDataStd_Relation::Set ******/
		/****** md5 signature: 2a4cde76807e5d1258840493d4e69032 ******/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "
Parameters
----------
label: TDF_Label

Return
-------
opencascade::handle<TDataStd_Relation>

Description
-----------
Find, or create, an Relation attribute. Real methods ============.
") Set;
		static opencascade::handle<TDataStd_Relation> Set(const TDF_Label & label);

		/****** TDataStd_Relation::SetRelation ******/
		/****** md5 signature: 9b48e0039287e75d85edb77a4c19ad95 ******/
		%feature("compactdefaultargs") SetRelation;
		%feature("autodoc", "
Parameters
----------
E: str

Return
-------
None

Description
-----------
No available documentation.
") SetRelation;
		void SetRelation(TCollection_ExtendedString E);

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
class TDataStd_Tick : public TDataStd_GenericEmpty {
	public:
		/****** TDataStd_Tick::TDataStd_Tick ******/
		/****** md5 signature: a26d0e9a1ea99ba56a5b60641b8967ca ******/
		%feature("compactdefaultargs") TDataStd_Tick;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") TDataStd_Tick;
		 TDataStd_Tick();

		/****** TDataStd_Tick::Dump ******/
		/****** md5 signature: c3832f0735de2bdac14af95fe6ce7de3 ******/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "
Parameters
----------

Return
-------
anOS: Standard_OStream

Description
-----------
No available documentation.
") Dump;
		Standard_OStream & Dump(std::ostream &OutValue);

		/****** TDataStd_Tick::GetID ******/
		/****** md5 signature: afe6002d90f641ca3ea8c9ae9f8fe97c ******/
		%feature("compactdefaultargs") GetID;
		%feature("autodoc", "Return
-------
Standard_GUID

Description
-----------
Static methods ==============.
") GetID;
		static const Standard_GUID & GetID();

		/****** TDataStd_Tick::ID ******/
		/****** md5 signature: 90e2a7836a98c0274891df8231c5ae76 ******/
		%feature("compactdefaultargs") ID;
		%feature("autodoc", "Return
-------
Standard_GUID

Description
-----------
No available documentation.
") ID;
		const Standard_GUID & ID();

		/****** TDataStd_Tick::Set ******/
		/****** md5 signature: a98facae6bc4fd10dad3a306e6332dfb ******/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "
Parameters
----------
label: TDF_Label

Return
-------
opencascade::handle<TDataStd_Tick>

Description
-----------
Find, or create, a Tick attribute. Tick methods ============.
") Set;
		static opencascade::handle<TDataStd_Tick> Set(const TDF_Label & label);

};


%make_alias(TDataStd_Tick)

%extend TDataStd_Tick {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/* python proxy for excluded classes */
%pythoncode {
@classnotwrapped
class TDataStd_GenericEmpty:
	pass

@classnotwrapped
class TDataStd_GenericExtString:
	pass

}
/* end python proxy for excluded classes */
/* harray1 classes */

class TDataStd_HLabelArray1 : public NCollection_Array1<TDF_Label>, public Standard_Transient {
  public:
    TDataStd_HLabelArray1(const Standard_Integer theLower, const Standard_Integer theUpper);
    TDataStd_HLabelArray1(const Standard_Integer theLower, const Standard_Integer theUpper, const NCollection_Array1<TDF_Label>::value_type& theValue);
    TDataStd_HLabelArray1(const NCollection_Array1<TDF_Label>& theOther);
    const NCollection_Array1<TDF_Label>& Array1();
    NCollection_Array1<TDF_Label>& ChangeArray1();
};
%make_alias(TDataStd_HLabelArray1)

/* harray2 classes */
/* hsequence classes */
/* class aliases */
%pythoncode {
}
/* deprecated methods */
%pythoncode {
@deprecated
def tdatastd_IDList(*args):
	return tdatastd.IDList(*args)

@deprecated
def tdatastd_Print(*args):
	return tdatastd.Print(*args)

@deprecated
def TDataStd_AsciiString_GetID(*args):
	return TDataStd_AsciiString.GetID(*args)

@deprecated
def TDataStd_AsciiString_Set(*args):
	return TDataStd_AsciiString.Set(*args)

@deprecated
def TDataStd_AsciiString_Set(*args):
	return TDataStd_AsciiString.Set(*args)

@deprecated
def TDataStd_BooleanArray_GetID(*args):
	return TDataStd_BooleanArray.GetID(*args)

@deprecated
def TDataStd_BooleanArray_Set(*args):
	return TDataStd_BooleanArray.Set(*args)

@deprecated
def TDataStd_BooleanArray_Set(*args):
	return TDataStd_BooleanArray.Set(*args)

@deprecated
def TDataStd_BooleanList_GetID(*args):
	return TDataStd_BooleanList.GetID(*args)

@deprecated
def TDataStd_BooleanList_Set(*args):
	return TDataStd_BooleanList.Set(*args)

@deprecated
def TDataStd_BooleanList_Set(*args):
	return TDataStd_BooleanList.Set(*args)

@deprecated
def TDataStd_ByteArray_GetID(*args):
	return TDataStd_ByteArray.GetID(*args)

@deprecated
def TDataStd_ByteArray_Set(*args):
	return TDataStd_ByteArray.Set(*args)

@deprecated
def TDataStd_ByteArray_Set(*args):
	return TDataStd_ByteArray.Set(*args)

@deprecated
def TDataStd_Current_Get(*args):
	return TDataStd_Current.Get(*args)

@deprecated
def TDataStd_Current_GetID(*args):
	return TDataStd_Current.GetID(*args)

@deprecated
def TDataStd_Current_Has(*args):
	return TDataStd_Current.Has(*args)

@deprecated
def TDataStd_Current_Set(*args):
	return TDataStd_Current.Set(*args)

@deprecated
def TDataStd_Expression_GetID(*args):
	return TDataStd_Expression.GetID(*args)

@deprecated
def TDataStd_Expression_Set(*args):
	return TDataStd_Expression.Set(*args)

@deprecated
def TDataStd_ExtStringArray_GetID(*args):
	return TDataStd_ExtStringArray.GetID(*args)

@deprecated
def TDataStd_ExtStringArray_Set(*args):
	return TDataStd_ExtStringArray.Set(*args)

@deprecated
def TDataStd_ExtStringArray_Set(*args):
	return TDataStd_ExtStringArray.Set(*args)

@deprecated
def TDataStd_ExtStringList_GetID(*args):
	return TDataStd_ExtStringList.GetID(*args)

@deprecated
def TDataStd_ExtStringList_Set(*args):
	return TDataStd_ExtStringList.Set(*args)

@deprecated
def TDataStd_ExtStringList_Set(*args):
	return TDataStd_ExtStringList.Set(*args)

@deprecated
def TDataStd_IntPackedMap_GetID(*args):
	return TDataStd_IntPackedMap.GetID(*args)

@deprecated
def TDataStd_IntPackedMap_Set(*args):
	return TDataStd_IntPackedMap.Set(*args)

@deprecated
def TDataStd_Integer_GetID(*args):
	return TDataStd_Integer.GetID(*args)

@deprecated
def TDataStd_Integer_Set(*args):
	return TDataStd_Integer.Set(*args)

@deprecated
def TDataStd_Integer_Set(*args):
	return TDataStd_Integer.Set(*args)

@deprecated
def TDataStd_IntegerArray_GetID(*args):
	return TDataStd_IntegerArray.GetID(*args)

@deprecated
def TDataStd_IntegerArray_Set(*args):
	return TDataStd_IntegerArray.Set(*args)

@deprecated
def TDataStd_IntegerArray_Set(*args):
	return TDataStd_IntegerArray.Set(*args)

@deprecated
def TDataStd_IntegerList_GetID(*args):
	return TDataStd_IntegerList.GetID(*args)

@deprecated
def TDataStd_IntegerList_Set(*args):
	return TDataStd_IntegerList.Set(*args)

@deprecated
def TDataStd_IntegerList_Set(*args):
	return TDataStd_IntegerList.Set(*args)

@deprecated
def TDataStd_NamedData_GetID(*args):
	return TDataStd_NamedData.GetID(*args)

@deprecated
def TDataStd_NamedData_Set(*args):
	return TDataStd_NamedData.Set(*args)

@deprecated
def TDataStd_Real_GetID(*args):
	return TDataStd_Real.GetID(*args)

@deprecated
def TDataStd_Real_Set(*args):
	return TDataStd_Real.Set(*args)

@deprecated
def TDataStd_Real_Set(*args):
	return TDataStd_Real.Set(*args)

@deprecated
def TDataStd_RealArray_GetID(*args):
	return TDataStd_RealArray.GetID(*args)

@deprecated
def TDataStd_RealArray_Set(*args):
	return TDataStd_RealArray.Set(*args)

@deprecated
def TDataStd_RealArray_Set(*args):
	return TDataStd_RealArray.Set(*args)

@deprecated
def TDataStd_RealList_GetID(*args):
	return TDataStd_RealList.GetID(*args)

@deprecated
def TDataStd_RealList_Set(*args):
	return TDataStd_RealList.Set(*args)

@deprecated
def TDataStd_RealList_Set(*args):
	return TDataStd_RealList.Set(*args)

@deprecated
def TDataStd_ReferenceArray_GetID(*args):
	return TDataStd_ReferenceArray.GetID(*args)

@deprecated
def TDataStd_ReferenceArray_Set(*args):
	return TDataStd_ReferenceArray.Set(*args)

@deprecated
def TDataStd_ReferenceArray_Set(*args):
	return TDataStd_ReferenceArray.Set(*args)

@deprecated
def TDataStd_ReferenceList_GetID(*args):
	return TDataStd_ReferenceList.GetID(*args)

@deprecated
def TDataStd_ReferenceList_Set(*args):
	return TDataStd_ReferenceList.Set(*args)

@deprecated
def TDataStd_ReferenceList_Set(*args):
	return TDataStd_ReferenceList.Set(*args)

@deprecated
def TDataStd_TreeNode_Find(*args):
	return TDataStd_TreeNode.Find(*args)

@deprecated
def TDataStd_TreeNode_GetDefaultTreeID(*args):
	return TDataStd_TreeNode.GetDefaultTreeID(*args)

@deprecated
def TDataStd_TreeNode_Set(*args):
	return TDataStd_TreeNode.Set(*args)

@deprecated
def TDataStd_TreeNode_Set(*args):
	return TDataStd_TreeNode.Set(*args)

@deprecated
def TDataStd_UAttribute_Set(*args):
	return TDataStd_UAttribute.Set(*args)

@deprecated
def TDataStd_Variable_GetID(*args):
	return TDataStd_Variable.GetID(*args)

@deprecated
def TDataStd_Variable_Set(*args):
	return TDataStd_Variable.Set(*args)

@deprecated
def TDataStd_Comment_GetID(*args):
	return TDataStd_Comment.GetID(*args)

@deprecated
def TDataStd_Comment_Set(*args):
	return TDataStd_Comment.Set(*args)

@deprecated
def TDataStd_Comment_Set(*args):
	return TDataStd_Comment.Set(*args)

@deprecated
def TDataStd_Directory_AddDirectory(*args):
	return TDataStd_Directory.AddDirectory(*args)

@deprecated
def TDataStd_Directory_Find(*args):
	return TDataStd_Directory.Find(*args)

@deprecated
def TDataStd_Directory_GetID(*args):
	return TDataStd_Directory.GetID(*args)

@deprecated
def TDataStd_Directory_MakeObjectLabel(*args):
	return TDataStd_Directory.MakeObjectLabel(*args)

@deprecated
def TDataStd_Directory_New(*args):
	return TDataStd_Directory.New(*args)

@deprecated
def TDataStd_Name_GetID(*args):
	return TDataStd_Name.GetID(*args)

@deprecated
def TDataStd_Name_Set(*args):
	return TDataStd_Name.Set(*args)

@deprecated
def TDataStd_Name_Set(*args):
	return TDataStd_Name.Set(*args)

@deprecated
def TDataStd_NoteBook_Find(*args):
	return TDataStd_NoteBook.Find(*args)

@deprecated
def TDataStd_NoteBook_GetID(*args):
	return TDataStd_NoteBook.GetID(*args)

@deprecated
def TDataStd_NoteBook_New(*args):
	return TDataStd_NoteBook.New(*args)

@deprecated
def TDataStd_Relation_GetID(*args):
	return TDataStd_Relation.GetID(*args)

@deprecated
def TDataStd_Relation_Set(*args):
	return TDataStd_Relation.Set(*args)

@deprecated
def TDataStd_Tick_GetID(*args):
	return TDataStd_Tick.GetID(*args)

@deprecated
def TDataStd_Tick_Set(*args):
	return TDataStd_Tick.Set(*args)

}
