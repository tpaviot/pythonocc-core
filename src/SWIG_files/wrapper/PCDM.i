/*
Copyright 2008-2022 Thomas Paviot (tpaviot@gmail.com)

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
%define PCDMDOCSTRING
"PCDM module, see official documentation at
https://www.opencascade.com/doc/occt-7.6.0/refman/html/package_pcdm.html"
%enddef
%module (package="OCC.Core", docstring=PCDMDOCSTRING) PCDM


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
#include<PCDM_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<Storage_module.hxx>
#include<TCollection_module.hxx>
#include<Message_module.hxx>
#include<TColStd_module.hxx>
#include<CDM_module.hxx>
#include<Resource_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import Storage.i
%import TCollection.i
%import Message.i
%import TColStd.i
%import CDM.i

%pythoncode {
from enum import IntEnum
from OCC.Core.Exception import *
};

/* public enums */
enum PCDM_StoreStatus {
	PCDM_SS_OK = 0,
	PCDM_SS_DriverFailure = 1,
	PCDM_SS_WriteFailure = 2,
	PCDM_SS_Failure = 3,
	PCDM_SS_Doc_IsNull = 4,
	PCDM_SS_No_Obj = 5,
	PCDM_SS_Info_Section_Error = 6,
	PCDM_SS_UserBreak = 7,
	PCDM_SS_UnrecognizedFormat = 8,
};

enum PCDM_TypeOfFileDriver {
	PCDM_TOFD_File = 0,
	PCDM_TOFD_CmpFile = 1,
	PCDM_TOFD_XmlFile = 2,
	PCDM_TOFD_Unknown = 3,
};

enum PCDM_ReaderStatus {
	PCDM_RS_OK = 0,
	PCDM_RS_NoDriver = 1,
	PCDM_RS_UnknownFileDriver = 2,
	PCDM_RS_OpenError = 3,
	PCDM_RS_NoVersion = 4,
	PCDM_RS_NoSchema = 5,
	PCDM_RS_NoDocument = 6,
	PCDM_RS_ExtensionFailure = 7,
	PCDM_RS_WrongStreamMode = 8,
	PCDM_RS_FormatFailure = 9,
	PCDM_RS_TypeFailure = 10,
	PCDM_RS_TypeNotFoundInSchema = 11,
	PCDM_RS_UnrecognizedFileFormat = 12,
	PCDM_RS_MakeFailure = 13,
	PCDM_RS_PermissionDenied = 14,
	PCDM_RS_DriverFailure = 15,
	PCDM_RS_AlreadyRetrievedAndModified = 16,
	PCDM_RS_AlreadyRetrieved = 17,
	PCDM_RS_UnknownDocument = 18,
	PCDM_RS_WrongResource = 19,
	PCDM_RS_ReaderException = 20,
	PCDM_RS_NoModel = 21,
	PCDM_RS_UserBreak = 22,
};

/* end public enums declaration */

/* python proxy classes for enums */
%pythoncode {

class PCDM_StoreStatus(IntEnum):
	PCDM_SS_OK = 0
	PCDM_SS_DriverFailure = 1
	PCDM_SS_WriteFailure = 2
	PCDM_SS_Failure = 3
	PCDM_SS_Doc_IsNull = 4
	PCDM_SS_No_Obj = 5
	PCDM_SS_Info_Section_Error = 6
	PCDM_SS_UserBreak = 7
	PCDM_SS_UnrecognizedFormat = 8
PCDM_SS_OK = PCDM_StoreStatus.PCDM_SS_OK
PCDM_SS_DriverFailure = PCDM_StoreStatus.PCDM_SS_DriverFailure
PCDM_SS_WriteFailure = PCDM_StoreStatus.PCDM_SS_WriteFailure
PCDM_SS_Failure = PCDM_StoreStatus.PCDM_SS_Failure
PCDM_SS_Doc_IsNull = PCDM_StoreStatus.PCDM_SS_Doc_IsNull
PCDM_SS_No_Obj = PCDM_StoreStatus.PCDM_SS_No_Obj
PCDM_SS_Info_Section_Error = PCDM_StoreStatus.PCDM_SS_Info_Section_Error
PCDM_SS_UserBreak = PCDM_StoreStatus.PCDM_SS_UserBreak
PCDM_SS_UnrecognizedFormat = PCDM_StoreStatus.PCDM_SS_UnrecognizedFormat

class PCDM_TypeOfFileDriver(IntEnum):
	PCDM_TOFD_File = 0
	PCDM_TOFD_CmpFile = 1
	PCDM_TOFD_XmlFile = 2
	PCDM_TOFD_Unknown = 3
PCDM_TOFD_File = PCDM_TypeOfFileDriver.PCDM_TOFD_File
PCDM_TOFD_CmpFile = PCDM_TypeOfFileDriver.PCDM_TOFD_CmpFile
PCDM_TOFD_XmlFile = PCDM_TypeOfFileDriver.PCDM_TOFD_XmlFile
PCDM_TOFD_Unknown = PCDM_TypeOfFileDriver.PCDM_TOFD_Unknown

class PCDM_ReaderStatus(IntEnum):
	PCDM_RS_OK = 0
	PCDM_RS_NoDriver = 1
	PCDM_RS_UnknownFileDriver = 2
	PCDM_RS_OpenError = 3
	PCDM_RS_NoVersion = 4
	PCDM_RS_NoSchema = 5
	PCDM_RS_NoDocument = 6
	PCDM_RS_ExtensionFailure = 7
	PCDM_RS_WrongStreamMode = 8
	PCDM_RS_FormatFailure = 9
	PCDM_RS_TypeFailure = 10
	PCDM_RS_TypeNotFoundInSchema = 11
	PCDM_RS_UnrecognizedFileFormat = 12
	PCDM_RS_MakeFailure = 13
	PCDM_RS_PermissionDenied = 14
	PCDM_RS_DriverFailure = 15
	PCDM_RS_AlreadyRetrievedAndModified = 16
	PCDM_RS_AlreadyRetrieved = 17
	PCDM_RS_UnknownDocument = 18
	PCDM_RS_WrongResource = 19
	PCDM_RS_ReaderException = 20
	PCDM_RS_NoModel = 21
	PCDM_RS_UserBreak = 22
PCDM_RS_OK = PCDM_ReaderStatus.PCDM_RS_OK
PCDM_RS_NoDriver = PCDM_ReaderStatus.PCDM_RS_NoDriver
PCDM_RS_UnknownFileDriver = PCDM_ReaderStatus.PCDM_RS_UnknownFileDriver
PCDM_RS_OpenError = PCDM_ReaderStatus.PCDM_RS_OpenError
PCDM_RS_NoVersion = PCDM_ReaderStatus.PCDM_RS_NoVersion
PCDM_RS_NoSchema = PCDM_ReaderStatus.PCDM_RS_NoSchema
PCDM_RS_NoDocument = PCDM_ReaderStatus.PCDM_RS_NoDocument
PCDM_RS_ExtensionFailure = PCDM_ReaderStatus.PCDM_RS_ExtensionFailure
PCDM_RS_WrongStreamMode = PCDM_ReaderStatus.PCDM_RS_WrongStreamMode
PCDM_RS_FormatFailure = PCDM_ReaderStatus.PCDM_RS_FormatFailure
PCDM_RS_TypeFailure = PCDM_ReaderStatus.PCDM_RS_TypeFailure
PCDM_RS_TypeNotFoundInSchema = PCDM_ReaderStatus.PCDM_RS_TypeNotFoundInSchema
PCDM_RS_UnrecognizedFileFormat = PCDM_ReaderStatus.PCDM_RS_UnrecognizedFileFormat
PCDM_RS_MakeFailure = PCDM_ReaderStatus.PCDM_RS_MakeFailure
PCDM_RS_PermissionDenied = PCDM_ReaderStatus.PCDM_RS_PermissionDenied
PCDM_RS_DriverFailure = PCDM_ReaderStatus.PCDM_RS_DriverFailure
PCDM_RS_AlreadyRetrievedAndModified = PCDM_ReaderStatus.PCDM_RS_AlreadyRetrievedAndModified
PCDM_RS_AlreadyRetrieved = PCDM_ReaderStatus.PCDM_RS_AlreadyRetrieved
PCDM_RS_UnknownDocument = PCDM_ReaderStatus.PCDM_RS_UnknownDocument
PCDM_RS_WrongResource = PCDM_ReaderStatus.PCDM_RS_WrongResource
PCDM_RS_ReaderException = PCDM_ReaderStatus.PCDM_RS_ReaderException
PCDM_RS_NoModel = PCDM_ReaderStatus.PCDM_RS_NoModel
PCDM_RS_UserBreak = PCDM_ReaderStatus.PCDM_RS_UserBreak
};
/* end python proxy for enums */

/* handles */
%wrap_handle(PCDM_ReadWriter)
%wrap_handle(PCDM_Reader)
%wrap_handle(PCDM_ReaderFilter)
%wrap_handle(PCDM_ReferenceIterator)
%wrap_handle(PCDM_Writer)
%wrap_handle(PCDM_ReadWriter_1)
%wrap_handle(PCDM_RetrievalDriver)
%wrap_handle(PCDM_StorageDriver)
/* end handles declaration */

/* templates */
%template(PCDM_BaseDriverPointer) opencascade::handle<Storage_BaseDriver>;
%template(PCDM_SequenceOfDocument) NCollection_Sequence<opencascade::handle<PCDM_Document>>;

%extend NCollection_Sequence<opencascade::handle<PCDM_Document>> {
    %pythoncode {
    def __len__(self):
        return self.Size()
    }
};
%template(PCDM_SequenceOfReference) NCollection_Sequence<PCDM_Reference>;

%extend NCollection_Sequence<PCDM_Reference> {
    %pythoncode {
    def __len__(self):
        return self.Size()
    }
};
/* end templates declaration */

/* typedefs */
typedef opencascade::handle<Storage_BaseDriver> PCDM_BaseDriverPointer;
typedef NCollection_Sequence<opencascade::handle<PCDM_Document>> PCDM_SequenceOfDocument;
typedef NCollection_Sequence<PCDM_Reference> PCDM_SequenceOfReference;
/* end typedefs declaration */

/*************
* class PCDM *
*************/
%rename(pcdm) PCDM;
class PCDM {
	public:
		/****************** FileDriverType ******************/
		/**** md5 signature: 97feffff0539527a32e20dbd56a70780 ****/
		%feature("compactdefaultargs") FileDriverType;
		%feature("autodoc", "No available documentation.

Parameters
----------
aFileName: str
aBaseDriver: Storage_BaseDriver

Returns
-------
PCDM_TypeOfFileDriver
") FileDriverType;
		static PCDM_TypeOfFileDriver FileDriverType(TCollection_AsciiString aFileName, opencascade::handle<Storage_BaseDriver> & aBaseDriver);

};


%extend PCDM {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************
* class PCDM_DOMHeaderParser *
*****************************/
/**********************
* class PCDM_Document *
**********************/
/************************
* class PCDM_ReadWriter *
************************/
%nodefaultctor PCDM_ReadWriter;
class PCDM_ReadWriter : public Standard_Transient {
	public:
		/****************** FileFormat ******************/
		/**** md5 signature: b520f0cc5162eb6c2dc2ec34b97c43ec ****/
		%feature("compactdefaultargs") FileFormat;
		%feature("autodoc", "Tries to get a format in the file. returns an empty string if the file could not be read or does not have a fileformat information.

Parameters
----------
aFileName: str

Returns
-------
TCollection_ExtendedString
") FileFormat;
		static TCollection_ExtendedString FileFormat(TCollection_ExtendedString aFileName);

		/****************** Open ******************/
		/**** md5 signature: a144cbf2785ef2f8f31a70359be3305c ****/
		%feature("compactdefaultargs") Open;
		%feature("autodoc", "No available documentation.

Parameters
----------
aDriver: Storage_BaseDriver
aFileName: str
anOpenMode: Storage_OpenMode

Returns
-------
None
") Open;
		static void Open(const opencascade::handle<Storage_BaseDriver> & aDriver, TCollection_ExtendedString aFileName, const Storage_OpenMode anOpenMode);

		/****************** ReadDocumentVersion ******************/
		/**** md5 signature: bf1f618098d7343ef9fbe7740b59f3aa ****/
		%feature("compactdefaultargs") ReadDocumentVersion;
		%feature("autodoc", "No available documentation.

Parameters
----------
aFileName: str
theMsgDriver: Message_Messenger

Returns
-------
int
") ReadDocumentVersion;
		virtual Standard_Integer ReadDocumentVersion(TCollection_ExtendedString aFileName, const opencascade::handle<Message_Messenger> & theMsgDriver);

		/****************** ReadExtensions ******************/
		/**** md5 signature: 2739d7ca0016c071d9071f6a6efd593b ****/
		%feature("compactdefaultargs") ReadExtensions;
		%feature("autodoc", "No available documentation.

Parameters
----------
aFileName: str
theExtensions: TColStd_SequenceOfExtendedString
theMsgDriver: Message_Messenger

Returns
-------
None
") ReadExtensions;
		virtual void ReadExtensions(TCollection_ExtendedString aFileName, TColStd_SequenceOfExtendedString & theExtensions, const opencascade::handle<Message_Messenger> & theMsgDriver);

		/****************** ReadReferenceCounter ******************/
		/**** md5 signature: c78e646bc2907d99bd148ca5d6ab0520 ****/
		%feature("compactdefaultargs") ReadReferenceCounter;
		%feature("autodoc", "No available documentation.

Parameters
----------
theFileName: str
theMsgDriver: Message_Messenger

Returns
-------
int
") ReadReferenceCounter;
		virtual Standard_Integer ReadReferenceCounter(TCollection_ExtendedString theFileName, const opencascade::handle<Message_Messenger> & theMsgDriver);

		/****************** ReadReferences ******************/
		/**** md5 signature: b3faa5a407a9c6a70f34faa350ed3328 ****/
		%feature("compactdefaultargs") ReadReferences;
		%feature("autodoc", "No available documentation.

Parameters
----------
aFileName: str
theReferences: PCDM_SequenceOfReference
theMsgDriver: Message_Messenger

Returns
-------
None
") ReadReferences;
		virtual void ReadReferences(TCollection_ExtendedString aFileName, PCDM_SequenceOfReference & theReferences, const opencascade::handle<Message_Messenger> & theMsgDriver);

		/****************** Reader ******************/
		/**** md5 signature: 5abfb4fc6587b1edbdb91359566a4f72 ****/
		%feature("compactdefaultargs") Reader;
		%feature("autodoc", "Returns the convenient reader for a file.

Parameters
----------
aFileName: str

Returns
-------
opencascade::handle<PCDM_ReadWriter>
") Reader;
		static opencascade::handle<PCDM_ReadWriter> Reader(TCollection_ExtendedString aFileName);

		/****************** Version ******************/
		/**** md5 signature: 3a6502e85781045440638f7269538a9b ****/
		%feature("compactdefaultargs") Version;
		%feature("autodoc", "Returns pcdm_readwriter_1.

Returns
-------
TCollection_AsciiString
") Version;
		virtual TCollection_AsciiString Version();

		/****************** WriteExtensions ******************/
		/**** md5 signature: ff046bbd64ddfb5c98b698fb97500cce ****/
		%feature("compactdefaultargs") WriteExtensions;
		%feature("autodoc", "No available documentation.

Parameters
----------
aData: Storage_Data
aDocument: CDM_Document

Returns
-------
None
") WriteExtensions;
		virtual void WriteExtensions(const opencascade::handle<Storage_Data> & aData, const opencascade::handle<CDM_Document> & aDocument);

		/****************** WriteFileFormat ******************/
		/**** md5 signature: a5aae79ebf9a26cf742edfd2cad4f010 ****/
		%feature("compactdefaultargs") WriteFileFormat;
		%feature("autodoc", "No available documentation.

Parameters
----------
aData: Storage_Data
aDocument: CDM_Document

Returns
-------
None
") WriteFileFormat;
		static void WriteFileFormat(const opencascade::handle<Storage_Data> & aData, const opencascade::handle<CDM_Document> & aDocument);

		/****************** WriteReferenceCounter ******************/
		/**** md5 signature: 288d068aadabd53bbeea3b420603b92b ****/
		%feature("compactdefaultargs") WriteReferenceCounter;
		%feature("autodoc", "No available documentation.

Parameters
----------
aData: Storage_Data
aDocument: CDM_Document

Returns
-------
None
") WriteReferenceCounter;
		virtual void WriteReferenceCounter(const opencascade::handle<Storage_Data> & aData, const opencascade::handle<CDM_Document> & aDocument);

		/****************** WriteReferences ******************/
		/**** md5 signature: a29b472aa14bc7a7c4fa45af6a247126 ****/
		%feature("compactdefaultargs") WriteReferences;
		%feature("autodoc", "No available documentation.

Parameters
----------
aData: Storage_Data
aDocument: CDM_Document
theReferencerFileName: str

Returns
-------
None
") WriteReferences;
		virtual void WriteReferences(const opencascade::handle<Storage_Data> & aData, const opencascade::handle<CDM_Document> & aDocument, TCollection_ExtendedString theReferencerFileName);

		/****************** WriteVersion ******************/
		/**** md5 signature: 159c6fe061eaba42cff513dc8813ee2f ****/
		%feature("compactdefaultargs") WriteVersion;
		%feature("autodoc", "No available documentation.

Parameters
----------
aData: Storage_Data
aDocument: CDM_Document

Returns
-------
None
") WriteVersion;
		virtual void WriteVersion(const opencascade::handle<Storage_Data> & aData, const opencascade::handle<CDM_Document> & aDocument);

		/****************** Writer ******************/
		/**** md5 signature: 64097579d1166d4efdc2fd6a6f0a76a8 ****/
		%feature("compactdefaultargs") Writer;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<PCDM_ReadWriter>
") Writer;
		static opencascade::handle<PCDM_ReadWriter> Writer();

};


%make_alias(PCDM_ReadWriter)

%extend PCDM_ReadWriter {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************
* class PCDM_Reader *
********************/
%nodefaultctor PCDM_Reader;
class PCDM_Reader : public Standard_Transient {
	public:
		/****************** GetStatus ******************/
		/**** md5 signature: 7da0146422c21bfb19406a01283cc862 ****/
		%feature("compactdefaultargs") GetStatus;
		%feature("autodoc", "No available documentation.

Returns
-------
PCDM_ReaderStatus
") GetStatus;
		PCDM_ReaderStatus GetStatus();

		/****************** Read ******************/
		/**** md5 signature: 2802ce2a9e685240bc6f6a5656a76a5d ****/
		%feature("compactdefaultargs") Read;
		%feature("autodoc", "Retrieves the content of the file into a new document.

Parameters
----------
aFileName: str
aNewDocument: CDM_Document
anApplication: CDM_Application
theFilter: PCDM_ReaderFilter,optional
	default value is opencascade::handle<PCDM_ReaderFilter>()
theProgress: Message_ProgressRange,optional
	default value is Message_ProgressRange()

Returns
-------
None
") Read;
		virtual void Read(TCollection_ExtendedString aFileName, const opencascade::handle<CDM_Document> & aNewDocument, const opencascade::handle<CDM_Application> & anApplication, const opencascade::handle<PCDM_ReaderFilter> & theFilter = opencascade::handle<PCDM_ReaderFilter>(), const Message_ProgressRange & theProgress = Message_ProgressRange());

};


%make_alias(PCDM_Reader)

%extend PCDM_Reader {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************
* class PCDM_ReaderFilter *
**************************/
class PCDM_ReaderFilter : public Standard_Transient {
	public:
/* public enums */
enum AppendMode {
	AppendMode_Forbid = 0,
	AppendMode_Protect = 1,
	AppendMode_Overwrite = 2,
};

/* end public enums declaration */

/* python proxy classes for enums */
%pythoncode {

class AppendMode(IntEnum):
	AppendMode_Forbid = 0
	AppendMode_Protect = 1
	AppendMode_Overwrite = 2
AppendMode_Forbid = AppendMode.AppendMode_Forbid
AppendMode_Protect = AppendMode.AppendMode_Protect
AppendMode_Overwrite = AppendMode.AppendMode_Overwrite
};
/* end python proxy for enums */

		/****************** PCDM_ReaderFilter ******************/
		/**** md5 signature: 4fdd663fc1eb9a0562bfea80432f3678 ****/
		%feature("compactdefaultargs") PCDM_ReaderFilter;
		%feature("autodoc", "Creates an empty filter, so, all will be retrieved if nothing else is defined.

Returns
-------
None
") PCDM_ReaderFilter;
		 PCDM_ReaderFilter();

		/****************** PCDM_ReaderFilter ******************/
		/**** md5 signature: f469ce07b40ad960e4e48a472d2bc963 ****/
		%feature("compactdefaultargs") PCDM_ReaderFilter;
		%feature("autodoc", "Creates a filter to skip only one type of attributes.

Parameters
----------
theSkipped: Standard_Type

Returns
-------
None
") PCDM_ReaderFilter;
		 PCDM_ReaderFilter(const opencascade::handle<Standard_Type> & theSkipped);

		/****************** PCDM_ReaderFilter ******************/
		/**** md5 signature: 3dade491e95ccf0d8aa64edf2c0d55c6 ****/
		%feature("compactdefaultargs") PCDM_ReaderFilter;
		%feature("autodoc", "Creates a filter to read only sub-labels of a label-path. like, for '0:2' it will read all attributes for labels '0:2', '0:2:1', etc.

Parameters
----------
theEntryToRead: str

Returns
-------
None
") PCDM_ReaderFilter;
		 PCDM_ReaderFilter(TCollection_AsciiString theEntryToRead);

		/****************** PCDM_ReaderFilter ******************/
		/**** md5 signature: 1b48284ae16fd29a0ea550b504663349 ****/
		%feature("compactdefaultargs") PCDM_ReaderFilter;
		%feature("autodoc", "Creates a filter to append the content of file to open to existing document.

Parameters
----------
theAppend: AppendMode

Returns
-------
None
") PCDM_ReaderFilter;
		 PCDM_ReaderFilter(AppendMode theAppend);

		/****************** AddPath ******************/
		/**** md5 signature: e26d150e60c619c720dd8dad7e857bbd ****/
		%feature("compactdefaultargs") AddPath;
		%feature("autodoc", "Adds sub-tree path (like '0:2').

Parameters
----------
theEntryToRead: str

Returns
-------
None
") AddPath;
		void AddPath(TCollection_AsciiString theEntryToRead);

		/****************** AddRead ******************/
		/**** md5 signature: d55bf2b468f6fe99832137308b5afb34 ****/
		%feature("compactdefaultargs") AddRead;
		%feature("autodoc", "Adds attribute to read by type. disables the skipped attributes added.

Parameters
----------
theRead: Standard_Type

Returns
-------
None
") AddRead;
		void AddRead(const opencascade::handle<Standard_Type> & theRead);

		/****************** AddRead ******************/
		/**** md5 signature: a04c52605884c67563792b4d56cfb04d ****/
		%feature("compactdefaultargs") AddRead;
		%feature("autodoc", "Adds attribute to read by type name. disables the skipped attributes added.

Parameters
----------
theRead: str

Returns
-------
None
") AddRead;
		void AddRead(TCollection_AsciiString theRead);

		/****************** AddSkipped ******************/
		/**** md5 signature: 17a3c13212ccf5121e7ea6f008a46a9e ****/
		%feature("compactdefaultargs") AddSkipped;
		%feature("autodoc", "Adds skipped attribute by type.

Parameters
----------
theSkipped: Standard_Type

Returns
-------
None
") AddSkipped;
		void AddSkipped(const opencascade::handle<Standard_Type> & theSkipped);

		/****************** AddSkipped ******************/
		/**** md5 signature: 1641b144b6c36dce12e568a2a0acb7f7 ****/
		%feature("compactdefaultargs") AddSkipped;
		%feature("autodoc", "Adds skipped attribute by type name.

Parameters
----------
theSkipped: str

Returns
-------
None
") AddSkipped;
		void AddSkipped(TCollection_AsciiString theSkipped);

		/****************** Clear ******************/
		/**** md5 signature: ae54be580b423a6eadbe062e0bdb44c2 ****/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "Makes filter pass all data.

Returns
-------
None
") Clear;
		void Clear();

		/****************** Down ******************/
		/**** md5 signature: 684b38c2ad7e6446dc5e63e3fe7acc0a ****/
		%feature("compactdefaultargs") Down;
		%feature("autodoc", "Iteration to the child with defined tag.

Parameters
----------
theTag: int

Returns
-------
None
") Down;
		virtual void Down(const int & theTag);

		/****************** IsAppendMode ******************/
		/**** md5 signature: c53202a73f18a553c82d098bdc9ca535 ****/
		%feature("compactdefaultargs") IsAppendMode;
		%feature("autodoc", "Returns true if appending to the document is performed.

Returns
-------
bool
") IsAppendMode;
		Standard_Boolean IsAppendMode();

		/****************** IsPartTree ******************/
		/**** md5 signature: 642fca9fea4b8f850c4c9c7fb083d1c3 ****/
		%feature("compactdefaultargs") IsPartTree;
		%feature("autodoc", "Returns true if only part of the document tree will be retrieved.

Returns
-------
bool
") IsPartTree;
		virtual Standard_Boolean IsPartTree();

		/****************** IsPassed ******************/
		/**** md5 signature: ff46ea18ae42f633977d14e6c1b34ba2 ****/
		%feature("compactdefaultargs") IsPassed;
		%feature("autodoc", "Returns true if attribute must be read.

Parameters
----------
theAttributeID: Standard_Type

Returns
-------
bool
") IsPassed;
		virtual Standard_Boolean IsPassed(const opencascade::handle<Standard_Type> & theAttributeID);

		/****************** IsPassed ******************/
		/**** md5 signature: 9e2e882b262a07e940f0bef16e372b54 ****/
		%feature("compactdefaultargs") IsPassed;
		%feature("autodoc", "Returns true if content of the label must be read.

Parameters
----------
theEntry: str

Returns
-------
bool
") IsPassed;
		virtual Standard_Boolean IsPassed(TCollection_AsciiString theEntry);

		/****************** IsPassed ******************/
		/**** md5 signature: 5e48514b31a5fa61d8a015c3e7729542 ****/
		%feature("compactdefaultargs") IsPassed;
		%feature("autodoc", "Returns true if content of the currently iterated label must be read.

Returns
-------
bool
") IsPassed;
		virtual Standard_Boolean IsPassed();

		/****************** IsPassedAttr ******************/
		/**** md5 signature: c87c4d1f2fdc991decf6199f8cd8a28e ****/
		%feature("compactdefaultargs") IsPassedAttr;
		%feature("autodoc", "Returns true if attribute must be read.

Parameters
----------
theAttributeType: str

Returns
-------
bool
") IsPassedAttr;
		virtual Standard_Boolean IsPassedAttr(TCollection_AsciiString theAttributeType);

		/****************** IsSubPassed ******************/
		/**** md5 signature: ba594a6a5c6a8d3f037af25ddb422741 ****/
		%feature("compactdefaultargs") IsSubPassed;
		%feature("autodoc", "Returns true if some sub-label of the given label is passed.

Parameters
----------
theEntry: str

Returns
-------
bool
") IsSubPassed;
		virtual Standard_Boolean IsSubPassed(TCollection_AsciiString theEntry);

		/****************** IsSubPassed ******************/
		/**** md5 signature: ac3b63e0f17ab0448083482de2136688 ****/
		%feature("compactdefaultargs") IsSubPassed;
		%feature("autodoc", "Returns true if some sub-label of the currently iterated label is passed.

Returns
-------
bool
") IsSubPassed;
		virtual Standard_Boolean IsSubPassed();

		/****************** Mode ******************/
		/**** md5 signature: b965c8583016b065ce8a0e74db3f348a ****/
		%feature("compactdefaultargs") Mode;
		%feature("autodoc", "Returns the append mode.

Returns
-------
PCDM_ReaderFilter::AppendMode
") Mode;
		PCDM_ReaderFilter::AppendMode Mode();

		/****************** StartIteration ******************/
		/**** md5 signature: e37a7287631a4e3700eac402b9e23054 ****/
		%feature("compactdefaultargs") StartIteration;
		%feature("autodoc", "Starts the tree iterator. it is used for fast searching of passed labels if the whole tree of labels is parsed. so, on each iteration step the methods up and down must be called after the iteration start.

Returns
-------
None
") StartIteration;
		virtual void StartIteration();

		/****************** Up ******************/
		/**** md5 signature: bd266ecf07c8b3333e4c76605f7dd842 ****/
		%feature("compactdefaultargs") Up;
		%feature("autodoc", "Iteration to the child label.

Returns
-------
None
") Up;
		virtual void Up();

};


%make_alias(PCDM_ReaderFilter)

%extend PCDM_ReaderFilter {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************
* class PCDM_Reference *
***********************/
class PCDM_Reference {
	public:
		/****************** PCDM_Reference ******************/
		/**** md5 signature: fcb919a21fac80885f7167c85ef93229 ****/
		%feature("compactdefaultargs") PCDM_Reference;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") PCDM_Reference;
		 PCDM_Reference();

		/****************** PCDM_Reference ******************/
		/**** md5 signature: a461ba6e086806da3bb8a64471ca9927 ****/
		%feature("compactdefaultargs") PCDM_Reference;
		%feature("autodoc", "No available documentation.

Parameters
----------
aReferenceIdentifier: int
aFileName: str
aDocumentVersion: int

Returns
-------
None
") PCDM_Reference;
		 PCDM_Reference(const Standard_Integer aReferenceIdentifier, TCollection_ExtendedString aFileName, const Standard_Integer aDocumentVersion);

		/****************** DocumentVersion ******************/
		/**** md5 signature: bf19019d65def7107fbf722b45605af2 ****/
		%feature("compactdefaultargs") DocumentVersion;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") DocumentVersion;
		Standard_Integer DocumentVersion();

		/****************** FileName ******************/
		/**** md5 signature: 55453540d5ecaade8ddcde5846f5b88f ****/
		%feature("compactdefaultargs") FileName;
		%feature("autodoc", "No available documentation.

Returns
-------
TCollection_ExtendedString
") FileName;
		TCollection_ExtendedString FileName();

		/****************** ReferenceIdentifier ******************/
		/**** md5 signature: 0b6f1d6aeee20151c55bab21628d6c27 ****/
		%feature("compactdefaultargs") ReferenceIdentifier;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") ReferenceIdentifier;
		Standard_Integer ReferenceIdentifier();

};


%extend PCDM_Reference {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************
* class PCDM_ReferenceIterator *
*******************************/
class PCDM_ReferenceIterator : public Standard_Transient {
	public:
		/****************** PCDM_ReferenceIterator ******************/
		/**** md5 signature: bc2c61f33a2535f4140a63d8a42bf573 ****/
		%feature("compactdefaultargs") PCDM_ReferenceIterator;
		%feature("autodoc", "Warning! the constructor does not initialization.

Parameters
----------
theMessageDriver: Message_Messenger

Returns
-------
None
") PCDM_ReferenceIterator;
		 PCDM_ReferenceIterator(const opencascade::handle<Message_Messenger> & theMessageDriver);

		/****************** Init ******************/
		/**** md5 signature: e27dcfd0fb2609919194e4e256a89398 ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Parameters
----------
aMetaData: CDM_MetaData

Returns
-------
None
") Init;
		virtual void Init(const opencascade::handle<CDM_MetaData> & aMetaData);

		/****************** LoadReferences ******************/
		/**** md5 signature: 1c28e34b7e3d8ffab22557e150b82442 ****/
		%feature("compactdefaultargs") LoadReferences;
		%feature("autodoc", "No available documentation.

Parameters
----------
aDocument: CDM_Document
aMetaData: CDM_MetaData
anApplication: CDM_Application
UseStorageConfiguration: bool

Returns
-------
None
") LoadReferences;
		void LoadReferences(const opencascade::handle<CDM_Document> & aDocument, const opencascade::handle<CDM_MetaData> & aMetaData, const opencascade::handle<CDM_Application> & anApplication, const Standard_Boolean UseStorageConfiguration);

};


%make_alias(PCDM_ReferenceIterator)

%extend PCDM_ReferenceIterator {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************
* class PCDM_Writer *
********************/
%nodefaultctor PCDM_Writer;
class PCDM_Writer : public Standard_Transient {
	public:
		/****************** Write ******************/
		/**** md5 signature: 129162c4da19577c25e00185debd1e17 ****/
		%feature("compactdefaultargs") Write;
		%feature("autodoc", "No available documentation.

Parameters
----------
aDocument: CDM_Document
aFileName: str
theRange: Message_ProgressRange,optional
	default value is Message_ProgressRange()

Returns
-------
None
") Write;
		virtual void Write(const opencascade::handle<CDM_Document> & aDocument, TCollection_ExtendedString aFileName, const Message_ProgressRange & theRange = Message_ProgressRange());

};


%make_alias(PCDM_Writer)

%extend PCDM_Writer {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************
* class PCDM_ReadWriter_1 *
**************************/
class PCDM_ReadWriter_1 : public PCDM_ReadWriter {
	public:
		/****************** PCDM_ReadWriter_1 ******************/
		/**** md5 signature: 3712b2a104424c2ca788af2565ee13ef ****/
		%feature("compactdefaultargs") PCDM_ReadWriter_1;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") PCDM_ReadWriter_1;
		 PCDM_ReadWriter_1();

		/****************** ReadDocumentVersion ******************/
		/**** md5 signature: 6fa0d97ebadaf88d4c19a79af48272e8 ****/
		%feature("compactdefaultargs") ReadDocumentVersion;
		%feature("autodoc", "No available documentation.

Parameters
----------
aFileName: str
theMsgDriver: Message_Messenger

Returns
-------
int
") ReadDocumentVersion;
		Standard_Integer ReadDocumentVersion(TCollection_ExtendedString aFileName, const opencascade::handle<Message_Messenger> & theMsgDriver);

		/****************** ReadExtensions ******************/
		/**** md5 signature: e79724363b9b64d4ee07dc721eaab89c ****/
		%feature("compactdefaultargs") ReadExtensions;
		%feature("autodoc", "No available documentation.

Parameters
----------
aFileName: str
theExtensions: TColStd_SequenceOfExtendedString
theMsgDriver: Message_Messenger

Returns
-------
None
") ReadExtensions;
		void ReadExtensions(TCollection_ExtendedString aFileName, TColStd_SequenceOfExtendedString & theExtensions, const opencascade::handle<Message_Messenger> & theMsgDriver);

		/****************** ReadReferenceCounter ******************/
		/**** md5 signature: 2a9d538fbc9a34aae5162f188bc0dec8 ****/
		%feature("compactdefaultargs") ReadReferenceCounter;
		%feature("autodoc", "No available documentation.

Parameters
----------
aFileName: str
theMsgDriver: Message_Messenger

Returns
-------
int
") ReadReferenceCounter;
		Standard_Integer ReadReferenceCounter(TCollection_ExtendedString aFileName, const opencascade::handle<Message_Messenger> & theMsgDriver);

		/****************** ReadReferences ******************/
		/**** md5 signature: c890e9c775ee329a9c416a624708d4fb ****/
		%feature("compactdefaultargs") ReadReferences;
		%feature("autodoc", "No available documentation.

Parameters
----------
aFileName: str
theReferences: PCDM_SequenceOfReference
theMsgDriver: Message_Messenger

Returns
-------
None
") ReadReferences;
		void ReadReferences(TCollection_ExtendedString aFileName, PCDM_SequenceOfReference & theReferences, const opencascade::handle<Message_Messenger> & theMsgDriver);

		/****************** Version ******************/
		/**** md5 signature: 0ac00c5dd4c467cbc7e9c3010b5092a6 ****/
		%feature("compactdefaultargs") Version;
		%feature("autodoc", "Returns pcdm_readwriter_1.

Returns
-------
TCollection_AsciiString
") Version;
		TCollection_AsciiString Version();

		/****************** WriteExtensions ******************/
		/**** md5 signature: 85b751cddf0f4ac1b87e8791d6807b9c ****/
		%feature("compactdefaultargs") WriteExtensions;
		%feature("autodoc", "No available documentation.

Parameters
----------
aData: Storage_Data
aDocument: CDM_Document

Returns
-------
None
") WriteExtensions;
		void WriteExtensions(const opencascade::handle<Storage_Data> & aData, const opencascade::handle<CDM_Document> & aDocument);

		/****************** WriteReferenceCounter ******************/
		/**** md5 signature: f007ff2a88f7afd58caed0ad641afa67 ****/
		%feature("compactdefaultargs") WriteReferenceCounter;
		%feature("autodoc", "No available documentation.

Parameters
----------
aData: Storage_Data
aDocument: CDM_Document

Returns
-------
None
") WriteReferenceCounter;
		void WriteReferenceCounter(const opencascade::handle<Storage_Data> & aData, const opencascade::handle<CDM_Document> & aDocument);

		/****************** WriteReferences ******************/
		/**** md5 signature: 60084cf94d2b5578acc0f69aeb515c97 ****/
		%feature("compactdefaultargs") WriteReferences;
		%feature("autodoc", "No available documentation.

Parameters
----------
aData: Storage_Data
aDocument: CDM_Document
theReferencerFileName: str

Returns
-------
None
") WriteReferences;
		void WriteReferences(const opencascade::handle<Storage_Data> & aData, const opencascade::handle<CDM_Document> & aDocument, TCollection_ExtendedString theReferencerFileName);

		/****************** WriteVersion ******************/
		/**** md5 signature: 1237b39223ebf6a0c84b2cfc30675d46 ****/
		%feature("compactdefaultargs") WriteVersion;
		%feature("autodoc", "No available documentation.

Parameters
----------
aData: Storage_Data
aDocument: CDM_Document

Returns
-------
None
") WriteVersion;
		void WriteVersion(const opencascade::handle<Storage_Data> & aData, const opencascade::handle<CDM_Document> & aDocument);

};


%make_alias(PCDM_ReadWriter_1)

%extend PCDM_ReadWriter_1 {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************
* class PCDM_RetrievalDriver *
*****************************/
%nodefaultctor PCDM_RetrievalDriver;
class PCDM_RetrievalDriver : public PCDM_Reader {
	public:
		/****************** DocumentVersion ******************/
		/**** md5 signature: f11c15e892e5505b77706d6fd7a1801f ****/
		%feature("compactdefaultargs") DocumentVersion;
		%feature("autodoc", "No available documentation.

Parameters
----------
theFileName: str
theMsgDriver: Message_Messenger

Returns
-------
int
") DocumentVersion;
		static Standard_Integer DocumentVersion(TCollection_ExtendedString theFileName, const opencascade::handle<Message_Messenger> & theMsgDriver);

		/****************** GetFormat ******************/
		/**** md5 signature: fffd3a693cb020e12e5658bc526df844 ****/
		%feature("compactdefaultargs") GetFormat;
		%feature("autodoc", "No available documentation.

Returns
-------
TCollection_ExtendedString
") GetFormat;
		TCollection_ExtendedString GetFormat();

		/****************** ReferenceCounter ******************/
		/**** md5 signature: 088a295a6318f05f8f6c481d75ee6b7d ****/
		%feature("compactdefaultargs") ReferenceCounter;
		%feature("autodoc", "No available documentation.

Parameters
----------
theFileName: str
theMsgDriver: Message_Messenger

Returns
-------
int
") ReferenceCounter;
		static Standard_Integer ReferenceCounter(TCollection_ExtendedString theFileName, const opencascade::handle<Message_Messenger> & theMsgDriver);

		/****************** SetFormat ******************/
		/**** md5 signature: 0a047ddc473d166aa027611e6069ffc3 ****/
		%feature("compactdefaultargs") SetFormat;
		%feature("autodoc", "No available documentation.

Parameters
----------
aformat: str

Returns
-------
None
") SetFormat;
		void SetFormat(TCollection_ExtendedString aformat);

};


%make_alias(PCDM_RetrievalDriver)

%extend PCDM_RetrievalDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************
* class PCDM_StorageDriver *
***************************/
class PCDM_StorageDriver : public PCDM_Writer {
	public:
		/****************** GetFormat ******************/
		/**** md5 signature: fffd3a693cb020e12e5658bc526df844 ****/
		%feature("compactdefaultargs") GetFormat;
		%feature("autodoc", "No available documentation.

Returns
-------
TCollection_ExtendedString
") GetFormat;
		TCollection_ExtendedString GetFormat();

		/****************** GetStoreStatus ******************/
		/**** md5 signature: aa33a6ff6e8cb07ab8472ff009fae2e1 ****/
		%feature("compactdefaultargs") GetStoreStatus;
		%feature("autodoc", "No available documentation.

Returns
-------
PCDM_StoreStatus
") GetStoreStatus;
		PCDM_StoreStatus GetStoreStatus();

		/****************** IsError ******************/
		/**** md5 signature: c52b85ee17e423925f2cd97bf6879614 ****/
		%feature("compactdefaultargs") IsError;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsError;
		Standard_Boolean IsError();

		/****************** Make ******************/
		/**** md5 signature: 39cf823dff5118394c88e4f36d9f1903 ****/
		%feature("compactdefaultargs") Make;
		%feature("autodoc", "Raises notimplemented.

Parameters
----------
aDocument: CDM_Document

Returns
-------
opencascade::handle<PCDM_Document>
") Make;
		virtual opencascade::handle<PCDM_Document> Make(const opencascade::handle<CDM_Document> & aDocument);

		/****************** Make ******************/
		/**** md5 signature: 41f831e6d4c5111bd8e3059da3abdca8 ****/
		%feature("compactdefaultargs") Make;
		%feature("autodoc", "By default, puts in the sequence the document returns by the previous make method.

Parameters
----------
aDocument: CDM_Document
Documents: PCDM_SequenceOfDocument

Returns
-------
None
") Make;
		virtual void Make(const opencascade::handle<CDM_Document> & aDocument, PCDM_SequenceOfDocument & Documents);

		/****************** SetFormat ******************/
		/**** md5 signature: 0a047ddc473d166aa027611e6069ffc3 ****/
		%feature("compactdefaultargs") SetFormat;
		%feature("autodoc", "No available documentation.

Parameters
----------
aformat: str

Returns
-------
None
") SetFormat;
		void SetFormat(TCollection_ExtendedString aformat);

		/****************** SetIsError ******************/
		/**** md5 signature: 62f1d1b8739fce144b7c044eeba2371b ****/
		%feature("compactdefaultargs") SetIsError;
		%feature("autodoc", "No available documentation.

Parameters
----------
theIsError: bool

Returns
-------
None
") SetIsError;
		void SetIsError(const Standard_Boolean theIsError);

		/****************** SetStoreStatus ******************/
		/**** md5 signature: 93e09ef2094b69fe064748e4a8b36ded ****/
		%feature("compactdefaultargs") SetStoreStatus;
		%feature("autodoc", "No available documentation.

Parameters
----------
theStoreStatus: PCDM_StoreStatus

Returns
-------
None
") SetStoreStatus;
		void SetStoreStatus(const PCDM_StoreStatus theStoreStatus);

		/****************** Write ******************/
		/**** md5 signature: 530bf2b64cafb9602dd07d7293c739c7 ****/
		%feature("compactdefaultargs") Write;
		%feature("autodoc", "Warning! raises drivererror if an error occurs during inside the make method. stores the content of the document into a new file. //! by default write will use make method to build a persistent document and the schema method to write the persistent document.

Parameters
----------
aDocument: CDM_Document
aFileName: str
theRange: Message_ProgressRange,optional
	default value is Message_ProgressRange()

Returns
-------
None
") Write;
		virtual void Write(const opencascade::handle<CDM_Document> & aDocument, TCollection_ExtendedString aFileName, const Message_ProgressRange & theRange = Message_ProgressRange());

};


%make_alias(PCDM_StorageDriver)

%extend PCDM_StorageDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/* python proxy for excluded classes */
%pythoncode {
@classnotwrapped
class PCDM_DOMHeaderParser:
	pass

@classnotwrapped
class PCDM_Document:
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
def pcdm_FileDriverType(*args):
	return pcdm.FileDriverType(*args)

@deprecated
def PCDM_ReadWriter_FileFormat(*args):
	return PCDM_ReadWriter.FileFormat(*args)

@deprecated
def PCDM_ReadWriter_Open(*args):
	return PCDM_ReadWriter.Open(*args)

@deprecated
def PCDM_ReadWriter_Reader(*args):
	return PCDM_ReadWriter.Reader(*args)

@deprecated
def PCDM_ReadWriter_WriteFileFormat(*args):
	return PCDM_ReadWriter.WriteFileFormat(*args)

@deprecated
def PCDM_ReadWriter_Writer(*args):
	return PCDM_ReadWriter.Writer(*args)

@deprecated
def PCDM_RetrievalDriver_DocumentVersion(*args):
	return PCDM_RetrievalDriver.DocumentVersion(*args)

@deprecated
def PCDM_RetrievalDriver_ReferenceCounter(*args):
	return PCDM_RetrievalDriver.ReferenceCounter(*args)

}
