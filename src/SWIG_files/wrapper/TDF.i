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
%define TDFDOCSTRING
"TDF module, see official documentation at
https://dev.opencascade.org/doc/occt-7.9.0/refman/html/package_tdf.html"
%enddef
%module (package="OCC.Core", docstring=TDFDOCSTRING) TDF


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
#include<TDF_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<TCollection_module.hxx>
#include<TColStd_module.hxx>
#include<TDataStd_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import TCollection.i
%import TColStd.i

%pythoncode {
from enum import IntEnum
from OCC.Core.Exception import *
};

/* public enums */
enum  {
	TDF_LabelNodeImportMsk = ( int ) 0x80000000,
	TDF_LabelNodeAttModMsk = 1073741824,
	TDF_LabelNodeMayModMsk = 536870912,
	TDF_LabelNodeFlagsMsk = ( TDF_LabelNodeImportMsk | TDF_LabelNodeAttModMsk | TDF_LabelNodeMayModMsk ),
};

/* end public enums declaration */

/* python proxy classes for enums */
%pythoncode {
};
/* end python proxy for enums */

/* handles */
%wrap_handle(TDF_Attribute)
%wrap_handle(TDF_AttributeDelta)
%wrap_handle(TDF_Data)
%wrap_handle(TDF_DataSet)
%wrap_handle(TDF_Delta)
%wrap_handle(TDF_RelocationTable)
%wrap_handle(TDF_DeltaOnAddition)
%wrap_handle(TDF_DeltaOnForget)
%wrap_handle(TDF_DeltaOnModification)
%wrap_handle(TDF_DeltaOnRemoval)
%wrap_handle(TDF_DeltaOnResume)
%wrap_handle(TDF_Reference)
%wrap_handle(TDF_TagSource)
%wrap_handle(TDF_DefaultDeltaOnModification)
%wrap_handle(TDF_DefaultDeltaOnRemoval)
%wrap_handle(TDF_HAttributeArray1)
/* end handles declaration */

/* templates */
%template(TDF_AttributeArray1) NCollection_Array1<opencascade::handle<TDF_Attribute>>;
Array1ExtendIter(opencascade::handle<TDF_Attribute>)

%template(TDF_AttributeDataMap) NCollection_DataMap<opencascade::handle<TDF_Attribute>,opencascade::handle<TDF_Attribute>>;
%template(TDF_AttributeDeltaList) NCollection_List<opencascade::handle<TDF_AttributeDelta>>;

%extend NCollection_List<opencascade::handle<TDF_AttributeDelta>> {
    %pythoncode {
    def __len__(self):
        return self.Size()

    def __iter__(self):
        it = TDF_ListIteratorOfAttributeDeltaList(self.this)
        while it.More():
            yield it.Value()
            it.Next()
    }
};
%template(TDF_AttributeDoubleMap) NCollection_DoubleMap<opencascade::handle<TDF_Attribute>,opencascade::handle<TDF_Attribute>>;
%template(TDF_AttributeIndexedMap) NCollection_IndexedMap<opencascade::handle<TDF_Attribute>>;
%template(TDF_AttributeList) NCollection_List<opencascade::handle<TDF_Attribute>>;

%extend NCollection_List<opencascade::handle<TDF_Attribute>> {
    %pythoncode {
    def __len__(self):
        return self.Size()

    def __iter__(self):
        it = TDF_ListIteratorOfAttributeList(self.this)
        while it.More():
            yield it.Value()
            it.Next()
    }
};
%template(TDF_AttributeMap) NCollection_Map<opencascade::handle<TDF_Attribute>>;
%template(TDF_AttributeSequence) NCollection_Sequence<opencascade::handle<TDF_Attribute>>;

%extend NCollection_Sequence<opencascade::handle<TDF_Attribute>> {
    %pythoncode {
    def __len__(self):
        return self.Size()
    }
};
%template(TDF_DeltaList) NCollection_List<opencascade::handle<TDF_Delta>>;

%extend NCollection_List<opencascade::handle<TDF_Delta>> {
    %pythoncode {
    def __len__(self):
        return self.Size()

    def __iter__(self):
        it = TDF_ListIteratorOfDeltaList(self.this)
        while it.More():
            yield it.Value()
            it.Next()
    }
};
%template(TDF_GUIDProgIDMap) NCollection_DoubleMap<Standard_GUID,TCollection_ExtendedString>;
%template(TDF_HAllocator) opencascade::handle<NCollection_BaseAllocator>;
%template(TDF_IDList) NCollection_List<Standard_GUID>;

%extend NCollection_List<Standard_GUID> {
    %pythoncode {
    def __len__(self):
        return self.Size()

    def __iter__(self):
        it = TDF_ListIteratorOfIDList(self.this)
        while it.More():
            yield it.Value()
            it.Next()
    }
};
%template(TDF_IDMap) NCollection_Map<Standard_GUID>;
%template(TDF_LabelDataMap) NCollection_DataMap<TDF_Label,TDF_Label>;
%template(TDF_LabelDoubleMap) NCollection_DoubleMap<TDF_Label,TDF_Label>;
%template(TDF_LabelIndexedMap) NCollection_IndexedMap<TDF_Label>;
%template(TDF_LabelIntegerMap) NCollection_DataMap<TDF_Label,Standard_Integer>;
%template(TDF_LabelList) NCollection_List<TDF_Label>;

%extend NCollection_List<TDF_Label> {
    %pythoncode {
    def __len__(self):
        return self.Size()

    def __iter__(self):
        it = TDF_ListIteratorOfLabelList(self.this)
        while it.More():
            yield it.Value()
            it.Next()
    }
};
%template(TDF_LabelMap) NCollection_Map<TDF_Label>;
%template(TDF_LabelSequence) NCollection_Sequence<TDF_Label>;

%extend NCollection_Sequence<TDF_Label> {
    %pythoncode {
    def __len__(self):
        return self.Size()
    }
};
%template(TDF_ListIteratorOfAttributeDeltaList) NCollection_TListIterator<opencascade::handle<TDF_AttributeDelta>>;
%template(TDF_ListIteratorOfAttributeList) NCollection_TListIterator<opencascade::handle<TDF_Attribute>>;
%template(TDF_ListIteratorOfDeltaList) NCollection_TListIterator<opencascade::handle<TDF_Delta>>;
%template(TDF_ListIteratorOfIDList) NCollection_TListIterator<Standard_GUID>;
%template(TDF_ListIteratorOfLabelList) NCollection_TListIterator<TDF_Label>;
/* end templates declaration */

/* typedefs */
typedef NCollection_Array1<opencascade::handle<TDF_Attribute>> TDF_AttributeArray1;
typedef NCollection_DataMap<opencascade::handle<TDF_Attribute>, opencascade::handle<TDF_Attribute>> TDF_AttributeDataMap;
typedef NCollection_List<opencascade::handle<TDF_AttributeDelta>> TDF_AttributeDeltaList;
typedef NCollection_DoubleMap<opencascade::handle<TDF_Attribute>, opencascade::handle<TDF_Attribute>> TDF_AttributeDoubleMap;
typedef NCollection_IndexedMap<opencascade::handle<TDF_Attribute>> TDF_AttributeIndexedMap;
typedef NCollection_List<opencascade::handle<TDF_Attribute>> TDF_AttributeList;
typedef NCollection_Map<opencascade::handle<TDF_Attribute>> TDF_AttributeMap;
typedef NCollection_Sequence<opencascade::handle<TDF_Attribute>> TDF_AttributeSequence;
typedef NCollection_DataMap<opencascade::handle<TDF_Attribute>, opencascade::handle<TDF_Attribute>>::Iterator TDF_DataMapIteratorOfAttributeDataMap;
typedef NCollection_DataMap<TDF_Label, TDF_Label>::Iterator TDF_DataMapIteratorOfLabelDataMap;
typedef NCollection_DataMap<TDF_Label, Standard_Integer>::Iterator TDF_DataMapIteratorOfLabelIntegerMap;
typedef NCollection_List<opencascade::handle<TDF_Delta>> TDF_DeltaList;
typedef NCollection_DoubleMap<opencascade::handle<TDF_Attribute>, opencascade::handle<TDF_Attribute>>::Iterator TDF_DoubleMapIteratorOfAttributeDoubleMap;
typedef NCollection_DoubleMap<Standard_GUID, TCollection_ExtendedString>::Iterator TDF_DoubleMapIteratorOfGUIDProgIDMap;
typedef NCollection_DoubleMap<TDF_Label, TDF_Label>::Iterator TDF_DoubleMapIteratorOfLabelDoubleMap;
typedef NCollection_DoubleMap<Standard_GUID, TCollection_ExtendedString> TDF_GUIDProgIDMap;
typedef opencascade::handle<NCollection_BaseAllocator> TDF_HAllocator;
typedef NCollection_List<Standard_GUID> TDF_IDList;
typedef NCollection_Map<Standard_GUID> TDF_IDMap;
typedef NCollection_DataMap<TDF_Label, TDF_Label> TDF_LabelDataMap;
typedef NCollection_DoubleMap<TDF_Label, TDF_Label> TDF_LabelDoubleMap;
typedef NCollection_IndexedMap<TDF_Label> TDF_LabelIndexedMap;
typedef NCollection_DataMap<TDF_Label, Standard_Integer> TDF_LabelIntegerMap;
typedef NCollection_List<TDF_Label> TDF_LabelList;
typedef NCollection_Map<TDF_Label> TDF_LabelMap;
typedef TDF_LabelNode * TDF_LabelNodePtr;
typedef NCollection_Sequence<TDF_Label> TDF_LabelSequence;
typedef NCollection_List<opencascade::handle<TDF_AttributeDelta>>::Iterator TDF_ListIteratorOfAttributeDeltaList;
typedef NCollection_List<opencascade::handle<TDF_Attribute>>::Iterator TDF_ListIteratorOfAttributeList;
typedef NCollection_List<opencascade::handle<TDF_Delta>>::Iterator TDF_ListIteratorOfDeltaList;
typedef NCollection_List<Standard_GUID>::Iterator TDF_ListIteratorOfIDList;
typedef NCollection_List<TDF_Label>::Iterator TDF_ListIteratorOfLabelList;
typedef NCollection_Map<opencascade::handle<TDF_Attribute>>::Iterator TDF_MapIteratorOfAttributeMap;
typedef NCollection_Map<Standard_GUID>::Iterator TDF_MapIteratorOfIDMap;
typedef NCollection_Map<TDF_Label>::Iterator TDF_MapIteratorOfLabelMap;
/* end typedefs declaration */

/************
* class TDF *
************/
%rename(tdf) TDF;
class TDF {
	public:
		/****** TDF::AddLinkGUIDToProgID ******/
		/****** md5 signature: 0272b20d2cd451fe5526231462daa07c ******/
		%feature("compactdefaultargs") AddLinkGUIDToProgID;
		%feature("autodoc", "
Parameters
----------
ID: Standard_GUID
ProgID: str

Return
-------
None

Description
-----------
Sets link between GUID and ProgID in hidden DataMap.
") AddLinkGUIDToProgID;
		static void AddLinkGUIDToProgID(const Standard_GUID & ID, TCollection_ExtendedString ProgID);

		/****** TDF::GUIDFromProgID ******/
		/****** md5 signature: 1569c70b0eaddf0abaa25d243a344b0b ******/
		%feature("compactdefaultargs") GUIDFromProgID;
		%feature("autodoc", "
Parameters
----------
ProgID: str
ID: Standard_GUID

Return
-------
bool

Description
-----------
Returns True if there is GUID for given <ProgID> then GUID is returned in <ID>.
") GUIDFromProgID;
		static Standard_Boolean GUIDFromProgID(TCollection_ExtendedString ProgID, Standard_GUID & ID);

		/****** TDF::LowestID ******/
		/****** md5 signature: 5ffb42eb955c726f6468aa77a30aa62f ******/
		%feature("compactdefaultargs") LowestID;
		%feature("autodoc", "Return
-------
Standard_GUID

Description
-----------
Returns ID '00000000-0000-0000-0000-000000000000', sometimes used as null ID.
") LowestID;
		static const Standard_GUID & LowestID();

		/****** TDF::ProgIDFromGUID ******/
		/****** md5 signature: 7cbf0ed675ca10e717c4cdfc44e28f61 ******/
		%feature("compactdefaultargs") ProgIDFromGUID;
		%feature("autodoc", "
Parameters
----------
ID: Standard_GUID
ProgID: str

Return
-------
bool

Description
-----------
Returns True if there is ProgID for given <ID> then ProgID is returned in <ProgID>.
") ProgIDFromGUID;
		static Standard_Boolean ProgIDFromGUID(const Standard_GUID & ID, TCollection_ExtendedString & ProgID);

		/****** TDF::UppestID ******/
		/****** md5 signature: 04cc991fc12e7ed257b962b971383d4f ******/
		%feature("compactdefaultargs") UppestID;
		%feature("autodoc", "Return
-------
Standard_GUID

Description
-----------
Returns ID 'ffffffff-ffff-ffff-ffff-ffffffffffff'.
") UppestID;
		static const Standard_GUID & UppestID();

};


%extend TDF {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************
* class TDF_Attribute *
**********************/
%nodefaultctor TDF_Attribute;
class TDF_Attribute : public Standard_Transient {
	public:
		/****** TDF_Attribute::AddAttribute ******/
		/****** md5 signature: 1fdc6ab8a5101cf8823a8d9a5f4e7c5b ******/
		%feature("compactdefaultargs") AddAttribute;
		%feature("autodoc", "
Parameters
----------
other: TDF_Attribute

Return
-------
None

Description
-----------
Adds an Attribute <other> to the label of <self>.Raises if there is already one of the same GUID fhan <other>.
") AddAttribute;
		void AddAttribute(const opencascade::handle<TDF_Attribute> & other);

		/****** TDF_Attribute::AfterAddition ******/
		/****** md5 signature: 1645aac89ec94a8d059955cc4815f0f5 ******/
		%feature("compactdefaultargs") AfterAddition;
		%feature("autodoc", "Return
-------
None

Description
-----------
Something to do after adding an Attribute to a label.
") AfterAddition;
		virtual void AfterAddition();

		/****** TDF_Attribute::AfterResume ******/
		/****** md5 signature: f00ae5bce42a3fa5263b6007e46f5052 ******/
		%feature("compactdefaultargs") AfterResume;
		%feature("autodoc", "Return
-------
None

Description
-----------
Something to do after resuming an Attribute from a label.
") AfterResume;
		virtual void AfterResume();

		/****** TDF_Attribute::AfterRetrieval ******/
		/****** md5 signature: 4debcf9082f6b48fd06bcc4dab666f70 ******/
		%feature("compactdefaultargs") AfterRetrieval;
		%feature("autodoc", "
Parameters
----------
forceIt: bool (optional, default to Standard_False)

Return
-------
bool

Description
-----------
Something to do AFTER creation of an attribute by persistent-transient translation. The returned status says if AfterUndo has been performed (true) or if this callback must be called once again further (false). If <forceIt> is set to true, the method MUST perform and return true. Does nothing by default and returns true.
") AfterRetrieval;
		virtual Standard_Boolean AfterRetrieval(const Standard_Boolean forceIt = Standard_False);

		/****** TDF_Attribute::AfterUndo ******/
		/****** md5 signature: c8d35957430b5f1e2958a59b03021b1b ******/
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
Something to do after applying <anAttDelta>. The returned status says if AfterUndo has been performed (true) or if this callback must be called once again further (false). If <forceIt> is set to true, the method MUST perform and return true. Does nothing by default and returns true.
") AfterUndo;
		virtual Standard_Boolean AfterUndo(const opencascade::handle<TDF_AttributeDelta> & anAttDelta, const Standard_Boolean forceIt = Standard_False);

		/****** TDF_Attribute::Backup ******/
		/****** md5 signature: 736c62c33bb523385e9d1ec148b89b66 ******/
		%feature("compactdefaultargs") Backup;
		%feature("autodoc", "Return
-------
None

Description
-----------
Backups the attribute. The backuped attribute is flagged 'Backuped' and not 'Valid'. //! The method does nothing: //! 1) If the attribute transaction number is equal to the current transaction number (the attribute has already been backuped). //! 2) If the attribute is not attached to a label.
") Backup;
		void Backup();

		/****** TDF_Attribute::BackupCopy ******/
		/****** md5 signature: a825434844622adc42ebf4f3748fb2f9 ******/
		%feature("compactdefaultargs") BackupCopy;
		%feature("autodoc", "Return
-------
opencascade::handle<TDF_Attribute>

Description
-----------
Copies the attribute contents into a new other attribute. It is used by Backup().
") BackupCopy;
		virtual opencascade::handle<TDF_Attribute> BackupCopy();

		/****** TDF_Attribute::BeforeCommitTransaction ******/
		/****** md5 signature: 8c53cd571a56f101acdb4f2ca48dde3f ******/
		%feature("compactdefaultargs") BeforeCommitTransaction;
		%feature("autodoc", "Return
-------
None

Description
-----------
A callback. By default does nothing. It is called by TDF_Data::CommitTransaction() method.
") BeforeCommitTransaction;
		virtual void BeforeCommitTransaction();

		/****** TDF_Attribute::BeforeForget ******/
		/****** md5 signature: 5a56b9b29072adf41610c87453870f25 ******/
		%feature("compactdefaultargs") BeforeForget;
		%feature("autodoc", "Return
-------
None

Description
-----------
Something to do before forgetting an Attribute to a label.
") BeforeForget;
		virtual void BeforeForget();

		/****** TDF_Attribute::BeforeRemoval ******/
		/****** md5 signature: de0b344315ad5f67d73191a6700380a8 ******/
		%feature("compactdefaultargs") BeforeRemoval;
		%feature("autodoc", "Return
-------
None

Description
-----------
Something to do before removing an Attribute from a label.
") BeforeRemoval;
		virtual void BeforeRemoval();

		/****** TDF_Attribute::BeforeUndo ******/
		/****** md5 signature: df655d5e3c897f61d7e3b6efa962017f ******/
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
Something to do before applying <anAttDelta>. The returned status says if AfterUndo has been performed (true) or if this callback must be called once again further (false). If <forceIt> is set to true, the method MUST perform and return true. Does nothing by default and returns true.
") BeforeUndo;
		virtual Standard_Boolean BeforeUndo(const opencascade::handle<TDF_AttributeDelta> & anAttDelta, const Standard_Boolean forceIt = Standard_False);

		/****** TDF_Attribute::DeltaOnAddition ******/
		/****** md5 signature: 8c975b212ebc48f37a9efe28370bd0fb ******/
		%feature("compactdefaultargs") DeltaOnAddition;
		%feature("autodoc", "Return
-------
opencascade::handle<TDF_DeltaOnAddition>

Description
-----------
Makes an AttributeDelta because <self> appeared. The only known use of a redefinition of this method is to return a null handle (no delta).
") DeltaOnAddition;
		virtual opencascade::handle<TDF_DeltaOnAddition> DeltaOnAddition();

		/****** TDF_Attribute::DeltaOnForget ******/
		/****** md5 signature: d96dd3ee6835e5170c35c537480a2be3 ******/
		%feature("compactdefaultargs") DeltaOnForget;
		%feature("autodoc", "Return
-------
opencascade::handle<TDF_DeltaOnForget>

Description
-----------
Makes an AttributeDelta because <self> has been forgotten.
") DeltaOnForget;
		virtual opencascade::handle<TDF_DeltaOnForget> DeltaOnForget();

		/****** TDF_Attribute::DeltaOnModification ******/
		/****** md5 signature: 905cd7ad9413bd95c77621bc5fede4a5 ******/
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
Makes a DeltaOnModification between <self> and <anOldAttribute.
") DeltaOnModification;
		virtual opencascade::handle<TDF_DeltaOnModification> DeltaOnModification(const opencascade::handle<TDF_Attribute> & anOldAttribute);

		/****** TDF_Attribute::DeltaOnModification ******/
		/****** md5 signature: f83d91fb563526db971678d8ae190037 ******/
		%feature("compactdefaultargs") DeltaOnModification;
		%feature("autodoc", "
Parameters
----------
aDelta: TDF_DeltaOnModification

Return
-------
None

Description
-----------
Applies a DeltaOnModification to <self>.
") DeltaOnModification;
		virtual void DeltaOnModification(const opencascade::handle<TDF_DeltaOnModification> & aDelta);

		/****** TDF_Attribute::DeltaOnRemoval ******/
		/****** md5 signature: 4ae44c5d4a825e10d125eb7f75a9bb28 ******/
		%feature("compactdefaultargs") DeltaOnRemoval;
		%feature("autodoc", "Return
-------
opencascade::handle<TDF_DeltaOnRemoval>

Description
-----------
Makes a DeltaOnRemoval on <self> because <self> has disappeared from the DS.
") DeltaOnRemoval;
		virtual opencascade::handle<TDF_DeltaOnRemoval> DeltaOnRemoval();

		/****** TDF_Attribute::DeltaOnResume ******/
		/****** md5 signature: bc74ada443cb09bb7350a3e27b5cd98b ******/
		%feature("compactdefaultargs") DeltaOnResume;
		%feature("autodoc", "Return
-------
opencascade::handle<TDF_DeltaOnResume>

Description
-----------
Makes an AttributeDelta because <self> has been resumed.
") DeltaOnResume;
		virtual opencascade::handle<TDF_DeltaOnResume> DeltaOnResume();

		/****** TDF_Attribute::Dump ******/
		/****** md5 signature: 87047991ca121f6cb65c2957eca41f1b ******/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "
Parameters
----------

Return
-------
anOS: Standard_OStream

Description
-----------
Dumps the minimum information about <self> on <aStream>.
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
		/****** TDF_Attribute::ExtendedDump ******/
		/****** md5 signature: 2d076f5290434752ed1effb636fb5839 ******/
		%feature("compactdefaultargs") ExtendedDump;
		%feature("autodoc", "
Parameters
----------
aFilter: TDF_IDFilter
aMap: TDF_AttributeIndexedMap

Return
-------
anOS: Standard_OStream

Description
-----------
Dumps the attribute content on <aStream>, using <aMap> like this: if an attribute is not in the map, first put add it to the map and then dump it. Use the map rank instead of dumping each attribute field.
") ExtendedDump;
		virtual void ExtendedDump(std::ostream &OutValue, const TDF_IDFilter & aFilter, TDF_AttributeIndexedMap & aMap);

		/****** TDF_Attribute::FindAttribute ******/
		/****** md5 signature: 5f4fd12b74a27c4216127d1ce8d3b78a ******/
		%feature("compactdefaultargs") FindAttribute;
		%feature("autodoc", "
Parameters
----------
anID: Standard_GUID
anAttribute: TDF_Attribute

Return
-------
bool

Description
-----------
Finds an associated attribute of <self>, according to <anID>. the returned <anAttribute> is a valid one. The method returns True if found, False otherwise. A removed attribute cannot be found using this method.
") FindAttribute;
		Standard_Boolean FindAttribute(const Standard_GUID & anID, opencascade::handle<TDF_Attribute> & anAttribute);

		/****** TDF_Attribute::Forget ******/
		/****** md5 signature: 4cd1ae10a7466d24f596008f797ce204 ******/
		%feature("compactdefaultargs") Forget;
		%feature("autodoc", "
Parameters
----------
aTransaction: int

Return
-------
None

Description
-----------
Forgets the attribute. <aTransaction> is the current transaction in which the forget is done. A forgotten attribute is also flagged not 'Valid'. //! A forgotten attribute is invisible. Set also the 'Valid' status to False. Obviously, DF cannot empty an attribute (this has a semantic signification), but can remove it from the structure. So, a forgotten attribute is NOT an empty one, but a soon DEAD one. //! Should be private.
") Forget;
		void Forget(const Standard_Integer aTransaction);

		/****** TDF_Attribute::ForgetAllAttributes ******/
		/****** md5 signature: f0492f70679f693e73f3cd351b602cd9 ******/
		%feature("compactdefaultargs") ForgetAllAttributes;
		%feature("autodoc", "
Parameters
----------
clearChildren: bool (optional, default to Standard_True)

Return
-------
None

Description
-----------
Forgets all the attributes attached to the label of <self>. Does it on the sub-labels if <clearChildren> is set to true. Of course, this method is compatible with Transaction & Delta mechanisms. Be careful that if <self> will have a null label after this call.
") ForgetAllAttributes;
		void ForgetAllAttributes(const Standard_Boolean clearChildren = Standard_True);

		/****** TDF_Attribute::ForgetAttribute ******/
		/****** md5 signature: 52de4f1eac4c1d719dc2240e16600cdd ******/
		%feature("compactdefaultargs") ForgetAttribute;
		%feature("autodoc", "
Parameters
----------
aguid: Standard_GUID

Return
-------
bool

Description
-----------
Forgets the Attribute of GUID <aguid> associated to the label of <self>. Be careful that if <self> is the attribute of <guid>, <self> will have a null label after this call. If the attribute doesn't exist returns False. Otherwise returns True.
") ForgetAttribute;
		Standard_Boolean ForgetAttribute(const Standard_GUID & aguid);

		/****** TDF_Attribute::ID ******/
		/****** md5 signature: e94b659c9e9f7b7f43797fc28e2b97f9 ******/
		%feature("compactdefaultargs") ID;
		%feature("autodoc", "Return
-------
Standard_GUID

Description
-----------
Returns the ID of the attribute.
") ID;
		virtual const Standard_GUID & ID();

		/****** TDF_Attribute::IsAttribute ******/
		/****** md5 signature: d4c3cd3354e07d22381503542a5e16aa ******/
		%feature("compactdefaultargs") IsAttribute;
		%feature("autodoc", "
Parameters
----------
anID: Standard_GUID

Return
-------
bool

Description
-----------
Returns true if it exists an associated attribute of <self> with <anID> as ID.
") IsAttribute;
		Standard_Boolean IsAttribute(const Standard_GUID & anID);

		/****** TDF_Attribute::IsBackuped ******/
		/****** md5 signature: 6520047807c75e85fd4e66863b743e07 ******/
		%feature("compactdefaultargs") IsBackuped;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if the attribute backup status is set. This status is set/unset by the Backup() method.
") IsBackuped;
		Standard_Boolean IsBackuped();

		/****** TDF_Attribute::IsForgotten ******/
		/****** md5 signature: a5b3d005a1cc88a7413291be6b3657cc ******/
		%feature("compactdefaultargs") IsForgotten;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if the attribute forgotten status is set. //! ShortCut Methods concerning associated attributes =================================================.
") IsForgotten;
		Standard_Boolean IsForgotten();

		/****** TDF_Attribute::IsNew ******/
		/****** md5 signature: 3a3a8bc6ebd2fc2c25f224ff9e99af70 ******/
		%feature("compactdefaultargs") IsNew;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if the attribute has no backup.
") IsNew;
		Standard_Boolean IsNew();

		/****** TDF_Attribute::IsValid ******/
		/****** md5 signature: 2809e700423e4fe6ecd395953f3a2406 ******/
		%feature("compactdefaultargs") IsValid;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if the attribute is valid; i.e. not a backuped or removed one.
") IsValid;
		Standard_Boolean IsValid();

		/****** TDF_Attribute::Label ******/
		/****** md5 signature: 9d94a52a35e852ea5e053d340a2888ee ******/
		%feature("compactdefaultargs") Label;
		%feature("autodoc", "Return
-------
TDF_Label

Description
-----------
Returns the label to which the attribute is attached. If the label is not included in a DF, the label is null. See Label. Warning If the label is not included in a data framework, it is null. This function should not be redefined inline.
") Label;
		const TDF_Label Label();

		/****** TDF_Attribute::NewEmpty ******/
		/****** md5 signature: 537251aec6cd2736ac1f1abe6868dc70 ******/
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "Return
-------
opencascade::handle<TDF_Attribute>

Description
-----------
Returns an new empty attribute from the good end type. It is used by the copy algorithm.
") NewEmpty;
		virtual opencascade::handle<TDF_Attribute> NewEmpty();

		/****** TDF_Attribute::Paste ******/
		/****** md5 signature: 45ecccc1eb738661a41ddb54d6956178 ******/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "
Parameters
----------
intoAttribute: TDF_Attribute
aRelocationTable: TDF_RelocationTable

Return
-------
None

Description
-----------
This method is different from the 'Copy' one, because it is used when copying an attribute from a source structure into a target structure. This method may paste the contents of <self> into <intoAttribute>. //! The given pasted attribute can be full or empty of its contents. But don't make a NEW! Just set the contents! //! It is possible to use <aRelocationTable> to get/set the relocation value of a source attribute.
") Paste;
		virtual void Paste(const opencascade::handle<TDF_Attribute> & intoAttribute, const opencascade::handle<TDF_RelocationTable> & aRelocationTable);

		/****** TDF_Attribute::References ******/
		/****** md5 signature: 386560cda18cda911ef8050b14958516 ******/
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
Adds the first level referenced attributes and labels to <aDataSet>. //! For this, use the AddLabel or AddAttribute of DataSet. //! If there is none, do not implement the method.
") References;
		virtual void References(const opencascade::handle<TDF_DataSet> & aDataSet);

		/****** TDF_Attribute::Restore ******/
		/****** md5 signature: 58d5068efa194f15ff1b2e100f124c41 ******/
		%feature("compactdefaultargs") Restore;
		%feature("autodoc", "
Parameters
----------
anAttribute: TDF_Attribute

Return
-------
None

Description
-----------
Restores the backuped contents from <anAttribute> into this one. It is used when aborting a transaction.
") Restore;
		virtual void Restore(const opencascade::handle<TDF_Attribute> & anAttribute);

		/****** TDF_Attribute::SetID ******/
		/****** md5 signature: 594a60d8e3b42dea05c147562d345bea ******/
		%feature("compactdefaultargs") SetID;
		%feature("autodoc", "
Parameters
----------
&: Standard_GUID

Return
-------
None

Description
-----------
Sets specific ID of the attribute (supports several attributes of one type at the same label feature).
") SetID;
		virtual void SetID(const Standard_GUID &);

		/****** TDF_Attribute::SetID ******/
		/****** md5 signature: 224ff062320948dfb4cd5bb6dbf4293d ******/
		%feature("compactdefaultargs") SetID;
		%feature("autodoc", "Return
-------
None

Description
-----------
Sets default ID defined in nested class (to be used for attributes having User ID feature).
") SetID;
		virtual void SetID();

		/****** TDF_Attribute::Transaction ******/
		/****** md5 signature: 00c48137a99575bfa5cfadde8fb37954 ******/
		%feature("compactdefaultargs") Transaction;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the transaction index in which the attribute has been created or modified.
") Transaction;
		Standard_Integer Transaction();

		/****** TDF_Attribute::UntilTransaction ******/
		/****** md5 signature: becf1aef4465f8bbf7873246c2baea63 ******/
		%feature("compactdefaultargs") UntilTransaction;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the upper transaction index until which the attribute is/was valid. This number may vary. A removed attribute validity range is reduced to its transaction index.
") UntilTransaction;
		Standard_Integer UntilTransaction();

};


%make_alias(TDF_Attribute)

%extend TDF_Attribute {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************
* class TDF_AttributeDelta *
***************************/
%nodefaultctor TDF_AttributeDelta;
class TDF_AttributeDelta : public Standard_Transient {
	public:
		/****** TDF_AttributeDelta::Apply ******/
		/****** md5 signature: d55ef3070f583d4342be2dd36c78d554 ******/
		%feature("compactdefaultargs") Apply;
		%feature("autodoc", "Return
-------
None

Description
-----------
Applies the delta to the attribute.
") Apply;
		virtual void Apply();

		/****** TDF_AttributeDelta::Attribute ******/
		/****** md5 signature: 64fbf96fd4c12b41da848f349815872c ******/
		%feature("compactdefaultargs") Attribute;
		%feature("autodoc", "Return
-------
opencascade::handle<TDF_Attribute>

Description
-----------
Returns the reference attribute.
") Attribute;
		opencascade::handle<TDF_Attribute> Attribute();

		/****** TDF_AttributeDelta::Dump ******/
		/****** md5 signature: 99b366a47dee674026948ac42a91f968 ******/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "
Parameters
----------

Return
-------
OS: Standard_OStream

Description
-----------
Dumps the contents.
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
		/****** TDF_AttributeDelta::ID ******/
		/****** md5 signature: 7f73a4e9cd65afc41a55b9f071f2e10d ******/
		%feature("compactdefaultargs") ID;
		%feature("autodoc", "Return
-------
Standard_GUID

Description
-----------
Returns the ID of the attribute concerned by <self>.
") ID;
		Standard_GUID ID();

		/****** TDF_AttributeDelta::Label ******/
		/****** md5 signature: 45446fb6d4e5a656e74b10a5eb4cd845 ******/
		%feature("compactdefaultargs") Label;
		%feature("autodoc", "Return
-------
TDF_Label

Description
-----------
Returns the label concerned by <self>.
") Label;
		TDF_Label Label();

};


%make_alias(TDF_AttributeDelta)

%extend TDF_AttributeDelta {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************
* class TDF_AttributeIterator *
******************************/
class TDF_AttributeIterator {
	public:
		/****** TDF_AttributeIterator::TDF_AttributeIterator ******/
		/****** md5 signature: 585ceece4705e74816ff37825854b411 ******/
		%feature("compactdefaultargs") TDF_AttributeIterator;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") TDF_AttributeIterator;
		 TDF_AttributeIterator();

		/****** TDF_AttributeIterator::TDF_AttributeIterator ******/
		/****** md5 signature: d710a54c90205cb251ebe8593dd87141 ******/
		%feature("compactdefaultargs") TDF_AttributeIterator;
		%feature("autodoc", "
Parameters
----------
aLabel: TDF_Label
withoutForgotten: bool (optional, default to Standard_True)

Return
-------
None

Description
-----------
No available documentation.
") TDF_AttributeIterator;
		 TDF_AttributeIterator(const TDF_Label & aLabel, const Standard_Boolean withoutForgotten = Standard_True);

		/****** TDF_AttributeIterator::TDF_AttributeIterator ******/
		/****** md5 signature: fd9aa70338e8d898944e21e5794c6ac5 ******/
		%feature("compactdefaultargs") TDF_AttributeIterator;
		%feature("autodoc", "
Parameters
----------
aLabelNode: TDF_LabelNodePtr
withoutForgotten: bool (optional, default to Standard_True)

Return
-------
None

Description
-----------
No available documentation.
") TDF_AttributeIterator;
		 TDF_AttributeIterator(const TDF_LabelNodePtr aLabelNode, const Standard_Boolean withoutForgotten = Standard_True);

		/****** TDF_AttributeIterator::Initialize ******/
		/****** md5 signature: 572738611648339acbf475d0a9583c46 ******/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "
Parameters
----------
aLabel: TDF_Label
withoutForgotten: bool (optional, default to Standard_True)

Return
-------
None

Description
-----------
No available documentation.
") Initialize;
		void Initialize(const TDF_Label & aLabel, const Standard_Boolean withoutForgotten = Standard_True);

		/****** TDF_AttributeIterator::More ******/
		/****** md5 signature: d71d36638272620679aae1f635153dca ******/
		%feature("compactdefaultargs") More;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") More;
		Standard_Boolean More();

		/****** TDF_AttributeIterator::Next ******/
		/****** md5 signature: f35c0df5f1d7c877986db18081404532 ******/
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Next;
		void Next();

		/****** TDF_AttributeIterator::PtrValue ******/
		/****** md5 signature: 58a90bcec8f9fb96b5106cadf930b4d8 ******/
		%feature("compactdefaultargs") PtrValue;
		%feature("autodoc", "Return
-------
TDF_Attribute *

Description
-----------
Provides an access to the internal pointer of the current attribute. The method has better performance as not-creating handle.
") PtrValue;
		const TDF_Attribute * PtrValue();

		/****** TDF_AttributeIterator::Value ******/
		/****** md5 signature: 84b1efb55f8dba80e554db1af53924bf ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Return
-------
opencascade::handle<TDF_Attribute>

Description
-----------
No available documentation.
") Value;
		opencascade::handle<TDF_Attribute> Value();

};


%extend TDF_AttributeIterator {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************
* class TDF_ChildIDIterator *
****************************/
class TDF_ChildIDIterator {
	public:
		/****** TDF_ChildIDIterator::TDF_ChildIDIterator ******/
		/****** md5 signature: e42756213d8fd1136d55c3a43d8c9c21 ******/
		%feature("compactdefaultargs") TDF_ChildIDIterator;
		%feature("autodoc", "Return
-------
None

Description
-----------
Creates an empty iterator.
") TDF_ChildIDIterator;
		 TDF_ChildIDIterator();

		/****** TDF_ChildIDIterator::TDF_ChildIDIterator ******/
		/****** md5 signature: f07ccda3088ed57f2cbde947bb2212ea ******/
		%feature("compactdefaultargs") TDF_ChildIDIterator;
		%feature("autodoc", "
Parameters
----------
aLabel: TDF_Label
anID: Standard_GUID
allLevels: bool (optional, default to Standard_False)

Return
-------
None

Description
-----------
Iterates on the children of the given label. If <allLevels> option is set to true, it explores not only the first, but all the sub label levels.
") TDF_ChildIDIterator;
		 TDF_ChildIDIterator(const TDF_Label & aLabel, const Standard_GUID & anID, const Standard_Boolean allLevels = Standard_False);

		/****** TDF_ChildIDIterator::Initialize ******/
		/****** md5 signature: d06665652717063a271e60c94853d055 ******/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "
Parameters
----------
aLabel: TDF_Label
anID: Standard_GUID
allLevels: bool (optional, default to Standard_False)

Return
-------
None

Description
-----------
Initializes the iteration on the children of the given label. If <allLevels> option is set to true, it explores not only the first, but all the sub label levels.
") Initialize;
		void Initialize(const TDF_Label & aLabel, const Standard_GUID & anID, const Standard_Boolean allLevels = Standard_False);

		/****** TDF_ChildIDIterator::More ******/
		/****** md5 signature: 6f6e915c9a3dca758c059d9e8af02dff ******/
		%feature("compactdefaultargs") More;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if there is a current Item in the iteration.
") More;
		Standard_Boolean More();

		/****** TDF_ChildIDIterator::Next ******/
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

		/****** TDF_ChildIDIterator::NextBrother ******/
		/****** md5 signature: 5986fa6a611b7b5fcfac587700960b73 ******/
		%feature("compactdefaultargs") NextBrother;
		%feature("autodoc", "Return
-------
None

Description
-----------
Move to the next Brother. If there is none, go up etc. This method is interesting only with 'allLevels' behavior, because it avoids to explore the current label children.
") NextBrother;
		void NextBrother();

		/****** TDF_ChildIDIterator::Value ******/
		/****** md5 signature: 9ad8943098bbee0d3aa073bd1d7d6d92 ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Return
-------
opencascade::handle<TDF_Attribute>

Description
-----------
Returns the current item; a null handle if there is none.
") Value;
		opencascade::handle<TDF_Attribute> Value();

};


%extend TDF_ChildIDIterator {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************
* class TDF_ChildIterator *
**************************/
class TDF_ChildIterator {
	public:
		/****** TDF_ChildIterator::TDF_ChildIterator ******/
		/****** md5 signature: 94cafe961c6a9e194e20e43bbdc18d2d ******/
		%feature("compactdefaultargs") TDF_ChildIterator;
		%feature("autodoc", "Return
-------
None

Description
-----------
Creates an empty iterator object to explore the children of a label.
") TDF_ChildIterator;
		 TDF_ChildIterator();

		/****** TDF_ChildIterator::TDF_ChildIterator ******/
		/****** md5 signature: acb79b424ebe77264841b3feb5423e51 ******/
		%feature("compactdefaultargs") TDF_ChildIterator;
		%feature("autodoc", "
Parameters
----------
aLabel: TDF_Label
allLevels: bool (optional, default to Standard_False)

Return
-------
None

Description
-----------
Constructs the iterator object defined by the label aLabel. Iterates on the children of the given label. If <allLevels> option is set to true, it explores not only the first, but all the sub label levels.
") TDF_ChildIterator;
		 TDF_ChildIterator(const TDF_Label & aLabel, const Standard_Boolean allLevels = Standard_False);

		/****** TDF_ChildIterator::Initialize ******/
		/****** md5 signature: b3942e3ee5d048a2a0d607e21cbecc7a ******/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "
Parameters
----------
aLabel: TDF_Label
allLevels: bool (optional, default to Standard_False)

Return
-------
None

Description
-----------
Initializes the iteration on the children of the given label. If <allLevels> option is set to true, it explores not only the first, but all the sub label levels. If allLevels is false, only the first level of child labels is explored. In the example below, the label is iterated using Initialize, More and Next and its child labels dumped using TDF_Tool::Entry. Example void DumpChildren(const TDF_Label& aLabel) { TDF_ChildIterator it; TCollection_AsciiString es; for (it.Initialize(aLabel,Standard_True); it.More(); it.Next()){ TDF_Tool::Entry(it.Value(),es); std::cout << as.ToCString() << std::endl; } }.
") Initialize;
		void Initialize(const TDF_Label & aLabel, const Standard_Boolean allLevels = Standard_False);

		/****** TDF_ChildIterator::More ******/
		/****** md5 signature: 6f6e915c9a3dca758c059d9e8af02dff ******/
		%feature("compactdefaultargs") More;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if a current label is found in the iteration process.
") More;
		Standard_Boolean More();

		/****** TDF_ChildIterator::Next ******/
		/****** md5 signature: f35c0df5f1d7c877986db18081404532 ******/
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "Return
-------
None

Description
-----------
Move the current iteration to the next Item.
") Next;
		void Next();

		/****** TDF_ChildIterator::NextBrother ******/
		/****** md5 signature: 5986fa6a611b7b5fcfac587700960b73 ******/
		%feature("compactdefaultargs") NextBrother;
		%feature("autodoc", "Return
-------
None

Description
-----------
Moves this iteration to the next brother label. A brother label is one with the same father as an initial label. Use this function when the non-empty constructor or Initialize has allLevels set to true. The result is that the iteration does not explore the children of the current label. This method is interesting only with 'allLevels' behavior, because it avoids to explore the current label children.
") NextBrother;
		void NextBrother();

		/****** TDF_ChildIterator::Value ******/
		/****** md5 signature: 06b32d6a07bbf18ac1eb5a51d95d98cd ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Return
-------
TDF_Label

Description
-----------
Returns the current label; or, if there is none, a null label.
") Value;
		const TDF_Label Value();

};


%extend TDF_ChildIterator {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************
* class TDF_ClosureMode *
************************/
class TDF_ClosureMode {
	public:
		/****** TDF_ClosureMode::TDF_ClosureMode ******/
		/****** md5 signature: d0067cf39e729d207d68714afd10e10e ******/
		%feature("compactdefaultargs") TDF_ClosureMode;
		%feature("autodoc", "
Parameters
----------
aMode: bool (optional, default to Standard_True)

Return
-------
None

Description
-----------
Creates an object with all modes set to <aMode>.
") TDF_ClosureMode;
		 TDF_ClosureMode(const Standard_Boolean aMode = Standard_True);

		/****** TDF_ClosureMode::Descendants ******/
		/****** md5 signature: a2e2f79553e77366fa7544bdfc242a1e ******/
		%feature("compactdefaultargs") Descendants;
		%feature("autodoc", "
Parameters
----------
aStatus: bool

Return
-------
None

Description
-----------
Sets the mode 'Descendants' to <aStatus>. //! 'Descendants' mode means we add to the data set the children labels of each USER GIVEN label. We do not do that with the labels found applying UpToFirstLevel option.
") Descendants;
		void Descendants(const Standard_Boolean aStatus);

		/****** TDF_ClosureMode::Descendants ******/
		/****** md5 signature: 826bd7150e755194db5d40e39b74c7ff ******/
		%feature("compactdefaultargs") Descendants;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if the mode 'Descendants' is set.
") Descendants;
		Standard_Boolean Descendants();

		/****** TDF_ClosureMode::References ******/
		/****** md5 signature: 04dadbf275888077d87d5f847d1316f6 ******/
		%feature("compactdefaultargs") References;
		%feature("autodoc", "
Parameters
----------
aStatus: bool

Return
-------
None

Description
-----------
Sets the mode 'References' to <aStatus>. //! 'References' mode means we add to the data set the descendants of an attribute, by calling the attribute method Descendants().
") References;
		void References(const Standard_Boolean aStatus);

		/****** TDF_ClosureMode::References ******/
		/****** md5 signature: e3acfac1a95f17388b349c8df0832ef9 ******/
		%feature("compactdefaultargs") References;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if the mode 'References' is set.
") References;
		Standard_Boolean References();

};


%extend TDF_ClosureMode {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************
* class TDF_ClosureTool *
************************/
class TDF_ClosureTool {
	public:
		/****** TDF_ClosureTool::Closure ******/
		/****** md5 signature: 137ba63aeb67f91b2a78d852939e2cb5 ******/
		%feature("compactdefaultargs") Closure;
		%feature("autodoc", "
Parameters
----------
aDataSet: TDF_DataSet

Return
-------
None

Description
-----------
Builds the transitive closure of label and attribute sets into <aDataSet>.
") Closure;
		static void Closure(const opencascade::handle<TDF_DataSet> & aDataSet);

		/****** TDF_ClosureTool::Closure ******/
		/****** md5 signature: d28d9168a2c73ddb283363e4b4426183 ******/
		%feature("compactdefaultargs") Closure;
		%feature("autodoc", "
Parameters
----------
aDataSet: TDF_DataSet
aFilter: TDF_IDFilter
aMode: TDF_ClosureMode

Return
-------
None

Description
-----------
Builds the transitive closure of label and attribute sets into <aDataSet>. Uses <aFilter> to determine if an attribute has to be taken in account or not. Uses <aMode> for various way of closing.
") Closure;
		static void Closure(const opencascade::handle<TDF_DataSet> & aDataSet, const TDF_IDFilter & aFilter, const TDF_ClosureMode & aMode);

		/****** TDF_ClosureTool::Closure ******/
		/****** md5 signature: 70e894c4a44be9fe1e618e830285afd3 ******/
		%feature("compactdefaultargs") Closure;
		%feature("autodoc", "
Parameters
----------
aLabel: TDF_Label
aLabMap: TDF_LabelMap
anAttMap: TDF_AttributeMap
aFilter: TDF_IDFilter
aMode: TDF_ClosureMode

Return
-------
None

Description
-----------
Builds the transitive closure of <aLabel>.
") Closure;
		static void Closure(const TDF_Label & aLabel, TDF_LabelMap & aLabMap, TDF_AttributeMap & anAttMap, const TDF_IDFilter & aFilter, const TDF_ClosureMode & aMode);

};


%extend TDF_ClosureTool {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************
* class TDF_ComparisonTool *
***************************/
class TDF_ComparisonTool {
	public:
		/****** TDF_ComparisonTool::Compare ******/
		/****** md5 signature: fa2e0f4c630692eb4f8c4562c3aa0b06 ******/
		%feature("compactdefaultargs") Compare;
		%feature("autodoc", "
Parameters
----------
aSourceDataSet: TDF_DataSet
aTargetDataSet: TDF_DataSet
aFilter: TDF_IDFilter
aRelocationTable: TDF_RelocationTable

Return
-------
None

Description
-----------
Compares <aSourceDataSet> with <aTargetDataSet>, updating <aRelocationTable> with labels and attributes found in both sets.
") Compare;
		static void Compare(const opencascade::handle<TDF_DataSet> & aSourceDataSet, const opencascade::handle<TDF_DataSet> & aTargetDataSet, const TDF_IDFilter & aFilter, const opencascade::handle<TDF_RelocationTable> & aRelocationTable);

		/****** TDF_ComparisonTool::Cut ******/
		/****** md5 signature: eafbfe914d8ffda969355273a231f112 ******/
		%feature("compactdefaultargs") Cut;
		%feature("autodoc", "
Parameters
----------
aDataSet: TDF_DataSet

Return
-------
None

Description
-----------
Removes attributes from <aDataSet>.
") Cut;
		static void Cut(const opencascade::handle<TDF_DataSet> & aDataSet);

		/****** TDF_ComparisonTool::IsSelfContained ******/
		/****** md5 signature: f1f3a19ce83f1d52e1c34ef553b4aabd ******/
		%feature("compactdefaultargs") IsSelfContained;
		%feature("autodoc", "
Parameters
----------
aLabel: TDF_Label
aDataSet: TDF_DataSet

Return
-------
bool

Description
-----------
Returns true if all the labels of <aDataSet> are descendant of <aLabel>.
") IsSelfContained;
		static Standard_Boolean IsSelfContained(const TDF_Label & aLabel, const opencascade::handle<TDF_DataSet> & aDataSet);

		/****** TDF_ComparisonTool::SourceUnbound ******/
		/****** md5 signature: d519b241fc1f0ed64c04ba6192ba3b70 ******/
		%feature("compactdefaultargs") SourceUnbound;
		%feature("autodoc", "
Parameters
----------
aRefDataSet: TDF_DataSet
aRelocationTable: TDF_RelocationTable
aFilter: TDF_IDFilter
aDiffDataSet: TDF_DataSet
anOption: int (optional, default to 2)

Return
-------
bool

Description
-----------
Finds from <aRefDataSet> all the keys not bound into <aRelocationTable> and put them into <aDiffDataSet>. Returns True if the difference contains at least one key. (A key is a source object). //! <anOption> may take the following values: 1: labels treatment only; 2: attributes treatment only (default value); 3: both labels & attributes treatment.
") SourceUnbound;
		static Standard_Boolean SourceUnbound(const opencascade::handle<TDF_DataSet> & aRefDataSet, const opencascade::handle<TDF_RelocationTable> & aRelocationTable, const TDF_IDFilter & aFilter, const opencascade::handle<TDF_DataSet> & aDiffDataSet, const Standard_Integer anOption = 2);

		/****** TDF_ComparisonTool::TargetUnbound ******/
		/****** md5 signature: f1bef1c25fe7f83a1cd97a71260b7087 ******/
		%feature("compactdefaultargs") TargetUnbound;
		%feature("autodoc", "
Parameters
----------
aRefDataSet: TDF_DataSet
aRelocationTable: TDF_RelocationTable
aFilter: TDF_IDFilter
aDiffDataSet: TDF_DataSet
anOption: int (optional, default to 2)

Return
-------
bool

Description
-----------
Subtracts from <aRefDataSet> all the items bound into <aRelocationTable>. The result is put into <aDiffDataSet>. Returns True if the difference contains at least one item. (An item is a target object). //! <anOption> may take the following values: 1: labels treatment only; 2: attributes treatment only(default value); 3: both labels & attributes treatment.
") TargetUnbound;
		static Standard_Boolean TargetUnbound(const opencascade::handle<TDF_DataSet> & aRefDataSet, const opencascade::handle<TDF_RelocationTable> & aRelocationTable, const TDF_IDFilter & aFilter, const opencascade::handle<TDF_DataSet> & aDiffDataSet, const Standard_Integer anOption = 2);

};


%extend TDF_ComparisonTool {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************
* class TDF_CopyLabel *
**********************/
class TDF_CopyLabel {
	public:
		/****** TDF_CopyLabel::TDF_CopyLabel ******/
		/****** md5 signature: 45df1a3aa5e656373d0435e2f931a89e ******/
		%feature("compactdefaultargs") TDF_CopyLabel;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") TDF_CopyLabel;
		 TDF_CopyLabel();

		/****** TDF_CopyLabel::TDF_CopyLabel ******/
		/****** md5 signature: 25c850253cbcae0cd5d2932242809c66 ******/
		%feature("compactdefaultargs") TDF_CopyLabel;
		%feature("autodoc", "
Parameters
----------
aSource: TDF_Label
aTarget: TDF_Label

Return
-------
None

Description
-----------
CopyTool.
") TDF_CopyLabel;
		 TDF_CopyLabel(const TDF_Label & aSource, const TDF_Label & aTarget);

		/****** TDF_CopyLabel::ExternalReferences ******/
		/****** md5 signature: 43d7cd21830d7d64f4aeff0c25fe8ac3 ******/
		%feature("compactdefaultargs") ExternalReferences;
		%feature("autodoc", "
Parameters
----------
Lab: TDF_Label
aExternals: TDF_AttributeMap
aFilter: TDF_IDFilter

Return
-------
bool

Description
-----------
Check external references and if exist fills the aExternals Map.
") ExternalReferences;
		static Standard_Boolean ExternalReferences(const TDF_Label & Lab, TDF_AttributeMap & aExternals, const TDF_IDFilter & aFilter);

		/****** TDF_CopyLabel::ExternalReferences ******/
		/****** md5 signature: 3856812b6615819534ef22781ae0f96c ******/
		%feature("compactdefaultargs") ExternalReferences;
		%feature("autodoc", "
Parameters
----------
aRefLab: TDF_Label
Lab: TDF_Label
aExternals: TDF_AttributeMap
aFilter: TDF_IDFilter
aDataSet: TDF_DataSet

Return
-------
None

Description
-----------
Check external references and if exist fills the aExternals Map.
") ExternalReferences;
		static void ExternalReferences(const TDF_Label & aRefLab, const TDF_Label & Lab, TDF_AttributeMap & aExternals, const TDF_IDFilter & aFilter, opencascade::handle<TDF_DataSet> & aDataSet);

		/****** TDF_CopyLabel::IsDone ******/
		/****** md5 signature: ec0624071ec7da54b3d9dacc7bcb05f9 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsDone;
		Standard_Boolean IsDone();

		/****** TDF_CopyLabel::Load ******/
		/****** md5 signature: ed6ed42a43a283fb587c69e5a20c2bc8 ******/
		%feature("compactdefaultargs") Load;
		%feature("autodoc", "
Parameters
----------
aSource: TDF_Label
aTarget: TDF_Label

Return
-------
None

Description
-----------
Loads src and tgt labels.
") Load;
		void Load(const TDF_Label & aSource, const TDF_Label & aTarget);

		/****** TDF_CopyLabel::Perform ******/
		/****** md5 signature: c04b01412cba7220c024b5eb4532697f ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Return
-------
None

Description
-----------
performs algorithm of selfcontained copy.
") Perform;
		void Perform();

		/****** TDF_CopyLabel::RelocationTable ******/
		/****** md5 signature: 8ae337ea16a575c9cbe8babfdef86d2a ******/
		%feature("compactdefaultargs") RelocationTable;
		%feature("autodoc", "Return
-------
opencascade::handle<TDF_RelocationTable>

Description
-----------
returns relocation table.
") RelocationTable;
		const opencascade::handle<TDF_RelocationTable> & RelocationTable();

		/****** TDF_CopyLabel::UseFilter ******/
		/****** md5 signature: 81ab0a7df550941c4582f6b215663e0a ******/
		%feature("compactdefaultargs") UseFilter;
		%feature("autodoc", "
Parameters
----------
aFilter: TDF_IDFilter

Return
-------
None

Description
-----------
Sets filter.
") UseFilter;
		void UseFilter(const TDF_IDFilter & aFilter);

};


%extend TDF_CopyLabel {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************
* class TDF_CopyTool *
*********************/
class TDF_CopyTool {
	public:
		/****** TDF_CopyTool::Copy ******/
		/****** md5 signature: 2ad919cddc9b7241da9696a78c954561 ******/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "
Parameters
----------
aSourceDataSet: TDF_DataSet
aRelocationTable: TDF_RelocationTable

Return
-------
None

Description
-----------
Copy <aSourceDataSet> with using and updating <aRelocationTable>. This method ignores target attributes privilege over source ones.
") Copy;
		static void Copy(const opencascade::handle<TDF_DataSet> & aSourceDataSet, const opencascade::handle<TDF_RelocationTable> & aRelocationTable);

		/****** TDF_CopyTool::Copy ******/
		/****** md5 signature: 768e1b62d141161509e52761bbe287a3 ******/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "
Parameters
----------
aSourceDataSet: TDF_DataSet
aRelocationTable: TDF_RelocationTable
aPrivilegeFilter: TDF_IDFilter

Return
-------
None

Description
-----------
Copy <aSourceDataSet> using and updating <aRelocationTable>. Use <aPrivilegeFilter> to give a list of IDs for which the target attribute prevails over the source one.
") Copy;
		static void Copy(const opencascade::handle<TDF_DataSet> & aSourceDataSet, const opencascade::handle<TDF_RelocationTable> & aRelocationTable, const TDF_IDFilter & aPrivilegeFilter);

		/****** TDF_CopyTool::Copy ******/
		/****** md5 signature: 86b536dc896d9901389518ae854cc0d8 ******/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "
Parameters
----------
aSourceDataSet: TDF_DataSet
aRelocationTable: TDF_RelocationTable
aPrivilegeFilter: TDF_IDFilter
aRefFilter: TDF_IDFilter
setSelfContained: bool

Return
-------
None

Description
-----------
Copy <aSourceDataSet> using and updating <aRelocationTable>. Use <aPrivilegeFilter> to give a list of IDs for which the target attribute prevails over the source one. If <setSelfContained> is set to true, every TDF_Reference will be replaced by the referenced structure according to <aRefFilter>. //! NB: <aRefFilter> is used only if <setSelfContained> is true. Internal root label copy recursive method.
") Copy;
		static void Copy(const opencascade::handle<TDF_DataSet> & aSourceDataSet, const opencascade::handle<TDF_RelocationTable> & aRelocationTable, const TDF_IDFilter & aPrivilegeFilter, const TDF_IDFilter & aRefFilter, const Standard_Boolean setSelfContained);

};


%extend TDF_CopyTool {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************
* class TDF_Data *
*****************/
class TDF_Data : public Standard_Transient {
	public:
		/****** TDF_Data::TDF_Data ******/
		/****** md5 signature: 9fc63e5d9ac61de6ac00d5ea0bdb733a ******/
		%feature("compactdefaultargs") TDF_Data;
		%feature("autodoc", "Return
-------
None

Description
-----------
A new and empty Data structure.
") TDF_Data;
		 TDF_Data();

		/****** TDF_Data::AllowModification ******/
		/****** md5 signature: 3629f95e767d9884a68821b6c664883c ******/
		%feature("compactdefaultargs") AllowModification;
		%feature("autodoc", "
Parameters
----------
isAllowed: bool

Return
-------
None

Description
-----------
Sets modification mode.
") AllowModification;
		void AllowModification(const Standard_Boolean isAllowed);

		/****** TDF_Data::Destroy ******/
		/****** md5 signature: 73111f72f4ab0474eb2cfbd7e4af4e1a ******/
		%feature("compactdefaultargs") Destroy;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Destroy;
		void Destroy();

		/****** TDF_Data::Dump ******/
		/****** md5 signature: cfe815398c9c4191063c65e53f786693 ******/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "
Parameters
----------

Return
-------
anOS: Standard_OStream

Description
-----------
Dumps the Data on <aStream>.
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
		/****** TDF_Data::GetLabel ******/
		/****** md5 signature: 6acb21919b35dccd58a6c624736c7a64 ******/
		%feature("compactdefaultargs") GetLabel;
		%feature("autodoc", "
Parameters
----------
anEntry: str
aLabel: TDF_Label

Return
-------
bool

Description
-----------
Returns a label by an entry. Returns Standard_False, if such a label doesn't exist or mechanism for fast access to the label by entry is not initialized.
") GetLabel;
		Standard_Boolean GetLabel(TCollection_AsciiString anEntry, TDF_Label & aLabel);

		/****** TDF_Data::IsAccessByEntries ******/
		/****** md5 signature: e9c87e292dba49522735bc8b2f6391f2 ******/
		%feature("compactdefaultargs") IsAccessByEntries;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns a status of mechanism for fast access to the labels via entries.
") IsAccessByEntries;
		Standard_Boolean IsAccessByEntries();

		/****** TDF_Data::IsApplicable ******/
		/****** md5 signature: 3bce195eeb54500772a8ae9747fed4f1 ******/
		%feature("compactdefaultargs") IsApplicable;
		%feature("autodoc", "
Parameters
----------
aDelta: TDF_Delta

Return
-------
bool

Description
-----------
Returns true if <aDelta> is applicable HERE and NOW.
") IsApplicable;
		Standard_Boolean IsApplicable(const opencascade::handle<TDF_Delta> & aDelta);

		/****** TDF_Data::IsModificationAllowed ******/
		/****** md5 signature: 2024d7829729e942aa313777d0c41fd3 ******/
		%feature("compactdefaultargs") IsModificationAllowed;
		%feature("autodoc", "Return
-------
bool

Description
-----------
returns modification mode.
") IsModificationAllowed;
		Standard_Boolean IsModificationAllowed();

		/****** TDF_Data::LabelNodeAllocator ******/
		/****** md5 signature: 51616b0b91fcc4a24241ddee1ed9e63f ******/
		%feature("compactdefaultargs") LabelNodeAllocator;
		%feature("autodoc", "Return
-------
TDF_HAllocator

Description
-----------
Returns TDF_HAllocator, which is an incremental allocator used by TDF_LabelNode. This allocator is used to manage TDF_LabelNode objects, but it can also be used for allocating memory to application-specific data (be careful because this allocator does not release the memory). The benefits of this allocation scheme are noticeable when dealing with large OCAF documents, due to: 1. Very quick allocation of objects (memory heap is not used, the algorithm that replaces it is very simple). 2. Very quick destruction of objects (memory is released not by destructors of TDF_LabelNode, but rather by the destructor of TDF_Data). 3. TDF_LabelNode objects do not fragmentize the memory; they are kept compactly in a number of arrays of 16K each. 4. Swapping is reduced on large data, because each document now occupies a smaller number of memory pages.
") LabelNodeAllocator;
		const TDF_HAllocator & LabelNodeAllocator();

		/****** TDF_Data::NotUndoMode ******/
		/****** md5 signature: abeb3f9854eb45a2b17d3745f22b5e53 ******/
		%feature("compactdefaultargs") NotUndoMode;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns the undo mode status.
") NotUndoMode;
		Standard_Boolean NotUndoMode();

		/****** TDF_Data::RegisterLabel ******/
		/****** md5 signature: 338d96516dcaa839075496537c99690a ******/
		%feature("compactdefaultargs") RegisterLabel;
		%feature("autodoc", "
Parameters
----------
aLabel: TDF_Label

Return
-------
None

Description
-----------
An internal method. It is used internally on creation of new labels. It adds a new label into internal table for fast access to the labels by entry.
") RegisterLabel;
		void RegisterLabel(const TDF_Label & aLabel);

		/****** TDF_Data::Root ******/
		/****** md5 signature: 8d91e6b3e48b0dcd1ed6725e1e277a57 ******/
		%feature("compactdefaultargs") Root;
		%feature("autodoc", "Return
-------
TDF_Label

Description
-----------
Returns the root label of the Data structure.
") Root;
		const TDF_Label Root();

		/****** TDF_Data::SetAccessByEntries ******/
		/****** md5 signature: 7db07372e18eb363da4daa94e4ebb296 ******/
		%feature("compactdefaultargs") SetAccessByEntries;
		%feature("autodoc", "
Parameters
----------
aSet: bool

Return
-------
None

Description
-----------
Initializes a mechanism for fast access to the labels by their entries. The fast access is useful for large documents and often access to the labels via entries. Internally, a table of entry - label is created, which allows to obtain a label by its entry in a very fast way. If the mechanism is turned off, the internal table is cleaned. New labels are added to the table, if the mechanism is on (no need to re-initialize the mechanism).
") SetAccessByEntries;
		void SetAccessByEntries(const Standard_Boolean aSet);

		/****** TDF_Data::Time ******/
		/****** md5 signature: 29e54f38b67d119a1dd7d985afb308c4 ******/
		%feature("compactdefaultargs") Time;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the current tick. It is incremented each Commit.
") Time;
		Standard_Integer Time();

		/****** TDF_Data::Transaction ******/
		/****** md5 signature: 00c48137a99575bfa5cfadde8fb37954 ******/
		%feature("compactdefaultargs") Transaction;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the current transaction number.
") Transaction;
		Standard_Integer Transaction();

		/****** TDF_Data::Undo ******/
		/****** md5 signature: e381e2729d2baa6e06b5553ecb90f6be ******/
		%feature("compactdefaultargs") Undo;
		%feature("autodoc", "
Parameters
----------
aDelta: TDF_Delta
withDelta: bool (optional, default to Standard_False)

Return
-------
opencascade::handle<TDF_Delta>

Description
-----------
Apply <aDelta> to undo a set of attribute modifications. //! Optional <withDelta> set to True indicates a Delta Set must be generated. (See above).
") Undo;
		opencascade::handle<TDF_Delta> Undo(const opencascade::handle<TDF_Delta> & aDelta, const Standard_Boolean withDelta = Standard_False);

};


%make_alias(TDF_Data)

%extend TDF_Data {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************
* class TDF_DataSet *
********************/
class TDF_DataSet : public Standard_Transient {
	public:
		/****** TDF_DataSet::TDF_DataSet ******/
		/****** md5 signature: 38b87a8b1743078c8ca1b762ca848a5b ******/
		%feature("compactdefaultargs") TDF_DataSet;
		%feature("autodoc", "Return
-------
None

Description
-----------
Creates an empty DataSet object.
") TDF_DataSet;
		 TDF_DataSet();

		/****** TDF_DataSet::AddAttribute ******/
		/****** md5 signature: f3d67ca0190efaa72217965efe5fa3f3 ******/
		%feature("compactdefaultargs") AddAttribute;
		%feature("autodoc", "
Parameters
----------
anAttribute: TDF_Attribute

Return
-------
None

Description
-----------
Adds <anAttribute> into the current data set.
") AddAttribute;
		void AddAttribute(const opencascade::handle<TDF_Attribute> & anAttribute);

		/****** TDF_DataSet::AddLabel ******/
		/****** md5 signature: 7fbcb1070afe949ef0df7c94c85a6d05 ******/
		%feature("compactdefaultargs") AddLabel;
		%feature("autodoc", "
Parameters
----------
aLabel: TDF_Label

Return
-------
None

Description
-----------
Adds <aLabel> in the current data set.
") AddLabel;
		void AddLabel(const TDF_Label & aLabel);

		/****** TDF_DataSet::AddRoot ******/
		/****** md5 signature: 7f361ae371dd39d3acb9e85caacc6ae9 ******/
		%feature("compactdefaultargs") AddRoot;
		%feature("autodoc", "
Parameters
----------
aLabel: TDF_Label

Return
-------
None

Description
-----------
Adds a root label to <myRootLabels>.
") AddRoot;
		void AddRoot(const TDF_Label & aLabel);

		/****** TDF_DataSet::Attributes ******/
		/****** md5 signature: 67153ada94d44acfe76da77081ef336b ******/
		%feature("compactdefaultargs") Attributes;
		%feature("autodoc", "Return
-------
TDF_AttributeMap

Description
-----------
Returns the map of attributes in the current data set. This map can be used directly, or updated.
") Attributes;
		TDF_AttributeMap & Attributes();

		/****** TDF_DataSet::Clear ******/
		/****** md5 signature: ae54be580b423a6eadbe062e0bdb44c2 ******/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "Return
-------
None

Description
-----------
Clears all information.
") Clear;
		void Clear();

		/****** TDF_DataSet::ContainsAttribute ******/
		/****** md5 signature: f5cfecdfca3855c7c473be249d687485 ******/
		%feature("compactdefaultargs") ContainsAttribute;
		%feature("autodoc", "
Parameters
----------
anAttribute: TDF_Attribute

Return
-------
bool

Description
-----------
Returns true if <anAttribute> is in the data set.
") ContainsAttribute;
		Standard_Boolean ContainsAttribute(const opencascade::handle<TDF_Attribute> & anAttribute);

		/****** TDF_DataSet::ContainsLabel ******/
		/****** md5 signature: f95464b8fc5a41d2c99d023622240899 ******/
		%feature("compactdefaultargs") ContainsLabel;
		%feature("autodoc", "
Parameters
----------
aLabel: TDF_Label

Return
-------
bool

Description
-----------
Returns true if the label <alabel> is in the data set.
") ContainsLabel;
		Standard_Boolean ContainsLabel(const TDF_Label & aLabel);

		/****** TDF_DataSet::Dump ******/
		/****** md5 signature: cfe815398c9c4191063c65e53f786693 ******/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "
Parameters
----------

Return
-------
anOS: Standard_OStream

Description
-----------
Dumps the minimum information about <self> on <aStream>.
") Dump;
		Standard_OStream & Dump(std::ostream &OutValue);

		/****** TDF_DataSet::IsEmpty ******/
		/****** md5 signature: 6ab5e1ad63f93168856ab126dd374b81 ******/
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if there is at least one label or one attribute.
") IsEmpty;
		Standard_Boolean IsEmpty();

		/****** TDF_DataSet::Labels ******/
		/****** md5 signature: ea1fec9a82297e5e75aa304f7e196b4d ******/
		%feature("compactdefaultargs") Labels;
		%feature("autodoc", "Return
-------
TDF_LabelMap

Description
-----------
Returns the map of labels in this data set. This map can be used directly, or updated.
") Labels;
		TDF_LabelMap & Labels();

		/****** TDF_DataSet::Roots ******/
		/****** md5 signature: f326664333bfba9316463d303f238419 ******/
		%feature("compactdefaultargs") Roots;
		%feature("autodoc", "Return
-------
TDF_LabelList

Description
-----------
Returns <myRootLabels> to be used or updated.
") Roots;
		TDF_LabelList & Roots();

};


%make_alias(TDF_DataSet)

%extend TDF_DataSet {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************
* class TDF_Delta *
******************/
class TDF_Delta : public Standard_Transient {
	public:
		/****** TDF_Delta::TDF_Delta ******/
		/****** md5 signature: c25ba13e80b876ae81fda885bcb8f719 ******/
		%feature("compactdefaultargs") TDF_Delta;
		%feature("autodoc", "Return
-------
None

Description
-----------
Creates a delta.
") TDF_Delta;
		 TDF_Delta();

		/****** TDF_Delta::AttributeDeltas ******/
		/****** md5 signature: a01630877acf73e0fe223f8de99987dc ******/
		%feature("compactdefaultargs") AttributeDeltas;
		%feature("autodoc", "Return
-------
TDF_AttributeDeltaList

Description
-----------
Returns the field <myAttDeltaList>.
") AttributeDeltas;
		const TDF_AttributeDeltaList & AttributeDeltas();

		/****** TDF_Delta::BeginTime ******/
		/****** md5 signature: bbc7dc7595a2b0017ba4e997281b3b9d ******/
		%feature("compactdefaultargs") BeginTime;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the field <myBeginTime>.
") BeginTime;
		Standard_Integer BeginTime();

		/****** TDF_Delta::Dump ******/
		/****** md5 signature: e60d722f65a7811be636699da7600e78 ******/
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
		void Dump(std::ostream &OutValue);


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
		/****** TDF_Delta::EndTime ******/
		/****** md5 signature: ebfc0a5623f28f348163522aac1f9970 ******/
		%feature("compactdefaultargs") EndTime;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the field <myEndTime>.
") EndTime;
		Standard_Integer EndTime();

		/****** TDF_Delta::IsApplicable ******/
		/****** md5 signature: 69fca5e8fc8433a54befd18a7a29c75e ******/
		%feature("compactdefaultargs") IsApplicable;
		%feature("autodoc", "
Parameters
----------
aCurrentTime: int

Return
-------
bool

Description
-----------
Returns true if the Undo action of <self> is applicable at <aCurrentTime>.
") IsApplicable;
		Standard_Boolean IsApplicable(const Standard_Integer aCurrentTime);

		/****** TDF_Delta::IsEmpty ******/
		/****** md5 signature: 6ab5e1ad63f93168856ab126dd374b81 ******/
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if there is nothing to undo.
") IsEmpty;
		Standard_Boolean IsEmpty();

		/****** TDF_Delta::Labels ******/
		/****** md5 signature: 3221e83f835ac762589f5da76c6d2476 ******/
		%feature("compactdefaultargs") Labels;
		%feature("autodoc", "
Parameters
----------
aLabelList: TDF_LabelList

Return
-------
None

Description
-----------
Adds in <aLabelList> the labels of the attribute deltas. Caution: <aLabelList> is not cleared before use.
") Labels;
		void Labels(TDF_LabelList & aLabelList);

		/****** TDF_Delta::Name ******/
		/****** md5 signature: a9e55299a1405b3a2863469f1a67f9cd ******/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "Return
-------
TCollection_ExtendedString

Description
-----------
Returns a name associated with this delta.
") Name;
		TCollection_ExtendedString Name();

		/****** TDF_Delta::SetName ******/
		/****** md5 signature: 37faf29196bae8c9862db277eec2dc6c ******/
		%feature("compactdefaultargs") SetName;
		%feature("autodoc", "
Parameters
----------
theName: str

Return
-------
None

Description
-----------
Associates a name <theName> with this delta.
") SetName;
		void SetName(TCollection_ExtendedString theName);

};


%make_alias(TDF_Delta)

%extend TDF_Delta {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************
* class TDF_DerivedAttribute *
*****************************/
/*********************
* class TDF_IDFilter *
*********************/
class TDF_IDFilter {
	public:
		/****** TDF_IDFilter::TDF_IDFilter ******/
		/****** md5 signature: 58987a5c5f723e0f2e6217e5f5a27ef6 ******/
		%feature("compactdefaultargs") TDF_IDFilter;
		%feature("autodoc", "
Parameters
----------
ignoreMode: bool (optional, default to Standard_True)

Return
-------
None

Description
-----------
Creates an ID/attribute filter based on an ID list. The default mode is 'ignore all but...'. //! This filter has 2 working mode: keep and ignore. //! Ignore/Exclusive mode: all IDs are ignored except these set to be kept, using Keep(). Of course, it is possible set an kept ID to be ignored using Ignore(). //! Keep/Inclusive mode: all IDs are kept except these set to be ignored, using Ignore(). Of course, it is possible set an ignored ID to be kept using Keep().
") TDF_IDFilter;
		 TDF_IDFilter(const Standard_Boolean ignoreMode = Standard_True);

		/****** TDF_IDFilter::Assign ******/
		/****** md5 signature: f12375baab885781bf8dbb6d3a9bc5be ******/
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "
Parameters
----------
theFilter: TDF_IDFilter

Return
-------
None

Description
-----------
Assignment.
") Assign;
		void Assign(const TDF_IDFilter & theFilter);

		/****** TDF_IDFilter::Copy ******/
		/****** md5 signature: cba1c4d44a1e2ba6eeeb86e5e53cc5e3 ******/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "
Parameters
----------
fromFilter: TDF_IDFilter

Return
-------
None

Description
-----------
Copies into <self> the contents of <fromFilter>. <self> is cleared before copy.
") Copy;
		void Copy(const TDF_IDFilter & fromFilter);

		/****** TDF_IDFilter::Dump ******/
		/****** md5 signature: 43df1fb908adbf242957532375689066 ******/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "
Parameters
----------

Return
-------
anOS: Standard_OStream

Description
-----------
Writes the contents of <self> to <OS>.
") Dump;
		void Dump(std::ostream &OutValue);

		/****** TDF_IDFilter::IDList ******/
		/****** md5 signature: 51f584875347d58754d482e26d1410b6 ******/
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
Copies the list of ID to be kept or ignored in <anIDList>. <anIDList> is cleared before use.
") IDList;
		void IDList(TDF_IDList & anIDList);

		/****** TDF_IDFilter::Ignore ******/
		/****** md5 signature: ef193e95aeab177af35fe8cb04756e08 ******/
		%feature("compactdefaultargs") Ignore;
		%feature("autodoc", "
Parameters
----------
anID: Standard_GUID

Return
-------
None

Description
-----------
An attribute with <anID> as ID is to be ignored and the filter will answer false to the question IsKept(<anID>).
") Ignore;
		void Ignore(const Standard_GUID & anID);

		/****** TDF_IDFilter::Ignore ******/
		/****** md5 signature: 3b86bb6fc9fec9a8002469571237228e ******/
		%feature("compactdefaultargs") Ignore;
		%feature("autodoc", "
Parameters
----------
anIDList: TDF_IDList

Return
-------
None

Description
-----------
Attributes with ID owned by <anIDList> are to be ignored and the filter will answer false to the question IsKept(<anID>) with ID from <anIDList>.
") Ignore;
		void Ignore(const TDF_IDList & anIDList);

		/****** TDF_IDFilter::IgnoreAll ******/
		/****** md5 signature: efc50b8e6d73cc9f9ccc417f512fca20 ******/
		%feature("compactdefaultargs") IgnoreAll;
		%feature("autodoc", "
Parameters
----------
ignore: bool

Return
-------
None

Description
-----------
The list of ID is cleared and the filter mode is set to ignore mode if <keep> is true; false otherwise.
") IgnoreAll;
		void IgnoreAll(const Standard_Boolean ignore);

		/****** TDF_IDFilter::IgnoreAll ******/
		/****** md5 signature: 0f8fc4125eb61399d6834b6d0ca04a16 ******/
		%feature("compactdefaultargs") IgnoreAll;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true is the mode is set to 'ignore all but...'.
") IgnoreAll;
		Standard_Boolean IgnoreAll();

		/****** TDF_IDFilter::IsIgnored ******/
		/****** md5 signature: d981ce364d388866cbe2605fb6b255bc ******/
		%feature("compactdefaultargs") IsIgnored;
		%feature("autodoc", "
Parameters
----------
anID: Standard_GUID

Return
-------
bool

Description
-----------
Returns true if the ID is to be ignored.
") IsIgnored;
		Standard_Boolean IsIgnored(const Standard_GUID & anID);

		/****** TDF_IDFilter::IsIgnored ******/
		/****** md5 signature: c04e34ba0398a9d432af6e2ebc5ef72f ******/
		%feature("compactdefaultargs") IsIgnored;
		%feature("autodoc", "
Parameters
----------
anAtt: TDF_Attribute

Return
-------
bool

Description
-----------
Returns true if the attribute is to be ignored.
") IsIgnored;
		Standard_Boolean IsIgnored(const opencascade::handle<TDF_Attribute> & anAtt);

		/****** TDF_IDFilter::IsKept ******/
		/****** md5 signature: c74df13be2964aac3c844c5c22f6dbbc ******/
		%feature("compactdefaultargs") IsKept;
		%feature("autodoc", "
Parameters
----------
anID: Standard_GUID

Return
-------
bool

Description
-----------
Returns true if the ID is to be kept.
") IsKept;
		Standard_Boolean IsKept(const Standard_GUID & anID);

		/****** TDF_IDFilter::IsKept ******/
		/****** md5 signature: e9ee54cee186f5a5c5fbe8f5206bbbb0 ******/
		%feature("compactdefaultargs") IsKept;
		%feature("autodoc", "
Parameters
----------
anAtt: TDF_Attribute

Return
-------
bool

Description
-----------
Returns true if the attribute is to be kept.
") IsKept;
		Standard_Boolean IsKept(const opencascade::handle<TDF_Attribute> & anAtt);

		/****** TDF_IDFilter::Keep ******/
		/****** md5 signature: 44117785f35284179a4db2ed450a031b ******/
		%feature("compactdefaultargs") Keep;
		%feature("autodoc", "
Parameters
----------
anID: Standard_GUID

Return
-------
None

Description
-----------
An attribute with <anID> as ID is to be kept and the filter will answer true to the question IsKept(<anID>).
") Keep;
		void Keep(const Standard_GUID & anID);

		/****** TDF_IDFilter::Keep ******/
		/****** md5 signature: d00a54cbc2ef1dc529ade6c39e222865 ******/
		%feature("compactdefaultargs") Keep;
		%feature("autodoc", "
Parameters
----------
anIDList: TDF_IDList

Return
-------
None

Description
-----------
Attributes with ID owned by <anIDList> are to be kept and the filter will answer true to the question IsKept(<anID>) with ID from <anIDList>.
") Keep;
		void Keep(const TDF_IDList & anIDList);

};


%extend TDF_IDFilter {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************
* class TDF_Label *
******************/
class TDF_Label {
	public:
		/****** TDF_Label::TDF_Label ******/
		/****** md5 signature: 1a8e59ba046467c4e163db826620fcdb ******/
		%feature("compactdefaultargs") TDF_Label;
		%feature("autodoc", "Return
-------
None

Description
-----------
Constructs an empty label object.
") TDF_Label;
		 TDF_Label();

		/****** TDF_Label::AddAttribute ******/
		/****** md5 signature: 6b2e59e881e33fcbfe2d87e62e7a38c4 ******/
		%feature("compactdefaultargs") AddAttribute;
		%feature("autodoc", "
Parameters
----------
anAttribute: TDF_Attribute
append: bool (optional, default to Standard_True)

Return
-------
None

Description
-----------
Adds an Attribute to the current label. Raises if there is already one.
") AddAttribute;
		void AddAttribute(const opencascade::handle<TDF_Attribute> & anAttribute, const Standard_Boolean append = Standard_True);

		/****** TDF_Label::AttributesModified ******/
		/****** md5 signature: 2900274105f9122a0f7c89c8d5bdc04c ******/
		%feature("compactdefaultargs") AttributesModified;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if <self> owns attributes not yet available in transaction 0. It means at least one attribute is new, modified or deleted.
") AttributesModified;
		Standard_Boolean AttributesModified();

		/****** TDF_Label::Data ******/
		/****** md5 signature: 04ec1a781153c5a50d2756cf01f47e1c ******/
		%feature("compactdefaultargs") Data;
		%feature("autodoc", "Return
-------
opencascade::handle<TDF_Data>

Description
-----------
Returns the Data owning <self>.
") Data;
		opencascade::handle<TDF_Data> Data();

		/****** TDF_Label::Depth ******/
		/****** md5 signature: b6eaa771d2fe709741b9c1e8ce5ec68f ******/
		%feature("compactdefaultargs") Depth;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the depth of the label in the data framework. This corresponds to the number of fathers which this label has, and is used in determining whether a label is root, null or equivalent to another label. Exceptions: Standard_NullObject if this label is null. This is because a null object can have no depth.
") Depth;
		Standard_Integer Depth();

		/****** TDF_Label::Dump ******/
		/****** md5 signature: cfe815398c9c4191063c65e53f786693 ******/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "
Parameters
----------

Return
-------
anOS: Standard_OStream

Description
-----------
Dumps the minimum information about <self> on <aStream>.
") Dump;
		Standard_OStream & Dump(std::ostream &OutValue);

		/****** TDF_Label::EntryDump ******/
		/****** md5 signature: b1831f922bafdab54839dc202c26f4f7 ******/
		%feature("compactdefaultargs") EntryDump;
		%feature("autodoc", "
Parameters
----------

Return
-------
anOS: Standard_OStream

Description
-----------
Dumps the label entry.
") EntryDump;
		void EntryDump(std::ostream &OutValue);

		/****** TDF_Label::ExtendedDump ******/
		/****** md5 signature: af33a4abcb3b7b5ccf7bc889f69d60fb ******/
		%feature("compactdefaultargs") ExtendedDump;
		%feature("autodoc", "
Parameters
----------
aFilter: TDF_IDFilter
aMap: TDF_AttributeIndexedMap

Return
-------
anOS: Standard_OStream

Description
-----------
Dumps the label on <aStream> and its attributes rank in <aMap> if their IDs are kept by <IDFilter>.
") ExtendedDump;
		void ExtendedDump(std::ostream &OutValue, const TDF_IDFilter & aFilter, TDF_AttributeIndexedMap & aMap);

		/****** TDF_Label::Father ******/
		/****** md5 signature: a0f1cf18875c9b067fe3f49cfc73a13d ******/
		%feature("compactdefaultargs") Father;
		%feature("autodoc", "Return
-------
TDF_Label

Description
-----------
Returns the label father. This label may be null if the label is root.
") Father;
		const TDF_Label Father();

		/****** TDF_Label::FindAttribute ******/
		/****** md5 signature: 5f4fd12b74a27c4216127d1ce8d3b78a ******/
		%feature("compactdefaultargs") FindAttribute;
		%feature("autodoc", "
Parameters
----------
anID: Standard_GUID
anAttribute: TDF_Attribute

Return
-------
bool

Description
-----------
Finds an attribute of the current label, according to <anID>. If anAttribute is not a valid one, false is returned. //! The method returns True if found, False otherwise. //! A removed attribute cannot be found.
") FindAttribute;
		Standard_Boolean FindAttribute(const Standard_GUID & anID, opencascade::handle<TDF_Attribute> & anAttribute);

		/****** TDF_Label::FindAttribute ******/
		/****** md5 signature: 7c7c7cdcc2d92b5e36db059c8747501d ******/
		%feature("compactdefaultargs") FindAttribute;
		%feature("autodoc", "
Parameters
----------
anID: Standard_GUID
aTransaction: int
anAttribute: TDF_Attribute

Return
-------
bool

Description
-----------
Finds an attribute of the current label, according to <anID> and <aTransaction>. This attribute has/had to be a valid one for the given transaction index . So, this attribute is not necessary a valid one. //! The method returns True if found, False otherwise. //! A removed attribute cannot be found nor a backuped attribute of a removed one.
") FindAttribute;
		Standard_Boolean FindAttribute(const Standard_GUID & anID, const Standard_Integer aTransaction, opencascade::handle<TDF_Attribute> & anAttribute);

		/****** TDF_Label::FindChild ******/
		/****** md5 signature: a60e65fcd27d44e6f003161f38441bca ******/
		%feature("compactdefaultargs") FindChild;
		%feature("autodoc", "
Parameters
----------
aTag: int
create: bool (optional, default to Standard_True)

Return
-------
TDF_Label

Description
-----------
Finds a child label having <aTag> as tag. Creates The tag aTag identifies the label which will be the parent. If create is true and no child label is found, a new one is created. Example: //creating a label with tag 10 at Root TDF_Label lab1 = aDF->Root().FindChild(10); //creating labels 7 and 2 on label 10 TDF_Label lab2 = lab1.FindChild(7); TDF_Label lab3 = lab1.FindChild(2);.
") FindChild;
		TDF_Label FindChild(const Standard_Integer aTag, const Standard_Boolean create = Standard_True);

		/****** TDF_Label::ForgetAllAttributes ******/
		/****** md5 signature: f0492f70679f693e73f3cd351b602cd9 ******/
		%feature("compactdefaultargs") ForgetAllAttributes;
		%feature("autodoc", "
Parameters
----------
clearChildren: bool (optional, default to Standard_True)

Return
-------
None

Description
-----------
Forgets all the attributes. Does it on also on the sub-labels if <clearChildren> is set to true. Of course, this method is compatible with Transaction & Delta mechanisms.
") ForgetAllAttributes;
		void ForgetAllAttributes(const Standard_Boolean clearChildren = Standard_True);

		/****** TDF_Label::ForgetAttribute ******/
		/****** md5 signature: e72ba5b0453e41eca721688844ba10a0 ******/
		%feature("compactdefaultargs") ForgetAttribute;
		%feature("autodoc", "
Parameters
----------
anAttribute: TDF_Attribute

Return
-------
None

Description
-----------
Forgets an Attribute from the current label, setting its forgotten status true and its valid status false. Raises if the attribute is not in the structure.
") ForgetAttribute;
		void ForgetAttribute(const opencascade::handle<TDF_Attribute> & anAttribute);

		/****** TDF_Label::ForgetAttribute ******/
		/****** md5 signature: 52de4f1eac4c1d719dc2240e16600cdd ******/
		%feature("compactdefaultargs") ForgetAttribute;
		%feature("autodoc", "
Parameters
----------
aguid: Standard_GUID

Return
-------
bool

Description
-----------
Forgets the Attribute of GUID <aguid> from the current label . If the attribute doesn't exist returns False. Otherwise returns True.
") ForgetAttribute;
		Standard_Boolean ForgetAttribute(const Standard_GUID & aguid);

		/****** TDF_Label::HasAttribute ******/
		/****** md5 signature: c83a3a57dd33408208dae228eee63622 ******/
		%feature("compactdefaultargs") HasAttribute;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if this label has at least one attribute.
") HasAttribute;
		Standard_Boolean HasAttribute();

		/****** TDF_Label::HasChild ******/
		/****** md5 signature: a154ee7ab861537ddf2ce2de1cdad10c ******/
		%feature("compactdefaultargs") HasChild;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if this label has at least one child.
") HasChild;
		Standard_Boolean HasChild();

		/****** TDF_Label::HasGreaterNode ******/
		/****** md5 signature: 1b115e58390ef40597d4a570dc9420ff ******/
		%feature("compactdefaultargs") HasGreaterNode;
		%feature("autodoc", "
Parameters
----------
otherLabel: TDF_Label

Return
-------
bool

Description
-----------
Returns true if node address of <self> is greater than <otherLabel> one. Used to quickly sort labels (not on entry criterion). //! -C++: inline.
") HasGreaterNode;
		Standard_Boolean HasGreaterNode(const TDF_Label & otherLabel);

		/****** TDF_Label::HasLowerNode ******/
		/****** md5 signature: 1929eebd8759cc1a4390e4dd4b079b88 ******/
		%feature("compactdefaultargs") HasLowerNode;
		%feature("autodoc", "
Parameters
----------
otherLabel: TDF_Label

Return
-------
bool

Description
-----------
Returns true if node address of <self> is lower than <otherLabel> one. Used to quickly sort labels (not on entry criterion). //! -C++: inline.
") HasLowerNode;
		Standard_Boolean HasLowerNode(const TDF_Label & otherLabel);

		/****** TDF_Label::Imported ******/
		/****** md5 signature: e00dc1ebd8c5a21a287230a63b0d04c4 ******/
		%feature("compactdefaultargs") Imported;
		%feature("autodoc", "
Parameters
----------
aStatus: bool

Return
-------
None

Description
-----------
Sets or unsets <self> and all its descendants as imported label, according to <aStatus>.
") Imported;
		void Imported(const Standard_Boolean aStatus);

		/****** TDF_Label::IsAttribute ******/
		/****** md5 signature: d4c3cd3354e07d22381503542a5e16aa ******/
		%feature("compactdefaultargs") IsAttribute;
		%feature("autodoc", "
Parameters
----------
anID: Standard_GUID

Return
-------
bool

Description
-----------
Returns true if <self> owns an attribute with <anID> as ID.
") IsAttribute;
		Standard_Boolean IsAttribute(const Standard_GUID & anID);

		/****** TDF_Label::IsDescendant ******/
		/****** md5 signature: c4072a23dbe117ddbc6d1257b53382e4 ******/
		%feature("compactdefaultargs") IsDescendant;
		%feature("autodoc", "
Parameters
----------
aLabel: TDF_Label

Return
-------
bool

Description
-----------
Returns True if <self> is a descendant of <aLabel>. Attention: every label is its own descendant.
") IsDescendant;
		Standard_Boolean IsDescendant(const TDF_Label & aLabel);

		/****** TDF_Label::IsDifferent ******/
		/****** md5 signature: 06534e200fafc26109ed216afd68537f ******/
		%feature("compactdefaultargs") IsDifferent;
		%feature("autodoc", "
Parameters
----------
aLabel: TDF_Label

Return
-------
bool

Description
-----------
No available documentation.
") IsDifferent;
		Standard_Boolean IsDifferent(const TDF_Label & aLabel);

		/****** TDF_Label::IsEqual ******/
		/****** md5 signature: 70468734b4ece003f2edac176a08a757 ******/
		%feature("compactdefaultargs") IsEqual;
		%feature("autodoc", "
Parameters
----------
aLabel: TDF_Label

Return
-------
bool

Description
-----------
Returns True if the <aLabel> is equal to me (same LabelNode*).
") IsEqual;
		Standard_Boolean IsEqual(const TDF_Label & aLabel);

		/****** TDF_Label::IsImported ******/
		/****** md5 signature: fb7a79457fc419ced96fb68afd83327e ******/
		%feature("compactdefaultargs") IsImported;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if the <aLabel> is imported.
") IsImported;
		Standard_Boolean IsImported();

		/****** TDF_Label::IsNull ******/
		/****** md5 signature: eab2964eabd2f0636e5f767661fb72a9 ******/
		%feature("compactdefaultargs") IsNull;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if the <aLabel> is null, i.e. it has not been included in the data framework.
") IsNull;
		Standard_Boolean IsNull();

		/****** TDF_Label::IsRoot ******/
		/****** md5 signature: 9d981f423106a71cbae38fc5c56749f7 ******/
		%feature("compactdefaultargs") IsRoot;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsRoot;
		Standard_Boolean IsRoot();

		/****** TDF_Label::MayBeModified ******/
		/****** md5 signature: f0df85b4481bf058c26aca9399b8068b ******/
		%feature("compactdefaultargs") MayBeModified;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if <self> or a DESCENDANT of <self> owns attributes not yet available in transaction 0. It means at least one of their attributes is new, modified or deleted.
") MayBeModified;
		Standard_Boolean MayBeModified();

		/****** TDF_Label::NbAttributes ******/
		/****** md5 signature: 030fc1ab36c5ed65e9d9eafc56462331 ******/
		%feature("compactdefaultargs") NbAttributes;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of attributes.
") NbAttributes;
		Standard_Integer NbAttributes();

		/****** TDF_Label::NbChildren ******/
		/****** md5 signature: 4cd749dbf8e93e1f47a795e922eb497f ******/
		%feature("compactdefaultargs") NbChildren;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of children.
") NbChildren;
		Standard_Integer NbChildren();

		/****** TDF_Label::NewChild ******/
		/****** md5 signature: f3a9f914d60ad0eee36e9c24bab2ecef ******/
		%feature("compactdefaultargs") NewChild;
		%feature("autodoc", "Return
-------
TDF_Label

Description
-----------
Create a new child label of me using autoamtic delivery tags provided by TagSource.
") NewChild;
		TDF_Label NewChild();

		/****** TDF_Label::Nullify ******/
		/****** md5 signature: 1915d5159e87738b7b9af9d5accf4c6e ******/
		%feature("compactdefaultargs") Nullify;
		%feature("autodoc", "Return
-------
None

Description
-----------
Nullifies the label.
") Nullify;
		void Nullify();

		/****** TDF_Label::ResumeAttribute ******/
		/****** md5 signature: e493b22327bc19ec2b05a27c84f03e3b ******/
		%feature("compactdefaultargs") ResumeAttribute;
		%feature("autodoc", "
Parameters
----------
anAttribute: TDF_Attribute

Return
-------
None

Description
-----------
Undo Forget action, setting its forgotten status false and its valid status true. Raises if the attribute is not in the structure.
") ResumeAttribute;
		void ResumeAttribute(const opencascade::handle<TDF_Attribute> & anAttribute);

		/****** TDF_Label::Root ******/
		/****** md5 signature: 8d91e6b3e48b0dcd1ed6725e1e277a57 ******/
		%feature("compactdefaultargs") Root;
		%feature("autodoc", "Return
-------
TDF_Label

Description
-----------
Returns the root label Root of the data structure. This has a depth of 0. Exceptions: Standard_NullObject if this label is null. This is because a null object can have no depth.
") Root;
		const TDF_Label Root();

		/****** TDF_Label::Tag ******/
		/****** md5 signature: 791177513adcbc21ede495c094d89fd2 ******/
		%feature("compactdefaultargs") Tag;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the tag of the label. This is the integer assigned randomly to a label in a data framework. This integer is used to identify this label in an entry.
") Tag;
		Standard_Integer Tag();

		/****** TDF_Label::Transaction ******/
		/****** md5 signature: 00c48137a99575bfa5cfadde8fb37954 ******/
		%feature("compactdefaultargs") Transaction;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the current transaction index.
") Transaction;
		Standard_Integer Transaction();


%extend{
    bool __ne_wrapper__(const TDF_Label other) {
        if (*self!=other) return true;
        else return false;
    }
}
%pythoncode {
def __ne__(self, right):
    try:
        return self.__ne_wrapper__(right)
    except:
        return True
}

%extend{
    bool __eq_wrapper__(const TDF_Label other) {
        if (*self==other) return true;
        else return false;
    }
}
%pythoncode {
def __eq__(self, right):
    try:
        return self.__eq_wrapper__(right)
    except:
        return False
}
%feature("autodoc", "Returns the label name") GetLabelName;
		%extend{
			std::string GetLabelName() {
			std::string txt;
			Handle(TDataStd_Name) name;
			if (!self->IsNull() && self->FindAttribute(TDataStd_Name::GetID(),name)) {
			TCollection_ExtendedString extstr = name->Get();
			char* str = new char[extstr.LengthOfCString()+1];
			extstr.ToUTF8CString(str);
			txt = str;
			delete[] str;}
			return txt;}
		};
};


%extend TDF_Label {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************
* class TDF_LabelNode *
**********************/
/****************************
* class TDF_RelocationTable *
****************************/
class TDF_RelocationTable : public Standard_Transient {
	public:
		/****** TDF_RelocationTable::TDF_RelocationTable ******/
		/****** md5 signature: 38f2ff8293692722818bcc491eb48985 ******/
		%feature("compactdefaultargs") TDF_RelocationTable;
		%feature("autodoc", "
Parameters
----------
selfRelocate: bool (optional, default to Standard_False)

Return
-------
None

Description
-----------
Creates an relocation table. <selfRelocate> says if a value without explicit relocation is its own relocation.
") TDF_RelocationTable;
		 TDF_RelocationTable(const Standard_Boolean selfRelocate = Standard_False);

		/****** TDF_RelocationTable::AfterRelocate ******/
		/****** md5 signature: d84076339c941ed8b0d1754325781c2a ******/
		%feature("compactdefaultargs") AfterRelocate;
		%feature("autodoc", "
Parameters
----------
afterRelocate: bool

Return
-------
None

Description
-----------
No available documentation.
") AfterRelocate;
		void AfterRelocate(const Standard_Boolean afterRelocate);

		/****** TDF_RelocationTable::AfterRelocate ******/
		/****** md5 signature: 697253380b685d8b61b28d4397896f5e ******/
		%feature("compactdefaultargs") AfterRelocate;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns <myAfterRelocate>.
") AfterRelocate;
		Standard_Boolean AfterRelocate();

		/****** TDF_RelocationTable::AttributeTable ******/
		/****** md5 signature: 1273cc558ecffa17c66d96aae42a6744 ******/
		%feature("compactdefaultargs") AttributeTable;
		%feature("autodoc", "Return
-------
TDF_AttributeDataMap

Description
-----------
Returns <myAttributeTable> to be used or updated.
") AttributeTable;
		TDF_AttributeDataMap & AttributeTable();

		/****** TDF_RelocationTable::Clear ******/
		/****** md5 signature: ae54be580b423a6eadbe062e0bdb44c2 ******/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "Return
-------
None

Description
-----------
Clears the relocation dictionary, but lets the self relocation flag to its current value.
") Clear;
		void Clear();

		/****** TDF_RelocationTable::Dump ******/
		/****** md5 signature: 2a7064c79887abf6a938c73a57576fd9 ******/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "
Parameters
----------
dumpLabels: bool
dumpAttributes: bool
dumpTransients: bool

Return
-------
anOS: Standard_OStream

Description
-----------
Dumps the relocation table.
") Dump;
		Standard_OStream & Dump(const Standard_Boolean dumpLabels, const Standard_Boolean dumpAttributes, const Standard_Boolean dumpTransients, std::ostream &OutValue);

		/****** TDF_RelocationTable::HasRelocation ******/
		/****** md5 signature: a28d159840ab7cb08cc986078d0af75d ******/
		%feature("compactdefaultargs") HasRelocation;
		%feature("autodoc", "
Parameters
----------
aSourceLabel: TDF_Label
aTargetLabel: TDF_Label

Return
-------
bool

Description
-----------
Finds the relocation value of <aSourceLabel> and returns it into <aTargetLabel>. //! (See above SelfRelocate method for more explanation about the method behavior).
") HasRelocation;
		Standard_Boolean HasRelocation(const TDF_Label & aSourceLabel, TDF_Label & aTargetLabel);

		/****** TDF_RelocationTable::HasRelocation ******/
		/****** md5 signature: 5f5b89c3575ed75c19cb9e22bf8759f6 ******/
		%feature("compactdefaultargs") HasRelocation;
		%feature("autodoc", "
Parameters
----------
aSourceAttribute: TDF_Attribute
aTargetAttribute: TDF_Attribute

Return
-------
bool

Description
-----------
Finds the relocation value of <aSourceAttribute> and returns it into <aTargetAttribute>. //! (See above SelfRelocate method for more explanation about the method behavior).
") HasRelocation;
		Standard_Boolean HasRelocation(const opencascade::handle<TDF_Attribute> & aSourceAttribute, opencascade::handle<TDF_Attribute> & aTargetAttribute);

		/****** TDF_RelocationTable::HasTransientRelocation ******/
		/****** md5 signature: 3adbba699110e4d44816ab54d56a1b5d ******/
		%feature("compactdefaultargs") HasTransientRelocation;
		%feature("autodoc", "
Parameters
----------
aSourceTransient: Standard_Transient
aTargetTransient: Standard_Transient

Return
-------
bool

Description
-----------
Finds the relocation value of <aSourceTransient> and returns it into <aTargetTransient>. //! (See above SelfRelocate method for more explanation about the method behavior).
") HasTransientRelocation;
		Standard_Boolean HasTransientRelocation(const opencascade::handle<Standard_Transient> & aSourceTransient, opencascade::handle<Standard_Transient> & aTargetTransient);

		/****** TDF_RelocationTable::LabelTable ******/
		/****** md5 signature: 485da555ceb4d57157014e91d8c611ce ******/
		%feature("compactdefaultargs") LabelTable;
		%feature("autodoc", "Return
-------
TDF_LabelDataMap

Description
-----------
Returns <myLabelTable> to be used or updated.
") LabelTable;
		TDF_LabelDataMap & LabelTable();

		/****** TDF_RelocationTable::SelfRelocate ******/
		/****** md5 signature: c384422c13e6298f25b8fd25d61a98f6 ******/
		%feature("compactdefaultargs") SelfRelocate;
		%feature("autodoc", "
Parameters
----------
selfRelocate: bool

Return
-------
None

Description
-----------
Sets <mySelfRelocate> to <selfRelocate>. //! This flag affects the HasRelocation method behavior like this: //! <mySelfRelocate> == False: //! If no relocation object is found in the map, a null object is returned //! <mySelfRelocate> == True: //! If no relocation object is found in the map, the method assumes the source object is relocation value; so the source object is returned as target object.
") SelfRelocate;
		void SelfRelocate(const Standard_Boolean selfRelocate);

		/****** TDF_RelocationTable::SelfRelocate ******/
		/****** md5 signature: fa3257a03fc9877898b39ac53bcaa7c5 ******/
		%feature("compactdefaultargs") SelfRelocate;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns <mySelfRelocate>.
") SelfRelocate;
		Standard_Boolean SelfRelocate();

		/****** TDF_RelocationTable::SetRelocation ******/
		/****** md5 signature: cf4c390ae41b6368257eab2f8d175ae0 ******/
		%feature("compactdefaultargs") SetRelocation;
		%feature("autodoc", "
Parameters
----------
aSourceLabel: TDF_Label
aTargetLabel: TDF_Label

Return
-------
None

Description
-----------
Sets the relocation value of <aSourceLabel> to <aTargetLabel>.
") SetRelocation;
		void SetRelocation(const TDF_Label & aSourceLabel, const TDF_Label & aTargetLabel);

		/****** TDF_RelocationTable::SetRelocation ******/
		/****** md5 signature: 5c896d8b5adfe05284f457ac0be56fa0 ******/
		%feature("compactdefaultargs") SetRelocation;
		%feature("autodoc", "
Parameters
----------
aSourceAttribute: TDF_Attribute
aTargetAttribute: TDF_Attribute

Return
-------
None

Description
-----------
Sets the relocation value of <aSourceAttribute> to <aTargetAttribute>.
") SetRelocation;
		void SetRelocation(const opencascade::handle<TDF_Attribute> & aSourceAttribute, const opencascade::handle<TDF_Attribute> & aTargetAttribute);

		/****** TDF_RelocationTable::SetTransientRelocation ******/
		/****** md5 signature: 1428ba1b8d2b28e81dec5e977988a35a ******/
		%feature("compactdefaultargs") SetTransientRelocation;
		%feature("autodoc", "
Parameters
----------
aSourceTransient: Standard_Transient
aTargetTransient: Standard_Transient

Return
-------
None

Description
-----------
Sets the relocation value of <aSourceTransient> to <aTargetTransient>.
") SetTransientRelocation;
		void SetTransientRelocation(const opencascade::handle<Standard_Transient> & aSourceTransient, const opencascade::handle<Standard_Transient> & aTargetTransient);

		/****** TDF_RelocationTable::TargetAttributeMap ******/
		/****** md5 signature: 26293a13506fac54e0b8cded12cb61f8 ******/
		%feature("compactdefaultargs") TargetAttributeMap;
		%feature("autodoc", "
Parameters
----------
anAttributeMap: TDF_AttributeMap

Return
-------
None

Description
-----------
Fills <anAttributeMap> with target relocation attributes. <anAttributeMap> is not cleared before use.
") TargetAttributeMap;
		void TargetAttributeMap(TDF_AttributeMap & anAttributeMap);

		/****** TDF_RelocationTable::TargetLabelMap ******/
		/****** md5 signature: 083517199b8634cdfc3a5eba3e4e7d70 ******/
		%feature("compactdefaultargs") TargetLabelMap;
		%feature("autodoc", "
Parameters
----------
aLabelMap: TDF_LabelMap

Return
-------
None

Description
-----------
Fills <aLabelMap> with target relocation labels. <aLabelMap> is not cleared before use.
") TargetLabelMap;
		void TargetLabelMap(TDF_LabelMap & aLabelMap);

		/****** TDF_RelocationTable::TransientTable ******/
		/****** md5 signature: 18c6e034e4269a22870ec5ff65bea9d9 ******/
		%feature("compactdefaultargs") TransientTable;
		%feature("autodoc", "Return
-------
TColStd_IndexedDataMapOfTransientTransient

Description
-----------
Returns <myTransientTable> to be used or updated.
") TransientTable;
		TColStd_IndexedDataMapOfTransientTransient & TransientTable();

};


%make_alias(TDF_RelocationTable)

%extend TDF_RelocationTable {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************
* class TDF_Tool *
*****************/
class TDF_Tool {
	public:
		/****** TDF_Tool::CountLabels ******/
		/****** md5 signature: 357345a4d8f0de55201bd2a93ce4fd20 ******/
		%feature("compactdefaultargs") CountLabels;
		%feature("autodoc", "
Parameters
----------
aLabelList: TDF_LabelList
aLabelMap: TDF_LabelIntegerMap

Return
-------
None

Description
-----------
Adds the labels of <aLabelList> to <aLabelMap> if they are unbound, or increases their reference counters. At the end of the process, <aLabelList> contains only the ADDED labels.
") CountLabels;
		static void CountLabels(TDF_LabelList & aLabelList, TDF_LabelIntegerMap & aLabelMap);

		/****** TDF_Tool::DeductLabels ******/
		/****** md5 signature: 89cbe0c451df6ab6d247cfe46a32b570 ******/
		%feature("compactdefaultargs") DeductLabels;
		%feature("autodoc", "
Parameters
----------
aLabelList: TDF_LabelList
aLabelMap: TDF_LabelIntegerMap

Return
-------
None

Description
-----------
Decreases the reference counters of the labels of <aLabelList> to <aLabelMap>, and removes labels with null counter. At the end of the process, <aLabelList> contains only the SUPPRESSED labels.
") DeductLabels;
		static void DeductLabels(TDF_LabelList & aLabelList, TDF_LabelIntegerMap & aLabelMap);

		/****** TDF_Tool::DeepDump ******/
		/****** md5 signature: 0865990b45a67afdb1d24c85517acea1 ******/
		%feature("compactdefaultargs") DeepDump;
		%feature("autodoc", "
Parameters
----------
aDF: TDF_Data

Return
-------
anOS: Standard_OStream

Description
-----------
Dumps <aDF> and its labels and their attributes.
") DeepDump;
		static void DeepDump(std::ostream &OutValue, const opencascade::handle<TDF_Data> & aDF);

		/****** TDF_Tool::DeepDump ******/
		/****** md5 signature: e4b5cb2df81a0376aea19a2db84fdb98 ******/
		%feature("compactdefaultargs") DeepDump;
		%feature("autodoc", "
Parameters
----------
aLabel: TDF_Label

Return
-------
anOS: Standard_OStream

Description
-----------
Dumps <aLabel>, its children and their attributes.
") DeepDump;
		static void DeepDump(std::ostream &OutValue, const TDF_Label & aLabel);

		/****** TDF_Tool::Entry ******/
		/****** md5 signature: 5846182a2901126a6abbd7b994d69204 ******/
		%feature("compactdefaultargs") Entry;
		%feature("autodoc", "
Parameters
----------
aLabel: TDF_Label
anEntry: str

Return
-------
None

Description
-----------
Returns the entry for the label aLabel in the form of the ASCII character string anEntry containing the tag list for aLabel.
") Entry;
		static void Entry(const TDF_Label & aLabel, TCollection_AsciiString & anEntry);

		/****** TDF_Tool::ExtendedDeepDump ******/
		/****** md5 signature: 0090a78df835b64f97d365e375094233 ******/
		%feature("compactdefaultargs") ExtendedDeepDump;
		%feature("autodoc", "
Parameters
----------
aDF: TDF_Data
aFilter: TDF_IDFilter

Return
-------
anOS: Standard_OStream

Description
-----------
Dumps <aDF> and its labels and their attributes, if their IDs are kept by <aFilter>. Dumps also the attributes content.
") ExtendedDeepDump;
		static void ExtendedDeepDump(std::ostream &OutValue, const opencascade::handle<TDF_Data> & aDF, const TDF_IDFilter & aFilter);

		/****** TDF_Tool::ExtendedDeepDump ******/
		/****** md5 signature: ad0131438f9321268f1740e7da980209 ******/
		%feature("compactdefaultargs") ExtendedDeepDump;
		%feature("autodoc", "
Parameters
----------
aLabel: TDF_Label
aFilter: TDF_IDFilter

Return
-------
anOS: Standard_OStream

Description
-----------
Dumps <aLabel>, its children and their attributes, if their IDs are kept by <aFilter>. Dumps also the attributes content.
") ExtendedDeepDump;
		static void ExtendedDeepDump(std::ostream &OutValue, const TDF_Label & aLabel, const TDF_IDFilter & aFilter);

		/****** TDF_Tool::IsSelfContained ******/
		/****** md5 signature: 022b907b8de1841e61e891cd408215cc ******/
		%feature("compactdefaultargs") IsSelfContained;
		%feature("autodoc", "
Parameters
----------
aLabel: TDF_Label

Return
-------
bool

Description
-----------
Returns true if <aLabel> and its descendants reference only attributes or labels attached to themselves.
") IsSelfContained;
		static Standard_Boolean IsSelfContained(const TDF_Label & aLabel);

		/****** TDF_Tool::IsSelfContained ******/
		/****** md5 signature: e8c306fe67c7f2dbdab50a397da507fa ******/
		%feature("compactdefaultargs") IsSelfContained;
		%feature("autodoc", "
Parameters
----------
aLabel: TDF_Label
aFilter: TDF_IDFilter

Return
-------
bool

Description
-----------
Returns true if <aLabel> and its descendants reference only attributes or labels attached to themselves and kept by <aFilter>.
") IsSelfContained;
		static Standard_Boolean IsSelfContained(const TDF_Label & aLabel, const TDF_IDFilter & aFilter);

		/****** TDF_Tool::Label ******/
		/****** md5 signature: a0b6165d731202c705d534ce73a4b9e4 ******/
		%feature("compactdefaultargs") Label;
		%feature("autodoc", "
Parameters
----------
aDF: TDF_Data
anEntry: str
aLabel: TDF_Label
create: bool (optional, default to Standard_False)

Return
-------
None

Description
-----------
Returns the label expressed by <anEntry>; creates the label if it does not exist and if <create> is true.
") Label;
		static void Label(const opencascade::handle<TDF_Data> & aDF, TCollection_AsciiString anEntry, TDF_Label & aLabel, const Standard_Boolean create = Standard_False);

		/****** TDF_Tool::Label ******/
		/****** md5 signature: 06e6f21799eb9ca00a6456b866227df2 ******/
		%feature("compactdefaultargs") Label;
		%feature("autodoc", "
Parameters
----------
aDF: TDF_Data
anEntry: str
aLabel: TDF_Label
create: bool (optional, default to Standard_False)

Return
-------
None

Description
-----------
Returns the label expressed by <anEntry>; creates the label if it does not exist and if <create> is true.
") Label;
		static void Label(const opencascade::handle<TDF_Data> & aDF, Standard_CString anEntry, TDF_Label & aLabel, const Standard_Boolean create = Standard_False);

		/****** TDF_Tool::Label ******/
		/****** md5 signature: 86d4f246c23ebec41b9cd05f0e7f6a0a ******/
		%feature("compactdefaultargs") Label;
		%feature("autodoc", "
Parameters
----------
aDF: TDF_Data
aTagList: TColStd_ListOfInteger
aLabel: TDF_Label
create: bool (optional, default to Standard_False)

Return
-------
None

Description
-----------
Returns the label expressed by <anEntry>; creates the label if it does not exist and if <create> is true.
") Label;
		static void Label(const opencascade::handle<TDF_Data> & aDF, const TColStd_ListOfInteger & aTagList, TDF_Label & aLabel, const Standard_Boolean create = Standard_False);

		/****** TDF_Tool::NbAttributes ******/
		/****** md5 signature: 0efcc2b4739048c06cdd577bafe92933 ******/
		%feature("compactdefaultargs") NbAttributes;
		%feature("autodoc", "
Parameters
----------
aLabel: TDF_Label

Return
-------
int

Description
-----------
Returns the total number of attributes attached to the labels dependent on the label aLabel. The attributes of aLabel are also included in this figure. This information is useful in setting the size of an array.
") NbAttributes;
		static Standard_Integer NbAttributes(const TDF_Label & aLabel);

		/****** TDF_Tool::NbAttributes ******/
		/****** md5 signature: bd5e4de86e2608e1e8cdc01d33796723 ******/
		%feature("compactdefaultargs") NbAttributes;
		%feature("autodoc", "
Parameters
----------
aLabel: TDF_Label
aFilter: TDF_IDFilter

Return
-------
int

Description
-----------
Returns the number of attributes of the tree, selected by a<Filter>, including those of <aLabel>.
") NbAttributes;
		static Standard_Integer NbAttributes(const TDF_Label & aLabel, const TDF_IDFilter & aFilter);

		/****** TDF_Tool::NbLabels ******/
		/****** md5 signature: e5e31f60b09a76eb273e83856a43787d ******/
		%feature("compactdefaultargs") NbLabels;
		%feature("autodoc", "
Parameters
----------
aLabel: TDF_Label

Return
-------
int

Description
-----------
Returns the number of labels of the tree, including <aLabel>. aLabel is also included in this figure. This information is useful in setting the size of an array.
") NbLabels;
		static Standard_Integer NbLabels(const TDF_Label & aLabel);

		/****** TDF_Tool::OutReferences ******/
		/****** md5 signature: 79be4b27ee58ab3a25c2b0bf6c158456 ******/
		%feature("compactdefaultargs") OutReferences;
		%feature("autodoc", "
Parameters
----------
aLabel: TDF_Label
atts: TDF_AttributeMap

Return
-------
None

Description
-----------
Returns in <atts> the referenced attributes. Caution: <atts> is not cleared before use!.
") OutReferences;
		static void OutReferences(const TDF_Label & aLabel, TDF_AttributeMap & atts);

		/****** TDF_Tool::OutReferences ******/
		/****** md5 signature: 16f5367a11932dbebdc9488dc199de94 ******/
		%feature("compactdefaultargs") OutReferences;
		%feature("autodoc", "
Parameters
----------
aLabel: TDF_Label
aFilterForReferers: TDF_IDFilter
aFilterForReferences: TDF_IDFilter
atts: TDF_AttributeMap

Return
-------
None

Description
-----------
Returns in <atts> the referenced attributes and kept by <aFilterForReferences>. It considers only the referrers kept by <aFilterForReferers>. Caution: <atts> is not cleared before use!.
") OutReferences;
		static void OutReferences(const TDF_Label & aLabel, const TDF_IDFilter & aFilterForReferers, const TDF_IDFilter & aFilterForReferences, TDF_AttributeMap & atts);

		/****** TDF_Tool::OutReferers ******/
		/****** md5 signature: 309feefb269cc909617dd0540f46f416 ******/
		%feature("compactdefaultargs") OutReferers;
		%feature("autodoc", "
Parameters
----------
theLabel: TDF_Label
theAtts: TDF_AttributeMap

Return
-------
None

Description
-----------
Returns in <theAtts> the attributes having out references. //! Caution: <theAtts> is not cleared before use!.
") OutReferers;
		static void OutReferers(const TDF_Label & theLabel, TDF_AttributeMap & theAtts);

		/****** TDF_Tool::OutReferers ******/
		/****** md5 signature: 219fec7089c087ee380bfd07f6ed1f30 ******/
		%feature("compactdefaultargs") OutReferers;
		%feature("autodoc", "
Parameters
----------
aLabel: TDF_Label
aFilterForReferers: TDF_IDFilter
aFilterForReferences: TDF_IDFilter
atts: TDF_AttributeMap

Return
-------
None

Description
-----------
Returns in <atts> the attributes having out references and kept by <aFilterForReferers>. It considers only the references kept by <aFilterForReferences>. Caution: <atts> is not cleared before use!.
") OutReferers;
		static void OutReferers(const TDF_Label & aLabel, const TDF_IDFilter & aFilterForReferers, const TDF_IDFilter & aFilterForReferences, TDF_AttributeMap & atts);

		/****** TDF_Tool::RelocateLabel ******/
		/****** md5 signature: a790ebba517221dfa8200224bae0d105 ******/
		%feature("compactdefaultargs") RelocateLabel;
		%feature("autodoc", "
Parameters
----------
aSourceLabel: TDF_Label
fromRoot: TDF_Label
toRoot: TDF_Label
aTargetLabel: TDF_Label
create: bool (optional, default to Standard_False)

Return
-------
None

Description
-----------
Returns the label having the same sub-entry as <aLabel> but located as descendant as <toRoot> instead of <fromRoot>. //! Example: //! aLabel = 0:3:24:7:2:7 fromRoot = 0:3:24 toRoot = 0:5 returned label = 0:5:7:2:7.
") RelocateLabel;
		static void RelocateLabel(const TDF_Label & aSourceLabel, const TDF_Label & fromRoot, const TDF_Label & toRoot, TDF_Label & aTargetLabel, const Standard_Boolean create = Standard_False);

		/****** TDF_Tool::TagList ******/
		/****** md5 signature: ae6c070a2430d04009301015bfb0ae16 ******/
		%feature("compactdefaultargs") TagList;
		%feature("autodoc", "
Parameters
----------
aLabel: TDF_Label
aTagList: TColStd_ListOfInteger

Return
-------
None

Description
-----------
Returns the entry of <aLabel> as list of integers in <aTagList>.
") TagList;
		static void TagList(const TDF_Label & aLabel, TColStd_ListOfInteger & aTagList);

		/****** TDF_Tool::TagList ******/
		/****** md5 signature: 7093f47c7c5cb37c8352971aa776e927 ******/
		%feature("compactdefaultargs") TagList;
		%feature("autodoc", "
Parameters
----------
anEntry: str
aTagList: TColStd_ListOfInteger

Return
-------
None

Description
-----------
Returns the entry expressed by <anEntry> as list of integers in <aTagList>.
") TagList;
		static void TagList(TCollection_AsciiString anEntry, TColStd_ListOfInteger & aTagList);

};


%extend TDF_Tool {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************
* class TDF_Transaction *
************************/
class TDF_Transaction {
	public:
		/****** TDF_Transaction::TDF_Transaction ******/
		/****** md5 signature: 25679619d6b41673c52ce6c41bcd1f82 ******/
		%feature("compactdefaultargs") TDF_Transaction;
		%feature("autodoc", "
Parameters
----------
aName: str (optional, default to "")

Return
-------
None

Description
-----------
Creates an empty transaction context, unable to be opened.
") TDF_Transaction;
		 TDF_Transaction(TCollection_AsciiString aName = "");

		/****** TDF_Transaction::TDF_Transaction ******/
		/****** md5 signature: 19cf46609d259426ac1948baa7d6a59d ******/
		%feature("compactdefaultargs") TDF_Transaction;
		%feature("autodoc", "
Parameters
----------
aDF: TDF_Data
aName: str (optional, default to "")

Return
-------
None

Description
-----------
Creates a transaction context on <aDF>, ready to be opened.
") TDF_Transaction;
		 TDF_Transaction(const opencascade::handle<TDF_Data> & aDF, TCollection_AsciiString aName = "");

		/****** TDF_Transaction::Abort ******/
		/****** md5 signature: 1fff85d2b99366704df7b68c63810e9a ******/
		%feature("compactdefaultargs") Abort;
		%feature("autodoc", "Return
-------
None

Description
-----------
Aborts the transactions until AND including the current opened one.
") Abort;
		void Abort();

		/****** TDF_Transaction::Commit ******/
		/****** md5 signature: 06a824bb56931167b77b19d90c6fc733 ******/
		%feature("compactdefaultargs") Commit;
		%feature("autodoc", "
Parameters
----------
withDelta: bool (optional, default to Standard_False)

Return
-------
opencascade::handle<TDF_Delta>

Description
-----------
Commits the transactions until AND including the current opened one.
") Commit;
		opencascade::handle<TDF_Delta> Commit(const Standard_Boolean withDelta = Standard_False);

		/****** TDF_Transaction::Data ******/
		/****** md5 signature: 04ec1a781153c5a50d2756cf01f47e1c ******/
		%feature("compactdefaultargs") Data;
		%feature("autodoc", "Return
-------
opencascade::handle<TDF_Data>

Description
-----------
Returns the Data from TDF.
") Data;
		opencascade::handle<TDF_Data> Data();


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
		/****** TDF_Transaction::Initialize ******/
		/****** md5 signature: 6f0c86dc4ece77377bc8538f444250f5 ******/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "
Parameters
----------
aDF: TDF_Data

Return
-------
None

Description
-----------
Aborts all the transactions on <myDF> and sets <aDF> to build a transaction context on <aDF>, ready to be opened.
") Initialize;
		void Initialize(const opencascade::handle<TDF_Data> & aDF);

		/****** TDF_Transaction::IsOpen ******/
		/****** md5 signature: bdd2e1a97b3f8d14fccdfc3ccf008748 ******/
		%feature("compactdefaultargs") IsOpen;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if the transaction is open.
") IsOpen;
		Standard_Boolean IsOpen();

		/****** TDF_Transaction::Name ******/
		/****** md5 signature: 8e64a3d42cb69d5f0c279aca58e35ec7 ******/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "Return
-------
TCollection_AsciiString

Description
-----------
Returns the transaction name.
") Name;
		const TCollection_AsciiString & Name();

		/****** TDF_Transaction::Open ******/
		/****** md5 signature: bd3c8ff39ee6d8b3e3af652b118bf3d7 ******/
		%feature("compactdefaultargs") Open;
		%feature("autodoc", "Return
-------
int

Description
-----------
If not yet done, opens a new transaction on <myDF>. Returns the index of the just opened transaction. //! It raises DomainError if the transaction is already open, and NullObject if there is no current Data framework.
") Open;
		Standard_Integer Open();

		/****** TDF_Transaction::Transaction ******/
		/****** md5 signature: 00c48137a99575bfa5cfadde8fb37954 ******/
		%feature("compactdefaultargs") Transaction;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of the transaction opened by <self>.
") Transaction;
		Standard_Integer Transaction();

};


%extend TDF_Transaction {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************
* class TDF_DeltaOnAddition *
****************************/
class TDF_DeltaOnAddition : public TDF_AttributeDelta {
	public:
		/****** TDF_DeltaOnAddition::TDF_DeltaOnAddition ******/
		/****** md5 signature: ed3da941e5f1deaad2db5d3a5727382f ******/
		%feature("compactdefaultargs") TDF_DeltaOnAddition;
		%feature("autodoc", "
Parameters
----------
anAtt: TDF_Attribute

Return
-------
None

Description
-----------
Creates a TDF_DeltaOnAddition.
") TDF_DeltaOnAddition;
		 TDF_DeltaOnAddition(const opencascade::handle<TDF_Attribute> & anAtt);

		/****** TDF_DeltaOnAddition::Apply ******/
		/****** md5 signature: c4ff9d381df7974c268b00280582cc3d ******/
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


%make_alias(TDF_DeltaOnAddition)

%extend TDF_DeltaOnAddition {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************
* class TDF_DeltaOnForget *
**************************/
class TDF_DeltaOnForget : public TDF_AttributeDelta {
	public:
		/****** TDF_DeltaOnForget::TDF_DeltaOnForget ******/
		/****** md5 signature: 10a024c61102a87e31a2cdebe20ea666 ******/
		%feature("compactdefaultargs") TDF_DeltaOnForget;
		%feature("autodoc", "
Parameters
----------
anAtt: TDF_Attribute

Return
-------
None

Description
-----------
Creates a TDF_DeltaOnForget.
") TDF_DeltaOnForget;
		 TDF_DeltaOnForget(const opencascade::handle<TDF_Attribute> & anAtt);

		/****** TDF_DeltaOnForget::Apply ******/
		/****** md5 signature: c4ff9d381df7974c268b00280582cc3d ******/
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


%make_alias(TDF_DeltaOnForget)

%extend TDF_DeltaOnForget {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************
* class TDF_DeltaOnModification *
********************************/
%nodefaultctor TDF_DeltaOnModification;
class TDF_DeltaOnModification : public TDF_AttributeDelta {
	public:
		/****** TDF_DeltaOnModification::Apply ******/
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


%make_alias(TDF_DeltaOnModification)

%extend TDF_DeltaOnModification {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************
* class TDF_DeltaOnRemoval *
***************************/
%nodefaultctor TDF_DeltaOnRemoval;
class TDF_DeltaOnRemoval : public TDF_AttributeDelta {
	public:
};


%make_alias(TDF_DeltaOnRemoval)

%extend TDF_DeltaOnRemoval {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************
* class TDF_DeltaOnResume *
**************************/
class TDF_DeltaOnResume : public TDF_AttributeDelta {
	public:
		/****** TDF_DeltaOnResume::TDF_DeltaOnResume ******/
		/****** md5 signature: f7315e98137f041699fc7f9813315d83 ******/
		%feature("compactdefaultargs") TDF_DeltaOnResume;
		%feature("autodoc", "
Parameters
----------
anAtt: TDF_Attribute

Return
-------
None

Description
-----------
Creates a TDF_DeltaOnResume.
") TDF_DeltaOnResume;
		 TDF_DeltaOnResume(const opencascade::handle<TDF_Attribute> & anAtt);

		/****** TDF_DeltaOnResume::Apply ******/
		/****** md5 signature: c4ff9d381df7974c268b00280582cc3d ******/
		%feature("compactdefaultargs") Apply;
		%feature("autodoc", "Return
-------
None

Description
-----------
Applies the delta to the attribute.
") Apply;
		void Apply();


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
};


%make_alias(TDF_DeltaOnResume)

%extend TDF_DeltaOnResume {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************
* class TDF_Reference *
**********************/
class TDF_Reference : public TDF_Attribute {
	public:
		/****** TDF_Reference::TDF_Reference ******/
		/****** md5 signature: f2ea02a93b4178fa1b70e2b58c4029a4 ******/
		%feature("compactdefaultargs") TDF_Reference;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") TDF_Reference;
		 TDF_Reference();

		/****** TDF_Reference::Dump ******/
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
		/****** TDF_Reference::Get ******/
		/****** md5 signature: 66afada8fc328e55fd3c204c359e42b2 ******/
		%feature("compactdefaultargs") Get;
		%feature("autodoc", "Return
-------
TDF_Label

Description
-----------
No available documentation.
") Get;
		TDF_Label Get();

		/****** TDF_Reference::GetID ******/
		/****** md5 signature: afe6002d90f641ca3ea8c9ae9f8fe97c ******/
		%feature("compactdefaultargs") GetID;
		%feature("autodoc", "Return
-------
Standard_GUID

Description
-----------
No available documentation.
") GetID;
		static const Standard_GUID & GetID();

		/****** TDF_Reference::ID ******/
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

		/****** TDF_Reference::NewEmpty ******/
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

		/****** TDF_Reference::Paste ******/
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

		/****** TDF_Reference::References ******/
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

		/****** TDF_Reference::Restore ******/
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

		/****** TDF_Reference::Set ******/
		/****** md5 signature: 3fd2cceb5586794d661dcbd7ea65fd0c ******/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "
Parameters
----------
I: TDF_Label
Origin: TDF_Label

Return
-------
opencascade::handle<TDF_Reference>

Description
-----------
No available documentation.
") Set;
		static opencascade::handle<TDF_Reference> Set(const TDF_Label & I, const TDF_Label & Origin);

		/****** TDF_Reference::Set ******/
		/****** md5 signature: adf0fe6d83d2160bac99ccd871d44289 ******/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "
Parameters
----------
Origin: TDF_Label

Return
-------
None

Description
-----------
No available documentation.
") Set;
		void Set(const TDF_Label & Origin);

};


%make_alias(TDF_Reference)

%extend TDF_Reference {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************
* class TDF_TagSource *
**********************/
class TDF_TagSource : public TDF_Attribute {
	public:
		/****** TDF_TagSource::TDF_TagSource ******/
		/****** md5 signature: 4671bac7141bd20608dd9aa1837a3ee5 ******/
		%feature("compactdefaultargs") TDF_TagSource;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") TDF_TagSource;
		 TDF_TagSource();


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
		/****** TDF_TagSource::Get ******/
		/****** md5 signature: ace457d697a3a35733c5ac95429cad31 ******/
		%feature("compactdefaultargs") Get;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") Get;
		Standard_Integer Get();

		/****** TDF_TagSource::GetID ******/
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

		/****** TDF_TagSource::ID ******/
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

		/****** TDF_TagSource::NewChild ******/
		/****** md5 signature: d122646bf4b49eeeeafcc33503696e8b ******/
		%feature("compactdefaultargs") NewChild;
		%feature("autodoc", "
Parameters
----------
L: TDF_Label

Return
-------
TDF_Label

Description
-----------
Find (or create) a tagSource attribute located at <L> and make a new child label. TagSource methods =================.
") NewChild;
		static TDF_Label NewChild(const TDF_Label & L);

		/****** TDF_TagSource::NewChild ******/
		/****** md5 signature: 9a3266175cf9e46eeaa91114b72614e8 ******/
		%feature("compactdefaultargs") NewChild;
		%feature("autodoc", "Return
-------
TDF_Label

Description
-----------
No available documentation.
") NewChild;
		TDF_Label NewChild();

		/****** TDF_TagSource::NewEmpty ******/
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

		/****** TDF_TagSource::NewTag ******/
		/****** md5 signature: d8f8843e8761eb919b6b2894481280d3 ******/
		%feature("compactdefaultargs") NewTag;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NewTag;
		Standard_Integer NewTag();

		/****** TDF_TagSource::Paste ******/
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

		/****** TDF_TagSource::Restore ******/
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

		/****** TDF_TagSource::Set ******/
		/****** md5 signature: 4a22c1159f9e7fb5d847d5e3a74771b3 ******/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "
Parameters
----------
label: TDF_Label

Return
-------
opencascade::handle<TDF_TagSource>

Description
-----------
Find, or create, a TagSource attribute. the TagSource attribute is returned.
") Set;
		static opencascade::handle<TDF_TagSource> Set(const TDF_Label & label);

		/****** TDF_TagSource::Set ******/
		/****** md5 signature: af44522e43780b1b24ce7e4ac49d204f ******/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "
Parameters
----------
T: int

Return
-------
None

Description
-----------
TDF_Attribute methods =====================.
") Set;
		void Set(const Standard_Integer T);

};


%make_alias(TDF_TagSource)

%extend TDF_TagSource {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************************
* class TDF_DefaultDeltaOnModification *
***************************************/
class TDF_DefaultDeltaOnModification : public TDF_DeltaOnModification {
	public:
		/****** TDF_DefaultDeltaOnModification::TDF_DefaultDeltaOnModification ******/
		/****** md5 signature: d3877c39eb02e828d91f16605ef8e6ef ******/
		%feature("compactdefaultargs") TDF_DefaultDeltaOnModification;
		%feature("autodoc", "
Parameters
----------
anAttribute: TDF_Attribute

Return
-------
None

Description
-----------
Creates a TDF_DefaultDeltaOnModification. <anAttribute> must be the backup copy.
") TDF_DefaultDeltaOnModification;
		 TDF_DefaultDeltaOnModification(const opencascade::handle<TDF_Attribute> & anAttribute);

		/****** TDF_DefaultDeltaOnModification::Apply ******/
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


%make_alias(TDF_DefaultDeltaOnModification)

%extend TDF_DefaultDeltaOnModification {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************************
* class TDF_DefaultDeltaOnRemoval *
**********************************/
class TDF_DefaultDeltaOnRemoval : public TDF_DeltaOnRemoval {
	public:
		/****** TDF_DefaultDeltaOnRemoval::TDF_DefaultDeltaOnRemoval ******/
		/****** md5 signature: 7f65748b1a1d984527107b28b6df55a4 ******/
		%feature("compactdefaultargs") TDF_DefaultDeltaOnRemoval;
		%feature("autodoc", "
Parameters
----------
anAttribute: TDF_Attribute

Return
-------
None

Description
-----------
Creates a TDF_DefaultDeltaOnRemoval.
") TDF_DefaultDeltaOnRemoval;
		 TDF_DefaultDeltaOnRemoval(const opencascade::handle<TDF_Attribute> & anAttribute);

		/****** TDF_DefaultDeltaOnRemoval::Apply ******/
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


%make_alias(TDF_DefaultDeltaOnRemoval)

%extend TDF_DefaultDeltaOnRemoval {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/* python proxy for excluded classes */
%pythoncode {
@classnotwrapped
class TDF_LabelNode:
	pass

@classnotwrapped
class TDF_DerivedAttribute:
	pass

}
/* end python proxy for excluded classes */
/* harray1 classes */

class TDF_HAttributeArray1 : public TDF_AttributeArray1, public Standard_Transient {
  public:
    TDF_HAttributeArray1(const Standard_Integer theLower, const Standard_Integer theUpper);
    TDF_HAttributeArray1(const Standard_Integer theLower, const Standard_Integer theUpper, const TDF_AttributeArray1::value_type& theValue);
    TDF_HAttributeArray1(const TDF_AttributeArray1& theOther);
    const TDF_AttributeArray1& Array1();
    TDF_AttributeArray1& ChangeArray1();
};
%make_alias(TDF_HAttributeArray1)

/* harray2 classes */
/* hsequence classes */
/* class aliases */
%pythoncode {
}
/* deprecated methods */
%pythoncode {
@deprecated
def tdf_AddLinkGUIDToProgID(*args):
	return tdf.AddLinkGUIDToProgID(*args)

@deprecated
def tdf_GUIDFromProgID(*args):
	return tdf.GUIDFromProgID(*args)

@deprecated
def tdf_LowestID(*args):
	return tdf.LowestID(*args)

@deprecated
def tdf_ProgIDFromGUID(*args):
	return tdf.ProgIDFromGUID(*args)

@deprecated
def tdf_UppestID(*args):
	return tdf.UppestID(*args)

@deprecated
def TDF_ClosureTool_Closure(*args):
	return TDF_ClosureTool.Closure(*args)

@deprecated
def TDF_ClosureTool_Closure(*args):
	return TDF_ClosureTool.Closure(*args)

@deprecated
def TDF_ClosureTool_Closure(*args):
	return TDF_ClosureTool.Closure(*args)

@deprecated
def TDF_ComparisonTool_Compare(*args):
	return TDF_ComparisonTool.Compare(*args)

@deprecated
def TDF_ComparisonTool_Cut(*args):
	return TDF_ComparisonTool.Cut(*args)

@deprecated
def TDF_ComparisonTool_IsSelfContained(*args):
	return TDF_ComparisonTool.IsSelfContained(*args)

@deprecated
def TDF_ComparisonTool_SourceUnbound(*args):
	return TDF_ComparisonTool.SourceUnbound(*args)

@deprecated
def TDF_ComparisonTool_TargetUnbound(*args):
	return TDF_ComparisonTool.TargetUnbound(*args)

@deprecated
def TDF_CopyLabel_ExternalReferences(*args):
	return TDF_CopyLabel.ExternalReferences(*args)

@deprecated
def TDF_CopyLabel_ExternalReferences(*args):
	return TDF_CopyLabel.ExternalReferences(*args)

@deprecated
def TDF_CopyTool_Copy(*args):
	return TDF_CopyTool.Copy(*args)

@deprecated
def TDF_CopyTool_Copy(*args):
	return TDF_CopyTool.Copy(*args)

@deprecated
def TDF_CopyTool_Copy(*args):
	return TDF_CopyTool.Copy(*args)

@deprecated
def TDF_Tool_CountLabels(*args):
	return TDF_Tool.CountLabels(*args)

@deprecated
def TDF_Tool_DeductLabels(*args):
	return TDF_Tool.DeductLabels(*args)

@deprecated
def TDF_Tool_DeepDump(*args):
	return TDF_Tool.DeepDump(*args)

@deprecated
def TDF_Tool_DeepDump(*args):
	return TDF_Tool.DeepDump(*args)

@deprecated
def TDF_Tool_Entry(*args):
	return TDF_Tool.Entry(*args)

@deprecated
def TDF_Tool_ExtendedDeepDump(*args):
	return TDF_Tool.ExtendedDeepDump(*args)

@deprecated
def TDF_Tool_ExtendedDeepDump(*args):
	return TDF_Tool.ExtendedDeepDump(*args)

@deprecated
def TDF_Tool_IsSelfContained(*args):
	return TDF_Tool.IsSelfContained(*args)

@deprecated
def TDF_Tool_IsSelfContained(*args):
	return TDF_Tool.IsSelfContained(*args)

@deprecated
def TDF_Tool_Label(*args):
	return TDF_Tool.Label(*args)

@deprecated
def TDF_Tool_Label(*args):
	return TDF_Tool.Label(*args)

@deprecated
def TDF_Tool_Label(*args):
	return TDF_Tool.Label(*args)

@deprecated
def TDF_Tool_NbAttributes(*args):
	return TDF_Tool.NbAttributes(*args)

@deprecated
def TDF_Tool_NbAttributes(*args):
	return TDF_Tool.NbAttributes(*args)

@deprecated
def TDF_Tool_NbLabels(*args):
	return TDF_Tool.NbLabels(*args)

@deprecated
def TDF_Tool_OutReferences(*args):
	return TDF_Tool.OutReferences(*args)

@deprecated
def TDF_Tool_OutReferences(*args):
	return TDF_Tool.OutReferences(*args)

@deprecated
def TDF_Tool_OutReferers(*args):
	return TDF_Tool.OutReferers(*args)

@deprecated
def TDF_Tool_OutReferers(*args):
	return TDF_Tool.OutReferers(*args)

@deprecated
def TDF_Tool_RelocateLabel(*args):
	return TDF_Tool.RelocateLabel(*args)

@deprecated
def TDF_Tool_TagList(*args):
	return TDF_Tool.TagList(*args)

@deprecated
def TDF_Tool_TagList(*args):
	return TDF_Tool.TagList(*args)

@deprecated
def TDF_Reference_GetID(*args):
	return TDF_Reference.GetID(*args)

@deprecated
def TDF_Reference_Set(*args):
	return TDF_Reference.Set(*args)

@deprecated
def TDF_TagSource_GetID(*args):
	return TDF_TagSource.GetID(*args)

@deprecated
def TDF_TagSource_NewChild(*args):
	return TDF_TagSource.NewChild(*args)

@deprecated
def TDF_TagSource_Set(*args):
	return TDF_TagSource.Set(*args)

}
