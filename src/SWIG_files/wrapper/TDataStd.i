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
%define TDATASTDDOCSTRING
"This package defines  standard attributes for
modelling.
These allow you to create and modify labels
and attributes for many basic data types.
Standard topological and visualization
attributes have also been created.
To find an attribute attached to a specific label,
you use the GUID of the type of attribute you
are looking for. To do this, first find this
information using the method GetID as follows: Standard_GUID anID =
MyAttributeClass::GetID();
Then, use the method Find for the label as follows:
Standard_Boolean HasAttribute
=
aLabel.Find(anID,anAttribute);
Note
For information on the relations between this
component of OCAF and the others, refer to the OCAF User's Guide.

- Category: GUID - AttributeID
2a96b606-ec8b-11d0-bee7-080009dc3333	TDataStd_Integer

2a96b608-ec8b-11d0-bee7-080009dc3333	TDataStd_Name
2a96b60f-ec8b-11d0-bee7-080009dc3333	TDataStd_Real
2a96b610-ec8b-11d0-bee7-080009dc3333	TDataStd_Reference
2a96b616-ec8b-11d0-bee7-080009dc3333	TDataStd_Comment
2a96b61c-ec8b-11d0-bee7-080009dc3333  TDataStd_UAttribute
2a96b61d-ec8b-11d0-bee7-080009dc3333  TDataStd_IntegerArray
2a96b61e-ec8b-11d0-bee7-080009dc3333  TDataStd_RealArray
2a96b624-ec8b-11d0-bee7-080009dc3333  TDataStd_ExtStringArray
2a96b609-ec8b-11d0-bee7-080009dc3333	TDataStd_NoteBook
2a96b61f-ec8b-11d0-bee7-080009dc3333  TDataStd_Directory



"
%enddef
%module (package="OCC.Core", docstring=TDATASTDDOCSTRING) TDataStd

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
%include ../common/OccHandle.i


%include TDataStd_headers.i

/* typedefs */
typedef TDataStd_TreeNode * TDataStd_PtrTreeNode;
/* end typedefs declaration */

/* public enums */
enum TDataStd_RealEnum {
	TDataStd_SCALAR = 0,
	TDataStd_LENGTH = 1,
	TDataStd_ANGULAR = 2,
};

/* end public enums declaration */

%wrap_handle(TDataStd_AsciiString)
%wrap_handle(TDataStd_BooleanArray)
%wrap_handle(TDataStd_BooleanList)
%wrap_handle(TDataStd_ByteArray)
%wrap_handle(TDataStd_Comment)
%wrap_handle(TDataStd_Current)
%wrap_handle(TDataStd_DataMapNodeOfDataMapOfStringByte)
%wrap_handle(TDataStd_DataMapNodeOfDataMapOfStringHArray1OfInteger)
%wrap_handle(TDataStd_DataMapNodeOfDataMapOfStringHArray1OfReal)
%wrap_handle(TDataStd_DataMapNodeOfDataMapOfStringReal)
%wrap_handle(TDataStd_DataMapNodeOfDataMapOfStringString)
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
%wrap_handle(TDataStd_HLabelArray1)
%wrap_handle(TDataStd_IntPackedMap)
%wrap_handle(TDataStd_Integer)
%wrap_handle(TDataStd_IntegerArray)
%wrap_handle(TDataStd_IntegerList)
%wrap_handle(TDataStd_ListNodeOfListOfByte)
%wrap_handle(TDataStd_ListNodeOfListOfExtendedString)
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
		%feature("compactdefaultargs") GetID;
		%feature("autodoc", "	* class methods ============= Returns the GUID of the attribute.

	:rtype: Standard_GUID
") GetID;
		static const Standard_GUID & GetID ();
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "	* Finds, or creates an AsciiString attribute and sets the string. the AsciiString attribute is returned. AsciiString methods ===================

	:param label:
	:type label: TDF_Label &
	:param string:
	:type string: TCollection_AsciiString &
	:rtype: Handle_TDataStd_AsciiString
") Set;
		static Handle_TDataStd_AsciiString Set (const TDF_Label & label,const TCollection_AsciiString & string);
		%feature("compactdefaultargs") TDataStd_AsciiString;
		%feature("autodoc", "	:rtype: None
") TDataStd_AsciiString;
		 TDataStd_AsciiString ();
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "	:param S:
	:type S: TCollection_AsciiString &
	:rtype: None
") Set;
		void Set (const TCollection_AsciiString & S);
		%feature("compactdefaultargs") Get;
		%feature("autodoc", "	:rtype: TCollection_AsciiString
") Get;
		const TCollection_AsciiString & Get ();
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "	:rtype: bool
") IsEmpty;
		Standard_Boolean IsEmpty ();
		%feature("compactdefaultargs") ID;
		%feature("autodoc", "	:rtype: Standard_GUID
") ID;
		const Standard_GUID & ID ();
		%feature("compactdefaultargs") Restore;
		%feature("autodoc", "	:param with:
	:type with: Handle_TDF_Attribute &
	:rtype: None
") Restore;
		void Restore (const Handle_TDF_Attribute & with);
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "	:rtype: Handle_TDF_Attribute
") NewEmpty;
		Handle_TDF_Attribute NewEmpty ();
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	:param into:
	:type into: Handle_TDF_Attribute &
	:param RT:
	:type RT: Handle_TDF_RelocationTable &
	:rtype: None
") Paste;
		void Paste (const Handle_TDF_Attribute & into,const Handle_TDF_RelocationTable & RT);

        %feature("autodoc", "1");
        %extend{
            std::string DumpToString() {
            std::stringstream s;
            self->Dump(s);
            return s.str();}
        };
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
		%feature("compactdefaultargs") GetID;
		%feature("autodoc", "	* Static methods ============== Returns an ID for array.

	:rtype: Standard_GUID
") GetID;
		static const Standard_GUID & GetID ();
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "	* Finds or creates an attribute with the array.

	:param label:
	:type label: TDF_Label &
	:param lower:
	:type lower: int
	:param upper:
	:type upper: int
	:rtype: Handle_TDataStd_BooleanArray
") Set;
		static Handle_TDataStd_BooleanArray Set (const TDF_Label & label,const Standard_Integer lower,const Standard_Integer upper);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	* Initialize the inner array with bounds from <lower> to <upper>

	:param lower:
	:type lower: int
	:param upper:
	:type upper: int
	:rtype: None
") Init;
		void Init (const Standard_Integer lower,const Standard_Integer upper);
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	* Sets the <Index>th element of the array to <Value> OutOfRange exception is raised if <Index> doesn't respect Lower and Upper bounds of the internal array.

	:param index:
	:type index: int
	:param value:
	:type value: bool
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer index,const Standard_Boolean value);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	* Return the value of the <Index>th element of the array.

	:param Index:
	:type Index: int
	:rtype: bool
") Value;
		Standard_Boolean Value (const Standard_Integer Index);
		%feature("compactdefaultargs") Lower;
		%feature("autodoc", "	* Returns the lower boundary of the array.

	:rtype: int
") Lower;
		Standard_Integer Lower ();
		%feature("compactdefaultargs") Upper;
		%feature("autodoc", "	* Returns the upper boundary of the array.

	:rtype: int
") Upper;
		Standard_Integer Upper ();
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "	* Returns the number of elements in the array.

	:rtype: int
") Length;
		Standard_Integer Length ();
		%feature("compactdefaultargs") InternalArray;
		%feature("autodoc", "	:rtype: Handle_TColStd_HArray1OfByte
") InternalArray;
		Handle_TColStd_HArray1OfByte InternalArray ();
		%feature("compactdefaultargs") SetInternalArray;
		%feature("autodoc", "	:param values:
	:type values: Handle_TColStd_HArray1OfByte &
	:rtype: None
") SetInternalArray;
		void SetInternalArray (const Handle_TColStd_HArray1OfByte & values);
		%feature("compactdefaultargs") TDataStd_BooleanArray;
		%feature("autodoc", "	:rtype: None
") TDataStd_BooleanArray;
		 TDataStd_BooleanArray ();
		%feature("compactdefaultargs") ID;
		%feature("autodoc", "	:rtype: Standard_GUID
") ID;
		const Standard_GUID & ID ();
		%feature("compactdefaultargs") Restore;
		%feature("autodoc", "	:param with:
	:type with: Handle_TDF_Attribute &
	:rtype: None
") Restore;
		void Restore (const Handle_TDF_Attribute & with);
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "	:rtype: Handle_TDF_Attribute
") NewEmpty;
		Handle_TDF_Attribute NewEmpty ();
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	:param into:
	:type into: Handle_TDF_Attribute &
	:param RT:
	:type RT: Handle_TDF_RelocationTable &
	:rtype: None
") Paste;
		void Paste (const Handle_TDF_Attribute & into,const Handle_TDF_RelocationTable & RT);

        %feature("autodoc", "1");
        %extend{
            std::string DumpToString() {
            std::stringstream s;
            self->Dump(s);
            return s.str();}
        };
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
		%feature("compactdefaultargs") GetID;
		%feature("autodoc", "	* Static methods ============== Returns the ID of the list of booleans attribute.

	:rtype: Standard_GUID
") GetID;
		static const Standard_GUID & GetID ();
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "	* Finds or creates a list of boolean values attribute.

	:param label:
	:type label: TDF_Label &
	:rtype: Handle_TDataStd_BooleanList
") Set;
		static Handle_TDataStd_BooleanList Set (const TDF_Label & label);
		%feature("compactdefaultargs") TDataStd_BooleanList;
		%feature("autodoc", "	:rtype: None
") TDataStd_BooleanList;
		 TDataStd_BooleanList ();
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "	:rtype: bool
") IsEmpty;
		Standard_Boolean IsEmpty ();
		%feature("compactdefaultargs") Extent;
		%feature("autodoc", "	:rtype: int
") Extent;
		Standard_Integer Extent ();
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param value:
	:type value: bool
	:rtype: None
") Prepend;
		void Prepend (const Standard_Boolean value);
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
		%feature("compactdefaultargs") First;
		%feature("autodoc", "	:rtype: bool
") First;
		Standard_Boolean First ();
		%feature("compactdefaultargs") Last;
		%feature("autodoc", "	:rtype: bool
") Last;
		Standard_Boolean Last ();
		%feature("compactdefaultargs") List;
		%feature("autodoc", "	* 1 - means True, 0 - means False.

	:rtype: TDataStd_ListOfByte
") List;
		const TDataStd_ListOfByte & List ();
		%feature("compactdefaultargs") ID;
		%feature("autodoc", "	:rtype: Standard_GUID
") ID;
		const Standard_GUID & ID ();
		%feature("compactdefaultargs") Restore;
		%feature("autodoc", "	:param With:
	:type With: Handle_TDF_Attribute &
	:rtype: None
") Restore;
		void Restore (const Handle_TDF_Attribute & With);
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "	:rtype: Handle_TDF_Attribute
") NewEmpty;
		Handle_TDF_Attribute NewEmpty ();
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	:param Into:
	:type Into: Handle_TDF_Attribute &
	:param RT:
	:type RT: Handle_TDF_RelocationTable &
	:rtype: None
") Paste;
		void Paste (const Handle_TDF_Attribute & Into,const Handle_TDF_RelocationTable & RT);

        %feature("autodoc", "1");
        %extend{
            std::string DumpToString() {
            std::stringstream s;
            self->Dump(s);
            return s.str();}
        };
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
		%feature("compactdefaultargs") GetID;
		%feature("autodoc", "	* Static methods ============== Returns an ID for array.

	:rtype: Standard_GUID
") GetID;
		static const Standard_GUID & GetID ();
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
	:rtype: Handle_TDataStd_ByteArray
") Set;
		static Handle_TDataStd_ByteArray Set (const TDF_Label & label,const Standard_Integer lower,const Standard_Integer upper,const Standard_Boolean isDelta = Standard_False);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	* Initialize the inner array with bounds from <lower> to <upper>

	:param lower:
	:type lower: int
	:param upper:
	:type upper: int
	:rtype: None
") Init;
		void Init (const Standard_Integer lower,const Standard_Integer upper);
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	* Sets the <Index>th element of the array to <Value> OutOfRange exception is raised if <Index> doesn't respect Lower and Upper bounds of the internal array.

	:param index:
	:type index: int
	:param value:
	:type value: Standard_Byte
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer index,const Standard_Byte value);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	* Return the value of the <Index>th element of the array.

	:param Index:
	:type Index: int
	:rtype: Standard_Byte
") Value;
		Standard_Byte Value (const Standard_Integer Index);
		%feature("compactdefaultargs") Lower;
		%feature("autodoc", "	* Returns the lower boundary of the array.

	:rtype: int
") Lower;
		Standard_Integer Lower ();
		%feature("compactdefaultargs") Upper;
		%feature("autodoc", "	* Returns the upper boundary of the array.

	:rtype: int
") Upper;
		Standard_Integer Upper ();
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "	* Returns the number of elements in the array.

	:rtype: int
") Length;
		Standard_Integer Length ();
		%feature("compactdefaultargs") InternalArray;
		%feature("autodoc", "	:rtype: Handle_TColStd_HArray1OfByte
") InternalArray;
		const Handle_TColStd_HArray1OfByte InternalArray ();
		%feature("compactdefaultargs") ChangeArray;
		%feature("autodoc", "	* Sets the inner array <myValue> of the attribute to <newArray>. If value of <newArray> differs from <myValue>, Backup performed and myValue refers to new instance of HArray1OfInteger that holds <newArray> values. If <isCheckItems> equal True each item of <newArray> will be checked with each item of <myValue> for coincidence (to avoid backup).

	:param newArray:
	:type newArray: Handle_TColStd_HArray1OfByte &
	:param isCheckItems: default value is Standard_True
	:type isCheckItems: bool
	:rtype: None
") ChangeArray;
		void ChangeArray (const Handle_TColStd_HArray1OfByte & newArray,const Standard_Boolean isCheckItems = Standard_True);
		%feature("compactdefaultargs") GetDelta;
		%feature("autodoc", "	:rtype: bool
") GetDelta;
		Standard_Boolean GetDelta ();
		%feature("compactdefaultargs") SetDelta;
		%feature("autodoc", "	* for internal use only!

	:param isDelta:
	:type isDelta: bool
	:rtype: None
") SetDelta;
		void SetDelta (const Standard_Boolean isDelta);
		%feature("compactdefaultargs") TDataStd_ByteArray;
		%feature("autodoc", "	:rtype: None
") TDataStd_ByteArray;
		 TDataStd_ByteArray ();
		%feature("compactdefaultargs") ID;
		%feature("autodoc", "	:rtype: Standard_GUID
") ID;
		const Standard_GUID & ID ();
		%feature("compactdefaultargs") Restore;
		%feature("autodoc", "	:param with:
	:type with: Handle_TDF_Attribute &
	:rtype: None
") Restore;
		void Restore (const Handle_TDF_Attribute & with);
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "	:rtype: Handle_TDF_Attribute
") NewEmpty;
		Handle_TDF_Attribute NewEmpty ();
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	:param into:
	:type into: Handle_TDF_Attribute &
	:param RT:
	:type RT: Handle_TDF_RelocationTable &
	:rtype: None
") Paste;
		void Paste (const Handle_TDF_Attribute & into,const Handle_TDF_RelocationTable & RT);

        %feature("autodoc", "1");
        %extend{
            std::string DumpToString() {
            std::stringstream s;
            self->Dump(s);
            return s.str();}
        };
        		%feature("compactdefaultargs") DeltaOnModification;
		%feature("autodoc", "	* Makes a DeltaOnModification between <self> and <anOldAttribute>.

	:param anOldAttribute:
	:type anOldAttribute: Handle_TDF_Attribute &
	:rtype: Handle_TDF_DeltaOnModification
") DeltaOnModification;
		virtual Handle_TDF_DeltaOnModification DeltaOnModification (const Handle_TDF_Attribute & anOldAttribute);
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
		%feature("compactdefaultargs") TDataStd_ChildNodeIterator;
		%feature("autodoc", "	* Creates an empty iterator.

	:rtype: None
") TDataStd_ChildNodeIterator;
		 TDataStd_ChildNodeIterator ();
		%feature("compactdefaultargs") TDataStd_ChildNodeIterator;
		%feature("autodoc", "	* Iterates on the ChildStepren of the given Step. If <allLevels> option is set to true, it explores not only the first, but all the sub Step levels.

	:param aTreeNode:
	:type aTreeNode: Handle_TDataStd_TreeNode &
	:param allLevels: default value is Standard_False
	:type allLevels: bool
	:rtype: None
") TDataStd_ChildNodeIterator;
		 TDataStd_ChildNodeIterator (const Handle_TDataStd_TreeNode & aTreeNode,const Standard_Boolean allLevels = Standard_False);
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "	* Initializes the iteration on the Children Step of the given Step. If <allLevels> option is set to true, it explores not only the first, but all the sub Step levels.

	:param aTreeNode:
	:type aTreeNode: Handle_TDataStd_TreeNode &
	:param allLevels: default value is Standard_False
	:type allLevels: bool
	:rtype: None
") Initialize;
		void Initialize (const Handle_TDataStd_TreeNode & aTreeNode,const Standard_Boolean allLevels = Standard_False);
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
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	* Returns the current item; a null Step if there is no one.

	:rtype: Handle_TDataStd_TreeNode
") Value;
		Handle_TDataStd_TreeNode Value ();
};


%extend TDataStd_ChildNodeIterator {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TDataStd_Comment;
class TDataStd_Comment : public TDF_Attribute {
	public:
		%feature("compactdefaultargs") GetID;
		%feature("autodoc", "	* class methods ============= Returns the GUID for comments.

	:rtype: Standard_GUID
") GetID;
		static const Standard_GUID & GetID ();
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "	* Find, or create a Comment attribute. the Comment attribute is returned.

	:param label:
	:type label: TDF_Label &
	:rtype: Handle_TDataStd_Comment
") Set;
		static Handle_TDataStd_Comment Set (const TDF_Label & label);
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "	* Finds, or creates a Comment attribute and sets the string. the Comment attribute is returned. Comment methods ============

	:param label:
	:type label: TDF_Label &
	:param string:
	:type string: TCollection_ExtendedString &
	:rtype: Handle_TDataStd_Comment
") Set;
		static Handle_TDataStd_Comment Set (const TDF_Label & label,const TCollection_ExtendedString & string);
		%feature("compactdefaultargs") TDataStd_Comment;
		%feature("autodoc", "	:rtype: None
") TDataStd_Comment;
		 TDataStd_Comment ();
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "	:param S:
	:type S: TCollection_ExtendedString &
	:rtype: None
") Set;
		void Set (const TCollection_ExtendedString & S);
		%feature("compactdefaultargs") Get;
		%feature("autodoc", "	* Returns the comment attribute.

	:rtype: TCollection_ExtendedString
") Get;
		const TCollection_ExtendedString & Get ();
		%feature("compactdefaultargs") ID;
		%feature("autodoc", "	:rtype: Standard_GUID
") ID;
		const Standard_GUID & ID ();
		%feature("compactdefaultargs") Restore;
		%feature("autodoc", "	:param with:
	:type with: Handle_TDF_Attribute &
	:rtype: None
") Restore;
		void Restore (const Handle_TDF_Attribute & with);
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "	:rtype: Handle_TDF_Attribute
") NewEmpty;
		Handle_TDF_Attribute NewEmpty ();
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	:param into:
	:type into: Handle_TDF_Attribute &
	:param RT:
	:type RT: Handle_TDF_RelocationTable &
	:rtype: None
") Paste;
		void Paste (const Handle_TDF_Attribute & into,const Handle_TDF_RelocationTable & RT);

        %feature("autodoc", "1");
        %extend{
            std::string DumpToString() {
            std::stringstream s;
            self->Dump(s);
            return s.str();}
        };
        		%feature("compactdefaultargs") AfterRetrieval;
		%feature("autodoc", "	:param forceIt: default value is Standard_False
	:type forceIt: bool
	:rtype: bool
") AfterRetrieval;
		Standard_Boolean AfterRetrieval (const Standard_Boolean forceIt = Standard_False);
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
		%feature("compactdefaultargs") GetID;
		%feature("autodoc", "	* class methods =============

	:rtype: Standard_GUID
") GetID;
		static const Standard_GUID & GetID ();
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "	* Set <L> as current of <L> Framework.

	:param L:
	:type L: TDF_Label &
	:rtype: void
") Set;
		static void Set (const TDF_Label & L);
		%feature("compactdefaultargs") Get;
		%feature("autodoc", "	* returns current of <acces> Framework. raise if (!Has)

	:param acces:
	:type acces: TDF_Label &
	:rtype: TDF_Label
") Get;
		static TDF_Label Get (const TDF_Label & acces);
		%feature("compactdefaultargs") Has;
		%feature("autodoc", "	* returns True if a current label is managed in <acces> Framework. class methods =============

	:param acces:
	:type acces: TDF_Label &
	:rtype: bool
") Has;
		static Standard_Boolean Has (const TDF_Label & acces);
		%feature("compactdefaultargs") TDataStd_Current;
		%feature("autodoc", "	:rtype: None
") TDataStd_Current;
		 TDataStd_Current ();
		%feature("compactdefaultargs") SetLabel;
		%feature("autodoc", "	:param current:
	:type current: TDF_Label &
	:rtype: None
") SetLabel;
		void SetLabel (const TDF_Label & current);
		%feature("compactdefaultargs") GetLabel;
		%feature("autodoc", "	:rtype: TDF_Label
") GetLabel;
		TDF_Label GetLabel ();
		%feature("compactdefaultargs") ID;
		%feature("autodoc", "	:rtype: Standard_GUID
") ID;
		const Standard_GUID & ID ();
		%feature("compactdefaultargs") Restore;
		%feature("autodoc", "	:param With:
	:type With: Handle_TDF_Attribute &
	:rtype: None
") Restore;
		void Restore (const Handle_TDF_Attribute & With);
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "	:rtype: Handle_TDF_Attribute
") NewEmpty;
		Handle_TDF_Attribute NewEmpty ();
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	:param Into:
	:type Into: Handle_TDF_Attribute &
	:param RT:
	:type RT: Handle_TDF_RelocationTable &
	:rtype: None
") Paste;
		void Paste (const Handle_TDF_Attribute & Into,const Handle_TDF_RelocationTable & RT);

        %feature("autodoc", "1");
        %extend{
            std::string DumpToString() {
            std::stringstream s;
            self->Dump(s);
            return s.str();}
        };
        };


%make_alias(TDataStd_Current)

%extend TDataStd_Current {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TDataStd_DataMapIteratorOfDataMapOfStringByte;
class TDataStd_DataMapIteratorOfDataMapOfStringByte : public TCollection_BasicMapIterator {
	public:
		%feature("compactdefaultargs") TDataStd_DataMapIteratorOfDataMapOfStringByte;
		%feature("autodoc", "	:rtype: None
") TDataStd_DataMapIteratorOfDataMapOfStringByte;
		 TDataStd_DataMapIteratorOfDataMapOfStringByte ();
		%feature("compactdefaultargs") TDataStd_DataMapIteratorOfDataMapOfStringByte;
		%feature("autodoc", "	:param aMap:
	:type aMap: TDataStd_DataMapOfStringByte &
	:rtype: None
") TDataStd_DataMapIteratorOfDataMapOfStringByte;
		 TDataStd_DataMapIteratorOfDataMapOfStringByte (const TDataStd_DataMapOfStringByte & aMap);
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "	:param aMap:
	:type aMap: TDataStd_DataMapOfStringByte &
	:rtype: None
") Initialize;
		void Initialize (const TDataStd_DataMapOfStringByte & aMap);
		%feature("compactdefaultargs") Key;
		%feature("autodoc", "	:rtype: TCollection_ExtendedString
") Key;
		const TCollection_ExtendedString & Key ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: Standard_Byte
") Value;
		const Standard_Byte & Value ();
};


%extend TDataStd_DataMapIteratorOfDataMapOfStringByte {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TDataStd_DataMapIteratorOfDataMapOfStringHArray1OfInteger;
class TDataStd_DataMapIteratorOfDataMapOfStringHArray1OfInteger : public TCollection_BasicMapIterator {
	public:
		%feature("compactdefaultargs") TDataStd_DataMapIteratorOfDataMapOfStringHArray1OfInteger;
		%feature("autodoc", "	:rtype: None
") TDataStd_DataMapIteratorOfDataMapOfStringHArray1OfInteger;
		 TDataStd_DataMapIteratorOfDataMapOfStringHArray1OfInteger ();
		%feature("compactdefaultargs") TDataStd_DataMapIteratorOfDataMapOfStringHArray1OfInteger;
		%feature("autodoc", "	:param aMap:
	:type aMap: TDataStd_DataMapOfStringHArray1OfInteger &
	:rtype: None
") TDataStd_DataMapIteratorOfDataMapOfStringHArray1OfInteger;
		 TDataStd_DataMapIteratorOfDataMapOfStringHArray1OfInteger (const TDataStd_DataMapOfStringHArray1OfInteger & aMap);
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "	:param aMap:
	:type aMap: TDataStd_DataMapOfStringHArray1OfInteger &
	:rtype: None
") Initialize;
		void Initialize (const TDataStd_DataMapOfStringHArray1OfInteger & aMap);
		%feature("compactdefaultargs") Key;
		%feature("autodoc", "	:rtype: TCollection_ExtendedString
") Key;
		const TCollection_ExtendedString & Key ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: Handle_TColStd_HArray1OfInteger
") Value;
		Handle_TColStd_HArray1OfInteger Value ();
};



%extend TDataStd_DataMapIteratorOfDataMapOfStringHArray1OfInteger {
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
            self.current +=1
        return self.Value(self.current)

    __next__ = next

    }
};
%extend TDataStd_DataMapIteratorOfDataMapOfStringHArray1OfInteger {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TDataStd_DataMapIteratorOfDataMapOfStringHArray1OfReal;
class TDataStd_DataMapIteratorOfDataMapOfStringHArray1OfReal : public TCollection_BasicMapIterator {
	public:
		%feature("compactdefaultargs") TDataStd_DataMapIteratorOfDataMapOfStringHArray1OfReal;
		%feature("autodoc", "	:rtype: None
") TDataStd_DataMapIteratorOfDataMapOfStringHArray1OfReal;
		 TDataStd_DataMapIteratorOfDataMapOfStringHArray1OfReal ();
		%feature("compactdefaultargs") TDataStd_DataMapIteratorOfDataMapOfStringHArray1OfReal;
		%feature("autodoc", "	:param aMap:
	:type aMap: TDataStd_DataMapOfStringHArray1OfReal &
	:rtype: None
") TDataStd_DataMapIteratorOfDataMapOfStringHArray1OfReal;
		 TDataStd_DataMapIteratorOfDataMapOfStringHArray1OfReal (const TDataStd_DataMapOfStringHArray1OfReal & aMap);
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "	:param aMap:
	:type aMap: TDataStd_DataMapOfStringHArray1OfReal &
	:rtype: None
") Initialize;
		void Initialize (const TDataStd_DataMapOfStringHArray1OfReal & aMap);
		%feature("compactdefaultargs") Key;
		%feature("autodoc", "	:rtype: TCollection_ExtendedString
") Key;
		const TCollection_ExtendedString & Key ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: Handle_TColStd_HArray1OfReal
") Value;
		Handle_TColStd_HArray1OfReal Value ();
};



%extend TDataStd_DataMapIteratorOfDataMapOfStringHArray1OfReal {
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
            self.current +=1
        return self.Value(self.current)

    __next__ = next

    }
};
%extend TDataStd_DataMapIteratorOfDataMapOfStringHArray1OfReal {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TDataStd_DataMapIteratorOfDataMapOfStringReal;
class TDataStd_DataMapIteratorOfDataMapOfStringReal : public TCollection_BasicMapIterator {
	public:
		%feature("compactdefaultargs") TDataStd_DataMapIteratorOfDataMapOfStringReal;
		%feature("autodoc", "	:rtype: None
") TDataStd_DataMapIteratorOfDataMapOfStringReal;
		 TDataStd_DataMapIteratorOfDataMapOfStringReal ();
		%feature("compactdefaultargs") TDataStd_DataMapIteratorOfDataMapOfStringReal;
		%feature("autodoc", "	:param aMap:
	:type aMap: TDataStd_DataMapOfStringReal &
	:rtype: None
") TDataStd_DataMapIteratorOfDataMapOfStringReal;
		 TDataStd_DataMapIteratorOfDataMapOfStringReal (const TDataStd_DataMapOfStringReal & aMap);
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "	:param aMap:
	:type aMap: TDataStd_DataMapOfStringReal &
	:rtype: None
") Initialize;
		void Initialize (const TDataStd_DataMapOfStringReal & aMap);
		%feature("compactdefaultargs") Key;
		%feature("autodoc", "	:rtype: TCollection_ExtendedString
") Key;
		const TCollection_ExtendedString & Key ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: float
") Value;
		const Standard_Real & Value ();
};


%extend TDataStd_DataMapIteratorOfDataMapOfStringReal {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TDataStd_DataMapIteratorOfDataMapOfStringString;
class TDataStd_DataMapIteratorOfDataMapOfStringString : public TCollection_BasicMapIterator {
	public:
		%feature("compactdefaultargs") TDataStd_DataMapIteratorOfDataMapOfStringString;
		%feature("autodoc", "	:rtype: None
") TDataStd_DataMapIteratorOfDataMapOfStringString;
		 TDataStd_DataMapIteratorOfDataMapOfStringString ();
		%feature("compactdefaultargs") TDataStd_DataMapIteratorOfDataMapOfStringString;
		%feature("autodoc", "	:param aMap:
	:type aMap: TDataStd_DataMapOfStringString &
	:rtype: None
") TDataStd_DataMapIteratorOfDataMapOfStringString;
		 TDataStd_DataMapIteratorOfDataMapOfStringString (const TDataStd_DataMapOfStringString & aMap);
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "	:param aMap:
	:type aMap: TDataStd_DataMapOfStringString &
	:rtype: None
") Initialize;
		void Initialize (const TDataStd_DataMapOfStringString & aMap);
		%feature("compactdefaultargs") Key;
		%feature("autodoc", "	:rtype: TCollection_ExtendedString
") Key;
		const TCollection_ExtendedString & Key ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: TCollection_ExtendedString
") Value;
		const TCollection_ExtendedString & Value ();
};


%extend TDataStd_DataMapIteratorOfDataMapOfStringString {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TDataStd_DataMapNodeOfDataMapOfStringByte;
class TDataStd_DataMapNodeOfDataMapOfStringByte : public TCollection_MapNode {
	public:
		%feature("compactdefaultargs") TDataStd_DataMapNodeOfDataMapOfStringByte;
		%feature("autodoc", "	:param K:
	:type K: TCollection_ExtendedString &
	:param I:
	:type I: Standard_Byte &
	:param n:
	:type n: TCollection_MapNodePtr &
	:rtype: None
") TDataStd_DataMapNodeOfDataMapOfStringByte;
		 TDataStd_DataMapNodeOfDataMapOfStringByte (const TCollection_ExtendedString & K,const Standard_Byte & I,const TCollection_MapNodePtr & n);
		%feature("compactdefaultargs") Key;
		%feature("autodoc", "	:rtype: TCollection_ExtendedString
") Key;
		TCollection_ExtendedString & Key ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: Standard_Byte
") Value;
		Standard_Byte & Value ();
};


%make_alias(TDataStd_DataMapNodeOfDataMapOfStringByte)

%extend TDataStd_DataMapNodeOfDataMapOfStringByte {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TDataStd_DataMapNodeOfDataMapOfStringHArray1OfInteger;
class TDataStd_DataMapNodeOfDataMapOfStringHArray1OfInteger : public TCollection_MapNode {
	public:
		%feature("compactdefaultargs") TDataStd_DataMapNodeOfDataMapOfStringHArray1OfInteger;
		%feature("autodoc", "	:param K:
	:type K: TCollection_ExtendedString &
	:param I:
	:type I: Handle_TColStd_HArray1OfInteger &
	:param n:
	:type n: TCollection_MapNodePtr &
	:rtype: None
") TDataStd_DataMapNodeOfDataMapOfStringHArray1OfInteger;
		 TDataStd_DataMapNodeOfDataMapOfStringHArray1OfInteger (const TCollection_ExtendedString & K,const Handle_TColStd_HArray1OfInteger & I,const TCollection_MapNodePtr & n);
		%feature("compactdefaultargs") Key;
		%feature("autodoc", "	:rtype: TCollection_ExtendedString
") Key;
		TCollection_ExtendedString & Key ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: Handle_TColStd_HArray1OfInteger
") Value;
		Handle_TColStd_HArray1OfInteger Value ();
};


%make_alias(TDataStd_DataMapNodeOfDataMapOfStringHArray1OfInteger)


%extend TDataStd_DataMapNodeOfDataMapOfStringHArray1OfInteger {
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
            self.current +=1
        return self.Value(self.current)

    __next__ = next

    }
};
%extend TDataStd_DataMapNodeOfDataMapOfStringHArray1OfInteger {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TDataStd_DataMapNodeOfDataMapOfStringHArray1OfReal;
class TDataStd_DataMapNodeOfDataMapOfStringHArray1OfReal : public TCollection_MapNode {
	public:
		%feature("compactdefaultargs") TDataStd_DataMapNodeOfDataMapOfStringHArray1OfReal;
		%feature("autodoc", "	:param K:
	:type K: TCollection_ExtendedString &
	:param I:
	:type I: Handle_TColStd_HArray1OfReal &
	:param n:
	:type n: TCollection_MapNodePtr &
	:rtype: None
") TDataStd_DataMapNodeOfDataMapOfStringHArray1OfReal;
		 TDataStd_DataMapNodeOfDataMapOfStringHArray1OfReal (const TCollection_ExtendedString & K,const Handle_TColStd_HArray1OfReal & I,const TCollection_MapNodePtr & n);
		%feature("compactdefaultargs") Key;
		%feature("autodoc", "	:rtype: TCollection_ExtendedString
") Key;
		TCollection_ExtendedString & Key ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: Handle_TColStd_HArray1OfReal
") Value;
		Handle_TColStd_HArray1OfReal Value ();
};


%make_alias(TDataStd_DataMapNodeOfDataMapOfStringHArray1OfReal)


%extend TDataStd_DataMapNodeOfDataMapOfStringHArray1OfReal {
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
            self.current +=1
        return self.Value(self.current)

    __next__ = next

    }
};
%extend TDataStd_DataMapNodeOfDataMapOfStringHArray1OfReal {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TDataStd_DataMapNodeOfDataMapOfStringReal;
class TDataStd_DataMapNodeOfDataMapOfStringReal : public TCollection_MapNode {
	public:
		%feature("compactdefaultargs") TDataStd_DataMapNodeOfDataMapOfStringReal;
		%feature("autodoc", "	:param K:
	:type K: TCollection_ExtendedString &
	:param I:
	:type I: float &
	:param n:
	:type n: TCollection_MapNodePtr &
	:rtype: None
") TDataStd_DataMapNodeOfDataMapOfStringReal;
		 TDataStd_DataMapNodeOfDataMapOfStringReal (const TCollection_ExtendedString & K,const Standard_Real & I,const TCollection_MapNodePtr & n);
		%feature("compactdefaultargs") Key;
		%feature("autodoc", "	:rtype: TCollection_ExtendedString
") Key;
		TCollection_ExtendedString & Key ();

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


%make_alias(TDataStd_DataMapNodeOfDataMapOfStringReal)

%extend TDataStd_DataMapNodeOfDataMapOfStringReal {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TDataStd_DataMapNodeOfDataMapOfStringString;
class TDataStd_DataMapNodeOfDataMapOfStringString : public TCollection_MapNode {
	public:
		%feature("compactdefaultargs") TDataStd_DataMapNodeOfDataMapOfStringString;
		%feature("autodoc", "	:param K:
	:type K: TCollection_ExtendedString &
	:param I:
	:type I: TCollection_ExtendedString &
	:param n:
	:type n: TCollection_MapNodePtr &
	:rtype: None
") TDataStd_DataMapNodeOfDataMapOfStringString;
		 TDataStd_DataMapNodeOfDataMapOfStringString (const TCollection_ExtendedString & K,const TCollection_ExtendedString & I,const TCollection_MapNodePtr & n);
		%feature("compactdefaultargs") Key;
		%feature("autodoc", "	:rtype: TCollection_ExtendedString
") Key;
		TCollection_ExtendedString & Key ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: TCollection_ExtendedString
") Value;
		TCollection_ExtendedString & Value ();
};


%make_alias(TDataStd_DataMapNodeOfDataMapOfStringString)

%extend TDataStd_DataMapNodeOfDataMapOfStringString {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TDataStd_DataMapOfStringByte;
class TDataStd_DataMapOfStringByte : public TCollection_BasicMap {
	public:
		%feature("compactdefaultargs") TDataStd_DataMapOfStringByte;
		%feature("autodoc", "	:param NbBuckets: default value is 1
	:type NbBuckets: int
	:rtype: None
") TDataStd_DataMapOfStringByte;
		 TDataStd_DataMapOfStringByte (const Standard_Integer NbBuckets = 1);
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: TDataStd_DataMapOfStringByte &
	:rtype: TDataStd_DataMapOfStringByte
") Assign;
		TDataStd_DataMapOfStringByte & Assign (const TDataStd_DataMapOfStringByte & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: TDataStd_DataMapOfStringByte &
	:rtype: TDataStd_DataMapOfStringByte
") operator =;
		TDataStd_DataMapOfStringByte & operator = (const TDataStd_DataMapOfStringByte & Other);
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
	:type I: Standard_Byte &
	:rtype: bool
") Bind;
		Standard_Boolean Bind (const TCollection_ExtendedString & K,const Standard_Byte & I);
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
	:rtype: Standard_Byte
") Find;
		const Standard_Byte & Find (const TCollection_ExtendedString & K);
		%feature("compactdefaultargs") ChangeFind;
		%feature("autodoc", "	:param K:
	:type K: TCollection_ExtendedString &
	:rtype: Standard_Byte
") ChangeFind;
		Standard_Byte & ChangeFind (const TCollection_ExtendedString & K);
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


%extend TDataStd_DataMapOfStringByte {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TDataStd_DataMapOfStringHArray1OfInteger;
class TDataStd_DataMapOfStringHArray1OfInteger : public TCollection_BasicMap {
	public:
		%feature("compactdefaultargs") TDataStd_DataMapOfStringHArray1OfInteger;
		%feature("autodoc", "	:param NbBuckets: default value is 1
	:type NbBuckets: int
	:rtype: None
") TDataStd_DataMapOfStringHArray1OfInteger;
		 TDataStd_DataMapOfStringHArray1OfInteger (const Standard_Integer NbBuckets = 1);
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: TDataStd_DataMapOfStringHArray1OfInteger &
	:rtype: TDataStd_DataMapOfStringHArray1OfInteger
") Assign;
		TDataStd_DataMapOfStringHArray1OfInteger & Assign (const TDataStd_DataMapOfStringHArray1OfInteger & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: TDataStd_DataMapOfStringHArray1OfInteger &
	:rtype: TDataStd_DataMapOfStringHArray1OfInteger
") operator =;
		TDataStd_DataMapOfStringHArray1OfInteger & operator = (const TDataStd_DataMapOfStringHArray1OfInteger & Other);
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
	:type I: Handle_TColStd_HArray1OfInteger &
	:rtype: bool
") Bind;
		Standard_Boolean Bind (const TCollection_ExtendedString & K,const Handle_TColStd_HArray1OfInteger & I);
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
	:rtype: Handle_TColStd_HArray1OfInteger
") Find;
		Handle_TColStd_HArray1OfInteger Find (const TCollection_ExtendedString & K);
		%feature("compactdefaultargs") ChangeFind;
		%feature("autodoc", "	:param K:
	:type K: TCollection_ExtendedString &
	:rtype: Handle_TColStd_HArray1OfInteger
") ChangeFind;
		Handle_TColStd_HArray1OfInteger ChangeFind (const TCollection_ExtendedString & K);
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



%extend TDataStd_DataMapOfStringHArray1OfInteger {
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
            self.current +=1
        return self.Value(self.current)

    __next__ = next

    }
};
%extend TDataStd_DataMapOfStringHArray1OfInteger {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TDataStd_DataMapOfStringHArray1OfReal;
class TDataStd_DataMapOfStringHArray1OfReal : public TCollection_BasicMap {
	public:
		%feature("compactdefaultargs") TDataStd_DataMapOfStringHArray1OfReal;
		%feature("autodoc", "	:param NbBuckets: default value is 1
	:type NbBuckets: int
	:rtype: None
") TDataStd_DataMapOfStringHArray1OfReal;
		 TDataStd_DataMapOfStringHArray1OfReal (const Standard_Integer NbBuckets = 1);
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: TDataStd_DataMapOfStringHArray1OfReal &
	:rtype: TDataStd_DataMapOfStringHArray1OfReal
") Assign;
		TDataStd_DataMapOfStringHArray1OfReal & Assign (const TDataStd_DataMapOfStringHArray1OfReal & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: TDataStd_DataMapOfStringHArray1OfReal &
	:rtype: TDataStd_DataMapOfStringHArray1OfReal
") operator =;
		TDataStd_DataMapOfStringHArray1OfReal & operator = (const TDataStd_DataMapOfStringHArray1OfReal & Other);
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
	:type I: Handle_TColStd_HArray1OfReal &
	:rtype: bool
") Bind;
		Standard_Boolean Bind (const TCollection_ExtendedString & K,const Handle_TColStd_HArray1OfReal & I);
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
	:rtype: Handle_TColStd_HArray1OfReal
") Find;
		Handle_TColStd_HArray1OfReal Find (const TCollection_ExtendedString & K);
		%feature("compactdefaultargs") ChangeFind;
		%feature("autodoc", "	:param K:
	:type K: TCollection_ExtendedString &
	:rtype: Handle_TColStd_HArray1OfReal
") ChangeFind;
		Handle_TColStd_HArray1OfReal ChangeFind (const TCollection_ExtendedString & K);
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



%extend TDataStd_DataMapOfStringHArray1OfReal {
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
            self.current +=1
        return self.Value(self.current)

    __next__ = next

    }
};
%extend TDataStd_DataMapOfStringHArray1OfReal {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TDataStd_DataMapOfStringReal;
class TDataStd_DataMapOfStringReal : public TCollection_BasicMap {
	public:
		%feature("compactdefaultargs") TDataStd_DataMapOfStringReal;
		%feature("autodoc", "	:param NbBuckets: default value is 1
	:type NbBuckets: int
	:rtype: None
") TDataStd_DataMapOfStringReal;
		 TDataStd_DataMapOfStringReal (const Standard_Integer NbBuckets = 1);
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: TDataStd_DataMapOfStringReal &
	:rtype: TDataStd_DataMapOfStringReal
") Assign;
		TDataStd_DataMapOfStringReal & Assign (const TDataStd_DataMapOfStringReal & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: TDataStd_DataMapOfStringReal &
	:rtype: TDataStd_DataMapOfStringReal
") operator =;
		TDataStd_DataMapOfStringReal & operator = (const TDataStd_DataMapOfStringReal & Other);
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
	:type I: float &
	:rtype: bool
") Bind;
		Standard_Boolean Bind (const TCollection_ExtendedString & K,const Standard_Real & I);
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
	:rtype: float
") Find;
		const Standard_Real & Find (const TCollection_ExtendedString & K);
		%feature("compactdefaultargs") ChangeFind;
		%feature("autodoc", "	:param K:
	:type K: TCollection_ExtendedString &
	:rtype: float
") ChangeFind;
		Standard_Real & ChangeFind (const TCollection_ExtendedString & K);
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


%extend TDataStd_DataMapOfStringReal {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TDataStd_DataMapOfStringString;
class TDataStd_DataMapOfStringString : public TCollection_BasicMap {
	public:
		%feature("compactdefaultargs") TDataStd_DataMapOfStringString;
		%feature("autodoc", "	:param NbBuckets: default value is 1
	:type NbBuckets: int
	:rtype: None
") TDataStd_DataMapOfStringString;
		 TDataStd_DataMapOfStringString (const Standard_Integer NbBuckets = 1);
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: TDataStd_DataMapOfStringString &
	:rtype: TDataStd_DataMapOfStringString
") Assign;
		TDataStd_DataMapOfStringString & Assign (const TDataStd_DataMapOfStringString & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: TDataStd_DataMapOfStringString &
	:rtype: TDataStd_DataMapOfStringString
") operator =;
		TDataStd_DataMapOfStringString & operator = (const TDataStd_DataMapOfStringString & Other);
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
	:type I: TCollection_ExtendedString &
	:rtype: bool
") Bind;
		Standard_Boolean Bind (const TCollection_ExtendedString & K,const TCollection_ExtendedString & I);
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
	:rtype: TCollection_ExtendedString
") Find;
		const TCollection_ExtendedString & Find (const TCollection_ExtendedString & K);
		%feature("compactdefaultargs") ChangeFind;
		%feature("autodoc", "	:param K:
	:type K: TCollection_ExtendedString &
	:rtype: TCollection_ExtendedString
") ChangeFind;
		TCollection_ExtendedString & ChangeFind (const TCollection_ExtendedString & K);
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


%extend TDataStd_DataMapOfStringString {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TDataStd_DeltaOnModificationOfByteArray;
class TDataStd_DeltaOnModificationOfByteArray : public TDF_DeltaOnModification {
	public:
		%feature("compactdefaultargs") TDataStd_DeltaOnModificationOfByteArray;
		%feature("autodoc", "	* Initializes a TDF_DeltaOnModification.

	:param Arr:
	:type Arr: Handle_TDataStd_ByteArray &
	:rtype: None
") TDataStd_DeltaOnModificationOfByteArray;
		 TDataStd_DeltaOnModificationOfByteArray (const Handle_TDataStd_ByteArray & Arr);
		%feature("compactdefaultargs") Apply;
		%feature("autodoc", "	* Applies the delta to the attribute.

	:rtype: void
") Apply;
		virtual void Apply ();
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
		%feature("compactdefaultargs") TDataStd_DeltaOnModificationOfExtStringArray;
		%feature("autodoc", "	* Initializes a TDF_DeltaOnModification.

	:param Arr:
	:type Arr: Handle_TDataStd_ExtStringArray &
	:rtype: None
") TDataStd_DeltaOnModificationOfExtStringArray;
		 TDataStd_DeltaOnModificationOfExtStringArray (const Handle_TDataStd_ExtStringArray & Arr);
		%feature("compactdefaultargs") Apply;
		%feature("autodoc", "	* Applies the delta to the attribute.

	:rtype: void
") Apply;
		virtual void Apply ();
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
		%feature("compactdefaultargs") TDataStd_DeltaOnModificationOfIntArray;
		%feature("autodoc", "	* Initializes a TDF_DeltaOnModification.

	:param Arr:
	:type Arr: Handle_TDataStd_IntegerArray &
	:rtype: None
") TDataStd_DeltaOnModificationOfIntArray;
		 TDataStd_DeltaOnModificationOfIntArray (const Handle_TDataStd_IntegerArray & Arr);
		%feature("compactdefaultargs") Apply;
		%feature("autodoc", "	* Applies the delta to the attribute.

	:rtype: void
") Apply;
		virtual void Apply ();
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
		%feature("compactdefaultargs") TDataStd_DeltaOnModificationOfIntPackedMap;
		%feature("autodoc", "	* Initializes a TDF_DeltaOnModification.

	:param Arr:
	:type Arr: Handle_TDataStd_IntPackedMap &
	:rtype: None
") TDataStd_DeltaOnModificationOfIntPackedMap;
		 TDataStd_DeltaOnModificationOfIntPackedMap (const Handle_TDataStd_IntPackedMap & Arr);
		%feature("compactdefaultargs") Apply;
		%feature("autodoc", "	* Applies the delta to the attribute.

	:rtype: void
") Apply;
		virtual void Apply ();
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
		%feature("compactdefaultargs") TDataStd_DeltaOnModificationOfRealArray;
		%feature("autodoc", "	* Initializes a TDF_DeltaOnModification.

	:param Arr:
	:type Arr: Handle_TDataStd_RealArray &
	:rtype: None
") TDataStd_DeltaOnModificationOfRealArray;
		 TDataStd_DeltaOnModificationOfRealArray (const Handle_TDataStd_RealArray & Arr);
		%feature("compactdefaultargs") Apply;
		%feature("autodoc", "	* Applies the delta to the attribute.

	:rtype: void
") Apply;
		virtual void Apply ();
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
		%feature("compactdefaultargs") Find;
		%feature("autodoc", "	* class methods ============= Searches for a directory attribute on the label current, or on one of the father labels of current. If a directory attribute is found, true is returned, and the attribute found is set as D.

	:param current:
	:type current: TDF_Label &
	:param D:
	:type D: Handle_TDataStd_Directory &
	:rtype: bool
") Find;
		static Standard_Boolean Find (const TDF_Label & current,Handle_TDataStd_Directory & D);
		%feature("compactdefaultargs") New;
		%feature("autodoc", "	* Creates an enpty Directory attribute, located at <label>. Raises if <label> has attribute

	:param label:
	:type label: TDF_Label &
	:rtype: Handle_TDataStd_Directory
") New;
		static Handle_TDataStd_Directory New (const TDF_Label & label);
		%feature("compactdefaultargs") AddDirectory;
		%feature("autodoc", "	* Creates a new sub-label and sets the sub-directory dir on that label.

	:param dir:
	:type dir: Handle_TDataStd_Directory &
	:rtype: Handle_TDataStd_Directory
") AddDirectory;
		static Handle_TDataStd_Directory AddDirectory (const Handle_TDataStd_Directory & dir);
		%feature("compactdefaultargs") MakeObjectLabel;
		%feature("autodoc", "	* Makes new label and returns it to insert other object attributes (sketch,part...etc...)

	:param dir:
	:type dir: Handle_TDataStd_Directory &
	:rtype: TDF_Label
") MakeObjectLabel;
		static TDF_Label MakeObjectLabel (const Handle_TDataStd_Directory & dir);
		%feature("compactdefaultargs") GetID;
		%feature("autodoc", "	* Directory methods ===============

	:rtype: Standard_GUID
") GetID;
		static const Standard_GUID & GetID ();
		%feature("compactdefaultargs") TDataStd_Directory;
		%feature("autodoc", "	:rtype: None
") TDataStd_Directory;
		 TDataStd_Directory ();
		%feature("compactdefaultargs") ID;
		%feature("autodoc", "	:rtype: Standard_GUID
") ID;
		const Standard_GUID & ID ();
		%feature("compactdefaultargs") Restore;
		%feature("autodoc", "	:param with:
	:type with: Handle_TDF_Attribute &
	:rtype: None
") Restore;
		void Restore (const Handle_TDF_Attribute & with);
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "	:rtype: Handle_TDF_Attribute
") NewEmpty;
		Handle_TDF_Attribute NewEmpty ();
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	:param into:
	:type into: Handle_TDF_Attribute &
	:param RT:
	:type RT: Handle_TDF_RelocationTable &
	:rtype: None
") Paste;
		void Paste (const Handle_TDF_Attribute & into,const Handle_TDF_RelocationTable & RT);
		%feature("compactdefaultargs") References;
		%feature("autodoc", "	:param DS:
	:type DS: Handle_TDF_DataSet &
	:rtype: void
") References;
		virtual void References (const Handle_TDF_DataSet & DS);

        %feature("autodoc", "1");
        %extend{
            std::string DumpToString() {
            std::stringstream s;
            self->Dump(s);
            return s.str();}
        };
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
		%feature("compactdefaultargs") GetID;
		%feature("autodoc", "	* class methods =============

	:rtype: Standard_GUID
") GetID;
		static const Standard_GUID & GetID ();
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "	* Find, or create, an Expression attribute. Expressionmethods ============

	:param label:
	:type label: TDF_Label &
	:rtype: Handle_TDataStd_Expression
") Set;
		static Handle_TDataStd_Expression Set (const TDF_Label & label);
		%feature("compactdefaultargs") TDataStd_Expression;
		%feature("autodoc", "	:rtype: None
") TDataStd_Expression;
		 TDataStd_Expression ();
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "	* build and return the expression name

	:rtype: TCollection_ExtendedString
") Name;
		TCollection_ExtendedString Name ();
		%feature("compactdefaultargs") SetExpression;
		%feature("autodoc", "	:param E:
	:type E: TCollection_ExtendedString &
	:rtype: None
") SetExpression;
		void SetExpression (const TCollection_ExtendedString & E);
		%feature("compactdefaultargs") GetExpression;
		%feature("autodoc", "	:rtype: TCollection_ExtendedString
") GetExpression;
		const TCollection_ExtendedString & GetExpression ();
		%feature("compactdefaultargs") GetVariables;
		%feature("autodoc", "	:rtype: TDF_AttributeList
") GetVariables;
		TDF_AttributeList & GetVariables ();
		%feature("compactdefaultargs") ID;
		%feature("autodoc", "	:rtype: Standard_GUID
") ID;
		const Standard_GUID & ID ();
		%feature("compactdefaultargs") Restore;
		%feature("autodoc", "	:param With:
	:type With: Handle_TDF_Attribute &
	:rtype: None
") Restore;
		void Restore (const Handle_TDF_Attribute & With);
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "	:rtype: Handle_TDF_Attribute
") NewEmpty;
		Handle_TDF_Attribute NewEmpty ();
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	:param Into:
	:type Into: Handle_TDF_Attribute &
	:param RT:
	:type RT: Handle_TDF_RelocationTable &
	:rtype: None
") Paste;
		void Paste (const Handle_TDF_Attribute & Into,const Handle_TDF_RelocationTable & RT);

        %feature("autodoc", "1");
        %extend{
            std::string DumpToString() {
            std::stringstream s;
            self->Dump(s);
            return s.str();}
        };
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
		%feature("compactdefaultargs") GetID;
		%feature("autodoc", "	* class methods ============= Returns the GUID for the attribute.

	:rtype: Standard_GUID
") GetID;
		static const Standard_GUID & GetID ();
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
	:rtype: Handle_TDataStd_ExtStringArray
") Set;
		static Handle_TDataStd_ExtStringArray Set (const TDF_Label & label,const Standard_Integer lower,const Standard_Integer upper,const Standard_Boolean isDelta = Standard_False);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	* Initializes the inner array with bounds from <lower> to <upper>

	:param lower:
	:type lower: int
	:param upper:
	:type upper: int
	:rtype: None
") Init;
		void Init (const Standard_Integer lower,const Standard_Integer upper);
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	* Sets the <Index>th element of the array to <Value> OutOfRange exception is raised if <Index> doesn't respect Lower and Upper bounds of the internal array.

	:param Index:
	:type Index: int
	:param Value:
	:type Value: TCollection_ExtendedString &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const TCollection_ExtendedString & Value);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	* Returns the value of the <Index>th element of the array

	:param Index:
	:type Index: int
	:rtype: TCollection_ExtendedString
") Value;
		const TCollection_ExtendedString & Value (const Standard_Integer Index);
		%feature("compactdefaultargs") Lower;
		%feature("autodoc", "	* Return the lower bound.

	:rtype: int
") Lower;
		Standard_Integer Lower ();
		%feature("compactdefaultargs") Upper;
		%feature("autodoc", "	* Return the upper bound

	:rtype: int
") Upper;
		Standard_Integer Upper ();
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "	* Return the number of elements of <self>.

	:rtype: int
") Length;
		Standard_Integer Length ();
		%feature("compactdefaultargs") ChangeArray;
		%feature("autodoc", "	* Sets the inner array <myValue> of the ExtStringArray attribute to <newArray>. If value of <newArray> differs from <myValue>, Backup performed and myValue refers to new instance of HArray1OfExtendedString that holds <newArray> values If <isCheckItems> equal True each item of <newArray> will be checked with each item of <myValue> for coincidence (to avoid backup).

	:param newArray:
	:type newArray: Handle_TColStd_HArray1OfExtendedString &
	:param isCheckItems: default value is Standard_True
	:type isCheckItems: bool
	:rtype: None
") ChangeArray;
		void ChangeArray (const Handle_TColStd_HArray1OfExtendedString & newArray,const Standard_Boolean isCheckItems = Standard_True);
		%feature("compactdefaultargs") Array;
		%feature("autodoc", "	* Return the inner array of the ExtStringArray attribute

	:rtype: Handle_TColStd_HArray1OfExtendedString
") Array;
		const Handle_TColStd_HArray1OfExtendedString Array ();
		%feature("compactdefaultargs") GetDelta;
		%feature("autodoc", "	:rtype: bool
") GetDelta;
		Standard_Boolean GetDelta ();
		%feature("compactdefaultargs") SetDelta;
		%feature("autodoc", "	* for internal use only!

	:param isDelta:
	:type isDelta: bool
	:rtype: None
") SetDelta;
		void SetDelta (const Standard_Boolean isDelta);
		%feature("compactdefaultargs") TDataStd_ExtStringArray;
		%feature("autodoc", "	:rtype: None
") TDataStd_ExtStringArray;
		 TDataStd_ExtStringArray ();
		%feature("compactdefaultargs") ID;
		%feature("autodoc", "	:rtype: Standard_GUID
") ID;
		const Standard_GUID & ID ();
		%feature("compactdefaultargs") Restore;
		%feature("autodoc", "	:param With:
	:type With: Handle_TDF_Attribute &
	:rtype: None
") Restore;
		void Restore (const Handle_TDF_Attribute & With);
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "	:rtype: Handle_TDF_Attribute
") NewEmpty;
		Handle_TDF_Attribute NewEmpty ();
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	:param Into:
	:type Into: Handle_TDF_Attribute &
	:param RT:
	:type RT: Handle_TDF_RelocationTable &
	:rtype: None
") Paste;
		void Paste (const Handle_TDF_Attribute & Into,const Handle_TDF_RelocationTable & RT);

        %feature("autodoc", "1");
        %extend{
            std::string DumpToString() {
            std::stringstream s;
            self->Dump(s);
            return s.str();}
        };
        		%feature("compactdefaultargs") DeltaOnModification;
		%feature("autodoc", "	* Makes a DeltaOnModification between <self> and <anOldAttribute>.

	:param anOldAttribute:
	:type anOldAttribute: Handle_TDF_Attribute &
	:rtype: Handle_TDF_DeltaOnModification
") DeltaOnModification;
		virtual Handle_TDF_DeltaOnModification DeltaOnModification (const Handle_TDF_Attribute & anOldAttribute);
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
		%feature("compactdefaultargs") GetID;
		%feature("autodoc", "	* Static methods ============== Returns the ID of the list of strings attribute.

	:rtype: Standard_GUID
") GetID;
		static const Standard_GUID & GetID ();
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "	* Finds or creates a list of string values attribute.

	:param label:
	:type label: TDF_Label &
	:rtype: Handle_TDataStd_ExtStringList
") Set;
		static Handle_TDataStd_ExtStringList Set (const TDF_Label & label);
		%feature("compactdefaultargs") TDataStd_ExtStringList;
		%feature("autodoc", "	:rtype: None
") TDataStd_ExtStringList;
		 TDataStd_ExtStringList ();
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "	:rtype: bool
") IsEmpty;
		Standard_Boolean IsEmpty ();
		%feature("compactdefaultargs") Extent;
		%feature("autodoc", "	:rtype: int
") Extent;
		Standard_Integer Extent ();
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param value:
	:type value: TCollection_ExtendedString &
	:rtype: None
") Prepend;
		void Prepend (const TCollection_ExtendedString & value);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param value:
	:type value: TCollection_ExtendedString &
	:rtype: None
") Append;
		void Append (const TCollection_ExtendedString & value);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	* Inserts the <value> before the first meet of <before_value>.

	:param value:
	:type value: TCollection_ExtendedString &
	:param before_value:
	:type before_value: TCollection_ExtendedString &
	:rtype: bool
") InsertBefore;
		Standard_Boolean InsertBefore (const TCollection_ExtendedString & value,const TCollection_ExtendedString & before_value);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	* Inserts the <value> after the first meet of <after_value>.

	:param value:
	:type value: TCollection_ExtendedString &
	:param after_value:
	:type after_value: TCollection_ExtendedString &
	:rtype: bool
") InsertAfter;
		Standard_Boolean InsertAfter (const TCollection_ExtendedString & value,const TCollection_ExtendedString & after_value);
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	* Removes the first meet of the <value>.

	:param value:
	:type value: TCollection_ExtendedString &
	:rtype: bool
") Remove;
		Standard_Boolean Remove (const TCollection_ExtendedString & value);
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") First;
		%feature("autodoc", "	:rtype: TCollection_ExtendedString
") First;
		const TCollection_ExtendedString & First ();
		%feature("compactdefaultargs") Last;
		%feature("autodoc", "	:rtype: TCollection_ExtendedString
") Last;
		const TCollection_ExtendedString & Last ();
		%feature("compactdefaultargs") List;
		%feature("autodoc", "	:rtype: TDataStd_ListOfExtendedString
") List;
		const TDataStd_ListOfExtendedString & List ();
		%feature("compactdefaultargs") ID;
		%feature("autodoc", "	:rtype: Standard_GUID
") ID;
		const Standard_GUID & ID ();
		%feature("compactdefaultargs") Restore;
		%feature("autodoc", "	:param With:
	:type With: Handle_TDF_Attribute &
	:rtype: None
") Restore;
		void Restore (const Handle_TDF_Attribute & With);
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "	:rtype: Handle_TDF_Attribute
") NewEmpty;
		Handle_TDF_Attribute NewEmpty ();
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	:param Into:
	:type Into: Handle_TDF_Attribute &
	:param RT:
	:type RT: Handle_TDF_RelocationTable &
	:rtype: None
") Paste;
		void Paste (const Handle_TDF_Attribute & Into,const Handle_TDF_RelocationTable & RT);

        %feature("autodoc", "1");
        %extend{
            std::string DumpToString() {
            std::stringstream s;
            self->Dump(s);
            return s.str();}
        };
        };


%make_alias(TDataStd_ExtStringList)

%extend TDataStd_ExtStringList {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TDataStd_HDataMapOfStringByte;
class TDataStd_HDataMapOfStringByte : public MMgt_TShared {
	public:
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
		%feature("compactdefaultargs") Map;
		%feature("autodoc", "	:rtype: TDataStd_DataMapOfStringByte
") Map;
		const TDataStd_DataMapOfStringByte & Map ();
		%feature("compactdefaultargs") ChangeMap;
		%feature("autodoc", "	:rtype: TDataStd_DataMapOfStringByte
") ChangeMap;
		TDataStd_DataMapOfStringByte & ChangeMap ();
};


%make_alias(TDataStd_HDataMapOfStringByte)

%extend TDataStd_HDataMapOfStringByte {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TDataStd_HDataMapOfStringHArray1OfInteger;
class TDataStd_HDataMapOfStringHArray1OfInteger : public MMgt_TShared {
	public:
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
		%feature("compactdefaultargs") Map;
		%feature("autodoc", "	:rtype: TDataStd_DataMapOfStringHArray1OfInteger
") Map;
		const TDataStd_DataMapOfStringHArray1OfInteger & Map ();
		%feature("compactdefaultargs") ChangeMap;
		%feature("autodoc", "	:rtype: TDataStd_DataMapOfStringHArray1OfInteger
") ChangeMap;
		TDataStd_DataMapOfStringHArray1OfInteger & ChangeMap ();
};


%make_alias(TDataStd_HDataMapOfStringHArray1OfInteger)


%extend TDataStd_HDataMapOfStringHArray1OfInteger {
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
            self.current +=1
        return self.Value(self.current)

    __next__ = next

    }
};
%extend TDataStd_HDataMapOfStringHArray1OfInteger {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TDataStd_HDataMapOfStringHArray1OfReal;
class TDataStd_HDataMapOfStringHArray1OfReal : public MMgt_TShared {
	public:
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
		%feature("compactdefaultargs") Map;
		%feature("autodoc", "	:rtype: TDataStd_DataMapOfStringHArray1OfReal
") Map;
		const TDataStd_DataMapOfStringHArray1OfReal & Map ();
		%feature("compactdefaultargs") ChangeMap;
		%feature("autodoc", "	:rtype: TDataStd_DataMapOfStringHArray1OfReal
") ChangeMap;
		TDataStd_DataMapOfStringHArray1OfReal & ChangeMap ();
};


%make_alias(TDataStd_HDataMapOfStringHArray1OfReal)


%extend TDataStd_HDataMapOfStringHArray1OfReal {
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
            self.current +=1
        return self.Value(self.current)

    __next__ = next

    }
};
%extend TDataStd_HDataMapOfStringHArray1OfReal {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TDataStd_HDataMapOfStringInteger;
class TDataStd_HDataMapOfStringInteger : public MMgt_TShared {
	public:
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
		%feature("compactdefaultargs") Map;
		%feature("autodoc", "	:rtype: TColStd_DataMapOfStringInteger
") Map;
		const TColStd_DataMapOfStringInteger & Map ();
		%feature("compactdefaultargs") ChangeMap;
		%feature("autodoc", "	:rtype: TColStd_DataMapOfStringInteger
") ChangeMap;
		TColStd_DataMapOfStringInteger & ChangeMap ();
};


%make_alias(TDataStd_HDataMapOfStringInteger)

%extend TDataStd_HDataMapOfStringInteger {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TDataStd_HDataMapOfStringReal;
class TDataStd_HDataMapOfStringReal : public MMgt_TShared {
	public:
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
		%feature("compactdefaultargs") Map;
		%feature("autodoc", "	:rtype: TDataStd_DataMapOfStringReal
") Map;
		const TDataStd_DataMapOfStringReal & Map ();
		%feature("compactdefaultargs") ChangeMap;
		%feature("autodoc", "	:rtype: TDataStd_DataMapOfStringReal
") ChangeMap;
		TDataStd_DataMapOfStringReal & ChangeMap ();
};


%make_alias(TDataStd_HDataMapOfStringReal)

%extend TDataStd_HDataMapOfStringReal {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TDataStd_HDataMapOfStringString;
class TDataStd_HDataMapOfStringString : public MMgt_TShared {
	public:
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
		%feature("compactdefaultargs") Map;
		%feature("autodoc", "	:rtype: TDataStd_DataMapOfStringString
") Map;
		const TDataStd_DataMapOfStringString & Map ();
		%feature("compactdefaultargs") ChangeMap;
		%feature("autodoc", "	:rtype: TDataStd_DataMapOfStringString
") ChangeMap;
		TDataStd_DataMapOfStringString & ChangeMap ();
};


%make_alias(TDataStd_HDataMapOfStringString)

%extend TDataStd_HDataMapOfStringString {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TDataStd_HLabelArray1;
class TDataStd_HLabelArray1 : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") TDataStd_HLabelArray1;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") TDataStd_HLabelArray1;
		 TDataStd_HLabelArray1 (const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") TDataStd_HLabelArray1;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:param V:
	:type V: TDF_Label &
	:rtype: None
") TDataStd_HLabelArray1;
		 TDataStd_HLabelArray1 (const Standard_Integer Low,const Standard_Integer Up,const TDF_Label & V);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param V:
	:type V: TDF_Label &
	:rtype: None
") Init;
		void Init (const TDF_Label & V);
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
	:type Value: TDF_Label &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const TDF_Label & Value);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: TDF_Label
") Value;
		const TDF_Label & Value (const Standard_Integer Index);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: TDF_Label
") ChangeValue;
		TDF_Label & ChangeValue (const Standard_Integer Index);
		%feature("compactdefaultargs") Array1;
		%feature("autodoc", "	:rtype: TDataStd_LabelArray1
") Array1;
		const TDataStd_LabelArray1 & Array1 ();
		%feature("compactdefaultargs") ChangeArray1;
		%feature("autodoc", "	:rtype: TDataStd_LabelArray1
") ChangeArray1;
		TDataStd_LabelArray1 & ChangeArray1 ();
};


%make_alias(TDataStd_HLabelArray1)


%extend TDataStd_HLabelArray1 {
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
            self.current +=1
        return self.Value(self.current)

    __next__ = next

    }
};
%extend TDataStd_HLabelArray1 {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TDataStd_IntPackedMap;
class TDataStd_IntPackedMap : public TDF_Attribute {
	public:
		%feature("compactdefaultargs") GetID;
		%feature("autodoc", "	* class methods ============= Returns the GUID of the attribute.

	:rtype: Standard_GUID
") GetID;
		static const Standard_GUID & GetID ();
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "	* Finds or creates an integer map attribute on the given label. If <isDelta> == False, DefaultDeltaOnModification is used. If <isDelta> == True, DeltaOnModification of the current attribute is used. If attribute is already set, input parameter <isDelta> is refused and the found attribute returned. Attribute methods ===================

	:param label:
	:type label: TDF_Label &
	:param isDelta: default value is Standard_False
	:type isDelta: bool
	:rtype: Handle_TDataStd_IntPackedMap
") Set;
		static Handle_TDataStd_IntPackedMap Set (const TDF_Label & label,const Standard_Boolean isDelta = Standard_False);
		%feature("compactdefaultargs") TDataStd_IntPackedMap;
		%feature("autodoc", "	:rtype: None
") TDataStd_IntPackedMap;
		 TDataStd_IntPackedMap ();
		%feature("compactdefaultargs") ChangeMap;
		%feature("autodoc", "	:param theMap:
	:type theMap: Handle_TColStd_HPackedMapOfInteger &
	:rtype: bool
") ChangeMap;
		Standard_Boolean ChangeMap (const Handle_TColStd_HPackedMapOfInteger & theMap);
		%feature("compactdefaultargs") GetMap;
		%feature("autodoc", "	:rtype: TColStd_PackedMapOfInteger
") GetMap;
		const TColStd_PackedMapOfInteger & GetMap ();
		%feature("compactdefaultargs") GetHMap;
		%feature("autodoc", "	:rtype: Handle_TColStd_HPackedMapOfInteger
") GetHMap;
		Handle_TColStd_HPackedMapOfInteger GetHMap ();
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: bool
") Clear;
		Standard_Boolean Clear ();
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "	:param theKey:
	:type theKey: int
	:rtype: bool
") Add;
		Standard_Boolean Add (const Standard_Integer theKey);
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	:param theKey:
	:type theKey: int
	:rtype: bool
") Remove;
		Standard_Boolean Remove (const Standard_Integer theKey);
		%feature("compactdefaultargs") Contains;
		%feature("autodoc", "	:param theKey:
	:type theKey: int
	:rtype: bool
") Contains;
		Standard_Boolean Contains (const Standard_Integer theKey);
		%feature("compactdefaultargs") Extent;
		%feature("autodoc", "	:rtype: int
") Extent;
		Standard_Integer Extent ();
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "	:rtype: bool
") IsEmpty;
		Standard_Boolean IsEmpty ();
		%feature("compactdefaultargs") GetDelta;
		%feature("autodoc", "	:rtype: bool
") GetDelta;
		Standard_Boolean GetDelta ();
		%feature("compactdefaultargs") SetDelta;
		%feature("autodoc", "	* for internal use only!

	:param isDelta:
	:type isDelta: bool
	:rtype: None
") SetDelta;
		void SetDelta (const Standard_Boolean isDelta);
		%feature("compactdefaultargs") ID;
		%feature("autodoc", "	:rtype: Standard_GUID
") ID;
		const Standard_GUID & ID ();
		%feature("compactdefaultargs") Restore;
		%feature("autodoc", "	:param with:
	:type with: Handle_TDF_Attribute &
	:rtype: None
") Restore;
		void Restore (const Handle_TDF_Attribute & with);
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "	:rtype: Handle_TDF_Attribute
") NewEmpty;
		Handle_TDF_Attribute NewEmpty ();
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	:param into:
	:type into: Handle_TDF_Attribute &
	:param RT:
	:type RT: Handle_TDF_RelocationTable &
	:rtype: None
") Paste;
		void Paste (const Handle_TDF_Attribute & into,const Handle_TDF_RelocationTable & RT);

        %feature("autodoc", "1");
        %extend{
            std::string DumpToString() {
            std::stringstream s;
            self->Dump(s);
            return s.str();}
        };
        		%feature("compactdefaultargs") DeltaOnModification;
		%feature("autodoc", "	* Makes a DeltaOnModification between <self> and <anOldAttribute>.

	:param anOldAttribute:
	:type anOldAttribute: Handle_TDF_Attribute &
	:rtype: Handle_TDF_DeltaOnModification
") DeltaOnModification;
		virtual Handle_TDF_DeltaOnModification DeltaOnModification (const Handle_TDF_Attribute & anOldAttribute);
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
		%feature("compactdefaultargs") GetID;
		%feature("autodoc", "	* class methods ============= Returns the GUID for integers.

	:rtype: Standard_GUID
") GetID;
		static const Standard_GUID & GetID ();
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "	* Finds, or creates, an Integer attribute and sets <value> the Integer attribute is returned. Integer methods ===============

	:param label:
	:type label: TDF_Label &
	:param value:
	:type value: int
	:rtype: Handle_TDataStd_Integer
") Set;
		static Handle_TDataStd_Integer Set (const TDF_Label & label,const Standard_Integer value);
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "	:param V:
	:type V: int
	:rtype: None
") Set;
		void Set (const Standard_Integer V);
		%feature("compactdefaultargs") Get;
		%feature("autodoc", "	* Returns the integer value contained in the attribute.

	:rtype: int
") Get;
		Standard_Integer Get ();
		%feature("compactdefaultargs") IsCaptured;
		%feature("autodoc", "	* Returns True if there is a reference on the same label

	:rtype: bool
") IsCaptured;
		Standard_Boolean IsCaptured ();
		%feature("compactdefaultargs") ID;
		%feature("autodoc", "	:rtype: Standard_GUID
") ID;
		const Standard_GUID & ID ();
		%feature("compactdefaultargs") Restore;
		%feature("autodoc", "	:param With:
	:type With: Handle_TDF_Attribute &
	:rtype: None
") Restore;
		void Restore (const Handle_TDF_Attribute & With);
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "	:rtype: Handle_TDF_Attribute
") NewEmpty;
		Handle_TDF_Attribute NewEmpty ();
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	:param Into:
	:type Into: Handle_TDF_Attribute &
	:param RT:
	:type RT: Handle_TDF_RelocationTable &
	:rtype: None
") Paste;
		void Paste (const Handle_TDF_Attribute & Into,const Handle_TDF_RelocationTable & RT);

        %feature("autodoc", "1");
        %extend{
            std::string DumpToString() {
            std::stringstream s;
            self->Dump(s);
            return s.str();}
        };
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
		%feature("compactdefaultargs") GetID;
		%feature("autodoc", "	* class methods ============= Returns the GUID for arrays of integers.

	:rtype: Standard_GUID
") GetID;
		static const Standard_GUID & GetID ();
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
	:rtype: Handle_TDataStd_IntegerArray
") Set;
		static Handle_TDataStd_IntegerArray Set (const TDF_Label & label,const Standard_Integer lower,const Standard_Integer upper,const Standard_Boolean isDelta = Standard_False);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	* Initialize the inner array with bounds from <lower> to <upper>

	:param lower:
	:type lower: int
	:param upper:
	:type upper: int
	:rtype: None
") Init;
		void Init (const Standard_Integer lower,const Standard_Integer upper);
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	* Sets the <Index>th element of the array to <Value> OutOfRange exception is raised if <Index> doesn't respect Lower and Upper bounds of the internal array.

	:param Index:
	:type Index: int
	:param Value:
	:type Value: int
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const Standard_Integer Value);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	* Return the value of the <Index>th element of the array

	:param Index:
	:type Index: int
	:rtype: int
") Value;
		Standard_Integer Value (const Standard_Integer Index);
		%feature("compactdefaultargs") Lower;
		%feature("autodoc", "	* Returns the lower boundary of this array of integers.

	:rtype: int
") Lower;
		Standard_Integer Lower ();
		%feature("compactdefaultargs") Upper;
		%feature("autodoc", "	* Return the upper boundary of this array of integers.

	:rtype: int
") Upper;
		Standard_Integer Upper ();
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "	* Returns the length of this array of integers in terms of the number of elements it contains.

	:rtype: int
") Length;
		Standard_Integer Length ();
		%feature("compactdefaultargs") ChangeArray;
		%feature("autodoc", "	* Sets the inner array <myValue> of the IntegerArray attribute to <newArray>. If value of <newArray> differs from <myValue>, Backup performed and myValue refers to new instance of HArray1OfInteger that holds <newArray> values If <isCheckItems> equal True each item of <newArray> will be checked with each item of <myValue> for coincidence (to avoid backup).

	:param newArray:
	:type newArray: Handle_TColStd_HArray1OfInteger &
	:param isCheckItems: default value is Standard_True
	:type isCheckItems: bool
	:rtype: None
") ChangeArray;
		void ChangeArray (const Handle_TColStd_HArray1OfInteger & newArray,const Standard_Boolean isCheckItems = Standard_True);
		%feature("compactdefaultargs") Array;
		%feature("autodoc", "	* Return the inner array of the IntegerArray attribute

	:rtype: Handle_TColStd_HArray1OfInteger
") Array;
		const Handle_TColStd_HArray1OfInteger Array ();
		%feature("compactdefaultargs") GetDelta;
		%feature("autodoc", "	:rtype: bool
") GetDelta;
		Standard_Boolean GetDelta ();
		%feature("compactdefaultargs") SetDelta;
		%feature("autodoc", "	* for internal use only!

	:param isDelta:
	:type isDelta: bool
	:rtype: None
") SetDelta;
		void SetDelta (const Standard_Boolean isDelta);
		%feature("compactdefaultargs") TDataStd_IntegerArray;
		%feature("autodoc", "	:rtype: None
") TDataStd_IntegerArray;
		 TDataStd_IntegerArray ();
		%feature("compactdefaultargs") ID;
		%feature("autodoc", "	:rtype: Standard_GUID
") ID;
		const Standard_GUID & ID ();
		%feature("compactdefaultargs") Restore;
		%feature("autodoc", "	:param With:
	:type With: Handle_TDF_Attribute &
	:rtype: None
") Restore;
		void Restore (const Handle_TDF_Attribute & With);
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "	:rtype: Handle_TDF_Attribute
") NewEmpty;
		Handle_TDF_Attribute NewEmpty ();
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	* Note. Uses inside ChangeArray() method

	:param Into:
	:type Into: Handle_TDF_Attribute &
	:param RT:
	:type RT: Handle_TDF_RelocationTable &
	:rtype: None
") Paste;
		void Paste (const Handle_TDF_Attribute & Into,const Handle_TDF_RelocationTable & RT);

        %feature("autodoc", "1");
        %extend{
            std::string DumpToString() {
            std::stringstream s;
            self->Dump(s);
            return s.str();}
        };
        		%feature("compactdefaultargs") DeltaOnModification;
		%feature("autodoc", "	* Makes a DeltaOnModification between <self> and <anOldAttribute>.

	:param anOldAttribute:
	:type anOldAttribute: Handle_TDF_Attribute &
	:rtype: Handle_TDF_DeltaOnModification
") DeltaOnModification;
		virtual Handle_TDF_DeltaOnModification DeltaOnModification (const Handle_TDF_Attribute & anOldAttribute);
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
		%feature("compactdefaultargs") GetID;
		%feature("autodoc", "	* Static methods ============== Returns the ID of the list of integer attribute.

	:rtype: Standard_GUID
") GetID;
		static const Standard_GUID & GetID ();
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "	* Finds or creates a list of integer values attribute.

	:param label:
	:type label: TDF_Label &
	:rtype: Handle_TDataStd_IntegerList
") Set;
		static Handle_TDataStd_IntegerList Set (const TDF_Label & label);
		%feature("compactdefaultargs") TDataStd_IntegerList;
		%feature("autodoc", "	:rtype: None
") TDataStd_IntegerList;
		 TDataStd_IntegerList ();
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "	:rtype: bool
") IsEmpty;
		Standard_Boolean IsEmpty ();
		%feature("compactdefaultargs") Extent;
		%feature("autodoc", "	:rtype: int
") Extent;
		Standard_Integer Extent ();
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param value:
	:type value: int
	:rtype: None
") Prepend;
		void Prepend (const Standard_Integer value);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param value:
	:type value: int
	:rtype: None
") Append;
		void Append (const Standard_Integer value);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	* Inserts the <value> before the first meet of <before_value>.

	:param value:
	:type value: int
	:param before_value:
	:type before_value: int
	:rtype: bool
") InsertBefore;
		Standard_Boolean InsertBefore (const Standard_Integer value,const Standard_Integer before_value);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	* Inserts the <value> after the first meet of <after_value>.

	:param value:
	:type value: int
	:param after_value:
	:type after_value: int
	:rtype: bool
") InsertAfter;
		Standard_Boolean InsertAfter (const Standard_Integer value,const Standard_Integer after_value);
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	* Removes the first meet of the <value>.

	:param value:
	:type value: int
	:rtype: bool
") Remove;
		Standard_Boolean Remove (const Standard_Integer value);
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") First;
		%feature("autodoc", "	:rtype: int
") First;
		Standard_Integer First ();
		%feature("compactdefaultargs") Last;
		%feature("autodoc", "	:rtype: int
") Last;
		Standard_Integer Last ();
		%feature("compactdefaultargs") List;
		%feature("autodoc", "	:rtype: TColStd_ListOfInteger
") List;
		const TColStd_ListOfInteger & List ();
		%feature("compactdefaultargs") ID;
		%feature("autodoc", "	:rtype: Standard_GUID
") ID;
		const Standard_GUID & ID ();
		%feature("compactdefaultargs") Restore;
		%feature("autodoc", "	:param With:
	:type With: Handle_TDF_Attribute &
	:rtype: None
") Restore;
		void Restore (const Handle_TDF_Attribute & With);
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "	:rtype: Handle_TDF_Attribute
") NewEmpty;
		Handle_TDF_Attribute NewEmpty ();
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	:param Into:
	:type Into: Handle_TDF_Attribute &
	:param RT:
	:type RT: Handle_TDF_RelocationTable &
	:rtype: None
") Paste;
		void Paste (const Handle_TDF_Attribute & Into,const Handle_TDF_RelocationTable & RT);

        %feature("autodoc", "1");
        %extend{
            std::string DumpToString() {
            std::stringstream s;
            self->Dump(s);
            return s.str();}
        };
        };


%make_alias(TDataStd_IntegerList)

%extend TDataStd_IntegerList {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TDataStd_LabelArray1;
class TDataStd_LabelArray1 {
	public:
		%feature("compactdefaultargs") TDataStd_LabelArray1;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") TDataStd_LabelArray1;
		 TDataStd_LabelArray1 (const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") TDataStd_LabelArray1;
		%feature("autodoc", "	:param Item:
	:type Item: TDF_Label &
	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") TDataStd_LabelArray1;
		 TDataStd_LabelArray1 (const TDF_Label & Item,const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param V:
	:type V: TDF_Label &
	:rtype: None
") Init;
		void Init (const TDF_Label & V);
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
	:type Other: TDataStd_LabelArray1 &
	:rtype: TDataStd_LabelArray1
") Assign;
		const TDataStd_LabelArray1 & Assign (const TDataStd_LabelArray1 & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: TDataStd_LabelArray1 &
	:rtype: TDataStd_LabelArray1
") operator =;
		const TDataStd_LabelArray1 & operator = (const TDataStd_LabelArray1 & Other);
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
	:type Value: TDF_Label &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const TDF_Label & Value);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: TDF_Label
") Value;
		const TDF_Label & Value (const Standard_Integer Index);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: TDF_Label
") ChangeValue;
		TDF_Label & ChangeValue (const Standard_Integer Index);
};



%extend TDataStd_LabelArray1 {
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
            self.current +=1
        return self.Value(self.current)

    __next__ = next

    }
};
%extend TDataStd_LabelArray1 {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TDataStd_ListIteratorOfListOfByte;
class TDataStd_ListIteratorOfListOfByte {
	public:
		%feature("compactdefaultargs") TDataStd_ListIteratorOfListOfByte;
		%feature("autodoc", "	:rtype: None
") TDataStd_ListIteratorOfListOfByte;
		 TDataStd_ListIteratorOfListOfByte ();
		%feature("compactdefaultargs") TDataStd_ListIteratorOfListOfByte;
		%feature("autodoc", "	:param L:
	:type L: TDataStd_ListOfByte &
	:rtype: None
") TDataStd_ListIteratorOfListOfByte;
		 TDataStd_ListIteratorOfListOfByte (const TDataStd_ListOfByte & L);
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "	:param L:
	:type L: TDataStd_ListOfByte &
	:rtype: None
") Initialize;
		void Initialize (const TDataStd_ListOfByte & L);
		%feature("compactdefaultargs") More;
		%feature("autodoc", "	:rtype: bool
") More;
		Standard_Boolean More ();
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "	:rtype: None
") Next;
		void Next ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: Standard_Byte
") Value;
		Standard_Byte & Value ();
};


%extend TDataStd_ListIteratorOfListOfByte {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TDataStd_ListIteratorOfListOfExtendedString;
class TDataStd_ListIteratorOfListOfExtendedString {
	public:
		%feature("compactdefaultargs") TDataStd_ListIteratorOfListOfExtendedString;
		%feature("autodoc", "	:rtype: None
") TDataStd_ListIteratorOfListOfExtendedString;
		 TDataStd_ListIteratorOfListOfExtendedString ();
		%feature("compactdefaultargs") TDataStd_ListIteratorOfListOfExtendedString;
		%feature("autodoc", "	:param L:
	:type L: TDataStd_ListOfExtendedString &
	:rtype: None
") TDataStd_ListIteratorOfListOfExtendedString;
		 TDataStd_ListIteratorOfListOfExtendedString (const TDataStd_ListOfExtendedString & L);
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "	:param L:
	:type L: TDataStd_ListOfExtendedString &
	:rtype: None
") Initialize;
		void Initialize (const TDataStd_ListOfExtendedString & L);
		%feature("compactdefaultargs") More;
		%feature("autodoc", "	:rtype: bool
") More;
		Standard_Boolean More ();
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "	:rtype: None
") Next;
		void Next ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: TCollection_ExtendedString
") Value;
		TCollection_ExtendedString & Value ();
};


%extend TDataStd_ListIteratorOfListOfExtendedString {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TDataStd_ListNodeOfListOfByte;
class TDataStd_ListNodeOfListOfByte : public TCollection_MapNode {
	public:
		%feature("compactdefaultargs") TDataStd_ListNodeOfListOfByte;
		%feature("autodoc", "	:param I:
	:type I: Standard_Byte &
	:param n:
	:type n: TCollection_MapNodePtr &
	:rtype: None
") TDataStd_ListNodeOfListOfByte;
		 TDataStd_ListNodeOfListOfByte (const Standard_Byte & I,const TCollection_MapNodePtr & n);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: Standard_Byte
") Value;
		Standard_Byte & Value ();
};


%make_alias(TDataStd_ListNodeOfListOfByte)

%extend TDataStd_ListNodeOfListOfByte {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TDataStd_ListNodeOfListOfExtendedString;
class TDataStd_ListNodeOfListOfExtendedString : public TCollection_MapNode {
	public:
		%feature("compactdefaultargs") TDataStd_ListNodeOfListOfExtendedString;
		%feature("autodoc", "	:param I:
	:type I: TCollection_ExtendedString &
	:param n:
	:type n: TCollection_MapNodePtr &
	:rtype: None
") TDataStd_ListNodeOfListOfExtendedString;
		 TDataStd_ListNodeOfListOfExtendedString (const TCollection_ExtendedString & I,const TCollection_MapNodePtr & n);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: TCollection_ExtendedString
") Value;
		TCollection_ExtendedString & Value ();
};


%make_alias(TDataStd_ListNodeOfListOfExtendedString)

%extend TDataStd_ListNodeOfListOfExtendedString {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TDataStd_ListOfByte;
class TDataStd_ListOfByte {
	public:
		%feature("compactdefaultargs") TDataStd_ListOfByte;
		%feature("autodoc", "	:rtype: None
") TDataStd_ListOfByte;
		 TDataStd_ListOfByte ();
		%feature("compactdefaultargs") TDataStd_ListOfByte;
		%feature("autodoc", "	:param Other:
	:type Other: TDataStd_ListOfByte &
	:rtype: None
") TDataStd_ListOfByte;
		 TDataStd_ListOfByte (const TDataStd_ListOfByte & Other);
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: TDataStd_ListOfByte &
	:rtype: None
") Assign;
		void Assign (const TDataStd_ListOfByte & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: TDataStd_ListOfByte &
	:rtype: None
") operator =;
		void operator = (const TDataStd_ListOfByte & Other);
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
	:type I: Standard_Byte &
	:rtype: None
") Prepend;
		void Prepend (const Standard_Byte & I);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param I:
	:type I: Standard_Byte &
	:param theIt:
	:type theIt: TDataStd_ListIteratorOfListOfByte &
	:rtype: None
") Prepend;
		void Prepend (const Standard_Byte & I,TDataStd_ListIteratorOfListOfByte & theIt);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param Other:
	:type Other: TDataStd_ListOfByte &
	:rtype: None
") Prepend;
		void Prepend (TDataStd_ListOfByte & Other);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param I:
	:type I: Standard_Byte &
	:rtype: None
") Append;
		void Append (const Standard_Byte & I);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param I:
	:type I: Standard_Byte &
	:param theIt:
	:type theIt: TDataStd_ListIteratorOfListOfByte &
	:rtype: None
") Append;
		void Append (const Standard_Byte & I,TDataStd_ListIteratorOfListOfByte & theIt);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param Other:
	:type Other: TDataStd_ListOfByte &
	:rtype: None
") Append;
		void Append (TDataStd_ListOfByte & Other);
		%feature("compactdefaultargs") First;
		%feature("autodoc", "	:rtype: Standard_Byte
") First;
		Standard_Byte & First ();
		%feature("compactdefaultargs") Last;
		%feature("autodoc", "	:rtype: Standard_Byte
") Last;
		Standard_Byte & Last ();
		%feature("compactdefaultargs") RemoveFirst;
		%feature("autodoc", "	:rtype: None
") RemoveFirst;
		void RemoveFirst ();
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	:param It:
	:type It: TDataStd_ListIteratorOfListOfByte &
	:rtype: None
") Remove;
		void Remove (TDataStd_ListIteratorOfListOfByte & It);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param I:
	:type I: Standard_Byte &
	:param It:
	:type It: TDataStd_ListIteratorOfListOfByte &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Byte & I,TDataStd_ListIteratorOfListOfByte & It);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param Other:
	:type Other: TDataStd_ListOfByte &
	:param It:
	:type It: TDataStd_ListIteratorOfListOfByte &
	:rtype: None
") InsertBefore;
		void InsertBefore (TDataStd_ListOfByte & Other,TDataStd_ListIteratorOfListOfByte & It);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param I:
	:type I: Standard_Byte &
	:param It:
	:type It: TDataStd_ListIteratorOfListOfByte &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Byte & I,TDataStd_ListIteratorOfListOfByte & It);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param Other:
	:type Other: TDataStd_ListOfByte &
	:param It:
	:type It: TDataStd_ListIteratorOfListOfByte &
	:rtype: None
") InsertAfter;
		void InsertAfter (TDataStd_ListOfByte & Other,TDataStd_ListIteratorOfListOfByte & It);
};


%extend TDataStd_ListOfByte {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TDataStd_ListOfExtendedString;
class TDataStd_ListOfExtendedString {
	public:
		%feature("compactdefaultargs") TDataStd_ListOfExtendedString;
		%feature("autodoc", "	:rtype: None
") TDataStd_ListOfExtendedString;
		 TDataStd_ListOfExtendedString ();
		%feature("compactdefaultargs") TDataStd_ListOfExtendedString;
		%feature("autodoc", "	:param Other:
	:type Other: TDataStd_ListOfExtendedString &
	:rtype: None
") TDataStd_ListOfExtendedString;
		 TDataStd_ListOfExtendedString (const TDataStd_ListOfExtendedString & Other);
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: TDataStd_ListOfExtendedString &
	:rtype: None
") Assign;
		void Assign (const TDataStd_ListOfExtendedString & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: TDataStd_ListOfExtendedString &
	:rtype: None
") operator =;
		void operator = (const TDataStd_ListOfExtendedString & Other);
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
	:type I: TCollection_ExtendedString &
	:rtype: None
") Prepend;
		void Prepend (const TCollection_ExtendedString & I);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param I:
	:type I: TCollection_ExtendedString &
	:param theIt:
	:type theIt: TDataStd_ListIteratorOfListOfExtendedString &
	:rtype: None
") Prepend;
		void Prepend (const TCollection_ExtendedString & I,TDataStd_ListIteratorOfListOfExtendedString & theIt);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param Other:
	:type Other: TDataStd_ListOfExtendedString &
	:rtype: None
") Prepend;
		void Prepend (TDataStd_ListOfExtendedString & Other);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param I:
	:type I: TCollection_ExtendedString &
	:rtype: None
") Append;
		void Append (const TCollection_ExtendedString & I);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param I:
	:type I: TCollection_ExtendedString &
	:param theIt:
	:type theIt: TDataStd_ListIteratorOfListOfExtendedString &
	:rtype: None
") Append;
		void Append (const TCollection_ExtendedString & I,TDataStd_ListIteratorOfListOfExtendedString & theIt);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param Other:
	:type Other: TDataStd_ListOfExtendedString &
	:rtype: None
") Append;
		void Append (TDataStd_ListOfExtendedString & Other);
		%feature("compactdefaultargs") First;
		%feature("autodoc", "	:rtype: TCollection_ExtendedString
") First;
		TCollection_ExtendedString & First ();
		%feature("compactdefaultargs") Last;
		%feature("autodoc", "	:rtype: TCollection_ExtendedString
") Last;
		TCollection_ExtendedString & Last ();
		%feature("compactdefaultargs") RemoveFirst;
		%feature("autodoc", "	:rtype: None
") RemoveFirst;
		void RemoveFirst ();
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	:param It:
	:type It: TDataStd_ListIteratorOfListOfExtendedString &
	:rtype: None
") Remove;
		void Remove (TDataStd_ListIteratorOfListOfExtendedString & It);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param I:
	:type I: TCollection_ExtendedString &
	:param It:
	:type It: TDataStd_ListIteratorOfListOfExtendedString &
	:rtype: None
") InsertBefore;
		void InsertBefore (const TCollection_ExtendedString & I,TDataStd_ListIteratorOfListOfExtendedString & It);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param Other:
	:type Other: TDataStd_ListOfExtendedString &
	:param It:
	:type It: TDataStd_ListIteratorOfListOfExtendedString &
	:rtype: None
") InsertBefore;
		void InsertBefore (TDataStd_ListOfExtendedString & Other,TDataStd_ListIteratorOfListOfExtendedString & It);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param I:
	:type I: TCollection_ExtendedString &
	:param It:
	:type It: TDataStd_ListIteratorOfListOfExtendedString &
	:rtype: None
") InsertAfter;
		void InsertAfter (const TCollection_ExtendedString & I,TDataStd_ListIteratorOfListOfExtendedString & It);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param Other:
	:type Other: TDataStd_ListOfExtendedString &
	:param It:
	:type It: TDataStd_ListIteratorOfListOfExtendedString &
	:rtype: None
") InsertAfter;
		void InsertAfter (TDataStd_ListOfExtendedString & Other,TDataStd_ListIteratorOfListOfExtendedString & It);
};


%extend TDataStd_ListOfExtendedString {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TDataStd_Name;
class TDataStd_Name : public TDF_Attribute {
	public:
		%feature("compactdefaultargs") GetID;
		%feature("autodoc", "	* class methods working on the name itself ======================================== Returns the GUID for name attributes.

	:rtype: Standard_GUID
") GetID;
		static const Standard_GUID & GetID ();
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "	* Creates (if does not exist) and sets the name in the name attribute. from any label <L> search in father labels (L is not concerned) the first name attribute.if found set it in <father>. class methods working on the name tree ====================================== Search in the whole TDF_Data the Name attribute which fit with <fullPath>. Returns True if found. Search under <currentLabel> a label which fit with <name>. Returns True if found. Shortcut which avoids building a ListOfExtendedStrin. Search in the whole TDF_Data the label which fit with name Returns True if found. tools methods to translate path <-> pathlist =========================================== move to draw For Draw test we may provide this tool method which convert a path in a sequence of string to call after the FindLabel methods. Example: if it's given 'Assembly:Part_1:Sketch_5' it will return in <pathlist> the list of 3 strings: 'Assembly','Part_1','Sketch_5'. move to draw from <pathlist> build the string path Name methods ============

	:param label:
	:type label: TDF_Label &
	:param string:
	:type string: TCollection_ExtendedString &
	:rtype: Handle_TDataStd_Name
") Set;
		static Handle_TDataStd_Name Set (const TDF_Label & label,const TCollection_ExtendedString & string);
		%feature("compactdefaultargs") TDataStd_Name;
		%feature("autodoc", "	:rtype: None
") TDataStd_Name;
		 TDataStd_Name ();
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "	* Sets <S> as name. Raises if <S> is not a valid name.

	:param S:
	:type S: TCollection_ExtendedString &
	:rtype: None
") Set;
		void Set (const TCollection_ExtendedString & S);
		%feature("compactdefaultargs") Get;
		%feature("autodoc", "	* Returns the name contained in this name attribute.

	:rtype: TCollection_ExtendedString
") Get;
		const TCollection_ExtendedString & Get ();
		%feature("compactdefaultargs") ID;
		%feature("autodoc", "	:rtype: Standard_GUID
") ID;
		const Standard_GUID & ID ();
		%feature("compactdefaultargs") Restore;
		%feature("autodoc", "	:param with:
	:type with: Handle_TDF_Attribute &
	:rtype: None
") Restore;
		void Restore (const Handle_TDF_Attribute & with);
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "	:rtype: Handle_TDF_Attribute
") NewEmpty;
		Handle_TDF_Attribute NewEmpty ();
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	:param into:
	:type into: Handle_TDF_Attribute &
	:param RT:
	:type RT: Handle_TDF_RelocationTable &
	:rtype: None
") Paste;
		void Paste (const Handle_TDF_Attribute & into,const Handle_TDF_RelocationTable & RT);

        %feature("autodoc", "1");
        %extend{
            std::string DumpToString() {
            std::stringstream s;
            self->Dump(s);
            return s.str();}
        };
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
		%feature("compactdefaultargs") GetID;
		%feature("autodoc", "	* Static methods ============== Returns the ID of the named data attribute.

	:rtype: Standard_GUID
") GetID;
		static const Standard_GUID & GetID ();
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "	* Finds or creates a named data attribute.

	:param label:
	:type label: TDF_Label &
	:rtype: Handle_TDataStd_NamedData
") Set;
		static Handle_TDataStd_NamedData Set (const TDF_Label & label);
		%feature("compactdefaultargs") TDataStd_NamedData;
		%feature("autodoc", "	:rtype: None
") TDataStd_NamedData;
		 TDataStd_NamedData ();
		%feature("compactdefaultargs") HasIntegers;
		%feature("autodoc", "	* Returns true if at least one named integer value is kept in the attribute.

	:rtype: bool
") HasIntegers;
		Standard_Boolean HasIntegers ();
		%feature("compactdefaultargs") HasInteger;
		%feature("autodoc", "	* Returns true if the attribute contains specified by Name integer value.

	:param theName:
	:type theName: TCollection_ExtendedString &
	:rtype: bool
") HasInteger;
		Standard_Boolean HasInteger (const TCollection_ExtendedString & theName);
		%feature("compactdefaultargs") GetInteger;
		%feature("autodoc", "	* Returns the integer value specified by the Name. It returns 0 if internal map doesn't contain the specified integer (use HasInteger() to check before).

	:param theName:
	:type theName: TCollection_ExtendedString &
	:rtype: int
") GetInteger;
		Standard_Integer GetInteger (const TCollection_ExtendedString & theName);
		%feature("compactdefaultargs") SetInteger;
		%feature("autodoc", "	* Defines a named integer. If the integer already exists, it changes its value to <theInteger>.

	:param theName:
	:type theName: TCollection_ExtendedString &
	:param theInteger:
	:type theInteger: int
	:rtype: None
") SetInteger;
		void SetInteger (const TCollection_ExtendedString & theName,const Standard_Integer theInteger);
		%feature("compactdefaultargs") GetIntegersContainer;
		%feature("autodoc", "	* Returns the internal container of named integers.

	:rtype: TColStd_DataMapOfStringInteger
") GetIntegersContainer;
		const TColStd_DataMapOfStringInteger & GetIntegersContainer ();
		%feature("compactdefaultargs") ChangeIntegers;
		%feature("autodoc", "	* Replace the container content by new content of the <theIntegers>.

	:param theIntegers:
	:type theIntegers: TColStd_DataMapOfStringInteger &
	:rtype: None
") ChangeIntegers;
		void ChangeIntegers (const TColStd_DataMapOfStringInteger & theIntegers);
		%feature("compactdefaultargs") HasReals;
		%feature("autodoc", "	* Returns true if at least one named real value is kept in the attribute.

	:rtype: bool
") HasReals;
		Standard_Boolean HasReals ();
		%feature("compactdefaultargs") HasReal;
		%feature("autodoc", "	* Returns true if the attribute contains a real specified by Name.

	:param theName:
	:type theName: TCollection_ExtendedString &
	:rtype: bool
") HasReal;
		Standard_Boolean HasReal (const TCollection_ExtendedString & theName);
		%feature("compactdefaultargs") GetReal;
		%feature("autodoc", "	* Returns the named real. It returns 0.0 if there is no such a named real (use HasReal()).

	:param theName:
	:type theName: TCollection_ExtendedString &
	:rtype: float
") GetReal;
		Standard_Real GetReal (const TCollection_ExtendedString & theName);
		%feature("compactdefaultargs") SetReal;
		%feature("autodoc", "	* Defines a named real. If the real already exists, it changes its value to <theReal>.

	:param theName:
	:type theName: TCollection_ExtendedString &
	:param theReal:
	:type theReal: float
	:rtype: None
") SetReal;
		void SetReal (const TCollection_ExtendedString & theName,const Standard_Real theReal);
		%feature("compactdefaultargs") GetRealsContainer;
		%feature("autodoc", "	* Returns the internal container of named reals.

	:rtype: TDataStd_DataMapOfStringReal
") GetRealsContainer;
		const TDataStd_DataMapOfStringReal & GetRealsContainer ();
		%feature("compactdefaultargs") ChangeReals;
		%feature("autodoc", "	* Replace the container content by new content of the <theReals>.

	:param theReals:
	:type theReals: TDataStd_DataMapOfStringReal &
	:rtype: None
") ChangeReals;
		void ChangeReals (const TDataStd_DataMapOfStringReal & theReals);
		%feature("compactdefaultargs") HasStrings;
		%feature("autodoc", "	* Returns true if there are some named strings in the attribute.

	:rtype: bool
") HasStrings;
		Standard_Boolean HasStrings ();
		%feature("compactdefaultargs") HasString;
		%feature("autodoc", "	* Returns true if the attribute contains this named string.

	:param theName:
	:type theName: TCollection_ExtendedString &
	:rtype: bool
") HasString;
		Standard_Boolean HasString (const TCollection_ExtendedString & theName);
		%feature("compactdefaultargs") GetString;
		%feature("autodoc", "	* Returns the named string. It returns an empty string if there is no such a named string (use HasString()).

	:param theName:
	:type theName: TCollection_ExtendedString &
	:rtype: TCollection_ExtendedString
") GetString;
		const TCollection_ExtendedString & GetString (const TCollection_ExtendedString & theName);
		%feature("compactdefaultargs") SetString;
		%feature("autodoc", "	* Defines a named string. If the string already exists, it changes its value to <theString>.

	:param theName:
	:type theName: TCollection_ExtendedString &
	:param theString:
	:type theString: TCollection_ExtendedString &
	:rtype: None
") SetString;
		void SetString (const TCollection_ExtendedString & theName,const TCollection_ExtendedString & theString);
		%feature("compactdefaultargs") GetStringsContainer;
		%feature("autodoc", "	* Returns the internal container of named strings.

	:rtype: TDataStd_DataMapOfStringString
") GetStringsContainer;
		const TDataStd_DataMapOfStringString & GetStringsContainer ();
		%feature("compactdefaultargs") ChangeStrings;
		%feature("autodoc", "	* Replace the container content by new content of the <theStrings>.

	:param theStrings:
	:type theStrings: TDataStd_DataMapOfStringString &
	:rtype: None
") ChangeStrings;
		void ChangeStrings (const TDataStd_DataMapOfStringString & theStrings);
		%feature("compactdefaultargs") HasBytes;
		%feature("autodoc", "	* Returns true if there are some named bytes in the attribute.

	:rtype: bool
") HasBytes;
		Standard_Boolean HasBytes ();
		%feature("compactdefaultargs") HasByte;
		%feature("autodoc", "	* Returns true if the attribute contains this named byte.

	:param theName:
	:type theName: TCollection_ExtendedString &
	:rtype: bool
") HasByte;
		Standard_Boolean HasByte (const TCollection_ExtendedString & theName);
		%feature("compactdefaultargs") GetByte;
		%feature("autodoc", "	* Returns the named byte. It returns 0 if there is no such a named byte (use HasByte()).

	:param theName:
	:type theName: TCollection_ExtendedString &
	:rtype: Standard_Byte
") GetByte;
		Standard_Byte GetByte (const TCollection_ExtendedString & theName);
		%feature("compactdefaultargs") SetByte;
		%feature("autodoc", "	* Defines a named byte. If the byte already exists, it changes its value to <theByte>.

	:param theName:
	:type theName: TCollection_ExtendedString &
	:param theByte:
	:type theByte: Standard_Byte
	:rtype: None
") SetByte;
		void SetByte (const TCollection_ExtendedString & theName,const Standard_Byte theByte);
		%feature("compactdefaultargs") GetBytesContainer;
		%feature("autodoc", "	* Returns the internal container of named bytes.

	:rtype: TDataStd_DataMapOfStringByte
") GetBytesContainer;
		const TDataStd_DataMapOfStringByte & GetBytesContainer ();
		%feature("compactdefaultargs") ChangeBytes;
		%feature("autodoc", "	* Replace the container content by new content of the <theBytes>.

	:param theBytes:
	:type theBytes: TDataStd_DataMapOfStringByte &
	:rtype: None
") ChangeBytes;
		void ChangeBytes (const TDataStd_DataMapOfStringByte & theBytes);
		%feature("compactdefaultargs") HasArraysOfIntegers;
		%feature("autodoc", "	* Returns true if there are some named arrays of integer values in the attribute.

	:rtype: bool
") HasArraysOfIntegers;
		Standard_Boolean HasArraysOfIntegers ();
		%feature("compactdefaultargs") HasArrayOfIntegers;
		%feature("autodoc", "	* Returns true if the attribute contains this named array of integer values.

	:param theName:
	:type theName: TCollection_ExtendedString &
	:rtype: bool
") HasArrayOfIntegers;
		Standard_Boolean HasArrayOfIntegers (const TCollection_ExtendedString & theName);
		%feature("compactdefaultargs") GetArrayOfIntegers;
		%feature("autodoc", "	* Returns the named array of integer values. It returns a NULL Handle if there is no such a named array of integers (use HasArrayOfIntegers()).

	:param theName:
	:type theName: TCollection_ExtendedString &
	:rtype: Handle_TColStd_HArray1OfInteger
") GetArrayOfIntegers;
		Handle_TColStd_HArray1OfInteger GetArrayOfIntegers (const TCollection_ExtendedString & theName);
		%feature("compactdefaultargs") SetArrayOfIntegers;
		%feature("autodoc", "	* Defines a named array of integer values. If the array already exists, it changes its value to <theArrayOfIntegers>.

	:param theName:
	:type theName: TCollection_ExtendedString &
	:param theArrayOfIntegers:
	:type theArrayOfIntegers: Handle_TColStd_HArray1OfInteger &
	:rtype: None
") SetArrayOfIntegers;
		void SetArrayOfIntegers (const TCollection_ExtendedString & theName,const Handle_TColStd_HArray1OfInteger & theArrayOfIntegers);
		%feature("compactdefaultargs") GetArraysOfIntegersContainer;
		%feature("autodoc", "	* Returns the internal container of named arrays of integer values.

	:rtype: TDataStd_DataMapOfStringHArray1OfInteger
") GetArraysOfIntegersContainer;
		const TDataStd_DataMapOfStringHArray1OfInteger & GetArraysOfIntegersContainer ();
		%feature("compactdefaultargs") ChangeArraysOfIntegers;
		%feature("autodoc", "	* Replace the container content by new content of the <theArraysOfIntegers>.

	:param theArraysOfIntegers:
	:type theArraysOfIntegers: TDataStd_DataMapOfStringHArray1OfInteger &
	:rtype: None
") ChangeArraysOfIntegers;
		void ChangeArraysOfIntegers (const TDataStd_DataMapOfStringHArray1OfInteger & theArraysOfIntegers);
		%feature("compactdefaultargs") HasArraysOfReals;
		%feature("autodoc", "	* Returns true if there are some named arrays of real values in the attribute.

	:rtype: bool
") HasArraysOfReals;
		Standard_Boolean HasArraysOfReals ();
		%feature("compactdefaultargs") HasArrayOfReals;
		%feature("autodoc", "	* Returns true if the attribute contains this named array of real values.

	:param theName:
	:type theName: TCollection_ExtendedString &
	:rtype: bool
") HasArrayOfReals;
		Standard_Boolean HasArrayOfReals (const TCollection_ExtendedString & theName);
		%feature("compactdefaultargs") GetArrayOfReals;
		%feature("autodoc", "	* Returns the named array of real values. It returns a NULL Handle if there is no such a named array of reals (use HasArrayOfReals()).

	:param theName:
	:type theName: TCollection_ExtendedString &
	:rtype: Handle_TColStd_HArray1OfReal
") GetArrayOfReals;
		Handle_TColStd_HArray1OfReal GetArrayOfReals (const TCollection_ExtendedString & theName);
		%feature("compactdefaultargs") SetArrayOfReals;
		%feature("autodoc", "	* Defines a named array of real values. If the array already exists, it changes its value to <theArrayOfReals>.

	:param theName:
	:type theName: TCollection_ExtendedString &
	:param theArrayOfReals:
	:type theArrayOfReals: Handle_TColStd_HArray1OfReal &
	:rtype: None
") SetArrayOfReals;
		void SetArrayOfReals (const TCollection_ExtendedString & theName,const Handle_TColStd_HArray1OfReal & theArrayOfReals);
		%feature("compactdefaultargs") GetArraysOfRealsContainer;
		%feature("autodoc", "	* Returns the internal container of named arrays of real values.

	:rtype: TDataStd_DataMapOfStringHArray1OfReal
") GetArraysOfRealsContainer;
		const TDataStd_DataMapOfStringHArray1OfReal & GetArraysOfRealsContainer ();
		%feature("compactdefaultargs") ChangeArraysOfReals;
		%feature("autodoc", "	* Replace the container content by new content of the <theArraysOfReals>.

	:param theArraysOfReals:
	:type theArraysOfReals: TDataStd_DataMapOfStringHArray1OfReal &
	:rtype: None
") ChangeArraysOfReals;
		void ChangeArraysOfReals (const TDataStd_DataMapOfStringHArray1OfReal & theArraysOfReals);
		%feature("compactdefaultargs") ID;
		%feature("autodoc", "	:rtype: Standard_GUID
") ID;
		const Standard_GUID & ID ();
		%feature("compactdefaultargs") Restore;
		%feature("autodoc", "	:param With:
	:type With: Handle_TDF_Attribute &
	:rtype: None
") Restore;
		void Restore (const Handle_TDF_Attribute & With);
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "	:rtype: Handle_TDF_Attribute
") NewEmpty;
		Handle_TDF_Attribute NewEmpty ();
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	:param Into:
	:type Into: Handle_TDF_Attribute &
	:param RT:
	:type RT: Handle_TDF_RelocationTable &
	:rtype: None
") Paste;
		void Paste (const Handle_TDF_Attribute & Into,const Handle_TDF_RelocationTable & RT);

        %feature("autodoc", "1");
        %extend{
            std::string DumpToString() {
            std::stringstream s;
            self->Dump(s);
            return s.str();}
        };
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
		%feature("compactdefaultargs") Find;
		%feature("autodoc", "	* class methods ============= try to retrieve a NoteBook attribute at <current> label or in fathers label of <current>. Returns True if found and set <N>.

	:param current:
	:type current: TDF_Label &
	:param N:
	:type N: Handle_TDataStd_NoteBook &
	:rtype: bool
") Find;
		static Standard_Boolean Find (const TDF_Label & current,Handle_TDataStd_NoteBook & N);
		%feature("compactdefaultargs") New;
		%feature("autodoc", "	* Create an enpty NoteBook attribute, located at <label>. Raises if <label> has attribute

	:param label:
	:type label: TDF_Label &
	:rtype: Handle_TDataStd_NoteBook
") New;
		static Handle_TDataStd_NoteBook New (const TDF_Label & label);
		%feature("compactdefaultargs") GetID;
		%feature("autodoc", "	* NoteBook methods ===============

	:rtype: Standard_GUID
") GetID;
		static const Standard_GUID & GetID ();
		%feature("compactdefaultargs") TDataStd_NoteBook;
		%feature("autodoc", "	:rtype: None
") TDataStd_NoteBook;
		 TDataStd_NoteBook ();
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	* Tool to Create an Integer attribute from <value>, Insert it in a new son label of <self>. The Real attribute is returned.

	:param value:
	:type value: float
	:param isExported: default value is Standard_False
	:type isExported: bool
	:rtype: Handle_TDataStd_Real
") Append;
		Handle_TDataStd_Real Append (const Standard_Real value,const Standard_Boolean isExported = Standard_False);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	* Tool to Create an Real attribute from <value>, Insert it in a new son label of <self>. The Integer attribute is returned.

	:param value:
	:type value: int
	:param isExported: default value is Standard_False
	:type isExported: bool
	:rtype: Handle_TDataStd_Integer
") Append;
		Handle_TDataStd_Integer Append (const Standard_Integer value,const Standard_Boolean isExported = Standard_False);
		%feature("compactdefaultargs") ID;
		%feature("autodoc", "	:rtype: Standard_GUID
") ID;
		const Standard_GUID & ID ();
		%feature("compactdefaultargs") Restore;
		%feature("autodoc", "	:param with:
	:type with: Handle_TDF_Attribute &
	:rtype: None
") Restore;
		void Restore (const Handle_TDF_Attribute & with);
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "	:rtype: Handle_TDF_Attribute
") NewEmpty;
		Handle_TDF_Attribute NewEmpty ();
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	:param into:
	:type into: Handle_TDF_Attribute &
	:param RT:
	:type RT: Handle_TDF_RelocationTable &
	:rtype: None
") Paste;
		void Paste (const Handle_TDF_Attribute & into,const Handle_TDF_RelocationTable & RT);

        %feature("autodoc", "1");
        %extend{
            std::string DumpToString() {
            std::stringstream s;
            self->Dump(s);
            return s.str();}
        };
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
		%feature("compactdefaultargs") GetID;
		%feature("autodoc", "	* class methods ============= Returns the GUID for real numbers.

	:rtype: Standard_GUID
") GetID;
		static const Standard_GUID & GetID ();
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "	* Finds, or creates, an Real attribute and sets <value> the Real attribute is returned. the Real dimension is Scalar by default. use SetDimension to overwrite. Real methods ============

	:param label:
	:type label: TDF_Label &
	:param value:
	:type value: float
	:rtype: Handle_TDataStd_Real
") Set;
		static Handle_TDataStd_Real Set (const TDF_Label & label,const Standard_Real value);
		%feature("compactdefaultargs") TDataStd_Real;
		%feature("autodoc", "	:rtype: None
") TDataStd_Real;
		 TDataStd_Real ();
		%feature("compactdefaultargs") SetDimension;
		%feature("autodoc", "	:param DIM:
	:type DIM: TDataStd_RealEnum
	:rtype: None
") SetDimension;
		void SetDimension (const TDataStd_RealEnum DIM);
		%feature("compactdefaultargs") GetDimension;
		%feature("autodoc", "	:rtype: TDataStd_RealEnum
") GetDimension;
		TDataStd_RealEnum GetDimension ();
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "	* Finds or creates the real number V.

	:param V:
	:type V: float
	:rtype: None
") Set;
		void Set (const Standard_Real V);
		%feature("compactdefaultargs") Get;
		%feature("autodoc", "	* Returns the real number value contained in the attribute.

	:rtype: float
") Get;
		Standard_Real Get ();
		%feature("compactdefaultargs") IsCaptured;
		%feature("autodoc", "	* Returns True if there is a reference on the same label

	:rtype: bool
") IsCaptured;
		Standard_Boolean IsCaptured ();
		%feature("compactdefaultargs") ID;
		%feature("autodoc", "	:rtype: Standard_GUID
") ID;
		const Standard_GUID & ID ();
		%feature("compactdefaultargs") Restore;
		%feature("autodoc", "	:param With:
	:type With: Handle_TDF_Attribute &
	:rtype: None
") Restore;
		void Restore (const Handle_TDF_Attribute & With);
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "	:rtype: Handle_TDF_Attribute
") NewEmpty;
		Handle_TDF_Attribute NewEmpty ();
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	:param Into:
	:type Into: Handle_TDF_Attribute &
	:param RT:
	:type RT: Handle_TDF_RelocationTable &
	:rtype: None
") Paste;
		void Paste (const Handle_TDF_Attribute & Into,const Handle_TDF_RelocationTable & RT);

        %feature("autodoc", "1");
        %extend{
            std::string DumpToString() {
            std::stringstream s;
            self->Dump(s);
            return s.str();}
        };
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
		%feature("compactdefaultargs") GetID;
		%feature("autodoc", "	* class methods ============= Returns the GUID for arrays of reals.

	:rtype: Standard_GUID
") GetID;
		static const Standard_GUID & GetID ();
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
	:rtype: Handle_TDataStd_RealArray
") Set;
		static Handle_TDataStd_RealArray Set (const TDF_Label & label,const Standard_Integer lower,const Standard_Integer upper,const Standard_Boolean isDelta = Standard_False);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	* Initialize the inner array with bounds from <lower> to <upper>

	:param lower:
	:type lower: int
	:param upper:
	:type upper: int
	:rtype: None
") Init;
		void Init (const Standard_Integer lower,const Standard_Integer upper);
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	* Sets the <Index>th element of the array to <Value> OutOfRange exception is raised if <Index> doesn't respect Lower and Upper bounds of the internal array.

	:param Index:
	:type Index: int
	:param Value:
	:type Value: float
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const Standard_Real Value);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	* Return the value of the <Index>th element of the array

	:param Index:
	:type Index: int
	:rtype: float
") Value;
		Standard_Real Value (const Standard_Integer Index);
		%feature("compactdefaultargs") Lower;
		%feature("autodoc", "	* Returns the lower boundary of the array.

	:rtype: int
") Lower;
		Standard_Integer Lower ();
		%feature("compactdefaultargs") Upper;
		%feature("autodoc", "	* Returns the upper boundary of the array.

	:rtype: int
") Upper;
		Standard_Integer Upper ();
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "	* Returns the number of elements of the array of reals in terms of the number of elements it contains.

	:rtype: int
") Length;
		Standard_Integer Length ();
		%feature("compactdefaultargs") ChangeArray;
		%feature("autodoc", "	* Sets the inner array <myValue> of the RealArray attribute to <newArray>. If value of <newArray> differs from <myValue>, Backup performed and myValue refers to new instance of HArray1OfReal that holds <newArray> values If <isCheckItems> equal True each item of <newArray> will be checked with each item of <myValue> for coincidence (to avoid backup).

	:param newArray:
	:type newArray: Handle_TColStd_HArray1OfReal &
	:param isCheckItems: default value is Standard_True
	:type isCheckItems: bool
	:rtype: None
") ChangeArray;
		void ChangeArray (const Handle_TColStd_HArray1OfReal & newArray,const Standard_Boolean isCheckItems = Standard_True);
		%feature("compactdefaultargs") Array;
		%feature("autodoc", "	* Returns the handle of this array of reals.

	:rtype: Handle_TColStd_HArray1OfReal
") Array;
		const Handle_TColStd_HArray1OfReal Array ();
		%feature("compactdefaultargs") GetDelta;
		%feature("autodoc", "	:rtype: bool
") GetDelta;
		Standard_Boolean GetDelta ();
		%feature("compactdefaultargs") SetDelta;
		%feature("autodoc", "	* for internal use only!

	:param isDelta:
	:type isDelta: bool
	:rtype: None
") SetDelta;
		void SetDelta (const Standard_Boolean isDelta);
		%feature("compactdefaultargs") TDataStd_RealArray;
		%feature("autodoc", "	:rtype: None
") TDataStd_RealArray;
		 TDataStd_RealArray ();
		%feature("compactdefaultargs") ID;
		%feature("autodoc", "	:rtype: Standard_GUID
") ID;
		const Standard_GUID & ID ();
		%feature("compactdefaultargs") Restore;
		%feature("autodoc", "	:param With:
	:type With: Handle_TDF_Attribute &
	:rtype: None
") Restore;
		void Restore (const Handle_TDF_Attribute & With);
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "	:rtype: Handle_TDF_Attribute
") NewEmpty;
		Handle_TDF_Attribute NewEmpty ();
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	* Note. Uses inside ChangeArray() method

	:param Into:
	:type Into: Handle_TDF_Attribute &
	:param RT:
	:type RT: Handle_TDF_RelocationTable &
	:rtype: None
") Paste;
		void Paste (const Handle_TDF_Attribute & Into,const Handle_TDF_RelocationTable & RT);

        %feature("autodoc", "1");
        %extend{
            std::string DumpToString() {
            std::stringstream s;
            self->Dump(s);
            return s.str();}
        };
        		%feature("compactdefaultargs") DeltaOnModification;
		%feature("autodoc", "	* Makes a DeltaOnModification between <self> and <anOldAttribute>.

	:param anOldAttribute:
	:type anOldAttribute: Handle_TDF_Attribute &
	:rtype: Handle_TDF_DeltaOnModification
") DeltaOnModification;
		virtual Handle_TDF_DeltaOnModification DeltaOnModification (const Handle_TDF_Attribute & anOldAttribute);
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
		%feature("compactdefaultargs") GetID;
		%feature("autodoc", "	* Static methods ============== Returns the ID of the list of doubles attribute.

	:rtype: Standard_GUID
") GetID;
		static const Standard_GUID & GetID ();
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "	* Finds or creates a list of double values attribute.

	:param label:
	:type label: TDF_Label &
	:rtype: Handle_TDataStd_RealList
") Set;
		static Handle_TDataStd_RealList Set (const TDF_Label & label);
		%feature("compactdefaultargs") TDataStd_RealList;
		%feature("autodoc", "	:rtype: None
") TDataStd_RealList;
		 TDataStd_RealList ();
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "	:rtype: bool
") IsEmpty;
		Standard_Boolean IsEmpty ();
		%feature("compactdefaultargs") Extent;
		%feature("autodoc", "	:rtype: int
") Extent;
		Standard_Integer Extent ();
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param value:
	:type value: float
	:rtype: None
") Prepend;
		void Prepend (const Standard_Real value);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param value:
	:type value: float
	:rtype: None
") Append;
		void Append (const Standard_Real value);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	* Inserts the <value> before the first meet of <before_value>.

	:param value:
	:type value: float
	:param before_value:
	:type before_value: float
	:rtype: bool
") InsertBefore;
		Standard_Boolean InsertBefore (const Standard_Real value,const Standard_Real before_value);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	* Inserts the <value> after the first meet of <after_value>.

	:param value:
	:type value: float
	:param after_value:
	:type after_value: float
	:rtype: bool
") InsertAfter;
		Standard_Boolean InsertAfter (const Standard_Real value,const Standard_Real after_value);
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	* Removes the first meet of the <value>.

	:param value:
	:type value: float
	:rtype: bool
") Remove;
		Standard_Boolean Remove (const Standard_Real value);
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") First;
		%feature("autodoc", "	:rtype: float
") First;
		Standard_Real First ();
		%feature("compactdefaultargs") Last;
		%feature("autodoc", "	:rtype: float
") Last;
		Standard_Real Last ();
		%feature("compactdefaultargs") List;
		%feature("autodoc", "	:rtype: TColStd_ListOfReal
") List;
		const TColStd_ListOfReal & List ();
		%feature("compactdefaultargs") ID;
		%feature("autodoc", "	:rtype: Standard_GUID
") ID;
		const Standard_GUID & ID ();
		%feature("compactdefaultargs") Restore;
		%feature("autodoc", "	:param With:
	:type With: Handle_TDF_Attribute &
	:rtype: None
") Restore;
		void Restore (const Handle_TDF_Attribute & With);
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "	:rtype: Handle_TDF_Attribute
") NewEmpty;
		Handle_TDF_Attribute NewEmpty ();
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	:param Into:
	:type Into: Handle_TDF_Attribute &
	:param RT:
	:type RT: Handle_TDF_RelocationTable &
	:rtype: None
") Paste;
		void Paste (const Handle_TDF_Attribute & Into,const Handle_TDF_RelocationTable & RT);

        %feature("autodoc", "1");
        %extend{
            std::string DumpToString() {
            std::stringstream s;
            self->Dump(s);
            return s.str();}
        };
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
		%feature("compactdefaultargs") GetID;
		%feature("autodoc", "	* Static methods ============== Returns the ID of the array of references (labels) attribute.

	:rtype: Standard_GUID
") GetID;
		static const Standard_GUID & GetID ();
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "	* Finds or creates an array of reference values (labels) attribute.

	:param label:
	:type label: TDF_Label &
	:param lower:
	:type lower: int
	:param upper:
	:type upper: int
	:rtype: Handle_TDataStd_ReferenceArray
") Set;
		static Handle_TDataStd_ReferenceArray Set (const TDF_Label & label,const Standard_Integer lower,const Standard_Integer upper);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	* Initialize the inner array with bounds from <lower> to <upper>

	:param lower:
	:type lower: int
	:param upper:
	:type upper: int
	:rtype: None
") Init;
		void Init (const Standard_Integer lower,const Standard_Integer upper);
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	* Sets the <Index>th element of the array to <Value> OutOfRange exception is raised if <Index> doesn't respect Lower and Upper bounds of the internal array.

	:param index:
	:type index: int
	:param value:
	:type value: TDF_Label &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer index,const TDF_Label & value);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	* Returns the value of the <Index>th element of the array.

	:param Index:
	:type Index: int
	:rtype: TDF_Label
") Value;
		TDF_Label Value (const Standard_Integer Index);
		%feature("compactdefaultargs") Lower;
		%feature("autodoc", "	* Returns the lower boundary of the array.

	:rtype: int
") Lower;
		Standard_Integer Lower ();
		%feature("compactdefaultargs") Upper;
		%feature("autodoc", "	* Returns the upper boundary of the array.

	:rtype: int
") Upper;
		Standard_Integer Upper ();
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "	* Returns the number of elements in the array.

	:rtype: int
") Length;
		Standard_Integer Length ();
		%feature("compactdefaultargs") InternalArray;
		%feature("autodoc", "	:rtype: Handle_TDataStd_HLabelArray1
") InternalArray;
		Handle_TDataStd_HLabelArray1 InternalArray ();
		%feature("compactdefaultargs") SetInternalArray;
		%feature("autodoc", "	:param values:
	:type values: Handle_TDataStd_HLabelArray1 &
	:param isCheckItems: default value is Standard_True
	:type isCheckItems: bool
	:rtype: None
") SetInternalArray;
		void SetInternalArray (const Handle_TDataStd_HLabelArray1 & values,const Standard_Boolean isCheckItems = Standard_True);
		%feature("compactdefaultargs") TDataStd_ReferenceArray;
		%feature("autodoc", "	:rtype: None
") TDataStd_ReferenceArray;
		 TDataStd_ReferenceArray ();
		%feature("compactdefaultargs") ID;
		%feature("autodoc", "	:rtype: Standard_GUID
") ID;
		const Standard_GUID & ID ();
		%feature("compactdefaultargs") Restore;
		%feature("autodoc", "	:param With:
	:type With: Handle_TDF_Attribute &
	:rtype: None
") Restore;
		void Restore (const Handle_TDF_Attribute & With);
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "	:rtype: Handle_TDF_Attribute
") NewEmpty;
		Handle_TDF_Attribute NewEmpty ();
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	:param Into:
	:type Into: Handle_TDF_Attribute &
	:param RT:
	:type RT: Handle_TDF_RelocationTable &
	:rtype: None
") Paste;
		void Paste (const Handle_TDF_Attribute & Into,const Handle_TDF_RelocationTable & RT);
		%feature("compactdefaultargs") References;
		%feature("autodoc", "	:param DS:
	:type DS: Handle_TDF_DataSet &
	:rtype: void
") References;
		virtual void References (const Handle_TDF_DataSet & DS);

        %feature("autodoc", "1");
        %extend{
            std::string DumpToString() {
            std::stringstream s;
            self->Dump(s);
            return s.str();}
        };
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
		%feature("compactdefaultargs") GetID;
		%feature("autodoc", "	* Static methods ============== Returns the ID of the list of references (labels) attribute.

	:rtype: Standard_GUID
") GetID;
		static const Standard_GUID & GetID ();
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "	* Finds or creates a list of reference values (labels) attribute.

	:param label:
	:type label: TDF_Label &
	:rtype: Handle_TDataStd_ReferenceList
") Set;
		static Handle_TDataStd_ReferenceList Set (const TDF_Label & label);
		%feature("compactdefaultargs") TDataStd_ReferenceList;
		%feature("autodoc", "	:rtype: None
") TDataStd_ReferenceList;
		 TDataStd_ReferenceList ();
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "	:rtype: bool
") IsEmpty;
		Standard_Boolean IsEmpty ();
		%feature("compactdefaultargs") Extent;
		%feature("autodoc", "	:rtype: int
") Extent;
		Standard_Integer Extent ();
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param value:
	:type value: TDF_Label &
	:rtype: None
") Prepend;
		void Prepend (const TDF_Label & value);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param value:
	:type value: TDF_Label &
	:rtype: None
") Append;
		void Append (const TDF_Label & value);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	* Inserts the <value> before the first meet of <before_value>.

	:param value:
	:type value: TDF_Label &
	:param before_value:
	:type before_value: TDF_Label &
	:rtype: bool
") InsertBefore;
		Standard_Boolean InsertBefore (const TDF_Label & value,const TDF_Label & before_value);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	* Inserts the <value> after the first meet of <after_value>.

	:param value:
	:type value: TDF_Label &
	:param after_value:
	:type after_value: TDF_Label &
	:rtype: bool
") InsertAfter;
		Standard_Boolean InsertAfter (const TDF_Label & value,const TDF_Label & after_value);
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	* Removes the first meet of the <value>.

	:param value:
	:type value: TDF_Label &
	:rtype: bool
") Remove;
		Standard_Boolean Remove (const TDF_Label & value);
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") First;
		%feature("autodoc", "	:rtype: TDF_Label
") First;
		const TDF_Label & First ();
		%feature("compactdefaultargs") Last;
		%feature("autodoc", "	:rtype: TDF_Label
") Last;
		const TDF_Label & Last ();
		%feature("compactdefaultargs") List;
		%feature("autodoc", "	:rtype: TDF_LabelList
") List;
		const TDF_LabelList & List ();
		%feature("compactdefaultargs") ID;
		%feature("autodoc", "	:rtype: Standard_GUID
") ID;
		const Standard_GUID & ID ();
		%feature("compactdefaultargs") Restore;
		%feature("autodoc", "	:param With:
	:type With: Handle_TDF_Attribute &
	:rtype: None
") Restore;
		void Restore (const Handle_TDF_Attribute & With);
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "	:rtype: Handle_TDF_Attribute
") NewEmpty;
		Handle_TDF_Attribute NewEmpty ();
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	:param Into:
	:type Into: Handle_TDF_Attribute &
	:param RT:
	:type RT: Handle_TDF_RelocationTable &
	:rtype: None
") Paste;
		void Paste (const Handle_TDF_Attribute & Into,const Handle_TDF_RelocationTable & RT);
		%feature("compactdefaultargs") References;
		%feature("autodoc", "	:param DS:
	:type DS: Handle_TDF_DataSet &
	:rtype: void
") References;
		virtual void References (const Handle_TDF_DataSet & DS);

        %feature("autodoc", "1");
        %extend{
            std::string DumpToString() {
            std::stringstream s;
            self->Dump(s);
            return s.str();}
        };
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
		%feature("compactdefaultargs") GetID;
		%feature("autodoc", "	* class methods =============

	:rtype: Standard_GUID
") GetID;
		static const Standard_GUID & GetID ();
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "	* Find, or create, an Relation attribute. Real methods ============

	:param label:
	:type label: TDF_Label &
	:rtype: Handle_TDataStd_Relation
") Set;
		static Handle_TDataStd_Relation Set (const TDF_Label & label);
		%feature("compactdefaultargs") TDataStd_Relation;
		%feature("autodoc", "	:rtype: None
") TDataStd_Relation;
		 TDataStd_Relation ();
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "	* build and return the relation name

	:rtype: TCollection_ExtendedString
") Name;
		TCollection_ExtendedString Name ();
		%feature("compactdefaultargs") SetRelation;
		%feature("autodoc", "	:param E:
	:type E: TCollection_ExtendedString &
	:rtype: None
") SetRelation;
		void SetRelation (const TCollection_ExtendedString & E);
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
		%feature("compactdefaultargs") Restore;
		%feature("autodoc", "	:param With:
	:type With: Handle_TDF_Attribute &
	:rtype: None
") Restore;
		void Restore (const Handle_TDF_Attribute & With);
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "	:rtype: Handle_TDF_Attribute
") NewEmpty;
		Handle_TDF_Attribute NewEmpty ();
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	:param Into:
	:type Into: Handle_TDF_Attribute &
	:param RT:
	:type RT: Handle_TDF_RelocationTable &
	:rtype: None
") Paste;
		void Paste (const Handle_TDF_Attribute & Into,const Handle_TDF_RelocationTable & RT);

        %feature("autodoc", "1");
        %extend{
            std::string DumpToString() {
            std::stringstream s;
            self->Dump(s);
            return s.str();}
        };
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
		%feature("compactdefaultargs") GetID;
		%feature("autodoc", "	* Static methods ==============

	:rtype: Standard_GUID
") GetID;
		static const Standard_GUID & GetID ();
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "	* Find, or create, a Tick attribute. Tick methods ============

	:param label:
	:type label: TDF_Label &
	:rtype: Handle_TDataStd_Tick
") Set;
		static Handle_TDataStd_Tick Set (const TDF_Label & label);
		%feature("compactdefaultargs") TDataStd_Tick;
		%feature("autodoc", "	:rtype: None
") TDataStd_Tick;
		 TDataStd_Tick ();
		%feature("compactdefaultargs") ID;
		%feature("autodoc", "	:rtype: Standard_GUID
") ID;
		const Standard_GUID & ID ();
		%feature("compactdefaultargs") Restore;
		%feature("autodoc", "	:param With:
	:type With: Handle_TDF_Attribute &
	:rtype: None
") Restore;
		void Restore (const Handle_TDF_Attribute & With);
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "	:rtype: Handle_TDF_Attribute
") NewEmpty;
		Handle_TDF_Attribute NewEmpty ();
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	:param Into:
	:type Into: Handle_TDF_Attribute &
	:param RT:
	:type RT: Handle_TDF_RelocationTable &
	:rtype: None
") Paste;
		void Paste (const Handle_TDF_Attribute & Into,const Handle_TDF_RelocationTable & RT);

        %feature("autodoc", "1");
        %extend{
            std::string DumpToString() {
            std::stringstream s;
            self->Dump(s);
            return s.str();}
        };
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
		%feature("compactdefaultargs") Find;
		%feature("autodoc", "	* class methods working on the node =================================== Returns true if the tree node T is found on the label L. Otherwise, false is returned.

	:param L:
	:type L: TDF_Label &
	:param T:
	:type T: Handle_TDataStd_TreeNode &
	:rtype: bool
") Find;
		static Standard_Boolean Find (const TDF_Label & L,Handle_TDataStd_TreeNode & T);
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "	* Finds or Creates a TreeNode attribute on the label <L> with the default tree ID, returned by the method <GetDefaultTreeID>. Returns the created/found TreeNode attribute.

	:param L:
	:type L: TDF_Label &
	:rtype: Handle_TDataStd_TreeNode
") Set;
		static Handle_TDataStd_TreeNode Set (const TDF_Label & L);
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "	* Finds or Creates a TreeNode attribute on the label <L>, with an explicit tree ID. <ExplicitTreeID> is the ID returned by <TDF_Attribute::ID> method. Returns the found/created TreeNode attribute.

	:param L:
	:type L: TDF_Label &
	:param ExplicitTreeID:
	:type ExplicitTreeID: Standard_GUID &
	:rtype: Handle_TDataStd_TreeNode
") Set;
		static Handle_TDataStd_TreeNode Set (const TDF_Label & L,const Standard_GUID & ExplicitTreeID);
		%feature("compactdefaultargs") GetDefaultTreeID;
		%feature("autodoc", "	* returns a default tree ID. this ID is used by the <Set> method without explicit tree ID. Instance methods: ================

	:rtype: Standard_GUID
") GetDefaultTreeID;
		static const Standard_GUID & GetDefaultTreeID ();
		%feature("compactdefaultargs") TDataStd_TreeNode;
		%feature("autodoc", "	:rtype: None
") TDataStd_TreeNode;
		 TDataStd_TreeNode ();
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	* Insert the TreeNode <Child> as last child of <self>. If the insertion is successful <self> becomes the Father of <Child>.

	:param Child:
	:type Child: Handle_TDataStd_TreeNode &
	:rtype: bool
") Append;
		Standard_Boolean Append (const Handle_TDataStd_TreeNode & Child);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	* Insert the the TreeNode <Child> as first child of <self>. If the insertion is successful <self> becomes the Father of <Child>

	:param Child:
	:type Child: Handle_TDataStd_TreeNode &
	:rtype: bool
") Prepend;
		Standard_Boolean Prepend (const Handle_TDataStd_TreeNode & Child);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	* Inserts the TreeNode <Node> before <self>. If insertion is successful <self> and <Node> belongs to the same Father.

	:param Node:
	:type Node: Handle_TDataStd_TreeNode &
	:rtype: bool
") InsertBefore;
		Standard_Boolean InsertBefore (const Handle_TDataStd_TreeNode & Node);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	* Inserts the TreeNode <Node> after <self>. If insertion is successful <self> and <Node> belongs to the same Father.

	:param Node:
	:type Node: Handle_TDataStd_TreeNode &
	:rtype: bool
") InsertAfter;
		Standard_Boolean InsertAfter (const Handle_TDataStd_TreeNode & Node);
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	* Removes this tree node attribute from its father node. The result is that this attribute becomes a root node.

	:rtype: bool
") Remove;
		Standard_Boolean Remove ();
		%feature("compactdefaultargs") Depth;
		%feature("autodoc", "	* Returns the depth of this tree node in the overall tree node structure. In other words, the number of father tree nodes of this one is returned.

	:rtype: int
") Depth;
		Standard_Integer Depth ();
		%feature("compactdefaultargs") NbChildren;
		%feature("autodoc", "	* Returns the number of child nodes. If <allLevels> is true, the method counts children of all levels (children of children ...)

	:param allLevels: default value is Standard_False
	:type allLevels: bool
	:rtype: int
") NbChildren;
		Standard_Integer NbChildren (const Standard_Boolean allLevels = Standard_False);
		%feature("compactdefaultargs") IsAscendant;
		%feature("autodoc", "	* Returns true if this tree node attribute is an ascendant of of. In other words, if it is a father or the father of a father of of.

	:param of:
	:type of: Handle_TDataStd_TreeNode &
	:rtype: bool
") IsAscendant;
		Standard_Boolean IsAscendant (const Handle_TDataStd_TreeNode & of);
		%feature("compactdefaultargs") IsDescendant;
		%feature("autodoc", "	* Returns true if this tree node attribute is a descendant of of. In other words, if it is a child or the child of a child of of.

	:param of:
	:type of: Handle_TDataStd_TreeNode &
	:rtype: bool
") IsDescendant;
		Standard_Boolean IsDescendant (const Handle_TDataStd_TreeNode & of);
		%feature("compactdefaultargs") IsRoot;
		%feature("autodoc", "	* Returns true if this tree node attribute is the ultimate father in the tree.

	:rtype: bool
") IsRoot;
		Standard_Boolean IsRoot ();
		%feature("compactdefaultargs") Root;
		%feature("autodoc", "	* Returns the ultimate father of this tree node attribute.

	:rtype: Handle_TDataStd_TreeNode
") Root;
		Handle_TDataStd_TreeNode Root ();
		%feature("compactdefaultargs") IsFather;
		%feature("autodoc", "	* Returns true if this tree node attribute is a father of of.

	:param of:
	:type of: Handle_TDataStd_TreeNode &
	:rtype: bool
") IsFather;
		Standard_Boolean IsFather (const Handle_TDataStd_TreeNode & of);
		%feature("compactdefaultargs") IsChild;
		%feature("autodoc", "	* Returns true if this tree node attribute is a child of of.

	:param of:
	:type of: Handle_TDataStd_TreeNode &
	:rtype: bool
") IsChild;
		Standard_Boolean IsChild (const Handle_TDataStd_TreeNode & of);
		%feature("compactdefaultargs") HasFather;
		%feature("autodoc", "	* Returns true if this tree node attribute has a father tree node.

	:rtype: bool
") HasFather;
		Standard_Boolean HasFather ();
		%feature("compactdefaultargs") Father;
		%feature("autodoc", "	* Returns the father TreeNode of <self>. Null if root.

	:rtype: Handle_TDataStd_TreeNode
") Father;
		Handle_TDataStd_TreeNode Father ();
		%feature("compactdefaultargs") HasNext;
		%feature("autodoc", "	* Returns true if this tree node attribute has a next tree node.

	:rtype: bool
") HasNext;
		Standard_Boolean HasNext ();
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "	* Returns the next tree node in this tree node attribute. Warning This tree node is null if it is the last one in this tree node attribute.Returns the next TreeNode of <self>. Null if last.

	:rtype: Handle_TDataStd_TreeNode
") Next;
		Handle_TDataStd_TreeNode Next ();
		%feature("compactdefaultargs") HasPrevious;
		%feature("autodoc", "	* Returns true if this tree node attribute has a previous tree node.

	:rtype: bool
") HasPrevious;
		Standard_Boolean HasPrevious ();
		%feature("compactdefaultargs") Previous;
		%feature("autodoc", "	* Returns the previous tree node of this tree node attribute. Warning This tree node is null if it is the first one in this tree node attribute.

	:rtype: Handle_TDataStd_TreeNode
") Previous;
		Handle_TDataStd_TreeNode Previous ();
		%feature("compactdefaultargs") HasFirst;
		%feature("autodoc", "	* Returns true if this tree node attribute has a first child tree node.

	:rtype: bool
") HasFirst;
		Standard_Boolean HasFirst ();
		%feature("compactdefaultargs") First;
		%feature("autodoc", "	* Returns the first child tree node in this tree node object.

	:rtype: Handle_TDataStd_TreeNode
") First;
		Handle_TDataStd_TreeNode First ();
		%feature("compactdefaultargs") HasLast;
		%feature("autodoc", "	* Returns true if this tree node attribute has a last child tree node.

	:rtype: bool
") HasLast;
		Standard_Boolean HasLast ();
		%feature("compactdefaultargs") Last;
		%feature("autodoc", "	* Returns the last child tree node in this tree node object.

	:rtype: Handle_TDataStd_TreeNode
") Last;
		Handle_TDataStd_TreeNode Last ();
		%feature("compactdefaultargs") FindLast;
		%feature("autodoc", "	* Returns the last child tree node in this tree node object. to set fields =============

	:rtype: Handle_TDataStd_TreeNode
") FindLast;
		Handle_TDataStd_TreeNode FindLast ();
		%feature("compactdefaultargs") SetTreeID;
		%feature("autodoc", "	:param explicitID:
	:type explicitID: Standard_GUID &
	:rtype: None
") SetTreeID;
		void SetTreeID (const Standard_GUID & explicitID);
		%feature("compactdefaultargs") SetFather;
		%feature("autodoc", "	:param F:
	:type F: Handle_TDataStd_TreeNode &
	:rtype: None
") SetFather;
		void SetFather (const Handle_TDataStd_TreeNode & F);
		%feature("compactdefaultargs") SetNext;
		%feature("autodoc", "	:param F:
	:type F: Handle_TDataStd_TreeNode &
	:rtype: None
") SetNext;
		void SetNext (const Handle_TDataStd_TreeNode & F);
		%feature("compactdefaultargs") SetPrevious;
		%feature("autodoc", "	:param F:
	:type F: Handle_TDataStd_TreeNode &
	:rtype: None
") SetPrevious;
		void SetPrevious (const Handle_TDataStd_TreeNode & F);
		%feature("compactdefaultargs") SetFirst;
		%feature("autodoc", "	:param F:
	:type F: Handle_TDataStd_TreeNode &
	:rtype: None
") SetFirst;
		void SetFirst (const Handle_TDataStd_TreeNode & F);
		%feature("compactdefaultargs") SetLast;
		%feature("autodoc", "	* TreeNode callback: ==================

	:param F:
	:type F: Handle_TDataStd_TreeNode &
	:rtype: None
") SetLast;
		void SetLast (const Handle_TDataStd_TreeNode & F);
		%feature("compactdefaultargs") AfterAddition;
		%feature("autodoc", "	* Connect the TreeNode to its father child list

	:rtype: void
") AfterAddition;
		virtual void AfterAddition ();
		%feature("compactdefaultargs") BeforeForget;
		%feature("autodoc", "	* Disconnect the TreeNode from its Father child list

	:rtype: void
") BeforeForget;
		virtual void BeforeForget ();
		%feature("compactdefaultargs") AfterResume;
		%feature("autodoc", "	* Reconnect the TreeNode to its father child list.

	:rtype: void
") AfterResume;
		virtual void AfterResume ();
		%feature("compactdefaultargs") BeforeUndo;
		%feature("autodoc", "	* Disconnect the TreeNode, if necessary.

	:param anAttDelta:
	:type anAttDelta: Handle_TDF_AttributeDelta &
	:param forceIt: default value is Standard_False
	:type forceIt: bool
	:rtype: bool
") BeforeUndo;
		virtual Standard_Boolean BeforeUndo (const Handle_TDF_AttributeDelta & anAttDelta,const Standard_Boolean forceIt = Standard_False);
		%feature("compactdefaultargs") AfterUndo;
		%feature("autodoc", "	* Reconnect the TreeNode, if necessary. Implementation of Attribute methods: ===================================

	:param anAttDelta:
	:type anAttDelta: Handle_TDF_AttributeDelta &
	:param forceIt: default value is Standard_False
	:type forceIt: bool
	:rtype: bool
") AfterUndo;
		virtual Standard_Boolean AfterUndo (const Handle_TDF_AttributeDelta & anAttDelta,const Standard_Boolean forceIt = Standard_False);
		%feature("compactdefaultargs") ID;
		%feature("autodoc", "	* Returns the tree ID (default or explicit one depending onthe Set method used).

	:rtype: Standard_GUID
") ID;
		const Standard_GUID & ID ();
		%feature("compactdefaultargs") Restore;
		%feature("autodoc", "	:param with:
	:type with: Handle_TDF_Attribute &
	:rtype: void
") Restore;
		virtual void Restore (const Handle_TDF_Attribute & with);
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	:param into:
	:type into: Handle_TDF_Attribute &
	:param RT:
	:type RT: Handle_TDF_RelocationTable &
	:rtype: void
") Paste;
		virtual void Paste (const Handle_TDF_Attribute & into,const Handle_TDF_RelocationTable & RT);
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "	:rtype: Handle_TDF_Attribute
") NewEmpty;
		virtual Handle_TDF_Attribute NewEmpty ();
		%feature("compactdefaultargs") References;
		%feature("autodoc", "	:param aDataSet:
	:type aDataSet: Handle_TDF_DataSet &
	:rtype: void
") References;
		virtual void References (const Handle_TDF_DataSet & aDataSet);

        %feature("autodoc", "1");
        %extend{
            std::string DumpToString() {
            std::stringstream s;
            self->Dump(s);
            return s.str();}
        };
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
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "	* api class methods ============= Find, or create, a UAttribute attribute with <LocalID> as Local GUID. The UAttribute attribute is returned. UAttribute methods ============

	:param label:
	:type label: TDF_Label &
	:param LocalID:
	:type LocalID: Standard_GUID &
	:rtype: Handle_TDataStd_UAttribute
") Set;
		static Handle_TDataStd_UAttribute Set (const TDF_Label & label,const Standard_GUID & LocalID);
		%feature("compactdefaultargs") TDataStd_UAttribute;
		%feature("autodoc", "	:rtype: None
") TDataStd_UAttribute;
		 TDataStd_UAttribute ();
		%feature("compactdefaultargs") SetID;
		%feature("autodoc", "	:param LocalID:
	:type LocalID: Standard_GUID &
	:rtype: None
") SetID;
		void SetID (const Standard_GUID & LocalID);
		%feature("compactdefaultargs") ID;
		%feature("autodoc", "	:rtype: Standard_GUID
") ID;
		const Standard_GUID & ID ();
		%feature("compactdefaultargs") Restore;
		%feature("autodoc", "	:param with:
	:type with: Handle_TDF_Attribute &
	:rtype: None
") Restore;
		void Restore (const Handle_TDF_Attribute & with);
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "	:rtype: Handle_TDF_Attribute
") NewEmpty;
		Handle_TDF_Attribute NewEmpty ();
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	:param into:
	:type into: Handle_TDF_Attribute &
	:param RT:
	:type RT: Handle_TDF_RelocationTable &
	:rtype: None
") Paste;
		void Paste (const Handle_TDF_Attribute & into,const Handle_TDF_RelocationTable & RT);
		%feature("compactdefaultargs") References;
		%feature("autodoc", "	:param DS:
	:type DS: Handle_TDF_DataSet &
	:rtype: void
") References;
		virtual void References (const Handle_TDF_DataSet & DS);

        %feature("autodoc", "1");
        %extend{
            std::string DumpToString() {
            std::stringstream s;
            self->Dump(s);
            return s.str();}
        };
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
		%feature("compactdefaultargs") GetID;
		%feature("autodoc", "	* class methods =============

	:rtype: Standard_GUID
") GetID;
		static const Standard_GUID & GetID ();
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "	* Find, or create, a Variable attribute. Real methods ============

	:param label:
	:type label: TDF_Label &
	:rtype: Handle_TDataStd_Variable
") Set;
		static Handle_TDataStd_Variable Set (const TDF_Label & label);
		%feature("compactdefaultargs") TDataStd_Variable;
		%feature("autodoc", "	:rtype: None
") TDataStd_Variable;
		 TDataStd_Variable ();
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
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "	* retrieve or create the associated real attribute and set the value <value>. if creation, dimension is written.

	:param value:
	:type value: float
	:param dimension: default value is TDataStd_SCALAR
	:type dimension: TDataStd_RealEnum
	:rtype: None
") Set;
		void Set (const Standard_Real value,const TDataStd_RealEnum dimension = TDataStd_SCALAR);
		%feature("compactdefaultargs") IsValued;
		%feature("autodoc", "	* returns True if a Real attribute is associated.

	:rtype: bool
") IsValued;
		Standard_Boolean IsValued ();
		%feature("compactdefaultargs") Get;
		%feature("autodoc", "	* returns value stored in associated Real attribute.

	:rtype: float
") Get;
		Standard_Real Get ();
		%feature("compactdefaultargs") Real;
		%feature("autodoc", "	* returns associated Real attribute.

	:rtype: Handle_TDataStd_Real
") Real;
		Handle_TDataStd_Real Real ();
		%feature("compactdefaultargs") IsAssigned;
		%feature("autodoc", "	* returns True if an Expression attribute is associated. create(if doesn't exist), set and returns the assigned expression attribute.

	:rtype: bool
") IsAssigned;
		Standard_Boolean IsAssigned ();
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	* create(if doesn't exist) and returns the assigned expression attribute. fill it after.

	:rtype: Handle_TDataStd_Expression
") Assign;
		Handle_TDataStd_Expression Assign ();
		%feature("compactdefaultargs") Desassign;
		%feature("autodoc", "	* if <self> is assigned delete the associated expression attribute.

	:rtype: None
") Desassign;
		void Desassign ();
		%feature("compactdefaultargs") Expression;
		%feature("autodoc", "	* if <self> is assigned, returns associated Expression attribute.

	:rtype: Handle_TDataStd_Expression
") Expression;
		Handle_TDataStd_Expression Expression ();
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
		%feature("compactdefaultargs") Constant;
		%feature("autodoc", "	* if <status> is True, this variable will not be modified by the solver.

	:param status:
	:type status: bool
	:rtype: None
") Constant;
		void Constant (const Standard_Boolean status);
		%feature("compactdefaultargs") ID;
		%feature("autodoc", "	:rtype: Standard_GUID
") ID;
		const Standard_GUID & ID ();
		%feature("compactdefaultargs") Restore;
		%feature("autodoc", "	:param With:
	:type With: Handle_TDF_Attribute &
	:rtype: None
") Restore;
		void Restore (const Handle_TDF_Attribute & With);
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "	:rtype: Handle_TDF_Attribute
") NewEmpty;
		Handle_TDF_Attribute NewEmpty ();
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	:param Into:
	:type Into: Handle_TDF_Attribute &
	:param RT:
	:type RT: Handle_TDF_RelocationTable &
	:rtype: None
") Paste;
		void Paste (const Handle_TDF_Attribute & Into,const Handle_TDF_RelocationTable & RT);
		%feature("compactdefaultargs") References;
		%feature("autodoc", "	* to export reference to the associated Name attribute.

	:param DS:
	:type DS: Handle_TDF_DataSet &
	:rtype: void
") References;
		virtual void References (const Handle_TDF_DataSet & DS);

        %feature("autodoc", "1");
        %extend{
            std::string DumpToString() {
            std::stringstream s;
            self->Dump(s);
            return s.str();}
        };
        };


%make_alias(TDataStd_Variable)

%extend TDataStd_Variable {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
