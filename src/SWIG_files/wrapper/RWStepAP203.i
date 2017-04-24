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
%module (package="OCC") RWStepAP203

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


%include RWStepAP203_headers.i


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

%nodefaultctor RWStepAP203_RWCcDesignApproval;
class RWStepAP203_RWCcDesignApproval {
	public:
		%feature("compactdefaultargs") RWStepAP203_RWCcDesignApproval;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") RWStepAP203_RWCcDesignApproval;
		 RWStepAP203_RWCcDesignApproval ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	* Reads CcDesignApproval

	:param data:
	:type data: Handle_StepData_StepReaderData &
	:param num:
	:type num: int
	:param ach:
	:type ach: Handle_Interface_Check &
	:param ent:
	:type ent: Handle_StepAP203_CcDesignApproval &
	:rtype: None
") ReadStep;
		void ReadStep (const Handle_StepData_StepReaderData & data,const Standard_Integer num,Handle_Interface_Check & ach,const Handle_StepAP203_CcDesignApproval & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	* Writes CcDesignApproval

	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: Handle_StepAP203_CcDesignApproval &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const Handle_StepAP203_CcDesignApproval & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	* Fills data for graph (shared items)

	:param ent:
	:type ent: Handle_StepAP203_CcDesignApproval &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const Handle_StepAP203_CcDesignApproval & ent,Interface_EntityIterator & iter);
};


%extend RWStepAP203_RWCcDesignApproval {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepAP203_RWCcDesignCertification;
class RWStepAP203_RWCcDesignCertification {
	public:
		%feature("compactdefaultargs") RWStepAP203_RWCcDesignCertification;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") RWStepAP203_RWCcDesignCertification;
		 RWStepAP203_RWCcDesignCertification ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	* Reads CcDesignCertification

	:param data:
	:type data: Handle_StepData_StepReaderData &
	:param num:
	:type num: int
	:param ach:
	:type ach: Handle_Interface_Check &
	:param ent:
	:type ent: Handle_StepAP203_CcDesignCertification &
	:rtype: None
") ReadStep;
		void ReadStep (const Handle_StepData_StepReaderData & data,const Standard_Integer num,Handle_Interface_Check & ach,const Handle_StepAP203_CcDesignCertification & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	* Writes CcDesignCertification

	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: Handle_StepAP203_CcDesignCertification &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const Handle_StepAP203_CcDesignCertification & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	* Fills data for graph (shared items)

	:param ent:
	:type ent: Handle_StepAP203_CcDesignCertification &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const Handle_StepAP203_CcDesignCertification & ent,Interface_EntityIterator & iter);
};


%extend RWStepAP203_RWCcDesignCertification {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepAP203_RWCcDesignContract;
class RWStepAP203_RWCcDesignContract {
	public:
		%feature("compactdefaultargs") RWStepAP203_RWCcDesignContract;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") RWStepAP203_RWCcDesignContract;
		 RWStepAP203_RWCcDesignContract ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	* Reads CcDesignContract

	:param data:
	:type data: Handle_StepData_StepReaderData &
	:param num:
	:type num: int
	:param ach:
	:type ach: Handle_Interface_Check &
	:param ent:
	:type ent: Handle_StepAP203_CcDesignContract &
	:rtype: None
") ReadStep;
		void ReadStep (const Handle_StepData_StepReaderData & data,const Standard_Integer num,Handle_Interface_Check & ach,const Handle_StepAP203_CcDesignContract & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	* Writes CcDesignContract

	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: Handle_StepAP203_CcDesignContract &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const Handle_StepAP203_CcDesignContract & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	* Fills data for graph (shared items)

	:param ent:
	:type ent: Handle_StepAP203_CcDesignContract &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const Handle_StepAP203_CcDesignContract & ent,Interface_EntityIterator & iter);
};


%extend RWStepAP203_RWCcDesignContract {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepAP203_RWCcDesignDateAndTimeAssignment;
class RWStepAP203_RWCcDesignDateAndTimeAssignment {
	public:
		%feature("compactdefaultargs") RWStepAP203_RWCcDesignDateAndTimeAssignment;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") RWStepAP203_RWCcDesignDateAndTimeAssignment;
		 RWStepAP203_RWCcDesignDateAndTimeAssignment ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	* Reads CcDesignDateAndTimeAssignment

	:param data:
	:type data: Handle_StepData_StepReaderData &
	:param num:
	:type num: int
	:param ach:
	:type ach: Handle_Interface_Check &
	:param ent:
	:type ent: Handle_StepAP203_CcDesignDateAndTimeAssignment &
	:rtype: None
") ReadStep;
		void ReadStep (const Handle_StepData_StepReaderData & data,const Standard_Integer num,Handle_Interface_Check & ach,const Handle_StepAP203_CcDesignDateAndTimeAssignment & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	* Writes CcDesignDateAndTimeAssignment

	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: Handle_StepAP203_CcDesignDateAndTimeAssignment &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const Handle_StepAP203_CcDesignDateAndTimeAssignment & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	* Fills data for graph (shared items)

	:param ent:
	:type ent: Handle_StepAP203_CcDesignDateAndTimeAssignment &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const Handle_StepAP203_CcDesignDateAndTimeAssignment & ent,Interface_EntityIterator & iter);
};


%extend RWStepAP203_RWCcDesignDateAndTimeAssignment {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepAP203_RWCcDesignPersonAndOrganizationAssignment;
class RWStepAP203_RWCcDesignPersonAndOrganizationAssignment {
	public:
		%feature("compactdefaultargs") RWStepAP203_RWCcDesignPersonAndOrganizationAssignment;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") RWStepAP203_RWCcDesignPersonAndOrganizationAssignment;
		 RWStepAP203_RWCcDesignPersonAndOrganizationAssignment ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	* Reads CcDesignPersonAndOrganizationAssignment

	:param data:
	:type data: Handle_StepData_StepReaderData &
	:param num:
	:type num: int
	:param ach:
	:type ach: Handle_Interface_Check &
	:param ent:
	:type ent: Handle_StepAP203_CcDesignPersonAndOrganizationAssignment &
	:rtype: None
") ReadStep;
		void ReadStep (const Handle_StepData_StepReaderData & data,const Standard_Integer num,Handle_Interface_Check & ach,const Handle_StepAP203_CcDesignPersonAndOrganizationAssignment & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	* Writes CcDesignPersonAndOrganizationAssignment

	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: Handle_StepAP203_CcDesignPersonAndOrganizationAssignment &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const Handle_StepAP203_CcDesignPersonAndOrganizationAssignment & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	* Fills data for graph (shared items)

	:param ent:
	:type ent: Handle_StepAP203_CcDesignPersonAndOrganizationAssignment &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const Handle_StepAP203_CcDesignPersonAndOrganizationAssignment & ent,Interface_EntityIterator & iter);
};


%extend RWStepAP203_RWCcDesignPersonAndOrganizationAssignment {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepAP203_RWCcDesignSecurityClassification;
class RWStepAP203_RWCcDesignSecurityClassification {
	public:
		%feature("compactdefaultargs") RWStepAP203_RWCcDesignSecurityClassification;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") RWStepAP203_RWCcDesignSecurityClassification;
		 RWStepAP203_RWCcDesignSecurityClassification ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	* Reads CcDesignSecurityClassification

	:param data:
	:type data: Handle_StepData_StepReaderData &
	:param num:
	:type num: int
	:param ach:
	:type ach: Handle_Interface_Check &
	:param ent:
	:type ent: Handle_StepAP203_CcDesignSecurityClassification &
	:rtype: None
") ReadStep;
		void ReadStep (const Handle_StepData_StepReaderData & data,const Standard_Integer num,Handle_Interface_Check & ach,const Handle_StepAP203_CcDesignSecurityClassification & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	* Writes CcDesignSecurityClassification

	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: Handle_StepAP203_CcDesignSecurityClassification &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const Handle_StepAP203_CcDesignSecurityClassification & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	* Fills data for graph (shared items)

	:param ent:
	:type ent: Handle_StepAP203_CcDesignSecurityClassification &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const Handle_StepAP203_CcDesignSecurityClassification & ent,Interface_EntityIterator & iter);
};


%extend RWStepAP203_RWCcDesignSecurityClassification {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepAP203_RWCcDesignSpecificationReference;
class RWStepAP203_RWCcDesignSpecificationReference {
	public:
		%feature("compactdefaultargs") RWStepAP203_RWCcDesignSpecificationReference;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") RWStepAP203_RWCcDesignSpecificationReference;
		 RWStepAP203_RWCcDesignSpecificationReference ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	* Reads CcDesignSpecificationReference

	:param data:
	:type data: Handle_StepData_StepReaderData &
	:param num:
	:type num: int
	:param ach:
	:type ach: Handle_Interface_Check &
	:param ent:
	:type ent: Handle_StepAP203_CcDesignSpecificationReference &
	:rtype: None
") ReadStep;
		void ReadStep (const Handle_StepData_StepReaderData & data,const Standard_Integer num,Handle_Interface_Check & ach,const Handle_StepAP203_CcDesignSpecificationReference & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	* Writes CcDesignSpecificationReference

	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: Handle_StepAP203_CcDesignSpecificationReference &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const Handle_StepAP203_CcDesignSpecificationReference & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	* Fills data for graph (shared items)

	:param ent:
	:type ent: Handle_StepAP203_CcDesignSpecificationReference &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const Handle_StepAP203_CcDesignSpecificationReference & ent,Interface_EntityIterator & iter);
};


%extend RWStepAP203_RWCcDesignSpecificationReference {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepAP203_RWChange;
class RWStepAP203_RWChange {
	public:
		%feature("compactdefaultargs") RWStepAP203_RWChange;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") RWStepAP203_RWChange;
		 RWStepAP203_RWChange ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	* Reads Change

	:param data:
	:type data: Handle_StepData_StepReaderData &
	:param num:
	:type num: int
	:param ach:
	:type ach: Handle_Interface_Check &
	:param ent:
	:type ent: Handle_StepAP203_Change &
	:rtype: None
") ReadStep;
		void ReadStep (const Handle_StepData_StepReaderData & data,const Standard_Integer num,Handle_Interface_Check & ach,const Handle_StepAP203_Change & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	* Writes Change

	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: Handle_StepAP203_Change &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const Handle_StepAP203_Change & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	* Fills data for graph (shared items)

	:param ent:
	:type ent: Handle_StepAP203_Change &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const Handle_StepAP203_Change & ent,Interface_EntityIterator & iter);
};


%extend RWStepAP203_RWChange {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepAP203_RWChangeRequest;
class RWStepAP203_RWChangeRequest {
	public:
		%feature("compactdefaultargs") RWStepAP203_RWChangeRequest;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") RWStepAP203_RWChangeRequest;
		 RWStepAP203_RWChangeRequest ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	* Reads ChangeRequest

	:param data:
	:type data: Handle_StepData_StepReaderData &
	:param num:
	:type num: int
	:param ach:
	:type ach: Handle_Interface_Check &
	:param ent:
	:type ent: Handle_StepAP203_ChangeRequest &
	:rtype: None
") ReadStep;
		void ReadStep (const Handle_StepData_StepReaderData & data,const Standard_Integer num,Handle_Interface_Check & ach,const Handle_StepAP203_ChangeRequest & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	* Writes ChangeRequest

	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: Handle_StepAP203_ChangeRequest &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const Handle_StepAP203_ChangeRequest & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	* Fills data for graph (shared items)

	:param ent:
	:type ent: Handle_StepAP203_ChangeRequest &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const Handle_StepAP203_ChangeRequest & ent,Interface_EntityIterator & iter);
};


%extend RWStepAP203_RWChangeRequest {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepAP203_RWStartRequest;
class RWStepAP203_RWStartRequest {
	public:
		%feature("compactdefaultargs") RWStepAP203_RWStartRequest;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") RWStepAP203_RWStartRequest;
		 RWStepAP203_RWStartRequest ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	* Reads StartRequest

	:param data:
	:type data: Handle_StepData_StepReaderData &
	:param num:
	:type num: int
	:param ach:
	:type ach: Handle_Interface_Check &
	:param ent:
	:type ent: Handle_StepAP203_StartRequest &
	:rtype: None
") ReadStep;
		void ReadStep (const Handle_StepData_StepReaderData & data,const Standard_Integer num,Handle_Interface_Check & ach,const Handle_StepAP203_StartRequest & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	* Writes StartRequest

	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: Handle_StepAP203_StartRequest &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const Handle_StepAP203_StartRequest & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	* Fills data for graph (shared items)

	:param ent:
	:type ent: Handle_StepAP203_StartRequest &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const Handle_StepAP203_StartRequest & ent,Interface_EntityIterator & iter);
};


%extend RWStepAP203_RWStartRequest {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepAP203_RWStartWork;
class RWStepAP203_RWStartWork {
	public:
		%feature("compactdefaultargs") RWStepAP203_RWStartWork;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") RWStepAP203_RWStartWork;
		 RWStepAP203_RWStartWork ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	* Reads StartWork

	:param data:
	:type data: Handle_StepData_StepReaderData &
	:param num:
	:type num: int
	:param ach:
	:type ach: Handle_Interface_Check &
	:param ent:
	:type ent: Handle_StepAP203_StartWork &
	:rtype: None
") ReadStep;
		void ReadStep (const Handle_StepData_StepReaderData & data,const Standard_Integer num,Handle_Interface_Check & ach,const Handle_StepAP203_StartWork & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	* Writes StartWork

	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: Handle_StepAP203_StartWork &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const Handle_StepAP203_StartWork & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	* Fills data for graph (shared items)

	:param ent:
	:type ent: Handle_StepAP203_StartWork &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const Handle_StepAP203_StartWork & ent,Interface_EntityIterator & iter);
};


%extend RWStepAP203_RWStartWork {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
