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
%define PCDMDOCSTRING
""
%enddef
%module (package="OCC.Core", docstring=PCDMDOCSTRING) PCDM

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
%include ../common/OccHandle.i


%include PCDM_headers.i

/* typedefs */
typedef Storage_BaseDriver * PCDM_BaseDriverPointer;
/* end typedefs declaration */

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
	PCDM_TOFD_Unknown = 2,
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

%wrap_handle(PCDM_ReadWriter)
%wrap_handle(PCDM_Reader)
%wrap_handle(PCDM_ReferenceIterator)
%wrap_handle(PCDM_SequenceNodeOfSequenceOfDocument)
%wrap_handle(PCDM_SequenceNodeOfSequenceOfReference)
%wrap_handle(PCDM_Writer)
%wrap_handle(PCDM_ReadWriter_1)
%wrap_handle(PCDM_RetrievalDriver)
%wrap_handle(PCDM_StorageDriver)

%rename(pcdm) PCDM;
class PCDM {
	public:
		%feature("compactdefaultargs") FindStorageDriver;
		%feature("autodoc", "	:param aDocument:
	:type aDocument: Handle_CDM_Document &
	:rtype: bool
") FindStorageDriver;
		static Standard_Boolean FindStorageDriver (const Handle_CDM_Document & aDocument);
		%feature("compactdefaultargs") StorageDriver;
		%feature("autodoc", "	* gets in the EuclidDesktop resource the plugin identifier of the driver plugs the driver.

	:param aDocument:
	:type aDocument: Handle_CDM_Document &
	:rtype: Handle_PCDM_StorageDriver
") StorageDriver;
		static Handle_PCDM_StorageDriver StorageDriver (const Handle_CDM_Document & aDocument);
		%feature("compactdefaultargs") Schema;
		%feature("autodoc", "	* returns a schema to be used during a Store or Retrieve operation. Schema will plug the schema defined by the SchemaName method.

	:param aSchemaName:
	:type aSchemaName: TCollection_ExtendedString &
	:param anApplication:
	:type anApplication: Handle_CDM_Application &
	:rtype: Handle_Storage_Schema
") Schema;
		static Handle_Storage_Schema Schema (const TCollection_ExtendedString & aSchemaName,const Handle_CDM_Application & anApplication);
};


%extend PCDM {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor PCDM_Document;
class PCDM_Document : public Standard_Persistent {
	public:
		%feature("compactdefaultargs") PCDM_Document;
		%feature("autodoc", "	:param a:
	:type a: Storage_stCONSTclCOM &
	:rtype: None
") PCDM_Document;
		 PCDM_Document (const Storage_stCONSTclCOM & a);
		%feature("compactdefaultargs") PCDM_Document;
		%feature("autodoc", "	:rtype: None
") PCDM_Document;
		 PCDM_Document ();
};


%extend PCDM_Document {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor PCDM_ReadWriter;
class PCDM_ReadWriter : public Standard_Transient {
	public:
		%feature("compactdefaultargs") Version;
		%feature("autodoc", "	* returns PCDM_ReadWriter_1.

	:rtype: TCollection_AsciiString
") Version;
		virtual TCollection_AsciiString Version ();
		%feature("compactdefaultargs") WriteReferenceCounter;
		%feature("autodoc", "	:param aData:
	:type aData: Handle_Storage_Data &
	:param aDocument:
	:type aDocument: Handle_CDM_Document &
	:rtype: void
") WriteReferenceCounter;
		virtual void WriteReferenceCounter (const Handle_Storage_Data & aData,const Handle_CDM_Document & aDocument);
		%feature("compactdefaultargs") WriteReferences;
		%feature("autodoc", "	:param aData:
	:type aData: Handle_Storage_Data &
	:param aDocument:
	:type aDocument: Handle_CDM_Document &
	:param theReferencerFileName:
	:type theReferencerFileName: TCollection_ExtendedString &
	:rtype: void
") WriteReferences;
		virtual void WriteReferences (const Handle_Storage_Data & aData,const Handle_CDM_Document & aDocument,const TCollection_ExtendedString & theReferencerFileName);
		%feature("compactdefaultargs") WriteExtensions;
		%feature("autodoc", "	:param aData:
	:type aData: Handle_Storage_Data &
	:param aDocument:
	:type aDocument: Handle_CDM_Document &
	:rtype: void
") WriteExtensions;
		virtual void WriteExtensions (const Handle_Storage_Data & aData,const Handle_CDM_Document & aDocument);
		%feature("compactdefaultargs") WriteVersion;
		%feature("autodoc", "	:param aData:
	:type aData: Handle_Storage_Data &
	:param aDocument:
	:type aDocument: Handle_CDM_Document &
	:rtype: void
") WriteVersion;
		virtual void WriteVersion (const Handle_Storage_Data & aData,const Handle_CDM_Document & aDocument);
		%feature("compactdefaultargs") ReadReferenceCounter;
		%feature("autodoc", "	:param theFileName:
	:type theFileName: TCollection_ExtendedString &
	:param theMsgDriver:
	:type theMsgDriver: Handle_CDM_MessageDriver &
	:rtype: int
") ReadReferenceCounter;
		virtual Standard_Integer ReadReferenceCounter (const TCollection_ExtendedString & theFileName,const Handle_CDM_MessageDriver & theMsgDriver);
		%feature("compactdefaultargs") ReadReferences;
		%feature("autodoc", "	:param aFileName:
	:type aFileName: TCollection_ExtendedString &
	:param theReferences:
	:type theReferences: PCDM_SequenceOfReference &
	:param theMsgDriver:
	:type theMsgDriver: Handle_CDM_MessageDriver &
	:rtype: void
") ReadReferences;
		virtual void ReadReferences (const TCollection_ExtendedString & aFileName,PCDM_SequenceOfReference & theReferences,const Handle_CDM_MessageDriver & theMsgDriver);
		%feature("compactdefaultargs") ReadExtensions;
		%feature("autodoc", "	:param aFileName:
	:type aFileName: TCollection_ExtendedString &
	:param theExtensions:
	:type theExtensions: TColStd_SequenceOfExtendedString &
	:param theMsgDriver:
	:type theMsgDriver: Handle_CDM_MessageDriver &
	:rtype: void
") ReadExtensions;
		virtual void ReadExtensions (const TCollection_ExtendedString & aFileName,TColStd_SequenceOfExtendedString & theExtensions,const Handle_CDM_MessageDriver & theMsgDriver);
		%feature("compactdefaultargs") ReadDocumentVersion;
		%feature("autodoc", "	:param aFileName:
	:type aFileName: TCollection_ExtendedString &
	:param theMsgDriver:
	:type theMsgDriver: Handle_CDM_MessageDriver &
	:rtype: int
") ReadDocumentVersion;
		virtual Standard_Integer ReadDocumentVersion (const TCollection_ExtendedString & aFileName,const Handle_CDM_MessageDriver & theMsgDriver);
		%feature("compactdefaultargs") Open;
		%feature("autodoc", "	:param aDriver:
	:type aDriver: Storage_BaseDriver &
	:param aFileName:
	:type aFileName: TCollection_ExtendedString &
	:param anOpenMode:
	:type anOpenMode: Storage_OpenMode
	:rtype: void
") Open;
		static void Open (Storage_BaseDriver & aDriver,const TCollection_ExtendedString & aFileName,const Storage_OpenMode anOpenMode);
		%feature("compactdefaultargs") Reader;
		%feature("autodoc", "	* returns the convenient Reader for a File.

	:param aFileName:
	:type aFileName: TCollection_ExtendedString &
	:rtype: Handle_PCDM_ReadWriter
") Reader;
		static Handle_PCDM_ReadWriter Reader (const TCollection_ExtendedString & aFileName);
		%feature("compactdefaultargs") Writer;
		%feature("autodoc", "	:rtype: Handle_PCDM_ReadWriter
") Writer;
		static Handle_PCDM_ReadWriter Writer ();
		%feature("compactdefaultargs") WriteFileFormat;
		%feature("autodoc", "	:param aData:
	:type aData: Handle_Storage_Data &
	:param aDocument:
	:type aDocument: Handle_CDM_Document &
	:rtype: void
") WriteFileFormat;
		static void WriteFileFormat (const Handle_Storage_Data & aData,const Handle_CDM_Document & aDocument);
		%feature("compactdefaultargs") FileFormat;
		%feature("autodoc", "	* tries to get a format in the file. returns an empty string if the file could not be read or does not have a FileFormat information.

	:param aFileName:
	:type aFileName: TCollection_ExtendedString &
	:rtype: TCollection_ExtendedString
") FileFormat;
		static TCollection_ExtendedString FileFormat (const TCollection_ExtendedString & aFileName);
};


%make_alias(PCDM_ReadWriter)

%extend PCDM_ReadWriter {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor PCDM_Reader;
class PCDM_Reader : public Standard_Transient {
	public:
		%feature("compactdefaultargs") CreateDocument;
		%feature("autodoc", "	* this method is called by the framework before the read method.

	:rtype: Handle_CDM_Document
") CreateDocument;
		virtual Handle_CDM_Document CreateDocument ();
		%feature("compactdefaultargs") Read;
		%feature("autodoc", "	* retrieves the content of the file into a new Document.

	:param aFileName:
	:type aFileName: TCollection_ExtendedString &
	:param aNewDocument:
	:type aNewDocument: Handle_CDM_Document &
	:param anApplication:
	:type anApplication: Handle_CDM_Application &
	:rtype: void
") Read;
		virtual void Read (const TCollection_ExtendedString & aFileName,const Handle_CDM_Document & aNewDocument,const Handle_CDM_Application & anApplication);
		%feature("compactdefaultargs") GetStatus;
		%feature("autodoc", "	:rtype: PCDM_ReaderStatus
") GetStatus;
		PCDM_ReaderStatus GetStatus ();
};


%make_alias(PCDM_Reader)

%extend PCDM_Reader {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor PCDM_Reference;
class PCDM_Reference {
	public:
		%feature("compactdefaultargs") PCDM_Reference;
		%feature("autodoc", "	:rtype: None
") PCDM_Reference;
		 PCDM_Reference ();
		%feature("compactdefaultargs") PCDM_Reference;
		%feature("autodoc", "	:param aReferenceIdentifier:
	:type aReferenceIdentifier: int
	:param aFileName:
	:type aFileName: TCollection_ExtendedString &
	:param aDocumentVersion:
	:type aDocumentVersion: int
	:rtype: None
") PCDM_Reference;
		 PCDM_Reference (const Standard_Integer aReferenceIdentifier,const TCollection_ExtendedString & aFileName,const Standard_Integer aDocumentVersion);
		%feature("compactdefaultargs") ReferenceIdentifier;
		%feature("autodoc", "	:rtype: int
") ReferenceIdentifier;
		Standard_Integer ReferenceIdentifier ();
		%feature("compactdefaultargs") FileName;
		%feature("autodoc", "	:rtype: TCollection_ExtendedString
") FileName;
		TCollection_ExtendedString FileName ();
		%feature("compactdefaultargs") DocumentVersion;
		%feature("autodoc", "	:rtype: int
") DocumentVersion;
		Standard_Integer DocumentVersion ();
};


%extend PCDM_Reference {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor PCDM_ReferenceIterator;
class PCDM_ReferenceIterator : public Standard_Transient {
	public:
		%feature("compactdefaultargs") PCDM_ReferenceIterator;
		%feature("autodoc", "	* Warning! The constructor does not initialization.

	:param theMessageDriver:
	:type theMessageDriver: Handle_CDM_MessageDriver &
	:rtype: None
") PCDM_ReferenceIterator;
		 PCDM_ReferenceIterator (const Handle_CDM_MessageDriver & theMessageDriver);
		%feature("compactdefaultargs") LoadReferences;
		%feature("autodoc", "	:param aDocument:
	:type aDocument: Handle_CDM_Document &
	:param aMetaData:
	:type aMetaData: Handle_CDM_MetaData &
	:param anApplication:
	:type anApplication: Handle_CDM_Application &
	:param UseStorageConfiguration:
	:type UseStorageConfiguration: bool
	:rtype: None
") LoadReferences;
		void LoadReferences (const Handle_CDM_Document & aDocument,const Handle_CDM_MetaData & aMetaData,const Handle_CDM_Application & anApplication,const Standard_Boolean UseStorageConfiguration);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aMetaData:
	:type aMetaData: Handle_CDM_MetaData &
	:rtype: void
") Init;
		virtual void Init (const Handle_CDM_MetaData & aMetaData);
};


%make_alias(PCDM_ReferenceIterator)

%extend PCDM_ReferenceIterator {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor PCDM_SequenceNodeOfSequenceOfDocument;
class PCDM_SequenceNodeOfSequenceOfDocument : public TCollection_SeqNode {
	public:
		%feature("compactdefaultargs") PCDM_SequenceNodeOfSequenceOfDocument;
		%feature("autodoc", "	:param I:
	:type I: Handle_PCDM_Document &
	:param n:
	:type n: TCollection_SeqNodePtr &
	:param p:
	:type p: TCollection_SeqNodePtr &
	:rtype: None
") PCDM_SequenceNodeOfSequenceOfDocument;
		 PCDM_SequenceNodeOfSequenceOfDocument (const Handle_PCDM_Document & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: Handle_PCDM_Document
") Value;
		Handle_PCDM_Document Value ();
};


%make_alias(PCDM_SequenceNodeOfSequenceOfDocument)

%extend PCDM_SequenceNodeOfSequenceOfDocument {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor PCDM_SequenceNodeOfSequenceOfReference;
class PCDM_SequenceNodeOfSequenceOfReference : public TCollection_SeqNode {
	public:
		%feature("compactdefaultargs") PCDM_SequenceNodeOfSequenceOfReference;
		%feature("autodoc", "	:param I:
	:type I: PCDM_Reference &
	:param n:
	:type n: TCollection_SeqNodePtr &
	:param p:
	:type p: TCollection_SeqNodePtr &
	:rtype: None
") PCDM_SequenceNodeOfSequenceOfReference;
		 PCDM_SequenceNodeOfSequenceOfReference (const PCDM_Reference & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: PCDM_Reference
") Value;
		PCDM_Reference & Value ();
};


%make_alias(PCDM_SequenceNodeOfSequenceOfReference)

%extend PCDM_SequenceNodeOfSequenceOfReference {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor PCDM_SequenceOfDocument;
class PCDM_SequenceOfDocument : public TCollection_BaseSequence {
	public:
		%feature("compactdefaultargs") PCDM_SequenceOfDocument;
		%feature("autodoc", "	:rtype: None
") PCDM_SequenceOfDocument;
		 PCDM_SequenceOfDocument ();
		%feature("compactdefaultargs") PCDM_SequenceOfDocument;
		%feature("autodoc", "	:param Other:
	:type Other: PCDM_SequenceOfDocument &
	:rtype: None
") PCDM_SequenceOfDocument;
		 PCDM_SequenceOfDocument (const PCDM_SequenceOfDocument & Other);
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: PCDM_SequenceOfDocument &
	:rtype: PCDM_SequenceOfDocument
") Assign;
		const PCDM_SequenceOfDocument & Assign (const PCDM_SequenceOfDocument & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: PCDM_SequenceOfDocument &
	:rtype: PCDM_SequenceOfDocument
") operator =;
		const PCDM_SequenceOfDocument & operator = (const PCDM_SequenceOfDocument & Other);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param T:
	:type T: Handle_PCDM_Document &
	:rtype: None
") Append;
		void Append (const Handle_PCDM_Document & T);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param S:
	:type S: PCDM_SequenceOfDocument &
	:rtype: None
") Append;
		void Append (PCDM_SequenceOfDocument & S);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param T:
	:type T: Handle_PCDM_Document &
	:rtype: None
") Prepend;
		void Prepend (const Handle_PCDM_Document & T);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param S:
	:type S: PCDM_SequenceOfDocument &
	:rtype: None
") Prepend;
		void Prepend (PCDM_SequenceOfDocument & S);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param T:
	:type T: Handle_PCDM_Document &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const Handle_PCDM_Document & T);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param S:
	:type S: PCDM_SequenceOfDocument &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,PCDM_SequenceOfDocument & S);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param T:
	:type T: Handle_PCDM_Document &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const Handle_PCDM_Document & T);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param S:
	:type S: PCDM_SequenceOfDocument &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,PCDM_SequenceOfDocument & S);
		%feature("compactdefaultargs") First;
		%feature("autodoc", "	:rtype: Handle_PCDM_Document
") First;
		Handle_PCDM_Document First ();
		%feature("compactdefaultargs") Last;
		%feature("autodoc", "	:rtype: Handle_PCDM_Document
") Last;
		Handle_PCDM_Document Last ();
		%feature("compactdefaultargs") Split;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param Sub:
	:type Sub: PCDM_SequenceOfDocument &
	:rtype: None
") Split;
		void Split (const Standard_Integer Index,PCDM_SequenceOfDocument & Sub);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Handle_PCDM_Document
") Value;
		Handle_PCDM_Document Value (const Standard_Integer Index);
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param I:
	:type I: Handle_PCDM_Document &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const Handle_PCDM_Document & I);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Handle_PCDM_Document
") ChangeValue;
		Handle_PCDM_Document ChangeValue (const Standard_Integer Index);
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


%extend PCDM_SequenceOfDocument {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor PCDM_SequenceOfReference;
class PCDM_SequenceOfReference : public TCollection_BaseSequence {
	public:
		%feature("compactdefaultargs") PCDM_SequenceOfReference;
		%feature("autodoc", "	:rtype: None
") PCDM_SequenceOfReference;
		 PCDM_SequenceOfReference ();
		%feature("compactdefaultargs") PCDM_SequenceOfReference;
		%feature("autodoc", "	:param Other:
	:type Other: PCDM_SequenceOfReference &
	:rtype: None
") PCDM_SequenceOfReference;
		 PCDM_SequenceOfReference (const PCDM_SequenceOfReference & Other);
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: PCDM_SequenceOfReference &
	:rtype: PCDM_SequenceOfReference
") Assign;
		const PCDM_SequenceOfReference & Assign (const PCDM_SequenceOfReference & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: PCDM_SequenceOfReference &
	:rtype: PCDM_SequenceOfReference
") operator =;
		const PCDM_SequenceOfReference & operator = (const PCDM_SequenceOfReference & Other);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param T:
	:type T: PCDM_Reference &
	:rtype: None
") Append;
		void Append (const PCDM_Reference & T);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param S:
	:type S: PCDM_SequenceOfReference &
	:rtype: None
") Append;
		void Append (PCDM_SequenceOfReference & S);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param T:
	:type T: PCDM_Reference &
	:rtype: None
") Prepend;
		void Prepend (const PCDM_Reference & T);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param S:
	:type S: PCDM_SequenceOfReference &
	:rtype: None
") Prepend;
		void Prepend (PCDM_SequenceOfReference & S);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param T:
	:type T: PCDM_Reference &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const PCDM_Reference & T);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param S:
	:type S: PCDM_SequenceOfReference &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,PCDM_SequenceOfReference & S);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param T:
	:type T: PCDM_Reference &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const PCDM_Reference & T);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param S:
	:type S: PCDM_SequenceOfReference &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,PCDM_SequenceOfReference & S);
		%feature("compactdefaultargs") First;
		%feature("autodoc", "	:rtype: PCDM_Reference
") First;
		const PCDM_Reference & First ();
		%feature("compactdefaultargs") Last;
		%feature("autodoc", "	:rtype: PCDM_Reference
") Last;
		const PCDM_Reference & Last ();
		%feature("compactdefaultargs") Split;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param Sub:
	:type Sub: PCDM_SequenceOfReference &
	:rtype: None
") Split;
		void Split (const Standard_Integer Index,PCDM_SequenceOfReference & Sub);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: PCDM_Reference
") Value;
		const PCDM_Reference & Value (const Standard_Integer Index);
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param I:
	:type I: PCDM_Reference &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const PCDM_Reference & I);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: PCDM_Reference
") ChangeValue;
		PCDM_Reference & ChangeValue (const Standard_Integer Index);
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


%extend PCDM_SequenceOfReference {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor PCDM_Writer;
class PCDM_Writer : public Standard_Transient {
	public:
		%feature("compactdefaultargs") Write;
		%feature("autodoc", "	:param aDocument:
	:type aDocument: Handle_CDM_Document &
	:param aFileName:
	:type aFileName: TCollection_ExtendedString &
	:rtype: void
") Write;
		virtual void Write (const Handle_CDM_Document & aDocument,const TCollection_ExtendedString & aFileName);
};


%make_alias(PCDM_Writer)

%extend PCDM_Writer {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor PCDM_ReadWriter_1;
class PCDM_ReadWriter_1 : public PCDM_ReadWriter {
	public:
		%feature("compactdefaultargs") PCDM_ReadWriter_1;
		%feature("autodoc", "	:rtype: None
") PCDM_ReadWriter_1;
		 PCDM_ReadWriter_1 ();
		%feature("compactdefaultargs") Version;
		%feature("autodoc", "	* returns PCDM_ReadWriter_1.

	:rtype: TCollection_AsciiString
") Version;
		TCollection_AsciiString Version ();
		%feature("compactdefaultargs") WriteReferenceCounter;
		%feature("autodoc", "	:param aData:
	:type aData: Handle_Storage_Data &
	:param aDocument:
	:type aDocument: Handle_CDM_Document &
	:rtype: None
") WriteReferenceCounter;
		void WriteReferenceCounter (const Handle_Storage_Data & aData,const Handle_CDM_Document & aDocument);
		%feature("compactdefaultargs") WriteReferences;
		%feature("autodoc", "	:param aData:
	:type aData: Handle_Storage_Data &
	:param aDocument:
	:type aDocument: Handle_CDM_Document &
	:param theReferencerFileName:
	:type theReferencerFileName: TCollection_ExtendedString &
	:rtype: None
") WriteReferences;
		void WriteReferences (const Handle_Storage_Data & aData,const Handle_CDM_Document & aDocument,const TCollection_ExtendedString & theReferencerFileName);
		%feature("compactdefaultargs") WriteExtensions;
		%feature("autodoc", "	:param aData:
	:type aData: Handle_Storage_Data &
	:param aDocument:
	:type aDocument: Handle_CDM_Document &
	:rtype: None
") WriteExtensions;
		void WriteExtensions (const Handle_Storage_Data & aData,const Handle_CDM_Document & aDocument);
		%feature("compactdefaultargs") WriteVersion;
		%feature("autodoc", "	:param aData:
	:type aData: Handle_Storage_Data &
	:param aDocument:
	:type aDocument: Handle_CDM_Document &
	:rtype: None
") WriteVersion;
		void WriteVersion (const Handle_Storage_Data & aData,const Handle_CDM_Document & aDocument);
		%feature("compactdefaultargs") ReadReferenceCounter;
		%feature("autodoc", "	:param aFileName:
	:type aFileName: TCollection_ExtendedString &
	:param theMsgDriver:
	:type theMsgDriver: Handle_CDM_MessageDriver &
	:rtype: int
") ReadReferenceCounter;
		Standard_Integer ReadReferenceCounter (const TCollection_ExtendedString & aFileName,const Handle_CDM_MessageDriver & theMsgDriver);
		%feature("compactdefaultargs") ReadReferences;
		%feature("autodoc", "	:param aFileName:
	:type aFileName: TCollection_ExtendedString &
	:param theReferences:
	:type theReferences: PCDM_SequenceOfReference &
	:param theMsgDriver:
	:type theMsgDriver: Handle_CDM_MessageDriver &
	:rtype: None
") ReadReferences;
		void ReadReferences (const TCollection_ExtendedString & aFileName,PCDM_SequenceOfReference & theReferences,const Handle_CDM_MessageDriver & theMsgDriver);
		%feature("compactdefaultargs") ReadExtensions;
		%feature("autodoc", "	:param aFileName:
	:type aFileName: TCollection_ExtendedString &
	:param theExtensions:
	:type theExtensions: TColStd_SequenceOfExtendedString &
	:param theMsgDriver:
	:type theMsgDriver: Handle_CDM_MessageDriver &
	:rtype: None
") ReadExtensions;
		void ReadExtensions (const TCollection_ExtendedString & aFileName,TColStd_SequenceOfExtendedString & theExtensions,const Handle_CDM_MessageDriver & theMsgDriver);
		%feature("compactdefaultargs") ReadDocumentVersion;
		%feature("autodoc", "	:param aFileName:
	:type aFileName: TCollection_ExtendedString &
	:param theMsgDriver:
	:type theMsgDriver: Handle_CDM_MessageDriver &
	:rtype: int
") ReadDocumentVersion;
		Standard_Integer ReadDocumentVersion (const TCollection_ExtendedString & aFileName,const Handle_CDM_MessageDriver & theMsgDriver);
};


%make_alias(PCDM_ReadWriter_1)

%extend PCDM_ReadWriter_1 {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor PCDM_RetrievalDriver;
class PCDM_RetrievalDriver : public PCDM_Reader {
	public:
		%feature("compactdefaultargs") Read;
		%feature("autodoc", "	* Warning - raises DriverError if an error occurs during inside the Make method. retrieves the content of the file into a new Document. //! by default Read will use the Schema method to read the file into a persistent document. and the Make method to build a transient document.

	:param aFileName:
	:type aFileName: TCollection_ExtendedString &
	:param aNewDocument:
	:type aNewDocument: Handle_CDM_Document &
	:param anApplication:
	:type anApplication: Handle_CDM_Application &
	:rtype: void
") Read;
		virtual void Read (const TCollection_ExtendedString & aFileName,const Handle_CDM_Document & aNewDocument,const Handle_CDM_Application & anApplication);
		%feature("compactdefaultargs") Make;
		%feature("autodoc", "	:param aPCDM:
	:type aPCDM: Handle_PCDM_Document &
	:param aNewDocument:
	:type aNewDocument: Handle_CDM_Document &
	:rtype: void
") Make;
		virtual void Make (const Handle_PCDM_Document & aPCDM,const Handle_CDM_Document & aNewDocument);
		%feature("compactdefaultargs") SchemaName;
		%feature("autodoc", "	:rtype: TCollection_ExtendedString
") SchemaName;
		virtual TCollection_ExtendedString SchemaName ();
		%feature("compactdefaultargs") LoadExtensions;
		%feature("autodoc", "	:param aSchema:
	:type aSchema: Handle_Storage_Schema &
	:param Extensions:
	:type Extensions: TColStd_SequenceOfExtendedString &
	:param theMsgDriver:
	:type theMsgDriver: Handle_CDM_MessageDriver &
	:rtype: void
") LoadExtensions;
		virtual void LoadExtensions (const Handle_Storage_Schema & aSchema,const TColStd_SequenceOfExtendedString & Extensions,const Handle_CDM_MessageDriver & theMsgDriver);
		%feature("compactdefaultargs") RaiseIfUnknownTypes;
		%feature("autodoc", "	:param aSchema:
	:type aSchema: Handle_Storage_Schema &
	:param aFileName:
	:type aFileName: TCollection_ExtendedString &
	:rtype: void
") RaiseIfUnknownTypes;
		static void RaiseIfUnknownTypes (const Handle_Storage_Schema & aSchema,const TCollection_ExtendedString & aFileName);
		%feature("compactdefaultargs") DocumentVersion;
		%feature("autodoc", "	:param aFileName:
	:type aFileName: TCollection_ExtendedString &
	:param theMsgDriver:
	:type theMsgDriver: Handle_CDM_MessageDriver &
	:rtype: int
") DocumentVersion;
		static Standard_Integer DocumentVersion (const TCollection_ExtendedString & aFileName,const Handle_CDM_MessageDriver & theMsgDriver);
		%feature("compactdefaultargs") ReferenceCounter;
		%feature("autodoc", "	:param aFileName:
	:type aFileName: TCollection_ExtendedString &
	:param theMsgDriver:
	:type theMsgDriver: Handle_CDM_MessageDriver &
	:rtype: int
") ReferenceCounter;
		static Standard_Integer ReferenceCounter (const TCollection_ExtendedString & aFileName,const Handle_CDM_MessageDriver & theMsgDriver);
		%feature("compactdefaultargs") SetFormat;
		%feature("autodoc", "	:param aformat:
	:type aformat: TCollection_ExtendedString &
	:rtype: None
") SetFormat;
		void SetFormat (const TCollection_ExtendedString & aformat);
		%feature("compactdefaultargs") GetFormat;
		%feature("autodoc", "	:rtype: TCollection_ExtendedString
") GetFormat;
		TCollection_ExtendedString GetFormat ();
};


%make_alias(PCDM_RetrievalDriver)

%extend PCDM_RetrievalDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor PCDM_StorageDriver;
class PCDM_StorageDriver : public PCDM_Writer {
	public:
		%feature("compactdefaultargs") Make;
		%feature("autodoc", "	* raises NotImplemented.

	:param aDocument:
	:type aDocument: Handle_CDM_Document &
	:rtype: Handle_PCDM_Document
") Make;
		virtual Handle_PCDM_Document Make (const Handle_CDM_Document & aDocument);
		%feature("compactdefaultargs") Make;
		%feature("autodoc", "	* By default, puts in the Sequence the document returns by the previous Make method.

	:param aDocument:
	:type aDocument: Handle_CDM_Document &
	:param Documents:
	:type Documents: PCDM_SequenceOfDocument &
	:rtype: void
") Make;
		virtual void Make (const Handle_CDM_Document & aDocument,PCDM_SequenceOfDocument & Documents);
		%feature("compactdefaultargs") SchemaName;
		%feature("autodoc", "	:rtype: TCollection_ExtendedString
") SchemaName;
		virtual TCollection_ExtendedString SchemaName ();
		%feature("compactdefaultargs") LoadExtensions;
		%feature("autodoc", "	:param aSchema:
	:type aSchema: Handle_Storage_Schema &
	:param Extensions:
	:type Extensions: TColStd_SequenceOfExtendedString &
	:rtype: void
") LoadExtensions;
		virtual void LoadExtensions (const Handle_Storage_Schema & aSchema,const TColStd_SequenceOfExtendedString & Extensions);
		%feature("compactdefaultargs") Write;
		%feature("autodoc", "	* Warning! raises DriverError if an error occurs during inside the Make method. stores the content of the Document into a new file. //! by default Write will use Make method to build a persistent document and the Schema method to write the persistent document.

	:param aDocument:
	:type aDocument: Handle_CDM_Document &
	:param aFileName:
	:type aFileName: TCollection_ExtendedString &
	:rtype: void
") Write;
		virtual void Write (const Handle_CDM_Document & aDocument,const TCollection_ExtendedString & aFileName);
		%feature("compactdefaultargs") SetFormat;
		%feature("autodoc", "	:param aformat:
	:type aformat: TCollection_ExtendedString &
	:rtype: None
") SetFormat;
		void SetFormat (const TCollection_ExtendedString & aformat);
		%feature("compactdefaultargs") GetFormat;
		%feature("autodoc", "	:rtype: TCollection_ExtendedString
") GetFormat;
		TCollection_ExtendedString GetFormat ();
		%feature("compactdefaultargs") IsError;
		%feature("autodoc", "	:rtype: bool
") IsError;
		Standard_Boolean IsError ();
		%feature("compactdefaultargs") SetIsError;
		%feature("autodoc", "	:param theIsError:
	:type theIsError: bool
	:rtype: None
") SetIsError;
		void SetIsError (const Standard_Boolean theIsError);
		%feature("compactdefaultargs") GetStoreStatus;
		%feature("autodoc", "	:rtype: PCDM_StoreStatus
") GetStoreStatus;
		PCDM_StoreStatus GetStoreStatus ();
		%feature("compactdefaultargs") SetStoreStatus;
		%feature("autodoc", "	:param theStoreStatus:
	:type theStoreStatus: PCDM_StoreStatus
	:rtype: None
") SetStoreStatus;
		void SetStoreStatus (const PCDM_StoreStatus theStoreStatus);
};


%make_alias(PCDM_StorageDriver)

%extend PCDM_StorageDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
