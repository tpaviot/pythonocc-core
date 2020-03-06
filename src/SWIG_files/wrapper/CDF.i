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
%define CDFDOCSTRING
"CDF module, see official documentation at
https://www.opencascade.com/doc/occt-7.4.0/refman/html/package_cdf.html"
%enddef
%module (package="OCC.Core", docstring=CDFDOCSTRING) CDF


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
#include<CDF_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<CDM_module.hxx>
#include<TCollection_module.hxx>
#include<PCDM_module.hxx>
#include<Resource_module.hxx>
#include<Message_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import CDM.i
%import TCollection.i
%import PCDM.i

%pythoncode {
from OCC.Core.Exception import *
};

/* public enums */
enum CDF_TypeOfActivation {
	CDF_TOA_New = 0,
	CDF_TOA_Modified = 1,
	CDF_TOA_Unchanged = 2,
};

enum CDF_TryStoreStatus {
	CDF_TS_OK = 0,
	CDF_TS_NoCurrentDocument = 1,
	CDF_TS_NoDriver = 2,
	CDF_TS_NoSubComponentDriver = 3,
};

enum CDF_SubComponentStatus {
	CDF_SCS_Consistent = 0,
	CDF_SCS_Unconsistent = 1,
	CDF_SCS_Stored = 2,
	CDF_SCS_Modified = 3,
};

enum CDF_StoreSetNameStatus {
	CDF_SSNS_OK = 0,
	CDF_SSNS_ReplacingAnExistentDocument = 1,
	CDF_SSNS_OpenDocument = 2,
};

/* end public enums declaration */

/* python proy classes for enums */
%pythoncode {

class CDF_TypeOfActivation:
	CDF_TOA_New = 0
	CDF_TOA_Modified = 1
	CDF_TOA_Unchanged = 2

class CDF_TryStoreStatus:
	CDF_TS_OK = 0
	CDF_TS_NoCurrentDocument = 1
	CDF_TS_NoDriver = 2
	CDF_TS_NoSubComponentDriver = 3

class CDF_SubComponentStatus:
	CDF_SCS_Consistent = 0
	CDF_SCS_Unconsistent = 1
	CDF_SCS_Stored = 2
	CDF_SCS_Modified = 3

class CDF_StoreSetNameStatus:
	CDF_SSNS_OK = 0
	CDF_SSNS_ReplacingAnExistentDocument = 1
	CDF_SSNS_OpenDocument = 2
};
/* end python proxy for enums */

/* handles */
%wrap_handle(CDF_Application)
%wrap_handle(CDF_Directory)
%wrap_handle(CDF_MetaDataDriver)
%wrap_handle(CDF_MetaDataDriverFactory)
%wrap_handle(CDF_Session)
%wrap_handle(CDF_StoreList)
%wrap_handle(CDF_FWOSDriver)
/* end handles declaration */

/* templates */
/* end templates declaration */

/* typedefs */
/* end typedefs declaration */

/************
* class CDF *
************/
%rename(cdf) CDF;
class CDF {
	public:
		/****************** GetLicense ******************/
		%feature("compactdefaultargs") GetLicense;
		%feature("autodoc", "No available documentation.

Parameters
----------
anApplicationIdentifier: int

Returns
-------
None
") GetLicense;
		static void GetLicense(const Standard_Integer anApplicationIdentifier);

		/****************** IsAvailable ******************/
		%feature("compactdefaultargs") IsAvailable;
		%feature("autodoc", "No available documentation.

Parameters
----------
anApplicationIdentifier: int

Returns
-------
bool
") IsAvailable;
		static Standard_Boolean IsAvailable(const Standard_Integer anApplicationIdentifier);

};


%extend CDF {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************
* class CDF_Application *
************************/
%nodefaultctor CDF_Application;
class CDF_Application : public CDM_Application {
	public:
		/****************** CanClose ******************/
		%feature("compactdefaultargs") CanClose;
		%feature("autodoc", "No available documentation.

Parameters
----------
aDocument: CDM_Document

Returns
-------
CDM_CanCloseStatus
") CanClose;
		CDM_CanCloseStatus CanClose(const opencascade::handle<CDM_Document> & aDocument);

		/****************** CanRetrieve ******************/
		%feature("compactdefaultargs") CanRetrieve;
		%feature("autodoc", "No available documentation.

Parameters
----------
aFolder: TCollection_ExtendedString
aName: TCollection_ExtendedString

Returns
-------
PCDM_ReaderStatus
") CanRetrieve;
		PCDM_ReaderStatus CanRetrieve(const TCollection_ExtendedString & aFolder, const TCollection_ExtendedString & aName);

		/****************** CanRetrieve ******************/
		%feature("compactdefaultargs") CanRetrieve;
		%feature("autodoc", "No available documentation.

Parameters
----------
aFolder: TCollection_ExtendedString
aName: TCollection_ExtendedString
aVersion: TCollection_ExtendedString

Returns
-------
PCDM_ReaderStatus
") CanRetrieve;
		PCDM_ReaderStatus CanRetrieve(const TCollection_ExtendedString & aFolder, const TCollection_ExtendedString & aName, const TCollection_ExtendedString & aVersion);

		/****************** Close ******************/
		%feature("compactdefaultargs") Close;
		%feature("autodoc", "Removes the document of the current session directory and closes the document;.

Parameters
----------
aDocument: CDM_Document

Returns
-------
None
") Close;
		void Close(const opencascade::handle<CDM_Document> & aDocument);

		/****************** DefaultFolder ******************/
		%feature("compactdefaultargs") DefaultFolder;
		%feature("autodoc", "No available documentation.

Returns
-------
Standard_ExtString
") DefaultFolder;
		Standard_ExtString DefaultFolder();

		/****************** Format ******************/
		%feature("compactdefaultargs") Format;
		%feature("autodoc", "Try to retrieve a format directly in the file or in application resource by using extension. returns true if found;.

Parameters
----------
aFileName: TCollection_ExtendedString
theFormat: TCollection_ExtendedString

Returns
-------
bool
") Format;
		Standard_Boolean Format(const TCollection_ExtendedString & aFileName, TCollection_ExtendedString & theFormat);

		/****************** GetRetrieveStatus ******************/
		%feature("compactdefaultargs") GetRetrieveStatus;
		%feature("autodoc", "Checks status after retrieve.

Returns
-------
PCDM_ReaderStatus
") GetRetrieveStatus;
		PCDM_ReaderStatus GetRetrieveStatus();

		/****************** Load ******************/
		%feature("compactdefaultargs") Load;
		%feature("autodoc", "Plugs an application. //! open is used - for opening a document that has been created in an application - for opening a document from the database - for opening a document from a file. the open methods always add the document in the session directory and calls the virtual activate method. the document is considered to be opened until close is used. to be storable, a document must be opened by an application since the application resources are needed to store it.

Parameters
----------
aGUID: Standard_GUID

Returns
-------
opencascade::handle<CDF_Application>
") Load;
		static opencascade::handle<CDF_Application> Load(const Standard_GUID & aGUID);

		/****************** Open ******************/
		%feature("compactdefaultargs") Open;
		%feature("autodoc", "Puts the document in the current session directory and calls the virtual method activate on it.

Parameters
----------
aDocument: CDM_Document

Returns
-------
None
") Open;
		void Open(const opencascade::handle<CDM_Document> & aDocument);


            %feature("autodoc", "1");
            %extend{
                void ReadFromString(std::string src) {
                std::stringstream s(src);
                self->Read(s);}
            };
		/****************** ReaderFromFormat ******************/
		%feature("compactdefaultargs") ReaderFromFormat;
		%feature("autodoc", "Returns instance of read driver for specified format. //! default implementation uses plugin mechanism to load reader dynamically. for this to work, application resources should define guid of the plugin as value of [format].retrievalplugin, and 'plugin' resource should define name of plugin library to be loaded as value of [guid].location. plugin library should provide method pluginfactory returning instance of the reader for the same guid (see plugin_macro.hxx). //! in case if reader is not available, will raise standard_nosuchobject or other exception if raised by plugin loader.

Parameters
----------
aFormat: TCollection_ExtendedString

Returns
-------
opencascade::handle<PCDM_Reader>
") ReaderFromFormat;
		virtual opencascade::handle<PCDM_Reader> ReaderFromFormat(const TCollection_ExtendedString & aFormat);

		/****************** Retrieve ******************/
		%feature("compactdefaultargs") Retrieve;
		%feature("autodoc", "This method retrieves a document from the database. if the document references other documents which have been updated, the latest version of these documents will be used if {usestorageconfiguration} is standard_true. the content of {afolder}, {aname} and {aversion} depends on the database manager system. if the dbms is only based on the os, {afolder} is a directory and {aname} is the name of a file. in this case the use of the syntax with {aversion} has no sense. for example: //! opencascade::handle<cdm_document> thedocument=myapplication->retrieve('/home/cascade','box.dsg'); if the dbms is euclid/design manager, {afolder}, {aname} have the form they have in euclid/design manager. for example: //! opencascade::handle<cdm_document> thedocument=myapplication->retrieve('|user|cascade','box'); //! since the version is not specified in this syntax, the latest wil be used. a link is kept with the database through an instance of cdm_metadata.

Parameters
----------
aFolder: TCollection_ExtendedString
aName: TCollection_ExtendedString
UseStorageConfiguration: bool,optional
	default value is Standard_True

Returns
-------
opencascade::handle<CDM_Document>
") Retrieve;
		opencascade::handle<CDM_Document> Retrieve(const TCollection_ExtendedString & aFolder, const TCollection_ExtendedString & aName, const Standard_Boolean UseStorageConfiguration = Standard_True);

		/****************** Retrieve ******************/
		%feature("compactdefaultargs") Retrieve;
		%feature("autodoc", "This method retrieves a document from the database. if the document references other documents which have been updated, the latest version of these documents will be used if {usestorageconfiguration} is standard_true. -- if the dbms is only based on the os, this syntax should not be used. //! if the dbms is euclid/design manager, {afolder}, {aname} and {aversion} have the form they have in euclid/design manager. for example: //! opencascade::handle<cdm_document> thedocument=myapplication->retrieve('|user|cascade','box','2'); a link is kept with the database through an instance of cdm_metadata.

Parameters
----------
aFolder: TCollection_ExtendedString
aName: TCollection_ExtendedString
aVersion: TCollection_ExtendedString
UseStorageConfiguration: bool,optional
	default value is Standard_True

Returns
-------
opencascade::handle<CDM_Document>
") Retrieve;
		opencascade::handle<CDM_Document> Retrieve(const TCollection_ExtendedString & aFolder, const TCollection_ExtendedString & aName, const TCollection_ExtendedString & aVersion, const Standard_Boolean UseStorageConfiguration = Standard_True);

		/****************** SetDefaultFolder ******************/
		%feature("compactdefaultargs") SetDefaultFolder;
		%feature("autodoc", "No available documentation.

Parameters
----------
aFolder: Standard_ExtString

Returns
-------
bool
") SetDefaultFolder;
		Standard_Boolean SetDefaultFolder(const Standard_ExtString aFolder);

		/****************** WriterFromFormat ******************/
		%feature("compactdefaultargs") WriterFromFormat;
		%feature("autodoc", "Returns instance of storage driver for specified format. //! default implementation uses plugin mechanism to load driver dynamically. for this to work, application resources should define guid of the plugin as value of [format].storageplugin, and 'plugin' resource should define name of plugin library to be loaded as value of [guid].location. plugin library should provide method pluginfactory returning instance of the reader for the same guid (see plugin_macro.hxx). //! in case if driver is not available, will raise standard_nosuchobject or other exception if raised by plugin loader.

Parameters
----------
aFormat: TCollection_ExtendedString

Returns
-------
opencascade::handle<PCDM_StorageDriver>
") WriterFromFormat;
		virtual opencascade::handle<PCDM_StorageDriver> WriterFromFormat(const TCollection_ExtendedString & aFormat);

};


%make_alias(CDF_Application)

%extend CDF_Application {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************
* class CDF_Directory *
**********************/
class CDF_Directory : public Standard_Transient {
	public:
		/****************** CDF_Directory ******************/
		%feature("compactdefaultargs") CDF_Directory;
		%feature("autodoc", "Creates an empty directory.

Returns
-------
None
") CDF_Directory;
		 CDF_Directory();

		/****************** Add ******************/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "Adds a document into the directory.

Parameters
----------
aDocument: CDM_Document

Returns
-------
None
") Add;
		void Add(const opencascade::handle<CDM_Document> & aDocument);

		/****************** Contains ******************/
		%feature("compactdefaultargs") Contains;
		%feature("autodoc", "Returns true if the document adocument is in the directory.

Parameters
----------
aDocument: CDM_Document

Returns
-------
bool
") Contains;
		Standard_Boolean Contains(const opencascade::handle<CDM_Document> & aDocument);

		/****************** IsEmpty ******************/
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "Returns true if the directory is empty.

Returns
-------
bool
") IsEmpty;
		Standard_Boolean IsEmpty();

		/****************** Last ******************/
		%feature("compactdefaultargs") Last;
		%feature("autodoc", "Returns the last document (if any) which has been added in the directory.

Returns
-------
opencascade::handle<CDM_Document>
") Last;
		opencascade::handle<CDM_Document> Last();

		/****************** Length ******************/
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "Returns the number of documents of the directory.

Returns
-------
int
") Length;
		Standard_Integer Length();

		/****************** Remove ******************/
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "Removes the document.

Parameters
----------
aDocument: CDM_Document

Returns
-------
None
") Remove;
		void Remove(const opencascade::handle<CDM_Document> & aDocument);

};


%make_alias(CDF_Directory)

%extend CDF_Directory {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************
* class CDF_DirectoryIterator *
******************************/
class CDF_DirectoryIterator {
	public:
		/****************** CDF_DirectoryIterator ******************/
		%feature("compactdefaultargs") CDF_DirectoryIterator;
		%feature("autodoc", "Creates an iterator with the directory of the current cdf.

Returns
-------
None
") CDF_DirectoryIterator;
		 CDF_DirectoryIterator();

		/****************** CDF_DirectoryIterator ******************/
		%feature("compactdefaultargs") CDF_DirectoryIterator;
		%feature("autodoc", "No available documentation.

Parameters
----------
aDirectory: CDF_Directory

Returns
-------
None
") CDF_DirectoryIterator;
		 CDF_DirectoryIterator(const opencascade::handle<CDF_Directory> & aDirectory);

		/****************** Document ******************/
		%feature("compactdefaultargs") Document;
		%feature("autodoc", "Returns item value of current entry.

Returns
-------
opencascade::handle<CDM_Document>
") Document;
		opencascade::handle<CDM_Document> Document();

		/****************** MoreDocument ******************/
		%feature("compactdefaultargs") MoreDocument;
		%feature("autodoc", "Returns true if there are more entries to return.

Returns
-------
bool
") MoreDocument;
		Standard_Boolean MoreDocument();

		/****************** NextDocument ******************/
		%feature("compactdefaultargs") NextDocument;
		%feature("autodoc", "Go to the next entry (if there is not, value will raise an exception).

Returns
-------
None
") NextDocument;
		void NextDocument();

};


%extend CDF_DirectoryIterator {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************
* class CDF_MetaDataDriver *
***************************/
%nodefaultctor CDF_MetaDataDriver;
class CDF_MetaDataDriver : public Standard_Transient {
	public:
		/****************** BuildFileName ******************/
		%feature("compactdefaultargs") BuildFileName;
		%feature("autodoc", "No available documentation.

Parameters
----------
aDocument: CDM_Document

Returns
-------
TCollection_ExtendedString
") BuildFileName;
		virtual TCollection_ExtendedString BuildFileName(const opencascade::handle<CDM_Document> & aDocument);

		/****************** CreateDependsOn ******************/
		%feature("compactdefaultargs") CreateDependsOn;
		%feature("autodoc", "Creates a 'depends on' relation between two datas. by default does nothing.

Parameters
----------
aFirstData: CDM_MetaData
aSecondData: CDM_MetaData

Returns
-------
None
") CreateDependsOn;
		virtual void CreateDependsOn(const opencascade::handle<CDM_MetaData> & aFirstData, const opencascade::handle<CDM_MetaData> & aSecondData);

		/****************** CreateMetaData ******************/
		%feature("compactdefaultargs") CreateMetaData;
		%feature("autodoc", "Should create meta-data corresponding to adata and maintaining a meta-link between these meta-data and afilename createmetadata is called by createdata if the metadata-driver has version capabilities, version must be set in the returned data.

Parameters
----------
aDocument: CDM_Document
aFileName: TCollection_ExtendedString

Returns
-------
opencascade::handle<CDM_MetaData>
") CreateMetaData;
		virtual opencascade::handle<CDM_MetaData> CreateMetaData(const opencascade::handle<CDM_Document> & aDocument, const TCollection_ExtendedString & aFileName);

		/****************** CreateReference ******************/
		%feature("compactdefaultargs") CreateReference;
		%feature("autodoc", "No available documentation.

Parameters
----------
aFrom: CDM_MetaData
aTo: CDM_MetaData
aReferenceIdentifier: int
aToDocumentVersion: int

Returns
-------
None
") CreateReference;
		virtual void CreateReference(const opencascade::handle<CDM_MetaData> & aFrom, const opencascade::handle<CDM_MetaData> & aTo, const Standard_Integer aReferenceIdentifier, const Standard_Integer aToDocumentVersion);

		/****************** DefaultFolder ******************/
		%feature("compactdefaultargs") DefaultFolder;
		%feature("autodoc", "No available documentation.

Returns
-------
TCollection_ExtendedString
") DefaultFolder;
		virtual TCollection_ExtendedString DefaultFolder();

		/****************** Find ******************/
		%feature("compactdefaultargs") Find;
		%feature("autodoc", "Should indicate whether meta-data exist in the dbms corresponding to the data. aversion may be null;.

Parameters
----------
aFolder: TCollection_ExtendedString
aName: TCollection_ExtendedString
aVersion: TCollection_ExtendedString

Returns
-------
bool
") Find;
		virtual Standard_Boolean Find(const TCollection_ExtendedString & aFolder, const TCollection_ExtendedString & aName, const TCollection_ExtendedString & aVersion);

		/****************** Find ******************/
		%feature("compactdefaultargs") Find;
		%feature("autodoc", "Calls find with an empty version.

Parameters
----------
aFolder: TCollection_ExtendedString
aName: TCollection_ExtendedString

Returns
-------
bool
") Find;
		Standard_Boolean Find(const TCollection_ExtendedString & aFolder, const TCollection_ExtendedString & aName);

		/****************** FindFolder ******************/
		%feature("compactdefaultargs") FindFolder;
		%feature("autodoc", "No available documentation.

Parameters
----------
aFolder: TCollection_ExtendedString

Returns
-------
bool
") FindFolder;
		virtual Standard_Boolean FindFolder(const TCollection_ExtendedString & aFolder);

		/****************** HasReadPermission ******************/
		%feature("compactdefaultargs") HasReadPermission;
		%feature("autodoc", "No available documentation.

Parameters
----------
aFolder: TCollection_ExtendedString
aName: TCollection_ExtendedString
aVersion: TCollection_ExtendedString

Returns
-------
bool
") HasReadPermission;
		virtual Standard_Boolean HasReadPermission(const TCollection_ExtendedString & aFolder, const TCollection_ExtendedString & aName, const TCollection_ExtendedString & aVersion);

		/****************** HasVersion ******************/
		%feature("compactdefaultargs") HasVersion;
		%feature("autodoc", "By default return standard_true.

Parameters
----------
aFolder: TCollection_ExtendedString
aName: TCollection_ExtendedString

Returns
-------
bool
") HasVersion;
		virtual Standard_Boolean HasVersion(const TCollection_ExtendedString & aFolder, const TCollection_ExtendedString & aName);

		/****************** HasVersionCapability ******************/
		%feature("compactdefaultargs") HasVersionCapability;
		%feature("autodoc", "Returns true if the metadatadriver can manage different versions of a data. by default, returns standard_false.

Returns
-------
bool
") HasVersionCapability;
		virtual Standard_Boolean HasVersionCapability();

		/****************** LastVersion ******************/
		%feature("compactdefaultargs") LastVersion;
		%feature("autodoc", "By default returns ametadata should return the metadata stored in the dbms with the meta-data corresponding to the path. if the metadatadriver has version management capabilities the version has to be set in the returned metadata. metadata is called by getmetadata if the version is not included in the path , metadata should return the last version of the metadata is deferred;.

Parameters
----------
aMetaData: CDM_MetaData

Returns
-------
opencascade::handle<CDM_MetaData>
") LastVersion;
		virtual opencascade::handle<CDM_MetaData> LastVersion(const opencascade::handle<CDM_MetaData> & aMetaData);

		/****************** MetaData ******************/
		%feature("compactdefaultargs") MetaData;
		%feature("autodoc", "Should return the metadata stored in the dbms with the meta-data corresponding to the data. if the metadatadriver has version management capabilities the version has to be set in the returned metadata. aversion may be null metadata is called by getmetadata if the version is set to null, metadata should return the last version of the metadata.

Parameters
----------
aFolder: TCollection_ExtendedString
aName: TCollection_ExtendedString
aVersion: TCollection_ExtendedString

Returns
-------
opencascade::handle<CDM_MetaData>
") MetaData;
		virtual opencascade::handle<CDM_MetaData> MetaData(const TCollection_ExtendedString & aFolder, const TCollection_ExtendedString & aName, const TCollection_ExtendedString & aVersion);

		/****************** MetaData ******************/
		%feature("compactdefaultargs") MetaData;
		%feature("autodoc", "Calls metadata with an empty version.

Parameters
----------
aFolder: TCollection_ExtendedString
aName: TCollection_ExtendedString

Returns
-------
opencascade::handle<CDM_MetaData>
") MetaData;
		opencascade::handle<CDM_MetaData> MetaData(const TCollection_ExtendedString & aFolder, const TCollection_ExtendedString & aName);

		/****************** ReferenceIterator ******************/
		%feature("compactdefaultargs") ReferenceIterator;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<PCDM_ReferenceIterator>
") ReferenceIterator;
		virtual opencascade::handle<PCDM_ReferenceIterator> ReferenceIterator();

		/****************** SetName ******************/
		%feature("compactdefaultargs") SetName;
		%feature("autodoc", "This methods is usefull if the name of an object -- depends on the metadatadriver. for example a driver -- based on the operating system can choose to add the extension of file to create to the object.

Parameters
----------
aDocument: CDM_Document
aName: TCollection_ExtendedString

Returns
-------
TCollection_ExtendedString
") SetName;
		virtual TCollection_ExtendedString SetName(const opencascade::handle<CDM_Document> & aDocument, const TCollection_ExtendedString & aName);

};


%make_alias(CDF_MetaDataDriver)

%extend CDF_MetaDataDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************************
* class CDF_MetaDataDriverFactory *
**********************************/
%nodefaultctor CDF_MetaDataDriverFactory;
class CDF_MetaDataDriverFactory : public Standard_Transient {
	public:
		/****************** Build ******************/
		%feature("compactdefaultargs") Build;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<CDF_MetaDataDriver>
") Build;
		virtual opencascade::handle<CDF_MetaDataDriver> Build();

};


%make_alias(CDF_MetaDataDriverFactory)

%extend CDF_MetaDataDriverFactory {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************
* class CDF_Session *
********************/
class CDF_Session : public Standard_Transient {
	public:
		/****************** CDF_Session ******************/
		%feature("compactdefaultargs") CDF_Session;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") CDF_Session;
		 CDF_Session();

		/****************** CurrentApplication ******************/
		%feature("compactdefaultargs") CurrentApplication;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<CDF_Application>
") CurrentApplication;
		opencascade::handle<CDF_Application> CurrentApplication();

		/****************** CurrentSession ******************/
		%feature("compactdefaultargs") CurrentSession;
		%feature("autodoc", "Returns the only one instance of session that has been created.

Returns
-------
opencascade::handle<CDF_Session>
") CurrentSession;
		static opencascade::handle<CDF_Session> CurrentSession();

		/****************** Directory ******************/
		%feature("compactdefaultargs") Directory;
		%feature("autodoc", "Returns the directory of the session;.

Returns
-------
opencascade::handle<CDF_Directory>
") Directory;
		opencascade::handle<CDF_Directory> Directory();

		/****************** Exists ******************/
		%feature("compactdefaultargs") Exists;
		%feature("autodoc", "Returns true if a session has been created.

Returns
-------
bool
") Exists;
		static Standard_Boolean Exists();

		/****************** HasCurrentApplication ******************/
		%feature("compactdefaultargs") HasCurrentApplication;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") HasCurrentApplication;
		Standard_Boolean HasCurrentApplication();

		/****************** LoadDriver ******************/
		%feature("compactdefaultargs") LoadDriver;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") LoadDriver;
		void LoadDriver();

		/****************** MetaDataDriver ******************/
		%feature("compactdefaultargs") MetaDataDriver;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<CDF_MetaDataDriver>
") MetaDataDriver;
		opencascade::handle<CDF_MetaDataDriver> MetaDataDriver();

		/****************** SetCurrentApplication ******************/
		%feature("compactdefaultargs") SetCurrentApplication;
		%feature("autodoc", "No available documentation.

Parameters
----------
anApplication: CDF_Application

Returns
-------
None
") SetCurrentApplication;
		void SetCurrentApplication(const opencascade::handle<CDF_Application> & anApplication);

		/****************** UnsetCurrentApplication ******************/
		%feature("compactdefaultargs") UnsetCurrentApplication;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") UnsetCurrentApplication;
		void UnsetCurrentApplication();

};


%make_alias(CDF_Session)

%extend CDF_Session {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************
* class CDF_Store *
******************/
class CDF_Store {
	public:
		/****************** CDF_Store ******************/
		%feature("compactdefaultargs") CDF_Store;
		%feature("autodoc", "Creates a store list from the document of the current selection.

Parameters
----------
aDocument: CDM_Document

Returns
-------
None
") CDF_Store;
		 CDF_Store(const opencascade::handle<CDM_Document> & aDocument);

		/****************** AssociatedStatusText ******************/
		%feature("compactdefaultargs") AssociatedStatusText;
		%feature("autodoc", "No available documentation.

Returns
-------
Standard_ExtString
") AssociatedStatusText;
		Standard_ExtString AssociatedStatusText();

		/****************** Comment ******************/
		%feature("compactdefaultargs") Comment;
		%feature("autodoc", "No available documentation.

Returns
-------
Standard_ExtString
") Comment;
		Standard_ExtString Comment();

		/****************** Component ******************/
		%feature("compactdefaultargs") Component;
		%feature("autodoc", "Returns item value of current entry.

Returns
-------
Standard_ExtString
") Component;
		Standard_ExtString Component();

		/****************** CurrentIsConsistent ******************/
		%feature("compactdefaultargs") CurrentIsConsistent;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") CurrentIsConsistent;
		Standard_Boolean CurrentIsConsistent();

		/****************** Description ******************/
		%feature("compactdefaultargs") Description;
		%feature("autodoc", "Returns the description of the format of the main object.

Returns
-------
Standard_ExtString
") Description;
		Standard_ExtString Description();

		/****************** Folder ******************/
		%feature("compactdefaultargs") Folder;
		%feature("autodoc", "Returns the folder in which the current document will be stored.

Returns
-------
Standard_ExtString
") Folder;
		Standard_ExtString Folder();

		/****************** HasAPreviousVersion ******************/
		%feature("compactdefaultargs") HasAPreviousVersion;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") HasAPreviousVersion;
		Standard_Boolean HasAPreviousVersion();

		/****************** HasSubComponents ******************/
		%feature("compactdefaultargs") HasSubComponents;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") HasSubComponents;
		Standard_Boolean HasSubComponents();

		/****************** InitComponent ******************/
		%feature("compactdefaultargs") InitComponent;
		%feature("autodoc", "Allows to start a new iteration from beginning.

Returns
-------
None
") InitComponent;
		void InitComponent();

		/****************** IsConsistent ******************/
		%feature("compactdefaultargs") IsConsistent;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsConsistent;
		Standard_Boolean IsConsistent();

		/****************** IsMainDocument ******************/
		%feature("compactdefaultargs") IsMainDocument;
		%feature("autodoc", "Returns true if the currentdocument is the main one, ie the document of the current selection.

Returns
-------
bool
") IsMainDocument;
		Standard_Boolean IsMainDocument();

		/****************** IsModified ******************/
		%feature("compactdefaultargs") IsModified;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsModified;
		Standard_Boolean IsModified();

		/****************** IsStored ******************/
		%feature("compactdefaultargs") IsStored;
		%feature("autodoc", "Returns true if the current document is already stored.

Returns
-------
bool
") IsStored;
		Standard_Boolean IsStored();

		/****************** MetaDataPath ******************/
		%feature("compactdefaultargs") MetaDataPath;
		%feature("autodoc", "Returns the path of the previous store is the object is already stored, otherwise an empty string;.

Returns
-------
Standard_ExtString
") MetaDataPath;
		Standard_ExtString MetaDataPath();

		/****************** MoreComponent ******************/
		%feature("compactdefaultargs") MoreComponent;
		%feature("autodoc", "Returns true if there are more entries to return.

Returns
-------
bool
") MoreComponent;
		Standard_Boolean MoreComponent();

		/****************** Name ******************/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "Returns the name under which the current document will be stored.

Returns
-------
Standard_ExtString
") Name;
		Standard_ExtString Name();

		/****************** NextComponent ******************/
		%feature("compactdefaultargs") NextComponent;
		%feature("autodoc", "Go to the next entry (if there is not, value will raise an exception).

Returns
-------
None
") NextComponent;
		void NextComponent();

		/****************** Path ******************/
		%feature("compactdefaultargs") Path;
		%feature("autodoc", "Returns the complete path of the created meta-data.

Returns
-------
Standard_ExtString
") Path;
		Standard_ExtString Path();

		/****************** PreviousVersion ******************/
		%feature("compactdefaultargs") PreviousVersion;
		%feature("autodoc", "No available documentation.

Returns
-------
Standard_ExtString
") PreviousVersion;
		Standard_ExtString PreviousVersion();

		/****************** Realize ******************/
		%feature("compactdefaultargs") Realize;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Realize;
		void Realize();

		/****************** RecheckName ******************/
		%feature("compactdefaultargs") RecheckName;
		%feature("autodoc", "Defines the name under which the document should be stored. uses for example after modification of the folder.

Returns
-------
CDF_StoreSetNameStatus
") RecheckName;
		CDF_StoreSetNameStatus RecheckName();

		/****************** SetComment ******************/
		%feature("compactdefaultargs") SetComment;
		%feature("autodoc", "No available documentation.

Parameters
----------
aComment: Standard_ExtString

Returns
-------
None
") SetComment;
		void SetComment(const Standard_ExtString aComment);

		/****************** SetCurrent ******************/
		%feature("compactdefaultargs") SetCurrent;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") SetCurrent;
		void SetCurrent();

		/****************** SetCurrent ******************/
		%feature("compactdefaultargs") SetCurrent;
		%feature("autodoc", "No available documentation.

Parameters
----------
aPresentation: Standard_ExtString

Returns
-------
None
") SetCurrent;
		void SetCurrent(const Standard_ExtString aPresentation);

		/****************** SetFolder ******************/
		%feature("compactdefaultargs") SetFolder;
		%feature("autodoc", "Defines the folder in which the document should be stored. returns standard_true if the folder exists, standard_false otherwise.

Parameters
----------
aFolder: TCollection_ExtendedString

Returns
-------
bool
") SetFolder;
		Standard_Boolean SetFolder(const TCollection_ExtendedString & aFolder);

		/****************** SetFolder ******************/
		%feature("compactdefaultargs") SetFolder;
		%feature("autodoc", "Defines the folder in which the document should be stored. returns standard_true if the folder exists, standard_false otherwise.

Parameters
----------
aFolder: Standard_ExtString

Returns
-------
bool
") SetFolder;
		Standard_Boolean SetFolder(const Standard_ExtString aFolder);

		/****************** SetMain ******************/
		%feature("compactdefaultargs") SetMain;
		%feature("autodoc", "The two following methods can be used just after realize or import -- method to know if thes methods worked correctly, and if not why.

Returns
-------
None
") SetMain;
		void SetMain();

		/****************** SetName ******************/
		%feature("compactdefaultargs") SetName;
		%feature("autodoc", "Defines the name under which the document should be stored.

Parameters
----------
aName: Standard_ExtString

Returns
-------
CDF_StoreSetNameStatus
") SetName;
		CDF_StoreSetNameStatus SetName(const Standard_ExtString aName);

		/****************** SetName ******************/
		%feature("compactdefaultargs") SetName;
		%feature("autodoc", "Defines the name under which the document should be stored.

Parameters
----------
aName: TCollection_ExtendedString

Returns
-------
CDF_StoreSetNameStatus
") SetName;
		CDF_StoreSetNameStatus SetName(const TCollection_ExtendedString & aName);

		/****************** SetPreviousVersion ******************/
		%feature("compactdefaultargs") SetPreviousVersion;
		%feature("autodoc", "No available documentation.

Parameters
----------
aPreviousVersion: Standard_ExtString

Returns
-------
bool
") SetPreviousVersion;
		Standard_Boolean SetPreviousVersion(const Standard_ExtString aPreviousVersion);

		/****************** StoreStatus ******************/
		%feature("compactdefaultargs") StoreStatus;
		%feature("autodoc", "No available documentation.

Returns
-------
PCDM_StoreStatus
") StoreStatus;
		PCDM_StoreStatus StoreStatus();

		/****************** SubComponentStatus ******************/
		%feature("compactdefaultargs") SubComponentStatus;
		%feature("autodoc", "No available documentation.

Parameters
----------
aPresentation: Standard_ExtString

Returns
-------
CDF_SubComponentStatus
") SubComponentStatus;
		CDF_SubComponentStatus SubComponentStatus(const Standard_ExtString aPresentation);

};


%extend CDF_Store {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************
* class CDF_StoreList *
**********************/
class CDF_StoreList : public Standard_Transient {
	public:
		/****************** CDF_StoreList ******************/
		%feature("compactdefaultargs") CDF_StoreList;
		%feature("autodoc", "No available documentation.

Parameters
----------
aDocument: CDM_Document

Returns
-------
None
") CDF_StoreList;
		 CDF_StoreList(const opencascade::handle<CDM_Document> & aDocument);

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Init;
		void Init();

		/****************** IsConsistent ******************/
		%feature("compactdefaultargs") IsConsistent;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsConsistent;
		Standard_Boolean IsConsistent();

		/****************** More ******************/
		%feature("compactdefaultargs") More;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") More;
		Standard_Boolean More();

		/****************** Next ******************/
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Next;
		void Next();

		/****************** Store ******************/
		%feature("compactdefaultargs") Store;
		%feature("autodoc", "Stores each object of the storelist in the reverse order of which they had been added.

Parameters
----------
aMetaData: CDM_MetaData
aStatusAssociatedText: TCollection_ExtendedString

Returns
-------
PCDM_StoreStatus
") Store;
		PCDM_StoreStatus Store(opencascade::handle<CDM_MetaData> & aMetaData, TCollection_ExtendedString & aStatusAssociatedText);

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<CDM_Document>
") Value;
		opencascade::handle<CDM_Document> Value();

};


%make_alias(CDF_StoreList)

%extend CDF_StoreList {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************
* class CDF_FWOSDriver *
***********************/
class CDF_FWOSDriver : public CDF_MetaDataDriver {
	public:
		/****************** CDF_FWOSDriver ******************/
		%feature("compactdefaultargs") CDF_FWOSDriver;
		%feature("autodoc", "Initializes the metadatadriver with its specific name.

Returns
-------
None
") CDF_FWOSDriver;
		 CDF_FWOSDriver();

		/****************** BuildFileName ******************/
		%feature("compactdefaultargs") BuildFileName;
		%feature("autodoc", "No available documentation.

Parameters
----------
aDocument: CDM_Document

Returns
-------
TCollection_ExtendedString
") BuildFileName;
		TCollection_ExtendedString BuildFileName(const opencascade::handle<CDM_Document> & aDocument);

		/****************** DefaultFolder ******************/
		%feature("compactdefaultargs") DefaultFolder;
		%feature("autodoc", "No available documentation.

Returns
-------
TCollection_ExtendedString
") DefaultFolder;
		TCollection_ExtendedString DefaultFolder();

		/****************** Find ******************/
		%feature("compactdefaultargs") Find;
		%feature("autodoc", "Indicate whether a file exists corresponding to the folder and the name.

Parameters
----------
aFolder: TCollection_ExtendedString
aName: TCollection_ExtendedString
aVersion: TCollection_ExtendedString

Returns
-------
bool
") Find;
		Standard_Boolean Find(const TCollection_ExtendedString & aFolder, const TCollection_ExtendedString & aName, const TCollection_ExtendedString & aVersion);

		/****************** FindFolder ******************/
		%feature("compactdefaultargs") FindFolder;
		%feature("autodoc", "No available documentation.

Parameters
----------
aFolder: TCollection_ExtendedString

Returns
-------
bool
") FindFolder;
		Standard_Boolean FindFolder(const TCollection_ExtendedString & aFolder);

		/****************** HasReadPermission ******************/
		%feature("compactdefaultargs") HasReadPermission;
		%feature("autodoc", "No available documentation.

Parameters
----------
aFolder: TCollection_ExtendedString
aName: TCollection_ExtendedString
aVersion: TCollection_ExtendedString

Returns
-------
bool
") HasReadPermission;
		Standard_Boolean HasReadPermission(const TCollection_ExtendedString & aFolder, const TCollection_ExtendedString & aName, const TCollection_ExtendedString & aVersion);

		/****************** SetName ******************/
		%feature("compactdefaultargs") SetName;
		%feature("autodoc", "No available documentation.

Parameters
----------
aDocument: CDM_Document
aName: TCollection_ExtendedString

Returns
-------
TCollection_ExtendedString
") SetName;
		virtual TCollection_ExtendedString SetName(const opencascade::handle<CDM_Document> & aDocument, const TCollection_ExtendedString & aName);

};


%make_alias(CDF_FWOSDriver)

%extend CDF_FWOSDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/* harray1 classes */
/* harray2 classes */
/* hsequence classes */
