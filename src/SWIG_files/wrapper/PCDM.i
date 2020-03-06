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
%define PCDMDOCSTRING
"PCDM module, see official documentation at
https://www.opencascade.com/doc/occt-7.4.0/refman/html/package_pcdm.html"
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
};

/* end public enums declaration */

/* python proy classes for enums */
%pythoncode {

class PCDM_StoreStatus:
	PCDM_SS_OK = 0
	PCDM_SS_DriverFailure = 1
	PCDM_SS_WriteFailure = 2
	PCDM_SS_Failure = 3
	PCDM_SS_Doc_IsNull = 4
	PCDM_SS_No_Obj = 5
	PCDM_SS_Info_Section_Error = 6

class PCDM_TypeOfFileDriver:
	PCDM_TOFD_File = 0
	PCDM_TOFD_CmpFile = 1
	PCDM_TOFD_XmlFile = 2
	PCDM_TOFD_Unknown = 3

class PCDM_ReaderStatus:
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
};
/* end python proxy for enums */

/* handles */
%wrap_handle(PCDM_ReadWriter)
%wrap_handle(PCDM_Reader)
%wrap_handle(PCDM_ReferenceIterator)
%wrap_handle(PCDM_Writer)
%wrap_handle(PCDM_ReadWriter_1)
%wrap_handle(PCDM_RetrievalDriver)
%wrap_handle(PCDM_StorageDriver)
/* end handles declaration */

/* templates */
%template(PCDM_SequenceOfDocument) NCollection_Sequence<opencascade::handle<PCDM_Document>>;
%template(PCDM_SequenceOfReference) NCollection_Sequence<PCDM_Reference>;
/* end templates declaration */

/* typedefs */
typedef Storage_BaseDriver * PCDM_BaseDriverPointer;
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
		%feature("compactdefaultargs") FileDriverType;
		%feature("autodoc", "No available documentation.

Parameters
----------
aFileName: TCollection_AsciiString
aBaseDriver: PCDM_BaseDriverPointer

Returns
-------
PCDM_TypeOfFileDriver
") FileDriverType;
		static PCDM_TypeOfFileDriver FileDriverType(const TCollection_AsciiString & aFileName, PCDM_BaseDriverPointer & aBaseDriver);

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
		%feature("compactdefaultargs") FileFormat;
		%feature("autodoc", "Tries to get a format in the file. returns an empty string if the file could not be read or does not have a fileformat information.

Parameters
----------
aFileName: TCollection_ExtendedString

Returns
-------
TCollection_ExtendedString
") FileFormat;
		static TCollection_ExtendedString FileFormat(const TCollection_ExtendedString & aFileName);

		/****************** Open ******************/
		%feature("compactdefaultargs") Open;
		%feature("autodoc", "No available documentation.

Parameters
----------
aDriver: Storage_BaseDriver
aFileName: TCollection_ExtendedString
anOpenMode: Storage_OpenMode

Returns
-------
None
") Open;
		static void Open(Storage_BaseDriver & aDriver, const TCollection_ExtendedString & aFileName, const Storage_OpenMode anOpenMode);

		/****************** ReadDocumentVersion ******************/
		%feature("compactdefaultargs") ReadDocumentVersion;
		%feature("autodoc", "No available documentation.

Parameters
----------
aFileName: TCollection_ExtendedString
theMsgDriver: Message_Messenger

Returns
-------
int
") ReadDocumentVersion;
		virtual Standard_Integer ReadDocumentVersion(const TCollection_ExtendedString & aFileName, const opencascade::handle<Message_Messenger> & theMsgDriver);

		/****************** ReadExtensions ******************/
		%feature("compactdefaultargs") ReadExtensions;
		%feature("autodoc", "No available documentation.

Parameters
----------
aFileName: TCollection_ExtendedString
theExtensions: TColStd_SequenceOfExtendedString
theMsgDriver: Message_Messenger

Returns
-------
None
") ReadExtensions;
		virtual void ReadExtensions(const TCollection_ExtendedString & aFileName, TColStd_SequenceOfExtendedString & theExtensions, const opencascade::handle<Message_Messenger> & theMsgDriver);

		/****************** ReadReferenceCounter ******************/
		%feature("compactdefaultargs") ReadReferenceCounter;
		%feature("autodoc", "No available documentation.

Parameters
----------
theFileName: TCollection_ExtendedString
theMsgDriver: Message_Messenger

Returns
-------
int
") ReadReferenceCounter;
		virtual Standard_Integer ReadReferenceCounter(const TCollection_ExtendedString & theFileName, const opencascade::handle<Message_Messenger> & theMsgDriver);

		/****************** ReadReferences ******************/
		%feature("compactdefaultargs") ReadReferences;
		%feature("autodoc", "No available documentation.

Parameters
----------
aFileName: TCollection_ExtendedString
theReferences: PCDM_SequenceOfReference
theMsgDriver: Message_Messenger

Returns
-------
None
") ReadReferences;
		virtual void ReadReferences(const TCollection_ExtendedString & aFileName, PCDM_SequenceOfReference & theReferences, const opencascade::handle<Message_Messenger> & theMsgDriver);

		/****************** Reader ******************/
		%feature("compactdefaultargs") Reader;
		%feature("autodoc", "Returns the convenient reader for a file.

Parameters
----------
aFileName: TCollection_ExtendedString

Returns
-------
opencascade::handle<PCDM_ReadWriter>
") Reader;
		static opencascade::handle<PCDM_ReadWriter> Reader(const TCollection_ExtendedString & aFileName);

		/****************** Version ******************/
		%feature("compactdefaultargs") Version;
		%feature("autodoc", "Returns pcdm_readwriter_1.

Returns
-------
TCollection_AsciiString
") Version;
		virtual TCollection_AsciiString Version();

		/****************** WriteExtensions ******************/
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
		%feature("compactdefaultargs") WriteReferences;
		%feature("autodoc", "No available documentation.

Parameters
----------
aData: Storage_Data
aDocument: CDM_Document
theReferencerFileName: TCollection_ExtendedString

Returns
-------
None
") WriteReferences;
		virtual void WriteReferences(const opencascade::handle<Storage_Data> & aData, const opencascade::handle<CDM_Document> & aDocument, const TCollection_ExtendedString & theReferencerFileName);

		/****************** WriteVersion ******************/
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
		/****************** CreateDocument ******************/
		%feature("compactdefaultargs") CreateDocument;
		%feature("autodoc", "This method is called by the framework before the read method.

Returns
-------
opencascade::handle<CDM_Document>
") CreateDocument;
		virtual opencascade::handle<CDM_Document> CreateDocument();

		/****************** GetStatus ******************/
		%feature("compactdefaultargs") GetStatus;
		%feature("autodoc", "No available documentation.

Returns
-------
PCDM_ReaderStatus
") GetStatus;
		PCDM_ReaderStatus GetStatus();

		/****************** Read ******************/
		%feature("compactdefaultargs") Read;
		%feature("autodoc", "Retrieves the content of the file into a new document.

Parameters
----------
aFileName: TCollection_ExtendedString
aNewDocument: CDM_Document
anApplication: CDM_Application

Returns
-------
None
") Read;
		virtual void Read(const TCollection_ExtendedString & aFileName, const opencascade::handle<CDM_Document> & aNewDocument, const opencascade::handle<CDM_Application> & anApplication);

};


%make_alias(PCDM_Reader)

%extend PCDM_Reader {
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
		%feature("compactdefaultargs") PCDM_Reference;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") PCDM_Reference;
		 PCDM_Reference();

		/****************** PCDM_Reference ******************/
		%feature("compactdefaultargs") PCDM_Reference;
		%feature("autodoc", "No available documentation.

Parameters
----------
aReferenceIdentifier: int
aFileName: TCollection_ExtendedString
aDocumentVersion: int

Returns
-------
None
") PCDM_Reference;
		 PCDM_Reference(const Standard_Integer aReferenceIdentifier, const TCollection_ExtendedString & aFileName, const Standard_Integer aDocumentVersion);

		/****************** DocumentVersion ******************/
		%feature("compactdefaultargs") DocumentVersion;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") DocumentVersion;
		Standard_Integer DocumentVersion();

		/****************** FileName ******************/
		%feature("compactdefaultargs") FileName;
		%feature("autodoc", "No available documentation.

Returns
-------
TCollection_ExtendedString
") FileName;
		TCollection_ExtendedString FileName();

		/****************** ReferenceIdentifier ******************/
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
		%feature("compactdefaultargs") Write;
		%feature("autodoc", "No available documentation.

Parameters
----------
aDocument: CDM_Document
aFileName: TCollection_ExtendedString

Returns
-------
None
") Write;
		virtual void Write(const opencascade::handle<CDM_Document> & aDocument, const TCollection_ExtendedString & aFileName);

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
		%feature("compactdefaultargs") PCDM_ReadWriter_1;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") PCDM_ReadWriter_1;
		 PCDM_ReadWriter_1();

		/****************** ReadDocumentVersion ******************/
		%feature("compactdefaultargs") ReadDocumentVersion;
		%feature("autodoc", "No available documentation.

Parameters
----------
aFileName: TCollection_ExtendedString
theMsgDriver: Message_Messenger

Returns
-------
int
") ReadDocumentVersion;
		Standard_Integer ReadDocumentVersion(const TCollection_ExtendedString & aFileName, const opencascade::handle<Message_Messenger> & theMsgDriver);

		/****************** ReadExtensions ******************/
		%feature("compactdefaultargs") ReadExtensions;
		%feature("autodoc", "No available documentation.

Parameters
----------
aFileName: TCollection_ExtendedString
theExtensions: TColStd_SequenceOfExtendedString
theMsgDriver: Message_Messenger

Returns
-------
None
") ReadExtensions;
		void ReadExtensions(const TCollection_ExtendedString & aFileName, TColStd_SequenceOfExtendedString & theExtensions, const opencascade::handle<Message_Messenger> & theMsgDriver);

		/****************** ReadReferenceCounter ******************/
		%feature("compactdefaultargs") ReadReferenceCounter;
		%feature("autodoc", "No available documentation.

Parameters
----------
aFileName: TCollection_ExtendedString
theMsgDriver: Message_Messenger

Returns
-------
int
") ReadReferenceCounter;
		Standard_Integer ReadReferenceCounter(const TCollection_ExtendedString & aFileName, const opencascade::handle<Message_Messenger> & theMsgDriver);

		/****************** ReadReferences ******************/
		%feature("compactdefaultargs") ReadReferences;
		%feature("autodoc", "No available documentation.

Parameters
----------
aFileName: TCollection_ExtendedString
theReferences: PCDM_SequenceOfReference
theMsgDriver: Message_Messenger

Returns
-------
None
") ReadReferences;
		void ReadReferences(const TCollection_ExtendedString & aFileName, PCDM_SequenceOfReference & theReferences, const opencascade::handle<Message_Messenger> & theMsgDriver);

		/****************** Version ******************/
		%feature("compactdefaultargs") Version;
		%feature("autodoc", "Returns pcdm_readwriter_1.

Returns
-------
TCollection_AsciiString
") Version;
		TCollection_AsciiString Version();

		/****************** WriteExtensions ******************/
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
		%feature("compactdefaultargs") WriteReferences;
		%feature("autodoc", "No available documentation.

Parameters
----------
aData: Storage_Data
aDocument: CDM_Document
theReferencerFileName: TCollection_ExtendedString

Returns
-------
None
") WriteReferences;
		void WriteReferences(const opencascade::handle<Storage_Data> & aData, const opencascade::handle<CDM_Document> & aDocument, const TCollection_ExtendedString & theReferencerFileName);

		/****************** WriteVersion ******************/
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
		%feature("compactdefaultargs") DocumentVersion;
		%feature("autodoc", "No available documentation.

Parameters
----------
theFileName: TCollection_ExtendedString
theMsgDriver: Message_Messenger

Returns
-------
int
") DocumentVersion;
		static Standard_Integer DocumentVersion(const TCollection_ExtendedString & theFileName, const opencascade::handle<Message_Messenger> & theMsgDriver);

		/****************** GetFormat ******************/
		%feature("compactdefaultargs") GetFormat;
		%feature("autodoc", "No available documentation.

Returns
-------
TCollection_ExtendedString
") GetFormat;
		TCollection_ExtendedString GetFormat();

		/****************** ReferenceCounter ******************/
		%feature("compactdefaultargs") ReferenceCounter;
		%feature("autodoc", "No available documentation.

Parameters
----------
theFileName: TCollection_ExtendedString
theMsgDriver: Message_Messenger

Returns
-------
int
") ReferenceCounter;
		static Standard_Integer ReferenceCounter(const TCollection_ExtendedString & theFileName, const opencascade::handle<Message_Messenger> & theMsgDriver);

		/****************** SetFormat ******************/
		%feature("compactdefaultargs") SetFormat;
		%feature("autodoc", "No available documentation.

Parameters
----------
aformat: TCollection_ExtendedString

Returns
-------
None
") SetFormat;
		void SetFormat(const TCollection_ExtendedString & aformat);

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
		%feature("compactdefaultargs") GetFormat;
		%feature("autodoc", "No available documentation.

Returns
-------
TCollection_ExtendedString
") GetFormat;
		TCollection_ExtendedString GetFormat();

		/****************** GetStoreStatus ******************/
		%feature("compactdefaultargs") GetStoreStatus;
		%feature("autodoc", "No available documentation.

Returns
-------
PCDM_StoreStatus
") GetStoreStatus;
		PCDM_StoreStatus GetStoreStatus();

		/****************** IsError ******************/
		%feature("compactdefaultargs") IsError;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsError;
		Standard_Boolean IsError();

		/****************** Make ******************/
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
		%feature("compactdefaultargs") SetFormat;
		%feature("autodoc", "No available documentation.

Parameters
----------
aformat: TCollection_ExtendedString

Returns
-------
None
") SetFormat;
		void SetFormat(const TCollection_ExtendedString & aformat);

		/****************** SetIsError ******************/
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
		%feature("compactdefaultargs") Write;
		%feature("autodoc", "Warning! raises drivererror if an error occurs during inside the make method. stores the content of the document into a new file. //! by default write will use make method to build a persistent document and the schema method to write the persistent document.

Parameters
----------
aDocument: CDM_Document
aFileName: TCollection_ExtendedString

Returns
-------
None
") Write;
		virtual void Write(const opencascade::handle<CDM_Document> & aDocument, const TCollection_ExtendedString & aFileName);

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
