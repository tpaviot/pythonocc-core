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
%define HEADERSECTIONDOCSTRING
"HeaderSection module, see official documentation at
https://www.opencascade.com/doc/occt-7.6.0/refman/html/package_headersection.html"
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
		/****************** Protocol ******************/
		/**** md5 signature: 11a7387c78917caf0804d82e3b531bd3 ****/
		%feature("compactdefaultargs") Protocol;
		%feature("autodoc", "Creates a protocol.

Returns
-------
opencascade::handle<HeaderSection_Protocol>
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
		/****************** HeaderSection_FileDescription ******************/
		/**** md5 signature: b91e3e417aa1b27a136cf9eca2c87441 ****/
		%feature("compactdefaultargs") HeaderSection_FileDescription;
		%feature("autodoc", "Returns a filedescription.

Returns
-------
None
") HeaderSection_FileDescription;
		 HeaderSection_FileDescription();

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
		%feature("autodoc", "No available documentation.

Parameters
----------
num: int

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") DescriptionValue;
		opencascade::handle<TCollection_HAsciiString> DescriptionValue(const Standard_Integer num);

		/****************** ImplementationLevel ******************/
		/**** md5 signature: b09f681ece8c976e12d39e35c7caa9fe ****/
		%feature("compactdefaultargs") ImplementationLevel;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") ImplementationLevel;
		opencascade::handle<TCollection_HAsciiString> ImplementationLevel();

		/****************** Init ******************/
		/**** md5 signature: 7128d17c37edef86aec4a1be30c00b0d ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Parameters
----------
aDescription: Interface_HArray1OfHAsciiString
aImplementationLevel: TCollection_HAsciiString

Returns
-------
None
") Init;
		void Init(const opencascade::handle<Interface_HArray1OfHAsciiString> & aDescription, const opencascade::handle<TCollection_HAsciiString> & aImplementationLevel);

		/****************** NbDescription ******************/
		/**** md5 signature: 38d1fdc13e41b3ac019bdb2d4ba64b1e ****/
		%feature("compactdefaultargs") NbDescription;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbDescription;
		Standard_Integer NbDescription();

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
		/****************** HeaderSection_FileName ******************/
		/**** md5 signature: 12e19d1be269ce81b5532582031cfc87 ****/
		%feature("compactdefaultargs") HeaderSection_FileName;
		%feature("autodoc", "Returns a filename.

Returns
-------
None
") HeaderSection_FileName;
		 HeaderSection_FileName();

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
		%feature("autodoc", "No available documentation.

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
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") Authorisation;
		opencascade::handle<TCollection_HAsciiString> Authorisation();

		/****************** Init ******************/
		/**** md5 signature: 44503452022fad3cefe24809ca1b4012 ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Parameters
----------
aName: TCollection_HAsciiString
aTimeStamp: TCollection_HAsciiString
aAuthor: Interface_HArray1OfHAsciiString
aOrganization: Interface_HArray1OfHAsciiString
aPreprocessorVersion: TCollection_HAsciiString
aOriginatingSystem: TCollection_HAsciiString
aAuthorisation: TCollection_HAsciiString

Returns
-------
None
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aName, const opencascade::handle<TCollection_HAsciiString> & aTimeStamp, const opencascade::handle<Interface_HArray1OfHAsciiString> & aAuthor, const opencascade::handle<Interface_HArray1OfHAsciiString> & aOrganization, const opencascade::handle<TCollection_HAsciiString> & aPreprocessorVersion, const opencascade::handle<TCollection_HAsciiString> & aOriginatingSystem, const opencascade::handle<TCollection_HAsciiString> & aAuthorisation);

		/****************** Name ******************/
		/**** md5 signature: 6bcb97f17b57cae0750fd29eac20499c ****/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") Name;
		opencascade::handle<TCollection_HAsciiString> Name();

		/****************** NbAuthor ******************/
		/**** md5 signature: 6ca174c13a42409600e9909ad554980b ****/
		%feature("compactdefaultargs") NbAuthor;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbAuthor;
		Standard_Integer NbAuthor();

		/****************** NbOrganization ******************/
		/**** md5 signature: 60ebd0ae36d49c04683d7f95b2a097f9 ****/
		%feature("compactdefaultargs") NbOrganization;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbOrganization;
		Standard_Integer NbOrganization();

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
		%feature("autodoc", "No available documentation.

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
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") PreprocessorVersion;
		opencascade::handle<TCollection_HAsciiString> PreprocessorVersion();

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
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
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
		/****************** HeaderSection_FileSchema ******************/
		/**** md5 signature: 6be678d553e746cbb78cbd48eda0bf45 ****/
		%feature("compactdefaultargs") HeaderSection_FileSchema;
		%feature("autodoc", "Returns a fileschema.

Returns
-------
None
") HeaderSection_FileSchema;
		 HeaderSection_FileSchema();

		/****************** Init ******************/
		/**** md5 signature: 81dabf26ee55142bf1caba66e8ddb2cc ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Parameters
----------
aSchemaIdentifiers: Interface_HArray1OfHAsciiString

Returns
-------
None
") Init;
		void Init(const opencascade::handle<Interface_HArray1OfHAsciiString> & aSchemaIdentifiers);

		/****************** NbSchemaIdentifiers ******************/
		/**** md5 signature: 260454647efe5048cae47a1a4cd460a4 ****/
		%feature("compactdefaultargs") NbSchemaIdentifiers;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbSchemaIdentifiers;
		Standard_Integer NbSchemaIdentifiers();

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
		%feature("autodoc", "No available documentation.

Parameters
----------
num: int

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") SchemaIdentifiersValue;
		opencascade::handle<TCollection_HAsciiString> SchemaIdentifiersValue(const Standard_Integer num);

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
		/****************** HeaderSection_Protocol ******************/
		/**** md5 signature: 07a8203fc52521eee7fa163ebe14ebab ****/
		%feature("compactdefaultargs") HeaderSection_Protocol;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") HeaderSection_Protocol;
		 HeaderSection_Protocol();

		/****************** SchemaName ******************/
		/**** md5 signature: 27a898737676170f03381527c0752a7e ****/
		%feature("compactdefaultargs") SchemaName;
		%feature("autodoc", "No available documentation.

Returns
-------
str
") SchemaName;
		virtual Standard_CString SchemaName();

		/****************** TypeNumber ******************/
		/**** md5 signature: f4ed4f2e12d80f3bd752f6dd34ed84b4 ****/
		%feature("compactdefaultargs") TypeNumber;
		%feature("autodoc", "Returns a case number for each of the headersection entities.

Parameters
----------
atype: Standard_Type

Returns
-------
int
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
