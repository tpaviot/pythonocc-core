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
%define TDATASTDDOCSTRING
"TDataStd module, see official documentation at
https://dev.opencascade.org/doc/occt-7.8.0/refman/html/package_tdatastd.html"
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
%wrap_handle(TDataStd_HLabelArray1)
/* end handles declaration */

/* templates */
%template(TDataStd_DataMapOfStringByte) NCollection_DataMap<TCollection_ExtendedString,Standard_Byte>;
%template(TDataStd_DataMapOfStringHArray1OfInteger) NCollection_DataMap<TCollection_ExtendedString,opencascade::handle<TColStd_HArray1OfInteger>>;
%template(TDataStd_DataMapOfStringHArray1OfReal) NCollection_DataMap<TCollection_ExtendedString,opencascade::handle<TColStd_HArray1OfReal>>;
%template(TDataStd_DataMapOfStringReal) NCollection_DataMap<TCollection_ExtendedString,Standard_Real>;
%template(TDataStd_DataMapOfStringString) NCollection_DataMap<TCollection_ExtendedString,TCollection_ExtendedString>;
%template(TDataStd_LabelArray1) NCollection_Array1<TDF_Label>;
Array1ExtendIter(TDF_Label)

%template(TDataStd_ListIteratorOfListOfByte) NCollection_TListIterator<Standard_Byte>;
%template(TDataStd_ListIteratorOfListOfExtendedString) NCollection_TListIterator<TCollection_ExtendedString>;
%template(TDataStd_ListOfByte) NCollection_List<Standard_Byte>;

%extend NCollection_List<Standard_Byte> {
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
typedef NCollection_DataMap<TCollection_ExtendedString, Standard_Byte>::Iterator TDataStd_DataMapIteratorOfDataMapOfStringByte;
typedef NCollection_DataMap<TCollection_ExtendedString, opencascade::handle<TColStd_HArray1OfInteger>>::Iterator TDataStd_DataMapIteratorOfDataMapOfStringHArray1OfInteger;
typedef NCollection_DataMap<TCollection_ExtendedString, opencascade::handle<TColStd_HArray1OfReal>>::Iterator TDataStd_DataMapIteratorOfDataMapOfStringHArray1OfReal;
typedef NCollection_DataMap<TCollection_ExtendedString, Standard_Real>::Iterator TDataStd_DataMapIteratorOfDataMapOfStringReal;
typedef NCollection_DataMap<TCollection_ExtendedString, TCollection_ExtendedString>::Iterator TDataStd_DataMapIteratorOfDataMapOfStringString;
typedef NCollection_DataMap<TCollection_ExtendedString, Standard_Byte> TDataStd_DataMapOfStringByte;
typedef NCollection_DataMap<TCollection_ExtendedString, opencascade::handle<TColStd_HArray1OfInteger>> TDataStd_DataMapOfStringHArray1OfInteger;
typedef NCollection_DataMap<TCollection_ExtendedString, opencascade::handle<TColStd_HArray1OfReal>> TDataStd_DataMapOfStringHArray1OfReal;
typedef NCollection_DataMap<TCollection_ExtendedString, Standard_Real> TDataStd_DataMapOfStringReal;
typedef NCollection_DataMap<TCollection_ExtendedString, TCollection_ExtendedString> TDataStd_DataMapOfStringString;
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
		/****** TDataStd::IDList ******/
		/****** md5 signature: 97de0b35f4f6abc04a631c65d32bacc4 ******/
		%feature("compactdefaultargs") IDList;
		%feature("autodoc", "
Parameters
----------
anIDList: TDF_IDList

Return
-------
None

Description
-----------
Appends to <anIDList> the list of the attributes IDs of this package. CAUTION: <anIDList> is NOT cleared before use.
") IDList;
		static void IDList(TDF_IDList & anIDList);

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
		/****** md5 signature: 3398f1042b24f9ae49f7e8da6125f793 ******/
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
		virtual Standard_OStream & Dump(std::ostream &OutValue);


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
		/****** md5 signature: 4697ce8a095fa6dcef0217708d19718f ******/
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
		/****** md5 signature: 6ab5e1ad63f93168856ab126dd374b81 ******/
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsEmpty;
		Standard_Boolean IsEmpty();

		/****** TDataStd_AsciiString::NewEmpty ******/
		/****** md5 signature: c6d13c9ecc64c6c803b6e119e8216934 ******/
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
		/****** md5 signature: a6ff306a759c68a191c0262635db980f ******/
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
		/****** md5 signature: ddeae219d389a1d89eecb3e23c73522a ******/
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
		/****** md5 signature: 7a929ce753effeac220c978ae7330330 ******/
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
		/****** md5 signature: 244d113ae14add83954353ca15ede66b ******/
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
		/****** md5 signature: b935d5dd68e95802ac42f7875d3b6b15 ******/
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
		virtual Standard_OStream & Dump(std::ostream &OutValue);


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
		/****** md5 signature: 4697ce8a095fa6dcef0217708d19718f ******/
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
		/****** md5 signature: 7821d9c43d1b72a2a51576c8503c10d4 ******/
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
		void Init(const Standard_Integer lower, const Standard_Integer upper);

		/****** TDataStd_BooleanArray::InternalArray ******/
		/****** md5 signature: 61a39b353105b740896ae484cb34e848 ******/
		%feature("compactdefaultargs") InternalArray;
		%feature("autodoc", "Return
-------
opencascade::handle<TColStd_HArray1OfByte>

Description
-----------
No available documentation.
") InternalArray;
		const opencascade::handle<TColStd_HArray1OfByte> & InternalArray();

		/****** TDataStd_BooleanArray::Length ******/
		/****** md5 signature: 58bd40380acccb2733bfbd37bf3cbb11 ******/
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of elements in the array.
") Length;
		Standard_Integer Length();

		/****** TDataStd_BooleanArray::Lower ******/
		/****** md5 signature: fe1655437e349162aeffc9b3814347af ******/
		%feature("compactdefaultargs") Lower;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the lower boundary of the array.
") Lower;
		Standard_Integer Lower();

		/****** TDataStd_BooleanArray::NewEmpty ******/
		/****** md5 signature: c6d13c9ecc64c6c803b6e119e8216934 ******/
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
		/****** md5 signature: a6ff306a759c68a191c0262635db980f ******/
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
		/****** md5 signature: ddeae219d389a1d89eecb3e23c73522a ******/
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
		/****** md5 signature: 3d0966f83c918bab665b182f6f3772af ******/
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
		static opencascade::handle<TDataStd_BooleanArray> Set(const TDF_Label & label, const Standard_Integer lower, const Standard_Integer upper);

		/****** TDataStd_BooleanArray::Set ******/
		/****** md5 signature: 08a5308f0fac1f619bcf995915c3963f ******/
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
		static opencascade::handle<TDataStd_BooleanArray> Set(const TDF_Label & label, const Standard_GUID & theGuid, const Standard_Integer lower, const Standard_Integer upper);

		/****** TDataStd_BooleanArray::SetID ******/
		/****** md5 signature: 9bed89522d0b510ace46b6aebec92ee0 ******/
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
		/****** md5 signature: 244d113ae14add83954353ca15ede66b ******/
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
		/****** md5 signature: af07cdaee81199f417a2cec4b4522441 ******/
		%feature("compactdefaultargs") SetInternalArray;
		%feature("autodoc", "
Parameters
----------
values: TColStd_HArray1OfByte

Return
-------
None

Description
-----------
No available documentation.
") SetInternalArray;
		void SetInternalArray(const opencascade::handle<TColStd_HArray1OfByte> & values);

		/****** TDataStd_BooleanArray::SetValue ******/
		/****** md5 signature: 605aad63026d3d412637dcaebee62f2e ******/
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
		void SetValue(const Standard_Integer index, const Standard_Boolean value);

		/****** TDataStd_BooleanArray::Upper ******/
		/****** md5 signature: 8f614b31058bb30bdf81ecd0e2d444dc ******/
		%feature("compactdefaultargs") Upper;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the upper boundary of the array.
") Upper;
		Standard_Integer Upper();

		/****** TDataStd_BooleanArray::Value ******/
		/****** md5 signature: 40dedbbf4e5af7f5ac65490d1e98c0c8 ******/
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
		/****** md5 signature: 83ceeaaba0bf39e19a46a2ebf946e6d5 ******/
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
		void Append(const Standard_Boolean value);

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
		/****** md5 signature: 3398f1042b24f9ae49f7e8da6125f793 ******/
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
		virtual Standard_OStream & Dump(std::ostream &OutValue);


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
		/****** md5 signature: 8da0d7e03de513b08d57e17232ac7391 ******/
		%feature("compactdefaultargs") Extent;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") Extent;
		Standard_Integer Extent();

		/****** TDataStd_BooleanList::First ******/
		/****** md5 signature: 65da73e94c21352acce8ef43e35ce0bd ******/
		%feature("compactdefaultargs") First;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") First;
		Standard_Boolean First();

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
		/****** md5 signature: 4697ce8a095fa6dcef0217708d19718f ******/
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
		/****** md5 signature: 23751c9003f707933931dd2222fa1474 ******/
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
		Standard_Boolean InsertAfter(const Standard_Integer index, const Standard_Boolean after_value);

		/****** TDataStd_BooleanList::InsertBefore ******/
		/****** md5 signature: bba1fc07c146a59994586980b2f68a56 ******/
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
		Standard_Boolean InsertBefore(const Standard_Integer index, const Standard_Boolean before_value);

		/****** TDataStd_BooleanList::IsEmpty ******/
		/****** md5 signature: 6ab5e1ad63f93168856ab126dd374b81 ******/
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsEmpty;
		Standard_Boolean IsEmpty();

		/****** TDataStd_BooleanList::Last ******/
		/****** md5 signature: 89e81e8e3fe45fc4c83ee1f19bb07686 ******/
		%feature("compactdefaultargs") Last;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") Last;
		Standard_Boolean Last();

		/****** TDataStd_BooleanList::List ******/
		/****** md5 signature: 1e1c7319a6ab5a44a30c67114ec285e8 ******/
		%feature("compactdefaultargs") List;
		%feature("autodoc", "Return
-------
TDataStd_ListOfByte

Description
-----------
1 - means True, 0 - means False.
") List;
		const TDataStd_ListOfByte & List();

		/****** TDataStd_BooleanList::NewEmpty ******/
		/****** md5 signature: c6d13c9ecc64c6c803b6e119e8216934 ******/
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
		/****** md5 signature: a6ff306a759c68a191c0262635db980f ******/
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
		/****** md5 signature: e786583abf4210ef9996431ab3fd12d9 ******/
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
		void Prepend(const Standard_Boolean value);

		/****** TDataStd_BooleanList::Remove ******/
		/****** md5 signature: d5758943c335a06d32f07ab2389e0fe6 ******/
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
		Standard_Boolean Remove(const Standard_Integer index);

		/****** TDataStd_BooleanList::Restore ******/
		/****** md5 signature: ddeae219d389a1d89eecb3e23c73522a ******/
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
		/****** md5 signature: 9bed89522d0b510ace46b6aebec92ee0 ******/
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
		/****** md5 signature: 244d113ae14add83954353ca15ede66b ******/
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
		/****** md5 signature: ad4bd7d1235654a95c892998f600cc5c ******/
		%feature("compactdefaultargs") ChangeArray;
		%feature("autodoc", "
Parameters
----------
newArray: TColStd_HArray1OfByte
isCheckItems: bool (optional, default to Standard_True)

Return
-------
None

Description
-----------
Sets the inner array <myValue> of the attribute to <newArray>. If value of <newArray> differs from <myValue>, Backup performed and myValue refers to new instance of HArray1OfInteger that holds <newArray> values. If <isCheckItems> equal True each item of <newArray> will be checked with each item of <myValue> for coincidence (to avoid backup).
") ChangeArray;
		void ChangeArray(const opencascade::handle<TColStd_HArray1OfByte> & newArray, const Standard_Boolean isCheckItems = Standard_True);

		/****** TDataStd_ByteArray::DeltaOnModification ******/
		/****** md5 signature: 9a96ec815d43dd1838c022740c5327d0 ******/
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
		virtual opencascade::handle<TDF_DeltaOnModification> DeltaOnModification(const opencascade::handle<TDF_Attribute> & anOldAttribute);

		/****** TDataStd_ByteArray::Dump ******/
		/****** md5 signature: b935d5dd68e95802ac42f7875d3b6b15 ******/
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
		virtual Standard_OStream & Dump(std::ostream &OutValue);


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
		/****** md5 signature: 570a92cb77e1626ccd16d9bb8bc3044c ******/
		%feature("compactdefaultargs") GetDelta;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") GetDelta;
		Standard_Boolean GetDelta();

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
		/****** md5 signature: 4697ce8a095fa6dcef0217708d19718f ******/
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
		/****** md5 signature: 7821d9c43d1b72a2a51576c8503c10d4 ******/
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
		void Init(const Standard_Integer lower, const Standard_Integer upper);

		/****** TDataStd_ByteArray::InternalArray ******/
		/****** md5 signature: eca14aaa6184d37684110db37ee46538 ******/
		%feature("compactdefaultargs") InternalArray;
		%feature("autodoc", "Return
-------
opencascade::handle<TColStd_HArray1OfByte>

Description
-----------
No available documentation.
") InternalArray;
		const opencascade::handle<TColStd_HArray1OfByte> & InternalArray();

		/****** TDataStd_ByteArray::Length ******/
		/****** md5 signature: 58bd40380acccb2733bfbd37bf3cbb11 ******/
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of elements in the array.
") Length;
		Standard_Integer Length();

		/****** TDataStd_ByteArray::Lower ******/
		/****** md5 signature: fe1655437e349162aeffc9b3814347af ******/
		%feature("compactdefaultargs") Lower;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the lower boundary of the array.
") Lower;
		Standard_Integer Lower();

		/****** TDataStd_ByteArray::NewEmpty ******/
		/****** md5 signature: c6d13c9ecc64c6c803b6e119e8216934 ******/
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
		/****** md5 signature: a6ff306a759c68a191c0262635db980f ******/
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
		/****** md5 signature: ddeae219d389a1d89eecb3e23c73522a ******/
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
		/****** md5 signature: aaf065a24a5e11f591e7643080ae324c ******/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "
Parameters
----------
label: TDF_Label
lower: int
upper: int
isDelta: bool (optional, default to Standard_False)

Return
-------
opencascade::handle<TDataStd_ByteArray>

Description
-----------
Finds or creates an attribute with the array on the specified label. If <isDelta> == False, DefaultDeltaOnModification is used. If <isDelta> == True, DeltaOnModification of the current attribute is used. If attribute is already set, all input parameters are refused and the found attribute is returned.
") Set;
		static opencascade::handle<TDataStd_ByteArray> Set(const TDF_Label & label, const Standard_Integer lower, const Standard_Integer upper, const Standard_Boolean isDelta = Standard_False);

		/****** TDataStd_ByteArray::Set ******/
		/****** md5 signature: 5b357c7318d0b6b02a9847ad7ac424cd ******/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "
Parameters
----------
label: TDF_Label
theGuid: Standard_GUID
lower: int
upper: int
isDelta: bool (optional, default to Standard_False)

Return
-------
opencascade::handle<TDataStd_ByteArray>

Description
-----------
Finds or creates an attribute with byte array and explicit user defined <guid> on the specified label.
") Set;
		static opencascade::handle<TDataStd_ByteArray> Set(const TDF_Label & label, const Standard_GUID & theGuid, const Standard_Integer lower, const Standard_Integer upper, const Standard_Boolean isDelta = Standard_False);

		/****** TDataStd_ByteArray::SetDelta ******/
		/****** md5 signature: 66bc6f747d37a3ea7110a95b02e13c41 ******/
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
		void SetDelta(const Standard_Boolean isDelta);

		/****** TDataStd_ByteArray::SetID ******/
		/****** md5 signature: 9bed89522d0b510ace46b6aebec92ee0 ******/
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
		/****** md5 signature: 244d113ae14add83954353ca15ede66b ******/
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
		/****** md5 signature: 5eb44f5b1fbbef87d0fc79c872ef9d03 ******/
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "
Parameters
----------
index: int
value: Standard_Byte

Return
-------
None

Description
-----------
Sets the <Index>th element of the array to <Value> OutOfRange exception is raised if <Index> doesn't respect Lower and Upper bounds of the internal array.
") SetValue;
		void SetValue(const Standard_Integer index, const Standard_Byte value);

		/****** TDataStd_ByteArray::Upper ******/
		/****** md5 signature: 8f614b31058bb30bdf81ecd0e2d444dc ******/
		%feature("compactdefaultargs") Upper;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the upper boundary of the array.
") Upper;
		Standard_Integer Upper();

		/****** TDataStd_ByteArray::Value ******/
		/****** md5 signature: 7d1812c0462c6fd10daef7299dca8cb4 ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
Standard_Byte

Description
-----------
Return the value of the <Index>th element of the array.
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
		/****** md5 signature: eebf253baf1c60e556b24ea32091843d ******/
		%feature("compactdefaultargs") TDataStd_ChildNodeIterator;
		%feature("autodoc", "
Parameters
----------
aTreeNode: TDataStd_TreeNode
allLevels: bool (optional, default to Standard_False)

Return
-------
None

Description
-----------
Iterates on the ChildStepren of the given Step. If <allLevels> option is set to true, it explores not only the first, but all the sub Step levels.
") TDataStd_ChildNodeIterator;
		 TDataStd_ChildNodeIterator(const opencascade::handle<TDataStd_TreeNode> & aTreeNode, const Standard_Boolean allLevels = Standard_False);

		/****** TDataStd_ChildNodeIterator::Initialize ******/
		/****** md5 signature: 3c8a27d654697d6383aae622e6ef2566 ******/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "
Parameters
----------
aTreeNode: TDataStd_TreeNode
allLevels: bool (optional, default to Standard_False)

Return
-------
None

Description
-----------
Initializes the iteration on the Children Step of the given Step. If <allLevels> option is set to true, it explores not only the first, but all the sub Step levels.
") Initialize;
		void Initialize(const opencascade::handle<TDataStd_TreeNode> & aTreeNode, const Standard_Boolean allLevels = Standard_False);

		/****** TDataStd_ChildNodeIterator::More ******/
		/****** md5 signature: cff271d3b32940da94bada40648f9096 ******/
		%feature("compactdefaultargs") More;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if there is a current Item in the iteration.
") More;
		Standard_Boolean More();

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
		/****** md5 signature: 3398f1042b24f9ae49f7e8da6125f793 ******/
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
		virtual Standard_OStream & Dump(std::ostream &OutValue);


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
		/****** md5 signature: 50ae6e2d0e5e7cf8d8a39bf93358e95e ******/
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
		static Standard_Boolean Has(const TDF_Label & acces);

		/****** TDataStd_Current::ID ******/
		/****** md5 signature: 4697ce8a095fa6dcef0217708d19718f ******/
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
		/****** md5 signature: c6d13c9ecc64c6c803b6e119e8216934 ******/
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
		/****** md5 signature: a6ff306a759c68a191c0262635db980f ******/
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
		/****** md5 signature: ddeae219d389a1d89eecb3e23c73522a ******/
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
		/****** md5 signature: ddf5e396da23832dcae51d48e78a347f ******/
		%feature("compactdefaultargs") Apply;
		%feature("autodoc", "Return
-------
None

Description
-----------
Applies the delta to the attribute.
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
		/****** md5 signature: ddf5e396da23832dcae51d48e78a347f ******/
		%feature("compactdefaultargs") Apply;
		%feature("autodoc", "Return
-------
None

Description
-----------
Applies the delta to the attribute.
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
		/****** md5 signature: ddf5e396da23832dcae51d48e78a347f ******/
		%feature("compactdefaultargs") Apply;
		%feature("autodoc", "Return
-------
None

Description
-----------
Applies the delta to the attribute.
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
		/****** md5 signature: ddf5e396da23832dcae51d48e78a347f ******/
		%feature("compactdefaultargs") Apply;
		%feature("autodoc", "Return
-------
None

Description
-----------
Applies the delta to the attribute.
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
		/****** md5 signature: ddf5e396da23832dcae51d48e78a347f ******/
		%feature("compactdefaultargs") Apply;
		%feature("autodoc", "Return
-------
None

Description
-----------
Applies the delta to the attribute.
") Apply;
		virtual void Apply();

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
		/****** md5 signature: 3398f1042b24f9ae49f7e8da6125f793 ******/
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
		virtual Standard_OStream & Dump(std::ostream &OutValue);


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
		/****** md5 signature: b15a6b025b25c61503dc4b4deba5bd8b ******/
		%feature("compactdefaultargs") GetVariables;
		%feature("autodoc", "Return
-------
TDF_AttributeList

Description
-----------
No available documentation.
") GetVariables;
		TDF_AttributeList & GetVariables();

		/****** TDataStd_Expression::ID ******/
		/****** md5 signature: 4697ce8a095fa6dcef0217708d19718f ******/
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
		/****** md5 signature: c6d13c9ecc64c6c803b6e119e8216934 ******/
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
		/****** md5 signature: a6ff306a759c68a191c0262635db980f ******/
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
		/****** md5 signature: ddeae219d389a1d89eecb3e23c73522a ******/
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
		/****** md5 signature: bf3a2e32e96eae9bf18b8add11f03226 ******/
		%feature("compactdefaultargs") Array;
		%feature("autodoc", "Return
-------
opencascade::handle<TColStd_HArray1OfExtendedString>

Description
-----------
Return the inner array of the ExtStringArray attribute.
") Array;
		const opencascade::handle<TColStd_HArray1OfExtendedString> & Array();

		/****** TDataStd_ExtStringArray::ChangeArray ******/
		/****** md5 signature: 76cf449b0c78430434ee11ebf388de0d ******/
		%feature("compactdefaultargs") ChangeArray;
		%feature("autodoc", "
Parameters
----------
newArray: TColStd_HArray1OfExtendedString
isCheckItems: bool (optional, default to Standard_True)

Return
-------
None

Description
-----------
Sets the inner array <myValue> of the ExtStringArray attribute to <newArray>. If value of <newArray> differs from <myValue>, Backup performed and myValue refers to new instance of HArray1OfExtendedString that holds <newArray> values If <isCheckItems> equal True each item of <newArray> will be checked with each item of <myValue> for coincidence (to avoid backup).
") ChangeArray;
		void ChangeArray(const opencascade::handle<TColStd_HArray1OfExtendedString> & newArray, const Standard_Boolean isCheckItems = Standard_True);

		/****** TDataStd_ExtStringArray::DeltaOnModification ******/
		/****** md5 signature: 9a96ec815d43dd1838c022740c5327d0 ******/
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
		virtual opencascade::handle<TDF_DeltaOnModification> DeltaOnModification(const opencascade::handle<TDF_Attribute> & anOldAttribute);

		/****** TDataStd_ExtStringArray::Dump ******/
		/****** md5 signature: 3398f1042b24f9ae49f7e8da6125f793 ******/
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
		virtual Standard_OStream & Dump(std::ostream &OutValue);


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
		/****** md5 signature: 570a92cb77e1626ccd16d9bb8bc3044c ******/
		%feature("compactdefaultargs") GetDelta;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") GetDelta;
		Standard_Boolean GetDelta();

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
		/****** md5 signature: 4697ce8a095fa6dcef0217708d19718f ******/
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
		/****** md5 signature: 7821d9c43d1b72a2a51576c8503c10d4 ******/
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
		void Init(const Standard_Integer lower, const Standard_Integer upper);

		/****** TDataStd_ExtStringArray::Length ******/
		/****** md5 signature: 58bd40380acccb2733bfbd37bf3cbb11 ******/
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "Return
-------
int

Description
-----------
Return the number of elements of <self>.
") Length;
		Standard_Integer Length();

		/****** TDataStd_ExtStringArray::Lower ******/
		/****** md5 signature: fe1655437e349162aeffc9b3814347af ******/
		%feature("compactdefaultargs") Lower;
		%feature("autodoc", "Return
-------
int

Description
-----------
Return the lower bound.
") Lower;
		Standard_Integer Lower();

		/****** TDataStd_ExtStringArray::NewEmpty ******/
		/****** md5 signature: c6d13c9ecc64c6c803b6e119e8216934 ******/
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
		/****** md5 signature: a6ff306a759c68a191c0262635db980f ******/
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
		/****** md5 signature: ddeae219d389a1d89eecb3e23c73522a ******/
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
		/****** md5 signature: c93882fb1070a4851bcdca0675d4d592 ******/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "
Parameters
----------
label: TDF_Label
lower: int
upper: int
isDelta: bool (optional, default to Standard_False)

Return
-------
opencascade::handle<TDataStd_ExtStringArray>

Description
-----------
Finds, or creates, an ExtStringArray attribute with <lower> and <upper> bounds on the specified label. If <isDelta> == False, DefaultDeltaOnModification is used. If <isDelta> == True, DeltaOnModification of the current attribute is used. If attribute is already set, all input parameters are refused and the found attribute is returned.
") Set;
		static opencascade::handle<TDataStd_ExtStringArray> Set(const TDF_Label & label, const Standard_Integer lower, const Standard_Integer upper, const Standard_Boolean isDelta = Standard_False);

		/****** TDataStd_ExtStringArray::Set ******/
		/****** md5 signature: 00e8d7f58163e822658b96ca6e5ae424 ******/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "
Parameters
----------
label: TDF_Label
theGuid: Standard_GUID
lower: int
upper: int
isDelta: bool (optional, default to Standard_False)

Return
-------
opencascade::handle<TDataStd_ExtStringArray>

Description
-----------
Finds, or creates, an ExtStringArray attribute with explicit user defined <guid>. The ExtStringArray attribute is returned.
") Set;
		static opencascade::handle<TDataStd_ExtStringArray> Set(const TDF_Label & label, const Standard_GUID & theGuid, const Standard_Integer lower, const Standard_Integer upper, const Standard_Boolean isDelta = Standard_False);

		/****** TDataStd_ExtStringArray::SetDelta ******/
		/****** md5 signature: 66bc6f747d37a3ea7110a95b02e13c41 ******/
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
		void SetDelta(const Standard_Boolean isDelta);

		/****** TDataStd_ExtStringArray::SetID ******/
		/****** md5 signature: 9bed89522d0b510ace46b6aebec92ee0 ******/
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
		/****** md5 signature: 244d113ae14add83954353ca15ede66b ******/
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
		/****** md5 signature: c9625cdae892191532dd40ae6ff11a40 ******/
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
		void SetValue(const Standard_Integer Index, TCollection_ExtendedString Value);

		/****** TDataStd_ExtStringArray::Upper ******/
		/****** md5 signature: 8f614b31058bb30bdf81ecd0e2d444dc ******/
		%feature("compactdefaultargs") Upper;
		%feature("autodoc", "Return
-------
int

Description
-----------
Return the upper bound.
") Upper;
		Standard_Integer Upper();

		/****** TDataStd_ExtStringArray::Value ******/
		/****** md5 signature: bbf07c80f5c2f47b499665f5becff5e8 ******/
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
		/****** md5 signature: 3398f1042b24f9ae49f7e8da6125f793 ******/
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
		virtual Standard_OStream & Dump(std::ostream &OutValue);


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
		/****** md5 signature: 8da0d7e03de513b08d57e17232ac7391 ******/
		%feature("compactdefaultargs") Extent;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") Extent;
		Standard_Integer Extent();

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
		/****** md5 signature: 4697ce8a095fa6dcef0217708d19718f ******/
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
		/****** md5 signature: 333f01752b3375ef8e77a252e9fc3355 ******/
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
		Standard_Boolean InsertAfter(TCollection_ExtendedString value, TCollection_ExtendedString after_value);

		/****** TDataStd_ExtStringList::InsertAfter ******/
		/****** md5 signature: a82efc1671cdc0567d137b17efea7e0e ******/
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
		Standard_Boolean InsertAfter(const Standard_Integer index, TCollection_ExtendedString after_value);

		/****** TDataStd_ExtStringList::InsertBefore ******/
		/****** md5 signature: e2b5c32e8c030b4febd798d8af9aea38 ******/
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
		Standard_Boolean InsertBefore(TCollection_ExtendedString value, TCollection_ExtendedString before_value);

		/****** TDataStd_ExtStringList::InsertBefore ******/
		/****** md5 signature: 39731173faa0cfeb50ebb04e09af3484 ******/
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
		Standard_Boolean InsertBefore(const Standard_Integer index, TCollection_ExtendedString before_value);

		/****** TDataStd_ExtStringList::IsEmpty ******/
		/****** md5 signature: 6ab5e1ad63f93168856ab126dd374b81 ******/
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsEmpty;
		Standard_Boolean IsEmpty();

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
		/****** md5 signature: a8e6c196b6984ed8d1d16ed7bfc99469 ******/
		%feature("compactdefaultargs") List;
		%feature("autodoc", "Return
-------
TDataStd_ListOfExtendedString

Description
-----------
No available documentation.
") List;
		const TDataStd_ListOfExtendedString & List();

		/****** TDataStd_ExtStringList::NewEmpty ******/
		/****** md5 signature: c6d13c9ecc64c6c803b6e119e8216934 ******/
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
		/****** md5 signature: a6ff306a759c68a191c0262635db980f ******/
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
		/****** md5 signature: 6fa22246d331e634e7be4fd0a9fc76ad ******/
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
		Standard_Boolean Remove(TCollection_ExtendedString value);

		/****** TDataStd_ExtStringList::Remove ******/
		/****** md5 signature: d5758943c335a06d32f07ab2389e0fe6 ******/
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
		Standard_Boolean Remove(const Standard_Integer index);

		/****** TDataStd_ExtStringList::Restore ******/
		/****** md5 signature: ddeae219d389a1d89eecb3e23c73522a ******/
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
		/****** md5 signature: 9bed89522d0b510ace46b6aebec92ee0 ******/
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
		/****** md5 signature: 244d113ae14add83954353ca15ede66b ******/
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
		/****** md5 signature: 679374981b21c2865fb1434f26aac636 ******/
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
		 TDataStd_HDataMapOfStringByte(const Standard_Integer NbBuckets = 1);

		/****** TDataStd_HDataMapOfStringByte::TDataStd_HDataMapOfStringByte ******/
		/****** md5 signature: b5aac5ec6ebdd85cc054269530f6c8cb ******/
		%feature("compactdefaultargs") TDataStd_HDataMapOfStringByte;
		%feature("autodoc", "
Parameters
----------
theOther: TDataStd_DataMapOfStringByte

Return
-------
None

Description
-----------
No available documentation.
") TDataStd_HDataMapOfStringByte;
		 TDataStd_HDataMapOfStringByte(const TDataStd_DataMapOfStringByte & theOther);

		/****** TDataStd_HDataMapOfStringByte::ChangeMap ******/
		/****** md5 signature: 0a2b5fe4d976a761d358e557a38bad75 ******/
		%feature("compactdefaultargs") ChangeMap;
		%feature("autodoc", "Return
-------
TDataStd_DataMapOfStringByte

Description
-----------
No available documentation.
") ChangeMap;
		TDataStd_DataMapOfStringByte & ChangeMap();

		/****** TDataStd_HDataMapOfStringByte::Map ******/
		/****** md5 signature: 50b2e9663ae163f6aff6c0dc3dec2cee ******/
		%feature("compactdefaultargs") Map;
		%feature("autodoc", "Return
-------
TDataStd_DataMapOfStringByte

Description
-----------
No available documentation.
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
		/****** TDataStd_HDataMapOfStringHArray1OfInteger::TDataStd_HDataMapOfStringHArray1OfInteger ******/
		/****** md5 signature: 6cd33f38fb037a0a9006af7162d982d5 ******/
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
		 TDataStd_HDataMapOfStringHArray1OfInteger(const Standard_Integer NbBuckets = 1);

		/****** TDataStd_HDataMapOfStringHArray1OfInteger::TDataStd_HDataMapOfStringHArray1OfInteger ******/
		/****** md5 signature: 8259a5e5d4c6b79ac679be61e9013caf ******/
		%feature("compactdefaultargs") TDataStd_HDataMapOfStringHArray1OfInteger;
		%feature("autodoc", "
Parameters
----------
theOther: TDataStd_DataMapOfStringHArray1OfInteger

Return
-------
None

Description
-----------
No available documentation.
") TDataStd_HDataMapOfStringHArray1OfInteger;
		 TDataStd_HDataMapOfStringHArray1OfInteger(const TDataStd_DataMapOfStringHArray1OfInteger & theOther);

		/****** TDataStd_HDataMapOfStringHArray1OfInteger::ChangeMap ******/
		/****** md5 signature: f5cd9b08633ff43d0ef43dacb1bfd1c5 ******/
		%feature("compactdefaultargs") ChangeMap;
		%feature("autodoc", "Return
-------
TDataStd_DataMapOfStringHArray1OfInteger

Description
-----------
No available documentation.
") ChangeMap;
		TDataStd_DataMapOfStringHArray1OfInteger & ChangeMap();

		/****** TDataStd_HDataMapOfStringHArray1OfInteger::Map ******/
		/****** md5 signature: 87a3e5bf8695c07e283bff2c62607045 ******/
		%feature("compactdefaultargs") Map;
		%feature("autodoc", "Return
-------
TDataStd_DataMapOfStringHArray1OfInteger

Description
-----------
No available documentation.
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
		/****** TDataStd_HDataMapOfStringHArray1OfReal::TDataStd_HDataMapOfStringHArray1OfReal ******/
		/****** md5 signature: c4bcf0a4e0c461966986b975b008bc98 ******/
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
		 TDataStd_HDataMapOfStringHArray1OfReal(const Standard_Integer NbBuckets = 1);

		/****** TDataStd_HDataMapOfStringHArray1OfReal::TDataStd_HDataMapOfStringHArray1OfReal ******/
		/****** md5 signature: 2856f7fea212451f72049a738072e95e ******/
		%feature("compactdefaultargs") TDataStd_HDataMapOfStringHArray1OfReal;
		%feature("autodoc", "
Parameters
----------
theOther: TDataStd_DataMapOfStringHArray1OfReal

Return
-------
None

Description
-----------
No available documentation.
") TDataStd_HDataMapOfStringHArray1OfReal;
		 TDataStd_HDataMapOfStringHArray1OfReal(const TDataStd_DataMapOfStringHArray1OfReal & theOther);

		/****** TDataStd_HDataMapOfStringHArray1OfReal::ChangeMap ******/
		/****** md5 signature: bc651b856da3271678cffdf0fac521fa ******/
		%feature("compactdefaultargs") ChangeMap;
		%feature("autodoc", "Return
-------
TDataStd_DataMapOfStringHArray1OfReal

Description
-----------
No available documentation.
") ChangeMap;
		TDataStd_DataMapOfStringHArray1OfReal & ChangeMap();

		/****** TDataStd_HDataMapOfStringHArray1OfReal::Map ******/
		/****** md5 signature: 8281a23b994cfab06b9c3e77e313f3a7 ******/
		%feature("compactdefaultargs") Map;
		%feature("autodoc", "Return
-------
TDataStd_DataMapOfStringHArray1OfReal

Description
-----------
No available documentation.
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
		/****** TDataStd_HDataMapOfStringInteger::TDataStd_HDataMapOfStringInteger ******/
		/****** md5 signature: 742439804a93877a5047a7bff6bccd15 ******/
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
		 TDataStd_HDataMapOfStringInteger(const Standard_Integer NbBuckets = 1);

		/****** TDataStd_HDataMapOfStringInteger::TDataStd_HDataMapOfStringInteger ******/
		/****** md5 signature: e6f0cd929496302121efaf1bd1e21eb6 ******/
		%feature("compactdefaultargs") TDataStd_HDataMapOfStringInteger;
		%feature("autodoc", "
Parameters
----------
theOther: TColStd_DataMapOfStringInteger

Return
-------
None

Description
-----------
No available documentation.
") TDataStd_HDataMapOfStringInteger;
		 TDataStd_HDataMapOfStringInteger(const TColStd_DataMapOfStringInteger & theOther);

		/****** TDataStd_HDataMapOfStringInteger::ChangeMap ******/
		/****** md5 signature: 9895321eab61fe09331de83b60921fd4 ******/
		%feature("compactdefaultargs") ChangeMap;
		%feature("autodoc", "Return
-------
TColStd_DataMapOfStringInteger

Description
-----------
No available documentation.
") ChangeMap;
		TColStd_DataMapOfStringInteger & ChangeMap();

		/****** TDataStd_HDataMapOfStringInteger::Map ******/
		/****** md5 signature: 241cf5fea80e6f4e708f154f8de9e1bc ******/
		%feature("compactdefaultargs") Map;
		%feature("autodoc", "Return
-------
TColStd_DataMapOfStringInteger

Description
-----------
No available documentation.
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
		/****** TDataStd_HDataMapOfStringReal::TDataStd_HDataMapOfStringReal ******/
		/****** md5 signature: 7488e4768a703dfd339692c806f99f42 ******/
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
		 TDataStd_HDataMapOfStringReal(const Standard_Integer NbBuckets = 1);

		/****** TDataStd_HDataMapOfStringReal::TDataStd_HDataMapOfStringReal ******/
		/****** md5 signature: 121fa55f802bf43f35b6e87c217075e8 ******/
		%feature("compactdefaultargs") TDataStd_HDataMapOfStringReal;
		%feature("autodoc", "
Parameters
----------
theOther: TDataStd_DataMapOfStringReal

Return
-------
None

Description
-----------
No available documentation.
") TDataStd_HDataMapOfStringReal;
		 TDataStd_HDataMapOfStringReal(const TDataStd_DataMapOfStringReal & theOther);

		/****** TDataStd_HDataMapOfStringReal::ChangeMap ******/
		/****** md5 signature: d4f36b31743e1eb9d128387ff8b29276 ******/
		%feature("compactdefaultargs") ChangeMap;
		%feature("autodoc", "Return
-------
TDataStd_DataMapOfStringReal

Description
-----------
No available documentation.
") ChangeMap;
		TDataStd_DataMapOfStringReal & ChangeMap();

		/****** TDataStd_HDataMapOfStringReal::Map ******/
		/****** md5 signature: 5bb7116fe67c0de1a48abcca2f3ce836 ******/
		%feature("compactdefaultargs") Map;
		%feature("autodoc", "Return
-------
TDataStd_DataMapOfStringReal

Description
-----------
No available documentation.
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
		/****** TDataStd_HDataMapOfStringString::TDataStd_HDataMapOfStringString ******/
		/****** md5 signature: acabe9e4fb1d5a2bf9373c30ced8d28c ******/
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
		 TDataStd_HDataMapOfStringString(const Standard_Integer NbBuckets = 1);

		/****** TDataStd_HDataMapOfStringString::TDataStd_HDataMapOfStringString ******/
		/****** md5 signature: 44161a1de573f46d1c664ada9cc76d23 ******/
		%feature("compactdefaultargs") TDataStd_HDataMapOfStringString;
		%feature("autodoc", "
Parameters
----------
theOther: TDataStd_DataMapOfStringString

Return
-------
None

Description
-----------
No available documentation.
") TDataStd_HDataMapOfStringString;
		 TDataStd_HDataMapOfStringString(const TDataStd_DataMapOfStringString & theOther);

		/****** TDataStd_HDataMapOfStringString::ChangeMap ******/
		/****** md5 signature: 31bcb928e8ac89e75cc739cff3709adb ******/
		%feature("compactdefaultargs") ChangeMap;
		%feature("autodoc", "Return
-------
TDataStd_DataMapOfStringString

Description
-----------
No available documentation.
") ChangeMap;
		TDataStd_DataMapOfStringString & ChangeMap();

		/****** TDataStd_HDataMapOfStringString::Map ******/
		/****** md5 signature: 5577d37c8d3b29feaa25de9a032320c3 ******/
		%feature("compactdefaultargs") Map;
		%feature("autodoc", "Return
-------
TDataStd_DataMapOfStringString

Description
-----------
No available documentation.
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
		/****** md5 signature: 36b1accfeee12d40d7635f94e1cf9007 ******/
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
		Standard_Boolean Add(const Standard_Integer theKey);

		/****** TDataStd_IntPackedMap::ChangeMap ******/
		/****** md5 signature: b1ad5ff7f2aa646965f9ac9b8d9bc28c ******/
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
		Standard_Boolean ChangeMap(const opencascade::handle<TColStd_HPackedMapOfInteger> & theMap);

		/****** TDataStd_IntPackedMap::ChangeMap ******/
		/****** md5 signature: 455b9c7f25de770f70c647849552bc59 ******/
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
		Standard_Boolean ChangeMap(const TColStd_PackedMapOfInteger & theMap);

		/****** TDataStd_IntPackedMap::Clear ******/
		/****** md5 signature: 5d9992bf01de8ff0ed07e5430de45499 ******/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") Clear;
		Standard_Boolean Clear();

		/****** TDataStd_IntPackedMap::Contains ******/
		/****** md5 signature: a02d6cb675cf509371ef561f301441dc ******/
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
		Standard_Boolean Contains(const Standard_Integer theKey);

		/****** TDataStd_IntPackedMap::DeltaOnModification ******/
		/****** md5 signature: 9a96ec815d43dd1838c022740c5327d0 ******/
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
		virtual opencascade::handle<TDF_DeltaOnModification> DeltaOnModification(const opencascade::handle<TDF_Attribute> & anOldAttribute);

		/****** TDataStd_IntPackedMap::Dump ******/
		/****** md5 signature: 3398f1042b24f9ae49f7e8da6125f793 ******/
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
		virtual Standard_OStream & Dump(std::ostream &OutValue);


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
		/****** md5 signature: 19453f219e568f9c5109a0fd06459e95 ******/
		%feature("compactdefaultargs") Extent;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") Extent;
		Standard_Integer Extent();

		/****** TDataStd_IntPackedMap::GetDelta ******/
		/****** md5 signature: 570a92cb77e1626ccd16d9bb8bc3044c ******/
		%feature("compactdefaultargs") GetDelta;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") GetDelta;
		Standard_Boolean GetDelta();

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
		/****** md5 signature: 4697ce8a095fa6dcef0217708d19718f ******/
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
		/****** md5 signature: d529c07ce9e12eea3222188c82b0e80b ******/
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsEmpty;
		Standard_Boolean IsEmpty();

		/****** TDataStd_IntPackedMap::NewEmpty ******/
		/****** md5 signature: c6d13c9ecc64c6c803b6e119e8216934 ******/
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
		/****** md5 signature: a6ff306a759c68a191c0262635db980f ******/
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
		/****** md5 signature: 6cac194cd74226cc6a8dd18a8cdce193 ******/
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
		Standard_Boolean Remove(const Standard_Integer theKey);

		/****** TDataStd_IntPackedMap::Restore ******/
		/****** md5 signature: ddeae219d389a1d89eecb3e23c73522a ******/
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
		/****** md5 signature: a1fda0f2938513ca4efcd2592d322153 ******/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "
Parameters
----------
label: TDF_Label
isDelta: bool (optional, default to Standard_False)

Return
-------
opencascade::handle<TDataStd_IntPackedMap>

Description
-----------
Finds or creates an integer map attribute on the given label. If <isDelta> == False, DefaultDeltaOnModification is used. If <isDelta> == True, DeltaOnModification of the current attribute is used. If attribute is already set, input parameter <isDelta> is refused and the found attribute returned. Attribute methods ===================.
") Set;
		static opencascade::handle<TDataStd_IntPackedMap> Set(const TDF_Label & label, const Standard_Boolean isDelta = Standard_False);

		/****** TDataStd_IntPackedMap::SetDelta ******/
		/****** md5 signature: 66bc6f747d37a3ea7110a95b02e13c41 ******/
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
		/****** md5 signature: 3398f1042b24f9ae49f7e8da6125f793 ******/
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
		virtual Standard_OStream & Dump(std::ostream &OutValue);


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
		/****** md5 signature: ace457d697a3a35733c5ac95429cad31 ******/
		%feature("compactdefaultargs") Get;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the integer value contained in the attribute.
") Get;
		Standard_Integer Get();

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
		/****** md5 signature: 4697ce8a095fa6dcef0217708d19718f ******/
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
		/****** md5 signature: 12ea7252bed17339127c3c98a18cb3cc ******/
		%feature("compactdefaultargs") IsCaptured;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if there is a reference on the same label.
") IsCaptured;
		Standard_Boolean IsCaptured();

		/****** TDataStd_Integer::NewEmpty ******/
		/****** md5 signature: c6d13c9ecc64c6c803b6e119e8216934 ******/
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
		/****** md5 signature: a6ff306a759c68a191c0262635db980f ******/
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
		/****** md5 signature: ddeae219d389a1d89eecb3e23c73522a ******/
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
		/****** md5 signature: b29b5247ad1e42b469a89fa6c91069d4 ******/
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
		static opencascade::handle<TDataStd_Integer> Set(const TDF_Label & label, const Standard_Integer value);

		/****** TDataStd_Integer::Set ******/
		/****** md5 signature: 0e26e9fcb9f71233beb0805c0bcb57f3 ******/
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
		static opencascade::handle<TDataStd_Integer> Set(const TDF_Label & label, const Standard_GUID & guid, const Standard_Integer value);

		/****** TDataStd_Integer::Set ******/
		/****** md5 signature: 64858a2de80493b16a443d640276d65c ******/
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
		void Set(const Standard_Integer V);

		/****** TDataStd_Integer::SetID ******/
		/****** md5 signature: 7a929ce753effeac220c978ae7330330 ******/
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
		/****** md5 signature: 244d113ae14add83954353ca15ede66b ******/
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
		/****** md5 signature: a7ef75e682bc0079410477b5a2393bdb ******/
		%feature("compactdefaultargs") Array;
		%feature("autodoc", "Return
-------
opencascade::handle<TColStd_HArray1OfInteger>

Description
-----------
Return the inner array of the IntegerArray attribute.
") Array;
		const opencascade::handle<TColStd_HArray1OfInteger> & Array();

		/****** TDataStd_IntegerArray::ChangeArray ******/
		/****** md5 signature: ba925b59c57ea8c952a56ef3a11c0389 ******/
		%feature("compactdefaultargs") ChangeArray;
		%feature("autodoc", "
Parameters
----------
newArray: TColStd_HArray1OfInteger
isCheckItems: bool (optional, default to Standard_True)

Return
-------
None

Description
-----------
Sets the inner array <myValue> of the IntegerArray attribute to <newArray>. If value of <newArray> differs from <myValue>, Backup performed and myValue refers to new instance of HArray1OfInteger that holds <newArray> values If <isCheckItems> equal True each item of <newArray> will be checked with each item of <myValue> for coincidence (to avoid backup).
") ChangeArray;
		void ChangeArray(const opencascade::handle<TColStd_HArray1OfInteger> & newArray, const Standard_Boolean isCheckItems = Standard_True);

		/****** TDataStd_IntegerArray::DeltaOnModification ******/
		/****** md5 signature: 9a96ec815d43dd1838c022740c5327d0 ******/
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
		virtual opencascade::handle<TDF_DeltaOnModification> DeltaOnModification(const opencascade::handle<TDF_Attribute> & anOldAttribute);

		/****** TDataStd_IntegerArray::Dump ******/
		/****** md5 signature: 3398f1042b24f9ae49f7e8da6125f793 ******/
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
		virtual Standard_OStream & Dump(std::ostream &OutValue);


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
		/****** md5 signature: 570a92cb77e1626ccd16d9bb8bc3044c ******/
		%feature("compactdefaultargs") GetDelta;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") GetDelta;
		Standard_Boolean GetDelta();

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
		/****** md5 signature: 4697ce8a095fa6dcef0217708d19718f ******/
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
		/****** md5 signature: 7821d9c43d1b72a2a51576c8503c10d4 ******/
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
		void Init(const Standard_Integer lower, const Standard_Integer upper);

		/****** TDataStd_IntegerArray::Length ******/
		/****** md5 signature: 58bd40380acccb2733bfbd37bf3cbb11 ******/
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the length of this array of integers in terms of the number of elements it contains.
") Length;
		Standard_Integer Length();

		/****** TDataStd_IntegerArray::Lower ******/
		/****** md5 signature: fe1655437e349162aeffc9b3814347af ******/
		%feature("compactdefaultargs") Lower;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the lower boundary of this array of integers.
") Lower;
		Standard_Integer Lower();

		/****** TDataStd_IntegerArray::NewEmpty ******/
		/****** md5 signature: c6d13c9ecc64c6c803b6e119e8216934 ******/
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
		/****** md5 signature: a6ff306a759c68a191c0262635db980f ******/
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
		/****** md5 signature: ddeae219d389a1d89eecb3e23c73522a ******/
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
		/****** md5 signature: 3446699890de20ea131346a0fdee1550 ******/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "
Parameters
----------
label: TDF_Label
lower: int
upper: int
isDelta: bool (optional, default to Standard_False)

Return
-------
opencascade::handle<TDataStd_IntegerArray>

Description
-----------
Finds or creates on the <label> an integer array attribute with the specified <lower> and <upper> boundaries. If <isDelta> == False, DefaultDeltaOnModification is used. If <isDelta> == True, DeltaOnModification of the current attribute is used. If attribute is already set, all input parameters are refused and the found attribute is returned.
") Set;
		static opencascade::handle<TDataStd_IntegerArray> Set(const TDF_Label & label, const Standard_Integer lower, const Standard_Integer upper, const Standard_Boolean isDelta = Standard_False);

		/****** TDataStd_IntegerArray::Set ******/
		/****** md5 signature: fd935a6ba313810711685f37c36a143b ******/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "
Parameters
----------
label: TDF_Label
theGuid: Standard_GUID
lower: int
upper: int
isDelta: bool (optional, default to Standard_False)

Return
-------
opencascade::handle<TDataStd_IntegerArray>

Description
-----------
Finds, or creates, an IntegerArray attribute with explicit user defined <guid>. The IntegerArray attribute is returned.
") Set;
		static opencascade::handle<TDataStd_IntegerArray> Set(const TDF_Label & label, const Standard_GUID & theGuid, const Standard_Integer lower, const Standard_Integer upper, const Standard_Boolean isDelta = Standard_False);

		/****** TDataStd_IntegerArray::SetDelta ******/
		/****** md5 signature: 66bc6f747d37a3ea7110a95b02e13c41 ******/
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
		void SetDelta(const Standard_Boolean isDelta);

		/****** TDataStd_IntegerArray::SetID ******/
		/****** md5 signature: 9bed89522d0b510ace46b6aebec92ee0 ******/
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
		/****** md5 signature: 244d113ae14add83954353ca15ede66b ******/
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
		/****** md5 signature: 8575533a9631c681a72d28c8c80ec307 ******/
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
		void SetValue(const Standard_Integer Index, const Standard_Integer Value);

		/****** TDataStd_IntegerArray::Upper ******/
		/****** md5 signature: 8f614b31058bb30bdf81ecd0e2d444dc ******/
		%feature("compactdefaultargs") Upper;
		%feature("autodoc", "Return
-------
int

Description
-----------
Return the upper boundary of this array of integers.
") Upper;
		Standard_Integer Upper();

		/****** TDataStd_IntegerArray::Value ******/
		/****** md5 signature: a0a106e66557a840a37128177a262f02 ******/
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
		/****** md5 signature: d91962192b3053f532e2c32ffd9526b7 ******/
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
		void Append(const Standard_Integer value);

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
		/****** md5 signature: 3398f1042b24f9ae49f7e8da6125f793 ******/
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
		virtual Standard_OStream & Dump(std::ostream &OutValue);


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
		/****** md5 signature: 8da0d7e03de513b08d57e17232ac7391 ******/
		%feature("compactdefaultargs") Extent;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") Extent;
		Standard_Integer Extent();

		/****** TDataStd_IntegerList::First ******/
		/****** md5 signature: e9b9b55d0f95896826fc1a7c7b3fdf28 ******/
		%feature("compactdefaultargs") First;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") First;
		Standard_Integer First();

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
		/****** md5 signature: 4697ce8a095fa6dcef0217708d19718f ******/
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
		/****** md5 signature: d212c3e69b13910b3a43e9e7b03a5d9f ******/
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
		Standard_Boolean InsertAfter(const Standard_Integer value, const Standard_Integer after_value);

		/****** TDataStd_IntegerList::InsertAfterByIndex ******/
		/****** md5 signature: 4667d81dfb21cbc9a4762284dc6aa583 ******/
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
		Standard_Boolean InsertAfterByIndex(const Standard_Integer index, const Standard_Integer after_value);

		/****** TDataStd_IntegerList::InsertBefore ******/
		/****** md5 signature: 38d4729675f0992a660a75d530c6b9ff ******/
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
		Standard_Boolean InsertBefore(const Standard_Integer value, const Standard_Integer before_value);

		/****** TDataStd_IntegerList::InsertBeforeByIndex ******/
		/****** md5 signature: 4fb4880ded31493a5e709139d9f77315 ******/
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
		Standard_Boolean InsertBeforeByIndex(const Standard_Integer index, const Standard_Integer before_value);

		/****** TDataStd_IntegerList::IsEmpty ******/
		/****** md5 signature: 6ab5e1ad63f93168856ab126dd374b81 ******/
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsEmpty;
		Standard_Boolean IsEmpty();

		/****** TDataStd_IntegerList::Last ******/
		/****** md5 signature: b34ffc707f6352bb6f1f4c928c84e251 ******/
		%feature("compactdefaultargs") Last;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") Last;
		Standard_Integer Last();

		/****** TDataStd_IntegerList::List ******/
		/****** md5 signature: df226a20283d804fa38e9fe4d4263a45 ******/
		%feature("compactdefaultargs") List;
		%feature("autodoc", "Return
-------
TColStd_ListOfInteger

Description
-----------
No available documentation.
") List;
		const TColStd_ListOfInteger & List();

		/****** TDataStd_IntegerList::NewEmpty ******/
		/****** md5 signature: c6d13c9ecc64c6c803b6e119e8216934 ******/
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
		/****** md5 signature: a6ff306a759c68a191c0262635db980f ******/
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
		/****** md5 signature: f8244490f55c7baf7f2e424d000f0e9c ******/
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
		void Prepend(const Standard_Integer value);

		/****** TDataStd_IntegerList::Remove ******/
		/****** md5 signature: 54b03039a7038c867767a866594d37e1 ******/
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
		Standard_Boolean Remove(const Standard_Integer value);

		/****** TDataStd_IntegerList::RemoveByIndex ******/
		/****** md5 signature: c11fa68556ba70a082a882fbe98749a3 ******/
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
		Standard_Boolean RemoveByIndex(const Standard_Integer index);

		/****** TDataStd_IntegerList::Restore ******/
		/****** md5 signature: ddeae219d389a1d89eecb3e23c73522a ******/
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
		/****** md5 signature: 9bed89522d0b510ace46b6aebec92ee0 ******/
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
		/****** md5 signature: 244d113ae14add83954353ca15ede66b ******/
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
		/****** md5 signature: 55a86cab8f05de2d3a4a141cf9114c07 ******/
		%feature("compactdefaultargs") ChangeArraysOfIntegers;
		%feature("autodoc", "
Parameters
----------
theArraysOfIntegers: TDataStd_DataMapOfStringHArray1OfInteger

Return
-------
None

Description
-----------
Replace the container content by new content of the <theArraysOfIntegers>.
") ChangeArraysOfIntegers;
		void ChangeArraysOfIntegers(const TDataStd_DataMapOfStringHArray1OfInteger & theArraysOfIntegers);

		/****** TDataStd_NamedData::ChangeArraysOfReals ******/
		/****** md5 signature: cc70c144703bf55966764ea4966ea324 ******/
		%feature("compactdefaultargs") ChangeArraysOfReals;
		%feature("autodoc", "
Parameters
----------
theArraysOfReals: TDataStd_DataMapOfStringHArray1OfReal

Return
-------
None

Description
-----------
Replace the container content by new content of the <theArraysOfReals>.
") ChangeArraysOfReals;
		void ChangeArraysOfReals(const TDataStd_DataMapOfStringHArray1OfReal & theArraysOfReals);

		/****** TDataStd_NamedData::ChangeBytes ******/
		/****** md5 signature: c0c7e3ca6b09c6ecdec2c8424121adca ******/
		%feature("compactdefaultargs") ChangeBytes;
		%feature("autodoc", "
Parameters
----------
theBytes: TDataStd_DataMapOfStringByte

Return
-------
None

Description
-----------
Replace the container content by new content of the <theBytes>.
") ChangeBytes;
		void ChangeBytes(const TDataStd_DataMapOfStringByte & theBytes);

		/****** TDataStd_NamedData::ChangeIntegers ******/
		/****** md5 signature: f3a9f83b41b019a0c8bc1212f1a76a38 ******/
		%feature("compactdefaultargs") ChangeIntegers;
		%feature("autodoc", "
Parameters
----------
theIntegers: TColStd_DataMapOfStringInteger

Return
-------
None

Description
-----------
Replace the container content by new content of the <theIntegers>.
") ChangeIntegers;
		void ChangeIntegers(const TColStd_DataMapOfStringInteger & theIntegers);

		/****** TDataStd_NamedData::ChangeReals ******/
		/****** md5 signature: 9b1b0533922f259905129bb903ec1f21 ******/
		%feature("compactdefaultargs") ChangeReals;
		%feature("autodoc", "
Parameters
----------
theReals: TDataStd_DataMapOfStringReal

Return
-------
None

Description
-----------
Replace the container content by new content of the <theReals>.
") ChangeReals;
		void ChangeReals(const TDataStd_DataMapOfStringReal & theReals);

		/****** TDataStd_NamedData::ChangeStrings ******/
		/****** md5 signature: b7bed047d8ce49352e3ab0b211d47cc4 ******/
		%feature("compactdefaultargs") ChangeStrings;
		%feature("autodoc", "
Parameters
----------
theStrings: TDataStd_DataMapOfStringString

Return
-------
None

Description
-----------
Replace the container content by new content of the <theStrings>.
") ChangeStrings;
		void ChangeStrings(const TDataStd_DataMapOfStringString & theStrings);

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
		/****** md5 signature: 3398f1042b24f9ae49f7e8da6125f793 ******/
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
		virtual Standard_OStream & Dump(std::ostream &OutValue);


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
		/****** md5 signature: 4a96aa72d1e7e4a27eb2b5a59638120e ******/
		%feature("compactdefaultargs") GetArrayOfIntegers;
		%feature("autodoc", "
Parameters
----------
theName: str

Return
-------
opencascade::handle<TColStd_HArray1OfInteger>

Description
-----------
Returns the named array of integer values. It returns a NULL Handle if there is no such a named array of integers (use HasArrayOfIntegers()).
") GetArrayOfIntegers;
		const opencascade::handle<TColStd_HArray1OfInteger> & GetArrayOfIntegers(TCollection_ExtendedString theName);

		/****** TDataStd_NamedData::GetArrayOfReals ******/
		/****** md5 signature: db520b1dcc5a20b132bdacec290b4245 ******/
		%feature("compactdefaultargs") GetArrayOfReals;
		%feature("autodoc", "
Parameters
----------
theName: str

Return
-------
opencascade::handle<TColStd_HArray1OfReal>

Description
-----------
Returns the named array of real values. It returns a NULL Handle if there is no such a named array of reals (use HasArrayOfReals()).
") GetArrayOfReals;
		const opencascade::handle<TColStd_HArray1OfReal> & GetArrayOfReals(TCollection_ExtendedString theName);

		/****** TDataStd_NamedData::GetArraysOfIntegersContainer ******/
		/****** md5 signature: a1e9fe686378bda0fc070449d50a998a ******/
		%feature("compactdefaultargs") GetArraysOfIntegersContainer;
		%feature("autodoc", "Return
-------
TDataStd_DataMapOfStringHArray1OfInteger

Description
-----------
Returns the internal container of named arrays of integer values.
") GetArraysOfIntegersContainer;
		const TDataStd_DataMapOfStringHArray1OfInteger & GetArraysOfIntegersContainer();

		/****** TDataStd_NamedData::GetArraysOfRealsContainer ******/
		/****** md5 signature: b25b6380e376a4c0c5e323a6e14ec2f8 ******/
		%feature("compactdefaultargs") GetArraysOfRealsContainer;
		%feature("autodoc", "Return
-------
TDataStd_DataMapOfStringHArray1OfReal

Description
-----------
Returns the internal container of named arrays of real values.
") GetArraysOfRealsContainer;
		const TDataStd_DataMapOfStringHArray1OfReal & GetArraysOfRealsContainer();

		/****** TDataStd_NamedData::GetByte ******/
		/****** md5 signature: 939e82da5466136022c4926a2efe7b35 ******/
		%feature("compactdefaultargs") GetByte;
		%feature("autodoc", "
Parameters
----------
theName: str

Return
-------
Standard_Byte

Description
-----------
Returns the named byte. It returns 0 if there is no such a named byte (use HasByte()).
") GetByte;
		Standard_Byte GetByte(TCollection_ExtendedString theName);

		/****** TDataStd_NamedData::GetBytesContainer ******/
		/****** md5 signature: ea73b7a5406b0b6387303ddc10bec47f ******/
		%feature("compactdefaultargs") GetBytesContainer;
		%feature("autodoc", "Return
-------
TDataStd_DataMapOfStringByte

Description
-----------
Returns the internal container of named bytes.
") GetBytesContainer;
		const TDataStd_DataMapOfStringByte & GetBytesContainer();

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
		/****** md5 signature: 6b54a2c0c24e0d10ada8e1ef9718d599 ******/
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
		Standard_Integer GetInteger(TCollection_ExtendedString theName);

		/****** TDataStd_NamedData::GetIntegersContainer ******/
		/****** md5 signature: 21b7a9b99a1fbfad05d9c3d28560589a ******/
		%feature("compactdefaultargs") GetIntegersContainer;
		%feature("autodoc", "Return
-------
TColStd_DataMapOfStringInteger

Description
-----------
Returns the internal container of named integers.
") GetIntegersContainer;
		const TColStd_DataMapOfStringInteger & GetIntegersContainer();

		/****** TDataStd_NamedData::GetReal ******/
		/****** md5 signature: 4ae7a7a98da3d341416d79e090f6b1a4 ******/
		%feature("compactdefaultargs") GetReal;
		%feature("autodoc", "
Parameters
----------
theName: str

Return
-------
float

Description
-----------
Returns the named real. It returns 0.0 if there is no such a named real (use HasReal()).
") GetReal;
		Standard_Real GetReal(TCollection_ExtendedString theName);

		/****** TDataStd_NamedData::GetRealsContainer ******/
		/****** md5 signature: b9e2c4440bc22fb7830c62903dc1a40c ******/
		%feature("compactdefaultargs") GetRealsContainer;
		%feature("autodoc", "Return
-------
TDataStd_DataMapOfStringReal

Description
-----------
Returns the internal container of named reals.
") GetRealsContainer;
		const TDataStd_DataMapOfStringReal & GetRealsContainer();

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
		/****** md5 signature: 13ee8580b035b794e3fdbc2e42bde3fe ******/
		%feature("compactdefaultargs") GetStringsContainer;
		%feature("autodoc", "Return
-------
TDataStd_DataMapOfStringString

Description
-----------
Returns the internal container of named strings.
") GetStringsContainer;
		const TDataStd_DataMapOfStringString & GetStringsContainer();

		/****** TDataStd_NamedData::HasArrayOfIntegers ******/
		/****** md5 signature: bc48c8ef7c6aada5fd483450dcb3d31c ******/
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
		Standard_Boolean HasArrayOfIntegers(TCollection_ExtendedString theName);

		/****** TDataStd_NamedData::HasArrayOfReals ******/
		/****** md5 signature: 5a74df706dd2f1d3399b54e753d72fa5 ******/
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
		Standard_Boolean HasArrayOfReals(TCollection_ExtendedString theName);

		/****** TDataStd_NamedData::HasArraysOfIntegers ******/
		/****** md5 signature: 630276ad2915cc0f5cb7a7fae1577c12 ******/
		%feature("compactdefaultargs") HasArraysOfIntegers;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if there are some named arrays of integer values in the attribute.
") HasArraysOfIntegers;
		Standard_Boolean HasArraysOfIntegers();

		/****** TDataStd_NamedData::HasArraysOfReals ******/
		/****** md5 signature: 3a700fb256757684d41d9b2cb7dfbe60 ******/
		%feature("compactdefaultargs") HasArraysOfReals;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if there are some named arrays of real values in the attribute.
") HasArraysOfReals;
		Standard_Boolean HasArraysOfReals();

		/****** TDataStd_NamedData::HasByte ******/
		/****** md5 signature: 96647156a924919be2a85cac754550c0 ******/
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
		Standard_Boolean HasByte(TCollection_ExtendedString theName);

		/****** TDataStd_NamedData::HasBytes ******/
		/****** md5 signature: 94a3934cdf294db1b998b35763579703 ******/
		%feature("compactdefaultargs") HasBytes;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if there are some named bytes in the attribute.
") HasBytes;
		Standard_Boolean HasBytes();

		/****** TDataStd_NamedData::HasDeferredData ******/
		/****** md5 signature: 6d3e21e66856957a5fa945244fecad2c ******/
		%feature("compactdefaultargs") HasDeferredData;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if some data is not loaded from deferred storage and can be loaded using LoadDeferredData(). //! Late-load interface allows to avoid loading auxiliary data into memory until it is needed by application and also speed up reader by skipping data chunks in file. This feature requires file format having special structure, and usually implies read-only access, therefore default implementation will return False here. //! Late-load elements require special attention to ensure data consistency, as such elements are created in undefined state (no data) and Undo/Redo mechanism will not work until deferred data being loaded. //! Usage scenarios: - Application displays model in read-only way. Late-load elements are loaded temporarily on demand and immediately unloaded. theNamedData->LoadDeferredData (true); TCollection_AsciiString aValue = theNamedData->GetString (theKey); theNamedData->UnloadDeferredData(); - Application saves the model into another format. All late-load elements should be loaded (at least temporary during operation). - Application modifies the model. Late-load element should be loaded with removed link to deferred storage, so that Undo()/Redo() will work as expected since loading. theNamedData->LoadDeferredData (false); theNamedData->SetString (theKey, theNewValue);.
") HasDeferredData;
		virtual Standard_Boolean HasDeferredData();

		/****** TDataStd_NamedData::HasInteger ******/
		/****** md5 signature: 2240b54628b28022d39a4cae802f471c ******/
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
		Standard_Boolean HasInteger(TCollection_ExtendedString theName);

		/****** TDataStd_NamedData::HasIntegers ******/
		/****** md5 signature: aa7fb571afe1cc8055a6c72701aedd1e ******/
		%feature("compactdefaultargs") HasIntegers;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if at least one named integer value is kept in the attribute.
") HasIntegers;
		Standard_Boolean HasIntegers();

		/****** TDataStd_NamedData::HasReal ******/
		/****** md5 signature: c4d66ca3fe426eab3bf399ce36cfc35f ******/
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
		Standard_Boolean HasReal(TCollection_ExtendedString theName);

		/****** TDataStd_NamedData::HasReals ******/
		/****** md5 signature: d08f33ee376c6cd75a9d81cc491b4176 ******/
		%feature("compactdefaultargs") HasReals;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if at least one named real value is kept in the attribute.
") HasReals;
		Standard_Boolean HasReals();

		/****** TDataStd_NamedData::HasString ******/
		/****** md5 signature: b0713af4d469778dbe03653123a46b1d ******/
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
		Standard_Boolean HasString(TCollection_ExtendedString theName);

		/****** TDataStd_NamedData::HasStrings ******/
		/****** md5 signature: 91968d2a3a35cf447a545790772a5e0a ******/
		%feature("compactdefaultargs") HasStrings;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if there are some named strings in the attribute.
") HasStrings;
		Standard_Boolean HasStrings();

		/****** TDataStd_NamedData::ID ******/
		/****** md5 signature: 18550bf05502080c8e2a8a16aabb4183 ******/
		%feature("compactdefaultargs") ID;
		%feature("autodoc", "Return
-------
Standard_GUID

Description
-----------
No available documentation.
") ID;
		virtual const Standard_GUID & ID();

		/****** TDataStd_NamedData::LoadDeferredData ******/
		/****** md5 signature: 4d667dd77669ff93ce36b42acfa15e09 ******/
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
		virtual Standard_Boolean LoadDeferredData(Standard_Boolean theToKeepDeferred = false);

		/****** TDataStd_NamedData::NewEmpty ******/
		/****** md5 signature: 8be17a4d2a4deeee198571712e76805e ******/
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "Return
-------
opencascade::handle<TDF_Attribute>

Description
-----------
No available documentation.
") NewEmpty;
		virtual opencascade::handle<TDF_Attribute> NewEmpty();

		/****** TDataStd_NamedData::Paste ******/
		/****** md5 signature: 05e5f8f16a08ca8388ac65d3be603584 ******/
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
		virtual void Paste(const opencascade::handle<TDF_Attribute> & Into, const opencascade::handle<TDF_RelocationTable> & RT);

		/****** TDataStd_NamedData::Restore ******/
		/****** md5 signature: 317305acc3f3ea9c2fd983a7ed00e566 ******/
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
		virtual void Restore(const opencascade::handle<TDF_Attribute> & With);

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
		/****** md5 signature: b617034b38fb8c6f3a9eb39a8befb616 ******/
		%feature("compactdefaultargs") SetArrayOfIntegers;
		%feature("autodoc", "
Parameters
----------
theName: str
theArrayOfIntegers: TColStd_HArray1OfInteger

Return
-------
None

Description
-----------
Defines a named array of integer values. 
Input parameter: theName key 
Input parameter: theArrayOfIntegers new value, overrides existing (passed array will be copied by value!).
") SetArrayOfIntegers;
		void SetArrayOfIntegers(TCollection_ExtendedString theName, const opencascade::handle<TColStd_HArray1OfInteger> & theArrayOfIntegers);

		/****** TDataStd_NamedData::SetArrayOfReals ******/
		/****** md5 signature: 16f1e7f9567f65375c020bb23d8100af ******/
		%feature("compactdefaultargs") SetArrayOfReals;
		%feature("autodoc", "
Parameters
----------
theName: str
theArrayOfReals: TColStd_HArray1OfReal

Return
-------
None

Description
-----------
Defines a named array of real values. 
Input parameter: theName key 
Input parameter: theArrayOfReals new value, overrides existing (passed array will be copied by value!).
") SetArrayOfReals;
		void SetArrayOfReals(TCollection_ExtendedString theName, const opencascade::handle<TColStd_HArray1OfReal> & theArrayOfReals);

		/****** TDataStd_NamedData::SetByte ******/
		/****** md5 signature: 4a6e013a0bf3337864e2187c10d95ca1 ******/
		%feature("compactdefaultargs") SetByte;
		%feature("autodoc", "
Parameters
----------
theName: str
theByte: Standard_Byte

Return
-------
None

Description
-----------
Defines a named byte. If the byte already exists, it changes its value to <theByte>.
") SetByte;
		void SetByte(TCollection_ExtendedString theName, const Standard_Byte theByte);

		/****** TDataStd_NamedData::SetInteger ******/
		/****** md5 signature: 4e011fdcaf36e99a883b60954eb74fd6 ******/
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
		void SetInteger(TCollection_ExtendedString theName, const Standard_Integer theInteger);

		/****** TDataStd_NamedData::SetReal ******/
		/****** md5 signature: 3881e61413b5d53222042466565b51e6 ******/
		%feature("compactdefaultargs") SetReal;
		%feature("autodoc", "
Parameters
----------
theName: str
theReal: float

Return
-------
None

Description
-----------
Defines a named real. If the real already exists, it changes its value to <theReal>.
") SetReal;
		void SetReal(TCollection_ExtendedString theName, const Standard_Real theReal);

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
		/****** md5 signature: 0475147ec5a2f4fc11b633d052584e7a ******/
		%feature("compactdefaultargs") UnloadDeferredData;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Releases data if object has connected deferred storage, without calling Backup(). WARNING! This operation does not unload modifications to deferred storage (normally it is read-only), so that modifications will be discarded (if any). 
Return: False if object has no deferred data.
") UnloadDeferredData;
		virtual Standard_Boolean UnloadDeferredData();

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
		/****** md5 signature: 4363833f3b7223b8cbf87ce2438e80a5 ******/
		%feature("compactdefaultargs") setArrayOfIntegers;
		%feature("autodoc", "
Parameters
----------
theName: str
theArrayOfIntegers: TColStd_HArray1OfInteger

Return
-------
None

Description
-----------
Defines a named array of integer values (without calling Backup).
") setArrayOfIntegers;
		void setArrayOfIntegers(TCollection_ExtendedString theName, const opencascade::handle<TColStd_HArray1OfInteger> & theArrayOfIntegers);

		/****** TDataStd_NamedData::setArrayOfReals ******/
		/****** md5 signature: 26be02bfa2f598e0213856441ddbd2e7 ******/
		%feature("compactdefaultargs") setArrayOfReals;
		%feature("autodoc", "
Parameters
----------
theName: str
theArrayOfReals: TColStd_HArray1OfReal

Return
-------
None

Description
-----------
Defines a named array of real values (without calling Backup).
") setArrayOfReals;
		void setArrayOfReals(TCollection_ExtendedString theName, const opencascade::handle<TColStd_HArray1OfReal> & theArrayOfReals);

		/****** TDataStd_NamedData::setByte ******/
		/****** md5 signature: 4a6e013a0bf3337864e2187c10d95ca1 ******/
		%feature("compactdefaultargs") setByte;
		%feature("autodoc", "
Parameters
----------
theName: str
theByte: Standard_Byte

Return
-------
None

Description
-----------
Defines a named byte (without calling Backup).
") setByte;
		void setByte(TCollection_ExtendedString theName, const Standard_Byte theByte);

		/****** TDataStd_NamedData::setInteger ******/
		/****** md5 signature: 4e011fdcaf36e99a883b60954eb74fd6 ******/
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
		void setInteger(TCollection_ExtendedString theName, const Standard_Integer theInteger);

		/****** TDataStd_NamedData::setReal ******/
		/****** md5 signature: 3881e61413b5d53222042466565b51e6 ******/
		%feature("compactdefaultargs") setReal;
		%feature("autodoc", "
Parameters
----------
theName: str
theReal: float

Return
-------
None

Description
-----------
Defines a named real (without calling Backup).
") setReal;
		void setReal(TCollection_ExtendedString theName, const Standard_Real theReal);

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
		/****** md5 signature: 3398f1042b24f9ae49f7e8da6125f793 ******/
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
		virtual Standard_OStream & Dump(std::ostream &OutValue);


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
		/****** md5 signature: fc841fb28cb01367762b1d75c09d001e ******/
		%feature("compactdefaultargs") Get;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns the real number value contained in the attribute.
") Get;
		Standard_Real Get();

		/****** TDataStd_Real::GetDimension ******/
		/****** md5 signature: 853aef0fdf2cdedcc5c6a512c960301d ******/
		%feature("compactdefaultargs") GetDimension;
		%feature("autodoc", "Return
-------
TDataStd_RealEnum

Description
-----------
Obsolete method that will be removed in next versions. This field is not supported in the persistence mechanism.
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
		/****** md5 signature: 4697ce8a095fa6dcef0217708d19718f ******/
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
		/****** md5 signature: 12ea7252bed17339127c3c98a18cb3cc ******/
		%feature("compactdefaultargs") IsCaptured;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if there is a reference on the same label.
") IsCaptured;
		Standard_Boolean IsCaptured();

		/****** TDataStd_Real::NewEmpty ******/
		/****** md5 signature: c6d13c9ecc64c6c803b6e119e8216934 ******/
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
		/****** md5 signature: a6ff306a759c68a191c0262635db980f ******/
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
		/****** md5 signature: ddeae219d389a1d89eecb3e23c73522a ******/
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
		/****** md5 signature: adfae07f13ec85f973dbbc58e9bf051e ******/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "
Parameters
----------
label: TDF_Label
value: float

Return
-------
opencascade::handle<TDataStd_Real>

Description
-----------
Finds, or creates, a Real attribute with default GUID and sets <value>. The Real attribute is returned. The Real dimension is Scalar by default. Use SetDimension to overwrite. Real methods ============.
") Set;
		static opencascade::handle<TDataStd_Real> Set(const TDF_Label & label, const Standard_Real value);

		/****** TDataStd_Real::Set ******/
		/****** md5 signature: b5da86df5efbf1d497e3a0f36d50c747 ******/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "
Parameters
----------
label: TDF_Label
guid: Standard_GUID
value: float

Return
-------
opencascade::handle<TDataStd_Real>

Description
-----------
Finds, or creates, a Real attribute with explicit GUID and sets <value>. The Real attribute is returned. Real methods ============.
") Set;
		static opencascade::handle<TDataStd_Real> Set(const TDF_Label & label, const Standard_GUID & guid, const Standard_Real value);

		/****** TDataStd_Real::Set ******/
		/****** md5 signature: 4d75ecabbf8b06da8c7da02cf6b17a7c ******/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "
Parameters
----------
V: float

Return
-------
None

Description
-----------
Sets the real number V.
") Set;
		void Set(const Standard_Real V);

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
Obsolete method that will be removed in next versions. This field is not supported in the persistence mechanism.
") SetDimension;
		void SetDimension(const TDataStd_RealEnum DIM);

		/****** TDataStd_Real::SetID ******/
		/****** md5 signature: 7a929ce753effeac220c978ae7330330 ******/
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
		/****** md5 signature: 244d113ae14add83954353ca15ede66b ******/
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
		/****** md5 signature: 258fa80f8a51ca0aa0e5ad2f4f009cdc ******/
		%feature("compactdefaultargs") Array;
		%feature("autodoc", "Return
-------
opencascade::handle<TColStd_HArray1OfReal>

Description
-----------
Returns the handle of this array of reals.
") Array;
		const opencascade::handle<TColStd_HArray1OfReal> & Array();

		/****** TDataStd_RealArray::ChangeArray ******/
		/****** md5 signature: 013a639f65bedf7768c12d7b77c602eb ******/
		%feature("compactdefaultargs") ChangeArray;
		%feature("autodoc", "
Parameters
----------
newArray: TColStd_HArray1OfReal
isCheckItems: bool (optional, default to Standard_True)

Return
-------
None

Description
-----------
Sets the inner array <myValue> of the RealArray attribute to <newArray>. If value of <newArray> differs from <myValue>, Backup performed and myValue refers to new instance of HArray1OfReal that holds <newArray> values If <isCheckItems> equal True each item of <newArray> will be checked with each item of <myValue> for coincidence (to avoid backup).
") ChangeArray;
		void ChangeArray(const opencascade::handle<TColStd_HArray1OfReal> & newArray, const Standard_Boolean isCheckItems = Standard_True);

		/****** TDataStd_RealArray::DeltaOnModification ******/
		/****** md5 signature: 9a96ec815d43dd1838c022740c5327d0 ******/
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
		virtual opencascade::handle<TDF_DeltaOnModification> DeltaOnModification(const opencascade::handle<TDF_Attribute> & anOldAttribute);

		/****** TDataStd_RealArray::Dump ******/
		/****** md5 signature: 3398f1042b24f9ae49f7e8da6125f793 ******/
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
		virtual Standard_OStream & Dump(std::ostream &OutValue);


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
		/****** md5 signature: 570a92cb77e1626ccd16d9bb8bc3044c ******/
		%feature("compactdefaultargs") GetDelta;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") GetDelta;
		Standard_Boolean GetDelta();

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
		/****** md5 signature: 4697ce8a095fa6dcef0217708d19718f ******/
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
		/****** md5 signature: 7821d9c43d1b72a2a51576c8503c10d4 ******/
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
		void Init(const Standard_Integer lower, const Standard_Integer upper);

		/****** TDataStd_RealArray::Length ******/
		/****** md5 signature: 58bd40380acccb2733bfbd37bf3cbb11 ******/
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of elements of the array of reals in terms of the number of elements it contains.
") Length;
		Standard_Integer Length();

		/****** TDataStd_RealArray::Lower ******/
		/****** md5 signature: fe1655437e349162aeffc9b3814347af ******/
		%feature("compactdefaultargs") Lower;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the lower boundary of the array.
") Lower;
		Standard_Integer Lower();

		/****** TDataStd_RealArray::NewEmpty ******/
		/****** md5 signature: c6d13c9ecc64c6c803b6e119e8216934 ******/
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
		/****** md5 signature: a6ff306a759c68a191c0262635db980f ******/
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
		/****** md5 signature: ddeae219d389a1d89eecb3e23c73522a ******/
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
		/****** md5 signature: 48f3e162f59c0d9b4ebd2d416bcd46eb ******/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "
Parameters
----------
label: TDF_Label
lower: int
upper: int
isDelta: bool (optional, default to Standard_False)

Return
-------
opencascade::handle<TDataStd_RealArray>

Description
-----------
Finds or creates on the <label> a real array attribute with the specified <lower> and <upper> boundaries. If <isDelta> == False, DefaultDeltaOnModification is used. If <isDelta> == True, DeltaOnModification of the current attribute is used. If attribute is already set, input parameter <isDelta> is refused and the found attribute returned.
") Set;
		static opencascade::handle<TDataStd_RealArray> Set(const TDF_Label & label, const Standard_Integer lower, const Standard_Integer upper, const Standard_Boolean isDelta = Standard_False);

		/****** TDataStd_RealArray::Set ******/
		/****** md5 signature: 02926e3f2635296d79033ba0cf76528f ******/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "
Parameters
----------
label: TDF_Label
theGuid: Standard_GUID
lower: int
upper: int
isDelta: bool (optional, default to Standard_False)

Return
-------
opencascade::handle<TDataStd_RealArray>

Description
-----------
Finds, or creates, an RealArray attribute with explicit user defined <guid>. The RealArray attribute is returned.
") Set;
		static opencascade::handle<TDataStd_RealArray> Set(const TDF_Label & label, const Standard_GUID & theGuid, const Standard_Integer lower, const Standard_Integer upper, const Standard_Boolean isDelta = Standard_False);

		/****** TDataStd_RealArray::SetDelta ******/
		/****** md5 signature: 66bc6f747d37a3ea7110a95b02e13c41 ******/
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
		void SetDelta(const Standard_Boolean isDelta);

		/****** TDataStd_RealArray::SetID ******/
		/****** md5 signature: 9bed89522d0b510ace46b6aebec92ee0 ******/
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
		/****** md5 signature: 244d113ae14add83954353ca15ede66b ******/
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
		/****** md5 signature: 4716e5d045677f06335160a1ccba754d ******/
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "
Parameters
----------
Index: int
Value: float

Return
-------
None

Description
-----------
Sets the <Index>th element of the array to <Value> OutOfRange exception is raised if <Index> doesn't respect Lower and Upper bounds of the internal array.
") SetValue;
		void SetValue(const Standard_Integer Index, const Standard_Real Value);

		/****** TDataStd_RealArray::Upper ******/
		/****** md5 signature: 8f614b31058bb30bdf81ecd0e2d444dc ******/
		%feature("compactdefaultargs") Upper;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the upper boundary of the array.
") Upper;
		Standard_Integer Upper();

		/****** TDataStd_RealArray::Value ******/
		/****** md5 signature: 848ebada0b45fc838235de2b6b6e8d07 ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
float

Description
-----------
Return the value of the <Index>th element of the array.
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
		/****** md5 signature: f8a8f3c712d27179b5616b621b1bf53e ******/
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "
Parameters
----------
value: float

Return
-------
None

Description
-----------
No available documentation.
") Append;
		void Append(const Standard_Real value);

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
		/****** md5 signature: 3398f1042b24f9ae49f7e8da6125f793 ******/
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
		virtual Standard_OStream & Dump(std::ostream &OutValue);


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
		/****** md5 signature: 8da0d7e03de513b08d57e17232ac7391 ******/
		%feature("compactdefaultargs") Extent;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") Extent;
		Standard_Integer Extent();

		/****** TDataStd_RealList::First ******/
		/****** md5 signature: 009dd98af15e46b2da286731f40e1839 ******/
		%feature("compactdefaultargs") First;
		%feature("autodoc", "Return
-------
float

Description
-----------
No available documentation.
") First;
		Standard_Real First();

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
		/****** md5 signature: 4697ce8a095fa6dcef0217708d19718f ******/
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
		/****** md5 signature: 1526a74510a699288440d63c6d3369d3 ******/
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "
Parameters
----------
value: float
after_value: float

Return
-------
bool

Description
-----------
Inserts the <value> after the first meet of <after_value>.
") InsertAfter;
		Standard_Boolean InsertAfter(const Standard_Real value, const Standard_Real after_value);

		/****** TDataStd_RealList::InsertAfterByIndex ******/
		/****** md5 signature: d2759367e5d3efc19a4747a928aadd83 ******/
		%feature("compactdefaultargs") InsertAfterByIndex;
		%feature("autodoc", "
Parameters
----------
index: int
after_value: float

Return
-------
bool

Description
-----------
Inserts the <value> after the <index> position. The indices start with 1 .. Extent().
") InsertAfterByIndex;
		Standard_Boolean InsertAfterByIndex(const Standard_Integer index, const Standard_Real after_value);

		/****** TDataStd_RealList::InsertBefore ******/
		/****** md5 signature: 3a00dd8235479555bdace2eead9b66c1 ******/
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "
Parameters
----------
value: float
before_value: float

Return
-------
bool

Description
-----------
Inserts the <value> before the first meet of <before_value>.
") InsertBefore;
		Standard_Boolean InsertBefore(const Standard_Real value, const Standard_Real before_value);

		/****** TDataStd_RealList::InsertBeforeByIndex ******/
		/****** md5 signature: f1ae8f61aa5425f6ac5be85591ec76cd ******/
		%feature("compactdefaultargs") InsertBeforeByIndex;
		%feature("autodoc", "
Parameters
----------
index: int
before_value: float

Return
-------
bool

Description
-----------
Inserts the <value> before the <index> position. The indices start with 1 .. Extent().
") InsertBeforeByIndex;
		Standard_Boolean InsertBeforeByIndex(const Standard_Integer index, const Standard_Real before_value);

		/****** TDataStd_RealList::IsEmpty ******/
		/****** md5 signature: 6ab5e1ad63f93168856ab126dd374b81 ******/
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsEmpty;
		Standard_Boolean IsEmpty();

		/****** TDataStd_RealList::Last ******/
		/****** md5 signature: 4c8063c237a4f73018a7949da8aef9fb ******/
		%feature("compactdefaultargs") Last;
		%feature("autodoc", "Return
-------
float

Description
-----------
No available documentation.
") Last;
		Standard_Real Last();

		/****** TDataStd_RealList::List ******/
		/****** md5 signature: bb4687a5f112f09f0c7d954955de692d ******/
		%feature("compactdefaultargs") List;
		%feature("autodoc", "Return
-------
TColStd_ListOfReal

Description
-----------
No available documentation.
") List;
		const TColStd_ListOfReal & List();

		/****** TDataStd_RealList::NewEmpty ******/
		/****** md5 signature: c6d13c9ecc64c6c803b6e119e8216934 ******/
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
		/****** md5 signature: a6ff306a759c68a191c0262635db980f ******/
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
		/****** md5 signature: 4f2498da5d2b3c6fb99e4393a7cbed84 ******/
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "
Parameters
----------
value: float

Return
-------
None

Description
-----------
No available documentation.
") Prepend;
		void Prepend(const Standard_Real value);

		/****** TDataStd_RealList::Remove ******/
		/****** md5 signature: 7941dddff97a0eba4713aac77f9daf6a ******/
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "
Parameters
----------
value: float

Return
-------
bool

Description
-----------
Removes the first meet of the <value>.
") Remove;
		Standard_Boolean Remove(const Standard_Real value);

		/****** TDataStd_RealList::RemoveByIndex ******/
		/****** md5 signature: c11fa68556ba70a082a882fbe98749a3 ******/
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
		Standard_Boolean RemoveByIndex(const Standard_Integer index);

		/****** TDataStd_RealList::Restore ******/
		/****** md5 signature: ddeae219d389a1d89eecb3e23c73522a ******/
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
		/****** md5 signature: 9bed89522d0b510ace46b6aebec92ee0 ******/
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
		/****** md5 signature: 244d113ae14add83954353ca15ede66b ******/
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
		/****** md5 signature: 3398f1042b24f9ae49f7e8da6125f793 ******/
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
		virtual Standard_OStream & Dump(std::ostream &OutValue);


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
		/****** md5 signature: 4697ce8a095fa6dcef0217708d19718f ******/
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
		/****** md5 signature: 7821d9c43d1b72a2a51576c8503c10d4 ******/
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
		void Init(const Standard_Integer lower, const Standard_Integer upper);

		/****** TDataStd_ReferenceArray::InternalArray ******/
		/****** md5 signature: 4cb44e93aa5efec14fa520fd2407aff4 ******/
		%feature("compactdefaultargs") InternalArray;
		%feature("autodoc", "Return
-------
opencascade::handle<TDataStd_HLabelArray1>

Description
-----------
No available documentation.
") InternalArray;
		const opencascade::handle<TDataStd_HLabelArray1> & InternalArray();

		/****** TDataStd_ReferenceArray::Length ******/
		/****** md5 signature: 58bd40380acccb2733bfbd37bf3cbb11 ******/
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of elements in the array.
") Length;
		Standard_Integer Length();

		/****** TDataStd_ReferenceArray::Lower ******/
		/****** md5 signature: fe1655437e349162aeffc9b3814347af ******/
		%feature("compactdefaultargs") Lower;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the lower boundary of the array.
") Lower;
		Standard_Integer Lower();

		/****** TDataStd_ReferenceArray::NewEmpty ******/
		/****** md5 signature: c6d13c9ecc64c6c803b6e119e8216934 ******/
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
		/****** md5 signature: a6ff306a759c68a191c0262635db980f ******/
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
		/****** md5 signature: f171ce811dbfb205236d26e3cbf15450 ******/
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
		virtual void References(const opencascade::handle<TDF_DataSet> & DS);

		/****** TDataStd_ReferenceArray::Restore ******/
		/****** md5 signature: ddeae219d389a1d89eecb3e23c73522a ******/
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
		/****** md5 signature: 0ac756120843d05141929b5124bf699e ******/
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
		static opencascade::handle<TDataStd_ReferenceArray> Set(const TDF_Label & label, const Standard_Integer lower, const Standard_Integer upper);

		/****** TDataStd_ReferenceArray::Set ******/
		/****** md5 signature: 86dd1a3bfb736b809b1ba224d5acf616 ******/
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
		static opencascade::handle<TDataStd_ReferenceArray> Set(const TDF_Label & label, const Standard_GUID & theGuid, const Standard_Integer lower, const Standard_Integer upper);

		/****** TDataStd_ReferenceArray::SetID ******/
		/****** md5 signature: 9bed89522d0b510ace46b6aebec92ee0 ******/
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
		/****** md5 signature: 244d113ae14add83954353ca15ede66b ******/
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
		/****** md5 signature: fb1da68a9b4daf661fe381840cb2c5c3 ******/
		%feature("compactdefaultargs") SetInternalArray;
		%feature("autodoc", "
Parameters
----------
values: TDataStd_HLabelArray1
isCheckItems: bool (optional, default to Standard_True)

Return
-------
None

Description
-----------
No available documentation.
") SetInternalArray;
		void SetInternalArray(const opencascade::handle<TDataStd_HLabelArray1> & values, const Standard_Boolean isCheckItems = Standard_True);

		/****** TDataStd_ReferenceArray::SetValue ******/
		/****** md5 signature: 391200af1382b8920cfedd756d7d73db ******/
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
		void SetValue(const Standard_Integer index, const TDF_Label & value);

		/****** TDataStd_ReferenceArray::Upper ******/
		/****** md5 signature: 8f614b31058bb30bdf81ecd0e2d444dc ******/
		%feature("compactdefaultargs") Upper;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the upper boundary of the array.
") Upper;
		Standard_Integer Upper();

		/****** TDataStd_ReferenceArray::Value ******/
		/****** md5 signature: 0a8a674e7de2dce6641ef600a54da113 ******/
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
		/****** md5 signature: 3398f1042b24f9ae49f7e8da6125f793 ******/
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
		virtual Standard_OStream & Dump(std::ostream &OutValue);


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
		/****** md5 signature: 8da0d7e03de513b08d57e17232ac7391 ******/
		%feature("compactdefaultargs") Extent;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") Extent;
		Standard_Integer Extent();

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
		/****** md5 signature: 4697ce8a095fa6dcef0217708d19718f ******/
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
		/****** md5 signature: ff77c598a4a4e62f620ea009da1170bd ******/
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
		Standard_Boolean InsertAfter(const TDF_Label & value, const TDF_Label & after_value);

		/****** TDataStd_ReferenceList::InsertAfter ******/
		/****** md5 signature: 83eefae3f1ccacd848185dd491b62e11 ******/
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
		Standard_Boolean InsertAfter(const Standard_Integer index, const TDF_Label & after_value);

		/****** TDataStd_ReferenceList::InsertBefore ******/
		/****** md5 signature: 2ac54f6c0511e2a4b41de5160baaace1 ******/
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
		Standard_Boolean InsertBefore(const TDF_Label & value, const TDF_Label & before_value);

		/****** TDataStd_ReferenceList::InsertBefore ******/
		/****** md5 signature: e723549c21185a4d8f3f4ad0b44352c1 ******/
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
		Standard_Boolean InsertBefore(const Standard_Integer index, const TDF_Label & before_value);

		/****** TDataStd_ReferenceList::IsEmpty ******/
		/****** md5 signature: 6ab5e1ad63f93168856ab126dd374b81 ******/
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsEmpty;
		Standard_Boolean IsEmpty();

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
		/****** md5 signature: 9fe1755f03705d9a6078452748e614f0 ******/
		%feature("compactdefaultargs") List;
		%feature("autodoc", "Return
-------
TDF_LabelList

Description
-----------
No available documentation.
") List;
		const TDF_LabelList & List();

		/****** TDataStd_ReferenceList::NewEmpty ******/
		/****** md5 signature: c6d13c9ecc64c6c803b6e119e8216934 ******/
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
		/****** md5 signature: a6ff306a759c68a191c0262635db980f ******/
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
		/****** md5 signature: f171ce811dbfb205236d26e3cbf15450 ******/
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
		virtual void References(const opencascade::handle<TDF_DataSet> & DS);

		/****** TDataStd_ReferenceList::Remove ******/
		/****** md5 signature: 0038b298680b9f13b219a3855474472b ******/
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
		Standard_Boolean Remove(const TDF_Label & value);

		/****** TDataStd_ReferenceList::Remove ******/
		/****** md5 signature: d5758943c335a06d32f07ab2389e0fe6 ******/
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
		Standard_Boolean Remove(const Standard_Integer index);

		/****** TDataStd_ReferenceList::Restore ******/
		/****** md5 signature: ddeae219d389a1d89eecb3e23c73522a ******/
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
		/****** md5 signature: 9bed89522d0b510ace46b6aebec92ee0 ******/
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
		/****** md5 signature: 244d113ae14add83954353ca15ede66b ******/
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
		/****** md5 signature: b31825498767e26fb4d69f77ab94108b ******/
		%feature("compactdefaultargs") AfterAddition;
		%feature("autodoc", "Return
-------
None

Description
-----------
Connect the TreeNode to its father child list.
") AfterAddition;
		virtual void AfterAddition();

		/****** TDataStd_TreeNode::AfterResume ******/
		/****** md5 signature: 1d4195e9b512e0fcd0e4fad379210118 ******/
		%feature("compactdefaultargs") AfterResume;
		%feature("autodoc", "Return
-------
None

Description
-----------
Reconnect the TreeNode to its father child list.
") AfterResume;
		virtual void AfterResume();

		/****** TDataStd_TreeNode::AfterUndo ******/
		/****** md5 signature: 6a782c706f1e9291f121f77d889ed576 ******/
		%feature("compactdefaultargs") AfterUndo;
		%feature("autodoc", "
Parameters
----------
anAttDelta: TDF_AttributeDelta
forceIt: bool (optional, default to Standard_False)

Return
-------
bool

Description
-----------
Reconnect the TreeNode, if necessary. Implementation of Attribute methods: ===================================.
") AfterUndo;
		virtual Standard_Boolean AfterUndo(const opencascade::handle<TDF_AttributeDelta> & anAttDelta, const Standard_Boolean forceIt = Standard_False);

		/****** TDataStd_TreeNode::Append ******/
		/****** md5 signature: a8fd473883f7f2817221327a52e3aaf6 ******/
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
		Standard_Boolean Append(const opencascade::handle<TDataStd_TreeNode> & Child);

		/****** TDataStd_TreeNode::BeforeForget ******/
		/****** md5 signature: e5a78fffddf9fa82f6f158acce858991 ******/
		%feature("compactdefaultargs") BeforeForget;
		%feature("autodoc", "Return
-------
None

Description
-----------
Disconnect the TreeNode from its Father child list.
") BeforeForget;
		virtual void BeforeForget();

		/****** TDataStd_TreeNode::BeforeUndo ******/
		/****** md5 signature: d409c3f1c759e5fb3727056dd12910e7 ******/
		%feature("compactdefaultargs") BeforeUndo;
		%feature("autodoc", "
Parameters
----------
anAttDelta: TDF_AttributeDelta
forceIt: bool (optional, default to Standard_False)

Return
-------
bool

Description
-----------
Disconnect the TreeNode, if necessary.
") BeforeUndo;
		virtual Standard_Boolean BeforeUndo(const opencascade::handle<TDF_AttributeDelta> & anAttDelta, const Standard_Boolean forceIt = Standard_False);

		/****** TDataStd_TreeNode::Depth ******/
		/****** md5 signature: b6eaa771d2fe709741b9c1e8ce5ec68f ******/
		%feature("compactdefaultargs") Depth;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the depth of this tree node in the overall tree node structure. In other words, the number of father tree nodes of this one is returned.
") Depth;
		Standard_Integer Depth();

		/****** TDataStd_TreeNode::Dump ******/
		/****** md5 signature: 3398f1042b24f9ae49f7e8da6125f793 ******/
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
		virtual Standard_OStream & Dump(std::ostream &OutValue);


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
		/****** md5 signature: 3ebbc855e62070f911d56a3225391cca ******/
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
class methods working on the node =================================== Returns true if the tree node T is found on the label L. Otherwise, false is returned.
") Find;
		static Standard_Boolean Find(const TDF_Label & L, opencascade::handle<TDataStd_TreeNode> & T);

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
		/****** md5 signature: 460320b1dfa669ec97caaf61775c91ef ******/
		%feature("compactdefaultargs") HasFather;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if this tree node attribute has a father tree node.
") HasFather;
		Standard_Boolean HasFather();

		/****** TDataStd_TreeNode::HasFirst ******/
		/****** md5 signature: a68be84c16fa3b425aa2242913b7b855 ******/
		%feature("compactdefaultargs") HasFirst;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if this tree node attribute has a first child tree node.
") HasFirst;
		Standard_Boolean HasFirst();

		/****** TDataStd_TreeNode::HasLast ******/
		/****** md5 signature: 013083be5a8309a76ae714f82c261d28 ******/
		%feature("compactdefaultargs") HasLast;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if this tree node attribute has a last child tree node.
") HasLast;
		Standard_Boolean HasLast();

		/****** TDataStd_TreeNode::HasNext ******/
		/****** md5 signature: 8e76e2c6de239b72cfbc78ab89aa74ce ******/
		%feature("compactdefaultargs") HasNext;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if this tree node attribute has a next tree node.
") HasNext;
		Standard_Boolean HasNext();

		/****** TDataStd_TreeNode::HasPrevious ******/
		/****** md5 signature: 222c1ab4a665482cbe8287ca7ac25f9a ******/
		%feature("compactdefaultargs") HasPrevious;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if this tree node attribute has a previous tree node.
") HasPrevious;
		Standard_Boolean HasPrevious();

		/****** TDataStd_TreeNode::ID ******/
		/****** md5 signature: 4697ce8a095fa6dcef0217708d19718f ******/
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
		/****** md5 signature: 3de035405170a903b03e23e39f9378e7 ******/
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
		Standard_Boolean InsertAfter(const opencascade::handle<TDataStd_TreeNode> & Node);

		/****** TDataStd_TreeNode::InsertBefore ******/
		/****** md5 signature: 7eb2bdc1db69daffa10fec5fd50bbe71 ******/
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
		Standard_Boolean InsertBefore(const opencascade::handle<TDataStd_TreeNode> & Node);

		/****** TDataStd_TreeNode::IsAscendant ******/
		/****** md5 signature: 5306d8f606b7847fe40777745e23a33c ******/
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
		Standard_Boolean IsAscendant(const opencascade::handle<TDataStd_TreeNode> & of);

		/****** TDataStd_TreeNode::IsChild ******/
		/****** md5 signature: 3ef4546e4ea31cb3867cbce63ca14fb0 ******/
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
		Standard_Boolean IsChild(const opencascade::handle<TDataStd_TreeNode> & of);

		/****** TDataStd_TreeNode::IsDescendant ******/
		/****** md5 signature: eb70d101aa1ff17850afc10c0c9b6502 ******/
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
		Standard_Boolean IsDescendant(const opencascade::handle<TDataStd_TreeNode> & of);

		/****** TDataStd_TreeNode::IsFather ******/
		/****** md5 signature: 86fa942e11bef925735b63310b466f57 ******/
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
		Standard_Boolean IsFather(const opencascade::handle<TDataStd_TreeNode> & of);

		/****** TDataStd_TreeNode::IsRoot ******/
		/****** md5 signature: 9d981f423106a71cbae38fc5c56749f7 ******/
		%feature("compactdefaultargs") IsRoot;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if this tree node attribute is the ultimate father in the tree.
") IsRoot;
		Standard_Boolean IsRoot();

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
		/****** md5 signature: 387795ed5ec2927a2e92aa54672b9814 ******/
		%feature("compactdefaultargs") NbChildren;
		%feature("autodoc", "
Parameters
----------
allLevels: bool (optional, default to Standard_False)

Return
-------
int

Description
-----------
Returns the number of child nodes. If <allLevels> is true, the method counts children of all levels (children of children ...).
") NbChildren;
		Standard_Integer NbChildren(const Standard_Boolean allLevels = Standard_False);

		/****** TDataStd_TreeNode::NewEmpty ******/
		/****** md5 signature: 8be17a4d2a4deeee198571712e76805e ******/
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "Return
-------
opencascade::handle<TDF_Attribute>

Description
-----------
No available documentation.
") NewEmpty;
		virtual opencascade::handle<TDF_Attribute> NewEmpty();

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
		/****** md5 signature: 05e5f8f16a08ca8388ac65d3be603584 ******/
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
		virtual void Paste(const opencascade::handle<TDF_Attribute> & into, const opencascade::handle<TDF_RelocationTable> & RT);

		/****** TDataStd_TreeNode::Prepend ******/
		/****** md5 signature: fa9c7c44fd6439efa9396d3387dc28c8 ******/
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
		Standard_Boolean Prepend(const opencascade::handle<TDataStd_TreeNode> & Child);

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
		/****** md5 signature: 3f614360a69c957f8600d26b49bc71b2 ******/
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
		virtual void References(const opencascade::handle<TDF_DataSet> & aDataSet);

		/****** TDataStd_TreeNode::Remove ******/
		/****** md5 signature: 7681d1947992ee3b792c09ff6d3b1bb7 ******/
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Removes this tree node attribute from its father node. The result is that this attribute becomes a root node.
") Remove;
		Standard_Boolean Remove();

		/****** TDataStd_TreeNode::Restore ******/
		/****** md5 signature: 317305acc3f3ea9c2fd983a7ed00e566 ******/
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
		virtual void Restore(const opencascade::handle<TDF_Attribute> & with);

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
		/****** md5 signature: 3398f1042b24f9ae49f7e8da6125f793 ******/
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
		virtual Standard_OStream & Dump(std::ostream &OutValue);


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
		/****** md5 signature: 4697ce8a095fa6dcef0217708d19718f ******/
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
		/****** md5 signature: c6d13c9ecc64c6c803b6e119e8216934 ******/
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
		/****** md5 signature: a6ff306a759c68a191c0262635db980f ******/
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
		/****** md5 signature: f171ce811dbfb205236d26e3cbf15450 ******/
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
		virtual void References(const opencascade::handle<TDF_DataSet> & DS);

		/****** TDataStd_UAttribute::Restore ******/
		/****** md5 signature: ddeae219d389a1d89eecb3e23c73522a ******/
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
		/****** md5 signature: 6c38da9a5036a37e6ab684f767db21f9 ******/
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
		/****** md5 signature: 3dfd8bde0d2494674df91f176168b997 ******/
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
		void Constant(const Standard_Boolean status);

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
		/****** md5 signature: 3398f1042b24f9ae49f7e8da6125f793 ******/
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
		virtual Standard_OStream & Dump(std::ostream &OutValue);


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
		/****** md5 signature: fc841fb28cb01367762b1d75c09d001e ******/
		%feature("compactdefaultargs") Get;
		%feature("autodoc", "Return
-------
float

Description
-----------
returns value stored in associated Real attribute.
") Get;
		Standard_Real Get();

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
		/****** md5 signature: 4697ce8a095fa6dcef0217708d19718f ******/
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
		/****** md5 signature: 10514134a7a4186d1c438c2b296fef32 ******/
		%feature("compactdefaultargs") IsAssigned;
		%feature("autodoc", "Return
-------
bool

Description
-----------
returns True if an Expression attribute is associated. create(if doesn't exist), set and returns the assigned expression attribute.
") IsAssigned;
		Standard_Boolean IsAssigned();

		/****** TDataStd_Variable::IsCaptured ******/
		/****** md5 signature: 12ea7252bed17339127c3c98a18cb3cc ******/
		%feature("compactdefaultargs") IsCaptured;
		%feature("autodoc", "Return
-------
bool

Description
-----------
shortcut for <Real()->IsCaptured()>.
") IsCaptured;
		Standard_Boolean IsCaptured();

		/****** TDataStd_Variable::IsConstant ******/
		/****** md5 signature: d04428c0cc470abb832fd48242d18c6c ******/
		%feature("compactdefaultargs") IsConstant;
		%feature("autodoc", "Return
-------
bool

Description
-----------
A constant value is not modified by regeneration.
") IsConstant;
		Standard_Boolean IsConstant();

		/****** TDataStd_Variable::IsValued ******/
		/****** md5 signature: cf4a7019aabbc1fa14b3947b82adad57 ******/
		%feature("compactdefaultargs") IsValued;
		%feature("autodoc", "Return
-------
bool

Description
-----------
returns True if a Real attribute is associated.
") IsValued;
		Standard_Boolean IsValued();

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
		/****** md5 signature: c6d13c9ecc64c6c803b6e119e8216934 ******/
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
		/****** md5 signature: a6ff306a759c68a191c0262635db980f ******/
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
		/****** md5 signature: f171ce811dbfb205236d26e3cbf15450 ******/
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
		virtual void References(const opencascade::handle<TDF_DataSet> & DS);

		/****** TDataStd_Variable::Restore ******/
		/****** md5 signature: ddeae219d389a1d89eecb3e23c73522a ******/
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
		/****** md5 signature: 7072a6e28045c037cf2a8d5eac15314a ******/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "
Parameters
----------
value: float

Return
-------
None

Description
-----------
retrieve or create the associated real attribute and set the value <value>.
") Set;
		void Set(const Standard_Real value);

		/****** TDataStd_Variable::Set ******/
		/****** md5 signature: 64a2cd368fbb2c0315bcac0b802a9cdb ******/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "
Parameters
----------
value: float
dimension: TDataStd_RealEnum

Return
-------
None

Description
-----------
Obsolete method that will be removed in next versions. The dimension argument is not supported in the persistence mechanism.
") Set;
		void Set(const Standard_Real value, const TDataStd_RealEnum dimension);

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
to read/write fields ===================.
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
		/****** md5 signature: 3398f1042b24f9ae49f7e8da6125f793 ******/
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
		virtual Standard_OStream & Dump(std::ostream &OutValue);

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
		/****** md5 signature: b14507b5f83a7ddf2dd74b6112f65c39 ******/
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
		/****** md5 signature: 7a929ce753effeac220c978ae7330330 ******/
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
		/****** md5 signature: 244d113ae14add83954353ca15ede66b ******/
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
		/****** md5 signature: 3398f1042b24f9ae49f7e8da6125f793 ******/
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
		virtual Standard_OStream & Dump(std::ostream &OutValue);

		/****** TDataStd_Directory::Find ******/
		/****** md5 signature: c975c2b1384d4b33c2a54d78edf27d11 ******/
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
		static Standard_Boolean Find(const TDF_Label & current, opencascade::handle<TDataStd_Directory> & D);

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
		/****** md5 signature: 4697ce8a095fa6dcef0217708d19718f ******/
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
		/****** md5 signature: 3398f1042b24f9ae49f7e8da6125f793 ******/
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
		virtual Standard_OStream & Dump(std::ostream &OutValue);

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
Creates (if does not exist) and sets the name in the name attribute. from any label <L> search in father labels (L is not concerned) the first name attribute.if found set it in <father>. class methods working on the name tree ====================================== Search in the whole TDF_Data the Name attribute which fit with <fullPath>. Returns True if found. Search under <currentLabel> a label which fit with <name>. Returns True if found. Shortcut which avoids building a ListOfExtendedStrin. Search in the whole TDF_Data the label which fit with name Returns True if found. tools methods to translate path <-> pathlist =========================================== move to draw For Draw test we may provide this tool method which convert a path in a sequence of string to call after the FindLabel methods. Example: if it's given 'Assembly:Part_1:Sketch_5' it will return in <pathlist> the list of 3 strings: 'Assembly','Part_1','Sketch_5'. move to draw from <pathlist> build the string path Name methods ============.
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
		/****** md5 signature: b14507b5f83a7ddf2dd74b6112f65c39 ******/
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
		/****** md5 signature: 7a929ce753effeac220c978ae7330330 ******/
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
		/****** md5 signature: 244d113ae14add83954353ca15ede66b ******/
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
		/****** md5 signature: e638d87bb80f7e7b3ab388375de60bc6 ******/
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "
Parameters
----------
value: float
isExported: bool (optional, default to Standard_False)

Return
-------
opencascade::handle<TDataStd_Real>

Description
-----------
Tool to Create an Integer attribute from <value>, Insert it in a new son label of <self>. The Real attribute is returned.
") Append;
		opencascade::handle<TDataStd_Real> Append(const Standard_Real value, const Standard_Boolean isExported = Standard_False);

		/****** TDataStd_NoteBook::Append ******/
		/****** md5 signature: 79495fe00184d4d6b78a635aa06c941d ******/
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "
Parameters
----------
value: int
isExported: bool (optional, default to Standard_False)

Return
-------
opencascade::handle<TDataStd_Integer>

Description
-----------
Tool to Create an Real attribute from <value>, Insert it in a new son label of <self>. The Integer attribute is returned.
") Append;
		opencascade::handle<TDataStd_Integer> Append(const Standard_Integer value, const Standard_Boolean isExported = Standard_False);

		/****** TDataStd_NoteBook::Dump ******/
		/****** md5 signature: 3398f1042b24f9ae49f7e8da6125f793 ******/
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
		virtual Standard_OStream & Dump(std::ostream &OutValue);

		/****** TDataStd_NoteBook::Find ******/
		/****** md5 signature: 400d5175f4317bb9f7f5240746dcd5c9 ******/
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
		static Standard_Boolean Find(const TDF_Label & current, opencascade::handle<TDataStd_NoteBook> & N);

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
		/****** md5 signature: 4697ce8a095fa6dcef0217708d19718f ******/
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
		/****** md5 signature: 3398f1042b24f9ae49f7e8da6125f793 ******/
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
		virtual Standard_OStream & Dump(std::ostream &OutValue);


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
		/****** md5 signature: 4697ce8a095fa6dcef0217708d19718f ******/
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
		/****** md5 signature: 3398f1042b24f9ae49f7e8da6125f793 ******/
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
		virtual Standard_OStream & Dump(std::ostream &OutValue);

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
		/****** md5 signature: 4697ce8a095fa6dcef0217708d19718f ******/
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

class TDataStd_HLabelArray1 : public TDataStd_LabelArray1, public Standard_Transient {
  public:
    TDataStd_HLabelArray1(const Standard_Integer theLower, const Standard_Integer theUpper);
    TDataStd_HLabelArray1(const Standard_Integer theLower, const Standard_Integer theUpper, const TDataStd_LabelArray1::value_type& theValue);
    TDataStd_HLabelArray1(const TDataStd_LabelArray1& theOther);
    const TDataStd_LabelArray1& Array1();
    TDataStd_LabelArray1& ChangeArray1();
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
