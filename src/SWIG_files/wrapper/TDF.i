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
%define TDFDOCSTRING
"TDF module, see official documentation at
https://www.opencascade.com/doc/occt-7.4.0/refman/html/package_tdf.html"
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
%include ../common/Operators.i
%include ../common/OccHandle.i


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

/* python proy classes for enums */
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

%extend NCollection_Array1<opencascade::handle<TDF_Attribute>> {
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
%template(TDF_AttributeDataMap) NCollection_DataMap<opencascade::handle<TDF_Attribute>,opencascade::handle<TDF_Attribute>,TColStd_MapTransientHasher>;
%template(TDF_AttributeDeltaList) NCollection_List<opencascade::handle<TDF_AttributeDelta>>;

%extend NCollection_List<opencascade::handle<TDF_AttributeDelta>> {
    %pythoncode {
    def __len__(self):
        return self.Size()
    }
};
%template(TDF_AttributeDoubleMap) NCollection_DoubleMap<opencascade::handle<TDF_Attribute>,opencascade::handle<TDF_Attribute>,TColStd_MapTransientHasher,TColStd_MapTransientHasher>;
%template(TDF_AttributeIndexedMap) NCollection_IndexedMap<opencascade::handle<TDF_Attribute>,TColStd_MapTransientHasher>;
%template(TDF_AttributeList) NCollection_List<opencascade::handle<TDF_Attribute>>;

%extend NCollection_List<opencascade::handle<TDF_Attribute>> {
    %pythoncode {
    def __len__(self):
        return self.Size()
    }
};
%template(TDF_AttributeMap) NCollection_Map<opencascade::handle<TDF_Attribute>,TColStd_MapTransientHasher>;
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
    }
};
%template(TDF_GUIDProgIDMap) NCollection_DoubleMap<Standard_GUID,TCollection_ExtendedString,Standard_GUID,TCollection_ExtendedString>;
%template(TDF_HAllocator) opencascade::handle<NCollection_BaseAllocator>;
%template(TDF_IDList) NCollection_List<Standard_GUID>;

%extend NCollection_List<Standard_GUID> {
    %pythoncode {
    def __len__(self):
        return self.Size()
    }
};
%template(TDF_IDMap) NCollection_Map<Standard_GUID,Standard_GUID>;
%template(TDF_LabelDataMap) NCollection_DataMap<TDF_Label,TDF_Label,TDF_LabelMapHasher>;
%template(TDF_LabelDoubleMap) NCollection_DoubleMap<TDF_Label,TDF_Label,TDF_LabelMapHasher,TDF_LabelMapHasher>;
%template(TDF_LabelIndexedMap) NCollection_IndexedMap<TDF_Label,TDF_LabelMapHasher>;
%template(TDF_LabelIntegerMap) NCollection_DataMap<TDF_Label,Standard_Integer,TDF_LabelMapHasher>;
%template(TDF_LabelList) NCollection_List<TDF_Label>;

%extend NCollection_List<TDF_Label> {
    %pythoncode {
    def __len__(self):
        return self.Size()
    }
};
%template(TDF_LabelMap) NCollection_Map<TDF_Label,TDF_LabelMapHasher>;
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
typedef NCollection_DataMap<opencascade::handle<TDF_Attribute>, opencascade::handle<TDF_Attribute>, TColStd_MapTransientHasher> TDF_AttributeDataMap;
typedef NCollection_List<opencascade::handle<TDF_AttributeDelta>> TDF_AttributeDeltaList;
typedef NCollection_DoubleMap<opencascade::handle<TDF_Attribute>, opencascade::handle<TDF_Attribute>, TColStd_MapTransientHasher, TColStd_MapTransientHasher> TDF_AttributeDoubleMap;
typedef NCollection_IndexedMap<opencascade::handle<TDF_Attribute>, TColStd_MapTransientHasher> TDF_AttributeIndexedMap;
typedef NCollection_List<opencascade::handle<TDF_Attribute>> TDF_AttributeList;
typedef NCollection_Map<opencascade::handle<TDF_Attribute>, TColStd_MapTransientHasher> TDF_AttributeMap;
typedef NCollection_Sequence<opencascade::handle<TDF_Attribute>> TDF_AttributeSequence;
typedef NCollection_DataMap<opencascade::handle<TDF_Attribute>, opencascade::handle<TDF_Attribute>, TColStd_MapTransientHasher>::Iterator TDF_DataMapIteratorOfAttributeDataMap;
typedef NCollection_DataMap<TDF_Label, TDF_Label, TDF_LabelMapHasher>::Iterator TDF_DataMapIteratorOfLabelDataMap;
typedef NCollection_DataMap<TDF_Label, Standard_Integer, TDF_LabelMapHasher>::Iterator TDF_DataMapIteratorOfLabelIntegerMap;
typedef NCollection_List<opencascade::handle<TDF_Delta>> TDF_DeltaList;
typedef NCollection_DoubleMap<opencascade::handle<TDF_Attribute>, opencascade::handle<TDF_Attribute>, TColStd_MapTransientHasher, TColStd_MapTransientHasher>::Iterator TDF_DoubleMapIteratorOfAttributeDoubleMap;
typedef NCollection_DoubleMap<Standard_GUID, TCollection_ExtendedString, Standard_GUID, TCollection_ExtendedString>::Iterator TDF_DoubleMapIteratorOfGUIDProgIDMap;
typedef NCollection_DoubleMap<TDF_Label, TDF_Label, TDF_LabelMapHasher, TDF_LabelMapHasher>::Iterator TDF_DoubleMapIteratorOfLabelDoubleMap;
typedef NCollection_DoubleMap<Standard_GUID, TCollection_ExtendedString, Standard_GUID, TCollection_ExtendedString> TDF_GUIDProgIDMap;
typedef opencascade::handle<NCollection_BaseAllocator> TDF_HAllocator;
typedef NCollection_List<Standard_GUID> TDF_IDList;
typedef NCollection_Map<Standard_GUID, Standard_GUID> TDF_IDMap;
typedef NCollection_DataMap<TDF_Label, TDF_Label, TDF_LabelMapHasher> TDF_LabelDataMap;
typedef NCollection_DoubleMap<TDF_Label, TDF_Label, TDF_LabelMapHasher, TDF_LabelMapHasher> TDF_LabelDoubleMap;
typedef NCollection_IndexedMap<TDF_Label, TDF_LabelMapHasher> TDF_LabelIndexedMap;
typedef NCollection_DataMap<TDF_Label, Standard_Integer, TDF_LabelMapHasher> TDF_LabelIntegerMap;
typedef NCollection_List<TDF_Label> TDF_LabelList;
typedef NCollection_Map<TDF_Label, TDF_LabelMapHasher> TDF_LabelMap;
typedef TDF_LabelNode * TDF_LabelNodePtr;
typedef NCollection_Sequence<TDF_Label> TDF_LabelSequence;
typedef NCollection_List<opencascade::handle<TDF_AttributeDelta>>::Iterator TDF_ListIteratorOfAttributeDeltaList;
typedef NCollection_List<opencascade::handle<TDF_Attribute>>::Iterator TDF_ListIteratorOfAttributeList;
typedef NCollection_List<opencascade::handle<TDF_Delta>>::Iterator TDF_ListIteratorOfDeltaList;
typedef NCollection_List<Standard_GUID>::Iterator TDF_ListIteratorOfIDList;
typedef NCollection_List<TDF_Label>::Iterator TDF_ListIteratorOfLabelList;
typedef NCollection_Map<opencascade::handle<TDF_Attribute>, TColStd_MapTransientHasher>::Iterator TDF_MapIteratorOfAttributeMap;
typedef NCollection_Map<Standard_GUID, Standard_GUID>::Iterator TDF_MapIteratorOfIDMap;
typedef NCollection_Map<TDF_Label, TDF_LabelMapHasher>::Iterator TDF_MapIteratorOfLabelMap;
/* end typedefs declaration */

/************
* class TDF *
************/
%rename(tdf) TDF;
class TDF {
	public:
		/****************** AddLinkGUIDToProgID ******************/
		/**** md5 signature: 0272b20d2cd451fe5526231462daa07c ****/
		%feature("compactdefaultargs") AddLinkGUIDToProgID;
		%feature("autodoc", "Sets link between guid and progid in hidden datamap.

Parameters
----------
ID: Standard_GUID
ProgID: TCollection_ExtendedString

Returns
-------
None
") AddLinkGUIDToProgID;
		static void AddLinkGUIDToProgID(const Standard_GUID & ID, const TCollection_ExtendedString & ProgID);

		/****************** GUIDFromProgID ******************/
		/**** md5 signature: 1569c70b0eaddf0abaa25d243a344b0b ****/
		%feature("compactdefaultargs") GUIDFromProgID;
		%feature("autodoc", "Returns true if there is guid for given <progid> then guid is returned in <id>.

Parameters
----------
ProgID: TCollection_ExtendedString
ID: Standard_GUID

Returns
-------
bool
") GUIDFromProgID;
		static Standard_Boolean GUIDFromProgID(const TCollection_ExtendedString & ProgID, Standard_GUID & ID);

		/****************** LowestID ******************/
		/**** md5 signature: 5ffb42eb955c726f6468aa77a30aa62f ****/
		%feature("compactdefaultargs") LowestID;
		%feature("autodoc", "Returns id '00000000-0000-0000-0000-000000000000', sometimes used as null id.

Returns
-------
Standard_GUID
") LowestID;
		static const Standard_GUID & LowestID();

		/****************** ProgIDFromGUID ******************/
		/**** md5 signature: 7cbf0ed675ca10e717c4cdfc44e28f61 ****/
		%feature("compactdefaultargs") ProgIDFromGUID;
		%feature("autodoc", "Returns true if there is progid for given <id> then progid is returned in <progid>.

Parameters
----------
ID: Standard_GUID
ProgID: TCollection_ExtendedString

Returns
-------
bool
") ProgIDFromGUID;
		static Standard_Boolean ProgIDFromGUID(const Standard_GUID & ID, TCollection_ExtendedString & ProgID);

		/****************** UppestID ******************/
		/**** md5 signature: 04cc991fc12e7ed257b962b971383d4f ****/
		%feature("compactdefaultargs") UppestID;
		%feature("autodoc", "Returns id 'ffffffff-ffff-ffff-ffff-ffffffffffff'.

Returns
-------
Standard_GUID
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
		/****************** AddAttribute ******************/
		/**** md5 signature: 1fdc6ab8a5101cf8823a8d9a5f4e7c5b ****/
		%feature("compactdefaultargs") AddAttribute;
		%feature("autodoc", "Adds an attribute <other> to the label of <self>.raises if there is already one of the same guid fhan <other>.

Parameters
----------
other: TDF_Attribute

Returns
-------
None
") AddAttribute;
		void AddAttribute(const opencascade::handle<TDF_Attribute> & other);

		/****************** AfterAddition ******************/
		/**** md5 signature: 1645aac89ec94a8d059955cc4815f0f5 ****/
		%feature("compactdefaultargs") AfterAddition;
		%feature("autodoc", "Something to do after adding an attribute to a label.

Returns
-------
None
") AfterAddition;
		virtual void AfterAddition();

		/****************** AfterResume ******************/
		/**** md5 signature: f00ae5bce42a3fa5263b6007e46f5052 ****/
		%feature("compactdefaultargs") AfterResume;
		%feature("autodoc", "Something to do after resuming an attribute from a label.

Returns
-------
None
") AfterResume;
		virtual void AfterResume();

		/****************** AfterRetrieval ******************/
		/**** md5 signature: 4debcf9082f6b48fd06bcc4dab666f70 ****/
		%feature("compactdefaultargs") AfterRetrieval;
		%feature("autodoc", "Something to do after creation of an attribute by persistent-transient translation. the returned status says if afterundo has been performed (true) or if this callback must be called once again further (false). if <forceit> is set to true, the method must perform and return true. does nothing by default and returns true.

Parameters
----------
forceIt: bool,optional
	default value is Standard_False

Returns
-------
bool
") AfterRetrieval;
		virtual Standard_Boolean AfterRetrieval(const Standard_Boolean forceIt = Standard_False);

		/****************** AfterUndo ******************/
		/**** md5 signature: c8d35957430b5f1e2958a59b03021b1b ****/
		%feature("compactdefaultargs") AfterUndo;
		%feature("autodoc", "Something to do after applying <anattdelta>. the returned status says if afterundo has been performed (true) or if this callback must be called once again further (false). if <forceit> is set to true, the method must perform and return true. does nothing by default and returns true.

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

		/****************** Backup ******************/
		/**** md5 signature: 736c62c33bb523385e9d1ec148b89b66 ****/
		%feature("compactdefaultargs") Backup;
		%feature("autodoc", "Backups the attribute. the backuped attribute is flagged 'backuped' and not 'valid'. //! the method does nothing: //! 1) if the attribute transaction number is equal to the current transaction number (the attribute has already been backuped). //! 2) if the attribute is not attached to a label.

Returns
-------
None
") Backup;
		void Backup();

		/****************** BackupCopy ******************/
		/**** md5 signature: a825434844622adc42ebf4f3748fb2f9 ****/
		%feature("compactdefaultargs") BackupCopy;
		%feature("autodoc", "Copies the attribute contents into a new other attribute. it is used by backup().

Returns
-------
opencascade::handle<TDF_Attribute>
") BackupCopy;
		virtual opencascade::handle<TDF_Attribute> BackupCopy();

		/****************** BeforeCommitTransaction ******************/
		/**** md5 signature: 8c53cd571a56f101acdb4f2ca48dde3f ****/
		%feature("compactdefaultargs") BeforeCommitTransaction;
		%feature("autodoc", "A callback. by default does nothing. it is called by tdf_data::committransaction() method.

Returns
-------
None
") BeforeCommitTransaction;
		virtual void BeforeCommitTransaction();

		/****************** BeforeForget ******************/
		/**** md5 signature: 5a56b9b29072adf41610c87453870f25 ****/
		%feature("compactdefaultargs") BeforeForget;
		%feature("autodoc", "Something to do before forgetting an attribute to a label.

Returns
-------
None
") BeforeForget;
		virtual void BeforeForget();

		/****************** BeforeRemoval ******************/
		/**** md5 signature: de0b344315ad5f67d73191a6700380a8 ****/
		%feature("compactdefaultargs") BeforeRemoval;
		%feature("autodoc", "Something to do before removing an attribute from a label.

Returns
-------
None
") BeforeRemoval;
		virtual void BeforeRemoval();

		/****************** BeforeUndo ******************/
		/**** md5 signature: df655d5e3c897f61d7e3b6efa962017f ****/
		%feature("compactdefaultargs") BeforeUndo;
		%feature("autodoc", "Something to do before applying <anattdelta>. the returned status says if afterundo has been performed (true) or if this callback must be called once again further (false). if <forceit> is set to true, the method must perform and return true. does nothing by default and returns true.

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

		/****************** DeltaOnAddition ******************/
		/**** md5 signature: 8c975b212ebc48f37a9efe28370bd0fb ****/
		%feature("compactdefaultargs") DeltaOnAddition;
		%feature("autodoc", "Makes an attributedelta because <self> appeared. the only known use of a redefinition of this method is to return a null handle (no delta).

Returns
-------
opencascade::handle<TDF_DeltaOnAddition>
") DeltaOnAddition;
		virtual opencascade::handle<TDF_DeltaOnAddition> DeltaOnAddition();

		/****************** DeltaOnForget ******************/
		/**** md5 signature: d96dd3ee6835e5170c35c537480a2be3 ****/
		%feature("compactdefaultargs") DeltaOnForget;
		%feature("autodoc", "Makes an attributedelta because <self> has been forgotten.

Returns
-------
opencascade::handle<TDF_DeltaOnForget>
") DeltaOnForget;
		virtual opencascade::handle<TDF_DeltaOnForget> DeltaOnForget();

		/****************** DeltaOnModification ******************/
		/**** md5 signature: 905cd7ad9413bd95c77621bc5fede4a5 ****/
		%feature("compactdefaultargs") DeltaOnModification;
		%feature("autodoc", "Makes a deltaonmodification between <self> and <anoldattribute.

Parameters
----------
anOldAttribute: TDF_Attribute

Returns
-------
opencascade::handle<TDF_DeltaOnModification>
") DeltaOnModification;
		virtual opencascade::handle<TDF_DeltaOnModification> DeltaOnModification(const opencascade::handle<TDF_Attribute> & anOldAttribute);

		/****************** DeltaOnModification ******************/
		/**** md5 signature: f83d91fb563526db971678d8ae190037 ****/
		%feature("compactdefaultargs") DeltaOnModification;
		%feature("autodoc", "Applies a deltaonmodification to <self>.

Parameters
----------
aDelta: TDF_DeltaOnModification

Returns
-------
None
") DeltaOnModification;
		virtual void DeltaOnModification(const opencascade::handle<TDF_DeltaOnModification> & aDelta);

		/****************** DeltaOnRemoval ******************/
		/**** md5 signature: 4ae44c5d4a825e10d125eb7f75a9bb28 ****/
		%feature("compactdefaultargs") DeltaOnRemoval;
		%feature("autodoc", "Makes a deltaonremoval on <self> because <self> has disappeared from the ds.

Returns
-------
opencascade::handle<TDF_DeltaOnRemoval>
") DeltaOnRemoval;
		virtual opencascade::handle<TDF_DeltaOnRemoval> DeltaOnRemoval();

		/****************** DeltaOnResume ******************/
		/**** md5 signature: bc74ada443cb09bb7350a3e27b5cd98b ****/
		%feature("compactdefaultargs") DeltaOnResume;
		%feature("autodoc", "Makes an attributedelta because <self> has been resumed.

Returns
-------
opencascade::handle<TDF_DeltaOnResume>
") DeltaOnResume;
		virtual opencascade::handle<TDF_DeltaOnResume> DeltaOnResume();


        %feature("autodoc", "1");
        %extend{
            std::string DumpToString() {
            std::stringstream s;
            self->Dump(s);
            return s.str();}
        };
		/****************** FindAttribute ******************/
		/**** md5 signature: 5f4fd12b74a27c4216127d1ce8d3b78a ****/
		%feature("compactdefaultargs") FindAttribute;
		%feature("autodoc", "Finds an associated attribute of <self>, according to <anid>. the returned <anattribute> is a valid one. the method returns true if found, false otherwise. a removed attribute cannot be found using this method.

Parameters
----------
anID: Standard_GUID
anAttribute: TDF_Attribute

Returns
-------
bool
") FindAttribute;
		Standard_Boolean FindAttribute(const Standard_GUID & anID, opencascade::handle<TDF_Attribute> & anAttribute);

		/****************** Forget ******************/
		/**** md5 signature: 4cd1ae10a7466d24f596008f797ce204 ****/
		%feature("compactdefaultargs") Forget;
		%feature("autodoc", "Forgets the attribute. <atransaction> is the current transaction in which the forget is done. a forgotten attribute is also flagged not 'valid'. //! a forgotten attribute is invisible. set also the 'valid' status to false. obvioulsy, df cannot empty an attribute (this has a semantic signification), but can remove it from the structure. so, a forgotten attribute is not an empty one, but a soon dead one. //! should be private.

Parameters
----------
aTransaction: int

Returns
-------
None
") Forget;
		void Forget(const Standard_Integer aTransaction);

		/****************** ForgetAllAttributes ******************/
		/**** md5 signature: f0492f70679f693e73f3cd351b602cd9 ****/
		%feature("compactdefaultargs") ForgetAllAttributes;
		%feature("autodoc", "Forgets all the attributes attached to the label of <self>. does it on the sub-labels if <clearchildren> is set to true. of course, this method is compatible with transaction & delta mecanisms. be carefull that if <self> will have a null label after this call.

Parameters
----------
clearChildren: bool,optional
	default value is Standard_True

Returns
-------
None
") ForgetAllAttributes;
		void ForgetAllAttributes(const Standard_Boolean clearChildren = Standard_True);

		/****************** ForgetAttribute ******************/
		/**** md5 signature: 52de4f1eac4c1d719dc2240e16600cdd ****/
		%feature("compactdefaultargs") ForgetAttribute;
		%feature("autodoc", "Forgets the attribute of guid <aguid> associated to the label of <self>. be carefull that if <self> is the attribute of <guid>, <self> will have a null label after this call. if the attribute doesn't exist returns false. otherwise returns true.

Parameters
----------
aguid: Standard_GUID

Returns
-------
bool
") ForgetAttribute;
		Standard_Boolean ForgetAttribute(const Standard_GUID & aguid);

		/****************** ID ******************/
		/**** md5 signature: e94b659c9e9f7b7f43797fc28e2b97f9 ****/
		%feature("compactdefaultargs") ID;
		%feature("autodoc", "Returns the id of the attribute.

Returns
-------
Standard_GUID
") ID;
		virtual const Standard_GUID & ID();

		/****************** IsAttribute ******************/
		/**** md5 signature: d4c3cd3354e07d22381503542a5e16aa ****/
		%feature("compactdefaultargs") IsAttribute;
		%feature("autodoc", "Returns true if it exists an associated attribute of <self> with <anid> as id.

Parameters
----------
anID: Standard_GUID

Returns
-------
bool
") IsAttribute;
		Standard_Boolean IsAttribute(const Standard_GUID & anID);

		/****************** IsBackuped ******************/
		/**** md5 signature: 6520047807c75e85fd4e66863b743e07 ****/
		%feature("compactdefaultargs") IsBackuped;
		%feature("autodoc", "Returns true if the attribute backup status is set. this status is set/unset by the backup() method.

Returns
-------
bool
") IsBackuped;
		Standard_Boolean IsBackuped();

		/****************** IsForgotten ******************/
		/**** md5 signature: a5b3d005a1cc88a7413291be6b3657cc ****/
		%feature("compactdefaultargs") IsForgotten;
		%feature("autodoc", "Returns true if the attribute forgotten status is set. //! shortcut methods concerning associated attributes =================================================.

Returns
-------
bool
") IsForgotten;
		Standard_Boolean IsForgotten();

		/****************** IsNew ******************/
		/**** md5 signature: 3a3a8bc6ebd2fc2c25f224ff9e99af70 ****/
		%feature("compactdefaultargs") IsNew;
		%feature("autodoc", "Returns true if the attribute has no backup.

Returns
-------
bool
") IsNew;
		Standard_Boolean IsNew();

		/****************** IsValid ******************/
		/**** md5 signature: 2809e700423e4fe6ecd395953f3a2406 ****/
		%feature("compactdefaultargs") IsValid;
		%feature("autodoc", "Returns true if the attribute is valid; i.e. not a backuped or removed one.

Returns
-------
bool
") IsValid;
		Standard_Boolean IsValid();

		/****************** Label ******************/
		/**** md5 signature: 9d94a52a35e852ea5e053d340a2888ee ****/
		%feature("compactdefaultargs") Label;
		%feature("autodoc", "Returns the label to which the attribute is attached. if the label is not included in a df, the label is null. see label. warning if the label is not included in a data framework, it is null. this function should not be redefined inline.

Returns
-------
TDF_Label
") Label;
		const TDF_Label Label();

		/****************** NewEmpty ******************/
		/**** md5 signature: 537251aec6cd2736ac1f1abe6868dc70 ****/
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "Returns an new empty attribute from the good end type. it is used by the copy algorithm.

Returns
-------
opencascade::handle<TDF_Attribute>
") NewEmpty;
		virtual opencascade::handle<TDF_Attribute> NewEmpty();

		/****************** Paste ******************/
		/**** md5 signature: 45ecccc1eb738661a41ddb54d6956178 ****/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "This method is different from the 'copy' one, because it is used when copying an attribute from a source structure into a target structure. this method may paste the contents of <self> into <intoattribute>. //! the given pasted attribute can be full or empty of its contents. but don't make a new! just set the contents! //! it is possible to use <arelocationtable> to get/set the relocation value of a source attribute.

Parameters
----------
intoAttribute: TDF_Attribute
aRelocationTable: TDF_RelocationTable

Returns
-------
None
") Paste;
		virtual void Paste(const opencascade::handle<TDF_Attribute> & intoAttribute, const opencascade::handle<TDF_RelocationTable> & aRelocationTable);

		/****************** References ******************/
		/**** md5 signature: 386560cda18cda911ef8050b14958516 ****/
		%feature("compactdefaultargs") References;
		%feature("autodoc", "Adds the first level referenced attributes and labels to <adataset>. //! for this, use the addlabel or addattribute of dataset. //! if there is none, do not implement the method.

Parameters
----------
aDataSet: TDF_DataSet

Returns
-------
None
") References;
		virtual void References(const opencascade::handle<TDF_DataSet> & aDataSet);

		/****************** Restore ******************/
		/**** md5 signature: 58d5068efa194f15ff1b2e100f124c41 ****/
		%feature("compactdefaultargs") Restore;
		%feature("autodoc", "Restores the backuped contents from <anattribute> into this one. it is used when aborting a transaction.

Parameters
----------
anAttribute: TDF_Attribute

Returns
-------
None
") Restore;
		virtual void Restore(const opencascade::handle<TDF_Attribute> & anAttribute);

		/****************** SetID ******************/
		/**** md5 signature: 594a60d8e3b42dea05c147562d345bea ****/
		%feature("compactdefaultargs") SetID;
		%feature("autodoc", "Sets specific id of the attribute (supports several attributes of one type at the same label feature).

Parameters
----------
&: Standard_GUID

Returns
-------
None
") SetID;
		virtual void SetID(const Standard_GUID &);

		/****************** SetID ******************/
		/**** md5 signature: 224ff062320948dfb4cd5bb6dbf4293d ****/
		%feature("compactdefaultargs") SetID;
		%feature("autodoc", "Sets default id defined in nested class (to be used for attributes having user id feature).

Returns
-------
None
") SetID;
		virtual void SetID();

		/****************** Transaction ******************/
		/**** md5 signature: 00c48137a99575bfa5cfadde8fb37954 ****/
		%feature("compactdefaultargs") Transaction;
		%feature("autodoc", "Returns the transaction index in which the attribute has been created or modified.

Returns
-------
int
") Transaction;
		Standard_Integer Transaction();

		/****************** UntilTransaction ******************/
		/**** md5 signature: becf1aef4465f8bbf7873246c2baea63 ****/
		%feature("compactdefaultargs") UntilTransaction;
		%feature("autodoc", "Returns the upper transaction index until which the attribute is/was valid. this number may vary. a removed attribute validity range is reduced to its transaction index.

Returns
-------
int
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
		/****************** Apply ******************/
		/**** md5 signature: d55ef3070f583d4342be2dd36c78d554 ****/
		%feature("compactdefaultargs") Apply;
		%feature("autodoc", "Applies the delta to the attribute.

Returns
-------
None
") Apply;
		virtual void Apply();

		/****************** Attribute ******************/
		/**** md5 signature: 64fbf96fd4c12b41da848f349815872c ****/
		%feature("compactdefaultargs") Attribute;
		%feature("autodoc", "Returns the reference attribute.

Returns
-------
opencascade::handle<TDF_Attribute>
") Attribute;
		opencascade::handle<TDF_Attribute> Attribute();


        %feature("autodoc", "1");
        %extend{
            std::string DumpToString() {
            std::stringstream s;
            self->Dump(s);
            return s.str();}
        };
		/****************** ID ******************/
		/**** md5 signature: 7f73a4e9cd65afc41a55b9f071f2e10d ****/
		%feature("compactdefaultargs") ID;
		%feature("autodoc", "Returns the id of the attribute concerned by <self>.

Returns
-------
Standard_GUID
") ID;
		Standard_GUID ID();

		/****************** Label ******************/
		/**** md5 signature: 45446fb6d4e5a656e74b10a5eb4cd845 ****/
		%feature("compactdefaultargs") Label;
		%feature("autodoc", "Returns the label concerned by <self>.

Returns
-------
TDF_Label
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
		/****************** TDF_AttributeIterator ******************/
		/**** md5 signature: 585ceece4705e74816ff37825854b411 ****/
		%feature("compactdefaultargs") TDF_AttributeIterator;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") TDF_AttributeIterator;
		 TDF_AttributeIterator();

		/****************** TDF_AttributeIterator ******************/
		/**** md5 signature: d710a54c90205cb251ebe8593dd87141 ****/
		%feature("compactdefaultargs") TDF_AttributeIterator;
		%feature("autodoc", "No available documentation.

Parameters
----------
aLabel: TDF_Label
withoutForgotten: bool,optional
	default value is Standard_True

Returns
-------
None
") TDF_AttributeIterator;
		 TDF_AttributeIterator(const TDF_Label & aLabel, const Standard_Boolean withoutForgotten = Standard_True);

		/****************** TDF_AttributeIterator ******************/
		/**** md5 signature: fd9aa70338e8d898944e21e5794c6ac5 ****/
		%feature("compactdefaultargs") TDF_AttributeIterator;
		%feature("autodoc", "No available documentation.

Parameters
----------
aLabelNode: TDF_LabelNodePtr
withoutForgotten: bool,optional
	default value is Standard_True

Returns
-------
None
") TDF_AttributeIterator;
		 TDF_AttributeIterator(const TDF_LabelNodePtr aLabelNode, const Standard_Boolean withoutForgotten = Standard_True);

		/****************** Initialize ******************/
		/**** md5 signature: 572738611648339acbf475d0a9583c46 ****/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "No available documentation.

Parameters
----------
aLabel: TDF_Label
withoutForgotten: bool,optional
	default value is Standard_True

Returns
-------
None
") Initialize;
		void Initialize(const TDF_Label & aLabel, const Standard_Boolean withoutForgotten = Standard_True);

		/****************** More ******************/
		/**** md5 signature: d71d36638272620679aae1f635153dca ****/
		%feature("compactdefaultargs") More;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") More;
		Standard_Boolean More();

		/****************** Next ******************/
		/**** md5 signature: f35c0df5f1d7c877986db18081404532 ****/
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Next;
		void Next();

		/****************** PtrValue ******************/
		/**** md5 signature: 58a90bcec8f9fb96b5106cadf930b4d8 ****/
		%feature("compactdefaultargs") PtrValue;
		%feature("autodoc", "Provides an access to the internal pointer of the current attribute. the method has better performance as not-creating handle.

Returns
-------
TDF_Attribute *
") PtrValue;
		const TDF_Attribute * PtrValue();

		/****************** Value ******************/
		/**** md5 signature: 84b1efb55f8dba80e554db1af53924bf ****/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TDF_Attribute>
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
		/****************** TDF_ChildIDIterator ******************/
		/**** md5 signature: e42756213d8fd1136d55c3a43d8c9c21 ****/
		%feature("compactdefaultargs") TDF_ChildIDIterator;
		%feature("autodoc", "Creates an empty iterator.

Returns
-------
None
") TDF_ChildIDIterator;
		 TDF_ChildIDIterator();

		/****************** TDF_ChildIDIterator ******************/
		/**** md5 signature: f07ccda3088ed57f2cbde947bb2212ea ****/
		%feature("compactdefaultargs") TDF_ChildIDIterator;
		%feature("autodoc", "Iterates on the children of the given label. if <alllevels> option is set to true, it explores not only the first, but all the sub label levels.

Parameters
----------
aLabel: TDF_Label
anID: Standard_GUID
allLevels: bool,optional
	default value is Standard_False

Returns
-------
None
") TDF_ChildIDIterator;
		 TDF_ChildIDIterator(const TDF_Label & aLabel, const Standard_GUID & anID, const Standard_Boolean allLevels = Standard_False);

		/****************** Initialize ******************/
		/**** md5 signature: d06665652717063a271e60c94853d055 ****/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "Initializes the iteration on the children of the given label. if <alllevels> option is set to true, it explores not only the first, but all the sub label levels.

Parameters
----------
aLabel: TDF_Label
anID: Standard_GUID
allLevels: bool,optional
	default value is Standard_False

Returns
-------
None
") Initialize;
		void Initialize(const TDF_Label & aLabel, const Standard_GUID & anID, const Standard_Boolean allLevels = Standard_False);

		/****************** More ******************/
		/**** md5 signature: 6f6e915c9a3dca758c059d9e8af02dff ****/
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
		%feature("autodoc", "Move to the next brother. if there is none, go up etc. this method is interesting only with 'alllevels' behavior, because it avoids to explore the current label children.

Returns
-------
None
") NextBrother;
		void NextBrother();

		/****************** Value ******************/
		/**** md5 signature: 9ad8943098bbee0d3aa073bd1d7d6d92 ****/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Returns the current item; a null handle if there is none.

Returns
-------
opencascade::handle<TDF_Attribute>
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
		/****************** TDF_ChildIterator ******************/
		/**** md5 signature: 94cafe961c6a9e194e20e43bbdc18d2d ****/
		%feature("compactdefaultargs") TDF_ChildIterator;
		%feature("autodoc", "Creates an empty iterator object to explore the children of a label.

Returns
-------
None
") TDF_ChildIterator;
		 TDF_ChildIterator();

		/****************** TDF_ChildIterator ******************/
		/**** md5 signature: acb79b424ebe77264841b3feb5423e51 ****/
		%feature("compactdefaultargs") TDF_ChildIterator;
		%feature("autodoc", "Constructs the iterator object defined by the label alabel. iterates on the children of the given label. if <alllevels> option is set to true, it explores not only the first, but all the sub label levels.

Parameters
----------
aLabel: TDF_Label
allLevels: bool,optional
	default value is Standard_False

Returns
-------
None
") TDF_ChildIterator;
		 TDF_ChildIterator(const TDF_Label & aLabel, const Standard_Boolean allLevels = Standard_False);

		/****************** Initialize ******************/
		/**** md5 signature: b3942e3ee5d048a2a0d607e21cbecc7a ****/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "Initializes the iteration on the children of the given label. if <alllevels> option is set to true, it explores not only the first, but all the sub label levels. if alllevels is false, only the first level of child labels is explored. in the example below, the label is iterated using initialize, more and next and its child labels dumped using tdf_tool::entry. example void dumpchildren(const tdf_label& alabel) { tdf_childiterator it; tcollection_asciistring es; for (it.initialize(alabel,standard_true); it.more(); it.next()){ tdf_tool::entry(it.value(),es); std::cout << as.tocstring() << std::endl; } }.

Parameters
----------
aLabel: TDF_Label
allLevels: bool,optional
	default value is Standard_False

Returns
-------
None
") Initialize;
		void Initialize(const TDF_Label & aLabel, const Standard_Boolean allLevels = Standard_False);

		/****************** More ******************/
		/**** md5 signature: 6f6e915c9a3dca758c059d9e8af02dff ****/
		%feature("compactdefaultargs") More;
		%feature("autodoc", "Returns true if a current label is found in the iteration process.

Returns
-------
bool
") More;
		Standard_Boolean More();

		/****************** Next ******************/
		/**** md5 signature: f35c0df5f1d7c877986db18081404532 ****/
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "Move the current iteration to the next item.

Returns
-------
None
") Next;
		void Next();

		/****************** NextBrother ******************/
		/**** md5 signature: 5986fa6a611b7b5fcfac587700960b73 ****/
		%feature("compactdefaultargs") NextBrother;
		%feature("autodoc", "Moves this iteration to the next brother label. a brother label is one with the same father as an initial label. use this function when the non-empty constructor or initialize has alllevels set to true. the result is that the iteration does not explore the children of the current label. this method is interesting only with 'alllevels' behavior, because it avoids to explore the current label children.

Returns
-------
None
") NextBrother;
		void NextBrother();

		/****************** Value ******************/
		/**** md5 signature: 06b32d6a07bbf18ac1eb5a51d95d98cd ****/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Returns the current label; or, if there is none, a null label.

Returns
-------
TDF_Label
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
		/****************** TDF_ClosureMode ******************/
		/**** md5 signature: d0067cf39e729d207d68714afd10e10e ****/
		%feature("compactdefaultargs") TDF_ClosureMode;
		%feature("autodoc", "Creates an objet with all modes set to <amode>.

Parameters
----------
aMode: bool,optional
	default value is Standard_True

Returns
-------
None
") TDF_ClosureMode;
		 TDF_ClosureMode(const Standard_Boolean aMode = Standard_True);

		/****************** Descendants ******************/
		/**** md5 signature: a2e2f79553e77366fa7544bdfc242a1e ****/
		%feature("compactdefaultargs") Descendants;
		%feature("autodoc", "Sets the mode 'descendants' to <astatus>. //! 'descendants' mode means we add to the data set the children labels of each user given label. we do not do that with the labels found applying uptofirstlevel option.

Parameters
----------
aStatus: bool

Returns
-------
None
") Descendants;
		void Descendants(const Standard_Boolean aStatus);

		/****************** Descendants ******************/
		/**** md5 signature: 826bd7150e755194db5d40e39b74c7ff ****/
		%feature("compactdefaultargs") Descendants;
		%feature("autodoc", "Returns true if the mode 'descendants' is set.

Returns
-------
bool
") Descendants;
		Standard_Boolean Descendants();

		/****************** References ******************/
		/**** md5 signature: 04dadbf275888077d87d5f847d1316f6 ****/
		%feature("compactdefaultargs") References;
		%feature("autodoc", "Sets the mode 'references' to <astatus>. //! 'references' mode means we add to the data set the descendants of an attribute, by calling the attribute method descendants().

Parameters
----------
aStatus: bool

Returns
-------
None
") References;
		void References(const Standard_Boolean aStatus);

		/****************** References ******************/
		/**** md5 signature: e3acfac1a95f17388b349c8df0832ef9 ****/
		%feature("compactdefaultargs") References;
		%feature("autodoc", "Returns true if the mode 'references' is set.

Returns
-------
bool
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
		/****************** Closure ******************/
		/**** md5 signature: 137ba63aeb67f91b2a78d852939e2cb5 ****/
		%feature("compactdefaultargs") Closure;
		%feature("autodoc", "Builds the transitive closure of label and attribute sets into <adataset>.

Parameters
----------
aDataSet: TDF_DataSet

Returns
-------
None
") Closure;
		static void Closure(const opencascade::handle<TDF_DataSet> & aDataSet);

		/****************** Closure ******************/
		/**** md5 signature: d28d9168a2c73ddb283363e4b4426183 ****/
		%feature("compactdefaultargs") Closure;
		%feature("autodoc", "Builds the transitive closure of label and attribute sets into <adataset>. uses <afilter> to determine if an attribute has to be taken in account or not. uses <amode> for various way of closing.

Parameters
----------
aDataSet: TDF_DataSet
aFilter: TDF_IDFilter
aMode: TDF_ClosureMode

Returns
-------
None
") Closure;
		static void Closure(const opencascade::handle<TDF_DataSet> & aDataSet, const TDF_IDFilter & aFilter, const TDF_ClosureMode & aMode);

		/****************** Closure ******************/
		/**** md5 signature: 70e894c4a44be9fe1e618e830285afd3 ****/
		%feature("compactdefaultargs") Closure;
		%feature("autodoc", "Builds the transitive closure of <alabel>.

Parameters
----------
aLabel: TDF_Label
aLabMap: TDF_LabelMap
anAttMap: TDF_AttributeMap
aFilter: TDF_IDFilter
aMode: TDF_ClosureMode

Returns
-------
None
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
		/****************** Compare ******************/
		/**** md5 signature: fa2e0f4c630692eb4f8c4562c3aa0b06 ****/
		%feature("compactdefaultargs") Compare;
		%feature("autodoc", "Compares <asourcedataset> with <atargetdataset>, updating <arelocationtable> with labels and attributes found in both sets.

Parameters
----------
aSourceDataSet: TDF_DataSet
aTargetDataSet: TDF_DataSet
aFilter: TDF_IDFilter
aRelocationTable: TDF_RelocationTable

Returns
-------
None
") Compare;
		static void Compare(const opencascade::handle<TDF_DataSet> & aSourceDataSet, const opencascade::handle<TDF_DataSet> & aTargetDataSet, const TDF_IDFilter & aFilter, const opencascade::handle<TDF_RelocationTable> & aRelocationTable);

		/****************** Cut ******************/
		/**** md5 signature: eafbfe914d8ffda969355273a231f112 ****/
		%feature("compactdefaultargs") Cut;
		%feature("autodoc", "Removes attributes from <adataset>.

Parameters
----------
aDataSet: TDF_DataSet

Returns
-------
None
") Cut;
		static void Cut(const opencascade::handle<TDF_DataSet> & aDataSet);

		/****************** IsSelfContained ******************/
		/**** md5 signature: f1f3a19ce83f1d52e1c34ef553b4aabd ****/
		%feature("compactdefaultargs") IsSelfContained;
		%feature("autodoc", "Returns true if all the labels of <adataset> are descendant of <alabel>.

Parameters
----------
aLabel: TDF_Label
aDataSet: TDF_DataSet

Returns
-------
bool
") IsSelfContained;
		static Standard_Boolean IsSelfContained(const TDF_Label & aLabel, const opencascade::handle<TDF_DataSet> & aDataSet);

		/****************** SourceUnbound ******************/
		/**** md5 signature: d519b241fc1f0ed64c04ba6192ba3b70 ****/
		%feature("compactdefaultargs") SourceUnbound;
		%feature("autodoc", "Finds from <arefdataset> all the keys not bound into <arelocationtable> and put them into <adiffdataset>. returns true if the difference contains at least one key. (a key is a source object). //! <anoption> may take the following values: 1 : labels treatment only; 2 : attributes treatment only (default value); 3 : both labels & attributes treatment.

Parameters
----------
aRefDataSet: TDF_DataSet
aRelocationTable: TDF_RelocationTable
aFilter: TDF_IDFilter
aDiffDataSet: TDF_DataSet
anOption: int,optional
	default value is 2

Returns
-------
bool
") SourceUnbound;
		static Standard_Boolean SourceUnbound(const opencascade::handle<TDF_DataSet> & aRefDataSet, const opencascade::handle<TDF_RelocationTable> & aRelocationTable, const TDF_IDFilter & aFilter, const opencascade::handle<TDF_DataSet> & aDiffDataSet, const Standard_Integer anOption = 2);

		/****************** TargetUnbound ******************/
		/**** md5 signature: f1bef1c25fe7f83a1cd97a71260b7087 ****/
		%feature("compactdefaultargs") TargetUnbound;
		%feature("autodoc", "Substracts from <arefdataset> all the items bound into <arelocationtable>. the result is put into <adiffdataset>. returns true if the difference contains at least one item. (an item is a target object). //! <anoption> may take the following values: 1 : labels treatment only; 2 : attributes treatment only(default value); 3 : both labels & attributes treatment.

Parameters
----------
aRefDataSet: TDF_DataSet
aRelocationTable: TDF_RelocationTable
aFilter: TDF_IDFilter
aDiffDataSet: TDF_DataSet
anOption: int,optional
	default value is 2

Returns
-------
bool
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
		/****************** TDF_CopyLabel ******************/
		/**** md5 signature: 45df1a3aa5e656373d0435e2f931a89e ****/
		%feature("compactdefaultargs") TDF_CopyLabel;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") TDF_CopyLabel;
		 TDF_CopyLabel();

		/****************** TDF_CopyLabel ******************/
		/**** md5 signature: 25c850253cbcae0cd5d2932242809c66 ****/
		%feature("compactdefaultargs") TDF_CopyLabel;
		%feature("autodoc", "Copytool.

Parameters
----------
aSource: TDF_Label
aTarget: TDF_Label

Returns
-------
None
") TDF_CopyLabel;
		 TDF_CopyLabel(const TDF_Label & aSource, const TDF_Label & aTarget);

		/****************** ExternalReferences ******************/
		/**** md5 signature: 43d7cd21830d7d64f4aeff0c25fe8ac3 ****/
		%feature("compactdefaultargs") ExternalReferences;
		%feature("autodoc", "Check external references and if exist fills the aexternals map.

Parameters
----------
Lab: TDF_Label
aExternals: TDF_AttributeMap
aFilter: TDF_IDFilter

Returns
-------
bool
") ExternalReferences;
		static Standard_Boolean ExternalReferences(const TDF_Label & Lab, TDF_AttributeMap & aExternals, const TDF_IDFilter & aFilter);

		/****************** ExternalReferences ******************/
		/**** md5 signature: 3856812b6615819534ef22781ae0f96c ****/
		%feature("compactdefaultargs") ExternalReferences;
		%feature("autodoc", "Check external references and if exist fills the aexternals map.

Parameters
----------
aRefLab: TDF_Label
Lab: TDF_Label
aExternals: TDF_AttributeMap
aFilter: TDF_IDFilter
aDataSet: TDF_DataSet

Returns
-------
None
") ExternalReferences;
		static void ExternalReferences(const TDF_Label & aRefLab, const TDF_Label & Lab, TDF_AttributeMap & aExternals, const TDF_IDFilter & aFilter, opencascade::handle<TDF_DataSet> & aDataSet);

		/****************** IsDone ******************/
		/**** md5 signature: ec0624071ec7da54b3d9dacc7bcb05f9 ****/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsDone;
		Standard_Boolean IsDone();

		/****************** Load ******************/
		/**** md5 signature: ed6ed42a43a283fb587c69e5a20c2bc8 ****/
		%feature("compactdefaultargs") Load;
		%feature("autodoc", "Loads src and tgt labels.

Parameters
----------
aSource: TDF_Label
aTarget: TDF_Label

Returns
-------
None
") Load;
		void Load(const TDF_Label & aSource, const TDF_Label & aTarget);

		/****************** Perform ******************/
		/**** md5 signature: c04b01412cba7220c024b5eb4532697f ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Performs algorithm of selfcontained copy.

Returns
-------
None
") Perform;
		void Perform();

		/****************** RelocationTable ******************/
		/**** md5 signature: 8ae337ea16a575c9cbe8babfdef86d2a ****/
		%feature("compactdefaultargs") RelocationTable;
		%feature("autodoc", "Returns relocation table.

Returns
-------
opencascade::handle<TDF_RelocationTable>
") RelocationTable;
		const opencascade::handle<TDF_RelocationTable> & RelocationTable();

		/****************** UseFilter ******************/
		/**** md5 signature: 81ab0a7df550941c4582f6b215663e0a ****/
		%feature("compactdefaultargs") UseFilter;
		%feature("autodoc", "Sets filter.

Parameters
----------
aFilter: TDF_IDFilter

Returns
-------
None
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
		/****************** Copy ******************/
		/**** md5 signature: 2ad919cddc9b7241da9696a78c954561 ****/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "Copy <asourcedataset> with using and updating <arelocationtable>. this method ignores target attributes privilege over source ones.

Parameters
----------
aSourceDataSet: TDF_DataSet
aRelocationTable: TDF_RelocationTable

Returns
-------
None
") Copy;
		static void Copy(const opencascade::handle<TDF_DataSet> & aSourceDataSet, const opencascade::handle<TDF_RelocationTable> & aRelocationTable);

		/****************** Copy ******************/
		/**** md5 signature: 768e1b62d141161509e52761bbe287a3 ****/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "Copy <asourcedataset> using and updating <arelocationtable>. use <aprivilegefilter> to give a list of ids for which the target attribute prevails over the source one.

Parameters
----------
aSourceDataSet: TDF_DataSet
aRelocationTable: TDF_RelocationTable
aPrivilegeFilter: TDF_IDFilter

Returns
-------
None
") Copy;
		static void Copy(const opencascade::handle<TDF_DataSet> & aSourceDataSet, const opencascade::handle<TDF_RelocationTable> & aRelocationTable, const TDF_IDFilter & aPrivilegeFilter);

		/****************** Copy ******************/
		/**** md5 signature: 86b536dc896d9901389518ae854cc0d8 ****/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "Copy <asourcedataset> using and updating <arelocationtable>. use <aprivilegefilter> to give a list of ids for which the target attribute prevails over the source one. if <setselfcontained> is set to true, every tdf_reference will be replaced by the referenced structure according to <areffilter>. //! nb: <areffilter> is used only if <setselfcontained> is true. internal root label copy recursive method.

Parameters
----------
aSourceDataSet: TDF_DataSet
aRelocationTable: TDF_RelocationTable
aPrivilegeFilter: TDF_IDFilter
aRefFilter: TDF_IDFilter
setSelfContained: bool

Returns
-------
None
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
		/****************** TDF_Data ******************/
		/**** md5 signature: 9fc63e5d9ac61de6ac00d5ea0bdb733a ****/
		%feature("compactdefaultargs") TDF_Data;
		%feature("autodoc", "A new and empty data structure.

Returns
-------
None
") TDF_Data;
		 TDF_Data();

		/****************** AllowModification ******************/
		/**** md5 signature: 3629f95e767d9884a68821b6c664883c ****/
		%feature("compactdefaultargs") AllowModification;
		%feature("autodoc", "Sets modification mode.

Parameters
----------
isAllowed: bool

Returns
-------
None
") AllowModification;
		void AllowModification(const Standard_Boolean isAllowed);

		/****************** Destroy ******************/
		/**** md5 signature: 73111f72f4ab0474eb2cfbd7e4af4e1a ****/
		%feature("compactdefaultargs") Destroy;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Destroy;
		void Destroy();


        %feature("autodoc", "1");
        %extend{
            std::string DumpToString() {
            std::stringstream s;
            self->Dump(s);
            return s.str();}
        };
		/****************** IsApplicable ******************/
		/**** md5 signature: 3bce195eeb54500772a8ae9747fed4f1 ****/
		%feature("compactdefaultargs") IsApplicable;
		%feature("autodoc", "Returns true if <adelta> is applicable here and now.

Parameters
----------
aDelta: TDF_Delta

Returns
-------
bool
") IsApplicable;
		Standard_Boolean IsApplicable(const opencascade::handle<TDF_Delta> & aDelta);

		/****************** IsModificationAllowed ******************/
		/**** md5 signature: 2024d7829729e942aa313777d0c41fd3 ****/
		%feature("compactdefaultargs") IsModificationAllowed;
		%feature("autodoc", "Returns modification mode.

Returns
-------
bool
") IsModificationAllowed;
		Standard_Boolean IsModificationAllowed();

		/****************** LabelNodeAllocator ******************/
		/**** md5 signature: 51616b0b91fcc4a24241ddee1ed9e63f ****/
		%feature("compactdefaultargs") LabelNodeAllocator;
		%feature("autodoc", "Returns tdf_hallocator, which is an incremental allocator used by tdf_labelnode. this allocator is used to manage tdf_labelnode objects, but it can also be used for allocating memory to application-specific data (be careful because this allocator does not release the memory). the benefits of this allocation scheme are noticeable when dealing with large ocaf documents, due to: 1. very quick allocation of objects (memory heap is not used, the algorithm that replaces it is very simple). 2. very quick destruction of objects (memory is released not by destructors of tdf_labelnode, but rather by the destructor of tdf_data). 3. tdf_labelnode objects do not fragmentize the memory; they are kept compactly in a number of arrays of 16k each. 4. swapping is reduced on large data, because each document now occupies a smaller number of memory pages.

Returns
-------
TDF_HAllocator
") LabelNodeAllocator;
		const TDF_HAllocator & LabelNodeAllocator();

		/****************** NotUndoMode ******************/
		/**** md5 signature: abeb3f9854eb45a2b17d3745f22b5e53 ****/
		%feature("compactdefaultargs") NotUndoMode;
		%feature("autodoc", "Returns the undo mode status.

Returns
-------
bool
") NotUndoMode;
		Standard_Boolean NotUndoMode();

		/****************** Root ******************/
		/**** md5 signature: 8d91e6b3e48b0dcd1ed6725e1e277a57 ****/
		%feature("compactdefaultargs") Root;
		%feature("autodoc", "Returns the root label of the data structure.

Returns
-------
TDF_Label
") Root;
		const TDF_Label Root();

		/****************** Time ******************/
		/**** md5 signature: 29e54f38b67d119a1dd7d985afb308c4 ****/
		%feature("compactdefaultargs") Time;
		%feature("autodoc", "Returns the current tick. it is incremented each commit.

Returns
-------
int
") Time;
		Standard_Integer Time();

		/****************** Transaction ******************/
		/**** md5 signature: 00c48137a99575bfa5cfadde8fb37954 ****/
		%feature("compactdefaultargs") Transaction;
		%feature("autodoc", "Returns the current transaction number.

Returns
-------
int
") Transaction;
		Standard_Integer Transaction();

		/****************** Undo ******************/
		/**** md5 signature: e381e2729d2baa6e06b5553ecb90f6be ****/
		%feature("compactdefaultargs") Undo;
		%feature("autodoc", "Apply <adelta> to undo a set of attribute modifications. //! optionnal <withdelta> set to true indiquates a delta set must be generated. (see above).

Parameters
----------
aDelta: TDF_Delta
withDelta: bool,optional
	default value is Standard_False

Returns
-------
opencascade::handle<TDF_Delta>
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
		/****************** TDF_DataSet ******************/
		/**** md5 signature: 38b87a8b1743078c8ca1b762ca848a5b ****/
		%feature("compactdefaultargs") TDF_DataSet;
		%feature("autodoc", "Creates an empty dataset object.

Returns
-------
None
") TDF_DataSet;
		 TDF_DataSet();

		/****************** AddAttribute ******************/
		/**** md5 signature: f3d67ca0190efaa72217965efe5fa3f3 ****/
		%feature("compactdefaultargs") AddAttribute;
		%feature("autodoc", "Adds <anattribute> into the current data set.

Parameters
----------
anAttribute: TDF_Attribute

Returns
-------
None
") AddAttribute;
		void AddAttribute(const opencascade::handle<TDF_Attribute> & anAttribute);

		/****************** AddLabel ******************/
		/**** md5 signature: 7fbcb1070afe949ef0df7c94c85a6d05 ****/
		%feature("compactdefaultargs") AddLabel;
		%feature("autodoc", "Adds <alabel> in the current data set.

Parameters
----------
aLabel: TDF_Label

Returns
-------
None
") AddLabel;
		void AddLabel(const TDF_Label & aLabel);

		/****************** AddRoot ******************/
		/**** md5 signature: 7f361ae371dd39d3acb9e85caacc6ae9 ****/
		%feature("compactdefaultargs") AddRoot;
		%feature("autodoc", "Adds a root label to <myrootlabels>.

Parameters
----------
aLabel: TDF_Label

Returns
-------
None
") AddRoot;
		void AddRoot(const TDF_Label & aLabel);

		/****************** Attributes ******************/
		/**** md5 signature: 67153ada94d44acfe76da77081ef336b ****/
		%feature("compactdefaultargs") Attributes;
		%feature("autodoc", "Returns the map of attributes in the current data set. this map can be used directly, or updated.

Returns
-------
TDF_AttributeMap
") Attributes;
		TDF_AttributeMap & Attributes();

		/****************** Clear ******************/
		/**** md5 signature: ae54be580b423a6eadbe062e0bdb44c2 ****/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "Clears all information.

Returns
-------
None
") Clear;
		void Clear();

		/****************** ContainsAttribute ******************/
		/**** md5 signature: f5cfecdfca3855c7c473be249d687485 ****/
		%feature("compactdefaultargs") ContainsAttribute;
		%feature("autodoc", "Returns true if <anattribute> is in the data set.

Parameters
----------
anAttribute: TDF_Attribute

Returns
-------
bool
") ContainsAttribute;
		Standard_Boolean ContainsAttribute(const opencascade::handle<TDF_Attribute> & anAttribute);

		/****************** ContainsLabel ******************/
		/**** md5 signature: f95464b8fc5a41d2c99d023622240899 ****/
		%feature("compactdefaultargs") ContainsLabel;
		%feature("autodoc", "Returns true if the label <alabel> is in the data set.

Parameters
----------
aLabel: TDF_Label

Returns
-------
bool
") ContainsLabel;
		Standard_Boolean ContainsLabel(const TDF_Label & aLabel);


        %feature("autodoc", "1");
        %extend{
            std::string DumpToString() {
            std::stringstream s;
            self->Dump(s);
            return s.str();}
        };
		/****************** IsEmpty ******************/
		/**** md5 signature: 6ab5e1ad63f93168856ab126dd374b81 ****/
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "Returns true if there is at least one label or one attribute.

Returns
-------
bool
") IsEmpty;
		Standard_Boolean IsEmpty();

		/****************** Labels ******************/
		/**** md5 signature: ea1fec9a82297e5e75aa304f7e196b4d ****/
		%feature("compactdefaultargs") Labels;
		%feature("autodoc", "Returns the map of labels in this data set. this map can be used directly, or updated.

Returns
-------
TDF_LabelMap
") Labels;
		TDF_LabelMap & Labels();

		/****************** Roots ******************/
		/**** md5 signature: f326664333bfba9316463d303f238419 ****/
		%feature("compactdefaultargs") Roots;
		%feature("autodoc", "Returns <myrootlabels> to be used or updated.

Returns
-------
TDF_LabelList
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
		/****************** TDF_Delta ******************/
		/**** md5 signature: c25ba13e80b876ae81fda885bcb8f719 ****/
		%feature("compactdefaultargs") TDF_Delta;
		%feature("autodoc", "Creates a delta.

Returns
-------
None
") TDF_Delta;
		 TDF_Delta();

		/****************** AttributeDeltas ******************/
		/**** md5 signature: a01630877acf73e0fe223f8de99987dc ****/
		%feature("compactdefaultargs") AttributeDeltas;
		%feature("autodoc", "Returns the field <myattdeltalist>.

Returns
-------
TDF_AttributeDeltaList
") AttributeDeltas;
		const TDF_AttributeDeltaList & AttributeDeltas();

		/****************** BeginTime ******************/
		/**** md5 signature: bbc7dc7595a2b0017ba4e997281b3b9d ****/
		%feature("compactdefaultargs") BeginTime;
		%feature("autodoc", "Returns the field <mybegintime>.

Returns
-------
int
") BeginTime;
		Standard_Integer BeginTime();


        %feature("autodoc", "1");
        %extend{
            std::string DumpToString() {
            std::stringstream s;
            self->Dump(s);
            return s.str();}
        };
		/****************** EndTime ******************/
		/**** md5 signature: ebfc0a5623f28f348163522aac1f9970 ****/
		%feature("compactdefaultargs") EndTime;
		%feature("autodoc", "Returns the field <myendtime>.

Returns
-------
int
") EndTime;
		Standard_Integer EndTime();

		/****************** IsApplicable ******************/
		/**** md5 signature: 69fca5e8fc8433a54befd18a7a29c75e ****/
		%feature("compactdefaultargs") IsApplicable;
		%feature("autodoc", "Returns true if the undo action of <self> is applicable at <acurrenttime>.

Parameters
----------
aCurrentTime: int

Returns
-------
bool
") IsApplicable;
		Standard_Boolean IsApplicable(const Standard_Integer aCurrentTime);

		/****************** IsEmpty ******************/
		/**** md5 signature: 6ab5e1ad63f93168856ab126dd374b81 ****/
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "Returns true if there is nothing to undo.

Returns
-------
bool
") IsEmpty;
		Standard_Boolean IsEmpty();

		/****************** Labels ******************/
		/**** md5 signature: 3221e83f835ac762589f5da76c6d2476 ****/
		%feature("compactdefaultargs") Labels;
		%feature("autodoc", "Adds in <alabellist> the labels of the attribute deltas. caution: <alabellist> is not cleared before use.

Parameters
----------
aLabelList: TDF_LabelList

Returns
-------
None
") Labels;
		void Labels(TDF_LabelList & aLabelList);

		/****************** Name ******************/
		/**** md5 signature: a9e55299a1405b3a2863469f1a67f9cd ****/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "Returns a name associated with this delta.

Returns
-------
TCollection_ExtendedString
") Name;
		TCollection_ExtendedString Name();

		/****************** SetName ******************/
		/**** md5 signature: 37faf29196bae8c9862db277eec2dc6c ****/
		%feature("compactdefaultargs") SetName;
		%feature("autodoc", "Associates a name <thename> with this delta.

Parameters
----------
theName: TCollection_ExtendedString

Returns
-------
None
") SetName;
		void SetName(const TCollection_ExtendedString & theName);

};


%make_alias(TDF_Delta)

%extend TDF_Delta {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************
* class TDF_IDFilter *
*********************/
class TDF_IDFilter {
	public:
		/****************** TDF_IDFilter ******************/
		/**** md5 signature: 58987a5c5f723e0f2e6217e5f5a27ef6 ****/
		%feature("compactdefaultargs") TDF_IDFilter;
		%feature("autodoc", "Creates an id/attribute filter based on an id list. the default mode is 'ignore all but...'. //! this filter has 2 working mode: keep and ignore. //! ignore/exclusive mode: all ids are ignored except these set to be kept, using keep(). of course, it is possible set an kept id to be ignored using ignore(). //! keep/inclusive mode: all ids are kept except these set to be ignored, using ignore(). of course, it is possible set an ignored id to be kept using keep().

Parameters
----------
ignoreMode: bool,optional
	default value is Standard_True

Returns
-------
None
") TDF_IDFilter;
		 TDF_IDFilter(const Standard_Boolean ignoreMode = Standard_True);

		/****************** Copy ******************/
		/**** md5 signature: cba1c4d44a1e2ba6eeeb86e5e53cc5e3 ****/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "Copies into <self> the contents of <fromfilter>. <self> is cleared before copy.

Parameters
----------
fromFilter: TDF_IDFilter

Returns
-------
None
") Copy;
		void Copy(const TDF_IDFilter & fromFilter);


        %feature("autodoc", "1");
        %extend{
            std::string DumpToString() {
            std::stringstream s;
            self->Dump(s);
            return s.str();}
        };
		/****************** IDList ******************/
		/**** md5 signature: 51f584875347d58754d482e26d1410b6 ****/
		%feature("compactdefaultargs") IDList;
		%feature("autodoc", "Copies the list of id to be kept or ignored in <anidlist>. <anidlist> is cleared before use.

Parameters
----------
anIDList: TDF_IDList

Returns
-------
None
") IDList;
		void IDList(TDF_IDList & anIDList);

		/****************** Ignore ******************/
		/**** md5 signature: ef193e95aeab177af35fe8cb04756e08 ****/
		%feature("compactdefaultargs") Ignore;
		%feature("autodoc", "An attribute with <anid> as id is to be ignored and the filter will answer false to the question iskept(<anid>).

Parameters
----------
anID: Standard_GUID

Returns
-------
None
") Ignore;
		void Ignore(const Standard_GUID & anID);

		/****************** Ignore ******************/
		/**** md5 signature: 3b86bb6fc9fec9a8002469571237228e ****/
		%feature("compactdefaultargs") Ignore;
		%feature("autodoc", "Attributes with id owned by <anidlist> are to be ignored and the filter will answer false to the question iskept(<anid>) with id from <anidlist>.

Parameters
----------
anIDList: TDF_IDList

Returns
-------
None
") Ignore;
		void Ignore(const TDF_IDList & anIDList);

		/****************** IgnoreAll ******************/
		/**** md5 signature: efc50b8e6d73cc9f9ccc417f512fca20 ****/
		%feature("compactdefaultargs") IgnoreAll;
		%feature("autodoc", "The list of id is cleared and the filter mode is set to ignore mode if <keep> is true; false otherwise.

Parameters
----------
ignore: bool

Returns
-------
None
") IgnoreAll;
		void IgnoreAll(const Standard_Boolean ignore);

		/****************** IgnoreAll ******************/
		/**** md5 signature: 0f8fc4125eb61399d6834b6d0ca04a16 ****/
		%feature("compactdefaultargs") IgnoreAll;
		%feature("autodoc", "Returns true is the mode is set to 'ignore all but...'.

Returns
-------
bool
") IgnoreAll;
		Standard_Boolean IgnoreAll();

		/****************** IsIgnored ******************/
		/**** md5 signature: d981ce364d388866cbe2605fb6b255bc ****/
		%feature("compactdefaultargs") IsIgnored;
		%feature("autodoc", "Returns true if the id is to be ignored.

Parameters
----------
anID: Standard_GUID

Returns
-------
bool
") IsIgnored;
		Standard_Boolean IsIgnored(const Standard_GUID & anID);

		/****************** IsIgnored ******************/
		/**** md5 signature: c04e34ba0398a9d432af6e2ebc5ef72f ****/
		%feature("compactdefaultargs") IsIgnored;
		%feature("autodoc", "Returns true if the attribute is to be ignored.

Parameters
----------
anAtt: TDF_Attribute

Returns
-------
bool
") IsIgnored;
		Standard_Boolean IsIgnored(const opencascade::handle<TDF_Attribute> & anAtt);

		/****************** IsKept ******************/
		/**** md5 signature: c74df13be2964aac3c844c5c22f6dbbc ****/
		%feature("compactdefaultargs") IsKept;
		%feature("autodoc", "Returns true if the id is to be kept.

Parameters
----------
anID: Standard_GUID

Returns
-------
bool
") IsKept;
		Standard_Boolean IsKept(const Standard_GUID & anID);

		/****************** IsKept ******************/
		/**** md5 signature: e9ee54cee186f5a5c5fbe8f5206bbbb0 ****/
		%feature("compactdefaultargs") IsKept;
		%feature("autodoc", "Returns true if the attribute is to be kept.

Parameters
----------
anAtt: TDF_Attribute

Returns
-------
bool
") IsKept;
		Standard_Boolean IsKept(const opencascade::handle<TDF_Attribute> & anAtt);

		/****************** Keep ******************/
		/**** md5 signature: 44117785f35284179a4db2ed450a031b ****/
		%feature("compactdefaultargs") Keep;
		%feature("autodoc", "An attribute with <anid> as id is to be kept and the filter will answer true to the question iskept(<anid>).

Parameters
----------
anID: Standard_GUID

Returns
-------
None
") Keep;
		void Keep(const Standard_GUID & anID);

		/****************** Keep ******************/
		/**** md5 signature: d00a54cbc2ef1dc529ade6c39e222865 ****/
		%feature("compactdefaultargs") Keep;
		%feature("autodoc", "Attributes with id owned by <anidlist> are to be kept and the filter will answer true to the question iskept(<anid>) with id from <anidlist>.

Parameters
----------
anIDList: TDF_IDList

Returns
-------
None
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
		/****************** TDF_Label ******************/
		/**** md5 signature: 1a8e59ba046467c4e163db826620fcdb ****/
		%feature("compactdefaultargs") TDF_Label;
		%feature("autodoc", "Constructs an empty label object.

Returns
-------
None
") TDF_Label;
		 TDF_Label();

		/****************** AddAttribute ******************/
		/**** md5 signature: 6b2e59e881e33fcbfe2d87e62e7a38c4 ****/
		%feature("compactdefaultargs") AddAttribute;
		%feature("autodoc", "Adds an attribute to the current label. raises if there is already one.

Parameters
----------
anAttribute: TDF_Attribute
append: bool,optional
	default value is Standard_True

Returns
-------
None
") AddAttribute;
		void AddAttribute(const opencascade::handle<TDF_Attribute> & anAttribute, const Standard_Boolean append = Standard_True);

		/****************** AttributesModified ******************/
		/**** md5 signature: 2900274105f9122a0f7c89c8d5bdc04c ****/
		%feature("compactdefaultargs") AttributesModified;
		%feature("autodoc", "Returns true if <self> owns attributes not yet available in transaction 0. it means at least one attribute is new, modified or deleted.

Returns
-------
bool
") AttributesModified;
		Standard_Boolean AttributesModified();

		/****************** Data ******************/
		/**** md5 signature: 04ec1a781153c5a50d2756cf01f47e1c ****/
		%feature("compactdefaultargs") Data;
		%feature("autodoc", "Returns the data owning <self>.

Returns
-------
opencascade::handle<TDF_Data>
") Data;
		opencascade::handle<TDF_Data> Data();

		/****************** Depth ******************/
		/**** md5 signature: b6eaa771d2fe709741b9c1e8ce5ec68f ****/
		%feature("compactdefaultargs") Depth;
		%feature("autodoc", "Returns the depth of the label in the data framework. this corresponds to the number of fathers which this label has, and is used in determining whether a label is root, null or equivalent to another label. exceptions: standard_nullobject if this label is null. this is because a null object can have no depth.

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

        %feature("autodoc", "1");
        %extend{
            std::string EntryDumpToString() {
            std::stringstream s;
            self->EntryDump(s);
            return s.str();}
        };
		/****************** Father ******************/
		/**** md5 signature: a0f1cf18875c9b067fe3f49cfc73a13d ****/
		%feature("compactdefaultargs") Father;
		%feature("autodoc", "Returns the label father. this label may be null if the label is root.

Returns
-------
TDF_Label
") Father;
		const TDF_Label Father();

		/****************** FindAttribute ******************/
		/**** md5 signature: 5f4fd12b74a27c4216127d1ce8d3b78a ****/
		%feature("compactdefaultargs") FindAttribute;
		%feature("autodoc", "Finds an attribute of the current label, according to <anid>. if anattribute is not a valid one, false is returned. //! the method returns true if found, false otherwise. //! a removed attribute cannot be found.

Parameters
----------
anID: Standard_GUID
anAttribute: TDF_Attribute

Returns
-------
bool
") FindAttribute;
		Standard_Boolean FindAttribute(const Standard_GUID & anID, opencascade::handle<TDF_Attribute> & anAttribute);

		/****************** FindAttribute ******************/
		/**** md5 signature: 7c7c7cdcc2d92b5e36db059c8747501d ****/
		%feature("compactdefaultargs") FindAttribute;
		%feature("autodoc", "Finds an attribute of the current label, according to <anid> and <atransaction>. this attribute has/had to be a valid one for the given transaction index . so, this attribute is not necessary a valid one. //! the method returns true if found, false otherwise. //! a removed attribute cannot be found nor a backuped attribute of a removed one.

Parameters
----------
anID: Standard_GUID
aTransaction: int
anAttribute: TDF_Attribute

Returns
-------
bool
") FindAttribute;
		Standard_Boolean FindAttribute(const Standard_GUID & anID, const Standard_Integer aTransaction, opencascade::handle<TDF_Attribute> & anAttribute);

		/****************** FindChild ******************/
		/**** md5 signature: a60e65fcd27d44e6f003161f38441bca ****/
		%feature("compactdefaultargs") FindChild;
		%feature("autodoc", "Finds a child label having <atag> as tag. creates the tag atag identifies the label which will be the parent. if create is true and no child label is found, a new one is created. example: //creating a label with tag 10 at root tdf_label lab1 = adf->root().findchild(10); //creating labels 7 and 2 on label 10 tdf_label lab2 = lab1.findchild(7); tdf_label lab3 = lab1.findchild(2);.

Parameters
----------
aTag: int
create: bool,optional
	default value is Standard_True

Returns
-------
TDF_Label
") FindChild;
		TDF_Label FindChild(const Standard_Integer aTag, const Standard_Boolean create = Standard_True);

		/****************** ForgetAllAttributes ******************/
		/**** md5 signature: f0492f70679f693e73f3cd351b602cd9 ****/
		%feature("compactdefaultargs") ForgetAllAttributes;
		%feature("autodoc", "Forgets all the attributes. does it on also on the sub-labels if <clearchildren> is set to true. of course, this method is compatible with transaction & delta mecanisms.

Parameters
----------
clearChildren: bool,optional
	default value is Standard_True

Returns
-------
None
") ForgetAllAttributes;
		void ForgetAllAttributes(const Standard_Boolean clearChildren = Standard_True);

		/****************** ForgetAttribute ******************/
		/**** md5 signature: e72ba5b0453e41eca721688844ba10a0 ****/
		%feature("compactdefaultargs") ForgetAttribute;
		%feature("autodoc", "Forgets an attribute from the current label, setting its forgotten status true and its valid status false. raises if the attribute is not in the structure.

Parameters
----------
anAttribute: TDF_Attribute

Returns
-------
None
") ForgetAttribute;
		void ForgetAttribute(const opencascade::handle<TDF_Attribute> & anAttribute);

		/****************** ForgetAttribute ******************/
		/**** md5 signature: 52de4f1eac4c1d719dc2240e16600cdd ****/
		%feature("compactdefaultargs") ForgetAttribute;
		%feature("autodoc", "Forgets the attribute of guid <aguid> from the current label . if the attribute doesn't exist returns false. otherwise returns true.

Parameters
----------
aguid: Standard_GUID

Returns
-------
bool
") ForgetAttribute;
		Standard_Boolean ForgetAttribute(const Standard_GUID & aguid);

		/****************** HasAttribute ******************/
		/**** md5 signature: c83a3a57dd33408208dae228eee63622 ****/
		%feature("compactdefaultargs") HasAttribute;
		%feature("autodoc", "Returns true if this label has at least one attribute.

Returns
-------
bool
") HasAttribute;
		Standard_Boolean HasAttribute();

		/****************** HasChild ******************/
		/**** md5 signature: a154ee7ab861537ddf2ce2de1cdad10c ****/
		%feature("compactdefaultargs") HasChild;
		%feature("autodoc", "Returns true if this label has at least one child.

Returns
-------
bool
") HasChild;
		Standard_Boolean HasChild();

		/****************** HasGreaterNode ******************/
		/**** md5 signature: 1b115e58390ef40597d4a570dc9420ff ****/
		%feature("compactdefaultargs") HasGreaterNode;
		%feature("autodoc", "Returns true if node address of <self> is greater than <otherlabel> one. used to quickly sort labels (not on entry criterion). //! -c++: inline.

Parameters
----------
otherLabel: TDF_Label

Returns
-------
bool
") HasGreaterNode;
		Standard_Boolean HasGreaterNode(const TDF_Label & otherLabel);

		/****************** HasLowerNode ******************/
		/**** md5 signature: 1929eebd8759cc1a4390e4dd4b079b88 ****/
		%feature("compactdefaultargs") HasLowerNode;
		%feature("autodoc", "Returns true if node address of <self> is lower than <otherlabel> one. used to quickly sort labels (not on entry criterion). //! -c++: inline.

Parameters
----------
otherLabel: TDF_Label

Returns
-------
bool
") HasLowerNode;
		Standard_Boolean HasLowerNode(const TDF_Label & otherLabel);

		/****************** Imported ******************/
		/**** md5 signature: e00dc1ebd8c5a21a287230a63b0d04c4 ****/
		%feature("compactdefaultargs") Imported;
		%feature("autodoc", "Sets or unsets <self> and all its descendants as imported label, according to <astatus>.

Parameters
----------
aStatus: bool

Returns
-------
None
") Imported;
		void Imported(const Standard_Boolean aStatus);

		/****************** IsAttribute ******************/
		/**** md5 signature: d4c3cd3354e07d22381503542a5e16aa ****/
		%feature("compactdefaultargs") IsAttribute;
		%feature("autodoc", "Returns true if <self> owns an attribute with <anid> as id.

Parameters
----------
anID: Standard_GUID

Returns
-------
bool
") IsAttribute;
		Standard_Boolean IsAttribute(const Standard_GUID & anID);

		/****************** IsDescendant ******************/
		/**** md5 signature: c4072a23dbe117ddbc6d1257b53382e4 ****/
		%feature("compactdefaultargs") IsDescendant;
		%feature("autodoc", "Returns true if <self> is a descendant of <alabel>. attention: every label is its own descendant.

Parameters
----------
aLabel: TDF_Label

Returns
-------
bool
") IsDescendant;
		Standard_Boolean IsDescendant(const TDF_Label & aLabel);

		/****************** IsDifferent ******************/
		/**** md5 signature: 06534e200fafc26109ed216afd68537f ****/
		%feature("compactdefaultargs") IsDifferent;
		%feature("autodoc", "No available documentation.

Parameters
----------
aLabel: TDF_Label

Returns
-------
bool
") IsDifferent;
		Standard_Boolean IsDifferent(const TDF_Label & aLabel);

		/****************** IsEqual ******************/
		/**** md5 signature: 70468734b4ece003f2edac176a08a757 ****/
		%feature("compactdefaultargs") IsEqual;
		%feature("autodoc", "Returns true if the <alabel> is equal to me (same labelnode*).

Parameters
----------
aLabel: TDF_Label

Returns
-------
bool
") IsEqual;
		Standard_Boolean IsEqual(const TDF_Label & aLabel);

		/****************** IsImported ******************/
		/**** md5 signature: fb7a79457fc419ced96fb68afd83327e ****/
		%feature("compactdefaultargs") IsImported;
		%feature("autodoc", "Returns true if the <alabel> is imported.

Returns
-------
bool
") IsImported;
		Standard_Boolean IsImported();

		/****************** IsNull ******************/
		/**** md5 signature: eab2964eabd2f0636e5f767661fb72a9 ****/
		%feature("compactdefaultargs") IsNull;
		%feature("autodoc", "Returns true if the <alabel> is null, i.e. it has not been included in the data framework.

Returns
-------
bool
") IsNull;
		Standard_Boolean IsNull();

		/****************** IsRoot ******************/
		/**** md5 signature: 9d981f423106a71cbae38fc5c56749f7 ****/
		%feature("compactdefaultargs") IsRoot;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsRoot;
		Standard_Boolean IsRoot();

		/****************** MayBeModified ******************/
		/**** md5 signature: f0df85b4481bf058c26aca9399b8068b ****/
		%feature("compactdefaultargs") MayBeModified;
		%feature("autodoc", "Returns true if <self> or a descendant of <self> owns attributes not yet available in transaction 0. it means at least one of their attributes is new, modified or deleted.

Returns
-------
bool
") MayBeModified;
		Standard_Boolean MayBeModified();

		/****************** NbAttributes ******************/
		/**** md5 signature: 030fc1ab36c5ed65e9d9eafc56462331 ****/
		%feature("compactdefaultargs") NbAttributes;
		%feature("autodoc", "Returns the number of attributes.

Returns
-------
int
") NbAttributes;
		Standard_Integer NbAttributes();

		/****************** NbChildren ******************/
		/**** md5 signature: 4cd749dbf8e93e1f47a795e922eb497f ****/
		%feature("compactdefaultargs") NbChildren;
		%feature("autodoc", "Returns the number of children.

Returns
-------
int
") NbChildren;
		Standard_Integer NbChildren();

		/****************** NewChild ******************/
		/**** md5 signature: f3a9f914d60ad0eee36e9c24bab2ecef ****/
		%feature("compactdefaultargs") NewChild;
		%feature("autodoc", "Create a new child label of me using autoamtic delivery tags provided by tagsource.

Returns
-------
TDF_Label
") NewChild;
		TDF_Label NewChild();

		/****************** Nullify ******************/
		/**** md5 signature: 1915d5159e87738b7b9af9d5accf4c6e ****/
		%feature("compactdefaultargs") Nullify;
		%feature("autodoc", "Nullifies the label.

Returns
-------
None
") Nullify;
		void Nullify();

		/****************** ResumeAttribute ******************/
		/**** md5 signature: e493b22327bc19ec2b05a27c84f03e3b ****/
		%feature("compactdefaultargs") ResumeAttribute;
		%feature("autodoc", "Undo forget action, setting its forgotten status false and its valid status true. raises if the attribute is not in the structure.

Parameters
----------
anAttribute: TDF_Attribute

Returns
-------
None
") ResumeAttribute;
		void ResumeAttribute(const opencascade::handle<TDF_Attribute> & anAttribute);

		/****************** Root ******************/
		/**** md5 signature: 8d91e6b3e48b0dcd1ed6725e1e277a57 ****/
		%feature("compactdefaultargs") Root;
		%feature("autodoc", "Returns the root label root of the data structure. this has a depth of 0. exceptions: standard_nullobject if this label is null. this is because a null object can have no depth.

Returns
-------
TDF_Label
") Root;
		const TDF_Label Root();

		/****************** Tag ******************/
		/**** md5 signature: 791177513adcbc21ede495c094d89fd2 ****/
		%feature("compactdefaultargs") Tag;
		%feature("autodoc", "Returns the tag of the label. this is the integer assigned randomly to a label in a data framework. this integer is used to identify this label in an entry.

Returns
-------
int
") Tag;
		Standard_Integer Tag();

		/****************** Transaction ******************/
		/**** md5 signature: 00c48137a99575bfa5cfadde8fb37954 ****/
		%feature("compactdefaultargs") Transaction;
		%feature("autodoc", "Returns the current transaction index.

Returns
-------
int
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

/***************************
* class TDF_LabelMapHasher *
***************************/
class TDF_LabelMapHasher {
	public:
		/****************** HashCode ******************/
		/**** md5 signature: 2cdcc033ac044fed1fb3a8fdba71cfaf ****/
		%feature("compactdefaultargs") HashCode;
		%feature("autodoc", "Computes a hash code for the given label, in the range [1, theupperbound] @param thelabel the label which hash code is to be computed @param theupperbound the upper bound of the range a computing hash code must be within returns a computed hash code, in the range [1, theupperbound].

Parameters
----------
theLabel: TDF_Label
theUpperBound: int

Returns
-------
int
") HashCode;
		static Standard_Integer HashCode(const TDF_Label & theLabel, const Standard_Integer theUpperBound);

		/****************** IsEqual ******************/
		/**** md5 signature: b850e580db72fa846faf5aeaf4129849 ****/
		%feature("compactdefaultargs") IsEqual;
		%feature("autodoc", "Returns true when the two keys are the same. two same keys must have the same hashcode, the contrary is not necessary.

Parameters
----------
aLab1: TDF_Label
aLab2: TDF_Label

Returns
-------
bool
") IsEqual;
		static Standard_Boolean IsEqual(const TDF_Label & aLab1, const TDF_Label & aLab2);

};


%extend TDF_LabelMapHasher {
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
		/****************** TDF_RelocationTable ******************/
		/**** md5 signature: 38f2ff8293692722818bcc491eb48985 ****/
		%feature("compactdefaultargs") TDF_RelocationTable;
		%feature("autodoc", "Creates an relocation table. <selfrelocate> says if a value without explicit relocation is its own relocation.

Parameters
----------
selfRelocate: bool,optional
	default value is Standard_False

Returns
-------
None
") TDF_RelocationTable;
		 TDF_RelocationTable(const Standard_Boolean selfRelocate = Standard_False);

		/****************** AfterRelocate ******************/
		/**** md5 signature: d84076339c941ed8b0d1754325781c2a ****/
		%feature("compactdefaultargs") AfterRelocate;
		%feature("autodoc", "No available documentation.

Parameters
----------
afterRelocate: bool

Returns
-------
None
") AfterRelocate;
		void AfterRelocate(const Standard_Boolean afterRelocate);

		/****************** AfterRelocate ******************/
		/**** md5 signature: 697253380b685d8b61b28d4397896f5e ****/
		%feature("compactdefaultargs") AfterRelocate;
		%feature("autodoc", "Returns <myafterrelocate>.

Returns
-------
bool
") AfterRelocate;
		Standard_Boolean AfterRelocate();

		/****************** AttributeTable ******************/
		/**** md5 signature: 1273cc558ecffa17c66d96aae42a6744 ****/
		%feature("compactdefaultargs") AttributeTable;
		%feature("autodoc", "Returns <myattributetable> to be used or updated.

Returns
-------
TDF_AttributeDataMap
") AttributeTable;
		TDF_AttributeDataMap & AttributeTable();

		/****************** Clear ******************/
		/**** md5 signature: ae54be580b423a6eadbe062e0bdb44c2 ****/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "Clears the relocation dictionnary, but lets the self relocation flag to its current value.

Returns
-------
None
") Clear;
		void Clear();

		/****************** HasRelocation ******************/
		/**** md5 signature: a28d159840ab7cb08cc986078d0af75d ****/
		%feature("compactdefaultargs") HasRelocation;
		%feature("autodoc", "Finds the relocation value of <asourcelabel> and returns it into <atargetlabel>. //! (see above selfrelocate method for more explanation about the method behavior).

Parameters
----------
aSourceLabel: TDF_Label
aTargetLabel: TDF_Label

Returns
-------
bool
") HasRelocation;
		Standard_Boolean HasRelocation(const TDF_Label & aSourceLabel, TDF_Label & aTargetLabel);

		/****************** HasRelocation ******************/
		/**** md5 signature: 5f5b89c3575ed75c19cb9e22bf8759f6 ****/
		%feature("compactdefaultargs") HasRelocation;
		%feature("autodoc", "Finds the relocation value of <asourceattribute> and returns it into <atargetattribute>. //! (see above selfrelocate method for more explanation about the method behavior).

Parameters
----------
aSourceAttribute: TDF_Attribute
aTargetAttribute: TDF_Attribute

Returns
-------
bool
") HasRelocation;
		Standard_Boolean HasRelocation(const opencascade::handle<TDF_Attribute> & aSourceAttribute, opencascade::handle<TDF_Attribute> & aTargetAttribute);

		/****************** HasTransientRelocation ******************/
		/**** md5 signature: 3adbba699110e4d44816ab54d56a1b5d ****/
		%feature("compactdefaultargs") HasTransientRelocation;
		%feature("autodoc", "Finds the relocation value of <asourcetransient> and returns it into <atargettransient>. //! (see above selfrelocate method for more explanation about the method behavior).

Parameters
----------
aSourceTransient: Standard_Transient
aTargetTransient: Standard_Transient

Returns
-------
bool
") HasTransientRelocation;
		Standard_Boolean HasTransientRelocation(const opencascade::handle<Standard_Transient> & aSourceTransient, opencascade::handle<Standard_Transient> & aTargetTransient);

		/****************** LabelTable ******************/
		/**** md5 signature: 485da555ceb4d57157014e91d8c611ce ****/
		%feature("compactdefaultargs") LabelTable;
		%feature("autodoc", "Returns <mylabeltable> to be used or updated.

Returns
-------
TDF_LabelDataMap
") LabelTable;
		TDF_LabelDataMap & LabelTable();

		/****************** SelfRelocate ******************/
		/**** md5 signature: c384422c13e6298f25b8fd25d61a98f6 ****/
		%feature("compactdefaultargs") SelfRelocate;
		%feature("autodoc", "Sets <myselfrelocate> to <selfrelocate>. //! this flag affects the hasrelocation method behavior like this: //! <myselfrelocate> == false: //! if no relocation object is found in the map, a null object is returned //! <myselfrelocate> == true: //! if no relocation object is found in the map, the method assumes the source object is relocation value; so the source object is returned as target object.

Parameters
----------
selfRelocate: bool

Returns
-------
None
") SelfRelocate;
		void SelfRelocate(const Standard_Boolean selfRelocate);

		/****************** SelfRelocate ******************/
		/**** md5 signature: fa3257a03fc9877898b39ac53bcaa7c5 ****/
		%feature("compactdefaultargs") SelfRelocate;
		%feature("autodoc", "Returns <myselfrelocate>.

Returns
-------
bool
") SelfRelocate;
		Standard_Boolean SelfRelocate();

		/****************** SetRelocation ******************/
		/**** md5 signature: cf4c390ae41b6368257eab2f8d175ae0 ****/
		%feature("compactdefaultargs") SetRelocation;
		%feature("autodoc", "Sets the relocation value of <asourcelabel> to <atargetlabel>.

Parameters
----------
aSourceLabel: TDF_Label
aTargetLabel: TDF_Label

Returns
-------
None
") SetRelocation;
		void SetRelocation(const TDF_Label & aSourceLabel, const TDF_Label & aTargetLabel);

		/****************** SetRelocation ******************/
		/**** md5 signature: 5c896d8b5adfe05284f457ac0be56fa0 ****/
		%feature("compactdefaultargs") SetRelocation;
		%feature("autodoc", "Sets the relocation value of <asourceattribute> to <atargetattribute>.

Parameters
----------
aSourceAttribute: TDF_Attribute
aTargetAttribute: TDF_Attribute

Returns
-------
None
") SetRelocation;
		void SetRelocation(const opencascade::handle<TDF_Attribute> & aSourceAttribute, const opencascade::handle<TDF_Attribute> & aTargetAttribute);

		/****************** SetTransientRelocation ******************/
		/**** md5 signature: 1428ba1b8d2b28e81dec5e977988a35a ****/
		%feature("compactdefaultargs") SetTransientRelocation;
		%feature("autodoc", "Sets the relocation value of <asourcetransient> to <atargettransient>.

Parameters
----------
aSourceTransient: Standard_Transient
aTargetTransient: Standard_Transient

Returns
-------
None
") SetTransientRelocation;
		void SetTransientRelocation(const opencascade::handle<Standard_Transient> & aSourceTransient, const opencascade::handle<Standard_Transient> & aTargetTransient);

		/****************** TargetAttributeMap ******************/
		/**** md5 signature: 26293a13506fac54e0b8cded12cb61f8 ****/
		%feature("compactdefaultargs") TargetAttributeMap;
		%feature("autodoc", "Fills <anattributemap> with target relocation attributes. <anattributemap> is not cleared before use.

Parameters
----------
anAttributeMap: TDF_AttributeMap

Returns
-------
None
") TargetAttributeMap;
		void TargetAttributeMap(TDF_AttributeMap & anAttributeMap);

		/****************** TargetLabelMap ******************/
		/**** md5 signature: 083517199b8634cdfc3a5eba3e4e7d70 ****/
		%feature("compactdefaultargs") TargetLabelMap;
		%feature("autodoc", "Fills <alabelmap> with target relocation labels. <alabelmap> is not cleared before use.

Parameters
----------
aLabelMap: TDF_LabelMap

Returns
-------
None
") TargetLabelMap;
		void TargetLabelMap(TDF_LabelMap & aLabelMap);

		/****************** TransientTable ******************/
		/**** md5 signature: 18c6e034e4269a22870ec5ff65bea9d9 ****/
		%feature("compactdefaultargs") TransientTable;
		%feature("autodoc", "Returns <mytransienttable> to be used or updated.

Returns
-------
TColStd_IndexedDataMapOfTransientTransient
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
		/****************** CountLabels ******************/
		/**** md5 signature: 357345a4d8f0de55201bd2a93ce4fd20 ****/
		%feature("compactdefaultargs") CountLabels;
		%feature("autodoc", "Adds the labels of <alabellist> to <alabelmap> if they are unbound, or increases their reference counters. at the end of the process, <alabellist> contains only the added labels.

Parameters
----------
aLabelList: TDF_LabelList
aLabelMap: TDF_LabelIntegerMap

Returns
-------
None
") CountLabels;
		static void CountLabels(TDF_LabelList & aLabelList, TDF_LabelIntegerMap & aLabelMap);

		/****************** DeductLabels ******************/
		/**** md5 signature: 89cbe0c451df6ab6d247cfe46a32b570 ****/
		%feature("compactdefaultargs") DeductLabels;
		%feature("autodoc", "Decreases the reference counters of the labels of <alabellist> to <alabelmap>, and removes labels with null counter. at the end of the process, <alabellist> contains only the suppressed labels.

Parameters
----------
aLabelList: TDF_LabelList
aLabelMap: TDF_LabelIntegerMap

Returns
-------
None
") DeductLabels;
		static void DeductLabels(TDF_LabelList & aLabelList, TDF_LabelIntegerMap & aLabelMap);

		/****************** Entry ******************/
		/**** md5 signature: 5846182a2901126a6abbd7b994d69204 ****/
		%feature("compactdefaultargs") Entry;
		%feature("autodoc", "Returns the entry for the label alabel in the form of the ascii character string anentry containing the tag list for alabel.

Parameters
----------
aLabel: TDF_Label
anEntry: TCollection_AsciiString

Returns
-------
None
") Entry;
		static void Entry(const TDF_Label & aLabel, TCollection_AsciiString & anEntry);

		/****************** IsSelfContained ******************/
		/**** md5 signature: 022b907b8de1841e61e891cd408215cc ****/
		%feature("compactdefaultargs") IsSelfContained;
		%feature("autodoc", "Returns true if <alabel> and its descendants reference only attributes or labels attached to themselves.

Parameters
----------
aLabel: TDF_Label

Returns
-------
bool
") IsSelfContained;
		static Standard_Boolean IsSelfContained(const TDF_Label & aLabel);

		/****************** IsSelfContained ******************/
		/**** md5 signature: e8c306fe67c7f2dbdab50a397da507fa ****/
		%feature("compactdefaultargs") IsSelfContained;
		%feature("autodoc", "Returns true if <alabel> and its descendants reference only attributes or labels attached to themselves and kept by <afilter>.

Parameters
----------
aLabel: TDF_Label
aFilter: TDF_IDFilter

Returns
-------
bool
") IsSelfContained;
		static Standard_Boolean IsSelfContained(const TDF_Label & aLabel, const TDF_IDFilter & aFilter);

		/****************** Label ******************/
		/**** md5 signature: a0b6165d731202c705d534ce73a4b9e4 ****/
		%feature("compactdefaultargs") Label;
		%feature("autodoc", "Returns the label expressed by <anentry>; creates the label if it does not exist and if <create> is true.

Parameters
----------
aDF: TDF_Data
anEntry: TCollection_AsciiString
aLabel: TDF_Label
create: bool,optional
	default value is Standard_False

Returns
-------
None
") Label;
		static void Label(const opencascade::handle<TDF_Data> & aDF, const TCollection_AsciiString & anEntry, TDF_Label & aLabel, const Standard_Boolean create = Standard_False);

		/****************** Label ******************/
		/**** md5 signature: 06e6f21799eb9ca00a6456b866227df2 ****/
		%feature("compactdefaultargs") Label;
		%feature("autodoc", "Returns the label expressed by <anentry>; creates the label if it does not exist and if <create> is true.

Parameters
----------
aDF: TDF_Data
anEntry: char *
aLabel: TDF_Label
create: bool,optional
	default value is Standard_False

Returns
-------
None
") Label;
		static void Label(const opencascade::handle<TDF_Data> & aDF, const char * anEntry, TDF_Label & aLabel, const Standard_Boolean create = Standard_False);

		/****************** Label ******************/
		/**** md5 signature: 86d4f246c23ebec41b9cd05f0e7f6a0a ****/
		%feature("compactdefaultargs") Label;
		%feature("autodoc", "Returns the label expressed by <anentry>; creates the label if it does not exist and if <create> is true.

Parameters
----------
aDF: TDF_Data
aTagList: TColStd_ListOfInteger
aLabel: TDF_Label
create: bool,optional
	default value is Standard_False

Returns
-------
None
") Label;
		static void Label(const opencascade::handle<TDF_Data> & aDF, const TColStd_ListOfInteger & aTagList, TDF_Label & aLabel, const Standard_Boolean create = Standard_False);

		/****************** NbAttributes ******************/
		/**** md5 signature: 0efcc2b4739048c06cdd577bafe92933 ****/
		%feature("compactdefaultargs") NbAttributes;
		%feature("autodoc", "Returns the total number of attributes attached to the labels dependent on the label alabel. the attributes of alabel are also included in this figure. this information is useful in setting the size of an array.

Parameters
----------
aLabel: TDF_Label

Returns
-------
int
") NbAttributes;
		static Standard_Integer NbAttributes(const TDF_Label & aLabel);

		/****************** NbAttributes ******************/
		/**** md5 signature: bd5e4de86e2608e1e8cdc01d33796723 ****/
		%feature("compactdefaultargs") NbAttributes;
		%feature("autodoc", "Returns the number of attributes of the tree, selected by a<filter>, including those of <alabel>.

Parameters
----------
aLabel: TDF_Label
aFilter: TDF_IDFilter

Returns
-------
int
") NbAttributes;
		static Standard_Integer NbAttributes(const TDF_Label & aLabel, const TDF_IDFilter & aFilter);

		/****************** NbLabels ******************/
		/**** md5 signature: e5e31f60b09a76eb273e83856a43787d ****/
		%feature("compactdefaultargs") NbLabels;
		%feature("autodoc", "Returns the number of labels of the tree, including <alabel>. alabel is also included in this figure. this information is useful in setting the size of an array.

Parameters
----------
aLabel: TDF_Label

Returns
-------
int
") NbLabels;
		static Standard_Integer NbLabels(const TDF_Label & aLabel);

		/****************** OutReferences ******************/
		/**** md5 signature: 79be4b27ee58ab3a25c2b0bf6c158456 ****/
		%feature("compactdefaultargs") OutReferences;
		%feature("autodoc", "Returns in <atts> the referenced attributes. caution: <atts> is not cleared before use!.

Parameters
----------
aLabel: TDF_Label
atts: TDF_AttributeMap

Returns
-------
None
") OutReferences;
		static void OutReferences(const TDF_Label & aLabel, TDF_AttributeMap & atts);

		/****************** OutReferences ******************/
		/**** md5 signature: 16f5367a11932dbebdc9488dc199de94 ****/
		%feature("compactdefaultargs") OutReferences;
		%feature("autodoc", "Returns in <atts> the referenced attributes and kept by <afilterforreferences>. it considers only the referers kept by <afilterforreferers>. caution: <atts> is not cleared before use!.

Parameters
----------
aLabel: TDF_Label
aFilterForReferers: TDF_IDFilter
aFilterForReferences: TDF_IDFilter
atts: TDF_AttributeMap

Returns
-------
None
") OutReferences;
		static void OutReferences(const TDF_Label & aLabel, const TDF_IDFilter & aFilterForReferers, const TDF_IDFilter & aFilterForReferences, TDF_AttributeMap & atts);

		/****************** OutReferers ******************/
		/**** md5 signature: 309feefb269cc909617dd0540f46f416 ****/
		%feature("compactdefaultargs") OutReferers;
		%feature("autodoc", "Returns in <theatts> the attributes having out references. //! caution: <theatts> is not cleared before use!.

Parameters
----------
theLabel: TDF_Label
theAtts: TDF_AttributeMap

Returns
-------
None
") OutReferers;
		static void OutReferers(const TDF_Label & theLabel, TDF_AttributeMap & theAtts);

		/****************** OutReferers ******************/
		/**** md5 signature: 219fec7089c087ee380bfd07f6ed1f30 ****/
		%feature("compactdefaultargs") OutReferers;
		%feature("autodoc", "Returns in <atts> the attributes having out references and kept by <afilterforreferers>. it considers only the references kept by <afilterforreferences>. caution: <atts> is not cleared before use!.

Parameters
----------
aLabel: TDF_Label
aFilterForReferers: TDF_IDFilter
aFilterForReferences: TDF_IDFilter
atts: TDF_AttributeMap

Returns
-------
None
") OutReferers;
		static void OutReferers(const TDF_Label & aLabel, const TDF_IDFilter & aFilterForReferers, const TDF_IDFilter & aFilterForReferences, TDF_AttributeMap & atts);

		/****************** RelocateLabel ******************/
		/**** md5 signature: a790ebba517221dfa8200224bae0d105 ****/
		%feature("compactdefaultargs") RelocateLabel;
		%feature("autodoc", "Returns the label having the same sub-entry as <alabel> but located as descendant as <toroot> instead of <fromroot>. //! exemple : //! alabel = 0:3:24:7:2:7 fromroot = 0:3:24 toroot = 0:5 returned label = 0:5:7:2:7.

Parameters
----------
aSourceLabel: TDF_Label
fromRoot: TDF_Label
toRoot: TDF_Label
aTargetLabel: TDF_Label
create: bool,optional
	default value is Standard_False

Returns
-------
None
") RelocateLabel;
		static void RelocateLabel(const TDF_Label & aSourceLabel, const TDF_Label & fromRoot, const TDF_Label & toRoot, TDF_Label & aTargetLabel, const Standard_Boolean create = Standard_False);

		/****************** TagList ******************/
		/**** md5 signature: ae6c070a2430d04009301015bfb0ae16 ****/
		%feature("compactdefaultargs") TagList;
		%feature("autodoc", "Returns the entry of <alabel> as list of integers in <ataglist>.

Parameters
----------
aLabel: TDF_Label
aTagList: TColStd_ListOfInteger

Returns
-------
None
") TagList;
		static void TagList(const TDF_Label & aLabel, TColStd_ListOfInteger & aTagList);

		/****************** TagList ******************/
		/**** md5 signature: 7093f47c7c5cb37c8352971aa776e927 ****/
		%feature("compactdefaultargs") TagList;
		%feature("autodoc", "Returns the entry expressed by <anentry> as list of integers in <ataglist>.

Parameters
----------
anEntry: TCollection_AsciiString
aTagList: TColStd_ListOfInteger

Returns
-------
None
") TagList;
		static void TagList(const TCollection_AsciiString & anEntry, TColStd_ListOfInteger & aTagList);

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
		/****************** TDF_Transaction ******************/
		/**** md5 signature: 25679619d6b41673c52ce6c41bcd1f82 ****/
		%feature("compactdefaultargs") TDF_Transaction;
		%feature("autodoc", "Creates an empty transaction context, unable to be opened.

Parameters
----------
aName: TCollection_AsciiString,optional
	default value is ""

Returns
-------
None
") TDF_Transaction;
		 TDF_Transaction(const TCollection_AsciiString & aName = "");

		/****************** TDF_Transaction ******************/
		/**** md5 signature: 19cf46609d259426ac1948baa7d6a59d ****/
		%feature("compactdefaultargs") TDF_Transaction;
		%feature("autodoc", "Creates a transaction context on <adf>, ready to be opened.

Parameters
----------
aDF: TDF_Data
aName: TCollection_AsciiString,optional
	default value is ""

Returns
-------
None
") TDF_Transaction;
		 TDF_Transaction(const opencascade::handle<TDF_Data> & aDF, const TCollection_AsciiString & aName = "");

		/****************** Abort ******************/
		/**** md5 signature: 1fff85d2b99366704df7b68c63810e9a ****/
		%feature("compactdefaultargs") Abort;
		%feature("autodoc", "Aborts the transactions until and including the current opened one.

Returns
-------
None
") Abort;
		void Abort();

		/****************** Commit ******************/
		/**** md5 signature: 06a824bb56931167b77b19d90c6fc733 ****/
		%feature("compactdefaultargs") Commit;
		%feature("autodoc", "Commits the transactions until and including the current opened one.

Parameters
----------
withDelta: bool,optional
	default value is Standard_False

Returns
-------
opencascade::handle<TDF_Delta>
") Commit;
		opencascade::handle<TDF_Delta> Commit(const Standard_Boolean withDelta = Standard_False);

		/****************** Data ******************/
		/**** md5 signature: 04ec1a781153c5a50d2756cf01f47e1c ****/
		%feature("compactdefaultargs") Data;
		%feature("autodoc", "Returns the data from tdf.

Returns
-------
opencascade::handle<TDF_Data>
") Data;
		opencascade::handle<TDF_Data> Data();

		/****************** Initialize ******************/
		/**** md5 signature: 6f0c86dc4ece77377bc8538f444250f5 ****/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "Aborts all the transactions on <mydf> and sets <adf> to build a transaction context on <adf>, ready to be opened.

Parameters
----------
aDF: TDF_Data

Returns
-------
None
") Initialize;
		void Initialize(const opencascade::handle<TDF_Data> & aDF);

		/****************** IsOpen ******************/
		/**** md5 signature: bdd2e1a97b3f8d14fccdfc3ccf008748 ****/
		%feature("compactdefaultargs") IsOpen;
		%feature("autodoc", "Returns true if the transaction is open.

Returns
-------
bool
") IsOpen;
		Standard_Boolean IsOpen();

		/****************** Name ******************/
		/**** md5 signature: 8e64a3d42cb69d5f0c279aca58e35ec7 ****/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "Returns the transaction name.

Returns
-------
TCollection_AsciiString
") Name;
		const TCollection_AsciiString & Name();

		/****************** Open ******************/
		/**** md5 signature: bd3c8ff39ee6d8b3e3af652b118bf3d7 ****/
		%feature("compactdefaultargs") Open;
		%feature("autodoc", "If not yet done, opens a new transaction on <mydf>. returns the index of the just opened transaction. //! it raises domainerror if the transaction is already open, and nullobject if there is no current data framework.

Returns
-------
int
") Open;
		Standard_Integer Open();

		/****************** Transaction ******************/
		/**** md5 signature: 00c48137a99575bfa5cfadde8fb37954 ****/
		%feature("compactdefaultargs") Transaction;
		%feature("autodoc", "Returns the number of the transaction opened by <self>.

Returns
-------
int
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
		/****************** TDF_DeltaOnAddition ******************/
		/**** md5 signature: ed3da941e5f1deaad2db5d3a5727382f ****/
		%feature("compactdefaultargs") TDF_DeltaOnAddition;
		%feature("autodoc", "Creates a tdf_deltaonaddition.

Parameters
----------
anAtt: TDF_Attribute

Returns
-------
None
") TDF_DeltaOnAddition;
		 TDF_DeltaOnAddition(const opencascade::handle<TDF_Attribute> & anAtt);

		/****************** Apply ******************/
		/**** md5 signature: c4ff9d381df7974c268b00280582cc3d ****/
		%feature("compactdefaultargs") Apply;
		%feature("autodoc", "Applies the delta to the attribute.

Returns
-------
None
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
		/****************** TDF_DeltaOnForget ******************/
		/**** md5 signature: 10a024c61102a87e31a2cdebe20ea666 ****/
		%feature("compactdefaultargs") TDF_DeltaOnForget;
		%feature("autodoc", "Creates a tdf_deltaonforget.

Parameters
----------
anAtt: TDF_Attribute

Returns
-------
None
") TDF_DeltaOnForget;
		 TDF_DeltaOnForget(const opencascade::handle<TDF_Attribute> & anAtt);

		/****************** Apply ******************/
		/**** md5 signature: c4ff9d381df7974c268b00280582cc3d ****/
		%feature("compactdefaultargs") Apply;
		%feature("autodoc", "Applies the delta to the attribute.

Returns
-------
None
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
		/****************** TDF_DeltaOnResume ******************/
		/**** md5 signature: f7315e98137f041699fc7f9813315d83 ****/
		%feature("compactdefaultargs") TDF_DeltaOnResume;
		%feature("autodoc", "Creates a tdf_deltaonresume.

Parameters
----------
anAtt: TDF_Attribute

Returns
-------
None
") TDF_DeltaOnResume;
		 TDF_DeltaOnResume(const opencascade::handle<TDF_Attribute> & anAtt);

		/****************** Apply ******************/
		/**** md5 signature: c4ff9d381df7974c268b00280582cc3d ****/
		%feature("compactdefaultargs") Apply;
		%feature("autodoc", "Applies the delta to the attribute.

Returns
-------
None
") Apply;
		void Apply();

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
		/****************** TDF_Reference ******************/
		/**** md5 signature: f2ea02a93b4178fa1b70e2b58c4029a4 ****/
		%feature("compactdefaultargs") TDF_Reference;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") TDF_Reference;
		 TDF_Reference();


        %feature("autodoc", "1");
        %extend{
            std::string DumpToString() {
            std::stringstream s;
            self->Dump(s);
            return s.str();}
        };
		/****************** Get ******************/
		/**** md5 signature: 66afada8fc328e55fd3c204c359e42b2 ****/
		%feature("compactdefaultargs") Get;
		%feature("autodoc", "No available documentation.

Returns
-------
TDF_Label
") Get;
		TDF_Label Get();

		/****************** GetID ******************/
		/**** md5 signature: afe6002d90f641ca3ea8c9ae9f8fe97c ****/
		%feature("compactdefaultargs") GetID;
		%feature("autodoc", "No available documentation.

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
		/**** md5 signature: 3fd2cceb5586794d661dcbd7ea65fd0c ****/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "No available documentation.

Parameters
----------
I: TDF_Label
Origin: TDF_Label

Returns
-------
opencascade::handle<TDF_Reference>
") Set;
		static opencascade::handle<TDF_Reference> Set(const TDF_Label & I, const TDF_Label & Origin);

		/****************** Set ******************/
		/**** md5 signature: adf0fe6d83d2160bac99ccd871d44289 ****/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "No available documentation.

Parameters
----------
Origin: TDF_Label

Returns
-------
None
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
		/****************** TDF_TagSource ******************/
		/**** md5 signature: 4671bac7141bd20608dd9aa1837a3ee5 ****/
		%feature("compactdefaultargs") TDF_TagSource;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") TDF_TagSource;
		 TDF_TagSource();

		/****************** Get ******************/
		/**** md5 signature: ace457d697a3a35733c5ac95429cad31 ****/
		%feature("compactdefaultargs") Get;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") Get;
		Standard_Integer Get();

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

		/****************** NewChild ******************/
		/**** md5 signature: d122646bf4b49eeeeafcc33503696e8b ****/
		%feature("compactdefaultargs") NewChild;
		%feature("autodoc", "Find (or create) a tagsource attribute located at <l> and make a new child label. tagsource methods =================.

Parameters
----------
L: TDF_Label

Returns
-------
TDF_Label
") NewChild;
		static TDF_Label NewChild(const TDF_Label & L);

		/****************** NewChild ******************/
		/**** md5 signature: 9a3266175cf9e46eeaa91114b72614e8 ****/
		%feature("compactdefaultargs") NewChild;
		%feature("autodoc", "No available documentation.

Returns
-------
TDF_Label
") NewChild;
		TDF_Label NewChild();

		/****************** NewEmpty ******************/
		/**** md5 signature: c6d13c9ecc64c6c803b6e119e8216934 ****/
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TDF_Attribute>
") NewEmpty;
		opencascade::handle<TDF_Attribute> NewEmpty();

		/****************** NewTag ******************/
		/**** md5 signature: d8f8843e8761eb919b6b2894481280d3 ****/
		%feature("compactdefaultargs") NewTag;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NewTag;
		Standard_Integer NewTag();

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
with: TDF_Attribute

Returns
-------
None
") Restore;
		void Restore(const opencascade::handle<TDF_Attribute> & with);

		/****************** Set ******************/
		/**** md5 signature: 4a22c1159f9e7fb5d847d5e3a74771b3 ****/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "Find, or create, a tagsource attribute. the tagsource attribute is returned.

Parameters
----------
label: TDF_Label

Returns
-------
opencascade::handle<TDF_TagSource>
") Set;
		static opencascade::handle<TDF_TagSource> Set(const TDF_Label & label);

		/****************** Set ******************/
		/**** md5 signature: af44522e43780b1b24ce7e4ac49d204f ****/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "Tdf_attribute methods =====================.

Parameters
----------
T: int

Returns
-------
None
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
		/****************** TDF_DefaultDeltaOnModification ******************/
		/**** md5 signature: d3877c39eb02e828d91f16605ef8e6ef ****/
		%feature("compactdefaultargs") TDF_DefaultDeltaOnModification;
		%feature("autodoc", "Creates a tdf_defaultdeltaonmodification. <anattribute> must be the backup copy.

Parameters
----------
anAttribute: TDF_Attribute

Returns
-------
None
") TDF_DefaultDeltaOnModification;
		 TDF_DefaultDeltaOnModification(const opencascade::handle<TDF_Attribute> & anAttribute);

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
		/****************** TDF_DefaultDeltaOnRemoval ******************/
		/**** md5 signature: 7f65748b1a1d984527107b28b6df55a4 ****/
		%feature("compactdefaultargs") TDF_DefaultDeltaOnRemoval;
		%feature("autodoc", "Creates a tdf_defaultdeltaonremoval.

Parameters
----------
anAttribute: TDF_Attribute

Returns
-------
None
") TDF_DefaultDeltaOnRemoval;
		 TDF_DefaultDeltaOnRemoval(const opencascade::handle<TDF_Attribute> & anAttribute);

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
