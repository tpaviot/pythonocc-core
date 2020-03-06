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
		%feature("compactdefaultargs") RWStepAP214_GeneralModule;
		%feature("autodoc", "Creates a generalmodule.

Returns
-------
None
") RWStepAP214_GeneralModule;
		 RWStepAP214_GeneralModule();

		/****************** CategoryNumber ******************/
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
		%feature("compactdefaultargs") RWStepAP214_RWAppliedApprovalAssignment;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepAP214_RWAppliedApprovalAssignment;
		 RWStepAP214_RWAppliedApprovalAssignment();

		/****************** ReadStep ******************/
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
		%feature("compactdefaultargs") RWStepAP214_RWAppliedDateAndTimeAssignment;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepAP214_RWAppliedDateAndTimeAssignment;
		 RWStepAP214_RWAppliedDateAndTimeAssignment();

		/****************** ReadStep ******************/
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
		%feature("compactdefaultargs") RWStepAP214_RWAppliedDateAssignment;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepAP214_RWAppliedDateAssignment;
		 RWStepAP214_RWAppliedDateAssignment();

		/****************** ReadStep ******************/
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
		%feature("compactdefaultargs") RWStepAP214_RWAppliedDocumentReference;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepAP214_RWAppliedDocumentReference;
		 RWStepAP214_RWAppliedDocumentReference();

		/****************** ReadStep ******************/
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
		%feature("compactdefaultargs") RWStepAP214_RWAppliedExternalIdentificationAssignment;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepAP214_RWAppliedExternalIdentificationAssignment;
		 RWStepAP214_RWAppliedExternalIdentificationAssignment();

		/****************** ReadStep ******************/
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
		%feature("compactdefaultargs") RWStepAP214_RWAppliedGroupAssignment;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepAP214_RWAppliedGroupAssignment;
		 RWStepAP214_RWAppliedGroupAssignment();

		/****************** ReadStep ******************/
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
		%feature("compactdefaultargs") RWStepAP214_RWAppliedOrganizationAssignment;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepAP214_RWAppliedOrganizationAssignment;
		 RWStepAP214_RWAppliedOrganizationAssignment();

		/****************** ReadStep ******************/
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
		%feature("compactdefaultargs") RWStepAP214_RWAppliedPersonAndOrganizationAssignment;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepAP214_RWAppliedPersonAndOrganizationAssignment;
		 RWStepAP214_RWAppliedPersonAndOrganizationAssignment();

		/****************** ReadStep ******************/
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
		%feature("compactdefaultargs") RWStepAP214_RWAppliedPresentedItem;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepAP214_RWAppliedPresentedItem;
		 RWStepAP214_RWAppliedPresentedItem();

		/****************** ReadStep ******************/
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
		%feature("compactdefaultargs") RWStepAP214_RWAppliedSecurityClassificationAssignment;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepAP214_RWAppliedSecurityClassificationAssignment;
		 RWStepAP214_RWAppliedSecurityClassificationAssignment();

		/****************** ReadStep ******************/
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
		%feature("compactdefaultargs") RWStepAP214_RWAutoDesignActualDateAndTimeAssignment;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepAP214_RWAutoDesignActualDateAndTimeAssignment;
		 RWStepAP214_RWAutoDesignActualDateAndTimeAssignment();

		/****************** ReadStep ******************/
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
		%feature("compactdefaultargs") RWStepAP214_RWAutoDesignActualDateAssignment;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepAP214_RWAutoDesignActualDateAssignment;
		 RWStepAP214_RWAutoDesignActualDateAssignment();

		/****************** ReadStep ******************/
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
		%feature("compactdefaultargs") RWStepAP214_RWAutoDesignApprovalAssignment;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepAP214_RWAutoDesignApprovalAssignment;
		 RWStepAP214_RWAutoDesignApprovalAssignment();

		/****************** ReadStep ******************/
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
		%feature("compactdefaultargs") RWStepAP214_RWAutoDesignDateAndPersonAssignment;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepAP214_RWAutoDesignDateAndPersonAssignment;
		 RWStepAP214_RWAutoDesignDateAndPersonAssignment();

		/****************** ReadStep ******************/
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
		%feature("compactdefaultargs") RWStepAP214_RWAutoDesignDocumentReference;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepAP214_RWAutoDesignDocumentReference;
		 RWStepAP214_RWAutoDesignDocumentReference();

		/****************** ReadStep ******************/
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
		%feature("compactdefaultargs") RWStepAP214_RWAutoDesignGroupAssignment;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepAP214_RWAutoDesignGroupAssignment;
		 RWStepAP214_RWAutoDesignGroupAssignment();

		/****************** ReadStep ******************/
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
		%feature("compactdefaultargs") RWStepAP214_RWAutoDesignNominalDateAndTimeAssignment;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepAP214_RWAutoDesignNominalDateAndTimeAssignment;
		 RWStepAP214_RWAutoDesignNominalDateAndTimeAssignment();

		/****************** ReadStep ******************/
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
		%feature("compactdefaultargs") RWStepAP214_RWAutoDesignNominalDateAssignment;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepAP214_RWAutoDesignNominalDateAssignment;
		 RWStepAP214_RWAutoDesignNominalDateAssignment();

		/****************** ReadStep ******************/
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
		%feature("compactdefaultargs") RWStepAP214_RWAutoDesignOrganizationAssignment;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepAP214_RWAutoDesignOrganizationAssignment;
		 RWStepAP214_RWAutoDesignOrganizationAssignment();

		/****************** ReadStep ******************/
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
		%feature("compactdefaultargs") RWStepAP214_RWAutoDesignPersonAndOrganizationAssignment;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepAP214_RWAutoDesignPersonAndOrganizationAssignment;
		 RWStepAP214_RWAutoDesignPersonAndOrganizationAssignment();

		/****************** ReadStep ******************/
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
		%feature("compactdefaultargs") RWStepAP214_RWAutoDesignPresentedItem;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepAP214_RWAutoDesignPresentedItem;
		 RWStepAP214_RWAutoDesignPresentedItem();

		/****************** ReadStep ******************/
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
		%feature("compactdefaultargs") RWStepAP214_RWAutoDesignSecurityClassificationAssignment;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepAP214_RWAutoDesignSecurityClassificationAssignment;
		 RWStepAP214_RWAutoDesignSecurityClassificationAssignment();

		/****************** ReadStep ******************/
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
		%feature("compactdefaultargs") RWStepAP214_RWClass;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepAP214_RWClass;
		 RWStepAP214_RWClass();

		/****************** ReadStep ******************/
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
		%feature("compactdefaultargs") RWStepAP214_RWExternallyDefinedClass;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepAP214_RWExternallyDefinedClass;
		 RWStepAP214_RWExternallyDefinedClass();

		/****************** ReadStep ******************/
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
		%feature("compactdefaultargs") RWStepAP214_RWExternallyDefinedGeneralProperty;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepAP214_RWExternallyDefinedGeneralProperty;
		 RWStepAP214_RWExternallyDefinedGeneralProperty();

		/****************** ReadStep ******************/
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
		%feature("compactdefaultargs") RWStepAP214_RWRepItemGroup;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepAP214_RWRepItemGroup;
		 RWStepAP214_RWRepItemGroup();

		/****************** ReadStep ******************/
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
		%feature("compactdefaultargs") RWStepAP214_ReadWriteModule;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepAP214_ReadWriteModule;
		 RWStepAP214_ReadWriteModule();

		/****************** CaseStep ******************/
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
