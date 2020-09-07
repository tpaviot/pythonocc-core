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
%define RWSTEPAP214DOCSTRING
"RWStepAP214 module, see official documentation at
https://www.opencascade.com/doc/occt-7.4.0/refman/html/package_rwstepap214.html"
%enddef
%module (package="OCC.Core", docstring=RWSTEPAP214DOCSTRING) RWStepAP214


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
#include<RWStepAP214_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<StepData_module.hxx>
#include<Interface_module.hxx>
#include<TCollection_module.hxx>
#include<StepAP214_module.hxx>
#include<TColStd_module.hxx>
#include<Message_module.hxx>
#include<StepRepr_module.hxx>
#include<StepGeom_module.hxx>
#include<StepBasic_module.hxx>
#include<StepShape_module.hxx>
#include<StepVisual_module.hxx>
#include<MoniTool_module.hxx>
#include<TopoDS_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import StepData.i
%import Interface.i
%import TCollection.i
%import StepAP214.i
%import TColStd.i

%pythoncode {
from enum import IntEnum
from OCC.Core.Exception import *
};

/* public enums */
/* end public enums declaration */

/* python proy classes for enums */
%pythoncode {
};
/* end python proxy for enums */

/* handles */
%wrap_handle(RWStepAP214_GeneralModule)
%wrap_handle(RWStepAP214_ReadWriteModule)
/* end handles declaration */

/* templates */
/* end templates declaration */

/* typedefs */
/* end typedefs declaration */

/********************
* class RWStepAP214 *
********************/
%rename(rwstepap214) RWStepAP214;
class RWStepAP214 {
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


%extend RWStepAP214 {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************************
* class RWStepAP214_GeneralModule *
**********************************/
class RWStepAP214_GeneralModule : public StepData_GeneralModule {
	public:
		/****************** RWStepAP214_GeneralModule ******************/
		/**** md5 signature: be30e7778bb7ef6c99f58c2328cc6c76 ****/
		%feature("compactdefaultargs") RWStepAP214_GeneralModule;
		%feature("autodoc", "Creates a generalmodule.

Returns
-------
None
") RWStepAP214_GeneralModule;
		 RWStepAP214_GeneralModule();

		/****************** CategoryNumber ******************/
		/**** md5 signature: d812efe400e2084fa824301d3c147806 ****/
		%feature("compactdefaultargs") CategoryNumber;
		%feature("autodoc", "No available documentation.

Parameters
----------
CN: int
ent: Standard_Transient
shares: Interface_ShareTool

Returns
-------
int
") CategoryNumber;
		virtual Standard_Integer CategoryNumber(const Standard_Integer CN, const opencascade::handle<Standard_Transient> & ent, const Interface_ShareTool & shares);

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
		%feature("autodoc", "Specific filling of the list of entities shared by an entity <ent>, according to a case number <cn> (provided by stepap214 protocol).

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

		/****************** Name ******************/
		/**** md5 signature: ac91548e6672c7a25f89869ddd43f80a ****/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "Returns the name of a step entity according to its type.

Parameters
----------
CN: int
ent: Standard_Transient
shares: Interface_ShareTool

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") Name;
		virtual opencascade::handle<TCollection_HAsciiString> Name(const Standard_Integer CN, const opencascade::handle<Standard_Transient> & ent, const Interface_ShareTool & shares);

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


%make_alias(RWStepAP214_GeneralModule)

%extend RWStepAP214_GeneralModule {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************************************
* class RWStepAP214_RWAppliedApprovalAssignment *
************************************************/
class RWStepAP214_RWAppliedApprovalAssignment {
	public:
		/****************** RWStepAP214_RWAppliedApprovalAssignment ******************/
		/**** md5 signature: dfa23c9609cc0970b6a6c7415d56cb87 ****/
		%feature("compactdefaultargs") RWStepAP214_RWAppliedApprovalAssignment;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepAP214_RWAppliedApprovalAssignment;
		 RWStepAP214_RWAppliedApprovalAssignment();

		/****************** ReadStep ******************/
		/**** md5 signature: 05173eda933c80b8ae37c4b25e7fde2e ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepAP214_AppliedApprovalAssignment

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepAP214_AppliedApprovalAssignment> & ent);

		/****************** Share ******************/
		/**** md5 signature: 179c1ac3f19560d70821e9e4c549fb03 ****/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "No available documentation.

Parameters
----------
ent: StepAP214_AppliedApprovalAssignment
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepAP214_AppliedApprovalAssignment> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		/**** md5 signature: 69eada9b7680170c4353e3c7c8c807f0 ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepAP214_AppliedApprovalAssignment

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepAP214_AppliedApprovalAssignment> & ent);

};


%extend RWStepAP214_RWAppliedApprovalAssignment {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************************************
* class RWStepAP214_RWAppliedDateAndTimeAssignment *
***************************************************/
class RWStepAP214_RWAppliedDateAndTimeAssignment {
	public:
		/****************** RWStepAP214_RWAppliedDateAndTimeAssignment ******************/
		/**** md5 signature: 6cf75f5ba64a89e180f3315bdbb5232f ****/
		%feature("compactdefaultargs") RWStepAP214_RWAppliedDateAndTimeAssignment;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepAP214_RWAppliedDateAndTimeAssignment;
		 RWStepAP214_RWAppliedDateAndTimeAssignment();

		/****************** ReadStep ******************/
		/**** md5 signature: cda692f905298123caf692f3986caece ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepAP214_AppliedDateAndTimeAssignment

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepAP214_AppliedDateAndTimeAssignment> & ent);

		/****************** Share ******************/
		/**** md5 signature: 6edf563eb2fa5d23a2d199c56d54d632 ****/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "No available documentation.

Parameters
----------
ent: StepAP214_AppliedDateAndTimeAssignment
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepAP214_AppliedDateAndTimeAssignment> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		/**** md5 signature: 3b24e8c81bfd58750e8eda0b4407ca26 ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepAP214_AppliedDateAndTimeAssignment

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepAP214_AppliedDateAndTimeAssignment> & ent);

};


%extend RWStepAP214_RWAppliedDateAndTimeAssignment {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************************
* class RWStepAP214_RWAppliedDateAssignment *
********************************************/
class RWStepAP214_RWAppliedDateAssignment {
	public:
		/****************** RWStepAP214_RWAppliedDateAssignment ******************/
		/**** md5 signature: c1f38822b866384beaf7dc664e361561 ****/
		%feature("compactdefaultargs") RWStepAP214_RWAppliedDateAssignment;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepAP214_RWAppliedDateAssignment;
		 RWStepAP214_RWAppliedDateAssignment();

		/****************** ReadStep ******************/
		/**** md5 signature: 622c7063035231e0146d208cc194a15a ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepAP214_AppliedDateAssignment

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepAP214_AppliedDateAssignment> & ent);

		/****************** Share ******************/
		/**** md5 signature: 3762bc848971de6eb18cd1115b2569c5 ****/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "No available documentation.

Parameters
----------
ent: StepAP214_AppliedDateAssignment
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepAP214_AppliedDateAssignment> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		/**** md5 signature: a4f54fab52653a435676f6a94224505f ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepAP214_AppliedDateAssignment

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepAP214_AppliedDateAssignment> & ent);

};


%extend RWStepAP214_RWAppliedDateAssignment {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************************************
* class RWStepAP214_RWAppliedDocumentReference *
***********************************************/
class RWStepAP214_RWAppliedDocumentReference {
	public:
		/****************** RWStepAP214_RWAppliedDocumentReference ******************/
		/**** md5 signature: 01e49f04b481e8691475b7bbc9c74abb ****/
		%feature("compactdefaultargs") RWStepAP214_RWAppliedDocumentReference;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepAP214_RWAppliedDocumentReference;
		 RWStepAP214_RWAppliedDocumentReference();

		/****************** ReadStep ******************/
		/**** md5 signature: 3d64f49b295e54fd325badee1d4621ce ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepAP214_AppliedDocumentReference

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepAP214_AppliedDocumentReference> & ent);

		/****************** Share ******************/
		/**** md5 signature: c71c8738728584d79ba0e0220cec2751 ****/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "No available documentation.

Parameters
----------
ent: StepAP214_AppliedDocumentReference
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepAP214_AppliedDocumentReference> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		/**** md5 signature: 560f8b4a96bc7f61b96bb23f89e1be47 ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepAP214_AppliedDocumentReference

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepAP214_AppliedDocumentReference> & ent);

};


%extend RWStepAP214_RWAppliedDocumentReference {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************************************************
* class RWStepAP214_RWAppliedExternalIdentificationAssignment *
**************************************************************/
class RWStepAP214_RWAppliedExternalIdentificationAssignment {
	public:
		/****************** RWStepAP214_RWAppliedExternalIdentificationAssignment ******************/
		/**** md5 signature: c1974c6c1501e9ce6010f4eadde2d847 ****/
		%feature("compactdefaultargs") RWStepAP214_RWAppliedExternalIdentificationAssignment;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepAP214_RWAppliedExternalIdentificationAssignment;
		 RWStepAP214_RWAppliedExternalIdentificationAssignment();

		/****************** ReadStep ******************/
		/**** md5 signature: 89ba78d23090a63278906b1bb4ee9019 ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "Reads appliedexternalidentificationassignment.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepAP214_AppliedExternalIdentificationAssignment

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepAP214_AppliedExternalIdentificationAssignment> & ent);

		/****************** Share ******************/
		/**** md5 signature: 2b46bbb661ac7409b1e7d948ca0131d0 ****/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "Fills data for graph (shared items).

Parameters
----------
ent: StepAP214_AppliedExternalIdentificationAssignment
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepAP214_AppliedExternalIdentificationAssignment> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		/**** md5 signature: 946bc1fb25d2e884a26509daae39e2a3 ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "Writes appliedexternalidentificationassignment.

Parameters
----------
SW: StepData_StepWriter
ent: StepAP214_AppliedExternalIdentificationAssignment

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepAP214_AppliedExternalIdentificationAssignment> & ent);

};


%extend RWStepAP214_RWAppliedExternalIdentificationAssignment {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************************
* class RWStepAP214_RWAppliedGroupAssignment *
*********************************************/
class RWStepAP214_RWAppliedGroupAssignment {
	public:
		/****************** RWStepAP214_RWAppliedGroupAssignment ******************/
		/**** md5 signature: dd69e245701198124d38cd8716e5be3e ****/
		%feature("compactdefaultargs") RWStepAP214_RWAppliedGroupAssignment;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepAP214_RWAppliedGroupAssignment;
		 RWStepAP214_RWAppliedGroupAssignment();

		/****************** ReadStep ******************/
		/**** md5 signature: 019a2af0a3680cc671436ab25b986d63 ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "Reads appliedgroupassignment.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepAP214_AppliedGroupAssignment

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepAP214_AppliedGroupAssignment> & ent);

		/****************** Share ******************/
		/**** md5 signature: ffe517b91088ad2cf83065ce13a9ab9e ****/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "Fills data for graph (shared items).

Parameters
----------
ent: StepAP214_AppliedGroupAssignment
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepAP214_AppliedGroupAssignment> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		/**** md5 signature: 1c9107b75eabc73d3e5f8e64b167962e ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "Writes appliedgroupassignment.

Parameters
----------
SW: StepData_StepWriter
ent: StepAP214_AppliedGroupAssignment

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepAP214_AppliedGroupAssignment> & ent);

};


%extend RWStepAP214_RWAppliedGroupAssignment {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************************************
* class RWStepAP214_RWAppliedOrganizationAssignment *
****************************************************/
class RWStepAP214_RWAppliedOrganizationAssignment {
	public:
		/****************** RWStepAP214_RWAppliedOrganizationAssignment ******************/
		/**** md5 signature: f120be5c9720a886d5ad2d6d19044b8d ****/
		%feature("compactdefaultargs") RWStepAP214_RWAppliedOrganizationAssignment;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepAP214_RWAppliedOrganizationAssignment;
		 RWStepAP214_RWAppliedOrganizationAssignment();

		/****************** ReadStep ******************/
		/**** md5 signature: 1a09976f1e9ddaebeeb645d12087a710 ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepAP214_AppliedOrganizationAssignment

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepAP214_AppliedOrganizationAssignment> & ent);

		/****************** Share ******************/
		/**** md5 signature: 811c93276e4e8580efbe930b30e2593b ****/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "No available documentation.

Parameters
----------
ent: StepAP214_AppliedOrganizationAssignment
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepAP214_AppliedOrganizationAssignment> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		/**** md5 signature: 7904dceaea6ff8046d17fb86a5195348 ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepAP214_AppliedOrganizationAssignment

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepAP214_AppliedOrganizationAssignment> & ent);

};


%extend RWStepAP214_RWAppliedOrganizationAssignment {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************************************************
* class RWStepAP214_RWAppliedPersonAndOrganizationAssignment *
*************************************************************/
class RWStepAP214_RWAppliedPersonAndOrganizationAssignment {
	public:
		/****************** RWStepAP214_RWAppliedPersonAndOrganizationAssignment ******************/
		/**** md5 signature: 844c1b746514c4ed807824faf909e792 ****/
		%feature("compactdefaultargs") RWStepAP214_RWAppliedPersonAndOrganizationAssignment;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepAP214_RWAppliedPersonAndOrganizationAssignment;
		 RWStepAP214_RWAppliedPersonAndOrganizationAssignment();

		/****************** ReadStep ******************/
		/**** md5 signature: 14828d74090bf94cd96ffff585db7bda ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepAP214_AppliedPersonAndOrganizationAssignment

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepAP214_AppliedPersonAndOrganizationAssignment> & ent);

		/****************** Share ******************/
		/**** md5 signature: 62be5b1662483847377a5f9260b43549 ****/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "No available documentation.

Parameters
----------
ent: StepAP214_AppliedPersonAndOrganizationAssignment
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepAP214_AppliedPersonAndOrganizationAssignment> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		/**** md5 signature: dcdc6e37dc4305340f39ec1831ae2110 ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepAP214_AppliedPersonAndOrganizationAssignment

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepAP214_AppliedPersonAndOrganizationAssignment> & ent);

};


%extend RWStepAP214_RWAppliedPersonAndOrganizationAssignment {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************************
* class RWStepAP214_RWAppliedPresentedItem *
*******************************************/
class RWStepAP214_RWAppliedPresentedItem {
	public:
		/****************** RWStepAP214_RWAppliedPresentedItem ******************/
		/**** md5 signature: be9ff732c153a073c0d421108dcc05b4 ****/
		%feature("compactdefaultargs") RWStepAP214_RWAppliedPresentedItem;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepAP214_RWAppliedPresentedItem;
		 RWStepAP214_RWAppliedPresentedItem();

		/****************** ReadStep ******************/
		/**** md5 signature: d1d78e7f31871c7af9b2a3344b476d49 ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepAP214_AppliedPresentedItem

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepAP214_AppliedPresentedItem> & ent);

		/****************** Share ******************/
		/**** md5 signature: 1c76f922f7394ce7bad625159dfce202 ****/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "No available documentation.

Parameters
----------
ent: StepAP214_AppliedPresentedItem
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepAP214_AppliedPresentedItem> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		/**** md5 signature: dc352f6acedabd62080275e3d2c65b01 ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepAP214_AppliedPresentedItem

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepAP214_AppliedPresentedItem> & ent);

};


%extend RWStepAP214_RWAppliedPresentedItem {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************************************************
* class RWStepAP214_RWAppliedSecurityClassificationAssignment *
**************************************************************/
class RWStepAP214_RWAppliedSecurityClassificationAssignment {
	public:
		/****************** RWStepAP214_RWAppliedSecurityClassificationAssignment ******************/
		/**** md5 signature: f08ae198a50d92dcac33a997e19a284e ****/
		%feature("compactdefaultargs") RWStepAP214_RWAppliedSecurityClassificationAssignment;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepAP214_RWAppliedSecurityClassificationAssignment;
		 RWStepAP214_RWAppliedSecurityClassificationAssignment();

		/****************** ReadStep ******************/
		/**** md5 signature: 5d81dd4ae1138144c73c6e3cc58ae896 ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepAP214_AppliedSecurityClassificationAssignment

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepAP214_AppliedSecurityClassificationAssignment> & ent);

		/****************** Share ******************/
		/**** md5 signature: 119fbb0981355b64bc740be6359a7a77 ****/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "No available documentation.

Parameters
----------
ent: StepAP214_AppliedSecurityClassificationAssignment
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepAP214_AppliedSecurityClassificationAssignment> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		/**** md5 signature: cee1a81852195c544741fc5dd1caaeca ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepAP214_AppliedSecurityClassificationAssignment

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepAP214_AppliedSecurityClassificationAssignment> & ent);

};


%extend RWStepAP214_RWAppliedSecurityClassificationAssignment {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************************************************
* class RWStepAP214_RWAutoDesignActualDateAndTimeAssignment *
************************************************************/
class RWStepAP214_RWAutoDesignActualDateAndTimeAssignment {
	public:
		/****************** RWStepAP214_RWAutoDesignActualDateAndTimeAssignment ******************/
		/**** md5 signature: 57f5e900e1c368dfc774b22bcd06b8b2 ****/
		%feature("compactdefaultargs") RWStepAP214_RWAutoDesignActualDateAndTimeAssignment;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepAP214_RWAutoDesignActualDateAndTimeAssignment;
		 RWStepAP214_RWAutoDesignActualDateAndTimeAssignment();

		/****************** ReadStep ******************/
		/**** md5 signature: 592fb47e475f3190077c4f182ef9c179 ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepAP214_AutoDesignActualDateAndTimeAssignment

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepAP214_AutoDesignActualDateAndTimeAssignment> & ent);

		/****************** Share ******************/
		/**** md5 signature: e827bcc295e557dd6500b35da8ecb223 ****/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "No available documentation.

Parameters
----------
ent: StepAP214_AutoDesignActualDateAndTimeAssignment
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepAP214_AutoDesignActualDateAndTimeAssignment> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		/**** md5 signature: e8d410892a55097db5054f3144d76385 ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepAP214_AutoDesignActualDateAndTimeAssignment

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepAP214_AutoDesignActualDateAndTimeAssignment> & ent);

};


%extend RWStepAP214_RWAutoDesignActualDateAndTimeAssignment {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************************************
* class RWStepAP214_RWAutoDesignActualDateAssignment *
*****************************************************/
class RWStepAP214_RWAutoDesignActualDateAssignment {
	public:
		/****************** RWStepAP214_RWAutoDesignActualDateAssignment ******************/
		/**** md5 signature: ea58130dadad70abed4b3c63838cd901 ****/
		%feature("compactdefaultargs") RWStepAP214_RWAutoDesignActualDateAssignment;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepAP214_RWAutoDesignActualDateAssignment;
		 RWStepAP214_RWAutoDesignActualDateAssignment();

		/****************** ReadStep ******************/
		/**** md5 signature: 97c9967ed64a1e3c5247782163298554 ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepAP214_AutoDesignActualDateAssignment

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepAP214_AutoDesignActualDateAssignment> & ent);

		/****************** Share ******************/
		/**** md5 signature: 2060caa3755c2d3198b6d581c3916bfd ****/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "No available documentation.

Parameters
----------
ent: StepAP214_AutoDesignActualDateAssignment
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepAP214_AutoDesignActualDateAssignment> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		/**** md5 signature: 5e531c9b64a451c4fed17cad24cc8e09 ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepAP214_AutoDesignActualDateAssignment

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepAP214_AutoDesignActualDateAssignment> & ent);

};


%extend RWStepAP214_RWAutoDesignActualDateAssignment {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************************************
* class RWStepAP214_RWAutoDesignApprovalAssignment *
***************************************************/
class RWStepAP214_RWAutoDesignApprovalAssignment {
	public:
		/****************** RWStepAP214_RWAutoDesignApprovalAssignment ******************/
		/**** md5 signature: 09956cb3b9ebc0cffc92ca1db85fc9d4 ****/
		%feature("compactdefaultargs") RWStepAP214_RWAutoDesignApprovalAssignment;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepAP214_RWAutoDesignApprovalAssignment;
		 RWStepAP214_RWAutoDesignApprovalAssignment();

		/****************** ReadStep ******************/
		/**** md5 signature: bee103db1b4a12ef5c5bbf32dfa2159e ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepAP214_AutoDesignApprovalAssignment

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepAP214_AutoDesignApprovalAssignment> & ent);

		/****************** Share ******************/
		/**** md5 signature: 84681901c3ecb0955c5ff0d584cabf46 ****/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "No available documentation.

Parameters
----------
ent: StepAP214_AutoDesignApprovalAssignment
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepAP214_AutoDesignApprovalAssignment> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		/**** md5 signature: 72959b971adbe2135fbedade72787867 ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepAP214_AutoDesignApprovalAssignment

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepAP214_AutoDesignApprovalAssignment> & ent);

};


%extend RWStepAP214_RWAutoDesignApprovalAssignment {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************************************
* class RWStepAP214_RWAutoDesignDateAndPersonAssignment *
********************************************************/
class RWStepAP214_RWAutoDesignDateAndPersonAssignment {
	public:
		/****************** RWStepAP214_RWAutoDesignDateAndPersonAssignment ******************/
		/**** md5 signature: 4c6217d953dbd726c511b8949f2aa68b ****/
		%feature("compactdefaultargs") RWStepAP214_RWAutoDesignDateAndPersonAssignment;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepAP214_RWAutoDesignDateAndPersonAssignment;
		 RWStepAP214_RWAutoDesignDateAndPersonAssignment();

		/****************** ReadStep ******************/
		/**** md5 signature: 9beb60f4d8a41bb391f8846d49df3998 ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepAP214_AutoDesignDateAndPersonAssignment

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepAP214_AutoDesignDateAndPersonAssignment> & ent);

		/****************** Share ******************/
		/**** md5 signature: 7f03c06eaf054ca64030315802b6ef76 ****/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "No available documentation.

Parameters
----------
ent: StepAP214_AutoDesignDateAndPersonAssignment
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepAP214_AutoDesignDateAndPersonAssignment> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		/**** md5 signature: debf4d3e092e953f77c4e1a808ade598 ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepAP214_AutoDesignDateAndPersonAssignment

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepAP214_AutoDesignDateAndPersonAssignment> & ent);

};


%extend RWStepAP214_RWAutoDesignDateAndPersonAssignment {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************************************
* class RWStepAP214_RWAutoDesignDocumentReference *
**************************************************/
class RWStepAP214_RWAutoDesignDocumentReference {
	public:
		/****************** RWStepAP214_RWAutoDesignDocumentReference ******************/
		/**** md5 signature: 5e8fbae47ab0982f63b2c1ea8619da80 ****/
		%feature("compactdefaultargs") RWStepAP214_RWAutoDesignDocumentReference;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepAP214_RWAutoDesignDocumentReference;
		 RWStepAP214_RWAutoDesignDocumentReference();

		/****************** ReadStep ******************/
		/**** md5 signature: 18014342dd5535e7f4124ae70ef4dc49 ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepAP214_AutoDesignDocumentReference

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepAP214_AutoDesignDocumentReference> & ent);

		/****************** Share ******************/
		/**** md5 signature: 7e71b1e490c72acd42e484a1e330f042 ****/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "No available documentation.

Parameters
----------
ent: StepAP214_AutoDesignDocumentReference
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepAP214_AutoDesignDocumentReference> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		/**** md5 signature: d327223c563329c8feeb9b17d2189a17 ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepAP214_AutoDesignDocumentReference

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepAP214_AutoDesignDocumentReference> & ent);

};


%extend RWStepAP214_RWAutoDesignDocumentReference {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************************************
* class RWStepAP214_RWAutoDesignGroupAssignment *
************************************************/
class RWStepAP214_RWAutoDesignGroupAssignment {
	public:
		/****************** RWStepAP214_RWAutoDesignGroupAssignment ******************/
		/**** md5 signature: 8c889f606a86022ac51577ca7e473a8c ****/
		%feature("compactdefaultargs") RWStepAP214_RWAutoDesignGroupAssignment;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepAP214_RWAutoDesignGroupAssignment;
		 RWStepAP214_RWAutoDesignGroupAssignment();

		/****************** ReadStep ******************/
		/**** md5 signature: 9bbc994b4edba2e8b17e67aa6adcdac2 ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepAP214_AutoDesignGroupAssignment

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepAP214_AutoDesignGroupAssignment> & ent);

		/****************** Share ******************/
		/**** md5 signature: 3e15f6d5760f9dba5c2ccf6e8e0ed5ca ****/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "No available documentation.

Parameters
----------
ent: StepAP214_AutoDesignGroupAssignment
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepAP214_AutoDesignGroupAssignment> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		/**** md5 signature: 3d8b71cd253c3fbe0454dcc70299629b ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepAP214_AutoDesignGroupAssignment

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepAP214_AutoDesignGroupAssignment> & ent);

};


%extend RWStepAP214_RWAutoDesignGroupAssignment {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************************************************
* class RWStepAP214_RWAutoDesignNominalDateAndTimeAssignment *
*************************************************************/
class RWStepAP214_RWAutoDesignNominalDateAndTimeAssignment {
	public:
		/****************** RWStepAP214_RWAutoDesignNominalDateAndTimeAssignment ******************/
		/**** md5 signature: 315541ec4a4395051329c2925f8995d6 ****/
		%feature("compactdefaultargs") RWStepAP214_RWAutoDesignNominalDateAndTimeAssignment;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepAP214_RWAutoDesignNominalDateAndTimeAssignment;
		 RWStepAP214_RWAutoDesignNominalDateAndTimeAssignment();

		/****************** ReadStep ******************/
		/**** md5 signature: 28cb1e20d385f4b501e0fb8705668377 ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepAP214_AutoDesignNominalDateAndTimeAssignment

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepAP214_AutoDesignNominalDateAndTimeAssignment> & ent);

		/****************** Share ******************/
		/**** md5 signature: 6423495bd50fddbcb07c4697862332a7 ****/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "No available documentation.

Parameters
----------
ent: StepAP214_AutoDesignNominalDateAndTimeAssignment
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepAP214_AutoDesignNominalDateAndTimeAssignment> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		/**** md5 signature: 296019e0987122f08fa63af1f36f9f62 ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepAP214_AutoDesignNominalDateAndTimeAssignment

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepAP214_AutoDesignNominalDateAndTimeAssignment> & ent);

};


%extend RWStepAP214_RWAutoDesignNominalDateAndTimeAssignment {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************************************
* class RWStepAP214_RWAutoDesignNominalDateAssignment *
******************************************************/
class RWStepAP214_RWAutoDesignNominalDateAssignment {
	public:
		/****************** RWStepAP214_RWAutoDesignNominalDateAssignment ******************/
		/**** md5 signature: 2e256cae77f75a751d6ea3139e139c44 ****/
		%feature("compactdefaultargs") RWStepAP214_RWAutoDesignNominalDateAssignment;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepAP214_RWAutoDesignNominalDateAssignment;
		 RWStepAP214_RWAutoDesignNominalDateAssignment();

		/****************** ReadStep ******************/
		/**** md5 signature: 80d3bb59e99f94f6d54224b71b20c7e0 ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepAP214_AutoDesignNominalDateAssignment

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepAP214_AutoDesignNominalDateAssignment> & ent);

		/****************** Share ******************/
		/**** md5 signature: ea1aa6b14b910067972be177bbace1c9 ****/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "No available documentation.

Parameters
----------
ent: StepAP214_AutoDesignNominalDateAssignment
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepAP214_AutoDesignNominalDateAssignment> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		/**** md5 signature: 245f305559c4300e6c1d1770913585b0 ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepAP214_AutoDesignNominalDateAssignment

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepAP214_AutoDesignNominalDateAssignment> & ent);

};


%extend RWStepAP214_RWAutoDesignNominalDateAssignment {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************************************
* class RWStepAP214_RWAutoDesignOrganizationAssignment *
*******************************************************/
class RWStepAP214_RWAutoDesignOrganizationAssignment {
	public:
		/****************** RWStepAP214_RWAutoDesignOrganizationAssignment ******************/
		/**** md5 signature: 5b47dac8609ee4367cbce2aaffe7947c ****/
		%feature("compactdefaultargs") RWStepAP214_RWAutoDesignOrganizationAssignment;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepAP214_RWAutoDesignOrganizationAssignment;
		 RWStepAP214_RWAutoDesignOrganizationAssignment();

		/****************** ReadStep ******************/
		/**** md5 signature: 6e5438421c3f0856265b133aba78466e ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepAP214_AutoDesignOrganizationAssignment

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepAP214_AutoDesignOrganizationAssignment> & ent);

		/****************** Share ******************/
		/**** md5 signature: 3e9e52823d60cc287eec01afec1a49bd ****/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "No available documentation.

Parameters
----------
ent: StepAP214_AutoDesignOrganizationAssignment
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepAP214_AutoDesignOrganizationAssignment> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		/**** md5 signature: 15e3084aa17646626bea30be546a22ac ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepAP214_AutoDesignOrganizationAssignment

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepAP214_AutoDesignOrganizationAssignment> & ent);

};


%extend RWStepAP214_RWAutoDesignOrganizationAssignment {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************************************************
* class RWStepAP214_RWAutoDesignPersonAndOrganizationAssignment *
****************************************************************/
class RWStepAP214_RWAutoDesignPersonAndOrganizationAssignment {
	public:
		/****************** RWStepAP214_RWAutoDesignPersonAndOrganizationAssignment ******************/
		/**** md5 signature: ae6e000b0cbaa3ac6e17af62849a2147 ****/
		%feature("compactdefaultargs") RWStepAP214_RWAutoDesignPersonAndOrganizationAssignment;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepAP214_RWAutoDesignPersonAndOrganizationAssignment;
		 RWStepAP214_RWAutoDesignPersonAndOrganizationAssignment();

		/****************** ReadStep ******************/
		/**** md5 signature: 181af8a2801a74d8352103b9f4f34612 ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepAP214_AutoDesignPersonAndOrganizationAssignment

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepAP214_AutoDesignPersonAndOrganizationAssignment> & ent);

		/****************** Share ******************/
		/**** md5 signature: 15b42bd6dfdf6acc032d4e7e27f8e575 ****/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "No available documentation.

Parameters
----------
ent: StepAP214_AutoDesignPersonAndOrganizationAssignment
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepAP214_AutoDesignPersonAndOrganizationAssignment> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		/**** md5 signature: 721392b0faf5bc915952736a47db8c8c ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepAP214_AutoDesignPersonAndOrganizationAssignment

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepAP214_AutoDesignPersonAndOrganizationAssignment> & ent);

};


%extend RWStepAP214_RWAutoDesignPersonAndOrganizationAssignment {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************************************
* class RWStepAP214_RWAutoDesignPresentedItem *
**********************************************/
class RWStepAP214_RWAutoDesignPresentedItem {
	public:
		/****************** RWStepAP214_RWAutoDesignPresentedItem ******************/
		/**** md5 signature: daab09d198832bf9fa08f0df68568d8d ****/
		%feature("compactdefaultargs") RWStepAP214_RWAutoDesignPresentedItem;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepAP214_RWAutoDesignPresentedItem;
		 RWStepAP214_RWAutoDesignPresentedItem();

		/****************** ReadStep ******************/
		/**** md5 signature: 8dd106f37cf86fe49e48c4cf3bb35ab0 ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepAP214_AutoDesignPresentedItem

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepAP214_AutoDesignPresentedItem> & ent);

		/****************** Share ******************/
		/**** md5 signature: 1154e3327186cca78a8bfc5c179876ef ****/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "No available documentation.

Parameters
----------
ent: StepAP214_AutoDesignPresentedItem
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepAP214_AutoDesignPresentedItem> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		/**** md5 signature: d92f70f7dd813683c69c0e5a3fa9c1af ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepAP214_AutoDesignPresentedItem

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepAP214_AutoDesignPresentedItem> & ent);

};


%extend RWStepAP214_RWAutoDesignPresentedItem {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************************************************
* class RWStepAP214_RWAutoDesignSecurityClassificationAssignment *
*****************************************************************/
class RWStepAP214_RWAutoDesignSecurityClassificationAssignment {
	public:
		/****************** RWStepAP214_RWAutoDesignSecurityClassificationAssignment ******************/
		/**** md5 signature: 83fe397cf338c95be4d2a5de9b5e0a8f ****/
		%feature("compactdefaultargs") RWStepAP214_RWAutoDesignSecurityClassificationAssignment;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepAP214_RWAutoDesignSecurityClassificationAssignment;
		 RWStepAP214_RWAutoDesignSecurityClassificationAssignment();

		/****************** ReadStep ******************/
		/**** md5 signature: 719c44dd31fc5806a0ccd54d110cd3d8 ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepAP214_AutoDesignSecurityClassificationAssignment

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepAP214_AutoDesignSecurityClassificationAssignment> & ent);

		/****************** Share ******************/
		/**** md5 signature: 1fa37d0d1d8541da99be437f3ea2e125 ****/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "No available documentation.

Parameters
----------
ent: StepAP214_AutoDesignSecurityClassificationAssignment
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepAP214_AutoDesignSecurityClassificationAssignment> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		/**** md5 signature: c18e65de81b7895c7ac61ef92b2e5711 ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepAP214_AutoDesignSecurityClassificationAssignment

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepAP214_AutoDesignSecurityClassificationAssignment> & ent);

};


%extend RWStepAP214_RWAutoDesignSecurityClassificationAssignment {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************
* class RWStepAP214_RWClass *
****************************/
class RWStepAP214_RWClass {
	public:
		/****************** RWStepAP214_RWClass ******************/
		/**** md5 signature: 4404459f082d0613dcc1a3ad2a96e964 ****/
		%feature("compactdefaultargs") RWStepAP214_RWClass;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepAP214_RWClass;
		 RWStepAP214_RWClass();

		/****************** ReadStep ******************/
		/**** md5 signature: 2b9b6cd89dbb476927cd0b335632bf40 ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "Reads class.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepAP214_Class

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepAP214_Class> & ent);

		/****************** Share ******************/
		/**** md5 signature: b4442d0b6c9cc1d08b4aabe3ea571f12 ****/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "Fills data for graph (shared items).

Parameters
----------
ent: StepAP214_Class
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepAP214_Class> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		/**** md5 signature: ae9a0cd3f76f45d0a15a8f583a40b425 ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "Writes class.

Parameters
----------
SW: StepData_StepWriter
ent: StepAP214_Class

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepAP214_Class> & ent);

};


%extend RWStepAP214_RWClass {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************************
* class RWStepAP214_RWExternallyDefinedClass *
*********************************************/
class RWStepAP214_RWExternallyDefinedClass {
	public:
		/****************** RWStepAP214_RWExternallyDefinedClass ******************/
		/**** md5 signature: 87b5688c03f70ea6e298171c68b02776 ****/
		%feature("compactdefaultargs") RWStepAP214_RWExternallyDefinedClass;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepAP214_RWExternallyDefinedClass;
		 RWStepAP214_RWExternallyDefinedClass();

		/****************** ReadStep ******************/
		/**** md5 signature: 134ff8067aab5c29c502d2c93143fc3e ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "Reads externallydefinedclass.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepAP214_ExternallyDefinedClass

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepAP214_ExternallyDefinedClass> & ent);

		/****************** Share ******************/
		/**** md5 signature: 2f37e136695aa9a15e58c60467da276f ****/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "Fills data for graph (shared items).

Parameters
----------
ent: StepAP214_ExternallyDefinedClass
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepAP214_ExternallyDefinedClass> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		/**** md5 signature: 9570fee20245e0bfe0f5648b710ca277 ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "Writes externallydefinedclass.

Parameters
----------
SW: StepData_StepWriter
ent: StepAP214_ExternallyDefinedClass

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepAP214_ExternallyDefinedClass> & ent);

};


%extend RWStepAP214_RWExternallyDefinedClass {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************************************
* class RWStepAP214_RWExternallyDefinedGeneralProperty *
*******************************************************/
class RWStepAP214_RWExternallyDefinedGeneralProperty {
	public:
		/****************** RWStepAP214_RWExternallyDefinedGeneralProperty ******************/
		/**** md5 signature: c25feb2869784a2939bfade9555d1c18 ****/
		%feature("compactdefaultargs") RWStepAP214_RWExternallyDefinedGeneralProperty;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepAP214_RWExternallyDefinedGeneralProperty;
		 RWStepAP214_RWExternallyDefinedGeneralProperty();

		/****************** ReadStep ******************/
		/**** md5 signature: 580835f76ffd0ffc66e53eb062805918 ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "Reads externallydefinedgeneralproperty.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepAP214_ExternallyDefinedGeneralProperty

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepAP214_ExternallyDefinedGeneralProperty> & ent);

		/****************** Share ******************/
		/**** md5 signature: 638a7c3913c763ddaf2472802aa241af ****/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "Fills data for graph (shared items).

Parameters
----------
ent: StepAP214_ExternallyDefinedGeneralProperty
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepAP214_ExternallyDefinedGeneralProperty> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		/**** md5 signature: c045cc99e76f1137beff90f2826b966d ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "Writes externallydefinedgeneralproperty.

Parameters
----------
SW: StepData_StepWriter
ent: StepAP214_ExternallyDefinedGeneralProperty

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepAP214_ExternallyDefinedGeneralProperty> & ent);

};


%extend RWStepAP214_RWExternallyDefinedGeneralProperty {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************************
* class RWStepAP214_RWRepItemGroup *
***********************************/
class RWStepAP214_RWRepItemGroup {
	public:
		/****************** RWStepAP214_RWRepItemGroup ******************/
		/**** md5 signature: c8bf9400be62c507b48f9befadabf1f6 ****/
		%feature("compactdefaultargs") RWStepAP214_RWRepItemGroup;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepAP214_RWRepItemGroup;
		 RWStepAP214_RWRepItemGroup();

		/****************** ReadStep ******************/
		/**** md5 signature: dcd2d64c3865baeca0ec51efe7c57051 ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "Reads repitemgroup.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepAP214_RepItemGroup

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepAP214_RepItemGroup> & ent);

		/****************** Share ******************/
		/**** md5 signature: dc589fa27a80e74fccf1847314d62725 ****/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "Fills data for graph (shared items).

Parameters
----------
ent: StepAP214_RepItemGroup
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepAP214_RepItemGroup> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		/**** md5 signature: da465357f5a825d21212b652674e70d4 ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "Writes repitemgroup.

Parameters
----------
SW: StepData_StepWriter
ent: StepAP214_RepItemGroup

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepAP214_RepItemGroup> & ent);

};


%extend RWStepAP214_RWRepItemGroup {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************************
* class RWStepAP214_ReadWriteModule *
************************************/
class RWStepAP214_ReadWriteModule : public StepData_ReadWriteModule {
	public:
		/****************** RWStepAP214_ReadWriteModule ******************/
		/**** md5 signature: 6c718183867166d2302ee9e2e7825b18 ****/
		%feature("compactdefaultargs") RWStepAP214_ReadWriteModule;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepAP214_ReadWriteModule;
		 RWStepAP214_ReadWriteModule();

		/****************** CaseStep ******************/
		/**** md5 signature: 2cca48c277ff54a418bb5762c7cc5d5f ****/
		%feature("compactdefaultargs") CaseStep;
		%feature("autodoc", "Associates a positive case number to each type of stepap214 entity, given as a string defined in the express form.

Parameters
----------
atype: TCollection_AsciiString

Returns
-------
int
") CaseStep;
		Standard_Integer CaseStep(const TCollection_AsciiString & atype);

		/****************** CaseStep ******************/
		/**** md5 signature: 440149e7ecd34289be9e6811f7462a4e ****/
		%feature("compactdefaultargs") CaseStep;
		%feature("autodoc", "Associates a positive case number to each type of stepap214 complex entity, given as a string defined in the express form.

Parameters
----------
types: TColStd_SequenceOfAsciiString

Returns
-------
int
") CaseStep;
		virtual Standard_Integer CaseStep(const TColStd_SequenceOfAsciiString & types);

		/****************** ComplexType ******************/
		/**** md5 signature: 5ba2b93856433bde631a4ccda465b733 ****/
		%feature("compactdefaultargs") ComplexType;
		%feature("autodoc", "No available documentation.

Parameters
----------
CN: int
types: TColStd_SequenceOfAsciiString

Returns
-------
bool
") ComplexType;
		virtual Standard_Boolean ComplexType(const Standard_Integer CN, TColStd_SequenceOfAsciiString & types);

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


%make_alias(RWStepAP214_ReadWriteModule)

%extend RWStepAP214_ReadWriteModule {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/* harray1 classes */
/* harray2 classes */
/* hsequence classes */
