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

/* python proy classes for enums */
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
		/**** md5 signature: 97de0b35f4f6abc04a631c65d32bacc4 ****/
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
		/**** md5 signature: b19c5694ec2985d51a2182fae37071f2 ****/
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
		/**** md5 signature: 94caccb04996b56934ce7de2990ed44f ****/
		%feature("compactdefaultargs") Get;
		%feature("autodoc", "No available documentation.

Returns
-------
TCollection_AsciiString
") Get;
		const TCollection_AsciiString & Get();

		/****************** GetID ******************/
		/**** md5 signature: afe6002d90f641ca3ea8c9ae9f8fe97c ****/
		%feature("compactdefaultargs") GetID;
		%feature("autodoc", "Class methods ============= returns the guid of the attribute.

Returns
-------
Standard_GUID
") GetID;
		static const Standard_GUID & GetID();

		/****************** ID ******************/
		/**** md5 signature: 4697ce8a095fa6dcef0217708d19718f ****/
		%feature("compactdefaultargs") ID;
		%feature("autodoc", "No available documentation.

Returns
-------
Standard_GUID
") ID;
		const Standard_GUID & ID();

		/****************** IsEmpty ******************/
		/**** md5 signature: 6ab5e1ad63f93168856ab126dd374b81 ****/
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsEmpty;
		Standard_Boolean IsEmpty();

		/****************** NewEmpty ******************/
		/**** md5 signature: c6d13c9ecc64c6c803b6e119e8216934 ****/
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TDF_Attribute>
") NewEmpty;
		opencascade::handle<TDF_Attribute> NewEmpty();

		/****************** Paste ******************/
		/**** md5 signature: a6ff306a759c68a191c0262635db980f ****/
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
		/**** md5 signature: ddeae219d389a1d89eecb3e23c73522a ****/
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
		/**** md5 signature: b2e84438f8ca86c70cba4bebb4881db6 ****/
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
		/**** md5 signature: 8e0373c564c384eab06dd600329d309e ****/
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
		/**** md5 signature: 42b969f7de2537345586a3005c1ea20a ****/
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
		/**** md5 signature: 7a929ce753effeac220c978ae7330330 ****/
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
		/**** md5 signature: 244d113ae14add83954353ca15ede66b ****/
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
		/**** md5 signature: 0b32f7d0a04ce20135713469b7833f5b ****/
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
		/**** md5 signature: afe6002d90f641ca3ea8c9ae9f8fe97c ****/
		%feature("compactdefaultargs") GetID;
		%feature("autodoc", "Static methods ============== returns an id for array.

Returns
-------
Standard_GUID
") GetID;
		static const Standard_GUID & GetID();

		/****************** ID ******************/
		/**** md5 signature: 4697ce8a095fa6dcef0217708d19718f ****/
		%feature("compactdefaultargs") ID;
		%feature("autodoc", "No available documentation.

Returns
-------
Standard_GUID
") ID;
		const Standard_GUID & ID();

		/****************** Init ******************/
		/**** md5 signature: 7821d9c43d1b72a2a51576c8503c10d4 ****/
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
		/**** md5 signature: 61a39b353105b740896ae484cb34e848 ****/
		%feature("compactdefaultargs") InternalArray;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TColStd_HArray1OfByte>
") InternalArray;
		const opencascade::handle<TColStd_HArray1OfByte> & InternalArray();

		/****************** Length ******************/
		/**** md5 signature: 58bd40380acccb2733bfbd37bf3cbb11 ****/
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "Returns the number of elements in the array.

Returns
-------
int
") Length;
		Standard_Integer Length();

		/****************** Lower ******************/
		/**** md5 signature: fe1655437e349162aeffc9b3814347af ****/
		%feature("compactdefaultargs") Lower;
		%feature("autodoc", "Returns the lower boundary of the array.

Returns
-------
int
") Lower;
		Standard_Integer Lower();

		/****************** NewEmpty ******************/
		/**** md5 signature: c6d13c9ecc64c6c803b6e119e8216934 ****/
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TDF_Attribute>
") NewEmpty;
		opencascade::handle<TDF_Attribute> NewEmpty();

		/****************** Paste ******************/
		/**** md5 signature: a6ff306a759c68a191c0262635db980f ****/
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
		/**** md5 signature: ddeae219d389a1d89eecb3e23c73522a ****/
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
		/**** md5 signature: 3d0966f83c918bab665b182f6f3772af ****/
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
		/**** md5 signature: 08a5308f0fac1f619bcf995915c3963f ****/
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
		/**** md5 signature: 9bed89522d0b510ace46b6aebec92ee0 ****/
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
		/**** md5 signature: 244d113ae14add83954353ca15ede66b ****/
		%feature("compactdefaultargs") SetID;
		%feature("autodoc", "Sets default guid for the attribute.

Returns
-------
None
") SetID;
		void SetID();

		/****************** SetInternalArray ******************/
		/**** md5 signature: af07cdaee81199f417a2cec4b4522441 ****/
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
		/**** md5 signature: 605aad63026d3d412637dcaebee62f2e ****/
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
		/**** md5 signature: 8f614b31058bb30bdf81ecd0e2d444dc ****/
		%feature("compactdefaultargs") Upper;
		%feature("autodoc", "Returns the upper boundary of the array.

Returns
-------
int
") Upper;
		Standard_Integer Upper();

		/****************** Value ******************/
		/**** md5 signature: 40dedbbf4e5af7f5ac65490d1e98c0c8 ****/
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
		/**** md5 signature: d0238f239d1b7bcaae79bd0503a12a8c ****/
		%feature("compactdefaultargs") TDataStd_BooleanList;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") TDataStd_BooleanList;
		 TDataStd_BooleanList();

		/****************** Append ******************/
		/**** md5 signature: 83ceeaaba0bf39e19a46a2ebf946e6d5 ****/
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
		/**** md5 signature: ae54be580b423a6eadbe062e0bdb44c2 ****/
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
		/**** md5 signature: 8da0d7e03de513b08d57e17232ac7391 ****/
		%feature("compactdefaultargs") Extent;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") Extent;
		Standard_Integer Extent();

		/****************** First ******************/
		/**** md5 signature: 65da73e94c21352acce8ef43e35ce0bd ****/
		%feature("compactdefaultargs") First;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") First;
		Standard_Boolean First();

		/****************** GetID ******************/
		/**** md5 signature: afe6002d90f641ca3ea8c9ae9f8fe97c ****/
		%feature("compactdefaultargs") GetID;
		%feature("autodoc", "Static methods ============== returns the id of the list of booleans attribute.

Returns
-------
Standard_GUID
") GetID;
		static const Standard_GUID & GetID();

		/****************** ID ******************/
		/**** md5 signature: 4697ce8a095fa6dcef0217708d19718f ****/
		%feature("compactdefaultargs") ID;
		%feature("autodoc", "No available documentation.

Returns
-------
Standard_GUID
") ID;
		const Standard_GUID & ID();

		/****************** InsertAfter ******************/
		/**** md5 signature: 23751c9003f707933931dd2222fa1474 ****/
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
		/**** md5 signature: bba1fc07c146a59994586980b2f68a56 ****/
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
		/**** md5 signature: 6ab5e1ad63f93168856ab126dd374b81 ****/
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsEmpty;
		Standard_Boolean IsEmpty();

		/****************** Last ******************/
		/**** md5 signature: 89e81e8e3fe45fc4c83ee1f19bb07686 ****/
		%feature("compactdefaultargs") Last;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") Last;
		Standard_Boolean Last();

		/****************** List ******************/
		/**** md5 signature: 1e1c7319a6ab5a44a30c67114ec285e8 ****/
		%feature("compactdefaultargs") List;
		%feature("autodoc", "1 - means true, 0 - means false.

Returns
-------
TDataStd_ListOfByte
") List;
		const TDataStd_ListOfByte & List();

		/****************** NewEmpty ******************/
		/**** md5 signature: c6d13c9ecc64c6c803b6e119e8216934 ****/
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TDF_Attribute>
") NewEmpty;
		opencascade::handle<TDF_Attribute> NewEmpty();

		/****************** Paste ******************/
		/**** md5 signature: a6ff306a759c68a191c0262635db980f ****/
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
		/**** md5 signature: e786583abf4210ef9996431ab3fd12d9 ****/
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
		/**** md5 signature: d5758943c335a06d32f07ab2389e0fe6 ****/
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
		/**** md5 signature: ddeae219d389a1d89eecb3e23c73522a ****/
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
		/**** md5 signature: d080f3069cde31d54542fa06fc2e27b3 ****/
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
		/**** md5 signature: 7b1b0d48c0569068c398f407ed046375 ****/
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
		/**** md5 signature: 9bed89522d0b510ace46b6aebec92ee0 ****/
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
		/**** md5 signature: 244d113ae14add83954353ca15ede66b ****/
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
		/**** md5 signature: 312202423f8cbebabac8f711c331908a ****/
		%feature("compactdefaultargs") TDataStd_ByteArray;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") TDataStd_ByteArray;
		 TDataStd_ByteArray();

		/****************** ChangeArray ******************/
		/**** md5 signature: ad4bd7d1235654a95c892998f600cc5c ****/
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
		/**** md5 signature: 9a96ec815d43dd1838c022740c5327d0 ****/
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
		/**** md5 signature: 570a92cb77e1626ccd16d9bb8bc3044c ****/
		%feature("compactdefaultargs") GetDelta;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") GetDelta;
		Standard_Boolean GetDelta();

		/****************** GetID ******************/
		/**** md5 signature: afe6002d90f641ca3ea8c9ae9f8fe97c ****/
		%feature("compactdefaultargs") GetID;
		%feature("autodoc", "Static methods ============== returns an id for array.

Returns
-------
Standard_GUID
") GetID;
		static const Standard_GUID & GetID();

		/****************** ID ******************/
		/**** md5 signature: 4697ce8a095fa6dcef0217708d19718f ****/
		%feature("compactdefaultargs") ID;
		%feature("autodoc", "No available documentation.

Returns
-------
Standard_GUID
") ID;
		const Standard_GUID & ID();

		/****************** Init ******************/
		/**** md5 signature: 7821d9c43d1b72a2a51576c8503c10d4 ****/
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
		/**** md5 signature: eca14aaa6184d37684110db37ee46538 ****/
		%feature("compactdefaultargs") InternalArray;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TColStd_HArray1OfByte>
") InternalArray;
		const opencascade::handle<TColStd_HArray1OfByte> & InternalArray();

		/****************** Length ******************/
		/**** md5 signature: 58bd40380acccb2733bfbd37bf3cbb11 ****/
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "Returns the number of elements in the array.

Returns
-------
int
") Length;
		Standard_Integer Length();

		/****************** Lower ******************/
		/**** md5 signature: fe1655437e349162aeffc9b3814347af ****/
		%feature("compactdefaultargs") Lower;
		%feature("autodoc", "Returns the lower boundary of the array.

Returns
-------
int
") Lower;
		Standard_Integer Lower();

		/****************** NewEmpty ******************/
		/**** md5 signature: c6d13c9ecc64c6c803b6e119e8216934 ****/
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TDF_Attribute>
") NewEmpty;
		opencascade::handle<TDF_Attribute> NewEmpty();

		/****************** Paste ******************/
		/**** md5 signature: a6ff306a759c68a191c0262635db980f ****/
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
		/**** md5 signature: ddeae219d389a1d89eecb3e23c73522a ****/
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
		/**** md5 signature: aaf065a24a5e11f591e7643080ae324c ****/
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
		/**** md5 signature: 5b357c7318d0b6b02a9847ad7ac424cd ****/
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
		/**** md5 signature: 66bc6f747d37a3ea7110a95b02e13c41 ****/
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
		/**** md5 signature: 9bed89522d0b510ace46b6aebec92ee0 ****/
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
		/**** md5 signature: 244d113ae14add83954353ca15ede66b ****/
		%feature("compactdefaultargs") SetID;
		%feature("autodoc", "Sets default guid for the attribute.

Returns
-------
None
") SetID;
		void SetID();

		/****************** SetValue ******************/
		/**** md5 signature: 5eb44f5b1fbbef87d0fc79c872ef9d03 ****/
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
		/**** md5 signature: 8f614b31058bb30bdf81ecd0e2d444dc ****/
		%feature("compactdefaultargs") Upper;
		%feature("autodoc", "Returns the upper boundary of the array.

Returns
-------
int
") Upper;
		Standard_Integer Upper();

		/****************** Value ******************/
		/**** md5 signature: 7d1812c0462c6fd10daef7299dca8cb4 ****/
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
		/**** md5 signature: e24e9f860884bd7756dfeb3da3a53cf1 ****/
		%feature("compactdefaultargs") TDataStd_ChildNodeIterator;
		%feature("autodoc", "Creates an empty iterator.

Returns
-------
None
") TDataStd_ChildNodeIterator;
		 TDataStd_ChildNodeIterator();

		/****************** TDataStd_ChildNodeIterator ******************/
		/**** md5 signature: eebf253baf1c60e556b24ea32091843d ****/
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
		/**** md5 signature: 3c8a27d654697d6383aae622e6ef2566 ****/
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
		/**** md5 signature: cff271d3b32940da94bada40648f9096 ****/
		%feature("compactdefaultargs") More;
		%feature("autodoc", "Returns true if there is a current item in the iteration.

Returns
-------
bool
") More;
		Standard_Boolean More();

		/****************** Next ******************/
		/**** md5 signature: f35c0df5f1d7c877986db18081404532 ****/
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "Move to the next item.

Returns
-------
None
") Next;
		void Next();

		/****************** NextBrother ******************/
		/**** md5 signature: 5986fa6a611b7b5fcfac587700960b73 ****/
		%feature("compactdefaultargs") NextBrother;
		%feature("autodoc", "Move to the next brother. if there is none, go up etc. this method is interesting only with 'alllevels' behavior, because it avoids to explore the current step childstepren.

Returns
-------
None
") NextBrother;
		void NextBrother();

		/****************** Value ******************/
		/**** md5 signature: fd1d39f23af9d5b18ee9477ee459afe3 ****/
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
		/**** md5 signature: 2f2c3741ccbac7a5d1ce3d382dc2c16b ****/
		%feature("compactdefaultargs") TDataStd_Comment;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") TDataStd_Comment;
		 TDataStd_Comment();

		/****************** AfterRetrieval ******************/
		/**** md5 signature: 64d86db498a6796b75d057eb0b1ce0d7 ****/
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
		/**** md5 signature: e1828ec7ac26ddd7d323df220dcd7fed ****/
		%feature("compactdefaultargs") Get;
		%feature("autodoc", "Returns the comment attribute.

Returns
-------
TCollection_ExtendedString
") Get;
		const TCollection_ExtendedString & Get();

		/****************** GetID ******************/
		/**** md5 signature: afe6002d90f641ca3ea8c9ae9f8fe97c ****/
		%feature("compactdefaultargs") GetID;
		%feature("autodoc", "Class methods ============= returns the guid for comments.

Returns
-------
Standard_GUID
") GetID;
		static const Standard_GUID & GetID();

		/****************** ID ******************/
		/**** md5 signature: 4697ce8a095fa6dcef0217708d19718f ****/
		%feature("compactdefaultargs") ID;
		%feature("autodoc", "No available documentation.

Returns
-------
Standard_GUID
") ID;
		const Standard_GUID & ID();

		/****************** NewEmpty ******************/
		/**** md5 signature: c6d13c9ecc64c6c803b6e119e8216934 ****/
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TDF_Attribute>
") NewEmpty;
		opencascade::handle<TDF_Attribute> NewEmpty();

		/****************** Paste ******************/
		/**** md5 signature: a6ff306a759c68a191c0262635db980f ****/
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
		/**** md5 signature: ddeae219d389a1d89eecb3e23c73522a ****/
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
		/**** md5 signature: 7aff9273210ae7933d1765a52bf89a49 ****/
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
		/**** md5 signature: 503a74ff2909b31d3824ac4b11ac2e74 ****/
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
		/**** md5 signature: b056e38e35285870dba625ce2752fb25 ****/
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
		/**** md5 signature: a578a0c756fb9b24dc8123cef48bcd7e ****/
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
		/**** md5 signature: d34c5545c54e0e96d2b5128d71a2e61c ****/
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
		/**** md5 signature: afe6002d90f641ca3ea8c9ae9f8fe97c ****/
		%feature("compactdefaultargs") GetID;
		%feature("autodoc", "Class methods =============.

Returns
-------
Standard_GUID
") GetID;
		static const Standard_GUID & GetID();

		/****************** GetLabel ******************/
		/**** md5 signature: b7ae9617d4db4ef8a9995ea610f01207 ****/
		%feature("compactdefaultargs") GetLabel;
		%feature("autodoc", "No available documentation.

Returns
-------
TDF_Label
") GetLabel;
		TDF_Label GetLabel();

		/****************** Has ******************/
		/**** md5 signature: 50ae6e2d0e5e7cf8d8a39bf93358e95e ****/
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
		/**** md5 signature: 4697ce8a095fa6dcef0217708d19718f ****/
		%feature("compactdefaultargs") ID;
		%feature("autodoc", "No available documentation.

Returns
-------
Standard_GUID
") ID;
		const Standard_GUID & ID();

		/****************** NewEmpty ******************/
		/**** md5 signature: c6d13c9ecc64c6c803b6e119e8216934 ****/
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TDF_Attribute>
") NewEmpty;
		opencascade::handle<TDF_Attribute> NewEmpty();

		/****************** Paste ******************/
		/**** md5 signature: a6ff306a759c68a191c0262635db980f ****/
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
		/**** md5 signature: ddeae219d389a1d89eecb3e23c73522a ****/
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
		/**** md5 signature: c2e44d4fdec9fa8ba87c71cb8e4eb45c ****/
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
		/**** md5 signature: 205c3acad49e703edb1fd5d07a53b864 ****/
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
		/**** md5 signature: 528c157ef8098f8c29d6c7dca27ebda7 ****/
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
		/**** md5 signature: ddf5e396da23832dcae51d48e78a347f ****/
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
		/**** md5 signature: 2d3f13a7b13375945170c948d07e85c3 ****/
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
		/**** md5 signature: ddf5e396da23832dcae51d48e78a347f ****/
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
		/**** md5 signature: 11d477566085ea45cc0e45d9fb9bd111 ****/
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
		/**** md5 signature: ddf5e396da23832dcae51d48e78a347f ****/
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
		/**** md5 signature: c2522035fee7e2418446871fd2b0939f ****/
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
		/**** md5 signature: ddf5e396da23832dcae51d48e78a347f ****/
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
		/**** md5 signature: 5828e30462ebc925f56d0fa2310fd76b ****/
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
		/**** md5 signature: ddf5e396da23832dcae51d48e78a347f ****/
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
		/**** md5 signature: d3b9d572e9a0f0079e175d56a6a09a8a ****/
		%feature("compactdefaultargs") TDataStd_Directory;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") TDataStd_Directory;
		 TDataStd_Directory();

		/****************** AddDirectory ******************/
		/**** md5 signature: 5c4f99d9e3566f6f2c2df77d03517116 ****/
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
		/**** md5 signature: c975c2b1384d4b33c2a54d78edf27d11 ****/
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
		/**** md5 signature: afe6002d90f641ca3ea8c9ae9f8fe97c ****/
		%feature("compactdefaultargs") GetID;
		%feature("autodoc", "Directory methods ===============.

Returns
-------
Standard_GUID
") GetID;
		static const Standard_GUID & GetID();

		/****************** ID ******************/
		/**** md5 signature: 4697ce8a095fa6dcef0217708d19718f ****/
		%feature("compactdefaultargs") ID;
		%feature("autodoc", "No available documentation.

Returns
-------
Standard_GUID
") ID;
		const Standard_GUID & ID();

		/****************** MakeObjectLabel ******************/
		/**** md5 signature: db423c43f233e6e25e616ab0b00559be ****/
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
		/**** md5 signature: 5df5803fde1fbb05cfc38fb2ecf2de6c ****/
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
		/**** md5 signature: c6d13c9ecc64c6c803b6e119e8216934 ****/
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TDF_Attribute>
") NewEmpty;
		opencascade::handle<TDF_Attribute> NewEmpty();

		/****************** Paste ******************/
		/**** md5 signature: a6ff306a759c68a191c0262635db980f ****/
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
		/**** md5 signature: f171ce811dbfb205236d26e3cbf15450 ****/
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
		/**** md5 signature: ddeae219d389a1d89eecb3e23c73522a ****/
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
		/**** md5 signature: 939eb7d0a029c8982cdcdfdef991f0bc ****/
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
		/**** md5 signature: fdf0cd52b1c54e1dcbcfca5ccc5ef545 ****/
		%feature("compactdefaultargs") GetExpression;
		%feature("autodoc", "No available documentation.

Returns
-------
TCollection_ExtendedString
") GetExpression;
		const TCollection_ExtendedString & GetExpression();

		/****************** GetID ******************/
		/**** md5 signature: afe6002d90f641ca3ea8c9ae9f8fe97c ****/
		%feature("compactdefaultargs") GetID;
		%feature("autodoc", "Class methods =============.

Returns
-------
Standard_GUID
") GetID;
		static const Standard_GUID & GetID();

		/****************** GetVariables ******************/
		/**** md5 signature: b15a6b025b25c61503dc4b4deba5bd8b ****/
		%feature("compactdefaultargs") GetVariables;
		%feature("autodoc", "No available documentation.

Returns
-------
TDF_AttributeList
") GetVariables;
		TDF_AttributeList & GetVariables();

		/****************** ID ******************/
		/**** md5 signature: 4697ce8a095fa6dcef0217708d19718f ****/
		%feature("compactdefaultargs") ID;
		%feature("autodoc", "No available documentation.

Returns
-------
Standard_GUID
") ID;
		const Standard_GUID & ID();

		/****************** Name ******************/
		/**** md5 signature: a9e55299a1405b3a2863469f1a67f9cd ****/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "Build and return the expression name.

Returns
-------
TCollection_ExtendedString
") Name;
		TCollection_ExtendedString Name();

		/****************** NewEmpty ******************/
		/**** md5 signature: c6d13c9ecc64c6c803b6e119e8216934 ****/
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TDF_Attribute>
") NewEmpty;
		opencascade::handle<TDF_Attribute> NewEmpty();

		/****************** Paste ******************/
		/**** md5 signature: a6ff306a759c68a191c0262635db980f ****/
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
		/**** md5 signature: ddeae219d389a1d89eecb3e23c73522a ****/
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
		/**** md5 signature: e53eb091d541b581beabbed924a69572 ****/
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
		/**** md5 signature: 8d6173b1816680fcec94f1d55a3ab1c0 ****/
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
		/**** md5 signature: 2e933b03a799e9e1cecedbcf1c15d8e4 ****/
		%feature("compactdefaultargs") TDataStd_ExtStringArray;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") TDataStd_ExtStringArray;
		 TDataStd_ExtStringArray();

		/****************** Array ******************/
		/**** md5 signature: bf3a2e32e96eae9bf18b8add11f03226 ****/
		%feature("compactdefaultargs") Array;
		%feature("autodoc", "Return the inner array of the extstringarray attribute.

Returns
-------
opencascade::handle<TColStd_HArray1OfExtendedString>
") Array;
		const opencascade::handle<TColStd_HArray1OfExtendedString> & Array();

		/****************** ChangeArray ******************/
		/**** md5 signature: 76cf449b0c78430434ee11ebf388de0d ****/
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
		/**** md5 signature: 9a96ec815d43dd1838c022740c5327d0 ****/
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
		/**** md5 signature: 570a92cb77e1626ccd16d9bb8bc3044c ****/
		%feature("compactdefaultargs") GetDelta;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") GetDelta;
		Standard_Boolean GetDelta();

		/****************** GetID ******************/
		/**** md5 signature: afe6002d90f641ca3ea8c9ae9f8fe97c ****/
		%feature("compactdefaultargs") GetID;
		%feature("autodoc", "Class methods ============= returns the guid for the attribute.

Returns
-------
Standard_GUID
") GetID;
		static const Standard_GUID & GetID();

		/****************** ID ******************/
		/**** md5 signature: 4697ce8a095fa6dcef0217708d19718f ****/
		%feature("compactdefaultargs") ID;
		%feature("autodoc", "No available documentation.

Returns
-------
Standard_GUID
") ID;
		const Standard_GUID & ID();

		/****************** Init ******************/
		/**** md5 signature: 7821d9c43d1b72a2a51576c8503c10d4 ****/
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
		/**** md5 signature: 58bd40380acccb2733bfbd37bf3cbb11 ****/
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "Return the number of elements of <self>.

Returns
-------
int
") Length;
		Standard_Integer Length();

		/****************** Lower ******************/
		/**** md5 signature: fe1655437e349162aeffc9b3814347af ****/
		%feature("compactdefaultargs") Lower;
		%feature("autodoc", "Return the lower bound.

Returns
-------
int
") Lower;
		Standard_Integer Lower();

		/****************** NewEmpty ******************/
		/**** md5 signature: c6d13c9ecc64c6c803b6e119e8216934 ****/
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TDF_Attribute>
") NewEmpty;
		opencascade::handle<TDF_Attribute> NewEmpty();

		/****************** Paste ******************/
		/**** md5 signature: a6ff306a759c68a191c0262635db980f ****/
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
		/**** md5 signature: ddeae219d389a1d89eecb3e23c73522a ****/
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
		/**** md5 signature: c93882fb1070a4851bcdca0675d4d592 ****/
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
		/**** md5 signature: 00e8d7f58163e822658b96ca6e5ae424 ****/
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
		/**** md5 signature: 66bc6f747d37a3ea7110a95b02e13c41 ****/
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
		/**** md5 signature: 9bed89522d0b510ace46b6aebec92ee0 ****/
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
		/**** md5 signature: 244d113ae14add83954353ca15ede66b ****/
		%feature("compactdefaultargs") SetID;
		%feature("autodoc", "Sets default guid for the attribute.

Returns
-------
None
") SetID;
		void SetID();

		/****************** SetValue ******************/
		/**** md5 signature: c9625cdae892191532dd40ae6ff11a40 ****/
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
		/**** md5 signature: 8f614b31058bb30bdf81ecd0e2d444dc ****/
		%feature("compactdefaultargs") Upper;
		%feature("autodoc", "Return the upper bound.

Returns
-------
int
") Upper;
		Standard_Integer Upper();

		/****************** Value ******************/
		/**** md5 signature: bbf07c80f5c2f47b499665f5becff5e8 ****/
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
		/**** md5 signature: 26fea186ced25401b227ef31dbc36a0b ****/
		%feature("compactdefaultargs") TDataStd_ExtStringList;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") TDataStd_ExtStringList;
		 TDataStd_ExtStringList();

		/****************** Append ******************/
		/**** md5 signature: 17033042cfaf021e49aafaf281a7b600 ****/
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
		/**** md5 signature: ae54be580b423a6eadbe062e0bdb44c2 ****/
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
		/**** md5 signature: 8da0d7e03de513b08d57e17232ac7391 ****/
		%feature("compactdefaultargs") Extent;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") Extent;
		Standard_Integer Extent();

		/****************** First ******************/
		/**** md5 signature: 3f1d3d89a785e40474e1a5651c9efbec ****/
		%feature("compactdefaultargs") First;
		%feature("autodoc", "No available documentation.

Returns
-------
TCollection_ExtendedString
") First;
		const TCollection_ExtendedString & First();

		/****************** GetID ******************/
		/**** md5 signature: afe6002d90f641ca3ea8c9ae9f8fe97c ****/
		%feature("compactdefaultargs") GetID;
		%feature("autodoc", "Static methods ============== returns the id of the list of strings attribute.

Returns
-------
Standard_GUID
") GetID;
		static const Standard_GUID & GetID();

		/****************** ID ******************/
		/**** md5 signature: 4697ce8a095fa6dcef0217708d19718f ****/
		%feature("compactdefaultargs") ID;
		%feature("autodoc", "No available documentation.

Returns
-------
Standard_GUID
") ID;
		const Standard_GUID & ID();

		/****************** InsertAfter ******************/
		/**** md5 signature: 333f01752b3375ef8e77a252e9fc3355 ****/
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
		/**** md5 signature: a82efc1671cdc0567d137b17efea7e0e ****/
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
		/**** md5 signature: e2b5c32e8c030b4febd798d8af9aea38 ****/
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
		/**** md5 signature: 39731173faa0cfeb50ebb04e09af3484 ****/
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
		/**** md5 signature: 6ab5e1ad63f93168856ab126dd374b81 ****/
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsEmpty;
		Standard_Boolean IsEmpty();

		/****************** Last ******************/
		/**** md5 signature: bbe7512cc0b24fd20ee696e0517ad9d2 ****/
		%feature("compactdefaultargs") Last;
		%feature("autodoc", "No available documentation.

Returns
-------
TCollection_ExtendedString
") Last;
		const TCollection_ExtendedString & Last();

		/****************** List ******************/
		/**** md5 signature: a8e6c196b6984ed8d1d16ed7bfc99469 ****/
		%feature("compactdefaultargs") List;
		%feature("autodoc", "No available documentation.

Returns
-------
TDataStd_ListOfExtendedString
") List;
		const TDataStd_ListOfExtendedString & List();

		/****************** NewEmpty ******************/
		/**** md5 signature: c6d13c9ecc64c6c803b6e119e8216934 ****/
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TDF_Attribute>
") NewEmpty;
		opencascade::handle<TDF_Attribute> NewEmpty();

		/****************** Paste ******************/
		/**** md5 signature: a6ff306a759c68a191c0262635db980f ****/
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
		/**** md5 signature: cf8ec1439a3483441dea24ed3f849802 ****/
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
		/**** md5 signature: 6fa22246d331e634e7be4fd0a9fc76ad ****/
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
		/**** md5 signature: d5758943c335a06d32f07ab2389e0fe6 ****/
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
		/**** md5 signature: ddeae219d389a1d89eecb3e23c73522a ****/
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
		/**** md5 signature: 4293bb8b79b6502b9e2fe5213c4ee024 ****/
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
		/**** md5 signature: 624a244ee7a119ff27a90322c6e7c40f ****/
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
		/**** md5 signature: 9bed89522d0b510ace46b6aebec92ee0 ****/
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
		/**** md5 signature: 244d113ae14add83954353ca15ede66b ****/
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
		/**** md5 signature: 679374981b21c2865fb1434f26aac636 ****/
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
		/**** md5 signature: b5aac5ec6ebdd85cc054269530f6c8cb ****/
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
		/**** md5 signature: 0a2b5fe4d976a761d358e557a38bad75 ****/
		%feature("compactdefaultargs") ChangeMap;
		%feature("autodoc", "No available documentation.

Returns
-------
TDataStd_DataMapOfStringByte
") ChangeMap;
		TDataStd_DataMapOfStringByte & ChangeMap();

		/****************** Map ******************/
		/**** md5 signature: 50b2e9663ae163f6aff6c0dc3dec2cee ****/
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
		/**** md5 signature: 6cd33f38fb037a0a9006af7162d982d5 ****/
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
		/**** md5 signature: 8259a5e5d4c6b79ac679be61e9013caf ****/
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
		/**** md5 signature: f5cd9b08633ff43d0ef43dacb1bfd1c5 ****/
		%feature("compactdefaultargs") ChangeMap;
		%feature("autodoc", "No available documentation.

Returns
-------
TDataStd_DataMapOfStringHArray1OfInteger
") ChangeMap;
		TDataStd_DataMapOfStringHArray1OfInteger & ChangeMap();

		/****************** Map ******************/
		/**** md5 signature: 87a3e5bf8695c07e283bff2c62607045 ****/
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
		/**** md5 signature: c4bcf0a4e0c461966986b975b008bc98 ****/
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
		/**** md5 signature: 2856f7fea212451f72049a738072e95e ****/
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
		/**** md5 signature: bc651b856da3271678cffdf0fac521fa ****/
		%feature("compactdefaultargs") ChangeMap;
		%feature("autodoc", "No available documentation.

Returns
-------
TDataStd_DataMapOfStringHArray1OfReal
") ChangeMap;
		TDataStd_DataMapOfStringHArray1OfReal & ChangeMap();

		/****************** Map ******************/
		/**** md5 signature: 8281a23b994cfab06b9c3e77e313f3a7 ****/
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
		/**** md5 signature: 742439804a93877a5047a7bff6bccd15 ****/
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
		/**** md5 signature: e6f0cd929496302121efaf1bd1e21eb6 ****/
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
		/**** md5 signature: 9895321eab61fe09331de83b60921fd4 ****/
		%feature("compactdefaultargs") ChangeMap;
		%feature("autodoc", "No available documentation.

Returns
-------
TColStd_DataMapOfStringInteger
") ChangeMap;
		TColStd_DataMapOfStringInteger & ChangeMap();

		/****************** Map ******************/
		/**** md5 signature: 241cf5fea80e6f4e708f154f8de9e1bc ****/
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
		/**** md5 signature: 7488e4768a703dfd339692c806f99f42 ****/
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
		/**** md5 signature: 121fa55f802bf43f35b6e87c217075e8 ****/
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
		/**** md5 signature: d4f36b31743e1eb9d128387ff8b29276 ****/
		%feature("compactdefaultargs") ChangeMap;
		%feature("autodoc", "No available documentation.

Returns
-------
TDataStd_DataMapOfStringReal
") ChangeMap;
		TDataStd_DataMapOfStringReal & ChangeMap();

		/****************** Map ******************/
		/**** md5 signature: 5bb7116fe67c0de1a48abcca2f3ce836 ****/
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
		/**** md5 signature: acabe9e4fb1d5a2bf9373c30ced8d28c ****/
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
		/**** md5 signature: 44161a1de573f46d1c664ada9cc76d23 ****/
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
		/**** md5 signature: 31bcb928e8ac89e75cc739cff3709adb ****/
		%feature("compactdefaultargs") ChangeMap;
		%feature("autodoc", "No available documentation.

Returns
-------
TDataStd_DataMapOfStringString
") ChangeMap;
		TDataStd_DataMapOfStringString & ChangeMap();

		/****************** Map ******************/
		/**** md5 signature: 5577d37c8d3b29feaa25de9a032320c3 ****/
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
		/**** md5 signature: 44e5a1a57bd959cbf2e00dda897be7a2 ****/
		%feature("compactdefaultargs") TDataStd_IntPackedMap;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") TDataStd_IntPackedMap;
		 TDataStd_IntPackedMap();

		/****************** Add ******************/
		/**** md5 signature: 36b1accfeee12d40d7635f94e1cf9007 ****/
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
		/**** md5 signature: b1ad5ff7f2aa646965f9ac9b8d9bc28c ****/
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
		/**** md5 signature: 455b9c7f25de770f70c647849552bc59 ****/
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
		/**** md5 signature: 5d9992bf01de8ff0ed07e5430de45499 ****/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") Clear;
		Standard_Boolean Clear();

		/****************** Contains ******************/
		/**** md5 signature: a02d6cb675cf509371ef561f301441dc ****/
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
		/**** md5 signature: 9a96ec815d43dd1838c022740c5327d0 ****/
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
		/**** md5 signature: 19453f219e568f9c5109a0fd06459e95 ****/
		%feature("compactdefaultargs") Extent;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") Extent;
		Standard_Integer Extent();

		/****************** GetDelta ******************/
		/**** md5 signature: 570a92cb77e1626ccd16d9bb8bc3044c ****/
		%feature("compactdefaultargs") GetDelta;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") GetDelta;
		Standard_Boolean GetDelta();

		/****************** GetHMap ******************/
		/**** md5 signature: b4f08d4f76579674f567faee1618fdb9 ****/
		%feature("compactdefaultargs") GetHMap;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TColStd_HPackedMapOfInteger>
") GetHMap;
		const opencascade::handle<TColStd_HPackedMapOfInteger> & GetHMap();

		/****************** GetID ******************/
		/**** md5 signature: afe6002d90f641ca3ea8c9ae9f8fe97c ****/
		%feature("compactdefaultargs") GetID;
		%feature("autodoc", "Class methods ============= returns the guid of the attribute.

Returns
-------
Standard_GUID
") GetID;
		static const Standard_GUID & GetID();

		/****************** GetMap ******************/
		/**** md5 signature: a9371f625855767a17c749d635a51f1e ****/
		%feature("compactdefaultargs") GetMap;
		%feature("autodoc", "No available documentation.

Returns
-------
TColStd_PackedMapOfInteger
") GetMap;
		const TColStd_PackedMapOfInteger & GetMap();

		/****************** ID ******************/
		/**** md5 signature: 4697ce8a095fa6dcef0217708d19718f ****/
		%feature("compactdefaultargs") ID;
		%feature("autodoc", "No available documentation.

Returns
-------
Standard_GUID
") ID;
		const Standard_GUID & ID();

		/****************** IsEmpty ******************/
		/**** md5 signature: d529c07ce9e12eea3222188c82b0e80b ****/
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsEmpty;
		Standard_Boolean IsEmpty();

		/****************** NewEmpty ******************/
		/**** md5 signature: c6d13c9ecc64c6c803b6e119e8216934 ****/
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TDF_Attribute>
") NewEmpty;
		opencascade::handle<TDF_Attribute> NewEmpty();

		/****************** Paste ******************/
		/**** md5 signature: a6ff306a759c68a191c0262635db980f ****/
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
		/**** md5 signature: 6cac194cd74226cc6a8dd18a8cdce193 ****/
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
		/**** md5 signature: ddeae219d389a1d89eecb3e23c73522a ****/
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
		/**** md5 signature: a1fda0f2938513ca4efcd2592d322153 ****/
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
		/**** md5 signature: 66bc6f747d37a3ea7110a95b02e13c41 ****/
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
		/**** md5 signature: 3a5577c108fd9a03f49db7ce67d309a3 ****/
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
		/**** md5 signature: ace457d697a3a35733c5ac95429cad31 ****/
		%feature("compactdefaultargs") Get;
		%feature("autodoc", "Returns the integer value contained in the attribute.

Returns
-------
int
") Get;
		Standard_Integer Get();

		/****************** GetID ******************/
		/**** md5 signature: afe6002d90f641ca3ea8c9ae9f8fe97c ****/
		%feature("compactdefaultargs") GetID;
		%feature("autodoc", "Class methods ============= returns the guid for integers.

Returns
-------
Standard_GUID
") GetID;
		static const Standard_GUID & GetID();

		/****************** ID ******************/
		/**** md5 signature: 4697ce8a095fa6dcef0217708d19718f ****/
		%feature("compactdefaultargs") ID;
		%feature("autodoc", "No available documentation.

Returns
-------
Standard_GUID
") ID;
		const Standard_GUID & ID();

		/****************** IsCaptured ******************/
		/**** md5 signature: 12ea7252bed17339127c3c98a18cb3cc ****/
		%feature("compactdefaultargs") IsCaptured;
		%feature("autodoc", "Returns true if there is a reference on the same label.

Returns
-------
bool
") IsCaptured;
		Standard_Boolean IsCaptured();

		/****************** NewEmpty ******************/
		/**** md5 signature: c6d13c9ecc64c6c803b6e119e8216934 ****/
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TDF_Attribute>
") NewEmpty;
		opencascade::handle<TDF_Attribute> NewEmpty();

		/****************** Paste ******************/
		/**** md5 signature: a6ff306a759c68a191c0262635db980f ****/
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
		/**** md5 signature: ddeae219d389a1d89eecb3e23c73522a ****/
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
		/**** md5 signature: b29b5247ad1e42b469a89fa6c91069d4 ****/
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
		/**** md5 signature: 0e26e9fcb9f71233beb0805c0bcb57f3 ****/
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
		/**** md5 signature: 64858a2de80493b16a443d640276d65c ****/
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
		/**** md5 signature: 7a929ce753effeac220c978ae7330330 ****/
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
		/**** md5 signature: 244d113ae14add83954353ca15ede66b ****/
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
		/**** md5 signature: 706638100b3f6adc9decce72f072c950 ****/
		%feature("compactdefaultargs") TDataStd_IntegerArray;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") TDataStd_IntegerArray;
		 TDataStd_IntegerArray();

		/****************** Array ******************/
		/**** md5 signature: a7ef75e682bc0079410477b5a2393bdb ****/
		%feature("compactdefaultargs") Array;
		%feature("autodoc", "Return the inner array of the integerarray attribute.

Returns
-------
opencascade::handle<TColStd_HArray1OfInteger>
") Array;
		const opencascade::handle<TColStd_HArray1OfInteger> & Array();

		/****************** ChangeArray ******************/
		/**** md5 signature: ba925b59c57ea8c952a56ef3a11c0389 ****/
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
		/**** md5 signature: 9a96ec815d43dd1838c022740c5327d0 ****/
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
		/**** md5 signature: 570a92cb77e1626ccd16d9bb8bc3044c ****/
		%feature("compactdefaultargs") GetDelta;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") GetDelta;
		Standard_Boolean GetDelta();

		/****************** GetID ******************/
		/**** md5 signature: afe6002d90f641ca3ea8c9ae9f8fe97c ****/
		%feature("compactdefaultargs") GetID;
		%feature("autodoc", "Class methods ============= returns the guid for arrays of integers.

Returns
-------
Standard_GUID
") GetID;
		static const Standard_GUID & GetID();

		/****************** ID ******************/
		/**** md5 signature: 4697ce8a095fa6dcef0217708d19718f ****/
		%feature("compactdefaultargs") ID;
		%feature("autodoc", "No available documentation.

Returns
-------
Standard_GUID
") ID;
		const Standard_GUID & ID();

		/****************** Init ******************/
		/**** md5 signature: 7821d9c43d1b72a2a51576c8503c10d4 ****/
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
		/**** md5 signature: 58bd40380acccb2733bfbd37bf3cbb11 ****/
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "Returns the length of this array of integers in terms of the number of elements it contains.

Returns
-------
int
") Length;
		Standard_Integer Length();

		/****************** Lower ******************/
		/**** md5 signature: fe1655437e349162aeffc9b3814347af ****/
		%feature("compactdefaultargs") Lower;
		%feature("autodoc", "Returns the lower boundary of this array of integers.

Returns
-------
int
") Lower;
		Standard_Integer Lower();

		/****************** NewEmpty ******************/
		/**** md5 signature: c6d13c9ecc64c6c803b6e119e8216934 ****/
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TDF_Attribute>
") NewEmpty;
		opencascade::handle<TDF_Attribute> NewEmpty();

		/****************** Paste ******************/
		/**** md5 signature: a6ff306a759c68a191c0262635db980f ****/
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
		/**** md5 signature: ddeae219d389a1d89eecb3e23c73522a ****/
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
		/**** md5 signature: 3446699890de20ea131346a0fdee1550 ****/
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
		/**** md5 signature: fd935a6ba313810711685f37c36a143b ****/
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
		/**** md5 signature: 66bc6f747d37a3ea7110a95b02e13c41 ****/
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
		/**** md5 signature: 9bed89522d0b510ace46b6aebec92ee0 ****/
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
		/**** md5 signature: 244d113ae14add83954353ca15ede66b ****/
		%feature("compactdefaultargs") SetID;
		%feature("autodoc", "Sets default guid for the attribute.

Returns
-------
None
") SetID;
		void SetID();

		/****************** SetValue ******************/
		/**** md5 signature: 8575533a9631c681a72d28c8c80ec307 ****/
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
		/**** md5 signature: 8f614b31058bb30bdf81ecd0e2d444dc ****/
		%feature("compactdefaultargs") Upper;
		%feature("autodoc", "Return the upper boundary of this array of integers.

Returns
-------
int
") Upper;
		Standard_Integer Upper();

		/****************** Value ******************/
		/**** md5 signature: a0a106e66557a840a37128177a262f02 ****/
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
		/**** md5 signature: 0df1536880a297e3370d9e9e26d824a7 ****/
		%feature("compactdefaultargs") TDataStd_IntegerList;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") TDataStd_IntegerList;
		 TDataStd_IntegerList();

		/****************** Append ******************/
		/**** md5 signature: d91962192b3053f532e2c32ffd9526b7 ****/
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
		/**** md5 signature: ae54be580b423a6eadbe062e0bdb44c2 ****/
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
		/**** md5 signature: 8da0d7e03de513b08d57e17232ac7391 ****/
		%feature("compactdefaultargs") Extent;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") Extent;
		Standard_Integer Extent();

		/****************** First ******************/
		/**** md5 signature: e9b9b55d0f95896826fc1a7c7b3fdf28 ****/
		%feature("compactdefaultargs") First;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") First;
		Standard_Integer First();

		/****************** GetID ******************/
		/**** md5 signature: afe6002d90f641ca3ea8c9ae9f8fe97c ****/
		%feature("compactdefaultargs") GetID;
		%feature("autodoc", "Static methods ============== returns the id of the list of integer attribute.

Returns
-------
Standard_GUID
") GetID;
		static const Standard_GUID & GetID();

		/****************** ID ******************/
		/**** md5 signature: 4697ce8a095fa6dcef0217708d19718f ****/
		%feature("compactdefaultargs") ID;
		%feature("autodoc", "No available documentation.

Returns
-------
Standard_GUID
") ID;
		const Standard_GUID & ID();

		/****************** InsertAfter ******************/
		/**** md5 signature: d212c3e69b13910b3a43e9e7b03a5d9f ****/
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
		/**** md5 signature: 4667d81dfb21cbc9a4762284dc6aa583 ****/
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
		/**** md5 signature: 38d4729675f0992a660a75d530c6b9ff ****/
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
		/**** md5 signature: 4fb4880ded31493a5e709139d9f77315 ****/
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
		/**** md5 signature: 6ab5e1ad63f93168856ab126dd374b81 ****/
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsEmpty;
		Standard_Boolean IsEmpty();

		/****************** Last ******************/
		/**** md5 signature: b34ffc707f6352bb6f1f4c928c84e251 ****/
		%feature("compactdefaultargs") Last;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") Last;
		Standard_Integer Last();

		/****************** List ******************/
		/**** md5 signature: df226a20283d804fa38e9fe4d4263a45 ****/
		%feature("compactdefaultargs") List;
		%feature("autodoc", "No available documentation.

Returns
-------
TColStd_ListOfInteger
") List;
		const TColStd_ListOfInteger & List();

		/****************** NewEmpty ******************/
		/**** md5 signature: c6d13c9ecc64c6c803b6e119e8216934 ****/
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TDF_Attribute>
") NewEmpty;
		opencascade::handle<TDF_Attribute> NewEmpty();

		/****************** Paste ******************/
		/**** md5 signature: a6ff306a759c68a191c0262635db980f ****/
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
		/**** md5 signature: f8244490f55c7baf7f2e424d000f0e9c ****/
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
		/**** md5 signature: 54b03039a7038c867767a866594d37e1 ****/
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
		/**** md5 signature: c11fa68556ba70a082a882fbe98749a3 ****/
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
		/**** md5 signature: ddeae219d389a1d89eecb3e23c73522a ****/
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
		/**** md5 signature: 0080ea7602a11fe85e3a98252ab54b21 ****/
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
		/**** md5 signature: ba70c86f1a85366d39edc3cf10d53734 ****/
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
		/**** md5 signature: 9bed89522d0b510ace46b6aebec92ee0 ****/
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
		/**** md5 signature: 244d113ae14add83954353ca15ede66b ****/
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
		/**** md5 signature: bb0eed56139ed947031c6e938967fa41 ****/
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
		/**** md5 signature: e1828ec7ac26ddd7d323df220dcd7fed ****/
		%feature("compactdefaultargs") Get;
		%feature("autodoc", "Returns the name contained in this name attribute.

Returns
-------
TCollection_ExtendedString
") Get;
		const TCollection_ExtendedString & Get();

		/****************** GetID ******************/
		/**** md5 signature: afe6002d90f641ca3ea8c9ae9f8fe97c ****/
		%feature("compactdefaultargs") GetID;
		%feature("autodoc", "Class methods working on the name itself ======================================== returns the guid for name attributes.

Returns
-------
Standard_GUID
") GetID;
		static const Standard_GUID & GetID();

		/****************** ID ******************/
		/**** md5 signature: 4697ce8a095fa6dcef0217708d19718f ****/
		%feature("compactdefaultargs") ID;
		%feature("autodoc", "No available documentation.

Returns
-------
Standard_GUID
") ID;
		const Standard_GUID & ID();

		/****************** NewEmpty ******************/
		/**** md5 signature: c6d13c9ecc64c6c803b6e119e8216934 ****/
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TDF_Attribute>
") NewEmpty;
		opencascade::handle<TDF_Attribute> NewEmpty();

		/****************** Paste ******************/
		/**** md5 signature: a6ff306a759c68a191c0262635db980f ****/
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
		/**** md5 signature: ddeae219d389a1d89eecb3e23c73522a ****/
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
		/**** md5 signature: bfbe265f341d6a99b31e5f340b9002d9 ****/
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
		/**** md5 signature: d6ce2b5adb6750199ce8d7f1e385b58f ****/
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
		/**** md5 signature: b056e38e35285870dba625ce2752fb25 ****/
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
		/**** md5 signature: 7a929ce753effeac220c978ae7330330 ****/
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
		/**** md5 signature: 244d113ae14add83954353ca15ede66b ****/
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
		/**** md5 signature: 2d40f04eab0a5d40041eb0d605cfe90e ****/
		%feature("compactdefaultargs") TDataStd_NamedData;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") TDataStd_NamedData;
		 TDataStd_NamedData();

		/****************** ChangeArraysOfIntegers ******************/
		/**** md5 signature: 55a86cab8f05de2d3a4a141cf9114c07 ****/
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
		/**** md5 signature: cc70c144703bf55966764ea4966ea324 ****/
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
		/**** md5 signature: c0c7e3ca6b09c6ecdec2c8424121adca ****/
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
		/**** md5 signature: f3a9f83b41b019a0c8bc1212f1a76a38 ****/
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
		/**** md5 signature: 9b1b0533922f259905129bb903ec1f21 ****/
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
		/**** md5 signature: b7bed047d8ce49352e3ab0b211d47cc4 ****/
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
		/**** md5 signature: 4a96aa72d1e7e4a27eb2b5a59638120e ****/
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
		/**** md5 signature: db520b1dcc5a20b132bdacec290b4245 ****/
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
		/**** md5 signature: a1e9fe686378bda0fc070449d50a998a ****/
		%feature("compactdefaultargs") GetArraysOfIntegersContainer;
		%feature("autodoc", "Returns the internal container of named arrays of integer values.

Returns
-------
TDataStd_DataMapOfStringHArray1OfInteger
") GetArraysOfIntegersContainer;
		const TDataStd_DataMapOfStringHArray1OfInteger & GetArraysOfIntegersContainer();

		/****************** GetArraysOfRealsContainer ******************/
		/**** md5 signature: b25b6380e376a4c0c5e323a6e14ec2f8 ****/
		%feature("compactdefaultargs") GetArraysOfRealsContainer;
		%feature("autodoc", "Returns the internal container of named arrays of real values.

Returns
-------
TDataStd_DataMapOfStringHArray1OfReal
") GetArraysOfRealsContainer;
		const TDataStd_DataMapOfStringHArray1OfReal & GetArraysOfRealsContainer();

		/****************** GetByte ******************/
		/**** md5 signature: 939e82da5466136022c4926a2efe7b35 ****/
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
		/**** md5 signature: ea73b7a5406b0b6387303ddc10bec47f ****/
		%feature("compactdefaultargs") GetBytesContainer;
		%feature("autodoc", "Returns the internal container of named bytes.

Returns
-------
TDataStd_DataMapOfStringByte
") GetBytesContainer;
		const TDataStd_DataMapOfStringByte & GetBytesContainer();

		/****************** GetID ******************/
		/**** md5 signature: afe6002d90f641ca3ea8c9ae9f8fe97c ****/
		%feature("compactdefaultargs") GetID;
		%feature("autodoc", "Static methods ============== returns the id of the named data attribute.

Returns
-------
Standard_GUID
") GetID;
		static const Standard_GUID & GetID();

		/****************** GetInteger ******************/
		/**** md5 signature: 6b54a2c0c24e0d10ada8e1ef9718d599 ****/
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
		/**** md5 signature: 21b7a9b99a1fbfad05d9c3d28560589a ****/
		%feature("compactdefaultargs") GetIntegersContainer;
		%feature("autodoc", "Returns the internal container of named integers.

Returns
-------
TColStd_DataMapOfStringInteger
") GetIntegersContainer;
		const TColStd_DataMapOfStringInteger & GetIntegersContainer();

		/****************** GetReal ******************/
		/**** md5 signature: 4ae7a7a98da3d341416d79e090f6b1a4 ****/
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
		/**** md5 signature: b9e2c4440bc22fb7830c62903dc1a40c ****/
		%feature("compactdefaultargs") GetRealsContainer;
		%feature("autodoc", "Returns the internal container of named reals.

Returns
-------
TDataStd_DataMapOfStringReal
") GetRealsContainer;
		const TDataStd_DataMapOfStringReal & GetRealsContainer();

		/****************** GetString ******************/
		/**** md5 signature: 431d366e9e5181ba3f9d7b2cb04484f9 ****/
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
		/**** md5 signature: 13ee8580b035b794e3fdbc2e42bde3fe ****/
		%feature("compactdefaultargs") GetStringsContainer;
		%feature("autodoc", "Returns the internal container of named strings.

Returns
-------
TDataStd_DataMapOfStringString
") GetStringsContainer;
		const TDataStd_DataMapOfStringString & GetStringsContainer();

		/****************** HasArrayOfIntegers ******************/
		/**** md5 signature: bc48c8ef7c6aada5fd483450dcb3d31c ****/
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
		/**** md5 signature: 5a74df706dd2f1d3399b54e753d72fa5 ****/
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
		/**** md5 signature: 630276ad2915cc0f5cb7a7fae1577c12 ****/
		%feature("compactdefaultargs") HasArraysOfIntegers;
		%feature("autodoc", "Returns true if there are some named arrays of integer values in the attribute.

Returns
-------
bool
") HasArraysOfIntegers;
		Standard_Boolean HasArraysOfIntegers();

		/****************** HasArraysOfReals ******************/
		/**** md5 signature: 3a700fb256757684d41d9b2cb7dfbe60 ****/
		%feature("compactdefaultargs") HasArraysOfReals;
		%feature("autodoc", "Returns true if there are some named arrays of real values in the attribute.

Returns
-------
bool
") HasArraysOfReals;
		Standard_Boolean HasArraysOfReals();

		/****************** HasByte ******************/
		/**** md5 signature: 96647156a924919be2a85cac754550c0 ****/
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
		/**** md5 signature: 94a3934cdf294db1b998b35763579703 ****/
		%feature("compactdefaultargs") HasBytes;
		%feature("autodoc", "Returns true if there are some named bytes in the attribute.

Returns
-------
bool
") HasBytes;
		Standard_Boolean HasBytes();

		/****************** HasInteger ******************/
		/**** md5 signature: 2240b54628b28022d39a4cae802f471c ****/
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
		/**** md5 signature: aa7fb571afe1cc8055a6c72701aedd1e ****/
		%feature("compactdefaultargs") HasIntegers;
		%feature("autodoc", "Returns true if at least one named integer value is kept in the attribute.

Returns
-------
bool
") HasIntegers;
		Standard_Boolean HasIntegers();

		/****************** HasReal ******************/
		/**** md5 signature: c4d66ca3fe426eab3bf399ce36cfc35f ****/
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
		/**** md5 signature: d08f33ee376c6cd75a9d81cc491b4176 ****/
		%feature("compactdefaultargs") HasReals;
		%feature("autodoc", "Returns true if at least one named real value is kept in the attribute.

Returns
-------
bool
") HasReals;
		Standard_Boolean HasReals();

		/****************** HasString ******************/
		/**** md5 signature: b0713af4d469778dbe03653123a46b1d ****/
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
		/**** md5 signature: 91968d2a3a35cf447a545790772a5e0a ****/
		%feature("compactdefaultargs") HasStrings;
		%feature("autodoc", "Returns true if there are some named strings in the attribute.

Returns
-------
bool
") HasStrings;
		Standard_Boolean HasStrings();

		/****************** ID ******************/
		/**** md5 signature: 4697ce8a095fa6dcef0217708d19718f ****/
		%feature("compactdefaultargs") ID;
		%feature("autodoc", "No available documentation.

Returns
-------
Standard_GUID
") ID;
		const Standard_GUID & ID();

		/****************** NewEmpty ******************/
		/**** md5 signature: c6d13c9ecc64c6c803b6e119e8216934 ****/
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TDF_Attribute>
") NewEmpty;
		opencascade::handle<TDF_Attribute> NewEmpty();

		/****************** Paste ******************/
		/**** md5 signature: a6ff306a759c68a191c0262635db980f ****/
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
		/**** md5 signature: ddeae219d389a1d89eecb3e23c73522a ****/
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
		/**** md5 signature: ee0f0e4a73047eda396551b327a75125 ****/
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
		/**** md5 signature: 4363833f3b7223b8cbf87ce2438e80a5 ****/
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
		/**** md5 signature: 26be02bfa2f598e0213856441ddbd2e7 ****/
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
		/**** md5 signature: 4a6e013a0bf3337864e2187c10d95ca1 ****/
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
		/**** md5 signature: 4e011fdcaf36e99a883b60954eb74fd6 ****/
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
		/**** md5 signature: 3881e61413b5d53222042466565b51e6 ****/
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
		/**** md5 signature: a95bad6b9ababf6273e290a39194b37c ****/
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
		/**** md5 signature: 9d531eae5ef1dd7b80ad3d6be9ce2a48 ****/
		%feature("compactdefaultargs") TDataStd_NoteBook;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") TDataStd_NoteBook;
		 TDataStd_NoteBook();

		/****************** Append ******************/
		/**** md5 signature: e638d87bb80f7e7b3ab388375de60bc6 ****/
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
		/**** md5 signature: 79495fe00184d4d6b78a635aa06c941d ****/
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
		/**** md5 signature: 400d5175f4317bb9f7f5240746dcd5c9 ****/
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
		/**** md5 signature: afe6002d90f641ca3ea8c9ae9f8fe97c ****/
		%feature("compactdefaultargs") GetID;
		%feature("autodoc", "Notebook methods ===============.

Returns
-------
Standard_GUID
") GetID;
		static const Standard_GUID & GetID();

		/****************** ID ******************/
		/**** md5 signature: 4697ce8a095fa6dcef0217708d19718f ****/
		%feature("compactdefaultargs") ID;
		%feature("autodoc", "No available documentation.

Returns
-------
Standard_GUID
") ID;
		const Standard_GUID & ID();

		/****************** New ******************/
		/**** md5 signature: a02ef42106eb0cec4504ab57a99400d3 ****/
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
		/**** md5 signature: c6d13c9ecc64c6c803b6e119e8216934 ****/
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TDF_Attribute>
") NewEmpty;
		opencascade::handle<TDF_Attribute> NewEmpty();

		/****************** Paste ******************/
		/**** md5 signature: a6ff306a759c68a191c0262635db980f ****/
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
		/**** md5 signature: ddeae219d389a1d89eecb3e23c73522a ****/
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
		/**** md5 signature: 1b268198c9b981bf2466bac3ef98f3b2 ****/
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
		/**** md5 signature: fc841fb28cb01367762b1d75c09d001e ****/
		%feature("compactdefaultargs") Get;
		%feature("autodoc", "Returns the real number value contained in the attribute.

Returns
-------
float
") Get;
		Standard_Real Get();

		/****************** GetDimension ******************/
		/**** md5 signature: 853aef0fdf2cdedcc5c6a512c960301d ****/
		%feature("compactdefaultargs") GetDimension;
		%feature("autodoc", "Obsolete method that will be removed in next versions. this field is not supported in the persistence mechanism.

Returns
-------
TDataStd_RealEnum
") GetDimension;
		TDataStd_RealEnum GetDimension();

		/****************** GetID ******************/
		/**** md5 signature: afe6002d90f641ca3ea8c9ae9f8fe97c ****/
		%feature("compactdefaultargs") GetID;
		%feature("autodoc", "Class methods ============= returns the default guid for real numbers.

Returns
-------
Standard_GUID
") GetID;
		static const Standard_GUID & GetID();

		/****************** ID ******************/
		/**** md5 signature: 4697ce8a095fa6dcef0217708d19718f ****/
		%feature("compactdefaultargs") ID;
		%feature("autodoc", "No available documentation.

Returns
-------
Standard_GUID
") ID;
		const Standard_GUID & ID();

		/****************** IsCaptured ******************/
		/**** md5 signature: 12ea7252bed17339127c3c98a18cb3cc ****/
		%feature("compactdefaultargs") IsCaptured;
		%feature("autodoc", "Returns true if there is a reference on the same label.

Returns
-------
bool
") IsCaptured;
		Standard_Boolean IsCaptured();

		/****************** NewEmpty ******************/
		/**** md5 signature: c6d13c9ecc64c6c803b6e119e8216934 ****/
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TDF_Attribute>
") NewEmpty;
		opencascade::handle<TDF_Attribute> NewEmpty();

		/****************** Paste ******************/
		/**** md5 signature: a6ff306a759c68a191c0262635db980f ****/
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
		/**** md5 signature: ddeae219d389a1d89eecb3e23c73522a ****/
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
		/**** md5 signature: adfae07f13ec85f973dbbc58e9bf051e ****/
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
		/**** md5 signature: b5da86df5efbf1d497e3a0f36d50c747 ****/
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
		/**** md5 signature: 4d75ecabbf8b06da8c7da02cf6b17a7c ****/
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
		/**** md5 signature: 3c462beef751a3f1526e4a72979eac82 ****/
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
		/**** md5 signature: 7a929ce753effeac220c978ae7330330 ****/
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
		/**** md5 signature: 244d113ae14add83954353ca15ede66b ****/
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
		/**** md5 signature: 9662f533d274472ddb78bfdccfe5ef29 ****/
		%feature("compactdefaultargs") TDataStd_RealArray;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") TDataStd_RealArray;
		 TDataStd_RealArray();

		/****************** Array ******************/
		/**** md5 signature: 258fa80f8a51ca0aa0e5ad2f4f009cdc ****/
		%feature("compactdefaultargs") Array;
		%feature("autodoc", "Returns the handle of this array of reals.

Returns
-------
opencascade::handle<TColStd_HArray1OfReal>
") Array;
		const opencascade::handle<TColStd_HArray1OfReal> & Array();

		/****************** ChangeArray ******************/
		/**** md5 signature: 013a639f65bedf7768c12d7b77c602eb ****/
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
		/**** md5 signature: 9a96ec815d43dd1838c022740c5327d0 ****/
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
		/**** md5 signature: 570a92cb77e1626ccd16d9bb8bc3044c ****/
		%feature("compactdefaultargs") GetDelta;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") GetDelta;
		Standard_Boolean GetDelta();

		/****************** GetID ******************/
		/**** md5 signature: afe6002d90f641ca3ea8c9ae9f8fe97c ****/
		%feature("compactdefaultargs") GetID;
		%feature("autodoc", "Class methods ============= returns the guid for arrays of reals.

Returns
-------
Standard_GUID
") GetID;
		static const Standard_GUID & GetID();

		/****************** ID ******************/
		/**** md5 signature: 4697ce8a095fa6dcef0217708d19718f ****/
		%feature("compactdefaultargs") ID;
		%feature("autodoc", "No available documentation.

Returns
-------
Standard_GUID
") ID;
		const Standard_GUID & ID();

		/****************** Init ******************/
		/**** md5 signature: 7821d9c43d1b72a2a51576c8503c10d4 ****/
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
		/**** md5 signature: 58bd40380acccb2733bfbd37bf3cbb11 ****/
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "Returns the number of elements of the array of reals in terms of the number of elements it contains.

Returns
-------
int
") Length;
		Standard_Integer Length();

		/****************** Lower ******************/
		/**** md5 signature: fe1655437e349162aeffc9b3814347af ****/
		%feature("compactdefaultargs") Lower;
		%feature("autodoc", "Returns the lower boundary of the array.

Returns
-------
int
") Lower;
		Standard_Integer Lower();

		/****************** NewEmpty ******************/
		/**** md5 signature: c6d13c9ecc64c6c803b6e119e8216934 ****/
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TDF_Attribute>
") NewEmpty;
		opencascade::handle<TDF_Attribute> NewEmpty();

		/****************** Paste ******************/
		/**** md5 signature: a6ff306a759c68a191c0262635db980f ****/
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
		/**** md5 signature: ddeae219d389a1d89eecb3e23c73522a ****/
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
		/**** md5 signature: 48f3e162f59c0d9b4ebd2d416bcd46eb ****/
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
		/**** md5 signature: 02926e3f2635296d79033ba0cf76528f ****/
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
		/**** md5 signature: 66bc6f747d37a3ea7110a95b02e13c41 ****/
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
		/**** md5 signature: 9bed89522d0b510ace46b6aebec92ee0 ****/
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
		/**** md5 signature: 244d113ae14add83954353ca15ede66b ****/
		%feature("compactdefaultargs") SetID;
		%feature("autodoc", "Sets default guid for the attribute.

Returns
-------
None
") SetID;
		void SetID();

		/****************** SetValue ******************/
		/**** md5 signature: 4716e5d045677f06335160a1ccba754d ****/
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
		/**** md5 signature: 8f614b31058bb30bdf81ecd0e2d444dc ****/
		%feature("compactdefaultargs") Upper;
		%feature("autodoc", "Returns the upper boundary of the array.

Returns
-------
int
") Upper;
		Standard_Integer Upper();

		/****************** Value ******************/
		/**** md5 signature: 848ebada0b45fc838235de2b6b6e8d07 ****/
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
		/**** md5 signature: 42942f0efdf2510391f7fa4dbeca5a46 ****/
		%feature("compactdefaultargs") TDataStd_RealList;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") TDataStd_RealList;
		 TDataStd_RealList();

		/****************** Append ******************/
		/**** md5 signature: f8a8f3c712d27179b5616b621b1bf53e ****/
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
		/**** md5 signature: ae54be580b423a6eadbe062e0bdb44c2 ****/
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
		/**** md5 signature: 8da0d7e03de513b08d57e17232ac7391 ****/
		%feature("compactdefaultargs") Extent;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") Extent;
		Standard_Integer Extent();

		/****************** First ******************/
		/**** md5 signature: 009dd98af15e46b2da286731f40e1839 ****/
		%feature("compactdefaultargs") First;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") First;
		Standard_Real First();

		/****************** GetID ******************/
		/**** md5 signature: afe6002d90f641ca3ea8c9ae9f8fe97c ****/
		%feature("compactdefaultargs") GetID;
		%feature("autodoc", "Static methods ============== returns the id of the list of doubles attribute.

Returns
-------
Standard_GUID
") GetID;
		static const Standard_GUID & GetID();

		/****************** ID ******************/
		/**** md5 signature: 4697ce8a095fa6dcef0217708d19718f ****/
		%feature("compactdefaultargs") ID;
		%feature("autodoc", "No available documentation.

Returns
-------
Standard_GUID
") ID;
		const Standard_GUID & ID();

		/****************** InsertAfter ******************/
		/**** md5 signature: 1526a74510a699288440d63c6d3369d3 ****/
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
		/**** md5 signature: d2759367e5d3efc19a4747a928aadd83 ****/
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
		/**** md5 signature: 3a00dd8235479555bdace2eead9b66c1 ****/
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
		/**** md5 signature: f1ae8f61aa5425f6ac5be85591ec76cd ****/
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
		/**** md5 signature: 6ab5e1ad63f93168856ab126dd374b81 ****/
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsEmpty;
		Standard_Boolean IsEmpty();

		/****************** Last ******************/
		/**** md5 signature: 4c8063c237a4f73018a7949da8aef9fb ****/
		%feature("compactdefaultargs") Last;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") Last;
		Standard_Real Last();

		/****************** List ******************/
		/**** md5 signature: bb4687a5f112f09f0c7d954955de692d ****/
		%feature("compactdefaultargs") List;
		%feature("autodoc", "No available documentation.

Returns
-------
TColStd_ListOfReal
") List;
		const TColStd_ListOfReal & List();

		/****************** NewEmpty ******************/
		/**** md5 signature: c6d13c9ecc64c6c803b6e119e8216934 ****/
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TDF_Attribute>
") NewEmpty;
		opencascade::handle<TDF_Attribute> NewEmpty();

		/****************** Paste ******************/
		/**** md5 signature: a6ff306a759c68a191c0262635db980f ****/
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
		/**** md5 signature: 4f2498da5d2b3c6fb99e4393a7cbed84 ****/
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
		/**** md5 signature: 7941dddff97a0eba4713aac77f9daf6a ****/
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
		/**** md5 signature: c11fa68556ba70a082a882fbe98749a3 ****/
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
		/**** md5 signature: ddeae219d389a1d89eecb3e23c73522a ****/
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
		/**** md5 signature: 25df734a0b2fb4b7a75d6713d1fd3588 ****/
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
		/**** md5 signature: f917736d49a3e6292d0083e7d44899a9 ****/
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
		/**** md5 signature: 9bed89522d0b510ace46b6aebec92ee0 ****/
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
		/**** md5 signature: 244d113ae14add83954353ca15ede66b ****/
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
		/**** md5 signature: f9ae20c1be39b2ccafd6846ba6fa40b3 ****/
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
		/**** md5 signature: afe6002d90f641ca3ea8c9ae9f8fe97c ****/
		%feature("compactdefaultargs") GetID;
		%feature("autodoc", "Static methods ============== returns the id of the array of references (labels) attribute.

Returns
-------
Standard_GUID
") GetID;
		static const Standard_GUID & GetID();

		/****************** ID ******************/
		/**** md5 signature: 4697ce8a095fa6dcef0217708d19718f ****/
		%feature("compactdefaultargs") ID;
		%feature("autodoc", "No available documentation.

Returns
-------
Standard_GUID
") ID;
		const Standard_GUID & ID();

		/****************** Init ******************/
		/**** md5 signature: 7821d9c43d1b72a2a51576c8503c10d4 ****/
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
		/**** md5 signature: 4cb44e93aa5efec14fa520fd2407aff4 ****/
		%feature("compactdefaultargs") InternalArray;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TDataStd_HLabelArray1>
") InternalArray;
		const opencascade::handle<TDataStd_HLabelArray1> & InternalArray();

		/****************** Length ******************/
		/**** md5 signature: 58bd40380acccb2733bfbd37bf3cbb11 ****/
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "Returns the number of elements in the array.

Returns
-------
int
") Length;
		Standard_Integer Length();

		/****************** Lower ******************/
		/**** md5 signature: fe1655437e349162aeffc9b3814347af ****/
		%feature("compactdefaultargs") Lower;
		%feature("autodoc", "Returns the lower boundary of the array.

Returns
-------
int
") Lower;
		Standard_Integer Lower();

		/****************** NewEmpty ******************/
		/**** md5 signature: c6d13c9ecc64c6c803b6e119e8216934 ****/
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TDF_Attribute>
") NewEmpty;
		opencascade::handle<TDF_Attribute> NewEmpty();

		/****************** Paste ******************/
		/**** md5 signature: a6ff306a759c68a191c0262635db980f ****/
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
		/**** md5 signature: f171ce811dbfb205236d26e3cbf15450 ****/
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
		/**** md5 signature: ddeae219d389a1d89eecb3e23c73522a ****/
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
		/**** md5 signature: 0ac756120843d05141929b5124bf699e ****/
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
		/**** md5 signature: 86dd1a3bfb736b809b1ba224d5acf616 ****/
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
		/**** md5 signature: 9bed89522d0b510ace46b6aebec92ee0 ****/
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
		/**** md5 signature: 244d113ae14add83954353ca15ede66b ****/
		%feature("compactdefaultargs") SetID;
		%feature("autodoc", "Sets default guid for the attribute.

Returns
-------
None
") SetID;
		void SetID();

		/****************** SetInternalArray ******************/
		/**** md5 signature: fb1da68a9b4daf661fe381840cb2c5c3 ****/
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
		/**** md5 signature: 391200af1382b8920cfedd756d7d73db ****/
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
		/**** md5 signature: 8f614b31058bb30bdf81ecd0e2d444dc ****/
		%feature("compactdefaultargs") Upper;
		%feature("autodoc", "Returns the upper boundary of the array.

Returns
-------
int
") Upper;
		Standard_Integer Upper();

		/****************** Value ******************/
		/**** md5 signature: 0a8a674e7de2dce6641ef600a54da113 ****/
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
		/**** md5 signature: 25070f96c4fd52d8b05deda12be35cbd ****/
		%feature("compactdefaultargs") TDataStd_ReferenceList;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") TDataStd_ReferenceList;
		 TDataStd_ReferenceList();

		/****************** Append ******************/
		/**** md5 signature: 67dd102a074ac568d6ab7e7e8e9594f5 ****/
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
		/**** md5 signature: ae54be580b423a6eadbe062e0bdb44c2 ****/
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
		/**** md5 signature: 8da0d7e03de513b08d57e17232ac7391 ****/
		%feature("compactdefaultargs") Extent;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") Extent;
		Standard_Integer Extent();

		/****************** First ******************/
		/**** md5 signature: fc0dfb1b8118d546191271893de453b4 ****/
		%feature("compactdefaultargs") First;
		%feature("autodoc", "No available documentation.

Returns
-------
TDF_Label
") First;
		const TDF_Label & First();

		/****************** GetID ******************/
		/**** md5 signature: afe6002d90f641ca3ea8c9ae9f8fe97c ****/
		%feature("compactdefaultargs") GetID;
		%feature("autodoc", "Static methods ============== returns the id of the list of references (labels) attribute.

Returns
-------
Standard_GUID
") GetID;
		static const Standard_GUID & GetID();

		/****************** ID ******************/
		/**** md5 signature: 4697ce8a095fa6dcef0217708d19718f ****/
		%feature("compactdefaultargs") ID;
		%feature("autodoc", "No available documentation.

Returns
-------
Standard_GUID
") ID;
		const Standard_GUID & ID();

		/****************** InsertAfter ******************/
		/**** md5 signature: ff77c598a4a4e62f620ea009da1170bd ****/
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
		/**** md5 signature: 83eefae3f1ccacd848185dd491b62e11 ****/
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
		/**** md5 signature: 2ac54f6c0511e2a4b41de5160baaace1 ****/
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
		/**** md5 signature: e723549c21185a4d8f3f4ad0b44352c1 ****/
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
		/**** md5 signature: 6ab5e1ad63f93168856ab126dd374b81 ****/
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsEmpty;
		Standard_Boolean IsEmpty();

		/****************** Last ******************/
		/**** md5 signature: af545a63ea1ddbfde05f358f8ed64bbf ****/
		%feature("compactdefaultargs") Last;
		%feature("autodoc", "No available documentation.

Returns
-------
TDF_Label
") Last;
		const TDF_Label & Last();

		/****************** List ******************/
		/**** md5 signature: 9fe1755f03705d9a6078452748e614f0 ****/
		%feature("compactdefaultargs") List;
		%feature("autodoc", "No available documentation.

Returns
-------
TDF_LabelList
") List;
		const TDF_LabelList & List();

		/****************** NewEmpty ******************/
		/**** md5 signature: c6d13c9ecc64c6c803b6e119e8216934 ****/
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TDF_Attribute>
") NewEmpty;
		opencascade::handle<TDF_Attribute> NewEmpty();

		/****************** Paste ******************/
		/**** md5 signature: a6ff306a759c68a191c0262635db980f ****/
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
		/**** md5 signature: 29390ecea2ffb98e63c05b9ac6f31106 ****/
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
		/**** md5 signature: f171ce811dbfb205236d26e3cbf15450 ****/
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
		/**** md5 signature: 0038b298680b9f13b219a3855474472b ****/
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
		/**** md5 signature: d5758943c335a06d32f07ab2389e0fe6 ****/
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
		/**** md5 signature: ddeae219d389a1d89eecb3e23c73522a ****/
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
		/**** md5 signature: 038c01f2e83d5efcae1d85b38806104a ****/
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
		/**** md5 signature: 3d3d73a8d333ef4e01397b43d9e36b9c ****/
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
		/**** md5 signature: 9bed89522d0b510ace46b6aebec92ee0 ****/
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
		/**** md5 signature: 244d113ae14add83954353ca15ede66b ****/
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
		/**** md5 signature: e2728d158cd6835bfe4ededc5ccddf26 ****/
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
		/**** md5 signature: afe6002d90f641ca3ea8c9ae9f8fe97c ****/
		%feature("compactdefaultargs") GetID;
		%feature("autodoc", "Class methods =============.

Returns
-------
Standard_GUID
") GetID;
		static const Standard_GUID & GetID();

		/****************** GetRelation ******************/
		/**** md5 signature: 9a760a60866ee882febabe61f33bef73 ****/
		%feature("compactdefaultargs") GetRelation;
		%feature("autodoc", "No available documentation.

Returns
-------
TCollection_ExtendedString
") GetRelation;
		const TCollection_ExtendedString & GetRelation();

		/****************** GetVariables ******************/
		/**** md5 signature: b15a6b025b25c61503dc4b4deba5bd8b ****/
		%feature("compactdefaultargs") GetVariables;
		%feature("autodoc", "No available documentation.

Returns
-------
TDF_AttributeList
") GetVariables;
		TDF_AttributeList & GetVariables();

		/****************** ID ******************/
		/**** md5 signature: 4697ce8a095fa6dcef0217708d19718f ****/
		%feature("compactdefaultargs") ID;
		%feature("autodoc", "No available documentation.

Returns
-------
Standard_GUID
") ID;
		const Standard_GUID & ID();

		/****************** Name ******************/
		/**** md5 signature: a9e55299a1405b3a2863469f1a67f9cd ****/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "Build and return the relation name.

Returns
-------
TCollection_ExtendedString
") Name;
		TCollection_ExtendedString Name();

		/****************** NewEmpty ******************/
		/**** md5 signature: c6d13c9ecc64c6c803b6e119e8216934 ****/
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TDF_Attribute>
") NewEmpty;
		opencascade::handle<TDF_Attribute> NewEmpty();

		/****************** Paste ******************/
		/**** md5 signature: a6ff306a759c68a191c0262635db980f ****/
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
		/**** md5 signature: ddeae219d389a1d89eecb3e23c73522a ****/
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
		/**** md5 signature: 2a4cde76807e5d1258840493d4e69032 ****/
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
		/**** md5 signature: 9b48e0039287e75d85edb77a4c19ad95 ****/
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
		/**** md5 signature: a26d0e9a1ea99ba56a5b60641b8967ca ****/
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
		/**** md5 signature: afe6002d90f641ca3ea8c9ae9f8fe97c ****/
		%feature("compactdefaultargs") GetID;
		%feature("autodoc", "Static methods ==============.

Returns
-------
Standard_GUID
") GetID;
		static const Standard_GUID & GetID();

		/****************** ID ******************/
		/**** md5 signature: 4697ce8a095fa6dcef0217708d19718f ****/
		%feature("compactdefaultargs") ID;
		%feature("autodoc", "No available documentation.

Returns
-------
Standard_GUID
") ID;
		const Standard_GUID & ID();

		/****************** NewEmpty ******************/
		/**** md5 signature: c6d13c9ecc64c6c803b6e119e8216934 ****/
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TDF_Attribute>
") NewEmpty;
		opencascade::handle<TDF_Attribute> NewEmpty();

		/****************** Paste ******************/
		/**** md5 signature: a6ff306a759c68a191c0262635db980f ****/
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
		/**** md5 signature: ddeae219d389a1d89eecb3e23c73522a ****/
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
		/**** md5 signature: a98facae6bc4fd10dad3a306e6332dfb ****/
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
		/**** md5 signature: dca7a5049eca9ac2b28ef3448b6457b1 ****/
		%feature("compactdefaultargs") TDataStd_TreeNode;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") TDataStd_TreeNode;
		 TDataStd_TreeNode();

		/****************** AfterAddition ******************/
		/**** md5 signature: b31825498767e26fb4d69f77ab94108b ****/
		%feature("compactdefaultargs") AfterAddition;
		%feature("autodoc", "Connect the treenode to its father child list.

Returns
-------
None
") AfterAddition;
		virtual void AfterAddition();

		/****************** AfterResume ******************/
		/**** md5 signature: 1d4195e9b512e0fcd0e4fad379210118 ****/
		%feature("compactdefaultargs") AfterResume;
		%feature("autodoc", "Reconnect the treenode to its father child list.

Returns
-------
None
") AfterResume;
		virtual void AfterResume();

		/****************** AfterUndo ******************/
		/**** md5 signature: 6a782c706f1e9291f121f77d889ed576 ****/
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
		/**** md5 signature: a8fd473883f7f2817221327a52e3aaf6 ****/
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
		/**** md5 signature: e5a78fffddf9fa82f6f158acce858991 ****/
		%feature("compactdefaultargs") BeforeForget;
		%feature("autodoc", "Disconnect the treenode from its father child list.

Returns
-------
None
") BeforeForget;
		virtual void BeforeForget();

		/****************** BeforeUndo ******************/
		/**** md5 signature: d409c3f1c759e5fb3727056dd12910e7 ****/
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
		/**** md5 signature: b6eaa771d2fe709741b9c1e8ce5ec68f ****/
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
		/**** md5 signature: fd4e43dbfa571e1a17a926e895f43183 ****/
		%feature("compactdefaultargs") Father;
		%feature("autodoc", "Returns the father treenode of <self>. null if root.

Returns
-------
opencascade::handle<TDataStd_TreeNode>
") Father;
		opencascade::handle<TDataStd_TreeNode> Father();

		/****************** Find ******************/
		/**** md5 signature: 3ebbc855e62070f911d56a3225391cca ****/
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
		/**** md5 signature: df608722d221823bc8cb3ad3b7b4a692 ****/
		%feature("compactdefaultargs") FindLast;
		%feature("autodoc", "Returns the last child tree node in this tree node object. to set fields =============.

Returns
-------
opencascade::handle<TDataStd_TreeNode>
") FindLast;
		opencascade::handle<TDataStd_TreeNode> FindLast();

		/****************** First ******************/
		/**** md5 signature: 8c741b9684c32d7bddac2e26fdd5ca54 ****/
		%feature("compactdefaultargs") First;
		%feature("autodoc", "Returns the first child tree node in this tree node object.

Returns
-------
opencascade::handle<TDataStd_TreeNode>
") First;
		opencascade::handle<TDataStd_TreeNode> First();

		/****************** GetDefaultTreeID ******************/
		/**** md5 signature: 14296d31cb2a3f8590adaf8d487eff37 ****/
		%feature("compactdefaultargs") GetDefaultTreeID;
		%feature("autodoc", "Returns a default tree id. this id is used by the <set> method without explicit tree id. instance methods: ================.

Returns
-------
Standard_GUID
") GetDefaultTreeID;
		static const Standard_GUID & GetDefaultTreeID();

		/****************** HasFather ******************/
		/**** md5 signature: 460320b1dfa669ec97caaf61775c91ef ****/
		%feature("compactdefaultargs") HasFather;
		%feature("autodoc", "Returns true if this tree node attribute has a father tree node.

Returns
-------
bool
") HasFather;
		Standard_Boolean HasFather();

		/****************** HasFirst ******************/
		/**** md5 signature: a68be84c16fa3b425aa2242913b7b855 ****/
		%feature("compactdefaultargs") HasFirst;
		%feature("autodoc", "Returns true if this tree node attribute has a first child tree node.

Returns
-------
bool
") HasFirst;
		Standard_Boolean HasFirst();

		/****************** HasLast ******************/
		/**** md5 signature: 013083be5a8309a76ae714f82c261d28 ****/
		%feature("compactdefaultargs") HasLast;
		%feature("autodoc", "Returns true if this tree node attribute has a last child tree node.

Returns
-------
bool
") HasLast;
		Standard_Boolean HasLast();

		/****************** HasNext ******************/
		/**** md5 signature: 8e76e2c6de239b72cfbc78ab89aa74ce ****/
		%feature("compactdefaultargs") HasNext;
		%feature("autodoc", "Returns true if this tree node attribute has a next tree node.

Returns
-------
bool
") HasNext;
		Standard_Boolean HasNext();

		/****************** HasPrevious ******************/
		/**** md5 signature: 222c1ab4a665482cbe8287ca7ac25f9a ****/
		%feature("compactdefaultargs") HasPrevious;
		%feature("autodoc", "Returns true if this tree node attribute has a previous tree node.

Returns
-------
bool
") HasPrevious;
		Standard_Boolean HasPrevious();

		/****************** ID ******************/
		/**** md5 signature: 4697ce8a095fa6dcef0217708d19718f ****/
		%feature("compactdefaultargs") ID;
		%feature("autodoc", "Returns the tree id (default or explicit one depending onthe set method used).

Returns
-------
Standard_GUID
") ID;
		const Standard_GUID & ID();

		/****************** InsertAfter ******************/
		/**** md5 signature: 3de035405170a903b03e23e39f9378e7 ****/
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
		/**** md5 signature: 7eb2bdc1db69daffa10fec5fd50bbe71 ****/
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
		/**** md5 signature: 5306d8f606b7847fe40777745e23a33c ****/
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
		/**** md5 signature: 3ef4546e4ea31cb3867cbce63ca14fb0 ****/
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
		/**** md5 signature: eb70d101aa1ff17850afc10c0c9b6502 ****/
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
		/**** md5 signature: 86fa942e11bef925735b63310b466f57 ****/
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
		/**** md5 signature: 9d981f423106a71cbae38fc5c56749f7 ****/
		%feature("compactdefaultargs") IsRoot;
		%feature("autodoc", "Returns true if this tree node attribute is the ultimate father in the tree.

Returns
-------
bool
") IsRoot;
		Standard_Boolean IsRoot();

		/****************** Last ******************/
		/**** md5 signature: dd80e1aab4a3cf89b9ab90cc94e8a94b ****/
		%feature("compactdefaultargs") Last;
		%feature("autodoc", "Returns the last child tree node in this tree node object.

Returns
-------
opencascade::handle<TDataStd_TreeNode>
") Last;
		opencascade::handle<TDataStd_TreeNode> Last();

		/****************** NbChildren ******************/
		/**** md5 signature: 387795ed5ec2927a2e92aa54672b9814 ****/
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
		/**** md5 signature: 8be17a4d2a4deeee198571712e76805e ****/
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TDF_Attribute>
") NewEmpty;
		virtual opencascade::handle<TDF_Attribute> NewEmpty();

		/****************** Next ******************/
		/**** md5 signature: b7ef516aa02e857cd54615aeec6e9a2c ****/
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "Returns the next tree node in this tree node attribute. warning this tree node is null if it is the last one in this tree node attribute.returns the next treenode of <self>. null if last.

Returns
-------
opencascade::handle<TDataStd_TreeNode>
") Next;
		opencascade::handle<TDataStd_TreeNode> Next();

		/****************** Paste ******************/
		/**** md5 signature: 05e5f8f16a08ca8388ac65d3be603584 ****/
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
		/**** md5 signature: fa9c7c44fd6439efa9396d3387dc28c8 ****/
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
		/**** md5 signature: 50ea57789edf52100d8b819a6cfce9c5 ****/
		%feature("compactdefaultargs") Previous;
		%feature("autodoc", "Returns the previous tree node of this tree node attribute. warning this tree node is null if it is the first one in this tree node attribute.

Returns
-------
opencascade::handle<TDataStd_TreeNode>
") Previous;
		opencascade::handle<TDataStd_TreeNode> Previous();

		/****************** References ******************/
		/**** md5 signature: 3f614360a69c957f8600d26b49bc71b2 ****/
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
		/**** md5 signature: 7681d1947992ee3b792c09ff6d3b1bb7 ****/
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "Removes this tree node attribute from its father node. the result is that this attribute becomes a root node.

Returns
-------
bool
") Remove;
		Standard_Boolean Remove();

		/****************** Restore ******************/
		/**** md5 signature: 317305acc3f3ea9c2fd983a7ed00e566 ****/
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
		/**** md5 signature: b560926c389e71646912319417b31c46 ****/
		%feature("compactdefaultargs") Root;
		%feature("autodoc", "Returns the ultimate father of this tree node attribute.

Returns
-------
opencascade::handle<TDataStd_TreeNode>
") Root;
		opencascade::handle<TDataStd_TreeNode> Root();

		/****************** Set ******************/
		/**** md5 signature: 0e560cb594fa76566a8fef0528bb0ce5 ****/
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
		/**** md5 signature: 41dbcb3a832ce17c367cb87aa170666d ****/
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
		/**** md5 signature: 5c90554030fe273c8d98304977406bdf ****/
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
		/**** md5 signature: 7c3fc87af77b268390ae99888fa7e5b0 ****/
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
		/**** md5 signature: 4350ab355e0160ea841c55f57912d497 ****/
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
		/**** md5 signature: ca46a64af09edf6a1f8d98a710df01b4 ****/
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
		/**** md5 signature: d26f09139b26f6f18dca7b85cb543a94 ****/
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
		/**** md5 signature: cfa8d89e44a86f9a82818f7f1cd8daa7 ****/
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
		/**** md5 signature: e09592884d78e23e95832ca7feda862f ****/
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
		/**** md5 signature: 4697ce8a095fa6dcef0217708d19718f ****/
		%feature("compactdefaultargs") ID;
		%feature("autodoc", "No available documentation.

Returns
-------
Standard_GUID
") ID;
		const Standard_GUID & ID();

		/****************** NewEmpty ******************/
		/**** md5 signature: c6d13c9ecc64c6c803b6e119e8216934 ****/
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TDF_Attribute>
") NewEmpty;
		opencascade::handle<TDF_Attribute> NewEmpty();

		/****************** Paste ******************/
		/**** md5 signature: a6ff306a759c68a191c0262635db980f ****/
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
		/**** md5 signature: f171ce811dbfb205236d26e3cbf15450 ****/
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
		/**** md5 signature: ddeae219d389a1d89eecb3e23c73522a ****/
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
		/**** md5 signature: 7751fba6a220616bf9ae6502b5400ca7 ****/
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
		/**** md5 signature: 6c38da9a5036a37e6ab684f767db21f9 ****/
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
		/**** md5 signature: 4ec8127b5d81f09b24dad6747249b629 ****/
		%feature("compactdefaultargs") TDataStd_Variable;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") TDataStd_Variable;
		 TDataStd_Variable();

		/****************** Assign ******************/
		/**** md5 signature: c451102694526ce4c4c866a33ae2be92 ****/
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "Create(if doesn't exist) and returns the assigned expression attribute. fill it after.

Returns
-------
opencascade::handle<TDataStd_Expression>
") Assign;
		opencascade::handle<TDataStd_Expression> Assign();

		/****************** Constant ******************/
		/**** md5 signature: 3dfd8bde0d2494674df91f176168b997 ****/
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
		/**** md5 signature: 8f4faa2a3ab87866fdd97cd3044ed35f ****/
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
		/**** md5 signature: 02085d2fcb8779a8d70fbdbc746f552b ****/
		%feature("compactdefaultargs") Expression;
		%feature("autodoc", "If <self> is assigned, returns associated expression attribute.

Returns
-------
opencascade::handle<TDataStd_Expression>
") Expression;
		opencascade::handle<TDataStd_Expression> Expression();

		/****************** Get ******************/
		/**** md5 signature: fc841fb28cb01367762b1d75c09d001e ****/
		%feature("compactdefaultargs") Get;
		%feature("autodoc", "Returns value stored in associated real attribute.

Returns
-------
float
") Get;
		Standard_Real Get();

		/****************** GetID ******************/
		/**** md5 signature: afe6002d90f641ca3ea8c9ae9f8fe97c ****/
		%feature("compactdefaultargs") GetID;
		%feature("autodoc", "Class methods =============.

Returns
-------
Standard_GUID
") GetID;
		static const Standard_GUID & GetID();

		/****************** ID ******************/
		/**** md5 signature: 4697ce8a095fa6dcef0217708d19718f ****/
		%feature("compactdefaultargs") ID;
		%feature("autodoc", "No available documentation.

Returns
-------
Standard_GUID
") ID;
		const Standard_GUID & ID();

		/****************** IsAssigned ******************/
		/**** md5 signature: 10514134a7a4186d1c438c2b296fef32 ****/
		%feature("compactdefaultargs") IsAssigned;
		%feature("autodoc", "Returns true if an expression attribute is associated. create(if doesn't exist), set and returns the assigned expression attribute.

Returns
-------
bool
") IsAssigned;
		Standard_Boolean IsAssigned();

		/****************** IsCaptured ******************/
		/**** md5 signature: 12ea7252bed17339127c3c98a18cb3cc ****/
		%feature("compactdefaultargs") IsCaptured;
		%feature("autodoc", "Shortcut for <real()->iscaptured()>.

Returns
-------
bool
") IsCaptured;
		Standard_Boolean IsCaptured();

		/****************** IsConstant ******************/
		/**** md5 signature: d04428c0cc470abb832fd48242d18c6c ****/
		%feature("compactdefaultargs") IsConstant;
		%feature("autodoc", "A constant value is not modified by regeneration.

Returns
-------
bool
") IsConstant;
		Standard_Boolean IsConstant();

		/****************** IsValued ******************/
		/**** md5 signature: cf4a7019aabbc1fa14b3947b82adad57 ****/
		%feature("compactdefaultargs") IsValued;
		%feature("autodoc", "Returns true if a real attribute is associated.

Returns
-------
bool
") IsValued;
		Standard_Boolean IsValued();

		/****************** Name ******************/
		/**** md5 signature: b8987714305e6d22bbd8f16f26c9c23b ****/
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
		/**** md5 signature: c14575b7951e7423490c17784a80a010 ****/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "Returns string stored in the associated name attribute.

Returns
-------
TCollection_ExtendedString
") Name;
		const TCollection_ExtendedString & Name();

		/****************** NewEmpty ******************/
		/**** md5 signature: c6d13c9ecc64c6c803b6e119e8216934 ****/
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TDF_Attribute>
") NewEmpty;
		opencascade::handle<TDF_Attribute> NewEmpty();

		/****************** Paste ******************/
		/**** md5 signature: a6ff306a759c68a191c0262635db980f ****/
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
		/**** md5 signature: c2ab2344bfa4c17273df0069e321e3a4 ****/
		%feature("compactdefaultargs") Real;
		%feature("autodoc", "Returns associated real attribute.

Returns
-------
opencascade::handle<TDataStd_Real>
") Real;
		opencascade::handle<TDataStd_Real> Real();

		/****************** References ******************/
		/**** md5 signature: f171ce811dbfb205236d26e3cbf15450 ****/
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
		/**** md5 signature: ddeae219d389a1d89eecb3e23c73522a ****/
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
		/**** md5 signature: e4af0d77170a04f8e261b9fb4c4bf390 ****/
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
		/**** md5 signature: 7072a6e28045c037cf2a8d5eac15314a ****/
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
		/**** md5 signature: 64a2cd368fbb2c0315bcac0b802a9cdb ****/
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
		/**** md5 signature: ff494f2fc5727fcec0378c41ef16d7cb ****/
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
		/**** md5 signature: dc6e549ec212bbf5cb33509a7a23a55a ****/
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
