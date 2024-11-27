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
%define TOBJDOCSTRING
"TObj module, see official documentation at
https://dev.opencascade.org/doc/occt-7.8.0/refman/html/package_tobj.html"
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
%include ../common/EnumTemplates.i
%include ../common/Operators.i
%include ../common/OccHandle.i
%include ../common/IOStream.i
%include ../common/ArrayMacros.i


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
from enum import IntEnum
from OCC.Core.Exception import *
};

/* public enums */
enum TObj_DeletingMode {
	TObj_FreeOnly = 0,
	TObj_KeepDepending = 1,
	TObj_Forced = 2,
};

/* end public enums declaration */

/* python proxy classes for enums */
%pythoncode {

class TObj_DeletingMode(IntEnum):
	TObj_FreeOnly = 0
	TObj_KeepDepending = 1
	TObj_Forced = 2
TObj_FreeOnly = TObj_DeletingMode.TObj_FreeOnly
TObj_KeepDepending = TObj_DeletingMode.TObj_KeepDepending
TObj_Forced = TObj_DeletingMode.TObj_Forced
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

%extend NCollection_Sequence<opencascade::handle<TObj_ObjectIterator>> {
    %pythoncode {
    def __len__(self):
        return self.Size()
    }
};
%template(TObj_SequenceOfObject) NCollection_Sequence<opencascade::handle<TObj_Object>>;

%extend NCollection_Sequence<opencascade::handle<TObj_Object>> {
    %pythoncode {
    def __len__(self):
        return self.Size()
    }
};
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
		/****** TObj_Application::CreateNewDocument ******/
		/****** md5 signature: 66c07fbb868e2d80d40d8dbc03c2c585 ******/
		%feature("compactdefaultargs") CreateNewDocument;
		%feature("autodoc", "
Parameters
----------
theDoc: TDocStd_Document
theFormat: str

Return
-------
bool

Description
-----------
Create the ocaf document from scratch.
") CreateNewDocument;
		virtual Standard_Boolean CreateNewDocument(opencascade::handle<TDocStd_Document> & theDoc, TCollection_ExtendedString theFormat);


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
		/****** TObj_Application::ErrorMessage ******/
		/****** md5 signature: a03611f142b478c30985cd3a78a49d6c ******/
		%feature("compactdefaultargs") ErrorMessage;
		%feature("autodoc", "
Parameters
----------
theMsg: str
theLevel: Message_Gravity

Return
-------
None

Description
-----------
Signal error during load or save default imiplementation is empty.
") ErrorMessage;
		virtual void ErrorMessage(TCollection_ExtendedString theMsg, const Message_Gravity theLevel);

		/****** TObj_Application::ErrorMessage ******/
		/****** md5 signature: 3dc6ec1416dc97db30a8ca8087e13790 ******/
		%feature("compactdefaultargs") ErrorMessage;
		%feature("autodoc", "
Parameters
----------
theMsg: str

Return
-------
None

Description
-----------
Signal error during load or save default imiplementation invoke previous declaration with 0.
") ErrorMessage;
		virtual void ErrorMessage(TCollection_ExtendedString theMsg);

		/****** TObj_Application::GetInstance ******/
		/****** md5 signature: b53344174e51d974cfc3c10987d85a58 ******/
		%feature("compactdefaultargs") GetInstance;
		%feature("autodoc", "Return
-------
opencascade::handle<TObj_Application>

Description
-----------
Returns static instance of the application.
") GetInstance;
		static opencascade::handle<TObj_Application> GetInstance();

		/****** TObj_Application::IsVerbose ******/
		/****** md5 signature: a6d755f3bc2925d0e87129fb67ebe8b2 ******/
		%feature("compactdefaultargs") IsVerbose;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns the verbose flag.
") IsVerbose;
		Standard_Boolean IsVerbose();

		/****** TObj_Application::LoadDocument ******/
		/****** md5 signature: 8a2556ff2fdb6a537d3831a48cc67499 ******/
		%feature("compactdefaultargs") LoadDocument;
		%feature("autodoc", "
Parameters
----------
theSourceFile: str
theTargetDoc: TDocStd_Document

Return
-------
bool

Description
-----------
Loading the ocaf document from a file.
") LoadDocument;
		virtual Standard_Boolean LoadDocument(TCollection_ExtendedString theSourceFile, opencascade::handle<TDocStd_Document> & theTargetDoc);

		/****** TObj_Application::LoadDocument ******/
		/****** md5 signature: 6198a02fdef7071ddc8d32deda295e03 ******/
		%feature("compactdefaultargs") LoadDocument;
		%feature("autodoc", "
Parameters
----------
theIStream: str
theTargetDoc: TDocStd_Document

Return
-------
bool

Description
-----------
Loading the ocaf document from a stream.
") LoadDocument;
		virtual Standard_Boolean LoadDocument(std::istream & theIStream, opencascade::handle<TDocStd_Document> & theTargetDoc);

		/****** TObj_Application::Messenger ******/
		/****** md5 signature: fe56be9196543a6602ef636ef1016498 ******/
		%feature("compactdefaultargs") Messenger;
		%feature("autodoc", "Return
-------
opencascade::handle<Message_Messenger>

Description
-----------
Returns reference to associated messenger handle.
") Messenger;
		opencascade::handle<Message_Messenger> & Messenger();

		/****** TObj_Application::ResourcesName ******/
		/****** md5 signature: 96f8731792cfcab6c0cf55cdc1a09a9b ******/
		%feature("compactdefaultargs") ResourcesName;
		%feature("autodoc", "Return
-------
str

Description
-----------
Return name of resource (i.e. 'tobj').
") ResourcesName;
		virtual Standard_CString ResourcesName();

		/****** TObj_Application::SaveDocument ******/
		/****** md5 signature: dcfedbeb5fa0e25c1797d36111fba7ba ******/
		%feature("compactdefaultargs") SaveDocument;
		%feature("autodoc", "
Parameters
----------
theSourceDoc: TDocStd_Document
theTargetFile: str

Return
-------
bool

Description
-----------
Saving the ocaf document to a file.
") SaveDocument;
		virtual Standard_Boolean SaveDocument(const opencascade::handle<TDocStd_Document> & theSourceDoc, TCollection_ExtendedString theTargetFile);

		/****** TObj_Application::SaveDocument ******/
		/****** md5 signature: 732e0f95697794910e7302feb84b3e76 ******/
		%feature("compactdefaultargs") SaveDocument;
		%feature("autodoc", "
Parameters
----------
theSourceDoc: TDocStd_Document

Return
-------
theOStream: Standard_OStream

Description
-----------
Saving the ocaf document to a stream.
") SaveDocument;
		virtual Standard_Boolean SaveDocument(const opencascade::handle<TDocStd_Document> & theSourceDoc, std::ostream &OutValue);

		/****** TObj_Application::SetVerbose ******/
		/****** md5 signature: ec07929ffcbc58b57cfe36e4754b10e9 ******/
		%feature("compactdefaultargs") SetVerbose;
		%feature("autodoc", "
Parameters
----------
isVerbose: bool

Return
-------
None

Description
-----------
Sets the verbose flag, meaning that load/save models should show cpu and elapsed times.
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
		/****** TObj_Assistant::BindModel ******/
		/****** md5 signature: 6f477e113371e5e806719c182ae06cbc ******/
		%feature("compactdefaultargs") BindModel;
		%feature("autodoc", "
Parameters
----------
theModel: TObj_Model

Return
-------
None

Description
-----------
Binds model to the map.
") BindModel;
		static void BindModel(const opencascade::handle<TObj_Model> & theModel);

		/****** TObj_Assistant::BindType ******/
		/****** md5 signature: 4c08d477bf36ab0aee13c610d61470b2 ******/
		%feature("compactdefaultargs") BindType;
		%feature("autodoc", "
Parameters
----------
theType: Standard_Type

Return
-------
int

Description
-----------
Binds standard_type to the map; returns index of bound type.
") BindType;
		static Standard_Integer BindType(const opencascade::handle<Standard_Type> & theType);

		/****** TObj_Assistant::ClearModelMap ******/
		/****** md5 signature: 3a94bcfdd1d70b146e8b656aace330d2 ******/
		%feature("compactdefaultargs") ClearModelMap;
		%feature("autodoc", "Return
-------
None

Description
-----------
Clears all records from the model map.
") ClearModelMap;
		static void ClearModelMap();

		/****** TObj_Assistant::ClearTypeMap ******/
		/****** md5 signature: 358b8d080d4641a68b886e03c4369828 ******/
		%feature("compactdefaultargs") ClearTypeMap;
		%feature("autodoc", "Return
-------
None

Description
-----------
Clears map of types.
") ClearTypeMap;
		static void ClearTypeMap();

		/****** TObj_Assistant::FindModel ******/
		/****** md5 signature: e92adf0596d1a4921ec125698f7e69a8 ******/
		%feature("compactdefaultargs") FindModel;
		%feature("autodoc", "
Parameters
----------
theName: str

Return
-------
opencascade::handle<TObj_Model>

Description
-----------
Finds model by name.
") FindModel;
		static opencascade::handle<TObj_Model> FindModel(Standard_CString theName);

		/****** TObj_Assistant::FindType ******/
		/****** md5 signature: b1e7bafac320a7941eacca004bbb32c3 ******/
		%feature("compactdefaultargs") FindType;
		%feature("autodoc", "
Parameters
----------
theTypeIndex: int

Return
-------
opencascade::handle<Standard_Type>

Description
-----------
Finds standard_type by index; returns null handle if not found.
") FindType;
		static opencascade::handle<Standard_Type> FindType(const Standard_Integer theTypeIndex);

		/****** TObj_Assistant::FindTypeIndex ******/
		/****** md5 signature: 7f781906b702ddcb5ba66a20b4714214 ******/
		%feature("compactdefaultargs") FindTypeIndex;
		%feature("autodoc", "
Parameters
----------
theType: Standard_Type

Return
-------
int

Description
-----------
Rinds index by standard_type; returns 0 if not found.
") FindTypeIndex;
		static Standard_Integer FindTypeIndex(const opencascade::handle<Standard_Type> & theType);

		/****** TObj_Assistant::GetAppVersion ******/
		/****** md5 signature: 4d6364b939641f7662174904b93eee4a ******/
		%feature("compactdefaultargs") GetAppVersion;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the version of application which wrote the currently read document. returns 0 if it has not been set yet for the current document.
") GetAppVersion;
		static Standard_Integer GetAppVersion();

		/****** TObj_Assistant::GetCurrentModel ******/
		/****** md5 signature: 851c776b5d53e414ee2805ddd9eb6268 ******/
		%feature("compactdefaultargs") GetCurrentModel;
		%feature("autodoc", "Return
-------
opencascade::handle<TObj_Model>

Description
-----------
Returns current model.
") GetCurrentModel;
		static opencascade::handle<TObj_Model> GetCurrentModel();

		/****** TObj_Assistant::SetCurrentModel ******/
		/****** md5 signature: 27a38fa83b881e2bf304d41c94878a3b ******/
		%feature("compactdefaultargs") SetCurrentModel;
		%feature("autodoc", "
Parameters
----------
theModel: TObj_Model

Return
-------
None

Description
-----------
Sets current model.
") SetCurrentModel;
		static void SetCurrentModel(const opencascade::handle<TObj_Model> & theModel);

		/****** TObj_Assistant::UnSetCurrentModel ******/
		/****** md5 signature: 5f55467c582753367c0695c6a12451ba ******/
		%feature("compactdefaultargs") UnSetCurrentModel;
		%feature("autodoc", "Return
-------
None

Description
-----------
Unsets current model.
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
		/****** TObj_CheckModel::TObj_CheckModel ******/
		/****** md5 signature: 39399dcf73c56a60e5bf685930b227ec ******/
		%feature("compactdefaultargs") TObj_CheckModel;
		%feature("autodoc", "
Parameters
----------
theModel: TObj_Model

Return
-------
None

Description
-----------
Initialize checker by model.
") TObj_CheckModel;
		 TObj_CheckModel(const opencascade::handle<TObj_Model> & theModel);

		/****** TObj_CheckModel::GetModel ******/
		/****** md5 signature: d25458857718fcb201a3a10d28b7d4ad ******/
		%feature("compactdefaultargs") GetModel;
		%feature("autodoc", "Return
-------
opencascade::handle<TObj_Model>

Description
-----------
Returns the checked model.
") GetModel;
		const opencascade::handle<TObj_Model> & GetModel();

		/****** TObj_CheckModel::IsToFix ******/
		/****** md5 signature: 5e37ed2ecd01c281c73e4a215c68991e ******/
		%feature("compactdefaultargs") IsToFix;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if it is allowed to fix inconsistencies.
") IsToFix;
		Standard_Boolean IsToFix();

		/****** TObj_CheckModel::Perform ******/
		/****** md5 signature: 13c494512ebd157b19de66d8b841f157 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Performs all checks. descendants should call parent method before doing own checks. this implementation checks ocaf references and back references between objects of the model. returns true if no inconsistencies found.
") Perform;
		virtual Standard_Boolean Perform();

		/****** TObj_CheckModel::SetToFix ******/
		/****** md5 signature: cb0188f8c8e5eca907778d591f1fcc74 ******/
		%feature("compactdefaultargs") SetToFix;
		%feature("autodoc", "
Parameters
----------
theToFix: bool

Return
-------
None

Description
-----------
Sets flag allowing fixing inconsistencies.
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
		/****** TObj_Model::AbortCommand ******/
		/****** md5 signature: db9eb1c6743c076841497d4515ae2d8a ******/
		%feature("compactdefaultargs") AbortCommand;
		%feature("autodoc", "Return
-------
None

Description
-----------
Abort the command transaction. do nothing if there is no command transaction open.
") AbortCommand;
		void AbortCommand();

		/****** TObj_Model::Close ******/
		/****** md5 signature: 413b77e104256091d7f6a8bf1c40b584 ******/
		%feature("compactdefaultargs") Close;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Close the model.
") Close;
		virtual Standard_Boolean Close();

		/****** TObj_Model::CloseDocument ******/
		/****** md5 signature: 9548869473e65a56f81cbd28c6cb6de4 ******/
		%feature("compactdefaultargs") CloseDocument;
		%feature("autodoc", "
Parameters
----------
theDoc: TDocStd_Document

Return
-------
None

Description
-----------
Close free ocaf document.
") CloseDocument;
		void CloseDocument(const opencascade::handle<TDocStd_Document> & theDoc);

		/****** TObj_Model::CommitCommand ******/
		/****** md5 signature: cbca680c396f43e2614479fb2ced0fcc ******/
		%feature("compactdefaultargs") CommitCommand;
		%feature("autodoc", "Return
-------
None

Description
-----------
Commit the command transaction. do nothing if there is no command transaction open.
") CommitCommand;
		void CommitCommand();

		/****** TObj_Model::CopyReferences ******/
		/****** md5 signature: f1b09f0d60c3e9bd5fef3d3fba8a08b9 ******/
		%feature("compactdefaultargs") CopyReferences;
		%feature("autodoc", "
Parameters
----------
theTarget: TObj_Model
theRelocTable: TDF_RelocationTable

Return
-------
None

Description
-----------
Copy references from me to the other.
") CopyReferences;
		void CopyReferences(const opencascade::handle<TObj_Model> & theTarget, const opencascade::handle<TDF_RelocationTable> & theRelocTable);

		/****** TObj_Model::FindObject ******/
		/****** md5 signature: 57738115f097cb4e64b42adab0f91f4b ******/
		%feature("compactdefaultargs") FindObject;
		%feature("autodoc", "
Parameters
----------
theName: TCollection_HExtendedString
theDictionary: TObj_TNameContainer

Return
-------
opencascade::handle<TObj_Object>

Description
-----------
Returns an object by given name (or null if not found).
") FindObject;
		virtual opencascade::handle<TObj_Object> FindObject(const opencascade::handle<TCollection_HExtendedString> & theName, const opencascade::handle<TObj_TNameContainer> & theDictionary);

		/****** TObj_Model::GetApplication ******/
		/****** md5 signature: a3b8ddf16da387ad7753074f0773f0fd ******/
		%feature("compactdefaultargs") GetApplication;
		%feature("autodoc", "Return
-------
opencascade::handle<TObj_Application>

Description
-----------
Returns handle to static instance of the relevant application class.
") GetApplication;
		virtual const opencascade::handle<TObj_Application> GetApplication();

		/****** TObj_Model::GetChecker ******/
		/****** md5 signature: fecdc79538fa51b21584a0857184ebd2 ******/
		%feature("compactdefaultargs") GetChecker;
		%feature("autodoc", "Return
-------
opencascade::handle<TObj_CheckModel>

Description
-----------
Returns the tool checking model consistency. descendant may redefine it to return its own tool.
") GetChecker;
		virtual opencascade::handle<TObj_CheckModel> GetChecker();

		/****** TObj_Model::GetChildren ******/
		/****** md5 signature: 58e5668ee23dabeae73edbf534324817 ******/
		%feature("compactdefaultargs") GetChildren;
		%feature("autodoc", "Return
-------
opencascade::handle<TObj_ObjectIterator>

Description
-----------
Returns an iterator on objects in the main partition.
") GetChildren;
		virtual opencascade::handle<TObj_ObjectIterator> GetChildren();

		/****** TObj_Model::GetDictionary ******/
		/****** md5 signature: 3e94bc2b20ff15d3bdd40ec3acadd79b ******/
		%feature("compactdefaultargs") GetDictionary;
		%feature("autodoc", "Return
-------
opencascade::handle<TObj_TNameContainer>

Description
-----------
Returns the map of names of the objects.
") GetDictionary;
		opencascade::handle<TObj_TNameContainer> GetDictionary();

		/****** TObj_Model::GetDocument ******/
		/****** md5 signature: 638e8a64fb8a1b19190e69bfce5a264e ******/
		%feature("compactdefaultargs") GetDocument;
		%feature("autodoc", "Return
-------
opencascade::handle<TDocStd_Document>

Description
-----------
Returns ocaf document of model.
") GetDocument;
		opencascade::handle<TDocStd_Document> GetDocument();

		/****** TObj_Model::GetDocumentModel ******/
		/****** md5 signature: 1dc8cae34af5b42ee8081e62cbe88242 ******/
		%feature("compactdefaultargs") GetDocumentModel;
		%feature("autodoc", "
Parameters
----------
theLabel: TDF_Label

Return
-------
opencascade::handle<TObj_Model>

Description
-----------
Returns model which contains a document with the label, or null handle if label is null.
") GetDocumentModel;
		static opencascade::handle<TObj_Model> GetDocumentModel(const TDF_Label & theLabel);

		/****** TObj_Model::GetFile ******/
		/****** md5 signature: 741fee9646d444a1d14ccda90a39e804 ******/
		%feature("compactdefaultargs") GetFile;
		%feature("autodoc", "Return
-------
opencascade::handle<TCollection_HExtendedString>

Description
-----------
Returns the full file name this model is to be saved to, or null if the model was not saved yet.
") GetFile;
		virtual opencascade::handle<TCollection_HExtendedString> GetFile();

		/****** TObj_Model::GetFormat ******/
		/****** md5 signature: e4e78e254c48e2fdfe3e980cb5bc547d ******/
		%feature("compactdefaultargs") GetFormat;
		%feature("autodoc", "Return
-------
TCollection_ExtendedString

Description
-----------
Returns the format for save/restore. this implementation returns 'binocaf'. the method should be redefined for those models that should use another format.
") GetFormat;
		virtual TCollection_ExtendedString GetFormat();

		/****** TObj_Model::GetFormatVersion ******/
		/****** md5 signature: c4d68879e42048f499bf2ed66a66697f ******/
		%feature("compactdefaultargs") GetFormatVersion;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the version of format stored in tobj file.
") GetFormatVersion;
		Standard_Integer GetFormatVersion();

		/****** TObj_Model::GetGUID ******/
		/****** md5 signature: 2e4ec7705c6889137d267052207a2d44 ******/
		%feature("compactdefaultargs") GetGUID;
		%feature("autodoc", "Return
-------
Standard_GUID

Description
-----------
Defines interface guid for tobj_model.
") GetGUID;
		virtual Standard_GUID GetGUID();

		/****** TObj_Model::GetLabel ******/
		/****** md5 signature: 5ab1f3863e9e6f51586f46622e4aeabe ******/
		%feature("compactdefaultargs") GetLabel;
		%feature("autodoc", "Return
-------
TDF_Label

Description
-----------
Returns ocaf label on which model data are stored.
") GetLabel;
		TDF_Label GetLabel();

		/****** TObj_Model::GetMainPartition ******/
		/****** md5 signature: 87be3343564b1b9feffbddce9cc0e194 ******/
		%feature("compactdefaultargs") GetMainPartition;
		%feature("autodoc", "Return
-------
opencascade::handle<TObj_Partition>

Description
-----------
Returns root object of model.
") GetMainPartition;
		opencascade::handle<TObj_Partition> GetMainPartition();

		/****** TObj_Model::GetModelName ******/
		/****** md5 signature: 1f23fd984199a8df51123c7670a0fcfb ******/
		%feature("compactdefaultargs") GetModelName;
		%feature("autodoc", "Return
-------
opencascade::handle<TCollection_HExtendedString>

Description
-----------
Returns the name of the model.
") GetModelName;
		virtual opencascade::handle<TCollection_HExtendedString> GetModelName();

		/****** TObj_Model::GetObjects ******/
		/****** md5 signature: 44ed7c407bf8f507e345e88084e98880 ******/
		%feature("compactdefaultargs") GetObjects;
		%feature("autodoc", "Return
-------
opencascade::handle<TObj_ObjectIterator>

Description
-----------
Returns an iterator on all objects in the model.
") GetObjects;
		virtual opencascade::handle<TObj_ObjectIterator> GetObjects();

		/****** TObj_Model::GetRoot ******/
		/****** md5 signature: 968ebe73886225a8d735f28edc7277a2 ******/
		%feature("compactdefaultargs") GetRoot;
		%feature("autodoc", "Return
-------
opencascade::handle<TObj_Object>

Description
-----------
Returns root object of model.
") GetRoot;
		virtual opencascade::handle<TObj_Object> GetRoot();

		/****** TObj_Model::HasOpenCommand ******/
		/****** md5 signature: dd69c57ebd4821e931afe0accf5d3235 ******/
		%feature("compactdefaultargs") HasOpenCommand;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if a command transaction is open starting, finishing the transaction.
") HasOpenCommand;
		Standard_Boolean HasOpenCommand();

		/****** TObj_Model::IsModified ******/
		/****** md5 signature: 5ce7de654801bdab4f554fb028ad99d5 ******/
		%feature("compactdefaultargs") IsModified;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Modification status.
") IsModified;
		virtual Standard_Boolean IsModified();

		/****** TObj_Model::IsRegisteredName ******/
		/****** md5 signature: 7f384ef103fda61fa0e4e4641faf1bcb ******/
		%feature("compactdefaultargs") IsRegisteredName;
		%feature("autodoc", "
Parameters
----------
theName: TCollection_HExtendedString
theDictionary: TObj_TNameContainer

Return
-------
bool

Description
-----------
Returns true is name is registered in the names map the input argument may be null handle, then model check in own global container.
") IsRegisteredName;
		Standard_Boolean IsRegisteredName(const opencascade::handle<TCollection_HExtendedString> & theName, const opencascade::handle<TObj_TNameContainer> & theDictionary);

		/****** TObj_Model::Load ******/
		/****** md5 signature: 71012ab36ad60691b764a409b2c58cf5 ******/
		%feature("compactdefaultargs") Load;
		%feature("autodoc", "
Parameters
----------
theFile: str

Return
-------
bool

Description
-----------
Load the ocaf model from a file. if the filename is empty or file does not exists, it just initializes model by empty data.
") Load;
		virtual Standard_Boolean Load(TCollection_ExtendedString theFile);

		/****** TObj_Model::Load ******/
		/****** md5 signature: 2ffa69b46ac088fac64bbec0e462308b ******/
		%feature("compactdefaultargs") Load;
		%feature("autodoc", "
Parameters
----------
theIStream: str

Return
-------
bool

Description
-----------
Load the ocaf model from a stream. if case of failure, it initializes the model by empty data.
") Load;
		virtual Standard_Boolean Load(std::istream & theIStream);

		/****** TObj_Model::Messenger ******/
		/****** md5 signature: 77a43db9d3d7b7c3ed75b149057d7c93 ******/
		%feature("compactdefaultargs") Messenger;
		%feature("autodoc", "Return
-------
opencascade::handle<Message_Messenger>

Description
-----------
Get messenger used for messages output (by default, the messenger from application is used).
") Messenger;
		opencascade::handle<Message_Messenger> Messenger();

		/****** TObj_Model::NewEmpty ******/
		/****** md5 signature: 6f85706d6bff3c9bace00dae763398a0 ******/
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "Return
-------
opencascade::handle<TObj_Model>

Description
-----------
This function have to create a new model with type like me.
") NewEmpty;
		virtual opencascade::handle<TObj_Model> NewEmpty();

		/****** TObj_Model::OpenCommand ******/
		/****** md5 signature: 0405f40d207a31d4e66e90d96d806dd1 ******/
		%feature("compactdefaultargs") OpenCommand;
		%feature("autodoc", "Return
-------
None

Description
-----------
Open a new command transaction.
") OpenCommand;
		void OpenCommand();

		/****** TObj_Model::Paste ******/
		/****** md5 signature: cbf806c47e2ef29c9d73f4131da52e66 ******/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "
Parameters
----------
theModel: TObj_Model
theRelocTable: TDF_RelocationTable (optional, default to 0)

Return
-------
bool

Description
-----------
Pastes me to the new model references will not be copied if thereloctable is not 0 if thereloctable is not null thereloctable is filled by objects.
") Paste;
		virtual Standard_Boolean Paste(opencascade::handle<TObj_Model > theModel, opencascade::handle<TDF_RelocationTable > theRelocTable = 0);

		/****** TObj_Model::RegisterName ******/
		/****** md5 signature: 2d1cada8d3a2478f6398b1f301f39e14 ******/
		%feature("compactdefaultargs") RegisterName;
		%feature("autodoc", "
Parameters
----------
theName: TCollection_HExtendedString
theLabel: TDF_Label
theDictionary: TObj_TNameContainer

Return
-------
None

Description
-----------
Register name in the map the input argument may be null handle, then model check in own global container.
") RegisterName;
		void RegisterName(const opencascade::handle<TCollection_HExtendedString> & theName, const TDF_Label & theLabel, const opencascade::handle<TObj_TNameContainer> & theDictionary);

		/****** TObj_Model::Save ******/
		/****** md5 signature: 12a2001f1e3273a99e2b2644d098fa70 ******/
		%feature("compactdefaultargs") Save;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Save the model to the same file.
") Save;
		Standard_Boolean Save();

		/****** TObj_Model::SaveAs ******/
		/****** md5 signature: 533db7e09bfa4b0b90e7366acbe74a6f ******/
		%feature("compactdefaultargs") SaveAs;
		%feature("autodoc", "
Parameters
----------
theFile: str

Return
-------
bool

Description
-----------
Save the model to a file.
") SaveAs;
		virtual Standard_Boolean SaveAs(TCollection_ExtendedString theFile);

		/****** TObj_Model::SaveAs ******/
		/****** md5 signature: f456613ed7926d7d36f3530cb69cdf3e ******/
		%feature("compactdefaultargs") SaveAs;
		%feature("autodoc", "
Parameters
----------

Return
-------
theOStream: Standard_OStream

Description
-----------
Save the model to a stream.
") SaveAs;
		virtual Standard_Boolean SaveAs(std::ostream &OutValue);

		/****** TObj_Model::SetLabel ******/
		/****** md5 signature: cc470d5ce9738c8709b266c2b6c1b90a ******/
		%feature("compactdefaultargs") SetLabel;
		%feature("autodoc", "
Parameters
----------
theLabel: TDF_Label

Return
-------
None

Description
-----------
Sets ocaf label on which model data are stored. used by persistence mechanism.
") SetLabel;
		void SetLabel(const TDF_Label & theLabel);

		/****** TObj_Model::SetMessenger ******/
		/****** md5 signature: 40401cd5d4068f0f7513825084c27c19 ******/
		%feature("compactdefaultargs") SetMessenger;
		%feature("autodoc", "
Parameters
----------
theMsgr: Message_Messenger

Return
-------
None

Description
-----------
Set messenger to use for messages output.
") SetMessenger;
		void SetMessenger(const opencascade::handle<Message_Messenger> & theMsgr);

		/****** TObj_Model::SetModified ******/
		/****** md5 signature: ac1f2a167b77e95d548d4d430640fa75 ******/
		%feature("compactdefaultargs") SetModified;
		%feature("autodoc", "
Parameters
----------
theModified: bool

Return
-------
None

Description
-----------
Sets modification status.
") SetModified;
		void SetModified(const Standard_Boolean theModified);

		/****** TObj_Model::SetNewName ******/
		/****** md5 signature: 4ee9fbc2348c268065d60bee26825205 ******/
		%feature("compactdefaultargs") SetNewName;
		%feature("autodoc", "
Parameters
----------
theObject: TObj_Object

Return
-------
None

Description
-----------
Sets new unique name for the object.
") SetNewName;
		static void SetNewName(const opencascade::handle<TObj_Object> & theObject);

		/****** TObj_Model::UnRegisterName ******/
		/****** md5 signature: 0f153974e9287d1d20c80bd34670ed35 ******/
		%feature("compactdefaultargs") UnRegisterName;
		%feature("autodoc", "
Parameters
----------
theName: TCollection_HExtendedString
theDictionary: TObj_TNameContainer

Return
-------
None

Description
-----------
Unregisters name from the map the input argument may be null handle, then model check in own global container.
") UnRegisterName;
		void UnRegisterName(const opencascade::handle<TCollection_HExtendedString> & theName, const opencascade::handle<TObj_TNameContainer> & theDictionary);

		/****** TObj_Model::Update ******/
		/****** md5 signature: 9538e94c343decb275b2f65bb11a4f6c ******/
		%feature("compactdefaultargs") Update;
		%feature("autodoc", "Return
-------
bool

Description
-----------
This method is called before activating this model.
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

/* python proxy classes for enums */
%pythoncode {

class TypeFlags(IntEnum):
	Visible = 1
Visible = TypeFlags.Visible

class ObjectState(IntEnum):
	ObjectState_Hidden = 1
	ObjectState_Saved = 2
	ObjectState_Imported = 4
	ObjectState_ImportedByFile = 8
	ObjectState_Ordered = 16
ObjectState_Hidden = ObjectState.ObjectState_Hidden
ObjectState_Saved = ObjectState.ObjectState_Saved
ObjectState_Imported = ObjectState.ObjectState_Imported
ObjectState_ImportedByFile = ObjectState.ObjectState_ImportedByFile
ObjectState_Ordered = ObjectState.ObjectState_Ordered
};
/* end python proxy for enums */

		/****** TObj_Object::AddBackReference ******/
		/****** md5 signature: 64aa771ada20540e70a430d82f6b87fb ******/
		%feature("compactdefaultargs") AddBackReference;
		%feature("autodoc", "
Parameters
----------
theObject: TObj_Object

Return
-------
None

Description
-----------
Registers another object as being dependent on this one. stores back references under sublabel 2 (purely transient data, not subject to persistency).
") AddBackReference;
		virtual void AddBackReference(const opencascade::handle<TObj_Object> & theObject);

		/****** TObj_Object::AfterRetrieval ******/
		/****** md5 signature: 9432a7bda4a565e50e735ba186488263 ******/
		%feature("compactdefaultargs") AfterRetrieval;
		%feature("autodoc", "Return
-------
None

Description
-----------
Performs updating the links and dependances of the object which are not stored in persistence. should be redefined if necessary.
") AfterRetrieval;
		virtual void AfterRetrieval();

		/****** TObj_Object::BeforeForgetReference ******/
		/****** md5 signature: 8eaf15685b1adf0d9405a3c9b7422bbc ******/
		%feature("compactdefaultargs") BeforeForgetReference;
		%feature("autodoc", "
Parameters
----------
&: TDF_Label

Return
-------
None

Description
-----------
Invokes from tobj_treference::beforeforget(). thelabel - label on that reference become removed default implementation is empty.
") BeforeForgetReference;
		virtual void BeforeForgetReference(const TDF_Label &);

		/****** TObj_Object::BeforeStoring ******/
		/****** md5 signature: 488bb473c5aebeae45654fc7c70f010e ******/
		%feature("compactdefaultargs") BeforeStoring;
		%feature("autodoc", "Return
-------
None

Description
-----------
Performs storing the objects transient fields in ocaf document which were outside transaction mechanism. default implementation does nothing.
") BeforeStoring;
		virtual void BeforeStoring();

		/****** TObj_Object::CanDetach ******/
		/****** md5 signature: 2f3782ec79bf0e89e6d8ca3e6212285c ******/
		%feature("compactdefaultargs") CanDetach;
		%feature("autodoc", "
Parameters
----------
theMode: TObj_DeletingMode (optional, default to TObj_FreeOnly)

Return
-------
bool

Description
-----------
Checks if object can be detached with specified mode.
") CanDetach;
		virtual Standard_Boolean CanDetach(const TObj_DeletingMode theMode = TObj_FreeOnly);

		/****** TObj_Object::CanRemoveReference ******/
		/****** md5 signature: a94340f01cf214f7b81795e782a0c6d0 ******/
		%feature("compactdefaultargs") CanRemoveReference;
		%feature("autodoc", "
Parameters
----------
theObject: TObj_Object

Return
-------
bool

Description
-----------
Returns true if the referred object theobject can be deleted without deletion of this object. default implementation does nothing and returns false.
") CanRemoveReference;
		virtual Standard_Boolean CanRemoveReference(const opencascade::handle<TObj_Object> & theObject);

		/****** TObj_Object::ClearBackReferences ******/
		/****** md5 signature: db983d4f2ea23562ee8aea96b3acdf23 ******/
		%feature("compactdefaultargs") ClearBackReferences;
		%feature("autodoc", "Return
-------
None

Description
-----------
The default implementation just clear the back references container.
") ClearBackReferences;
		virtual void ClearBackReferences();

		/****** TObj_Object::ClearFlags ******/
		/****** md5 signature: 541c9d5154c7afaa62eb8ba2740ebe75 ******/
		%feature("compactdefaultargs") ClearFlags;
		%feature("autodoc", "
Parameters
----------
theMask: int (optional, default to ~0)

Return
-------
None

Description
-----------
Clears flags by the mask.
") ClearFlags;
		void ClearFlags(const Standard_Integer theMask = ~0);

		/****** TObj_Object::Clone ******/
		/****** md5 signature: 4d3e1f9e7709184411e95abee3db3285 ******/
		%feature("compactdefaultargs") Clone;
		%feature("autodoc", "
Parameters
----------
theTargetLabel: TDF_Label
theRelocTable: TDF_RelocationTable (optional, default to 0)

Return
-------
opencascade::handle<TObj_Object>

Description
-----------
Copy me to other label thetargetlabel new object will not have all the reference that has me. coping object with data and childs, but change name by adding string '_copy' as result return handle of new object (null handle is something wrong) note: backreferences not coping. after cloning all objects it is necessary to call copy references with the same relocation table.
") Clone;
		virtual opencascade::handle<TObj_Object> Clone(const TDF_Label & theTargetLabel, opencascade::handle<TDF_RelocationTable > theRelocTable = 0);

		/****** TObj_Object::CopyChildren ******/
		/****** md5 signature: 94136ac341e957983a87f40509805b9f ******/
		%feature("compactdefaultargs") CopyChildren;
		%feature("autodoc", "
Parameters
----------
theTargetLabel: TDF_Label
theRelocTable: TDF_RelocationTable

Return
-------
None

Description
-----------
Coping the children from source label to the target.
") CopyChildren;
		virtual void CopyChildren(TDF_Label & theTargetLabel, const opencascade::handle<TDF_RelocationTable> & theRelocTable);

		/****** TObj_Object::CopyReferences ******/
		/****** md5 signature: 29bc202348b3cfc6858f80fa0e782066 ******/
		%feature("compactdefaultargs") CopyReferences;
		%feature("autodoc", "
Parameters
----------
theTargetObject: TObj_Object
theRelocTable: TDF_RelocationTable

Return
-------
None

Description
-----------
Coping the references. return standard_false is target object is different type.
") CopyReferences;
		virtual void CopyReferences(const opencascade::handle<TObj_Object> & theTargetObject, const opencascade::handle<TDF_RelocationTable> & theRelocTable);

		/****** TObj_Object::Detach ******/
		/****** md5 signature: ef914fbcc4987f7887b48eac4fa01764 ******/
		%feature("compactdefaultargs") Detach;
		%feature("autodoc", "
Parameters
----------
theMode: TObj_DeletingMode (optional, default to TObj_FreeOnly)

Return
-------
bool

Description
-----------
Deletes the object from the model. the dependent objects are either deleted or modified when possible (see description of tobj_deletingmode enumeration for more details) returns true if deletion was successful. checks if object can be deleted. should be redefined for each specific kind of object.
") Detach;
		virtual Standard_Boolean Detach(const TObj_DeletingMode theMode = TObj_FreeOnly);

		/****** TObj_Object::Detach ******/
		/****** md5 signature: f0c9138d15bd2cb29790cadf9f5c972d ******/
		%feature("compactdefaultargs") Detach;
		%feature("autodoc", "
Parameters
----------
theLabel: TDF_Label
theMode: TObj_DeletingMode (optional, default to TObj_FreeOnly)

Return
-------
bool

Description
-----------
Deletes the object from the label. checks if object can be deleted. finds object on the label and detaches it by calling previous method. returns true if there is no object on the label after detaching.
") Detach;
		static Standard_Boolean Detach(const TDF_Label & theLabel, const TObj_DeletingMode theMode = TObj_FreeOnly);

		/****** TObj_Object::GetBackReferences ******/
		/****** md5 signature: 3e183cb7f37d2b6bff8cad6e30d26852 ******/
		%feature("compactdefaultargs") GetBackReferences;
		%feature("autodoc", "
Parameters
----------
theType: Standard_Type (optional, default to NULL)

Return
-------
opencascade::handle<TObj_ObjectIterator>

Description
-----------
Returns iterator for the objects which depend on this one. these referring objects may belong to other models. thetype narrows a variety of iterated objects.
") GetBackReferences;
		virtual opencascade::handle<TObj_ObjectIterator> GetBackReferences(const opencascade::handle<Standard_Type> & theType = NULL);

		/****** TObj_Object::GetBadReference ******/
		/****** md5 signature: 29ee3c712ec4008e385e24a4ab449d98 ******/
		%feature("compactdefaultargs") GetBadReference;
		%feature("autodoc", "
Parameters
----------
theRoot: TDF_Label
theBadReference: TDF_Label

Return
-------
bool

Description
-----------
Return true if this refers to the model theroot belongs to and a referred label is not a descendant of theroot. in this case thebadreference returns the currently referred label.
") GetBadReference;
		virtual Standard_Boolean GetBadReference(const TDF_Label & theRoot, TDF_Label & theBadReference);

		/****** TObj_Object::GetChildLabel ******/
		/****** md5 signature: 030f3b57530a452d6fb4e66a46b049fa ******/
		%feature("compactdefaultargs") GetChildLabel;
		%feature("autodoc", "Return
-------
TDF_Label

Description
-----------
Returns the label under which children are stored.
") GetChildLabel;
		TDF_Label GetChildLabel();

		/****** TObj_Object::GetChildren ******/
		/****** md5 signature: 27c72b31816e84c434fb10ecea956811 ******/
		%feature("compactdefaultargs") GetChildren;
		%feature("autodoc", "
Parameters
----------
theType: Standard_Type (optional, default to NULL)

Return
-------
opencascade::handle<TObj_ObjectIterator>

Description
-----------
Returns iterator for the child objects. this method provides tree-like view of the objects hierarchy. the references to other objects are not considered as children. thetype narrows a variety of iterated objects the default implementation search for children on 1 sublavel of the children sub label.
") GetChildren;
		virtual opencascade::handle<TObj_ObjectIterator> GetChildren(const opencascade::handle<Standard_Type> & theType = NULL);

		/****** TObj_Object::GetDataLabel ******/
		/****** md5 signature: 5181dba1ab890a3d4f42758cef9ab426 ******/
		%feature("compactdefaultargs") GetDataLabel;
		%feature("autodoc", "Return
-------
TDF_Label

Description
-----------
Returns the label which is the root for data ocaf sub-tree.
") GetDataLabel;
		TDF_Label GetDataLabel();

		/****** TObj_Object::GetDictionary ******/
		/****** md5 signature: f248df60e037e02784000e7bf3b48e89 ******/
		%feature("compactdefaultargs") GetDictionary;
		%feature("autodoc", "Return
-------
opencascade::handle<TObj_TNameContainer>

Description
-----------
Returns the map of names of the objects default implementation returns global dictionary of the model.
") GetDictionary;
		virtual opencascade::handle<TObj_TNameContainer> GetDictionary();

		/****** TObj_Object::GetFatherObject ******/
		/****** md5 signature: c9bedb103c74b332cfd536ba80b66e5f ******/
		%feature("compactdefaultargs") GetFatherObject;
		%feature("autodoc", "
Parameters
----------
theType: Standard_Type (optional, default to NULL)

Return
-------
opencascade::handle<TObj_Object>

Description
-----------
Returns the father object, which may be null thetype gives type of father object to search.
") GetFatherObject;
		opencascade::handle<TObj_Object> GetFatherObject(const opencascade::handle<Standard_Type> & theType = NULL);

		/****** TObj_Object::GetFlags ******/
		/****** md5 signature: 38653d26e8e65805738b7154ff29aed8 ******/
		%feature("compactdefaultargs") GetFlags;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns mask of seted flags.
") GetFlags;
		Standard_Integer GetFlags();

		/****** TObj_Object::GetLabel ******/
		/****** md5 signature: b7ae9617d4db4ef8a9995ea610f01207 ******/
		%feature("compactdefaultargs") GetLabel;
		%feature("autodoc", "Return
-------
TDF_Label

Description
-----------
Returns the ocaf label on which object`s data are stored.
") GetLabel;
		TDF_Label GetLabel();

		/****** TObj_Object::GetModel ******/
		/****** md5 signature: 30fa7d635f757601f5d651ee57343bbd ******/
		%feature("compactdefaultargs") GetModel;
		%feature("autodoc", "Return
-------
opencascade::handle<TObj_Model>

Description
-----------
Returns the model to which the object belongs.
") GetModel;
		virtual opencascade::handle<TObj_Model> GetModel();

		/****** TObj_Object::GetName ******/
		/****** md5 signature: 7a84cc055abefa23b746fd62d5a7af5c ******/
		%feature("compactdefaultargs") GetName;
		%feature("autodoc", "Return
-------
opencascade::handle<TCollection_HExtendedString>

Description
-----------
Returns the name of the object (empty string if object has no name).
") GetName;
		virtual opencascade::handle<TCollection_HExtendedString> GetName();

		/****** TObj_Object::GetName ******/
		/****** md5 signature: ded8d72e7982c4584ae8f23745771666 ******/
		%feature("compactdefaultargs") GetName;
		%feature("autodoc", "
Parameters
----------
theName: str

Return
-------
bool

Description
-----------
Returns the standard_true is object has name and returns name to thename.
") GetName;
		Standard_Boolean GetName(TCollection_ExtendedString & theName);

		/****** TObj_Object::GetName ******/
		/****** md5 signature: 0946f8902cc7a5a26d04a92c936f9e88 ******/
		%feature("compactdefaultargs") GetName;
		%feature("autodoc", "
Parameters
----------
theName: str

Return
-------
bool

Description
-----------
Returns the standard_true is object has name and returns name to thename.
") GetName;
		Standard_Boolean GetName(TCollection_AsciiString & theName);

		/****** TObj_Object::GetNameForClone ******/
		/****** md5 signature: 3ff098e28a1715eacdc5089c767945c9 ******/
		%feature("compactdefaultargs") GetNameForClone;
		%feature("autodoc", "
Parameters
----------
&: TObj_Object

Return
-------
opencascade::handle<TCollection_HExtendedString>

Description
-----------
Returns name for copy default implementation returns the same name.
") GetNameForClone;
		virtual opencascade::handle<TCollection_HExtendedString> GetNameForClone(const opencascade::handle<TObj_Object > &);

		/****** TObj_Object::GetObj ******/
		/****** md5 signature: fc45832e63c78e31a312d2584bd1b74b ******/
		%feature("compactdefaultargs") GetObj;
		%feature("autodoc", "
Parameters
----------
theLabel: TDF_Label
theResult: TObj_Object
isSuper: bool (optional, default to Standard_False)

Return
-------
bool

Description
-----------
Returns the object attached to a given label. returns false if no object of type tobj_object is stored on the specified label. if issuper is true tries to find on the super labels.
") GetObj;
		static Standard_Boolean GetObj(const TDF_Label & theLabel, opencascade::handle<TObj_Object> & theResult, const Standard_Boolean isSuper = Standard_False);

		/****** TObj_Object::GetOrder ******/
		/****** md5 signature: 5aab3f1cde1c2f11047c1b86b05c2bd6 ******/
		%feature("compactdefaultargs") GetOrder;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns order of object (or tag of their label if order is not initialised).
") GetOrder;
		virtual Standard_Integer GetOrder();

		/****** TObj_Object::GetReferenceLabel ******/
		/****** md5 signature: 5f490bbe9920d957d97c1febc778ae9f ******/
		%feature("compactdefaultargs") GetReferenceLabel;
		%feature("autodoc", "Return
-------
TDF_Label

Description
-----------
Returns the label which is the root for reference ocaf sub-tree.
") GetReferenceLabel;
		TDF_Label GetReferenceLabel();

		/****** TObj_Object::GetReferences ******/
		/****** md5 signature: 649181abc5f0bfd80d3fd3963166901d ******/
		%feature("compactdefaultargs") GetReferences;
		%feature("autodoc", "
Parameters
----------
theType: Standard_Type (optional, default to NULL)

Return
-------
opencascade::handle<TObj_ObjectIterator>

Description
-----------
Returns an iterator containing objects that compose the this one thetype narrows a variety of iterated objects.
") GetReferences;
		virtual opencascade::handle<TObj_ObjectIterator> GetReferences(const opencascade::handle<Standard_Type> & theType = NULL);

		/****** TObj_Object::GetTypeFlags ******/
		/****** md5 signature: d2170fe93320a164ab89a2ddecc55009 ******/
		%feature("compactdefaultargs") GetTypeFlags;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns flags (bitmask) that define properties of objects of that type by default returns flag visible.
") GetTypeFlags;
		virtual Standard_Integer GetTypeFlags();

		/****** TObj_Object::HasBackReferences ******/
		/****** md5 signature: 0a45fd14f1152310725b0d9b3e69ac78 ******/
		%feature("compactdefaultargs") HasBackReferences;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if object has 1 or more back references.
") HasBackReferences;
		Standard_Boolean HasBackReferences();

		/****** TObj_Object::HasModifications ******/
		/****** md5 signature: 7fabc8d5b945eb96e5ea2a0e8f0d4be4 ******/
		%feature("compactdefaultargs") HasModifications;
		%feature("autodoc", "Return
-------
bool

Description
-----------
/** * public methods to check modifications of the object since last commit */ returns true if object attributes or or his children were modified in the current open transaction.
") HasModifications;
		Standard_Boolean HasModifications();

		/****** TObj_Object::HasReference ******/
		/****** md5 signature: e8677deafeb1a27e87cdc3d9ba839b8d ******/
		%feature("compactdefaultargs") HasReference;
		%feature("autodoc", "
Parameters
----------
theObject: TObj_Object

Return
-------
bool

Description
-----------
Returns true if object has reference to indicated object.
") HasReference;
		virtual Standard_Boolean HasReference(const opencascade::handle<TObj_Object> & theObject);

		/****** TObj_Object::IsAlive ******/
		/****** md5 signature: 68953950fdbb6213c244979fcec8e757 ******/
		%feature("compactdefaultargs") IsAlive;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Checks that object alive in model default implementation checks that object has tobject attribute at own label.
") IsAlive;
		virtual Standard_Boolean IsAlive();

		/****** TObj_Object::RelocateReferences ******/
		/****** md5 signature: 22cdb7815f8ab5309a8abf1d31e8596f ******/
		%feature("compactdefaultargs") RelocateReferences;
		%feature("autodoc", "
Parameters
----------
theFromRoot: TDF_Label
theToRoot: TDF_Label
theUpdateBackRefs: bool (optional, default to Standard_True)

Return
-------
bool

Description
-----------
Make that each reference pointing to a descendant label of thefromroot to point to an equivalent label under thetoroot. return false if a resulting reference does not point to an tobj_object example: a referred object label = 0:3:24:7:2:7 thefromroot = 0:3:24 thetoroot = 0:2 a new referred label = 0:2:7:2:7.
") RelocateReferences;
		virtual Standard_Boolean RelocateReferences(const TDF_Label & theFromRoot, const TDF_Label & theToRoot, const Standard_Boolean theUpdateBackRefs = Standard_True);

		/****** TObj_Object::RemoveAllReferences ******/
		/****** md5 signature: 4fd930fde27f64e3079598fda0c1f72e ******/
		%feature("compactdefaultargs") RemoveAllReferences;
		%feature("autodoc", "Return
-------
None

Description
-----------
Remove all references to other objects, by removing all reference attributes.
") RemoveAllReferences;
		virtual void RemoveAllReferences();

		/****** TObj_Object::RemoveBackReference ******/
		/****** md5 signature: d2b2f131b5b148de5e6165eb66ed2a39 ******/
		%feature("compactdefaultargs") RemoveBackReference;
		%feature("autodoc", "
Parameters
----------
theObject: TObj_Object
theSingleOnly: bool (optional, default to Standard_True)

Return
-------
None

Description
-----------
Removes information on dependent object (back reference). if thesingleonly is true only the first back reference is removed in the case of duplicate items.
") RemoveBackReference;
		virtual void RemoveBackReference(const opencascade::handle<TObj_Object> & theObject, const Standard_Boolean theSingleOnly = Standard_True);

		/****** TObj_Object::RemoveBackReferences ******/
		/****** md5 signature: 5b23fea9b9159c4461ce1f91930d0a2f ******/
		%feature("compactdefaultargs") RemoveBackReferences;
		%feature("autodoc", "
Parameters
----------
theMode: TObj_DeletingMode (optional, default to TObj_FreeOnly)

Return
-------
bool

Description
-----------
Removes all back reference by removing references from other to me.
") RemoveBackReferences;
		virtual Standard_Boolean RemoveBackReferences(const TObj_DeletingMode theMode = TObj_FreeOnly);

		/****** TObj_Object::RemoveReference ******/
		/****** md5 signature: fed27815f0920dcc9996e740c5005a74 ******/
		%feature("compactdefaultargs") RemoveReference;
		%feature("autodoc", "
Parameters
----------
theObject: TObj_Object

Return
-------
None

Description
-----------
Removes reference to the object by replace reference to null object.
") RemoveReference;
		virtual void RemoveReference(const opencascade::handle<TObj_Object> & theObject);

		/****** TObj_Object::ReplaceReference ******/
		/****** md5 signature: 0f563c0db7192d75b2b4ec91d73c70a0 ******/
		%feature("compactdefaultargs") ReplaceReference;
		%feature("autodoc", "
Parameters
----------
theOldObject: TObj_Object
theNewObject: TObj_Object

Return
-------
None

Description
-----------
Replace reference from old object to new object. if it is not possible, may raise exception. if new object is null then simple remove reference to old object.
") ReplaceReference;
		virtual void ReplaceReference(const opencascade::handle<TObj_Object> & theOldObject, const opencascade::handle<TObj_Object> & theNewObject);

		/****** TObj_Object::SetFlags ******/
		/****** md5 signature: 5c54f9725fd82a3db196f501104b6ce2 ******/
		%feature("compactdefaultargs") SetFlags;
		%feature("autodoc", "
Parameters
----------
theMask: int

Return
-------
None

Description
-----------
Sets flags with defined mask.
") SetFlags;
		void SetFlags(const Standard_Integer theMask);

		/****** TObj_Object::SetName ******/
		/****** md5 signature: 70f0bbcdf9018e83965c8bb3e3808424 ******/
		%feature("compactdefaultargs") SetName;
		%feature("autodoc", "
Parameters
----------
theName: TCollection_HExtendedString

Return
-------
bool

Description
-----------
Sets name of the object. returns false if thename is not unique.
") SetName;
		virtual Standard_Boolean SetName(const opencascade::handle<TCollection_HExtendedString> & theName);

		/****** TObj_Object::SetName ******/
		/****** md5 signature: 5b89c7171705bae537c3c5f033a1e0be ******/
		%feature("compactdefaultargs") SetName;
		%feature("autodoc", "
Parameters
----------
theName: TCollection_HAsciiString

Return
-------
bool

Description
-----------
Sets name of the object. returns false if thename is not unique.
") SetName;
		Standard_Boolean SetName(const opencascade::handle<TCollection_HAsciiString> & theName);

		/****** TObj_Object::SetName ******/
		/****** md5 signature: 1eb9077655302114102f72d78e176de2 ******/
		%feature("compactdefaultargs") SetName;
		%feature("autodoc", "
Parameters
----------
name: str

Return
-------
bool

Description
-----------
Sets name of the object. returns false if thename is not unique.
") SetName;
		Standard_Boolean SetName(Standard_CString name);

		/****** TObj_Object::SetOrder ******/
		/****** md5 signature: 8206803240cbf5a17027b57cbad1c294 ******/
		%feature("compactdefaultargs") SetOrder;
		%feature("autodoc", "
Parameters
----------
theIndx: int

Return
-------
bool

Description
-----------
Sets order of object.
") SetOrder;
		virtual Standard_Boolean SetOrder(const Standard_Integer & theIndx);

		/****** TObj_Object::TestFlags ******/
		/****** md5 signature: 64fc376ba731f343e6a409a5310ddbc7 ******/
		%feature("compactdefaultargs") TestFlags;
		%feature("autodoc", "
Parameters
----------
theMask: int

Return
-------
bool

Description
-----------
Tests flags by the mask.
") TestFlags;
		Standard_Boolean TestFlags(const Standard_Integer theMask);

		/****** TObj_Object::getChildLabel ******/
		/****** md5 signature: 5b764b48162341152282dd3b62dcd729 ******/
		%feature("compactdefaultargs") getChildLabel;
		%feature("autodoc", "
Parameters
----------
theRank: int

Return
-------
TDF_Label

Description
-----------
Returns the label for child with rank.
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
		/****** TObj_ObjectIterator::More ******/
		/****** md5 signature: 4bb6f1f5e9d1b93bf6d038f6bdd34088 ******/
		%feature("compactdefaultargs") More;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if iteration is not finished and method current() will give the object. default implementation returns false.
") More;
		virtual Standard_Boolean More();

		/****** TObj_ObjectIterator::Next ******/
		/****** md5 signature: 73141d627b33e5b89ace1d498cedfc52 ******/
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "Return
-------
None

Description
-----------
Iterates to the next object default implementation does nothing.
") Next;
		virtual void Next();

		/****** TObj_ObjectIterator::Value ******/
		/****** md5 signature: 8fc2753c9fd2819d98b540ac13c813ca ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Return
-------
opencascade::handle<TObj_Object>

Description
-----------
Returns current object (or null if iteration has finished) default implementation returns null handle.
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
		/****** TObj_Persistence::CreateNewObject ******/
		/****** md5 signature: b7abb2b5034a2342962587782f3e2282 ******/
		%feature("compactdefaultargs") CreateNewObject;
		%feature("autodoc", "
Parameters
----------
theType: str
theLabel: TDF_Label

Return
-------
opencascade::handle<TObj_Object>

Description
-----------
Creates and returns a new object of the registered type if the type is not registered, returns null handle.
") CreateNewObject;
		static opencascade::handle<TObj_Object> CreateNewObject(Standard_CString theType, const TDF_Label & theLabel);

		/****** TObj_Persistence::DumpTypes ******/
		/****** md5 signature: 6b281615817b960184bb20e020b9d659 ******/
		%feature("compactdefaultargs") DumpTypes;
		%feature("autodoc", "
Parameters
----------

Return
-------
theOs: Standard_OStream

Description
-----------
Dumps names of all the types registered for persistence to the specified stream.
") DumpTypes;
		static void DumpTypes(std::ostream &OutValue);

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
		/****** TObj_TIntSparseArray::TObj_TIntSparseArray ******/
		/****** md5 signature: c9aff193b0588231fc96fab91e80e58f ******/
		%feature("compactdefaultargs") TObj_TIntSparseArray;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") TObj_TIntSparseArray;
		 TObj_TIntSparseArray();

		/****** TObj_TIntSparseArray::AfterUndo ******/
		/****** md5 signature: 0676c885125e2e0814f248a2e1de0500 ******/
		%feature("compactdefaultargs") AfterUndo;
		%feature("autodoc", "
Parameters
----------
theDelta: TDF_AttributeDelta
toForce: bool

Return
-------
bool

Description
-----------
Clears my modification delta; called after application of thedelta.
") AfterUndo;
		Standard_Boolean AfterUndo(const opencascade::handle<TDF_AttributeDelta> & theDelta, const Standard_Boolean toForce);

		/****** TObj_TIntSparseArray::BackupCopy ******/
		/****** md5 signature: be67c343943ad438128f575f7f5feaa1 ******/
		%feature("compactdefaultargs") BackupCopy;
		%feature("autodoc", "Return
-------
opencascade::handle<TDF_Attribute>

Description
-----------
Moves this delta into a new other attribute.
") BackupCopy;
		opencascade::handle<TDF_Attribute> BackupCopy();

		/****** TObj_TIntSparseArray::BeforeCommitTransaction ******/
		/****** md5 signature: 2e92b81a243c66449fd08ab0e1029b99 ******/
		%feature("compactdefaultargs") BeforeCommitTransaction;
		%feature("autodoc", "Return
-------
None

Description
-----------
It is called just before commit or abort transaction and does backup() to create a delta.
") BeforeCommitTransaction;
		void BeforeCommitTransaction();

		/****** TObj_TIntSparseArray::Clear ******/
		/****** md5 signature: ae54be580b423a6eadbe062e0bdb44c2 ******/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "Return
-------
None

Description
-----------
Clears the set.
") Clear;
		void Clear();

		/****** TObj_TIntSparseArray::ClearDelta ******/
		/****** md5 signature: 443ce54f18206a459ce776d8c7608a1c ******/
		%feature("compactdefaultargs") ClearDelta;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") ClearDelta;
		void ClearDelta();

		/****** TObj_TIntSparseArray::DeltaOnModification ******/
		/****** md5 signature: a97b7a3ed4e914790202111b5c287a97 ******/
		%feature("compactdefaultargs") DeltaOnModification;
		%feature("autodoc", "
Parameters
----------
theDelta: TDF_DeltaOnModification

Return
-------
None

Description
-----------
Applies thedelta to this.
") DeltaOnModification;
		void DeltaOnModification(const opencascade::handle<TDF_DeltaOnModification> & theDelta);

		/****** TObj_TIntSparseArray::GetID ******/
		/****** md5 signature: afe6002d90f641ca3ea8c9ae9f8fe97c ******/
		%feature("compactdefaultargs") GetID;
		%feature("autodoc", "Return
-------
Standard_GUID

Description
-----------
This method is used in implementation of id().
") GetID;
		static const Standard_GUID & GetID();

		/****** TObj_TIntSparseArray::GetIterator ******/
		/****** md5 signature: 11e392f4902d6b7c5d8af497b22e31a5 ******/
		%feature("compactdefaultargs") GetIterator;
		%feature("autodoc", "Return
-------
Iterator

Description
-----------
Returns iterator on objects contained in the set.
") GetIterator;
		Iterator GetIterator();

		/****** TObj_TIntSparseArray::HasValue ******/
		/****** md5 signature: 66abae458fd8ab579fad194c66b5b353 ******/
		%feature("compactdefaultargs") HasValue;
		%feature("autodoc", "
Parameters
----------
theId: Standard_Size

Return
-------
bool

Description
-----------
Returns true if the value with the given id is present.
") HasValue;
		Standard_Boolean HasValue(const Standard_Size theId);

		/****** TObj_TIntSparseArray::ID ******/
		/****** md5 signature: 4697ce8a095fa6dcef0217708d19718f ******/
		%feature("compactdefaultargs") ID;
		%feature("autodoc", "Return
-------
Standard_GUID

Description
-----------
Returns the id of this attribute.
") ID;
		const Standard_GUID & ID();

		/****** TObj_TIntSparseArray::NewEmpty ******/
		/****** md5 signature: c6d13c9ecc64c6c803b6e119e8216934 ******/
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "Return
-------
opencascade::handle<TDF_Attribute>

Description
-----------
Returns an new empty tobj_tintsparsearray attribute. it is used by the copy algorithm.
") NewEmpty;
		opencascade::handle<TDF_Attribute> NewEmpty();

		/****** TObj_TIntSparseArray::Paste ******/
		/****** md5 signature: eba505ad0ab2085caec3ed4fb06fc0c2 ******/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "
Parameters
----------
theInto: TDF_Attribute
theRT: TDF_RelocationTable

Return
-------
None

Description
-----------
This method is used when copying an attribute from a source structure into a target structure.
") Paste;
		void Paste(const opencascade::handle<TDF_Attribute> & theInto, const opencascade::handle<TDF_RelocationTable> & theRT);

		/****** TObj_TIntSparseArray::Restore ******/
		/****** md5 signature: d6da57eeb878ea4df869799e738c8bc8 ******/
		%feature("compactdefaultargs") Restore;
		%feature("autodoc", "
Parameters
----------
theDelta: TDF_Attribute

Return
-------
None

Description
-----------
Restores the set using info saved in backup attribute thedelta.
") Restore;
		void Restore(const opencascade::handle<TDF_Attribute> & theDelta);

		/****** TObj_TIntSparseArray::Set ******/
		/****** md5 signature: eb96bf6034dd27e8ecedbcbc0258acfe ******/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "
Parameters
----------
theLabel: TDF_Label

Return
-------
opencascade::handle<TObj_TIntSparseArray>

Description
-----------
Creates tobj_tintsparsearray attribute on given label.
") Set;
		static opencascade::handle<TObj_TIntSparseArray> Set(const TDF_Label & theLabel);

		/****** TObj_TIntSparseArray::SetDoBackup ******/
		/****** md5 signature: 1deb6cecab7e3c4cc9a49e82bd95c62a ******/
		%feature("compactdefaultargs") SetDoBackup;
		%feature("autodoc", "
Parameters
----------
toDo: bool

Return
-------
None

Description
-----------
Sets the flag pointing to the necessity to maintain a modification delta. it is called by the retrieval driver.
") SetDoBackup;
		void SetDoBackup(const Standard_Boolean toDo);

		/****** TObj_TIntSparseArray::SetValue ******/
		/****** md5 signature: d85ae25daaa0e824bdee84cfd24f86f3 ******/
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "
Parameters
----------
theId: Standard_Size
theValue: int

Return
-------
None

Description
-----------
Sets the value with the given id. raises an exception if theid is not positive.
") SetValue;
		void SetValue(const Standard_Size theId, const Standard_Integer theValue);

		/****** TObj_TIntSparseArray::Size ******/
		/****** md5 signature: 84043604cd4d694d29fbe523f032e5d8 ******/
		%feature("compactdefaultargs") Size;
		%feature("autodoc", "Return
-------
Standard_Size

Description
-----------
Returns the number of stored values in the set.
") Size;
		Standard_Size Size();

		/****** TObj_TIntSparseArray::UnsetValue ******/
		/****** md5 signature: 74bb693dfd55fe00e54e841b8496503a ******/
		%feature("compactdefaultargs") UnsetValue;
		%feature("autodoc", "
Parameters
----------
theId: Standard_Size

Return
-------
None

Description
-----------
Unsets the value with the given id. raises an exception if theid is not positive.
") UnsetValue;
		void UnsetValue(const Standard_Size theId);

		/****** TObj_TIntSparseArray::Value ******/
		/****** md5 signature: 2a6b8386cc08657e759e5a0f07fbaff8 ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
theId: Standard_Size

Return
-------
int

Description
-----------
Returns the value by its id. raises an exception if no value is stored with this id.
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
		/****** TObj_TModel::TObj_TModel ******/
		/****** md5 signature: dbf993e5fe22e1c4382769ad5780c577 ******/
		%feature("compactdefaultargs") TObj_TModel;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") TObj_TModel;
		 TObj_TModel();

		/****** TObj_TModel::GetID ******/
		/****** md5 signature: afe6002d90f641ca3ea8c9ae9f8fe97c ******/
		%feature("compactdefaultargs") GetID;
		%feature("autodoc", "Return
-------
Standard_GUID

Description
-----------
This method is used in implementation of id().
") GetID;
		static const Standard_GUID & GetID();

		/****** TObj_TModel::ID ******/
		/****** md5 signature: 4697ce8a095fa6dcef0217708d19718f ******/
		%feature("compactdefaultargs") ID;
		%feature("autodoc", "Return
-------
Standard_GUID

Description
-----------
Returns the id of tobj_tmodel attribute.
") ID;
		const Standard_GUID & ID();

		/****** TObj_TModel::Model ******/
		/****** md5 signature: c9c4beda74c2408f873d0748613e509c ******/
		%feature("compactdefaultargs") Model;
		%feature("autodoc", "Return
-------
opencascade::handle<TObj_Model>

Description
-----------
Returns the model object.
") Model;
		opencascade::handle<TObj_Model> Model();

		/****** TObj_TModel::NewEmpty ******/
		/****** md5 signature: c6d13c9ecc64c6c803b6e119e8216934 ******/
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "Return
-------
opencascade::handle<TDF_Attribute>

Description
-----------
Returns an new empty tobj_tmodel attribute. it is used by the copy algorithm.
") NewEmpty;
		opencascade::handle<TDF_Attribute> NewEmpty();

		/****** TObj_TModel::Paste ******/
		/****** md5 signature: eba505ad0ab2085caec3ed4fb06fc0c2 ******/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "
Parameters
----------
theInto: TDF_Attribute
theRT: TDF_RelocationTable

Return
-------
None

Description
-----------
This method is used when copying an attribute from a source structure into a target structure.
") Paste;
		void Paste(const opencascade::handle<TDF_Attribute> & theInto, const opencascade::handle<TDF_RelocationTable> & theRT);

		/****** TObj_TModel::Restore ******/
		/****** md5 signature: 0d710fe671bace8cc3b1b0525257edbc ******/
		%feature("compactdefaultargs") Restore;
		%feature("autodoc", "
Parameters
----------
theWith: TDF_Attribute

Return
-------
None

Description
-----------
Restores the backuped contents from <thewith> into this one. it is used when aborting a transaction.
") Restore;
		void Restore(const opencascade::handle<TDF_Attribute> & theWith);

		/****** TObj_TModel::Set ******/
		/****** md5 signature: 6ba00d7004a7e14a8d556aa8bab2f70a ******/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "
Parameters
----------
theModel: TObj_Model

Return
-------
None

Description
-----------
Sets the model object.
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
		/****** TObj_TNameContainer::TObj_TNameContainer ******/
		/****** md5 signature: cb5b252305845193df1f07169c9802ba ******/
		%feature("compactdefaultargs") TObj_TNameContainer;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") TObj_TNameContainer;
		 TObj_TNameContainer();

		/****** TObj_TNameContainer::Clear ******/
		/****** md5 signature: ae54be580b423a6eadbe062e0bdb44c2 ******/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "Return
-------
None

Description
-----------
Remove all names registered in container.
") Clear;
		void Clear();

		/****** TObj_TNameContainer::Get ******/
		/****** md5 signature: 9c5be8798dcac635c5b72a98614dd809 ******/
		%feature("compactdefaultargs") Get;
		%feature("autodoc", "Return
-------
TObj_DataMapOfNameLabel

Description
-----------
Returns the tobj_datamapofnamelabel object.
") Get;
		const TObj_DataMapOfNameLabel & Get();

		/****** TObj_TNameContainer::GetID ******/
		/****** md5 signature: afe6002d90f641ca3ea8c9ae9f8fe97c ******/
		%feature("compactdefaultargs") GetID;
		%feature("autodoc", "Return
-------
Standard_GUID

Description
-----------
This method is used in implementation of id().
") GetID;
		static const Standard_GUID & GetID();

		/****** TObj_TNameContainer::ID ******/
		/****** md5 signature: 4697ce8a095fa6dcef0217708d19718f ******/
		%feature("compactdefaultargs") ID;
		%feature("autodoc", "Return
-------
Standard_GUID

Description
-----------
Returns the id of tobj_tnamecontainer attribute.
") ID;
		const Standard_GUID & ID();

		/****** TObj_TNameContainer::IsRegistered ******/
		/****** md5 signature: c93cbd794218251c12402966fef45e89 ******/
		%feature("compactdefaultargs") IsRegistered;
		%feature("autodoc", "
Parameters
----------
theName: TCollection_HExtendedString

Return
-------
bool

Description
-----------
Return true is thename is registered in the map.
") IsRegistered;
		Standard_Boolean IsRegistered(const opencascade::handle<TCollection_HExtendedString> & theName);

		/****** TObj_TNameContainer::NewEmpty ******/
		/****** md5 signature: c6d13c9ecc64c6c803b6e119e8216934 ******/
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "Return
-------
opencascade::handle<TDF_Attribute>

Description
-----------
Returns an new empty tobj_tnamecontainer attribute. it is used by the copy algorithm.
") NewEmpty;
		opencascade::handle<TDF_Attribute> NewEmpty();

		/****** TObj_TNameContainer::Paste ******/
		/****** md5 signature: eba505ad0ab2085caec3ed4fb06fc0c2 ******/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "
Parameters
----------
theInto: TDF_Attribute
theRT: TDF_RelocationTable

Return
-------
None

Description
-----------
This method is used when copying an attribute from a source structure into a target structure.
") Paste;
		void Paste(const opencascade::handle<TDF_Attribute> & theInto, const opencascade::handle<TDF_RelocationTable> & theRT);

		/****** TObj_TNameContainer::RecordName ******/
		/****** md5 signature: f80322bd67469ee82cb871f8ffe05355 ******/
		%feature("compactdefaultargs") RecordName;
		%feature("autodoc", "
Parameters
----------
theName: TCollection_HExtendedString
theLabel: TDF_Label

Return
-------
None

Description
-----------
Records name with label attached.
") RecordName;
		void RecordName(const opencascade::handle<TCollection_HExtendedString> & theName, const TDF_Label & theLabel);

		/****** TObj_TNameContainer::RemoveName ******/
		/****** md5 signature: 4128a6889b10b30521a2fb896a2bb82b ******/
		%feature("compactdefaultargs") RemoveName;
		%feature("autodoc", "
Parameters
----------
theName: TCollection_HExtendedString

Return
-------
None

Description
-----------
Remove name from the map.
") RemoveName;
		void RemoveName(const opencascade::handle<TCollection_HExtendedString> & theName);

		/****** TObj_TNameContainer::Restore ******/
		/****** md5 signature: 0d710fe671bace8cc3b1b0525257edbc ******/
		%feature("compactdefaultargs") Restore;
		%feature("autodoc", "
Parameters
----------
theWith: TDF_Attribute

Return
-------
None

Description
-----------
Restores the backuped contents from <thewith> into this one. it is used when aborting a transaction.
") Restore;
		void Restore(const opencascade::handle<TDF_Attribute> & theWith);

		/****** TObj_TNameContainer::Set ******/
		/****** md5 signature: d27a684a880394d49a8829df7d74be38 ******/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "
Parameters
----------
theLabel: TDF_Label

Return
-------
opencascade::handle<TObj_TNameContainer>

Description
-----------
Creates tobj_datamapofnamelabel attribute on given label if not exist.
") Set;
		static opencascade::handle<TObj_TNameContainer> Set(const TDF_Label & theLabel);

		/****** TObj_TNameContainer::Set ******/
		/****** md5 signature: 582c256dc9c9dfafd336c11a75dac99b ******/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "
Parameters
----------
theElem: TObj_DataMapOfNameLabel

Return
-------
None

Description
-----------
Sets the tobj_datamapofnamelabel object.
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
		/****** TObj_TObject::TObj_TObject ******/
		/****** md5 signature: 567a6ce4698f0d40c3c3e5bdf97ca027 ******/
		%feature("compactdefaultargs") TObj_TObject;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") TObj_TObject;
		 TObj_TObject();

		/****** TObj_TObject::AfterUndo ******/
		/****** md5 signature: 38dda504fff4524dcb961f679f184715 ******/
		%feature("compactdefaultargs") AfterUndo;
		%feature("autodoc", "
Parameters
----------
anAttDelta: TDF_AttributeDelta
forceIt: bool

Return
-------
bool

Description
-----------
Tell tobj_object to rise from the dead, i.e. (myelem->isalive() == true) after that.
") AfterUndo;
		Standard_Boolean AfterUndo(const opencascade::handle<TDF_AttributeDelta> & anAttDelta, const Standard_Boolean forceIt);

		/****** TObj_TObject::BeforeForget ******/
		/****** md5 signature: 07bcf166676be92d6df0b39068250c8d ******/
		%feature("compactdefaultargs") BeforeForget;
		%feature("autodoc", "Return
-------
None

Description
-----------
Tell tobj_object to die, i.e. (myelem->isalive() == false) after that.
") BeforeForget;
		void BeforeForget();

		/****** TObj_TObject::Get ******/
		/****** md5 signature: eab1a410661a448145930096a9685507 ******/
		%feature("compactdefaultargs") Get;
		%feature("autodoc", "Return
-------
opencascade::handle<TObj_Object>

Description
-----------
Returns the tobj_object object.
") Get;
		opencascade::handle<TObj_Object> Get();

		/****** TObj_TObject::GetID ******/
		/****** md5 signature: afe6002d90f641ca3ea8c9ae9f8fe97c ******/
		%feature("compactdefaultargs") GetID;
		%feature("autodoc", "Return
-------
Standard_GUID

Description
-----------
This method is used in implementation of id().
") GetID;
		static const Standard_GUID & GetID();

		/****** TObj_TObject::ID ******/
		/****** md5 signature: 4697ce8a095fa6dcef0217708d19718f ******/
		%feature("compactdefaultargs") ID;
		%feature("autodoc", "Return
-------
Standard_GUID

Description
-----------
Returns the id of tobj_tobject attribute.
") ID;
		const Standard_GUID & ID();

		/****** TObj_TObject::NewEmpty ******/
		/****** md5 signature: c6d13c9ecc64c6c803b6e119e8216934 ******/
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "Return
-------
opencascade::handle<TDF_Attribute>

Description
-----------
Returns an new empty tobj_tobject attribute. it is used by the copy algorithm.
") NewEmpty;
		opencascade::handle<TDF_Attribute> NewEmpty();

		/****** TObj_TObject::Paste ******/
		/****** md5 signature: eba505ad0ab2085caec3ed4fb06fc0c2 ******/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "
Parameters
----------
theInto: TDF_Attribute
theRT: TDF_RelocationTable

Return
-------
None

Description
-----------
This method is used when copying an attribute from a source structure into a target structure.
") Paste;
		void Paste(const opencascade::handle<TDF_Attribute> & theInto, const opencascade::handle<TDF_RelocationTable> & theRT);

		/****** TObj_TObject::Restore ******/
		/****** md5 signature: 0d710fe671bace8cc3b1b0525257edbc ******/
		%feature("compactdefaultargs") Restore;
		%feature("autodoc", "
Parameters
----------
theWith: TDF_Attribute

Return
-------
None

Description
-----------
Restores the backuped contents from <thewith> into this one. it is used when aborting a transaction.
") Restore;
		void Restore(const opencascade::handle<TDF_Attribute> & theWith);

		/****** TObj_TObject::Set ******/
		/****** md5 signature: 0713a51dcac75e1b222ea562dd30f9bb ******/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "
Parameters
----------
theLabel: TDF_Label
theElem: TObj_Object

Return
-------
opencascade::handle<TObj_TObject>

Description
-----------
Creates tobj_tobject attribute on given label.
") Set;
		static opencascade::handle<TObj_TObject> Set(const TDF_Label & theLabel, const opencascade::handle<TObj_Object> & theElem);

		/****** TObj_TObject::Set ******/
		/****** md5 signature: 51a06c6c42bebef3114999f4bd225f85 ******/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "
Parameters
----------
theElem: TObj_Object

Return
-------
None

Description
-----------
Sets the tobj_object object.
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
		/****** TObj_TReference::TObj_TReference ******/
		/****** md5 signature: c3307e95b690d126dd9dc6a8776c417b ******/
		%feature("compactdefaultargs") TObj_TReference;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") TObj_TReference;
		 TObj_TReference();

		/****** TObj_TReference::AfterResume ******/
		/****** md5 signature: 1d4195e9b512e0fcd0e4fad379210118 ******/
		%feature("compactdefaultargs") AfterResume;
		%feature("autodoc", "Return
-------
None

Description
-----------
Check if back reference exists for reference.
") AfterResume;
		virtual void AfterResume();

		/****** TObj_TReference::AfterRetrieval ******/
		/****** md5 signature: e7cd83a7b63165871b2409400a899bc8 ******/
		%feature("compactdefaultargs") AfterRetrieval;
		%feature("autodoc", "
Parameters
----------
forceIt: bool (optional, default to Standard_False)

Return
-------
bool

Description
-----------
Called after retrieval reference from file.
") AfterRetrieval;
		virtual Standard_Boolean AfterRetrieval(const Standard_Boolean forceIt = Standard_False);

		/****** TObj_TReference::AfterUndo ******/
		/****** md5 signature: 1debacfe3c452f53106201f82dee9b20 ******/
		%feature("compactdefaultargs") AfterUndo;
		%feature("autodoc", "
Parameters
----------
theDelta: TDF_AttributeDelta
isForced: bool (optional, default to Standard_False)

Return
-------
bool

Description
-----------
It is necessary for tranzaction mechanism (undo/redo).
") AfterUndo;
		virtual Standard_Boolean AfterUndo(const opencascade::handle<TDF_AttributeDelta> & theDelta, const Standard_Boolean isForced = Standard_False);

		/****** TObj_TReference::BeforeForget ******/
		/****** md5 signature: e5a78fffddf9fa82f6f158acce858991 ******/
		%feature("compactdefaultargs") BeforeForget;
		%feature("autodoc", "Return
-------
None

Description
-----------
Remove back references of it reference if it is in other document.
") BeforeForget;
		virtual void BeforeForget();

		/****** TObj_TReference::BeforeUndo ******/
		/****** md5 signature: f2977f7534cce5aca5640b96915a7a0a ******/
		%feature("compactdefaultargs") BeforeUndo;
		%feature("autodoc", "
Parameters
----------
theDelta: TDF_AttributeDelta
isForced: bool (optional, default to Standard_False)

Return
-------
bool

Description
-----------
It is necessary for tranzaction mechanism (undo/redo).
") BeforeUndo;
		virtual Standard_Boolean BeforeUndo(const opencascade::handle<TDF_AttributeDelta> & theDelta, const Standard_Boolean isForced = Standard_False);

		/****** TObj_TReference::Get ******/
		/****** md5 signature: eab1a410661a448145930096a9685507 ******/
		%feature("compactdefaultargs") Get;
		%feature("autodoc", "Return
-------
opencascade::handle<TObj_Object>

Description
-----------
Returns the referenced theobject.
") Get;
		opencascade::handle<TObj_Object> Get();

		/****** TObj_TReference::GetID ******/
		/****** md5 signature: afe6002d90f641ca3ea8c9ae9f8fe97c ******/
		%feature("compactdefaultargs") GetID;
		%feature("autodoc", "Return
-------
Standard_GUID

Description
-----------
This method is used in implementation of id().
") GetID;
		static const Standard_GUID & GetID();

		/****** TObj_TReference::GetLabel ******/
		/****** md5 signature: 5ab1f3863e9e6f51586f46622e4aeabe ******/
		%feature("compactdefaultargs") GetLabel;
		%feature("autodoc", "Return
-------
TDF_Label

Description
-----------
Returns the referred label.
") GetLabel;
		TDF_Label GetLabel();

		/****** TObj_TReference::GetMasterLabel ******/
		/****** md5 signature: 05c908d4501ccf8c1264c0893cd915e1 ******/
		%feature("compactdefaultargs") GetMasterLabel;
		%feature("autodoc", "Return
-------
TDF_Label

Description
-----------
Returns the label of master object.
") GetMasterLabel;
		TDF_Label GetMasterLabel();

		/****** TObj_TReference::ID ******/
		/****** md5 signature: 4697ce8a095fa6dcef0217708d19718f ******/
		%feature("compactdefaultargs") ID;
		%feature("autodoc", "Return
-------
Standard_GUID

Description
-----------
Returns the id of tobj_treference attribute.
") ID;
		const Standard_GUID & ID();

		/****** TObj_TReference::NewEmpty ******/
		/****** md5 signature: c6d13c9ecc64c6c803b6e119e8216934 ******/
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "Return
-------
opencascade::handle<TDF_Attribute>

Description
-----------
Returns an new empty tobj_treference attribute. it is used by the copy algorithm.
") NewEmpty;
		opencascade::handle<TDF_Attribute> NewEmpty();

		/****** TObj_TReference::Paste ******/
		/****** md5 signature: eba505ad0ab2085caec3ed4fb06fc0c2 ******/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "
Parameters
----------
theInto: TDF_Attribute
theRT: TDF_RelocationTable

Return
-------
None

Description
-----------
This method is used when copying an attribute from a source structure into a target structure.
") Paste;
		void Paste(const opencascade::handle<TDF_Attribute> & theInto, const opencascade::handle<TDF_RelocationTable> & theRT);

		/****** TObj_TReference::Restore ******/
		/****** md5 signature: 0d710fe671bace8cc3b1b0525257edbc ******/
		%feature("compactdefaultargs") Restore;
		%feature("autodoc", "
Parameters
----------
theWith: TDF_Attribute

Return
-------
None

Description
-----------
Restores the backuped contents from <thewith> into this one. it is used when aborting a transaction.
") Restore;
		void Restore(const opencascade::handle<TDF_Attribute> & theWith);

		/****** TObj_TReference::Set ******/
		/****** md5 signature: 67ea755fe91a8cb150e5d7cc0eafa426 ******/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "
Parameters
----------
theLabel: TDF_Label
theObject: TObj_Object
theMaster: TObj_Object

Return
-------
opencascade::handle<TObj_TReference>

Description
-----------
Creates reference on tdf_label <thelabel> to the object <theobject> and creates backreference from the object <theobject> to <themaster> one.
") Set;
		static opencascade::handle<TObj_TReference> Set(const TDF_Label & theLabel, const opencascade::handle<TObj_Object> & theObject, const opencascade::handle<TObj_Object> & theMaster);

		/****** TObj_TReference::Set ******/
		/****** md5 signature: 6e4ac7f97eb10d77e996ed4ab5bf310a ******/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "
Parameters
----------
theObject: TObj_Object
theMasterLabel: TDF_Label

Return
-------
None

Description
-----------
Sets the reference to the theobject.
") Set;
		void Set(const opencascade::handle<TObj_Object> & theObject, const TDF_Label & theMasterLabel);

		/****** TObj_TReference::Set ******/
		/****** md5 signature: e7b9ad52e6b3444d793ebf7e8c763d2f ******/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "
Parameters
----------
theLabel: TDF_Label
theMasterLabel: TDF_Label

Return
-------
None

Description
-----------
Sets the reference to the theobject at indicated label. it is method for persistent only. don`t use anywhere else.
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
		/****** TObj_TXYZ::TObj_TXYZ ******/
		/****** md5 signature: 4ad159fabf30b68a39e24fae8c49edb3 ******/
		%feature("compactdefaultargs") TObj_TXYZ;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") TObj_TXYZ;
		 TObj_TXYZ();

		/****** TObj_TXYZ::Dump ******/
		/****** md5 signature: a70630ee0dbc4de065e099a9519a2a06 ******/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "
Parameters
----------

Return
-------
theOS: Standard_OStream

Description
-----------
This method dumps the attribute value into the stream.
") Dump;
		virtual Standard_OStream & Dump(std::ostream &OutValue);

		/****** TObj_TXYZ::Get ******/
		/****** md5 signature: d4d7c3399f4d5d1d9662bdcf64101489 ******/
		%feature("compactdefaultargs") Get;
		%feature("autodoc", "Return
-------
gp_XYZ

Description
-----------
Returns the xyz.
") Get;
		gp_XYZ Get();

		/****** TObj_TXYZ::GetID ******/
		/****** md5 signature: afe6002d90f641ca3ea8c9ae9f8fe97c ******/
		%feature("compactdefaultargs") GetID;
		%feature("autodoc", "Return
-------
Standard_GUID

Description
-----------
This method is used in implementation of id().
") GetID;
		static const Standard_GUID & GetID();

		/****** TObj_TXYZ::ID ******/
		/****** md5 signature: 4697ce8a095fa6dcef0217708d19718f ******/
		%feature("compactdefaultargs") ID;
		%feature("autodoc", "Return
-------
Standard_GUID

Description
-----------
Returns the id of tobj_txyz attribute.
") ID;
		const Standard_GUID & ID();

		/****** TObj_TXYZ::NewEmpty ******/
		/****** md5 signature: c6d13c9ecc64c6c803b6e119e8216934 ******/
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "Return
-------
opencascade::handle<TDF_Attribute>

Description
-----------
Returns an new empty tobj_txyz attribute. it is used by the copy algorithm.
") NewEmpty;
		opencascade::handle<TDF_Attribute> NewEmpty();

		/****** TObj_TXYZ::Paste ******/
		/****** md5 signature: eba505ad0ab2085caec3ed4fb06fc0c2 ******/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "
Parameters
----------
theInto: TDF_Attribute
theRT: TDF_RelocationTable

Return
-------
None

Description
-----------
This method is used when copying an attribute from a source structure into a target structure.
") Paste;
		void Paste(const opencascade::handle<TDF_Attribute> & theInto, const opencascade::handle<TDF_RelocationTable> & theRT);

		/****** TObj_TXYZ::Restore ******/
		/****** md5 signature: 0d710fe671bace8cc3b1b0525257edbc ******/
		%feature("compactdefaultargs") Restore;
		%feature("autodoc", "
Parameters
----------
theWith: TDF_Attribute

Return
-------
None

Description
-----------
Restores the backuped contents from <thewith> into this one. it is used when aborting a transaction.
") Restore;
		void Restore(const opencascade::handle<TDF_Attribute> & theWith);

		/****** TObj_TXYZ::Set ******/
		/****** md5 signature: 86be6bf42e1d34b1830b1188f0af72b4 ******/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "
Parameters
----------
theLabel: TDF_Label
theXYZ: gp_XYZ

Return
-------
opencascade::handle<TObj_TXYZ>

Description
-----------
Creates attribute and sets the xyz.
") Set;
		static opencascade::handle<TObj_TXYZ> Set(const TDF_Label & theLabel, const gp_XYZ & theXYZ);

		/****** TObj_TXYZ::Set ******/
		/****** md5 signature: e6c77c9806d517177bb367126303cc20 ******/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "
Parameters
----------
theXYZ: gp_XYZ

Return
-------
None

Description
-----------
Sets the xyz.
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
		/****** TObj_LabelIterator::LabelValue ******/
		/****** md5 signature: 153861477678a3ae19ebb1219bf531c1 ******/
		%feature("compactdefaultargs") LabelValue;
		%feature("autodoc", "Return
-------
TDF_Label

Description
-----------
Returns the label of the current item.
") LabelValue;
		const TDF_Label & LabelValue();

		/****** TObj_LabelIterator::More ******/
		/****** md5 signature: 1e5d8e0dca9bbb9162656bc9b0694e47 ******/
		%feature("compactdefaultargs") More;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if there is a current item in the iteration.
") More;
		virtual Standard_Boolean More();

		/****** TObj_LabelIterator::Next ******/
		/****** md5 signature: b63ea944a01b0e386a7cb8b02e8cfefd ******/
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "Return
-------
None

Description
-----------
Move to the next item.
") Next;
		virtual void Next();

		/****** TObj_LabelIterator::Value ******/
		/****** md5 signature: 45a991f88fedb5caa021fa6be8f33be8 ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Return
-------
opencascade::handle<TObj_Object>

Description
-----------
Returns the current item.
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
		/****** TObj_ModelIterator::TObj_ModelIterator ******/
		/****** md5 signature: c203dac751bc19d41a689b86d5b221df ******/
		%feature("compactdefaultargs") TObj_ModelIterator;
		%feature("autodoc", "
Parameters
----------
theModel: TObj_Model

Return
-------
None

Description
-----------
/** * constructor */ creates iterator and initialize it by model`s label.
") TObj_ModelIterator;
		 TObj_ModelIterator(const opencascade::handle<TObj_Model> & theModel);

		/****** TObj_ModelIterator::More ******/
		/****** md5 signature: b2821025844f4f2823e07323c717a764 ******/
		%feature("compactdefaultargs") More;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if iteration is not finished and method value() will give the object.
") More;
		virtual Standard_Boolean More();

		/****** TObj_ModelIterator::Next ******/
		/****** md5 signature: b63ea944a01b0e386a7cb8b02e8cfefd ******/
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "Return
-------
None

Description
-----------
Iterates to the next object.
") Next;
		virtual void Next();

		/****** TObj_ModelIterator::Value ******/
		/****** md5 signature: fc22d89439b76d8e3f054202e24b3f51 ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Return
-------
opencascade::handle<TObj_Object>

Description
-----------
Returns current object (or mainobj of model if iteration has finished).
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
		/****** TObj_Partition::AfterRetrieval ******/
		/****** md5 signature: 5116de267db888dbe3c4cd27cb5af96d ******/
		%feature("compactdefaultargs") AfterRetrieval;
		%feature("autodoc", "Return
-------
None

Description
-----------
Performs updating the links and dependencies of the object which are not stored in persistence. does not register the partition name.
") AfterRetrieval;
		virtual void AfterRetrieval();

		/****** TObj_Partition::Create ******/
		/****** md5 signature: 0825e50eb60f2c25400b581c167f8a28 ******/
		%feature("compactdefaultargs") Create;
		%feature("autodoc", "
Parameters
----------
theLabel: TDF_Label
theSetName: bool (optional, default to Standard_True)

Return
-------
opencascade::handle<TObj_Partition>

Description
-----------
Creates a new partition on given label.
") Create;
		static opencascade::handle<TObj_Partition> Create(const TDF_Label & theLabel, const Standard_Boolean theSetName = Standard_True);

		/****** TObj_Partition::GetLastIndex ******/
		/****** md5 signature: 3b931de29b8e9da98569a06fe0d1725e ******/
		%feature("compactdefaultargs") GetLastIndex;
		%feature("autodoc", "Return
-------
int

Description
-----------
Return last index in partition (reserved);.
") GetLastIndex;
		Standard_Integer GetLastIndex();

		/****** TObj_Partition::GetNamePrefix ******/
		/****** md5 signature: e0fdcd5eb35f717e530a3646849ef0b3 ******/
		%feature("compactdefaultargs") GetNamePrefix;
		%feature("autodoc", "Return
-------
opencascade::handle<TCollection_HExtendedString>

Description
-----------
Returns prefix for names of the objects in partition.
") GetNamePrefix;
		opencascade::handle<TCollection_HExtendedString> GetNamePrefix();

		/****** TObj_Partition::GetNewName ******/
		/****** md5 signature: b4e368c8f5d87830213831249f7b65f8 ******/
		%feature("compactdefaultargs") GetNewName;
		%feature("autodoc", "
Parameters
----------
theIsToChangeCount: bool (optional, default to Standard_True)

Return
-------
opencascade::handle<TCollection_HExtendedString>

Description
-----------
Generates and returns name for new object in partition. if theistochangecount is true partition increase own counter to generate new name next time starting from new counter value.
") GetNewName;
		opencascade::handle<TCollection_HExtendedString> GetNewName(const Standard_Boolean theIsToChangeCount = Standard_True);

		/****** TObj_Partition::GetPartition ******/
		/****** md5 signature: 13ad38d3df7453cccb9a62aab75fddb6 ******/
		%feature("compactdefaultargs") GetPartition;
		%feature("autodoc", "
Parameters
----------
theObject: TObj_Object

Return
-------
opencascade::handle<TObj_Partition>

Description
-----------
Returns the partition in which object is stored. null partition returned if not found.
") GetPartition;
		static opencascade::handle<TObj_Partition> GetPartition(const opencascade::handle<TObj_Object> & theObject);

		/****** TObj_Partition::NewLabel ******/
		/****** md5 signature: b252dc5a0d8c728384cf385ea9cfcdc0 ******/
		%feature("compactdefaultargs") NewLabel;
		%feature("autodoc", "Return
-------
TDF_Label

Description
-----------
Creates and returns label for new object in partition.
") NewLabel;
		TDF_Label NewLabel();

		/****** TObj_Partition::SetLastIndex ******/
		/****** md5 signature: f1c0203e9e973b3ef34565275717760a ******/
		%feature("compactdefaultargs") SetLastIndex;
		%feature("autodoc", "
Parameters
----------
theIndex: int

Return
-------
None

Description
-----------
Sets last index in partition (reserved);.
") SetLastIndex;
		void SetLastIndex(const Standard_Integer theIndex);

		/****** TObj_Partition::SetName ******/
		/****** md5 signature: fb723fddc9b8a3cd18607ae9add2b576 ******/
		%feature("compactdefaultargs") SetName;
		%feature("autodoc", "
Parameters
----------
theName: TCollection_HExtendedString

Return
-------
bool

Description
-----------
Sets name of the object. partition does not check unique of own name.
") SetName;
		virtual Standard_Boolean SetName(const opencascade::handle<TCollection_HExtendedString> & theName);

		/****** TObj_Partition::SetNamePrefix ******/
		/****** md5 signature: c401da4c7bc7e71ebc5fca355f5a59c0 ******/
		%feature("compactdefaultargs") SetNamePrefix;
		%feature("autodoc", "
Parameters
----------
thePrefix: TCollection_HExtendedString

Return
-------
None

Description
-----------
Sets prefix for names of the objects in partition.
") SetNamePrefix;
		void SetNamePrefix(const opencascade::handle<TCollection_HExtendedString> & thePrefix);

		/****** TObj_Partition::Update ******/
		/****** md5 signature: 8770459c04056535aba1783bd04567c5 ******/
		%feature("compactdefaultargs") Update;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Does nothing in the partition.
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
		/****** TObj_SequenceIterator::TObj_SequenceIterator ******/
		/****** md5 signature: b4180e8a504198d2687dbb509ae28e9a ******/
		%feature("compactdefaultargs") TObj_SequenceIterator;
		%feature("autodoc", "
Parameters
----------
theObjects: TObj_HSequenceOfObject
theType: Standard_Type (optional, default to NULL)

Return
-------
None

Description
-----------
Creates an iterator an initialize it by sequence of objects.
") TObj_SequenceIterator;
		 TObj_SequenceIterator(const opencascade::handle<TObj_HSequenceOfObject> & theObjects, const opencascade::handle<Standard_Type> & theType = NULL);

		/****** TObj_SequenceIterator::More ******/
		/****** md5 signature: b2821025844f4f2823e07323c717a764 ******/
		%feature("compactdefaultargs") More;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if there is a current item in the iteration.
") More;
		virtual Standard_Boolean More();

		/****** TObj_SequenceIterator::Next ******/
		/****** md5 signature: b63ea944a01b0e386a7cb8b02e8cfefd ******/
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "Return
-------
None

Description
-----------
Move to the next item.
") Next;
		virtual void Next();

		/****** TObj_SequenceIterator::Value ******/
		/****** md5 signature: fc22d89439b76d8e3f054202e24b3f51 ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Return
-------
opencascade::handle<TObj_Object>

Description
-----------
Returns the current item.
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
		/****** TObj_HiddenPartition::TObj_HiddenPartition ******/
		/****** md5 signature: 58bd8996faffc57f1e7cf267e4a067fd ******/
		%feature("compactdefaultargs") TObj_HiddenPartition;
		%feature("autodoc", "
Parameters
----------
theLabel: TDF_Label

Return
-------
None

Description
-----------
Constructor.
") TObj_HiddenPartition;
		 TObj_HiddenPartition(const TDF_Label & theLabel);

		/****** TObj_HiddenPartition::GetTypeFlags ******/
		/****** md5 signature: 43cc802c59d38acacec7dc8db436c23f ******/
		%feature("compactdefaultargs") GetTypeFlags;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns all flags of father except visible.
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
		/****** TObj_OcafObjectIterator::TObj_OcafObjectIterator ******/
		/****** md5 signature: b1349528ca90af110980c95a03b85766 ******/
		%feature("compactdefaultargs") TObj_OcafObjectIterator;
		%feature("autodoc", "
Parameters
----------
theLabel: TDF_Label
theType: Standard_Type (optional, default to NULL)
theRecursive: bool (optional, default to Standard_False)
theAllSubChildren: bool (optional, default to Standard_False)

Return
-------
None

Description
-----------
Creates the iterator on tobj objects on the sub-labels of thelabel. @param thelabel start label for searching @param thetype type of the found objects, or all types if null @param therecursive search children recursively, not only on sub-labels of thelabel @param theallsubchildren do not stop at the first level of children, but search for sub-children too.
") TObj_OcafObjectIterator;
		 TObj_OcafObjectIterator(const TDF_Label & theLabel, const opencascade::handle<Standard_Type> & theType = NULL, const Standard_Boolean theRecursive = Standard_False, const Standard_Boolean theAllSubChildren = Standard_False);

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
		/****** TObj_ReferenceIterator::TObj_ReferenceIterator ******/
		/****** md5 signature: 42cca6998eb4240301dc13393448d838 ******/
		%feature("compactdefaultargs") TObj_ReferenceIterator;
		%feature("autodoc", "
Parameters
----------
theLabel: TDF_Label
theType: Standard_Type (optional, default to NULL)
theRecursive: bool (optional, default to Standard_True)

Return
-------
None

Description
-----------
Creates the iterator on references in partition thetype narrows a variety of iterated objects.
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
class TObj_HSequenceOfObject : public TObj_SequenceOfObject, public Standard_Transient {
  public:
    TObj_HSequenceOfObject();
    TObj_HSequenceOfObject(const TObj_SequenceOfObject& theOther);
    const TObj_SequenceOfObject& Sequence();
    void Append (const TObj_SequenceOfObject::value_type& theItem);
    void Append (TObj_SequenceOfObject& theSequence);
    TObj_SequenceOfObject& ChangeSequence();
};
%make_alias(TObj_HSequenceOfObject)


/* class aliases */
%pythoncode {
}
/* deprecated methods */
%pythoncode {
@deprecated
def TObj_Application_GetInstance(*args):
	return TObj_Application.GetInstance(*args)

@deprecated
def TObj_Assistant_BindModel(*args):
	return TObj_Assistant.BindModel(*args)

@deprecated
def TObj_Assistant_BindType(*args):
	return TObj_Assistant.BindType(*args)

@deprecated
def TObj_Assistant_ClearModelMap(*args):
	return TObj_Assistant.ClearModelMap(*args)

@deprecated
def TObj_Assistant_ClearTypeMap(*args):
	return TObj_Assistant.ClearTypeMap(*args)

@deprecated
def TObj_Assistant_FindModel(*args):
	return TObj_Assistant.FindModel(*args)

@deprecated
def TObj_Assistant_FindType(*args):
	return TObj_Assistant.FindType(*args)

@deprecated
def TObj_Assistant_FindTypeIndex(*args):
	return TObj_Assistant.FindTypeIndex(*args)

@deprecated
def TObj_Assistant_GetAppVersion(*args):
	return TObj_Assistant.GetAppVersion(*args)

@deprecated
def TObj_Assistant_GetCurrentModel(*args):
	return TObj_Assistant.GetCurrentModel(*args)

@deprecated
def TObj_Assistant_SetCurrentModel(*args):
	return TObj_Assistant.SetCurrentModel(*args)

@deprecated
def TObj_Assistant_UnSetCurrentModel(*args):
	return TObj_Assistant.UnSetCurrentModel(*args)

@deprecated
def TObj_Model_GetDocumentModel(*args):
	return TObj_Model.GetDocumentModel(*args)

@deprecated
def TObj_Model_SetNewName(*args):
	return TObj_Model.SetNewName(*args)

@deprecated
def TObj_Object_Detach(*args):
	return TObj_Object.Detach(*args)

@deprecated
def TObj_Object_GetObj(*args):
	return TObj_Object.GetObj(*args)

@deprecated
def TObj_Persistence_CreateNewObject(*args):
	return TObj_Persistence.CreateNewObject(*args)

@deprecated
def TObj_Persistence_DumpTypes(*args):
	return TObj_Persistence.DumpTypes(*args)

@deprecated
def TObj_TIntSparseArray_GetID(*args):
	return TObj_TIntSparseArray.GetID(*args)

@deprecated
def TObj_TIntSparseArray_Set(*args):
	return TObj_TIntSparseArray.Set(*args)

@deprecated
def TObj_TModel_GetID(*args):
	return TObj_TModel.GetID(*args)

@deprecated
def TObj_TNameContainer_GetID(*args):
	return TObj_TNameContainer.GetID(*args)

@deprecated
def TObj_TNameContainer_Set(*args):
	return TObj_TNameContainer.Set(*args)

@deprecated
def TObj_TObject_GetID(*args):
	return TObj_TObject.GetID(*args)

@deprecated
def TObj_TObject_Set(*args):
	return TObj_TObject.Set(*args)

@deprecated
def TObj_TReference_GetID(*args):
	return TObj_TReference.GetID(*args)

@deprecated
def TObj_TReference_Set(*args):
	return TObj_TReference.Set(*args)

@deprecated
def TObj_TXYZ_GetID(*args):
	return TObj_TXYZ.GetID(*args)

@deprecated
def TObj_TXYZ_Set(*args):
	return TObj_TXYZ.Set(*args)

@deprecated
def TObj_Partition_Create(*args):
	return TObj_Partition.Create(*args)

@deprecated
def TObj_Partition_GetPartition(*args):
	return TObj_Partition.GetPartition(*args)

}
