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

/*
This file was automatically generated using the pythonocc_generator, see
https://github.com/tpaviot/pythonocc-generator.

This file is platform independant, but was generated under the following
conditions:

- operating system : debian Linux 4.15.0-66-generic
- occt version targeted : 7.4.0
*/

%define TOBJDOCSTRING
"TObj module, see official documentation at
https://www.opencascade.com/doc/occt-7.4.0/refman/html/package_TObj.html"
%enddef
%module (package="OCC.Core", docstring=TOBJDOCSTRING) TObj

#pragma SWIG nowarn=504,325,503,520,350,351,383,389,394,395, 404

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
#include<TObj_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<TCollection_module.hxx>
#include<TDocStd_module.hxx>
#include<Message_module.hxx>
#include<TDF_module.hxx>
#include<gp_module.hxx>
#include<PCDM_module.hxx>
#include<CDM_module.hxx>
#include<CDF_module.hxx>
#include<Resource_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import TCollection.i
%import TDocStd.i
%import Message.i
%import TDF.i
%import gp.i
/* public enums */
enum TObj_DeletingMode {
	TObj_FreeOnly = 0,
	TObj_KeepDepending = 1,
	TObj_Forced = 2,
};

/* end public enums declaration */

/* handles */
%wrap_handle(TObj_Application)
%wrap_handle(TObj_CheckModel)
%wrap_handle(TObj_Model)
%wrap_handle(TObj_Object)
%wrap_handle(TObj_ObjectIterator)
%wrap_handle(TObj_TIntSparseArray)
%wrap_handle(TObj_TModel)
%wrap_handle(TObj_TNameContainer)
%wrap_handle(TObj_TObject)
%wrap_handle(TObj_TReference)
%wrap_handle(TObj_TXYZ)
%wrap_handle(TObj_LabelIterator)
%wrap_handle(TObj_ModelIterator)
%wrap_handle(TObj_Partition)
%wrap_handle(TObj_SequenceIterator)
%wrap_handle(TObj_HiddenPartition)
%wrap_handle(TObj_OcafObjectIterator)
%wrap_handle(TObj_ReferenceIterator)
%wrap_handle(TObj_HSequenceOfObject)
/* end handles declaration */

/* templates */
%template(TObj_TIntSparseArray_VecOfData) NCollection_SparseArray <Standard_Integer>;
%template(TObj_TIntSparseArray_MapOfData) NCollection_SparseArray <Standard_Integer>;
%template(TObj_DataMapOfNameLabel) NCollection_DataMap <opencascade::handle <TCollection_HExtendedString>, TDF_Label>;
%template(TObj_DataMapOfObjectHSequenceOcafObjects) NCollection_DataMap <opencascade::handle <TObj_Object>, opencascade::handle <TObj_HSequenceOfObject>>;
%template(TObj_DataMapOfStringPointer) NCollection_DataMap <TCollection_AsciiString , Standard_Address>;
%template(TObj_SequenceOfIterator) NCollection_Sequence <opencascade::handle <TObj_ObjectIterator>>;
%template(TObj_SequenceOfObject) NCollection_Sequence <opencascade::handle <TObj_Object>>;
/* end templates declaration */

/* typedefs */
typedef NCollection_SparseArray <Standard_Integer> TObj_TIntSparseArray_VecOfData;
typedef NCollection_SparseArray <Standard_Integer> TObj_TIntSparseArray_MapOfData;
typedef NCollection_DataMap <opencascade::handle <TCollection_HExtendedString>, TDF_Label> TObj_DataMapOfNameLabel;
typedef NCollection_DataMap <opencascade::handle <TObj_Object>, opencascade::handle <TObj_HSequenceOfObject>> TObj_DataMapOfObjectHSequenceOcafObjects;
typedef NCollection_DataMap <TCollection_AsciiString , Standard_Address> TObj_DataMapOfStringPointer;
typedef NCollection_Sequence <opencascade::handle <TObj_ObjectIterator>> TObj_SequenceOfIterator;
typedef NCollection_Sequence <opencascade::handle <TObj_Object>> TObj_SequenceOfObject;
/* end typedefs declaration */

%nodefaultctor TObj_Application;
class TObj_Application : public TDocStd_Application {
	public:
		%feature("compactdefaultargs") CreateNewDocument;
		%feature("autodoc", "	* Create the OCAF document from scratch

	:param theDoc:
	:type theDoc: opencascade::handle<TDocStd_Document> &
	:param theFormat:
	:type theFormat: TCollection_ExtendedString &
	:rtype: bool
") CreateNewDocument;
		Standard_Boolean CreateNewDocument (opencascade::handle<TDocStd_Document> & theDoc,const TCollection_ExtendedString & theFormat);
		%feature("compactdefaultargs") ErrorMessage;
		%feature("autodoc", "	* Signal error during Load or Save Default imiplementation is empty

	:param theMsg:
	:type theMsg: TCollection_ExtendedString &
	:param theLevel:
	:type theLevel: Message_Gravity
	:rtype: None
") ErrorMessage;
		void ErrorMessage (const TCollection_ExtendedString & theMsg,const Message_Gravity theLevel);
		%feature("compactdefaultargs") ErrorMessage;
		%feature("autodoc", "	* Signal error during Load or Save Default imiplementation invoke previous declaration with 0

	:param theMsg:
	:type theMsg: TCollection_ExtendedString &
	:rtype: None
") ErrorMessage;
		void ErrorMessage (const TCollection_ExtendedString & theMsg);
		%feature("compactdefaultargs") GetInstance;
		%feature("autodoc", "	* Returns static instance of the application

	:rtype: opencascade::handle<TObj_Application>
") GetInstance;
		static opencascade::handle<TObj_Application> GetInstance ();
		%feature("compactdefaultargs") IsVerbose;
		%feature("autodoc", "	* Returns the verbose flag

	:rtype: bool
") IsVerbose;
		Standard_Boolean IsVerbose ();
		%feature("compactdefaultargs") LoadDocument;
		%feature("autodoc", "	* Loading the OCAF document from a file

	:param theSourceFile:
	:type theSourceFile: TCollection_ExtendedString &
	:param theTargetDoc:
	:type theTargetDoc: opencascade::handle<TDocStd_Document> &
	:rtype: bool
") LoadDocument;
		virtual Standard_Boolean LoadDocument (const TCollection_ExtendedString & theSourceFile,opencascade::handle<TDocStd_Document> & theTargetDoc);
		%feature("compactdefaultargs") Messenger;
		%feature("autodoc", "	* Returns reference to associated messenger handle

	:rtype: opencascade::handle<Message_Messenger>
") Messenger;
		opencascade::handle<Message_Messenger> & Messenger ();
		%feature("compactdefaultargs") ResourcesName;
		%feature("autodoc", "	* /** * Redefined OCAF methods */ Return name of resource (i.e. 'TObj')

	:rtype: char *
") ResourcesName;
		const char * ResourcesName ();
		%feature("compactdefaultargs") SaveDocument;
		%feature("autodoc", "	* /** * Load/Save support */ Saving the OCAF document to a file

	:param theSourceDoc:
	:type theSourceDoc: opencascade::handle<TDocStd_Document> &
	:param theTargetFile:
	:type theTargetFile: TCollection_ExtendedString &
	:rtype: bool
") SaveDocument;
		virtual Standard_Boolean SaveDocument (const opencascade::handle<TDocStd_Document> & theSourceDoc,const TCollection_ExtendedString & theTargetFile);
		%feature("compactdefaultargs") SetVerbose;
		%feature("autodoc", "	* Sets the verbose flag, meaning that load/save models should show CPU and elapsed times

	:param isVerbose:
	:type isVerbose: bool
	:rtype: None
") SetVerbose;
		void SetVerbose (const Standard_Boolean isVerbose);
};


%make_alias(TObj_Application)

%extend TObj_Application {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TObj_Assistant;
class TObj_Assistant {
	public:
		%feature("compactdefaultargs") BindModel;
		%feature("autodoc", "	* Binds model to the map

	:param theModel:
	:type theModel: opencascade::handle<TObj_Model>
	:rtype: None
") BindModel;
		static void BindModel (const opencascade::handle<TObj_Model> theModel);
		%feature("compactdefaultargs") BindType;
		%feature("autodoc", "	* Binds Standard_Type to the map; returns index of bound type

	:param theType:
	:type theType: opencascade::handle<Standard_Type> &
	:rtype: int
") BindType;
		static Standard_Integer BindType (const opencascade::handle<Standard_Type> & theType);
		%feature("compactdefaultargs") ClearModelMap;
		%feature("autodoc", "	* Clears all records from the model map

	:rtype: None
") ClearModelMap;
		static void ClearModelMap ();
		%feature("compactdefaultargs") ClearTypeMap;
		%feature("autodoc", "	* Clears map of types

	:rtype: None
") ClearTypeMap;
		static void ClearTypeMap ();
		%feature("compactdefaultargs") FindModel;
		%feature("autodoc", "	* /** * Interface for DataMap of Modeller name */ Finds model by name

	:param theName:
	:type theName: char *
	:rtype: opencascade::handle<TObj_Model>
") FindModel;
		static opencascade::handle<TObj_Model> FindModel (const char * theName);
		%feature("compactdefaultargs") FindType;
		%feature("autodoc", "	* /** * Interface for Map of Standard Types */ Finds Standard_Type by index; returns NULL handle if not found

	:param theTypeIndex:
	:type theTypeIndex: int
	:rtype: opencascade::handle<Standard_Type>
") FindType;
		static opencascade::handle<Standard_Type> FindType (const Standard_Integer theTypeIndex);
		%feature("compactdefaultargs") FindTypeIndex;
		%feature("autodoc", "	* Rinds index by Standard_Type; returns 0 if not found

	:param theType:
	:type theType: opencascade::handle<Standard_Type> &
	:rtype: int
") FindTypeIndex;
		static Standard_Integer FindTypeIndex (const opencascade::handle<Standard_Type> & theType);
		%feature("compactdefaultargs") GetAppVersion;
		%feature("autodoc", "	* Returns the version of application which wrote the currently read document. Returns 0 if it has not been set yet for the current document.

	:rtype: int
") GetAppVersion;
		static Standard_Integer GetAppVersion ();
		%feature("compactdefaultargs") GetCurrentModel;
		%feature("autodoc", "	* Returns current model

	:rtype: opencascade::handle<TObj_Model>
") GetCurrentModel;
		static opencascade::handle<TObj_Model> GetCurrentModel ();
		%feature("compactdefaultargs") SetCurrentModel;
		%feature("autodoc", "	* /** * Interface to the current model */ Sets current model

	:param theModel:
	:type theModel: opencascade::handle<TObj_Model> &
	:rtype: None
") SetCurrentModel;
		static void SetCurrentModel (const opencascade::handle<TObj_Model> & theModel);
		%feature("compactdefaultargs") UnSetCurrentModel;
		%feature("autodoc", "	* Unsets current model

	:rtype: None
") UnSetCurrentModel;
		static void UnSetCurrentModel ();
};


%extend TObj_Assistant {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TObj_CheckModel;
class TObj_CheckModel : public Message_Algorithm {
	public:
		%feature("compactdefaultargs") GetModel;
		%feature("autodoc", "	* Returns the checked model

	:rtype: opencascade::handle<TObj_Model>
") GetModel;
		const opencascade::handle<TObj_Model> & GetModel ();
		%feature("compactdefaultargs") IsToFix;
		%feature("autodoc", "	* Returns true if it is allowed to fix inconsistencies

	:rtype: bool
") IsToFix;
		Standard_Boolean IsToFix ();
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	* Performs all checks. Descendants should call parent method before doing own checks. This implementation checks OCAF references and back references between objects of the model. Returns true if no inconsistencies found.

	:rtype: bool
") Perform;
		Standard_Boolean Perform ();
		%feature("compactdefaultargs") SetToFix;
		%feature("autodoc", "	* Sets flag allowing fixing inconsistencies

	:param theToFix:
	:type theToFix: bool
	:rtype: None
") SetToFix;
		void SetToFix (const Standard_Boolean theToFix);
		%feature("compactdefaultargs") TObj_CheckModel;
		%feature("autodoc", "	* Initialize checker by model

	:param theModel:
	:type theModel: opencascade::handle<TObj_Model> &
	:rtype: None
") TObj_CheckModel;
		 TObj_CheckModel (const opencascade::handle<TObj_Model> & theModel);
};


%make_alias(TObj_CheckModel)

%extend TObj_CheckModel {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TObj_Model;
%ignore TObj_Model::~TObj_Model();
class TObj_Model : public Standard_Transient {
	public:
		%feature("compactdefaultargs") AbortCommand;
		%feature("autodoc", "	* Abort the Command transaction. Do nothing If there is no Command transaction open.

	:rtype: None
") AbortCommand;
		void AbortCommand ();
		%feature("compactdefaultargs") Close;
		%feature("autodoc", "	* /** * Work with document */ Close the model

	:rtype: bool
") Close;
		Standard_Boolean Close ();
		%feature("compactdefaultargs") CloseDocument;
		%feature("autodoc", "	* Close Free OCAF document

	:param theDoc:
	:type theDoc: opencascade::handle<TDocStd_Document> &
	:rtype: None
") CloseDocument;
		void CloseDocument (const opencascade::handle<TDocStd_Document> & theDoc);
		%feature("compactdefaultargs") CommitCommand;
		%feature("autodoc", "	* Commit the Command transaction. Do nothing If there is no Command transaction open.

	:rtype: None
") CommitCommand;
		void CommitCommand ();
		%feature("compactdefaultargs") CopyReferences;
		%feature("autodoc", "	* Copy references from me to the other

	:param theTarget:
	:type theTarget: opencascade::handle<TObj_Model> &
	:param theRelocTable:
	:type theRelocTable: opencascade::handle<TDF_RelocationTable> &
	:rtype: None
") CopyReferences;
		void CopyReferences (const opencascade::handle<TObj_Model> & theTarget,const opencascade::handle<TDF_RelocationTable> & theRelocTable);
		%feature("compactdefaultargs") FindObject;
		%feature("autodoc", "	* Returns an Object by given Name (or Null if not found).

	:param theName:
	:type theName: opencascade::handle<TCollection_HExtendedString> &
	:param theDictionary:
	:type theDictionary: opencascade::handle<TObj_TNameContainer> &
	:rtype: opencascade::handle<TObj_Object>
") FindObject;
		opencascade::handle<TObj_Object> FindObject (const opencascade::handle<TCollection_HExtendedString> & theName,const opencascade::handle<TObj_TNameContainer> & theDictionary);
		%feature("compactdefaultargs") GetApplication;
		%feature("autodoc", "	* /** * Methods for obtaining application */ Returns handle to static instance of the relevant application class

	:rtype: opencascade::handle<TObj_Application>
") GetApplication;
		const opencascade::handle<TObj_Application> GetApplication ();
		%feature("compactdefaultargs") GetChecker;
		%feature("autodoc", "	* Returns the tool checking model consistency. Descendant may redefine it to return its own tool.

	:rtype: opencascade::handle<TObj_CheckModel>
") GetChecker;
		opencascade::handle<TObj_CheckModel> GetChecker ();
		%feature("compactdefaultargs") GetChildren;
		%feature("autodoc", "	* Returns an Iterator on objects in the main partition

	:rtype: opencascade::handle<TObj_ObjectIterator>
") GetChildren;
		opencascade::handle<TObj_ObjectIterator> GetChildren ();
		%feature("compactdefaultargs") GetDictionary;
		%feature("autodoc", "	* /** * Internal methods */ Returns the map of names of the objects

	:rtype: opencascade::handle<TObj_TNameContainer>
") GetDictionary;
		opencascade::handle<TObj_TNameContainer> GetDictionary ();
		%feature("compactdefaultargs") GetDocument;
		%feature("autodoc", "	* Returns OCAF document of Model

	:rtype: opencascade::handle<TDocStd_Document>
") GetDocument;
		opencascade::handle<TDocStd_Document> GetDocument ();
		%feature("compactdefaultargs") GetDocumentModel;
		%feature("autodoc", "	* Returns model which contains a document with the label, or NULL handle if label is NULL

	:param theLabel:
	:type theLabel: TDF_Label &
	:rtype: opencascade::handle<TObj_Model>
") GetDocumentModel;
		static opencascade::handle<TObj_Model> GetDocumentModel (const TDF_Label & theLabel);
		%feature("compactdefaultargs") GetFile;
		%feature("autodoc", "	* Returns the full file name this model is to be saved to, or null if the model was not saved yet

	:rtype: opencascade::handle<TCollection_HExtendedString>
") GetFile;
		opencascade::handle<TCollection_HExtendedString> GetFile ();
		%feature("compactdefaultargs") GetFormat;
		%feature("autodoc", "	* /** * Methods for obtaining the version of Format */ Returns the format for save/restore. This implementation returns 'BinOcaf'. The method should be redefined for those models that should use another format.

	:rtype: TCollection_ExtendedString
") GetFormat;
		TCollection_ExtendedString GetFormat ();
		%feature("compactdefaultargs") GetFormatVersion;
		%feature("autodoc", "	* Returns the version of format stored in TObj file

	:rtype: int
") GetFormatVersion;
		Standard_Integer GetFormatVersion ();
		%feature("compactdefaultargs") GetGUID;
		%feature("autodoc", "	* /** * Definition of interface GUID */ Defines interface GUID for TObj_Model

	:rtype: Standard_GUID
") GetGUID;
		Standard_GUID GetGUID ();
		%feature("compactdefaultargs") GetLabel;
		%feature("autodoc", "	* /** * OCAF methods */ Returns OCAF label on which model data are stored.

	:rtype: TDF_Label
") GetLabel;
		TDF_Label GetLabel ();
		%feature("compactdefaultargs") GetMainPartition;
		%feature("autodoc", "	* Returns root object of model

	:rtype: opencascade::handle<TObj_Partition>
") GetMainPartition;
		opencascade::handle<TObj_Partition> GetMainPartition ();
		%feature("compactdefaultargs") GetModelName;
		%feature("autodoc", "	* /** * Methods for supporting unique naming of the objects in model */ Returns the name of the model

	:rtype: opencascade::handle<TCollection_HExtendedString>
") GetModelName;
		opencascade::handle<TCollection_HExtendedString> GetModelName ();
		%feature("compactdefaultargs") GetObjects;
		%feature("autodoc", "	* /** * Access to the objects in the model */ Returns an Iterator on all objects in the Model

	:rtype: opencascade::handle<TObj_ObjectIterator>
") GetObjects;
		opencascade::handle<TObj_ObjectIterator> GetObjects ();
		%feature("compactdefaultargs") GetRoot;
		%feature("autodoc", "	* /** * Methods for iteration on the model */ Returns root object of model

	:rtype: opencascade::handle<TObj_Object>
") GetRoot;
		opencascade::handle<TObj_Object> GetRoot ();
		%feature("compactdefaultargs") HasOpenCommand;
		%feature("autodoc", "	* /** * API for transaction mechanism */ Returns True if a Command transaction is open Starting, finishing the transaction

	:rtype: bool
") HasOpenCommand;
		Standard_Boolean HasOpenCommand ();
		%feature("compactdefaultargs") IsModified;
		%feature("autodoc", "	* Modification status

	:rtype: bool
") IsModified;
		Standard_Boolean IsModified ();
		%feature("compactdefaultargs") IsRegisteredName;
		%feature("autodoc", "	* Returns True is name is registered in the names map The input argument may be NULL handle, then model check in own global container

	:param theName:
	:type theName: opencascade::handle<TCollection_HExtendedString> &
	:param theDictionary:
	:type theDictionary: opencascade::handle<TObj_TNameContainer> &
	:rtype: bool
") IsRegisteredName;
		Standard_Boolean IsRegisteredName (const opencascade::handle<TCollection_HExtendedString> & theName,const opencascade::handle<TObj_TNameContainer> & theDictionary);
		%feature("compactdefaultargs") Load;
		%feature("autodoc", "	* /** * Implementation of Load/Save for OCAF based models */ Load the OCAF model from a file. If the filename is empty or file does not exists, it just initializes model by empty data.

	:param theFile:
	:type theFile: TCollection_ExtendedString &
	:rtype: bool
") Load;
		virtual Standard_Boolean Load (const TCollection_ExtendedString & theFile);
		%feature("compactdefaultargs") Messenger;
		%feature("autodoc", "	* Get messenger used for messages output (by default, the messenger from application is used)

	:rtype: opencascade::handle<Message_Messenger>
") Messenger;
		opencascade::handle<Message_Messenger> Messenger ();
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "	* This function have to create a new model with type like me

	:rtype: opencascade::handle<TObj_Model>
") NewEmpty;
		opencascade::handle<TObj_Model> NewEmpty ();
		%feature("compactdefaultargs") OpenCommand;
		%feature("autodoc", "	* Open a new command transaction.

	:rtype: None
") OpenCommand;
		void OpenCommand ();
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	* /** * Methods for clone model */ Pastes me to the new model references will not be copied if theRelocTable is not 0 if theRelocTable is not NULL theRelocTable is filled by objects

	:param theModel:
	:type theModel: opencascade::handle<TObj_Model>
	:param theRelocTable: default value is 0
	:type theRelocTable: opencascade::handle<TDF_RelocationTable>
	:rtype: bool
") Paste;
		Standard_Boolean Paste (opencascade::handle<TObj_Model> theModel,opencascade::handle<TDF_RelocationTable> theRelocTable = 0);
		%feature("compactdefaultargs") RegisterName;
		%feature("autodoc", "	* Register name in the map The input argument may be NULL handle, then model check in own global container

	:param theName:
	:type theName: opencascade::handle<TCollection_HExtendedString> &
	:param theLabel:
	:type theLabel: TDF_Label &
	:param theDictionary:
	:type theDictionary: opencascade::handle<TObj_TNameContainer> &
	:rtype: None
") RegisterName;
		void RegisterName (const opencascade::handle<TCollection_HExtendedString> & theName,const TDF_Label & theLabel,const opencascade::handle<TObj_TNameContainer> & theDictionary);
		%feature("compactdefaultargs") Save;
		%feature("autodoc", "	* Save the model to the same file

	:rtype: bool
") Save;
		Standard_Boolean Save ();
		%feature("compactdefaultargs") SaveAs;
		%feature("autodoc", "	* Save the model to a file

	:param theFile:
	:type theFile: TCollection_ExtendedString &
	:rtype: bool
") SaveAs;
		virtual Standard_Boolean SaveAs (const TCollection_ExtendedString & theFile);
		%feature("compactdefaultargs") SetLabel;
		%feature("autodoc", "	* Sets OCAF label on which model data are stored. Used by persistence mechanism.

	:param theLabel:
	:type theLabel: TDF_Label &
	:rtype: None
") SetLabel;
		void SetLabel (const TDF_Label & theLabel);
		%feature("compactdefaultargs") SetMessenger;
		%feature("autodoc", "	* /** * Messages mechanism */ Set messenger to use for messages output

	:param theMsgr:
	:type theMsgr: opencascade::handle<Message_Messenger> &
	:rtype: None
") SetMessenger;
		void SetMessenger (const opencascade::handle<Message_Messenger> & theMsgr);
		%feature("compactdefaultargs") SetModified;
		%feature("autodoc", "	* Sets modification status

	:param theModified:
	:type theModified: bool
	:rtype: None
") SetModified;
		void SetModified (const Standard_Boolean theModified);
		%feature("compactdefaultargs") SetNewName;
		%feature("autodoc", "	* Sets new unique name for the object

	:param theObject:
	:type theObject: opencascade::handle<TObj_Object> &
	:rtype: None
") SetNewName;
		static void SetNewName (const opencascade::handle<TObj_Object> & theObject);
		%feature("compactdefaultargs") UnRegisterName;
		%feature("autodoc", "	* Unregisters name from the map The input argument may be NULL handle, then model check in own global container

	:param theName:
	:type theName: opencascade::handle<TCollection_HExtendedString> &
	:param theDictionary:
	:type theDictionary: opencascade::handle<TObj_TNameContainer> &
	:rtype: None
") UnRegisterName;
		void UnRegisterName (const opencascade::handle<TCollection_HExtendedString> & theName,const opencascade::handle<TObj_TNameContainer> & theDictionary);
		%feature("compactdefaultargs") Update;
		%feature("autodoc", "	* /** * Methods for updating model */ this method is called before activating this model

	:rtype: bool
") Update;
		Standard_Boolean Update ();
};


%make_alias(TObj_Model)

%extend TObj_Model {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TObj_Object;
class TObj_Object : public Standard_Transient {
	public:
/* public enums */
enum TypeFlags {
	Visible = 1,
};

enum ObjectState {
	ObjectState_Hidden = 1,
	ObjectState_Saved = 2,
	ObjectState_Imported = 4,
	ObjectState_ImportedByFile = 8,
	ObjectState_Ordered = 16,
};

/* end public enums declaration */

		%feature("compactdefaultargs") AddBackReference;
		%feature("autodoc", "	* Registers another object as being dependent on this one. Stores back references under sublabel 2 (purely transient data, not subject to persistency).

	:param theObject:
	:type theObject: opencascade::handle<TObj_Object> &
	:rtype: None
") AddBackReference;
		void AddBackReference (const opencascade::handle<TObj_Object> & theObject);
		%feature("compactdefaultargs") AfterRetrieval;
		%feature("autodoc", "	* /** * Method for updating object afrer restoring */ Preforms updating the links and dependances of the object which are not stored in persistence. Should be redefined if necessary.

	:rtype: None
") AfterRetrieval;
		void AfterRetrieval ();
		%feature("compactdefaultargs") BeforeForgetReference;
		%feature("autodoc", "	* Invokes from TObj_TReference::BeforeForget(). theLabel - label on that reference become removed Default implementation is empty

	:param &:
	:type &: TDF_Label
	:rtype: None
") BeforeForgetReference;
		void BeforeForgetReference (const TDF_Label &);
		%feature("compactdefaultargs") BeforeStoring;
		%feature("autodoc", "	* Preforms storing the objects transient fields in OCAF document which were outside transaction mechanism. Default implementation doesnot nothing

	:rtype: None
") BeforeStoring;
		void BeforeStoring ();
		%feature("compactdefaultargs") CanDetach;
		%feature("autodoc", "	* /** * Methods for deleting the object */ Checks if object can be detached with specified mode

	:param theMode: default value is TObj_FreeOnly
	:type theMode: TObj_DeletingMode
	:rtype: bool
") CanDetach;
		Standard_Boolean CanDetach (const TObj_DeletingMode theMode = TObj_FreeOnly);
		%feature("compactdefaultargs") CanRemoveReference;
		%feature("autodoc", "	* Returns True if the referred object theObject can be deleted without deletion of this object. Default implementation does nothing and returns False.

	:param theObject:
	:type theObject: opencascade::handle<TObj_Object> &
	:rtype: bool
") CanRemoveReference;
		Standard_Boolean CanRemoveReference (const opencascade::handle<TObj_Object> & theObject);
		%feature("compactdefaultargs") ClearBackReferences;
		%feature("autodoc", "	* The default implementation just clear the back references container

	:rtype: None
") ClearBackReferences;
		void ClearBackReferences ();
		%feature("compactdefaultargs") ClearFlags;
		%feature("autodoc", "	* clears flags by the mask.

	:param theMask: default value is ~0
	:type theMask: int
	:rtype: None
") ClearFlags;
		void ClearFlags (const Standard_Integer theMask = ~0);
		%feature("compactdefaultargs") Clone;
		%feature("autodoc", "	* /** * Cloning related methods */ Copy me to other label theTargetLabel New object will not have all the reference that has me. Coping object with data and childs, but change name by adding string '_copy' As result return handle of new object (null handle is something wrong) NOTE: BackReferences not coping. After clonning all objects it is neccessary to call copy references with the same relocation table

	:param theTargetLabel:
	:type theTargetLabel: TDF_Label &
	:param theRelocTable: default value is 0
	:type theRelocTable: opencascade::handle<TDF_RelocationTable>
	:rtype: opencascade::handle<TObj_Object>
") Clone;
		opencascade::handle<TObj_Object> Clone (const TDF_Label & theTargetLabel,opencascade::handle<TDF_RelocationTable> theRelocTable = 0);
		%feature("compactdefaultargs") CopyChildren;
		%feature("autodoc", "	* Coping the children from source label to the target.

	:param theTargetLabel:
	:type theTargetLabel: TDF_Label &
	:param theRelocTable:
	:type theRelocTable: opencascade::handle<TDF_RelocationTable> &
	:rtype: None
") CopyChildren;
		void CopyChildren (TDF_Label & theTargetLabel,const opencascade::handle<TDF_RelocationTable> & theRelocTable);
		%feature("compactdefaultargs") CopyReferences;
		%feature("autodoc", "	* Coping the references. return Standard_False is Target object is different type

	:param theTargetObject:
	:type theTargetObject: opencascade::handle<TObj_Object> &
	:param theRelocTable:
	:type theRelocTable: opencascade::handle<TDF_RelocationTable> &
	:rtype: None
") CopyReferences;
		void CopyReferences (const opencascade::handle<TObj_Object> & theTargetObject,const opencascade::handle<TDF_RelocationTable> & theRelocTable);
		%feature("compactdefaultargs") Detach;
		%feature("autodoc", "	* Deletes the object from the model. The dependent objects are either deleted or modified when possible (see description of TObj_DeletingMode enumeration for more details) Returns True if deletion was successful. Checks if object can be deleted. Should be redefined for each specific kind of object

	:param theMode: default value is TObj_FreeOnly
	:type theMode: TObj_DeletingMode
	:rtype: bool
") Detach;
		Standard_Boolean Detach (const TObj_DeletingMode theMode = TObj_FreeOnly);
		%feature("compactdefaultargs") Detach;
		%feature("autodoc", "	* Deletes the object from the label. Checks if object can be deleted. Finds object on the label and detaches it by calling previos method. Returns true if there is no object on the label after detaching

	:param theLabel:
	:type theLabel: TDF_Label &
	:param theMode: default value is TObj_FreeOnly
	:type theMode: TObj_DeletingMode
	:rtype: bool
") Detach;
		static Standard_Boolean Detach (const TDF_Label & theLabel,const TObj_DeletingMode theMode = TObj_FreeOnly);
		%feature("compactdefaultargs") GetBackReferences;
		%feature("autodoc", "	* Returns iterator for the objects which depend on this one. These reffering objects may belong to other models. theType narrows a variety of iterated objects

	:param theType: default value is NULL
	:type theType: opencascade::handle<Standard_Type> &
	:rtype: opencascade::handle<TObj_ObjectIterator>
") GetBackReferences;
		opencascade::handle<TObj_ObjectIterator> GetBackReferences (const opencascade::handle<Standard_Type> & theType = NULL);
		%feature("compactdefaultargs") GetBadReference;
		%feature("autodoc", "	* Return True if this refers to the model theRoot belongs to and a referred label is not a descendant of theRoot. In this case theBadReference returns the currently referred label.

	:param theRoot:
	:type theRoot: TDF_Label &
	:param theBadReference:
	:type theBadReference: TDF_Label &
	:rtype: bool
") GetBadReference;
		Standard_Boolean GetBadReference (const TDF_Label & theRoot,TDF_Label & theBadReference);
		%feature("compactdefaultargs") GetChildLabel;
		%feature("autodoc", "	* Returns the label under which children are stored

	:rtype: TDF_Label
") GetChildLabel;
		TDF_Label GetChildLabel ();
		%feature("compactdefaultargs") GetChildren;
		%feature("autodoc", "	* Returns iterator for the child objects. This method provides tree-like view of the objects hierarchy. The references to other objects are not considered as children. theType narrows a variety of iterated objects The default implementation search for children on 1 sublavel of the children sub label

	:param theType: default value is NULL
	:type theType: opencascade::handle<Standard_Type> &
	:rtype: opencascade::handle<TObj_ObjectIterator>
") GetChildren;
		opencascade::handle<TObj_ObjectIterator> GetChildren (const opencascade::handle<Standard_Type> & theType = NULL);
		%feature("compactdefaultargs") GetDataLabel;
		%feature("autodoc", "	* Returns the label which is the root for data OCAF sub-tree

	:rtype: TDF_Label
") GetDataLabel;
		TDF_Label GetDataLabel ();
		%feature("compactdefaultargs") GetDictionary;
		%feature("autodoc", "	* /** * Methods hanling name of the object */ Returns the map of names of the objects Default implementation returns global Dictionary of the model

	:rtype: opencascade::handle<TObj_TNameContainer>
") GetDictionary;
		opencascade::handle<TObj_TNameContainer> GetDictionary ();
		%feature("compactdefaultargs") GetFatherObject;
		%feature("autodoc", "	* Returns the father object, which may be NULL theType gives type of father object to search

	:param theType: default value is NULL
	:type theType: opencascade::handle<Standard_Type> &
	:rtype: opencascade::handle<TObj_Object>
") GetFatherObject;
		opencascade::handle<TObj_Object> GetFatherObject (const opencascade::handle<Standard_Type> & theType = NULL);
		%feature("compactdefaultargs") GetFlags;
		%feature("autodoc", "	* Returns mask of seted flags

	:rtype: int
") GetFlags;
		Standard_Integer GetFlags ();
		%feature("compactdefaultargs") GetLabel;
		%feature("autodoc", "	* /** * Access to the OCAF-specific data */ Returns the OCAF label on which object`s data are stored

	:rtype: TDF_Label
") GetLabel;
		TDF_Label GetLabel ();
		%feature("compactdefaultargs") GetModel;
		%feature("autodoc", "	* /** * Virtual methods */ Returns the model to which the object belongs

	:rtype: opencascade::handle<TObj_Model>
") GetModel;
		opencascade::handle<TObj_Model> GetModel ();
		%feature("compactdefaultargs") GetName;
		%feature("autodoc", "	* Returns the name of the object (empty string if object has no name)

	:rtype: opencascade::handle<TCollection_HExtendedString>
") GetName;
		opencascade::handle<TCollection_HExtendedString> GetName ();
		%feature("compactdefaultargs") GetName;
		%feature("autodoc", "	* Returns the Standard_True is object has name and returns name to theName

	:param theName:
	:type theName: TCollection_ExtendedString &
	:rtype: bool
") GetName;
		Standard_Boolean GetName (TCollection_ExtendedString & theName);
		%feature("compactdefaultargs") GetName;
		%feature("autodoc", "	* Returns the Standard_True is object has name and returns name to theName

	:param theName:
	:type theName: TCollection_AsciiString &
	:rtype: bool
") GetName;
		Standard_Boolean GetName (TCollection_AsciiString & theName);
		%feature("compactdefaultargs") GetNameForClone;
		%feature("autodoc", "	* Returns name for copy default implementation returns the same name

	:param &:
	:type &: opencascade::handle<TObj_Object>
	:rtype: opencascade::handle<TCollection_HExtendedString>
") GetNameForClone;
		opencascade::handle<TCollection_HExtendedString> GetNameForClone (const opencascade::handle<TObj_Object> &);
		%feature("compactdefaultargs") GetObj;
		%feature("autodoc", "	* /** * methods for object retrieval */ Returns the Object attached to a given label. Returns False if no object of type TObj_Object is stored on the specified label. If isSuper is true tries to find on the super labels.

	:param theLabel:
	:type theLabel: TDF_Label &
	:param theResult:
	:type theResult: opencascade::handle<TObj_Object> &
	:param isSuper: default value is Standard_False
	:type isSuper: bool
	:rtype: bool
") GetObj;
		static Standard_Boolean GetObj (const TDF_Label & theLabel,opencascade::handle<TObj_Object> & theResult,const Standard_Boolean isSuper = Standard_False);
		%feature("compactdefaultargs") GetOrder;
		%feature("autodoc", "	* /** * Public methods to access order of object */ returns order of object (or tag of their label if order is not initialised)

	:rtype: int
") GetOrder;
		Standard_Integer GetOrder ();
		%feature("compactdefaultargs") GetReferenceLabel;
		%feature("autodoc", "	* Returns the label which is the root for reference OCAF sub-tree

	:rtype: TDF_Label
") GetReferenceLabel;
		TDF_Label GetReferenceLabel ();
		%feature("compactdefaultargs") GetReferences;
		%feature("autodoc", "	* Returns an Iterator containing objects that compose the this one theType narrows a variety of iterated objects

	:param theType: default value is NULL
	:type theType: opencascade::handle<Standard_Type> &
	:rtype: opencascade::handle<TObj_ObjectIterator>
") GetReferences;
		opencascade::handle<TObj_ObjectIterator> GetReferences (const opencascade::handle<Standard_Type> & theType = NULL);
		%feature("compactdefaultargs") GetTypeFlags;
		%feature("autodoc", "	* /** * Access to object flags */ Returns flags (bitmask) that define properties of objects of that type By default returns flag Visible

	:rtype: int
") GetTypeFlags;
		Standard_Integer GetTypeFlags ();
		%feature("compactdefaultargs") HasBackReferences;
		%feature("autodoc", "	* Returns True if obejct has 1 or more back references

	:rtype: bool
") HasBackReferences;
		Standard_Boolean HasBackReferences ();
		%feature("compactdefaultargs") HasReference;
		%feature("autodoc", "	* /** * Analysis of dependencies on other objects */ Returns True if object has reference to indicated object

	:param theObject:
	:type theObject: opencascade::handle<TObj_Object> &
	:rtype: bool
") HasReference;
		Standard_Boolean HasReference (const opencascade::handle<TObj_Object> & theObject);
		%feature("compactdefaultargs") IsAlive;
		%feature("autodoc", "	* /** * Methods for checking and Updating object */ Checks that object alive in model Default implementation checks that object has TObject attribute at own label.

	:rtype: bool
") IsAlive;
		Standard_Boolean IsAlive ();
		%feature("compactdefaultargs") RelocateReferences;
		%feature("autodoc", "	* Make that each reference pointing to a descendant label of theFromRoot to point to an equivalent label under theToRoot. Return False if a resulting reference does not point to an TObj_Object Example: a referred object label = 0:3:24:7:2:7 theFromRoot = 0:3:24 theToRoot = 0:2 a new referred label = 0:2:7:2:7

	:param theFromRoot:
	:type theFromRoot: TDF_Label &
	:param theToRoot:
	:type theToRoot: TDF_Label &
	:param theUpdateBackRefs: default value is Standard_True
	:type theUpdateBackRefs: bool
	:rtype: bool
") RelocateReferences;
		Standard_Boolean RelocateReferences (const TDF_Label & theFromRoot,const TDF_Label & theToRoot,const Standard_Boolean theUpdateBackRefs = Standard_True);
		%feature("compactdefaultargs") RemoveAllReferences;
		%feature("autodoc", "	* Remove all references to other objects, by removing all reference attributes

	:rtype: None
") RemoveAllReferences;
		void RemoveAllReferences ();
		%feature("compactdefaultargs") RemoveBackReference;
		%feature("autodoc", "	* Removes information on dependent object (back reference). If theSingleOnly is true only the first back reference is removed in the case of duplicate items.

	:param theObject:
	:type theObject: opencascade::handle<TObj_Object> &
	:param theSingleOnly: default value is Standard_True
	:type theSingleOnly: bool
	:rtype: None
") RemoveBackReference;
		void RemoveBackReference (const opencascade::handle<TObj_Object> & theObject,const Standard_Boolean theSingleOnly = Standard_True);
		%feature("compactdefaultargs") RemoveBackReferences;
		%feature("autodoc", "	* Removes all back reference by removing references from other to me.

	:param theMode: default value is TObj_FreeOnly
	:type theMode: TObj_DeletingMode
	:rtype: bool
") RemoveBackReferences;
		Standard_Boolean RemoveBackReferences (const TObj_DeletingMode theMode = TObj_FreeOnly);
		%feature("compactdefaultargs") RemoveReference;
		%feature("autodoc", "	* Removes reference to the object by replace reference to NULL object

	:param theObject:
	:type theObject: opencascade::handle<TObj_Object> &
	:rtype: None
") RemoveReference;
		void RemoveReference (const opencascade::handle<TObj_Object> & theObject);
		%feature("compactdefaultargs") ReplaceReference;
		%feature("autodoc", "	* Replace reference from old object to new object. If it is not possible, may raise exception. If new object is null then simple remove reference to old object.

	:param theOldObject:
	:type theOldObject: opencascade::handle<TObj_Object> &
	:param theNewObject:
	:type theNewObject: opencascade::handle<TObj_Object> &
	:rtype: None
") ReplaceReference;
		void ReplaceReference (const opencascade::handle<TObj_Object> & theOldObject,const opencascade::handle<TObj_Object> & theNewObject);
		%feature("compactdefaultargs") SetFlags;
		%feature("autodoc", "	* Sets flags with defined mask.

	:param theMask:
	:type theMask: int
	:rtype: None
") SetFlags;
		void SetFlags (const Standard_Integer theMask);
		%feature("compactdefaultargs") SetName;
		%feature("autodoc", "	* Sets name of the object. Returns False if theName is not unique.

	:param theName:
	:type theName: opencascade::handle<TCollection_HExtendedString> &
	:rtype: bool
") SetName;
		Standard_Boolean SetName (const opencascade::handle<TCollection_HExtendedString> & theName);
		%feature("compactdefaultargs") SetName;
		%feature("autodoc", "	* Sets name of the object. Returns False if theName is not unique.

	:param theName:
	:type theName: opencascade::handle<TCollection_HAsciiString> &
	:rtype: bool
") SetName;
		Standard_Boolean SetName (const opencascade::handle<TCollection_HAsciiString> & theName);
		%feature("compactdefaultargs") SetName;
		%feature("autodoc", "	* Sets name of the object. Returns False if theName is not unique.

	:param name:
	:type name: char *
	:rtype: bool
") SetName;
		Standard_Boolean SetName (const char * name);
		%feature("compactdefaultargs") SetOrder;
		%feature("autodoc", "	* sets order of object

	:param theIndx:
	:type theIndx: int &
	:rtype: bool
") SetOrder;
		Standard_Boolean SetOrder (const Standard_Integer & theIndx);
		%feature("compactdefaultargs") TestFlags;
		%feature("autodoc", "	* tests flags by the mask.

	:param theMask:
	:type theMask: int
	:rtype: bool
") TestFlags;
		Standard_Boolean TestFlags (const Standard_Integer theMask);
		%feature("compactdefaultargs") getChildLabel;
		%feature("autodoc", "	* Returns the label for child with rank

	:param theRank:
	:type theRank: int
	:rtype: TDF_Label
") getChildLabel;
		TDF_Label getChildLabel (const Standard_Integer theRank);
};


%make_alias(TObj_Object)

%extend TObj_Object {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TObj_ObjectIterator;
class TObj_ObjectIterator : public Standard_Transient {
	public:
		%feature("compactdefaultargs") More;
		%feature("autodoc", "	* Returns True if iteration is not finished and method Current() will give the object. Default implementation returns False

	:rtype: bool
") More;
		Standard_Boolean More ();
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "	* Iterates to the next object Default implementation does nothing

	:rtype: None
") Next;
		void Next ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	* Returns current object (or null if iteration has finished) Default implementation returns null handle

	:rtype: opencascade::handle<TObj_Object>
") Value;
		opencascade::handle<TObj_Object> Value ();
};


%make_alias(TObj_ObjectIterator)

%extend TObj_ObjectIterator {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TObj_Persistence;
%ignore TObj_Persistence::~TObj_Persistence();
class TObj_Persistence {
	public:
		%feature("compactdefaultargs") CreateNewObject;
		%feature("autodoc", "	* /** * Public methods, to be called externally */ Creates and returns a new object of the registered type If the type is not registered, returns Null handle

	:param theType:
	:type theType: char *
	:param theLabel:
	:type theLabel: TDF_Label &
	:rtype: opencascade::handle<TObj_Object>
") CreateNewObject;
		static opencascade::handle<TObj_Object> CreateNewObject (const char * theType,const TDF_Label & theLabel);

        %feature("autodoc", "1");
        %extend{
            std::string DumpTypesToString() {
            std::stringstream s;
            self->DumpTypes(s);
            return s.str();}
        };
        };


%extend TObj_Persistence {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TObj_TIntSparseArray;
class TObj_TIntSparseArray : public TDF_Attribute {
	public:
typedef TObj_TIntSparseArray_VecOfData::ConstIterator Iterator;
		%feature("compactdefaultargs") AfterUndo;
		%feature("autodoc", "	* Clears my modification delta; called after application of theDelta

	:param theDelta:
	:type theDelta: opencascade::handle<TDF_AttributeDelta> &
	:param toForce:
	:type toForce: bool
	:rtype: bool
") AfterUndo;
		Standard_Boolean AfterUndo (const opencascade::handle<TDF_AttributeDelta> & theDelta,const Standard_Boolean toForce);
		%feature("compactdefaultargs") BackupCopy;
		%feature("autodoc", "	* Moves this delta into a new other attribute.

	:rtype: opencascade::handle<TDF_Attribute>
") BackupCopy;
		opencascade::handle<TDF_Attribute> BackupCopy ();
		%feature("compactdefaultargs") BeforeCommitTransaction;
		%feature("autodoc", "	* It is called just before Commit or Abort transaction and does Backup() to create a delta

	:rtype: None
") BeforeCommitTransaction;
		void BeforeCommitTransaction ();
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	* Clears the set

	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") ClearDelta;
		%feature("autodoc", "	:rtype: None
") ClearDelta;
		void ClearDelta ();
		%feature("compactdefaultargs") DeltaOnModification;
		%feature("autodoc", "	* Applies theDelta to this.

	:param theDelta:
	:type theDelta: opencascade::handle<TDF_DeltaOnModification> &
	:rtype: None
") DeltaOnModification;
		void DeltaOnModification (const opencascade::handle<TDF_DeltaOnModification> & theDelta);
		%feature("compactdefaultargs") GetID;
		%feature("autodoc", "	* This method is used in implementation of ID()

	:rtype: Standard_GUID
") GetID;
		static const Standard_GUID & GetID ();
		%feature("compactdefaultargs") GetIterator;
		%feature("autodoc", "	* Returns iterator on objects contained in the set

	:rtype: Iterator
") GetIterator;
		Iterator GetIterator ();
		%feature("compactdefaultargs") HasValue;
		%feature("autodoc", "	* Returns true if the value with the given ID is present.

	:param theId:
	:type theId: Standard_Size
	:rtype: bool
") HasValue;
		Standard_Boolean HasValue (const Standard_Size theId);
		%feature("compactdefaultargs") ID;
		%feature("autodoc", "	* Returns the ID of this attribute.

	:rtype: Standard_GUID
") ID;
		const Standard_GUID & ID ();
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "	* Redefined OCAF abstract methods Returns an new empty TObj_TIntSparseArray attribute. It is used by the copy algorithm.

	:rtype: opencascade::handle<TDF_Attribute>
") NewEmpty;
		opencascade::handle<TDF_Attribute> NewEmpty ();
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	* This method is used when copying an attribute from a source structure into a target structure.

	:param theInto:
	:type theInto: opencascade::handle<TDF_Attribute> &
	:param theRT:
	:type theRT: opencascade::handle<TDF_RelocationTable> &
	:rtype: None
") Paste;
		void Paste (const opencascade::handle<TDF_Attribute> & theInto,const opencascade::handle<TDF_RelocationTable> & theRT);
		%feature("compactdefaultargs") Restore;
		%feature("autodoc", "	* Restores the set using info saved in backup attribute theDelta.

	:param theDelta:
	:type theDelta: opencascade::handle<TDF_Attribute> &
	:rtype: None
") Restore;
		void Restore (const opencascade::handle<TDF_Attribute> & theDelta);
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "	* Creates TObj_TIntSparseArray attribute on given label.

	:param theLabel:
	:type theLabel: TDF_Label &
	:rtype: opencascade::handle<TObj_TIntSparseArray>
") Set;
		static opencascade::handle<TObj_TIntSparseArray> Set (const TDF_Label & theLabel);
		%feature("compactdefaultargs") SetDoBackup;
		%feature("autodoc", "	* Methods to handle the modification delta Sets the flag pointing to the necessity to maintain a modification delta. It is called by the retrieval driver

	:param toDo:
	:type toDo: bool
	:rtype: None
") SetDoBackup;
		void SetDoBackup (const Standard_Boolean toDo);
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	* Sets the value with the given ID. Raises an exception if theId is not positive

	:param theId:
	:type theId: Standard_Size
	:param theValue:
	:type theValue: int
	:rtype: None
") SetValue;
		void SetValue (const Standard_Size theId,const Standard_Integer theValue);
		%feature("compactdefaultargs") Size;
		%feature("autodoc", "	* Methods for access to data Returns the number of stored values in the set

	:rtype: Standard_Size
") Size;
		Standard_Size Size ();
		%feature("compactdefaultargs") TObj_TIntSparseArray;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") TObj_TIntSparseArray;
		 TObj_TIntSparseArray ();
		%feature("compactdefaultargs") UnsetValue;
		%feature("autodoc", "	* Unsets the value with the given ID. Raises an exception if theId is not positive

	:param theId:
	:type theId: Standard_Size
	:rtype: None
") UnsetValue;
		void UnsetValue (const Standard_Size theId);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	* Returns the value by its ID. Raises an exception if no value is stored with this ID

	:param theId:
	:type theId: Standard_Size
	:rtype: int
") Value;
		Standard_Integer Value (const Standard_Size theId);
};


%make_alias(TObj_TIntSparseArray)

%extend TObj_TIntSparseArray {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TObj_TModel;
class TObj_TModel : public TDF_Attribute {
	public:
		%feature("compactdefaultargs") GetID;
		%feature("autodoc", "	* This method is used in implementation of ID()

	:rtype: Standard_GUID
") GetID;
		static const Standard_GUID & GetID ();
		%feature("compactdefaultargs") ID;
		%feature("autodoc", "	* Returns the ID of TObj_TModel attribute.

	:rtype: Standard_GUID
") ID;
		const Standard_GUID & ID ();
		%feature("compactdefaultargs") Model;
		%feature("autodoc", "	* Returns the Model object

	:rtype: opencascade::handle<TObj_Model>
") Model;
		opencascade::handle<TObj_Model> Model ();
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "	* Redefined OCAF abstract methods Returns an new empty TObj_TModel attribute. It is used by the copy algorithm.

	:rtype: opencascade::handle<TDF_Attribute>
") NewEmpty;
		opencascade::handle<TDF_Attribute> NewEmpty ();
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	* This method is used when copying an attribute from a source structure into a target structure.

	:param theInto:
	:type theInto: opencascade::handle<TDF_Attribute> &
	:param theRT:
	:type theRT: opencascade::handle<TDF_RelocationTable> &
	:rtype: None
") Paste;
		void Paste (const opencascade::handle<TDF_Attribute> & theInto,const opencascade::handle<TDF_RelocationTable> & theRT);
		%feature("compactdefaultargs") Restore;
		%feature("autodoc", "	* Restores the backuped contents from <theWith> into this one. It is used when aborting a transaction.

	:param theWith:
	:type theWith: opencascade::handle<TDF_Attribute> &
	:rtype: None
") Restore;
		void Restore (const opencascade::handle<TDF_Attribute> & theWith);
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "	* Methods for setting and obtaining the Model object Sets the the Model object

	:param theModel:
	:type theModel: opencascade::handle<TObj_Model> &
	:rtype: None
") Set;
		void Set (const opencascade::handle<TObj_Model> & theModel);
		%feature("compactdefaultargs") TObj_TModel;
		%feature("autodoc", "	* /** * Standard methods of attribute */ Empty constructor

	:rtype: None
") TObj_TModel;
		 TObj_TModel ();
};


%make_alias(TObj_TModel)

%extend TObj_TModel {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TObj_TNameContainer;
class TObj_TNameContainer : public TDF_Attribute {
	public:
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	* Remove all names registered in container

	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") Get;
		%feature("autodoc", "	* Returns the TObj_DataMapOfNameLabel object

	:rtype: TObj_DataMapOfNameLabel
") Get;
		const TObj_DataMapOfNameLabel & Get ();
		%feature("compactdefaultargs") GetID;
		%feature("autodoc", "	* This method is used in implementation of ID()

	:rtype: Standard_GUID
") GetID;
		static const Standard_GUID & GetID ();
		%feature("compactdefaultargs") ID;
		%feature("autodoc", "	* Returns the ID of TObj_TNameContainer attribute.

	:rtype: Standard_GUID
") ID;
		const Standard_GUID & ID ();
		%feature("compactdefaultargs") IsRegistered;
		%feature("autodoc", "	* Return True is theName is registered in the Map

	:param theName:
	:type theName: opencascade::handle<TCollection_HExtendedString> &
	:rtype: bool
") IsRegistered;
		Standard_Boolean IsRegistered (const opencascade::handle<TCollection_HExtendedString> & theName);
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "	* Redefined OCAF abstract methods Returns an new empty TObj_TNameContainer attribute. It is used by the copy algorithm.

	:rtype: opencascade::handle<TDF_Attribute>
") NewEmpty;
		opencascade::handle<TDF_Attribute> NewEmpty ();
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	* This method is used when copying an attribute from a source structure into a target structure.

	:param theInto:
	:type theInto: opencascade::handle<TDF_Attribute> &
	:param theRT:
	:type theRT: opencascade::handle<TDF_RelocationTable> &
	:rtype: None
") Paste;
		void Paste (const opencascade::handle<TDF_Attribute> & theInto,const opencascade::handle<TDF_RelocationTable> & theRT);
		%feature("compactdefaultargs") RecordName;
		%feature("autodoc", "	* Methods for adding and removing names Records name with label attached

	:param theName:
	:type theName: opencascade::handle<TCollection_HExtendedString> &
	:param theLabel:
	:type theLabel: TDF_Label &
	:rtype: None
") RecordName;
		void RecordName (const opencascade::handle<TCollection_HExtendedString> & theName,const TDF_Label & theLabel);
		%feature("compactdefaultargs") RemoveName;
		%feature("autodoc", "	* Remove name from the map

	:param theName:
	:type theName: opencascade::handle<TCollection_HExtendedString> &
	:rtype: None
") RemoveName;
		void RemoveName (const opencascade::handle<TCollection_HExtendedString> & theName);
		%feature("compactdefaultargs") Restore;
		%feature("autodoc", "	* Restores the backuped contents from <theWith> into this one. It is used when aborting a transaction.

	:param theWith:
	:type theWith: opencascade::handle<TDF_Attribute> &
	:rtype: None
") Restore;
		void Restore (const opencascade::handle<TDF_Attribute> & theWith);
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "	* Method for create TObj_TNameContainer object Creates TObj_DataMapOfNameLabel attribute on given label if not exist

	:param theLabel:
	:type theLabel: TDF_Label &
	:rtype: opencascade::handle<TObj_TNameContainer>
") Set;
		static opencascade::handle<TObj_TNameContainer> Set (const TDF_Label & theLabel);
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "	* Methods for setting and obtaining TObj_TNameContainer Sets the TObj_DataMapOfNameLabel object

	:param theElem:
	:type theElem: TObj_DataMapOfNameLabel &
	:rtype: None
") Set;
		void Set (const TObj_DataMapOfNameLabel & theElem);
		%feature("compactdefaultargs") TObj_TNameContainer;
		%feature("autodoc", "	* Standard methods of OCAF attribute Empty constructor

	:rtype: None
") TObj_TNameContainer;
		 TObj_TNameContainer ();
};


%make_alias(TObj_TNameContainer)

%extend TObj_TNameContainer {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TObj_TObject;
class TObj_TObject : public TDF_Attribute {
	public:
		%feature("compactdefaultargs") AfterUndo;
		%feature("autodoc", "	* Tell TObj_Object to rise from the dead, i.e. (myElem->IsAlive() == true) after that

	:param anAttDelta:
	:type anAttDelta: opencascade::handle<TDF_AttributeDelta> &
	:param forceIt:
	:type forceIt: bool
	:rtype: bool
") AfterUndo;
		Standard_Boolean AfterUndo (const opencascade::handle<TDF_AttributeDelta> & anAttDelta,const Standard_Boolean forceIt);
		%feature("compactdefaultargs") BeforeForget;
		%feature("autodoc", "	* Tell TObj_Object to die, i.e. (myElem->IsAlive() == false) after that

	:rtype: None
") BeforeForget;
		void BeforeForget ();
		%feature("compactdefaultargs") Get;
		%feature("autodoc", "	* Returns the TObj_Object object

	:rtype: opencascade::handle<TObj_Object>
") Get;
		opencascade::handle<TObj_Object> Get ();
		%feature("compactdefaultargs") GetID;
		%feature("autodoc", "	* This method is used in implementation of ID()

	:rtype: Standard_GUID
") GetID;
		static const Standard_GUID & GetID ();
		%feature("compactdefaultargs") ID;
		%feature("autodoc", "	* Returns the ID of TObj_TObject attribute.

	:rtype: Standard_GUID
") ID;
		const Standard_GUID & ID ();
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "	* Redefined OCAF abstract methods Returns an new empty TObj_TObject attribute. It is used by the copy algorithm.

	:rtype: opencascade::handle<TDF_Attribute>
") NewEmpty;
		opencascade::handle<TDF_Attribute> NewEmpty ();
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	* This method is used when copying an attribute from a source structure into a target structure.

	:param theInto:
	:type theInto: opencascade::handle<TDF_Attribute> &
	:param theRT:
	:type theRT: opencascade::handle<TDF_RelocationTable> &
	:rtype: None
") Paste;
		void Paste (const opencascade::handle<TDF_Attribute> & theInto,const opencascade::handle<TDF_RelocationTable> & theRT);
		%feature("compactdefaultargs") Restore;
		%feature("autodoc", "	* Restores the backuped contents from <theWith> into this one. It is used when aborting a transaction.

	:param theWith:
	:type theWith: opencascade::handle<TDF_Attribute> &
	:rtype: None
") Restore;
		void Restore (const opencascade::handle<TDF_Attribute> & theWith);
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "	* Method for create TObj_TObject object Creates TObj_TObject attribute on given label

	:param theLabel:
	:type theLabel: TDF_Label &
	:param theElem:
	:type theElem: opencascade::handle<TObj_Object> &
	:rtype: opencascade::handle<TObj_TObject>
") Set;
		static opencascade::handle<TObj_TObject> Set (const TDF_Label & theLabel,const opencascade::handle<TObj_Object> & theElem);
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "	* Methods for setting and obtaining TObj_Object Sets the TObj_Object object

	:param theElem:
	:type theElem: opencascade::handle<TObj_Object> &
	:rtype: None
") Set;
		void Set (const opencascade::handle<TObj_Object> & theElem);
		%feature("compactdefaultargs") TObj_TObject;
		%feature("autodoc", "	* Standard methods of OCAF attribute Empty constructor

	:rtype: None
") TObj_TObject;
		 TObj_TObject ();
};


%make_alias(TObj_TObject)

%extend TObj_TObject {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TObj_TReference;
class TObj_TReference : public TDF_Attribute {
	public:
		%feature("compactdefaultargs") AfterResume;
		%feature("autodoc", "	* Check if back reference exists for reference.

	:rtype: None
") AfterResume;
		void AfterResume ();
		%feature("compactdefaultargs") AfterRetrieval;
		%feature("autodoc", "	* Called after retrieval reference from file.

	:param forceIt: default value is Standard_False
	:type forceIt: bool
	:rtype: bool
") AfterRetrieval;
		Standard_Boolean AfterRetrieval (const Standard_Boolean forceIt = Standard_False);
		%feature("compactdefaultargs") AfterUndo;
		%feature("autodoc", "	* It is necessary for tranzaction mechanism (Undo/Redo).

	:param theDelta:
	:type theDelta: opencascade::handle<TDF_AttributeDelta> &
	:param isForced: default value is Standard_False
	:type isForced: bool
	:rtype: bool
") AfterUndo;
		Standard_Boolean AfterUndo (const opencascade::handle<TDF_AttributeDelta> & theDelta,const Standard_Boolean isForced = Standard_False);
		%feature("compactdefaultargs") BeforeForget;
		%feature("autodoc", "	* Remove back references of it reference if it is in other document.

	:rtype: None
") BeforeForget;
		void BeforeForget ();
		%feature("compactdefaultargs") BeforeUndo;
		%feature("autodoc", "	* It is necessary for tranzaction mechanism (Undo/Redo).

	:param theDelta:
	:type theDelta: opencascade::handle<TDF_AttributeDelta> &
	:param isForced: default value is Standard_False
	:type isForced: bool
	:rtype: bool
") BeforeUndo;
		Standard_Boolean BeforeUndo (const opencascade::handle<TDF_AttributeDelta> & theDelta,const Standard_Boolean isForced = Standard_False);
		%feature("compactdefaultargs") Get;
		%feature("autodoc", "	* Returns the referenced theObject

	:rtype: opencascade::handle<TObj_Object>
") Get;
		opencascade::handle<TObj_Object> Get ();
		%feature("compactdefaultargs") GetID;
		%feature("autodoc", "	* This method is used in implementation of ID()

	:rtype: Standard_GUID
") GetID;
		static const Standard_GUID & GetID ();
		%feature("compactdefaultargs") GetLabel;
		%feature("autodoc", "	* Returns the referred label.

	:rtype: TDF_Label
") GetLabel;
		TDF_Label GetLabel ();
		%feature("compactdefaultargs") GetMasterLabel;
		%feature("autodoc", "	* Returns the Label of master object.

	:rtype: TDF_Label
") GetMasterLabel;
		TDF_Label GetMasterLabel ();
		%feature("compactdefaultargs") ID;
		%feature("autodoc", "	* Returns the ID of TObj_TReference attribute.

	:rtype: Standard_GUID
") ID;
		const Standard_GUID & ID ();
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "	* Redefined OCAF abstract methods Returns an new empty TObj_TReference attribute. It is used by the copy algorithm.

	:rtype: opencascade::handle<TDF_Attribute>
") NewEmpty;
		opencascade::handle<TDF_Attribute> NewEmpty ();
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	* This method is used when copying an attribute from a source structure into a target structure.

	:param theInto:
	:type theInto: opencascade::handle<TDF_Attribute> &
	:param theRT:
	:type theRT: opencascade::handle<TDF_RelocationTable> &
	:rtype: None
") Paste;
		void Paste (const opencascade::handle<TDF_Attribute> & theInto,const opencascade::handle<TDF_RelocationTable> & theRT);
		%feature("compactdefaultargs") Restore;
		%feature("autodoc", "	* Restores the backuped contents from <theWith> into this one. It is used when aborting a transaction.

	:param theWith:
	:type theWith: opencascade::handle<TDF_Attribute> &
	:rtype: None
") Restore;
		void Restore (const opencascade::handle<TDF_Attribute> & theWith);
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "	* Method for create TObj_TReference object Creates reference on TDF_Label <theLabel> to the object <theObject> and creates backreference from the object <theObject> to <theMaster> one.

	:param theLabel:
	:type theLabel: TDF_Label &
	:param theObject:
	:type theObject: opencascade::handle<TObj_Object> &
	:param theMaster:
	:type theMaster: opencascade::handle<TObj_Object> &
	:rtype: opencascade::handle<TObj_TReference>
") Set;
		static opencascade::handle<TObj_TReference> Set (const TDF_Label & theLabel,const opencascade::handle<TObj_Object> & theObject,const opencascade::handle<TObj_Object> & theMaster);
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "	* Methods for setting and obtaining referenced object Sets the reference to the theObject

	:param theObject:
	:type theObject: opencascade::handle<TObj_Object> &
	:param theMasterLabel:
	:type theMasterLabel: TDF_Label &
	:rtype: None
") Set;
		void Set (const opencascade::handle<TObj_Object> & theObject,const TDF_Label & theMasterLabel);
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "	* Sets the reference to the theObject at indicated Label. It is method for persistent only. Don`t use anywhere else.

	:param theLabel:
	:type theLabel: TDF_Label &
	:param theMasterLabel:
	:type theMasterLabel: TDF_Label &
	:rtype: None
") Set;
		void Set (const TDF_Label & theLabel,const TDF_Label & theMasterLabel);
		%feature("compactdefaultargs") TObj_TReference;
		%feature("autodoc", "	* Standard methods of OCAF attribute Empty constructor

	:rtype: None
") TObj_TReference;
		 TObj_TReference ();
};


%make_alias(TObj_TReference)

%extend TObj_TReference {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TObj_TXYZ;
class TObj_TXYZ : public TDF_Attribute {
	public:

        %feature("autodoc", "1");
        %extend{
            std::string DumpToString() {
            std::stringstream s;
            self->Dump(s);
            return s.str();}
        };
        		%feature("compactdefaultargs") Get;
		%feature("autodoc", "	* Returns the XYZ

	:rtype: gp_XYZ
") Get;
		gp_XYZ Get ();
		%feature("compactdefaultargs") GetID;
		%feature("autodoc", "	* This method is used in implementation of ID()

	:rtype: Standard_GUID
") GetID;
		static const Standard_GUID & GetID ();
		%feature("compactdefaultargs") ID;
		%feature("autodoc", "	* Returns the ID of TObj_TXYZ attribute.

	:rtype: Standard_GUID
") ID;
		const Standard_GUID & ID ();
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "	* Redefined OCAF abstract methods Returns an new empty TObj_TXYZ attribute. It is used by the copy algorithm.

	:rtype: opencascade::handle<TDF_Attribute>
") NewEmpty;
		opencascade::handle<TDF_Attribute> NewEmpty ();
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	* This method is used when copying an attribute from a source structure into a target structure.

	:param theInto:
	:type theInto: opencascade::handle<TDF_Attribute> &
	:param theRT:
	:type theRT: opencascade::handle<TDF_RelocationTable> &
	:rtype: None
") Paste;
		void Paste (const opencascade::handle<TDF_Attribute> & theInto,const opencascade::handle<TDF_RelocationTable> & theRT);
		%feature("compactdefaultargs") Restore;
		%feature("autodoc", "	* Restores the backuped contents from <theWith> into this one. It is used when aborting a transaction.

	:param theWith:
	:type theWith: opencascade::handle<TDF_Attribute> &
	:rtype: None
") Restore;
		void Restore (const opencascade::handle<TDF_Attribute> & theWith);
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "	* Method for create TObj_TXYZ object Creates attribute and sets the XYZ

	:param theLabel:
	:type theLabel: TDF_Label &
	:param theXYZ:
	:type theXYZ: gp_XYZ
	:rtype: opencascade::handle<TObj_TXYZ>
") Set;
		static opencascade::handle<TObj_TXYZ> Set (const TDF_Label & theLabel,const gp_XYZ & theXYZ);
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "	* Methods for setting and obtaining XYZ Sets the XYZ

	:param theXYZ:
	:type theXYZ: gp_XYZ
	:rtype: None
") Set;
		void Set (const gp_XYZ & theXYZ);
		%feature("compactdefaultargs") TObj_TXYZ;
		%feature("autodoc", "	* Standard methods of OCAF attribute Empty constructor

	:rtype: None
") TObj_TXYZ;
		 TObj_TXYZ ();
};


%make_alias(TObj_TXYZ)

%extend TObj_TXYZ {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TObj_LabelIterator;
class TObj_LabelIterator : public TObj_ObjectIterator {
	public:
		%feature("compactdefaultargs") LabelValue;
		%feature("autodoc", "	* Returns the label of the current item

	:rtype: inline  TDF_Label
") LabelValue;
		inline const TDF_Label & LabelValue ();
		%feature("compactdefaultargs") More;
		%feature("autodoc", "	* /** * Redefined methods */ Returns True if there is a current Item in the iteration.

	:rtype: bool
") More;
		Standard_Boolean More ();
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "	* Move to the next Item

	:rtype: None
") Next;
		void Next ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	* Returns the current item

	:rtype: opencascade::handle<TObj_Object>
") Value;
		opencascade::handle<TObj_Object> Value ();
};


%make_alias(TObj_LabelIterator)

%extend TObj_LabelIterator {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TObj_ModelIterator;
class TObj_ModelIterator : public TObj_ObjectIterator {
	public:
		%feature("compactdefaultargs") More;
		%feature("autodoc", "	* /** * Methods to iterate on objects. */ Returns True if iteration is not finished and method Value() will give the object

	:rtype: bool
") More;
		Standard_Boolean More ();
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "	* Iterates to the next object

	:rtype: None
") Next;
		void Next ();
		%feature("compactdefaultargs") TObj_ModelIterator;
		%feature("autodoc", "	* /** * Constructor */ Creates Iterator and initialize it by Model`s label

	:param theModel:
	:type theModel: opencascade::handle<TObj_Model> &
	:rtype: None
") TObj_ModelIterator;
		 TObj_ModelIterator (const opencascade::handle<TObj_Model> & theModel);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	* Returns current object (or MainObj of Model if iteration has finished)

	:rtype: opencascade::handle<TObj_Object>
") Value;
		opencascade::handle<TObj_Object> Value ();
};


%make_alias(TObj_ModelIterator)

%extend TObj_ModelIterator {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TObj_Partition;
class TObj_Partition : public TObj_Object {
	public:
		%feature("compactdefaultargs") AfterRetrieval;
		%feature("autodoc", "	* /** * Method for updating object afrer restoring */ Preforms updating the links and dependances of the object which are not stored in persistence. Does not register the partition name

	:rtype: None
") AfterRetrieval;
		void AfterRetrieval ();
		%feature("compactdefaultargs") Create;
		%feature("autodoc", "	* /** * Method for create partition */ Creates a new partition on given label.

	:param theLabel:
	:type theLabel: TDF_Label &
	:rtype: opencascade::handle<TObj_Partition>
") Create;
		static opencascade::handle<TObj_Partition> Create (const TDF_Label & theLabel);
		%feature("compactdefaultargs") GetLastIndex;
		%feature("autodoc", "	* Return Last index in partition (reserved);

	:rtype: int
") GetLastIndex;
		Standard_Integer GetLastIndex ();
		%feature("compactdefaultargs") GetNamePrefix;
		%feature("autodoc", "	* Returns prefix for names of the objects in partition.

	:rtype: opencascade::handle<TCollection_HExtendedString>
") GetNamePrefix;
		opencascade::handle<TCollection_HExtendedString> GetNamePrefix ();
		%feature("compactdefaultargs") GetNewName;
		%feature("autodoc", "	* Generates and returns name for new object in partition. if theIsToChangeCount is true partition icrease own counter to generate new name next time starting from new counter value

	:param theIsToChangeCount: default value is Standard_True
	:type theIsToChangeCount: bool
	:rtype: opencascade::handle<TCollection_HExtendedString>
") GetNewName;
		opencascade::handle<TCollection_HExtendedString> GetNewName (const Standard_Boolean theIsToChangeCount = Standard_True);
		%feature("compactdefaultargs") GetPartition;
		%feature("autodoc", "	* /** * Methods to define partition by object */ Returns the partition in which object is stored. Null partition returned if not found

	:param theObject:
	:type theObject: opencascade::handle<TObj_Object> &
	:rtype: opencascade::handle<TObj_Partition>
") GetPartition;
		static opencascade::handle<TObj_Partition> GetPartition (const opencascade::handle<TObj_Object> & theObject);
		%feature("compactdefaultargs") NewLabel;
		%feature("autodoc", "	* /** * Methods handling of the objects in partition */ Creates and Returns label for new object in partition.

	:rtype: TDF_Label
") NewLabel;
		TDF_Label NewLabel ();
		%feature("compactdefaultargs") SetLastIndex;
		%feature("autodoc", "	* Sets Last index in partition (reserved);

	:param theIndex:
	:type theIndex: int
	:rtype: None
") SetLastIndex;
		void SetLastIndex (const Standard_Integer theIndex);
		%feature("compactdefaultargs") SetName;
		%feature("autodoc", "	* /** * Methods hanling name of the object */ Sets name of the object. partition does not check unique of own name

	:param theName:
	:type theName: opencascade::handle<TCollection_HExtendedString> &
	:rtype: bool
") SetName;
		Standard_Boolean SetName (const opencascade::handle<TCollection_HExtendedString> & theName);
		%feature("compactdefaultargs") SetNamePrefix;
		%feature("autodoc", "	* Sets prefix for names of the objects in partition.

	:param thePrefix:
	:type thePrefix: opencascade::handle<TCollection_HExtendedString> &
	:rtype: None
") SetNamePrefix;
		void SetNamePrefix (const opencascade::handle<TCollection_HExtendedString> & thePrefix);
		%feature("compactdefaultargs") Update;
		%feature("autodoc", "	* /** * Methods for updating the object */ Does nothing in the partition.

	:rtype: bool
") Update;
		Standard_Boolean Update ();
};


%make_alias(TObj_Partition)

%extend TObj_Partition {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TObj_SequenceIterator;
class TObj_SequenceIterator : public TObj_ObjectIterator {
	public:
		%feature("compactdefaultargs") More;
		%feature("autodoc", "	* /** * Redefined methods */ Returns True if there is a current Item in the iteration.

	:rtype: bool
") More;
		Standard_Boolean More ();
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "	* Move to the next Item

	:rtype: None
") Next;
		void Next ();
		%feature("compactdefaultargs") TObj_SequenceIterator;
		%feature("autodoc", "	* /** * Constructor */ Creates an iterator an initialize it by sequence of objects.

	:param theObjects:
	:type theObjects: opencascade::handle<TObj_HSequenceOfObject> &
	:param theType: default value is NULL
	:type theType: opencascade::handle<Standard_Type> &
	:rtype: None
") TObj_SequenceIterator;
		 TObj_SequenceIterator (const opencascade::handle<TObj_HSequenceOfObject> & theObjects,const opencascade::handle<Standard_Type> & theType = NULL);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	* Returns the current item

	:rtype: opencascade::handle<TObj_Object>
") Value;
		opencascade::handle<TObj_Object> Value ();
};


%make_alias(TObj_SequenceIterator)

%extend TObj_SequenceIterator {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TObj_HiddenPartition;
class TObj_HiddenPartition : public TObj_Partition {
	public:
		%feature("compactdefaultargs") GetTypeFlags;
		%feature("autodoc", "	* Returns all flags of father except Visible

	:rtype: int
") GetTypeFlags;
		Standard_Integer GetTypeFlags ();
		%feature("compactdefaultargs") TObj_HiddenPartition;
		%feature("autodoc", "	* constructor

	:param theLabel:
	:type theLabel: TDF_Label &
	:rtype: None
") TObj_HiddenPartition;
		 TObj_HiddenPartition (const TDF_Label & theLabel);
};


%make_alias(TObj_HiddenPartition)

%extend TObj_HiddenPartition {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TObj_OcafObjectIterator;
class TObj_OcafObjectIterator : public TObj_LabelIterator {
	public:
		%feature("compactdefaultargs") TObj_OcafObjectIterator;
		%feature("autodoc", "	* /** * Constructor */ Creates the iterator on objects in the sub labels of theLabel theType narrows a variety of iterated objects

	:param theLabel:
	:type theLabel: TDF_Label &
	:param theType: default value is NULL
	:type theType: opencascade::handle<Standard_Type> &
	:param theRecursive: default value is Standard_False
	:type theRecursive: bool
	:rtype: None
") TObj_OcafObjectIterator;
		 TObj_OcafObjectIterator (const TDF_Label & theLabel,const opencascade::handle<Standard_Type> & theType = NULL,const Standard_Boolean theRecursive = Standard_False);
};


%make_alias(TObj_OcafObjectIterator)

%extend TObj_OcafObjectIterator {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TObj_ReferenceIterator;
class TObj_ReferenceIterator : public TObj_LabelIterator {
	public:
		%feature("compactdefaultargs") TObj_ReferenceIterator;
		%feature("autodoc", "	* Creates the iterator on references in partition theType narrows a variety of iterated objects

	:param theLabel:
	:type theLabel: TDF_Label &
	:param theType: default value is NULL
	:type theType: opencascade::handle<Standard_Type> &
	:param theRecursive: default value is Standard_True
	:type theRecursive: bool
	:rtype: None
") TObj_ReferenceIterator;
		 TObj_ReferenceIterator (const TDF_Label & theLabel,const opencascade::handle<Standard_Type> & theType = NULL,const Standard_Boolean theRecursive = Standard_True);
};


%make_alias(TObj_ReferenceIterator)

%extend TObj_ReferenceIterator {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
/* harray1 class */
/* harray2 class */
/* harray2 class */
class TObj_HSequenceOfObject : public  TObj_SequenceOfObject, public Standard_Transient {
    TObj_HSequenceOfObject();
    TObj_HSequenceOfObject(const  TObj_SequenceOfObject& theOther);
    const  TObj_SequenceOfObject& Sequence();
    void Append (const  TObj_SequenceOfObject::value_type& theItem);
    void Append ( TObj_SequenceOfObject& theSequence);
     TObj_SequenceOfObject& ChangeSequence();
};
%make_alias(TObj_HSequenceOfObject)


