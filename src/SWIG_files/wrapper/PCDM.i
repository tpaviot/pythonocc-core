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
%template(PCDM_SequenceOfDocument) NCollection_Sequence <opencascade::handle <PCDM_Document>>;
%template(PCDM_SequenceOfReference) NCollection_Sequence <PCDM_Reference>;
/* end templates declaration */

/* typedefs */
typedef NCollection_Sequence <opencascade::handle <PCDM_Document>> PCDM_SequenceOfDocument;
typedef Storage_BaseDriver * PCDM_BaseDriverPointer;
typedef NCollection_Sequence <PCDM_Reference> PCDM_SequenceOfReference;
/* end typedefs declaration */

/*************
* class PCDM *
*************/
%rename(pcdm) PCDM;
class PCDM {
	public:
		/****************** FileDriverType ******************/
		%feature("compactdefaultargs") FileDriverType;
		%feature("autodoc", ":param aFileName:
	:type aFileName: TCollection_AsciiString
	:param aBaseDriver:
	:type aBaseDriver: PCDM_BaseDriverPointer
	:rtype: PCDM_TypeOfFileDriver") FileDriverType;
		static PCDM_TypeOfFileDriver FileDriverType (const TCollection_AsciiString & aFileName,PCDM_BaseDriverPointer & aBaseDriver);

		/****************** FileDriverType ******************/
		%feature("compactdefaultargs") FileDriverType;
		%feature("autodoc", ":param theIStream:
	:type theIStream: Standard_IStream
	:param theBaseDriver:
	:type theBaseDriver: PCDM_BaseDriverPointer
	:rtype: PCDM_TypeOfFileDriver") FileDriverType;
		static PCDM_TypeOfFileDriver FileDriverType (Standard_IStream & theIStream,PCDM_BaseDriverPointer & theBaseDriver);

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
		%feature("autodoc", "* tries to get a format in the file. returns an empty string if the file could not be read or does not have a FileFormat information.
	:param aFileName:
	:type aFileName: TCollection_ExtendedString
	:rtype: TCollection_ExtendedString") FileFormat;
		static TCollection_ExtendedString FileFormat (const TCollection_ExtendedString & aFileName);

		/****************** FileFormat ******************/
		%feature("compactdefaultargs") FileFormat;
		%feature("autodoc", "* tries to get a format from the stream. returns an empty string if the file could not be read or does not have a FileFormat information.
	:param theIStream:
	:type theIStream: Standard_IStream
	:param theData:
	:type theData: Storage_Data
	:rtype: TCollection_ExtendedString") FileFormat;
		static TCollection_ExtendedString FileFormat (Standard_IStream & theIStream,opencascade::handle<Storage_Data> & theData);

		/****************** Open ******************/
		%feature("compactdefaultargs") Open;
		%feature("autodoc", ":param aDriver:
	:type aDriver: Storage_BaseDriver
	:param aFileName:
	:type aFileName: TCollection_ExtendedString
	:param anOpenMode:
	:type anOpenMode: Storage_OpenMode
	:rtype: void") Open;
		static void Open (Storage_BaseDriver & aDriver,const TCollection_ExtendedString & aFileName,const Storage_OpenMode anOpenMode);

		/****************** ReadDocumentVersion ******************/
		%feature("compactdefaultargs") ReadDocumentVersion;
		%feature("autodoc", ":param aFileName:
	:type aFileName: TCollection_ExtendedString
	:param theMsgDriver:
	:type theMsgDriver: Message_Messenger
	:rtype: int") ReadDocumentVersion;
		virtual Standard_Integer ReadDocumentVersion (const TCollection_ExtendedString & aFileName,const opencascade::handle<Message_Messenger> & theMsgDriver);

		/****************** ReadExtensions ******************/
		%feature("compactdefaultargs") ReadExtensions;
		%feature("autodoc", ":param aFileName:
	:type aFileName: TCollection_ExtendedString
	:param theExtensions:
	:type theExtensions: TColStd_SequenceOfExtendedString
	:param theMsgDriver:
	:type theMsgDriver: Message_Messenger
	:rtype: void") ReadExtensions;
		virtual void ReadExtensions (const TCollection_ExtendedString & aFileName,TColStd_SequenceOfExtendedString & theExtensions,const opencascade::handle<Message_Messenger> & theMsgDriver);

		/****************** ReadReferenceCounter ******************/
		%feature("compactdefaultargs") ReadReferenceCounter;
		%feature("autodoc", ":param theFileName:
	:type theFileName: TCollection_ExtendedString
	:param theMsgDriver:
	:type theMsgDriver: Message_Messenger
	:rtype: int") ReadReferenceCounter;
		virtual Standard_Integer ReadReferenceCounter (const TCollection_ExtendedString & theFileName,const opencascade::handle<Message_Messenger> & theMsgDriver);

		/****************** ReadReferences ******************/
		%feature("compactdefaultargs") ReadReferences;
		%feature("autodoc", ":param aFileName:
	:type aFileName: TCollection_ExtendedString
	:param theReferences:
	:type theReferences: PCDM_SequenceOfReference
	:param theMsgDriver:
	:type theMsgDriver: Message_Messenger
	:rtype: void") ReadReferences;
		virtual void ReadReferences (const TCollection_ExtendedString & aFileName,PCDM_SequenceOfReference & theReferences,const opencascade::handle<Message_Messenger> & theMsgDriver);

		/****************** Reader ******************/
		%feature("compactdefaultargs") Reader;
		%feature("autodoc", "* returns the convenient Reader for a File.
	:param aFileName:
	:type aFileName: TCollection_ExtendedString
	:rtype: opencascade::handle<PCDM_ReadWriter>") Reader;
		static opencascade::handle<PCDM_ReadWriter> Reader (const TCollection_ExtendedString & aFileName);

		/****************** Version ******************/
		%feature("compactdefaultargs") Version;
		%feature("autodoc", "* returns PCDM_ReadWriter_1.
	:rtype: TCollection_AsciiString") Version;
		virtual TCollection_AsciiString Version ();

		/****************** WriteExtensions ******************/
		%feature("compactdefaultargs") WriteExtensions;
		%feature("autodoc", ":param aData:
	:type aData: Storage_Data
	:param aDocument:
	:type aDocument: CDM_Document
	:rtype: void") WriteExtensions;
		virtual void WriteExtensions (const opencascade::handle<Storage_Data> & aData,const opencascade::handle<CDM_Document> & aDocument);

		/****************** WriteFileFormat ******************/
		%feature("compactdefaultargs") WriteFileFormat;
		%feature("autodoc", ":param aData:
	:type aData: Storage_Data
	:param aDocument:
	:type aDocument: CDM_Document
	:rtype: void") WriteFileFormat;
		static void WriteFileFormat (const opencascade::handle<Storage_Data> & aData,const opencascade::handle<CDM_Document> & aDocument);

		/****************** WriteReferenceCounter ******************/
		%feature("compactdefaultargs") WriteReferenceCounter;
		%feature("autodoc", ":param aData:
	:type aData: Storage_Data
	:param aDocument:
	:type aDocument: CDM_Document
	:rtype: void") WriteReferenceCounter;
		virtual void WriteReferenceCounter (const opencascade::handle<Storage_Data> & aData,const opencascade::handle<CDM_Document> & aDocument);

		/****************** WriteReferences ******************/
		%feature("compactdefaultargs") WriteReferences;
		%feature("autodoc", ":param aData:
	:type aData: Storage_Data
	:param aDocument:
	:type aDocument: CDM_Document
	:param theReferencerFileName:
	:type theReferencerFileName: TCollection_ExtendedString
	:rtype: void") WriteReferences;
		virtual void WriteReferences (const opencascade::handle<Storage_Data> & aData,const opencascade::handle<CDM_Document> & aDocument,const TCollection_ExtendedString & theReferencerFileName);

		/****************** WriteVersion ******************/
		%feature("compactdefaultargs") WriteVersion;
		%feature("autodoc", ":param aData:
	:type aData: Storage_Data
	:param aDocument:
	:type aDocument: CDM_Document
	:rtype: void") WriteVersion;
		virtual void WriteVersion (const opencascade::handle<Storage_Data> & aData,const opencascade::handle<CDM_Document> & aDocument);

		/****************** Writer ******************/
		%feature("compactdefaultargs") Writer;
		%feature("autodoc", ":rtype: opencascade::handle<PCDM_ReadWriter>") Writer;
		static opencascade::handle<PCDM_ReadWriter> Writer ();

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
		%feature("autodoc", "* this method is called by the framework before the read method.
	:rtype: opencascade::handle<CDM_Document>") CreateDocument;
		virtual opencascade::handle<CDM_Document> CreateDocument ();

		/****************** GetStatus ******************/
		%feature("compactdefaultargs") GetStatus;
		%feature("autodoc", ":rtype: PCDM_ReaderStatus") GetStatus;
		PCDM_ReaderStatus GetStatus ();

		/****************** Read ******************/
		%feature("compactdefaultargs") Read;
		%feature("autodoc", "* retrieves the content of the file into a new Document.
	:param aFileName:
	:type aFileName: TCollection_ExtendedString
	:param aNewDocument:
	:type aNewDocument: CDM_Document
	:param anApplication:
	:type anApplication: CDM_Application
	:rtype: void") Read;
		virtual void Read (const TCollection_ExtendedString & aFileName,const opencascade::handle<CDM_Document> & aNewDocument,const opencascade::handle<CDM_Application> & anApplication);

		/****************** Read ******************/
		%feature("compactdefaultargs") Read;
		%feature("autodoc", ":param theIStream:
	:type theIStream: Standard_IStream
	:param theStorageData:
	:type theStorageData: Storage_Data
	:param theDoc:
	:type theDoc: CDM_Document
	:param theApplication:
	:type theApplication: CDM_Application
	:rtype: void") Read;
		virtual void Read (Standard_IStream & theIStream,const opencascade::handle<Storage_Data> & theStorageData,const opencascade::handle<CDM_Document> & theDoc,const opencascade::handle<CDM_Application> & theApplication);

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
		/****************** DocumentVersion ******************/
		%feature("compactdefaultargs") DocumentVersion;
		%feature("autodoc", ":rtype: int") DocumentVersion;
		Standard_Integer DocumentVersion ();

		/****************** FileName ******************/
		%feature("compactdefaultargs") FileName;
		%feature("autodoc", ":rtype: TCollection_ExtendedString") FileName;
		TCollection_ExtendedString FileName ();

		/****************** PCDM_Reference ******************/
		%feature("compactdefaultargs") PCDM_Reference;
		%feature("autodoc", ":rtype: None") PCDM_Reference;
		 PCDM_Reference ();

		/****************** PCDM_Reference ******************/
		%feature("compactdefaultargs") PCDM_Reference;
		%feature("autodoc", ":param aReferenceIdentifier:
	:type aReferenceIdentifier: int
	:param aFileName:
	:type aFileName: TCollection_ExtendedString
	:param aDocumentVersion:
	:type aDocumentVersion: int
	:rtype: None") PCDM_Reference;
		 PCDM_Reference (const Standard_Integer aReferenceIdentifier,const TCollection_ExtendedString & aFileName,const Standard_Integer aDocumentVersion);

		/****************** ReferenceIdentifier ******************/
		%feature("compactdefaultargs") ReferenceIdentifier;
		%feature("autodoc", ":rtype: int") ReferenceIdentifier;
		Standard_Integer ReferenceIdentifier ();

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
		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", ":param aMetaData:
	:type aMetaData: CDM_MetaData
	:rtype: void") Init;
		virtual void Init (const opencascade::handle<CDM_MetaData> & aMetaData);

		/****************** LoadReferences ******************/
		%feature("compactdefaultargs") LoadReferences;
		%feature("autodoc", ":param aDocument:
	:type aDocument: CDM_Document
	:param aMetaData:
	:type aMetaData: CDM_MetaData
	:param anApplication:
	:type anApplication: CDM_Application
	:param UseStorageConfiguration:
	:type UseStorageConfiguration: bool
	:rtype: None") LoadReferences;
		void LoadReferences (const opencascade::handle<CDM_Document> & aDocument,const opencascade::handle<CDM_MetaData> & aMetaData,const opencascade::handle<CDM_Application> & anApplication,const Standard_Boolean UseStorageConfiguration);

		/****************** PCDM_ReferenceIterator ******************/
		%feature("compactdefaultargs") PCDM_ReferenceIterator;
		%feature("autodoc", "* Warning! The constructor does not initialization.
	:param theMessageDriver:
	:type theMessageDriver: Message_Messenger
	:rtype: None") PCDM_ReferenceIterator;
		 PCDM_ReferenceIterator (const opencascade::handle<Message_Messenger> & theMessageDriver);

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
		%feature("autodoc", ":param aDocument:
	:type aDocument: CDM_Document
	:param aFileName:
	:type aFileName: TCollection_ExtendedString
	:rtype: void") Write;
		virtual void Write (const opencascade::handle<CDM_Document> & aDocument,const TCollection_ExtendedString & aFileName);

		/****************** Write ******************/
		%feature("compactdefaultargs") Write;
		%feature("autodoc", "* Write <theDocument> to theOStream
	:param theDocument:
	:type theDocument: CDM_Document
	:param theOStream:
	:type theOStream: Standard_OStream
	:rtype: void") Write;
		virtual void Write (const opencascade::handle<CDM_Document> & theDocument,Standard_OStream & theOStream);

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
		%feature("autodoc", ":rtype: None") PCDM_ReadWriter_1;
		 PCDM_ReadWriter_1 ();

		/****************** ReadDocumentVersion ******************/
		%feature("compactdefaultargs") ReadDocumentVersion;
		%feature("autodoc", ":param aFileName:
	:type aFileName: TCollection_ExtendedString
	:param theMsgDriver:
	:type theMsgDriver: Message_Messenger
	:rtype: int") ReadDocumentVersion;
		Standard_Integer ReadDocumentVersion (const TCollection_ExtendedString & aFileName,const opencascade::handle<Message_Messenger> & theMsgDriver);

		/****************** ReadExtensions ******************/
		%feature("compactdefaultargs") ReadExtensions;
		%feature("autodoc", ":param aFileName:
	:type aFileName: TCollection_ExtendedString
	:param theExtensions:
	:type theExtensions: TColStd_SequenceOfExtendedString
	:param theMsgDriver:
	:type theMsgDriver: Message_Messenger
	:rtype: None") ReadExtensions;
		void ReadExtensions (const TCollection_ExtendedString & aFileName,TColStd_SequenceOfExtendedString & theExtensions,const opencascade::handle<Message_Messenger> & theMsgDriver);

		/****************** ReadReferenceCounter ******************/
		%feature("compactdefaultargs") ReadReferenceCounter;
		%feature("autodoc", ":param aFileName:
	:type aFileName: TCollection_ExtendedString
	:param theMsgDriver:
	:type theMsgDriver: Message_Messenger
	:rtype: int") ReadReferenceCounter;
		Standard_Integer ReadReferenceCounter (const TCollection_ExtendedString & aFileName,const opencascade::handle<Message_Messenger> & theMsgDriver);

		/****************** ReadReferences ******************/
		%feature("compactdefaultargs") ReadReferences;
		%feature("autodoc", ":param aFileName:
	:type aFileName: TCollection_ExtendedString
	:param theReferences:
	:type theReferences: PCDM_SequenceOfReference
	:param theMsgDriver:
	:type theMsgDriver: Message_Messenger
	:rtype: None") ReadReferences;
		void ReadReferences (const TCollection_ExtendedString & aFileName,PCDM_SequenceOfReference & theReferences,const opencascade::handle<Message_Messenger> & theMsgDriver);

		/****************** Version ******************/
		%feature("compactdefaultargs") Version;
		%feature("autodoc", "* returns PCDM_ReadWriter_1.
	:rtype: TCollection_AsciiString") Version;
		TCollection_AsciiString Version ();

		/****************** WriteExtensions ******************/
		%feature("compactdefaultargs") WriteExtensions;
		%feature("autodoc", ":param aData:
	:type aData: Storage_Data
	:param aDocument:
	:type aDocument: CDM_Document
	:rtype: None") WriteExtensions;
		void WriteExtensions (const opencascade::handle<Storage_Data> & aData,const opencascade::handle<CDM_Document> & aDocument);

		/****************** WriteReferenceCounter ******************/
		%feature("compactdefaultargs") WriteReferenceCounter;
		%feature("autodoc", ":param aData:
	:type aData: Storage_Data
	:param aDocument:
	:type aDocument: CDM_Document
	:rtype: None") WriteReferenceCounter;
		void WriteReferenceCounter (const opencascade::handle<Storage_Data> & aData,const opencascade::handle<CDM_Document> & aDocument);

		/****************** WriteReferences ******************/
		%feature("compactdefaultargs") WriteReferences;
		%feature("autodoc", ":param aData:
	:type aData: Storage_Data
	:param aDocument:
	:type aDocument: CDM_Document
	:param theReferencerFileName:
	:type theReferencerFileName: TCollection_ExtendedString
	:rtype: None") WriteReferences;
		void WriteReferences (const opencascade::handle<Storage_Data> & aData,const opencascade::handle<CDM_Document> & aDocument,const TCollection_ExtendedString & theReferencerFileName);

		/****************** WriteVersion ******************/
		%feature("compactdefaultargs") WriteVersion;
		%feature("autodoc", ":param aData:
	:type aData: Storage_Data
	:param aDocument:
	:type aDocument: CDM_Document
	:rtype: None") WriteVersion;
		void WriteVersion (const opencascade::handle<Storage_Data> & aData,const opencascade::handle<CDM_Document> & aDocument);

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
		%feature("autodoc", ":param theFileName:
	:type theFileName: TCollection_ExtendedString
	:param theMsgDriver:
	:type theMsgDriver: Message_Messenger
	:rtype: int") DocumentVersion;
		static Standard_Integer DocumentVersion (const TCollection_ExtendedString & theFileName,const opencascade::handle<Message_Messenger> & theMsgDriver);

		/****************** GetFormat ******************/
		%feature("compactdefaultargs") GetFormat;
		%feature("autodoc", ":rtype: TCollection_ExtendedString") GetFormat;
		TCollection_ExtendedString GetFormat ();

		/****************** ReferenceCounter ******************/
		%feature("compactdefaultargs") ReferenceCounter;
		%feature("autodoc", ":param theFileName:
	:type theFileName: TCollection_ExtendedString
	:param theMsgDriver:
	:type theMsgDriver: Message_Messenger
	:rtype: int") ReferenceCounter;
		static Standard_Integer ReferenceCounter (const TCollection_ExtendedString & theFileName,const opencascade::handle<Message_Messenger> & theMsgDriver);

		/****************** SetFormat ******************/
		%feature("compactdefaultargs") SetFormat;
		%feature("autodoc", ":param aformat:
	:type aformat: TCollection_ExtendedString
	:rtype: None") SetFormat;
		void SetFormat (const TCollection_ExtendedString & aformat);

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
		%feature("autodoc", ":rtype: TCollection_ExtendedString") GetFormat;
		TCollection_ExtendedString GetFormat ();

		/****************** GetStoreStatus ******************/
		%feature("compactdefaultargs") GetStoreStatus;
		%feature("autodoc", ":rtype: PCDM_StoreStatus") GetStoreStatus;
		PCDM_StoreStatus GetStoreStatus ();

		/****************** IsError ******************/
		%feature("compactdefaultargs") IsError;
		%feature("autodoc", ":rtype: bool") IsError;
		Standard_Boolean IsError ();

		/****************** Make ******************/
		%feature("compactdefaultargs") Make;
		%feature("autodoc", "* raises NotImplemented.
	:param aDocument:
	:type aDocument: CDM_Document
	:rtype: opencascade::handle<PCDM_Document>") Make;
		virtual opencascade::handle<PCDM_Document> Make (const opencascade::handle<CDM_Document> & aDocument);

		/****************** Make ******************/
		%feature("compactdefaultargs") Make;
		%feature("autodoc", "* By default, puts in the Sequence the document returns by the previous Make method.
	:param aDocument:
	:type aDocument: CDM_Document
	:param Documents:
	:type Documents: PCDM_SequenceOfDocument
	:rtype: void") Make;
		virtual void Make (const opencascade::handle<CDM_Document> & aDocument,PCDM_SequenceOfDocument & Documents);

		/****************** SetFormat ******************/
		%feature("compactdefaultargs") SetFormat;
		%feature("autodoc", ":param aformat:
	:type aformat: TCollection_ExtendedString
	:rtype: None") SetFormat;
		void SetFormat (const TCollection_ExtendedString & aformat);

		/****************** SetIsError ******************/
		%feature("compactdefaultargs") SetIsError;
		%feature("autodoc", ":param theIsError:
	:type theIsError: bool
	:rtype: None") SetIsError;
		void SetIsError (const Standard_Boolean theIsError);

		/****************** SetStoreStatus ******************/
		%feature("compactdefaultargs") SetStoreStatus;
		%feature("autodoc", ":param theStoreStatus:
	:type theStoreStatus: PCDM_StoreStatus
	:rtype: None") SetStoreStatus;
		void SetStoreStatus (const PCDM_StoreStatus theStoreStatus);

		/****************** Write ******************/
		%feature("compactdefaultargs") Write;
		%feature("autodoc", "* Warning! raises DriverError if an error occurs during inside the Make method. stores the content of the Document into a new file. //! by default Write will use Make method to build a persistent document and the Schema method to write the persistent document.
	:param aDocument:
	:type aDocument: CDM_Document
	:param aFileName:
	:type aFileName: TCollection_ExtendedString
	:rtype: void") Write;
		virtual void Write (const opencascade::handle<CDM_Document> & aDocument,const TCollection_ExtendedString & aFileName);

		/****************** Write ******************/
		%feature("compactdefaultargs") Write;
		%feature("autodoc", "* Write <theDocument> to theOStream
	:param theDocument:
	:type theDocument: CDM_Document
	:param theOStream:
	:type theOStream: Standard_OStream
	:rtype: void") Write;
		virtual void Write (const opencascade::handle<CDM_Document> & theDocument,Standard_OStream & theOStream);

};


%make_alias(PCDM_StorageDriver)

%extend PCDM_StorageDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/* harray1 classes */
/* harray2 classes */
/* hsequence classes */
