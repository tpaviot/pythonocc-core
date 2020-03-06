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
%define TDOCSTDDOCSTRING
"TDocStd module, see official documentation at
https://www.opencascade.com/doc/occt-7.4.0/refman/html/package_tdocstd.html"
%enddef
%module (package="OCC.Core", docstring=TDOCSTDDOCSTRING) TDocStd


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
#include<TDocStd_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<TDF_module.hxx>
#include<CDF_module.hxx>
#include<TCollection_module.hxx>
#include<PCDM_module.hxx>
#include<Message_module.hxx>
#include<TColStd_module.hxx>
#include<Resource_module.hxx>
#include<CDM_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import TDF.i
%import CDF.i
%import TCollection.i
%import PCDM.i
%import Message.i
%import TColStd.i
%import Resource.i
%import CDM.i

%pythoncode {
from OCC.Core.Exception import *
};

/* public enums */
/* end public enums declaration */

/* python proy classes for enums */
%pythoncode {
};
/* end python proxy for enums */

/* handles */
%wrap_handle(TDocStd_Application)
%wrap_handle(TDocStd_ApplicationDelta)
%wrap_handle(TDocStd_CompoundDelta)
%wrap_handle(TDocStd_Document)
%wrap_handle(TDocStd_Modified)
%wrap_handle(TDocStd_MultiTransactionManager)
%wrap_handle(TDocStd_Owner)
%wrap_handle(TDocStd_XLink)
%wrap_handle(TDocStd_XLinkRoot)
/* end handles declaration */

/* templates */
%template(TDocStd_LabelIDMapDataMap) NCollection_DataMap<TDF_Label,TDF_IDMap,TDF_LabelMapHasher>;
%template(TDocStd_SequenceOfApplicationDelta) NCollection_Sequence<opencascade::handle<TDocStd_ApplicationDelta>>;
%template(TDocStd_SequenceOfDocument) NCollection_Sequence<opencascade::handle<TDocStd_Document>>;
/* end templates declaration */

/* typedefs */
typedef NCollection_DataMap<TDF_Label, TDF_IDMap, TDF_LabelMapHasher>::Iterator TDocStd_DataMapIteratorOfLabelIDMapDataMap;
typedef NCollection_DataMap<TDF_Label, TDF_IDMap, TDF_LabelMapHasher> TDocStd_LabelIDMapDataMap;
typedef NCollection_Sequence<opencascade::handle<TDocStd_ApplicationDelta>> TDocStd_SequenceOfApplicationDelta;
typedef NCollection_Sequence<opencascade::handle<TDocStd_Document>> TDocStd_SequenceOfDocument;
typedef TDocStd_XLink * TDocStd_XLinkPtr;
/* end typedefs declaration */

/****************
* class TDocStd *
****************/
%rename(tdocstd) TDocStd;
class TDocStd {
	public:
		/****************** IDList ******************/
		%feature("compactdefaultargs") IDList;
		%feature("autodoc", "Specific guid of this package ============================= appends to <anidlist> the list of the attributes ids of this package. caution: <anidlist> is not cleared before use.

Parameters
----------
anIDList: TDF_IDList

Returns
-------
None
") IDList;
		static void IDList(TDF_IDList & anIDList);

};


%extend TDocStd {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************
* class TDocStd_Application *
****************************/
class TDocStd_Application : public CDF_Application {
	public:
		/****************** TDocStd_Application ******************/
		%feature("compactdefaultargs") TDocStd_Application;
		%feature("autodoc", "Constructs the new instance and registers it in cdm_session.

Returns
-------
None
") TDocStd_Application;
		 TDocStd_Application();

		/****************** Close ******************/
		%feature("compactdefaultargs") Close;
		%feature("autodoc", "Close the given document. the document is not any more handled by the applicative session.

Parameters
----------
aDoc: TDocStd_Document

Returns
-------
None
") Close;
		void Close(const opencascade::handle<TDocStd_Document> & aDoc);

		/****************** DefineFormat ******************/
		%feature("compactdefaultargs") DefineFormat;
		%feature("autodoc", "Sets up resources and registers read and storage drivers for the specified format. @param theformat - unique name for the format, used to identify it. @param thedescription - textual description of the format. @param theextension - extension of the files in that format. the same extension can be used by several formats. @param thereader - instance of the read driver for the format.  null value is allowed (no possibility to read). @param thewriter - instance of the write driver for the format.  null value is allowed (no possibility to write).

Parameters
----------
theFormat: TCollection_AsciiString
theDescription: TCollection_AsciiString
theExtension: TCollection_AsciiString
theReader: PCDM_RetrievalDriver
theWriter: PCDM_StorageDriver

Returns
-------
None
") DefineFormat;
		void DefineFormat(const TCollection_AsciiString & theFormat, const TCollection_AsciiString & theDescription, const TCollection_AsciiString & theExtension, const opencascade::handle<PCDM_RetrievalDriver> & theReader, const opencascade::handle<PCDM_StorageDriver> & theWriter);

		/****************** GetDocument ******************/
		%feature("compactdefaultargs") GetDocument;
		%feature("autodoc", "Constructs the new document adoc. adoc is identified by the index index which is any integer between 1 and n where n is the number of documents returned by nbdocument. example opencascade::handle<tdocstd_application> anapp; if (!caftest::find(a)) return 1; opencascade::handle<tdocstd> adoc; standard_integer nbdoc = anapp->nbdocuments(); for (standard_integer i = 1; i <= nbdoc; i++) { aapp->getdocument(i,adoc);.

Parameters
----------
index: int
aDoc: TDocStd_Document

Returns
-------
None
") GetDocument;
		void GetDocument(const Standard_Integer index, opencascade::handle<TDocStd_Document> & aDoc);

		/****************** InitDocument ******************/
		%feature("compactdefaultargs") InitDocument;
		%feature("autodoc", "Initialize the document adoc for the applicative session. this virtual function is called by newdocument and is to be redefined for each specific application. modified flag (different of disk version) ============= to open/save a document =======================.

Parameters
----------
aDoc: TDocStd_Document

Returns
-------
None
") InitDocument;
		virtual void InitDocument(const opencascade::handle<TDocStd_Document> & aDoc);

		/****************** IsDriverLoaded ******************/
		%feature("compactdefaultargs") IsDriverLoaded;
		%feature("autodoc", "Check if meta data driver was successfully loaded by the application constructor.

Returns
-------
bool
") IsDriverLoaded;
		Standard_Boolean IsDriverLoaded();

		/****************** IsInSession ******************/
		%feature("compactdefaultargs") IsInSession;
		%feature("autodoc", "Returns an index for the document found in the path path in this applicative session. if the returned value is 0, the document is not present in the applicative session. this method can be used for the interactive part of an application. for instance, on a call to open, the document to be opened may already be in memory. isinsession checks to see if this is the case. open can be made to depend on the value of the index returned: if isinsession returns 0, the document is opened; if it returns another value, a message is displayed asking the user if he wants to override the version of the document in memory. example: standard_integer insession = a->isinsession(adoc); if (insession > 0) { std::cout << 'document ' << insession << ' is already in session' << std::endl; return 0; }.

Parameters
----------
path: TCollection_ExtendedString

Returns
-------
int
") IsInSession;
		Standard_Integer IsInSession(const TCollection_ExtendedString & path);

		/****************** MessageDriver ******************/
		%feature("compactdefaultargs") MessageDriver;
		%feature("autodoc", "Redefines message driver, by default outputs to std::cout.

Returns
-------
opencascade::handle<Message_Messenger>
") MessageDriver;
		virtual opencascade::handle<Message_Messenger> MessageDriver();

		/****************** NbDocuments ******************/
		%feature("compactdefaultargs") NbDocuments;
		%feature("autodoc", "Returns the number of documents handled by the current applicative session.

Returns
-------
int
") NbDocuments;
		Standard_Integer NbDocuments();

		/****************** NewDocument ******************/
		%feature("compactdefaultargs") NewDocument;
		%feature("autodoc", "Constructs the empty new document adoc. this document will have the format format. if initdocument is redefined for a specific application, the new document is handled by the applicative session.

Parameters
----------
format: TCollection_ExtendedString
aDoc: TDocStd_Document

Returns
-------
None
") NewDocument;
		virtual void NewDocument(const TCollection_ExtendedString & format, opencascade::handle<TDocStd_Document> & aDoc);

		/****************** OnAbortTransaction ******************/
		%feature("compactdefaultargs") OnAbortTransaction;
		%feature("autodoc", "Notification that is fired at each aborttransaction event.

Parameters
----------
theDoc: TDocStd_Document

Returns
-------
None
") OnAbortTransaction;
		virtual void OnAbortTransaction(const opencascade::handle<TDocStd_Document> & theDoc);

		/****************** OnCommitTransaction ******************/
		%feature("compactdefaultargs") OnCommitTransaction;
		%feature("autodoc", "Notification that is fired at each committransaction event.

Parameters
----------
theDoc: TDocStd_Document

Returns
-------
None
") OnCommitTransaction;
		virtual void OnCommitTransaction(const opencascade::handle<TDocStd_Document> & theDoc);

		/****************** OnOpenTransaction ******************/
		%feature("compactdefaultargs") OnOpenTransaction;
		%feature("autodoc", "Notification that is fired at each opentransaction event.

Parameters
----------
theDoc: TDocStd_Document

Returns
-------
None
") OnOpenTransaction;
		virtual void OnOpenTransaction(const opencascade::handle<TDocStd_Document> & theDoc);

		/****************** Open ******************/
		%feature("compactdefaultargs") Open;
		%feature("autodoc", "Retrieves the document adoc stored under the name aname in the directory directory. in order not to override a version of adoc which is already in memory, this method can be made to depend on the value returned by isinsession.

Parameters
----------
path: TCollection_ExtendedString
aDoc: TDocStd_Document

Returns
-------
PCDM_ReaderStatus
") Open;
		PCDM_ReaderStatus Open(const TCollection_ExtendedString & path, opencascade::handle<TDocStd_Document> & aDoc);

		/****************** ReadingFormats ******************/
		%feature("compactdefaultargs") ReadingFormats;
		%feature("autodoc", "Returns the sequence of reading formats supported by the application. //! @param theformats - sequence of reading formats. output parameter.

Parameters
----------
theFormats: TColStd_SequenceOfAsciiString

Returns
-------
None
") ReadingFormats;
		void ReadingFormats(TColStd_SequenceOfAsciiString & theFormats);

		/****************** Resources ******************/
		%feature("compactdefaultargs") Resources;
		%feature("autodoc", "Returns resource manager defining supported persistent formats. //! default implementation loads resource file with name resourcesname(), unless field myresources is already initialized (either by previous call or in any other way). //! the resource manager should define: //! * format name for each file extension supported: - [extension].fileformat: [format] //! * for each format supported (as returned by formats()), its extension, description string, and (when applicable) guids of storage and retrieval plugins: - [format].description: [description] - [format].fileextension: [extension] - [format].retrievalplugin: [guid] (optional) - [format].storageplugin: [guid] (optional).

Returns
-------
opencascade::handle<Resource_Manager>
") Resources;
		virtual opencascade::handle<Resource_Manager> Resources();

		/****************** ResourcesName ******************/
		%feature("compactdefaultargs") ResourcesName;
		%feature("autodoc", "Returns the name of the file containing the resources of this application, for support of legacy method of loading formats data from resource files. //! method defineformat() can be used to define all necessary parameters explicitly without actually using resource files. //! in a resource file, the application associates the schema name of the document with the storage and retrieval plug-ins that are to be loaded for each document. on retrieval, the application reads the schema name in the heading of the csf file and loads the plug-in indicated in the resource file. this plug-in instantiates the actual driver for transient-persistent conversion. your application can bring this process into play by defining a class which inherits cdf_application and redefines the function which returns the appropriate resources file. at this point, the function retrieve and the class cdf_store can be called. this allows you to deal with storage and retrieval of - as well as copying and pasting - documents. to implement a class like this, several virtual functions should be redefined. in particular, you must redefine the abstract function resources inherited from the superclass cdm_application. //! default implementation returns empty string.

Returns
-------
char *
") ResourcesName;
		virtual const char * ResourcesName();

		/****************** Save ******************/
		%feature("compactdefaultargs") Save;
		%feature("autodoc", "Save adoc active document. exceptions: standard_notimplemented if the document was not retrieved in the applicative session by using open.

Parameters
----------
aDoc: TDocStd_Document

Returns
-------
PCDM_StoreStatus
") Save;
		PCDM_StoreStatus Save(const opencascade::handle<TDocStd_Document> & aDoc);

		/****************** Save ******************/
		%feature("compactdefaultargs") Save;
		%feature("autodoc", "Save the document overwriting the previous file.

Parameters
----------
aDoc: TDocStd_Document
theStatusMessage: TCollection_ExtendedString

Returns
-------
PCDM_StoreStatus
") Save;
		PCDM_StoreStatus Save(const opencascade::handle<TDocStd_Document> & aDoc, TCollection_ExtendedString & theStatusMessage);

		/****************** SaveAs ******************/
		%feature("compactdefaultargs") SaveAs;
		%feature("autodoc", "Save the active document in the file <name> in the path <path> ; o verwrites the file if it already exists.

Parameters
----------
aDoc: TDocStd_Document
path: TCollection_ExtendedString

Returns
-------
PCDM_StoreStatus
") SaveAs;
		PCDM_StoreStatus SaveAs(const opencascade::handle<TDocStd_Document> & aDoc, const TCollection_ExtendedString & path);

		/****************** SaveAs ******************/
		%feature("compactdefaultargs") SaveAs;
		%feature("autodoc", "Save the active document in the file <name> in the path <path> . overwrite the file if it already exist.

Parameters
----------
aDoc: TDocStd_Document
path: TCollection_ExtendedString
theStatusMessage: TCollection_ExtendedString

Returns
-------
PCDM_StoreStatus
") SaveAs;
		PCDM_StoreStatus SaveAs(const opencascade::handle<TDocStd_Document> & aDoc, const TCollection_ExtendedString & path, TCollection_ExtendedString & theStatusMessage);

		/****************** WritingFormats ******************/
		%feature("compactdefaultargs") WritingFormats;
		%feature("autodoc", "Returns the sequence of writing formats supported by the application. //! @param theformats - sequence of writing formats. output parameter.

Parameters
----------
theFormats: TColStd_SequenceOfAsciiString

Returns
-------
None
") WritingFormats;
		void WritingFormats(TColStd_SequenceOfAsciiString & theFormats);

};


%make_alias(TDocStd_Application)

%extend TDocStd_Application {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************
* class TDocStd_ApplicationDelta *
*********************************/
class TDocStd_ApplicationDelta : public Standard_Transient {
	public:
		/****************** TDocStd_ApplicationDelta ******************/
		%feature("compactdefaultargs") TDocStd_ApplicationDelta;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") TDocStd_ApplicationDelta;
		 TDocStd_ApplicationDelta();


        %feature("autodoc", "1");
        %extend{
            std::string DumpToString() {
            std::stringstream s;
            self->Dump(s);
            return s.str();}
        };
		/****************** GetDocuments ******************/
		%feature("compactdefaultargs") GetDocuments;
		%feature("autodoc", "No available documentation.

Returns
-------
TDocStd_SequenceOfDocument
") GetDocuments;
		TDocStd_SequenceOfDocument & GetDocuments();

		/****************** GetName ******************/
		%feature("compactdefaultargs") GetName;
		%feature("autodoc", "No available documentation.

Returns
-------
TCollection_ExtendedString
") GetName;
		const TCollection_ExtendedString & GetName();

		/****************** SetName ******************/
		%feature("compactdefaultargs") SetName;
		%feature("autodoc", "No available documentation.

Parameters
----------
theName: TCollection_ExtendedString

Returns
-------
None
") SetName;
		void SetName(const TCollection_ExtendedString & theName);

};


%make_alias(TDocStd_ApplicationDelta)

%extend TDocStd_ApplicationDelta {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************
* class TDocStd_CompoundDelta *
******************************/
class TDocStd_CompoundDelta : public TDF_Delta {
	public:
		/****************** TDocStd_CompoundDelta ******************/
		%feature("compactdefaultargs") TDocStd_CompoundDelta;
		%feature("autodoc", "Creates a compound delta. validates <self> at <abegintime>. if applied, it restores the tdf_data in the state it was at <anendtime>. reserved to tdf_data.

Returns
-------
None
") TDocStd_CompoundDelta;
		 TDocStd_CompoundDelta();

};


%make_alias(TDocStd_CompoundDelta)

%extend TDocStd_CompoundDelta {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************
* class TDocStd_Context *
************************/
class TDocStd_Context {
	public:
		/****************** TDocStd_Context ******************/
		%feature("compactdefaultargs") TDocStd_Context;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") TDocStd_Context;
		 TDocStd_Context();

		/****************** ModifiedReferences ******************/
		%feature("compactdefaultargs") ModifiedReferences;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") ModifiedReferences;
		Standard_Boolean ModifiedReferences();

		/****************** SetModifiedReferences ******************/
		%feature("compactdefaultargs") SetModifiedReferences;
		%feature("autodoc", "No available documentation.

Parameters
----------
Mod: bool

Returns
-------
None
") SetModifiedReferences;
		void SetModifiedReferences(const Standard_Boolean Mod);

};


%extend TDocStd_Context {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************
* class TDocStd_Document *
*************************/
class TDocStd_Document : public CDM_Document {
	public:
		/****************** TDocStd_Document ******************/
		%feature("compactdefaultargs") TDocStd_Document;
		%feature("autodoc", "Constructs a document object defined by the string astorageformat.

Parameters
----------
astorageformat: TCollection_ExtendedString

Returns
-------
None
") TDocStd_Document;
		 TDocStd_Document(const TCollection_ExtendedString & astorageformat);

		/****************** AbortCommand ******************/
		%feature("compactdefaultargs") AbortCommand;
		%feature("autodoc", "Abort the command transaction. does nothing if there is no command transaction open.

Returns
-------
None
") AbortCommand;
		void AbortCommand();

		/****************** BeforeClose ******************/
		%feature("compactdefaultargs") BeforeClose;
		%feature("autodoc", "Prepares document for closing.

Returns
-------
None
") BeforeClose;
		virtual void BeforeClose();

		/****************** ChangeStorageFormat ******************/
		%feature("compactdefaultargs") ChangeStorageFormat;
		%feature("autodoc", "Methods for the nested transaction mode.

Parameters
----------
newStorageFormat: TCollection_ExtendedString

Returns
-------
None
") ChangeStorageFormat;
		virtual void ChangeStorageFormat(const TCollection_ExtendedString & newStorageFormat);

		/****************** ClearRedos ******************/
		%feature("compactdefaultargs") ClearRedos;
		%feature("autodoc", "Remove all stored redos.

Returns
-------
None
") ClearRedos;
		void ClearRedos();

		/****************** ClearUndos ******************/
		%feature("compactdefaultargs") ClearUndos;
		%feature("autodoc", "Remove all stored undos and redos.

Returns
-------
None
") ClearUndos;
		void ClearUndos();

		/****************** CommitCommand ******************/
		%feature("compactdefaultargs") CommitCommand;
		%feature("autodoc", "Commits documents transactions and fills the transaction manager with documents that have been changed during the transaction. if no command transaction is open, nothing is done. returns true if a new delta has been added to myundos.

Returns
-------
bool
") CommitCommand;
		Standard_Boolean CommitCommand();

		/****************** EmptyLabelsSavingMode ******************/
		%feature("compactdefaultargs") EmptyLabelsSavingMode;
		%feature("autodoc", "Returns saving mode for empty labels.

Returns
-------
bool
") EmptyLabelsSavingMode;
		Standard_Boolean EmptyLabelsSavingMode();

		/****************** Get ******************/
		%feature("compactdefaultargs") Get;
		%feature("autodoc", "Will abort any execution, clear fields returns the document which contains <l>. raises an exception if the document is not found.

Parameters
----------
L: TDF_Label

Returns
-------
opencascade::handle<TDocStd_Document>
") Get;
		static opencascade::handle<TDocStd_Document> Get(const TDF_Label & L);

		/****************** GetAvailableRedos ******************/
		%feature("compactdefaultargs") GetAvailableRedos;
		%feature("autodoc", "Returns the number of redos stored in this document. if this figure is greater than 0, the method redo can be used.

Returns
-------
int
") GetAvailableRedos;
		Standard_Integer GetAvailableRedos();

		/****************** GetAvailableUndos ******************/
		%feature("compactdefaultargs") GetAvailableUndos;
		%feature("autodoc", "Returns the number of undos stored in this document. if this figure is greater than 0, the method undo can be used.

Returns
-------
int
") GetAvailableUndos;
		Standard_Integer GetAvailableUndos();

		/****************** GetData ******************/
		%feature("compactdefaultargs") GetData;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TDF_Data>
") GetData;
		opencascade::handle<TDF_Data> GetData();

		/****************** GetModified ******************/
		%feature("compactdefaultargs") GetModified;
		%feature("autodoc", "Returns the labels which have been modified in this document.

Returns
-------
TDF_LabelMap
") GetModified;
		const TDF_LabelMap & GetModified();

		/****************** GetName ******************/
		%feature("compactdefaultargs") GetName;
		%feature("autodoc", "Raise if <self> is not saved.

Returns
-------
TCollection_ExtendedString
") GetName;
		TCollection_ExtendedString GetName();

		/****************** GetPath ******************/
		%feature("compactdefaultargs") GetPath;
		%feature("autodoc", "Returns the os path of the file, in wich one <self> is saved. raise an exception if <self> is not saved.

Returns
-------
TCollection_ExtendedString
") GetPath;
		TCollection_ExtendedString GetPath();

		/****************** GetRedos ******************/
		%feature("compactdefaultargs") GetRedos;
		%feature("autodoc", "No available documentation.

Returns
-------
TDF_DeltaList
") GetRedos;
		const TDF_DeltaList & GetRedos();

		/****************** GetSavedTime ******************/
		%feature("compactdefaultargs") GetSavedTime;
		%feature("autodoc", "Returns value of <mysavedtime> to be used later in setsavedtime().

Returns
-------
int
") GetSavedTime;
		Standard_Integer GetSavedTime();

		/****************** GetUndoLimit ******************/
		%feature("compactdefaultargs") GetUndoLimit;
		%feature("autodoc", "The current limit on the number of undos.

Returns
-------
int
") GetUndoLimit;
		Standard_Integer GetUndoLimit();

		/****************** GetUndos ******************/
		%feature("compactdefaultargs") GetUndos;
		%feature("autodoc", "No available documentation.

Returns
-------
TDF_DeltaList
") GetUndos;
		const TDF_DeltaList & GetUndos();

		/****************** HasOpenCommand ******************/
		%feature("compactdefaultargs") HasOpenCommand;
		%feature("autodoc", "Returns true if a command transaction is open in the curret .

Returns
-------
bool
") HasOpenCommand;
		Standard_Boolean HasOpenCommand();

		/****************** InitDeltaCompaction ******************/
		%feature("compactdefaultargs") InitDeltaCompaction;
		%feature("autodoc", "Initializes the procedure of delta compaction returns false if there is no delta to compact marks the last delta as a 'from' delta.

Returns
-------
bool
") InitDeltaCompaction;
		Standard_Boolean InitDeltaCompaction();

		/****************** IsChanged ******************/
		%feature("compactdefaultargs") IsChanged;
		%feature("autodoc", "Returns true if document differs from the state of last saving. this method have to be called only wroking in the transaction mode.

Returns
-------
bool
") IsChanged;
		Standard_Boolean IsChanged();

		/****************** IsEmpty ******************/
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "Returns true if the main label has no attributes.

Returns
-------
bool
") IsEmpty;
		Standard_Boolean IsEmpty();

		/****************** IsNestedTransactionMode ******************/
		%feature("compactdefaultargs") IsNestedTransactionMode;
		%feature("autodoc", "Returns standard_true if mode is set.

Returns
-------
bool
") IsNestedTransactionMode;
		Standard_Boolean IsNestedTransactionMode();

		/****************** IsSaved ******************/
		%feature("compactdefaultargs") IsSaved;
		%feature("autodoc", "The document is saved in a file.

Returns
-------
bool
") IsSaved;
		Standard_Boolean IsSaved();

		/****************** IsValid ******************/
		%feature("compactdefaultargs") IsValid;
		%feature("autodoc", "Returns false if the document has been modified but not recomputed.

Returns
-------
bool
") IsValid;
		Standard_Boolean IsValid();

		/****************** Main ******************/
		%feature("compactdefaultargs") Main;
		%feature("autodoc", "Returns the main label in this data framework. by definition, this is the label with the entry 0:1.

Returns
-------
TDF_Label
") Main;
		TDF_Label Main();

		/****************** ModificationMode ******************/
		%feature("compactdefaultargs") ModificationMode;
		%feature("autodoc", "Returns true if changes allowed only inside transactions.

Returns
-------
bool
") ModificationMode;
		Standard_Boolean ModificationMode();

		/****************** NewCommand ******************/
		%feature("compactdefaultargs") NewCommand;
		%feature("autodoc", "Launches a new command. this command may be undone.

Returns
-------
None
") NewCommand;
		void NewCommand();

		/****************** OpenCommand ******************/
		%feature("compactdefaultargs") OpenCommand;
		%feature("autodoc", "Opens a new command transaction in this document. you can use hasopencommand to see whether a command is already open. exceptions standard_domainerror if a command is already open in this document.

Returns
-------
None
") OpenCommand;
		void OpenCommand();

		/****************** PerformDeltaCompaction ******************/
		%feature("compactdefaultargs") PerformDeltaCompaction;
		%feature("autodoc", "Performs the procedure of delta compaction makes all deltas starting from 'from' delta till the last one to be one delta.

Returns
-------
bool
") PerformDeltaCompaction;
		Standard_Boolean PerformDeltaCompaction();

		/****************** PurgeModified ******************/
		%feature("compactdefaultargs") PurgeModified;
		%feature("autodoc", "Remove all modifications. after this call the document becomesagain valid.

Returns
-------
None
") PurgeModified;
		void PurgeModified();

		/****************** Recompute ******************/
		%feature("compactdefaultargs") Recompute;
		%feature("autodoc", "Recompute if the document was not valid and propagate the reccorded modification.

Returns
-------
None
") Recompute;
		void Recompute();

		/****************** Redo ******************/
		%feature("compactdefaultargs") Redo;
		%feature("autodoc", "Will redo one step, returns false if no redo was done (redos == 0). otherwise, true is returned, and one step in the list of redoes is done again.

Returns
-------
bool
") Redo;
		Standard_Boolean Redo();

		/****************** RemoveFirstUndo ******************/
		%feature("compactdefaultargs") RemoveFirstUndo;
		%feature("autodoc", "Removes the first undo in the list of document undos. it is used in the application when the undo limit is exceed.

Returns
-------
None
") RemoveFirstUndo;
		void RemoveFirstUndo();

		/****************** SetData ******************/
		%feature("compactdefaultargs") SetData;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: TDF_Data

Returns
-------
None
") SetData;
		void SetData(const opencascade::handle<TDF_Data> & data);

		/****************** SetEmptyLabelsSavingMode ******************/
		%feature("compactdefaultargs") SetEmptyLabelsSavingMode;
		%feature("autodoc", "Sets saving mode for empty labels. if standard_true, empty labels will be saved.

Parameters
----------
isAllowed: bool

Returns
-------
None
") SetEmptyLabelsSavingMode;
		void SetEmptyLabelsSavingMode(const Standard_Boolean isAllowed);

		/****************** SetModificationMode ******************/
		%feature("compactdefaultargs") SetModificationMode;
		%feature("autodoc", "If thetransactiononly is true changes is denied outside transactions.

Parameters
----------
theTransactionOnly: bool

Returns
-------
None
") SetModificationMode;
		void SetModificationMode(const Standard_Boolean theTransactionOnly);

		/****************** SetModified ******************/
		%feature("compactdefaultargs") SetModified;
		%feature("autodoc", "Notify the label as modified, the document becomes unvalid. returns true if <l> has been notified as modified.

Parameters
----------
L: TDF_Label

Returns
-------
None
") SetModified;
		void SetModified(const TDF_Label & L);

		/****************** SetNestedTransactionMode ******************/
		%feature("compactdefaultargs") SetNestedTransactionMode;
		%feature("autodoc", "Sets nested transaction mode if isallowed == standard_true.

Parameters
----------
isAllowed: bool,optional
	default value is Standard_True

Returns
-------
None
") SetNestedTransactionMode;
		void SetNestedTransactionMode(const Standard_Boolean isAllowed = Standard_True);

		/****************** SetSaved ******************/
		%feature("compactdefaultargs") SetSaved;
		%feature("autodoc", "This method have to be called to show document that it has been saved.

Returns
-------
None
") SetSaved;
		void SetSaved();

		/****************** SetSavedTime ******************/
		%feature("compactdefaultargs") SetSavedTime;
		%feature("autodoc", "Say to document what it is not saved. use value, returned earlier by getsavedtime().

Parameters
----------
theTime: int

Returns
-------
None
") SetSavedTime;
		void SetSavedTime(const Standard_Integer theTime);

		/****************** SetUndoLimit ******************/
		%feature("compactdefaultargs") SetUndoLimit;
		%feature("autodoc", "Set the limit on the number of undo delta stored 0 will disable undo on the document a negative value means no limit. note that by default undo is disabled. enabling it will take effect with the next call to newcommand. of course this limit is the same for redo.

Parameters
----------
L: int

Returns
-------
None
") SetUndoLimit;
		void SetUndoLimit(const Standard_Integer L);

		/****************** StorageFormat ******************/
		%feature("compactdefaultargs") StorageFormat;
		%feature("autodoc", "No available documentation.

Returns
-------
TCollection_ExtendedString
") StorageFormat;
		virtual TCollection_ExtendedString StorageFormat();

		/****************** Undo ******************/
		%feature("compactdefaultargs") Undo;
		%feature("autodoc", "Will undo one step, returns false if no undo was done (undos == 0). otherwise, true is returned and one step in the list of undoes is undone.

Returns
-------
bool
") Undo;
		Standard_Boolean Undo();

		/****************** Update ******************/
		%feature("compactdefaultargs") Update;
		%feature("autodoc", "This method update will be called to signal the end of the modified references list. the document should be recomputed and updatefromdocuments should be called. update should returns true in case of success, false otherwise. in case of failure, additional information can be given in errorstring. update the document by propagation ================================== update the document from internal stored modifications. if you want to undoing this operation, please call newcommand before. to change format (advanced programming) ================.

Parameters
----------
aToDocument: CDM_Document
aReferenceIdentifier: int
aModifContext: Standard_Address

Returns
-------
None
") Update;
		virtual void Update(const opencascade::handle<CDM_Document> & aToDocument, const Standard_Integer aReferenceIdentifier, const Standard_Address aModifContext);

		/****************** UpdateReferences ******************/
		%feature("compactdefaultargs") UpdateReferences;
		%feature("autodoc", "Set modifications on labels impacted by external references to the entry. the document becomes invalid and must be recomputed.

Parameters
----------
aDocEntry: TCollection_AsciiString

Returns
-------
None
") UpdateReferences;
		void UpdateReferences(const TCollection_AsciiString & aDocEntry);

};


%make_alias(TDocStd_Document)

%extend TDocStd_Document {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************
* class TDocStd_Modified *
*************************/
class TDocStd_Modified : public TDF_Attribute {
	public:
		/****************** TDocStd_Modified ******************/
		%feature("compactdefaultargs") TDocStd_Modified;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") TDocStd_Modified;
		 TDocStd_Modified();

		/****************** Add ******************/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "No available documentation.

Parameters
----------
alabel: TDF_Label

Returns
-------
bool
") Add;
		static Standard_Boolean Add(const TDF_Label & alabel);

		/****************** AddLabel ******************/
		%feature("compactdefaultargs") AddLabel;
		%feature("autodoc", "Add <l> as modified.

Parameters
----------
L: TDF_Label

Returns
-------
bool
") AddLabel;
		Standard_Boolean AddLabel(const TDF_Label & L);

		/****************** Clear ******************/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "Remove all modified labels. becomes empty.

Parameters
----------
access: TDF_Label

Returns
-------
None
") Clear;
		static void Clear(const TDF_Label & access);

		/****************** Clear ******************/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Clear;
		void Clear();

		/****************** Contains ******************/
		%feature("compactdefaultargs") Contains;
		%feature("autodoc", "No available documentation.

Parameters
----------
alabel: TDF_Label

Returns
-------
bool
") Contains;
		static Standard_Boolean Contains(const TDF_Label & alabel);


        %feature("autodoc", "1");
        %extend{
            std::string DumpToString() {
            std::stringstream s;
            self->Dump(s);
            return s.str();}
        };
		/****************** Get ******************/
		%feature("compactdefaultargs") Get;
		%feature("autodoc", "If <isempty> raise an exception.

Parameters
----------
access: TDF_Label

Returns
-------
TDF_LabelMap
") Get;
		static const TDF_LabelMap & Get(const TDF_Label & access);

		/****************** Get ******************/
		%feature("compactdefaultargs") Get;
		%feature("autodoc", "Returns modified label map.

Returns
-------
TDF_LabelMap
") Get;
		const TDF_LabelMap & Get();

		/****************** GetID ******************/
		%feature("compactdefaultargs") GetID;
		%feature("autodoc", "Modified methods ================.

Returns
-------
Standard_GUID
") GetID;
		static const Standard_GUID & GetID();

		/****************** ID ******************/
		%feature("compactdefaultargs") ID;
		%feature("autodoc", "No available documentation.

Returns
-------
Standard_GUID
") ID;
		const Standard_GUID & ID();

		/****************** IsEmpty ******************/
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "Api class methods =================.

Parameters
----------
access: TDF_Label

Returns
-------
bool
") IsEmpty;
		static Standard_Boolean IsEmpty(const TDF_Label & access);

		/****************** IsEmpty ******************/
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsEmpty;
		Standard_Boolean IsEmpty();

		/****************** NewEmpty ******************/
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TDF_Attribute>
") NewEmpty;
		opencascade::handle<TDF_Attribute> NewEmpty();

		/****************** Paste ******************/
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

		/****************** Remove ******************/
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "No available documentation.

Parameters
----------
alabel: TDF_Label

Returns
-------
bool
") Remove;
		static Standard_Boolean Remove(const TDF_Label & alabel);

		/****************** RemoveLabel ******************/
		%feature("compactdefaultargs") RemoveLabel;
		%feature("autodoc", "Remove <l> as modified.

Parameters
----------
L: TDF_Label

Returns
-------
bool
") RemoveLabel;
		Standard_Boolean RemoveLabel(const TDF_Label & L);

		/****************** Restore ******************/
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

};


%make_alias(TDocStd_Modified)

%extend TDocStd_Modified {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************************
* class TDocStd_MultiTransactionManager *
****************************************/
class TDocStd_MultiTransactionManager : public Standard_Transient {
	public:
		/****************** TDocStd_MultiTransactionManager ******************/
		%feature("compactdefaultargs") TDocStd_MultiTransactionManager;
		%feature("autodoc", "Constructor.

Returns
-------
None
") TDocStd_MultiTransactionManager;
		 TDocStd_MultiTransactionManager();

		/****************** AbortCommand ******************/
		%feature("compactdefaultargs") AbortCommand;
		%feature("autodoc", "Unsets the flag of started manager transaction and aborts transaction in each document.

Returns
-------
None
") AbortCommand;
		void AbortCommand();

		/****************** AddDocument ******************/
		%feature("compactdefaultargs") AddDocument;
		%feature("autodoc", "Adds the document to the transaction manager and checks if it has been already added.

Parameters
----------
theDoc: TDocStd_Document

Returns
-------
None
") AddDocument;
		void AddDocument(const opencascade::handle<TDocStd_Document> & theDoc);

		/****************** ClearRedos ******************/
		%feature("compactdefaultargs") ClearRedos;
		%feature("autodoc", "Clears redos in the manager and in documents.

Returns
-------
None
") ClearRedos;
		void ClearRedos();

		/****************** ClearUndos ******************/
		%feature("compactdefaultargs") ClearUndos;
		%feature("autodoc", "Clears undos in the manager and in documents.

Returns
-------
None
") ClearUndos;
		void ClearUndos();

		/****************** CommitCommand ******************/
		%feature("compactdefaultargs") CommitCommand;
		%feature("autodoc", "Commits transaction in all documents and fills the transaction manager with the documents that have been changed during the transaction. returns true if new data has been added to myundos. note: all nested transactions in the documents will be commited.

Returns
-------
bool
") CommitCommand;
		Standard_Boolean CommitCommand();

		/****************** CommitCommand ******************/
		%feature("compactdefaultargs") CommitCommand;
		%feature("autodoc", "Makes the same steps as the previous function but defines the name for transaction. returns true if new data has been added to myundos.

Parameters
----------
theName: TCollection_ExtendedString

Returns
-------
bool
") CommitCommand;
		Standard_Boolean CommitCommand(const TCollection_ExtendedString & theName);

		/****************** Documents ******************/
		%feature("compactdefaultargs") Documents;
		%feature("autodoc", "Returns the added documents to the transaction manager.

Returns
-------
TDocStd_SequenceOfDocument
") Documents;
		const TDocStd_SequenceOfDocument & Documents();


        %feature("autodoc", "1");
        %extend{
            std::string DumpTransactionToString() {
            std::stringstream s;
            self->DumpTransaction(s);
            return s.str();}
        };
		/****************** GetAvailableRedos ******************/
		%feature("compactdefaultargs") GetAvailableRedos;
		%feature("autodoc", "Returns available manager redos.

Returns
-------
TDocStd_SequenceOfApplicationDelta
") GetAvailableRedos;
		const TDocStd_SequenceOfApplicationDelta & GetAvailableRedos();

		/****************** GetAvailableUndos ******************/
		%feature("compactdefaultargs") GetAvailableUndos;
		%feature("autodoc", "Returns available manager undos.

Returns
-------
TDocStd_SequenceOfApplicationDelta
") GetAvailableUndos;
		const TDocStd_SequenceOfApplicationDelta & GetAvailableUndos();

		/****************** GetUndoLimit ******************/
		%feature("compactdefaultargs") GetUndoLimit;
		%feature("autodoc", "Returns undo limit for the manager.

Returns
-------
int
") GetUndoLimit;
		Standard_Integer GetUndoLimit();

		/****************** HasOpenCommand ******************/
		%feature("compactdefaultargs") HasOpenCommand;
		%feature("autodoc", "Returns true if a transaction is opened.

Returns
-------
bool
") HasOpenCommand;
		Standard_Boolean HasOpenCommand();

		/****************** IsNestedTransactionMode ******************/
		%feature("compactdefaultargs") IsNestedTransactionMode;
		%feature("autodoc", "Returns standard_true if nestedtransaction mode is set. methods for protection of changes outside transactions.

Returns
-------
bool
") IsNestedTransactionMode;
		Standard_Boolean IsNestedTransactionMode();

		/****************** ModificationMode ******************/
		%feature("compactdefaultargs") ModificationMode;
		%feature("autodoc", "Returns true if changes are allowed only inside transactions.

Returns
-------
bool
") ModificationMode;
		Standard_Boolean ModificationMode();

		/****************** OpenCommand ******************/
		%feature("compactdefaultargs") OpenCommand;
		%feature("autodoc", "Opens transaction in each document and sets the flag that transaction is opened. if there are already opened transactions in the documents, these transactions will be aborted before openning new ones.

Returns
-------
None
") OpenCommand;
		void OpenCommand();

		/****************** Redo ******************/
		%feature("compactdefaultargs") Redo;
		%feature("autodoc", "Redoes the current transaction of the application. it calls the redo () method of the document being on top of the manager list of redos (list.first()) and moves the list item to the top of the list of manager undos (list.prepend(item)).

Returns
-------
None
") Redo;
		void Redo();

		/****************** RemoveDocument ******************/
		%feature("compactdefaultargs") RemoveDocument;
		%feature("autodoc", "Removes the document from the transaction manager.

Parameters
----------
theDoc: TDocStd_Document

Returns
-------
None
") RemoveDocument;
		void RemoveDocument(const opencascade::handle<TDocStd_Document> & theDoc);

		/****************** RemoveLastUndo ******************/
		%feature("compactdefaultargs") RemoveLastUndo;
		%feature("autodoc", "Removes undo information from the list of undos of the manager and all documents which have been modified during the transaction.

Returns
-------
None
") RemoveLastUndo;
		void RemoveLastUndo();

		/****************** SetModificationMode ******************/
		%feature("compactdefaultargs") SetModificationMode;
		%feature("autodoc", "If thetransactiononly is true, denies all changes outside transactions.

Parameters
----------
theTransactionOnly: bool

Returns
-------
None
") SetModificationMode;
		void SetModificationMode(const Standard_Boolean theTransactionOnly);

		/****************** SetNestedTransactionMode ******************/
		%feature("compactdefaultargs") SetNestedTransactionMode;
		%feature("autodoc", "Sets nested transaction mode if isallowed == standard_true note: field myisnestedtransactionmode exists only for synchronization between several documents and has no effect on transactions of multitransaction manager.

Parameters
----------
isAllowed: bool,optional
	default value is Standard_True

Returns
-------
None
") SetNestedTransactionMode;
		void SetNestedTransactionMode(const Standard_Boolean isAllowed = Standard_True);

		/****************** SetUndoLimit ******************/
		%feature("compactdefaultargs") SetUndoLimit;
		%feature("autodoc", "Sets undo limit for the manager and all documents.

Parameters
----------
theLimit: int

Returns
-------
None
") SetUndoLimit;
		void SetUndoLimit(const Standard_Integer theLimit);

		/****************** Undo ******************/
		%feature("compactdefaultargs") Undo;
		%feature("autodoc", "Undoes the current transaction of the manager. it calls the undo () method of the document being on top of the manager list of undos (list.first()) and moves the list item to the top of the list of manager redos (list.prepend(item)).

Returns
-------
None
") Undo;
		void Undo();

};


%make_alias(TDocStd_MultiTransactionManager)

%extend TDocStd_MultiTransactionManager {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************
* class TDocStd_Owner *
**********************/
class TDocStd_Owner : public TDF_Attribute {
	public:
		/****************** TDocStd_Owner ******************/
		%feature("compactdefaultargs") TDocStd_Owner;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") TDocStd_Owner;
		 TDocStd_Owner();


        %feature("autodoc", "1");
        %extend{
            std::string DumpToString() {
            std::stringstream s;
            self->Dump(s);
            return s.str();}
        };
		/****************** GetDocument ******************/
		%feature("compactdefaultargs") GetDocument;
		%feature("autodoc", "Owner methods ===============.

Parameters
----------
ofdata: TDF_Data

Returns
-------
opencascade::handle<TDocStd_Document>
") GetDocument;
		static opencascade::handle<TDocStd_Document> GetDocument(const opencascade::handle<TDF_Data> & ofdata);

		/****************** GetDocument ******************/
		%feature("compactdefaultargs") GetDocument;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TDocStd_Document>
") GetDocument;
		opencascade::handle<TDocStd_Document> GetDocument();

		/****************** GetID ******************/
		%feature("compactdefaultargs") GetID;
		%feature("autodoc", "Class methods =============.

Returns
-------
Standard_GUID
") GetID;
		static const Standard_GUID & GetID();

		/****************** ID ******************/
		%feature("compactdefaultargs") ID;
		%feature("autodoc", "No available documentation.

Returns
-------
Standard_GUID
") ID;
		const Standard_GUID & ID();

		/****************** NewEmpty ******************/
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TDF_Attribute>
") NewEmpty;
		opencascade::handle<TDF_Attribute> NewEmpty();

		/****************** Paste ******************/
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

		/****************** SetDocument ******************/
		%feature("compactdefaultargs") SetDocument;
		%feature("autodoc", "No available documentation.

Parameters
----------
indata: TDF_Data
doc: TDocStd_Document

Returns
-------
None
") SetDocument;
		static void SetDocument(const opencascade::handle<TDF_Data> & indata, const opencascade::handle<TDocStd_Document> & doc);

		/****************** SetDocument ******************/
		%feature("compactdefaultargs") SetDocument;
		%feature("autodoc", "No available documentation.

Parameters
----------
document: TDocStd_Document

Returns
-------
None
") SetDocument;
		void SetDocument(const opencascade::handle<TDocStd_Document> & document);

};


%make_alias(TDocStd_Owner)

%extend TDocStd_Owner {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************
* class TDocStd_PathParser *
***************************/
class TDocStd_PathParser {
	public:
		/****************** TDocStd_PathParser ******************/
		%feature("compactdefaultargs") TDocStd_PathParser;
		%feature("autodoc", "No available documentation.

Parameters
----------
path: TCollection_ExtendedString

Returns
-------
None
") TDocStd_PathParser;
		 TDocStd_PathParser(const TCollection_ExtendedString & path);

		/****************** Extension ******************/
		%feature("compactdefaultargs") Extension;
		%feature("autodoc", "No available documentation.

Returns
-------
TCollection_ExtendedString
") Extension;
		TCollection_ExtendedString Extension();

		/****************** Length ******************/
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") Length;
		Standard_Integer Length();

		/****************** Name ******************/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "No available documentation.

Returns
-------
TCollection_ExtendedString
") Name;
		TCollection_ExtendedString Name();

		/****************** Parse ******************/
		%feature("compactdefaultargs") Parse;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Parse;
		void Parse();

		/****************** Path ******************/
		%feature("compactdefaultargs") Path;
		%feature("autodoc", "No available documentation.

Returns
-------
TCollection_ExtendedString
") Path;
		TCollection_ExtendedString Path();

		/****************** Trek ******************/
		%feature("compactdefaultargs") Trek;
		%feature("autodoc", "No available documentation.

Returns
-------
TCollection_ExtendedString
") Trek;
		TCollection_ExtendedString Trek();

};


%extend TDocStd_PathParser {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************
* class TDocStd_XLink *
**********************/
class TDocStd_XLink : public TDF_Attribute {
	public:
		/****************** TDocStd_XLink ******************/
		%feature("compactdefaultargs") TDocStd_XLink;
		%feature("autodoc", "Initializes fields.

Returns
-------
None
") TDocStd_XLink;
		 TDocStd_XLink();

		/****************** AfterAddition ******************/
		%feature("compactdefaultargs") AfterAddition;
		%feature("autodoc", "Updates the xlinkroot attribute by adding <self> to its list.

Returns
-------
None
") AfterAddition;
		void AfterAddition();

		/****************** AfterUndo ******************/
		%feature("compactdefaultargs") AfterUndo;
		%feature("autodoc", "Something to do after applying <anattdelta>.

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

		/****************** BackupCopy ******************/
		%feature("compactdefaultargs") BackupCopy;
		%feature("autodoc", "Returns a null handle. raise allways for ,it is nonsense to use this method.

Returns
-------
opencascade::handle<TDF_Attribute>
") BackupCopy;
		opencascade::handle<TDF_Attribute> BackupCopy();

		/****************** BeforeRemoval ******************/
		%feature("compactdefaultargs") BeforeRemoval;
		%feature("autodoc", "Updates the xlinkroot attribute by removing <self> from its list.

Returns
-------
None
") BeforeRemoval;
		void BeforeRemoval();

		/****************** BeforeUndo ******************/
		%feature("compactdefaultargs") BeforeUndo;
		%feature("autodoc", "Something to do before applying <anattdelta>.

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

		/****************** DocumentEntry ******************/
		%feature("compactdefaultargs") DocumentEntry;
		%feature("autodoc", "Sets the name adocentry for the external document in this external link attribute.

Parameters
----------
aDocEntry: TCollection_AsciiString

Returns
-------
None
") DocumentEntry;
		void DocumentEntry(const TCollection_AsciiString & aDocEntry);

		/****************** DocumentEntry ******************/
		%feature("compactdefaultargs") DocumentEntry;
		%feature("autodoc", "Returns the contents of the document identified by adocentry. adocentry provides external data to this external link attribute.

Returns
-------
TCollection_AsciiString
") DocumentEntry;
		const TCollection_AsciiString & DocumentEntry();


        %feature("autodoc", "1");
        %extend{
            std::string DumpToString() {
            std::stringstream s;
            self->Dump(s);
            return s.str();}
        };
		/****************** GetID ******************/
		%feature("compactdefaultargs") GetID;
		%feature("autodoc", "Returns the guid for external links.

Returns
-------
Standard_GUID
") GetID;
		static const Standard_GUID & GetID();

		/****************** ID ******************/
		%feature("compactdefaultargs") ID;
		%feature("autodoc", "Returns the id of the attribute.

Returns
-------
Standard_GUID
") ID;
		const Standard_GUID & ID();

		/****************** LabelEntry ******************/
		%feature("compactdefaultargs") LabelEntry;
		%feature("autodoc", "Sets the label entry for this external link attribute with the label alabel. alabel pilots the importation of data from the document entry.

Parameters
----------
aLabel: TDF_Label

Returns
-------
None
") LabelEntry;
		void LabelEntry(const TDF_Label & aLabel);

		/****************** LabelEntry ******************/
		%feature("compactdefaultargs") LabelEntry;
		%feature("autodoc", "Sets the label entry for this external link attribute as a document identified by alabentry.

Parameters
----------
aLabEntry: TCollection_AsciiString

Returns
-------
None
") LabelEntry;
		void LabelEntry(const TCollection_AsciiString & aLabEntry);

		/****************** LabelEntry ******************/
		%feature("compactdefaultargs") LabelEntry;
		%feature("autodoc", "Returns the contents of the field <mylabelentry>.

Returns
-------
TCollection_AsciiString
") LabelEntry;
		const TCollection_AsciiString & LabelEntry();

		/****************** NewEmpty ******************/
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "Returns a null handle.

Returns
-------
opencascade::handle<TDF_Attribute>
") NewEmpty;
		opencascade::handle<TDF_Attribute> NewEmpty();

		/****************** Paste ******************/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "Does nothing.

Parameters
----------
intoAttribute: TDF_Attribute
aRelocationTable: TDF_RelocationTable

Returns
-------
None
") Paste;
		void Paste(const opencascade::handle<TDF_Attribute> & intoAttribute, const opencascade::handle<TDF_RelocationTable> & aRelocationTable);

		/****************** Restore ******************/
		%feature("compactdefaultargs") Restore;
		%feature("autodoc", "Does nothing.

Parameters
----------
anAttribute: TDF_Attribute

Returns
-------
None
") Restore;
		void Restore(const opencascade::handle<TDF_Attribute> & anAttribute);

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "Sets an empty external reference, at the label alabel.

Parameters
----------
atLabel: TDF_Label

Returns
-------
opencascade::handle<TDocStd_XLink>
") Set;
		static opencascade::handle<TDocStd_XLink> Set(const TDF_Label & atLabel);

		/****************** Update ******************/
		%feature("compactdefaultargs") Update;
		%feature("autodoc", "Updates the data referenced in this external link attribute.

Returns
-------
opencascade::handle<TDF_Reference>
") Update;
		opencascade::handle<TDF_Reference> Update();

};


%make_alias(TDocStd_XLink)

%extend TDocStd_XLink {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************
* class TDocStd_XLinkIterator *
******************************/
class TDocStd_XLinkIterator {
	public:
		/****************** TDocStd_XLinkIterator ******************/
		%feature("compactdefaultargs") TDocStd_XLinkIterator;
		%feature("autodoc", "Returns an empty iterator;.

Returns
-------
None
") TDocStd_XLinkIterator;
		 TDocStd_XLinkIterator();

		/****************** TDocStd_XLinkIterator ******************/
		%feature("compactdefaultargs") TDocStd_XLinkIterator;
		%feature("autodoc", "Creates an iterator on reference of <d>.

Parameters
----------
D: TDocStd_Document

Returns
-------
None
") TDocStd_XLinkIterator;
		 TDocStd_XLinkIterator(const opencascade::handle<TDocStd_Document> & D);

		/****************** Initialize ******************/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "Restarts an iteration with <d>.

Parameters
----------
D: TDocStd_Document

Returns
-------
None
") Initialize;
		void Initialize(const opencascade::handle<TDocStd_Document> & D);

		/****************** More ******************/
		%feature("compactdefaultargs") More;
		%feature("autodoc", "Returns true if there is a current item in the iteration.

Returns
-------
bool
") More;
		Standard_Boolean More();

		/****************** Next ******************/
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "Move to the next item; raises if there is no more item.

Returns
-------
None
") Next;
		void Next();

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Returns the current item; a null handle if there is none.

Returns
-------
TDocStd_XLinkPtr
") Value;
		TDocStd_XLinkPtr Value();

};


%extend TDocStd_XLinkIterator {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************
* class TDocStd_XLinkRoot *
**************************/
%nodefaultctor TDocStd_XLinkRoot;
class TDocStd_XLinkRoot : public TDF_Attribute {
	public:
		/****************** BackupCopy ******************/
		%feature("compactdefaultargs") BackupCopy;
		%feature("autodoc", "Returns a null handle.

Returns
-------
opencascade::handle<TDF_Attribute>
") BackupCopy;
		opencascade::handle<TDF_Attribute> BackupCopy();


        %feature("autodoc", "1");
        %extend{
            std::string DumpToString() {
            std::stringstream s;
            self->Dump(s);
            return s.str();}
        };
		/****************** GetID ******************/
		%feature("compactdefaultargs") GetID;
		%feature("autodoc", "Returns the id: 2a96b61d-ec8b-11d0-bee7-080009dc3333.

Returns
-------
Standard_GUID
") GetID;
		static const Standard_GUID & GetID();

		/****************** ID ******************/
		%feature("compactdefaultargs") ID;
		%feature("autodoc", "Returns the id of the attribute.

Returns
-------
Standard_GUID
") ID;
		const Standard_GUID & ID();

		/****************** Insert ******************/
		%feature("compactdefaultargs") Insert;
		%feature("autodoc", "Inserts <anxlinkptr> at the beginning of the xlink chain.

Parameters
----------
anXLinkPtr: TDocStd_XLinkPtr

Returns
-------
None
") Insert;
		static void Insert(const TDocStd_XLinkPtr & anXLinkPtr);

		/****************** NewEmpty ******************/
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "Returns a null handle.

Returns
-------
opencascade::handle<TDF_Attribute>
") NewEmpty;
		opencascade::handle<TDF_Attribute> NewEmpty();

		/****************** Paste ******************/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "Does nothing.

Parameters
----------
intoAttribute: TDF_Attribute
aRelocationTable: TDF_RelocationTable

Returns
-------
None
") Paste;
		void Paste(const opencascade::handle<TDF_Attribute> & intoAttribute, const opencascade::handle<TDF_RelocationTable> & aRelocationTable);

		/****************** Remove ******************/
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "Removes <anxlinkptr> from the xlink chain, if it exists.

Parameters
----------
anXLinkPtr: TDocStd_XLinkPtr

Returns
-------
None
") Remove;
		static void Remove(const TDocStd_XLinkPtr & anXLinkPtr);

		/****************** Restore ******************/
		%feature("compactdefaultargs") Restore;
		%feature("autodoc", "Does nothing.

Parameters
----------
anAttribute: TDF_Attribute

Returns
-------
None
") Restore;
		void Restore(const opencascade::handle<TDF_Attribute> & anAttribute);

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "Sets an empty xlinkroot to root or gets the existing one. only one attribute per tdf_data.

Parameters
----------
aDF: TDF_Data

Returns
-------
opencascade::handle<TDocStd_XLinkRoot>
") Set;
		static opencascade::handle<TDocStd_XLinkRoot> Set(const opencascade::handle<TDF_Data> & aDF);

};


%make_alias(TDocStd_XLinkRoot)

%extend TDocStd_XLinkRoot {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************
* class TDocStd_XLinkTool *
**************************/
class TDocStd_XLinkTool {
	public:
		/****************** TDocStd_XLinkTool ******************/
		%feature("compactdefaultargs") TDocStd_XLinkTool;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") TDocStd_XLinkTool;
		 TDocStd_XLinkTool();

		/****************** Copy ******************/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "Copy the content of <fromsource> under <intarget>. noone link is registred. noone check is done. example opencascade::handle<tdocstd_document> doc, xdoc; tdf_label l, xl; tdocstd_xlinktool xlinktool; xlinktool.copy(l,xl); exceptions: standard_domainerror if the contents of fromsource are not entirely in the scope of this label, in other words, are not self-contained. !!! ==> warning: if the document manages shapes use the next way: tdocstd_xlinktool xlinktool; xlinktool.copy(l,xl); toptools_datamapofshapeshape m; tnaming::changeshapes(target,m);.

Parameters
----------
intarget: TDF_Label
fromsource: TDF_Label

Returns
-------
None
") Copy;
		virtual void Copy(const TDF_Label & intarget, const TDF_Label & fromsource);

		/****************** CopyWithLink ******************/
		%feature("compactdefaultargs") CopyWithLink;
		%feature("autodoc", "Copies the content of the label <fromsource> to the label <intarget>. the link is registred with an xlink attribute by <intarget> label. if the content of <fromsource> is not self-contained, and/or <intarget> has already an xlink attribute, an exception is raised.

Parameters
----------
intarget: TDF_Label
fromsource: TDF_Label

Returns
-------
None
") CopyWithLink;
		void CopyWithLink(const TDF_Label & intarget, const TDF_Label & fromsource);

		/****************** DataSet ******************/
		%feature("compactdefaultargs") DataSet;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TDF_DataSet>
") DataSet;
		opencascade::handle<TDF_DataSet> DataSet();

		/****************** IsDone ******************/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsDone;
		Standard_Boolean IsDone();

		/****************** RelocationTable ******************/
		%feature("compactdefaultargs") RelocationTable;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TDF_RelocationTable>
") RelocationTable;
		opencascade::handle<TDF_RelocationTable> RelocationTable();

		/****************** UpdateLink ******************/
		%feature("compactdefaultargs") UpdateLink;
		%feature("autodoc", "Update the external reference set at <l>. example opencascade::handle<tdocstd_document> adoc; if (!ocaftest::getdocument(1,adoc)) return 1; opencascade::handle<tdatastd_reference> aref; tdocstd_xlinktool xlinktool; if (!ocaftest::find(adoc,2),tdatastd_reference::getid(),aref) return 1; xlinktool.updatelink(aref->label()); exceptions standard_domainerror if <l> has no xlink attribute.

Parameters
----------
L: TDF_Label

Returns
-------
None
") UpdateLink;
		void UpdateLink(const TDF_Label & L);

};


%extend TDocStd_XLinkTool {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/* harray1 classes */
/* harray2 classes */
/* hsequence classes */
