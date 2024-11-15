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
%define APIHEADERSECTIONDOCSTRING
"APIHeaderSection module, see official documentation at
https://dev.opencascade.org/doc/occt-7.8.0/refman/html/package_apiheadersection.html"
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
%include ../common/IOStream.i
%include ../common/ArrayMacros.i


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
		/****** APIHeaderSection_EditHeader::APIHeaderSection_EditHeader ******/
		/****** md5 signature: 2bf08a1315df936c9484c98a1d1baf5a ******/
		%feature("compactdefaultargs") APIHeaderSection_EditHeader;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") APIHeaderSection_EditHeader;
		 APIHeaderSection_EditHeader();

		/****** APIHeaderSection_EditHeader::Apply ******/
		/****** md5 signature: 7128480b7f4b1ff6fd959731640e27fc ******/
		%feature("compactdefaultargs") Apply;
		%feature("autodoc", "
Parameters
----------
form: IFSelect_EditForm
ent: Standard_Transient
model: Interface_InterfaceModel

Return
-------
bool

Description
-----------
No available documentation.
") Apply;
		Standard_Boolean Apply(const opencascade::handle<IFSelect_EditForm> & form, const opencascade::handle<Standard_Transient> & ent, const opencascade::handle<Interface_InterfaceModel> & model);

		/****** APIHeaderSection_EditHeader::Label ******/
		/****** md5 signature: e2fbf0e262882b3e9ec00c539ad3471b ******/
		%feature("compactdefaultargs") Label;
		%feature("autodoc", "Return
-------
TCollection_AsciiString

Description
-----------
No available documentation.
") Label;
		TCollection_AsciiString Label();

		/****** APIHeaderSection_EditHeader::Load ******/
		/****** md5 signature: fbb84192d1ec7737c4c84905239a2df8 ******/
		%feature("compactdefaultargs") Load;
		%feature("autodoc", "
Parameters
----------
form: IFSelect_EditForm
ent: Standard_Transient
model: Interface_InterfaceModel

Return
-------
bool

Description
-----------
No available documentation.
") Load;
		Standard_Boolean Load(const opencascade::handle<IFSelect_EditForm> & form, const opencascade::handle<Standard_Transient> & ent, const opencascade::handle<Interface_InterfaceModel> & model);

		/****** APIHeaderSection_EditHeader::Recognize ******/
		/****** md5 signature: 745b42e0c753cb6baed4d66bbf94e5b8 ******/
		%feature("compactdefaultargs") Recognize;
		%feature("autodoc", "
Parameters
----------
form: IFSelect_EditForm

Return
-------
bool

Description
-----------
No available documentation.
") Recognize;
		Standard_Boolean Recognize(const opencascade::handle<IFSelect_EditForm> & form);

		/****** APIHeaderSection_EditHeader::StringValue ******/
		/****** md5 signature: 4371620dd4c31b906a08f6f8ee98f04a ******/
		%feature("compactdefaultargs") StringValue;
		%feature("autodoc", "
Parameters
----------
form: IFSelect_EditForm
num: int

Return
-------
opencascade::handle<TCollection_HAsciiString>

Description
-----------
No available documentation.
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
		/****** APIHeaderSection_MakeHeader::APIHeaderSection_MakeHeader ******/
		/****** md5 signature: 231ae7cfabfb8525a17a55b5e8098f01 ******/
		%feature("compactdefaultargs") APIHeaderSection_MakeHeader;
		%feature("autodoc", "
Parameters
----------
shapetype: int (optional, default to 0)

Return
-------
None

Description
-----------
Prepares a new makeheader from scratch.
") APIHeaderSection_MakeHeader;
		 APIHeaderSection_MakeHeader(const Standard_Integer shapetype = 0);

		/****** APIHeaderSection_MakeHeader::APIHeaderSection_MakeHeader ******/
		/****** md5 signature: 3bf1a3faeeaf6e2623b6097489a9d879 ******/
		%feature("compactdefaultargs") APIHeaderSection_MakeHeader;
		%feature("autodoc", "
Parameters
----------
model: StepData_StepModel

Return
-------
None

Description
-----------
Prepares a makeheader from the content of a stepmodel see isdone to know if the header is well defined.
") APIHeaderSection_MakeHeader;
		 APIHeaderSection_MakeHeader(const opencascade::handle<StepData_StepModel> & model);

		/****** APIHeaderSection_MakeHeader::AddSchemaIdentifier ******/
		/****** md5 signature: fb971c31ef622fe2699e9896a61d0b7c ******/
		%feature("compactdefaultargs") AddSchemaIdentifier;
		%feature("autodoc", "
Parameters
----------
aSchemaIdentifier: TCollection_HAsciiString

Return
-------
None

Description
-----------
Add a subname of schema (if not yet in the list).
") AddSchemaIdentifier;
		void AddSchemaIdentifier(const opencascade::handle<TCollection_HAsciiString> & aSchemaIdentifier);

		/****** APIHeaderSection_MakeHeader::Apply ******/
		/****** md5 signature: 7a18b7c9dc5aace0d13d1301acc1073f ******/
		%feature("compactdefaultargs") Apply;
		%feature("autodoc", "
Parameters
----------
model: StepData_StepModel

Return
-------
None

Description
-----------
Creates an empty header for a new step model and allows the header fields to be completed.
") Apply;
		void Apply(const opencascade::handle<StepData_StepModel> & model);

		/****** APIHeaderSection_MakeHeader::Author ******/
		/****** md5 signature: 23de40daf6aa0108289fcab1cc10b710 ******/
		%feature("compactdefaultargs") Author;
		%feature("autodoc", "Return
-------
opencascade::handle<Interface_HArray1OfHAsciiString>

Description
-----------
No available documentation.
") Author;
		opencascade::handle<Interface_HArray1OfHAsciiString> Author();

		/****** APIHeaderSection_MakeHeader::AuthorValue ******/
		/****** md5 signature: 053bae3a6f3b50b0b3cbcc10f1448e71 ******/
		%feature("compactdefaultargs") AuthorValue;
		%feature("autodoc", "
Parameters
----------
num: int

Return
-------
opencascade::handle<TCollection_HAsciiString>

Description
-----------
Returns the value of the name attribute for the file_name entity.
") AuthorValue;
		opencascade::handle<TCollection_HAsciiString> AuthorValue(const Standard_Integer num);

		/****** APIHeaderSection_MakeHeader::Authorisation ******/
		/****** md5 signature: 74cf5a9ad29d5b5b00394896d05f442b ******/
		%feature("compactdefaultargs") Authorisation;
		%feature("autodoc", "Return
-------
opencascade::handle<TCollection_HAsciiString>

Description
-----------
Returns the value of the authorization attribute for the file_name entity.
") Authorisation;
		opencascade::handle<TCollection_HAsciiString> Authorisation();

		/****** APIHeaderSection_MakeHeader::Description ******/
		/****** md5 signature: 9b909686a25b7d6265affec4e3820e98 ******/
		%feature("compactdefaultargs") Description;
		%feature("autodoc", "Return
-------
opencascade::handle<Interface_HArray1OfHAsciiString>

Description
-----------
No available documentation.
") Description;
		opencascade::handle<Interface_HArray1OfHAsciiString> Description();

		/****** APIHeaderSection_MakeHeader::DescriptionValue ******/
		/****** md5 signature: c5b8ce5eb4616a323970d217aa88af81 ******/
		%feature("compactdefaultargs") DescriptionValue;
		%feature("autodoc", "
Parameters
----------
num: int

Return
-------
opencascade::handle<TCollection_HAsciiString>

Description
-----------
Returns the value of the description attribute for the file_description entity.
") DescriptionValue;
		opencascade::handle<TCollection_HAsciiString> DescriptionValue(const Standard_Integer num);

		/****** APIHeaderSection_MakeHeader::FdValue ******/
		/****** md5 signature: 399c35af474cdbfb7c29fa336d37d16b ******/
		%feature("compactdefaultargs") FdValue;
		%feature("autodoc", "Return
-------
opencascade::handle<HeaderSection_FileDescription>

Description
-----------
Returns the file_description entity. returns an empty entity if the file_description entity is not initialized.
") FdValue;
		opencascade::handle<HeaderSection_FileDescription> FdValue();

		/****** APIHeaderSection_MakeHeader::FnValue ******/
		/****** md5 signature: 1fce139b98d1ddb3cc6f35b294bb9be7 ******/
		%feature("compactdefaultargs") FnValue;
		%feature("autodoc", "Return
-------
opencascade::handle<HeaderSection_FileName>

Description
-----------
Returns the file_name entity. returns an empty entity if the file_name entity is not initialized.
") FnValue;
		opencascade::handle<HeaderSection_FileName> FnValue();

		/****** APIHeaderSection_MakeHeader::FsValue ******/
		/****** md5 signature: c8a4cff4875f3713ab08524574c21b3d ******/
		%feature("compactdefaultargs") FsValue;
		%feature("autodoc", "Return
-------
opencascade::handle<HeaderSection_FileSchema>

Description
-----------
Returns the file_schema entity. returns an empty entity if the file_schema entity is not initialized.
") FsValue;
		opencascade::handle<HeaderSection_FileSchema> FsValue();

		/****** APIHeaderSection_MakeHeader::HasFd ******/
		/****** md5 signature: 3e3e6b526b3805f902bd9b9718341d83 ******/
		%feature("compactdefaultargs") HasFd;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Checks whether there is a file_description entity. returns true if there is one.
") HasFd;
		Standard_Boolean HasFd();

		/****** APIHeaderSection_MakeHeader::HasFn ******/
		/****** md5 signature: 22abe5d4b1e7cc9f85b888c01240ca09 ******/
		%feature("compactdefaultargs") HasFn;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Checks whether there is a file_name entity. returns true if there is one.
") HasFn;
		Standard_Boolean HasFn();

		/****** APIHeaderSection_MakeHeader::HasFs ******/
		/****** md5 signature: 89a6bd5da2c2843e66a711cfaa6d599b ******/
		%feature("compactdefaultargs") HasFs;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Checks whether there is a file_schema entity. returns true if there is one.
") HasFs;
		Standard_Boolean HasFs();

		/****** APIHeaderSection_MakeHeader::ImplementationLevel ******/
		/****** md5 signature: b09f681ece8c976e12d39e35c7caa9fe ******/
		%feature("compactdefaultargs") ImplementationLevel;
		%feature("autodoc", "Return
-------
opencascade::handle<TCollection_HAsciiString>

Description
-----------
Returns the value of the implementation_level attribute for the file_description entity.
") ImplementationLevel;
		opencascade::handle<TCollection_HAsciiString> ImplementationLevel();

		/****** APIHeaderSection_MakeHeader::Init ******/
		/****** md5 signature: 95810cfe4820451da1da0554cb350c5c ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
nameval: str

Return
-------
None

Description
-----------
Cancels the former definition and gives a filename to be used when a model has no well defined header.
") Init;
		void Init(Standard_CString nameval);

		/****** APIHeaderSection_MakeHeader::IsDone ******/
		/****** md5 signature: ec0624071ec7da54b3d9dacc7bcb05f9 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if all data have been defined (see also hasfn, hasfs, hasfd).
") IsDone;
		Standard_Boolean IsDone();

		/****** APIHeaderSection_MakeHeader::Name ******/
		/****** md5 signature: 6bcb97f17b57cae0750fd29eac20499c ******/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "Return
-------
opencascade::handle<TCollection_HAsciiString>

Description
-----------
Returns the name attribute for the file_name entity.
") Name;
		opencascade::handle<TCollection_HAsciiString> Name();

		/****** APIHeaderSection_MakeHeader::NbAuthor ******/
		/****** md5 signature: 6ca174c13a42409600e9909ad554980b ******/
		%feature("compactdefaultargs") NbAuthor;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of values for the author attribute in the file_name entity.
") NbAuthor;
		Standard_Integer NbAuthor();

		/****** APIHeaderSection_MakeHeader::NbDescription ******/
		/****** md5 signature: 38d1fdc13e41b3ac019bdb2d4ba64b1e ******/
		%feature("compactdefaultargs") NbDescription;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of values for the file_description entity in the step file header.
") NbDescription;
		Standard_Integer NbDescription();

		/****** APIHeaderSection_MakeHeader::NbOrganization ******/
		/****** md5 signature: 60ebd0ae36d49c04683d7f95b2a097f9 ******/
		%feature("compactdefaultargs") NbOrganization;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of values for the organization attribute in the file_name entity.
") NbOrganization;
		Standard_Integer NbOrganization();

		/****** APIHeaderSection_MakeHeader::NbSchemaIdentifiers ******/
		/****** md5 signature: 260454647efe5048cae47a1a4cd460a4 ******/
		%feature("compactdefaultargs") NbSchemaIdentifiers;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of values for the schema_identifier attribute in the file_schema entity.
") NbSchemaIdentifiers;
		Standard_Integer NbSchemaIdentifiers();

		/****** APIHeaderSection_MakeHeader::NewModel ******/
		/****** md5 signature: 35ddc5a32982d5512b348f225233e219 ******/
		%feature("compactdefaultargs") NewModel;
		%feature("autodoc", "
Parameters
----------
protocol: Interface_Protocol

Return
-------
opencascade::handle<StepData_StepModel>

Description
-----------
Builds a header, creates a new stepmodel, then applies the header to the stepmodel the schema name is taken from the protocol (if it inherits from stepdata, else it is left in blanks).
") NewModel;
		opencascade::handle<StepData_StepModel> NewModel(const opencascade::handle<Interface_Protocol> & protocol);

		/****** APIHeaderSection_MakeHeader::Organization ******/
		/****** md5 signature: 454248c33742fc33d8c2d44c0e083d34 ******/
		%feature("compactdefaultargs") Organization;
		%feature("autodoc", "Return
-------
opencascade::handle<Interface_HArray1OfHAsciiString>

Description
-----------
No available documentation.
") Organization;
		opencascade::handle<Interface_HArray1OfHAsciiString> Organization();

		/****** APIHeaderSection_MakeHeader::OrganizationValue ******/
		/****** md5 signature: 3caa7e153a3d6decf2c39d267a41eb95 ******/
		%feature("compactdefaultargs") OrganizationValue;
		%feature("autodoc", "
Parameters
----------
num: int

Return
-------
opencascade::handle<TCollection_HAsciiString>

Description
-----------
Returns the value of attribute organization for the file_name entity.
") OrganizationValue;
		opencascade::handle<TCollection_HAsciiString> OrganizationValue(const Standard_Integer num);

		/****** APIHeaderSection_MakeHeader::OriginatingSystem ******/
		/****** md5 signature: 543b855a9c992957f432135cf086f1e1 ******/
		%feature("compactdefaultargs") OriginatingSystem;
		%feature("autodoc", "Return
-------
opencascade::handle<TCollection_HAsciiString>

Description
-----------
No available documentation.
") OriginatingSystem;
		opencascade::handle<TCollection_HAsciiString> OriginatingSystem();

		/****** APIHeaderSection_MakeHeader::PreprocessorVersion ******/
		/****** md5 signature: 2cdc579887f56c912417c5ff0ccd068c ******/
		%feature("compactdefaultargs") PreprocessorVersion;
		%feature("autodoc", "Return
-------
opencascade::handle<TCollection_HAsciiString>

Description
-----------
Returns the name of the preprocessor_version for the file_name entity.
") PreprocessorVersion;
		opencascade::handle<TCollection_HAsciiString> PreprocessorVersion();

		/****** APIHeaderSection_MakeHeader::SchemaIdentifiers ******/
		/****** md5 signature: 404b25dfbdf2c6acd6d96aec78411851 ******/
		%feature("compactdefaultargs") SchemaIdentifiers;
		%feature("autodoc", "Return
-------
opencascade::handle<Interface_HArray1OfHAsciiString>

Description
-----------
No available documentation.
") SchemaIdentifiers;
		opencascade::handle<Interface_HArray1OfHAsciiString> SchemaIdentifiers();

		/****** APIHeaderSection_MakeHeader::SchemaIdentifiersValue ******/
		/****** md5 signature: ba505a8bd6bc4c707e90011f1b54457f ******/
		%feature("compactdefaultargs") SchemaIdentifiersValue;
		%feature("autodoc", "
Parameters
----------
num: int

Return
-------
opencascade::handle<TCollection_HAsciiString>

Description
-----------
Returns the value of the schema_identifier attribute for the file_schema entity.
") SchemaIdentifiersValue;
		opencascade::handle<TCollection_HAsciiString> SchemaIdentifiersValue(const Standard_Integer num);

		/****** APIHeaderSection_MakeHeader::SetAuthor ******/
		/****** md5 signature: c479de6bbe2aeb24d60e92667b68a0af ******/
		%feature("compactdefaultargs") SetAuthor;
		%feature("autodoc", "
Parameters
----------
aAuthor: Interface_HArray1OfHAsciiString

Return
-------
None

Description
-----------
No available documentation.
") SetAuthor;
		void SetAuthor(const opencascade::handle<Interface_HArray1OfHAsciiString> & aAuthor);

		/****** APIHeaderSection_MakeHeader::SetAuthorValue ******/
		/****** md5 signature: cc33232c8663abd7f2ca48f6203f9736 ******/
		%feature("compactdefaultargs") SetAuthorValue;
		%feature("autodoc", "
Parameters
----------
num: int
aAuthor: TCollection_HAsciiString

Return
-------
None

Description
-----------
No available documentation.
") SetAuthorValue;
		void SetAuthorValue(const Standard_Integer num, const opencascade::handle<TCollection_HAsciiString> & aAuthor);

		/****** APIHeaderSection_MakeHeader::SetAuthorisation ******/
		/****** md5 signature: dabbd55c5d2fdde44a103b7c5629df5c ******/
		%feature("compactdefaultargs") SetAuthorisation;
		%feature("autodoc", "
Parameters
----------
aAuthorisation: TCollection_HAsciiString

Return
-------
None

Description
-----------
No available documentation.
") SetAuthorisation;
		void SetAuthorisation(const opencascade::handle<TCollection_HAsciiString> & aAuthorisation);

		/****** APIHeaderSection_MakeHeader::SetDescription ******/
		/****** md5 signature: 1e04b25950c14571044a08d553341bd0 ******/
		%feature("compactdefaultargs") SetDescription;
		%feature("autodoc", "
Parameters
----------
aDescription: Interface_HArray1OfHAsciiString

Return
-------
None

Description
-----------
No available documentation.
") SetDescription;
		void SetDescription(const opencascade::handle<Interface_HArray1OfHAsciiString> & aDescription);

		/****** APIHeaderSection_MakeHeader::SetDescriptionValue ******/
		/****** md5 signature: a8f2c66c20e21c2385f52a8fd239e40f ******/
		%feature("compactdefaultargs") SetDescriptionValue;
		%feature("autodoc", "
Parameters
----------
num: int
aDescription: TCollection_HAsciiString

Return
-------
None

Description
-----------
No available documentation.
") SetDescriptionValue;
		void SetDescriptionValue(const Standard_Integer num, const opencascade::handle<TCollection_HAsciiString> & aDescription);

		/****** APIHeaderSection_MakeHeader::SetImplementationLevel ******/
		/****** md5 signature: 456c2b949d32712489902f181c0fdd2e ******/
		%feature("compactdefaultargs") SetImplementationLevel;
		%feature("autodoc", "
Parameters
----------
aImplementationLevel: TCollection_HAsciiString

Return
-------
None

Description
-----------
No available documentation.
") SetImplementationLevel;
		void SetImplementationLevel(const opencascade::handle<TCollection_HAsciiString> & aImplementationLevel);

		/****** APIHeaderSection_MakeHeader::SetName ******/
		/****** md5 signature: 1e0b00d9eb163c8a0cdbb986e2ee24f6 ******/
		%feature("compactdefaultargs") SetName;
		%feature("autodoc", "
Parameters
----------
aName: TCollection_HAsciiString

Return
-------
None

Description
-----------
No available documentation.
") SetName;
		void SetName(const opencascade::handle<TCollection_HAsciiString> & aName);

		/****** APIHeaderSection_MakeHeader::SetOrganization ******/
		/****** md5 signature: 898ebb6b0632041f91e1f21a8a1ca169 ******/
		%feature("compactdefaultargs") SetOrganization;
		%feature("autodoc", "
Parameters
----------
aOrganization: Interface_HArray1OfHAsciiString

Return
-------
None

Description
-----------
No available documentation.
") SetOrganization;
		void SetOrganization(const opencascade::handle<Interface_HArray1OfHAsciiString> & aOrganization);

		/****** APIHeaderSection_MakeHeader::SetOrganizationValue ******/
		/****** md5 signature: fe8a80aaa470fd8e2239e6f20b14ee57 ******/
		%feature("compactdefaultargs") SetOrganizationValue;
		%feature("autodoc", "
Parameters
----------
num: int
aOrganization: TCollection_HAsciiString

Return
-------
None

Description
-----------
No available documentation.
") SetOrganizationValue;
		void SetOrganizationValue(const Standard_Integer num, const opencascade::handle<TCollection_HAsciiString> & aOrganization);

		/****** APIHeaderSection_MakeHeader::SetOriginatingSystem ******/
		/****** md5 signature: df50b03f270ab4067d00a9b263849945 ******/
		%feature("compactdefaultargs") SetOriginatingSystem;
		%feature("autodoc", "
Parameters
----------
aOriginatingSystem: TCollection_HAsciiString

Return
-------
None

Description
-----------
No available documentation.
") SetOriginatingSystem;
		void SetOriginatingSystem(const opencascade::handle<TCollection_HAsciiString> & aOriginatingSystem);

		/****** APIHeaderSection_MakeHeader::SetPreprocessorVersion ******/
		/****** md5 signature: cf1be8e1fadf8f579cf193da0139a1b2 ******/
		%feature("compactdefaultargs") SetPreprocessorVersion;
		%feature("autodoc", "
Parameters
----------
aPreprocessorVersion: TCollection_HAsciiString

Return
-------
None

Description
-----------
No available documentation.
") SetPreprocessorVersion;
		void SetPreprocessorVersion(const opencascade::handle<TCollection_HAsciiString> & aPreprocessorVersion);

		/****** APIHeaderSection_MakeHeader::SetSchemaIdentifiers ******/
		/****** md5 signature: 37a42703d2ec981a51e918549381152b ******/
		%feature("compactdefaultargs") SetSchemaIdentifiers;
		%feature("autodoc", "
Parameters
----------
aSchemaIdentifiers: Interface_HArray1OfHAsciiString

Return
-------
None

Description
-----------
No available documentation.
") SetSchemaIdentifiers;
		void SetSchemaIdentifiers(const opencascade::handle<Interface_HArray1OfHAsciiString> & aSchemaIdentifiers);

		/****** APIHeaderSection_MakeHeader::SetSchemaIdentifiersValue ******/
		/****** md5 signature: 0af7d48de5cd14a190015f37164e5d73 ******/
		%feature("compactdefaultargs") SetSchemaIdentifiersValue;
		%feature("autodoc", "
Parameters
----------
num: int
aSchemaIdentifier: TCollection_HAsciiString

Return
-------
None

Description
-----------
No available documentation.
") SetSchemaIdentifiersValue;
		void SetSchemaIdentifiersValue(const Standard_Integer num, const opencascade::handle<TCollection_HAsciiString> & aSchemaIdentifier);

		/****** APIHeaderSection_MakeHeader::SetTimeStamp ******/
		/****** md5 signature: 38e2ba6d611ac3c71ddded5966b2c9a2 ******/
		%feature("compactdefaultargs") SetTimeStamp;
		%feature("autodoc", "
Parameters
----------
aTimeStamp: TCollection_HAsciiString

Return
-------
None

Description
-----------
No available documentation.
") SetTimeStamp;
		void SetTimeStamp(const opencascade::handle<TCollection_HAsciiString> & aTimeStamp);

		/****** APIHeaderSection_MakeHeader::TimeStamp ******/
		/****** md5 signature: b66adf354c77d407fbbc52d9a834d10f ******/
		%feature("compactdefaultargs") TimeStamp;
		%feature("autodoc", "Return
-------
opencascade::handle<TCollection_HAsciiString>

Description
-----------
Returns the value of the time_stamp attribute for the file_name entity.
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
