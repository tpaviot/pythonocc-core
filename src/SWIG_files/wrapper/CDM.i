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
%define CDMDOCSTRING
"CDM module, see official documentation at
https://www.opencascade.com/doc/occt-7.4.0/refman/html/package_cdm.html"
%enddef
%module (package="OCC.Core", docstring=CDMDOCSTRING) CDM


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
#include<CDM_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Message_module.hxx>
#include<Resource_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import TColStd.i
%import TCollection.i
%import Message.i
%import Resource.i

%pythoncode {
from enum import IntEnum
from OCC.Core.Exception import *
};

/* public enums */
enum CDM_CanCloseStatus {
	CDM_CCS_OK = 0,
	CDM_CCS_NotOpen = 1,
	CDM_CCS_UnstoredReferenced = 2,
	CDM_CCS_ModifiedReferenced = 3,
	CDM_CCS_ReferenceRejection = 4,
};

/* end public enums declaration */

/* python proy classes for enums */
%pythoncode {

class CDM_CanCloseStatus(IntEnum):
	CDM_CCS_OK = 0
	CDM_CCS_NotOpen = 1
	CDM_CCS_UnstoredReferenced = 2
	CDM_CCS_ModifiedReferenced = 3
	CDM_CCS_ReferenceRejection = 4
CDM_CCS_OK = CDM_CanCloseStatus.CDM_CCS_OK
CDM_CCS_NotOpen = CDM_CanCloseStatus.CDM_CCS_NotOpen
CDM_CCS_UnstoredReferenced = CDM_CanCloseStatus.CDM_CCS_UnstoredReferenced
CDM_CCS_ModifiedReferenced = CDM_CanCloseStatus.CDM_CCS_ModifiedReferenced
CDM_CCS_ReferenceRejection = CDM_CanCloseStatus.CDM_CCS_ReferenceRejection
};
/* end python proxy for enums */

/* handles */
%wrap_handle(CDM_Application)
%wrap_handle(CDM_Document)
%wrap_handle(CDM_MetaData)
%wrap_handle(CDM_Reference)
/* end handles declaration */

/* templates */
%template(CDM_DocumentHasher) NCollection_DefaultHasher<opencascade::handle<CDM_Document>>;
%template(CDM_ListIteratorOfListOfDocument) NCollection_TListIterator<opencascade::handle<CDM_Document>>;
%template(CDM_ListIteratorOfListOfReferences) NCollection_TListIterator<opencascade::handle<CDM_Reference>>;
%template(CDM_ListOfDocument) NCollection_List<opencascade::handle<CDM_Document>>;

%extend NCollection_List<opencascade::handle<CDM_Document>> {
    %pythoncode {
    def __len__(self):
        return self.Size()
    }
};
%template(CDM_ListOfReferences) NCollection_List<opencascade::handle<CDM_Reference>>;

%extend NCollection_List<opencascade::handle<CDM_Reference>> {
    %pythoncode {
    def __len__(self):
        return self.Size()
    }
};
%template(CDM_MapOfDocument) NCollection_Map<opencascade::handle<CDM_Document>,CDM_DocumentHasher>;
%template(CDM_MetaDataLookUpTable) NCollection_DataMap<TCollection_ExtendedString,opencascade::handle<CDM_MetaData>,TCollection_ExtendedString>;
%template(CDM_PresentationDirectory) NCollection_DataMap<TCollection_ExtendedString,opencascade::handle<CDM_Document>,TCollection_ExtendedString>;
/* end templates declaration */

/* typedefs */
typedef NCollection_DataMap<TCollection_ExtendedString, opencascade::handle<CDM_MetaData>, TCollection_ExtendedString>::Iterator CDM_DataMapIteratorOfMetaDataLookUpTable;
typedef NCollection_DataMap<TCollection_ExtendedString, opencascade::handle<CDM_Document>, TCollection_ExtendedString>::Iterator CDM_DataMapIteratorOfPresentationDirectory;
typedef NCollection_DefaultHasher<opencascade::handle<CDM_Document>> CDM_DocumentHasher;
typedef CDM_Document * CDM_DocumentPointer;
typedef NCollection_List<opencascade::handle<CDM_Document>>::Iterator CDM_ListIteratorOfListOfDocument;
typedef NCollection_List<opencascade::handle<CDM_Reference>>::Iterator CDM_ListIteratorOfListOfReferences;
typedef NCollection_List<opencascade::handle<CDM_Document>> CDM_ListOfDocument;
typedef NCollection_List<opencascade::handle<CDM_Reference>> CDM_ListOfReferences;
typedef NCollection_Map<opencascade::handle<CDM_Document>, CDM_DocumentHasher>::Iterator CDM_MapIteratorOfMapOfDocument;
typedef NCollection_Map<opencascade::handle<CDM_Document>, CDM_DocumentHasher> CDM_MapOfDocument;
typedef NCollection_DataMap<TCollection_ExtendedString, opencascade::handle<CDM_MetaData>, TCollection_ExtendedString> CDM_MetaDataLookUpTable;
typedef TColStd_DataMapOfStringInteger CDM_NamesDirectory;
typedef NCollection_DataMap<TCollection_ExtendedString, opencascade::handle<CDM_Document>, TCollection_ExtendedString> CDM_PresentationDirectory;
/* end typedefs declaration */

/************************
* class CDM_Application *
************************/
%nodefaultctor CDM_Application;
class CDM_Application : public Standard_Transient {
	public:
		/****************** BeginOfUpdate ******************/
		/**** md5 signature: 0af0b7d32d1a2f5708cb026b8c02ce44 ****/
		%feature("compactdefaultargs") BeginOfUpdate;
		%feature("autodoc", "This method is called before the update of a document. by default, writes in messagedriver().

Parameters
----------
aDocument: CDM_Document

Returns
-------
None
") BeginOfUpdate;
		virtual void BeginOfUpdate(const opencascade::handle<CDM_Document> & aDocument);

		/****************** EndOfUpdate ******************/
		/**** md5 signature: 1300f7eaea13e12939c9e78edc2d7e82 ****/
		%feature("compactdefaultargs") EndOfUpdate;
		%feature("autodoc", "This method is called affter the update of a document. by default, writes in messagedriver().

Parameters
----------
aDocument: CDM_Document
theStatus: bool
ErrorString: TCollection_ExtendedString

Returns
-------
None
") EndOfUpdate;
		virtual void EndOfUpdate(const opencascade::handle<CDM_Document> & aDocument, const Standard_Boolean theStatus, const TCollection_ExtendedString & ErrorString);

		/****************** MessageDriver ******************/
		/**** md5 signature: 9c7cdb55e9a82d7cef41788491b5a1ec ****/
		%feature("compactdefaultargs") MessageDriver;
		%feature("autodoc", "Returns default messenger;.

Returns
-------
opencascade::handle<Message_Messenger>
") MessageDriver;
		virtual opencascade::handle<Message_Messenger> MessageDriver();

		/****************** Name ******************/
		/**** md5 signature: 80292bf2fe0db1e304d129c2054da361 ****/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "Returns the application name.

Returns
-------
TCollection_ExtendedString
") Name;
		virtual TCollection_ExtendedString Name();

		/****************** Resources ******************/
		/**** md5 signature: 807a657145c6d6be6b1fcc9cf2d99f89 ****/
		%feature("compactdefaultargs") Resources;
		%feature("autodoc", "The manager returned by this virtual method will be used to search for format.retrieval resource items.

Returns
-------
opencascade::handle<Resource_Manager>
") Resources;
		virtual opencascade::handle<Resource_Manager> Resources();

		/****************** Version ******************/
		/**** md5 signature: f0502fbab556d6295e4fc793720e980f ****/
		%feature("compactdefaultargs") Version;
		%feature("autodoc", "Returns the application version.

Returns
-------
TCollection_AsciiString
") Version;
		virtual TCollection_AsciiString Version();

		/****************** Write ******************/
		/**** md5 signature: 53ecbdb2e873292857c5aac0b98f58b3 ****/
		%feature("compactdefaultargs") Write;
		%feature("autodoc", "Writes the string in the application messagerdriver.

Parameters
----------
aString: Standard_ExtString

Returns
-------
None
") Write;
		void Write(const Standard_ExtString aString);

};


%make_alias(CDM_Application)

%extend CDM_Application {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************
* class CDM_Document *
*********************/
%nodefaultctor CDM_Document;
%ignore CDM_Document::~CDM_Document();
class CDM_Document : public Standard_Transient {
	public:
		/****************** AddComment ******************/
		/**** md5 signature: 06c808db266b5347e2900c1f468bea31 ****/
		%feature("compactdefaultargs") AddComment;
		%feature("autodoc", "Appends a comment into comments of this document.

Parameters
----------
aComment: TCollection_ExtendedString

Returns
-------
None
") AddComment;
		void AddComment(const TCollection_ExtendedString & aComment);

		/****************** Application ******************/
		/**** md5 signature: 64aab7c43cb82115fa37ae0c99da8f75 ****/
		%feature("compactdefaultargs") Application;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<CDM_Application>
") Application;
		const opencascade::handle<CDM_Application> & Application();

		/****************** CanClose ******************/
		/**** md5 signature: d92aa68a8f8c78b75ae7c150bd4a2d5b ****/
		%feature("compactdefaultargs") CanClose;
		%feature("autodoc", "No available documentation.

Returns
-------
CDM_CanCloseStatus
") CanClose;
		CDM_CanCloseStatus CanClose();

		/****************** CanCloseReference ******************/
		/**** md5 signature: 1140aead780f6c5f5344930b6e6db09b ****/
		%feature("compactdefaultargs") CanCloseReference;
		%feature("autodoc", "A referenced document may indicate through this virtual method that it does not allow the closing of adocument which it references through the reference areferenceidentifier. by default returns standard_true;;.

Parameters
----------
aDocument: CDM_Document
aReferenceIdentifier: int

Returns
-------
bool
") CanCloseReference;
		virtual Standard_Boolean CanCloseReference(const opencascade::handle<CDM_Document> & aDocument, const Standard_Integer aReferenceIdentifier);

		/****************** ChangeStorageFormatVersion ******************/
		/**** md5 signature: 95752de9d7059066fe5990db631cf0da ****/
		%feature("compactdefaultargs") ChangeStorageFormatVersion;
		%feature("autodoc", "Sets <theversion> of the format to be used to store the document.

Parameters
----------
theVersion: int

Returns
-------
None
") ChangeStorageFormatVersion;
		void ChangeStorageFormatVersion(const Standard_Integer theVersion);

		/****************** Close ******************/
		/**** md5 signature: d50d7ba65c2beb3eb436584b5735f108 ****/
		%feature("compactdefaultargs") Close;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Close;
		void Close();

		/****************** CloseReference ******************/
		/**** md5 signature: 6864eb1b746e4174e03f6398e4a62e45 ****/
		%feature("compactdefaultargs") CloseReference;
		%feature("autodoc", "A referenced document may update its internal data structure when {adocument} which it references through the reference {areferenceidentifier} is being closed. by default this method does nothing.

Parameters
----------
aDocument: CDM_Document
aReferenceIdentifier: int

Returns
-------
None
") CloseReference;
		virtual void CloseReference(const opencascade::handle<CDM_Document> & aDocument, const Standard_Integer aReferenceIdentifier);

		/****************** Comment ******************/
		/**** md5 signature: da330a9b0b5e37badd51cb0b90f32906 ****/
		%feature("compactdefaultargs") Comment;
		%feature("autodoc", "Returns the first of associated comments. by defaut the comment is an empty string.

Returns
-------
Standard_ExtString
") Comment;
		Standard_ExtString Comment();

		/****************** Comments ******************/
		/**** md5 signature: d097d5458a50345161ad38ca79347c2b ****/
		%feature("compactdefaultargs") Comments;
		%feature("autodoc", "Returns the associated comments through <acomments>. returns empty sequence if no comments are associated.

Parameters
----------
aComments: TColStd_SequenceOfExtendedString

Returns
-------
None
") Comments;
		void Comments(TColStd_SequenceOfExtendedString & aComments);

		/****************** CopyReference ******************/
		/**** md5 signature: f5014e895ae3cfcd8f2a7732865706b9 ****/
		%feature("compactdefaultargs") CopyReference;
		%feature("autodoc", "Copies a reference to this document. this method avoid retrieval of referenced document. the arguments are the original document and a valid reference identifier returns the local identifier.

Parameters
----------
aFromDocument: CDM_Document
aReferenceIdentifier: int

Returns
-------
int
") CopyReference;
		Standard_Integer CopyReference(const opencascade::handle<CDM_Document> & aFromDocument, const Standard_Integer aReferenceIdentifier);

		/****************** CreateReference ******************/
		/**** md5 signature: 70b61347a0dba1031a37a4d6a4f096fc ****/
		%feature("compactdefaultargs") CreateReference;
		%feature("autodoc", "Creates a reference from this document to {anotherdocument}. returns a reference identifier. this reference identifier is unique in the document and will not be used for the next references, even after the storing of the document. if there is already a reference between the two documents, the reference is not created, but its reference identifier is returned.

Parameters
----------
anOtherDocument: CDM_Document

Returns
-------
int
") CreateReference;
		Standard_Integer CreateReference(const opencascade::handle<CDM_Document> & anOtherDocument);

		/****************** CreateReference ******************/
		/**** md5 signature: 9a9061502dbb1319ebf6c20b8c206a40 ****/
		%feature("compactdefaultargs") CreateReference;
		%feature("autodoc", "No available documentation.

Parameters
----------
aMetaData: CDM_MetaData
aReferenceIdentifier: int
anApplication: CDM_Application
aToDocumentVersion: int
UseStorageConfiguration: bool

Returns
-------
None
") CreateReference;
		void CreateReference(const opencascade::handle<CDM_MetaData> & aMetaData, const Standard_Integer aReferenceIdentifier, const opencascade::handle<CDM_Application> & anApplication, const Standard_Integer aToDocumentVersion, const Standard_Boolean UseStorageConfiguration);

		/****************** CreateReference ******************/
		/**** md5 signature: 73155220bf15097893e98eeaa6c45625 ****/
		%feature("compactdefaultargs") CreateReference;
		%feature("autodoc", "No available documentation.

Parameters
----------
aMetaData: CDM_MetaData
anApplication: CDM_Application
aDocumentVersion: int
UseStorageConfiguration: bool

Returns
-------
int
") CreateReference;
		Standard_Integer CreateReference(const opencascade::handle<CDM_MetaData> & aMetaData, const opencascade::handle<CDM_Application> & anApplication, const Standard_Integer aDocumentVersion, const Standard_Boolean UseStorageConfiguration);

		/****************** DeepReferences ******************/
		/**** md5 signature: e16f988328ffa73c1ca387730b2190fa ****/
		%feature("compactdefaultargs") DeepReferences;
		%feature("autodoc", "Returns true is this document references adocument;.

Parameters
----------
aDocument: CDM_Document

Returns
-------
bool
") DeepReferences;
		Standard_Boolean DeepReferences(const opencascade::handle<CDM_Document> & aDocument);

		/****************** Description ******************/
		/**** md5 signature: 4ea5e8b06a38637bc4a4e6f3a5b7d927 ****/
		%feature("compactdefaultargs") Description;
		%feature("autodoc", "Gets the `fileformat`.description resource.

Returns
-------
TCollection_ExtendedString
") Description;
		TCollection_ExtendedString Description();

		/****************** Document ******************/
		/**** md5 signature: 8eb99c67c36b1fb3f295093dbdfd69cc ****/
		%feature("compactdefaultargs") Document;
		%feature("autodoc", "Returns the to document of the reference identified by areferenceidentifier. if the todocument is stored and has not yet been retrieved, this method will retrieve it.

Parameters
----------
aReferenceIdentifier: int

Returns
-------
opencascade::handle<CDM_Document>
") Document;
		opencascade::handle<CDM_Document> Document(const Standard_Integer aReferenceIdentifier);

		/****************** Extensions ******************/
		/**** md5 signature: 562af3bed83550e86f6e9f1cc27905e7 ****/
		%feature("compactdefaultargs") Extensions;
		%feature("autodoc", "By default empties the extensions.

Parameters
----------
Extensions: TColStd_SequenceOfExtendedString

Returns
-------
None
") Extensions;
		virtual void Extensions(TColStd_SequenceOfExtendedString & Extensions);

		/****************** FileExtension ******************/
		/**** md5 signature: dc32da120ea382590e37e02d5e00fb9e ****/
		%feature("compactdefaultargs") FileExtension;
		%feature("autodoc", "Gets the desktop.domain.application.`fileformat`.fileextension resource.

Returns
-------
TCollection_ExtendedString
") FileExtension;
		TCollection_ExtendedString FileExtension();

		/****************** FindDescription ******************/
		/**** md5 signature: af3bb67c33b1f02d6f772909eee92676 ****/
		%feature("compactdefaultargs") FindDescription;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") FindDescription;
		Standard_Boolean FindDescription();

		/****************** FindFileExtension ******************/
		/**** md5 signature: 8f91e8289675fe02ffd3f710fad4831b ****/
		%feature("compactdefaultargs") FindFileExtension;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") FindFileExtension;
		Standard_Boolean FindFileExtension();

		/****************** FindFromPresentation ******************/
		/**** md5 signature: 855964cff7b32e0ac06c1e369587b759 ****/
		%feature("compactdefaultargs") FindFromPresentation;
		%feature("autodoc", "Returns the document having the given alphanumeric presentation.

Parameters
----------
aPresentation: TCollection_ExtendedString

Returns
-------
opencascade::handle<CDM_Document>
") FindFromPresentation;
		static opencascade::handle<CDM_Document> FindFromPresentation(const TCollection_ExtendedString & aPresentation);

		/****************** FindPresentation ******************/
		/**** md5 signature: 47d7d9a2db6d3981061736c77f949445 ****/
		%feature("compactdefaultargs") FindPresentation;
		%feature("autodoc", "Indicates whether a document having the given presentation does exist.

Parameters
----------
aPresentation: TCollection_ExtendedString

Returns
-------
bool
") FindPresentation;
		static Standard_Boolean FindPresentation(const TCollection_ExtendedString & aPresentation);

		/****************** Folder ******************/
		/**** md5 signature: 6e4f71ec7a138611fba2655a4d9e2a6c ****/
		%feature("compactdefaultargs") Folder;
		%feature("autodoc", "No available documentation.

Returns
-------
TCollection_ExtendedString
") Folder;
		TCollection_ExtendedString Folder();

		/****************** FromReferencesNumber ******************/
		/**** md5 signature: 25816b3f96b43878489f4e6d996dc26a ****/
		%feature("compactdefaultargs") FromReferencesNumber;
		%feature("autodoc", "Returns the number of references having this document as to document.

Returns
-------
int
") FromReferencesNumber;
		Standard_Integer FromReferencesNumber();

		/****************** GetAlternativeDocument ******************/
		/**** md5 signature: 932a6b6d84c79c3da90d4ce47bf5554d ****/
		%feature("compactdefaultargs") GetAlternativeDocument;
		%feature("autodoc", "This method can be redefined to extract another document in a different format. for example, to extract a shape from an applicative document.

Parameters
----------
aFormat: TCollection_ExtendedString
anAlternativeDocument: CDM_Document

Returns
-------
bool
") GetAlternativeDocument;
		virtual Standard_Boolean GetAlternativeDocument(const TCollection_ExtendedString & aFormat, opencascade::handle<CDM_Document> & anAlternativeDocument);

		/****************** HasRequestedFolder ******************/
		/**** md5 signature: da91e14ce6ae50fe9ebda6e45778d6fc ****/
		%feature("compactdefaultargs") HasRequestedFolder;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") HasRequestedFolder;
		Standard_Boolean HasRequestedFolder();

		/****************** HasRequestedPreviousVersion ******************/
		/**** md5 signature: 016d0ffafe8cf6beb45d2f56183bddfe ****/
		%feature("compactdefaultargs") HasRequestedPreviousVersion;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") HasRequestedPreviousVersion;
		Standard_Boolean HasRequestedPreviousVersion();

		/****************** IsInSession ******************/
		/**** md5 signature: 55aa5c1a1cd34e6b278620a607aed883 ****/
		%feature("compactdefaultargs") IsInSession;
		%feature("autodoc", "Returns true if the to document of the reference identified by areferenceidentifier is in session, false if it corresponds to a not yet retrieved document.

Parameters
----------
aReferenceIdentifier: int

Returns
-------
bool
") IsInSession;
		Standard_Boolean IsInSession(const Standard_Integer aReferenceIdentifier);

		/****************** IsModified ******************/
		/**** md5 signature: 9c75f71ece8c473c12f072739ddc9f63 ****/
		%feature("compactdefaultargs") IsModified;
		%feature("autodoc", "Returns true if the version is greater than the storage version.

Returns
-------
bool
") IsModified;
		Standard_Boolean IsModified();

		/****************** IsOpened ******************/
		/**** md5 signature: 523448479755dd859d720fcc78551e3d ****/
		%feature("compactdefaultargs") IsOpened;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsOpened;
		Standard_Boolean IsOpened();

		/****************** IsOpened ******************/
		/**** md5 signature: 9876c2f350454b050aaab9f4f47c295b ****/
		%feature("compactdefaultargs") IsOpened;
		%feature("autodoc", "Returns true if the document corresponding to the given reference has been retrieved and opened. otherwise returns false. this method does not retrieve the referenced document.

Parameters
----------
aReferenceIdentifier: int

Returns
-------
bool
") IsOpened;
		Standard_Boolean IsOpened(const Standard_Integer aReferenceIdentifier);

		/****************** IsReadOnly ******************/
		/**** md5 signature: fa96cbb7774919470076f35f8b884f77 ****/
		%feature("compactdefaultargs") IsReadOnly;
		%feature("autodoc", "Indicates that this document cannot be modified.

Returns
-------
bool
") IsReadOnly;
		Standard_Boolean IsReadOnly();

		/****************** IsReadOnly ******************/
		/**** md5 signature: 4c358cefb201e05add20e7ea214cab46 ****/
		%feature("compactdefaultargs") IsReadOnly;
		%feature("autodoc", "Indicates that the referenced document cannot be modified,.

Parameters
----------
aReferenceIdentifier: int

Returns
-------
bool
") IsReadOnly;
		Standard_Boolean IsReadOnly(const Standard_Integer aReferenceIdentifier);

		/****************** IsStored ******************/
		/**** md5 signature: 2a9c914c3ea53a7b0112d3f96174940d ****/
		%feature("compactdefaultargs") IsStored;
		%feature("autodoc", "Returns true if the to document of the reference identified by areferenceidentifier has already been stored, false otherwise.

Parameters
----------
aReferenceIdentifier: int

Returns
-------
bool
") IsStored;
		Standard_Boolean IsStored(const Standard_Integer aReferenceIdentifier);

		/****************** IsStored ******************/
		/**** md5 signature: 0accc82ecbcf65967dcdbcbc0b39163c ****/
		%feature("compactdefaultargs") IsStored;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsStored;
		Standard_Boolean IsStored();

		/****************** IsUpToDate ******************/
		/**** md5 signature: 452911df138a97af1629dc6e74872cce ****/
		%feature("compactdefaultargs") IsUpToDate;
		%feature("autodoc", "Returns true if the modification counter found in the given reference is equal to the actual modification counter of the to document. this method is able to deal with a reference to a not retrieved document.

Parameters
----------
aReferenceIdentifier: int

Returns
-------
bool
") IsUpToDate;
		Standard_Boolean IsUpToDate(const Standard_Integer aReferenceIdentifier);

		/****************** LoadResources ******************/
		/**** md5 signature: e42c9588671d5e90c5bd95f9735418c2 ****/
		%feature("compactdefaultargs") LoadResources;
		%feature("autodoc", "Read (or rereads) the following resource.

Returns
-------
None
") LoadResources;
		void LoadResources();

		/****************** MetaData ******************/
		/**** md5 signature: c9a180852f421cb9762c9ab4be4b79ab ****/
		%feature("compactdefaultargs") MetaData;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<CDM_MetaData>
") MetaData;
		opencascade::handle<CDM_MetaData> MetaData();

		/****************** Modifications ******************/
		/**** md5 signature: 3724ba0881224cbd02f10fd6280917aa ****/
		%feature("compactdefaultargs") Modifications;
		%feature("autodoc", "Returns the current modification counter.

Returns
-------
int
") Modifications;
		Standard_Integer Modifications();

		/****************** Modify ******************/
		/**** md5 signature: 44fbaa7237dd1010519534b2d6fc44f0 ****/
		%feature("compactdefaultargs") Modify;
		%feature("autodoc", "Indicates that this document has been modified. this method increments the modification counter.

Returns
-------
None
") Modify;
		void Modify();

		/****************** Name ******************/
		/**** md5 signature: c5a61ad170fbf4cb3eaba703b96b3427 ****/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "Returns the name of the metadata of the to document of the reference identified by areferenceidentifier.

Parameters
----------
aReferenceIdentifier: int

Returns
-------
TCollection_ExtendedString
") Name;
		TCollection_ExtendedString Name(const Standard_Integer aReferenceIdentifier);

		/****************** Open ******************/
		/**** md5 signature: f1ab173c076c622888436649c485a8d3 ****/
		%feature("compactdefaultargs") Open;
		%feature("autodoc", "No available documentation.

Parameters
----------
anApplication: CDM_Application

Returns
-------
None
") Open;
		void Open(const opencascade::handle<CDM_Application> & anApplication);

		/****************** Presentation ******************/
		/**** md5 signature: a4546ef1acf21f1dbec7f60b147ae2f3 ****/
		%feature("compactdefaultargs") Presentation;
		%feature("autodoc", "Returns an alphanumeric string identifying this document in a unique manner in the current process. the presentation may change when the document is stored. tries to get the 'fileformat`.presentation resource this item is used to give a default presentation to the document.

Returns
-------
Standard_ExtString
") Presentation;
		Standard_ExtString Presentation();


        %feature("autodoc", "1");
        %extend{
            std::string PrintToString() {
            std::stringstream s;
            self->Print(s);
            return s.str();}
        };
		/****************** Reference ******************/
		/**** md5 signature: 8fb9128b48e5f8568694a49ff83331ff ****/
		%feature("compactdefaultargs") Reference;
		%feature("autodoc", "No available documentation.

Parameters
----------
aReferenceIdentifier: int

Returns
-------
opencascade::handle<CDM_Reference>
") Reference;
		opencascade::handle<CDM_Reference> Reference(const Standard_Integer aReferenceIdentifier);

		/****************** ReferenceCounter ******************/
		/**** md5 signature: 47d083a8fd4b8a72bd6f39ed448e103e ****/
		%feature("compactdefaultargs") ReferenceCounter;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") ReferenceCounter;
		Standard_Integer ReferenceCounter();

		/****************** RemoveAllReferences ******************/
		/**** md5 signature: 6b9e122ba37998fb6a05a073acdd9b92 ****/
		%feature("compactdefaultargs") RemoveAllReferences;
		%feature("autodoc", "Removes all references having this document for from document.

Returns
-------
None
") RemoveAllReferences;
		void RemoveAllReferences();

		/****************** RemoveReference ******************/
		/**** md5 signature: 4529742436960f07b87af71b701a2171 ****/
		%feature("compactdefaultargs") RemoveReference;
		%feature("autodoc", "Removes the reference between the from document and the to document identified by a reference identifier.

Parameters
----------
aReferenceIdentifier: int

Returns
-------
None
") RemoveReference;
		void RemoveReference(const Standard_Integer aReferenceIdentifier);

		/****************** RequestedComment ******************/
		/**** md5 signature: 2c8f0c5900e0c2cbeee3ca380fbc6985 ****/
		%feature("compactdefaultargs") RequestedComment;
		%feature("autodoc", "No available documentation.

Returns
-------
TCollection_ExtendedString
") RequestedComment;
		TCollection_ExtendedString RequestedComment();

		/****************** RequestedFolder ******************/
		/**** md5 signature: c8a38ab2903ef3a11e8a84768aa8c528 ****/
		%feature("compactdefaultargs") RequestedFolder;
		%feature("autodoc", "No available documentation.

Returns
-------
TCollection_ExtendedString
") RequestedFolder;
		TCollection_ExtendedString RequestedFolder();

		/****************** RequestedName ******************/
		/**** md5 signature: 4009a2976cb03e37a1f0f29540b865f5 ****/
		%feature("compactdefaultargs") RequestedName;
		%feature("autodoc", "Determines under which the document is going to be store. by default the name of the document wil be -- used. if the document has no name its presentation will be used.

Returns
-------
TCollection_ExtendedString
") RequestedName;
		TCollection_ExtendedString RequestedName();

		/****************** RequestedPreviousVersion ******************/
		/**** md5 signature: 2971d8814c0ad9cd518a42eaadb2aff4 ****/
		%feature("compactdefaultargs") RequestedPreviousVersion;
		%feature("autodoc", "No available documentation.

Returns
-------
TCollection_ExtendedString
") RequestedPreviousVersion;
		TCollection_ExtendedString RequestedPreviousVersion();

		/****************** SetComment ******************/
		/**** md5 signature: 1a203fc1f3ae6ef1999a38cc9e5f3001 ****/
		%feature("compactdefaultargs") SetComment;
		%feature("autodoc", "Associates a comment with this document.

Parameters
----------
aComment: TCollection_ExtendedString

Returns
-------
None
") SetComment;
		void SetComment(const TCollection_ExtendedString & aComment);

		/****************** SetComments ******************/
		/**** md5 signature: 9a6226c9c4e9d40c44b0c40fcfd457e5 ****/
		%feature("compactdefaultargs") SetComments;
		%feature("autodoc", "Associates a comments with this document.

Parameters
----------
aComments: TColStd_SequenceOfExtendedString

Returns
-------
None
") SetComments;
		void SetComments(const TColStd_SequenceOfExtendedString & aComments);

		/****************** SetIsReadOnly ******************/
		/**** md5 signature: 9f4f8649234a1411f6086a147fb0f5ad ****/
		%feature("compactdefaultargs") SetIsReadOnly;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") SetIsReadOnly;
		void SetIsReadOnly();

		/****************** SetIsUpToDate ******************/
		/**** md5 signature: 4cf820e27e2c2ee1a5694cc34938d213 ****/
		%feature("compactdefaultargs") SetIsUpToDate;
		%feature("autodoc", "Resets the modification counter in the given reference to the actual modification counter of its to document. this method should be called after the application has updated this document.

Parameters
----------
aReferenceIdentifier: int

Returns
-------
None
") SetIsUpToDate;
		void SetIsUpToDate(const Standard_Integer aReferenceIdentifier);

		/****************** SetMetaData ******************/
		/**** md5 signature: dc927976a3aa403aac8b90b594da511a ****/
		%feature("compactdefaultargs") SetMetaData;
		%feature("autodoc", "Associates database information to a document which has been stored. the name of the document is now the name which has beenused to store the data.

Parameters
----------
aMetaData: CDM_MetaData

Returns
-------
None
") SetMetaData;
		void SetMetaData(const opencascade::handle<CDM_MetaData> & aMetaData);

		/****************** SetModifications ******************/
		/**** md5 signature: 1d8646a65052776ce5cd54b79be20e6b ****/
		%feature("compactdefaultargs") SetModifications;
		%feature("autodoc", "No available documentation.

Parameters
----------
Modifications: int

Returns
-------
None
") SetModifications;
		void SetModifications(const Standard_Integer Modifications);

		/****************** SetReferenceCounter ******************/
		/**** md5 signature: 34d1c32056f0fedcd106c986c1fd8176 ****/
		%feature("compactdefaultargs") SetReferenceCounter;
		%feature("autodoc", "No available documentation.

Parameters
----------
aReferenceCounter: int

Returns
-------
None
") SetReferenceCounter;
		void SetReferenceCounter(const Standard_Integer aReferenceCounter);

		/****************** SetRequestedComment ******************/
		/**** md5 signature: f34268b9079cda82757c3f2978722f10 ****/
		%feature("compactdefaultargs") SetRequestedComment;
		%feature("autodoc", "Defines the comment with which the object should be stored.

Parameters
----------
aComment: TCollection_ExtendedString

Returns
-------
None
") SetRequestedComment;
		void SetRequestedComment(const TCollection_ExtendedString & aComment);

		/****************** SetRequestedFolder ******************/
		/**** md5 signature: 0957d8571358ae23729144fc08074f17 ****/
		%feature("compactdefaultargs") SetRequestedFolder;
		%feature("autodoc", "Defines the folder in which the object should be stored.

Parameters
----------
aFolder: TCollection_ExtendedString

Returns
-------
None
") SetRequestedFolder;
		void SetRequestedFolder(const TCollection_ExtendedString & aFolder);

		/****************** SetRequestedName ******************/
		/**** md5 signature: 298752a1535e4ce720f8d2943f6c93d5 ****/
		%feature("compactdefaultargs") SetRequestedName;
		%feature("autodoc", "Defines the name under which the object should be stored.

Parameters
----------
aName: TCollection_ExtendedString

Returns
-------
None
") SetRequestedName;
		void SetRequestedName(const TCollection_ExtendedString & aName);

		/****************** SetRequestedPreviousVersion ******************/
		/**** md5 signature: 1503faefc17021dc37f68166bf2a089c ****/
		%feature("compactdefaultargs") SetRequestedPreviousVersion;
		%feature("autodoc", "No available documentation.

Parameters
----------
aPreviousVersion: TCollection_ExtendedString

Returns
-------
None
") SetRequestedPreviousVersion;
		void SetRequestedPreviousVersion(const TCollection_ExtendedString & aPreviousVersion);

		/****************** ShallowReferences ******************/
		/**** md5 signature: aa297a568fbd85c49d8f09dcb24692ae ****/
		%feature("compactdefaultargs") ShallowReferences;
		%feature("autodoc", "Returns true is this document references adocument;.

Parameters
----------
aDocument: CDM_Document

Returns
-------
bool
") ShallowReferences;
		Standard_Boolean ShallowReferences(const opencascade::handle<CDM_Document> & aDocument);

		/****************** StorageFormat ******************/
		/**** md5 signature: 645330f0637961ced097e10cfe63d1a3 ****/
		%feature("compactdefaultargs") StorageFormat;
		%feature("autodoc", "The storage format is the key which is used to determine in the application resources the storage driver plugin, the file extension and other data used to store the document.

Returns
-------
TCollection_ExtendedString
") StorageFormat;
		virtual TCollection_ExtendedString StorageFormat();

		/****************** StorageFormatVersion ******************/
		/**** md5 signature: 586b4d904950a45653bf70db74ac295b ****/
		%feature("compactdefaultargs") StorageFormatVersion;
		%feature("autodoc", "Returns version of the format to be used to store the document.

Returns
-------
int
") StorageFormatVersion;
		Standard_Integer StorageFormatVersion();

		/****************** StorageVersion ******************/
		/**** md5 signature: cfa5fceedf718765fa0109d82c3e0482 ****/
		%feature("compactdefaultargs") StorageVersion;
		%feature("autodoc", "Returns the value of the modification counter at the time of storage. by default returns 0.

Returns
-------
int
") StorageVersion;
		Standard_Integer StorageVersion();

		/****************** ToReferencesNumber ******************/
		/**** md5 signature: 9ab7b7be8ebb8b32b4348f01bcfc580e ****/
		%feature("compactdefaultargs") ToReferencesNumber;
		%feature("autodoc", "Returns the number of references having this document as from document.

Returns
-------
int
") ToReferencesNumber;
		Standard_Integer ToReferencesNumber();

		/****************** UnModify ******************/
		/**** md5 signature: 176026c3fd8351d101ca2563c78a92a8 ****/
		%feature("compactdefaultargs") UnModify;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") UnModify;
		void UnModify();

		/****************** UnsetIsReadOnly ******************/
		/**** md5 signature: ad239bc1afe0a11934bb15c8844a6d1a ****/
		%feature("compactdefaultargs") UnsetIsReadOnly;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") UnsetIsReadOnly;
		void UnsetIsReadOnly();

		/****************** UnsetIsStored ******************/
		/**** md5 signature: f9ec6a01bb2ee0e5c06cb3d363b2d4b7 ****/
		%feature("compactdefaultargs") UnsetIsStored;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") UnsetIsStored;
		void UnsetIsStored();

		/****************** UnsetRequestedPreviousVersion ******************/
		/**** md5 signature: 25c4d7340344fdb157fa9bf559bb8053 ****/
		%feature("compactdefaultargs") UnsetRequestedPreviousVersion;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") UnsetRequestedPreviousVersion;
		void UnsetRequestedPreviousVersion();

		/****************** Update ******************/
		/**** md5 signature: 489e8b43103ceb1bedae872987b0cd2f ****/
		%feature("compactdefaultargs") Update;
		%feature("autodoc", "The update method will be called once for each reference, but it should not perform any computation, to avoid multiple computation of a same document.

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

		/****************** Update ******************/
		/**** md5 signature: 9fad82e8b94c706a007753d3361fc125 ****/
		%feature("compactdefaultargs") Update;
		%feature("autodoc", "This method update will be called to signal the end of the modified references list. the document should be recomputed and updatefromdocuments should be called. update should returns true in case of success, false otherwise. in case of failure, additional information can be given in errorstring.

Parameters
----------
ErrorString: TCollection_ExtendedString

Returns
-------
bool
") Update;
		virtual Standard_Boolean Update(TCollection_ExtendedString & ErrorString);

		/****************** Update ******************/
		/**** md5 signature: 39b31f53ec35285afdd1d13bf1b04e26 ****/
		%feature("compactdefaultargs") Update;
		%feature("autodoc", "The following method should be used instead: //! update(me:mutable; errorstring: out extendedstring from tcollection) returns boolean from standard.

Returns
-------
None
") Update;
		virtual void Update();

		/****************** UpdateFromDocuments ******************/
		/**** md5 signature: 2007516be66761b05006844559207c16 ****/
		%feature("compactdefaultargs") UpdateFromDocuments;
		%feature("autodoc", "Call virtual method update on all referencing documents. this method keeps the list of the -- documents to process.it may be the starting of an update -- cycle. if not, the reentrant calls made by update method (without argument) will append the referencing documents to the list and call the update method (with arguments). only the first call to updatefromdocuments generate call to update().

Parameters
----------
aModifContext: Standard_Address

Returns
-------
None
") UpdateFromDocuments;
		void UpdateFromDocuments(const Standard_Address aModifContext);

};


%make_alias(CDM_Document)

%extend CDM_Document {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************
* class CDM_MetaData *
*********************/
%nodefaultctor CDM_MetaData;
class CDM_MetaData : public Standard_Transient {
	public:
		/****************** Document ******************/
		/**** md5 signature: e16dc9e733287c94251ebd2305fccdda ****/
		%feature("compactdefaultargs") Document;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<CDM_Document>
") Document;
		opencascade::handle<CDM_Document> Document();

		/****************** FileName ******************/
		/**** md5 signature: 55453540d5ecaade8ddcde5846f5b88f ****/
		%feature("compactdefaultargs") FileName;
		%feature("autodoc", "No available documentation.

Returns
-------
TCollection_ExtendedString
") FileName;
		TCollection_ExtendedString FileName();

		/****************** Folder ******************/
		/**** md5 signature: 6e4f71ec7a138611fba2655a4d9e2a6c ****/
		%feature("compactdefaultargs") Folder;
		%feature("autodoc", "Returns the folder in which the meta-data has to be created or has to be found.

Returns
-------
TCollection_ExtendedString
") Folder;
		TCollection_ExtendedString Folder();

		/****************** HasVersion ******************/
		/**** md5 signature: bb5780573c7c237fa50d67bc9fae80aa ****/
		%feature("compactdefaultargs") HasVersion;
		%feature("autodoc", "Indicates that the version has to be taken into account when searching the corresponding meta-data.

Returns
-------
bool
") HasVersion;
		Standard_Boolean HasVersion();

		/****************** IsReadOnly ******************/
		/**** md5 signature: fa96cbb7774919470076f35f8b884f77 ****/
		%feature("compactdefaultargs") IsReadOnly;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsReadOnly;
		Standard_Boolean IsReadOnly();

		/****************** IsRetrieved ******************/
		/**** md5 signature: 23effb2d4afa2a6e9b927e4ae98051f1 ****/
		%feature("compactdefaultargs") IsRetrieved;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsRetrieved;
		Standard_Boolean IsRetrieved();

		/****************** LookUp ******************/
		/**** md5 signature: acd4ccf23f5580e0aa0c735f63f9ed71 ****/
		%feature("compactdefaultargs") LookUp;
		%feature("autodoc", "No available documentation.

Parameters
----------
aFolder: TCollection_ExtendedString
aName: TCollection_ExtendedString
aPath: TCollection_ExtendedString
aFileName: TCollection_ExtendedString
ReadOnly: bool

Returns
-------
opencascade::handle<CDM_MetaData>
") LookUp;
		static opencascade::handle<CDM_MetaData> LookUp(const TCollection_ExtendedString & aFolder, const TCollection_ExtendedString & aName, const TCollection_ExtendedString & aPath, const TCollection_ExtendedString & aFileName, const Standard_Boolean ReadOnly);

		/****************** LookUp ******************/
		/**** md5 signature: 30d809e75056ca5d0fe5999d7d10ac10 ****/
		%feature("compactdefaultargs") LookUp;
		%feature("autodoc", "No available documentation.

Parameters
----------
aFolder: TCollection_ExtendedString
aName: TCollection_ExtendedString
aPath: TCollection_ExtendedString
aVersion: TCollection_ExtendedString
aFileName: TCollection_ExtendedString
ReadOnly: bool

Returns
-------
opencascade::handle<CDM_MetaData>
") LookUp;
		static opencascade::handle<CDM_MetaData> LookUp(const TCollection_ExtendedString & aFolder, const TCollection_ExtendedString & aName, const TCollection_ExtendedString & aPath, const TCollection_ExtendedString & aVersion, const TCollection_ExtendedString & aFileName, const Standard_Boolean ReadOnly);

		/****************** Name ******************/
		/**** md5 signature: a9e55299a1405b3a2863469f1a67f9cd ****/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "Returns the name under which the meta-data has to be created or has to be found.

Returns
-------
TCollection_ExtendedString
") Name;
		TCollection_ExtendedString Name();

		/****************** Path ******************/
		/**** md5 signature: f6c1194d39f76de7fb92f5471518f512 ****/
		%feature("compactdefaultargs") Path;
		%feature("autodoc", "No available documentation.

Returns
-------
TCollection_ExtendedString
") Path;
		TCollection_ExtendedString Path();


        %feature("autodoc", "1");
        %extend{
            std::string PrintToString() {
            std::stringstream s;
            self->Print(s);
            return s.str();}
        };
		/****************** SetIsReadOnly ******************/
		/**** md5 signature: 9f4f8649234a1411f6086a147fb0f5ad ****/
		%feature("compactdefaultargs") SetIsReadOnly;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") SetIsReadOnly;
		void SetIsReadOnly();

		/****************** UnsetDocument ******************/
		/**** md5 signature: d023d84ac523885764cfd5d5732edb98 ****/
		%feature("compactdefaultargs") UnsetDocument;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") UnsetDocument;
		void UnsetDocument();

		/****************** UnsetIsReadOnly ******************/
		/**** md5 signature: ad239bc1afe0a11934bb15c8844a6d1a ****/
		%feature("compactdefaultargs") UnsetIsReadOnly;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") UnsetIsReadOnly;
		void UnsetIsReadOnly();

		/****************** Version ******************/
		/**** md5 signature: 82a6659ee5865225bff1f5a6263d6ca8 ****/
		%feature("compactdefaultargs") Version;
		%feature("autodoc", "Returns the version under which the meta-data has to be found. warning: raises nosuchobject from standard if no version has been defined.

Returns
-------
TCollection_ExtendedString
") Version;
		TCollection_ExtendedString Version();

};


%make_alias(CDM_MetaData)

%extend CDM_MetaData {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************
* class CDM_Reference *
**********************/
%nodefaultctor CDM_Reference;
class CDM_Reference : public Standard_Transient {
	public:
		/****************** DocumentVersion ******************/
		/**** md5 signature: bf19019d65def7107fbf722b45605af2 ****/
		%feature("compactdefaultargs") DocumentVersion;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") DocumentVersion;
		Standard_Integer DocumentVersion();

		/****************** FromDocument ******************/
		/**** md5 signature: 074d50b6a0fbd464042f670a2a5d9430 ****/
		%feature("compactdefaultargs") FromDocument;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<CDM_Document>
") FromDocument;
		opencascade::handle<CDM_Document> FromDocument();

		/****************** IsReadOnly ******************/
		/**** md5 signature: fa96cbb7774919470076f35f8b884f77 ****/
		%feature("compactdefaultargs") IsReadOnly;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsReadOnly;
		Standard_Boolean IsReadOnly();

		/****************** ReferenceIdentifier ******************/
		/**** md5 signature: 3aa5e98e8d6049efe315cf6d973322f8 ****/
		%feature("compactdefaultargs") ReferenceIdentifier;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") ReferenceIdentifier;
		Standard_Integer ReferenceIdentifier();

		/****************** ToDocument ******************/
		/**** md5 signature: 3cdc7a527106d97d66a66516fc680b2d ****/
		%feature("compactdefaultargs") ToDocument;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<CDM_Document>
") ToDocument;
		opencascade::handle<CDM_Document> ToDocument();

};


%make_alias(CDM_Reference)

%extend CDM_Reference {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************
* class CDM_ReferenceIterator *
******************************/
class CDM_ReferenceIterator {
	public:
		/****************** CDM_ReferenceIterator ******************/
		/**** md5 signature: ac629575b6c6ce3e0dda06341cd98b11 ****/
		%feature("compactdefaultargs") CDM_ReferenceIterator;
		%feature("autodoc", "No available documentation.

Parameters
----------
aDocument: CDM_Document

Returns
-------
None
") CDM_ReferenceIterator;
		 CDM_ReferenceIterator(const opencascade::handle<CDM_Document> & aDocument);

		/****************** Document ******************/
		/**** md5 signature: e16dc9e733287c94251ebd2305fccdda ****/
		%feature("compactdefaultargs") Document;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<CDM_Document>
") Document;
		opencascade::handle<CDM_Document> Document();

		/****************** DocumentVersion ******************/
		/**** md5 signature: bf19019d65def7107fbf722b45605af2 ****/
		%feature("compactdefaultargs") DocumentVersion;
		%feature("autodoc", "Returns the document version in the reference.

Returns
-------
int
") DocumentVersion;
		Standard_Integer DocumentVersion();

		/****************** More ******************/
		/**** md5 signature: 6f6e915c9a3dca758c059d9e8af02dff ****/
		%feature("compactdefaultargs") More;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") More;
		Standard_Boolean More();

		/****************** Next ******************/
		/**** md5 signature: f35c0df5f1d7c877986db18081404532 ****/
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Next;
		void Next();

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


%extend CDM_ReferenceIterator {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/* harray1 classes */
/* harray2 classes */
/* hsequence classes */
