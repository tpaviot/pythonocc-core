/*
Copyright 2008-2025 Thomas Paviot (tpaviot@gmail.com)

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
https://dev.opencascade.org/doc/occt-7.9.0/refman/html/package_cdm.html"
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
%ignore NCollection_DataMap<TCollection_ExtendedString,int>::Items;
%ignore NCollection_DataMap<TCollection_ExtendedString,int>::KeyValues;
%template(CDM_NamesDirectory) NCollection_DataMap<TCollection_ExtendedString,int>;
/* end templates declaration */

/* typedefs */
typedef NCollection_List<opencascade::handle<CDM_Document>>::Iterator CDM_ListIteratorOfListOfDocument;
typedef NCollection_List<opencascade::handle<CDM_Reference>>::Iterator CDM_ListIteratorOfListOfReferences;
typedef NCollection_List<opencascade::handle<CDM_Document>> CDM_ListOfDocument;
typedef NCollection_List<opencascade::handle<CDM_Reference>> CDM_ListOfReferences;
typedef NCollection_Map<opencascade::handle<CDM_Document>>::Iterator CDM_MapIteratorOfMapOfDocument;
typedef NCollection_Map<opencascade::handle<CDM_Document>> CDM_MapOfDocument;
typedef NCollection_DataMap<TCollection_ExtendedString, int> CDM_NamesDirectory;
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
this method is called before the update of a document. By default, writes in MessageDriver().
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
		/****** md5 signature: 3abcd1e9cc73072cc3dd2dcb664ca364 ******/
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
this method is called after the update of a document. By default, writes in MessageDriver().
") EndOfUpdate;
		virtual void EndOfUpdate(const opencascade::handle<CDM_Document> & aDocument, const bool theStatus, TCollection_ExtendedString ErrorString);

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
		/****** md5 signature: 38fcb6e191227b09af475a372e62f90e ******/
		%feature("compactdefaultargs") MetaDataLookUpTable;
		%feature("autodoc", "Return
-------
NCollection_DataMap<TCollection_ExtendedString, opencascade::handle<CDM_MetaData>>

Description
-----------
Returns MetaData LookUpTable.
") MetaDataLookUpTable;
		virtual NCollection_DataMap<TCollection_ExtendedString, opencascade::handle<CDM_MetaData>> & MetaDataLookUpTable();

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
The manager returned by this virtual method will be used to search for Format.Retrieval resource items.
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
		/****** md5 signature: 66e9fcf1a332e777ad83d2039f68a46f ******/
		%feature("compactdefaultargs") Write;
		%feature("autodoc", "
Parameters
----------
aString: char16_t *

Return
-------
None

Description
-----------
writes the string in the application MessagerDriver.
") Write;
		void Write(const char16_t * const aString);

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
appends a comment into comments of this document.
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
		/****** md5 signature: 19705be703426fd77c1cf26a02a6e581 ******/
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
A referenced document may indicate through this virtual method that it does not allow the closing of aDocument which it references through the reference aReferenceIdentifier. By default returns true.
") CanCloseReference;
		virtual bool CanCloseReference(const opencascade::handle<CDM_Document> & aDocument, const int aReferenceIdentifier);

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
		/****** md5 signature: 12a4b0b3bb0f6a4e41199f024be20a27 ******/
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
A referenced document may update its internal data structure when {aDocument} which it references through the reference {aReferenceIdentifier} is being closed. By default this method does nothing.
") CloseReference;
		virtual void CloseReference(const opencascade::handle<CDM_Document> & aDocument, const int aReferenceIdentifier);

		/****** CDM_Document::Comment ******/
		/****** md5 signature: 7e29debb2d4de6d214a4a1ecae6866d0 ******/
		%feature("compactdefaultargs") Comment;
		%feature("autodoc", "Return
-------
char16_t *

Description
-----------
Returns the first of associated comments. By default the comment is an empty string.
") Comment;
		const char16_t * Comment();

		/****** CDM_Document::Comments ******/
		/****** md5 signature: b6fee9d18e0390a127256c152ad3c876 ******/
		%feature("compactdefaultargs") Comments;
		%feature("autodoc", "
Parameters
----------
aComments: NCollection_Sequence<TCollection_ExtendedString>

Return
-------
None

Description
-----------
returns the associated comments through <aComments>. Returns empty sequence if no comments are associated.
") Comments;
		void Comments(NCollection_Sequence<TCollection_ExtendedString> & aComments);

		/****** CDM_Document::CopyReference ******/
		/****** md5 signature: d28575d391d3d7291b475f242ff6db84 ******/
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
Copies a reference to this document. This method avoid retrieval of referenced document. The arguments are the original document and a valid reference identifier Returns the local identifier.
") CopyReference;
		int CopyReference(const opencascade::handle<CDM_Document> & aFromDocument, const int aReferenceIdentifier);

		/****** CDM_Document::CreateReference ******/
		/****** md5 signature: a13c93d3f1a692906a6a9057595fcc79 ******/
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
Creates a reference from this document to {anOtherDocument}. Returns a reference identifier. This reference identifier is unique in the document and will not be used for the next references, even after the storing of the document. If there is already a reference between the two documents, the reference is not created, but its reference identifier is returned.
") CreateReference;
		int CreateReference(const opencascade::handle<CDM_Document> & anOtherDocument);

		/****** CDM_Document::CreateReference ******/
		/****** md5 signature: 23af19d70c6efd1c8949fb47fe8899c3 ******/
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
		void CreateReference(const opencascade::handle<CDM_MetaData> & aMetaData, const int aReferenceIdentifier, const opencascade::handle<CDM_Application> & anApplication, const int aToDocumentVersion, const bool UseStorageConfiguration);

		/****** CDM_Document::CreateReference ******/
		/****** md5 signature: 00dd758a591802c2f4ac96e32dba349b ******/
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
		int CreateReference(const opencascade::handle<CDM_MetaData> & aMetaData, const opencascade::handle<CDM_Application> & anApplication, const int aDocumentVersion, const bool UseStorageConfiguration);

		/****** CDM_Document::DeepReferences ******/
		/****** md5 signature: 3136b715d955b5e255957fcdc9be12dc ******/
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
returns True is this document references aDocument;.
") DeepReferences;
		bool DeepReferences(const opencascade::handle<CDM_Document> & aDocument);

		/****** CDM_Document::Description ******/
		/****** md5 signature: 4ea5e8b06a38637bc4a4e6f3a5b7d927 ******/
		%feature("compactdefaultargs") Description;
		%feature("autodoc", "Return
-------
TCollection_ExtendedString

Description
-----------
gets the `FileFormat`.Description resource.
") Description;
		TCollection_ExtendedString Description();

		/****** CDM_Document::Document ******/
		/****** md5 signature: 7c92c4efbcc1046a6cf5c41444fe8a87 ******/
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
Returns the To Document of the reference identified by aReferenceIdentifier. If the ToDocument is stored and has not yet been retrieved, this method will retrieve it.
") Document;
		opencascade::handle<CDM_Document> Document(const int aReferenceIdentifier);


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
		/****** md5 signature: 344a638003b8c4e26ff468b67fcd8d84 ******/
		%feature("compactdefaultargs") Extensions;
		%feature("autodoc", "
Parameters
----------
Extensions: NCollection_Sequence<TCollection_ExtendedString>

Return
-------
None

Description
-----------
by default empties the extensions.
") Extensions;
		virtual void Extensions(NCollection_Sequence<TCollection_ExtendedString> & Extensions);

		/****** CDM_Document::FileExtension ******/
		/****** md5 signature: dc32da120ea382590e37e02d5e00fb9e ******/
		%feature("compactdefaultargs") FileExtension;
		%feature("autodoc", "Return
-------
TCollection_ExtendedString

Description
-----------
gets the Desktop.Domain.Application.`FileFormat`.FileExtension resource.
") FileExtension;
		TCollection_ExtendedString FileExtension();

		/****** CDM_Document::FindDescription ******/
		/****** md5 signature: 29ae972dbb4878e11f051bba47485450 ******/
		%feature("compactdefaultargs") FindDescription;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") FindDescription;
		bool FindDescription();

		/****** CDM_Document::FindFileExtension ******/
		/****** md5 signature: e46e145ee1343132d2b9e55c23ceeeb7 ******/
		%feature("compactdefaultargs") FindFileExtension;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") FindFileExtension;
		bool FindFileExtension();

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
		/****** md5 signature: 0e6d98f2df853cdfbac28bdd27416b6b ******/
		%feature("compactdefaultargs") FromReferencesNumber;
		%feature("autodoc", "Return
-------
int

Description
-----------
returns the number of references having this document as To Document.
") FromReferencesNumber;
		int FromReferencesNumber();

		/****** CDM_Document::GetAlternativeDocument ******/
		/****** md5 signature: 8839c3f768f630f912058a2ebdeffb4e ******/
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
This method can be redefined to extract another document in a different format. For example, to extract a Shape from an applicative document.
") GetAlternativeDocument;
		virtual bool GetAlternativeDocument(TCollection_ExtendedString aFormat, opencascade::handle<CDM_Document> & anAlternativeDocument);

		/****** CDM_Document::HasRequestedFolder ******/
		/****** md5 signature: 7a2d001e51d1f3ddf0300dc77a6c0625 ******/
		%feature("compactdefaultargs") HasRequestedFolder;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") HasRequestedFolder;
		bool HasRequestedFolder();

		/****** CDM_Document::HasRequestedPreviousVersion ******/
		/****** md5 signature: 575f86529bdc98c08ef8d9a8b44ab6df ******/
		%feature("compactdefaultargs") HasRequestedPreviousVersion;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") HasRequestedPreviousVersion;
		bool HasRequestedPreviousVersion();

		/****** CDM_Document::IsInSession ******/
		/****** md5 signature: c0ff9a059ae0c9abf6542e2425514f10 ******/
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
returns True if the To Document of the reference identified by aReferenceIdentifier is in session, False if it corresponds to a not yet retrieved document.
") IsInSession;
		bool IsInSession(const int aReferenceIdentifier);

		/****** CDM_Document::IsModified ******/
		/****** md5 signature: 20a841c48b5ecb63ab1563022bd76327 ******/
		%feature("compactdefaultargs") IsModified;
		%feature("autodoc", "Return
-------
bool

Description
-----------
returns true if the version is greater than the storage version.
") IsModified;
		bool IsModified();

		/****** CDM_Document::IsOpened ******/
		/****** md5 signature: 032d03c051abc8906198792895dd34c0 ******/
		%feature("compactdefaultargs") IsOpened;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsOpened;
		bool IsOpened();

		/****** CDM_Document::IsOpened ******/
		/****** md5 signature: 22809431ba09395993260ee387c7f5c5 ******/
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
returns true if the document corresponding to the given reference has been retrieved and opened. Otherwise returns false. This method does not retrieve the referenced document.
") IsOpened;
		bool IsOpened(const int aReferenceIdentifier);

		/****** CDM_Document::IsReadOnly ******/
		/****** md5 signature: f00f30f1ee84ee6ad831f785278dedf7 ******/
		%feature("compactdefaultargs") IsReadOnly;
		%feature("autodoc", "Return
-------
bool

Description
-----------
indicates that this document cannot be modified.
") IsReadOnly;
		bool IsReadOnly();

		/****** CDM_Document::IsReadOnly ******/
		/****** md5 signature: 265ffca623ae02ce1d9a4570e6113b72 ******/
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
indicates that the referenced document cannot be modified,.
") IsReadOnly;
		bool IsReadOnly(const int aReferenceIdentifier);

		/****** CDM_Document::IsStored ******/
		/****** md5 signature: a9f021cdbcc569fffe03a05c50f4780f ******/
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
returns True if the To Document of the reference identified by aReferenceIdentifier has already been stored, False otherwise.
") IsStored;
		bool IsStored(const int aReferenceIdentifier);

		/****** CDM_Document::IsStored ******/
		/****** md5 signature: 50f45f1ea3dc0d91fb1ecc9b03467aa1 ******/
		%feature("compactdefaultargs") IsStored;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsStored;
		bool IsStored();

		/****** CDM_Document::IsUpToDate ******/
		/****** md5 signature: 4ab2d97c1c2fa436d74f32b1170ef660 ******/
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
returns true if the modification counter found in the given reference is equal to the actual modification counter of the To Document. This method is able to deal with a reference to a not retrieved document.
") IsUpToDate;
		bool IsUpToDate(const int aReferenceIdentifier);

		/****** CDM_Document::LoadResources ******/
		/****** md5 signature: e42c9588671d5e90c5bd95f9735418c2 ******/
		%feature("compactdefaultargs") LoadResources;
		%feature("autodoc", "Return
-------
None

Description
-----------
read (or rereads) the following resource.
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
		/****** md5 signature: 687a5e2b8cf540b80b1296524af7743b ******/
		%feature("compactdefaultargs") Modifications;
		%feature("autodoc", "Return
-------
int

Description
-----------
returns the current modification counter.
") Modifications;
		int Modifications();

		/****** CDM_Document::Modify ******/
		/****** md5 signature: 44fbaa7237dd1010519534b2d6fc44f0 ******/
		%feature("compactdefaultargs") Modify;
		%feature("autodoc", "Return
-------
None

Description
-----------
Indicates that this document has been modified. This method increments the modification counter.
") Modify;
		void Modify();

		/****** CDM_Document::Name ******/
		/****** md5 signature: 7a17461ecd1bf9e0223a159d5bc01a49 ******/
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
returns the name of the metadata of the To Document of the reference identified by aReferenceIdentifier.
") Name;
		TCollection_ExtendedString Name(const int aReferenceIdentifier);

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
		/****** md5 signature: 89e95abaf33d6c7d1ed7404b7f090041 ******/
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
		opencascade::handle<CDM_Reference> Reference(const int aReferenceIdentifier);

		/****** CDM_Document::ReferenceCounter ******/
		/****** md5 signature: 5616fc3c73ab4de3fe46e4d7279bd971 ******/
		%feature("compactdefaultargs") ReferenceCounter;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") ReferenceCounter;
		int ReferenceCounter();

		/****** CDM_Document::RemoveAllReferences ******/
		/****** md5 signature: 6b9e122ba37998fb6a05a073acdd9b92 ******/
		%feature("compactdefaultargs") RemoveAllReferences;
		%feature("autodoc", "Return
-------
None

Description
-----------
Removes all references having this document for From Document.
") RemoveAllReferences;
		void RemoveAllReferences();

		/****** CDM_Document::RemoveReference ******/
		/****** md5 signature: 5a7c1b7d1b39c3ffb30e1b0faccd3a17 ******/
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
Removes the reference between the From Document and the To Document identified by a reference identifier.
") RemoveReference;
		void RemoveReference(const int aReferenceIdentifier);

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
Determines under which the document is going to be store. By default the name of the document will be used. If the document has no name its presentation will be used.
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
associates a comment with this document.
") SetComment;
		void SetComment(TCollection_ExtendedString aComment);

		/****** CDM_Document::SetComments ******/
		/****** md5 signature: d99df2ea92859ad8db044272e2ad74bb ******/
		%feature("compactdefaultargs") SetComments;
		%feature("autodoc", "
Parameters
----------
aComments: NCollection_Sequence<TCollection_ExtendedString>

Return
-------
None

Description
-----------
associates a comments with this document.
") SetComments;
		void SetComments(const NCollection_Sequence<TCollection_ExtendedString> & aComments);

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
		/****** md5 signature: b062b990c04323b6e1cabe53ffaa24fe ******/
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
Resets the modification counter in the given reference to the actual modification counter of its To Document. This method should be called after the application has updated this document.
") SetIsUpToDate;
		void SetIsUpToDate(const int aReferenceIdentifier);

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
associates database information to a document which has been stored. The name of the document is now the name which has beenused to store the data.
") SetMetaData;
		void SetMetaData(const opencascade::handle<CDM_MetaData> & aMetaData);

		/****** CDM_Document::SetModifications ******/
		/****** md5 signature: 32f202716dcdc023badd0eae72fbd555 ******/
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
		void SetModifications(const int Modifications);

		/****** CDM_Document::SetReferenceCounter ******/
		/****** md5 signature: abece96a1e1d1f9cbd4ce0290822a04e ******/
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
		void SetReferenceCounter(const int aReferenceCounter);

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
defines the Comment with which the object should be stored.
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
defines the folder in which the object should be stored.
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
defines the name under which the object should be stored.
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
		/****** md5 signature: dc8bef346b16a58c103dae2859fb9ead ******/
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
returns True is this document references aDocument;.
") ShallowReferences;
		bool ShallowReferences(const opencascade::handle<CDM_Document> & aDocument);

		/****** CDM_Document::StorageFormat ******/
		/****** md5 signature: 645330f0637961ced097e10cfe63d1a3 ******/
		%feature("compactdefaultargs") StorageFormat;
		%feature("autodoc", "Return
-------
TCollection_ExtendedString

Description
-----------
The Storage Format is the key which is used to determine in the application resources the storage driver plugin, the file extension and other data used to store the document.
") StorageFormat;
		virtual TCollection_ExtendedString StorageFormat();

		/****** CDM_Document::StorageVersion ******/
		/****** md5 signature: 53cad72f215f0f529e03b71dd332b80c ******/
		%feature("compactdefaultargs") StorageVersion;
		%feature("autodoc", "Return
-------
int

Description
-----------
returns the value of the modification counter at the time of storage. By default returns 0.
") StorageVersion;
		int StorageVersion();

		/****** CDM_Document::ToReferencesNumber ******/
		/****** md5 signature: cd4ccbd5348c2ebf32b7b1233d5e9e95 ******/
		%feature("compactdefaultargs") ToReferencesNumber;
		%feature("autodoc", "Return
-------
int

Description
-----------
returns the number of references having this document as From Document.
") ToReferencesNumber;
		int ToReferencesNumber();

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
		/****** md5 signature: 5245ea15ffa876ffac6f786f48da4b99 ******/
		%feature("compactdefaultargs") Update;
		%feature("autodoc", "
Parameters
----------
aToDocument: CDM_Document
aReferenceIdentifier: int
aModifContext: void *

Return
-------
None

Description
-----------
The Update method will be called once for each reference, but it should not perform any computation, to avoid multiple computation of a same document.
") Update;
		virtual void Update(const opencascade::handle<CDM_Document> & aToDocument, const int aReferenceIdentifier, void * const aModifContext);

		/****** CDM_Document::Update ******/
		/****** md5 signature: 871c3a5c4289226c3444a59463640ad4 ******/
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
This method Update will be called to signal the end of the modified references list. The document should be recomputed and UpdateFromDocuments should be called. Update should returns True in case of success, false otherwise. In case of Failure, additional information can be given in ErrorString.
") Update;
		virtual bool Update(TCollection_ExtendedString & ErrorString);

		/****** CDM_Document::Update ******/
		/****** md5 signature: 39b31f53ec35285afdd1d13bf1b04e26 ******/
		%feature("compactdefaultargs") Update;
		%feature("autodoc", "Return
-------
None

Description
-----------
the following method should be used instead: //! Update(me:mutable; ErrorString: out ExtendedString from TCollection) returns Boolean from Standard.
") Update;
		virtual void Update();

		/****** CDM_Document::UpdateFromDocuments ******/
		/****** md5 signature: 23868bc77041d16961b80a37a82bbe5a ******/
		%feature("compactdefaultargs") UpdateFromDocuments;
		%feature("autodoc", "
Parameters
----------
aModifContext: void *

Return
-------
None

Description
-----------
call virtual method Update on all referencing documents. This method keeps the list of the documents to process. It may be the starting of an update cycle. If not, the reentrant calls made by Update method (without argument) will append the referencing documents to the list and call the Update method (with arguments). Only the first call to UpdateFromDocuments generate call to Update().
") UpdateFromDocuments;
		void UpdateFromDocuments(void * const aModifContext);

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
returns the folder in which the meta-data has to be created or has to be found.
") Folder;
		TCollection_ExtendedString Folder();

		/****** CDM_MetaData::HasVersion ******/
		/****** md5 signature: 72d726a00122691ba038aaa0f68f3a4d ******/
		%feature("compactdefaultargs") HasVersion;
		%feature("autodoc", "Return
-------
bool

Description
-----------
indicates that the version has to be taken into account when searching the corresponding meta-data.
") HasVersion;
		bool HasVersion();

		/****** CDM_MetaData::IsReadOnly ******/
		/****** md5 signature: f00f30f1ee84ee6ad831f785278dedf7 ******/
		%feature("compactdefaultargs") IsReadOnly;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsReadOnly;
		bool IsReadOnly();

		/****** CDM_MetaData::IsRetrieved ******/
		/****** md5 signature: 246335229ef956da958ee470cd63912d ******/
		%feature("compactdefaultargs") IsRetrieved;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsRetrieved;
		bool IsRetrieved();

		/****** CDM_MetaData::LookUp ******/
		/****** md5 signature: 05d9f21be7f110eee1cba5d8ec54d392 ******/
		%feature("compactdefaultargs") LookUp;
		%feature("autodoc", "
Parameters
----------
theLookUpTable: CDM_MetaData
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
		static opencascade::handle<CDM_MetaData> LookUp(NCollection_DataMap<TCollection_ExtendedString, opencascade::handle<CDM_MetaData> > & theLookUpTable, TCollection_ExtendedString aFolder, TCollection_ExtendedString aName, TCollection_ExtendedString aPath, TCollection_ExtendedString aFileName, const bool ReadOnly);

		/****** CDM_MetaData::LookUp ******/
		/****** md5 signature: 1fcbf639e1d8fc98e1fb42d2c7956d8f ******/
		%feature("compactdefaultargs") LookUp;
		%feature("autodoc", "
Parameters
----------
theLookUpTable: CDM_MetaData
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
		static opencascade::handle<CDM_MetaData> LookUp(NCollection_DataMap<TCollection_ExtendedString, opencascade::handle<CDM_MetaData> > & theLookUpTable, TCollection_ExtendedString aFolder, TCollection_ExtendedString aName, TCollection_ExtendedString aPath, TCollection_ExtendedString aVersion, TCollection_ExtendedString aFileName, const bool ReadOnly);

		/****** CDM_MetaData::Name ******/
		/****** md5 signature: a9e55299a1405b3a2863469f1a67f9cd ******/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "Return
-------
TCollection_ExtendedString

Description
-----------
returns the name under which the meta-data has to be created or has to be found.
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
returns the version under which the meta-data has to be found. Warning: raises NoSuchObject from Standard if no Version has been defined.
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
		/****** md5 signature: 675e05e8f271e443cd555d64e393f0e4 ******/
		%feature("compactdefaultargs") DocumentVersion;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") DocumentVersion;
		int DocumentVersion();


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
		/****** md5 signature: f00f30f1ee84ee6ad831f785278dedf7 ******/
		%feature("compactdefaultargs") IsReadOnly;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsReadOnly;
		bool IsReadOnly();

		/****** CDM_Reference::ReferenceIdentifier ******/
		/****** md5 signature: efc363e88a09ab9a0891ca07664c71ab ******/
		%feature("compactdefaultargs") ReferenceIdentifier;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") ReferenceIdentifier;
		int ReferenceIdentifier();

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
		/****** md5 signature: 675e05e8f271e443cd555d64e393f0e4 ******/
		%feature("compactdefaultargs") DocumentVersion;
		%feature("autodoc", "Return
-------
int

Description
-----------
returns the Document Version in the reference.
") DocumentVersion;
		int DocumentVersion();

		/****** CDM_ReferenceIterator::More ******/
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
		/****** md5 signature: c1d2e01be09a2d7c7ff7474ed2f44264 ******/
		%feature("compactdefaultargs") ReferenceIdentifier;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") ReferenceIdentifier;
		int ReferenceIdentifier();

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
