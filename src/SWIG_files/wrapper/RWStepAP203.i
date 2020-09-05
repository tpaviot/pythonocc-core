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
%import StepAP203.i

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

/***************************************
* class RWStepAP203_RWCcDesignApproval *
***************************************/
class RWStepAP203_RWCcDesignApproval {
	public:
		/****************** RWStepAP203_RWCcDesignApproval ******************/
		/**** md5 signature: 067b69cc22b66f187096aec242a8e386 ****/
		%feature("compactdefaultargs") RWStepAP203_RWCcDesignApproval;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepAP203_RWCcDesignApproval;
		 RWStepAP203_RWCcDesignApproval();

		/****************** ReadStep ******************/
		/**** md5 signature: 5b2905d15b036ed876c2d3de5edcd3e5 ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "Reads ccdesignapproval.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepAP203_CcDesignApproval

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepAP203_CcDesignApproval> & ent);

		/****************** Share ******************/
		/**** md5 signature: cb18fd25316d9d48119a1c3083304763 ****/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "Fills data for graph (shared items).

Parameters
----------
ent: StepAP203_CcDesignApproval
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepAP203_CcDesignApproval> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		/**** md5 signature: c87261abfce6cd7456bfcdfa6da32b77 ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "Writes ccdesignapproval.

Parameters
----------
SW: StepData_StepWriter
ent: StepAP203_CcDesignApproval

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepAP203_CcDesignApproval> & ent);

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
		/**** md5 signature: e1601f76d256aa06289f561b2e903407 ****/
		%feature("compactdefaultargs") RWStepAP203_RWCcDesignCertification;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepAP203_RWCcDesignCertification;
		 RWStepAP203_RWCcDesignCertification();

		/****************** ReadStep ******************/
		/**** md5 signature: 8b9f31e85a74bb00e382cddfb4916f0d ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "Reads ccdesigncertification.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepAP203_CcDesignCertification

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepAP203_CcDesignCertification> & ent);

		/****************** Share ******************/
		/**** md5 signature: ac04b065be04eb135daed63af2c0deaa ****/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "Fills data for graph (shared items).

Parameters
----------
ent: StepAP203_CcDesignCertification
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepAP203_CcDesignCertification> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		/**** md5 signature: dcbcd1baa079f94291043eda9415e50a ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "Writes ccdesigncertification.

Parameters
----------
SW: StepData_StepWriter
ent: StepAP203_CcDesignCertification

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepAP203_CcDesignCertification> & ent);

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
		/**** md5 signature: 7cdca610084b7588fc2dc24ba8874352 ****/
		%feature("compactdefaultargs") RWStepAP203_RWCcDesignContract;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepAP203_RWCcDesignContract;
		 RWStepAP203_RWCcDesignContract();

		/****************** ReadStep ******************/
		/**** md5 signature: cc82f6a35d9039759a9e42ef8581cc21 ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "Reads ccdesigncontract.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepAP203_CcDesignContract

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepAP203_CcDesignContract> & ent);

		/****************** Share ******************/
		/**** md5 signature: bf610a5db6735eb12f1e004edf11186a ****/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "Fills data for graph (shared items).

Parameters
----------
ent: StepAP203_CcDesignContract
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepAP203_CcDesignContract> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		/**** md5 signature: 5e5aeec6b8cac21dd71843456260be3c ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "Writes ccdesigncontract.

Parameters
----------
SW: StepData_StepWriter
ent: StepAP203_CcDesignContract

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepAP203_CcDesignContract> & ent);

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
		/**** md5 signature: 10b9481270007bed54b39d0354414a33 ****/
		%feature("compactdefaultargs") RWStepAP203_RWCcDesignDateAndTimeAssignment;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepAP203_RWCcDesignDateAndTimeAssignment;
		 RWStepAP203_RWCcDesignDateAndTimeAssignment();

		/****************** ReadStep ******************/
		/**** md5 signature: 03c99d7106c4b49825b05e3f330f6f23 ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "Reads ccdesigndateandtimeassignment.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepAP203_CcDesignDateAndTimeAssignment

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepAP203_CcDesignDateAndTimeAssignment> & ent);

		/****************** Share ******************/
		/**** md5 signature: 4d81f3c9193b976c1281d81b557a78a0 ****/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "Fills data for graph (shared items).

Parameters
----------
ent: StepAP203_CcDesignDateAndTimeAssignment
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepAP203_CcDesignDateAndTimeAssignment> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		/**** md5 signature: e7f63ca0252ecc621cf75ca7cf0c8ace ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "Writes ccdesigndateandtimeassignment.

Parameters
----------
SW: StepData_StepWriter
ent: StepAP203_CcDesignDateAndTimeAssignment

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepAP203_CcDesignDateAndTimeAssignment> & ent);

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
		/**** md5 signature: 4b0929e98679174cf4bc580b8fb42bac ****/
		%feature("compactdefaultargs") RWStepAP203_RWCcDesignPersonAndOrganizationAssignment;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepAP203_RWCcDesignPersonAndOrganizationAssignment;
		 RWStepAP203_RWCcDesignPersonAndOrganizationAssignment();

		/****************** ReadStep ******************/
		/**** md5 signature: 83b1b161c1d2ca42c6bf61be6669cfcc ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "Reads ccdesignpersonandorganizationassignment.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepAP203_CcDesignPersonAndOrganizationAssignment

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepAP203_CcDesignPersonAndOrganizationAssignment> & ent);

		/****************** Share ******************/
		/**** md5 signature: 0255267ba7f57b556ad4a889e9107814 ****/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "Fills data for graph (shared items).

Parameters
----------
ent: StepAP203_CcDesignPersonAndOrganizationAssignment
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepAP203_CcDesignPersonAndOrganizationAssignment> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		/**** md5 signature: 98b6e0a52369b075572aafcac58c98fb ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "Writes ccdesignpersonandorganizationassignment.

Parameters
----------
SW: StepData_StepWriter
ent: StepAP203_CcDesignPersonAndOrganizationAssignment

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepAP203_CcDesignPersonAndOrganizationAssignment> & ent);

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
		/**** md5 signature: 35fc176a244f3bd53730c6316dfefbe9 ****/
		%feature("compactdefaultargs") RWStepAP203_RWCcDesignSecurityClassification;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepAP203_RWCcDesignSecurityClassification;
		 RWStepAP203_RWCcDesignSecurityClassification();

		/****************** ReadStep ******************/
		/**** md5 signature: 3de45d9ecfe5c24c7ee0364fe5e3a90d ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "Reads ccdesignsecurityclassification.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepAP203_CcDesignSecurityClassification

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepAP203_CcDesignSecurityClassification> & ent);

		/****************** Share ******************/
		/**** md5 signature: c398dfb2661cc6caaf9881d2605208ba ****/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "Fills data for graph (shared items).

Parameters
----------
ent: StepAP203_CcDesignSecurityClassification
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepAP203_CcDesignSecurityClassification> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		/**** md5 signature: b5e29b20744e2613573e5db6fad2b417 ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "Writes ccdesignsecurityclassification.

Parameters
----------
SW: StepData_StepWriter
ent: StepAP203_CcDesignSecurityClassification

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepAP203_CcDesignSecurityClassification> & ent);

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
		/**** md5 signature: 5106b405a115167148468dfb44b58073 ****/
		%feature("compactdefaultargs") RWStepAP203_RWCcDesignSpecificationReference;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepAP203_RWCcDesignSpecificationReference;
		 RWStepAP203_RWCcDesignSpecificationReference();

		/****************** ReadStep ******************/
		/**** md5 signature: 17b82d12693866f7955ba7a2f562b62a ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "Reads ccdesignspecificationreference.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepAP203_CcDesignSpecificationReference

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepAP203_CcDesignSpecificationReference> & ent);

		/****************** Share ******************/
		/**** md5 signature: ef971d475ae91f57495913ab6cc61142 ****/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "Fills data for graph (shared items).

Parameters
----------
ent: StepAP203_CcDesignSpecificationReference
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepAP203_CcDesignSpecificationReference> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		/**** md5 signature: e6184ae1a22486d4fdad0b7b34269f4f ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "Writes ccdesignspecificationreference.

Parameters
----------
SW: StepData_StepWriter
ent: StepAP203_CcDesignSpecificationReference

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepAP203_CcDesignSpecificationReference> & ent);

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
		/**** md5 signature: 0b392e4ed0f24296ad08d26c4d1add07 ****/
		%feature("compactdefaultargs") RWStepAP203_RWChange;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepAP203_RWChange;
		 RWStepAP203_RWChange();

		/****************** ReadStep ******************/
		/**** md5 signature: a3d4c484e920b5c49cfaff5f304fc30e ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "Reads change.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepAP203_Change

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepAP203_Change> & ent);

		/****************** Share ******************/
		/**** md5 signature: 8d80f68aba0ee8966e74aac3948dd045 ****/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "Fills data for graph (shared items).

Parameters
----------
ent: StepAP203_Change
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepAP203_Change> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		/**** md5 signature: d65e3dae44d5a7a0e5ab8bd69d288c12 ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "Writes change.

Parameters
----------
SW: StepData_StepWriter
ent: StepAP203_Change

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepAP203_Change> & ent);

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
		/**** md5 signature: 5b0571dce26e4e0d727e0b6f603f1e8b ****/
		%feature("compactdefaultargs") RWStepAP203_RWChangeRequest;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepAP203_RWChangeRequest;
		 RWStepAP203_RWChangeRequest();

		/****************** ReadStep ******************/
		/**** md5 signature: 82fc03458a9ea6fd0e23d14b8b1cd06a ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "Reads changerequest.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepAP203_ChangeRequest

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepAP203_ChangeRequest> & ent);

		/****************** Share ******************/
		/**** md5 signature: dff7f9861d2c1a8bdf845fb16b238b85 ****/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "Fills data for graph (shared items).

Parameters
----------
ent: StepAP203_ChangeRequest
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepAP203_ChangeRequest> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		/**** md5 signature: 3bdac712d08292fbf1e8596f31c4ef5d ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "Writes changerequest.

Parameters
----------
SW: StepData_StepWriter
ent: StepAP203_ChangeRequest

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepAP203_ChangeRequest> & ent);

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
		/**** md5 signature: b70a4756c6c4428232410ae55a0d95a9 ****/
		%feature("compactdefaultargs") RWStepAP203_RWStartRequest;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepAP203_RWStartRequest;
		 RWStepAP203_RWStartRequest();

		/****************** ReadStep ******************/
		/**** md5 signature: 8e72f702b11dc7dc60fe24d39973f0c4 ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "Reads startrequest.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepAP203_StartRequest

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepAP203_StartRequest> & ent);

		/****************** Share ******************/
		/**** md5 signature: 620a06d8807ed2cf604bb57d62ea8007 ****/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "Fills data for graph (shared items).

Parameters
----------
ent: StepAP203_StartRequest
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepAP203_StartRequest> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		/**** md5 signature: 708083d7cf533895925708d03d695383 ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "Writes startrequest.

Parameters
----------
SW: StepData_StepWriter
ent: StepAP203_StartRequest

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepAP203_StartRequest> & ent);

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
		/**** md5 signature: 2360de80c72e905866993252d3854187 ****/
		%feature("compactdefaultargs") RWStepAP203_RWStartWork;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepAP203_RWStartWork;
		 RWStepAP203_RWStartWork();

		/****************** ReadStep ******************/
		/**** md5 signature: 52c8f540abf1c3204ce6551776d83710 ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "Reads startwork.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepAP203_StartWork

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepAP203_StartWork> & ent);

		/****************** Share ******************/
		/**** md5 signature: 0ea64323bf1db8c6bfe7911bc9d03d43 ****/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "Fills data for graph (shared items).

Parameters
----------
ent: StepAP203_StartWork
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepAP203_StartWork> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		/**** md5 signature: df852a6f0ad2a028affd92cd6f739cc9 ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "Writes startwork.

Parameters
----------
SW: StepData_StepWriter
ent: StepAP203_StartWork

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepAP203_StartWork> & ent);

};


%extend RWStepAP203_RWStartWork {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/* harray1 classes */
/* harray2 classes */
/* hsequence classes */
