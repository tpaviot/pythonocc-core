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
%define TDOCSTDDOCSTRING
"No docstring provided."
%enddef
%module (package="OCC.Core", docstring=TDOCSTDDOCSTRING) TDocStd

#pragma SWIG nowarn=504,325,503,520,350,351,383,389,394,395, 404

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


%include TDocStd_headers.i

/* templates */
%template(TDocStd_LabelIDMapDataMap) NCollection_DataMap <TDF_Label , TDF_IDMap , TDF_LabelMapHasher>;
%template(TDocStd_SequenceOfApplicationDelta) NCollection_Sequence <Handle_TDocStd_ApplicationDelta>;
%template(TDocStd_SequenceOfDocument) NCollection_Sequence <Handle_TDocStd_Document>;
/* end templates declaration */


/* typedefs */
typedef TDocStd_XLink * TDocStd_XLinkPtr;
typedef NCollection_DataMap <TDF_Label , TDF_IDMap , TDF_LabelMapHasher> TDocStd_LabelIDMapDataMap;
typedef NCollection_DataMap <TDF_Label , TDF_IDMap , TDF_LabelMapHasher>::Iterator TDocStd_DataMapIteratorOfLabelIDMapDataMap;
typedef NCollection_Sequence <Handle_TDocStd_ApplicationDelta> TDocStd_SequenceOfApplicationDelta;
typedef NCollection_Sequence <Handle_TDocStd_Document> TDocStd_SequenceOfDocument;
/* end typedefs declaration */

/* public enums */
/* end public enums declaration */

%wrap_handle(TDocStd_Application)
%wrap_handle(TDocStd_ApplicationDelta)
%wrap_handle(TDocStd_CompoundDelta)
%wrap_handle(TDocStd_Document)
%wrap_handle(TDocStd_Modified)
%wrap_handle(TDocStd_MultiTransactionManager)
%wrap_handle(TDocStd_Owner)
%wrap_handle(TDocStd_XLink)
%wrap_handle(TDocStd_XLinkRoot)

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
		%feature("compactdefaultargs") Close;
		%feature("autodoc", "	* Close the given document. the document is not any more handled by the applicative session.

	:param aDoc:
	:type aDoc: Handle_TDocStd_Document &
	:rtype: None
") Close;
		void Close (const Handle_TDocStd_Document & aDoc);
		%feature("compactdefaultargs") DefineFormat;
		%feature("autodoc", "	* Sets up resources and registers read and storage drivers for the specified format. @param theFormat - unique name for the format, used to identify it. @param theDescription - textual description of the format. @param theExtension - extension of the files in that format. The same extension can be used by several formats. @param theReader - instance of the read driver for the format.  Null value is allowed (no possibility to read). @param theWriter - instance of the write driver for the format.  Null value is allowed (no possibility to write).

	:param theFormat:
	:type theFormat: TCollection_AsciiString &
	:param theDescription:
	:type theDescription: TCollection_AsciiString &
	:param theExtension:
	:type theExtension: TCollection_AsciiString &
	:param theReader:
	:type theReader: Handle_PCDM_RetrievalDriver &
	:param theWriter:
	:type theWriter: Handle_PCDM_StorageDriver &
	:rtype: None
") DefineFormat;
		void DefineFormat (const TCollection_AsciiString & theFormat,const TCollection_AsciiString & theDescription,const TCollection_AsciiString & theExtension,const Handle_PCDM_RetrievalDriver & theReader,const Handle_PCDM_StorageDriver & theWriter);
		%feature("compactdefaultargs") GetDocument;
		%feature("autodoc", "	* Constructs the new document aDoc. aDoc is identified by the index index which is any integer between 1 and n where n is the number of documents returned by NbDocument. Example Handle_TDocStd_Application anApp; if (!CafTest::Find(A)) return 1; Handle_TDocStd aDoc; Standard_Integer nbdoc = anApp->NbDocuments(); for (Standard_Integer i = 1; i <= nbdoc; i++) { aApp->GetDocument(i,aDoc);

	:param index:
	:type index: int
	:param aDoc:
	:type aDoc: Handle_TDocStd_Document &
	:rtype: None
") GetDocument;
		void GetDocument (const Standard_Integer index,Handle_TDocStd_Document & aDoc);
		%feature("compactdefaultargs") InitDocument;
		%feature("autodoc", "	* Initialize the document aDoc for the applicative session. This virtual function is called by NewDocument and is to be redefined for each specific application. Modified flag (different of disk version) ============= to open/save a document =======================

	:param aDoc:
	:type aDoc: Handle_TDocStd_Document &
	:rtype: void
") InitDocument;
		virtual void InitDocument (const Handle_TDocStd_Document & aDoc);
		%feature("compactdefaultargs") IsDriverLoaded;
		%feature("autodoc", "	* Check if meta data driver was successfully loaded by the application constructor

	:rtype: bool
") IsDriverLoaded;
		Standard_Boolean IsDriverLoaded ();
		%feature("compactdefaultargs") IsInSession;
		%feature("autodoc", "	* Returns an index for the document found in the path path in this applicative session. If the returned value is 0, the document is not present in the applicative session. This method can be used for the interactive part of an application. For instance, on a call to Open, the document to be opened may already be in memory. IsInSession checks to see if this is the case. Open can be made to depend on the value of the index returned: if IsInSession returns 0, the document is opened; if it returns another value, a message is displayed asking the user if he wants to override the version of the document in memory. Example: Standard_Integer insession = A->IsInSession(aDoc); if (insession > 0) { cout << 'document ' << insession << ' is already in session' << endl; return 0; }

	:param path:
	:type path: TCollection_ExtendedString &
	:rtype: int
") IsInSession;
		Standard_Integer IsInSession (const TCollection_ExtendedString & path);
		%feature("compactdefaultargs") MessageDriver;
		%feature("autodoc", "	* Redefines message driver, by default outputs to cout.

	:rtype: Handle_CDM_MessageDriver
") MessageDriver;
		virtual Handle_CDM_MessageDriver MessageDriver ();
		%feature("compactdefaultargs") NbDocuments;
		%feature("autodoc", "	* returns the number of documents handled by the current applicative session.

	:rtype: int
") NbDocuments;
		Standard_Integer NbDocuments ();
		%feature("compactdefaultargs") NewDocument;
		%feature("autodoc", "	* Constructs the empty new document aDoc. This document will have the format format. If InitDocument is redefined for a specific application, the new document is handled by the applicative session.

	:param format:
	:type format: TCollection_ExtendedString &
	:param aDoc:
	:type aDoc: Handle_TDocStd_Document &
	:rtype: void
") NewDocument;
		virtual void NewDocument (const TCollection_ExtendedString & format,Handle_TDocStd_Document & aDoc);
		%feature("compactdefaultargs") OnAbortTransaction;
		%feature("autodoc", "	* Notification that is fired at each AbortTransaction event.

	:param theDoc:
	:type theDoc: Handle_TDocStd_Document &
	:rtype: void
") OnAbortTransaction;
		virtual void OnAbortTransaction (const Handle_TDocStd_Document & theDoc);
		%feature("compactdefaultargs") OnCommitTransaction;
		%feature("autodoc", "	* Notification that is fired at each CommitTransaction event.

	:param theDoc:
	:type theDoc: Handle_TDocStd_Document &
	:rtype: void
") OnCommitTransaction;
		virtual void OnCommitTransaction (const Handle_TDocStd_Document & theDoc);
		%feature("compactdefaultargs") OnOpenTransaction;
		%feature("autodoc", "	* Notification that is fired at each OpenTransaction event.

	:param theDoc:
	:type theDoc: Handle_TDocStd_Document &
	:rtype: void
") OnOpenTransaction;
		virtual void OnOpenTransaction (const Handle_TDocStd_Document & theDoc);
		%feature("compactdefaultargs") Open;
		%feature("autodoc", "	* Retrieves the document aDoc stored under the name aName in the directory directory. In order not to override a version of aDoc which is already in memory, this method can be made to depend on the value returned by IsInSession.

	:param path:
	:type path: TCollection_ExtendedString &
	:param aDoc:
	:type aDoc: Handle_TDocStd_Document &
	:rtype: PCDM_ReaderStatus
") Open;
		PCDM_ReaderStatus Open (const TCollection_ExtendedString & path,Handle_TDocStd_Document & aDoc);
		%feature("compactdefaultargs") Open;
		%feature("autodoc", "	* Retrieves aDoc from standard SEEKABLE stream theIStream. the stream should support SEEK fuctionality

	:param theIStream:
	:type theIStream: Standard_IStream &
	:param theDoc:
	:type theDoc: Handle_TDocStd_Document &
	:rtype: PCDM_ReaderStatus
") Open;
		PCDM_ReaderStatus Open (Standard_IStream & theIStream,Handle_TDocStd_Document & theDoc);
		%feature("compactdefaultargs") ReadingFormats;
		%feature("autodoc", "	* Returns the sequence of reading formats supported by the application. //! @param theFormats - sequence of reading formats. Output parameter.

	:param theFormats:
	:type theFormats: TColStd_SequenceOfAsciiString &
	:rtype: None
") ReadingFormats;
		void ReadingFormats (TColStd_SequenceOfAsciiString & theFormats);
		%feature("compactdefaultargs") Resources;
		%feature("autodoc", "	* Returns resource manager defining supported persistent formats. //! Default implementation loads resource file with name ResourcesName(), unless field myResources is already initialized (either by previous call or in any other way). //! The resource manager should define: //! * Format name for each file extension supported: - [Extension].FileFormat: [Format] //! * For each format supported (as returned by Formats()), its extension, description string, and (when applicable) GUIDs of storage and retrieval plugins: - [Format].Description: [Description] - [Format].FileExtension: [Extension] - [Format].RetrievalPlugin: [GUID] (optional) - [Format].StoragePlugin: [GUID] (optional)

	:rtype: Handle_Resource_Manager
") Resources;
		virtual Handle_Resource_Manager Resources ();
		%feature("compactdefaultargs") ResourcesName;
		%feature("autodoc", "	* Returns the name of the file containing the resources of this application, for support of legacy method of loading formats data from resource files. //! Method DefineFormat() can be used to define all necessary parameters explicitly without actually using resource files. //! In a resource file, the application associates the schema name of the document with the storage and retrieval plug-ins that are to be loaded for each document. On retrieval, the application reads the schema name in the heading of the CSF file and loads the plug-in indicated in the resource file. This plug-in instantiates the actual driver for transient-persistent conversion. Your application can bring this process into play by defining a class which inherits CDF_Application and redefines the function which returns the appropriate resources file. At this point, the function Retrieve and the class CDF_Store can be called. This allows you to deal with storage and retrieval of - as well as copying and pasting - documents. To implement a class like this, several virtual functions should be redefined. In particular, you must redefine the abstract function Resources inherited from the superclass CDM_Application. //! Default implementation returns empty string.

	:rtype: char *
") ResourcesName;
		virtual const char * ResourcesName ();
		%feature("compactdefaultargs") Save;
		%feature("autodoc", "	* Save aDoc active document. Exceptions: Standard_NotImplemented if the document was not retrieved in the applicative session by using Open.

	:param aDoc:
	:type aDoc: Handle_TDocStd_Document &
	:rtype: PCDM_StoreStatus
") Save;
		PCDM_StoreStatus Save (const Handle_TDocStd_Document & aDoc);
		%feature("compactdefaultargs") Save;
		%feature("autodoc", "	* Save the document overwriting the previous file

	:param aDoc:
	:type aDoc: Handle_TDocStd_Document &
	:param theStatusMessage:
	:type theStatusMessage: TCollection_ExtendedString &
	:rtype: PCDM_StoreStatus
") Save;
		PCDM_StoreStatus Save (const Handle_TDocStd_Document & aDoc,TCollection_ExtendedString & theStatusMessage);
		%feature("compactdefaultargs") SaveAs;
		%feature("autodoc", "	* Save the active document in the file <name> in the path <path> ; o verwrites the file if it already exists.

	:param aDoc:
	:type aDoc: Handle_TDocStd_Document &
	:param path:
	:type path: TCollection_ExtendedString &
	:rtype: PCDM_StoreStatus
") SaveAs;
		PCDM_StoreStatus SaveAs (const Handle_TDocStd_Document & aDoc,const TCollection_ExtendedString & path);
		%feature("compactdefaultargs") SaveAs;
		%feature("autodoc", "	* Save theDoc to standard SEEKABLE stream theOStream. the stream should support SEEK fuctionality

	:param theDoc:
	:type theDoc: Handle_TDocStd_Document &
	:param theOStream:
	:type theOStream: Standard_OStream &
	:rtype: PCDM_StoreStatus
") SaveAs;
		PCDM_StoreStatus SaveAs (const Handle_TDocStd_Document & theDoc,Standard_OStream & theOStream);
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
		%feature("compactdefaultargs") SaveAs;
		%feature("autodoc", "	* Save theDoc TO standard SEEKABLE stream theOStream. the stream should support SEEK fuctionality

	:param theDoc:
	:type theDoc: Handle_TDocStd_Document &
	:param theOStream:
	:type theOStream: Standard_OStream &
	:param theStatusMessage:
	:type theStatusMessage: TCollection_ExtendedString &
	:rtype: PCDM_StoreStatus
") SaveAs;
		PCDM_StoreStatus SaveAs (const Handle_TDocStd_Document & theDoc,Standard_OStream & theOStream,TCollection_ExtendedString & theStatusMessage);
		%feature("compactdefaultargs") TDocStd_Application;
		%feature("autodoc", "	* Constructs the new instance and registers it in CDM_Session

	:rtype: None
") TDocStd_Application;
		 TDocStd_Application ();
		%feature("compactdefaultargs") WritingFormats;
		%feature("autodoc", "	* Returns the sequence of writing formats supported by the application. //! @param theFormats - sequence of writing formats. Output parameter.

	:param theFormats:
	:type theFormats: TColStd_SequenceOfAsciiString &
	:rtype: None
") WritingFormats;
		void WritingFormats (TColStd_SequenceOfAsciiString & theFormats);
};


%make_alias(TDocStd_Application)

%extend TDocStd_Application {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TDocStd_ApplicationDelta;
class TDocStd_ApplicationDelta : public Standard_Transient {
	public:

        %feature("autodoc", "1");
        %extend{
            std::string DumpToString() {
            std::stringstream s;
            self->Dump(s);
            return s.str();}
        };
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
		%feature("compactdefaultargs") TDocStd_ApplicationDelta;
		%feature("autodoc", "	:rtype: None
") TDocStd_ApplicationDelta;
		 TDocStd_ApplicationDelta ();
};


%make_alias(TDocStd_ApplicationDelta)

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


%make_alias(TDocStd_CompoundDelta)

%extend TDocStd_CompoundDelta {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TDocStd_Context;
class TDocStd_Context {
	public:
		%feature("compactdefaultargs") ModifiedReferences;
		%feature("autodoc", "	:rtype: bool
") ModifiedReferences;
		Standard_Boolean ModifiedReferences ();
		%feature("compactdefaultargs") SetModifiedReferences;
		%feature("autodoc", "	:param Mod:
	:type Mod: bool
	:rtype: None
") SetModifiedReferences;
		void SetModifiedReferences (const Standard_Boolean Mod);
		%feature("compactdefaultargs") TDocStd_Context;
		%feature("autodoc", "	:rtype: None
") TDocStd_Context;
		 TDocStd_Context ();
};


%extend TDocStd_Context {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TDocStd_Document;
class TDocStd_Document : public CDM_Document {
	public:
		%feature("compactdefaultargs") AbortCommand;
		%feature("autodoc", "	* Abort the Command transaction. Does nothing If there is no Command transaction open.

	:rtype: None
") AbortCommand;
		void AbortCommand ();
		%feature("compactdefaultargs") BeforeClose;
		%feature("autodoc", "	* Prepares document for closing

	:rtype: void
") BeforeClose;
		virtual void BeforeClose ();
		%feature("compactdefaultargs") ChangeStorageFormat;
		%feature("autodoc", "	* methods for the nested transaction mode

	:param newStorageFormat:
	:type newStorageFormat: TCollection_ExtendedString &
	:rtype: void
") ChangeStorageFormat;
		virtual void ChangeStorageFormat (const TCollection_ExtendedString & newStorageFormat);
		%feature("compactdefaultargs") ClearRedos;
		%feature("autodoc", "	* Remove all stored Redos

	:rtype: None
") ClearRedos;
		void ClearRedos ();
		%feature("compactdefaultargs") ClearUndos;
		%feature("autodoc", "	* Remove all stored Undos and Redos

	:rtype: None
") ClearUndos;
		void ClearUndos ();
		%feature("compactdefaultargs") CommitCommand;
		%feature("autodoc", "	* Commits documents transactions and fills the transaction manager with documents that have been changed during the transaction. If no command transaction is open, nothing is done. Returns True if a new delta has been added to myUndos.

	:rtype: bool
") CommitCommand;
		Standard_Boolean CommitCommand ();
		%feature("compactdefaultargs") EmptyLabelsSavingMode;
		%feature("autodoc", "	* Returns saving mode for empty labels.

	:rtype: bool
") EmptyLabelsSavingMode;
		Standard_Boolean EmptyLabelsSavingMode ();
		%feature("compactdefaultargs") Get;
		%feature("autodoc", "	* Will Abort any execution, clear fields returns the document which contains <L>. raises an exception if the document is not found.

	:param L:
	:type L: TDF_Label &
	:rtype: Handle_TDocStd_Document
") Get;
		static Handle_TDocStd_Document Get (const TDF_Label & L);
		%feature("compactdefaultargs") GetAvailableRedos;
		%feature("autodoc", "	* Returns the number of redos stored in this document. If this figure is greater than 0, the method Redo can be used.

	:rtype: int
") GetAvailableRedos;
		Standard_Integer GetAvailableRedos ();
		%feature("compactdefaultargs") GetAvailableUndos;
		%feature("autodoc", "	* Returns the number of undos stored in this document. If this figure is greater than 0, the method Undo can be used.

	:rtype: int
") GetAvailableUndos;
		Standard_Integer GetAvailableUndos ();
		%feature("compactdefaultargs") GetData;
		%feature("autodoc", "	:rtype: Handle_TDF_Data
") GetData;
		Handle_TDF_Data GetData ();
		%feature("compactdefaultargs") GetModified;
		%feature("autodoc", "	* Returns the labels which have been modified in this document.

	:rtype: TDF_LabelMap
") GetModified;
		const TDF_LabelMap & GetModified ();
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
		%feature("compactdefaultargs") GetRedos;
		%feature("autodoc", "	:rtype: TDF_DeltaList
") GetRedos;
		const TDF_DeltaList & GetRedos ();
		%feature("compactdefaultargs") GetSavedTime;
		%feature("autodoc", "	* Returns value of <mySavedTime> to be used later in SetSavedTime()

	:rtype: int
") GetSavedTime;
		Standard_Integer GetSavedTime ();
		%feature("compactdefaultargs") GetUndoLimit;
		%feature("autodoc", "	* The current limit on the number of undos

	:rtype: int
") GetUndoLimit;
		Standard_Integer GetUndoLimit ();
		%feature("compactdefaultargs") GetUndos;
		%feature("autodoc", "	:rtype: TDF_DeltaList
") GetUndos;
		const TDF_DeltaList & GetUndos ();
		%feature("compactdefaultargs") HasOpenCommand;
		%feature("autodoc", "	* returns True if a Command transaction is open in the curret .

	:rtype: bool
") HasOpenCommand;
		Standard_Boolean HasOpenCommand ();
		%feature("compactdefaultargs") InitDeltaCompaction;
		%feature("autodoc", "	* Initializes the procedure of delta compaction Returns false if there is no delta to compact Marks the last delta as a 'from' delta

	:rtype: bool
") InitDeltaCompaction;
		Standard_Boolean InitDeltaCompaction ();
		%feature("compactdefaultargs") IsChanged;
		%feature("autodoc", "	* returns True if document differs from the state of last saving. this method have to be called only wroking in the transaction mode

	:rtype: bool
") IsChanged;
		Standard_Boolean IsChanged ();
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "	* Returns True if the main label has no attributes

	:rtype: bool
") IsEmpty;
		Standard_Boolean IsEmpty ();
		%feature("compactdefaultargs") IsNestedTransactionMode;
		%feature("autodoc", "	* Returns Standard_True if mode is set

	:rtype: bool
") IsNestedTransactionMode;
		Standard_Boolean IsNestedTransactionMode ();
		%feature("compactdefaultargs") IsSaved;
		%feature("autodoc", "	* the document is saved in a file.

	:rtype: bool
") IsSaved;
		Standard_Boolean IsSaved ();
		%feature("compactdefaultargs") IsValid;
		%feature("autodoc", "	* Returns False if the document has been modified but not recomputed.

	:rtype: bool
") IsValid;
		Standard_Boolean IsValid ();
		%feature("compactdefaultargs") Main;
		%feature("autodoc", "	* Returns the main label in this data framework. By definition, this is the label with the entry 0:1.

	:rtype: TDF_Label
") Main;
		TDF_Label Main ();
		%feature("compactdefaultargs") ModificationMode;
		%feature("autodoc", "	* returns True if changes allowed only inside transactions

	:rtype: bool
") ModificationMode;
		Standard_Boolean ModificationMode ();
		%feature("compactdefaultargs") NewCommand;
		%feature("autodoc", "	* Launches a new command. This command may be undone.

	:rtype: None
") NewCommand;
		void NewCommand ();
		%feature("compactdefaultargs") OpenCommand;
		%feature("autodoc", "	* Opens a new command transaction in this document. You can use HasOpenCommand to see whether a command is already open. Exceptions Standard_DomainError if a command is already open in this document.

	:rtype: None
") OpenCommand;
		void OpenCommand ();
		%feature("compactdefaultargs") PerformDeltaCompaction;
		%feature("autodoc", "	* Performs the procedure of delta compaction Makes all deltas starting from 'from' delta till the last one to be one delta.

	:rtype: bool
") PerformDeltaCompaction;
		Standard_Boolean PerformDeltaCompaction ();
		%feature("compactdefaultargs") PurgeModified;
		%feature("autodoc", "	* Remove all modifications. After this call The document becomesagain Valid.

	:rtype: None
") PurgeModified;
		void PurgeModified ();
		%feature("compactdefaultargs") Recompute;
		%feature("autodoc", "	* Recompute if the document was not valid and propagate the reccorded modification.

	:rtype: None
") Recompute;
		void Recompute ();
		%feature("compactdefaultargs") Redo;
		%feature("autodoc", "	* Will REDO one step, returns False if no redo was done (Redos == 0). Otherwise, true is returned, and one step in the list of redoes is done again.

	:rtype: bool
") Redo;
		Standard_Boolean Redo ();
		%feature("compactdefaultargs") RemoveFirstUndo;
		%feature("autodoc", "	* Removes the first undo in the list of document undos. It is used in the application when the undo limit is exceed.

	:rtype: None
") RemoveFirstUndo;
		void RemoveFirstUndo ();
		%feature("compactdefaultargs") SetData;
		%feature("autodoc", "	:param data:
	:type data: Handle_TDF_Data &
	:rtype: None
") SetData;
		void SetData (const Handle_TDF_Data & data);
		%feature("compactdefaultargs") SetEmptyLabelsSavingMode;
		%feature("autodoc", "	* Sets saving mode for empty labels. If Standard_True, empty labels will be saved.

	:param isAllowed:
	:type isAllowed: bool
	:rtype: None
") SetEmptyLabelsSavingMode;
		void SetEmptyLabelsSavingMode (const Standard_Boolean isAllowed);
		%feature("compactdefaultargs") SetModificationMode;
		%feature("autodoc", "	* if theTransactionOnly is True changes is denied outside transactions

	:param theTransactionOnly:
	:type theTransactionOnly: bool
	:rtype: None
") SetModificationMode;
		void SetModificationMode (const Standard_Boolean theTransactionOnly);
		%feature("compactdefaultargs") SetModified;
		%feature("autodoc", "	* Notify the label as modified, the Document becomes UnValid. returns True if <L> has been notified as modified.

	:param L:
	:type L: TDF_Label &
	:rtype: None
") SetModified;
		void SetModified (const TDF_Label & L);
		%feature("compactdefaultargs") SetNestedTransactionMode;
		%feature("autodoc", "	* Sets nested transaction mode if isAllowed == Standard_True

	:param isAllowed: default value is Standard_True
	:type isAllowed: bool
	:rtype: None
") SetNestedTransactionMode;
		void SetNestedTransactionMode (const Standard_Boolean isAllowed = Standard_True);
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
		%feature("compactdefaultargs") SetUndoLimit;
		%feature("autodoc", "	* Set the limit on the number of Undo Delta stored 0 will disable Undo on the document A negative value means no limit. Note that by default Undo is disabled. Enabling it will take effect with the next call to NewCommand. Of course this limit is the same for Redo

	:param L:
	:type L: int
	:rtype: None
") SetUndoLimit;
		void SetUndoLimit (const Standard_Integer L);
		%feature("compactdefaultargs") StorageFormat;
		%feature("autodoc", "	:rtype: TCollection_ExtendedString
") StorageFormat;
		virtual TCollection_ExtendedString StorageFormat ();
		%feature("compactdefaultargs") TDocStd_Document;
		%feature("autodoc", "	* Constructs a document object defined by the string astorageformat.

	:param astorageformat:
	:type astorageformat: TCollection_ExtendedString &
	:rtype: None
") TDocStd_Document;
		 TDocStd_Document (const TCollection_ExtendedString & astorageformat);
		%feature("compactdefaultargs") Undo;
		%feature("autodoc", "	* Will UNDO one step, returns False if no undo was done (Undos == 0). Otherwise, true is returned and one step in the list of undoes is undone.

	:rtype: bool
") Undo;
		Standard_Boolean Undo ();
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
		%feature("compactdefaultargs") UpdateReferences;
		%feature("autodoc", "	* Set modifications on labels impacted by external references to the entry. The document becomes invalid and must be recomputed.

	:param aDocEntry:
	:type aDocEntry: TCollection_AsciiString &
	:rtype: None
") UpdateReferences;
		void UpdateReferences (const TCollection_AsciiString & aDocEntry);
};


%make_alias(TDocStd_Document)

%extend TDocStd_Document {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TDocStd_Modified;
class TDocStd_Modified : public TDF_Attribute {
	public:
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "	:param alabel:
	:type alabel: TDF_Label &
	:rtype: bool
") Add;
		static Standard_Boolean Add (const TDF_Label & alabel);
		%feature("compactdefaultargs") AddLabel;
		%feature("autodoc", "	* add <L> as modified

	:param L:
	:type L: TDF_Label &
	:rtype: bool
") AddLabel;
		Standard_Boolean AddLabel (const TDF_Label & L);
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	* remove all modified labels. becomes empty

	:param access:
	:type access: TDF_Label &
	:rtype: void
") Clear;
		static void Clear (const TDF_Label & access);
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") Contains;
		%feature("autodoc", "	:param alabel:
	:type alabel: TDF_Label &
	:rtype: bool
") Contains;
		static Standard_Boolean Contains (const TDF_Label & alabel);

        %feature("autodoc", "1");
        %extend{
            std::string DumpToString() {
            std::stringstream s;
            self->Dump(s);
            return s.str();}
        };
        		%feature("compactdefaultargs") Get;
		%feature("autodoc", "	* if <IsEmpty> raise an exception.

	:param access:
	:type access: TDF_Label &
	:rtype: TDF_LabelMap
") Get;
		static const TDF_LabelMap & Get (const TDF_Label & access);
		%feature("compactdefaultargs") Get;
		%feature("autodoc", "	* returns modified label map

	:rtype: TDF_LabelMap
") Get;
		const TDF_LabelMap & Get ();
		%feature("compactdefaultargs") GetID;
		%feature("autodoc", "	* Modified methods ================

	:rtype: Standard_GUID
") GetID;
		static const Standard_GUID & GetID ();
		%feature("compactdefaultargs") ID;
		%feature("autodoc", "	:rtype: Standard_GUID
") ID;
		const Standard_GUID & ID ();
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "	* API class methods =================

	:param access:
	:type access: TDF_Label &
	:rtype: bool
") IsEmpty;
		static Standard_Boolean IsEmpty (const TDF_Label & access);
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "	:rtype: bool
") IsEmpty;
		Standard_Boolean IsEmpty ();
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
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	:param alabel:
	:type alabel: TDF_Label &
	:rtype: bool
") Remove;
		static Standard_Boolean Remove (const TDF_Label & alabel);
		%feature("compactdefaultargs") RemoveLabel;
		%feature("autodoc", "	* remove <L> as modified

	:param L:
	:type L: TDF_Label &
	:rtype: bool
") RemoveLabel;
		Standard_Boolean RemoveLabel (const TDF_Label & L);
		%feature("compactdefaultargs") Restore;
		%feature("autodoc", "	:param With:
	:type With: Handle_TDF_Attribute &
	:rtype: None
") Restore;
		void Restore (const Handle_TDF_Attribute & With);
		%feature("compactdefaultargs") TDocStd_Modified;
		%feature("autodoc", "	:rtype: None
") TDocStd_Modified;
		 TDocStd_Modified ();
};


%make_alias(TDocStd_Modified)

%extend TDocStd_Modified {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TDocStd_MultiTransactionManager;
class TDocStd_MultiTransactionManager : public Standard_Transient {
	public:
		%feature("compactdefaultargs") AbortCommand;
		%feature("autodoc", "	* Unsets the flag of started manager transaction and aborts transaction in each document.

	:rtype: None
") AbortCommand;
		void AbortCommand ();
		%feature("compactdefaultargs") AddDocument;
		%feature("autodoc", "	* Adds the document to the transaction manager and checks if it has been already added

	:param theDoc:
	:type theDoc: Handle_TDocStd_Document &
	:rtype: None
") AddDocument;
		void AddDocument (const Handle_TDocStd_Document & theDoc);
		%feature("compactdefaultargs") ClearRedos;
		%feature("autodoc", "	* Clears redos in the manager and in documents.

	:rtype: None
") ClearRedos;
		void ClearRedos ();
		%feature("compactdefaultargs") ClearUndos;
		%feature("autodoc", "	* Clears undos in the manager and in documents.

	:rtype: None
") ClearUndos;
		void ClearUndos ();
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
		%feature("compactdefaultargs") Documents;
		%feature("autodoc", "	* Returns the added documents to the transaction manager.

	:rtype: TDocStd_SequenceOfDocument
") Documents;
		const TDocStd_SequenceOfDocument & Documents ();

        %feature("autodoc", "1");
        %extend{
            std::string DumpTransactionToString() {
            std::stringstream s;
            self->DumpTransaction(s);
            return s.str();}
        };
        		%feature("compactdefaultargs") GetAvailableRedos;
		%feature("autodoc", "	* Returns available manager redos.

	:rtype: TDocStd_SequenceOfApplicationDelta
") GetAvailableRedos;
		const TDocStd_SequenceOfApplicationDelta & GetAvailableRedos ();
		%feature("compactdefaultargs") GetAvailableUndos;
		%feature("autodoc", "	* Returns available manager undos.

	:rtype: TDocStd_SequenceOfApplicationDelta
") GetAvailableUndos;
		const TDocStd_SequenceOfApplicationDelta & GetAvailableUndos ();
		%feature("compactdefaultargs") GetUndoLimit;
		%feature("autodoc", "	* Returns undo limit for the manager.

	:rtype: int
") GetUndoLimit;
		Standard_Integer GetUndoLimit ();
		%feature("compactdefaultargs") HasOpenCommand;
		%feature("autodoc", "	* Returns true if a transaction is opened.

	:rtype: bool
") HasOpenCommand;
		Standard_Boolean HasOpenCommand ();
		%feature("compactdefaultargs") IsNestedTransactionMode;
		%feature("autodoc", "	* Returns Standard_True if NestedTransaction mode is set. Methods for protection of changes outside transactions

	:rtype: bool
") IsNestedTransactionMode;
		Standard_Boolean IsNestedTransactionMode ();
		%feature("compactdefaultargs") ModificationMode;
		%feature("autodoc", "	* Returns True if changes are allowed only inside transactions.

	:rtype: bool
") ModificationMode;
		Standard_Boolean ModificationMode ();
		%feature("compactdefaultargs") OpenCommand;
		%feature("autodoc", "	* Opens transaction in each document and sets the flag that transaction is opened. If there are already opened transactions in the documents, these transactions will be aborted before openning new ones.

	:rtype: None
") OpenCommand;
		void OpenCommand ();
		%feature("compactdefaultargs") Redo;
		%feature("autodoc", "	* Redoes the current transaction of the application. It calls the Redo () method of the document being on top of the manager list of redos (list.First()) and moves the list item to the top of the list of manager undos (list.Prepend(item)).

	:rtype: None
") Redo;
		void Redo ();
		%feature("compactdefaultargs") RemoveDocument;
		%feature("autodoc", "	* Removes the document from the transaction manager.

	:param theDoc:
	:type theDoc: Handle_TDocStd_Document &
	:rtype: None
") RemoveDocument;
		void RemoveDocument (const Handle_TDocStd_Document & theDoc);
		%feature("compactdefaultargs") RemoveLastUndo;
		%feature("autodoc", "	* Removes undo information from the list of undos of the manager and all documents which have been modified during the transaction.

	:rtype: None
") RemoveLastUndo;
		void RemoveLastUndo ();
		%feature("compactdefaultargs") SetModificationMode;
		%feature("autodoc", "	* If theTransactionOnly is True, denies all changes outside transactions.

	:param theTransactionOnly:
	:type theTransactionOnly: bool
	:rtype: None
") SetModificationMode;
		void SetModificationMode (const Standard_Boolean theTransactionOnly);
		%feature("compactdefaultargs") SetNestedTransactionMode;
		%feature("autodoc", "	* Sets nested transaction mode if isAllowed == Standard_True NOTE: field myIsNestedTransactionMode exists only for synchronization between several documents and has no effect on transactions of multitransaction manager.

	:param isAllowed: default value is Standard_True
	:type isAllowed: bool
	:rtype: None
") SetNestedTransactionMode;
		void SetNestedTransactionMode (const Standard_Boolean isAllowed = Standard_True);
		%feature("compactdefaultargs") SetUndoLimit;
		%feature("autodoc", "	* Sets undo limit for the manager and all documents.

	:param theLimit:
	:type theLimit: int
	:rtype: None
") SetUndoLimit;
		void SetUndoLimit (const Standard_Integer theLimit);
		%feature("compactdefaultargs") TDocStd_MultiTransactionManager;
		%feature("autodoc", "	* Constructor

	:rtype: None
") TDocStd_MultiTransactionManager;
		 TDocStd_MultiTransactionManager ();
		%feature("compactdefaultargs") Undo;
		%feature("autodoc", "	* Undoes the current transaction of the manager. It calls the Undo () method of the document being on top of the manager list of undos (list.First()) and moves the list item to the top of the list of manager redos (list.Prepend(item)).

	:rtype: None
") Undo;
		void Undo ();
};


%make_alias(TDocStd_MultiTransactionManager)

%extend TDocStd_MultiTransactionManager {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TDocStd_Owner;
class TDocStd_Owner : public TDF_Attribute {
	public:

        %feature("autodoc", "1");
        %extend{
            std::string DumpToString() {
            std::stringstream s;
            self->Dump(s);
            return s.str();}
        };
        		%feature("compactdefaultargs") GetDocument;
		%feature("autodoc", "	* Owner methods ===============

	:param ofdata:
	:type ofdata: Handle_TDF_Data &
	:rtype: Handle_TDocStd_Document
") GetDocument;
		static Handle_TDocStd_Document GetDocument (const Handle_TDF_Data & ofdata);
		%feature("compactdefaultargs") GetDocument;
		%feature("autodoc", "	:rtype: Handle_TDocStd_Document
") GetDocument;
		Handle_TDocStd_Document GetDocument ();
		%feature("compactdefaultargs") GetID;
		%feature("autodoc", "	* class methods =============

	:rtype: Standard_GUID
") GetID;
		static const Standard_GUID & GetID ();
		%feature("compactdefaultargs") ID;
		%feature("autodoc", "	:rtype: Standard_GUID
") ID;
		const Standard_GUID & ID ();
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
		%feature("compactdefaultargs") Restore;
		%feature("autodoc", "	:param With:
	:type With: Handle_TDF_Attribute &
	:rtype: None
") Restore;
		void Restore (const Handle_TDF_Attribute & With);
		%feature("compactdefaultargs") SetDocument;
		%feature("autodoc", "	:param indata:
	:type indata: Handle_TDF_Data &
	:param doc:
	:type doc: Handle_TDocStd_Document &
	:rtype: void
") SetDocument;
		static void SetDocument (const Handle_TDF_Data & indata,const Handle_TDocStd_Document & doc);
		%feature("compactdefaultargs") SetDocument;
		%feature("autodoc", "	:param document:
	:type document: Handle_TDocStd_Document &
	:rtype: None
") SetDocument;
		void SetDocument (const Handle_TDocStd_Document & document);
		%feature("compactdefaultargs") TDocStd_Owner;
		%feature("autodoc", "	:rtype: None
") TDocStd_Owner;
		 TDocStd_Owner ();
};


%make_alias(TDocStd_Owner)

%extend TDocStd_Owner {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TDocStd_PathParser;
class TDocStd_PathParser {
	public:
		%feature("compactdefaultargs") Extension;
		%feature("autodoc", "	:rtype: TCollection_ExtendedString
") Extension;
		TCollection_ExtendedString Extension ();
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "	:rtype: int
") Length;
		Standard_Integer Length ();
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "	:rtype: TCollection_ExtendedString
") Name;
		TCollection_ExtendedString Name ();
		%feature("compactdefaultargs") Parse;
		%feature("autodoc", "	:rtype: None
") Parse;
		void Parse ();
		%feature("compactdefaultargs") Path;
		%feature("autodoc", "	:rtype: TCollection_ExtendedString
") Path;
		TCollection_ExtendedString Path ();
		%feature("compactdefaultargs") TDocStd_PathParser;
		%feature("autodoc", "	:param path:
	:type path: TCollection_ExtendedString &
	:rtype: None
") TDocStd_PathParser;
		 TDocStd_PathParser (const TCollection_ExtendedString & path);
		%feature("compactdefaultargs") Trek;
		%feature("autodoc", "	:rtype: TCollection_ExtendedString
") Trek;
		TCollection_ExtendedString Trek ();
};


%extend TDocStd_PathParser {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TDocStd_XLink;
class TDocStd_XLink : public TDF_Attribute {
	public:
		%feature("compactdefaultargs") AfterAddition;
		%feature("autodoc", "	* Updates the XLinkRoot attribute by adding <self> to its list.

	:rtype: None
") AfterAddition;
		void AfterAddition ();
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

        %feature("autodoc", "1");
        %extend{
            std::string DumpToString() {
            std::stringstream s;
            self->Dump(s);
            return s.str();}
        };
        		%feature("compactdefaultargs") GetID;
		%feature("autodoc", "	* Returns the GUID for external links.

	:rtype: Standard_GUID
") GetID;
		static const Standard_GUID & GetID ();
		%feature("compactdefaultargs") ID;
		%feature("autodoc", "	* Returns the ID of the attribute.

	:rtype: Standard_GUID
") ID;
		const Standard_GUID & ID ();
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
		%feature("compactdefaultargs") Restore;
		%feature("autodoc", "	* Does nothing.

	:param anAttribute:
	:type anAttribute: Handle_TDF_Attribute &
	:rtype: None
") Restore;
		void Restore (const Handle_TDF_Attribute & anAttribute);
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
};


%make_alias(TDocStd_XLink)

%extend TDocStd_XLink {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TDocStd_XLinkIterator;
class TDocStd_XLinkIterator {
	public:
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
		%feature("compactdefaultargs") BackupCopy;
		%feature("autodoc", "	* Returns a null handle.

	:rtype: Handle_TDF_Attribute
") BackupCopy;
		Handle_TDF_Attribute BackupCopy ();

        %feature("autodoc", "1");
        %extend{
            std::string DumpToString() {
            std::stringstream s;
            self->Dump(s);
            return s.str();}
        };
        		%feature("compactdefaultargs") GetID;
		%feature("autodoc", "	* Returns the ID: 2a96b61d-ec8b-11d0-bee7-080009dc3333

	:rtype: Standard_GUID
") GetID;
		static const Standard_GUID & GetID ();
		%feature("compactdefaultargs") ID;
		%feature("autodoc", "	* Returns the ID of the attribute.

	:rtype: Standard_GUID
") ID;
		const Standard_GUID & ID ();
		%feature("compactdefaultargs") Insert;
		%feature("autodoc", "	* Inserts <anXLinkPtr> at the beginning of the XLink chain.

	:param anXLinkPtr:
	:type anXLinkPtr: TDocStd_XLinkPtr &
	:rtype: void
") Insert;
		static void Insert (const TDocStd_XLinkPtr & anXLinkPtr);
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
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	* Removes <anXLinkPtr> from the XLink chain, if it exists.

	:param anXLinkPtr:
	:type anXLinkPtr: TDocStd_XLinkPtr &
	:rtype: void
") Remove;
		static void Remove (const TDocStd_XLinkPtr & anXLinkPtr);
		%feature("compactdefaultargs") Restore;
		%feature("autodoc", "	* Does nothing.

	:param anAttribute:
	:type anAttribute: Handle_TDF_Attribute &
	:rtype: None
") Restore;
		void Restore (const Handle_TDF_Attribute & anAttribute);
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "	* Sets an empty XLinkRoot to Root or gets the existing one. Only one attribute per TDF_Data.

	:param aDF:
	:type aDF: Handle_TDF_Data &
	:rtype: Handle_TDocStd_XLinkRoot
") Set;
		static Handle_TDocStd_XLinkRoot Set (const Handle_TDF_Data & aDF);
};


%make_alias(TDocStd_XLinkRoot)

%extend TDocStd_XLinkRoot {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TDocStd_XLinkTool;
class TDocStd_XLinkTool {
	public:
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "	* Copy the content of <fromsource> under <intarget>. Noone link is registred. noone check is done. Example Handle_TDocStd_Document DOC, XDOC; TDF_Label L, XL; TDocStd_XLinkTool xlinktool; xlinktool.Copy(L,XL); Exceptions: Standard_DomainError if the contents of fromsource are not entirely in the scope of this label, in other words, are not self-contained. !!! ==> Warning: If the document manages shapes use the next way: TDocStd_XLinkTool xlinktool; xlinktool.Copy(L,XL); TopTools_DataMapOfShapeShape M; TNaming::ChangeShapes(target,M);

	:param intarget:
	:type intarget: TDF_Label &
	:param fromsource:
	:type fromsource: TDF_Label &
	:rtype: void
") Copy;
		virtual void Copy (const TDF_Label & intarget,const TDF_Label & fromsource);
		%feature("compactdefaultargs") CopyWithLink;
		%feature("autodoc", "	* Copies the content of the label <fromsource> to the label <intarget>. The link is registred with an XLink attribute by <intarget> label. if the content of <fromsource> is not self-contained, and/or <intarget> has already an XLink attribute, an exception is raised.

	:param intarget:
	:type intarget: TDF_Label &
	:param fromsource:
	:type fromsource: TDF_Label &
	:rtype: None
") CopyWithLink;
		void CopyWithLink (const TDF_Label & intarget,const TDF_Label & fromsource);
		%feature("compactdefaultargs") DataSet;
		%feature("autodoc", "	:rtype: Handle_TDF_DataSet
") DataSet;
		Handle_TDF_DataSet DataSet ();
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
		%feature("compactdefaultargs") RelocationTable;
		%feature("autodoc", "	:rtype: Handle_TDF_RelocationTable
") RelocationTable;
		Handle_TDF_RelocationTable RelocationTable ();
		%feature("compactdefaultargs") TDocStd_XLinkTool;
		%feature("autodoc", "	:rtype: None
") TDocStd_XLinkTool;
		 TDocStd_XLinkTool ();
		%feature("compactdefaultargs") UpdateLink;
		%feature("autodoc", "	* Update the external reference set at <L>. Example Handle_TDocStd_Document aDoc; if (!OCAFTest::GetDocument(1,aDoc)) return 1; Handle_TDataStd_Reference aRef; TDocStd_XLinkTool xlinktool; if (!OCAFTest::Find(aDoc,2),TDataStd_Reference::GetID(),aRef) return 1; xlinktool.UpdateLink(aRef->Label()); Exceptions Standard_DomainError if <L> has no XLink attribute.

	:param L:
	:type L: TDF_Label &
	:rtype: None
") UpdateLink;
		void UpdateLink (const TDF_Label & L);
};


%extend TDocStd_XLinkTool {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
/* harray1 class */
/* harray2 class */
/* harray2 class */
