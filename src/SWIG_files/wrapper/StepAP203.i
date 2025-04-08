/*
Copyright 2008-2024 Thomas Paviot (tpaviot@gmail.com)

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
%define STEPAP203DOCSTRING
"StepAP203 module, see official documentation at
https://dev.opencascade.org/doc/occt-7.8.0/refman/html/package_stepap203.html"
%enddef
%module (package="OCC.Core", docstring=STEPAP203DOCSTRING) StepAP203


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
#include<StepAP203_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<StepData_module.hxx>
#include<StepBasic_module.hxx>
#include<StepRepr_module.hxx>
#include<TCollection_module.hxx>
#include<Message_module.hxx>
#include<StepBasic_module.hxx>
#include<Interface_module.hxx>
#include<StepShape_module.hxx>
#include<StepGeom_module.hxx>
#include<MoniTool_module.hxx>
#include<TopoDS_module.hxx>
#include<Resource_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import StepData.i
%import StepBasic.i
%import StepRepr.i
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
%wrap_handle(StepAP203_CcDesignApproval)
%wrap_handle(StepAP203_CcDesignCertification)
%wrap_handle(StepAP203_CcDesignContract)
%wrap_handle(StepAP203_CcDesignDateAndTimeAssignment)
%wrap_handle(StepAP203_CcDesignPersonAndOrganizationAssignment)
%wrap_handle(StepAP203_CcDesignSecurityClassification)
%wrap_handle(StepAP203_CcDesignSpecificationReference)
%wrap_handle(StepAP203_Change)
%wrap_handle(StepAP203_ChangeRequest)
%wrap_handle(StepAP203_StartRequest)
%wrap_handle(StepAP203_StartWork)
%wrap_handle(StepAP203_HArray1OfApprovedItem)
%wrap_handle(StepAP203_HArray1OfCertifiedItem)
%wrap_handle(StepAP203_HArray1OfChangeRequestItem)
%wrap_handle(StepAP203_HArray1OfClassifiedItem)
%wrap_handle(StepAP203_HArray1OfContractedItem)
%wrap_handle(StepAP203_HArray1OfDateTimeItem)
%wrap_handle(StepAP203_HArray1OfPersonOrganizationItem)
%wrap_handle(StepAP203_HArray1OfSpecifiedItem)
%wrap_handle(StepAP203_HArray1OfStartRequestItem)
%wrap_handle(StepAP203_HArray1OfWorkItem)
/* end handles declaration */

/* templates */
%template(StepAP203_Array1OfApprovedItem) NCollection_Array1<StepAP203_ApprovedItem>;
Array1ExtendIter(StepAP203_ApprovedItem)

%template(StepAP203_Array1OfCertifiedItem) NCollection_Array1<StepAP203_CertifiedItem>;
Array1ExtendIter(StepAP203_CertifiedItem)

%template(StepAP203_Array1OfChangeRequestItem) NCollection_Array1<StepAP203_ChangeRequestItem>;
Array1ExtendIter(StepAP203_ChangeRequestItem)

%template(StepAP203_Array1OfClassifiedItem) NCollection_Array1<StepAP203_ClassifiedItem>;
Array1ExtendIter(StepAP203_ClassifiedItem)

%template(StepAP203_Array1OfContractedItem) NCollection_Array1<StepAP203_ContractedItem>;
Array1ExtendIter(StepAP203_ContractedItem)

%template(StepAP203_Array1OfDateTimeItem) NCollection_Array1<StepAP203_DateTimeItem>;
Array1ExtendIter(StepAP203_DateTimeItem)

%template(StepAP203_Array1OfPersonOrganizationItem) NCollection_Array1<StepAP203_PersonOrganizationItem>;
Array1ExtendIter(StepAP203_PersonOrganizationItem)

%template(StepAP203_Array1OfSpecifiedItem) NCollection_Array1<StepAP203_SpecifiedItem>;
Array1ExtendIter(StepAP203_SpecifiedItem)

%template(StepAP203_Array1OfStartRequestItem) NCollection_Array1<StepAP203_StartRequestItem>;
Array1ExtendIter(StepAP203_StartRequestItem)

%template(StepAP203_Array1OfWorkItem) NCollection_Array1<StepAP203_WorkItem>;
Array1ExtendIter(StepAP203_WorkItem)

/* end templates declaration */

/* typedefs */
typedef NCollection_Array1<StepAP203_ApprovedItem> StepAP203_Array1OfApprovedItem;
typedef NCollection_Array1<StepAP203_CertifiedItem> StepAP203_Array1OfCertifiedItem;
typedef NCollection_Array1<StepAP203_ChangeRequestItem> StepAP203_Array1OfChangeRequestItem;
typedef NCollection_Array1<StepAP203_ClassifiedItem> StepAP203_Array1OfClassifiedItem;
typedef NCollection_Array1<StepAP203_ContractedItem> StepAP203_Array1OfContractedItem;
typedef NCollection_Array1<StepAP203_DateTimeItem> StepAP203_Array1OfDateTimeItem;
typedef NCollection_Array1<StepAP203_PersonOrganizationItem> StepAP203_Array1OfPersonOrganizationItem;
typedef NCollection_Array1<StepAP203_SpecifiedItem> StepAP203_Array1OfSpecifiedItem;
typedef NCollection_Array1<StepAP203_StartRequestItem> StepAP203_Array1OfStartRequestItem;
typedef NCollection_Array1<StepAP203_WorkItem> StepAP203_Array1OfWorkItem;
/* end typedefs declaration */

/*******************************
* class StepAP203_ApprovedItem *
*******************************/
class StepAP203_ApprovedItem : public StepData_SelectType {
	public:
		/****** StepAP203_ApprovedItem::StepAP203_ApprovedItem ******/
		/****** md5 signature: 82da3dcb301978d49c8edd946dfd0798 ******/
		%feature("compactdefaultargs") StepAP203_ApprovedItem;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") StepAP203_ApprovedItem;
		 StepAP203_ApprovedItem();

		/****** StepAP203_ApprovedItem::CaseNum ******/
		/****** md5 signature: f0e39118a9846e44ccd59de148215261 ******/
		%feature("compactdefaultargs") CaseNum;
		%feature("autodoc", "
Parameters
----------
ent: Standard_Transient

Return
-------
int

Description
-----------
Recognizes a kind of ApprovedItem select type 1 -> ProductDefinitionFormation from StepBasic 2 -> ProductDefinition from StepBasic 3 -> ConfigurationEffectivity from StepRepr 4 -> ConfigurationItem from StepRepr 5 -> SecurityClassification from StepBasic 6 -> ChangeRequest from StepAP203 7 -> Change from StepAP203 8 -> StartRequest from StepAP203 9 -> StartWork from StepAP203 10 -> Certification from StepBasic 11 -> Contract from StepBasic 0 else.
") CaseNum;
		Standard_Integer CaseNum(const opencascade::handle<Standard_Transient> & ent);

		/****** StepAP203_ApprovedItem::Certification ******/
		/****** md5 signature: e4fcd85461a5932963bf7a1ac4f009a4 ******/
		%feature("compactdefaultargs") Certification;
		%feature("autodoc", "Return
-------
opencascade::handle<StepBasic_Certification>

Description
-----------
Returns Value as Certification (or Null if another type).
") Certification;
		opencascade::handle<StepBasic_Certification> Certification();

		/****** StepAP203_ApprovedItem::Change ******/
		/****** md5 signature: 45ba42050277592dfcd807d6ac427663 ******/
		%feature("compactdefaultargs") Change;
		%feature("autodoc", "Return
-------
opencascade::handle<StepAP203_Change>

Description
-----------
Returns Value as Change (or Null if another type).
") Change;
		opencascade::handle<StepAP203_Change> Change();

		/****** StepAP203_ApprovedItem::ChangeRequest ******/
		/****** md5 signature: 716df3705f0b67fd35b2cdb84938decd ******/
		%feature("compactdefaultargs") ChangeRequest;
		%feature("autodoc", "Return
-------
opencascade::handle<StepAP203_ChangeRequest>

Description
-----------
Returns Value as ChangeRequest (or Null if another type).
") ChangeRequest;
		opencascade::handle<StepAP203_ChangeRequest> ChangeRequest();

		/****** StepAP203_ApprovedItem::ConfigurationEffectivity ******/
		/****** md5 signature: 9f4b53b4b2fa9455f7a05b320cd8f30c ******/
		%feature("compactdefaultargs") ConfigurationEffectivity;
		%feature("autodoc", "Return
-------
opencascade::handle<StepRepr_ConfigurationEffectivity>

Description
-----------
Returns Value as ConfigurationEffectivity (or Null if another type).
") ConfigurationEffectivity;
		opencascade::handle<StepRepr_ConfigurationEffectivity> ConfigurationEffectivity();

		/****** StepAP203_ApprovedItem::ConfigurationItem ******/
		/****** md5 signature: 19e20aa72323442204af7943ab5779ab ******/
		%feature("compactdefaultargs") ConfigurationItem;
		%feature("autodoc", "Return
-------
opencascade::handle<StepRepr_ConfigurationItem>

Description
-----------
Returns Value as ConfigurationItem (or Null if another type).
") ConfigurationItem;
		opencascade::handle<StepRepr_ConfigurationItem> ConfigurationItem();

		/****** StepAP203_ApprovedItem::Contract ******/
		/****** md5 signature: 516418a4278fba9ddb098e0ec67421dd ******/
		%feature("compactdefaultargs") Contract;
		%feature("autodoc", "Return
-------
opencascade::handle<StepBasic_Contract>

Description
-----------
Returns Value as Contract (or Null if another type).
") Contract;
		opencascade::handle<StepBasic_Contract> Contract();

		/****** StepAP203_ApprovedItem::ProductDefinition ******/
		/****** md5 signature: d43b5ca42d8380c05af7f64fb041e89b ******/
		%feature("compactdefaultargs") ProductDefinition;
		%feature("autodoc", "Return
-------
opencascade::handle<StepBasic_ProductDefinition>

Description
-----------
Returns Value as ProductDefinition (or Null if another type).
") ProductDefinition;
		opencascade::handle<StepBasic_ProductDefinition> ProductDefinition();

		/****** StepAP203_ApprovedItem::ProductDefinitionFormation ******/
		/****** md5 signature: 549b153d5236bb5dda717eed81e28565 ******/
		%feature("compactdefaultargs") ProductDefinitionFormation;
		%feature("autodoc", "Return
-------
opencascade::handle<StepBasic_ProductDefinitionFormation>

Description
-----------
Returns Value as ProductDefinitionFormation (or Null if another type).
") ProductDefinitionFormation;
		opencascade::handle<StepBasic_ProductDefinitionFormation> ProductDefinitionFormation();

		/****** StepAP203_ApprovedItem::SecurityClassification ******/
		/****** md5 signature: 5a1ef075f0f272079bd532895ecc4299 ******/
		%feature("compactdefaultargs") SecurityClassification;
		%feature("autodoc", "Return
-------
opencascade::handle<StepBasic_SecurityClassification>

Description
-----------
Returns Value as SecurityClassification (or Null if another type).
") SecurityClassification;
		opencascade::handle<StepBasic_SecurityClassification> SecurityClassification();

		/****** StepAP203_ApprovedItem::StartRequest ******/
		/****** md5 signature: 8f24598754db81d3836d88643a7a9ed1 ******/
		%feature("compactdefaultargs") StartRequest;
		%feature("autodoc", "Return
-------
opencascade::handle<StepAP203_StartRequest>

Description
-----------
Returns Value as StartRequest (or Null if another type).
") StartRequest;
		opencascade::handle<StepAP203_StartRequest> StartRequest();

		/****** StepAP203_ApprovedItem::StartWork ******/
		/****** md5 signature: 3f4501e47c294626db8d74214f59a29f ******/
		%feature("compactdefaultargs") StartWork;
		%feature("autodoc", "Return
-------
opencascade::handle<StepAP203_StartWork>

Description
-----------
Returns Value as StartWork (or Null if another type).
") StartWork;
		opencascade::handle<StepAP203_StartWork> StartWork();

};


%extend StepAP203_ApprovedItem {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************************
* class StepAP203_CcDesignApproval *
***********************************/
class StepAP203_CcDesignApproval : public StepBasic_ApprovalAssignment {
	public:
		/****** StepAP203_CcDesignApproval::StepAP203_CcDesignApproval ******/
		/****** md5 signature: d691147dec88b8ef57eb147844de9b21 ******/
		%feature("compactdefaultargs") StepAP203_CcDesignApproval;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") StepAP203_CcDesignApproval;
		 StepAP203_CcDesignApproval();

		/****** StepAP203_CcDesignApproval::Init ******/
		/****** md5 signature: b0f6754ad5bfa2ccbf314441d1ced319 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
aApprovalAssignment_AssignedApproval: StepBasic_Approval
aItems: StepAP203_HArray1OfApprovedItem

Return
-------
None

Description
-----------
Initialize all fields (own and inherited).
") Init;
		void Init(const opencascade::handle<StepBasic_Approval> & aApprovalAssignment_AssignedApproval, const opencascade::handle<StepAP203_HArray1OfApprovedItem> & aItems);

		/****** StepAP203_CcDesignApproval::Items ******/
		/****** md5 signature: 3e0c43c9a1b902045c545b63f098a5be ******/
		%feature("compactdefaultargs") Items;
		%feature("autodoc", "Return
-------
opencascade::handle<StepAP203_HArray1OfApprovedItem>

Description
-----------
Returns field Items.
") Items;
		opencascade::handle<StepAP203_HArray1OfApprovedItem> Items();

		/****** StepAP203_CcDesignApproval::SetItems ******/
		/****** md5 signature: cdf24d3db5cd0ede0924b4ea77f68c65 ******/
		%feature("compactdefaultargs") SetItems;
		%feature("autodoc", "
Parameters
----------
Items: StepAP203_HArray1OfApprovedItem

Return
-------
None

Description
-----------
Set field Items.
") SetItems;
		void SetItems(const opencascade::handle<StepAP203_HArray1OfApprovedItem> & Items);

};


%make_alias(StepAP203_CcDesignApproval)

%extend StepAP203_CcDesignApproval {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************************
* class StepAP203_CcDesignCertification *
****************************************/
class StepAP203_CcDesignCertification : public StepBasic_CertificationAssignment {
	public:
		/****** StepAP203_CcDesignCertification::StepAP203_CcDesignCertification ******/
		/****** md5 signature: fbe9182c8cda9513bb3dbba5683ea253 ******/
		%feature("compactdefaultargs") StepAP203_CcDesignCertification;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") StepAP203_CcDesignCertification;
		 StepAP203_CcDesignCertification();

		/****** StepAP203_CcDesignCertification::Init ******/
		/****** md5 signature: 6d47bab477dd75efcf248739eacd81e1 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
aCertificationAssignment_AssignedCertification: StepBasic_Certification
aItems: StepAP203_HArray1OfCertifiedItem

Return
-------
None

Description
-----------
Initialize all fields (own and inherited).
") Init;
		void Init(const opencascade::handle<StepBasic_Certification> & aCertificationAssignment_AssignedCertification, const opencascade::handle<StepAP203_HArray1OfCertifiedItem> & aItems);

		/****** StepAP203_CcDesignCertification::Items ******/
		/****** md5 signature: 82fb4d8199447a39079d491c5ef747c2 ******/
		%feature("compactdefaultargs") Items;
		%feature("autodoc", "Return
-------
opencascade::handle<StepAP203_HArray1OfCertifiedItem>

Description
-----------
Returns field Items.
") Items;
		opencascade::handle<StepAP203_HArray1OfCertifiedItem> Items();

		/****** StepAP203_CcDesignCertification::SetItems ******/
		/****** md5 signature: 729eb60287db29f9f5f440a44def8231 ******/
		%feature("compactdefaultargs") SetItems;
		%feature("autodoc", "
Parameters
----------
Items: StepAP203_HArray1OfCertifiedItem

Return
-------
None

Description
-----------
Set field Items.
") SetItems;
		void SetItems(const opencascade::handle<StepAP203_HArray1OfCertifiedItem> & Items);

};


%make_alias(StepAP203_CcDesignCertification)

%extend StepAP203_CcDesignCertification {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************************
* class StepAP203_CcDesignContract *
***********************************/
class StepAP203_CcDesignContract : public StepBasic_ContractAssignment {
	public:
		/****** StepAP203_CcDesignContract::StepAP203_CcDesignContract ******/
		/****** md5 signature: 7bdb5ed85e5006d86f8fe6e6e13db026 ******/
		%feature("compactdefaultargs") StepAP203_CcDesignContract;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") StepAP203_CcDesignContract;
		 StepAP203_CcDesignContract();

		/****** StepAP203_CcDesignContract::Init ******/
		/****** md5 signature: 0625c9f2e1cc037237e83e188d1a1520 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
aContractAssignment_AssignedContract: StepBasic_Contract
aItems: StepAP203_HArray1OfContractedItem

Return
-------
None

Description
-----------
Initialize all fields (own and inherited).
") Init;
		void Init(const opencascade::handle<StepBasic_Contract> & aContractAssignment_AssignedContract, const opencascade::handle<StepAP203_HArray1OfContractedItem> & aItems);

		/****** StepAP203_CcDesignContract::Items ******/
		/****** md5 signature: 4029d34d684086ba4581879e50159de2 ******/
		%feature("compactdefaultargs") Items;
		%feature("autodoc", "Return
-------
opencascade::handle<StepAP203_HArray1OfContractedItem>

Description
-----------
Returns field Items.
") Items;
		opencascade::handle<StepAP203_HArray1OfContractedItem> Items();

		/****** StepAP203_CcDesignContract::SetItems ******/
		/****** md5 signature: 14f59215e3e32347cf5f2e87c15a0c33 ******/
		%feature("compactdefaultargs") SetItems;
		%feature("autodoc", "
Parameters
----------
Items: StepAP203_HArray1OfContractedItem

Return
-------
None

Description
-----------
Set field Items.
") SetItems;
		void SetItems(const opencascade::handle<StepAP203_HArray1OfContractedItem> & Items);

};


%make_alias(StepAP203_CcDesignContract)

%extend StepAP203_CcDesignContract {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************************************
* class StepAP203_CcDesignDateAndTimeAssignment *
************************************************/
class StepAP203_CcDesignDateAndTimeAssignment : public StepBasic_DateAndTimeAssignment {
	public:
		/****** StepAP203_CcDesignDateAndTimeAssignment::StepAP203_CcDesignDateAndTimeAssignment ******/
		/****** md5 signature: 57dbf8c6f31d9c8a1e4e7ca7ea2ca1a2 ******/
		%feature("compactdefaultargs") StepAP203_CcDesignDateAndTimeAssignment;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") StepAP203_CcDesignDateAndTimeAssignment;
		 StepAP203_CcDesignDateAndTimeAssignment();

		/****** StepAP203_CcDesignDateAndTimeAssignment::Init ******/
		/****** md5 signature: c9caa4bd465b7af0e2319487aa1fc334 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
aDateAndTimeAssignment_AssignedDateAndTime: StepBasic_DateAndTime
aDateAndTimeAssignment_Role: StepBasic_DateTimeRole
aItems: StepAP203_HArray1OfDateTimeItem

Return
-------
None

Description
-----------
Initialize all fields (own and inherited).
") Init;
		void Init(const opencascade::handle<StepBasic_DateAndTime> & aDateAndTimeAssignment_AssignedDateAndTime, const opencascade::handle<StepBasic_DateTimeRole> & aDateAndTimeAssignment_Role, const opencascade::handle<StepAP203_HArray1OfDateTimeItem> & aItems);

		/****** StepAP203_CcDesignDateAndTimeAssignment::Items ******/
		/****** md5 signature: b1c2a88e6d352404197fe738da682c5e ******/
		%feature("compactdefaultargs") Items;
		%feature("autodoc", "Return
-------
opencascade::handle<StepAP203_HArray1OfDateTimeItem>

Description
-----------
Returns field Items.
") Items;
		opencascade::handle<StepAP203_HArray1OfDateTimeItem> Items();

		/****** StepAP203_CcDesignDateAndTimeAssignment::SetItems ******/
		/****** md5 signature: d90d59ab538a0d627c493c5a27b3e195 ******/
		%feature("compactdefaultargs") SetItems;
		%feature("autodoc", "
Parameters
----------
Items: StepAP203_HArray1OfDateTimeItem

Return
-------
None

Description
-----------
Set field Items.
") SetItems;
		void SetItems(const opencascade::handle<StepAP203_HArray1OfDateTimeItem> & Items);

};


%make_alias(StepAP203_CcDesignDateAndTimeAssignment)

%extend StepAP203_CcDesignDateAndTimeAssignment {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************************************************
* class StepAP203_CcDesignPersonAndOrganizationAssignment *
**********************************************************/
class StepAP203_CcDesignPersonAndOrganizationAssignment : public StepBasic_PersonAndOrganizationAssignment {
	public:
		/****** StepAP203_CcDesignPersonAndOrganizationAssignment::StepAP203_CcDesignPersonAndOrganizationAssignment ******/
		/****** md5 signature: a2ed5c02db47051aca00a757298f075b ******/
		%feature("compactdefaultargs") StepAP203_CcDesignPersonAndOrganizationAssignment;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") StepAP203_CcDesignPersonAndOrganizationAssignment;
		 StepAP203_CcDesignPersonAndOrganizationAssignment();

		/****** StepAP203_CcDesignPersonAndOrganizationAssignment::Init ******/
		/****** md5 signature: 7f084c2e757b7b7baed5b21ec699c363 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
aPersonAndOrganizationAssignment_AssignedPersonAndOrganization: StepBasic_PersonAndOrganization
aPersonAndOrganizationAssignment_Role: StepBasic_PersonAndOrganizationRole
aItems: StepAP203_HArray1OfPersonOrganizationItem

Return
-------
None

Description
-----------
Initialize all fields (own and inherited).
") Init;
		void Init(const opencascade::handle<StepBasic_PersonAndOrganization> & aPersonAndOrganizationAssignment_AssignedPersonAndOrganization, const opencascade::handle<StepBasic_PersonAndOrganizationRole> & aPersonAndOrganizationAssignment_Role, const opencascade::handle<StepAP203_HArray1OfPersonOrganizationItem> & aItems);

		/****** StepAP203_CcDesignPersonAndOrganizationAssignment::Items ******/
		/****** md5 signature: 79252d9dba768943961d2b4c9560bf49 ******/
		%feature("compactdefaultargs") Items;
		%feature("autodoc", "Return
-------
opencascade::handle<StepAP203_HArray1OfPersonOrganizationItem>

Description
-----------
Returns field Items.
") Items;
		opencascade::handle<StepAP203_HArray1OfPersonOrganizationItem> Items();

		/****** StepAP203_CcDesignPersonAndOrganizationAssignment::SetItems ******/
		/****** md5 signature: 362a13e43843d28d9fb00bdfe9830f3e ******/
		%feature("compactdefaultargs") SetItems;
		%feature("autodoc", "
Parameters
----------
Items: StepAP203_HArray1OfPersonOrganizationItem

Return
-------
None

Description
-----------
Set field Items.
") SetItems;
		void SetItems(const opencascade::handle<StepAP203_HArray1OfPersonOrganizationItem> & Items);

};


%make_alias(StepAP203_CcDesignPersonAndOrganizationAssignment)

%extend StepAP203_CcDesignPersonAndOrganizationAssignment {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************************************
* class StepAP203_CcDesignSecurityClassification *
*************************************************/
class StepAP203_CcDesignSecurityClassification : public StepBasic_SecurityClassificationAssignment {
	public:
		/****** StepAP203_CcDesignSecurityClassification::StepAP203_CcDesignSecurityClassification ******/
		/****** md5 signature: ab358d146474b2c4d959e7ffbbcc0f68 ******/
		%feature("compactdefaultargs") StepAP203_CcDesignSecurityClassification;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") StepAP203_CcDesignSecurityClassification;
		 StepAP203_CcDesignSecurityClassification();

		/****** StepAP203_CcDesignSecurityClassification::Init ******/
		/****** md5 signature: 47ecb1bc1d5b73f30e71202368db7d8f ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
aSecurityClassificationAssignment_AssignedSecurityClassification: StepBasic_SecurityClassification
aItems: StepAP203_HArray1OfClassifiedItem

Return
-------
None

Description
-----------
Initialize all fields (own and inherited).
") Init;
		void Init(const opencascade::handle<StepBasic_SecurityClassification> & aSecurityClassificationAssignment_AssignedSecurityClassification, const opencascade::handle<StepAP203_HArray1OfClassifiedItem> & aItems);

		/****** StepAP203_CcDesignSecurityClassification::Items ******/
		/****** md5 signature: ff874a2aac4f1181827a3c1621be8055 ******/
		%feature("compactdefaultargs") Items;
		%feature("autodoc", "Return
-------
opencascade::handle<StepAP203_HArray1OfClassifiedItem>

Description
-----------
Returns field Items.
") Items;
		opencascade::handle<StepAP203_HArray1OfClassifiedItem> Items();

		/****** StepAP203_CcDesignSecurityClassification::SetItems ******/
		/****** md5 signature: 80d07f9c40d3de42fa5552cd1c8a5768 ******/
		%feature("compactdefaultargs") SetItems;
		%feature("autodoc", "
Parameters
----------
Items: StepAP203_HArray1OfClassifiedItem

Return
-------
None

Description
-----------
Set field Items.
") SetItems;
		void SetItems(const opencascade::handle<StepAP203_HArray1OfClassifiedItem> & Items);

};


%make_alias(StepAP203_CcDesignSecurityClassification)

%extend StepAP203_CcDesignSecurityClassification {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************************************
* class StepAP203_CcDesignSpecificationReference *
*************************************************/
class StepAP203_CcDesignSpecificationReference : public StepBasic_DocumentReference {
	public:
		/****** StepAP203_CcDesignSpecificationReference::StepAP203_CcDesignSpecificationReference ******/
		/****** md5 signature: 93efe43c55d2d07b60ff869da1e420f1 ******/
		%feature("compactdefaultargs") StepAP203_CcDesignSpecificationReference;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") StepAP203_CcDesignSpecificationReference;
		 StepAP203_CcDesignSpecificationReference();

		/****** StepAP203_CcDesignSpecificationReference::Init ******/
		/****** md5 signature: 404a8e64b91deee4db632c695e5d36c1 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
aDocumentReference_AssignedDocument: StepBasic_Document
aDocumentReference_Source: TCollection_HAsciiString
aItems: StepAP203_HArray1OfSpecifiedItem

Return
-------
None

Description
-----------
Initialize all fields (own and inherited).
") Init;
		void Init(const opencascade::handle<StepBasic_Document> & aDocumentReference_AssignedDocument, const opencascade::handle<TCollection_HAsciiString> & aDocumentReference_Source, const opencascade::handle<StepAP203_HArray1OfSpecifiedItem> & aItems);

		/****** StepAP203_CcDesignSpecificationReference::Items ******/
		/****** md5 signature: f2200bd42168ec8cd03d8ca5b25e1993 ******/
		%feature("compactdefaultargs") Items;
		%feature("autodoc", "Return
-------
opencascade::handle<StepAP203_HArray1OfSpecifiedItem>

Description
-----------
Returns field Items.
") Items;
		opencascade::handle<StepAP203_HArray1OfSpecifiedItem> Items();

		/****** StepAP203_CcDesignSpecificationReference::SetItems ******/
		/****** md5 signature: 4c57ff2a1db6ce89384bd2aa7948182d ******/
		%feature("compactdefaultargs") SetItems;
		%feature("autodoc", "
Parameters
----------
Items: StepAP203_HArray1OfSpecifiedItem

Return
-------
None

Description
-----------
Set field Items.
") SetItems;
		void SetItems(const opencascade::handle<StepAP203_HArray1OfSpecifiedItem> & Items);

};


%make_alias(StepAP203_CcDesignSpecificationReference)

%extend StepAP203_CcDesignSpecificationReference {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************
* class StepAP203_CertifiedItem *
********************************/
class StepAP203_CertifiedItem : public StepData_SelectType {
	public:
		/****** StepAP203_CertifiedItem::StepAP203_CertifiedItem ******/
		/****** md5 signature: 199d7e1d24799b561b65ce3132db18db ******/
		%feature("compactdefaultargs") StepAP203_CertifiedItem;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") StepAP203_CertifiedItem;
		 StepAP203_CertifiedItem();

		/****** StepAP203_CertifiedItem::CaseNum ******/
		/****** md5 signature: f0e39118a9846e44ccd59de148215261 ******/
		%feature("compactdefaultargs") CaseNum;
		%feature("autodoc", "
Parameters
----------
ent: Standard_Transient

Return
-------
int

Description
-----------
Recognizes a kind of CertifiedItem select type 1 -> SuppliedPartRelationship from StepRepr 0 else.
") CaseNum;
		Standard_Integer CaseNum(const opencascade::handle<Standard_Transient> & ent);

		/****** StepAP203_CertifiedItem::SuppliedPartRelationship ******/
		/****** md5 signature: 82f31c1241b11735fcdd0b11a9fea9a0 ******/
		%feature("compactdefaultargs") SuppliedPartRelationship;
		%feature("autodoc", "Return
-------
opencascade::handle<StepRepr_SuppliedPartRelationship>

Description
-----------
Returns Value as SuppliedPartRelationship (or Null if another type).
") SuppliedPartRelationship;
		opencascade::handle<StepRepr_SuppliedPartRelationship> SuppliedPartRelationship();

};


%extend StepAP203_CertifiedItem {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************
* class StepAP203_Change *
*************************/
class StepAP203_Change : public StepBasic_ActionAssignment {
	public:
		/****** StepAP203_Change::StepAP203_Change ******/
		/****** md5 signature: 3dfb20c6365abb9cbe1fdda05d415363 ******/
		%feature("compactdefaultargs") StepAP203_Change;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") StepAP203_Change;
		 StepAP203_Change();

		/****** StepAP203_Change::Init ******/
		/****** md5 signature: 426f4ad0835cd6d75198846fdbb79aae ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
aActionAssignment_AssignedAction: StepBasic_Action
aItems: StepAP203_HArray1OfWorkItem

Return
-------
None

Description
-----------
Initialize all fields (own and inherited).
") Init;
		void Init(const opencascade::handle<StepBasic_Action> & aActionAssignment_AssignedAction, const opencascade::handle<StepAP203_HArray1OfWorkItem> & aItems);

		/****** StepAP203_Change::Items ******/
		/****** md5 signature: da8df3751d3f4dbe5fbc1686a49a6ff8 ******/
		%feature("compactdefaultargs") Items;
		%feature("autodoc", "Return
-------
opencascade::handle<StepAP203_HArray1OfWorkItem>

Description
-----------
Returns field Items.
") Items;
		opencascade::handle<StepAP203_HArray1OfWorkItem> Items();

		/****** StepAP203_Change::SetItems ******/
		/****** md5 signature: 560f3192ead2495f8e28aed14d1b8ccb ******/
		%feature("compactdefaultargs") SetItems;
		%feature("autodoc", "
Parameters
----------
Items: StepAP203_HArray1OfWorkItem

Return
-------
None

Description
-----------
Set field Items.
") SetItems;
		void SetItems(const opencascade::handle<StepAP203_HArray1OfWorkItem> & Items);

};


%make_alias(StepAP203_Change)

%extend StepAP203_Change {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************
* class StepAP203_ChangeRequest *
********************************/
class StepAP203_ChangeRequest : public StepBasic_ActionRequestAssignment {
	public:
		/****** StepAP203_ChangeRequest::StepAP203_ChangeRequest ******/
		/****** md5 signature: 543fe59a78da490926779f3af0d0a4e3 ******/
		%feature("compactdefaultargs") StepAP203_ChangeRequest;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") StepAP203_ChangeRequest;
		 StepAP203_ChangeRequest();

		/****** StepAP203_ChangeRequest::Init ******/
		/****** md5 signature: 7f289c3ecc4e259b591d39e41ab8c3b8 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
aActionRequestAssignment_AssignedActionRequest: StepBasic_VersionedActionRequest
aItems: StepAP203_HArray1OfChangeRequestItem

Return
-------
None

Description
-----------
Initialize all fields (own and inherited).
") Init;
		void Init(const opencascade::handle<StepBasic_VersionedActionRequest> & aActionRequestAssignment_AssignedActionRequest, const opencascade::handle<StepAP203_HArray1OfChangeRequestItem> & aItems);

		/****** StepAP203_ChangeRequest::Items ******/
		/****** md5 signature: 81792f1414ba5a02b751f1c89437a316 ******/
		%feature("compactdefaultargs") Items;
		%feature("autodoc", "Return
-------
opencascade::handle<StepAP203_HArray1OfChangeRequestItem>

Description
-----------
Returns field Items.
") Items;
		opencascade::handle<StepAP203_HArray1OfChangeRequestItem> Items();

		/****** StepAP203_ChangeRequest::SetItems ******/
		/****** md5 signature: 6da531119799dcb7df5bd2264277b4bb ******/
		%feature("compactdefaultargs") SetItems;
		%feature("autodoc", "
Parameters
----------
Items: StepAP203_HArray1OfChangeRequestItem

Return
-------
None

Description
-----------
Set field Items.
") SetItems;
		void SetItems(const opencascade::handle<StepAP203_HArray1OfChangeRequestItem> & Items);

};


%make_alias(StepAP203_ChangeRequest)

%extend StepAP203_ChangeRequest {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************************
* class StepAP203_ChangeRequestItem *
************************************/
class StepAP203_ChangeRequestItem : public StepData_SelectType {
	public:
		/****** StepAP203_ChangeRequestItem::StepAP203_ChangeRequestItem ******/
		/****** md5 signature: c091eeaae978495b9719faae5dbf194d ******/
		%feature("compactdefaultargs") StepAP203_ChangeRequestItem;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") StepAP203_ChangeRequestItem;
		 StepAP203_ChangeRequestItem();

		/****** StepAP203_ChangeRequestItem::CaseNum ******/
		/****** md5 signature: f0e39118a9846e44ccd59de148215261 ******/
		%feature("compactdefaultargs") CaseNum;
		%feature("autodoc", "
Parameters
----------
ent: Standard_Transient

Return
-------
int

Description
-----------
Recognizes a kind of ChangeRequestItem select type 1 -> ProductDefinitionFormation from StepBasic 0 else.
") CaseNum;
		Standard_Integer CaseNum(const opencascade::handle<Standard_Transient> & ent);

		/****** StepAP203_ChangeRequestItem::ProductDefinitionFormation ******/
		/****** md5 signature: 549b153d5236bb5dda717eed81e28565 ******/
		%feature("compactdefaultargs") ProductDefinitionFormation;
		%feature("autodoc", "Return
-------
opencascade::handle<StepBasic_ProductDefinitionFormation>

Description
-----------
Returns Value as ProductDefinitionFormation (or Null if another type).
") ProductDefinitionFormation;
		opencascade::handle<StepBasic_ProductDefinitionFormation> ProductDefinitionFormation();

};


%extend StepAP203_ChangeRequestItem {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************
* class StepAP203_ClassifiedItem *
*********************************/
class StepAP203_ClassifiedItem : public StepData_SelectType {
	public:
		/****** StepAP203_ClassifiedItem::StepAP203_ClassifiedItem ******/
		/****** md5 signature: 962ec404da259d5368585e21001ab3a9 ******/
		%feature("compactdefaultargs") StepAP203_ClassifiedItem;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") StepAP203_ClassifiedItem;
		 StepAP203_ClassifiedItem();

		/****** StepAP203_ClassifiedItem::AssemblyComponentUsage ******/
		/****** md5 signature: 9bdb67c5d71ecf8f82c68cc59b16ef47 ******/
		%feature("compactdefaultargs") AssemblyComponentUsage;
		%feature("autodoc", "Return
-------
opencascade::handle<StepRepr_AssemblyComponentUsage>

Description
-----------
Returns Value as AssemblyComponentUsage (or Null if another type).
") AssemblyComponentUsage;
		opencascade::handle<StepRepr_AssemblyComponentUsage> AssemblyComponentUsage();

		/****** StepAP203_ClassifiedItem::CaseNum ******/
		/****** md5 signature: f0e39118a9846e44ccd59de148215261 ******/
		%feature("compactdefaultargs") CaseNum;
		%feature("autodoc", "
Parameters
----------
ent: Standard_Transient

Return
-------
int

Description
-----------
Recognizes a kind of ClassifiedItem select type 1 -> ProductDefinitionFormation from StepBasic 2 -> AssemblyComponentUsage from StepRepr 0 else.
") CaseNum;
		Standard_Integer CaseNum(const opencascade::handle<Standard_Transient> & ent);

		/****** StepAP203_ClassifiedItem::ProductDefinitionFormation ******/
		/****** md5 signature: 549b153d5236bb5dda717eed81e28565 ******/
		%feature("compactdefaultargs") ProductDefinitionFormation;
		%feature("autodoc", "Return
-------
opencascade::handle<StepBasic_ProductDefinitionFormation>

Description
-----------
Returns Value as ProductDefinitionFormation (or Null if another type).
") ProductDefinitionFormation;
		opencascade::handle<StepBasic_ProductDefinitionFormation> ProductDefinitionFormation();

};


%extend StepAP203_ClassifiedItem {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************
* class StepAP203_ContractedItem *
*********************************/
class StepAP203_ContractedItem : public StepData_SelectType {
	public:
		/****** StepAP203_ContractedItem::StepAP203_ContractedItem ******/
		/****** md5 signature: 061bb29cfdf9e7cce86a7e6ad71311c3 ******/
		%feature("compactdefaultargs") StepAP203_ContractedItem;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") StepAP203_ContractedItem;
		 StepAP203_ContractedItem();

		/****** StepAP203_ContractedItem::CaseNum ******/
		/****** md5 signature: f0e39118a9846e44ccd59de148215261 ******/
		%feature("compactdefaultargs") CaseNum;
		%feature("autodoc", "
Parameters
----------
ent: Standard_Transient

Return
-------
int

Description
-----------
Recognizes a kind of ContractedItem select type 1 -> ProductDefinitionFormation from StepBasic 0 else.
") CaseNum;
		Standard_Integer CaseNum(const opencascade::handle<Standard_Transient> & ent);

		/****** StepAP203_ContractedItem::ProductDefinitionFormation ******/
		/****** md5 signature: 549b153d5236bb5dda717eed81e28565 ******/
		%feature("compactdefaultargs") ProductDefinitionFormation;
		%feature("autodoc", "Return
-------
opencascade::handle<StepBasic_ProductDefinitionFormation>

Description
-----------
Returns Value as ProductDefinitionFormation (or Null if another type).
") ProductDefinitionFormation;
		opencascade::handle<StepBasic_ProductDefinitionFormation> ProductDefinitionFormation();

};


%extend StepAP203_ContractedItem {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************
* class StepAP203_DateTimeItem *
*******************************/
class StepAP203_DateTimeItem : public StepData_SelectType {
	public:
		/****** StepAP203_DateTimeItem::StepAP203_DateTimeItem ******/
		/****** md5 signature: 2a149b72a4810597fc0bbf4fadf730e8 ******/
		%feature("compactdefaultargs") StepAP203_DateTimeItem;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") StepAP203_DateTimeItem;
		 StepAP203_DateTimeItem();

		/****** StepAP203_DateTimeItem::ApprovalPersonOrganization ******/
		/****** md5 signature: af795dc9d70028f3b512bd493ca8a169 ******/
		%feature("compactdefaultargs") ApprovalPersonOrganization;
		%feature("autodoc", "Return
-------
opencascade::handle<StepBasic_ApprovalPersonOrganization>

Description
-----------
Returns Value as ApprovalPersonOrganization (or Null if another type).
") ApprovalPersonOrganization;
		opencascade::handle<StepBasic_ApprovalPersonOrganization> ApprovalPersonOrganization();

		/****** StepAP203_DateTimeItem::CaseNum ******/
		/****** md5 signature: f0e39118a9846e44ccd59de148215261 ******/
		%feature("compactdefaultargs") CaseNum;
		%feature("autodoc", "
Parameters
----------
ent: Standard_Transient

Return
-------
int

Description
-----------
Recognizes a kind of DateTimeItem select type 1 -> ProductDefinition from StepBasic 2 -> ChangeRequest from StepAP203 3 -> StartRequest from StepAP203 4 -> Change from StepAP203 5 -> StartWork from StepAP203 6 -> ApprovalPersonOrganization from StepBasic 7 -> Contract from StepBasic 8 -> SecurityClassification from StepBasic 9 -> Certification from StepBasic 0 else.
") CaseNum;
		Standard_Integer CaseNum(const opencascade::handle<Standard_Transient> & ent);

		/****** StepAP203_DateTimeItem::Certification ******/
		/****** md5 signature: e4fcd85461a5932963bf7a1ac4f009a4 ******/
		%feature("compactdefaultargs") Certification;
		%feature("autodoc", "Return
-------
opencascade::handle<StepBasic_Certification>

Description
-----------
Returns Value as Certification (or Null if another type).
") Certification;
		opencascade::handle<StepBasic_Certification> Certification();

		/****** StepAP203_DateTimeItem::Change ******/
		/****** md5 signature: 45ba42050277592dfcd807d6ac427663 ******/
		%feature("compactdefaultargs") Change;
		%feature("autodoc", "Return
-------
opencascade::handle<StepAP203_Change>

Description
-----------
Returns Value as Change (or Null if another type).
") Change;
		opencascade::handle<StepAP203_Change> Change();

		/****** StepAP203_DateTimeItem::ChangeRequest ******/
		/****** md5 signature: 716df3705f0b67fd35b2cdb84938decd ******/
		%feature("compactdefaultargs") ChangeRequest;
		%feature("autodoc", "Return
-------
opencascade::handle<StepAP203_ChangeRequest>

Description
-----------
Returns Value as ChangeRequest (or Null if another type).
") ChangeRequest;
		opencascade::handle<StepAP203_ChangeRequest> ChangeRequest();

		/****** StepAP203_DateTimeItem::Contract ******/
		/****** md5 signature: 516418a4278fba9ddb098e0ec67421dd ******/
		%feature("compactdefaultargs") Contract;
		%feature("autodoc", "Return
-------
opencascade::handle<StepBasic_Contract>

Description
-----------
Returns Value as Contract (or Null if another type).
") Contract;
		opencascade::handle<StepBasic_Contract> Contract();

		/****** StepAP203_DateTimeItem::ProductDefinition ******/
		/****** md5 signature: d43b5ca42d8380c05af7f64fb041e89b ******/
		%feature("compactdefaultargs") ProductDefinition;
		%feature("autodoc", "Return
-------
opencascade::handle<StepBasic_ProductDefinition>

Description
-----------
Returns Value as ProductDefinition (or Null if another type).
") ProductDefinition;
		opencascade::handle<StepBasic_ProductDefinition> ProductDefinition();

		/****** StepAP203_DateTimeItem::SecurityClassification ******/
		/****** md5 signature: 5a1ef075f0f272079bd532895ecc4299 ******/
		%feature("compactdefaultargs") SecurityClassification;
		%feature("autodoc", "Return
-------
opencascade::handle<StepBasic_SecurityClassification>

Description
-----------
Returns Value as SecurityClassification (or Null if another type).
") SecurityClassification;
		opencascade::handle<StepBasic_SecurityClassification> SecurityClassification();

		/****** StepAP203_DateTimeItem::StartRequest ******/
		/****** md5 signature: 8f24598754db81d3836d88643a7a9ed1 ******/
		%feature("compactdefaultargs") StartRequest;
		%feature("autodoc", "Return
-------
opencascade::handle<StepAP203_StartRequest>

Description
-----------
Returns Value as StartRequest (or Null if another type).
") StartRequest;
		opencascade::handle<StepAP203_StartRequest> StartRequest();

		/****** StepAP203_DateTimeItem::StartWork ******/
		/****** md5 signature: 3f4501e47c294626db8d74214f59a29f ******/
		%feature("compactdefaultargs") StartWork;
		%feature("autodoc", "Return
-------
opencascade::handle<StepAP203_StartWork>

Description
-----------
Returns Value as StartWork (or Null if another type).
") StartWork;
		opencascade::handle<StepAP203_StartWork> StartWork();

};


%extend StepAP203_DateTimeItem {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************************
* class StepAP203_PersonOrganizationItem *
*****************************************/
class StepAP203_PersonOrganizationItem : public StepData_SelectType {
	public:
		/****** StepAP203_PersonOrganizationItem::StepAP203_PersonOrganizationItem ******/
		/****** md5 signature: 946049eec51ba62b8216a83385d2ff72 ******/
		%feature("compactdefaultargs") StepAP203_PersonOrganizationItem;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") StepAP203_PersonOrganizationItem;
		 StepAP203_PersonOrganizationItem();

		/****** StepAP203_PersonOrganizationItem::CaseNum ******/
		/****** md5 signature: f0e39118a9846e44ccd59de148215261 ******/
		%feature("compactdefaultargs") CaseNum;
		%feature("autodoc", "
Parameters
----------
ent: Standard_Transient

Return
-------
int

Description
-----------
Recognizes a kind of PersonOrganizationItem select type 1 -> Change from StepAP203 2 -> StartWork from StepAP203 3 -> ChangeRequest from StepAP203 4 -> StartRequest from StepAP203 5 -> ConfigurationItem from StepRepr 6 -> Product from StepBasic 7 -> ProductDefinitionFormation from StepBasic 8 -> ProductDefinition from StepBasic 9 -> Contract from StepBasic 10 -> SecurityClassification from StepBasic 0 else.
") CaseNum;
		Standard_Integer CaseNum(const opencascade::handle<Standard_Transient> & ent);

		/****** StepAP203_PersonOrganizationItem::Change ******/
		/****** md5 signature: 45ba42050277592dfcd807d6ac427663 ******/
		%feature("compactdefaultargs") Change;
		%feature("autodoc", "Return
-------
opencascade::handle<StepAP203_Change>

Description
-----------
Returns Value as Change (or Null if another type).
") Change;
		opencascade::handle<StepAP203_Change> Change();

		/****** StepAP203_PersonOrganizationItem::ChangeRequest ******/
		/****** md5 signature: 716df3705f0b67fd35b2cdb84938decd ******/
		%feature("compactdefaultargs") ChangeRequest;
		%feature("autodoc", "Return
-------
opencascade::handle<StepAP203_ChangeRequest>

Description
-----------
Returns Value as ChangeRequest (or Null if another type).
") ChangeRequest;
		opencascade::handle<StepAP203_ChangeRequest> ChangeRequest();

		/****** StepAP203_PersonOrganizationItem::ConfigurationItem ******/
		/****** md5 signature: 19e20aa72323442204af7943ab5779ab ******/
		%feature("compactdefaultargs") ConfigurationItem;
		%feature("autodoc", "Return
-------
opencascade::handle<StepRepr_ConfigurationItem>

Description
-----------
Returns Value as ConfigurationItem (or Null if another type).
") ConfigurationItem;
		opencascade::handle<StepRepr_ConfigurationItem> ConfigurationItem();

		/****** StepAP203_PersonOrganizationItem::Contract ******/
		/****** md5 signature: 516418a4278fba9ddb098e0ec67421dd ******/
		%feature("compactdefaultargs") Contract;
		%feature("autodoc", "Return
-------
opencascade::handle<StepBasic_Contract>

Description
-----------
Returns Value as Contract (or Null if another type).
") Contract;
		opencascade::handle<StepBasic_Contract> Contract();

		/****** StepAP203_PersonOrganizationItem::Product ******/
		/****** md5 signature: e8c7e89afa6b95e852c44498904e61e4 ******/
		%feature("compactdefaultargs") Product;
		%feature("autodoc", "Return
-------
opencascade::handle<StepBasic_Product>

Description
-----------
Returns Value as Product (or Null if another type).
") Product;
		opencascade::handle<StepBasic_Product> Product();

		/****** StepAP203_PersonOrganizationItem::ProductDefinition ******/
		/****** md5 signature: d43b5ca42d8380c05af7f64fb041e89b ******/
		%feature("compactdefaultargs") ProductDefinition;
		%feature("autodoc", "Return
-------
opencascade::handle<StepBasic_ProductDefinition>

Description
-----------
Returns Value as ProductDefinition (or Null if another type).
") ProductDefinition;
		opencascade::handle<StepBasic_ProductDefinition> ProductDefinition();

		/****** StepAP203_PersonOrganizationItem::ProductDefinitionFormation ******/
		/****** md5 signature: 549b153d5236bb5dda717eed81e28565 ******/
		%feature("compactdefaultargs") ProductDefinitionFormation;
		%feature("autodoc", "Return
-------
opencascade::handle<StepBasic_ProductDefinitionFormation>

Description
-----------
Returns Value as ProductDefinitionFormation (or Null if another type).
") ProductDefinitionFormation;
		opencascade::handle<StepBasic_ProductDefinitionFormation> ProductDefinitionFormation();

		/****** StepAP203_PersonOrganizationItem::SecurityClassification ******/
		/****** md5 signature: 5a1ef075f0f272079bd532895ecc4299 ******/
		%feature("compactdefaultargs") SecurityClassification;
		%feature("autodoc", "Return
-------
opencascade::handle<StepBasic_SecurityClassification>

Description
-----------
Returns Value as SecurityClassification (or Null if another type).
") SecurityClassification;
		opencascade::handle<StepBasic_SecurityClassification> SecurityClassification();

		/****** StepAP203_PersonOrganizationItem::StartRequest ******/
		/****** md5 signature: 8f24598754db81d3836d88643a7a9ed1 ******/
		%feature("compactdefaultargs") StartRequest;
		%feature("autodoc", "Return
-------
opencascade::handle<StepAP203_StartRequest>

Description
-----------
Returns Value as StartRequest (or Null if another type).
") StartRequest;
		opencascade::handle<StepAP203_StartRequest> StartRequest();

		/****** StepAP203_PersonOrganizationItem::StartWork ******/
		/****** md5 signature: 3f4501e47c294626db8d74214f59a29f ******/
		%feature("compactdefaultargs") StartWork;
		%feature("autodoc", "Return
-------
opencascade::handle<StepAP203_StartWork>

Description
-----------
Returns Value as StartWork (or Null if another type).
") StartWork;
		opencascade::handle<StepAP203_StartWork> StartWork();

};


%extend StepAP203_PersonOrganizationItem {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************
* class StepAP203_SpecifiedItem *
********************************/
class StepAP203_SpecifiedItem : public StepData_SelectType {
	public:
		/****** StepAP203_SpecifiedItem::StepAP203_SpecifiedItem ******/
		/****** md5 signature: 2d345e1f70901b0f8ef0ad3699388b70 ******/
		%feature("compactdefaultargs") StepAP203_SpecifiedItem;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") StepAP203_SpecifiedItem;
		 StepAP203_SpecifiedItem();

		/****** StepAP203_SpecifiedItem::CaseNum ******/
		/****** md5 signature: f0e39118a9846e44ccd59de148215261 ******/
		%feature("compactdefaultargs") CaseNum;
		%feature("autodoc", "
Parameters
----------
ent: Standard_Transient

Return
-------
int

Description
-----------
Recognizes a kind of SpecifiedItem select type 1 -> ProductDefinition from StepBasic 2 -> ShapeAspect from StepRepr 0 else.
") CaseNum;
		Standard_Integer CaseNum(const opencascade::handle<Standard_Transient> & ent);

		/****** StepAP203_SpecifiedItem::ProductDefinition ******/
		/****** md5 signature: d43b5ca42d8380c05af7f64fb041e89b ******/
		%feature("compactdefaultargs") ProductDefinition;
		%feature("autodoc", "Return
-------
opencascade::handle<StepBasic_ProductDefinition>

Description
-----------
Returns Value as ProductDefinition (or Null if another type).
") ProductDefinition;
		opencascade::handle<StepBasic_ProductDefinition> ProductDefinition();

		/****** StepAP203_SpecifiedItem::ShapeAspect ******/
		/****** md5 signature: 6c476d31e71221a87c411540ef5855cb ******/
		%feature("compactdefaultargs") ShapeAspect;
		%feature("autodoc", "Return
-------
opencascade::handle<StepRepr_ShapeAspect>

Description
-----------
Returns Value as ShapeAspect (or Null if another type).
") ShapeAspect;
		opencascade::handle<StepRepr_ShapeAspect> ShapeAspect();

};


%extend StepAP203_SpecifiedItem {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************
* class StepAP203_StartRequest *
*******************************/
class StepAP203_StartRequest : public StepBasic_ActionRequestAssignment {
	public:
		/****** StepAP203_StartRequest::StepAP203_StartRequest ******/
		/****** md5 signature: d0721a10b129d7c6afb674dbadcbd2b9 ******/
		%feature("compactdefaultargs") StepAP203_StartRequest;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") StepAP203_StartRequest;
		 StepAP203_StartRequest();

		/****** StepAP203_StartRequest::Init ******/
		/****** md5 signature: bc99f5a4049a7b39ce240d6899a58c09 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
aActionRequestAssignment_AssignedActionRequest: StepBasic_VersionedActionRequest
aItems: StepAP203_HArray1OfStartRequestItem

Return
-------
None

Description
-----------
Initialize all fields (own and inherited).
") Init;
		void Init(const opencascade::handle<StepBasic_VersionedActionRequest> & aActionRequestAssignment_AssignedActionRequest, const opencascade::handle<StepAP203_HArray1OfStartRequestItem> & aItems);

		/****** StepAP203_StartRequest::Items ******/
		/****** md5 signature: ab5cd2755cb62bbf5e124c6ffae0b5da ******/
		%feature("compactdefaultargs") Items;
		%feature("autodoc", "Return
-------
opencascade::handle<StepAP203_HArray1OfStartRequestItem>

Description
-----------
Returns field Items.
") Items;
		opencascade::handle<StepAP203_HArray1OfStartRequestItem> Items();

		/****** StepAP203_StartRequest::SetItems ******/
		/****** md5 signature: 4884427346c77148853c13edfb84152f ******/
		%feature("compactdefaultargs") SetItems;
		%feature("autodoc", "
Parameters
----------
Items: StepAP203_HArray1OfStartRequestItem

Return
-------
None

Description
-----------
Set field Items.
") SetItems;
		void SetItems(const opencascade::handle<StepAP203_HArray1OfStartRequestItem> & Items);

};


%make_alias(StepAP203_StartRequest)

%extend StepAP203_StartRequest {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************************
* class StepAP203_StartRequestItem *
***********************************/
class StepAP203_StartRequestItem : public StepData_SelectType {
	public:
		/****** StepAP203_StartRequestItem::StepAP203_StartRequestItem ******/
		/****** md5 signature: b863f069f7ab37fc5098e5bc32d1a264 ******/
		%feature("compactdefaultargs") StepAP203_StartRequestItem;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") StepAP203_StartRequestItem;
		 StepAP203_StartRequestItem();

		/****** StepAP203_StartRequestItem::CaseNum ******/
		/****** md5 signature: f0e39118a9846e44ccd59de148215261 ******/
		%feature("compactdefaultargs") CaseNum;
		%feature("autodoc", "
Parameters
----------
ent: Standard_Transient

Return
-------
int

Description
-----------
Recognizes a kind of StartRequestItem select type 1 -> ProductDefinitionFormation from StepBasic 0 else.
") CaseNum;
		Standard_Integer CaseNum(const opencascade::handle<Standard_Transient> & ent);

		/****** StepAP203_StartRequestItem::ProductDefinitionFormation ******/
		/****** md5 signature: 549b153d5236bb5dda717eed81e28565 ******/
		%feature("compactdefaultargs") ProductDefinitionFormation;
		%feature("autodoc", "Return
-------
opencascade::handle<StepBasic_ProductDefinitionFormation>

Description
-----------
Returns Value as ProductDefinitionFormation (or Null if another type).
") ProductDefinitionFormation;
		opencascade::handle<StepBasic_ProductDefinitionFormation> ProductDefinitionFormation();

};


%extend StepAP203_StartRequestItem {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************
* class StepAP203_StartWork *
****************************/
class StepAP203_StartWork : public StepBasic_ActionAssignment {
	public:
		/****** StepAP203_StartWork::StepAP203_StartWork ******/
		/****** md5 signature: a25ce866d89740fb1b56a45675f52512 ******/
		%feature("compactdefaultargs") StepAP203_StartWork;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") StepAP203_StartWork;
		 StepAP203_StartWork();

		/****** StepAP203_StartWork::Init ******/
		/****** md5 signature: 426f4ad0835cd6d75198846fdbb79aae ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
aActionAssignment_AssignedAction: StepBasic_Action
aItems: StepAP203_HArray1OfWorkItem

Return
-------
None

Description
-----------
Initialize all fields (own and inherited).
") Init;
		void Init(const opencascade::handle<StepBasic_Action> & aActionAssignment_AssignedAction, const opencascade::handle<StepAP203_HArray1OfWorkItem> & aItems);

		/****** StepAP203_StartWork::Items ******/
		/****** md5 signature: da8df3751d3f4dbe5fbc1686a49a6ff8 ******/
		%feature("compactdefaultargs") Items;
		%feature("autodoc", "Return
-------
opencascade::handle<StepAP203_HArray1OfWorkItem>

Description
-----------
Returns field Items.
") Items;
		opencascade::handle<StepAP203_HArray1OfWorkItem> Items();

		/****** StepAP203_StartWork::SetItems ******/
		/****** md5 signature: 560f3192ead2495f8e28aed14d1b8ccb ******/
		%feature("compactdefaultargs") SetItems;
		%feature("autodoc", "
Parameters
----------
Items: StepAP203_HArray1OfWorkItem

Return
-------
None

Description
-----------
Set field Items.
") SetItems;
		void SetItems(const opencascade::handle<StepAP203_HArray1OfWorkItem> & Items);

};


%make_alias(StepAP203_StartWork)

%extend StepAP203_StartWork {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************
* class StepAP203_WorkItem *
***************************/
class StepAP203_WorkItem : public StepData_SelectType {
	public:
		/****** StepAP203_WorkItem::StepAP203_WorkItem ******/
		/****** md5 signature: 4149507a54a0c133573b86ac4d0cd3b3 ******/
		%feature("compactdefaultargs") StepAP203_WorkItem;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") StepAP203_WorkItem;
		 StepAP203_WorkItem();

		/****** StepAP203_WorkItem::CaseNum ******/
		/****** md5 signature: f0e39118a9846e44ccd59de148215261 ******/
		%feature("compactdefaultargs") CaseNum;
		%feature("autodoc", "
Parameters
----------
ent: Standard_Transient

Return
-------
int

Description
-----------
Recognizes a kind of WorkItem select type 1 -> ProductDefinitionFormation from StepBasic 0 else.
") CaseNum;
		Standard_Integer CaseNum(const opencascade::handle<Standard_Transient> & ent);

		/****** StepAP203_WorkItem::ProductDefinitionFormation ******/
		/****** md5 signature: 549b153d5236bb5dda717eed81e28565 ******/
		%feature("compactdefaultargs") ProductDefinitionFormation;
		%feature("autodoc", "Return
-------
opencascade::handle<StepBasic_ProductDefinitionFormation>

Description
-----------
Returns Value as ProductDefinitionFormation (or Null if another type).
") ProductDefinitionFormation;
		opencascade::handle<StepBasic_ProductDefinitionFormation> ProductDefinitionFormation();

};


%extend StepAP203_WorkItem {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/* harray1 classes */

class StepAP203_HArray1OfApprovedItem : public StepAP203_Array1OfApprovedItem, public Standard_Transient {
  public:
    StepAP203_HArray1OfApprovedItem(const Standard_Integer theLower, const Standard_Integer theUpper);
    StepAP203_HArray1OfApprovedItem(const Standard_Integer theLower, const Standard_Integer theUpper, const StepAP203_Array1OfApprovedItem::value_type& theValue);
    StepAP203_HArray1OfApprovedItem(const StepAP203_Array1OfApprovedItem& theOther);
    const StepAP203_Array1OfApprovedItem& Array1();
    StepAP203_Array1OfApprovedItem& ChangeArray1();
};
%make_alias(StepAP203_HArray1OfApprovedItem)


class StepAP203_HArray1OfCertifiedItem : public StepAP203_Array1OfCertifiedItem, public Standard_Transient {
  public:
    StepAP203_HArray1OfCertifiedItem(const Standard_Integer theLower, const Standard_Integer theUpper);
    StepAP203_HArray1OfCertifiedItem(const Standard_Integer theLower, const Standard_Integer theUpper, const StepAP203_Array1OfCertifiedItem::value_type& theValue);
    StepAP203_HArray1OfCertifiedItem(const StepAP203_Array1OfCertifiedItem& theOther);
    const StepAP203_Array1OfCertifiedItem& Array1();
    StepAP203_Array1OfCertifiedItem& ChangeArray1();
};
%make_alias(StepAP203_HArray1OfCertifiedItem)


class StepAP203_HArray1OfChangeRequestItem : public StepAP203_Array1OfChangeRequestItem, public Standard_Transient {
  public:
    StepAP203_HArray1OfChangeRequestItem(const Standard_Integer theLower, const Standard_Integer theUpper);
    StepAP203_HArray1OfChangeRequestItem(const Standard_Integer theLower, const Standard_Integer theUpper, const StepAP203_Array1OfChangeRequestItem::value_type& theValue);
    StepAP203_HArray1OfChangeRequestItem(const StepAP203_Array1OfChangeRequestItem& theOther);
    const StepAP203_Array1OfChangeRequestItem& Array1();
    StepAP203_Array1OfChangeRequestItem& ChangeArray1();
};
%make_alias(StepAP203_HArray1OfChangeRequestItem)


class StepAP203_HArray1OfClassifiedItem : public StepAP203_Array1OfClassifiedItem, public Standard_Transient {
  public:
    StepAP203_HArray1OfClassifiedItem(const Standard_Integer theLower, const Standard_Integer theUpper);
    StepAP203_HArray1OfClassifiedItem(const Standard_Integer theLower, const Standard_Integer theUpper, const StepAP203_Array1OfClassifiedItem::value_type& theValue);
    StepAP203_HArray1OfClassifiedItem(const StepAP203_Array1OfClassifiedItem& theOther);
    const StepAP203_Array1OfClassifiedItem& Array1();
    StepAP203_Array1OfClassifiedItem& ChangeArray1();
};
%make_alias(StepAP203_HArray1OfClassifiedItem)


class StepAP203_HArray1OfContractedItem : public StepAP203_Array1OfContractedItem, public Standard_Transient {
  public:
    StepAP203_HArray1OfContractedItem(const Standard_Integer theLower, const Standard_Integer theUpper);
    StepAP203_HArray1OfContractedItem(const Standard_Integer theLower, const Standard_Integer theUpper, const StepAP203_Array1OfContractedItem::value_type& theValue);
    StepAP203_HArray1OfContractedItem(const StepAP203_Array1OfContractedItem& theOther);
    const StepAP203_Array1OfContractedItem& Array1();
    StepAP203_Array1OfContractedItem& ChangeArray1();
};
%make_alias(StepAP203_HArray1OfContractedItem)


class StepAP203_HArray1OfDateTimeItem : public StepAP203_Array1OfDateTimeItem, public Standard_Transient {
  public:
    StepAP203_HArray1OfDateTimeItem(const Standard_Integer theLower, const Standard_Integer theUpper);
    StepAP203_HArray1OfDateTimeItem(const Standard_Integer theLower, const Standard_Integer theUpper, const StepAP203_Array1OfDateTimeItem::value_type& theValue);
    StepAP203_HArray1OfDateTimeItem(const StepAP203_Array1OfDateTimeItem& theOther);
    const StepAP203_Array1OfDateTimeItem& Array1();
    StepAP203_Array1OfDateTimeItem& ChangeArray1();
};
%make_alias(StepAP203_HArray1OfDateTimeItem)


class StepAP203_HArray1OfPersonOrganizationItem : public StepAP203_Array1OfPersonOrganizationItem, public Standard_Transient {
  public:
    StepAP203_HArray1OfPersonOrganizationItem(const Standard_Integer theLower, const Standard_Integer theUpper);
    StepAP203_HArray1OfPersonOrganizationItem(const Standard_Integer theLower, const Standard_Integer theUpper, const StepAP203_Array1OfPersonOrganizationItem::value_type& theValue);
    StepAP203_HArray1OfPersonOrganizationItem(const StepAP203_Array1OfPersonOrganizationItem& theOther);
    const StepAP203_Array1OfPersonOrganizationItem& Array1();
    StepAP203_Array1OfPersonOrganizationItem& ChangeArray1();
};
%make_alias(StepAP203_HArray1OfPersonOrganizationItem)


class StepAP203_HArray1OfSpecifiedItem : public StepAP203_Array1OfSpecifiedItem, public Standard_Transient {
  public:
    StepAP203_HArray1OfSpecifiedItem(const Standard_Integer theLower, const Standard_Integer theUpper);
    StepAP203_HArray1OfSpecifiedItem(const Standard_Integer theLower, const Standard_Integer theUpper, const StepAP203_Array1OfSpecifiedItem::value_type& theValue);
    StepAP203_HArray1OfSpecifiedItem(const StepAP203_Array1OfSpecifiedItem& theOther);
    const StepAP203_Array1OfSpecifiedItem& Array1();
    StepAP203_Array1OfSpecifiedItem& ChangeArray1();
};
%make_alias(StepAP203_HArray1OfSpecifiedItem)


class StepAP203_HArray1OfStartRequestItem : public StepAP203_Array1OfStartRequestItem, public Standard_Transient {
  public:
    StepAP203_HArray1OfStartRequestItem(const Standard_Integer theLower, const Standard_Integer theUpper);
    StepAP203_HArray1OfStartRequestItem(const Standard_Integer theLower, const Standard_Integer theUpper, const StepAP203_Array1OfStartRequestItem::value_type& theValue);
    StepAP203_HArray1OfStartRequestItem(const StepAP203_Array1OfStartRequestItem& theOther);
    const StepAP203_Array1OfStartRequestItem& Array1();
    StepAP203_Array1OfStartRequestItem& ChangeArray1();
};
%make_alias(StepAP203_HArray1OfStartRequestItem)


class StepAP203_HArray1OfWorkItem : public StepAP203_Array1OfWorkItem, public Standard_Transient {
  public:
    StepAP203_HArray1OfWorkItem(const Standard_Integer theLower, const Standard_Integer theUpper);
    StepAP203_HArray1OfWorkItem(const Standard_Integer theLower, const Standard_Integer theUpper, const StepAP203_Array1OfWorkItem::value_type& theValue);
    StepAP203_HArray1OfWorkItem(const StepAP203_Array1OfWorkItem& theOther);
    const StepAP203_Array1OfWorkItem& Array1();
    StepAP203_Array1OfWorkItem& ChangeArray1();
};
%make_alias(StepAP203_HArray1OfWorkItem)

/* harray2 classes */
/* hsequence classes */
/* class aliases */
%pythoncode {
}
