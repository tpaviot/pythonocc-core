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
%module (package="OCC") TDocStd

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


%include TDocStd_headers.i


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
typedef TDocStd_XLink * TDocStd_XLinkPtr;
/* end typedefs declaration */

/* public enums */
/* end public enums declaration */

%rename(tdocstd) TDocStd;
class TDocStd {
	public:
		%feature("compactdefaultargs") IDList;
		%feature("autodoc", "	* specific GUID of this package ============================= Appends to <anIDList> the list of the attributes IDs of this package. CAUTION: <anIDList> is NOT cleared before use.

	:param anIDList:
	:type anIDList: TDF_IDList &
	:rtype: void
") IDList;
		static void IDList (TDF_IDList & anIDList);
};


%extend TDocStd {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TDocStd_Application;
class TDocStd_Application : public CDF_Application {
	public:
		%feature("compactdefaultargs") IsDriverLoaded;
		%feature("autodoc", "	* Check if meta data driver was successfully loaded by the application constructor

	:rtype: bool
") IsDriverLoaded;
		Standard_Boolean IsDriverLoaded ();
		%feature("compactdefaultargs") Resources;
		%feature("autodoc", "	* create (if not done) a Manager using ResourcesName method.

	:rtype: Handle_Resource_Manager
") Resources;
		virtual Handle_Resource_Manager Resources ();
		%feature("compactdefaultargs") ResourcesName;
		%feature("autodoc", "	* Returns the name of the file containing the resources of this application. In a resource file, the application associates the schema name of the document with the storage and retrieval plug-ins that are to be loaded for each document. On retrieval, the application reads the schema name in the heading of the CSF file and loads the plug-in indicated in the resource file. This plug-in instantiates the actual driver for transient-persistent conversion. Your application can bring this process into play by defining a class which inherits CDF_Application and redefines the function which returns the appropriate resources file. At this point, the function Retrieve and the class CDF_Store can be called. This allows you to deal with storage and retrieval of - as well as copying and pasting - documents. To implement a class like this, several virtual functions should be redefined. In particular, you must redefine the abstract function Resources inherited from the superclass CDM_Application.

	:rtype: char *
") ResourcesName;
		virtual const char * ResourcesName ();
		%feature("compactdefaultargs") NbDocuments;
		%feature("autodoc", "	* returns the number of documents handled by the current applicative session.

	:rtype: int
") NbDocuments;
		Standard_Integer NbDocuments ();
		%feature("compactdefaultargs") GetDocument;
		%feature("autodoc", "	* Constructs the new document aDoc. aDoc is identified by the index index which is any integer between 1 and n where n is the number of documents returned by NbDocument. Example Handle_TDocStd_Application anApp; if (!CafTest::Find(A)) return 1; Handle_TDocStd aDoc; Standard_Integer nbdoc = anApp->NbDocuments(); for (Standard_Integer i = 1; i <= nbdoc; i++) { aApp->GetDocument(i,aDoc);

	:param index:
	:type index: int
	:param aDoc:
	:type aDoc: Handle_TDocStd_Document &
	:rtype: None
") GetDocument;
		void GetDocument (const Standard_Integer index,Handle_TDocStd_Document & aDoc);
		%feature("compactdefaultargs") Formats;
		%feature("autodoc", "	* Returns the format name Formats representing the format supported for application documents. This virtual function is to be redefined for each specific application.

	:param Formats:
	:type Formats: TColStd_SequenceOfExtendedString &
	:rtype: void
") Formats;
		virtual void Formats (TColStd_SequenceOfExtendedString & Formats);
		%feature("compactdefaultargs") NewDocument;
		%feature("autodoc", "	* Constructs the empty new document aDoc. This document will have the format format. If InitDocument is redefined for a specific application, the new document is handled by the applicative session.

	:param format:
	:type format: TCollection_ExtendedString &
	:param aDoc:
	:type aDoc: Handle_TDocStd_Document &
	:rtype: void
") NewDocument;
		virtual void NewDocument (const TCollection_ExtendedString & format,Handle_TDocStd_Document & aDoc);
		%feature("compactdefaultargs") InitDocument;
		%feature("autodoc", "	* Initialize the document aDoc for the applicative session. This virtual function is called by NewDocument and is to be redefined for each specific application. Modified flag (different of disk version) ============= to open/save a document =======================

	:param aDoc:
	:type aDoc: Handle_TDocStd_Document &
	:rtype: void
") InitDocument;
		virtual void InitDocument (const Handle_TDocStd_Document & aDoc);
		%feature("compactdefaultargs") Close;
		%feature("autodoc", "	* Close the given document. the document is not any more handled by the applicative session.

	:param aDoc:
	:type aDoc: Handle_TDocStd_Document &
	:rtype: None
") Close;
		void Close (const Handle_TDocStd_Document & aDoc);
		%feature("compactdefaultargs") IsInSession;
		%feature("autodoc", "	* Returns an index for the document found in the path path in this applicative session. If the returned value is 0, the document is not present in the applicative session. This method can be used for the interactive part of an application. For instance, on a call to Open, the document to be opened may already be in memory. IsInSession checks to see if this is the case. Open can be made to depend on the value of the index returned: if IsInSession returns 0, the document is opened; if it returns another value, a message is displayed asking the user if he wants to override the version of the document in memory. Example: Standard_Integer insession = A->IsInSession(aDoc); if (insession > 0) { cout << 'document ' << insession << ' is already in session' << endl; return 0; }

	:param path:
	:type path: TCollection_ExtendedString &
	:rtype: int
") IsInSession;
		Standard_Integer IsInSession (const TCollection_ExtendedString & path);
		%feature("compactdefaultargs") Open;
		%feature("autodoc", "	* Retrieves the document aDoc stored under the name aName in the directory directory. In order not to override a version of aDoc which is already in memory, this method can be made to depend on the value returned by IsInSession.

	:param path:
	:type path: TCollection_ExtendedString &
	:param aDoc:
	:type aDoc: Handle_TDocStd_Document &
	:rtype: PCDM_ReaderStatus
") Open;
		PCDM_ReaderStatus Open (const TCollection_ExtendedString & path,Handle_TDocStd_Document & aDoc);
		%feature("compactdefaultargs") SaveAs;
		%feature("autodoc", "	* Save the active document in the file <name> in the path <path> ; o verwrites the file if it already exists.

	:param aDoc:
	:type aDoc: Handle_TDocStd_Document &
	:param path:
	:type path: TCollection_ExtendedString &
	:rtype: PCDM_StoreStatus
") SaveAs;
		PCDM_StoreStatus SaveAs (const Handle_TDocStd_Document & aDoc,const TCollection_ExtendedString & path);
		%feature("compactdefaultargs") Save;
		%feature("autodoc", "	* Save aDoc active document. Exceptions: Standard_NotImplemented if the document was not retrieved in the applicative session by using Open.

	:param aDoc:
	:type aDoc: Handle_TDocStd_Document &
	:rtype: PCDM_StoreStatus
") Save;
		PCDM_StoreStatus Save (const Handle_TDocStd_Document & aDoc);
		%feature("compactdefaultargs") SaveAs;
		%feature("autodoc", "	* Save the active document in the file <name> in the path <path> . overwrite the file if it already exist.

	:param aDoc:
	:type aDoc: Handle_TDocStd_Document &
	:param path:
	:type path: TCollection_ExtendedString &
	:param theStatusMessage:
	:type theStatusMessage: TCollection_ExtendedString &
	:rtype: PCDM_StoreStatus
") SaveAs;
		PCDM_StoreStatus SaveAs (const Handle_TDocStd_Document & aDoc,const TCollection_ExtendedString & path,TCollection_ExtendedString & theStatusMessage);
		%feature("compactdefaultargs") Save;
		%feature("autodoc", "	* Save the document overwriting the previous file

	:param aDoc:
	:type aDoc: Handle_TDocStd_Document &
	:param theStatusMessage:
	:type theStatusMessage: TCollection_ExtendedString &
	:rtype: PCDM_StoreStatus
") Save;
		PCDM_StoreStatus Save (const Handle_TDocStd_Document & aDoc,TCollection_ExtendedString & theStatusMessage);
};


%extend TDocStd_Application {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_TDocStd_Application(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_TDocStd_Application::Handle_TDocStd_Application %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_TDocStd_Application;
class Handle_TDocStd_Application : public Handle_CDF_Application {

    public:
        // constructors
        Handle_TDocStd_Application();
        Handle_TDocStd_Application(const Handle_TDocStd_Application &aHandle);
        Handle_TDocStd_Application(const TDocStd_Application *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_TDocStd_Application DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_TDocStd_Application {
    TDocStd_Application* _get_reference() {
    return (TDocStd_Application*)$self->Access();
    }
};

%extend Handle_TDocStd_Application {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend TDocStd_Application {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TDocStd_ApplicationDelta;
class TDocStd_ApplicationDelta : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") TDocStd_ApplicationDelta;
		%feature("autodoc", "	:rtype: None
") TDocStd_ApplicationDelta;
		 TDocStd_ApplicationDelta ();
		%feature("compactdefaultargs") GetDocuments;
		%feature("autodoc", "	:rtype: TDocStd_SequenceOfDocument
") GetDocuments;
		TDocStd_SequenceOfDocument & GetDocuments ();
		%feature("compactdefaultargs") GetName;
		%feature("autodoc", "	:rtype: TCollection_ExtendedString
") GetName;
		const TCollection_ExtendedString & GetName ();
		%feature("compactdefaultargs") SetName;
		%feature("autodoc", "	:param theName:
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


%extend TDocStd_ApplicationDelta {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_TDocStd_ApplicationDelta(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_TDocStd_ApplicationDelta::Handle_TDocStd_ApplicationDelta %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_TDocStd_ApplicationDelta;
class Handle_TDocStd_ApplicationDelta : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_TDocStd_ApplicationDelta();
        Handle_TDocStd_ApplicationDelta(const Handle_TDocStd_ApplicationDelta &aHandle);
        Handle_TDocStd_ApplicationDelta(const TDocStd_ApplicationDelta *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_TDocStd_ApplicationDelta DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_TDocStd_ApplicationDelta {
    TDocStd_ApplicationDelta* _get_reference() {
    return (TDocStd_ApplicationDelta*)$self->Access();
    }
};

%extend Handle_TDocStd_ApplicationDelta {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend TDocStd_ApplicationDelta {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TDocStd_CompoundDelta;
class TDocStd_CompoundDelta : public TDF_Delta {
	public:
		%feature("compactdefaultargs") TDocStd_CompoundDelta;
		%feature("autodoc", "	* Creates a compound delta. Validates <self> at <aBeginTime>. If applied, it restores the TDF_Data in the state it was at <anEndTime>. Reserved to TDF_Data.

	:rtype: None
") TDocStd_CompoundDelta;
		 TDocStd_CompoundDelta ();
};


%extend TDocStd_CompoundDelta {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_TDocStd_CompoundDelta(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_TDocStd_CompoundDelta::Handle_TDocStd_CompoundDelta %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_TDocStd_CompoundDelta;
class Handle_TDocStd_CompoundDelta : public Handle_TDF_Delta {

    public:
        // constructors
        Handle_TDocStd_CompoundDelta();
        Handle_TDocStd_CompoundDelta(const Handle_TDocStd_CompoundDelta &aHandle);
        Handle_TDocStd_CompoundDelta(const TDocStd_CompoundDelta *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_TDocStd_CompoundDelta DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_TDocStd_CompoundDelta {
    TDocStd_CompoundDelta* _get_reference() {
    return (TDocStd_CompoundDelta*)$self->Access();
    }
};

%extend Handle_TDocStd_CompoundDelta {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend TDocStd_CompoundDelta {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TDocStd_Context;
class TDocStd_Context {
	public:
		%feature("compactdefaultargs") TDocStd_Context;
		%feature("autodoc", "	:rtype: None
") TDocStd_Context;
		 TDocStd_Context ();
		%feature("compactdefaultargs") SetModifiedReferences;
		%feature("autodoc", "	:param Mod:
	:type Mod: bool
	:rtype: None
") SetModifiedReferences;
		void SetModifiedReferences (const Standard_Boolean Mod);
		%feature("compactdefaultargs") ModifiedReferences;
		%feature("autodoc", "	:rtype: bool
") ModifiedReferences;
		Standard_Boolean ModifiedReferences ();
};


%extend TDocStd_Context {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TDocStd_DataMapIteratorOfLabelIDMapDataMap;
class TDocStd_DataMapIteratorOfLabelIDMapDataMap : public TCollection_BasicMapIterator {
	public:
		%feature("compactdefaultargs") TDocStd_DataMapIteratorOfLabelIDMapDataMap;
		%feature("autodoc", "	:rtype: None
") TDocStd_DataMapIteratorOfLabelIDMapDataMap;
		 TDocStd_DataMapIteratorOfLabelIDMapDataMap ();
		%feature("compactdefaultargs") TDocStd_DataMapIteratorOfLabelIDMapDataMap;
		%feature("autodoc", "	:param aMap:
	:type aMap: TDocStd_LabelIDMapDataMap &
	:rtype: None
") TDocStd_DataMapIteratorOfLabelIDMapDataMap;
		 TDocStd_DataMapIteratorOfLabelIDMapDataMap (const TDocStd_LabelIDMapDataMap & aMap);
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "	:param aMap:
	:type aMap: TDocStd_LabelIDMapDataMap &
	:rtype: None
") Initialize;
		void Initialize (const TDocStd_LabelIDMapDataMap & aMap);
		%feature("compactdefaultargs") Key;
		%feature("autodoc", "	:rtype: TDF_Label
") Key;
		const TDF_Label & Key ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: TDF_IDMap
") Value;
		const TDF_IDMap & Value ();
};


%extend TDocStd_DataMapIteratorOfLabelIDMapDataMap {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TDocStd_DataMapNodeOfLabelIDMapDataMap;
class TDocStd_DataMapNodeOfLabelIDMapDataMap : public TCollection_MapNode {
	public:
		%feature("compactdefaultargs") TDocStd_DataMapNodeOfLabelIDMapDataMap;
		%feature("autodoc", "	:param K:
	:type K: TDF_Label &
	:param I:
	:type I: TDF_IDMap &
	:param n:
	:type n: TCollection_MapNodePtr &
	:rtype: None
") TDocStd_DataMapNodeOfLabelIDMapDataMap;
		 TDocStd_DataMapNodeOfLabelIDMapDataMap (const TDF_Label & K,const TDF_IDMap & I,const TCollection_MapNodePtr & n);
		%feature("compactdefaultargs") Key;
		%feature("autodoc", "	:rtype: TDF_Label
") Key;
		TDF_Label & Key ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: TDF_IDMap
") Value;
		TDF_IDMap & Value ();
};


%extend TDocStd_DataMapNodeOfLabelIDMapDataMap {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_TDocStd_DataMapNodeOfLabelIDMapDataMap(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_TDocStd_DataMapNodeOfLabelIDMapDataMap::Handle_TDocStd_DataMapNodeOfLabelIDMapDataMap %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_TDocStd_DataMapNodeOfLabelIDMapDataMap;
class Handle_TDocStd_DataMapNodeOfLabelIDMapDataMap : public Handle_TCollection_MapNode {

    public:
        // constructors
        Handle_TDocStd_DataMapNodeOfLabelIDMapDataMap();
        Handle_TDocStd_DataMapNodeOfLabelIDMapDataMap(const Handle_TDocStd_DataMapNodeOfLabelIDMapDataMap &aHandle);
        Handle_TDocStd_DataMapNodeOfLabelIDMapDataMap(const TDocStd_DataMapNodeOfLabelIDMapDataMap *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_TDocStd_DataMapNodeOfLabelIDMapDataMap DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_TDocStd_DataMapNodeOfLabelIDMapDataMap {
    TDocStd_DataMapNodeOfLabelIDMapDataMap* _get_reference() {
    return (TDocStd_DataMapNodeOfLabelIDMapDataMap*)$self->Access();
    }
};

%extend Handle_TDocStd_DataMapNodeOfLabelIDMapDataMap {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend TDocStd_DataMapNodeOfLabelIDMapDataMap {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TDocStd_Document;
class TDocStd_Document : public CDM_Document {
	public:
		%feature("compactdefaultargs") Get;
		%feature("autodoc", "	* Will Abort any execution, clear fields returns the document which contains <L>. raises an exception if the document is not found.

	:param L:
	:type L: TDF_Label &
	:rtype: Handle_TDocStd_Document
") Get;
		static Handle_TDocStd_Document Get (const TDF_Label & L);
		%feature("compactdefaultargs") TDocStd_Document;
		%feature("autodoc", "	* Constructs a document object defined by the string astorageformat.

	:param astorageformat:
	:type astorageformat: TCollection_ExtendedString &
	:rtype: None
") TDocStd_Document;
		 TDocStd_Document (const TCollection_ExtendedString & astorageformat);
		%feature("compactdefaultargs") IsSaved;
		%feature("autodoc", "	* the document is saved in a file.

	:rtype: bool
") IsSaved;
		Standard_Boolean IsSaved ();
		%feature("compactdefaultargs") IsChanged;
		%feature("autodoc", "	* returns True if document differs from the state of last saving. this method have to be called only wroking in the transaction mode

	:rtype: bool
") IsChanged;
		Standard_Boolean IsChanged ();
		%feature("compactdefaultargs") SetSaved;
		%feature("autodoc", "	* This method have to be called to show document that it has been saved

	:rtype: None
") SetSaved;
		void SetSaved ();
		%feature("compactdefaultargs") SetSavedTime;
		%feature("autodoc", "	* Say to document what it is not saved. Use value, returned earlier by GetSavedTime().

	:param theTime:
	:type theTime: int
	:rtype: None
") SetSavedTime;
		void SetSavedTime (const Standard_Integer theTime);
		%feature("compactdefaultargs") GetSavedTime;
		%feature("autodoc", "	* Returns value of <mySavedTime> to be used later in SetSavedTime()

	:rtype: int
") GetSavedTime;
		Standard_Integer GetSavedTime ();
		%feature("compactdefaultargs") GetName;
		%feature("autodoc", "	* raise if <self> is not saved.

	:rtype: TCollection_ExtendedString
") GetName;
		TCollection_ExtendedString GetName ();
		%feature("compactdefaultargs") GetPath;
		%feature("autodoc", "	* returns the OS path of the file, in wich one <self> is saved. Raise an exception if <self> is not saved.

	:rtype: TCollection_ExtendedString
") GetPath;
		TCollection_ExtendedString GetPath ();
		%feature("compactdefaultargs") SetData;
		%feature("autodoc", "	:param data:
	:type data: Handle_TDF_Data &
	:rtype: None
") SetData;
		void SetData (const Handle_TDF_Data & data);
		%feature("compactdefaultargs") GetData;
		%feature("autodoc", "	:rtype: Handle_TDF_Data
") GetData;
		Handle_TDF_Data GetData ();
		%feature("compactdefaultargs") Main;
		%feature("autodoc", "	* Returns the main label in this data framework. By definition, this is the label with the entry 0:1.

	:rtype: TDF_Label
") Main;
		TDF_Label Main ();
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "	* Returns True if the main label has no attributes

	:rtype: bool
") IsEmpty;
		Standard_Boolean IsEmpty ();
		%feature("compactdefaultargs") IsValid;
		%feature("autodoc", "	* Returns False if the document has been modified but not recomputed.

	:rtype: bool
") IsValid;
		Standard_Boolean IsValid ();
		%feature("compactdefaultargs") SetModified;
		%feature("autodoc", "	* Notify the label as modified, the Document becomes UnValid. returns True if <L> has been notified as modified.

	:param L:
	:type L: TDF_Label &
	:rtype: None
") SetModified;
		void SetModified (const TDF_Label & L);
		%feature("compactdefaultargs") PurgeModified;
		%feature("autodoc", "	* Remove all modifications. After this call The document becomesagain Valid.

	:rtype: None
") PurgeModified;
		void PurgeModified ();
		%feature("compactdefaultargs") GetModified;
		%feature("autodoc", "	* Returns the labels which have been modified in this document.

	:rtype: TDF_LabelMap
") GetModified;
		const TDF_LabelMap & GetModified ();
		%feature("compactdefaultargs") NewCommand;
		%feature("autodoc", "	* Launches a new command. This command may be undone.

	:rtype: None
") NewCommand;
		void NewCommand ();
		%feature("compactdefaultargs") HasOpenCommand;
		%feature("autodoc", "	* returns True if a Command transaction is open in the curret .

	:rtype: bool
") HasOpenCommand;
		Standard_Boolean HasOpenCommand ();
		%feature("compactdefaultargs") OpenCommand;
		%feature("autodoc", "	* Opens a new command transaction in this document. You can use HasOpenCommand to see whether a command is already open. Exceptions Standard_DomainError if a command is already open in this document.

	:rtype: None
") OpenCommand;
		void OpenCommand ();
		%feature("compactdefaultargs") CommitCommand;
		%feature("autodoc", "	* Commits documents transactions and fills the transaction manager with documents that have been changed during the transaction. If no command transaction is open, nothing is done. Returns True if a new delta has been added to myUndos.

	:rtype: bool
") CommitCommand;
		Standard_Boolean CommitCommand ();
		%feature("compactdefaultargs") AbortCommand;
		%feature("autodoc", "	* Abort the Command transaction. Does nothing If there is no Command transaction open.

	:rtype: None
") AbortCommand;
		void AbortCommand ();
		%feature("compactdefaultargs") GetUndoLimit;
		%feature("autodoc", "	* The current limit on the number of undos

	:rtype: int
") GetUndoLimit;
		Standard_Integer GetUndoLimit ();
		%feature("compactdefaultargs") SetUndoLimit;
		%feature("autodoc", "	* Set the limit on the number of Undo Delta stored 0 will disable Undo on the document A negative value means no limit. Note that by default Undo is disabled. Enabling it will take effect with the next call to NewCommand. Of course this limit is the same for Redo

	:param L:
	:type L: int
	:rtype: None
") SetUndoLimit;
		void SetUndoLimit (const Standard_Integer L);
		%feature("compactdefaultargs") ClearUndos;
		%feature("autodoc", "	* Remove all stored Undos and Redos

	:rtype: None
") ClearUndos;
		void ClearUndos ();
		%feature("compactdefaultargs") ClearRedos;
		%feature("autodoc", "	* Remove all stored Redos

	:rtype: None
") ClearRedos;
		void ClearRedos ();
		%feature("compactdefaultargs") GetAvailableUndos;
		%feature("autodoc", "	* Returns the number of undos stored in this document. If this figure is greater than 0, the method Undo can be used.

	:rtype: int
") GetAvailableUndos;
		Standard_Integer GetAvailableUndos ();
		%feature("compactdefaultargs") Undo;
		%feature("autodoc", "	* Will UNDO one step, returns False if no undo was done (Undos == 0). Otherwise, true is returned and one step in the list of undoes is undone.

	:rtype: bool
") Undo;
		Standard_Boolean Undo ();
		%feature("compactdefaultargs") GetAvailableRedos;
		%feature("autodoc", "	* Returns the number of redos stored in this document. If this figure is greater than 0, the method Redo can be used.

	:rtype: int
") GetAvailableRedos;
		Standard_Integer GetAvailableRedos ();
		%feature("compactdefaultargs") Redo;
		%feature("autodoc", "	* Will REDO one step, returns False if no redo was done (Redos == 0). Otherwise, true is returned, and one step in the list of redoes is done again.

	:rtype: bool
") Redo;
		Standard_Boolean Redo ();
		%feature("compactdefaultargs") GetUndos;
		%feature("autodoc", "	:rtype: TDF_DeltaList
") GetUndos;
		const TDF_DeltaList & GetUndos ();
		%feature("compactdefaultargs") GetRedos;
		%feature("autodoc", "	:rtype: TDF_DeltaList
") GetRedos;
		const TDF_DeltaList & GetRedos ();
		%feature("compactdefaultargs") RemoveFirstUndo;
		%feature("autodoc", "	* Removes the first undo in the list of document undos. It is used in the application when the undo limit is exceed.

	:rtype: None
") RemoveFirstUndo;
		void RemoveFirstUndo ();
		%feature("compactdefaultargs") InitDeltaCompaction;
		%feature("autodoc", "	* Initializes the procedure of delta compaction Returns false if there is no delta to compact Marks the last delta as a 'from' delta

	:rtype: bool
") InitDeltaCompaction;
		Standard_Boolean InitDeltaCompaction ();
		%feature("compactdefaultargs") PerformDeltaCompaction;
		%feature("autodoc", "	* Performs the procedure of delta compaction Makes all deltas starting from 'from' delta till the last one to be one delta.

	:rtype: bool
") PerformDeltaCompaction;
		Standard_Boolean PerformDeltaCompaction ();
		%feature("compactdefaultargs") UpdateReferences;
		%feature("autodoc", "	* Set modifications on labels impacted by external references to the entry. The document becomes invalid and must be recomputed.

	:param aDocEntry:
	:type aDocEntry: TCollection_AsciiString &
	:rtype: None
") UpdateReferences;
		void UpdateReferences (const TCollection_AsciiString & aDocEntry);
		%feature("compactdefaultargs") Recompute;
		%feature("autodoc", "	* Recompute if the document was not valid and propagate the reccorded modification.

	:rtype: None
") Recompute;
		void Recompute ();
		%feature("compactdefaultargs") Update;
		%feature("autodoc", "	* This method Update will be called to signal the end of the modified references list. The document should be recomputed and UpdateFromDocuments should be called. Update should returns True in case of success, false otherwise. In case of Failure, additional information can be given in ErrorString. Update the document by propagation ================================== Update the document from internal stored modifications. If you want to undoing this operation, please call NewCommand before. to change format (advanced programming) ================

	:param aToDocument:
	:type aToDocument: Handle_CDM_Document &
	:param aReferenceIdentifier:
	:type aReferenceIdentifier: int
	:param aModifContext:
	:type aModifContext: Standard_Address
	:rtype: void
") Update;
		virtual void Update (const Handle_CDM_Document & aToDocument,const Standard_Integer aReferenceIdentifier,const Standard_Address aModifContext);
		%feature("compactdefaultargs") StorageFormat;
		%feature("autodoc", "	:rtype: TCollection_ExtendedString
") StorageFormat;
		virtual TCollection_ExtendedString StorageFormat ();
		%feature("compactdefaultargs") ChangeStorageFormat;
		%feature("autodoc", "	* methods for the nested transaction mode

	:param newStorageFormat:
	:type newStorageFormat: TCollection_ExtendedString &
	:rtype: void
") ChangeStorageFormat;
		virtual void ChangeStorageFormat (const TCollection_ExtendedString & newStorageFormat);
		%feature("compactdefaultargs") SetNestedTransactionMode;
		%feature("autodoc", "	* Sets nested transaction mode if isAllowed == Standard_True

	:param isAllowed: default value is Standard_True
	:type isAllowed: bool
	:rtype: None
") SetNestedTransactionMode;
		void SetNestedTransactionMode (const Standard_Boolean isAllowed = Standard_True);
		%feature("compactdefaultargs") IsNestedTransactionMode;
		%feature("autodoc", "	* Returns Standard_True if mode is set

	:rtype: bool
") IsNestedTransactionMode;
		Standard_Boolean IsNestedTransactionMode ();
		%feature("compactdefaultargs") SetModificationMode;
		%feature("autodoc", "	* if theTransactionOnly is True changes is denied outside transactions

	:param theTransactionOnly:
	:type theTransactionOnly: bool
	:rtype: None
") SetModificationMode;
		void SetModificationMode (const Standard_Boolean theTransactionOnly);
		%feature("compactdefaultargs") ModificationMode;
		%feature("autodoc", "	* returns True if changes allowed only inside transactions

	:rtype: bool
") ModificationMode;
		Standard_Boolean ModificationMode ();
		%feature("compactdefaultargs") BeforeClose;
		%feature("autodoc", "	* Prepares document for closing

	:rtype: void
") BeforeClose;
		virtual void BeforeClose ();
};


%extend TDocStd_Document {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_TDocStd_Document(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_TDocStd_Document::Handle_TDocStd_Document %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_TDocStd_Document;
class Handle_TDocStd_Document : public Handle_CDM_Document {

    public:
        // constructors
        Handle_TDocStd_Document();
        Handle_TDocStd_Document(const Handle_TDocStd_Document &aHandle);
        Handle_TDocStd_Document(const TDocStd_Document *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_TDocStd_Document DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_TDocStd_Document {
    TDocStd_Document* _get_reference() {
    return (TDocStd_Document*)$self->Access();
    }
};

%extend Handle_TDocStd_Document {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend TDocStd_Document {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TDocStd_LabelIDMapDataMap;
class TDocStd_LabelIDMapDataMap : public TCollection_BasicMap {
	public:
		%feature("compactdefaultargs") TDocStd_LabelIDMapDataMap;
		%feature("autodoc", "	:param NbBuckets: default value is 1
	:type NbBuckets: int
	:rtype: None
") TDocStd_LabelIDMapDataMap;
		 TDocStd_LabelIDMapDataMap (const Standard_Integer NbBuckets = 1);
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: TDocStd_LabelIDMapDataMap &
	:rtype: TDocStd_LabelIDMapDataMap
") Assign;
		TDocStd_LabelIDMapDataMap & Assign (const TDocStd_LabelIDMapDataMap & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: TDocStd_LabelIDMapDataMap &
	:rtype: TDocStd_LabelIDMapDataMap
") operator =;
		TDocStd_LabelIDMapDataMap & operator = (const TDocStd_LabelIDMapDataMap & Other);
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
	:type I: TDF_IDMap &
	:rtype: bool
") Bind;
		Standard_Boolean Bind (const TDF_Label & K,const TDF_IDMap & I);
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
	:rtype: TDF_IDMap
") Find;
		const TDF_IDMap & Find (const TDF_Label & K);
		%feature("compactdefaultargs") ChangeFind;
		%feature("autodoc", "	:param K:
	:type K: TDF_Label &
	:rtype: TDF_IDMap
") ChangeFind;
		TDF_IDMap & ChangeFind (const TDF_Label & K);
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


%extend TDocStd_LabelIDMapDataMap {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TDocStd_Modified;
class TDocStd_Modified : public TDF_Attribute {
	public:
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "	* API class methods =================

	:param access:
	:type access: TDF_Label &
	:rtype: bool
") IsEmpty;
		static Standard_Boolean IsEmpty (const TDF_Label & access);
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "	:param alabel:
	:type alabel: TDF_Label &
	:rtype: bool
") Add;
		static Standard_Boolean Add (const TDF_Label & alabel);
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	:param alabel:
	:type alabel: TDF_Label &
	:rtype: bool
") Remove;
		static Standard_Boolean Remove (const TDF_Label & alabel);
		%feature("compactdefaultargs") Contains;
		%feature("autodoc", "	:param alabel:
	:type alabel: TDF_Label &
	:rtype: bool
") Contains;
		static Standard_Boolean Contains (const TDF_Label & alabel);
		%feature("compactdefaultargs") Get;
		%feature("autodoc", "	* if <IsEmpty> raise an exception.

	:param access:
	:type access: TDF_Label &
	:rtype: TDF_LabelMap
") Get;
		static const TDF_LabelMap & Get (const TDF_Label & access);
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	* remove all modified labels. becomes empty

	:param access:
	:type access: TDF_Label &
	:rtype: void
") Clear;
		static void Clear (const TDF_Label & access);
		%feature("compactdefaultargs") GetID;
		%feature("autodoc", "	* Modified methods ================

	:rtype: Standard_GUID
") GetID;
		static const Standard_GUID & GetID ();
		%feature("compactdefaultargs") TDocStd_Modified;
		%feature("autodoc", "	:rtype: None
") TDocStd_Modified;
		 TDocStd_Modified ();
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "	:rtype: bool
") IsEmpty;
		Standard_Boolean IsEmpty ();
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") AddLabel;
		%feature("autodoc", "	* add <L> as modified

	:param L:
	:type L: TDF_Label &
	:rtype: bool
") AddLabel;
		Standard_Boolean AddLabel (const TDF_Label & L);
		%feature("compactdefaultargs") RemoveLabel;
		%feature("autodoc", "	* remove <L> as modified

	:param L:
	:type L: TDF_Label &
	:rtype: bool
") RemoveLabel;
		Standard_Boolean RemoveLabel (const TDF_Label & L);
		%feature("compactdefaultargs") Get;
		%feature("autodoc", "	* returns modified label map

	:rtype: TDF_LabelMap
") Get;
		const TDF_LabelMap & Get ();
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


%extend TDocStd_Modified {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_TDocStd_Modified(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_TDocStd_Modified::Handle_TDocStd_Modified %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_TDocStd_Modified;
class Handle_TDocStd_Modified : public Handle_TDF_Attribute {

    public:
        // constructors
        Handle_TDocStd_Modified();
        Handle_TDocStd_Modified(const Handle_TDocStd_Modified &aHandle);
        Handle_TDocStd_Modified(const TDocStd_Modified *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_TDocStd_Modified DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_TDocStd_Modified {
    TDocStd_Modified* _get_reference() {
    return (TDocStd_Modified*)$self->Access();
    }
};

%extend Handle_TDocStd_Modified {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend TDocStd_Modified {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TDocStd_MultiTransactionManager;
class TDocStd_MultiTransactionManager : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") TDocStd_MultiTransactionManager;
		%feature("autodoc", "	* Constructor

	:rtype: None
") TDocStd_MultiTransactionManager;
		 TDocStd_MultiTransactionManager ();
		%feature("compactdefaultargs") SetUndoLimit;
		%feature("autodoc", "	* Sets undo limit for the manager and all documents.

	:param theLimit:
	:type theLimit: int
	:rtype: None
") SetUndoLimit;
		void SetUndoLimit (const Standard_Integer theLimit);
		%feature("compactdefaultargs") GetUndoLimit;
		%feature("autodoc", "	* Returns undo limit for the manager.

	:rtype: int
") GetUndoLimit;
		Standard_Integer GetUndoLimit ();
		%feature("compactdefaultargs") Undo;
		%feature("autodoc", "	* Undoes the current transaction of the manager. It calls the Undo () method of the document being on top of the manager list of undos (list.First()) and moves the list item to the top of the list of manager redos (list.Prepend(item)).

	:rtype: None
") Undo;
		void Undo ();
		%feature("compactdefaultargs") Redo;
		%feature("autodoc", "	* Redoes the current transaction of the application. It calls the Redo () method of the document being on top of the manager list of redos (list.First()) and moves the list item to the top of the list of manager undos (list.Prepend(item)).

	:rtype: None
") Redo;
		void Redo ();
		%feature("compactdefaultargs") GetAvailableUndos;
		%feature("autodoc", "	* Returns available manager undos.

	:rtype: TDocStd_SequenceOfApplicationDelta
") GetAvailableUndos;
		const TDocStd_SequenceOfApplicationDelta & GetAvailableUndos ();
		%feature("compactdefaultargs") GetAvailableRedos;
		%feature("autodoc", "	* Returns available manager redos.

	:rtype: TDocStd_SequenceOfApplicationDelta
") GetAvailableRedos;
		const TDocStd_SequenceOfApplicationDelta & GetAvailableRedos ();
		%feature("compactdefaultargs") OpenCommand;
		%feature("autodoc", "	* Opens transaction in each document and sets the flag that transaction is opened. If there are already opened transactions in the documents, these transactions will be aborted before openning new ones.

	:rtype: None
") OpenCommand;
		void OpenCommand ();
		%feature("compactdefaultargs") AbortCommand;
		%feature("autodoc", "	* Unsets the flag of started manager transaction and aborts transaction in each document.

	:rtype: None
") AbortCommand;
		void AbortCommand ();
		%feature("compactdefaultargs") CommitCommand;
		%feature("autodoc", "	* Commits transaction in all documents and fills the transaction manager with the documents that have been changed during the transaction. Returns True if new data has been added to myUndos. NOTE: All nested transactions in the documents will be commited.

	:rtype: bool
") CommitCommand;
		Standard_Boolean CommitCommand ();
		%feature("compactdefaultargs") CommitCommand;
		%feature("autodoc", "	* Makes the same steps as the previous function but defines the name for transaction. Returns True if new data has been added to myUndos.

	:param theName:
	:type theName: TCollection_ExtendedString &
	:rtype: bool
") CommitCommand;
		Standard_Boolean CommitCommand (const TCollection_ExtendedString & theName);
		%feature("compactdefaultargs") HasOpenCommand;
		%feature("autodoc", "	* Returns true if a transaction is opened.

	:rtype: bool
") HasOpenCommand;
		Standard_Boolean HasOpenCommand ();
		%feature("compactdefaultargs") RemoveLastUndo;
		%feature("autodoc", "	* Removes undo information from the list of undos of the manager and all documents which have been modified during the transaction.

	:rtype: None
") RemoveLastUndo;
		void RemoveLastUndo ();

        %feature("autodoc", "1");
        %extend{
            std::string DumpTransactionToString() {
            std::stringstream s;
            self->DumpTransaction(s);
            return s.str();}
        };
        		%feature("compactdefaultargs") AddDocument;
		%feature("autodoc", "	* Adds the document to the transaction manager and checks if it has been already added

	:param theDoc:
	:type theDoc: Handle_TDocStd_Document &
	:rtype: None
") AddDocument;
		void AddDocument (const Handle_TDocStd_Document & theDoc);
		%feature("compactdefaultargs") RemoveDocument;
		%feature("autodoc", "	* Removes the document from the transaction manager.

	:param theDoc:
	:type theDoc: Handle_TDocStd_Document &
	:rtype: None
") RemoveDocument;
		void RemoveDocument (const Handle_TDocStd_Document & theDoc);
		%feature("compactdefaultargs") Documents;
		%feature("autodoc", "	* Returns the added documents to the transaction manager.

	:rtype: TDocStd_SequenceOfDocument
") Documents;
		const TDocStd_SequenceOfDocument & Documents ();
		%feature("compactdefaultargs") SetNestedTransactionMode;
		%feature("autodoc", "	* Sets nested transaction mode if isAllowed == Standard_True NOTE: field myIsNestedTransactionMode exists only for synchronization between several documents and has no effect on transactions of multitransaction manager.

	:param isAllowed: default value is Standard_True
	:type isAllowed: bool
	:rtype: None
") SetNestedTransactionMode;
		void SetNestedTransactionMode (const Standard_Boolean isAllowed = Standard_True);
		%feature("compactdefaultargs") IsNestedTransactionMode;
		%feature("autodoc", "	* Returns Standard_True if NestedTransaction mode is set. Methods for protection of changes outside transactions

	:rtype: bool
") IsNestedTransactionMode;
		Standard_Boolean IsNestedTransactionMode ();
		%feature("compactdefaultargs") SetModificationMode;
		%feature("autodoc", "	* If theTransactionOnly is True, denies all changes outside transactions.

	:param theTransactionOnly:
	:type theTransactionOnly: bool
	:rtype: None
") SetModificationMode;
		void SetModificationMode (const Standard_Boolean theTransactionOnly);
		%feature("compactdefaultargs") ModificationMode;
		%feature("autodoc", "	* Returns True if changes are allowed only inside transactions.

	:rtype: bool
") ModificationMode;
		Standard_Boolean ModificationMode ();
		%feature("compactdefaultargs") ClearUndos;
		%feature("autodoc", "	* Clears undos in the manager and in documents.

	:rtype: None
") ClearUndos;
		void ClearUndos ();
		%feature("compactdefaultargs") ClearRedos;
		%feature("autodoc", "	* Clears redos in the manager and in documents.

	:rtype: None
") ClearRedos;
		void ClearRedos ();
};


%extend TDocStd_MultiTransactionManager {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_TDocStd_MultiTransactionManager(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_TDocStd_MultiTransactionManager::Handle_TDocStd_MultiTransactionManager %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_TDocStd_MultiTransactionManager;
class Handle_TDocStd_MultiTransactionManager : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_TDocStd_MultiTransactionManager();
        Handle_TDocStd_MultiTransactionManager(const Handle_TDocStd_MultiTransactionManager &aHandle);
        Handle_TDocStd_MultiTransactionManager(const TDocStd_MultiTransactionManager *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_TDocStd_MultiTransactionManager DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_TDocStd_MultiTransactionManager {
    TDocStd_MultiTransactionManager* _get_reference() {
    return (TDocStd_MultiTransactionManager*)$self->Access();
    }
};

%extend Handle_TDocStd_MultiTransactionManager {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend TDocStd_MultiTransactionManager {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TDocStd_Owner;
class TDocStd_Owner : public TDF_Attribute {
	public:
		%feature("compactdefaultargs") GetID;
		%feature("autodoc", "	* class methods =============

	:rtype: Standard_GUID
") GetID;
		static const Standard_GUID & GetID ();
		%feature("compactdefaultargs") SetDocument;
		%feature("autodoc", "	:param indata:
	:type indata: Handle_TDF_Data &
	:param doc:
	:type doc: Handle_TDocStd_Document &
	:rtype: void
") SetDocument;
		static void SetDocument (const Handle_TDF_Data & indata,const Handle_TDocStd_Document & doc);
		%feature("compactdefaultargs") GetDocument;
		%feature("autodoc", "	* Owner methods ===============

	:param ofdata:
	:type ofdata: Handle_TDF_Data &
	:rtype: Handle_TDocStd_Document
") GetDocument;
		static Handle_TDocStd_Document GetDocument (const Handle_TDF_Data & ofdata);
		%feature("compactdefaultargs") TDocStd_Owner;
		%feature("autodoc", "	:rtype: None
") TDocStd_Owner;
		 TDocStd_Owner ();
		%feature("compactdefaultargs") SetDocument;
		%feature("autodoc", "	:param document:
	:type document: Handle_TDocStd_Document &
	:rtype: None
") SetDocument;
		void SetDocument (const Handle_TDocStd_Document & document);
		%feature("compactdefaultargs") GetDocument;
		%feature("autodoc", "	:rtype: Handle_TDocStd_Document
") GetDocument;
		Handle_TDocStd_Document GetDocument ();
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


%extend TDocStd_Owner {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_TDocStd_Owner(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_TDocStd_Owner::Handle_TDocStd_Owner %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_TDocStd_Owner;
class Handle_TDocStd_Owner : public Handle_TDF_Attribute {

    public:
        // constructors
        Handle_TDocStd_Owner();
        Handle_TDocStd_Owner(const Handle_TDocStd_Owner &aHandle);
        Handle_TDocStd_Owner(const TDocStd_Owner *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_TDocStd_Owner DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_TDocStd_Owner {
    TDocStd_Owner* _get_reference() {
    return (TDocStd_Owner*)$self->Access();
    }
};

%extend Handle_TDocStd_Owner {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend TDocStd_Owner {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TDocStd_PathParser;
class TDocStd_PathParser {
	public:
		%feature("compactdefaultargs") TDocStd_PathParser;
		%feature("autodoc", "	:param path:
	:type path: TCollection_ExtendedString &
	:rtype: None
") TDocStd_PathParser;
		 TDocStd_PathParser (const TCollection_ExtendedString & path);
		%feature("compactdefaultargs") Parse;
		%feature("autodoc", "	:rtype: None
") Parse;
		void Parse ();
		%feature("compactdefaultargs") Trek;
		%feature("autodoc", "	:rtype: TCollection_ExtendedString
") Trek;
		TCollection_ExtendedString Trek ();
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "	:rtype: TCollection_ExtendedString
") Name;
		TCollection_ExtendedString Name ();
		%feature("compactdefaultargs") Extension;
		%feature("autodoc", "	:rtype: TCollection_ExtendedString
") Extension;
		TCollection_ExtendedString Extension ();
		%feature("compactdefaultargs") Path;
		%feature("autodoc", "	:rtype: TCollection_ExtendedString
") Path;
		TCollection_ExtendedString Path ();
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "	:rtype: int
") Length;
		Standard_Integer Length ();
};


%extend TDocStd_PathParser {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TDocStd_SequenceNodeOfSequenceOfApplicationDelta;
class TDocStd_SequenceNodeOfSequenceOfApplicationDelta : public TCollection_SeqNode {
	public:
		%feature("compactdefaultargs") TDocStd_SequenceNodeOfSequenceOfApplicationDelta;
		%feature("autodoc", "	:param I:
	:type I: Handle_TDocStd_ApplicationDelta &
	:param n:
	:type n: TCollection_SeqNodePtr &
	:param p:
	:type p: TCollection_SeqNodePtr &
	:rtype: None
") TDocStd_SequenceNodeOfSequenceOfApplicationDelta;
		 TDocStd_SequenceNodeOfSequenceOfApplicationDelta (const Handle_TDocStd_ApplicationDelta & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: Handle_TDocStd_ApplicationDelta
") Value;
		Handle_TDocStd_ApplicationDelta Value ();
};


%extend TDocStd_SequenceNodeOfSequenceOfApplicationDelta {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_TDocStd_SequenceNodeOfSequenceOfApplicationDelta(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_TDocStd_SequenceNodeOfSequenceOfApplicationDelta::Handle_TDocStd_SequenceNodeOfSequenceOfApplicationDelta %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_TDocStd_SequenceNodeOfSequenceOfApplicationDelta;
class Handle_TDocStd_SequenceNodeOfSequenceOfApplicationDelta : public Handle_TCollection_SeqNode {

    public:
        // constructors
        Handle_TDocStd_SequenceNodeOfSequenceOfApplicationDelta();
        Handle_TDocStd_SequenceNodeOfSequenceOfApplicationDelta(const Handle_TDocStd_SequenceNodeOfSequenceOfApplicationDelta &aHandle);
        Handle_TDocStd_SequenceNodeOfSequenceOfApplicationDelta(const TDocStd_SequenceNodeOfSequenceOfApplicationDelta *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_TDocStd_SequenceNodeOfSequenceOfApplicationDelta DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_TDocStd_SequenceNodeOfSequenceOfApplicationDelta {
    TDocStd_SequenceNodeOfSequenceOfApplicationDelta* _get_reference() {
    return (TDocStd_SequenceNodeOfSequenceOfApplicationDelta*)$self->Access();
    }
};

%extend Handle_TDocStd_SequenceNodeOfSequenceOfApplicationDelta {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend TDocStd_SequenceNodeOfSequenceOfApplicationDelta {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TDocStd_SequenceNodeOfSequenceOfDocument;
class TDocStd_SequenceNodeOfSequenceOfDocument : public TCollection_SeqNode {
	public:
		%feature("compactdefaultargs") TDocStd_SequenceNodeOfSequenceOfDocument;
		%feature("autodoc", "	:param I:
	:type I: Handle_TDocStd_Document &
	:param n:
	:type n: TCollection_SeqNodePtr &
	:param p:
	:type p: TCollection_SeqNodePtr &
	:rtype: None
") TDocStd_SequenceNodeOfSequenceOfDocument;
		 TDocStd_SequenceNodeOfSequenceOfDocument (const Handle_TDocStd_Document & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: Handle_TDocStd_Document
") Value;
		Handle_TDocStd_Document Value ();
};


%extend TDocStd_SequenceNodeOfSequenceOfDocument {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_TDocStd_SequenceNodeOfSequenceOfDocument(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_TDocStd_SequenceNodeOfSequenceOfDocument::Handle_TDocStd_SequenceNodeOfSequenceOfDocument %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_TDocStd_SequenceNodeOfSequenceOfDocument;
class Handle_TDocStd_SequenceNodeOfSequenceOfDocument : public Handle_TCollection_SeqNode {

    public:
        // constructors
        Handle_TDocStd_SequenceNodeOfSequenceOfDocument();
        Handle_TDocStd_SequenceNodeOfSequenceOfDocument(const Handle_TDocStd_SequenceNodeOfSequenceOfDocument &aHandle);
        Handle_TDocStd_SequenceNodeOfSequenceOfDocument(const TDocStd_SequenceNodeOfSequenceOfDocument *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_TDocStd_SequenceNodeOfSequenceOfDocument DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_TDocStd_SequenceNodeOfSequenceOfDocument {
    TDocStd_SequenceNodeOfSequenceOfDocument* _get_reference() {
    return (TDocStd_SequenceNodeOfSequenceOfDocument*)$self->Access();
    }
};

%extend Handle_TDocStd_SequenceNodeOfSequenceOfDocument {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend TDocStd_SequenceNodeOfSequenceOfDocument {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TDocStd_SequenceOfApplicationDelta;
class TDocStd_SequenceOfApplicationDelta : public TCollection_BaseSequence {
	public:
		%feature("compactdefaultargs") TDocStd_SequenceOfApplicationDelta;
		%feature("autodoc", "	:rtype: None
") TDocStd_SequenceOfApplicationDelta;
		 TDocStd_SequenceOfApplicationDelta ();
		%feature("compactdefaultargs") TDocStd_SequenceOfApplicationDelta;
		%feature("autodoc", "	:param Other:
	:type Other: TDocStd_SequenceOfApplicationDelta &
	:rtype: None
") TDocStd_SequenceOfApplicationDelta;
		 TDocStd_SequenceOfApplicationDelta (const TDocStd_SequenceOfApplicationDelta & Other);
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: TDocStd_SequenceOfApplicationDelta &
	:rtype: TDocStd_SequenceOfApplicationDelta
") Assign;
		const TDocStd_SequenceOfApplicationDelta & Assign (const TDocStd_SequenceOfApplicationDelta & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: TDocStd_SequenceOfApplicationDelta &
	:rtype: TDocStd_SequenceOfApplicationDelta
") operator =;
		const TDocStd_SequenceOfApplicationDelta & operator = (const TDocStd_SequenceOfApplicationDelta & Other);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param T:
	:type T: Handle_TDocStd_ApplicationDelta &
	:rtype: None
") Append;
		void Append (const Handle_TDocStd_ApplicationDelta & T);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param S:
	:type S: TDocStd_SequenceOfApplicationDelta &
	:rtype: None
") Append;
		void Append (TDocStd_SequenceOfApplicationDelta & S);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param T:
	:type T: Handle_TDocStd_ApplicationDelta &
	:rtype: None
") Prepend;
		void Prepend (const Handle_TDocStd_ApplicationDelta & T);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param S:
	:type S: TDocStd_SequenceOfApplicationDelta &
	:rtype: None
") Prepend;
		void Prepend (TDocStd_SequenceOfApplicationDelta & S);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param T:
	:type T: Handle_TDocStd_ApplicationDelta &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const Handle_TDocStd_ApplicationDelta & T);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param S:
	:type S: TDocStd_SequenceOfApplicationDelta &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,TDocStd_SequenceOfApplicationDelta & S);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param T:
	:type T: Handle_TDocStd_ApplicationDelta &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const Handle_TDocStd_ApplicationDelta & T);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param S:
	:type S: TDocStd_SequenceOfApplicationDelta &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,TDocStd_SequenceOfApplicationDelta & S);
		%feature("compactdefaultargs") First;
		%feature("autodoc", "	:rtype: Handle_TDocStd_ApplicationDelta
") First;
		Handle_TDocStd_ApplicationDelta First ();
		%feature("compactdefaultargs") Last;
		%feature("autodoc", "	:rtype: Handle_TDocStd_ApplicationDelta
") Last;
		Handle_TDocStd_ApplicationDelta Last ();
		%feature("compactdefaultargs") Split;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param Sub:
	:type Sub: TDocStd_SequenceOfApplicationDelta &
	:rtype: None
") Split;
		void Split (const Standard_Integer Index,TDocStd_SequenceOfApplicationDelta & Sub);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Handle_TDocStd_ApplicationDelta
") Value;
		Handle_TDocStd_ApplicationDelta Value (const Standard_Integer Index);
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param I:
	:type I: Handle_TDocStd_ApplicationDelta &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const Handle_TDocStd_ApplicationDelta & I);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Handle_TDocStd_ApplicationDelta
") ChangeValue;
		Handle_TDocStd_ApplicationDelta ChangeValue (const Standard_Integer Index);
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


%extend TDocStd_SequenceOfApplicationDelta {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TDocStd_SequenceOfDocument;
class TDocStd_SequenceOfDocument : public TCollection_BaseSequence {
	public:
		%feature("compactdefaultargs") TDocStd_SequenceOfDocument;
		%feature("autodoc", "	:rtype: None
") TDocStd_SequenceOfDocument;
		 TDocStd_SequenceOfDocument ();
		%feature("compactdefaultargs") TDocStd_SequenceOfDocument;
		%feature("autodoc", "	:param Other:
	:type Other: TDocStd_SequenceOfDocument &
	:rtype: None
") TDocStd_SequenceOfDocument;
		 TDocStd_SequenceOfDocument (const TDocStd_SequenceOfDocument & Other);
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: TDocStd_SequenceOfDocument &
	:rtype: TDocStd_SequenceOfDocument
") Assign;
		const TDocStd_SequenceOfDocument & Assign (const TDocStd_SequenceOfDocument & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: TDocStd_SequenceOfDocument &
	:rtype: TDocStd_SequenceOfDocument
") operator =;
		const TDocStd_SequenceOfDocument & operator = (const TDocStd_SequenceOfDocument & Other);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param T:
	:type T: Handle_TDocStd_Document &
	:rtype: None
") Append;
		void Append (const Handle_TDocStd_Document & T);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param S:
	:type S: TDocStd_SequenceOfDocument &
	:rtype: None
") Append;
		void Append (TDocStd_SequenceOfDocument & S);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param T:
	:type T: Handle_TDocStd_Document &
	:rtype: None
") Prepend;
		void Prepend (const Handle_TDocStd_Document & T);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param S:
	:type S: TDocStd_SequenceOfDocument &
	:rtype: None
") Prepend;
		void Prepend (TDocStd_SequenceOfDocument & S);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param T:
	:type T: Handle_TDocStd_Document &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const Handle_TDocStd_Document & T);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param S:
	:type S: TDocStd_SequenceOfDocument &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,TDocStd_SequenceOfDocument & S);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param T:
	:type T: Handle_TDocStd_Document &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const Handle_TDocStd_Document & T);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param S:
	:type S: TDocStd_SequenceOfDocument &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,TDocStd_SequenceOfDocument & S);
		%feature("compactdefaultargs") First;
		%feature("autodoc", "	:rtype: Handle_TDocStd_Document
") First;
		Handle_TDocStd_Document First ();
		%feature("compactdefaultargs") Last;
		%feature("autodoc", "	:rtype: Handle_TDocStd_Document
") Last;
		Handle_TDocStd_Document Last ();
		%feature("compactdefaultargs") Split;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param Sub:
	:type Sub: TDocStd_SequenceOfDocument &
	:rtype: None
") Split;
		void Split (const Standard_Integer Index,TDocStd_SequenceOfDocument & Sub);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Handle_TDocStd_Document
") Value;
		Handle_TDocStd_Document Value (const Standard_Integer Index);
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param I:
	:type I: Handle_TDocStd_Document &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const Handle_TDocStd_Document & I);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Handle_TDocStd_Document
") ChangeValue;
		Handle_TDocStd_Document ChangeValue (const Standard_Integer Index);
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


%extend TDocStd_SequenceOfDocument {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TDocStd_XLink;
class TDocStd_XLink : public TDF_Attribute {
	public:
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "	* Sets an empty external reference, at the label aLabel.

	:param atLabel:
	:type atLabel: TDF_Label &
	:rtype: Handle_TDocStd_XLink
") Set;
		static Handle_TDocStd_XLink Set (const TDF_Label & atLabel);
		%feature("compactdefaultargs") TDocStd_XLink;
		%feature("autodoc", "	* Initializes fields.

	:rtype: None
") TDocStd_XLink;
		 TDocStd_XLink ();
		%feature("compactdefaultargs") Update;
		%feature("autodoc", "	* Updates the data referenced in this external link attribute.

	:rtype: Handle_TDF_Reference
") Update;
		Handle_TDF_Reference Update ();
		%feature("compactdefaultargs") ID;
		%feature("autodoc", "	* Returns the ID of the attribute.

	:rtype: Standard_GUID
") ID;
		const Standard_GUID & ID ();
		%feature("compactdefaultargs") GetID;
		%feature("autodoc", "	* Returns the GUID for external links.

	:rtype: Standard_GUID
") GetID;
		static const Standard_GUID & GetID ();
		%feature("compactdefaultargs") DocumentEntry;
		%feature("autodoc", "	* Sets the name aDocEntry for the external document in this external link attribute.

	:param aDocEntry:
	:type aDocEntry: TCollection_AsciiString &
	:rtype: None
") DocumentEntry;
		void DocumentEntry (const TCollection_AsciiString & aDocEntry);
		%feature("compactdefaultargs") DocumentEntry;
		%feature("autodoc", "	* Returns the contents of the document identified by aDocEntry. aDocEntry provides external data to this external link attribute.

	:rtype: TCollection_AsciiString
") DocumentEntry;
		const TCollection_AsciiString & DocumentEntry ();
		%feature("compactdefaultargs") LabelEntry;
		%feature("autodoc", "	* Sets the label entry for this external link attribute with the label aLabel. aLabel pilots the importation of data from the document entry.

	:param aLabel:
	:type aLabel: TDF_Label &
	:rtype: None
") LabelEntry;
		void LabelEntry (const TDF_Label & aLabel);
		%feature("compactdefaultargs") LabelEntry;
		%feature("autodoc", "	* Sets the label entry for this external link attribute as a document identified by aLabEntry.

	:param aLabEntry:
	:type aLabEntry: TCollection_AsciiString &
	:rtype: None
") LabelEntry;
		void LabelEntry (const TCollection_AsciiString & aLabEntry);
		%feature("compactdefaultargs") LabelEntry;
		%feature("autodoc", "	* Returns the contents of the field <myLabelEntry>.

	:rtype: TCollection_AsciiString
") LabelEntry;
		const TCollection_AsciiString & LabelEntry ();
		%feature("compactdefaultargs") AfterAddition;
		%feature("autodoc", "	* Updates the XLinkRoot attribute by adding <self> to its list.

	:rtype: None
") AfterAddition;
		void AfterAddition ();
		%feature("compactdefaultargs") BeforeRemoval;
		%feature("autodoc", "	* Updates the XLinkRoot attribute by removing <self> from its list.

	:rtype: None
") BeforeRemoval;
		void BeforeRemoval ();
		%feature("compactdefaultargs") BeforeUndo;
		%feature("autodoc", "	* Something to do before applying <anAttDelta>.

	:param anAttDelta:
	:type anAttDelta: Handle_TDF_AttributeDelta &
	:param forceIt: default value is Standard_False
	:type forceIt: bool
	:rtype: bool
") BeforeUndo;
		virtual Standard_Boolean BeforeUndo (const Handle_TDF_AttributeDelta & anAttDelta,const Standard_Boolean forceIt = Standard_False);
		%feature("compactdefaultargs") AfterUndo;
		%feature("autodoc", "	* Something to do after applying <anAttDelta>.

	:param anAttDelta:
	:type anAttDelta: Handle_TDF_AttributeDelta &
	:param forceIt: default value is Standard_False
	:type forceIt: bool
	:rtype: bool
") AfterUndo;
		virtual Standard_Boolean AfterUndo (const Handle_TDF_AttributeDelta & anAttDelta,const Standard_Boolean forceIt = Standard_False);
		%feature("compactdefaultargs") BackupCopy;
		%feature("autodoc", "	* Returns a null handle. Raise allways for ,it is nonsense to use this method.

	:rtype: Handle_TDF_Attribute
") BackupCopy;
		Handle_TDF_Attribute BackupCopy ();
		%feature("compactdefaultargs") Restore;
		%feature("autodoc", "	* Does nothing.

	:param anAttribute:
	:type anAttribute: Handle_TDF_Attribute &
	:rtype: None
") Restore;
		void Restore (const Handle_TDF_Attribute & anAttribute);
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "	* Returns a null handle.

	:rtype: Handle_TDF_Attribute
") NewEmpty;
		Handle_TDF_Attribute NewEmpty ();
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	* Does nothing.

	:param intoAttribute:
	:type intoAttribute: Handle_TDF_Attribute &
	:param aRelocationTable:
	:type aRelocationTable: Handle_TDF_RelocationTable &
	:rtype: None
") Paste;
		void Paste (const Handle_TDF_Attribute & intoAttribute,const Handle_TDF_RelocationTable & aRelocationTable);

        %feature("autodoc", "1");
        %extend{
            std::string DumpToString() {
            std::stringstream s;
            self->Dump(s);
            return s.str();}
        };
        };


%extend TDocStd_XLink {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_TDocStd_XLink(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_TDocStd_XLink::Handle_TDocStd_XLink %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_TDocStd_XLink;
class Handle_TDocStd_XLink : public Handle_TDF_Attribute {

    public:
        // constructors
        Handle_TDocStd_XLink();
        Handle_TDocStd_XLink(const Handle_TDocStd_XLink &aHandle);
        Handle_TDocStd_XLink(const TDocStd_XLink *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_TDocStd_XLink DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_TDocStd_XLink {
    TDocStd_XLink* _get_reference() {
    return (TDocStd_XLink*)$self->Access();
    }
};

%extend Handle_TDocStd_XLink {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend TDocStd_XLink {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TDocStd_XLinkIterator;
class TDocStd_XLinkIterator {
	public:
		%feature("compactdefaultargs") TDocStd_XLinkIterator;
		%feature("autodoc", "	* Returns an empty iterator;

	:rtype: None
") TDocStd_XLinkIterator;
		 TDocStd_XLinkIterator ();
		%feature("compactdefaultargs") TDocStd_XLinkIterator;
		%feature("autodoc", "	* Creates an iterator on Reference of <D>.

	:param D:
	:type D: Handle_TDocStd_Document &
	:rtype: None
") TDocStd_XLinkIterator;
		 TDocStd_XLinkIterator (const Handle_TDocStd_Document & D);
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "	* Restarts an iteration with <D>.

	:param D:
	:type D: Handle_TDocStd_Document &
	:rtype: None
") Initialize;
		void Initialize (const Handle_TDocStd_Document & D);
		%feature("compactdefaultargs") More;
		%feature("autodoc", "	* Returns True if there is a current Item in the iteration.

	:rtype: bool
") More;
		Standard_Boolean More ();
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "	* Move to the next item; raises if there is no more item.

	:rtype: None
") Next;
		void Next ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	* Returns the current item; a null handle if there is none.

	:rtype: TDocStd_XLinkPtr
") Value;
		TDocStd_XLinkPtr Value ();
};


%extend TDocStd_XLinkIterator {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TDocStd_XLinkRoot;
class TDocStd_XLinkRoot : public TDF_Attribute {
	public:
		%feature("compactdefaultargs") GetID;
		%feature("autodoc", "	* Returns the ID: 2a96b61d-ec8b-11d0-bee7-080009dc3333

	:rtype: Standard_GUID
") GetID;
		static const Standard_GUID & GetID ();
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "	* Sets an empty XLinkRoot to Root or gets the existing one. Only one attribute per TDF_Data.

	:param aDF:
	:type aDF: Handle_TDF_Data &
	:rtype: Handle_TDocStd_XLinkRoot
") Set;
		static Handle_TDocStd_XLinkRoot Set (const Handle_TDF_Data & aDF);
		%feature("compactdefaultargs") Insert;
		%feature("autodoc", "	* Inserts <anXLinkPtr> at the beginning of the XLink chain.

	:param anXLinkPtr:
	:type anXLinkPtr: TDocStd_XLinkPtr &
	:rtype: void
") Insert;
		static void Insert (const TDocStd_XLinkPtr & anXLinkPtr);
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	* Removes <anXLinkPtr> from the XLink chain, if it exists.

	:param anXLinkPtr:
	:type anXLinkPtr: TDocStd_XLinkPtr &
	:rtype: void
") Remove;
		static void Remove (const TDocStd_XLinkPtr & anXLinkPtr);
		%feature("compactdefaultargs") ID;
		%feature("autodoc", "	* Returns the ID of the attribute.

	:rtype: Standard_GUID
") ID;
		const Standard_GUID & ID ();
		%feature("compactdefaultargs") BackupCopy;
		%feature("autodoc", "	* Returns a null handle.

	:rtype: Handle_TDF_Attribute
") BackupCopy;
		Handle_TDF_Attribute BackupCopy ();
		%feature("compactdefaultargs") Restore;
		%feature("autodoc", "	* Does nothing.

	:param anAttribute:
	:type anAttribute: Handle_TDF_Attribute &
	:rtype: None
") Restore;
		void Restore (const Handle_TDF_Attribute & anAttribute);
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "	* Returns a null handle.

	:rtype: Handle_TDF_Attribute
") NewEmpty;
		Handle_TDF_Attribute NewEmpty ();
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	* Does nothing.

	:param intoAttribute:
	:type intoAttribute: Handle_TDF_Attribute &
	:param aRelocationTable:
	:type aRelocationTable: Handle_TDF_RelocationTable &
	:rtype: None
") Paste;
		void Paste (const Handle_TDF_Attribute & intoAttribute,const Handle_TDF_RelocationTable & aRelocationTable);

        %feature("autodoc", "1");
        %extend{
            std::string DumpToString() {
            std::stringstream s;
            self->Dump(s);
            return s.str();}
        };
        };


%extend TDocStd_XLinkRoot {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_TDocStd_XLinkRoot(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_TDocStd_XLinkRoot::Handle_TDocStd_XLinkRoot %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_TDocStd_XLinkRoot;
class Handle_TDocStd_XLinkRoot : public Handle_TDF_Attribute {

    public:
        // constructors
        Handle_TDocStd_XLinkRoot();
        Handle_TDocStd_XLinkRoot(const Handle_TDocStd_XLinkRoot &aHandle);
        Handle_TDocStd_XLinkRoot(const TDocStd_XLinkRoot *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_TDocStd_XLinkRoot DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_TDocStd_XLinkRoot {
    TDocStd_XLinkRoot* _get_reference() {
    return (TDocStd_XLinkRoot*)$self->Access();
    }
};

%extend Handle_TDocStd_XLinkRoot {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend TDocStd_XLinkRoot {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TDocStd_XLinkTool;
class TDocStd_XLinkTool {
	public:
		%feature("compactdefaultargs") TDocStd_XLinkTool;
		%feature("autodoc", "	:rtype: None
") TDocStd_XLinkTool;
		 TDocStd_XLinkTool ();
		%feature("compactdefaultargs") CopyWithLink;
		%feature("autodoc", "	* Copies the content of the label <fromsource> to the label <intarget>. The link is registred with an XLink attribute by <intarget> label. if the content of <fromsource> is not self-contained, and/or <intarget> has already an XLink attribute, an exception is raised.

	:param intarget:
	:type intarget: TDF_Label &
	:param fromsource:
	:type fromsource: TDF_Label &
	:rtype: None
") CopyWithLink;
		void CopyWithLink (const TDF_Label & intarget,const TDF_Label & fromsource);
		%feature("compactdefaultargs") UpdateLink;
		%feature("autodoc", "	* Update the external reference set at <L>. Example Handle_TDocStd_Document aDoc; if (!OCAFTest::GetDocument(1,aDoc)) return 1; Handle_TDataStd_Reference aRef; TDocStd_XLinkTool xlinktool; if (!OCAFTest::Find(aDoc,2),TDataStd_Reference::GetID(),aRef) return 1; xlinktool.UpdateLink(aRef->Label()); Exceptions Standard_DomainError if <L> has no XLink attribute.

	:param L:
	:type L: TDF_Label &
	:rtype: None
") UpdateLink;
		void UpdateLink (const TDF_Label & L);
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "	* Copy the content of <fromsource> under <intarget>. Noone link is registred. noone check is done. Example Handle_TDocStd_Document DOC, XDOC; TDF_Label L, XL; TDocStd_XLinkTool xlinktool; xlinktool.Copy(L,XL); Exceptions: Standard_DomainError if the contents of fromsource are not entirely in the scope of this label, in other words, are not self-contained. !!! ==> Warning: If the document manages shapes use the next way: TDocStd_XLinkTool xlinktool; xlinktool.Copy(L,XL); TopTools_DataMapOfShapeShape M; TNaming::ChangeShapes(target,M);

	:param intarget:
	:type intarget: TDF_Label &
	:param fromsource:
	:type fromsource: TDF_Label &
	:rtype: void
") Copy;
		virtual void Copy (const TDF_Label & intarget,const TDF_Label & fromsource);
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
		%feature("compactdefaultargs") DataSet;
		%feature("autodoc", "	:rtype: Handle_TDF_DataSet
") DataSet;
		Handle_TDF_DataSet DataSet ();
		%feature("compactdefaultargs") RelocationTable;
		%feature("autodoc", "	:rtype: Handle_TDF_RelocationTable
") RelocationTable;
		Handle_TDF_RelocationTable RelocationTable ();
};


%extend TDocStd_XLinkTool {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
