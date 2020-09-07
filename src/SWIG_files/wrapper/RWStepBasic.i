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
		/**** md5 signature: 80281de702ef8ab50a568d39a1a71637 ****/
		%feature("compactdefaultargs") RWStepBasic_RWAction;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepBasic_RWAction;
		 RWStepBasic_RWAction();

		/****************** ReadStep ******************/
		/**** md5 signature: b18f3ac424b1c82307b3c9bf5a9baff5 ****/
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
		/**** md5 signature: c3e8026924b381481085fd479c14757b ****/
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
		/**** md5 signature: 59d37eb5e5ed62c713b9ce88c091068d ****/
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
		/**** md5 signature: 2f6c59ada39fb8d84de573ba8f940367 ****/
		%feature("compactdefaultargs") RWStepBasic_RWActionAssignment;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepBasic_RWActionAssignment;
		 RWStepBasic_RWActionAssignment();

		/****************** ReadStep ******************/
		/**** md5 signature: 3add343048acb09667be1cb3f4f11722 ****/
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
		/**** md5 signature: 8aefb9f1461391523454f7b3360709f7 ****/
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
		/**** md5 signature: 9eb5f44f8e5a12f06b99299adf444437 ****/
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
		/**** md5 signature: a3104152577bef52b9951282cc0cdc33 ****/
		%feature("compactdefaultargs") RWStepBasic_RWActionMethod;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepBasic_RWActionMethod;
		 RWStepBasic_RWActionMethod();

		/****************** ReadStep ******************/
		/**** md5 signature: 02a6dd103af6678348c31a3b951c8ea9 ****/
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
		/**** md5 signature: d677eaab4bafb675e968be21551b3b34 ****/
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
		/**** md5 signature: 95d4fb824ea81e6be17705cf4ae838a9 ****/
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
		/**** md5 signature: a836f9ff814bc320318b8a0ded743eba ****/
		%feature("compactdefaultargs") RWStepBasic_RWActionRequestAssignment;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepBasic_RWActionRequestAssignment;
		 RWStepBasic_RWActionRequestAssignment();

		/****************** ReadStep ******************/
		/**** md5 signature: c71eed7a38f5161c6aaf33abf3acc020 ****/
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
		/**** md5 signature: c6aa598826de37bc9a64005399c45290 ****/
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
		/**** md5 signature: 1e969b384838b7fa06d398f52243d566 ****/
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
		/**** md5 signature: 9b6f3f44432f59761211f5ff3d8f4173 ****/
		%feature("compactdefaultargs") RWStepBasic_RWActionRequestSolution;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepBasic_RWActionRequestSolution;
		 RWStepBasic_RWActionRequestSolution();

		/****************** ReadStep ******************/
		/**** md5 signature: 6a032f23f859fc456e7ca0085c6aa21e ****/
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
		/**** md5 signature: b24ffeacd82e966296815fb3e23d5211 ****/
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
		/**** md5 signature: 80bcb555c91bef61e42b152e90b32337 ****/
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
		/**** md5 signature: 1cf741b11708fd04cb1c46f7778907c2 ****/
		%feature("compactdefaultargs") RWStepBasic_RWAddress;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepBasic_RWAddress;
		 RWStepBasic_RWAddress();

		/****************** ReadStep ******************/
		/**** md5 signature: 9eb6e20bc79fdb055d9343625ce522ad ****/
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
		/**** md5 signature: eb614a1bab3ae009f249f1dddb9afb45 ****/
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
		/**** md5 signature: a5f731bd1b7dfdef2ff122fb0faccec6 ****/
		%feature("compactdefaultargs") RWStepBasic_RWApplicationContext;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepBasic_RWApplicationContext;
		 RWStepBasic_RWApplicationContext();

		/****************** ReadStep ******************/
		/**** md5 signature: ae887d5d9fa01805920d1a7ebe6a6e54 ****/
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
		/**** md5 signature: 0f497576c85790b640ae205b3c212eed ****/
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
		/**** md5 signature: 0e3351bca7ddfe546b36b17f3d23d0ea ****/
		%feature("compactdefaultargs") RWStepBasic_RWApplicationContextElement;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepBasic_RWApplicationContextElement;
		 RWStepBasic_RWApplicationContextElement();

		/****************** ReadStep ******************/
		/**** md5 signature: 1efcad2f36484bfb737c78c55268ec90 ****/
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
		/**** md5 signature: 1ed8c1070e4e86479b5d920ec71d3c6a ****/
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
		/**** md5 signature: 00b7801c04ad33d1f9fcd2ff813971f3 ****/
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
		/**** md5 signature: ffc7d40bc108b39ede5f0a6a0b31c411 ****/
		%feature("compactdefaultargs") RWStepBasic_RWApplicationProtocolDefinition;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepBasic_RWApplicationProtocolDefinition;
		 RWStepBasic_RWApplicationProtocolDefinition();

		/****************** ReadStep ******************/
		/**** md5 signature: 77fe84e293fe8c44f93afcf1b2585d7c ****/
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
		/**** md5 signature: 15b78e8dfb8818cd0b46befb90c55fc7 ****/
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
		/**** md5 signature: 0a64ca1f749252a0c5000dae802fc8f1 ****/
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
		/**** md5 signature: 949a6559fcc44bab62e7302d2de5584e ****/
		%feature("compactdefaultargs") RWStepBasic_RWApproval;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepBasic_RWApproval;
		 RWStepBasic_RWApproval();

		/****************** ReadStep ******************/
		/**** md5 signature: e9094cf784f30ffc9fac7e9fe422f3d8 ****/
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
		/**** md5 signature: 6dab189d94a2f444343fff06ab241156 ****/
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
		/**** md5 signature: 4e289c74cdfc64fdec776a611e01596d ****/
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
		/**** md5 signature: 6a1b308a0f2dd99b3e2b46d5a0ddf046 ****/
		%feature("compactdefaultargs") RWStepBasic_RWApprovalDateTime;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepBasic_RWApprovalDateTime;
		 RWStepBasic_RWApprovalDateTime();

		/****************** ReadStep ******************/
		/**** md5 signature: 25e2aaedb3e7ec55b55252fc7d9924ec ****/
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
		/**** md5 signature: 74cbdff4e92645efee3204651bdd0699 ****/
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
		/**** md5 signature: 265d05ed2bd4805d3f1170112ebaad5a ****/
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
		/**** md5 signature: 1d6cb061e36b8f54c84b3939e562fc87 ****/
		%feature("compactdefaultargs") RWStepBasic_RWApprovalPersonOrganization;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepBasic_RWApprovalPersonOrganization;
		 RWStepBasic_RWApprovalPersonOrganization();

		/****************** ReadStep ******************/
		/**** md5 signature: fda8134e08a690f129aa82f329f67688 ****/
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
		/**** md5 signature: 6ad7ece00d209abd96fbcd94a5220474 ****/
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
		/**** md5 signature: d31fe5d96ca49bdebc33356248fa3105 ****/
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
		/**** md5 signature: 5231a3ab3d0ffbae83271276348c5f42 ****/
		%feature("compactdefaultargs") RWStepBasic_RWApprovalRelationship;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepBasic_RWApprovalRelationship;
		 RWStepBasic_RWApprovalRelationship();

		/****************** ReadStep ******************/
		/**** md5 signature: d44cd805da1df82d62e25f36295c3d19 ****/
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
		/**** md5 signature: 60f42a882d8827f0b9fd7d3acf612f02 ****/
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
		/**** md5 signature: a5e1c6b8f1aae0d37fce9b72ece0a434 ****/
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
		/**** md5 signature: dc91e6d964eded959cb38abf72b90a37 ****/
		%feature("compactdefaultargs") RWStepBasic_RWApprovalRole;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepBasic_RWApprovalRole;
		 RWStepBasic_RWApprovalRole();

		/****************** ReadStep ******************/
		/**** md5 signature: 2b7aa61dc004888252c0e427fa429482 ****/
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
		/**** md5 signature: fba0cac0b91e17de23c5ab66d7c01752 ****/
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
		/**** md5 signature: 043e121b93080128203121828ca8d49b ****/
		%feature("compactdefaultargs") RWStepBasic_RWApprovalStatus;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepBasic_RWApprovalStatus;
		 RWStepBasic_RWApprovalStatus();

		/****************** ReadStep ******************/
		/**** md5 signature: 31184b9a97723aacae409e3f2fb9e1a3 ****/
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
		/**** md5 signature: 32220b4e432a717a93d576ad20643019 ****/
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
		/**** md5 signature: 3231f013fecea6ef335a3c484b1680b1 ****/
		%feature("compactdefaultargs") RWStepBasic_RWCalendarDate;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepBasic_RWCalendarDate;
		 RWStepBasic_RWCalendarDate();

		/****************** ReadStep ******************/
		/**** md5 signature: 43fe865acb3eeb82bb695032518404e5 ****/
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
		/**** md5 signature: e42f23711b72ab23fb010f090acb302b ****/
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
		/**** md5 signature: 3c73adccba53a7e1643c4b006f77c7d0 ****/
		%feature("compactdefaultargs") RWStepBasic_RWCertification;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepBasic_RWCertification;
		 RWStepBasic_RWCertification();

		/****************** ReadStep ******************/
		/**** md5 signature: 8d6ffa60c90e9cda5a220389c93ef655 ****/
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
		/**** md5 signature: b5d7dcefb8c8a2f4cfd4a6c358c57d63 ****/
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
		/**** md5 signature: 71fbc80c26a33046c2c4c4e722b29b43 ****/
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
		/**** md5 signature: b2afa93491e0b40b81874e1d0cf56a8f ****/
		%feature("compactdefaultargs") RWStepBasic_RWCertificationAssignment;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepBasic_RWCertificationAssignment;
		 RWStepBasic_RWCertificationAssignment();

		/****************** ReadStep ******************/
		/**** md5 signature: ce676c4b53b7e4b48c5e261082fd4360 ****/
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
		/**** md5 signature: 11708bd687102cd027f254cdc293f36e ****/
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
		/**** md5 signature: 6da465d183475ba4942e0110efe6373e ****/
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
		/**** md5 signature: 2510b75cf5a6c78d7ec448096ba5e2ca ****/
		%feature("compactdefaultargs") RWStepBasic_RWCertificationType;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepBasic_RWCertificationType;
		 RWStepBasic_RWCertificationType();

		/****************** ReadStep ******************/
		/**** md5 signature: 48d1949fb0ea5e40ce32851b6b5044d2 ****/
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
		/**** md5 signature: 025532743451ee5d5ea3418a4e6b56a5 ****/
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
		/**** md5 signature: 7d5494603e847ba56a3663fdddd5d378 ****/
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
		/**** md5 signature: 63d5e7d5e23c9f8a29c8ca217eb2a82b ****/
		%feature("compactdefaultargs") RWStepBasic_RWCharacterizedObject;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepBasic_RWCharacterizedObject;
		 RWStepBasic_RWCharacterizedObject();

		/****************** ReadStep ******************/
		/**** md5 signature: 6b03e81ef294f4439a16ef7498c72455 ****/
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
		/**** md5 signature: dcacbf60ac8479eba8c7ddf8576c8288 ****/
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
		/**** md5 signature: b64d5607d8e14ec2401634d24be76476 ****/
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
		/**** md5 signature: aba6dbebdfc570914ea50590984c9607 ****/
		%feature("compactdefaultargs") RWStepBasic_RWContract;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepBasic_RWContract;
		 RWStepBasic_RWContract();

		/****************** ReadStep ******************/
		/**** md5 signature: aeb530584eddf1f614bef6195245f15b ****/
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
		/**** md5 signature: f3508e447099668a84fbfbd5ed46703a ****/
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
		/**** md5 signature: ee18d8ef15c7833b4d759f75b46e6e91 ****/
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
		/**** md5 signature: c08cbc3c2229a33c1f0d0ca6bfa52e22 ****/
		%feature("compactdefaultargs") RWStepBasic_RWContractAssignment;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepBasic_RWContractAssignment;
		 RWStepBasic_RWContractAssignment();

		/****************** ReadStep ******************/
		/**** md5 signature: f339eaf8e5d047f2ad04a2c13d5b50cd ****/
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
		/**** md5 signature: 37039d2e211d559e31ab73b5ca822de5 ****/
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
		/**** md5 signature: e3882d634cfb2c193856d4de6e270e7a ****/
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
		/**** md5 signature: a63384ef92c5c66b78649eb7b929b043 ****/
		%feature("compactdefaultargs") RWStepBasic_RWContractType;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepBasic_RWContractType;
		 RWStepBasic_RWContractType();

		/****************** ReadStep ******************/
		/**** md5 signature: 71eb2f42ab5a823b7ff648500b2d46bd ****/
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
		/**** md5 signature: e673b209aa9049847ca7f67d7b80a642 ****/
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
		/**** md5 signature: 767c4731042d1afa688a50a720e4d5a0 ****/
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
		/**** md5 signature: 73181ca5c8aa5d321a91465afa853aea ****/
		%feature("compactdefaultargs") RWStepBasic_RWConversionBasedUnit;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepBasic_RWConversionBasedUnit;
		 RWStepBasic_RWConversionBasedUnit();

		/****************** ReadStep ******************/
		/**** md5 signature: fcbe87fa5bf2ef005eeaa2e7d648114d ****/
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
		/**** md5 signature: 899c2b8d73e7e5a2349aecc7a9c61898 ****/
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
		/**** md5 signature: 472b8ce1f04ed0d34e4267b0ac8fc31f ****/
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
		/**** md5 signature: 40112e864223e371b81e4867c6077656 ****/
		%feature("compactdefaultargs") RWStepBasic_RWConversionBasedUnitAndAreaUnit;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepBasic_RWConversionBasedUnitAndAreaUnit;
		 RWStepBasic_RWConversionBasedUnitAndAreaUnit();

		/****************** ReadStep ******************/
		/**** md5 signature: 644f8d3e77bb3abc4019ae78fc72e1c3 ****/
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
		/**** md5 signature: 0b86c04995d1c25440e8eb0c1ecb0674 ****/
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
		/**** md5 signature: f1e0b3edcd28088ccc72553b5f75ddb0 ****/
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
		/**** md5 signature: 7f2946c6cba093e5d91138134ca77dfa ****/
		%feature("compactdefaultargs") RWStepBasic_RWConversionBasedUnitAndLengthUnit;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepBasic_RWConversionBasedUnitAndLengthUnit;
		 RWStepBasic_RWConversionBasedUnitAndLengthUnit();

		/****************** ReadStep ******************/
		/**** md5 signature: c7bfb0177bd3929750e9a32169bf33a9 ****/
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
		/**** md5 signature: 52647d5ceb57b950eea49eb15602f9dc ****/
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
		/**** md5 signature: f33748abb7154594df4037c8d5979b86 ****/
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
		/**** md5 signature: b530d1a5c21d3e546a2299c281c0104c ****/
		%feature("compactdefaultargs") RWStepBasic_RWConversionBasedUnitAndMassUnit;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepBasic_RWConversionBasedUnitAndMassUnit;
		 RWStepBasic_RWConversionBasedUnitAndMassUnit();

		/****************** ReadStep ******************/
		/**** md5 signature: cdfda4753dbc4d7a5039898ecb75eb4d ****/
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
		/**** md5 signature: 122400966f11ff95c8ab315209978c21 ****/
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
		/**** md5 signature: def49c76eb32c2ccd2c5166f2be30950 ****/
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
		/**** md5 signature: 1ff1af288ca857b028cfcc5a510f7ab5 ****/
		%feature("compactdefaultargs") RWStepBasic_RWConversionBasedUnitAndPlaneAngleUnit;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepBasic_RWConversionBasedUnitAndPlaneAngleUnit;
		 RWStepBasic_RWConversionBasedUnitAndPlaneAngleUnit();

		/****************** ReadStep ******************/
		/**** md5 signature: 51ab548a07ca4a7d2d36a389b371fdc1 ****/
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
		/**** md5 signature: a97d18de8cd934cdd908d8592833a7ec ****/
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
		/**** md5 signature: 609e3a6299f997b7c4160f4d73d11d1a ****/
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
		/**** md5 signature: 8257067306207dab1924e84c8da2b932 ****/
		%feature("compactdefaultargs") RWStepBasic_RWConversionBasedUnitAndRatioUnit;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepBasic_RWConversionBasedUnitAndRatioUnit;
		 RWStepBasic_RWConversionBasedUnitAndRatioUnit();

		/****************** ReadStep ******************/
		/**** md5 signature: be02847ae98d57e74ec8db53cd74f24d ****/
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
		/**** md5 signature: af3688b9e87250012435b816dbf172d1 ****/
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
		/**** md5 signature: 4c91cd9502be50e1444f9f7a5c26ad2a ****/
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
		/**** md5 signature: 5d82616da7580621c3f3fef5ede738b7 ****/
		%feature("compactdefaultargs") RWStepBasic_RWConversionBasedUnitAndSolidAngleUnit;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepBasic_RWConversionBasedUnitAndSolidAngleUnit;
		 RWStepBasic_RWConversionBasedUnitAndSolidAngleUnit();

		/****************** ReadStep ******************/
		/**** md5 signature: 52776f54ad7c9204e3cd44930ba572a8 ****/
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
		/**** md5 signature: 15e4e70098e070f1b006108488717b71 ****/
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
		/**** md5 signature: 0eccecf10ee57b6261af414a13d1e84a ****/
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
		/**** md5 signature: c15b36897b893ae85ef993c890dab784 ****/
		%feature("compactdefaultargs") RWStepBasic_RWConversionBasedUnitAndTimeUnit;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepBasic_RWConversionBasedUnitAndTimeUnit;
		 RWStepBasic_RWConversionBasedUnitAndTimeUnit();

		/****************** ReadStep ******************/
		/**** md5 signature: 138eb87fb56207a2dbf433469f8b1ec5 ****/
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
		/**** md5 signature: f7f445e55df7153c18e8419ef83e14a1 ****/
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
		/**** md5 signature: 447208564e70ffbf9b3a8acdf58bc0d0 ****/
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
		/**** md5 signature: ac98cb4f0bd06b84f18534cfc0e32e66 ****/
		%feature("compactdefaultargs") RWStepBasic_RWConversionBasedUnitAndVolumeUnit;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepBasic_RWConversionBasedUnitAndVolumeUnit;
		 RWStepBasic_RWConversionBasedUnitAndVolumeUnit();

		/****************** ReadStep ******************/
		/**** md5 signature: e8405154bdd87c98a8c609776f58e5a7 ****/
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
		/**** md5 signature: 23995b703815a22ae495247388c4c558 ****/
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
		/**** md5 signature: 6c873115c2b1739eb5a23c8a1417383e ****/
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
		/**** md5 signature: 18b410da4873daa91a6ac68ba3930452 ****/
		%feature("compactdefaultargs") RWStepBasic_RWCoordinatedUniversalTimeOffset;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepBasic_RWCoordinatedUniversalTimeOffset;
		 RWStepBasic_RWCoordinatedUniversalTimeOffset();

		/****************** ReadStep ******************/
		/**** md5 signature: e2c3a392e2ab01ee6cf76dabd4f44175 ****/
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
		/**** md5 signature: 016591181798daee75a6f85bba1cd163 ****/
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
		/**** md5 signature: 7865f32116a9cb8983d6d5413535a551 ****/
		%feature("compactdefaultargs") RWStepBasic_RWDate;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepBasic_RWDate;
		 RWStepBasic_RWDate();

		/****************** ReadStep ******************/
		/**** md5 signature: 9e6b620ffe88133e62b68a47d268b98d ****/
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
		/**** md5 signature: d007d655808f4ce79b6e8c343d6a9452 ****/
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
		/**** md5 signature: de766eaa144bf274c1cf3dca2310833a ****/
		%feature("compactdefaultargs") RWStepBasic_RWDateAndTime;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepBasic_RWDateAndTime;
		 RWStepBasic_RWDateAndTime();

		/****************** ReadStep ******************/
		/**** md5 signature: b6c4ed5c6026f2b452a7905ed62126ac ****/
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
		/**** md5 signature: e50bd34344a325e5d5aa624408e068e0 ****/
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
		/**** md5 signature: 98b2aa4fa6473c6cbfa2876b8a884638 ****/
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
		/**** md5 signature: 000883d6d61a873b66039c4afe083846 ****/
		%feature("compactdefaultargs") RWStepBasic_RWDateRole;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepBasic_RWDateRole;
		 RWStepBasic_RWDateRole();

		/****************** ReadStep ******************/
		/**** md5 signature: be08126e00fbd1103d8fbd938cb51fdc ****/
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
		/**** md5 signature: c5cc85c803914ec493df80791726f6d2 ****/
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
		/**** md5 signature: be7fe57436fff7f1720de9e2524ff379 ****/
		%feature("compactdefaultargs") RWStepBasic_RWDateTimeRole;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepBasic_RWDateTimeRole;
		 RWStepBasic_RWDateTimeRole();

		/****************** ReadStep ******************/
		/**** md5 signature: 8f41b41bb12a88d6750238166380f662 ****/
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
		/**** md5 signature: d1d1986a306e1a763712cd25479dcc03 ****/
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
		/**** md5 signature: 29ee1c9e75b8d4716d06d432fc1df8d5 ****/
		%feature("compactdefaultargs") RWStepBasic_RWDerivedUnit;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepBasic_RWDerivedUnit;
		 RWStepBasic_RWDerivedUnit();

		/****************** ReadStep ******************/
		/**** md5 signature: 11eb6dc58b83c664a9c216899d334f10 ****/
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
		/**** md5 signature: f27aab545da27db9e3524bbdb5f3d07f ****/
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
		/**** md5 signature: c48ce5483cf463b662fa974dc349bea0 ****/
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
		/**** md5 signature: cf623b627af80c67bbd18d4f809c2072 ****/
		%feature("compactdefaultargs") RWStepBasic_RWDerivedUnitElement;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepBasic_RWDerivedUnitElement;
		 RWStepBasic_RWDerivedUnitElement();

		/****************** ReadStep ******************/
		/**** md5 signature: d742b527463f8f4e63a06e3911ad4522 ****/
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
		/**** md5 signature: 64866407e6225c46b02186766ca80064 ****/
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
		/**** md5 signature: 35c4c8cf9deb86ce591e923ed2cc9378 ****/
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
		/**** md5 signature: 8a98fc68b0ac9c1b9c6999a7c42af625 ****/
		%feature("compactdefaultargs") RWStepBasic_RWDimensionalExponents;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepBasic_RWDimensionalExponents;
		 RWStepBasic_RWDimensionalExponents();

		/****************** ReadStep ******************/
		/**** md5 signature: 7bd464f79b66d6265481be8e81695f42 ****/
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
		/**** md5 signature: 2314ffb6eb5b35307e0b2bd080685741 ****/
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
		/**** md5 signature: 0230399b2b84269af72ae74119428f60 ****/
		%feature("compactdefaultargs") RWStepBasic_RWDocument;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepBasic_RWDocument;
		 RWStepBasic_RWDocument();

		/****************** ReadStep ******************/
		/**** md5 signature: ddcaeeff386d76693bb5efda692e4d18 ****/
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
		/**** md5 signature: 2a3dc5974e122e0c0b897049ff6cd2e0 ****/
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
		/**** md5 signature: 417cf3a3539d052dc48d8c51d5fc1a64 ****/
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
		/**** md5 signature: b79ef1c43d1e9bba6b5e33955ef9ac33 ****/
		%feature("compactdefaultargs") RWStepBasic_RWDocumentFile;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepBasic_RWDocumentFile;
		 RWStepBasic_RWDocumentFile();

		/****************** ReadStep ******************/
		/**** md5 signature: 44801dc04f0e3a663ca8b33857c7bc4f ****/
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
		/**** md5 signature: fdbb6ac4b0066a131009386a874f425d ****/
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
		/**** md5 signature: 7cd84c8c861946a46e76164f8d32ed8e ****/
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
		/**** md5 signature: 9528e12cafcc758ac4583152995da22d ****/
		%feature("compactdefaultargs") RWStepBasic_RWDocumentProductAssociation;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepBasic_RWDocumentProductAssociation;
		 RWStepBasic_RWDocumentProductAssociation();

		/****************** ReadStep ******************/
		/**** md5 signature: 92cc30cb42533933d9c6d85ca8ec2d91 ****/
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
		/**** md5 signature: 7ce2804b36d71078243caae700e1c8c0 ****/
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
		/**** md5 signature: 5b4879d1c336d25368b9492ed26250bd ****/
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
		/**** md5 signature: 09f472cde0b4d774789fe519c4efa79e ****/
		%feature("compactdefaultargs") RWStepBasic_RWDocumentProductEquivalence;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepBasic_RWDocumentProductEquivalence;
		 RWStepBasic_RWDocumentProductEquivalence();

		/****************** ReadStep ******************/
		/**** md5 signature: 6632e0ab34273745cf1751eec2fc24d0 ****/
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
		/**** md5 signature: ec84ee618ccdf31d925cc52f65ba8679 ****/
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
		/**** md5 signature: 3b95e68df31c91bea5eed0014a6745c4 ****/
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
		/**** md5 signature: ae5cbefdb1b15fa0396b18b65a7af77c ****/
		%feature("compactdefaultargs") RWStepBasic_RWDocumentRelationship;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepBasic_RWDocumentRelationship;
		 RWStepBasic_RWDocumentRelationship();

		/****************** ReadStep ******************/
		/**** md5 signature: a5707ab5978483c6201453add8367c32 ****/
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
		/**** md5 signature: 461442ad9bf93eb0263868d03fdbe5c2 ****/
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
		/**** md5 signature: da83c7ad4550b81e186adf3819fa434f ****/
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
		/**** md5 signature: 60aaca7cb4bac5b6109ba971aec9d319 ****/
		%feature("compactdefaultargs") RWStepBasic_RWDocumentRepresentationType;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepBasic_RWDocumentRepresentationType;
		 RWStepBasic_RWDocumentRepresentationType();

		/****************** ReadStep ******************/
		/**** md5 signature: 6a3247a6915cc3253388de197f69409a ****/
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
		/**** md5 signature: fda829ef7a93d20e6664950790d96ad2 ****/
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
		/**** md5 signature: 2445b4de83be3771e8cae7b1a045929b ****/
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
		/**** md5 signature: 6ea0311148a5c25b6a9e7f9dcb36d9fa ****/
		%feature("compactdefaultargs") RWStepBasic_RWDocumentType;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepBasic_RWDocumentType;
		 RWStepBasic_RWDocumentType();

		/****************** ReadStep ******************/
		/**** md5 signature: 5bbfd10fe11aaea1e28674be6df364ce ****/
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
		/**** md5 signature: b617efb121d8087dbc32f9729a88d0d8 ****/
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
		/**** md5 signature: 90c4efb362ba1db6e7d719ba59091395 ****/
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
		/**** md5 signature: 895e4750109e62dc7a38c95f2dcfc5a8 ****/
		%feature("compactdefaultargs") RWStepBasic_RWDocumentUsageConstraint;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepBasic_RWDocumentUsageConstraint;
		 RWStepBasic_RWDocumentUsageConstraint();

		/****************** ReadStep ******************/
		/**** md5 signature: 6a0e3994298bac2f8b72dc783353b0c2 ****/
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
		/**** md5 signature: 3151cd04dc9d2df160205f051cc4563c ****/
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
		/**** md5 signature: 775ecede180095a8d6f22372fb29a9f4 ****/
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
		/**** md5 signature: ad3e8b86dc19bad262d2d853e6725850 ****/
		%feature("compactdefaultargs") RWStepBasic_RWEffectivity;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepBasic_RWEffectivity;
		 RWStepBasic_RWEffectivity();

		/****************** ReadStep ******************/
		/**** md5 signature: 982b7d30786963d61c66fa98eb868d40 ****/
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
		/**** md5 signature: 017fc04f3df78d1c11e5855742a69298 ****/
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
		/**** md5 signature: b2b7f35d1fc5a25b32d0e31c9b042921 ****/
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
		/**** md5 signature: 420274b64f1bd8d82018618d246d36e9 ****/
		%feature("compactdefaultargs") RWStepBasic_RWEffectivityAssignment;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepBasic_RWEffectivityAssignment;
		 RWStepBasic_RWEffectivityAssignment();

		/****************** ReadStep ******************/
		/**** md5 signature: a8e9ffa2eeae271edd36bd5048efdc82 ****/
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
		/**** md5 signature: 5cf3f39925578bac145daa1a7cf42a33 ****/
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
		/**** md5 signature: 4e1e9c880ec95c2481ca94f168a7feb5 ****/
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
		/**** md5 signature: 7b52658beb70989c166ee1e276675c82 ****/
		%feature("compactdefaultargs") RWStepBasic_RWEulerAngles;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepBasic_RWEulerAngles;
		 RWStepBasic_RWEulerAngles();

		/****************** ReadStep ******************/
		/**** md5 signature: c23a00b44986310f9895befcc3beb10d ****/
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
		/**** md5 signature: 09d5f3e1fe712d1fa2f5113191fe7678 ****/
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
		/**** md5 signature: e2cb85b1b79b398b6c7c7a69a463543d ****/
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
		/**** md5 signature: f72284cbe05fd2556985f912ccde1140 ****/
		%feature("compactdefaultargs") RWStepBasic_RWExternalIdentificationAssignment;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepBasic_RWExternalIdentificationAssignment;
		 RWStepBasic_RWExternalIdentificationAssignment();

		/****************** ReadStep ******************/
		/**** md5 signature: e0cad39222bbe369139a4bb09a58395b ****/
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
		/**** md5 signature: 1b5520d2d7a6c8514b376668a5bf9e9b ****/
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
		/**** md5 signature: 6f4babb5e7af8a81e8ea5c46c609fde8 ****/
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
		/**** md5 signature: 3755ba2abd9ff46b4738de5cbe6bd90c ****/
		%feature("compactdefaultargs") RWStepBasic_RWExternalSource;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepBasic_RWExternalSource;
		 RWStepBasic_RWExternalSource();

		/****************** ReadStep ******************/
		/**** md5 signature: 803082c10be4c42f7cf02cfc89aab601 ****/
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
		/**** md5 signature: 208b7d5e47d79b397de587b25c48c65a ****/
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
		/**** md5 signature: 2ed09b569e138e5f5be3c1620bdcd2f5 ****/
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
		/**** md5 signature: 257151887f7943356dfcc1e0baaee536 ****/
		%feature("compactdefaultargs") RWStepBasic_RWExternallyDefinedItem;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepBasic_RWExternallyDefinedItem;
		 RWStepBasic_RWExternallyDefinedItem();

		/****************** ReadStep ******************/
		/**** md5 signature: fa1bb477df5c455cc391e8f18d2f0fbb ****/
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
		/**** md5 signature: 6ffd18b431597d0642d8f318686617db ****/
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
		/**** md5 signature: 7566842c174814eba6eb175c1a736b9d ****/
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
		/**** md5 signature: bb4a0b185ba37f33466c73a4b5dc3479 ****/
		%feature("compactdefaultargs") RWStepBasic_RWGeneralProperty;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepBasic_RWGeneralProperty;
		 RWStepBasic_RWGeneralProperty();

		/****************** ReadStep ******************/
		/**** md5 signature: e827e7a08699738ae8b0932856ab838e ****/
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
		/**** md5 signature: feb7befce0ffda4fb9a98344550f7b45 ****/
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
		/**** md5 signature: a6b40d3072c425ba9fa7438839d8649d ****/
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
		/**** md5 signature: 96c7c2fac06cfa15cb6d9c2dfef37f5e ****/
		%feature("compactdefaultargs") RWStepBasic_RWGroup;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepBasic_RWGroup;
		 RWStepBasic_RWGroup();

		/****************** ReadStep ******************/
		/**** md5 signature: 3699650c7878101d6a3ebcccc74a6ad2 ****/
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
		/**** md5 signature: d8e77323d281f9ff1b367d896069692f ****/
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
		/**** md5 signature: fdb52acf68fa7b1c9df75921846943d2 ****/
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
		/**** md5 signature: f175b2d661d58f3f9d5d890a6b14354c ****/
		%feature("compactdefaultargs") RWStepBasic_RWGroupAssignment;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepBasic_RWGroupAssignment;
		 RWStepBasic_RWGroupAssignment();

		/****************** ReadStep ******************/
		/**** md5 signature: 4f769fd4e78c39364ae534d16838df6d ****/
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
		/**** md5 signature: e8a681ae522c2228d939e0d4a42ffa61 ****/
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
		/**** md5 signature: 30d5f76208aa9e7fd92781e6113f2bb1 ****/
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
		/**** md5 signature: 0d442d5cc2c17502f79048de82e10536 ****/
		%feature("compactdefaultargs") RWStepBasic_RWGroupRelationship;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepBasic_RWGroupRelationship;
		 RWStepBasic_RWGroupRelationship();

		/****************** ReadStep ******************/
		/**** md5 signature: 3c4b4e807486b1153fe6ddffe2852e06 ****/
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
		/**** md5 signature: 719555c147d5a44c396a6e0e451a04a3 ****/
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
		/**** md5 signature: 0000b1369ba138ad3f2c6e34dd6db54d ****/
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
		/**** md5 signature: 3465e3f5d4790608e9edf8183f01d7d4 ****/
		%feature("compactdefaultargs") RWStepBasic_RWIdentificationAssignment;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepBasic_RWIdentificationAssignment;
		 RWStepBasic_RWIdentificationAssignment();

		/****************** ReadStep ******************/
		/**** md5 signature: 407aa71c90041dfcfe9243000bdf35a4 ****/
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
		/**** md5 signature: 005e666eeec880ff475559d3ad53d0c4 ****/
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
		/**** md5 signature: 00f4e590627910ef947497a0489f431e ****/
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
		/**** md5 signature: 3247d46958666503fe7808b1a916270c ****/
		%feature("compactdefaultargs") RWStepBasic_RWIdentificationRole;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepBasic_RWIdentificationRole;
		 RWStepBasic_RWIdentificationRole();

		/****************** ReadStep ******************/
		/**** md5 signature: 42b9b8c6fbea2c318ce8ca7584e42a29 ****/
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
		/**** md5 signature: 84f97699c01673188b006476f1cc95d4 ****/
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
		/**** md5 signature: 70882663ce90f47ea618c5838a7cf375 ****/
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
		/**** md5 signature: 26fbce464112771394ac59098c8ef1ac ****/
		%feature("compactdefaultargs") RWStepBasic_RWLengthMeasureWithUnit;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepBasic_RWLengthMeasureWithUnit;
		 RWStepBasic_RWLengthMeasureWithUnit();

		/****************** ReadStep ******************/
		/**** md5 signature: 8bb54815feeda88b229d3ca9cfeb55c0 ****/
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
		/**** md5 signature: a5330ffcbde3b2d8e4db0ad9383a4dd8 ****/
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
		/**** md5 signature: c6038b12b21b79da1702410485858e5e ****/
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
		/**** md5 signature: 7c25e8c51adbbaef13dd2a46ae1965df ****/
		%feature("compactdefaultargs") RWStepBasic_RWLengthUnit;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepBasic_RWLengthUnit;
		 RWStepBasic_RWLengthUnit();

		/****************** ReadStep ******************/
		/**** md5 signature: d5ef4f5b62c124b1afc05597fb30d94a ****/
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
		/**** md5 signature: 8e7a88c567a1cf6ef2a18bbb9985a40a ****/
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
		/**** md5 signature: 7993ba9cb5dcd8bfd2e915c8de5ac318 ****/
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
		/**** md5 signature: 0a92c940db08f04d8a387280ac9ed575 ****/
		%feature("compactdefaultargs") RWStepBasic_RWLocalTime;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepBasic_RWLocalTime;
		 RWStepBasic_RWLocalTime();

		/****************** ReadStep ******************/
		/**** md5 signature: 9f2638283e3cd283344b798bc558a825 ****/
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
		/**** md5 signature: 23eac7557ede97cf35ada1b46a7cccd9 ****/
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
		/**** md5 signature: 061be98aa9f880c46fc374d7859c2acc ****/
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
		/**** md5 signature: b02e529810314df2c6806abbf1ee4889 ****/
		%feature("compactdefaultargs") RWStepBasic_RWMassMeasureWithUnit;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepBasic_RWMassMeasureWithUnit;
		 RWStepBasic_RWMassMeasureWithUnit();

		/****************** ReadStep ******************/
		/**** md5 signature: 096501d96604cc7ae3f8dfea058234d1 ****/
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
		/**** md5 signature: b6b884ea04a775e9468c66bbcf4d5b7e ****/
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
		/**** md5 signature: 19ca6402f5ace5be30d0f1a52c797186 ****/
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
		/**** md5 signature: c7934b97c521d51f2512618e934a8764 ****/
		%feature("compactdefaultargs") RWStepBasic_RWMassUnit;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepBasic_RWMassUnit;
		 RWStepBasic_RWMassUnit();

		/****************** ReadStep ******************/
		/**** md5 signature: 9c1eecc323db1a9e57e763f2e0a64e92 ****/
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
		/**** md5 signature: 678957a8441bfd408956cb2c50dde9bd ****/
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
		/**** md5 signature: d21c8a2aafb5f9dfc32e6290a86148e7 ****/
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
		/**** md5 signature: f9691c6764db6518366c692592bf3f42 ****/
		%feature("compactdefaultargs") RWStepBasic_RWMeasureWithUnit;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepBasic_RWMeasureWithUnit;
		 RWStepBasic_RWMeasureWithUnit();

		/****************** ReadStep ******************/
		/**** md5 signature: 47f01c9bfa0c0946df5863a0ba9941db ****/
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
		/**** md5 signature: 4b4934552080a26e3d3bd776c6b711ba ****/
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
		/**** md5 signature: 9c5cc13a275d56e7dd22aee7657f322f ****/
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
		/**** md5 signature: a67a27a7d7c5a4a151f5bff10713f3a8 ****/
		%feature("compactdefaultargs") RWStepBasic_RWMechanicalContext;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepBasic_RWMechanicalContext;
		 RWStepBasic_RWMechanicalContext();

		/****************** ReadStep ******************/
		/**** md5 signature: eb2535f78ec6bd5e5da30ebc4855ace6 ****/
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
		/**** md5 signature: 5bd7c9ea8f392145959081fdbe85543e ****/
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
		/**** md5 signature: 9b6cefe954f89c3f98aafe6397fe50a7 ****/
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
		/**** md5 signature: b40a506278efcaf540817c6eff32fbba ****/
		%feature("compactdefaultargs") RWStepBasic_RWNameAssignment;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepBasic_RWNameAssignment;
		 RWStepBasic_RWNameAssignment();

		/****************** ReadStep ******************/
		/**** md5 signature: 48c8b78805ecb21dbd29405cff5ef4a7 ****/
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
		/**** md5 signature: af63095aa74300f972a44003a3157e52 ****/
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
		/**** md5 signature: 84d9ae74fd25eeffd0e061509934aac0 ****/
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
		/**** md5 signature: 92534571e53eb8a2650f350994b01662 ****/
		%feature("compactdefaultargs") RWStepBasic_RWNamedUnit;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepBasic_RWNamedUnit;
		 RWStepBasic_RWNamedUnit();

		/****************** ReadStep ******************/
		/**** md5 signature: fe4fb7d5d8a00e187434cf1ffb592460 ****/
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
		/**** md5 signature: 5f035231e2d6c2508df91c743386f4d0 ****/
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
		/**** md5 signature: cdda16e94fe9c47bd435862e0efae3c9 ****/
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
		/**** md5 signature: b886752592151d8d14c5420729bd4ff5 ****/
		%feature("compactdefaultargs") RWStepBasic_RWObjectRole;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepBasic_RWObjectRole;
		 RWStepBasic_RWObjectRole();

		/****************** ReadStep ******************/
		/**** md5 signature: 05297314733278d92fe45a78679d6110 ****/
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
		/**** md5 signature: 7b157b91a1f529b72d4d6f64eab74098 ****/
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
		/**** md5 signature: eba1c796a15d84c6049296b219aa2f12 ****/
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
		/**** md5 signature: d33daefd872cbbeeaf7073d80eadd70d ****/
		%feature("compactdefaultargs") RWStepBasic_RWOrdinalDate;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepBasic_RWOrdinalDate;
		 RWStepBasic_RWOrdinalDate();

		/****************** ReadStep ******************/
		/**** md5 signature: f915d377e8264568cd069baf94884fdc ****/
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
		/**** md5 signature: 3c71d066f95513b1903a081004227682 ****/
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
		/**** md5 signature: 807d448273f424052ee7da1547890e9b ****/
		%feature("compactdefaultargs") RWStepBasic_RWOrganization;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepBasic_RWOrganization;
		 RWStepBasic_RWOrganization();

		/****************** ReadStep ******************/
		/**** md5 signature: 6203fc6d42dbf78a5636b8284a5cc1f0 ****/
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
		/**** md5 signature: eb48498b32f0d06fc06f897337292aa3 ****/
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
		/**** md5 signature: 7782e37e8dcb63b21fb14d8c9b955801 ****/
		%feature("compactdefaultargs") RWStepBasic_RWOrganizationRole;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepBasic_RWOrganizationRole;
		 RWStepBasic_RWOrganizationRole();

		/****************** ReadStep ******************/
		/**** md5 signature: 24e6f690cd7f2995ace3a8e6d6f5a580 ****/
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
		/**** md5 signature: 4aae7213fb2c875f4e2e2f81840d4d17 ****/
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
		/**** md5 signature: ad774f61dbceef0dc249ef7606f19607 ****/
		%feature("compactdefaultargs") RWStepBasic_RWOrganizationalAddress;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepBasic_RWOrganizationalAddress;
		 RWStepBasic_RWOrganizationalAddress();

		/****************** ReadStep ******************/
		/**** md5 signature: df40caa362e9aba6efb9a688d605b260 ****/
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
		/**** md5 signature: 0bc78d0ee584e79dffd95a7ca211daeb ****/
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
		/**** md5 signature: ff7bbc1f087347e2060c8132e585be1a ****/
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
		/**** md5 signature: 7a03f4a3f1f299c8dfe43d1b4fd67a9b ****/
		%feature("compactdefaultargs") RWStepBasic_RWPerson;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepBasic_RWPerson;
		 RWStepBasic_RWPerson();

		/****************** ReadStep ******************/
		/**** md5 signature: c77c81fe7ff042b8eda39de9e5ca6e0b ****/
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
		/**** md5 signature: 96111bb5aebaa8e1b0aabe29402a1d65 ****/
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
		/**** md5 signature: f70f2064542a5b34afa54dcf44531abf ****/
		%feature("compactdefaultargs") RWStepBasic_RWPersonAndOrganization;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepBasic_RWPersonAndOrganization;
		 RWStepBasic_RWPersonAndOrganization();

		/****************** ReadStep ******************/
		/**** md5 signature: e75555abbbb58d002fd83e6ae744ba22 ****/
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
		/**** md5 signature: 057bd4398c655a9295b4701c0c1c5a8d ****/
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
		/**** md5 signature: b600f61b9e4e9b427fa9e1057b405283 ****/
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
		/**** md5 signature: 8c18df89a13307689f13837e439dfbd6 ****/
		%feature("compactdefaultargs") RWStepBasic_RWPersonAndOrganizationRole;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepBasic_RWPersonAndOrganizationRole;
		 RWStepBasic_RWPersonAndOrganizationRole();

		/****************** ReadStep ******************/
		/**** md5 signature: 8fec24fd0d78cf2c25bbefb122dddd05 ****/
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
		/**** md5 signature: 7190990788233962f7824c2ca4bd7874 ****/
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
		/**** md5 signature: 088c1c3182825de6cd5a49ff448a7645 ****/
		%feature("compactdefaultargs") RWStepBasic_RWPersonalAddress;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepBasic_RWPersonalAddress;
		 RWStepBasic_RWPersonalAddress();

		/****************** ReadStep ******************/
		/**** md5 signature: 7ef7ad260f1f3523cc80600316d6e8cb ****/
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
		/**** md5 signature: a90440708502b2866cc63ae0a3847689 ****/
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
		/**** md5 signature: e584d5b4afce4abba9d60c63803fd702 ****/
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
		/**** md5 signature: 6946373b5a7a7268e502ec11bb30abdd ****/
		%feature("compactdefaultargs") RWStepBasic_RWPlaneAngleMeasureWithUnit;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepBasic_RWPlaneAngleMeasureWithUnit;
		 RWStepBasic_RWPlaneAngleMeasureWithUnit();

		/****************** ReadStep ******************/
		/**** md5 signature: 653de14e012d786889b1b5b7eebf64af ****/
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
		/**** md5 signature: 9215889bc19994f9d4e9c22d5ccbd072 ****/
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
		/**** md5 signature: 249166fa65a27790b74255a6af4831d9 ****/
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
		/**** md5 signature: 71843263c7738bff851e302c9891c888 ****/
		%feature("compactdefaultargs") RWStepBasic_RWPlaneAngleUnit;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepBasic_RWPlaneAngleUnit;
		 RWStepBasic_RWPlaneAngleUnit();

		/****************** ReadStep ******************/
		/**** md5 signature: 9e3224a0857b644fffa7b1021ff7af4d ****/
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
		/**** md5 signature: 8126fcaae3a3c8e89c31822dd3c6462e ****/
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
		/**** md5 signature: 16ebef62fadfcf68686b7e70648eb606 ****/
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
		/**** md5 signature: f3a3ebbe475a68b7472ef4fd9a1122a9 ****/
		%feature("compactdefaultargs") RWStepBasic_RWProduct;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepBasic_RWProduct;
		 RWStepBasic_RWProduct();

		/****************** ReadStep ******************/
		/**** md5 signature: aa6895ffc9215e3cbcf61da0de7009e1 ****/
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
		/**** md5 signature: cca0604dced3339b12bed54692186818 ****/
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
		/**** md5 signature: 1cddbf65d109469b6973dea9067beb89 ****/
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
		/**** md5 signature: 52d4eb00b1989a508bde3008f307ef4f ****/
		%feature("compactdefaultargs") RWStepBasic_RWProductCategory;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepBasic_RWProductCategory;
		 RWStepBasic_RWProductCategory();

		/****************** ReadStep ******************/
		/**** md5 signature: 1405bc7ae39f53799491961012496725 ****/
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
		/**** md5 signature: 305f718aec8cc3e088c44ce7d92aa6c6 ****/
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
		/**** md5 signature: 408f9e29606cd31c6fc86b1922cf2921 ****/
		%feature("compactdefaultargs") RWStepBasic_RWProductCategoryRelationship;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepBasic_RWProductCategoryRelationship;
		 RWStepBasic_RWProductCategoryRelationship();

		/****************** ReadStep ******************/
		/**** md5 signature: c6efb4867aca54865dda3e5f7bd97bca ****/
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
		/**** md5 signature: bea88b3c80255236271f1e59388ce210 ****/
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
		/**** md5 signature: d41c0dfcd0b83d46bd87475ccabbd1e6 ****/
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
		/**** md5 signature: 7ec11640c356d9470fbad08829e61cf7 ****/
		%feature("compactdefaultargs") RWStepBasic_RWProductConceptContext;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepBasic_RWProductConceptContext;
		 RWStepBasic_RWProductConceptContext();

		/****************** ReadStep ******************/
		/**** md5 signature: 11bdf47c4f26e9da9295b7be6e5ac356 ****/
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
		/**** md5 signature: 7724208586f8811092e916e81344bd6f ****/
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
		/**** md5 signature: 433d507edc1cb4e34af00a2387b83496 ****/
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
		/**** md5 signature: bd187904dcf58396cb9c3f5ab9cc028c ****/
		%feature("compactdefaultargs") RWStepBasic_RWProductContext;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepBasic_RWProductContext;
		 RWStepBasic_RWProductContext();

		/****************** ReadStep ******************/
		/**** md5 signature: 625a42eeb97954beba786c613ed0f45b ****/
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
		/**** md5 signature: 373f21998a86f27f8e0d756ee8e8b445 ****/
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
		/**** md5 signature: 0502e4fec2a6be3715fa3557824f753c ****/
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
		/**** md5 signature: 0cd372d61d46d0954f836ca6a491f92f ****/
		%feature("compactdefaultargs") RWStepBasic_RWProductDefinition;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepBasic_RWProductDefinition;
		 RWStepBasic_RWProductDefinition();

		/****************** ReadStep ******************/
		/**** md5 signature: 21517efd279e5d15c36de938f9ce117d ****/
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
		/**** md5 signature: ae7651b01e38a4672be03110c1ab3d83 ****/
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
		/**** md5 signature: 3577ccf51a402fb86313df3ccca851aa ****/
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
		/**** md5 signature: 878d9645129adcbfc35fb66ff8e1d51e ****/
		%feature("compactdefaultargs") RWStepBasic_RWProductDefinitionContext;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepBasic_RWProductDefinitionContext;
		 RWStepBasic_RWProductDefinitionContext();

		/****************** ReadStep ******************/
		/**** md5 signature: 1f20c0e1f06c42fd420cadd7247c56dd ****/
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
		/**** md5 signature: 59391345b671ea13fdf2ac7d51a6dcce ****/
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
		/**** md5 signature: 65910095e15e59255e4cc75fe0b6688e ****/
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
		/**** md5 signature: 010fa35bb41f413391d0b4afd27c7f4f ****/
		%feature("compactdefaultargs") RWStepBasic_RWProductDefinitionEffectivity;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepBasic_RWProductDefinitionEffectivity;
		 RWStepBasic_RWProductDefinitionEffectivity();

		/****************** ReadStep ******************/
		/**** md5 signature: 186daa706e1c4575a1a87a210083d1e1 ****/
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
		/**** md5 signature: e6b4bd037bf041db8dd9a4938f4d1783 ****/
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
		/**** md5 signature: ff00c63f8e1f7827e36d52fd5248f211 ****/
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
		/**** md5 signature: 4c856e72dd4fbc08d4dcb5be8881173e ****/
		%feature("compactdefaultargs") RWStepBasic_RWProductDefinitionFormation;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepBasic_RWProductDefinitionFormation;
		 RWStepBasic_RWProductDefinitionFormation();

		/****************** ReadStep ******************/
		/**** md5 signature: b3024f3e909cf46d7eab24774e9670fe ****/
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
		/**** md5 signature: 2351d74103633a6b8d56b399441436e3 ****/
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
		/**** md5 signature: d8b55faa7a674a134a59a3ba9b26aed5 ****/
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
		/**** md5 signature: 9df831fbb64e2f2e9e323ae7dd44252c ****/
		%feature("compactdefaultargs") RWStepBasic_RWProductDefinitionFormationRelationship;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepBasic_RWProductDefinitionFormationRelationship;
		 RWStepBasic_RWProductDefinitionFormationRelationship();

		/****************** ReadStep ******************/
		/**** md5 signature: e2f20d8552f399629f6bb5b69f6936fd ****/
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
		/**** md5 signature: dcc17ffd8ca9085034c7cf12734bb3bb ****/
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
		/**** md5 signature: 27a42472cb99205c7d2dc531e16c17d6 ****/
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
		/**** md5 signature: ed5460b7b05386011e69c50385c35988 ****/
		%feature("compactdefaultargs") RWStepBasic_RWProductDefinitionFormationWithSpecifiedSource;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepBasic_RWProductDefinitionFormationWithSpecifiedSource;
		 RWStepBasic_RWProductDefinitionFormationWithSpecifiedSource();

		/****************** ReadStep ******************/
		/**** md5 signature: 206b079e0a49775938bc02e55d18a4ff ****/
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
		/**** md5 signature: f0f8b5df1eaf04cd37093b21c2184069 ****/
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
		/**** md5 signature: 55491dcf2b73d9cfff0e7a43ad41aadb ****/
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
		/**** md5 signature: 362df1cde2f8c5bd5ec82d5a7d96e0b0 ****/
		%feature("compactdefaultargs") RWStepBasic_RWProductDefinitionReference;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepBasic_RWProductDefinitionReference;
		 RWStepBasic_RWProductDefinitionReference();

		/****************** ReadStep ******************/
		/**** md5 signature: 709cced1993e70ab8fed723afdd193e6 ****/
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
		/**** md5 signature: d8bbe8f865d171c2a297b1bbb31e1975 ****/
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
		/**** md5 signature: daf557bfdba1e2a7499273a1e0426399 ****/
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
		/**** md5 signature: e4e0eb38ceb234a7c398b5431acb3ef1 ****/
		%feature("compactdefaultargs") RWStepBasic_RWProductDefinitionReferenceWithLocalRepresentation;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepBasic_RWProductDefinitionReferenceWithLocalRepresentation;
		 RWStepBasic_RWProductDefinitionReferenceWithLocalRepresentation();

		/****************** ReadStep ******************/
		/**** md5 signature: 51ee896fe789b75595971a8280f31e25 ****/
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
		/**** md5 signature: 2440321e066be83cfc3848d3997af8a3 ****/
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
		/**** md5 signature: 75b16659094614658f9cdc9c5d0eabe9 ****/
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
		/**** md5 signature: 6f75f57a9bc44496772e5bed4b5c4f40 ****/
		%feature("compactdefaultargs") RWStepBasic_RWProductDefinitionRelationship;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepBasic_RWProductDefinitionRelationship;
		 RWStepBasic_RWProductDefinitionRelationship();

		/****************** ReadStep ******************/
		/**** md5 signature: 7248f367c4fb2f586012a2bc87c33bba ****/
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
		/**** md5 signature: 2ce51d2109c173a9dcb578a536bacead ****/
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
		/**** md5 signature: a9e3c70e466627555ed842e781a3e2cd ****/
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
		/**** md5 signature: df441a91ec2a6b56ab6ce0278b22e27a ****/
		%feature("compactdefaultargs") RWStepBasic_RWProductDefinitionWithAssociatedDocuments;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepBasic_RWProductDefinitionWithAssociatedDocuments;
		 RWStepBasic_RWProductDefinitionWithAssociatedDocuments();

		/****************** ReadStep ******************/
		/**** md5 signature: 4915e99b5257d7040617d61c8b8542b3 ****/
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
		/**** md5 signature: b4975e510d91088d5015b9a81e5ddaa8 ****/
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
		/**** md5 signature: db2742bed8fd0c146f540a089e7beee3 ****/
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
		/**** md5 signature: fe58a6f4689772806313125f15da8774 ****/
		%feature("compactdefaultargs") RWStepBasic_RWProductRelatedProductCategory;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepBasic_RWProductRelatedProductCategory;
		 RWStepBasic_RWProductRelatedProductCategory();

		/****************** ReadStep ******************/
		/**** md5 signature: 46a7f1646f41ec569354d6842fca2740 ****/
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
		/**** md5 signature: 74ba4bd499140eb0053835cd7b7dfe28 ****/
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
		/**** md5 signature: 60a083391cd1bdecaf4fe10b35900550 ****/
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
		/**** md5 signature: f86acf6e729f4e9be702ee252c843bf7 ****/
		%feature("compactdefaultargs") RWStepBasic_RWProductType;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepBasic_RWProductType;
		 RWStepBasic_RWProductType();

		/****************** ReadStep ******************/
		/**** md5 signature: 061a3f8502cf1768348d8e4dd2ed9632 ****/
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
		/**** md5 signature: 8b8fbb86e658fe548ed50bfed0cca671 ****/
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
		/**** md5 signature: 300c222e4314dc4866b222d290b36fcc ****/
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
		/**** md5 signature: 43e5b75ef5092f598b365d3942ff2a1d ****/
		%feature("compactdefaultargs") RWStepBasic_RWRatioMeasureWithUnit;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepBasic_RWRatioMeasureWithUnit;
		 RWStepBasic_RWRatioMeasureWithUnit();

		/****************** ReadStep ******************/
		/**** md5 signature: d4770d90dcc88c01cf7365764d56c422 ****/
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
		/**** md5 signature: 60fe1bc1a84c09dcc80cef31214778ad ****/
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
		/**** md5 signature: ee94c6bc176db3ffc73c2e75ba24b56f ****/
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
		/**** md5 signature: fe489b9b8a4dee166236451be8b98e7f ****/
		%feature("compactdefaultargs") RWStepBasic_RWRoleAssociation;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepBasic_RWRoleAssociation;
		 RWStepBasic_RWRoleAssociation();

		/****************** ReadStep ******************/
		/**** md5 signature: dd876f28db3e25e19850f5c4e7b10212 ****/
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
		/**** md5 signature: dc365e8e0fffd5f5bb69bb3c48772280 ****/
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
		/**** md5 signature: b8d2f25386cc3cf578b31c5708f524a5 ****/
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
		/**** md5 signature: 386c70f01777411024ab199db37a4b0f ****/
		%feature("compactdefaultargs") RWStepBasic_RWSecurityClassification;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepBasic_RWSecurityClassification;
		 RWStepBasic_RWSecurityClassification();

		/****************** ReadStep ******************/
		/**** md5 signature: a291f006e469b75df0a9276aeee3507a ****/
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
		/**** md5 signature: fe64f64008266ccf6f4376d35f9d8097 ****/
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
		/**** md5 signature: 30ae6a0281acbd70e0b152b1501141b2 ****/
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
		/**** md5 signature: 29e9f4cebcb3bdae6bb60de8d9759985 ****/
		%feature("compactdefaultargs") RWStepBasic_RWSecurityClassificationLevel;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepBasic_RWSecurityClassificationLevel;
		 RWStepBasic_RWSecurityClassificationLevel();

		/****************** ReadStep ******************/
		/**** md5 signature: cc91f64c5cf557ba32610baafc0bee32 ****/
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
		/**** md5 signature: 9f64f035b510271cff05d804a31c3486 ****/
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
		/**** md5 signature: b288993dc4871b3fb59428cfc92ebbaf ****/
		%feature("compactdefaultargs") RWStepBasic_RWSiUnit;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepBasic_RWSiUnit;
		 RWStepBasic_RWSiUnit();

		/****************** DecodeName ******************/
		/**** md5 signature: 4ddf43396fce26ad8fd25dda5e6b3378 ****/
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
		/**** md5 signature: 2bb382afd3407be2e9ac33c238587176 ****/
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
		/**** md5 signature: ea4b95e3151e115dd193c066bcfb4b95 ****/
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
		/**** md5 signature: 4fdff797b5cbe0026d2069bbf1c0ffab ****/
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
		/**** md5 signature: 26febb95aaefb0d5eb9daad4535a51d8 ****/
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
		/**** md5 signature: 1eff463b2db9fd168ac834c075705dd9 ****/
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
		/**** md5 signature: 71f07c83233519a34ebc594d5dfafd62 ****/
		%feature("compactdefaultargs") RWStepBasic_RWSiUnitAndAreaUnit;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepBasic_RWSiUnitAndAreaUnit;
		 RWStepBasic_RWSiUnitAndAreaUnit();

		/****************** ReadStep ******************/
		/**** md5 signature: 89c5172d5cecf0af214f8ea4c86c40a7 ****/
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
		/**** md5 signature: 39ab8cc960e2be6427b471b3b290ca88 ****/
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
		/**** md5 signature: e620f83d8e06c7319c40a66f8429bc49 ****/
		%feature("compactdefaultargs") RWStepBasic_RWSiUnitAndLengthUnit;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepBasic_RWSiUnitAndLengthUnit;
		 RWStepBasic_RWSiUnitAndLengthUnit();

		/****************** ReadStep ******************/
		/**** md5 signature: 86eb8843e83768f624c77793e0558b30 ****/
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
		/**** md5 signature: 83e3516ec4509d2731c103ff9e9c3c88 ****/
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
		/**** md5 signature: bf89b68292d8eba2a045587cb942ef03 ****/
		%feature("compactdefaultargs") RWStepBasic_RWSiUnitAndMassUnit;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepBasic_RWSiUnitAndMassUnit;
		 RWStepBasic_RWSiUnitAndMassUnit();

		/****************** ReadStep ******************/
		/**** md5 signature: 49d9f73a3f7998c840b69b1f0b6c8791 ****/
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
		/**** md5 signature: 54f63b129b2065718e161ba1e646b491 ****/
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
		/**** md5 signature: 1f1c47e159d85a8fc1dfe0fb13c51462 ****/
		%feature("compactdefaultargs") RWStepBasic_RWSiUnitAndPlaneAngleUnit;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepBasic_RWSiUnitAndPlaneAngleUnit;
		 RWStepBasic_RWSiUnitAndPlaneAngleUnit();

		/****************** ReadStep ******************/
		/**** md5 signature: ec961a49ba374e61157bbb407aff6945 ****/
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
		/**** md5 signature: 1e53cb16a9e9088df2134cee32a95516 ****/
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
		/**** md5 signature: ab81e649cf76aff64bfbeaa64cf8ffdc ****/
		%feature("compactdefaultargs") RWStepBasic_RWSiUnitAndRatioUnit;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepBasic_RWSiUnitAndRatioUnit;
		 RWStepBasic_RWSiUnitAndRatioUnit();

		/****************** ReadStep ******************/
		/**** md5 signature: b9bcf68ae447a04ec6e5f8c6bfef387b ****/
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
		/**** md5 signature: ed4988d9fec785a16f1358aa81f6f0e3 ****/
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
		/**** md5 signature: c8b5aaf3ffd000c8a31c8f9ff3c3c597 ****/
		%feature("compactdefaultargs") RWStepBasic_RWSiUnitAndSolidAngleUnit;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepBasic_RWSiUnitAndSolidAngleUnit;
		 RWStepBasic_RWSiUnitAndSolidAngleUnit();

		/****************** ReadStep ******************/
		/**** md5 signature: 519a1412e163db63eccb89f1853d7351 ****/
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
		/**** md5 signature: f54d753b8532eaf5b7ce983eff51f6f0 ****/
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
		/**** md5 signature: 15a5b4a19495fbc6c29858bece3c4161 ****/
		%feature("compactdefaultargs") RWStepBasic_RWSiUnitAndThermodynamicTemperatureUnit;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepBasic_RWSiUnitAndThermodynamicTemperatureUnit;
		 RWStepBasic_RWSiUnitAndThermodynamicTemperatureUnit();

		/****************** ReadStep ******************/
		/**** md5 signature: 16c40eeb12e9b8e85efcf4560445d1df ****/
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
		/**** md5 signature: c5792fe88b5fc8f0d78908c2d3ee0a59 ****/
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
		/**** md5 signature: a4a7d8370dd51371116373e693a5270d ****/
		%feature("compactdefaultargs") RWStepBasic_RWSiUnitAndTimeUnit;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepBasic_RWSiUnitAndTimeUnit;
		 RWStepBasic_RWSiUnitAndTimeUnit();

		/****************** ReadStep ******************/
		/**** md5 signature: eae86fe42f8fbb3f4795116c33226280 ****/
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
		/**** md5 signature: 87dad8719a5ced38986365ee92e06a7f ****/
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
		/**** md5 signature: 239edf07ea3336a3ab9a57134d4ba269 ****/
		%feature("compactdefaultargs") RWStepBasic_RWSiUnitAndVolumeUnit;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepBasic_RWSiUnitAndVolumeUnit;
		 RWStepBasic_RWSiUnitAndVolumeUnit();

		/****************** ReadStep ******************/
		/**** md5 signature: 553e0833e0c4ea48280cc2a824d221ac ****/
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
		/**** md5 signature: 0f6cb0997c3ed98227bde871b3d9f2ed ****/
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
		/**** md5 signature: 344153889307d623be8c139ec7508936 ****/
		%feature("compactdefaultargs") RWStepBasic_RWSolidAngleMeasureWithUnit;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepBasic_RWSolidAngleMeasureWithUnit;
		 RWStepBasic_RWSolidAngleMeasureWithUnit();

		/****************** ReadStep ******************/
		/**** md5 signature: e4948d5a2f960ddf41037ba690d18e6e ****/
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
		/**** md5 signature: e8b0ed5d2511399e3f68e382ecb9d2a8 ****/
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
		/**** md5 signature: 9028faf43dd827d90a08d192a1b36a77 ****/
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
		/**** md5 signature: 9e6fc25cb0f9ce77604614869d94da74 ****/
		%feature("compactdefaultargs") RWStepBasic_RWSolidAngleUnit;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepBasic_RWSolidAngleUnit;
		 RWStepBasic_RWSolidAngleUnit();

		/****************** ReadStep ******************/
		/**** md5 signature: f1764a576ece98ba2643d259cd7a30a9 ****/
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
		/**** md5 signature: 36a5031fa1c69b1c33a560fbf76a0c31 ****/
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
		/**** md5 signature: 85e4de71f2933d188637726d6014142c ****/
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
		/**** md5 signature: 2786de34d60a23a38cf86a107454217a ****/
		%feature("compactdefaultargs") RWStepBasic_RWThermodynamicTemperatureUnit;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepBasic_RWThermodynamicTemperatureUnit;
		 RWStepBasic_RWThermodynamicTemperatureUnit();

		/****************** ReadStep ******************/
		/**** md5 signature: c9838a0fe1b142825f988652afb62795 ****/
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
		/**** md5 signature: 52970b28c539a78871d7007f35f87a79 ****/
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
		/**** md5 signature: 6a78048aae2c5b003c1b4e289bb710d4 ****/
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
		/**** md5 signature: 923c3804ca390aeb9fe6caabc39395ba ****/
		%feature("compactdefaultargs") RWStepBasic_RWUncertaintyMeasureWithUnit;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepBasic_RWUncertaintyMeasureWithUnit;
		 RWStepBasic_RWUncertaintyMeasureWithUnit();

		/****************** ReadStep ******************/
		/**** md5 signature: af93f076860a42f84fb5205cdf2c649c ****/
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
		/**** md5 signature: 83e0625a9485c95a4648e0a5ae22fd6f ****/
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
		/**** md5 signature: 38c8f58517aced8cfaafa3e73e05a358 ****/
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
		/**** md5 signature: e9efd3926b2ee57c08dcc95e2ca4ef10 ****/
		%feature("compactdefaultargs") RWStepBasic_RWVersionedActionRequest;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepBasic_RWVersionedActionRequest;
		 RWStepBasic_RWVersionedActionRequest();

		/****************** ReadStep ******************/
		/**** md5 signature: 1e0cfe443d7dc34af1044ab4f68383ee ****/
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
		/**** md5 signature: f0d09d163dad997765ab4dce61a74134 ****/
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
		/**** md5 signature: 4b748bacff181db9cfede6c2c7c0c150 ****/
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
		/**** md5 signature: 18f63a6766f7e27c7f40d5865610ad8d ****/
		%feature("compactdefaultargs") RWStepBasic_RWWeekOfYearAndDayDate;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepBasic_RWWeekOfYearAndDayDate;
		 RWStepBasic_RWWeekOfYearAndDayDate();

		/****************** ReadStep ******************/
		/**** md5 signature: 8bdcaa0b154d898f996035780aef698e ****/
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
		/**** md5 signature: 121e617a592e519251785475670a71b3 ****/
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
