/*
Copyright 2008-2022 Thomas Paviot (tpaviot@gmail.com)

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
%define APIHEADERSECTIONDOCSTRING
"APIHeaderSection module, see official documentation at
https://www.opencascade.com/doc/occt-7.6.0/refman/html/package_apiheadersection.html"
%enddef
%module (package="OCC.Core", docstring=APIHEADERSECTIONDOCSTRING) APIHeaderSection


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


%{
#include<APIHeaderSection_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<IFSelect_module.hxx>
#include<Interface_module.hxx>
#include<TCollection_module.hxx>
#include<StepData_module.hxx>
#include<HeaderSection_module.hxx>
#include<MoniTool_module.hxx>
#include<TopoDS_module.hxx>
#include<Message_module.hxx>
#include<Resource_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import IFSelect.i
%import Interface.i
%import TCollection.i
%import StepData.i
%import HeaderSection.i

%pythoncode {
from enum import IntEnum
from OCC.Core.Exception import *
};

/* public enums */
/* end public enums declaration */

/* python proxy classes for enums */
%pythoncode {
};
/* end python proxy for enums */

/* handles */
%wrap_handle(APIHeaderSection_EditHeader)
/* end handles declaration */

/* templates */
/* end templates declaration */

/* typedefs */
/* end typedefs declaration */

/************************************
* class APIHeaderSection_EditHeader *
************************************/
class APIHeaderSection_EditHeader : public IFSelect_Editor {
	public:
		/****************** APIHeaderSection_EditHeader ******************/
		/**** md5 signature: 2bf08a1315df936c9484c98a1d1baf5a ****/
		%feature("compactdefaultargs") APIHeaderSection_EditHeader;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") APIHeaderSection_EditHeader;
		 APIHeaderSection_EditHeader();

		/****************** Apply ******************/
		/**** md5 signature: 7128480b7f4b1ff6fd959731640e27fc ****/
		%feature("compactdefaultargs") Apply;
		%feature("autodoc", "No available documentation.

Parameters
----------
form: IFSelect_EditForm
ent: Standard_Transient
model: Interface_InterfaceModel

Returns
-------
bool
") Apply;
		Standard_Boolean Apply(const opencascade::handle<IFSelect_EditForm> & form, const opencascade::handle<Standard_Transient> & ent, const opencascade::handle<Interface_InterfaceModel> & model);

		/****************** Label ******************/
		/**** md5 signature: e2fbf0e262882b3e9ec00c539ad3471b ****/
		%feature("compactdefaultargs") Label;
		%feature("autodoc", "No available documentation.

Returns
-------
TCollection_AsciiString
") Label;
		TCollection_AsciiString Label();

		/****************** Load ******************/
		/**** md5 signature: fbb84192d1ec7737c4c84905239a2df8 ****/
		%feature("compactdefaultargs") Load;
		%feature("autodoc", "No available documentation.

Parameters
----------
form: IFSelect_EditForm
ent: Standard_Transient
model: Interface_InterfaceModel

Returns
-------
bool
") Load;
		Standard_Boolean Load(const opencascade::handle<IFSelect_EditForm> & form, const opencascade::handle<Standard_Transient> & ent, const opencascade::handle<Interface_InterfaceModel> & model);

		/****************** Recognize ******************/
		/**** md5 signature: 745b42e0c753cb6baed4d66bbf94e5b8 ****/
		%feature("compactdefaultargs") Recognize;
		%feature("autodoc", "No available documentation.

Parameters
----------
form: IFSelect_EditForm

Returns
-------
bool
") Recognize;
		Standard_Boolean Recognize(const opencascade::handle<IFSelect_EditForm> & form);

		/****************** StringValue ******************/
		/**** md5 signature: 4371620dd4c31b906a08f6f8ee98f04a ****/
		%feature("compactdefaultargs") StringValue;
		%feature("autodoc", "No available documentation.

Parameters
----------
form: IFSelect_EditForm
num: int

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") StringValue;
		opencascade::handle<TCollection_HAsciiString> StringValue(const opencascade::handle<IFSelect_EditForm> & form, const Standard_Integer num);

};


%make_alias(APIHeaderSection_EditHeader)

%extend APIHeaderSection_EditHeader {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************************
* class APIHeaderSection_MakeHeader *
************************************/
class APIHeaderSection_MakeHeader {
	public:
		/****************** APIHeaderSection_MakeHeader ******************/
		/**** md5 signature: 231ae7cfabfb8525a17a55b5e8098f01 ****/
		%feature("compactdefaultargs") APIHeaderSection_MakeHeader;
		%feature("autodoc", "Prepares a new makeheader from scratch.

Parameters
----------
shapetype: int,optional
	default value is 0

Returns
-------
None
") APIHeaderSection_MakeHeader;
		 APIHeaderSection_MakeHeader(const Standard_Integer shapetype = 0);

		/****************** APIHeaderSection_MakeHeader ******************/
		/**** md5 signature: 3bf1a3faeeaf6e2623b6097489a9d879 ****/
		%feature("compactdefaultargs") APIHeaderSection_MakeHeader;
		%feature("autodoc", "Prepares a makeheader from the content of a stepmodel see isdone to know if the header is well defined.

Parameters
----------
model: StepData_StepModel

Returns
-------
None
") APIHeaderSection_MakeHeader;
		 APIHeaderSection_MakeHeader(const opencascade::handle<StepData_StepModel> & model);

		/****************** AddSchemaIdentifier ******************/
		/**** md5 signature: fb971c31ef622fe2699e9896a61d0b7c ****/
		%feature("compactdefaultargs") AddSchemaIdentifier;
		%feature("autodoc", "Add a subname of schema (if not yet in the list).

Parameters
----------
aSchemaIdentifier: TCollection_HAsciiString

Returns
-------
None
") AddSchemaIdentifier;
		void AddSchemaIdentifier(const opencascade::handle<TCollection_HAsciiString> & aSchemaIdentifier);

		/****************** Apply ******************/
		/**** md5 signature: 7a18b7c9dc5aace0d13d1301acc1073f ****/
		%feature("compactdefaultargs") Apply;
		%feature("autodoc", "Creates an empty header for a new step model and allows the header fields to be completed.

Parameters
----------
model: StepData_StepModel

Returns
-------
None
") Apply;
		void Apply(const opencascade::handle<StepData_StepModel> & model);

		/****************** Author ******************/
		/**** md5 signature: 23de40daf6aa0108289fcab1cc10b710 ****/
		%feature("compactdefaultargs") Author;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<Interface_HArray1OfHAsciiString>
") Author;
		opencascade::handle<Interface_HArray1OfHAsciiString> Author();

		/****************** AuthorValue ******************/
		/**** md5 signature: 053bae3a6f3b50b0b3cbcc10f1448e71 ****/
		%feature("compactdefaultargs") AuthorValue;
		%feature("autodoc", "Returns the value of the name attribute for the file_name entity.

Parameters
----------
num: int

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") AuthorValue;
		opencascade::handle<TCollection_HAsciiString> AuthorValue(const Standard_Integer num);

		/****************** Authorisation ******************/
		/**** md5 signature: 74cf5a9ad29d5b5b00394896d05f442b ****/
		%feature("compactdefaultargs") Authorisation;
		%feature("autodoc", "Returns the value of the authorization attribute for the file_name entity.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") Authorisation;
		opencascade::handle<TCollection_HAsciiString> Authorisation();

		/****************** Description ******************/
		/**** md5 signature: 9b909686a25b7d6265affec4e3820e98 ****/
		%feature("compactdefaultargs") Description;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<Interface_HArray1OfHAsciiString>
") Description;
		opencascade::handle<Interface_HArray1OfHAsciiString> Description();

		/****************** DescriptionValue ******************/
		/**** md5 signature: c5b8ce5eb4616a323970d217aa88af81 ****/
		%feature("compactdefaultargs") DescriptionValue;
		%feature("autodoc", "Returns the value of the description attribute for the file_description entity.

Parameters
----------
num: int

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") DescriptionValue;
		opencascade::handle<TCollection_HAsciiString> DescriptionValue(const Standard_Integer num);

		/****************** FdValue ******************/
		/**** md5 signature: 399c35af474cdbfb7c29fa336d37d16b ****/
		%feature("compactdefaultargs") FdValue;
		%feature("autodoc", "Returns the file_description entity. returns an empty entity if the file_description entity is not initialized.

Returns
-------
opencascade::handle<HeaderSection_FileDescription>
") FdValue;
		opencascade::handle<HeaderSection_FileDescription> FdValue();

		/****************** FnValue ******************/
		/**** md5 signature: 1fce139b98d1ddb3cc6f35b294bb9be7 ****/
		%feature("compactdefaultargs") FnValue;
		%feature("autodoc", "Returns the file_name entity. returns an empty entity if the file_name entity is not initialized.

Returns
-------
opencascade::handle<HeaderSection_FileName>
") FnValue;
		opencascade::handle<HeaderSection_FileName> FnValue();

		/****************** FsValue ******************/
		/**** md5 signature: c8a4cff4875f3713ab08524574c21b3d ****/
		%feature("compactdefaultargs") FsValue;
		%feature("autodoc", "Returns the file_schema entity. returns an empty entity if the file_schema entity is not initialized.

Returns
-------
opencascade::handle<HeaderSection_FileSchema>
") FsValue;
		opencascade::handle<HeaderSection_FileSchema> FsValue();

		/****************** HasFd ******************/
		/**** md5 signature: 3e3e6b526b3805f902bd9b9718341d83 ****/
		%feature("compactdefaultargs") HasFd;
		%feature("autodoc", "Checks whether there is a file_description entity. returns true if there is one.

Returns
-------
bool
") HasFd;
		Standard_Boolean HasFd();

		/****************** HasFn ******************/
		/**** md5 signature: 22abe5d4b1e7cc9f85b888c01240ca09 ****/
		%feature("compactdefaultargs") HasFn;
		%feature("autodoc", "Checks whether there is a file_name entity. returns true if there is one.

Returns
-------
bool
") HasFn;
		Standard_Boolean HasFn();

		/****************** HasFs ******************/
		/**** md5 signature: 89a6bd5da2c2843e66a711cfaa6d599b ****/
		%feature("compactdefaultargs") HasFs;
		%feature("autodoc", "Checks whether there is a file_schema entity. returns true if there is one.

Returns
-------
bool
") HasFs;
		Standard_Boolean HasFs();

		/****************** ImplementationLevel ******************/
		/**** md5 signature: b09f681ece8c976e12d39e35c7caa9fe ****/
		%feature("compactdefaultargs") ImplementationLevel;
		%feature("autodoc", "Returns the value of the implementation_level attribute for the file_description entity.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") ImplementationLevel;
		opencascade::handle<TCollection_HAsciiString> ImplementationLevel();

		/****************** Init ******************/
		/**** md5 signature: 95810cfe4820451da1da0554cb350c5c ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Cancels the former definition and gives a filename to be used when a model has no well defined header.

Parameters
----------
nameval: str

Returns
-------
None
") Init;
		void Init(Standard_CString nameval);

		/****************** IsDone ******************/
		/**** md5 signature: ec0624071ec7da54b3d9dacc7bcb05f9 ****/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Returns true if all data have been defined (see also hasfn, hasfs, hasfd).

Returns
-------
bool
") IsDone;
		Standard_Boolean IsDone();

		/****************** Name ******************/
		/**** md5 signature: 6bcb97f17b57cae0750fd29eac20499c ****/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "Returns the name attribute for the file_name entity.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") Name;
		opencascade::handle<TCollection_HAsciiString> Name();

		/****************** NbAuthor ******************/
		/**** md5 signature: 6ca174c13a42409600e9909ad554980b ****/
		%feature("compactdefaultargs") NbAuthor;
		%feature("autodoc", "Returns the number of values for the author attribute in the file_name entity.

Returns
-------
int
") NbAuthor;
		Standard_Integer NbAuthor();

		/****************** NbDescription ******************/
		/**** md5 signature: 38d1fdc13e41b3ac019bdb2d4ba64b1e ****/
		%feature("compactdefaultargs") NbDescription;
		%feature("autodoc", "Returns the number of values for the file_description entity in the step file header.

Returns
-------
int
") NbDescription;
		Standard_Integer NbDescription();

		/****************** NbOrganization ******************/
		/**** md5 signature: 60ebd0ae36d49c04683d7f95b2a097f9 ****/
		%feature("compactdefaultargs") NbOrganization;
		%feature("autodoc", "Returns the number of values for the organization attribute in the file_name entity.

Returns
-------
int
") NbOrganization;
		Standard_Integer NbOrganization();

		/****************** NbSchemaIdentifiers ******************/
		/**** md5 signature: 260454647efe5048cae47a1a4cd460a4 ****/
		%feature("compactdefaultargs") NbSchemaIdentifiers;
		%feature("autodoc", "Returns the number of values for the schema_identifier attribute in the file_schema entity.

Returns
-------
int
") NbSchemaIdentifiers;
		Standard_Integer NbSchemaIdentifiers();

		/****************** NewModel ******************/
		/**** md5 signature: 35ddc5a32982d5512b348f225233e219 ****/
		%feature("compactdefaultargs") NewModel;
		%feature("autodoc", "Builds a header, creates a new stepmodel, then applies the header to the stepmodel the schema name is taken from the protocol (if it inherits from stepdata, else it is left in blanks).

Parameters
----------
protocol: Interface_Protocol

Returns
-------
opencascade::handle<StepData_StepModel>
") NewModel;
		opencascade::handle<StepData_StepModel> NewModel(const opencascade::handle<Interface_Protocol> & protocol);

		/****************** Organization ******************/
		/**** md5 signature: 454248c33742fc33d8c2d44c0e083d34 ****/
		%feature("compactdefaultargs") Organization;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<Interface_HArray1OfHAsciiString>
") Organization;
		opencascade::handle<Interface_HArray1OfHAsciiString> Organization();

		/****************** OrganizationValue ******************/
		/**** md5 signature: 3caa7e153a3d6decf2c39d267a41eb95 ****/
		%feature("compactdefaultargs") OrganizationValue;
		%feature("autodoc", "Returns the value of attribute organization for the file_name entity.

Parameters
----------
num: int

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") OrganizationValue;
		opencascade::handle<TCollection_HAsciiString> OrganizationValue(const Standard_Integer num);

		/****************** OriginatingSystem ******************/
		/**** md5 signature: 543b855a9c992957f432135cf086f1e1 ****/
		%feature("compactdefaultargs") OriginatingSystem;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") OriginatingSystem;
		opencascade::handle<TCollection_HAsciiString> OriginatingSystem();

		/****************** PreprocessorVersion ******************/
		/**** md5 signature: 2cdc579887f56c912417c5ff0ccd068c ****/
		%feature("compactdefaultargs") PreprocessorVersion;
		%feature("autodoc", "Returns the name of the preprocessor_version for the file_name entity.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") PreprocessorVersion;
		opencascade::handle<TCollection_HAsciiString> PreprocessorVersion();

		/****************** SchemaIdentifiers ******************/
		/**** md5 signature: 404b25dfbdf2c6acd6d96aec78411851 ****/
		%feature("compactdefaultargs") SchemaIdentifiers;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<Interface_HArray1OfHAsciiString>
") SchemaIdentifiers;
		opencascade::handle<Interface_HArray1OfHAsciiString> SchemaIdentifiers();

		/****************** SchemaIdentifiersValue ******************/
		/**** md5 signature: ba505a8bd6bc4c707e90011f1b54457f ****/
		%feature("compactdefaultargs") SchemaIdentifiersValue;
		%feature("autodoc", "Returns the value of the schema_identifier attribute for the file_schema entity.

Parameters
----------
num: int

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") SchemaIdentifiersValue;
		opencascade::handle<TCollection_HAsciiString> SchemaIdentifiersValue(const Standard_Integer num);

		/****************** SetAuthor ******************/
		/**** md5 signature: c479de6bbe2aeb24d60e92667b68a0af ****/
		%feature("compactdefaultargs") SetAuthor;
		%feature("autodoc", "No available documentation.

Parameters
----------
aAuthor: Interface_HArray1OfHAsciiString

Returns
-------
None
") SetAuthor;
		void SetAuthor(const opencascade::handle<Interface_HArray1OfHAsciiString> & aAuthor);

		/****************** SetAuthorValue ******************/
		/**** md5 signature: cc33232c8663abd7f2ca48f6203f9736 ****/
		%feature("compactdefaultargs") SetAuthorValue;
		%feature("autodoc", "No available documentation.

Parameters
----------
num: int
aAuthor: TCollection_HAsciiString

Returns
-------
None
") SetAuthorValue;
		void SetAuthorValue(const Standard_Integer num, const opencascade::handle<TCollection_HAsciiString> & aAuthor);

		/****************** SetAuthorisation ******************/
		/**** md5 signature: dabbd55c5d2fdde44a103b7c5629df5c ****/
		%feature("compactdefaultargs") SetAuthorisation;
		%feature("autodoc", "No available documentation.

Parameters
----------
aAuthorisation: TCollection_HAsciiString

Returns
-------
None
") SetAuthorisation;
		void SetAuthorisation(const opencascade::handle<TCollection_HAsciiString> & aAuthorisation);

		/****************** SetDescription ******************/
		/**** md5 signature: 1e04b25950c14571044a08d553341bd0 ****/
		%feature("compactdefaultargs") SetDescription;
		%feature("autodoc", "No available documentation.

Parameters
----------
aDescription: Interface_HArray1OfHAsciiString

Returns
-------
None
") SetDescription;
		void SetDescription(const opencascade::handle<Interface_HArray1OfHAsciiString> & aDescription);

		/****************** SetDescriptionValue ******************/
		/**** md5 signature: a8f2c66c20e21c2385f52a8fd239e40f ****/
		%feature("compactdefaultargs") SetDescriptionValue;
		%feature("autodoc", "No available documentation.

Parameters
----------
num: int
aDescription: TCollection_HAsciiString

Returns
-------
None
") SetDescriptionValue;
		void SetDescriptionValue(const Standard_Integer num, const opencascade::handle<TCollection_HAsciiString> & aDescription);

		/****************** SetImplementationLevel ******************/
		/**** md5 signature: 456c2b949d32712489902f181c0fdd2e ****/
		%feature("compactdefaultargs") SetImplementationLevel;
		%feature("autodoc", "No available documentation.

Parameters
----------
aImplementationLevel: TCollection_HAsciiString

Returns
-------
None
") SetImplementationLevel;
		void SetImplementationLevel(const opencascade::handle<TCollection_HAsciiString> & aImplementationLevel);

		/****************** SetName ******************/
		/**** md5 signature: 1e0b00d9eb163c8a0cdbb986e2ee24f6 ****/
		%feature("compactdefaultargs") SetName;
		%feature("autodoc", "No available documentation.

Parameters
----------
aName: TCollection_HAsciiString

Returns
-------
None
") SetName;
		void SetName(const opencascade::handle<TCollection_HAsciiString> & aName);

		/****************** SetOrganization ******************/
		/**** md5 signature: 898ebb6b0632041f91e1f21a8a1ca169 ****/
		%feature("compactdefaultargs") SetOrganization;
		%feature("autodoc", "No available documentation.

Parameters
----------
aOrganization: Interface_HArray1OfHAsciiString

Returns
-------
None
") SetOrganization;
		void SetOrganization(const opencascade::handle<Interface_HArray1OfHAsciiString> & aOrganization);

		/****************** SetOrganizationValue ******************/
		/**** md5 signature: fe8a80aaa470fd8e2239e6f20b14ee57 ****/
		%feature("compactdefaultargs") SetOrganizationValue;
		%feature("autodoc", "No available documentation.

Parameters
----------
num: int
aOrganization: TCollection_HAsciiString

Returns
-------
None
") SetOrganizationValue;
		void SetOrganizationValue(const Standard_Integer num, const opencascade::handle<TCollection_HAsciiString> & aOrganization);

		/****************** SetOriginatingSystem ******************/
		/**** md5 signature: df50b03f270ab4067d00a9b263849945 ****/
		%feature("compactdefaultargs") SetOriginatingSystem;
		%feature("autodoc", "No available documentation.

Parameters
----------
aOriginatingSystem: TCollection_HAsciiString

Returns
-------
None
") SetOriginatingSystem;
		void SetOriginatingSystem(const opencascade::handle<TCollection_HAsciiString> & aOriginatingSystem);

		/****************** SetPreprocessorVersion ******************/
		/**** md5 signature: cf1be8e1fadf8f579cf193da0139a1b2 ****/
		%feature("compactdefaultargs") SetPreprocessorVersion;
		%feature("autodoc", "No available documentation.

Parameters
----------
aPreprocessorVersion: TCollection_HAsciiString

Returns
-------
None
") SetPreprocessorVersion;
		void SetPreprocessorVersion(const opencascade::handle<TCollection_HAsciiString> & aPreprocessorVersion);

		/****************** SetSchemaIdentifiers ******************/
		/**** md5 signature: 37a42703d2ec981a51e918549381152b ****/
		%feature("compactdefaultargs") SetSchemaIdentifiers;
		%feature("autodoc", "No available documentation.

Parameters
----------
aSchemaIdentifiers: Interface_HArray1OfHAsciiString

Returns
-------
None
") SetSchemaIdentifiers;
		void SetSchemaIdentifiers(const opencascade::handle<Interface_HArray1OfHAsciiString> & aSchemaIdentifiers);

		/****************** SetSchemaIdentifiersValue ******************/
		/**** md5 signature: 0af7d48de5cd14a190015f37164e5d73 ****/
		%feature("compactdefaultargs") SetSchemaIdentifiersValue;
		%feature("autodoc", "No available documentation.

Parameters
----------
num: int
aSchemaIdentifier: TCollection_HAsciiString

Returns
-------
None
") SetSchemaIdentifiersValue;
		void SetSchemaIdentifiersValue(const Standard_Integer num, const opencascade::handle<TCollection_HAsciiString> & aSchemaIdentifier);

		/****************** SetTimeStamp ******************/
		/**** md5 signature: 38e2ba6d611ac3c71ddded5966b2c9a2 ****/
		%feature("compactdefaultargs") SetTimeStamp;
		%feature("autodoc", "No available documentation.

Parameters
----------
aTimeStamp: TCollection_HAsciiString

Returns
-------
None
") SetTimeStamp;
		void SetTimeStamp(const opencascade::handle<TCollection_HAsciiString> & aTimeStamp);

		/****************** TimeStamp ******************/
		/**** md5 signature: b66adf354c77d407fbbc52d9a834d10f ****/
		%feature("compactdefaultargs") TimeStamp;
		%feature("autodoc", "Returns the value of the time_stamp attribute for the file_name entity.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") TimeStamp;
		opencascade::handle<TCollection_HAsciiString> TimeStamp();

};


%extend APIHeaderSection_MakeHeader {
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
