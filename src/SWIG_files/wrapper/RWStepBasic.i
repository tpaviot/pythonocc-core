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
%define RWSTEPBASICDOCSTRING
"RWStepBasic module, see official documentation at
https://www.opencascade.com/doc/occt-7.4.0/refman/html/package_rwstepbasic.html"
%enddef
%module (package="OCC.Core", docstring=RWSTEPBASICDOCSTRING) RWStepBasic


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
#include<RWStepBasic_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<StepData_module.hxx>
#include<Interface_module.hxx>
#include<StepBasic_module.hxx>
#include<TCollection_module.hxx>
#include<MoniTool_module.hxx>
#include<TCollection_module.hxx>
#include<StepBasic_module.hxx>
#include<Message_module.hxx>
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
%import StepBasic.i
%import TCollection.i

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
/* end handles declaration */

/* templates */
/* end templates declaration */

/* typedefs */
/* end typedefs declaration */

/*****************************
* class RWStepBasic_RWAction *
*****************************/
class RWStepBasic_RWAction {
	public:
		/****************** RWStepBasic_RWAction ******************/
		%feature("compactdefaultargs") RWStepBasic_RWAction;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepBasic_RWAction;
		 RWStepBasic_RWAction();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "Reads action.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepBasic_Action

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepBasic_Action> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "Fills data for graph (shared items).

Parameters
----------
ent: StepBasic_Action
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepBasic_Action> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "Writes action.

Parameters
----------
SW: StepData_StepWriter
ent: StepBasic_Action

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepBasic_Action> & ent);

};


%extend RWStepBasic_RWAction {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************************
* class RWStepBasic_RWActionAssignment *
***************************************/
class RWStepBasic_RWActionAssignment {
	public:
		/****************** RWStepBasic_RWActionAssignment ******************/
		%feature("compactdefaultargs") RWStepBasic_RWActionAssignment;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepBasic_RWActionAssignment;
		 RWStepBasic_RWActionAssignment();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "Reads actionassignment.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepBasic_ActionAssignment

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepBasic_ActionAssignment> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "Fills data for graph (shared items).

Parameters
----------
ent: StepBasic_ActionAssignment
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepBasic_ActionAssignment> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "Writes actionassignment.

Parameters
----------
SW: StepData_StepWriter
ent: StepBasic_ActionAssignment

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepBasic_ActionAssignment> & ent);

};


%extend RWStepBasic_RWActionAssignment {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************************
* class RWStepBasic_RWActionMethod *
***********************************/
class RWStepBasic_RWActionMethod {
	public:
		/****************** RWStepBasic_RWActionMethod ******************/
		%feature("compactdefaultargs") RWStepBasic_RWActionMethod;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepBasic_RWActionMethod;
		 RWStepBasic_RWActionMethod();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "Reads actionmethod.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepBasic_ActionMethod

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepBasic_ActionMethod> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "Fills data for graph (shared items).

Parameters
----------
ent: StepBasic_ActionMethod
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepBasic_ActionMethod> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "Writes actionmethod.

Parameters
----------
SW: StepData_StepWriter
ent: StepBasic_ActionMethod

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepBasic_ActionMethod> & ent);

};


%extend RWStepBasic_RWActionMethod {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************************************
* class RWStepBasic_RWActionRequestAssignment *
**********************************************/
class RWStepBasic_RWActionRequestAssignment {
	public:
		/****************** RWStepBasic_RWActionRequestAssignment ******************/
		%feature("compactdefaultargs") RWStepBasic_RWActionRequestAssignment;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepBasic_RWActionRequestAssignment;
		 RWStepBasic_RWActionRequestAssignment();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "Reads actionrequestassignment.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepBasic_ActionRequestAssignment

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepBasic_ActionRequestAssignment> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "Fills data for graph (shared items).

Parameters
----------
ent: StepBasic_ActionRequestAssignment
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepBasic_ActionRequestAssignment> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "Writes actionrequestassignment.

Parameters
----------
SW: StepData_StepWriter
ent: StepBasic_ActionRequestAssignment

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepBasic_ActionRequestAssignment> & ent);

};


%extend RWStepBasic_RWActionRequestAssignment {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************************
* class RWStepBasic_RWActionRequestSolution *
********************************************/
class RWStepBasic_RWActionRequestSolution {
	public:
		/****************** RWStepBasic_RWActionRequestSolution ******************/
		%feature("compactdefaultargs") RWStepBasic_RWActionRequestSolution;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepBasic_RWActionRequestSolution;
		 RWStepBasic_RWActionRequestSolution();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "Reads actionrequestsolution.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepBasic_ActionRequestSolution

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepBasic_ActionRequestSolution> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "Fills data for graph (shared items).

Parameters
----------
ent: StepBasic_ActionRequestSolution
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepBasic_ActionRequestSolution> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "Writes actionrequestsolution.

Parameters
----------
SW: StepData_StepWriter
ent: StepBasic_ActionRequestSolution

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepBasic_ActionRequestSolution> & ent);

};


%extend RWStepBasic_RWActionRequestSolution {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************
* class RWStepBasic_RWAddress *
******************************/
class RWStepBasic_RWAddress {
	public:
		/****************** RWStepBasic_RWAddress ******************/
		%feature("compactdefaultargs") RWStepBasic_RWAddress;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepBasic_RWAddress;
		 RWStepBasic_RWAddress();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepBasic_Address

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepBasic_Address> & ent);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepBasic_Address

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepBasic_Address> & ent);

};


%extend RWStepBasic_RWAddress {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************************
* class RWStepBasic_RWApplicationContext *
*****************************************/
class RWStepBasic_RWApplicationContext {
	public:
		/****************** RWStepBasic_RWApplicationContext ******************/
		%feature("compactdefaultargs") RWStepBasic_RWApplicationContext;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepBasic_RWApplicationContext;
		 RWStepBasic_RWApplicationContext();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepBasic_ApplicationContext

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepBasic_ApplicationContext> & ent);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepBasic_ApplicationContext

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepBasic_ApplicationContext> & ent);

};


%extend RWStepBasic_RWApplicationContext {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************************************
* class RWStepBasic_RWApplicationContextElement *
************************************************/
class RWStepBasic_RWApplicationContextElement {
	public:
		/****************** RWStepBasic_RWApplicationContextElement ******************/
		%feature("compactdefaultargs") RWStepBasic_RWApplicationContextElement;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepBasic_RWApplicationContextElement;
		 RWStepBasic_RWApplicationContextElement();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepBasic_ApplicationContextElement

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepBasic_ApplicationContextElement> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "No available documentation.

Parameters
----------
ent: StepBasic_ApplicationContextElement
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepBasic_ApplicationContextElement> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepBasic_ApplicationContextElement

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepBasic_ApplicationContextElement> & ent);

};


%extend RWStepBasic_RWApplicationContextElement {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************************************
* class RWStepBasic_RWApplicationProtocolDefinition *
****************************************************/
class RWStepBasic_RWApplicationProtocolDefinition {
	public:
		/****************** RWStepBasic_RWApplicationProtocolDefinition ******************/
		%feature("compactdefaultargs") RWStepBasic_RWApplicationProtocolDefinition;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepBasic_RWApplicationProtocolDefinition;
		 RWStepBasic_RWApplicationProtocolDefinition();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepBasic_ApplicationProtocolDefinition

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepBasic_ApplicationProtocolDefinition> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "No available documentation.

Parameters
----------
ent: StepBasic_ApplicationProtocolDefinition
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepBasic_ApplicationProtocolDefinition> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepBasic_ApplicationProtocolDefinition

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepBasic_ApplicationProtocolDefinition> & ent);

};


%extend RWStepBasic_RWApplicationProtocolDefinition {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************
* class RWStepBasic_RWApproval *
*******************************/
class RWStepBasic_RWApproval {
	public:
		/****************** RWStepBasic_RWApproval ******************/
		%feature("compactdefaultargs") RWStepBasic_RWApproval;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepBasic_RWApproval;
		 RWStepBasic_RWApproval();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepBasic_Approval

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepBasic_Approval> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "No available documentation.

Parameters
----------
ent: StepBasic_Approval
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepBasic_Approval> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepBasic_Approval

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepBasic_Approval> & ent);

};


%extend RWStepBasic_RWApproval {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************************
* class RWStepBasic_RWApprovalDateTime *
***************************************/
class RWStepBasic_RWApprovalDateTime {
	public:
		/****************** RWStepBasic_RWApprovalDateTime ******************/
		%feature("compactdefaultargs") RWStepBasic_RWApprovalDateTime;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepBasic_RWApprovalDateTime;
		 RWStepBasic_RWApprovalDateTime();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepBasic_ApprovalDateTime

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepBasic_ApprovalDateTime> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "No available documentation.

Parameters
----------
ent: StepBasic_ApprovalDateTime
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepBasic_ApprovalDateTime> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepBasic_ApprovalDateTime

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepBasic_ApprovalDateTime> & ent);

};


%extend RWStepBasic_RWApprovalDateTime {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************************************
* class RWStepBasic_RWApprovalPersonOrganization *
*************************************************/
class RWStepBasic_RWApprovalPersonOrganization {
	public:
		/****************** RWStepBasic_RWApprovalPersonOrganization ******************/
		%feature("compactdefaultargs") RWStepBasic_RWApprovalPersonOrganization;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepBasic_RWApprovalPersonOrganization;
		 RWStepBasic_RWApprovalPersonOrganization();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepBasic_ApprovalPersonOrganization

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepBasic_ApprovalPersonOrganization> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "No available documentation.

Parameters
----------
ent: StepBasic_ApprovalPersonOrganization
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepBasic_ApprovalPersonOrganization> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepBasic_ApprovalPersonOrganization

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepBasic_ApprovalPersonOrganization> & ent);

};


%extend RWStepBasic_RWApprovalPersonOrganization {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************************
* class RWStepBasic_RWApprovalRelationship *
*******************************************/
class RWStepBasic_RWApprovalRelationship {
	public:
		/****************** RWStepBasic_RWApprovalRelationship ******************/
		%feature("compactdefaultargs") RWStepBasic_RWApprovalRelationship;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepBasic_RWApprovalRelationship;
		 RWStepBasic_RWApprovalRelationship();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepBasic_ApprovalRelationship

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepBasic_ApprovalRelationship> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "No available documentation.

Parameters
----------
ent: StepBasic_ApprovalRelationship
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepBasic_ApprovalRelationship> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepBasic_ApprovalRelationship

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepBasic_ApprovalRelationship> & ent);

};


%extend RWStepBasic_RWApprovalRelationship {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************************
* class RWStepBasic_RWApprovalRole *
***********************************/
class RWStepBasic_RWApprovalRole {
	public:
		/****************** RWStepBasic_RWApprovalRole ******************/
		%feature("compactdefaultargs") RWStepBasic_RWApprovalRole;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepBasic_RWApprovalRole;
		 RWStepBasic_RWApprovalRole();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepBasic_ApprovalRole

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepBasic_ApprovalRole> & ent);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepBasic_ApprovalRole

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepBasic_ApprovalRole> & ent);

};


%extend RWStepBasic_RWApprovalRole {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************************
* class RWStepBasic_RWApprovalStatus *
*************************************/
class RWStepBasic_RWApprovalStatus {
	public:
		/****************** RWStepBasic_RWApprovalStatus ******************/
		%feature("compactdefaultargs") RWStepBasic_RWApprovalStatus;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepBasic_RWApprovalStatus;
		 RWStepBasic_RWApprovalStatus();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepBasic_ApprovalStatus

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepBasic_ApprovalStatus> & ent);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepBasic_ApprovalStatus

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepBasic_ApprovalStatus> & ent);

};


%extend RWStepBasic_RWApprovalStatus {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************************
* class RWStepBasic_RWCalendarDate *
***********************************/
class RWStepBasic_RWCalendarDate {
	public:
		/****************** RWStepBasic_RWCalendarDate ******************/
		%feature("compactdefaultargs") RWStepBasic_RWCalendarDate;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepBasic_RWCalendarDate;
		 RWStepBasic_RWCalendarDate();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepBasic_CalendarDate

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepBasic_CalendarDate> & ent);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepBasic_CalendarDate

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepBasic_CalendarDate> & ent);

};


%extend RWStepBasic_RWCalendarDate {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************************
* class RWStepBasic_RWCertification *
************************************/
class RWStepBasic_RWCertification {
	public:
		/****************** RWStepBasic_RWCertification ******************/
		%feature("compactdefaultargs") RWStepBasic_RWCertification;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepBasic_RWCertification;
		 RWStepBasic_RWCertification();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "Reads certification.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepBasic_Certification

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepBasic_Certification> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "Fills data for graph (shared items).

Parameters
----------
ent: StepBasic_Certification
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepBasic_Certification> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "Writes certification.

Parameters
----------
SW: StepData_StepWriter
ent: StepBasic_Certification

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepBasic_Certification> & ent);

};


%extend RWStepBasic_RWCertification {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************************************
* class RWStepBasic_RWCertificationAssignment *
**********************************************/
class RWStepBasic_RWCertificationAssignment {
	public:
		/****************** RWStepBasic_RWCertificationAssignment ******************/
		%feature("compactdefaultargs") RWStepBasic_RWCertificationAssignment;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepBasic_RWCertificationAssignment;
		 RWStepBasic_RWCertificationAssignment();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "Reads certificationassignment.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepBasic_CertificationAssignment

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepBasic_CertificationAssignment> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "Fills data for graph (shared items).

Parameters
----------
ent: StepBasic_CertificationAssignment
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepBasic_CertificationAssignment> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "Writes certificationassignment.

Parameters
----------
SW: StepData_StepWriter
ent: StepBasic_CertificationAssignment

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepBasic_CertificationAssignment> & ent);

};


%extend RWStepBasic_RWCertificationAssignment {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************************
* class RWStepBasic_RWCertificationType *
****************************************/
class RWStepBasic_RWCertificationType {
	public:
		/****************** RWStepBasic_RWCertificationType ******************/
		%feature("compactdefaultargs") RWStepBasic_RWCertificationType;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepBasic_RWCertificationType;
		 RWStepBasic_RWCertificationType();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "Reads certificationtype.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepBasic_CertificationType

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepBasic_CertificationType> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "Fills data for graph (shared items).

Parameters
----------
ent: StepBasic_CertificationType
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepBasic_CertificationType> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "Writes certificationtype.

Parameters
----------
SW: StepData_StepWriter
ent: StepBasic_CertificationType

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepBasic_CertificationType> & ent);

};


%extend RWStepBasic_RWCertificationType {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************************
* class RWStepBasic_RWCharacterizedObject *
******************************************/
class RWStepBasic_RWCharacterizedObject {
	public:
		/****************** RWStepBasic_RWCharacterizedObject ******************/
		%feature("compactdefaultargs") RWStepBasic_RWCharacterizedObject;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepBasic_RWCharacterizedObject;
		 RWStepBasic_RWCharacterizedObject();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "Reads characterizedobject.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepBasic_CharacterizedObject

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepBasic_CharacterizedObject> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "Fills data for graph (shared items).

Parameters
----------
ent: StepBasic_CharacterizedObject
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepBasic_CharacterizedObject> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "Writes characterizedobject.

Parameters
----------
SW: StepData_StepWriter
ent: StepBasic_CharacterizedObject

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepBasic_CharacterizedObject> & ent);

};


%extend RWStepBasic_RWCharacterizedObject {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************
* class RWStepBasic_RWContract *
*******************************/
class RWStepBasic_RWContract {
	public:
		/****************** RWStepBasic_RWContract ******************/
		%feature("compactdefaultargs") RWStepBasic_RWContract;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepBasic_RWContract;
		 RWStepBasic_RWContract();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "Reads contract.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepBasic_Contract

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepBasic_Contract> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "Fills data for graph (shared items).

Parameters
----------
ent: StepBasic_Contract
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepBasic_Contract> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "Writes contract.

Parameters
----------
SW: StepData_StepWriter
ent: StepBasic_Contract

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepBasic_Contract> & ent);

};


%extend RWStepBasic_RWContract {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************************
* class RWStepBasic_RWContractAssignment *
*****************************************/
class RWStepBasic_RWContractAssignment {
	public:
		/****************** RWStepBasic_RWContractAssignment ******************/
		%feature("compactdefaultargs") RWStepBasic_RWContractAssignment;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepBasic_RWContractAssignment;
		 RWStepBasic_RWContractAssignment();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "Reads contractassignment.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepBasic_ContractAssignment

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepBasic_ContractAssignment> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "Fills data for graph (shared items).

Parameters
----------
ent: StepBasic_ContractAssignment
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepBasic_ContractAssignment> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "Writes contractassignment.

Parameters
----------
SW: StepData_StepWriter
ent: StepBasic_ContractAssignment

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepBasic_ContractAssignment> & ent);

};


%extend RWStepBasic_RWContractAssignment {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************************
* class RWStepBasic_RWContractType *
***********************************/
class RWStepBasic_RWContractType {
	public:
		/****************** RWStepBasic_RWContractType ******************/
		%feature("compactdefaultargs") RWStepBasic_RWContractType;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepBasic_RWContractType;
		 RWStepBasic_RWContractType();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "Reads contracttype.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepBasic_ContractType

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepBasic_ContractType> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "Fills data for graph (shared items).

Parameters
----------
ent: StepBasic_ContractType
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepBasic_ContractType> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "Writes contracttype.

Parameters
----------
SW: StepData_StepWriter
ent: StepBasic_ContractType

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepBasic_ContractType> & ent);

};


%extend RWStepBasic_RWContractType {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************************
* class RWStepBasic_RWConversionBasedUnit *
******************************************/
class RWStepBasic_RWConversionBasedUnit {
	public:
		/****************** RWStepBasic_RWConversionBasedUnit ******************/
		%feature("compactdefaultargs") RWStepBasic_RWConversionBasedUnit;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepBasic_RWConversionBasedUnit;
		 RWStepBasic_RWConversionBasedUnit();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepBasic_ConversionBasedUnit

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepBasic_ConversionBasedUnit> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "No available documentation.

Parameters
----------
ent: StepBasic_ConversionBasedUnit
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepBasic_ConversionBasedUnit> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepBasic_ConversionBasedUnit

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepBasic_ConversionBasedUnit> & ent);

};


%extend RWStepBasic_RWConversionBasedUnit {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************************************
* class RWStepBasic_RWConversionBasedUnitAndAreaUnit *
*****************************************************/
class RWStepBasic_RWConversionBasedUnitAndAreaUnit {
	public:
		/****************** RWStepBasic_RWConversionBasedUnitAndAreaUnit ******************/
		%feature("compactdefaultargs") RWStepBasic_RWConversionBasedUnitAndAreaUnit;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepBasic_RWConversionBasedUnitAndAreaUnit;
		 RWStepBasic_RWConversionBasedUnitAndAreaUnit();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepBasic_ConversionBasedUnitAndAreaUnit

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepBasic_ConversionBasedUnitAndAreaUnit> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "No available documentation.

Parameters
----------
ent: StepBasic_ConversionBasedUnitAndAreaUnit
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepBasic_ConversionBasedUnitAndAreaUnit> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepBasic_ConversionBasedUnitAndAreaUnit

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepBasic_ConversionBasedUnitAndAreaUnit> & ent);

};


%extend RWStepBasic_RWConversionBasedUnitAndAreaUnit {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************************************
* class RWStepBasic_RWConversionBasedUnitAndLengthUnit *
*******************************************************/
class RWStepBasic_RWConversionBasedUnitAndLengthUnit {
	public:
		/****************** RWStepBasic_RWConversionBasedUnitAndLengthUnit ******************/
		%feature("compactdefaultargs") RWStepBasic_RWConversionBasedUnitAndLengthUnit;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepBasic_RWConversionBasedUnitAndLengthUnit;
		 RWStepBasic_RWConversionBasedUnitAndLengthUnit();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepBasic_ConversionBasedUnitAndLengthUnit

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepBasic_ConversionBasedUnitAndLengthUnit> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "No available documentation.

Parameters
----------
ent: StepBasic_ConversionBasedUnitAndLengthUnit
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepBasic_ConversionBasedUnitAndLengthUnit> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepBasic_ConversionBasedUnitAndLengthUnit

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepBasic_ConversionBasedUnitAndLengthUnit> & ent);

};


%extend RWStepBasic_RWConversionBasedUnitAndLengthUnit {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************************************
* class RWStepBasic_RWConversionBasedUnitAndMassUnit *
*****************************************************/
class RWStepBasic_RWConversionBasedUnitAndMassUnit {
	public:
		/****************** RWStepBasic_RWConversionBasedUnitAndMassUnit ******************/
		%feature("compactdefaultargs") RWStepBasic_RWConversionBasedUnitAndMassUnit;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepBasic_RWConversionBasedUnitAndMassUnit;
		 RWStepBasic_RWConversionBasedUnitAndMassUnit();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepBasic_ConversionBasedUnitAndMassUnit

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepBasic_ConversionBasedUnitAndMassUnit> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "No available documentation.

Parameters
----------
ent: StepBasic_ConversionBasedUnitAndMassUnit
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepBasic_ConversionBasedUnitAndMassUnit> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepBasic_ConversionBasedUnitAndMassUnit

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepBasic_ConversionBasedUnitAndMassUnit> & ent);

};


%extend RWStepBasic_RWConversionBasedUnitAndMassUnit {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************************************************
* class RWStepBasic_RWConversionBasedUnitAndPlaneAngleUnit *
***********************************************************/
class RWStepBasic_RWConversionBasedUnitAndPlaneAngleUnit {
	public:
		/****************** RWStepBasic_RWConversionBasedUnitAndPlaneAngleUnit ******************/
		%feature("compactdefaultargs") RWStepBasic_RWConversionBasedUnitAndPlaneAngleUnit;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepBasic_RWConversionBasedUnitAndPlaneAngleUnit;
		 RWStepBasic_RWConversionBasedUnitAndPlaneAngleUnit();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepBasic_ConversionBasedUnitAndPlaneAngleUnit

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepBasic_ConversionBasedUnitAndPlaneAngleUnit> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "No available documentation.

Parameters
----------
ent: StepBasic_ConversionBasedUnitAndPlaneAngleUnit
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepBasic_ConversionBasedUnitAndPlaneAngleUnit> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepBasic_ConversionBasedUnitAndPlaneAngleUnit

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepBasic_ConversionBasedUnitAndPlaneAngleUnit> & ent);

};


%extend RWStepBasic_RWConversionBasedUnitAndPlaneAngleUnit {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************************************
* class RWStepBasic_RWConversionBasedUnitAndRatioUnit *
******************************************************/
class RWStepBasic_RWConversionBasedUnitAndRatioUnit {
	public:
		/****************** RWStepBasic_RWConversionBasedUnitAndRatioUnit ******************/
		%feature("compactdefaultargs") RWStepBasic_RWConversionBasedUnitAndRatioUnit;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepBasic_RWConversionBasedUnitAndRatioUnit;
		 RWStepBasic_RWConversionBasedUnitAndRatioUnit();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepBasic_ConversionBasedUnitAndRatioUnit

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepBasic_ConversionBasedUnitAndRatioUnit> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "No available documentation.

Parameters
----------
ent: StepBasic_ConversionBasedUnitAndRatioUnit
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepBasic_ConversionBasedUnitAndRatioUnit> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepBasic_ConversionBasedUnitAndRatioUnit

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepBasic_ConversionBasedUnitAndRatioUnit> & ent);

};


%extend RWStepBasic_RWConversionBasedUnitAndRatioUnit {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************************************************
* class RWStepBasic_RWConversionBasedUnitAndSolidAngleUnit *
***********************************************************/
class RWStepBasic_RWConversionBasedUnitAndSolidAngleUnit {
	public:
		/****************** RWStepBasic_RWConversionBasedUnitAndSolidAngleUnit ******************/
		%feature("compactdefaultargs") RWStepBasic_RWConversionBasedUnitAndSolidAngleUnit;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepBasic_RWConversionBasedUnitAndSolidAngleUnit;
		 RWStepBasic_RWConversionBasedUnitAndSolidAngleUnit();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepBasic_ConversionBasedUnitAndSolidAngleUnit

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepBasic_ConversionBasedUnitAndSolidAngleUnit> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "No available documentation.

Parameters
----------
ent: StepBasic_ConversionBasedUnitAndSolidAngleUnit
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepBasic_ConversionBasedUnitAndSolidAngleUnit> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepBasic_ConversionBasedUnitAndSolidAngleUnit

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepBasic_ConversionBasedUnitAndSolidAngleUnit> & ent);

};


%extend RWStepBasic_RWConversionBasedUnitAndSolidAngleUnit {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************************************
* class RWStepBasic_RWConversionBasedUnitAndTimeUnit *
*****************************************************/
class RWStepBasic_RWConversionBasedUnitAndTimeUnit {
	public:
		/****************** RWStepBasic_RWConversionBasedUnitAndTimeUnit ******************/
		%feature("compactdefaultargs") RWStepBasic_RWConversionBasedUnitAndTimeUnit;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepBasic_RWConversionBasedUnitAndTimeUnit;
		 RWStepBasic_RWConversionBasedUnitAndTimeUnit();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepBasic_ConversionBasedUnitAndTimeUnit

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepBasic_ConversionBasedUnitAndTimeUnit> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "No available documentation.

Parameters
----------
ent: StepBasic_ConversionBasedUnitAndTimeUnit
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepBasic_ConversionBasedUnitAndTimeUnit> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepBasic_ConversionBasedUnitAndTimeUnit

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepBasic_ConversionBasedUnitAndTimeUnit> & ent);

};


%extend RWStepBasic_RWConversionBasedUnitAndTimeUnit {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************************************
* class RWStepBasic_RWConversionBasedUnitAndVolumeUnit *
*******************************************************/
class RWStepBasic_RWConversionBasedUnitAndVolumeUnit {
	public:
		/****************** RWStepBasic_RWConversionBasedUnitAndVolumeUnit ******************/
		%feature("compactdefaultargs") RWStepBasic_RWConversionBasedUnitAndVolumeUnit;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepBasic_RWConversionBasedUnitAndVolumeUnit;
		 RWStepBasic_RWConversionBasedUnitAndVolumeUnit();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepBasic_ConversionBasedUnitAndVolumeUnit

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepBasic_ConversionBasedUnitAndVolumeUnit> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "No available documentation.

Parameters
----------
ent: StepBasic_ConversionBasedUnitAndVolumeUnit
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepBasic_ConversionBasedUnitAndVolumeUnit> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepBasic_ConversionBasedUnitAndVolumeUnit

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepBasic_ConversionBasedUnitAndVolumeUnit> & ent);

};


%extend RWStepBasic_RWConversionBasedUnitAndVolumeUnit {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************************************
* class RWStepBasic_RWCoordinatedUniversalTimeOffset *
*****************************************************/
class RWStepBasic_RWCoordinatedUniversalTimeOffset {
	public:
		/****************** RWStepBasic_RWCoordinatedUniversalTimeOffset ******************/
		%feature("compactdefaultargs") RWStepBasic_RWCoordinatedUniversalTimeOffset;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepBasic_RWCoordinatedUniversalTimeOffset;
		 RWStepBasic_RWCoordinatedUniversalTimeOffset();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepBasic_CoordinatedUniversalTimeOffset

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepBasic_CoordinatedUniversalTimeOffset> & ent);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepBasic_CoordinatedUniversalTimeOffset

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepBasic_CoordinatedUniversalTimeOffset> & ent);

};


%extend RWStepBasic_RWCoordinatedUniversalTimeOffset {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************
* class RWStepBasic_RWDate *
***************************/
class RWStepBasic_RWDate {
	public:
		/****************** RWStepBasic_RWDate ******************/
		%feature("compactdefaultargs") RWStepBasic_RWDate;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepBasic_RWDate;
		 RWStepBasic_RWDate();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepBasic_Date

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepBasic_Date> & ent);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepBasic_Date

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepBasic_Date> & ent);

};


%extend RWStepBasic_RWDate {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************************
* class RWStepBasic_RWDateAndTime *
**********************************/
class RWStepBasic_RWDateAndTime {
	public:
		/****************** RWStepBasic_RWDateAndTime ******************/
		%feature("compactdefaultargs") RWStepBasic_RWDateAndTime;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepBasic_RWDateAndTime;
		 RWStepBasic_RWDateAndTime();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepBasic_DateAndTime

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepBasic_DateAndTime> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "No available documentation.

Parameters
----------
ent: StepBasic_DateAndTime
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepBasic_DateAndTime> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepBasic_DateAndTime

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepBasic_DateAndTime> & ent);

};


%extend RWStepBasic_RWDateAndTime {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************
* class RWStepBasic_RWDateRole *
*******************************/
class RWStepBasic_RWDateRole {
	public:
		/****************** RWStepBasic_RWDateRole ******************/
		%feature("compactdefaultargs") RWStepBasic_RWDateRole;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepBasic_RWDateRole;
		 RWStepBasic_RWDateRole();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepBasic_DateRole

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepBasic_DateRole> & ent);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepBasic_DateRole

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepBasic_DateRole> & ent);

};


%extend RWStepBasic_RWDateRole {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************************
* class RWStepBasic_RWDateTimeRole *
***********************************/
class RWStepBasic_RWDateTimeRole {
	public:
		/****************** RWStepBasic_RWDateTimeRole ******************/
		%feature("compactdefaultargs") RWStepBasic_RWDateTimeRole;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepBasic_RWDateTimeRole;
		 RWStepBasic_RWDateTimeRole();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepBasic_DateTimeRole

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepBasic_DateTimeRole> & ent);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepBasic_DateTimeRole

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepBasic_DateTimeRole> & ent);

};


%extend RWStepBasic_RWDateTimeRole {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************************
* class RWStepBasic_RWDerivedUnit *
**********************************/
class RWStepBasic_RWDerivedUnit {
	public:
		/****************** RWStepBasic_RWDerivedUnit ******************/
		%feature("compactdefaultargs") RWStepBasic_RWDerivedUnit;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepBasic_RWDerivedUnit;
		 RWStepBasic_RWDerivedUnit();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepBasic_DerivedUnit

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepBasic_DerivedUnit> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "No available documentation.

Parameters
----------
ent: StepBasic_DerivedUnit
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepBasic_DerivedUnit> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepBasic_DerivedUnit

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepBasic_DerivedUnit> & ent);

};


%extend RWStepBasic_RWDerivedUnit {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************************
* class RWStepBasic_RWDerivedUnitElement *
*****************************************/
class RWStepBasic_RWDerivedUnitElement {
	public:
		/****************** RWStepBasic_RWDerivedUnitElement ******************/
		%feature("compactdefaultargs") RWStepBasic_RWDerivedUnitElement;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepBasic_RWDerivedUnitElement;
		 RWStepBasic_RWDerivedUnitElement();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepBasic_DerivedUnitElement

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepBasic_DerivedUnitElement> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "No available documentation.

Parameters
----------
ent: StepBasic_DerivedUnitElement
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepBasic_DerivedUnitElement> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepBasic_DerivedUnitElement

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepBasic_DerivedUnitElement> & ent);

};


%extend RWStepBasic_RWDerivedUnitElement {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************************
* class RWStepBasic_RWDimensionalExponents *
*******************************************/
class RWStepBasic_RWDimensionalExponents {
	public:
		/****************** RWStepBasic_RWDimensionalExponents ******************/
		%feature("compactdefaultargs") RWStepBasic_RWDimensionalExponents;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepBasic_RWDimensionalExponents;
		 RWStepBasic_RWDimensionalExponents();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepBasic_DimensionalExponents

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepBasic_DimensionalExponents> & ent);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepBasic_DimensionalExponents

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepBasic_DimensionalExponents> & ent);

};


%extend RWStepBasic_RWDimensionalExponents {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************
* class RWStepBasic_RWDocument *
*******************************/
class RWStepBasic_RWDocument {
	public:
		/****************** RWStepBasic_RWDocument ******************/
		%feature("compactdefaultargs") RWStepBasic_RWDocument;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepBasic_RWDocument;
		 RWStepBasic_RWDocument();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "Reads document.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepBasic_Document

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepBasic_Document> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "Fills data for graph (shared items).

Parameters
----------
ent: StepBasic_Document
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepBasic_Document> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "Writes document.

Parameters
----------
SW: StepData_StepWriter
ent: StepBasic_Document

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepBasic_Document> & ent);

};


%extend RWStepBasic_RWDocument {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************************
* class RWStepBasic_RWDocumentFile *
***********************************/
class RWStepBasic_RWDocumentFile {
	public:
		/****************** RWStepBasic_RWDocumentFile ******************/
		%feature("compactdefaultargs") RWStepBasic_RWDocumentFile;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepBasic_RWDocumentFile;
		 RWStepBasic_RWDocumentFile();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "Reads documentfile.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepBasic_DocumentFile

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepBasic_DocumentFile> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "Fills data for graph (shared items).

Parameters
----------
ent: StepBasic_DocumentFile
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepBasic_DocumentFile> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "Writes documentfile.

Parameters
----------
SW: StepData_StepWriter
ent: StepBasic_DocumentFile

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepBasic_DocumentFile> & ent);

};


%extend RWStepBasic_RWDocumentFile {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************************************
* class RWStepBasic_RWDocumentProductAssociation *
*************************************************/
class RWStepBasic_RWDocumentProductAssociation {
	public:
		/****************** RWStepBasic_RWDocumentProductAssociation ******************/
		%feature("compactdefaultargs") RWStepBasic_RWDocumentProductAssociation;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepBasic_RWDocumentProductAssociation;
		 RWStepBasic_RWDocumentProductAssociation();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "Reads documentproductassociation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepBasic_DocumentProductAssociation

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepBasic_DocumentProductAssociation> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "Fills data for graph (shared items).

Parameters
----------
ent: StepBasic_DocumentProductAssociation
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepBasic_DocumentProductAssociation> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "Writes documentproductassociation.

Parameters
----------
SW: StepData_StepWriter
ent: StepBasic_DocumentProductAssociation

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepBasic_DocumentProductAssociation> & ent);

};


%extend RWStepBasic_RWDocumentProductAssociation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************************************
* class RWStepBasic_RWDocumentProductEquivalence *
*************************************************/
class RWStepBasic_RWDocumentProductEquivalence {
	public:
		/****************** RWStepBasic_RWDocumentProductEquivalence ******************/
		%feature("compactdefaultargs") RWStepBasic_RWDocumentProductEquivalence;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepBasic_RWDocumentProductEquivalence;
		 RWStepBasic_RWDocumentProductEquivalence();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "Reads documentproductequivalence.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepBasic_DocumentProductEquivalence

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepBasic_DocumentProductEquivalence> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "Fills data for graph (shared items).

Parameters
----------
ent: StepBasic_DocumentProductEquivalence
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepBasic_DocumentProductEquivalence> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "Writes documentproductequivalence.

Parameters
----------
SW: StepData_StepWriter
ent: StepBasic_DocumentProductEquivalence

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepBasic_DocumentProductEquivalence> & ent);

};


%extend RWStepBasic_RWDocumentProductEquivalence {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************************
* class RWStepBasic_RWDocumentRelationship *
*******************************************/
class RWStepBasic_RWDocumentRelationship {
	public:
		/****************** RWStepBasic_RWDocumentRelationship ******************/
		%feature("compactdefaultargs") RWStepBasic_RWDocumentRelationship;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepBasic_RWDocumentRelationship;
		 RWStepBasic_RWDocumentRelationship();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepBasic_DocumentRelationship

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepBasic_DocumentRelationship> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "No available documentation.

Parameters
----------
ent: StepBasic_DocumentRelationship
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepBasic_DocumentRelationship> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepBasic_DocumentRelationship

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepBasic_DocumentRelationship> & ent);

};


%extend RWStepBasic_RWDocumentRelationship {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************************************
* class RWStepBasic_RWDocumentRepresentationType *
*************************************************/
class RWStepBasic_RWDocumentRepresentationType {
	public:
		/****************** RWStepBasic_RWDocumentRepresentationType ******************/
		%feature("compactdefaultargs") RWStepBasic_RWDocumentRepresentationType;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepBasic_RWDocumentRepresentationType;
		 RWStepBasic_RWDocumentRepresentationType();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "Reads documentrepresentationtype.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepBasic_DocumentRepresentationType

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepBasic_DocumentRepresentationType> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "Fills data for graph (shared items).

Parameters
----------
ent: StepBasic_DocumentRepresentationType
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepBasic_DocumentRepresentationType> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "Writes documentrepresentationtype.

Parameters
----------
SW: StepData_StepWriter
ent: StepBasic_DocumentRepresentationType

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepBasic_DocumentRepresentationType> & ent);

};


%extend RWStepBasic_RWDocumentRepresentationType {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************************
* class RWStepBasic_RWDocumentType *
***********************************/
class RWStepBasic_RWDocumentType {
	public:
		/****************** RWStepBasic_RWDocumentType ******************/
		%feature("compactdefaultargs") RWStepBasic_RWDocumentType;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepBasic_RWDocumentType;
		 RWStepBasic_RWDocumentType();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepBasic_DocumentType

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepBasic_DocumentType> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "No available documentation.

Parameters
----------
ent: StepBasic_DocumentType
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepBasic_DocumentType> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepBasic_DocumentType

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepBasic_DocumentType> & ent);

};


%extend RWStepBasic_RWDocumentType {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************************************
* class RWStepBasic_RWDocumentUsageConstraint *
**********************************************/
class RWStepBasic_RWDocumentUsageConstraint {
	public:
		/****************** RWStepBasic_RWDocumentUsageConstraint ******************/
		%feature("compactdefaultargs") RWStepBasic_RWDocumentUsageConstraint;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepBasic_RWDocumentUsageConstraint;
		 RWStepBasic_RWDocumentUsageConstraint();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepBasic_DocumentUsageConstraint

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepBasic_DocumentUsageConstraint> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "No available documentation.

Parameters
----------
ent: StepBasic_DocumentUsageConstraint
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepBasic_DocumentUsageConstraint> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepBasic_DocumentUsageConstraint

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepBasic_DocumentUsageConstraint> & ent);

};


%extend RWStepBasic_RWDocumentUsageConstraint {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************************
* class RWStepBasic_RWEffectivity *
**********************************/
class RWStepBasic_RWEffectivity {
	public:
		/****************** RWStepBasic_RWEffectivity ******************/
		%feature("compactdefaultargs") RWStepBasic_RWEffectivity;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepBasic_RWEffectivity;
		 RWStepBasic_RWEffectivity();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepBasic_Effectivity

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepBasic_Effectivity> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "No available documentation.

Parameters
----------
ent: StepBasic_Effectivity
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepBasic_Effectivity> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepBasic_Effectivity

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepBasic_Effectivity> & ent);

};


%extend RWStepBasic_RWEffectivity {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************************
* class RWStepBasic_RWEffectivityAssignment *
********************************************/
class RWStepBasic_RWEffectivityAssignment {
	public:
		/****************** RWStepBasic_RWEffectivityAssignment ******************/
		%feature("compactdefaultargs") RWStepBasic_RWEffectivityAssignment;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepBasic_RWEffectivityAssignment;
		 RWStepBasic_RWEffectivityAssignment();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "Reads effectivityassignment.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepBasic_EffectivityAssignment

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepBasic_EffectivityAssignment> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "Fills data for graph (shared items).

Parameters
----------
ent: StepBasic_EffectivityAssignment
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepBasic_EffectivityAssignment> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "Writes effectivityassignment.

Parameters
----------
SW: StepData_StepWriter
ent: StepBasic_EffectivityAssignment

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepBasic_EffectivityAssignment> & ent);

};


%extend RWStepBasic_RWEffectivityAssignment {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************************
* class RWStepBasic_RWEulerAngles *
**********************************/
class RWStepBasic_RWEulerAngles {
	public:
		/****************** RWStepBasic_RWEulerAngles ******************/
		%feature("compactdefaultargs") RWStepBasic_RWEulerAngles;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepBasic_RWEulerAngles;
		 RWStepBasic_RWEulerAngles();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "Reads eulerangles.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepBasic_EulerAngles

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepBasic_EulerAngles> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "Fills data for graph (shared items).

Parameters
----------
ent: StepBasic_EulerAngles
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepBasic_EulerAngles> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "Writes eulerangles.

Parameters
----------
SW: StepData_StepWriter
ent: StepBasic_EulerAngles

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepBasic_EulerAngles> & ent);

};


%extend RWStepBasic_RWEulerAngles {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************************************
* class RWStepBasic_RWExternalIdentificationAssignment *
*******************************************************/
class RWStepBasic_RWExternalIdentificationAssignment {
	public:
		/****************** RWStepBasic_RWExternalIdentificationAssignment ******************/
		%feature("compactdefaultargs") RWStepBasic_RWExternalIdentificationAssignment;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepBasic_RWExternalIdentificationAssignment;
		 RWStepBasic_RWExternalIdentificationAssignment();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "Reads externalidentificationassignment.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepBasic_ExternalIdentificationAssignment

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepBasic_ExternalIdentificationAssignment> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "Fills data for graph (shared items).

Parameters
----------
ent: StepBasic_ExternalIdentificationAssignment
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepBasic_ExternalIdentificationAssignment> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "Writes externalidentificationassignment.

Parameters
----------
SW: StepData_StepWriter
ent: StepBasic_ExternalIdentificationAssignment

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepBasic_ExternalIdentificationAssignment> & ent);

};


%extend RWStepBasic_RWExternalIdentificationAssignment {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************************
* class RWStepBasic_RWExternalSource *
*************************************/
class RWStepBasic_RWExternalSource {
	public:
		/****************** RWStepBasic_RWExternalSource ******************/
		%feature("compactdefaultargs") RWStepBasic_RWExternalSource;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepBasic_RWExternalSource;
		 RWStepBasic_RWExternalSource();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "Reads externalsource.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepBasic_ExternalSource

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepBasic_ExternalSource> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "Fills data for graph (shared items).

Parameters
----------
ent: StepBasic_ExternalSource
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepBasic_ExternalSource> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "Writes externalsource.

Parameters
----------
SW: StepData_StepWriter
ent: StepBasic_ExternalSource

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepBasic_ExternalSource> & ent);

};


%extend RWStepBasic_RWExternalSource {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************************
* class RWStepBasic_RWExternallyDefinedItem *
********************************************/
class RWStepBasic_RWExternallyDefinedItem {
	public:
		/****************** RWStepBasic_RWExternallyDefinedItem ******************/
		%feature("compactdefaultargs") RWStepBasic_RWExternallyDefinedItem;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepBasic_RWExternallyDefinedItem;
		 RWStepBasic_RWExternallyDefinedItem();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "Reads externallydefineditem.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepBasic_ExternallyDefinedItem

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepBasic_ExternallyDefinedItem> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "Fills data for graph (shared items).

Parameters
----------
ent: StepBasic_ExternallyDefinedItem
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepBasic_ExternallyDefinedItem> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "Writes externallydefineditem.

Parameters
----------
SW: StepData_StepWriter
ent: StepBasic_ExternallyDefinedItem

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepBasic_ExternallyDefinedItem> & ent);

};


%extend RWStepBasic_RWExternallyDefinedItem {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************************
* class RWStepBasic_RWGeneralProperty *
**************************************/
class RWStepBasic_RWGeneralProperty {
	public:
		/****************** RWStepBasic_RWGeneralProperty ******************/
		%feature("compactdefaultargs") RWStepBasic_RWGeneralProperty;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepBasic_RWGeneralProperty;
		 RWStepBasic_RWGeneralProperty();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "Reads generalproperty.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepBasic_GeneralProperty

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepBasic_GeneralProperty> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "Fills data for graph (shared items).

Parameters
----------
ent: StepBasic_GeneralProperty
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepBasic_GeneralProperty> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "Writes generalproperty.

Parameters
----------
SW: StepData_StepWriter
ent: StepBasic_GeneralProperty

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepBasic_GeneralProperty> & ent);

};


%extend RWStepBasic_RWGeneralProperty {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************
* class RWStepBasic_RWGroup *
****************************/
class RWStepBasic_RWGroup {
	public:
		/****************** RWStepBasic_RWGroup ******************/
		%feature("compactdefaultargs") RWStepBasic_RWGroup;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepBasic_RWGroup;
		 RWStepBasic_RWGroup();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "Reads group.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepBasic_Group

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepBasic_Group> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "Fills data for graph (shared items).

Parameters
----------
ent: StepBasic_Group
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepBasic_Group> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "Writes group.

Parameters
----------
SW: StepData_StepWriter
ent: StepBasic_Group

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepBasic_Group> & ent);

};


%extend RWStepBasic_RWGroup {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************************
* class RWStepBasic_RWGroupAssignment *
**************************************/
class RWStepBasic_RWGroupAssignment {
	public:
		/****************** RWStepBasic_RWGroupAssignment ******************/
		%feature("compactdefaultargs") RWStepBasic_RWGroupAssignment;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepBasic_RWGroupAssignment;
		 RWStepBasic_RWGroupAssignment();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "Reads groupassignment.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepBasic_GroupAssignment

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepBasic_GroupAssignment> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "Fills data for graph (shared items).

Parameters
----------
ent: StepBasic_GroupAssignment
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepBasic_GroupAssignment> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "Writes groupassignment.

Parameters
----------
SW: StepData_StepWriter
ent: StepBasic_GroupAssignment

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepBasic_GroupAssignment> & ent);

};


%extend RWStepBasic_RWGroupAssignment {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************************
* class RWStepBasic_RWGroupRelationship *
****************************************/
class RWStepBasic_RWGroupRelationship {
	public:
		/****************** RWStepBasic_RWGroupRelationship ******************/
		%feature("compactdefaultargs") RWStepBasic_RWGroupRelationship;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepBasic_RWGroupRelationship;
		 RWStepBasic_RWGroupRelationship();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "Reads grouprelationship.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepBasic_GroupRelationship

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepBasic_GroupRelationship> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "Fills data for graph (shared items).

Parameters
----------
ent: StepBasic_GroupRelationship
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepBasic_GroupRelationship> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "Writes grouprelationship.

Parameters
----------
SW: StepData_StepWriter
ent: StepBasic_GroupRelationship

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepBasic_GroupRelationship> & ent);

};


%extend RWStepBasic_RWGroupRelationship {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************************************
* class RWStepBasic_RWIdentificationAssignment *
***********************************************/
class RWStepBasic_RWIdentificationAssignment {
	public:
		/****************** RWStepBasic_RWIdentificationAssignment ******************/
		%feature("compactdefaultargs") RWStepBasic_RWIdentificationAssignment;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepBasic_RWIdentificationAssignment;
		 RWStepBasic_RWIdentificationAssignment();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "Reads identificationassignment.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepBasic_IdentificationAssignment

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepBasic_IdentificationAssignment> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "Fills data for graph (shared items).

Parameters
----------
ent: StepBasic_IdentificationAssignment
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepBasic_IdentificationAssignment> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "Writes identificationassignment.

Parameters
----------
SW: StepData_StepWriter
ent: StepBasic_IdentificationAssignment

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepBasic_IdentificationAssignment> & ent);

};


%extend RWStepBasic_RWIdentificationAssignment {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************************
* class RWStepBasic_RWIdentificationRole *
*****************************************/
class RWStepBasic_RWIdentificationRole {
	public:
		/****************** RWStepBasic_RWIdentificationRole ******************/
		%feature("compactdefaultargs") RWStepBasic_RWIdentificationRole;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepBasic_RWIdentificationRole;
		 RWStepBasic_RWIdentificationRole();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "Reads identificationrole.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepBasic_IdentificationRole

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepBasic_IdentificationRole> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "Fills data for graph (shared items).

Parameters
----------
ent: StepBasic_IdentificationRole
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepBasic_IdentificationRole> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "Writes identificationrole.

Parameters
----------
SW: StepData_StepWriter
ent: StepBasic_IdentificationRole

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepBasic_IdentificationRole> & ent);

};


%extend RWStepBasic_RWIdentificationRole {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************************
* class RWStepBasic_RWLengthMeasureWithUnit *
********************************************/
class RWStepBasic_RWLengthMeasureWithUnit {
	public:
		/****************** RWStepBasic_RWLengthMeasureWithUnit ******************/
		%feature("compactdefaultargs") RWStepBasic_RWLengthMeasureWithUnit;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepBasic_RWLengthMeasureWithUnit;
		 RWStepBasic_RWLengthMeasureWithUnit();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepBasic_LengthMeasureWithUnit

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepBasic_LengthMeasureWithUnit> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "No available documentation.

Parameters
----------
ent: StepBasic_LengthMeasureWithUnit
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepBasic_LengthMeasureWithUnit> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepBasic_LengthMeasureWithUnit

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepBasic_LengthMeasureWithUnit> & ent);

};


%extend RWStepBasic_RWLengthMeasureWithUnit {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************
* class RWStepBasic_RWLengthUnit *
*********************************/
class RWStepBasic_RWLengthUnit {
	public:
		/****************** RWStepBasic_RWLengthUnit ******************/
		%feature("compactdefaultargs") RWStepBasic_RWLengthUnit;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepBasic_RWLengthUnit;
		 RWStepBasic_RWLengthUnit();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepBasic_LengthUnit

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepBasic_LengthUnit> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "No available documentation.

Parameters
----------
ent: StepBasic_LengthUnit
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepBasic_LengthUnit> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepBasic_LengthUnit

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepBasic_LengthUnit> & ent);

};


%extend RWStepBasic_RWLengthUnit {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************
* class RWStepBasic_RWLocalTime *
********************************/
class RWStepBasic_RWLocalTime {
	public:
		/****************** RWStepBasic_RWLocalTime ******************/
		%feature("compactdefaultargs") RWStepBasic_RWLocalTime;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepBasic_RWLocalTime;
		 RWStepBasic_RWLocalTime();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepBasic_LocalTime

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepBasic_LocalTime> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "No available documentation.

Parameters
----------
ent: StepBasic_LocalTime
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepBasic_LocalTime> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepBasic_LocalTime

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepBasic_LocalTime> & ent);

};


%extend RWStepBasic_RWLocalTime {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************************
* class RWStepBasic_RWMassMeasureWithUnit *
******************************************/
class RWStepBasic_RWMassMeasureWithUnit {
	public:
		/****************** RWStepBasic_RWMassMeasureWithUnit ******************/
		%feature("compactdefaultargs") RWStepBasic_RWMassMeasureWithUnit;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepBasic_RWMassMeasureWithUnit;
		 RWStepBasic_RWMassMeasureWithUnit();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepBasic_MassMeasureWithUnit

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepBasic_MassMeasureWithUnit> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "No available documentation.

Parameters
----------
ent: StepBasic_MassMeasureWithUnit
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepBasic_MassMeasureWithUnit> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepBasic_MassMeasureWithUnit

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepBasic_MassMeasureWithUnit> & ent);

};


%extend RWStepBasic_RWMassMeasureWithUnit {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************
* class RWStepBasic_RWMassUnit *
*******************************/
class RWStepBasic_RWMassUnit {
	public:
		/****************** RWStepBasic_RWMassUnit ******************/
		%feature("compactdefaultargs") RWStepBasic_RWMassUnit;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepBasic_RWMassUnit;
		 RWStepBasic_RWMassUnit();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "Reads massunit.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepBasic_MassUnit

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepBasic_MassUnit> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "Fills data for graph (shared items).

Parameters
----------
ent: StepBasic_MassUnit
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepBasic_MassUnit> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "Writes massunit.

Parameters
----------
SW: StepData_StepWriter
ent: StepBasic_MassUnit

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepBasic_MassUnit> & ent);

};


%extend RWStepBasic_RWMassUnit {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************************
* class RWStepBasic_RWMeasureWithUnit *
**************************************/
class RWStepBasic_RWMeasureWithUnit {
	public:
		/****************** RWStepBasic_RWMeasureWithUnit ******************/
		%feature("compactdefaultargs") RWStepBasic_RWMeasureWithUnit;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepBasic_RWMeasureWithUnit;
		 RWStepBasic_RWMeasureWithUnit();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepBasic_MeasureWithUnit

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepBasic_MeasureWithUnit> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "No available documentation.

Parameters
----------
ent: StepBasic_MeasureWithUnit
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepBasic_MeasureWithUnit> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepBasic_MeasureWithUnit

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepBasic_MeasureWithUnit> & ent);

};


%extend RWStepBasic_RWMeasureWithUnit {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************************
* class RWStepBasic_RWMechanicalContext *
****************************************/
class RWStepBasic_RWMechanicalContext {
	public:
		/****************** RWStepBasic_RWMechanicalContext ******************/
		%feature("compactdefaultargs") RWStepBasic_RWMechanicalContext;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepBasic_RWMechanicalContext;
		 RWStepBasic_RWMechanicalContext();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepBasic_MechanicalContext

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepBasic_MechanicalContext> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "No available documentation.

Parameters
----------
ent: StepBasic_MechanicalContext
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepBasic_MechanicalContext> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepBasic_MechanicalContext

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepBasic_MechanicalContext> & ent);

};


%extend RWStepBasic_RWMechanicalContext {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************************
* class RWStepBasic_RWNameAssignment *
*************************************/
class RWStepBasic_RWNameAssignment {
	public:
		/****************** RWStepBasic_RWNameAssignment ******************/
		%feature("compactdefaultargs") RWStepBasic_RWNameAssignment;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepBasic_RWNameAssignment;
		 RWStepBasic_RWNameAssignment();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "Reads nameassignment.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepBasic_NameAssignment

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepBasic_NameAssignment> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "Fills data for graph (shared items).

Parameters
----------
ent: StepBasic_NameAssignment
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepBasic_NameAssignment> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "Writes nameassignment.

Parameters
----------
SW: StepData_StepWriter
ent: StepBasic_NameAssignment

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepBasic_NameAssignment> & ent);

};


%extend RWStepBasic_RWNameAssignment {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************
* class RWStepBasic_RWNamedUnit *
********************************/
class RWStepBasic_RWNamedUnit {
	public:
		/****************** RWStepBasic_RWNamedUnit ******************/
		%feature("compactdefaultargs") RWStepBasic_RWNamedUnit;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepBasic_RWNamedUnit;
		 RWStepBasic_RWNamedUnit();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepBasic_NamedUnit

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepBasic_NamedUnit> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "No available documentation.

Parameters
----------
ent: StepBasic_NamedUnit
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepBasic_NamedUnit> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepBasic_NamedUnit

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepBasic_NamedUnit> & ent);

};


%extend RWStepBasic_RWNamedUnit {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************
* class RWStepBasic_RWObjectRole *
*********************************/
class RWStepBasic_RWObjectRole {
	public:
		/****************** RWStepBasic_RWObjectRole ******************/
		%feature("compactdefaultargs") RWStepBasic_RWObjectRole;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepBasic_RWObjectRole;
		 RWStepBasic_RWObjectRole();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "Reads objectrole.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepBasic_ObjectRole

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepBasic_ObjectRole> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "Fills data for graph (shared items).

Parameters
----------
ent: StepBasic_ObjectRole
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepBasic_ObjectRole> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "Writes objectrole.

Parameters
----------
SW: StepData_StepWriter
ent: StepBasic_ObjectRole

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepBasic_ObjectRole> & ent);

};


%extend RWStepBasic_RWObjectRole {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************************
* class RWStepBasic_RWOrdinalDate *
**********************************/
class RWStepBasic_RWOrdinalDate {
	public:
		/****************** RWStepBasic_RWOrdinalDate ******************/
		%feature("compactdefaultargs") RWStepBasic_RWOrdinalDate;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepBasic_RWOrdinalDate;
		 RWStepBasic_RWOrdinalDate();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepBasic_OrdinalDate

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepBasic_OrdinalDate> & ent);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepBasic_OrdinalDate

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepBasic_OrdinalDate> & ent);

};


%extend RWStepBasic_RWOrdinalDate {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************************
* class RWStepBasic_RWOrganization *
***********************************/
class RWStepBasic_RWOrganization {
	public:
		/****************** RWStepBasic_RWOrganization ******************/
		%feature("compactdefaultargs") RWStepBasic_RWOrganization;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepBasic_RWOrganization;
		 RWStepBasic_RWOrganization();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepBasic_Organization

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepBasic_Organization> & ent);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepBasic_Organization

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepBasic_Organization> & ent);

};


%extend RWStepBasic_RWOrganization {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************************
* class RWStepBasic_RWOrganizationRole *
***************************************/
class RWStepBasic_RWOrganizationRole {
	public:
		/****************** RWStepBasic_RWOrganizationRole ******************/
		%feature("compactdefaultargs") RWStepBasic_RWOrganizationRole;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepBasic_RWOrganizationRole;
		 RWStepBasic_RWOrganizationRole();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepBasic_OrganizationRole

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepBasic_OrganizationRole> & ent);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepBasic_OrganizationRole

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepBasic_OrganizationRole> & ent);

};


%extend RWStepBasic_RWOrganizationRole {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************************
* class RWStepBasic_RWOrganizationalAddress *
********************************************/
class RWStepBasic_RWOrganizationalAddress {
	public:
		/****************** RWStepBasic_RWOrganizationalAddress ******************/
		%feature("compactdefaultargs") RWStepBasic_RWOrganizationalAddress;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepBasic_RWOrganizationalAddress;
		 RWStepBasic_RWOrganizationalAddress();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepBasic_OrganizationalAddress

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepBasic_OrganizationalAddress> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "No available documentation.

Parameters
----------
ent: StepBasic_OrganizationalAddress
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepBasic_OrganizationalAddress> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepBasic_OrganizationalAddress

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepBasic_OrganizationalAddress> & ent);

};


%extend RWStepBasic_RWOrganizationalAddress {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************
* class RWStepBasic_RWPerson *
*****************************/
class RWStepBasic_RWPerson {
	public:
		/****************** RWStepBasic_RWPerson ******************/
		%feature("compactdefaultargs") RWStepBasic_RWPerson;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepBasic_RWPerson;
		 RWStepBasic_RWPerson();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepBasic_Person

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepBasic_Person> & ent);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepBasic_Person

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepBasic_Person> & ent);

};


%extend RWStepBasic_RWPerson {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************************
* class RWStepBasic_RWPersonAndOrganization *
********************************************/
class RWStepBasic_RWPersonAndOrganization {
	public:
		/****************** RWStepBasic_RWPersonAndOrganization ******************/
		%feature("compactdefaultargs") RWStepBasic_RWPersonAndOrganization;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepBasic_RWPersonAndOrganization;
		 RWStepBasic_RWPersonAndOrganization();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepBasic_PersonAndOrganization

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepBasic_PersonAndOrganization> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "No available documentation.

Parameters
----------
ent: StepBasic_PersonAndOrganization
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepBasic_PersonAndOrganization> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepBasic_PersonAndOrganization

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepBasic_PersonAndOrganization> & ent);

};


%extend RWStepBasic_RWPersonAndOrganization {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************************************
* class RWStepBasic_RWPersonAndOrganizationRole *
************************************************/
class RWStepBasic_RWPersonAndOrganizationRole {
	public:
		/****************** RWStepBasic_RWPersonAndOrganizationRole ******************/
		%feature("compactdefaultargs") RWStepBasic_RWPersonAndOrganizationRole;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepBasic_RWPersonAndOrganizationRole;
		 RWStepBasic_RWPersonAndOrganizationRole();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepBasic_PersonAndOrganizationRole

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepBasic_PersonAndOrganizationRole> & ent);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepBasic_PersonAndOrganizationRole

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepBasic_PersonAndOrganizationRole> & ent);

};


%extend RWStepBasic_RWPersonAndOrganizationRole {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************************
* class RWStepBasic_RWPersonalAddress *
**************************************/
class RWStepBasic_RWPersonalAddress {
	public:
		/****************** RWStepBasic_RWPersonalAddress ******************/
		%feature("compactdefaultargs") RWStepBasic_RWPersonalAddress;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepBasic_RWPersonalAddress;
		 RWStepBasic_RWPersonalAddress();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepBasic_PersonalAddress

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepBasic_PersonalAddress> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "No available documentation.

Parameters
----------
ent: StepBasic_PersonalAddress
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepBasic_PersonalAddress> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepBasic_PersonalAddress

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepBasic_PersonalAddress> & ent);

};


%extend RWStepBasic_RWPersonalAddress {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************************************
* class RWStepBasic_RWPlaneAngleMeasureWithUnit *
************************************************/
class RWStepBasic_RWPlaneAngleMeasureWithUnit {
	public:
		/****************** RWStepBasic_RWPlaneAngleMeasureWithUnit ******************/
		%feature("compactdefaultargs") RWStepBasic_RWPlaneAngleMeasureWithUnit;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepBasic_RWPlaneAngleMeasureWithUnit;
		 RWStepBasic_RWPlaneAngleMeasureWithUnit();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepBasic_PlaneAngleMeasureWithUnit

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepBasic_PlaneAngleMeasureWithUnit> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "No available documentation.

Parameters
----------
ent: StepBasic_PlaneAngleMeasureWithUnit
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepBasic_PlaneAngleMeasureWithUnit> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepBasic_PlaneAngleMeasureWithUnit

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepBasic_PlaneAngleMeasureWithUnit> & ent);

};


%extend RWStepBasic_RWPlaneAngleMeasureWithUnit {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************************
* class RWStepBasic_RWPlaneAngleUnit *
*************************************/
class RWStepBasic_RWPlaneAngleUnit {
	public:
		/****************** RWStepBasic_RWPlaneAngleUnit ******************/
		%feature("compactdefaultargs") RWStepBasic_RWPlaneAngleUnit;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepBasic_RWPlaneAngleUnit;
		 RWStepBasic_RWPlaneAngleUnit();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepBasic_PlaneAngleUnit

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepBasic_PlaneAngleUnit> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "No available documentation.

Parameters
----------
ent: StepBasic_PlaneAngleUnit
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepBasic_PlaneAngleUnit> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepBasic_PlaneAngleUnit

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepBasic_PlaneAngleUnit> & ent);

};


%extend RWStepBasic_RWPlaneAngleUnit {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************
* class RWStepBasic_RWProduct *
******************************/
class RWStepBasic_RWProduct {
	public:
		/****************** RWStepBasic_RWProduct ******************/
		%feature("compactdefaultargs") RWStepBasic_RWProduct;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepBasic_RWProduct;
		 RWStepBasic_RWProduct();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepBasic_Product

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepBasic_Product> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "No available documentation.

Parameters
----------
ent: StepBasic_Product
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepBasic_Product> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepBasic_Product

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepBasic_Product> & ent);

};


%extend RWStepBasic_RWProduct {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************************
* class RWStepBasic_RWProductCategory *
**************************************/
class RWStepBasic_RWProductCategory {
	public:
		/****************** RWStepBasic_RWProductCategory ******************/
		%feature("compactdefaultargs") RWStepBasic_RWProductCategory;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepBasic_RWProductCategory;
		 RWStepBasic_RWProductCategory();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepBasic_ProductCategory

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepBasic_ProductCategory> & ent);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepBasic_ProductCategory

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepBasic_ProductCategory> & ent);

};


%extend RWStepBasic_RWProductCategory {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************************************
* class RWStepBasic_RWProductCategoryRelationship *
**************************************************/
class RWStepBasic_RWProductCategoryRelationship {
	public:
		/****************** RWStepBasic_RWProductCategoryRelationship ******************/
		%feature("compactdefaultargs") RWStepBasic_RWProductCategoryRelationship;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepBasic_RWProductCategoryRelationship;
		 RWStepBasic_RWProductCategoryRelationship();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "Reads productcategoryrelationship.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepBasic_ProductCategoryRelationship

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepBasic_ProductCategoryRelationship> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "Fills data for graph (shared items).

Parameters
----------
ent: StepBasic_ProductCategoryRelationship
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepBasic_ProductCategoryRelationship> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "Writes productcategoryrelationship.

Parameters
----------
SW: StepData_StepWriter
ent: StepBasic_ProductCategoryRelationship

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepBasic_ProductCategoryRelationship> & ent);

};


%extend RWStepBasic_RWProductCategoryRelationship {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************************
* class RWStepBasic_RWProductConceptContext *
********************************************/
class RWStepBasic_RWProductConceptContext {
	public:
		/****************** RWStepBasic_RWProductConceptContext ******************/
		%feature("compactdefaultargs") RWStepBasic_RWProductConceptContext;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepBasic_RWProductConceptContext;
		 RWStepBasic_RWProductConceptContext();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "Reads productconceptcontext.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepBasic_ProductConceptContext

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepBasic_ProductConceptContext> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "Fills data for graph (shared items).

Parameters
----------
ent: StepBasic_ProductConceptContext
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepBasic_ProductConceptContext> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "Writes productconceptcontext.

Parameters
----------
SW: StepData_StepWriter
ent: StepBasic_ProductConceptContext

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepBasic_ProductConceptContext> & ent);

};


%extend RWStepBasic_RWProductConceptContext {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************************
* class RWStepBasic_RWProductContext *
*************************************/
class RWStepBasic_RWProductContext {
	public:
		/****************** RWStepBasic_RWProductContext ******************/
		%feature("compactdefaultargs") RWStepBasic_RWProductContext;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepBasic_RWProductContext;
		 RWStepBasic_RWProductContext();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepBasic_ProductContext

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepBasic_ProductContext> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "No available documentation.

Parameters
----------
ent: StepBasic_ProductContext
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepBasic_ProductContext> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepBasic_ProductContext

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepBasic_ProductContext> & ent);

};


%extend RWStepBasic_RWProductContext {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************************
* class RWStepBasic_RWProductDefinition *
****************************************/
class RWStepBasic_RWProductDefinition {
	public:
		/****************** RWStepBasic_RWProductDefinition ******************/
		%feature("compactdefaultargs") RWStepBasic_RWProductDefinition;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepBasic_RWProductDefinition;
		 RWStepBasic_RWProductDefinition();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepBasic_ProductDefinition

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepBasic_ProductDefinition> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "No available documentation.

Parameters
----------
ent: StepBasic_ProductDefinition
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepBasic_ProductDefinition> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepBasic_ProductDefinition

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepBasic_ProductDefinition> & ent);

};


%extend RWStepBasic_RWProductDefinition {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************************************
* class RWStepBasic_RWProductDefinitionContext *
***********************************************/
class RWStepBasic_RWProductDefinitionContext {
	public:
		/****************** RWStepBasic_RWProductDefinitionContext ******************/
		%feature("compactdefaultargs") RWStepBasic_RWProductDefinitionContext;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepBasic_RWProductDefinitionContext;
		 RWStepBasic_RWProductDefinitionContext();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepBasic_ProductDefinitionContext

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepBasic_ProductDefinitionContext> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "No available documentation.

Parameters
----------
ent: StepBasic_ProductDefinitionContext
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepBasic_ProductDefinitionContext> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepBasic_ProductDefinitionContext

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepBasic_ProductDefinitionContext> & ent);

};


%extend RWStepBasic_RWProductDefinitionContext {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************************************
* class RWStepBasic_RWProductDefinitionEffectivity *
***************************************************/
class RWStepBasic_RWProductDefinitionEffectivity {
	public:
		/****************** RWStepBasic_RWProductDefinitionEffectivity ******************/
		%feature("compactdefaultargs") RWStepBasic_RWProductDefinitionEffectivity;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepBasic_RWProductDefinitionEffectivity;
		 RWStepBasic_RWProductDefinitionEffectivity();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepBasic_ProductDefinitionEffectivity

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepBasic_ProductDefinitionEffectivity> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "No available documentation.

Parameters
----------
ent: StepBasic_ProductDefinitionEffectivity
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepBasic_ProductDefinitionEffectivity> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepBasic_ProductDefinitionEffectivity

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepBasic_ProductDefinitionEffectivity> & ent);

};


%extend RWStepBasic_RWProductDefinitionEffectivity {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************************************
* class RWStepBasic_RWProductDefinitionFormation *
*************************************************/
class RWStepBasic_RWProductDefinitionFormation {
	public:
		/****************** RWStepBasic_RWProductDefinitionFormation ******************/
		%feature("compactdefaultargs") RWStepBasic_RWProductDefinitionFormation;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepBasic_RWProductDefinitionFormation;
		 RWStepBasic_RWProductDefinitionFormation();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepBasic_ProductDefinitionFormation

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepBasic_ProductDefinitionFormation> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "No available documentation.

Parameters
----------
ent: StepBasic_ProductDefinitionFormation
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepBasic_ProductDefinitionFormation> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepBasic_ProductDefinitionFormation

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepBasic_ProductDefinitionFormation> & ent);

};


%extend RWStepBasic_RWProductDefinitionFormation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************************************************
* class RWStepBasic_RWProductDefinitionFormationRelationship *
*************************************************************/
class RWStepBasic_RWProductDefinitionFormationRelationship {
	public:
		/****************** RWStepBasic_RWProductDefinitionFormationRelationship ******************/
		%feature("compactdefaultargs") RWStepBasic_RWProductDefinitionFormationRelationship;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepBasic_RWProductDefinitionFormationRelationship;
		 RWStepBasic_RWProductDefinitionFormationRelationship();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "Reads productdefinitionformationrelationship.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepBasic_ProductDefinitionFormationRelationship

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepBasic_ProductDefinitionFormationRelationship> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "Fills data for graph (shared items).

Parameters
----------
ent: StepBasic_ProductDefinitionFormationRelationship
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepBasic_ProductDefinitionFormationRelationship> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "Writes productdefinitionformationrelationship.

Parameters
----------
SW: StepData_StepWriter
ent: StepBasic_ProductDefinitionFormationRelationship

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepBasic_ProductDefinitionFormationRelationship> & ent);

};


%extend RWStepBasic_RWProductDefinitionFormationRelationship {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************************************************
* class RWStepBasic_RWProductDefinitionFormationWithSpecifiedSource *
********************************************************************/
class RWStepBasic_RWProductDefinitionFormationWithSpecifiedSource {
	public:
		/****************** RWStepBasic_RWProductDefinitionFormationWithSpecifiedSource ******************/
		%feature("compactdefaultargs") RWStepBasic_RWProductDefinitionFormationWithSpecifiedSource;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepBasic_RWProductDefinitionFormationWithSpecifiedSource;
		 RWStepBasic_RWProductDefinitionFormationWithSpecifiedSource();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepBasic_ProductDefinitionFormationWithSpecifiedSource

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepBasic_ProductDefinitionFormationWithSpecifiedSource> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "No available documentation.

Parameters
----------
ent: StepBasic_ProductDefinitionFormationWithSpecifiedSource
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepBasic_ProductDefinitionFormationWithSpecifiedSource> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepBasic_ProductDefinitionFormationWithSpecifiedSource

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepBasic_ProductDefinitionFormationWithSpecifiedSource> & ent);

};


%extend RWStepBasic_RWProductDefinitionFormationWithSpecifiedSource {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************************************
* class RWStepBasic_RWProductDefinitionReference *
*************************************************/
class RWStepBasic_RWProductDefinitionReference {
	public:
		/****************** RWStepBasic_RWProductDefinitionReference ******************/
		%feature("compactdefaultargs") RWStepBasic_RWProductDefinitionReference;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepBasic_RWProductDefinitionReference;
		 RWStepBasic_RWProductDefinitionReference();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepBasic_ProductDefinitionReference

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepBasic_ProductDefinitionReference> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "No available documentation.

Parameters
----------
ent: StepBasic_ProductDefinitionReference
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepBasic_ProductDefinitionReference> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepBasic_ProductDefinitionReference

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepBasic_ProductDefinitionReference> & ent);

};


%extend RWStepBasic_RWProductDefinitionReference {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************************************************************
* class RWStepBasic_RWProductDefinitionReferenceWithLocalRepresentation *
************************************************************************/
class RWStepBasic_RWProductDefinitionReferenceWithLocalRepresentation {
	public:
		/****************** RWStepBasic_RWProductDefinitionReferenceWithLocalRepresentation ******************/
		%feature("compactdefaultargs") RWStepBasic_RWProductDefinitionReferenceWithLocalRepresentation;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepBasic_RWProductDefinitionReferenceWithLocalRepresentation;
		 RWStepBasic_RWProductDefinitionReferenceWithLocalRepresentation();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepBasic_ProductDefinitionReferenceWithLocalRepresentation

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepBasic_ProductDefinitionReferenceWithLocalRepresentation> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "No available documentation.

Parameters
----------
ent: StepBasic_ProductDefinitionReferenceWithLocalRepresentation
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepBasic_ProductDefinitionReferenceWithLocalRepresentation> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepBasic_ProductDefinitionReferenceWithLocalRepresentation

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepBasic_ProductDefinitionReferenceWithLocalRepresentation> & ent);

};


%extend RWStepBasic_RWProductDefinitionReferenceWithLocalRepresentation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************************************
* class RWStepBasic_RWProductDefinitionRelationship *
****************************************************/
class RWStepBasic_RWProductDefinitionRelationship {
	public:
		/****************** RWStepBasic_RWProductDefinitionRelationship ******************/
		%feature("compactdefaultargs") RWStepBasic_RWProductDefinitionRelationship;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepBasic_RWProductDefinitionRelationship;
		 RWStepBasic_RWProductDefinitionRelationship();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "Reads productdefinitionrelationship.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepBasic_ProductDefinitionRelationship

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepBasic_ProductDefinitionRelationship> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "Fills data for graph (shared items).

Parameters
----------
ent: StepBasic_ProductDefinitionRelationship
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepBasic_ProductDefinitionRelationship> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "Writes productdefinitionrelationship.

Parameters
----------
SW: StepData_StepWriter
ent: StepBasic_ProductDefinitionRelationship

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepBasic_ProductDefinitionRelationship> & ent);

};


%extend RWStepBasic_RWProductDefinitionRelationship {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************************************************
* class RWStepBasic_RWProductDefinitionWithAssociatedDocuments *
***************************************************************/
class RWStepBasic_RWProductDefinitionWithAssociatedDocuments {
	public:
		/****************** RWStepBasic_RWProductDefinitionWithAssociatedDocuments ******************/
		%feature("compactdefaultargs") RWStepBasic_RWProductDefinitionWithAssociatedDocuments;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepBasic_RWProductDefinitionWithAssociatedDocuments;
		 RWStepBasic_RWProductDefinitionWithAssociatedDocuments();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepBasic_ProductDefinitionWithAssociatedDocuments

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepBasic_ProductDefinitionWithAssociatedDocuments> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "No available documentation.

Parameters
----------
ent: StepBasic_ProductDefinitionWithAssociatedDocuments
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepBasic_ProductDefinitionWithAssociatedDocuments> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepBasic_ProductDefinitionWithAssociatedDocuments

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepBasic_ProductDefinitionWithAssociatedDocuments> & ent);

};


%extend RWStepBasic_RWProductDefinitionWithAssociatedDocuments {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************************************
* class RWStepBasic_RWProductRelatedProductCategory *
****************************************************/
class RWStepBasic_RWProductRelatedProductCategory {
	public:
		/****************** RWStepBasic_RWProductRelatedProductCategory ******************/
		%feature("compactdefaultargs") RWStepBasic_RWProductRelatedProductCategory;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepBasic_RWProductRelatedProductCategory;
		 RWStepBasic_RWProductRelatedProductCategory();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepBasic_ProductRelatedProductCategory

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepBasic_ProductRelatedProductCategory> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "No available documentation.

Parameters
----------
ent: StepBasic_ProductRelatedProductCategory
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepBasic_ProductRelatedProductCategory> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepBasic_ProductRelatedProductCategory

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepBasic_ProductRelatedProductCategory> & ent);

};


%extend RWStepBasic_RWProductRelatedProductCategory {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************************
* class RWStepBasic_RWProductType *
**********************************/
class RWStepBasic_RWProductType {
	public:
		/****************** RWStepBasic_RWProductType ******************/
		%feature("compactdefaultargs") RWStepBasic_RWProductType;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepBasic_RWProductType;
		 RWStepBasic_RWProductType();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepBasic_ProductType

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepBasic_ProductType> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "No available documentation.

Parameters
----------
ent: StepBasic_ProductType
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepBasic_ProductType> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepBasic_ProductType

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepBasic_ProductType> & ent);

};


%extend RWStepBasic_RWProductType {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************************
* class RWStepBasic_RWRatioMeasureWithUnit *
*******************************************/
class RWStepBasic_RWRatioMeasureWithUnit {
	public:
		/****************** RWStepBasic_RWRatioMeasureWithUnit ******************/
		%feature("compactdefaultargs") RWStepBasic_RWRatioMeasureWithUnit;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepBasic_RWRatioMeasureWithUnit;
		 RWStepBasic_RWRatioMeasureWithUnit();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepBasic_RatioMeasureWithUnit

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepBasic_RatioMeasureWithUnit> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "No available documentation.

Parameters
----------
ent: StepBasic_RatioMeasureWithUnit
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepBasic_RatioMeasureWithUnit> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepBasic_RatioMeasureWithUnit

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepBasic_RatioMeasureWithUnit> & ent);

};


%extend RWStepBasic_RWRatioMeasureWithUnit {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************************
* class RWStepBasic_RWRoleAssociation *
**************************************/
class RWStepBasic_RWRoleAssociation {
	public:
		/****************** RWStepBasic_RWRoleAssociation ******************/
		%feature("compactdefaultargs") RWStepBasic_RWRoleAssociation;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepBasic_RWRoleAssociation;
		 RWStepBasic_RWRoleAssociation();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "Reads roleassociation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepBasic_RoleAssociation

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepBasic_RoleAssociation> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "Fills data for graph (shared items).

Parameters
----------
ent: StepBasic_RoleAssociation
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepBasic_RoleAssociation> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "Writes roleassociation.

Parameters
----------
SW: StepData_StepWriter
ent: StepBasic_RoleAssociation

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepBasic_RoleAssociation> & ent);

};


%extend RWStepBasic_RWRoleAssociation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************************
* class RWStepBasic_RWSecurityClassification *
*********************************************/
class RWStepBasic_RWSecurityClassification {
	public:
		/****************** RWStepBasic_RWSecurityClassification ******************/
		%feature("compactdefaultargs") RWStepBasic_RWSecurityClassification;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepBasic_RWSecurityClassification;
		 RWStepBasic_RWSecurityClassification();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepBasic_SecurityClassification

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepBasic_SecurityClassification> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "No available documentation.

Parameters
----------
ent: StepBasic_SecurityClassification
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepBasic_SecurityClassification> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepBasic_SecurityClassification

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepBasic_SecurityClassification> & ent);

};


%extend RWStepBasic_RWSecurityClassification {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************************************
* class RWStepBasic_RWSecurityClassificationLevel *
**************************************************/
class RWStepBasic_RWSecurityClassificationLevel {
	public:
		/****************** RWStepBasic_RWSecurityClassificationLevel ******************/
		%feature("compactdefaultargs") RWStepBasic_RWSecurityClassificationLevel;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepBasic_RWSecurityClassificationLevel;
		 RWStepBasic_RWSecurityClassificationLevel();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepBasic_SecurityClassificationLevel

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepBasic_SecurityClassificationLevel> & ent);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepBasic_SecurityClassificationLevel

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepBasic_SecurityClassificationLevel> & ent);

};


%extend RWStepBasic_RWSecurityClassificationLevel {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************
* class RWStepBasic_RWSiUnit *
*****************************/
class RWStepBasic_RWSiUnit {
	public:
		/****************** RWStepBasic_RWSiUnit ******************/
		%feature("compactdefaultargs") RWStepBasic_RWSiUnit;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepBasic_RWSiUnit;
		 RWStepBasic_RWSiUnit();

		/****************** DecodeName ******************/
		%feature("compactdefaultargs") DecodeName;
		%feature("autodoc", "No available documentation.

Parameters
----------
aName: StepBasic_SiUnitName
text: char *

Returns
-------
bool
") DecodeName;
		Standard_Boolean DecodeName(StepBasic_SiUnitName & aName, const char * text);

		/****************** DecodePrefix ******************/
		%feature("compactdefaultargs") DecodePrefix;
		%feature("autodoc", "No available documentation.

Parameters
----------
aPrefix: StepBasic_SiPrefix
text: char *

Returns
-------
bool
") DecodePrefix;
		Standard_Boolean DecodePrefix(StepBasic_SiPrefix & aPrefix, const char * text);

		/****************** EncodeName ******************/
		%feature("compactdefaultargs") EncodeName;
		%feature("autodoc", "No available documentation.

Parameters
----------
aName: StepBasic_SiUnitName

Returns
-------
TCollection_AsciiString
") EncodeName;
		TCollection_AsciiString EncodeName(const StepBasic_SiUnitName aName);

		/****************** EncodePrefix ******************/
		%feature("compactdefaultargs") EncodePrefix;
		%feature("autodoc", "No available documentation.

Parameters
----------
aPrefix: StepBasic_SiPrefix

Returns
-------
TCollection_AsciiString
") EncodePrefix;
		TCollection_AsciiString EncodePrefix(const StepBasic_SiPrefix aPrefix);

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepBasic_SiUnit

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepBasic_SiUnit> & ent);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepBasic_SiUnit

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepBasic_SiUnit> & ent);

};


%extend RWStepBasic_RWSiUnit {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************************
* class RWStepBasic_RWSiUnitAndAreaUnit *
****************************************/
class RWStepBasic_RWSiUnitAndAreaUnit {
	public:
		/****************** RWStepBasic_RWSiUnitAndAreaUnit ******************/
		%feature("compactdefaultargs") RWStepBasic_RWSiUnitAndAreaUnit;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepBasic_RWSiUnitAndAreaUnit;
		 RWStepBasic_RWSiUnitAndAreaUnit();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepBasic_SiUnitAndAreaUnit

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepBasic_SiUnitAndAreaUnit> & ent);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepBasic_SiUnitAndAreaUnit

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepBasic_SiUnitAndAreaUnit> & ent);

};


%extend RWStepBasic_RWSiUnitAndAreaUnit {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************************
* class RWStepBasic_RWSiUnitAndLengthUnit *
******************************************/
class RWStepBasic_RWSiUnitAndLengthUnit {
	public:
		/****************** RWStepBasic_RWSiUnitAndLengthUnit ******************/
		%feature("compactdefaultargs") RWStepBasic_RWSiUnitAndLengthUnit;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepBasic_RWSiUnitAndLengthUnit;
		 RWStepBasic_RWSiUnitAndLengthUnit();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepBasic_SiUnitAndLengthUnit

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepBasic_SiUnitAndLengthUnit> & ent);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepBasic_SiUnitAndLengthUnit

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepBasic_SiUnitAndLengthUnit> & ent);

};


%extend RWStepBasic_RWSiUnitAndLengthUnit {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************************
* class RWStepBasic_RWSiUnitAndMassUnit *
****************************************/
class RWStepBasic_RWSiUnitAndMassUnit {
	public:
		/****************** RWStepBasic_RWSiUnitAndMassUnit ******************/
		%feature("compactdefaultargs") RWStepBasic_RWSiUnitAndMassUnit;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepBasic_RWSiUnitAndMassUnit;
		 RWStepBasic_RWSiUnitAndMassUnit();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepBasic_SiUnitAndMassUnit

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepBasic_SiUnitAndMassUnit> & ent);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepBasic_SiUnitAndMassUnit

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepBasic_SiUnitAndMassUnit> & ent);

};


%extend RWStepBasic_RWSiUnitAndMassUnit {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************************************
* class RWStepBasic_RWSiUnitAndPlaneAngleUnit *
**********************************************/
class RWStepBasic_RWSiUnitAndPlaneAngleUnit {
	public:
		/****************** RWStepBasic_RWSiUnitAndPlaneAngleUnit ******************/
		%feature("compactdefaultargs") RWStepBasic_RWSiUnitAndPlaneAngleUnit;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepBasic_RWSiUnitAndPlaneAngleUnit;
		 RWStepBasic_RWSiUnitAndPlaneAngleUnit();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepBasic_SiUnitAndPlaneAngleUnit

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepBasic_SiUnitAndPlaneAngleUnit> & ent);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepBasic_SiUnitAndPlaneAngleUnit

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepBasic_SiUnitAndPlaneAngleUnit> & ent);

};


%extend RWStepBasic_RWSiUnitAndPlaneAngleUnit {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************************
* class RWStepBasic_RWSiUnitAndRatioUnit *
*****************************************/
class RWStepBasic_RWSiUnitAndRatioUnit {
	public:
		/****************** RWStepBasic_RWSiUnitAndRatioUnit ******************/
		%feature("compactdefaultargs") RWStepBasic_RWSiUnitAndRatioUnit;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepBasic_RWSiUnitAndRatioUnit;
		 RWStepBasic_RWSiUnitAndRatioUnit();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepBasic_SiUnitAndRatioUnit

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepBasic_SiUnitAndRatioUnit> & ent);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepBasic_SiUnitAndRatioUnit

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepBasic_SiUnitAndRatioUnit> & ent);

};


%extend RWStepBasic_RWSiUnitAndRatioUnit {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************************************
* class RWStepBasic_RWSiUnitAndSolidAngleUnit *
**********************************************/
class RWStepBasic_RWSiUnitAndSolidAngleUnit {
	public:
		/****************** RWStepBasic_RWSiUnitAndSolidAngleUnit ******************/
		%feature("compactdefaultargs") RWStepBasic_RWSiUnitAndSolidAngleUnit;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepBasic_RWSiUnitAndSolidAngleUnit;
		 RWStepBasic_RWSiUnitAndSolidAngleUnit();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepBasic_SiUnitAndSolidAngleUnit

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepBasic_SiUnitAndSolidAngleUnit> & ent);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepBasic_SiUnitAndSolidAngleUnit

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepBasic_SiUnitAndSolidAngleUnit> & ent);

};


%extend RWStepBasic_RWSiUnitAndSolidAngleUnit {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************************************************
* class RWStepBasic_RWSiUnitAndThermodynamicTemperatureUnit *
************************************************************/
class RWStepBasic_RWSiUnitAndThermodynamicTemperatureUnit {
	public:
		/****************** RWStepBasic_RWSiUnitAndThermodynamicTemperatureUnit ******************/
		%feature("compactdefaultargs") RWStepBasic_RWSiUnitAndThermodynamicTemperatureUnit;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepBasic_RWSiUnitAndThermodynamicTemperatureUnit;
		 RWStepBasic_RWSiUnitAndThermodynamicTemperatureUnit();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepBasic_SiUnitAndThermodynamicTemperatureUnit

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepBasic_SiUnitAndThermodynamicTemperatureUnit> & ent);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepBasic_SiUnitAndThermodynamicTemperatureUnit

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepBasic_SiUnitAndThermodynamicTemperatureUnit> & ent);

};


%extend RWStepBasic_RWSiUnitAndThermodynamicTemperatureUnit {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************************
* class RWStepBasic_RWSiUnitAndTimeUnit *
****************************************/
class RWStepBasic_RWSiUnitAndTimeUnit {
	public:
		/****************** RWStepBasic_RWSiUnitAndTimeUnit ******************/
		%feature("compactdefaultargs") RWStepBasic_RWSiUnitAndTimeUnit;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepBasic_RWSiUnitAndTimeUnit;
		 RWStepBasic_RWSiUnitAndTimeUnit();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepBasic_SiUnitAndTimeUnit

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepBasic_SiUnitAndTimeUnit> & ent);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepBasic_SiUnitAndTimeUnit

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepBasic_SiUnitAndTimeUnit> & ent);

};


%extend RWStepBasic_RWSiUnitAndTimeUnit {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************************
* class RWStepBasic_RWSiUnitAndVolumeUnit *
******************************************/
class RWStepBasic_RWSiUnitAndVolumeUnit {
	public:
		/****************** RWStepBasic_RWSiUnitAndVolumeUnit ******************/
		%feature("compactdefaultargs") RWStepBasic_RWSiUnitAndVolumeUnit;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepBasic_RWSiUnitAndVolumeUnit;
		 RWStepBasic_RWSiUnitAndVolumeUnit();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepBasic_SiUnitAndVolumeUnit

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepBasic_SiUnitAndVolumeUnit> & ent);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepBasic_SiUnitAndVolumeUnit

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepBasic_SiUnitAndVolumeUnit> & ent);

};


%extend RWStepBasic_RWSiUnitAndVolumeUnit {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************************************
* class RWStepBasic_RWSolidAngleMeasureWithUnit *
************************************************/
class RWStepBasic_RWSolidAngleMeasureWithUnit {
	public:
		/****************** RWStepBasic_RWSolidAngleMeasureWithUnit ******************/
		%feature("compactdefaultargs") RWStepBasic_RWSolidAngleMeasureWithUnit;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepBasic_RWSolidAngleMeasureWithUnit;
		 RWStepBasic_RWSolidAngleMeasureWithUnit();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepBasic_SolidAngleMeasureWithUnit

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepBasic_SolidAngleMeasureWithUnit> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "No available documentation.

Parameters
----------
ent: StepBasic_SolidAngleMeasureWithUnit
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepBasic_SolidAngleMeasureWithUnit> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepBasic_SolidAngleMeasureWithUnit

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepBasic_SolidAngleMeasureWithUnit> & ent);

};


%extend RWStepBasic_RWSolidAngleMeasureWithUnit {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************************
* class RWStepBasic_RWSolidAngleUnit *
*************************************/
class RWStepBasic_RWSolidAngleUnit {
	public:
		/****************** RWStepBasic_RWSolidAngleUnit ******************/
		%feature("compactdefaultargs") RWStepBasic_RWSolidAngleUnit;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepBasic_RWSolidAngleUnit;
		 RWStepBasic_RWSolidAngleUnit();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepBasic_SolidAngleUnit

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepBasic_SolidAngleUnit> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "No available documentation.

Parameters
----------
ent: StepBasic_SolidAngleUnit
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepBasic_SolidAngleUnit> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepBasic_SolidAngleUnit

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepBasic_SolidAngleUnit> & ent);

};


%extend RWStepBasic_RWSolidAngleUnit {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************************************
* class RWStepBasic_RWThermodynamicTemperatureUnit *
***************************************************/
class RWStepBasic_RWThermodynamicTemperatureUnit {
	public:
		/****************** RWStepBasic_RWThermodynamicTemperatureUnit ******************/
		%feature("compactdefaultargs") RWStepBasic_RWThermodynamicTemperatureUnit;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepBasic_RWThermodynamicTemperatureUnit;
		 RWStepBasic_RWThermodynamicTemperatureUnit();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "Reads thermodynamictemperatureunit.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepBasic_ThermodynamicTemperatureUnit

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepBasic_ThermodynamicTemperatureUnit> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "Fills data for graph (shared items).

Parameters
----------
ent: StepBasic_ThermodynamicTemperatureUnit
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepBasic_ThermodynamicTemperatureUnit> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "Writes thermodynamictemperatureunit.

Parameters
----------
SW: StepData_StepWriter
ent: StepBasic_ThermodynamicTemperatureUnit

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepBasic_ThermodynamicTemperatureUnit> & ent);

};


%extend RWStepBasic_RWThermodynamicTemperatureUnit {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************************************
* class RWStepBasic_RWUncertaintyMeasureWithUnit *
*************************************************/
class RWStepBasic_RWUncertaintyMeasureWithUnit {
	public:
		/****************** RWStepBasic_RWUncertaintyMeasureWithUnit ******************/
		%feature("compactdefaultargs") RWStepBasic_RWUncertaintyMeasureWithUnit;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepBasic_RWUncertaintyMeasureWithUnit;
		 RWStepBasic_RWUncertaintyMeasureWithUnit();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepBasic_UncertaintyMeasureWithUnit

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepBasic_UncertaintyMeasureWithUnit> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "No available documentation.

Parameters
----------
ent: StepBasic_UncertaintyMeasureWithUnit
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepBasic_UncertaintyMeasureWithUnit> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepBasic_UncertaintyMeasureWithUnit

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepBasic_UncertaintyMeasureWithUnit> & ent);

};


%extend RWStepBasic_RWUncertaintyMeasureWithUnit {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************************
* class RWStepBasic_RWVersionedActionRequest *
*********************************************/
class RWStepBasic_RWVersionedActionRequest {
	public:
		/****************** RWStepBasic_RWVersionedActionRequest ******************/
		%feature("compactdefaultargs") RWStepBasic_RWVersionedActionRequest;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepBasic_RWVersionedActionRequest;
		 RWStepBasic_RWVersionedActionRequest();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "Reads versionedactionrequest.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepBasic_VersionedActionRequest

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepBasic_VersionedActionRequest> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "Fills data for graph (shared items).

Parameters
----------
ent: StepBasic_VersionedActionRequest
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepBasic_VersionedActionRequest> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "Writes versionedactionrequest.

Parameters
----------
SW: StepData_StepWriter
ent: StepBasic_VersionedActionRequest

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepBasic_VersionedActionRequest> & ent);

};


%extend RWStepBasic_RWVersionedActionRequest {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************************
* class RWStepBasic_RWWeekOfYearAndDayDate *
*******************************************/
class RWStepBasic_RWWeekOfYearAndDayDate {
	public:
		/****************** RWStepBasic_RWWeekOfYearAndDayDate ******************/
		%feature("compactdefaultargs") RWStepBasic_RWWeekOfYearAndDayDate;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepBasic_RWWeekOfYearAndDayDate;
		 RWStepBasic_RWWeekOfYearAndDayDate();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepBasic_WeekOfYearAndDayDate

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepBasic_WeekOfYearAndDayDate> & ent);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepBasic_WeekOfYearAndDayDate

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepBasic_WeekOfYearAndDayDate> & ent);

};


%extend RWStepBasic_RWWeekOfYearAndDayDate {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/* harray1 classes */
/* harray2 classes */
/* hsequence classes */
