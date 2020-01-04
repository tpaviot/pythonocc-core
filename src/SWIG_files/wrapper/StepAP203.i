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
%define STEPAP203DOCSTRING
"StepAP203 module, see official documentation at
https://www.opencascade.com/doc/occt-7.4.0/refman/html/package_stepap203.html"
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
%include ../common/Operators.i
%include ../common/OccHandle.i


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
/* public enums */
/* end public enums declaration */

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
%wrap_handle(StepAP203_HArray1OfSpecifiedItem)
%wrap_handle(StepAP203_HArray1OfPersonOrganizationItem)
%wrap_handle(StepAP203_HArray1OfChangeRequestItem)
%wrap_handle(StepAP203_HArray1OfContractedItem)
%wrap_handle(StepAP203_HArray1OfCertifiedItem)
%wrap_handle(StepAP203_HArray1OfStartRequestItem)
%wrap_handle(StepAP203_HArray1OfDateTimeItem)
%wrap_handle(StepAP203_HArray1OfApprovedItem)
%wrap_handle(StepAP203_HArray1OfWorkItem)
%wrap_handle(StepAP203_HArray1OfClassifiedItem)
/* end handles declaration */

/* templates */
%template(StepAP203_Array1OfPersonOrganizationItem) NCollection_Array1 <StepAP203_PersonOrganizationItem>;

%extend NCollection_Array1 <StepAP203_PersonOrganizationItem> {
    %pythoncode {
    def __getitem__(self, index):
        if index + self.Lower() > self.Upper():
            raise IndexError("index out of range")
        else:
            return self.Value(index + self.Lower())

    def __setitem__(self, index, value):
        if index + self.Lower() > self.Upper():
            raise IndexError("index out of range")
        else:
            self.SetValue(index + self.Lower(), value)

    def __len__(self):
        return self.Length()

    def __iter__(self):
        self.low = self.Lower()
        self.up = self.Upper()
        self.current = self.Lower() - 1
        return self

    def next(self):
        if self.current >= self.Upper():
            raise StopIteration
        else:
            self.current += 1
        return self.Value(self.current)

    __next__ = next
    }
};
%template(StepAP203_Array1OfChangeRequestItem) NCollection_Array1 <StepAP203_ChangeRequestItem>;

%extend NCollection_Array1 <StepAP203_ChangeRequestItem> {
    %pythoncode {
    def __getitem__(self, index):
        if index + self.Lower() > self.Upper():
            raise IndexError("index out of range")
        else:
            return self.Value(index + self.Lower())

    def __setitem__(self, index, value):
        if index + self.Lower() > self.Upper():
            raise IndexError("index out of range")
        else:
            self.SetValue(index + self.Lower(), value)

    def __len__(self):
        return self.Length()

    def __iter__(self):
        self.low = self.Lower()
        self.up = self.Upper()
        self.current = self.Lower() - 1
        return self

    def next(self):
        if self.current >= self.Upper():
            raise StopIteration
        else:
            self.current += 1
        return self.Value(self.current)

    __next__ = next
    }
};
%template(StepAP203_Array1OfDateTimeItem) NCollection_Array1 <StepAP203_DateTimeItem>;

%extend NCollection_Array1 <StepAP203_DateTimeItem> {
    %pythoncode {
    def __getitem__(self, index):
        if index + self.Lower() > self.Upper():
            raise IndexError("index out of range")
        else:
            return self.Value(index + self.Lower())

    def __setitem__(self, index, value):
        if index + self.Lower() > self.Upper():
            raise IndexError("index out of range")
        else:
            self.SetValue(index + self.Lower(), value)

    def __len__(self):
        return self.Length()

    def __iter__(self):
        self.low = self.Lower()
        self.up = self.Upper()
        self.current = self.Lower() - 1
        return self

    def next(self):
        if self.current >= self.Upper():
            raise StopIteration
        else:
            self.current += 1
        return self.Value(self.current)

    __next__ = next
    }
};
%template(StepAP203_Array1OfStartRequestItem) NCollection_Array1 <StepAP203_StartRequestItem>;

%extend NCollection_Array1 <StepAP203_StartRequestItem> {
    %pythoncode {
    def __getitem__(self, index):
        if index + self.Lower() > self.Upper():
            raise IndexError("index out of range")
        else:
            return self.Value(index + self.Lower())

    def __setitem__(self, index, value):
        if index + self.Lower() > self.Upper():
            raise IndexError("index out of range")
        else:
            self.SetValue(index + self.Lower(), value)

    def __len__(self):
        return self.Length()

    def __iter__(self):
        self.low = self.Lower()
        self.up = self.Upper()
        self.current = self.Lower() - 1
        return self

    def next(self):
        if self.current >= self.Upper():
            raise StopIteration
        else:
            self.current += 1
        return self.Value(self.current)

    __next__ = next
    }
};
%template(StepAP203_Array1OfCertifiedItem) NCollection_Array1 <StepAP203_CertifiedItem>;

%extend NCollection_Array1 <StepAP203_CertifiedItem> {
    %pythoncode {
    def __getitem__(self, index):
        if index + self.Lower() > self.Upper():
            raise IndexError("index out of range")
        else:
            return self.Value(index + self.Lower())

    def __setitem__(self, index, value):
        if index + self.Lower() > self.Upper():
            raise IndexError("index out of range")
        else:
            self.SetValue(index + self.Lower(), value)

    def __len__(self):
        return self.Length()

    def __iter__(self):
        self.low = self.Lower()
        self.up = self.Upper()
        self.current = self.Lower() - 1
        return self

    def next(self):
        if self.current >= self.Upper():
            raise StopIteration
        else:
            self.current += 1
        return self.Value(self.current)

    __next__ = next
    }
};
%template(StepAP203_Array1OfWorkItem) NCollection_Array1 <StepAP203_WorkItem>;

%extend NCollection_Array1 <StepAP203_WorkItem> {
    %pythoncode {
    def __getitem__(self, index):
        if index + self.Lower() > self.Upper():
            raise IndexError("index out of range")
        else:
            return self.Value(index + self.Lower())

    def __setitem__(self, index, value):
        if index + self.Lower() > self.Upper():
            raise IndexError("index out of range")
        else:
            self.SetValue(index + self.Lower(), value)

    def __len__(self):
        return self.Length()

    def __iter__(self):
        self.low = self.Lower()
        self.up = self.Upper()
        self.current = self.Lower() - 1
        return self

    def next(self):
        if self.current >= self.Upper():
            raise StopIteration
        else:
            self.current += 1
        return self.Value(self.current)

    __next__ = next
    }
};
%template(StepAP203_Array1OfSpecifiedItem) NCollection_Array1 <StepAP203_SpecifiedItem>;

%extend NCollection_Array1 <StepAP203_SpecifiedItem> {
    %pythoncode {
    def __getitem__(self, index):
        if index + self.Lower() > self.Upper():
            raise IndexError("index out of range")
        else:
            return self.Value(index + self.Lower())

    def __setitem__(self, index, value):
        if index + self.Lower() > self.Upper():
            raise IndexError("index out of range")
        else:
            self.SetValue(index + self.Lower(), value)

    def __len__(self):
        return self.Length()

    def __iter__(self):
        self.low = self.Lower()
        self.up = self.Upper()
        self.current = self.Lower() - 1
        return self

    def next(self):
        if self.current >= self.Upper():
            raise StopIteration
        else:
            self.current += 1
        return self.Value(self.current)

    __next__ = next
    }
};
%template(StepAP203_Array1OfApprovedItem) NCollection_Array1 <StepAP203_ApprovedItem>;

%extend NCollection_Array1 <StepAP203_ApprovedItem> {
    %pythoncode {
    def __getitem__(self, index):
        if index + self.Lower() > self.Upper():
            raise IndexError("index out of range")
        else:
            return self.Value(index + self.Lower())

    def __setitem__(self, index, value):
        if index + self.Lower() > self.Upper():
            raise IndexError("index out of range")
        else:
            self.SetValue(index + self.Lower(), value)

    def __len__(self):
        return self.Length()

    def __iter__(self):
        self.low = self.Lower()
        self.up = self.Upper()
        self.current = self.Lower() - 1
        return self

    def next(self):
        if self.current >= self.Upper():
            raise StopIteration
        else:
            self.current += 1
        return self.Value(self.current)

    __next__ = next
    }
};
%template(StepAP203_Array1OfContractedItem) NCollection_Array1 <StepAP203_ContractedItem>;

%extend NCollection_Array1 <StepAP203_ContractedItem> {
    %pythoncode {
    def __getitem__(self, index):
        if index + self.Lower() > self.Upper():
            raise IndexError("index out of range")
        else:
            return self.Value(index + self.Lower())

    def __setitem__(self, index, value):
        if index + self.Lower() > self.Upper():
            raise IndexError("index out of range")
        else:
            self.SetValue(index + self.Lower(), value)

    def __len__(self):
        return self.Length()

    def __iter__(self):
        self.low = self.Lower()
        self.up = self.Upper()
        self.current = self.Lower() - 1
        return self

    def next(self):
        if self.current >= self.Upper():
            raise StopIteration
        else:
            self.current += 1
        return self.Value(self.current)

    __next__ = next
    }
};
%template(StepAP203_Array1OfClassifiedItem) NCollection_Array1 <StepAP203_ClassifiedItem>;

%extend NCollection_Array1 <StepAP203_ClassifiedItem> {
    %pythoncode {
    def __getitem__(self, index):
        if index + self.Lower() > self.Upper():
            raise IndexError("index out of range")
        else:
            return self.Value(index + self.Lower())

    def __setitem__(self, index, value):
        if index + self.Lower() > self.Upper():
            raise IndexError("index out of range")
        else:
            self.SetValue(index + self.Lower(), value)

    def __len__(self):
        return self.Length()

    def __iter__(self):
        self.low = self.Lower()
        self.up = self.Upper()
        self.current = self.Lower() - 1
        return self

    def next(self):
        if self.current >= self.Upper():
            raise StopIteration
        else:
            self.current += 1
        return self.Value(self.current)

    __next__ = next
    }
};
/* end templates declaration */

/* typedefs */
typedef NCollection_Array1 <StepAP203_PersonOrganizationItem> StepAP203_Array1OfPersonOrganizationItem;
typedef NCollection_Array1 <StepAP203_ChangeRequestItem> StepAP203_Array1OfChangeRequestItem;
typedef NCollection_Array1 <StepAP203_DateTimeItem> StepAP203_Array1OfDateTimeItem;
typedef NCollection_Array1 <StepAP203_StartRequestItem> StepAP203_Array1OfStartRequestItem;
typedef NCollection_Array1 <StepAP203_CertifiedItem> StepAP203_Array1OfCertifiedItem;
typedef NCollection_Array1 <StepAP203_WorkItem> StepAP203_Array1OfWorkItem;
typedef NCollection_Array1 <StepAP203_SpecifiedItem> StepAP203_Array1OfSpecifiedItem;
typedef NCollection_Array1 <StepAP203_ApprovedItem> StepAP203_Array1OfApprovedItem;
typedef NCollection_Array1 <StepAP203_ContractedItem> StepAP203_Array1OfContractedItem;
typedef NCollection_Array1 <StepAP203_ClassifiedItem> StepAP203_Array1OfClassifiedItem;
/* end typedefs declaration */

/*******************************
* class StepAP203_ApprovedItem *
*******************************/
class StepAP203_ApprovedItem : public StepData_SelectType {
	public:
		/****************** CaseNum ******************/
		%feature("compactdefaultargs") CaseNum;
		%feature("autodoc", "* Recognizes a kind of ApprovedItem select type 1 -> ProductDefinitionFormation from StepBasic 2 -> ProductDefinition from StepBasic 3 -> ConfigurationEffectivity from StepRepr 4 -> ConfigurationItem from StepRepr 5 -> SecurityClassification from StepBasic 6 -> ChangeRequest from StepAP203 7 -> Change from StepAP203 8 -> StartRequest from StepAP203 9 -> StartWork from StepAP203 10 -> Certification from StepBasic 11 -> Contract from StepBasic 0 else
	:param ent:
	:type ent: Standard_Transient
	:rtype: int") CaseNum;
		Standard_Integer CaseNum (const opencascade::handle<Standard_Transient> & ent);

		/****************** Certification ******************/
		%feature("compactdefaultargs") Certification;
		%feature("autodoc", "* Returns Value as Certification (or Null if another type)
	:rtype: opencascade::handle<StepBasic_Certification>") Certification;
		opencascade::handle<StepBasic_Certification> Certification ();

		/****************** Change ******************/
		%feature("compactdefaultargs") Change;
		%feature("autodoc", "* Returns Value as Change (or Null if another type)
	:rtype: opencascade::handle<StepAP203_Change>") Change;
		opencascade::handle<StepAP203_Change> Change ();

		/****************** ChangeRequest ******************/
		%feature("compactdefaultargs") ChangeRequest;
		%feature("autodoc", "* Returns Value as ChangeRequest (or Null if another type)
	:rtype: opencascade::handle<StepAP203_ChangeRequest>") ChangeRequest;
		opencascade::handle<StepAP203_ChangeRequest> ChangeRequest ();

		/****************** ConfigurationEffectivity ******************/
		%feature("compactdefaultargs") ConfigurationEffectivity;
		%feature("autodoc", "* Returns Value as ConfigurationEffectivity (or Null if another type)
	:rtype: opencascade::handle<StepRepr_ConfigurationEffectivity>") ConfigurationEffectivity;
		opencascade::handle<StepRepr_ConfigurationEffectivity> ConfigurationEffectivity ();

		/****************** ConfigurationItem ******************/
		%feature("compactdefaultargs") ConfigurationItem;
		%feature("autodoc", "* Returns Value as ConfigurationItem (or Null if another type)
	:rtype: opencascade::handle<StepRepr_ConfigurationItem>") ConfigurationItem;
		opencascade::handle<StepRepr_ConfigurationItem> ConfigurationItem ();

		/****************** Contract ******************/
		%feature("compactdefaultargs") Contract;
		%feature("autodoc", "* Returns Value as Contract (or Null if another type)
	:rtype: opencascade::handle<StepBasic_Contract>") Contract;
		opencascade::handle<StepBasic_Contract> Contract ();

		/****************** ProductDefinition ******************/
		%feature("compactdefaultargs") ProductDefinition;
		%feature("autodoc", "* Returns Value as ProductDefinition (or Null if another type)
	:rtype: opencascade::handle<StepBasic_ProductDefinition>") ProductDefinition;
		opencascade::handle<StepBasic_ProductDefinition> ProductDefinition ();

		/****************** ProductDefinitionFormation ******************/
		%feature("compactdefaultargs") ProductDefinitionFormation;
		%feature("autodoc", "* Returns Value as ProductDefinitionFormation (or Null if another type)
	:rtype: opencascade::handle<StepBasic_ProductDefinitionFormation>") ProductDefinitionFormation;
		opencascade::handle<StepBasic_ProductDefinitionFormation> ProductDefinitionFormation ();

		/****************** SecurityClassification ******************/
		%feature("compactdefaultargs") SecurityClassification;
		%feature("autodoc", "* Returns Value as SecurityClassification (or Null if another type)
	:rtype: opencascade::handle<StepBasic_SecurityClassification>") SecurityClassification;
		opencascade::handle<StepBasic_SecurityClassification> SecurityClassification ();

		/****************** StartRequest ******************/
		%feature("compactdefaultargs") StartRequest;
		%feature("autodoc", "* Returns Value as StartRequest (or Null if another type)
	:rtype: opencascade::handle<StepAP203_StartRequest>") StartRequest;
		opencascade::handle<StepAP203_StartRequest> StartRequest ();

		/****************** StartWork ******************/
		%feature("compactdefaultargs") StartWork;
		%feature("autodoc", "* Returns Value as StartWork (or Null if another type)
	:rtype: opencascade::handle<StepAP203_StartWork>") StartWork;
		opencascade::handle<StepAP203_StartWork> StartWork ();

		/****************** StepAP203_ApprovedItem ******************/
		%feature("compactdefaultargs") StepAP203_ApprovedItem;
		%feature("autodoc", "* Empty constructor
	:rtype: None") StepAP203_ApprovedItem;
		 StepAP203_ApprovedItem ();

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
		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "* Initialize all fields (own and inherited)
	:param aApprovalAssignment_AssignedApproval:
	:type aApprovalAssignment_AssignedApproval: StepBasic_Approval
	:param aItems:
	:type aItems: StepAP203_HArray1OfApprovedItem
	:rtype: None") Init;
		void Init (const opencascade::handle<StepBasic_Approval> & aApprovalAssignment_AssignedApproval,const opencascade::handle<StepAP203_HArray1OfApprovedItem> & aItems);

		/****************** Items ******************/
		%feature("compactdefaultargs") Items;
		%feature("autodoc", "* Returns field Items
	:rtype: opencascade::handle<StepAP203_HArray1OfApprovedItem>") Items;
		opencascade::handle<StepAP203_HArray1OfApprovedItem> Items ();

		/****************** SetItems ******************/
		%feature("compactdefaultargs") SetItems;
		%feature("autodoc", "* Set field Items
	:param Items:
	:type Items: StepAP203_HArray1OfApprovedItem
	:rtype: None") SetItems;
		void SetItems (const opencascade::handle<StepAP203_HArray1OfApprovedItem> & Items);

		/****************** StepAP203_CcDesignApproval ******************/
		%feature("compactdefaultargs") StepAP203_CcDesignApproval;
		%feature("autodoc", "* Empty constructor
	:rtype: None") StepAP203_CcDesignApproval;
		 StepAP203_CcDesignApproval ();

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
		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "* Initialize all fields (own and inherited)
	:param aCertificationAssignment_AssignedCertification:
	:type aCertificationAssignment_AssignedCertification: StepBasic_Certification
	:param aItems:
	:type aItems: StepAP203_HArray1OfCertifiedItem
	:rtype: None") Init;
		void Init (const opencascade::handle<StepBasic_Certification> & aCertificationAssignment_AssignedCertification,const opencascade::handle<StepAP203_HArray1OfCertifiedItem> & aItems);

		/****************** Items ******************/
		%feature("compactdefaultargs") Items;
		%feature("autodoc", "* Returns field Items
	:rtype: opencascade::handle<StepAP203_HArray1OfCertifiedItem>") Items;
		opencascade::handle<StepAP203_HArray1OfCertifiedItem> Items ();

		/****************** SetItems ******************/
		%feature("compactdefaultargs") SetItems;
		%feature("autodoc", "* Set field Items
	:param Items:
	:type Items: StepAP203_HArray1OfCertifiedItem
	:rtype: None") SetItems;
		void SetItems (const opencascade::handle<StepAP203_HArray1OfCertifiedItem> & Items);

		/****************** StepAP203_CcDesignCertification ******************/
		%feature("compactdefaultargs") StepAP203_CcDesignCertification;
		%feature("autodoc", "* Empty constructor
	:rtype: None") StepAP203_CcDesignCertification;
		 StepAP203_CcDesignCertification ();

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
		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "* Initialize all fields (own and inherited)
	:param aContractAssignment_AssignedContract:
	:type aContractAssignment_AssignedContract: StepBasic_Contract
	:param aItems:
	:type aItems: StepAP203_HArray1OfContractedItem
	:rtype: None") Init;
		void Init (const opencascade::handle<StepBasic_Contract> & aContractAssignment_AssignedContract,const opencascade::handle<StepAP203_HArray1OfContractedItem> & aItems);

		/****************** Items ******************/
		%feature("compactdefaultargs") Items;
		%feature("autodoc", "* Returns field Items
	:rtype: opencascade::handle<StepAP203_HArray1OfContractedItem>") Items;
		opencascade::handle<StepAP203_HArray1OfContractedItem> Items ();

		/****************** SetItems ******************/
		%feature("compactdefaultargs") SetItems;
		%feature("autodoc", "* Set field Items
	:param Items:
	:type Items: StepAP203_HArray1OfContractedItem
	:rtype: None") SetItems;
		void SetItems (const opencascade::handle<StepAP203_HArray1OfContractedItem> & Items);

		/****************** StepAP203_CcDesignContract ******************/
		%feature("compactdefaultargs") StepAP203_CcDesignContract;
		%feature("autodoc", "* Empty constructor
	:rtype: None") StepAP203_CcDesignContract;
		 StepAP203_CcDesignContract ();

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
		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "* Initialize all fields (own and inherited)
	:param aDateAndTimeAssignment_AssignedDateAndTime:
	:type aDateAndTimeAssignment_AssignedDateAndTime: StepBasic_DateAndTime
	:param aDateAndTimeAssignment_Role:
	:type aDateAndTimeAssignment_Role: StepBasic_DateTimeRole
	:param aItems:
	:type aItems: StepAP203_HArray1OfDateTimeItem
	:rtype: None") Init;
		void Init (const opencascade::handle<StepBasic_DateAndTime> & aDateAndTimeAssignment_AssignedDateAndTime,const opencascade::handle<StepBasic_DateTimeRole> & aDateAndTimeAssignment_Role,const opencascade::handle<StepAP203_HArray1OfDateTimeItem> & aItems);

		/****************** Items ******************/
		%feature("compactdefaultargs") Items;
		%feature("autodoc", "* Returns field Items
	:rtype: opencascade::handle<StepAP203_HArray1OfDateTimeItem>") Items;
		opencascade::handle<StepAP203_HArray1OfDateTimeItem> Items ();

		/****************** SetItems ******************/
		%feature("compactdefaultargs") SetItems;
		%feature("autodoc", "* Set field Items
	:param Items:
	:type Items: StepAP203_HArray1OfDateTimeItem
	:rtype: None") SetItems;
		void SetItems (const opencascade::handle<StepAP203_HArray1OfDateTimeItem> & Items);

		/****************** StepAP203_CcDesignDateAndTimeAssignment ******************/
		%feature("compactdefaultargs") StepAP203_CcDesignDateAndTimeAssignment;
		%feature("autodoc", "* Empty constructor
	:rtype: None") StepAP203_CcDesignDateAndTimeAssignment;
		 StepAP203_CcDesignDateAndTimeAssignment ();

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
		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "* Initialize all fields (own and inherited)
	:param aPersonAndOrganizationAssignment_AssignedPersonAndOrganization:
	:type aPersonAndOrganizationAssignment_AssignedPersonAndOrganization: StepBasic_PersonAndOrganization
	:param aPersonAndOrganizationAssignment_Role:
	:type aPersonAndOrganizationAssignment_Role: StepBasic_PersonAndOrganizationRole
	:param aItems:
	:type aItems: StepAP203_HArray1OfPersonOrganizationItem
	:rtype: None") Init;
		void Init (const opencascade::handle<StepBasic_PersonAndOrganization> & aPersonAndOrganizationAssignment_AssignedPersonAndOrganization,const opencascade::handle<StepBasic_PersonAndOrganizationRole> & aPersonAndOrganizationAssignment_Role,const opencascade::handle<StepAP203_HArray1OfPersonOrganizationItem> & aItems);

		/****************** Items ******************/
		%feature("compactdefaultargs") Items;
		%feature("autodoc", "* Returns field Items
	:rtype: opencascade::handle<StepAP203_HArray1OfPersonOrganizationItem>") Items;
		opencascade::handle<StepAP203_HArray1OfPersonOrganizationItem> Items ();

		/****************** SetItems ******************/
		%feature("compactdefaultargs") SetItems;
		%feature("autodoc", "* Set field Items
	:param Items:
	:type Items: StepAP203_HArray1OfPersonOrganizationItem
	:rtype: None") SetItems;
		void SetItems (const opencascade::handle<StepAP203_HArray1OfPersonOrganizationItem> & Items);

		/****************** StepAP203_CcDesignPersonAndOrganizationAssignment ******************/
		%feature("compactdefaultargs") StepAP203_CcDesignPersonAndOrganizationAssignment;
		%feature("autodoc", "* Empty constructor
	:rtype: None") StepAP203_CcDesignPersonAndOrganizationAssignment;
		 StepAP203_CcDesignPersonAndOrganizationAssignment ();

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
		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "* Initialize all fields (own and inherited)
	:param aSecurityClassificationAssignment_AssignedSecurityClassification:
	:type aSecurityClassificationAssignment_AssignedSecurityClassification: StepBasic_SecurityClassification
	:param aItems:
	:type aItems: StepAP203_HArray1OfClassifiedItem
	:rtype: None") Init;
		void Init (const opencascade::handle<StepBasic_SecurityClassification> & aSecurityClassificationAssignment_AssignedSecurityClassification,const opencascade::handle<StepAP203_HArray1OfClassifiedItem> & aItems);

		/****************** Items ******************/
		%feature("compactdefaultargs") Items;
		%feature("autodoc", "* Returns field Items
	:rtype: opencascade::handle<StepAP203_HArray1OfClassifiedItem>") Items;
		opencascade::handle<StepAP203_HArray1OfClassifiedItem> Items ();

		/****************** SetItems ******************/
		%feature("compactdefaultargs") SetItems;
		%feature("autodoc", "* Set field Items
	:param Items:
	:type Items: StepAP203_HArray1OfClassifiedItem
	:rtype: None") SetItems;
		void SetItems (const opencascade::handle<StepAP203_HArray1OfClassifiedItem> & Items);

		/****************** StepAP203_CcDesignSecurityClassification ******************/
		%feature("compactdefaultargs") StepAP203_CcDesignSecurityClassification;
		%feature("autodoc", "* Empty constructor
	:rtype: None") StepAP203_CcDesignSecurityClassification;
		 StepAP203_CcDesignSecurityClassification ();

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
		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "* Initialize all fields (own and inherited)
	:param aDocumentReference_AssignedDocument:
	:type aDocumentReference_AssignedDocument: StepBasic_Document
	:param aDocumentReference_Source:
	:type aDocumentReference_Source: TCollection_HAsciiString
	:param aItems:
	:type aItems: StepAP203_HArray1OfSpecifiedItem
	:rtype: None") Init;
		void Init (const opencascade::handle<StepBasic_Document> & aDocumentReference_AssignedDocument,const opencascade::handle<TCollection_HAsciiString> & aDocumentReference_Source,const opencascade::handle<StepAP203_HArray1OfSpecifiedItem> & aItems);

		/****************** Items ******************/
		%feature("compactdefaultargs") Items;
		%feature("autodoc", "* Returns field Items
	:rtype: opencascade::handle<StepAP203_HArray1OfSpecifiedItem>") Items;
		opencascade::handle<StepAP203_HArray1OfSpecifiedItem> Items ();

		/****************** SetItems ******************/
		%feature("compactdefaultargs") SetItems;
		%feature("autodoc", "* Set field Items
	:param Items:
	:type Items: StepAP203_HArray1OfSpecifiedItem
	:rtype: None") SetItems;
		void SetItems (const opencascade::handle<StepAP203_HArray1OfSpecifiedItem> & Items);

		/****************** StepAP203_CcDesignSpecificationReference ******************/
		%feature("compactdefaultargs") StepAP203_CcDesignSpecificationReference;
		%feature("autodoc", "* Empty constructor
	:rtype: None") StepAP203_CcDesignSpecificationReference;
		 StepAP203_CcDesignSpecificationReference ();

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
		/****************** CaseNum ******************/
		%feature("compactdefaultargs") CaseNum;
		%feature("autodoc", "* Recognizes a kind of CertifiedItem select type 1 -> SuppliedPartRelationship from StepRepr 0 else
	:param ent:
	:type ent: Standard_Transient
	:rtype: int") CaseNum;
		Standard_Integer CaseNum (const opencascade::handle<Standard_Transient> & ent);

		/****************** StepAP203_CertifiedItem ******************/
		%feature("compactdefaultargs") StepAP203_CertifiedItem;
		%feature("autodoc", "* Empty constructor
	:rtype: None") StepAP203_CertifiedItem;
		 StepAP203_CertifiedItem ();

		/****************** SuppliedPartRelationship ******************/
		%feature("compactdefaultargs") SuppliedPartRelationship;
		%feature("autodoc", "* Returns Value as SuppliedPartRelationship (or Null if another type)
	:rtype: opencascade::handle<StepRepr_SuppliedPartRelationship>") SuppliedPartRelationship;
		opencascade::handle<StepRepr_SuppliedPartRelationship> SuppliedPartRelationship ();

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
		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "* Initialize all fields (own and inherited)
	:param aActionAssignment_AssignedAction:
	:type aActionAssignment_AssignedAction: StepBasic_Action
	:param aItems:
	:type aItems: StepAP203_HArray1OfWorkItem
	:rtype: None") Init;
		void Init (const opencascade::handle<StepBasic_Action> & aActionAssignment_AssignedAction,const opencascade::handle<StepAP203_HArray1OfWorkItem> & aItems);

		/****************** Items ******************/
		%feature("compactdefaultargs") Items;
		%feature("autodoc", "* Returns field Items
	:rtype: opencascade::handle<StepAP203_HArray1OfWorkItem>") Items;
		opencascade::handle<StepAP203_HArray1OfWorkItem> Items ();

		/****************** SetItems ******************/
		%feature("compactdefaultargs") SetItems;
		%feature("autodoc", "* Set field Items
	:param Items:
	:type Items: StepAP203_HArray1OfWorkItem
	:rtype: None") SetItems;
		void SetItems (const opencascade::handle<StepAP203_HArray1OfWorkItem> & Items);

		/****************** StepAP203_Change ******************/
		%feature("compactdefaultargs") StepAP203_Change;
		%feature("autodoc", "* Empty constructor
	:rtype: None") StepAP203_Change;
		 StepAP203_Change ();

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
		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "* Initialize all fields (own and inherited)
	:param aActionRequestAssignment_AssignedActionRequest:
	:type aActionRequestAssignment_AssignedActionRequest: StepBasic_VersionedActionRequest
	:param aItems:
	:type aItems: StepAP203_HArray1OfChangeRequestItem
	:rtype: None") Init;
		void Init (const opencascade::handle<StepBasic_VersionedActionRequest> & aActionRequestAssignment_AssignedActionRequest,const opencascade::handle<StepAP203_HArray1OfChangeRequestItem> & aItems);

		/****************** Items ******************/
		%feature("compactdefaultargs") Items;
		%feature("autodoc", "* Returns field Items
	:rtype: opencascade::handle<StepAP203_HArray1OfChangeRequestItem>") Items;
		opencascade::handle<StepAP203_HArray1OfChangeRequestItem> Items ();

		/****************** SetItems ******************/
		%feature("compactdefaultargs") SetItems;
		%feature("autodoc", "* Set field Items
	:param Items:
	:type Items: StepAP203_HArray1OfChangeRequestItem
	:rtype: None") SetItems;
		void SetItems (const opencascade::handle<StepAP203_HArray1OfChangeRequestItem> & Items);

		/****************** StepAP203_ChangeRequest ******************/
		%feature("compactdefaultargs") StepAP203_ChangeRequest;
		%feature("autodoc", "* Empty constructor
	:rtype: None") StepAP203_ChangeRequest;
		 StepAP203_ChangeRequest ();

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
		/****************** CaseNum ******************/
		%feature("compactdefaultargs") CaseNum;
		%feature("autodoc", "* Recognizes a kind of ChangeRequestItem select type 1 -> ProductDefinitionFormation from StepBasic 0 else
	:param ent:
	:type ent: Standard_Transient
	:rtype: int") CaseNum;
		Standard_Integer CaseNum (const opencascade::handle<Standard_Transient> & ent);

		/****************** ProductDefinitionFormation ******************/
		%feature("compactdefaultargs") ProductDefinitionFormation;
		%feature("autodoc", "* Returns Value as ProductDefinitionFormation (or Null if another type)
	:rtype: opencascade::handle<StepBasic_ProductDefinitionFormation>") ProductDefinitionFormation;
		opencascade::handle<StepBasic_ProductDefinitionFormation> ProductDefinitionFormation ();

		/****************** StepAP203_ChangeRequestItem ******************/
		%feature("compactdefaultargs") StepAP203_ChangeRequestItem;
		%feature("autodoc", "* Empty constructor
	:rtype: None") StepAP203_ChangeRequestItem;
		 StepAP203_ChangeRequestItem ();

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
		/****************** AssemblyComponentUsage ******************/
		%feature("compactdefaultargs") AssemblyComponentUsage;
		%feature("autodoc", "* Returns Value as AssemblyComponentUsage (or Null if another type)
	:rtype: opencascade::handle<StepRepr_AssemblyComponentUsage>") AssemblyComponentUsage;
		opencascade::handle<StepRepr_AssemblyComponentUsage> AssemblyComponentUsage ();

		/****************** CaseNum ******************/
		%feature("compactdefaultargs") CaseNum;
		%feature("autodoc", "* Recognizes a kind of ClassifiedItem select type 1 -> ProductDefinitionFormation from StepBasic 2 -> AssemblyComponentUsage from StepRepr 0 else
	:param ent:
	:type ent: Standard_Transient
	:rtype: int") CaseNum;
		Standard_Integer CaseNum (const opencascade::handle<Standard_Transient> & ent);

		/****************** ProductDefinitionFormation ******************/
		%feature("compactdefaultargs") ProductDefinitionFormation;
		%feature("autodoc", "* Returns Value as ProductDefinitionFormation (or Null if another type)
	:rtype: opencascade::handle<StepBasic_ProductDefinitionFormation>") ProductDefinitionFormation;
		opencascade::handle<StepBasic_ProductDefinitionFormation> ProductDefinitionFormation ();

		/****************** StepAP203_ClassifiedItem ******************/
		%feature("compactdefaultargs") StepAP203_ClassifiedItem;
		%feature("autodoc", "* Empty constructor
	:rtype: None") StepAP203_ClassifiedItem;
		 StepAP203_ClassifiedItem ();

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
		/****************** CaseNum ******************/
		%feature("compactdefaultargs") CaseNum;
		%feature("autodoc", "* Recognizes a kind of ContractedItem select type 1 -> ProductDefinitionFormation from StepBasic 0 else
	:param ent:
	:type ent: Standard_Transient
	:rtype: int") CaseNum;
		Standard_Integer CaseNum (const opencascade::handle<Standard_Transient> & ent);

		/****************** ProductDefinitionFormation ******************/
		%feature("compactdefaultargs") ProductDefinitionFormation;
		%feature("autodoc", "* Returns Value as ProductDefinitionFormation (or Null if another type)
	:rtype: opencascade::handle<StepBasic_ProductDefinitionFormation>") ProductDefinitionFormation;
		opencascade::handle<StepBasic_ProductDefinitionFormation> ProductDefinitionFormation ();

		/****************** StepAP203_ContractedItem ******************/
		%feature("compactdefaultargs") StepAP203_ContractedItem;
		%feature("autodoc", "* Empty constructor
	:rtype: None") StepAP203_ContractedItem;
		 StepAP203_ContractedItem ();

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
		/****************** ApprovalPersonOrganization ******************/
		%feature("compactdefaultargs") ApprovalPersonOrganization;
		%feature("autodoc", "* Returns Value as ApprovalPersonOrganization (or Null if another type)
	:rtype: opencascade::handle<StepBasic_ApprovalPersonOrganization>") ApprovalPersonOrganization;
		opencascade::handle<StepBasic_ApprovalPersonOrganization> ApprovalPersonOrganization ();

		/****************** CaseNum ******************/
		%feature("compactdefaultargs") CaseNum;
		%feature("autodoc", "* Recognizes a kind of DateTimeItem select type 1 -> ProductDefinition from StepBasic 2 -> ChangeRequest from StepAP203 3 -> StartRequest from StepAP203 4 -> Change from StepAP203 5 -> StartWork from StepAP203 6 -> ApprovalPersonOrganization from StepBasic 7 -> Contract from StepBasic 8 -> SecurityClassification from StepBasic 9 -> Certification from StepBasic 0 else
	:param ent:
	:type ent: Standard_Transient
	:rtype: int") CaseNum;
		Standard_Integer CaseNum (const opencascade::handle<Standard_Transient> & ent);

		/****************** Certification ******************/
		%feature("compactdefaultargs") Certification;
		%feature("autodoc", "* Returns Value as Certification (or Null if another type)
	:rtype: opencascade::handle<StepBasic_Certification>") Certification;
		opencascade::handle<StepBasic_Certification> Certification ();

		/****************** Change ******************/
		%feature("compactdefaultargs") Change;
		%feature("autodoc", "* Returns Value as Change (or Null if another type)
	:rtype: opencascade::handle<StepAP203_Change>") Change;
		opencascade::handle<StepAP203_Change> Change ();

		/****************** ChangeRequest ******************/
		%feature("compactdefaultargs") ChangeRequest;
		%feature("autodoc", "* Returns Value as ChangeRequest (or Null if another type)
	:rtype: opencascade::handle<StepAP203_ChangeRequest>") ChangeRequest;
		opencascade::handle<StepAP203_ChangeRequest> ChangeRequest ();

		/****************** Contract ******************/
		%feature("compactdefaultargs") Contract;
		%feature("autodoc", "* Returns Value as Contract (or Null if another type)
	:rtype: opencascade::handle<StepBasic_Contract>") Contract;
		opencascade::handle<StepBasic_Contract> Contract ();

		/****************** ProductDefinition ******************/
		%feature("compactdefaultargs") ProductDefinition;
		%feature("autodoc", "* Returns Value as ProductDefinition (or Null if another type)
	:rtype: opencascade::handle<StepBasic_ProductDefinition>") ProductDefinition;
		opencascade::handle<StepBasic_ProductDefinition> ProductDefinition ();

		/****************** SecurityClassification ******************/
		%feature("compactdefaultargs") SecurityClassification;
		%feature("autodoc", "* Returns Value as SecurityClassification (or Null if another type)
	:rtype: opencascade::handle<StepBasic_SecurityClassification>") SecurityClassification;
		opencascade::handle<StepBasic_SecurityClassification> SecurityClassification ();

		/****************** StartRequest ******************/
		%feature("compactdefaultargs") StartRequest;
		%feature("autodoc", "* Returns Value as StartRequest (or Null if another type)
	:rtype: opencascade::handle<StepAP203_StartRequest>") StartRequest;
		opencascade::handle<StepAP203_StartRequest> StartRequest ();

		/****************** StartWork ******************/
		%feature("compactdefaultargs") StartWork;
		%feature("autodoc", "* Returns Value as StartWork (or Null if another type)
	:rtype: opencascade::handle<StepAP203_StartWork>") StartWork;
		opencascade::handle<StepAP203_StartWork> StartWork ();

		/****************** StepAP203_DateTimeItem ******************/
		%feature("compactdefaultargs") StepAP203_DateTimeItem;
		%feature("autodoc", "* Empty constructor
	:rtype: None") StepAP203_DateTimeItem;
		 StepAP203_DateTimeItem ();

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
		/****************** CaseNum ******************/
		%feature("compactdefaultargs") CaseNum;
		%feature("autodoc", "* Recognizes a kind of PersonOrganizationItem select type 1 -> Change from StepAP203 2 -> StartWork from StepAP203 3 -> ChangeRequest from StepAP203 4 -> StartRequest from StepAP203 5 -> ConfigurationItem from StepRepr 6 -> Product from StepBasic 7 -> ProductDefinitionFormation from StepBasic 8 -> ProductDefinition from StepBasic 9 -> Contract from StepBasic 10 -> SecurityClassification from StepBasic 0 else
	:param ent:
	:type ent: Standard_Transient
	:rtype: int") CaseNum;
		Standard_Integer CaseNum (const opencascade::handle<Standard_Transient> & ent);

		/****************** Change ******************/
		%feature("compactdefaultargs") Change;
		%feature("autodoc", "* Returns Value as Change (or Null if another type)
	:rtype: opencascade::handle<StepAP203_Change>") Change;
		opencascade::handle<StepAP203_Change> Change ();

		/****************** ChangeRequest ******************/
		%feature("compactdefaultargs") ChangeRequest;
		%feature("autodoc", "* Returns Value as ChangeRequest (or Null if another type)
	:rtype: opencascade::handle<StepAP203_ChangeRequest>") ChangeRequest;
		opencascade::handle<StepAP203_ChangeRequest> ChangeRequest ();

		/****************** ConfigurationItem ******************/
		%feature("compactdefaultargs") ConfigurationItem;
		%feature("autodoc", "* Returns Value as ConfigurationItem (or Null if another type)
	:rtype: opencascade::handle<StepRepr_ConfigurationItem>") ConfigurationItem;
		opencascade::handle<StepRepr_ConfigurationItem> ConfigurationItem ();

		/****************** Contract ******************/
		%feature("compactdefaultargs") Contract;
		%feature("autodoc", "* Returns Value as Contract (or Null if another type)
	:rtype: opencascade::handle<StepBasic_Contract>") Contract;
		opencascade::handle<StepBasic_Contract> Contract ();

		/****************** Product ******************/
		%feature("compactdefaultargs") Product;
		%feature("autodoc", "* Returns Value as Product (or Null if another type)
	:rtype: opencascade::handle<StepBasic_Product>") Product;
		opencascade::handle<StepBasic_Product> Product ();

		/****************** ProductDefinition ******************/
		%feature("compactdefaultargs") ProductDefinition;
		%feature("autodoc", "* Returns Value as ProductDefinition (or Null if another type)
	:rtype: opencascade::handle<StepBasic_ProductDefinition>") ProductDefinition;
		opencascade::handle<StepBasic_ProductDefinition> ProductDefinition ();

		/****************** ProductDefinitionFormation ******************/
		%feature("compactdefaultargs") ProductDefinitionFormation;
		%feature("autodoc", "* Returns Value as ProductDefinitionFormation (or Null if another type)
	:rtype: opencascade::handle<StepBasic_ProductDefinitionFormation>") ProductDefinitionFormation;
		opencascade::handle<StepBasic_ProductDefinitionFormation> ProductDefinitionFormation ();

		/****************** SecurityClassification ******************/
		%feature("compactdefaultargs") SecurityClassification;
		%feature("autodoc", "* Returns Value as SecurityClassification (or Null if another type)
	:rtype: opencascade::handle<StepBasic_SecurityClassification>") SecurityClassification;
		opencascade::handle<StepBasic_SecurityClassification> SecurityClassification ();

		/****************** StartRequest ******************/
		%feature("compactdefaultargs") StartRequest;
		%feature("autodoc", "* Returns Value as StartRequest (or Null if another type)
	:rtype: opencascade::handle<StepAP203_StartRequest>") StartRequest;
		opencascade::handle<StepAP203_StartRequest> StartRequest ();

		/****************** StartWork ******************/
		%feature("compactdefaultargs") StartWork;
		%feature("autodoc", "* Returns Value as StartWork (or Null if another type)
	:rtype: opencascade::handle<StepAP203_StartWork>") StartWork;
		opencascade::handle<StepAP203_StartWork> StartWork ();

		/****************** StepAP203_PersonOrganizationItem ******************/
		%feature("compactdefaultargs") StepAP203_PersonOrganizationItem;
		%feature("autodoc", "* Empty constructor
	:rtype: None") StepAP203_PersonOrganizationItem;
		 StepAP203_PersonOrganizationItem ();

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
		/****************** CaseNum ******************/
		%feature("compactdefaultargs") CaseNum;
		%feature("autodoc", "* Recognizes a kind of SpecifiedItem select type 1 -> ProductDefinition from StepBasic 2 -> ShapeAspect from StepRepr 0 else
	:param ent:
	:type ent: Standard_Transient
	:rtype: int") CaseNum;
		Standard_Integer CaseNum (const opencascade::handle<Standard_Transient> & ent);

		/****************** ProductDefinition ******************/
		%feature("compactdefaultargs") ProductDefinition;
		%feature("autodoc", "* Returns Value as ProductDefinition (or Null if another type)
	:rtype: opencascade::handle<StepBasic_ProductDefinition>") ProductDefinition;
		opencascade::handle<StepBasic_ProductDefinition> ProductDefinition ();

		/****************** ShapeAspect ******************/
		%feature("compactdefaultargs") ShapeAspect;
		%feature("autodoc", "* Returns Value as ShapeAspect (or Null if another type)
	:rtype: opencascade::handle<StepRepr_ShapeAspect>") ShapeAspect;
		opencascade::handle<StepRepr_ShapeAspect> ShapeAspect ();

		/****************** StepAP203_SpecifiedItem ******************/
		%feature("compactdefaultargs") StepAP203_SpecifiedItem;
		%feature("autodoc", "* Empty constructor
	:rtype: None") StepAP203_SpecifiedItem;
		 StepAP203_SpecifiedItem ();

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
		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "* Initialize all fields (own and inherited)
	:param aActionRequestAssignment_AssignedActionRequest:
	:type aActionRequestAssignment_AssignedActionRequest: StepBasic_VersionedActionRequest
	:param aItems:
	:type aItems: StepAP203_HArray1OfStartRequestItem
	:rtype: None") Init;
		void Init (const opencascade::handle<StepBasic_VersionedActionRequest> & aActionRequestAssignment_AssignedActionRequest,const opencascade::handle<StepAP203_HArray1OfStartRequestItem> & aItems);

		/****************** Items ******************/
		%feature("compactdefaultargs") Items;
		%feature("autodoc", "* Returns field Items
	:rtype: opencascade::handle<StepAP203_HArray1OfStartRequestItem>") Items;
		opencascade::handle<StepAP203_HArray1OfStartRequestItem> Items ();

		/****************** SetItems ******************/
		%feature("compactdefaultargs") SetItems;
		%feature("autodoc", "* Set field Items
	:param Items:
	:type Items: StepAP203_HArray1OfStartRequestItem
	:rtype: None") SetItems;
		void SetItems (const opencascade::handle<StepAP203_HArray1OfStartRequestItem> & Items);

		/****************** StepAP203_StartRequest ******************/
		%feature("compactdefaultargs") StepAP203_StartRequest;
		%feature("autodoc", "* Empty constructor
	:rtype: None") StepAP203_StartRequest;
		 StepAP203_StartRequest ();

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
		/****************** CaseNum ******************/
		%feature("compactdefaultargs") CaseNum;
		%feature("autodoc", "* Recognizes a kind of StartRequestItem select type 1 -> ProductDefinitionFormation from StepBasic 0 else
	:param ent:
	:type ent: Standard_Transient
	:rtype: int") CaseNum;
		Standard_Integer CaseNum (const opencascade::handle<Standard_Transient> & ent);

		/****************** ProductDefinitionFormation ******************/
		%feature("compactdefaultargs") ProductDefinitionFormation;
		%feature("autodoc", "* Returns Value as ProductDefinitionFormation (or Null if another type)
	:rtype: opencascade::handle<StepBasic_ProductDefinitionFormation>") ProductDefinitionFormation;
		opencascade::handle<StepBasic_ProductDefinitionFormation> ProductDefinitionFormation ();

		/****************** StepAP203_StartRequestItem ******************/
		%feature("compactdefaultargs") StepAP203_StartRequestItem;
		%feature("autodoc", "* Empty constructor
	:rtype: None") StepAP203_StartRequestItem;
		 StepAP203_StartRequestItem ();

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
		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "* Initialize all fields (own and inherited)
	:param aActionAssignment_AssignedAction:
	:type aActionAssignment_AssignedAction: StepBasic_Action
	:param aItems:
	:type aItems: StepAP203_HArray1OfWorkItem
	:rtype: None") Init;
		void Init (const opencascade::handle<StepBasic_Action> & aActionAssignment_AssignedAction,const opencascade::handle<StepAP203_HArray1OfWorkItem> & aItems);

		/****************** Items ******************/
		%feature("compactdefaultargs") Items;
		%feature("autodoc", "* Returns field Items
	:rtype: opencascade::handle<StepAP203_HArray1OfWorkItem>") Items;
		opencascade::handle<StepAP203_HArray1OfWorkItem> Items ();

		/****************** SetItems ******************/
		%feature("compactdefaultargs") SetItems;
		%feature("autodoc", "* Set field Items
	:param Items:
	:type Items: StepAP203_HArray1OfWorkItem
	:rtype: None") SetItems;
		void SetItems (const opencascade::handle<StepAP203_HArray1OfWorkItem> & Items);

		/****************** StepAP203_StartWork ******************/
		%feature("compactdefaultargs") StepAP203_StartWork;
		%feature("autodoc", "* Empty constructor
	:rtype: None") StepAP203_StartWork;
		 StepAP203_StartWork ();

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
		/****************** CaseNum ******************/
		%feature("compactdefaultargs") CaseNum;
		%feature("autodoc", "* Recognizes a kind of WorkItem select type 1 -> ProductDefinitionFormation from StepBasic 0 else
	:param ent:
	:type ent: Standard_Transient
	:rtype: int") CaseNum;
		Standard_Integer CaseNum (const opencascade::handle<Standard_Transient> & ent);

		/****************** ProductDefinitionFormation ******************/
		%feature("compactdefaultargs") ProductDefinitionFormation;
		%feature("autodoc", "* Returns Value as ProductDefinitionFormation (or Null if another type)
	:rtype: opencascade::handle<StepBasic_ProductDefinitionFormation>") ProductDefinitionFormation;
		opencascade::handle<StepBasic_ProductDefinitionFormation> ProductDefinitionFormation ();

		/****************** StepAP203_WorkItem ******************/
		%feature("compactdefaultargs") StepAP203_WorkItem;
		%feature("autodoc", "* Empty constructor
	:rtype: None") StepAP203_WorkItem;
		 StepAP203_WorkItem ();

};


%extend StepAP203_WorkItem {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/* harray1 classes */
class StepAP203_HArray1OfSpecifiedItem : public  StepAP203_Array1OfSpecifiedItem, public Standard_Transient {
  public:
    StepAP203_HArray1OfSpecifiedItem(const Standard_Integer theLower, const Standard_Integer theUpper);
    StepAP203_HArray1OfSpecifiedItem(const Standard_Integer theLower, const Standard_Integer theUpper, const  StepAP203_Array1OfSpecifiedItem::value_type& theValue);
    StepAP203_HArray1OfSpecifiedItem(const  StepAP203_Array1OfSpecifiedItem& theOther);
    const  StepAP203_Array1OfSpecifiedItem& Array1();
     StepAP203_Array1OfSpecifiedItem& ChangeArray1();
};
%make_alias(StepAP203_HArray1OfSpecifiedItem)


class StepAP203_HArray1OfPersonOrganizationItem : public  StepAP203_Array1OfPersonOrganizationItem, public Standard_Transient {
  public:
    StepAP203_HArray1OfPersonOrganizationItem(const Standard_Integer theLower, const Standard_Integer theUpper);
    StepAP203_HArray1OfPersonOrganizationItem(const Standard_Integer theLower, const Standard_Integer theUpper, const  StepAP203_Array1OfPersonOrganizationItem::value_type& theValue);
    StepAP203_HArray1OfPersonOrganizationItem(const  StepAP203_Array1OfPersonOrganizationItem& theOther);
    const  StepAP203_Array1OfPersonOrganizationItem& Array1();
     StepAP203_Array1OfPersonOrganizationItem& ChangeArray1();
};
%make_alias(StepAP203_HArray1OfPersonOrganizationItem)


class StepAP203_HArray1OfChangeRequestItem : public  StepAP203_Array1OfChangeRequestItem, public Standard_Transient {
  public:
    StepAP203_HArray1OfChangeRequestItem(const Standard_Integer theLower, const Standard_Integer theUpper);
    StepAP203_HArray1OfChangeRequestItem(const Standard_Integer theLower, const Standard_Integer theUpper, const  StepAP203_Array1OfChangeRequestItem::value_type& theValue);
    StepAP203_HArray1OfChangeRequestItem(const  StepAP203_Array1OfChangeRequestItem& theOther);
    const  StepAP203_Array1OfChangeRequestItem& Array1();
     StepAP203_Array1OfChangeRequestItem& ChangeArray1();
};
%make_alias(StepAP203_HArray1OfChangeRequestItem)


class StepAP203_HArray1OfContractedItem : public  StepAP203_Array1OfContractedItem, public Standard_Transient {
  public:
    StepAP203_HArray1OfContractedItem(const Standard_Integer theLower, const Standard_Integer theUpper);
    StepAP203_HArray1OfContractedItem(const Standard_Integer theLower, const Standard_Integer theUpper, const  StepAP203_Array1OfContractedItem::value_type& theValue);
    StepAP203_HArray1OfContractedItem(const  StepAP203_Array1OfContractedItem& theOther);
    const  StepAP203_Array1OfContractedItem& Array1();
     StepAP203_Array1OfContractedItem& ChangeArray1();
};
%make_alias(StepAP203_HArray1OfContractedItem)


class StepAP203_HArray1OfCertifiedItem : public  StepAP203_Array1OfCertifiedItem, public Standard_Transient {
  public:
    StepAP203_HArray1OfCertifiedItem(const Standard_Integer theLower, const Standard_Integer theUpper);
    StepAP203_HArray1OfCertifiedItem(const Standard_Integer theLower, const Standard_Integer theUpper, const  StepAP203_Array1OfCertifiedItem::value_type& theValue);
    StepAP203_HArray1OfCertifiedItem(const  StepAP203_Array1OfCertifiedItem& theOther);
    const  StepAP203_Array1OfCertifiedItem& Array1();
     StepAP203_Array1OfCertifiedItem& ChangeArray1();
};
%make_alias(StepAP203_HArray1OfCertifiedItem)


class StepAP203_HArray1OfStartRequestItem : public  StepAP203_Array1OfStartRequestItem, public Standard_Transient {
  public:
    StepAP203_HArray1OfStartRequestItem(const Standard_Integer theLower, const Standard_Integer theUpper);
    StepAP203_HArray1OfStartRequestItem(const Standard_Integer theLower, const Standard_Integer theUpper, const  StepAP203_Array1OfStartRequestItem::value_type& theValue);
    StepAP203_HArray1OfStartRequestItem(const  StepAP203_Array1OfStartRequestItem& theOther);
    const  StepAP203_Array1OfStartRequestItem& Array1();
     StepAP203_Array1OfStartRequestItem& ChangeArray1();
};
%make_alias(StepAP203_HArray1OfStartRequestItem)


class StepAP203_HArray1OfDateTimeItem : public  StepAP203_Array1OfDateTimeItem, public Standard_Transient {
  public:
    StepAP203_HArray1OfDateTimeItem(const Standard_Integer theLower, const Standard_Integer theUpper);
    StepAP203_HArray1OfDateTimeItem(const Standard_Integer theLower, const Standard_Integer theUpper, const  StepAP203_Array1OfDateTimeItem::value_type& theValue);
    StepAP203_HArray1OfDateTimeItem(const  StepAP203_Array1OfDateTimeItem& theOther);
    const  StepAP203_Array1OfDateTimeItem& Array1();
     StepAP203_Array1OfDateTimeItem& ChangeArray1();
};
%make_alias(StepAP203_HArray1OfDateTimeItem)


class StepAP203_HArray1OfApprovedItem : public  StepAP203_Array1OfApprovedItem, public Standard_Transient {
  public:
    StepAP203_HArray1OfApprovedItem(const Standard_Integer theLower, const Standard_Integer theUpper);
    StepAP203_HArray1OfApprovedItem(const Standard_Integer theLower, const Standard_Integer theUpper, const  StepAP203_Array1OfApprovedItem::value_type& theValue);
    StepAP203_HArray1OfApprovedItem(const  StepAP203_Array1OfApprovedItem& theOther);
    const  StepAP203_Array1OfApprovedItem& Array1();
     StepAP203_Array1OfApprovedItem& ChangeArray1();
};
%make_alias(StepAP203_HArray1OfApprovedItem)


class StepAP203_HArray1OfWorkItem : public  StepAP203_Array1OfWorkItem, public Standard_Transient {
  public:
    StepAP203_HArray1OfWorkItem(const Standard_Integer theLower, const Standard_Integer theUpper);
    StepAP203_HArray1OfWorkItem(const Standard_Integer theLower, const Standard_Integer theUpper, const  StepAP203_Array1OfWorkItem::value_type& theValue);
    StepAP203_HArray1OfWorkItem(const  StepAP203_Array1OfWorkItem& theOther);
    const  StepAP203_Array1OfWorkItem& Array1();
     StepAP203_Array1OfWorkItem& ChangeArray1();
};
%make_alias(StepAP203_HArray1OfWorkItem)


class StepAP203_HArray1OfClassifiedItem : public  StepAP203_Array1OfClassifiedItem, public Standard_Transient {
  public:
    StepAP203_HArray1OfClassifiedItem(const Standard_Integer theLower, const Standard_Integer theUpper);
    StepAP203_HArray1OfClassifiedItem(const Standard_Integer theLower, const Standard_Integer theUpper, const  StepAP203_Array1OfClassifiedItem::value_type& theValue);
    StepAP203_HArray1OfClassifiedItem(const  StepAP203_Array1OfClassifiedItem& theOther);
    const  StepAP203_Array1OfClassifiedItem& Array1();
     StepAP203_Array1OfClassifiedItem& ChangeArray1();
};
%make_alias(StepAP203_HArray1OfClassifiedItem)


/* harray2 classes */
/* hsequence classes */
