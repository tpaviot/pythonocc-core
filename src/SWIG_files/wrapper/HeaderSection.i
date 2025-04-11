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

		/****** HeaderSection_FileDescription::DescriptionValue ******/
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
No available documentation.
") DescriptionValue;
		opencascade::handle<TCollection_HAsciiString> DescriptionValue(const Standard_Integer num);

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
		/****** md5 signature: 7128d17c37edef86aec4a1be30c00b0d ******/
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
		void Init(const opencascade::handle<Interface_HArray1OfHAsciiString> & aDescription, const opencascade::handle<TCollection_HAsciiString> & aImplementationLevel);

		/****** HeaderSection_FileDescription::NbDescription ******/
		/****** md5 signature: 38d1fdc13e41b3ac019bdb2d4ba64b1e ******/
		%feature("compactdefaultargs") NbDescription;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbDescription;
		Standard_Integer NbDescription();

		/****** HeaderSection_FileDescription::SetDescription ******/
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

		/****** HeaderSection_FileName::AuthorValue ******/
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
No available documentation.
") AuthorValue;
		opencascade::handle<TCollection_HAsciiString> AuthorValue(const Standard_Integer num);

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
		/****** md5 signature: 44503452022fad3cefe24809ca1b4012 ******/
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
		void Init(const opencascade::handle<TCollection_HAsciiString> & aName, const opencascade::handle<TCollection_HAsciiString> & aTimeStamp, const opencascade::handle<Interface_HArray1OfHAsciiString> & aAuthor, const opencascade::handle<Interface_HArray1OfHAsciiString> & aOrganization, const opencascade::handle<TCollection_HAsciiString> & aPreprocessorVersion, const opencascade::handle<TCollection_HAsciiString> & aOriginatingSystem, const opencascade::handle<TCollection_HAsciiString> & aAuthorisation);

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
		/****** md5 signature: 6ca174c13a42409600e9909ad554980b ******/
		%feature("compactdefaultargs") NbAuthor;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbAuthor;
		Standard_Integer NbAuthor();

		/****** HeaderSection_FileName::NbOrganization ******/
		/****** md5 signature: 60ebd0ae36d49c04683d7f95b2a097f9 ******/
		%feature("compactdefaultargs") NbOrganization;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbOrganization;
		Standard_Integer NbOrganization();

		/****** HeaderSection_FileName::Organization ******/
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

		/****** HeaderSection_FileName::OrganizationValue ******/
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
No available documentation.
") OrganizationValue;
		opencascade::handle<TCollection_HAsciiString> OrganizationValue(const Standard_Integer num);

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
		/****** md5 signature: 81dabf26ee55142bf1caba66e8ddb2cc ******/
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
		void Init(const opencascade::handle<Interface_HArray1OfHAsciiString> & aSchemaIdentifiers);

		/****** HeaderSection_FileSchema::NbSchemaIdentifiers ******/
		/****** md5 signature: 260454647efe5048cae47a1a4cd460a4 ******/
		%feature("compactdefaultargs") NbSchemaIdentifiers;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbSchemaIdentifiers;
		Standard_Integer NbSchemaIdentifiers();

		/****** HeaderSection_FileSchema::SchemaIdentifiers ******/
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

		/****** HeaderSection_FileSchema::SchemaIdentifiersValue ******/
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
No available documentation.
") SchemaIdentifiersValue;
		opencascade::handle<TCollection_HAsciiString> SchemaIdentifiersValue(const Standard_Integer num);

		/****** HeaderSection_FileSchema::SetSchemaIdentifiers ******/
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
		/****** md5 signature: 0c51a9fc74d66689427470d02465afcd ******/
		%feature("compactdefaultargs") SchemaName;
		%feature("autodoc", "
Parameters
----------
&: Interface_InterfaceModel

Return
-------
str

Description
-----------
No available documentation.
") SchemaName;
		virtual Standard_CString SchemaName(const opencascade::handle<Interface_InterfaceModel > &);

		/****** HeaderSection_Protocol::TypeNumber ******/
		/****** md5 signature: f4ed4f2e12d80f3bd752f6dd34ed84b4 ******/
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
		virtual Standard_Integer TypeNumber(const opencascade::handle<Standard_Type> & atype);

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
