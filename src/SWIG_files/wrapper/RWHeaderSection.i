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
%define RWHEADERSECTIONDOCSTRING
"RWHeaderSection module, see official documentation at
https://dev.opencascade.org/doc/occt-7.9.0/refman/html/package_rwheadersection.html"
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
%include ../common/IOStream.i
%include ../common/ArrayMacros.i


%{
#include<RWHeaderSection_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<StepData_module.hxx>
#include<Interface_module.hxx>
#include<HeaderSection_module.hxx>
#include<TCollection_module.hxx>
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
		/****** RWHeaderSection::Init ******/
		/****** md5 signature: 342fdccc4643f67c269591c4b6447108 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Return
-------
None

Description
-----------
enforced the initialisation of the libraries.
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
		/****** RWHeaderSection_GeneralModule::RWHeaderSection_GeneralModule ******/
		/****** md5 signature: 574d3e321d0fdd107ff8d14e8c93e5c7 ******/
		%feature("compactdefaultargs") RWHeaderSection_GeneralModule;
		%feature("autodoc", "Return
-------
None

Description
-----------
Creates a GeneralModule.
") RWHeaderSection_GeneralModule;
		 RWHeaderSection_GeneralModule();

		/****** RWHeaderSection_GeneralModule::CheckCase ******/
		/****** md5 signature: d1c7ba6add9212b48bcbb631196567e9 ******/
		%feature("compactdefaultargs") CheckCase;
		%feature("autodoc", "
Parameters
----------
CN: int
ent: Standard_Transient
shares: Interface_ShareTool
ach: Interface_Check

Return
-------
None

Description
-----------
Specific Checking of an Entity <ent>.
") CheckCase;
		void CheckCase(const int CN, const opencascade::handle<Standard_Transient> & ent, const Interface_ShareTool & shares, opencascade::handle<Interface_Check> & ach);

		/****** RWHeaderSection_GeneralModule::CopyCase ******/
		/****** md5 signature: fc38f8790e575e509f035b0523c81b6a ******/
		%feature("compactdefaultargs") CopyCase;
		%feature("autodoc", "
Parameters
----------
CN: int
entfrom: Standard_Transient
entto: Standard_Transient
TC: Interface_CopyTool

Return
-------
None

Description
-----------
Specific Copy ('Deep') from <entfrom> to <entto> (same type) by using a CopyTool which provides its working Map. Use method Transferred from CopyTool to work.
") CopyCase;
		void CopyCase(const int CN, const opencascade::handle<Standard_Transient> & entfrom, const opencascade::handle<Standard_Transient> & entto, Interface_CopyTool & TC);

		/****** RWHeaderSection_GeneralModule::FillSharedCase ******/
		/****** md5 signature: a1af00a8f137f9d8747366c144a8316d ******/
		%feature("compactdefaultargs") FillSharedCase;
		%feature("autodoc", "
Parameters
----------
CN: int
ent: Standard_Transient
iter: Interface_EntityIterator

Return
-------
None

Description
-----------
Specific filling of the list of Entities shared by an Entity <ent>, according to a Case Number <CN> (provided by HeaderSection Protocol).
") FillSharedCase;
		void FillSharedCase(const int CN, const opencascade::handle<Standard_Transient> & ent, Interface_EntityIterator & iter);

		/****** RWHeaderSection_GeneralModule::NewVoid ******/
		/****** md5 signature: a969c9380b4d99ab29040270c13cfeb6 ******/
		%feature("compactdefaultargs") NewVoid;
		%feature("autodoc", "
Parameters
----------
CN: int
ent: Standard_Transient

Return
-------
bool

Description
-----------
No available documentation.
") NewVoid;
		bool NewVoid(const int CN, opencascade::handle<Standard_Transient> & ent);

};


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
		/****** RWHeaderSection_RWFileDescription::RWHeaderSection_RWFileDescription ******/
		/****** md5 signature: 6f11c737ff2fca00776bface9ebd3376 ******/
		%feature("compactdefaultargs") RWHeaderSection_RWFileDescription;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") RWHeaderSection_RWFileDescription;
		 RWHeaderSection_RWFileDescription();

		/****** RWHeaderSection_RWFileDescription::ReadStep ******/
		/****** md5 signature: 326439c41fea015a964e4e298b8e0252 ******/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "
Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: HeaderSection_FileDescription

Return
-------
None

Description
-----------
No available documentation.
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const int num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<HeaderSection_FileDescription> & ent);

		/****** RWHeaderSection_RWFileDescription::WriteStep ******/
		/****** md5 signature: 468e591fa335fc44eceb9a2961427875 ******/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "
Parameters
----------
SW: StepData_StepWriter
ent: HeaderSection_FileDescription

Return
-------
None

Description
-----------
No available documentation.
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
		/****** RWHeaderSection_RWFileName::RWHeaderSection_RWFileName ******/
		/****** md5 signature: cc5a27d8068c5db1f6509cb6ffaaff35 ******/
		%feature("compactdefaultargs") RWHeaderSection_RWFileName;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") RWHeaderSection_RWFileName;
		 RWHeaderSection_RWFileName();

		/****** RWHeaderSection_RWFileName::ReadStep ******/
		/****** md5 signature: d9db254e5351bfb9e7dfbf94e203e2bb ******/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "
Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: HeaderSection_FileName

Return
-------
None

Description
-----------
No available documentation.
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const int num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<HeaderSection_FileName> & ent);

		/****** RWHeaderSection_RWFileName::WriteStep ******/
		/****** md5 signature: cacf8ce2b056b3baedb3a297466e89d7 ******/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "
Parameters
----------
SW: StepData_StepWriter
ent: HeaderSection_FileName

Return
-------
None

Description
-----------
No available documentation.
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
		/****** RWHeaderSection_RWFileSchema::RWHeaderSection_RWFileSchema ******/
		/****** md5 signature: 26de657d3edf82e637fac588259f3924 ******/
		%feature("compactdefaultargs") RWHeaderSection_RWFileSchema;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") RWHeaderSection_RWFileSchema;
		 RWHeaderSection_RWFileSchema();

		/****** RWHeaderSection_RWFileSchema::ReadStep ******/
		/****** md5 signature: b7036ffc105271c76f193f4a511df697 ******/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "
Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: HeaderSection_FileSchema

Return
-------
None

Description
-----------
No available documentation.
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const int num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<HeaderSection_FileSchema> & ent);

		/****** RWHeaderSection_RWFileSchema::WriteStep ******/
		/****** md5 signature: 8166e08f5f6f3378f43fd604f7df8b7c ******/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "
Parameters
----------
SW: StepData_StepWriter
ent: HeaderSection_FileSchema

Return
-------
None

Description
-----------
No available documentation.
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
		/****** RWHeaderSection_ReadWriteModule::RWHeaderSection_ReadWriteModule ******/
		/****** md5 signature: 47fff2464a4fbace30d2cb232f283f75 ******/
		%feature("compactdefaultargs") RWHeaderSection_ReadWriteModule;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") RWHeaderSection_ReadWriteModule;
		 RWHeaderSection_ReadWriteModule();

		/****** RWHeaderSection_ReadWriteModule::CaseStep ******/
		/****** md5 signature: 284d17620d8dc80f0d7741b5789f8024 ******/
		%feature("compactdefaultargs") CaseStep;
		%feature("autodoc", "
Parameters
----------
atype: str

Return
-------
int

Description
-----------
associates a positive Case Number to each type of HeaderSection entity, given as a String defined in the EXPRESS form.
") CaseStep;
		int CaseStep(TCollection_AsciiString atype);

		/****** RWHeaderSection_ReadWriteModule::CaseStep ******/
		/****** md5 signature: 76bd8af8111c189c7dcfc0591d934bc4 ******/
		%feature("compactdefaultargs") CaseStep;
		%feature("autodoc", "
Parameters
----------
types: NCollection_Sequence<TCollection_AsciiString>

Return
-------
int

Description
-----------
associates a positive Case Number to each type of HeaderSection Complex entity, given as a String defined in the EXPRESS form.
") CaseStep;
		int CaseStep(const NCollection_Sequence<TCollection_AsciiString> & types);

		/****** RWHeaderSection_ReadWriteModule::IsComplex ******/
		/****** md5 signature: 4ded93fc1cf7b4339f7fba22c29d50e9 ******/
		%feature("compactdefaultargs") IsComplex;
		%feature("autodoc", "
Parameters
----------
CN: int

Return
-------
bool

Description
-----------
returns True if the Case Number corresponds to a Complex Type.
") IsComplex;
		bool IsComplex(const int CN);

		/****** RWHeaderSection_ReadWriteModule::ReadStep ******/
		/****** md5 signature: 8c4e2a75fd0aa539bafe1f02d5c21a95 ******/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "
Parameters
----------
CN: int
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: Standard_Transient

Return
-------
None

Description
-----------
No available documentation.
") ReadStep;
		void ReadStep(const int CN, const opencascade::handle<StepData_StepReaderData> & data, const int num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<Standard_Transient> & ent);

		/****** RWHeaderSection_ReadWriteModule::StepType ******/
		/****** md5 signature: 3b96bf09bb682cb18550d64bc23df208 ******/
		%feature("compactdefaultargs") StepType;
		%feature("autodoc", "
Parameters
----------
CN: int

Return
-------
std::string_view

Description
-----------
returns a StepType (defined in EXPRESS form which belongs to a Type of Entity, identified by its CaseNumber determined by Protocol.
") StepType;
		const std::string_view & StepType(const int CN);

		/****** RWHeaderSection_ReadWriteModule::WriteStep ******/
		/****** md5 signature: 1e1c50107e184f9972af370c63bcc1cf ******/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "
Parameters
----------
CN: int
SW: StepData_StepWriter
ent: Standard_Transient

Return
-------
None

Description
-----------
No available documentation.
") WriteStep;
		void WriteStep(const int CN, StepData_StepWriter & SW, const opencascade::handle<Standard_Transient> & ent);

};


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
/* deprecated methods */
%pythoncode {
@deprecated
def rwheadersection_Init(*args):
	return rwheadersection.Init(*args)

}
