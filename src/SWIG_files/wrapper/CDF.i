/*
Copyright 2008-2026 Thomas Paviot (tpaviot@gmail.com)

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
https://dev.opencascade.org/doc/occt-7.9.0/refman/html/package_cdf.html"
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
%include ../common/IOStream.i
%include ../common/ArrayMacros.i


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
		/****** CDF_Application::CanClose ******/
		/****** md5 signature: c6d5b2cf0ce51a973521c5b4c25f2ec1 ******/
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

		/****** CDF_Application::CanRetrieve ******/
		/****** md5 signature: 0d61ed06c73aeded6f513d70d206870f ******/
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

		/****** CDF_Application::CanRetrieve ******/
		/****** md5 signature: 64f35736d7773166005363b757a7c8ee ******/
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

		/****** CDF_Application::Close ******/
		/****** md5 signature: 18e2edbb6413a2dad4b76efdcffb5374 ******/
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
removes the document of the current session directory and closes the document;.
") Close;
		void Close(const opencascade::handle<CDM_Document> & aDocument);

		/****** CDF_Application::DefaultFolder ******/
		/****** md5 signature: 79f3e3ec3d0aa5a07828380abcca7dbe ******/
		%feature("compactdefaultargs") DefaultFolder;
		%feature("autodoc", "Return
-------
char16_t *

Description
-----------
No available documentation.
") DefaultFolder;
		const char16_t * DefaultFolder();

		/****** CDF_Application::Format ******/
		/****** md5 signature: 86e4a9eeee1c871bd587e836eeb2d672 ******/
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
try to retrieve a Format directly in the file or in application resource by using extension. returns True if found.
") Format;
		bool Format(TCollection_ExtendedString aFileName, TCollection_ExtendedString & theFormat);

		/****** CDF_Application::GetRetrieveStatus ******/
		/****** md5 signature: 5a9523dbf252a1564feb97c9e6a00909 ******/
		%feature("compactdefaultargs") GetRetrieveStatus;
		%feature("autodoc", "Return
-------
PCDM_ReaderStatus

Description
-----------
Checks status after Retrieve.
") GetRetrieveStatus;
		PCDM_ReaderStatus GetRetrieveStatus();

		/****** CDF_Application::InitDocument ******/
		/****** md5 signature: 71633d306d5c5cc6ec7824c1818ae992 ******/
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
Initialize a document for the applicative session. This virtual function is called by NewDocument and should be redefined for each specific application.
") InitDocument;
		virtual void InitDocument(const opencascade::handle<CDM_Document> & theDoc);

		/****** CDF_Application::Load ******/
		/****** md5 signature: 6f28094ffe0ccd3492096f784ee50c07 ******/
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
plugs an application. //! Open is used - for opening a Document that has been created in an application - for opening a Document from the database - for opening a Document from a file. The Open methods always add the document in the session directory and calls the virtual Activate method. The document is considered to be opened until Close is used. To be storable, a document must be opened by an application since the application resources are needed to store it.
") Load;
		static opencascade::handle<CDF_Application> Load(const Standard_GUID & aGUID);

		/****** CDF_Application::MetaDataDriver ******/
		/****** md5 signature: 65b9cb7e9445542f433cc5ea23630479 ******/
		%feature("compactdefaultargs") MetaDataDriver;
		%feature("autodoc", "Return
-------
opencascade::handle<CDF_MetaDataDriver>

Description
-----------
returns MetaDatdDriver of this application.
") MetaDataDriver;
		opencascade::handle<CDF_MetaDataDriver> MetaDataDriver();

		/****** CDF_Application::NewDocument ******/
		/****** md5 signature: 8948e39f4c19a050838644ef4dd96de3 ******/
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
Constructs an new empty document. This document will have the specified format. If InitDocument() is redefined for a specific application, the new document is handled by the applicative session.
") NewDocument;
		virtual void NewDocument(TCollection_ExtendedString theFormat, opencascade::handle<CDM_Document> & theDoc);

		/****** CDF_Application::Open ******/
		/****** md5 signature: 5e6498f06bf961c0c0c61cc007aa0a28 ******/
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
puts the document in the current session directory and calls the virtual method Activate on it.
") Open;
		void Open(const opencascade::handle<CDM_Document> & aDocument);

		/****** CDF_Application::Read ******/
		/****** md5 signature: fed3647299064218aa4c2d8dceec103f ******/
		%feature("compactdefaultargs") Read;
		%feature("autodoc", "
Parameters
----------
theIStream: str
theDocument: CDM_Document
theFilter: PCDM_ReaderFilter (optional, default to opencascade::handle<PCDM_ReaderFilter>())
theRange: Message_ProgressRange (optional, default to Message_ProgressRange())

Return
-------
None

Description
-----------
Reads theDocument from standard SEEKABLE stream theIStream, the stream should support SEEK functionality.
") Read;
		void Read(std::istream & theIStream, opencascade::handle<CDM_Document> & theDocument, const opencascade::handle<PCDM_ReaderFilter> & theFilter = opencascade::handle<PCDM_ReaderFilter>(), const Message_ProgressRange & theRange = Message_ProgressRange());

		/****** CDF_Application::ReaderFromFormat ******/
		/****** md5 signature: aab6344d555db3220a1fcf7db3c7d59e ******/
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
Returns instance of read driver for specified format. //! Default implementation uses plugin mechanism to load reader dynamically. For this to work, application resources should define GUID of the plugin as value of [Format].RetrievalPlugin, and 'Plugin' resource should define name of plugin library to be loaded as value of [GUID].Location. Plugin library should provide method PLUGINFACTORY returning instance of the reader for the same GUID (see Plugin_Macro.hxx). //! In case if reader is not available, will raise Standard_NoSuchObject or other exception if raised by plugin loader.
") ReaderFromFormat;
		virtual opencascade::handle<PCDM_Reader> ReaderFromFormat(TCollection_ExtendedString aFormat);

		/****** CDF_Application::Retrieve ******/
		/****** md5 signature: 1fdfae83277533451d5724738a98cce9 ******/
		%feature("compactdefaultargs") Retrieve;
		%feature("autodoc", "
Parameters
----------
aFolder: str
aName: str
UseStorageConfiguration: bool (optional, default to true)
theFilter: PCDM_ReaderFilter (optional, default to opencascade::handle<PCDM_ReaderFilter>())
theRange: Message_ProgressRange (optional, default to Message_ProgressRange())

Return
-------
opencascade::handle<CDM_Document>

Description
-----------
This method retrieves a document from the database. If the Document references other documents which have been updated, the latest version of these documents will be used if {UseStorageConfiguration} is true. The content of {aFolder}, {aName} and {aVersion} depends on the Database Manager system. If the DBMS is only based on the OS, {aFolder} is a directory and {aName} is the name of a file. In this case the use of the syntax with {aVersion} has no sense. For example: //! opencascade::handle<CDM_Document> theDocument=myApplication->Retrieve('/home/cascade','box.dsg'); If the DBMS is EUCLID/Design Manager, {aFolder}, {aName} have the form they have in EUCLID/Design Manager. For example: //! opencascade::handle<CDM_Document> theDocument=myApplication->Retrieve('|user|cascade','box'); //! Since the version is not specified in this syntax, the latest will be used. A link is kept with the database through an instance of CDM_MetaData.
") Retrieve;
		opencascade::handle<CDM_Document> Retrieve(TCollection_ExtendedString aFolder, TCollection_ExtendedString aName, const bool UseStorageConfiguration = true, const opencascade::handle<PCDM_ReaderFilter> & theFilter = opencascade::handle<PCDM_ReaderFilter>(), const Message_ProgressRange & theRange = Message_ProgressRange());

		/****** CDF_Application::Retrieve ******/
		/****** md5 signature: 1cf9f02f9c4bacd074d49f96276d9fbe ******/
		%feature("compactdefaultargs") Retrieve;
		%feature("autodoc", "
Parameters
----------
aFolder: str
aName: str
aVersion: str
UseStorageConfiguration: bool (optional, default to true)
theFilter: PCDM_ReaderFilter (optional, default to opencascade::handle<PCDM_ReaderFilter>())
theRange: Message_ProgressRange (optional, default to Message_ProgressRange())

Return
-------
opencascade::handle<CDM_Document>

Description
-----------
This method retrieves a document from the database. If the Document references other documents which have been updated, the latest version of these documents will be used if {UseStorageConfiguration} is true. If the DBMS is only based on the OS, this syntax should not be used. //! If the DBMS is EUCLID/Design Manager, {aFolder}, {aName} and {aVersion} have the form they have in EUCLID/Design Manager. For example: //! opencascade::handle<CDM_Document> theDocument=myApplication->Retrieve('|user|cascade','box','2'); A link is kept with the database through an instance of CDM_MetaData.
") Retrieve;
		opencascade::handle<CDM_Document> Retrieve(TCollection_ExtendedString aFolder, TCollection_ExtendedString aName, TCollection_ExtendedString aVersion, const bool UseStorageConfiguration = true, const opencascade::handle<PCDM_ReaderFilter> & theFilter = opencascade::handle<PCDM_ReaderFilter>(), const Message_ProgressRange & theRange = Message_ProgressRange());

		/****** CDF_Application::SetDefaultFolder ******/
		/****** md5 signature: c6df0edd8dc3d743fca751c4874773ac ******/
		%feature("compactdefaultargs") SetDefaultFolder;
		%feature("autodoc", "
Parameters
----------
aFolder: char16_t *

Return
-------
bool

Description
-----------
No available documentation.
") SetDefaultFolder;
		bool SetDefaultFolder(const char16_t * const aFolder);

		/****** CDF_Application::WriterFromFormat ******/
		/****** md5 signature: 2039925e39207c83df1666eea6efb175 ******/
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
Returns instance of storage driver for specified format. //! Default implementation uses plugin mechanism to load driver dynamically. For this to work, application resources should define GUID of the plugin as value of [Format].StoragePlugin, and 'Plugin' resource should define name of plugin library to be loaded as value of [GUID].Location. Plugin library should provide method PLUGINFACTORY returning instance of the reader for the same GUID (see Plugin_Macro.hxx). //! In case if driver is not available, will raise Standard_NoSuchObject or other exception if raised by plugin loader.
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
		/****** CDF_Directory::CDF_Directory ******/
		/****** md5 signature: 46be2128bdcbbd3ab4afafabd80860e0 ******/
		%feature("compactdefaultargs") CDF_Directory;
		%feature("autodoc", "Return
-------
None

Description
-----------
Creates an empty directory.
") CDF_Directory;
		 CDF_Directory();

		/****** CDF_Directory::Add ******/
		/****** md5 signature: b6b784134819ac5d900cf7ccf0994349 ******/
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
adds a document into the directory.
") Add;
		void Add(const opencascade::handle<CDM_Document> & aDocument);

		/****** CDF_Directory::Contains ******/
		/****** md5 signature: 50eb737cb3de469050f517ba48237df2 ******/
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
Returns true if the document aDocument is in the directory.
") Contains;
		bool Contains(const opencascade::handle<CDM_Document> & aDocument);

		/****** CDF_Directory::IsEmpty ******/
		/****** md5 signature: 03c43b1186186edcd7d757f16ac1f505 ******/
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "Return
-------
bool

Description
-----------
returns true if the directory is empty.
") IsEmpty;
		bool IsEmpty();

		/****** CDF_Directory::Last ******/
		/****** md5 signature: 315f5b609ccef6e8a0c865d973889a7c ******/
		%feature("compactdefaultargs") Last;
		%feature("autodoc", "Return
-------
opencascade::handle<CDM_Document>

Description
-----------
returns the last document (if any) which has been added in the directory.
") Last;
		opencascade::handle<CDM_Document> Last();

		/****** CDF_Directory::Length ******/
		/****** md5 signature: f07a384d0f09ac6092cb8ed89442c8a8 ******/
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "Return
-------
int

Description
-----------
returns the number of documents of the directory.
") Length;
		int Length();

		/****** CDF_Directory::Remove ******/
		/****** md5 signature: 9a20bceb09f550258abc1a5ffcd3575d ******/
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
removes the document.
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
		/****** CDF_MetaDataDriver::BuildFileName ******/
		/****** md5 signature: 805bb09da5d1d397a25adbb9a5d24005 ******/
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

		/****** CDF_MetaDataDriver::CreateDependsOn ******/
		/****** md5 signature: b8890e513eb264013f073c1a6b02e2e2 ******/
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
Creates a 'Depends On' relation between two Datas. By default does nothing.
") CreateDependsOn;
		virtual void CreateDependsOn(const opencascade::handle<CDM_MetaData> & aFirstData, const opencascade::handle<CDM_MetaData> & aSecondData);

		/****** CDF_MetaDataDriver::CreateMetaData ******/
		/****** md5 signature: 38159ffc0f1a18d77efc3d7a8362b043 ******/
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
should create meta-data corresponding to aData and maintaining a meta-link between these meta-data and aFileName CreateMetaData is called by CreateData If the metadata-driver has version capabilities, version must be set in the returned Data.
") CreateMetaData;
		virtual opencascade::handle<CDM_MetaData> CreateMetaData(const opencascade::handle<CDM_Document> & aDocument, TCollection_ExtendedString aFileName);

		/****** CDF_MetaDataDriver::CreateReference ******/
		/****** md5 signature: 7881d5aa40e39715bee7399cb44d7fe7 ******/
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
		virtual void CreateReference(const opencascade::handle<CDM_MetaData> & aFrom, const opencascade::handle<CDM_MetaData> & aTo, const int aReferenceIdentifier, const int aToDocumentVersion);

		/****** CDF_MetaDataDriver::DefaultFolder ******/
		/****** md5 signature: 8f25b151d43bdae5827f4c1016790f5d ******/
		%feature("compactdefaultargs") DefaultFolder;
		%feature("autodoc", "Return
-------
TCollection_ExtendedString

Description
-----------
No available documentation.
") DefaultFolder;
		virtual TCollection_ExtendedString DefaultFolder();

		/****** CDF_MetaDataDriver::Find ******/
		/****** md5 signature: 119fa4cc235dba95d9db6fffc74992c2 ******/
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
should indicate whether meta-data exist in the DBMS corresponding to the Data. aVersion may be NULL;.
") Find;
		virtual bool Find(TCollection_ExtendedString aFolder, TCollection_ExtendedString aName, TCollection_ExtendedString aVersion);

		/****** CDF_MetaDataDriver::Find ******/
		/****** md5 signature: 77f1cc3003e807f7fe49946644dd2be4 ******/
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
calls Find with an empty version.
") Find;
		bool Find(TCollection_ExtendedString aFolder, TCollection_ExtendedString aName);

		/****** CDF_MetaDataDriver::FindFolder ******/
		/****** md5 signature: 12abf4e8c751523b88d1a81a9d44d11d ******/
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
		virtual bool FindFolder(TCollection_ExtendedString aFolder);

		/****** CDF_MetaDataDriver::HasReadPermission ******/
		/****** md5 signature: 134ab0d9e4cfbc96883c3ee73ee59376 ******/
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
		virtual bool HasReadPermission(TCollection_ExtendedString aFolder, TCollection_ExtendedString aName, TCollection_ExtendedString aVersion);

		/****** CDF_MetaDataDriver::HasVersion ******/
		/****** md5 signature: 436f5fe08921d8520e6afaf17405c707 ******/
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
by default return true.
") HasVersion;
		virtual bool HasVersion(TCollection_ExtendedString aFolder, TCollection_ExtendedString aName);

		/****** CDF_MetaDataDriver::HasVersionCapability ******/
		/****** md5 signature: d6a437b78625ec1872648346d39f7332 ******/
		%feature("compactdefaultargs") HasVersionCapability;
		%feature("autodoc", "Return
-------
bool

Description
-----------
returns true if the MetaDataDriver can manage different versions of a Data. By default, returns false.
") HasVersionCapability;
		virtual bool HasVersionCapability();

		/****** CDF_MetaDataDriver::LastVersion ******/
		/****** md5 signature: 9d9316bfcc062ca6089c234c0ce83791 ******/
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
by default returns aMetaDATA should return the MetaData stored in the DBMS with the meta-data corresponding to the path. If the MetaDataDriver has version management capabilities the version has to be set in the returned MetaData. MetaData is called by GetMetaData If the version is not included in the path, MetaData should return the last version of the metadata is deferred;.
") LastVersion;
		virtual opencascade::handle<CDM_MetaData> LastVersion(const opencascade::handle<CDM_MetaData> & aMetaData);

		/****** CDF_MetaDataDriver::MetaData ******/
		/****** md5 signature: 4662f97988f934c8a08742039341d0de ******/
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
should return the MetaData stored in the DBMS with the meta-data corresponding to the Data. If the MetaDataDriver has version management capabilities the version has to be set in the returned MetaData. aVersion may be NULL MetaData is called by GetMetaData If the version is set to NULL, MetaData should return the last version of the metadata.
") MetaData;
		virtual opencascade::handle<CDM_MetaData> MetaData(TCollection_ExtendedString aFolder, TCollection_ExtendedString aName, TCollection_ExtendedString aVersion);

		/****** CDF_MetaDataDriver::MetaData ******/
		/****** md5 signature: d6c67f068a67123fd1d2e0024518d5e4 ******/
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
calls MetaData with an empty version.
") MetaData;
		opencascade::handle<CDM_MetaData> MetaData(TCollection_ExtendedString aFolder, TCollection_ExtendedString aName);

		/****** CDF_MetaDataDriver::ReferenceIterator ******/
		/****** md5 signature: 6d4c044d33dd6f42be200285a2b215e5 ******/
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

		/****** CDF_MetaDataDriver::SetName ******/
		/****** md5 signature: 10c6e80103256298f85d47fc462c3021 ******/
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
this method is useful if the name of an object depends on the metadatadriver. For example a Driver based on the operating system can choose to add the extension of file to create to the object.
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
		/****** CDF_MetaDataDriverFactory::Build ******/
		/****** md5 signature: 00964348e662a6a0ab28dcfcc6c0ef54 ******/
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
		/****** CDF_Store::CDF_Store ******/
		/****** md5 signature: 74a9583ede7295ce2ee9cd44d9a6eb94 ******/
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
creates a store list from the document of the current selection.
") CDF_Store;
		 CDF_Store(const opencascade::handle<CDM_Document> & aDocument);

		/****** CDF_Store::AssociatedStatusText ******/
		/****** md5 signature: eef46b9b25f3fd92ef166290dad3691b ******/
		%feature("compactdefaultargs") AssociatedStatusText;
		%feature("autodoc", "Return
-------
char16_t *

Description
-----------
No available documentation.
") AssociatedStatusText;
		const char16_t * AssociatedStatusText();

		/****** CDF_Store::Comment ******/
		/****** md5 signature: 5dfb2f1d86286c98eb50db6b2ec9776a ******/
		%feature("compactdefaultargs") Comment;
		%feature("autodoc", "Return
-------
opencascade::handle<TCollection_HExtendedString>

Description
-----------
No available documentation.
") Comment;
		opencascade::handle<TCollection_HExtendedString> Comment();

		/****** CDF_Store::CurrentIsConsistent ******/
		/****** md5 signature: a639957f7f25a59712935aaff5c60924 ******/
		%feature("compactdefaultargs") CurrentIsConsistent;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") CurrentIsConsistent;
		bool CurrentIsConsistent();

		/****** CDF_Store::Description ******/
		/****** md5 signature: 0f5a6da911401296c8b30f075d3be212 ******/
		%feature("compactdefaultargs") Description;
		%feature("autodoc", "Return
-------
opencascade::handle<TCollection_HExtendedString>

Description
-----------
returns the description of the format of the main object.
") Description;
		opencascade::handle<TCollection_HExtendedString> Description();

		/****** CDF_Store::Folder ******/
		/****** md5 signature: 73105a79a5d36e1f7de58c6236ff69b5 ******/
		%feature("compactdefaultargs") Folder;
		%feature("autodoc", "Return
-------
opencascade::handle<TCollection_HExtendedString>

Description
-----------
returns the folder in which the current document will be stored.
") Folder;
		opencascade::handle<TCollection_HExtendedString> Folder();

		/****** CDF_Store::HasAPreviousVersion ******/
		/****** md5 signature: 61962a63f7fe8a04700869d756e38591 ******/
		%feature("compactdefaultargs") HasAPreviousVersion;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") HasAPreviousVersion;
		bool HasAPreviousVersion();

		/****** CDF_Store::IsConsistent ******/
		/****** md5 signature: 8a867e130e74d777c88e7e4a67695585 ******/
		%feature("compactdefaultargs") IsConsistent;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsConsistent;
		bool IsConsistent();

		/****** CDF_Store::IsMainDocument ******/
		/****** md5 signature: d89cd7721b11e81ed220e6d56ed5b854 ******/
		%feature("compactdefaultargs") IsMainDocument;
		%feature("autodoc", "Return
-------
bool

Description
-----------
returns true if the currentdocument is the main one, ie the document of the current selection.
") IsMainDocument;
		bool IsMainDocument();

		/****** CDF_Store::IsModified ******/
		/****** md5 signature: 20a841c48b5ecb63ab1563022bd76327 ******/
		%feature("compactdefaultargs") IsModified;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsModified;
		bool IsModified();

		/****** CDF_Store::IsStored ******/
		/****** md5 signature: 50f45f1ea3dc0d91fb1ecc9b03467aa1 ******/
		%feature("compactdefaultargs") IsStored;
		%feature("autodoc", "Return
-------
bool

Description
-----------
returns true if the current document is already stored.
") IsStored;
		bool IsStored();

		/****** CDF_Store::MetaDataPath ******/
		/****** md5 signature: 835d7c7f39245f9133772b983dcc3304 ******/
		%feature("compactdefaultargs") MetaDataPath;
		%feature("autodoc", "Return
-------
opencascade::handle<TCollection_HExtendedString>

Description
-----------
returns the path of the previous store is the object is already stored, otherwise an empty string;.
") MetaDataPath;
		opencascade::handle<TCollection_HExtendedString> MetaDataPath();

		/****** CDF_Store::Name ******/
		/****** md5 signature: 03ea3f3ee5fa94844fd4d36cdbd9cbbd ******/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "Return
-------
opencascade::handle<TCollection_HExtendedString>

Description
-----------
returns the name under which the current document will be stored.
") Name;
		opencascade::handle<TCollection_HExtendedString> Name();

		/****** CDF_Store::Path ******/
		/****** md5 signature: ad181787794f1961316622cedcc4215c ******/
		%feature("compactdefaultargs") Path;
		%feature("autodoc", "Return
-------
char16_t *

Description
-----------
returns the complete path of the created meta-data.
") Path;
		const char16_t * Path();

		/****** CDF_Store::PreviousVersion ******/
		/****** md5 signature: ad90ed1fb5b96a052d0f5ad3d9c8b43d ******/
		%feature("compactdefaultargs") PreviousVersion;
		%feature("autodoc", "Return
-------
opencascade::handle<TCollection_HExtendedString>

Description
-----------
No available documentation.
") PreviousVersion;
		opencascade::handle<TCollection_HExtendedString> PreviousVersion();

		/****** CDF_Store::Realize ******/
		/****** md5 signature: d59c3600fa85f189069750fcb7bd399b ******/
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

		/****** CDF_Store::RecheckName ******/
		/****** md5 signature: 67223e0099da9a98b079d45cadef07e4 ******/
		%feature("compactdefaultargs") RecheckName;
		%feature("autodoc", "Return
-------
CDF_StoreSetNameStatus

Description
-----------
defines the name under which the document should be stored. uses for example after modification of the folder.
") RecheckName;
		CDF_StoreSetNameStatus RecheckName();

		/****** CDF_Store::SetComment ******/
		/****** md5 signature: bdd790c1af24706acf95e7197866ad5a ******/
		%feature("compactdefaultargs") SetComment;
		%feature("autodoc", "
Parameters
----------
aComment: char16_t *

Return
-------
None

Description
-----------
No available documentation.
") SetComment;
		void SetComment(const char16_t * const aComment);

		/****** CDF_Store::SetCurrent ******/
		/****** md5 signature: 0f93a9c29a476f6f6602183e7b66ee31 ******/
		%feature("compactdefaultargs") SetCurrent;
		%feature("autodoc", "
Parameters
----------
aPresentation: char16_t *

Return
-------
None

Description
-----------
No available documentation.
") SetCurrent;
		void SetCurrent(const char16_t * const aPresentation);

		/****** CDF_Store::SetFolder ******/
		/****** md5 signature: 366c24c83d026601daeb0602418236e6 ******/
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
defines the folder in which the document should be stored. returns true if the Folder exists, false otherwise.
") SetFolder;
		bool SetFolder(TCollection_ExtendedString aFolder);

		/****** CDF_Store::SetFolder ******/
		/****** md5 signature: 1775002da403d0b998d9041ab9850e7b ******/
		%feature("compactdefaultargs") SetFolder;
		%feature("autodoc", "
Parameters
----------
aFolder: char16_t *

Return
-------
bool

Description
-----------
defines the folder in which the document should be stored. returns true if the Folder exists, false otherwise.
") SetFolder;
		bool SetFolder(const char16_t * const aFolder);

		/****** CDF_Store::SetMain ******/
		/****** md5 signature: a7a1239199c6e8d991408789f7045a98 ******/
		%feature("compactdefaultargs") SetMain;
		%feature("autodoc", "Return
-------
None

Description
-----------
the two following methods can be used just after Realize or Import -- method to know if these methods worked correctly, and if not why.
") SetMain;
		void SetMain();

		/****** CDF_Store::SetName ******/
		/****** md5 signature: af88e4b2afba7c9c33c87c3566dd560d ******/
		%feature("compactdefaultargs") SetName;
		%feature("autodoc", "
Parameters
----------
aName: char16_t *

Return
-------
CDF_StoreSetNameStatus

Description
-----------
defines the name under which the document should be stored.
") SetName;
		CDF_StoreSetNameStatus SetName(const char16_t * const aName);

		/****** CDF_Store::SetName ******/
		/****** md5 signature: 62a6f4de5c52880dd94476733e959ce4 ******/
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
defines the name under which the document should be stored.
") SetName;
		CDF_StoreSetNameStatus SetName(TCollection_ExtendedString aName);

		/****** CDF_Store::SetPreviousVersion ******/
		/****** md5 signature: f9900d19dcb7f8f8d3ae9a46624f739e ******/
		%feature("compactdefaultargs") SetPreviousVersion;
		%feature("autodoc", "
Parameters
----------
aPreviousVersion: char16_t *

Return
-------
bool

Description
-----------
No available documentation.
") SetPreviousVersion;
		bool SetPreviousVersion(const char16_t * const aPreviousVersion);

		/****** CDF_Store::StoreStatus ******/
		/****** md5 signature: 0ea2be88f8e37cedd973fe034f3c1d11 ******/
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
		/****** CDF_StoreList::CDF_StoreList ******/
		/****** md5 signature: 2eca53e06d6546011dd7b0f27c5911a9 ******/
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

		/****** CDF_StoreList::Init ******/
		/****** md5 signature: 0de93ef32c53d091768788dca0e281fd ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init();

		/****** CDF_StoreList::IsConsistent ******/
		/****** md5 signature: 8a867e130e74d777c88e7e4a67695585 ******/
		%feature("compactdefaultargs") IsConsistent;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsConsistent;
		bool IsConsistent();

		/****** CDF_StoreList::More ******/
		/****** md5 signature: 922f3b0d43975d648336ba28bdfd0416 ******/
		%feature("compactdefaultargs") More;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") More;
		bool More();

		/****** CDF_StoreList::Next ******/
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

		/****** CDF_StoreList::Store ******/
		/****** md5 signature: 084ae73e13859cdf324c211495d2ab38 ******/
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
stores each object of the storelist in the reverse order of which they had been added.
") Store;
		PCDM_StoreStatus Store(opencascade::handle<CDM_MetaData> & aMetaData, TCollection_ExtendedString & aStatusAssociatedText, const Message_ProgressRange & theRange = Message_ProgressRange());

		/****** CDF_StoreList::Value ******/
		/****** md5 signature: 83b1ae63785c8877d821cb336792d4bc ******/
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
		/****** CDF_FWOSDriver::CDF_FWOSDriver ******/
		/****** md5 signature: 4949dc5ad6db20bc32fe56fc77b1a12e ******/
		%feature("compactdefaultargs") CDF_FWOSDriver;
		%feature("autodoc", "
Parameters
----------
theLookUpTable: CDM_MetaData

Return
-------
None

Description
-----------
Initializes the MetaDatadriver connected to specified look-up table. Note that the created driver will keep reference to the table, thus it must have life time longer than this object.
") CDF_FWOSDriver;
		 CDF_FWOSDriver(NCollection_DataMap<TCollection_ExtendedString, opencascade::handle<CDM_MetaData>> & theLookUpTable);

		/****** CDF_FWOSDriver::BuildFileName ******/
		/****** md5 signature: 74f50a405de45edf3c6d38fb1392faa7 ******/
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

		/****** CDF_FWOSDriver::DefaultFolder ******/
		/****** md5 signature: 333dc75e3bab5a5304cee97627d9faef ******/
		%feature("compactdefaultargs") DefaultFolder;
		%feature("autodoc", "Return
-------
TCollection_ExtendedString

Description
-----------
No available documentation.
") DefaultFolder;
		TCollection_ExtendedString DefaultFolder();

		/****** CDF_FWOSDriver::Find ******/
		/****** md5 signature: 7d3e7cbc3846417098359bcdd722fd48 ******/
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
indicate whether a file exists corresponding to the folder and the name.
") Find;
		bool Find(TCollection_ExtendedString aFolder, TCollection_ExtendedString aName, TCollection_ExtendedString aVersion);

		/****** CDF_FWOSDriver::FindFolder ******/
		/****** md5 signature: f0cdadbec3a1c8c3fcd6dcdf3323b25a ******/
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
		bool FindFolder(TCollection_ExtendedString aFolder);

		/****** CDF_FWOSDriver::HasReadPermission ******/
		/****** md5 signature: da212d226af195c57b044ed874cbe84b ******/
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
		bool HasReadPermission(TCollection_ExtendedString aFolder, TCollection_ExtendedString aName, TCollection_ExtendedString aVersion);

		/****** CDF_FWOSDriver::SetName ******/
		/****** md5 signature: baa56ec3f3e1d4614296dd17e8cecf54 ******/
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
		TCollection_ExtendedString SetName(const opencascade::handle<CDM_Document> & aDocument, TCollection_ExtendedString aName);

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
