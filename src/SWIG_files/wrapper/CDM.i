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

class CDM_CanCloseStatus:
	CDM_CCS_OK = 0
	CDM_CCS_NotOpen = 1
	CDM_CCS_UnstoredReferenced = 2
	CDM_CCS_ModifiedReferenced = 3
	CDM_CCS_ReferenceRejection = 4
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
%template(CDM_ListOfReferences) NCollection_List<opencascade::handle<CDM_Reference>>;
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
		%feature("compactdefaultargs") MessageDriver;
		%feature("autodoc", "Returns default messenger;.

Returns
-------
opencascade::handle<Message_Messenger>
") MessageDriver;
		virtual opencascade::handle<Message_Messenger> MessageDriver();

		/****************** Name ******************/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "Returns the application name.

Returns
-------
TCollection_ExtendedString
") Name;
		virtual TCollection_ExtendedString Name();

		/****************** Resources ******************/
		%feature("compactdefaultargs") Resources;
		%feature("autodoc", "The manager returned by this virtual method will be used to search for format.retrieval resource items.

Returns
-------
opencascade::handle<Resource_Manager>
") Resources;
		virtual opencascade::handle<Resource_Manager> Resources();

		/****************** Version ******************/
		%feature("compactdefaultargs") Version;
		%feature("autodoc", "Returns the application version.

Returns
-------
TCollection_AsciiString
") Version;
		virtual TCollection_AsciiString Version();

		/****************** Write ******************/
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
		%feature("compactdefaultargs") Application;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<CDM_Application>
") Application;
		const opencascade::handle<CDM_Application> & Application();

		/****************** CanClose ******************/
		%feature("compactdefaultargs") CanClose;
		%feature("autodoc", "No available documentation.

Returns
-------
CDM_CanCloseStatus
") CanClose;
		CDM_CanCloseStatus CanClose();

		/****************** CanCloseReference ******************/
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
		%feature("compactdefaultargs") Close;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Close;
		void Close();

		/****************** CloseReference ******************/
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
		%feature("compactdefaultargs") Comment;
		%feature("autodoc", "Returns the first of associated comments. by defaut the comment is an empty string.

Returns
-------
Standard_ExtString
") Comment;
		Standard_ExtString Comment();

		/****************** Comments ******************/
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
		%feature("compactdefaultargs") Description;
		%feature("autodoc", "Gets the `fileformat`.description resource.

Returns
-------
TCollection_ExtendedString
") Description;
		TCollection_ExtendedString Description();

		/****************** Document ******************/
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
		%feature("compactdefaultargs") FileExtension;
		%feature("autodoc", "Gets the desktop.domain.application.`fileformat`.fileextension resource.

Returns
-------
TCollection_ExtendedString
") FileExtension;
		TCollection_ExtendedString FileExtension();

		/****************** FindDescription ******************/
		%feature("compactdefaultargs") FindDescription;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") FindDescription;
		Standard_Boolean FindDescription();

		/****************** FindFileExtension ******************/
		%feature("compactdefaultargs") FindFileExtension;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") FindFileExtension;
		Standard_Boolean FindFileExtension();

		/****************** FindFromPresentation ******************/
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
		%feature("compactdefaultargs") Folder;
		%feature("autodoc", "No available documentation.

Returns
-------
TCollection_ExtendedString
") Folder;
		TCollection_ExtendedString Folder();

		/****************** FromReferencesNumber ******************/
		%feature("compactdefaultargs") FromReferencesNumber;
		%feature("autodoc", "Returns the number of references having this document as to document.

Returns
-------
int
") FromReferencesNumber;
		Standard_Integer FromReferencesNumber();

		/****************** GetAlternativeDocument ******************/
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
		%feature("compactdefaultargs") HasRequestedFolder;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") HasRequestedFolder;
		Standard_Boolean HasRequestedFolder();

		/****************** HasRequestedPreviousVersion ******************/
		%feature("compactdefaultargs") HasRequestedPreviousVersion;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") HasRequestedPreviousVersion;
		Standard_Boolean HasRequestedPreviousVersion();

		/****************** IsInSession ******************/
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
		%feature("compactdefaultargs") IsModified;
		%feature("autodoc", "Returns true if the version is greater than the storage version.

Returns
-------
bool
") IsModified;
		Standard_Boolean IsModified();

		/****************** IsOpened ******************/
		%feature("compactdefaultargs") IsOpened;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsOpened;
		Standard_Boolean IsOpened();

		/****************** IsOpened ******************/
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
		%feature("compactdefaultargs") IsReadOnly;
		%feature("autodoc", "Indicates that this document cannot be modified.

Returns
-------
bool
") IsReadOnly;
		Standard_Boolean IsReadOnly();

		/****************** IsReadOnly ******************/
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
		%feature("compactdefaultargs") IsStored;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsStored;
		Standard_Boolean IsStored();

		/****************** IsUpToDate ******************/
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
		%feature("compactdefaultargs") LoadResources;
		%feature("autodoc", "Read (or rereads) the following resource.

Returns
-------
None
") LoadResources;
		void LoadResources();

		/****************** MetaData ******************/
		%feature("compactdefaultargs") MetaData;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<CDM_MetaData>
") MetaData;
		opencascade::handle<CDM_MetaData> MetaData();

		/****************** Modifications ******************/
		%feature("compactdefaultargs") Modifications;
		%feature("autodoc", "Returns the current modification counter.

Returns
-------
int
") Modifications;
		Standard_Integer Modifications();

		/****************** Modify ******************/
		%feature("compactdefaultargs") Modify;
		%feature("autodoc", "Indicates that this document has been modified. this method increments the modification counter.

Returns
-------
None
") Modify;
		void Modify();

		/****************** Name ******************/
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
		%feature("compactdefaultargs") ReferenceCounter;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") ReferenceCounter;
		Standard_Integer ReferenceCounter();

		/****************** RemoveAllReferences ******************/
		%feature("compactdefaultargs") RemoveAllReferences;
		%feature("autodoc", "Removes all references having this document for from document.

Returns
-------
None
") RemoveAllReferences;
		void RemoveAllReferences();

		/****************** RemoveReference ******************/
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
		%feature("compactdefaultargs") RequestedComment;
		%feature("autodoc", "No available documentation.

Returns
-------
TCollection_ExtendedString
") RequestedComment;
		TCollection_ExtendedString RequestedComment();

		/****************** RequestedFolder ******************/
		%feature("compactdefaultargs") RequestedFolder;
		%feature("autodoc", "No available documentation.

Returns
-------
TCollection_ExtendedString
") RequestedFolder;
		TCollection_ExtendedString RequestedFolder();

		/****************** RequestedName ******************/
		%feature("compactdefaultargs") RequestedName;
		%feature("autodoc", "Determines under which the document is going to be store. by default the name of the document wil be -- used. if the document has no name its presentation will be used.

Returns
-------
TCollection_ExtendedString
") RequestedName;
		TCollection_ExtendedString RequestedName();

		/****************** RequestedPreviousVersion ******************/
		%feature("compactdefaultargs") RequestedPreviousVersion;
		%feature("autodoc", "No available documentation.

Returns
-------
TCollection_ExtendedString
") RequestedPreviousVersion;
		TCollection_ExtendedString RequestedPreviousVersion();

		/****************** SetComment ******************/
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
		%feature("compactdefaultargs") SetIsReadOnly;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") SetIsReadOnly;
		void SetIsReadOnly();

		/****************** SetIsUpToDate ******************/
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
		%feature("compactdefaultargs") StorageFormat;
		%feature("autodoc", "The storage format is the key which is used to determine in the application resources the storage driver plugin, the file extension and other data used to store the document.

Returns
-------
TCollection_ExtendedString
") StorageFormat;
		virtual TCollection_ExtendedString StorageFormat();

		/****************** StorageFormatVersion ******************/
		%feature("compactdefaultargs") StorageFormatVersion;
		%feature("autodoc", "Returns version of the format to be used to store the document.

Returns
-------
int
") StorageFormatVersion;
		Standard_Integer StorageFormatVersion();

		/****************** StorageVersion ******************/
		%feature("compactdefaultargs") StorageVersion;
		%feature("autodoc", "Returns the value of the modification counter at the time of storage. by default returns 0.

Returns
-------
int
") StorageVersion;
		Standard_Integer StorageVersion();

		/****************** ToReferencesNumber ******************/
		%feature("compactdefaultargs") ToReferencesNumber;
		%feature("autodoc", "Returns the number of references having this document as from document.

Returns
-------
int
") ToReferencesNumber;
		Standard_Integer ToReferencesNumber();

		/****************** UnModify ******************/
		%feature("compactdefaultargs") UnModify;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") UnModify;
		void UnModify();

		/****************** UnsetIsReadOnly ******************/
		%feature("compactdefaultargs") UnsetIsReadOnly;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") UnsetIsReadOnly;
		void UnsetIsReadOnly();

		/****************** UnsetIsStored ******************/
		%feature("compactdefaultargs") UnsetIsStored;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") UnsetIsStored;
		void UnsetIsStored();

		/****************** UnsetRequestedPreviousVersion ******************/
		%feature("compactdefaultargs") UnsetRequestedPreviousVersion;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") UnsetRequestedPreviousVersion;
		void UnsetRequestedPreviousVersion();

		/****************** Update ******************/
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
		%feature("compactdefaultargs") Update;
		%feature("autodoc", "The following method should be used instead: //! update(me:mutable; errorstring: out extendedstring from tcollection) returns boolean from standard.

Returns
-------
None
") Update;
		virtual void Update();

		/****************** UpdateFromDocuments ******************/
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
		%feature("compactdefaultargs") Document;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<CDM_Document>
") Document;
		opencascade::handle<CDM_Document> Document();

		/****************** FileName ******************/
		%feature("compactdefaultargs") FileName;
		%feature("autodoc", "No available documentation.

Returns
-------
TCollection_ExtendedString
") FileName;
		TCollection_ExtendedString FileName();

		/****************** Folder ******************/
		%feature("compactdefaultargs") Folder;
		%feature("autodoc", "Returns the folder in which the meta-data has to be created or has to be found.

Returns
-------
TCollection_ExtendedString
") Folder;
		TCollection_ExtendedString Folder();

		/****************** HasVersion ******************/
		%feature("compactdefaultargs") HasVersion;
		%feature("autodoc", "Indicates that the version has to be taken into account when searching the corresponding meta-data.

Returns
-------
bool
") HasVersion;
		Standard_Boolean HasVersion();

		/****************** IsReadOnly ******************/
		%feature("compactdefaultargs") IsReadOnly;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsReadOnly;
		Standard_Boolean IsReadOnly();

		/****************** IsRetrieved ******************/
		%feature("compactdefaultargs") IsRetrieved;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsRetrieved;
		Standard_Boolean IsRetrieved();

		/****************** LookUp ******************/
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
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "Returns the name under which the meta-data has to be created or has to be found.

Returns
-------
TCollection_ExtendedString
") Name;
		TCollection_ExtendedString Name();

		/****************** Path ******************/
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
		%feature("compactdefaultargs") SetIsReadOnly;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") SetIsReadOnly;
		void SetIsReadOnly();

		/****************** UnsetDocument ******************/
		%feature("compactdefaultargs") UnsetDocument;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") UnsetDocument;
		void UnsetDocument();

		/****************** UnsetIsReadOnly ******************/
		%feature("compactdefaultargs") UnsetIsReadOnly;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") UnsetIsReadOnly;
		void UnsetIsReadOnly();

		/****************** Version ******************/
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
		%feature("compactdefaultargs") DocumentVersion;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") DocumentVersion;
		Standard_Integer DocumentVersion();

		/****************** FromDocument ******************/
		%feature("compactdefaultargs") FromDocument;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<CDM_Document>
") FromDocument;
		opencascade::handle<CDM_Document> FromDocument();

		/****************** IsReadOnly ******************/
		%feature("compactdefaultargs") IsReadOnly;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsReadOnly;
		Standard_Boolean IsReadOnly();

		/****************** ReferenceIdentifier ******************/
		%feature("compactdefaultargs") ReferenceIdentifier;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") ReferenceIdentifier;
		Standard_Integer ReferenceIdentifier();

		/****************** ToDocument ******************/
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
		%feature("compactdefaultargs") Document;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<CDM_Document>
") Document;
		opencascade::handle<CDM_Document> Document();

		/****************** DocumentVersion ******************/
		%feature("compactdefaultargs") DocumentVersion;
		%feature("autodoc", "Returns the document version in the reference.

Returns
-------
int
") DocumentVersion;
		Standard_Integer DocumentVersion();

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

		/****************** ReferenceIdentifier ******************/
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
