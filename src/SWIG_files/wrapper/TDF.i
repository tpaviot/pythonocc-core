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
/* public enums */
enum  {
	TDF_LabelNodeImportMsk = ( int ) 0x80000000,
	TDF_LabelNodeAttModMsk = 1073741824,
	TDF_LabelNodeMayModMsk = 536870912,
	TDF_LabelNodeFlagsMsk = ( TDF_LabelNodeImportMsk | TDF_LabelNodeAttModMsk | TDF_LabelNodeMayModMsk ),
};

/* end public enums declaration */

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
%template(TDF_AttributeList) NCollection_List <opencascade::handle <TDF_Attribute>>;
%template(TDF_ListIteratorOfAttributeList) NCollection_TListIterator<opencascade::handle<TDF_Attribute>>;
%template(TDF_GUIDProgIDMap) NCollection_DoubleMap <Standard_GUID , TCollection_ExtendedString , Standard_GUID , TCollection_ExtendedString>;
%template(TDF_AttributeArray1) NCollection_Array1 <opencascade::handle <TDF_Attribute>>;

%extend NCollection_Array1 <opencascade::handle <TDF_Attribute>> {
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
%template(TDF_AttributeMap) NCollection_Map <opencascade::handle <TDF_Attribute>, TColStd_MapTransientHasher>;
%template(TDF_IDList) NCollection_List <Standard_GUID>;
%template(TDF_ListIteratorOfIDList) NCollection_TListIterator<Standard_GUID>;
%template(TDF_LabelSequence) NCollection_Sequence <TDF_Label>;
%template(TDF_AttributeDeltaList) NCollection_List <opencascade::handle <TDF_AttributeDelta>>;
%template(TDF_ListIteratorOfAttributeDeltaList) NCollection_TListIterator<opencascade::handle<TDF_AttributeDelta>>;
%template(TDF_LabelDoubleMap) NCollection_DoubleMap <TDF_Label , TDF_Label , TDF_LabelMapHasher , TDF_LabelMapHasher>;
%template(TDF_HAllocator) opencascade::handle <NCollection_BaseAllocator>;
%template(TDF_LabelMap) NCollection_Map <TDF_Label , TDF_LabelMapHasher>;
%template(TDF_AttributeIndexedMap) NCollection_IndexedMap <opencascade::handle <TDF_Attribute>, TColStd_MapTransientHasher>;
%template(TDF_AttributeDoubleMap) NCollection_DoubleMap <opencascade::handle <TDF_Attribute>, opencascade::handle <TDF_Attribute>, TColStd_MapTransientHasher , TColStd_MapTransientHasher>;
%template(TDF_AttributeDataMap) NCollection_DataMap <opencascade::handle <TDF_Attribute>, opencascade::handle <TDF_Attribute>, TColStd_MapTransientHasher>;
%template(TDF_IDMap) NCollection_Map <Standard_GUID , Standard_GUID>;
%template(TDF_LabelDataMap) NCollection_DataMap <TDF_Label , TDF_Label , TDF_LabelMapHasher>;
%template(TDF_DeltaList) NCollection_List <opencascade::handle <TDF_Delta>>;
%template(TDF_ListIteratorOfDeltaList) NCollection_TListIterator<opencascade::handle<TDF_Delta>>;
%template(TDF_LabelIndexedMap) NCollection_IndexedMap <TDF_Label , TDF_LabelMapHasher>;
%template(TDF_LabelIntegerMap) NCollection_DataMap <TDF_Label , Standard_Integer , TDF_LabelMapHasher>;
%template(TDF_LabelList) NCollection_List <TDF_Label>;
%template(TDF_ListIteratorOfLabelList) NCollection_TListIterator<TDF_Label>;
%template(TDF_AttributeSequence) NCollection_Sequence <opencascade::handle <TDF_Attribute>>;
/* end templates declaration */

/* typedefs */
typedef NCollection_List <opencascade::handle <TDF_Attribute>> TDF_AttributeList;
typedef NCollection_List <opencascade::handle <TDF_Attribute>>::Iterator TDF_ListIteratorOfAttributeList;
typedef NCollection_DoubleMap <Standard_GUID , TCollection_ExtendedString , Standard_GUID , TCollection_ExtendedString> TDF_GUIDProgIDMap;
typedef NCollection_DoubleMap <Standard_GUID , TCollection_ExtendedString , Standard_GUID , TCollection_ExtendedString>::Iterator TDF_DoubleMapIteratorOfGUIDProgIDMap;
typedef NCollection_Array1 <opencascade::handle <TDF_Attribute>> TDF_AttributeArray1;
typedef NCollection_Map <opencascade::handle <TDF_Attribute>, TColStd_MapTransientHasher> TDF_AttributeMap;
typedef NCollection_Map <opencascade::handle <TDF_Attribute>, TColStd_MapTransientHasher>::Iterator TDF_MapIteratorOfAttributeMap;
typedef NCollection_List <Standard_GUID> TDF_IDList;
typedef NCollection_List <Standard_GUID>::Iterator TDF_ListIteratorOfIDList;
typedef NCollection_Sequence <TDF_Label> TDF_LabelSequence;
typedef NCollection_List <opencascade::handle <TDF_AttributeDelta>> TDF_AttributeDeltaList;
typedef NCollection_List <opencascade::handle <TDF_AttributeDelta>>::Iterator TDF_ListIteratorOfAttributeDeltaList;
typedef NCollection_DoubleMap <TDF_Label , TDF_Label , TDF_LabelMapHasher , TDF_LabelMapHasher> TDF_LabelDoubleMap;
typedef NCollection_DoubleMap <TDF_Label , TDF_Label , TDF_LabelMapHasher , TDF_LabelMapHasher>::Iterator TDF_DoubleMapIteratorOfLabelDoubleMap;
typedef TDF_LabelNode * TDF_LabelNodePtr;
typedef opencascade::handle <NCollection_BaseAllocator> TDF_HAllocator;
typedef NCollection_Map <TDF_Label , TDF_LabelMapHasher> TDF_LabelMap;
typedef NCollection_Map <TDF_Label , TDF_LabelMapHasher>::Iterator TDF_MapIteratorOfLabelMap;
typedef NCollection_IndexedMap <opencascade::handle <TDF_Attribute>, TColStd_MapTransientHasher> TDF_AttributeIndexedMap;
typedef NCollection_DoubleMap <opencascade::handle <TDF_Attribute>, opencascade::handle <TDF_Attribute>, TColStd_MapTransientHasher , TColStd_MapTransientHasher> TDF_AttributeDoubleMap;
typedef NCollection_DoubleMap <opencascade::handle <TDF_Attribute>, opencascade::handle <TDF_Attribute>, TColStd_MapTransientHasher , TColStd_MapTransientHasher>::Iterator TDF_DoubleMapIteratorOfAttributeDoubleMap;
typedef NCollection_DataMap <opencascade::handle <TDF_Attribute>, opencascade::handle <TDF_Attribute>, TColStd_MapTransientHasher> TDF_AttributeDataMap;
typedef NCollection_DataMap <opencascade::handle <TDF_Attribute>, opencascade::handle <TDF_Attribute>, TColStd_MapTransientHasher>::Iterator TDF_DataMapIteratorOfAttributeDataMap;
typedef NCollection_Map <Standard_GUID , Standard_GUID> TDF_IDMap;
typedef NCollection_Map <Standard_GUID , Standard_GUID>::Iterator TDF_MapIteratorOfIDMap;
typedef NCollection_DataMap <TDF_Label , TDF_Label , TDF_LabelMapHasher> TDF_LabelDataMap;
typedef NCollection_DataMap <TDF_Label , TDF_Label , TDF_LabelMapHasher>::Iterator TDF_DataMapIteratorOfLabelDataMap;
typedef NCollection_List <opencascade::handle <TDF_Delta>> TDF_DeltaList;
typedef NCollection_List <opencascade::handle <TDF_Delta>>::Iterator TDF_ListIteratorOfDeltaList;
typedef NCollection_IndexedMap <TDF_Label , TDF_LabelMapHasher> TDF_LabelIndexedMap;
typedef NCollection_DataMap <TDF_Label , Standard_Integer , TDF_LabelMapHasher> TDF_LabelIntegerMap;
typedef NCollection_DataMap <TDF_Label , Standard_Integer , TDF_LabelMapHasher>::Iterator TDF_DataMapIteratorOfLabelIntegerMap;
typedef NCollection_List <TDF_Label> TDF_LabelList;
typedef NCollection_List <TDF_Label>::Iterator TDF_ListIteratorOfLabelList;
typedef NCollection_Sequence <opencascade::handle <TDF_Attribute>> TDF_AttributeSequence;
/* end typedefs declaration */

/************
* class TDF *
************/
%rename(tdf) TDF;
class TDF {
	public:
		/****************** AddLinkGUIDToProgID ******************/
		%feature("compactdefaultargs") AddLinkGUIDToProgID;
		%feature("autodoc", "* Sets link between GUID and ProgID in hidden DataMap
	:param ID:
	:type ID: Standard_GUID
	:param ProgID:
	:type ProgID: TCollection_ExtendedString
	:rtype: void") AddLinkGUIDToProgID;
		static void AddLinkGUIDToProgID (const Standard_GUID & ID,const TCollection_ExtendedString & ProgID);

		/****************** GUIDFromProgID ******************/
		%feature("compactdefaultargs") GUIDFromProgID;
		%feature("autodoc", "* Returns True if there is GUID for given <ProgID> then GUID is returned in <ID>
	:param ProgID:
	:type ProgID: TCollection_ExtendedString
	:param ID:
	:type ID: Standard_GUID
	:rtype: bool") GUIDFromProgID;
		static Standard_Boolean GUIDFromProgID (const TCollection_ExtendedString & ProgID,Standard_GUID & ID);

		/****************** LowestID ******************/
		%feature("compactdefaultargs") LowestID;
		%feature("autodoc", "* Returns ID '00000000-0000-0000-0000-000000000000', sometimes used as null ID.
	:rtype: Standard_GUID") LowestID;
		static const Standard_GUID & LowestID ();

		/****************** ProgIDFromGUID ******************/
		%feature("compactdefaultargs") ProgIDFromGUID;
		%feature("autodoc", "* Returns True if there is ProgID for given <ID> then ProgID is returned in <ProgID>
	:param ID:
	:type ID: Standard_GUID
	:param ProgID:
	:type ProgID: TCollection_ExtendedString
	:rtype: bool") ProgIDFromGUID;
		static Standard_Boolean ProgIDFromGUID (const Standard_GUID & ID,TCollection_ExtendedString & ProgID);

		/****************** UppestID ******************/
		%feature("compactdefaultargs") UppestID;
		%feature("autodoc", "* Returns ID 'ffffffff-ffff-ffff-ffff-ffffffffffff'.
	:rtype: Standard_GUID") UppestID;
		static const Standard_GUID & UppestID ();

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
		%feature("compactdefaultargs") AddAttribute;
		%feature("autodoc", "* Adds an Attribute <other> to the label of <self>.Raises if there is already one of the same GUID fhan <other>.
	:param other:
	:type other: TDF_Attribute
	:rtype: None") AddAttribute;
		void AddAttribute (const opencascade::handle<TDF_Attribute> & other);

		/****************** AfterAddition ******************/
		%feature("compactdefaultargs") AfterAddition;
		%feature("autodoc", "* Something to do after adding an Attribute to a label.
	:rtype: void") AfterAddition;
		virtual void AfterAddition ();

		/****************** AfterResume ******************/
		%feature("compactdefaultargs") AfterResume;
		%feature("autodoc", "* Something to do after resuming an Attribute from a label.
	:rtype: void") AfterResume;
		virtual void AfterResume ();

		/****************** AfterRetrieval ******************/
		%feature("compactdefaultargs") AfterRetrieval;
		%feature("autodoc", "* Something to do AFTER creation of an attribute by persistent-transient translation. The returned status says if AfterUndo has been performed (true) or if this callback must be called once again further (false). If <forceIt> is set to true, the method MUST perform and return true. Does nothing by default and returns true.
	:param forceIt: default value is Standard_False
	:type forceIt: bool
	:rtype: bool") AfterRetrieval;
		virtual Standard_Boolean AfterRetrieval (const Standard_Boolean forceIt = Standard_False);

		/****************** AfterUndo ******************/
		%feature("compactdefaultargs") AfterUndo;
		%feature("autodoc", "* Something to do after applying <anAttDelta>. The returned status says if AfterUndo has been performed (true) or if this callback must be called once again further (false). If <forceIt> is set to true, the method MUST perform and return true. Does nothing by default and returns true.
	:param anAttDelta:
	:type anAttDelta: TDF_AttributeDelta
	:param forceIt: default value is Standard_False
	:type forceIt: bool
	:rtype: bool") AfterUndo;
		virtual Standard_Boolean AfterUndo (const opencascade::handle<TDF_AttributeDelta> & anAttDelta,const Standard_Boolean forceIt = Standard_False);

		/****************** Backup ******************/
		%feature("compactdefaultargs") Backup;
		%feature("autodoc", "* Backups the attribute. The backuped attribute is flagged 'Backuped' and not 'Valid'. //! The method does nothing: //! 1) If the attribute transaction number is equal to the current transaction number (the attribute has already been backuped). //! 2) If the attribute is not attached to a label.
	:rtype: None") Backup;
		void Backup ();

		/****************** BackupCopy ******************/
		%feature("compactdefaultargs") BackupCopy;
		%feature("autodoc", "* Copies the attribute contents into a new other attribute. It is used by Backup().
	:rtype: opencascade::handle<TDF_Attribute>") BackupCopy;
		virtual opencascade::handle<TDF_Attribute> BackupCopy ();

		/****************** BeforeCommitTransaction ******************/
		%feature("compactdefaultargs") BeforeCommitTransaction;
		%feature("autodoc", "* A callback. By default does nothing. It is called by TDF_Data::CommitTransaction() method.
	:rtype: void") BeforeCommitTransaction;
		virtual void BeforeCommitTransaction ();

		/****************** BeforeForget ******************/
		%feature("compactdefaultargs") BeforeForget;
		%feature("autodoc", "* Something to do before forgetting an Attribute to a label.
	:rtype: void") BeforeForget;
		virtual void BeforeForget ();

		/****************** BeforeRemoval ******************/
		%feature("compactdefaultargs") BeforeRemoval;
		%feature("autodoc", "* Something to do before removing an Attribute from a label.
	:rtype: void") BeforeRemoval;
		virtual void BeforeRemoval ();

		/****************** BeforeUndo ******************/
		%feature("compactdefaultargs") BeforeUndo;
		%feature("autodoc", "* Something to do before applying <anAttDelta>. The returned status says if AfterUndo has been performed (true) or if this callback must be called once again further (false). If <forceIt> is set to true, the method MUST perform and return true. Does nothing by default and returns true.
	:param anAttDelta:
	:type anAttDelta: TDF_AttributeDelta
	:param forceIt: default value is Standard_False
	:type forceIt: bool
	:rtype: bool") BeforeUndo;
		virtual Standard_Boolean BeforeUndo (const opencascade::handle<TDF_AttributeDelta> & anAttDelta,const Standard_Boolean forceIt = Standard_False);

		/****************** DeltaOnAddition ******************/
		%feature("compactdefaultargs") DeltaOnAddition;
		%feature("autodoc", "* Makes an AttributeDelta because <self> appeared. The only known use of a redefinition of this method is to return a null handle (no delta).
	:rtype: opencascade::handle<TDF_DeltaOnAddition>") DeltaOnAddition;
		virtual opencascade::handle<TDF_DeltaOnAddition> DeltaOnAddition ();

		/****************** DeltaOnForget ******************/
		%feature("compactdefaultargs") DeltaOnForget;
		%feature("autodoc", "* Makes an AttributeDelta because <self> has been forgotten.
	:rtype: opencascade::handle<TDF_DeltaOnForget>") DeltaOnForget;
		virtual opencascade::handle<TDF_DeltaOnForget> DeltaOnForget ();

		/****************** DeltaOnModification ******************/
		%feature("compactdefaultargs") DeltaOnModification;
		%feature("autodoc", "* Makes a DeltaOnModification between <self> and <anOldAttribute.
	:param anOldAttribute:
	:type anOldAttribute: TDF_Attribute
	:rtype: opencascade::handle<TDF_DeltaOnModification>") DeltaOnModification;
		virtual opencascade::handle<TDF_DeltaOnModification> DeltaOnModification (const opencascade::handle<TDF_Attribute> & anOldAttribute);

		/****************** DeltaOnModification ******************/
		%feature("compactdefaultargs") DeltaOnModification;
		%feature("autodoc", "* Applies a DeltaOnModification to <self>.
	:param aDelta:
	:type aDelta: TDF_DeltaOnModification
	:rtype: void") DeltaOnModification;
		virtual void DeltaOnModification (const opencascade::handle<TDF_DeltaOnModification> & aDelta);

		/****************** DeltaOnRemoval ******************/
		%feature("compactdefaultargs") DeltaOnRemoval;
		%feature("autodoc", "* Makes a DeltaOnRemoval on <self> because <self> has disappeared from the DS.
	:rtype: opencascade::handle<TDF_DeltaOnRemoval>") DeltaOnRemoval;
		virtual opencascade::handle<TDF_DeltaOnRemoval> DeltaOnRemoval ();

		/****************** DeltaOnResume ******************/
		%feature("compactdefaultargs") DeltaOnResume;
		%feature("autodoc", "* Makes an AttributeDelta because <self> has been resumed.
	:rtype: opencascade::handle<TDF_DeltaOnResume>") DeltaOnResume;
		virtual opencascade::handle<TDF_DeltaOnResume> DeltaOnResume ();


        %feature("autodoc", "1");
        %extend{
            std::string DumpToString() {
            std::stringstream s;
            self->Dump(s);
            return s.str();}
        };
        		/****************** ExtendedDump ******************/
		%feature("compactdefaultargs") ExtendedDump;
		%feature("autodoc", "* Dumps the attribute content on <aStream>, using <aMap> like this: if an attribute is not in the map, first put add it to the map and then dump it. Use the map rank instead of dumping each attribute field.
	:param anOS:
	:type anOS: Standard_OStream
	:param aFilter:
	:type aFilter: TDF_IDFilter
	:param aMap:
	:type aMap: TDF_AttributeIndexedMap
	:rtype: void") ExtendedDump;
		virtual void ExtendedDump (Standard_OStream & anOS,const TDF_IDFilter & aFilter,TDF_AttributeIndexedMap & aMap);

		/****************** FindAttribute ******************/
		%feature("compactdefaultargs") FindAttribute;
		%feature("autodoc", "* Finds an associated attribute of <self>, according to <anID>. the returned <anAttribute> is a valid one. The method returns True if found, False otherwise. A removed attribute cannot be found using this method.
	:param anID:
	:type anID: Standard_GUID
	:param anAttribute:
	:type anAttribute: TDF_Attribute
	:rtype: bool") FindAttribute;
		Standard_Boolean FindAttribute (const Standard_GUID & anID,opencascade::handle<TDF_Attribute> & anAttribute);

		/****************** Forget ******************/
		%feature("compactdefaultargs") Forget;
		%feature("autodoc", "* Forgets the attribute. <aTransaction> is the current transaction in which the forget is done. A forgotten attribute is also flagged not 'Valid'. //! A forgotten attribute is invisible. Set also the 'Valid' status to False. Obvioulsy, DF cannot empty an attribute (this has a semantic signification), but can remove it from the structure. So, a forgotten attribute is NOT an empty one, but a soon DEAD one. //! Should be private.
	:param aTransaction:
	:type aTransaction: int
	:rtype: None") Forget;
		void Forget (const Standard_Integer aTransaction);

		/****************** ForgetAllAttributes ******************/
		%feature("compactdefaultargs") ForgetAllAttributes;
		%feature("autodoc", "* Forgets all the attributes attached to the label of <self>. Does it on the sub-labels if <clearChildren> is set to true. Of course, this method is compatible with Transaction & Delta mecanisms. Be carefull that if <self> will have a null label after this call
	:param clearChildren: default value is Standard_True
	:type clearChildren: bool
	:rtype: None") ForgetAllAttributes;
		void ForgetAllAttributes (const Standard_Boolean clearChildren = Standard_True);

		/****************** ForgetAttribute ******************/
		%feature("compactdefaultargs") ForgetAttribute;
		%feature("autodoc", "* Forgets the Attribute of GUID <aguid> associated to the label of <self>. Be carefull that if <self> is the attribute of <guid>, <self> will have a null label after this call. If the attribute doesn't exist returns False. Otherwise returns True.
	:param aguid:
	:type aguid: Standard_GUID
	:rtype: bool") ForgetAttribute;
		Standard_Boolean ForgetAttribute (const Standard_GUID & aguid);

		/****************** ID ******************/
		%feature("compactdefaultargs") ID;
		%feature("autodoc", "* Returns the ID of the attribute.
	:rtype: Standard_GUID") ID;
		virtual const Standard_GUID & ID ();

		/****************** IsAttribute ******************/
		%feature("compactdefaultargs") IsAttribute;
		%feature("autodoc", "* Returns true if it exists an associated attribute of <self> with <anID> as ID.
	:param anID:
	:type anID: Standard_GUID
	:rtype: bool") IsAttribute;
		Standard_Boolean IsAttribute (const Standard_GUID & anID);

		/****************** IsBackuped ******************/
		%feature("compactdefaultargs") IsBackuped;
		%feature("autodoc", "* Returns true if the attribute backup status is set. This status is set/unset by the Backup() method.
	:rtype: bool") IsBackuped;
		Standard_Boolean IsBackuped ();

		/****************** IsForgotten ******************/
		%feature("compactdefaultargs") IsForgotten;
		%feature("autodoc", "* Returns true if the attribute forgotten status is set. //! ShortCut Methods concerning associated attributes =================================================
	:rtype: bool") IsForgotten;
		Standard_Boolean IsForgotten ();

		/****************** IsNew ******************/
		%feature("compactdefaultargs") IsNew;
		%feature("autodoc", "* Returns true if the attribute has no backup
	:rtype: bool") IsNew;
		Standard_Boolean IsNew ();

		/****************** IsValid ******************/
		%feature("compactdefaultargs") IsValid;
		%feature("autodoc", "* Returns true if the attribute is valid; i.e. not a backuped or removed one.
	:rtype: bool") IsValid;
		Standard_Boolean IsValid ();

		/****************** Label ******************/
		%feature("compactdefaultargs") Label;
		%feature("autodoc", "* Returns the label to which the attribute is attached. If the label is not included in a DF, the label is null. See Label. Warning If the label is not included in a data framework, it is null. This function should not be redefined inline.
	:rtype: TDF_Label") Label;
		const TDF_Label Label ();

		/****************** NewEmpty ******************/
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "* Returns an new empty attribute from the good end type. It is used by the copy algorithm.
	:rtype: opencascade::handle<TDF_Attribute>") NewEmpty;
		virtual opencascade::handle<TDF_Attribute> NewEmpty ();

		/****************** Paste ******************/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "* This method is different from the 'Copy' one, because it is used when copying an attribute from a source structure into a target structure. This method may paste the contents of <self> into <intoAttribute>. //! The given pasted attribute can be full or empty of its contents. But don't make a NEW! Just set the contents! //! It is possible to use <aRelocationTable> to get/set the relocation value of a source attribute.
	:param intoAttribute:
	:type intoAttribute: TDF_Attribute
	:param aRelocationTable:
	:type aRelocationTable: TDF_RelocationTable
	:rtype: void") Paste;
		virtual void Paste (const opencascade::handle<TDF_Attribute> & intoAttribute,const opencascade::handle<TDF_RelocationTable> & aRelocationTable);

		/****************** References ******************/
		%feature("compactdefaultargs") References;
		%feature("autodoc", "* Adds the first level referenced attributes and labels to <aDataSet>. //! For this, use the AddLabel or AddAttribute of DataSet. //! If there is none, do not implement the method.
	:param aDataSet:
	:type aDataSet: TDF_DataSet
	:rtype: void") References;
		virtual void References (const opencascade::handle<TDF_DataSet> & aDataSet);

		/****************** Restore ******************/
		%feature("compactdefaultargs") Restore;
		%feature("autodoc", "* Restores the backuped contents from <anAttribute> into this one. It is used when aborting a transaction.
	:param anAttribute:
	:type anAttribute: TDF_Attribute
	:rtype: void") Restore;
		virtual void Restore (const opencascade::handle<TDF_Attribute> & anAttribute);

		/****************** SetID ******************/
		%feature("compactdefaultargs") SetID;
		%feature("autodoc", "* Sets specific ID of the attribute (supports several attributes of one type at the same label feature).
	:param &:
	:type &: Standard_GUID
	:rtype: None") SetID;
		void SetID (const Standard_GUID &);

		/****************** SetID ******************/
		%feature("compactdefaultargs") SetID;
		%feature("autodoc", "* Sets default ID defined in nested class (to be used for attributes having User ID feature).
	:rtype: None") SetID;
		void SetID ();

		/****************** Transaction ******************/
		%feature("compactdefaultargs") Transaction;
		%feature("autodoc", "* Returns the transaction index in which the attribute has been created or modified.
	:rtype: int") Transaction;
		Standard_Integer Transaction ();

		/****************** UntilTransaction ******************/
		%feature("compactdefaultargs") UntilTransaction;
		%feature("autodoc", "* Returns the upper transaction index until which the attribute is/was valid. This number may vary. A removed attribute validity range is reduced to its transaction index.
	:rtype: int") UntilTransaction;
		Standard_Integer UntilTransaction ();

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
		%feature("compactdefaultargs") Apply;
		%feature("autodoc", "* Applies the delta to the attribute.
	:rtype: void") Apply;
		virtual void Apply ();

		/****************** Attribute ******************/
		%feature("compactdefaultargs") Attribute;
		%feature("autodoc", "* Returns the reference attribute.
	:rtype: opencascade::handle<TDF_Attribute>") Attribute;
		opencascade::handle<TDF_Attribute> Attribute ();


        %feature("autodoc", "1");
        %extend{
            std::string DumpToString() {
            std::stringstream s;
            self->Dump(s);
            return s.str();}
        };
        		/****************** ID ******************/
		%feature("compactdefaultargs") ID;
		%feature("autodoc", "* Returns the ID of the attribute concerned by <self>.
	:rtype: Standard_GUID") ID;
		Standard_GUID ID ();

		/****************** Label ******************/
		%feature("compactdefaultargs") Label;
		%feature("autodoc", "* Returns the label concerned by <self>.
	:rtype: TDF_Label") Label;
		TDF_Label Label ();

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
%nodefaultctor TDF_AttributeIterator;
class TDF_AttributeIterator {
	public:
		/****************** Initialize ******************/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", ":param aLabel:
	:type aLabel: TDF_Label
	:param withoutForgotten: default value is Standard_True
	:type withoutForgotten: bool
	:rtype: None") Initialize;
		void Initialize (const TDF_Label & aLabel,const Standard_Boolean withoutForgotten = Standard_True);

		/****************** More ******************/
		%feature("compactdefaultargs") More;
		%feature("autodoc", ":rtype: inline bool") More;
		inline Standard_Boolean More ();

		/****************** Next ******************/
		%feature("compactdefaultargs") Next;
		%feature("autodoc", ":rtype: None") Next;
		void Next ();

		/****************** PtrValue ******************/
		%feature("compactdefaultargs") PtrValue;
		%feature("autodoc", "* Provides an access to the internal pointer of the current attribute. The method has better performance as not-creating handle.
	:rtype: inline  TDF_Attribute *") PtrValue;
		inline const TDF_Attribute * PtrValue ();

		/****************** TDF_AttributeIterator ******************/
		%feature("compactdefaultargs") TDF_AttributeIterator;
		%feature("autodoc", ":rtype: None") TDF_AttributeIterator;
		 TDF_AttributeIterator ();

		/****************** TDF_AttributeIterator ******************/
		%feature("compactdefaultargs") TDF_AttributeIterator;
		%feature("autodoc", ":param aLabel:
	:type aLabel: TDF_Label
	:param withoutForgotten: default value is Standard_True
	:type withoutForgotten: bool
	:rtype: None") TDF_AttributeIterator;
		 TDF_AttributeIterator (const TDF_Label & aLabel,const Standard_Boolean withoutForgotten = Standard_True);

		/****************** TDF_AttributeIterator ******************/
		%feature("compactdefaultargs") TDF_AttributeIterator;
		%feature("autodoc", ":param aLabelNode:
	:type aLabelNode: TDF_LabelNodePtr
	:param withoutForgotten: default value is Standard_True
	:type withoutForgotten: bool
	:rtype: None") TDF_AttributeIterator;
		 TDF_AttributeIterator (const TDF_LabelNodePtr aLabelNode,const Standard_Boolean withoutForgotten = Standard_True);

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", ":rtype: inline opencascade::handle<TDF_Attribute>") Value;
		inline opencascade::handle<TDF_Attribute> Value ();

};


%extend TDF_AttributeIterator {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************
* class TDF_ChildIDIterator *
****************************/
%nodefaultctor TDF_ChildIDIterator;
class TDF_ChildIDIterator {
	public:
		/****************** Initialize ******************/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "* Initializes the iteration on the children of the given label. If <allLevels> option is set to true, it explores not only the first, but all the sub label levels.
	:param aLabel:
	:type aLabel: TDF_Label
	:param anID:
	:type anID: Standard_GUID
	:param allLevels: default value is Standard_False
	:type allLevels: bool
	:rtype: None") Initialize;
		void Initialize (const TDF_Label & aLabel,const Standard_GUID & anID,const Standard_Boolean allLevels = Standard_False);

		/****************** More ******************/
		%feature("compactdefaultargs") More;
		%feature("autodoc", "* Returns True if there is a current Item in the iteration.
	:rtype: bool") More;
		Standard_Boolean More ();

		/****************** Next ******************/
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "* Move to the next Item
	:rtype: None") Next;
		void Next ();

		/****************** NextBrother ******************/
		%feature("compactdefaultargs") NextBrother;
		%feature("autodoc", "* Move to the next Brother. If there is none, go up etc. This method is interesting only with 'allLevels' behavior, because it avoids to explore the current label children.
	:rtype: None") NextBrother;
		void NextBrother ();

		/****************** TDF_ChildIDIterator ******************/
		%feature("compactdefaultargs") TDF_ChildIDIterator;
		%feature("autodoc", "* Creates an empty iterator.
	:rtype: None") TDF_ChildIDIterator;
		 TDF_ChildIDIterator ();

		/****************** TDF_ChildIDIterator ******************/
		%feature("compactdefaultargs") TDF_ChildIDIterator;
		%feature("autodoc", "* Iterates on the children of the given label. If <allLevels> option is set to true, it explores not only the first, but all the sub label levels.
	:param aLabel:
	:type aLabel: TDF_Label
	:param anID:
	:type anID: Standard_GUID
	:param allLevels: default value is Standard_False
	:type allLevels: bool
	:rtype: None") TDF_ChildIDIterator;
		 TDF_ChildIDIterator (const TDF_Label & aLabel,const Standard_GUID & anID,const Standard_Boolean allLevels = Standard_False);

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "* Returns the current item; a null handle if there is none.
	:rtype: opencascade::handle<TDF_Attribute>") Value;
		opencascade::handle<TDF_Attribute> Value ();

};


%extend TDF_ChildIDIterator {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************
* class TDF_ChildIterator *
**************************/
%nodefaultctor TDF_ChildIterator;
class TDF_ChildIterator {
	public:
		/****************** Initialize ******************/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "* Initializes the iteration on the children of the given label. If <allLevels> option is set to true, it explores not only the first, but all the sub label levels. If allLevels is false, only the first level of child labels is explored. In the example below, the label is iterated using Initialize, More and Next and its child labels dumped using TDF_Tool::Entry. Example void DumpChildren(const TDF_Label& aLabel) { TDF_ChildIterator it; TCollection_AsciiString es; for (it.Initialize(aLabel,Standard_True); it.More(); it.Next()){ TDF_Tool::Entry(it.Value(),es); std::cout << as.ToCString() << std::endl; } }
	:param aLabel:
	:type aLabel: TDF_Label
	:param allLevels: default value is Standard_False
	:type allLevels: bool
	:rtype: None") Initialize;
		void Initialize (const TDF_Label & aLabel,const Standard_Boolean allLevels = Standard_False);

		/****************** More ******************/
		%feature("compactdefaultargs") More;
		%feature("autodoc", "* Returns true if a current label is found in the iteration process.
	:rtype: bool") More;
		Standard_Boolean More ();

		/****************** Next ******************/
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "* Move the current iteration to the next Item.
	:rtype: None") Next;
		void Next ();

		/****************** NextBrother ******************/
		%feature("compactdefaultargs") NextBrother;
		%feature("autodoc", "* Moves this iteration to the next brother label. A brother label is one with the same father as an initial label. Use this function when the non-empty constructor or Initialize has allLevels set to true. The result is that the iteration does not explore the children of the current label. This method is interesting only with 'allLevels' behavior, because it avoids to explore the current label children.
	:rtype: None") NextBrother;
		void NextBrother ();

		/****************** TDF_ChildIterator ******************/
		%feature("compactdefaultargs") TDF_ChildIterator;
		%feature("autodoc", "* Creates an empty iterator object to explore the children of a label.
	:rtype: None") TDF_ChildIterator;
		 TDF_ChildIterator ();

		/****************** TDF_ChildIterator ******************/
		%feature("compactdefaultargs") TDF_ChildIterator;
		%feature("autodoc", "* Constructs the iterator object defined by the label aLabel. Iterates on the children of the given label. If <allLevels> option is set to true, it explores not only the first, but all the sub label levels.
	:param aLabel:
	:type aLabel: TDF_Label
	:param allLevels: default value is Standard_False
	:type allLevels: bool
	:rtype: None") TDF_ChildIterator;
		 TDF_ChildIterator (const TDF_Label & aLabel,const Standard_Boolean allLevels = Standard_False);

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "* Returns the current label; or, if there is none, a null label.
	:rtype: TDF_Label") Value;
		const TDF_Label Value ();

};


%extend TDF_ChildIterator {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************
* class TDF_ClosureMode *
************************/
%nodefaultctor TDF_ClosureMode;
class TDF_ClosureMode {
	public:
		/****************** Descendants ******************/
		%feature("compactdefaultargs") Descendants;
		%feature("autodoc", "* Sets the mode 'Descendants' to <aStatus>. //! 'Descendants' mode means we add to the data set the children labels of each USER GIVEN label. We do not do that with the labels found applying UpToFirstLevel option.
	:param aStatus:
	:type aStatus: bool
	:rtype: None") Descendants;
		void Descendants (const Standard_Boolean aStatus);

		/****************** Descendants ******************/
		%feature("compactdefaultargs") Descendants;
		%feature("autodoc", "* Returns true if the mode 'Descendants' is set.
	:rtype: bool") Descendants;
		Standard_Boolean Descendants ();

		/****************** References ******************/
		%feature("compactdefaultargs") References;
		%feature("autodoc", "* Sets the mode 'References' to <aStatus>. //! 'References' mode means we add to the data set the descendants of an attribute, by calling the attribute method Descendants().
	:param aStatus:
	:type aStatus: bool
	:rtype: None") References;
		void References (const Standard_Boolean aStatus);

		/****************** References ******************/
		%feature("compactdefaultargs") References;
		%feature("autodoc", "* Returns true if the mode 'References' is set.
	:rtype: bool") References;
		Standard_Boolean References ();

		/****************** TDF_ClosureMode ******************/
		%feature("compactdefaultargs") TDF_ClosureMode;
		%feature("autodoc", "* Creates an objet with all modes set to <aMode>.
	:param aMode: default value is Standard_True
	:type aMode: bool
	:rtype: None") TDF_ClosureMode;
		 TDF_ClosureMode (const Standard_Boolean aMode = Standard_True);

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
		%feature("compactdefaultargs") Closure;
		%feature("autodoc", "* Builds the transitive closure of label and attribute sets into <aDataSet>.
	:param aDataSet:
	:type aDataSet: TDF_DataSet
	:rtype: void") Closure;
		static void Closure (const opencascade::handle<TDF_DataSet> & aDataSet);

		/****************** Closure ******************/
		%feature("compactdefaultargs") Closure;
		%feature("autodoc", "* Builds the transitive closure of label and attribute sets into <aDataSet>. Uses <aFilter> to determine if an attribute has to be taken in account or not. Uses <aMode> for various way of closing.
	:param aDataSet:
	:type aDataSet: TDF_DataSet
	:param aFilter:
	:type aFilter: TDF_IDFilter
	:param aMode:
	:type aMode: TDF_ClosureMode
	:rtype: void") Closure;
		static void Closure (const opencascade::handle<TDF_DataSet> & aDataSet,const TDF_IDFilter & aFilter,const TDF_ClosureMode & aMode);

		/****************** Closure ******************/
		%feature("compactdefaultargs") Closure;
		%feature("autodoc", "* Builds the transitive closure of <aLabel>.
	:param aLabel:
	:type aLabel: TDF_Label
	:param aLabMap:
	:type aLabMap: TDF_LabelMap
	:param anAttMap:
	:type anAttMap: TDF_AttributeMap
	:param aFilter:
	:type aFilter: TDF_IDFilter
	:param aMode:
	:type aMode: TDF_ClosureMode
	:rtype: void") Closure;
		static void Closure (const TDF_Label & aLabel,TDF_LabelMap & aLabMap,TDF_AttributeMap & anAttMap,const TDF_IDFilter & aFilter,const TDF_ClosureMode & aMode);

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
		%feature("compactdefaultargs") Compare;
		%feature("autodoc", "* Compares <aSourceDataSet> with <aTargetDataSet>, updating <aRelocationTable> with labels and attributes found in both sets.
	:param aSourceDataSet:
	:type aSourceDataSet: TDF_DataSet
	:param aTargetDataSet:
	:type aTargetDataSet: TDF_DataSet
	:param aFilter:
	:type aFilter: TDF_IDFilter
	:param aRelocationTable:
	:type aRelocationTable: TDF_RelocationTable
	:rtype: void") Compare;
		static void Compare (const opencascade::handle<TDF_DataSet> & aSourceDataSet,const opencascade::handle<TDF_DataSet> & aTargetDataSet,const TDF_IDFilter & aFilter,const opencascade::handle<TDF_RelocationTable> & aRelocationTable);

		/****************** Cut ******************/
		%feature("compactdefaultargs") Cut;
		%feature("autodoc", "* Removes attributes from <aDataSet>.
	:param aDataSet:
	:type aDataSet: TDF_DataSet
	:rtype: void") Cut;
		static void Cut (const opencascade::handle<TDF_DataSet> & aDataSet);

		/****************** IsSelfContained ******************/
		%feature("compactdefaultargs") IsSelfContained;
		%feature("autodoc", "* Returns true if all the labels of <aDataSet> are descendant of <aLabel>.
	:param aLabel:
	:type aLabel: TDF_Label
	:param aDataSet:
	:type aDataSet: TDF_DataSet
	:rtype: bool") IsSelfContained;
		static Standard_Boolean IsSelfContained (const TDF_Label & aLabel,const opencascade::handle<TDF_DataSet> & aDataSet);

		/****************** SourceUnbound ******************/
		%feature("compactdefaultargs") SourceUnbound;
		%feature("autodoc", "* Finds from <aRefDataSet> all the keys not bound into <aRelocationTable> and put them into <aDiffDataSet>. Returns True if the difference contains at least one key. (A key is a source object). //! <anOption> may take the following values: 1 : labels treatment only; 2 : attributes treatment only (default value); 3 : both labels & attributes treatment.
	:param aRefDataSet:
	:type aRefDataSet: TDF_DataSet
	:param aRelocationTable:
	:type aRelocationTable: TDF_RelocationTable
	:param aFilter:
	:type aFilter: TDF_IDFilter
	:param aDiffDataSet:
	:type aDiffDataSet: TDF_DataSet
	:param anOption: default value is 2
	:type anOption: int
	:rtype: bool") SourceUnbound;
		static Standard_Boolean SourceUnbound (const opencascade::handle<TDF_DataSet> & aRefDataSet,const opencascade::handle<TDF_RelocationTable> & aRelocationTable,const TDF_IDFilter & aFilter,const opencascade::handle<TDF_DataSet> & aDiffDataSet,const Standard_Integer anOption = 2);

		/****************** TargetUnbound ******************/
		%feature("compactdefaultargs") TargetUnbound;
		%feature("autodoc", "* Substracts from <aRefDataSet> all the items bound into <aRelocationTable>. The result is put into <aDiffDataSet>. Returns True if the difference contains at least one item. (An item is a target object). //! <anOption> may take the following values: 1 : labels treatment only; 2 : attributes treatment only(default value); 3 : both labels & attributes treatment.
	:param aRefDataSet:
	:type aRefDataSet: TDF_DataSet
	:param aRelocationTable:
	:type aRelocationTable: TDF_RelocationTable
	:param aFilter:
	:type aFilter: TDF_IDFilter
	:param aDiffDataSet:
	:type aDiffDataSet: TDF_DataSet
	:param anOption: default value is 2
	:type anOption: int
	:rtype: bool") TargetUnbound;
		static Standard_Boolean TargetUnbound (const opencascade::handle<TDF_DataSet> & aRefDataSet,const opencascade::handle<TDF_RelocationTable> & aRelocationTable,const TDF_IDFilter & aFilter,const opencascade::handle<TDF_DataSet> & aDiffDataSet,const Standard_Integer anOption = 2);

};


%extend TDF_ComparisonTool {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************
* class TDF_CopyLabel *
**********************/
%nodefaultctor TDF_CopyLabel;
class TDF_CopyLabel {
	public:
		/****************** ExternalReferences ******************/
		%feature("compactdefaultargs") ExternalReferences;
		%feature("autodoc", "* Check external references and if exist fills the aExternals Map
	:param Lab:
	:type Lab: TDF_Label
	:param aExternals:
	:type aExternals: TDF_AttributeMap
	:param aFilter:
	:type aFilter: TDF_IDFilter
	:rtype: bool") ExternalReferences;
		static Standard_Boolean ExternalReferences (const TDF_Label & Lab,TDF_AttributeMap & aExternals,const TDF_IDFilter & aFilter);

		/****************** ExternalReferences ******************/
		%feature("compactdefaultargs") ExternalReferences;
		%feature("autodoc", "* Check external references and if exist fills the aExternals Map
	:param aRefLab:
	:type aRefLab: TDF_Label
	:param Lab:
	:type Lab: TDF_Label
	:param aExternals:
	:type aExternals: TDF_AttributeMap
	:param aFilter:
	:type aFilter: TDF_IDFilter
	:param aDataSet:
	:type aDataSet: TDF_DataSet
	:rtype: void") ExternalReferences;
		static void ExternalReferences (const TDF_Label & aRefLab,const TDF_Label & Lab,TDF_AttributeMap & aExternals,const TDF_IDFilter & aFilter,opencascade::handle<TDF_DataSet> & aDataSet);

		/****************** IsDone ******************/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", ":rtype: bool") IsDone;
		Standard_Boolean IsDone ();

		/****************** Load ******************/
		%feature("compactdefaultargs") Load;
		%feature("autodoc", "* Loads src and tgt labels
	:param aSource:
	:type aSource: TDF_Label
	:param aTarget:
	:type aTarget: TDF_Label
	:rtype: None") Load;
		void Load (const TDF_Label & aSource,const TDF_Label & aTarget);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "* performs algorithm of selfcontained copy
	:rtype: None") Perform;
		void Perform ();

		/****************** RelocationTable ******************/
		%feature("compactdefaultargs") RelocationTable;
		%feature("autodoc", "* returns relocation table
	:rtype: opencascade::handle<TDF_RelocationTable>") RelocationTable;
		const opencascade::handle<TDF_RelocationTable> & RelocationTable ();

		/****************** TDF_CopyLabel ******************/
		%feature("compactdefaultargs") TDF_CopyLabel;
		%feature("autodoc", "* Empty constructor
	:rtype: None") TDF_CopyLabel;
		 TDF_CopyLabel ();

		/****************** TDF_CopyLabel ******************/
		%feature("compactdefaultargs") TDF_CopyLabel;
		%feature("autodoc", "* CopyTool
	:param aSource:
	:type aSource: TDF_Label
	:param aTarget:
	:type aTarget: TDF_Label
	:rtype: None") TDF_CopyLabel;
		 TDF_CopyLabel (const TDF_Label & aSource,const TDF_Label & aTarget);

		/****************** UseFilter ******************/
		%feature("compactdefaultargs") UseFilter;
		%feature("autodoc", "* Sets filter
	:param aFilter:
	:type aFilter: TDF_IDFilter
	:rtype: None") UseFilter;
		void UseFilter (const TDF_IDFilter & aFilter);

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
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "* Copy <aSourceDataSet> with using and updating <aRelocationTable>. This method ignores target attributes privilege over source ones.
	:param aSourceDataSet:
	:type aSourceDataSet: TDF_DataSet
	:param aRelocationTable:
	:type aRelocationTable: TDF_RelocationTable
	:rtype: void") Copy;
		static void Copy (const opencascade::handle<TDF_DataSet> & aSourceDataSet,const opencascade::handle<TDF_RelocationTable> & aRelocationTable);

		/****************** Copy ******************/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "* Copy <aSourceDataSet> using and updating <aRelocationTable>. Use <aPrivilegeFilter> to give a list of IDs for which the target attribute prevails over the source one.
	:param aSourceDataSet:
	:type aSourceDataSet: TDF_DataSet
	:param aRelocationTable:
	:type aRelocationTable: TDF_RelocationTable
	:param aPrivilegeFilter:
	:type aPrivilegeFilter: TDF_IDFilter
	:rtype: void") Copy;
		static void Copy (const opencascade::handle<TDF_DataSet> & aSourceDataSet,const opencascade::handle<TDF_RelocationTable> & aRelocationTable,const TDF_IDFilter & aPrivilegeFilter);

		/****************** Copy ******************/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "* Copy <aSourceDataSet> using and updating <aRelocationTable>. Use <aPrivilegeFilter> to give a list of IDs for which the target attribute prevails over the source one. If <setSelfContained> is set to true, every TDF_Reference will be replaced by the referenced structure according to <aRefFilter>. //! NB: <aRefFilter> is used only if <setSelfContained> is true. Internal root label copy recursive method.
	:param aSourceDataSet:
	:type aSourceDataSet: TDF_DataSet
	:param aRelocationTable:
	:type aRelocationTable: TDF_RelocationTable
	:param aPrivilegeFilter:
	:type aPrivilegeFilter: TDF_IDFilter
	:param aRefFilter:
	:type aRefFilter: TDF_IDFilter
	:param setSelfContained:
	:type setSelfContained: bool
	:rtype: void") Copy;
		static void Copy (const opencascade::handle<TDF_DataSet> & aSourceDataSet,const opencascade::handle<TDF_RelocationTable> & aRelocationTable,const TDF_IDFilter & aPrivilegeFilter,const TDF_IDFilter & aRefFilter,const Standard_Boolean setSelfContained);

};


%extend TDF_CopyTool {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************
* class TDF_Data *
*****************/
%nodefaultctor TDF_Data;
class TDF_Data : public Standard_Transient {
	public:
		/****************** AllowModification ******************/
		%feature("compactdefaultargs") AllowModification;
		%feature("autodoc", "* Sets modification mode.
	:param isAllowed:
	:type isAllowed: bool
	:rtype: None") AllowModification;
		void AllowModification (const Standard_Boolean isAllowed);

		/****************** Destroy ******************/
		%feature("compactdefaultargs") Destroy;
		%feature("autodoc", ":rtype: None") Destroy;
		void Destroy ();


        %feature("autodoc", "1");
        %extend{
            std::string DumpToString() {
            std::stringstream s;
            self->Dump(s);
            return s.str();}
        };
        		/****************** IsApplicable ******************/
		%feature("compactdefaultargs") IsApplicable;
		%feature("autodoc", "* Returns true if <aDelta> is applicable HERE and NOW.
	:param aDelta:
	:type aDelta: TDF_Delta
	:rtype: bool") IsApplicable;
		Standard_Boolean IsApplicable (const opencascade::handle<TDF_Delta> & aDelta);

		/****************** IsModificationAllowed ******************/
		%feature("compactdefaultargs") IsModificationAllowed;
		%feature("autodoc", "* returns modification mode.
	:rtype: bool") IsModificationAllowed;
		Standard_Boolean IsModificationAllowed ();

		/****************** LabelNodeAllocator ******************/
		%feature("compactdefaultargs") LabelNodeAllocator;
		%feature("autodoc", "* Returns TDF_HAllocator, which is an incremental allocator used by TDF_LabelNode. This allocator is used to manage TDF_LabelNode objects, but it can also be used for allocating memory to application-specific data (be careful because this allocator does not release the memory). The benefits of this allocation scheme are noticeable when dealing with large OCAF documents, due to: 1. Very quick allocation of objects (memory heap is not used, the algorithm that replaces it is very simple). 2. Very quick destruction of objects (memory is released not by destructors of TDF_LabelNode, but rather by the destructor of TDF_Data). 3. TDF_LabelNode objects do not fragmentize the memory; they are kept compactly in a number of arrays of 16K each. 4. Swapping is reduced on large data, because each document now occupies a smaller number of memory pages.
	:rtype: TDF_HAllocator") LabelNodeAllocator;
		const TDF_HAllocator & LabelNodeAllocator ();

		/****************** NotUndoMode ******************/
		%feature("compactdefaultargs") NotUndoMode;
		%feature("autodoc", "* Returns the undo mode status.
	:rtype: bool") NotUndoMode;
		Standard_Boolean NotUndoMode ();

		/****************** Root ******************/
		%feature("compactdefaultargs") Root;
		%feature("autodoc", "* Returns the root label of the Data structure.
	:rtype: TDF_Label") Root;
		const TDF_Label Root ();

		/****************** TDF_Data ******************/
		%feature("compactdefaultargs") TDF_Data;
		%feature("autodoc", "* A new and empty Data structure.
	:rtype: None") TDF_Data;
		 TDF_Data ();

		/****************** Time ******************/
		%feature("compactdefaultargs") Time;
		%feature("autodoc", "* Returns the current tick. It is incremented each Commit.
	:rtype: int") Time;
		Standard_Integer Time ();

		/****************** Transaction ******************/
		%feature("compactdefaultargs") Transaction;
		%feature("autodoc", "* Returns the current transaction number.
	:rtype: int") Transaction;
		Standard_Integer Transaction ();

		/****************** Undo ******************/
		%feature("compactdefaultargs") Undo;
		%feature("autodoc", "* Apply <aDelta> to undo a set of attribute modifications. //! Optionnal <withDelta> set to True indiquates a Delta Set must be generated. (See above)
	:param aDelta:
	:type aDelta: TDF_Delta
	:param withDelta: default value is Standard_False
	:type withDelta: bool
	:rtype: opencascade::handle<TDF_Delta>") Undo;
		opencascade::handle<TDF_Delta> Undo (const opencascade::handle<TDF_Delta> & aDelta,const Standard_Boolean withDelta = Standard_False);

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
%nodefaultctor TDF_DataSet;
class TDF_DataSet : public Standard_Transient {
	public:
		/****************** AddAttribute ******************/
		%feature("compactdefaultargs") AddAttribute;
		%feature("autodoc", "* Adds <anAttribute> into the current data set.
	:param anAttribute:
	:type anAttribute: TDF_Attribute
	:rtype: None") AddAttribute;
		void AddAttribute (const opencascade::handle<TDF_Attribute> & anAttribute);

		/****************** AddLabel ******************/
		%feature("compactdefaultargs") AddLabel;
		%feature("autodoc", "* Adds <aLabel> in the current data set.
	:param aLabel:
	:type aLabel: TDF_Label
	:rtype: None") AddLabel;
		void AddLabel (const TDF_Label & aLabel);

		/****************** AddRoot ******************/
		%feature("compactdefaultargs") AddRoot;
		%feature("autodoc", "* Adds a root label to <myRootLabels>.
	:param aLabel:
	:type aLabel: TDF_Label
	:rtype: None") AddRoot;
		void AddRoot (const TDF_Label & aLabel);

		/****************** Attributes ******************/
		%feature("compactdefaultargs") Attributes;
		%feature("autodoc", "* Returns the map of attributes in the current data set. This map can be used directly, or updated.
	:rtype: TDF_AttributeMap") Attributes;
		TDF_AttributeMap & Attributes ();

		/****************** Clear ******************/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "* Clears all information.
	:rtype: None") Clear;
		void Clear ();

		/****************** ContainsAttribute ******************/
		%feature("compactdefaultargs") ContainsAttribute;
		%feature("autodoc", "* Returns true if <anAttribute> is in the data set.
	:param anAttribute:
	:type anAttribute: TDF_Attribute
	:rtype: bool") ContainsAttribute;
		Standard_Boolean ContainsAttribute (const opencascade::handle<TDF_Attribute> & anAttribute);

		/****************** ContainsLabel ******************/
		%feature("compactdefaultargs") ContainsLabel;
		%feature("autodoc", "* Returns true if the label <alabel> is in the data set.
	:param aLabel:
	:type aLabel: TDF_Label
	:rtype: bool") ContainsLabel;
		Standard_Boolean ContainsLabel (const TDF_Label & aLabel);


        %feature("autodoc", "1");
        %extend{
            std::string DumpToString() {
            std::stringstream s;
            self->Dump(s);
            return s.str();}
        };
        		/****************** IsEmpty ******************/
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "* Returns true if there is at least one label or one attribute.
	:rtype: bool") IsEmpty;
		Standard_Boolean IsEmpty ();

		/****************** Labels ******************/
		%feature("compactdefaultargs") Labels;
		%feature("autodoc", "* Returns the map of labels in this data set. This map can be used directly, or updated.
	:rtype: TDF_LabelMap") Labels;
		TDF_LabelMap & Labels ();

		/****************** Roots ******************/
		%feature("compactdefaultargs") Roots;
		%feature("autodoc", "* Returns <myRootLabels> to be used or updated.
	:rtype: TDF_LabelList") Roots;
		TDF_LabelList & Roots ();

		/****************** TDF_DataSet ******************/
		%feature("compactdefaultargs") TDF_DataSet;
		%feature("autodoc", "* Creates an empty DataSet object.
	:rtype: None") TDF_DataSet;
		 TDF_DataSet ();

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
%nodefaultctor TDF_Delta;
class TDF_Delta : public Standard_Transient {
	public:
		/****************** AttributeDeltas ******************/
		%feature("compactdefaultargs") AttributeDeltas;
		%feature("autodoc", "* Returns the field <myAttDeltaList>.
	:rtype: TDF_AttributeDeltaList") AttributeDeltas;
		const TDF_AttributeDeltaList & AttributeDeltas ();

		/****************** BeginTime ******************/
		%feature("compactdefaultargs") BeginTime;
		%feature("autodoc", "* Returns the field <myBeginTime>.
	:rtype: int") BeginTime;
		Standard_Integer BeginTime ();


        %feature("autodoc", "1");
        %extend{
            std::string DumpToString() {
            std::stringstream s;
            self->Dump(s);
            return s.str();}
        };
        		/****************** EndTime ******************/
		%feature("compactdefaultargs") EndTime;
		%feature("autodoc", "* Returns the field <myEndTime>.
	:rtype: int") EndTime;
		Standard_Integer EndTime ();

		/****************** IsApplicable ******************/
		%feature("compactdefaultargs") IsApplicable;
		%feature("autodoc", "* Returns true if the Undo action of <self> is applicable at <aCurrentTime>.
	:param aCurrentTime:
	:type aCurrentTime: int
	:rtype: bool") IsApplicable;
		Standard_Boolean IsApplicable (const Standard_Integer aCurrentTime);

		/****************** IsEmpty ******************/
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "* Returns true if there is nothing to undo.
	:rtype: bool") IsEmpty;
		Standard_Boolean IsEmpty ();

		/****************** Labels ******************/
		%feature("compactdefaultargs") Labels;
		%feature("autodoc", "* Adds in <aLabelList> the labels of the attribute deltas. Caution: <aLabelList> is not cleared before use.
	:param aLabelList:
	:type aLabelList: TDF_LabelList
	:rtype: None") Labels;
		void Labels (TDF_LabelList & aLabelList);

		/****************** Name ******************/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "* Returns a name associated with this delta.
	:rtype: TCollection_ExtendedString") Name;
		TCollection_ExtendedString Name ();

		/****************** SetName ******************/
		%feature("compactdefaultargs") SetName;
		%feature("autodoc", "* Associates a name <theName> with this delta
	:param theName:
	:type theName: TCollection_ExtendedString
	:rtype: None") SetName;
		void SetName (const TCollection_ExtendedString & theName);

		/****************** TDF_Delta ******************/
		%feature("compactdefaultargs") TDF_Delta;
		%feature("autodoc", "* Creates a delta.
	:rtype: None") TDF_Delta;
		 TDF_Delta ();

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
%nodefaultctor TDF_IDFilter;
class TDF_IDFilter {
	public:
		/****************** Copy ******************/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "* Copies into <self> the contents of <fromFilter>. <self> is cleared before copy.
	:param fromFilter:
	:type fromFilter: TDF_IDFilter
	:rtype: None") Copy;
		void Copy (const TDF_IDFilter & fromFilter);


        %feature("autodoc", "1");
        %extend{
            std::string DumpToString() {
            std::stringstream s;
            self->Dump(s);
            return s.str();}
        };
        		/****************** IDList ******************/
		%feature("compactdefaultargs") IDList;
		%feature("autodoc", "* Copies the list of ID to be kept or ignored in <anIDList>. <anIDList> is cleared before use.
	:param anIDList:
	:type anIDList: TDF_IDList
	:rtype: None") IDList;
		void IDList (TDF_IDList & anIDList);

		/****************** Ignore ******************/
		%feature("compactdefaultargs") Ignore;
		%feature("autodoc", "* An attribute with <anID> as ID is to be ignored and the filter will answer false to the question IsKept(<anID>).
	:param anID:
	:type anID: Standard_GUID
	:rtype: None") Ignore;
		void Ignore (const Standard_GUID & anID);

		/****************** Ignore ******************/
		%feature("compactdefaultargs") Ignore;
		%feature("autodoc", "* Attributes with ID owned by <anIDList> are to be ignored and the filter will answer false to the question IsKept(<anID>) with ID from <anIDList>.
	:param anIDList:
	:type anIDList: TDF_IDList
	:rtype: None") Ignore;
		void Ignore (const TDF_IDList & anIDList);

		/****************** IgnoreAll ******************/
		%feature("compactdefaultargs") IgnoreAll;
		%feature("autodoc", "* The list of ID is cleared and the filter mode is set to ignore mode if <keep> is true; false otherwise.
	:param ignore:
	:type ignore: bool
	:rtype: None") IgnoreAll;
		void IgnoreAll (const Standard_Boolean ignore);

		/****************** IgnoreAll ******************/
		%feature("compactdefaultargs") IgnoreAll;
		%feature("autodoc", "* Returns true is the mode is set to 'ignore all but...'.
	:rtype: bool") IgnoreAll;
		Standard_Boolean IgnoreAll ();

		/****************** IsIgnored ******************/
		%feature("compactdefaultargs") IsIgnored;
		%feature("autodoc", "* Returns true if the ID is to be ignored.
	:param anID:
	:type anID: Standard_GUID
	:rtype: bool") IsIgnored;
		Standard_Boolean IsIgnored (const Standard_GUID & anID);

		/****************** IsIgnored ******************/
		%feature("compactdefaultargs") IsIgnored;
		%feature("autodoc", "* Returns true if the attribute is to be ignored.
	:param anAtt:
	:type anAtt: TDF_Attribute
	:rtype: bool") IsIgnored;
		Standard_Boolean IsIgnored (const opencascade::handle<TDF_Attribute> & anAtt);

		/****************** IsKept ******************/
		%feature("compactdefaultargs") IsKept;
		%feature("autodoc", "* Returns true if the ID is to be kept.
	:param anID:
	:type anID: Standard_GUID
	:rtype: bool") IsKept;
		Standard_Boolean IsKept (const Standard_GUID & anID);

		/****************** IsKept ******************/
		%feature("compactdefaultargs") IsKept;
		%feature("autodoc", "* Returns true if the attribute is to be kept.
	:param anAtt:
	:type anAtt: TDF_Attribute
	:rtype: bool") IsKept;
		Standard_Boolean IsKept (const opencascade::handle<TDF_Attribute> & anAtt);

		/****************** Keep ******************/
		%feature("compactdefaultargs") Keep;
		%feature("autodoc", "* An attribute with <anID> as ID is to be kept and the filter will answer true to the question IsKept(<anID>).
	:param anID:
	:type anID: Standard_GUID
	:rtype: None") Keep;
		void Keep (const Standard_GUID & anID);

		/****************** Keep ******************/
		%feature("compactdefaultargs") Keep;
		%feature("autodoc", "* Attributes with ID owned by <anIDList> are to be kept and the filter will answer true to the question IsKept(<anID>) with ID from <anIDList>.
	:param anIDList:
	:type anIDList: TDF_IDList
	:rtype: None") Keep;
		void Keep (const TDF_IDList & anIDList);

		/****************** TDF_IDFilter ******************/
		%feature("compactdefaultargs") TDF_IDFilter;
		%feature("autodoc", "* Creates an ID/attribute filter based on an ID list. The default mode is 'ignore all but...'. //! This filter has 2 working mode: keep and ignore. //! Ignore/Exclusive mode: all IDs are ignored except these set to be kept, using Keep(). Of course, it is possible set an kept ID to be ignored using Ignore(). //! Keep/Inclusive mode: all IDs are kept except these set to be ignored, using Ignore(). Of course, it is possible set an ignored ID to be kept using Keep().
	:param ignoreMode: default value is Standard_True
	:type ignoreMode: bool
	:rtype: None") TDF_IDFilter;
		 TDF_IDFilter (const Standard_Boolean ignoreMode = Standard_True);

};


%extend TDF_IDFilter {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************
* class TDF_Label *
******************/
%nodefaultctor TDF_Label;
class TDF_Label {
	public:
		/****************** AddAttribute ******************/
		%feature("compactdefaultargs") AddAttribute;
		%feature("autodoc", "* Adds an Attribute to the current label. Raises if there is already one.
	:param anAttribute:
	:type anAttribute: TDF_Attribute
	:param append: default value is Standard_True
	:type append: bool
	:rtype: None") AddAttribute;
		void AddAttribute (const opencascade::handle<TDF_Attribute> & anAttribute,const Standard_Boolean append = Standard_True);

		/****************** AttributesModified ******************/
		%feature("compactdefaultargs") AttributesModified;
		%feature("autodoc", "* Returns true if <self> owns attributes not yet available in transaction 0. It means at least one attribute is new, modified or deleted.
	:rtype: bool") AttributesModified;
		Standard_Boolean AttributesModified ();

		/****************** Data ******************/
		%feature("compactdefaultargs") Data;
		%feature("autodoc", "* Returns the Data owning <self>.
	:rtype: opencascade::handle<TDF_Data>") Data;
		opencascade::handle<TDF_Data> Data ();

		/****************** Depth ******************/
		%feature("compactdefaultargs") Depth;
		%feature("autodoc", "* Returns the depth of the label in the data framework. This corresponds to the number of fathers which this label has, and is used in determining whether a label is root, null or equivalent to another label. Exceptions: Standard_NullObject if this label is null. This is because a null object can have no depth.
	:rtype: int") Depth;
		Standard_Integer Depth ();


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
        		/****************** ExtendedDump ******************/
		%feature("compactdefaultargs") ExtendedDump;
		%feature("autodoc", "* Dumps the label on <aStream> and its attributes rank in <aMap> if their IDs are kept by <IDFilter>.
	:param anOS:
	:type anOS: Standard_OStream
	:param aFilter:
	:type aFilter: TDF_IDFilter
	:param aMap:
	:type aMap: TDF_AttributeIndexedMap
	:rtype: None") ExtendedDump;
		void ExtendedDump (Standard_OStream & anOS,const TDF_IDFilter & aFilter,TDF_AttributeIndexedMap & aMap);

		/****************** Father ******************/
		%feature("compactdefaultargs") Father;
		%feature("autodoc", "* Returns the label father. This label may be null if the label is root.
	:rtype: TDF_Label") Father;
		const TDF_Label Father ();

		/****************** FindAttribute ******************/
		%feature("compactdefaultargs") FindAttribute;
		%feature("autodoc", "* Finds an attribute of the current label, according to <anID>. If anAttribute is not a valid one, false is returned. //! The method returns True if found, False otherwise. //! A removed attribute cannot be found.
	:param anID:
	:type anID: Standard_GUID
	:param anAttribute:
	:type anAttribute: TDF_Attribute
	:rtype: bool") FindAttribute;
		Standard_Boolean FindAttribute (const Standard_GUID & anID,opencascade::handle<TDF_Attribute> & anAttribute);

		/****************** FindAttribute ******************/
		%feature("compactdefaultargs") FindAttribute;
		%feature("autodoc", "* Finds an attribute of the current label, according to <anID> and <aTransaction>. This attribute has/had to be a valid one for the given transaction index . So, this attribute is not necessary a valid one. //! The method returns True if found, False otherwise. //! A removed attribute cannot be found nor a backuped attribute of a removed one.
	:param anID:
	:type anID: Standard_GUID
	:param aTransaction:
	:type aTransaction: int
	:param anAttribute:
	:type anAttribute: TDF_Attribute
	:rtype: bool") FindAttribute;
		Standard_Boolean FindAttribute (const Standard_GUID & anID,const Standard_Integer aTransaction,opencascade::handle<TDF_Attribute> & anAttribute);

		/****************** FindChild ******************/
		%feature("compactdefaultargs") FindChild;
		%feature("autodoc", "* Finds a child label having <aTag> as tag. Creates The tag aTag identifies the label which will be the parent. If create is true and no child label is found, a new one is created. Example: //creating a label with tag 10 at Root TDF_Label lab1 = aDF->Root().FindChild(10); //creating labels 7 and 2 on label 10 TDF_Label lab2 = lab1.FindChild(7); TDF_Label lab3 = lab1.FindChild(2);
	:param aTag:
	:type aTag: int
	:param create: default value is Standard_True
	:type create: bool
	:rtype: TDF_Label") FindChild;
		TDF_Label FindChild (const Standard_Integer aTag,const Standard_Boolean create = Standard_True);

		/****************** ForgetAllAttributes ******************/
		%feature("compactdefaultargs") ForgetAllAttributes;
		%feature("autodoc", "* Forgets all the attributes. Does it on also on the sub-labels if <clearChildren> is set to true. Of course, this method is compatible with Transaction & Delta mecanisms.
	:param clearChildren: default value is Standard_True
	:type clearChildren: bool
	:rtype: None") ForgetAllAttributes;
		void ForgetAllAttributes (const Standard_Boolean clearChildren = Standard_True);

		/****************** ForgetAttribute ******************/
		%feature("compactdefaultargs") ForgetAttribute;
		%feature("autodoc", "* Forgets an Attribute from the current label, setting its forgotten status true and its valid status false. Raises if the attribute is not in the structure.
	:param anAttribute:
	:type anAttribute: TDF_Attribute
	:rtype: None") ForgetAttribute;
		void ForgetAttribute (const opencascade::handle<TDF_Attribute> & anAttribute);

		/****************** ForgetAttribute ******************/
		%feature("compactdefaultargs") ForgetAttribute;
		%feature("autodoc", "* Forgets the Attribute of GUID <aguid> from the current label . If the attribute doesn't exist returns False. Otherwise returns True.
	:param aguid:
	:type aguid: Standard_GUID
	:rtype: bool") ForgetAttribute;
		Standard_Boolean ForgetAttribute (const Standard_GUID & aguid);

		/****************** HasAttribute ******************/
		%feature("compactdefaultargs") HasAttribute;
		%feature("autodoc", "* Returns true if this label has at least one attribute.
	:rtype: bool") HasAttribute;
		Standard_Boolean HasAttribute ();

		/****************** HasChild ******************/
		%feature("compactdefaultargs") HasChild;
		%feature("autodoc", "* Returns true if this label has at least one child.
	:rtype: bool") HasChild;
		Standard_Boolean HasChild ();

		/****************** HasGreaterNode ******************/
		%feature("compactdefaultargs") HasGreaterNode;
		%feature("autodoc", "* Returns true if node address of <self> is greater than <otherLabel> one. Used to quickly sort labels (not on entry criterion). //! -C++: inline
	:param otherLabel:
	:type otherLabel: TDF_Label
	:rtype: bool") HasGreaterNode;
		Standard_Boolean HasGreaterNode (const TDF_Label & otherLabel);

		/****************** HasLowerNode ******************/
		%feature("compactdefaultargs") HasLowerNode;
		%feature("autodoc", "* Returns true if node address of <self> is lower than <otherLabel> one. Used to quickly sort labels (not on entry criterion). //! -C++: inline
	:param otherLabel:
	:type otherLabel: TDF_Label
	:rtype: bool") HasLowerNode;
		Standard_Boolean HasLowerNode (const TDF_Label & otherLabel);

		/****************** Imported ******************/
		%feature("compactdefaultargs") Imported;
		%feature("autodoc", "* Sets or unsets <self> and all its descendants as imported label, according to <aStatus>.
	:param aStatus:
	:type aStatus: bool
	:rtype: None") Imported;
		void Imported (const Standard_Boolean aStatus);

		/****************** IsAttribute ******************/
		%feature("compactdefaultargs") IsAttribute;
		%feature("autodoc", "* Returns true if <self> owns an attribute with <anID> as ID.
	:param anID:
	:type anID: Standard_GUID
	:rtype: bool") IsAttribute;
		Standard_Boolean IsAttribute (const Standard_GUID & anID);

		/****************** IsDescendant ******************/
		%feature("compactdefaultargs") IsDescendant;
		%feature("autodoc", "* Returns True if <self> is a descendant of <aLabel>. Attention: every label is its own descendant.
	:param aLabel:
	:type aLabel: TDF_Label
	:rtype: bool") IsDescendant;
		Standard_Boolean IsDescendant (const TDF_Label & aLabel);

		/****************** IsDifferent ******************/
		%feature("compactdefaultargs") IsDifferent;
		%feature("autodoc", ":param aLabel:
	:type aLabel: TDF_Label
	:rtype: bool") IsDifferent;
		Standard_Boolean IsDifferent (const TDF_Label & aLabel);

		/****************** IsEqual ******************/
		%feature("compactdefaultargs") IsEqual;
		%feature("autodoc", "* Returns True if the <aLabel> is equal to me (same LabelNode*).
	:param aLabel:
	:type aLabel: TDF_Label
	:rtype: bool") IsEqual;
		Standard_Boolean IsEqual (const TDF_Label & aLabel);

		/****************** IsImported ******************/
		%feature("compactdefaultargs") IsImported;
		%feature("autodoc", "* Returns True if the <aLabel> is imported.
	:rtype: bool") IsImported;
		Standard_Boolean IsImported ();

		/****************** IsNull ******************/
		%feature("compactdefaultargs") IsNull;
		%feature("autodoc", "* Returns True if the <aLabel> is null, i.e. it has not been included in the data framework.
	:rtype: bool") IsNull;
		Standard_Boolean IsNull ();

		/****************** IsRoot ******************/
		%feature("compactdefaultargs") IsRoot;
		%feature("autodoc", ":rtype: bool") IsRoot;
		Standard_Boolean IsRoot ();

		/****************** MayBeModified ******************/
		%feature("compactdefaultargs") MayBeModified;
		%feature("autodoc", "* Returns true if <self> or a DESCENDANT of <self> owns attributes not yet available in transaction 0. It means at least one of their attributes is new, modified or deleted.
	:rtype: bool") MayBeModified;
		Standard_Boolean MayBeModified ();

		/****************** NbAttributes ******************/
		%feature("compactdefaultargs") NbAttributes;
		%feature("autodoc", "* Returns the number of attributes.
	:rtype: int") NbAttributes;
		Standard_Integer NbAttributes ();

		/****************** NbChildren ******************/
		%feature("compactdefaultargs") NbChildren;
		%feature("autodoc", "* Returns the number of children.
	:rtype: int") NbChildren;
		Standard_Integer NbChildren ();

		/****************** NewChild ******************/
		%feature("compactdefaultargs") NewChild;
		%feature("autodoc", "* Create a new child label of me using autoamtic delivery tags provided by TagSource.
	:rtype: TDF_Label") NewChild;
		TDF_Label NewChild ();

		/****************** Nullify ******************/
		%feature("compactdefaultargs") Nullify;
		%feature("autodoc", "* Nullifies the label.
	:rtype: None") Nullify;
		void Nullify ();

		/****************** ResumeAttribute ******************/
		%feature("compactdefaultargs") ResumeAttribute;
		%feature("autodoc", "* Undo Forget action, setting its forgotten status false and its valid status true. Raises if the attribute is not in the structure.
	:param anAttribute:
	:type anAttribute: TDF_Attribute
	:rtype: None") ResumeAttribute;
		void ResumeAttribute (const opencascade::handle<TDF_Attribute> & anAttribute);

		/****************** Root ******************/
		%feature("compactdefaultargs") Root;
		%feature("autodoc", "* Returns the root label Root of the data structure. This has a depth of 0. Exceptions: Standard_NullObject if this label is null. This is because a null object can have no depth.
	:rtype: TDF_Label") Root;
		const TDF_Label Root ();

		/****************** TDF_Label ******************/
		%feature("compactdefaultargs") TDF_Label;
		%feature("autodoc", "* Constructs an empty label object.
	:rtype: None") TDF_Label;
		 TDF_Label ();

		/****************** Tag ******************/
		%feature("compactdefaultargs") Tag;
		%feature("autodoc", "* Returns the tag of the label. This is the integer assigned randomly to a label in a data framework. This integer is used to identify this label in an entry.
	:rtype: int") Tag;
		Standard_Integer Tag ();

		/****************** Transaction ******************/
		%feature("compactdefaultargs") Transaction;
		%feature("autodoc", "* Returns the current transaction index.
	:rtype: int") Transaction;
		Standard_Integer Transaction ();


        %extend{
            bool __eq_wrapper__(const TDF_Label  other) {
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
%nodefaultctor TDF_LabelMapHasher;
class TDF_LabelMapHasher {
	public:
		/****************** HashCode ******************/
		%feature("compactdefaultargs") HashCode;
		%feature("autodoc", "* Computes a hash code for the given label, in the range [1, theUpperBound] @param theLabel the label which hash code is to be computed @param theUpperBound the upper bound of the range a computing hash code must be within returns a computed hash code, in the range [1, theUpperBound]
	:param theLabel:
	:type theLabel: TDF_Label
	:param theUpperBound:
	:type theUpperBound: int
	:rtype: int") HashCode;
		static Standard_Integer HashCode (const TDF_Label & theLabel,const Standard_Integer theUpperBound);

		/****************** IsEqual ******************/
		%feature("compactdefaultargs") IsEqual;
		%feature("autodoc", "* Returns True when the two keys are the same. Two same keys must have the same hashcode, the contrary is not necessary.
	:param aLab1:
	:type aLab1: TDF_Label
	:param aLab2:
	:type aLab2: TDF_Label
	:rtype: bool") IsEqual;
		static Standard_Boolean IsEqual (const TDF_Label & aLab1,const TDF_Label & aLab2);

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
%nodefaultctor TDF_RelocationTable;
class TDF_RelocationTable : public Standard_Transient {
	public:
		/****************** AfterRelocate ******************/
		%feature("compactdefaultargs") AfterRelocate;
		%feature("autodoc", ":param afterRelocate:
	:type afterRelocate: bool
	:rtype: None") AfterRelocate;
		void AfterRelocate (const Standard_Boolean afterRelocate);

		/****************** AfterRelocate ******************/
		%feature("compactdefaultargs") AfterRelocate;
		%feature("autodoc", "* Returns <myAfterRelocate>.
	:rtype: bool") AfterRelocate;
		Standard_Boolean AfterRelocate ();

		/****************** AttributeTable ******************/
		%feature("compactdefaultargs") AttributeTable;
		%feature("autodoc", "* Returns <myAttributeTable> to be used or updated.
	:rtype: TDF_AttributeDataMap") AttributeTable;
		TDF_AttributeDataMap & AttributeTable ();

		/****************** Clear ******************/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "* Clears the relocation dictionnary, but lets the self relocation flag to its current value.
	:rtype: None") Clear;
		void Clear ();

		/****************** Dump ******************/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "* Dumps the relocation table.
	:param dumpLabels:
	:type dumpLabels: bool
	:param dumpAttributes:
	:type dumpAttributes: bool
	:param dumpTransients:
	:type dumpTransients: bool
	:param anOS:
	:type anOS: Standard_OStream
	:rtype: Standard_OStream") Dump;
		Standard_OStream & Dump (const Standard_Boolean dumpLabels,const Standard_Boolean dumpAttributes,const Standard_Boolean dumpTransients,Standard_OStream & anOS);

		/****************** HasRelocation ******************/
		%feature("compactdefaultargs") HasRelocation;
		%feature("autodoc", "* Finds the relocation value of <aSourceLabel> and returns it into <aTargetLabel>. //! (See above SelfRelocate method for more explanation about the method behavior)
	:param aSourceLabel:
	:type aSourceLabel: TDF_Label
	:param aTargetLabel:
	:type aTargetLabel: TDF_Label
	:rtype: bool") HasRelocation;
		Standard_Boolean HasRelocation (const TDF_Label & aSourceLabel,TDF_Label & aTargetLabel);

		/****************** HasRelocation ******************/
		%feature("compactdefaultargs") HasRelocation;
		%feature("autodoc", "* Finds the relocation value of <aSourceAttribute> and returns it into <aTargetAttribute>. //! (See above SelfRelocate method for more explanation about the method behavior)
	:param aSourceAttribute:
	:type aSourceAttribute: TDF_Attribute
	:param aTargetAttribute:
	:type aTargetAttribute: TDF_Attribute
	:rtype: bool") HasRelocation;
		Standard_Boolean HasRelocation (const opencascade::handle<TDF_Attribute> & aSourceAttribute,opencascade::handle<TDF_Attribute> & aTargetAttribute);

		/****************** HasTransientRelocation ******************/
		%feature("compactdefaultargs") HasTransientRelocation;
		%feature("autodoc", "* Finds the relocation value of <aSourceTransient> and returns it into <aTargetTransient>. //! (See above SelfRelocate method for more explanation about the method behavior)
	:param aSourceTransient:
	:type aSourceTransient: Standard_Transient
	:param aTargetTransient:
	:type aTargetTransient: Standard_Transient
	:rtype: bool") HasTransientRelocation;
		Standard_Boolean HasTransientRelocation (const opencascade::handle<Standard_Transient> & aSourceTransient,opencascade::handle<Standard_Transient> & aTargetTransient);

		/****************** LabelTable ******************/
		%feature("compactdefaultargs") LabelTable;
		%feature("autodoc", "* Returns <myLabelTable> to be used or updated.
	:rtype: TDF_LabelDataMap") LabelTable;
		TDF_LabelDataMap & LabelTable ();

		/****************** SelfRelocate ******************/
		%feature("compactdefaultargs") SelfRelocate;
		%feature("autodoc", "* Sets <mySelfRelocate> to <selfRelocate>. //! This flag affects the HasRelocation method behavior like this: //! <mySelfRelocate> == False: //! If no relocation object is found in the map, a null object is returned //! <mySelfRelocate> == True: //! If no relocation object is found in the map, the method assumes the source object is relocation value; so the source object is returned as target object.
	:param selfRelocate:
	:type selfRelocate: bool
	:rtype: None") SelfRelocate;
		void SelfRelocate (const Standard_Boolean selfRelocate);

		/****************** SelfRelocate ******************/
		%feature("compactdefaultargs") SelfRelocate;
		%feature("autodoc", "* Returns <mySelfRelocate>.
	:rtype: bool") SelfRelocate;
		Standard_Boolean SelfRelocate ();

		/****************** SetRelocation ******************/
		%feature("compactdefaultargs") SetRelocation;
		%feature("autodoc", "* Sets the relocation value of <aSourceLabel> to <aTargetLabel>.
	:param aSourceLabel:
	:type aSourceLabel: TDF_Label
	:param aTargetLabel:
	:type aTargetLabel: TDF_Label
	:rtype: None") SetRelocation;
		void SetRelocation (const TDF_Label & aSourceLabel,const TDF_Label & aTargetLabel);

		/****************** SetRelocation ******************/
		%feature("compactdefaultargs") SetRelocation;
		%feature("autodoc", "* Sets the relocation value of <aSourceAttribute> to <aTargetAttribute>.
	:param aSourceAttribute:
	:type aSourceAttribute: TDF_Attribute
	:param aTargetAttribute:
	:type aTargetAttribute: TDF_Attribute
	:rtype: None") SetRelocation;
		void SetRelocation (const opencascade::handle<TDF_Attribute> & aSourceAttribute,const opencascade::handle<TDF_Attribute> & aTargetAttribute);

		/****************** SetTransientRelocation ******************/
		%feature("compactdefaultargs") SetTransientRelocation;
		%feature("autodoc", "* Sets the relocation value of <aSourceTransient> to <aTargetTransient>.
	:param aSourceTransient:
	:type aSourceTransient: Standard_Transient
	:param aTargetTransient:
	:type aTargetTransient: Standard_Transient
	:rtype: None") SetTransientRelocation;
		void SetTransientRelocation (const opencascade::handle<Standard_Transient> & aSourceTransient,const opencascade::handle<Standard_Transient> & aTargetTransient);

		/****************** TDF_RelocationTable ******************/
		%feature("compactdefaultargs") TDF_RelocationTable;
		%feature("autodoc", "* Creates an relocation table. <selfRelocate> says if a value without explicit relocation is its own relocation.
	:param selfRelocate: default value is Standard_False
	:type selfRelocate: bool
	:rtype: None") TDF_RelocationTable;
		 TDF_RelocationTable (const Standard_Boolean selfRelocate = Standard_False);

		/****************** TargetAttributeMap ******************/
		%feature("compactdefaultargs") TargetAttributeMap;
		%feature("autodoc", "* Fills <anAttributeMap> with target relocation attributes. <anAttributeMap> is not cleared before use.
	:param anAttributeMap:
	:type anAttributeMap: TDF_AttributeMap
	:rtype: None") TargetAttributeMap;
		void TargetAttributeMap (TDF_AttributeMap & anAttributeMap);

		/****************** TargetLabelMap ******************/
		%feature("compactdefaultargs") TargetLabelMap;
		%feature("autodoc", "* Fills <aLabelMap> with target relocation labels. <aLabelMap> is not cleared before use.
	:param aLabelMap:
	:type aLabelMap: TDF_LabelMap
	:rtype: None") TargetLabelMap;
		void TargetLabelMap (TDF_LabelMap & aLabelMap);

		/****************** TransientTable ******************/
		%feature("compactdefaultargs") TransientTable;
		%feature("autodoc", "* Returns <myTransientTable> to be used or updated.
	:rtype: TColStd_IndexedDataMapOfTransientTransient") TransientTable;
		TColStd_IndexedDataMapOfTransientTransient & TransientTable ();

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
		%feature("compactdefaultargs") CountLabels;
		%feature("autodoc", "* Adds the labels of <aLabelList> to <aLabelMap> if they are unbound, or increases their reference counters. At the end of the process, <aLabelList> contains only the ADDED labels.
	:param aLabelList:
	:type aLabelList: TDF_LabelList
	:param aLabelMap:
	:type aLabelMap: TDF_LabelIntegerMap
	:rtype: void") CountLabels;
		static void CountLabels (TDF_LabelList & aLabelList,TDF_LabelIntegerMap & aLabelMap);

		/****************** DeductLabels ******************/
		%feature("compactdefaultargs") DeductLabels;
		%feature("autodoc", "* Decreases the reference counters of the labels of <aLabelList> to <aLabelMap>, and removes labels with null counter. At the end of the process, <aLabelList> contains only the SUPPRESSED labels.
	:param aLabelList:
	:type aLabelList: TDF_LabelList
	:param aLabelMap:
	:type aLabelMap: TDF_LabelIntegerMap
	:rtype: void") DeductLabels;
		static void DeductLabels (TDF_LabelList & aLabelList,TDF_LabelIntegerMap & aLabelMap);

		/****************** DeepDump ******************/
		%feature("compactdefaultargs") DeepDump;
		%feature("autodoc", "* Dumps <aDF> and its labels and their attributes.
	:param anOS:
	:type anOS: Standard_OStream
	:param aDF:
	:type aDF: TDF_Data
	:rtype: void") DeepDump;
		static void DeepDump (Standard_OStream & anOS,const opencascade::handle<TDF_Data> & aDF);

		/****************** DeepDump ******************/
		%feature("compactdefaultargs") DeepDump;
		%feature("autodoc", "* Dumps <aLabel>, its chilren and their attributes.
	:param anOS:
	:type anOS: Standard_OStream
	:param aLabel:
	:type aLabel: TDF_Label
	:rtype: void") DeepDump;
		static void DeepDump (Standard_OStream & anOS,const TDF_Label & aLabel);

		/****************** Entry ******************/
		%feature("compactdefaultargs") Entry;
		%feature("autodoc", "* Returns the entry for the label aLabel in the form of the ASCII character string anEntry containing the tag list for aLabel.
	:param aLabel:
	:type aLabel: TDF_Label
	:param anEntry:
	:type anEntry: TCollection_AsciiString
	:rtype: void") Entry;
		static void Entry (const TDF_Label & aLabel,TCollection_AsciiString & anEntry);

		/****************** ExtendedDeepDump ******************/
		%feature("compactdefaultargs") ExtendedDeepDump;
		%feature("autodoc", "* Dumps <aDF> and its labels and their attributes, if their IDs are kept by <aFilter>. Dumps also the attributes content.
	:param anOS:
	:type anOS: Standard_OStream
	:param aDF:
	:type aDF: TDF_Data
	:param aFilter:
	:type aFilter: TDF_IDFilter
	:rtype: void") ExtendedDeepDump;
		static void ExtendedDeepDump (Standard_OStream & anOS,const opencascade::handle<TDF_Data> & aDF,const TDF_IDFilter & aFilter);

		/****************** ExtendedDeepDump ******************/
		%feature("compactdefaultargs") ExtendedDeepDump;
		%feature("autodoc", "* Dumps <aLabel>, its chilren and their attributes, if their IDs are kept by <aFilter>. Dumps also the attributes content.
	:param anOS:
	:type anOS: Standard_OStream
	:param aLabel:
	:type aLabel: TDF_Label
	:param aFilter:
	:type aFilter: TDF_IDFilter
	:rtype: void") ExtendedDeepDump;
		static void ExtendedDeepDump (Standard_OStream & anOS,const TDF_Label & aLabel,const TDF_IDFilter & aFilter);

		/****************** IsSelfContained ******************/
		%feature("compactdefaultargs") IsSelfContained;
		%feature("autodoc", "* Returns true if <aLabel> and its descendants reference only attributes or labels attached to themselves.
	:param aLabel:
	:type aLabel: TDF_Label
	:rtype: bool") IsSelfContained;
		static Standard_Boolean IsSelfContained (const TDF_Label & aLabel);

		/****************** IsSelfContained ******************/
		%feature("compactdefaultargs") IsSelfContained;
		%feature("autodoc", "* Returns true if <aLabel> and its descendants reference only attributes or labels attached to themselves and kept by <aFilter>.
	:param aLabel:
	:type aLabel: TDF_Label
	:param aFilter:
	:type aFilter: TDF_IDFilter
	:rtype: bool") IsSelfContained;
		static Standard_Boolean IsSelfContained (const TDF_Label & aLabel,const TDF_IDFilter & aFilter);

		/****************** Label ******************/
		%feature("compactdefaultargs") Label;
		%feature("autodoc", "* Returns the label expressed by <anEntry>; creates the label if it does not exist and if <create> is true.
	:param aDF:
	:type aDF: TDF_Data
	:param anEntry:
	:type anEntry: TCollection_AsciiString
	:param aLabel:
	:type aLabel: TDF_Label
	:param create: default value is Standard_False
	:type create: bool
	:rtype: void") Label;
		static void Label (const opencascade::handle<TDF_Data> & aDF,const TCollection_AsciiString & anEntry,TDF_Label & aLabel,const Standard_Boolean create = Standard_False);

		/****************** Label ******************/
		%feature("compactdefaultargs") Label;
		%feature("autodoc", "* Returns the label expressed by <anEntry>; creates the label if it does not exist and if <create> is true.
	:param aDF:
	:type aDF: TDF_Data
	:param anEntry:
	:type anEntry: char *
	:param aLabel:
	:type aLabel: TDF_Label
	:param create: default value is Standard_False
	:type create: bool
	:rtype: void") Label;
		static void Label (const opencascade::handle<TDF_Data> & aDF,const char * anEntry,TDF_Label & aLabel,const Standard_Boolean create = Standard_False);

		/****************** Label ******************/
		%feature("compactdefaultargs") Label;
		%feature("autodoc", "* Returns the label expressed by <anEntry>; creates the label if it does not exist and if <create> is true.
	:param aDF:
	:type aDF: TDF_Data
	:param aTagList:
	:type aTagList: TColStd_ListOfInteger
	:param aLabel:
	:type aLabel: TDF_Label
	:param create: default value is Standard_False
	:type create: bool
	:rtype: void") Label;
		static void Label (const opencascade::handle<TDF_Data> & aDF,const TColStd_ListOfInteger & aTagList,TDF_Label & aLabel,const Standard_Boolean create = Standard_False);

		/****************** NbAttributes ******************/
		%feature("compactdefaultargs") NbAttributes;
		%feature("autodoc", "* Returns the total number of attributes attached to the labels dependent on the label aLabel. The attributes of aLabel are also included in this figure. This information is useful in setting the size of an array.
	:param aLabel:
	:type aLabel: TDF_Label
	:rtype: int") NbAttributes;
		static Standard_Integer NbAttributes (const TDF_Label & aLabel);

		/****************** NbAttributes ******************/
		%feature("compactdefaultargs") NbAttributes;
		%feature("autodoc", "* Returns the number of attributes of the tree, selected by a<Filter>, including those of <aLabel>.
	:param aLabel:
	:type aLabel: TDF_Label
	:param aFilter:
	:type aFilter: TDF_IDFilter
	:rtype: int") NbAttributes;
		static Standard_Integer NbAttributes (const TDF_Label & aLabel,const TDF_IDFilter & aFilter);

		/****************** NbLabels ******************/
		%feature("compactdefaultargs") NbLabels;
		%feature("autodoc", "* Returns the number of labels of the tree, including <aLabel>. aLabel is also included in this figure. This information is useful in setting the size of an array.
	:param aLabel:
	:type aLabel: TDF_Label
	:rtype: int") NbLabels;
		static Standard_Integer NbLabels (const TDF_Label & aLabel);

		/****************** OutReferences ******************/
		%feature("compactdefaultargs") OutReferences;
		%feature("autodoc", "* Returns in <atts> the referenced attributes. Caution: <atts> is not cleared before use!
	:param aLabel:
	:type aLabel: TDF_Label
	:param atts:
	:type atts: TDF_AttributeMap
	:rtype: void") OutReferences;
		static void OutReferences (const TDF_Label & aLabel,TDF_AttributeMap & atts);

		/****************** OutReferences ******************/
		%feature("compactdefaultargs") OutReferences;
		%feature("autodoc", "* Returns in <atts> the referenced attributes and kept by <aFilterForReferences>. It considers only the referers kept by <aFilterForReferers>. Caution: <atts> is not cleared before use!
	:param aLabel:
	:type aLabel: TDF_Label
	:param aFilterForReferers:
	:type aFilterForReferers: TDF_IDFilter
	:param aFilterForReferences:
	:type aFilterForReferences: TDF_IDFilter
	:param atts:
	:type atts: TDF_AttributeMap
	:rtype: void") OutReferences;
		static void OutReferences (const TDF_Label & aLabel,const TDF_IDFilter & aFilterForReferers,const TDF_IDFilter & aFilterForReferences,TDF_AttributeMap & atts);

		/****************** OutReferers ******************/
		%feature("compactdefaultargs") OutReferers;
		%feature("autodoc", "* Returns in <theAtts> the attributes having out references. //! Caution: <theAtts> is not cleared before use!
	:param theLabel:
	:type theLabel: TDF_Label
	:param theAtts:
	:type theAtts: TDF_AttributeMap
	:rtype: void") OutReferers;
		static void OutReferers (const TDF_Label & theLabel,TDF_AttributeMap & theAtts);

		/****************** OutReferers ******************/
		%feature("compactdefaultargs") OutReferers;
		%feature("autodoc", "* Returns in <atts> the attributes having out references and kept by <aFilterForReferers>. It considers only the references kept by <aFilterForReferences>. Caution: <atts> is not cleared before use!
	:param aLabel:
	:type aLabel: TDF_Label
	:param aFilterForReferers:
	:type aFilterForReferers: TDF_IDFilter
	:param aFilterForReferences:
	:type aFilterForReferences: TDF_IDFilter
	:param atts:
	:type atts: TDF_AttributeMap
	:rtype: void") OutReferers;
		static void OutReferers (const TDF_Label & aLabel,const TDF_IDFilter & aFilterForReferers,const TDF_IDFilter & aFilterForReferences,TDF_AttributeMap & atts);

		/****************** RelocateLabel ******************/
		%feature("compactdefaultargs") RelocateLabel;
		%feature("autodoc", "* Returns the label having the same sub-entry as <aLabel> but located as descendant as <toRoot> instead of <fromRoot>. //! Exemple : //! aLabel = 0:3:24:7:2:7 fromRoot = 0:3:24 toRoot = 0:5 returned label = 0:5:7:2:7
	:param aSourceLabel:
	:type aSourceLabel: TDF_Label
	:param fromRoot:
	:type fromRoot: TDF_Label
	:param toRoot:
	:type toRoot: TDF_Label
	:param aTargetLabel:
	:type aTargetLabel: TDF_Label
	:param create: default value is Standard_False
	:type create: bool
	:rtype: void") RelocateLabel;
		static void RelocateLabel (const TDF_Label & aSourceLabel,const TDF_Label & fromRoot,const TDF_Label & toRoot,TDF_Label & aTargetLabel,const Standard_Boolean create = Standard_False);

		/****************** TagList ******************/
		%feature("compactdefaultargs") TagList;
		%feature("autodoc", "* Returns the entry of <aLabel> as list of integers in <aTagList>.
	:param aLabel:
	:type aLabel: TDF_Label
	:param aTagList:
	:type aTagList: TColStd_ListOfInteger
	:rtype: void") TagList;
		static void TagList (const TDF_Label & aLabel,TColStd_ListOfInteger & aTagList);

		/****************** TagList ******************/
		%feature("compactdefaultargs") TagList;
		%feature("autodoc", "* Returns the entry expressed by <anEntry> as list of integers in <aTagList>.
	:param anEntry:
	:type anEntry: TCollection_AsciiString
	:param aTagList:
	:type aTagList: TColStd_ListOfInteger
	:rtype: void") TagList;
		static void TagList (const TCollection_AsciiString & anEntry,TColStd_ListOfInteger & aTagList);

};


%extend TDF_Tool {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************
* class TDF_Transaction *
************************/
%nodefaultctor TDF_Transaction;
class TDF_Transaction {
	public:
		/****************** Abort ******************/
		%feature("compactdefaultargs") Abort;
		%feature("autodoc", "* Aborts the transactions until AND including the current opened one.
	:rtype: None") Abort;
		void Abort ();

		/****************** Commit ******************/
		%feature("compactdefaultargs") Commit;
		%feature("autodoc", "* Commits the transactions until AND including the current opened one.
	:param withDelta: default value is Standard_False
	:type withDelta: bool
	:rtype: opencascade::handle<TDF_Delta>") Commit;
		opencascade::handle<TDF_Delta> Commit (const Standard_Boolean withDelta = Standard_False);

		/****************** Data ******************/
		%feature("compactdefaultargs") Data;
		%feature("autodoc", "* Returns the Data from TDF.
	:rtype: opencascade::handle<TDF_Data>") Data;
		opencascade::handle<TDF_Data> Data ();

		/****************** Initialize ******************/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "* Aborts all the transactions on <myDF> and sets <aDF> to build a transaction context on <aDF>, ready to be opened.
	:param aDF:
	:type aDF: TDF_Data
	:rtype: None") Initialize;
		void Initialize (const opencascade::handle<TDF_Data> & aDF);

		/****************** IsOpen ******************/
		%feature("compactdefaultargs") IsOpen;
		%feature("autodoc", "* Returns true if the transaction is open.
	:rtype: bool") IsOpen;
		Standard_Boolean IsOpen ();

		/****************** Name ******************/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "* Returns the transaction name.
	:rtype: TCollection_AsciiString") Name;
		const TCollection_AsciiString & Name ();

		/****************** Open ******************/
		%feature("compactdefaultargs") Open;
		%feature("autodoc", "* If not yet done, opens a new transaction on <myDF>. Returns the index of the just opened transaction. //! It raises DomainError if the transaction is already open, and NullObject if there is no current Data framework.
	:rtype: int") Open;
		Standard_Integer Open ();

		/****************** TDF_Transaction ******************/
		%feature("compactdefaultargs") TDF_Transaction;
		%feature("autodoc", "* Creates an empty transaction context, unable to be opened.
	:param aName: default value is ""
	:type aName: TCollection_AsciiString
	:rtype: None") TDF_Transaction;
		 TDF_Transaction (const TCollection_AsciiString & aName = "");

		/****************** TDF_Transaction ******************/
		%feature("compactdefaultargs") TDF_Transaction;
		%feature("autodoc", "* Creates a transaction context on <aDF>, ready to be opened.
	:param aDF:
	:type aDF: TDF_Data
	:param aName: default value is ""
	:type aName: TCollection_AsciiString
	:rtype: None") TDF_Transaction;
		 TDF_Transaction (const opencascade::handle<TDF_Data> & aDF,const TCollection_AsciiString & aName = "");

		/****************** Transaction ******************/
		%feature("compactdefaultargs") Transaction;
		%feature("autodoc", "* Returns the number of the transaction opened by <self>.
	:rtype: int") Transaction;
		Standard_Integer Transaction ();

};


%extend TDF_Transaction {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************
* class TDF_DeltaOnAddition *
****************************/
%nodefaultctor TDF_DeltaOnAddition;
class TDF_DeltaOnAddition : public TDF_AttributeDelta {
	public:
		/****************** Apply ******************/
		%feature("compactdefaultargs") Apply;
		%feature("autodoc", "* Applies the delta to the attribute.
	:rtype: None") Apply;
		void Apply ();

		/****************** TDF_DeltaOnAddition ******************/
		%feature("compactdefaultargs") TDF_DeltaOnAddition;
		%feature("autodoc", "* Creates a TDF_DeltaOnAddition.
	:param anAtt:
	:type anAtt: TDF_Attribute
	:rtype: None") TDF_DeltaOnAddition;
		 TDF_DeltaOnAddition (const opencascade::handle<TDF_Attribute> & anAtt);

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
%nodefaultctor TDF_DeltaOnForget;
class TDF_DeltaOnForget : public TDF_AttributeDelta {
	public:
		/****************** Apply ******************/
		%feature("compactdefaultargs") Apply;
		%feature("autodoc", "* Applies the delta to the attribute.
	:rtype: None") Apply;
		void Apply ();

		/****************** TDF_DeltaOnForget ******************/
		%feature("compactdefaultargs") TDF_DeltaOnForget;
		%feature("autodoc", "* Creates a TDF_DeltaOnForget.
	:param anAtt:
	:type anAtt: TDF_Attribute
	:rtype: None") TDF_DeltaOnForget;
		 TDF_DeltaOnForget (const opencascade::handle<TDF_Attribute> & anAtt);

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
		%feature("compactdefaultargs") Apply;
		%feature("autodoc", "* Applies the delta to the attribute.
	:rtype: void") Apply;
		virtual void Apply ();

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
%nodefaultctor TDF_DeltaOnResume;
class TDF_DeltaOnResume : public TDF_AttributeDelta {
	public:
		/****************** Apply ******************/
		%feature("compactdefaultargs") Apply;
		%feature("autodoc", "* Applies the delta to the attribute.
	:rtype: None") Apply;
		void Apply ();

		/****************** TDF_DeltaOnResume ******************/
		%feature("compactdefaultargs") TDF_DeltaOnResume;
		%feature("autodoc", "* Creates a TDF_DeltaOnResume.
	:param anAtt:
	:type anAtt: TDF_Attribute
	:rtype: None") TDF_DeltaOnResume;
		 TDF_DeltaOnResume (const opencascade::handle<TDF_Attribute> & anAtt);

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
%nodefaultctor TDF_Reference;
class TDF_Reference : public TDF_Attribute {
	public:

        %feature("autodoc", "1");
        %extend{
            std::string DumpToString() {
            std::stringstream s;
            self->Dump(s);
            return s.str();}
        };
        		/****************** Get ******************/
		%feature("compactdefaultargs") Get;
		%feature("autodoc", ":rtype: TDF_Label") Get;
		TDF_Label Get ();

		/****************** GetID ******************/
		%feature("compactdefaultargs") GetID;
		%feature("autodoc", ":rtype: Standard_GUID") GetID;
		static const Standard_GUID & GetID ();

		/****************** ID ******************/
		%feature("compactdefaultargs") ID;
		%feature("autodoc", ":rtype: Standard_GUID") ID;
		const Standard_GUID & ID ();

		/****************** NewEmpty ******************/
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", ":rtype: opencascade::handle<TDF_Attribute>") NewEmpty;
		opencascade::handle<TDF_Attribute> NewEmpty ();

		/****************** Paste ******************/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", ":param Into:
	:type Into: TDF_Attribute
	:param RT:
	:type RT: TDF_RelocationTable
	:rtype: None") Paste;
		void Paste (const opencascade::handle<TDF_Attribute> & Into,const opencascade::handle<TDF_RelocationTable> & RT);

		/****************** References ******************/
		%feature("compactdefaultargs") References;
		%feature("autodoc", ":param DS:
	:type DS: TDF_DataSet
	:rtype: void") References;
		virtual void References (const opencascade::handle<TDF_DataSet> & DS);

		/****************** Restore ******************/
		%feature("compactdefaultargs") Restore;
		%feature("autodoc", ":param With:
	:type With: TDF_Attribute
	:rtype: None") Restore;
		void Restore (const opencascade::handle<TDF_Attribute> & With);

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", ":param I:
	:type I: TDF_Label
	:param Origin:
	:type Origin: TDF_Label
	:rtype: opencascade::handle<TDF_Reference>") Set;
		static opencascade::handle<TDF_Reference> Set (const TDF_Label & I,const TDF_Label & Origin);

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", ":param Origin:
	:type Origin: TDF_Label
	:rtype: None") Set;
		void Set (const TDF_Label & Origin);

		/****************** TDF_Reference ******************/
		%feature("compactdefaultargs") TDF_Reference;
		%feature("autodoc", ":rtype: None") TDF_Reference;
		 TDF_Reference ();

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
%nodefaultctor TDF_TagSource;
class TDF_TagSource : public TDF_Attribute {
	public:
		/****************** Get ******************/
		%feature("compactdefaultargs") Get;
		%feature("autodoc", ":rtype: int") Get;
		Standard_Integer Get ();

		/****************** GetID ******************/
		%feature("compactdefaultargs") GetID;
		%feature("autodoc", "* class methods =============
	:rtype: Standard_GUID") GetID;
		static const Standard_GUID & GetID ();

		/****************** ID ******************/
		%feature("compactdefaultargs") ID;
		%feature("autodoc", ":rtype: Standard_GUID") ID;
		const Standard_GUID & ID ();

		/****************** NewChild ******************/
		%feature("compactdefaultargs") NewChild;
		%feature("autodoc", "* Find (or create) a tagSource attribute located at <L> and make a new child label. TagSource methods =================
	:param L:
	:type L: TDF_Label
	:rtype: TDF_Label") NewChild;
		static TDF_Label NewChild (const TDF_Label & L);

		/****************** NewChild ******************/
		%feature("compactdefaultargs") NewChild;
		%feature("autodoc", ":rtype: TDF_Label") NewChild;
		TDF_Label NewChild ();

		/****************** NewEmpty ******************/
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", ":rtype: opencascade::handle<TDF_Attribute>") NewEmpty;
		opencascade::handle<TDF_Attribute> NewEmpty ();

		/****************** NewTag ******************/
		%feature("compactdefaultargs") NewTag;
		%feature("autodoc", ":rtype: int") NewTag;
		Standard_Integer NewTag ();

		/****************** Paste ******************/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", ":param Into:
	:type Into: TDF_Attribute
	:param RT:
	:type RT: TDF_RelocationTable
	:rtype: None") Paste;
		void Paste (const opencascade::handle<TDF_Attribute> & Into,const opencascade::handle<TDF_RelocationTable> & RT);

		/****************** Restore ******************/
		%feature("compactdefaultargs") Restore;
		%feature("autodoc", ":param with:
	:type with: TDF_Attribute
	:rtype: None") Restore;
		void Restore (const opencascade::handle<TDF_Attribute> & with);

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "* Find, or create, a TagSource attribute. the TagSource attribute is returned.
	:param label:
	:type label: TDF_Label
	:rtype: opencascade::handle<TDF_TagSource>") Set;
		static opencascade::handle<TDF_TagSource> Set (const TDF_Label & label);

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "* TDF_Attribute methods =====================
	:param T:
	:type T: int
	:rtype: None") Set;
		void Set (const Standard_Integer T);

		/****************** TDF_TagSource ******************/
		%feature("compactdefaultargs") TDF_TagSource;
		%feature("autodoc", ":rtype: None") TDF_TagSource;
		 TDF_TagSource ();

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
%nodefaultctor TDF_DefaultDeltaOnModification;
class TDF_DefaultDeltaOnModification : public TDF_DeltaOnModification {
	public:
		/****************** Apply ******************/
		%feature("compactdefaultargs") Apply;
		%feature("autodoc", "* Applies the delta to the attribute.
	:rtype: void") Apply;
		virtual void Apply ();

		/****************** TDF_DefaultDeltaOnModification ******************/
		%feature("compactdefaultargs") TDF_DefaultDeltaOnModification;
		%feature("autodoc", "* Creates a TDF_DefaultDeltaOnModification. <anAttribute> must be the backup copy.
	:param anAttribute:
	:type anAttribute: TDF_Attribute
	:rtype: None") TDF_DefaultDeltaOnModification;
		 TDF_DefaultDeltaOnModification (const opencascade::handle<TDF_Attribute> & anAttribute);

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
%nodefaultctor TDF_DefaultDeltaOnRemoval;
class TDF_DefaultDeltaOnRemoval : public TDF_DeltaOnRemoval {
	public:
		/****************** Apply ******************/
		%feature("compactdefaultargs") Apply;
		%feature("autodoc", "* Applies the delta to the attribute.
	:rtype: void") Apply;
		virtual void Apply ();

		/****************** TDF_DefaultDeltaOnRemoval ******************/
		%feature("compactdefaultargs") TDF_DefaultDeltaOnRemoval;
		%feature("autodoc", "* Creates a TDF_DefaultDeltaOnRemoval.
	:param anAttribute:
	:type anAttribute: TDF_Attribute
	:rtype: None") TDF_DefaultDeltaOnRemoval;
		 TDF_DefaultDeltaOnRemoval (const opencascade::handle<TDF_Attribute> & anAttribute);

};


%make_alias(TDF_DefaultDeltaOnRemoval)

%extend TDF_DefaultDeltaOnRemoval {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/* harray1 classes */
class TDF_HAttributeArray1 : public  TDF_AttributeArray1, public Standard_Transient {
  public:
    TDF_HAttributeArray1(const Standard_Integer theLower, const Standard_Integer theUpper);
    TDF_HAttributeArray1(const Standard_Integer theLower, const Standard_Integer theUpper, const  TDF_AttributeArray1::value_type& theValue);
    TDF_HAttributeArray1(const  TDF_AttributeArray1& theOther);
    const  TDF_AttributeArray1& Array1();
     TDF_AttributeArray1& ChangeArray1();
};
%make_alias(TDF_HAttributeArray1)


/* harray2 classes */
/* hsequence classes */
