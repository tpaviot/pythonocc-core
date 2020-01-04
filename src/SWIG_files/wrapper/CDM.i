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
/* public enums */
enum CDM_CanCloseStatus {
	CDM_CCS_OK = 0,
	CDM_CCS_NotOpen = 1,
	CDM_CCS_UnstoredReferenced = 2,
	CDM_CCS_ModifiedReferenced = 3,
	CDM_CCS_ReferenceRejection = 4,
};

/* end public enums declaration */

/* handles */
%wrap_handle(CDM_Application)
%wrap_handle(CDM_Document)
%wrap_handle(CDM_MetaData)
%wrap_handle(CDM_Reference)
/* end handles declaration */

/* templates */
%template(CDM_ListOfReferences) NCollection_List <opencascade::handle <CDM_Reference>>;
%template(CDM_ListIteratorOfListOfReferences) NCollection_TListIterator<opencascade::handle<CDM_Reference>>;
%template(CDM_ListOfDocument) NCollection_List <opencascade::handle <CDM_Document>>;
%template(CDM_ListIteratorOfListOfDocument) NCollection_TListIterator<opencascade::handle<CDM_Document>>;
%template(CDM_PresentationDirectory) NCollection_DataMap <TCollection_ExtendedString , opencascade::handle <CDM_Document>, TCollection_ExtendedString>;
%template(CDM_MetaDataLookUpTable) NCollection_DataMap <TCollection_ExtendedString , opencascade::handle <CDM_MetaData>, TCollection_ExtendedString>;
%template(CDM_MapOfDocument) NCollection_Map <opencascade::handle <CDM_Document>, CDM_DocumentHasher>;
%template(CDM_DocumentHasher) NCollection_DefaultHasher <opencascade::handle <CDM_Document>>;
/* end templates declaration */

/* typedefs */
typedef NCollection_List <opencascade::handle <CDM_Reference>> CDM_ListOfReferences;
typedef NCollection_List <opencascade::handle <CDM_Reference>>::Iterator CDM_ListIteratorOfListOfReferences;
typedef NCollection_List <opencascade::handle <CDM_Document>> CDM_ListOfDocument;
typedef NCollection_List <opencascade::handle <CDM_Document>>::Iterator CDM_ListIteratorOfListOfDocument;
typedef NCollection_DataMap <TCollection_ExtendedString , opencascade::handle <CDM_Document>, TCollection_ExtendedString> CDM_PresentationDirectory;
typedef NCollection_DataMap <TCollection_ExtendedString , opencascade::handle <CDM_Document>, TCollection_ExtendedString>::Iterator CDM_DataMapIteratorOfPresentationDirectory;
typedef TColStd_DataMapOfStringInteger CDM_NamesDirectory;
typedef NCollection_DataMap <TCollection_ExtendedString , opencascade::handle <CDM_MetaData>, TCollection_ExtendedString> CDM_MetaDataLookUpTable;
typedef NCollection_DataMap <TCollection_ExtendedString , opencascade::handle <CDM_MetaData>, TCollection_ExtendedString>::Iterator CDM_DataMapIteratorOfMetaDataLookUpTable;
typedef NCollection_Map <opencascade::handle <CDM_Document>, CDM_DocumentHasher> CDM_MapOfDocument;
typedef NCollection_Map <opencascade::handle <CDM_Document>, CDM_DocumentHasher>::Iterator CDM_MapIteratorOfMapOfDocument;
typedef NCollection_DefaultHasher <opencascade::handle <CDM_Document>> CDM_DocumentHasher;
typedef CDM_Document * CDM_DocumentPointer;
/* end typedefs declaration */

/************************
* class CDM_Application *
************************/
%nodefaultctor CDM_Application;
class CDM_Application : public Standard_Transient {
	public:
		/****************** BeginOfUpdate ******************/
		%feature("compactdefaultargs") BeginOfUpdate;
		%feature("autodoc", "* this method is called before the update of a document. By default, writes in MessageDriver().
	:param aDocument:
	:type aDocument: CDM_Document
	:rtype: void") BeginOfUpdate;
		virtual void BeginOfUpdate (const opencascade::handle<CDM_Document> & aDocument);

		/****************** EndOfUpdate ******************/
		%feature("compactdefaultargs") EndOfUpdate;
		%feature("autodoc", "* this method is called affter the update of a document. By default, writes in MessageDriver().
	:param aDocument:
	:type aDocument: CDM_Document
	:param theStatus:
	:type theStatus: bool
	:param ErrorString:
	:type ErrorString: TCollection_ExtendedString
	:rtype: void") EndOfUpdate;
		virtual void EndOfUpdate (const opencascade::handle<CDM_Document> & aDocument,const Standard_Boolean theStatus,const TCollection_ExtendedString & ErrorString);

		/****************** MessageDriver ******************/
		%feature("compactdefaultargs") MessageDriver;
		%feature("autodoc", "* Returns default messenger;
	:rtype: opencascade::handle<Message_Messenger>") MessageDriver;
		virtual opencascade::handle<Message_Messenger> MessageDriver ();

		/****************** Name ******************/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "* Returns the application name.
	:rtype: TCollection_ExtendedString") Name;
		virtual TCollection_ExtendedString Name ();

		/****************** Resources ******************/
		%feature("compactdefaultargs") Resources;
		%feature("autodoc", "* The manager returned by this virtual method will be used to search for Format.Retrieval resource items.
	:rtype: opencascade::handle<Resource_Manager>") Resources;
		virtual opencascade::handle<Resource_Manager> Resources ();

		/****************** Version ******************/
		%feature("compactdefaultargs") Version;
		%feature("autodoc", "* Returns the application version.
	:rtype: TCollection_AsciiString") Version;
		virtual TCollection_AsciiString Version ();

		/****************** Write ******************/
		%feature("compactdefaultargs") Write;
		%feature("autodoc", "* writes the string in the application MessagerDriver.
	:param aString:
	:type aString: Standard_ExtString
	:rtype: None") Write;
		void Write (const Standard_ExtString aString);

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
		%feature("autodoc", "* appends a comment into comments of this document.
	:param aComment:
	:type aComment: TCollection_ExtendedString
	:rtype: None") AddComment;
		void AddComment (const TCollection_ExtendedString & aComment);

		/****************** Application ******************/
		%feature("compactdefaultargs") Application;
		%feature("autodoc", ":rtype: opencascade::handle<CDM_Application>") Application;
		const opencascade::handle<CDM_Application> & Application ();

		/****************** CanClose ******************/
		%feature("compactdefaultargs") CanClose;
		%feature("autodoc", ":rtype: CDM_CanCloseStatus") CanClose;
		CDM_CanCloseStatus CanClose ();

		/****************** CanCloseReference ******************/
		%feature("compactdefaultargs") CanCloseReference;
		%feature("autodoc", "* A referenced document may indicate through this virtual method that it does not allow the closing of aDocument which it references through the reference aReferenceIdentifier. By default returns Standard_True;;
	:param aDocument:
	:type aDocument: CDM_Document
	:param aReferenceIdentifier:
	:type aReferenceIdentifier: int
	:rtype: bool") CanCloseReference;
		virtual Standard_Boolean CanCloseReference (const opencascade::handle<CDM_Document> & aDocument,const Standard_Integer aReferenceIdentifier);

		/****************** ChangeStorageFormatVersion ******************/
		%feature("compactdefaultargs") ChangeStorageFormatVersion;
		%feature("autodoc", "* Sets <theVersion> of the format to be used to store the document
	:param theVersion:
	:type theVersion: int
	:rtype: None") ChangeStorageFormatVersion;
		void ChangeStorageFormatVersion (const Standard_Integer theVersion);

		/****************** Close ******************/
		%feature("compactdefaultargs") Close;
		%feature("autodoc", ":rtype: None") Close;
		void Close ();

		/****************** CloseReference ******************/
		%feature("compactdefaultargs") CloseReference;
		%feature("autodoc", "* A referenced document may update its internal data structure when {aDocument} which it references through the reference {aReferenceIdentifier} is being closed. By default this method does nothing.
	:param aDocument:
	:type aDocument: CDM_Document
	:param aReferenceIdentifier:
	:type aReferenceIdentifier: int
	:rtype: void") CloseReference;
		virtual void CloseReference (const opencascade::handle<CDM_Document> & aDocument,const Standard_Integer aReferenceIdentifier);

		/****************** Comment ******************/
		%feature("compactdefaultargs") Comment;
		%feature("autodoc", "* returns the first of associated comments. By defaut the comment is an empty string.
	:rtype: Standard_ExtString") Comment;
		Standard_ExtString Comment ();

		/****************** Comments ******************/
		%feature("compactdefaultargs") Comments;
		%feature("autodoc", "* returns the associated comments through <aComments>. Returns empty sequence if no comments are associated.
	:param aComments:
	:type aComments: TColStd_SequenceOfExtendedString
	:rtype: None") Comments;
		void Comments (TColStd_SequenceOfExtendedString & aComments);

		/****************** CopyReference ******************/
		%feature("compactdefaultargs") CopyReference;
		%feature("autodoc", "* Copies a reference to this document. This method avoid retrieval of referenced document. The arguments are the original document and a valid reference identifier Returns the local identifier.
	:param aFromDocument:
	:type aFromDocument: CDM_Document
	:param aReferenceIdentifier:
	:type aReferenceIdentifier: int
	:rtype: int") CopyReference;
		Standard_Integer CopyReference (const opencascade::handle<CDM_Document> & aFromDocument,const Standard_Integer aReferenceIdentifier);

		/****************** CreateReference ******************/
		%feature("compactdefaultargs") CreateReference;
		%feature("autodoc", "* Creates a reference from this document to {anOtherDocument}. Returns a reference identifier. This reference identifier is unique in the document and will not be used for the next references, even after the storing of the document. If there is already a reference between the two documents, the reference is not created, but its reference identifier is returned.
	:param anOtherDocument:
	:type anOtherDocument: CDM_Document
	:rtype: int") CreateReference;
		Standard_Integer CreateReference (const opencascade::handle<CDM_Document> & anOtherDocument);

		/****************** CreateReference ******************/
		%feature("compactdefaultargs") CreateReference;
		%feature("autodoc", ":param aMetaData:
	:type aMetaData: CDM_MetaData
	:param aReferenceIdentifier:
	:type aReferenceIdentifier: int
	:param anApplication:
	:type anApplication: CDM_Application
	:param aToDocumentVersion:
	:type aToDocumentVersion: int
	:param UseStorageConfiguration:
	:type UseStorageConfiguration: bool
	:rtype: None") CreateReference;
		void CreateReference (const opencascade::handle<CDM_MetaData> & aMetaData,const Standard_Integer aReferenceIdentifier,const opencascade::handle<CDM_Application> & anApplication,const Standard_Integer aToDocumentVersion,const Standard_Boolean UseStorageConfiguration);

		/****************** CreateReference ******************/
		%feature("compactdefaultargs") CreateReference;
		%feature("autodoc", ":param aMetaData:
	:type aMetaData: CDM_MetaData
	:param anApplication:
	:type anApplication: CDM_Application
	:param aDocumentVersion:
	:type aDocumentVersion: int
	:param UseStorageConfiguration:
	:type UseStorageConfiguration: bool
	:rtype: int") CreateReference;
		Standard_Integer CreateReference (const opencascade::handle<CDM_MetaData> & aMetaData,const opencascade::handle<CDM_Application> & anApplication,const Standard_Integer aDocumentVersion,const Standard_Boolean UseStorageConfiguration);

		/****************** DeepReferences ******************/
		%feature("compactdefaultargs") DeepReferences;
		%feature("autodoc", "* returns True is this document references aDocument;
	:param aDocument:
	:type aDocument: CDM_Document
	:rtype: bool") DeepReferences;
		Standard_Boolean DeepReferences (const opencascade::handle<CDM_Document> & aDocument);

		/****************** Description ******************/
		%feature("compactdefaultargs") Description;
		%feature("autodoc", "* gets the `FileFormat`.Description resource.
	:rtype: TCollection_ExtendedString") Description;
		TCollection_ExtendedString Description ();

		/****************** Document ******************/
		%feature("compactdefaultargs") Document;
		%feature("autodoc", "* Returns the To Document of the reference identified by aReferenceIdentifier. If the ToDocument is stored and has not yet been retrieved, this method will retrieve it.
	:param aReferenceIdentifier:
	:type aReferenceIdentifier: int
	:rtype: opencascade::handle<CDM_Document>") Document;
		opencascade::handle<CDM_Document> Document (const Standard_Integer aReferenceIdentifier);

		/****************** Extensions ******************/
		%feature("compactdefaultargs") Extensions;
		%feature("autodoc", "* by default empties the extensions.
	:param Extensions:
	:type Extensions: TColStd_SequenceOfExtendedString
	:rtype: void") Extensions;
		virtual void Extensions (TColStd_SequenceOfExtendedString & Extensions);

		/****************** FileExtension ******************/
		%feature("compactdefaultargs") FileExtension;
		%feature("autodoc", "* gets the Desktop.Domain.Application.`FileFormat`.FileExtension resource.
	:rtype: TCollection_ExtendedString") FileExtension;
		TCollection_ExtendedString FileExtension ();

		/****************** FindDescription ******************/
		%feature("compactdefaultargs") FindDescription;
		%feature("autodoc", ":rtype: bool") FindDescription;
		Standard_Boolean FindDescription ();

		/****************** FindFileExtension ******************/
		%feature("compactdefaultargs") FindFileExtension;
		%feature("autodoc", ":rtype: bool") FindFileExtension;
		Standard_Boolean FindFileExtension ();

		/****************** FindFromPresentation ******************/
		%feature("compactdefaultargs") FindFromPresentation;
		%feature("autodoc", "* returns the document having the given alphanumeric presentation.
	:param aPresentation:
	:type aPresentation: TCollection_ExtendedString
	:rtype: opencascade::handle<CDM_Document>") FindFromPresentation;
		static opencascade::handle<CDM_Document> FindFromPresentation (const TCollection_ExtendedString & aPresentation);

		/****************** FindPresentation ******************/
		%feature("compactdefaultargs") FindPresentation;
		%feature("autodoc", "* indicates whether a document having the given presentation does exist.
	:param aPresentation:
	:type aPresentation: TCollection_ExtendedString
	:rtype: bool") FindPresentation;
		static Standard_Boolean FindPresentation (const TCollection_ExtendedString & aPresentation);

		/****************** Folder ******************/
		%feature("compactdefaultargs") Folder;
		%feature("autodoc", ":rtype: TCollection_ExtendedString") Folder;
		TCollection_ExtendedString Folder ();

		/****************** FromReferencesNumber ******************/
		%feature("compactdefaultargs") FromReferencesNumber;
		%feature("autodoc", "* returns the number of references having this document as To Document.
	:rtype: int") FromReferencesNumber;
		Standard_Integer FromReferencesNumber ();

		/****************** GetAlternativeDocument ******************/
		%feature("compactdefaultargs") GetAlternativeDocument;
		%feature("autodoc", "* This method can be redefined to extract another document in a different format. For example, to extract a Shape from an applicative document.
	:param aFormat:
	:type aFormat: TCollection_ExtendedString
	:param anAlternativeDocument:
	:type anAlternativeDocument: CDM_Document
	:rtype: bool") GetAlternativeDocument;
		virtual Standard_Boolean GetAlternativeDocument (const TCollection_ExtendedString & aFormat,opencascade::handle<CDM_Document> & anAlternativeDocument);

		/****************** HasRequestedFolder ******************/
		%feature("compactdefaultargs") HasRequestedFolder;
		%feature("autodoc", ":rtype: bool") HasRequestedFolder;
		Standard_Boolean HasRequestedFolder ();

		/****************** HasRequestedPreviousVersion ******************/
		%feature("compactdefaultargs") HasRequestedPreviousVersion;
		%feature("autodoc", ":rtype: bool") HasRequestedPreviousVersion;
		Standard_Boolean HasRequestedPreviousVersion ();

		/****************** IsInSession ******************/
		%feature("compactdefaultargs") IsInSession;
		%feature("autodoc", "* returns True if the To Document of the reference identified by aReferenceIdentifier is in session, False if it corresponds to a not yet retrieved document.
	:param aReferenceIdentifier:
	:type aReferenceIdentifier: int
	:rtype: bool") IsInSession;
		Standard_Boolean IsInSession (const Standard_Integer aReferenceIdentifier);

		/****************** IsModified ******************/
		%feature("compactdefaultargs") IsModified;
		%feature("autodoc", "* returns true if the version is greater than the storage version
	:rtype: bool") IsModified;
		Standard_Boolean IsModified ();

		/****************** IsOpened ******************/
		%feature("compactdefaultargs") IsOpened;
		%feature("autodoc", ":rtype: bool") IsOpened;
		Standard_Boolean IsOpened ();

		/****************** IsOpened ******************/
		%feature("compactdefaultargs") IsOpened;
		%feature("autodoc", "* returns true if the document corresponding to the given reference has been retrieved and opened. Otherwise returns false. This method does not retrieve the referenced document
	:param aReferenceIdentifier:
	:type aReferenceIdentifier: int
	:rtype: bool") IsOpened;
		Standard_Boolean IsOpened (const Standard_Integer aReferenceIdentifier);

		/****************** IsReadOnly ******************/
		%feature("compactdefaultargs") IsReadOnly;
		%feature("autodoc", "* indicates that this document cannot be modified.
	:rtype: bool") IsReadOnly;
		Standard_Boolean IsReadOnly ();

		/****************** IsReadOnly ******************/
		%feature("compactdefaultargs") IsReadOnly;
		%feature("autodoc", "* indicates that the referenced document cannot be modified,
	:param aReferenceIdentifier:
	:type aReferenceIdentifier: int
	:rtype: bool") IsReadOnly;
		Standard_Boolean IsReadOnly (const Standard_Integer aReferenceIdentifier);

		/****************** IsStored ******************/
		%feature("compactdefaultargs") IsStored;
		%feature("autodoc", "* returns True if the To Document of the reference identified by aReferenceIdentifier has already been stored, False otherwise.
	:param aReferenceIdentifier:
	:type aReferenceIdentifier: int
	:rtype: bool") IsStored;
		Standard_Boolean IsStored (const Standard_Integer aReferenceIdentifier);

		/****************** IsStored ******************/
		%feature("compactdefaultargs") IsStored;
		%feature("autodoc", ":rtype: bool") IsStored;
		Standard_Boolean IsStored ();

		/****************** IsUpToDate ******************/
		%feature("compactdefaultargs") IsUpToDate;
		%feature("autodoc", "* returns true if the modification counter found in the given reference is equal to the actual modification counter of the To Document. This method is able to deal with a reference to a not retrieved document.
	:param aReferenceIdentifier:
	:type aReferenceIdentifier: int
	:rtype: bool") IsUpToDate;
		Standard_Boolean IsUpToDate (const Standard_Integer aReferenceIdentifier);

		/****************** LoadResources ******************/
		%feature("compactdefaultargs") LoadResources;
		%feature("autodoc", "* read (or rereads) the following resource.
	:rtype: None") LoadResources;
		void LoadResources ();

		/****************** MetaData ******************/
		%feature("compactdefaultargs") MetaData;
		%feature("autodoc", ":rtype: opencascade::handle<CDM_MetaData>") MetaData;
		opencascade::handle<CDM_MetaData> MetaData ();

		/****************** Modifications ******************/
		%feature("compactdefaultargs") Modifications;
		%feature("autodoc", "* returns the current modification counter.
	:rtype: int") Modifications;
		Standard_Integer Modifications ();

		/****************** Modify ******************/
		%feature("compactdefaultargs") Modify;
		%feature("autodoc", "* Indicates that this document has been modified. This method increments the modification counter.
	:rtype: None") Modify;
		void Modify ();

		/****************** Name ******************/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "* returns the name of the metadata of the To Document of the reference identified by aReferenceIdentifier.
	:param aReferenceIdentifier:
	:type aReferenceIdentifier: int
	:rtype: TCollection_ExtendedString") Name;
		TCollection_ExtendedString Name (const Standard_Integer aReferenceIdentifier);

		/****************** Open ******************/
		%feature("compactdefaultargs") Open;
		%feature("autodoc", ":param anApplication:
	:type anApplication: CDM_Application
	:rtype: None") Open;
		void Open (const opencascade::handle<CDM_Application> & anApplication);

		/****************** Presentation ******************/
		%feature("compactdefaultargs") Presentation;
		%feature("autodoc", "* Returns an alphanumeric string identifying this document in a unique manner in the current process. The presentation may change when the document is stored. Tries to get the 'FileFormat`.Presentation resource This item is used to give a default presentation to the document.
	:rtype: Standard_ExtString") Presentation;
		Standard_ExtString Presentation ();


        %feature("autodoc", "1");
        %extend{
            std::string PrintToString() {
            std::stringstream s;
            self->Print(s);
            return s.str();}
        };
        		/****************** Reference ******************/
		%feature("compactdefaultargs") Reference;
		%feature("autodoc", ":param aReferenceIdentifier:
	:type aReferenceIdentifier: int
	:rtype: opencascade::handle<CDM_Reference>") Reference;
		opencascade::handle<CDM_Reference> Reference (const Standard_Integer aReferenceIdentifier);

		/****************** ReferenceCounter ******************/
		%feature("compactdefaultargs") ReferenceCounter;
		%feature("autodoc", ":rtype: int") ReferenceCounter;
		Standard_Integer ReferenceCounter ();

		/****************** RemoveAllReferences ******************/
		%feature("compactdefaultargs") RemoveAllReferences;
		%feature("autodoc", "* Removes all references having this document for From Document.
	:rtype: None") RemoveAllReferences;
		void RemoveAllReferences ();

		/****************** RemoveReference ******************/
		%feature("compactdefaultargs") RemoveReference;
		%feature("autodoc", "* Removes the reference between the From Document and the To Document identified by a reference identifier.
	:param aReferenceIdentifier:
	:type aReferenceIdentifier: int
	:rtype: None") RemoveReference;
		void RemoveReference (const Standard_Integer aReferenceIdentifier);

		/****************** RequestedComment ******************/
		%feature("compactdefaultargs") RequestedComment;
		%feature("autodoc", ":rtype: TCollection_ExtendedString") RequestedComment;
		TCollection_ExtendedString RequestedComment ();

		/****************** RequestedFolder ******************/
		%feature("compactdefaultargs") RequestedFolder;
		%feature("autodoc", ":rtype: TCollection_ExtendedString") RequestedFolder;
		TCollection_ExtendedString RequestedFolder ();

		/****************** RequestedName ******************/
		%feature("compactdefaultargs") RequestedName;
		%feature("autodoc", "* determines under which the document is going to be store. By default the name of the document wil be -- used. If the document has no name its presentation will be used.
	:rtype: TCollection_ExtendedString") RequestedName;
		TCollection_ExtendedString RequestedName ();

		/****************** RequestedPreviousVersion ******************/
		%feature("compactdefaultargs") RequestedPreviousVersion;
		%feature("autodoc", ":rtype: TCollection_ExtendedString") RequestedPreviousVersion;
		TCollection_ExtendedString RequestedPreviousVersion ();

		/****************** SetComment ******************/
		%feature("compactdefaultargs") SetComment;
		%feature("autodoc", "* associates a comment with this document.
	:param aComment:
	:type aComment: TCollection_ExtendedString
	:rtype: None") SetComment;
		void SetComment (const TCollection_ExtendedString & aComment);

		/****************** SetComments ******************/
		%feature("compactdefaultargs") SetComments;
		%feature("autodoc", "* associates a comments with this document.
	:param aComments:
	:type aComments: TColStd_SequenceOfExtendedString
	:rtype: None") SetComments;
		void SetComments (const TColStd_SequenceOfExtendedString & aComments);

		/****************** SetIsReadOnly ******************/
		%feature("compactdefaultargs") SetIsReadOnly;
		%feature("autodoc", ":rtype: None") SetIsReadOnly;
		void SetIsReadOnly ();

		/****************** SetIsUpToDate ******************/
		%feature("compactdefaultargs") SetIsUpToDate;
		%feature("autodoc", "* Resets the modification counter in the given reference to the actual modification counter of its To Document. This method should be called after the application has updated this document.
	:param aReferenceIdentifier:
	:type aReferenceIdentifier: int
	:rtype: None") SetIsUpToDate;
		void SetIsUpToDate (const Standard_Integer aReferenceIdentifier);

		/****************** SetMetaData ******************/
		%feature("compactdefaultargs") SetMetaData;
		%feature("autodoc", "* associates database information to a document which has been stored. The name of the document is now the name which has beenused to store the data.
	:param aMetaData:
	:type aMetaData: CDM_MetaData
	:rtype: None") SetMetaData;
		void SetMetaData (const opencascade::handle<CDM_MetaData> & aMetaData);

		/****************** SetModifications ******************/
		%feature("compactdefaultargs") SetModifications;
		%feature("autodoc", ":param Modifications:
	:type Modifications: int
	:rtype: None") SetModifications;
		void SetModifications (const Standard_Integer Modifications);

		/****************** SetReferenceCounter ******************/
		%feature("compactdefaultargs") SetReferenceCounter;
		%feature("autodoc", ":param aReferenceCounter:
	:type aReferenceCounter: int
	:rtype: None") SetReferenceCounter;
		void SetReferenceCounter (const Standard_Integer aReferenceCounter);

		/****************** SetRequestedComment ******************/
		%feature("compactdefaultargs") SetRequestedComment;
		%feature("autodoc", "* defines the Comment with which the object should be stored.
	:param aComment:
	:type aComment: TCollection_ExtendedString
	:rtype: None") SetRequestedComment;
		void SetRequestedComment (const TCollection_ExtendedString & aComment);

		/****************** SetRequestedFolder ******************/
		%feature("compactdefaultargs") SetRequestedFolder;
		%feature("autodoc", "* defines the folder in which the object should be stored.
	:param aFolder:
	:type aFolder: TCollection_ExtendedString
	:rtype: None") SetRequestedFolder;
		void SetRequestedFolder (const TCollection_ExtendedString & aFolder);

		/****************** SetRequestedName ******************/
		%feature("compactdefaultargs") SetRequestedName;
		%feature("autodoc", "* defines the name under which the object should be stored.
	:param aName:
	:type aName: TCollection_ExtendedString
	:rtype: None") SetRequestedName;
		void SetRequestedName (const TCollection_ExtendedString & aName);

		/****************** SetRequestedPreviousVersion ******************/
		%feature("compactdefaultargs") SetRequestedPreviousVersion;
		%feature("autodoc", ":param aPreviousVersion:
	:type aPreviousVersion: TCollection_ExtendedString
	:rtype: None") SetRequestedPreviousVersion;
		void SetRequestedPreviousVersion (const TCollection_ExtendedString & aPreviousVersion);

		/****************** ShallowReferences ******************/
		%feature("compactdefaultargs") ShallowReferences;
		%feature("autodoc", "* returns True is this document references aDocument;
	:param aDocument:
	:type aDocument: CDM_Document
	:rtype: bool") ShallowReferences;
		Standard_Boolean ShallowReferences (const opencascade::handle<CDM_Document> & aDocument);

		/****************** StorageFormat ******************/
		%feature("compactdefaultargs") StorageFormat;
		%feature("autodoc", "* The Storage Format is the key which is used to determine in the application resources the storage driver plugin, the file extension and other data used to store the document.
	:rtype: TCollection_ExtendedString") StorageFormat;
		virtual TCollection_ExtendedString StorageFormat ();

		/****************** StorageFormatVersion ******************/
		%feature("compactdefaultargs") StorageFormatVersion;
		%feature("autodoc", "* Returns version of the format to be used to store the document
	:rtype: int") StorageFormatVersion;
		Standard_Integer StorageFormatVersion ();

		/****************** StorageVersion ******************/
		%feature("compactdefaultargs") StorageVersion;
		%feature("autodoc", "* returns the value of the modification counter at the time of storage. By default returns 0.
	:rtype: int") StorageVersion;
		Standard_Integer StorageVersion ();

		/****************** ToReferencesNumber ******************/
		%feature("compactdefaultargs") ToReferencesNumber;
		%feature("autodoc", "* returns the number of references having this document as From Document.
	:rtype: int") ToReferencesNumber;
		Standard_Integer ToReferencesNumber ();

		/****************** UnModify ******************/
		%feature("compactdefaultargs") UnModify;
		%feature("autodoc", ":rtype: None") UnModify;
		void UnModify ();

		/****************** UnsetIsReadOnly ******************/
		%feature("compactdefaultargs") UnsetIsReadOnly;
		%feature("autodoc", ":rtype: None") UnsetIsReadOnly;
		void UnsetIsReadOnly ();

		/****************** UnsetIsStored ******************/
		%feature("compactdefaultargs") UnsetIsStored;
		%feature("autodoc", ":rtype: None") UnsetIsStored;
		void UnsetIsStored ();

		/****************** UnsetRequestedPreviousVersion ******************/
		%feature("compactdefaultargs") UnsetRequestedPreviousVersion;
		%feature("autodoc", ":rtype: None") UnsetRequestedPreviousVersion;
		void UnsetRequestedPreviousVersion ();

		/****************** Update ******************/
		%feature("compactdefaultargs") Update;
		%feature("autodoc", "* The Update method will be called once for each reference, but it should not perform any computation, to avoid multiple computation of a same document.
	:param aToDocument:
	:type aToDocument: CDM_Document
	:param aReferenceIdentifier:
	:type aReferenceIdentifier: int
	:param aModifContext:
	:type aModifContext: Standard_Address
	:rtype: void") Update;
		virtual void Update (const opencascade::handle<CDM_Document> & aToDocument,const Standard_Integer aReferenceIdentifier,const Standard_Address aModifContext);

		/****************** Update ******************/
		%feature("compactdefaultargs") Update;
		%feature("autodoc", "* This method Update will be called to signal the end of the modified references list. The document should be recomputed and UpdateFromDocuments should be called. Update should returns True in case of success, false otherwise. In case of Failure, additional information can be given in ErrorString.
	:param ErrorString:
	:type ErrorString: TCollection_ExtendedString
	:rtype: bool") Update;
		virtual Standard_Boolean Update (TCollection_ExtendedString & ErrorString);

		/****************** Update ******************/
		%feature("compactdefaultargs") Update;
		%feature("autodoc", "* the following method should be used instead: //! Update(me:mutable; ErrorString: out ExtendedString from TCollection) returns Boolean from Standard
	:rtype: void") Update;
		virtual void Update ();

		/****************** UpdateFromDocuments ******************/
		%feature("compactdefaultargs") UpdateFromDocuments;
		%feature("autodoc", "* call virtual method Update on all referencing documents. This method keeps the list of the -- documents to process.It may be the starting of an update -- cycle. If not, the reentrant calls made by Update method (without argument) will append the referencing documents to the list and call the Update method (with arguments). Only the first call to UpdateFromDocuments generate call to Update().
	:param aModifContext:
	:type aModifContext: Standard_Address
	:rtype: None") UpdateFromDocuments;
		void UpdateFromDocuments (const Standard_Address aModifContext);

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
		%feature("autodoc", ":rtype: opencascade::handle<CDM_Document>") Document;
		opencascade::handle<CDM_Document> Document ();

		/****************** FileName ******************/
		%feature("compactdefaultargs") FileName;
		%feature("autodoc", ":rtype: TCollection_ExtendedString") FileName;
		TCollection_ExtendedString FileName ();

		/****************** Folder ******************/
		%feature("compactdefaultargs") Folder;
		%feature("autodoc", "* returns the folder in which the meta-data has to be created or has to be found.
	:rtype: TCollection_ExtendedString") Folder;
		TCollection_ExtendedString Folder ();

		/****************** HasVersion ******************/
		%feature("compactdefaultargs") HasVersion;
		%feature("autodoc", "* indicates that the version has to be taken into account when searching the corresponding meta-data.
	:rtype: bool") HasVersion;
		Standard_Boolean HasVersion ();

		/****************** IsReadOnly ******************/
		%feature("compactdefaultargs") IsReadOnly;
		%feature("autodoc", ":rtype: bool") IsReadOnly;
		Standard_Boolean IsReadOnly ();

		/****************** IsRetrieved ******************/
		%feature("compactdefaultargs") IsRetrieved;
		%feature("autodoc", ":rtype: bool") IsRetrieved;
		Standard_Boolean IsRetrieved ();

		/****************** LookUp ******************/
		%feature("compactdefaultargs") LookUp;
		%feature("autodoc", ":param aFolder:
	:type aFolder: TCollection_ExtendedString
	:param aName:
	:type aName: TCollection_ExtendedString
	:param aPath:
	:type aPath: TCollection_ExtendedString
	:param aFileName:
	:type aFileName: TCollection_ExtendedString
	:param ReadOnly:
	:type ReadOnly: bool
	:rtype: opencascade::handle<CDM_MetaData>") LookUp;
		static opencascade::handle<CDM_MetaData> LookUp (const TCollection_ExtendedString & aFolder,const TCollection_ExtendedString & aName,const TCollection_ExtendedString & aPath,const TCollection_ExtendedString & aFileName,const Standard_Boolean ReadOnly);

		/****************** LookUp ******************/
		%feature("compactdefaultargs") LookUp;
		%feature("autodoc", ":param aFolder:
	:type aFolder: TCollection_ExtendedString
	:param aName:
	:type aName: TCollection_ExtendedString
	:param aPath:
	:type aPath: TCollection_ExtendedString
	:param aVersion:
	:type aVersion: TCollection_ExtendedString
	:param aFileName:
	:type aFileName: TCollection_ExtendedString
	:param ReadOnly:
	:type ReadOnly: bool
	:rtype: opencascade::handle<CDM_MetaData>") LookUp;
		static opencascade::handle<CDM_MetaData> LookUp (const TCollection_ExtendedString & aFolder,const TCollection_ExtendedString & aName,const TCollection_ExtendedString & aPath,const TCollection_ExtendedString & aVersion,const TCollection_ExtendedString & aFileName,const Standard_Boolean ReadOnly);

		/****************** Name ******************/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "* returns the name under which the meta-data has to be created or has to be found.
	:rtype: TCollection_ExtendedString") Name;
		TCollection_ExtendedString Name ();

		/****************** Path ******************/
		%feature("compactdefaultargs") Path;
		%feature("autodoc", ":rtype: TCollection_ExtendedString") Path;
		TCollection_ExtendedString Path ();


        %feature("autodoc", "1");
        %extend{
            std::string PrintToString() {
            std::stringstream s;
            self->Print(s);
            return s.str();}
        };
        		/****************** SetIsReadOnly ******************/
		%feature("compactdefaultargs") SetIsReadOnly;
		%feature("autodoc", ":rtype: None") SetIsReadOnly;
		void SetIsReadOnly ();

		/****************** UnsetDocument ******************/
		%feature("compactdefaultargs") UnsetDocument;
		%feature("autodoc", ":rtype: None") UnsetDocument;
		void UnsetDocument ();

		/****************** UnsetIsReadOnly ******************/
		%feature("compactdefaultargs") UnsetIsReadOnly;
		%feature("autodoc", ":rtype: None") UnsetIsReadOnly;
		void UnsetIsReadOnly ();

		/****************** Version ******************/
		%feature("compactdefaultargs") Version;
		%feature("autodoc", "* returns the version under which the meta-data has to be found. Warning: raises NoSuchObject from Standard if no Version has been defined
	:rtype: TCollection_ExtendedString") Version;
		TCollection_ExtendedString Version ();

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
		%feature("autodoc", ":rtype: int") DocumentVersion;
		Standard_Integer DocumentVersion ();

		/****************** FromDocument ******************/
		%feature("compactdefaultargs") FromDocument;
		%feature("autodoc", ":rtype: opencascade::handle<CDM_Document>") FromDocument;
		opencascade::handle<CDM_Document> FromDocument ();

		/****************** IsReadOnly ******************/
		%feature("compactdefaultargs") IsReadOnly;
		%feature("autodoc", ":rtype: bool") IsReadOnly;
		Standard_Boolean IsReadOnly ();

		/****************** ReferenceIdentifier ******************/
		%feature("compactdefaultargs") ReferenceIdentifier;
		%feature("autodoc", ":rtype: int") ReferenceIdentifier;
		Standard_Integer ReferenceIdentifier ();

		/****************** ToDocument ******************/
		%feature("compactdefaultargs") ToDocument;
		%feature("autodoc", ":rtype: opencascade::handle<CDM_Document>") ToDocument;
		opencascade::handle<CDM_Document> ToDocument ();

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
		%feature("autodoc", ":param aDocument:
	:type aDocument: CDM_Document
	:rtype: None") CDM_ReferenceIterator;
		 CDM_ReferenceIterator (const opencascade::handle<CDM_Document> & aDocument);

		/****************** Document ******************/
		%feature("compactdefaultargs") Document;
		%feature("autodoc", ":rtype: opencascade::handle<CDM_Document>") Document;
		opencascade::handle<CDM_Document> Document ();

		/****************** DocumentVersion ******************/
		%feature("compactdefaultargs") DocumentVersion;
		%feature("autodoc", "* returns the Document Version in the reference.
	:rtype: int") DocumentVersion;
		Standard_Integer DocumentVersion ();

		/****************** More ******************/
		%feature("compactdefaultargs") More;
		%feature("autodoc", ":rtype: bool") More;
		Standard_Boolean More ();

		/****************** Next ******************/
		%feature("compactdefaultargs") Next;
		%feature("autodoc", ":rtype: None") Next;
		void Next ();

		/****************** ReferenceIdentifier ******************/
		%feature("compactdefaultargs") ReferenceIdentifier;
		%feature("autodoc", ":rtype: int") ReferenceIdentifier;
		Standard_Integer ReferenceIdentifier ();

};


%extend CDM_ReferenceIterator {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/* harray1 classes */
/* harray2 classes */
/* hsequence classes */
