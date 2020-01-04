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
%define RWSTEPAP203DOCSTRING
"RWStepAP203 module, see official documentation at
https://www.opencascade.com/doc/occt-7.4.0/refman/html/package_rwstepap203.html"
%enddef
%module (package="OCC.Core", docstring=RWSTEPAP203DOCSTRING) RWStepAP203


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
#include<RWStepAP203_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<StepData_module.hxx>
#include<Interface_module.hxx>
#include<StepAP203_module.hxx>
#include<Message_module.hxx>
#include<StepBasic_module.hxx>
#include<StepData_module.hxx>
#include<StepGeom_module.hxx>
#include<StepShape_module.hxx>
#include<StepRepr_module.hxx>
#include<MoniTool_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import StepData.i
%import Interface.i
%import StepAP203.i
/* public enums */
/* end public enums declaration */

/* handles */
/* end handles declaration */

/* templates */
/* end templates declaration */

/* typedefs */
/* end typedefs declaration */

/***************************************
* class RWStepAP203_RWCcDesignApproval *
***************************************/
class RWStepAP203_RWCcDesignApproval {
	public:
		/****************** RWStepAP203_RWCcDesignApproval ******************/
		%feature("compactdefaultargs") RWStepAP203_RWCcDesignApproval;
		%feature("autodoc", "* Empty constructor
	:rtype: None") RWStepAP203_RWCcDesignApproval;
		 RWStepAP203_RWCcDesignApproval ();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "* Reads CcDesignApproval
	:param data:
	:type data: StepData_StepReaderData
	:param num:
	:type num: int
	:param ach:
	:type ach: Interface_Check
	:param ent:
	:type ent: StepAP203_CcDesignApproval
	:rtype: None") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepAP203_CcDesignApproval> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "* Fills data for graph (shared items)
	:param ent:
	:type ent: StepAP203_CcDesignApproval
	:param iter:
	:type iter: Interface_EntityIterator
	:rtype: None") Share;
		void Share (const opencascade::handle<StepAP203_CcDesignApproval> & ent,Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "* Writes CcDesignApproval
	:param SW:
	:type SW: StepData_StepWriter
	:param ent:
	:type ent: StepAP203_CcDesignApproval
	:rtype: None") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepAP203_CcDesignApproval> & ent);

};


%extend RWStepAP203_RWCcDesignApproval {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************************
* class RWStepAP203_RWCcDesignCertification *
********************************************/
class RWStepAP203_RWCcDesignCertification {
	public:
		/****************** RWStepAP203_RWCcDesignCertification ******************/
		%feature("compactdefaultargs") RWStepAP203_RWCcDesignCertification;
		%feature("autodoc", "* Empty constructor
	:rtype: None") RWStepAP203_RWCcDesignCertification;
		 RWStepAP203_RWCcDesignCertification ();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "* Reads CcDesignCertification
	:param data:
	:type data: StepData_StepReaderData
	:param num:
	:type num: int
	:param ach:
	:type ach: Interface_Check
	:param ent:
	:type ent: StepAP203_CcDesignCertification
	:rtype: None") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepAP203_CcDesignCertification> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "* Fills data for graph (shared items)
	:param ent:
	:type ent: StepAP203_CcDesignCertification
	:param iter:
	:type iter: Interface_EntityIterator
	:rtype: None") Share;
		void Share (const opencascade::handle<StepAP203_CcDesignCertification> & ent,Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "* Writes CcDesignCertification
	:param SW:
	:type SW: StepData_StepWriter
	:param ent:
	:type ent: StepAP203_CcDesignCertification
	:rtype: None") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepAP203_CcDesignCertification> & ent);

};


%extend RWStepAP203_RWCcDesignCertification {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************************
* class RWStepAP203_RWCcDesignContract *
***************************************/
class RWStepAP203_RWCcDesignContract {
	public:
		/****************** RWStepAP203_RWCcDesignContract ******************/
		%feature("compactdefaultargs") RWStepAP203_RWCcDesignContract;
		%feature("autodoc", "* Empty constructor
	:rtype: None") RWStepAP203_RWCcDesignContract;
		 RWStepAP203_RWCcDesignContract ();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "* Reads CcDesignContract
	:param data:
	:type data: StepData_StepReaderData
	:param num:
	:type num: int
	:param ach:
	:type ach: Interface_Check
	:param ent:
	:type ent: StepAP203_CcDesignContract
	:rtype: None") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepAP203_CcDesignContract> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "* Fills data for graph (shared items)
	:param ent:
	:type ent: StepAP203_CcDesignContract
	:param iter:
	:type iter: Interface_EntityIterator
	:rtype: None") Share;
		void Share (const opencascade::handle<StepAP203_CcDesignContract> & ent,Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "* Writes CcDesignContract
	:param SW:
	:type SW: StepData_StepWriter
	:param ent:
	:type ent: StepAP203_CcDesignContract
	:rtype: None") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepAP203_CcDesignContract> & ent);

};


%extend RWStepAP203_RWCcDesignContract {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************************************
* class RWStepAP203_RWCcDesignDateAndTimeAssignment *
****************************************************/
class RWStepAP203_RWCcDesignDateAndTimeAssignment {
	public:
		/****************** RWStepAP203_RWCcDesignDateAndTimeAssignment ******************/
		%feature("compactdefaultargs") RWStepAP203_RWCcDesignDateAndTimeAssignment;
		%feature("autodoc", "* Empty constructor
	:rtype: None") RWStepAP203_RWCcDesignDateAndTimeAssignment;
		 RWStepAP203_RWCcDesignDateAndTimeAssignment ();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "* Reads CcDesignDateAndTimeAssignment
	:param data:
	:type data: StepData_StepReaderData
	:param num:
	:type num: int
	:param ach:
	:type ach: Interface_Check
	:param ent:
	:type ent: StepAP203_CcDesignDateAndTimeAssignment
	:rtype: None") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepAP203_CcDesignDateAndTimeAssignment> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "* Fills data for graph (shared items)
	:param ent:
	:type ent: StepAP203_CcDesignDateAndTimeAssignment
	:param iter:
	:type iter: Interface_EntityIterator
	:rtype: None") Share;
		void Share (const opencascade::handle<StepAP203_CcDesignDateAndTimeAssignment> & ent,Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "* Writes CcDesignDateAndTimeAssignment
	:param SW:
	:type SW: StepData_StepWriter
	:param ent:
	:type ent: StepAP203_CcDesignDateAndTimeAssignment
	:rtype: None") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepAP203_CcDesignDateAndTimeAssignment> & ent);

};


%extend RWStepAP203_RWCcDesignDateAndTimeAssignment {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************************************************
* class RWStepAP203_RWCcDesignPersonAndOrganizationAssignment *
**************************************************************/
class RWStepAP203_RWCcDesignPersonAndOrganizationAssignment {
	public:
		/****************** RWStepAP203_RWCcDesignPersonAndOrganizationAssignment ******************/
		%feature("compactdefaultargs") RWStepAP203_RWCcDesignPersonAndOrganizationAssignment;
		%feature("autodoc", "* Empty constructor
	:rtype: None") RWStepAP203_RWCcDesignPersonAndOrganizationAssignment;
		 RWStepAP203_RWCcDesignPersonAndOrganizationAssignment ();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "* Reads CcDesignPersonAndOrganizationAssignment
	:param data:
	:type data: StepData_StepReaderData
	:param num:
	:type num: int
	:param ach:
	:type ach: Interface_Check
	:param ent:
	:type ent: StepAP203_CcDesignPersonAndOrganizationAssignment
	:rtype: None") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepAP203_CcDesignPersonAndOrganizationAssignment> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "* Fills data for graph (shared items)
	:param ent:
	:type ent: StepAP203_CcDesignPersonAndOrganizationAssignment
	:param iter:
	:type iter: Interface_EntityIterator
	:rtype: None") Share;
		void Share (const opencascade::handle<StepAP203_CcDesignPersonAndOrganizationAssignment> & ent,Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "* Writes CcDesignPersonAndOrganizationAssignment
	:param SW:
	:type SW: StepData_StepWriter
	:param ent:
	:type ent: StepAP203_CcDesignPersonAndOrganizationAssignment
	:rtype: None") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepAP203_CcDesignPersonAndOrganizationAssignment> & ent);

};


%extend RWStepAP203_RWCcDesignPersonAndOrganizationAssignment {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************************************
* class RWStepAP203_RWCcDesignSecurityClassification *
*****************************************************/
class RWStepAP203_RWCcDesignSecurityClassification {
	public:
		/****************** RWStepAP203_RWCcDesignSecurityClassification ******************/
		%feature("compactdefaultargs") RWStepAP203_RWCcDesignSecurityClassification;
		%feature("autodoc", "* Empty constructor
	:rtype: None") RWStepAP203_RWCcDesignSecurityClassification;
		 RWStepAP203_RWCcDesignSecurityClassification ();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "* Reads CcDesignSecurityClassification
	:param data:
	:type data: StepData_StepReaderData
	:param num:
	:type num: int
	:param ach:
	:type ach: Interface_Check
	:param ent:
	:type ent: StepAP203_CcDesignSecurityClassification
	:rtype: None") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepAP203_CcDesignSecurityClassification> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "* Fills data for graph (shared items)
	:param ent:
	:type ent: StepAP203_CcDesignSecurityClassification
	:param iter:
	:type iter: Interface_EntityIterator
	:rtype: None") Share;
		void Share (const opencascade::handle<StepAP203_CcDesignSecurityClassification> & ent,Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "* Writes CcDesignSecurityClassification
	:param SW:
	:type SW: StepData_StepWriter
	:param ent:
	:type ent: StepAP203_CcDesignSecurityClassification
	:rtype: None") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepAP203_CcDesignSecurityClassification> & ent);

};


%extend RWStepAP203_RWCcDesignSecurityClassification {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************************************
* class RWStepAP203_RWCcDesignSpecificationReference *
*****************************************************/
class RWStepAP203_RWCcDesignSpecificationReference {
	public:
		/****************** RWStepAP203_RWCcDesignSpecificationReference ******************/
		%feature("compactdefaultargs") RWStepAP203_RWCcDesignSpecificationReference;
		%feature("autodoc", "* Empty constructor
	:rtype: None") RWStepAP203_RWCcDesignSpecificationReference;
		 RWStepAP203_RWCcDesignSpecificationReference ();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "* Reads CcDesignSpecificationReference
	:param data:
	:type data: StepData_StepReaderData
	:param num:
	:type num: int
	:param ach:
	:type ach: Interface_Check
	:param ent:
	:type ent: StepAP203_CcDesignSpecificationReference
	:rtype: None") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepAP203_CcDesignSpecificationReference> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "* Fills data for graph (shared items)
	:param ent:
	:type ent: StepAP203_CcDesignSpecificationReference
	:param iter:
	:type iter: Interface_EntityIterator
	:rtype: None") Share;
		void Share (const opencascade::handle<StepAP203_CcDesignSpecificationReference> & ent,Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "* Writes CcDesignSpecificationReference
	:param SW:
	:type SW: StepData_StepWriter
	:param ent:
	:type ent: StepAP203_CcDesignSpecificationReference
	:rtype: None") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepAP203_CcDesignSpecificationReference> & ent);

};


%extend RWStepAP203_RWCcDesignSpecificationReference {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************
* class RWStepAP203_RWChange *
*****************************/
class RWStepAP203_RWChange {
	public:
		/****************** RWStepAP203_RWChange ******************/
		%feature("compactdefaultargs") RWStepAP203_RWChange;
		%feature("autodoc", "* Empty constructor
	:rtype: None") RWStepAP203_RWChange;
		 RWStepAP203_RWChange ();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "* Reads Change
	:param data:
	:type data: StepData_StepReaderData
	:param num:
	:type num: int
	:param ach:
	:type ach: Interface_Check
	:param ent:
	:type ent: StepAP203_Change
	:rtype: None") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepAP203_Change> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "* Fills data for graph (shared items)
	:param ent:
	:type ent: StepAP203_Change
	:param iter:
	:type iter: Interface_EntityIterator
	:rtype: None") Share;
		void Share (const opencascade::handle<StepAP203_Change> & ent,Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "* Writes Change
	:param SW:
	:type SW: StepData_StepWriter
	:param ent:
	:type ent: StepAP203_Change
	:rtype: None") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepAP203_Change> & ent);

};


%extend RWStepAP203_RWChange {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************************
* class RWStepAP203_RWChangeRequest *
************************************/
class RWStepAP203_RWChangeRequest {
	public:
		/****************** RWStepAP203_RWChangeRequest ******************/
		%feature("compactdefaultargs") RWStepAP203_RWChangeRequest;
		%feature("autodoc", "* Empty constructor
	:rtype: None") RWStepAP203_RWChangeRequest;
		 RWStepAP203_RWChangeRequest ();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "* Reads ChangeRequest
	:param data:
	:type data: StepData_StepReaderData
	:param num:
	:type num: int
	:param ach:
	:type ach: Interface_Check
	:param ent:
	:type ent: StepAP203_ChangeRequest
	:rtype: None") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepAP203_ChangeRequest> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "* Fills data for graph (shared items)
	:param ent:
	:type ent: StepAP203_ChangeRequest
	:param iter:
	:type iter: Interface_EntityIterator
	:rtype: None") Share;
		void Share (const opencascade::handle<StepAP203_ChangeRequest> & ent,Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "* Writes ChangeRequest
	:param SW:
	:type SW: StepData_StepWriter
	:param ent:
	:type ent: StepAP203_ChangeRequest
	:rtype: None") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepAP203_ChangeRequest> & ent);

};


%extend RWStepAP203_RWChangeRequest {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************************
* class RWStepAP203_RWStartRequest *
***********************************/
class RWStepAP203_RWStartRequest {
	public:
		/****************** RWStepAP203_RWStartRequest ******************/
		%feature("compactdefaultargs") RWStepAP203_RWStartRequest;
		%feature("autodoc", "* Empty constructor
	:rtype: None") RWStepAP203_RWStartRequest;
		 RWStepAP203_RWStartRequest ();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "* Reads StartRequest
	:param data:
	:type data: StepData_StepReaderData
	:param num:
	:type num: int
	:param ach:
	:type ach: Interface_Check
	:param ent:
	:type ent: StepAP203_StartRequest
	:rtype: None") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepAP203_StartRequest> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "* Fills data for graph (shared items)
	:param ent:
	:type ent: StepAP203_StartRequest
	:param iter:
	:type iter: Interface_EntityIterator
	:rtype: None") Share;
		void Share (const opencascade::handle<StepAP203_StartRequest> & ent,Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "* Writes StartRequest
	:param SW:
	:type SW: StepData_StepWriter
	:param ent:
	:type ent: StepAP203_StartRequest
	:rtype: None") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepAP203_StartRequest> & ent);

};


%extend RWStepAP203_RWStartRequest {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************
* class RWStepAP203_RWStartWork *
********************************/
class RWStepAP203_RWStartWork {
	public:
		/****************** RWStepAP203_RWStartWork ******************/
		%feature("compactdefaultargs") RWStepAP203_RWStartWork;
		%feature("autodoc", "* Empty constructor
	:rtype: None") RWStepAP203_RWStartWork;
		 RWStepAP203_RWStartWork ();

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "* Reads StartWork
	:param data:
	:type data: StepData_StepReaderData
	:param num:
	:type num: int
	:param ach:
	:type ach: Interface_Check
	:param ent:
	:type ent: StepAP203_StartWork
	:rtype: None") ReadStep;
		void ReadStep (const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepAP203_StartWork> & ent);

		/****************** Share ******************/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "* Fills data for graph (shared items)
	:param ent:
	:type ent: StepAP203_StartWork
	:param iter:
	:type iter: Interface_EntityIterator
	:rtype: None") Share;
		void Share (const opencascade::handle<StepAP203_StartWork> & ent,Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "* Writes StartWork
	:param SW:
	:type SW: StepData_StepWriter
	:param ent:
	:type ent: StepAP203_StartWork
	:rtype: None") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const opencascade::handle<StepAP203_StartWork> & ent);

};


%extend RWStepAP203_RWStartWork {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/* harray1 classes */
/* harray2 classes */
/* hsequence classes */
