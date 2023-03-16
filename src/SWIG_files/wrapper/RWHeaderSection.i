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
%define RWHEADERSECTIONDOCSTRING
"RWHeaderSection module, see official documentation at
https://www.opencascade.com/doc/occt-7.6.0/refman/html/package_rwheadersection.html"
%enddef
%module (package="OCC.Core", docstring=RWHEADERSECTIONDOCSTRING) RWHeaderSection


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
#include<RWHeaderSection_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<StepData_module.hxx>
#include<Interface_module.hxx>
#include<HeaderSection_module.hxx>
#include<TCollection_module.hxx>
#include<TColStd_module.hxx>
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
%import StepData.i
%import Interface.i
%import HeaderSection.i
%import TCollection.i
%import TColStd.i

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
%wrap_handle(RWHeaderSection_GeneralModule)
%wrap_handle(RWHeaderSection_ReadWriteModule)
/* end handles declaration */

/* templates */
/* end templates declaration */

/* typedefs */
/* end typedefs declaration */

/************************
* class RWHeaderSection *
************************/
%rename(rwheadersection) RWHeaderSection;
class RWHeaderSection {
	public:
		/****************** Init ******************/
		/**** md5 signature: 342fdccc4643f67c269591c4b6447108 ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Enforced the initialisation of the libraries.

Returns
-------
None
") Init;
		static void Init();

};


%extend RWHeaderSection {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************************
* class RWHeaderSection_GeneralModule *
**************************************/
class RWHeaderSection_GeneralModule : public StepData_GeneralModule {
	public:
		/****************** RWHeaderSection_GeneralModule ******************/
		/**** md5 signature: 574d3e321d0fdd107ff8d14e8c93e5c7 ****/
		%feature("compactdefaultargs") RWHeaderSection_GeneralModule;
		%feature("autodoc", "Creates a generalmodule.

Returns
-------
None
") RWHeaderSection_GeneralModule;
		 RWHeaderSection_GeneralModule();

		/****************** CheckCase ******************/
		/**** md5 signature: d232fb3d35ada68a901b85a0af289c46 ****/
		%feature("compactdefaultargs") CheckCase;
		%feature("autodoc", "Specific checking of an entity <ent>.

Parameters
----------
CN: int
ent: Standard_Transient
shares: Interface_ShareTool
ach: Interface_Check

Returns
-------
None
") CheckCase;
		void CheckCase(const Standard_Integer CN, const opencascade::handle<Standard_Transient> & ent, const Interface_ShareTool & shares, opencascade::handle<Interface_Check> & ach);

		/****************** CopyCase ******************/
		/**** md5 signature: 13c34a46cee20a3c1fc929ba0a39372a ****/
		%feature("compactdefaultargs") CopyCase;
		%feature("autodoc", "Specific copy ('deep') from <entfrom> to <entto> (same type) by using a copytool which provides its working map. use method transferred from copytool to work.

Parameters
----------
CN: int
entfrom: Standard_Transient
entto: Standard_Transient
TC: Interface_CopyTool

Returns
-------
None
") CopyCase;
		void CopyCase(const Standard_Integer CN, const opencascade::handle<Standard_Transient> & entfrom, const opencascade::handle<Standard_Transient> & entto, Interface_CopyTool & TC);

		/****************** FillSharedCase ******************/
		/**** md5 signature: 7bbac4d621ea60d6990c803dbf4b2897 ****/
		%feature("compactdefaultargs") FillSharedCase;
		%feature("autodoc", "Specific filling of the list of entities shared by an entity <ent>, according to a case number <cn> (provided by headersection protocol).

Parameters
----------
CN: int
ent: Standard_Transient
iter: Interface_EntityIterator

Returns
-------
None
") FillSharedCase;
		void FillSharedCase(const Standard_Integer CN, const opencascade::handle<Standard_Transient> & ent, Interface_EntityIterator & iter);

		/****************** NewVoid ******************/
		/**** md5 signature: 4fde8c90ab404df0bdf27545a8f246ee ****/
		%feature("compactdefaultargs") NewVoid;
		%feature("autodoc", "No available documentation.

Parameters
----------
CN: int
ent: Standard_Transient

Returns
-------
bool
") NewVoid;
		Standard_Boolean NewVoid(const Standard_Integer CN, opencascade::handle<Standard_Transient> & ent);

};


%make_alias(RWHeaderSection_GeneralModule)

%extend RWHeaderSection_GeneralModule {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************************
* class RWHeaderSection_RWFileDescription *
******************************************/
class RWHeaderSection_RWFileDescription {
	public:
		/****************** RWHeaderSection_RWFileDescription ******************/
		/**** md5 signature: 6f11c737ff2fca00776bface9ebd3376 ****/
		%feature("compactdefaultargs") RWHeaderSection_RWFileDescription;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWHeaderSection_RWFileDescription;
		 RWHeaderSection_RWFileDescription();

		/****************** ReadStep ******************/
		/**** md5 signature: 33afa598f63ba99ba2bb752ac4277d01 ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: HeaderSection_FileDescription

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<HeaderSection_FileDescription> & ent);

		/****************** WriteStep ******************/
		/**** md5 signature: 468e591fa335fc44eceb9a2961427875 ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: HeaderSection_FileDescription

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<HeaderSection_FileDescription> & ent);

};


%extend RWHeaderSection_RWFileDescription {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************************
* class RWHeaderSection_RWFileName *
***********************************/
class RWHeaderSection_RWFileName {
	public:
		/****************** RWHeaderSection_RWFileName ******************/
		/**** md5 signature: cc5a27d8068c5db1f6509cb6ffaaff35 ****/
		%feature("compactdefaultargs") RWHeaderSection_RWFileName;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWHeaderSection_RWFileName;
		 RWHeaderSection_RWFileName();

		/****************** ReadStep ******************/
		/**** md5 signature: 85b0806316890e59952f3929057fec6f ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: HeaderSection_FileName

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<HeaderSection_FileName> & ent);

		/****************** WriteStep ******************/
		/**** md5 signature: cacf8ce2b056b3baedb3a297466e89d7 ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: HeaderSection_FileName

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<HeaderSection_FileName> & ent);

};


%extend RWHeaderSection_RWFileName {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************************
* class RWHeaderSection_RWFileSchema *
*************************************/
class RWHeaderSection_RWFileSchema {
	public:
		/****************** RWHeaderSection_RWFileSchema ******************/
		/**** md5 signature: 26de657d3edf82e637fac588259f3924 ****/
		%feature("compactdefaultargs") RWHeaderSection_RWFileSchema;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWHeaderSection_RWFileSchema;
		 RWHeaderSection_RWFileSchema();

		/****************** ReadStep ******************/
		/**** md5 signature: e93eb0f98723ddf85062911b95595ba7 ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: HeaderSection_FileSchema

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<HeaderSection_FileSchema> & ent);

		/****************** WriteStep ******************/
		/**** md5 signature: 8166e08f5f6f3378f43fd604f7df8b7c ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: HeaderSection_FileSchema

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<HeaderSection_FileSchema> & ent);

};


%extend RWHeaderSection_RWFileSchema {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************************
* class RWHeaderSection_ReadWriteModule *
****************************************/
class RWHeaderSection_ReadWriteModule : public StepData_ReadWriteModule {
	public:
		/****************** RWHeaderSection_ReadWriteModule ******************/
		/**** md5 signature: 47fff2464a4fbace30d2cb232f283f75 ****/
		%feature("compactdefaultargs") RWHeaderSection_ReadWriteModule;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWHeaderSection_ReadWriteModule;
		 RWHeaderSection_ReadWriteModule();

		/****************** CaseStep ******************/
		/**** md5 signature: 2cca48c277ff54a418bb5762c7cc5d5f ****/
		%feature("compactdefaultargs") CaseStep;
		%feature("autodoc", "Associates a positive case number to each type of headersection entity, given as a string defined in the express form.

Parameters
----------
atype: str

Returns
-------
int
") CaseStep;
		Standard_Integer CaseStep(TCollection_AsciiString atype);

		/****************** CaseStep ******************/
		/**** md5 signature: 440149e7ecd34289be9e6811f7462a4e ****/
		%feature("compactdefaultargs") CaseStep;
		%feature("autodoc", "Associates a positive case number to each type of headersection complex entity, given as a string defined in the express form.

Parameters
----------
types: TColStd_SequenceOfAsciiString

Returns
-------
int
") CaseStep;
		virtual Standard_Integer CaseStep(const TColStd_SequenceOfAsciiString & types);

		/****************** IsComplex ******************/
		/**** md5 signature: dd0bb2c37bc5d3007282207d4a702414 ****/
		%feature("compactdefaultargs") IsComplex;
		%feature("autodoc", "Returns true if the case number corresponds to a complex type.

Parameters
----------
CN: int

Returns
-------
bool
") IsComplex;
		virtual Standard_Boolean IsComplex(const Standard_Integer CN);

		/****************** ReadStep ******************/
		/**** md5 signature: 17295e7bfa85126c873c41a911b14793 ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
CN: int
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: Standard_Transient

Returns
-------
None
") ReadStep;
		void ReadStep(const Standard_Integer CN, const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<Standard_Transient> & ent);

		/****************** StepType ******************/
		/**** md5 signature: 6b290c84399e25c2a64848396c483fc8 ****/
		%feature("compactdefaultargs") StepType;
		%feature("autodoc", "Returns a steptype (defined in express form which belongs to a type of entity, identified by its casenumber determined by protocol.

Parameters
----------
CN: int

Returns
-------
TCollection_AsciiString
") StepType;
		const TCollection_AsciiString & StepType(const Standard_Integer CN);

		/****************** WriteStep ******************/
		/**** md5 signature: a2c3b5b5327d581382bef5e4442c834e ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
CN: int
SW: StepData_StepWriter
ent: Standard_Transient

Returns
-------
None
") WriteStep;
		void WriteStep(const Standard_Integer CN, StepData_StepWriter & SW, const opencascade::handle<Standard_Transient> & ent);

};


%make_alias(RWHeaderSection_ReadWriteModule)

%extend RWHeaderSection_ReadWriteModule {
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
