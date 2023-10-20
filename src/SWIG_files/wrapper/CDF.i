/*
Copyright 2008-2023 Thomas Paviot (tpaviot@gmail.com)

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
https://www.opencascade.com/doc/occt-7.7.0/refman/html/package_cdf.html"
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
%include ../common/EnumTemplates.i
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
#include<Message_module.hxx>
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
%import Message.i

%pythoncode {
from enum import IntEnum
from OCC.Core.Exception import *
};

/* public enums */
enum CDF_StoreSetNameStatus {
	CDF_SSNS_OK = 0,
	CDF_SSNS_ReplacingAnExistentDocument = 1,
	CDF_SSNS_OpenDocument = 2,
};

enum CDF_SubComponentStatus {
	CDF_SCS_Consistent = 0,
	CDF_SCS_Unconsistent = 1,
	CDF_SCS_Stored = 2,
	CDF_SCS_Modified = 3,
};

enum CDF_TryStoreStatus {
	CDF_TS_OK = 0,
	CDF_TS_NoCurrentDocument = 1,
	CDF_TS_NoDriver = 2,
	CDF_TS_NoSubComponentDriver = 3,
};

enum CDF_TypeOfActivation {
	CDF_TOA_New = 0,
	CDF_TOA_Modified = 1,
	CDF_TOA_Unchanged = 2,
};

/* end public enums declaration */

/* python proxy classes for enums */
%pythoncode {

class CDF_StoreSetNameStatus(IntEnum):
	CDF_SSNS_OK = 0
	CDF_SSNS_ReplacingAnExistentDocument = 1
	CDF_SSNS_OpenDocument = 2
CDF_SSNS_OK = CDF_StoreSetNameStatus.CDF_SSNS_OK
CDF_SSNS_ReplacingAnExistentDocument = CDF_StoreSetNameStatus.CDF_SSNS_ReplacingAnExistentDocument
CDF_SSNS_OpenDocument = CDF_StoreSetNameStatus.CDF_SSNS_OpenDocument

class CDF_SubComponentStatus(IntEnum):
	CDF_SCS_Consistent = 0
	CDF_SCS_Unconsistent = 1
	CDF_SCS_Stored = 2
	CDF_SCS_Modified = 3
CDF_SCS_Consistent = CDF_SubComponentStatus.CDF_SCS_Consistent
CDF_SCS_Unconsistent = CDF_SubComponentStatus.CDF_SCS_Unconsistent
CDF_SCS_Stored = CDF_SubComponentStatus.CDF_SCS_Stored
CDF_SCS_Modified = CDF_SubComponentStatus.CDF_SCS_Modified

class CDF_TryStoreStatus(IntEnum):
	CDF_TS_OK = 0
	CDF_TS_NoCurrentDocument = 1
	CDF_TS_NoDriver = 2
	CDF_TS_NoSubComponentDriver = 3
CDF_TS_OK = CDF_TryStoreStatus.CDF_TS_OK
CDF_TS_NoCurrentDocument = CDF_TryStoreStatus.CDF_TS_NoCurrentDocument
CDF_TS_NoDriver = CDF_TryStoreStatus.CDF_TS_NoDriver
CDF_TS_NoSubComponentDriver = CDF_TryStoreStatus.CDF_TS_NoSubComponentDriver

class CDF_TypeOfActivation(IntEnum):
	CDF_TOA_New = 0
	CDF_TOA_Modified = 1
	CDF_TOA_Unchanged = 2
CDF_TOA_New = CDF_TypeOfActivation.CDF_TOA_New
CDF_TOA_Modified = CDF_TypeOfActivation.CDF_TOA_Modified
CDF_TOA_Unchanged = CDF_TypeOfActivation.CDF_TOA_Unchanged
};
/* end python proxy for enums */

/* handles */
%wrap_handle(CDF_Application)
%wrap_handle(CDF_Directory)
%wrap_handle(CDF_MetaDataDriver)
%wrap_handle(CDF_MetaDataDriverFactory)
%wrap_handle(CDF_StoreList)
%wrap_handle(CDF_FWOSDriver)
/* end handles declaration */

/* templates */
/* end templates declaration */

/* typedefs */
/* end typedefs declaration */

/************************
* class CDF_Application *
************************/
%nodefaultctor CDF_Application;
class CDF_Application : public CDM_Application {
	public:
		opencascade::handle<CDF_MetaDataDriver > myMetaDataDriver;
		opencascade::handle<CDF_Directory > myDirectory;
		/****************** CanClose ******************/
		/**** md5 signature: c6d5b2cf0ce51a973521c5b4c25f2ec1 ****/
		%feature("compactdefaultargs") CanClose;
		%feature("autodoc", "
Parameters
----------
aDocument: CDM_Document

Return
-------
CDM_CanCloseStatus

Description
-----------
No available documentation.
") CanClose;
		CDM_CanCloseStatus CanClose(const opencascade::handle<CDM_Document> & aDocument);

		/****************** CanRetrieve ******************/
		/**** md5 signature: 0d61ed06c73aeded6f513d70d206870f ****/
		%feature("compactdefaultargs") CanRetrieve;
		%feature("autodoc", "
Parameters
----------
theFolder: str
theName: str
theAppendMode: bool

Return
-------
PCDM_ReaderStatus

Description
-----------
No available documentation.
") CanRetrieve;
		PCDM_ReaderStatus CanRetrieve(TCollection_ExtendedString theFolder, TCollection_ExtendedString theName, const bool theAppendMode);

		/****************** CanRetrieve ******************/
		/**** md5 signature: 64f35736d7773166005363b757a7c8ee ****/
		%feature("compactdefaultargs") CanRetrieve;
		%feature("autodoc", "
Parameters
----------
theFolder: str
theName: str
theVersion: str
theAppendMode: bool

Return
-------
PCDM_ReaderStatus

Description
-----------
No available documentation.
") CanRetrieve;
		PCDM_ReaderStatus CanRetrieve(TCollection_ExtendedString theFolder, TCollection_ExtendedString theName, TCollection_ExtendedString theVersion, const bool theAppendMode);

		/****************** Close ******************/
		/**** md5 signature: 18e2edbb6413a2dad4b76efdcffb5374 ****/
		%feature("compactdefaultargs") Close;
		%feature("autodoc", "
Parameters
----------
aDocument: CDM_Document

Return
-------
None

Description
-----------
Removes the document of the current session directory and closes the document;.
") Close;
		void Close(const opencascade::handle<CDM_Document> & aDocument);

		/****************** DefaultFolder ******************/
		/**** md5 signature: dc87db815026b0834c349d2449d986f6 ****/
		%feature("compactdefaultargs") DefaultFolder;
		%feature("autodoc", "Return
-------
Standard_ExtString

Description
-----------
No available documentation.
") DefaultFolder;
		Standard_ExtString DefaultFolder();

		/****************** Format ******************/
		/**** md5 signature: cd21d8c27cab310899ac9e2c6ebf7f85 ****/
		%feature("compactdefaultargs") Format;
		%feature("autodoc", "
Parameters
----------
aFileName: str
theFormat: str

Return
-------
bool

Description
-----------
Try to retrieve a format directly in the file or in application resource by using extension. returns true if found;.
") Format;
		Standard_Boolean Format(TCollection_ExtendedString aFileName, TCollection_ExtendedString & theFormat);

		/****************** GetRetrieveStatus ******************/
		/**** md5 signature: 5a9523dbf252a1564feb97c9e6a00909 ****/
		%feature("compactdefaultargs") GetRetrieveStatus;
		%feature("autodoc", "Return
-------
PCDM_ReaderStatus

Description
-----------
Checks status after retrieve.
") GetRetrieveStatus;
		PCDM_ReaderStatus GetRetrieveStatus();

		/****************** InitDocument ******************/
		/**** md5 signature: 71633d306d5c5cc6ec7824c1818ae992 ****/
		%feature("compactdefaultargs") InitDocument;
		%feature("autodoc", "
Parameters
----------
theDoc: CDM_Document

Return
-------
None

Description
-----------
Initialize a document for the applicative session. this virtual function is called by newdocument and should be redefined for each specific application.
") InitDocument;
		virtual void InitDocument(const opencascade::handle<CDM_Document> & theDoc);

		/****************** Load ******************/
		/**** md5 signature: 6f28094ffe0ccd3492096f784ee50c07 ****/
		%feature("compactdefaultargs") Load;
		%feature("autodoc", "
Parameters
----------
aGUID: Standard_GUID

Return
-------
opencascade::handle<CDF_Application>

Description
-----------
Plugs an application. //! open is used - for opening a document that has been created in an application - for opening a document from the database - for opening a document from a file. the open methods always add the document in the session directory and calls the virtual activate method. the document is considered to be opened until close is used. to be storable, a document must be opened by an application since the application resources are needed to store it.
") Load;
		static opencascade::handle<CDF_Application> Load(const Standard_GUID & aGUID);

		/****************** MetaDataDriver ******************/
		/**** md5 signature: 65b9cb7e9445542f433cc5ea23630479 ****/
		%feature("compactdefaultargs") MetaDataDriver;
		%feature("autodoc", "Return
-------
opencascade::handle<CDF_MetaDataDriver>

Description
-----------
Returns metadatddriver of this application.
") MetaDataDriver;
		opencascade::handle<CDF_MetaDataDriver> MetaDataDriver();

		/****************** NewDocument ******************/
		/**** md5 signature: 8948e39f4c19a050838644ef4dd96de3 ****/
		%feature("compactdefaultargs") NewDocument;
		%feature("autodoc", "
Parameters
----------
theFormat: str
theDoc: CDM_Document

Return
-------
None

Description
-----------
Constructs an new empty document. this document will have the specified format. if initdocument() is redefined for a specific application, the new document is handled by the applicative session.
") NewDocument;
		virtual void NewDocument(TCollection_ExtendedString theFormat, opencascade::handle<CDM_Document> & theDoc);

		/****************** Open ******************/
		/**** md5 signature: 5e6498f06bf961c0c0c61cc007aa0a28 ****/
		%feature("compactdefaultargs") Open;
		%feature("autodoc", "
Parameters
----------
aDocument: CDM_Document

Return
-------
None

Description
-----------
Puts the document in the current session directory and calls the virtual method activate on it.
") Open;
		void Open(const opencascade::handle<CDM_Document> & aDocument);

		/****************** ReaderFromFormat ******************/
		/**** md5 signature: aab6344d555db3220a1fcf7db3c7d59e ****/
		%feature("compactdefaultargs") ReaderFromFormat;
		%feature("autodoc", "
Parameters
----------
aFormat: str

Return
-------
opencascade::handle<PCDM_Reader>

Description
-----------
Returns instance of read driver for specified format. //! default implementation uses plugin mechanism to load reader dynamically. for this to work, application resources should define guid of the plugin as value of [format].retrievalplugin, and 'plugin' resource should define name of plugin library to be loaded as value of [guid].location. plugin library should provide method pluginfactory returning instance of the reader for the same guid (see plugin_macro.hxx). //! in case if reader is not available, will raise standard_nosuchobject or other exception if raised by plugin loader.
") ReaderFromFormat;
		virtual opencascade::handle<PCDM_Reader> ReaderFromFormat(TCollection_ExtendedString aFormat);

		/****************** Retrieve ******************/
		/**** md5 signature: 529a7c29af3c51fd8c94c064e0b3dbcb ****/
		%feature("compactdefaultargs") Retrieve;
		%feature("autodoc", "
Parameters
----------
aFolder: str
aName: str
UseStorageConfiguration: bool (optional, default to Standard_True)
theFilter: PCDM_ReaderFilter (optional, default to opencascade::handle<PCDM_ReaderFilter>())
theRange: Message_ProgressRange (optional, default to Message_ProgressRange())

Return
-------
opencascade::handle<CDM_Document>

Description
-----------
This method retrieves a document from the database. if the document references other documents which have been updated, the latest version of these documents will be used if {usestorageconfiguration} is standard_true. the content of {afolder}, {aname} and {aversion} depends on the database manager system. if the dbms is only based on the os, {afolder} is a directory and {aname} is the name of a file. in this case the use of the syntax with {aversion} has no sense. for example: //! opencascade::handle<cdm_document> thedocument=myapplication->retrieve('/home/cascade','box.dsg'); if the dbms is euclid/design manager, {afolder}, {aname} have the form they have in euclid/design manager. for example: //! opencascade::handle<cdm_document> thedocument=myapplication->retrieve('|user|cascade','box'); //! since the version is not specified in this syntax, the latest will be used. a link is kept with the database through an instance of cdm_metadata.
") Retrieve;
		opencascade::handle<CDM_Document> Retrieve(TCollection_ExtendedString aFolder, TCollection_ExtendedString aName, const Standard_Boolean UseStorageConfiguration = Standard_True, const opencascade::handle<PCDM_ReaderFilter> & theFilter = opencascade::handle<PCDM_ReaderFilter>(), const Message_ProgressRange & theRange = Message_ProgressRange());

		/****************** Retrieve ******************/
		/**** md5 signature: dd78ce93c0b60ff0965f3c7e69833777 ****/
		%feature("compactdefaultargs") Retrieve;
		%feature("autodoc", "
Parameters
----------
aFolder: str
aName: str
aVersion: str
UseStorageConfiguration: bool (optional, default to Standard_True)
theFilter: PCDM_ReaderFilter (optional, default to opencascade::handle<PCDM_ReaderFilter>())
theRange: Message_ProgressRange (optional, default to Message_ProgressRange())

Return
-------
opencascade::handle<CDM_Document>

Description
-----------
This method retrieves a document from the database. if the document references other documents which have been updated, the latest version of these documents will be used if {usestorageconfiguration} is standard_true. -- if the dbms is only based on the os, this syntax should not be used. //! if the dbms is euclid/design manager, {afolder}, {aname} and {aversion} have the form they have in euclid/design manager. for example: //! opencascade::handle<cdm_document> thedocument=myapplication->retrieve('|user|cascade','box','2'); a link is kept with the database through an instance of cdm_metadata.
") Retrieve;
		opencascade::handle<CDM_Document> Retrieve(TCollection_ExtendedString aFolder, TCollection_ExtendedString aName, TCollection_ExtendedString aVersion, const Standard_Boolean UseStorageConfiguration = Standard_True, const opencascade::handle<PCDM_ReaderFilter> & theFilter = opencascade::handle<PCDM_ReaderFilter>(), const Message_ProgressRange & theRange = Message_ProgressRange());

		/****************** SetDefaultFolder ******************/
		/**** md5 signature: b5857edec14e8dcab31bb5ac39a5223a ****/
		%feature("compactdefaultargs") SetDefaultFolder;
		%feature("autodoc", "
Parameters
----------
aFolder: Standard_ExtString

Return
-------
bool

Description
-----------
No available documentation.
") SetDefaultFolder;
		Standard_Boolean SetDefaultFolder(const Standard_ExtString aFolder);

		/****************** WriterFromFormat ******************/
		/**** md5 signature: 2039925e39207c83df1666eea6efb175 ****/
		%feature("compactdefaultargs") WriterFromFormat;
		%feature("autodoc", "
Parameters
----------
aFormat: str

Return
-------
opencascade::handle<PCDM_StorageDriver>

Description
-----------
Returns instance of storage driver for specified format. //! default implementation uses plugin mechanism to load driver dynamically. for this to work, application resources should define guid of the plugin as value of [format].storageplugin, and 'plugin' resource should define name of plugin library to be loaded as value of [guid].location. plugin library should provide method pluginfactory returning instance of the reader for the same guid (see plugin_macro.hxx). //! in case if driver is not available, will raise standard_nosuchobject or other exception if raised by plugin loader.
") WriterFromFormat;
		virtual opencascade::handle<PCDM_StorageDriver> WriterFromFormat(TCollection_ExtendedString aFormat);

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
		/**** md5 signature: 46be2128bdcbbd3ab4afafabd80860e0 ****/
		%feature("compactdefaultargs") CDF_Directory;
		%feature("autodoc", "Return
-------
None

Description
-----------
Creates an empty directory.
") CDF_Directory;
		 CDF_Directory();

		/****************** Add ******************/
		/**** md5 signature: b6b784134819ac5d900cf7ccf0994349 ****/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "
Parameters
----------
aDocument: CDM_Document

Return
-------
None

Description
-----------
Adds a document into the directory.
") Add;
		void Add(const opencascade::handle<CDM_Document> & aDocument);

		/****************** Contains ******************/
		/**** md5 signature: e701764a85b62396106114052f5091ce ****/
		%feature("compactdefaultargs") Contains;
		%feature("autodoc", "
Parameters
----------
aDocument: CDM_Document

Return
-------
bool

Description
-----------
Returns true if the document adocument is in the directory.
") Contains;
		Standard_Boolean Contains(const opencascade::handle<CDM_Document> & aDocument);

		/****************** IsEmpty ******************/
		/**** md5 signature: 6ab5e1ad63f93168856ab126dd374b81 ****/
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if the directory is empty.
") IsEmpty;
		Standard_Boolean IsEmpty();

		/****************** Last ******************/
		/**** md5 signature: 315f5b609ccef6e8a0c865d973889a7c ****/
		%feature("compactdefaultargs") Last;
		%feature("autodoc", "Return
-------
opencascade::handle<CDM_Document>

Description
-----------
Returns the last document (if any) which has been added in the directory.
") Last;
		opencascade::handle<CDM_Document> Last();

		/****************** Length ******************/
		/**** md5 signature: 58bd40380acccb2733bfbd37bf3cbb11 ****/
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of documents of the directory.
") Length;
		Standard_Integer Length();

		/****************** Remove ******************/
		/**** md5 signature: 9a20bceb09f550258abc1a5ffcd3575d ****/
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "
Parameters
----------
aDocument: CDM_Document

Return
-------
None

Description
-----------
Removes the document.
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
/***************************
* class CDF_MetaDataDriver *
***************************/
%nodefaultctor CDF_MetaDataDriver;
class CDF_MetaDataDriver : public Standard_Transient {
	public:
		/****************** BuildFileName ******************/
		/**** md5 signature: 805bb09da5d1d397a25adbb9a5d24005 ****/
		%feature("compactdefaultargs") BuildFileName;
		%feature("autodoc", "
Parameters
----------
aDocument: CDM_Document

Return
-------
TCollection_ExtendedString

Description
-----------
No available documentation.
") BuildFileName;
		virtual TCollection_ExtendedString BuildFileName(const opencascade::handle<CDM_Document> & aDocument);

		/****************** CreateDependsOn ******************/
		/**** md5 signature: b8890e513eb264013f073c1a6b02e2e2 ****/
		%feature("compactdefaultargs") CreateDependsOn;
		%feature("autodoc", "
Parameters
----------
aFirstData: CDM_MetaData
aSecondData: CDM_MetaData

Return
-------
None

Description
-----------
Creates a 'depends on' relation between two datas. by default does nothing.
") CreateDependsOn;
		virtual void CreateDependsOn(const opencascade::handle<CDM_MetaData> & aFirstData, const opencascade::handle<CDM_MetaData> & aSecondData);

		/****************** CreateMetaData ******************/
		/**** md5 signature: 38159ffc0f1a18d77efc3d7a8362b043 ****/
		%feature("compactdefaultargs") CreateMetaData;
		%feature("autodoc", "
Parameters
----------
aDocument: CDM_Document
aFileName: str

Return
-------
opencascade::handle<CDM_MetaData>

Description
-----------
Should create meta-data corresponding to adata and maintaining a meta-link between these meta-data and afilename createmetadata is called by createdata if the metadata-driver has version capabilities, version must be set in the returned data.
") CreateMetaData;
		virtual opencascade::handle<CDM_MetaData> CreateMetaData(const opencascade::handle<CDM_Document> & aDocument, TCollection_ExtendedString aFileName);

		/****************** CreateReference ******************/
		/**** md5 signature: ee0ba7d2788f0a828e0d919b0d1b98e9 ****/
		%feature("compactdefaultargs") CreateReference;
		%feature("autodoc", "
Parameters
----------
aFrom: CDM_MetaData
aTo: CDM_MetaData
aReferenceIdentifier: int
aToDocumentVersion: int

Return
-------
None

Description
-----------
No available documentation.
") CreateReference;
		virtual void CreateReference(const opencascade::handle<CDM_MetaData> & aFrom, const opencascade::handle<CDM_MetaData> & aTo, const Standard_Integer aReferenceIdentifier, const Standard_Integer aToDocumentVersion);

		/****************** DefaultFolder ******************/
		/**** md5 signature: 8f25b151d43bdae5827f4c1016790f5d ****/
		%feature("compactdefaultargs") DefaultFolder;
		%feature("autodoc", "Return
-------
TCollection_ExtendedString

Description
-----------
No available documentation.
") DefaultFolder;
		virtual TCollection_ExtendedString DefaultFolder();

		/****************** Find ******************/
		/**** md5 signature: ac1d26274189761830708e2d8787984d ****/
		%feature("compactdefaultargs") Find;
		%feature("autodoc", "
Parameters
----------
aFolder: str
aName: str
aVersion: str

Return
-------
bool

Description
-----------
Should indicate whether meta-data exist in the dbms corresponding to the data. aversion may be null;.
") Find;
		virtual Standard_Boolean Find(TCollection_ExtendedString aFolder, TCollection_ExtendedString aName, TCollection_ExtendedString aVersion);

		/****************** Find ******************/
		/**** md5 signature: 3790cd3f2b3362c62018b1d3652970dd ****/
		%feature("compactdefaultargs") Find;
		%feature("autodoc", "
Parameters
----------
aFolder: str
aName: str

Return
-------
bool

Description
-----------
Calls find with an empty version.
") Find;
		Standard_Boolean Find(TCollection_ExtendedString aFolder, TCollection_ExtendedString aName);

		/****************** FindFolder ******************/
		/**** md5 signature: 9a5e2cbe4eefa1eae2149c38651a75a9 ****/
		%feature("compactdefaultargs") FindFolder;
		%feature("autodoc", "
Parameters
----------
aFolder: str

Return
-------
bool

Description
-----------
No available documentation.
") FindFolder;
		virtual Standard_Boolean FindFolder(TCollection_ExtendedString aFolder);

		/****************** HasReadPermission ******************/
		/**** md5 signature: 18f97899c0a5d2e41387449551ecf940 ****/
		%feature("compactdefaultargs") HasReadPermission;
		%feature("autodoc", "
Parameters
----------
aFolder: str
aName: str
aVersion: str

Return
-------
bool

Description
-----------
No available documentation.
") HasReadPermission;
		virtual Standard_Boolean HasReadPermission(TCollection_ExtendedString aFolder, TCollection_ExtendedString aName, TCollection_ExtendedString aVersion);

		/****************** HasVersion ******************/
		/**** md5 signature: 3e209adcc54fe62e2e5697f2ed0d2d8c ****/
		%feature("compactdefaultargs") HasVersion;
		%feature("autodoc", "
Parameters
----------
aFolder: str
aName: str

Return
-------
bool

Description
-----------
By default return standard_true.
") HasVersion;
		virtual Standard_Boolean HasVersion(TCollection_ExtendedString aFolder, TCollection_ExtendedString aName);

		/****************** HasVersionCapability ******************/
		/**** md5 signature: 0e4f0bbd26688c9b437cf5bee430c353 ****/
		%feature("compactdefaultargs") HasVersionCapability;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if the metadatadriver can manage different versions of a data. by default, returns standard_false.
") HasVersionCapability;
		virtual Standard_Boolean HasVersionCapability();

		/****************** LastVersion ******************/
		/**** md5 signature: 9d9316bfcc062ca6089c234c0ce83791 ****/
		%feature("compactdefaultargs") LastVersion;
		%feature("autodoc", "
Parameters
----------
aMetaData: CDM_MetaData

Return
-------
opencascade::handle<CDM_MetaData>

Description
-----------
By default returns ametadata should return the metadata stored in the dbms with the meta-data corresponding to the path. if the metadatadriver has version management capabilities the version has to be set in the returned metadata. metadata is called by getmetadata if the version is not included in the path , metadata should return the last version of the metadata is deferred;.
") LastVersion;
		virtual opencascade::handle<CDM_MetaData> LastVersion(const opencascade::handle<CDM_MetaData> & aMetaData);

		/****************** MetaData ******************/
		/**** md5 signature: 4662f97988f934c8a08742039341d0de ****/
		%feature("compactdefaultargs") MetaData;
		%feature("autodoc", "
Parameters
----------
aFolder: str
aName: str
aVersion: str

Return
-------
opencascade::handle<CDM_MetaData>

Description
-----------
Should return the metadata stored in the dbms with the meta-data corresponding to the data. if the metadatadriver has version management capabilities the version has to be set in the returned metadata. aversion may be null metadata is called by getmetadata if the version is set to null, metadata should return the last version of the metadata.
") MetaData;
		virtual opencascade::handle<CDM_MetaData> MetaData(TCollection_ExtendedString aFolder, TCollection_ExtendedString aName, TCollection_ExtendedString aVersion);

		/****************** MetaData ******************/
		/**** md5 signature: d6c67f068a67123fd1d2e0024518d5e4 ****/
		%feature("compactdefaultargs") MetaData;
		%feature("autodoc", "
Parameters
----------
aFolder: str
aName: str

Return
-------
opencascade::handle<CDM_MetaData>

Description
-----------
Calls metadata with an empty version.
") MetaData;
		opencascade::handle<CDM_MetaData> MetaData(TCollection_ExtendedString aFolder, TCollection_ExtendedString aName);

		/****************** ReferenceIterator ******************/
		/**** md5 signature: 6d4c044d33dd6f42be200285a2b215e5 ****/
		%feature("compactdefaultargs") ReferenceIterator;
		%feature("autodoc", "
Parameters
----------
theMessageDriver: Message_Messenger

Return
-------
opencascade::handle<PCDM_ReferenceIterator>

Description
-----------
No available documentation.
") ReferenceIterator;
		virtual opencascade::handle<PCDM_ReferenceIterator> ReferenceIterator(const opencascade::handle<Message_Messenger> & theMessageDriver);

		/****************** SetName ******************/
		/**** md5 signature: 10c6e80103256298f85d47fc462c3021 ****/
		%feature("compactdefaultargs") SetName;
		%feature("autodoc", "
Parameters
----------
aDocument: CDM_Document
aName: str

Return
-------
TCollection_ExtendedString

Description
-----------
This method is useful if the name of an object -- depends on the metadatadriver. for example a driver -- based on the operating system can choose to add the extension of file to create to the object.
") SetName;
		virtual TCollection_ExtendedString SetName(const opencascade::handle<CDM_Document> & aDocument, TCollection_ExtendedString aName);

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
		/**** md5 signature: 00964348e662a6a0ab28dcfcc6c0ef54 ****/
		%feature("compactdefaultargs") Build;
		%feature("autodoc", "Return
-------
opencascade::handle<CDF_MetaDataDriver>

Description
-----------
No available documentation.
") Build;
		virtual opencascade::handle<CDF_MetaDataDriver> Build();

};


%make_alias(CDF_MetaDataDriverFactory)

%extend CDF_MetaDataDriverFactory {
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
		/**** md5 signature: 74a9583ede7295ce2ee9cd44d9a6eb94 ****/
		%feature("compactdefaultargs") CDF_Store;
		%feature("autodoc", "
Parameters
----------
aDocument: CDM_Document

Return
-------
None

Description
-----------
Creates a store list from the document of the current selection.
") CDF_Store;
		 CDF_Store(const opencascade::handle<CDM_Document> & aDocument);

		/****************** AssociatedStatusText ******************/
		/**** md5 signature: 9c2a2cc4635869ea6cbe44120e51d8f9 ****/
		%feature("compactdefaultargs") AssociatedStatusText;
		%feature("autodoc", "Return
-------
Standard_ExtString

Description
-----------
No available documentation.
") AssociatedStatusText;
		Standard_ExtString AssociatedStatusText();

		/****************** Comment ******************/
		/**** md5 signature: 5dfb2f1d86286c98eb50db6b2ec9776a ****/
		%feature("compactdefaultargs") Comment;
		%feature("autodoc", "Return
-------
opencascade::handle<TCollection_HExtendedString>

Description
-----------
No available documentation.
") Comment;
		opencascade::handle<TCollection_HExtendedString> Comment();

		/****************** CurrentIsConsistent ******************/
		/**** md5 signature: ed98cb46a82669a61995271d69dd9107 ****/
		%feature("compactdefaultargs") CurrentIsConsistent;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") CurrentIsConsistent;
		Standard_Boolean CurrentIsConsistent();

		/****************** Description ******************/
		/**** md5 signature: 0f5a6da911401296c8b30f075d3be212 ****/
		%feature("compactdefaultargs") Description;
		%feature("autodoc", "Return
-------
opencascade::handle<TCollection_HExtendedString>

Description
-----------
Returns the description of the format of the main object.
") Description;
		opencascade::handle<TCollection_HExtendedString> Description();

		/****************** Folder ******************/
		/**** md5 signature: 73105a79a5d36e1f7de58c6236ff69b5 ****/
		%feature("compactdefaultargs") Folder;
		%feature("autodoc", "Return
-------
opencascade::handle<TCollection_HExtendedString>

Description
-----------
Returns the folder in which the current document will be stored.
") Folder;
		opencascade::handle<TCollection_HExtendedString> Folder();

		/****************** HasAPreviousVersion ******************/
		/**** md5 signature: 2de8556e4a503e119b5d11cf435187d6 ****/
		%feature("compactdefaultargs") HasAPreviousVersion;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") HasAPreviousVersion;
		Standard_Boolean HasAPreviousVersion();

		/****************** IsConsistent ******************/
		/**** md5 signature: b90ed696be4c8f35165851c36e3a9592 ****/
		%feature("compactdefaultargs") IsConsistent;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsConsistent;
		Standard_Boolean IsConsistent();

		/****************** IsMainDocument ******************/
		/**** md5 signature: 97a981e2305064fbd665d8c94b60dd38 ****/
		%feature("compactdefaultargs") IsMainDocument;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if the currentdocument is the main one, ie the document of the current selection.
") IsMainDocument;
		Standard_Boolean IsMainDocument();

		/****************** IsModified ******************/
		/**** md5 signature: 9c75f71ece8c473c12f072739ddc9f63 ****/
		%feature("compactdefaultargs") IsModified;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsModified;
		Standard_Boolean IsModified();

		/****************** IsStored ******************/
		/**** md5 signature: 0accc82ecbcf65967dcdbcbc0b39163c ****/
		%feature("compactdefaultargs") IsStored;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if the current document is already stored.
") IsStored;
		Standard_Boolean IsStored();

		/****************** MetaDataPath ******************/
		/**** md5 signature: 835d7c7f39245f9133772b983dcc3304 ****/
		%feature("compactdefaultargs") MetaDataPath;
		%feature("autodoc", "Return
-------
opencascade::handle<TCollection_HExtendedString>

Description
-----------
Returns the path of the previous store is the object is already stored, otherwise an empty string;.
") MetaDataPath;
		opencascade::handle<TCollection_HExtendedString> MetaDataPath();

		/****************** Name ******************/
		/**** md5 signature: 03ea3f3ee5fa94844fd4d36cdbd9cbbd ****/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "Return
-------
opencascade::handle<TCollection_HExtendedString>

Description
-----------
Returns the name under which the current document will be stored.
") Name;
		opencascade::handle<TCollection_HExtendedString> Name();

		/****************** Path ******************/
		/**** md5 signature: 5b9cb02835fedd9ac6afe6651eb8b11d ****/
		%feature("compactdefaultargs") Path;
		%feature("autodoc", "Return
-------
Standard_ExtString

Description
-----------
Returns the complete path of the created meta-data.
") Path;
		Standard_ExtString Path();

		/****************** PreviousVersion ******************/
		/**** md5 signature: ad90ed1fb5b96a052d0f5ad3d9c8b43d ****/
		%feature("compactdefaultargs") PreviousVersion;
		%feature("autodoc", "Return
-------
opencascade::handle<TCollection_HExtendedString>

Description
-----------
No available documentation.
") PreviousVersion;
		opencascade::handle<TCollection_HExtendedString> PreviousVersion();

		/****************** Realize ******************/
		/**** md5 signature: d59c3600fa85f189069750fcb7bd399b ****/
		%feature("compactdefaultargs") Realize;
		%feature("autodoc", "
Parameters
----------
theRange: Message_ProgressRange (optional, default to Message_ProgressRange())

Return
-------
None

Description
-----------
No available documentation.
") Realize;
		void Realize(const Message_ProgressRange & theRange = Message_ProgressRange());

		/****************** RecheckName ******************/
		/**** md5 signature: 67223e0099da9a98b079d45cadef07e4 ****/
		%feature("compactdefaultargs") RecheckName;
		%feature("autodoc", "Return
-------
CDF_StoreSetNameStatus

Description
-----------
Defines the name under which the document should be stored. uses for example after modification of the folder.
") RecheckName;
		CDF_StoreSetNameStatus RecheckName();

		/****************** SetComment ******************/
		/**** md5 signature: 60d8b5fed8f2853931f87d0698f7f61b ****/
		%feature("compactdefaultargs") SetComment;
		%feature("autodoc", "
Parameters
----------
aComment: Standard_ExtString

Return
-------
None

Description
-----------
No available documentation.
") SetComment;
		void SetComment(const Standard_ExtString aComment);

		/****************** SetCurrent ******************/
		/**** md5 signature: e37db584b7563caf052bddaaef868e65 ****/
		%feature("compactdefaultargs") SetCurrent;
		%feature("autodoc", "
Parameters
----------
aPresentation: Standard_ExtString

Return
-------
None

Description
-----------
No available documentation.
") SetCurrent;
		void SetCurrent(const Standard_ExtString aPresentation);

		/****************** SetFolder ******************/
		/**** md5 signature: b5573393a1ebe307b50d228fbe5e9cc3 ****/
		%feature("compactdefaultargs") SetFolder;
		%feature("autodoc", "
Parameters
----------
aFolder: str

Return
-------
bool

Description
-----------
Defines the folder in which the document should be stored. returns standard_true if the folder exists, standard_false otherwise.
") SetFolder;
		Standard_Boolean SetFolder(TCollection_ExtendedString aFolder);

		/****************** SetFolder ******************/
		/**** md5 signature: 801d484ce7c807a9dba40870f26f3b9c ****/
		%feature("compactdefaultargs") SetFolder;
		%feature("autodoc", "
Parameters
----------
aFolder: Standard_ExtString

Return
-------
bool

Description
-----------
Defines the folder in which the document should be stored. returns standard_true if the folder exists, standard_false otherwise.
") SetFolder;
		Standard_Boolean SetFolder(const Standard_ExtString aFolder);

		/****************** SetMain ******************/
		/**** md5 signature: a7a1239199c6e8d991408789f7045a98 ****/
		%feature("compactdefaultargs") SetMain;
		%feature("autodoc", "Return
-------
None

Description
-----------
The two following methods can be used just after realize or import -- method to know if thes methods worked correctly, and if not why.
") SetMain;
		void SetMain();

		/****************** SetName ******************/
		/**** md5 signature: 5156018271f857517ed09dcbec38d977 ****/
		%feature("compactdefaultargs") SetName;
		%feature("autodoc", "
Parameters
----------
aName: Standard_ExtString

Return
-------
CDF_StoreSetNameStatus

Description
-----------
Defines the name under which the document should be stored.
") SetName;
		CDF_StoreSetNameStatus SetName(const Standard_ExtString aName);

		/****************** SetName ******************/
		/**** md5 signature: 62a6f4de5c52880dd94476733e959ce4 ****/
		%feature("compactdefaultargs") SetName;
		%feature("autodoc", "
Parameters
----------
aName: str

Return
-------
CDF_StoreSetNameStatus

Description
-----------
Defines the name under which the document should be stored.
") SetName;
		CDF_StoreSetNameStatus SetName(TCollection_ExtendedString aName);

		/****************** SetPreviousVersion ******************/
		/**** md5 signature: db8a5d8d68bb5cba7556c0e7f948b226 ****/
		%feature("compactdefaultargs") SetPreviousVersion;
		%feature("autodoc", "
Parameters
----------
aPreviousVersion: Standard_ExtString

Return
-------
bool

Description
-----------
No available documentation.
") SetPreviousVersion;
		Standard_Boolean SetPreviousVersion(const Standard_ExtString aPreviousVersion);

		/****************** StoreStatus ******************/
		/**** md5 signature: 0ea2be88f8e37cedd973fe034f3c1d11 ****/
		%feature("compactdefaultargs") StoreStatus;
		%feature("autodoc", "Return
-------
PCDM_StoreStatus

Description
-----------
No available documentation.
") StoreStatus;
		PCDM_StoreStatus StoreStatus();

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
		/**** md5 signature: 2eca53e06d6546011dd7b0f27c5911a9 ****/
		%feature("compactdefaultargs") CDF_StoreList;
		%feature("autodoc", "
Parameters
----------
aDocument: CDM_Document

Return
-------
None

Description
-----------
No available documentation.
") CDF_StoreList;
		 CDF_StoreList(const opencascade::handle<CDM_Document> & aDocument);

		/****************** Init ******************/
		/**** md5 signature: 0de93ef32c53d091768788dca0e281fd ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init();

		/****************** IsConsistent ******************/
		/**** md5 signature: b90ed696be4c8f35165851c36e3a9592 ****/
		%feature("compactdefaultargs") IsConsistent;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsConsistent;
		Standard_Boolean IsConsistent();

		/****************** More ******************/
		/**** md5 signature: 6f6e915c9a3dca758c059d9e8af02dff ****/
		%feature("compactdefaultargs") More;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") More;
		Standard_Boolean More();

		/****************** Next ******************/
		/**** md5 signature: f35c0df5f1d7c877986db18081404532 ****/
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Next;
		void Next();

		/****************** Store ******************/
		/**** md5 signature: 084ae73e13859cdf324c211495d2ab38 ****/
		%feature("compactdefaultargs") Store;
		%feature("autodoc", "
Parameters
----------
aMetaData: CDM_MetaData
aStatusAssociatedText: str
theRange: Message_ProgressRange (optional, default to Message_ProgressRange())

Return
-------
PCDM_StoreStatus

Description
-----------
Stores each object of the storelist in the reverse order of which they had been added.
") Store;
		PCDM_StoreStatus Store(opencascade::handle<CDM_MetaData> & aMetaData, TCollection_ExtendedString & aStatusAssociatedText, const Message_ProgressRange & theRange = Message_ProgressRange());

		/****************** Value ******************/
		/**** md5 signature: 83b1ae63785c8877d821cb336792d4bc ****/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Return
-------
opencascade::handle<CDM_Document>

Description
-----------
No available documentation.
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
		/**** md5 signature: 5a093179f3514d10faf44a50b08ae4ba ****/
		%feature("compactdefaultargs") CDF_FWOSDriver;
		%feature("autodoc", "
Parameters
----------
theLookUpTable: CDM_MetaDataLookUpTable

Return
-------
None

Description
-----------
Initializes the metadatadriver connected to specified look-up table. note that the created driver will keep reference to the table, thus it must have life time longer than this object.
") CDF_FWOSDriver;
		 CDF_FWOSDriver(CDM_MetaDataLookUpTable & theLookUpTable);

		/****************** BuildFileName ******************/
		/**** md5 signature: 1c38ab2ab19e4b54d478d4f310d7a582 ****/
		%feature("compactdefaultargs") BuildFileName;
		%feature("autodoc", "
Parameters
----------
aDocument: CDM_Document

Return
-------
TCollection_ExtendedString

Description
-----------
No available documentation.
") BuildFileName;
		TCollection_ExtendedString BuildFileName(const opencascade::handle<CDM_Document> & aDocument);

		/****************** DefaultFolder ******************/
		/**** md5 signature: ac13ff4b9ece454471b16d82ee8fc228 ****/
		%feature("compactdefaultargs") DefaultFolder;
		%feature("autodoc", "Return
-------
TCollection_ExtendedString

Description
-----------
No available documentation.
") DefaultFolder;
		TCollection_ExtendedString DefaultFolder();

		/****************** Find ******************/
		/**** md5 signature: af96c0bc77591fb0d1a5ac71b5dc009d ****/
		%feature("compactdefaultargs") Find;
		%feature("autodoc", "
Parameters
----------
aFolder: str
aName: str
aVersion: str

Return
-------
bool

Description
-----------
Indicate whether a file exists corresponding to the folder and the name.
") Find;
		Standard_Boolean Find(TCollection_ExtendedString aFolder, TCollection_ExtendedString aName, TCollection_ExtendedString aVersion);

		/****************** FindFolder ******************/
		/**** md5 signature: 876d6b8f179e719bd5cd5d7750be1f28 ****/
		%feature("compactdefaultargs") FindFolder;
		%feature("autodoc", "
Parameters
----------
aFolder: str

Return
-------
bool

Description
-----------
No available documentation.
") FindFolder;
		Standard_Boolean FindFolder(TCollection_ExtendedString aFolder);

		/****************** HasReadPermission ******************/
		/**** md5 signature: a56965c6bd74688f05fbee219b9c4232 ****/
		%feature("compactdefaultargs") HasReadPermission;
		%feature("autodoc", "
Parameters
----------
aFolder: str
aName: str
aVersion: str

Return
-------
bool

Description
-----------
No available documentation.
") HasReadPermission;
		Standard_Boolean HasReadPermission(TCollection_ExtendedString aFolder, TCollection_ExtendedString aName, TCollection_ExtendedString aVersion);

		/****************** SetName ******************/
		/**** md5 signature: 274c7654cce9308e93e9edd7b5ee5d9d ****/
		%feature("compactdefaultargs") SetName;
		%feature("autodoc", "
Parameters
----------
aDocument: CDM_Document
aName: str

Return
-------
TCollection_ExtendedString

Description
-----------
No available documentation.
") SetName;
		virtual TCollection_ExtendedString SetName(const opencascade::handle<CDM_Document> & aDocument, TCollection_ExtendedString aName);

};


%make_alias(CDF_FWOSDriver)

%extend CDF_FWOSDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/* python proxy for excluded classes */
%pythoncode {
@classnotwrapped
class CDF_DirectoryIterator:
	pass

}
/* end python proxy for excluded classes */
/* harray1 classes */
/* harray2 classes */
/* hsequence classes */
/* class aliases */
%pythoncode {
}
/* deprecated methods */
%pythoncode {
@deprecated
def CDF_Application_Load(*args):
	return CDF_Application.Load(*args)

}
