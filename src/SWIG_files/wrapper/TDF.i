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
%module (package="OCC") TDF

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


%include TDF_headers.i


%pythoncode {
def register_handle(handle, base_object):
    """
    Inserts the handle into the base object to
    prevent memory corruption in certain cases
    """
    try:
        if base_object.IsKind("Standard_Transient"):
            base_object.thisHandle = handle
            base_object.thisown = False
    except:
        pass
};

/* typedefs */
typedef Handle_NCollection_BaseAllocator TDF_HAllocator;
typedef TDF_LabelNode * TDF_LabelNodePtr;
/* end typedefs declaration */

/* public enums */
enum  {
	TDF_LabelNodeImportMsk = ( int ) 0x80000000,
	TDF_LabelNodeAttModMsk = 1073741824,
	TDF_LabelNodeMayModMsk = 536870912,
	TDF_LabelNodeFlagsMsk = ( TDF_LabelNodeImportMsk | TDF_LabelNodeAttModMsk | TDF_LabelNodeMayModMsk ),
};

/* end public enums declaration */

%rename(tdf) TDF;
class TDF {
	public:
		%feature("compactdefaultargs") LowestID;
		%feature("autodoc", "	* Returns ID '00000000-0000-0000-0000-000000000000', sometimes used as null ID.

	:rtype: Standard_GUID
") LowestID;
		static const Standard_GUID & LowestID ();
		%feature("compactdefaultargs") UppestID;
		%feature("autodoc", "	* Returns ID 'ffffffff-ffff-ffff-ffff-ffffffffffff'.

	:rtype: Standard_GUID
") UppestID;
		static const Standard_GUID & UppestID ();
		%feature("compactdefaultargs") AddLinkGUIDToProgID;
		%feature("autodoc", "	* Sets link between GUID and ProgID in hidden DataMap

	:param ID:
	:type ID: Standard_GUID &
	:param ProgID:
	:type ProgID: TCollection_ExtendedString &
	:rtype: void
") AddLinkGUIDToProgID;
		static void AddLinkGUIDToProgID (const Standard_GUID & ID,const TCollection_ExtendedString & ProgID);
		%feature("compactdefaultargs") GUIDFromProgID;
		%feature("autodoc", "	* Returns True if there is GUID for given <ProgID> then GUID is returned in <ID>

	:param ProgID:
	:type ProgID: TCollection_ExtendedString &
	:param ID:
	:type ID: Standard_GUID &
	:rtype: bool
") GUIDFromProgID;
		static Standard_Boolean GUIDFromProgID (const TCollection_ExtendedString & ProgID,Standard_GUID & ID);
		%feature("compactdefaultargs") ProgIDFromGUID;
		%feature("autodoc", "	* Returns True if there is ProgID for given <ID> then ProgID is returned in <ProgID>

	:param ID:
	:type ID: Standard_GUID &
	:param ProgID:
	:type ProgID: TCollection_ExtendedString &
	:rtype: bool
") ProgIDFromGUID;
		static Standard_Boolean ProgIDFromGUID (const Standard_GUID & ID,TCollection_ExtendedString & ProgID);
};


%extend TDF {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TDF_Attribute;
class TDF_Attribute : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") ID;
		%feature("autodoc", "	* Returns the ID of the attribute.

	:rtype: Standard_GUID
") ID;
		virtual const Standard_GUID & ID ();
		%feature("compactdefaultargs") Label;
		%feature("autodoc", "	* Returns the label to which the attribute is attached. If the label is not included in a DF, the label is null. See Label. Warning If the label is not included in a data framework, it is null. This function should not be redefined inline.

	:rtype: TDF_Label
") Label;
		const TDF_Label Label ();
		%feature("compactdefaultargs") Transaction;
		%feature("autodoc", "	* Returns the transaction index in which the attribute has been created or modified.

	:rtype: int
") Transaction;
		Standard_Integer Transaction ();
		%feature("compactdefaultargs") UntilTransaction;
		%feature("autodoc", "	* Returns the upper transaction index until which the attribute is/was valid. This number may vary. A removed attribute validity range is reduced to its transaction index.

	:rtype: int
") UntilTransaction;
		Standard_Integer UntilTransaction ();
		%feature("compactdefaultargs") IsValid;
		%feature("autodoc", "	* Returns true if the attribute is valid; i.e. not a backuped or removed one.

	:rtype: bool
") IsValid;
		Standard_Boolean IsValid ();
		%feature("compactdefaultargs") IsNew;
		%feature("autodoc", "	* Returns true if the attribute has no backup

	:rtype: bool
") IsNew;
		Standard_Boolean IsNew ();
		%feature("compactdefaultargs") IsForgotten;
		%feature("autodoc", "	* Returns true if the attribute forgotten status is set. //! ShortCut Methods concerning associated attributes =================================================

	:rtype: bool
") IsForgotten;
		Standard_Boolean IsForgotten ();
		%feature("compactdefaultargs") IsAttribute;
		%feature("autodoc", "	* Returns true if it exists an associated attribute of <self> with <anID> as ID.

	:param anID:
	:type anID: Standard_GUID &
	:rtype: bool
") IsAttribute;
		Standard_Boolean IsAttribute (const Standard_GUID & anID);
		%feature("compactdefaultargs") FindAttribute;
		%feature("autodoc", "	* Finds an associated attribute of <self>, according to <anID>. the returned <anAttribute> is a valid one. The method returns True if found, False otherwise. A removed attribute cannot be found using this method.

	:param anID:
	:type anID: Standard_GUID &
	:param anAttribute:
	:type anAttribute: Handle_TDF_Attribute &
	:rtype: bool
") FindAttribute;
		Standard_Boolean FindAttribute (const Standard_GUID & anID,Handle_TDF_Attribute & anAttribute);
		%feature("compactdefaultargs") AddAttribute;
		%feature("autodoc", "	* Adds an Attribute <other> to the label of <self>.Raises if there is already one of the same GUID fhan <other>.

	:param other:
	:type other: Handle_TDF_Attribute &
	:rtype: None
") AddAttribute;
		void AddAttribute (const Handle_TDF_Attribute & other);
		%feature("compactdefaultargs") ForgetAttribute;
		%feature("autodoc", "	* Forgets the Attribute of GUID <aguid> associated to the label of <self>. Be carefull that if <self> is the attribute of <guid>, <self> will have a null label after this call. If the attribute doesn't exist returns False. Otherwise returns True.

	:param aguid:
	:type aguid: Standard_GUID &
	:rtype: bool
") ForgetAttribute;
		Standard_Boolean ForgetAttribute (const Standard_GUID & aguid);
		%feature("compactdefaultargs") ForgetAllAttributes;
		%feature("autodoc", "	* Forgets all the attributes attached to the label of <self>. Does it on the sub-labels if <clearChildren> is set to true. Of course, this method is compatible with Transaction & Delta mecanisms. Be carefull that if <self> will have a null label after this call

	:param clearChildren: default value is Standard_True
	:type clearChildren: bool
	:rtype: None
") ForgetAllAttributes;
		void ForgetAllAttributes (const Standard_Boolean clearChildren = Standard_True);
		%feature("compactdefaultargs") AfterAddition;
		%feature("autodoc", "	* Something to do after adding an Attribute to a label.

	:rtype: void
") AfterAddition;
		virtual void AfterAddition ();
		%feature("compactdefaultargs") BeforeRemoval;
		%feature("autodoc", "	* Something to do before removing an Attribute from a label.

	:rtype: void
") BeforeRemoval;
		virtual void BeforeRemoval ();
		%feature("compactdefaultargs") BeforeForget;
		%feature("autodoc", "	* Something to do before forgetting an Attribute to a label.

	:rtype: void
") BeforeForget;
		virtual void BeforeForget ();
		%feature("compactdefaultargs") AfterResume;
		%feature("autodoc", "	* Something to do after resuming an Attribute from a label.

	:rtype: void
") AfterResume;
		virtual void AfterResume ();
		%feature("compactdefaultargs") AfterRetrieval;
		%feature("autodoc", "	* Something to do AFTER creation of an attribute by persistent-transient translation. The returned status says if AfterUndo has been performed (true) or if this callback must be called once again further (false). If <forceIt> is set to true, the method MUST perform and return true. Does nothing by default and returns true.

	:param forceIt: default value is Standard_False
	:type forceIt: bool
	:rtype: bool
") AfterRetrieval;
		virtual Standard_Boolean AfterRetrieval (const Standard_Boolean forceIt = Standard_False);
		%feature("compactdefaultargs") BeforeUndo;
		%feature("autodoc", "	* Something to do before applying <anAttDelta>. The returned status says if AfterUndo has been performed (true) or if this callback must be called once again further (false). If <forceIt> is set to true, the method MUST perform and return true. Does nothing by default and returns true.

	:param anAttDelta:
	:type anAttDelta: Handle_TDF_AttributeDelta &
	:param forceIt: default value is Standard_False
	:type forceIt: bool
	:rtype: bool
") BeforeUndo;
		virtual Standard_Boolean BeforeUndo (const Handle_TDF_AttributeDelta & anAttDelta,const Standard_Boolean forceIt = Standard_False);
		%feature("compactdefaultargs") AfterUndo;
		%feature("autodoc", "	* Something to do after applying <anAttDelta>. The returned status says if AfterUndo has been performed (true) or if this callback must be called once again further (false). If <forceIt> is set to true, the method MUST perform and return true. Does nothing by default and returns true.

	:param anAttDelta:
	:type anAttDelta: Handle_TDF_AttributeDelta &
	:param forceIt: default value is Standard_False
	:type forceIt: bool
	:rtype: bool
") AfterUndo;
		virtual Standard_Boolean AfterUndo (const Handle_TDF_AttributeDelta & anAttDelta,const Standard_Boolean forceIt = Standard_False);
		%feature("compactdefaultargs") BeforeCommitTransaction;
		%feature("autodoc", "	* A callback. By default does nothing. It is called by TDF_Data::CommitTransaction() method.

	:rtype: void
") BeforeCommitTransaction;
		virtual void BeforeCommitTransaction ();
		%feature("compactdefaultargs") Backup;
		%feature("autodoc", "	* Backups the attribute. The backuped attribute is flagged 'Backuped' and not 'Valid'. //! The method does nothing: //! 1) If the attribute transaction number is equal to the current transaction number (the attribute has already been backuped). //! 2) If the attribute is not attached to a label.

	:rtype: None
") Backup;
		void Backup ();
		%feature("compactdefaultargs") IsBackuped;
		%feature("autodoc", "	* Returns true if the attribute backup status is set. This status is set/unset by the Backup() method.

	:rtype: bool
") IsBackuped;
		Standard_Boolean IsBackuped ();
		%feature("compactdefaultargs") BackupCopy;
		%feature("autodoc", "	* Copies the attribute contents into a new other attribute. It is used by Backup().

	:rtype: Handle_TDF_Attribute
") BackupCopy;
		virtual Handle_TDF_Attribute BackupCopy ();
		%feature("compactdefaultargs") Restore;
		%feature("autodoc", "	* Restores the backuped contents from <anAttribute> into this one. It is used when aborting a transaction.

	:param anAttribute:
	:type anAttribute: Handle_TDF_Attribute &
	:rtype: void
") Restore;
		virtual void Restore (const Handle_TDF_Attribute & anAttribute);
		%feature("compactdefaultargs") DeltaOnAddition;
		%feature("autodoc", "	* Makes an AttributeDelta because <self> appeared. The only known use of a redefinition of this method is to return a null handle (no delta).

	:rtype: Handle_TDF_DeltaOnAddition
") DeltaOnAddition;
		virtual Handle_TDF_DeltaOnAddition DeltaOnAddition ();
		%feature("compactdefaultargs") DeltaOnForget;
		%feature("autodoc", "	* Makes an AttributeDelta because <self> has been forgotten.

	:rtype: Handle_TDF_DeltaOnForget
") DeltaOnForget;
		virtual Handle_TDF_DeltaOnForget DeltaOnForget ();
		%feature("compactdefaultargs") DeltaOnResume;
		%feature("autodoc", "	* Makes an AttributeDelta because <self> has been resumed.

	:rtype: Handle_TDF_DeltaOnResume
") DeltaOnResume;
		virtual Handle_TDF_DeltaOnResume DeltaOnResume ();
		%feature("compactdefaultargs") DeltaOnModification;
		%feature("autodoc", "	* Makes a DeltaOnModification between <self> and <anOldAttribute.

	:param anOldAttribute:
	:type anOldAttribute: Handle_TDF_Attribute &
	:rtype: Handle_TDF_DeltaOnModification
") DeltaOnModification;
		virtual Handle_TDF_DeltaOnModification DeltaOnModification (const Handle_TDF_Attribute & anOldAttribute);
		%feature("compactdefaultargs") DeltaOnModification;
		%feature("autodoc", "	* Applies a DeltaOnModification to <self>.

	:param aDelta:
	:type aDelta: Handle_TDF_DeltaOnModification &
	:rtype: void
") DeltaOnModification;
		virtual void DeltaOnModification (const Handle_TDF_DeltaOnModification & aDelta);
		%feature("compactdefaultargs") DeltaOnRemoval;
		%feature("autodoc", "	* Makes a DeltaOnRemoval on <self> because <self> has disappeared from the DS.

	:rtype: Handle_TDF_DeltaOnRemoval
") DeltaOnRemoval;
		virtual Handle_TDF_DeltaOnRemoval DeltaOnRemoval ();
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "	* Returns an new empty attribute from the good end type. It is used by the copy algorithm.

	:rtype: Handle_TDF_Attribute
") NewEmpty;
		virtual Handle_TDF_Attribute NewEmpty ();
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	* This method is different from the 'Copy' one, because it is used when copying an attribute from a source structure into a target structure. This method may paste the contents of <self> into <intoAttribute>. //! The given pasted attribute can be full or empty of its contents. But don't make a NEW! Just set the contents! //! It is possible to use <aRelocationTable> to get/set the relocation value of a source attribute.

	:param intoAttribute:
	:type intoAttribute: Handle_TDF_Attribute &
	:param aRelocationTable:
	:type aRelocationTable: Handle_TDF_RelocationTable &
	:rtype: void
") Paste;
		virtual void Paste (const Handle_TDF_Attribute & intoAttribute,const Handle_TDF_RelocationTable & aRelocationTable);
		%feature("compactdefaultargs") References;
		%feature("autodoc", "	* Adds the first level referenced attributes and labels to <aDataSet>. //! For this, use the AddLabel or AddAttribute of DataSet. //! If there is none, do not implement the method.

	:param aDataSet:
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
        		%feature("compactdefaultargs") ExtendedDump;
		%feature("autodoc", "	* Dumps the attribute content on <aStream>, using <aMap> like this: if an attribute is not in the map, first put add it to the map and then dump it. Use the map rank instead of dumping each attribute field.

	:param anOS:
	:type anOS: Standard_OStream &
	:param aFilter:
	:type aFilter: TDF_IDFilter &
	:param aMap:
	:type aMap: TDF_AttributeIndexedMap &
	:rtype: void
") ExtendedDump;
		virtual void ExtendedDump (Standard_OStream & anOS,const TDF_IDFilter & aFilter,TDF_AttributeIndexedMap & aMap);
		%feature("compactdefaultargs") Forget;
		%feature("autodoc", "	* Forgets the attribute. <aTransaction> is the current transaction in which the forget is done. A forgotten attribute is also flagged not 'Valid'. //! A forgotten attribute is invisible. Set also the 'Valid' status to False. Obvioulsy, DF cannot empty an attribute (this has a semantic signification), but can remove it from the structure. So, a forgotten attribute is NOT an empty one, but a soon DEAD one. //! Should be private.

	:param aTransaction:
	:type aTransaction: int
	:rtype: None
") Forget;
		void Forget (const Standard_Integer aTransaction);
};


%extend TDF_Attribute {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_TDF_Attribute(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_TDF_Attribute::Handle_TDF_Attribute %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_TDF_Attribute;
class Handle_TDF_Attribute : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_TDF_Attribute();
        Handle_TDF_Attribute(const Handle_TDF_Attribute &aHandle);
        Handle_TDF_Attribute(const TDF_Attribute *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_TDF_Attribute DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_TDF_Attribute {
    TDF_Attribute* _get_reference() {
    return (TDF_Attribute*)$self->Access();
    }
};

%extend Handle_TDF_Attribute {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend TDF_Attribute {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TDF_AttributeArray1;
class TDF_AttributeArray1 {
	public:
		%feature("compactdefaultargs") TDF_AttributeArray1;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") TDF_AttributeArray1;
		 TDF_AttributeArray1 (const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") TDF_AttributeArray1;
		%feature("autodoc", "	:param Item:
	:type Item: Handle_TDF_Attribute &
	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") TDF_AttributeArray1;
		 TDF_AttributeArray1 (const Handle_TDF_Attribute & Item,const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param V:
	:type V: Handle_TDF_Attribute &
	:rtype: None
") Init;
		void Init (const Handle_TDF_Attribute & V);
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
	:type Other: TDF_AttributeArray1 &
	:rtype: TDF_AttributeArray1
") Assign;
		const TDF_AttributeArray1 & Assign (const TDF_AttributeArray1 & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: TDF_AttributeArray1 &
	:rtype: TDF_AttributeArray1
") operator =;
		const TDF_AttributeArray1 & operator = (const TDF_AttributeArray1 & Other);
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
	:type Value: Handle_TDF_Attribute &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const Handle_TDF_Attribute & Value);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Handle_TDF_Attribute
") Value;
		Handle_TDF_Attribute Value (const Standard_Integer Index);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Handle_TDF_Attribute
") ChangeValue;
		Handle_TDF_Attribute ChangeValue (const Standard_Integer Index);
};


%extend TDF_AttributeArray1 {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TDF_AttributeDataMap;
class TDF_AttributeDataMap : public TCollection_BasicMap {
	public:
		%feature("compactdefaultargs") TDF_AttributeDataMap;
		%feature("autodoc", "	:param NbBuckets: default value is 1
	:type NbBuckets: int
	:rtype: None
") TDF_AttributeDataMap;
		 TDF_AttributeDataMap (const Standard_Integer NbBuckets = 1);
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: TDF_AttributeDataMap &
	:rtype: TDF_AttributeDataMap
") Assign;
		TDF_AttributeDataMap & Assign (const TDF_AttributeDataMap & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: TDF_AttributeDataMap &
	:rtype: TDF_AttributeDataMap
") operator =;
		TDF_AttributeDataMap & operator = (const TDF_AttributeDataMap & Other);
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
	:type K: Handle_TDF_Attribute &
	:param I:
	:type I: Handle_TDF_Attribute &
	:rtype: bool
") Bind;
		Standard_Boolean Bind (const Handle_TDF_Attribute & K,const Handle_TDF_Attribute & I);
		%feature("compactdefaultargs") IsBound;
		%feature("autodoc", "	:param K:
	:type K: Handle_TDF_Attribute &
	:rtype: bool
") IsBound;
		Standard_Boolean IsBound (const Handle_TDF_Attribute & K);
		%feature("compactdefaultargs") UnBind;
		%feature("autodoc", "	:param K:
	:type K: Handle_TDF_Attribute &
	:rtype: bool
") UnBind;
		Standard_Boolean UnBind (const Handle_TDF_Attribute & K);
		%feature("compactdefaultargs") Find;
		%feature("autodoc", "	:param K:
	:type K: Handle_TDF_Attribute &
	:rtype: Handle_TDF_Attribute
") Find;
		Handle_TDF_Attribute Find (const Handle_TDF_Attribute & K);
		%feature("compactdefaultargs") ChangeFind;
		%feature("autodoc", "	:param K:
	:type K: Handle_TDF_Attribute &
	:rtype: Handle_TDF_Attribute
") ChangeFind;
		Handle_TDF_Attribute ChangeFind (const Handle_TDF_Attribute & K);
		%feature("compactdefaultargs") Find1;
		%feature("autodoc", "	:param K:
	:type K: Handle_TDF_Attribute &
	:rtype: Standard_Address
") Find1;
		Standard_Address Find1 (const Handle_TDF_Attribute & K);
		%feature("compactdefaultargs") ChangeFind1;
		%feature("autodoc", "	:param K:
	:type K: Handle_TDF_Attribute &
	:rtype: Standard_Address
") ChangeFind1;
		Standard_Address ChangeFind1 (const Handle_TDF_Attribute & K);
};


%extend TDF_AttributeDataMap {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TDF_AttributeDelta;
class TDF_AttributeDelta : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") Apply;
		%feature("autodoc", "	* Applies the delta to the attribute.

	:rtype: void
") Apply;
		virtual void Apply ();
		%feature("compactdefaultargs") Label;
		%feature("autodoc", "	* Returns the label concerned by <self>.

	:rtype: TDF_Label
") Label;
		TDF_Label Label ();
		%feature("compactdefaultargs") Attribute;
		%feature("autodoc", "	* Returns the reference attribute.

	:rtype: Handle_TDF_Attribute
") Attribute;
		Handle_TDF_Attribute Attribute ();
		%feature("compactdefaultargs") ID;
		%feature("autodoc", "	* Returns the ID of the attribute concerned by <self>.

	:rtype: Standard_GUID
") ID;
		Standard_GUID ID ();

        %feature("autodoc", "1");
        %extend{
            std::string DumpToString() {
            std::stringstream s;
            self->Dump(s);
            return s.str();}
        };
        };


%extend TDF_AttributeDelta {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_TDF_AttributeDelta(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_TDF_AttributeDelta::Handle_TDF_AttributeDelta %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_TDF_AttributeDelta;
class Handle_TDF_AttributeDelta : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_TDF_AttributeDelta();
        Handle_TDF_AttributeDelta(const Handle_TDF_AttributeDelta &aHandle);
        Handle_TDF_AttributeDelta(const TDF_AttributeDelta *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_TDF_AttributeDelta DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_TDF_AttributeDelta {
    TDF_AttributeDelta* _get_reference() {
    return (TDF_AttributeDelta*)$self->Access();
    }
};

%extend Handle_TDF_AttributeDelta {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend TDF_AttributeDelta {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TDF_AttributeDeltaList;
class TDF_AttributeDeltaList {
	public:
		%feature("compactdefaultargs") TDF_AttributeDeltaList;
		%feature("autodoc", "	:rtype: None
") TDF_AttributeDeltaList;
		 TDF_AttributeDeltaList ();
		%feature("compactdefaultargs") TDF_AttributeDeltaList;
		%feature("autodoc", "	:param Other:
	:type Other: TDF_AttributeDeltaList &
	:rtype: None
") TDF_AttributeDeltaList;
		 TDF_AttributeDeltaList (const TDF_AttributeDeltaList & Other);
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: TDF_AttributeDeltaList &
	:rtype: None
") Assign;
		void Assign (const TDF_AttributeDeltaList & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: TDF_AttributeDeltaList &
	:rtype: None
") operator =;
		void operator = (const TDF_AttributeDeltaList & Other);
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
	:type I: Handle_TDF_AttributeDelta &
	:rtype: None
") Prepend;
		void Prepend (const Handle_TDF_AttributeDelta & I);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param I:
	:type I: Handle_TDF_AttributeDelta &
	:param theIt:
	:type theIt: TDF_ListIteratorOfAttributeDeltaList &
	:rtype: None
") Prepend;
		void Prepend (const Handle_TDF_AttributeDelta & I,TDF_ListIteratorOfAttributeDeltaList & theIt);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param Other:
	:type Other: TDF_AttributeDeltaList &
	:rtype: None
") Prepend;
		void Prepend (TDF_AttributeDeltaList & Other);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param I:
	:type I: Handle_TDF_AttributeDelta &
	:rtype: None
") Append;
		void Append (const Handle_TDF_AttributeDelta & I);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param I:
	:type I: Handle_TDF_AttributeDelta &
	:param theIt:
	:type theIt: TDF_ListIteratorOfAttributeDeltaList &
	:rtype: None
") Append;
		void Append (const Handle_TDF_AttributeDelta & I,TDF_ListIteratorOfAttributeDeltaList & theIt);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param Other:
	:type Other: TDF_AttributeDeltaList &
	:rtype: None
") Append;
		void Append (TDF_AttributeDeltaList & Other);
		%feature("compactdefaultargs") First;
		%feature("autodoc", "	:rtype: Handle_TDF_AttributeDelta
") First;
		Handle_TDF_AttributeDelta First ();
		%feature("compactdefaultargs") Last;
		%feature("autodoc", "	:rtype: Handle_TDF_AttributeDelta
") Last;
		Handle_TDF_AttributeDelta Last ();
		%feature("compactdefaultargs") RemoveFirst;
		%feature("autodoc", "	:rtype: None
") RemoveFirst;
		void RemoveFirst ();
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	:param It:
	:type It: TDF_ListIteratorOfAttributeDeltaList &
	:rtype: None
") Remove;
		void Remove (TDF_ListIteratorOfAttributeDeltaList & It);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param I:
	:type I: Handle_TDF_AttributeDelta &
	:param It:
	:type It: TDF_ListIteratorOfAttributeDeltaList &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Handle_TDF_AttributeDelta & I,TDF_ListIteratorOfAttributeDeltaList & It);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param Other:
	:type Other: TDF_AttributeDeltaList &
	:param It:
	:type It: TDF_ListIteratorOfAttributeDeltaList &
	:rtype: None
") InsertBefore;
		void InsertBefore (TDF_AttributeDeltaList & Other,TDF_ListIteratorOfAttributeDeltaList & It);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param I:
	:type I: Handle_TDF_AttributeDelta &
	:param It:
	:type It: TDF_ListIteratorOfAttributeDeltaList &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Handle_TDF_AttributeDelta & I,TDF_ListIteratorOfAttributeDeltaList & It);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param Other:
	:type Other: TDF_AttributeDeltaList &
	:param It:
	:type It: TDF_ListIteratorOfAttributeDeltaList &
	:rtype: None
") InsertAfter;
		void InsertAfter (TDF_AttributeDeltaList & Other,TDF_ListIteratorOfAttributeDeltaList & It);
};


%extend TDF_AttributeDeltaList {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TDF_AttributeDoubleMap;
class TDF_AttributeDoubleMap : public TCollection_BasicMap {
	public:
		%feature("compactdefaultargs") TDF_AttributeDoubleMap;
		%feature("autodoc", "	:param NbBuckets: default value is 1
	:type NbBuckets: int
	:rtype: None
") TDF_AttributeDoubleMap;
		 TDF_AttributeDoubleMap (const Standard_Integer NbBuckets = 1);
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: TDF_AttributeDoubleMap &
	:rtype: TDF_AttributeDoubleMap
") Assign;
		TDF_AttributeDoubleMap & Assign (const TDF_AttributeDoubleMap & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: TDF_AttributeDoubleMap &
	:rtype: TDF_AttributeDoubleMap
") operator =;
		TDF_AttributeDoubleMap & operator = (const TDF_AttributeDoubleMap & Other);
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
		%feature("autodoc", "	:param K1:
	:type K1: Handle_TDF_Attribute &
	:param K2:
	:type K2: Handle_TDF_Attribute &
	:rtype: None
") Bind;
		void Bind (const Handle_TDF_Attribute & K1,const Handle_TDF_Attribute & K2);
		%feature("compactdefaultargs") AreBound;
		%feature("autodoc", "	:param K1:
	:type K1: Handle_TDF_Attribute &
	:param K2:
	:type K2: Handle_TDF_Attribute &
	:rtype: bool
") AreBound;
		Standard_Boolean AreBound (const Handle_TDF_Attribute & K1,const Handle_TDF_Attribute & K2);
		%feature("compactdefaultargs") IsBound1;
		%feature("autodoc", "	:param K:
	:type K: Handle_TDF_Attribute &
	:rtype: bool
") IsBound1;
		Standard_Boolean IsBound1 (const Handle_TDF_Attribute & K);
		%feature("compactdefaultargs") IsBound2;
		%feature("autodoc", "	:param K:
	:type K: Handle_TDF_Attribute &
	:rtype: bool
") IsBound2;
		Standard_Boolean IsBound2 (const Handle_TDF_Attribute & K);
		%feature("compactdefaultargs") Find1;
		%feature("autodoc", "	:param K:
	:type K: Handle_TDF_Attribute &
	:rtype: Handle_TDF_Attribute
") Find1;
		Handle_TDF_Attribute Find1 (const Handle_TDF_Attribute & K);
		%feature("compactdefaultargs") Find2;
		%feature("autodoc", "	:param K:
	:type K: Handle_TDF_Attribute &
	:rtype: Handle_TDF_Attribute
") Find2;
		Handle_TDF_Attribute Find2 (const Handle_TDF_Attribute & K);
		%feature("compactdefaultargs") UnBind1;
		%feature("autodoc", "	:param K:
	:type K: Handle_TDF_Attribute &
	:rtype: bool
") UnBind1;
		Standard_Boolean UnBind1 (const Handle_TDF_Attribute & K);
		%feature("compactdefaultargs") UnBind2;
		%feature("autodoc", "	:param K:
	:type K: Handle_TDF_Attribute &
	:rtype: bool
") UnBind2;
		Standard_Boolean UnBind2 (const Handle_TDF_Attribute & K);
};


%extend TDF_AttributeDoubleMap {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TDF_AttributeIndexedMap;
class TDF_AttributeIndexedMap : public TCollection_BasicMap {
	public:
		%feature("compactdefaultargs") TDF_AttributeIndexedMap;
		%feature("autodoc", "	:param NbBuckets: default value is 1
	:type NbBuckets: int
	:rtype: None
") TDF_AttributeIndexedMap;
		 TDF_AttributeIndexedMap (const Standard_Integer NbBuckets = 1);
		%feature("compactdefaultargs") TDF_AttributeIndexedMap;
		%feature("autodoc", "	:param Other:
	:type Other: TDF_AttributeIndexedMap &
	:rtype: None
") TDF_AttributeIndexedMap;
		 TDF_AttributeIndexedMap (const TDF_AttributeIndexedMap & Other);
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: TDF_AttributeIndexedMap &
	:rtype: TDF_AttributeIndexedMap
") Assign;
		TDF_AttributeIndexedMap & Assign (const TDF_AttributeIndexedMap & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: TDF_AttributeIndexedMap &
	:rtype: TDF_AttributeIndexedMap
") operator =;
		TDF_AttributeIndexedMap & operator = (const TDF_AttributeIndexedMap & Other);
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
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "	:param K:
	:type K: Handle_TDF_Attribute &
	:rtype: int
") Add;
		Standard_Integer Add (const Handle_TDF_Attribute & K);
		%feature("compactdefaultargs") Substitute;
		%feature("autodoc", "	:param I:
	:type I: int
	:param K:
	:type K: Handle_TDF_Attribute &
	:rtype: None
") Substitute;
		void Substitute (const Standard_Integer I,const Handle_TDF_Attribute & K);
		%feature("compactdefaultargs") RemoveLast;
		%feature("autodoc", "	:rtype: None
") RemoveLast;
		void RemoveLast ();
		%feature("compactdefaultargs") Contains;
		%feature("autodoc", "	:param K:
	:type K: Handle_TDF_Attribute &
	:rtype: bool
") Contains;
		Standard_Boolean Contains (const Handle_TDF_Attribute & K);
		%feature("compactdefaultargs") FindKey;
		%feature("autodoc", "	:param I:
	:type I: int
	:rtype: Handle_TDF_Attribute
") FindKey;
		Handle_TDF_Attribute FindKey (const Standard_Integer I);
		%feature("compactdefaultargs") FindIndex;
		%feature("autodoc", "	:param K:
	:type K: Handle_TDF_Attribute &
	:rtype: int
") FindIndex;
		Standard_Integer FindIndex (const Handle_TDF_Attribute & K);
};


%extend TDF_AttributeIndexedMap {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TDF_AttributeIterator;
class TDF_AttributeIterator {
	public:
		%feature("compactdefaultargs") TDF_AttributeIterator;
		%feature("autodoc", "	:rtype: None
") TDF_AttributeIterator;
		 TDF_AttributeIterator ();
		%feature("compactdefaultargs") TDF_AttributeIterator;
		%feature("autodoc", "	:param aLabel:
	:type aLabel: TDF_Label &
	:param withoutForgotten: default value is Standard_True
	:type withoutForgotten: bool
	:rtype: None
") TDF_AttributeIterator;
		 TDF_AttributeIterator (const TDF_Label & aLabel,const Standard_Boolean withoutForgotten = Standard_True);
		%feature("compactdefaultargs") TDF_AttributeIterator;
		%feature("autodoc", "	:param aLabelNode:
	:type aLabelNode: TDF_LabelNodePtr
	:param withoutForgotten: default value is Standard_True
	:type withoutForgotten: bool
	:rtype: None
") TDF_AttributeIterator;
		 TDF_AttributeIterator (const TDF_LabelNodePtr aLabelNode,const Standard_Boolean withoutForgotten = Standard_True);
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "	:param aLabel:
	:type aLabel: TDF_Label &
	:param withoutForgotten: default value is Standard_True
	:type withoutForgotten: bool
	:rtype: None
") Initialize;
		void Initialize (const TDF_Label & aLabel,const Standard_Boolean withoutForgotten = Standard_True);
		%feature("compactdefaultargs") More;
		%feature("autodoc", "	:rtype: inline bool
") More;
		inline Standard_Boolean More ();
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "	:rtype: None
") Next;
		void Next ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: inline TDF_Attribute *
") Value;
		inline TDF_Attribute * Value ();
};


%extend TDF_AttributeIterator {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TDF_AttributeList;
class TDF_AttributeList {
	public:
		%feature("compactdefaultargs") TDF_AttributeList;
		%feature("autodoc", "	:rtype: None
") TDF_AttributeList;
		 TDF_AttributeList ();
		%feature("compactdefaultargs") TDF_AttributeList;
		%feature("autodoc", "	:param Other:
	:type Other: TDF_AttributeList &
	:rtype: None
") TDF_AttributeList;
		 TDF_AttributeList (const TDF_AttributeList & Other);
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: TDF_AttributeList &
	:rtype: None
") Assign;
		void Assign (const TDF_AttributeList & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: TDF_AttributeList &
	:rtype: None
") operator =;
		void operator = (const TDF_AttributeList & Other);
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
	:type I: Handle_TDF_Attribute &
	:rtype: None
") Prepend;
		void Prepend (const Handle_TDF_Attribute & I);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param I:
	:type I: Handle_TDF_Attribute &
	:param theIt:
	:type theIt: TDF_ListIteratorOfAttributeList &
	:rtype: None
") Prepend;
		void Prepend (const Handle_TDF_Attribute & I,TDF_ListIteratorOfAttributeList & theIt);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param Other:
	:type Other: TDF_AttributeList &
	:rtype: None
") Prepend;
		void Prepend (TDF_AttributeList & Other);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param I:
	:type I: Handle_TDF_Attribute &
	:rtype: None
") Append;
		void Append (const Handle_TDF_Attribute & I);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param I:
	:type I: Handle_TDF_Attribute &
	:param theIt:
	:type theIt: TDF_ListIteratorOfAttributeList &
	:rtype: None
") Append;
		void Append (const Handle_TDF_Attribute & I,TDF_ListIteratorOfAttributeList & theIt);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param Other:
	:type Other: TDF_AttributeList &
	:rtype: None
") Append;
		void Append (TDF_AttributeList & Other);
		%feature("compactdefaultargs") First;
		%feature("autodoc", "	:rtype: Handle_TDF_Attribute
") First;
		Handle_TDF_Attribute First ();
		%feature("compactdefaultargs") Last;
		%feature("autodoc", "	:rtype: Handle_TDF_Attribute
") Last;
		Handle_TDF_Attribute Last ();
		%feature("compactdefaultargs") RemoveFirst;
		%feature("autodoc", "	:rtype: None
") RemoveFirst;
		void RemoveFirst ();
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	:param It:
	:type It: TDF_ListIteratorOfAttributeList &
	:rtype: None
") Remove;
		void Remove (TDF_ListIteratorOfAttributeList & It);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param I:
	:type I: Handle_TDF_Attribute &
	:param It:
	:type It: TDF_ListIteratorOfAttributeList &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Handle_TDF_Attribute & I,TDF_ListIteratorOfAttributeList & It);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param Other:
	:type Other: TDF_AttributeList &
	:param It:
	:type It: TDF_ListIteratorOfAttributeList &
	:rtype: None
") InsertBefore;
		void InsertBefore (TDF_AttributeList & Other,TDF_ListIteratorOfAttributeList & It);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param I:
	:type I: Handle_TDF_Attribute &
	:param It:
	:type It: TDF_ListIteratorOfAttributeList &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Handle_TDF_Attribute & I,TDF_ListIteratorOfAttributeList & It);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param Other:
	:type Other: TDF_AttributeList &
	:param It:
	:type It: TDF_ListIteratorOfAttributeList &
	:rtype: None
") InsertAfter;
		void InsertAfter (TDF_AttributeList & Other,TDF_ListIteratorOfAttributeList & It);
};


%extend TDF_AttributeList {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TDF_AttributeMap;
class TDF_AttributeMap : public TCollection_BasicMap {
	public:
		%feature("compactdefaultargs") TDF_AttributeMap;
		%feature("autodoc", "	:param NbBuckets: default value is 1
	:type NbBuckets: int
	:rtype: None
") TDF_AttributeMap;
		 TDF_AttributeMap (const Standard_Integer NbBuckets = 1);
		%feature("compactdefaultargs") TDF_AttributeMap;
		%feature("autodoc", "	:param Other:
	:type Other: TDF_AttributeMap &
	:rtype: None
") TDF_AttributeMap;
		 TDF_AttributeMap (const TDF_AttributeMap & Other);
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: TDF_AttributeMap &
	:rtype: TDF_AttributeMap
") Assign;
		TDF_AttributeMap & Assign (const TDF_AttributeMap & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: TDF_AttributeMap &
	:rtype: TDF_AttributeMap
") operator =;
		TDF_AttributeMap & operator = (const TDF_AttributeMap & Other);
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
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "	:param aKey:
	:type aKey: Handle_TDF_Attribute &
	:rtype: bool
") Add;
		Standard_Boolean Add (const Handle_TDF_Attribute & aKey);
		%feature("compactdefaultargs") Contains;
		%feature("autodoc", "	:param aKey:
	:type aKey: Handle_TDF_Attribute &
	:rtype: bool
") Contains;
		Standard_Boolean Contains (const Handle_TDF_Attribute & aKey);
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	:param aKey:
	:type aKey: Handle_TDF_Attribute &
	:rtype: bool
") Remove;
		Standard_Boolean Remove (const Handle_TDF_Attribute & aKey);
};


%extend TDF_AttributeMap {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TDF_AttributeSequence;
class TDF_AttributeSequence : public TCollection_BaseSequence {
	public:
		%feature("compactdefaultargs") TDF_AttributeSequence;
		%feature("autodoc", "	:rtype: None
") TDF_AttributeSequence;
		 TDF_AttributeSequence ();
		%feature("compactdefaultargs") TDF_AttributeSequence;
		%feature("autodoc", "	:param Other:
	:type Other: TDF_AttributeSequence &
	:rtype: None
") TDF_AttributeSequence;
		 TDF_AttributeSequence (const TDF_AttributeSequence & Other);
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: TDF_AttributeSequence &
	:rtype: TDF_AttributeSequence
") Assign;
		const TDF_AttributeSequence & Assign (const TDF_AttributeSequence & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: TDF_AttributeSequence &
	:rtype: TDF_AttributeSequence
") operator =;
		const TDF_AttributeSequence & operator = (const TDF_AttributeSequence & Other);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param T:
	:type T: Handle_TDF_Attribute &
	:rtype: None
") Append;
		void Append (const Handle_TDF_Attribute & T);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param S:
	:type S: TDF_AttributeSequence &
	:rtype: None
") Append;
		void Append (TDF_AttributeSequence & S);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param T:
	:type T: Handle_TDF_Attribute &
	:rtype: None
") Prepend;
		void Prepend (const Handle_TDF_Attribute & T);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param S:
	:type S: TDF_AttributeSequence &
	:rtype: None
") Prepend;
		void Prepend (TDF_AttributeSequence & S);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param T:
	:type T: Handle_TDF_Attribute &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const Handle_TDF_Attribute & T);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param S:
	:type S: TDF_AttributeSequence &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,TDF_AttributeSequence & S);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param T:
	:type T: Handle_TDF_Attribute &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const Handle_TDF_Attribute & T);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param S:
	:type S: TDF_AttributeSequence &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,TDF_AttributeSequence & S);
		%feature("compactdefaultargs") First;
		%feature("autodoc", "	:rtype: Handle_TDF_Attribute
") First;
		Handle_TDF_Attribute First ();
		%feature("compactdefaultargs") Last;
		%feature("autodoc", "	:rtype: Handle_TDF_Attribute
") Last;
		Handle_TDF_Attribute Last ();
		%feature("compactdefaultargs") Split;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param Sub:
	:type Sub: TDF_AttributeSequence &
	:rtype: None
") Split;
		void Split (const Standard_Integer Index,TDF_AttributeSequence & Sub);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Handle_TDF_Attribute
") Value;
		Handle_TDF_Attribute Value (const Standard_Integer Index);
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param I:
	:type I: Handle_TDF_Attribute &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const Handle_TDF_Attribute & I);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Handle_TDF_Attribute
") ChangeValue;
		Handle_TDF_Attribute ChangeValue (const Standard_Integer Index);
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: None
") Remove;
		void Remove (const Standard_Integer Index);
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	:param FromIndex:
	:type FromIndex: int
	:param ToIndex:
	:type ToIndex: int
	:rtype: None
") Remove;
		void Remove (const Standard_Integer FromIndex,const Standard_Integer ToIndex);
};


%extend TDF_AttributeSequence {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TDF_ChildIDIterator;
class TDF_ChildIDIterator {
	public:
		%feature("compactdefaultargs") TDF_ChildIDIterator;
		%feature("autodoc", "	* Creates an empty iterator.

	:rtype: None
") TDF_ChildIDIterator;
		 TDF_ChildIDIterator ();
		%feature("compactdefaultargs") TDF_ChildIDIterator;
		%feature("autodoc", "	* Iterates on the children of the given label. If <allLevels> option is set to true, it explores not only the first, but all the sub label levels.

	:param aLabel:
	:type aLabel: TDF_Label &
	:param anID:
	:type anID: Standard_GUID &
	:param allLevels: default value is Standard_False
	:type allLevels: bool
	:rtype: None
") TDF_ChildIDIterator;
		 TDF_ChildIDIterator (const TDF_Label & aLabel,const Standard_GUID & anID,const Standard_Boolean allLevels = Standard_False);
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "	* Initializes the iteration on the children of the given label. If <allLevels> option is set to true, it explores not only the first, but all the sub label levels.

	:param aLabel:
	:type aLabel: TDF_Label &
	:param anID:
	:type anID: Standard_GUID &
	:param allLevels: default value is Standard_False
	:type allLevels: bool
	:rtype: None
") Initialize;
		void Initialize (const TDF_Label & aLabel,const Standard_GUID & anID,const Standard_Boolean allLevels = Standard_False);
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
		%feature("autodoc", "	* Move to the next Brother. If there is none, go up etc. This method is interesting only with 'allLevels' behavior, because it avoids to explore the current label children.

	:rtype: None
") NextBrother;
		void NextBrother ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	* Returns the current item; a null handle if there is none.

	:rtype: Handle_TDF_Attribute
") Value;
		Handle_TDF_Attribute Value ();
};


%extend TDF_ChildIDIterator {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TDF_ChildIterator;
class TDF_ChildIterator {
	public:
		%feature("compactdefaultargs") TDF_ChildIterator;
		%feature("autodoc", "	* Creates an empty iterator object to explore the children of a label.

	:rtype: None
") TDF_ChildIterator;
		 TDF_ChildIterator ();
		%feature("compactdefaultargs") TDF_ChildIterator;
		%feature("autodoc", "	* Constructs the iterator object defined by the label aLabel. Iterates on the children of the given label. If <allLevels> option is set to true, it explores not only the first, but all the sub label levels.

	:param aLabel:
	:type aLabel: TDF_Label &
	:param allLevels: default value is Standard_False
	:type allLevels: bool
	:rtype: None
") TDF_ChildIterator;
		 TDF_ChildIterator (const TDF_Label & aLabel,const Standard_Boolean allLevels = Standard_False);
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "	* Initializes the iteration on the children of the given label. If <allLevels> option is set to true, it explores not only the first, but all the sub label levels. If allLevels is false, only the first level of child labels is explored. In the example below, the label is iterated using Initialize, More and Next and its child labels dumped using TDF_Tool::Entry. Example void DumpChildren(const TDF_Label& aLabel) { TDF_ChildIterator it; TCollection_AsciiString es; for (it.Initialize(aLabel,Standard_True); it.More(); it.Next()){ TDF_Tool::Entry(it.Value(),es); cout << as.ToCString() << endl; } }

	:param aLabel:
	:type aLabel: TDF_Label &
	:param allLevels: default value is Standard_False
	:type allLevels: bool
	:rtype: None
") Initialize;
		void Initialize (const TDF_Label & aLabel,const Standard_Boolean allLevels = Standard_False);
		%feature("compactdefaultargs") More;
		%feature("autodoc", "	* Returns true if a current label is found in the iteration process.

	:rtype: bool
") More;
		Standard_Boolean More ();
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "	* Move the current iteration to the next Item.

	:rtype: None
") Next;
		void Next ();
		%feature("compactdefaultargs") NextBrother;
		%feature("autodoc", "	* Moves this iteration to the next brother label. A brother label is one with the same father as an initial label. Use this function when the non-empty constructor or Initialize has allLevels set to true. The result is that the iteration does not explore the children of the current label. This method is interesting only with 'allLevels' behavior, because it avoids to explore the current label children.

	:rtype: None
") NextBrother;
		void NextBrother ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	* Returns the current label; or, if there is none, a null label.

	:rtype: TDF_Label
") Value;
		const TDF_Label Value ();
};


%extend TDF_ChildIterator {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TDF_ClosureMode;
class TDF_ClosureMode {
	public:
		%feature("compactdefaultargs") TDF_ClosureMode;
		%feature("autodoc", "	* Creates an objet with all modes set to <aMode>.

	:param aMode: default value is Standard_True
	:type aMode: bool
	:rtype: None
") TDF_ClosureMode;
		 TDF_ClosureMode (const Standard_Boolean aMode = Standard_True);
		%feature("compactdefaultargs") Descendants;
		%feature("autodoc", "	* Sets the mode 'Descendants' to <aStatus>. //! 'Descendants' mode means we add to the data set the children labels of each USER GIVEN label. We do not do that with the labels found applying UpToFirstLevel option.

	:param aStatus:
	:type aStatus: bool
	:rtype: None
") Descendants;
		void Descendants (const Standard_Boolean aStatus);
		%feature("compactdefaultargs") Descendants;
		%feature("autodoc", "	* Returns true if the mode 'Descendants' is set.

	:rtype: bool
") Descendants;
		Standard_Boolean Descendants ();
		%feature("compactdefaultargs") References;
		%feature("autodoc", "	* Sets the mode 'References' to <aStatus>. //! 'References' mode means we add to the data set the descendants of an attribute, by calling the attribute method Descendants().

	:param aStatus:
	:type aStatus: bool
	:rtype: None
") References;
		void References (const Standard_Boolean aStatus);
		%feature("compactdefaultargs") References;
		%feature("autodoc", "	* Returns true if the mode 'References' is set.

	:rtype: bool
") References;
		Standard_Boolean References ();
};


%extend TDF_ClosureMode {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
class TDF_ClosureTool {
	public:
		%feature("compactdefaultargs") Closure;
		%feature("autodoc", "	* Builds the transitive closure of label and attribute sets into <aDataSet>.

	:param aDataSet:
	:type aDataSet: Handle_TDF_DataSet &
	:rtype: void
") Closure;
		static void Closure (const Handle_TDF_DataSet & aDataSet);
		%feature("compactdefaultargs") Closure;
		%feature("autodoc", "	* Builds the transitive closure of label and attribute sets into <aDataSet>. Uses <aFilter> to determine if an attribute has to be taken in account or not. Uses <aMode> for various way of closing.

	:param aDataSet:
	:type aDataSet: Handle_TDF_DataSet &
	:param aFilter:
	:type aFilter: TDF_IDFilter &
	:param aMode:
	:type aMode: TDF_ClosureMode &
	:rtype: void
") Closure;
		static void Closure (const Handle_TDF_DataSet & aDataSet,const TDF_IDFilter & aFilter,const TDF_ClosureMode & aMode);
		%feature("compactdefaultargs") Closure;
		%feature("autodoc", "	* Builds the transitive closure of <aLabel>.

	:param aLabel:
	:type aLabel: TDF_Label &
	:param aLabMap:
	:type aLabMap: TDF_LabelMap &
	:param anAttMap:
	:type anAttMap: TDF_AttributeMap &
	:param aFilter:
	:type aFilter: TDF_IDFilter &
	:param aMode:
	:type aMode: TDF_ClosureMode &
	:rtype: void
") Closure;
		static void Closure (const TDF_Label & aLabel,TDF_LabelMap & aLabMap,TDF_AttributeMap & anAttMap,const TDF_IDFilter & aFilter,const TDF_ClosureMode & aMode);
};


%extend TDF_ClosureTool {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
class TDF_ComparisonTool {
	public:
		%feature("compactdefaultargs") Compare;
		%feature("autodoc", "	* Compares <aSourceDataSet> with <aTargetDataSet>, updating <aRelocationTable> with labels and attributes found in both sets.

	:param aSourceDataSet:
	:type aSourceDataSet: Handle_TDF_DataSet &
	:param aTargetDataSet:
	:type aTargetDataSet: Handle_TDF_DataSet &
	:param aFilter:
	:type aFilter: TDF_IDFilter &
	:param aRelocationTable:
	:type aRelocationTable: Handle_TDF_RelocationTable &
	:rtype: void
") Compare;
		static void Compare (const Handle_TDF_DataSet & aSourceDataSet,const Handle_TDF_DataSet & aTargetDataSet,const TDF_IDFilter & aFilter,const Handle_TDF_RelocationTable & aRelocationTable);
		%feature("compactdefaultargs") SourceUnbound;
		%feature("autodoc", "	* Finds from <aRefDataSet> all the keys not bound into <aRelocationTable> and put them into <aDiffDataSet>. Returns True if the difference contains at least one key. (A key is a source object). //! <anOption> may take the following values: 1 : labels treatment only; 2 : attributes treatment only (default value); 3 : both labels & attributes treatment.

	:param aRefDataSet:
	:type aRefDataSet: Handle_TDF_DataSet &
	:param aRelocationTable:
	:type aRelocationTable: Handle_TDF_RelocationTable &
	:param aFilter:
	:type aFilter: TDF_IDFilter &
	:param aDiffDataSet:
	:type aDiffDataSet: Handle_TDF_DataSet &
	:param anOption: default value is 2
	:type anOption: int
	:rtype: bool
") SourceUnbound;
		static Standard_Boolean SourceUnbound (const Handle_TDF_DataSet & aRefDataSet,const Handle_TDF_RelocationTable & aRelocationTable,const TDF_IDFilter & aFilter,const Handle_TDF_DataSet & aDiffDataSet,const Standard_Integer anOption = 2);
		%feature("compactdefaultargs") TargetUnbound;
		%feature("autodoc", "	* Substracts from <aRefDataSet> all the items bound into <aRelocationTable>. The result is put into <aDiffDataSet>. Returns True if the difference contains at least one item. (An item is a target object). //! <anOption> may take the following values: 1 : labels treatment only; 2 : attributes treatment only(default value); 3 : both labels & attributes treatment.

	:param aRefDataSet:
	:type aRefDataSet: Handle_TDF_DataSet &
	:param aRelocationTable:
	:type aRelocationTable: Handle_TDF_RelocationTable &
	:param aFilter:
	:type aFilter: TDF_IDFilter &
	:param aDiffDataSet:
	:type aDiffDataSet: Handle_TDF_DataSet &
	:param anOption: default value is 2
	:type anOption: int
	:rtype: bool
") TargetUnbound;
		static Standard_Boolean TargetUnbound (const Handle_TDF_DataSet & aRefDataSet,const Handle_TDF_RelocationTable & aRelocationTable,const TDF_IDFilter & aFilter,const Handle_TDF_DataSet & aDiffDataSet,const Standard_Integer anOption = 2);
		%feature("compactdefaultargs") Cut;
		%feature("autodoc", "	* Removes attributes from <aDataSet>.

	:param aDataSet:
	:type aDataSet: Handle_TDF_DataSet &
	:rtype: void
") Cut;
		static void Cut (const Handle_TDF_DataSet & aDataSet);
		%feature("compactdefaultargs") IsSelfContained;
		%feature("autodoc", "	* Returns true if all the labels of <aDataSet> are descendant of <aLabel>.

	:param aLabel:
	:type aLabel: TDF_Label &
	:param aDataSet:
	:type aDataSet: Handle_TDF_DataSet &
	:rtype: bool
") IsSelfContained;
		static Standard_Boolean IsSelfContained (const TDF_Label & aLabel,const Handle_TDF_DataSet & aDataSet);
};


%extend TDF_ComparisonTool {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TDF_CopyLabel;
class TDF_CopyLabel {
	public:
		%feature("compactdefaultargs") TDF_CopyLabel;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") TDF_CopyLabel;
		 TDF_CopyLabel ();
		%feature("compactdefaultargs") TDF_CopyLabel;
		%feature("autodoc", "	* CopyTool

	:param aSource:
	:type aSource: TDF_Label &
	:param aTarget:
	:type aTarget: TDF_Label &
	:rtype: None
") TDF_CopyLabel;
		 TDF_CopyLabel (const TDF_Label & aSource,const TDF_Label & aTarget);
		%feature("compactdefaultargs") Load;
		%feature("autodoc", "	* Loads src and tgt labels

	:param aSource:
	:type aSource: TDF_Label &
	:param aTarget:
	:type aTarget: TDF_Label &
	:rtype: None
") Load;
		void Load (const TDF_Label & aSource,const TDF_Label & aTarget);
		%feature("compactdefaultargs") UseFilter;
		%feature("autodoc", "	* Sets filter

	:param aFilter:
	:type aFilter: TDF_IDFilter &
	:rtype: None
") UseFilter;
		void UseFilter (const TDF_IDFilter & aFilter);
		%feature("compactdefaultargs") ExternalReferences;
		%feature("autodoc", "	* Check external references and if exist fills the aExternals Map

	:param Lab:
	:type Lab: TDF_Label &
	:param aExternals:
	:type aExternals: TDF_AttributeMap &
	:param aFilter:
	:type aFilter: TDF_IDFilter &
	:rtype: bool
") ExternalReferences;
		static Standard_Boolean ExternalReferences (const TDF_Label & Lab,TDF_AttributeMap & aExternals,const TDF_IDFilter & aFilter);
		%feature("compactdefaultargs") ExternalReferences;
		%feature("autodoc", "	* Check external references and if exist fills the aExternals Map

	:param aRefLab:
	:type aRefLab: TDF_Label &
	:param Lab:
	:type Lab: TDF_Label &
	:param aExternals:
	:type aExternals: TDF_AttributeMap &
	:param aFilter:
	:type aFilter: TDF_IDFilter &
	:param aDataSet:
	:type aDataSet: Handle_TDF_DataSet &
	:rtype: void
") ExternalReferences;
		static void ExternalReferences (const TDF_Label & aRefLab,const TDF_Label & Lab,TDF_AttributeMap & aExternals,const TDF_IDFilter & aFilter,Handle_TDF_DataSet & aDataSet);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	* performs algorithm of selfcontained copy

	:rtype: None
") Perform;
		void Perform ();
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
		%feature("compactdefaultargs") RelocationTable;
		%feature("autodoc", "	* returns relocation table

	:rtype: Handle_TDF_RelocationTable
") RelocationTable;
		Handle_TDF_RelocationTable RelocationTable ();
};


%extend TDF_CopyLabel {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
class TDF_CopyTool {
	public:
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "	* Copy <aSourceDataSet> with using and updating <aRelocationTable>. This method ignores target attributes privilege over source ones.

	:param aSourceDataSet:
	:type aSourceDataSet: Handle_TDF_DataSet &
	:param aRelocationTable:
	:type aRelocationTable: Handle_TDF_RelocationTable &
	:rtype: void
") Copy;
		static void Copy (const Handle_TDF_DataSet & aSourceDataSet,const Handle_TDF_RelocationTable & aRelocationTable);
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "	* Copy <aSourceDataSet> using and updating <aRelocationTable>. Use <aPrivilegeFilter> to give a list of IDs for which the target attribute prevails over the source one.

	:param aSourceDataSet:
	:type aSourceDataSet: Handle_TDF_DataSet &
	:param aRelocationTable:
	:type aRelocationTable: Handle_TDF_RelocationTable &
	:param aPrivilegeFilter:
	:type aPrivilegeFilter: TDF_IDFilter &
	:rtype: void
") Copy;
		static void Copy (const Handle_TDF_DataSet & aSourceDataSet,const Handle_TDF_RelocationTable & aRelocationTable,const TDF_IDFilter & aPrivilegeFilter);
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "	* Copy <aSourceDataSet> using and updating <aRelocationTable>. Use <aPrivilegeFilter> to give a list of IDs for which the target attribute prevails over the source one. If <setSelfContained> is set to true, every TDF_Reference will be replaced by the referenced structure according to <aRefFilter>. //! NB: <aRefFilter> is used only if <setSelfContained> is true. Internal root label copy recursive method.

	:param aSourceDataSet:
	:type aSourceDataSet: Handle_TDF_DataSet &
	:param aRelocationTable:
	:type aRelocationTable: Handle_TDF_RelocationTable &
	:param aPrivilegeFilter:
	:type aPrivilegeFilter: TDF_IDFilter &
	:param aRefFilter:
	:type aRefFilter: TDF_IDFilter &
	:param setSelfContained:
	:type setSelfContained: bool
	:rtype: void
") Copy;
		static void Copy (const Handle_TDF_DataSet & aSourceDataSet,const Handle_TDF_RelocationTable & aRelocationTable,const TDF_IDFilter & aPrivilegeFilter,const TDF_IDFilter & aRefFilter,const Standard_Boolean setSelfContained);
};


%extend TDF_CopyTool {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TDF_Data;
class TDF_Data : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") TDF_Data;
		%feature("autodoc", "	* A new and empty Data structure.

	:rtype: None
") TDF_Data;
		 TDF_Data ();
		%feature("compactdefaultargs") Root;
		%feature("autodoc", "	* Returns the root label of the Data structure.

	:rtype: TDF_Label
") Root;
		const TDF_Label Root ();
		%feature("compactdefaultargs") Transaction;
		%feature("autodoc", "	* Returns the current transaction number.

	:rtype: int
") Transaction;
		Standard_Integer Transaction ();
		%feature("compactdefaultargs") Time;
		%feature("autodoc", "	* Returns the current tick. It is incremented each Commit.

	:rtype: int
") Time;
		Standard_Integer Time ();
		%feature("compactdefaultargs") IsApplicable;
		%feature("autodoc", "	* Returns true if <aDelta> is applicable HERE and NOW.

	:param aDelta:
	:type aDelta: Handle_TDF_Delta &
	:rtype: bool
") IsApplicable;
		Standard_Boolean IsApplicable (const Handle_TDF_Delta & aDelta);
		%feature("compactdefaultargs") Undo;
		%feature("autodoc", "	* Apply <aDelta> to undo a set of attribute modifications. //! Optionnal <withDelta> set to True indiquates a Delta Set must be generated. (See above)

	:param aDelta:
	:type aDelta: Handle_TDF_Delta &
	:param withDelta: default value is Standard_False
	:type withDelta: bool
	:rtype: Handle_TDF_Delta
") Undo;
		Handle_TDF_Delta Undo (const Handle_TDF_Delta & aDelta,const Standard_Boolean withDelta = Standard_False);
		%feature("compactdefaultargs") Destroy;
		%feature("autodoc", "	:rtype: None
") Destroy;
		void Destroy ();
		%feature("compactdefaultargs") NotUndoMode;
		%feature("autodoc", "	* Returns the undo mode status.

	:rtype: bool
") NotUndoMode;
		Standard_Boolean NotUndoMode ();

        %feature("autodoc", "1");
        %extend{
            std::string DumpToString() {
            std::stringstream s;
            self->Dump(s);
            return s.str();}
        };
        		%feature("compactdefaultargs") AllowModification;
		%feature("autodoc", "	* Sets modification mode.

	:param isAllowed:
	:type isAllowed: bool
	:rtype: None
") AllowModification;
		void AllowModification (const Standard_Boolean isAllowed);
		%feature("compactdefaultargs") IsModificationAllowed;
		%feature("autodoc", "	* returns modification mode.

	:rtype: bool
") IsModificationAllowed;
		Standard_Boolean IsModificationAllowed ();
		%feature("compactdefaultargs") LabelNodeAllocator;
		%feature("autodoc", "	* Returns TDF_HAllocator, which is an incremental allocator used by TDF_LabelNode. This allocator is used to manage TDF_LabelNode objects, but it can also be used for allocating memory to application-specific data (be careful because this allocator does not release the memory). The benefits of this allocation scheme are noticeable when dealing with large OCAF documents, due to: 1. Very quick allocation of objects (memory heap is not used, the algorithm that replaces it is very simple). 2. Very quick destruction of objects (memory is released not by destructors of TDF_LabelNode, but rather by the destructor of TDF_Data). 3. TDF_LabelNode objects do not fragmentize the memory; they are kept compactly in a number of arrays of 16K each. 4. Swapping is reduced on large data, because each document now occupies a smaller number of memory pages.

	:rtype: TDF_HAllocator
") LabelNodeAllocator;
		const TDF_HAllocator & LabelNodeAllocator ();
};


%extend TDF_Data {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_TDF_Data(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_TDF_Data::Handle_TDF_Data %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_TDF_Data;
class Handle_TDF_Data : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_TDF_Data();
        Handle_TDF_Data(const Handle_TDF_Data &aHandle);
        Handle_TDF_Data(const TDF_Data *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_TDF_Data DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_TDF_Data {
    TDF_Data* _get_reference() {
    return (TDF_Data*)$self->Access();
    }
};

%extend Handle_TDF_Data {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend TDF_Data {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TDF_DataMapIteratorOfAttributeDataMap;
class TDF_DataMapIteratorOfAttributeDataMap : public TCollection_BasicMapIterator {
	public:
		%feature("compactdefaultargs") TDF_DataMapIteratorOfAttributeDataMap;
		%feature("autodoc", "	:rtype: None
") TDF_DataMapIteratorOfAttributeDataMap;
		 TDF_DataMapIteratorOfAttributeDataMap ();
		%feature("compactdefaultargs") TDF_DataMapIteratorOfAttributeDataMap;
		%feature("autodoc", "	:param aMap:
	:type aMap: TDF_AttributeDataMap &
	:rtype: None
") TDF_DataMapIteratorOfAttributeDataMap;
		 TDF_DataMapIteratorOfAttributeDataMap (const TDF_AttributeDataMap & aMap);
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "	:param aMap:
	:type aMap: TDF_AttributeDataMap &
	:rtype: None
") Initialize;
		void Initialize (const TDF_AttributeDataMap & aMap);
		%feature("compactdefaultargs") Key;
		%feature("autodoc", "	:rtype: Handle_TDF_Attribute
") Key;
		Handle_TDF_Attribute Key ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: Handle_TDF_Attribute
") Value;
		Handle_TDF_Attribute Value ();
};


%extend TDF_DataMapIteratorOfAttributeDataMap {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TDF_DataMapIteratorOfLabelDataMap;
class TDF_DataMapIteratorOfLabelDataMap : public TCollection_BasicMapIterator {
	public:
		%feature("compactdefaultargs") TDF_DataMapIteratorOfLabelDataMap;
		%feature("autodoc", "	:rtype: None
") TDF_DataMapIteratorOfLabelDataMap;
		 TDF_DataMapIteratorOfLabelDataMap ();
		%feature("compactdefaultargs") TDF_DataMapIteratorOfLabelDataMap;
		%feature("autodoc", "	:param aMap:
	:type aMap: TDF_LabelDataMap &
	:rtype: None
") TDF_DataMapIteratorOfLabelDataMap;
		 TDF_DataMapIteratorOfLabelDataMap (const TDF_LabelDataMap & aMap);
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "	:param aMap:
	:type aMap: TDF_LabelDataMap &
	:rtype: None
") Initialize;
		void Initialize (const TDF_LabelDataMap & aMap);
		%feature("compactdefaultargs") Key;
		%feature("autodoc", "	:rtype: TDF_Label
") Key;
		const TDF_Label & Key ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: TDF_Label
") Value;
		const TDF_Label & Value ();
};


%extend TDF_DataMapIteratorOfLabelDataMap {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TDF_DataMapIteratorOfLabelIntegerMap;
class TDF_DataMapIteratorOfLabelIntegerMap : public TCollection_BasicMapIterator {
	public:
		%feature("compactdefaultargs") TDF_DataMapIteratorOfLabelIntegerMap;
		%feature("autodoc", "	:rtype: None
") TDF_DataMapIteratorOfLabelIntegerMap;
		 TDF_DataMapIteratorOfLabelIntegerMap ();
		%feature("compactdefaultargs") TDF_DataMapIteratorOfLabelIntegerMap;
		%feature("autodoc", "	:param aMap:
	:type aMap: TDF_LabelIntegerMap &
	:rtype: None
") TDF_DataMapIteratorOfLabelIntegerMap;
		 TDF_DataMapIteratorOfLabelIntegerMap (const TDF_LabelIntegerMap & aMap);
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "	:param aMap:
	:type aMap: TDF_LabelIntegerMap &
	:rtype: None
") Initialize;
		void Initialize (const TDF_LabelIntegerMap & aMap);
		%feature("compactdefaultargs") Key;
		%feature("autodoc", "	:rtype: TDF_Label
") Key;
		const TDF_Label & Key ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: int
") Value;
		const Standard_Integer & Value ();
};


%extend TDF_DataMapIteratorOfLabelIntegerMap {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TDF_DataMapNodeOfAttributeDataMap;
class TDF_DataMapNodeOfAttributeDataMap : public TCollection_MapNode {
	public:
		%feature("compactdefaultargs") TDF_DataMapNodeOfAttributeDataMap;
		%feature("autodoc", "	:param K:
	:type K: Handle_TDF_Attribute &
	:param I:
	:type I: Handle_TDF_Attribute &
	:param n:
	:type n: TCollection_MapNodePtr &
	:rtype: None
") TDF_DataMapNodeOfAttributeDataMap;
		 TDF_DataMapNodeOfAttributeDataMap (const Handle_TDF_Attribute & K,const Handle_TDF_Attribute & I,const TCollection_MapNodePtr & n);
		%feature("compactdefaultargs") Key;
		%feature("autodoc", "	:rtype: Handle_TDF_Attribute
") Key;
		Handle_TDF_Attribute Key ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: Handle_TDF_Attribute
") Value;
		Handle_TDF_Attribute Value ();
};


%extend TDF_DataMapNodeOfAttributeDataMap {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_TDF_DataMapNodeOfAttributeDataMap(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_TDF_DataMapNodeOfAttributeDataMap::Handle_TDF_DataMapNodeOfAttributeDataMap %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_TDF_DataMapNodeOfAttributeDataMap;
class Handle_TDF_DataMapNodeOfAttributeDataMap : public Handle_TCollection_MapNode {

    public:
        // constructors
        Handle_TDF_DataMapNodeOfAttributeDataMap();
        Handle_TDF_DataMapNodeOfAttributeDataMap(const Handle_TDF_DataMapNodeOfAttributeDataMap &aHandle);
        Handle_TDF_DataMapNodeOfAttributeDataMap(const TDF_DataMapNodeOfAttributeDataMap *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_TDF_DataMapNodeOfAttributeDataMap DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_TDF_DataMapNodeOfAttributeDataMap {
    TDF_DataMapNodeOfAttributeDataMap* _get_reference() {
    return (TDF_DataMapNodeOfAttributeDataMap*)$self->Access();
    }
};

%extend Handle_TDF_DataMapNodeOfAttributeDataMap {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend TDF_DataMapNodeOfAttributeDataMap {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TDF_DataMapNodeOfLabelDataMap;
class TDF_DataMapNodeOfLabelDataMap : public TCollection_MapNode {
	public:
		%feature("compactdefaultargs") TDF_DataMapNodeOfLabelDataMap;
		%feature("autodoc", "	:param K:
	:type K: TDF_Label &
	:param I:
	:type I: TDF_Label &
	:param n:
	:type n: TCollection_MapNodePtr &
	:rtype: None
") TDF_DataMapNodeOfLabelDataMap;
		 TDF_DataMapNodeOfLabelDataMap (const TDF_Label & K,const TDF_Label & I,const TCollection_MapNodePtr & n);
		%feature("compactdefaultargs") Key;
		%feature("autodoc", "	:rtype: TDF_Label
") Key;
		TDF_Label & Key ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: TDF_Label
") Value;
		TDF_Label & Value ();
};


%extend TDF_DataMapNodeOfLabelDataMap {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_TDF_DataMapNodeOfLabelDataMap(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_TDF_DataMapNodeOfLabelDataMap::Handle_TDF_DataMapNodeOfLabelDataMap %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_TDF_DataMapNodeOfLabelDataMap;
class Handle_TDF_DataMapNodeOfLabelDataMap : public Handle_TCollection_MapNode {

    public:
        // constructors
        Handle_TDF_DataMapNodeOfLabelDataMap();
        Handle_TDF_DataMapNodeOfLabelDataMap(const Handle_TDF_DataMapNodeOfLabelDataMap &aHandle);
        Handle_TDF_DataMapNodeOfLabelDataMap(const TDF_DataMapNodeOfLabelDataMap *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_TDF_DataMapNodeOfLabelDataMap DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_TDF_DataMapNodeOfLabelDataMap {
    TDF_DataMapNodeOfLabelDataMap* _get_reference() {
    return (TDF_DataMapNodeOfLabelDataMap*)$self->Access();
    }
};

%extend Handle_TDF_DataMapNodeOfLabelDataMap {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend TDF_DataMapNodeOfLabelDataMap {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TDF_DataMapNodeOfLabelIntegerMap;
class TDF_DataMapNodeOfLabelIntegerMap : public TCollection_MapNode {
	public:
		%feature("compactdefaultargs") TDF_DataMapNodeOfLabelIntegerMap;
		%feature("autodoc", "	:param K:
	:type K: TDF_Label &
	:param I:
	:type I: int &
	:param n:
	:type n: TCollection_MapNodePtr &
	:rtype: None
") TDF_DataMapNodeOfLabelIntegerMap;
		 TDF_DataMapNodeOfLabelIntegerMap (const TDF_Label & K,const Standard_Integer & I,const TCollection_MapNodePtr & n);
		%feature("compactdefaultargs") Key;
		%feature("autodoc", "	:rtype: TDF_Label
") Key;
		TDF_Label & Key ();

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


%extend TDF_DataMapNodeOfLabelIntegerMap {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_TDF_DataMapNodeOfLabelIntegerMap(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_TDF_DataMapNodeOfLabelIntegerMap::Handle_TDF_DataMapNodeOfLabelIntegerMap %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_TDF_DataMapNodeOfLabelIntegerMap;
class Handle_TDF_DataMapNodeOfLabelIntegerMap : public Handle_TCollection_MapNode {

    public:
        // constructors
        Handle_TDF_DataMapNodeOfLabelIntegerMap();
        Handle_TDF_DataMapNodeOfLabelIntegerMap(const Handle_TDF_DataMapNodeOfLabelIntegerMap &aHandle);
        Handle_TDF_DataMapNodeOfLabelIntegerMap(const TDF_DataMapNodeOfLabelIntegerMap *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_TDF_DataMapNodeOfLabelIntegerMap DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_TDF_DataMapNodeOfLabelIntegerMap {
    TDF_DataMapNodeOfLabelIntegerMap* _get_reference() {
    return (TDF_DataMapNodeOfLabelIntegerMap*)$self->Access();
    }
};

%extend Handle_TDF_DataMapNodeOfLabelIntegerMap {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend TDF_DataMapNodeOfLabelIntegerMap {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TDF_DataSet;
class TDF_DataSet : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") TDF_DataSet;
		%feature("autodoc", "	* Creates an empty DataSet object.

	:rtype: None
") TDF_DataSet;
		 TDF_DataSet ();
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	* Clears all information.

	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "	* Returns true if there is at least one label or one attribute.

	:rtype: bool
") IsEmpty;
		Standard_Boolean IsEmpty ();
		%feature("compactdefaultargs") AddLabel;
		%feature("autodoc", "	* Adds <aLabel> in the current data set.

	:param aLabel:
	:type aLabel: TDF_Label &
	:rtype: None
") AddLabel;
		void AddLabel (const TDF_Label & aLabel);
		%feature("compactdefaultargs") ContainsLabel;
		%feature("autodoc", "	* Returns true if the label <alabel> is in the data set.

	:param aLabel:
	:type aLabel: TDF_Label &
	:rtype: bool
") ContainsLabel;
		Standard_Boolean ContainsLabel (const TDF_Label & aLabel);
		%feature("compactdefaultargs") Labels;
		%feature("autodoc", "	* Returns the map of labels in this data set. This map can be used directly, or updated.

	:rtype: TDF_LabelMap
") Labels;
		TDF_LabelMap & Labels ();
		%feature("compactdefaultargs") AddAttribute;
		%feature("autodoc", "	* Adds <anAttribute> into the current data set.

	:param anAttribute:
	:type anAttribute: Handle_TDF_Attribute &
	:rtype: None
") AddAttribute;
		void AddAttribute (const Handle_TDF_Attribute & anAttribute);
		%feature("compactdefaultargs") ContainsAttribute;
		%feature("autodoc", "	* Returns true if <anAttribute> is in the data set.

	:param anAttribute:
	:type anAttribute: Handle_TDF_Attribute &
	:rtype: bool
") ContainsAttribute;
		Standard_Boolean ContainsAttribute (const Handle_TDF_Attribute & anAttribute);
		%feature("compactdefaultargs") Attributes;
		%feature("autodoc", "	* Returns the map of attributes in the current data set. This map can be used directly, or updated.

	:rtype: TDF_AttributeMap
") Attributes;
		TDF_AttributeMap & Attributes ();
		%feature("compactdefaultargs") AddRoot;
		%feature("autodoc", "	* Adds a root label to <myRootLabels>.

	:param aLabel:
	:type aLabel: TDF_Label &
	:rtype: None
") AddRoot;
		void AddRoot (const TDF_Label & aLabel);
		%feature("compactdefaultargs") Roots;
		%feature("autodoc", "	* Returns <myRootLabels> to be used or updated.

	:rtype: TDF_LabelList
") Roots;
		TDF_LabelList & Roots ();

        %feature("autodoc", "1");
        %extend{
            std::string DumpToString() {
            std::stringstream s;
            self->Dump(s);
            return s.str();}
        };
        };


%extend TDF_DataSet {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_TDF_DataSet(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_TDF_DataSet::Handle_TDF_DataSet %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_TDF_DataSet;
class Handle_TDF_DataSet : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_TDF_DataSet();
        Handle_TDF_DataSet(const Handle_TDF_DataSet &aHandle);
        Handle_TDF_DataSet(const TDF_DataSet *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_TDF_DataSet DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_TDF_DataSet {
    TDF_DataSet* _get_reference() {
    return (TDF_DataSet*)$self->Access();
    }
};

%extend Handle_TDF_DataSet {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend TDF_DataSet {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TDF_Delta;
class TDF_Delta : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") TDF_Delta;
		%feature("autodoc", "	* Creates a delta.

	:rtype: None
") TDF_Delta;
		 TDF_Delta ();
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "	* Returns true if there is nothing to undo.

	:rtype: bool
") IsEmpty;
		Standard_Boolean IsEmpty ();
		%feature("compactdefaultargs") IsApplicable;
		%feature("autodoc", "	* Returns true if the Undo action of <self> is applicable at <aCurrentTime>.

	:param aCurrentTime:
	:type aCurrentTime: int
	:rtype: bool
") IsApplicable;
		Standard_Boolean IsApplicable (const Standard_Integer aCurrentTime);
		%feature("compactdefaultargs") BeginTime;
		%feature("autodoc", "	* Returns the field <myBeginTime>.

	:rtype: int
") BeginTime;
		Standard_Integer BeginTime ();
		%feature("compactdefaultargs") EndTime;
		%feature("autodoc", "	* Returns the field <myEndTime>.

	:rtype: int
") EndTime;
		Standard_Integer EndTime ();
		%feature("compactdefaultargs") Labels;
		%feature("autodoc", "	* Adds in <aLabelList> the labels of the attribute deltas. Caution: <aLabelList> is not cleared before use.

	:param aLabelList:
	:type aLabelList: TDF_LabelList &
	:rtype: None
") Labels;
		void Labels (TDF_LabelList & aLabelList);
		%feature("compactdefaultargs") AttributeDeltas;
		%feature("autodoc", "	* Returns the field <myAttDeltaList>.

	:rtype: TDF_AttributeDeltaList
") AttributeDeltas;
		const TDF_AttributeDeltaList & AttributeDeltas ();
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "	* Returns a name associated with this delta.

	:rtype: TCollection_ExtendedString
") Name;
		TCollection_ExtendedString Name ();
		%feature("compactdefaultargs") SetName;
		%feature("autodoc", "	* Associates a name <theName> with this delta

	:param theName:
	:type theName: TCollection_ExtendedString &
	:rtype: None
") SetName;
		void SetName (const TCollection_ExtendedString & theName);

        %feature("autodoc", "1");
        %extend{
            std::string DumpToString() {
            std::stringstream s;
            self->Dump(s);
            return s.str();}
        };
        };


%extend TDF_Delta {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_TDF_Delta(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_TDF_Delta::Handle_TDF_Delta %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_TDF_Delta;
class Handle_TDF_Delta : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_TDF_Delta();
        Handle_TDF_Delta(const Handle_TDF_Delta &aHandle);
        Handle_TDF_Delta(const TDF_Delta *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_TDF_Delta DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_TDF_Delta {
    TDF_Delta* _get_reference() {
    return (TDF_Delta*)$self->Access();
    }
};

%extend Handle_TDF_Delta {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend TDF_Delta {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TDF_DeltaList;
class TDF_DeltaList {
	public:
		%feature("compactdefaultargs") TDF_DeltaList;
		%feature("autodoc", "	:rtype: None
") TDF_DeltaList;
		 TDF_DeltaList ();
		%feature("compactdefaultargs") TDF_DeltaList;
		%feature("autodoc", "	:param Other:
	:type Other: TDF_DeltaList &
	:rtype: None
") TDF_DeltaList;
		 TDF_DeltaList (const TDF_DeltaList & Other);
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: TDF_DeltaList &
	:rtype: None
") Assign;
		void Assign (const TDF_DeltaList & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: TDF_DeltaList &
	:rtype: None
") operator =;
		void operator = (const TDF_DeltaList & Other);
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
	:type I: Handle_TDF_Delta &
	:rtype: None
") Prepend;
		void Prepend (const Handle_TDF_Delta & I);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param I:
	:type I: Handle_TDF_Delta &
	:param theIt:
	:type theIt: TDF_ListIteratorOfDeltaList &
	:rtype: None
") Prepend;
		void Prepend (const Handle_TDF_Delta & I,TDF_ListIteratorOfDeltaList & theIt);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param Other:
	:type Other: TDF_DeltaList &
	:rtype: None
") Prepend;
		void Prepend (TDF_DeltaList & Other);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param I:
	:type I: Handle_TDF_Delta &
	:rtype: None
") Append;
		void Append (const Handle_TDF_Delta & I);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param I:
	:type I: Handle_TDF_Delta &
	:param theIt:
	:type theIt: TDF_ListIteratorOfDeltaList &
	:rtype: None
") Append;
		void Append (const Handle_TDF_Delta & I,TDF_ListIteratorOfDeltaList & theIt);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param Other:
	:type Other: TDF_DeltaList &
	:rtype: None
") Append;
		void Append (TDF_DeltaList & Other);
		%feature("compactdefaultargs") First;
		%feature("autodoc", "	:rtype: Handle_TDF_Delta
") First;
		Handle_TDF_Delta First ();
		%feature("compactdefaultargs") Last;
		%feature("autodoc", "	:rtype: Handle_TDF_Delta
") Last;
		Handle_TDF_Delta Last ();
		%feature("compactdefaultargs") RemoveFirst;
		%feature("autodoc", "	:rtype: None
") RemoveFirst;
		void RemoveFirst ();
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	:param It:
	:type It: TDF_ListIteratorOfDeltaList &
	:rtype: None
") Remove;
		void Remove (TDF_ListIteratorOfDeltaList & It);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param I:
	:type I: Handle_TDF_Delta &
	:param It:
	:type It: TDF_ListIteratorOfDeltaList &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Handle_TDF_Delta & I,TDF_ListIteratorOfDeltaList & It);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param Other:
	:type Other: TDF_DeltaList &
	:param It:
	:type It: TDF_ListIteratorOfDeltaList &
	:rtype: None
") InsertBefore;
		void InsertBefore (TDF_DeltaList & Other,TDF_ListIteratorOfDeltaList & It);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param I:
	:type I: Handle_TDF_Delta &
	:param It:
	:type It: TDF_ListIteratorOfDeltaList &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Handle_TDF_Delta & I,TDF_ListIteratorOfDeltaList & It);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param Other:
	:type Other: TDF_DeltaList &
	:param It:
	:type It: TDF_ListIteratorOfDeltaList &
	:rtype: None
") InsertAfter;
		void InsertAfter (TDF_DeltaList & Other,TDF_ListIteratorOfDeltaList & It);
};


%extend TDF_DeltaList {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TDF_DoubleMapIteratorOfAttributeDoubleMap;
class TDF_DoubleMapIteratorOfAttributeDoubleMap : public TCollection_BasicMapIterator {
	public:
		%feature("compactdefaultargs") TDF_DoubleMapIteratorOfAttributeDoubleMap;
		%feature("autodoc", "	:rtype: None
") TDF_DoubleMapIteratorOfAttributeDoubleMap;
		 TDF_DoubleMapIteratorOfAttributeDoubleMap ();
		%feature("compactdefaultargs") TDF_DoubleMapIteratorOfAttributeDoubleMap;
		%feature("autodoc", "	:param aMap:
	:type aMap: TDF_AttributeDoubleMap &
	:rtype: None
") TDF_DoubleMapIteratorOfAttributeDoubleMap;
		 TDF_DoubleMapIteratorOfAttributeDoubleMap (const TDF_AttributeDoubleMap & aMap);
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "	:param aMap:
	:type aMap: TDF_AttributeDoubleMap &
	:rtype: None
") Initialize;
		void Initialize (const TDF_AttributeDoubleMap & aMap);
		%feature("compactdefaultargs") Key1;
		%feature("autodoc", "	:rtype: Handle_TDF_Attribute
") Key1;
		Handle_TDF_Attribute Key1 ();
		%feature("compactdefaultargs") Key2;
		%feature("autodoc", "	:rtype: Handle_TDF_Attribute
") Key2;
		Handle_TDF_Attribute Key2 ();
};


%extend TDF_DoubleMapIteratorOfAttributeDoubleMap {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TDF_DoubleMapIteratorOfGUIDProgIDMap;
class TDF_DoubleMapIteratorOfGUIDProgIDMap : public TCollection_BasicMapIterator {
	public:
		%feature("compactdefaultargs") TDF_DoubleMapIteratorOfGUIDProgIDMap;
		%feature("autodoc", "	:rtype: None
") TDF_DoubleMapIteratorOfGUIDProgIDMap;
		 TDF_DoubleMapIteratorOfGUIDProgIDMap ();
		%feature("compactdefaultargs") TDF_DoubleMapIteratorOfGUIDProgIDMap;
		%feature("autodoc", "	:param aMap:
	:type aMap: TDF_GUIDProgIDMap &
	:rtype: None
") TDF_DoubleMapIteratorOfGUIDProgIDMap;
		 TDF_DoubleMapIteratorOfGUIDProgIDMap (const TDF_GUIDProgIDMap & aMap);
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "	:param aMap:
	:type aMap: TDF_GUIDProgIDMap &
	:rtype: None
") Initialize;
		void Initialize (const TDF_GUIDProgIDMap & aMap);
		%feature("compactdefaultargs") Key1;
		%feature("autodoc", "	:rtype: Standard_GUID
") Key1;
		const Standard_GUID & Key1 ();
		%feature("compactdefaultargs") Key2;
		%feature("autodoc", "	:rtype: TCollection_ExtendedString
") Key2;
		const TCollection_ExtendedString & Key2 ();
};


%extend TDF_DoubleMapIteratorOfGUIDProgIDMap {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TDF_DoubleMapIteratorOfLabelDoubleMap;
class TDF_DoubleMapIteratorOfLabelDoubleMap : public TCollection_BasicMapIterator {
	public:
		%feature("compactdefaultargs") TDF_DoubleMapIteratorOfLabelDoubleMap;
		%feature("autodoc", "	:rtype: None
") TDF_DoubleMapIteratorOfLabelDoubleMap;
		 TDF_DoubleMapIteratorOfLabelDoubleMap ();
		%feature("compactdefaultargs") TDF_DoubleMapIteratorOfLabelDoubleMap;
		%feature("autodoc", "	:param aMap:
	:type aMap: TDF_LabelDoubleMap &
	:rtype: None
") TDF_DoubleMapIteratorOfLabelDoubleMap;
		 TDF_DoubleMapIteratorOfLabelDoubleMap (const TDF_LabelDoubleMap & aMap);
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "	:param aMap:
	:type aMap: TDF_LabelDoubleMap &
	:rtype: None
") Initialize;
		void Initialize (const TDF_LabelDoubleMap & aMap);
		%feature("compactdefaultargs") Key1;
		%feature("autodoc", "	:rtype: TDF_Label
") Key1;
		const TDF_Label & Key1 ();
		%feature("compactdefaultargs") Key2;
		%feature("autodoc", "	:rtype: TDF_Label
") Key2;
		const TDF_Label & Key2 ();
};


%extend TDF_DoubleMapIteratorOfLabelDoubleMap {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TDF_DoubleMapNodeOfAttributeDoubleMap;
class TDF_DoubleMapNodeOfAttributeDoubleMap : public TCollection_MapNode {
	public:
		%feature("compactdefaultargs") TDF_DoubleMapNodeOfAttributeDoubleMap;
		%feature("autodoc", "	:param K1:
	:type K1: Handle_TDF_Attribute &
	:param K2:
	:type K2: Handle_TDF_Attribute &
	:param n1:
	:type n1: TCollection_MapNodePtr &
	:param n2:
	:type n2: TCollection_MapNodePtr &
	:rtype: None
") TDF_DoubleMapNodeOfAttributeDoubleMap;
		 TDF_DoubleMapNodeOfAttributeDoubleMap (const Handle_TDF_Attribute & K1,const Handle_TDF_Attribute & K2,const TCollection_MapNodePtr & n1,const TCollection_MapNodePtr & n2);
		%feature("compactdefaultargs") Key1;
		%feature("autodoc", "	:rtype: Handle_TDF_Attribute
") Key1;
		Handle_TDF_Attribute Key1 ();
		%feature("compactdefaultargs") Key2;
		%feature("autodoc", "	:rtype: Handle_TDF_Attribute
") Key2;
		Handle_TDF_Attribute Key2 ();
		%feature("compactdefaultargs") Next2;
		%feature("autodoc", "	:rtype: TCollection_MapNodePtr
") Next2;
		TCollection_MapNodePtr & Next2 ();
};


%extend TDF_DoubleMapNodeOfAttributeDoubleMap {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_TDF_DoubleMapNodeOfAttributeDoubleMap(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_TDF_DoubleMapNodeOfAttributeDoubleMap::Handle_TDF_DoubleMapNodeOfAttributeDoubleMap %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_TDF_DoubleMapNodeOfAttributeDoubleMap;
class Handle_TDF_DoubleMapNodeOfAttributeDoubleMap : public Handle_TCollection_MapNode {

    public:
        // constructors
        Handle_TDF_DoubleMapNodeOfAttributeDoubleMap();
        Handle_TDF_DoubleMapNodeOfAttributeDoubleMap(const Handle_TDF_DoubleMapNodeOfAttributeDoubleMap &aHandle);
        Handle_TDF_DoubleMapNodeOfAttributeDoubleMap(const TDF_DoubleMapNodeOfAttributeDoubleMap *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_TDF_DoubleMapNodeOfAttributeDoubleMap DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_TDF_DoubleMapNodeOfAttributeDoubleMap {
    TDF_DoubleMapNodeOfAttributeDoubleMap* _get_reference() {
    return (TDF_DoubleMapNodeOfAttributeDoubleMap*)$self->Access();
    }
};

%extend Handle_TDF_DoubleMapNodeOfAttributeDoubleMap {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend TDF_DoubleMapNodeOfAttributeDoubleMap {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TDF_DoubleMapNodeOfGUIDProgIDMap;
class TDF_DoubleMapNodeOfGUIDProgIDMap : public TCollection_MapNode {
	public:
		%feature("compactdefaultargs") TDF_DoubleMapNodeOfGUIDProgIDMap;
		%feature("autodoc", "	:param K1:
	:type K1: Standard_GUID &
	:param K2:
	:type K2: TCollection_ExtendedString &
	:param n1:
	:type n1: TCollection_MapNodePtr &
	:param n2:
	:type n2: TCollection_MapNodePtr &
	:rtype: None
") TDF_DoubleMapNodeOfGUIDProgIDMap;
		 TDF_DoubleMapNodeOfGUIDProgIDMap (const Standard_GUID & K1,const TCollection_ExtendedString & K2,const TCollection_MapNodePtr & n1,const TCollection_MapNodePtr & n2);
		%feature("compactdefaultargs") Key1;
		%feature("autodoc", "	:rtype: Standard_GUID
") Key1;
		Standard_GUID & Key1 ();
		%feature("compactdefaultargs") Key2;
		%feature("autodoc", "	:rtype: TCollection_ExtendedString
") Key2;
		TCollection_ExtendedString & Key2 ();
		%feature("compactdefaultargs") Next2;
		%feature("autodoc", "	:rtype: TCollection_MapNodePtr
") Next2;
		TCollection_MapNodePtr & Next2 ();
};


%extend TDF_DoubleMapNodeOfGUIDProgIDMap {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_TDF_DoubleMapNodeOfGUIDProgIDMap(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_TDF_DoubleMapNodeOfGUIDProgIDMap::Handle_TDF_DoubleMapNodeOfGUIDProgIDMap %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_TDF_DoubleMapNodeOfGUIDProgIDMap;
class Handle_TDF_DoubleMapNodeOfGUIDProgIDMap : public Handle_TCollection_MapNode {

    public:
        // constructors
        Handle_TDF_DoubleMapNodeOfGUIDProgIDMap();
        Handle_TDF_DoubleMapNodeOfGUIDProgIDMap(const Handle_TDF_DoubleMapNodeOfGUIDProgIDMap &aHandle);
        Handle_TDF_DoubleMapNodeOfGUIDProgIDMap(const TDF_DoubleMapNodeOfGUIDProgIDMap *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_TDF_DoubleMapNodeOfGUIDProgIDMap DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_TDF_DoubleMapNodeOfGUIDProgIDMap {
    TDF_DoubleMapNodeOfGUIDProgIDMap* _get_reference() {
    return (TDF_DoubleMapNodeOfGUIDProgIDMap*)$self->Access();
    }
};

%extend Handle_TDF_DoubleMapNodeOfGUIDProgIDMap {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend TDF_DoubleMapNodeOfGUIDProgIDMap {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TDF_DoubleMapNodeOfLabelDoubleMap;
class TDF_DoubleMapNodeOfLabelDoubleMap : public TCollection_MapNode {
	public:
		%feature("compactdefaultargs") TDF_DoubleMapNodeOfLabelDoubleMap;
		%feature("autodoc", "	:param K1:
	:type K1: TDF_Label &
	:param K2:
	:type K2: TDF_Label &
	:param n1:
	:type n1: TCollection_MapNodePtr &
	:param n2:
	:type n2: TCollection_MapNodePtr &
	:rtype: None
") TDF_DoubleMapNodeOfLabelDoubleMap;
		 TDF_DoubleMapNodeOfLabelDoubleMap (const TDF_Label & K1,const TDF_Label & K2,const TCollection_MapNodePtr & n1,const TCollection_MapNodePtr & n2);
		%feature("compactdefaultargs") Key1;
		%feature("autodoc", "	:rtype: TDF_Label
") Key1;
		TDF_Label & Key1 ();
		%feature("compactdefaultargs") Key2;
		%feature("autodoc", "	:rtype: TDF_Label
") Key2;
		TDF_Label & Key2 ();
		%feature("compactdefaultargs") Next2;
		%feature("autodoc", "	:rtype: TCollection_MapNodePtr
") Next2;
		TCollection_MapNodePtr & Next2 ();
};


%extend TDF_DoubleMapNodeOfLabelDoubleMap {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_TDF_DoubleMapNodeOfLabelDoubleMap(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_TDF_DoubleMapNodeOfLabelDoubleMap::Handle_TDF_DoubleMapNodeOfLabelDoubleMap %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_TDF_DoubleMapNodeOfLabelDoubleMap;
class Handle_TDF_DoubleMapNodeOfLabelDoubleMap : public Handle_TCollection_MapNode {

    public:
        // constructors
        Handle_TDF_DoubleMapNodeOfLabelDoubleMap();
        Handle_TDF_DoubleMapNodeOfLabelDoubleMap(const Handle_TDF_DoubleMapNodeOfLabelDoubleMap &aHandle);
        Handle_TDF_DoubleMapNodeOfLabelDoubleMap(const TDF_DoubleMapNodeOfLabelDoubleMap *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_TDF_DoubleMapNodeOfLabelDoubleMap DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_TDF_DoubleMapNodeOfLabelDoubleMap {
    TDF_DoubleMapNodeOfLabelDoubleMap* _get_reference() {
    return (TDF_DoubleMapNodeOfLabelDoubleMap*)$self->Access();
    }
};

%extend Handle_TDF_DoubleMapNodeOfLabelDoubleMap {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend TDF_DoubleMapNodeOfLabelDoubleMap {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TDF_GUIDProgIDMap;
class TDF_GUIDProgIDMap : public TCollection_BasicMap {
	public:
		%feature("compactdefaultargs") TDF_GUIDProgIDMap;
		%feature("autodoc", "	:param NbBuckets: default value is 1
	:type NbBuckets: int
	:rtype: None
") TDF_GUIDProgIDMap;
		 TDF_GUIDProgIDMap (const Standard_Integer NbBuckets = 1);
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: TDF_GUIDProgIDMap &
	:rtype: TDF_GUIDProgIDMap
") Assign;
		TDF_GUIDProgIDMap & Assign (const TDF_GUIDProgIDMap & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: TDF_GUIDProgIDMap &
	:rtype: TDF_GUIDProgIDMap
") operator =;
		TDF_GUIDProgIDMap & operator = (const TDF_GUIDProgIDMap & Other);
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
		%feature("autodoc", "	:param K1:
	:type K1: Standard_GUID &
	:param K2:
	:type K2: TCollection_ExtendedString &
	:rtype: None
") Bind;
		void Bind (const Standard_GUID & K1,const TCollection_ExtendedString & K2);
		%feature("compactdefaultargs") AreBound;
		%feature("autodoc", "	:param K1:
	:type K1: Standard_GUID &
	:param K2:
	:type K2: TCollection_ExtendedString &
	:rtype: bool
") AreBound;
		Standard_Boolean AreBound (const Standard_GUID & K1,const TCollection_ExtendedString & K2);
		%feature("compactdefaultargs") IsBound1;
		%feature("autodoc", "	:param K:
	:type K: Standard_GUID &
	:rtype: bool
") IsBound1;
		Standard_Boolean IsBound1 (const Standard_GUID & K);
		%feature("compactdefaultargs") IsBound2;
		%feature("autodoc", "	:param K:
	:type K: TCollection_ExtendedString &
	:rtype: bool
") IsBound2;
		Standard_Boolean IsBound2 (const TCollection_ExtendedString & K);
		%feature("compactdefaultargs") Find1;
		%feature("autodoc", "	:param K:
	:type K: Standard_GUID &
	:rtype: TCollection_ExtendedString
") Find1;
		const TCollection_ExtendedString & Find1 (const Standard_GUID & K);
		%feature("compactdefaultargs") Find2;
		%feature("autodoc", "	:param K:
	:type K: TCollection_ExtendedString &
	:rtype: Standard_GUID
") Find2;
		const Standard_GUID & Find2 (const TCollection_ExtendedString & K);
		%feature("compactdefaultargs") UnBind1;
		%feature("autodoc", "	:param K:
	:type K: Standard_GUID &
	:rtype: bool
") UnBind1;
		Standard_Boolean UnBind1 (const Standard_GUID & K);
		%feature("compactdefaultargs") UnBind2;
		%feature("autodoc", "	:param K:
	:type K: TCollection_ExtendedString &
	:rtype: bool
") UnBind2;
		Standard_Boolean UnBind2 (const TCollection_ExtendedString & K);
};


%extend TDF_GUIDProgIDMap {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TDF_HAttributeArray1;
class TDF_HAttributeArray1 : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") TDF_HAttributeArray1;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") TDF_HAttributeArray1;
		 TDF_HAttributeArray1 (const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") TDF_HAttributeArray1;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:param V:
	:type V: Handle_TDF_Attribute &
	:rtype: None
") TDF_HAttributeArray1;
		 TDF_HAttributeArray1 (const Standard_Integer Low,const Standard_Integer Up,const Handle_TDF_Attribute & V);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param V:
	:type V: Handle_TDF_Attribute &
	:rtype: None
") Init;
		void Init (const Handle_TDF_Attribute & V);
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
	:type Value: Handle_TDF_Attribute &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const Handle_TDF_Attribute & Value);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Handle_TDF_Attribute
") Value;
		Handle_TDF_Attribute Value (const Standard_Integer Index);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Handle_TDF_Attribute
") ChangeValue;
		Handle_TDF_Attribute ChangeValue (const Standard_Integer Index);
		%feature("compactdefaultargs") Array1;
		%feature("autodoc", "	:rtype: TDF_AttributeArray1
") Array1;
		const TDF_AttributeArray1 & Array1 ();
		%feature("compactdefaultargs") ChangeArray1;
		%feature("autodoc", "	:rtype: TDF_AttributeArray1
") ChangeArray1;
		TDF_AttributeArray1 & ChangeArray1 ();
};


%extend TDF_HAttributeArray1 {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_TDF_HAttributeArray1(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_TDF_HAttributeArray1::Handle_TDF_HAttributeArray1 %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_TDF_HAttributeArray1;
class Handle_TDF_HAttributeArray1 : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_TDF_HAttributeArray1();
        Handle_TDF_HAttributeArray1(const Handle_TDF_HAttributeArray1 &aHandle);
        Handle_TDF_HAttributeArray1(const TDF_HAttributeArray1 *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_TDF_HAttributeArray1 DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_TDF_HAttributeArray1 {
    TDF_HAttributeArray1* _get_reference() {
    return (TDF_HAttributeArray1*)$self->Access();
    }
};

%extend Handle_TDF_HAttributeArray1 {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend TDF_HAttributeArray1 {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TDF_IDFilter;
class TDF_IDFilter {
	public:
		%feature("compactdefaultargs") TDF_IDFilter;
		%feature("autodoc", "	* Creates an ID/attribute filter based on an ID list. The default mode is 'ignore all but...'. //! This filter has 2 working mode: keep and ignore. //! Ignore/Exclusive mode: all IDs are ignored except these set to be kept, using Keep(). Of course, it is possible set an kept ID to be ignored using Ignore(). //! Keep/Inclusive mode: all IDs are kept except these set to be ignored, using Ignore(). Of course, it is possible set an ignored ID to be kept using Keep().

	:param ignoreMode: default value is Standard_True
	:type ignoreMode: bool
	:rtype: None
") TDF_IDFilter;
		 TDF_IDFilter (const Standard_Boolean ignoreMode = Standard_True);
		%feature("compactdefaultargs") IgnoreAll;
		%feature("autodoc", "	* The list of ID is cleared and the filter mode is set to ignore mode if <keep> is true; false otherwise.

	:param ignore:
	:type ignore: bool
	:rtype: None
") IgnoreAll;
		void IgnoreAll (const Standard_Boolean ignore);
		%feature("compactdefaultargs") IgnoreAll;
		%feature("autodoc", "	* Returns true is the mode is set to 'ignore all but...'.

	:rtype: bool
") IgnoreAll;
		Standard_Boolean IgnoreAll ();
		%feature("compactdefaultargs") Keep;
		%feature("autodoc", "	* An attribute with <anID> as ID is to be kept and the filter will answer true to the question IsKept(<anID>).

	:param anID:
	:type anID: Standard_GUID &
	:rtype: None
") Keep;
		void Keep (const Standard_GUID & anID);
		%feature("compactdefaultargs") Keep;
		%feature("autodoc", "	* Attributes with ID owned by <anIDList> are to be kept and the filter will answer true to the question IsKept(<anID>) with ID from <anIDList>.

	:param anIDList:
	:type anIDList: TDF_IDList &
	:rtype: None
") Keep;
		void Keep (const TDF_IDList & anIDList);
		%feature("compactdefaultargs") Ignore;
		%feature("autodoc", "	* An attribute with <anID> as ID is to be ignored and the filter will answer false to the question IsKept(<anID>).

	:param anID:
	:type anID: Standard_GUID &
	:rtype: None
") Ignore;
		void Ignore (const Standard_GUID & anID);
		%feature("compactdefaultargs") Ignore;
		%feature("autodoc", "	* Attributes with ID owned by <anIDList> are to be ignored and the filter will answer false to the question IsKept(<anID>) with ID from <anIDList>.

	:param anIDList:
	:type anIDList: TDF_IDList &
	:rtype: None
") Ignore;
		void Ignore (const TDF_IDList & anIDList);
		%feature("compactdefaultargs") IsKept;
		%feature("autodoc", "	* Returns true if the ID is to be kept.

	:param anID:
	:type anID: Standard_GUID &
	:rtype: bool
") IsKept;
		Standard_Boolean IsKept (const Standard_GUID & anID);
		%feature("compactdefaultargs") IsKept;
		%feature("autodoc", "	* Returns true if the attribute is to be kept.

	:param anAtt:
	:type anAtt: Handle_TDF_Attribute &
	:rtype: bool
") IsKept;
		Standard_Boolean IsKept (const Handle_TDF_Attribute & anAtt);
		%feature("compactdefaultargs") IsIgnored;
		%feature("autodoc", "	* Returns true if the ID is to be ignored.

	:param anID:
	:type anID: Standard_GUID &
	:rtype: bool
") IsIgnored;
		Standard_Boolean IsIgnored (const Standard_GUID & anID);
		%feature("compactdefaultargs") IsIgnored;
		%feature("autodoc", "	* Returns true if the attribute is to be ignored.

	:param anAtt:
	:type anAtt: Handle_TDF_Attribute &
	:rtype: bool
") IsIgnored;
		Standard_Boolean IsIgnored (const Handle_TDF_Attribute & anAtt);
		%feature("compactdefaultargs") IDList;
		%feature("autodoc", "	* Copies the list of ID to be kept or ignored in <anIDList>. <anIDList> is cleared before use.

	:param anIDList:
	:type anIDList: TDF_IDList &
	:rtype: None
") IDList;
		void IDList (TDF_IDList & anIDList);
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "	* Copies into <self> the contents of <fromFilter>. <self> is cleared before copy.

	:param fromFilter:
	:type fromFilter: TDF_IDFilter &
	:rtype: None
") Copy;
		void Copy (const TDF_IDFilter & fromFilter);

        %feature("autodoc", "1");
        %extend{
            std::string DumpToString() {
            std::stringstream s;
            self->Dump(s);
            return s.str();}
        };
        };


%extend TDF_IDFilter {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TDF_IDList;
class TDF_IDList {
	public:
		%feature("compactdefaultargs") TDF_IDList;
		%feature("autodoc", "	:rtype: None
") TDF_IDList;
		 TDF_IDList ();
		%feature("compactdefaultargs") TDF_IDList;
		%feature("autodoc", "	:param Other:
	:type Other: TDF_IDList &
	:rtype: None
") TDF_IDList;
		 TDF_IDList (const TDF_IDList & Other);
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: TDF_IDList &
	:rtype: None
") Assign;
		void Assign (const TDF_IDList & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: TDF_IDList &
	:rtype: None
") operator =;
		void operator = (const TDF_IDList & Other);
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
	:type I: Standard_GUID &
	:rtype: None
") Prepend;
		void Prepend (const Standard_GUID & I);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param I:
	:type I: Standard_GUID &
	:param theIt:
	:type theIt: TDF_ListIteratorOfIDList &
	:rtype: None
") Prepend;
		void Prepend (const Standard_GUID & I,TDF_ListIteratorOfIDList & theIt);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param Other:
	:type Other: TDF_IDList &
	:rtype: None
") Prepend;
		void Prepend (TDF_IDList & Other);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param I:
	:type I: Standard_GUID &
	:rtype: None
") Append;
		void Append (const Standard_GUID & I);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param I:
	:type I: Standard_GUID &
	:param theIt:
	:type theIt: TDF_ListIteratorOfIDList &
	:rtype: None
") Append;
		void Append (const Standard_GUID & I,TDF_ListIteratorOfIDList & theIt);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param Other:
	:type Other: TDF_IDList &
	:rtype: None
") Append;
		void Append (TDF_IDList & Other);
		%feature("compactdefaultargs") First;
		%feature("autodoc", "	:rtype: Standard_GUID
") First;
		Standard_GUID & First ();
		%feature("compactdefaultargs") Last;
		%feature("autodoc", "	:rtype: Standard_GUID
") Last;
		Standard_GUID & Last ();
		%feature("compactdefaultargs") RemoveFirst;
		%feature("autodoc", "	:rtype: None
") RemoveFirst;
		void RemoveFirst ();
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	:param It:
	:type It: TDF_ListIteratorOfIDList &
	:rtype: None
") Remove;
		void Remove (TDF_ListIteratorOfIDList & It);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param I:
	:type I: Standard_GUID &
	:param It:
	:type It: TDF_ListIteratorOfIDList &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_GUID & I,TDF_ListIteratorOfIDList & It);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param Other:
	:type Other: TDF_IDList &
	:param It:
	:type It: TDF_ListIteratorOfIDList &
	:rtype: None
") InsertBefore;
		void InsertBefore (TDF_IDList & Other,TDF_ListIteratorOfIDList & It);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param I:
	:type I: Standard_GUID &
	:param It:
	:type It: TDF_ListIteratorOfIDList &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_GUID & I,TDF_ListIteratorOfIDList & It);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param Other:
	:type Other: TDF_IDList &
	:param It:
	:type It: TDF_ListIteratorOfIDList &
	:rtype: None
") InsertAfter;
		void InsertAfter (TDF_IDList & Other,TDF_ListIteratorOfIDList & It);
};


%extend TDF_IDList {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TDF_IDMap;
class TDF_IDMap : public TCollection_BasicMap {
	public:
		%feature("compactdefaultargs") TDF_IDMap;
		%feature("autodoc", "	:param NbBuckets: default value is 1
	:type NbBuckets: int
	:rtype: None
") TDF_IDMap;
		 TDF_IDMap (const Standard_Integer NbBuckets = 1);
		%feature("compactdefaultargs") TDF_IDMap;
		%feature("autodoc", "	:param Other:
	:type Other: TDF_IDMap &
	:rtype: None
") TDF_IDMap;
		 TDF_IDMap (const TDF_IDMap & Other);
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: TDF_IDMap &
	:rtype: TDF_IDMap
") Assign;
		TDF_IDMap & Assign (const TDF_IDMap & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: TDF_IDMap &
	:rtype: TDF_IDMap
") operator =;
		TDF_IDMap & operator = (const TDF_IDMap & Other);
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
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "	:param aKey:
	:type aKey: Standard_GUID &
	:rtype: bool
") Add;
		Standard_Boolean Add (const Standard_GUID & aKey);
		%feature("compactdefaultargs") Contains;
		%feature("autodoc", "	:param aKey:
	:type aKey: Standard_GUID &
	:rtype: bool
") Contains;
		Standard_Boolean Contains (const Standard_GUID & aKey);
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	:param aKey:
	:type aKey: Standard_GUID &
	:rtype: bool
") Remove;
		Standard_Boolean Remove (const Standard_GUID & aKey);
};


%extend TDF_IDMap {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TDF_IndexedMapNodeOfAttributeIndexedMap;
class TDF_IndexedMapNodeOfAttributeIndexedMap : public TCollection_MapNode {
	public:
		%feature("compactdefaultargs") TDF_IndexedMapNodeOfAttributeIndexedMap;
		%feature("autodoc", "	:param K1:
	:type K1: Handle_TDF_Attribute &
	:param K2:
	:type K2: int
	:param n1:
	:type n1: TCollection_MapNodePtr &
	:param n2:
	:type n2: TCollection_MapNodePtr &
	:rtype: None
") TDF_IndexedMapNodeOfAttributeIndexedMap;
		 TDF_IndexedMapNodeOfAttributeIndexedMap (const Handle_TDF_Attribute & K1,const Standard_Integer K2,const TCollection_MapNodePtr & n1,const TCollection_MapNodePtr & n2);
		%feature("compactdefaultargs") Key1;
		%feature("autodoc", "	:rtype: Handle_TDF_Attribute
") Key1;
		Handle_TDF_Attribute Key1 ();

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
            		%feature("compactdefaultargs") Next2;
		%feature("autodoc", "	:rtype: TCollection_MapNodePtr
") Next2;
		TCollection_MapNodePtr & Next2 ();
};


%extend TDF_IndexedMapNodeOfAttributeIndexedMap {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_TDF_IndexedMapNodeOfAttributeIndexedMap(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_TDF_IndexedMapNodeOfAttributeIndexedMap::Handle_TDF_IndexedMapNodeOfAttributeIndexedMap %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_TDF_IndexedMapNodeOfAttributeIndexedMap;
class Handle_TDF_IndexedMapNodeOfAttributeIndexedMap : public Handle_TCollection_MapNode {

    public:
        // constructors
        Handle_TDF_IndexedMapNodeOfAttributeIndexedMap();
        Handle_TDF_IndexedMapNodeOfAttributeIndexedMap(const Handle_TDF_IndexedMapNodeOfAttributeIndexedMap &aHandle);
        Handle_TDF_IndexedMapNodeOfAttributeIndexedMap(const TDF_IndexedMapNodeOfAttributeIndexedMap *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_TDF_IndexedMapNodeOfAttributeIndexedMap DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_TDF_IndexedMapNodeOfAttributeIndexedMap {
    TDF_IndexedMapNodeOfAttributeIndexedMap* _get_reference() {
    return (TDF_IndexedMapNodeOfAttributeIndexedMap*)$self->Access();
    }
};

%extend Handle_TDF_IndexedMapNodeOfAttributeIndexedMap {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend TDF_IndexedMapNodeOfAttributeIndexedMap {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TDF_IndexedMapNodeOfLabelIndexedMap;
class TDF_IndexedMapNodeOfLabelIndexedMap : public TCollection_MapNode {
	public:
		%feature("compactdefaultargs") TDF_IndexedMapNodeOfLabelIndexedMap;
		%feature("autodoc", "	:param K1:
	:type K1: TDF_Label &
	:param K2:
	:type K2: int
	:param n1:
	:type n1: TCollection_MapNodePtr &
	:param n2:
	:type n2: TCollection_MapNodePtr &
	:rtype: None
") TDF_IndexedMapNodeOfLabelIndexedMap;
		 TDF_IndexedMapNodeOfLabelIndexedMap (const TDF_Label & K1,const Standard_Integer K2,const TCollection_MapNodePtr & n1,const TCollection_MapNodePtr & n2);
		%feature("compactdefaultargs") Key1;
		%feature("autodoc", "	:rtype: TDF_Label
") Key1;
		TDF_Label & Key1 ();

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
            		%feature("compactdefaultargs") Next2;
		%feature("autodoc", "	:rtype: TCollection_MapNodePtr
") Next2;
		TCollection_MapNodePtr & Next2 ();
};


%extend TDF_IndexedMapNodeOfLabelIndexedMap {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_TDF_IndexedMapNodeOfLabelIndexedMap(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_TDF_IndexedMapNodeOfLabelIndexedMap::Handle_TDF_IndexedMapNodeOfLabelIndexedMap %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_TDF_IndexedMapNodeOfLabelIndexedMap;
class Handle_TDF_IndexedMapNodeOfLabelIndexedMap : public Handle_TCollection_MapNode {

    public:
        // constructors
        Handle_TDF_IndexedMapNodeOfLabelIndexedMap();
        Handle_TDF_IndexedMapNodeOfLabelIndexedMap(const Handle_TDF_IndexedMapNodeOfLabelIndexedMap &aHandle);
        Handle_TDF_IndexedMapNodeOfLabelIndexedMap(const TDF_IndexedMapNodeOfLabelIndexedMap *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_TDF_IndexedMapNodeOfLabelIndexedMap DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_TDF_IndexedMapNodeOfLabelIndexedMap {
    TDF_IndexedMapNodeOfLabelIndexedMap* _get_reference() {
    return (TDF_IndexedMapNodeOfLabelIndexedMap*)$self->Access();
    }
};

%extend Handle_TDF_IndexedMapNodeOfLabelIndexedMap {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend TDF_IndexedMapNodeOfLabelIndexedMap {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TDF_Label;
class TDF_Label {
	public:
		%feature("compactdefaultargs") TDF_Label;
		%feature("autodoc", "	* Constructs an empty label object.

	:rtype: None
") TDF_Label;
		 TDF_Label ();
		%feature("compactdefaultargs") Nullify;
		%feature("autodoc", "	* Nullifies the label.

	:rtype: None
") Nullify;
		void Nullify ();
		%feature("compactdefaultargs") Data;
		%feature("autodoc", "	* Returns the Data owning <self>.

	:rtype: Handle_TDF_Data
") Data;
		Handle_TDF_Data Data ();
		%feature("compactdefaultargs") Tag;
		%feature("autodoc", "	* Returns the tag of the label. This is the integer assigned randomly to a label in a data framework. This integer is used to identify this label in an entry.

	:rtype: int
") Tag;
		Standard_Integer Tag ();
		%feature("compactdefaultargs") Father;
		%feature("autodoc", "	* Returns the label father. This label may be null if the label is root.

	:rtype: TDF_Label
") Father;
		const TDF_Label Father ();
		%feature("compactdefaultargs") IsNull;
		%feature("autodoc", "	* Returns True if the <aLabel> is null, i.e. it has not been included in the data framework.

	:rtype: bool
") IsNull;
		Standard_Boolean IsNull ();
		%feature("compactdefaultargs") Imported;
		%feature("autodoc", "	* Sets or unsets <self> and all its descendants as imported label, according to <aStatus>.

	:param aStatus:
	:type aStatus: bool
	:rtype: None
") Imported;
		void Imported (const Standard_Boolean aStatus);
		%feature("compactdefaultargs") IsImported;
		%feature("autodoc", "	* Returns True if the <aLabel> is imported.

	:rtype: bool
") IsImported;
		Standard_Boolean IsImported ();
		%feature("compactdefaultargs") IsEqual;
		%feature("autodoc", "	* Returns True if the <aLabel> is equal to me (same LabelNode*).

	:param aLabel:
	:type aLabel: TDF_Label &
	:rtype: bool
") IsEqual;
		Standard_Boolean IsEqual (const TDF_Label & aLabel);

        %extend{
            bool __eq_wrapper__(const TDF_Label  other) {
            if (*self==other) return true;
            else return false;
            }
        }
        %pythoncode {
        def __eq__(self,right):
            try:
                return self.__eq_wrapper__(right)
            except:
                return False
        }
        		%feature("compactdefaultargs") IsDifferent;
		%feature("autodoc", "	:param aLabel:
	:type aLabel: TDF_Label &
	:rtype: bool
") IsDifferent;
		Standard_Boolean IsDifferent (const TDF_Label & aLabel);

        %extend{
            bool __ne_wrapper__(const TDF_Label  other) {
            if (*self!=other) return true;
            else return false;
            }
        }
        %pythoncode {
        def __ne__(self,right):
            try:
                return self.__ne_wrapper__(right)
            except:
                return True
        }
        		%feature("compactdefaultargs") IsRoot;
		%feature("autodoc", "	:rtype: bool
") IsRoot;
		Standard_Boolean IsRoot ();
		%feature("compactdefaultargs") IsAttribute;
		%feature("autodoc", "	* Returns true if <self> owns an attribute with <anID> as ID.

	:param anID:
	:type anID: Standard_GUID &
	:rtype: bool
") IsAttribute;
		Standard_Boolean IsAttribute (const Standard_GUID & anID);
		%feature("compactdefaultargs") AddAttribute;
		%feature("autodoc", "	* Adds an Attribute to the current label. Raises if there is already one.

	:param anAttribute:
	:type anAttribute: Handle_TDF_Attribute &
	:rtype: None
") AddAttribute;
		void AddAttribute (const Handle_TDF_Attribute & anAttribute);
		%feature("compactdefaultargs") ForgetAttribute;
		%feature("autodoc", "	* Forgets an Attribute from the current label, setting its forgotten status true and its valid status false. Raises if the attribute is not in the structure.

	:param anAttribute:
	:type anAttribute: Handle_TDF_Attribute &
	:rtype: None
") ForgetAttribute;
		void ForgetAttribute (const Handle_TDF_Attribute & anAttribute);
		%feature("compactdefaultargs") ForgetAttribute;
		%feature("autodoc", "	* Forgets the Attribute of GUID <aguid> from the current label . If the attribute doesn't exist returns False. Otherwise returns True.

	:param aguid:
	:type aguid: Standard_GUID &
	:rtype: bool
") ForgetAttribute;
		Standard_Boolean ForgetAttribute (const Standard_GUID & aguid);
		%feature("compactdefaultargs") ForgetAllAttributes;
		%feature("autodoc", "	* Forgets all the attributes. Does it on also on the sub-labels if <clearChildren> is set to true. Of course, this method is compatible with Transaction & Delta mecanisms.

	:param clearChildren: default value is Standard_True
	:type clearChildren: bool
	:rtype: None
") ForgetAllAttributes;
		void ForgetAllAttributes (const Standard_Boolean clearChildren = Standard_True);
		%feature("compactdefaultargs") ResumeAttribute;
		%feature("autodoc", "	* Undo Forget action, setting its forgotten status false and its valid status true. Raises if the attribute is not in the structure.

	:param anAttribute:
	:type anAttribute: Handle_TDF_Attribute &
	:rtype: None
") ResumeAttribute;
		void ResumeAttribute (const Handle_TDF_Attribute & anAttribute);
		%feature("compactdefaultargs") FindAttribute;
		%feature("autodoc", "	* Finds an attribute of the current label, according to <anID>. If anAttribute is not a valid one, false is returned. //! The method returns True if found, False otherwise. //! A removed attribute cannot be found.

	:param anID:
	:type anID: Standard_GUID &
	:param anAttribute:
	:type anAttribute: Handle_TDF_Attribute &
	:rtype: bool
") FindAttribute;
		Standard_Boolean FindAttribute (const Standard_GUID & anID,Handle_TDF_Attribute & anAttribute);
		%feature("compactdefaultargs") FindAttribute;
		%feature("autodoc", "	* Finds an attribute of the current label, according to <anID> and <aTransaction>. This attribute has/had to be a valid one for the given transaction index . So, this attribute is not necessary a valid one. //! The method returns True if found, False otherwise. //! A removed attribute cannot be found nor a backuped attribute of a removed one.

	:param anID:
	:type anID: Standard_GUID &
	:param aTransaction:
	:type aTransaction: int
	:param anAttribute:
	:type anAttribute: Handle_TDF_Attribute &
	:rtype: bool
") FindAttribute;
		Standard_Boolean FindAttribute (const Standard_GUID & anID,const Standard_Integer aTransaction,Handle_TDF_Attribute & anAttribute);
		%feature("compactdefaultargs") MayBeModified;
		%feature("autodoc", "	* Returns true if <self> or a DESCENDANT of <self> owns attributes not yet available in transaction 0. It means at least one of their attributes is new, modified or deleted.

	:rtype: bool
") MayBeModified;
		Standard_Boolean MayBeModified ();
		%feature("compactdefaultargs") AttributesModified;
		%feature("autodoc", "	* Returns true if <self> owns attributes not yet available in transaction 0. It means at least one attribute is new, modified or deleted.

	:rtype: bool
") AttributesModified;
		Standard_Boolean AttributesModified ();
		%feature("compactdefaultargs") HasAttribute;
		%feature("autodoc", "	* Returns true if this label has at least one attribute.

	:rtype: bool
") HasAttribute;
		Standard_Boolean HasAttribute ();
		%feature("compactdefaultargs") NbAttributes;
		%feature("autodoc", "	* Returns the number of attributes.

	:rtype: int
") NbAttributes;
		Standard_Integer NbAttributes ();
		%feature("compactdefaultargs") Depth;
		%feature("autodoc", "	* Returns the depth of the label in the data framework. This corresponds to the number of fathers which this label has, and is used in determining whether a label is root, null or equivalent to another label. Exceptions: Standard_NullObject if this label is null. This is because a null object can have no depth.

	:rtype: int
") Depth;
		Standard_Integer Depth ();
		%feature("compactdefaultargs") IsDescendant;
		%feature("autodoc", "	* Returns True if <self> is a descendant of <aLabel>. Attention: every label is its own descendant.

	:param aLabel:
	:type aLabel: TDF_Label &
	:rtype: bool
") IsDescendant;
		Standard_Boolean IsDescendant (const TDF_Label & aLabel);
		%feature("compactdefaultargs") Root;
		%feature("autodoc", "	* Returns the root label Root of the data structure. This has a depth of 0. Exceptions: Standard_NullObject if this label is null. This is because a null object can have no depth.

	:rtype: TDF_Label
") Root;
		const TDF_Label Root ();
		%feature("compactdefaultargs") HasChild;
		%feature("autodoc", "	* Returns true if this label has at least one child.

	:rtype: bool
") HasChild;
		Standard_Boolean HasChild ();
		%feature("compactdefaultargs") NbChildren;
		%feature("autodoc", "	* Returns the number of children.

	:rtype: int
") NbChildren;
		Standard_Integer NbChildren ();
		%feature("compactdefaultargs") FindChild;
		%feature("autodoc", "	* Finds a child label having <aTag> as tag. Creates The tag aTag identifies the label which will be the parent. If create is true and no child label is found, a new one is created. Example: //creating a label with tag 10 at Root TDF_Label lab1 = aDF->Root().FindChild(10); //creating labels 7 and 2 on label 10 TDF_Label lab2 = lab1.FindChild(7); TDF_Label lab3 = lab1.FindChild(2);

	:param aTag:
	:type aTag: int
	:param create: default value is Standard_True
	:type create: bool
	:rtype: TDF_Label
") FindChild;
		TDF_Label FindChild (const Standard_Integer aTag,const Standard_Boolean create = Standard_True);
		%feature("compactdefaultargs") NewChild;
		%feature("autodoc", "	* Create a new child label of me using autoamtic delivery tags provided by TagSource.

	:rtype: TDF_Label
") NewChild;
		TDF_Label NewChild ();
		%feature("compactdefaultargs") Transaction;
		%feature("autodoc", "	* Returns the current transaction index.

	:rtype: int
") Transaction;
		Standard_Integer Transaction ();
		%feature("compactdefaultargs") HasLowerNode;
		%feature("autodoc", "	* Returns true if node address of <self> is lower than <otherLabel> one. Used to quickly sort labels (not on entry criterion). //! -C++: inline

	:param otherLabel:
	:type otherLabel: TDF_Label &
	:rtype: bool
") HasLowerNode;
		Standard_Boolean HasLowerNode (const TDF_Label & otherLabel);
		%feature("compactdefaultargs") HasGreaterNode;
		%feature("autodoc", "	* Returns true if node address of <self> is greater than <otherLabel> one. Used to quickly sort labels (not on entry criterion). //! -C++: inline

	:param otherLabel:
	:type otherLabel: TDF_Label &
	:rtype: bool
") HasGreaterNode;
		Standard_Boolean HasGreaterNode (const TDF_Label & otherLabel);

        %feature("autodoc", "1");
        %extend{
            std::string DumpToString() {
            std::stringstream s;
            self->Dump(s);
            return s.str();}
        };
        		%feature("compactdefaultargs") ExtendedDump;
		%feature("autodoc", "	* Dumps the label on <aStream> and its attributes rank in <aMap> if their IDs are kept by <IDFilter>.

	:param anOS:
	:type anOS: Standard_OStream &
	:param aFilter:
	:type aFilter: TDF_IDFilter &
	:param aMap:
	:type aMap: TDF_AttributeIndexedMap &
	:rtype: None
") ExtendedDump;
		void ExtendedDump (Standard_OStream & anOS,const TDF_IDFilter & aFilter,TDF_AttributeIndexedMap & aMap);

        %feature("autodoc", "1");
        %extend{
            std::string EntryDumpToString() {
            std::stringstream s;
            self->EntryDump(s);
            return s.str();}
        };
        };


%extend TDF_Label {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TDF_LabelDataMap;
class TDF_LabelDataMap : public TCollection_BasicMap {
	public:
		%feature("compactdefaultargs") TDF_LabelDataMap;
		%feature("autodoc", "	:param NbBuckets: default value is 1
	:type NbBuckets: int
	:rtype: None
") TDF_LabelDataMap;
		 TDF_LabelDataMap (const Standard_Integer NbBuckets = 1);
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: TDF_LabelDataMap &
	:rtype: TDF_LabelDataMap
") Assign;
		TDF_LabelDataMap & Assign (const TDF_LabelDataMap & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: TDF_LabelDataMap &
	:rtype: TDF_LabelDataMap
") operator =;
		TDF_LabelDataMap & operator = (const TDF_LabelDataMap & Other);
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
	:type K: TDF_Label &
	:param I:
	:type I: TDF_Label &
	:rtype: bool
") Bind;
		Standard_Boolean Bind (const TDF_Label & K,const TDF_Label & I);
		%feature("compactdefaultargs") IsBound;
		%feature("autodoc", "	:param K:
	:type K: TDF_Label &
	:rtype: bool
") IsBound;
		Standard_Boolean IsBound (const TDF_Label & K);
		%feature("compactdefaultargs") UnBind;
		%feature("autodoc", "	:param K:
	:type K: TDF_Label &
	:rtype: bool
") UnBind;
		Standard_Boolean UnBind (const TDF_Label & K);
		%feature("compactdefaultargs") Find;
		%feature("autodoc", "	:param K:
	:type K: TDF_Label &
	:rtype: TDF_Label
") Find;
		const TDF_Label & Find (const TDF_Label & K);
		%feature("compactdefaultargs") ChangeFind;
		%feature("autodoc", "	:param K:
	:type K: TDF_Label &
	:rtype: TDF_Label
") ChangeFind;
		TDF_Label & ChangeFind (const TDF_Label & K);
		%feature("compactdefaultargs") Find1;
		%feature("autodoc", "	:param K:
	:type K: TDF_Label &
	:rtype: Standard_Address
") Find1;
		Standard_Address Find1 (const TDF_Label & K);
		%feature("compactdefaultargs") ChangeFind1;
		%feature("autodoc", "	:param K:
	:type K: TDF_Label &
	:rtype: Standard_Address
") ChangeFind1;
		Standard_Address ChangeFind1 (const TDF_Label & K);
};


%extend TDF_LabelDataMap {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TDF_LabelDoubleMap;
class TDF_LabelDoubleMap : public TCollection_BasicMap {
	public:
		%feature("compactdefaultargs") TDF_LabelDoubleMap;
		%feature("autodoc", "	:param NbBuckets: default value is 1
	:type NbBuckets: int
	:rtype: None
") TDF_LabelDoubleMap;
		 TDF_LabelDoubleMap (const Standard_Integer NbBuckets = 1);
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: TDF_LabelDoubleMap &
	:rtype: TDF_LabelDoubleMap
") Assign;
		TDF_LabelDoubleMap & Assign (const TDF_LabelDoubleMap & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: TDF_LabelDoubleMap &
	:rtype: TDF_LabelDoubleMap
") operator =;
		TDF_LabelDoubleMap & operator = (const TDF_LabelDoubleMap & Other);
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
		%feature("autodoc", "	:param K1:
	:type K1: TDF_Label &
	:param K2:
	:type K2: TDF_Label &
	:rtype: None
") Bind;
		void Bind (const TDF_Label & K1,const TDF_Label & K2);
		%feature("compactdefaultargs") AreBound;
		%feature("autodoc", "	:param K1:
	:type K1: TDF_Label &
	:param K2:
	:type K2: TDF_Label &
	:rtype: bool
") AreBound;
		Standard_Boolean AreBound (const TDF_Label & K1,const TDF_Label & K2);
		%feature("compactdefaultargs") IsBound1;
		%feature("autodoc", "	:param K:
	:type K: TDF_Label &
	:rtype: bool
") IsBound1;
		Standard_Boolean IsBound1 (const TDF_Label & K);
		%feature("compactdefaultargs") IsBound2;
		%feature("autodoc", "	:param K:
	:type K: TDF_Label &
	:rtype: bool
") IsBound2;
		Standard_Boolean IsBound2 (const TDF_Label & K);
		%feature("compactdefaultargs") Find1;
		%feature("autodoc", "	:param K:
	:type K: TDF_Label &
	:rtype: TDF_Label
") Find1;
		const TDF_Label & Find1 (const TDF_Label & K);
		%feature("compactdefaultargs") Find2;
		%feature("autodoc", "	:param K:
	:type K: TDF_Label &
	:rtype: TDF_Label
") Find2;
		const TDF_Label & Find2 (const TDF_Label & K);
		%feature("compactdefaultargs") UnBind1;
		%feature("autodoc", "	:param K:
	:type K: TDF_Label &
	:rtype: bool
") UnBind1;
		Standard_Boolean UnBind1 (const TDF_Label & K);
		%feature("compactdefaultargs") UnBind2;
		%feature("autodoc", "	:param K:
	:type K: TDF_Label &
	:rtype: bool
") UnBind2;
		Standard_Boolean UnBind2 (const TDF_Label & K);
};


%extend TDF_LabelDoubleMap {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TDF_LabelIndexedMap;
class TDF_LabelIndexedMap : public TCollection_BasicMap {
	public:
		%feature("compactdefaultargs") TDF_LabelIndexedMap;
		%feature("autodoc", "	:param NbBuckets: default value is 1
	:type NbBuckets: int
	:rtype: None
") TDF_LabelIndexedMap;
		 TDF_LabelIndexedMap (const Standard_Integer NbBuckets = 1);
		%feature("compactdefaultargs") TDF_LabelIndexedMap;
		%feature("autodoc", "	:param Other:
	:type Other: TDF_LabelIndexedMap &
	:rtype: None
") TDF_LabelIndexedMap;
		 TDF_LabelIndexedMap (const TDF_LabelIndexedMap & Other);
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: TDF_LabelIndexedMap &
	:rtype: TDF_LabelIndexedMap
") Assign;
		TDF_LabelIndexedMap & Assign (const TDF_LabelIndexedMap & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: TDF_LabelIndexedMap &
	:rtype: TDF_LabelIndexedMap
") operator =;
		TDF_LabelIndexedMap & operator = (const TDF_LabelIndexedMap & Other);
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
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "	:param K:
	:type K: TDF_Label &
	:rtype: int
") Add;
		Standard_Integer Add (const TDF_Label & K);
		%feature("compactdefaultargs") Substitute;
		%feature("autodoc", "	:param I:
	:type I: int
	:param K:
	:type K: TDF_Label &
	:rtype: None
") Substitute;
		void Substitute (const Standard_Integer I,const TDF_Label & K);
		%feature("compactdefaultargs") RemoveLast;
		%feature("autodoc", "	:rtype: None
") RemoveLast;
		void RemoveLast ();
		%feature("compactdefaultargs") Contains;
		%feature("autodoc", "	:param K:
	:type K: TDF_Label &
	:rtype: bool
") Contains;
		Standard_Boolean Contains (const TDF_Label & K);
		%feature("compactdefaultargs") FindKey;
		%feature("autodoc", "	:param I:
	:type I: int
	:rtype: TDF_Label
") FindKey;
		const TDF_Label & FindKey (const Standard_Integer I);
		%feature("compactdefaultargs") FindIndex;
		%feature("autodoc", "	:param K:
	:type K: TDF_Label &
	:rtype: int
") FindIndex;
		Standard_Integer FindIndex (const TDF_Label & K);
};


%extend TDF_LabelIndexedMap {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TDF_LabelIntegerMap;
class TDF_LabelIntegerMap : public TCollection_BasicMap {
	public:
		%feature("compactdefaultargs") TDF_LabelIntegerMap;
		%feature("autodoc", "	:param NbBuckets: default value is 1
	:type NbBuckets: int
	:rtype: None
") TDF_LabelIntegerMap;
		 TDF_LabelIntegerMap (const Standard_Integer NbBuckets = 1);
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: TDF_LabelIntegerMap &
	:rtype: TDF_LabelIntegerMap
") Assign;
		TDF_LabelIntegerMap & Assign (const TDF_LabelIntegerMap & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: TDF_LabelIntegerMap &
	:rtype: TDF_LabelIntegerMap
") operator =;
		TDF_LabelIntegerMap & operator = (const TDF_LabelIntegerMap & Other);
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
	:type K: TDF_Label &
	:param I:
	:type I: int &
	:rtype: bool
") Bind;
		Standard_Boolean Bind (const TDF_Label & K,const Standard_Integer & I);
		%feature("compactdefaultargs") IsBound;
		%feature("autodoc", "	:param K:
	:type K: TDF_Label &
	:rtype: bool
") IsBound;
		Standard_Boolean IsBound (const TDF_Label & K);
		%feature("compactdefaultargs") UnBind;
		%feature("autodoc", "	:param K:
	:type K: TDF_Label &
	:rtype: bool
") UnBind;
		Standard_Boolean UnBind (const TDF_Label & K);
		%feature("compactdefaultargs") Find;
		%feature("autodoc", "	:param K:
	:type K: TDF_Label &
	:rtype: int
") Find;
		const Standard_Integer & Find (const TDF_Label & K);
		%feature("compactdefaultargs") ChangeFind;
		%feature("autodoc", "	:param K:
	:type K: TDF_Label &
	:rtype: int
") ChangeFind;
		Standard_Integer & ChangeFind (const TDF_Label & K);
		%feature("compactdefaultargs") Find1;
		%feature("autodoc", "	:param K:
	:type K: TDF_Label &
	:rtype: Standard_Address
") Find1;
		Standard_Address Find1 (const TDF_Label & K);
		%feature("compactdefaultargs") ChangeFind1;
		%feature("autodoc", "	:param K:
	:type K: TDF_Label &
	:rtype: Standard_Address
") ChangeFind1;
		Standard_Address ChangeFind1 (const TDF_Label & K);
};


%extend TDF_LabelIntegerMap {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TDF_LabelList;
class TDF_LabelList {
	public:
		%feature("compactdefaultargs") TDF_LabelList;
		%feature("autodoc", "	:rtype: None
") TDF_LabelList;
		 TDF_LabelList ();
		%feature("compactdefaultargs") TDF_LabelList;
		%feature("autodoc", "	:param Other:
	:type Other: TDF_LabelList &
	:rtype: None
") TDF_LabelList;
		 TDF_LabelList (const TDF_LabelList & Other);
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: TDF_LabelList &
	:rtype: None
") Assign;
		void Assign (const TDF_LabelList & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: TDF_LabelList &
	:rtype: None
") operator =;
		void operator = (const TDF_LabelList & Other);
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
	:type I: TDF_Label &
	:rtype: None
") Prepend;
		void Prepend (const TDF_Label & I);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param I:
	:type I: TDF_Label &
	:param theIt:
	:type theIt: TDF_ListIteratorOfLabelList &
	:rtype: None
") Prepend;
		void Prepend (const TDF_Label & I,TDF_ListIteratorOfLabelList & theIt);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param Other:
	:type Other: TDF_LabelList &
	:rtype: None
") Prepend;
		void Prepend (TDF_LabelList & Other);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param I:
	:type I: TDF_Label &
	:rtype: None
") Append;
		void Append (const TDF_Label & I);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param I:
	:type I: TDF_Label &
	:param theIt:
	:type theIt: TDF_ListIteratorOfLabelList &
	:rtype: None
") Append;
		void Append (const TDF_Label & I,TDF_ListIteratorOfLabelList & theIt);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param Other:
	:type Other: TDF_LabelList &
	:rtype: None
") Append;
		void Append (TDF_LabelList & Other);
		%feature("compactdefaultargs") First;
		%feature("autodoc", "	:rtype: TDF_Label
") First;
		TDF_Label & First ();
		%feature("compactdefaultargs") Last;
		%feature("autodoc", "	:rtype: TDF_Label
") Last;
		TDF_Label & Last ();
		%feature("compactdefaultargs") RemoveFirst;
		%feature("autodoc", "	:rtype: None
") RemoveFirst;
		void RemoveFirst ();
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	:param It:
	:type It: TDF_ListIteratorOfLabelList &
	:rtype: None
") Remove;
		void Remove (TDF_ListIteratorOfLabelList & It);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param I:
	:type I: TDF_Label &
	:param It:
	:type It: TDF_ListIteratorOfLabelList &
	:rtype: None
") InsertBefore;
		void InsertBefore (const TDF_Label & I,TDF_ListIteratorOfLabelList & It);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param Other:
	:type Other: TDF_LabelList &
	:param It:
	:type It: TDF_ListIteratorOfLabelList &
	:rtype: None
") InsertBefore;
		void InsertBefore (TDF_LabelList & Other,TDF_ListIteratorOfLabelList & It);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param I:
	:type I: TDF_Label &
	:param It:
	:type It: TDF_ListIteratorOfLabelList &
	:rtype: None
") InsertAfter;
		void InsertAfter (const TDF_Label & I,TDF_ListIteratorOfLabelList & It);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param Other:
	:type Other: TDF_LabelList &
	:param It:
	:type It: TDF_ListIteratorOfLabelList &
	:rtype: None
") InsertAfter;
		void InsertAfter (TDF_LabelList & Other,TDF_ListIteratorOfLabelList & It);
};


%extend TDF_LabelList {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TDF_LabelMap;
class TDF_LabelMap : public TCollection_BasicMap {
	public:
		%feature("compactdefaultargs") TDF_LabelMap;
		%feature("autodoc", "	:param NbBuckets: default value is 1
	:type NbBuckets: int
	:rtype: None
") TDF_LabelMap;
		 TDF_LabelMap (const Standard_Integer NbBuckets = 1);
		%feature("compactdefaultargs") TDF_LabelMap;
		%feature("autodoc", "	:param Other:
	:type Other: TDF_LabelMap &
	:rtype: None
") TDF_LabelMap;
		 TDF_LabelMap (const TDF_LabelMap & Other);
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: TDF_LabelMap &
	:rtype: TDF_LabelMap
") Assign;
		TDF_LabelMap & Assign (const TDF_LabelMap & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: TDF_LabelMap &
	:rtype: TDF_LabelMap
") operator =;
		TDF_LabelMap & operator = (const TDF_LabelMap & Other);
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
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "	:param aKey:
	:type aKey: TDF_Label &
	:rtype: bool
") Add;
		Standard_Boolean Add (const TDF_Label & aKey);
		%feature("compactdefaultargs") Contains;
		%feature("autodoc", "	:param aKey:
	:type aKey: TDF_Label &
	:rtype: bool
") Contains;
		Standard_Boolean Contains (const TDF_Label & aKey);
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	:param aKey:
	:type aKey: TDF_Label &
	:rtype: bool
") Remove;
		Standard_Boolean Remove (const TDF_Label & aKey);
};


%extend TDF_LabelMap {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TDF_LabelSequence;
class TDF_LabelSequence : public TCollection_BaseSequence {
	public:
		%feature("compactdefaultargs") TDF_LabelSequence;
		%feature("autodoc", "	:rtype: None
") TDF_LabelSequence;
		 TDF_LabelSequence ();
		%feature("compactdefaultargs") TDF_LabelSequence;
		%feature("autodoc", "	:param Other:
	:type Other: TDF_LabelSequence &
	:rtype: None
") TDF_LabelSequence;
		 TDF_LabelSequence (const TDF_LabelSequence & Other);
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: TDF_LabelSequence &
	:rtype: TDF_LabelSequence
") Assign;
		const TDF_LabelSequence & Assign (const TDF_LabelSequence & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: TDF_LabelSequence &
	:rtype: TDF_LabelSequence
") operator =;
		const TDF_LabelSequence & operator = (const TDF_LabelSequence & Other);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param T:
	:type T: TDF_Label &
	:rtype: None
") Append;
		void Append (const TDF_Label & T);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param S:
	:type S: TDF_LabelSequence &
	:rtype: None
") Append;
		void Append (TDF_LabelSequence & S);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param T:
	:type T: TDF_Label &
	:rtype: None
") Prepend;
		void Prepend (const TDF_Label & T);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param S:
	:type S: TDF_LabelSequence &
	:rtype: None
") Prepend;
		void Prepend (TDF_LabelSequence & S);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param T:
	:type T: TDF_Label &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const TDF_Label & T);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param S:
	:type S: TDF_LabelSequence &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,TDF_LabelSequence & S);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param T:
	:type T: TDF_Label &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const TDF_Label & T);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param S:
	:type S: TDF_LabelSequence &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,TDF_LabelSequence & S);
		%feature("compactdefaultargs") First;
		%feature("autodoc", "	:rtype: TDF_Label
") First;
		const TDF_Label & First ();
		%feature("compactdefaultargs") Last;
		%feature("autodoc", "	:rtype: TDF_Label
") Last;
		const TDF_Label & Last ();
		%feature("compactdefaultargs") Split;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param Sub:
	:type Sub: TDF_LabelSequence &
	:rtype: None
") Split;
		void Split (const Standard_Integer Index,TDF_LabelSequence & Sub);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: TDF_Label
") Value;
		const TDF_Label & Value (const Standard_Integer Index);
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param I:
	:type I: TDF_Label &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const TDF_Label & I);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: TDF_Label
") ChangeValue;
		TDF_Label & ChangeValue (const Standard_Integer Index);
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: None
") Remove;
		void Remove (const Standard_Integer Index);
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	:param FromIndex:
	:type FromIndex: int
	:param ToIndex:
	:type ToIndex: int
	:rtype: None
") Remove;
		void Remove (const Standard_Integer FromIndex,const Standard_Integer ToIndex);
};


%extend TDF_LabelSequence {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TDF_ListIteratorOfAttributeDeltaList;
class TDF_ListIteratorOfAttributeDeltaList {
	public:
		%feature("compactdefaultargs") TDF_ListIteratorOfAttributeDeltaList;
		%feature("autodoc", "	:rtype: None
") TDF_ListIteratorOfAttributeDeltaList;
		 TDF_ListIteratorOfAttributeDeltaList ();
		%feature("compactdefaultargs") TDF_ListIteratorOfAttributeDeltaList;
		%feature("autodoc", "	:param L:
	:type L: TDF_AttributeDeltaList &
	:rtype: None
") TDF_ListIteratorOfAttributeDeltaList;
		 TDF_ListIteratorOfAttributeDeltaList (const TDF_AttributeDeltaList & L);
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "	:param L:
	:type L: TDF_AttributeDeltaList &
	:rtype: None
") Initialize;
		void Initialize (const TDF_AttributeDeltaList & L);
		%feature("compactdefaultargs") More;
		%feature("autodoc", "	:rtype: bool
") More;
		Standard_Boolean More ();
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "	:rtype: None
") Next;
		void Next ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: Handle_TDF_AttributeDelta
") Value;
		Handle_TDF_AttributeDelta Value ();
};


%extend TDF_ListIteratorOfAttributeDeltaList {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TDF_ListIteratorOfAttributeList;
class TDF_ListIteratorOfAttributeList {
	public:
		%feature("compactdefaultargs") TDF_ListIteratorOfAttributeList;
		%feature("autodoc", "	:rtype: None
") TDF_ListIteratorOfAttributeList;
		 TDF_ListIteratorOfAttributeList ();
		%feature("compactdefaultargs") TDF_ListIteratorOfAttributeList;
		%feature("autodoc", "	:param L:
	:type L: TDF_AttributeList &
	:rtype: None
") TDF_ListIteratorOfAttributeList;
		 TDF_ListIteratorOfAttributeList (const TDF_AttributeList & L);
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "	:param L:
	:type L: TDF_AttributeList &
	:rtype: None
") Initialize;
		void Initialize (const TDF_AttributeList & L);
		%feature("compactdefaultargs") More;
		%feature("autodoc", "	:rtype: bool
") More;
		Standard_Boolean More ();
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "	:rtype: None
") Next;
		void Next ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: Handle_TDF_Attribute
") Value;
		Handle_TDF_Attribute Value ();
};


%extend TDF_ListIteratorOfAttributeList {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TDF_ListIteratorOfDeltaList;
class TDF_ListIteratorOfDeltaList {
	public:
		%feature("compactdefaultargs") TDF_ListIteratorOfDeltaList;
		%feature("autodoc", "	:rtype: None
") TDF_ListIteratorOfDeltaList;
		 TDF_ListIteratorOfDeltaList ();
		%feature("compactdefaultargs") TDF_ListIteratorOfDeltaList;
		%feature("autodoc", "	:param L:
	:type L: TDF_DeltaList &
	:rtype: None
") TDF_ListIteratorOfDeltaList;
		 TDF_ListIteratorOfDeltaList (const TDF_DeltaList & L);
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "	:param L:
	:type L: TDF_DeltaList &
	:rtype: None
") Initialize;
		void Initialize (const TDF_DeltaList & L);
		%feature("compactdefaultargs") More;
		%feature("autodoc", "	:rtype: bool
") More;
		Standard_Boolean More ();
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "	:rtype: None
") Next;
		void Next ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: Handle_TDF_Delta
") Value;
		Handle_TDF_Delta Value ();
};


%extend TDF_ListIteratorOfDeltaList {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TDF_ListIteratorOfIDList;
class TDF_ListIteratorOfIDList {
	public:
		%feature("compactdefaultargs") TDF_ListIteratorOfIDList;
		%feature("autodoc", "	:rtype: None
") TDF_ListIteratorOfIDList;
		 TDF_ListIteratorOfIDList ();
		%feature("compactdefaultargs") TDF_ListIteratorOfIDList;
		%feature("autodoc", "	:param L:
	:type L: TDF_IDList &
	:rtype: None
") TDF_ListIteratorOfIDList;
		 TDF_ListIteratorOfIDList (const TDF_IDList & L);
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "	:param L:
	:type L: TDF_IDList &
	:rtype: None
") Initialize;
		void Initialize (const TDF_IDList & L);
		%feature("compactdefaultargs") More;
		%feature("autodoc", "	:rtype: bool
") More;
		Standard_Boolean More ();
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "	:rtype: None
") Next;
		void Next ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: Standard_GUID
") Value;
		Standard_GUID & Value ();
};


%extend TDF_ListIteratorOfIDList {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TDF_ListIteratorOfLabelList;
class TDF_ListIteratorOfLabelList {
	public:
		%feature("compactdefaultargs") TDF_ListIteratorOfLabelList;
		%feature("autodoc", "	:rtype: None
") TDF_ListIteratorOfLabelList;
		 TDF_ListIteratorOfLabelList ();
		%feature("compactdefaultargs") TDF_ListIteratorOfLabelList;
		%feature("autodoc", "	:param L:
	:type L: TDF_LabelList &
	:rtype: None
") TDF_ListIteratorOfLabelList;
		 TDF_ListIteratorOfLabelList (const TDF_LabelList & L);
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "	:param L:
	:type L: TDF_LabelList &
	:rtype: None
") Initialize;
		void Initialize (const TDF_LabelList & L);
		%feature("compactdefaultargs") More;
		%feature("autodoc", "	:rtype: bool
") More;
		Standard_Boolean More ();
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "	:rtype: None
") Next;
		void Next ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: TDF_Label
") Value;
		TDF_Label & Value ();
};


%extend TDF_ListIteratorOfLabelList {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TDF_ListNodeOfAttributeDeltaList;
class TDF_ListNodeOfAttributeDeltaList : public TCollection_MapNode {
	public:
		%feature("compactdefaultargs") TDF_ListNodeOfAttributeDeltaList;
		%feature("autodoc", "	:param I:
	:type I: Handle_TDF_AttributeDelta &
	:param n:
	:type n: TCollection_MapNodePtr &
	:rtype: None
") TDF_ListNodeOfAttributeDeltaList;
		 TDF_ListNodeOfAttributeDeltaList (const Handle_TDF_AttributeDelta & I,const TCollection_MapNodePtr & n);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: Handle_TDF_AttributeDelta
") Value;
		Handle_TDF_AttributeDelta Value ();
};


%extend TDF_ListNodeOfAttributeDeltaList {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_TDF_ListNodeOfAttributeDeltaList(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_TDF_ListNodeOfAttributeDeltaList::Handle_TDF_ListNodeOfAttributeDeltaList %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_TDF_ListNodeOfAttributeDeltaList;
class Handle_TDF_ListNodeOfAttributeDeltaList : public Handle_TCollection_MapNode {

    public:
        // constructors
        Handle_TDF_ListNodeOfAttributeDeltaList();
        Handle_TDF_ListNodeOfAttributeDeltaList(const Handle_TDF_ListNodeOfAttributeDeltaList &aHandle);
        Handle_TDF_ListNodeOfAttributeDeltaList(const TDF_ListNodeOfAttributeDeltaList *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_TDF_ListNodeOfAttributeDeltaList DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_TDF_ListNodeOfAttributeDeltaList {
    TDF_ListNodeOfAttributeDeltaList* _get_reference() {
    return (TDF_ListNodeOfAttributeDeltaList*)$self->Access();
    }
};

%extend Handle_TDF_ListNodeOfAttributeDeltaList {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend TDF_ListNodeOfAttributeDeltaList {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TDF_ListNodeOfAttributeList;
class TDF_ListNodeOfAttributeList : public TCollection_MapNode {
	public:
		%feature("compactdefaultargs") TDF_ListNodeOfAttributeList;
		%feature("autodoc", "	:param I:
	:type I: Handle_TDF_Attribute &
	:param n:
	:type n: TCollection_MapNodePtr &
	:rtype: None
") TDF_ListNodeOfAttributeList;
		 TDF_ListNodeOfAttributeList (const Handle_TDF_Attribute & I,const TCollection_MapNodePtr & n);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: Handle_TDF_Attribute
") Value;
		Handle_TDF_Attribute Value ();
};


%extend TDF_ListNodeOfAttributeList {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_TDF_ListNodeOfAttributeList(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_TDF_ListNodeOfAttributeList::Handle_TDF_ListNodeOfAttributeList %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_TDF_ListNodeOfAttributeList;
class Handle_TDF_ListNodeOfAttributeList : public Handle_TCollection_MapNode {

    public:
        // constructors
        Handle_TDF_ListNodeOfAttributeList();
        Handle_TDF_ListNodeOfAttributeList(const Handle_TDF_ListNodeOfAttributeList &aHandle);
        Handle_TDF_ListNodeOfAttributeList(const TDF_ListNodeOfAttributeList *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_TDF_ListNodeOfAttributeList DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_TDF_ListNodeOfAttributeList {
    TDF_ListNodeOfAttributeList* _get_reference() {
    return (TDF_ListNodeOfAttributeList*)$self->Access();
    }
};

%extend Handle_TDF_ListNodeOfAttributeList {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend TDF_ListNodeOfAttributeList {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TDF_ListNodeOfDeltaList;
class TDF_ListNodeOfDeltaList : public TCollection_MapNode {
	public:
		%feature("compactdefaultargs") TDF_ListNodeOfDeltaList;
		%feature("autodoc", "	:param I:
	:type I: Handle_TDF_Delta &
	:param n:
	:type n: TCollection_MapNodePtr &
	:rtype: None
") TDF_ListNodeOfDeltaList;
		 TDF_ListNodeOfDeltaList (const Handle_TDF_Delta & I,const TCollection_MapNodePtr & n);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: Handle_TDF_Delta
") Value;
		Handle_TDF_Delta Value ();
};


%extend TDF_ListNodeOfDeltaList {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_TDF_ListNodeOfDeltaList(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_TDF_ListNodeOfDeltaList::Handle_TDF_ListNodeOfDeltaList %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_TDF_ListNodeOfDeltaList;
class Handle_TDF_ListNodeOfDeltaList : public Handle_TCollection_MapNode {

    public:
        // constructors
        Handle_TDF_ListNodeOfDeltaList();
        Handle_TDF_ListNodeOfDeltaList(const Handle_TDF_ListNodeOfDeltaList &aHandle);
        Handle_TDF_ListNodeOfDeltaList(const TDF_ListNodeOfDeltaList *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_TDF_ListNodeOfDeltaList DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_TDF_ListNodeOfDeltaList {
    TDF_ListNodeOfDeltaList* _get_reference() {
    return (TDF_ListNodeOfDeltaList*)$self->Access();
    }
};

%extend Handle_TDF_ListNodeOfDeltaList {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend TDF_ListNodeOfDeltaList {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TDF_ListNodeOfIDList;
class TDF_ListNodeOfIDList : public TCollection_MapNode {
	public:
		%feature("compactdefaultargs") TDF_ListNodeOfIDList;
		%feature("autodoc", "	:param I:
	:type I: Standard_GUID &
	:param n:
	:type n: TCollection_MapNodePtr &
	:rtype: None
") TDF_ListNodeOfIDList;
		 TDF_ListNodeOfIDList (const Standard_GUID & I,const TCollection_MapNodePtr & n);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: Standard_GUID
") Value;
		Standard_GUID & Value ();
};


%extend TDF_ListNodeOfIDList {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_TDF_ListNodeOfIDList(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_TDF_ListNodeOfIDList::Handle_TDF_ListNodeOfIDList %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_TDF_ListNodeOfIDList;
class Handle_TDF_ListNodeOfIDList : public Handle_TCollection_MapNode {

    public:
        // constructors
        Handle_TDF_ListNodeOfIDList();
        Handle_TDF_ListNodeOfIDList(const Handle_TDF_ListNodeOfIDList &aHandle);
        Handle_TDF_ListNodeOfIDList(const TDF_ListNodeOfIDList *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_TDF_ListNodeOfIDList DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_TDF_ListNodeOfIDList {
    TDF_ListNodeOfIDList* _get_reference() {
    return (TDF_ListNodeOfIDList*)$self->Access();
    }
};

%extend Handle_TDF_ListNodeOfIDList {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend TDF_ListNodeOfIDList {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TDF_ListNodeOfLabelList;
class TDF_ListNodeOfLabelList : public TCollection_MapNode {
	public:
		%feature("compactdefaultargs") TDF_ListNodeOfLabelList;
		%feature("autodoc", "	:param I:
	:type I: TDF_Label &
	:param n:
	:type n: TCollection_MapNodePtr &
	:rtype: None
") TDF_ListNodeOfLabelList;
		 TDF_ListNodeOfLabelList (const TDF_Label & I,const TCollection_MapNodePtr & n);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: TDF_Label
") Value;
		TDF_Label & Value ();
};


%extend TDF_ListNodeOfLabelList {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_TDF_ListNodeOfLabelList(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_TDF_ListNodeOfLabelList::Handle_TDF_ListNodeOfLabelList %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_TDF_ListNodeOfLabelList;
class Handle_TDF_ListNodeOfLabelList : public Handle_TCollection_MapNode {

    public:
        // constructors
        Handle_TDF_ListNodeOfLabelList();
        Handle_TDF_ListNodeOfLabelList(const Handle_TDF_ListNodeOfLabelList &aHandle);
        Handle_TDF_ListNodeOfLabelList(const TDF_ListNodeOfLabelList *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_TDF_ListNodeOfLabelList DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_TDF_ListNodeOfLabelList {
    TDF_ListNodeOfLabelList* _get_reference() {
    return (TDF_ListNodeOfLabelList*)$self->Access();
    }
};

%extend Handle_TDF_ListNodeOfLabelList {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend TDF_ListNodeOfLabelList {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TDF_MapIteratorOfAttributeMap;
class TDF_MapIteratorOfAttributeMap : public TCollection_BasicMapIterator {
	public:
		%feature("compactdefaultargs") TDF_MapIteratorOfAttributeMap;
		%feature("autodoc", "	:rtype: None
") TDF_MapIteratorOfAttributeMap;
		 TDF_MapIteratorOfAttributeMap ();
		%feature("compactdefaultargs") TDF_MapIteratorOfAttributeMap;
		%feature("autodoc", "	:param aMap:
	:type aMap: TDF_AttributeMap &
	:rtype: None
") TDF_MapIteratorOfAttributeMap;
		 TDF_MapIteratorOfAttributeMap (const TDF_AttributeMap & aMap);
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "	:param aMap:
	:type aMap: TDF_AttributeMap &
	:rtype: None
") Initialize;
		void Initialize (const TDF_AttributeMap & aMap);
		%feature("compactdefaultargs") Key;
		%feature("autodoc", "	:rtype: Handle_TDF_Attribute
") Key;
		Handle_TDF_Attribute Key ();
};


%extend TDF_MapIteratorOfAttributeMap {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TDF_MapIteratorOfIDMap;
class TDF_MapIteratorOfIDMap : public TCollection_BasicMapIterator {
	public:
		%feature("compactdefaultargs") TDF_MapIteratorOfIDMap;
		%feature("autodoc", "	:rtype: None
") TDF_MapIteratorOfIDMap;
		 TDF_MapIteratorOfIDMap ();
		%feature("compactdefaultargs") TDF_MapIteratorOfIDMap;
		%feature("autodoc", "	:param aMap:
	:type aMap: TDF_IDMap &
	:rtype: None
") TDF_MapIteratorOfIDMap;
		 TDF_MapIteratorOfIDMap (const TDF_IDMap & aMap);
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "	:param aMap:
	:type aMap: TDF_IDMap &
	:rtype: None
") Initialize;
		void Initialize (const TDF_IDMap & aMap);
		%feature("compactdefaultargs") Key;
		%feature("autodoc", "	:rtype: Standard_GUID
") Key;
		const Standard_GUID & Key ();
};


%extend TDF_MapIteratorOfIDMap {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TDF_MapIteratorOfLabelMap;
class TDF_MapIteratorOfLabelMap : public TCollection_BasicMapIterator {
	public:
		%feature("compactdefaultargs") TDF_MapIteratorOfLabelMap;
		%feature("autodoc", "	:rtype: None
") TDF_MapIteratorOfLabelMap;
		 TDF_MapIteratorOfLabelMap ();
		%feature("compactdefaultargs") TDF_MapIteratorOfLabelMap;
		%feature("autodoc", "	:param aMap:
	:type aMap: TDF_LabelMap &
	:rtype: None
") TDF_MapIteratorOfLabelMap;
		 TDF_MapIteratorOfLabelMap (const TDF_LabelMap & aMap);
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "	:param aMap:
	:type aMap: TDF_LabelMap &
	:rtype: None
") Initialize;
		void Initialize (const TDF_LabelMap & aMap);
		%feature("compactdefaultargs") Key;
		%feature("autodoc", "	:rtype: TDF_Label
") Key;
		const TDF_Label & Key ();
};


%extend TDF_MapIteratorOfLabelMap {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TDF_RelocationTable;
class TDF_RelocationTable : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") TDF_RelocationTable;
		%feature("autodoc", "	* Creates an relocation table. <selfRelocate> says if a value without explicit relocation is its own relocation.

	:param selfRelocate: default value is Standard_False
	:type selfRelocate: bool
	:rtype: None
") TDF_RelocationTable;
		 TDF_RelocationTable (const Standard_Boolean selfRelocate = Standard_False);
		%feature("compactdefaultargs") SelfRelocate;
		%feature("autodoc", "	* Sets <mySelfRelocate> to <selfRelocate>. //! This flag affects the HasRelocation method behavior like this: //! <mySelfRelocate> == False: //! If no relocation object is found in the map, a null object is returned //! <mySelfRelocate> == True: //! If no relocation object is found in the map, the method assumes the source object is relocation value; so the source object is returned as target object.

	:param selfRelocate:
	:type selfRelocate: bool
	:rtype: None
") SelfRelocate;
		void SelfRelocate (const Standard_Boolean selfRelocate);
		%feature("compactdefaultargs") SelfRelocate;
		%feature("autodoc", "	* Returns <mySelfRelocate>.

	:rtype: bool
") SelfRelocate;
		Standard_Boolean SelfRelocate ();
		%feature("compactdefaultargs") AfterRelocate;
		%feature("autodoc", "	:param afterRelocate:
	:type afterRelocate: bool
	:rtype: None
") AfterRelocate;
		void AfterRelocate (const Standard_Boolean afterRelocate);
		%feature("compactdefaultargs") AfterRelocate;
		%feature("autodoc", "	* Returns <myAfterRelocate>.

	:rtype: bool
") AfterRelocate;
		Standard_Boolean AfterRelocate ();
		%feature("compactdefaultargs") SetRelocation;
		%feature("autodoc", "	* Sets the relocation value of <aSourceLabel> to <aTargetLabel>.

	:param aSourceLabel:
	:type aSourceLabel: TDF_Label &
	:param aTargetLabel:
	:type aTargetLabel: TDF_Label &
	:rtype: None
") SetRelocation;
		void SetRelocation (const TDF_Label & aSourceLabel,const TDF_Label & aTargetLabel);
		%feature("compactdefaultargs") HasRelocation;
		%feature("autodoc", "	* Finds the relocation value of <aSourceLabel> and returns it into <aTargetLabel>. //! (See above SelfRelocate method for more explanation about the method behavior)

	:param aSourceLabel:
	:type aSourceLabel: TDF_Label &
	:param aTargetLabel:
	:type aTargetLabel: TDF_Label &
	:rtype: bool
") HasRelocation;
		Standard_Boolean HasRelocation (const TDF_Label & aSourceLabel,TDF_Label & aTargetLabel);
		%feature("compactdefaultargs") SetRelocation;
		%feature("autodoc", "	* Sets the relocation value of <aSourceAttribute> to <aTargetAttribute>.

	:param aSourceAttribute:
	:type aSourceAttribute: Handle_TDF_Attribute &
	:param aTargetAttribute:
	:type aTargetAttribute: Handle_TDF_Attribute &
	:rtype: None
") SetRelocation;
		void SetRelocation (const Handle_TDF_Attribute & aSourceAttribute,const Handle_TDF_Attribute & aTargetAttribute);
		%feature("compactdefaultargs") HasRelocation;
		%feature("autodoc", "	* Finds the relocation value of <aSourceAttribute> and returns it into <aTargetAttribute>. //! (See above SelfRelocate method for more explanation about the method behavior)

	:param aSourceAttribute:
	:type aSourceAttribute: Handle_TDF_Attribute &
	:param aTargetAttribute:
	:type aTargetAttribute: Handle_TDF_Attribute &
	:rtype: bool
") HasRelocation;
		Standard_Boolean HasRelocation (const Handle_TDF_Attribute & aSourceAttribute,Handle_TDF_Attribute & aTargetAttribute);
		%feature("compactdefaultargs") SetTransientRelocation;
		%feature("autodoc", "	* Sets the relocation value of <aSourceTransient> to <aTargetTransient>.

	:param aSourceTransient:
	:type aSourceTransient: Handle_Standard_Transient &
	:param aTargetTransient:
	:type aTargetTransient: Handle_Standard_Transient &
	:rtype: None
") SetTransientRelocation;
		void SetTransientRelocation (const Handle_Standard_Transient & aSourceTransient,const Handle_Standard_Transient & aTargetTransient);
		%feature("compactdefaultargs") HasTransientRelocation;
		%feature("autodoc", "	* Finds the relocation value of <aSourceTransient> and returns it into <aTargetTransient>. //! (See above SelfRelocate method for more explanation about the method behavior)

	:param aSourceTransient:
	:type aSourceTransient: Handle_Standard_Transient &
	:param aTargetTransient:
	:type aTargetTransient: Handle_Standard_Transient &
	:rtype: bool
") HasTransientRelocation;
		Standard_Boolean HasTransientRelocation (const Handle_Standard_Transient & aSourceTransient,Handle_Standard_Transient & aTargetTransient);
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	* Clears the relocation dictionnary, but lets the self relocation flag to its current value.

	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") TargetLabelMap;
		%feature("autodoc", "	* Fills <aLabelMap> with target relocation labels. <aLabelMap> is not cleared before use.

	:param aLabelMap:
	:type aLabelMap: TDF_LabelMap &
	:rtype: None
") TargetLabelMap;
		void TargetLabelMap (TDF_LabelMap & aLabelMap);
		%feature("compactdefaultargs") TargetAttributeMap;
		%feature("autodoc", "	* Fills <anAttributeMap> with target relocation attributes. <anAttributeMap> is not cleared before use.

	:param anAttributeMap:
	:type anAttributeMap: TDF_AttributeMap &
	:rtype: None
") TargetAttributeMap;
		void TargetAttributeMap (TDF_AttributeMap & anAttributeMap);
		%feature("compactdefaultargs") LabelTable;
		%feature("autodoc", "	* Returns <myLabelTable> to be used or updated.

	:rtype: TDF_LabelDataMap
") LabelTable;
		TDF_LabelDataMap & LabelTable ();
		%feature("compactdefaultargs") AttributeTable;
		%feature("autodoc", "	* Returns <myAttributeTable> to be used or updated.

	:rtype: TDF_AttributeDataMap
") AttributeTable;
		TDF_AttributeDataMap & AttributeTable ();
		%feature("compactdefaultargs") TransientTable;
		%feature("autodoc", "	* Returns <myTransientTable> to be used or updated.

	:rtype: TColStd_IndexedDataMapOfTransientTransient
") TransientTable;
		TColStd_IndexedDataMapOfTransientTransient & TransientTable ();
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "	* Dumps the relocation table.

	:param dumpLabels:
	:type dumpLabels: bool
	:param dumpAttributes:
	:type dumpAttributes: bool
	:param dumpTransients:
	:type dumpTransients: bool
	:param anOS:
	:type anOS: Standard_OStream &
	:rtype: Standard_OStream
") Dump;
		Standard_OStream & Dump (const Standard_Boolean dumpLabels,const Standard_Boolean dumpAttributes,const Standard_Boolean dumpTransients,Standard_OStream & anOS);
};


%extend TDF_RelocationTable {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_TDF_RelocationTable(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_TDF_RelocationTable::Handle_TDF_RelocationTable %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_TDF_RelocationTable;
class Handle_TDF_RelocationTable : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_TDF_RelocationTable();
        Handle_TDF_RelocationTable(const Handle_TDF_RelocationTable &aHandle);
        Handle_TDF_RelocationTable(const TDF_RelocationTable *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_TDF_RelocationTable DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_TDF_RelocationTable {
    TDF_RelocationTable* _get_reference() {
    return (TDF_RelocationTable*)$self->Access();
    }
};

%extend Handle_TDF_RelocationTable {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend TDF_RelocationTable {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TDF_SequenceNodeOfAttributeSequence;
class TDF_SequenceNodeOfAttributeSequence : public TCollection_SeqNode {
	public:
		%feature("compactdefaultargs") TDF_SequenceNodeOfAttributeSequence;
		%feature("autodoc", "	:param I:
	:type I: Handle_TDF_Attribute &
	:param n:
	:type n: TCollection_SeqNodePtr &
	:param p:
	:type p: TCollection_SeqNodePtr &
	:rtype: None
") TDF_SequenceNodeOfAttributeSequence;
		 TDF_SequenceNodeOfAttributeSequence (const Handle_TDF_Attribute & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: Handle_TDF_Attribute
") Value;
		Handle_TDF_Attribute Value ();
};


%extend TDF_SequenceNodeOfAttributeSequence {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_TDF_SequenceNodeOfAttributeSequence(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_TDF_SequenceNodeOfAttributeSequence::Handle_TDF_SequenceNodeOfAttributeSequence %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_TDF_SequenceNodeOfAttributeSequence;
class Handle_TDF_SequenceNodeOfAttributeSequence : public Handle_TCollection_SeqNode {

    public:
        // constructors
        Handle_TDF_SequenceNodeOfAttributeSequence();
        Handle_TDF_SequenceNodeOfAttributeSequence(const Handle_TDF_SequenceNodeOfAttributeSequence &aHandle);
        Handle_TDF_SequenceNodeOfAttributeSequence(const TDF_SequenceNodeOfAttributeSequence *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_TDF_SequenceNodeOfAttributeSequence DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_TDF_SequenceNodeOfAttributeSequence {
    TDF_SequenceNodeOfAttributeSequence* _get_reference() {
    return (TDF_SequenceNodeOfAttributeSequence*)$self->Access();
    }
};

%extend Handle_TDF_SequenceNodeOfAttributeSequence {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend TDF_SequenceNodeOfAttributeSequence {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TDF_SequenceNodeOfLabelSequence;
class TDF_SequenceNodeOfLabelSequence : public TCollection_SeqNode {
	public:
		%feature("compactdefaultargs") TDF_SequenceNodeOfLabelSequence;
		%feature("autodoc", "	:param I:
	:type I: TDF_Label &
	:param n:
	:type n: TCollection_SeqNodePtr &
	:param p:
	:type p: TCollection_SeqNodePtr &
	:rtype: None
") TDF_SequenceNodeOfLabelSequence;
		 TDF_SequenceNodeOfLabelSequence (const TDF_Label & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: TDF_Label
") Value;
		TDF_Label & Value ();
};


%extend TDF_SequenceNodeOfLabelSequence {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_TDF_SequenceNodeOfLabelSequence(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_TDF_SequenceNodeOfLabelSequence::Handle_TDF_SequenceNodeOfLabelSequence %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_TDF_SequenceNodeOfLabelSequence;
class Handle_TDF_SequenceNodeOfLabelSequence : public Handle_TCollection_SeqNode {

    public:
        // constructors
        Handle_TDF_SequenceNodeOfLabelSequence();
        Handle_TDF_SequenceNodeOfLabelSequence(const Handle_TDF_SequenceNodeOfLabelSequence &aHandle);
        Handle_TDF_SequenceNodeOfLabelSequence(const TDF_SequenceNodeOfLabelSequence *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_TDF_SequenceNodeOfLabelSequence DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_TDF_SequenceNodeOfLabelSequence {
    TDF_SequenceNodeOfLabelSequence* _get_reference() {
    return (TDF_SequenceNodeOfLabelSequence*)$self->Access();
    }
};

%extend Handle_TDF_SequenceNodeOfLabelSequence {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend TDF_SequenceNodeOfLabelSequence {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TDF_StdMapNodeOfAttributeMap;
class TDF_StdMapNodeOfAttributeMap : public TCollection_MapNode {
	public:
		%feature("compactdefaultargs") TDF_StdMapNodeOfAttributeMap;
		%feature("autodoc", "	:param K:
	:type K: Handle_TDF_Attribute &
	:param n:
	:type n: TCollection_MapNodePtr &
	:rtype: None
") TDF_StdMapNodeOfAttributeMap;
		 TDF_StdMapNodeOfAttributeMap (const Handle_TDF_Attribute & K,const TCollection_MapNodePtr & n);
		%feature("compactdefaultargs") Key;
		%feature("autodoc", "	:rtype: Handle_TDF_Attribute
") Key;
		Handle_TDF_Attribute Key ();
};


%extend TDF_StdMapNodeOfAttributeMap {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_TDF_StdMapNodeOfAttributeMap(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_TDF_StdMapNodeOfAttributeMap::Handle_TDF_StdMapNodeOfAttributeMap %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_TDF_StdMapNodeOfAttributeMap;
class Handle_TDF_StdMapNodeOfAttributeMap : public Handle_TCollection_MapNode {

    public:
        // constructors
        Handle_TDF_StdMapNodeOfAttributeMap();
        Handle_TDF_StdMapNodeOfAttributeMap(const Handle_TDF_StdMapNodeOfAttributeMap &aHandle);
        Handle_TDF_StdMapNodeOfAttributeMap(const TDF_StdMapNodeOfAttributeMap *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_TDF_StdMapNodeOfAttributeMap DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_TDF_StdMapNodeOfAttributeMap {
    TDF_StdMapNodeOfAttributeMap* _get_reference() {
    return (TDF_StdMapNodeOfAttributeMap*)$self->Access();
    }
};

%extend Handle_TDF_StdMapNodeOfAttributeMap {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend TDF_StdMapNodeOfAttributeMap {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TDF_StdMapNodeOfIDMap;
class TDF_StdMapNodeOfIDMap : public TCollection_MapNode {
	public:
		%feature("compactdefaultargs") TDF_StdMapNodeOfIDMap;
		%feature("autodoc", "	:param K:
	:type K: Standard_GUID &
	:param n:
	:type n: TCollection_MapNodePtr &
	:rtype: None
") TDF_StdMapNodeOfIDMap;
		 TDF_StdMapNodeOfIDMap (const Standard_GUID & K,const TCollection_MapNodePtr & n);
		%feature("compactdefaultargs") Key;
		%feature("autodoc", "	:rtype: Standard_GUID
") Key;
		Standard_GUID & Key ();
};


%extend TDF_StdMapNodeOfIDMap {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_TDF_StdMapNodeOfIDMap(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_TDF_StdMapNodeOfIDMap::Handle_TDF_StdMapNodeOfIDMap %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_TDF_StdMapNodeOfIDMap;
class Handle_TDF_StdMapNodeOfIDMap : public Handle_TCollection_MapNode {

    public:
        // constructors
        Handle_TDF_StdMapNodeOfIDMap();
        Handle_TDF_StdMapNodeOfIDMap(const Handle_TDF_StdMapNodeOfIDMap &aHandle);
        Handle_TDF_StdMapNodeOfIDMap(const TDF_StdMapNodeOfIDMap *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_TDF_StdMapNodeOfIDMap DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_TDF_StdMapNodeOfIDMap {
    TDF_StdMapNodeOfIDMap* _get_reference() {
    return (TDF_StdMapNodeOfIDMap*)$self->Access();
    }
};

%extend Handle_TDF_StdMapNodeOfIDMap {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend TDF_StdMapNodeOfIDMap {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TDF_StdMapNodeOfLabelMap;
class TDF_StdMapNodeOfLabelMap : public TCollection_MapNode {
	public:
		%feature("compactdefaultargs") TDF_StdMapNodeOfLabelMap;
		%feature("autodoc", "	:param K:
	:type K: TDF_Label &
	:param n:
	:type n: TCollection_MapNodePtr &
	:rtype: None
") TDF_StdMapNodeOfLabelMap;
		 TDF_StdMapNodeOfLabelMap (const TDF_Label & K,const TCollection_MapNodePtr & n);
		%feature("compactdefaultargs") Key;
		%feature("autodoc", "	:rtype: TDF_Label
") Key;
		TDF_Label & Key ();
};


%extend TDF_StdMapNodeOfLabelMap {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_TDF_StdMapNodeOfLabelMap(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_TDF_StdMapNodeOfLabelMap::Handle_TDF_StdMapNodeOfLabelMap %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_TDF_StdMapNodeOfLabelMap;
class Handle_TDF_StdMapNodeOfLabelMap : public Handle_TCollection_MapNode {

    public:
        // constructors
        Handle_TDF_StdMapNodeOfLabelMap();
        Handle_TDF_StdMapNodeOfLabelMap(const Handle_TDF_StdMapNodeOfLabelMap &aHandle);
        Handle_TDF_StdMapNodeOfLabelMap(const TDF_StdMapNodeOfLabelMap *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_TDF_StdMapNodeOfLabelMap DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_TDF_StdMapNodeOfLabelMap {
    TDF_StdMapNodeOfLabelMap* _get_reference() {
    return (TDF_StdMapNodeOfLabelMap*)$self->Access();
    }
};

%extend Handle_TDF_StdMapNodeOfLabelMap {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend TDF_StdMapNodeOfLabelMap {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
class TDF_Tool {
	public:
		%feature("compactdefaultargs") NbLabels;
		%feature("autodoc", "	* Returns the number of labels of the tree, including <aLabel>. aLabel is also included in this figure. This information is useful in setting the size of an array.

	:param aLabel:
	:type aLabel: TDF_Label &
	:rtype: int
") NbLabels;
		static Standard_Integer NbLabels (const TDF_Label & aLabel);
		%feature("compactdefaultargs") NbAttributes;
		%feature("autodoc", "	* Returns the total number of attributes attached to the labels dependent on the label aLabel. The attributes of aLabel are also included in this figure. This information is useful in setting the size of an array.

	:param aLabel:
	:type aLabel: TDF_Label &
	:rtype: int
") NbAttributes;
		static Standard_Integer NbAttributes (const TDF_Label & aLabel);
		%feature("compactdefaultargs") NbAttributes;
		%feature("autodoc", "	* Returns the number of attributes of the tree, selected by a<Filter>, including those of <aLabel>.

	:param aLabel:
	:type aLabel: TDF_Label &
	:param aFilter:
	:type aFilter: TDF_IDFilter &
	:rtype: int
") NbAttributes;
		static Standard_Integer NbAttributes (const TDF_Label & aLabel,const TDF_IDFilter & aFilter);
		%feature("compactdefaultargs") IsSelfContained;
		%feature("autodoc", "	* Returns true if <aLabel> and its descendants reference only attributes or labels attached to themselves.

	:param aLabel:
	:type aLabel: TDF_Label &
	:rtype: bool
") IsSelfContained;
		static Standard_Boolean IsSelfContained (const TDF_Label & aLabel);
		%feature("compactdefaultargs") IsSelfContained;
		%feature("autodoc", "	* Returns true if <aLabel> and its descendants reference only attributes or labels attached to themselves and kept by <aFilter>.

	:param aLabel:
	:type aLabel: TDF_Label &
	:param aFilter:
	:type aFilter: TDF_IDFilter &
	:rtype: bool
") IsSelfContained;
		static Standard_Boolean IsSelfContained (const TDF_Label & aLabel,const TDF_IDFilter & aFilter);
		%feature("compactdefaultargs") OutReferers;
		%feature("autodoc", "	* Returns in <theAtts> the attributes having out references. //! Caution: <theAtts> is not cleared before use!

	:param theLabel:
	:type theLabel: TDF_Label &
	:param theAtts:
	:type theAtts: TDF_AttributeMap &
	:rtype: void
") OutReferers;
		static void OutReferers (const TDF_Label & theLabel,TDF_AttributeMap & theAtts);
		%feature("compactdefaultargs") OutReferers;
		%feature("autodoc", "	* Returns in <atts> the attributes having out references and kept by <aFilterForReferers>. It considers only the references kept by <aFilterForReferences>. Caution: <atts> is not cleared before use!

	:param aLabel:
	:type aLabel: TDF_Label &
	:param aFilterForReferers:
	:type aFilterForReferers: TDF_IDFilter &
	:param aFilterForReferences:
	:type aFilterForReferences: TDF_IDFilter &
	:param atts:
	:type atts: TDF_AttributeMap &
	:rtype: void
") OutReferers;
		static void OutReferers (const TDF_Label & aLabel,const TDF_IDFilter & aFilterForReferers,const TDF_IDFilter & aFilterForReferences,TDF_AttributeMap & atts);
		%feature("compactdefaultargs") OutReferences;
		%feature("autodoc", "	* Returns in <atts> the referenced attributes. Caution: <atts> is not cleared before use!

	:param aLabel:
	:type aLabel: TDF_Label &
	:param atts:
	:type atts: TDF_AttributeMap &
	:rtype: void
") OutReferences;
		static void OutReferences (const TDF_Label & aLabel,TDF_AttributeMap & atts);
		%feature("compactdefaultargs") OutReferences;
		%feature("autodoc", "	* Returns in <atts> the referenced attributes and kept by <aFilterForReferences>. It considers only the referers kept by <aFilterForReferers>. Caution: <atts> is not cleared before use!

	:param aLabel:
	:type aLabel: TDF_Label &
	:param aFilterForReferers:
	:type aFilterForReferers: TDF_IDFilter &
	:param aFilterForReferences:
	:type aFilterForReferences: TDF_IDFilter &
	:param atts:
	:type atts: TDF_AttributeMap &
	:rtype: void
") OutReferences;
		static void OutReferences (const TDF_Label & aLabel,const TDF_IDFilter & aFilterForReferers,const TDF_IDFilter & aFilterForReferences,TDF_AttributeMap & atts);
		%feature("compactdefaultargs") RelocateLabel;
		%feature("autodoc", "	* Returns the label having the same sub-entry as <aLabel> but located as descendant as <toRoot> instead of <fromRoot>. //! Exemple : //! aLabel = 0:3:24:7:2:7 fromRoot = 0:3:24 toRoot = 0:5 returned label = 0:5:7:2:7

	:param aSourceLabel:
	:type aSourceLabel: TDF_Label &
	:param fromRoot:
	:type fromRoot: TDF_Label &
	:param toRoot:
	:type toRoot: TDF_Label &
	:param aTargetLabel:
	:type aTargetLabel: TDF_Label &
	:param create: default value is Standard_False
	:type create: bool
	:rtype: void
") RelocateLabel;
		static void RelocateLabel (const TDF_Label & aSourceLabel,const TDF_Label & fromRoot,const TDF_Label & toRoot,TDF_Label & aTargetLabel,const Standard_Boolean create = Standard_False);
		%feature("compactdefaultargs") Entry;
		%feature("autodoc", "	* Returns the entry for the label aLabel in the form of the ASCII character string anEntry containing the tag list for aLabel.

	:param aLabel:
	:type aLabel: TDF_Label &
	:param anEntry:
	:type anEntry: TCollection_AsciiString &
	:rtype: void
") Entry;
		static void Entry (const TDF_Label & aLabel,TCollection_AsciiString & anEntry);
		%feature("compactdefaultargs") TagList;
		%feature("autodoc", "	* Returns the entry of <aLabel> as list of integers in <aTagList>.

	:param aLabel:
	:type aLabel: TDF_Label &
	:param aTagList:
	:type aTagList: TColStd_ListOfInteger &
	:rtype: void
") TagList;
		static void TagList (const TDF_Label & aLabel,TColStd_ListOfInteger & aTagList);
		%feature("compactdefaultargs") TagList;
		%feature("autodoc", "	* Returns the entry expressed by <anEntry> as list of integers in <aTagList>.

	:param anEntry:
	:type anEntry: TCollection_AsciiString &
	:param aTagList:
	:type aTagList: TColStd_ListOfInteger &
	:rtype: void
") TagList;
		static void TagList (const TCollection_AsciiString & anEntry,TColStd_ListOfInteger & aTagList);
		%feature("compactdefaultargs") Label;
		%feature("autodoc", "	* Returns the label expressed by <anEntry>; creates the label if it does not exist and if <create> is true.

	:param aDF:
	:type aDF: Handle_TDF_Data &
	:param anEntry:
	:type anEntry: TCollection_AsciiString &
	:param aLabel:
	:type aLabel: TDF_Label &
	:param create: default value is Standard_False
	:type create: bool
	:rtype: void
") Label;
		static void Label (const Handle_TDF_Data & aDF,const TCollection_AsciiString & anEntry,TDF_Label & aLabel,const Standard_Boolean create = Standard_False);
		%feature("compactdefaultargs") Label;
		%feature("autodoc", "	* Returns the label expressed by <anEntry>; creates the label if it does not exist and if <create> is true.

	:param aDF:
	:type aDF: Handle_TDF_Data &
	:param anEntry:
	:type anEntry: char *
	:param aLabel:
	:type aLabel: TDF_Label &
	:param create: default value is Standard_False
	:type create: bool
	:rtype: void
") Label;
		static void Label (const Handle_TDF_Data & aDF,const char * anEntry,TDF_Label & aLabel,const Standard_Boolean create = Standard_False);
		%feature("compactdefaultargs") Label;
		%feature("autodoc", "	* Returns the label expressed by <anEntry>; creates the label if it does not exist and if <create> is true.

	:param aDF:
	:type aDF: Handle_TDF_Data &
	:param aTagList:
	:type aTagList: TColStd_ListOfInteger &
	:param aLabel:
	:type aLabel: TDF_Label &
	:param create: default value is Standard_False
	:type create: bool
	:rtype: void
") Label;
		static void Label (const Handle_TDF_Data & aDF,const TColStd_ListOfInteger & aTagList,TDF_Label & aLabel,const Standard_Boolean create = Standard_False);
		%feature("compactdefaultargs") CountLabels;
		%feature("autodoc", "	* Adds the labels of <aLabelList> to <aLabelMap> if they are unbound, or increases their reference counters. At the end of the process, <aLabelList> contains only the ADDED labels.

	:param aLabelList:
	:type aLabelList: TDF_LabelList &
	:param aLabelMap:
	:type aLabelMap: TDF_LabelIntegerMap &
	:rtype: void
") CountLabels;
		static void CountLabels (TDF_LabelList & aLabelList,TDF_LabelIntegerMap & aLabelMap);
		%feature("compactdefaultargs") DeductLabels;
		%feature("autodoc", "	* Decreases the reference counters of the labels of <aLabelList> to <aLabelMap>, and removes labels with null counter. At the end of the process, <aLabelList> contains only the SUPPRESSED labels.

	:param aLabelList:
	:type aLabelList: TDF_LabelList &
	:param aLabelMap:
	:type aLabelMap: TDF_LabelIntegerMap &
	:rtype: void
") DeductLabels;
		static void DeductLabels (TDF_LabelList & aLabelList,TDF_LabelIntegerMap & aLabelMap);
		%feature("compactdefaultargs") DeepDump;
		%feature("autodoc", "	* Dumps <aDF> and its labels and their attributes.

	:param anOS:
	:type anOS: Standard_OStream &
	:param aDF:
	:type aDF: Handle_TDF_Data &
	:rtype: void
") DeepDump;
		static void DeepDump (Standard_OStream & anOS,const Handle_TDF_Data & aDF);
		%feature("compactdefaultargs") ExtendedDeepDump;
		%feature("autodoc", "	* Dumps <aDF> and its labels and their attributes, if their IDs are kept by <aFilter>. Dumps also the attributes content.

	:param anOS:
	:type anOS: Standard_OStream &
	:param aDF:
	:type aDF: Handle_TDF_Data &
	:param aFilter:
	:type aFilter: TDF_IDFilter &
	:rtype: void
") ExtendedDeepDump;
		static void ExtendedDeepDump (Standard_OStream & anOS,const Handle_TDF_Data & aDF,const TDF_IDFilter & aFilter);
		%feature("compactdefaultargs") DeepDump;
		%feature("autodoc", "	* Dumps <aLabel>, its chilren and their attributes.

	:param anOS:
	:type anOS: Standard_OStream &
	:param aLabel:
	:type aLabel: TDF_Label &
	:rtype: void
") DeepDump;
		static void DeepDump (Standard_OStream & anOS,const TDF_Label & aLabel);
		%feature("compactdefaultargs") ExtendedDeepDump;
		%feature("autodoc", "	* Dumps <aLabel>, its chilren and their attributes, if their IDs are kept by <aFilter>. Dumps also the attributes content.

	:param anOS:
	:type anOS: Standard_OStream &
	:param aLabel:
	:type aLabel: TDF_Label &
	:param aFilter:
	:type aFilter: TDF_IDFilter &
	:rtype: void
") ExtendedDeepDump;
		static void ExtendedDeepDump (Standard_OStream & anOS,const TDF_Label & aLabel,const TDF_IDFilter & aFilter);
};


%extend TDF_Tool {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TDF_Transaction;
class TDF_Transaction {
	public:
		%feature("compactdefaultargs") TDF_Transaction;
		%feature("autodoc", "	* Creates an empty transaction context, unable to be opened.

	:param aName: default value is ""
	:type aName: TCollection_AsciiString &
	:rtype: None
") TDF_Transaction;
		 TDF_Transaction (const TCollection_AsciiString & aName = "");
		%feature("compactdefaultargs") TDF_Transaction;
		%feature("autodoc", "	* Creates a transaction context on <aDF>, ready to be opened.

	:param aDF:
	:type aDF: Handle_TDF_Data &
	:param aName: default value is ""
	:type aName: TCollection_AsciiString &
	:rtype: None
") TDF_Transaction;
		 TDF_Transaction (const Handle_TDF_Data & aDF,const TCollection_AsciiString & aName = "");
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "	* Aborts all the transactions on <myDF> and sets <aDF> to build a transaction context on <aDF>, ready to be opened.

	:param aDF:
	:type aDF: Handle_TDF_Data &
	:rtype: None
") Initialize;
		void Initialize (const Handle_TDF_Data & aDF);
		%feature("compactdefaultargs") Open;
		%feature("autodoc", "	* If not yet done, opens a new transaction on <myDF>. Returns the index of the just opened transaction. //! It raises DomainError if the transaction is already open, and NullObject if there is no current Data framework.

	:rtype: int
") Open;
		Standard_Integer Open ();
		%feature("compactdefaultargs") Commit;
		%feature("autodoc", "	* Commits the transactions until AND including the current opened one.

	:param withDelta: default value is Standard_False
	:type withDelta: bool
	:rtype: Handle_TDF_Delta
") Commit;
		Handle_TDF_Delta Commit (const Standard_Boolean withDelta = Standard_False);
		%feature("compactdefaultargs") Abort;
		%feature("autodoc", "	* Aborts the transactions until AND including the current opened one.

	:rtype: None
") Abort;
		void Abort ();
		%feature("compactdefaultargs") Data;
		%feature("autodoc", "	* Returns the Data from TDF.

	:rtype: Handle_TDF_Data
") Data;
		Handle_TDF_Data Data ();
		%feature("compactdefaultargs") Transaction;
		%feature("autodoc", "	* Returns the number of the transaction opened by <self>.

	:rtype: int
") Transaction;
		Standard_Integer Transaction ();
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "	* Returns the transaction name.

	:rtype: TCollection_AsciiString
") Name;
		const TCollection_AsciiString & Name ();
		%feature("compactdefaultargs") IsOpen;
		%feature("autodoc", "	* Returns true if the transaction is open.

	:rtype: bool
") IsOpen;
		Standard_Boolean IsOpen ();
};


%extend TDF_Transaction {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TDF_DeltaOnAddition;
class TDF_DeltaOnAddition : public TDF_AttributeDelta {
	public:
		%feature("compactdefaultargs") TDF_DeltaOnAddition;
		%feature("autodoc", "	* Creates a TDF_DeltaOnAddition.

	:param anAtt:
	:type anAtt: Handle_TDF_Attribute &
	:rtype: None
") TDF_DeltaOnAddition;
		 TDF_DeltaOnAddition (const Handle_TDF_Attribute & anAtt);
		%feature("compactdefaultargs") Apply;
		%feature("autodoc", "	* Applies the delta to the attribute.

	:rtype: None
") Apply;
		void Apply ();
};


%extend TDF_DeltaOnAddition {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_TDF_DeltaOnAddition(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_TDF_DeltaOnAddition::Handle_TDF_DeltaOnAddition %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_TDF_DeltaOnAddition;
class Handle_TDF_DeltaOnAddition : public Handle_TDF_AttributeDelta {

    public:
        // constructors
        Handle_TDF_DeltaOnAddition();
        Handle_TDF_DeltaOnAddition(const Handle_TDF_DeltaOnAddition &aHandle);
        Handle_TDF_DeltaOnAddition(const TDF_DeltaOnAddition *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_TDF_DeltaOnAddition DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_TDF_DeltaOnAddition {
    TDF_DeltaOnAddition* _get_reference() {
    return (TDF_DeltaOnAddition*)$self->Access();
    }
};

%extend Handle_TDF_DeltaOnAddition {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend TDF_DeltaOnAddition {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TDF_DeltaOnForget;
class TDF_DeltaOnForget : public TDF_AttributeDelta {
	public:
		%feature("compactdefaultargs") TDF_DeltaOnForget;
		%feature("autodoc", "	* Creates a TDF_DeltaOnForget.

	:param anAtt:
	:type anAtt: Handle_TDF_Attribute &
	:rtype: None
") TDF_DeltaOnForget;
		 TDF_DeltaOnForget (const Handle_TDF_Attribute & anAtt);
		%feature("compactdefaultargs") Apply;
		%feature("autodoc", "	* Applies the delta to the attribute.

	:rtype: None
") Apply;
		void Apply ();
};


%extend TDF_DeltaOnForget {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_TDF_DeltaOnForget(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_TDF_DeltaOnForget::Handle_TDF_DeltaOnForget %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_TDF_DeltaOnForget;
class Handle_TDF_DeltaOnForget : public Handle_TDF_AttributeDelta {

    public:
        // constructors
        Handle_TDF_DeltaOnForget();
        Handle_TDF_DeltaOnForget(const Handle_TDF_DeltaOnForget &aHandle);
        Handle_TDF_DeltaOnForget(const TDF_DeltaOnForget *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_TDF_DeltaOnForget DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_TDF_DeltaOnForget {
    TDF_DeltaOnForget* _get_reference() {
    return (TDF_DeltaOnForget*)$self->Access();
    }
};

%extend Handle_TDF_DeltaOnForget {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend TDF_DeltaOnForget {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TDF_DeltaOnModification;
class TDF_DeltaOnModification : public TDF_AttributeDelta {
	public:
		%feature("compactdefaultargs") Apply;
		%feature("autodoc", "	* Applies the delta to the attribute.

	:rtype: void
") Apply;
		virtual void Apply ();
};


%extend TDF_DeltaOnModification {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_TDF_DeltaOnModification(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_TDF_DeltaOnModification::Handle_TDF_DeltaOnModification %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_TDF_DeltaOnModification;
class Handle_TDF_DeltaOnModification : public Handle_TDF_AttributeDelta {

    public:
        // constructors
        Handle_TDF_DeltaOnModification();
        Handle_TDF_DeltaOnModification(const Handle_TDF_DeltaOnModification &aHandle);
        Handle_TDF_DeltaOnModification(const TDF_DeltaOnModification *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_TDF_DeltaOnModification DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_TDF_DeltaOnModification {
    TDF_DeltaOnModification* _get_reference() {
    return (TDF_DeltaOnModification*)$self->Access();
    }
};

%extend Handle_TDF_DeltaOnModification {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend TDF_DeltaOnModification {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TDF_DeltaOnRemoval;
class TDF_DeltaOnRemoval : public TDF_AttributeDelta {
	public:
};


%extend TDF_DeltaOnRemoval {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_TDF_DeltaOnRemoval(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_TDF_DeltaOnRemoval::Handle_TDF_DeltaOnRemoval %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_TDF_DeltaOnRemoval;
class Handle_TDF_DeltaOnRemoval : public Handle_TDF_AttributeDelta {

    public:
        // constructors
        Handle_TDF_DeltaOnRemoval();
        Handle_TDF_DeltaOnRemoval(const Handle_TDF_DeltaOnRemoval &aHandle);
        Handle_TDF_DeltaOnRemoval(const TDF_DeltaOnRemoval *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_TDF_DeltaOnRemoval DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_TDF_DeltaOnRemoval {
    TDF_DeltaOnRemoval* _get_reference() {
    return (TDF_DeltaOnRemoval*)$self->Access();
    }
};

%extend Handle_TDF_DeltaOnRemoval {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend TDF_DeltaOnRemoval {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TDF_DeltaOnResume;
class TDF_DeltaOnResume : public TDF_AttributeDelta {
	public:
		%feature("compactdefaultargs") TDF_DeltaOnResume;
		%feature("autodoc", "	* Creates a TDF_DeltaOnResume.

	:param anAtt:
	:type anAtt: Handle_TDF_Attribute &
	:rtype: None
") TDF_DeltaOnResume;
		 TDF_DeltaOnResume (const Handle_TDF_Attribute & anAtt);
		%feature("compactdefaultargs") Apply;
		%feature("autodoc", "	* Applies the delta to the attribute.

	:rtype: None
") Apply;
		void Apply ();
};


%extend TDF_DeltaOnResume {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_TDF_DeltaOnResume(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_TDF_DeltaOnResume::Handle_TDF_DeltaOnResume %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_TDF_DeltaOnResume;
class Handle_TDF_DeltaOnResume : public Handle_TDF_AttributeDelta {

    public:
        // constructors
        Handle_TDF_DeltaOnResume();
        Handle_TDF_DeltaOnResume(const Handle_TDF_DeltaOnResume &aHandle);
        Handle_TDF_DeltaOnResume(const TDF_DeltaOnResume *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_TDF_DeltaOnResume DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_TDF_DeltaOnResume {
    TDF_DeltaOnResume* _get_reference() {
    return (TDF_DeltaOnResume*)$self->Access();
    }
};

%extend Handle_TDF_DeltaOnResume {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend TDF_DeltaOnResume {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TDF_Reference;
class TDF_Reference : public TDF_Attribute {
	public:
		%feature("compactdefaultargs") GetID;
		%feature("autodoc", "	:rtype: Standard_GUID
") GetID;
		static const Standard_GUID & GetID ();
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "	:param I:
	:type I: TDF_Label &
	:param Origin:
	:type Origin: TDF_Label &
	:rtype: Handle_TDF_Reference
") Set;
		static Handle_TDF_Reference Set (const TDF_Label & I,const TDF_Label & Origin);
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "	:param Origin:
	:type Origin: TDF_Label &
	:rtype: None
") Set;
		void Set (const TDF_Label & Origin);
		%feature("compactdefaultargs") Get;
		%feature("autodoc", "	:rtype: TDF_Label
") Get;
		TDF_Label Get ();
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
        		%feature("compactdefaultargs") TDF_Reference;
		%feature("autodoc", "	:rtype: None
") TDF_Reference;
		 TDF_Reference ();
};


%extend TDF_Reference {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_TDF_Reference(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_TDF_Reference::Handle_TDF_Reference %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_TDF_Reference;
class Handle_TDF_Reference : public Handle_TDF_Attribute {

    public:
        // constructors
        Handle_TDF_Reference();
        Handle_TDF_Reference(const Handle_TDF_Reference &aHandle);
        Handle_TDF_Reference(const TDF_Reference *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_TDF_Reference DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_TDF_Reference {
    TDF_Reference* _get_reference() {
    return (TDF_Reference*)$self->Access();
    }
};

%extend Handle_TDF_Reference {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend TDF_Reference {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TDF_TagSource;
class TDF_TagSource : public TDF_Attribute {
	public:
		%feature("compactdefaultargs") GetID;
		%feature("autodoc", "	* class methods =============

	:rtype: Standard_GUID
") GetID;
		static const Standard_GUID & GetID ();
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "	* Find, or create, a TagSource attribute. the TagSource attribute is returned.

	:param label:
	:type label: TDF_Label &
	:rtype: Handle_TDF_TagSource
") Set;
		static Handle_TDF_TagSource Set (const TDF_Label & label);
		%feature("compactdefaultargs") NewChild;
		%feature("autodoc", "	* Find (or create) a tagSource attribute located at <L> and make a new child label. TagSource methods =================

	:param L:
	:type L: TDF_Label &
	:rtype: TDF_Label
") NewChild;
		static TDF_Label NewChild (const TDF_Label & L);
		%feature("compactdefaultargs") TDF_TagSource;
		%feature("autodoc", "	:rtype: None
") TDF_TagSource;
		 TDF_TagSource ();
		%feature("compactdefaultargs") NewTag;
		%feature("autodoc", "	:rtype: int
") NewTag;
		Standard_Integer NewTag ();
		%feature("compactdefaultargs") NewChild;
		%feature("autodoc", "	:rtype: TDF_Label
") NewChild;
		TDF_Label NewChild ();
		%feature("compactdefaultargs") Get;
		%feature("autodoc", "	:rtype: int
") Get;
		Standard_Integer Get ();
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "	* TDF_Attribute methods =====================

	:param T:
	:type T: int
	:rtype: None
") Set;
		void Set (const Standard_Integer T);
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
		%feature("autodoc", "	:param Into:
	:type Into: Handle_TDF_Attribute &
	:param RT:
	:type RT: Handle_TDF_RelocationTable &
	:rtype: None
") Paste;
		void Paste (const Handle_TDF_Attribute & Into,const Handle_TDF_RelocationTable & RT);
};


%extend TDF_TagSource {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_TDF_TagSource(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_TDF_TagSource::Handle_TDF_TagSource %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_TDF_TagSource;
class Handle_TDF_TagSource : public Handle_TDF_Attribute {

    public:
        // constructors
        Handle_TDF_TagSource();
        Handle_TDF_TagSource(const Handle_TDF_TagSource &aHandle);
        Handle_TDF_TagSource(const TDF_TagSource *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_TDF_TagSource DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_TDF_TagSource {
    TDF_TagSource* _get_reference() {
    return (TDF_TagSource*)$self->Access();
    }
};

%extend Handle_TDF_TagSource {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend TDF_TagSource {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TDF_DefaultDeltaOnModification;
class TDF_DefaultDeltaOnModification : public TDF_DeltaOnModification {
	public:
		%feature("compactdefaultargs") TDF_DefaultDeltaOnModification;
		%feature("autodoc", "	* Creates a TDF_DefaultDeltaOnModification. <anAttribute> must be the backup copy.

	:param anAttribute:
	:type anAttribute: Handle_TDF_Attribute &
	:rtype: None
") TDF_DefaultDeltaOnModification;
		 TDF_DefaultDeltaOnModification (const Handle_TDF_Attribute & anAttribute);
		%feature("compactdefaultargs") Apply;
		%feature("autodoc", "	* Applies the delta to the attribute.

	:rtype: void
") Apply;
		virtual void Apply ();
};


%extend TDF_DefaultDeltaOnModification {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_TDF_DefaultDeltaOnModification(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_TDF_DefaultDeltaOnModification::Handle_TDF_DefaultDeltaOnModification %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_TDF_DefaultDeltaOnModification;
class Handle_TDF_DefaultDeltaOnModification : public Handle_TDF_DeltaOnModification {

    public:
        // constructors
        Handle_TDF_DefaultDeltaOnModification();
        Handle_TDF_DefaultDeltaOnModification(const Handle_TDF_DefaultDeltaOnModification &aHandle);
        Handle_TDF_DefaultDeltaOnModification(const TDF_DefaultDeltaOnModification *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_TDF_DefaultDeltaOnModification DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_TDF_DefaultDeltaOnModification {
    TDF_DefaultDeltaOnModification* _get_reference() {
    return (TDF_DefaultDeltaOnModification*)$self->Access();
    }
};

%extend Handle_TDF_DefaultDeltaOnModification {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend TDF_DefaultDeltaOnModification {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TDF_DefaultDeltaOnRemoval;
class TDF_DefaultDeltaOnRemoval : public TDF_DeltaOnRemoval {
	public:
		%feature("compactdefaultargs") TDF_DefaultDeltaOnRemoval;
		%feature("autodoc", "	* Creates a TDF_DefaultDeltaOnRemoval.

	:param anAttribute:
	:type anAttribute: Handle_TDF_Attribute &
	:rtype: None
") TDF_DefaultDeltaOnRemoval;
		 TDF_DefaultDeltaOnRemoval (const Handle_TDF_Attribute & anAttribute);
		%feature("compactdefaultargs") Apply;
		%feature("autodoc", "	* Applies the delta to the attribute.

	:rtype: void
") Apply;
		virtual void Apply ();
};


%extend TDF_DefaultDeltaOnRemoval {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_TDF_DefaultDeltaOnRemoval(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_TDF_DefaultDeltaOnRemoval::Handle_TDF_DefaultDeltaOnRemoval %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_TDF_DefaultDeltaOnRemoval;
class Handle_TDF_DefaultDeltaOnRemoval : public Handle_TDF_DeltaOnRemoval {

    public:
        // constructors
        Handle_TDF_DefaultDeltaOnRemoval();
        Handle_TDF_DefaultDeltaOnRemoval(const Handle_TDF_DefaultDeltaOnRemoval &aHandle);
        Handle_TDF_DefaultDeltaOnRemoval(const TDF_DefaultDeltaOnRemoval *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_TDF_DefaultDeltaOnRemoval DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_TDF_DefaultDeltaOnRemoval {
    TDF_DefaultDeltaOnRemoval* _get_reference() {
    return (TDF_DefaultDeltaOnRemoval*)$self->Access();
    }
};

%extend Handle_TDF_DefaultDeltaOnRemoval {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend TDF_DefaultDeltaOnRemoval {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
