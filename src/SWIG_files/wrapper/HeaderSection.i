/*
Copyright 2008-2026 Thomas Paviot (tpaviot@gmail.com)

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
%define HEADERSECTIONDOCSTRING
"HeaderSection module, see official documentation at
https://dev.opencascade.org/doc/occt-7.9.0/refman/html/package_headersection.html"
%enddef
%module (package="OCC.Core", docstring=HEADERSECTIONDOCSTRING) HeaderSection


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
#include<HeaderSection_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<Interface_module.hxx>
#include<TCollection_module.hxx>
#include<StepData_module.hxx>
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
%import Interface.i
%import TCollection.i
%import StepData.i

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
%wrap_handle(HeaderSection_FileDescription)
%wrap_handle(HeaderSection_FileName)
%wrap_handle(HeaderSection_FileSchema)
%wrap_handle(HeaderSection_Protocol)
/* end handles declaration */

/* templates */
/* end templates declaration */

/* typedefs */
/* end typedefs declaration */

/**********************
* class HeaderSection *
**********************/
%rename(headersection) HeaderSection;
class HeaderSection {
	public:
		/****** HeaderSection::Protocol ******/
		/****** md5 signature: 11a7387c78917caf0804d82e3b531bd3 ******/
		%feature("compactdefaultargs") Protocol;
		%feature("autodoc", "Return
-------
opencascade::handle<HeaderSection_Protocol>

Description
-----------
creates a Protocol.
") Protocol;
		static opencascade::handle<HeaderSection_Protocol> Protocol();

};


%extend HeaderSection {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************************
* class HeaderSection_FileDescription *
**************************************/
class HeaderSection_FileDescription : public Standard_Transient {
	public:
		/****** HeaderSection_FileDescription::HeaderSection_FileDescription ******/
		/****** md5 signature: b91e3e417aa1b27a136cf9eca2c87441 ******/
		%feature("compactdefaultargs") HeaderSection_FileDescription;
		%feature("autodoc", "Return
-------
None

Description
-----------
Returns a FileDescription.
") HeaderSection_FileDescription;
		 HeaderSection_FileDescription();

		/****** HeaderSection_FileDescription::Description ******/
		/****** md5 signature: 38d282c863a2f2de1f822d602e0173c0 ******/
		%feature("compactdefaultargs") Description;
		%feature("autodoc", "Return
-------
opencascade::handle<Interface_HArray1OfHAsciiString>

Description
-----------
No available documentation.
") Description;
		opencascade::handle<Interface_HArray1OfHAsciiString> Description();

		/****** HeaderSection_FileDescription::DescriptionValue ******/
		/****** md5 signature: bb966a700c45a354e0c96ae396f8f968 ******/
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
No available documentation.
") DescriptionValue;
		opencascade::handle<TCollection_HAsciiString> DescriptionValue(const int num);

		/****** HeaderSection_FileDescription::ImplementationLevel ******/
		/****** md5 signature: b09f681ece8c976e12d39e35c7caa9fe ******/
		%feature("compactdefaultargs") ImplementationLevel;
		%feature("autodoc", "Return
-------
opencascade::handle<TCollection_HAsciiString>

Description
-----------
No available documentation.
") ImplementationLevel;
		opencascade::handle<TCollection_HAsciiString> ImplementationLevel();

		/****** HeaderSection_FileDescription::Init ******/
		/****** md5 signature: b4fa0bf47a164851901e9b4e54ff901b ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
aDescription: Interface_HArray1OfHAsciiString
aImplementationLevel: TCollection_HAsciiString

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const opencascade::handle<Interface_HArray1OfHAsciiString > & aDescription, const opencascade::handle<TCollection_HAsciiString> & aImplementationLevel);

		/****** HeaderSection_FileDescription::NbDescription ******/
		/****** md5 signature: 8044f1149bb542652508696e80804de1 ******/
		%feature("compactdefaultargs") NbDescription;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbDescription;
		int NbDescription();

		/****** HeaderSection_FileDescription::SetDescription ******/
		/****** md5 signature: 4df0ff00c92f10fdaec51a394169988b ******/
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
		void SetDescription(const opencascade::handle<Interface_HArray1OfHAsciiString > & aDescription);

		/****** HeaderSection_FileDescription::SetImplementationLevel ******/
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

};


%make_alias(HeaderSection_FileDescription)

%extend HeaderSection_FileDescription {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************
* class HeaderSection_FileName *
*******************************/
class HeaderSection_FileName : public Standard_Transient {
	public:
		/****** HeaderSection_FileName::HeaderSection_FileName ******/
		/****** md5 signature: 12e19d1be269ce81b5532582031cfc87 ******/
		%feature("compactdefaultargs") HeaderSection_FileName;
		%feature("autodoc", "Return
-------
None

Description
-----------
Returns a FileName.
") HeaderSection_FileName;
		 HeaderSection_FileName();

		/****** HeaderSection_FileName::Author ******/
		/****** md5 signature: b0bdd945c93b701d5ac2f01ddee54e0e ******/
		%feature("compactdefaultargs") Author;
		%feature("autodoc", "Return
-------
opencascade::handle<Interface_HArray1OfHAsciiString>

Description
-----------
No available documentation.
") Author;
		opencascade::handle<Interface_HArray1OfHAsciiString> Author();

		/****** HeaderSection_FileName::AuthorValue ******/
		/****** md5 signature: 7f81943772f25bd3f67bfcd57e5b0d0b ******/
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
No available documentation.
") AuthorValue;
		opencascade::handle<TCollection_HAsciiString> AuthorValue(const int num);

		/****** HeaderSection_FileName::Authorisation ******/
		/****** md5 signature: 74cf5a9ad29d5b5b00394896d05f442b ******/
		%feature("compactdefaultargs") Authorisation;
		%feature("autodoc", "Return
-------
opencascade::handle<TCollection_HAsciiString>

Description
-----------
No available documentation.
") Authorisation;
		opencascade::handle<TCollection_HAsciiString> Authorisation();

		/****** HeaderSection_FileName::Init ******/
		/****** md5 signature: b46bb5e3a553f8920fa185c69f66823d ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
aName: TCollection_HAsciiString
aTimeStamp: TCollection_HAsciiString
aAuthor: Interface_HArray1OfHAsciiString
aOrganization: Interface_HArray1OfHAsciiString
aPreprocessorVersion: TCollection_HAsciiString
aOriginatingSystem: TCollection_HAsciiString
aAuthorisation: TCollection_HAsciiString

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aName, const opencascade::handle<TCollection_HAsciiString> & aTimeStamp, const opencascade::handle<Interface_HArray1OfHAsciiString > & aAuthor, const opencascade::handle<Interface_HArray1OfHAsciiString > & aOrganization, const opencascade::handle<TCollection_HAsciiString> & aPreprocessorVersion, const opencascade::handle<TCollection_HAsciiString> & aOriginatingSystem, const opencascade::handle<TCollection_HAsciiString> & aAuthorisation);

		/****** HeaderSection_FileName::Name ******/
		/****** md5 signature: 6bcb97f17b57cae0750fd29eac20499c ******/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "Return
-------
opencascade::handle<TCollection_HAsciiString>

Description
-----------
No available documentation.
") Name;
		opencascade::handle<TCollection_HAsciiString> Name();

		/****** HeaderSection_FileName::NbAuthor ******/
		/****** md5 signature: 96b1e489ed3a97468127de82fc1c6751 ******/
		%feature("compactdefaultargs") NbAuthor;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbAuthor;
		int NbAuthor();

		/****** HeaderSection_FileName::NbOrganization ******/
		/****** md5 signature: 4e7d1d03cfdd4fda4b0c57aaa6e99a4b ******/
		%feature("compactdefaultargs") NbOrganization;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbOrganization;
		int NbOrganization();

		/****** HeaderSection_FileName::Organization ******/
		/****** md5 signature: 636a95aae8a6296f54c50ccec6640102 ******/
		%feature("compactdefaultargs") Organization;
		%feature("autodoc", "Return
-------
opencascade::handle<Interface_HArray1OfHAsciiString>

Description
-----------
No available documentation.
") Organization;
		opencascade::handle<Interface_HArray1OfHAsciiString> Organization();

		/****** HeaderSection_FileName::OrganizationValue ******/
		/****** md5 signature: e20ad0422367d001d1467461cc709c58 ******/
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
No available documentation.
") OrganizationValue;
		opencascade::handle<TCollection_HAsciiString> OrganizationValue(const int num);

		/****** HeaderSection_FileName::OriginatingSystem ******/
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

		/****** HeaderSection_FileName::PreprocessorVersion ******/
		/****** md5 signature: 2cdc579887f56c912417c5ff0ccd068c ******/
		%feature("compactdefaultargs") PreprocessorVersion;
		%feature("autodoc", "Return
-------
opencascade::handle<TCollection_HAsciiString>

Description
-----------
No available documentation.
") PreprocessorVersion;
		opencascade::handle<TCollection_HAsciiString> PreprocessorVersion();

		/****** HeaderSection_FileName::SetAuthor ******/
		/****** md5 signature: e51f47e37f17d9324e07e9c0aa13c758 ******/
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
		void SetAuthor(const opencascade::handle<Interface_HArray1OfHAsciiString > & aAuthor);

		/****** HeaderSection_FileName::SetAuthorisation ******/
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

		/****** HeaderSection_FileName::SetName ******/
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

		/****** HeaderSection_FileName::SetOrganization ******/
		/****** md5 signature: e394e57eea68717f64a1b350f8eacf57 ******/
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
		void SetOrganization(const opencascade::handle<Interface_HArray1OfHAsciiString > & aOrganization);

		/****** HeaderSection_FileName::SetOriginatingSystem ******/
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

		/****** HeaderSection_FileName::SetPreprocessorVersion ******/
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

		/****** HeaderSection_FileName::SetTimeStamp ******/
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

		/****** HeaderSection_FileName::TimeStamp ******/
		/****** md5 signature: b66adf354c77d407fbbc52d9a834d10f ******/
		%feature("compactdefaultargs") TimeStamp;
		%feature("autodoc", "Return
-------
opencascade::handle<TCollection_HAsciiString>

Description
-----------
No available documentation.
") TimeStamp;
		opencascade::handle<TCollection_HAsciiString> TimeStamp();

};


%make_alias(HeaderSection_FileName)

%extend HeaderSection_FileName {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************
* class HeaderSection_FileSchema *
*********************************/
class HeaderSection_FileSchema : public Standard_Transient {
	public:
		/****** HeaderSection_FileSchema::HeaderSection_FileSchema ******/
		/****** md5 signature: 6be678d553e746cbb78cbd48eda0bf45 ******/
		%feature("compactdefaultargs") HeaderSection_FileSchema;
		%feature("autodoc", "Return
-------
None

Description
-----------
Returns a FileSchema.
") HeaderSection_FileSchema;
		 HeaderSection_FileSchema();

		/****** HeaderSection_FileSchema::Init ******/
		/****** md5 signature: d4674561305afc13ae81245813d51326 ******/
		%feature("compactdefaultargs") Init;
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
") Init;
		void Init(const opencascade::handle<Interface_HArray1OfHAsciiString > & aSchemaIdentifiers);

		/****** HeaderSection_FileSchema::NbSchemaIdentifiers ******/
		/****** md5 signature: e412b6c0f1cad5321fc12eadc7d3460c ******/
		%feature("compactdefaultargs") NbSchemaIdentifiers;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbSchemaIdentifiers;
		int NbSchemaIdentifiers();

		/****** HeaderSection_FileSchema::SchemaIdentifiers ******/
		/****** md5 signature: f6de1eebef8c31cb820b98071c27da9e ******/
		%feature("compactdefaultargs") SchemaIdentifiers;
		%feature("autodoc", "Return
-------
opencascade::handle<Interface_HArray1OfHAsciiString>

Description
-----------
No available documentation.
") SchemaIdentifiers;
		opencascade::handle<Interface_HArray1OfHAsciiString> SchemaIdentifiers();

		/****** HeaderSection_FileSchema::SchemaIdentifiersValue ******/
		/****** md5 signature: d701b10128ce855b9eafbc3c2bfe2aa8 ******/
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
No available documentation.
") SchemaIdentifiersValue;
		opencascade::handle<TCollection_HAsciiString> SchemaIdentifiersValue(const int num);

		/****** HeaderSection_FileSchema::SetSchemaIdentifiers ******/
		/****** md5 signature: da2038246e89f34ed20102bdc6e6a1cb ******/
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
		void SetSchemaIdentifiers(const opencascade::handle<Interface_HArray1OfHAsciiString > & aSchemaIdentifiers);

};


%make_alias(HeaderSection_FileSchema)

%extend HeaderSection_FileSchema {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************
* class HeaderSection_Protocol *
*******************************/
class HeaderSection_Protocol : public StepData_Protocol {
	public:
		/****** HeaderSection_Protocol::HeaderSection_Protocol ******/
		/****** md5 signature: 07a8203fc52521eee7fa163ebe14ebab ******/
		%feature("compactdefaultargs") HeaderSection_Protocol;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") HeaderSection_Protocol;
		 HeaderSection_Protocol();

		/****** HeaderSection_Protocol::SchemaName ******/
		/****** md5 signature: b5d757eab72263079e1ac90c0e4c80cc ******/
		%feature("compactdefaultargs") SchemaName;
		%feature("autodoc", "
Parameters
----------
&: Interface_InterfaceModel

Return
-------
char *

Description
-----------
No available documentation.
") SchemaName;
		const char * SchemaName(const opencascade::handle<Interface_InterfaceModel > &);

		/****** HeaderSection_Protocol::TypeNumber ******/
		/****** md5 signature: bbae632533589e3c2443854ef12e6cb8 ******/
		%feature("compactdefaultargs") TypeNumber;
		%feature("autodoc", "
Parameters
----------
atype: Standard_Type

Return
-------
int

Description
-----------
Returns a Case Number for each of the HeaderSection Entities.
") TypeNumber;
		int TypeNumber(const opencascade::handle<Standard_Type> & atype);

};


%make_alias(HeaderSection_Protocol)

%extend HeaderSection_Protocol {
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
def headersection_Protocol(*args):
	return headersection.Protocol(*args)

}
