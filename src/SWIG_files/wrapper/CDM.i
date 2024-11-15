/*
Copyright 2008-2024 Thomas Paviot (tpaviot@gmail.com)

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
https://dev.opencascade.org/doc/occt-7.8.0/refman/html/package_cdm.html"
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
%include ../common/EnumTemplates.i
%include ../common/Operators.i
%include ../common/OccHandle.i
%include ../common/IOStream.i
%include ../common/ArrayMacros.i


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

/* python proxy classes for enums */
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
%template(CDM_MapOfDocument) NCollection_Map<opencascade::handle<CDM_Document>>;
%template(CDM_MetaDataLookUpTable) NCollection_DataMap<TCollection_ExtendedString,opencascade::handle<CDM_MetaData>>;
/* end templates declaration */

/* typedefs */
typedef NCollection_DataMap<TCollection_ExtendedString, opencascade::handle<CDM_MetaData>>::Iterator CDM_DataMapIteratorOfMetaDataLookUpTable;
typedef CDM_Document * CDM_DocumentPointer;
typedef NCollection_List<opencascade::handle<CDM_Document>>::Iterator CDM_ListIteratorOfListOfDocument;
typedef NCollection_List<opencascade::handle<CDM_Reference>>::Iterator CDM_ListIteratorOfListOfReferences;
typedef NCollection_List<opencascade::handle<CDM_Document>> CDM_ListOfDocument;
typedef NCollection_List<opencascade::handle<CDM_Reference>> CDM_ListOfReferences;
typedef NCollection_Map<opencascade::handle<CDM_Document>>::Iterator CDM_MapIteratorOfMapOfDocument;
typedef NCollection_Map<opencascade::handle<CDM_Document>> CDM_MapOfDocument;
typedef NCollection_DataMap<TCollection_ExtendedString, opencascade::handle<CDM_MetaData>> CDM_MetaDataLookUpTable;
typedef TColStd_DataMapOfStringInteger CDM_NamesDirectory;
/* end typedefs declaration */

/************************
* class CDM_Application *
************************/
%nodefaultctor CDM_Application;
class CDM_Application : public Standard_Transient {
	public:
		/****** CDM_Application::BeginOfUpdate ******/
		/****** md5 signature: 0af0b7d32d1a2f5708cb026b8c02ce44 ******/
		%feature("compactdefaultargs") BeginOfUpdate;
		%feature("autodoc", "
Parameters
----------
aDocument: CDM_Document

Return
-------
None

Description
-----------
This method is called before the update of a document. by default, writes in messagedriver().
") BeginOfUpdate;
		virtual void BeginOfUpdate(const opencascade::handle<CDM_Document> & aDocument);


        /****************** DumpJson ******************/
        %feature("autodoc", "
Parameters
----------
depth: int, default=-1

Return
-------
str

Description
-----------
Dump the object to JSON string.
") DumpJson;
        %extend{
            std::string DumpJson(int depth=-1) {
            std::stringstream s;
            self->DumpJson(s, depth);
            return "{" + s.str() + "}" ;}
        };
		/****** CDM_Application::EndOfUpdate ******/
		/****** md5 signature: 1300f7eaea13e12939c9e78edc2d7e82 ******/
		%feature("compactdefaultargs") EndOfUpdate;
		%feature("autodoc", "
Parameters
----------
aDocument: CDM_Document
theStatus: bool
ErrorString: str

Return
-------
None

Description
-----------
This method is called affter the update of a document. by default, writes in messagedriver().
") EndOfUpdate;
		virtual void EndOfUpdate(const opencascade::handle<CDM_Document> & aDocument, const Standard_Boolean theStatus, TCollection_ExtendedString ErrorString);

		/****** CDM_Application::MessageDriver ******/
		/****** md5 signature: 9c7cdb55e9a82d7cef41788491b5a1ec ******/
		%feature("compactdefaultargs") MessageDriver;
		%feature("autodoc", "Return
-------
opencascade::handle<Message_Messenger>

Description
-----------
Returns default messenger;.
") MessageDriver;
		virtual opencascade::handle<Message_Messenger> MessageDriver();

		/****** CDM_Application::MetaDataLookUpTable ******/
		/****** md5 signature: a73a07c624cf8f3d04f8c1775645863c ******/
		%feature("compactdefaultargs") MetaDataLookUpTable;
		%feature("autodoc", "Return
-------
CDM_MetaDataLookUpTable

Description
-----------
Returns metadata lookuptable.
") MetaDataLookUpTable;
		virtual CDM_MetaDataLookUpTable & MetaDataLookUpTable();

		/****** CDM_Application::Name ******/
		/****** md5 signature: 80292bf2fe0db1e304d129c2054da361 ******/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "Return
-------
TCollection_ExtendedString

Description
-----------
Returns the application name.
") Name;
		virtual TCollection_ExtendedString Name();

		/****** CDM_Application::Resources ******/
		/****** md5 signature: 807a657145c6d6be6b1fcc9cf2d99f89 ******/
		%feature("compactdefaultargs") Resources;
		%feature("autodoc", "Return
-------
opencascade::handle<Resource_Manager>

Description
-----------
The manager returned by this virtual method will be used to search for format.retrieval resource items.
") Resources;
		virtual opencascade::handle<Resource_Manager> Resources();

		/****** CDM_Application::Version ******/
		/****** md5 signature: f0502fbab556d6295e4fc793720e980f ******/
		%feature("compactdefaultargs") Version;
		%feature("autodoc", "Return
-------
TCollection_AsciiString

Description
-----------
Returns the application version.
") Version;
		virtual TCollection_AsciiString Version();

		/****** CDM_Application::Write ******/
		/****** md5 signature: 53ecbdb2e873292857c5aac0b98f58b3 ******/
		%feature("compactdefaultargs") Write;
		%feature("autodoc", "
Parameters
----------
aString: Standard_ExtString

Return
-------
None

Description
-----------
Writes the string in the application messagerdriver.
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
		/****** CDM_Document::AddComment ******/
		/****** md5 signature: 06c808db266b5347e2900c1f468bea31 ******/
		%feature("compactdefaultargs") AddComment;
		%feature("autodoc", "
Parameters
----------
aComment: str

Return
-------
None

Description
-----------
Appends a comment into comments of this document.
") AddComment;
		void AddComment(TCollection_ExtendedString aComment);

		/****** CDM_Document::Application ******/
		/****** md5 signature: 64aab7c43cb82115fa37ae0c99da8f75 ******/
		%feature("compactdefaultargs") Application;
		%feature("autodoc", "Return
-------
opencascade::handle<CDM_Application>

Description
-----------
No available documentation.
") Application;
		const opencascade::handle<CDM_Application> & Application();

		/****** CDM_Document::CanClose ******/
		/****** md5 signature: d92aa68a8f8c78b75ae7c150bd4a2d5b ******/
		%feature("compactdefaultargs") CanClose;
		%feature("autodoc", "Return
-------
CDM_CanCloseStatus

Description
-----------
No available documentation.
") CanClose;
		CDM_CanCloseStatus CanClose();

		/****** CDM_Document::CanCloseReference ******/
		/****** md5 signature: 1140aead780f6c5f5344930b6e6db09b ******/
		%feature("compactdefaultargs") CanCloseReference;
		%feature("autodoc", "
Parameters
----------
aDocument: CDM_Document
aReferenceIdentifier: int

Return
-------
bool

Description
-----------
A referenced document may indicate through this virtual method that it does not allow the closing of adocument which it references through the reference areferenceidentifier. by default returns standard_true.
") CanCloseReference;
		virtual Standard_Boolean CanCloseReference(const opencascade::handle<CDM_Document> & aDocument, const Standard_Integer aReferenceIdentifier);

		/****** CDM_Document::Close ******/
		/****** md5 signature: d50d7ba65c2beb3eb436584b5735f108 ******/
		%feature("compactdefaultargs") Close;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Close;
		void Close();

		/****** CDM_Document::CloseReference ******/
		/****** md5 signature: 6864eb1b746e4174e03f6398e4a62e45 ******/
		%feature("compactdefaultargs") CloseReference;
		%feature("autodoc", "
Parameters
----------
aDocument: CDM_Document
aReferenceIdentifier: int

Return
-------
None

Description
-----------
A referenced document may update its internal data structure when {adocument} which it references through the reference {areferenceidentifier} is being closed. by default this method does nothing.
") CloseReference;
		virtual void CloseReference(const opencascade::handle<CDM_Document> & aDocument, const Standard_Integer aReferenceIdentifier);

		/****** CDM_Document::Comment ******/
		/****** md5 signature: da330a9b0b5e37badd51cb0b90f32906 ******/
		%feature("compactdefaultargs") Comment;
		%feature("autodoc", "Return
-------
Standard_ExtString

Description
-----------
Returns the first of associated comments. by default the comment is an empty string.
") Comment;
		Standard_ExtString Comment();

		/****** CDM_Document::Comments ******/
		/****** md5 signature: d097d5458a50345161ad38ca79347c2b ******/
		%feature("compactdefaultargs") Comments;
		%feature("autodoc", "
Parameters
----------
aComments: TColStd_SequenceOfExtendedString

Return
-------
None

Description
-----------
Returns the associated comments through <acomments>. returns empty sequence if no comments are associated.
") Comments;
		void Comments(TColStd_SequenceOfExtendedString & aComments);

		/****** CDM_Document::CopyReference ******/
		/****** md5 signature: f5014e895ae3cfcd8f2a7732865706b9 ******/
		%feature("compactdefaultargs") CopyReference;
		%feature("autodoc", "
Parameters
----------
aFromDocument: CDM_Document
aReferenceIdentifier: int

Return
-------
int

Description
-----------
Copies a reference to this document. this method avoid retrieval of referenced document. the arguments are the original document and a valid reference identifier returns the local identifier.
") CopyReference;
		Standard_Integer CopyReference(const opencascade::handle<CDM_Document> & aFromDocument, const Standard_Integer aReferenceIdentifier);

		/****** CDM_Document::CreateReference ******/
		/****** md5 signature: 70b61347a0dba1031a37a4d6a4f096fc ******/
		%feature("compactdefaultargs") CreateReference;
		%feature("autodoc", "
Parameters
----------
anOtherDocument: CDM_Document

Return
-------
int

Description
-----------
Creates a reference from this document to {anotherdocument}. returns a reference identifier. this reference identifier is unique in the document and will not be used for the next references, even after the storing of the document. if there is already a reference between the two documents, the reference is not created, but its reference identifier is returned.
") CreateReference;
		Standard_Integer CreateReference(const opencascade::handle<CDM_Document> & anOtherDocument);

		/****** CDM_Document::CreateReference ******/
		/****** md5 signature: 9a9061502dbb1319ebf6c20b8c206a40 ******/
		%feature("compactdefaultargs") CreateReference;
		%feature("autodoc", "
Parameters
----------
aMetaData: CDM_MetaData
aReferenceIdentifier: int
anApplication: CDM_Application
aToDocumentVersion: int
UseStorageConfiguration: bool

Return
-------
None

Description
-----------
No available documentation.
") CreateReference;
		void CreateReference(const opencascade::handle<CDM_MetaData> & aMetaData, const Standard_Integer aReferenceIdentifier, const opencascade::handle<CDM_Application> & anApplication, const Standard_Integer aToDocumentVersion, const Standard_Boolean UseStorageConfiguration);

		/****** CDM_Document::CreateReference ******/
		/****** md5 signature: 73155220bf15097893e98eeaa6c45625 ******/
		%feature("compactdefaultargs") CreateReference;
		%feature("autodoc", "
Parameters
----------
aMetaData: CDM_MetaData
anApplication: CDM_Application
aDocumentVersion: int
UseStorageConfiguration: bool

Return
-------
int

Description
-----------
No available documentation.
") CreateReference;
		Standard_Integer CreateReference(const opencascade::handle<CDM_MetaData> & aMetaData, const opencascade::handle<CDM_Application> & anApplication, const Standard_Integer aDocumentVersion, const Standard_Boolean UseStorageConfiguration);

		/****** CDM_Document::DeepReferences ******/
		/****** md5 signature: e16f988328ffa73c1ca387730b2190fa ******/
		%feature("compactdefaultargs") DeepReferences;
		%feature("autodoc", "
Parameters
----------
aDocument: CDM_Document

Return
-------
bool

Description
-----------
Returns true is this document references adocument;.
") DeepReferences;
		Standard_Boolean DeepReferences(const opencascade::handle<CDM_Document> & aDocument);

		/****** CDM_Document::Description ******/
		/****** md5 signature: 4ea5e8b06a38637bc4a4e6f3a5b7d927 ******/
		%feature("compactdefaultargs") Description;
		%feature("autodoc", "Return
-------
TCollection_ExtendedString

Description
-----------
Gets the `fileformat`.description resource.
") Description;
		TCollection_ExtendedString Description();

		/****** CDM_Document::Document ******/
		/****** md5 signature: 8eb99c67c36b1fb3f295093dbdfd69cc ******/
		%feature("compactdefaultargs") Document;
		%feature("autodoc", "
Parameters
----------
aReferenceIdentifier: int

Return
-------
opencascade::handle<CDM_Document>

Description
-----------
Returns the to document of the reference identified by areferenceidentifier. if the todocument is stored and has not yet been retrieved, this method will retrieve it.
") Document;
		opencascade::handle<CDM_Document> Document(const Standard_Integer aReferenceIdentifier);


        /****************** DumpJson ******************/
        %feature("autodoc", "
Parameters
----------
depth: int, default=-1

Return
-------
str

Description
-----------
Dump the object to JSON string.
") DumpJson;
        %extend{
            std::string DumpJson(int depth=-1) {
            std::stringstream s;
            self->DumpJson(s, depth);
            return "{" + s.str() + "}" ;}
        };
		/****** CDM_Document::Extensions ******/
		/****** md5 signature: 562af3bed83550e86f6e9f1cc27905e7 ******/
		%feature("compactdefaultargs") Extensions;
		%feature("autodoc", "
Parameters
----------
Extensions: TColStd_SequenceOfExtendedString

Return
-------
None

Description
-----------
By default empties the extensions.
") Extensions;
		virtual void Extensions(TColStd_SequenceOfExtendedString & Extensions);

		/****** CDM_Document::FileExtension ******/
		/****** md5 signature: dc32da120ea382590e37e02d5e00fb9e ******/
		%feature("compactdefaultargs") FileExtension;
		%feature("autodoc", "Return
-------
TCollection_ExtendedString

Description
-----------
Gets the desktop.domain.application.`fileformat`.fileextension resource.
") FileExtension;
		TCollection_ExtendedString FileExtension();

		/****** CDM_Document::FindDescription ******/
		/****** md5 signature: af3bb67c33b1f02d6f772909eee92676 ******/
		%feature("compactdefaultargs") FindDescription;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") FindDescription;
		Standard_Boolean FindDescription();

		/****** CDM_Document::FindFileExtension ******/
		/****** md5 signature: 8f91e8289675fe02ffd3f710fad4831b ******/
		%feature("compactdefaultargs") FindFileExtension;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") FindFileExtension;
		Standard_Boolean FindFileExtension();

		/****** CDM_Document::Folder ******/
		/****** md5 signature: 6e4f71ec7a138611fba2655a4d9e2a6c ******/
		%feature("compactdefaultargs") Folder;
		%feature("autodoc", "Return
-------
TCollection_ExtendedString

Description
-----------
No available documentation.
") Folder;
		TCollection_ExtendedString Folder();

		/****** CDM_Document::FromReferencesNumber ******/
		/****** md5 signature: 25816b3f96b43878489f4e6d996dc26a ******/
		%feature("compactdefaultargs") FromReferencesNumber;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of references having this document as to document.
") FromReferencesNumber;
		Standard_Integer FromReferencesNumber();

		/****** CDM_Document::GetAlternativeDocument ******/
		/****** md5 signature: 932a6b6d84c79c3da90d4ce47bf5554d ******/
		%feature("compactdefaultargs") GetAlternativeDocument;
		%feature("autodoc", "
Parameters
----------
aFormat: str
anAlternativeDocument: CDM_Document

Return
-------
bool

Description
-----------
This method can be redefined to extract another document in a different format. for example, to extract a shape from an applicative document.
") GetAlternativeDocument;
		virtual Standard_Boolean GetAlternativeDocument(TCollection_ExtendedString aFormat, opencascade::handle<CDM_Document> & anAlternativeDocument);

		/****** CDM_Document::HasRequestedFolder ******/
		/****** md5 signature: da91e14ce6ae50fe9ebda6e45778d6fc ******/
		%feature("compactdefaultargs") HasRequestedFolder;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") HasRequestedFolder;
		Standard_Boolean HasRequestedFolder();

		/****** CDM_Document::HasRequestedPreviousVersion ******/
		/****** md5 signature: 016d0ffafe8cf6beb45d2f56183bddfe ******/
		%feature("compactdefaultargs") HasRequestedPreviousVersion;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") HasRequestedPreviousVersion;
		Standard_Boolean HasRequestedPreviousVersion();

		/****** CDM_Document::IsInSession ******/
		/****** md5 signature: 55aa5c1a1cd34e6b278620a607aed883 ******/
		%feature("compactdefaultargs") IsInSession;
		%feature("autodoc", "
Parameters
----------
aReferenceIdentifier: int

Return
-------
bool

Description
-----------
Returns true if the to document of the reference identified by areferenceidentifier is in session, false if it corresponds to a not yet retrieved document.
") IsInSession;
		Standard_Boolean IsInSession(const Standard_Integer aReferenceIdentifier);

		/****** CDM_Document::IsModified ******/
		/****** md5 signature: 9c75f71ece8c473c12f072739ddc9f63 ******/
		%feature("compactdefaultargs") IsModified;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if the version is greater than the storage version.
") IsModified;
		Standard_Boolean IsModified();

		/****** CDM_Document::IsOpened ******/
		/****** md5 signature: 523448479755dd859d720fcc78551e3d ******/
		%feature("compactdefaultargs") IsOpened;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsOpened;
		Standard_Boolean IsOpened();

		/****** CDM_Document::IsOpened ******/
		/****** md5 signature: 9876c2f350454b050aaab9f4f47c295b ******/
		%feature("compactdefaultargs") IsOpened;
		%feature("autodoc", "
Parameters
----------
aReferenceIdentifier: int

Return
-------
bool

Description
-----------
Returns true if the document corresponding to the given reference has been retrieved and opened. otherwise returns false. this method does not retrieve the referenced document.
") IsOpened;
		Standard_Boolean IsOpened(const Standard_Integer aReferenceIdentifier);

		/****** CDM_Document::IsReadOnly ******/
		/****** md5 signature: fa96cbb7774919470076f35f8b884f77 ******/
		%feature("compactdefaultargs") IsReadOnly;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Indicates that this document cannot be modified.
") IsReadOnly;
		Standard_Boolean IsReadOnly();

		/****** CDM_Document::IsReadOnly ******/
		/****** md5 signature: 4c358cefb201e05add20e7ea214cab46 ******/
		%feature("compactdefaultargs") IsReadOnly;
		%feature("autodoc", "
Parameters
----------
aReferenceIdentifier: int

Return
-------
bool

Description
-----------
Indicates that the referenced document cannot be modified,.
") IsReadOnly;
		Standard_Boolean IsReadOnly(const Standard_Integer aReferenceIdentifier);

		/****** CDM_Document::IsStored ******/
		/****** md5 signature: 2a9c914c3ea53a7b0112d3f96174940d ******/
		%feature("compactdefaultargs") IsStored;
		%feature("autodoc", "
Parameters
----------
aReferenceIdentifier: int

Return
-------
bool

Description
-----------
Returns true if the to document of the reference identified by areferenceidentifier has already been stored, false otherwise.
") IsStored;
		Standard_Boolean IsStored(const Standard_Integer aReferenceIdentifier);

		/****** CDM_Document::IsStored ******/
		/****** md5 signature: 0accc82ecbcf65967dcdbcbc0b39163c ******/
		%feature("compactdefaultargs") IsStored;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsStored;
		Standard_Boolean IsStored();

		/****** CDM_Document::IsUpToDate ******/
		/****** md5 signature: 452911df138a97af1629dc6e74872cce ******/
		%feature("compactdefaultargs") IsUpToDate;
		%feature("autodoc", "
Parameters
----------
aReferenceIdentifier: int

Return
-------
bool

Description
-----------
Returns true if the modification counter found in the given reference is equal to the actual modification counter of the to document. this method is able to deal with a reference to a not retrieved document.
") IsUpToDate;
		Standard_Boolean IsUpToDate(const Standard_Integer aReferenceIdentifier);

		/****** CDM_Document::LoadResources ******/
		/****** md5 signature: e42c9588671d5e90c5bd95f9735418c2 ******/
		%feature("compactdefaultargs") LoadResources;
		%feature("autodoc", "Return
-------
None

Description
-----------
Read (or rereads) the following resource.
") LoadResources;
		void LoadResources();

		/****** CDM_Document::MetaData ******/
		/****** md5 signature: c9a180852f421cb9762c9ab4be4b79ab ******/
		%feature("compactdefaultargs") MetaData;
		%feature("autodoc", "Return
-------
opencascade::handle<CDM_MetaData>

Description
-----------
No available documentation.
") MetaData;
		opencascade::handle<CDM_MetaData> MetaData();

		/****** CDM_Document::Modifications ******/
		/****** md5 signature: 3724ba0881224cbd02f10fd6280917aa ******/
		%feature("compactdefaultargs") Modifications;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the current modification counter.
") Modifications;
		Standard_Integer Modifications();

		/****** CDM_Document::Modify ******/
		/****** md5 signature: 44fbaa7237dd1010519534b2d6fc44f0 ******/
		%feature("compactdefaultargs") Modify;
		%feature("autodoc", "Return
-------
None

Description
-----------
Indicates that this document has been modified. this method increments the modification counter.
") Modify;
		void Modify();

		/****** CDM_Document::Name ******/
		/****** md5 signature: c5a61ad170fbf4cb3eaba703b96b3427 ******/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "
Parameters
----------
aReferenceIdentifier: int

Return
-------
TCollection_ExtendedString

Description
-----------
Returns the name of the metadata of the to document of the reference identified by areferenceidentifier.
") Name;
		TCollection_ExtendedString Name(const Standard_Integer aReferenceIdentifier);

		/****** CDM_Document::Open ******/
		/****** md5 signature: f1ab173c076c622888436649c485a8d3 ******/
		%feature("compactdefaultargs") Open;
		%feature("autodoc", "
Parameters
----------
anApplication: CDM_Application

Return
-------
None

Description
-----------
No available documentation.
") Open;
		void Open(const opencascade::handle<CDM_Application> & anApplication);

		/****** CDM_Document::Print ******/
		/****** md5 signature: fb65164879bb8268c90b67d68359a682 ******/
		%feature("compactdefaultargs") Print;
		%feature("autodoc", "
Parameters
----------

Return
-------
anOStream: Standard_OStream

Description
-----------
No available documentation.
") Print;
		Standard_OStream & Print(std::ostream &OutValue);

		/****** CDM_Document::Reference ******/
		/****** md5 signature: 8fb9128b48e5f8568694a49ff83331ff ******/
		%feature("compactdefaultargs") Reference;
		%feature("autodoc", "
Parameters
----------
aReferenceIdentifier: int

Return
-------
opencascade::handle<CDM_Reference>

Description
-----------
No available documentation.
") Reference;
		opencascade::handle<CDM_Reference> Reference(const Standard_Integer aReferenceIdentifier);

		/****** CDM_Document::ReferenceCounter ******/
		/****** md5 signature: 47d083a8fd4b8a72bd6f39ed448e103e ******/
		%feature("compactdefaultargs") ReferenceCounter;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") ReferenceCounter;
		Standard_Integer ReferenceCounter();

		/****** CDM_Document::RemoveAllReferences ******/
		/****** md5 signature: 6b9e122ba37998fb6a05a073acdd9b92 ******/
		%feature("compactdefaultargs") RemoveAllReferences;
		%feature("autodoc", "Return
-------
None

Description
-----------
Removes all references having this document for from document.
") RemoveAllReferences;
		void RemoveAllReferences();

		/****** CDM_Document::RemoveReference ******/
		/****** md5 signature: 4529742436960f07b87af71b701a2171 ******/
		%feature("compactdefaultargs") RemoveReference;
		%feature("autodoc", "
Parameters
----------
aReferenceIdentifier: int

Return
-------
None

Description
-----------
Removes the reference between the from document and the to document identified by a reference identifier.
") RemoveReference;
		void RemoveReference(const Standard_Integer aReferenceIdentifier);

		/****** CDM_Document::RequestedComment ******/
		/****** md5 signature: 2c8f0c5900e0c2cbeee3ca380fbc6985 ******/
		%feature("compactdefaultargs") RequestedComment;
		%feature("autodoc", "Return
-------
TCollection_ExtendedString

Description
-----------
No available documentation.
") RequestedComment;
		TCollection_ExtendedString RequestedComment();

		/****** CDM_Document::RequestedFolder ******/
		/****** md5 signature: c8a38ab2903ef3a11e8a84768aa8c528 ******/
		%feature("compactdefaultargs") RequestedFolder;
		%feature("autodoc", "Return
-------
TCollection_ExtendedString

Description
-----------
No available documentation.
") RequestedFolder;
		TCollection_ExtendedString RequestedFolder();

		/****** CDM_Document::RequestedName ******/
		/****** md5 signature: 4009a2976cb03e37a1f0f29540b865f5 ******/
		%feature("compactdefaultargs") RequestedName;
		%feature("autodoc", "Return
-------
TCollection_ExtendedString

Description
-----------
Determines under which the document is going to be store. by default the name of the document will be used. if the document has no name its presentation will be used.
") RequestedName;
		TCollection_ExtendedString RequestedName();

		/****** CDM_Document::RequestedPreviousVersion ******/
		/****** md5 signature: 2971d8814c0ad9cd518a42eaadb2aff4 ******/
		%feature("compactdefaultargs") RequestedPreviousVersion;
		%feature("autodoc", "Return
-------
TCollection_ExtendedString

Description
-----------
No available documentation.
") RequestedPreviousVersion;
		TCollection_ExtendedString RequestedPreviousVersion();

		/****** CDM_Document::SetComment ******/
		/****** md5 signature: 1a203fc1f3ae6ef1999a38cc9e5f3001 ******/
		%feature("compactdefaultargs") SetComment;
		%feature("autodoc", "
Parameters
----------
aComment: str

Return
-------
None

Description
-----------
Associates a comment with this document.
") SetComment;
		void SetComment(TCollection_ExtendedString aComment);

		/****** CDM_Document::SetComments ******/
		/****** md5 signature: 9a6226c9c4e9d40c44b0c40fcfd457e5 ******/
		%feature("compactdefaultargs") SetComments;
		%feature("autodoc", "
Parameters
----------
aComments: TColStd_SequenceOfExtendedString

Return
-------
None

Description
-----------
Associates a comments with this document.
") SetComments;
		void SetComments(const TColStd_SequenceOfExtendedString & aComments);

		/****** CDM_Document::SetIsReadOnly ******/
		/****** md5 signature: 9f4f8649234a1411f6086a147fb0f5ad ******/
		%feature("compactdefaultargs") SetIsReadOnly;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") SetIsReadOnly;
		void SetIsReadOnly();

		/****** CDM_Document::SetIsUpToDate ******/
		/****** md5 signature: 4cf820e27e2c2ee1a5694cc34938d213 ******/
		%feature("compactdefaultargs") SetIsUpToDate;
		%feature("autodoc", "
Parameters
----------
aReferenceIdentifier: int

Return
-------
None

Description
-----------
Resets the modification counter in the given reference to the actual modification counter of its to document. this method should be called after the application has updated this document.
") SetIsUpToDate;
		void SetIsUpToDate(const Standard_Integer aReferenceIdentifier);

		/****** CDM_Document::SetMetaData ******/
		/****** md5 signature: dc927976a3aa403aac8b90b594da511a ******/
		%feature("compactdefaultargs") SetMetaData;
		%feature("autodoc", "
Parameters
----------
aMetaData: CDM_MetaData

Return
-------
None

Description
-----------
Associates database information to a document which has been stored. the name of the document is now the name which has beenused to store the data.
") SetMetaData;
		void SetMetaData(const opencascade::handle<CDM_MetaData> & aMetaData);

		/****** CDM_Document::SetModifications ******/
		/****** md5 signature: 1d8646a65052776ce5cd54b79be20e6b ******/
		%feature("compactdefaultargs") SetModifications;
		%feature("autodoc", "
Parameters
----------
Modifications: int

Return
-------
None

Description
-----------
No available documentation.
") SetModifications;
		void SetModifications(const Standard_Integer Modifications);

		/****** CDM_Document::SetReferenceCounter ******/
		/****** md5 signature: 34d1c32056f0fedcd106c986c1fd8176 ******/
		%feature("compactdefaultargs") SetReferenceCounter;
		%feature("autodoc", "
Parameters
----------
aReferenceCounter: int

Return
-------
None

Description
-----------
No available documentation.
") SetReferenceCounter;
		void SetReferenceCounter(const Standard_Integer aReferenceCounter);

		/****** CDM_Document::SetRequestedComment ******/
		/****** md5 signature: f34268b9079cda82757c3f2978722f10 ******/
		%feature("compactdefaultargs") SetRequestedComment;
		%feature("autodoc", "
Parameters
----------
aComment: str

Return
-------
None

Description
-----------
Defines the comment with which the object should be stored.
") SetRequestedComment;
		void SetRequestedComment(TCollection_ExtendedString aComment);

		/****** CDM_Document::SetRequestedFolder ******/
		/****** md5 signature: 0957d8571358ae23729144fc08074f17 ******/
		%feature("compactdefaultargs") SetRequestedFolder;
		%feature("autodoc", "
Parameters
----------
aFolder: str

Return
-------
None

Description
-----------
Defines the folder in which the object should be stored.
") SetRequestedFolder;
		void SetRequestedFolder(TCollection_ExtendedString aFolder);

		/****** CDM_Document::SetRequestedName ******/
		/****** md5 signature: 298752a1535e4ce720f8d2943f6c93d5 ******/
		%feature("compactdefaultargs") SetRequestedName;
		%feature("autodoc", "
Parameters
----------
aName: str

Return
-------
None

Description
-----------
Defines the name under which the object should be stored.
") SetRequestedName;
		void SetRequestedName(TCollection_ExtendedString aName);

		/****** CDM_Document::SetRequestedPreviousVersion ******/
		/****** md5 signature: 1503faefc17021dc37f68166bf2a089c ******/
		%feature("compactdefaultargs") SetRequestedPreviousVersion;
		%feature("autodoc", "
Parameters
----------
aPreviousVersion: str

Return
-------
None

Description
-----------
No available documentation.
") SetRequestedPreviousVersion;
		void SetRequestedPreviousVersion(TCollection_ExtendedString aPreviousVersion);

		/****** CDM_Document::ShallowReferences ******/
		/****** md5 signature: aa297a568fbd85c49d8f09dcb24692ae ******/
		%feature("compactdefaultargs") ShallowReferences;
		%feature("autodoc", "
Parameters
----------
aDocument: CDM_Document

Return
-------
bool

Description
-----------
Returns true is this document references adocument;.
") ShallowReferences;
		Standard_Boolean ShallowReferences(const opencascade::handle<CDM_Document> & aDocument);

		/****** CDM_Document::StorageFormat ******/
		/****** md5 signature: 645330f0637961ced097e10cfe63d1a3 ******/
		%feature("compactdefaultargs") StorageFormat;
		%feature("autodoc", "Return
-------
TCollection_ExtendedString

Description
-----------
The storage format is the key which is used to determine in the application resources the storage driver plugin, the file extension and other data used to store the document.
") StorageFormat;
		virtual TCollection_ExtendedString StorageFormat();

		/****** CDM_Document::StorageVersion ******/
		/****** md5 signature: cfa5fceedf718765fa0109d82c3e0482 ******/
		%feature("compactdefaultargs") StorageVersion;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the value of the modification counter at the time of storage. by default returns 0.
") StorageVersion;
		Standard_Integer StorageVersion();

		/****** CDM_Document::ToReferencesNumber ******/
		/****** md5 signature: 9ab7b7be8ebb8b32b4348f01bcfc580e ******/
		%feature("compactdefaultargs") ToReferencesNumber;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of references having this document as from document.
") ToReferencesNumber;
		Standard_Integer ToReferencesNumber();

		/****** CDM_Document::UnModify ******/
		/****** md5 signature: 176026c3fd8351d101ca2563c78a92a8 ******/
		%feature("compactdefaultargs") UnModify;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") UnModify;
		void UnModify();

		/****** CDM_Document::UnsetIsReadOnly ******/
		/****** md5 signature: ad239bc1afe0a11934bb15c8844a6d1a ******/
		%feature("compactdefaultargs") UnsetIsReadOnly;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") UnsetIsReadOnly;
		void UnsetIsReadOnly();

		/****** CDM_Document::UnsetIsStored ******/
		/****** md5 signature: f9ec6a01bb2ee0e5c06cb3d363b2d4b7 ******/
		%feature("compactdefaultargs") UnsetIsStored;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") UnsetIsStored;
		void UnsetIsStored();

		/****** CDM_Document::UnsetRequestedPreviousVersion ******/
		/****** md5 signature: 25c4d7340344fdb157fa9bf559bb8053 ******/
		%feature("compactdefaultargs") UnsetRequestedPreviousVersion;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") UnsetRequestedPreviousVersion;
		void UnsetRequestedPreviousVersion();

		/****** CDM_Document::Update ******/
		/****** md5 signature: 489e8b43103ceb1bedae872987b0cd2f ******/
		%feature("compactdefaultargs") Update;
		%feature("autodoc", "
Parameters
----------
aToDocument: CDM_Document
aReferenceIdentifier: int
aModifContext: Standard_Address

Return
-------
None

Description
-----------
The update method will be called once for each reference, but it should not perform any computation, to avoid multiple computation of a same document.
") Update;
		virtual void Update(const opencascade::handle<CDM_Document> & aToDocument, const Standard_Integer aReferenceIdentifier, const Standard_Address aModifContext);

		/****** CDM_Document::Update ******/
		/****** md5 signature: 9fad82e8b94c706a007753d3361fc125 ******/
		%feature("compactdefaultargs") Update;
		%feature("autodoc", "
Parameters
----------
ErrorString: str

Return
-------
bool

Description
-----------
This method update will be called to signal the end of the modified references list. the document should be recomputed and updatefromdocuments should be called. update should returns true in case of success, false otherwise. in case of failure, additional information can be given in errorstring.
") Update;
		virtual Standard_Boolean Update(TCollection_ExtendedString & ErrorString);

		/****** CDM_Document::Update ******/
		/****** md5 signature: 39b31f53ec35285afdd1d13bf1b04e26 ******/
		%feature("compactdefaultargs") Update;
		%feature("autodoc", "Return
-------
None

Description
-----------
The following method should be used instead: //! update(me:mutable; errorstring: out extendedstring from tcollection) returns boolean from standard.
") Update;
		virtual void Update();

		/****** CDM_Document::UpdateFromDocuments ******/
		/****** md5 signature: 2007516be66761b05006844559207c16 ******/
		%feature("compactdefaultargs") UpdateFromDocuments;
		%feature("autodoc", "
Parameters
----------
aModifContext: Standard_Address

Return
-------
None

Description
-----------
Call virtual method update on all referencing documents. this method keeps the list of the -- documents to process.it may be the starting of an update -- cycle. if not, the reentrant calls made by update method (without argument) will append the referencing documents to the list and call the update method (with arguments). only the first call to updatefromdocuments generate call to update().
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
		/****** CDM_MetaData::Document ******/
		/****** md5 signature: e16dc9e733287c94251ebd2305fccdda ******/
		%feature("compactdefaultargs") Document;
		%feature("autodoc", "Return
-------
opencascade::handle<CDM_Document>

Description
-----------
No available documentation.
") Document;
		opencascade::handle<CDM_Document> Document();


        /****************** DumpJson ******************/
        %feature("autodoc", "
Parameters
----------
depth: int, default=-1

Return
-------
str

Description
-----------
Dump the object to JSON string.
") DumpJson;
        %extend{
            std::string DumpJson(int depth=-1) {
            std::stringstream s;
            self->DumpJson(s, depth);
            return "{" + s.str() + "}" ;}
        };
		/****** CDM_MetaData::FileName ******/
		/****** md5 signature: 55453540d5ecaade8ddcde5846f5b88f ******/
		%feature("compactdefaultargs") FileName;
		%feature("autodoc", "Return
-------
TCollection_ExtendedString

Description
-----------
No available documentation.
") FileName;
		TCollection_ExtendedString FileName();

		/****** CDM_MetaData::Folder ******/
		/****** md5 signature: 6e4f71ec7a138611fba2655a4d9e2a6c ******/
		%feature("compactdefaultargs") Folder;
		%feature("autodoc", "Return
-------
TCollection_ExtendedString

Description
-----------
Returns the folder in which the meta-data has to be created or has to be found.
") Folder;
		TCollection_ExtendedString Folder();

		/****** CDM_MetaData::HasVersion ******/
		/****** md5 signature: bb5780573c7c237fa50d67bc9fae80aa ******/
		%feature("compactdefaultargs") HasVersion;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Indicates that the version has to be taken into account when searching the corresponding meta-data.
") HasVersion;
		Standard_Boolean HasVersion();

		/****** CDM_MetaData::IsReadOnly ******/
		/****** md5 signature: fa96cbb7774919470076f35f8b884f77 ******/
		%feature("compactdefaultargs") IsReadOnly;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsReadOnly;
		Standard_Boolean IsReadOnly();

		/****** CDM_MetaData::IsRetrieved ******/
		/****** md5 signature: 23effb2d4afa2a6e9b927e4ae98051f1 ******/
		%feature("compactdefaultargs") IsRetrieved;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsRetrieved;
		Standard_Boolean IsRetrieved();

		/****** CDM_MetaData::LookUp ******/
		/****** md5 signature: 264e1c1cc539b8fdedbde10237de56db ******/
		%feature("compactdefaultargs") LookUp;
		%feature("autodoc", "
Parameters
----------
theLookUpTable: CDM_MetaDataLookUpTable
aFolder: str
aName: str
aPath: str
aFileName: str
ReadOnly: bool

Return
-------
opencascade::handle<CDM_MetaData>

Description
-----------
No available documentation.
") LookUp;
		static opencascade::handle<CDM_MetaData> LookUp(CDM_MetaDataLookUpTable & theLookUpTable, TCollection_ExtendedString aFolder, TCollection_ExtendedString aName, TCollection_ExtendedString aPath, TCollection_ExtendedString aFileName, const Standard_Boolean ReadOnly);

		/****** CDM_MetaData::LookUp ******/
		/****** md5 signature: 87e49a80556489bc1976c2417d858c6c ******/
		%feature("compactdefaultargs") LookUp;
		%feature("autodoc", "
Parameters
----------
theLookUpTable: CDM_MetaDataLookUpTable
aFolder: str
aName: str
aPath: str
aVersion: str
aFileName: str
ReadOnly: bool

Return
-------
opencascade::handle<CDM_MetaData>

Description
-----------
No available documentation.
") LookUp;
		static opencascade::handle<CDM_MetaData> LookUp(CDM_MetaDataLookUpTable & theLookUpTable, TCollection_ExtendedString aFolder, TCollection_ExtendedString aName, TCollection_ExtendedString aPath, TCollection_ExtendedString aVersion, TCollection_ExtendedString aFileName, const Standard_Boolean ReadOnly);

		/****** CDM_MetaData::Name ******/
		/****** md5 signature: a9e55299a1405b3a2863469f1a67f9cd ******/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "Return
-------
TCollection_ExtendedString

Description
-----------
Returns the name under which the meta-data has to be created or has to be found.
") Name;
		TCollection_ExtendedString Name();

		/****** CDM_MetaData::Path ******/
		/****** md5 signature: f6c1194d39f76de7fb92f5471518f512 ******/
		%feature("compactdefaultargs") Path;
		%feature("autodoc", "Return
-------
TCollection_ExtendedString

Description
-----------
No available documentation.
") Path;
		TCollection_ExtendedString Path();

		/****** CDM_MetaData::Print ******/
		/****** md5 signature: fb65164879bb8268c90b67d68359a682 ******/
		%feature("compactdefaultargs") Print;
		%feature("autodoc", "
Parameters
----------

Return
-------
anOStream: Standard_OStream

Description
-----------
No available documentation.
") Print;
		Standard_OStream & Print(std::ostream &OutValue);

		/****** CDM_MetaData::SetIsReadOnly ******/
		/****** md5 signature: 9f4f8649234a1411f6086a147fb0f5ad ******/
		%feature("compactdefaultargs") SetIsReadOnly;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") SetIsReadOnly;
		void SetIsReadOnly();

		/****** CDM_MetaData::UnsetDocument ******/
		/****** md5 signature: d023d84ac523885764cfd5d5732edb98 ******/
		%feature("compactdefaultargs") UnsetDocument;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") UnsetDocument;
		void UnsetDocument();

		/****** CDM_MetaData::UnsetIsReadOnly ******/
		/****** md5 signature: ad239bc1afe0a11934bb15c8844a6d1a ******/
		%feature("compactdefaultargs") UnsetIsReadOnly;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") UnsetIsReadOnly;
		void UnsetIsReadOnly();

		/****** CDM_MetaData::Version ******/
		/****** md5 signature: 82a6659ee5865225bff1f5a6263d6ca8 ******/
		%feature("compactdefaultargs") Version;
		%feature("autodoc", "Return
-------
TCollection_ExtendedString

Description
-----------
Returns the version under which the meta-data has to be found. warning: raises nosuchobject from standard if no version has been defined.
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
		/****** CDM_Reference::DocumentVersion ******/
		/****** md5 signature: bf19019d65def7107fbf722b45605af2 ******/
		%feature("compactdefaultargs") DocumentVersion;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") DocumentVersion;
		Standard_Integer DocumentVersion();


        /****************** DumpJson ******************/
        %feature("autodoc", "
Parameters
----------
depth: int, default=-1

Return
-------
str

Description
-----------
Dump the object to JSON string.
") DumpJson;
        %extend{
            std::string DumpJson(int depth=-1) {
            std::stringstream s;
            self->DumpJson(s, depth);
            return "{" + s.str() + "}" ;}
        };
		/****** CDM_Reference::FromDocument ******/
		/****** md5 signature: 074d50b6a0fbd464042f670a2a5d9430 ******/
		%feature("compactdefaultargs") FromDocument;
		%feature("autodoc", "Return
-------
opencascade::handle<CDM_Document>

Description
-----------
No available documentation.
") FromDocument;
		opencascade::handle<CDM_Document> FromDocument();

		/****** CDM_Reference::IsReadOnly ******/
		/****** md5 signature: fa96cbb7774919470076f35f8b884f77 ******/
		%feature("compactdefaultargs") IsReadOnly;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsReadOnly;
		Standard_Boolean IsReadOnly();

		/****** CDM_Reference::ReferenceIdentifier ******/
		/****** md5 signature: 3aa5e98e8d6049efe315cf6d973322f8 ******/
		%feature("compactdefaultargs") ReferenceIdentifier;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") ReferenceIdentifier;
		Standard_Integer ReferenceIdentifier();

		/****** CDM_Reference::ToDocument ******/
		/****** md5 signature: 3cdc7a527106d97d66a66516fc680b2d ******/
		%feature("compactdefaultargs") ToDocument;
		%feature("autodoc", "Return
-------
opencascade::handle<CDM_Document>

Description
-----------
No available documentation.
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
		/****** CDM_ReferenceIterator::CDM_ReferenceIterator ******/
		/****** md5 signature: ac629575b6c6ce3e0dda06341cd98b11 ******/
		%feature("compactdefaultargs") CDM_ReferenceIterator;
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
") CDM_ReferenceIterator;
		 CDM_ReferenceIterator(const opencascade::handle<CDM_Document> & aDocument);

		/****** CDM_ReferenceIterator::Document ******/
		/****** md5 signature: e16dc9e733287c94251ebd2305fccdda ******/
		%feature("compactdefaultargs") Document;
		%feature("autodoc", "Return
-------
opencascade::handle<CDM_Document>

Description
-----------
No available documentation.
") Document;
		opencascade::handle<CDM_Document> Document();

		/****** CDM_ReferenceIterator::DocumentVersion ******/
		/****** md5 signature: bf19019d65def7107fbf722b45605af2 ******/
		%feature("compactdefaultargs") DocumentVersion;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the document version in the reference.
") DocumentVersion;
		Standard_Integer DocumentVersion();

		/****** CDM_ReferenceIterator::More ******/
		/****** md5 signature: 6f6e915c9a3dca758c059d9e8af02dff ******/
		%feature("compactdefaultargs") More;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") More;
		Standard_Boolean More();

		/****** CDM_ReferenceIterator::Next ******/
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

		/****** CDM_ReferenceIterator::ReferenceIdentifier ******/
		/****** md5 signature: 0b6f1d6aeee20151c55bab21628d6c27 ******/
		%feature("compactdefaultargs") ReferenceIdentifier;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
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
/* class aliases */
%pythoncode {
CDM_NamesDirectory=OCC.Core.TColStd.TColStd_DataMapOfStringInteger
}
/* deprecated methods */
%pythoncode {
@deprecated
def CDM_MetaData_LookUp(*args):
	return CDM_MetaData.LookUp(*args)

@deprecated
def CDM_MetaData_LookUp(*args):
	return CDM_MetaData.LookUp(*args)

}
