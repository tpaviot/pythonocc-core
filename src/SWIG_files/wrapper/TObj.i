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
%define TOBJDOCSTRING
"TObj module, see official documentation at
https://www.opencascade.com/doc/occt-7.4.0/refman/html/package_tobj.html"
%enddef
%module (package="OCC.Core", docstring=TOBJDOCSTRING) TObj


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

%pythoncode {
from OCC.Core.Exception import *
};

/* public enums */
enum TObj_DeletingMode {
	TObj_FreeOnly = 0,
	TObj_KeepDepending = 1,
	TObj_Forced = 2,
};

/* end public enums declaration */

/* python proy classes for enums */
%pythoncode {

class TObj_DeletingMode:
	TObj_FreeOnly = 0
	TObj_KeepDepending = 1
	TObj_Forced = 2
};
/* end python proxy for enums */

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
%template(TObj_DataMapOfNameLabel) NCollection_DataMap<opencascade::handle<TCollection_HExtendedString>,TDF_Label>;
%template(TObj_DataMapOfObjectHSequenceOcafObjects) NCollection_DataMap<opencascade::handle<TObj_Object>,opencascade::handle<TObj_HSequenceOfObject>>;
%template(TObj_DataMapOfStringPointer) NCollection_DataMap<TCollection_AsciiString,Standard_Address>;
%template(TObj_SequenceOfIterator) NCollection_Sequence<opencascade::handle<TObj_ObjectIterator>>;
%template(TObj_SequenceOfObject) NCollection_Sequence<opencascade::handle<TObj_Object>>;
%template(TObj_TIntSparseArray_MapOfData) NCollection_SparseArray<Standard_Integer>;
%template(TObj_TIntSparseArray_VecOfData) NCollection_SparseArray<Standard_Integer>;
/* end templates declaration */

/* typedefs */
typedef NCollection_DataMap<opencascade::handle<TCollection_HExtendedString>, TDF_Label> TObj_DataMapOfNameLabel;
typedef NCollection_DataMap<opencascade::handle<TObj_Object>, opencascade::handle<TObj_HSequenceOfObject>> TObj_DataMapOfObjectHSequenceOcafObjects;
typedef NCollection_DataMap<TCollection_AsciiString, Standard_Address> TObj_DataMapOfStringPointer;
typedef NCollection_Sequence<opencascade::handle<TObj_ObjectIterator>> TObj_SequenceOfIterator;
typedef NCollection_Sequence<opencascade::handle<TObj_Object>> TObj_SequenceOfObject;
typedef NCollection_SparseArray<Standard_Integer> TObj_TIntSparseArray_MapOfData;
typedef NCollection_SparseArray<Standard_Integer> TObj_TIntSparseArray_VecOfData;
/* end typedefs declaration */

/*************************
* class TObj_Application *
*************************/
%nodefaultctor TObj_Application;
class TObj_Application : public TDocStd_Application {
	public:
		/****************** CreateNewDocument ******************/
		%feature("compactdefaultargs") CreateNewDocument;
		%feature("autodoc", "Create the ocaf document from scratch.

Parameters
----------
theDoc: TDocStd_Document
theFormat: TCollection_ExtendedString

Returns
-------
bool
") CreateNewDocument;
		virtual Standard_Boolean CreateNewDocument(opencascade::handle<TDocStd_Document> & theDoc, const TCollection_ExtendedString & theFormat);

		/****************** ErrorMessage ******************/
		%feature("compactdefaultargs") ErrorMessage;
		%feature("autodoc", "Signal error during load or save default imiplementation is empty.

Parameters
----------
theMsg: TCollection_ExtendedString
theLevel: Message_Gravity

Returns
-------
None
") ErrorMessage;
		virtual void ErrorMessage(const TCollection_ExtendedString & theMsg, const Message_Gravity theLevel);

		/****************** ErrorMessage ******************/
		%feature("compactdefaultargs") ErrorMessage;
		%feature("autodoc", "Signal error during load or save default imiplementation invoke previous declaration with 0.

Parameters
----------
theMsg: TCollection_ExtendedString

Returns
-------
None
") ErrorMessage;
		virtual void ErrorMessage(const TCollection_ExtendedString & theMsg);

		/****************** GetInstance ******************/
		%feature("compactdefaultargs") GetInstance;
		%feature("autodoc", "Returns static instance of the application.

Returns
-------
opencascade::handle<TObj_Application>
") GetInstance;
		static opencascade::handle<TObj_Application> GetInstance();

		/****************** IsVerbose ******************/
		%feature("compactdefaultargs") IsVerbose;
		%feature("autodoc", "Returns the verbose flag.

Returns
-------
bool
") IsVerbose;
		Standard_Boolean IsVerbose();

		/****************** LoadDocument ******************/
		%feature("compactdefaultargs") LoadDocument;
		%feature("autodoc", "Loading the ocaf document from a file.

Parameters
----------
theSourceFile: TCollection_ExtendedString
theTargetDoc: TDocStd_Document

Returns
-------
bool
") LoadDocument;
		virtual Standard_Boolean LoadDocument(const TCollection_ExtendedString & theSourceFile, opencascade::handle<TDocStd_Document> & theTargetDoc);

		/****************** Messenger ******************/
		%feature("compactdefaultargs") Messenger;
		%feature("autodoc", "Returns reference to associated messenger handle.

Returns
-------
opencascade::handle<Message_Messenger>
") Messenger;
		opencascade::handle<Message_Messenger> & Messenger();

		/****************** ResourcesName ******************/
		%feature("compactdefaultargs") ResourcesName;
		%feature("autodoc", "Return name of resource (i.e. 'tobj').

Returns
-------
char *
") ResourcesName;
		virtual const char * ResourcesName();

		/****************** SaveDocument ******************/
		%feature("compactdefaultargs") SaveDocument;
		%feature("autodoc", "Saving the ocaf document to a file.

Parameters
----------
theSourceDoc: TDocStd_Document
theTargetFile: TCollection_ExtendedString

Returns
-------
bool
") SaveDocument;
		virtual Standard_Boolean SaveDocument(const opencascade::handle<TDocStd_Document> & theSourceDoc, const TCollection_ExtendedString & theTargetFile);

		/****************** SetVerbose ******************/
		%feature("compactdefaultargs") SetVerbose;
		%feature("autodoc", "Sets the verbose flag, meaning that load/save models should show cpu and elapsed times.

Parameters
----------
isVerbose: bool

Returns
-------
None
") SetVerbose;
		void SetVerbose(const Standard_Boolean isVerbose);

};


%make_alias(TObj_Application)

%extend TObj_Application {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************
* class TObj_Assistant *
***********************/
class TObj_Assistant {
	public:
		/****************** BindModel ******************/
		%feature("compactdefaultargs") BindModel;
		%feature("autodoc", "Binds model to the map.

Parameters
----------
theModel: TObj_Model

Returns
-------
None
") BindModel;
		static void BindModel(const opencascade::handle<TObj_Model > theModel);

		/****************** BindType ******************/
		%feature("compactdefaultargs") BindType;
		%feature("autodoc", "Binds standard_type to the map; returns index of bound type.

Parameters
----------
theType: Standard_Type

Returns
-------
int
") BindType;
		static Standard_Integer BindType(const opencascade::handle<Standard_Type> & theType);

		/****************** ClearModelMap ******************/
		%feature("compactdefaultargs") ClearModelMap;
		%feature("autodoc", "Clears all records from the model map.

Returns
-------
None
") ClearModelMap;
		static void ClearModelMap();

		/****************** ClearTypeMap ******************/
		%feature("compactdefaultargs") ClearTypeMap;
		%feature("autodoc", "Clears map of types.

Returns
-------
None
") ClearTypeMap;
		static void ClearTypeMap();

		/****************** FindModel ******************/
		%feature("compactdefaultargs") FindModel;
		%feature("autodoc", "Finds model by name.

Parameters
----------
theName: char *

Returns
-------
opencascade::handle<TObj_Model>
") FindModel;
		static opencascade::handle<TObj_Model> FindModel(const char * theName);

		/****************** FindType ******************/
		%feature("compactdefaultargs") FindType;
		%feature("autodoc", "Finds standard_type by index; returns null handle if not found.

Parameters
----------
theTypeIndex: int

Returns
-------
opencascade::handle<Standard_Type>
") FindType;
		static opencascade::handle<Standard_Type> FindType(const Standard_Integer theTypeIndex);

		/****************** FindTypeIndex ******************/
		%feature("compactdefaultargs") FindTypeIndex;
		%feature("autodoc", "Rinds index by standard_type; returns 0 if not found.

Parameters
----------
theType: Standard_Type

Returns
-------
int
") FindTypeIndex;
		static Standard_Integer FindTypeIndex(const opencascade::handle<Standard_Type> & theType);

		/****************** GetAppVersion ******************/
		%feature("compactdefaultargs") GetAppVersion;
		%feature("autodoc", "Returns the version of application which wrote the currently read document. returns 0 if it has not been set yet for the current document.

Returns
-------
int
") GetAppVersion;
		static Standard_Integer GetAppVersion();

		/****************** GetCurrentModel ******************/
		%feature("compactdefaultargs") GetCurrentModel;
		%feature("autodoc", "Returns current model.

Returns
-------
opencascade::handle<TObj_Model>
") GetCurrentModel;
		static opencascade::handle<TObj_Model> GetCurrentModel();

		/****************** SetCurrentModel ******************/
		%feature("compactdefaultargs") SetCurrentModel;
		%feature("autodoc", "Sets current model.

Parameters
----------
theModel: TObj_Model

Returns
-------
None
") SetCurrentModel;
		static void SetCurrentModel(const opencascade::handle<TObj_Model> & theModel);

		/****************** UnSetCurrentModel ******************/
		%feature("compactdefaultargs") UnSetCurrentModel;
		%feature("autodoc", "Unsets current model.

Returns
-------
None
") UnSetCurrentModel;
		static void UnSetCurrentModel();

};


%extend TObj_Assistant {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************
* class TObj_CheckModel *
************************/
class TObj_CheckModel : public Message_Algorithm {
	public:
		/****************** TObj_CheckModel ******************/
		%feature("compactdefaultargs") TObj_CheckModel;
		%feature("autodoc", "Initialize checker by model.

Parameters
----------
theModel: TObj_Model

Returns
-------
None
") TObj_CheckModel;
		 TObj_CheckModel(const opencascade::handle<TObj_Model> & theModel);

		/****************** GetModel ******************/
		%feature("compactdefaultargs") GetModel;
		%feature("autodoc", "Returns the checked model.

Returns
-------
opencascade::handle<TObj_Model>
") GetModel;
		const opencascade::handle<TObj_Model> & GetModel();

		/****************** IsToFix ******************/
		%feature("compactdefaultargs") IsToFix;
		%feature("autodoc", "Returns true if it is allowed to fix inconsistencies.

Returns
-------
bool
") IsToFix;
		Standard_Boolean IsToFix();

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Performs all checks. descendants should call parent method before doing own checks. this implementation checks ocaf references and back references between objects of the model. returns true if no inconsistencies found.

Returns
-------
bool
") Perform;
		virtual Standard_Boolean Perform();

		/****************** SetToFix ******************/
		%feature("compactdefaultargs") SetToFix;
		%feature("autodoc", "Sets flag allowing fixing inconsistencies.

Parameters
----------
theToFix: bool

Returns
-------
None
") SetToFix;
		void SetToFix(const Standard_Boolean theToFix);

};


%make_alias(TObj_CheckModel)

%extend TObj_CheckModel {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************
* class TObj_Model *
*******************/
%nodefaultctor TObj_Model;
%ignore TObj_Model::~TObj_Model();
class TObj_Model : public Standard_Transient {
	public:
		/****************** AbortCommand ******************/
		%feature("compactdefaultargs") AbortCommand;
		%feature("autodoc", "Abort the command transaction. do nothing if there is no command transaction open.

Returns
-------
None
") AbortCommand;
		void AbortCommand();

		/****************** Close ******************/
		%feature("compactdefaultargs") Close;
		%feature("autodoc", "Close the model.

Returns
-------
bool
") Close;
		virtual Standard_Boolean Close();

		/****************** CloseDocument ******************/
		%feature("compactdefaultargs") CloseDocument;
		%feature("autodoc", "Close free ocaf document.

Parameters
----------
theDoc: TDocStd_Document

Returns
-------
None
") CloseDocument;
		void CloseDocument(const opencascade::handle<TDocStd_Document> & theDoc);

		/****************** CommitCommand ******************/
		%feature("compactdefaultargs") CommitCommand;
		%feature("autodoc", "Commit the command transaction. do nothing if there is no command transaction open.

Returns
-------
None
") CommitCommand;
		void CommitCommand();

		/****************** CopyReferences ******************/
		%feature("compactdefaultargs") CopyReferences;
		%feature("autodoc", "Copy references from me to the other.

Parameters
----------
theTarget: TObj_Model
theRelocTable: TDF_RelocationTable

Returns
-------
None
") CopyReferences;
		void CopyReferences(const opencascade::handle<TObj_Model> & theTarget, const opencascade::handle<TDF_RelocationTable> & theRelocTable);

		/****************** FindObject ******************/
		%feature("compactdefaultargs") FindObject;
		%feature("autodoc", "Returns an object by given name (or null if not found).

Parameters
----------
theName: TCollection_HExtendedString
theDictionary: TObj_TNameContainer

Returns
-------
opencascade::handle<TObj_Object>
") FindObject;
		virtual opencascade::handle<TObj_Object> FindObject(const opencascade::handle<TCollection_HExtendedString> & theName, const opencascade::handle<TObj_TNameContainer> & theDictionary);

		/****************** GetApplication ******************/
		%feature("compactdefaultargs") GetApplication;
		%feature("autodoc", "Returns handle to static instance of the relevant application class.

Returns
-------
opencascade::handle<TObj_Application>
") GetApplication;
		virtual const opencascade::handle<TObj_Application> GetApplication();

		/****************** GetChecker ******************/
		%feature("compactdefaultargs") GetChecker;
		%feature("autodoc", "Returns the tool checking model consistency. descendant may redefine it to return its own tool.

Returns
-------
opencascade::handle<TObj_CheckModel>
") GetChecker;
		virtual opencascade::handle<TObj_CheckModel> GetChecker();

		/****************** GetChildren ******************/
		%feature("compactdefaultargs") GetChildren;
		%feature("autodoc", "Returns an iterator on objects in the main partition.

Returns
-------
opencascade::handle<TObj_ObjectIterator>
") GetChildren;
		virtual opencascade::handle<TObj_ObjectIterator> GetChildren();

		/****************** GetDictionary ******************/
		%feature("compactdefaultargs") GetDictionary;
		%feature("autodoc", "Returns the map of names of the objects.

Returns
-------
opencascade::handle<TObj_TNameContainer>
") GetDictionary;
		opencascade::handle<TObj_TNameContainer> GetDictionary();

		/****************** GetDocument ******************/
		%feature("compactdefaultargs") GetDocument;
		%feature("autodoc", "Returns ocaf document of model.

Returns
-------
opencascade::handle<TDocStd_Document>
") GetDocument;
		opencascade::handle<TDocStd_Document> GetDocument();

		/****************** GetDocumentModel ******************/
		%feature("compactdefaultargs") GetDocumentModel;
		%feature("autodoc", "Returns model which contains a document with the label, or null handle if label is null.

Parameters
----------
theLabel: TDF_Label

Returns
-------
opencascade::handle<TObj_Model>
") GetDocumentModel;
		static opencascade::handle<TObj_Model> GetDocumentModel(const TDF_Label & theLabel);

		/****************** GetFile ******************/
		%feature("compactdefaultargs") GetFile;
		%feature("autodoc", "Returns the full file name this model is to be saved to, or null if the model was not saved yet.

Returns
-------
opencascade::handle<TCollection_HExtendedString>
") GetFile;
		virtual opencascade::handle<TCollection_HExtendedString> GetFile();

		/****************** GetFormat ******************/
		%feature("compactdefaultargs") GetFormat;
		%feature("autodoc", "Returns the format for save/restore. this implementation returns 'binocaf'. the method should be redefined for those models that should use another format.

Returns
-------
TCollection_ExtendedString
") GetFormat;
		virtual TCollection_ExtendedString GetFormat();

		/****************** GetFormatVersion ******************/
		%feature("compactdefaultargs") GetFormatVersion;
		%feature("autodoc", "Returns the version of format stored in tobj file.

Returns
-------
int
") GetFormatVersion;
		Standard_Integer GetFormatVersion();

		/****************** GetGUID ******************/
		%feature("compactdefaultargs") GetGUID;
		%feature("autodoc", "Defines interface guid for tobj_model.

Returns
-------
Standard_GUID
") GetGUID;
		virtual Standard_GUID GetGUID();

		/****************** GetLabel ******************/
		%feature("compactdefaultargs") GetLabel;
		%feature("autodoc", "Returns ocaf label on which model data are stored.

Returns
-------
TDF_Label
") GetLabel;
		TDF_Label GetLabel();

		/****************** GetMainPartition ******************/
		%feature("compactdefaultargs") GetMainPartition;
		%feature("autodoc", "Returns root object of model.

Returns
-------
opencascade::handle<TObj_Partition>
") GetMainPartition;
		opencascade::handle<TObj_Partition> GetMainPartition();

		/****************** GetModelName ******************/
		%feature("compactdefaultargs") GetModelName;
		%feature("autodoc", "Returns the name of the model.

Returns
-------
opencascade::handle<TCollection_HExtendedString>
") GetModelName;
		virtual opencascade::handle<TCollection_HExtendedString> GetModelName();

		/****************** GetObjects ******************/
		%feature("compactdefaultargs") GetObjects;
		%feature("autodoc", "Returns an iterator on all objects in the model.

Returns
-------
opencascade::handle<TObj_ObjectIterator>
") GetObjects;
		virtual opencascade::handle<TObj_ObjectIterator> GetObjects();

		/****************** GetRoot ******************/
		%feature("compactdefaultargs") GetRoot;
		%feature("autodoc", "Returns root object of model.

Returns
-------
opencascade::handle<TObj_Object>
") GetRoot;
		virtual opencascade::handle<TObj_Object> GetRoot();

		/****************** HasOpenCommand ******************/
		%feature("compactdefaultargs") HasOpenCommand;
		%feature("autodoc", "Returns true if a command transaction is open starting, finishing the transaction.

Returns
-------
bool
") HasOpenCommand;
		Standard_Boolean HasOpenCommand();

		/****************** IsModified ******************/
		%feature("compactdefaultargs") IsModified;
		%feature("autodoc", "Modification status.

Returns
-------
bool
") IsModified;
		virtual Standard_Boolean IsModified();

		/****************** IsRegisteredName ******************/
		%feature("compactdefaultargs") IsRegisteredName;
		%feature("autodoc", "Returns true is name is registered in the names map the input argument may be null handle, then model check in own global container.

Parameters
----------
theName: TCollection_HExtendedString
theDictionary: TObj_TNameContainer

Returns
-------
bool
") IsRegisteredName;
		Standard_Boolean IsRegisteredName(const opencascade::handle<TCollection_HExtendedString> & theName, const opencascade::handle<TObj_TNameContainer> & theDictionary);

		/****************** Load ******************/
		%feature("compactdefaultargs") Load;
		%feature("autodoc", "Load the ocaf model from a file. if the filename is empty or file does not exists, it just initializes model by empty data.

Parameters
----------
theFile: TCollection_ExtendedString

Returns
-------
bool
") Load;
		virtual Standard_Boolean Load(const TCollection_ExtendedString & theFile);

		/****************** Messenger ******************/
		%feature("compactdefaultargs") Messenger;
		%feature("autodoc", "Get messenger used for messages output (by default, the messenger from application is used).

Returns
-------
opencascade::handle<Message_Messenger>
") Messenger;
		opencascade::handle<Message_Messenger> Messenger();

		/****************** NewEmpty ******************/
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "This function have to create a new model with type like me.

Returns
-------
opencascade::handle<TObj_Model>
") NewEmpty;
		virtual opencascade::handle<TObj_Model> NewEmpty();

		/****************** OpenCommand ******************/
		%feature("compactdefaultargs") OpenCommand;
		%feature("autodoc", "Open a new command transaction.

Returns
-------
None
") OpenCommand;
		void OpenCommand();

		/****************** Paste ******************/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "Pastes me to the new model references will not be copied if thereloctable is not 0 if thereloctable is not null thereloctable is filled by objects.

Parameters
----------
theModel: TObj_Model
theRelocTable: TDF_RelocationTable,optional
	default value is 0

Returns
-------
bool
") Paste;
		virtual Standard_Boolean Paste(opencascade::handle<TObj_Model > theModel, opencascade::handle<TDF_RelocationTable > theRelocTable = 0);

		/****************** RegisterName ******************/
		%feature("compactdefaultargs") RegisterName;
		%feature("autodoc", "Register name in the map the input argument may be null handle, then model check in own global container.

Parameters
----------
theName: TCollection_HExtendedString
theLabel: TDF_Label
theDictionary: TObj_TNameContainer

Returns
-------
None
") RegisterName;
		void RegisterName(const opencascade::handle<TCollection_HExtendedString> & theName, const TDF_Label & theLabel, const opencascade::handle<TObj_TNameContainer> & theDictionary);

		/****************** Save ******************/
		%feature("compactdefaultargs") Save;
		%feature("autodoc", "Save the model to the same file.

Returns
-------
bool
") Save;
		Standard_Boolean Save();

		/****************** SaveAs ******************/
		%feature("compactdefaultargs") SaveAs;
		%feature("autodoc", "Save the model to a file.

Parameters
----------
theFile: TCollection_ExtendedString

Returns
-------
bool
") SaveAs;
		virtual Standard_Boolean SaveAs(const TCollection_ExtendedString & theFile);

		/****************** SetLabel ******************/
		%feature("compactdefaultargs") SetLabel;
		%feature("autodoc", "Sets ocaf label on which model data are stored. used by persistence mechanism.

Parameters
----------
theLabel: TDF_Label

Returns
-------
None
") SetLabel;
		void SetLabel(const TDF_Label & theLabel);

		/****************** SetMessenger ******************/
		%feature("compactdefaultargs") SetMessenger;
		%feature("autodoc", "Set messenger to use for messages output.

Parameters
----------
theMsgr: Message_Messenger

Returns
-------
None
") SetMessenger;
		void SetMessenger(const opencascade::handle<Message_Messenger> & theMsgr);

		/****************** SetModified ******************/
		%feature("compactdefaultargs") SetModified;
		%feature("autodoc", "Sets modification status.

Parameters
----------
theModified: bool

Returns
-------
None
") SetModified;
		void SetModified(const Standard_Boolean theModified);

		/****************** SetNewName ******************/
		%feature("compactdefaultargs") SetNewName;
		%feature("autodoc", "Sets new unique name for the object.

Parameters
----------
theObject: TObj_Object

Returns
-------
None
") SetNewName;
		static void SetNewName(const opencascade::handle<TObj_Object> & theObject);

		/****************** UnRegisterName ******************/
		%feature("compactdefaultargs") UnRegisterName;
		%feature("autodoc", "Unregisters name from the map the input argument may be null handle, then model check in own global container.

Parameters
----------
theName: TCollection_HExtendedString
theDictionary: TObj_TNameContainer

Returns
-------
None
") UnRegisterName;
		void UnRegisterName(const opencascade::handle<TCollection_HExtendedString> & theName, const opencascade::handle<TObj_TNameContainer> & theDictionary);

		/****************** Update ******************/
		%feature("compactdefaultargs") Update;
		%feature("autodoc", "This method is called before activating this model.

Returns
-------
bool
") Update;
		virtual Standard_Boolean Update();

};


%make_alias(TObj_Model)

%extend TObj_Model {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************
* class TObj_Object *
********************/
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

/* python proy classes for enums */
%pythoncode {

class TypeFlags:
	Visible = 1

class ObjectState:
	ObjectState_Hidden = 1
	ObjectState_Saved = 2
	ObjectState_Imported = 4
	ObjectState_ImportedByFile = 8
	ObjectState_Ordered = 16
};
/* end python proxy for enums */

		/****************** AddBackReference ******************/
		%feature("compactdefaultargs") AddBackReference;
		%feature("autodoc", "Registers another object as being dependent on this one. stores back references under sublabel 2 (purely transient data, not subject to persistency).

Parameters
----------
theObject: TObj_Object

Returns
-------
None
") AddBackReference;
		virtual void AddBackReference(const opencascade::handle<TObj_Object> & theObject);

		/****************** AfterRetrieval ******************/
		%feature("compactdefaultargs") AfterRetrieval;
		%feature("autodoc", "Preforms updating the links and dependances of the object which are not stored in persistence. should be redefined if necessary.

Returns
-------
None
") AfterRetrieval;
		virtual void AfterRetrieval();

		/****************** BeforeForgetReference ******************/
		%feature("compactdefaultargs") BeforeForgetReference;
		%feature("autodoc", "Invokes from tobj_treference::beforeforget(). thelabel - label on that reference become removed default implementation is empty.

Parameters
----------
&: TDF_Label

Returns
-------
None
") BeforeForgetReference;
		virtual void BeforeForgetReference(const TDF_Label &);

		/****************** BeforeStoring ******************/
		%feature("compactdefaultargs") BeforeStoring;
		%feature("autodoc", "Preforms storing the objects transient fields in ocaf document which were outside transaction mechanism. default implementation doesnot nothing.

Returns
-------
None
") BeforeStoring;
		virtual void BeforeStoring();

		/****************** CanDetach ******************/
		%feature("compactdefaultargs") CanDetach;
		%feature("autodoc", "Checks if object can be detached with specified mode.

Parameters
----------
theMode: TObj_DeletingMode,optional
	default value is TObj_FreeOnly

Returns
-------
bool
") CanDetach;
		virtual Standard_Boolean CanDetach(const TObj_DeletingMode theMode = TObj_FreeOnly);

		/****************** CanRemoveReference ******************/
		%feature("compactdefaultargs") CanRemoveReference;
		%feature("autodoc", "Returns true if the referred object theobject can be deleted without deletion of this object. default implementation does nothing and returns false.

Parameters
----------
theObject: TObj_Object

Returns
-------
bool
") CanRemoveReference;
		virtual Standard_Boolean CanRemoveReference(const opencascade::handle<TObj_Object> & theObject);

		/****************** ClearBackReferences ******************/
		%feature("compactdefaultargs") ClearBackReferences;
		%feature("autodoc", "The default implementation just clear the back references container.

Returns
-------
None
") ClearBackReferences;
		virtual void ClearBackReferences();

		/****************** ClearFlags ******************/
		%feature("compactdefaultargs") ClearFlags;
		%feature("autodoc", "Clears flags by the mask.

Parameters
----------
theMask: int,optional
	default value is ~0

Returns
-------
None
") ClearFlags;
		void ClearFlags(const Standard_Integer theMask = ~0);

		/****************** Clone ******************/
		%feature("compactdefaultargs") Clone;
		%feature("autodoc", "Copy me to other label thetargetlabel new object will not have all the reference that has me. coping object with data and childs, but change name by adding string '_copy' as result return handle of new object (null handle is something wrong) note: backreferences not coping. after clonning all objects it is neccessary to call copy references with the same relocation table.

Parameters
----------
theTargetLabel: TDF_Label
theRelocTable: TDF_RelocationTable,optional
	default value is 0

Returns
-------
opencascade::handle<TObj_Object>
") Clone;
		virtual opencascade::handle<TObj_Object> Clone(const TDF_Label & theTargetLabel, opencascade::handle<TDF_RelocationTable > theRelocTable = 0);

		/****************** CopyChildren ******************/
		%feature("compactdefaultargs") CopyChildren;
		%feature("autodoc", "Coping the children from source label to the target.

Parameters
----------
theTargetLabel: TDF_Label
theRelocTable: TDF_RelocationTable

Returns
-------
None
") CopyChildren;
		virtual void CopyChildren(TDF_Label & theTargetLabel, const opencascade::handle<TDF_RelocationTable> & theRelocTable);

		/****************** CopyReferences ******************/
		%feature("compactdefaultargs") CopyReferences;
		%feature("autodoc", "Coping the references. return standard_false is target object is different type.

Parameters
----------
theTargetObject: TObj_Object
theRelocTable: TDF_RelocationTable

Returns
-------
None
") CopyReferences;
		virtual void CopyReferences(const opencascade::handle<TObj_Object> & theTargetObject, const opencascade::handle<TDF_RelocationTable> & theRelocTable);

		/****************** Detach ******************/
		%feature("compactdefaultargs") Detach;
		%feature("autodoc", "Deletes the object from the model. the dependent objects are either deleted or modified when possible (see description of tobj_deletingmode enumeration for more details) returns true if deletion was successful. checks if object can be deleted. should be redefined for each specific kind of object.

Parameters
----------
theMode: TObj_DeletingMode,optional
	default value is TObj_FreeOnly

Returns
-------
bool
") Detach;
		virtual Standard_Boolean Detach(const TObj_DeletingMode theMode = TObj_FreeOnly);

		/****************** Detach ******************/
		%feature("compactdefaultargs") Detach;
		%feature("autodoc", "Deletes the object from the label. checks if object can be deleted. finds object on the label and detaches it by calling previos method. returns true if there is no object on the label after detaching.

Parameters
----------
theLabel: TDF_Label
theMode: TObj_DeletingMode,optional
	default value is TObj_FreeOnly

Returns
-------
bool
") Detach;
		static Standard_Boolean Detach(const TDF_Label & theLabel, const TObj_DeletingMode theMode = TObj_FreeOnly);

		/****************** GetBackReferences ******************/
		%feature("compactdefaultargs") GetBackReferences;
		%feature("autodoc", "Returns iterator for the objects which depend on this one. these reffering objects may belong to other models. thetype narrows a variety of iterated objects.

Parameters
----------
theType: Standard_Type,optional
	default value is NULL

Returns
-------
opencascade::handle<TObj_ObjectIterator>
") GetBackReferences;
		virtual opencascade::handle<TObj_ObjectIterator> GetBackReferences(const opencascade::handle<Standard_Type> & theType = NULL);

		/****************** GetBadReference ******************/
		%feature("compactdefaultargs") GetBadReference;
		%feature("autodoc", "Return true if this refers to the model theroot belongs to and a referred label is not a descendant of theroot. in this case thebadreference returns the currently referred label.

Parameters
----------
theRoot: TDF_Label
theBadReference: TDF_Label

Returns
-------
bool
") GetBadReference;
		virtual Standard_Boolean GetBadReference(const TDF_Label & theRoot, TDF_Label & theBadReference);

		/****************** GetChildLabel ******************/
		%feature("compactdefaultargs") GetChildLabel;
		%feature("autodoc", "Returns the label under which children are stored.

Returns
-------
TDF_Label
") GetChildLabel;
		TDF_Label GetChildLabel();

		/****************** GetChildren ******************/
		%feature("compactdefaultargs") GetChildren;
		%feature("autodoc", "Returns iterator for the child objects. this method provides tree-like view of the objects hierarchy. the references to other objects are not considered as children. thetype narrows a variety of iterated objects the default implementation search for children on 1 sublavel of the children sub label.

Parameters
----------
theType: Standard_Type,optional
	default value is NULL

Returns
-------
opencascade::handle<TObj_ObjectIterator>
") GetChildren;
		virtual opencascade::handle<TObj_ObjectIterator> GetChildren(const opencascade::handle<Standard_Type> & theType = NULL);

		/****************** GetDataLabel ******************/
		%feature("compactdefaultargs") GetDataLabel;
		%feature("autodoc", "Returns the label which is the root for data ocaf sub-tree.

Returns
-------
TDF_Label
") GetDataLabel;
		TDF_Label GetDataLabel();

		/****************** GetDictionary ******************/
		%feature("compactdefaultargs") GetDictionary;
		%feature("autodoc", "Returns the map of names of the objects default implementation returns global dictionary of the model.

Returns
-------
opencascade::handle<TObj_TNameContainer>
") GetDictionary;
		virtual opencascade::handle<TObj_TNameContainer> GetDictionary();

		/****************** GetFatherObject ******************/
		%feature("compactdefaultargs") GetFatherObject;
		%feature("autodoc", "Returns the father object, which may be null thetype gives type of father object to search.

Parameters
----------
theType: Standard_Type,optional
	default value is NULL

Returns
-------
opencascade::handle<TObj_Object>
") GetFatherObject;
		opencascade::handle<TObj_Object> GetFatherObject(const opencascade::handle<Standard_Type> & theType = NULL);

		/****************** GetFlags ******************/
		%feature("compactdefaultargs") GetFlags;
		%feature("autodoc", "Returns mask of seted flags.

Returns
-------
int
") GetFlags;
		Standard_Integer GetFlags();

		/****************** GetLabel ******************/
		%feature("compactdefaultargs") GetLabel;
		%feature("autodoc", "Returns the ocaf label on which object`s data are stored.

Returns
-------
TDF_Label
") GetLabel;
		TDF_Label GetLabel();

		/****************** GetModel ******************/
		%feature("compactdefaultargs") GetModel;
		%feature("autodoc", "Returns the model to which the object belongs.

Returns
-------
opencascade::handle<TObj_Model>
") GetModel;
		virtual opencascade::handle<TObj_Model> GetModel();

		/****************** GetName ******************/
		%feature("compactdefaultargs") GetName;
		%feature("autodoc", "Returns the name of the object (empty string if object has no name).

Returns
-------
opencascade::handle<TCollection_HExtendedString>
") GetName;
		virtual opencascade::handle<TCollection_HExtendedString> GetName();

		/****************** GetName ******************/
		%feature("compactdefaultargs") GetName;
		%feature("autodoc", "Returns the standard_true is object has name and returns name to thename.

Parameters
----------
theName: TCollection_ExtendedString

Returns
-------
bool
") GetName;
		Standard_Boolean GetName(TCollection_ExtendedString & theName);

		/****************** GetName ******************/
		%feature("compactdefaultargs") GetName;
		%feature("autodoc", "Returns the standard_true is object has name and returns name to thename.

Parameters
----------
theName: TCollection_AsciiString

Returns
-------
bool
") GetName;
		Standard_Boolean GetName(TCollection_AsciiString & theName);

		/****************** GetNameForClone ******************/
		%feature("compactdefaultargs") GetNameForClone;
		%feature("autodoc", "Returns name for copy default implementation returns the same name.

Parameters
----------
&: TObj_Object

Returns
-------
opencascade::handle<TCollection_HExtendedString>
") GetNameForClone;
		virtual opencascade::handle<TCollection_HExtendedString> GetNameForClone(const opencascade::handle<TObj_Object > &);

		/****************** GetObj ******************/
		%feature("compactdefaultargs") GetObj;
		%feature("autodoc", "Returns the object attached to a given label. returns false if no object of type tobj_object is stored on the specified label. if issuper is true tries to find on the super labels.

Parameters
----------
theLabel: TDF_Label
theResult: TObj_Object
isSuper: bool,optional
	default value is Standard_False

Returns
-------
bool
") GetObj;
		static Standard_Boolean GetObj(const TDF_Label & theLabel, opencascade::handle<TObj_Object> & theResult, const Standard_Boolean isSuper = Standard_False);

		/****************** GetOrder ******************/
		%feature("compactdefaultargs") GetOrder;
		%feature("autodoc", "Returns order of object (or tag of their label if order is not initialised).

Returns
-------
int
") GetOrder;
		virtual Standard_Integer GetOrder();

		/****************** GetReferenceLabel ******************/
		%feature("compactdefaultargs") GetReferenceLabel;
		%feature("autodoc", "Returns the label which is the root for reference ocaf sub-tree.

Returns
-------
TDF_Label
") GetReferenceLabel;
		TDF_Label GetReferenceLabel();

		/****************** GetReferences ******************/
		%feature("compactdefaultargs") GetReferences;
		%feature("autodoc", "Returns an iterator containing objects that compose the this one thetype narrows a variety of iterated objects.

Parameters
----------
theType: Standard_Type,optional
	default value is NULL

Returns
-------
opencascade::handle<TObj_ObjectIterator>
") GetReferences;
		virtual opencascade::handle<TObj_ObjectIterator> GetReferences(const opencascade::handle<Standard_Type> & theType = NULL);

		/****************** GetTypeFlags ******************/
		%feature("compactdefaultargs") GetTypeFlags;
		%feature("autodoc", "Returns flags (bitmask) that define properties of objects of that type by default returns flag visible.

Returns
-------
int
") GetTypeFlags;
		virtual Standard_Integer GetTypeFlags();

		/****************** HasBackReferences ******************/
		%feature("compactdefaultargs") HasBackReferences;
		%feature("autodoc", "Returns true if obejct has 1 or more back references.

Returns
-------
bool
") HasBackReferences;
		Standard_Boolean HasBackReferences();

		/****************** HasReference ******************/
		%feature("compactdefaultargs") HasReference;
		%feature("autodoc", "Returns true if object has reference to indicated object.

Parameters
----------
theObject: TObj_Object

Returns
-------
bool
") HasReference;
		virtual Standard_Boolean HasReference(const opencascade::handle<TObj_Object> & theObject);

		/****************** IsAlive ******************/
		%feature("compactdefaultargs") IsAlive;
		%feature("autodoc", "Checks that object alive in model default implementation checks that object has tobject attribute at own label.

Returns
-------
bool
") IsAlive;
		virtual Standard_Boolean IsAlive();

		/****************** RelocateReferences ******************/
		%feature("compactdefaultargs") RelocateReferences;
		%feature("autodoc", "Make that each reference pointing to a descendant label of thefromroot to point to an equivalent label under thetoroot. return false if a resulting reference does not point to an tobj_object example: a referred object label = 0:3:24:7:2:7 thefromroot = 0:3:24 thetoroot = 0:2 a new referred label = 0:2:7:2:7.

Parameters
----------
theFromRoot: TDF_Label
theToRoot: TDF_Label
theUpdateBackRefs: bool,optional
	default value is Standard_True

Returns
-------
bool
") RelocateReferences;
		virtual Standard_Boolean RelocateReferences(const TDF_Label & theFromRoot, const TDF_Label & theToRoot, const Standard_Boolean theUpdateBackRefs = Standard_True);

		/****************** RemoveAllReferences ******************/
		%feature("compactdefaultargs") RemoveAllReferences;
		%feature("autodoc", "Remove all references to other objects, by removing all reference attributes.

Returns
-------
None
") RemoveAllReferences;
		virtual void RemoveAllReferences();

		/****************** RemoveBackReference ******************/
		%feature("compactdefaultargs") RemoveBackReference;
		%feature("autodoc", "Removes information on dependent object (back reference). if thesingleonly is true only the first back reference is removed in the case of duplicate items.

Parameters
----------
theObject: TObj_Object
theSingleOnly: bool,optional
	default value is Standard_True

Returns
-------
None
") RemoveBackReference;
		virtual void RemoveBackReference(const opencascade::handle<TObj_Object> & theObject, const Standard_Boolean theSingleOnly = Standard_True);

		/****************** RemoveBackReferences ******************/
		%feature("compactdefaultargs") RemoveBackReferences;
		%feature("autodoc", "Removes all back reference by removing references from other to me.

Parameters
----------
theMode: TObj_DeletingMode,optional
	default value is TObj_FreeOnly

Returns
-------
bool
") RemoveBackReferences;
		virtual Standard_Boolean RemoveBackReferences(const TObj_DeletingMode theMode = TObj_FreeOnly);

		/****************** RemoveReference ******************/
		%feature("compactdefaultargs") RemoveReference;
		%feature("autodoc", "Removes reference to the object by replace reference to null object.

Parameters
----------
theObject: TObj_Object

Returns
-------
None
") RemoveReference;
		virtual void RemoveReference(const opencascade::handle<TObj_Object> & theObject);

		/****************** ReplaceReference ******************/
		%feature("compactdefaultargs") ReplaceReference;
		%feature("autodoc", "Replace reference from old object to new object. if it is not possible, may raise exception. if new object is null then simple remove reference to old object.

Parameters
----------
theOldObject: TObj_Object
theNewObject: TObj_Object

Returns
-------
None
") ReplaceReference;
		virtual void ReplaceReference(const opencascade::handle<TObj_Object> & theOldObject, const opencascade::handle<TObj_Object> & theNewObject);

		/****************** SetFlags ******************/
		%feature("compactdefaultargs") SetFlags;
		%feature("autodoc", "Sets flags with defined mask.

Parameters
----------
theMask: int

Returns
-------
None
") SetFlags;
		void SetFlags(const Standard_Integer theMask);

		/****************** SetName ******************/
		%feature("compactdefaultargs") SetName;
		%feature("autodoc", "Sets name of the object. returns false if thename is not unique.

Parameters
----------
theName: TCollection_HExtendedString

Returns
-------
bool
") SetName;
		virtual Standard_Boolean SetName(const opencascade::handle<TCollection_HExtendedString> & theName);

		/****************** SetName ******************/
		%feature("compactdefaultargs") SetName;
		%feature("autodoc", "Sets name of the object. returns false if thename is not unique.

Parameters
----------
theName: TCollection_HAsciiString

Returns
-------
bool
") SetName;
		Standard_Boolean SetName(const opencascade::handle<TCollection_HAsciiString> & theName);

		/****************** SetName ******************/
		%feature("compactdefaultargs") SetName;
		%feature("autodoc", "Sets name of the object. returns false if thename is not unique.

Parameters
----------
name: char *

Returns
-------
bool
") SetName;
		Standard_Boolean SetName(const char * name);

		/****************** SetOrder ******************/
		%feature("compactdefaultargs") SetOrder;
		%feature("autodoc", "Sets order of object.

Parameters
----------
theIndx: int

Returns
-------
bool
") SetOrder;
		virtual Standard_Boolean SetOrder(const Standard_Integer & theIndx);

		/****************** TestFlags ******************/
		%feature("compactdefaultargs") TestFlags;
		%feature("autodoc", "Tests flags by the mask.

Parameters
----------
theMask: int

Returns
-------
bool
") TestFlags;
		Standard_Boolean TestFlags(const Standard_Integer theMask);

		/****************** getChildLabel ******************/
		%feature("compactdefaultargs") getChildLabel;
		%feature("autodoc", "Returns the label for child with rank.

Parameters
----------
theRank: int

Returns
-------
TDF_Label
") getChildLabel;
		TDF_Label getChildLabel(const Standard_Integer theRank);

};


%make_alias(TObj_Object)

%extend TObj_Object {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************
* class TObj_ObjectIterator *
****************************/
class TObj_ObjectIterator : public Standard_Transient {
	public:
		/****************** More ******************/
		%feature("compactdefaultargs") More;
		%feature("autodoc", "Returns true if iteration is not finished and method current() will give the object. default implementation returns false.

Returns
-------
bool
") More;
		virtual Standard_Boolean More();

		/****************** Next ******************/
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "Iterates to the next object default implementation does nothing.

Returns
-------
None
") Next;
		virtual void Next();

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Returns current object (or null if iteration has finished) default implementation returns null handle.

Returns
-------
opencascade::handle<TObj_Object>
") Value;
		virtual opencascade::handle<TObj_Object> Value();

};


%make_alias(TObj_ObjectIterator)

%extend TObj_ObjectIterator {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************
* class TObj_Persistence *
*************************/
%nodefaultctor TObj_Persistence;
%ignore TObj_Persistence::~TObj_Persistence();
class TObj_Persistence {
	public:
		/****************** CreateNewObject ******************/
		%feature("compactdefaultargs") CreateNewObject;
		%feature("autodoc", "Creates and returns a new object of the registered type if the type is not registered, returns null handle.

Parameters
----------
theType: char *
theLabel: TDF_Label

Returns
-------
opencascade::handle<TObj_Object>
") CreateNewObject;
		static opencascade::handle<TObj_Object> CreateNewObject(const char * theType, const TDF_Label & theLabel);


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

/*****************************
* class TObj_TIntSparseArray *
*****************************/
class TObj_TIntSparseArray : public TDF_Attribute {
	public:
typedef TObj_TIntSparseArray_VecOfData ::ConstIterator Iterator;
		/****************** TObj_TIntSparseArray ******************/
		%feature("compactdefaultargs") TObj_TIntSparseArray;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") TObj_TIntSparseArray;
		 TObj_TIntSparseArray();

		/****************** AfterUndo ******************/
		%feature("compactdefaultargs") AfterUndo;
		%feature("autodoc", "Clears my modification delta; called after application of thedelta.

Parameters
----------
theDelta: TDF_AttributeDelta
toForce: bool

Returns
-------
bool
") AfterUndo;
		Standard_Boolean AfterUndo(const opencascade::handle<TDF_AttributeDelta> & theDelta, const Standard_Boolean toForce);

		/****************** BackupCopy ******************/
		%feature("compactdefaultargs") BackupCopy;
		%feature("autodoc", "Moves this delta into a new other attribute.

Returns
-------
opencascade::handle<TDF_Attribute>
") BackupCopy;
		opencascade::handle<TDF_Attribute> BackupCopy();

		/****************** BeforeCommitTransaction ******************/
		%feature("compactdefaultargs") BeforeCommitTransaction;
		%feature("autodoc", "It is called just before commit or abort transaction and does backup() to create a delta.

Returns
-------
None
") BeforeCommitTransaction;
		void BeforeCommitTransaction();

		/****************** Clear ******************/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "Clears the set.

Returns
-------
None
") Clear;
		void Clear();

		/****************** ClearDelta ******************/
		%feature("compactdefaultargs") ClearDelta;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") ClearDelta;
		void ClearDelta();

		/****************** DeltaOnModification ******************/
		%feature("compactdefaultargs") DeltaOnModification;
		%feature("autodoc", "Applies thedelta to this.

Parameters
----------
theDelta: TDF_DeltaOnModification

Returns
-------
None
") DeltaOnModification;
		void DeltaOnModification(const opencascade::handle<TDF_DeltaOnModification> & theDelta);

		/****************** GetID ******************/
		%feature("compactdefaultargs") GetID;
		%feature("autodoc", "This method is used in implementation of id().

Returns
-------
Standard_GUID
") GetID;
		static const Standard_GUID & GetID();

		/****************** GetIterator ******************/
		%feature("compactdefaultargs") GetIterator;
		%feature("autodoc", "Returns iterator on objects contained in the set.

Returns
-------
Iterator
") GetIterator;
		Iterator GetIterator();

		/****************** HasValue ******************/
		%feature("compactdefaultargs") HasValue;
		%feature("autodoc", "Returns true if the value with the given id is present.

Parameters
----------
theId: Standard_Size

Returns
-------
bool
") HasValue;
		Standard_Boolean HasValue(const Standard_Size theId);

		/****************** ID ******************/
		%feature("compactdefaultargs") ID;
		%feature("autodoc", "Returns the id of this attribute.

Returns
-------
Standard_GUID
") ID;
		const Standard_GUID & ID();

		/****************** NewEmpty ******************/
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "Returns an new empty tobj_tintsparsearray attribute. it is used by the copy algorithm.

Returns
-------
opencascade::handle<TDF_Attribute>
") NewEmpty;
		opencascade::handle<TDF_Attribute> NewEmpty();

		/****************** Paste ******************/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "This method is used when copying an attribute from a source structure into a target structure.

Parameters
----------
theInto: TDF_Attribute
theRT: TDF_RelocationTable

Returns
-------
None
") Paste;
		void Paste(const opencascade::handle<TDF_Attribute> & theInto, const opencascade::handle<TDF_RelocationTable> & theRT);

		/****************** Restore ******************/
		%feature("compactdefaultargs") Restore;
		%feature("autodoc", "Restores the set using info saved in backup attribute thedelta.

Parameters
----------
theDelta: TDF_Attribute

Returns
-------
None
") Restore;
		void Restore(const opencascade::handle<TDF_Attribute> & theDelta);

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "Creates tobj_tintsparsearray attribute on given label.

Parameters
----------
theLabel: TDF_Label

Returns
-------
opencascade::handle<TObj_TIntSparseArray>
") Set;
		static opencascade::handle<TObj_TIntSparseArray> Set(const TDF_Label & theLabel);

		/****************** SetDoBackup ******************/
		%feature("compactdefaultargs") SetDoBackup;
		%feature("autodoc", "Sets the flag pointing to the necessity to maintain a modification delta. it is called by the retrieval driver.

Parameters
----------
toDo: bool

Returns
-------
None
") SetDoBackup;
		void SetDoBackup(const Standard_Boolean toDo);

		/****************** SetValue ******************/
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "Sets the value with the given id. raises an exception if theid is not positive.

Parameters
----------
theId: Standard_Size
theValue: int

Returns
-------
None
") SetValue;
		void SetValue(const Standard_Size theId, const Standard_Integer theValue);

		/****************** Size ******************/
		%feature("compactdefaultargs") Size;
		%feature("autodoc", "Returns the number of stored values in the set.

Returns
-------
Standard_Size
") Size;
		Standard_Size Size();

		/****************** UnsetValue ******************/
		%feature("compactdefaultargs") UnsetValue;
		%feature("autodoc", "Unsets the value with the given id. raises an exception if theid is not positive.

Parameters
----------
theId: Standard_Size

Returns
-------
None
") UnsetValue;
		void UnsetValue(const Standard_Size theId);

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Returns the value by its id. raises an exception if no value is stored with this id.

Parameters
----------
theId: Standard_Size

Returns
-------
int
") Value;
		Standard_Integer Value(const Standard_Size theId);

};


%make_alias(TObj_TIntSparseArray)

%extend TObj_TIntSparseArray {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************
* class TObj_TModel *
********************/
class TObj_TModel : public TDF_Attribute {
	public:
		/****************** TObj_TModel ******************/
		%feature("compactdefaultargs") TObj_TModel;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") TObj_TModel;
		 TObj_TModel();

		/****************** GetID ******************/
		%feature("compactdefaultargs") GetID;
		%feature("autodoc", "This method is used in implementation of id().

Returns
-------
Standard_GUID
") GetID;
		static const Standard_GUID & GetID();

		/****************** ID ******************/
		%feature("compactdefaultargs") ID;
		%feature("autodoc", "Returns the id of tobj_tmodel attribute.

Returns
-------
Standard_GUID
") ID;
		const Standard_GUID & ID();

		/****************** Model ******************/
		%feature("compactdefaultargs") Model;
		%feature("autodoc", "Returns the model object.

Returns
-------
opencascade::handle<TObj_Model>
") Model;
		opencascade::handle<TObj_Model> Model();

		/****************** NewEmpty ******************/
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "Returns an new empty tobj_tmodel attribute. it is used by the copy algorithm.

Returns
-------
opencascade::handle<TDF_Attribute>
") NewEmpty;
		opencascade::handle<TDF_Attribute> NewEmpty();

		/****************** Paste ******************/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "This method is used when copying an attribute from a source structure into a target structure.

Parameters
----------
theInto: TDF_Attribute
theRT: TDF_RelocationTable

Returns
-------
None
") Paste;
		void Paste(const opencascade::handle<TDF_Attribute> & theInto, const opencascade::handle<TDF_RelocationTable> & theRT);

		/****************** Restore ******************/
		%feature("compactdefaultargs") Restore;
		%feature("autodoc", "Restores the backuped contents from <thewith> into this one. it is used when aborting a transaction.

Parameters
----------
theWith: TDF_Attribute

Returns
-------
None
") Restore;
		void Restore(const opencascade::handle<TDF_Attribute> & theWith);

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "Sets the the model object.

Parameters
----------
theModel: TObj_Model

Returns
-------
None
") Set;
		void Set(const opencascade::handle<TObj_Model> & theModel);

};


%make_alias(TObj_TModel)

%extend TObj_TModel {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************
* class TObj_TNameContainer *
****************************/
class TObj_TNameContainer : public TDF_Attribute {
	public:
		/****************** TObj_TNameContainer ******************/
		%feature("compactdefaultargs") TObj_TNameContainer;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") TObj_TNameContainer;
		 TObj_TNameContainer();

		/****************** Clear ******************/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "Remove all names registered in container.

Returns
-------
None
") Clear;
		void Clear();

		/****************** Get ******************/
		%feature("compactdefaultargs") Get;
		%feature("autodoc", "Returns the tobj_datamapofnamelabel object.

Returns
-------
TObj_DataMapOfNameLabel
") Get;
		const TObj_DataMapOfNameLabel & Get();

		/****************** GetID ******************/
		%feature("compactdefaultargs") GetID;
		%feature("autodoc", "This method is used in implementation of id().

Returns
-------
Standard_GUID
") GetID;
		static const Standard_GUID & GetID();

		/****************** ID ******************/
		%feature("compactdefaultargs") ID;
		%feature("autodoc", "Returns the id of tobj_tnamecontainer attribute.

Returns
-------
Standard_GUID
") ID;
		const Standard_GUID & ID();

		/****************** IsRegistered ******************/
		%feature("compactdefaultargs") IsRegistered;
		%feature("autodoc", "Return true is thename is registered in the map.

Parameters
----------
theName: TCollection_HExtendedString

Returns
-------
bool
") IsRegistered;
		Standard_Boolean IsRegistered(const opencascade::handle<TCollection_HExtendedString> & theName);

		/****************** NewEmpty ******************/
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "Returns an new empty tobj_tnamecontainer attribute. it is used by the copy algorithm.

Returns
-------
opencascade::handle<TDF_Attribute>
") NewEmpty;
		opencascade::handle<TDF_Attribute> NewEmpty();

		/****************** Paste ******************/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "This method is used when copying an attribute from a source structure into a target structure.

Parameters
----------
theInto: TDF_Attribute
theRT: TDF_RelocationTable

Returns
-------
None
") Paste;
		void Paste(const opencascade::handle<TDF_Attribute> & theInto, const opencascade::handle<TDF_RelocationTable> & theRT);

		/****************** RecordName ******************/
		%feature("compactdefaultargs") RecordName;
		%feature("autodoc", "Records name with label attached.

Parameters
----------
theName: TCollection_HExtendedString
theLabel: TDF_Label

Returns
-------
None
") RecordName;
		void RecordName(const opencascade::handle<TCollection_HExtendedString> & theName, const TDF_Label & theLabel);

		/****************** RemoveName ******************/
		%feature("compactdefaultargs") RemoveName;
		%feature("autodoc", "Remove name from the map.

Parameters
----------
theName: TCollection_HExtendedString

Returns
-------
None
") RemoveName;
		void RemoveName(const opencascade::handle<TCollection_HExtendedString> & theName);

		/****************** Restore ******************/
		%feature("compactdefaultargs") Restore;
		%feature("autodoc", "Restores the backuped contents from <thewith> into this one. it is used when aborting a transaction.

Parameters
----------
theWith: TDF_Attribute

Returns
-------
None
") Restore;
		void Restore(const opencascade::handle<TDF_Attribute> & theWith);

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "Creates tobj_datamapofnamelabel attribute on given label if not exist.

Parameters
----------
theLabel: TDF_Label

Returns
-------
opencascade::handle<TObj_TNameContainer>
") Set;
		static opencascade::handle<TObj_TNameContainer> Set(const TDF_Label & theLabel);

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "Sets the tobj_datamapofnamelabel object.

Parameters
----------
theElem: TObj_DataMapOfNameLabel

Returns
-------
None
") Set;
		void Set(const TObj_DataMapOfNameLabel & theElem);

};


%make_alias(TObj_TNameContainer)

%extend TObj_TNameContainer {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************
* class TObj_TObject *
*********************/
class TObj_TObject : public TDF_Attribute {
	public:
		/****************** TObj_TObject ******************/
		%feature("compactdefaultargs") TObj_TObject;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") TObj_TObject;
		 TObj_TObject();

		/****************** AfterUndo ******************/
		%feature("compactdefaultargs") AfterUndo;
		%feature("autodoc", "Tell tobj_object to rise from the dead, i.e. (myelem->isalive() == true) after that.

Parameters
----------
anAttDelta: TDF_AttributeDelta
forceIt: bool

Returns
-------
bool
") AfterUndo;
		Standard_Boolean AfterUndo(const opencascade::handle<TDF_AttributeDelta> & anAttDelta, const Standard_Boolean forceIt);

		/****************** BeforeForget ******************/
		%feature("compactdefaultargs") BeforeForget;
		%feature("autodoc", "Tell tobj_object to die, i.e. (myelem->isalive() == false) after that.

Returns
-------
None
") BeforeForget;
		void BeforeForget();

		/****************** Get ******************/
		%feature("compactdefaultargs") Get;
		%feature("autodoc", "Returns the tobj_object object.

Returns
-------
opencascade::handle<TObj_Object>
") Get;
		opencascade::handle<TObj_Object> Get();

		/****************** GetID ******************/
		%feature("compactdefaultargs") GetID;
		%feature("autodoc", "This method is used in implementation of id().

Returns
-------
Standard_GUID
") GetID;
		static const Standard_GUID & GetID();

		/****************** ID ******************/
		%feature("compactdefaultargs") ID;
		%feature("autodoc", "Returns the id of tobj_tobject attribute.

Returns
-------
Standard_GUID
") ID;
		const Standard_GUID & ID();

		/****************** NewEmpty ******************/
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "Returns an new empty tobj_tobject attribute. it is used by the copy algorithm.

Returns
-------
opencascade::handle<TDF_Attribute>
") NewEmpty;
		opencascade::handle<TDF_Attribute> NewEmpty();

		/****************** Paste ******************/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "This method is used when copying an attribute from a source structure into a target structure.

Parameters
----------
theInto: TDF_Attribute
theRT: TDF_RelocationTable

Returns
-------
None
") Paste;
		void Paste(const opencascade::handle<TDF_Attribute> & theInto, const opencascade::handle<TDF_RelocationTable> & theRT);

		/****************** Restore ******************/
		%feature("compactdefaultargs") Restore;
		%feature("autodoc", "Restores the backuped contents from <thewith> into this one. it is used when aborting a transaction.

Parameters
----------
theWith: TDF_Attribute

Returns
-------
None
") Restore;
		void Restore(const opencascade::handle<TDF_Attribute> & theWith);

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "Creates tobj_tobject attribute on given label.

Parameters
----------
theLabel: TDF_Label
theElem: TObj_Object

Returns
-------
opencascade::handle<TObj_TObject>
") Set;
		static opencascade::handle<TObj_TObject> Set(const TDF_Label & theLabel, const opencascade::handle<TObj_Object> & theElem);

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "Sets the tobj_object object.

Parameters
----------
theElem: TObj_Object

Returns
-------
None
") Set;
		void Set(const opencascade::handle<TObj_Object> & theElem);

};


%make_alias(TObj_TObject)

%extend TObj_TObject {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************
* class TObj_TReference *
************************/
class TObj_TReference : public TDF_Attribute {
	public:
		/****************** TObj_TReference ******************/
		%feature("compactdefaultargs") TObj_TReference;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") TObj_TReference;
		 TObj_TReference();

		/****************** AfterResume ******************/
		%feature("compactdefaultargs") AfterResume;
		%feature("autodoc", "Check if back reference exists for reference.

Returns
-------
None
") AfterResume;
		virtual void AfterResume();

		/****************** AfterRetrieval ******************/
		%feature("compactdefaultargs") AfterRetrieval;
		%feature("autodoc", "Called after retrieval reference from file.

Parameters
----------
forceIt: bool,optional
	default value is Standard_False

Returns
-------
bool
") AfterRetrieval;
		virtual Standard_Boolean AfterRetrieval(const Standard_Boolean forceIt = Standard_False);

		/****************** AfterUndo ******************/
		%feature("compactdefaultargs") AfterUndo;
		%feature("autodoc", "It is necessary for tranzaction mechanism (undo/redo).

Parameters
----------
theDelta: TDF_AttributeDelta
isForced: bool,optional
	default value is Standard_False

Returns
-------
bool
") AfterUndo;
		virtual Standard_Boolean AfterUndo(const opencascade::handle<TDF_AttributeDelta> & theDelta, const Standard_Boolean isForced = Standard_False);

		/****************** BeforeForget ******************/
		%feature("compactdefaultargs") BeforeForget;
		%feature("autodoc", "Remove back references of it reference if it is in other document.

Returns
-------
None
") BeforeForget;
		virtual void BeforeForget();

		/****************** BeforeUndo ******************/
		%feature("compactdefaultargs") BeforeUndo;
		%feature("autodoc", "It is necessary for tranzaction mechanism (undo/redo).

Parameters
----------
theDelta: TDF_AttributeDelta
isForced: bool,optional
	default value is Standard_False

Returns
-------
bool
") BeforeUndo;
		virtual Standard_Boolean BeforeUndo(const opencascade::handle<TDF_AttributeDelta> & theDelta, const Standard_Boolean isForced = Standard_False);

		/****************** Get ******************/
		%feature("compactdefaultargs") Get;
		%feature("autodoc", "Returns the referenced theobject.

Returns
-------
opencascade::handle<TObj_Object>
") Get;
		opencascade::handle<TObj_Object> Get();

		/****************** GetID ******************/
		%feature("compactdefaultargs") GetID;
		%feature("autodoc", "This method is used in implementation of id().

Returns
-------
Standard_GUID
") GetID;
		static const Standard_GUID & GetID();

		/****************** GetLabel ******************/
		%feature("compactdefaultargs") GetLabel;
		%feature("autodoc", "Returns the referred label.

Returns
-------
TDF_Label
") GetLabel;
		TDF_Label GetLabel();

		/****************** GetMasterLabel ******************/
		%feature("compactdefaultargs") GetMasterLabel;
		%feature("autodoc", "Returns the label of master object.

Returns
-------
TDF_Label
") GetMasterLabel;
		TDF_Label GetMasterLabel();

		/****************** ID ******************/
		%feature("compactdefaultargs") ID;
		%feature("autodoc", "Returns the id of tobj_treference attribute.

Returns
-------
Standard_GUID
") ID;
		const Standard_GUID & ID();

		/****************** NewEmpty ******************/
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "Returns an new empty tobj_treference attribute. it is used by the copy algorithm.

Returns
-------
opencascade::handle<TDF_Attribute>
") NewEmpty;
		opencascade::handle<TDF_Attribute> NewEmpty();

		/****************** Paste ******************/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "This method is used when copying an attribute from a source structure into a target structure.

Parameters
----------
theInto: TDF_Attribute
theRT: TDF_RelocationTable

Returns
-------
None
") Paste;
		void Paste(const opencascade::handle<TDF_Attribute> & theInto, const opencascade::handle<TDF_RelocationTable> & theRT);

		/****************** Restore ******************/
		%feature("compactdefaultargs") Restore;
		%feature("autodoc", "Restores the backuped contents from <thewith> into this one. it is used when aborting a transaction.

Parameters
----------
theWith: TDF_Attribute

Returns
-------
None
") Restore;
		void Restore(const opencascade::handle<TDF_Attribute> & theWith);

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "Creates reference on tdf_label <thelabel> to the object <theobject> and creates backreference from the object <theobject> to <themaster> one.

Parameters
----------
theLabel: TDF_Label
theObject: TObj_Object
theMaster: TObj_Object

Returns
-------
opencascade::handle<TObj_TReference>
") Set;
		static opencascade::handle<TObj_TReference> Set(const TDF_Label & theLabel, const opencascade::handle<TObj_Object> & theObject, const opencascade::handle<TObj_Object> & theMaster);

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "Sets the reference to the theobject.

Parameters
----------
theObject: TObj_Object
theMasterLabel: TDF_Label

Returns
-------
None
") Set;
		void Set(const opencascade::handle<TObj_Object> & theObject, const TDF_Label & theMasterLabel);

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "Sets the reference to the theobject at indicated label. it is method for persistent only. don`t use anywhere else.

Parameters
----------
theLabel: TDF_Label
theMasterLabel: TDF_Label

Returns
-------
None
") Set;
		void Set(const TDF_Label & theLabel, const TDF_Label & theMasterLabel);

};


%make_alias(TObj_TReference)

%extend TObj_TReference {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************
* class TObj_TXYZ *
******************/
class TObj_TXYZ : public TDF_Attribute {
	public:
		/****************** TObj_TXYZ ******************/
		%feature("compactdefaultargs") TObj_TXYZ;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") TObj_TXYZ;
		 TObj_TXYZ();


        %feature("autodoc", "1");
        %extend{
            std::string DumpToString() {
            std::stringstream s;
            self->Dump(s);
            return s.str();}
        };
		/****************** Get ******************/
		%feature("compactdefaultargs") Get;
		%feature("autodoc", "Returns the xyz.

Returns
-------
gp_XYZ
") Get;
		gp_XYZ Get();

		/****************** GetID ******************/
		%feature("compactdefaultargs") GetID;
		%feature("autodoc", "This method is used in implementation of id().

Returns
-------
Standard_GUID
") GetID;
		static const Standard_GUID & GetID();

		/****************** ID ******************/
		%feature("compactdefaultargs") ID;
		%feature("autodoc", "Returns the id of tobj_txyz attribute.

Returns
-------
Standard_GUID
") ID;
		const Standard_GUID & ID();

		/****************** NewEmpty ******************/
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "Returns an new empty tobj_txyz attribute. it is used by the copy algorithm.

Returns
-------
opencascade::handle<TDF_Attribute>
") NewEmpty;
		opencascade::handle<TDF_Attribute> NewEmpty();

		/****************** Paste ******************/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "This method is used when copying an attribute from a source structure into a target structure.

Parameters
----------
theInto: TDF_Attribute
theRT: TDF_RelocationTable

Returns
-------
None
") Paste;
		void Paste(const opencascade::handle<TDF_Attribute> & theInto, const opencascade::handle<TDF_RelocationTable> & theRT);

		/****************** Restore ******************/
		%feature("compactdefaultargs") Restore;
		%feature("autodoc", "Restores the backuped contents from <thewith> into this one. it is used when aborting a transaction.

Parameters
----------
theWith: TDF_Attribute

Returns
-------
None
") Restore;
		void Restore(const opencascade::handle<TDF_Attribute> & theWith);

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "Creates attribute and sets the xyz.

Parameters
----------
theLabel: TDF_Label
theXYZ: gp_XYZ

Returns
-------
opencascade::handle<TObj_TXYZ>
") Set;
		static opencascade::handle<TObj_TXYZ> Set(const TDF_Label & theLabel, const gp_XYZ & theXYZ);

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "Sets the xyz.

Parameters
----------
theXYZ: gp_XYZ

Returns
-------
None
") Set;
		void Set(const gp_XYZ & theXYZ);

};


%make_alias(TObj_TXYZ)

%extend TObj_TXYZ {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************
* class TObj_LabelIterator *
***************************/
%nodefaultctor TObj_LabelIterator;
class TObj_LabelIterator : public TObj_ObjectIterator {
	public:
		/****************** LabelValue ******************/
		%feature("compactdefaultargs") LabelValue;
		%feature("autodoc", "Returns the label of the current item.

Returns
-------
TDF_Label
") LabelValue;
		const TDF_Label & LabelValue();

		/****************** More ******************/
		%feature("compactdefaultargs") More;
		%feature("autodoc", "Returns true if there is a current item in the iteration.

Returns
-------
bool
") More;
		virtual Standard_Boolean More();

		/****************** Next ******************/
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "Move to the next item.

Returns
-------
None
") Next;
		virtual void Next();

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Returns the current item.

Returns
-------
opencascade::handle<TObj_Object>
") Value;
		virtual opencascade::handle<TObj_Object> Value();

};


%make_alias(TObj_LabelIterator)

%extend TObj_LabelIterator {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************
* class TObj_ModelIterator *
***************************/
class TObj_ModelIterator : public TObj_ObjectIterator {
	public:
		/****************** TObj_ModelIterator ******************/
		%feature("compactdefaultargs") TObj_ModelIterator;
		%feature("autodoc", "/** * constructor */ creates iterator and initialize it by model`s label.

Parameters
----------
theModel: TObj_Model

Returns
-------
None
") TObj_ModelIterator;
		 TObj_ModelIterator(const opencascade::handle<TObj_Model> & theModel);

		/****************** More ******************/
		%feature("compactdefaultargs") More;
		%feature("autodoc", "Returns true if iteration is not finished and method value() will give the object.

Returns
-------
bool
") More;
		virtual Standard_Boolean More();

		/****************** Next ******************/
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "Iterates to the next object.

Returns
-------
None
") Next;
		virtual void Next();

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Returns current object (or mainobj of model if iteration has finished).

Returns
-------
opencascade::handle<TObj_Object>
") Value;
		virtual opencascade::handle<TObj_Object> Value();

};


%make_alias(TObj_ModelIterator)

%extend TObj_ModelIterator {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************
* class TObj_Partition *
***********************/
%nodefaultctor TObj_Partition;
class TObj_Partition : public TObj_Object {
	public:
		/****************** AfterRetrieval ******************/
		%feature("compactdefaultargs") AfterRetrieval;
		%feature("autodoc", "Preforms updating the links and dependances of the object which are not stored in persistence. does not register the partition name.

Returns
-------
None
") AfterRetrieval;
		virtual void AfterRetrieval();

		/****************** Create ******************/
		%feature("compactdefaultargs") Create;
		%feature("autodoc", "Creates a new partition on given label.

Parameters
----------
theLabel: TDF_Label

Returns
-------
opencascade::handle<TObj_Partition>
") Create;
		static opencascade::handle<TObj_Partition> Create(const TDF_Label & theLabel);

		/****************** GetLastIndex ******************/
		%feature("compactdefaultargs") GetLastIndex;
		%feature("autodoc", "Return last index in partition (reserved);.

Returns
-------
int
") GetLastIndex;
		Standard_Integer GetLastIndex();

		/****************** GetNamePrefix ******************/
		%feature("compactdefaultargs") GetNamePrefix;
		%feature("autodoc", "Returns prefix for names of the objects in partition.

Returns
-------
opencascade::handle<TCollection_HExtendedString>
") GetNamePrefix;
		opencascade::handle<TCollection_HExtendedString> GetNamePrefix();

		/****************** GetNewName ******************/
		%feature("compactdefaultargs") GetNewName;
		%feature("autodoc", "Generates and returns name for new object in partition. if theistochangecount is true partition icrease own counter to generate new name next time starting from new counter value.

Parameters
----------
theIsToChangeCount: bool,optional
	default value is Standard_True

Returns
-------
opencascade::handle<TCollection_HExtendedString>
") GetNewName;
		opencascade::handle<TCollection_HExtendedString> GetNewName(const Standard_Boolean theIsToChangeCount = Standard_True);

		/****************** GetPartition ******************/
		%feature("compactdefaultargs") GetPartition;
		%feature("autodoc", "Returns the partition in which object is stored. null partition returned if not found.

Parameters
----------
theObject: TObj_Object

Returns
-------
opencascade::handle<TObj_Partition>
") GetPartition;
		static opencascade::handle<TObj_Partition> GetPartition(const opencascade::handle<TObj_Object> & theObject);

		/****************** NewLabel ******************/
		%feature("compactdefaultargs") NewLabel;
		%feature("autodoc", "Creates and returns label for new object in partition.

Returns
-------
TDF_Label
") NewLabel;
		TDF_Label NewLabel();

		/****************** SetLastIndex ******************/
		%feature("compactdefaultargs") SetLastIndex;
		%feature("autodoc", "Sets last index in partition (reserved);.

Parameters
----------
theIndex: int

Returns
-------
None
") SetLastIndex;
		void SetLastIndex(const Standard_Integer theIndex);

		/****************** SetName ******************/
		%feature("compactdefaultargs") SetName;
		%feature("autodoc", "Sets name of the object. partition does not check unique of own name.

Parameters
----------
theName: TCollection_HExtendedString

Returns
-------
bool
") SetName;
		virtual Standard_Boolean SetName(const opencascade::handle<TCollection_HExtendedString> & theName);

		/****************** SetNamePrefix ******************/
		%feature("compactdefaultargs") SetNamePrefix;
		%feature("autodoc", "Sets prefix for names of the objects in partition.

Parameters
----------
thePrefix: TCollection_HExtendedString

Returns
-------
None
") SetNamePrefix;
		void SetNamePrefix(const opencascade::handle<TCollection_HExtendedString> & thePrefix);

		/****************** Update ******************/
		%feature("compactdefaultargs") Update;
		%feature("autodoc", "Does nothing in the partition.

Returns
-------
bool
") Update;
		virtual Standard_Boolean Update();

};


%make_alias(TObj_Partition)

%extend TObj_Partition {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************
* class TObj_SequenceIterator *
******************************/
class TObj_SequenceIterator : public TObj_ObjectIterator {
	public:
		/****************** TObj_SequenceIterator ******************/
		%feature("compactdefaultargs") TObj_SequenceIterator;
		%feature("autodoc", "Creates an iterator an initialize it by sequence of objects.

Parameters
----------
theObjects: TObj_HSequenceOfObject
theType: Standard_Type,optional
	default value is NULL

Returns
-------
None
") TObj_SequenceIterator;
		 TObj_SequenceIterator(const opencascade::handle<TObj_HSequenceOfObject> & theObjects, const opencascade::handle<Standard_Type> & theType = NULL);

		/****************** More ******************/
		%feature("compactdefaultargs") More;
		%feature("autodoc", "Returns true if there is a current item in the iteration.

Returns
-------
bool
") More;
		virtual Standard_Boolean More();

		/****************** Next ******************/
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "Move to the next item.

Returns
-------
None
") Next;
		virtual void Next();

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Returns the current item.

Returns
-------
opencascade::handle<TObj_Object>
") Value;
		virtual opencascade::handle<TObj_Object> Value();

};


%make_alias(TObj_SequenceIterator)

%extend TObj_SequenceIterator {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************
* class TObj_HiddenPartition *
*****************************/
class TObj_HiddenPartition : public TObj_Partition {
	public:
		/****************** TObj_HiddenPartition ******************/
		%feature("compactdefaultargs") TObj_HiddenPartition;
		%feature("autodoc", "Constructor.

Parameters
----------
theLabel: TDF_Label

Returns
-------
None
") TObj_HiddenPartition;
		 TObj_HiddenPartition(const TDF_Label & theLabel);

		/****************** GetTypeFlags ******************/
		%feature("compactdefaultargs") GetTypeFlags;
		%feature("autodoc", "Returns all flags of father except visible.

Returns
-------
int
") GetTypeFlags;
		virtual Standard_Integer GetTypeFlags();

};


%make_alias(TObj_HiddenPartition)

%extend TObj_HiddenPartition {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************
* class TObj_OcafObjectIterator *
********************************/
class TObj_OcafObjectIterator : public TObj_LabelIterator {
	public:
		/****************** TObj_OcafObjectIterator ******************/
		%feature("compactdefaultargs") TObj_OcafObjectIterator;
		%feature("autodoc", "Creates the iterator on objects in the sub labels of thelabel thetype narrows a variety of iterated objects.

Parameters
----------
theLabel: TDF_Label
theType: Standard_Type,optional
	default value is NULL
theRecursive: bool,optional
	default value is Standard_False

Returns
-------
None
") TObj_OcafObjectIterator;
		 TObj_OcafObjectIterator(const TDF_Label & theLabel, const opencascade::handle<Standard_Type> & theType = NULL, const Standard_Boolean theRecursive = Standard_False);

};


%make_alias(TObj_OcafObjectIterator)

%extend TObj_OcafObjectIterator {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************
* class TObj_ReferenceIterator *
*******************************/
class TObj_ReferenceIterator : public TObj_LabelIterator {
	public:
		/****************** TObj_ReferenceIterator ******************/
		%feature("compactdefaultargs") TObj_ReferenceIterator;
		%feature("autodoc", "Creates the iterator on references in partition thetype narrows a variety of iterated objects.

Parameters
----------
theLabel: TDF_Label
theType: Standard_Type,optional
	default value is NULL
theRecursive: bool,optional
	default value is Standard_True

Returns
-------
None
") TObj_ReferenceIterator;
		 TObj_ReferenceIterator(const TDF_Label & theLabel, const opencascade::handle<Standard_Type> & theType = NULL, const Standard_Boolean theRecursive = Standard_True);

};


%make_alias(TObj_ReferenceIterator)

%extend TObj_ReferenceIterator {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/* harray1 classes */
/* harray2 classes */
/* hsequence classes */
class TObj_HSequenceOfObject : public  TObj_SequenceOfObject, public Standard_Transient {
  public:
    TObj_HSequenceOfObject();
    TObj_HSequenceOfObject(const  TObj_SequenceOfObject& theOther);
    const  TObj_SequenceOfObject& Sequence();
    void Append (const  TObj_SequenceOfObject::value_type& theItem);
    void Append ( TObj_SequenceOfObject& theSequence);
     TObj_SequenceOfObject& ChangeSequence();
};
%make_alias(TObj_HSequenceOfObject)


