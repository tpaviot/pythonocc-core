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
%module (package="OCC") StepAP203

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


%include StepAP203_headers.i


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

%nodefaultctor StepAP203_ApprovedItem;
class StepAP203_ApprovedItem : public StepData_SelectType {
	public:
		%feature("compactdefaultargs") StepAP203_ApprovedItem;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") StepAP203_ApprovedItem;
		 StepAP203_ApprovedItem ();
		%feature("compactdefaultargs") CaseNum;
		%feature("autodoc", "	* Recognizes a kind of ApprovedItem select type 1 -> ProductDefinitionFormation from StepBasic 2 -> ProductDefinition from StepBasic 3 -> ConfigurationEffectivity from StepRepr 4 -> ConfigurationItem from StepRepr 5 -> SecurityClassification from StepBasic 6 -> ChangeRequest from StepAP203 7 -> Change from StepAP203 8 -> StartRequest from StepAP203 9 -> StartWork from StepAP203 10 -> Certification from StepBasic 11 -> Contract from StepBasic 0 else

	:param ent:
	:type ent: Handle_Standard_Transient &
	:rtype: int
") CaseNum;
		Standard_Integer CaseNum (const Handle_Standard_Transient & ent);
		%feature("compactdefaultargs") ProductDefinitionFormation;
		%feature("autodoc", "	* Returns Value as ProductDefinitionFormation (or Null if another type)

	:rtype: Handle_StepBasic_ProductDefinitionFormation
") ProductDefinitionFormation;
		Handle_StepBasic_ProductDefinitionFormation ProductDefinitionFormation ();
		%feature("compactdefaultargs") ProductDefinition;
		%feature("autodoc", "	* Returns Value as ProductDefinition (or Null if another type)

	:rtype: Handle_StepBasic_ProductDefinition
") ProductDefinition;
		Handle_StepBasic_ProductDefinition ProductDefinition ();
		%feature("compactdefaultargs") ConfigurationEffectivity;
		%feature("autodoc", "	* Returns Value as ConfigurationEffectivity (or Null if another type)

	:rtype: Handle_StepRepr_ConfigurationEffectivity
") ConfigurationEffectivity;
		Handle_StepRepr_ConfigurationEffectivity ConfigurationEffectivity ();
		%feature("compactdefaultargs") ConfigurationItem;
		%feature("autodoc", "	* Returns Value as ConfigurationItem (or Null if another type)

	:rtype: Handle_StepRepr_ConfigurationItem
") ConfigurationItem;
		Handle_StepRepr_ConfigurationItem ConfigurationItem ();
		%feature("compactdefaultargs") SecurityClassification;
		%feature("autodoc", "	* Returns Value as SecurityClassification (or Null if another type)

	:rtype: Handle_StepBasic_SecurityClassification
") SecurityClassification;
		Handle_StepBasic_SecurityClassification SecurityClassification ();
		%feature("compactdefaultargs") ChangeRequest;
		%feature("autodoc", "	* Returns Value as ChangeRequest (or Null if another type)

	:rtype: Handle_StepAP203_ChangeRequest
") ChangeRequest;
		Handle_StepAP203_ChangeRequest ChangeRequest ();
		%feature("compactdefaultargs") Change;
		%feature("autodoc", "	* Returns Value as Change (or Null if another type)

	:rtype: Handle_StepAP203_Change
") Change;
		Handle_StepAP203_Change Change ();
		%feature("compactdefaultargs") StartRequest;
		%feature("autodoc", "	* Returns Value as StartRequest (or Null if another type)

	:rtype: Handle_StepAP203_StartRequest
") StartRequest;
		Handle_StepAP203_StartRequest StartRequest ();
		%feature("compactdefaultargs") StartWork;
		%feature("autodoc", "	* Returns Value as StartWork (or Null if another type)

	:rtype: Handle_StepAP203_StartWork
") StartWork;
		Handle_StepAP203_StartWork StartWork ();
		%feature("compactdefaultargs") Certification;
		%feature("autodoc", "	* Returns Value as Certification (or Null if another type)

	:rtype: Handle_StepBasic_Certification
") Certification;
		Handle_StepBasic_Certification Certification ();
		%feature("compactdefaultargs") Contract;
		%feature("autodoc", "	* Returns Value as Contract (or Null if another type)

	:rtype: Handle_StepBasic_Contract
") Contract;
		Handle_StepBasic_Contract Contract ();
};


%extend StepAP203_ApprovedItem {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepAP203_Array1OfApprovedItem;
class StepAP203_Array1OfApprovedItem {
	public:
		%feature("compactdefaultargs") StepAP203_Array1OfApprovedItem;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") StepAP203_Array1OfApprovedItem;
		 StepAP203_Array1OfApprovedItem (const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") StepAP203_Array1OfApprovedItem;
		%feature("autodoc", "	:param Item:
	:type Item: StepAP203_ApprovedItem &
	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") StepAP203_Array1OfApprovedItem;
		 StepAP203_Array1OfApprovedItem (const StepAP203_ApprovedItem & Item,const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param V:
	:type V: StepAP203_ApprovedItem &
	:rtype: None
") Init;
		void Init (const StepAP203_ApprovedItem & V);
		%feature("compactdefaultargs") Destroy;
		%feature("autodoc", "	:rtype: None
") Destroy;
		void Destroy ();
		%feature("compactdefaultargs") IsAllocated;
		%feature("autodoc", "	:rtype: bool
") IsAllocated;
		Standard_Boolean IsAllocated ();
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: StepAP203_Array1OfApprovedItem &
	:rtype: StepAP203_Array1OfApprovedItem
") Assign;
		const StepAP203_Array1OfApprovedItem & Assign (const StepAP203_Array1OfApprovedItem & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: StepAP203_Array1OfApprovedItem &
	:rtype: StepAP203_Array1OfApprovedItem
") operator =;
		const StepAP203_Array1OfApprovedItem & operator = (const StepAP203_Array1OfApprovedItem & Other);
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "	:rtype: int
") Length;
		Standard_Integer Length ();
		%feature("compactdefaultargs") Lower;
		%feature("autodoc", "	:rtype: int
") Lower;
		Standard_Integer Lower ();
		%feature("compactdefaultargs") Upper;
		%feature("autodoc", "	:rtype: int
") Upper;
		Standard_Integer Upper ();
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param Value:
	:type Value: StepAP203_ApprovedItem &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const StepAP203_ApprovedItem & Value);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: StepAP203_ApprovedItem
") Value;
		const StepAP203_ApprovedItem & Value (const Standard_Integer Index);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: StepAP203_ApprovedItem
") ChangeValue;
		StepAP203_ApprovedItem & ChangeValue (const Standard_Integer Index);
};


%extend StepAP203_Array1OfApprovedItem {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepAP203_Array1OfCertifiedItem;
class StepAP203_Array1OfCertifiedItem {
	public:
		%feature("compactdefaultargs") StepAP203_Array1OfCertifiedItem;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") StepAP203_Array1OfCertifiedItem;
		 StepAP203_Array1OfCertifiedItem (const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") StepAP203_Array1OfCertifiedItem;
		%feature("autodoc", "	:param Item:
	:type Item: StepAP203_CertifiedItem &
	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") StepAP203_Array1OfCertifiedItem;
		 StepAP203_Array1OfCertifiedItem (const StepAP203_CertifiedItem & Item,const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param V:
	:type V: StepAP203_CertifiedItem &
	:rtype: None
") Init;
		void Init (const StepAP203_CertifiedItem & V);
		%feature("compactdefaultargs") Destroy;
		%feature("autodoc", "	:rtype: None
") Destroy;
		void Destroy ();
		%feature("compactdefaultargs") IsAllocated;
		%feature("autodoc", "	:rtype: bool
") IsAllocated;
		Standard_Boolean IsAllocated ();
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: StepAP203_Array1OfCertifiedItem &
	:rtype: StepAP203_Array1OfCertifiedItem
") Assign;
		const StepAP203_Array1OfCertifiedItem & Assign (const StepAP203_Array1OfCertifiedItem & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: StepAP203_Array1OfCertifiedItem &
	:rtype: StepAP203_Array1OfCertifiedItem
") operator =;
		const StepAP203_Array1OfCertifiedItem & operator = (const StepAP203_Array1OfCertifiedItem & Other);
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "	:rtype: int
") Length;
		Standard_Integer Length ();
		%feature("compactdefaultargs") Lower;
		%feature("autodoc", "	:rtype: int
") Lower;
		Standard_Integer Lower ();
		%feature("compactdefaultargs") Upper;
		%feature("autodoc", "	:rtype: int
") Upper;
		Standard_Integer Upper ();
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param Value:
	:type Value: StepAP203_CertifiedItem &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const StepAP203_CertifiedItem & Value);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: StepAP203_CertifiedItem
") Value;
		const StepAP203_CertifiedItem & Value (const Standard_Integer Index);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: StepAP203_CertifiedItem
") ChangeValue;
		StepAP203_CertifiedItem & ChangeValue (const Standard_Integer Index);
};


%extend StepAP203_Array1OfCertifiedItem {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepAP203_Array1OfChangeRequestItem;
class StepAP203_Array1OfChangeRequestItem {
	public:
		%feature("compactdefaultargs") StepAP203_Array1OfChangeRequestItem;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") StepAP203_Array1OfChangeRequestItem;
		 StepAP203_Array1OfChangeRequestItem (const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") StepAP203_Array1OfChangeRequestItem;
		%feature("autodoc", "	:param Item:
	:type Item: StepAP203_ChangeRequestItem &
	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") StepAP203_Array1OfChangeRequestItem;
		 StepAP203_Array1OfChangeRequestItem (const StepAP203_ChangeRequestItem & Item,const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param V:
	:type V: StepAP203_ChangeRequestItem &
	:rtype: None
") Init;
		void Init (const StepAP203_ChangeRequestItem & V);
		%feature("compactdefaultargs") Destroy;
		%feature("autodoc", "	:rtype: None
") Destroy;
		void Destroy ();
		%feature("compactdefaultargs") IsAllocated;
		%feature("autodoc", "	:rtype: bool
") IsAllocated;
		Standard_Boolean IsAllocated ();
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: StepAP203_Array1OfChangeRequestItem &
	:rtype: StepAP203_Array1OfChangeRequestItem
") Assign;
		const StepAP203_Array1OfChangeRequestItem & Assign (const StepAP203_Array1OfChangeRequestItem & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: StepAP203_Array1OfChangeRequestItem &
	:rtype: StepAP203_Array1OfChangeRequestItem
") operator =;
		const StepAP203_Array1OfChangeRequestItem & operator = (const StepAP203_Array1OfChangeRequestItem & Other);
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "	:rtype: int
") Length;
		Standard_Integer Length ();
		%feature("compactdefaultargs") Lower;
		%feature("autodoc", "	:rtype: int
") Lower;
		Standard_Integer Lower ();
		%feature("compactdefaultargs") Upper;
		%feature("autodoc", "	:rtype: int
") Upper;
		Standard_Integer Upper ();
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param Value:
	:type Value: StepAP203_ChangeRequestItem &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const StepAP203_ChangeRequestItem & Value);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: StepAP203_ChangeRequestItem
") Value;
		const StepAP203_ChangeRequestItem & Value (const Standard_Integer Index);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: StepAP203_ChangeRequestItem
") ChangeValue;
		StepAP203_ChangeRequestItem & ChangeValue (const Standard_Integer Index);
};


%extend StepAP203_Array1OfChangeRequestItem {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepAP203_Array1OfClassifiedItem;
class StepAP203_Array1OfClassifiedItem {
	public:
		%feature("compactdefaultargs") StepAP203_Array1OfClassifiedItem;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") StepAP203_Array1OfClassifiedItem;
		 StepAP203_Array1OfClassifiedItem (const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") StepAP203_Array1OfClassifiedItem;
		%feature("autodoc", "	:param Item:
	:type Item: StepAP203_ClassifiedItem &
	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") StepAP203_Array1OfClassifiedItem;
		 StepAP203_Array1OfClassifiedItem (const StepAP203_ClassifiedItem & Item,const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param V:
	:type V: StepAP203_ClassifiedItem &
	:rtype: None
") Init;
		void Init (const StepAP203_ClassifiedItem & V);
		%feature("compactdefaultargs") Destroy;
		%feature("autodoc", "	:rtype: None
") Destroy;
		void Destroy ();
		%feature("compactdefaultargs") IsAllocated;
		%feature("autodoc", "	:rtype: bool
") IsAllocated;
		Standard_Boolean IsAllocated ();
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: StepAP203_Array1OfClassifiedItem &
	:rtype: StepAP203_Array1OfClassifiedItem
") Assign;
		const StepAP203_Array1OfClassifiedItem & Assign (const StepAP203_Array1OfClassifiedItem & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: StepAP203_Array1OfClassifiedItem &
	:rtype: StepAP203_Array1OfClassifiedItem
") operator =;
		const StepAP203_Array1OfClassifiedItem & operator = (const StepAP203_Array1OfClassifiedItem & Other);
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "	:rtype: int
") Length;
		Standard_Integer Length ();
		%feature("compactdefaultargs") Lower;
		%feature("autodoc", "	:rtype: int
") Lower;
		Standard_Integer Lower ();
		%feature("compactdefaultargs") Upper;
		%feature("autodoc", "	:rtype: int
") Upper;
		Standard_Integer Upper ();
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param Value:
	:type Value: StepAP203_ClassifiedItem &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const StepAP203_ClassifiedItem & Value);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: StepAP203_ClassifiedItem
") Value;
		const StepAP203_ClassifiedItem & Value (const Standard_Integer Index);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: StepAP203_ClassifiedItem
") ChangeValue;
		StepAP203_ClassifiedItem & ChangeValue (const Standard_Integer Index);
};


%extend StepAP203_Array1OfClassifiedItem {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepAP203_Array1OfContractedItem;
class StepAP203_Array1OfContractedItem {
	public:
		%feature("compactdefaultargs") StepAP203_Array1OfContractedItem;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") StepAP203_Array1OfContractedItem;
		 StepAP203_Array1OfContractedItem (const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") StepAP203_Array1OfContractedItem;
		%feature("autodoc", "	:param Item:
	:type Item: StepAP203_ContractedItem &
	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") StepAP203_Array1OfContractedItem;
		 StepAP203_Array1OfContractedItem (const StepAP203_ContractedItem & Item,const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param V:
	:type V: StepAP203_ContractedItem &
	:rtype: None
") Init;
		void Init (const StepAP203_ContractedItem & V);
		%feature("compactdefaultargs") Destroy;
		%feature("autodoc", "	:rtype: None
") Destroy;
		void Destroy ();
		%feature("compactdefaultargs") IsAllocated;
		%feature("autodoc", "	:rtype: bool
") IsAllocated;
		Standard_Boolean IsAllocated ();
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: StepAP203_Array1OfContractedItem &
	:rtype: StepAP203_Array1OfContractedItem
") Assign;
		const StepAP203_Array1OfContractedItem & Assign (const StepAP203_Array1OfContractedItem & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: StepAP203_Array1OfContractedItem &
	:rtype: StepAP203_Array1OfContractedItem
") operator =;
		const StepAP203_Array1OfContractedItem & operator = (const StepAP203_Array1OfContractedItem & Other);
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "	:rtype: int
") Length;
		Standard_Integer Length ();
		%feature("compactdefaultargs") Lower;
		%feature("autodoc", "	:rtype: int
") Lower;
		Standard_Integer Lower ();
		%feature("compactdefaultargs") Upper;
		%feature("autodoc", "	:rtype: int
") Upper;
		Standard_Integer Upper ();
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param Value:
	:type Value: StepAP203_ContractedItem &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const StepAP203_ContractedItem & Value);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: StepAP203_ContractedItem
") Value;
		const StepAP203_ContractedItem & Value (const Standard_Integer Index);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: StepAP203_ContractedItem
") ChangeValue;
		StepAP203_ContractedItem & ChangeValue (const Standard_Integer Index);
};


%extend StepAP203_Array1OfContractedItem {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepAP203_Array1OfDateTimeItem;
class StepAP203_Array1OfDateTimeItem {
	public:
		%feature("compactdefaultargs") StepAP203_Array1OfDateTimeItem;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") StepAP203_Array1OfDateTimeItem;
		 StepAP203_Array1OfDateTimeItem (const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") StepAP203_Array1OfDateTimeItem;
		%feature("autodoc", "	:param Item:
	:type Item: StepAP203_DateTimeItem &
	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") StepAP203_Array1OfDateTimeItem;
		 StepAP203_Array1OfDateTimeItem (const StepAP203_DateTimeItem & Item,const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param V:
	:type V: StepAP203_DateTimeItem &
	:rtype: None
") Init;
		void Init (const StepAP203_DateTimeItem & V);
		%feature("compactdefaultargs") Destroy;
		%feature("autodoc", "	:rtype: None
") Destroy;
		void Destroy ();
		%feature("compactdefaultargs") IsAllocated;
		%feature("autodoc", "	:rtype: bool
") IsAllocated;
		Standard_Boolean IsAllocated ();
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: StepAP203_Array1OfDateTimeItem &
	:rtype: StepAP203_Array1OfDateTimeItem
") Assign;
		const StepAP203_Array1OfDateTimeItem & Assign (const StepAP203_Array1OfDateTimeItem & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: StepAP203_Array1OfDateTimeItem &
	:rtype: StepAP203_Array1OfDateTimeItem
") operator =;
		const StepAP203_Array1OfDateTimeItem & operator = (const StepAP203_Array1OfDateTimeItem & Other);
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "	:rtype: int
") Length;
		Standard_Integer Length ();
		%feature("compactdefaultargs") Lower;
		%feature("autodoc", "	:rtype: int
") Lower;
		Standard_Integer Lower ();
		%feature("compactdefaultargs") Upper;
		%feature("autodoc", "	:rtype: int
") Upper;
		Standard_Integer Upper ();
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param Value:
	:type Value: StepAP203_DateTimeItem &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const StepAP203_DateTimeItem & Value);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: StepAP203_DateTimeItem
") Value;
		const StepAP203_DateTimeItem & Value (const Standard_Integer Index);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: StepAP203_DateTimeItem
") ChangeValue;
		StepAP203_DateTimeItem & ChangeValue (const Standard_Integer Index);
};


%extend StepAP203_Array1OfDateTimeItem {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepAP203_Array1OfPersonOrganizationItem;
class StepAP203_Array1OfPersonOrganizationItem {
	public:
		%feature("compactdefaultargs") StepAP203_Array1OfPersonOrganizationItem;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") StepAP203_Array1OfPersonOrganizationItem;
		 StepAP203_Array1OfPersonOrganizationItem (const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") StepAP203_Array1OfPersonOrganizationItem;
		%feature("autodoc", "	:param Item:
	:type Item: StepAP203_PersonOrganizationItem &
	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") StepAP203_Array1OfPersonOrganizationItem;
		 StepAP203_Array1OfPersonOrganizationItem (const StepAP203_PersonOrganizationItem & Item,const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param V:
	:type V: StepAP203_PersonOrganizationItem &
	:rtype: None
") Init;
		void Init (const StepAP203_PersonOrganizationItem & V);
		%feature("compactdefaultargs") Destroy;
		%feature("autodoc", "	:rtype: None
") Destroy;
		void Destroy ();
		%feature("compactdefaultargs") IsAllocated;
		%feature("autodoc", "	:rtype: bool
") IsAllocated;
		Standard_Boolean IsAllocated ();
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: StepAP203_Array1OfPersonOrganizationItem &
	:rtype: StepAP203_Array1OfPersonOrganizationItem
") Assign;
		const StepAP203_Array1OfPersonOrganizationItem & Assign (const StepAP203_Array1OfPersonOrganizationItem & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: StepAP203_Array1OfPersonOrganizationItem &
	:rtype: StepAP203_Array1OfPersonOrganizationItem
") operator =;
		const StepAP203_Array1OfPersonOrganizationItem & operator = (const StepAP203_Array1OfPersonOrganizationItem & Other);
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "	:rtype: int
") Length;
		Standard_Integer Length ();
		%feature("compactdefaultargs") Lower;
		%feature("autodoc", "	:rtype: int
") Lower;
		Standard_Integer Lower ();
		%feature("compactdefaultargs") Upper;
		%feature("autodoc", "	:rtype: int
") Upper;
		Standard_Integer Upper ();
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param Value:
	:type Value: StepAP203_PersonOrganizationItem &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const StepAP203_PersonOrganizationItem & Value);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: StepAP203_PersonOrganizationItem
") Value;
		const StepAP203_PersonOrganizationItem & Value (const Standard_Integer Index);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: StepAP203_PersonOrganizationItem
") ChangeValue;
		StepAP203_PersonOrganizationItem & ChangeValue (const Standard_Integer Index);
};


%extend StepAP203_Array1OfPersonOrganizationItem {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepAP203_Array1OfSpecifiedItem;
class StepAP203_Array1OfSpecifiedItem {
	public:
		%feature("compactdefaultargs") StepAP203_Array1OfSpecifiedItem;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") StepAP203_Array1OfSpecifiedItem;
		 StepAP203_Array1OfSpecifiedItem (const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") StepAP203_Array1OfSpecifiedItem;
		%feature("autodoc", "	:param Item:
	:type Item: StepAP203_SpecifiedItem &
	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") StepAP203_Array1OfSpecifiedItem;
		 StepAP203_Array1OfSpecifiedItem (const StepAP203_SpecifiedItem & Item,const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param V:
	:type V: StepAP203_SpecifiedItem &
	:rtype: None
") Init;
		void Init (const StepAP203_SpecifiedItem & V);
		%feature("compactdefaultargs") Destroy;
		%feature("autodoc", "	:rtype: None
") Destroy;
		void Destroy ();
		%feature("compactdefaultargs") IsAllocated;
		%feature("autodoc", "	:rtype: bool
") IsAllocated;
		Standard_Boolean IsAllocated ();
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: StepAP203_Array1OfSpecifiedItem &
	:rtype: StepAP203_Array1OfSpecifiedItem
") Assign;
		const StepAP203_Array1OfSpecifiedItem & Assign (const StepAP203_Array1OfSpecifiedItem & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: StepAP203_Array1OfSpecifiedItem &
	:rtype: StepAP203_Array1OfSpecifiedItem
") operator =;
		const StepAP203_Array1OfSpecifiedItem & operator = (const StepAP203_Array1OfSpecifiedItem & Other);
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "	:rtype: int
") Length;
		Standard_Integer Length ();
		%feature("compactdefaultargs") Lower;
		%feature("autodoc", "	:rtype: int
") Lower;
		Standard_Integer Lower ();
		%feature("compactdefaultargs") Upper;
		%feature("autodoc", "	:rtype: int
") Upper;
		Standard_Integer Upper ();
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param Value:
	:type Value: StepAP203_SpecifiedItem &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const StepAP203_SpecifiedItem & Value);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: StepAP203_SpecifiedItem
") Value;
		const StepAP203_SpecifiedItem & Value (const Standard_Integer Index);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: StepAP203_SpecifiedItem
") ChangeValue;
		StepAP203_SpecifiedItem & ChangeValue (const Standard_Integer Index);
};


%extend StepAP203_Array1OfSpecifiedItem {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepAP203_Array1OfStartRequestItem;
class StepAP203_Array1OfStartRequestItem {
	public:
		%feature("compactdefaultargs") StepAP203_Array1OfStartRequestItem;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") StepAP203_Array1OfStartRequestItem;
		 StepAP203_Array1OfStartRequestItem (const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") StepAP203_Array1OfStartRequestItem;
		%feature("autodoc", "	:param Item:
	:type Item: StepAP203_StartRequestItem &
	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") StepAP203_Array1OfStartRequestItem;
		 StepAP203_Array1OfStartRequestItem (const StepAP203_StartRequestItem & Item,const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param V:
	:type V: StepAP203_StartRequestItem &
	:rtype: None
") Init;
		void Init (const StepAP203_StartRequestItem & V);
		%feature("compactdefaultargs") Destroy;
		%feature("autodoc", "	:rtype: None
") Destroy;
		void Destroy ();
		%feature("compactdefaultargs") IsAllocated;
		%feature("autodoc", "	:rtype: bool
") IsAllocated;
		Standard_Boolean IsAllocated ();
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: StepAP203_Array1OfStartRequestItem &
	:rtype: StepAP203_Array1OfStartRequestItem
") Assign;
		const StepAP203_Array1OfStartRequestItem & Assign (const StepAP203_Array1OfStartRequestItem & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: StepAP203_Array1OfStartRequestItem &
	:rtype: StepAP203_Array1OfStartRequestItem
") operator =;
		const StepAP203_Array1OfStartRequestItem & operator = (const StepAP203_Array1OfStartRequestItem & Other);
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "	:rtype: int
") Length;
		Standard_Integer Length ();
		%feature("compactdefaultargs") Lower;
		%feature("autodoc", "	:rtype: int
") Lower;
		Standard_Integer Lower ();
		%feature("compactdefaultargs") Upper;
		%feature("autodoc", "	:rtype: int
") Upper;
		Standard_Integer Upper ();
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param Value:
	:type Value: StepAP203_StartRequestItem &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const StepAP203_StartRequestItem & Value);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: StepAP203_StartRequestItem
") Value;
		const StepAP203_StartRequestItem & Value (const Standard_Integer Index);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: StepAP203_StartRequestItem
") ChangeValue;
		StepAP203_StartRequestItem & ChangeValue (const Standard_Integer Index);
};


%extend StepAP203_Array1OfStartRequestItem {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepAP203_Array1OfWorkItem;
class StepAP203_Array1OfWorkItem {
	public:
		%feature("compactdefaultargs") StepAP203_Array1OfWorkItem;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") StepAP203_Array1OfWorkItem;
		 StepAP203_Array1OfWorkItem (const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") StepAP203_Array1OfWorkItem;
		%feature("autodoc", "	:param Item:
	:type Item: StepAP203_WorkItem &
	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") StepAP203_Array1OfWorkItem;
		 StepAP203_Array1OfWorkItem (const StepAP203_WorkItem & Item,const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param V:
	:type V: StepAP203_WorkItem &
	:rtype: None
") Init;
		void Init (const StepAP203_WorkItem & V);
		%feature("compactdefaultargs") Destroy;
		%feature("autodoc", "	:rtype: None
") Destroy;
		void Destroy ();
		%feature("compactdefaultargs") IsAllocated;
		%feature("autodoc", "	:rtype: bool
") IsAllocated;
		Standard_Boolean IsAllocated ();
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: StepAP203_Array1OfWorkItem &
	:rtype: StepAP203_Array1OfWorkItem
") Assign;
		const StepAP203_Array1OfWorkItem & Assign (const StepAP203_Array1OfWorkItem & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: StepAP203_Array1OfWorkItem &
	:rtype: StepAP203_Array1OfWorkItem
") operator =;
		const StepAP203_Array1OfWorkItem & operator = (const StepAP203_Array1OfWorkItem & Other);
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "	:rtype: int
") Length;
		Standard_Integer Length ();
		%feature("compactdefaultargs") Lower;
		%feature("autodoc", "	:rtype: int
") Lower;
		Standard_Integer Lower ();
		%feature("compactdefaultargs") Upper;
		%feature("autodoc", "	:rtype: int
") Upper;
		Standard_Integer Upper ();
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param Value:
	:type Value: StepAP203_WorkItem &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const StepAP203_WorkItem & Value);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: StepAP203_WorkItem
") Value;
		const StepAP203_WorkItem & Value (const Standard_Integer Index);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: StepAP203_WorkItem
") ChangeValue;
		StepAP203_WorkItem & ChangeValue (const Standard_Integer Index);
};


%extend StepAP203_Array1OfWorkItem {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepAP203_CcDesignApproval;
class StepAP203_CcDesignApproval : public StepBasic_ApprovalAssignment {
	public:
		%feature("compactdefaultargs") StepAP203_CcDesignApproval;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") StepAP203_CcDesignApproval;
		 StepAP203_CcDesignApproval ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	* Initialize all fields (own and inherited)

	:param aApprovalAssignment_AssignedApproval:
	:type aApprovalAssignment_AssignedApproval: Handle_StepBasic_Approval &
	:param aItems:
	:type aItems: Handle_StepAP203_HArray1OfApprovedItem &
	:rtype: None
") Init;
		void Init (const Handle_StepBasic_Approval & aApprovalAssignment_AssignedApproval,const Handle_StepAP203_HArray1OfApprovedItem & aItems);
		%feature("compactdefaultargs") Items;
		%feature("autodoc", "	* Returns field Items

	:rtype: Handle_StepAP203_HArray1OfApprovedItem
") Items;
		Handle_StepAP203_HArray1OfApprovedItem Items ();
		%feature("compactdefaultargs") SetItems;
		%feature("autodoc", "	* Set field Items

	:param Items:
	:type Items: Handle_StepAP203_HArray1OfApprovedItem &
	:rtype: None
") SetItems;
		void SetItems (const Handle_StepAP203_HArray1OfApprovedItem & Items);
};


%extend StepAP203_CcDesignApproval {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepAP203_CcDesignApproval(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepAP203_CcDesignApproval::Handle_StepAP203_CcDesignApproval %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepAP203_CcDesignApproval;
class Handle_StepAP203_CcDesignApproval : public Handle_StepBasic_ApprovalAssignment {

    public:
        // constructors
        Handle_StepAP203_CcDesignApproval();
        Handle_StepAP203_CcDesignApproval(const Handle_StepAP203_CcDesignApproval &aHandle);
        Handle_StepAP203_CcDesignApproval(const StepAP203_CcDesignApproval *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepAP203_CcDesignApproval DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepAP203_CcDesignApproval {
    StepAP203_CcDesignApproval* _get_reference() {
    return (StepAP203_CcDesignApproval*)$self->Access();
    }
};

%extend Handle_StepAP203_CcDesignApproval {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepAP203_CcDesignApproval {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepAP203_CcDesignCertification;
class StepAP203_CcDesignCertification : public StepBasic_CertificationAssignment {
	public:
		%feature("compactdefaultargs") StepAP203_CcDesignCertification;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") StepAP203_CcDesignCertification;
		 StepAP203_CcDesignCertification ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	* Initialize all fields (own and inherited)

	:param aCertificationAssignment_AssignedCertification:
	:type aCertificationAssignment_AssignedCertification: Handle_StepBasic_Certification &
	:param aItems:
	:type aItems: Handle_StepAP203_HArray1OfCertifiedItem &
	:rtype: None
") Init;
		void Init (const Handle_StepBasic_Certification & aCertificationAssignment_AssignedCertification,const Handle_StepAP203_HArray1OfCertifiedItem & aItems);
		%feature("compactdefaultargs") Items;
		%feature("autodoc", "	* Returns field Items

	:rtype: Handle_StepAP203_HArray1OfCertifiedItem
") Items;
		Handle_StepAP203_HArray1OfCertifiedItem Items ();
		%feature("compactdefaultargs") SetItems;
		%feature("autodoc", "	* Set field Items

	:param Items:
	:type Items: Handle_StepAP203_HArray1OfCertifiedItem &
	:rtype: None
") SetItems;
		void SetItems (const Handle_StepAP203_HArray1OfCertifiedItem & Items);
};


%extend StepAP203_CcDesignCertification {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepAP203_CcDesignCertification(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepAP203_CcDesignCertification::Handle_StepAP203_CcDesignCertification %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepAP203_CcDesignCertification;
class Handle_StepAP203_CcDesignCertification : public Handle_StepBasic_CertificationAssignment {

    public:
        // constructors
        Handle_StepAP203_CcDesignCertification();
        Handle_StepAP203_CcDesignCertification(const Handle_StepAP203_CcDesignCertification &aHandle);
        Handle_StepAP203_CcDesignCertification(const StepAP203_CcDesignCertification *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepAP203_CcDesignCertification DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepAP203_CcDesignCertification {
    StepAP203_CcDesignCertification* _get_reference() {
    return (StepAP203_CcDesignCertification*)$self->Access();
    }
};

%extend Handle_StepAP203_CcDesignCertification {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepAP203_CcDesignCertification {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepAP203_CcDesignContract;
class StepAP203_CcDesignContract : public StepBasic_ContractAssignment {
	public:
		%feature("compactdefaultargs") StepAP203_CcDesignContract;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") StepAP203_CcDesignContract;
		 StepAP203_CcDesignContract ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	* Initialize all fields (own and inherited)

	:param aContractAssignment_AssignedContract:
	:type aContractAssignment_AssignedContract: Handle_StepBasic_Contract &
	:param aItems:
	:type aItems: Handle_StepAP203_HArray1OfContractedItem &
	:rtype: None
") Init;
		void Init (const Handle_StepBasic_Contract & aContractAssignment_AssignedContract,const Handle_StepAP203_HArray1OfContractedItem & aItems);
		%feature("compactdefaultargs") Items;
		%feature("autodoc", "	* Returns field Items

	:rtype: Handle_StepAP203_HArray1OfContractedItem
") Items;
		Handle_StepAP203_HArray1OfContractedItem Items ();
		%feature("compactdefaultargs") SetItems;
		%feature("autodoc", "	* Set field Items

	:param Items:
	:type Items: Handle_StepAP203_HArray1OfContractedItem &
	:rtype: None
") SetItems;
		void SetItems (const Handle_StepAP203_HArray1OfContractedItem & Items);
};


%extend StepAP203_CcDesignContract {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepAP203_CcDesignContract(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepAP203_CcDesignContract::Handle_StepAP203_CcDesignContract %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepAP203_CcDesignContract;
class Handle_StepAP203_CcDesignContract : public Handle_StepBasic_ContractAssignment {

    public:
        // constructors
        Handle_StepAP203_CcDesignContract();
        Handle_StepAP203_CcDesignContract(const Handle_StepAP203_CcDesignContract &aHandle);
        Handle_StepAP203_CcDesignContract(const StepAP203_CcDesignContract *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepAP203_CcDesignContract DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepAP203_CcDesignContract {
    StepAP203_CcDesignContract* _get_reference() {
    return (StepAP203_CcDesignContract*)$self->Access();
    }
};

%extend Handle_StepAP203_CcDesignContract {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepAP203_CcDesignContract {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepAP203_CcDesignDateAndTimeAssignment;
class StepAP203_CcDesignDateAndTimeAssignment : public StepBasic_DateAndTimeAssignment {
	public:
		%feature("compactdefaultargs") StepAP203_CcDesignDateAndTimeAssignment;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") StepAP203_CcDesignDateAndTimeAssignment;
		 StepAP203_CcDesignDateAndTimeAssignment ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	* Initialize all fields (own and inherited)

	:param aDateAndTimeAssignment_AssignedDateAndTime:
	:type aDateAndTimeAssignment_AssignedDateAndTime: Handle_StepBasic_DateAndTime &
	:param aDateAndTimeAssignment_Role:
	:type aDateAndTimeAssignment_Role: Handle_StepBasic_DateTimeRole &
	:param aItems:
	:type aItems: Handle_StepAP203_HArray1OfDateTimeItem &
	:rtype: None
") Init;
		void Init (const Handle_StepBasic_DateAndTime & aDateAndTimeAssignment_AssignedDateAndTime,const Handle_StepBasic_DateTimeRole & aDateAndTimeAssignment_Role,const Handle_StepAP203_HArray1OfDateTimeItem & aItems);
		%feature("compactdefaultargs") Items;
		%feature("autodoc", "	* Returns field Items

	:rtype: Handle_StepAP203_HArray1OfDateTimeItem
") Items;
		Handle_StepAP203_HArray1OfDateTimeItem Items ();
		%feature("compactdefaultargs") SetItems;
		%feature("autodoc", "	* Set field Items

	:param Items:
	:type Items: Handle_StepAP203_HArray1OfDateTimeItem &
	:rtype: None
") SetItems;
		void SetItems (const Handle_StepAP203_HArray1OfDateTimeItem & Items);
};


%extend StepAP203_CcDesignDateAndTimeAssignment {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepAP203_CcDesignDateAndTimeAssignment(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepAP203_CcDesignDateAndTimeAssignment::Handle_StepAP203_CcDesignDateAndTimeAssignment %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepAP203_CcDesignDateAndTimeAssignment;
class Handle_StepAP203_CcDesignDateAndTimeAssignment : public Handle_StepBasic_DateAndTimeAssignment {

    public:
        // constructors
        Handle_StepAP203_CcDesignDateAndTimeAssignment();
        Handle_StepAP203_CcDesignDateAndTimeAssignment(const Handle_StepAP203_CcDesignDateAndTimeAssignment &aHandle);
        Handle_StepAP203_CcDesignDateAndTimeAssignment(const StepAP203_CcDesignDateAndTimeAssignment *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepAP203_CcDesignDateAndTimeAssignment DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepAP203_CcDesignDateAndTimeAssignment {
    StepAP203_CcDesignDateAndTimeAssignment* _get_reference() {
    return (StepAP203_CcDesignDateAndTimeAssignment*)$self->Access();
    }
};

%extend Handle_StepAP203_CcDesignDateAndTimeAssignment {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepAP203_CcDesignDateAndTimeAssignment {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepAP203_CcDesignPersonAndOrganizationAssignment;
class StepAP203_CcDesignPersonAndOrganizationAssignment : public StepBasic_PersonAndOrganizationAssignment {
	public:
		%feature("compactdefaultargs") StepAP203_CcDesignPersonAndOrganizationAssignment;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") StepAP203_CcDesignPersonAndOrganizationAssignment;
		 StepAP203_CcDesignPersonAndOrganizationAssignment ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	* Initialize all fields (own and inherited)

	:param aPersonAndOrganizationAssignment_AssignedPersonAndOrganization:
	:type aPersonAndOrganizationAssignment_AssignedPersonAndOrganization: Handle_StepBasic_PersonAndOrganization &
	:param aPersonAndOrganizationAssignment_Role:
	:type aPersonAndOrganizationAssignment_Role: Handle_StepBasic_PersonAndOrganizationRole &
	:param aItems:
	:type aItems: Handle_StepAP203_HArray1OfPersonOrganizationItem &
	:rtype: None
") Init;
		void Init (const Handle_StepBasic_PersonAndOrganization & aPersonAndOrganizationAssignment_AssignedPersonAndOrganization,const Handle_StepBasic_PersonAndOrganizationRole & aPersonAndOrganizationAssignment_Role,const Handle_StepAP203_HArray1OfPersonOrganizationItem & aItems);
		%feature("compactdefaultargs") Items;
		%feature("autodoc", "	* Returns field Items

	:rtype: Handle_StepAP203_HArray1OfPersonOrganizationItem
") Items;
		Handle_StepAP203_HArray1OfPersonOrganizationItem Items ();
		%feature("compactdefaultargs") SetItems;
		%feature("autodoc", "	* Set field Items

	:param Items:
	:type Items: Handle_StepAP203_HArray1OfPersonOrganizationItem &
	:rtype: None
") SetItems;
		void SetItems (const Handle_StepAP203_HArray1OfPersonOrganizationItem & Items);
};


%extend StepAP203_CcDesignPersonAndOrganizationAssignment {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepAP203_CcDesignPersonAndOrganizationAssignment(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepAP203_CcDesignPersonAndOrganizationAssignment::Handle_StepAP203_CcDesignPersonAndOrganizationAssignment %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepAP203_CcDesignPersonAndOrganizationAssignment;
class Handle_StepAP203_CcDesignPersonAndOrganizationAssignment : public Handle_StepBasic_PersonAndOrganizationAssignment {

    public:
        // constructors
        Handle_StepAP203_CcDesignPersonAndOrganizationAssignment();
        Handle_StepAP203_CcDesignPersonAndOrganizationAssignment(const Handle_StepAP203_CcDesignPersonAndOrganizationAssignment &aHandle);
        Handle_StepAP203_CcDesignPersonAndOrganizationAssignment(const StepAP203_CcDesignPersonAndOrganizationAssignment *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepAP203_CcDesignPersonAndOrganizationAssignment DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepAP203_CcDesignPersonAndOrganizationAssignment {
    StepAP203_CcDesignPersonAndOrganizationAssignment* _get_reference() {
    return (StepAP203_CcDesignPersonAndOrganizationAssignment*)$self->Access();
    }
};

%extend Handle_StepAP203_CcDesignPersonAndOrganizationAssignment {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepAP203_CcDesignPersonAndOrganizationAssignment {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepAP203_CcDesignSecurityClassification;
class StepAP203_CcDesignSecurityClassification : public StepBasic_SecurityClassificationAssignment {
	public:
		%feature("compactdefaultargs") StepAP203_CcDesignSecurityClassification;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") StepAP203_CcDesignSecurityClassification;
		 StepAP203_CcDesignSecurityClassification ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	* Initialize all fields (own and inherited)

	:param aSecurityClassificationAssignment_AssignedSecurityClassification:
	:type aSecurityClassificationAssignment_AssignedSecurityClassification: Handle_StepBasic_SecurityClassification &
	:param aItems:
	:type aItems: Handle_StepAP203_HArray1OfClassifiedItem &
	:rtype: None
") Init;
		void Init (const Handle_StepBasic_SecurityClassification & aSecurityClassificationAssignment_AssignedSecurityClassification,const Handle_StepAP203_HArray1OfClassifiedItem & aItems);
		%feature("compactdefaultargs") Items;
		%feature("autodoc", "	* Returns field Items

	:rtype: Handle_StepAP203_HArray1OfClassifiedItem
") Items;
		Handle_StepAP203_HArray1OfClassifiedItem Items ();
		%feature("compactdefaultargs") SetItems;
		%feature("autodoc", "	* Set field Items

	:param Items:
	:type Items: Handle_StepAP203_HArray1OfClassifiedItem &
	:rtype: None
") SetItems;
		void SetItems (const Handle_StepAP203_HArray1OfClassifiedItem & Items);
};


%extend StepAP203_CcDesignSecurityClassification {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepAP203_CcDesignSecurityClassification(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepAP203_CcDesignSecurityClassification::Handle_StepAP203_CcDesignSecurityClassification %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepAP203_CcDesignSecurityClassification;
class Handle_StepAP203_CcDesignSecurityClassification : public Handle_StepBasic_SecurityClassificationAssignment {

    public:
        // constructors
        Handle_StepAP203_CcDesignSecurityClassification();
        Handle_StepAP203_CcDesignSecurityClassification(const Handle_StepAP203_CcDesignSecurityClassification &aHandle);
        Handle_StepAP203_CcDesignSecurityClassification(const StepAP203_CcDesignSecurityClassification *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepAP203_CcDesignSecurityClassification DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepAP203_CcDesignSecurityClassification {
    StepAP203_CcDesignSecurityClassification* _get_reference() {
    return (StepAP203_CcDesignSecurityClassification*)$self->Access();
    }
};

%extend Handle_StepAP203_CcDesignSecurityClassification {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepAP203_CcDesignSecurityClassification {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepAP203_CcDesignSpecificationReference;
class StepAP203_CcDesignSpecificationReference : public StepBasic_DocumentReference {
	public:
		%feature("compactdefaultargs") StepAP203_CcDesignSpecificationReference;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") StepAP203_CcDesignSpecificationReference;
		 StepAP203_CcDesignSpecificationReference ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	* Initialize all fields (own and inherited)

	:param aDocumentReference_AssignedDocument:
	:type aDocumentReference_AssignedDocument: Handle_StepBasic_Document &
	:param aDocumentReference_Source:
	:type aDocumentReference_Source: Handle_TCollection_HAsciiString &
	:param aItems:
	:type aItems: Handle_StepAP203_HArray1OfSpecifiedItem &
	:rtype: None
") Init;
		void Init (const Handle_StepBasic_Document & aDocumentReference_AssignedDocument,const Handle_TCollection_HAsciiString & aDocumentReference_Source,const Handle_StepAP203_HArray1OfSpecifiedItem & aItems);
		%feature("compactdefaultargs") Items;
		%feature("autodoc", "	* Returns field Items

	:rtype: Handle_StepAP203_HArray1OfSpecifiedItem
") Items;
		Handle_StepAP203_HArray1OfSpecifiedItem Items ();
		%feature("compactdefaultargs") SetItems;
		%feature("autodoc", "	* Set field Items

	:param Items:
	:type Items: Handle_StepAP203_HArray1OfSpecifiedItem &
	:rtype: None
") SetItems;
		void SetItems (const Handle_StepAP203_HArray1OfSpecifiedItem & Items);
};


%extend StepAP203_CcDesignSpecificationReference {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepAP203_CcDesignSpecificationReference(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepAP203_CcDesignSpecificationReference::Handle_StepAP203_CcDesignSpecificationReference %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepAP203_CcDesignSpecificationReference;
class Handle_StepAP203_CcDesignSpecificationReference : public Handle_StepBasic_DocumentReference {

    public:
        // constructors
        Handle_StepAP203_CcDesignSpecificationReference();
        Handle_StepAP203_CcDesignSpecificationReference(const Handle_StepAP203_CcDesignSpecificationReference &aHandle);
        Handle_StepAP203_CcDesignSpecificationReference(const StepAP203_CcDesignSpecificationReference *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepAP203_CcDesignSpecificationReference DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepAP203_CcDesignSpecificationReference {
    StepAP203_CcDesignSpecificationReference* _get_reference() {
    return (StepAP203_CcDesignSpecificationReference*)$self->Access();
    }
};

%extend Handle_StepAP203_CcDesignSpecificationReference {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepAP203_CcDesignSpecificationReference {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepAP203_CertifiedItem;
class StepAP203_CertifiedItem : public StepData_SelectType {
	public:
		%feature("compactdefaultargs") StepAP203_CertifiedItem;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") StepAP203_CertifiedItem;
		 StepAP203_CertifiedItem ();
		%feature("compactdefaultargs") CaseNum;
		%feature("autodoc", "	* Recognizes a kind of CertifiedItem select type 1 -> SuppliedPartRelationship from StepRepr 0 else

	:param ent:
	:type ent: Handle_Standard_Transient &
	:rtype: int
") CaseNum;
		Standard_Integer CaseNum (const Handle_Standard_Transient & ent);
		%feature("compactdefaultargs") SuppliedPartRelationship;
		%feature("autodoc", "	* Returns Value as SuppliedPartRelationship (or Null if another type)

	:rtype: Handle_StepRepr_SuppliedPartRelationship
") SuppliedPartRelationship;
		Handle_StepRepr_SuppliedPartRelationship SuppliedPartRelationship ();
};


%extend StepAP203_CertifiedItem {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepAP203_Change;
class StepAP203_Change : public StepBasic_ActionAssignment {
	public:
		%feature("compactdefaultargs") StepAP203_Change;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") StepAP203_Change;
		 StepAP203_Change ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	* Initialize all fields (own and inherited)

	:param aActionAssignment_AssignedAction:
	:type aActionAssignment_AssignedAction: Handle_StepBasic_Action &
	:param aItems:
	:type aItems: Handle_StepAP203_HArray1OfWorkItem &
	:rtype: None
") Init;
		void Init (const Handle_StepBasic_Action & aActionAssignment_AssignedAction,const Handle_StepAP203_HArray1OfWorkItem & aItems);
		%feature("compactdefaultargs") Items;
		%feature("autodoc", "	* Returns field Items

	:rtype: Handle_StepAP203_HArray1OfWorkItem
") Items;
		Handle_StepAP203_HArray1OfWorkItem Items ();
		%feature("compactdefaultargs") SetItems;
		%feature("autodoc", "	* Set field Items

	:param Items:
	:type Items: Handle_StepAP203_HArray1OfWorkItem &
	:rtype: None
") SetItems;
		void SetItems (const Handle_StepAP203_HArray1OfWorkItem & Items);
};


%extend StepAP203_Change {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepAP203_Change(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepAP203_Change::Handle_StepAP203_Change %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepAP203_Change;
class Handle_StepAP203_Change : public Handle_StepBasic_ActionAssignment {

    public:
        // constructors
        Handle_StepAP203_Change();
        Handle_StepAP203_Change(const Handle_StepAP203_Change &aHandle);
        Handle_StepAP203_Change(const StepAP203_Change *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepAP203_Change DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepAP203_Change {
    StepAP203_Change* _get_reference() {
    return (StepAP203_Change*)$self->Access();
    }
};

%extend Handle_StepAP203_Change {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepAP203_Change {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepAP203_ChangeRequest;
class StepAP203_ChangeRequest : public StepBasic_ActionRequestAssignment {
	public:
		%feature("compactdefaultargs") StepAP203_ChangeRequest;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") StepAP203_ChangeRequest;
		 StepAP203_ChangeRequest ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	* Initialize all fields (own and inherited)

	:param aActionRequestAssignment_AssignedActionRequest:
	:type aActionRequestAssignment_AssignedActionRequest: Handle_StepBasic_VersionedActionRequest &
	:param aItems:
	:type aItems: Handle_StepAP203_HArray1OfChangeRequestItem &
	:rtype: None
") Init;
		void Init (const Handle_StepBasic_VersionedActionRequest & aActionRequestAssignment_AssignedActionRequest,const Handle_StepAP203_HArray1OfChangeRequestItem & aItems);
		%feature("compactdefaultargs") Items;
		%feature("autodoc", "	* Returns field Items

	:rtype: Handle_StepAP203_HArray1OfChangeRequestItem
") Items;
		Handle_StepAP203_HArray1OfChangeRequestItem Items ();
		%feature("compactdefaultargs") SetItems;
		%feature("autodoc", "	* Set field Items

	:param Items:
	:type Items: Handle_StepAP203_HArray1OfChangeRequestItem &
	:rtype: None
") SetItems;
		void SetItems (const Handle_StepAP203_HArray1OfChangeRequestItem & Items);
};


%extend StepAP203_ChangeRequest {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepAP203_ChangeRequest(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepAP203_ChangeRequest::Handle_StepAP203_ChangeRequest %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepAP203_ChangeRequest;
class Handle_StepAP203_ChangeRequest : public Handle_StepBasic_ActionRequestAssignment {

    public:
        // constructors
        Handle_StepAP203_ChangeRequest();
        Handle_StepAP203_ChangeRequest(const Handle_StepAP203_ChangeRequest &aHandle);
        Handle_StepAP203_ChangeRequest(const StepAP203_ChangeRequest *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepAP203_ChangeRequest DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepAP203_ChangeRequest {
    StepAP203_ChangeRequest* _get_reference() {
    return (StepAP203_ChangeRequest*)$self->Access();
    }
};

%extend Handle_StepAP203_ChangeRequest {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepAP203_ChangeRequest {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepAP203_ChangeRequestItem;
class StepAP203_ChangeRequestItem : public StepData_SelectType {
	public:
		%feature("compactdefaultargs") StepAP203_ChangeRequestItem;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") StepAP203_ChangeRequestItem;
		 StepAP203_ChangeRequestItem ();
		%feature("compactdefaultargs") CaseNum;
		%feature("autodoc", "	* Recognizes a kind of ChangeRequestItem select type 1 -> ProductDefinitionFormation from StepBasic 0 else

	:param ent:
	:type ent: Handle_Standard_Transient &
	:rtype: int
") CaseNum;
		Standard_Integer CaseNum (const Handle_Standard_Transient & ent);
		%feature("compactdefaultargs") ProductDefinitionFormation;
		%feature("autodoc", "	* Returns Value as ProductDefinitionFormation (or Null if another type)

	:rtype: Handle_StepBasic_ProductDefinitionFormation
") ProductDefinitionFormation;
		Handle_StepBasic_ProductDefinitionFormation ProductDefinitionFormation ();
};


%extend StepAP203_ChangeRequestItem {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepAP203_ClassifiedItem;
class StepAP203_ClassifiedItem : public StepData_SelectType {
	public:
		%feature("compactdefaultargs") StepAP203_ClassifiedItem;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") StepAP203_ClassifiedItem;
		 StepAP203_ClassifiedItem ();
		%feature("compactdefaultargs") CaseNum;
		%feature("autodoc", "	* Recognizes a kind of ClassifiedItem select type 1 -> ProductDefinitionFormation from StepBasic 2 -> AssemblyComponentUsage from StepRepr 0 else

	:param ent:
	:type ent: Handle_Standard_Transient &
	:rtype: int
") CaseNum;
		Standard_Integer CaseNum (const Handle_Standard_Transient & ent);
		%feature("compactdefaultargs") ProductDefinitionFormation;
		%feature("autodoc", "	* Returns Value as ProductDefinitionFormation (or Null if another type)

	:rtype: Handle_StepBasic_ProductDefinitionFormation
") ProductDefinitionFormation;
		Handle_StepBasic_ProductDefinitionFormation ProductDefinitionFormation ();
		%feature("compactdefaultargs") AssemblyComponentUsage;
		%feature("autodoc", "	* Returns Value as AssemblyComponentUsage (or Null if another type)

	:rtype: Handle_StepRepr_AssemblyComponentUsage
") AssemblyComponentUsage;
		Handle_StepRepr_AssemblyComponentUsage AssemblyComponentUsage ();
};


%extend StepAP203_ClassifiedItem {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepAP203_ContractedItem;
class StepAP203_ContractedItem : public StepData_SelectType {
	public:
		%feature("compactdefaultargs") StepAP203_ContractedItem;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") StepAP203_ContractedItem;
		 StepAP203_ContractedItem ();
		%feature("compactdefaultargs") CaseNum;
		%feature("autodoc", "	* Recognizes a kind of ContractedItem select type 1 -> ProductDefinitionFormation from StepBasic 0 else

	:param ent:
	:type ent: Handle_Standard_Transient &
	:rtype: int
") CaseNum;
		Standard_Integer CaseNum (const Handle_Standard_Transient & ent);
		%feature("compactdefaultargs") ProductDefinitionFormation;
		%feature("autodoc", "	* Returns Value as ProductDefinitionFormation (or Null if another type)

	:rtype: Handle_StepBasic_ProductDefinitionFormation
") ProductDefinitionFormation;
		Handle_StepBasic_ProductDefinitionFormation ProductDefinitionFormation ();
};


%extend StepAP203_ContractedItem {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepAP203_DateTimeItem;
class StepAP203_DateTimeItem : public StepData_SelectType {
	public:
		%feature("compactdefaultargs") StepAP203_DateTimeItem;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") StepAP203_DateTimeItem;
		 StepAP203_DateTimeItem ();
		%feature("compactdefaultargs") CaseNum;
		%feature("autodoc", "	* Recognizes a kind of DateTimeItem select type 1 -> ProductDefinition from StepBasic 2 -> ChangeRequest from StepAP203 3 -> StartRequest from StepAP203 4 -> Change from StepAP203 5 -> StartWork from StepAP203 6 -> ApprovalPersonOrganization from StepBasic 7 -> Contract from StepBasic 8 -> SecurityClassification from StepBasic 9 -> Certification from StepBasic 0 else

	:param ent:
	:type ent: Handle_Standard_Transient &
	:rtype: int
") CaseNum;
		Standard_Integer CaseNum (const Handle_Standard_Transient & ent);
		%feature("compactdefaultargs") ProductDefinition;
		%feature("autodoc", "	* Returns Value as ProductDefinition (or Null if another type)

	:rtype: Handle_StepBasic_ProductDefinition
") ProductDefinition;
		Handle_StepBasic_ProductDefinition ProductDefinition ();
		%feature("compactdefaultargs") ChangeRequest;
		%feature("autodoc", "	* Returns Value as ChangeRequest (or Null if another type)

	:rtype: Handle_StepAP203_ChangeRequest
") ChangeRequest;
		Handle_StepAP203_ChangeRequest ChangeRequest ();
		%feature("compactdefaultargs") StartRequest;
		%feature("autodoc", "	* Returns Value as StartRequest (or Null if another type)

	:rtype: Handle_StepAP203_StartRequest
") StartRequest;
		Handle_StepAP203_StartRequest StartRequest ();
		%feature("compactdefaultargs") Change;
		%feature("autodoc", "	* Returns Value as Change (or Null if another type)

	:rtype: Handle_StepAP203_Change
") Change;
		Handle_StepAP203_Change Change ();
		%feature("compactdefaultargs") StartWork;
		%feature("autodoc", "	* Returns Value as StartWork (or Null if another type)

	:rtype: Handle_StepAP203_StartWork
") StartWork;
		Handle_StepAP203_StartWork StartWork ();
		%feature("compactdefaultargs") ApprovalPersonOrganization;
		%feature("autodoc", "	* Returns Value as ApprovalPersonOrganization (or Null if another type)

	:rtype: Handle_StepBasic_ApprovalPersonOrganization
") ApprovalPersonOrganization;
		Handle_StepBasic_ApprovalPersonOrganization ApprovalPersonOrganization ();
		%feature("compactdefaultargs") Contract;
		%feature("autodoc", "	* Returns Value as Contract (or Null if another type)

	:rtype: Handle_StepBasic_Contract
") Contract;
		Handle_StepBasic_Contract Contract ();
		%feature("compactdefaultargs") SecurityClassification;
		%feature("autodoc", "	* Returns Value as SecurityClassification (or Null if another type)

	:rtype: Handle_StepBasic_SecurityClassification
") SecurityClassification;
		Handle_StepBasic_SecurityClassification SecurityClassification ();
		%feature("compactdefaultargs") Certification;
		%feature("autodoc", "	* Returns Value as Certification (or Null if another type)

	:rtype: Handle_StepBasic_Certification
") Certification;
		Handle_StepBasic_Certification Certification ();
};


%extend StepAP203_DateTimeItem {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepAP203_HArray1OfApprovedItem;
class StepAP203_HArray1OfApprovedItem : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") StepAP203_HArray1OfApprovedItem;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") StepAP203_HArray1OfApprovedItem;
		 StepAP203_HArray1OfApprovedItem (const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") StepAP203_HArray1OfApprovedItem;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:param V:
	:type V: StepAP203_ApprovedItem &
	:rtype: None
") StepAP203_HArray1OfApprovedItem;
		 StepAP203_HArray1OfApprovedItem (const Standard_Integer Low,const Standard_Integer Up,const StepAP203_ApprovedItem & V);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param V:
	:type V: StepAP203_ApprovedItem &
	:rtype: None
") Init;
		void Init (const StepAP203_ApprovedItem & V);
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "	:rtype: int
") Length;
		Standard_Integer Length ();
		%feature("compactdefaultargs") Lower;
		%feature("autodoc", "	:rtype: int
") Lower;
		Standard_Integer Lower ();
		%feature("compactdefaultargs") Upper;
		%feature("autodoc", "	:rtype: int
") Upper;
		Standard_Integer Upper ();
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param Value:
	:type Value: StepAP203_ApprovedItem &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const StepAP203_ApprovedItem & Value);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: StepAP203_ApprovedItem
") Value;
		const StepAP203_ApprovedItem & Value (const Standard_Integer Index);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: StepAP203_ApprovedItem
") ChangeValue;
		StepAP203_ApprovedItem & ChangeValue (const Standard_Integer Index);
		%feature("compactdefaultargs") Array1;
		%feature("autodoc", "	:rtype: StepAP203_Array1OfApprovedItem
") Array1;
		const StepAP203_Array1OfApprovedItem & Array1 ();
		%feature("compactdefaultargs") ChangeArray1;
		%feature("autodoc", "	:rtype: StepAP203_Array1OfApprovedItem
") ChangeArray1;
		StepAP203_Array1OfApprovedItem & ChangeArray1 ();
};


%extend StepAP203_HArray1OfApprovedItem {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepAP203_HArray1OfApprovedItem(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepAP203_HArray1OfApprovedItem::Handle_StepAP203_HArray1OfApprovedItem %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepAP203_HArray1OfApprovedItem;
class Handle_StepAP203_HArray1OfApprovedItem : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_StepAP203_HArray1OfApprovedItem();
        Handle_StepAP203_HArray1OfApprovedItem(const Handle_StepAP203_HArray1OfApprovedItem &aHandle);
        Handle_StepAP203_HArray1OfApprovedItem(const StepAP203_HArray1OfApprovedItem *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepAP203_HArray1OfApprovedItem DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepAP203_HArray1OfApprovedItem {
    StepAP203_HArray1OfApprovedItem* _get_reference() {
    return (StepAP203_HArray1OfApprovedItem*)$self->Access();
    }
};

%extend Handle_StepAP203_HArray1OfApprovedItem {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepAP203_HArray1OfApprovedItem {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepAP203_HArray1OfCertifiedItem;
class StepAP203_HArray1OfCertifiedItem : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") StepAP203_HArray1OfCertifiedItem;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") StepAP203_HArray1OfCertifiedItem;
		 StepAP203_HArray1OfCertifiedItem (const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") StepAP203_HArray1OfCertifiedItem;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:param V:
	:type V: StepAP203_CertifiedItem &
	:rtype: None
") StepAP203_HArray1OfCertifiedItem;
		 StepAP203_HArray1OfCertifiedItem (const Standard_Integer Low,const Standard_Integer Up,const StepAP203_CertifiedItem & V);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param V:
	:type V: StepAP203_CertifiedItem &
	:rtype: None
") Init;
		void Init (const StepAP203_CertifiedItem & V);
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "	:rtype: int
") Length;
		Standard_Integer Length ();
		%feature("compactdefaultargs") Lower;
		%feature("autodoc", "	:rtype: int
") Lower;
		Standard_Integer Lower ();
		%feature("compactdefaultargs") Upper;
		%feature("autodoc", "	:rtype: int
") Upper;
		Standard_Integer Upper ();
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param Value:
	:type Value: StepAP203_CertifiedItem &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const StepAP203_CertifiedItem & Value);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: StepAP203_CertifiedItem
") Value;
		const StepAP203_CertifiedItem & Value (const Standard_Integer Index);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: StepAP203_CertifiedItem
") ChangeValue;
		StepAP203_CertifiedItem & ChangeValue (const Standard_Integer Index);
		%feature("compactdefaultargs") Array1;
		%feature("autodoc", "	:rtype: StepAP203_Array1OfCertifiedItem
") Array1;
		const StepAP203_Array1OfCertifiedItem & Array1 ();
		%feature("compactdefaultargs") ChangeArray1;
		%feature("autodoc", "	:rtype: StepAP203_Array1OfCertifiedItem
") ChangeArray1;
		StepAP203_Array1OfCertifiedItem & ChangeArray1 ();
};


%extend StepAP203_HArray1OfCertifiedItem {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepAP203_HArray1OfCertifiedItem(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepAP203_HArray1OfCertifiedItem::Handle_StepAP203_HArray1OfCertifiedItem %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepAP203_HArray1OfCertifiedItem;
class Handle_StepAP203_HArray1OfCertifiedItem : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_StepAP203_HArray1OfCertifiedItem();
        Handle_StepAP203_HArray1OfCertifiedItem(const Handle_StepAP203_HArray1OfCertifiedItem &aHandle);
        Handle_StepAP203_HArray1OfCertifiedItem(const StepAP203_HArray1OfCertifiedItem *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepAP203_HArray1OfCertifiedItem DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepAP203_HArray1OfCertifiedItem {
    StepAP203_HArray1OfCertifiedItem* _get_reference() {
    return (StepAP203_HArray1OfCertifiedItem*)$self->Access();
    }
};

%extend Handle_StepAP203_HArray1OfCertifiedItem {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepAP203_HArray1OfCertifiedItem {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepAP203_HArray1OfChangeRequestItem;
class StepAP203_HArray1OfChangeRequestItem : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") StepAP203_HArray1OfChangeRequestItem;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") StepAP203_HArray1OfChangeRequestItem;
		 StepAP203_HArray1OfChangeRequestItem (const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") StepAP203_HArray1OfChangeRequestItem;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:param V:
	:type V: StepAP203_ChangeRequestItem &
	:rtype: None
") StepAP203_HArray1OfChangeRequestItem;
		 StepAP203_HArray1OfChangeRequestItem (const Standard_Integer Low,const Standard_Integer Up,const StepAP203_ChangeRequestItem & V);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param V:
	:type V: StepAP203_ChangeRequestItem &
	:rtype: None
") Init;
		void Init (const StepAP203_ChangeRequestItem & V);
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "	:rtype: int
") Length;
		Standard_Integer Length ();
		%feature("compactdefaultargs") Lower;
		%feature("autodoc", "	:rtype: int
") Lower;
		Standard_Integer Lower ();
		%feature("compactdefaultargs") Upper;
		%feature("autodoc", "	:rtype: int
") Upper;
		Standard_Integer Upper ();
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param Value:
	:type Value: StepAP203_ChangeRequestItem &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const StepAP203_ChangeRequestItem & Value);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: StepAP203_ChangeRequestItem
") Value;
		const StepAP203_ChangeRequestItem & Value (const Standard_Integer Index);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: StepAP203_ChangeRequestItem
") ChangeValue;
		StepAP203_ChangeRequestItem & ChangeValue (const Standard_Integer Index);
		%feature("compactdefaultargs") Array1;
		%feature("autodoc", "	:rtype: StepAP203_Array1OfChangeRequestItem
") Array1;
		const StepAP203_Array1OfChangeRequestItem & Array1 ();
		%feature("compactdefaultargs") ChangeArray1;
		%feature("autodoc", "	:rtype: StepAP203_Array1OfChangeRequestItem
") ChangeArray1;
		StepAP203_Array1OfChangeRequestItem & ChangeArray1 ();
};


%extend StepAP203_HArray1OfChangeRequestItem {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepAP203_HArray1OfChangeRequestItem(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepAP203_HArray1OfChangeRequestItem::Handle_StepAP203_HArray1OfChangeRequestItem %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepAP203_HArray1OfChangeRequestItem;
class Handle_StepAP203_HArray1OfChangeRequestItem : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_StepAP203_HArray1OfChangeRequestItem();
        Handle_StepAP203_HArray1OfChangeRequestItem(const Handle_StepAP203_HArray1OfChangeRequestItem &aHandle);
        Handle_StepAP203_HArray1OfChangeRequestItem(const StepAP203_HArray1OfChangeRequestItem *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepAP203_HArray1OfChangeRequestItem DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepAP203_HArray1OfChangeRequestItem {
    StepAP203_HArray1OfChangeRequestItem* _get_reference() {
    return (StepAP203_HArray1OfChangeRequestItem*)$self->Access();
    }
};

%extend Handle_StepAP203_HArray1OfChangeRequestItem {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepAP203_HArray1OfChangeRequestItem {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepAP203_HArray1OfClassifiedItem;
class StepAP203_HArray1OfClassifiedItem : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") StepAP203_HArray1OfClassifiedItem;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") StepAP203_HArray1OfClassifiedItem;
		 StepAP203_HArray1OfClassifiedItem (const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") StepAP203_HArray1OfClassifiedItem;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:param V:
	:type V: StepAP203_ClassifiedItem &
	:rtype: None
") StepAP203_HArray1OfClassifiedItem;
		 StepAP203_HArray1OfClassifiedItem (const Standard_Integer Low,const Standard_Integer Up,const StepAP203_ClassifiedItem & V);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param V:
	:type V: StepAP203_ClassifiedItem &
	:rtype: None
") Init;
		void Init (const StepAP203_ClassifiedItem & V);
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "	:rtype: int
") Length;
		Standard_Integer Length ();
		%feature("compactdefaultargs") Lower;
		%feature("autodoc", "	:rtype: int
") Lower;
		Standard_Integer Lower ();
		%feature("compactdefaultargs") Upper;
		%feature("autodoc", "	:rtype: int
") Upper;
		Standard_Integer Upper ();
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param Value:
	:type Value: StepAP203_ClassifiedItem &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const StepAP203_ClassifiedItem & Value);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: StepAP203_ClassifiedItem
") Value;
		const StepAP203_ClassifiedItem & Value (const Standard_Integer Index);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: StepAP203_ClassifiedItem
") ChangeValue;
		StepAP203_ClassifiedItem & ChangeValue (const Standard_Integer Index);
		%feature("compactdefaultargs") Array1;
		%feature("autodoc", "	:rtype: StepAP203_Array1OfClassifiedItem
") Array1;
		const StepAP203_Array1OfClassifiedItem & Array1 ();
		%feature("compactdefaultargs") ChangeArray1;
		%feature("autodoc", "	:rtype: StepAP203_Array1OfClassifiedItem
") ChangeArray1;
		StepAP203_Array1OfClassifiedItem & ChangeArray1 ();
};


%extend StepAP203_HArray1OfClassifiedItem {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepAP203_HArray1OfClassifiedItem(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepAP203_HArray1OfClassifiedItem::Handle_StepAP203_HArray1OfClassifiedItem %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepAP203_HArray1OfClassifiedItem;
class Handle_StepAP203_HArray1OfClassifiedItem : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_StepAP203_HArray1OfClassifiedItem();
        Handle_StepAP203_HArray1OfClassifiedItem(const Handle_StepAP203_HArray1OfClassifiedItem &aHandle);
        Handle_StepAP203_HArray1OfClassifiedItem(const StepAP203_HArray1OfClassifiedItem *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepAP203_HArray1OfClassifiedItem DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepAP203_HArray1OfClassifiedItem {
    StepAP203_HArray1OfClassifiedItem* _get_reference() {
    return (StepAP203_HArray1OfClassifiedItem*)$self->Access();
    }
};

%extend Handle_StepAP203_HArray1OfClassifiedItem {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepAP203_HArray1OfClassifiedItem {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepAP203_HArray1OfContractedItem;
class StepAP203_HArray1OfContractedItem : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") StepAP203_HArray1OfContractedItem;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") StepAP203_HArray1OfContractedItem;
		 StepAP203_HArray1OfContractedItem (const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") StepAP203_HArray1OfContractedItem;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:param V:
	:type V: StepAP203_ContractedItem &
	:rtype: None
") StepAP203_HArray1OfContractedItem;
		 StepAP203_HArray1OfContractedItem (const Standard_Integer Low,const Standard_Integer Up,const StepAP203_ContractedItem & V);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param V:
	:type V: StepAP203_ContractedItem &
	:rtype: None
") Init;
		void Init (const StepAP203_ContractedItem & V);
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "	:rtype: int
") Length;
		Standard_Integer Length ();
		%feature("compactdefaultargs") Lower;
		%feature("autodoc", "	:rtype: int
") Lower;
		Standard_Integer Lower ();
		%feature("compactdefaultargs") Upper;
		%feature("autodoc", "	:rtype: int
") Upper;
		Standard_Integer Upper ();
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param Value:
	:type Value: StepAP203_ContractedItem &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const StepAP203_ContractedItem & Value);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: StepAP203_ContractedItem
") Value;
		const StepAP203_ContractedItem & Value (const Standard_Integer Index);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: StepAP203_ContractedItem
") ChangeValue;
		StepAP203_ContractedItem & ChangeValue (const Standard_Integer Index);
		%feature("compactdefaultargs") Array1;
		%feature("autodoc", "	:rtype: StepAP203_Array1OfContractedItem
") Array1;
		const StepAP203_Array1OfContractedItem & Array1 ();
		%feature("compactdefaultargs") ChangeArray1;
		%feature("autodoc", "	:rtype: StepAP203_Array1OfContractedItem
") ChangeArray1;
		StepAP203_Array1OfContractedItem & ChangeArray1 ();
};


%extend StepAP203_HArray1OfContractedItem {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepAP203_HArray1OfContractedItem(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepAP203_HArray1OfContractedItem::Handle_StepAP203_HArray1OfContractedItem %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepAP203_HArray1OfContractedItem;
class Handle_StepAP203_HArray1OfContractedItem : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_StepAP203_HArray1OfContractedItem();
        Handle_StepAP203_HArray1OfContractedItem(const Handle_StepAP203_HArray1OfContractedItem &aHandle);
        Handle_StepAP203_HArray1OfContractedItem(const StepAP203_HArray1OfContractedItem *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepAP203_HArray1OfContractedItem DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepAP203_HArray1OfContractedItem {
    StepAP203_HArray1OfContractedItem* _get_reference() {
    return (StepAP203_HArray1OfContractedItem*)$self->Access();
    }
};

%extend Handle_StepAP203_HArray1OfContractedItem {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepAP203_HArray1OfContractedItem {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepAP203_HArray1OfDateTimeItem;
class StepAP203_HArray1OfDateTimeItem : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") StepAP203_HArray1OfDateTimeItem;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") StepAP203_HArray1OfDateTimeItem;
		 StepAP203_HArray1OfDateTimeItem (const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") StepAP203_HArray1OfDateTimeItem;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:param V:
	:type V: StepAP203_DateTimeItem &
	:rtype: None
") StepAP203_HArray1OfDateTimeItem;
		 StepAP203_HArray1OfDateTimeItem (const Standard_Integer Low,const Standard_Integer Up,const StepAP203_DateTimeItem & V);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param V:
	:type V: StepAP203_DateTimeItem &
	:rtype: None
") Init;
		void Init (const StepAP203_DateTimeItem & V);
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "	:rtype: int
") Length;
		Standard_Integer Length ();
		%feature("compactdefaultargs") Lower;
		%feature("autodoc", "	:rtype: int
") Lower;
		Standard_Integer Lower ();
		%feature("compactdefaultargs") Upper;
		%feature("autodoc", "	:rtype: int
") Upper;
		Standard_Integer Upper ();
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param Value:
	:type Value: StepAP203_DateTimeItem &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const StepAP203_DateTimeItem & Value);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: StepAP203_DateTimeItem
") Value;
		const StepAP203_DateTimeItem & Value (const Standard_Integer Index);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: StepAP203_DateTimeItem
") ChangeValue;
		StepAP203_DateTimeItem & ChangeValue (const Standard_Integer Index);
		%feature("compactdefaultargs") Array1;
		%feature("autodoc", "	:rtype: StepAP203_Array1OfDateTimeItem
") Array1;
		const StepAP203_Array1OfDateTimeItem & Array1 ();
		%feature("compactdefaultargs") ChangeArray1;
		%feature("autodoc", "	:rtype: StepAP203_Array1OfDateTimeItem
") ChangeArray1;
		StepAP203_Array1OfDateTimeItem & ChangeArray1 ();
};


%extend StepAP203_HArray1OfDateTimeItem {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepAP203_HArray1OfDateTimeItem(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepAP203_HArray1OfDateTimeItem::Handle_StepAP203_HArray1OfDateTimeItem %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepAP203_HArray1OfDateTimeItem;
class Handle_StepAP203_HArray1OfDateTimeItem : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_StepAP203_HArray1OfDateTimeItem();
        Handle_StepAP203_HArray1OfDateTimeItem(const Handle_StepAP203_HArray1OfDateTimeItem &aHandle);
        Handle_StepAP203_HArray1OfDateTimeItem(const StepAP203_HArray1OfDateTimeItem *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepAP203_HArray1OfDateTimeItem DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepAP203_HArray1OfDateTimeItem {
    StepAP203_HArray1OfDateTimeItem* _get_reference() {
    return (StepAP203_HArray1OfDateTimeItem*)$self->Access();
    }
};

%extend Handle_StepAP203_HArray1OfDateTimeItem {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepAP203_HArray1OfDateTimeItem {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepAP203_HArray1OfPersonOrganizationItem;
class StepAP203_HArray1OfPersonOrganizationItem : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") StepAP203_HArray1OfPersonOrganizationItem;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") StepAP203_HArray1OfPersonOrganizationItem;
		 StepAP203_HArray1OfPersonOrganizationItem (const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") StepAP203_HArray1OfPersonOrganizationItem;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:param V:
	:type V: StepAP203_PersonOrganizationItem &
	:rtype: None
") StepAP203_HArray1OfPersonOrganizationItem;
		 StepAP203_HArray1OfPersonOrganizationItem (const Standard_Integer Low,const Standard_Integer Up,const StepAP203_PersonOrganizationItem & V);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param V:
	:type V: StepAP203_PersonOrganizationItem &
	:rtype: None
") Init;
		void Init (const StepAP203_PersonOrganizationItem & V);
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "	:rtype: int
") Length;
		Standard_Integer Length ();
		%feature("compactdefaultargs") Lower;
		%feature("autodoc", "	:rtype: int
") Lower;
		Standard_Integer Lower ();
		%feature("compactdefaultargs") Upper;
		%feature("autodoc", "	:rtype: int
") Upper;
		Standard_Integer Upper ();
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param Value:
	:type Value: StepAP203_PersonOrganizationItem &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const StepAP203_PersonOrganizationItem & Value);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: StepAP203_PersonOrganizationItem
") Value;
		const StepAP203_PersonOrganizationItem & Value (const Standard_Integer Index);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: StepAP203_PersonOrganizationItem
") ChangeValue;
		StepAP203_PersonOrganizationItem & ChangeValue (const Standard_Integer Index);
		%feature("compactdefaultargs") Array1;
		%feature("autodoc", "	:rtype: StepAP203_Array1OfPersonOrganizationItem
") Array1;
		const StepAP203_Array1OfPersonOrganizationItem & Array1 ();
		%feature("compactdefaultargs") ChangeArray1;
		%feature("autodoc", "	:rtype: StepAP203_Array1OfPersonOrganizationItem
") ChangeArray1;
		StepAP203_Array1OfPersonOrganizationItem & ChangeArray1 ();
};


%extend StepAP203_HArray1OfPersonOrganizationItem {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepAP203_HArray1OfPersonOrganizationItem(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepAP203_HArray1OfPersonOrganizationItem::Handle_StepAP203_HArray1OfPersonOrganizationItem %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepAP203_HArray1OfPersonOrganizationItem;
class Handle_StepAP203_HArray1OfPersonOrganizationItem : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_StepAP203_HArray1OfPersonOrganizationItem();
        Handle_StepAP203_HArray1OfPersonOrganizationItem(const Handle_StepAP203_HArray1OfPersonOrganizationItem &aHandle);
        Handle_StepAP203_HArray1OfPersonOrganizationItem(const StepAP203_HArray1OfPersonOrganizationItem *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepAP203_HArray1OfPersonOrganizationItem DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepAP203_HArray1OfPersonOrganizationItem {
    StepAP203_HArray1OfPersonOrganizationItem* _get_reference() {
    return (StepAP203_HArray1OfPersonOrganizationItem*)$self->Access();
    }
};

%extend Handle_StepAP203_HArray1OfPersonOrganizationItem {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepAP203_HArray1OfPersonOrganizationItem {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepAP203_HArray1OfSpecifiedItem;
class StepAP203_HArray1OfSpecifiedItem : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") StepAP203_HArray1OfSpecifiedItem;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") StepAP203_HArray1OfSpecifiedItem;
		 StepAP203_HArray1OfSpecifiedItem (const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") StepAP203_HArray1OfSpecifiedItem;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:param V:
	:type V: StepAP203_SpecifiedItem &
	:rtype: None
") StepAP203_HArray1OfSpecifiedItem;
		 StepAP203_HArray1OfSpecifiedItem (const Standard_Integer Low,const Standard_Integer Up,const StepAP203_SpecifiedItem & V);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param V:
	:type V: StepAP203_SpecifiedItem &
	:rtype: None
") Init;
		void Init (const StepAP203_SpecifiedItem & V);
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "	:rtype: int
") Length;
		Standard_Integer Length ();
		%feature("compactdefaultargs") Lower;
		%feature("autodoc", "	:rtype: int
") Lower;
		Standard_Integer Lower ();
		%feature("compactdefaultargs") Upper;
		%feature("autodoc", "	:rtype: int
") Upper;
		Standard_Integer Upper ();
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param Value:
	:type Value: StepAP203_SpecifiedItem &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const StepAP203_SpecifiedItem & Value);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: StepAP203_SpecifiedItem
") Value;
		const StepAP203_SpecifiedItem & Value (const Standard_Integer Index);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: StepAP203_SpecifiedItem
") ChangeValue;
		StepAP203_SpecifiedItem & ChangeValue (const Standard_Integer Index);
		%feature("compactdefaultargs") Array1;
		%feature("autodoc", "	:rtype: StepAP203_Array1OfSpecifiedItem
") Array1;
		const StepAP203_Array1OfSpecifiedItem & Array1 ();
		%feature("compactdefaultargs") ChangeArray1;
		%feature("autodoc", "	:rtype: StepAP203_Array1OfSpecifiedItem
") ChangeArray1;
		StepAP203_Array1OfSpecifiedItem & ChangeArray1 ();
};


%extend StepAP203_HArray1OfSpecifiedItem {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepAP203_HArray1OfSpecifiedItem(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepAP203_HArray1OfSpecifiedItem::Handle_StepAP203_HArray1OfSpecifiedItem %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepAP203_HArray1OfSpecifiedItem;
class Handle_StepAP203_HArray1OfSpecifiedItem : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_StepAP203_HArray1OfSpecifiedItem();
        Handle_StepAP203_HArray1OfSpecifiedItem(const Handle_StepAP203_HArray1OfSpecifiedItem &aHandle);
        Handle_StepAP203_HArray1OfSpecifiedItem(const StepAP203_HArray1OfSpecifiedItem *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepAP203_HArray1OfSpecifiedItem DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepAP203_HArray1OfSpecifiedItem {
    StepAP203_HArray1OfSpecifiedItem* _get_reference() {
    return (StepAP203_HArray1OfSpecifiedItem*)$self->Access();
    }
};

%extend Handle_StepAP203_HArray1OfSpecifiedItem {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepAP203_HArray1OfSpecifiedItem {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepAP203_HArray1OfStartRequestItem;
class StepAP203_HArray1OfStartRequestItem : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") StepAP203_HArray1OfStartRequestItem;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") StepAP203_HArray1OfStartRequestItem;
		 StepAP203_HArray1OfStartRequestItem (const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") StepAP203_HArray1OfStartRequestItem;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:param V:
	:type V: StepAP203_StartRequestItem &
	:rtype: None
") StepAP203_HArray1OfStartRequestItem;
		 StepAP203_HArray1OfStartRequestItem (const Standard_Integer Low,const Standard_Integer Up,const StepAP203_StartRequestItem & V);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param V:
	:type V: StepAP203_StartRequestItem &
	:rtype: None
") Init;
		void Init (const StepAP203_StartRequestItem & V);
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "	:rtype: int
") Length;
		Standard_Integer Length ();
		%feature("compactdefaultargs") Lower;
		%feature("autodoc", "	:rtype: int
") Lower;
		Standard_Integer Lower ();
		%feature("compactdefaultargs") Upper;
		%feature("autodoc", "	:rtype: int
") Upper;
		Standard_Integer Upper ();
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param Value:
	:type Value: StepAP203_StartRequestItem &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const StepAP203_StartRequestItem & Value);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: StepAP203_StartRequestItem
") Value;
		const StepAP203_StartRequestItem & Value (const Standard_Integer Index);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: StepAP203_StartRequestItem
") ChangeValue;
		StepAP203_StartRequestItem & ChangeValue (const Standard_Integer Index);
		%feature("compactdefaultargs") Array1;
		%feature("autodoc", "	:rtype: StepAP203_Array1OfStartRequestItem
") Array1;
		const StepAP203_Array1OfStartRequestItem & Array1 ();
		%feature("compactdefaultargs") ChangeArray1;
		%feature("autodoc", "	:rtype: StepAP203_Array1OfStartRequestItem
") ChangeArray1;
		StepAP203_Array1OfStartRequestItem & ChangeArray1 ();
};


%extend StepAP203_HArray1OfStartRequestItem {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepAP203_HArray1OfStartRequestItem(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepAP203_HArray1OfStartRequestItem::Handle_StepAP203_HArray1OfStartRequestItem %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepAP203_HArray1OfStartRequestItem;
class Handle_StepAP203_HArray1OfStartRequestItem : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_StepAP203_HArray1OfStartRequestItem();
        Handle_StepAP203_HArray1OfStartRequestItem(const Handle_StepAP203_HArray1OfStartRequestItem &aHandle);
        Handle_StepAP203_HArray1OfStartRequestItem(const StepAP203_HArray1OfStartRequestItem *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepAP203_HArray1OfStartRequestItem DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepAP203_HArray1OfStartRequestItem {
    StepAP203_HArray1OfStartRequestItem* _get_reference() {
    return (StepAP203_HArray1OfStartRequestItem*)$self->Access();
    }
};

%extend Handle_StepAP203_HArray1OfStartRequestItem {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepAP203_HArray1OfStartRequestItem {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepAP203_HArray1OfWorkItem;
class StepAP203_HArray1OfWorkItem : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") StepAP203_HArray1OfWorkItem;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") StepAP203_HArray1OfWorkItem;
		 StepAP203_HArray1OfWorkItem (const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") StepAP203_HArray1OfWorkItem;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:param V:
	:type V: StepAP203_WorkItem &
	:rtype: None
") StepAP203_HArray1OfWorkItem;
		 StepAP203_HArray1OfWorkItem (const Standard_Integer Low,const Standard_Integer Up,const StepAP203_WorkItem & V);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param V:
	:type V: StepAP203_WorkItem &
	:rtype: None
") Init;
		void Init (const StepAP203_WorkItem & V);
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "	:rtype: int
") Length;
		Standard_Integer Length ();
		%feature("compactdefaultargs") Lower;
		%feature("autodoc", "	:rtype: int
") Lower;
		Standard_Integer Lower ();
		%feature("compactdefaultargs") Upper;
		%feature("autodoc", "	:rtype: int
") Upper;
		Standard_Integer Upper ();
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param Value:
	:type Value: StepAP203_WorkItem &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const StepAP203_WorkItem & Value);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: StepAP203_WorkItem
") Value;
		const StepAP203_WorkItem & Value (const Standard_Integer Index);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: StepAP203_WorkItem
") ChangeValue;
		StepAP203_WorkItem & ChangeValue (const Standard_Integer Index);
		%feature("compactdefaultargs") Array1;
		%feature("autodoc", "	:rtype: StepAP203_Array1OfWorkItem
") Array1;
		const StepAP203_Array1OfWorkItem & Array1 ();
		%feature("compactdefaultargs") ChangeArray1;
		%feature("autodoc", "	:rtype: StepAP203_Array1OfWorkItem
") ChangeArray1;
		StepAP203_Array1OfWorkItem & ChangeArray1 ();
};


%extend StepAP203_HArray1OfWorkItem {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepAP203_HArray1OfWorkItem(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepAP203_HArray1OfWorkItem::Handle_StepAP203_HArray1OfWorkItem %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepAP203_HArray1OfWorkItem;
class Handle_StepAP203_HArray1OfWorkItem : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_StepAP203_HArray1OfWorkItem();
        Handle_StepAP203_HArray1OfWorkItem(const Handle_StepAP203_HArray1OfWorkItem &aHandle);
        Handle_StepAP203_HArray1OfWorkItem(const StepAP203_HArray1OfWorkItem *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepAP203_HArray1OfWorkItem DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepAP203_HArray1OfWorkItem {
    StepAP203_HArray1OfWorkItem* _get_reference() {
    return (StepAP203_HArray1OfWorkItem*)$self->Access();
    }
};

%extend Handle_StepAP203_HArray1OfWorkItem {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepAP203_HArray1OfWorkItem {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepAP203_PersonOrganizationItem;
class StepAP203_PersonOrganizationItem : public StepData_SelectType {
	public:
		%feature("compactdefaultargs") StepAP203_PersonOrganizationItem;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") StepAP203_PersonOrganizationItem;
		 StepAP203_PersonOrganizationItem ();
		%feature("compactdefaultargs") CaseNum;
		%feature("autodoc", "	* Recognizes a kind of PersonOrganizationItem select type 1 -> Change from StepAP203 2 -> StartWork from StepAP203 3 -> ChangeRequest from StepAP203 4 -> StartRequest from StepAP203 5 -> ConfigurationItem from StepRepr 6 -> Product from StepBasic 7 -> ProductDefinitionFormation from StepBasic 8 -> ProductDefinition from StepBasic 9 -> Contract from StepBasic 10 -> SecurityClassification from StepBasic 0 else

	:param ent:
	:type ent: Handle_Standard_Transient &
	:rtype: int
") CaseNum;
		Standard_Integer CaseNum (const Handle_Standard_Transient & ent);
		%feature("compactdefaultargs") Change;
		%feature("autodoc", "	* Returns Value as Change (or Null if another type)

	:rtype: Handle_StepAP203_Change
") Change;
		Handle_StepAP203_Change Change ();
		%feature("compactdefaultargs") StartWork;
		%feature("autodoc", "	* Returns Value as StartWork (or Null if another type)

	:rtype: Handle_StepAP203_StartWork
") StartWork;
		Handle_StepAP203_StartWork StartWork ();
		%feature("compactdefaultargs") ChangeRequest;
		%feature("autodoc", "	* Returns Value as ChangeRequest (or Null if another type)

	:rtype: Handle_StepAP203_ChangeRequest
") ChangeRequest;
		Handle_StepAP203_ChangeRequest ChangeRequest ();
		%feature("compactdefaultargs") StartRequest;
		%feature("autodoc", "	* Returns Value as StartRequest (or Null if another type)

	:rtype: Handle_StepAP203_StartRequest
") StartRequest;
		Handle_StepAP203_StartRequest StartRequest ();
		%feature("compactdefaultargs") ConfigurationItem;
		%feature("autodoc", "	* Returns Value as ConfigurationItem (or Null if another type)

	:rtype: Handle_StepRepr_ConfigurationItem
") ConfigurationItem;
		Handle_StepRepr_ConfigurationItem ConfigurationItem ();
		%feature("compactdefaultargs") Product;
		%feature("autodoc", "	* Returns Value as Product (or Null if another type)

	:rtype: Handle_StepBasic_Product
") Product;
		Handle_StepBasic_Product Product ();
		%feature("compactdefaultargs") ProductDefinitionFormation;
		%feature("autodoc", "	* Returns Value as ProductDefinitionFormation (or Null if another type)

	:rtype: Handle_StepBasic_ProductDefinitionFormation
") ProductDefinitionFormation;
		Handle_StepBasic_ProductDefinitionFormation ProductDefinitionFormation ();
		%feature("compactdefaultargs") ProductDefinition;
		%feature("autodoc", "	* Returns Value as ProductDefinition (or Null if another type)

	:rtype: Handle_StepBasic_ProductDefinition
") ProductDefinition;
		Handle_StepBasic_ProductDefinition ProductDefinition ();
		%feature("compactdefaultargs") Contract;
		%feature("autodoc", "	* Returns Value as Contract (or Null if another type)

	:rtype: Handle_StepBasic_Contract
") Contract;
		Handle_StepBasic_Contract Contract ();
		%feature("compactdefaultargs") SecurityClassification;
		%feature("autodoc", "	* Returns Value as SecurityClassification (or Null if another type)

	:rtype: Handle_StepBasic_SecurityClassification
") SecurityClassification;
		Handle_StepBasic_SecurityClassification SecurityClassification ();
};


%extend StepAP203_PersonOrganizationItem {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepAP203_SpecifiedItem;
class StepAP203_SpecifiedItem : public StepData_SelectType {
	public:
		%feature("compactdefaultargs") StepAP203_SpecifiedItem;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") StepAP203_SpecifiedItem;
		 StepAP203_SpecifiedItem ();
		%feature("compactdefaultargs") CaseNum;
		%feature("autodoc", "	* Recognizes a kind of SpecifiedItem select type 1 -> ProductDefinition from StepBasic 2 -> ShapeAspect from StepRepr 0 else

	:param ent:
	:type ent: Handle_Standard_Transient &
	:rtype: int
") CaseNum;
		Standard_Integer CaseNum (const Handle_Standard_Transient & ent);
		%feature("compactdefaultargs") ProductDefinition;
		%feature("autodoc", "	* Returns Value as ProductDefinition (or Null if another type)

	:rtype: Handle_StepBasic_ProductDefinition
") ProductDefinition;
		Handle_StepBasic_ProductDefinition ProductDefinition ();
		%feature("compactdefaultargs") ShapeAspect;
		%feature("autodoc", "	* Returns Value as ShapeAspect (or Null if another type)

	:rtype: Handle_StepRepr_ShapeAspect
") ShapeAspect;
		Handle_StepRepr_ShapeAspect ShapeAspect ();
};


%extend StepAP203_SpecifiedItem {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepAP203_StartRequest;
class StepAP203_StartRequest : public StepBasic_ActionRequestAssignment {
	public:
		%feature("compactdefaultargs") StepAP203_StartRequest;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") StepAP203_StartRequest;
		 StepAP203_StartRequest ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	* Initialize all fields (own and inherited)

	:param aActionRequestAssignment_AssignedActionRequest:
	:type aActionRequestAssignment_AssignedActionRequest: Handle_StepBasic_VersionedActionRequest &
	:param aItems:
	:type aItems: Handle_StepAP203_HArray1OfStartRequestItem &
	:rtype: None
") Init;
		void Init (const Handle_StepBasic_VersionedActionRequest & aActionRequestAssignment_AssignedActionRequest,const Handle_StepAP203_HArray1OfStartRequestItem & aItems);
		%feature("compactdefaultargs") Items;
		%feature("autodoc", "	* Returns field Items

	:rtype: Handle_StepAP203_HArray1OfStartRequestItem
") Items;
		Handle_StepAP203_HArray1OfStartRequestItem Items ();
		%feature("compactdefaultargs") SetItems;
		%feature("autodoc", "	* Set field Items

	:param Items:
	:type Items: Handle_StepAP203_HArray1OfStartRequestItem &
	:rtype: None
") SetItems;
		void SetItems (const Handle_StepAP203_HArray1OfStartRequestItem & Items);
};


%extend StepAP203_StartRequest {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepAP203_StartRequest(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepAP203_StartRequest::Handle_StepAP203_StartRequest %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepAP203_StartRequest;
class Handle_StepAP203_StartRequest : public Handle_StepBasic_ActionRequestAssignment {

    public:
        // constructors
        Handle_StepAP203_StartRequest();
        Handle_StepAP203_StartRequest(const Handle_StepAP203_StartRequest &aHandle);
        Handle_StepAP203_StartRequest(const StepAP203_StartRequest *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepAP203_StartRequest DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepAP203_StartRequest {
    StepAP203_StartRequest* _get_reference() {
    return (StepAP203_StartRequest*)$self->Access();
    }
};

%extend Handle_StepAP203_StartRequest {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepAP203_StartRequest {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepAP203_StartRequestItem;
class StepAP203_StartRequestItem : public StepData_SelectType {
	public:
		%feature("compactdefaultargs") StepAP203_StartRequestItem;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") StepAP203_StartRequestItem;
		 StepAP203_StartRequestItem ();
		%feature("compactdefaultargs") CaseNum;
		%feature("autodoc", "	* Recognizes a kind of StartRequestItem select type 1 -> ProductDefinitionFormation from StepBasic 0 else

	:param ent:
	:type ent: Handle_Standard_Transient &
	:rtype: int
") CaseNum;
		Standard_Integer CaseNum (const Handle_Standard_Transient & ent);
		%feature("compactdefaultargs") ProductDefinitionFormation;
		%feature("autodoc", "	* Returns Value as ProductDefinitionFormation (or Null if another type)

	:rtype: Handle_StepBasic_ProductDefinitionFormation
") ProductDefinitionFormation;
		Handle_StepBasic_ProductDefinitionFormation ProductDefinitionFormation ();
};


%extend StepAP203_StartRequestItem {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepAP203_StartWork;
class StepAP203_StartWork : public StepBasic_ActionAssignment {
	public:
		%feature("compactdefaultargs") StepAP203_StartWork;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") StepAP203_StartWork;
		 StepAP203_StartWork ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	* Initialize all fields (own and inherited)

	:param aActionAssignment_AssignedAction:
	:type aActionAssignment_AssignedAction: Handle_StepBasic_Action &
	:param aItems:
	:type aItems: Handle_StepAP203_HArray1OfWorkItem &
	:rtype: None
") Init;
		void Init (const Handle_StepBasic_Action & aActionAssignment_AssignedAction,const Handle_StepAP203_HArray1OfWorkItem & aItems);
		%feature("compactdefaultargs") Items;
		%feature("autodoc", "	* Returns field Items

	:rtype: Handle_StepAP203_HArray1OfWorkItem
") Items;
		Handle_StepAP203_HArray1OfWorkItem Items ();
		%feature("compactdefaultargs") SetItems;
		%feature("autodoc", "	* Set field Items

	:param Items:
	:type Items: Handle_StepAP203_HArray1OfWorkItem &
	:rtype: None
") SetItems;
		void SetItems (const Handle_StepAP203_HArray1OfWorkItem & Items);
};


%extend StepAP203_StartWork {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepAP203_StartWork(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepAP203_StartWork::Handle_StepAP203_StartWork %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepAP203_StartWork;
class Handle_StepAP203_StartWork : public Handle_StepBasic_ActionAssignment {

    public:
        // constructors
        Handle_StepAP203_StartWork();
        Handle_StepAP203_StartWork(const Handle_StepAP203_StartWork &aHandle);
        Handle_StepAP203_StartWork(const StepAP203_StartWork *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepAP203_StartWork DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepAP203_StartWork {
    StepAP203_StartWork* _get_reference() {
    return (StepAP203_StartWork*)$self->Access();
    }
};

%extend Handle_StepAP203_StartWork {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepAP203_StartWork {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepAP203_WorkItem;
class StepAP203_WorkItem : public StepData_SelectType {
	public:
		%feature("compactdefaultargs") StepAP203_WorkItem;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") StepAP203_WorkItem;
		 StepAP203_WorkItem ();
		%feature("compactdefaultargs") CaseNum;
		%feature("autodoc", "	* Recognizes a kind of WorkItem select type 1 -> ProductDefinitionFormation from StepBasic 0 else

	:param ent:
	:type ent: Handle_Standard_Transient &
	:rtype: int
") CaseNum;
		Standard_Integer CaseNum (const Handle_Standard_Transient & ent);
		%feature("compactdefaultargs") ProductDefinitionFormation;
		%feature("autodoc", "	* Returns Value as ProductDefinitionFormation (or Null if another type)

	:rtype: Handle_StepBasic_ProductDefinitionFormation
") ProductDefinitionFormation;
		Handle_StepBasic_ProductDefinitionFormation ProductDefinitionFormation ();
};


%extend StepAP203_WorkItem {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
