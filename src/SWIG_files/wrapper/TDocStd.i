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
from enum import IntEnum
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

%extend NCollection_Sequence<opencascade::handle<TDocStd_ApplicationDelta>> {
    %pythoncode {
    def __len__(self):
        return self.Size()
    }
};
%template(TDocStd_SequenceOfDocument) NCollection_Sequence<opencascade::handle<TDocStd_Document>>;

%extend NCollection_Sequence<opencascade::handle<TDocStd_Document>> {
    %pythoncode {
    def __len__(self):
        return self.Size()
    }
};
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
		/**** md5 signature: 97de0b35f4f6abc04a631c65d32bacc4 ****/
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
		/**** md5 signature: 982d624ff6cdf5e6505f5f02b28e1e9a ****/
		%feature("compactdefaultargs") TDocStd_Application;
		%feature("autodoc", "Constructs the new instance and registers it in cdm_session.

Returns
-------
None
") TDocStd_Application;
		 TDocStd_Application();

		/****************** Close ******************/
		/**** md5 signature: bad5f66ca849c7ea92bfcfed7778e138 ****/
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
		/**** md5 signature: 07b8da6e7e82c945f3bf47307b8b5afb ****/
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
		/**** md5 signature: 15b7beb5a9532b9cd3868298ccdb9245 ****/
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
		/**** md5 signature: e047092b0acc3e4db9a010df3a3169c4 ****/
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
		/**** md5 signature: ce5001e98f2a57f66a3f7e6514b3374d ****/
		%feature("compactdefaultargs") IsDriverLoaded;
		%feature("autodoc", "Check if meta data driver was successfully loaded by the application constructor.

Returns
-------
bool
") IsDriverLoaded;
		Standard_Boolean IsDriverLoaded();

		/****************** IsInSession ******************/
		/**** md5 signature: 3d147ee90a50e9855b5c982d010e4c9f ****/
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
		/**** md5 signature: fa694f7a388b17a440d00a2836607d30 ****/
		%feature("compactdefaultargs") MessageDriver;
		%feature("autodoc", "Redefines message driver, by default outputs to std::cout.

Returns
-------
opencascade::handle<Message_Messenger>
") MessageDriver;
		virtual opencascade::handle<Message_Messenger> MessageDriver();

		/****************** NbDocuments ******************/
		/**** md5 signature: 962bf94556b581ec6396ebefd0c99d4c ****/
		%feature("compactdefaultargs") NbDocuments;
		%feature("autodoc", "Returns the number of documents handled by the current applicative session.

Returns
-------
int
") NbDocuments;
		Standard_Integer NbDocuments();

		/****************** NewDocument ******************/
		/**** md5 signature: 59cafdd79c80d452229e94f487dc1536 ****/
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
		/**** md5 signature: 307f163969480bb723f66d714329e2ba ****/
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
		/**** md5 signature: 6e8544a4b1abdfb75243529c55e4c173 ****/
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
		/**** md5 signature: c63f4a5fcfe6f38088502651361c4ec0 ****/
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
		/**** md5 signature: c965ed34d16d4461492301781dab43b9 ****/
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
		/**** md5 signature: 6dff661583c284b08e2b917089276643 ****/
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
		/**** md5 signature: 69ca16cd0321dc8bb777384aea250771 ****/
		%feature("compactdefaultargs") Resources;
		%feature("autodoc", "Returns resource manager defining supported persistent formats. //! default implementation loads resource file with name resourcesname(), unless field myresources is already initialized (either by previous call or in any other way). //! the resource manager should define: //! * format name for each file extension supported: - [extension].fileformat: [format] //! * for each format supported (as returned by formats()), its extension, description string, and (when applicable) guids of storage and retrieval plugins: - [format].description: [description] - [format].fileextension: [extension] - [format].retrievalplugin: [guid] (optional) - [format].storageplugin: [guid] (optional).

Returns
-------
opencascade::handle<Resource_Manager>
") Resources;
		virtual opencascade::handle<Resource_Manager> Resources();

		/****************** ResourcesName ******************/
		/**** md5 signature: bd72e341abd0de3065c0732583c9ce29 ****/
		%feature("compactdefaultargs") ResourcesName;
		%feature("autodoc", "Returns the name of the file containing the resources of this application, for support of legacy method of loading formats data from resource files. //! method defineformat() can be used to define all necessary parameters explicitly without actually using resource files. //! in a resource file, the application associates the schema name of the document with the storage and retrieval plug-ins that are to be loaded for each document. on retrieval, the application reads the schema name in the heading of the csf file and loads the plug-in indicated in the resource file. this plug-in instantiates the actual driver for transient-persistent conversion. your application can bring this process into play by defining a class which inherits cdf_application and redefines the function which returns the appropriate resources file. at this point, the function retrieve and the class cdf_store can be called. this allows you to deal with storage and retrieval of - as well as copying and pasting - documents. to implement a class like this, several virtual functions should be redefined. in particular, you must redefine the abstract function resources inherited from the superclass cdm_application. //! default implementation returns empty string.

Returns
-------
char *
") ResourcesName;
		virtual const char * ResourcesName();

		/****************** Save ******************/
		/**** md5 signature: e4ff0f9b64e4a2a544bc496d957c16f8 ****/
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
		/**** md5 signature: fc4a3b023a5552d1845fd6dc092f896a ****/
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
		/**** md5 signature: c9b9ca2dda903604001b3608dd30d319 ****/
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
		/**** md5 signature: f7c6d751122ccfe78ef23477a560330e ****/
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
		/**** md5 signature: a5407beb640b0ebe68c0c3306feeeddb ****/
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
		/**** md5 signature: 1af03601ac541f1768394e2226d37005 ****/
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
		/**** md5 signature: 3949b6234d6a0eb9778487caa2291ad4 ****/
		%feature("compactdefaultargs") GetDocuments;
		%feature("autodoc", "No available documentation.

Returns
-------
TDocStd_SequenceOfDocument
") GetDocuments;
		TDocStd_SequenceOfDocument & GetDocuments();

		/****************** GetName ******************/
		/**** md5 signature: 3c50eb9eaf9ae32c5f28a54596fff8d5 ****/
		%feature("compactdefaultargs") GetName;
		%feature("autodoc", "No available documentation.

Returns
-------
TCollection_ExtendedString
") GetName;
		const TCollection_ExtendedString & GetName();

		/****************** SetName ******************/
		/**** md5 signature: 37faf29196bae8c9862db277eec2dc6c ****/
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
		/**** md5 signature: 14b612a73bf23e71f1edade8e46f2a95 ****/
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
		/**** md5 signature: 1449415a74cc571f7c089efc80e12c70 ****/
		%feature("compactdefaultargs") TDocStd_Context;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") TDocStd_Context;
		 TDocStd_Context();

		/****************** ModifiedReferences ******************/
		/**** md5 signature: 224afee24fa4f6d3b2a9839d9ee6f541 ****/
		%feature("compactdefaultargs") ModifiedReferences;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") ModifiedReferences;
		Standard_Boolean ModifiedReferences();

		/****************** SetModifiedReferences ******************/
		/**** md5 signature: 240dac990b28a5adfbfe5943cc9dd4c9 ****/
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
		/**** md5 signature: 6c9bc471881d34be3dc6a79830b980f0 ****/
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
		/**** md5 signature: d0bb10d25bbdbaf736403be160aab8bb ****/
		%feature("compactdefaultargs") AbortCommand;
		%feature("autodoc", "Abort the command transaction. does nothing if there is no command transaction open.

Returns
-------
None
") AbortCommand;
		void AbortCommand();

		/****************** BeforeClose ******************/
		/**** md5 signature: 3fa1f940d3408759374f9543388270ef ****/
		%feature("compactdefaultargs") BeforeClose;
		%feature("autodoc", "Prepares document for closing.

Returns
-------
None
") BeforeClose;
		virtual void BeforeClose();

		/****************** ChangeStorageFormat ******************/
		/**** md5 signature: 3dda94b418a5d0b8874c52229c1c133d ****/
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
		/**** md5 signature: 24ac296ed75c3df1806aa7bb1fddee55 ****/
		%feature("compactdefaultargs") ClearRedos;
		%feature("autodoc", "Remove all stored redos.

Returns
-------
None
") ClearRedos;
		void ClearRedos();

		/****************** ClearUndos ******************/
		/**** md5 signature: 004129249b8506516f5fdd72a4fb8fd0 ****/
		%feature("compactdefaultargs") ClearUndos;
		%feature("autodoc", "Remove all stored undos and redos.

Returns
-------
None
") ClearUndos;
		void ClearUndos();

		/****************** CommitCommand ******************/
		/**** md5 signature: faa383479ebff95ab2d1b0ab2a6c6947 ****/
		%feature("compactdefaultargs") CommitCommand;
		%feature("autodoc", "Commits documents transactions and fills the transaction manager with documents that have been changed during the transaction. if no command transaction is open, nothing is done. returns true if a new delta has been added to myundos.

Returns
-------
bool
") CommitCommand;
		Standard_Boolean CommitCommand();

		/****************** EmptyLabelsSavingMode ******************/
		/**** md5 signature: ebbf4e01e7bb5a968c5adb29c08e5c61 ****/
		%feature("compactdefaultargs") EmptyLabelsSavingMode;
		%feature("autodoc", "Returns saving mode for empty labels.

Returns
-------
bool
") EmptyLabelsSavingMode;
		Standard_Boolean EmptyLabelsSavingMode();

		/****************** Get ******************/
		/**** md5 signature: 77e2a849942dfb62d55ba8818957eae5 ****/
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
		/**** md5 signature: 6d7c07e798e1b111df27b9fd7352d234 ****/
		%feature("compactdefaultargs") GetAvailableRedos;
		%feature("autodoc", "Returns the number of redos stored in this document. if this figure is greater than 0, the method redo can be used.

Returns
-------
int
") GetAvailableRedos;
		Standard_Integer GetAvailableRedos();

		/****************** GetAvailableUndos ******************/
		/**** md5 signature: a9fe7db4eaa69142eaad134d9efb1510 ****/
		%feature("compactdefaultargs") GetAvailableUndos;
		%feature("autodoc", "Returns the number of undos stored in this document. if this figure is greater than 0, the method undo can be used.

Returns
-------
int
") GetAvailableUndos;
		Standard_Integer GetAvailableUndos();

		/****************** GetData ******************/
		/**** md5 signature: 31c5fbe37dd19f7a9a8b8efbf6ab68ed ****/
		%feature("compactdefaultargs") GetData;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TDF_Data>
") GetData;
		opencascade::handle<TDF_Data> GetData();

		/****************** GetModified ******************/
		/**** md5 signature: e0b00984d11d90f6ebccba55f2bedac9 ****/
		%feature("compactdefaultargs") GetModified;
		%feature("autodoc", "Returns the labels which have been modified in this document.

Returns
-------
TDF_LabelMap
") GetModified;
		const TDF_LabelMap & GetModified();

		/****************** GetName ******************/
		/**** md5 signature: fccd7cb624ceb6d77e85524978a24f14 ****/
		%feature("compactdefaultargs") GetName;
		%feature("autodoc", "Raise if <self> is not saved.

Returns
-------
TCollection_ExtendedString
") GetName;
		TCollection_ExtendedString GetName();

		/****************** GetPath ******************/
		/**** md5 signature: b667548800d72ecbc6ccc6595cff37d2 ****/
		%feature("compactdefaultargs") GetPath;
		%feature("autodoc", "Returns the os path of the file, in wich one <self> is saved. raise an exception if <self> is not saved.

Returns
-------
TCollection_ExtendedString
") GetPath;
		TCollection_ExtendedString GetPath();

		/****************** GetRedos ******************/
		/**** md5 signature: a17c398f7ad847f1311a76088a19db6a ****/
		%feature("compactdefaultargs") GetRedos;
		%feature("autodoc", "No available documentation.

Returns
-------
TDF_DeltaList
") GetRedos;
		const TDF_DeltaList & GetRedos();

		/****************** GetSavedTime ******************/
		/**** md5 signature: 4d6497e8e59fc456a92bd8fb1cb73c06 ****/
		%feature("compactdefaultargs") GetSavedTime;
		%feature("autodoc", "Returns value of <mysavedtime> to be used later in setsavedtime().

Returns
-------
int
") GetSavedTime;
		Standard_Integer GetSavedTime();

		/****************** GetUndoLimit ******************/
		/**** md5 signature: 4d03b93f640587c3abcd1bd1d5a774a9 ****/
		%feature("compactdefaultargs") GetUndoLimit;
		%feature("autodoc", "The current limit on the number of undos.

Returns
-------
int
") GetUndoLimit;
		Standard_Integer GetUndoLimit();

		/****************** GetUndos ******************/
		/**** md5 signature: a92983c53fbaea20c65e729b47250791 ****/
		%feature("compactdefaultargs") GetUndos;
		%feature("autodoc", "No available documentation.

Returns
-------
TDF_DeltaList
") GetUndos;
		const TDF_DeltaList & GetUndos();

		/****************** HasOpenCommand ******************/
		/**** md5 signature: dd69c57ebd4821e931afe0accf5d3235 ****/
		%feature("compactdefaultargs") HasOpenCommand;
		%feature("autodoc", "Returns true if a command transaction is open in the curret .

Returns
-------
bool
") HasOpenCommand;
		Standard_Boolean HasOpenCommand();

		/****************** InitDeltaCompaction ******************/
		/**** md5 signature: 77faa00b1c44f05079d8166afa89b7e2 ****/
		%feature("compactdefaultargs") InitDeltaCompaction;
		%feature("autodoc", "Initializes the procedure of delta compaction returns false if there is no delta to compact marks the last delta as a 'from' delta.

Returns
-------
bool
") InitDeltaCompaction;
		Standard_Boolean InitDeltaCompaction();

		/****************** IsChanged ******************/
		/**** md5 signature: c6ef5df821d55ba9601e2f39be013961 ****/
		%feature("compactdefaultargs") IsChanged;
		%feature("autodoc", "Returns true if document differs from the state of last saving. this method have to be called only wroking in the transaction mode.

Returns
-------
bool
") IsChanged;
		Standard_Boolean IsChanged();

		/****************** IsEmpty ******************/
		/**** md5 signature: 6ab5e1ad63f93168856ab126dd374b81 ****/
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "Returns true if the main label has no attributes.

Returns
-------
bool
") IsEmpty;
		Standard_Boolean IsEmpty();

		/****************** IsNestedTransactionMode ******************/
		/**** md5 signature: 1efb73f5e84074596fa47f1cfe63ee41 ****/
		%feature("compactdefaultargs") IsNestedTransactionMode;
		%feature("autodoc", "Returns standard_true if mode is set.

Returns
-------
bool
") IsNestedTransactionMode;
		Standard_Boolean IsNestedTransactionMode();

		/****************** IsSaved ******************/
		/**** md5 signature: a05df8be7169b3a9328ebaa74888756c ****/
		%feature("compactdefaultargs") IsSaved;
		%feature("autodoc", "The document is saved in a file.

Returns
-------
bool
") IsSaved;
		Standard_Boolean IsSaved();

		/****************** IsValid ******************/
		/**** md5 signature: 2809e700423e4fe6ecd395953f3a2406 ****/
		%feature("compactdefaultargs") IsValid;
		%feature("autodoc", "Returns false if the document has been modified but not recomputed.

Returns
-------
bool
") IsValid;
		Standard_Boolean IsValid();

		/****************** Main ******************/
		/**** md5 signature: d3bdeedf7e55e8ec4190ba1b192424e7 ****/
		%feature("compactdefaultargs") Main;
		%feature("autodoc", "Returns the main label in this data framework. by definition, this is the label with the entry 0:1.

Returns
-------
TDF_Label
") Main;
		TDF_Label Main();

		/****************** ModificationMode ******************/
		/**** md5 signature: 19d64027addb7f66c90a4e97325ce41b ****/
		%feature("compactdefaultargs") ModificationMode;
		%feature("autodoc", "Returns true if changes allowed only inside transactions.

Returns
-------
bool
") ModificationMode;
		Standard_Boolean ModificationMode();

		/****************** NewCommand ******************/
		/**** md5 signature: 32f8f9d54085e00883022af8c40334a2 ****/
		%feature("compactdefaultargs") NewCommand;
		%feature("autodoc", "Launches a new command. this command may be undone.

Returns
-------
None
") NewCommand;
		void NewCommand();

		/****************** OpenCommand ******************/
		/**** md5 signature: a5c155bd5cc75696d479b13cfff2f26e ****/
		%feature("compactdefaultargs") OpenCommand;
		%feature("autodoc", "Opens a new command transaction in this document. you can use hasopencommand to see whether a command is already open. exceptions standard_domainerror if a command is already open in this document.

Returns
-------
None
") OpenCommand;
		void OpenCommand();

		/****************** PerformDeltaCompaction ******************/
		/**** md5 signature: c672e4672cd7849522ba54bb9983cad3 ****/
		%feature("compactdefaultargs") PerformDeltaCompaction;
		%feature("autodoc", "Performs the procedure of delta compaction makes all deltas starting from 'from' delta till the last one to be one delta.

Returns
-------
bool
") PerformDeltaCompaction;
		Standard_Boolean PerformDeltaCompaction();

		/****************** PurgeModified ******************/
		/**** md5 signature: 8ea2d8d4e2c5c8c84506ff3ff3412d40 ****/
		%feature("compactdefaultargs") PurgeModified;
		%feature("autodoc", "Remove all modifications. after this call the document becomesagain valid.

Returns
-------
None
") PurgeModified;
		void PurgeModified();

		/****************** Recompute ******************/
		/**** md5 signature: 6619326e603ccdb36e9cfecd2b36ae53 ****/
		%feature("compactdefaultargs") Recompute;
		%feature("autodoc", "Recompute if the document was not valid and propagate the reccorded modification.

Returns
-------
None
") Recompute;
		void Recompute();

		/****************** Redo ******************/
		/**** md5 signature: 25a8729b05a3d55e4dea49595855f14b ****/
		%feature("compactdefaultargs") Redo;
		%feature("autodoc", "Will redo one step, returns false if no redo was done (redos == 0). otherwise, true is returned, and one step in the list of redoes is done again.

Returns
-------
bool
") Redo;
		Standard_Boolean Redo();

		/****************** RemoveFirstUndo ******************/
		/**** md5 signature: 8d230c6a572865285db038c1c0910766 ****/
		%feature("compactdefaultargs") RemoveFirstUndo;
		%feature("autodoc", "Removes the first undo in the list of document undos. it is used in the application when the undo limit is exceed.

Returns
-------
None
") RemoveFirstUndo;
		void RemoveFirstUndo();

		/****************** SetData ******************/
		/**** md5 signature: e5950b55d74da31b1aa3592bd9a5d925 ****/
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
		/**** md5 signature: ee194820db474fc612626ff3eef85f45 ****/
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
		/**** md5 signature: f670168c2039d1fa00cc4c8fedbbda89 ****/
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
		/**** md5 signature: de33735160e5da48a69bcd5ba99fcfd2 ****/
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
		/**** md5 signature: f79f8b65409bf3f9c2580d96405aa86c ****/
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
		/**** md5 signature: 014ee06619c79447bd1c1c60537c8358 ****/
		%feature("compactdefaultargs") SetSaved;
		%feature("autodoc", "This method have to be called to show document that it has been saved.

Returns
-------
None
") SetSaved;
		void SetSaved();

		/****************** SetSavedTime ******************/
		/**** md5 signature: 3372eae5a5d0d58452934202ff83c7cc ****/
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
		/**** md5 signature: a11fa9e33e71f4e544c1b0655a8f4f2f ****/
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
		/**** md5 signature: f4ddc2d3ada784edaf0395475d9df359 ****/
		%feature("compactdefaultargs") StorageFormat;
		%feature("autodoc", "No available documentation.

Returns
-------
TCollection_ExtendedString
") StorageFormat;
		virtual TCollection_ExtendedString StorageFormat();

		/****************** Undo ******************/
		/**** md5 signature: 95113786d46edb519ce9957bac4f72f7 ****/
		%feature("compactdefaultargs") Undo;
		%feature("autodoc", "Will undo one step, returns false if no undo was done (undos == 0). otherwise, true is returned and one step in the list of undoes is undone.

Returns
-------
bool
") Undo;
		Standard_Boolean Undo();

		/****************** Update ******************/
		/**** md5 signature: 97c07ea29dd5305b368cebf252ceb33b ****/
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
		/**** md5 signature: a48237fc53570334df18734e1672c38a ****/
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
		/**** md5 signature: 7d0015c1a60ffc6e9a01e3d9081f5131 ****/
		%feature("compactdefaultargs") TDocStd_Modified;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") TDocStd_Modified;
		 TDocStd_Modified();

		/****************** Add ******************/
		/**** md5 signature: 86383525d25c987b354e36fad576210c ****/
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
		/**** md5 signature: dcf184d5ea52ec11f1c30bdbbba1bd57 ****/
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
		/**** md5 signature: 9e93a4d4f3d5f8790d097e1fff43e3da ****/
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
		/**** md5 signature: ae54be580b423a6eadbe062e0bdb44c2 ****/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Clear;
		void Clear();

		/****************** Contains ******************/
		/**** md5 signature: 0dd6e3d57c4d3da88b25f8fac0dd5eb4 ****/
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
		/**** md5 signature: bd123f000340e7375ce09c289c0daf49 ****/
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
		/**** md5 signature: 7648f1c097b7b0c852cc4f0bb24dcf2c ****/
		%feature("compactdefaultargs") Get;
		%feature("autodoc", "Returns modified label map.

Returns
-------
TDF_LabelMap
") Get;
		const TDF_LabelMap & Get();

		/****************** GetID ******************/
		/**** md5 signature: afe6002d90f641ca3ea8c9ae9f8fe97c ****/
		%feature("compactdefaultargs") GetID;
		%feature("autodoc", "Modified methods ================.

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
		/**** md5 signature: 4ea2b484127f0664f85494cb4d8b0352 ****/
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
Into: TDF_Attribute
RT: TDF_RelocationTable

Returns
-------
None
") Paste;
		void Paste(const opencascade::handle<TDF_Attribute> & Into, const opencascade::handle<TDF_RelocationTable> & RT);

		/****************** Remove ******************/
		/**** md5 signature: 743b4afbaae6706eb55d9985c7d5b2ba ****/
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
		/**** md5 signature: 0dc39faec3559dcae42899b7e5ef40ff ****/
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
		/**** md5 signature: 014071359c4c474be3bcaa4c0ce0ba18 ****/
		%feature("compactdefaultargs") TDocStd_MultiTransactionManager;
		%feature("autodoc", "Constructor.

Returns
-------
None
") TDocStd_MultiTransactionManager;
		 TDocStd_MultiTransactionManager();

		/****************** AbortCommand ******************/
		/**** md5 signature: d0bb10d25bbdbaf736403be160aab8bb ****/
		%feature("compactdefaultargs") AbortCommand;
		%feature("autodoc", "Unsets the flag of started manager transaction and aborts transaction in each document.

Returns
-------
None
") AbortCommand;
		void AbortCommand();

		/****************** AddDocument ******************/
		/**** md5 signature: 9a296ac138cd691ef833acb7ad441f83 ****/
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
		/**** md5 signature: 24ac296ed75c3df1806aa7bb1fddee55 ****/
		%feature("compactdefaultargs") ClearRedos;
		%feature("autodoc", "Clears redos in the manager and in documents.

Returns
-------
None
") ClearRedos;
		void ClearRedos();

		/****************** ClearUndos ******************/
		/**** md5 signature: 004129249b8506516f5fdd72a4fb8fd0 ****/
		%feature("compactdefaultargs") ClearUndos;
		%feature("autodoc", "Clears undos in the manager and in documents.

Returns
-------
None
") ClearUndos;
		void ClearUndos();

		/****************** CommitCommand ******************/
		/**** md5 signature: faa383479ebff95ab2d1b0ab2a6c6947 ****/
		%feature("compactdefaultargs") CommitCommand;
		%feature("autodoc", "Commits transaction in all documents and fills the transaction manager with the documents that have been changed during the transaction. returns true if new data has been added to myundos. note: all nested transactions in the documents will be commited.

Returns
-------
bool
") CommitCommand;
		Standard_Boolean CommitCommand();

		/****************** CommitCommand ******************/
		/**** md5 signature: d693105a187093a1581df589429f5d07 ****/
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
		/**** md5 signature: 65ccd54a293a56a7b15c353e5c466919 ****/
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
		/**** md5 signature: 500cc68e983f9a7d304824d6e36eaecc ****/
		%feature("compactdefaultargs") GetAvailableRedos;
		%feature("autodoc", "Returns available manager redos.

Returns
-------
TDocStd_SequenceOfApplicationDelta
") GetAvailableRedos;
		const TDocStd_SequenceOfApplicationDelta & GetAvailableRedos();

		/****************** GetAvailableUndos ******************/
		/**** md5 signature: f40ce0c74bf4312033d043449a41d5ee ****/
		%feature("compactdefaultargs") GetAvailableUndos;
		%feature("autodoc", "Returns available manager undos.

Returns
-------
TDocStd_SequenceOfApplicationDelta
") GetAvailableUndos;
		const TDocStd_SequenceOfApplicationDelta & GetAvailableUndos();

		/****************** GetUndoLimit ******************/
		/**** md5 signature: 4d03b93f640587c3abcd1bd1d5a774a9 ****/
		%feature("compactdefaultargs") GetUndoLimit;
		%feature("autodoc", "Returns undo limit for the manager.

Returns
-------
int
") GetUndoLimit;
		Standard_Integer GetUndoLimit();

		/****************** HasOpenCommand ******************/
		/**** md5 signature: dd69c57ebd4821e931afe0accf5d3235 ****/
		%feature("compactdefaultargs") HasOpenCommand;
		%feature("autodoc", "Returns true if a transaction is opened.

Returns
-------
bool
") HasOpenCommand;
		Standard_Boolean HasOpenCommand();

		/****************** IsNestedTransactionMode ******************/
		/**** md5 signature: 1efb73f5e84074596fa47f1cfe63ee41 ****/
		%feature("compactdefaultargs") IsNestedTransactionMode;
		%feature("autodoc", "Returns standard_true if nestedtransaction mode is set. methods for protection of changes outside transactions.

Returns
-------
bool
") IsNestedTransactionMode;
		Standard_Boolean IsNestedTransactionMode();

		/****************** ModificationMode ******************/
		/**** md5 signature: 19d64027addb7f66c90a4e97325ce41b ****/
		%feature("compactdefaultargs") ModificationMode;
		%feature("autodoc", "Returns true if changes are allowed only inside transactions.

Returns
-------
bool
") ModificationMode;
		Standard_Boolean ModificationMode();

		/****************** OpenCommand ******************/
		/**** md5 signature: a5c155bd5cc75696d479b13cfff2f26e ****/
		%feature("compactdefaultargs") OpenCommand;
		%feature("autodoc", "Opens transaction in each document and sets the flag that transaction is opened. if there are already opened transactions in the documents, these transactions will be aborted before openning new ones.

Returns
-------
None
") OpenCommand;
		void OpenCommand();

		/****************** Redo ******************/
		/**** md5 signature: 55e233ab8e907b54603badc49546603c ****/
		%feature("compactdefaultargs") Redo;
		%feature("autodoc", "Redoes the current transaction of the application. it calls the redo () method of the document being on top of the manager list of redos (list.first()) and moves the list item to the top of the list of manager undos (list.prepend(item)).

Returns
-------
None
") Redo;
		void Redo();

		/****************** RemoveDocument ******************/
		/**** md5 signature: ac60ee1ea0f38b322ea5e3e6231dcb3c ****/
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
		/**** md5 signature: 7750535d9082b90d5c689aa99cfe17fb ****/
		%feature("compactdefaultargs") RemoveLastUndo;
		%feature("autodoc", "Removes undo information from the list of undos of the manager and all documents which have been modified during the transaction.

Returns
-------
None
") RemoveLastUndo;
		void RemoveLastUndo();

		/****************** SetModificationMode ******************/
		/**** md5 signature: f670168c2039d1fa00cc4c8fedbbda89 ****/
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
		/**** md5 signature: f79f8b65409bf3f9c2580d96405aa86c ****/
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
		/**** md5 signature: fe308b2e19b2d2ca1b0cf0cb35727ef4 ****/
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
		/**** md5 signature: 7971ef9a4384d347502ae08a96db5b7e ****/
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
		/**** md5 signature: 45393edf2f035cbf7267bf47358417b6 ****/
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
		/**** md5 signature: 79c1f99856b1ab066d94b2ba86b72e8b ****/
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
		/**** md5 signature: 638e8a64fb8a1b19190e69bfce5a264e ****/
		%feature("compactdefaultargs") GetDocument;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TDocStd_Document>
") GetDocument;
		opencascade::handle<TDocStd_Document> GetDocument();

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

		/****************** SetDocument ******************/
		/**** md5 signature: 3140f4f6976eef7ef1608bbacb2422e6 ****/
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
		/**** md5 signature: e3d965df1d5bccf3439b56e69912f637 ****/
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
		/**** md5 signature: ffdba541cb7e638d4f0b1b8c9eb824d5 ****/
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
		/**** md5 signature: 358567513bd0af360dd505afd61f845e ****/
		%feature("compactdefaultargs") Extension;
		%feature("autodoc", "No available documentation.

Returns
-------
TCollection_ExtendedString
") Extension;
		TCollection_ExtendedString Extension();

		/****************** Length ******************/
		/**** md5 signature: 58bd40380acccb2733bfbd37bf3cbb11 ****/
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") Length;
		Standard_Integer Length();

		/****************** Name ******************/
		/**** md5 signature: a9e55299a1405b3a2863469f1a67f9cd ****/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "No available documentation.

Returns
-------
TCollection_ExtendedString
") Name;
		TCollection_ExtendedString Name();

		/****************** Parse ******************/
		/**** md5 signature: 448d69ccb37cbedc06cb767c3a748df4 ****/
		%feature("compactdefaultargs") Parse;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Parse;
		void Parse();

		/****************** Path ******************/
		/**** md5 signature: f6c1194d39f76de7fb92f5471518f512 ****/
		%feature("compactdefaultargs") Path;
		%feature("autodoc", "No available documentation.

Returns
-------
TCollection_ExtendedString
") Path;
		TCollection_ExtendedString Path();

		/****************** Trek ******************/
		/**** md5 signature: dd6933d9f25c18af0c1cb48a9bcd51eb ****/
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
		/**** md5 signature: 39a53e3a8cad74f649a58a099e7cd8d3 ****/
		%feature("compactdefaultargs") TDocStd_XLink;
		%feature("autodoc", "Initializes fields.

Returns
-------
None
") TDocStd_XLink;
		 TDocStd_XLink();

		/****************** AfterAddition ******************/
		/**** md5 signature: c10a57c15d27b9db0d635746de6e11f7 ****/
		%feature("compactdefaultargs") AfterAddition;
		%feature("autodoc", "Updates the xlinkroot attribute by adding <self> to its list.

Returns
-------
None
") AfterAddition;
		void AfterAddition();

		/****************** AfterUndo ******************/
		/**** md5 signature: 6a782c706f1e9291f121f77d889ed576 ****/
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
		/**** md5 signature: be67c343943ad438128f575f7f5feaa1 ****/
		%feature("compactdefaultargs") BackupCopy;
		%feature("autodoc", "Returns a null handle. raise allways for ,it is nonsense to use this method.

Returns
-------
opencascade::handle<TDF_Attribute>
") BackupCopy;
		opencascade::handle<TDF_Attribute> BackupCopy();

		/****************** BeforeRemoval ******************/
		/**** md5 signature: d89eaaf972748732c31cf1a2da2bc4a0 ****/
		%feature("compactdefaultargs") BeforeRemoval;
		%feature("autodoc", "Updates the xlinkroot attribute by removing <self> from its list.

Returns
-------
None
") BeforeRemoval;
		void BeforeRemoval();

		/****************** BeforeUndo ******************/
		/**** md5 signature: d409c3f1c759e5fb3727056dd12910e7 ****/
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
		/**** md5 signature: aed3c77da0189600f213269241abb1a9 ****/
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
		/**** md5 signature: 2e49b1b9cd0559e272eb5e5bc90c96a3 ****/
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
		/**** md5 signature: afe6002d90f641ca3ea8c9ae9f8fe97c ****/
		%feature("compactdefaultargs") GetID;
		%feature("autodoc", "Returns the guid for external links.

Returns
-------
Standard_GUID
") GetID;
		static const Standard_GUID & GetID();

		/****************** ID ******************/
		/**** md5 signature: 4697ce8a095fa6dcef0217708d19718f ****/
		%feature("compactdefaultargs") ID;
		%feature("autodoc", "Returns the id of the attribute.

Returns
-------
Standard_GUID
") ID;
		const Standard_GUID & ID();

		/****************** LabelEntry ******************/
		/**** md5 signature: 6242bd2f6f23f032bd2a986b8970d960 ****/
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
		/**** md5 signature: 2e987d6addb82a1bee92a0d2d9da7462 ****/
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
		/**** md5 signature: bda75a377517bdf3b65a3a4ff247121d ****/
		%feature("compactdefaultargs") LabelEntry;
		%feature("autodoc", "Returns the contents of the field <mylabelentry>.

Returns
-------
TCollection_AsciiString
") LabelEntry;
		const TCollection_AsciiString & LabelEntry();

		/****************** NewEmpty ******************/
		/**** md5 signature: c6d13c9ecc64c6c803b6e119e8216934 ****/
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "Returns a null handle.

Returns
-------
opencascade::handle<TDF_Attribute>
") NewEmpty;
		opencascade::handle<TDF_Attribute> NewEmpty();

		/****************** Paste ******************/
		/**** md5 signature: 732eeda7b56fec2b5bb3307d96171353 ****/
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
		/**** md5 signature: f52dc28ed8fe4be2a44014ebfb6e733e ****/
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
		/**** md5 signature: 484316d732c49db0f00ef2f49dd912fd ****/
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
		/**** md5 signature: de31c7fefef822def367ff590e32e7e1 ****/
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
		/**** md5 signature: 17d0e0c752e4b5e365ef44cb6df64158 ****/
		%feature("compactdefaultargs") TDocStd_XLinkIterator;
		%feature("autodoc", "Returns an empty iterator;.

Returns
-------
None
") TDocStd_XLinkIterator;
		 TDocStd_XLinkIterator();

		/****************** TDocStd_XLinkIterator ******************/
		/**** md5 signature: 518fdcba08eeb2b00084a7ff08b98b02 ****/
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
		/**** md5 signature: 72e60e820ae0694ae8f07fd09bd9aeff ****/
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
		%feature("autodoc", "Move to the next item; raises if there is no more item.

Returns
-------
None
") Next;
		void Next();

		/****************** Value ******************/
		/**** md5 signature: 5f4b96c0711ba7f24b3f8859cb074e4f ****/
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
		/**** md5 signature: be67c343943ad438128f575f7f5feaa1 ****/
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
		/**** md5 signature: afe6002d90f641ca3ea8c9ae9f8fe97c ****/
		%feature("compactdefaultargs") GetID;
		%feature("autodoc", "Returns the id: 2a96b61d-ec8b-11d0-bee7-080009dc3333.

Returns
-------
Standard_GUID
") GetID;
		static const Standard_GUID & GetID();

		/****************** ID ******************/
		/**** md5 signature: 4697ce8a095fa6dcef0217708d19718f ****/
		%feature("compactdefaultargs") ID;
		%feature("autodoc", "Returns the id of the attribute.

Returns
-------
Standard_GUID
") ID;
		const Standard_GUID & ID();

		/****************** Insert ******************/
		/**** md5 signature: a80101668d59dec9cb6049e1ad5aa1dc ****/
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
		/**** md5 signature: c6d13c9ecc64c6c803b6e119e8216934 ****/
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "Returns a null handle.

Returns
-------
opencascade::handle<TDF_Attribute>
") NewEmpty;
		opencascade::handle<TDF_Attribute> NewEmpty();

		/****************** Paste ******************/
		/**** md5 signature: 732eeda7b56fec2b5bb3307d96171353 ****/
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
		/**** md5 signature: e4a602bdf2acecc2ee81080c6cd72f25 ****/
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
		/**** md5 signature: f52dc28ed8fe4be2a44014ebfb6e733e ****/
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
		/**** md5 signature: f26158934dc78aa70e28353b34d00047 ****/
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
		/**** md5 signature: 62a3035690eb5598ecb230b66226a54d ****/
		%feature("compactdefaultargs") TDocStd_XLinkTool;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") TDocStd_XLinkTool;
		 TDocStd_XLinkTool();

		/****************** Copy ******************/
		/**** md5 signature: 40287a29bb62ecf8fd177c44ed29dc25 ****/
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
		/**** md5 signature: 1e751ce78167012e15d258327b145ca4 ****/
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
		/**** md5 signature: 23008ec82af3c321329d8aca96ad4c70 ****/
		%feature("compactdefaultargs") DataSet;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TDF_DataSet>
") DataSet;
		opencascade::handle<TDF_DataSet> DataSet();

		/****************** IsDone ******************/
		/**** md5 signature: ec0624071ec7da54b3d9dacc7bcb05f9 ****/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsDone;
		Standard_Boolean IsDone();

		/****************** RelocationTable ******************/
		/**** md5 signature: 671660b65181661cbeabfffeb9205cbd ****/
		%feature("compactdefaultargs") RelocationTable;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TDF_RelocationTable>
") RelocationTable;
		opencascade::handle<TDF_RelocationTable> RelocationTable();

		/****************** UpdateLink ******************/
		/**** md5 signature: 957825b1452e7ebab5f8e01bf712f434 ****/
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
