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
%define STEPBASICDOCSTRING
"StepBasic module, see official documentation at
https://www.opencascade.com/doc/occt-7.4.0/refman/html/package_stepbasic.html"
%enddef
%module (package="OCC.Core", docstring=STEPBASICDOCSTRING) StepBasic


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
#include<StepBasic_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<TCollection_module.hxx>
#include<StepData_module.hxx>
#include<TColStd_module.hxx>
#include<Interface_module.hxx>
#include<MoniTool_module.hxx>
#include<TCollection_module.hxx>
#include<StepBasic_module.hxx>
#include<Message_module.hxx>
#include<Interface_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import TCollection.i
%import StepData.i
%import TColStd.i
%import Interface.i
/* public enums */
enum StepBasic_Source {
	StepBasic_sMade = 0,
	StepBasic_sBought = 1,
	StepBasic_sNotKnown = 2,
};

enum StepBasic_AheadOrBehind {
	StepBasic_aobAhead = 0,
	StepBasic_aobExact = 1,
	StepBasic_aobBehind = 2,
};

enum StepBasic_SiUnitName {
	StepBasic_sunMetre = 0,
	StepBasic_sunGram = 1,
	StepBasic_sunSecond = 2,
	StepBasic_sunAmpere = 3,
	StepBasic_sunKelvin = 4,
	StepBasic_sunMole = 5,
	StepBasic_sunCandela = 6,
	StepBasic_sunRadian = 7,
	StepBasic_sunSteradian = 8,
	StepBasic_sunHertz = 9,
	StepBasic_sunNewton = 10,
	StepBasic_sunPascal = 11,
	StepBasic_sunJoule = 12,
	StepBasic_sunWatt = 13,
	StepBasic_sunCoulomb = 14,
	StepBasic_sunVolt = 15,
	StepBasic_sunFarad = 16,
	StepBasic_sunOhm = 17,
	StepBasic_sunSiemens = 18,
	StepBasic_sunWeber = 19,
	StepBasic_sunTesla = 20,
	StepBasic_sunHenry = 21,
	StepBasic_sunDegreeCelsius = 22,
	StepBasic_sunLumen = 23,
	StepBasic_sunLux = 24,
	StepBasic_sunBecquerel = 25,
	StepBasic_sunGray = 26,
	StepBasic_sunSievert = 27,
};

enum StepBasic_SiPrefix {
	StepBasic_spExa = 0,
	StepBasic_spPeta = 1,
	StepBasic_spTera = 2,
	StepBasic_spGiga = 3,
	StepBasic_spMega = 4,
	StepBasic_spKilo = 5,
	StepBasic_spHecto = 6,
	StepBasic_spDeca = 7,
	StepBasic_spDeci = 8,
	StepBasic_spCenti = 9,
	StepBasic_spMilli = 10,
	StepBasic_spMicro = 11,
	StepBasic_spNano = 12,
	StepBasic_spPico = 13,
	StepBasic_spFemto = 14,
	StepBasic_spAtto = 15,
};

/* end public enums declaration */

/* handles */
%wrap_handle(StepBasic_Action)
%wrap_handle(StepBasic_ActionAssignment)
%wrap_handle(StepBasic_ActionMethod)
%wrap_handle(StepBasic_ActionRequestAssignment)
%wrap_handle(StepBasic_ActionRequestSolution)
%wrap_handle(StepBasic_Address)
%wrap_handle(StepBasic_ApplicationContext)
%wrap_handle(StepBasic_ApplicationContextElement)
%wrap_handle(StepBasic_ApplicationProtocolDefinition)
%wrap_handle(StepBasic_Approval)
%wrap_handle(StepBasic_ApprovalAssignment)
%wrap_handle(StepBasic_ApprovalDateTime)
%wrap_handle(StepBasic_ApprovalPersonOrganization)
%wrap_handle(StepBasic_ApprovalRelationship)
%wrap_handle(StepBasic_ApprovalRole)
%wrap_handle(StepBasic_ApprovalStatus)
%wrap_handle(StepBasic_Certification)
%wrap_handle(StepBasic_CertificationAssignment)
%wrap_handle(StepBasic_CertificationType)
%wrap_handle(StepBasic_CharacterizedObject)
%wrap_handle(StepBasic_Contract)
%wrap_handle(StepBasic_ContractAssignment)
%wrap_handle(StepBasic_ContractType)
%wrap_handle(StepBasic_CoordinatedUniversalTimeOffset)
%wrap_handle(StepBasic_Date)
%wrap_handle(StepBasic_DateAndTime)
%wrap_handle(StepBasic_DateAndTimeAssignment)
%wrap_handle(StepBasic_DateAssignment)
%wrap_handle(StepBasic_DateRole)
%wrap_handle(StepBasic_DateTimeRole)
%wrap_handle(StepBasic_DerivedUnit)
%wrap_handle(StepBasic_DerivedUnitElement)
%wrap_handle(StepBasic_DimensionalExponents)
%wrap_handle(StepBasic_Document)
%wrap_handle(StepBasic_DocumentProductAssociation)
%wrap_handle(StepBasic_DocumentReference)
%wrap_handle(StepBasic_DocumentRelationship)
%wrap_handle(StepBasic_DocumentRepresentationType)
%wrap_handle(StepBasic_DocumentType)
%wrap_handle(StepBasic_DocumentUsageConstraint)
%wrap_handle(StepBasic_Effectivity)
%wrap_handle(StepBasic_EffectivityAssignment)
%wrap_handle(StepBasic_EulerAngles)
%wrap_handle(StepBasic_ExternalSource)
%wrap_handle(StepBasic_ExternallyDefinedItem)
%wrap_handle(StepBasic_GeneralProperty)
%wrap_handle(StepBasic_Group)
%wrap_handle(StepBasic_GroupAssignment)
%wrap_handle(StepBasic_GroupRelationship)
%wrap_handle(StepBasic_IdentificationAssignment)
%wrap_handle(StepBasic_IdentificationRole)
%wrap_handle(StepBasic_LocalTime)
%wrap_handle(StepBasic_MeasureValueMember)
%wrap_handle(StepBasic_MeasureWithUnit)
%wrap_handle(StepBasic_NameAssignment)
%wrap_handle(StepBasic_NamedUnit)
%wrap_handle(StepBasic_ObjectRole)
%wrap_handle(StepBasic_Organization)
%wrap_handle(StepBasic_OrganizationAssignment)
%wrap_handle(StepBasic_OrganizationRole)
%wrap_handle(StepBasic_Person)
%wrap_handle(StepBasic_PersonAndOrganization)
%wrap_handle(StepBasic_PersonAndOrganizationAssignment)
%wrap_handle(StepBasic_PersonAndOrganizationRole)
%wrap_handle(StepBasic_Product)
%wrap_handle(StepBasic_ProductCategory)
%wrap_handle(StepBasic_ProductCategoryRelationship)
%wrap_handle(StepBasic_ProductDefinition)
%wrap_handle(StepBasic_ProductDefinitionFormation)
%wrap_handle(StepBasic_ProductDefinitionFormationRelationship)
%wrap_handle(StepBasic_ProductDefinitionReference)
%wrap_handle(StepBasic_ProductDefinitionRelationship)
%wrap_handle(StepBasic_RoleAssociation)
%wrap_handle(StepBasic_SecurityClassification)
%wrap_handle(StepBasic_SecurityClassificationAssignment)
%wrap_handle(StepBasic_SecurityClassificationLevel)
%wrap_handle(StepBasic_SizeMember)
%wrap_handle(StepBasic_VersionedActionRequest)
%wrap_handle(StepBasic_AreaUnit)
%wrap_handle(StepBasic_CalendarDate)
%wrap_handle(StepBasic_ConversionBasedUnit)
%wrap_handle(StepBasic_DigitalDocument)
%wrap_handle(StepBasic_DocumentFile)
%wrap_handle(StepBasic_DocumentProductEquivalence)
%wrap_handle(StepBasic_ExternalIdentificationAssignment)
%wrap_handle(StepBasic_LengthMeasureWithUnit)
%wrap_handle(StepBasic_LengthUnit)
%wrap_handle(StepBasic_MassMeasureWithUnit)
%wrap_handle(StepBasic_MassUnit)
%wrap_handle(StepBasic_OrdinalDate)
%wrap_handle(StepBasic_OrganizationalAddress)
%wrap_handle(StepBasic_PersonalAddress)
%wrap_handle(StepBasic_PhysicallyModeledProductDefinition)
%wrap_handle(StepBasic_PlaneAngleMeasureWithUnit)
%wrap_handle(StepBasic_PlaneAngleUnit)
%wrap_handle(StepBasic_ProductConceptContext)
%wrap_handle(StepBasic_ProductContext)
%wrap_handle(StepBasic_ProductDefinitionContext)
%wrap_handle(StepBasic_ProductDefinitionEffectivity)
%wrap_handle(StepBasic_ProductDefinitionFormationWithSpecifiedSource)
%wrap_handle(StepBasic_ProductDefinitionReferenceWithLocalRepresentation)
%wrap_handle(StepBasic_ProductDefinitionWithAssociatedDocuments)
%wrap_handle(StepBasic_ProductRelatedProductCategory)
%wrap_handle(StepBasic_RatioMeasureWithUnit)
%wrap_handle(StepBasic_RatioUnit)
%wrap_handle(StepBasic_SiUnit)
%wrap_handle(StepBasic_SolidAngleMeasureWithUnit)
%wrap_handle(StepBasic_SolidAngleUnit)
%wrap_handle(StepBasic_ThermodynamicTemperatureUnit)
%wrap_handle(StepBasic_TimeMeasureWithUnit)
%wrap_handle(StepBasic_TimeUnit)
%wrap_handle(StepBasic_UncertaintyMeasureWithUnit)
%wrap_handle(StepBasic_VolumeUnit)
%wrap_handle(StepBasic_WeekOfYearAndDayDate)
%wrap_handle(StepBasic_ConversionBasedUnitAndAreaUnit)
%wrap_handle(StepBasic_ConversionBasedUnitAndLengthUnit)
%wrap_handle(StepBasic_ConversionBasedUnitAndMassUnit)
%wrap_handle(StepBasic_ConversionBasedUnitAndPlaneAngleUnit)
%wrap_handle(StepBasic_ConversionBasedUnitAndRatioUnit)
%wrap_handle(StepBasic_ConversionBasedUnitAndSolidAngleUnit)
%wrap_handle(StepBasic_ConversionBasedUnitAndTimeUnit)
%wrap_handle(StepBasic_ConversionBasedUnitAndVolumeUnit)
%wrap_handle(StepBasic_DesignContext)
%wrap_handle(StepBasic_MechanicalContext)
%wrap_handle(StepBasic_ProductType)
%wrap_handle(StepBasic_SiUnitAndAreaUnit)
%wrap_handle(StepBasic_SiUnitAndLengthUnit)
%wrap_handle(StepBasic_SiUnitAndMassUnit)
%wrap_handle(StepBasic_SiUnitAndPlaneAngleUnit)
%wrap_handle(StepBasic_SiUnitAndRatioUnit)
%wrap_handle(StepBasic_SiUnitAndSolidAngleUnit)
%wrap_handle(StepBasic_SiUnitAndThermodynamicTemperatureUnit)
%wrap_handle(StepBasic_SiUnitAndTimeUnit)
%wrap_handle(StepBasic_SiUnitAndVolumeUnit)
%wrap_handle(StepBasic_HArray1OfOrganization)
%wrap_handle(StepBasic_HArray1OfProductDefinition)
%wrap_handle(StepBasic_HArray1OfDerivedUnitElement)
%wrap_handle(StepBasic_HArray1OfPerson)
%wrap_handle(StepBasic_HArray1OfUncertaintyMeasureWithUnit)
%wrap_handle(StepBasic_HArray1OfApproval)
%wrap_handle(StepBasic_HArray1OfNamedUnit)
%wrap_handle(StepBasic_HArray1OfProductContext)
%wrap_handle(StepBasic_HArray1OfDocument)
%wrap_handle(StepBasic_HArray1OfProduct)
/* end handles declaration */

/* templates */
%template(StepBasic_Array1OfUncertaintyMeasureWithUnit) NCollection_Array1 <opencascade::handle <StepBasic_UncertaintyMeasureWithUnit>>;

%extend NCollection_Array1 <opencascade::handle <StepBasic_UncertaintyMeasureWithUnit>> {
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
%template(StepBasic_Array1OfDerivedUnitElement) NCollection_Array1 <opencascade::handle <StepBasic_DerivedUnitElement>>;

%extend NCollection_Array1 <opencascade::handle <StepBasic_DerivedUnitElement>> {
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
%template(StepBasic_Array1OfProductContext) NCollection_Array1 <opencascade::handle <StepBasic_ProductContext>>;

%extend NCollection_Array1 <opencascade::handle <StepBasic_ProductContext>> {
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
%template(StepBasic_Array1OfApproval) NCollection_Array1 <opencascade::handle <StepBasic_Approval>>;

%extend NCollection_Array1 <opencascade::handle <StepBasic_Approval>> {
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
%template(StepBasic_Array1OfProductDefinition) NCollection_Array1 <opencascade::handle <StepBasic_ProductDefinition>>;

%extend NCollection_Array1 <opencascade::handle <StepBasic_ProductDefinition>> {
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
%template(StepBasic_Array1OfDocument) NCollection_Array1 <opencascade::handle <StepBasic_Document>>;

%extend NCollection_Array1 <opencascade::handle <StepBasic_Document>> {
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
%template(StepBasic_Array1OfOrganization) NCollection_Array1 <opencascade::handle <StepBasic_Organization>>;

%extend NCollection_Array1 <opencascade::handle <StepBasic_Organization>> {
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
%template(StepBasic_Array1OfProduct) NCollection_Array1 <opencascade::handle <StepBasic_Product>>;

%extend NCollection_Array1 <opencascade::handle <StepBasic_Product>> {
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
%template(StepBasic_Array1OfNamedUnit) NCollection_Array1 <opencascade::handle <StepBasic_NamedUnit>>;

%extend NCollection_Array1 <opencascade::handle <StepBasic_NamedUnit>> {
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
%template(StepBasic_Array1OfPerson) NCollection_Array1 <opencascade::handle <StepBasic_Person>>;

%extend NCollection_Array1 <opencascade::handle <StepBasic_Person>> {
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
typedef NCollection_Array1 <opencascade::handle <StepBasic_UncertaintyMeasureWithUnit>> StepBasic_Array1OfUncertaintyMeasureWithUnit;
typedef NCollection_Array1 <opencascade::handle <StepBasic_DerivedUnitElement>> StepBasic_Array1OfDerivedUnitElement;
typedef NCollection_Array1 <opencascade::handle <StepBasic_ProductContext>> StepBasic_Array1OfProductContext;
typedef NCollection_Array1 <opencascade::handle <StepBasic_Approval>> StepBasic_Array1OfApproval;
typedef NCollection_Array1 <opencascade::handle <StepBasic_ProductDefinition>> StepBasic_Array1OfProductDefinition;
typedef NCollection_Array1 <opencascade::handle <StepBasic_Document>> StepBasic_Array1OfDocument;
typedef NCollection_Array1 <opencascade::handle <StepBasic_Organization>> StepBasic_Array1OfOrganization;
typedef NCollection_Array1 <opencascade::handle <StepBasic_Product>> StepBasic_Array1OfProduct;
typedef NCollection_Array1 <opencascade::handle <StepBasic_NamedUnit>> StepBasic_Array1OfNamedUnit;
typedef NCollection_Array1 <opencascade::handle <StepBasic_Person>> StepBasic_Array1OfPerson;
/* end typedefs declaration */

%nodefaultctor StepBasic_Action;
class StepBasic_Action : public Standard_Transient {
	public:
		%feature("compactdefaultargs") ChosenMethod;
		%feature("autodoc", "	* Returns field ChosenMethod

	:rtype: opencascade::handle<StepBasic_ActionMethod>
") ChosenMethod;
		opencascade::handle<StepBasic_ActionMethod> ChosenMethod ();
		%feature("compactdefaultargs") Description;
		%feature("autodoc", "	* Returns field Description

	:rtype: opencascade::handle<TCollection_HAsciiString>
") Description;
		opencascade::handle<TCollection_HAsciiString> Description ();
		%feature("compactdefaultargs") HasDescription;
		%feature("autodoc", "	* Returns True if optional field Description is defined

	:rtype: bool
") HasDescription;
		Standard_Boolean HasDescription ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	* Initialize all fields (own and inherited)

	:param aName:
	:type aName: opencascade::handle<TCollection_HAsciiString> &
	:param hasDescription:
	:type hasDescription: bool
	:param aDescription:
	:type aDescription: opencascade::handle<TCollection_HAsciiString> &
	:param aChosenMethod:
	:type aChosenMethod: opencascade::handle<StepBasic_ActionMethod> &
	:rtype: None
") Init;
		void Init (const opencascade::handle<TCollection_HAsciiString> & aName,const Standard_Boolean hasDescription,const opencascade::handle<TCollection_HAsciiString> & aDescription,const opencascade::handle<StepBasic_ActionMethod> & aChosenMethod);
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "	* Returns field Name

	:rtype: opencascade::handle<TCollection_HAsciiString>
") Name;
		opencascade::handle<TCollection_HAsciiString> Name ();
		%feature("compactdefaultargs") SetChosenMethod;
		%feature("autodoc", "	* Set field ChosenMethod

	:param ChosenMethod:
	:type ChosenMethod: opencascade::handle<StepBasic_ActionMethod> &
	:rtype: None
") SetChosenMethod;
		void SetChosenMethod (const opencascade::handle<StepBasic_ActionMethod> & ChosenMethod);
		%feature("compactdefaultargs") SetDescription;
		%feature("autodoc", "	* Set field Description

	:param Description:
	:type Description: opencascade::handle<TCollection_HAsciiString> &
	:rtype: None
") SetDescription;
		void SetDescription (const opencascade::handle<TCollection_HAsciiString> & Description);
		%feature("compactdefaultargs") SetName;
		%feature("autodoc", "	* Set field Name

	:param Name:
	:type Name: opencascade::handle<TCollection_HAsciiString> &
	:rtype: None
") SetName;
		void SetName (const opencascade::handle<TCollection_HAsciiString> & Name);
		%feature("compactdefaultargs") StepBasic_Action;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") StepBasic_Action;
		 StepBasic_Action ();
};


%make_alias(StepBasic_Action)

%extend StepBasic_Action {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepBasic_ActionAssignment;
class StepBasic_ActionAssignment : public Standard_Transient {
	public:
		%feature("compactdefaultargs") AssignedAction;
		%feature("autodoc", "	* Returns field AssignedAction

	:rtype: opencascade::handle<StepBasic_Action>
") AssignedAction;
		opencascade::handle<StepBasic_Action> AssignedAction ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	* Initialize all fields (own and inherited)

	:param aAssignedAction:
	:type aAssignedAction: opencascade::handle<StepBasic_Action> &
	:rtype: None
") Init;
		void Init (const opencascade::handle<StepBasic_Action> & aAssignedAction);
		%feature("compactdefaultargs") SetAssignedAction;
		%feature("autodoc", "	* Set field AssignedAction

	:param AssignedAction:
	:type AssignedAction: opencascade::handle<StepBasic_Action> &
	:rtype: None
") SetAssignedAction;
		void SetAssignedAction (const opencascade::handle<StepBasic_Action> & AssignedAction);
		%feature("compactdefaultargs") StepBasic_ActionAssignment;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") StepBasic_ActionAssignment;
		 StepBasic_ActionAssignment ();
};


%make_alias(StepBasic_ActionAssignment)

%extend StepBasic_ActionAssignment {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepBasic_ActionMethod;
class StepBasic_ActionMethod : public Standard_Transient {
	public:
		%feature("compactdefaultargs") Consequence;
		%feature("autodoc", "	* Returns field Consequence

	:rtype: opencascade::handle<TCollection_HAsciiString>
") Consequence;
		opencascade::handle<TCollection_HAsciiString> Consequence ();
		%feature("compactdefaultargs") Description;
		%feature("autodoc", "	* Returns field Description

	:rtype: opencascade::handle<TCollection_HAsciiString>
") Description;
		opencascade::handle<TCollection_HAsciiString> Description ();
		%feature("compactdefaultargs") HasDescription;
		%feature("autodoc", "	* Returns True if optional field Description is defined

	:rtype: bool
") HasDescription;
		Standard_Boolean HasDescription ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	* Initialize all fields (own and inherited)

	:param aName:
	:type aName: opencascade::handle<TCollection_HAsciiString> &
	:param hasDescription:
	:type hasDescription: bool
	:param aDescription:
	:type aDescription: opencascade::handle<TCollection_HAsciiString> &
	:param aConsequence:
	:type aConsequence: opencascade::handle<TCollection_HAsciiString> &
	:param aPurpose:
	:type aPurpose: opencascade::handle<TCollection_HAsciiString> &
	:rtype: None
") Init;
		void Init (const opencascade::handle<TCollection_HAsciiString> & aName,const Standard_Boolean hasDescription,const opencascade::handle<TCollection_HAsciiString> & aDescription,const opencascade::handle<TCollection_HAsciiString> & aConsequence,const opencascade::handle<TCollection_HAsciiString> & aPurpose);
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "	* Returns field Name

	:rtype: opencascade::handle<TCollection_HAsciiString>
") Name;
		opencascade::handle<TCollection_HAsciiString> Name ();
		%feature("compactdefaultargs") Purpose;
		%feature("autodoc", "	* Returns field Purpose

	:rtype: opencascade::handle<TCollection_HAsciiString>
") Purpose;
		opencascade::handle<TCollection_HAsciiString> Purpose ();
		%feature("compactdefaultargs") SetConsequence;
		%feature("autodoc", "	* Set field Consequence

	:param Consequence:
	:type Consequence: opencascade::handle<TCollection_HAsciiString> &
	:rtype: None
") SetConsequence;
		void SetConsequence (const opencascade::handle<TCollection_HAsciiString> & Consequence);
		%feature("compactdefaultargs") SetDescription;
		%feature("autodoc", "	* Set field Description

	:param Description:
	:type Description: opencascade::handle<TCollection_HAsciiString> &
	:rtype: None
") SetDescription;
		void SetDescription (const opencascade::handle<TCollection_HAsciiString> & Description);
		%feature("compactdefaultargs") SetName;
		%feature("autodoc", "	* Set field Name

	:param Name:
	:type Name: opencascade::handle<TCollection_HAsciiString> &
	:rtype: None
") SetName;
		void SetName (const opencascade::handle<TCollection_HAsciiString> & Name);
		%feature("compactdefaultargs") SetPurpose;
		%feature("autodoc", "	* Set field Purpose

	:param Purpose:
	:type Purpose: opencascade::handle<TCollection_HAsciiString> &
	:rtype: None
") SetPurpose;
		void SetPurpose (const opencascade::handle<TCollection_HAsciiString> & Purpose);
		%feature("compactdefaultargs") StepBasic_ActionMethod;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") StepBasic_ActionMethod;
		 StepBasic_ActionMethod ();
};


%make_alias(StepBasic_ActionMethod)

%extend StepBasic_ActionMethod {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepBasic_ActionRequestAssignment;
class StepBasic_ActionRequestAssignment : public Standard_Transient {
	public:
		%feature("compactdefaultargs") AssignedActionRequest;
		%feature("autodoc", "	* Returns field AssignedActionRequest

	:rtype: opencascade::handle<StepBasic_VersionedActionRequest>
") AssignedActionRequest;
		opencascade::handle<StepBasic_VersionedActionRequest> AssignedActionRequest ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	* Initialize all fields (own and inherited)

	:param aAssignedActionRequest:
	:type aAssignedActionRequest: opencascade::handle<StepBasic_VersionedActionRequest> &
	:rtype: None
") Init;
		void Init (const opencascade::handle<StepBasic_VersionedActionRequest> & aAssignedActionRequest);
		%feature("compactdefaultargs") SetAssignedActionRequest;
		%feature("autodoc", "	* Set field AssignedActionRequest

	:param AssignedActionRequest:
	:type AssignedActionRequest: opencascade::handle<StepBasic_VersionedActionRequest> &
	:rtype: None
") SetAssignedActionRequest;
		void SetAssignedActionRequest (const opencascade::handle<StepBasic_VersionedActionRequest> & AssignedActionRequest);
		%feature("compactdefaultargs") StepBasic_ActionRequestAssignment;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") StepBasic_ActionRequestAssignment;
		 StepBasic_ActionRequestAssignment ();
};


%make_alias(StepBasic_ActionRequestAssignment)

%extend StepBasic_ActionRequestAssignment {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepBasic_ActionRequestSolution;
class StepBasic_ActionRequestSolution : public Standard_Transient {
	public:
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	* Initialize all fields (own and inherited)

	:param aMethod:
	:type aMethod: opencascade::handle<StepBasic_ActionMethod> &
	:param aRequest:
	:type aRequest: opencascade::handle<StepBasic_VersionedActionRequest> &
	:rtype: None
") Init;
		void Init (const opencascade::handle<StepBasic_ActionMethod> & aMethod,const opencascade::handle<StepBasic_VersionedActionRequest> & aRequest);
		%feature("compactdefaultargs") Method;
		%feature("autodoc", "	* Returns field Method

	:rtype: opencascade::handle<StepBasic_ActionMethod>
") Method;
		opencascade::handle<StepBasic_ActionMethod> Method ();
		%feature("compactdefaultargs") Request;
		%feature("autodoc", "	* Returns field Request

	:rtype: opencascade::handle<StepBasic_VersionedActionRequest>
") Request;
		opencascade::handle<StepBasic_VersionedActionRequest> Request ();
		%feature("compactdefaultargs") SetMethod;
		%feature("autodoc", "	* Set field Method

	:param Method:
	:type Method: opencascade::handle<StepBasic_ActionMethod> &
	:rtype: None
") SetMethod;
		void SetMethod (const opencascade::handle<StepBasic_ActionMethod> & Method);
		%feature("compactdefaultargs") SetRequest;
		%feature("autodoc", "	* Set field Request

	:param Request:
	:type Request: opencascade::handle<StepBasic_VersionedActionRequest> &
	:rtype: None
") SetRequest;
		void SetRequest (const opencascade::handle<StepBasic_VersionedActionRequest> & Request);
		%feature("compactdefaultargs") StepBasic_ActionRequestSolution;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") StepBasic_ActionRequestSolution;
		 StepBasic_ActionRequestSolution ();
};


%make_alias(StepBasic_ActionRequestSolution)

%extend StepBasic_ActionRequestSolution {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepBasic_Address;
class StepBasic_Address : public Standard_Transient {
	public:
		%feature("compactdefaultargs") Country;
		%feature("autodoc", "	:rtype: opencascade::handle<TCollection_HAsciiString>
") Country;
		opencascade::handle<TCollection_HAsciiString> Country ();
		%feature("compactdefaultargs") ElectronicMailAddress;
		%feature("autodoc", "	:rtype: opencascade::handle<TCollection_HAsciiString>
") ElectronicMailAddress;
		opencascade::handle<TCollection_HAsciiString> ElectronicMailAddress ();
		%feature("compactdefaultargs") FacsimileNumber;
		%feature("autodoc", "	:rtype: opencascade::handle<TCollection_HAsciiString>
") FacsimileNumber;
		opencascade::handle<TCollection_HAsciiString> FacsimileNumber ();
		%feature("compactdefaultargs") HasCountry;
		%feature("autodoc", "	:rtype: bool
") HasCountry;
		Standard_Boolean HasCountry ();
		%feature("compactdefaultargs") HasElectronicMailAddress;
		%feature("autodoc", "	:rtype: bool
") HasElectronicMailAddress;
		Standard_Boolean HasElectronicMailAddress ();
		%feature("compactdefaultargs") HasFacsimileNumber;
		%feature("autodoc", "	:rtype: bool
") HasFacsimileNumber;
		Standard_Boolean HasFacsimileNumber ();
		%feature("compactdefaultargs") HasInternalLocation;
		%feature("autodoc", "	:rtype: bool
") HasInternalLocation;
		Standard_Boolean HasInternalLocation ();
		%feature("compactdefaultargs") HasPostalBox;
		%feature("autodoc", "	:rtype: bool
") HasPostalBox;
		Standard_Boolean HasPostalBox ();
		%feature("compactdefaultargs") HasPostalCode;
		%feature("autodoc", "	:rtype: bool
") HasPostalCode;
		Standard_Boolean HasPostalCode ();
		%feature("compactdefaultargs") HasRegion;
		%feature("autodoc", "	:rtype: bool
") HasRegion;
		Standard_Boolean HasRegion ();
		%feature("compactdefaultargs") HasStreet;
		%feature("autodoc", "	:rtype: bool
") HasStreet;
		Standard_Boolean HasStreet ();
		%feature("compactdefaultargs") HasStreetNumber;
		%feature("autodoc", "	:rtype: bool
") HasStreetNumber;
		Standard_Boolean HasStreetNumber ();
		%feature("compactdefaultargs") HasTelephoneNumber;
		%feature("autodoc", "	:rtype: bool
") HasTelephoneNumber;
		Standard_Boolean HasTelephoneNumber ();
		%feature("compactdefaultargs") HasTelexNumber;
		%feature("autodoc", "	:rtype: bool
") HasTelexNumber;
		Standard_Boolean HasTelexNumber ();
		%feature("compactdefaultargs") HasTown;
		%feature("autodoc", "	:rtype: bool
") HasTown;
		Standard_Boolean HasTown ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param hasAinternalLocation:
	:type hasAinternalLocation: bool
	:param aInternalLocation:
	:type aInternalLocation: opencascade::handle<TCollection_HAsciiString> &
	:param hasAstreetNumber:
	:type hasAstreetNumber: bool
	:param aStreetNumber:
	:type aStreetNumber: opencascade::handle<TCollection_HAsciiString> &
	:param hasAstreet:
	:type hasAstreet: bool
	:param aStreet:
	:type aStreet: opencascade::handle<TCollection_HAsciiString> &
	:param hasApostalBox:
	:type hasApostalBox: bool
	:param aPostalBox:
	:type aPostalBox: opencascade::handle<TCollection_HAsciiString> &
	:param hasAtown:
	:type hasAtown: bool
	:param aTown:
	:type aTown: opencascade::handle<TCollection_HAsciiString> &
	:param hasAregion:
	:type hasAregion: bool
	:param aRegion:
	:type aRegion: opencascade::handle<TCollection_HAsciiString> &
	:param hasApostalCode:
	:type hasApostalCode: bool
	:param aPostalCode:
	:type aPostalCode: opencascade::handle<TCollection_HAsciiString> &
	:param hasAcountry:
	:type hasAcountry: bool
	:param aCountry:
	:type aCountry: opencascade::handle<TCollection_HAsciiString> &
	:param hasAfacsimileNumber:
	:type hasAfacsimileNumber: bool
	:param aFacsimileNumber:
	:type aFacsimileNumber: opencascade::handle<TCollection_HAsciiString> &
	:param hasAtelephoneNumber:
	:type hasAtelephoneNumber: bool
	:param aTelephoneNumber:
	:type aTelephoneNumber: opencascade::handle<TCollection_HAsciiString> &
	:param hasAelectronicMailAddress:
	:type hasAelectronicMailAddress: bool
	:param aElectronicMailAddress:
	:type aElectronicMailAddress: opencascade::handle<TCollection_HAsciiString> &
	:param hasAtelexNumber:
	:type hasAtelexNumber: bool
	:param aTelexNumber:
	:type aTelexNumber: opencascade::handle<TCollection_HAsciiString> &
	:rtype: None
") Init;
		void Init (const Standard_Boolean hasAinternalLocation,const opencascade::handle<TCollection_HAsciiString> & aInternalLocation,const Standard_Boolean hasAstreetNumber,const opencascade::handle<TCollection_HAsciiString> & aStreetNumber,const Standard_Boolean hasAstreet,const opencascade::handle<TCollection_HAsciiString> & aStreet,const Standard_Boolean hasApostalBox,const opencascade::handle<TCollection_HAsciiString> & aPostalBox,const Standard_Boolean hasAtown,const opencascade::handle<TCollection_HAsciiString> & aTown,const Standard_Boolean hasAregion,const opencascade::handle<TCollection_HAsciiString> & aRegion,const Standard_Boolean hasApostalCode,const opencascade::handle<TCollection_HAsciiString> & aPostalCode,const Standard_Boolean hasAcountry,const opencascade::handle<TCollection_HAsciiString> & aCountry,const Standard_Boolean hasAfacsimileNumber,const opencascade::handle<TCollection_HAsciiString> & aFacsimileNumber,const Standard_Boolean hasAtelephoneNumber,const opencascade::handle<TCollection_HAsciiString> & aTelephoneNumber,const Standard_Boolean hasAelectronicMailAddress,const opencascade::handle<TCollection_HAsciiString> & aElectronicMailAddress,const Standard_Boolean hasAtelexNumber,const opencascade::handle<TCollection_HAsciiString> & aTelexNumber);
		%feature("compactdefaultargs") InternalLocation;
		%feature("autodoc", "	:rtype: opencascade::handle<TCollection_HAsciiString>
") InternalLocation;
		opencascade::handle<TCollection_HAsciiString> InternalLocation ();
		%feature("compactdefaultargs") PostalBox;
		%feature("autodoc", "	:rtype: opencascade::handle<TCollection_HAsciiString>
") PostalBox;
		opencascade::handle<TCollection_HAsciiString> PostalBox ();
		%feature("compactdefaultargs") PostalCode;
		%feature("autodoc", "	:rtype: opencascade::handle<TCollection_HAsciiString>
") PostalCode;
		opencascade::handle<TCollection_HAsciiString> PostalCode ();
		%feature("compactdefaultargs") Region;
		%feature("autodoc", "	:rtype: opencascade::handle<TCollection_HAsciiString>
") Region;
		opencascade::handle<TCollection_HAsciiString> Region ();
		%feature("compactdefaultargs") SetCountry;
		%feature("autodoc", "	:param aCountry:
	:type aCountry: opencascade::handle<TCollection_HAsciiString> &
	:rtype: None
") SetCountry;
		void SetCountry (const opencascade::handle<TCollection_HAsciiString> & aCountry);
		%feature("compactdefaultargs") SetElectronicMailAddress;
		%feature("autodoc", "	:param aElectronicMailAddress:
	:type aElectronicMailAddress: opencascade::handle<TCollection_HAsciiString> &
	:rtype: None
") SetElectronicMailAddress;
		void SetElectronicMailAddress (const opencascade::handle<TCollection_HAsciiString> & aElectronicMailAddress);
		%feature("compactdefaultargs") SetFacsimileNumber;
		%feature("autodoc", "	:param aFacsimileNumber:
	:type aFacsimileNumber: opencascade::handle<TCollection_HAsciiString> &
	:rtype: None
") SetFacsimileNumber;
		void SetFacsimileNumber (const opencascade::handle<TCollection_HAsciiString> & aFacsimileNumber);
		%feature("compactdefaultargs") SetInternalLocation;
		%feature("autodoc", "	:param aInternalLocation:
	:type aInternalLocation: opencascade::handle<TCollection_HAsciiString> &
	:rtype: None
") SetInternalLocation;
		void SetInternalLocation (const opencascade::handle<TCollection_HAsciiString> & aInternalLocation);
		%feature("compactdefaultargs") SetPostalBox;
		%feature("autodoc", "	:param aPostalBox:
	:type aPostalBox: opencascade::handle<TCollection_HAsciiString> &
	:rtype: None
") SetPostalBox;
		void SetPostalBox (const opencascade::handle<TCollection_HAsciiString> & aPostalBox);
		%feature("compactdefaultargs") SetPostalCode;
		%feature("autodoc", "	:param aPostalCode:
	:type aPostalCode: opencascade::handle<TCollection_HAsciiString> &
	:rtype: None
") SetPostalCode;
		void SetPostalCode (const opencascade::handle<TCollection_HAsciiString> & aPostalCode);
		%feature("compactdefaultargs") SetRegion;
		%feature("autodoc", "	:param aRegion:
	:type aRegion: opencascade::handle<TCollection_HAsciiString> &
	:rtype: None
") SetRegion;
		void SetRegion (const opencascade::handle<TCollection_HAsciiString> & aRegion);
		%feature("compactdefaultargs") SetStreet;
		%feature("autodoc", "	:param aStreet:
	:type aStreet: opencascade::handle<TCollection_HAsciiString> &
	:rtype: None
") SetStreet;
		void SetStreet (const opencascade::handle<TCollection_HAsciiString> & aStreet);
		%feature("compactdefaultargs") SetStreetNumber;
		%feature("autodoc", "	:param aStreetNumber:
	:type aStreetNumber: opencascade::handle<TCollection_HAsciiString> &
	:rtype: None
") SetStreetNumber;
		void SetStreetNumber (const opencascade::handle<TCollection_HAsciiString> & aStreetNumber);
		%feature("compactdefaultargs") SetTelephoneNumber;
		%feature("autodoc", "	:param aTelephoneNumber:
	:type aTelephoneNumber: opencascade::handle<TCollection_HAsciiString> &
	:rtype: None
") SetTelephoneNumber;
		void SetTelephoneNumber (const opencascade::handle<TCollection_HAsciiString> & aTelephoneNumber);
		%feature("compactdefaultargs") SetTelexNumber;
		%feature("autodoc", "	:param aTelexNumber:
	:type aTelexNumber: opencascade::handle<TCollection_HAsciiString> &
	:rtype: None
") SetTelexNumber;
		void SetTelexNumber (const opencascade::handle<TCollection_HAsciiString> & aTelexNumber);
		%feature("compactdefaultargs") SetTown;
		%feature("autodoc", "	:param aTown:
	:type aTown: opencascade::handle<TCollection_HAsciiString> &
	:rtype: None
") SetTown;
		void SetTown (const opencascade::handle<TCollection_HAsciiString> & aTown);
		%feature("compactdefaultargs") StepBasic_Address;
		%feature("autodoc", "	* Returns a Address

	:rtype: None
") StepBasic_Address;
		 StepBasic_Address ();
		%feature("compactdefaultargs") Street;
		%feature("autodoc", "	:rtype: opencascade::handle<TCollection_HAsciiString>
") Street;
		opencascade::handle<TCollection_HAsciiString> Street ();
		%feature("compactdefaultargs") StreetNumber;
		%feature("autodoc", "	:rtype: opencascade::handle<TCollection_HAsciiString>
") StreetNumber;
		opencascade::handle<TCollection_HAsciiString> StreetNumber ();
		%feature("compactdefaultargs") TelephoneNumber;
		%feature("autodoc", "	:rtype: opencascade::handle<TCollection_HAsciiString>
") TelephoneNumber;
		opencascade::handle<TCollection_HAsciiString> TelephoneNumber ();
		%feature("compactdefaultargs") TelexNumber;
		%feature("autodoc", "	:rtype: opencascade::handle<TCollection_HAsciiString>
") TelexNumber;
		opencascade::handle<TCollection_HAsciiString> TelexNumber ();
		%feature("compactdefaultargs") Town;
		%feature("autodoc", "	:rtype: opencascade::handle<TCollection_HAsciiString>
") Town;
		opencascade::handle<TCollection_HAsciiString> Town ();
		%feature("compactdefaultargs") UnSetCountry;
		%feature("autodoc", "	:rtype: None
") UnSetCountry;
		void UnSetCountry ();
		%feature("compactdefaultargs") UnSetElectronicMailAddress;
		%feature("autodoc", "	:rtype: None
") UnSetElectronicMailAddress;
		void UnSetElectronicMailAddress ();
		%feature("compactdefaultargs") UnSetFacsimileNumber;
		%feature("autodoc", "	:rtype: None
") UnSetFacsimileNumber;
		void UnSetFacsimileNumber ();
		%feature("compactdefaultargs") UnSetInternalLocation;
		%feature("autodoc", "	:rtype: None
") UnSetInternalLocation;
		void UnSetInternalLocation ();
		%feature("compactdefaultargs") UnSetPostalBox;
		%feature("autodoc", "	:rtype: None
") UnSetPostalBox;
		void UnSetPostalBox ();
		%feature("compactdefaultargs") UnSetPostalCode;
		%feature("autodoc", "	:rtype: None
") UnSetPostalCode;
		void UnSetPostalCode ();
		%feature("compactdefaultargs") UnSetRegion;
		%feature("autodoc", "	:rtype: None
") UnSetRegion;
		void UnSetRegion ();
		%feature("compactdefaultargs") UnSetStreet;
		%feature("autodoc", "	:rtype: None
") UnSetStreet;
		void UnSetStreet ();
		%feature("compactdefaultargs") UnSetStreetNumber;
		%feature("autodoc", "	:rtype: None
") UnSetStreetNumber;
		void UnSetStreetNumber ();
		%feature("compactdefaultargs") UnSetTelephoneNumber;
		%feature("autodoc", "	:rtype: None
") UnSetTelephoneNumber;
		void UnSetTelephoneNumber ();
		%feature("compactdefaultargs") UnSetTelexNumber;
		%feature("autodoc", "	:rtype: None
") UnSetTelexNumber;
		void UnSetTelexNumber ();
		%feature("compactdefaultargs") UnSetTown;
		%feature("autodoc", "	:rtype: None
") UnSetTown;
		void UnSetTown ();
};


%make_alias(StepBasic_Address)

%extend StepBasic_Address {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepBasic_ApplicationContext;
class StepBasic_ApplicationContext : public Standard_Transient {
	public:
		%feature("compactdefaultargs") Application;
		%feature("autodoc", "	:rtype: opencascade::handle<TCollection_HAsciiString>
") Application;
		opencascade::handle<TCollection_HAsciiString> Application ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aApplication:
	:type aApplication: opencascade::handle<TCollection_HAsciiString> &
	:rtype: None
") Init;
		void Init (const opencascade::handle<TCollection_HAsciiString> & aApplication);
		%feature("compactdefaultargs") SetApplication;
		%feature("autodoc", "	:param aApplication:
	:type aApplication: opencascade::handle<TCollection_HAsciiString> &
	:rtype: None
") SetApplication;
		void SetApplication (const opencascade::handle<TCollection_HAsciiString> & aApplication);
		%feature("compactdefaultargs") StepBasic_ApplicationContext;
		%feature("autodoc", "	* Returns a ApplicationContext

	:rtype: None
") StepBasic_ApplicationContext;
		 StepBasic_ApplicationContext ();
};


%make_alias(StepBasic_ApplicationContext)

%extend StepBasic_ApplicationContext {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepBasic_ApplicationContextElement;
class StepBasic_ApplicationContextElement : public Standard_Transient {
	public:
		%feature("compactdefaultargs") FrameOfReference;
		%feature("autodoc", "	:rtype: opencascade::handle<StepBasic_ApplicationContext>
") FrameOfReference;
		opencascade::handle<StepBasic_ApplicationContext> FrameOfReference ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aName:
	:type aName: opencascade::handle<TCollection_HAsciiString> &
	:param aFrameOfReference:
	:type aFrameOfReference: opencascade::handle<StepBasic_ApplicationContext> &
	:rtype: None
") Init;
		void Init (const opencascade::handle<TCollection_HAsciiString> & aName,const opencascade::handle<StepBasic_ApplicationContext> & aFrameOfReference);
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "	:rtype: opencascade::handle<TCollection_HAsciiString>
") Name;
		opencascade::handle<TCollection_HAsciiString> Name ();
		%feature("compactdefaultargs") SetFrameOfReference;
		%feature("autodoc", "	:param aFrameOfReference:
	:type aFrameOfReference: opencascade::handle<StepBasic_ApplicationContext> &
	:rtype: None
") SetFrameOfReference;
		void SetFrameOfReference (const opencascade::handle<StepBasic_ApplicationContext> & aFrameOfReference);
		%feature("compactdefaultargs") SetName;
		%feature("autodoc", "	:param aName:
	:type aName: opencascade::handle<TCollection_HAsciiString> &
	:rtype: None
") SetName;
		void SetName (const opencascade::handle<TCollection_HAsciiString> & aName);
		%feature("compactdefaultargs") StepBasic_ApplicationContextElement;
		%feature("autodoc", "	* Returns a ApplicationContextElement

	:rtype: None
") StepBasic_ApplicationContextElement;
		 StepBasic_ApplicationContextElement ();
};


%make_alias(StepBasic_ApplicationContextElement)

%extend StepBasic_ApplicationContextElement {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepBasic_ApplicationProtocolDefinition;
class StepBasic_ApplicationProtocolDefinition : public Standard_Transient {
	public:
		%feature("compactdefaultargs") Application;
		%feature("autodoc", "	:rtype: opencascade::handle<StepBasic_ApplicationContext>
") Application;
		opencascade::handle<StepBasic_ApplicationContext> Application ();
		%feature("compactdefaultargs") ApplicationInterpretedModelSchemaName;
		%feature("autodoc", "	:rtype: opencascade::handle<TCollection_HAsciiString>
") ApplicationInterpretedModelSchemaName;
		opencascade::handle<TCollection_HAsciiString> ApplicationInterpretedModelSchemaName ();
		%feature("compactdefaultargs") ApplicationProtocolYear;
		%feature("autodoc", "	:rtype: int
") ApplicationProtocolYear;
		Standard_Integer ApplicationProtocolYear ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aStatus:
	:type aStatus: opencascade::handle<TCollection_HAsciiString> &
	:param aApplicationInterpretedModelSchemaName:
	:type aApplicationInterpretedModelSchemaName: opencascade::handle<TCollection_HAsciiString> &
	:param aApplicationProtocolYear:
	:type aApplicationProtocolYear: int
	:param aApplication:
	:type aApplication: opencascade::handle<StepBasic_ApplicationContext> &
	:rtype: None
") Init;
		void Init (const opencascade::handle<TCollection_HAsciiString> & aStatus,const opencascade::handle<TCollection_HAsciiString> & aApplicationInterpretedModelSchemaName,const Standard_Integer aApplicationProtocolYear,const opencascade::handle<StepBasic_ApplicationContext> & aApplication);
		%feature("compactdefaultargs") SetApplication;
		%feature("autodoc", "	:param aApplication:
	:type aApplication: opencascade::handle<StepBasic_ApplicationContext> &
	:rtype: None
") SetApplication;
		void SetApplication (const opencascade::handle<StepBasic_ApplicationContext> & aApplication);
		%feature("compactdefaultargs") SetApplicationInterpretedModelSchemaName;
		%feature("autodoc", "	:param aApplicationInterpretedModelSchemaName:
	:type aApplicationInterpretedModelSchemaName: opencascade::handle<TCollection_HAsciiString> &
	:rtype: None
") SetApplicationInterpretedModelSchemaName;
		void SetApplicationInterpretedModelSchemaName (const opencascade::handle<TCollection_HAsciiString> & aApplicationInterpretedModelSchemaName);
		%feature("compactdefaultargs") SetApplicationProtocolYear;
		%feature("autodoc", "	:param aApplicationProtocolYear:
	:type aApplicationProtocolYear: int
	:rtype: None
") SetApplicationProtocolYear;
		void SetApplicationProtocolYear (const Standard_Integer aApplicationProtocolYear);
		%feature("compactdefaultargs") SetStatus;
		%feature("autodoc", "	:param aStatus:
	:type aStatus: opencascade::handle<TCollection_HAsciiString> &
	:rtype: None
") SetStatus;
		void SetStatus (const opencascade::handle<TCollection_HAsciiString> & aStatus);
		%feature("compactdefaultargs") Status;
		%feature("autodoc", "	:rtype: opencascade::handle<TCollection_HAsciiString>
") Status;
		opencascade::handle<TCollection_HAsciiString> Status ();
		%feature("compactdefaultargs") StepBasic_ApplicationProtocolDefinition;
		%feature("autodoc", "	* Returns a ApplicationProtocolDefinition

	:rtype: None
") StepBasic_ApplicationProtocolDefinition;
		 StepBasic_ApplicationProtocolDefinition ();
};


%make_alias(StepBasic_ApplicationProtocolDefinition)

%extend StepBasic_ApplicationProtocolDefinition {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepBasic_Approval;
class StepBasic_Approval : public Standard_Transient {
	public:
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aStatus:
	:type aStatus: opencascade::handle<StepBasic_ApprovalStatus> &
	:param aLevel:
	:type aLevel: opencascade::handle<TCollection_HAsciiString> &
	:rtype: None
") Init;
		void Init (const opencascade::handle<StepBasic_ApprovalStatus> & aStatus,const opencascade::handle<TCollection_HAsciiString> & aLevel);
		%feature("compactdefaultargs") Level;
		%feature("autodoc", "	:rtype: opencascade::handle<TCollection_HAsciiString>
") Level;
		opencascade::handle<TCollection_HAsciiString> Level ();
		%feature("compactdefaultargs") SetLevel;
		%feature("autodoc", "	:param aLevel:
	:type aLevel: opencascade::handle<TCollection_HAsciiString> &
	:rtype: None
") SetLevel;
		void SetLevel (const opencascade::handle<TCollection_HAsciiString> & aLevel);
		%feature("compactdefaultargs") SetStatus;
		%feature("autodoc", "	:param aStatus:
	:type aStatus: opencascade::handle<StepBasic_ApprovalStatus> &
	:rtype: None
") SetStatus;
		void SetStatus (const opencascade::handle<StepBasic_ApprovalStatus> & aStatus);
		%feature("compactdefaultargs") Status;
		%feature("autodoc", "	:rtype: opencascade::handle<StepBasic_ApprovalStatus>
") Status;
		opencascade::handle<StepBasic_ApprovalStatus> Status ();
		%feature("compactdefaultargs") StepBasic_Approval;
		%feature("autodoc", "	* Returns a Approval

	:rtype: None
") StepBasic_Approval;
		 StepBasic_Approval ();
};


%make_alias(StepBasic_Approval)

%extend StepBasic_Approval {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepBasic_ApprovalAssignment;
class StepBasic_ApprovalAssignment : public Standard_Transient {
	public:
		%feature("compactdefaultargs") AssignedApproval;
		%feature("autodoc", "	:rtype: opencascade::handle<StepBasic_Approval>
") AssignedApproval;
		opencascade::handle<StepBasic_Approval> AssignedApproval ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aAssignedApproval:
	:type aAssignedApproval: opencascade::handle<StepBasic_Approval> &
	:rtype: None
") Init;
		void Init (const opencascade::handle<StepBasic_Approval> & aAssignedApproval);
		%feature("compactdefaultargs") SetAssignedApproval;
		%feature("autodoc", "	:param aAssignedApproval:
	:type aAssignedApproval: opencascade::handle<StepBasic_Approval> &
	:rtype: None
") SetAssignedApproval;
		void SetAssignedApproval (const opencascade::handle<StepBasic_Approval> & aAssignedApproval);
};


%make_alias(StepBasic_ApprovalAssignment)

%extend StepBasic_ApprovalAssignment {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepBasic_ApprovalDateTime;
class StepBasic_ApprovalDateTime : public Standard_Transient {
	public:
		%feature("compactdefaultargs") DateTime;
		%feature("autodoc", "	:rtype: StepBasic_DateTimeSelect
") DateTime;
		StepBasic_DateTimeSelect DateTime ();
		%feature("compactdefaultargs") DatedApproval;
		%feature("autodoc", "	:rtype: opencascade::handle<StepBasic_Approval>
") DatedApproval;
		opencascade::handle<StepBasic_Approval> DatedApproval ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aDateTime:
	:type aDateTime: StepBasic_DateTimeSelect &
	:param aDatedApproval:
	:type aDatedApproval: opencascade::handle<StepBasic_Approval> &
	:rtype: None
") Init;
		void Init (const StepBasic_DateTimeSelect & aDateTime,const opencascade::handle<StepBasic_Approval> & aDatedApproval);
		%feature("compactdefaultargs") SetDateTime;
		%feature("autodoc", "	:param aDateTime:
	:type aDateTime: StepBasic_DateTimeSelect &
	:rtype: None
") SetDateTime;
		void SetDateTime (const StepBasic_DateTimeSelect & aDateTime);
		%feature("compactdefaultargs") SetDatedApproval;
		%feature("autodoc", "	:param aDatedApproval:
	:type aDatedApproval: opencascade::handle<StepBasic_Approval> &
	:rtype: None
") SetDatedApproval;
		void SetDatedApproval (const opencascade::handle<StepBasic_Approval> & aDatedApproval);
		%feature("compactdefaultargs") StepBasic_ApprovalDateTime;
		%feature("autodoc", "	:rtype: None
") StepBasic_ApprovalDateTime;
		 StepBasic_ApprovalDateTime ();
};


%make_alias(StepBasic_ApprovalDateTime)

%extend StepBasic_ApprovalDateTime {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepBasic_ApprovalPersonOrganization;
class StepBasic_ApprovalPersonOrganization : public Standard_Transient {
	public:
		%feature("compactdefaultargs") AuthorizedApproval;
		%feature("autodoc", "	:rtype: opencascade::handle<StepBasic_Approval>
") AuthorizedApproval;
		opencascade::handle<StepBasic_Approval> AuthorizedApproval ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aPersonOrganization:
	:type aPersonOrganization: StepBasic_PersonOrganizationSelect &
	:param aAuthorizedApproval:
	:type aAuthorizedApproval: opencascade::handle<StepBasic_Approval> &
	:param aRole:
	:type aRole: opencascade::handle<StepBasic_ApprovalRole> &
	:rtype: None
") Init;
		void Init (const StepBasic_PersonOrganizationSelect & aPersonOrganization,const opencascade::handle<StepBasic_Approval> & aAuthorizedApproval,const opencascade::handle<StepBasic_ApprovalRole> & aRole);
		%feature("compactdefaultargs") PersonOrganization;
		%feature("autodoc", "	:rtype: StepBasic_PersonOrganizationSelect
") PersonOrganization;
		StepBasic_PersonOrganizationSelect PersonOrganization ();
		%feature("compactdefaultargs") Role;
		%feature("autodoc", "	:rtype: opencascade::handle<StepBasic_ApprovalRole>
") Role;
		opencascade::handle<StepBasic_ApprovalRole> Role ();
		%feature("compactdefaultargs") SetAuthorizedApproval;
		%feature("autodoc", "	:param aAuthorizedApproval:
	:type aAuthorizedApproval: opencascade::handle<StepBasic_Approval> &
	:rtype: None
") SetAuthorizedApproval;
		void SetAuthorizedApproval (const opencascade::handle<StepBasic_Approval> & aAuthorizedApproval);
		%feature("compactdefaultargs") SetPersonOrganization;
		%feature("autodoc", "	:param aPersonOrganization:
	:type aPersonOrganization: StepBasic_PersonOrganizationSelect &
	:rtype: None
") SetPersonOrganization;
		void SetPersonOrganization (const StepBasic_PersonOrganizationSelect & aPersonOrganization);
		%feature("compactdefaultargs") SetRole;
		%feature("autodoc", "	:param aRole:
	:type aRole: opencascade::handle<StepBasic_ApprovalRole> &
	:rtype: None
") SetRole;
		void SetRole (const opencascade::handle<StepBasic_ApprovalRole> & aRole);
		%feature("compactdefaultargs") StepBasic_ApprovalPersonOrganization;
		%feature("autodoc", "	* Returns a ApprovalPersonOrganization

	:rtype: None
") StepBasic_ApprovalPersonOrganization;
		 StepBasic_ApprovalPersonOrganization ();
};


%make_alias(StepBasic_ApprovalPersonOrganization)

%extend StepBasic_ApprovalPersonOrganization {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepBasic_ApprovalRelationship;
class StepBasic_ApprovalRelationship : public Standard_Transient {
	public:
		%feature("compactdefaultargs") Description;
		%feature("autodoc", "	:rtype: opencascade::handle<TCollection_HAsciiString>
") Description;
		opencascade::handle<TCollection_HAsciiString> Description ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aName:
	:type aName: opencascade::handle<TCollection_HAsciiString> &
	:param aDescription:
	:type aDescription: opencascade::handle<TCollection_HAsciiString> &
	:param aRelatingApproval:
	:type aRelatingApproval: opencascade::handle<StepBasic_Approval> &
	:param aRelatedApproval:
	:type aRelatedApproval: opencascade::handle<StepBasic_Approval> &
	:rtype: None
") Init;
		void Init (const opencascade::handle<TCollection_HAsciiString> & aName,const opencascade::handle<TCollection_HAsciiString> & aDescription,const opencascade::handle<StepBasic_Approval> & aRelatingApproval,const opencascade::handle<StepBasic_Approval> & aRelatedApproval);
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "	:rtype: opencascade::handle<TCollection_HAsciiString>
") Name;
		opencascade::handle<TCollection_HAsciiString> Name ();
		%feature("compactdefaultargs") RelatedApproval;
		%feature("autodoc", "	:rtype: opencascade::handle<StepBasic_Approval>
") RelatedApproval;
		opencascade::handle<StepBasic_Approval> RelatedApproval ();
		%feature("compactdefaultargs") RelatingApproval;
		%feature("autodoc", "	:rtype: opencascade::handle<StepBasic_Approval>
") RelatingApproval;
		opencascade::handle<StepBasic_Approval> RelatingApproval ();
		%feature("compactdefaultargs") SetDescription;
		%feature("autodoc", "	:param aDescription:
	:type aDescription: opencascade::handle<TCollection_HAsciiString> &
	:rtype: None
") SetDescription;
		void SetDescription (const opencascade::handle<TCollection_HAsciiString> & aDescription);
		%feature("compactdefaultargs") SetName;
		%feature("autodoc", "	:param aName:
	:type aName: opencascade::handle<TCollection_HAsciiString> &
	:rtype: None
") SetName;
		void SetName (const opencascade::handle<TCollection_HAsciiString> & aName);
		%feature("compactdefaultargs") SetRelatedApproval;
		%feature("autodoc", "	:param aRelatedApproval:
	:type aRelatedApproval: opencascade::handle<StepBasic_Approval> &
	:rtype: None
") SetRelatedApproval;
		void SetRelatedApproval (const opencascade::handle<StepBasic_Approval> & aRelatedApproval);
		%feature("compactdefaultargs") SetRelatingApproval;
		%feature("autodoc", "	:param aRelatingApproval:
	:type aRelatingApproval: opencascade::handle<StepBasic_Approval> &
	:rtype: None
") SetRelatingApproval;
		void SetRelatingApproval (const opencascade::handle<StepBasic_Approval> & aRelatingApproval);
		%feature("compactdefaultargs") StepBasic_ApprovalRelationship;
		%feature("autodoc", "	* Returns a ApprovalRelationship

	:rtype: None
") StepBasic_ApprovalRelationship;
		 StepBasic_ApprovalRelationship ();
};


%make_alias(StepBasic_ApprovalRelationship)

%extend StepBasic_ApprovalRelationship {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepBasic_ApprovalRole;
class StepBasic_ApprovalRole : public Standard_Transient {
	public:
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aRole:
	:type aRole: opencascade::handle<TCollection_HAsciiString> &
	:rtype: None
") Init;
		void Init (const opencascade::handle<TCollection_HAsciiString> & aRole);
		%feature("compactdefaultargs") Role;
		%feature("autodoc", "	:rtype: opencascade::handle<TCollection_HAsciiString>
") Role;
		opencascade::handle<TCollection_HAsciiString> Role ();
		%feature("compactdefaultargs") SetRole;
		%feature("autodoc", "	:param aRole:
	:type aRole: opencascade::handle<TCollection_HAsciiString> &
	:rtype: None
") SetRole;
		void SetRole (const opencascade::handle<TCollection_HAsciiString> & aRole);
		%feature("compactdefaultargs") StepBasic_ApprovalRole;
		%feature("autodoc", "	* Returns a ApprovalRole

	:rtype: None
") StepBasic_ApprovalRole;
		 StepBasic_ApprovalRole ();
};


%make_alias(StepBasic_ApprovalRole)

%extend StepBasic_ApprovalRole {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepBasic_ApprovalStatus;
class StepBasic_ApprovalStatus : public Standard_Transient {
	public:
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aName:
	:type aName: opencascade::handle<TCollection_HAsciiString> &
	:rtype: None
") Init;
		void Init (const opencascade::handle<TCollection_HAsciiString> & aName);
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "	:rtype: opencascade::handle<TCollection_HAsciiString>
") Name;
		opencascade::handle<TCollection_HAsciiString> Name ();
		%feature("compactdefaultargs") SetName;
		%feature("autodoc", "	:param aName:
	:type aName: opencascade::handle<TCollection_HAsciiString> &
	:rtype: None
") SetName;
		void SetName (const opencascade::handle<TCollection_HAsciiString> & aName);
		%feature("compactdefaultargs") StepBasic_ApprovalStatus;
		%feature("autodoc", "	* Returns a ApprovalStatus

	:rtype: None
") StepBasic_ApprovalStatus;
		 StepBasic_ApprovalStatus ();
};


%make_alias(StepBasic_ApprovalStatus)

%extend StepBasic_ApprovalStatus {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepBasic_Certification;
class StepBasic_Certification : public Standard_Transient {
	public:
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	* Initialize all fields (own and inherited)

	:param aName:
	:type aName: opencascade::handle<TCollection_HAsciiString> &
	:param aPurpose:
	:type aPurpose: opencascade::handle<TCollection_HAsciiString> &
	:param aKind:
	:type aKind: opencascade::handle<StepBasic_CertificationType> &
	:rtype: None
") Init;
		void Init (const opencascade::handle<TCollection_HAsciiString> & aName,const opencascade::handle<TCollection_HAsciiString> & aPurpose,const opencascade::handle<StepBasic_CertificationType> & aKind);
		%feature("compactdefaultargs") Kind;
		%feature("autodoc", "	* Returns field Kind

	:rtype: opencascade::handle<StepBasic_CertificationType>
") Kind;
		opencascade::handle<StepBasic_CertificationType> Kind ();
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "	* Returns field Name

	:rtype: opencascade::handle<TCollection_HAsciiString>
") Name;
		opencascade::handle<TCollection_HAsciiString> Name ();
		%feature("compactdefaultargs") Purpose;
		%feature("autodoc", "	* Returns field Purpose

	:rtype: opencascade::handle<TCollection_HAsciiString>
") Purpose;
		opencascade::handle<TCollection_HAsciiString> Purpose ();
		%feature("compactdefaultargs") SetKind;
		%feature("autodoc", "	* Set field Kind

	:param Kind:
	:type Kind: opencascade::handle<StepBasic_CertificationType> &
	:rtype: None
") SetKind;
		void SetKind (const opencascade::handle<StepBasic_CertificationType> & Kind);
		%feature("compactdefaultargs") SetName;
		%feature("autodoc", "	* Set field Name

	:param Name:
	:type Name: opencascade::handle<TCollection_HAsciiString> &
	:rtype: None
") SetName;
		void SetName (const opencascade::handle<TCollection_HAsciiString> & Name);
		%feature("compactdefaultargs") SetPurpose;
		%feature("autodoc", "	* Set field Purpose

	:param Purpose:
	:type Purpose: opencascade::handle<TCollection_HAsciiString> &
	:rtype: None
") SetPurpose;
		void SetPurpose (const opencascade::handle<TCollection_HAsciiString> & Purpose);
		%feature("compactdefaultargs") StepBasic_Certification;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") StepBasic_Certification;
		 StepBasic_Certification ();
};


%make_alias(StepBasic_Certification)

%extend StepBasic_Certification {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepBasic_CertificationAssignment;
class StepBasic_CertificationAssignment : public Standard_Transient {
	public:
		%feature("compactdefaultargs") AssignedCertification;
		%feature("autodoc", "	* Returns field AssignedCertification

	:rtype: opencascade::handle<StepBasic_Certification>
") AssignedCertification;
		opencascade::handle<StepBasic_Certification> AssignedCertification ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	* Initialize all fields (own and inherited)

	:param aAssignedCertification:
	:type aAssignedCertification: opencascade::handle<StepBasic_Certification> &
	:rtype: None
") Init;
		void Init (const opencascade::handle<StepBasic_Certification> & aAssignedCertification);
		%feature("compactdefaultargs") SetAssignedCertification;
		%feature("autodoc", "	* Set field AssignedCertification

	:param AssignedCertification:
	:type AssignedCertification: opencascade::handle<StepBasic_Certification> &
	:rtype: None
") SetAssignedCertification;
		void SetAssignedCertification (const opencascade::handle<StepBasic_Certification> & AssignedCertification);
		%feature("compactdefaultargs") StepBasic_CertificationAssignment;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") StepBasic_CertificationAssignment;
		 StepBasic_CertificationAssignment ();
};


%make_alias(StepBasic_CertificationAssignment)

%extend StepBasic_CertificationAssignment {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepBasic_CertificationType;
class StepBasic_CertificationType : public Standard_Transient {
	public:
		%feature("compactdefaultargs") Description;
		%feature("autodoc", "	* Returns field Description

	:rtype: opencascade::handle<TCollection_HAsciiString>
") Description;
		opencascade::handle<TCollection_HAsciiString> Description ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	* Initialize all fields (own and inherited)

	:param aDescription:
	:type aDescription: opencascade::handle<TCollection_HAsciiString> &
	:rtype: None
") Init;
		void Init (const opencascade::handle<TCollection_HAsciiString> & aDescription);
		%feature("compactdefaultargs") SetDescription;
		%feature("autodoc", "	* Set field Description

	:param Description:
	:type Description: opencascade::handle<TCollection_HAsciiString> &
	:rtype: None
") SetDescription;
		void SetDescription (const opencascade::handle<TCollection_HAsciiString> & Description);
		%feature("compactdefaultargs") StepBasic_CertificationType;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") StepBasic_CertificationType;
		 StepBasic_CertificationType ();
};


%make_alias(StepBasic_CertificationType)

%extend StepBasic_CertificationType {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepBasic_CharacterizedObject;
class StepBasic_CharacterizedObject : public Standard_Transient {
	public:
		%feature("compactdefaultargs") Description;
		%feature("autodoc", "	* Returns field Description

	:rtype: opencascade::handle<TCollection_HAsciiString>
") Description;
		opencascade::handle<TCollection_HAsciiString> Description ();
		%feature("compactdefaultargs") HasDescription;
		%feature("autodoc", "	* Returns True if optional field Description is defined

	:rtype: bool
") HasDescription;
		Standard_Boolean HasDescription ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	* Initialize all fields (own and inherited)

	:param aName:
	:type aName: opencascade::handle<TCollection_HAsciiString> &
	:param hasDescription:
	:type hasDescription: bool
	:param aDescription:
	:type aDescription: opencascade::handle<TCollection_HAsciiString> &
	:rtype: None
") Init;
		void Init (const opencascade::handle<TCollection_HAsciiString> & aName,const Standard_Boolean hasDescription,const opencascade::handle<TCollection_HAsciiString> & aDescription);
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "	* Returns field Name

	:rtype: opencascade::handle<TCollection_HAsciiString>
") Name;
		opencascade::handle<TCollection_HAsciiString> Name ();
		%feature("compactdefaultargs") SetDescription;
		%feature("autodoc", "	* Set field Description

	:param Description:
	:type Description: opencascade::handle<TCollection_HAsciiString> &
	:rtype: None
") SetDescription;
		void SetDescription (const opencascade::handle<TCollection_HAsciiString> & Description);
		%feature("compactdefaultargs") SetName;
		%feature("autodoc", "	* Set field Name

	:param Name:
	:type Name: opencascade::handle<TCollection_HAsciiString> &
	:rtype: None
") SetName;
		void SetName (const opencascade::handle<TCollection_HAsciiString> & Name);
		%feature("compactdefaultargs") StepBasic_CharacterizedObject;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") StepBasic_CharacterizedObject;
		 StepBasic_CharacterizedObject ();
};


%make_alias(StepBasic_CharacterizedObject)

%extend StepBasic_CharacterizedObject {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepBasic_Contract;
class StepBasic_Contract : public Standard_Transient {
	public:
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	* Initialize all fields (own and inherited)

	:param aName:
	:type aName: opencascade::handle<TCollection_HAsciiString> &
	:param aPurpose:
	:type aPurpose: opencascade::handle<TCollection_HAsciiString> &
	:param aKind:
	:type aKind: opencascade::handle<StepBasic_ContractType> &
	:rtype: None
") Init;
		void Init (const opencascade::handle<TCollection_HAsciiString> & aName,const opencascade::handle<TCollection_HAsciiString> & aPurpose,const opencascade::handle<StepBasic_ContractType> & aKind);
		%feature("compactdefaultargs") Kind;
		%feature("autodoc", "	* Returns field Kind

	:rtype: opencascade::handle<StepBasic_ContractType>
") Kind;
		opencascade::handle<StepBasic_ContractType> Kind ();
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "	* Returns field Name

	:rtype: opencascade::handle<TCollection_HAsciiString>
") Name;
		opencascade::handle<TCollection_HAsciiString> Name ();
		%feature("compactdefaultargs") Purpose;
		%feature("autodoc", "	* Returns field Purpose

	:rtype: opencascade::handle<TCollection_HAsciiString>
") Purpose;
		opencascade::handle<TCollection_HAsciiString> Purpose ();
		%feature("compactdefaultargs") SetKind;
		%feature("autodoc", "	* Set field Kind

	:param Kind:
	:type Kind: opencascade::handle<StepBasic_ContractType> &
	:rtype: None
") SetKind;
		void SetKind (const opencascade::handle<StepBasic_ContractType> & Kind);
		%feature("compactdefaultargs") SetName;
		%feature("autodoc", "	* Set field Name

	:param Name:
	:type Name: opencascade::handle<TCollection_HAsciiString> &
	:rtype: None
") SetName;
		void SetName (const opencascade::handle<TCollection_HAsciiString> & Name);
		%feature("compactdefaultargs") SetPurpose;
		%feature("autodoc", "	* Set field Purpose

	:param Purpose:
	:type Purpose: opencascade::handle<TCollection_HAsciiString> &
	:rtype: None
") SetPurpose;
		void SetPurpose (const opencascade::handle<TCollection_HAsciiString> & Purpose);
		%feature("compactdefaultargs") StepBasic_Contract;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") StepBasic_Contract;
		 StepBasic_Contract ();
};


%make_alias(StepBasic_Contract)

%extend StepBasic_Contract {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepBasic_ContractAssignment;
class StepBasic_ContractAssignment : public Standard_Transient {
	public:
		%feature("compactdefaultargs") AssignedContract;
		%feature("autodoc", "	* Returns field AssignedContract

	:rtype: opencascade::handle<StepBasic_Contract>
") AssignedContract;
		opencascade::handle<StepBasic_Contract> AssignedContract ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	* Initialize all fields (own and inherited)

	:param aAssignedContract:
	:type aAssignedContract: opencascade::handle<StepBasic_Contract> &
	:rtype: None
") Init;
		void Init (const opencascade::handle<StepBasic_Contract> & aAssignedContract);
		%feature("compactdefaultargs") SetAssignedContract;
		%feature("autodoc", "	* Set field AssignedContract

	:param AssignedContract:
	:type AssignedContract: opencascade::handle<StepBasic_Contract> &
	:rtype: None
") SetAssignedContract;
		void SetAssignedContract (const opencascade::handle<StepBasic_Contract> & AssignedContract);
		%feature("compactdefaultargs") StepBasic_ContractAssignment;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") StepBasic_ContractAssignment;
		 StepBasic_ContractAssignment ();
};


%make_alias(StepBasic_ContractAssignment)

%extend StepBasic_ContractAssignment {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepBasic_ContractType;
class StepBasic_ContractType : public Standard_Transient {
	public:
		%feature("compactdefaultargs") Description;
		%feature("autodoc", "	* Returns field Description

	:rtype: opencascade::handle<TCollection_HAsciiString>
") Description;
		opencascade::handle<TCollection_HAsciiString> Description ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	* Initialize all fields (own and inherited)

	:param aDescription:
	:type aDescription: opencascade::handle<TCollection_HAsciiString> &
	:rtype: None
") Init;
		void Init (const opencascade::handle<TCollection_HAsciiString> & aDescription);
		%feature("compactdefaultargs") SetDescription;
		%feature("autodoc", "	* Set field Description

	:param Description:
	:type Description: opencascade::handle<TCollection_HAsciiString> &
	:rtype: None
") SetDescription;
		void SetDescription (const opencascade::handle<TCollection_HAsciiString> & Description);
		%feature("compactdefaultargs") StepBasic_ContractType;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") StepBasic_ContractType;
		 StepBasic_ContractType ();
};


%make_alias(StepBasic_ContractType)

%extend StepBasic_ContractType {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepBasic_CoordinatedUniversalTimeOffset;
class StepBasic_CoordinatedUniversalTimeOffset : public Standard_Transient {
	public:
		%feature("compactdefaultargs") HasMinuteOffset;
		%feature("autodoc", "	:rtype: bool
") HasMinuteOffset;
		Standard_Boolean HasMinuteOffset ();
		%feature("compactdefaultargs") HourOffset;
		%feature("autodoc", "	:rtype: int
") HourOffset;
		Standard_Integer HourOffset ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aHourOffset:
	:type aHourOffset: int
	:param hasAminuteOffset:
	:type hasAminuteOffset: bool
	:param aMinuteOffset:
	:type aMinuteOffset: int
	:param aSense:
	:type aSense: StepBasic_AheadOrBehind
	:rtype: None
") Init;
		void Init (const Standard_Integer aHourOffset,const Standard_Boolean hasAminuteOffset,const Standard_Integer aMinuteOffset,const StepBasic_AheadOrBehind aSense);
		%feature("compactdefaultargs") MinuteOffset;
		%feature("autodoc", "	:rtype: int
") MinuteOffset;
		Standard_Integer MinuteOffset ();
		%feature("compactdefaultargs") Sense;
		%feature("autodoc", "	:rtype: StepBasic_AheadOrBehind
") Sense;
		StepBasic_AheadOrBehind Sense ();
		%feature("compactdefaultargs") SetHourOffset;
		%feature("autodoc", "	:param aHourOffset:
	:type aHourOffset: int
	:rtype: None
") SetHourOffset;
		void SetHourOffset (const Standard_Integer aHourOffset);
		%feature("compactdefaultargs") SetMinuteOffset;
		%feature("autodoc", "	:param aMinuteOffset:
	:type aMinuteOffset: int
	:rtype: None
") SetMinuteOffset;
		void SetMinuteOffset (const Standard_Integer aMinuteOffset);
		%feature("compactdefaultargs") SetSense;
		%feature("autodoc", "	:param aSense:
	:type aSense: StepBasic_AheadOrBehind
	:rtype: None
") SetSense;
		void SetSense (const StepBasic_AheadOrBehind aSense);
		%feature("compactdefaultargs") StepBasic_CoordinatedUniversalTimeOffset;
		%feature("autodoc", "	* Returns a CoordinatedUniversalTimeOffset

	:rtype: None
") StepBasic_CoordinatedUniversalTimeOffset;
		 StepBasic_CoordinatedUniversalTimeOffset ();
		%feature("compactdefaultargs") UnSetMinuteOffset;
		%feature("autodoc", "	:rtype: None
") UnSetMinuteOffset;
		void UnSetMinuteOffset ();
};


%make_alias(StepBasic_CoordinatedUniversalTimeOffset)

%extend StepBasic_CoordinatedUniversalTimeOffset {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepBasic_Date;
class StepBasic_Date : public Standard_Transient {
	public:
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aYearComponent:
	:type aYearComponent: int
	:rtype: None
") Init;
		void Init (const Standard_Integer aYearComponent);
		%feature("compactdefaultargs") SetYearComponent;
		%feature("autodoc", "	:param aYearComponent:
	:type aYearComponent: int
	:rtype: None
") SetYearComponent;
		void SetYearComponent (const Standard_Integer aYearComponent);
		%feature("compactdefaultargs") StepBasic_Date;
		%feature("autodoc", "	* Returns a Date

	:rtype: None
") StepBasic_Date;
		 StepBasic_Date ();
		%feature("compactdefaultargs") YearComponent;
		%feature("autodoc", "	:rtype: int
") YearComponent;
		Standard_Integer YearComponent ();
};


%make_alias(StepBasic_Date)

%extend StepBasic_Date {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepBasic_DateAndTime;
class StepBasic_DateAndTime : public Standard_Transient {
	public:
		%feature("compactdefaultargs") DateComponent;
		%feature("autodoc", "	:rtype: opencascade::handle<StepBasic_Date>
") DateComponent;
		opencascade::handle<StepBasic_Date> DateComponent ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aDateComponent:
	:type aDateComponent: opencascade::handle<StepBasic_Date> &
	:param aTimeComponent:
	:type aTimeComponent: opencascade::handle<StepBasic_LocalTime> &
	:rtype: None
") Init;
		void Init (const opencascade::handle<StepBasic_Date> & aDateComponent,const opencascade::handle<StepBasic_LocalTime> & aTimeComponent);
		%feature("compactdefaultargs") SetDateComponent;
		%feature("autodoc", "	:param aDateComponent:
	:type aDateComponent: opencascade::handle<StepBasic_Date> &
	:rtype: None
") SetDateComponent;
		void SetDateComponent (const opencascade::handle<StepBasic_Date> & aDateComponent);
		%feature("compactdefaultargs") SetTimeComponent;
		%feature("autodoc", "	:param aTimeComponent:
	:type aTimeComponent: opencascade::handle<StepBasic_LocalTime> &
	:rtype: None
") SetTimeComponent;
		void SetTimeComponent (const opencascade::handle<StepBasic_LocalTime> & aTimeComponent);
		%feature("compactdefaultargs") StepBasic_DateAndTime;
		%feature("autodoc", "	* Returns a DateAndTime

	:rtype: None
") StepBasic_DateAndTime;
		 StepBasic_DateAndTime ();
		%feature("compactdefaultargs") TimeComponent;
		%feature("autodoc", "	:rtype: opencascade::handle<StepBasic_LocalTime>
") TimeComponent;
		opencascade::handle<StepBasic_LocalTime> TimeComponent ();
};


%make_alias(StepBasic_DateAndTime)

%extend StepBasic_DateAndTime {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepBasic_DateAndTimeAssignment;
class StepBasic_DateAndTimeAssignment : public Standard_Transient {
	public:
		%feature("compactdefaultargs") AssignedDateAndTime;
		%feature("autodoc", "	:rtype: opencascade::handle<StepBasic_DateAndTime>
") AssignedDateAndTime;
		opencascade::handle<StepBasic_DateAndTime> AssignedDateAndTime ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aAssignedDateAndTime:
	:type aAssignedDateAndTime: opencascade::handle<StepBasic_DateAndTime> &
	:param aRole:
	:type aRole: opencascade::handle<StepBasic_DateTimeRole> &
	:rtype: None
") Init;
		void Init (const opencascade::handle<StepBasic_DateAndTime> & aAssignedDateAndTime,const opencascade::handle<StepBasic_DateTimeRole> & aRole);
		%feature("compactdefaultargs") Role;
		%feature("autodoc", "	:rtype: opencascade::handle<StepBasic_DateTimeRole>
") Role;
		opencascade::handle<StepBasic_DateTimeRole> Role ();
		%feature("compactdefaultargs") SetAssignedDateAndTime;
		%feature("autodoc", "	:param aAssignedDateAndTime:
	:type aAssignedDateAndTime: opencascade::handle<StepBasic_DateAndTime> &
	:rtype: None
") SetAssignedDateAndTime;
		void SetAssignedDateAndTime (const opencascade::handle<StepBasic_DateAndTime> & aAssignedDateAndTime);
		%feature("compactdefaultargs") SetRole;
		%feature("autodoc", "	:param aRole:
	:type aRole: opencascade::handle<StepBasic_DateTimeRole> &
	:rtype: None
") SetRole;
		void SetRole (const opencascade::handle<StepBasic_DateTimeRole> & aRole);
};


%make_alias(StepBasic_DateAndTimeAssignment)

%extend StepBasic_DateAndTimeAssignment {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepBasic_DateAssignment;
class StepBasic_DateAssignment : public Standard_Transient {
	public:
		%feature("compactdefaultargs") AssignedDate;
		%feature("autodoc", "	:rtype: opencascade::handle<StepBasic_Date>
") AssignedDate;
		opencascade::handle<StepBasic_Date> AssignedDate ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aAssignedDate:
	:type aAssignedDate: opencascade::handle<StepBasic_Date> &
	:param aRole:
	:type aRole: opencascade::handle<StepBasic_DateRole> &
	:rtype: None
") Init;
		void Init (const opencascade::handle<StepBasic_Date> & aAssignedDate,const opencascade::handle<StepBasic_DateRole> & aRole);
		%feature("compactdefaultargs") Role;
		%feature("autodoc", "	:rtype: opencascade::handle<StepBasic_DateRole>
") Role;
		opencascade::handle<StepBasic_DateRole> Role ();
		%feature("compactdefaultargs") SetAssignedDate;
		%feature("autodoc", "	:param aAssignedDate:
	:type aAssignedDate: opencascade::handle<StepBasic_Date> &
	:rtype: None
") SetAssignedDate;
		void SetAssignedDate (const opencascade::handle<StepBasic_Date> & aAssignedDate);
		%feature("compactdefaultargs") SetRole;
		%feature("autodoc", "	:param aRole:
	:type aRole: opencascade::handle<StepBasic_DateRole> &
	:rtype: None
") SetRole;
		void SetRole (const opencascade::handle<StepBasic_DateRole> & aRole);
};


%make_alias(StepBasic_DateAssignment)

%extend StepBasic_DateAssignment {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepBasic_DateRole;
class StepBasic_DateRole : public Standard_Transient {
	public:
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aName:
	:type aName: opencascade::handle<TCollection_HAsciiString> &
	:rtype: None
") Init;
		void Init (const opencascade::handle<TCollection_HAsciiString> & aName);
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "	:rtype: opencascade::handle<TCollection_HAsciiString>
") Name;
		opencascade::handle<TCollection_HAsciiString> Name ();
		%feature("compactdefaultargs") SetName;
		%feature("autodoc", "	:param aName:
	:type aName: opencascade::handle<TCollection_HAsciiString> &
	:rtype: None
") SetName;
		void SetName (const opencascade::handle<TCollection_HAsciiString> & aName);
		%feature("compactdefaultargs") StepBasic_DateRole;
		%feature("autodoc", "	* Returns a DateRole

	:rtype: None
") StepBasic_DateRole;
		 StepBasic_DateRole ();
};


%make_alias(StepBasic_DateRole)

%extend StepBasic_DateRole {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepBasic_DateTimeRole;
class StepBasic_DateTimeRole : public Standard_Transient {
	public:
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aName:
	:type aName: opencascade::handle<TCollection_HAsciiString> &
	:rtype: None
") Init;
		void Init (const opencascade::handle<TCollection_HAsciiString> & aName);
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "	:rtype: opencascade::handle<TCollection_HAsciiString>
") Name;
		opencascade::handle<TCollection_HAsciiString> Name ();
		%feature("compactdefaultargs") SetName;
		%feature("autodoc", "	:param aName:
	:type aName: opencascade::handle<TCollection_HAsciiString> &
	:rtype: None
") SetName;
		void SetName (const opencascade::handle<TCollection_HAsciiString> & aName);
		%feature("compactdefaultargs") StepBasic_DateTimeRole;
		%feature("autodoc", "	* Returns a DateTimeRole

	:rtype: None
") StepBasic_DateTimeRole;
		 StepBasic_DateTimeRole ();
};


%make_alias(StepBasic_DateTimeRole)

%extend StepBasic_DateTimeRole {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepBasic_DateTimeSelect;
class StepBasic_DateTimeSelect : public StepData_SelectType {
	public:
		%feature("compactdefaultargs") CaseNum;
		%feature("autodoc", "	* Recognizes a DateTimeSelect Kind Entity that is : 1 -> Date 2 -> LocalTime 3 -> DateAndTime 0 else

	:param ent:
	:type ent: opencascade::handle<Standard_Transient> &
	:rtype: int
") CaseNum;
		Standard_Integer CaseNum (const opencascade::handle<Standard_Transient> & ent);
		%feature("compactdefaultargs") Date;
		%feature("autodoc", "	* returns Value as a Date (Null if another type)

	:rtype: opencascade::handle<StepBasic_Date>
") Date;
		opencascade::handle<StepBasic_Date> Date ();
		%feature("compactdefaultargs") DateAndTime;
		%feature("autodoc", "	* returns Value as a DateAndTime (Null if another type)

	:rtype: opencascade::handle<StepBasic_DateAndTime>
") DateAndTime;
		opencascade::handle<StepBasic_DateAndTime> DateAndTime ();
		%feature("compactdefaultargs") LocalTime;
		%feature("autodoc", "	* returns Value as a LocalTime (Null if another type)

	:rtype: opencascade::handle<StepBasic_LocalTime>
") LocalTime;
		opencascade::handle<StepBasic_LocalTime> LocalTime ();
		%feature("compactdefaultargs") StepBasic_DateTimeSelect;
		%feature("autodoc", "	* Returns a DateTimeSelect SelectType

	:rtype: None
") StepBasic_DateTimeSelect;
		 StepBasic_DateTimeSelect ();
};


%extend StepBasic_DateTimeSelect {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepBasic_DerivedUnit;
class StepBasic_DerivedUnit : public Standard_Transient {
	public:
		%feature("compactdefaultargs") Elements;
		%feature("autodoc", "	:rtype: opencascade::handle<StepBasic_HArray1OfDerivedUnitElement>
") Elements;
		opencascade::handle<StepBasic_HArray1OfDerivedUnitElement> Elements ();
		%feature("compactdefaultargs") ElementsValue;
		%feature("autodoc", "	:param num:
	:type num: int
	:rtype: opencascade::handle<StepBasic_DerivedUnitElement>
") ElementsValue;
		opencascade::handle<StepBasic_DerivedUnitElement> ElementsValue (const Standard_Integer num);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param elements:
	:type elements: opencascade::handle<StepBasic_HArray1OfDerivedUnitElement> &
	:rtype: None
") Init;
		void Init (const opencascade::handle<StepBasic_HArray1OfDerivedUnitElement> & elements);
		%feature("compactdefaultargs") NbElements;
		%feature("autodoc", "	:rtype: int
") NbElements;
		Standard_Integer NbElements ();
		%feature("compactdefaultargs") SetElements;
		%feature("autodoc", "	:param elements:
	:type elements: opencascade::handle<StepBasic_HArray1OfDerivedUnitElement> &
	:rtype: None
") SetElements;
		void SetElements (const opencascade::handle<StepBasic_HArray1OfDerivedUnitElement> & elements);
		%feature("compactdefaultargs") StepBasic_DerivedUnit;
		%feature("autodoc", "	:rtype: None
") StepBasic_DerivedUnit;
		 StepBasic_DerivedUnit ();
};


%make_alias(StepBasic_DerivedUnit)

%extend StepBasic_DerivedUnit {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepBasic_DerivedUnitElement;
class StepBasic_DerivedUnitElement : public Standard_Transient {
	public:
		%feature("compactdefaultargs") Exponent;
		%feature("autodoc", "	:rtype: float
") Exponent;
		Standard_Real Exponent ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aUnit:
	:type aUnit: opencascade::handle<StepBasic_NamedUnit> &
	:param aExponent:
	:type aExponent: float
	:rtype: None
") Init;
		void Init (const opencascade::handle<StepBasic_NamedUnit> & aUnit,const Standard_Real aExponent);
		%feature("compactdefaultargs") SetExponent;
		%feature("autodoc", "	:param aExponent:
	:type aExponent: float
	:rtype: None
") SetExponent;
		void SetExponent (const Standard_Real aExponent);
		%feature("compactdefaultargs") SetUnit;
		%feature("autodoc", "	:param aUnit:
	:type aUnit: opencascade::handle<StepBasic_NamedUnit> &
	:rtype: None
") SetUnit;
		void SetUnit (const opencascade::handle<StepBasic_NamedUnit> & aUnit);
		%feature("compactdefaultargs") StepBasic_DerivedUnitElement;
		%feature("autodoc", "	:rtype: None
") StepBasic_DerivedUnitElement;
		 StepBasic_DerivedUnitElement ();
		%feature("compactdefaultargs") Unit;
		%feature("autodoc", "	:rtype: opencascade::handle<StepBasic_NamedUnit>
") Unit;
		opencascade::handle<StepBasic_NamedUnit> Unit ();
};


%make_alias(StepBasic_DerivedUnitElement)

%extend StepBasic_DerivedUnitElement {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepBasic_DimensionalExponents;
class StepBasic_DimensionalExponents : public Standard_Transient {
	public:
		%feature("compactdefaultargs") AmountOfSubstanceExponent;
		%feature("autodoc", "	:rtype: float
") AmountOfSubstanceExponent;
		Standard_Real AmountOfSubstanceExponent ();
		%feature("compactdefaultargs") ElectricCurrentExponent;
		%feature("autodoc", "	:rtype: float
") ElectricCurrentExponent;
		Standard_Real ElectricCurrentExponent ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aLengthExponent:
	:type aLengthExponent: float
	:param aMassExponent:
	:type aMassExponent: float
	:param aTimeExponent:
	:type aTimeExponent: float
	:param aElectricCurrentExponent:
	:type aElectricCurrentExponent: float
	:param aThermodynamicTemperatureExponent:
	:type aThermodynamicTemperatureExponent: float
	:param aAmountOfSubstanceExponent:
	:type aAmountOfSubstanceExponent: float
	:param aLuminousIntensityExponent:
	:type aLuminousIntensityExponent: float
	:rtype: None
") Init;
		void Init (const Standard_Real aLengthExponent,const Standard_Real aMassExponent,const Standard_Real aTimeExponent,const Standard_Real aElectricCurrentExponent,const Standard_Real aThermodynamicTemperatureExponent,const Standard_Real aAmountOfSubstanceExponent,const Standard_Real aLuminousIntensityExponent);
		%feature("compactdefaultargs") LengthExponent;
		%feature("autodoc", "	:rtype: float
") LengthExponent;
		Standard_Real LengthExponent ();
		%feature("compactdefaultargs") LuminousIntensityExponent;
		%feature("autodoc", "	:rtype: float
") LuminousIntensityExponent;
		Standard_Real LuminousIntensityExponent ();
		%feature("compactdefaultargs") MassExponent;
		%feature("autodoc", "	:rtype: float
") MassExponent;
		Standard_Real MassExponent ();
		%feature("compactdefaultargs") SetAmountOfSubstanceExponent;
		%feature("autodoc", "	:param aAmountOfSubstanceExponent:
	:type aAmountOfSubstanceExponent: float
	:rtype: None
") SetAmountOfSubstanceExponent;
		void SetAmountOfSubstanceExponent (const Standard_Real aAmountOfSubstanceExponent);
		%feature("compactdefaultargs") SetElectricCurrentExponent;
		%feature("autodoc", "	:param aElectricCurrentExponent:
	:type aElectricCurrentExponent: float
	:rtype: None
") SetElectricCurrentExponent;
		void SetElectricCurrentExponent (const Standard_Real aElectricCurrentExponent);
		%feature("compactdefaultargs") SetLengthExponent;
		%feature("autodoc", "	:param aLengthExponent:
	:type aLengthExponent: float
	:rtype: None
") SetLengthExponent;
		void SetLengthExponent (const Standard_Real aLengthExponent);
		%feature("compactdefaultargs") SetLuminousIntensityExponent;
		%feature("autodoc", "	:param aLuminousIntensityExponent:
	:type aLuminousIntensityExponent: float
	:rtype: None
") SetLuminousIntensityExponent;
		void SetLuminousIntensityExponent (const Standard_Real aLuminousIntensityExponent);
		%feature("compactdefaultargs") SetMassExponent;
		%feature("autodoc", "	:param aMassExponent:
	:type aMassExponent: float
	:rtype: None
") SetMassExponent;
		void SetMassExponent (const Standard_Real aMassExponent);
		%feature("compactdefaultargs") SetThermodynamicTemperatureExponent;
		%feature("autodoc", "	:param aThermodynamicTemperatureExponent:
	:type aThermodynamicTemperatureExponent: float
	:rtype: None
") SetThermodynamicTemperatureExponent;
		void SetThermodynamicTemperatureExponent (const Standard_Real aThermodynamicTemperatureExponent);
		%feature("compactdefaultargs") SetTimeExponent;
		%feature("autodoc", "	:param aTimeExponent:
	:type aTimeExponent: float
	:rtype: None
") SetTimeExponent;
		void SetTimeExponent (const Standard_Real aTimeExponent);
		%feature("compactdefaultargs") StepBasic_DimensionalExponents;
		%feature("autodoc", "	* Returns a DimensionalExponents

	:rtype: None
") StepBasic_DimensionalExponents;
		 StepBasic_DimensionalExponents ();
		%feature("compactdefaultargs") ThermodynamicTemperatureExponent;
		%feature("autodoc", "	:rtype: float
") ThermodynamicTemperatureExponent;
		Standard_Real ThermodynamicTemperatureExponent ();
		%feature("compactdefaultargs") TimeExponent;
		%feature("autodoc", "	:rtype: float
") TimeExponent;
		Standard_Real TimeExponent ();
};


%make_alias(StepBasic_DimensionalExponents)

%extend StepBasic_DimensionalExponents {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepBasic_Document;
class StepBasic_Document : public Standard_Transient {
	public:
		%feature("compactdefaultargs") Description;
		%feature("autodoc", "	* Returns field Description

	:rtype: opencascade::handle<TCollection_HAsciiString>
") Description;
		opencascade::handle<TCollection_HAsciiString> Description ();
		%feature("compactdefaultargs") HasDescription;
		%feature("autodoc", "	* Returns True if optional field Description is defined

	:rtype: bool
") HasDescription;
		Standard_Boolean HasDescription ();
		%feature("compactdefaultargs") Id;
		%feature("autodoc", "	* Returns field Id

	:rtype: opencascade::handle<TCollection_HAsciiString>
") Id;
		opencascade::handle<TCollection_HAsciiString> Id ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	* Initialize all fields (own and inherited)

	:param aId:
	:type aId: opencascade::handle<TCollection_HAsciiString> &
	:param aName:
	:type aName: opencascade::handle<TCollection_HAsciiString> &
	:param hasDescription:
	:type hasDescription: bool
	:param aDescription:
	:type aDescription: opencascade::handle<TCollection_HAsciiString> &
	:param aKind:
	:type aKind: opencascade::handle<StepBasic_DocumentType> &
	:rtype: None
") Init;
		void Init (const opencascade::handle<TCollection_HAsciiString> & aId,const opencascade::handle<TCollection_HAsciiString> & aName,const Standard_Boolean hasDescription,const opencascade::handle<TCollection_HAsciiString> & aDescription,const opencascade::handle<StepBasic_DocumentType> & aKind);
		%feature("compactdefaultargs") Kind;
		%feature("autodoc", "	* Returns field Kind

	:rtype: opencascade::handle<StepBasic_DocumentType>
") Kind;
		opencascade::handle<StepBasic_DocumentType> Kind ();
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "	* Returns field Name

	:rtype: opencascade::handle<TCollection_HAsciiString>
") Name;
		opencascade::handle<TCollection_HAsciiString> Name ();
		%feature("compactdefaultargs") SetDescription;
		%feature("autodoc", "	* Set field Description

	:param Description:
	:type Description: opencascade::handle<TCollection_HAsciiString> &
	:rtype: None
") SetDescription;
		void SetDescription (const opencascade::handle<TCollection_HAsciiString> & Description);
		%feature("compactdefaultargs") SetId;
		%feature("autodoc", "	* Set field Id

	:param Id:
	:type Id: opencascade::handle<TCollection_HAsciiString> &
	:rtype: None
") SetId;
		void SetId (const opencascade::handle<TCollection_HAsciiString> & Id);
		%feature("compactdefaultargs") SetKind;
		%feature("autodoc", "	* Set field Kind

	:param Kind:
	:type Kind: opencascade::handle<StepBasic_DocumentType> &
	:rtype: None
") SetKind;
		void SetKind (const opencascade::handle<StepBasic_DocumentType> & Kind);
		%feature("compactdefaultargs") SetName;
		%feature("autodoc", "	* Set field Name

	:param Name:
	:type Name: opencascade::handle<TCollection_HAsciiString> &
	:rtype: None
") SetName;
		void SetName (const opencascade::handle<TCollection_HAsciiString> & Name);
		%feature("compactdefaultargs") StepBasic_Document;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") StepBasic_Document;
		 StepBasic_Document ();
};


%make_alias(StepBasic_Document)

%extend StepBasic_Document {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepBasic_DocumentProductAssociation;
class StepBasic_DocumentProductAssociation : public Standard_Transient {
	public:
		%feature("compactdefaultargs") Description;
		%feature("autodoc", "	* Returns field Description

	:rtype: opencascade::handle<TCollection_HAsciiString>
") Description;
		opencascade::handle<TCollection_HAsciiString> Description ();
		%feature("compactdefaultargs") HasDescription;
		%feature("autodoc", "	* Returns True if optional field Description is defined

	:rtype: bool
") HasDescription;
		Standard_Boolean HasDescription ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	* Initialize all fields (own and inherited)

	:param aName:
	:type aName: opencascade::handle<TCollection_HAsciiString> &
	:param hasDescription:
	:type hasDescription: bool
	:param aDescription:
	:type aDescription: opencascade::handle<TCollection_HAsciiString> &
	:param aRelatingDocument:
	:type aRelatingDocument: opencascade::handle<StepBasic_Document> &
	:param aRelatedProduct:
	:type aRelatedProduct: StepBasic_ProductOrFormationOrDefinition &
	:rtype: None
") Init;
		void Init (const opencascade::handle<TCollection_HAsciiString> & aName,const Standard_Boolean hasDescription,const opencascade::handle<TCollection_HAsciiString> & aDescription,const opencascade::handle<StepBasic_Document> & aRelatingDocument,const StepBasic_ProductOrFormationOrDefinition & aRelatedProduct);
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "	* Returns field Name

	:rtype: opencascade::handle<TCollection_HAsciiString>
") Name;
		opencascade::handle<TCollection_HAsciiString> Name ();
		%feature("compactdefaultargs") RelatedProduct;
		%feature("autodoc", "	* Returns field RelatedProduct

	:rtype: StepBasic_ProductOrFormationOrDefinition
") RelatedProduct;
		StepBasic_ProductOrFormationOrDefinition RelatedProduct ();
		%feature("compactdefaultargs") RelatingDocument;
		%feature("autodoc", "	* Returns field RelatingDocument

	:rtype: opencascade::handle<StepBasic_Document>
") RelatingDocument;
		opencascade::handle<StepBasic_Document> RelatingDocument ();
		%feature("compactdefaultargs") SetDescription;
		%feature("autodoc", "	* Set field Description

	:param Description:
	:type Description: opencascade::handle<TCollection_HAsciiString> &
	:rtype: None
") SetDescription;
		void SetDescription (const opencascade::handle<TCollection_HAsciiString> & Description);
		%feature("compactdefaultargs") SetName;
		%feature("autodoc", "	* Set field Name

	:param Name:
	:type Name: opencascade::handle<TCollection_HAsciiString> &
	:rtype: None
") SetName;
		void SetName (const opencascade::handle<TCollection_HAsciiString> & Name);
		%feature("compactdefaultargs") SetRelatedProduct;
		%feature("autodoc", "	* Set field RelatedProduct

	:param RelatedProduct:
	:type RelatedProduct: StepBasic_ProductOrFormationOrDefinition &
	:rtype: None
") SetRelatedProduct;
		void SetRelatedProduct (const StepBasic_ProductOrFormationOrDefinition & RelatedProduct);
		%feature("compactdefaultargs") SetRelatingDocument;
		%feature("autodoc", "	* Set field RelatingDocument

	:param RelatingDocument:
	:type RelatingDocument: opencascade::handle<StepBasic_Document> &
	:rtype: None
") SetRelatingDocument;
		void SetRelatingDocument (const opencascade::handle<StepBasic_Document> & RelatingDocument);
		%feature("compactdefaultargs") StepBasic_DocumentProductAssociation;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") StepBasic_DocumentProductAssociation;
		 StepBasic_DocumentProductAssociation ();
};


%make_alias(StepBasic_DocumentProductAssociation)

%extend StepBasic_DocumentProductAssociation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepBasic_DocumentReference;
class StepBasic_DocumentReference : public Standard_Transient {
	public:
		%feature("compactdefaultargs") AssignedDocument;
		%feature("autodoc", "	:rtype: opencascade::handle<StepBasic_Document>
") AssignedDocument;
		opencascade::handle<StepBasic_Document> AssignedDocument ();
		%feature("compactdefaultargs") Init0;
		%feature("autodoc", "	:param aAssignedDocument:
	:type aAssignedDocument: opencascade::handle<StepBasic_Document> &
	:param aSource:
	:type aSource: opencascade::handle<TCollection_HAsciiString> &
	:rtype: None
") Init0;
		void Init0 (const opencascade::handle<StepBasic_Document> & aAssignedDocument,const opencascade::handle<TCollection_HAsciiString> & aSource);
		%feature("compactdefaultargs") SetAssignedDocument;
		%feature("autodoc", "	:param aAssignedDocument:
	:type aAssignedDocument: opencascade::handle<StepBasic_Document> &
	:rtype: None
") SetAssignedDocument;
		void SetAssignedDocument (const opencascade::handle<StepBasic_Document> & aAssignedDocument);
		%feature("compactdefaultargs") SetSource;
		%feature("autodoc", "	:param aSource:
	:type aSource: opencascade::handle<TCollection_HAsciiString> &
	:rtype: None
") SetSource;
		void SetSource (const opencascade::handle<TCollection_HAsciiString> & aSource);
		%feature("compactdefaultargs") Source;
		%feature("autodoc", "	:rtype: opencascade::handle<TCollection_HAsciiString>
") Source;
		opencascade::handle<TCollection_HAsciiString> Source ();
};


%make_alias(StepBasic_DocumentReference)

%extend StepBasic_DocumentReference {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepBasic_DocumentRelationship;
class StepBasic_DocumentRelationship : public Standard_Transient {
	public:
		%feature("compactdefaultargs") Description;
		%feature("autodoc", "	:rtype: opencascade::handle<TCollection_HAsciiString>
") Description;
		opencascade::handle<TCollection_HAsciiString> Description ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aName:
	:type aName: opencascade::handle<TCollection_HAsciiString> &
	:param aDescription:
	:type aDescription: opencascade::handle<TCollection_HAsciiString> &
	:param aRelating:
	:type aRelating: opencascade::handle<StepBasic_Document> &
	:param aRelated:
	:type aRelated: opencascade::handle<StepBasic_Document> &
	:rtype: None
") Init;
		void Init (const opencascade::handle<TCollection_HAsciiString> & aName,const opencascade::handle<TCollection_HAsciiString> & aDescription,const opencascade::handle<StepBasic_Document> & aRelating,const opencascade::handle<StepBasic_Document> & aRelated);
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "	:rtype: opencascade::handle<TCollection_HAsciiString>
") Name;
		opencascade::handle<TCollection_HAsciiString> Name ();
		%feature("compactdefaultargs") RelatedDocument;
		%feature("autodoc", "	:rtype: opencascade::handle<StepBasic_Document>
") RelatedDocument;
		opencascade::handle<StepBasic_Document> RelatedDocument ();
		%feature("compactdefaultargs") RelatingDocument;
		%feature("autodoc", "	:rtype: opencascade::handle<StepBasic_Document>
") RelatingDocument;
		opencascade::handle<StepBasic_Document> RelatingDocument ();
		%feature("compactdefaultargs") SetDescription;
		%feature("autodoc", "	:param aDescription:
	:type aDescription: opencascade::handle<TCollection_HAsciiString> &
	:rtype: None
") SetDescription;
		void SetDescription (const opencascade::handle<TCollection_HAsciiString> & aDescription);
		%feature("compactdefaultargs") SetName;
		%feature("autodoc", "	:param aName:
	:type aName: opencascade::handle<TCollection_HAsciiString> &
	:rtype: None
") SetName;
		void SetName (const opencascade::handle<TCollection_HAsciiString> & aName);
		%feature("compactdefaultargs") SetRelatedDocument;
		%feature("autodoc", "	:param aRelated:
	:type aRelated: opencascade::handle<StepBasic_Document> &
	:rtype: None
") SetRelatedDocument;
		void SetRelatedDocument (const opencascade::handle<StepBasic_Document> & aRelated);
		%feature("compactdefaultargs") SetRelatingDocument;
		%feature("autodoc", "	:param aRelating:
	:type aRelating: opencascade::handle<StepBasic_Document> &
	:rtype: None
") SetRelatingDocument;
		void SetRelatingDocument (const opencascade::handle<StepBasic_Document> & aRelating);
		%feature("compactdefaultargs") StepBasic_DocumentRelationship;
		%feature("autodoc", "	:rtype: None
") StepBasic_DocumentRelationship;
		 StepBasic_DocumentRelationship ();
};


%make_alias(StepBasic_DocumentRelationship)

%extend StepBasic_DocumentRelationship {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepBasic_DocumentRepresentationType;
class StepBasic_DocumentRepresentationType : public Standard_Transient {
	public:
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	* Initialize all fields (own and inherited)

	:param aName:
	:type aName: opencascade::handle<TCollection_HAsciiString> &
	:param aRepresentedDocument:
	:type aRepresentedDocument: opencascade::handle<StepBasic_Document> &
	:rtype: None
") Init;
		void Init (const opencascade::handle<TCollection_HAsciiString> & aName,const opencascade::handle<StepBasic_Document> & aRepresentedDocument);
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "	* Returns field Name

	:rtype: opencascade::handle<TCollection_HAsciiString>
") Name;
		opencascade::handle<TCollection_HAsciiString> Name ();
		%feature("compactdefaultargs") RepresentedDocument;
		%feature("autodoc", "	* Returns field RepresentedDocument

	:rtype: opencascade::handle<StepBasic_Document>
") RepresentedDocument;
		opencascade::handle<StepBasic_Document> RepresentedDocument ();
		%feature("compactdefaultargs") SetName;
		%feature("autodoc", "	* Set field Name

	:param Name:
	:type Name: opencascade::handle<TCollection_HAsciiString> &
	:rtype: None
") SetName;
		void SetName (const opencascade::handle<TCollection_HAsciiString> & Name);
		%feature("compactdefaultargs") SetRepresentedDocument;
		%feature("autodoc", "	* Set field RepresentedDocument

	:param RepresentedDocument:
	:type RepresentedDocument: opencascade::handle<StepBasic_Document> &
	:rtype: None
") SetRepresentedDocument;
		void SetRepresentedDocument (const opencascade::handle<StepBasic_Document> & RepresentedDocument);
		%feature("compactdefaultargs") StepBasic_DocumentRepresentationType;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") StepBasic_DocumentRepresentationType;
		 StepBasic_DocumentRepresentationType ();
};


%make_alias(StepBasic_DocumentRepresentationType)

%extend StepBasic_DocumentRepresentationType {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepBasic_DocumentType;
class StepBasic_DocumentType : public Standard_Transient {
	public:
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param apdt:
	:type apdt: opencascade::handle<TCollection_HAsciiString> &
	:rtype: None
") Init;
		void Init (const opencascade::handle<TCollection_HAsciiString> & apdt);
		%feature("compactdefaultargs") ProductDataType;
		%feature("autodoc", "	:rtype: opencascade::handle<TCollection_HAsciiString>
") ProductDataType;
		opencascade::handle<TCollection_HAsciiString> ProductDataType ();
		%feature("compactdefaultargs") SetProductDataType;
		%feature("autodoc", "	:param apdt:
	:type apdt: opencascade::handle<TCollection_HAsciiString> &
	:rtype: None
") SetProductDataType;
		void SetProductDataType (const opencascade::handle<TCollection_HAsciiString> & apdt);
		%feature("compactdefaultargs") StepBasic_DocumentType;
		%feature("autodoc", "	:rtype: None
") StepBasic_DocumentType;
		 StepBasic_DocumentType ();
};


%make_alias(StepBasic_DocumentType)

%extend StepBasic_DocumentType {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepBasic_DocumentUsageConstraint;
class StepBasic_DocumentUsageConstraint : public Standard_Transient {
	public:
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aSource:
	:type aSource: opencascade::handle<StepBasic_Document> &
	:param ase:
	:type ase: opencascade::handle<TCollection_HAsciiString> &
	:param asev:
	:type asev: opencascade::handle<TCollection_HAsciiString> &
	:rtype: None
") Init;
		void Init (const opencascade::handle<StepBasic_Document> & aSource,const opencascade::handle<TCollection_HAsciiString> & ase,const opencascade::handle<TCollection_HAsciiString> & asev);
		%feature("compactdefaultargs") SetSource;
		%feature("autodoc", "	:param aSource:
	:type aSource: opencascade::handle<StepBasic_Document> &
	:rtype: None
") SetSource;
		void SetSource (const opencascade::handle<StepBasic_Document> & aSource);
		%feature("compactdefaultargs") SetSubjectElement;
		%feature("autodoc", "	:param ase:
	:type ase: opencascade::handle<TCollection_HAsciiString> &
	:rtype: None
") SetSubjectElement;
		void SetSubjectElement (const opencascade::handle<TCollection_HAsciiString> & ase);
		%feature("compactdefaultargs") SetSubjectElementValue;
		%feature("autodoc", "	:param asev:
	:type asev: opencascade::handle<TCollection_HAsciiString> &
	:rtype: None
") SetSubjectElementValue;
		void SetSubjectElementValue (const opencascade::handle<TCollection_HAsciiString> & asev);
		%feature("compactdefaultargs") Source;
		%feature("autodoc", "	:rtype: opencascade::handle<StepBasic_Document>
") Source;
		opencascade::handle<StepBasic_Document> Source ();
		%feature("compactdefaultargs") StepBasic_DocumentUsageConstraint;
		%feature("autodoc", "	:rtype: None
") StepBasic_DocumentUsageConstraint;
		 StepBasic_DocumentUsageConstraint ();
		%feature("compactdefaultargs") SubjectElement;
		%feature("autodoc", "	:rtype: opencascade::handle<TCollection_HAsciiString>
") SubjectElement;
		opencascade::handle<TCollection_HAsciiString> SubjectElement ();
		%feature("compactdefaultargs") SubjectElementValue;
		%feature("autodoc", "	:rtype: opencascade::handle<TCollection_HAsciiString>
") SubjectElementValue;
		opencascade::handle<TCollection_HAsciiString> SubjectElementValue ();
};


%make_alias(StepBasic_DocumentUsageConstraint)

%extend StepBasic_DocumentUsageConstraint {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepBasic_Effectivity;
class StepBasic_Effectivity : public Standard_Transient {
	public:
		%feature("compactdefaultargs") Id;
		%feature("autodoc", "	:rtype: opencascade::handle<TCollection_HAsciiString>
") Id;
		opencascade::handle<TCollection_HAsciiString> Id ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aid:
	:type aid: opencascade::handle<TCollection_HAsciiString> &
	:rtype: None
") Init;
		void Init (const opencascade::handle<TCollection_HAsciiString> & aid);
		%feature("compactdefaultargs") SetId;
		%feature("autodoc", "	:param aid:
	:type aid: opencascade::handle<TCollection_HAsciiString> &
	:rtype: None
") SetId;
		void SetId (const opencascade::handle<TCollection_HAsciiString> & aid);
		%feature("compactdefaultargs") StepBasic_Effectivity;
		%feature("autodoc", "	:rtype: None
") StepBasic_Effectivity;
		 StepBasic_Effectivity ();
};


%make_alias(StepBasic_Effectivity)

%extend StepBasic_Effectivity {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepBasic_EffectivityAssignment;
class StepBasic_EffectivityAssignment : public Standard_Transient {
	public:
		%feature("compactdefaultargs") AssignedEffectivity;
		%feature("autodoc", "	* Returns field AssignedEffectivity

	:rtype: opencascade::handle<StepBasic_Effectivity>
") AssignedEffectivity;
		opencascade::handle<StepBasic_Effectivity> AssignedEffectivity ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	* Initialize all fields (own and inherited)

	:param aAssignedEffectivity:
	:type aAssignedEffectivity: opencascade::handle<StepBasic_Effectivity> &
	:rtype: None
") Init;
		void Init (const opencascade::handle<StepBasic_Effectivity> & aAssignedEffectivity);
		%feature("compactdefaultargs") SetAssignedEffectivity;
		%feature("autodoc", "	* Set field AssignedEffectivity

	:param AssignedEffectivity:
	:type AssignedEffectivity: opencascade::handle<StepBasic_Effectivity> &
	:rtype: None
") SetAssignedEffectivity;
		void SetAssignedEffectivity (const opencascade::handle<StepBasic_Effectivity> & AssignedEffectivity);
		%feature("compactdefaultargs") StepBasic_EffectivityAssignment;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") StepBasic_EffectivityAssignment;
		 StepBasic_EffectivityAssignment ();
};


%make_alias(StepBasic_EffectivityAssignment)

%extend StepBasic_EffectivityAssignment {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepBasic_EulerAngles;
class StepBasic_EulerAngles : public Standard_Transient {
	public:
		%feature("compactdefaultargs") Angles;
		%feature("autodoc", "	* Returns field Angles

	:rtype: opencascade::handle<TColStd_HArray1OfReal>
") Angles;
		opencascade::handle<TColStd_HArray1OfReal> Angles ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	* Initialize all fields (own and inherited)

	:param aAngles:
	:type aAngles: opencascade::handle<TColStd_HArray1OfReal> &
	:rtype: None
") Init;
		void Init (const opencascade::handle<TColStd_HArray1OfReal> & aAngles);
		%feature("compactdefaultargs") SetAngles;
		%feature("autodoc", "	* Set field Angles

	:param Angles:
	:type Angles: opencascade::handle<TColStd_HArray1OfReal> &
	:rtype: None
") SetAngles;
		void SetAngles (const opencascade::handle<TColStd_HArray1OfReal> & Angles);
		%feature("compactdefaultargs") StepBasic_EulerAngles;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") StepBasic_EulerAngles;
		 StepBasic_EulerAngles ();
};


%make_alias(StepBasic_EulerAngles)

%extend StepBasic_EulerAngles {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepBasic_ExternalSource;
class StepBasic_ExternalSource : public Standard_Transient {
	public:
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	* Initialize all fields (own and inherited)

	:param aSourceId:
	:type aSourceId: StepBasic_SourceItem &
	:rtype: None
") Init;
		void Init (const StepBasic_SourceItem & aSourceId);
		%feature("compactdefaultargs") SetSourceId;
		%feature("autodoc", "	* Set field SourceId

	:param SourceId:
	:type SourceId: StepBasic_SourceItem &
	:rtype: None
") SetSourceId;
		void SetSourceId (const StepBasic_SourceItem & SourceId);
		%feature("compactdefaultargs") SourceId;
		%feature("autodoc", "	* Returns field SourceId

	:rtype: StepBasic_SourceItem
") SourceId;
		StepBasic_SourceItem SourceId ();
		%feature("compactdefaultargs") StepBasic_ExternalSource;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") StepBasic_ExternalSource;
		 StepBasic_ExternalSource ();
};


%make_alias(StepBasic_ExternalSource)

%extend StepBasic_ExternalSource {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepBasic_ExternallyDefinedItem;
class StepBasic_ExternallyDefinedItem : public Standard_Transient {
	public:
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	* Initialize all fields (own and inherited)

	:param aItemId:
	:type aItemId: StepBasic_SourceItem &
	:param aSource:
	:type aSource: opencascade::handle<StepBasic_ExternalSource> &
	:rtype: None
") Init;
		void Init (const StepBasic_SourceItem & aItemId,const opencascade::handle<StepBasic_ExternalSource> & aSource);
		%feature("compactdefaultargs") ItemId;
		%feature("autodoc", "	* Returns field ItemId

	:rtype: StepBasic_SourceItem
") ItemId;
		StepBasic_SourceItem ItemId ();
		%feature("compactdefaultargs") SetItemId;
		%feature("autodoc", "	* Set field ItemId

	:param ItemId:
	:type ItemId: StepBasic_SourceItem &
	:rtype: None
") SetItemId;
		void SetItemId (const StepBasic_SourceItem & ItemId);
		%feature("compactdefaultargs") SetSource;
		%feature("autodoc", "	* Set field Source

	:param Source:
	:type Source: opencascade::handle<StepBasic_ExternalSource> &
	:rtype: None
") SetSource;
		void SetSource (const opencascade::handle<StepBasic_ExternalSource> & Source);
		%feature("compactdefaultargs") Source;
		%feature("autodoc", "	* Returns field Source

	:rtype: opencascade::handle<StepBasic_ExternalSource>
") Source;
		opencascade::handle<StepBasic_ExternalSource> Source ();
		%feature("compactdefaultargs") StepBasic_ExternallyDefinedItem;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") StepBasic_ExternallyDefinedItem;
		 StepBasic_ExternallyDefinedItem ();
};


%make_alias(StepBasic_ExternallyDefinedItem)

%extend StepBasic_ExternallyDefinedItem {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepBasic_GeneralProperty;
class StepBasic_GeneralProperty : public Standard_Transient {
	public:
		%feature("compactdefaultargs") Description;
		%feature("autodoc", "	* Returns field Description

	:rtype: opencascade::handle<TCollection_HAsciiString>
") Description;
		opencascade::handle<TCollection_HAsciiString> Description ();
		%feature("compactdefaultargs") HasDescription;
		%feature("autodoc", "	* Returns True if optional field Description is defined

	:rtype: bool
") HasDescription;
		Standard_Boolean HasDescription ();
		%feature("compactdefaultargs") Id;
		%feature("autodoc", "	* Returns field Id

	:rtype: opencascade::handle<TCollection_HAsciiString>
") Id;
		opencascade::handle<TCollection_HAsciiString> Id ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	* Initialize all fields (own and inherited)

	:param aId:
	:type aId: opencascade::handle<TCollection_HAsciiString> &
	:param aName:
	:type aName: opencascade::handle<TCollection_HAsciiString> &
	:param hasDescription:
	:type hasDescription: bool
	:param aDescription:
	:type aDescription: opencascade::handle<TCollection_HAsciiString> &
	:rtype: None
") Init;
		void Init (const opencascade::handle<TCollection_HAsciiString> & aId,const opencascade::handle<TCollection_HAsciiString> & aName,const Standard_Boolean hasDescription,const opencascade::handle<TCollection_HAsciiString> & aDescription);
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "	* Returns field Name

	:rtype: opencascade::handle<TCollection_HAsciiString>
") Name;
		opencascade::handle<TCollection_HAsciiString> Name ();
		%feature("compactdefaultargs") SetDescription;
		%feature("autodoc", "	* Set field Description

	:param Description:
	:type Description: opencascade::handle<TCollection_HAsciiString> &
	:rtype: None
") SetDescription;
		void SetDescription (const opencascade::handle<TCollection_HAsciiString> & Description);
		%feature("compactdefaultargs") SetId;
		%feature("autodoc", "	* Set field Id

	:param Id:
	:type Id: opencascade::handle<TCollection_HAsciiString> &
	:rtype: None
") SetId;
		void SetId (const opencascade::handle<TCollection_HAsciiString> & Id);
		%feature("compactdefaultargs") SetName;
		%feature("autodoc", "	* Set field Name

	:param Name:
	:type Name: opencascade::handle<TCollection_HAsciiString> &
	:rtype: None
") SetName;
		void SetName (const opencascade::handle<TCollection_HAsciiString> & Name);
		%feature("compactdefaultargs") StepBasic_GeneralProperty;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") StepBasic_GeneralProperty;
		 StepBasic_GeneralProperty ();
};


%make_alias(StepBasic_GeneralProperty)

%extend StepBasic_GeneralProperty {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepBasic_Group;
class StepBasic_Group : public Standard_Transient {
	public:
		%feature("compactdefaultargs") Description;
		%feature("autodoc", "	* Returns field Description

	:rtype: opencascade::handle<TCollection_HAsciiString>
") Description;
		opencascade::handle<TCollection_HAsciiString> Description ();
		%feature("compactdefaultargs") HasDescription;
		%feature("autodoc", "	* Returns True if optional field Description is defined

	:rtype: bool
") HasDescription;
		Standard_Boolean HasDescription ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	* Initialize all fields (own and inherited)

	:param aName:
	:type aName: opencascade::handle<TCollection_HAsciiString> &
	:param hasDescription:
	:type hasDescription: bool
	:param aDescription:
	:type aDescription: opencascade::handle<TCollection_HAsciiString> &
	:rtype: None
") Init;
		void Init (const opencascade::handle<TCollection_HAsciiString> & aName,const Standard_Boolean hasDescription,const opencascade::handle<TCollection_HAsciiString> & aDescription);
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "	* Returns field Name

	:rtype: opencascade::handle<TCollection_HAsciiString>
") Name;
		opencascade::handle<TCollection_HAsciiString> Name ();
		%feature("compactdefaultargs") SetDescription;
		%feature("autodoc", "	* Set field Description

	:param Description:
	:type Description: opencascade::handle<TCollection_HAsciiString> &
	:rtype: None
") SetDescription;
		void SetDescription (const opencascade::handle<TCollection_HAsciiString> & Description);
		%feature("compactdefaultargs") SetName;
		%feature("autodoc", "	* Set field Name

	:param Name:
	:type Name: opencascade::handle<TCollection_HAsciiString> &
	:rtype: None
") SetName;
		void SetName (const opencascade::handle<TCollection_HAsciiString> & Name);
		%feature("compactdefaultargs") StepBasic_Group;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") StepBasic_Group;
		 StepBasic_Group ();
};


%make_alias(StepBasic_Group)

%extend StepBasic_Group {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepBasic_GroupAssignment;
class StepBasic_GroupAssignment : public Standard_Transient {
	public:
		%feature("compactdefaultargs") AssignedGroup;
		%feature("autodoc", "	* Returns field AssignedGroup

	:rtype: opencascade::handle<StepBasic_Group>
") AssignedGroup;
		opencascade::handle<StepBasic_Group> AssignedGroup ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	* Initialize all fields (own and inherited)

	:param aAssignedGroup:
	:type aAssignedGroup: opencascade::handle<StepBasic_Group> &
	:rtype: None
") Init;
		void Init (const opencascade::handle<StepBasic_Group> & aAssignedGroup);
		%feature("compactdefaultargs") SetAssignedGroup;
		%feature("autodoc", "	* Set field AssignedGroup

	:param AssignedGroup:
	:type AssignedGroup: opencascade::handle<StepBasic_Group> &
	:rtype: None
") SetAssignedGroup;
		void SetAssignedGroup (const opencascade::handle<StepBasic_Group> & AssignedGroup);
		%feature("compactdefaultargs") StepBasic_GroupAssignment;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") StepBasic_GroupAssignment;
		 StepBasic_GroupAssignment ();
};


%make_alias(StepBasic_GroupAssignment)

%extend StepBasic_GroupAssignment {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepBasic_GroupRelationship;
class StepBasic_GroupRelationship : public Standard_Transient {
	public:
		%feature("compactdefaultargs") Description;
		%feature("autodoc", "	* Returns field Description

	:rtype: opencascade::handle<TCollection_HAsciiString>
") Description;
		opencascade::handle<TCollection_HAsciiString> Description ();
		%feature("compactdefaultargs") HasDescription;
		%feature("autodoc", "	* Returns True if optional field Description is defined

	:rtype: bool
") HasDescription;
		Standard_Boolean HasDescription ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	* Initialize all fields (own and inherited)

	:param aName:
	:type aName: opencascade::handle<TCollection_HAsciiString> &
	:param hasDescription:
	:type hasDescription: bool
	:param aDescription:
	:type aDescription: opencascade::handle<TCollection_HAsciiString> &
	:param aRelatingGroup:
	:type aRelatingGroup: opencascade::handle<StepBasic_Group> &
	:param aRelatedGroup:
	:type aRelatedGroup: opencascade::handle<StepBasic_Group> &
	:rtype: None
") Init;
		void Init (const opencascade::handle<TCollection_HAsciiString> & aName,const Standard_Boolean hasDescription,const opencascade::handle<TCollection_HAsciiString> & aDescription,const opencascade::handle<StepBasic_Group> & aRelatingGroup,const opencascade::handle<StepBasic_Group> & aRelatedGroup);
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "	* Returns field Name

	:rtype: opencascade::handle<TCollection_HAsciiString>
") Name;
		opencascade::handle<TCollection_HAsciiString> Name ();
		%feature("compactdefaultargs") RelatedGroup;
		%feature("autodoc", "	* Returns field RelatedGroup

	:rtype: opencascade::handle<StepBasic_Group>
") RelatedGroup;
		opencascade::handle<StepBasic_Group> RelatedGroup ();
		%feature("compactdefaultargs") RelatingGroup;
		%feature("autodoc", "	* Returns field RelatingGroup

	:rtype: opencascade::handle<StepBasic_Group>
") RelatingGroup;
		opencascade::handle<StepBasic_Group> RelatingGroup ();
		%feature("compactdefaultargs") SetDescription;
		%feature("autodoc", "	* Set field Description

	:param Description:
	:type Description: opencascade::handle<TCollection_HAsciiString> &
	:rtype: None
") SetDescription;
		void SetDescription (const opencascade::handle<TCollection_HAsciiString> & Description);
		%feature("compactdefaultargs") SetName;
		%feature("autodoc", "	* Set field Name

	:param Name:
	:type Name: opencascade::handle<TCollection_HAsciiString> &
	:rtype: None
") SetName;
		void SetName (const opencascade::handle<TCollection_HAsciiString> & Name);
		%feature("compactdefaultargs") SetRelatedGroup;
		%feature("autodoc", "	* Set field RelatedGroup

	:param RelatedGroup:
	:type RelatedGroup: opencascade::handle<StepBasic_Group> &
	:rtype: None
") SetRelatedGroup;
		void SetRelatedGroup (const opencascade::handle<StepBasic_Group> & RelatedGroup);
		%feature("compactdefaultargs") SetRelatingGroup;
		%feature("autodoc", "	* Set field RelatingGroup

	:param RelatingGroup:
	:type RelatingGroup: opencascade::handle<StepBasic_Group> &
	:rtype: None
") SetRelatingGroup;
		void SetRelatingGroup (const opencascade::handle<StepBasic_Group> & RelatingGroup);
		%feature("compactdefaultargs") StepBasic_GroupRelationship;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") StepBasic_GroupRelationship;
		 StepBasic_GroupRelationship ();
};


%make_alias(StepBasic_GroupRelationship)

%extend StepBasic_GroupRelationship {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepBasic_IdentificationAssignment;
class StepBasic_IdentificationAssignment : public Standard_Transient {
	public:
		%feature("compactdefaultargs") AssignedId;
		%feature("autodoc", "	* Returns field AssignedId

	:rtype: opencascade::handle<TCollection_HAsciiString>
") AssignedId;
		opencascade::handle<TCollection_HAsciiString> AssignedId ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	* Initialize all fields (own and inherited)

	:param aAssignedId:
	:type aAssignedId: opencascade::handle<TCollection_HAsciiString> &
	:param aRole:
	:type aRole: opencascade::handle<StepBasic_IdentificationRole> &
	:rtype: None
") Init;
		void Init (const opencascade::handle<TCollection_HAsciiString> & aAssignedId,const opencascade::handle<StepBasic_IdentificationRole> & aRole);
		%feature("compactdefaultargs") Role;
		%feature("autodoc", "	* Returns field Role

	:rtype: opencascade::handle<StepBasic_IdentificationRole>
") Role;
		opencascade::handle<StepBasic_IdentificationRole> Role ();
		%feature("compactdefaultargs") SetAssignedId;
		%feature("autodoc", "	* Set field AssignedId

	:param AssignedId:
	:type AssignedId: opencascade::handle<TCollection_HAsciiString> &
	:rtype: None
") SetAssignedId;
		void SetAssignedId (const opencascade::handle<TCollection_HAsciiString> & AssignedId);
		%feature("compactdefaultargs") SetRole;
		%feature("autodoc", "	* Set field Role

	:param Role:
	:type Role: opencascade::handle<StepBasic_IdentificationRole> &
	:rtype: None
") SetRole;
		void SetRole (const opencascade::handle<StepBasic_IdentificationRole> & Role);
		%feature("compactdefaultargs") StepBasic_IdentificationAssignment;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") StepBasic_IdentificationAssignment;
		 StepBasic_IdentificationAssignment ();
};


%make_alias(StepBasic_IdentificationAssignment)

%extend StepBasic_IdentificationAssignment {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepBasic_IdentificationRole;
class StepBasic_IdentificationRole : public Standard_Transient {
	public:
		%feature("compactdefaultargs") Description;
		%feature("autodoc", "	* Returns field Description

	:rtype: opencascade::handle<TCollection_HAsciiString>
") Description;
		opencascade::handle<TCollection_HAsciiString> Description ();
		%feature("compactdefaultargs") HasDescription;
		%feature("autodoc", "	* Returns True if optional field Description is defined

	:rtype: bool
") HasDescription;
		Standard_Boolean HasDescription ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	* Initialize all fields (own and inherited)

	:param aName:
	:type aName: opencascade::handle<TCollection_HAsciiString> &
	:param hasDescription:
	:type hasDescription: bool
	:param aDescription:
	:type aDescription: opencascade::handle<TCollection_HAsciiString> &
	:rtype: None
") Init;
		void Init (const opencascade::handle<TCollection_HAsciiString> & aName,const Standard_Boolean hasDescription,const opencascade::handle<TCollection_HAsciiString> & aDescription);
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "	* Returns field Name

	:rtype: opencascade::handle<TCollection_HAsciiString>
") Name;
		opencascade::handle<TCollection_HAsciiString> Name ();
		%feature("compactdefaultargs") SetDescription;
		%feature("autodoc", "	* Set field Description

	:param Description:
	:type Description: opencascade::handle<TCollection_HAsciiString> &
	:rtype: None
") SetDescription;
		void SetDescription (const opencascade::handle<TCollection_HAsciiString> & Description);
		%feature("compactdefaultargs") SetName;
		%feature("autodoc", "	* Set field Name

	:param Name:
	:type Name: opencascade::handle<TCollection_HAsciiString> &
	:rtype: None
") SetName;
		void SetName (const opencascade::handle<TCollection_HAsciiString> & Name);
		%feature("compactdefaultargs") StepBasic_IdentificationRole;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") StepBasic_IdentificationRole;
		 StepBasic_IdentificationRole ();
};


%make_alias(StepBasic_IdentificationRole)

%extend StepBasic_IdentificationRole {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepBasic_LocalTime;
class StepBasic_LocalTime : public Standard_Transient {
	public:
		%feature("compactdefaultargs") HasMinuteComponent;
		%feature("autodoc", "	:rtype: bool
") HasMinuteComponent;
		Standard_Boolean HasMinuteComponent ();
		%feature("compactdefaultargs") HasSecondComponent;
		%feature("autodoc", "	:rtype: bool
") HasSecondComponent;
		Standard_Boolean HasSecondComponent ();
		%feature("compactdefaultargs") HourComponent;
		%feature("autodoc", "	:rtype: int
") HourComponent;
		Standard_Integer HourComponent ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aHourComponent:
	:type aHourComponent: int
	:param hasAminuteComponent:
	:type hasAminuteComponent: bool
	:param aMinuteComponent:
	:type aMinuteComponent: int
	:param hasAsecondComponent:
	:type hasAsecondComponent: bool
	:param aSecondComponent:
	:type aSecondComponent: float
	:param aZone:
	:type aZone: opencascade::handle<StepBasic_CoordinatedUniversalTimeOffset> &
	:rtype: None
") Init;
		void Init (const Standard_Integer aHourComponent,const Standard_Boolean hasAminuteComponent,const Standard_Integer aMinuteComponent,const Standard_Boolean hasAsecondComponent,const Standard_Real aSecondComponent,const opencascade::handle<StepBasic_CoordinatedUniversalTimeOffset> & aZone);
		%feature("compactdefaultargs") MinuteComponent;
		%feature("autodoc", "	:rtype: int
") MinuteComponent;
		Standard_Integer MinuteComponent ();
		%feature("compactdefaultargs") SecondComponent;
		%feature("autodoc", "	:rtype: float
") SecondComponent;
		Standard_Real SecondComponent ();
		%feature("compactdefaultargs") SetHourComponent;
		%feature("autodoc", "	:param aHourComponent:
	:type aHourComponent: int
	:rtype: None
") SetHourComponent;
		void SetHourComponent (const Standard_Integer aHourComponent);
		%feature("compactdefaultargs") SetMinuteComponent;
		%feature("autodoc", "	:param aMinuteComponent:
	:type aMinuteComponent: int
	:rtype: None
") SetMinuteComponent;
		void SetMinuteComponent (const Standard_Integer aMinuteComponent);
		%feature("compactdefaultargs") SetSecondComponent;
		%feature("autodoc", "	:param aSecondComponent:
	:type aSecondComponent: float
	:rtype: None
") SetSecondComponent;
		void SetSecondComponent (const Standard_Real aSecondComponent);
		%feature("compactdefaultargs") SetZone;
		%feature("autodoc", "	:param aZone:
	:type aZone: opencascade::handle<StepBasic_CoordinatedUniversalTimeOffset> &
	:rtype: None
") SetZone;
		void SetZone (const opencascade::handle<StepBasic_CoordinatedUniversalTimeOffset> & aZone);
		%feature("compactdefaultargs") StepBasic_LocalTime;
		%feature("autodoc", "	* Returns a LocalTime

	:rtype: None
") StepBasic_LocalTime;
		 StepBasic_LocalTime ();
		%feature("compactdefaultargs") UnSetMinuteComponent;
		%feature("autodoc", "	:rtype: None
") UnSetMinuteComponent;
		void UnSetMinuteComponent ();
		%feature("compactdefaultargs") UnSetSecondComponent;
		%feature("autodoc", "	:rtype: None
") UnSetSecondComponent;
		void UnSetSecondComponent ();
		%feature("compactdefaultargs") Zone;
		%feature("autodoc", "	:rtype: opencascade::handle<StepBasic_CoordinatedUniversalTimeOffset>
") Zone;
		opencascade::handle<StepBasic_CoordinatedUniversalTimeOffset> Zone ();
};


%make_alias(StepBasic_LocalTime)

%extend StepBasic_LocalTime {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepBasic_MeasureValueMember;
class StepBasic_MeasureValueMember : public StepData_SelectReal {
	public:
		%feature("compactdefaultargs") HasName;
		%feature("autodoc", "	:rtype: bool
") HasName;
		virtual Standard_Boolean HasName ();
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "	:rtype: char *
") Name;
		virtual const char * Name ();
		%feature("compactdefaultargs") SetName;
		%feature("autodoc", "	:param name:
	:type name: char *
	:rtype: bool
") SetName;
		virtual Standard_Boolean SetName (const char * name);
		%feature("compactdefaultargs") StepBasic_MeasureValueMember;
		%feature("autodoc", "	:rtype: None
") StepBasic_MeasureValueMember;
		 StepBasic_MeasureValueMember ();
};


%make_alias(StepBasic_MeasureValueMember)

%extend StepBasic_MeasureValueMember {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepBasic_MeasureWithUnit;
class StepBasic_MeasureWithUnit : public Standard_Transient {
	public:
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aValueComponent:
	:type aValueComponent: opencascade::handle<StepBasic_MeasureValueMember> &
	:param aUnitComponent:
	:type aUnitComponent: StepBasic_Unit &
	:rtype: None
") Init;
		void Init (const opencascade::handle<StepBasic_MeasureValueMember> & aValueComponent,const StepBasic_Unit & aUnitComponent);
		%feature("compactdefaultargs") SetUnitComponent;
		%feature("autodoc", "	:param aUnitComponent:
	:type aUnitComponent: StepBasic_Unit &
	:rtype: None
") SetUnitComponent;
		void SetUnitComponent (const StepBasic_Unit & aUnitComponent);
		%feature("compactdefaultargs") SetValueComponent;
		%feature("autodoc", "	:param aValueComponent:
	:type aValueComponent: float
	:rtype: None
") SetValueComponent;
		void SetValueComponent (const Standard_Real aValueComponent);
		%feature("compactdefaultargs") SetValueComponentMember;
		%feature("autodoc", "	:param val:
	:type val: opencascade::handle<StepBasic_MeasureValueMember> &
	:rtype: None
") SetValueComponentMember;
		void SetValueComponentMember (const opencascade::handle<StepBasic_MeasureValueMember> & val);
		%feature("compactdefaultargs") StepBasic_MeasureWithUnit;
		%feature("autodoc", "	* Returns a MeasureWithUnit

	:rtype: None
") StepBasic_MeasureWithUnit;
		 StepBasic_MeasureWithUnit ();
		%feature("compactdefaultargs") UnitComponent;
		%feature("autodoc", "	:rtype: StepBasic_Unit
") UnitComponent;
		StepBasic_Unit UnitComponent ();
		%feature("compactdefaultargs") ValueComponent;
		%feature("autodoc", "	:rtype: float
") ValueComponent;
		Standard_Real ValueComponent ();
		%feature("compactdefaultargs") ValueComponentMember;
		%feature("autodoc", "	:rtype: opencascade::handle<StepBasic_MeasureValueMember>
") ValueComponentMember;
		opencascade::handle<StepBasic_MeasureValueMember> ValueComponentMember ();
};


%make_alias(StepBasic_MeasureWithUnit)

%extend StepBasic_MeasureWithUnit {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepBasic_NameAssignment;
class StepBasic_NameAssignment : public Standard_Transient {
	public:
		%feature("compactdefaultargs") AssignedName;
		%feature("autodoc", "	* Returns field AssignedName

	:rtype: opencascade::handle<TCollection_HAsciiString>
") AssignedName;
		opencascade::handle<TCollection_HAsciiString> AssignedName ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	* Initialize all fields (own and inherited)

	:param aAssignedName:
	:type aAssignedName: opencascade::handle<TCollection_HAsciiString> &
	:rtype: None
") Init;
		void Init (const opencascade::handle<TCollection_HAsciiString> & aAssignedName);
		%feature("compactdefaultargs") SetAssignedName;
		%feature("autodoc", "	* Set field AssignedName

	:param AssignedName:
	:type AssignedName: opencascade::handle<TCollection_HAsciiString> &
	:rtype: None
") SetAssignedName;
		void SetAssignedName (const opencascade::handle<TCollection_HAsciiString> & AssignedName);
		%feature("compactdefaultargs") StepBasic_NameAssignment;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") StepBasic_NameAssignment;
		 StepBasic_NameAssignment ();
};


%make_alias(StepBasic_NameAssignment)

%extend StepBasic_NameAssignment {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepBasic_NamedUnit;
class StepBasic_NamedUnit : public Standard_Transient {
	public:
		%feature("compactdefaultargs") Dimensions;
		%feature("autodoc", "	:rtype: opencascade::handle<StepBasic_DimensionalExponents>
") Dimensions;
		virtual opencascade::handle<StepBasic_DimensionalExponents> Dimensions ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aDimensions:
	:type aDimensions: opencascade::handle<StepBasic_DimensionalExponents> &
	:rtype: None
") Init;
		void Init (const opencascade::handle<StepBasic_DimensionalExponents> & aDimensions);
		%feature("compactdefaultargs") SetDimensions;
		%feature("autodoc", "	:param aDimensions:
	:type aDimensions: opencascade::handle<StepBasic_DimensionalExponents> &
	:rtype: void
") SetDimensions;
		virtual void SetDimensions (const opencascade::handle<StepBasic_DimensionalExponents> & aDimensions);
		%feature("compactdefaultargs") StepBasic_NamedUnit;
		%feature("autodoc", "	* Returns a NamedUnit

	:rtype: None
") StepBasic_NamedUnit;
		 StepBasic_NamedUnit ();
};


%make_alias(StepBasic_NamedUnit)

%extend StepBasic_NamedUnit {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepBasic_ObjectRole;
class StepBasic_ObjectRole : public Standard_Transient {
	public:
		%feature("compactdefaultargs") Description;
		%feature("autodoc", "	* Returns field Description

	:rtype: opencascade::handle<TCollection_HAsciiString>
") Description;
		opencascade::handle<TCollection_HAsciiString> Description ();
		%feature("compactdefaultargs") HasDescription;
		%feature("autodoc", "	* Returns True if optional field Description is defined

	:rtype: bool
") HasDescription;
		Standard_Boolean HasDescription ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	* Initialize all fields (own and inherited)

	:param aName:
	:type aName: opencascade::handle<TCollection_HAsciiString> &
	:param hasDescription:
	:type hasDescription: bool
	:param aDescription:
	:type aDescription: opencascade::handle<TCollection_HAsciiString> &
	:rtype: None
") Init;
		void Init (const opencascade::handle<TCollection_HAsciiString> & aName,const Standard_Boolean hasDescription,const opencascade::handle<TCollection_HAsciiString> & aDescription);
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "	* Returns field Name

	:rtype: opencascade::handle<TCollection_HAsciiString>
") Name;
		opencascade::handle<TCollection_HAsciiString> Name ();
		%feature("compactdefaultargs") SetDescription;
		%feature("autodoc", "	* Set field Description

	:param Description:
	:type Description: opencascade::handle<TCollection_HAsciiString> &
	:rtype: None
") SetDescription;
		void SetDescription (const opencascade::handle<TCollection_HAsciiString> & Description);
		%feature("compactdefaultargs") SetName;
		%feature("autodoc", "	* Set field Name

	:param Name:
	:type Name: opencascade::handle<TCollection_HAsciiString> &
	:rtype: None
") SetName;
		void SetName (const opencascade::handle<TCollection_HAsciiString> & Name);
		%feature("compactdefaultargs") StepBasic_ObjectRole;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") StepBasic_ObjectRole;
		 StepBasic_ObjectRole ();
};


%make_alias(StepBasic_ObjectRole)

%extend StepBasic_ObjectRole {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepBasic_Organization;
class StepBasic_Organization : public Standard_Transient {
	public:
		%feature("compactdefaultargs") Description;
		%feature("autodoc", "	:rtype: opencascade::handle<TCollection_HAsciiString>
") Description;
		opencascade::handle<TCollection_HAsciiString> Description ();
		%feature("compactdefaultargs") HasId;
		%feature("autodoc", "	:rtype: bool
") HasId;
		Standard_Boolean HasId ();
		%feature("compactdefaultargs") Id;
		%feature("autodoc", "	:rtype: opencascade::handle<TCollection_HAsciiString>
") Id;
		opencascade::handle<TCollection_HAsciiString> Id ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param hasAid:
	:type hasAid: bool
	:param aId:
	:type aId: opencascade::handle<TCollection_HAsciiString> &
	:param aName:
	:type aName: opencascade::handle<TCollection_HAsciiString> &
	:param aDescription:
	:type aDescription: opencascade::handle<TCollection_HAsciiString> &
	:rtype: None
") Init;
		void Init (const Standard_Boolean hasAid,const opencascade::handle<TCollection_HAsciiString> & aId,const opencascade::handle<TCollection_HAsciiString> & aName,const opencascade::handle<TCollection_HAsciiString> & aDescription);
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "	:rtype: opencascade::handle<TCollection_HAsciiString>
") Name;
		opencascade::handle<TCollection_HAsciiString> Name ();
		%feature("compactdefaultargs") SetDescription;
		%feature("autodoc", "	:param aDescription:
	:type aDescription: opencascade::handle<TCollection_HAsciiString> &
	:rtype: None
") SetDescription;
		void SetDescription (const opencascade::handle<TCollection_HAsciiString> & aDescription);
		%feature("compactdefaultargs") SetId;
		%feature("autodoc", "	:param aId:
	:type aId: opencascade::handle<TCollection_HAsciiString> &
	:rtype: None
") SetId;
		void SetId (const opencascade::handle<TCollection_HAsciiString> & aId);
		%feature("compactdefaultargs") SetName;
		%feature("autodoc", "	:param aName:
	:type aName: opencascade::handle<TCollection_HAsciiString> &
	:rtype: None
") SetName;
		void SetName (const opencascade::handle<TCollection_HAsciiString> & aName);
		%feature("compactdefaultargs") StepBasic_Organization;
		%feature("autodoc", "	* Returns a Organization

	:rtype: None
") StepBasic_Organization;
		 StepBasic_Organization ();
		%feature("compactdefaultargs") UnSetId;
		%feature("autodoc", "	:rtype: None
") UnSetId;
		void UnSetId ();
};


%make_alias(StepBasic_Organization)

%extend StepBasic_Organization {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepBasic_OrganizationAssignment;
class StepBasic_OrganizationAssignment : public Standard_Transient {
	public:
		%feature("compactdefaultargs") AssignedOrganization;
		%feature("autodoc", "	:rtype: opencascade::handle<StepBasic_Organization>
") AssignedOrganization;
		opencascade::handle<StepBasic_Organization> AssignedOrganization ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aAssignedOrganization:
	:type aAssignedOrganization: opencascade::handle<StepBasic_Organization> &
	:param aRole:
	:type aRole: opencascade::handle<StepBasic_OrganizationRole> &
	:rtype: None
") Init;
		void Init (const opencascade::handle<StepBasic_Organization> & aAssignedOrganization,const opencascade::handle<StepBasic_OrganizationRole> & aRole);
		%feature("compactdefaultargs") Role;
		%feature("autodoc", "	:rtype: opencascade::handle<StepBasic_OrganizationRole>
") Role;
		opencascade::handle<StepBasic_OrganizationRole> Role ();
		%feature("compactdefaultargs") SetAssignedOrganization;
		%feature("autodoc", "	:param aAssignedOrganization:
	:type aAssignedOrganization: opencascade::handle<StepBasic_Organization> &
	:rtype: None
") SetAssignedOrganization;
		void SetAssignedOrganization (const opencascade::handle<StepBasic_Organization> & aAssignedOrganization);
		%feature("compactdefaultargs") SetRole;
		%feature("autodoc", "	:param aRole:
	:type aRole: opencascade::handle<StepBasic_OrganizationRole> &
	:rtype: None
") SetRole;
		void SetRole (const opencascade::handle<StepBasic_OrganizationRole> & aRole);
};


%make_alias(StepBasic_OrganizationAssignment)

%extend StepBasic_OrganizationAssignment {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepBasic_OrganizationRole;
class StepBasic_OrganizationRole : public Standard_Transient {
	public:
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aName:
	:type aName: opencascade::handle<TCollection_HAsciiString> &
	:rtype: None
") Init;
		void Init (const opencascade::handle<TCollection_HAsciiString> & aName);
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "	:rtype: opencascade::handle<TCollection_HAsciiString>
") Name;
		opencascade::handle<TCollection_HAsciiString> Name ();
		%feature("compactdefaultargs") SetName;
		%feature("autodoc", "	:param aName:
	:type aName: opencascade::handle<TCollection_HAsciiString> &
	:rtype: None
") SetName;
		void SetName (const opencascade::handle<TCollection_HAsciiString> & aName);
		%feature("compactdefaultargs") StepBasic_OrganizationRole;
		%feature("autodoc", "	* Returns a OrganizationRole

	:rtype: None
") StepBasic_OrganizationRole;
		 StepBasic_OrganizationRole ();
};


%make_alias(StepBasic_OrganizationRole)

%extend StepBasic_OrganizationRole {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepBasic_Person;
class StepBasic_Person : public Standard_Transient {
	public:
		%feature("compactdefaultargs") FirstName;
		%feature("autodoc", "	:rtype: opencascade::handle<TCollection_HAsciiString>
") FirstName;
		opencascade::handle<TCollection_HAsciiString> FirstName ();
		%feature("compactdefaultargs") HasFirstName;
		%feature("autodoc", "	:rtype: bool
") HasFirstName;
		Standard_Boolean HasFirstName ();
		%feature("compactdefaultargs") HasLastName;
		%feature("autodoc", "	:rtype: bool
") HasLastName;
		Standard_Boolean HasLastName ();
		%feature("compactdefaultargs") HasMiddleNames;
		%feature("autodoc", "	:rtype: bool
") HasMiddleNames;
		Standard_Boolean HasMiddleNames ();
		%feature("compactdefaultargs") HasPrefixTitles;
		%feature("autodoc", "	:rtype: bool
") HasPrefixTitles;
		Standard_Boolean HasPrefixTitles ();
		%feature("compactdefaultargs") HasSuffixTitles;
		%feature("autodoc", "	:rtype: bool
") HasSuffixTitles;
		Standard_Boolean HasSuffixTitles ();
		%feature("compactdefaultargs") Id;
		%feature("autodoc", "	:rtype: opencascade::handle<TCollection_HAsciiString>
") Id;
		opencascade::handle<TCollection_HAsciiString> Id ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aId:
	:type aId: opencascade::handle<TCollection_HAsciiString> &
	:param hasAlastName:
	:type hasAlastName: bool
	:param aLastName:
	:type aLastName: opencascade::handle<TCollection_HAsciiString> &
	:param hasAfirstName:
	:type hasAfirstName: bool
	:param aFirstName:
	:type aFirstName: opencascade::handle<TCollection_HAsciiString> &
	:param hasAmiddleNames:
	:type hasAmiddleNames: bool
	:param aMiddleNames:
	:type aMiddleNames: opencascade::handle<Interface_HArray1OfHAsciiString> &
	:param hasAprefixTitles:
	:type hasAprefixTitles: bool
	:param aPrefixTitles:
	:type aPrefixTitles: opencascade::handle<Interface_HArray1OfHAsciiString> &
	:param hasAsuffixTitles:
	:type hasAsuffixTitles: bool
	:param aSuffixTitles:
	:type aSuffixTitles: opencascade::handle<Interface_HArray1OfHAsciiString> &
	:rtype: None
") Init;
		void Init (const opencascade::handle<TCollection_HAsciiString> & aId,const Standard_Boolean hasAlastName,const opencascade::handle<TCollection_HAsciiString> & aLastName,const Standard_Boolean hasAfirstName,const opencascade::handle<TCollection_HAsciiString> & aFirstName,const Standard_Boolean hasAmiddleNames,const opencascade::handle<Interface_HArray1OfHAsciiString> & aMiddleNames,const Standard_Boolean hasAprefixTitles,const opencascade::handle<Interface_HArray1OfHAsciiString> & aPrefixTitles,const Standard_Boolean hasAsuffixTitles,const opencascade::handle<Interface_HArray1OfHAsciiString> & aSuffixTitles);
		%feature("compactdefaultargs") LastName;
		%feature("autodoc", "	:rtype: opencascade::handle<TCollection_HAsciiString>
") LastName;
		opencascade::handle<TCollection_HAsciiString> LastName ();
		%feature("compactdefaultargs") MiddleNames;
		%feature("autodoc", "	:rtype: opencascade::handle<Interface_HArray1OfHAsciiString>
") MiddleNames;
		opencascade::handle<Interface_HArray1OfHAsciiString> MiddleNames ();
		%feature("compactdefaultargs") MiddleNamesValue;
		%feature("autodoc", "	:param num:
	:type num: int
	:rtype: opencascade::handle<TCollection_HAsciiString>
") MiddleNamesValue;
		opencascade::handle<TCollection_HAsciiString> MiddleNamesValue (const Standard_Integer num);
		%feature("compactdefaultargs") NbMiddleNames;
		%feature("autodoc", "	:rtype: int
") NbMiddleNames;
		Standard_Integer NbMiddleNames ();
		%feature("compactdefaultargs") NbPrefixTitles;
		%feature("autodoc", "	:rtype: int
") NbPrefixTitles;
		Standard_Integer NbPrefixTitles ();
		%feature("compactdefaultargs") NbSuffixTitles;
		%feature("autodoc", "	:rtype: int
") NbSuffixTitles;
		Standard_Integer NbSuffixTitles ();
		%feature("compactdefaultargs") PrefixTitles;
		%feature("autodoc", "	:rtype: opencascade::handle<Interface_HArray1OfHAsciiString>
") PrefixTitles;
		opencascade::handle<Interface_HArray1OfHAsciiString> PrefixTitles ();
		%feature("compactdefaultargs") PrefixTitlesValue;
		%feature("autodoc", "	:param num:
	:type num: int
	:rtype: opencascade::handle<TCollection_HAsciiString>
") PrefixTitlesValue;
		opencascade::handle<TCollection_HAsciiString> PrefixTitlesValue (const Standard_Integer num);
		%feature("compactdefaultargs") SetFirstName;
		%feature("autodoc", "	:param aFirstName:
	:type aFirstName: opencascade::handle<TCollection_HAsciiString> &
	:rtype: None
") SetFirstName;
		void SetFirstName (const opencascade::handle<TCollection_HAsciiString> & aFirstName);
		%feature("compactdefaultargs") SetId;
		%feature("autodoc", "	:param aId:
	:type aId: opencascade::handle<TCollection_HAsciiString> &
	:rtype: None
") SetId;
		void SetId (const opencascade::handle<TCollection_HAsciiString> & aId);
		%feature("compactdefaultargs") SetLastName;
		%feature("autodoc", "	:param aLastName:
	:type aLastName: opencascade::handle<TCollection_HAsciiString> &
	:rtype: None
") SetLastName;
		void SetLastName (const opencascade::handle<TCollection_HAsciiString> & aLastName);
		%feature("compactdefaultargs") SetMiddleNames;
		%feature("autodoc", "	:param aMiddleNames:
	:type aMiddleNames: opencascade::handle<Interface_HArray1OfHAsciiString> &
	:rtype: None
") SetMiddleNames;
		void SetMiddleNames (const opencascade::handle<Interface_HArray1OfHAsciiString> & aMiddleNames);
		%feature("compactdefaultargs") SetPrefixTitles;
		%feature("autodoc", "	:param aPrefixTitles:
	:type aPrefixTitles: opencascade::handle<Interface_HArray1OfHAsciiString> &
	:rtype: None
") SetPrefixTitles;
		void SetPrefixTitles (const opencascade::handle<Interface_HArray1OfHAsciiString> & aPrefixTitles);
		%feature("compactdefaultargs") SetSuffixTitles;
		%feature("autodoc", "	:param aSuffixTitles:
	:type aSuffixTitles: opencascade::handle<Interface_HArray1OfHAsciiString> &
	:rtype: None
") SetSuffixTitles;
		void SetSuffixTitles (const opencascade::handle<Interface_HArray1OfHAsciiString> & aSuffixTitles);
		%feature("compactdefaultargs") StepBasic_Person;
		%feature("autodoc", "	* Returns a Person

	:rtype: None
") StepBasic_Person;
		 StepBasic_Person ();
		%feature("compactdefaultargs") SuffixTitles;
		%feature("autodoc", "	:rtype: opencascade::handle<Interface_HArray1OfHAsciiString>
") SuffixTitles;
		opencascade::handle<Interface_HArray1OfHAsciiString> SuffixTitles ();
		%feature("compactdefaultargs") SuffixTitlesValue;
		%feature("autodoc", "	:param num:
	:type num: int
	:rtype: opencascade::handle<TCollection_HAsciiString>
") SuffixTitlesValue;
		opencascade::handle<TCollection_HAsciiString> SuffixTitlesValue (const Standard_Integer num);
		%feature("compactdefaultargs") UnSetFirstName;
		%feature("autodoc", "	:rtype: None
") UnSetFirstName;
		void UnSetFirstName ();
		%feature("compactdefaultargs") UnSetLastName;
		%feature("autodoc", "	:rtype: None
") UnSetLastName;
		void UnSetLastName ();
		%feature("compactdefaultargs") UnSetMiddleNames;
		%feature("autodoc", "	:rtype: None
") UnSetMiddleNames;
		void UnSetMiddleNames ();
		%feature("compactdefaultargs") UnSetPrefixTitles;
		%feature("autodoc", "	:rtype: None
") UnSetPrefixTitles;
		void UnSetPrefixTitles ();
		%feature("compactdefaultargs") UnSetSuffixTitles;
		%feature("autodoc", "	:rtype: None
") UnSetSuffixTitles;
		void UnSetSuffixTitles ();
};


%make_alias(StepBasic_Person)

%extend StepBasic_Person {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepBasic_PersonAndOrganization;
class StepBasic_PersonAndOrganization : public Standard_Transient {
	public:
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aThePerson:
	:type aThePerson: opencascade::handle<StepBasic_Person> &
	:param aTheOrganization:
	:type aTheOrganization: opencascade::handle<StepBasic_Organization> &
	:rtype: None
") Init;
		void Init (const opencascade::handle<StepBasic_Person> & aThePerson,const opencascade::handle<StepBasic_Organization> & aTheOrganization);
		%feature("compactdefaultargs") SetTheOrganization;
		%feature("autodoc", "	:param aTheOrganization:
	:type aTheOrganization: opencascade::handle<StepBasic_Organization> &
	:rtype: None
") SetTheOrganization;
		void SetTheOrganization (const opencascade::handle<StepBasic_Organization> & aTheOrganization);
		%feature("compactdefaultargs") SetThePerson;
		%feature("autodoc", "	:param aThePerson:
	:type aThePerson: opencascade::handle<StepBasic_Person> &
	:rtype: None
") SetThePerson;
		void SetThePerson (const opencascade::handle<StepBasic_Person> & aThePerson);
		%feature("compactdefaultargs") StepBasic_PersonAndOrganization;
		%feature("autodoc", "	* Returns a PersonAndOrganization

	:rtype: None
") StepBasic_PersonAndOrganization;
		 StepBasic_PersonAndOrganization ();
		%feature("compactdefaultargs") TheOrganization;
		%feature("autodoc", "	:rtype: opencascade::handle<StepBasic_Organization>
") TheOrganization;
		opencascade::handle<StepBasic_Organization> TheOrganization ();
		%feature("compactdefaultargs") ThePerson;
		%feature("autodoc", "	:rtype: opencascade::handle<StepBasic_Person>
") ThePerson;
		opencascade::handle<StepBasic_Person> ThePerson ();
};


%make_alias(StepBasic_PersonAndOrganization)

%extend StepBasic_PersonAndOrganization {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepBasic_PersonAndOrganizationAssignment;
class StepBasic_PersonAndOrganizationAssignment : public Standard_Transient {
	public:
		%feature("compactdefaultargs") AssignedPersonAndOrganization;
		%feature("autodoc", "	:rtype: opencascade::handle<StepBasic_PersonAndOrganization>
") AssignedPersonAndOrganization;
		opencascade::handle<StepBasic_PersonAndOrganization> AssignedPersonAndOrganization ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aAssignedPersonAndOrganization:
	:type aAssignedPersonAndOrganization: opencascade::handle<StepBasic_PersonAndOrganization> &
	:param aRole:
	:type aRole: opencascade::handle<StepBasic_PersonAndOrganizationRole> &
	:rtype: None
") Init;
		void Init (const opencascade::handle<StepBasic_PersonAndOrganization> & aAssignedPersonAndOrganization,const opencascade::handle<StepBasic_PersonAndOrganizationRole> & aRole);
		%feature("compactdefaultargs") Role;
		%feature("autodoc", "	:rtype: opencascade::handle<StepBasic_PersonAndOrganizationRole>
") Role;
		opencascade::handle<StepBasic_PersonAndOrganizationRole> Role ();
		%feature("compactdefaultargs") SetAssignedPersonAndOrganization;
		%feature("autodoc", "	:param aAssignedPersonAndOrganization:
	:type aAssignedPersonAndOrganization: opencascade::handle<StepBasic_PersonAndOrganization> &
	:rtype: None
") SetAssignedPersonAndOrganization;
		void SetAssignedPersonAndOrganization (const opencascade::handle<StepBasic_PersonAndOrganization> & aAssignedPersonAndOrganization);
		%feature("compactdefaultargs") SetRole;
		%feature("autodoc", "	:param aRole:
	:type aRole: opencascade::handle<StepBasic_PersonAndOrganizationRole> &
	:rtype: None
") SetRole;
		void SetRole (const opencascade::handle<StepBasic_PersonAndOrganizationRole> & aRole);
};


%make_alias(StepBasic_PersonAndOrganizationAssignment)

%extend StepBasic_PersonAndOrganizationAssignment {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepBasic_PersonAndOrganizationRole;
class StepBasic_PersonAndOrganizationRole : public Standard_Transient {
	public:
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aName:
	:type aName: opencascade::handle<TCollection_HAsciiString> &
	:rtype: None
") Init;
		void Init (const opencascade::handle<TCollection_HAsciiString> & aName);
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "	:rtype: opencascade::handle<TCollection_HAsciiString>
") Name;
		opencascade::handle<TCollection_HAsciiString> Name ();
		%feature("compactdefaultargs") SetName;
		%feature("autodoc", "	:param aName:
	:type aName: opencascade::handle<TCollection_HAsciiString> &
	:rtype: None
") SetName;
		void SetName (const opencascade::handle<TCollection_HAsciiString> & aName);
		%feature("compactdefaultargs") StepBasic_PersonAndOrganizationRole;
		%feature("autodoc", "	* Returns a PersonAndOrganizationRole

	:rtype: None
") StepBasic_PersonAndOrganizationRole;
		 StepBasic_PersonAndOrganizationRole ();
};


%make_alias(StepBasic_PersonAndOrganizationRole)

%extend StepBasic_PersonAndOrganizationRole {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepBasic_PersonOrganizationSelect;
class StepBasic_PersonOrganizationSelect : public StepData_SelectType {
	public:
		%feature("compactdefaultargs") CaseNum;
		%feature("autodoc", "	* Recognizes a PersonOrganizationSelect Kind Entity that is : 1 -> Person 2 -> Organization 3 -> PersonAndOrganization 0 else

	:param ent:
	:type ent: opencascade::handle<Standard_Transient> &
	:rtype: int
") CaseNum;
		Standard_Integer CaseNum (const opencascade::handle<Standard_Transient> & ent);
		%feature("compactdefaultargs") Organization;
		%feature("autodoc", "	* returns Value as a Organization (Null if another type)

	:rtype: opencascade::handle<StepBasic_Organization>
") Organization;
		opencascade::handle<StepBasic_Organization> Organization ();
		%feature("compactdefaultargs") Person;
		%feature("autodoc", "	* returns Value as a Person (Null if another type)

	:rtype: opencascade::handle<StepBasic_Person>
") Person;
		opencascade::handle<StepBasic_Person> Person ();
		%feature("compactdefaultargs") PersonAndOrganization;
		%feature("autodoc", "	* returns Value as a PersonAndOrganization (Null if another type)

	:rtype: opencascade::handle<StepBasic_PersonAndOrganization>
") PersonAndOrganization;
		opencascade::handle<StepBasic_PersonAndOrganization> PersonAndOrganization ();
		%feature("compactdefaultargs") StepBasic_PersonOrganizationSelect;
		%feature("autodoc", "	* Returns a PersonOrganizationSelect SelectType

	:rtype: None
") StepBasic_PersonOrganizationSelect;
		 StepBasic_PersonOrganizationSelect ();
};


%extend StepBasic_PersonOrganizationSelect {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepBasic_Product;
class StepBasic_Product : public Standard_Transient {
	public:
		%feature("compactdefaultargs") Description;
		%feature("autodoc", "	:rtype: opencascade::handle<TCollection_HAsciiString>
") Description;
		opencascade::handle<TCollection_HAsciiString> Description ();
		%feature("compactdefaultargs") FrameOfReference;
		%feature("autodoc", "	:rtype: opencascade::handle<StepBasic_HArray1OfProductContext>
") FrameOfReference;
		opencascade::handle<StepBasic_HArray1OfProductContext> FrameOfReference ();
		%feature("compactdefaultargs") FrameOfReferenceValue;
		%feature("autodoc", "	:param num:
	:type num: int
	:rtype: opencascade::handle<StepBasic_ProductContext>
") FrameOfReferenceValue;
		opencascade::handle<StepBasic_ProductContext> FrameOfReferenceValue (const Standard_Integer num);
		%feature("compactdefaultargs") Id;
		%feature("autodoc", "	:rtype: opencascade::handle<TCollection_HAsciiString>
") Id;
		opencascade::handle<TCollection_HAsciiString> Id ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aId:
	:type aId: opencascade::handle<TCollection_HAsciiString> &
	:param aName:
	:type aName: opencascade::handle<TCollection_HAsciiString> &
	:param aDescription:
	:type aDescription: opencascade::handle<TCollection_HAsciiString> &
	:param aFrameOfReference:
	:type aFrameOfReference: opencascade::handle<StepBasic_HArray1OfProductContext> &
	:rtype: None
") Init;
		void Init (const opencascade::handle<TCollection_HAsciiString> & aId,const opencascade::handle<TCollection_HAsciiString> & aName,const opencascade::handle<TCollection_HAsciiString> & aDescription,const opencascade::handle<StepBasic_HArray1OfProductContext> & aFrameOfReference);
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "	:rtype: opencascade::handle<TCollection_HAsciiString>
") Name;
		opencascade::handle<TCollection_HAsciiString> Name ();
		%feature("compactdefaultargs") NbFrameOfReference;
		%feature("autodoc", "	:rtype: int
") NbFrameOfReference;
		Standard_Integer NbFrameOfReference ();
		%feature("compactdefaultargs") SetDescription;
		%feature("autodoc", "	:param aDescription:
	:type aDescription: opencascade::handle<TCollection_HAsciiString> &
	:rtype: None
") SetDescription;
		void SetDescription (const opencascade::handle<TCollection_HAsciiString> & aDescription);
		%feature("compactdefaultargs") SetFrameOfReference;
		%feature("autodoc", "	:param aFrameOfReference:
	:type aFrameOfReference: opencascade::handle<StepBasic_HArray1OfProductContext> &
	:rtype: None
") SetFrameOfReference;
		void SetFrameOfReference (const opencascade::handle<StepBasic_HArray1OfProductContext> & aFrameOfReference);
		%feature("compactdefaultargs") SetId;
		%feature("autodoc", "	:param aId:
	:type aId: opencascade::handle<TCollection_HAsciiString> &
	:rtype: None
") SetId;
		void SetId (const opencascade::handle<TCollection_HAsciiString> & aId);
		%feature("compactdefaultargs") SetName;
		%feature("autodoc", "	:param aName:
	:type aName: opencascade::handle<TCollection_HAsciiString> &
	:rtype: None
") SetName;
		void SetName (const opencascade::handle<TCollection_HAsciiString> & aName);
		%feature("compactdefaultargs") StepBasic_Product;
		%feature("autodoc", "	* Returns a Product

	:rtype: None
") StepBasic_Product;
		 StepBasic_Product ();
};


%make_alias(StepBasic_Product)

%extend StepBasic_Product {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepBasic_ProductCategory;
class StepBasic_ProductCategory : public Standard_Transient {
	public:
		%feature("compactdefaultargs") Description;
		%feature("autodoc", "	:rtype: opencascade::handle<TCollection_HAsciiString>
") Description;
		opencascade::handle<TCollection_HAsciiString> Description ();
		%feature("compactdefaultargs") HasDescription;
		%feature("autodoc", "	:rtype: bool
") HasDescription;
		Standard_Boolean HasDescription ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aName:
	:type aName: opencascade::handle<TCollection_HAsciiString> &
	:param hasAdescription:
	:type hasAdescription: bool
	:param aDescription:
	:type aDescription: opencascade::handle<TCollection_HAsciiString> &
	:rtype: None
") Init;
		void Init (const opencascade::handle<TCollection_HAsciiString> & aName,const Standard_Boolean hasAdescription,const opencascade::handle<TCollection_HAsciiString> & aDescription);
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "	:rtype: opencascade::handle<TCollection_HAsciiString>
") Name;
		opencascade::handle<TCollection_HAsciiString> Name ();
		%feature("compactdefaultargs") SetDescription;
		%feature("autodoc", "	:param aDescription:
	:type aDescription: opencascade::handle<TCollection_HAsciiString> &
	:rtype: None
") SetDescription;
		void SetDescription (const opencascade::handle<TCollection_HAsciiString> & aDescription);
		%feature("compactdefaultargs") SetName;
		%feature("autodoc", "	:param aName:
	:type aName: opencascade::handle<TCollection_HAsciiString> &
	:rtype: None
") SetName;
		void SetName (const opencascade::handle<TCollection_HAsciiString> & aName);
		%feature("compactdefaultargs") StepBasic_ProductCategory;
		%feature("autodoc", "	* Returns a ProductCategory

	:rtype: None
") StepBasic_ProductCategory;
		 StepBasic_ProductCategory ();
		%feature("compactdefaultargs") UnSetDescription;
		%feature("autodoc", "	:rtype: None
") UnSetDescription;
		void UnSetDescription ();
};


%make_alias(StepBasic_ProductCategory)

%extend StepBasic_ProductCategory {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepBasic_ProductCategoryRelationship;
class StepBasic_ProductCategoryRelationship : public Standard_Transient {
	public:
		%feature("compactdefaultargs") Category;
		%feature("autodoc", "	* Returns field Category

	:rtype: opencascade::handle<StepBasic_ProductCategory>
") Category;
		opencascade::handle<StepBasic_ProductCategory> Category ();
		%feature("compactdefaultargs") Description;
		%feature("autodoc", "	* Returns field Description

	:rtype: opencascade::handle<TCollection_HAsciiString>
") Description;
		opencascade::handle<TCollection_HAsciiString> Description ();
		%feature("compactdefaultargs") HasDescription;
		%feature("autodoc", "	* Returns True if optional field Description is defined

	:rtype: bool
") HasDescription;
		Standard_Boolean HasDescription ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	* Initialize all fields (own and inherited)

	:param aName:
	:type aName: opencascade::handle<TCollection_HAsciiString> &
	:param hasDescription:
	:type hasDescription: bool
	:param aDescription:
	:type aDescription: opencascade::handle<TCollection_HAsciiString> &
	:param aCategory:
	:type aCategory: opencascade::handle<StepBasic_ProductCategory> &
	:param aSubCategory:
	:type aSubCategory: opencascade::handle<StepBasic_ProductCategory> &
	:rtype: None
") Init;
		void Init (const opencascade::handle<TCollection_HAsciiString> & aName,const Standard_Boolean hasDescription,const opencascade::handle<TCollection_HAsciiString> & aDescription,const opencascade::handle<StepBasic_ProductCategory> & aCategory,const opencascade::handle<StepBasic_ProductCategory> & aSubCategory);
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "	* Returns field Name

	:rtype: opencascade::handle<TCollection_HAsciiString>
") Name;
		opencascade::handle<TCollection_HAsciiString> Name ();
		%feature("compactdefaultargs") SetCategory;
		%feature("autodoc", "	* Set field Category

	:param Category:
	:type Category: opencascade::handle<StepBasic_ProductCategory> &
	:rtype: None
") SetCategory;
		void SetCategory (const opencascade::handle<StepBasic_ProductCategory> & Category);
		%feature("compactdefaultargs") SetDescription;
		%feature("autodoc", "	* Set field Description

	:param Description:
	:type Description: opencascade::handle<TCollection_HAsciiString> &
	:rtype: None
") SetDescription;
		void SetDescription (const opencascade::handle<TCollection_HAsciiString> & Description);
		%feature("compactdefaultargs") SetName;
		%feature("autodoc", "	* Set field Name

	:param Name:
	:type Name: opencascade::handle<TCollection_HAsciiString> &
	:rtype: None
") SetName;
		void SetName (const opencascade::handle<TCollection_HAsciiString> & Name);
		%feature("compactdefaultargs") SetSubCategory;
		%feature("autodoc", "	* Set field SubCategory

	:param SubCategory:
	:type SubCategory: opencascade::handle<StepBasic_ProductCategory> &
	:rtype: None
") SetSubCategory;
		void SetSubCategory (const opencascade::handle<StepBasic_ProductCategory> & SubCategory);
		%feature("compactdefaultargs") StepBasic_ProductCategoryRelationship;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") StepBasic_ProductCategoryRelationship;
		 StepBasic_ProductCategoryRelationship ();
		%feature("compactdefaultargs") SubCategory;
		%feature("autodoc", "	* Returns field SubCategory

	:rtype: opencascade::handle<StepBasic_ProductCategory>
") SubCategory;
		opencascade::handle<StepBasic_ProductCategory> SubCategory ();
};


%make_alias(StepBasic_ProductCategoryRelationship)

%extend StepBasic_ProductCategoryRelationship {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepBasic_ProductDefinition;
class StepBasic_ProductDefinition : public Standard_Transient {
	public:
		%feature("compactdefaultargs") Description;
		%feature("autodoc", "	:rtype: opencascade::handle<TCollection_HAsciiString>
") Description;
		opencascade::handle<TCollection_HAsciiString> Description ();
		%feature("compactdefaultargs") Formation;
		%feature("autodoc", "	:rtype: opencascade::handle<StepBasic_ProductDefinitionFormation>
") Formation;
		opencascade::handle<StepBasic_ProductDefinitionFormation> Formation ();
		%feature("compactdefaultargs") FrameOfReference;
		%feature("autodoc", "	:rtype: opencascade::handle<StepBasic_ProductDefinitionContext>
") FrameOfReference;
		opencascade::handle<StepBasic_ProductDefinitionContext> FrameOfReference ();
		%feature("compactdefaultargs") Id;
		%feature("autodoc", "	:rtype: opencascade::handle<TCollection_HAsciiString>
") Id;
		opencascade::handle<TCollection_HAsciiString> Id ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aId:
	:type aId: opencascade::handle<TCollection_HAsciiString> &
	:param aDescription:
	:type aDescription: opencascade::handle<TCollection_HAsciiString> &
	:param aFormation:
	:type aFormation: opencascade::handle<StepBasic_ProductDefinitionFormation> &
	:param aFrameOfReference:
	:type aFrameOfReference: opencascade::handle<StepBasic_ProductDefinitionContext> &
	:rtype: None
") Init;
		void Init (const opencascade::handle<TCollection_HAsciiString> & aId,const opencascade::handle<TCollection_HAsciiString> & aDescription,const opencascade::handle<StepBasic_ProductDefinitionFormation> & aFormation,const opencascade::handle<StepBasic_ProductDefinitionContext> & aFrameOfReference);
		%feature("compactdefaultargs") SetDescription;
		%feature("autodoc", "	:param aDescription:
	:type aDescription: opencascade::handle<TCollection_HAsciiString> &
	:rtype: None
") SetDescription;
		void SetDescription (const opencascade::handle<TCollection_HAsciiString> & aDescription);
		%feature("compactdefaultargs") SetFormation;
		%feature("autodoc", "	:param aFormation:
	:type aFormation: opencascade::handle<StepBasic_ProductDefinitionFormation> &
	:rtype: None
") SetFormation;
		void SetFormation (const opencascade::handle<StepBasic_ProductDefinitionFormation> & aFormation);
		%feature("compactdefaultargs") SetFrameOfReference;
		%feature("autodoc", "	:param aFrameOfReference:
	:type aFrameOfReference: opencascade::handle<StepBasic_ProductDefinitionContext> &
	:rtype: None
") SetFrameOfReference;
		void SetFrameOfReference (const opencascade::handle<StepBasic_ProductDefinitionContext> & aFrameOfReference);
		%feature("compactdefaultargs") SetId;
		%feature("autodoc", "	:param aId:
	:type aId: opencascade::handle<TCollection_HAsciiString> &
	:rtype: None
") SetId;
		void SetId (const opencascade::handle<TCollection_HAsciiString> & aId);
		%feature("compactdefaultargs") StepBasic_ProductDefinition;
		%feature("autodoc", "	* Returns a ProductDefinition

	:rtype: None
") StepBasic_ProductDefinition;
		 StepBasic_ProductDefinition ();
};


%make_alias(StepBasic_ProductDefinition)

%extend StepBasic_ProductDefinition {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepBasic_ProductDefinitionFormation;
class StepBasic_ProductDefinitionFormation : public Standard_Transient {
	public:
		%feature("compactdefaultargs") Description;
		%feature("autodoc", "	:rtype: opencascade::handle<TCollection_HAsciiString>
") Description;
		opencascade::handle<TCollection_HAsciiString> Description ();
		%feature("compactdefaultargs") Id;
		%feature("autodoc", "	:rtype: opencascade::handle<TCollection_HAsciiString>
") Id;
		opencascade::handle<TCollection_HAsciiString> Id ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aId:
	:type aId: opencascade::handle<TCollection_HAsciiString> &
	:param aDescription:
	:type aDescription: opencascade::handle<TCollection_HAsciiString> &
	:param aOfProduct:
	:type aOfProduct: opencascade::handle<StepBasic_Product> &
	:rtype: None
") Init;
		void Init (const opencascade::handle<TCollection_HAsciiString> & aId,const opencascade::handle<TCollection_HAsciiString> & aDescription,const opencascade::handle<StepBasic_Product> & aOfProduct);
		%feature("compactdefaultargs") OfProduct;
		%feature("autodoc", "	:rtype: opencascade::handle<StepBasic_Product>
") OfProduct;
		opencascade::handle<StepBasic_Product> OfProduct ();
		%feature("compactdefaultargs") SetDescription;
		%feature("autodoc", "	:param aDescription:
	:type aDescription: opencascade::handle<TCollection_HAsciiString> &
	:rtype: None
") SetDescription;
		void SetDescription (const opencascade::handle<TCollection_HAsciiString> & aDescription);
		%feature("compactdefaultargs") SetId;
		%feature("autodoc", "	:param aId:
	:type aId: opencascade::handle<TCollection_HAsciiString> &
	:rtype: None
") SetId;
		void SetId (const opencascade::handle<TCollection_HAsciiString> & aId);
		%feature("compactdefaultargs") SetOfProduct;
		%feature("autodoc", "	:param aOfProduct:
	:type aOfProduct: opencascade::handle<StepBasic_Product> &
	:rtype: None
") SetOfProduct;
		void SetOfProduct (const opencascade::handle<StepBasic_Product> & aOfProduct);
		%feature("compactdefaultargs") StepBasic_ProductDefinitionFormation;
		%feature("autodoc", "	* Returns a ProductDefinitionFormation

	:rtype: None
") StepBasic_ProductDefinitionFormation;
		 StepBasic_ProductDefinitionFormation ();
};


%make_alias(StepBasic_ProductDefinitionFormation)

%extend StepBasic_ProductDefinitionFormation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepBasic_ProductDefinitionFormationRelationship;
class StepBasic_ProductDefinitionFormationRelationship : public Standard_Transient {
	public:
		%feature("compactdefaultargs") Description;
		%feature("autodoc", "	* Returns field Description

	:rtype: opencascade::handle<TCollection_HAsciiString>
") Description;
		opencascade::handle<TCollection_HAsciiString> Description ();
		%feature("compactdefaultargs") Id;
		%feature("autodoc", "	* Returns field Id

	:rtype: opencascade::handle<TCollection_HAsciiString>
") Id;
		opencascade::handle<TCollection_HAsciiString> Id ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	* Initialize all fields (own and inherited)

	:param aId:
	:type aId: opencascade::handle<TCollection_HAsciiString> &
	:param aName:
	:type aName: opencascade::handle<TCollection_HAsciiString> &
	:param aDescription:
	:type aDescription: opencascade::handle<TCollection_HAsciiString> &
	:param aRelatingProductDefinitionFormation:
	:type aRelatingProductDefinitionFormation: opencascade::handle<StepBasic_ProductDefinitionFormation> &
	:param aRelatedProductDefinitionFormation:
	:type aRelatedProductDefinitionFormation: opencascade::handle<StepBasic_ProductDefinitionFormation> &
	:rtype: None
") Init;
		void Init (const opencascade::handle<TCollection_HAsciiString> & aId,const opencascade::handle<TCollection_HAsciiString> & aName,const opencascade::handle<TCollection_HAsciiString> & aDescription,const opencascade::handle<StepBasic_ProductDefinitionFormation> & aRelatingProductDefinitionFormation,const opencascade::handle<StepBasic_ProductDefinitionFormation> & aRelatedProductDefinitionFormation);
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "	* Returns field Name

	:rtype: opencascade::handle<TCollection_HAsciiString>
") Name;
		opencascade::handle<TCollection_HAsciiString> Name ();
		%feature("compactdefaultargs") RelatedProductDefinitionFormation;
		%feature("autodoc", "	* Returns field RelatedProductDefinitionFormation

	:rtype: opencascade::handle<StepBasic_ProductDefinitionFormation>
") RelatedProductDefinitionFormation;
		opencascade::handle<StepBasic_ProductDefinitionFormation> RelatedProductDefinitionFormation ();
		%feature("compactdefaultargs") RelatingProductDefinitionFormation;
		%feature("autodoc", "	* Returns field RelatingProductDefinitionFormation

	:rtype: opencascade::handle<StepBasic_ProductDefinitionFormation>
") RelatingProductDefinitionFormation;
		opencascade::handle<StepBasic_ProductDefinitionFormation> RelatingProductDefinitionFormation ();
		%feature("compactdefaultargs") SetDescription;
		%feature("autodoc", "	* Set field Description

	:param Description:
	:type Description: opencascade::handle<TCollection_HAsciiString> &
	:rtype: None
") SetDescription;
		void SetDescription (const opencascade::handle<TCollection_HAsciiString> & Description);
		%feature("compactdefaultargs") SetId;
		%feature("autodoc", "	* Set field Id

	:param Id:
	:type Id: opencascade::handle<TCollection_HAsciiString> &
	:rtype: None
") SetId;
		void SetId (const opencascade::handle<TCollection_HAsciiString> & Id);
		%feature("compactdefaultargs") SetName;
		%feature("autodoc", "	* Set field Name

	:param Name:
	:type Name: opencascade::handle<TCollection_HAsciiString> &
	:rtype: None
") SetName;
		void SetName (const opencascade::handle<TCollection_HAsciiString> & Name);
		%feature("compactdefaultargs") SetRelatedProductDefinitionFormation;
		%feature("autodoc", "	* Set field RelatedProductDefinitionFormation

	:param RelatedProductDefinitionFormation:
	:type RelatedProductDefinitionFormation: opencascade::handle<StepBasic_ProductDefinitionFormation> &
	:rtype: None
") SetRelatedProductDefinitionFormation;
		void SetRelatedProductDefinitionFormation (const opencascade::handle<StepBasic_ProductDefinitionFormation> & RelatedProductDefinitionFormation);
		%feature("compactdefaultargs") SetRelatingProductDefinitionFormation;
		%feature("autodoc", "	* Set field RelatingProductDefinitionFormation

	:param RelatingProductDefinitionFormation:
	:type RelatingProductDefinitionFormation: opencascade::handle<StepBasic_ProductDefinitionFormation> &
	:rtype: None
") SetRelatingProductDefinitionFormation;
		void SetRelatingProductDefinitionFormation (const opencascade::handle<StepBasic_ProductDefinitionFormation> & RelatingProductDefinitionFormation);
		%feature("compactdefaultargs") StepBasic_ProductDefinitionFormationRelationship;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") StepBasic_ProductDefinitionFormationRelationship;
		 StepBasic_ProductDefinitionFormationRelationship ();
};


%make_alias(StepBasic_ProductDefinitionFormationRelationship)

%extend StepBasic_ProductDefinitionFormationRelationship {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepBasic_ProductDefinitionOrReference;
class StepBasic_ProductDefinitionOrReference : public StepData_SelectType {
	public:
		%feature("compactdefaultargs") CaseNum;
		%feature("autodoc", "	* Recognizes a ProductDefinitionOrReference Kind Entity that is : 1 -> ProductDefinition 2 -> ProductDefinitionReference 3 -> ProductDefinitionReferenceWithLocalPresentation 0 else

	:param ent:
	:type ent: opencascade::handle<Standard_Transient> &
	:rtype: int
") CaseNum;
		Standard_Integer CaseNum (const opencascade::handle<Standard_Transient> & ent);
		%feature("compactdefaultargs") ProductDefinition;
		%feature("autodoc", "	* returns Value as a ProductDefinition (Null if another type)

	:rtype: opencascade::handle<StepBasic_ProductDefinition>
") ProductDefinition;
		opencascade::handle<StepBasic_ProductDefinition> ProductDefinition ();
		%feature("compactdefaultargs") ProductDefinitionReference;
		%feature("autodoc", "	* returns Value as a ProductDefinitionReference (Null if another type)

	:rtype: opencascade::handle<StepBasic_ProductDefinitionReference>
") ProductDefinitionReference;
		opencascade::handle<StepBasic_ProductDefinitionReference> ProductDefinitionReference ();
		%feature("compactdefaultargs") ProductDefinitionReferenceWithLocalRepresentation;
		%feature("autodoc", "	* returns Value as a ProductDefinitionReferenceWithLocalRepresentation (Null if another type)

	:rtype: opencascade::handle<StepBasic_ProductDefinitionReferenceWithLocalRepresentation>
") ProductDefinitionReferenceWithLocalRepresentation;
		opencascade::handle<StepBasic_ProductDefinitionReferenceWithLocalRepresentation> ProductDefinitionReferenceWithLocalRepresentation ();
		%feature("compactdefaultargs") StepBasic_ProductDefinitionOrReference;
		%feature("autodoc", "	* Returns a ProductDefinitionOrReference SelectType

	:rtype: None
") StepBasic_ProductDefinitionOrReference;
		 StepBasic_ProductDefinitionOrReference ();
};


%extend StepBasic_ProductDefinitionOrReference {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepBasic_ProductDefinitionReference;
class StepBasic_ProductDefinitionReference : public Standard_Transient {
	public:
		%feature("compactdefaultargs") HasIdOwningOrganizationName;
		%feature("autodoc", "	* Returns true if IdOwningOrganizationName exists

	:rtype: inline bool
") HasIdOwningOrganizationName;
		inline Standard_Boolean HasIdOwningOrganizationName ();
		%feature("compactdefaultargs") IdOwningOrganizationName;
		%feature("autodoc", "	* Returns field IdOwningOrganizationName

	:rtype: inline opencascade::handle<TCollection_HAsciiString>
") IdOwningOrganizationName;
		inline opencascade::handle<TCollection_HAsciiString> IdOwningOrganizationName ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	* Initialize all fields (own and inherited)

	:param theSource:
	:type theSource: opencascade::handle<StepBasic_ExternalSource> &
	:param theProductId:
	:type theProductId: opencascade::handle<TCollection_HAsciiString> &
	:param theProductDefinitionFormationId:
	:type theProductDefinitionFormationId: opencascade::handle<TCollection_HAsciiString> &
	:param theProductDefinitionId:
	:type theProductDefinitionId: opencascade::handle<TCollection_HAsciiString> &
	:param theIdOwningOrganizationName:
	:type theIdOwningOrganizationName: opencascade::handle<TCollection_HAsciiString> &
	:rtype: None
") Init;
		void Init (const opencascade::handle<StepBasic_ExternalSource> & theSource,const opencascade::handle<TCollection_HAsciiString> & theProductId,const opencascade::handle<TCollection_HAsciiString> & theProductDefinitionFormationId,const opencascade::handle<TCollection_HAsciiString> & theProductDefinitionId,const opencascade::handle<TCollection_HAsciiString> & theIdOwningOrganizationName);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	* Initialize all fields (own and inherited)

	:param theSource:
	:type theSource: opencascade::handle<StepBasic_ExternalSource> &
	:param theProductId:
	:type theProductId: opencascade::handle<TCollection_HAsciiString> &
	:param theProductDefinitionFormationId:
	:type theProductDefinitionFormationId: opencascade::handle<TCollection_HAsciiString> &
	:param theProductDefinitionId:
	:type theProductDefinitionId: opencascade::handle<TCollection_HAsciiString> &
	:rtype: None
") Init;
		void Init (const opencascade::handle<StepBasic_ExternalSource> & theSource,const opencascade::handle<TCollection_HAsciiString> & theProductId,const opencascade::handle<TCollection_HAsciiString> & theProductDefinitionFormationId,const opencascade::handle<TCollection_HAsciiString> & theProductDefinitionId);
		%feature("compactdefaultargs") ProductDefinitionFormationId;
		%feature("autodoc", "	* Returns field ProductDefinitionFormationId

	:rtype: inline opencascade::handle<TCollection_HAsciiString>
") ProductDefinitionFormationId;
		inline opencascade::handle<TCollection_HAsciiString> ProductDefinitionFormationId ();
		%feature("compactdefaultargs") ProductDefinitionId;
		%feature("autodoc", "	* Returns field ProductDefinitionId

	:rtype: inline opencascade::handle<TCollection_HAsciiString>
") ProductDefinitionId;
		inline opencascade::handle<TCollection_HAsciiString> ProductDefinitionId ();
		%feature("compactdefaultargs") ProductId;
		%feature("autodoc", "	* Returns field ProductId

	:rtype: inline opencascade::handle<TCollection_HAsciiString>
") ProductId;
		inline opencascade::handle<TCollection_HAsciiString> ProductId ();
		%feature("compactdefaultargs") SetIdOwningOrganizationName;
		%feature("autodoc", "	* Set field IdOwningOrganizationName

	:param theIdOwningOrganizationName:
	:type theIdOwningOrganizationName: opencascade::handle<TCollection_HAsciiString> &
	:rtype: inline void
") SetIdOwningOrganizationName;
		inline void SetIdOwningOrganizationName (const opencascade::handle<TCollection_HAsciiString> & theIdOwningOrganizationName);
		%feature("compactdefaultargs") SetProductDefinitionFormationId;
		%feature("autodoc", "	* Set field ProductDefinitionFormationId

	:param theProductDefinitionFormationId:
	:type theProductDefinitionFormationId: opencascade::handle<TCollection_HAsciiString> &
	:rtype: inline void
") SetProductDefinitionFormationId;
		inline void SetProductDefinitionFormationId (const opencascade::handle<TCollection_HAsciiString> & theProductDefinitionFormationId);
		%feature("compactdefaultargs") SetProductDefinitionId;
		%feature("autodoc", "	* Set field ProductDefinitionId

	:param theProductDefinitionId:
	:type theProductDefinitionId: opencascade::handle<TCollection_HAsciiString> &
	:rtype: inline void
") SetProductDefinitionId;
		inline void SetProductDefinitionId (const opencascade::handle<TCollection_HAsciiString> & theProductDefinitionId);
		%feature("compactdefaultargs") SetProductId;
		%feature("autodoc", "	* Set field ProductId

	:param theProductId:
	:type theProductId: opencascade::handle<TCollection_HAsciiString> &
	:rtype: inline void
") SetProductId;
		inline void SetProductId (const opencascade::handle<TCollection_HAsciiString> & theProductId);
		%feature("compactdefaultargs") SetSource;
		%feature("autodoc", "	* Set field Source

	:param theSource:
	:type theSource: opencascade::handle<StepBasic_ExternalSource> &
	:rtype: inline void
") SetSource;
		inline void SetSource (const opencascade::handle<StepBasic_ExternalSource> & theSource);
		%feature("compactdefaultargs") Source;
		%feature("autodoc", "	* Returns field Source

	:rtype: inline opencascade::handle<StepBasic_ExternalSource>
") Source;
		inline opencascade::handle<StepBasic_ExternalSource> Source ();
		%feature("compactdefaultargs") StepBasic_ProductDefinitionReference;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") StepBasic_ProductDefinitionReference;
		 StepBasic_ProductDefinitionReference ();
};


%make_alias(StepBasic_ProductDefinitionReference)

%extend StepBasic_ProductDefinitionReference {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepBasic_ProductDefinitionRelationship;
class StepBasic_ProductDefinitionRelationship : public Standard_Transient {
	public:
		%feature("compactdefaultargs") Description;
		%feature("autodoc", "	* Returns field Description

	:rtype: opencascade::handle<TCollection_HAsciiString>
") Description;
		opencascade::handle<TCollection_HAsciiString> Description ();
		%feature("compactdefaultargs") HasDescription;
		%feature("autodoc", "	* Returns True if optional field Description is defined

	:rtype: bool
") HasDescription;
		Standard_Boolean HasDescription ();
		%feature("compactdefaultargs") Id;
		%feature("autodoc", "	* Returns field Id

	:rtype: opencascade::handle<TCollection_HAsciiString>
") Id;
		opencascade::handle<TCollection_HAsciiString> Id ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	* Initialize all fields (own and inherited)

	:param aId:
	:type aId: opencascade::handle<TCollection_HAsciiString> &
	:param aName:
	:type aName: opencascade::handle<TCollection_HAsciiString> &
	:param hasDescription:
	:type hasDescription: bool
	:param aDescription:
	:type aDescription: opencascade::handle<TCollection_HAsciiString> &
	:param aRelatingProductDefinition:
	:type aRelatingProductDefinition: opencascade::handle<StepBasic_ProductDefinition> &
	:param aRelatedProductDefinition:
	:type aRelatedProductDefinition: opencascade::handle<StepBasic_ProductDefinition> &
	:rtype: None
") Init;
		void Init (const opencascade::handle<TCollection_HAsciiString> & aId,const opencascade::handle<TCollection_HAsciiString> & aName,const Standard_Boolean hasDescription,const opencascade::handle<TCollection_HAsciiString> & aDescription,const opencascade::handle<StepBasic_ProductDefinition> & aRelatingProductDefinition,const opencascade::handle<StepBasic_ProductDefinition> & aRelatedProductDefinition);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	* Initialize all fields (own and inherited)

	:param aId:
	:type aId: opencascade::handle<TCollection_HAsciiString> &
	:param aName:
	:type aName: opencascade::handle<TCollection_HAsciiString> &
	:param hasDescription:
	:type hasDescription: bool
	:param aDescription:
	:type aDescription: opencascade::handle<TCollection_HAsciiString> &
	:param aRelatingProductDefinition:
	:type aRelatingProductDefinition: StepBasic_ProductDefinitionOrReference &
	:param aRelatedProductDefinition:
	:type aRelatedProductDefinition: StepBasic_ProductDefinitionOrReference &
	:rtype: None
") Init;
		void Init (const opencascade::handle<TCollection_HAsciiString> & aId,const opencascade::handle<TCollection_HAsciiString> & aName,const Standard_Boolean hasDescription,const opencascade::handle<TCollection_HAsciiString> & aDescription,const StepBasic_ProductDefinitionOrReference & aRelatingProductDefinition,const StepBasic_ProductDefinitionOrReference & aRelatedProductDefinition);
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "	* Returns field Name

	:rtype: opencascade::handle<TCollection_HAsciiString>
") Name;
		opencascade::handle<TCollection_HAsciiString> Name ();
		%feature("compactdefaultargs") RelatedProductDefinition;
		%feature("autodoc", "	* Returns field RelatedProductDefinition

	:rtype: opencascade::handle<StepBasic_ProductDefinition>
") RelatedProductDefinition;
		opencascade::handle<StepBasic_ProductDefinition> RelatedProductDefinition ();
		%feature("compactdefaultargs") RelatedProductDefinitionAP242;
		%feature("autodoc", "	* Returns field RelatedProductDefinition in AP242

	:rtype: StepBasic_ProductDefinitionOrReference
") RelatedProductDefinitionAP242;
		StepBasic_ProductDefinitionOrReference RelatedProductDefinitionAP242 ();
		%feature("compactdefaultargs") RelatingProductDefinition;
		%feature("autodoc", "	* Returns field RelatingProductDefinition

	:rtype: opencascade::handle<StepBasic_ProductDefinition>
") RelatingProductDefinition;
		opencascade::handle<StepBasic_ProductDefinition> RelatingProductDefinition ();
		%feature("compactdefaultargs") RelatingProductDefinitionAP242;
		%feature("autodoc", "	* Returns field RelatingProductDefinition in AP242

	:rtype: StepBasic_ProductDefinitionOrReference
") RelatingProductDefinitionAP242;
		StepBasic_ProductDefinitionOrReference RelatingProductDefinitionAP242 ();
		%feature("compactdefaultargs") SetDescription;
		%feature("autodoc", "	* Set field Description

	:param Description:
	:type Description: opencascade::handle<TCollection_HAsciiString> &
	:rtype: None
") SetDescription;
		void SetDescription (const opencascade::handle<TCollection_HAsciiString> & Description);
		%feature("compactdefaultargs") SetId;
		%feature("autodoc", "	* Set field Id

	:param Id:
	:type Id: opencascade::handle<TCollection_HAsciiString> &
	:rtype: None
") SetId;
		void SetId (const opencascade::handle<TCollection_HAsciiString> & Id);
		%feature("compactdefaultargs") SetName;
		%feature("autodoc", "	* Set field Name

	:param Name:
	:type Name: opencascade::handle<TCollection_HAsciiString> &
	:rtype: None
") SetName;
		void SetName (const opencascade::handle<TCollection_HAsciiString> & Name);
		%feature("compactdefaultargs") SetRelatedProductDefinition;
		%feature("autodoc", "	* Set field RelatedProductDefinition

	:param RelatedProductDefinition:
	:type RelatedProductDefinition: opencascade::handle<StepBasic_ProductDefinition> &
	:rtype: None
") SetRelatedProductDefinition;
		void SetRelatedProductDefinition (const opencascade::handle<StepBasic_ProductDefinition> & RelatedProductDefinition);
		%feature("compactdefaultargs") SetRelatedProductDefinition;
		%feature("autodoc", "	* Set field RelatedProductDefinition in AP242

	:param RelatedProductDefinition:
	:type RelatedProductDefinition: StepBasic_ProductDefinitionOrReference &
	:rtype: None
") SetRelatedProductDefinition;
		void SetRelatedProductDefinition (const StepBasic_ProductDefinitionOrReference & RelatedProductDefinition);
		%feature("compactdefaultargs") SetRelatingProductDefinition;
		%feature("autodoc", "	* Set field RelatingProductDefinition

	:param RelatingProductDefinition:
	:type RelatingProductDefinition: opencascade::handle<StepBasic_ProductDefinition> &
	:rtype: None
") SetRelatingProductDefinition;
		void SetRelatingProductDefinition (const opencascade::handle<StepBasic_ProductDefinition> & RelatingProductDefinition);
		%feature("compactdefaultargs") SetRelatingProductDefinition;
		%feature("autodoc", "	* Set field RelatingProductDefinition in AP242

	:param RelatingProductDefinition:
	:type RelatingProductDefinition: StepBasic_ProductDefinitionOrReference &
	:rtype: None
") SetRelatingProductDefinition;
		void SetRelatingProductDefinition (const StepBasic_ProductDefinitionOrReference & RelatingProductDefinition);
		%feature("compactdefaultargs") StepBasic_ProductDefinitionRelationship;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") StepBasic_ProductDefinitionRelationship;
		 StepBasic_ProductDefinitionRelationship ();
};


%make_alias(StepBasic_ProductDefinitionRelationship)

%extend StepBasic_ProductDefinitionRelationship {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepBasic_ProductOrFormationOrDefinition;
class StepBasic_ProductOrFormationOrDefinition : public StepData_SelectType {
	public:
		%feature("compactdefaultargs") CaseNum;
		%feature("autodoc", "	* Recognizes a kind of ProductOrFormationOrDefinition select type 1 -> Product from StepBasic 2 -> ProductDefinitionFormation from StepBasic 3 -> ProductDefinition from StepBasic 0 else

	:param ent:
	:type ent: opencascade::handle<Standard_Transient> &
	:rtype: int
") CaseNum;
		Standard_Integer CaseNum (const opencascade::handle<Standard_Transient> & ent);
		%feature("compactdefaultargs") Product;
		%feature("autodoc", "	* Returns Value as Product (or Null if another type)

	:rtype: opencascade::handle<StepBasic_Product>
") Product;
		opencascade::handle<StepBasic_Product> Product ();
		%feature("compactdefaultargs") ProductDefinition;
		%feature("autodoc", "	* Returns Value as ProductDefinition (or Null if another type)

	:rtype: opencascade::handle<StepBasic_ProductDefinition>
") ProductDefinition;
		opencascade::handle<StepBasic_ProductDefinition> ProductDefinition ();
		%feature("compactdefaultargs") ProductDefinitionFormation;
		%feature("autodoc", "	* Returns Value as ProductDefinitionFormation (or Null if another type)

	:rtype: opencascade::handle<StepBasic_ProductDefinitionFormation>
") ProductDefinitionFormation;
		opencascade::handle<StepBasic_ProductDefinitionFormation> ProductDefinitionFormation ();
		%feature("compactdefaultargs") StepBasic_ProductOrFormationOrDefinition;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") StepBasic_ProductOrFormationOrDefinition;
		 StepBasic_ProductOrFormationOrDefinition ();
};


%extend StepBasic_ProductOrFormationOrDefinition {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepBasic_RoleAssociation;
class StepBasic_RoleAssociation : public Standard_Transient {
	public:
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	* Initialize all fields (own and inherited)

	:param aRole:
	:type aRole: opencascade::handle<StepBasic_ObjectRole> &
	:param aItemWithRole:
	:type aItemWithRole: StepBasic_RoleSelect &
	:rtype: None
") Init;
		void Init (const opencascade::handle<StepBasic_ObjectRole> & aRole,const StepBasic_RoleSelect & aItemWithRole);
		%feature("compactdefaultargs") ItemWithRole;
		%feature("autodoc", "	* Returns field ItemWithRole

	:rtype: StepBasic_RoleSelect
") ItemWithRole;
		StepBasic_RoleSelect ItemWithRole ();
		%feature("compactdefaultargs") Role;
		%feature("autodoc", "	* Returns field Role

	:rtype: opencascade::handle<StepBasic_ObjectRole>
") Role;
		opencascade::handle<StepBasic_ObjectRole> Role ();
		%feature("compactdefaultargs") SetItemWithRole;
		%feature("autodoc", "	* Set field ItemWithRole

	:param ItemWithRole:
	:type ItemWithRole: StepBasic_RoleSelect &
	:rtype: None
") SetItemWithRole;
		void SetItemWithRole (const StepBasic_RoleSelect & ItemWithRole);
		%feature("compactdefaultargs") SetRole;
		%feature("autodoc", "	* Set field Role

	:param Role:
	:type Role: opencascade::handle<StepBasic_ObjectRole> &
	:rtype: None
") SetRole;
		void SetRole (const opencascade::handle<StepBasic_ObjectRole> & Role);
		%feature("compactdefaultargs") StepBasic_RoleAssociation;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") StepBasic_RoleAssociation;
		 StepBasic_RoleAssociation ();
};


%make_alias(StepBasic_RoleAssociation)

%extend StepBasic_RoleAssociation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepBasic_RoleSelect;
class StepBasic_RoleSelect : public StepData_SelectType {
	public:
		%feature("compactdefaultargs") ActionAssignment;
		%feature("autodoc", "	* Returns Value as ActionAssignment (or Null if another type)

	:rtype: opencascade::handle<StepBasic_ActionAssignment>
") ActionAssignment;
		opencascade::handle<StepBasic_ActionAssignment> ActionAssignment ();
		%feature("compactdefaultargs") ActionRequestAssignment;
		%feature("autodoc", "	* Returns Value as ActionRequestAssignment (or Null if another type)

	:rtype: opencascade::handle<StepBasic_ActionRequestAssignment>
") ActionRequestAssignment;
		opencascade::handle<StepBasic_ActionRequestAssignment> ActionRequestAssignment ();
		%feature("compactdefaultargs") ApprovalAssignment;
		%feature("autodoc", "	* Returns Value as ApprovalAssignment (or Null if another type)

	:rtype: opencascade::handle<StepBasic_ApprovalAssignment>
") ApprovalAssignment;
		opencascade::handle<StepBasic_ApprovalAssignment> ApprovalAssignment ();
		%feature("compactdefaultargs") ApprovalDateTime;
		%feature("autodoc", "	* Returns Value as ApprovalDateTime (or Null if another type)

	:rtype: opencascade::handle<StepBasic_ApprovalDateTime>
") ApprovalDateTime;
		opencascade::handle<StepBasic_ApprovalDateTime> ApprovalDateTime ();
		%feature("compactdefaultargs") CaseNum;
		%feature("autodoc", "	* Recognizes a kind of RoleSelect select type 1 -> ActionAssignment from StepBasic 2 -> ActionRequestAssignment from StepBasic 3 -> ApprovalAssignment from StepBasic 4 -> ApprovalDateTime from StepBasic 5 -> CertificationAssignment from StepBasic 6 -> ContractAssignment from StepBasic 7 -> DocumentReference from StepBasic 8 -> EffectivityAssignment from StepBasic 9 -> GroupAssignment from StepBasic 10 -> NameAssignment from StepBasic 11 -> SecurityClassificationAssignment from StepBasic 0 else

	:param ent:
	:type ent: opencascade::handle<Standard_Transient> &
	:rtype: int
") CaseNum;
		Standard_Integer CaseNum (const opencascade::handle<Standard_Transient> & ent);
		%feature("compactdefaultargs") CertificationAssignment;
		%feature("autodoc", "	* Returns Value as CertificationAssignment (or Null if another type)

	:rtype: opencascade::handle<StepBasic_CertificationAssignment>
") CertificationAssignment;
		opencascade::handle<StepBasic_CertificationAssignment> CertificationAssignment ();
		%feature("compactdefaultargs") ContractAssignment;
		%feature("autodoc", "	* Returns Value as ContractAssignment (or Null if another type)

	:rtype: opencascade::handle<StepBasic_ContractAssignment>
") ContractAssignment;
		opencascade::handle<StepBasic_ContractAssignment> ContractAssignment ();
		%feature("compactdefaultargs") DocumentReference;
		%feature("autodoc", "	* Returns Value as DocumentReference (or Null if another type)

	:rtype: opencascade::handle<StepBasic_DocumentReference>
") DocumentReference;
		opencascade::handle<StepBasic_DocumentReference> DocumentReference ();
		%feature("compactdefaultargs") EffectivityAssignment;
		%feature("autodoc", "	* Returns Value as EffectivityAssignment (or Null if another type)

	:rtype: opencascade::handle<StepBasic_EffectivityAssignment>
") EffectivityAssignment;
		opencascade::handle<StepBasic_EffectivityAssignment> EffectivityAssignment ();
		%feature("compactdefaultargs") GroupAssignment;
		%feature("autodoc", "	* Returns Value as GroupAssignment (or Null if another type)

	:rtype: opencascade::handle<StepBasic_GroupAssignment>
") GroupAssignment;
		opencascade::handle<StepBasic_GroupAssignment> GroupAssignment ();
		%feature("compactdefaultargs") NameAssignment;
		%feature("autodoc", "	* Returns Value as NameAssignment (or Null if another type)

	:rtype: opencascade::handle<StepBasic_NameAssignment>
") NameAssignment;
		opencascade::handle<StepBasic_NameAssignment> NameAssignment ();
		%feature("compactdefaultargs") SecurityClassificationAssignment;
		%feature("autodoc", "	* Returns Value as SecurityClassificationAssignment (or Null if another type)

	:rtype: opencascade::handle<StepBasic_SecurityClassificationAssignment>
") SecurityClassificationAssignment;
		opencascade::handle<StepBasic_SecurityClassificationAssignment> SecurityClassificationAssignment ();
		%feature("compactdefaultargs") StepBasic_RoleSelect;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") StepBasic_RoleSelect;
		 StepBasic_RoleSelect ();
};


%extend StepBasic_RoleSelect {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepBasic_SecurityClassification;
class StepBasic_SecurityClassification : public Standard_Transient {
	public:
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aName:
	:type aName: opencascade::handle<TCollection_HAsciiString> &
	:param aPurpose:
	:type aPurpose: opencascade::handle<TCollection_HAsciiString> &
	:param aSecurityLevel:
	:type aSecurityLevel: opencascade::handle<StepBasic_SecurityClassificationLevel> &
	:rtype: None
") Init;
		void Init (const opencascade::handle<TCollection_HAsciiString> & aName,const opencascade::handle<TCollection_HAsciiString> & aPurpose,const opencascade::handle<StepBasic_SecurityClassificationLevel> & aSecurityLevel);
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "	:rtype: opencascade::handle<TCollection_HAsciiString>
") Name;
		opencascade::handle<TCollection_HAsciiString> Name ();
		%feature("compactdefaultargs") Purpose;
		%feature("autodoc", "	:rtype: opencascade::handle<TCollection_HAsciiString>
") Purpose;
		opencascade::handle<TCollection_HAsciiString> Purpose ();
		%feature("compactdefaultargs") SecurityLevel;
		%feature("autodoc", "	:rtype: opencascade::handle<StepBasic_SecurityClassificationLevel>
") SecurityLevel;
		opencascade::handle<StepBasic_SecurityClassificationLevel> SecurityLevel ();
		%feature("compactdefaultargs") SetName;
		%feature("autodoc", "	:param aName:
	:type aName: opencascade::handle<TCollection_HAsciiString> &
	:rtype: None
") SetName;
		void SetName (const opencascade::handle<TCollection_HAsciiString> & aName);
		%feature("compactdefaultargs") SetPurpose;
		%feature("autodoc", "	:param aPurpose:
	:type aPurpose: opencascade::handle<TCollection_HAsciiString> &
	:rtype: None
") SetPurpose;
		void SetPurpose (const opencascade::handle<TCollection_HAsciiString> & aPurpose);
		%feature("compactdefaultargs") SetSecurityLevel;
		%feature("autodoc", "	:param aSecurityLevel:
	:type aSecurityLevel: opencascade::handle<StepBasic_SecurityClassificationLevel> &
	:rtype: None
") SetSecurityLevel;
		void SetSecurityLevel (const opencascade::handle<StepBasic_SecurityClassificationLevel> & aSecurityLevel);
		%feature("compactdefaultargs") StepBasic_SecurityClassification;
		%feature("autodoc", "	* Returns a SecurityClassification

	:rtype: None
") StepBasic_SecurityClassification;
		 StepBasic_SecurityClassification ();
};


%make_alias(StepBasic_SecurityClassification)

%extend StepBasic_SecurityClassification {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepBasic_SecurityClassificationAssignment;
class StepBasic_SecurityClassificationAssignment : public Standard_Transient {
	public:
		%feature("compactdefaultargs") AssignedSecurityClassification;
		%feature("autodoc", "	:rtype: opencascade::handle<StepBasic_SecurityClassification>
") AssignedSecurityClassification;
		opencascade::handle<StepBasic_SecurityClassification> AssignedSecurityClassification ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aAssignedSecurityClassification:
	:type aAssignedSecurityClassification: opencascade::handle<StepBasic_SecurityClassification> &
	:rtype: None
") Init;
		void Init (const opencascade::handle<StepBasic_SecurityClassification> & aAssignedSecurityClassification);
		%feature("compactdefaultargs") SetAssignedSecurityClassification;
		%feature("autodoc", "	:param aAssignedSecurityClassification:
	:type aAssignedSecurityClassification: opencascade::handle<StepBasic_SecurityClassification> &
	:rtype: None
") SetAssignedSecurityClassification;
		void SetAssignedSecurityClassification (const opencascade::handle<StepBasic_SecurityClassification> & aAssignedSecurityClassification);
};


%make_alias(StepBasic_SecurityClassificationAssignment)

%extend StepBasic_SecurityClassificationAssignment {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepBasic_SecurityClassificationLevel;
class StepBasic_SecurityClassificationLevel : public Standard_Transient {
	public:
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aName:
	:type aName: opencascade::handle<TCollection_HAsciiString> &
	:rtype: None
") Init;
		void Init (const opencascade::handle<TCollection_HAsciiString> & aName);
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "	:rtype: opencascade::handle<TCollection_HAsciiString>
") Name;
		opencascade::handle<TCollection_HAsciiString> Name ();
		%feature("compactdefaultargs") SetName;
		%feature("autodoc", "	:param aName:
	:type aName: opencascade::handle<TCollection_HAsciiString> &
	:rtype: None
") SetName;
		void SetName (const opencascade::handle<TCollection_HAsciiString> & aName);
		%feature("compactdefaultargs") StepBasic_SecurityClassificationLevel;
		%feature("autodoc", "	* Returns a SecurityClassificationLevel

	:rtype: None
") StepBasic_SecurityClassificationLevel;
		 StepBasic_SecurityClassificationLevel ();
};


%make_alias(StepBasic_SecurityClassificationLevel)

%extend StepBasic_SecurityClassificationLevel {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepBasic_SizeMember;
class StepBasic_SizeMember : public StepData_SelectReal {
	public:
		%feature("compactdefaultargs") HasName;
		%feature("autodoc", "	:rtype: bool
") HasName;
		virtual Standard_Boolean HasName ();
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "	:rtype: char *
") Name;
		virtual const char * Name ();
		%feature("compactdefaultargs") SetName;
		%feature("autodoc", "	:param name:
	:type name: char *
	:rtype: bool
") SetName;
		virtual Standard_Boolean SetName (const char * name);
		%feature("compactdefaultargs") StepBasic_SizeMember;
		%feature("autodoc", "	:rtype: None
") StepBasic_SizeMember;
		 StepBasic_SizeMember ();
};


%make_alias(StepBasic_SizeMember)

%extend StepBasic_SizeMember {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepBasic_SizeSelect;
class StepBasic_SizeSelect : public StepData_SelectType {
	public:
		%feature("compactdefaultargs") CaseMem;
		%feature("autodoc", "	* Recognizes a SelectMember as Real, named as PARAMETER_VALUE 1 -> PositiveLengthMeasure i.e. Real 0 else (i.e. Entity)

	:param ent:
	:type ent: opencascade::handle<StepData_SelectMember> &
	:rtype: int
") CaseMem;
		virtual Standard_Integer CaseMem (const opencascade::handle<StepData_SelectMember> & ent);
		%feature("compactdefaultargs") CaseNum;
		%feature("autodoc", "	* Recognizes a TrimmingSelect Kind Entity that is : 1 -> SizeMember 0 else (i.e. Real)

	:param ent:
	:type ent: opencascade::handle<Standard_Transient> &
	:rtype: int
") CaseNum;
		Standard_Integer CaseNum (const opencascade::handle<Standard_Transient> & ent);
		%feature("compactdefaultargs") NewMember;
		%feature("autodoc", "	* Returns a SizeMember (POSITIVE_LENGTH_MEASURE) as preferred

	:rtype: opencascade::handle<StepData_SelectMember>
") NewMember;
		virtual opencascade::handle<StepData_SelectMember> NewMember ();
		%feature("compactdefaultargs") RealValue;
		%feature("autodoc", "	* returns Value as a Real (Null if another type)

	:rtype: float
") RealValue;
		Standard_Real RealValue ();
		%feature("compactdefaultargs") SetRealValue;
		%feature("autodoc", "	:param aReal:
	:type aReal: float
	:rtype: None
") SetRealValue;
		void SetRealValue (const Standard_Real aReal);
		%feature("compactdefaultargs") StepBasic_SizeSelect;
		%feature("autodoc", "	* Returns a SizeSelect SelectType

	:rtype: None
") StepBasic_SizeSelect;
		 StepBasic_SizeSelect ();
};


%extend StepBasic_SizeSelect {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepBasic_SourceItem;
class StepBasic_SourceItem : public StepData_SelectType {
	public:
		%feature("compactdefaultargs") CaseNum;
		%feature("autodoc", "	* Recognizes a kind of SourceItem select type 1 -> HAsciiString from TCollection 0 else

	:param ent:
	:type ent: opencascade::handle<Standard_Transient> &
	:rtype: int
") CaseNum;
		Standard_Integer CaseNum (const opencascade::handle<Standard_Transient> & ent);
		%feature("compactdefaultargs") Identifier;
		%feature("autodoc", "	* Returns Value as Identifier (or Null if another type)

	:rtype: opencascade::handle<TCollection_HAsciiString>
") Identifier;
		opencascade::handle<TCollection_HAsciiString> Identifier ();
		%feature("compactdefaultargs") NewMember;
		%feature("autodoc", "	:rtype: opencascade::handle<StepData_SelectMember>
") NewMember;
		virtual opencascade::handle<StepData_SelectMember> NewMember ();
		%feature("compactdefaultargs") StepBasic_SourceItem;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") StepBasic_SourceItem;
		 StepBasic_SourceItem ();
};


%extend StepBasic_SourceItem {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepBasic_Unit;
class StepBasic_Unit : public StepData_SelectType {
	public:
		%feature("compactdefaultargs") CaseNum;
		%feature("autodoc", "	* Recognizes a type of Unit Entity 1 -> NamedUnit 2 -> DerivedUnit

	:param ent:
	:type ent: opencascade::handle<Standard_Transient> &
	:rtype: int
") CaseNum;
		Standard_Integer CaseNum (const opencascade::handle<Standard_Transient> & ent);
		%feature("compactdefaultargs") DerivedUnit;
		%feature("autodoc", "	* returns Value as a DerivedUnit (Null if another type)

	:rtype: opencascade::handle<StepBasic_DerivedUnit>
") DerivedUnit;
		opencascade::handle<StepBasic_DerivedUnit> DerivedUnit ();
		%feature("compactdefaultargs") NamedUnit;
		%feature("autodoc", "	* returns Value as a NamedUnit (Null if another type)

	:rtype: opencascade::handle<StepBasic_NamedUnit>
") NamedUnit;
		opencascade::handle<StepBasic_NamedUnit> NamedUnit ();
		%feature("compactdefaultargs") StepBasic_Unit;
		%feature("autodoc", "	* Creates empty object

	:rtype: None
") StepBasic_Unit;
		 StepBasic_Unit ();
};


%extend StepBasic_Unit {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepBasic_VersionedActionRequest;
class StepBasic_VersionedActionRequest : public Standard_Transient {
	public:
		%feature("compactdefaultargs") Description;
		%feature("autodoc", "	* Returns field Description

	:rtype: opencascade::handle<TCollection_HAsciiString>
") Description;
		opencascade::handle<TCollection_HAsciiString> Description ();
		%feature("compactdefaultargs") HasDescription;
		%feature("autodoc", "	* Returns True if optional field Description is defined

	:rtype: bool
") HasDescription;
		Standard_Boolean HasDescription ();
		%feature("compactdefaultargs") Id;
		%feature("autodoc", "	* Returns field Id

	:rtype: opencascade::handle<TCollection_HAsciiString>
") Id;
		opencascade::handle<TCollection_HAsciiString> Id ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	* Initialize all fields (own and inherited)

	:param aId:
	:type aId: opencascade::handle<TCollection_HAsciiString> &
	:param aVersion:
	:type aVersion: opencascade::handle<TCollection_HAsciiString> &
	:param aPurpose:
	:type aPurpose: opencascade::handle<TCollection_HAsciiString> &
	:param hasDescription:
	:type hasDescription: bool
	:param aDescription:
	:type aDescription: opencascade::handle<TCollection_HAsciiString> &
	:rtype: None
") Init;
		void Init (const opencascade::handle<TCollection_HAsciiString> & aId,const opencascade::handle<TCollection_HAsciiString> & aVersion,const opencascade::handle<TCollection_HAsciiString> & aPurpose,const Standard_Boolean hasDescription,const opencascade::handle<TCollection_HAsciiString> & aDescription);
		%feature("compactdefaultargs") Purpose;
		%feature("autodoc", "	* Returns field Purpose

	:rtype: opencascade::handle<TCollection_HAsciiString>
") Purpose;
		opencascade::handle<TCollection_HAsciiString> Purpose ();
		%feature("compactdefaultargs") SetDescription;
		%feature("autodoc", "	* Set field Description

	:param Description:
	:type Description: opencascade::handle<TCollection_HAsciiString> &
	:rtype: None
") SetDescription;
		void SetDescription (const opencascade::handle<TCollection_HAsciiString> & Description);
		%feature("compactdefaultargs") SetId;
		%feature("autodoc", "	* Set field Id

	:param Id:
	:type Id: opencascade::handle<TCollection_HAsciiString> &
	:rtype: None
") SetId;
		void SetId (const opencascade::handle<TCollection_HAsciiString> & Id);
		%feature("compactdefaultargs") SetPurpose;
		%feature("autodoc", "	* Set field Purpose

	:param Purpose:
	:type Purpose: opencascade::handle<TCollection_HAsciiString> &
	:rtype: None
") SetPurpose;
		void SetPurpose (const opencascade::handle<TCollection_HAsciiString> & Purpose);
		%feature("compactdefaultargs") SetVersion;
		%feature("autodoc", "	* Set field Version

	:param Version:
	:type Version: opencascade::handle<TCollection_HAsciiString> &
	:rtype: None
") SetVersion;
		void SetVersion (const opencascade::handle<TCollection_HAsciiString> & Version);
		%feature("compactdefaultargs") StepBasic_VersionedActionRequest;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") StepBasic_VersionedActionRequest;
		 StepBasic_VersionedActionRequest ();
		%feature("compactdefaultargs") Version;
		%feature("autodoc", "	* Returns field Version

	:rtype: opencascade::handle<TCollection_HAsciiString>
") Version;
		opencascade::handle<TCollection_HAsciiString> Version ();
};


%make_alias(StepBasic_VersionedActionRequest)

%extend StepBasic_VersionedActionRequest {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepBasic_AreaUnit;
class StepBasic_AreaUnit : public StepBasic_NamedUnit {
	public:
		%feature("compactdefaultargs") StepBasic_AreaUnit;
		%feature("autodoc", "	:rtype: None
") StepBasic_AreaUnit;
		 StepBasic_AreaUnit ();
};


%make_alias(StepBasic_AreaUnit)

%extend StepBasic_AreaUnit {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepBasic_CalendarDate;
class StepBasic_CalendarDate : public StepBasic_Date {
	public:
		%feature("compactdefaultargs") DayComponent;
		%feature("autodoc", "	:rtype: int
") DayComponent;
		Standard_Integer DayComponent ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aYearComponent:
	:type aYearComponent: int
	:param aDayComponent:
	:type aDayComponent: int
	:param aMonthComponent:
	:type aMonthComponent: int
	:rtype: None
") Init;
		void Init (const Standard_Integer aYearComponent,const Standard_Integer aDayComponent,const Standard_Integer aMonthComponent);
		%feature("compactdefaultargs") MonthComponent;
		%feature("autodoc", "	:rtype: int
") MonthComponent;
		Standard_Integer MonthComponent ();
		%feature("compactdefaultargs") SetDayComponent;
		%feature("autodoc", "	:param aDayComponent:
	:type aDayComponent: int
	:rtype: None
") SetDayComponent;
		void SetDayComponent (const Standard_Integer aDayComponent);
		%feature("compactdefaultargs") SetMonthComponent;
		%feature("autodoc", "	:param aMonthComponent:
	:type aMonthComponent: int
	:rtype: None
") SetMonthComponent;
		void SetMonthComponent (const Standard_Integer aMonthComponent);
		%feature("compactdefaultargs") StepBasic_CalendarDate;
		%feature("autodoc", "	* Returns a CalendarDate

	:rtype: None
") StepBasic_CalendarDate;
		 StepBasic_CalendarDate ();
};


%make_alias(StepBasic_CalendarDate)

%extend StepBasic_CalendarDate {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepBasic_ConversionBasedUnit;
class StepBasic_ConversionBasedUnit : public StepBasic_NamedUnit {
	public:
		%feature("compactdefaultargs") ConversionFactor;
		%feature("autodoc", "	:rtype: opencascade::handle<StepBasic_MeasureWithUnit>
") ConversionFactor;
		opencascade::handle<StepBasic_MeasureWithUnit> ConversionFactor ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aDimensions:
	:type aDimensions: opencascade::handle<StepBasic_DimensionalExponents> &
	:param aName:
	:type aName: opencascade::handle<TCollection_HAsciiString> &
	:param aConversionFactor:
	:type aConversionFactor: opencascade::handle<StepBasic_MeasureWithUnit> &
	:rtype: None
") Init;
		void Init (const opencascade::handle<StepBasic_DimensionalExponents> & aDimensions,const opencascade::handle<TCollection_HAsciiString> & aName,const opencascade::handle<StepBasic_MeasureWithUnit> & aConversionFactor);
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "	:rtype: opencascade::handle<TCollection_HAsciiString>
") Name;
		opencascade::handle<TCollection_HAsciiString> Name ();
		%feature("compactdefaultargs") SetConversionFactor;
		%feature("autodoc", "	:param aConversionFactor:
	:type aConversionFactor: opencascade::handle<StepBasic_MeasureWithUnit> &
	:rtype: None
") SetConversionFactor;
		void SetConversionFactor (const opencascade::handle<StepBasic_MeasureWithUnit> & aConversionFactor);
		%feature("compactdefaultargs") SetName;
		%feature("autodoc", "	:param aName:
	:type aName: opencascade::handle<TCollection_HAsciiString> &
	:rtype: None
") SetName;
		void SetName (const opencascade::handle<TCollection_HAsciiString> & aName);
		%feature("compactdefaultargs") StepBasic_ConversionBasedUnit;
		%feature("autodoc", "	* Returns a ConversionBasedUnit

	:rtype: None
") StepBasic_ConversionBasedUnit;
		 StepBasic_ConversionBasedUnit ();
};


%make_alias(StepBasic_ConversionBasedUnit)

%extend StepBasic_ConversionBasedUnit {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepBasic_DigitalDocument;
class StepBasic_DigitalDocument : public StepBasic_Document {
	public:
		%feature("compactdefaultargs") StepBasic_DigitalDocument;
		%feature("autodoc", "	:rtype: None
") StepBasic_DigitalDocument;
		 StepBasic_DigitalDocument ();
};


%make_alias(StepBasic_DigitalDocument)

%extend StepBasic_DigitalDocument {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepBasic_DocumentFile;
class StepBasic_DocumentFile : public StepBasic_Document {
	public:
		%feature("compactdefaultargs") CharacterizedObject;
		%feature("autodoc", "	* Returns data for supertype CharacterizedObject

	:rtype: opencascade::handle<StepBasic_CharacterizedObject>
") CharacterizedObject;
		opencascade::handle<StepBasic_CharacterizedObject> CharacterizedObject ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	* Initialize all fields (own and inherited)

	:param aDocument_Id:
	:type aDocument_Id: opencascade::handle<TCollection_HAsciiString> &
	:param aDocument_Name:
	:type aDocument_Name: opencascade::handle<TCollection_HAsciiString> &
	:param hasDocument_Description:
	:type hasDocument_Description: bool
	:param aDocument_Description:
	:type aDocument_Description: opencascade::handle<TCollection_HAsciiString> &
	:param aDocument_Kind:
	:type aDocument_Kind: opencascade::handle<StepBasic_DocumentType> &
	:param aCharacterizedObject_Name:
	:type aCharacterizedObject_Name: opencascade::handle<TCollection_HAsciiString> &
	:param hasCharacterizedObject_Description:
	:type hasCharacterizedObject_Description: bool
	:param aCharacterizedObject_Description:
	:type aCharacterizedObject_Description: opencascade::handle<TCollection_HAsciiString> &
	:rtype: None
") Init;
		void Init (const opencascade::handle<TCollection_HAsciiString> & aDocument_Id,const opencascade::handle<TCollection_HAsciiString> & aDocument_Name,const Standard_Boolean hasDocument_Description,const opencascade::handle<TCollection_HAsciiString> & aDocument_Description,const opencascade::handle<StepBasic_DocumentType> & aDocument_Kind,const opencascade::handle<TCollection_HAsciiString> & aCharacterizedObject_Name,const Standard_Boolean hasCharacterizedObject_Description,const opencascade::handle<TCollection_HAsciiString> & aCharacterizedObject_Description);
		%feature("compactdefaultargs") SetCharacterizedObject;
		%feature("autodoc", "	* Set data for supertype CharacterizedObject

	:param CharacterizedObject:
	:type CharacterizedObject: opencascade::handle<StepBasic_CharacterizedObject> &
	:rtype: None
") SetCharacterizedObject;
		void SetCharacterizedObject (const opencascade::handle<StepBasic_CharacterizedObject> & CharacterizedObject);
		%feature("compactdefaultargs") StepBasic_DocumentFile;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") StepBasic_DocumentFile;
		 StepBasic_DocumentFile ();
};


%make_alias(StepBasic_DocumentFile)

%extend StepBasic_DocumentFile {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepBasic_DocumentProductEquivalence;
class StepBasic_DocumentProductEquivalence : public StepBasic_DocumentProductAssociation {
	public:
		%feature("compactdefaultargs") StepBasic_DocumentProductEquivalence;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") StepBasic_DocumentProductEquivalence;
		 StepBasic_DocumentProductEquivalence ();
};


%make_alias(StepBasic_DocumentProductEquivalence)

%extend StepBasic_DocumentProductEquivalence {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepBasic_ExternalIdentificationAssignment;
class StepBasic_ExternalIdentificationAssignment : public StepBasic_IdentificationAssignment {
	public:
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	* Initialize all fields (own and inherited)

	:param aIdentificationAssignment_AssignedId:
	:type aIdentificationAssignment_AssignedId: opencascade::handle<TCollection_HAsciiString> &
	:param aIdentificationAssignment_Role:
	:type aIdentificationAssignment_Role: opencascade::handle<StepBasic_IdentificationRole> &
	:param aSource:
	:type aSource: opencascade::handle<StepBasic_ExternalSource> &
	:rtype: None
") Init;
		void Init (const opencascade::handle<TCollection_HAsciiString> & aIdentificationAssignment_AssignedId,const opencascade::handle<StepBasic_IdentificationRole> & aIdentificationAssignment_Role,const opencascade::handle<StepBasic_ExternalSource> & aSource);
		%feature("compactdefaultargs") SetSource;
		%feature("autodoc", "	* Set field Source

	:param Source:
	:type Source: opencascade::handle<StepBasic_ExternalSource> &
	:rtype: None
") SetSource;
		void SetSource (const opencascade::handle<StepBasic_ExternalSource> & Source);
		%feature("compactdefaultargs") Source;
		%feature("autodoc", "	* Returns field Source

	:rtype: opencascade::handle<StepBasic_ExternalSource>
") Source;
		opencascade::handle<StepBasic_ExternalSource> Source ();
		%feature("compactdefaultargs") StepBasic_ExternalIdentificationAssignment;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") StepBasic_ExternalIdentificationAssignment;
		 StepBasic_ExternalIdentificationAssignment ();
};


%make_alias(StepBasic_ExternalIdentificationAssignment)

%extend StepBasic_ExternalIdentificationAssignment {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepBasic_LengthMeasureWithUnit;
class StepBasic_LengthMeasureWithUnit : public StepBasic_MeasureWithUnit {
	public:
		%feature("compactdefaultargs") StepBasic_LengthMeasureWithUnit;
		%feature("autodoc", "	* Returns a LengthMeasureWithUnit

	:rtype: None
") StepBasic_LengthMeasureWithUnit;
		 StepBasic_LengthMeasureWithUnit ();
};


%make_alias(StepBasic_LengthMeasureWithUnit)

%extend StepBasic_LengthMeasureWithUnit {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepBasic_LengthUnit;
class StepBasic_LengthUnit : public StepBasic_NamedUnit {
	public:
		%feature("compactdefaultargs") StepBasic_LengthUnit;
		%feature("autodoc", "	* Returns a LengthUnit

	:rtype: None
") StepBasic_LengthUnit;
		 StepBasic_LengthUnit ();
};


%make_alias(StepBasic_LengthUnit)

%extend StepBasic_LengthUnit {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepBasic_MassMeasureWithUnit;
class StepBasic_MassMeasureWithUnit : public StepBasic_MeasureWithUnit {
	public:
		%feature("compactdefaultargs") StepBasic_MassMeasureWithUnit;
		%feature("autodoc", "	* Returns a MassMeasureWithUnit

	:rtype: None
") StepBasic_MassMeasureWithUnit;
		 StepBasic_MassMeasureWithUnit ();
};


%make_alias(StepBasic_MassMeasureWithUnit)

%extend StepBasic_MassMeasureWithUnit {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepBasic_MassUnit;
class StepBasic_MassUnit : public StepBasic_NamedUnit {
	public:
		%feature("compactdefaultargs") StepBasic_MassUnit;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") StepBasic_MassUnit;
		 StepBasic_MassUnit ();
};


%make_alias(StepBasic_MassUnit)

%extend StepBasic_MassUnit {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepBasic_OrdinalDate;
class StepBasic_OrdinalDate : public StepBasic_Date {
	public:
		%feature("compactdefaultargs") DayComponent;
		%feature("autodoc", "	:rtype: int
") DayComponent;
		Standard_Integer DayComponent ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aYearComponent:
	:type aYearComponent: int
	:param aDayComponent:
	:type aDayComponent: int
	:rtype: None
") Init;
		void Init (const Standard_Integer aYearComponent,const Standard_Integer aDayComponent);
		%feature("compactdefaultargs") SetDayComponent;
		%feature("autodoc", "	:param aDayComponent:
	:type aDayComponent: int
	:rtype: None
") SetDayComponent;
		void SetDayComponent (const Standard_Integer aDayComponent);
		%feature("compactdefaultargs") StepBasic_OrdinalDate;
		%feature("autodoc", "	* Returns a OrdinalDate

	:rtype: None
") StepBasic_OrdinalDate;
		 StepBasic_OrdinalDate ();
};


%make_alias(StepBasic_OrdinalDate)

%extend StepBasic_OrdinalDate {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepBasic_OrganizationalAddress;
class StepBasic_OrganizationalAddress : public StepBasic_Address {
	public:
		%feature("compactdefaultargs") Description;
		%feature("autodoc", "	:rtype: opencascade::handle<TCollection_HAsciiString>
") Description;
		opencascade::handle<TCollection_HAsciiString> Description ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param hasAinternalLocation:
	:type hasAinternalLocation: bool
	:param aInternalLocation:
	:type aInternalLocation: opencascade::handle<TCollection_HAsciiString> &
	:param hasAstreetNumber:
	:type hasAstreetNumber: bool
	:param aStreetNumber:
	:type aStreetNumber: opencascade::handle<TCollection_HAsciiString> &
	:param hasAstreet:
	:type hasAstreet: bool
	:param aStreet:
	:type aStreet: opencascade::handle<TCollection_HAsciiString> &
	:param hasApostalBox:
	:type hasApostalBox: bool
	:param aPostalBox:
	:type aPostalBox: opencascade::handle<TCollection_HAsciiString> &
	:param hasAtown:
	:type hasAtown: bool
	:param aTown:
	:type aTown: opencascade::handle<TCollection_HAsciiString> &
	:param hasAregion:
	:type hasAregion: bool
	:param aRegion:
	:type aRegion: opencascade::handle<TCollection_HAsciiString> &
	:param hasApostalCode:
	:type hasApostalCode: bool
	:param aPostalCode:
	:type aPostalCode: opencascade::handle<TCollection_HAsciiString> &
	:param hasAcountry:
	:type hasAcountry: bool
	:param aCountry:
	:type aCountry: opencascade::handle<TCollection_HAsciiString> &
	:param hasAfacsimileNumber:
	:type hasAfacsimileNumber: bool
	:param aFacsimileNumber:
	:type aFacsimileNumber: opencascade::handle<TCollection_HAsciiString> &
	:param hasAtelephoneNumber:
	:type hasAtelephoneNumber: bool
	:param aTelephoneNumber:
	:type aTelephoneNumber: opencascade::handle<TCollection_HAsciiString> &
	:param hasAelectronicMailAddress:
	:type hasAelectronicMailAddress: bool
	:param aElectronicMailAddress:
	:type aElectronicMailAddress: opencascade::handle<TCollection_HAsciiString> &
	:param hasAtelexNumber:
	:type hasAtelexNumber: bool
	:param aTelexNumber:
	:type aTelexNumber: opencascade::handle<TCollection_HAsciiString> &
	:param aOrganizations:
	:type aOrganizations: opencascade::handle<StepBasic_HArray1OfOrganization> &
	:param aDescription:
	:type aDescription: opencascade::handle<TCollection_HAsciiString> &
	:rtype: None
") Init;
		void Init (const Standard_Boolean hasAinternalLocation,const opencascade::handle<TCollection_HAsciiString> & aInternalLocation,const Standard_Boolean hasAstreetNumber,const opencascade::handle<TCollection_HAsciiString> & aStreetNumber,const Standard_Boolean hasAstreet,const opencascade::handle<TCollection_HAsciiString> & aStreet,const Standard_Boolean hasApostalBox,const opencascade::handle<TCollection_HAsciiString> & aPostalBox,const Standard_Boolean hasAtown,const opencascade::handle<TCollection_HAsciiString> & aTown,const Standard_Boolean hasAregion,const opencascade::handle<TCollection_HAsciiString> & aRegion,const Standard_Boolean hasApostalCode,const opencascade::handle<TCollection_HAsciiString> & aPostalCode,const Standard_Boolean hasAcountry,const opencascade::handle<TCollection_HAsciiString> & aCountry,const Standard_Boolean hasAfacsimileNumber,const opencascade::handle<TCollection_HAsciiString> & aFacsimileNumber,const Standard_Boolean hasAtelephoneNumber,const opencascade::handle<TCollection_HAsciiString> & aTelephoneNumber,const Standard_Boolean hasAelectronicMailAddress,const opencascade::handle<TCollection_HAsciiString> & aElectronicMailAddress,const Standard_Boolean hasAtelexNumber,const opencascade::handle<TCollection_HAsciiString> & aTelexNumber,const opencascade::handle<StepBasic_HArray1OfOrganization> & aOrganizations,const opencascade::handle<TCollection_HAsciiString> & aDescription);
		%feature("compactdefaultargs") NbOrganizations;
		%feature("autodoc", "	:rtype: int
") NbOrganizations;
		Standard_Integer NbOrganizations ();
		%feature("compactdefaultargs") Organizations;
		%feature("autodoc", "	:rtype: opencascade::handle<StepBasic_HArray1OfOrganization>
") Organizations;
		opencascade::handle<StepBasic_HArray1OfOrganization> Organizations ();
		%feature("compactdefaultargs") OrganizationsValue;
		%feature("autodoc", "	:param num:
	:type num: int
	:rtype: opencascade::handle<StepBasic_Organization>
") OrganizationsValue;
		opencascade::handle<StepBasic_Organization> OrganizationsValue (const Standard_Integer num);
		%feature("compactdefaultargs") SetDescription;
		%feature("autodoc", "	:param aDescription:
	:type aDescription: opencascade::handle<TCollection_HAsciiString> &
	:rtype: None
") SetDescription;
		void SetDescription (const opencascade::handle<TCollection_HAsciiString> & aDescription);
		%feature("compactdefaultargs") SetOrganizations;
		%feature("autodoc", "	:param aOrganizations:
	:type aOrganizations: opencascade::handle<StepBasic_HArray1OfOrganization> &
	:rtype: None
") SetOrganizations;
		void SetOrganizations (const opencascade::handle<StepBasic_HArray1OfOrganization> & aOrganizations);
		%feature("compactdefaultargs") StepBasic_OrganizationalAddress;
		%feature("autodoc", "	* Returns a OrganizationalAddress

	:rtype: None
") StepBasic_OrganizationalAddress;
		 StepBasic_OrganizationalAddress ();
};


%make_alias(StepBasic_OrganizationalAddress)

%extend StepBasic_OrganizationalAddress {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepBasic_PersonalAddress;
class StepBasic_PersonalAddress : public StepBasic_Address {
	public:
		%feature("compactdefaultargs") Description;
		%feature("autodoc", "	:rtype: opencascade::handle<TCollection_HAsciiString>
") Description;
		opencascade::handle<TCollection_HAsciiString> Description ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param hasAinternalLocation:
	:type hasAinternalLocation: bool
	:param aInternalLocation:
	:type aInternalLocation: opencascade::handle<TCollection_HAsciiString> &
	:param hasAstreetNumber:
	:type hasAstreetNumber: bool
	:param aStreetNumber:
	:type aStreetNumber: opencascade::handle<TCollection_HAsciiString> &
	:param hasAstreet:
	:type hasAstreet: bool
	:param aStreet:
	:type aStreet: opencascade::handle<TCollection_HAsciiString> &
	:param hasApostalBox:
	:type hasApostalBox: bool
	:param aPostalBox:
	:type aPostalBox: opencascade::handle<TCollection_HAsciiString> &
	:param hasAtown:
	:type hasAtown: bool
	:param aTown:
	:type aTown: opencascade::handle<TCollection_HAsciiString> &
	:param hasAregion:
	:type hasAregion: bool
	:param aRegion:
	:type aRegion: opencascade::handle<TCollection_HAsciiString> &
	:param hasApostalCode:
	:type hasApostalCode: bool
	:param aPostalCode:
	:type aPostalCode: opencascade::handle<TCollection_HAsciiString> &
	:param hasAcountry:
	:type hasAcountry: bool
	:param aCountry:
	:type aCountry: opencascade::handle<TCollection_HAsciiString> &
	:param hasAfacsimileNumber:
	:type hasAfacsimileNumber: bool
	:param aFacsimileNumber:
	:type aFacsimileNumber: opencascade::handle<TCollection_HAsciiString> &
	:param hasAtelephoneNumber:
	:type hasAtelephoneNumber: bool
	:param aTelephoneNumber:
	:type aTelephoneNumber: opencascade::handle<TCollection_HAsciiString> &
	:param hasAelectronicMailAddress:
	:type hasAelectronicMailAddress: bool
	:param aElectronicMailAddress:
	:type aElectronicMailAddress: opencascade::handle<TCollection_HAsciiString> &
	:param hasAtelexNumber:
	:type hasAtelexNumber: bool
	:param aTelexNumber:
	:type aTelexNumber: opencascade::handle<TCollection_HAsciiString> &
	:param aPeople:
	:type aPeople: opencascade::handle<StepBasic_HArray1OfPerson> &
	:param aDescription:
	:type aDescription: opencascade::handle<TCollection_HAsciiString> &
	:rtype: None
") Init;
		void Init (const Standard_Boolean hasAinternalLocation,const opencascade::handle<TCollection_HAsciiString> & aInternalLocation,const Standard_Boolean hasAstreetNumber,const opencascade::handle<TCollection_HAsciiString> & aStreetNumber,const Standard_Boolean hasAstreet,const opencascade::handle<TCollection_HAsciiString> & aStreet,const Standard_Boolean hasApostalBox,const opencascade::handle<TCollection_HAsciiString> & aPostalBox,const Standard_Boolean hasAtown,const opencascade::handle<TCollection_HAsciiString> & aTown,const Standard_Boolean hasAregion,const opencascade::handle<TCollection_HAsciiString> & aRegion,const Standard_Boolean hasApostalCode,const opencascade::handle<TCollection_HAsciiString> & aPostalCode,const Standard_Boolean hasAcountry,const opencascade::handle<TCollection_HAsciiString> & aCountry,const Standard_Boolean hasAfacsimileNumber,const opencascade::handle<TCollection_HAsciiString> & aFacsimileNumber,const Standard_Boolean hasAtelephoneNumber,const opencascade::handle<TCollection_HAsciiString> & aTelephoneNumber,const Standard_Boolean hasAelectronicMailAddress,const opencascade::handle<TCollection_HAsciiString> & aElectronicMailAddress,const Standard_Boolean hasAtelexNumber,const opencascade::handle<TCollection_HAsciiString> & aTelexNumber,const opencascade::handle<StepBasic_HArray1OfPerson> & aPeople,const opencascade::handle<TCollection_HAsciiString> & aDescription);
		%feature("compactdefaultargs") NbPeople;
		%feature("autodoc", "	:rtype: int
") NbPeople;
		Standard_Integer NbPeople ();
		%feature("compactdefaultargs") People;
		%feature("autodoc", "	:rtype: opencascade::handle<StepBasic_HArray1OfPerson>
") People;
		opencascade::handle<StepBasic_HArray1OfPerson> People ();
		%feature("compactdefaultargs") PeopleValue;
		%feature("autodoc", "	:param num:
	:type num: int
	:rtype: opencascade::handle<StepBasic_Person>
") PeopleValue;
		opencascade::handle<StepBasic_Person> PeopleValue (const Standard_Integer num);
		%feature("compactdefaultargs") SetDescription;
		%feature("autodoc", "	:param aDescription:
	:type aDescription: opencascade::handle<TCollection_HAsciiString> &
	:rtype: None
") SetDescription;
		void SetDescription (const opencascade::handle<TCollection_HAsciiString> & aDescription);
		%feature("compactdefaultargs") SetPeople;
		%feature("autodoc", "	:param aPeople:
	:type aPeople: opencascade::handle<StepBasic_HArray1OfPerson> &
	:rtype: None
") SetPeople;
		void SetPeople (const opencascade::handle<StepBasic_HArray1OfPerson> & aPeople);
		%feature("compactdefaultargs") StepBasic_PersonalAddress;
		%feature("autodoc", "	* Returns a PersonalAddress

	:rtype: None
") StepBasic_PersonalAddress;
		 StepBasic_PersonalAddress ();
};


%make_alias(StepBasic_PersonalAddress)

%extend StepBasic_PersonalAddress {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepBasic_PhysicallyModeledProductDefinition;
class StepBasic_PhysicallyModeledProductDefinition : public StepBasic_ProductDefinition {
	public:
		%feature("compactdefaultargs") StepBasic_PhysicallyModeledProductDefinition;
		%feature("autodoc", "	:rtype: None
") StepBasic_PhysicallyModeledProductDefinition;
		 StepBasic_PhysicallyModeledProductDefinition ();
};


%make_alias(StepBasic_PhysicallyModeledProductDefinition)

%extend StepBasic_PhysicallyModeledProductDefinition {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepBasic_PlaneAngleMeasureWithUnit;
class StepBasic_PlaneAngleMeasureWithUnit : public StepBasic_MeasureWithUnit {
	public:
		%feature("compactdefaultargs") StepBasic_PlaneAngleMeasureWithUnit;
		%feature("autodoc", "	* Returns a PlaneAngleMeasureWithUnit

	:rtype: None
") StepBasic_PlaneAngleMeasureWithUnit;
		 StepBasic_PlaneAngleMeasureWithUnit ();
};


%make_alias(StepBasic_PlaneAngleMeasureWithUnit)

%extend StepBasic_PlaneAngleMeasureWithUnit {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepBasic_PlaneAngleUnit;
class StepBasic_PlaneAngleUnit : public StepBasic_NamedUnit {
	public:
		%feature("compactdefaultargs") StepBasic_PlaneAngleUnit;
		%feature("autodoc", "	* Returns a PlaneAngleUnit

	:rtype: None
") StepBasic_PlaneAngleUnit;
		 StepBasic_PlaneAngleUnit ();
};


%make_alias(StepBasic_PlaneAngleUnit)

%extend StepBasic_PlaneAngleUnit {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepBasic_ProductConceptContext;
class StepBasic_ProductConceptContext : public StepBasic_ApplicationContextElement {
	public:
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	* Initialize all fields (own and inherited)

	:param aApplicationContextElement_Name:
	:type aApplicationContextElement_Name: opencascade::handle<TCollection_HAsciiString> &
	:param aApplicationContextElement_FrameOfReference:
	:type aApplicationContextElement_FrameOfReference: opencascade::handle<StepBasic_ApplicationContext> &
	:param aMarketSegmentType:
	:type aMarketSegmentType: opencascade::handle<TCollection_HAsciiString> &
	:rtype: None
") Init;
		void Init (const opencascade::handle<TCollection_HAsciiString> & aApplicationContextElement_Name,const opencascade::handle<StepBasic_ApplicationContext> & aApplicationContextElement_FrameOfReference,const opencascade::handle<TCollection_HAsciiString> & aMarketSegmentType);
		%feature("compactdefaultargs") MarketSegmentType;
		%feature("autodoc", "	* Returns field MarketSegmentType

	:rtype: opencascade::handle<TCollection_HAsciiString>
") MarketSegmentType;
		opencascade::handle<TCollection_HAsciiString> MarketSegmentType ();
		%feature("compactdefaultargs") SetMarketSegmentType;
		%feature("autodoc", "	* Set field MarketSegmentType

	:param MarketSegmentType:
	:type MarketSegmentType: opencascade::handle<TCollection_HAsciiString> &
	:rtype: None
") SetMarketSegmentType;
		void SetMarketSegmentType (const opencascade::handle<TCollection_HAsciiString> & MarketSegmentType);
		%feature("compactdefaultargs") StepBasic_ProductConceptContext;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") StepBasic_ProductConceptContext;
		 StepBasic_ProductConceptContext ();
};


%make_alias(StepBasic_ProductConceptContext)

%extend StepBasic_ProductConceptContext {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepBasic_ProductContext;
class StepBasic_ProductContext : public StepBasic_ApplicationContextElement {
	public:
		%feature("compactdefaultargs") DisciplineType;
		%feature("autodoc", "	:rtype: opencascade::handle<TCollection_HAsciiString>
") DisciplineType;
		opencascade::handle<TCollection_HAsciiString> DisciplineType ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aName:
	:type aName: opencascade::handle<TCollection_HAsciiString> &
	:param aFrameOfReference:
	:type aFrameOfReference: opencascade::handle<StepBasic_ApplicationContext> &
	:param aDisciplineType:
	:type aDisciplineType: opencascade::handle<TCollection_HAsciiString> &
	:rtype: None
") Init;
		void Init (const opencascade::handle<TCollection_HAsciiString> & aName,const opencascade::handle<StepBasic_ApplicationContext> & aFrameOfReference,const opencascade::handle<TCollection_HAsciiString> & aDisciplineType);
		%feature("compactdefaultargs") SetDisciplineType;
		%feature("autodoc", "	:param aDisciplineType:
	:type aDisciplineType: opencascade::handle<TCollection_HAsciiString> &
	:rtype: None
") SetDisciplineType;
		void SetDisciplineType (const opencascade::handle<TCollection_HAsciiString> & aDisciplineType);
		%feature("compactdefaultargs") StepBasic_ProductContext;
		%feature("autodoc", "	* Returns a ProductContext

	:rtype: None
") StepBasic_ProductContext;
		 StepBasic_ProductContext ();
};


%make_alias(StepBasic_ProductContext)

%extend StepBasic_ProductContext {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepBasic_ProductDefinitionContext;
class StepBasic_ProductDefinitionContext : public StepBasic_ApplicationContextElement {
	public:
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aName:
	:type aName: opencascade::handle<TCollection_HAsciiString> &
	:param aFrameOfReference:
	:type aFrameOfReference: opencascade::handle<StepBasic_ApplicationContext> &
	:param aLifeCycleStage:
	:type aLifeCycleStage: opencascade::handle<TCollection_HAsciiString> &
	:rtype: None
") Init;
		void Init (const opencascade::handle<TCollection_HAsciiString> & aName,const opencascade::handle<StepBasic_ApplicationContext> & aFrameOfReference,const opencascade::handle<TCollection_HAsciiString> & aLifeCycleStage);
		%feature("compactdefaultargs") LifeCycleStage;
		%feature("autodoc", "	:rtype: opencascade::handle<TCollection_HAsciiString>
") LifeCycleStage;
		opencascade::handle<TCollection_HAsciiString> LifeCycleStage ();
		%feature("compactdefaultargs") SetLifeCycleStage;
		%feature("autodoc", "	:param aLifeCycleStage:
	:type aLifeCycleStage: opencascade::handle<TCollection_HAsciiString> &
	:rtype: None
") SetLifeCycleStage;
		void SetLifeCycleStage (const opencascade::handle<TCollection_HAsciiString> & aLifeCycleStage);
		%feature("compactdefaultargs") StepBasic_ProductDefinitionContext;
		%feature("autodoc", "	* Returns a ProductDefinitionContext

	:rtype: None
") StepBasic_ProductDefinitionContext;
		 StepBasic_ProductDefinitionContext ();
};


%make_alias(StepBasic_ProductDefinitionContext)

%extend StepBasic_ProductDefinitionContext {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepBasic_ProductDefinitionEffectivity;
class StepBasic_ProductDefinitionEffectivity : public StepBasic_Effectivity {
	public:
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aId:
	:type aId: opencascade::handle<TCollection_HAsciiString> &
	:param aUsage:
	:type aUsage: opencascade::handle<StepBasic_ProductDefinitionRelationship> &
	:rtype: None
") Init;
		void Init (const opencascade::handle<TCollection_HAsciiString> & aId,const opencascade::handle<StepBasic_ProductDefinitionRelationship> & aUsage);
		%feature("compactdefaultargs") SetUsage;
		%feature("autodoc", "	:param aUsage:
	:type aUsage: opencascade::handle<StepBasic_ProductDefinitionRelationship> &
	:rtype: None
") SetUsage;
		void SetUsage (const opencascade::handle<StepBasic_ProductDefinitionRelationship> & aUsage);
		%feature("compactdefaultargs") StepBasic_ProductDefinitionEffectivity;
		%feature("autodoc", "	:rtype: None
") StepBasic_ProductDefinitionEffectivity;
		 StepBasic_ProductDefinitionEffectivity ();
		%feature("compactdefaultargs") Usage;
		%feature("autodoc", "	:rtype: opencascade::handle<StepBasic_ProductDefinitionRelationship>
") Usage;
		opencascade::handle<StepBasic_ProductDefinitionRelationship> Usage ();
};


%make_alias(StepBasic_ProductDefinitionEffectivity)

%extend StepBasic_ProductDefinitionEffectivity {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepBasic_ProductDefinitionFormationWithSpecifiedSource;
class StepBasic_ProductDefinitionFormationWithSpecifiedSource : public StepBasic_ProductDefinitionFormation {
	public:
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aId:
	:type aId: opencascade::handle<TCollection_HAsciiString> &
	:param aDescription:
	:type aDescription: opencascade::handle<TCollection_HAsciiString> &
	:param aOfProduct:
	:type aOfProduct: opencascade::handle<StepBasic_Product> &
	:param aMakeOrBuy:
	:type aMakeOrBuy: StepBasic_Source
	:rtype: None
") Init;
		void Init (const opencascade::handle<TCollection_HAsciiString> & aId,const opencascade::handle<TCollection_HAsciiString> & aDescription,const opencascade::handle<StepBasic_Product> & aOfProduct,const StepBasic_Source aMakeOrBuy);
		%feature("compactdefaultargs") MakeOrBuy;
		%feature("autodoc", "	:rtype: StepBasic_Source
") MakeOrBuy;
		StepBasic_Source MakeOrBuy ();
		%feature("compactdefaultargs") SetMakeOrBuy;
		%feature("autodoc", "	:param aMakeOrBuy:
	:type aMakeOrBuy: StepBasic_Source
	:rtype: None
") SetMakeOrBuy;
		void SetMakeOrBuy (const StepBasic_Source aMakeOrBuy);
		%feature("compactdefaultargs") StepBasic_ProductDefinitionFormationWithSpecifiedSource;
		%feature("autodoc", "	* Returns a ProductDefinitionFormationWithSpecifiedSource

	:rtype: None
") StepBasic_ProductDefinitionFormationWithSpecifiedSource;
		 StepBasic_ProductDefinitionFormationWithSpecifiedSource ();
};


%make_alias(StepBasic_ProductDefinitionFormationWithSpecifiedSource)

%extend StepBasic_ProductDefinitionFormationWithSpecifiedSource {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepBasic_ProductDefinitionReferenceWithLocalRepresentation;
class StepBasic_ProductDefinitionReferenceWithLocalRepresentation : public StepBasic_ProductDefinition {
	public:
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param theSource:
	:type theSource: opencascade::handle<StepBasic_ExternalSource> &
	:param theId:
	:type theId: opencascade::handle<TCollection_HAsciiString> &
	:param theDescription:
	:type theDescription: opencascade::handle<TCollection_HAsciiString> &
	:param theFormation:
	:type theFormation: opencascade::handle<StepBasic_ProductDefinitionFormation> &
	:param theFrameOfReference:
	:type theFrameOfReference: opencascade::handle<StepBasic_ProductDefinitionContext> &
	:rtype: None
") Init;
		void Init (const opencascade::handle<StepBasic_ExternalSource> & theSource,const opencascade::handle<TCollection_HAsciiString> & theId,const opencascade::handle<TCollection_HAsciiString> & theDescription,const opencascade::handle<StepBasic_ProductDefinitionFormation> & theFormation,const opencascade::handle<StepBasic_ProductDefinitionContext> & theFrameOfReference);
		%feature("compactdefaultargs") SetSource;
		%feature("autodoc", "	* Set field Source

	:param theSource:
	:type theSource: opencascade::handle<StepBasic_ExternalSource> &
	:rtype: inline void
") SetSource;
		inline void SetSource (const opencascade::handle<StepBasic_ExternalSource> & theSource);
		%feature("compactdefaultargs") Source;
		%feature("autodoc", "	* Returns field Source

	:rtype: inline opencascade::handle<StepBasic_ExternalSource>
") Source;
		inline opencascade::handle<StepBasic_ExternalSource> Source ();
		%feature("compactdefaultargs") StepBasic_ProductDefinitionReferenceWithLocalRepresentation;
		%feature("autodoc", "	* Returns a ProductDefinitionReferenceWithLocalRepresentation

	:rtype: None
") StepBasic_ProductDefinitionReferenceWithLocalRepresentation;
		 StepBasic_ProductDefinitionReferenceWithLocalRepresentation ();
};


%make_alias(StepBasic_ProductDefinitionReferenceWithLocalRepresentation)

%extend StepBasic_ProductDefinitionReferenceWithLocalRepresentation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepBasic_ProductDefinitionWithAssociatedDocuments;
class StepBasic_ProductDefinitionWithAssociatedDocuments : public StepBasic_ProductDefinition {
	public:
		%feature("compactdefaultargs") DocIds;
		%feature("autodoc", "	:rtype: opencascade::handle<StepBasic_HArray1OfDocument>
") DocIds;
		opencascade::handle<StepBasic_HArray1OfDocument> DocIds ();
		%feature("compactdefaultargs") DocIdsValue;
		%feature("autodoc", "	:param num:
	:type num: int
	:rtype: opencascade::handle<StepBasic_Document>
") DocIdsValue;
		opencascade::handle<StepBasic_Document> DocIdsValue (const Standard_Integer num);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aId:
	:type aId: opencascade::handle<TCollection_HAsciiString> &
	:param aDescription:
	:type aDescription: opencascade::handle<TCollection_HAsciiString> &
	:param aFormation:
	:type aFormation: opencascade::handle<StepBasic_ProductDefinitionFormation> &
	:param aFrame:
	:type aFrame: opencascade::handle<StepBasic_ProductDefinitionContext> &
	:param aDocIds:
	:type aDocIds: opencascade::handle<StepBasic_HArray1OfDocument> &
	:rtype: None
") Init;
		void Init (const opencascade::handle<TCollection_HAsciiString> & aId,const opencascade::handle<TCollection_HAsciiString> & aDescription,const opencascade::handle<StepBasic_ProductDefinitionFormation> & aFormation,const opencascade::handle<StepBasic_ProductDefinitionContext> & aFrame,const opencascade::handle<StepBasic_HArray1OfDocument> & aDocIds);
		%feature("compactdefaultargs") NbDocIds;
		%feature("autodoc", "	:rtype: int
") NbDocIds;
		Standard_Integer NbDocIds ();
		%feature("compactdefaultargs") SetDocIds;
		%feature("autodoc", "	:param DocIds:
	:type DocIds: opencascade::handle<StepBasic_HArray1OfDocument> &
	:rtype: None
") SetDocIds;
		void SetDocIds (const opencascade::handle<StepBasic_HArray1OfDocument> & DocIds);
		%feature("compactdefaultargs") SetDocIdsValue;
		%feature("autodoc", "	:param num:
	:type num: int
	:param adoc:
	:type adoc: opencascade::handle<StepBasic_Document> &
	:rtype: None
") SetDocIdsValue;
		void SetDocIdsValue (const Standard_Integer num,const opencascade::handle<StepBasic_Document> & adoc);
		%feature("compactdefaultargs") StepBasic_ProductDefinitionWithAssociatedDocuments;
		%feature("autodoc", "	:rtype: None
") StepBasic_ProductDefinitionWithAssociatedDocuments;
		 StepBasic_ProductDefinitionWithAssociatedDocuments ();
};


%make_alias(StepBasic_ProductDefinitionWithAssociatedDocuments)

%extend StepBasic_ProductDefinitionWithAssociatedDocuments {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepBasic_ProductRelatedProductCategory;
class StepBasic_ProductRelatedProductCategory : public StepBasic_ProductCategory {
	public:
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aName:
	:type aName: opencascade::handle<TCollection_HAsciiString> &
	:param hasAdescription:
	:type hasAdescription: bool
	:param aDescription:
	:type aDescription: opencascade::handle<TCollection_HAsciiString> &
	:param aProducts:
	:type aProducts: opencascade::handle<StepBasic_HArray1OfProduct> &
	:rtype: None
") Init;
		void Init (const opencascade::handle<TCollection_HAsciiString> & aName,const Standard_Boolean hasAdescription,const opencascade::handle<TCollection_HAsciiString> & aDescription,const opencascade::handle<StepBasic_HArray1OfProduct> & aProducts);
		%feature("compactdefaultargs") NbProducts;
		%feature("autodoc", "	:rtype: int
") NbProducts;
		Standard_Integer NbProducts ();
		%feature("compactdefaultargs") Products;
		%feature("autodoc", "	:rtype: opencascade::handle<StepBasic_HArray1OfProduct>
") Products;
		opencascade::handle<StepBasic_HArray1OfProduct> Products ();
		%feature("compactdefaultargs") ProductsValue;
		%feature("autodoc", "	:param num:
	:type num: int
	:rtype: opencascade::handle<StepBasic_Product>
") ProductsValue;
		opencascade::handle<StepBasic_Product> ProductsValue (const Standard_Integer num);
		%feature("compactdefaultargs") SetProducts;
		%feature("autodoc", "	:param aProducts:
	:type aProducts: opencascade::handle<StepBasic_HArray1OfProduct> &
	:rtype: None
") SetProducts;
		void SetProducts (const opencascade::handle<StepBasic_HArray1OfProduct> & aProducts);
		%feature("compactdefaultargs") StepBasic_ProductRelatedProductCategory;
		%feature("autodoc", "	* Returns a ProductRelatedProductCategory

	:rtype: None
") StepBasic_ProductRelatedProductCategory;
		 StepBasic_ProductRelatedProductCategory ();
};


%make_alias(StepBasic_ProductRelatedProductCategory)

%extend StepBasic_ProductRelatedProductCategory {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepBasic_RatioMeasureWithUnit;
class StepBasic_RatioMeasureWithUnit : public StepBasic_MeasureWithUnit {
	public:
		%feature("compactdefaultargs") StepBasic_RatioMeasureWithUnit;
		%feature("autodoc", "	* Returns a RatioMeasureWithUnit

	:rtype: None
") StepBasic_RatioMeasureWithUnit;
		 StepBasic_RatioMeasureWithUnit ();
};


%make_alias(StepBasic_RatioMeasureWithUnit)

%extend StepBasic_RatioMeasureWithUnit {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepBasic_RatioUnit;
class StepBasic_RatioUnit : public StepBasic_NamedUnit {
	public:
		%feature("compactdefaultargs") StepBasic_RatioUnit;
		%feature("autodoc", "	* Returns a RatioUnit

	:rtype: None
") StepBasic_RatioUnit;
		 StepBasic_RatioUnit ();
};


%make_alias(StepBasic_RatioUnit)

%extend StepBasic_RatioUnit {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepBasic_SiUnit;
class StepBasic_SiUnit : public StepBasic_NamedUnit {
	public:
		%feature("compactdefaultargs") Dimensions;
		%feature("autodoc", "	:rtype: opencascade::handle<StepBasic_DimensionalExponents>
") Dimensions;
		virtual opencascade::handle<StepBasic_DimensionalExponents> Dimensions ();
		%feature("compactdefaultargs") HasPrefix;
		%feature("autodoc", "	:rtype: bool
") HasPrefix;
		Standard_Boolean HasPrefix ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param hasAprefix:
	:type hasAprefix: bool
	:param aPrefix:
	:type aPrefix: StepBasic_SiPrefix
	:param aName:
	:type aName: StepBasic_SiUnitName
	:rtype: None
") Init;
		void Init (const Standard_Boolean hasAprefix,const StepBasic_SiPrefix aPrefix,const StepBasic_SiUnitName aName);
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "	:rtype: StepBasic_SiUnitName
") Name;
		StepBasic_SiUnitName Name ();
		%feature("compactdefaultargs") Prefix;
		%feature("autodoc", "	:rtype: StepBasic_SiPrefix
") Prefix;
		StepBasic_SiPrefix Prefix ();
		%feature("compactdefaultargs") SetDimensions;
		%feature("autodoc", "	:param aDimensions:
	:type aDimensions: opencascade::handle<StepBasic_DimensionalExponents> &
	:rtype: void
") SetDimensions;
		virtual void SetDimensions (const opencascade::handle<StepBasic_DimensionalExponents> & aDimensions);
		%feature("compactdefaultargs") SetName;
		%feature("autodoc", "	:param aName:
	:type aName: StepBasic_SiUnitName
	:rtype: None
") SetName;
		void SetName (const StepBasic_SiUnitName aName);
		%feature("compactdefaultargs") SetPrefix;
		%feature("autodoc", "	:param aPrefix:
	:type aPrefix: StepBasic_SiPrefix
	:rtype: None
") SetPrefix;
		void SetPrefix (const StepBasic_SiPrefix aPrefix);
		%feature("compactdefaultargs") StepBasic_SiUnit;
		%feature("autodoc", "	* Returns a SiUnit

	:rtype: None
") StepBasic_SiUnit;
		 StepBasic_SiUnit ();
		%feature("compactdefaultargs") UnSetPrefix;
		%feature("autodoc", "	:rtype: None
") UnSetPrefix;
		void UnSetPrefix ();
};


%make_alias(StepBasic_SiUnit)

%extend StepBasic_SiUnit {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepBasic_SolidAngleMeasureWithUnit;
class StepBasic_SolidAngleMeasureWithUnit : public StepBasic_MeasureWithUnit {
	public:
		%feature("compactdefaultargs") StepBasic_SolidAngleMeasureWithUnit;
		%feature("autodoc", "	* Returns a SolidAngleMeasureWithUnit

	:rtype: None
") StepBasic_SolidAngleMeasureWithUnit;
		 StepBasic_SolidAngleMeasureWithUnit ();
};


%make_alias(StepBasic_SolidAngleMeasureWithUnit)

%extend StepBasic_SolidAngleMeasureWithUnit {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepBasic_SolidAngleUnit;
class StepBasic_SolidAngleUnit : public StepBasic_NamedUnit {
	public:
		%feature("compactdefaultargs") StepBasic_SolidAngleUnit;
		%feature("autodoc", "	* Returns a SolidAngleUnit

	:rtype: None
") StepBasic_SolidAngleUnit;
		 StepBasic_SolidAngleUnit ();
};


%make_alias(StepBasic_SolidAngleUnit)

%extend StepBasic_SolidAngleUnit {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepBasic_ThermodynamicTemperatureUnit;
class StepBasic_ThermodynamicTemperatureUnit : public StepBasic_NamedUnit {
	public:
		%feature("compactdefaultargs") StepBasic_ThermodynamicTemperatureUnit;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") StepBasic_ThermodynamicTemperatureUnit;
		 StepBasic_ThermodynamicTemperatureUnit ();
};


%make_alias(StepBasic_ThermodynamicTemperatureUnit)

%extend StepBasic_ThermodynamicTemperatureUnit {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepBasic_TimeMeasureWithUnit;
class StepBasic_TimeMeasureWithUnit : public StepBasic_MeasureWithUnit {
	public:
		%feature("compactdefaultargs") StepBasic_TimeMeasureWithUnit;
		%feature("autodoc", "	* Returns a TimeMeasureWithUnit

	:rtype: None
") StepBasic_TimeMeasureWithUnit;
		 StepBasic_TimeMeasureWithUnit ();
};


%make_alias(StepBasic_TimeMeasureWithUnit)

%extend StepBasic_TimeMeasureWithUnit {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepBasic_TimeUnit;
class StepBasic_TimeUnit : public StepBasic_NamedUnit {
	public:
		%feature("compactdefaultargs") StepBasic_TimeUnit;
		%feature("autodoc", "	* Returns a TimeUnit

	:rtype: None
") StepBasic_TimeUnit;
		 StepBasic_TimeUnit ();
};


%make_alias(StepBasic_TimeUnit)

%extend StepBasic_TimeUnit {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepBasic_UncertaintyMeasureWithUnit;
class StepBasic_UncertaintyMeasureWithUnit : public StepBasic_MeasureWithUnit {
	public:
		%feature("compactdefaultargs") Description;
		%feature("autodoc", "	:rtype: opencascade::handle<TCollection_HAsciiString>
") Description;
		opencascade::handle<TCollection_HAsciiString> Description ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aValueComponent:
	:type aValueComponent: opencascade::handle<StepBasic_MeasureValueMember> &
	:param aUnitComponent:
	:type aUnitComponent: StepBasic_Unit &
	:param aName:
	:type aName: opencascade::handle<TCollection_HAsciiString> &
	:param aDescription:
	:type aDescription: opencascade::handle<TCollection_HAsciiString> &
	:rtype: None
") Init;
		void Init (const opencascade::handle<StepBasic_MeasureValueMember> & aValueComponent,const StepBasic_Unit & aUnitComponent,const opencascade::handle<TCollection_HAsciiString> & aName,const opencascade::handle<TCollection_HAsciiString> & aDescription);
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "	:rtype: opencascade::handle<TCollection_HAsciiString>
") Name;
		opencascade::handle<TCollection_HAsciiString> Name ();
		%feature("compactdefaultargs") SetDescription;
		%feature("autodoc", "	:param aDescription:
	:type aDescription: opencascade::handle<TCollection_HAsciiString> &
	:rtype: None
") SetDescription;
		void SetDescription (const opencascade::handle<TCollection_HAsciiString> & aDescription);
		%feature("compactdefaultargs") SetName;
		%feature("autodoc", "	:param aName:
	:type aName: opencascade::handle<TCollection_HAsciiString> &
	:rtype: None
") SetName;
		void SetName (const opencascade::handle<TCollection_HAsciiString> & aName);
		%feature("compactdefaultargs") StepBasic_UncertaintyMeasureWithUnit;
		%feature("autodoc", "	* Returns a UncertaintyMeasureWithUnit

	:rtype: None
") StepBasic_UncertaintyMeasureWithUnit;
		 StepBasic_UncertaintyMeasureWithUnit ();
};


%make_alias(StepBasic_UncertaintyMeasureWithUnit)

%extend StepBasic_UncertaintyMeasureWithUnit {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepBasic_VolumeUnit;
class StepBasic_VolumeUnit : public StepBasic_NamedUnit {
	public:
		%feature("compactdefaultargs") StepBasic_VolumeUnit;
		%feature("autodoc", "	:rtype: None
") StepBasic_VolumeUnit;
		 StepBasic_VolumeUnit ();
};


%make_alias(StepBasic_VolumeUnit)

%extend StepBasic_VolumeUnit {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepBasic_WeekOfYearAndDayDate;
class StepBasic_WeekOfYearAndDayDate : public StepBasic_Date {
	public:
		%feature("compactdefaultargs") DayComponent;
		%feature("autodoc", "	:rtype: int
") DayComponent;
		Standard_Integer DayComponent ();
		%feature("compactdefaultargs") HasDayComponent;
		%feature("autodoc", "	:rtype: bool
") HasDayComponent;
		Standard_Boolean HasDayComponent ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aYearComponent:
	:type aYearComponent: int
	:param aWeekComponent:
	:type aWeekComponent: int
	:param hasAdayComponent:
	:type hasAdayComponent: bool
	:param aDayComponent:
	:type aDayComponent: int
	:rtype: None
") Init;
		void Init (const Standard_Integer aYearComponent,const Standard_Integer aWeekComponent,const Standard_Boolean hasAdayComponent,const Standard_Integer aDayComponent);
		%feature("compactdefaultargs") SetDayComponent;
		%feature("autodoc", "	:param aDayComponent:
	:type aDayComponent: int
	:rtype: None
") SetDayComponent;
		void SetDayComponent (const Standard_Integer aDayComponent);
		%feature("compactdefaultargs") SetWeekComponent;
		%feature("autodoc", "	:param aWeekComponent:
	:type aWeekComponent: int
	:rtype: None
") SetWeekComponent;
		void SetWeekComponent (const Standard_Integer aWeekComponent);
		%feature("compactdefaultargs") StepBasic_WeekOfYearAndDayDate;
		%feature("autodoc", "	* Returns a WeekOfYearAndDayDate

	:rtype: None
") StepBasic_WeekOfYearAndDayDate;
		 StepBasic_WeekOfYearAndDayDate ();
		%feature("compactdefaultargs") UnSetDayComponent;
		%feature("autodoc", "	:rtype: None
") UnSetDayComponent;
		void UnSetDayComponent ();
		%feature("compactdefaultargs") WeekComponent;
		%feature("autodoc", "	:rtype: int
") WeekComponent;
		Standard_Integer WeekComponent ();
};


%make_alias(StepBasic_WeekOfYearAndDayDate)

%extend StepBasic_WeekOfYearAndDayDate {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepBasic_ConversionBasedUnitAndAreaUnit;
class StepBasic_ConversionBasedUnitAndAreaUnit : public StepBasic_ConversionBasedUnit {
	public:
		%feature("compactdefaultargs") AreaUnit;
		%feature("autodoc", "	:rtype: opencascade::handle<StepBasic_AreaUnit>
") AreaUnit;
		opencascade::handle<StepBasic_AreaUnit> AreaUnit ();
		%feature("compactdefaultargs") SetAreaUnit;
		%feature("autodoc", "	:param anAreaUnit:
	:type anAreaUnit: opencascade::handle<StepBasic_AreaUnit> &
	:rtype: None
") SetAreaUnit;
		void SetAreaUnit (const opencascade::handle<StepBasic_AreaUnit> & anAreaUnit);
		%feature("compactdefaultargs") StepBasic_ConversionBasedUnitAndAreaUnit;
		%feature("autodoc", "	* Returns a ConversionBasedUnitAndAreaUnit

	:rtype: None
") StepBasic_ConversionBasedUnitAndAreaUnit;
		 StepBasic_ConversionBasedUnitAndAreaUnit ();
};


%make_alias(StepBasic_ConversionBasedUnitAndAreaUnit)

%extend StepBasic_ConversionBasedUnitAndAreaUnit {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepBasic_ConversionBasedUnitAndLengthUnit;
class StepBasic_ConversionBasedUnitAndLengthUnit : public StepBasic_ConversionBasedUnit {
	public:
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aDimensions:
	:type aDimensions: opencascade::handle<StepBasic_DimensionalExponents> &
	:param aName:
	:type aName: opencascade::handle<TCollection_HAsciiString> &
	:param aConversionFactor:
	:type aConversionFactor: opencascade::handle<StepBasic_MeasureWithUnit> &
	:rtype: None
") Init;
		void Init (const opencascade::handle<StepBasic_DimensionalExponents> & aDimensions,const opencascade::handle<TCollection_HAsciiString> & aName,const opencascade::handle<StepBasic_MeasureWithUnit> & aConversionFactor);
		%feature("compactdefaultargs") LengthUnit;
		%feature("autodoc", "	:rtype: opencascade::handle<StepBasic_LengthUnit>
") LengthUnit;
		opencascade::handle<StepBasic_LengthUnit> LengthUnit ();
		%feature("compactdefaultargs") SetLengthUnit;
		%feature("autodoc", "	:param aLengthUnit:
	:type aLengthUnit: opencascade::handle<StepBasic_LengthUnit> &
	:rtype: None
") SetLengthUnit;
		void SetLengthUnit (const opencascade::handle<StepBasic_LengthUnit> & aLengthUnit);
		%feature("compactdefaultargs") StepBasic_ConversionBasedUnitAndLengthUnit;
		%feature("autodoc", "	* Returns a ConversionBasedUnitAndLengthUnit

	:rtype: None
") StepBasic_ConversionBasedUnitAndLengthUnit;
		 StepBasic_ConversionBasedUnitAndLengthUnit ();
};


%make_alias(StepBasic_ConversionBasedUnitAndLengthUnit)

%extend StepBasic_ConversionBasedUnitAndLengthUnit {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepBasic_ConversionBasedUnitAndMassUnit;
class StepBasic_ConversionBasedUnitAndMassUnit : public StepBasic_ConversionBasedUnit {
	public:
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aDimensions:
	:type aDimensions: opencascade::handle<StepBasic_DimensionalExponents> &
	:param aName:
	:type aName: opencascade::handle<TCollection_HAsciiString> &
	:param aConversionFactor:
	:type aConversionFactor: opencascade::handle<StepBasic_MeasureWithUnit> &
	:rtype: None
") Init;
		void Init (const opencascade::handle<StepBasic_DimensionalExponents> & aDimensions,const opencascade::handle<TCollection_HAsciiString> & aName,const opencascade::handle<StepBasic_MeasureWithUnit> & aConversionFactor);
		%feature("compactdefaultargs") MassUnit;
		%feature("autodoc", "	:rtype: opencascade::handle<StepBasic_MassUnit>
") MassUnit;
		opencascade::handle<StepBasic_MassUnit> MassUnit ();
		%feature("compactdefaultargs") SetMassUnit;
		%feature("autodoc", "	:param aMassUnit:
	:type aMassUnit: opencascade::handle<StepBasic_MassUnit> &
	:rtype: None
") SetMassUnit;
		void SetMassUnit (const opencascade::handle<StepBasic_MassUnit> & aMassUnit);
		%feature("compactdefaultargs") StepBasic_ConversionBasedUnitAndMassUnit;
		%feature("autodoc", "	* Returns a ConversionBasedUnitAndLengthUnit

	:rtype: None
") StepBasic_ConversionBasedUnitAndMassUnit;
		 StepBasic_ConversionBasedUnitAndMassUnit ();
};


%make_alias(StepBasic_ConversionBasedUnitAndMassUnit)

%extend StepBasic_ConversionBasedUnitAndMassUnit {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepBasic_ConversionBasedUnitAndPlaneAngleUnit;
class StepBasic_ConversionBasedUnitAndPlaneAngleUnit : public StepBasic_ConversionBasedUnit {
	public:
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aDimensions:
	:type aDimensions: opencascade::handle<StepBasic_DimensionalExponents> &
	:param aName:
	:type aName: opencascade::handle<TCollection_HAsciiString> &
	:param aConversionFactor:
	:type aConversionFactor: opencascade::handle<StepBasic_MeasureWithUnit> &
	:rtype: None
") Init;
		void Init (const opencascade::handle<StepBasic_DimensionalExponents> & aDimensions,const opencascade::handle<TCollection_HAsciiString> & aName,const opencascade::handle<StepBasic_MeasureWithUnit> & aConversionFactor);
		%feature("compactdefaultargs") PlaneAngleUnit;
		%feature("autodoc", "	:rtype: opencascade::handle<StepBasic_PlaneAngleUnit>
") PlaneAngleUnit;
		opencascade::handle<StepBasic_PlaneAngleUnit> PlaneAngleUnit ();
		%feature("compactdefaultargs") SetPlaneAngleUnit;
		%feature("autodoc", "	:param aPlaneAngleUnit:
	:type aPlaneAngleUnit: opencascade::handle<StepBasic_PlaneAngleUnit> &
	:rtype: None
") SetPlaneAngleUnit;
		void SetPlaneAngleUnit (const opencascade::handle<StepBasic_PlaneAngleUnit> & aPlaneAngleUnit);
		%feature("compactdefaultargs") StepBasic_ConversionBasedUnitAndPlaneAngleUnit;
		%feature("autodoc", "	* Returns a ConversionBasedUnitAndPlaneAngleUnit

	:rtype: None
") StepBasic_ConversionBasedUnitAndPlaneAngleUnit;
		 StepBasic_ConversionBasedUnitAndPlaneAngleUnit ();
};


%make_alias(StepBasic_ConversionBasedUnitAndPlaneAngleUnit)

%extend StepBasic_ConversionBasedUnitAndPlaneAngleUnit {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepBasic_ConversionBasedUnitAndRatioUnit;
class StepBasic_ConversionBasedUnitAndRatioUnit : public StepBasic_ConversionBasedUnit {
	public:
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aDimensions:
	:type aDimensions: opencascade::handle<StepBasic_DimensionalExponents> &
	:param aName:
	:type aName: opencascade::handle<TCollection_HAsciiString> &
	:param aConversionFactor:
	:type aConversionFactor: opencascade::handle<StepBasic_MeasureWithUnit> &
	:rtype: None
") Init;
		void Init (const opencascade::handle<StepBasic_DimensionalExponents> & aDimensions,const opencascade::handle<TCollection_HAsciiString> & aName,const opencascade::handle<StepBasic_MeasureWithUnit> & aConversionFactor);
		%feature("compactdefaultargs") RatioUnit;
		%feature("autodoc", "	:rtype: opencascade::handle<StepBasic_RatioUnit>
") RatioUnit;
		opencascade::handle<StepBasic_RatioUnit> RatioUnit ();
		%feature("compactdefaultargs") SetRatioUnit;
		%feature("autodoc", "	:param aRatioUnit:
	:type aRatioUnit: opencascade::handle<StepBasic_RatioUnit> &
	:rtype: None
") SetRatioUnit;
		void SetRatioUnit (const opencascade::handle<StepBasic_RatioUnit> & aRatioUnit);
		%feature("compactdefaultargs") StepBasic_ConversionBasedUnitAndRatioUnit;
		%feature("autodoc", "	* Returns a ConversionBasedUnitAndRatioUnit

	:rtype: None
") StepBasic_ConversionBasedUnitAndRatioUnit;
		 StepBasic_ConversionBasedUnitAndRatioUnit ();
};


%make_alias(StepBasic_ConversionBasedUnitAndRatioUnit)

%extend StepBasic_ConversionBasedUnitAndRatioUnit {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepBasic_ConversionBasedUnitAndSolidAngleUnit;
class StepBasic_ConversionBasedUnitAndSolidAngleUnit : public StepBasic_ConversionBasedUnit {
	public:
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aDimensions:
	:type aDimensions: opencascade::handle<StepBasic_DimensionalExponents> &
	:param aName:
	:type aName: opencascade::handle<TCollection_HAsciiString> &
	:param aConversionFactor:
	:type aConversionFactor: opencascade::handle<StepBasic_MeasureWithUnit> &
	:rtype: None
") Init;
		void Init (const opencascade::handle<StepBasic_DimensionalExponents> & aDimensions,const opencascade::handle<TCollection_HAsciiString> & aName,const opencascade::handle<StepBasic_MeasureWithUnit> & aConversionFactor);
		%feature("compactdefaultargs") SetSolidAngleUnit;
		%feature("autodoc", "	:param aSolidAngleUnit:
	:type aSolidAngleUnit: opencascade::handle<StepBasic_SolidAngleUnit> &
	:rtype: None
") SetSolidAngleUnit;
		void SetSolidAngleUnit (const opencascade::handle<StepBasic_SolidAngleUnit> & aSolidAngleUnit);
		%feature("compactdefaultargs") SolidAngleUnit;
		%feature("autodoc", "	:rtype: opencascade::handle<StepBasic_SolidAngleUnit>
") SolidAngleUnit;
		opencascade::handle<StepBasic_SolidAngleUnit> SolidAngleUnit ();
		%feature("compactdefaultargs") StepBasic_ConversionBasedUnitAndSolidAngleUnit;
		%feature("autodoc", "	* Returns a ConversionBasedUnitAndSolidAngleUnit

	:rtype: None
") StepBasic_ConversionBasedUnitAndSolidAngleUnit;
		 StepBasic_ConversionBasedUnitAndSolidAngleUnit ();
};


%make_alias(StepBasic_ConversionBasedUnitAndSolidAngleUnit)

%extend StepBasic_ConversionBasedUnitAndSolidAngleUnit {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepBasic_ConversionBasedUnitAndTimeUnit;
class StepBasic_ConversionBasedUnitAndTimeUnit : public StepBasic_ConversionBasedUnit {
	public:
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aDimensions:
	:type aDimensions: opencascade::handle<StepBasic_DimensionalExponents> &
	:param aName:
	:type aName: opencascade::handle<TCollection_HAsciiString> &
	:param aConversionFactor:
	:type aConversionFactor: opencascade::handle<StepBasic_MeasureWithUnit> &
	:rtype: None
") Init;
		void Init (const opencascade::handle<StepBasic_DimensionalExponents> & aDimensions,const opencascade::handle<TCollection_HAsciiString> & aName,const opencascade::handle<StepBasic_MeasureWithUnit> & aConversionFactor);
		%feature("compactdefaultargs") SetTimeUnit;
		%feature("autodoc", "	:param aTimeUnit:
	:type aTimeUnit: opencascade::handle<StepBasic_TimeUnit> &
	:rtype: None
") SetTimeUnit;
		void SetTimeUnit (const opencascade::handle<StepBasic_TimeUnit> & aTimeUnit);
		%feature("compactdefaultargs") StepBasic_ConversionBasedUnitAndTimeUnit;
		%feature("autodoc", "	* Returns a ConversionBasedUnitAndTimeUnit

	:rtype: None
") StepBasic_ConversionBasedUnitAndTimeUnit;
		 StepBasic_ConversionBasedUnitAndTimeUnit ();
		%feature("compactdefaultargs") TimeUnit;
		%feature("autodoc", "	:rtype: opencascade::handle<StepBasic_TimeUnit>
") TimeUnit;
		opencascade::handle<StepBasic_TimeUnit> TimeUnit ();
};


%make_alias(StepBasic_ConversionBasedUnitAndTimeUnit)

%extend StepBasic_ConversionBasedUnitAndTimeUnit {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepBasic_ConversionBasedUnitAndVolumeUnit;
class StepBasic_ConversionBasedUnitAndVolumeUnit : public StepBasic_ConversionBasedUnit {
	public:
		%feature("compactdefaultargs") SetVolumeUnit;
		%feature("autodoc", "	:param aVolumeUnit:
	:type aVolumeUnit: opencascade::handle<StepBasic_VolumeUnit> &
	:rtype: None
") SetVolumeUnit;
		void SetVolumeUnit (const opencascade::handle<StepBasic_VolumeUnit> & aVolumeUnit);
		%feature("compactdefaultargs") StepBasic_ConversionBasedUnitAndVolumeUnit;
		%feature("autodoc", "	* Returns a ConversionBasedUnitAndVolumeUnit

	:rtype: None
") StepBasic_ConversionBasedUnitAndVolumeUnit;
		 StepBasic_ConversionBasedUnitAndVolumeUnit ();
		%feature("compactdefaultargs") VolumeUnit;
		%feature("autodoc", "	:rtype: opencascade::handle<StepBasic_VolumeUnit>
") VolumeUnit;
		opencascade::handle<StepBasic_VolumeUnit> VolumeUnit ();
};


%make_alias(StepBasic_ConversionBasedUnitAndVolumeUnit)

%extend StepBasic_ConversionBasedUnitAndVolumeUnit {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepBasic_DesignContext;
class StepBasic_DesignContext : public StepBasic_ProductDefinitionContext {
	public:
		%feature("compactdefaultargs") StepBasic_DesignContext;
		%feature("autodoc", "	:rtype: None
") StepBasic_DesignContext;
		 StepBasic_DesignContext ();
};


%make_alias(StepBasic_DesignContext)

%extend StepBasic_DesignContext {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepBasic_MechanicalContext;
class StepBasic_MechanicalContext : public StepBasic_ProductContext {
	public:
		%feature("compactdefaultargs") StepBasic_MechanicalContext;
		%feature("autodoc", "	* Returns a MechanicalContext

	:rtype: None
") StepBasic_MechanicalContext;
		 StepBasic_MechanicalContext ();
};


%make_alias(StepBasic_MechanicalContext)

%extend StepBasic_MechanicalContext {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepBasic_ProductType;
class StepBasic_ProductType : public StepBasic_ProductRelatedProductCategory {
	public:
		%feature("compactdefaultargs") StepBasic_ProductType;
		%feature("autodoc", "	* Returns a ProductType

	:rtype: None
") StepBasic_ProductType;
		 StepBasic_ProductType ();
};


%make_alias(StepBasic_ProductType)

%extend StepBasic_ProductType {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepBasic_SiUnitAndAreaUnit;
class StepBasic_SiUnitAndAreaUnit : public StepBasic_SiUnit {
	public:
		%feature("compactdefaultargs") AreaUnit;
		%feature("autodoc", "	:rtype: opencascade::handle<StepBasic_AreaUnit>
") AreaUnit;
		opencascade::handle<StepBasic_AreaUnit> AreaUnit ();
		%feature("compactdefaultargs") SetAreaUnit;
		%feature("autodoc", "	:param anAreaUnit:
	:type anAreaUnit: opencascade::handle<StepBasic_AreaUnit> &
	:rtype: None
") SetAreaUnit;
		void SetAreaUnit (const opencascade::handle<StepBasic_AreaUnit> & anAreaUnit);
		%feature("compactdefaultargs") StepBasic_SiUnitAndAreaUnit;
		%feature("autodoc", "	* Returns a SiUnitAndAreaUnit

	:rtype: None
") StepBasic_SiUnitAndAreaUnit;
		 StepBasic_SiUnitAndAreaUnit ();
};


%make_alias(StepBasic_SiUnitAndAreaUnit)

%extend StepBasic_SiUnitAndAreaUnit {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepBasic_SiUnitAndLengthUnit;
class StepBasic_SiUnitAndLengthUnit : public StepBasic_SiUnit {
	public:
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param hasAprefix:
	:type hasAprefix: bool
	:param aPrefix:
	:type aPrefix: StepBasic_SiPrefix
	:param aName:
	:type aName: StepBasic_SiUnitName
	:rtype: None
") Init;
		void Init (const Standard_Boolean hasAprefix,const StepBasic_SiPrefix aPrefix,const StepBasic_SiUnitName aName);
		%feature("compactdefaultargs") LengthUnit;
		%feature("autodoc", "	:rtype: opencascade::handle<StepBasic_LengthUnit>
") LengthUnit;
		opencascade::handle<StepBasic_LengthUnit> LengthUnit ();
		%feature("compactdefaultargs") SetLengthUnit;
		%feature("autodoc", "	:param aLengthUnit:
	:type aLengthUnit: opencascade::handle<StepBasic_LengthUnit> &
	:rtype: None
") SetLengthUnit;
		void SetLengthUnit (const opencascade::handle<StepBasic_LengthUnit> & aLengthUnit);
		%feature("compactdefaultargs") StepBasic_SiUnitAndLengthUnit;
		%feature("autodoc", "	* Returns a SiUnitAndLengthUnit

	:rtype: None
") StepBasic_SiUnitAndLengthUnit;
		 StepBasic_SiUnitAndLengthUnit ();
};


%make_alias(StepBasic_SiUnitAndLengthUnit)

%extend StepBasic_SiUnitAndLengthUnit {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepBasic_SiUnitAndMassUnit;
class StepBasic_SiUnitAndMassUnit : public StepBasic_SiUnit {
	public:
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param hasAprefix:
	:type hasAprefix: bool
	:param aPrefix:
	:type aPrefix: StepBasic_SiPrefix
	:param aName:
	:type aName: StepBasic_SiUnitName
	:rtype: None
") Init;
		void Init (const Standard_Boolean hasAprefix,const StepBasic_SiPrefix aPrefix,const StepBasic_SiUnitName aName);
		%feature("compactdefaultargs") MassUnit;
		%feature("autodoc", "	:rtype: opencascade::handle<StepBasic_MassUnit>
") MassUnit;
		opencascade::handle<StepBasic_MassUnit> MassUnit ();
		%feature("compactdefaultargs") SetMassUnit;
		%feature("autodoc", "	:param aMassUnit:
	:type aMassUnit: opencascade::handle<StepBasic_MassUnit> &
	:rtype: None
") SetMassUnit;
		void SetMassUnit (const opencascade::handle<StepBasic_MassUnit> & aMassUnit);
		%feature("compactdefaultargs") StepBasic_SiUnitAndMassUnit;
		%feature("autodoc", "	* Returns a SiUnitAndMassUnit

	:rtype: None
") StepBasic_SiUnitAndMassUnit;
		 StepBasic_SiUnitAndMassUnit ();
};


%make_alias(StepBasic_SiUnitAndMassUnit)

%extend StepBasic_SiUnitAndMassUnit {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepBasic_SiUnitAndPlaneAngleUnit;
class StepBasic_SiUnitAndPlaneAngleUnit : public StepBasic_SiUnit {
	public:
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param hasAprefix:
	:type hasAprefix: bool
	:param aPrefix:
	:type aPrefix: StepBasic_SiPrefix
	:param aName:
	:type aName: StepBasic_SiUnitName
	:rtype: None
") Init;
		void Init (const Standard_Boolean hasAprefix,const StepBasic_SiPrefix aPrefix,const StepBasic_SiUnitName aName);
		%feature("compactdefaultargs") PlaneAngleUnit;
		%feature("autodoc", "	:rtype: opencascade::handle<StepBasic_PlaneAngleUnit>
") PlaneAngleUnit;
		opencascade::handle<StepBasic_PlaneAngleUnit> PlaneAngleUnit ();
		%feature("compactdefaultargs") SetPlaneAngleUnit;
		%feature("autodoc", "	:param aPlaneAngleUnit:
	:type aPlaneAngleUnit: opencascade::handle<StepBasic_PlaneAngleUnit> &
	:rtype: None
") SetPlaneAngleUnit;
		void SetPlaneAngleUnit (const opencascade::handle<StepBasic_PlaneAngleUnit> & aPlaneAngleUnit);
		%feature("compactdefaultargs") StepBasic_SiUnitAndPlaneAngleUnit;
		%feature("autodoc", "	* Returns a SiUnitAndPlaneAngleUnit

	:rtype: None
") StepBasic_SiUnitAndPlaneAngleUnit;
		 StepBasic_SiUnitAndPlaneAngleUnit ();
};


%make_alias(StepBasic_SiUnitAndPlaneAngleUnit)

%extend StepBasic_SiUnitAndPlaneAngleUnit {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepBasic_SiUnitAndRatioUnit;
class StepBasic_SiUnitAndRatioUnit : public StepBasic_SiUnit {
	public:
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param hasAprefix:
	:type hasAprefix: bool
	:param aPrefix:
	:type aPrefix: StepBasic_SiPrefix
	:param aName:
	:type aName: StepBasic_SiUnitName
	:rtype: None
") Init;
		void Init (const Standard_Boolean hasAprefix,const StepBasic_SiPrefix aPrefix,const StepBasic_SiUnitName aName);
		%feature("compactdefaultargs") RatioUnit;
		%feature("autodoc", "	:rtype: opencascade::handle<StepBasic_RatioUnit>
") RatioUnit;
		opencascade::handle<StepBasic_RatioUnit> RatioUnit ();
		%feature("compactdefaultargs") SetRatioUnit;
		%feature("autodoc", "	:param aRatioUnit:
	:type aRatioUnit: opencascade::handle<StepBasic_RatioUnit> &
	:rtype: None
") SetRatioUnit;
		void SetRatioUnit (const opencascade::handle<StepBasic_RatioUnit> & aRatioUnit);
		%feature("compactdefaultargs") StepBasic_SiUnitAndRatioUnit;
		%feature("autodoc", "	* Returns a SiUnitAndRatioUnit

	:rtype: None
") StepBasic_SiUnitAndRatioUnit;
		 StepBasic_SiUnitAndRatioUnit ();
};


%make_alias(StepBasic_SiUnitAndRatioUnit)

%extend StepBasic_SiUnitAndRatioUnit {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepBasic_SiUnitAndSolidAngleUnit;
class StepBasic_SiUnitAndSolidAngleUnit : public StepBasic_SiUnit {
	public:
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param hasAprefix:
	:type hasAprefix: bool
	:param aPrefix:
	:type aPrefix: StepBasic_SiPrefix
	:param aName:
	:type aName: StepBasic_SiUnitName
	:rtype: None
") Init;
		void Init (const Standard_Boolean hasAprefix,const StepBasic_SiPrefix aPrefix,const StepBasic_SiUnitName aName);
		%feature("compactdefaultargs") SetSolidAngleUnit;
		%feature("autodoc", "	:param aSolidAngleUnit:
	:type aSolidAngleUnit: opencascade::handle<StepBasic_SolidAngleUnit> &
	:rtype: None
") SetSolidAngleUnit;
		void SetSolidAngleUnit (const opencascade::handle<StepBasic_SolidAngleUnit> & aSolidAngleUnit);
		%feature("compactdefaultargs") SolidAngleUnit;
		%feature("autodoc", "	:rtype: opencascade::handle<StepBasic_SolidAngleUnit>
") SolidAngleUnit;
		opencascade::handle<StepBasic_SolidAngleUnit> SolidAngleUnit ();
		%feature("compactdefaultargs") StepBasic_SiUnitAndSolidAngleUnit;
		%feature("autodoc", "	* Returns a SiUnitAndSolidAngleUnit

	:rtype: None
") StepBasic_SiUnitAndSolidAngleUnit;
		 StepBasic_SiUnitAndSolidAngleUnit ();
};


%make_alias(StepBasic_SiUnitAndSolidAngleUnit)

%extend StepBasic_SiUnitAndSolidAngleUnit {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepBasic_SiUnitAndThermodynamicTemperatureUnit;
class StepBasic_SiUnitAndThermodynamicTemperatureUnit : public StepBasic_SiUnit {
	public:
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param hasAprefix:
	:type hasAprefix: bool
	:param aPrefix:
	:type aPrefix: StepBasic_SiPrefix
	:param aName:
	:type aName: StepBasic_SiUnitName
	:rtype: None
") Init;
		void Init (const Standard_Boolean hasAprefix,const StepBasic_SiPrefix aPrefix,const StepBasic_SiUnitName aName);
		%feature("compactdefaultargs") SetThermodynamicTemperatureUnit;
		%feature("autodoc", "	:param aThermodynamicTemperatureUnit:
	:type aThermodynamicTemperatureUnit: opencascade::handle<StepBasic_ThermodynamicTemperatureUnit> &
	:rtype: None
") SetThermodynamicTemperatureUnit;
		void SetThermodynamicTemperatureUnit (const opencascade::handle<StepBasic_ThermodynamicTemperatureUnit> & aThermodynamicTemperatureUnit);
		%feature("compactdefaultargs") StepBasic_SiUnitAndThermodynamicTemperatureUnit;
		%feature("autodoc", "	* Returns a SiUnitAndThermodynamicTemperatureUnit

	:rtype: None
") StepBasic_SiUnitAndThermodynamicTemperatureUnit;
		 StepBasic_SiUnitAndThermodynamicTemperatureUnit ();
		%feature("compactdefaultargs") ThermodynamicTemperatureUnit;
		%feature("autodoc", "	:rtype: opencascade::handle<StepBasic_ThermodynamicTemperatureUnit>
") ThermodynamicTemperatureUnit;
		opencascade::handle<StepBasic_ThermodynamicTemperatureUnit> ThermodynamicTemperatureUnit ();
};


%make_alias(StepBasic_SiUnitAndThermodynamicTemperatureUnit)

%extend StepBasic_SiUnitAndThermodynamicTemperatureUnit {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepBasic_SiUnitAndTimeUnit;
class StepBasic_SiUnitAndTimeUnit : public StepBasic_SiUnit {
	public:
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param hasAprefix:
	:type hasAprefix: bool
	:param aPrefix:
	:type aPrefix: StepBasic_SiPrefix
	:param aName:
	:type aName: StepBasic_SiUnitName
	:rtype: None
") Init;
		void Init (const Standard_Boolean hasAprefix,const StepBasic_SiPrefix aPrefix,const StepBasic_SiUnitName aName);
		%feature("compactdefaultargs") SetTimeUnit;
		%feature("autodoc", "	:param aTimeUnit:
	:type aTimeUnit: opencascade::handle<StepBasic_TimeUnit> &
	:rtype: None
") SetTimeUnit;
		void SetTimeUnit (const opencascade::handle<StepBasic_TimeUnit> & aTimeUnit);
		%feature("compactdefaultargs") StepBasic_SiUnitAndTimeUnit;
		%feature("autodoc", "	* Returns a SiUnitAndTimeUnit

	:rtype: None
") StepBasic_SiUnitAndTimeUnit;
		 StepBasic_SiUnitAndTimeUnit ();
		%feature("compactdefaultargs") TimeUnit;
		%feature("autodoc", "	:rtype: opencascade::handle<StepBasic_TimeUnit>
") TimeUnit;
		opencascade::handle<StepBasic_TimeUnit> TimeUnit ();
};


%make_alias(StepBasic_SiUnitAndTimeUnit)

%extend StepBasic_SiUnitAndTimeUnit {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepBasic_SiUnitAndVolumeUnit;
class StepBasic_SiUnitAndVolumeUnit : public StepBasic_SiUnit {
	public:
		%feature("compactdefaultargs") SetVolumeUnit;
		%feature("autodoc", "	:param aVolumeUnit:
	:type aVolumeUnit: opencascade::handle<StepBasic_VolumeUnit> &
	:rtype: None
") SetVolumeUnit;
		void SetVolumeUnit (const opencascade::handle<StepBasic_VolumeUnit> & aVolumeUnit);
		%feature("compactdefaultargs") StepBasic_SiUnitAndVolumeUnit;
		%feature("autodoc", "	* Returns a SiUnitAndVolumeUnit

	:rtype: None
") StepBasic_SiUnitAndVolumeUnit;
		 StepBasic_SiUnitAndVolumeUnit ();
		%feature("compactdefaultargs") VolumeUnit;
		%feature("autodoc", "	:rtype: opencascade::handle<StepBasic_VolumeUnit>
") VolumeUnit;
		opencascade::handle<StepBasic_VolumeUnit> VolumeUnit ();
};


%make_alias(StepBasic_SiUnitAndVolumeUnit)

%extend StepBasic_SiUnitAndVolumeUnit {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
/* harray1 class */
class StepBasic_HArray1OfOrganization : public  StepBasic_Array1OfOrganization, public Standard_Transient {
  public:
    StepBasic_HArray1OfOrganization(const Standard_Integer theLower, const Standard_Integer theUpper);
    StepBasic_HArray1OfOrganization(const Standard_Integer theLower, const Standard_Integer theUpper, const  StepBasic_Array1OfOrganization::value_type& theValue);
    StepBasic_HArray1OfOrganization(const  StepBasic_Array1OfOrganization& theOther);
    const  StepBasic_Array1OfOrganization& Array1();
     StepBasic_Array1OfOrganization& ChangeArray1();
};
%make_alias(StepBasic_HArray1OfOrganization)


class StepBasic_HArray1OfProductDefinition : public  StepBasic_Array1OfProductDefinition, public Standard_Transient {
  public:
    StepBasic_HArray1OfProductDefinition(const Standard_Integer theLower, const Standard_Integer theUpper);
    StepBasic_HArray1OfProductDefinition(const Standard_Integer theLower, const Standard_Integer theUpper, const  StepBasic_Array1OfProductDefinition::value_type& theValue);
    StepBasic_HArray1OfProductDefinition(const  StepBasic_Array1OfProductDefinition& theOther);
    const  StepBasic_Array1OfProductDefinition& Array1();
     StepBasic_Array1OfProductDefinition& ChangeArray1();
};
%make_alias(StepBasic_HArray1OfProductDefinition)


class StepBasic_HArray1OfDerivedUnitElement : public  StepBasic_Array1OfDerivedUnitElement, public Standard_Transient {
  public:
    StepBasic_HArray1OfDerivedUnitElement(const Standard_Integer theLower, const Standard_Integer theUpper);
    StepBasic_HArray1OfDerivedUnitElement(const Standard_Integer theLower, const Standard_Integer theUpper, const  StepBasic_Array1OfDerivedUnitElement::value_type& theValue);
    StepBasic_HArray1OfDerivedUnitElement(const  StepBasic_Array1OfDerivedUnitElement& theOther);
    const  StepBasic_Array1OfDerivedUnitElement& Array1();
     StepBasic_Array1OfDerivedUnitElement& ChangeArray1();
};
%make_alias(StepBasic_HArray1OfDerivedUnitElement)


class StepBasic_HArray1OfPerson : public  StepBasic_Array1OfPerson, public Standard_Transient {
  public:
    StepBasic_HArray1OfPerson(const Standard_Integer theLower, const Standard_Integer theUpper);
    StepBasic_HArray1OfPerson(const Standard_Integer theLower, const Standard_Integer theUpper, const  StepBasic_Array1OfPerson::value_type& theValue);
    StepBasic_HArray1OfPerson(const  StepBasic_Array1OfPerson& theOther);
    const  StepBasic_Array1OfPerson& Array1();
     StepBasic_Array1OfPerson& ChangeArray1();
};
%make_alias(StepBasic_HArray1OfPerson)


class StepBasic_HArray1OfUncertaintyMeasureWithUnit : public  StepBasic_Array1OfUncertaintyMeasureWithUnit, public Standard_Transient {
  public:
    StepBasic_HArray1OfUncertaintyMeasureWithUnit(const Standard_Integer theLower, const Standard_Integer theUpper);
    StepBasic_HArray1OfUncertaintyMeasureWithUnit(const Standard_Integer theLower, const Standard_Integer theUpper, const  StepBasic_Array1OfUncertaintyMeasureWithUnit::value_type& theValue);
    StepBasic_HArray1OfUncertaintyMeasureWithUnit(const  StepBasic_Array1OfUncertaintyMeasureWithUnit& theOther);
    const  StepBasic_Array1OfUncertaintyMeasureWithUnit& Array1();
     StepBasic_Array1OfUncertaintyMeasureWithUnit& ChangeArray1();
};
%make_alias(StepBasic_HArray1OfUncertaintyMeasureWithUnit)


class StepBasic_HArray1OfApproval : public  StepBasic_Array1OfApproval, public Standard_Transient {
  public:
    StepBasic_HArray1OfApproval(const Standard_Integer theLower, const Standard_Integer theUpper);
    StepBasic_HArray1OfApproval(const Standard_Integer theLower, const Standard_Integer theUpper, const  StepBasic_Array1OfApproval::value_type& theValue);
    StepBasic_HArray1OfApproval(const  StepBasic_Array1OfApproval& theOther);
    const  StepBasic_Array1OfApproval& Array1();
     StepBasic_Array1OfApproval& ChangeArray1();
};
%make_alias(StepBasic_HArray1OfApproval)


class StepBasic_HArray1OfNamedUnit : public  StepBasic_Array1OfNamedUnit, public Standard_Transient {
  public:
    StepBasic_HArray1OfNamedUnit(const Standard_Integer theLower, const Standard_Integer theUpper);
    StepBasic_HArray1OfNamedUnit(const Standard_Integer theLower, const Standard_Integer theUpper, const  StepBasic_Array1OfNamedUnit::value_type& theValue);
    StepBasic_HArray1OfNamedUnit(const  StepBasic_Array1OfNamedUnit& theOther);
    const  StepBasic_Array1OfNamedUnit& Array1();
     StepBasic_Array1OfNamedUnit& ChangeArray1();
};
%make_alias(StepBasic_HArray1OfNamedUnit)


class StepBasic_HArray1OfProductContext : public  StepBasic_Array1OfProductContext, public Standard_Transient {
  public:
    StepBasic_HArray1OfProductContext(const Standard_Integer theLower, const Standard_Integer theUpper);
    StepBasic_HArray1OfProductContext(const Standard_Integer theLower, const Standard_Integer theUpper, const  StepBasic_Array1OfProductContext::value_type& theValue);
    StepBasic_HArray1OfProductContext(const  StepBasic_Array1OfProductContext& theOther);
    const  StepBasic_Array1OfProductContext& Array1();
     StepBasic_Array1OfProductContext& ChangeArray1();
};
%make_alias(StepBasic_HArray1OfProductContext)


class StepBasic_HArray1OfDocument : public  StepBasic_Array1OfDocument, public Standard_Transient {
  public:
    StepBasic_HArray1OfDocument(const Standard_Integer theLower, const Standard_Integer theUpper);
    StepBasic_HArray1OfDocument(const Standard_Integer theLower, const Standard_Integer theUpper, const  StepBasic_Array1OfDocument::value_type& theValue);
    StepBasic_HArray1OfDocument(const  StepBasic_Array1OfDocument& theOther);
    const  StepBasic_Array1OfDocument& Array1();
     StepBasic_Array1OfDocument& ChangeArray1();
};
%make_alias(StepBasic_HArray1OfDocument)


class StepBasic_HArray1OfProduct : public  StepBasic_Array1OfProduct, public Standard_Transient {
  public:
    StepBasic_HArray1OfProduct(const Standard_Integer theLower, const Standard_Integer theUpper);
    StepBasic_HArray1OfProduct(const Standard_Integer theLower, const Standard_Integer theUpper, const  StepBasic_Array1OfProduct::value_type& theValue);
    StepBasic_HArray1OfProduct(const  StepBasic_Array1OfProduct& theOther);
    const  StepBasic_Array1OfProduct& Array1();
     StepBasic_Array1OfProduct& ChangeArray1();
};
%make_alias(StepBasic_HArray1OfProduct)


/* harray2 class */
/* harray2 class */
