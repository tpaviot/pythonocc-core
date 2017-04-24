/*
Copyright 2008-2017 Thomas Paviot (tpaviot@gmail.com)


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
%module (package="OCC") RWStepBasic

#pragma SWIG nowarn=504,325,503

%{
#ifdef WNT
#pragma warning(disable : 4716)
#endif
%}

%include ../common/CommonIncludes.i
%include ../common/ExceptionCatcher.i
%include ../common/FunctionTransformers.i
%include ../common/Operators.i


%include RWStepBasic_headers.i


%pythoncode {
def register_handle(handle, base_object):
    """
    Inserts the handle into the base object to
    prevent memory corruption in certain cases
    """
    try:
        if base_object.IsKind("Standard_Transient"):
            base_object.thisHandle = handle
            base_object.thisown = False
    except:
        pass
};

/* typedefs */
/* end typedefs declaration */

/* public enums */
/* end public enums declaration */

%nodefaultctor RWStepBasic_RWAction;
class RWStepBasic_RWAction {
	public:
		%feature("compactdefaultargs") RWStepBasic_RWAction;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") RWStepBasic_RWAction;
		 RWStepBasic_RWAction ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	* Reads Action

	:param data:
	:type data: Handle_StepData_StepReaderData &
	:param num:
	:type num: int
	:param ach:
	:type ach: Handle_Interface_Check &
	:param ent:
	:type ent: Handle_StepBasic_Action &
	:rtype: None
") ReadStep;
		void ReadStep (const Handle_StepData_StepReaderData & data,const Standard_Integer num,Handle_Interface_Check & ach,const Handle_StepBasic_Action & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	* Writes Action

	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: Handle_StepBasic_Action &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const Handle_StepBasic_Action & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	* Fills data for graph (shared items)

	:param ent:
	:type ent: Handle_StepBasic_Action &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const Handle_StepBasic_Action & ent,Interface_EntityIterator & iter);
};


%extend RWStepBasic_RWAction {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepBasic_RWActionAssignment;
class RWStepBasic_RWActionAssignment {
	public:
		%feature("compactdefaultargs") RWStepBasic_RWActionAssignment;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") RWStepBasic_RWActionAssignment;
		 RWStepBasic_RWActionAssignment ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	* Reads ActionAssignment

	:param data:
	:type data: Handle_StepData_StepReaderData &
	:param num:
	:type num: int
	:param ach:
	:type ach: Handle_Interface_Check &
	:param ent:
	:type ent: Handle_StepBasic_ActionAssignment &
	:rtype: None
") ReadStep;
		void ReadStep (const Handle_StepData_StepReaderData & data,const Standard_Integer num,Handle_Interface_Check & ach,const Handle_StepBasic_ActionAssignment & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	* Writes ActionAssignment

	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: Handle_StepBasic_ActionAssignment &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const Handle_StepBasic_ActionAssignment & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	* Fills data for graph (shared items)

	:param ent:
	:type ent: Handle_StepBasic_ActionAssignment &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const Handle_StepBasic_ActionAssignment & ent,Interface_EntityIterator & iter);
};


%extend RWStepBasic_RWActionAssignment {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepBasic_RWActionMethod;
class RWStepBasic_RWActionMethod {
	public:
		%feature("compactdefaultargs") RWStepBasic_RWActionMethod;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") RWStepBasic_RWActionMethod;
		 RWStepBasic_RWActionMethod ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	* Reads ActionMethod

	:param data:
	:type data: Handle_StepData_StepReaderData &
	:param num:
	:type num: int
	:param ach:
	:type ach: Handle_Interface_Check &
	:param ent:
	:type ent: Handle_StepBasic_ActionMethod &
	:rtype: None
") ReadStep;
		void ReadStep (const Handle_StepData_StepReaderData & data,const Standard_Integer num,Handle_Interface_Check & ach,const Handle_StepBasic_ActionMethod & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	* Writes ActionMethod

	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: Handle_StepBasic_ActionMethod &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const Handle_StepBasic_ActionMethod & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	* Fills data for graph (shared items)

	:param ent:
	:type ent: Handle_StepBasic_ActionMethod &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const Handle_StepBasic_ActionMethod & ent,Interface_EntityIterator & iter);
};


%extend RWStepBasic_RWActionMethod {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepBasic_RWActionRequestAssignment;
class RWStepBasic_RWActionRequestAssignment {
	public:
		%feature("compactdefaultargs") RWStepBasic_RWActionRequestAssignment;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") RWStepBasic_RWActionRequestAssignment;
		 RWStepBasic_RWActionRequestAssignment ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	* Reads ActionRequestAssignment

	:param data:
	:type data: Handle_StepData_StepReaderData &
	:param num:
	:type num: int
	:param ach:
	:type ach: Handle_Interface_Check &
	:param ent:
	:type ent: Handle_StepBasic_ActionRequestAssignment &
	:rtype: None
") ReadStep;
		void ReadStep (const Handle_StepData_StepReaderData & data,const Standard_Integer num,Handle_Interface_Check & ach,const Handle_StepBasic_ActionRequestAssignment & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	* Writes ActionRequestAssignment

	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: Handle_StepBasic_ActionRequestAssignment &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const Handle_StepBasic_ActionRequestAssignment & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	* Fills data for graph (shared items)

	:param ent:
	:type ent: Handle_StepBasic_ActionRequestAssignment &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const Handle_StepBasic_ActionRequestAssignment & ent,Interface_EntityIterator & iter);
};


%extend RWStepBasic_RWActionRequestAssignment {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepBasic_RWActionRequestSolution;
class RWStepBasic_RWActionRequestSolution {
	public:
		%feature("compactdefaultargs") RWStepBasic_RWActionRequestSolution;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") RWStepBasic_RWActionRequestSolution;
		 RWStepBasic_RWActionRequestSolution ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	* Reads ActionRequestSolution

	:param data:
	:type data: Handle_StepData_StepReaderData &
	:param num:
	:type num: int
	:param ach:
	:type ach: Handle_Interface_Check &
	:param ent:
	:type ent: Handle_StepBasic_ActionRequestSolution &
	:rtype: None
") ReadStep;
		void ReadStep (const Handle_StepData_StepReaderData & data,const Standard_Integer num,Handle_Interface_Check & ach,const Handle_StepBasic_ActionRequestSolution & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	* Writes ActionRequestSolution

	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: Handle_StepBasic_ActionRequestSolution &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const Handle_StepBasic_ActionRequestSolution & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	* Fills data for graph (shared items)

	:param ent:
	:type ent: Handle_StepBasic_ActionRequestSolution &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const Handle_StepBasic_ActionRequestSolution & ent,Interface_EntityIterator & iter);
};


%extend RWStepBasic_RWActionRequestSolution {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepBasic_RWAddress;
class RWStepBasic_RWAddress {
	public:
		%feature("compactdefaultargs") RWStepBasic_RWAddress;
		%feature("autodoc", "	:rtype: None
") RWStepBasic_RWAddress;
		 RWStepBasic_RWAddress ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	:param data:
	:type data: Handle_StepData_StepReaderData &
	:param num:
	:type num: int
	:param ach:
	:type ach: Handle_Interface_Check &
	:param ent:
	:type ent: Handle_StepBasic_Address &
	:rtype: None
") ReadStep;
		void ReadStep (const Handle_StepData_StepReaderData & data,const Standard_Integer num,Handle_Interface_Check & ach,const Handle_StepBasic_Address & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: Handle_StepBasic_Address &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const Handle_StepBasic_Address & ent);
};


%extend RWStepBasic_RWAddress {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepBasic_RWApplicationContext;
class RWStepBasic_RWApplicationContext {
	public:
		%feature("compactdefaultargs") RWStepBasic_RWApplicationContext;
		%feature("autodoc", "	:rtype: None
") RWStepBasic_RWApplicationContext;
		 RWStepBasic_RWApplicationContext ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	:param data:
	:type data: Handle_StepData_StepReaderData &
	:param num:
	:type num: int
	:param ach:
	:type ach: Handle_Interface_Check &
	:param ent:
	:type ent: Handle_StepBasic_ApplicationContext &
	:rtype: None
") ReadStep;
		void ReadStep (const Handle_StepData_StepReaderData & data,const Standard_Integer num,Handle_Interface_Check & ach,const Handle_StepBasic_ApplicationContext & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: Handle_StepBasic_ApplicationContext &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const Handle_StepBasic_ApplicationContext & ent);
};


%extend RWStepBasic_RWApplicationContext {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepBasic_RWApplicationContextElement;
class RWStepBasic_RWApplicationContextElement {
	public:
		%feature("compactdefaultargs") RWStepBasic_RWApplicationContextElement;
		%feature("autodoc", "	:rtype: None
") RWStepBasic_RWApplicationContextElement;
		 RWStepBasic_RWApplicationContextElement ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	:param data:
	:type data: Handle_StepData_StepReaderData &
	:param num:
	:type num: int
	:param ach:
	:type ach: Handle_Interface_Check &
	:param ent:
	:type ent: Handle_StepBasic_ApplicationContextElement &
	:rtype: None
") ReadStep;
		void ReadStep (const Handle_StepData_StepReaderData & data,const Standard_Integer num,Handle_Interface_Check & ach,const Handle_StepBasic_ApplicationContextElement & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: Handle_StepBasic_ApplicationContextElement &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const Handle_StepBasic_ApplicationContextElement & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	:param ent:
	:type ent: Handle_StepBasic_ApplicationContextElement &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const Handle_StepBasic_ApplicationContextElement & ent,Interface_EntityIterator & iter);
};


%extend RWStepBasic_RWApplicationContextElement {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepBasic_RWApplicationProtocolDefinition;
class RWStepBasic_RWApplicationProtocolDefinition {
	public:
		%feature("compactdefaultargs") RWStepBasic_RWApplicationProtocolDefinition;
		%feature("autodoc", "	:rtype: None
") RWStepBasic_RWApplicationProtocolDefinition;
		 RWStepBasic_RWApplicationProtocolDefinition ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	:param data:
	:type data: Handle_StepData_StepReaderData &
	:param num:
	:type num: int
	:param ach:
	:type ach: Handle_Interface_Check &
	:param ent:
	:type ent: Handle_StepBasic_ApplicationProtocolDefinition &
	:rtype: None
") ReadStep;
		void ReadStep (const Handle_StepData_StepReaderData & data,const Standard_Integer num,Handle_Interface_Check & ach,const Handle_StepBasic_ApplicationProtocolDefinition & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: Handle_StepBasic_ApplicationProtocolDefinition &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const Handle_StepBasic_ApplicationProtocolDefinition & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	:param ent:
	:type ent: Handle_StepBasic_ApplicationProtocolDefinition &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const Handle_StepBasic_ApplicationProtocolDefinition & ent,Interface_EntityIterator & iter);
};


%extend RWStepBasic_RWApplicationProtocolDefinition {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepBasic_RWApproval;
class RWStepBasic_RWApproval {
	public:
		%feature("compactdefaultargs") RWStepBasic_RWApproval;
		%feature("autodoc", "	:rtype: None
") RWStepBasic_RWApproval;
		 RWStepBasic_RWApproval ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	:param data:
	:type data: Handle_StepData_StepReaderData &
	:param num:
	:type num: int
	:param ach:
	:type ach: Handle_Interface_Check &
	:param ent:
	:type ent: Handle_StepBasic_Approval &
	:rtype: None
") ReadStep;
		void ReadStep (const Handle_StepData_StepReaderData & data,const Standard_Integer num,Handle_Interface_Check & ach,const Handle_StepBasic_Approval & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: Handle_StepBasic_Approval &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const Handle_StepBasic_Approval & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	:param ent:
	:type ent: Handle_StepBasic_Approval &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const Handle_StepBasic_Approval & ent,Interface_EntityIterator & iter);
};


%extend RWStepBasic_RWApproval {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepBasic_RWApprovalDateTime;
class RWStepBasic_RWApprovalDateTime {
	public:
		%feature("compactdefaultargs") RWStepBasic_RWApprovalDateTime;
		%feature("autodoc", "	:rtype: None
") RWStepBasic_RWApprovalDateTime;
		 RWStepBasic_RWApprovalDateTime ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	:param data:
	:type data: Handle_StepData_StepReaderData &
	:param num:
	:type num: int
	:param ach:
	:type ach: Handle_Interface_Check &
	:param ent:
	:type ent: Handle_StepBasic_ApprovalDateTime &
	:rtype: None
") ReadStep;
		void ReadStep (const Handle_StepData_StepReaderData & data,const Standard_Integer num,Handle_Interface_Check & ach,const Handle_StepBasic_ApprovalDateTime & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: Handle_StepBasic_ApprovalDateTime &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const Handle_StepBasic_ApprovalDateTime & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	:param ent:
	:type ent: Handle_StepBasic_ApprovalDateTime &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const Handle_StepBasic_ApprovalDateTime & ent,Interface_EntityIterator & iter);
};


%extend RWStepBasic_RWApprovalDateTime {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepBasic_RWApprovalPersonOrganization;
class RWStepBasic_RWApprovalPersonOrganization {
	public:
		%feature("compactdefaultargs") RWStepBasic_RWApprovalPersonOrganization;
		%feature("autodoc", "	:rtype: None
") RWStepBasic_RWApprovalPersonOrganization;
		 RWStepBasic_RWApprovalPersonOrganization ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	:param data:
	:type data: Handle_StepData_StepReaderData &
	:param num:
	:type num: int
	:param ach:
	:type ach: Handle_Interface_Check &
	:param ent:
	:type ent: Handle_StepBasic_ApprovalPersonOrganization &
	:rtype: None
") ReadStep;
		void ReadStep (const Handle_StepData_StepReaderData & data,const Standard_Integer num,Handle_Interface_Check & ach,const Handle_StepBasic_ApprovalPersonOrganization & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: Handle_StepBasic_ApprovalPersonOrganization &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const Handle_StepBasic_ApprovalPersonOrganization & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	:param ent:
	:type ent: Handle_StepBasic_ApprovalPersonOrganization &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const Handle_StepBasic_ApprovalPersonOrganization & ent,Interface_EntityIterator & iter);
};


%extend RWStepBasic_RWApprovalPersonOrganization {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepBasic_RWApprovalRelationship;
class RWStepBasic_RWApprovalRelationship {
	public:
		%feature("compactdefaultargs") RWStepBasic_RWApprovalRelationship;
		%feature("autodoc", "	:rtype: None
") RWStepBasic_RWApprovalRelationship;
		 RWStepBasic_RWApprovalRelationship ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	:param data:
	:type data: Handle_StepData_StepReaderData &
	:param num:
	:type num: int
	:param ach:
	:type ach: Handle_Interface_Check &
	:param ent:
	:type ent: Handle_StepBasic_ApprovalRelationship &
	:rtype: None
") ReadStep;
		void ReadStep (const Handle_StepData_StepReaderData & data,const Standard_Integer num,Handle_Interface_Check & ach,const Handle_StepBasic_ApprovalRelationship & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: Handle_StepBasic_ApprovalRelationship &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const Handle_StepBasic_ApprovalRelationship & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	:param ent:
	:type ent: Handle_StepBasic_ApprovalRelationship &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const Handle_StepBasic_ApprovalRelationship & ent,Interface_EntityIterator & iter);
};


%extend RWStepBasic_RWApprovalRelationship {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepBasic_RWApprovalRole;
class RWStepBasic_RWApprovalRole {
	public:
		%feature("compactdefaultargs") RWStepBasic_RWApprovalRole;
		%feature("autodoc", "	:rtype: None
") RWStepBasic_RWApprovalRole;
		 RWStepBasic_RWApprovalRole ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	:param data:
	:type data: Handle_StepData_StepReaderData &
	:param num:
	:type num: int
	:param ach:
	:type ach: Handle_Interface_Check &
	:param ent:
	:type ent: Handle_StepBasic_ApprovalRole &
	:rtype: None
") ReadStep;
		void ReadStep (const Handle_StepData_StepReaderData & data,const Standard_Integer num,Handle_Interface_Check & ach,const Handle_StepBasic_ApprovalRole & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: Handle_StepBasic_ApprovalRole &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const Handle_StepBasic_ApprovalRole & ent);
};


%extend RWStepBasic_RWApprovalRole {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepBasic_RWApprovalStatus;
class RWStepBasic_RWApprovalStatus {
	public:
		%feature("compactdefaultargs") RWStepBasic_RWApprovalStatus;
		%feature("autodoc", "	:rtype: None
") RWStepBasic_RWApprovalStatus;
		 RWStepBasic_RWApprovalStatus ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	:param data:
	:type data: Handle_StepData_StepReaderData &
	:param num:
	:type num: int
	:param ach:
	:type ach: Handle_Interface_Check &
	:param ent:
	:type ent: Handle_StepBasic_ApprovalStatus &
	:rtype: None
") ReadStep;
		void ReadStep (const Handle_StepData_StepReaderData & data,const Standard_Integer num,Handle_Interface_Check & ach,const Handle_StepBasic_ApprovalStatus & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: Handle_StepBasic_ApprovalStatus &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const Handle_StepBasic_ApprovalStatus & ent);
};


%extend RWStepBasic_RWApprovalStatus {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepBasic_RWCalendarDate;
class RWStepBasic_RWCalendarDate {
	public:
		%feature("compactdefaultargs") RWStepBasic_RWCalendarDate;
		%feature("autodoc", "	:rtype: None
") RWStepBasic_RWCalendarDate;
		 RWStepBasic_RWCalendarDate ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	:param data:
	:type data: Handle_StepData_StepReaderData &
	:param num:
	:type num: int
	:param ach:
	:type ach: Handle_Interface_Check &
	:param ent:
	:type ent: Handle_StepBasic_CalendarDate &
	:rtype: None
") ReadStep;
		void ReadStep (const Handle_StepData_StepReaderData & data,const Standard_Integer num,Handle_Interface_Check & ach,const Handle_StepBasic_CalendarDate & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: Handle_StepBasic_CalendarDate &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const Handle_StepBasic_CalendarDate & ent);
};


%extend RWStepBasic_RWCalendarDate {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepBasic_RWCertification;
class RWStepBasic_RWCertification {
	public:
		%feature("compactdefaultargs") RWStepBasic_RWCertification;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") RWStepBasic_RWCertification;
		 RWStepBasic_RWCertification ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	* Reads Certification

	:param data:
	:type data: Handle_StepData_StepReaderData &
	:param num:
	:type num: int
	:param ach:
	:type ach: Handle_Interface_Check &
	:param ent:
	:type ent: Handle_StepBasic_Certification &
	:rtype: None
") ReadStep;
		void ReadStep (const Handle_StepData_StepReaderData & data,const Standard_Integer num,Handle_Interface_Check & ach,const Handle_StepBasic_Certification & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	* Writes Certification

	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: Handle_StepBasic_Certification &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const Handle_StepBasic_Certification & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	* Fills data for graph (shared items)

	:param ent:
	:type ent: Handle_StepBasic_Certification &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const Handle_StepBasic_Certification & ent,Interface_EntityIterator & iter);
};


%extend RWStepBasic_RWCertification {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepBasic_RWCertificationAssignment;
class RWStepBasic_RWCertificationAssignment {
	public:
		%feature("compactdefaultargs") RWStepBasic_RWCertificationAssignment;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") RWStepBasic_RWCertificationAssignment;
		 RWStepBasic_RWCertificationAssignment ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	* Reads CertificationAssignment

	:param data:
	:type data: Handle_StepData_StepReaderData &
	:param num:
	:type num: int
	:param ach:
	:type ach: Handle_Interface_Check &
	:param ent:
	:type ent: Handle_StepBasic_CertificationAssignment &
	:rtype: None
") ReadStep;
		void ReadStep (const Handle_StepData_StepReaderData & data,const Standard_Integer num,Handle_Interface_Check & ach,const Handle_StepBasic_CertificationAssignment & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	* Writes CertificationAssignment

	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: Handle_StepBasic_CertificationAssignment &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const Handle_StepBasic_CertificationAssignment & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	* Fills data for graph (shared items)

	:param ent:
	:type ent: Handle_StepBasic_CertificationAssignment &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const Handle_StepBasic_CertificationAssignment & ent,Interface_EntityIterator & iter);
};


%extend RWStepBasic_RWCertificationAssignment {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepBasic_RWCertificationType;
class RWStepBasic_RWCertificationType {
	public:
		%feature("compactdefaultargs") RWStepBasic_RWCertificationType;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") RWStepBasic_RWCertificationType;
		 RWStepBasic_RWCertificationType ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	* Reads CertificationType

	:param data:
	:type data: Handle_StepData_StepReaderData &
	:param num:
	:type num: int
	:param ach:
	:type ach: Handle_Interface_Check &
	:param ent:
	:type ent: Handle_StepBasic_CertificationType &
	:rtype: None
") ReadStep;
		void ReadStep (const Handle_StepData_StepReaderData & data,const Standard_Integer num,Handle_Interface_Check & ach,const Handle_StepBasic_CertificationType & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	* Writes CertificationType

	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: Handle_StepBasic_CertificationType &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const Handle_StepBasic_CertificationType & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	* Fills data for graph (shared items)

	:param ent:
	:type ent: Handle_StepBasic_CertificationType &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const Handle_StepBasic_CertificationType & ent,Interface_EntityIterator & iter);
};


%extend RWStepBasic_RWCertificationType {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepBasic_RWCharacterizedObject;
class RWStepBasic_RWCharacterizedObject {
	public:
		%feature("compactdefaultargs") RWStepBasic_RWCharacterizedObject;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") RWStepBasic_RWCharacterizedObject;
		 RWStepBasic_RWCharacterizedObject ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	* Reads CharacterizedObject

	:param data:
	:type data: Handle_StepData_StepReaderData &
	:param num:
	:type num: int
	:param ach:
	:type ach: Handle_Interface_Check &
	:param ent:
	:type ent: Handle_StepBasic_CharacterizedObject &
	:rtype: None
") ReadStep;
		void ReadStep (const Handle_StepData_StepReaderData & data,const Standard_Integer num,Handle_Interface_Check & ach,const Handle_StepBasic_CharacterizedObject & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	* Writes CharacterizedObject

	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: Handle_StepBasic_CharacterizedObject &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const Handle_StepBasic_CharacterizedObject & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	* Fills data for graph (shared items)

	:param ent:
	:type ent: Handle_StepBasic_CharacterizedObject &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const Handle_StepBasic_CharacterizedObject & ent,Interface_EntityIterator & iter);
};


%extend RWStepBasic_RWCharacterizedObject {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepBasic_RWContract;
class RWStepBasic_RWContract {
	public:
		%feature("compactdefaultargs") RWStepBasic_RWContract;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") RWStepBasic_RWContract;
		 RWStepBasic_RWContract ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	* Reads Contract

	:param data:
	:type data: Handle_StepData_StepReaderData &
	:param num:
	:type num: int
	:param ach:
	:type ach: Handle_Interface_Check &
	:param ent:
	:type ent: Handle_StepBasic_Contract &
	:rtype: None
") ReadStep;
		void ReadStep (const Handle_StepData_StepReaderData & data,const Standard_Integer num,Handle_Interface_Check & ach,const Handle_StepBasic_Contract & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	* Writes Contract

	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: Handle_StepBasic_Contract &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const Handle_StepBasic_Contract & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	* Fills data for graph (shared items)

	:param ent:
	:type ent: Handle_StepBasic_Contract &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const Handle_StepBasic_Contract & ent,Interface_EntityIterator & iter);
};


%extend RWStepBasic_RWContract {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepBasic_RWContractAssignment;
class RWStepBasic_RWContractAssignment {
	public:
		%feature("compactdefaultargs") RWStepBasic_RWContractAssignment;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") RWStepBasic_RWContractAssignment;
		 RWStepBasic_RWContractAssignment ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	* Reads ContractAssignment

	:param data:
	:type data: Handle_StepData_StepReaderData &
	:param num:
	:type num: int
	:param ach:
	:type ach: Handle_Interface_Check &
	:param ent:
	:type ent: Handle_StepBasic_ContractAssignment &
	:rtype: None
") ReadStep;
		void ReadStep (const Handle_StepData_StepReaderData & data,const Standard_Integer num,Handle_Interface_Check & ach,const Handle_StepBasic_ContractAssignment & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	* Writes ContractAssignment

	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: Handle_StepBasic_ContractAssignment &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const Handle_StepBasic_ContractAssignment & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	* Fills data for graph (shared items)

	:param ent:
	:type ent: Handle_StepBasic_ContractAssignment &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const Handle_StepBasic_ContractAssignment & ent,Interface_EntityIterator & iter);
};


%extend RWStepBasic_RWContractAssignment {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepBasic_RWContractType;
class RWStepBasic_RWContractType {
	public:
		%feature("compactdefaultargs") RWStepBasic_RWContractType;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") RWStepBasic_RWContractType;
		 RWStepBasic_RWContractType ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	* Reads ContractType

	:param data:
	:type data: Handle_StepData_StepReaderData &
	:param num:
	:type num: int
	:param ach:
	:type ach: Handle_Interface_Check &
	:param ent:
	:type ent: Handle_StepBasic_ContractType &
	:rtype: None
") ReadStep;
		void ReadStep (const Handle_StepData_StepReaderData & data,const Standard_Integer num,Handle_Interface_Check & ach,const Handle_StepBasic_ContractType & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	* Writes ContractType

	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: Handle_StepBasic_ContractType &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const Handle_StepBasic_ContractType & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	* Fills data for graph (shared items)

	:param ent:
	:type ent: Handle_StepBasic_ContractType &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const Handle_StepBasic_ContractType & ent,Interface_EntityIterator & iter);
};


%extend RWStepBasic_RWContractType {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepBasic_RWConversionBasedUnit;
class RWStepBasic_RWConversionBasedUnit {
	public:
		%feature("compactdefaultargs") RWStepBasic_RWConversionBasedUnit;
		%feature("autodoc", "	:rtype: None
") RWStepBasic_RWConversionBasedUnit;
		 RWStepBasic_RWConversionBasedUnit ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	:param data:
	:type data: Handle_StepData_StepReaderData &
	:param num:
	:type num: int
	:param ach:
	:type ach: Handle_Interface_Check &
	:param ent:
	:type ent: Handle_StepBasic_ConversionBasedUnit &
	:rtype: None
") ReadStep;
		void ReadStep (const Handle_StepData_StepReaderData & data,const Standard_Integer num,Handle_Interface_Check & ach,const Handle_StepBasic_ConversionBasedUnit & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: Handle_StepBasic_ConversionBasedUnit &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const Handle_StepBasic_ConversionBasedUnit & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	:param ent:
	:type ent: Handle_StepBasic_ConversionBasedUnit &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const Handle_StepBasic_ConversionBasedUnit & ent,Interface_EntityIterator & iter);
};


%extend RWStepBasic_RWConversionBasedUnit {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepBasic_RWConversionBasedUnitAndAreaUnit;
class RWStepBasic_RWConversionBasedUnitAndAreaUnit {
	public:
		%feature("compactdefaultargs") RWStepBasic_RWConversionBasedUnitAndAreaUnit;
		%feature("autodoc", "	:rtype: None
") RWStepBasic_RWConversionBasedUnitAndAreaUnit;
		 RWStepBasic_RWConversionBasedUnitAndAreaUnit ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	:param data:
	:type data: Handle_StepData_StepReaderData &
	:param num:
	:type num: int
	:param ach:
	:type ach: Handle_Interface_Check &
	:param ent:
	:type ent: Handle_StepBasic_ConversionBasedUnitAndAreaUnit &
	:rtype: None
") ReadStep;
		void ReadStep (const Handle_StepData_StepReaderData & data,const Standard_Integer num,Handle_Interface_Check & ach,const Handle_StepBasic_ConversionBasedUnitAndAreaUnit & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: Handle_StepBasic_ConversionBasedUnitAndAreaUnit &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const Handle_StepBasic_ConversionBasedUnitAndAreaUnit & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	:param ent:
	:type ent: Handle_StepBasic_ConversionBasedUnitAndAreaUnit &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const Handle_StepBasic_ConversionBasedUnitAndAreaUnit & ent,Interface_EntityIterator & iter);
};


%extend RWStepBasic_RWConversionBasedUnitAndAreaUnit {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepBasic_RWConversionBasedUnitAndLengthUnit;
class RWStepBasic_RWConversionBasedUnitAndLengthUnit {
	public:
		%feature("compactdefaultargs") RWStepBasic_RWConversionBasedUnitAndLengthUnit;
		%feature("autodoc", "	:rtype: None
") RWStepBasic_RWConversionBasedUnitAndLengthUnit;
		 RWStepBasic_RWConversionBasedUnitAndLengthUnit ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	:param data:
	:type data: Handle_StepData_StepReaderData &
	:param num:
	:type num: int
	:param ach:
	:type ach: Handle_Interface_Check &
	:param ent:
	:type ent: Handle_StepBasic_ConversionBasedUnitAndLengthUnit &
	:rtype: None
") ReadStep;
		void ReadStep (const Handle_StepData_StepReaderData & data,const Standard_Integer num,Handle_Interface_Check & ach,const Handle_StepBasic_ConversionBasedUnitAndLengthUnit & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: Handle_StepBasic_ConversionBasedUnitAndLengthUnit &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const Handle_StepBasic_ConversionBasedUnitAndLengthUnit & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	:param ent:
	:type ent: Handle_StepBasic_ConversionBasedUnitAndLengthUnit &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const Handle_StepBasic_ConversionBasedUnitAndLengthUnit & ent,Interface_EntityIterator & iter);
};


%extend RWStepBasic_RWConversionBasedUnitAndLengthUnit {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepBasic_RWConversionBasedUnitAndMassUnit;
class RWStepBasic_RWConversionBasedUnitAndMassUnit {
	public:
		%feature("compactdefaultargs") RWStepBasic_RWConversionBasedUnitAndMassUnit;
		%feature("autodoc", "	:rtype: None
") RWStepBasic_RWConversionBasedUnitAndMassUnit;
		 RWStepBasic_RWConversionBasedUnitAndMassUnit ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	:param data:
	:type data: Handle_StepData_StepReaderData &
	:param num:
	:type num: int
	:param ach:
	:type ach: Handle_Interface_Check &
	:param ent:
	:type ent: Handle_StepBasic_ConversionBasedUnitAndMassUnit &
	:rtype: None
") ReadStep;
		void ReadStep (const Handle_StepData_StepReaderData & data,const Standard_Integer num,Handle_Interface_Check & ach,const Handle_StepBasic_ConversionBasedUnitAndMassUnit & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: Handle_StepBasic_ConversionBasedUnitAndMassUnit &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const Handle_StepBasic_ConversionBasedUnitAndMassUnit & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	:param ent:
	:type ent: Handle_StepBasic_ConversionBasedUnitAndMassUnit &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const Handle_StepBasic_ConversionBasedUnitAndMassUnit & ent,Interface_EntityIterator & iter);
};


%extend RWStepBasic_RWConversionBasedUnitAndMassUnit {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepBasic_RWConversionBasedUnitAndPlaneAngleUnit;
class RWStepBasic_RWConversionBasedUnitAndPlaneAngleUnit {
	public:
		%feature("compactdefaultargs") RWStepBasic_RWConversionBasedUnitAndPlaneAngleUnit;
		%feature("autodoc", "	:rtype: None
") RWStepBasic_RWConversionBasedUnitAndPlaneAngleUnit;
		 RWStepBasic_RWConversionBasedUnitAndPlaneAngleUnit ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	:param data:
	:type data: Handle_StepData_StepReaderData &
	:param num:
	:type num: int
	:param ach:
	:type ach: Handle_Interface_Check &
	:param ent:
	:type ent: Handle_StepBasic_ConversionBasedUnitAndPlaneAngleUnit &
	:rtype: None
") ReadStep;
		void ReadStep (const Handle_StepData_StepReaderData & data,const Standard_Integer num,Handle_Interface_Check & ach,const Handle_StepBasic_ConversionBasedUnitAndPlaneAngleUnit & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: Handle_StepBasic_ConversionBasedUnitAndPlaneAngleUnit &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const Handle_StepBasic_ConversionBasedUnitAndPlaneAngleUnit & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	:param ent:
	:type ent: Handle_StepBasic_ConversionBasedUnitAndPlaneAngleUnit &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const Handle_StepBasic_ConversionBasedUnitAndPlaneAngleUnit & ent,Interface_EntityIterator & iter);
};


%extend RWStepBasic_RWConversionBasedUnitAndPlaneAngleUnit {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepBasic_RWConversionBasedUnitAndRatioUnit;
class RWStepBasic_RWConversionBasedUnitAndRatioUnit {
	public:
		%feature("compactdefaultargs") RWStepBasic_RWConversionBasedUnitAndRatioUnit;
		%feature("autodoc", "	:rtype: None
") RWStepBasic_RWConversionBasedUnitAndRatioUnit;
		 RWStepBasic_RWConversionBasedUnitAndRatioUnit ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	:param data:
	:type data: Handle_StepData_StepReaderData &
	:param num:
	:type num: int
	:param ach:
	:type ach: Handle_Interface_Check &
	:param ent:
	:type ent: Handle_StepBasic_ConversionBasedUnitAndRatioUnit &
	:rtype: None
") ReadStep;
		void ReadStep (const Handle_StepData_StepReaderData & data,const Standard_Integer num,Handle_Interface_Check & ach,const Handle_StepBasic_ConversionBasedUnitAndRatioUnit & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: Handle_StepBasic_ConversionBasedUnitAndRatioUnit &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const Handle_StepBasic_ConversionBasedUnitAndRatioUnit & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	:param ent:
	:type ent: Handle_StepBasic_ConversionBasedUnitAndRatioUnit &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const Handle_StepBasic_ConversionBasedUnitAndRatioUnit & ent,Interface_EntityIterator & iter);
};


%extend RWStepBasic_RWConversionBasedUnitAndRatioUnit {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepBasic_RWConversionBasedUnitAndSolidAngleUnit;
class RWStepBasic_RWConversionBasedUnitAndSolidAngleUnit {
	public:
		%feature("compactdefaultargs") RWStepBasic_RWConversionBasedUnitAndSolidAngleUnit;
		%feature("autodoc", "	:rtype: None
") RWStepBasic_RWConversionBasedUnitAndSolidAngleUnit;
		 RWStepBasic_RWConversionBasedUnitAndSolidAngleUnit ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	:param data:
	:type data: Handle_StepData_StepReaderData &
	:param num:
	:type num: int
	:param ach:
	:type ach: Handle_Interface_Check &
	:param ent:
	:type ent: Handle_StepBasic_ConversionBasedUnitAndSolidAngleUnit &
	:rtype: None
") ReadStep;
		void ReadStep (const Handle_StepData_StepReaderData & data,const Standard_Integer num,Handle_Interface_Check & ach,const Handle_StepBasic_ConversionBasedUnitAndSolidAngleUnit & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: Handle_StepBasic_ConversionBasedUnitAndSolidAngleUnit &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const Handle_StepBasic_ConversionBasedUnitAndSolidAngleUnit & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	:param ent:
	:type ent: Handle_StepBasic_ConversionBasedUnitAndSolidAngleUnit &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const Handle_StepBasic_ConversionBasedUnitAndSolidAngleUnit & ent,Interface_EntityIterator & iter);
};


%extend RWStepBasic_RWConversionBasedUnitAndSolidAngleUnit {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepBasic_RWConversionBasedUnitAndTimeUnit;
class RWStepBasic_RWConversionBasedUnitAndTimeUnit {
	public:
		%feature("compactdefaultargs") RWStepBasic_RWConversionBasedUnitAndTimeUnit;
		%feature("autodoc", "	:rtype: None
") RWStepBasic_RWConversionBasedUnitAndTimeUnit;
		 RWStepBasic_RWConversionBasedUnitAndTimeUnit ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	:param data:
	:type data: Handle_StepData_StepReaderData &
	:param num:
	:type num: int
	:param ach:
	:type ach: Handle_Interface_Check &
	:param ent:
	:type ent: Handle_StepBasic_ConversionBasedUnitAndTimeUnit &
	:rtype: None
") ReadStep;
		void ReadStep (const Handle_StepData_StepReaderData & data,const Standard_Integer num,Handle_Interface_Check & ach,const Handle_StepBasic_ConversionBasedUnitAndTimeUnit & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: Handle_StepBasic_ConversionBasedUnitAndTimeUnit &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const Handle_StepBasic_ConversionBasedUnitAndTimeUnit & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	:param ent:
	:type ent: Handle_StepBasic_ConversionBasedUnitAndTimeUnit &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const Handle_StepBasic_ConversionBasedUnitAndTimeUnit & ent,Interface_EntityIterator & iter);
};


%extend RWStepBasic_RWConversionBasedUnitAndTimeUnit {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepBasic_RWConversionBasedUnitAndVolumeUnit;
class RWStepBasic_RWConversionBasedUnitAndVolumeUnit {
	public:
		%feature("compactdefaultargs") RWStepBasic_RWConversionBasedUnitAndVolumeUnit;
		%feature("autodoc", "	:rtype: None
") RWStepBasic_RWConversionBasedUnitAndVolumeUnit;
		 RWStepBasic_RWConversionBasedUnitAndVolumeUnit ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	:param data:
	:type data: Handle_StepData_StepReaderData &
	:param num:
	:type num: int
	:param ach:
	:type ach: Handle_Interface_Check &
	:param ent:
	:type ent: Handle_StepBasic_ConversionBasedUnitAndVolumeUnit &
	:rtype: None
") ReadStep;
		void ReadStep (const Handle_StepData_StepReaderData & data,const Standard_Integer num,Handle_Interface_Check & ach,const Handle_StepBasic_ConversionBasedUnitAndVolumeUnit & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: Handle_StepBasic_ConversionBasedUnitAndVolumeUnit &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const Handle_StepBasic_ConversionBasedUnitAndVolumeUnit & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	:param ent:
	:type ent: Handle_StepBasic_ConversionBasedUnitAndVolumeUnit &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const Handle_StepBasic_ConversionBasedUnitAndVolumeUnit & ent,Interface_EntityIterator & iter);
};


%extend RWStepBasic_RWConversionBasedUnitAndVolumeUnit {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepBasic_RWCoordinatedUniversalTimeOffset;
class RWStepBasic_RWCoordinatedUniversalTimeOffset {
	public:
		%feature("compactdefaultargs") RWStepBasic_RWCoordinatedUniversalTimeOffset;
		%feature("autodoc", "	:rtype: None
") RWStepBasic_RWCoordinatedUniversalTimeOffset;
		 RWStepBasic_RWCoordinatedUniversalTimeOffset ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	:param data:
	:type data: Handle_StepData_StepReaderData &
	:param num:
	:type num: int
	:param ach:
	:type ach: Handle_Interface_Check &
	:param ent:
	:type ent: Handle_StepBasic_CoordinatedUniversalTimeOffset &
	:rtype: None
") ReadStep;
		void ReadStep (const Handle_StepData_StepReaderData & data,const Standard_Integer num,Handle_Interface_Check & ach,const Handle_StepBasic_CoordinatedUniversalTimeOffset & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: Handle_StepBasic_CoordinatedUniversalTimeOffset &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const Handle_StepBasic_CoordinatedUniversalTimeOffset & ent);
};


%extend RWStepBasic_RWCoordinatedUniversalTimeOffset {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepBasic_RWDate;
class RWStepBasic_RWDate {
	public:
		%feature("compactdefaultargs") RWStepBasic_RWDate;
		%feature("autodoc", "	:rtype: None
") RWStepBasic_RWDate;
		 RWStepBasic_RWDate ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	:param data:
	:type data: Handle_StepData_StepReaderData &
	:param num:
	:type num: int
	:param ach:
	:type ach: Handle_Interface_Check &
	:param ent:
	:type ent: Handle_StepBasic_Date &
	:rtype: None
") ReadStep;
		void ReadStep (const Handle_StepData_StepReaderData & data,const Standard_Integer num,Handle_Interface_Check & ach,const Handle_StepBasic_Date & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: Handle_StepBasic_Date &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const Handle_StepBasic_Date & ent);
};


%extend RWStepBasic_RWDate {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepBasic_RWDateAndTime;
class RWStepBasic_RWDateAndTime {
	public:
		%feature("compactdefaultargs") RWStepBasic_RWDateAndTime;
		%feature("autodoc", "	:rtype: None
") RWStepBasic_RWDateAndTime;
		 RWStepBasic_RWDateAndTime ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	:param data:
	:type data: Handle_StepData_StepReaderData &
	:param num:
	:type num: int
	:param ach:
	:type ach: Handle_Interface_Check &
	:param ent:
	:type ent: Handle_StepBasic_DateAndTime &
	:rtype: None
") ReadStep;
		void ReadStep (const Handle_StepData_StepReaderData & data,const Standard_Integer num,Handle_Interface_Check & ach,const Handle_StepBasic_DateAndTime & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: Handle_StepBasic_DateAndTime &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const Handle_StepBasic_DateAndTime & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	:param ent:
	:type ent: Handle_StepBasic_DateAndTime &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const Handle_StepBasic_DateAndTime & ent,Interface_EntityIterator & iter);
};


%extend RWStepBasic_RWDateAndTime {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepBasic_RWDateRole;
class RWStepBasic_RWDateRole {
	public:
		%feature("compactdefaultargs") RWStepBasic_RWDateRole;
		%feature("autodoc", "	:rtype: None
") RWStepBasic_RWDateRole;
		 RWStepBasic_RWDateRole ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	:param data:
	:type data: Handle_StepData_StepReaderData &
	:param num:
	:type num: int
	:param ach:
	:type ach: Handle_Interface_Check &
	:param ent:
	:type ent: Handle_StepBasic_DateRole &
	:rtype: None
") ReadStep;
		void ReadStep (const Handle_StepData_StepReaderData & data,const Standard_Integer num,Handle_Interface_Check & ach,const Handle_StepBasic_DateRole & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: Handle_StepBasic_DateRole &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const Handle_StepBasic_DateRole & ent);
};


%extend RWStepBasic_RWDateRole {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepBasic_RWDateTimeRole;
class RWStepBasic_RWDateTimeRole {
	public:
		%feature("compactdefaultargs") RWStepBasic_RWDateTimeRole;
		%feature("autodoc", "	:rtype: None
") RWStepBasic_RWDateTimeRole;
		 RWStepBasic_RWDateTimeRole ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	:param data:
	:type data: Handle_StepData_StepReaderData &
	:param num:
	:type num: int
	:param ach:
	:type ach: Handle_Interface_Check &
	:param ent:
	:type ent: Handle_StepBasic_DateTimeRole &
	:rtype: None
") ReadStep;
		void ReadStep (const Handle_StepData_StepReaderData & data,const Standard_Integer num,Handle_Interface_Check & ach,const Handle_StepBasic_DateTimeRole & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: Handle_StepBasic_DateTimeRole &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const Handle_StepBasic_DateTimeRole & ent);
};


%extend RWStepBasic_RWDateTimeRole {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepBasic_RWDerivedUnit;
class RWStepBasic_RWDerivedUnit {
	public:
		%feature("compactdefaultargs") RWStepBasic_RWDerivedUnit;
		%feature("autodoc", "	:rtype: None
") RWStepBasic_RWDerivedUnit;
		 RWStepBasic_RWDerivedUnit ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	:param data:
	:type data: Handle_StepData_StepReaderData &
	:param num:
	:type num: int
	:param ach:
	:type ach: Handle_Interface_Check &
	:param ent:
	:type ent: Handle_StepBasic_DerivedUnit &
	:rtype: None
") ReadStep;
		void ReadStep (const Handle_StepData_StepReaderData & data,const Standard_Integer num,Handle_Interface_Check & ach,const Handle_StepBasic_DerivedUnit & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: Handle_StepBasic_DerivedUnit &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const Handle_StepBasic_DerivedUnit & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	:param ent:
	:type ent: Handle_StepBasic_DerivedUnit &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const Handle_StepBasic_DerivedUnit & ent,Interface_EntityIterator & iter);
};


%extend RWStepBasic_RWDerivedUnit {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepBasic_RWDerivedUnitElement;
class RWStepBasic_RWDerivedUnitElement {
	public:
		%feature("compactdefaultargs") RWStepBasic_RWDerivedUnitElement;
		%feature("autodoc", "	:rtype: None
") RWStepBasic_RWDerivedUnitElement;
		 RWStepBasic_RWDerivedUnitElement ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	:param data:
	:type data: Handle_StepData_StepReaderData &
	:param num:
	:type num: int
	:param ach:
	:type ach: Handle_Interface_Check &
	:param ent:
	:type ent: Handle_StepBasic_DerivedUnitElement &
	:rtype: None
") ReadStep;
		void ReadStep (const Handle_StepData_StepReaderData & data,const Standard_Integer num,Handle_Interface_Check & ach,const Handle_StepBasic_DerivedUnitElement & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: Handle_StepBasic_DerivedUnitElement &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const Handle_StepBasic_DerivedUnitElement & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	:param ent:
	:type ent: Handle_StepBasic_DerivedUnitElement &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const Handle_StepBasic_DerivedUnitElement & ent,Interface_EntityIterator & iter);
};


%extend RWStepBasic_RWDerivedUnitElement {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepBasic_RWDimensionalExponents;
class RWStepBasic_RWDimensionalExponents {
	public:
		%feature("compactdefaultargs") RWStepBasic_RWDimensionalExponents;
		%feature("autodoc", "	:rtype: None
") RWStepBasic_RWDimensionalExponents;
		 RWStepBasic_RWDimensionalExponents ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	:param data:
	:type data: Handle_StepData_StepReaderData &
	:param num:
	:type num: int
	:param ach:
	:type ach: Handle_Interface_Check &
	:param ent:
	:type ent: Handle_StepBasic_DimensionalExponents &
	:rtype: None
") ReadStep;
		void ReadStep (const Handle_StepData_StepReaderData & data,const Standard_Integer num,Handle_Interface_Check & ach,const Handle_StepBasic_DimensionalExponents & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: Handle_StepBasic_DimensionalExponents &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const Handle_StepBasic_DimensionalExponents & ent);
};


%extend RWStepBasic_RWDimensionalExponents {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepBasic_RWDocument;
class RWStepBasic_RWDocument {
	public:
		%feature("compactdefaultargs") RWStepBasic_RWDocument;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") RWStepBasic_RWDocument;
		 RWStepBasic_RWDocument ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	* Reads Document

	:param data:
	:type data: Handle_StepData_StepReaderData &
	:param num:
	:type num: int
	:param ach:
	:type ach: Handle_Interface_Check &
	:param ent:
	:type ent: Handle_StepBasic_Document &
	:rtype: None
") ReadStep;
		void ReadStep (const Handle_StepData_StepReaderData & data,const Standard_Integer num,Handle_Interface_Check & ach,const Handle_StepBasic_Document & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	* Writes Document

	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: Handle_StepBasic_Document &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const Handle_StepBasic_Document & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	* Fills data for graph (shared items)

	:param ent:
	:type ent: Handle_StepBasic_Document &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const Handle_StepBasic_Document & ent,Interface_EntityIterator & iter);
};


%extend RWStepBasic_RWDocument {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepBasic_RWDocumentFile;
class RWStepBasic_RWDocumentFile {
	public:
		%feature("compactdefaultargs") RWStepBasic_RWDocumentFile;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") RWStepBasic_RWDocumentFile;
		 RWStepBasic_RWDocumentFile ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	* Reads DocumentFile

	:param data:
	:type data: Handle_StepData_StepReaderData &
	:param num:
	:type num: int
	:param ach:
	:type ach: Handle_Interface_Check &
	:param ent:
	:type ent: Handle_StepBasic_DocumentFile &
	:rtype: None
") ReadStep;
		void ReadStep (const Handle_StepData_StepReaderData & data,const Standard_Integer num,Handle_Interface_Check & ach,const Handle_StepBasic_DocumentFile & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	* Writes DocumentFile

	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: Handle_StepBasic_DocumentFile &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const Handle_StepBasic_DocumentFile & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	* Fills data for graph (shared items)

	:param ent:
	:type ent: Handle_StepBasic_DocumentFile &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const Handle_StepBasic_DocumentFile & ent,Interface_EntityIterator & iter);
};


%extend RWStepBasic_RWDocumentFile {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepBasic_RWDocumentProductAssociation;
class RWStepBasic_RWDocumentProductAssociation {
	public:
		%feature("compactdefaultargs") RWStepBasic_RWDocumentProductAssociation;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") RWStepBasic_RWDocumentProductAssociation;
		 RWStepBasic_RWDocumentProductAssociation ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	* Reads DocumentProductAssociation

	:param data:
	:type data: Handle_StepData_StepReaderData &
	:param num:
	:type num: int
	:param ach:
	:type ach: Handle_Interface_Check &
	:param ent:
	:type ent: Handle_StepBasic_DocumentProductAssociation &
	:rtype: None
") ReadStep;
		void ReadStep (const Handle_StepData_StepReaderData & data,const Standard_Integer num,Handle_Interface_Check & ach,const Handle_StepBasic_DocumentProductAssociation & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	* Writes DocumentProductAssociation

	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: Handle_StepBasic_DocumentProductAssociation &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const Handle_StepBasic_DocumentProductAssociation & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	* Fills data for graph (shared items)

	:param ent:
	:type ent: Handle_StepBasic_DocumentProductAssociation &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const Handle_StepBasic_DocumentProductAssociation & ent,Interface_EntityIterator & iter);
};


%extend RWStepBasic_RWDocumentProductAssociation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepBasic_RWDocumentProductEquivalence;
class RWStepBasic_RWDocumentProductEquivalence {
	public:
		%feature("compactdefaultargs") RWStepBasic_RWDocumentProductEquivalence;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") RWStepBasic_RWDocumentProductEquivalence;
		 RWStepBasic_RWDocumentProductEquivalence ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	* Reads DocumentProductEquivalence

	:param data:
	:type data: Handle_StepData_StepReaderData &
	:param num:
	:type num: int
	:param ach:
	:type ach: Handle_Interface_Check &
	:param ent:
	:type ent: Handle_StepBasic_DocumentProductEquivalence &
	:rtype: None
") ReadStep;
		void ReadStep (const Handle_StepData_StepReaderData & data,const Standard_Integer num,Handle_Interface_Check & ach,const Handle_StepBasic_DocumentProductEquivalence & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	* Writes DocumentProductEquivalence

	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: Handle_StepBasic_DocumentProductEquivalence &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const Handle_StepBasic_DocumentProductEquivalence & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	* Fills data for graph (shared items)

	:param ent:
	:type ent: Handle_StepBasic_DocumentProductEquivalence &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const Handle_StepBasic_DocumentProductEquivalence & ent,Interface_EntityIterator & iter);
};


%extend RWStepBasic_RWDocumentProductEquivalence {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepBasic_RWDocumentRelationship;
class RWStepBasic_RWDocumentRelationship {
	public:
		%feature("compactdefaultargs") RWStepBasic_RWDocumentRelationship;
		%feature("autodoc", "	:rtype: None
") RWStepBasic_RWDocumentRelationship;
		 RWStepBasic_RWDocumentRelationship ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	:param data:
	:type data: Handle_StepData_StepReaderData &
	:param num:
	:type num: int
	:param ach:
	:type ach: Handle_Interface_Check &
	:param ent:
	:type ent: Handle_StepBasic_DocumentRelationship &
	:rtype: None
") ReadStep;
		void ReadStep (const Handle_StepData_StepReaderData & data,const Standard_Integer num,Handle_Interface_Check & ach,const Handle_StepBasic_DocumentRelationship & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: Handle_StepBasic_DocumentRelationship &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const Handle_StepBasic_DocumentRelationship & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	:param ent:
	:type ent: Handle_StepBasic_DocumentRelationship &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const Handle_StepBasic_DocumentRelationship & ent,Interface_EntityIterator & iter);
};


%extend RWStepBasic_RWDocumentRelationship {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepBasic_RWDocumentRepresentationType;
class RWStepBasic_RWDocumentRepresentationType {
	public:
		%feature("compactdefaultargs") RWStepBasic_RWDocumentRepresentationType;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") RWStepBasic_RWDocumentRepresentationType;
		 RWStepBasic_RWDocumentRepresentationType ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	* Reads DocumentRepresentationType

	:param data:
	:type data: Handle_StepData_StepReaderData &
	:param num:
	:type num: int
	:param ach:
	:type ach: Handle_Interface_Check &
	:param ent:
	:type ent: Handle_StepBasic_DocumentRepresentationType &
	:rtype: None
") ReadStep;
		void ReadStep (const Handle_StepData_StepReaderData & data,const Standard_Integer num,Handle_Interface_Check & ach,const Handle_StepBasic_DocumentRepresentationType & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	* Writes DocumentRepresentationType

	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: Handle_StepBasic_DocumentRepresentationType &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const Handle_StepBasic_DocumentRepresentationType & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	* Fills data for graph (shared items)

	:param ent:
	:type ent: Handle_StepBasic_DocumentRepresentationType &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const Handle_StepBasic_DocumentRepresentationType & ent,Interface_EntityIterator & iter);
};


%extend RWStepBasic_RWDocumentRepresentationType {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepBasic_RWDocumentType;
class RWStepBasic_RWDocumentType {
	public:
		%feature("compactdefaultargs") RWStepBasic_RWDocumentType;
		%feature("autodoc", "	:rtype: None
") RWStepBasic_RWDocumentType;
		 RWStepBasic_RWDocumentType ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	:param data:
	:type data: Handle_StepData_StepReaderData &
	:param num:
	:type num: int
	:param ach:
	:type ach: Handle_Interface_Check &
	:param ent:
	:type ent: Handle_StepBasic_DocumentType &
	:rtype: None
") ReadStep;
		void ReadStep (const Handle_StepData_StepReaderData & data,const Standard_Integer num,Handle_Interface_Check & ach,const Handle_StepBasic_DocumentType & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: Handle_StepBasic_DocumentType &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const Handle_StepBasic_DocumentType & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	:param ent:
	:type ent: Handle_StepBasic_DocumentType &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const Handle_StepBasic_DocumentType & ent,Interface_EntityIterator & iter);
};


%extend RWStepBasic_RWDocumentType {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepBasic_RWDocumentUsageConstraint;
class RWStepBasic_RWDocumentUsageConstraint {
	public:
		%feature("compactdefaultargs") RWStepBasic_RWDocumentUsageConstraint;
		%feature("autodoc", "	:rtype: None
") RWStepBasic_RWDocumentUsageConstraint;
		 RWStepBasic_RWDocumentUsageConstraint ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	:param data:
	:type data: Handle_StepData_StepReaderData &
	:param num:
	:type num: int
	:param ach:
	:type ach: Handle_Interface_Check &
	:param ent:
	:type ent: Handle_StepBasic_DocumentUsageConstraint &
	:rtype: None
") ReadStep;
		void ReadStep (const Handle_StepData_StepReaderData & data,const Standard_Integer num,Handle_Interface_Check & ach,const Handle_StepBasic_DocumentUsageConstraint & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: Handle_StepBasic_DocumentUsageConstraint &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const Handle_StepBasic_DocumentUsageConstraint & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	:param ent:
	:type ent: Handle_StepBasic_DocumentUsageConstraint &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const Handle_StepBasic_DocumentUsageConstraint & ent,Interface_EntityIterator & iter);
};


%extend RWStepBasic_RWDocumentUsageConstraint {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepBasic_RWEffectivity;
class RWStepBasic_RWEffectivity {
	public:
		%feature("compactdefaultargs") RWStepBasic_RWEffectivity;
		%feature("autodoc", "	:rtype: None
") RWStepBasic_RWEffectivity;
		 RWStepBasic_RWEffectivity ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	:param data:
	:type data: Handle_StepData_StepReaderData &
	:param num:
	:type num: int
	:param ach:
	:type ach: Handle_Interface_Check &
	:param ent:
	:type ent: Handle_StepBasic_Effectivity &
	:rtype: None
") ReadStep;
		void ReadStep (const Handle_StepData_StepReaderData & data,const Standard_Integer num,Handle_Interface_Check & ach,const Handle_StepBasic_Effectivity & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: Handle_StepBasic_Effectivity &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const Handle_StepBasic_Effectivity & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	:param ent:
	:type ent: Handle_StepBasic_Effectivity &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const Handle_StepBasic_Effectivity & ent,Interface_EntityIterator & iter);
};


%extend RWStepBasic_RWEffectivity {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepBasic_RWEffectivityAssignment;
class RWStepBasic_RWEffectivityAssignment {
	public:
		%feature("compactdefaultargs") RWStepBasic_RWEffectivityAssignment;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") RWStepBasic_RWEffectivityAssignment;
		 RWStepBasic_RWEffectivityAssignment ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	* Reads EffectivityAssignment

	:param data:
	:type data: Handle_StepData_StepReaderData &
	:param num:
	:type num: int
	:param ach:
	:type ach: Handle_Interface_Check &
	:param ent:
	:type ent: Handle_StepBasic_EffectivityAssignment &
	:rtype: None
") ReadStep;
		void ReadStep (const Handle_StepData_StepReaderData & data,const Standard_Integer num,Handle_Interface_Check & ach,const Handle_StepBasic_EffectivityAssignment & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	* Writes EffectivityAssignment

	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: Handle_StepBasic_EffectivityAssignment &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const Handle_StepBasic_EffectivityAssignment & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	* Fills data for graph (shared items)

	:param ent:
	:type ent: Handle_StepBasic_EffectivityAssignment &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const Handle_StepBasic_EffectivityAssignment & ent,Interface_EntityIterator & iter);
};


%extend RWStepBasic_RWEffectivityAssignment {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepBasic_RWEulerAngles;
class RWStepBasic_RWEulerAngles {
	public:
		%feature("compactdefaultargs") RWStepBasic_RWEulerAngles;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") RWStepBasic_RWEulerAngles;
		 RWStepBasic_RWEulerAngles ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	* Reads EulerAngles

	:param data:
	:type data: Handle_StepData_StepReaderData &
	:param num:
	:type num: int
	:param ach:
	:type ach: Handle_Interface_Check &
	:param ent:
	:type ent: Handle_StepBasic_EulerAngles &
	:rtype: None
") ReadStep;
		void ReadStep (const Handle_StepData_StepReaderData & data,const Standard_Integer num,Handle_Interface_Check & ach,const Handle_StepBasic_EulerAngles & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	* Writes EulerAngles

	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: Handle_StepBasic_EulerAngles &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const Handle_StepBasic_EulerAngles & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	* Fills data for graph (shared items)

	:param ent:
	:type ent: Handle_StepBasic_EulerAngles &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const Handle_StepBasic_EulerAngles & ent,Interface_EntityIterator & iter);
};


%extend RWStepBasic_RWEulerAngles {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepBasic_RWExternalIdentificationAssignment;
class RWStepBasic_RWExternalIdentificationAssignment {
	public:
		%feature("compactdefaultargs") RWStepBasic_RWExternalIdentificationAssignment;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") RWStepBasic_RWExternalIdentificationAssignment;
		 RWStepBasic_RWExternalIdentificationAssignment ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	* Reads ExternalIdentificationAssignment

	:param data:
	:type data: Handle_StepData_StepReaderData &
	:param num:
	:type num: int
	:param ach:
	:type ach: Handle_Interface_Check &
	:param ent:
	:type ent: Handle_StepBasic_ExternalIdentificationAssignment &
	:rtype: None
") ReadStep;
		void ReadStep (const Handle_StepData_StepReaderData & data,const Standard_Integer num,Handle_Interface_Check & ach,const Handle_StepBasic_ExternalIdentificationAssignment & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	* Writes ExternalIdentificationAssignment

	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: Handle_StepBasic_ExternalIdentificationAssignment &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const Handle_StepBasic_ExternalIdentificationAssignment & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	* Fills data for graph (shared items)

	:param ent:
	:type ent: Handle_StepBasic_ExternalIdentificationAssignment &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const Handle_StepBasic_ExternalIdentificationAssignment & ent,Interface_EntityIterator & iter);
};


%extend RWStepBasic_RWExternalIdentificationAssignment {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepBasic_RWExternalSource;
class RWStepBasic_RWExternalSource {
	public:
		%feature("compactdefaultargs") RWStepBasic_RWExternalSource;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") RWStepBasic_RWExternalSource;
		 RWStepBasic_RWExternalSource ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	* Reads ExternalSource

	:param data:
	:type data: Handle_StepData_StepReaderData &
	:param num:
	:type num: int
	:param ach:
	:type ach: Handle_Interface_Check &
	:param ent:
	:type ent: Handle_StepBasic_ExternalSource &
	:rtype: None
") ReadStep;
		void ReadStep (const Handle_StepData_StepReaderData & data,const Standard_Integer num,Handle_Interface_Check & ach,const Handle_StepBasic_ExternalSource & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	* Writes ExternalSource

	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: Handle_StepBasic_ExternalSource &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const Handle_StepBasic_ExternalSource & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	* Fills data for graph (shared items)

	:param ent:
	:type ent: Handle_StepBasic_ExternalSource &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const Handle_StepBasic_ExternalSource & ent,Interface_EntityIterator & iter);
};


%extend RWStepBasic_RWExternalSource {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepBasic_RWExternallyDefinedItem;
class RWStepBasic_RWExternallyDefinedItem {
	public:
		%feature("compactdefaultargs") RWStepBasic_RWExternallyDefinedItem;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") RWStepBasic_RWExternallyDefinedItem;
		 RWStepBasic_RWExternallyDefinedItem ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	* Reads ExternallyDefinedItem

	:param data:
	:type data: Handle_StepData_StepReaderData &
	:param num:
	:type num: int
	:param ach:
	:type ach: Handle_Interface_Check &
	:param ent:
	:type ent: Handle_StepBasic_ExternallyDefinedItem &
	:rtype: None
") ReadStep;
		void ReadStep (const Handle_StepData_StepReaderData & data,const Standard_Integer num,Handle_Interface_Check & ach,const Handle_StepBasic_ExternallyDefinedItem & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	* Writes ExternallyDefinedItem

	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: Handle_StepBasic_ExternallyDefinedItem &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const Handle_StepBasic_ExternallyDefinedItem & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	* Fills data for graph (shared items)

	:param ent:
	:type ent: Handle_StepBasic_ExternallyDefinedItem &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const Handle_StepBasic_ExternallyDefinedItem & ent,Interface_EntityIterator & iter);
};


%extend RWStepBasic_RWExternallyDefinedItem {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepBasic_RWGeneralProperty;
class RWStepBasic_RWGeneralProperty {
	public:
		%feature("compactdefaultargs") RWStepBasic_RWGeneralProperty;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") RWStepBasic_RWGeneralProperty;
		 RWStepBasic_RWGeneralProperty ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	* Reads GeneralProperty

	:param data:
	:type data: Handle_StepData_StepReaderData &
	:param num:
	:type num: int
	:param ach:
	:type ach: Handle_Interface_Check &
	:param ent:
	:type ent: Handle_StepBasic_GeneralProperty &
	:rtype: None
") ReadStep;
		void ReadStep (const Handle_StepData_StepReaderData & data,const Standard_Integer num,Handle_Interface_Check & ach,const Handle_StepBasic_GeneralProperty & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	* Writes GeneralProperty

	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: Handle_StepBasic_GeneralProperty &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const Handle_StepBasic_GeneralProperty & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	* Fills data for graph (shared items)

	:param ent:
	:type ent: Handle_StepBasic_GeneralProperty &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const Handle_StepBasic_GeneralProperty & ent,Interface_EntityIterator & iter);
};


%extend RWStepBasic_RWGeneralProperty {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepBasic_RWGroup;
class RWStepBasic_RWGroup {
	public:
		%feature("compactdefaultargs") RWStepBasic_RWGroup;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") RWStepBasic_RWGroup;
		 RWStepBasic_RWGroup ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	* Reads Group

	:param data:
	:type data: Handle_StepData_StepReaderData &
	:param num:
	:type num: int
	:param ach:
	:type ach: Handle_Interface_Check &
	:param ent:
	:type ent: Handle_StepBasic_Group &
	:rtype: None
") ReadStep;
		void ReadStep (const Handle_StepData_StepReaderData & data,const Standard_Integer num,Handle_Interface_Check & ach,const Handle_StepBasic_Group & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	* Writes Group

	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: Handle_StepBasic_Group &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const Handle_StepBasic_Group & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	* Fills data for graph (shared items)

	:param ent:
	:type ent: Handle_StepBasic_Group &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const Handle_StepBasic_Group & ent,Interface_EntityIterator & iter);
};


%extend RWStepBasic_RWGroup {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepBasic_RWGroupAssignment;
class RWStepBasic_RWGroupAssignment {
	public:
		%feature("compactdefaultargs") RWStepBasic_RWGroupAssignment;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") RWStepBasic_RWGroupAssignment;
		 RWStepBasic_RWGroupAssignment ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	* Reads GroupAssignment

	:param data:
	:type data: Handle_StepData_StepReaderData &
	:param num:
	:type num: int
	:param ach:
	:type ach: Handle_Interface_Check &
	:param ent:
	:type ent: Handle_StepBasic_GroupAssignment &
	:rtype: None
") ReadStep;
		void ReadStep (const Handle_StepData_StepReaderData & data,const Standard_Integer num,Handle_Interface_Check & ach,const Handle_StepBasic_GroupAssignment & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	* Writes GroupAssignment

	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: Handle_StepBasic_GroupAssignment &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const Handle_StepBasic_GroupAssignment & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	* Fills data for graph (shared items)

	:param ent:
	:type ent: Handle_StepBasic_GroupAssignment &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const Handle_StepBasic_GroupAssignment & ent,Interface_EntityIterator & iter);
};


%extend RWStepBasic_RWGroupAssignment {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepBasic_RWGroupRelationship;
class RWStepBasic_RWGroupRelationship {
	public:
		%feature("compactdefaultargs") RWStepBasic_RWGroupRelationship;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") RWStepBasic_RWGroupRelationship;
		 RWStepBasic_RWGroupRelationship ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	* Reads GroupRelationship

	:param data:
	:type data: Handle_StepData_StepReaderData &
	:param num:
	:type num: int
	:param ach:
	:type ach: Handle_Interface_Check &
	:param ent:
	:type ent: Handle_StepBasic_GroupRelationship &
	:rtype: None
") ReadStep;
		void ReadStep (const Handle_StepData_StepReaderData & data,const Standard_Integer num,Handle_Interface_Check & ach,const Handle_StepBasic_GroupRelationship & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	* Writes GroupRelationship

	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: Handle_StepBasic_GroupRelationship &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const Handle_StepBasic_GroupRelationship & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	* Fills data for graph (shared items)

	:param ent:
	:type ent: Handle_StepBasic_GroupRelationship &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const Handle_StepBasic_GroupRelationship & ent,Interface_EntityIterator & iter);
};


%extend RWStepBasic_RWGroupRelationship {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepBasic_RWIdentificationAssignment;
class RWStepBasic_RWIdentificationAssignment {
	public:
		%feature("compactdefaultargs") RWStepBasic_RWIdentificationAssignment;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") RWStepBasic_RWIdentificationAssignment;
		 RWStepBasic_RWIdentificationAssignment ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	* Reads IdentificationAssignment

	:param data:
	:type data: Handle_StepData_StepReaderData &
	:param num:
	:type num: int
	:param ach:
	:type ach: Handle_Interface_Check &
	:param ent:
	:type ent: Handle_StepBasic_IdentificationAssignment &
	:rtype: None
") ReadStep;
		void ReadStep (const Handle_StepData_StepReaderData & data,const Standard_Integer num,Handle_Interface_Check & ach,const Handle_StepBasic_IdentificationAssignment & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	* Writes IdentificationAssignment

	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: Handle_StepBasic_IdentificationAssignment &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const Handle_StepBasic_IdentificationAssignment & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	* Fills data for graph (shared items)

	:param ent:
	:type ent: Handle_StepBasic_IdentificationAssignment &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const Handle_StepBasic_IdentificationAssignment & ent,Interface_EntityIterator & iter);
};


%extend RWStepBasic_RWIdentificationAssignment {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepBasic_RWIdentificationRole;
class RWStepBasic_RWIdentificationRole {
	public:
		%feature("compactdefaultargs") RWStepBasic_RWIdentificationRole;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") RWStepBasic_RWIdentificationRole;
		 RWStepBasic_RWIdentificationRole ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	* Reads IdentificationRole

	:param data:
	:type data: Handle_StepData_StepReaderData &
	:param num:
	:type num: int
	:param ach:
	:type ach: Handle_Interface_Check &
	:param ent:
	:type ent: Handle_StepBasic_IdentificationRole &
	:rtype: None
") ReadStep;
		void ReadStep (const Handle_StepData_StepReaderData & data,const Standard_Integer num,Handle_Interface_Check & ach,const Handle_StepBasic_IdentificationRole & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	* Writes IdentificationRole

	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: Handle_StepBasic_IdentificationRole &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const Handle_StepBasic_IdentificationRole & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	* Fills data for graph (shared items)

	:param ent:
	:type ent: Handle_StepBasic_IdentificationRole &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const Handle_StepBasic_IdentificationRole & ent,Interface_EntityIterator & iter);
};


%extend RWStepBasic_RWIdentificationRole {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepBasic_RWLengthMeasureWithUnit;
class RWStepBasic_RWLengthMeasureWithUnit {
	public:
		%feature("compactdefaultargs") RWStepBasic_RWLengthMeasureWithUnit;
		%feature("autodoc", "	:rtype: None
") RWStepBasic_RWLengthMeasureWithUnit;
		 RWStepBasic_RWLengthMeasureWithUnit ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	:param data:
	:type data: Handle_StepData_StepReaderData &
	:param num:
	:type num: int
	:param ach:
	:type ach: Handle_Interface_Check &
	:param ent:
	:type ent: Handle_StepBasic_LengthMeasureWithUnit &
	:rtype: None
") ReadStep;
		void ReadStep (const Handle_StepData_StepReaderData & data,const Standard_Integer num,Handle_Interface_Check & ach,const Handle_StepBasic_LengthMeasureWithUnit & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: Handle_StepBasic_LengthMeasureWithUnit &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const Handle_StepBasic_LengthMeasureWithUnit & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	:param ent:
	:type ent: Handle_StepBasic_LengthMeasureWithUnit &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const Handle_StepBasic_LengthMeasureWithUnit & ent,Interface_EntityIterator & iter);
};


%extend RWStepBasic_RWLengthMeasureWithUnit {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepBasic_RWLengthUnit;
class RWStepBasic_RWLengthUnit {
	public:
		%feature("compactdefaultargs") RWStepBasic_RWLengthUnit;
		%feature("autodoc", "	:rtype: None
") RWStepBasic_RWLengthUnit;
		 RWStepBasic_RWLengthUnit ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	:param data:
	:type data: Handle_StepData_StepReaderData &
	:param num:
	:type num: int
	:param ach:
	:type ach: Handle_Interface_Check &
	:param ent:
	:type ent: Handle_StepBasic_LengthUnit &
	:rtype: None
") ReadStep;
		void ReadStep (const Handle_StepData_StepReaderData & data,const Standard_Integer num,Handle_Interface_Check & ach,const Handle_StepBasic_LengthUnit & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: Handle_StepBasic_LengthUnit &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const Handle_StepBasic_LengthUnit & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	:param ent:
	:type ent: Handle_StepBasic_LengthUnit &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const Handle_StepBasic_LengthUnit & ent,Interface_EntityIterator & iter);
};


%extend RWStepBasic_RWLengthUnit {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepBasic_RWLocalTime;
class RWStepBasic_RWLocalTime {
	public:
		%feature("compactdefaultargs") RWStepBasic_RWLocalTime;
		%feature("autodoc", "	:rtype: None
") RWStepBasic_RWLocalTime;
		 RWStepBasic_RWLocalTime ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	:param data:
	:type data: Handle_StepData_StepReaderData &
	:param num:
	:type num: int
	:param ach:
	:type ach: Handle_Interface_Check &
	:param ent:
	:type ent: Handle_StepBasic_LocalTime &
	:rtype: None
") ReadStep;
		void ReadStep (const Handle_StepData_StepReaderData & data,const Standard_Integer num,Handle_Interface_Check & ach,const Handle_StepBasic_LocalTime & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: Handle_StepBasic_LocalTime &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const Handle_StepBasic_LocalTime & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	:param ent:
	:type ent: Handle_StepBasic_LocalTime &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const Handle_StepBasic_LocalTime & ent,Interface_EntityIterator & iter);
};


%extend RWStepBasic_RWLocalTime {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepBasic_RWMassMeasureWithUnit;
class RWStepBasic_RWMassMeasureWithUnit {
	public:
		%feature("compactdefaultargs") RWStepBasic_RWMassMeasureWithUnit;
		%feature("autodoc", "	:rtype: None
") RWStepBasic_RWMassMeasureWithUnit;
		 RWStepBasic_RWMassMeasureWithUnit ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	:param data:
	:type data: Handle_StepData_StepReaderData &
	:param num:
	:type num: int
	:param ach:
	:type ach: Handle_Interface_Check &
	:param ent:
	:type ent: Handle_StepBasic_MassMeasureWithUnit &
	:rtype: None
") ReadStep;
		void ReadStep (const Handle_StepData_StepReaderData & data,const Standard_Integer num,Handle_Interface_Check & ach,const Handle_StepBasic_MassMeasureWithUnit & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: Handle_StepBasic_MassMeasureWithUnit &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const Handle_StepBasic_MassMeasureWithUnit & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	:param ent:
	:type ent: Handle_StepBasic_MassMeasureWithUnit &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const Handle_StepBasic_MassMeasureWithUnit & ent,Interface_EntityIterator & iter);
};


%extend RWStepBasic_RWMassMeasureWithUnit {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepBasic_RWMassUnit;
class RWStepBasic_RWMassUnit {
	public:
		%feature("compactdefaultargs") RWStepBasic_RWMassUnit;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") RWStepBasic_RWMassUnit;
		 RWStepBasic_RWMassUnit ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	* Reads MassUnit

	:param data:
	:type data: Handle_StepData_StepReaderData &
	:param num:
	:type num: int
	:param ach:
	:type ach: Handle_Interface_Check &
	:param ent:
	:type ent: Handle_StepBasic_MassUnit &
	:rtype: None
") ReadStep;
		void ReadStep (const Handle_StepData_StepReaderData & data,const Standard_Integer num,Handle_Interface_Check & ach,const Handle_StepBasic_MassUnit & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	* Writes MassUnit

	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: Handle_StepBasic_MassUnit &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const Handle_StepBasic_MassUnit & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	* Fills data for graph (shared items)

	:param ent:
	:type ent: Handle_StepBasic_MassUnit &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const Handle_StepBasic_MassUnit & ent,Interface_EntityIterator & iter);
};


%extend RWStepBasic_RWMassUnit {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepBasic_RWMeasureWithUnit;
class RWStepBasic_RWMeasureWithUnit {
	public:
		%feature("compactdefaultargs") RWStepBasic_RWMeasureWithUnit;
		%feature("autodoc", "	:rtype: None
") RWStepBasic_RWMeasureWithUnit;
		 RWStepBasic_RWMeasureWithUnit ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	:param data:
	:type data: Handle_StepData_StepReaderData &
	:param num:
	:type num: int
	:param ach:
	:type ach: Handle_Interface_Check &
	:param ent:
	:type ent: Handle_StepBasic_MeasureWithUnit &
	:rtype: None
") ReadStep;
		void ReadStep (const Handle_StepData_StepReaderData & data,const Standard_Integer num,Handle_Interface_Check & ach,const Handle_StepBasic_MeasureWithUnit & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: Handle_StepBasic_MeasureWithUnit &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const Handle_StepBasic_MeasureWithUnit & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	:param ent:
	:type ent: Handle_StepBasic_MeasureWithUnit &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const Handle_StepBasic_MeasureWithUnit & ent,Interface_EntityIterator & iter);
};


%extend RWStepBasic_RWMeasureWithUnit {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepBasic_RWMechanicalContext;
class RWStepBasic_RWMechanicalContext {
	public:
		%feature("compactdefaultargs") RWStepBasic_RWMechanicalContext;
		%feature("autodoc", "	:rtype: None
") RWStepBasic_RWMechanicalContext;
		 RWStepBasic_RWMechanicalContext ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	:param data:
	:type data: Handle_StepData_StepReaderData &
	:param num:
	:type num: int
	:param ach:
	:type ach: Handle_Interface_Check &
	:param ent:
	:type ent: Handle_StepBasic_MechanicalContext &
	:rtype: None
") ReadStep;
		void ReadStep (const Handle_StepData_StepReaderData & data,const Standard_Integer num,Handle_Interface_Check & ach,const Handle_StepBasic_MechanicalContext & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: Handle_StepBasic_MechanicalContext &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const Handle_StepBasic_MechanicalContext & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	:param ent:
	:type ent: Handle_StepBasic_MechanicalContext &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const Handle_StepBasic_MechanicalContext & ent,Interface_EntityIterator & iter);
};


%extend RWStepBasic_RWMechanicalContext {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepBasic_RWNameAssignment;
class RWStepBasic_RWNameAssignment {
	public:
		%feature("compactdefaultargs") RWStepBasic_RWNameAssignment;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") RWStepBasic_RWNameAssignment;
		 RWStepBasic_RWNameAssignment ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	* Reads NameAssignment

	:param data:
	:type data: Handle_StepData_StepReaderData &
	:param num:
	:type num: int
	:param ach:
	:type ach: Handle_Interface_Check &
	:param ent:
	:type ent: Handle_StepBasic_NameAssignment &
	:rtype: None
") ReadStep;
		void ReadStep (const Handle_StepData_StepReaderData & data,const Standard_Integer num,Handle_Interface_Check & ach,const Handle_StepBasic_NameAssignment & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	* Writes NameAssignment

	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: Handle_StepBasic_NameAssignment &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const Handle_StepBasic_NameAssignment & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	* Fills data for graph (shared items)

	:param ent:
	:type ent: Handle_StepBasic_NameAssignment &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const Handle_StepBasic_NameAssignment & ent,Interface_EntityIterator & iter);
};


%extend RWStepBasic_RWNameAssignment {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepBasic_RWNamedUnit;
class RWStepBasic_RWNamedUnit {
	public:
		%feature("compactdefaultargs") RWStepBasic_RWNamedUnit;
		%feature("autodoc", "	:rtype: None
") RWStepBasic_RWNamedUnit;
		 RWStepBasic_RWNamedUnit ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	:param data:
	:type data: Handle_StepData_StepReaderData &
	:param num:
	:type num: int
	:param ach:
	:type ach: Handle_Interface_Check &
	:param ent:
	:type ent: Handle_StepBasic_NamedUnit &
	:rtype: None
") ReadStep;
		void ReadStep (const Handle_StepData_StepReaderData & data,const Standard_Integer num,Handle_Interface_Check & ach,const Handle_StepBasic_NamedUnit & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: Handle_StepBasic_NamedUnit &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const Handle_StepBasic_NamedUnit & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	:param ent:
	:type ent: Handle_StepBasic_NamedUnit &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const Handle_StepBasic_NamedUnit & ent,Interface_EntityIterator & iter);
};


%extend RWStepBasic_RWNamedUnit {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepBasic_RWObjectRole;
class RWStepBasic_RWObjectRole {
	public:
		%feature("compactdefaultargs") RWStepBasic_RWObjectRole;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") RWStepBasic_RWObjectRole;
		 RWStepBasic_RWObjectRole ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	* Reads ObjectRole

	:param data:
	:type data: Handle_StepData_StepReaderData &
	:param num:
	:type num: int
	:param ach:
	:type ach: Handle_Interface_Check &
	:param ent:
	:type ent: Handle_StepBasic_ObjectRole &
	:rtype: None
") ReadStep;
		void ReadStep (const Handle_StepData_StepReaderData & data,const Standard_Integer num,Handle_Interface_Check & ach,const Handle_StepBasic_ObjectRole & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	* Writes ObjectRole

	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: Handle_StepBasic_ObjectRole &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const Handle_StepBasic_ObjectRole & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	* Fills data for graph (shared items)

	:param ent:
	:type ent: Handle_StepBasic_ObjectRole &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const Handle_StepBasic_ObjectRole & ent,Interface_EntityIterator & iter);
};


%extend RWStepBasic_RWObjectRole {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepBasic_RWOrdinalDate;
class RWStepBasic_RWOrdinalDate {
	public:
		%feature("compactdefaultargs") RWStepBasic_RWOrdinalDate;
		%feature("autodoc", "	:rtype: None
") RWStepBasic_RWOrdinalDate;
		 RWStepBasic_RWOrdinalDate ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	:param data:
	:type data: Handle_StepData_StepReaderData &
	:param num:
	:type num: int
	:param ach:
	:type ach: Handle_Interface_Check &
	:param ent:
	:type ent: Handle_StepBasic_OrdinalDate &
	:rtype: None
") ReadStep;
		void ReadStep (const Handle_StepData_StepReaderData & data,const Standard_Integer num,Handle_Interface_Check & ach,const Handle_StepBasic_OrdinalDate & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: Handle_StepBasic_OrdinalDate &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const Handle_StepBasic_OrdinalDate & ent);
};


%extend RWStepBasic_RWOrdinalDate {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepBasic_RWOrganization;
class RWStepBasic_RWOrganization {
	public:
		%feature("compactdefaultargs") RWStepBasic_RWOrganization;
		%feature("autodoc", "	:rtype: None
") RWStepBasic_RWOrganization;
		 RWStepBasic_RWOrganization ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	:param data:
	:type data: Handle_StepData_StepReaderData &
	:param num:
	:type num: int
	:param ach:
	:type ach: Handle_Interface_Check &
	:param ent:
	:type ent: Handle_StepBasic_Organization &
	:rtype: None
") ReadStep;
		void ReadStep (const Handle_StepData_StepReaderData & data,const Standard_Integer num,Handle_Interface_Check & ach,const Handle_StepBasic_Organization & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: Handle_StepBasic_Organization &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const Handle_StepBasic_Organization & ent);
};


%extend RWStepBasic_RWOrganization {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepBasic_RWOrganizationRole;
class RWStepBasic_RWOrganizationRole {
	public:
		%feature("compactdefaultargs") RWStepBasic_RWOrganizationRole;
		%feature("autodoc", "	:rtype: None
") RWStepBasic_RWOrganizationRole;
		 RWStepBasic_RWOrganizationRole ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	:param data:
	:type data: Handle_StepData_StepReaderData &
	:param num:
	:type num: int
	:param ach:
	:type ach: Handle_Interface_Check &
	:param ent:
	:type ent: Handle_StepBasic_OrganizationRole &
	:rtype: None
") ReadStep;
		void ReadStep (const Handle_StepData_StepReaderData & data,const Standard_Integer num,Handle_Interface_Check & ach,const Handle_StepBasic_OrganizationRole & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: Handle_StepBasic_OrganizationRole &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const Handle_StepBasic_OrganizationRole & ent);
};


%extend RWStepBasic_RWOrganizationRole {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepBasic_RWOrganizationalAddress;
class RWStepBasic_RWOrganizationalAddress {
	public:
		%feature("compactdefaultargs") RWStepBasic_RWOrganizationalAddress;
		%feature("autodoc", "	:rtype: None
") RWStepBasic_RWOrganizationalAddress;
		 RWStepBasic_RWOrganizationalAddress ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	:param data:
	:type data: Handle_StepData_StepReaderData &
	:param num:
	:type num: int
	:param ach:
	:type ach: Handle_Interface_Check &
	:param ent:
	:type ent: Handle_StepBasic_OrganizationalAddress &
	:rtype: None
") ReadStep;
		void ReadStep (const Handle_StepData_StepReaderData & data,const Standard_Integer num,Handle_Interface_Check & ach,const Handle_StepBasic_OrganizationalAddress & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: Handle_StepBasic_OrganizationalAddress &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const Handle_StepBasic_OrganizationalAddress & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	:param ent:
	:type ent: Handle_StepBasic_OrganizationalAddress &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const Handle_StepBasic_OrganizationalAddress & ent,Interface_EntityIterator & iter);
};


%extend RWStepBasic_RWOrganizationalAddress {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepBasic_RWPerson;
class RWStepBasic_RWPerson {
	public:
		%feature("compactdefaultargs") RWStepBasic_RWPerson;
		%feature("autodoc", "	:rtype: None
") RWStepBasic_RWPerson;
		 RWStepBasic_RWPerson ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	:param data:
	:type data: Handle_StepData_StepReaderData &
	:param num:
	:type num: int
	:param ach:
	:type ach: Handle_Interface_Check &
	:param ent:
	:type ent: Handle_StepBasic_Person &
	:rtype: None
") ReadStep;
		void ReadStep (const Handle_StepData_StepReaderData & data,const Standard_Integer num,Handle_Interface_Check & ach,const Handle_StepBasic_Person & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: Handle_StepBasic_Person &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const Handle_StepBasic_Person & ent);
};


%extend RWStepBasic_RWPerson {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepBasic_RWPersonAndOrganization;
class RWStepBasic_RWPersonAndOrganization {
	public:
		%feature("compactdefaultargs") RWStepBasic_RWPersonAndOrganization;
		%feature("autodoc", "	:rtype: None
") RWStepBasic_RWPersonAndOrganization;
		 RWStepBasic_RWPersonAndOrganization ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	:param data:
	:type data: Handle_StepData_StepReaderData &
	:param num:
	:type num: int
	:param ach:
	:type ach: Handle_Interface_Check &
	:param ent:
	:type ent: Handle_StepBasic_PersonAndOrganization &
	:rtype: None
") ReadStep;
		void ReadStep (const Handle_StepData_StepReaderData & data,const Standard_Integer num,Handle_Interface_Check & ach,const Handle_StepBasic_PersonAndOrganization & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: Handle_StepBasic_PersonAndOrganization &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const Handle_StepBasic_PersonAndOrganization & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	:param ent:
	:type ent: Handle_StepBasic_PersonAndOrganization &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const Handle_StepBasic_PersonAndOrganization & ent,Interface_EntityIterator & iter);
};


%extend RWStepBasic_RWPersonAndOrganization {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepBasic_RWPersonAndOrganizationRole;
class RWStepBasic_RWPersonAndOrganizationRole {
	public:
		%feature("compactdefaultargs") RWStepBasic_RWPersonAndOrganizationRole;
		%feature("autodoc", "	:rtype: None
") RWStepBasic_RWPersonAndOrganizationRole;
		 RWStepBasic_RWPersonAndOrganizationRole ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	:param data:
	:type data: Handle_StepData_StepReaderData &
	:param num:
	:type num: int
	:param ach:
	:type ach: Handle_Interface_Check &
	:param ent:
	:type ent: Handle_StepBasic_PersonAndOrganizationRole &
	:rtype: None
") ReadStep;
		void ReadStep (const Handle_StepData_StepReaderData & data,const Standard_Integer num,Handle_Interface_Check & ach,const Handle_StepBasic_PersonAndOrganizationRole & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: Handle_StepBasic_PersonAndOrganizationRole &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const Handle_StepBasic_PersonAndOrganizationRole & ent);
};


%extend RWStepBasic_RWPersonAndOrganizationRole {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepBasic_RWPersonalAddress;
class RWStepBasic_RWPersonalAddress {
	public:
		%feature("compactdefaultargs") RWStepBasic_RWPersonalAddress;
		%feature("autodoc", "	:rtype: None
") RWStepBasic_RWPersonalAddress;
		 RWStepBasic_RWPersonalAddress ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	:param data:
	:type data: Handle_StepData_StepReaderData &
	:param num:
	:type num: int
	:param ach:
	:type ach: Handle_Interface_Check &
	:param ent:
	:type ent: Handle_StepBasic_PersonalAddress &
	:rtype: None
") ReadStep;
		void ReadStep (const Handle_StepData_StepReaderData & data,const Standard_Integer num,Handle_Interface_Check & ach,const Handle_StepBasic_PersonalAddress & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: Handle_StepBasic_PersonalAddress &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const Handle_StepBasic_PersonalAddress & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	:param ent:
	:type ent: Handle_StepBasic_PersonalAddress &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const Handle_StepBasic_PersonalAddress & ent,Interface_EntityIterator & iter);
};


%extend RWStepBasic_RWPersonalAddress {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepBasic_RWPlaneAngleMeasureWithUnit;
class RWStepBasic_RWPlaneAngleMeasureWithUnit {
	public:
		%feature("compactdefaultargs") RWStepBasic_RWPlaneAngleMeasureWithUnit;
		%feature("autodoc", "	:rtype: None
") RWStepBasic_RWPlaneAngleMeasureWithUnit;
		 RWStepBasic_RWPlaneAngleMeasureWithUnit ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	:param data:
	:type data: Handle_StepData_StepReaderData &
	:param num:
	:type num: int
	:param ach:
	:type ach: Handle_Interface_Check &
	:param ent:
	:type ent: Handle_StepBasic_PlaneAngleMeasureWithUnit &
	:rtype: None
") ReadStep;
		void ReadStep (const Handle_StepData_StepReaderData & data,const Standard_Integer num,Handle_Interface_Check & ach,const Handle_StepBasic_PlaneAngleMeasureWithUnit & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: Handle_StepBasic_PlaneAngleMeasureWithUnit &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const Handle_StepBasic_PlaneAngleMeasureWithUnit & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	:param ent:
	:type ent: Handle_StepBasic_PlaneAngleMeasureWithUnit &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const Handle_StepBasic_PlaneAngleMeasureWithUnit & ent,Interface_EntityIterator & iter);
};


%extend RWStepBasic_RWPlaneAngleMeasureWithUnit {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepBasic_RWPlaneAngleUnit;
class RWStepBasic_RWPlaneAngleUnit {
	public:
		%feature("compactdefaultargs") RWStepBasic_RWPlaneAngleUnit;
		%feature("autodoc", "	:rtype: None
") RWStepBasic_RWPlaneAngleUnit;
		 RWStepBasic_RWPlaneAngleUnit ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	:param data:
	:type data: Handle_StepData_StepReaderData &
	:param num:
	:type num: int
	:param ach:
	:type ach: Handle_Interface_Check &
	:param ent:
	:type ent: Handle_StepBasic_PlaneAngleUnit &
	:rtype: None
") ReadStep;
		void ReadStep (const Handle_StepData_StepReaderData & data,const Standard_Integer num,Handle_Interface_Check & ach,const Handle_StepBasic_PlaneAngleUnit & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: Handle_StepBasic_PlaneAngleUnit &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const Handle_StepBasic_PlaneAngleUnit & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	:param ent:
	:type ent: Handle_StepBasic_PlaneAngleUnit &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const Handle_StepBasic_PlaneAngleUnit & ent,Interface_EntityIterator & iter);
};


%extend RWStepBasic_RWPlaneAngleUnit {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepBasic_RWProduct;
class RWStepBasic_RWProduct {
	public:
		%feature("compactdefaultargs") RWStepBasic_RWProduct;
		%feature("autodoc", "	:rtype: None
") RWStepBasic_RWProduct;
		 RWStepBasic_RWProduct ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	:param data:
	:type data: Handle_StepData_StepReaderData &
	:param num:
	:type num: int
	:param ach:
	:type ach: Handle_Interface_Check &
	:param ent:
	:type ent: Handle_StepBasic_Product &
	:rtype: None
") ReadStep;
		void ReadStep (const Handle_StepData_StepReaderData & data,const Standard_Integer num,Handle_Interface_Check & ach,const Handle_StepBasic_Product & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: Handle_StepBasic_Product &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const Handle_StepBasic_Product & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	:param ent:
	:type ent: Handle_StepBasic_Product &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const Handle_StepBasic_Product & ent,Interface_EntityIterator & iter);
};


%extend RWStepBasic_RWProduct {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepBasic_RWProductCategory;
class RWStepBasic_RWProductCategory {
	public:
		%feature("compactdefaultargs") RWStepBasic_RWProductCategory;
		%feature("autodoc", "	:rtype: None
") RWStepBasic_RWProductCategory;
		 RWStepBasic_RWProductCategory ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	:param data:
	:type data: Handle_StepData_StepReaderData &
	:param num:
	:type num: int
	:param ach:
	:type ach: Handle_Interface_Check &
	:param ent:
	:type ent: Handle_StepBasic_ProductCategory &
	:rtype: None
") ReadStep;
		void ReadStep (const Handle_StepData_StepReaderData & data,const Standard_Integer num,Handle_Interface_Check & ach,const Handle_StepBasic_ProductCategory & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: Handle_StepBasic_ProductCategory &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const Handle_StepBasic_ProductCategory & ent);
};


%extend RWStepBasic_RWProductCategory {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepBasic_RWProductCategoryRelationship;
class RWStepBasic_RWProductCategoryRelationship {
	public:
		%feature("compactdefaultargs") RWStepBasic_RWProductCategoryRelationship;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") RWStepBasic_RWProductCategoryRelationship;
		 RWStepBasic_RWProductCategoryRelationship ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	* Reads ProductCategoryRelationship

	:param data:
	:type data: Handle_StepData_StepReaderData &
	:param num:
	:type num: int
	:param ach:
	:type ach: Handle_Interface_Check &
	:param ent:
	:type ent: Handle_StepBasic_ProductCategoryRelationship &
	:rtype: None
") ReadStep;
		void ReadStep (const Handle_StepData_StepReaderData & data,const Standard_Integer num,Handle_Interface_Check & ach,const Handle_StepBasic_ProductCategoryRelationship & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	* Writes ProductCategoryRelationship

	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: Handle_StepBasic_ProductCategoryRelationship &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const Handle_StepBasic_ProductCategoryRelationship & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	* Fills data for graph (shared items)

	:param ent:
	:type ent: Handle_StepBasic_ProductCategoryRelationship &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const Handle_StepBasic_ProductCategoryRelationship & ent,Interface_EntityIterator & iter);
};


%extend RWStepBasic_RWProductCategoryRelationship {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepBasic_RWProductConceptContext;
class RWStepBasic_RWProductConceptContext {
	public:
		%feature("compactdefaultargs") RWStepBasic_RWProductConceptContext;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") RWStepBasic_RWProductConceptContext;
		 RWStepBasic_RWProductConceptContext ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	* Reads ProductConceptContext

	:param data:
	:type data: Handle_StepData_StepReaderData &
	:param num:
	:type num: int
	:param ach:
	:type ach: Handle_Interface_Check &
	:param ent:
	:type ent: Handle_StepBasic_ProductConceptContext &
	:rtype: None
") ReadStep;
		void ReadStep (const Handle_StepData_StepReaderData & data,const Standard_Integer num,Handle_Interface_Check & ach,const Handle_StepBasic_ProductConceptContext & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	* Writes ProductConceptContext

	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: Handle_StepBasic_ProductConceptContext &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const Handle_StepBasic_ProductConceptContext & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	* Fills data for graph (shared items)

	:param ent:
	:type ent: Handle_StepBasic_ProductConceptContext &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const Handle_StepBasic_ProductConceptContext & ent,Interface_EntityIterator & iter);
};


%extend RWStepBasic_RWProductConceptContext {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepBasic_RWProductContext;
class RWStepBasic_RWProductContext {
	public:
		%feature("compactdefaultargs") RWStepBasic_RWProductContext;
		%feature("autodoc", "	:rtype: None
") RWStepBasic_RWProductContext;
		 RWStepBasic_RWProductContext ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	:param data:
	:type data: Handle_StepData_StepReaderData &
	:param num:
	:type num: int
	:param ach:
	:type ach: Handle_Interface_Check &
	:param ent:
	:type ent: Handle_StepBasic_ProductContext &
	:rtype: None
") ReadStep;
		void ReadStep (const Handle_StepData_StepReaderData & data,const Standard_Integer num,Handle_Interface_Check & ach,const Handle_StepBasic_ProductContext & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: Handle_StepBasic_ProductContext &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const Handle_StepBasic_ProductContext & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	:param ent:
	:type ent: Handle_StepBasic_ProductContext &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const Handle_StepBasic_ProductContext & ent,Interface_EntityIterator & iter);
};


%extend RWStepBasic_RWProductContext {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepBasic_RWProductDefinition;
class RWStepBasic_RWProductDefinition {
	public:
		%feature("compactdefaultargs") RWStepBasic_RWProductDefinition;
		%feature("autodoc", "	:rtype: None
") RWStepBasic_RWProductDefinition;
		 RWStepBasic_RWProductDefinition ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	:param data:
	:type data: Handle_StepData_StepReaderData &
	:param num:
	:type num: int
	:param ach:
	:type ach: Handle_Interface_Check &
	:param ent:
	:type ent: Handle_StepBasic_ProductDefinition &
	:rtype: None
") ReadStep;
		void ReadStep (const Handle_StepData_StepReaderData & data,const Standard_Integer num,Handle_Interface_Check & ach,const Handle_StepBasic_ProductDefinition & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: Handle_StepBasic_ProductDefinition &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const Handle_StepBasic_ProductDefinition & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	:param ent:
	:type ent: Handle_StepBasic_ProductDefinition &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const Handle_StepBasic_ProductDefinition & ent,Interface_EntityIterator & iter);
};


%extend RWStepBasic_RWProductDefinition {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepBasic_RWProductDefinitionContext;
class RWStepBasic_RWProductDefinitionContext {
	public:
		%feature("compactdefaultargs") RWStepBasic_RWProductDefinitionContext;
		%feature("autodoc", "	:rtype: None
") RWStepBasic_RWProductDefinitionContext;
		 RWStepBasic_RWProductDefinitionContext ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	:param data:
	:type data: Handle_StepData_StepReaderData &
	:param num:
	:type num: int
	:param ach:
	:type ach: Handle_Interface_Check &
	:param ent:
	:type ent: Handle_StepBasic_ProductDefinitionContext &
	:rtype: None
") ReadStep;
		void ReadStep (const Handle_StepData_StepReaderData & data,const Standard_Integer num,Handle_Interface_Check & ach,const Handle_StepBasic_ProductDefinitionContext & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: Handle_StepBasic_ProductDefinitionContext &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const Handle_StepBasic_ProductDefinitionContext & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	:param ent:
	:type ent: Handle_StepBasic_ProductDefinitionContext &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const Handle_StepBasic_ProductDefinitionContext & ent,Interface_EntityIterator & iter);
};


%extend RWStepBasic_RWProductDefinitionContext {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepBasic_RWProductDefinitionEffectivity;
class RWStepBasic_RWProductDefinitionEffectivity {
	public:
		%feature("compactdefaultargs") RWStepBasic_RWProductDefinitionEffectivity;
		%feature("autodoc", "	:rtype: None
") RWStepBasic_RWProductDefinitionEffectivity;
		 RWStepBasic_RWProductDefinitionEffectivity ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	:param data:
	:type data: Handle_StepData_StepReaderData &
	:param num:
	:type num: int
	:param ach:
	:type ach: Handle_Interface_Check &
	:param ent:
	:type ent: Handle_StepBasic_ProductDefinitionEffectivity &
	:rtype: None
") ReadStep;
		void ReadStep (const Handle_StepData_StepReaderData & data,const Standard_Integer num,Handle_Interface_Check & ach,const Handle_StepBasic_ProductDefinitionEffectivity & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: Handle_StepBasic_ProductDefinitionEffectivity &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const Handle_StepBasic_ProductDefinitionEffectivity & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	:param ent:
	:type ent: Handle_StepBasic_ProductDefinitionEffectivity &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const Handle_StepBasic_ProductDefinitionEffectivity & ent,Interface_EntityIterator & iter);
};


%extend RWStepBasic_RWProductDefinitionEffectivity {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepBasic_RWProductDefinitionFormation;
class RWStepBasic_RWProductDefinitionFormation {
	public:
		%feature("compactdefaultargs") RWStepBasic_RWProductDefinitionFormation;
		%feature("autodoc", "	:rtype: None
") RWStepBasic_RWProductDefinitionFormation;
		 RWStepBasic_RWProductDefinitionFormation ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	:param data:
	:type data: Handle_StepData_StepReaderData &
	:param num:
	:type num: int
	:param ach:
	:type ach: Handle_Interface_Check &
	:param ent:
	:type ent: Handle_StepBasic_ProductDefinitionFormation &
	:rtype: None
") ReadStep;
		void ReadStep (const Handle_StepData_StepReaderData & data,const Standard_Integer num,Handle_Interface_Check & ach,const Handle_StepBasic_ProductDefinitionFormation & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: Handle_StepBasic_ProductDefinitionFormation &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const Handle_StepBasic_ProductDefinitionFormation & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	:param ent:
	:type ent: Handle_StepBasic_ProductDefinitionFormation &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const Handle_StepBasic_ProductDefinitionFormation & ent,Interface_EntityIterator & iter);
};


%extend RWStepBasic_RWProductDefinitionFormation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepBasic_RWProductDefinitionFormationRelationship;
class RWStepBasic_RWProductDefinitionFormationRelationship {
	public:
		%feature("compactdefaultargs") RWStepBasic_RWProductDefinitionFormationRelationship;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") RWStepBasic_RWProductDefinitionFormationRelationship;
		 RWStepBasic_RWProductDefinitionFormationRelationship ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	* Reads ProductDefinitionFormationRelationship

	:param data:
	:type data: Handle_StepData_StepReaderData &
	:param num:
	:type num: int
	:param ach:
	:type ach: Handle_Interface_Check &
	:param ent:
	:type ent: Handle_StepBasic_ProductDefinitionFormationRelationship &
	:rtype: None
") ReadStep;
		void ReadStep (const Handle_StepData_StepReaderData & data,const Standard_Integer num,Handle_Interface_Check & ach,const Handle_StepBasic_ProductDefinitionFormationRelationship & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	* Writes ProductDefinitionFormationRelationship

	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: Handle_StepBasic_ProductDefinitionFormationRelationship &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const Handle_StepBasic_ProductDefinitionFormationRelationship & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	* Fills data for graph (shared items)

	:param ent:
	:type ent: Handle_StepBasic_ProductDefinitionFormationRelationship &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const Handle_StepBasic_ProductDefinitionFormationRelationship & ent,Interface_EntityIterator & iter);
};


%extend RWStepBasic_RWProductDefinitionFormationRelationship {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepBasic_RWProductDefinitionFormationWithSpecifiedSource;
class RWStepBasic_RWProductDefinitionFormationWithSpecifiedSource {
	public:
		%feature("compactdefaultargs") RWStepBasic_RWProductDefinitionFormationWithSpecifiedSource;
		%feature("autodoc", "	:rtype: None
") RWStepBasic_RWProductDefinitionFormationWithSpecifiedSource;
		 RWStepBasic_RWProductDefinitionFormationWithSpecifiedSource ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	:param data:
	:type data: Handle_StepData_StepReaderData &
	:param num:
	:type num: int
	:param ach:
	:type ach: Handle_Interface_Check &
	:param ent:
	:type ent: Handle_StepBasic_ProductDefinitionFormationWithSpecifiedSource &
	:rtype: None
") ReadStep;
		void ReadStep (const Handle_StepData_StepReaderData & data,const Standard_Integer num,Handle_Interface_Check & ach,const Handle_StepBasic_ProductDefinitionFormationWithSpecifiedSource & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: Handle_StepBasic_ProductDefinitionFormationWithSpecifiedSource &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const Handle_StepBasic_ProductDefinitionFormationWithSpecifiedSource & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	:param ent:
	:type ent: Handle_StepBasic_ProductDefinitionFormationWithSpecifiedSource &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const Handle_StepBasic_ProductDefinitionFormationWithSpecifiedSource & ent,Interface_EntityIterator & iter);
};


%extend RWStepBasic_RWProductDefinitionFormationWithSpecifiedSource {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepBasic_RWProductDefinitionRelationship;
class RWStepBasic_RWProductDefinitionRelationship {
	public:
		%feature("compactdefaultargs") RWStepBasic_RWProductDefinitionRelationship;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") RWStepBasic_RWProductDefinitionRelationship;
		 RWStepBasic_RWProductDefinitionRelationship ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	* Reads ProductDefinitionRelationship

	:param data:
	:type data: Handle_StepData_StepReaderData &
	:param num:
	:type num: int
	:param ach:
	:type ach: Handle_Interface_Check &
	:param ent:
	:type ent: Handle_StepBasic_ProductDefinitionRelationship &
	:rtype: None
") ReadStep;
		void ReadStep (const Handle_StepData_StepReaderData & data,const Standard_Integer num,Handle_Interface_Check & ach,const Handle_StepBasic_ProductDefinitionRelationship & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	* Writes ProductDefinitionRelationship

	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: Handle_StepBasic_ProductDefinitionRelationship &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const Handle_StepBasic_ProductDefinitionRelationship & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	* Fills data for graph (shared items)

	:param ent:
	:type ent: Handle_StepBasic_ProductDefinitionRelationship &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const Handle_StepBasic_ProductDefinitionRelationship & ent,Interface_EntityIterator & iter);
};


%extend RWStepBasic_RWProductDefinitionRelationship {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepBasic_RWProductDefinitionWithAssociatedDocuments;
class RWStepBasic_RWProductDefinitionWithAssociatedDocuments {
	public:
		%feature("compactdefaultargs") RWStepBasic_RWProductDefinitionWithAssociatedDocuments;
		%feature("autodoc", "	:rtype: None
") RWStepBasic_RWProductDefinitionWithAssociatedDocuments;
		 RWStepBasic_RWProductDefinitionWithAssociatedDocuments ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	:param data:
	:type data: Handle_StepData_StepReaderData &
	:param num:
	:type num: int
	:param ach:
	:type ach: Handle_Interface_Check &
	:param ent:
	:type ent: Handle_StepBasic_ProductDefinitionWithAssociatedDocuments &
	:rtype: None
") ReadStep;
		void ReadStep (const Handle_StepData_StepReaderData & data,const Standard_Integer num,Handle_Interface_Check & ach,const Handle_StepBasic_ProductDefinitionWithAssociatedDocuments & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: Handle_StepBasic_ProductDefinitionWithAssociatedDocuments &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const Handle_StepBasic_ProductDefinitionWithAssociatedDocuments & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	:param ent:
	:type ent: Handle_StepBasic_ProductDefinitionWithAssociatedDocuments &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const Handle_StepBasic_ProductDefinitionWithAssociatedDocuments & ent,Interface_EntityIterator & iter);
};


%extend RWStepBasic_RWProductDefinitionWithAssociatedDocuments {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepBasic_RWProductRelatedProductCategory;
class RWStepBasic_RWProductRelatedProductCategory {
	public:
		%feature("compactdefaultargs") RWStepBasic_RWProductRelatedProductCategory;
		%feature("autodoc", "	:rtype: None
") RWStepBasic_RWProductRelatedProductCategory;
		 RWStepBasic_RWProductRelatedProductCategory ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	:param data:
	:type data: Handle_StepData_StepReaderData &
	:param num:
	:type num: int
	:param ach:
	:type ach: Handle_Interface_Check &
	:param ent:
	:type ent: Handle_StepBasic_ProductRelatedProductCategory &
	:rtype: None
") ReadStep;
		void ReadStep (const Handle_StepData_StepReaderData & data,const Standard_Integer num,Handle_Interface_Check & ach,const Handle_StepBasic_ProductRelatedProductCategory & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: Handle_StepBasic_ProductRelatedProductCategory &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const Handle_StepBasic_ProductRelatedProductCategory & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	:param ent:
	:type ent: Handle_StepBasic_ProductRelatedProductCategory &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const Handle_StepBasic_ProductRelatedProductCategory & ent,Interface_EntityIterator & iter);
};


%extend RWStepBasic_RWProductRelatedProductCategory {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepBasic_RWProductType;
class RWStepBasic_RWProductType {
	public:
		%feature("compactdefaultargs") RWStepBasic_RWProductType;
		%feature("autodoc", "	:rtype: None
") RWStepBasic_RWProductType;
		 RWStepBasic_RWProductType ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	:param data:
	:type data: Handle_StepData_StepReaderData &
	:param num:
	:type num: int
	:param ach:
	:type ach: Handle_Interface_Check &
	:param ent:
	:type ent: Handle_StepBasic_ProductType &
	:rtype: None
") ReadStep;
		void ReadStep (const Handle_StepData_StepReaderData & data,const Standard_Integer num,Handle_Interface_Check & ach,const Handle_StepBasic_ProductType & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: Handle_StepBasic_ProductType &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const Handle_StepBasic_ProductType & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	:param ent:
	:type ent: Handle_StepBasic_ProductType &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const Handle_StepBasic_ProductType & ent,Interface_EntityIterator & iter);
};


%extend RWStepBasic_RWProductType {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepBasic_RWRatioMeasureWithUnit;
class RWStepBasic_RWRatioMeasureWithUnit {
	public:
		%feature("compactdefaultargs") RWStepBasic_RWRatioMeasureWithUnit;
		%feature("autodoc", "	:rtype: None
") RWStepBasic_RWRatioMeasureWithUnit;
		 RWStepBasic_RWRatioMeasureWithUnit ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	:param data:
	:type data: Handle_StepData_StepReaderData &
	:param num:
	:type num: int
	:param ach:
	:type ach: Handle_Interface_Check &
	:param ent:
	:type ent: Handle_StepBasic_RatioMeasureWithUnit &
	:rtype: None
") ReadStep;
		void ReadStep (const Handle_StepData_StepReaderData & data,const Standard_Integer num,Handle_Interface_Check & ach,const Handle_StepBasic_RatioMeasureWithUnit & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: Handle_StepBasic_RatioMeasureWithUnit &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const Handle_StepBasic_RatioMeasureWithUnit & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	:param ent:
	:type ent: Handle_StepBasic_RatioMeasureWithUnit &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const Handle_StepBasic_RatioMeasureWithUnit & ent,Interface_EntityIterator & iter);
};


%extend RWStepBasic_RWRatioMeasureWithUnit {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepBasic_RWRoleAssociation;
class RWStepBasic_RWRoleAssociation {
	public:
		%feature("compactdefaultargs") RWStepBasic_RWRoleAssociation;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") RWStepBasic_RWRoleAssociation;
		 RWStepBasic_RWRoleAssociation ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	* Reads RoleAssociation

	:param data:
	:type data: Handle_StepData_StepReaderData &
	:param num:
	:type num: int
	:param ach:
	:type ach: Handle_Interface_Check &
	:param ent:
	:type ent: Handle_StepBasic_RoleAssociation &
	:rtype: None
") ReadStep;
		void ReadStep (const Handle_StepData_StepReaderData & data,const Standard_Integer num,Handle_Interface_Check & ach,const Handle_StepBasic_RoleAssociation & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	* Writes RoleAssociation

	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: Handle_StepBasic_RoleAssociation &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const Handle_StepBasic_RoleAssociation & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	* Fills data for graph (shared items)

	:param ent:
	:type ent: Handle_StepBasic_RoleAssociation &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const Handle_StepBasic_RoleAssociation & ent,Interface_EntityIterator & iter);
};


%extend RWStepBasic_RWRoleAssociation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepBasic_RWSecurityClassification;
class RWStepBasic_RWSecurityClassification {
	public:
		%feature("compactdefaultargs") RWStepBasic_RWSecurityClassification;
		%feature("autodoc", "	:rtype: None
") RWStepBasic_RWSecurityClassification;
		 RWStepBasic_RWSecurityClassification ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	:param data:
	:type data: Handle_StepData_StepReaderData &
	:param num:
	:type num: int
	:param ach:
	:type ach: Handle_Interface_Check &
	:param ent:
	:type ent: Handle_StepBasic_SecurityClassification &
	:rtype: None
") ReadStep;
		void ReadStep (const Handle_StepData_StepReaderData & data,const Standard_Integer num,Handle_Interface_Check & ach,const Handle_StepBasic_SecurityClassification & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: Handle_StepBasic_SecurityClassification &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const Handle_StepBasic_SecurityClassification & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	:param ent:
	:type ent: Handle_StepBasic_SecurityClassification &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const Handle_StepBasic_SecurityClassification & ent,Interface_EntityIterator & iter);
};


%extend RWStepBasic_RWSecurityClassification {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepBasic_RWSecurityClassificationLevel;
class RWStepBasic_RWSecurityClassificationLevel {
	public:
		%feature("compactdefaultargs") RWStepBasic_RWSecurityClassificationLevel;
		%feature("autodoc", "	:rtype: None
") RWStepBasic_RWSecurityClassificationLevel;
		 RWStepBasic_RWSecurityClassificationLevel ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	:param data:
	:type data: Handle_StepData_StepReaderData &
	:param num:
	:type num: int
	:param ach:
	:type ach: Handle_Interface_Check &
	:param ent:
	:type ent: Handle_StepBasic_SecurityClassificationLevel &
	:rtype: None
") ReadStep;
		void ReadStep (const Handle_StepData_StepReaderData & data,const Standard_Integer num,Handle_Interface_Check & ach,const Handle_StepBasic_SecurityClassificationLevel & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: Handle_StepBasic_SecurityClassificationLevel &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const Handle_StepBasic_SecurityClassificationLevel & ent);
};


%extend RWStepBasic_RWSecurityClassificationLevel {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepBasic_RWSiUnit;
class RWStepBasic_RWSiUnit {
	public:
		%feature("compactdefaultargs") RWStepBasic_RWSiUnit;
		%feature("autodoc", "	:rtype: None
") RWStepBasic_RWSiUnit;
		 RWStepBasic_RWSiUnit ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	:param data:
	:type data: Handle_StepData_StepReaderData &
	:param num:
	:type num: int
	:param ach:
	:type ach: Handle_Interface_Check &
	:param ent:
	:type ent: Handle_StepBasic_SiUnit &
	:rtype: None
") ReadStep;
		void ReadStep (const Handle_StepData_StepReaderData & data,const Standard_Integer num,Handle_Interface_Check & ach,const Handle_StepBasic_SiUnit & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: Handle_StepBasic_SiUnit &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const Handle_StepBasic_SiUnit & ent);
		%feature("compactdefaultargs") DecodePrefix;
		%feature("autodoc", "	:param aPrefix:
	:type aPrefix: StepBasic_SiPrefix &
	:param text:
	:type text: char *
	:rtype: bool
") DecodePrefix;
		Standard_Boolean DecodePrefix (StepBasic_SiPrefix & aPrefix,const char * text);
		%feature("compactdefaultargs") DecodeName;
		%feature("autodoc", "	:param aName:
	:type aName: StepBasic_SiUnitName &
	:param text:
	:type text: char *
	:rtype: bool
") DecodeName;
		Standard_Boolean DecodeName (StepBasic_SiUnitName & aName,const char * text);
		%feature("compactdefaultargs") EncodePrefix;
		%feature("autodoc", "	:param aPrefix:
	:type aPrefix: StepBasic_SiPrefix
	:rtype: TCollection_AsciiString
") EncodePrefix;
		TCollection_AsciiString EncodePrefix (const StepBasic_SiPrefix aPrefix);
		%feature("compactdefaultargs") EncodeName;
		%feature("autodoc", "	:param aName:
	:type aName: StepBasic_SiUnitName
	:rtype: TCollection_AsciiString
") EncodeName;
		TCollection_AsciiString EncodeName (const StepBasic_SiUnitName aName);
};


%extend RWStepBasic_RWSiUnit {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepBasic_RWSiUnitAndAreaUnit;
class RWStepBasic_RWSiUnitAndAreaUnit {
	public:
		%feature("compactdefaultargs") RWStepBasic_RWSiUnitAndAreaUnit;
		%feature("autodoc", "	:rtype: None
") RWStepBasic_RWSiUnitAndAreaUnit;
		 RWStepBasic_RWSiUnitAndAreaUnit ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	:param data:
	:type data: Handle_StepData_StepReaderData &
	:param num:
	:type num: int
	:param ach:
	:type ach: Handle_Interface_Check &
	:param ent:
	:type ent: Handle_StepBasic_SiUnitAndAreaUnit &
	:rtype: None
") ReadStep;
		void ReadStep (const Handle_StepData_StepReaderData & data,const Standard_Integer num,Handle_Interface_Check & ach,const Handle_StepBasic_SiUnitAndAreaUnit & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: Handle_StepBasic_SiUnitAndAreaUnit &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const Handle_StepBasic_SiUnitAndAreaUnit & ent);
};


%extend RWStepBasic_RWSiUnitAndAreaUnit {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepBasic_RWSiUnitAndLengthUnit;
class RWStepBasic_RWSiUnitAndLengthUnit {
	public:
		%feature("compactdefaultargs") RWStepBasic_RWSiUnitAndLengthUnit;
		%feature("autodoc", "	:rtype: None
") RWStepBasic_RWSiUnitAndLengthUnit;
		 RWStepBasic_RWSiUnitAndLengthUnit ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	:param data:
	:type data: Handle_StepData_StepReaderData &
	:param num:
	:type num: int
	:param ach:
	:type ach: Handle_Interface_Check &
	:param ent:
	:type ent: Handle_StepBasic_SiUnitAndLengthUnit &
	:rtype: None
") ReadStep;
		void ReadStep (const Handle_StepData_StepReaderData & data,const Standard_Integer num,Handle_Interface_Check & ach,const Handle_StepBasic_SiUnitAndLengthUnit & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: Handle_StepBasic_SiUnitAndLengthUnit &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const Handle_StepBasic_SiUnitAndLengthUnit & ent);
};


%extend RWStepBasic_RWSiUnitAndLengthUnit {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepBasic_RWSiUnitAndMassUnit;
class RWStepBasic_RWSiUnitAndMassUnit {
	public:
		%feature("compactdefaultargs") RWStepBasic_RWSiUnitAndMassUnit;
		%feature("autodoc", "	:rtype: None
") RWStepBasic_RWSiUnitAndMassUnit;
		 RWStepBasic_RWSiUnitAndMassUnit ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	:param data:
	:type data: Handle_StepData_StepReaderData &
	:param num:
	:type num: int
	:param ach:
	:type ach: Handle_Interface_Check &
	:param ent:
	:type ent: Handle_StepBasic_SiUnitAndMassUnit &
	:rtype: None
") ReadStep;
		void ReadStep (const Handle_StepData_StepReaderData & data,const Standard_Integer num,Handle_Interface_Check & ach,const Handle_StepBasic_SiUnitAndMassUnit & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: Handle_StepBasic_SiUnitAndMassUnit &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const Handle_StepBasic_SiUnitAndMassUnit & ent);
};


%extend RWStepBasic_RWSiUnitAndMassUnit {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepBasic_RWSiUnitAndPlaneAngleUnit;
class RWStepBasic_RWSiUnitAndPlaneAngleUnit {
	public:
		%feature("compactdefaultargs") RWStepBasic_RWSiUnitAndPlaneAngleUnit;
		%feature("autodoc", "	:rtype: None
") RWStepBasic_RWSiUnitAndPlaneAngleUnit;
		 RWStepBasic_RWSiUnitAndPlaneAngleUnit ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	:param data:
	:type data: Handle_StepData_StepReaderData &
	:param num:
	:type num: int
	:param ach:
	:type ach: Handle_Interface_Check &
	:param ent:
	:type ent: Handle_StepBasic_SiUnitAndPlaneAngleUnit &
	:rtype: None
") ReadStep;
		void ReadStep (const Handle_StepData_StepReaderData & data,const Standard_Integer num,Handle_Interface_Check & ach,const Handle_StepBasic_SiUnitAndPlaneAngleUnit & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: Handle_StepBasic_SiUnitAndPlaneAngleUnit &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const Handle_StepBasic_SiUnitAndPlaneAngleUnit & ent);
};


%extend RWStepBasic_RWSiUnitAndPlaneAngleUnit {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepBasic_RWSiUnitAndRatioUnit;
class RWStepBasic_RWSiUnitAndRatioUnit {
	public:
		%feature("compactdefaultargs") RWStepBasic_RWSiUnitAndRatioUnit;
		%feature("autodoc", "	:rtype: None
") RWStepBasic_RWSiUnitAndRatioUnit;
		 RWStepBasic_RWSiUnitAndRatioUnit ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	:param data:
	:type data: Handle_StepData_StepReaderData &
	:param num:
	:type num: int
	:param ach:
	:type ach: Handle_Interface_Check &
	:param ent:
	:type ent: Handle_StepBasic_SiUnitAndRatioUnit &
	:rtype: None
") ReadStep;
		void ReadStep (const Handle_StepData_StepReaderData & data,const Standard_Integer num,Handle_Interface_Check & ach,const Handle_StepBasic_SiUnitAndRatioUnit & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: Handle_StepBasic_SiUnitAndRatioUnit &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const Handle_StepBasic_SiUnitAndRatioUnit & ent);
};


%extend RWStepBasic_RWSiUnitAndRatioUnit {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepBasic_RWSiUnitAndSolidAngleUnit;
class RWStepBasic_RWSiUnitAndSolidAngleUnit {
	public:
		%feature("compactdefaultargs") RWStepBasic_RWSiUnitAndSolidAngleUnit;
		%feature("autodoc", "	:rtype: None
") RWStepBasic_RWSiUnitAndSolidAngleUnit;
		 RWStepBasic_RWSiUnitAndSolidAngleUnit ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	:param data:
	:type data: Handle_StepData_StepReaderData &
	:param num:
	:type num: int
	:param ach:
	:type ach: Handle_Interface_Check &
	:param ent:
	:type ent: Handle_StepBasic_SiUnitAndSolidAngleUnit &
	:rtype: None
") ReadStep;
		void ReadStep (const Handle_StepData_StepReaderData & data,const Standard_Integer num,Handle_Interface_Check & ach,const Handle_StepBasic_SiUnitAndSolidAngleUnit & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: Handle_StepBasic_SiUnitAndSolidAngleUnit &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const Handle_StepBasic_SiUnitAndSolidAngleUnit & ent);
};


%extend RWStepBasic_RWSiUnitAndSolidAngleUnit {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepBasic_RWSiUnitAndThermodynamicTemperatureUnit;
class RWStepBasic_RWSiUnitAndThermodynamicTemperatureUnit {
	public:
		%feature("compactdefaultargs") RWStepBasic_RWSiUnitAndThermodynamicTemperatureUnit;
		%feature("autodoc", "	:rtype: None
") RWStepBasic_RWSiUnitAndThermodynamicTemperatureUnit;
		 RWStepBasic_RWSiUnitAndThermodynamicTemperatureUnit ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	:param data:
	:type data: Handle_StepData_StepReaderData &
	:param num:
	:type num: int
	:param ach:
	:type ach: Handle_Interface_Check &
	:param ent:
	:type ent: Handle_StepBasic_SiUnitAndThermodynamicTemperatureUnit &
	:rtype: None
") ReadStep;
		void ReadStep (const Handle_StepData_StepReaderData & data,const Standard_Integer num,Handle_Interface_Check & ach,const Handle_StepBasic_SiUnitAndThermodynamicTemperatureUnit & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: Handle_StepBasic_SiUnitAndThermodynamicTemperatureUnit &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const Handle_StepBasic_SiUnitAndThermodynamicTemperatureUnit & ent);
};


%extend RWStepBasic_RWSiUnitAndThermodynamicTemperatureUnit {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepBasic_RWSiUnitAndTimeUnit;
class RWStepBasic_RWSiUnitAndTimeUnit {
	public:
		%feature("compactdefaultargs") RWStepBasic_RWSiUnitAndTimeUnit;
		%feature("autodoc", "	:rtype: None
") RWStepBasic_RWSiUnitAndTimeUnit;
		 RWStepBasic_RWSiUnitAndTimeUnit ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	:param data:
	:type data: Handle_StepData_StepReaderData &
	:param num:
	:type num: int
	:param ach:
	:type ach: Handle_Interface_Check &
	:param ent:
	:type ent: Handle_StepBasic_SiUnitAndTimeUnit &
	:rtype: None
") ReadStep;
		void ReadStep (const Handle_StepData_StepReaderData & data,const Standard_Integer num,Handle_Interface_Check & ach,const Handle_StepBasic_SiUnitAndTimeUnit & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: Handle_StepBasic_SiUnitAndTimeUnit &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const Handle_StepBasic_SiUnitAndTimeUnit & ent);
};


%extend RWStepBasic_RWSiUnitAndTimeUnit {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepBasic_RWSiUnitAndVolumeUnit;
class RWStepBasic_RWSiUnitAndVolumeUnit {
	public:
		%feature("compactdefaultargs") RWStepBasic_RWSiUnitAndVolumeUnit;
		%feature("autodoc", "	:rtype: None
") RWStepBasic_RWSiUnitAndVolumeUnit;
		 RWStepBasic_RWSiUnitAndVolumeUnit ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	:param data:
	:type data: Handle_StepData_StepReaderData &
	:param num:
	:type num: int
	:param ach:
	:type ach: Handle_Interface_Check &
	:param ent:
	:type ent: Handle_StepBasic_SiUnitAndVolumeUnit &
	:rtype: None
") ReadStep;
		void ReadStep (const Handle_StepData_StepReaderData & data,const Standard_Integer num,Handle_Interface_Check & ach,const Handle_StepBasic_SiUnitAndVolumeUnit & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: Handle_StepBasic_SiUnitAndVolumeUnit &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const Handle_StepBasic_SiUnitAndVolumeUnit & ent);
};


%extend RWStepBasic_RWSiUnitAndVolumeUnit {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepBasic_RWSolidAngleMeasureWithUnit;
class RWStepBasic_RWSolidAngleMeasureWithUnit {
	public:
		%feature("compactdefaultargs") RWStepBasic_RWSolidAngleMeasureWithUnit;
		%feature("autodoc", "	:rtype: None
") RWStepBasic_RWSolidAngleMeasureWithUnit;
		 RWStepBasic_RWSolidAngleMeasureWithUnit ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	:param data:
	:type data: Handle_StepData_StepReaderData &
	:param num:
	:type num: int
	:param ach:
	:type ach: Handle_Interface_Check &
	:param ent:
	:type ent: Handle_StepBasic_SolidAngleMeasureWithUnit &
	:rtype: None
") ReadStep;
		void ReadStep (const Handle_StepData_StepReaderData & data,const Standard_Integer num,Handle_Interface_Check & ach,const Handle_StepBasic_SolidAngleMeasureWithUnit & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: Handle_StepBasic_SolidAngleMeasureWithUnit &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const Handle_StepBasic_SolidAngleMeasureWithUnit & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	:param ent:
	:type ent: Handle_StepBasic_SolidAngleMeasureWithUnit &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const Handle_StepBasic_SolidAngleMeasureWithUnit & ent,Interface_EntityIterator & iter);
};


%extend RWStepBasic_RWSolidAngleMeasureWithUnit {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepBasic_RWSolidAngleUnit;
class RWStepBasic_RWSolidAngleUnit {
	public:
		%feature("compactdefaultargs") RWStepBasic_RWSolidAngleUnit;
		%feature("autodoc", "	:rtype: None
") RWStepBasic_RWSolidAngleUnit;
		 RWStepBasic_RWSolidAngleUnit ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	:param data:
	:type data: Handle_StepData_StepReaderData &
	:param num:
	:type num: int
	:param ach:
	:type ach: Handle_Interface_Check &
	:param ent:
	:type ent: Handle_StepBasic_SolidAngleUnit &
	:rtype: None
") ReadStep;
		void ReadStep (const Handle_StepData_StepReaderData & data,const Standard_Integer num,Handle_Interface_Check & ach,const Handle_StepBasic_SolidAngleUnit & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: Handle_StepBasic_SolidAngleUnit &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const Handle_StepBasic_SolidAngleUnit & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	:param ent:
	:type ent: Handle_StepBasic_SolidAngleUnit &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const Handle_StepBasic_SolidAngleUnit & ent,Interface_EntityIterator & iter);
};


%extend RWStepBasic_RWSolidAngleUnit {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepBasic_RWThermodynamicTemperatureUnit;
class RWStepBasic_RWThermodynamicTemperatureUnit {
	public:
		%feature("compactdefaultargs") RWStepBasic_RWThermodynamicTemperatureUnit;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") RWStepBasic_RWThermodynamicTemperatureUnit;
		 RWStepBasic_RWThermodynamicTemperatureUnit ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	* Reads ThermodynamicTemperatureUnit

	:param data:
	:type data: Handle_StepData_StepReaderData &
	:param num:
	:type num: int
	:param ach:
	:type ach: Handle_Interface_Check &
	:param ent:
	:type ent: Handle_StepBasic_ThermodynamicTemperatureUnit &
	:rtype: None
") ReadStep;
		void ReadStep (const Handle_StepData_StepReaderData & data,const Standard_Integer num,Handle_Interface_Check & ach,const Handle_StepBasic_ThermodynamicTemperatureUnit & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	* Writes ThermodynamicTemperatureUnit

	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: Handle_StepBasic_ThermodynamicTemperatureUnit &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const Handle_StepBasic_ThermodynamicTemperatureUnit & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	* Fills data for graph (shared items)

	:param ent:
	:type ent: Handle_StepBasic_ThermodynamicTemperatureUnit &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const Handle_StepBasic_ThermodynamicTemperatureUnit & ent,Interface_EntityIterator & iter);
};


%extend RWStepBasic_RWThermodynamicTemperatureUnit {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepBasic_RWUncertaintyMeasureWithUnit;
class RWStepBasic_RWUncertaintyMeasureWithUnit {
	public:
		%feature("compactdefaultargs") RWStepBasic_RWUncertaintyMeasureWithUnit;
		%feature("autodoc", "	:rtype: None
") RWStepBasic_RWUncertaintyMeasureWithUnit;
		 RWStepBasic_RWUncertaintyMeasureWithUnit ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	:param data:
	:type data: Handle_StepData_StepReaderData &
	:param num:
	:type num: int
	:param ach:
	:type ach: Handle_Interface_Check &
	:param ent:
	:type ent: Handle_StepBasic_UncertaintyMeasureWithUnit &
	:rtype: None
") ReadStep;
		void ReadStep (const Handle_StepData_StepReaderData & data,const Standard_Integer num,Handle_Interface_Check & ach,const Handle_StepBasic_UncertaintyMeasureWithUnit & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: Handle_StepBasic_UncertaintyMeasureWithUnit &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const Handle_StepBasic_UncertaintyMeasureWithUnit & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	:param ent:
	:type ent: Handle_StepBasic_UncertaintyMeasureWithUnit &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const Handle_StepBasic_UncertaintyMeasureWithUnit & ent,Interface_EntityIterator & iter);
};


%extend RWStepBasic_RWUncertaintyMeasureWithUnit {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepBasic_RWVersionedActionRequest;
class RWStepBasic_RWVersionedActionRequest {
	public:
		%feature("compactdefaultargs") RWStepBasic_RWVersionedActionRequest;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") RWStepBasic_RWVersionedActionRequest;
		 RWStepBasic_RWVersionedActionRequest ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	* Reads VersionedActionRequest

	:param data:
	:type data: Handle_StepData_StepReaderData &
	:param num:
	:type num: int
	:param ach:
	:type ach: Handle_Interface_Check &
	:param ent:
	:type ent: Handle_StepBasic_VersionedActionRequest &
	:rtype: None
") ReadStep;
		void ReadStep (const Handle_StepData_StepReaderData & data,const Standard_Integer num,Handle_Interface_Check & ach,const Handle_StepBasic_VersionedActionRequest & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	* Writes VersionedActionRequest

	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: Handle_StepBasic_VersionedActionRequest &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const Handle_StepBasic_VersionedActionRequest & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	* Fills data for graph (shared items)

	:param ent:
	:type ent: Handle_StepBasic_VersionedActionRequest &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const Handle_StepBasic_VersionedActionRequest & ent,Interface_EntityIterator & iter);
};


%extend RWStepBasic_RWVersionedActionRequest {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepBasic_RWWeekOfYearAndDayDate;
class RWStepBasic_RWWeekOfYearAndDayDate {
	public:
		%feature("compactdefaultargs") RWStepBasic_RWWeekOfYearAndDayDate;
		%feature("autodoc", "	:rtype: None
") RWStepBasic_RWWeekOfYearAndDayDate;
		 RWStepBasic_RWWeekOfYearAndDayDate ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	:param data:
	:type data: Handle_StepData_StepReaderData &
	:param num:
	:type num: int
	:param ach:
	:type ach: Handle_Interface_Check &
	:param ent:
	:type ent: Handle_StepBasic_WeekOfYearAndDayDate &
	:rtype: None
") ReadStep;
		void ReadStep (const Handle_StepData_StepReaderData & data,const Standard_Integer num,Handle_Interface_Check & ach,const Handle_StepBasic_WeekOfYearAndDayDate & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: Handle_StepBasic_WeekOfYearAndDayDate &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const Handle_StepBasic_WeekOfYearAndDayDate & ent);
};


%extend RWStepBasic_RWWeekOfYearAndDayDate {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
