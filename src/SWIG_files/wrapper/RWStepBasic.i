/*
Copyright 2008-2019 Thomas Paviot (tpaviot@gmail.com)

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
/* public enums */
/* end public enums declaration */

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
		%feature("autodoc", "* Empty constructor
	:rtype: None") RWStepBasic_RWAction;
		 RWStepBasic_RWAction ();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "* Reads Action
	:param data:
	:type data: StepData_StepReaderData
	:param num:
	:type num: int
	:param ach:
	:type ach: Interface_Check
	:param ent:
	:type ent: StepBasic_Action
	:rtype: None") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepBasic_Action> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "* Fills data for graph (shared items)
	:param ent:
	:type ent: StepBasic_Action
	:param iter:
	:type iter: Interface_EntityIterator
	:rtype: None") Share;
		void Share (const opencascade::handle<StepBasic_Action> & ent,Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "* Writes Action
	:param SW:
	:type SW: StepData_StepWriter
	:param ent:
	:type ent: StepBasic_Action
	:rtype: None") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepBasic_Action> & ent);

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
		%feature("autodoc", "* Empty constructor
	:rtype: None") RWStepBasic_RWActionAssignment;
		 RWStepBasic_RWActionAssignment ();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "* Reads ActionAssignment
	:param data:
	:type data: StepData_StepReaderData
	:param num:
	:type num: int
	:param ach:
	:type ach: Interface_Check
	:param ent:
	:type ent: StepBasic_ActionAssignment
	:rtype: None") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepBasic_ActionAssignment> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "* Fills data for graph (shared items)
	:param ent:
	:type ent: StepBasic_ActionAssignment
	:param iter:
	:type iter: Interface_EntityIterator
	:rtype: None") Share;
		void Share (const opencascade::handle<StepBasic_ActionAssignment> & ent,Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "* Writes ActionAssignment
	:param SW:
	:type SW: StepData_StepWriter
	:param ent:
	:type ent: StepBasic_ActionAssignment
	:rtype: None") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepBasic_ActionAssignment> & ent);

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
		%feature("autodoc", "* Empty constructor
	:rtype: None") RWStepBasic_RWActionMethod;
		 RWStepBasic_RWActionMethod ();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "* Reads ActionMethod
	:param data:
	:type data: StepData_StepReaderData
	:param num:
	:type num: int
	:param ach:
	:type ach: Interface_Check
	:param ent:
	:type ent: StepBasic_ActionMethod
	:rtype: None") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepBasic_ActionMethod> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "* Fills data for graph (shared items)
	:param ent:
	:type ent: StepBasic_ActionMethod
	:param iter:
	:type iter: Interface_EntityIterator
	:rtype: None") Share;
		void Share (const opencascade::handle<StepBasic_ActionMethod> & ent,Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "* Writes ActionMethod
	:param SW:
	:type SW: StepData_StepWriter
	:param ent:
	:type ent: StepBasic_ActionMethod
	:rtype: None") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepBasic_ActionMethod> & ent);

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
		%feature("autodoc", "* Empty constructor
	:rtype: None") RWStepBasic_RWActionRequestAssignment;
		 RWStepBasic_RWActionRequestAssignment ();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "* Reads ActionRequestAssignment
	:param data:
	:type data: StepData_StepReaderData
	:param num:
	:type num: int
	:param ach:
	:type ach: Interface_Check
	:param ent:
	:type ent: StepBasic_ActionRequestAssignment
	:rtype: None") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepBasic_ActionRequestAssignment> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "* Fills data for graph (shared items)
	:param ent:
	:type ent: StepBasic_ActionRequestAssignment
	:param iter:
	:type iter: Interface_EntityIterator
	:rtype: None") Share;
		void Share (const opencascade::handle<StepBasic_ActionRequestAssignment> & ent,Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "* Writes ActionRequestAssignment
	:param SW:
	:type SW: StepData_StepWriter
	:param ent:
	:type ent: StepBasic_ActionRequestAssignment
	:rtype: None") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepBasic_ActionRequestAssignment> & ent);

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
		%feature("autodoc", "* Empty constructor
	:rtype: None") RWStepBasic_RWActionRequestSolution;
		 RWStepBasic_RWActionRequestSolution ();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "* Reads ActionRequestSolution
	:param data:
	:type data: StepData_StepReaderData
	:param num:
	:type num: int
	:param ach:
	:type ach: Interface_Check
	:param ent:
	:type ent: StepBasic_ActionRequestSolution
	:rtype: None") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepBasic_ActionRequestSolution> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "* Fills data for graph (shared items)
	:param ent:
	:type ent: StepBasic_ActionRequestSolution
	:param iter:
	:type iter: Interface_EntityIterator
	:rtype: None") Share;
		void Share (const opencascade::handle<StepBasic_ActionRequestSolution> & ent,Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "* Writes ActionRequestSolution
	:param SW:
	:type SW: StepData_StepWriter
	:param ent:
	:type ent: StepBasic_ActionRequestSolution
	:rtype: None") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepBasic_ActionRequestSolution> & ent);

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
		%feature("autodoc", ":rtype: None") RWStepBasic_RWAddress;
		 RWStepBasic_RWAddress ();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", ":param data:
	:type data: StepData_StepReaderData
	:param num:
	:type num: int
	:param ach:
	:type ach: Interface_Check
	:param ent:
	:type ent: StepBasic_Address
	:rtype: None") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepBasic_Address> & ent);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", ":param SW:
	:type SW: StepData_StepWriter
	:param ent:
	:type ent: StepBasic_Address
	:rtype: None") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepBasic_Address> & ent);

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
		%feature("autodoc", ":rtype: None") RWStepBasic_RWApplicationContext;
		 RWStepBasic_RWApplicationContext ();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", ":param data:
	:type data: StepData_StepReaderData
	:param num:
	:type num: int
	:param ach:
	:type ach: Interface_Check
	:param ent:
	:type ent: StepBasic_ApplicationContext
	:rtype: None") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepBasic_ApplicationContext> & ent);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", ":param SW:
	:type SW: StepData_StepWriter
	:param ent:
	:type ent: StepBasic_ApplicationContext
	:rtype: None") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepBasic_ApplicationContext> & ent);

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
		%feature("autodoc", ":rtype: None") RWStepBasic_RWApplicationContextElement;
		 RWStepBasic_RWApplicationContextElement ();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", ":param data:
	:type data: StepData_StepReaderData
	:param num:
	:type num: int
	:param ach:
	:type ach: Interface_Check
	:param ent:
	:type ent: StepBasic_ApplicationContextElement
	:rtype: None") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepBasic_ApplicationContextElement> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", ":param ent:
	:type ent: StepBasic_ApplicationContextElement
	:param iter:
	:type iter: Interface_EntityIterator
	:rtype: None") Share;
		void Share (const opencascade::handle<StepBasic_ApplicationContextElement> & ent,Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", ":param SW:
	:type SW: StepData_StepWriter
	:param ent:
	:type ent: StepBasic_ApplicationContextElement
	:rtype: None") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepBasic_ApplicationContextElement> & ent);

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
		%feature("autodoc", ":rtype: None") RWStepBasic_RWApplicationProtocolDefinition;
		 RWStepBasic_RWApplicationProtocolDefinition ();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", ":param data:
	:type data: StepData_StepReaderData
	:param num:
	:type num: int
	:param ach:
	:type ach: Interface_Check
	:param ent:
	:type ent: StepBasic_ApplicationProtocolDefinition
	:rtype: None") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepBasic_ApplicationProtocolDefinition> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", ":param ent:
	:type ent: StepBasic_ApplicationProtocolDefinition
	:param iter:
	:type iter: Interface_EntityIterator
	:rtype: None") Share;
		void Share (const opencascade::handle<StepBasic_ApplicationProtocolDefinition> & ent,Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", ":param SW:
	:type SW: StepData_StepWriter
	:param ent:
	:type ent: StepBasic_ApplicationProtocolDefinition
	:rtype: None") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepBasic_ApplicationProtocolDefinition> & ent);

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
		%feature("autodoc", ":rtype: None") RWStepBasic_RWApproval;
		 RWStepBasic_RWApproval ();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", ":param data:
	:type data: StepData_StepReaderData
	:param num:
	:type num: int
	:param ach:
	:type ach: Interface_Check
	:param ent:
	:type ent: StepBasic_Approval
	:rtype: None") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepBasic_Approval> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", ":param ent:
	:type ent: StepBasic_Approval
	:param iter:
	:type iter: Interface_EntityIterator
	:rtype: None") Share;
		void Share (const opencascade::handle<StepBasic_Approval> & ent,Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", ":param SW:
	:type SW: StepData_StepWriter
	:param ent:
	:type ent: StepBasic_Approval
	:rtype: None") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepBasic_Approval> & ent);

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
		%feature("autodoc", ":rtype: None") RWStepBasic_RWApprovalDateTime;
		 RWStepBasic_RWApprovalDateTime ();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", ":param data:
	:type data: StepData_StepReaderData
	:param num:
	:type num: int
	:param ach:
	:type ach: Interface_Check
	:param ent:
	:type ent: StepBasic_ApprovalDateTime
	:rtype: None") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepBasic_ApprovalDateTime> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", ":param ent:
	:type ent: StepBasic_ApprovalDateTime
	:param iter:
	:type iter: Interface_EntityIterator
	:rtype: None") Share;
		void Share (const opencascade::handle<StepBasic_ApprovalDateTime> & ent,Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", ":param SW:
	:type SW: StepData_StepWriter
	:param ent:
	:type ent: StepBasic_ApprovalDateTime
	:rtype: None") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepBasic_ApprovalDateTime> & ent);

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
		%feature("autodoc", ":rtype: None") RWStepBasic_RWApprovalPersonOrganization;
		 RWStepBasic_RWApprovalPersonOrganization ();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", ":param data:
	:type data: StepData_StepReaderData
	:param num:
	:type num: int
	:param ach:
	:type ach: Interface_Check
	:param ent:
	:type ent: StepBasic_ApprovalPersonOrganization
	:rtype: None") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepBasic_ApprovalPersonOrganization> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", ":param ent:
	:type ent: StepBasic_ApprovalPersonOrganization
	:param iter:
	:type iter: Interface_EntityIterator
	:rtype: None") Share;
		void Share (const opencascade::handle<StepBasic_ApprovalPersonOrganization> & ent,Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", ":param SW:
	:type SW: StepData_StepWriter
	:param ent:
	:type ent: StepBasic_ApprovalPersonOrganization
	:rtype: None") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepBasic_ApprovalPersonOrganization> & ent);

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
		%feature("autodoc", ":rtype: None") RWStepBasic_RWApprovalRelationship;
		 RWStepBasic_RWApprovalRelationship ();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", ":param data:
	:type data: StepData_StepReaderData
	:param num:
	:type num: int
	:param ach:
	:type ach: Interface_Check
	:param ent:
	:type ent: StepBasic_ApprovalRelationship
	:rtype: None") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepBasic_ApprovalRelationship> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", ":param ent:
	:type ent: StepBasic_ApprovalRelationship
	:param iter:
	:type iter: Interface_EntityIterator
	:rtype: None") Share;
		void Share (const opencascade::handle<StepBasic_ApprovalRelationship> & ent,Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", ":param SW:
	:type SW: StepData_StepWriter
	:param ent:
	:type ent: StepBasic_ApprovalRelationship
	:rtype: None") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepBasic_ApprovalRelationship> & ent);

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
		%feature("autodoc", ":rtype: None") RWStepBasic_RWApprovalRole;
		 RWStepBasic_RWApprovalRole ();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", ":param data:
	:type data: StepData_StepReaderData
	:param num:
	:type num: int
	:param ach:
	:type ach: Interface_Check
	:param ent:
	:type ent: StepBasic_ApprovalRole
	:rtype: None") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepBasic_ApprovalRole> & ent);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", ":param SW:
	:type SW: StepData_StepWriter
	:param ent:
	:type ent: StepBasic_ApprovalRole
	:rtype: None") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepBasic_ApprovalRole> & ent);

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
		%feature("autodoc", ":rtype: None") RWStepBasic_RWApprovalStatus;
		 RWStepBasic_RWApprovalStatus ();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", ":param data:
	:type data: StepData_StepReaderData
	:param num:
	:type num: int
	:param ach:
	:type ach: Interface_Check
	:param ent:
	:type ent: StepBasic_ApprovalStatus
	:rtype: None") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepBasic_ApprovalStatus> & ent);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", ":param SW:
	:type SW: StepData_StepWriter
	:param ent:
	:type ent: StepBasic_ApprovalStatus
	:rtype: None") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepBasic_ApprovalStatus> & ent);

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
		%feature("autodoc", ":rtype: None") RWStepBasic_RWCalendarDate;
		 RWStepBasic_RWCalendarDate ();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", ":param data:
	:type data: StepData_StepReaderData
	:param num:
	:type num: int
	:param ach:
	:type ach: Interface_Check
	:param ent:
	:type ent: StepBasic_CalendarDate
	:rtype: None") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepBasic_CalendarDate> & ent);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", ":param SW:
	:type SW: StepData_StepWriter
	:param ent:
	:type ent: StepBasic_CalendarDate
	:rtype: None") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepBasic_CalendarDate> & ent);

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
		%feature("autodoc", "* Empty constructor
	:rtype: None") RWStepBasic_RWCertification;
		 RWStepBasic_RWCertification ();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "* Reads Certification
	:param data:
	:type data: StepData_StepReaderData
	:param num:
	:type num: int
	:param ach:
	:type ach: Interface_Check
	:param ent:
	:type ent: StepBasic_Certification
	:rtype: None") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepBasic_Certification> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "* Fills data for graph (shared items)
	:param ent:
	:type ent: StepBasic_Certification
	:param iter:
	:type iter: Interface_EntityIterator
	:rtype: None") Share;
		void Share (const opencascade::handle<StepBasic_Certification> & ent,Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "* Writes Certification
	:param SW:
	:type SW: StepData_StepWriter
	:param ent:
	:type ent: StepBasic_Certification
	:rtype: None") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepBasic_Certification> & ent);

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
		%feature("autodoc", "* Empty constructor
	:rtype: None") RWStepBasic_RWCertificationAssignment;
		 RWStepBasic_RWCertificationAssignment ();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "* Reads CertificationAssignment
	:param data:
	:type data: StepData_StepReaderData
	:param num:
	:type num: int
	:param ach:
	:type ach: Interface_Check
	:param ent:
	:type ent: StepBasic_CertificationAssignment
	:rtype: None") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepBasic_CertificationAssignment> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "* Fills data for graph (shared items)
	:param ent:
	:type ent: StepBasic_CertificationAssignment
	:param iter:
	:type iter: Interface_EntityIterator
	:rtype: None") Share;
		void Share (const opencascade::handle<StepBasic_CertificationAssignment> & ent,Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "* Writes CertificationAssignment
	:param SW:
	:type SW: StepData_StepWriter
	:param ent:
	:type ent: StepBasic_CertificationAssignment
	:rtype: None") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepBasic_CertificationAssignment> & ent);

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
		%feature("autodoc", "* Empty constructor
	:rtype: None") RWStepBasic_RWCertificationType;
		 RWStepBasic_RWCertificationType ();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "* Reads CertificationType
	:param data:
	:type data: StepData_StepReaderData
	:param num:
	:type num: int
	:param ach:
	:type ach: Interface_Check
	:param ent:
	:type ent: StepBasic_CertificationType
	:rtype: None") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepBasic_CertificationType> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "* Fills data for graph (shared items)
	:param ent:
	:type ent: StepBasic_CertificationType
	:param iter:
	:type iter: Interface_EntityIterator
	:rtype: None") Share;
		void Share (const opencascade::handle<StepBasic_CertificationType> & ent,Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "* Writes CertificationType
	:param SW:
	:type SW: StepData_StepWriter
	:param ent:
	:type ent: StepBasic_CertificationType
	:rtype: None") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepBasic_CertificationType> & ent);

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
		%feature("autodoc", "* Empty constructor
	:rtype: None") RWStepBasic_RWCharacterizedObject;
		 RWStepBasic_RWCharacterizedObject ();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "* Reads CharacterizedObject
	:param data:
	:type data: StepData_StepReaderData
	:param num:
	:type num: int
	:param ach:
	:type ach: Interface_Check
	:param ent:
	:type ent: StepBasic_CharacterizedObject
	:rtype: None") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepBasic_CharacterizedObject> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "* Fills data for graph (shared items)
	:param ent:
	:type ent: StepBasic_CharacterizedObject
	:param iter:
	:type iter: Interface_EntityIterator
	:rtype: None") Share;
		void Share (const opencascade::handle<StepBasic_CharacterizedObject> & ent,Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "* Writes CharacterizedObject
	:param SW:
	:type SW: StepData_StepWriter
	:param ent:
	:type ent: StepBasic_CharacterizedObject
	:rtype: None") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepBasic_CharacterizedObject> & ent);

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
		%feature("autodoc", "* Empty constructor
	:rtype: None") RWStepBasic_RWContract;
		 RWStepBasic_RWContract ();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "* Reads Contract
	:param data:
	:type data: StepData_StepReaderData
	:param num:
	:type num: int
	:param ach:
	:type ach: Interface_Check
	:param ent:
	:type ent: StepBasic_Contract
	:rtype: None") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepBasic_Contract> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "* Fills data for graph (shared items)
	:param ent:
	:type ent: StepBasic_Contract
	:param iter:
	:type iter: Interface_EntityIterator
	:rtype: None") Share;
		void Share (const opencascade::handle<StepBasic_Contract> & ent,Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "* Writes Contract
	:param SW:
	:type SW: StepData_StepWriter
	:param ent:
	:type ent: StepBasic_Contract
	:rtype: None") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepBasic_Contract> & ent);

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
		%feature("autodoc", "* Empty constructor
	:rtype: None") RWStepBasic_RWContractAssignment;
		 RWStepBasic_RWContractAssignment ();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "* Reads ContractAssignment
	:param data:
	:type data: StepData_StepReaderData
	:param num:
	:type num: int
	:param ach:
	:type ach: Interface_Check
	:param ent:
	:type ent: StepBasic_ContractAssignment
	:rtype: None") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepBasic_ContractAssignment> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "* Fills data for graph (shared items)
	:param ent:
	:type ent: StepBasic_ContractAssignment
	:param iter:
	:type iter: Interface_EntityIterator
	:rtype: None") Share;
		void Share (const opencascade::handle<StepBasic_ContractAssignment> & ent,Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "* Writes ContractAssignment
	:param SW:
	:type SW: StepData_StepWriter
	:param ent:
	:type ent: StepBasic_ContractAssignment
	:rtype: None") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepBasic_ContractAssignment> & ent);

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
		%feature("autodoc", "* Empty constructor
	:rtype: None") RWStepBasic_RWContractType;
		 RWStepBasic_RWContractType ();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "* Reads ContractType
	:param data:
	:type data: StepData_StepReaderData
	:param num:
	:type num: int
	:param ach:
	:type ach: Interface_Check
	:param ent:
	:type ent: StepBasic_ContractType
	:rtype: None") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepBasic_ContractType> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "* Fills data for graph (shared items)
	:param ent:
	:type ent: StepBasic_ContractType
	:param iter:
	:type iter: Interface_EntityIterator
	:rtype: None") Share;
		void Share (const opencascade::handle<StepBasic_ContractType> & ent,Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "* Writes ContractType
	:param SW:
	:type SW: StepData_StepWriter
	:param ent:
	:type ent: StepBasic_ContractType
	:rtype: None") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepBasic_ContractType> & ent);

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
		%feature("autodoc", ":rtype: None") RWStepBasic_RWConversionBasedUnit;
		 RWStepBasic_RWConversionBasedUnit ();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", ":param data:
	:type data: StepData_StepReaderData
	:param num:
	:type num: int
	:param ach:
	:type ach: Interface_Check
	:param ent:
	:type ent: StepBasic_ConversionBasedUnit
	:rtype: None") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepBasic_ConversionBasedUnit> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", ":param ent:
	:type ent: StepBasic_ConversionBasedUnit
	:param iter:
	:type iter: Interface_EntityIterator
	:rtype: None") Share;
		void Share (const opencascade::handle<StepBasic_ConversionBasedUnit> & ent,Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", ":param SW:
	:type SW: StepData_StepWriter
	:param ent:
	:type ent: StepBasic_ConversionBasedUnit
	:rtype: None") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepBasic_ConversionBasedUnit> & ent);

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
		%feature("autodoc", ":rtype: None") RWStepBasic_RWConversionBasedUnitAndAreaUnit;
		 RWStepBasic_RWConversionBasedUnitAndAreaUnit ();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", ":param data:
	:type data: StepData_StepReaderData
	:param num:
	:type num: int
	:param ach:
	:type ach: Interface_Check
	:param ent:
	:type ent: StepBasic_ConversionBasedUnitAndAreaUnit
	:rtype: None") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepBasic_ConversionBasedUnitAndAreaUnit> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", ":param ent:
	:type ent: StepBasic_ConversionBasedUnitAndAreaUnit
	:param iter:
	:type iter: Interface_EntityIterator
	:rtype: None") Share;
		void Share (const opencascade::handle<StepBasic_ConversionBasedUnitAndAreaUnit> & ent,Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", ":param SW:
	:type SW: StepData_StepWriter
	:param ent:
	:type ent: StepBasic_ConversionBasedUnitAndAreaUnit
	:rtype: None") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepBasic_ConversionBasedUnitAndAreaUnit> & ent);

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
		%feature("autodoc", ":rtype: None") RWStepBasic_RWConversionBasedUnitAndLengthUnit;
		 RWStepBasic_RWConversionBasedUnitAndLengthUnit ();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", ":param data:
	:type data: StepData_StepReaderData
	:param num:
	:type num: int
	:param ach:
	:type ach: Interface_Check
	:param ent:
	:type ent: StepBasic_ConversionBasedUnitAndLengthUnit
	:rtype: None") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepBasic_ConversionBasedUnitAndLengthUnit> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", ":param ent:
	:type ent: StepBasic_ConversionBasedUnitAndLengthUnit
	:param iter:
	:type iter: Interface_EntityIterator
	:rtype: None") Share;
		void Share (const opencascade::handle<StepBasic_ConversionBasedUnitAndLengthUnit> & ent,Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", ":param SW:
	:type SW: StepData_StepWriter
	:param ent:
	:type ent: StepBasic_ConversionBasedUnitAndLengthUnit
	:rtype: None") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepBasic_ConversionBasedUnitAndLengthUnit> & ent);

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
		%feature("autodoc", ":rtype: None") RWStepBasic_RWConversionBasedUnitAndMassUnit;
		 RWStepBasic_RWConversionBasedUnitAndMassUnit ();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", ":param data:
	:type data: StepData_StepReaderData
	:param num:
	:type num: int
	:param ach:
	:type ach: Interface_Check
	:param ent:
	:type ent: StepBasic_ConversionBasedUnitAndMassUnit
	:rtype: None") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepBasic_ConversionBasedUnitAndMassUnit> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", ":param ent:
	:type ent: StepBasic_ConversionBasedUnitAndMassUnit
	:param iter:
	:type iter: Interface_EntityIterator
	:rtype: None") Share;
		void Share (const opencascade::handle<StepBasic_ConversionBasedUnitAndMassUnit> & ent,Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", ":param SW:
	:type SW: StepData_StepWriter
	:param ent:
	:type ent: StepBasic_ConversionBasedUnitAndMassUnit
	:rtype: None") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepBasic_ConversionBasedUnitAndMassUnit> & ent);

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
		%feature("autodoc", ":rtype: None") RWStepBasic_RWConversionBasedUnitAndPlaneAngleUnit;
		 RWStepBasic_RWConversionBasedUnitAndPlaneAngleUnit ();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", ":param data:
	:type data: StepData_StepReaderData
	:param num:
	:type num: int
	:param ach:
	:type ach: Interface_Check
	:param ent:
	:type ent: StepBasic_ConversionBasedUnitAndPlaneAngleUnit
	:rtype: None") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepBasic_ConversionBasedUnitAndPlaneAngleUnit> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", ":param ent:
	:type ent: StepBasic_ConversionBasedUnitAndPlaneAngleUnit
	:param iter:
	:type iter: Interface_EntityIterator
	:rtype: None") Share;
		void Share (const opencascade::handle<StepBasic_ConversionBasedUnitAndPlaneAngleUnit> & ent,Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", ":param SW:
	:type SW: StepData_StepWriter
	:param ent:
	:type ent: StepBasic_ConversionBasedUnitAndPlaneAngleUnit
	:rtype: None") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepBasic_ConversionBasedUnitAndPlaneAngleUnit> & ent);

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
		%feature("autodoc", ":rtype: None") RWStepBasic_RWConversionBasedUnitAndRatioUnit;
		 RWStepBasic_RWConversionBasedUnitAndRatioUnit ();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", ":param data:
	:type data: StepData_StepReaderData
	:param num:
	:type num: int
	:param ach:
	:type ach: Interface_Check
	:param ent:
	:type ent: StepBasic_ConversionBasedUnitAndRatioUnit
	:rtype: None") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepBasic_ConversionBasedUnitAndRatioUnit> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", ":param ent:
	:type ent: StepBasic_ConversionBasedUnitAndRatioUnit
	:param iter:
	:type iter: Interface_EntityIterator
	:rtype: None") Share;
		void Share (const opencascade::handle<StepBasic_ConversionBasedUnitAndRatioUnit> & ent,Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", ":param SW:
	:type SW: StepData_StepWriter
	:param ent:
	:type ent: StepBasic_ConversionBasedUnitAndRatioUnit
	:rtype: None") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepBasic_ConversionBasedUnitAndRatioUnit> & ent);

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
		%feature("autodoc", ":rtype: None") RWStepBasic_RWConversionBasedUnitAndSolidAngleUnit;
		 RWStepBasic_RWConversionBasedUnitAndSolidAngleUnit ();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", ":param data:
	:type data: StepData_StepReaderData
	:param num:
	:type num: int
	:param ach:
	:type ach: Interface_Check
	:param ent:
	:type ent: StepBasic_ConversionBasedUnitAndSolidAngleUnit
	:rtype: None") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepBasic_ConversionBasedUnitAndSolidAngleUnit> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", ":param ent:
	:type ent: StepBasic_ConversionBasedUnitAndSolidAngleUnit
	:param iter:
	:type iter: Interface_EntityIterator
	:rtype: None") Share;
		void Share (const opencascade::handle<StepBasic_ConversionBasedUnitAndSolidAngleUnit> & ent,Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", ":param SW:
	:type SW: StepData_StepWriter
	:param ent:
	:type ent: StepBasic_ConversionBasedUnitAndSolidAngleUnit
	:rtype: None") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepBasic_ConversionBasedUnitAndSolidAngleUnit> & ent);

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
		%feature("autodoc", ":rtype: None") RWStepBasic_RWConversionBasedUnitAndTimeUnit;
		 RWStepBasic_RWConversionBasedUnitAndTimeUnit ();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", ":param data:
	:type data: StepData_StepReaderData
	:param num:
	:type num: int
	:param ach:
	:type ach: Interface_Check
	:param ent:
	:type ent: StepBasic_ConversionBasedUnitAndTimeUnit
	:rtype: None") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepBasic_ConversionBasedUnitAndTimeUnit> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", ":param ent:
	:type ent: StepBasic_ConversionBasedUnitAndTimeUnit
	:param iter:
	:type iter: Interface_EntityIterator
	:rtype: None") Share;
		void Share (const opencascade::handle<StepBasic_ConversionBasedUnitAndTimeUnit> & ent,Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", ":param SW:
	:type SW: StepData_StepWriter
	:param ent:
	:type ent: StepBasic_ConversionBasedUnitAndTimeUnit
	:rtype: None") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepBasic_ConversionBasedUnitAndTimeUnit> & ent);

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
		%feature("autodoc", ":rtype: None") RWStepBasic_RWConversionBasedUnitAndVolumeUnit;
		 RWStepBasic_RWConversionBasedUnitAndVolumeUnit ();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", ":param data:
	:type data: StepData_StepReaderData
	:param num:
	:type num: int
	:param ach:
	:type ach: Interface_Check
	:param ent:
	:type ent: StepBasic_ConversionBasedUnitAndVolumeUnit
	:rtype: None") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepBasic_ConversionBasedUnitAndVolumeUnit> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", ":param ent:
	:type ent: StepBasic_ConversionBasedUnitAndVolumeUnit
	:param iter:
	:type iter: Interface_EntityIterator
	:rtype: None") Share;
		void Share (const opencascade::handle<StepBasic_ConversionBasedUnitAndVolumeUnit> & ent,Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", ":param SW:
	:type SW: StepData_StepWriter
	:param ent:
	:type ent: StepBasic_ConversionBasedUnitAndVolumeUnit
	:rtype: None") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepBasic_ConversionBasedUnitAndVolumeUnit> & ent);

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
		%feature("autodoc", ":rtype: None") RWStepBasic_RWCoordinatedUniversalTimeOffset;
		 RWStepBasic_RWCoordinatedUniversalTimeOffset ();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", ":param data:
	:type data: StepData_StepReaderData
	:param num:
	:type num: int
	:param ach:
	:type ach: Interface_Check
	:param ent:
	:type ent: StepBasic_CoordinatedUniversalTimeOffset
	:rtype: None") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepBasic_CoordinatedUniversalTimeOffset> & ent);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", ":param SW:
	:type SW: StepData_StepWriter
	:param ent:
	:type ent: StepBasic_CoordinatedUniversalTimeOffset
	:rtype: None") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepBasic_CoordinatedUniversalTimeOffset> & ent);

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
		%feature("autodoc", ":rtype: None") RWStepBasic_RWDate;
		 RWStepBasic_RWDate ();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", ":param data:
	:type data: StepData_StepReaderData
	:param num:
	:type num: int
	:param ach:
	:type ach: Interface_Check
	:param ent:
	:type ent: StepBasic_Date
	:rtype: None") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepBasic_Date> & ent);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", ":param SW:
	:type SW: StepData_StepWriter
	:param ent:
	:type ent: StepBasic_Date
	:rtype: None") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepBasic_Date> & ent);

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
		%feature("autodoc", ":rtype: None") RWStepBasic_RWDateAndTime;
		 RWStepBasic_RWDateAndTime ();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", ":param data:
	:type data: StepData_StepReaderData
	:param num:
	:type num: int
	:param ach:
	:type ach: Interface_Check
	:param ent:
	:type ent: StepBasic_DateAndTime
	:rtype: None") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepBasic_DateAndTime> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", ":param ent:
	:type ent: StepBasic_DateAndTime
	:param iter:
	:type iter: Interface_EntityIterator
	:rtype: None") Share;
		void Share (const opencascade::handle<StepBasic_DateAndTime> & ent,Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", ":param SW:
	:type SW: StepData_StepWriter
	:param ent:
	:type ent: StepBasic_DateAndTime
	:rtype: None") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepBasic_DateAndTime> & ent);

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
		%feature("autodoc", ":rtype: None") RWStepBasic_RWDateRole;
		 RWStepBasic_RWDateRole ();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", ":param data:
	:type data: StepData_StepReaderData
	:param num:
	:type num: int
	:param ach:
	:type ach: Interface_Check
	:param ent:
	:type ent: StepBasic_DateRole
	:rtype: None") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepBasic_DateRole> & ent);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", ":param SW:
	:type SW: StepData_StepWriter
	:param ent:
	:type ent: StepBasic_DateRole
	:rtype: None") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepBasic_DateRole> & ent);

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
		%feature("autodoc", ":rtype: None") RWStepBasic_RWDateTimeRole;
		 RWStepBasic_RWDateTimeRole ();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", ":param data:
	:type data: StepData_StepReaderData
	:param num:
	:type num: int
	:param ach:
	:type ach: Interface_Check
	:param ent:
	:type ent: StepBasic_DateTimeRole
	:rtype: None") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepBasic_DateTimeRole> & ent);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", ":param SW:
	:type SW: StepData_StepWriter
	:param ent:
	:type ent: StepBasic_DateTimeRole
	:rtype: None") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepBasic_DateTimeRole> & ent);

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
		%feature("autodoc", ":rtype: None") RWStepBasic_RWDerivedUnit;
		 RWStepBasic_RWDerivedUnit ();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", ":param data:
	:type data: StepData_StepReaderData
	:param num:
	:type num: int
	:param ach:
	:type ach: Interface_Check
	:param ent:
	:type ent: StepBasic_DerivedUnit
	:rtype: None") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepBasic_DerivedUnit> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", ":param ent:
	:type ent: StepBasic_DerivedUnit
	:param iter:
	:type iter: Interface_EntityIterator
	:rtype: None") Share;
		void Share (const opencascade::handle<StepBasic_DerivedUnit> & ent,Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", ":param SW:
	:type SW: StepData_StepWriter
	:param ent:
	:type ent: StepBasic_DerivedUnit
	:rtype: None") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepBasic_DerivedUnit> & ent);

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
		%feature("autodoc", ":rtype: None") RWStepBasic_RWDerivedUnitElement;
		 RWStepBasic_RWDerivedUnitElement ();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", ":param data:
	:type data: StepData_StepReaderData
	:param num:
	:type num: int
	:param ach:
	:type ach: Interface_Check
	:param ent:
	:type ent: StepBasic_DerivedUnitElement
	:rtype: None") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepBasic_DerivedUnitElement> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", ":param ent:
	:type ent: StepBasic_DerivedUnitElement
	:param iter:
	:type iter: Interface_EntityIterator
	:rtype: None") Share;
		void Share (const opencascade::handle<StepBasic_DerivedUnitElement> & ent,Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", ":param SW:
	:type SW: StepData_StepWriter
	:param ent:
	:type ent: StepBasic_DerivedUnitElement
	:rtype: None") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepBasic_DerivedUnitElement> & ent);

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
		%feature("autodoc", ":rtype: None") RWStepBasic_RWDimensionalExponents;
		 RWStepBasic_RWDimensionalExponents ();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", ":param data:
	:type data: StepData_StepReaderData
	:param num:
	:type num: int
	:param ach:
	:type ach: Interface_Check
	:param ent:
	:type ent: StepBasic_DimensionalExponents
	:rtype: None") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepBasic_DimensionalExponents> & ent);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", ":param SW:
	:type SW: StepData_StepWriter
	:param ent:
	:type ent: StepBasic_DimensionalExponents
	:rtype: None") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepBasic_DimensionalExponents> & ent);

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
		%feature("autodoc", "* Empty constructor
	:rtype: None") RWStepBasic_RWDocument;
		 RWStepBasic_RWDocument ();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "* Reads Document
	:param data:
	:type data: StepData_StepReaderData
	:param num:
	:type num: int
	:param ach:
	:type ach: Interface_Check
	:param ent:
	:type ent: StepBasic_Document
	:rtype: None") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepBasic_Document> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "* Fills data for graph (shared items)
	:param ent:
	:type ent: StepBasic_Document
	:param iter:
	:type iter: Interface_EntityIterator
	:rtype: None") Share;
		void Share (const opencascade::handle<StepBasic_Document> & ent,Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "* Writes Document
	:param SW:
	:type SW: StepData_StepWriter
	:param ent:
	:type ent: StepBasic_Document
	:rtype: None") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepBasic_Document> & ent);

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
		%feature("autodoc", "* Empty constructor
	:rtype: None") RWStepBasic_RWDocumentFile;
		 RWStepBasic_RWDocumentFile ();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "* Reads DocumentFile
	:param data:
	:type data: StepData_StepReaderData
	:param num:
	:type num: int
	:param ach:
	:type ach: Interface_Check
	:param ent:
	:type ent: StepBasic_DocumentFile
	:rtype: None") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepBasic_DocumentFile> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "* Fills data for graph (shared items)
	:param ent:
	:type ent: StepBasic_DocumentFile
	:param iter:
	:type iter: Interface_EntityIterator
	:rtype: None") Share;
		void Share (const opencascade::handle<StepBasic_DocumentFile> & ent,Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "* Writes DocumentFile
	:param SW:
	:type SW: StepData_StepWriter
	:param ent:
	:type ent: StepBasic_DocumentFile
	:rtype: None") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepBasic_DocumentFile> & ent);

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
		%feature("autodoc", "* Empty constructor
	:rtype: None") RWStepBasic_RWDocumentProductAssociation;
		 RWStepBasic_RWDocumentProductAssociation ();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "* Reads DocumentProductAssociation
	:param data:
	:type data: StepData_StepReaderData
	:param num:
	:type num: int
	:param ach:
	:type ach: Interface_Check
	:param ent:
	:type ent: StepBasic_DocumentProductAssociation
	:rtype: None") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepBasic_DocumentProductAssociation> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "* Fills data for graph (shared items)
	:param ent:
	:type ent: StepBasic_DocumentProductAssociation
	:param iter:
	:type iter: Interface_EntityIterator
	:rtype: None") Share;
		void Share (const opencascade::handle<StepBasic_DocumentProductAssociation> & ent,Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "* Writes DocumentProductAssociation
	:param SW:
	:type SW: StepData_StepWriter
	:param ent:
	:type ent: StepBasic_DocumentProductAssociation
	:rtype: None") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepBasic_DocumentProductAssociation> & ent);

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
		%feature("autodoc", "* Empty constructor
	:rtype: None") RWStepBasic_RWDocumentProductEquivalence;
		 RWStepBasic_RWDocumentProductEquivalence ();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "* Reads DocumentProductEquivalence
	:param data:
	:type data: StepData_StepReaderData
	:param num:
	:type num: int
	:param ach:
	:type ach: Interface_Check
	:param ent:
	:type ent: StepBasic_DocumentProductEquivalence
	:rtype: None") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepBasic_DocumentProductEquivalence> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "* Fills data for graph (shared items)
	:param ent:
	:type ent: StepBasic_DocumentProductEquivalence
	:param iter:
	:type iter: Interface_EntityIterator
	:rtype: None") Share;
		void Share (const opencascade::handle<StepBasic_DocumentProductEquivalence> & ent,Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "* Writes DocumentProductEquivalence
	:param SW:
	:type SW: StepData_StepWriter
	:param ent:
	:type ent: StepBasic_DocumentProductEquivalence
	:rtype: None") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepBasic_DocumentProductEquivalence> & ent);

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
		%feature("autodoc", ":rtype: None") RWStepBasic_RWDocumentRelationship;
		 RWStepBasic_RWDocumentRelationship ();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", ":param data:
	:type data: StepData_StepReaderData
	:param num:
	:type num: int
	:param ach:
	:type ach: Interface_Check
	:param ent:
	:type ent: StepBasic_DocumentRelationship
	:rtype: None") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepBasic_DocumentRelationship> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", ":param ent:
	:type ent: StepBasic_DocumentRelationship
	:param iter:
	:type iter: Interface_EntityIterator
	:rtype: None") Share;
		void Share (const opencascade::handle<StepBasic_DocumentRelationship> & ent,Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", ":param SW:
	:type SW: StepData_StepWriter
	:param ent:
	:type ent: StepBasic_DocumentRelationship
	:rtype: None") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepBasic_DocumentRelationship> & ent);

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
		%feature("autodoc", "* Empty constructor
	:rtype: None") RWStepBasic_RWDocumentRepresentationType;
		 RWStepBasic_RWDocumentRepresentationType ();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "* Reads DocumentRepresentationType
	:param data:
	:type data: StepData_StepReaderData
	:param num:
	:type num: int
	:param ach:
	:type ach: Interface_Check
	:param ent:
	:type ent: StepBasic_DocumentRepresentationType
	:rtype: None") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepBasic_DocumentRepresentationType> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "* Fills data for graph (shared items)
	:param ent:
	:type ent: StepBasic_DocumentRepresentationType
	:param iter:
	:type iter: Interface_EntityIterator
	:rtype: None") Share;
		void Share (const opencascade::handle<StepBasic_DocumentRepresentationType> & ent,Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "* Writes DocumentRepresentationType
	:param SW:
	:type SW: StepData_StepWriter
	:param ent:
	:type ent: StepBasic_DocumentRepresentationType
	:rtype: None") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepBasic_DocumentRepresentationType> & ent);

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
		%feature("autodoc", ":rtype: None") RWStepBasic_RWDocumentType;
		 RWStepBasic_RWDocumentType ();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", ":param data:
	:type data: StepData_StepReaderData
	:param num:
	:type num: int
	:param ach:
	:type ach: Interface_Check
	:param ent:
	:type ent: StepBasic_DocumentType
	:rtype: None") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepBasic_DocumentType> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", ":param ent:
	:type ent: StepBasic_DocumentType
	:param iter:
	:type iter: Interface_EntityIterator
	:rtype: None") Share;
		void Share (const opencascade::handle<StepBasic_DocumentType> & ent,Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", ":param SW:
	:type SW: StepData_StepWriter
	:param ent:
	:type ent: StepBasic_DocumentType
	:rtype: None") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepBasic_DocumentType> & ent);

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
		%feature("autodoc", ":rtype: None") RWStepBasic_RWDocumentUsageConstraint;
		 RWStepBasic_RWDocumentUsageConstraint ();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", ":param data:
	:type data: StepData_StepReaderData
	:param num:
	:type num: int
	:param ach:
	:type ach: Interface_Check
	:param ent:
	:type ent: StepBasic_DocumentUsageConstraint
	:rtype: None") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepBasic_DocumentUsageConstraint> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", ":param ent:
	:type ent: StepBasic_DocumentUsageConstraint
	:param iter:
	:type iter: Interface_EntityIterator
	:rtype: None") Share;
		void Share (const opencascade::handle<StepBasic_DocumentUsageConstraint> & ent,Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", ":param SW:
	:type SW: StepData_StepWriter
	:param ent:
	:type ent: StepBasic_DocumentUsageConstraint
	:rtype: None") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepBasic_DocumentUsageConstraint> & ent);

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
		%feature("autodoc", ":rtype: None") RWStepBasic_RWEffectivity;
		 RWStepBasic_RWEffectivity ();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", ":param data:
	:type data: StepData_StepReaderData
	:param num:
	:type num: int
	:param ach:
	:type ach: Interface_Check
	:param ent:
	:type ent: StepBasic_Effectivity
	:rtype: None") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepBasic_Effectivity> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", ":param ent:
	:type ent: StepBasic_Effectivity
	:param iter:
	:type iter: Interface_EntityIterator
	:rtype: None") Share;
		void Share (const opencascade::handle<StepBasic_Effectivity> & ent,Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", ":param SW:
	:type SW: StepData_StepWriter
	:param ent:
	:type ent: StepBasic_Effectivity
	:rtype: None") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepBasic_Effectivity> & ent);

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
		%feature("autodoc", "* Empty constructor
	:rtype: None") RWStepBasic_RWEffectivityAssignment;
		 RWStepBasic_RWEffectivityAssignment ();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "* Reads EffectivityAssignment
	:param data:
	:type data: StepData_StepReaderData
	:param num:
	:type num: int
	:param ach:
	:type ach: Interface_Check
	:param ent:
	:type ent: StepBasic_EffectivityAssignment
	:rtype: None") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepBasic_EffectivityAssignment> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "* Fills data for graph (shared items)
	:param ent:
	:type ent: StepBasic_EffectivityAssignment
	:param iter:
	:type iter: Interface_EntityIterator
	:rtype: None") Share;
		void Share (const opencascade::handle<StepBasic_EffectivityAssignment> & ent,Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "* Writes EffectivityAssignment
	:param SW:
	:type SW: StepData_StepWriter
	:param ent:
	:type ent: StepBasic_EffectivityAssignment
	:rtype: None") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepBasic_EffectivityAssignment> & ent);

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
		%feature("autodoc", "* Empty constructor
	:rtype: None") RWStepBasic_RWEulerAngles;
		 RWStepBasic_RWEulerAngles ();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "* Reads EulerAngles
	:param data:
	:type data: StepData_StepReaderData
	:param num:
	:type num: int
	:param ach:
	:type ach: Interface_Check
	:param ent:
	:type ent: StepBasic_EulerAngles
	:rtype: None") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepBasic_EulerAngles> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "* Fills data for graph (shared items)
	:param ent:
	:type ent: StepBasic_EulerAngles
	:param iter:
	:type iter: Interface_EntityIterator
	:rtype: None") Share;
		void Share (const opencascade::handle<StepBasic_EulerAngles> & ent,Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "* Writes EulerAngles
	:param SW:
	:type SW: StepData_StepWriter
	:param ent:
	:type ent: StepBasic_EulerAngles
	:rtype: None") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepBasic_EulerAngles> & ent);

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
		%feature("autodoc", "* Empty constructor
	:rtype: None") RWStepBasic_RWExternalIdentificationAssignment;
		 RWStepBasic_RWExternalIdentificationAssignment ();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "* Reads ExternalIdentificationAssignment
	:param data:
	:type data: StepData_StepReaderData
	:param num:
	:type num: int
	:param ach:
	:type ach: Interface_Check
	:param ent:
	:type ent: StepBasic_ExternalIdentificationAssignment
	:rtype: None") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepBasic_ExternalIdentificationAssignment> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "* Fills data for graph (shared items)
	:param ent:
	:type ent: StepBasic_ExternalIdentificationAssignment
	:param iter:
	:type iter: Interface_EntityIterator
	:rtype: None") Share;
		void Share (const opencascade::handle<StepBasic_ExternalIdentificationAssignment> & ent,Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "* Writes ExternalIdentificationAssignment
	:param SW:
	:type SW: StepData_StepWriter
	:param ent:
	:type ent: StepBasic_ExternalIdentificationAssignment
	:rtype: None") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepBasic_ExternalIdentificationAssignment> & ent);

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
		%feature("autodoc", "* Empty constructor
	:rtype: None") RWStepBasic_RWExternalSource;
		 RWStepBasic_RWExternalSource ();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "* Reads ExternalSource
	:param data:
	:type data: StepData_StepReaderData
	:param num:
	:type num: int
	:param ach:
	:type ach: Interface_Check
	:param ent:
	:type ent: StepBasic_ExternalSource
	:rtype: None") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepBasic_ExternalSource> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "* Fills data for graph (shared items)
	:param ent:
	:type ent: StepBasic_ExternalSource
	:param iter:
	:type iter: Interface_EntityIterator
	:rtype: None") Share;
		void Share (const opencascade::handle<StepBasic_ExternalSource> & ent,Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "* Writes ExternalSource
	:param SW:
	:type SW: StepData_StepWriter
	:param ent:
	:type ent: StepBasic_ExternalSource
	:rtype: None") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepBasic_ExternalSource> & ent);

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
		%feature("autodoc", "* Empty constructor
	:rtype: None") RWStepBasic_RWExternallyDefinedItem;
		 RWStepBasic_RWExternallyDefinedItem ();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "* Reads ExternallyDefinedItem
	:param data:
	:type data: StepData_StepReaderData
	:param num:
	:type num: int
	:param ach:
	:type ach: Interface_Check
	:param ent:
	:type ent: StepBasic_ExternallyDefinedItem
	:rtype: None") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepBasic_ExternallyDefinedItem> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "* Fills data for graph (shared items)
	:param ent:
	:type ent: StepBasic_ExternallyDefinedItem
	:param iter:
	:type iter: Interface_EntityIterator
	:rtype: None") Share;
		void Share (const opencascade::handle<StepBasic_ExternallyDefinedItem> & ent,Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "* Writes ExternallyDefinedItem
	:param SW:
	:type SW: StepData_StepWriter
	:param ent:
	:type ent: StepBasic_ExternallyDefinedItem
	:rtype: None") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepBasic_ExternallyDefinedItem> & ent);

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
		%feature("autodoc", "* Empty constructor
	:rtype: None") RWStepBasic_RWGeneralProperty;
		 RWStepBasic_RWGeneralProperty ();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "* Reads GeneralProperty
	:param data:
	:type data: StepData_StepReaderData
	:param num:
	:type num: int
	:param ach:
	:type ach: Interface_Check
	:param ent:
	:type ent: StepBasic_GeneralProperty
	:rtype: None") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepBasic_GeneralProperty> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "* Fills data for graph (shared items)
	:param ent:
	:type ent: StepBasic_GeneralProperty
	:param iter:
	:type iter: Interface_EntityIterator
	:rtype: None") Share;
		void Share (const opencascade::handle<StepBasic_GeneralProperty> & ent,Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "* Writes GeneralProperty
	:param SW:
	:type SW: StepData_StepWriter
	:param ent:
	:type ent: StepBasic_GeneralProperty
	:rtype: None") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepBasic_GeneralProperty> & ent);

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
		%feature("autodoc", "* Empty constructor
	:rtype: None") RWStepBasic_RWGroup;
		 RWStepBasic_RWGroup ();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "* Reads Group
	:param data:
	:type data: StepData_StepReaderData
	:param num:
	:type num: int
	:param ach:
	:type ach: Interface_Check
	:param ent:
	:type ent: StepBasic_Group
	:rtype: None") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepBasic_Group> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "* Fills data for graph (shared items)
	:param ent:
	:type ent: StepBasic_Group
	:param iter:
	:type iter: Interface_EntityIterator
	:rtype: None") Share;
		void Share (const opencascade::handle<StepBasic_Group> & ent,Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "* Writes Group
	:param SW:
	:type SW: StepData_StepWriter
	:param ent:
	:type ent: StepBasic_Group
	:rtype: None") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepBasic_Group> & ent);

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
		%feature("autodoc", "* Empty constructor
	:rtype: None") RWStepBasic_RWGroupAssignment;
		 RWStepBasic_RWGroupAssignment ();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "* Reads GroupAssignment
	:param data:
	:type data: StepData_StepReaderData
	:param num:
	:type num: int
	:param ach:
	:type ach: Interface_Check
	:param ent:
	:type ent: StepBasic_GroupAssignment
	:rtype: None") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepBasic_GroupAssignment> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "* Fills data for graph (shared items)
	:param ent:
	:type ent: StepBasic_GroupAssignment
	:param iter:
	:type iter: Interface_EntityIterator
	:rtype: None") Share;
		void Share (const opencascade::handle<StepBasic_GroupAssignment> & ent,Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "* Writes GroupAssignment
	:param SW:
	:type SW: StepData_StepWriter
	:param ent:
	:type ent: StepBasic_GroupAssignment
	:rtype: None") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepBasic_GroupAssignment> & ent);

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
		%feature("autodoc", "* Empty constructor
	:rtype: None") RWStepBasic_RWGroupRelationship;
		 RWStepBasic_RWGroupRelationship ();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "* Reads GroupRelationship
	:param data:
	:type data: StepData_StepReaderData
	:param num:
	:type num: int
	:param ach:
	:type ach: Interface_Check
	:param ent:
	:type ent: StepBasic_GroupRelationship
	:rtype: None") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepBasic_GroupRelationship> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "* Fills data for graph (shared items)
	:param ent:
	:type ent: StepBasic_GroupRelationship
	:param iter:
	:type iter: Interface_EntityIterator
	:rtype: None") Share;
		void Share (const opencascade::handle<StepBasic_GroupRelationship> & ent,Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "* Writes GroupRelationship
	:param SW:
	:type SW: StepData_StepWriter
	:param ent:
	:type ent: StepBasic_GroupRelationship
	:rtype: None") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepBasic_GroupRelationship> & ent);

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
		%feature("autodoc", "* Empty constructor
	:rtype: None") RWStepBasic_RWIdentificationAssignment;
		 RWStepBasic_RWIdentificationAssignment ();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "* Reads IdentificationAssignment
	:param data:
	:type data: StepData_StepReaderData
	:param num:
	:type num: int
	:param ach:
	:type ach: Interface_Check
	:param ent:
	:type ent: StepBasic_IdentificationAssignment
	:rtype: None") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepBasic_IdentificationAssignment> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "* Fills data for graph (shared items)
	:param ent:
	:type ent: StepBasic_IdentificationAssignment
	:param iter:
	:type iter: Interface_EntityIterator
	:rtype: None") Share;
		void Share (const opencascade::handle<StepBasic_IdentificationAssignment> & ent,Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "* Writes IdentificationAssignment
	:param SW:
	:type SW: StepData_StepWriter
	:param ent:
	:type ent: StepBasic_IdentificationAssignment
	:rtype: None") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepBasic_IdentificationAssignment> & ent);

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
		%feature("autodoc", "* Empty constructor
	:rtype: None") RWStepBasic_RWIdentificationRole;
		 RWStepBasic_RWIdentificationRole ();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "* Reads IdentificationRole
	:param data:
	:type data: StepData_StepReaderData
	:param num:
	:type num: int
	:param ach:
	:type ach: Interface_Check
	:param ent:
	:type ent: StepBasic_IdentificationRole
	:rtype: None") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepBasic_IdentificationRole> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "* Fills data for graph (shared items)
	:param ent:
	:type ent: StepBasic_IdentificationRole
	:param iter:
	:type iter: Interface_EntityIterator
	:rtype: None") Share;
		void Share (const opencascade::handle<StepBasic_IdentificationRole> & ent,Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "* Writes IdentificationRole
	:param SW:
	:type SW: StepData_StepWriter
	:param ent:
	:type ent: StepBasic_IdentificationRole
	:rtype: None") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepBasic_IdentificationRole> & ent);

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
		%feature("autodoc", ":rtype: None") RWStepBasic_RWLengthMeasureWithUnit;
		 RWStepBasic_RWLengthMeasureWithUnit ();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", ":param data:
	:type data: StepData_StepReaderData
	:param num:
	:type num: int
	:param ach:
	:type ach: Interface_Check
	:param ent:
	:type ent: StepBasic_LengthMeasureWithUnit
	:rtype: None") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepBasic_LengthMeasureWithUnit> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", ":param ent:
	:type ent: StepBasic_LengthMeasureWithUnit
	:param iter:
	:type iter: Interface_EntityIterator
	:rtype: None") Share;
		void Share (const opencascade::handle<StepBasic_LengthMeasureWithUnit> & ent,Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", ":param SW:
	:type SW: StepData_StepWriter
	:param ent:
	:type ent: StepBasic_LengthMeasureWithUnit
	:rtype: None") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepBasic_LengthMeasureWithUnit> & ent);

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
		%feature("autodoc", ":rtype: None") RWStepBasic_RWLengthUnit;
		 RWStepBasic_RWLengthUnit ();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", ":param data:
	:type data: StepData_StepReaderData
	:param num:
	:type num: int
	:param ach:
	:type ach: Interface_Check
	:param ent:
	:type ent: StepBasic_LengthUnit
	:rtype: None") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepBasic_LengthUnit> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", ":param ent:
	:type ent: StepBasic_LengthUnit
	:param iter:
	:type iter: Interface_EntityIterator
	:rtype: None") Share;
		void Share (const opencascade::handle<StepBasic_LengthUnit> & ent,Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", ":param SW:
	:type SW: StepData_StepWriter
	:param ent:
	:type ent: StepBasic_LengthUnit
	:rtype: None") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepBasic_LengthUnit> & ent);

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
		%feature("autodoc", ":rtype: None") RWStepBasic_RWLocalTime;
		 RWStepBasic_RWLocalTime ();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", ":param data:
	:type data: StepData_StepReaderData
	:param num:
	:type num: int
	:param ach:
	:type ach: Interface_Check
	:param ent:
	:type ent: StepBasic_LocalTime
	:rtype: None") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepBasic_LocalTime> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", ":param ent:
	:type ent: StepBasic_LocalTime
	:param iter:
	:type iter: Interface_EntityIterator
	:rtype: None") Share;
		void Share (const opencascade::handle<StepBasic_LocalTime> & ent,Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", ":param SW:
	:type SW: StepData_StepWriter
	:param ent:
	:type ent: StepBasic_LocalTime
	:rtype: None") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepBasic_LocalTime> & ent);

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
		%feature("autodoc", ":rtype: None") RWStepBasic_RWMassMeasureWithUnit;
		 RWStepBasic_RWMassMeasureWithUnit ();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", ":param data:
	:type data: StepData_StepReaderData
	:param num:
	:type num: int
	:param ach:
	:type ach: Interface_Check
	:param ent:
	:type ent: StepBasic_MassMeasureWithUnit
	:rtype: None") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepBasic_MassMeasureWithUnit> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", ":param ent:
	:type ent: StepBasic_MassMeasureWithUnit
	:param iter:
	:type iter: Interface_EntityIterator
	:rtype: None") Share;
		void Share (const opencascade::handle<StepBasic_MassMeasureWithUnit> & ent,Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", ":param SW:
	:type SW: StepData_StepWriter
	:param ent:
	:type ent: StepBasic_MassMeasureWithUnit
	:rtype: None") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepBasic_MassMeasureWithUnit> & ent);

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
		%feature("autodoc", "* Empty constructor
	:rtype: None") RWStepBasic_RWMassUnit;
		 RWStepBasic_RWMassUnit ();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "* Reads MassUnit
	:param data:
	:type data: StepData_StepReaderData
	:param num:
	:type num: int
	:param ach:
	:type ach: Interface_Check
	:param ent:
	:type ent: StepBasic_MassUnit
	:rtype: None") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepBasic_MassUnit> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "* Fills data for graph (shared items)
	:param ent:
	:type ent: StepBasic_MassUnit
	:param iter:
	:type iter: Interface_EntityIterator
	:rtype: None") Share;
		void Share (const opencascade::handle<StepBasic_MassUnit> & ent,Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "* Writes MassUnit
	:param SW:
	:type SW: StepData_StepWriter
	:param ent:
	:type ent: StepBasic_MassUnit
	:rtype: None") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepBasic_MassUnit> & ent);

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
		%feature("autodoc", ":rtype: None") RWStepBasic_RWMeasureWithUnit;
		 RWStepBasic_RWMeasureWithUnit ();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", ":param data:
	:type data: StepData_StepReaderData
	:param num:
	:type num: int
	:param ach:
	:type ach: Interface_Check
	:param ent:
	:type ent: StepBasic_MeasureWithUnit
	:rtype: None") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepBasic_MeasureWithUnit> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", ":param ent:
	:type ent: StepBasic_MeasureWithUnit
	:param iter:
	:type iter: Interface_EntityIterator
	:rtype: None") Share;
		void Share (const opencascade::handle<StepBasic_MeasureWithUnit> & ent,Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", ":param SW:
	:type SW: StepData_StepWriter
	:param ent:
	:type ent: StepBasic_MeasureWithUnit
	:rtype: None") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepBasic_MeasureWithUnit> & ent);

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
		%feature("autodoc", ":rtype: None") RWStepBasic_RWMechanicalContext;
		 RWStepBasic_RWMechanicalContext ();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", ":param data:
	:type data: StepData_StepReaderData
	:param num:
	:type num: int
	:param ach:
	:type ach: Interface_Check
	:param ent:
	:type ent: StepBasic_MechanicalContext
	:rtype: None") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepBasic_MechanicalContext> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", ":param ent:
	:type ent: StepBasic_MechanicalContext
	:param iter:
	:type iter: Interface_EntityIterator
	:rtype: None") Share;
		void Share (const opencascade::handle<StepBasic_MechanicalContext> & ent,Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", ":param SW:
	:type SW: StepData_StepWriter
	:param ent:
	:type ent: StepBasic_MechanicalContext
	:rtype: None") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepBasic_MechanicalContext> & ent);

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
		%feature("autodoc", "* Empty constructor
	:rtype: None") RWStepBasic_RWNameAssignment;
		 RWStepBasic_RWNameAssignment ();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "* Reads NameAssignment
	:param data:
	:type data: StepData_StepReaderData
	:param num:
	:type num: int
	:param ach:
	:type ach: Interface_Check
	:param ent:
	:type ent: StepBasic_NameAssignment
	:rtype: None") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepBasic_NameAssignment> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "* Fills data for graph (shared items)
	:param ent:
	:type ent: StepBasic_NameAssignment
	:param iter:
	:type iter: Interface_EntityIterator
	:rtype: None") Share;
		void Share (const opencascade::handle<StepBasic_NameAssignment> & ent,Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "* Writes NameAssignment
	:param SW:
	:type SW: StepData_StepWriter
	:param ent:
	:type ent: StepBasic_NameAssignment
	:rtype: None") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepBasic_NameAssignment> & ent);

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
		%feature("autodoc", ":rtype: None") RWStepBasic_RWNamedUnit;
		 RWStepBasic_RWNamedUnit ();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", ":param data:
	:type data: StepData_StepReaderData
	:param num:
	:type num: int
	:param ach:
	:type ach: Interface_Check
	:param ent:
	:type ent: StepBasic_NamedUnit
	:rtype: None") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepBasic_NamedUnit> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", ":param ent:
	:type ent: StepBasic_NamedUnit
	:param iter:
	:type iter: Interface_EntityIterator
	:rtype: None") Share;
		void Share (const opencascade::handle<StepBasic_NamedUnit> & ent,Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", ":param SW:
	:type SW: StepData_StepWriter
	:param ent:
	:type ent: StepBasic_NamedUnit
	:rtype: None") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepBasic_NamedUnit> & ent);

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
		%feature("autodoc", "* Empty constructor
	:rtype: None") RWStepBasic_RWObjectRole;
		 RWStepBasic_RWObjectRole ();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "* Reads ObjectRole
	:param data:
	:type data: StepData_StepReaderData
	:param num:
	:type num: int
	:param ach:
	:type ach: Interface_Check
	:param ent:
	:type ent: StepBasic_ObjectRole
	:rtype: None") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepBasic_ObjectRole> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "* Fills data for graph (shared items)
	:param ent:
	:type ent: StepBasic_ObjectRole
	:param iter:
	:type iter: Interface_EntityIterator
	:rtype: None") Share;
		void Share (const opencascade::handle<StepBasic_ObjectRole> & ent,Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "* Writes ObjectRole
	:param SW:
	:type SW: StepData_StepWriter
	:param ent:
	:type ent: StepBasic_ObjectRole
	:rtype: None") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepBasic_ObjectRole> & ent);

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
		%feature("autodoc", ":rtype: None") RWStepBasic_RWOrdinalDate;
		 RWStepBasic_RWOrdinalDate ();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", ":param data:
	:type data: StepData_StepReaderData
	:param num:
	:type num: int
	:param ach:
	:type ach: Interface_Check
	:param ent:
	:type ent: StepBasic_OrdinalDate
	:rtype: None") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepBasic_OrdinalDate> & ent);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", ":param SW:
	:type SW: StepData_StepWriter
	:param ent:
	:type ent: StepBasic_OrdinalDate
	:rtype: None") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepBasic_OrdinalDate> & ent);

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
		%feature("autodoc", ":rtype: None") RWStepBasic_RWOrganization;
		 RWStepBasic_RWOrganization ();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", ":param data:
	:type data: StepData_StepReaderData
	:param num:
	:type num: int
	:param ach:
	:type ach: Interface_Check
	:param ent:
	:type ent: StepBasic_Organization
	:rtype: None") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepBasic_Organization> & ent);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", ":param SW:
	:type SW: StepData_StepWriter
	:param ent:
	:type ent: StepBasic_Organization
	:rtype: None") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepBasic_Organization> & ent);

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
		%feature("autodoc", ":rtype: None") RWStepBasic_RWOrganizationRole;
		 RWStepBasic_RWOrganizationRole ();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", ":param data:
	:type data: StepData_StepReaderData
	:param num:
	:type num: int
	:param ach:
	:type ach: Interface_Check
	:param ent:
	:type ent: StepBasic_OrganizationRole
	:rtype: None") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepBasic_OrganizationRole> & ent);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", ":param SW:
	:type SW: StepData_StepWriter
	:param ent:
	:type ent: StepBasic_OrganizationRole
	:rtype: None") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepBasic_OrganizationRole> & ent);

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
		%feature("autodoc", ":rtype: None") RWStepBasic_RWOrganizationalAddress;
		 RWStepBasic_RWOrganizationalAddress ();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", ":param data:
	:type data: StepData_StepReaderData
	:param num:
	:type num: int
	:param ach:
	:type ach: Interface_Check
	:param ent:
	:type ent: StepBasic_OrganizationalAddress
	:rtype: None") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepBasic_OrganizationalAddress> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", ":param ent:
	:type ent: StepBasic_OrganizationalAddress
	:param iter:
	:type iter: Interface_EntityIterator
	:rtype: None") Share;
		void Share (const opencascade::handle<StepBasic_OrganizationalAddress> & ent,Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", ":param SW:
	:type SW: StepData_StepWriter
	:param ent:
	:type ent: StepBasic_OrganizationalAddress
	:rtype: None") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepBasic_OrganizationalAddress> & ent);

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
		%feature("autodoc", ":rtype: None") RWStepBasic_RWPerson;
		 RWStepBasic_RWPerson ();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", ":param data:
	:type data: StepData_StepReaderData
	:param num:
	:type num: int
	:param ach:
	:type ach: Interface_Check
	:param ent:
	:type ent: StepBasic_Person
	:rtype: None") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepBasic_Person> & ent);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", ":param SW:
	:type SW: StepData_StepWriter
	:param ent:
	:type ent: StepBasic_Person
	:rtype: None") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepBasic_Person> & ent);

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
		%feature("autodoc", ":rtype: None") RWStepBasic_RWPersonAndOrganization;
		 RWStepBasic_RWPersonAndOrganization ();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", ":param data:
	:type data: StepData_StepReaderData
	:param num:
	:type num: int
	:param ach:
	:type ach: Interface_Check
	:param ent:
	:type ent: StepBasic_PersonAndOrganization
	:rtype: None") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepBasic_PersonAndOrganization> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", ":param ent:
	:type ent: StepBasic_PersonAndOrganization
	:param iter:
	:type iter: Interface_EntityIterator
	:rtype: None") Share;
		void Share (const opencascade::handle<StepBasic_PersonAndOrganization> & ent,Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", ":param SW:
	:type SW: StepData_StepWriter
	:param ent:
	:type ent: StepBasic_PersonAndOrganization
	:rtype: None") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepBasic_PersonAndOrganization> & ent);

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
		%feature("autodoc", ":rtype: None") RWStepBasic_RWPersonAndOrganizationRole;
		 RWStepBasic_RWPersonAndOrganizationRole ();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", ":param data:
	:type data: StepData_StepReaderData
	:param num:
	:type num: int
	:param ach:
	:type ach: Interface_Check
	:param ent:
	:type ent: StepBasic_PersonAndOrganizationRole
	:rtype: None") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepBasic_PersonAndOrganizationRole> & ent);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", ":param SW:
	:type SW: StepData_StepWriter
	:param ent:
	:type ent: StepBasic_PersonAndOrganizationRole
	:rtype: None") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepBasic_PersonAndOrganizationRole> & ent);

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
		%feature("autodoc", ":rtype: None") RWStepBasic_RWPersonalAddress;
		 RWStepBasic_RWPersonalAddress ();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", ":param data:
	:type data: StepData_StepReaderData
	:param num:
	:type num: int
	:param ach:
	:type ach: Interface_Check
	:param ent:
	:type ent: StepBasic_PersonalAddress
	:rtype: None") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepBasic_PersonalAddress> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", ":param ent:
	:type ent: StepBasic_PersonalAddress
	:param iter:
	:type iter: Interface_EntityIterator
	:rtype: None") Share;
		void Share (const opencascade::handle<StepBasic_PersonalAddress> & ent,Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", ":param SW:
	:type SW: StepData_StepWriter
	:param ent:
	:type ent: StepBasic_PersonalAddress
	:rtype: None") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepBasic_PersonalAddress> & ent);

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
		%feature("autodoc", ":rtype: None") RWStepBasic_RWPlaneAngleMeasureWithUnit;
		 RWStepBasic_RWPlaneAngleMeasureWithUnit ();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", ":param data:
	:type data: StepData_StepReaderData
	:param num:
	:type num: int
	:param ach:
	:type ach: Interface_Check
	:param ent:
	:type ent: StepBasic_PlaneAngleMeasureWithUnit
	:rtype: None") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepBasic_PlaneAngleMeasureWithUnit> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", ":param ent:
	:type ent: StepBasic_PlaneAngleMeasureWithUnit
	:param iter:
	:type iter: Interface_EntityIterator
	:rtype: None") Share;
		void Share (const opencascade::handle<StepBasic_PlaneAngleMeasureWithUnit> & ent,Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", ":param SW:
	:type SW: StepData_StepWriter
	:param ent:
	:type ent: StepBasic_PlaneAngleMeasureWithUnit
	:rtype: None") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepBasic_PlaneAngleMeasureWithUnit> & ent);

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
		%feature("autodoc", ":rtype: None") RWStepBasic_RWPlaneAngleUnit;
		 RWStepBasic_RWPlaneAngleUnit ();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", ":param data:
	:type data: StepData_StepReaderData
	:param num:
	:type num: int
	:param ach:
	:type ach: Interface_Check
	:param ent:
	:type ent: StepBasic_PlaneAngleUnit
	:rtype: None") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepBasic_PlaneAngleUnit> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", ":param ent:
	:type ent: StepBasic_PlaneAngleUnit
	:param iter:
	:type iter: Interface_EntityIterator
	:rtype: None") Share;
		void Share (const opencascade::handle<StepBasic_PlaneAngleUnit> & ent,Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", ":param SW:
	:type SW: StepData_StepWriter
	:param ent:
	:type ent: StepBasic_PlaneAngleUnit
	:rtype: None") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepBasic_PlaneAngleUnit> & ent);

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
		%feature("autodoc", ":rtype: None") RWStepBasic_RWProduct;
		 RWStepBasic_RWProduct ();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", ":param data:
	:type data: StepData_StepReaderData
	:param num:
	:type num: int
	:param ach:
	:type ach: Interface_Check
	:param ent:
	:type ent: StepBasic_Product
	:rtype: None") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepBasic_Product> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", ":param ent:
	:type ent: StepBasic_Product
	:param iter:
	:type iter: Interface_EntityIterator
	:rtype: None") Share;
		void Share (const opencascade::handle<StepBasic_Product> & ent,Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", ":param SW:
	:type SW: StepData_StepWriter
	:param ent:
	:type ent: StepBasic_Product
	:rtype: None") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepBasic_Product> & ent);

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
		%feature("autodoc", ":rtype: None") RWStepBasic_RWProductCategory;
		 RWStepBasic_RWProductCategory ();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", ":param data:
	:type data: StepData_StepReaderData
	:param num:
	:type num: int
	:param ach:
	:type ach: Interface_Check
	:param ent:
	:type ent: StepBasic_ProductCategory
	:rtype: None") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepBasic_ProductCategory> & ent);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", ":param SW:
	:type SW: StepData_StepWriter
	:param ent:
	:type ent: StepBasic_ProductCategory
	:rtype: None") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepBasic_ProductCategory> & ent);

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
		%feature("autodoc", "* Empty constructor
	:rtype: None") RWStepBasic_RWProductCategoryRelationship;
		 RWStepBasic_RWProductCategoryRelationship ();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "* Reads ProductCategoryRelationship
	:param data:
	:type data: StepData_StepReaderData
	:param num:
	:type num: int
	:param ach:
	:type ach: Interface_Check
	:param ent:
	:type ent: StepBasic_ProductCategoryRelationship
	:rtype: None") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepBasic_ProductCategoryRelationship> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "* Fills data for graph (shared items)
	:param ent:
	:type ent: StepBasic_ProductCategoryRelationship
	:param iter:
	:type iter: Interface_EntityIterator
	:rtype: None") Share;
		void Share (const opencascade::handle<StepBasic_ProductCategoryRelationship> & ent,Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "* Writes ProductCategoryRelationship
	:param SW:
	:type SW: StepData_StepWriter
	:param ent:
	:type ent: StepBasic_ProductCategoryRelationship
	:rtype: None") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepBasic_ProductCategoryRelationship> & ent);

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
		%feature("autodoc", "* Empty constructor
	:rtype: None") RWStepBasic_RWProductConceptContext;
		 RWStepBasic_RWProductConceptContext ();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "* Reads ProductConceptContext
	:param data:
	:type data: StepData_StepReaderData
	:param num:
	:type num: int
	:param ach:
	:type ach: Interface_Check
	:param ent:
	:type ent: StepBasic_ProductConceptContext
	:rtype: None") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepBasic_ProductConceptContext> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "* Fills data for graph (shared items)
	:param ent:
	:type ent: StepBasic_ProductConceptContext
	:param iter:
	:type iter: Interface_EntityIterator
	:rtype: None") Share;
		void Share (const opencascade::handle<StepBasic_ProductConceptContext> & ent,Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "* Writes ProductConceptContext
	:param SW:
	:type SW: StepData_StepWriter
	:param ent:
	:type ent: StepBasic_ProductConceptContext
	:rtype: None") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepBasic_ProductConceptContext> & ent);

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
		%feature("autodoc", ":rtype: None") RWStepBasic_RWProductContext;
		 RWStepBasic_RWProductContext ();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", ":param data:
	:type data: StepData_StepReaderData
	:param num:
	:type num: int
	:param ach:
	:type ach: Interface_Check
	:param ent:
	:type ent: StepBasic_ProductContext
	:rtype: None") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepBasic_ProductContext> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", ":param ent:
	:type ent: StepBasic_ProductContext
	:param iter:
	:type iter: Interface_EntityIterator
	:rtype: None") Share;
		void Share (const opencascade::handle<StepBasic_ProductContext> & ent,Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", ":param SW:
	:type SW: StepData_StepWriter
	:param ent:
	:type ent: StepBasic_ProductContext
	:rtype: None") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepBasic_ProductContext> & ent);

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
		%feature("autodoc", ":rtype: None") RWStepBasic_RWProductDefinition;
		 RWStepBasic_RWProductDefinition ();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", ":param data:
	:type data: StepData_StepReaderData
	:param num:
	:type num: int
	:param ach:
	:type ach: Interface_Check
	:param ent:
	:type ent: StepBasic_ProductDefinition
	:rtype: None") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepBasic_ProductDefinition> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", ":param ent:
	:type ent: StepBasic_ProductDefinition
	:param iter:
	:type iter: Interface_EntityIterator
	:rtype: None") Share;
		void Share (const opencascade::handle<StepBasic_ProductDefinition> & ent,Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", ":param SW:
	:type SW: StepData_StepWriter
	:param ent:
	:type ent: StepBasic_ProductDefinition
	:rtype: None") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepBasic_ProductDefinition> & ent);

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
		%feature("autodoc", ":rtype: None") RWStepBasic_RWProductDefinitionContext;
		 RWStepBasic_RWProductDefinitionContext ();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", ":param data:
	:type data: StepData_StepReaderData
	:param num:
	:type num: int
	:param ach:
	:type ach: Interface_Check
	:param ent:
	:type ent: StepBasic_ProductDefinitionContext
	:rtype: None") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepBasic_ProductDefinitionContext> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", ":param ent:
	:type ent: StepBasic_ProductDefinitionContext
	:param iter:
	:type iter: Interface_EntityIterator
	:rtype: None") Share;
		void Share (const opencascade::handle<StepBasic_ProductDefinitionContext> & ent,Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", ":param SW:
	:type SW: StepData_StepWriter
	:param ent:
	:type ent: StepBasic_ProductDefinitionContext
	:rtype: None") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepBasic_ProductDefinitionContext> & ent);

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
		%feature("autodoc", ":rtype: None") RWStepBasic_RWProductDefinitionEffectivity;
		 RWStepBasic_RWProductDefinitionEffectivity ();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", ":param data:
	:type data: StepData_StepReaderData
	:param num:
	:type num: int
	:param ach:
	:type ach: Interface_Check
	:param ent:
	:type ent: StepBasic_ProductDefinitionEffectivity
	:rtype: None") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepBasic_ProductDefinitionEffectivity> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", ":param ent:
	:type ent: StepBasic_ProductDefinitionEffectivity
	:param iter:
	:type iter: Interface_EntityIterator
	:rtype: None") Share;
		void Share (const opencascade::handle<StepBasic_ProductDefinitionEffectivity> & ent,Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", ":param SW:
	:type SW: StepData_StepWriter
	:param ent:
	:type ent: StepBasic_ProductDefinitionEffectivity
	:rtype: None") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepBasic_ProductDefinitionEffectivity> & ent);

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
		%feature("autodoc", ":rtype: None") RWStepBasic_RWProductDefinitionFormation;
		 RWStepBasic_RWProductDefinitionFormation ();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", ":param data:
	:type data: StepData_StepReaderData
	:param num:
	:type num: int
	:param ach:
	:type ach: Interface_Check
	:param ent:
	:type ent: StepBasic_ProductDefinitionFormation
	:rtype: None") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepBasic_ProductDefinitionFormation> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", ":param ent:
	:type ent: StepBasic_ProductDefinitionFormation
	:param iter:
	:type iter: Interface_EntityIterator
	:rtype: None") Share;
		void Share (const opencascade::handle<StepBasic_ProductDefinitionFormation> & ent,Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", ":param SW:
	:type SW: StepData_StepWriter
	:param ent:
	:type ent: StepBasic_ProductDefinitionFormation
	:rtype: None") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepBasic_ProductDefinitionFormation> & ent);

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
		%feature("autodoc", "* Empty constructor
	:rtype: None") RWStepBasic_RWProductDefinitionFormationRelationship;
		 RWStepBasic_RWProductDefinitionFormationRelationship ();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "* Reads ProductDefinitionFormationRelationship
	:param data:
	:type data: StepData_StepReaderData
	:param num:
	:type num: int
	:param ach:
	:type ach: Interface_Check
	:param ent:
	:type ent: StepBasic_ProductDefinitionFormationRelationship
	:rtype: None") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepBasic_ProductDefinitionFormationRelationship> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "* Fills data for graph (shared items)
	:param ent:
	:type ent: StepBasic_ProductDefinitionFormationRelationship
	:param iter:
	:type iter: Interface_EntityIterator
	:rtype: None") Share;
		void Share (const opencascade::handle<StepBasic_ProductDefinitionFormationRelationship> & ent,Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "* Writes ProductDefinitionFormationRelationship
	:param SW:
	:type SW: StepData_StepWriter
	:param ent:
	:type ent: StepBasic_ProductDefinitionFormationRelationship
	:rtype: None") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepBasic_ProductDefinitionFormationRelationship> & ent);

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
		%feature("autodoc", ":rtype: None") RWStepBasic_RWProductDefinitionFormationWithSpecifiedSource;
		 RWStepBasic_RWProductDefinitionFormationWithSpecifiedSource ();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", ":param data:
	:type data: StepData_StepReaderData
	:param num:
	:type num: int
	:param ach:
	:type ach: Interface_Check
	:param ent:
	:type ent: StepBasic_ProductDefinitionFormationWithSpecifiedSource
	:rtype: None") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepBasic_ProductDefinitionFormationWithSpecifiedSource> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", ":param ent:
	:type ent: StepBasic_ProductDefinitionFormationWithSpecifiedSource
	:param iter:
	:type iter: Interface_EntityIterator
	:rtype: None") Share;
		void Share (const opencascade::handle<StepBasic_ProductDefinitionFormationWithSpecifiedSource> & ent,Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", ":param SW:
	:type SW: StepData_StepWriter
	:param ent:
	:type ent: StepBasic_ProductDefinitionFormationWithSpecifiedSource
	:rtype: None") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepBasic_ProductDefinitionFormationWithSpecifiedSource> & ent);

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
		%feature("autodoc", ":rtype: None") RWStepBasic_RWProductDefinitionReference;
		 RWStepBasic_RWProductDefinitionReference ();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", ":param data:
	:type data: StepData_StepReaderData
	:param num:
	:type num: int
	:param ach:
	:type ach: Interface_Check
	:param ent:
	:type ent: StepBasic_ProductDefinitionReference
	:rtype: None") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepBasic_ProductDefinitionReference> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", ":param ent:
	:type ent: StepBasic_ProductDefinitionReference
	:param iter:
	:type iter: Interface_EntityIterator
	:rtype: None") Share;
		void Share (const opencascade::handle<StepBasic_ProductDefinitionReference> & ent,Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", ":param SW:
	:type SW: StepData_StepWriter
	:param ent:
	:type ent: StepBasic_ProductDefinitionReference
	:rtype: None") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepBasic_ProductDefinitionReference> & ent);

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
		%feature("autodoc", ":rtype: None") RWStepBasic_RWProductDefinitionReferenceWithLocalRepresentation;
		 RWStepBasic_RWProductDefinitionReferenceWithLocalRepresentation ();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", ":param data:
	:type data: StepData_StepReaderData
	:param num:
	:type num: int
	:param ach:
	:type ach: Interface_Check
	:param ent:
	:type ent: StepBasic_ProductDefinitionReferenceWithLocalRepresentation
	:rtype: None") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepBasic_ProductDefinitionReferenceWithLocalRepresentation> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", ":param ent:
	:type ent: StepBasic_ProductDefinitionReferenceWithLocalRepresentation
	:param iter:
	:type iter: Interface_EntityIterator
	:rtype: None") Share;
		void Share (const opencascade::handle<StepBasic_ProductDefinitionReferenceWithLocalRepresentation> & ent,Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", ":param SW:
	:type SW: StepData_StepWriter
	:param ent:
	:type ent: StepBasic_ProductDefinitionReferenceWithLocalRepresentation
	:rtype: None") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepBasic_ProductDefinitionReferenceWithLocalRepresentation> & ent);

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
		%feature("autodoc", "* Empty constructor
	:rtype: None") RWStepBasic_RWProductDefinitionRelationship;
		 RWStepBasic_RWProductDefinitionRelationship ();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "* Reads ProductDefinitionRelationship
	:param data:
	:type data: StepData_StepReaderData
	:param num:
	:type num: int
	:param ach:
	:type ach: Interface_Check
	:param ent:
	:type ent: StepBasic_ProductDefinitionRelationship
	:rtype: None") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepBasic_ProductDefinitionRelationship> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "* Fills data for graph (shared items)
	:param ent:
	:type ent: StepBasic_ProductDefinitionRelationship
	:param iter:
	:type iter: Interface_EntityIterator
	:rtype: None") Share;
		void Share (const opencascade::handle<StepBasic_ProductDefinitionRelationship> & ent,Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "* Writes ProductDefinitionRelationship
	:param SW:
	:type SW: StepData_StepWriter
	:param ent:
	:type ent: StepBasic_ProductDefinitionRelationship
	:rtype: None") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepBasic_ProductDefinitionRelationship> & ent);

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
		%feature("autodoc", ":rtype: None") RWStepBasic_RWProductDefinitionWithAssociatedDocuments;
		 RWStepBasic_RWProductDefinitionWithAssociatedDocuments ();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", ":param data:
	:type data: StepData_StepReaderData
	:param num:
	:type num: int
	:param ach:
	:type ach: Interface_Check
	:param ent:
	:type ent: StepBasic_ProductDefinitionWithAssociatedDocuments
	:rtype: None") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepBasic_ProductDefinitionWithAssociatedDocuments> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", ":param ent:
	:type ent: StepBasic_ProductDefinitionWithAssociatedDocuments
	:param iter:
	:type iter: Interface_EntityIterator
	:rtype: None") Share;
		void Share (const opencascade::handle<StepBasic_ProductDefinitionWithAssociatedDocuments> & ent,Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", ":param SW:
	:type SW: StepData_StepWriter
	:param ent:
	:type ent: StepBasic_ProductDefinitionWithAssociatedDocuments
	:rtype: None") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepBasic_ProductDefinitionWithAssociatedDocuments> & ent);

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
		%feature("autodoc", ":rtype: None") RWStepBasic_RWProductRelatedProductCategory;
		 RWStepBasic_RWProductRelatedProductCategory ();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", ":param data:
	:type data: StepData_StepReaderData
	:param num:
	:type num: int
	:param ach:
	:type ach: Interface_Check
	:param ent:
	:type ent: StepBasic_ProductRelatedProductCategory
	:rtype: None") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepBasic_ProductRelatedProductCategory> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", ":param ent:
	:type ent: StepBasic_ProductRelatedProductCategory
	:param iter:
	:type iter: Interface_EntityIterator
	:rtype: None") Share;
		void Share (const opencascade::handle<StepBasic_ProductRelatedProductCategory> & ent,Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", ":param SW:
	:type SW: StepData_StepWriter
	:param ent:
	:type ent: StepBasic_ProductRelatedProductCategory
	:rtype: None") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepBasic_ProductRelatedProductCategory> & ent);

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
		%feature("autodoc", ":rtype: None") RWStepBasic_RWProductType;
		 RWStepBasic_RWProductType ();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", ":param data:
	:type data: StepData_StepReaderData
	:param num:
	:type num: int
	:param ach:
	:type ach: Interface_Check
	:param ent:
	:type ent: StepBasic_ProductType
	:rtype: None") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepBasic_ProductType> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", ":param ent:
	:type ent: StepBasic_ProductType
	:param iter:
	:type iter: Interface_EntityIterator
	:rtype: None") Share;
		void Share (const opencascade::handle<StepBasic_ProductType> & ent,Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", ":param SW:
	:type SW: StepData_StepWriter
	:param ent:
	:type ent: StepBasic_ProductType
	:rtype: None") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepBasic_ProductType> & ent);

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
		%feature("autodoc", ":rtype: None") RWStepBasic_RWRatioMeasureWithUnit;
		 RWStepBasic_RWRatioMeasureWithUnit ();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", ":param data:
	:type data: StepData_StepReaderData
	:param num:
	:type num: int
	:param ach:
	:type ach: Interface_Check
	:param ent:
	:type ent: StepBasic_RatioMeasureWithUnit
	:rtype: None") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepBasic_RatioMeasureWithUnit> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", ":param ent:
	:type ent: StepBasic_RatioMeasureWithUnit
	:param iter:
	:type iter: Interface_EntityIterator
	:rtype: None") Share;
		void Share (const opencascade::handle<StepBasic_RatioMeasureWithUnit> & ent,Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", ":param SW:
	:type SW: StepData_StepWriter
	:param ent:
	:type ent: StepBasic_RatioMeasureWithUnit
	:rtype: None") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepBasic_RatioMeasureWithUnit> & ent);

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
		%feature("autodoc", "* Empty constructor
	:rtype: None") RWStepBasic_RWRoleAssociation;
		 RWStepBasic_RWRoleAssociation ();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "* Reads RoleAssociation
	:param data:
	:type data: StepData_StepReaderData
	:param num:
	:type num: int
	:param ach:
	:type ach: Interface_Check
	:param ent:
	:type ent: StepBasic_RoleAssociation
	:rtype: None") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepBasic_RoleAssociation> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "* Fills data for graph (shared items)
	:param ent:
	:type ent: StepBasic_RoleAssociation
	:param iter:
	:type iter: Interface_EntityIterator
	:rtype: None") Share;
		void Share (const opencascade::handle<StepBasic_RoleAssociation> & ent,Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "* Writes RoleAssociation
	:param SW:
	:type SW: StepData_StepWriter
	:param ent:
	:type ent: StepBasic_RoleAssociation
	:rtype: None") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepBasic_RoleAssociation> & ent);

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
		%feature("autodoc", ":rtype: None") RWStepBasic_RWSecurityClassification;
		 RWStepBasic_RWSecurityClassification ();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", ":param data:
	:type data: StepData_StepReaderData
	:param num:
	:type num: int
	:param ach:
	:type ach: Interface_Check
	:param ent:
	:type ent: StepBasic_SecurityClassification
	:rtype: None") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepBasic_SecurityClassification> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", ":param ent:
	:type ent: StepBasic_SecurityClassification
	:param iter:
	:type iter: Interface_EntityIterator
	:rtype: None") Share;
		void Share (const opencascade::handle<StepBasic_SecurityClassification> & ent,Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", ":param SW:
	:type SW: StepData_StepWriter
	:param ent:
	:type ent: StepBasic_SecurityClassification
	:rtype: None") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepBasic_SecurityClassification> & ent);

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
		%feature("autodoc", ":rtype: None") RWStepBasic_RWSecurityClassificationLevel;
		 RWStepBasic_RWSecurityClassificationLevel ();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", ":param data:
	:type data: StepData_StepReaderData
	:param num:
	:type num: int
	:param ach:
	:type ach: Interface_Check
	:param ent:
	:type ent: StepBasic_SecurityClassificationLevel
	:rtype: None") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepBasic_SecurityClassificationLevel> & ent);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", ":param SW:
	:type SW: StepData_StepWriter
	:param ent:
	:type ent: StepBasic_SecurityClassificationLevel
	:rtype: None") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepBasic_SecurityClassificationLevel> & ent);

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
		/****************** DecodeName ******************/
		%feature("compactdefaultargs") DecodeName;
		%feature("autodoc", ":param aName:
	:type aName: StepBasic_SiUnitName
	:param text:
	:type text: char *
	:rtype: bool") DecodeName;
		Standard_Boolean DecodeName (StepBasic_SiUnitName & aName,const char * text);

		/****************** DecodePrefix ******************/
		%feature("compactdefaultargs") DecodePrefix;
		%feature("autodoc", ":param aPrefix:
	:type aPrefix: StepBasic_SiPrefix
	:param text:
	:type text: char *
	:rtype: bool") DecodePrefix;
		Standard_Boolean DecodePrefix (StepBasic_SiPrefix & aPrefix,const char * text);

		/****************** EncodeName ******************/
		%feature("compactdefaultargs") EncodeName;
		%feature("autodoc", ":param aName:
	:type aName: StepBasic_SiUnitName
	:rtype: TCollection_AsciiString") EncodeName;
		TCollection_AsciiString EncodeName (const StepBasic_SiUnitName aName);

		/****************** EncodePrefix ******************/
		%feature("compactdefaultargs") EncodePrefix;
		%feature("autodoc", ":param aPrefix:
	:type aPrefix: StepBasic_SiPrefix
	:rtype: TCollection_AsciiString") EncodePrefix;
		TCollection_AsciiString EncodePrefix (const StepBasic_SiPrefix aPrefix);

		/****************** RWStepBasic_RWSiUnit ******************/
		%feature("compactdefaultargs") RWStepBasic_RWSiUnit;
		%feature("autodoc", ":rtype: None") RWStepBasic_RWSiUnit;
		 RWStepBasic_RWSiUnit ();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", ":param data:
	:type data: StepData_StepReaderData
	:param num:
	:type num: int
	:param ach:
	:type ach: Interface_Check
	:param ent:
	:type ent: StepBasic_SiUnit
	:rtype: None") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepBasic_SiUnit> & ent);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", ":param SW:
	:type SW: StepData_StepWriter
	:param ent:
	:type ent: StepBasic_SiUnit
	:rtype: None") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepBasic_SiUnit> & ent);

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
		%feature("autodoc", ":rtype: None") RWStepBasic_RWSiUnitAndAreaUnit;
		 RWStepBasic_RWSiUnitAndAreaUnit ();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", ":param data:
	:type data: StepData_StepReaderData
	:param num:
	:type num: int
	:param ach:
	:type ach: Interface_Check
	:param ent:
	:type ent: StepBasic_SiUnitAndAreaUnit
	:rtype: None") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepBasic_SiUnitAndAreaUnit> & ent);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", ":param SW:
	:type SW: StepData_StepWriter
	:param ent:
	:type ent: StepBasic_SiUnitAndAreaUnit
	:rtype: None") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepBasic_SiUnitAndAreaUnit> & ent);

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
		%feature("autodoc", ":rtype: None") RWStepBasic_RWSiUnitAndLengthUnit;
		 RWStepBasic_RWSiUnitAndLengthUnit ();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", ":param data:
	:type data: StepData_StepReaderData
	:param num:
	:type num: int
	:param ach:
	:type ach: Interface_Check
	:param ent:
	:type ent: StepBasic_SiUnitAndLengthUnit
	:rtype: None") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepBasic_SiUnitAndLengthUnit> & ent);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", ":param SW:
	:type SW: StepData_StepWriter
	:param ent:
	:type ent: StepBasic_SiUnitAndLengthUnit
	:rtype: None") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepBasic_SiUnitAndLengthUnit> & ent);

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
		%feature("autodoc", ":rtype: None") RWStepBasic_RWSiUnitAndMassUnit;
		 RWStepBasic_RWSiUnitAndMassUnit ();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", ":param data:
	:type data: StepData_StepReaderData
	:param num:
	:type num: int
	:param ach:
	:type ach: Interface_Check
	:param ent:
	:type ent: StepBasic_SiUnitAndMassUnit
	:rtype: None") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepBasic_SiUnitAndMassUnit> & ent);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", ":param SW:
	:type SW: StepData_StepWriter
	:param ent:
	:type ent: StepBasic_SiUnitAndMassUnit
	:rtype: None") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepBasic_SiUnitAndMassUnit> & ent);

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
		%feature("autodoc", ":rtype: None") RWStepBasic_RWSiUnitAndPlaneAngleUnit;
		 RWStepBasic_RWSiUnitAndPlaneAngleUnit ();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", ":param data:
	:type data: StepData_StepReaderData
	:param num:
	:type num: int
	:param ach:
	:type ach: Interface_Check
	:param ent:
	:type ent: StepBasic_SiUnitAndPlaneAngleUnit
	:rtype: None") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepBasic_SiUnitAndPlaneAngleUnit> & ent);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", ":param SW:
	:type SW: StepData_StepWriter
	:param ent:
	:type ent: StepBasic_SiUnitAndPlaneAngleUnit
	:rtype: None") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepBasic_SiUnitAndPlaneAngleUnit> & ent);

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
		%feature("autodoc", ":rtype: None") RWStepBasic_RWSiUnitAndRatioUnit;
		 RWStepBasic_RWSiUnitAndRatioUnit ();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", ":param data:
	:type data: StepData_StepReaderData
	:param num:
	:type num: int
	:param ach:
	:type ach: Interface_Check
	:param ent:
	:type ent: StepBasic_SiUnitAndRatioUnit
	:rtype: None") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepBasic_SiUnitAndRatioUnit> & ent);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", ":param SW:
	:type SW: StepData_StepWriter
	:param ent:
	:type ent: StepBasic_SiUnitAndRatioUnit
	:rtype: None") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepBasic_SiUnitAndRatioUnit> & ent);

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
		%feature("autodoc", ":rtype: None") RWStepBasic_RWSiUnitAndSolidAngleUnit;
		 RWStepBasic_RWSiUnitAndSolidAngleUnit ();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", ":param data:
	:type data: StepData_StepReaderData
	:param num:
	:type num: int
	:param ach:
	:type ach: Interface_Check
	:param ent:
	:type ent: StepBasic_SiUnitAndSolidAngleUnit
	:rtype: None") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepBasic_SiUnitAndSolidAngleUnit> & ent);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", ":param SW:
	:type SW: StepData_StepWriter
	:param ent:
	:type ent: StepBasic_SiUnitAndSolidAngleUnit
	:rtype: None") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepBasic_SiUnitAndSolidAngleUnit> & ent);

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
		%feature("autodoc", ":rtype: None") RWStepBasic_RWSiUnitAndThermodynamicTemperatureUnit;
		 RWStepBasic_RWSiUnitAndThermodynamicTemperatureUnit ();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", ":param data:
	:type data: StepData_StepReaderData
	:param num:
	:type num: int
	:param ach:
	:type ach: Interface_Check
	:param ent:
	:type ent: StepBasic_SiUnitAndThermodynamicTemperatureUnit
	:rtype: None") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepBasic_SiUnitAndThermodynamicTemperatureUnit> & ent);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", ":param SW:
	:type SW: StepData_StepWriter
	:param ent:
	:type ent: StepBasic_SiUnitAndThermodynamicTemperatureUnit
	:rtype: None") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepBasic_SiUnitAndThermodynamicTemperatureUnit> & ent);

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
		%feature("autodoc", ":rtype: None") RWStepBasic_RWSiUnitAndTimeUnit;
		 RWStepBasic_RWSiUnitAndTimeUnit ();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", ":param data:
	:type data: StepData_StepReaderData
	:param num:
	:type num: int
	:param ach:
	:type ach: Interface_Check
	:param ent:
	:type ent: StepBasic_SiUnitAndTimeUnit
	:rtype: None") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepBasic_SiUnitAndTimeUnit> & ent);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", ":param SW:
	:type SW: StepData_StepWriter
	:param ent:
	:type ent: StepBasic_SiUnitAndTimeUnit
	:rtype: None") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepBasic_SiUnitAndTimeUnit> & ent);

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
		%feature("autodoc", ":rtype: None") RWStepBasic_RWSiUnitAndVolumeUnit;
		 RWStepBasic_RWSiUnitAndVolumeUnit ();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", ":param data:
	:type data: StepData_StepReaderData
	:param num:
	:type num: int
	:param ach:
	:type ach: Interface_Check
	:param ent:
	:type ent: StepBasic_SiUnitAndVolumeUnit
	:rtype: None") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepBasic_SiUnitAndVolumeUnit> & ent);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", ":param SW:
	:type SW: StepData_StepWriter
	:param ent:
	:type ent: StepBasic_SiUnitAndVolumeUnit
	:rtype: None") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepBasic_SiUnitAndVolumeUnit> & ent);

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
		%feature("autodoc", ":rtype: None") RWStepBasic_RWSolidAngleMeasureWithUnit;
		 RWStepBasic_RWSolidAngleMeasureWithUnit ();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", ":param data:
	:type data: StepData_StepReaderData
	:param num:
	:type num: int
	:param ach:
	:type ach: Interface_Check
	:param ent:
	:type ent: StepBasic_SolidAngleMeasureWithUnit
	:rtype: None") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepBasic_SolidAngleMeasureWithUnit> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", ":param ent:
	:type ent: StepBasic_SolidAngleMeasureWithUnit
	:param iter:
	:type iter: Interface_EntityIterator
	:rtype: None") Share;
		void Share (const opencascade::handle<StepBasic_SolidAngleMeasureWithUnit> & ent,Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", ":param SW:
	:type SW: StepData_StepWriter
	:param ent:
	:type ent: StepBasic_SolidAngleMeasureWithUnit
	:rtype: None") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepBasic_SolidAngleMeasureWithUnit> & ent);

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
		%feature("autodoc", ":rtype: None") RWStepBasic_RWSolidAngleUnit;
		 RWStepBasic_RWSolidAngleUnit ();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", ":param data:
	:type data: StepData_StepReaderData
	:param num:
	:type num: int
	:param ach:
	:type ach: Interface_Check
	:param ent:
	:type ent: StepBasic_SolidAngleUnit
	:rtype: None") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepBasic_SolidAngleUnit> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", ":param ent:
	:type ent: StepBasic_SolidAngleUnit
	:param iter:
	:type iter: Interface_EntityIterator
	:rtype: None") Share;
		void Share (const opencascade::handle<StepBasic_SolidAngleUnit> & ent,Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", ":param SW:
	:type SW: StepData_StepWriter
	:param ent:
	:type ent: StepBasic_SolidAngleUnit
	:rtype: None") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepBasic_SolidAngleUnit> & ent);

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
		%feature("autodoc", "* Empty constructor
	:rtype: None") RWStepBasic_RWThermodynamicTemperatureUnit;
		 RWStepBasic_RWThermodynamicTemperatureUnit ();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "* Reads ThermodynamicTemperatureUnit
	:param data:
	:type data: StepData_StepReaderData
	:param num:
	:type num: int
	:param ach:
	:type ach: Interface_Check
	:param ent:
	:type ent: StepBasic_ThermodynamicTemperatureUnit
	:rtype: None") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepBasic_ThermodynamicTemperatureUnit> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "* Fills data for graph (shared items)
	:param ent:
	:type ent: StepBasic_ThermodynamicTemperatureUnit
	:param iter:
	:type iter: Interface_EntityIterator
	:rtype: None") Share;
		void Share (const opencascade::handle<StepBasic_ThermodynamicTemperatureUnit> & ent,Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "* Writes ThermodynamicTemperatureUnit
	:param SW:
	:type SW: StepData_StepWriter
	:param ent:
	:type ent: StepBasic_ThermodynamicTemperatureUnit
	:rtype: None") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepBasic_ThermodynamicTemperatureUnit> & ent);

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
		%feature("autodoc", ":rtype: None") RWStepBasic_RWUncertaintyMeasureWithUnit;
		 RWStepBasic_RWUncertaintyMeasureWithUnit ();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", ":param data:
	:type data: StepData_StepReaderData
	:param num:
	:type num: int
	:param ach:
	:type ach: Interface_Check
	:param ent:
	:type ent: StepBasic_UncertaintyMeasureWithUnit
	:rtype: None") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepBasic_UncertaintyMeasureWithUnit> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", ":param ent:
	:type ent: StepBasic_UncertaintyMeasureWithUnit
	:param iter:
	:type iter: Interface_EntityIterator
	:rtype: None") Share;
		void Share (const opencascade::handle<StepBasic_UncertaintyMeasureWithUnit> & ent,Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", ":param SW:
	:type SW: StepData_StepWriter
	:param ent:
	:type ent: StepBasic_UncertaintyMeasureWithUnit
	:rtype: None") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepBasic_UncertaintyMeasureWithUnit> & ent);

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
		%feature("autodoc", "* Empty constructor
	:rtype: None") RWStepBasic_RWVersionedActionRequest;
		 RWStepBasic_RWVersionedActionRequest ();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "* Reads VersionedActionRequest
	:param data:
	:type data: StepData_StepReaderData
	:param num:
	:type num: int
	:param ach:
	:type ach: Interface_Check
	:param ent:
	:type ent: StepBasic_VersionedActionRequest
	:rtype: None") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepBasic_VersionedActionRequest> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "* Fills data for graph (shared items)
	:param ent:
	:type ent: StepBasic_VersionedActionRequest
	:param iter:
	:type iter: Interface_EntityIterator
	:rtype: None") Share;
		void Share (const opencascade::handle<StepBasic_VersionedActionRequest> & ent,Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "* Writes VersionedActionRequest
	:param SW:
	:type SW: StepData_StepWriter
	:param ent:
	:type ent: StepBasic_VersionedActionRequest
	:rtype: None") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepBasic_VersionedActionRequest> & ent);

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
		%feature("autodoc", ":rtype: None") RWStepBasic_RWWeekOfYearAndDayDate;
		 RWStepBasic_RWWeekOfYearAndDayDate ();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", ":param data:
	:type data: StepData_StepReaderData
	:param num:
	:type num: int
	:param ach:
	:type ach: Interface_Check
	:param ent:
	:type ent: StepBasic_WeekOfYearAndDayDate
	:rtype: None") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepBasic_WeekOfYearAndDayDate> & ent);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", ":param SW:
	:type SW: StepData_StepWriter
	:param ent:
	:type ent: StepBasic_WeekOfYearAndDayDate
	:rtype: None") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepBasic_WeekOfYearAndDayDate> & ent);

};


%extend RWStepBasic_RWWeekOfYearAndDayDate {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/* harray1 classes */
/* harray2 classes */
/* hsequence classes */
