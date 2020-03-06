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
#include<TopoDS_module.hxx>
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

%pythoncode {
from OCC.Core.Exception import *
};

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

/* python proy classes for enums */
%pythoncode {

class StepBasic_Source:
	StepBasic_sMade = 0
	StepBasic_sBought = 1
	StepBasic_sNotKnown = 2

class StepBasic_AheadOrBehind:
	StepBasic_aobAhead = 0
	StepBasic_aobExact = 1
	StepBasic_aobBehind = 2

class StepBasic_SiUnitName:
	StepBasic_sunMetre = 0
	StepBasic_sunGram = 1
	StepBasic_sunSecond = 2
	StepBasic_sunAmpere = 3
	StepBasic_sunKelvin = 4
	StepBasic_sunMole = 5
	StepBasic_sunCandela = 6
	StepBasic_sunRadian = 7
	StepBasic_sunSteradian = 8
	StepBasic_sunHertz = 9
	StepBasic_sunNewton = 10
	StepBasic_sunPascal = 11
	StepBasic_sunJoule = 12
	StepBasic_sunWatt = 13
	StepBasic_sunCoulomb = 14
	StepBasic_sunVolt = 15
	StepBasic_sunFarad = 16
	StepBasic_sunOhm = 17
	StepBasic_sunSiemens = 18
	StepBasic_sunWeber = 19
	StepBasic_sunTesla = 20
	StepBasic_sunHenry = 21
	StepBasic_sunDegreeCelsius = 22
	StepBasic_sunLumen = 23
	StepBasic_sunLux = 24
	StepBasic_sunBecquerel = 25
	StepBasic_sunGray = 26
	StepBasic_sunSievert = 27

class StepBasic_SiPrefix:
	StepBasic_spExa = 0
	StepBasic_spPeta = 1
	StepBasic_spTera = 2
	StepBasic_spGiga = 3
	StepBasic_spMega = 4
	StepBasic_spKilo = 5
	StepBasic_spHecto = 6
	StepBasic_spDeca = 7
	StepBasic_spDeci = 8
	StepBasic_spCenti = 9
	StepBasic_spMilli = 10
	StepBasic_spMicro = 11
	StepBasic_spNano = 12
	StepBasic_spPico = 13
	StepBasic_spFemto = 14
	StepBasic_spAtto = 15
};
/* end python proxy for enums */

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
%template(StepBasic_Array1OfApproval) NCollection_Array1<opencascade::handle<StepBasic_Approval>>;

%extend NCollection_Array1<opencascade::handle<StepBasic_Approval>> {
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
%template(StepBasic_Array1OfDerivedUnitElement) NCollection_Array1<opencascade::handle<StepBasic_DerivedUnitElement>>;

%extend NCollection_Array1<opencascade::handle<StepBasic_DerivedUnitElement>> {
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
%template(StepBasic_Array1OfDocument) NCollection_Array1<opencascade::handle<StepBasic_Document>>;

%extend NCollection_Array1<opencascade::handle<StepBasic_Document>> {
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
%template(StepBasic_Array1OfNamedUnit) NCollection_Array1<opencascade::handle<StepBasic_NamedUnit>>;

%extend NCollection_Array1<opencascade::handle<StepBasic_NamedUnit>> {
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
%template(StepBasic_Array1OfOrganization) NCollection_Array1<opencascade::handle<StepBasic_Organization>>;

%extend NCollection_Array1<opencascade::handle<StepBasic_Organization>> {
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
%template(StepBasic_Array1OfPerson) NCollection_Array1<opencascade::handle<StepBasic_Person>>;

%extend NCollection_Array1<opencascade::handle<StepBasic_Person>> {
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
%template(StepBasic_Array1OfProduct) NCollection_Array1<opencascade::handle<StepBasic_Product>>;

%extend NCollection_Array1<opencascade::handle<StepBasic_Product>> {
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
%template(StepBasic_Array1OfProductContext) NCollection_Array1<opencascade::handle<StepBasic_ProductContext>>;

%extend NCollection_Array1<opencascade::handle<StepBasic_ProductContext>> {
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
%template(StepBasic_Array1OfProductDefinition) NCollection_Array1<opencascade::handle<StepBasic_ProductDefinition>>;

%extend NCollection_Array1<opencascade::handle<StepBasic_ProductDefinition>> {
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
%template(StepBasic_Array1OfUncertaintyMeasureWithUnit) NCollection_Array1<opencascade::handle<StepBasic_UncertaintyMeasureWithUnit>>;

%extend NCollection_Array1<opencascade::handle<StepBasic_UncertaintyMeasureWithUnit>> {
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
typedef NCollection_Array1<opencascade::handle<StepBasic_Approval>> StepBasic_Array1OfApproval;
typedef NCollection_Array1<opencascade::handle<StepBasic_DerivedUnitElement>> StepBasic_Array1OfDerivedUnitElement;
typedef NCollection_Array1<opencascade::handle<StepBasic_Document>> StepBasic_Array1OfDocument;
typedef NCollection_Array1<opencascade::handle<StepBasic_NamedUnit>> StepBasic_Array1OfNamedUnit;
typedef NCollection_Array1<opencascade::handle<StepBasic_Organization>> StepBasic_Array1OfOrganization;
typedef NCollection_Array1<opencascade::handle<StepBasic_Person>> StepBasic_Array1OfPerson;
typedef NCollection_Array1<opencascade::handle<StepBasic_Product>> StepBasic_Array1OfProduct;
typedef NCollection_Array1<opencascade::handle<StepBasic_ProductContext>> StepBasic_Array1OfProductContext;
typedef NCollection_Array1<opencascade::handle<StepBasic_ProductDefinition>> StepBasic_Array1OfProductDefinition;
typedef NCollection_Array1<opencascade::handle<StepBasic_UncertaintyMeasureWithUnit>> StepBasic_Array1OfUncertaintyMeasureWithUnit;
/* end typedefs declaration */

/*************************
* class StepBasic_Action *
*************************/
class StepBasic_Action : public Standard_Transient {
	public:
		/****************** StepBasic_Action ******************/
		%feature("compactdefaultargs") StepBasic_Action;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") StepBasic_Action;
		 StepBasic_Action();

		/****************** ChosenMethod ******************/
		%feature("compactdefaultargs") ChosenMethod;
		%feature("autodoc", "Returns field chosenmethod.

Returns
-------
opencascade::handle<StepBasic_ActionMethod>
") ChosenMethod;
		opencascade::handle<StepBasic_ActionMethod> ChosenMethod();

		/****************** Description ******************/
		%feature("compactdefaultargs") Description;
		%feature("autodoc", "Returns field description.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") Description;
		opencascade::handle<TCollection_HAsciiString> Description();

		/****************** HasDescription ******************/
		%feature("compactdefaultargs") HasDescription;
		%feature("autodoc", "Returns true if optional field description is defined.

Returns
-------
bool
") HasDescription;
		Standard_Boolean HasDescription();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Initialize all fields (own and inherited).

Parameters
----------
aName: TCollection_HAsciiString
hasDescription: bool
aDescription: TCollection_HAsciiString
aChosenMethod: StepBasic_ActionMethod

Returns
-------
None
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aName, const Standard_Boolean hasDescription, const opencascade::handle<TCollection_HAsciiString> & aDescription, const opencascade::handle<StepBasic_ActionMethod> & aChosenMethod);

		/****************** Name ******************/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "Returns field name.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") Name;
		opencascade::handle<TCollection_HAsciiString> Name();

		/****************** SetChosenMethod ******************/
		%feature("compactdefaultargs") SetChosenMethod;
		%feature("autodoc", "Set field chosenmethod.

Parameters
----------
ChosenMethod: StepBasic_ActionMethod

Returns
-------
None
") SetChosenMethod;
		void SetChosenMethod(const opencascade::handle<StepBasic_ActionMethod> & ChosenMethod);

		/****************** SetDescription ******************/
		%feature("compactdefaultargs") SetDescription;
		%feature("autodoc", "Set field description.

Parameters
----------
Description: TCollection_HAsciiString

Returns
-------
None
") SetDescription;
		void SetDescription(const opencascade::handle<TCollection_HAsciiString> & Description);

		/****************** SetName ******************/
		%feature("compactdefaultargs") SetName;
		%feature("autodoc", "Set field name.

Parameters
----------
Name: TCollection_HAsciiString

Returns
-------
None
") SetName;
		void SetName(const opencascade::handle<TCollection_HAsciiString> & Name);

};


%make_alias(StepBasic_Action)

%extend StepBasic_Action {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************************
* class StepBasic_ActionAssignment *
***********************************/
class StepBasic_ActionAssignment : public Standard_Transient {
	public:
		/****************** StepBasic_ActionAssignment ******************/
		%feature("compactdefaultargs") StepBasic_ActionAssignment;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") StepBasic_ActionAssignment;
		 StepBasic_ActionAssignment();

		/****************** AssignedAction ******************/
		%feature("compactdefaultargs") AssignedAction;
		%feature("autodoc", "Returns field assignedaction.

Returns
-------
opencascade::handle<StepBasic_Action>
") AssignedAction;
		opencascade::handle<StepBasic_Action> AssignedAction();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Initialize all fields (own and inherited).

Parameters
----------
aAssignedAction: StepBasic_Action

Returns
-------
None
") Init;
		void Init(const opencascade::handle<StepBasic_Action> & aAssignedAction);

		/****************** SetAssignedAction ******************/
		%feature("compactdefaultargs") SetAssignedAction;
		%feature("autodoc", "Set field assignedaction.

Parameters
----------
AssignedAction: StepBasic_Action

Returns
-------
None
") SetAssignedAction;
		void SetAssignedAction(const opencascade::handle<StepBasic_Action> & AssignedAction);

};


%make_alias(StepBasic_ActionAssignment)

%extend StepBasic_ActionAssignment {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************
* class StepBasic_ActionMethod *
*******************************/
class StepBasic_ActionMethod : public Standard_Transient {
	public:
		/****************** StepBasic_ActionMethod ******************/
		%feature("compactdefaultargs") StepBasic_ActionMethod;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") StepBasic_ActionMethod;
		 StepBasic_ActionMethod();

		/****************** Consequence ******************/
		%feature("compactdefaultargs") Consequence;
		%feature("autodoc", "Returns field consequence.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") Consequence;
		opencascade::handle<TCollection_HAsciiString> Consequence();

		/****************** Description ******************/
		%feature("compactdefaultargs") Description;
		%feature("autodoc", "Returns field description.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") Description;
		opencascade::handle<TCollection_HAsciiString> Description();

		/****************** HasDescription ******************/
		%feature("compactdefaultargs") HasDescription;
		%feature("autodoc", "Returns true if optional field description is defined.

Returns
-------
bool
") HasDescription;
		Standard_Boolean HasDescription();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Initialize all fields (own and inherited).

Parameters
----------
aName: TCollection_HAsciiString
hasDescription: bool
aDescription: TCollection_HAsciiString
aConsequence: TCollection_HAsciiString
aPurpose: TCollection_HAsciiString

Returns
-------
None
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aName, const Standard_Boolean hasDescription, const opencascade::handle<TCollection_HAsciiString> & aDescription, const opencascade::handle<TCollection_HAsciiString> & aConsequence, const opencascade::handle<TCollection_HAsciiString> & aPurpose);

		/****************** Name ******************/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "Returns field name.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") Name;
		opencascade::handle<TCollection_HAsciiString> Name();

		/****************** Purpose ******************/
		%feature("compactdefaultargs") Purpose;
		%feature("autodoc", "Returns field purpose.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") Purpose;
		opencascade::handle<TCollection_HAsciiString> Purpose();

		/****************** SetConsequence ******************/
		%feature("compactdefaultargs") SetConsequence;
		%feature("autodoc", "Set field consequence.

Parameters
----------
Consequence: TCollection_HAsciiString

Returns
-------
None
") SetConsequence;
		void SetConsequence(const opencascade::handle<TCollection_HAsciiString> & Consequence);

		/****************** SetDescription ******************/
		%feature("compactdefaultargs") SetDescription;
		%feature("autodoc", "Set field description.

Parameters
----------
Description: TCollection_HAsciiString

Returns
-------
None
") SetDescription;
		void SetDescription(const opencascade::handle<TCollection_HAsciiString> & Description);

		/****************** SetName ******************/
		%feature("compactdefaultargs") SetName;
		%feature("autodoc", "Set field name.

Parameters
----------
Name: TCollection_HAsciiString

Returns
-------
None
") SetName;
		void SetName(const opencascade::handle<TCollection_HAsciiString> & Name);

		/****************** SetPurpose ******************/
		%feature("compactdefaultargs") SetPurpose;
		%feature("autodoc", "Set field purpose.

Parameters
----------
Purpose: TCollection_HAsciiString

Returns
-------
None
") SetPurpose;
		void SetPurpose(const opencascade::handle<TCollection_HAsciiString> & Purpose);

};


%make_alias(StepBasic_ActionMethod)

%extend StepBasic_ActionMethod {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************************
* class StepBasic_ActionRequestAssignment *
******************************************/
class StepBasic_ActionRequestAssignment : public Standard_Transient {
	public:
		/****************** StepBasic_ActionRequestAssignment ******************/
		%feature("compactdefaultargs") StepBasic_ActionRequestAssignment;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") StepBasic_ActionRequestAssignment;
		 StepBasic_ActionRequestAssignment();

		/****************** AssignedActionRequest ******************/
		%feature("compactdefaultargs") AssignedActionRequest;
		%feature("autodoc", "Returns field assignedactionrequest.

Returns
-------
opencascade::handle<StepBasic_VersionedActionRequest>
") AssignedActionRequest;
		opencascade::handle<StepBasic_VersionedActionRequest> AssignedActionRequest();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Initialize all fields (own and inherited).

Parameters
----------
aAssignedActionRequest: StepBasic_VersionedActionRequest

Returns
-------
None
") Init;
		void Init(const opencascade::handle<StepBasic_VersionedActionRequest> & aAssignedActionRequest);

		/****************** SetAssignedActionRequest ******************/
		%feature("compactdefaultargs") SetAssignedActionRequest;
		%feature("autodoc", "Set field assignedactionrequest.

Parameters
----------
AssignedActionRequest: StepBasic_VersionedActionRequest

Returns
-------
None
") SetAssignedActionRequest;
		void SetAssignedActionRequest(const opencascade::handle<StepBasic_VersionedActionRequest> & AssignedActionRequest);

};


%make_alias(StepBasic_ActionRequestAssignment)

%extend StepBasic_ActionRequestAssignment {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************************
* class StepBasic_ActionRequestSolution *
****************************************/
class StepBasic_ActionRequestSolution : public Standard_Transient {
	public:
		/****************** StepBasic_ActionRequestSolution ******************/
		%feature("compactdefaultargs") StepBasic_ActionRequestSolution;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") StepBasic_ActionRequestSolution;
		 StepBasic_ActionRequestSolution();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Initialize all fields (own and inherited).

Parameters
----------
aMethod: StepBasic_ActionMethod
aRequest: StepBasic_VersionedActionRequest

Returns
-------
None
") Init;
		void Init(const opencascade::handle<StepBasic_ActionMethod> & aMethod, const opencascade::handle<StepBasic_VersionedActionRequest> & aRequest);

		/****************** Method ******************/
		%feature("compactdefaultargs") Method;
		%feature("autodoc", "Returns field method.

Returns
-------
opencascade::handle<StepBasic_ActionMethod>
") Method;
		opencascade::handle<StepBasic_ActionMethod> Method();

		/****************** Request ******************/
		%feature("compactdefaultargs") Request;
		%feature("autodoc", "Returns field request.

Returns
-------
opencascade::handle<StepBasic_VersionedActionRequest>
") Request;
		opencascade::handle<StepBasic_VersionedActionRequest> Request();

		/****************** SetMethod ******************/
		%feature("compactdefaultargs") SetMethod;
		%feature("autodoc", "Set field method.

Parameters
----------
Method: StepBasic_ActionMethod

Returns
-------
None
") SetMethod;
		void SetMethod(const opencascade::handle<StepBasic_ActionMethod> & Method);

		/****************** SetRequest ******************/
		%feature("compactdefaultargs") SetRequest;
		%feature("autodoc", "Set field request.

Parameters
----------
Request: StepBasic_VersionedActionRequest

Returns
-------
None
") SetRequest;
		void SetRequest(const opencascade::handle<StepBasic_VersionedActionRequest> & Request);

};


%make_alias(StepBasic_ActionRequestSolution)

%extend StepBasic_ActionRequestSolution {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************
* class StepBasic_Address *
**************************/
class StepBasic_Address : public Standard_Transient {
	public:
		/****************** StepBasic_Address ******************/
		%feature("compactdefaultargs") StepBasic_Address;
		%feature("autodoc", "Returns a address.

Returns
-------
None
") StepBasic_Address;
		 StepBasic_Address();

		/****************** Country ******************/
		%feature("compactdefaultargs") Country;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") Country;
		opencascade::handle<TCollection_HAsciiString> Country();

		/****************** ElectronicMailAddress ******************/
		%feature("compactdefaultargs") ElectronicMailAddress;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") ElectronicMailAddress;
		opencascade::handle<TCollection_HAsciiString> ElectronicMailAddress();

		/****************** FacsimileNumber ******************/
		%feature("compactdefaultargs") FacsimileNumber;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") FacsimileNumber;
		opencascade::handle<TCollection_HAsciiString> FacsimileNumber();

		/****************** HasCountry ******************/
		%feature("compactdefaultargs") HasCountry;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") HasCountry;
		Standard_Boolean HasCountry();

		/****************** HasElectronicMailAddress ******************/
		%feature("compactdefaultargs") HasElectronicMailAddress;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") HasElectronicMailAddress;
		Standard_Boolean HasElectronicMailAddress();

		/****************** HasFacsimileNumber ******************/
		%feature("compactdefaultargs") HasFacsimileNumber;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") HasFacsimileNumber;
		Standard_Boolean HasFacsimileNumber();

		/****************** HasInternalLocation ******************/
		%feature("compactdefaultargs") HasInternalLocation;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") HasInternalLocation;
		Standard_Boolean HasInternalLocation();

		/****************** HasPostalBox ******************/
		%feature("compactdefaultargs") HasPostalBox;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") HasPostalBox;
		Standard_Boolean HasPostalBox();

		/****************** HasPostalCode ******************/
		%feature("compactdefaultargs") HasPostalCode;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") HasPostalCode;
		Standard_Boolean HasPostalCode();

		/****************** HasRegion ******************/
		%feature("compactdefaultargs") HasRegion;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") HasRegion;
		Standard_Boolean HasRegion();

		/****************** HasStreet ******************/
		%feature("compactdefaultargs") HasStreet;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") HasStreet;
		Standard_Boolean HasStreet();

		/****************** HasStreetNumber ******************/
		%feature("compactdefaultargs") HasStreetNumber;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") HasStreetNumber;
		Standard_Boolean HasStreetNumber();

		/****************** HasTelephoneNumber ******************/
		%feature("compactdefaultargs") HasTelephoneNumber;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") HasTelephoneNumber;
		Standard_Boolean HasTelephoneNumber();

		/****************** HasTelexNumber ******************/
		%feature("compactdefaultargs") HasTelexNumber;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") HasTelexNumber;
		Standard_Boolean HasTelexNumber();

		/****************** HasTown ******************/
		%feature("compactdefaultargs") HasTown;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") HasTown;
		Standard_Boolean HasTown();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Parameters
----------
hasAinternalLocation: bool
aInternalLocation: TCollection_HAsciiString
hasAstreetNumber: bool
aStreetNumber: TCollection_HAsciiString
hasAstreet: bool
aStreet: TCollection_HAsciiString
hasApostalBox: bool
aPostalBox: TCollection_HAsciiString
hasAtown: bool
aTown: TCollection_HAsciiString
hasAregion: bool
aRegion: TCollection_HAsciiString
hasApostalCode: bool
aPostalCode: TCollection_HAsciiString
hasAcountry: bool
aCountry: TCollection_HAsciiString
hasAfacsimileNumber: bool
aFacsimileNumber: TCollection_HAsciiString
hasAtelephoneNumber: bool
aTelephoneNumber: TCollection_HAsciiString
hasAelectronicMailAddress: bool
aElectronicMailAddress: TCollection_HAsciiString
hasAtelexNumber: bool
aTelexNumber: TCollection_HAsciiString

Returns
-------
None
") Init;
		void Init(const Standard_Boolean hasAinternalLocation, const opencascade::handle<TCollection_HAsciiString> & aInternalLocation, const Standard_Boolean hasAstreetNumber, const opencascade::handle<TCollection_HAsciiString> & aStreetNumber, const Standard_Boolean hasAstreet, const opencascade::handle<TCollection_HAsciiString> & aStreet, const Standard_Boolean hasApostalBox, const opencascade::handle<TCollection_HAsciiString> & aPostalBox, const Standard_Boolean hasAtown, const opencascade::handle<TCollection_HAsciiString> & aTown, const Standard_Boolean hasAregion, const opencascade::handle<TCollection_HAsciiString> & aRegion, const Standard_Boolean hasApostalCode, const opencascade::handle<TCollection_HAsciiString> & aPostalCode, const Standard_Boolean hasAcountry, const opencascade::handle<TCollection_HAsciiString> & aCountry, const Standard_Boolean hasAfacsimileNumber, const opencascade::handle<TCollection_HAsciiString> & aFacsimileNumber, const Standard_Boolean hasAtelephoneNumber, const opencascade::handle<TCollection_HAsciiString> & aTelephoneNumber, const Standard_Boolean hasAelectronicMailAddress, const opencascade::handle<TCollection_HAsciiString> & aElectronicMailAddress, const Standard_Boolean hasAtelexNumber, const opencascade::handle<TCollection_HAsciiString> & aTelexNumber);

		/****************** InternalLocation ******************/
		%feature("compactdefaultargs") InternalLocation;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") InternalLocation;
		opencascade::handle<TCollection_HAsciiString> InternalLocation();

		/****************** PostalBox ******************/
		%feature("compactdefaultargs") PostalBox;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") PostalBox;
		opencascade::handle<TCollection_HAsciiString> PostalBox();

		/****************** PostalCode ******************/
		%feature("compactdefaultargs") PostalCode;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") PostalCode;
		opencascade::handle<TCollection_HAsciiString> PostalCode();

		/****************** Region ******************/
		%feature("compactdefaultargs") Region;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") Region;
		opencascade::handle<TCollection_HAsciiString> Region();

		/****************** SetCountry ******************/
		%feature("compactdefaultargs") SetCountry;
		%feature("autodoc", "No available documentation.

Parameters
----------
aCountry: TCollection_HAsciiString

Returns
-------
None
") SetCountry;
		void SetCountry(const opencascade::handle<TCollection_HAsciiString> & aCountry);

		/****************** SetElectronicMailAddress ******************/
		%feature("compactdefaultargs") SetElectronicMailAddress;
		%feature("autodoc", "No available documentation.

Parameters
----------
aElectronicMailAddress: TCollection_HAsciiString

Returns
-------
None
") SetElectronicMailAddress;
		void SetElectronicMailAddress(const opencascade::handle<TCollection_HAsciiString> & aElectronicMailAddress);

		/****************** SetFacsimileNumber ******************/
		%feature("compactdefaultargs") SetFacsimileNumber;
		%feature("autodoc", "No available documentation.

Parameters
----------
aFacsimileNumber: TCollection_HAsciiString

Returns
-------
None
") SetFacsimileNumber;
		void SetFacsimileNumber(const opencascade::handle<TCollection_HAsciiString> & aFacsimileNumber);

		/****************** SetInternalLocation ******************/
		%feature("compactdefaultargs") SetInternalLocation;
		%feature("autodoc", "No available documentation.

Parameters
----------
aInternalLocation: TCollection_HAsciiString

Returns
-------
None
") SetInternalLocation;
		void SetInternalLocation(const opencascade::handle<TCollection_HAsciiString> & aInternalLocation);

		/****************** SetPostalBox ******************/
		%feature("compactdefaultargs") SetPostalBox;
		%feature("autodoc", "No available documentation.

Parameters
----------
aPostalBox: TCollection_HAsciiString

Returns
-------
None
") SetPostalBox;
		void SetPostalBox(const opencascade::handle<TCollection_HAsciiString> & aPostalBox);

		/****************** SetPostalCode ******************/
		%feature("compactdefaultargs") SetPostalCode;
		%feature("autodoc", "No available documentation.

Parameters
----------
aPostalCode: TCollection_HAsciiString

Returns
-------
None
") SetPostalCode;
		void SetPostalCode(const opencascade::handle<TCollection_HAsciiString> & aPostalCode);

		/****************** SetRegion ******************/
		%feature("compactdefaultargs") SetRegion;
		%feature("autodoc", "No available documentation.

Parameters
----------
aRegion: TCollection_HAsciiString

Returns
-------
None
") SetRegion;
		void SetRegion(const opencascade::handle<TCollection_HAsciiString> & aRegion);

		/****************** SetStreet ******************/
		%feature("compactdefaultargs") SetStreet;
		%feature("autodoc", "No available documentation.

Parameters
----------
aStreet: TCollection_HAsciiString

Returns
-------
None
") SetStreet;
		void SetStreet(const opencascade::handle<TCollection_HAsciiString> & aStreet);

		/****************** SetStreetNumber ******************/
		%feature("compactdefaultargs") SetStreetNumber;
		%feature("autodoc", "No available documentation.

Parameters
----------
aStreetNumber: TCollection_HAsciiString

Returns
-------
None
") SetStreetNumber;
		void SetStreetNumber(const opencascade::handle<TCollection_HAsciiString> & aStreetNumber);

		/****************** SetTelephoneNumber ******************/
		%feature("compactdefaultargs") SetTelephoneNumber;
		%feature("autodoc", "No available documentation.

Parameters
----------
aTelephoneNumber: TCollection_HAsciiString

Returns
-------
None
") SetTelephoneNumber;
		void SetTelephoneNumber(const opencascade::handle<TCollection_HAsciiString> & aTelephoneNumber);

		/****************** SetTelexNumber ******************/
		%feature("compactdefaultargs") SetTelexNumber;
		%feature("autodoc", "No available documentation.

Parameters
----------
aTelexNumber: TCollection_HAsciiString

Returns
-------
None
") SetTelexNumber;
		void SetTelexNumber(const opencascade::handle<TCollection_HAsciiString> & aTelexNumber);

		/****************** SetTown ******************/
		%feature("compactdefaultargs") SetTown;
		%feature("autodoc", "No available documentation.

Parameters
----------
aTown: TCollection_HAsciiString

Returns
-------
None
") SetTown;
		void SetTown(const opencascade::handle<TCollection_HAsciiString> & aTown);

		/****************** Street ******************/
		%feature("compactdefaultargs") Street;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") Street;
		opencascade::handle<TCollection_HAsciiString> Street();

		/****************** StreetNumber ******************/
		%feature("compactdefaultargs") StreetNumber;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") StreetNumber;
		opencascade::handle<TCollection_HAsciiString> StreetNumber();

		/****************** TelephoneNumber ******************/
		%feature("compactdefaultargs") TelephoneNumber;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") TelephoneNumber;
		opencascade::handle<TCollection_HAsciiString> TelephoneNumber();

		/****************** TelexNumber ******************/
		%feature("compactdefaultargs") TelexNumber;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") TelexNumber;
		opencascade::handle<TCollection_HAsciiString> TelexNumber();

		/****************** Town ******************/
		%feature("compactdefaultargs") Town;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") Town;
		opencascade::handle<TCollection_HAsciiString> Town();

		/****************** UnSetCountry ******************/
		%feature("compactdefaultargs") UnSetCountry;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") UnSetCountry;
		void UnSetCountry();

		/****************** UnSetElectronicMailAddress ******************/
		%feature("compactdefaultargs") UnSetElectronicMailAddress;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") UnSetElectronicMailAddress;
		void UnSetElectronicMailAddress();

		/****************** UnSetFacsimileNumber ******************/
		%feature("compactdefaultargs") UnSetFacsimileNumber;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") UnSetFacsimileNumber;
		void UnSetFacsimileNumber();

		/****************** UnSetInternalLocation ******************/
		%feature("compactdefaultargs") UnSetInternalLocation;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") UnSetInternalLocation;
		void UnSetInternalLocation();

		/****************** UnSetPostalBox ******************/
		%feature("compactdefaultargs") UnSetPostalBox;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") UnSetPostalBox;
		void UnSetPostalBox();

		/****************** UnSetPostalCode ******************/
		%feature("compactdefaultargs") UnSetPostalCode;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") UnSetPostalCode;
		void UnSetPostalCode();

		/****************** UnSetRegion ******************/
		%feature("compactdefaultargs") UnSetRegion;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") UnSetRegion;
		void UnSetRegion();

		/****************** UnSetStreet ******************/
		%feature("compactdefaultargs") UnSetStreet;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") UnSetStreet;
		void UnSetStreet();

		/****************** UnSetStreetNumber ******************/
		%feature("compactdefaultargs") UnSetStreetNumber;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") UnSetStreetNumber;
		void UnSetStreetNumber();

		/****************** UnSetTelephoneNumber ******************/
		%feature("compactdefaultargs") UnSetTelephoneNumber;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") UnSetTelephoneNumber;
		void UnSetTelephoneNumber();

		/****************** UnSetTelexNumber ******************/
		%feature("compactdefaultargs") UnSetTelexNumber;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") UnSetTelexNumber;
		void UnSetTelexNumber();

		/****************** UnSetTown ******************/
		%feature("compactdefaultargs") UnSetTown;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") UnSetTown;
		void UnSetTown();

};


%make_alias(StepBasic_Address)

%extend StepBasic_Address {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************************
* class StepBasic_ApplicationContext *
*************************************/
class StepBasic_ApplicationContext : public Standard_Transient {
	public:
		/****************** StepBasic_ApplicationContext ******************/
		%feature("compactdefaultargs") StepBasic_ApplicationContext;
		%feature("autodoc", "Returns a applicationcontext.

Returns
-------
None
") StepBasic_ApplicationContext;
		 StepBasic_ApplicationContext();

		/****************** Application ******************/
		%feature("compactdefaultargs") Application;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") Application;
		opencascade::handle<TCollection_HAsciiString> Application();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Parameters
----------
aApplication: TCollection_HAsciiString

Returns
-------
None
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aApplication);

		/****************** SetApplication ******************/
		%feature("compactdefaultargs") SetApplication;
		%feature("autodoc", "No available documentation.

Parameters
----------
aApplication: TCollection_HAsciiString

Returns
-------
None
") SetApplication;
		void SetApplication(const opencascade::handle<TCollection_HAsciiString> & aApplication);

};


%make_alias(StepBasic_ApplicationContext)

%extend StepBasic_ApplicationContext {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************************
* class StepBasic_ApplicationContextElement *
********************************************/
class StepBasic_ApplicationContextElement : public Standard_Transient {
	public:
		/****************** StepBasic_ApplicationContextElement ******************/
		%feature("compactdefaultargs") StepBasic_ApplicationContextElement;
		%feature("autodoc", "Returns a applicationcontextelement.

Returns
-------
None
") StepBasic_ApplicationContextElement;
		 StepBasic_ApplicationContextElement();

		/****************** FrameOfReference ******************/
		%feature("compactdefaultargs") FrameOfReference;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepBasic_ApplicationContext>
") FrameOfReference;
		opencascade::handle<StepBasic_ApplicationContext> FrameOfReference();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Parameters
----------
aName: TCollection_HAsciiString
aFrameOfReference: StepBasic_ApplicationContext

Returns
-------
None
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aName, const opencascade::handle<StepBasic_ApplicationContext> & aFrameOfReference);

		/****************** Name ******************/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") Name;
		opencascade::handle<TCollection_HAsciiString> Name();

		/****************** SetFrameOfReference ******************/
		%feature("compactdefaultargs") SetFrameOfReference;
		%feature("autodoc", "No available documentation.

Parameters
----------
aFrameOfReference: StepBasic_ApplicationContext

Returns
-------
None
") SetFrameOfReference;
		void SetFrameOfReference(const opencascade::handle<StepBasic_ApplicationContext> & aFrameOfReference);

		/****************** SetName ******************/
		%feature("compactdefaultargs") SetName;
		%feature("autodoc", "No available documentation.

Parameters
----------
aName: TCollection_HAsciiString

Returns
-------
None
") SetName;
		void SetName(const opencascade::handle<TCollection_HAsciiString> & aName);

};


%make_alias(StepBasic_ApplicationContextElement)

%extend StepBasic_ApplicationContextElement {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************************************
* class StepBasic_ApplicationProtocolDefinition *
************************************************/
class StepBasic_ApplicationProtocolDefinition : public Standard_Transient {
	public:
		/****************** StepBasic_ApplicationProtocolDefinition ******************/
		%feature("compactdefaultargs") StepBasic_ApplicationProtocolDefinition;
		%feature("autodoc", "Returns a applicationprotocoldefinition.

Returns
-------
None
") StepBasic_ApplicationProtocolDefinition;
		 StepBasic_ApplicationProtocolDefinition();

		/****************** Application ******************/
		%feature("compactdefaultargs") Application;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepBasic_ApplicationContext>
") Application;
		opencascade::handle<StepBasic_ApplicationContext> Application();

		/****************** ApplicationInterpretedModelSchemaName ******************/
		%feature("compactdefaultargs") ApplicationInterpretedModelSchemaName;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") ApplicationInterpretedModelSchemaName;
		opencascade::handle<TCollection_HAsciiString> ApplicationInterpretedModelSchemaName();

		/****************** ApplicationProtocolYear ******************/
		%feature("compactdefaultargs") ApplicationProtocolYear;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") ApplicationProtocolYear;
		Standard_Integer ApplicationProtocolYear();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Parameters
----------
aStatus: TCollection_HAsciiString
aApplicationInterpretedModelSchemaName: TCollection_HAsciiString
aApplicationProtocolYear: int
aApplication: StepBasic_ApplicationContext

Returns
-------
None
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aStatus, const opencascade::handle<TCollection_HAsciiString> & aApplicationInterpretedModelSchemaName, const Standard_Integer aApplicationProtocolYear, const opencascade::handle<StepBasic_ApplicationContext> & aApplication);

		/****************** SetApplication ******************/
		%feature("compactdefaultargs") SetApplication;
		%feature("autodoc", "No available documentation.

Parameters
----------
aApplication: StepBasic_ApplicationContext

Returns
-------
None
") SetApplication;
		void SetApplication(const opencascade::handle<StepBasic_ApplicationContext> & aApplication);

		/****************** SetApplicationInterpretedModelSchemaName ******************/
		%feature("compactdefaultargs") SetApplicationInterpretedModelSchemaName;
		%feature("autodoc", "No available documentation.

Parameters
----------
aApplicationInterpretedModelSchemaName: TCollection_HAsciiString

Returns
-------
None
") SetApplicationInterpretedModelSchemaName;
		void SetApplicationInterpretedModelSchemaName(const opencascade::handle<TCollection_HAsciiString> & aApplicationInterpretedModelSchemaName);

		/****************** SetApplicationProtocolYear ******************/
		%feature("compactdefaultargs") SetApplicationProtocolYear;
		%feature("autodoc", "No available documentation.

Parameters
----------
aApplicationProtocolYear: int

Returns
-------
None
") SetApplicationProtocolYear;
		void SetApplicationProtocolYear(const Standard_Integer aApplicationProtocolYear);

		/****************** SetStatus ******************/
		%feature("compactdefaultargs") SetStatus;
		%feature("autodoc", "No available documentation.

Parameters
----------
aStatus: TCollection_HAsciiString

Returns
-------
None
") SetStatus;
		void SetStatus(const opencascade::handle<TCollection_HAsciiString> & aStatus);

		/****************** Status ******************/
		%feature("compactdefaultargs") Status;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") Status;
		opencascade::handle<TCollection_HAsciiString> Status();

};


%make_alias(StepBasic_ApplicationProtocolDefinition)

%extend StepBasic_ApplicationProtocolDefinition {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************
* class StepBasic_Approval *
***************************/
class StepBasic_Approval : public Standard_Transient {
	public:
		/****************** StepBasic_Approval ******************/
		%feature("compactdefaultargs") StepBasic_Approval;
		%feature("autodoc", "Returns a approval.

Returns
-------
None
") StepBasic_Approval;
		 StepBasic_Approval();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Parameters
----------
aStatus: StepBasic_ApprovalStatus
aLevel: TCollection_HAsciiString

Returns
-------
None
") Init;
		void Init(const opencascade::handle<StepBasic_ApprovalStatus> & aStatus, const opencascade::handle<TCollection_HAsciiString> & aLevel);

		/****************** Level ******************/
		%feature("compactdefaultargs") Level;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") Level;
		opencascade::handle<TCollection_HAsciiString> Level();

		/****************** SetLevel ******************/
		%feature("compactdefaultargs") SetLevel;
		%feature("autodoc", "No available documentation.

Parameters
----------
aLevel: TCollection_HAsciiString

Returns
-------
None
") SetLevel;
		void SetLevel(const opencascade::handle<TCollection_HAsciiString> & aLevel);

		/****************** SetStatus ******************/
		%feature("compactdefaultargs") SetStatus;
		%feature("autodoc", "No available documentation.

Parameters
----------
aStatus: StepBasic_ApprovalStatus

Returns
-------
None
") SetStatus;
		void SetStatus(const opencascade::handle<StepBasic_ApprovalStatus> & aStatus);

		/****************** Status ******************/
		%feature("compactdefaultargs") Status;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepBasic_ApprovalStatus>
") Status;
		opencascade::handle<StepBasic_ApprovalStatus> Status();

};


%make_alias(StepBasic_Approval)

%extend StepBasic_Approval {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************************
* class StepBasic_ApprovalAssignment *
*************************************/
class StepBasic_ApprovalAssignment : public Standard_Transient {
	public:
		/****************** AssignedApproval ******************/
		%feature("compactdefaultargs") AssignedApproval;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepBasic_Approval>
") AssignedApproval;
		opencascade::handle<StepBasic_Approval> AssignedApproval();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Parameters
----------
aAssignedApproval: StepBasic_Approval

Returns
-------
None
") Init;
		void Init(const opencascade::handle<StepBasic_Approval> & aAssignedApproval);

		/****************** SetAssignedApproval ******************/
		%feature("compactdefaultargs") SetAssignedApproval;
		%feature("autodoc", "No available documentation.

Parameters
----------
aAssignedApproval: StepBasic_Approval

Returns
-------
None
") SetAssignedApproval;
		void SetAssignedApproval(const opencascade::handle<StepBasic_Approval> & aAssignedApproval);

};


%make_alias(StepBasic_ApprovalAssignment)

%extend StepBasic_ApprovalAssignment {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************************
* class StepBasic_ApprovalDateTime *
***********************************/
class StepBasic_ApprovalDateTime : public Standard_Transient {
	public:
		/****************** StepBasic_ApprovalDateTime ******************/
		%feature("compactdefaultargs") StepBasic_ApprovalDateTime;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") StepBasic_ApprovalDateTime;
		 StepBasic_ApprovalDateTime();

		/****************** DateTime ******************/
		%feature("compactdefaultargs") DateTime;
		%feature("autodoc", "No available documentation.

Returns
-------
StepBasic_DateTimeSelect
") DateTime;
		StepBasic_DateTimeSelect DateTime();

		/****************** DatedApproval ******************/
		%feature("compactdefaultargs") DatedApproval;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepBasic_Approval>
") DatedApproval;
		opencascade::handle<StepBasic_Approval> DatedApproval();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Parameters
----------
aDateTime: StepBasic_DateTimeSelect
aDatedApproval: StepBasic_Approval

Returns
-------
None
") Init;
		void Init(const StepBasic_DateTimeSelect & aDateTime, const opencascade::handle<StepBasic_Approval> & aDatedApproval);

		/****************** SetDateTime ******************/
		%feature("compactdefaultargs") SetDateTime;
		%feature("autodoc", "No available documentation.

Parameters
----------
aDateTime: StepBasic_DateTimeSelect

Returns
-------
None
") SetDateTime;
		void SetDateTime(const StepBasic_DateTimeSelect & aDateTime);

		/****************** SetDatedApproval ******************/
		%feature("compactdefaultargs") SetDatedApproval;
		%feature("autodoc", "No available documentation.

Parameters
----------
aDatedApproval: StepBasic_Approval

Returns
-------
None
") SetDatedApproval;
		void SetDatedApproval(const opencascade::handle<StepBasic_Approval> & aDatedApproval);

};


%make_alias(StepBasic_ApprovalDateTime)

%extend StepBasic_ApprovalDateTime {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************************
* class StepBasic_ApprovalPersonOrganization *
*********************************************/
class StepBasic_ApprovalPersonOrganization : public Standard_Transient {
	public:
		/****************** StepBasic_ApprovalPersonOrganization ******************/
		%feature("compactdefaultargs") StepBasic_ApprovalPersonOrganization;
		%feature("autodoc", "Returns a approvalpersonorganization.

Returns
-------
None
") StepBasic_ApprovalPersonOrganization;
		 StepBasic_ApprovalPersonOrganization();

		/****************** AuthorizedApproval ******************/
		%feature("compactdefaultargs") AuthorizedApproval;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepBasic_Approval>
") AuthorizedApproval;
		opencascade::handle<StepBasic_Approval> AuthorizedApproval();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Parameters
----------
aPersonOrganization: StepBasic_PersonOrganizationSelect
aAuthorizedApproval: StepBasic_Approval
aRole: StepBasic_ApprovalRole

Returns
-------
None
") Init;
		void Init(const StepBasic_PersonOrganizationSelect & aPersonOrganization, const opencascade::handle<StepBasic_Approval> & aAuthorizedApproval, const opencascade::handle<StepBasic_ApprovalRole> & aRole);

		/****************** PersonOrganization ******************/
		%feature("compactdefaultargs") PersonOrganization;
		%feature("autodoc", "No available documentation.

Returns
-------
StepBasic_PersonOrganizationSelect
") PersonOrganization;
		StepBasic_PersonOrganizationSelect PersonOrganization();

		/****************** Role ******************/
		%feature("compactdefaultargs") Role;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepBasic_ApprovalRole>
") Role;
		opencascade::handle<StepBasic_ApprovalRole> Role();

		/****************** SetAuthorizedApproval ******************/
		%feature("compactdefaultargs") SetAuthorizedApproval;
		%feature("autodoc", "No available documentation.

Parameters
----------
aAuthorizedApproval: StepBasic_Approval

Returns
-------
None
") SetAuthorizedApproval;
		void SetAuthorizedApproval(const opencascade::handle<StepBasic_Approval> & aAuthorizedApproval);

		/****************** SetPersonOrganization ******************/
		%feature("compactdefaultargs") SetPersonOrganization;
		%feature("autodoc", "No available documentation.

Parameters
----------
aPersonOrganization: StepBasic_PersonOrganizationSelect

Returns
-------
None
") SetPersonOrganization;
		void SetPersonOrganization(const StepBasic_PersonOrganizationSelect & aPersonOrganization);

		/****************** SetRole ******************/
		%feature("compactdefaultargs") SetRole;
		%feature("autodoc", "No available documentation.

Parameters
----------
aRole: StepBasic_ApprovalRole

Returns
-------
None
") SetRole;
		void SetRole(const opencascade::handle<StepBasic_ApprovalRole> & aRole);

};


%make_alias(StepBasic_ApprovalPersonOrganization)

%extend StepBasic_ApprovalPersonOrganization {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************************
* class StepBasic_ApprovalRelationship *
***************************************/
class StepBasic_ApprovalRelationship : public Standard_Transient {
	public:
		/****************** StepBasic_ApprovalRelationship ******************/
		%feature("compactdefaultargs") StepBasic_ApprovalRelationship;
		%feature("autodoc", "Returns a approvalrelationship.

Returns
-------
None
") StepBasic_ApprovalRelationship;
		 StepBasic_ApprovalRelationship();

		/****************** Description ******************/
		%feature("compactdefaultargs") Description;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") Description;
		opencascade::handle<TCollection_HAsciiString> Description();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Parameters
----------
aName: TCollection_HAsciiString
aDescription: TCollection_HAsciiString
aRelatingApproval: StepBasic_Approval
aRelatedApproval: StepBasic_Approval

Returns
-------
None
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aName, const opencascade::handle<TCollection_HAsciiString> & aDescription, const opencascade::handle<StepBasic_Approval> & aRelatingApproval, const opencascade::handle<StepBasic_Approval> & aRelatedApproval);

		/****************** Name ******************/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") Name;
		opencascade::handle<TCollection_HAsciiString> Name();

		/****************** RelatedApproval ******************/
		%feature("compactdefaultargs") RelatedApproval;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepBasic_Approval>
") RelatedApproval;
		opencascade::handle<StepBasic_Approval> RelatedApproval();

		/****************** RelatingApproval ******************/
		%feature("compactdefaultargs") RelatingApproval;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepBasic_Approval>
") RelatingApproval;
		opencascade::handle<StepBasic_Approval> RelatingApproval();

		/****************** SetDescription ******************/
		%feature("compactdefaultargs") SetDescription;
		%feature("autodoc", "No available documentation.

Parameters
----------
aDescription: TCollection_HAsciiString

Returns
-------
None
") SetDescription;
		void SetDescription(const opencascade::handle<TCollection_HAsciiString> & aDescription);

		/****************** SetName ******************/
		%feature("compactdefaultargs") SetName;
		%feature("autodoc", "No available documentation.

Parameters
----------
aName: TCollection_HAsciiString

Returns
-------
None
") SetName;
		void SetName(const opencascade::handle<TCollection_HAsciiString> & aName);

		/****************** SetRelatedApproval ******************/
		%feature("compactdefaultargs") SetRelatedApproval;
		%feature("autodoc", "No available documentation.

Parameters
----------
aRelatedApproval: StepBasic_Approval

Returns
-------
None
") SetRelatedApproval;
		void SetRelatedApproval(const opencascade::handle<StepBasic_Approval> & aRelatedApproval);

		/****************** SetRelatingApproval ******************/
		%feature("compactdefaultargs") SetRelatingApproval;
		%feature("autodoc", "No available documentation.

Parameters
----------
aRelatingApproval: StepBasic_Approval

Returns
-------
None
") SetRelatingApproval;
		void SetRelatingApproval(const opencascade::handle<StepBasic_Approval> & aRelatingApproval);

};


%make_alias(StepBasic_ApprovalRelationship)

%extend StepBasic_ApprovalRelationship {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************
* class StepBasic_ApprovalRole *
*******************************/
class StepBasic_ApprovalRole : public Standard_Transient {
	public:
		/****************** StepBasic_ApprovalRole ******************/
		%feature("compactdefaultargs") StepBasic_ApprovalRole;
		%feature("autodoc", "Returns a approvalrole.

Returns
-------
None
") StepBasic_ApprovalRole;
		 StepBasic_ApprovalRole();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Parameters
----------
aRole: TCollection_HAsciiString

Returns
-------
None
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aRole);

		/****************** Role ******************/
		%feature("compactdefaultargs") Role;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") Role;
		opencascade::handle<TCollection_HAsciiString> Role();

		/****************** SetRole ******************/
		%feature("compactdefaultargs") SetRole;
		%feature("autodoc", "No available documentation.

Parameters
----------
aRole: TCollection_HAsciiString

Returns
-------
None
") SetRole;
		void SetRole(const opencascade::handle<TCollection_HAsciiString> & aRole);

};


%make_alias(StepBasic_ApprovalRole)

%extend StepBasic_ApprovalRole {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************
* class StepBasic_ApprovalStatus *
*********************************/
class StepBasic_ApprovalStatus : public Standard_Transient {
	public:
		/****************** StepBasic_ApprovalStatus ******************/
		%feature("compactdefaultargs") StepBasic_ApprovalStatus;
		%feature("autodoc", "Returns a approvalstatus.

Returns
-------
None
") StepBasic_ApprovalStatus;
		 StepBasic_ApprovalStatus();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Parameters
----------
aName: TCollection_HAsciiString

Returns
-------
None
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aName);

		/****************** Name ******************/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") Name;
		opencascade::handle<TCollection_HAsciiString> Name();

		/****************** SetName ******************/
		%feature("compactdefaultargs") SetName;
		%feature("autodoc", "No available documentation.

Parameters
----------
aName: TCollection_HAsciiString

Returns
-------
None
") SetName;
		void SetName(const opencascade::handle<TCollection_HAsciiString> & aName);

};


%make_alias(StepBasic_ApprovalStatus)

%extend StepBasic_ApprovalStatus {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************
* class StepBasic_Certification *
********************************/
class StepBasic_Certification : public Standard_Transient {
	public:
		/****************** StepBasic_Certification ******************/
		%feature("compactdefaultargs") StepBasic_Certification;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") StepBasic_Certification;
		 StepBasic_Certification();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Initialize all fields (own and inherited).

Parameters
----------
aName: TCollection_HAsciiString
aPurpose: TCollection_HAsciiString
aKind: StepBasic_CertificationType

Returns
-------
None
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aName, const opencascade::handle<TCollection_HAsciiString> & aPurpose, const opencascade::handle<StepBasic_CertificationType> & aKind);

		/****************** Kind ******************/
		%feature("compactdefaultargs") Kind;
		%feature("autodoc", "Returns field kind.

Returns
-------
opencascade::handle<StepBasic_CertificationType>
") Kind;
		opencascade::handle<StepBasic_CertificationType> Kind();

		/****************** Name ******************/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "Returns field name.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") Name;
		opencascade::handle<TCollection_HAsciiString> Name();

		/****************** Purpose ******************/
		%feature("compactdefaultargs") Purpose;
		%feature("autodoc", "Returns field purpose.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") Purpose;
		opencascade::handle<TCollection_HAsciiString> Purpose();

		/****************** SetKind ******************/
		%feature("compactdefaultargs") SetKind;
		%feature("autodoc", "Set field kind.

Parameters
----------
Kind: StepBasic_CertificationType

Returns
-------
None
") SetKind;
		void SetKind(const opencascade::handle<StepBasic_CertificationType> & Kind);

		/****************** SetName ******************/
		%feature("compactdefaultargs") SetName;
		%feature("autodoc", "Set field name.

Parameters
----------
Name: TCollection_HAsciiString

Returns
-------
None
") SetName;
		void SetName(const opencascade::handle<TCollection_HAsciiString> & Name);

		/****************** SetPurpose ******************/
		%feature("compactdefaultargs") SetPurpose;
		%feature("autodoc", "Set field purpose.

Parameters
----------
Purpose: TCollection_HAsciiString

Returns
-------
None
") SetPurpose;
		void SetPurpose(const opencascade::handle<TCollection_HAsciiString> & Purpose);

};


%make_alias(StepBasic_Certification)

%extend StepBasic_Certification {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************************
* class StepBasic_CertificationAssignment *
******************************************/
class StepBasic_CertificationAssignment : public Standard_Transient {
	public:
		/****************** StepBasic_CertificationAssignment ******************/
		%feature("compactdefaultargs") StepBasic_CertificationAssignment;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") StepBasic_CertificationAssignment;
		 StepBasic_CertificationAssignment();

		/****************** AssignedCertification ******************/
		%feature("compactdefaultargs") AssignedCertification;
		%feature("autodoc", "Returns field assignedcertification.

Returns
-------
opencascade::handle<StepBasic_Certification>
") AssignedCertification;
		opencascade::handle<StepBasic_Certification> AssignedCertification();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Initialize all fields (own and inherited).

Parameters
----------
aAssignedCertification: StepBasic_Certification

Returns
-------
None
") Init;
		void Init(const opencascade::handle<StepBasic_Certification> & aAssignedCertification);

		/****************** SetAssignedCertification ******************/
		%feature("compactdefaultargs") SetAssignedCertification;
		%feature("autodoc", "Set field assignedcertification.

Parameters
----------
AssignedCertification: StepBasic_Certification

Returns
-------
None
") SetAssignedCertification;
		void SetAssignedCertification(const opencascade::handle<StepBasic_Certification> & AssignedCertification);

};


%make_alias(StepBasic_CertificationAssignment)

%extend StepBasic_CertificationAssignment {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************************
* class StepBasic_CertificationType *
************************************/
class StepBasic_CertificationType : public Standard_Transient {
	public:
		/****************** StepBasic_CertificationType ******************/
		%feature("compactdefaultargs") StepBasic_CertificationType;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") StepBasic_CertificationType;
		 StepBasic_CertificationType();

		/****************** Description ******************/
		%feature("compactdefaultargs") Description;
		%feature("autodoc", "Returns field description.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") Description;
		opencascade::handle<TCollection_HAsciiString> Description();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Initialize all fields (own and inherited).

Parameters
----------
aDescription: TCollection_HAsciiString

Returns
-------
None
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aDescription);

		/****************** SetDescription ******************/
		%feature("compactdefaultargs") SetDescription;
		%feature("autodoc", "Set field description.

Parameters
----------
Description: TCollection_HAsciiString

Returns
-------
None
") SetDescription;
		void SetDescription(const opencascade::handle<TCollection_HAsciiString> & Description);

};


%make_alias(StepBasic_CertificationType)

%extend StepBasic_CertificationType {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************************
* class StepBasic_CharacterizedObject *
**************************************/
class StepBasic_CharacterizedObject : public Standard_Transient {
	public:
		/****************** StepBasic_CharacterizedObject ******************/
		%feature("compactdefaultargs") StepBasic_CharacterizedObject;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") StepBasic_CharacterizedObject;
		 StepBasic_CharacterizedObject();

		/****************** Description ******************/
		%feature("compactdefaultargs") Description;
		%feature("autodoc", "Returns field description.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") Description;
		opencascade::handle<TCollection_HAsciiString> Description();

		/****************** HasDescription ******************/
		%feature("compactdefaultargs") HasDescription;
		%feature("autodoc", "Returns true if optional field description is defined.

Returns
-------
bool
") HasDescription;
		Standard_Boolean HasDescription();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Initialize all fields (own and inherited).

Parameters
----------
aName: TCollection_HAsciiString
hasDescription: bool
aDescription: TCollection_HAsciiString

Returns
-------
None
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aName, const Standard_Boolean hasDescription, const opencascade::handle<TCollection_HAsciiString> & aDescription);

		/****************** Name ******************/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "Returns field name.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") Name;
		opencascade::handle<TCollection_HAsciiString> Name();

		/****************** SetDescription ******************/
		%feature("compactdefaultargs") SetDescription;
		%feature("autodoc", "Set field description.

Parameters
----------
Description: TCollection_HAsciiString

Returns
-------
None
") SetDescription;
		void SetDescription(const opencascade::handle<TCollection_HAsciiString> & Description);

		/****************** SetName ******************/
		%feature("compactdefaultargs") SetName;
		%feature("autodoc", "Set field name.

Parameters
----------
Name: TCollection_HAsciiString

Returns
-------
None
") SetName;
		void SetName(const opencascade::handle<TCollection_HAsciiString> & Name);

};


%make_alias(StepBasic_CharacterizedObject)

%extend StepBasic_CharacterizedObject {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************
* class StepBasic_Contract *
***************************/
class StepBasic_Contract : public Standard_Transient {
	public:
		/****************** StepBasic_Contract ******************/
		%feature("compactdefaultargs") StepBasic_Contract;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") StepBasic_Contract;
		 StepBasic_Contract();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Initialize all fields (own and inherited).

Parameters
----------
aName: TCollection_HAsciiString
aPurpose: TCollection_HAsciiString
aKind: StepBasic_ContractType

Returns
-------
None
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aName, const opencascade::handle<TCollection_HAsciiString> & aPurpose, const opencascade::handle<StepBasic_ContractType> & aKind);

		/****************** Kind ******************/
		%feature("compactdefaultargs") Kind;
		%feature("autodoc", "Returns field kind.

Returns
-------
opencascade::handle<StepBasic_ContractType>
") Kind;
		opencascade::handle<StepBasic_ContractType> Kind();

		/****************** Name ******************/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "Returns field name.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") Name;
		opencascade::handle<TCollection_HAsciiString> Name();

		/****************** Purpose ******************/
		%feature("compactdefaultargs") Purpose;
		%feature("autodoc", "Returns field purpose.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") Purpose;
		opencascade::handle<TCollection_HAsciiString> Purpose();

		/****************** SetKind ******************/
		%feature("compactdefaultargs") SetKind;
		%feature("autodoc", "Set field kind.

Parameters
----------
Kind: StepBasic_ContractType

Returns
-------
None
") SetKind;
		void SetKind(const opencascade::handle<StepBasic_ContractType> & Kind);

		/****************** SetName ******************/
		%feature("compactdefaultargs") SetName;
		%feature("autodoc", "Set field name.

Parameters
----------
Name: TCollection_HAsciiString

Returns
-------
None
") SetName;
		void SetName(const opencascade::handle<TCollection_HAsciiString> & Name);

		/****************** SetPurpose ******************/
		%feature("compactdefaultargs") SetPurpose;
		%feature("autodoc", "Set field purpose.

Parameters
----------
Purpose: TCollection_HAsciiString

Returns
-------
None
") SetPurpose;
		void SetPurpose(const opencascade::handle<TCollection_HAsciiString> & Purpose);

};


%make_alias(StepBasic_Contract)

%extend StepBasic_Contract {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************************
* class StepBasic_ContractAssignment *
*************************************/
class StepBasic_ContractAssignment : public Standard_Transient {
	public:
		/****************** StepBasic_ContractAssignment ******************/
		%feature("compactdefaultargs") StepBasic_ContractAssignment;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") StepBasic_ContractAssignment;
		 StepBasic_ContractAssignment();

		/****************** AssignedContract ******************/
		%feature("compactdefaultargs") AssignedContract;
		%feature("autodoc", "Returns field assignedcontract.

Returns
-------
opencascade::handle<StepBasic_Contract>
") AssignedContract;
		opencascade::handle<StepBasic_Contract> AssignedContract();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Initialize all fields (own and inherited).

Parameters
----------
aAssignedContract: StepBasic_Contract

Returns
-------
None
") Init;
		void Init(const opencascade::handle<StepBasic_Contract> & aAssignedContract);

		/****************** SetAssignedContract ******************/
		%feature("compactdefaultargs") SetAssignedContract;
		%feature("autodoc", "Set field assignedcontract.

Parameters
----------
AssignedContract: StepBasic_Contract

Returns
-------
None
") SetAssignedContract;
		void SetAssignedContract(const opencascade::handle<StepBasic_Contract> & AssignedContract);

};


%make_alias(StepBasic_ContractAssignment)

%extend StepBasic_ContractAssignment {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************
* class StepBasic_ContractType *
*******************************/
class StepBasic_ContractType : public Standard_Transient {
	public:
		/****************** StepBasic_ContractType ******************/
		%feature("compactdefaultargs") StepBasic_ContractType;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") StepBasic_ContractType;
		 StepBasic_ContractType();

		/****************** Description ******************/
		%feature("compactdefaultargs") Description;
		%feature("autodoc", "Returns field description.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") Description;
		opencascade::handle<TCollection_HAsciiString> Description();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Initialize all fields (own and inherited).

Parameters
----------
aDescription: TCollection_HAsciiString

Returns
-------
None
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aDescription);

		/****************** SetDescription ******************/
		%feature("compactdefaultargs") SetDescription;
		%feature("autodoc", "Set field description.

Parameters
----------
Description: TCollection_HAsciiString

Returns
-------
None
") SetDescription;
		void SetDescription(const opencascade::handle<TCollection_HAsciiString> & Description);

};


%make_alias(StepBasic_ContractType)

%extend StepBasic_ContractType {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************************************
* class StepBasic_CoordinatedUniversalTimeOffset *
*************************************************/
class StepBasic_CoordinatedUniversalTimeOffset : public Standard_Transient {
	public:
		/****************** StepBasic_CoordinatedUniversalTimeOffset ******************/
		%feature("compactdefaultargs") StepBasic_CoordinatedUniversalTimeOffset;
		%feature("autodoc", "Returns a coordinateduniversaltimeoffset.

Returns
-------
None
") StepBasic_CoordinatedUniversalTimeOffset;
		 StepBasic_CoordinatedUniversalTimeOffset();

		/****************** HasMinuteOffset ******************/
		%feature("compactdefaultargs") HasMinuteOffset;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") HasMinuteOffset;
		Standard_Boolean HasMinuteOffset();

		/****************** HourOffset ******************/
		%feature("compactdefaultargs") HourOffset;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") HourOffset;
		Standard_Integer HourOffset();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Parameters
----------
aHourOffset: int
hasAminuteOffset: bool
aMinuteOffset: int
aSense: StepBasic_AheadOrBehind

Returns
-------
None
") Init;
		void Init(const Standard_Integer aHourOffset, const Standard_Boolean hasAminuteOffset, const Standard_Integer aMinuteOffset, const StepBasic_AheadOrBehind aSense);

		/****************** MinuteOffset ******************/
		%feature("compactdefaultargs") MinuteOffset;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") MinuteOffset;
		Standard_Integer MinuteOffset();

		/****************** Sense ******************/
		%feature("compactdefaultargs") Sense;
		%feature("autodoc", "No available documentation.

Returns
-------
StepBasic_AheadOrBehind
") Sense;
		StepBasic_AheadOrBehind Sense();

		/****************** SetHourOffset ******************/
		%feature("compactdefaultargs") SetHourOffset;
		%feature("autodoc", "No available documentation.

Parameters
----------
aHourOffset: int

Returns
-------
None
") SetHourOffset;
		void SetHourOffset(const Standard_Integer aHourOffset);

		/****************** SetMinuteOffset ******************/
		%feature("compactdefaultargs") SetMinuteOffset;
		%feature("autodoc", "No available documentation.

Parameters
----------
aMinuteOffset: int

Returns
-------
None
") SetMinuteOffset;
		void SetMinuteOffset(const Standard_Integer aMinuteOffset);

		/****************** SetSense ******************/
		%feature("compactdefaultargs") SetSense;
		%feature("autodoc", "No available documentation.

Parameters
----------
aSense: StepBasic_AheadOrBehind

Returns
-------
None
") SetSense;
		void SetSense(const StepBasic_AheadOrBehind aSense);

		/****************** UnSetMinuteOffset ******************/
		%feature("compactdefaultargs") UnSetMinuteOffset;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") UnSetMinuteOffset;
		void UnSetMinuteOffset();

};


%make_alias(StepBasic_CoordinatedUniversalTimeOffset)

%extend StepBasic_CoordinatedUniversalTimeOffset {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************
* class StepBasic_Date *
***********************/
class StepBasic_Date : public Standard_Transient {
	public:
		/****************** StepBasic_Date ******************/
		%feature("compactdefaultargs") StepBasic_Date;
		%feature("autodoc", "Returns a date.

Returns
-------
None
") StepBasic_Date;
		 StepBasic_Date();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Parameters
----------
aYearComponent: int

Returns
-------
None
") Init;
		void Init(const Standard_Integer aYearComponent);

		/****************** SetYearComponent ******************/
		%feature("compactdefaultargs") SetYearComponent;
		%feature("autodoc", "No available documentation.

Parameters
----------
aYearComponent: int

Returns
-------
None
") SetYearComponent;
		void SetYearComponent(const Standard_Integer aYearComponent);

		/****************** YearComponent ******************/
		%feature("compactdefaultargs") YearComponent;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") YearComponent;
		Standard_Integer YearComponent();

};


%make_alias(StepBasic_Date)

%extend StepBasic_Date {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************
* class StepBasic_DateAndTime *
******************************/
class StepBasic_DateAndTime : public Standard_Transient {
	public:
		/****************** StepBasic_DateAndTime ******************/
		%feature("compactdefaultargs") StepBasic_DateAndTime;
		%feature("autodoc", "Returns a dateandtime.

Returns
-------
None
") StepBasic_DateAndTime;
		 StepBasic_DateAndTime();

		/****************** DateComponent ******************/
		%feature("compactdefaultargs") DateComponent;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepBasic_Date>
") DateComponent;
		opencascade::handle<StepBasic_Date> DateComponent();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Parameters
----------
aDateComponent: StepBasic_Date
aTimeComponent: StepBasic_LocalTime

Returns
-------
None
") Init;
		void Init(const opencascade::handle<StepBasic_Date> & aDateComponent, const opencascade::handle<StepBasic_LocalTime> & aTimeComponent);

		/****************** SetDateComponent ******************/
		%feature("compactdefaultargs") SetDateComponent;
		%feature("autodoc", "No available documentation.

Parameters
----------
aDateComponent: StepBasic_Date

Returns
-------
None
") SetDateComponent;
		void SetDateComponent(const opencascade::handle<StepBasic_Date> & aDateComponent);

		/****************** SetTimeComponent ******************/
		%feature("compactdefaultargs") SetTimeComponent;
		%feature("autodoc", "No available documentation.

Parameters
----------
aTimeComponent: StepBasic_LocalTime

Returns
-------
None
") SetTimeComponent;
		void SetTimeComponent(const opencascade::handle<StepBasic_LocalTime> & aTimeComponent);

		/****************** TimeComponent ******************/
		%feature("compactdefaultargs") TimeComponent;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepBasic_LocalTime>
") TimeComponent;
		opencascade::handle<StepBasic_LocalTime> TimeComponent();

};


%make_alias(StepBasic_DateAndTime)

%extend StepBasic_DateAndTime {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************************
* class StepBasic_DateAndTimeAssignment *
****************************************/
class StepBasic_DateAndTimeAssignment : public Standard_Transient {
	public:
		/****************** AssignedDateAndTime ******************/
		%feature("compactdefaultargs") AssignedDateAndTime;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepBasic_DateAndTime>
") AssignedDateAndTime;
		opencascade::handle<StepBasic_DateAndTime> AssignedDateAndTime();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Parameters
----------
aAssignedDateAndTime: StepBasic_DateAndTime
aRole: StepBasic_DateTimeRole

Returns
-------
None
") Init;
		void Init(const opencascade::handle<StepBasic_DateAndTime> & aAssignedDateAndTime, const opencascade::handle<StepBasic_DateTimeRole> & aRole);

		/****************** Role ******************/
		%feature("compactdefaultargs") Role;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepBasic_DateTimeRole>
") Role;
		opencascade::handle<StepBasic_DateTimeRole> Role();

		/****************** SetAssignedDateAndTime ******************/
		%feature("compactdefaultargs") SetAssignedDateAndTime;
		%feature("autodoc", "No available documentation.

Parameters
----------
aAssignedDateAndTime: StepBasic_DateAndTime

Returns
-------
None
") SetAssignedDateAndTime;
		void SetAssignedDateAndTime(const opencascade::handle<StepBasic_DateAndTime> & aAssignedDateAndTime);

		/****************** SetRole ******************/
		%feature("compactdefaultargs") SetRole;
		%feature("autodoc", "No available documentation.

Parameters
----------
aRole: StepBasic_DateTimeRole

Returns
-------
None
") SetRole;
		void SetRole(const opencascade::handle<StepBasic_DateTimeRole> & aRole);

};


%make_alias(StepBasic_DateAndTimeAssignment)

%extend StepBasic_DateAndTimeAssignment {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************
* class StepBasic_DateAssignment *
*********************************/
class StepBasic_DateAssignment : public Standard_Transient {
	public:
		/****************** AssignedDate ******************/
		%feature("compactdefaultargs") AssignedDate;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepBasic_Date>
") AssignedDate;
		opencascade::handle<StepBasic_Date> AssignedDate();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Parameters
----------
aAssignedDate: StepBasic_Date
aRole: StepBasic_DateRole

Returns
-------
None
") Init;
		void Init(const opencascade::handle<StepBasic_Date> & aAssignedDate, const opencascade::handle<StepBasic_DateRole> & aRole);

		/****************** Role ******************/
		%feature("compactdefaultargs") Role;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepBasic_DateRole>
") Role;
		opencascade::handle<StepBasic_DateRole> Role();

		/****************** SetAssignedDate ******************/
		%feature("compactdefaultargs") SetAssignedDate;
		%feature("autodoc", "No available documentation.

Parameters
----------
aAssignedDate: StepBasic_Date

Returns
-------
None
") SetAssignedDate;
		void SetAssignedDate(const opencascade::handle<StepBasic_Date> & aAssignedDate);

		/****************** SetRole ******************/
		%feature("compactdefaultargs") SetRole;
		%feature("autodoc", "No available documentation.

Parameters
----------
aRole: StepBasic_DateRole

Returns
-------
None
") SetRole;
		void SetRole(const opencascade::handle<StepBasic_DateRole> & aRole);

};


%make_alias(StepBasic_DateAssignment)

%extend StepBasic_DateAssignment {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************
* class StepBasic_DateRole *
***************************/
class StepBasic_DateRole : public Standard_Transient {
	public:
		/****************** StepBasic_DateRole ******************/
		%feature("compactdefaultargs") StepBasic_DateRole;
		%feature("autodoc", "Returns a daterole.

Returns
-------
None
") StepBasic_DateRole;
		 StepBasic_DateRole();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Parameters
----------
aName: TCollection_HAsciiString

Returns
-------
None
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aName);

		/****************** Name ******************/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") Name;
		opencascade::handle<TCollection_HAsciiString> Name();

		/****************** SetName ******************/
		%feature("compactdefaultargs") SetName;
		%feature("autodoc", "No available documentation.

Parameters
----------
aName: TCollection_HAsciiString

Returns
-------
None
") SetName;
		void SetName(const opencascade::handle<TCollection_HAsciiString> & aName);

};


%make_alias(StepBasic_DateRole)

%extend StepBasic_DateRole {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************
* class StepBasic_DateTimeRole *
*******************************/
class StepBasic_DateTimeRole : public Standard_Transient {
	public:
		/****************** StepBasic_DateTimeRole ******************/
		%feature("compactdefaultargs") StepBasic_DateTimeRole;
		%feature("autodoc", "Returns a datetimerole.

Returns
-------
None
") StepBasic_DateTimeRole;
		 StepBasic_DateTimeRole();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Parameters
----------
aName: TCollection_HAsciiString

Returns
-------
None
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aName);

		/****************** Name ******************/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") Name;
		opencascade::handle<TCollection_HAsciiString> Name();

		/****************** SetName ******************/
		%feature("compactdefaultargs") SetName;
		%feature("autodoc", "No available documentation.

Parameters
----------
aName: TCollection_HAsciiString

Returns
-------
None
") SetName;
		void SetName(const opencascade::handle<TCollection_HAsciiString> & aName);

};


%make_alias(StepBasic_DateTimeRole)

%extend StepBasic_DateTimeRole {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************
* class StepBasic_DateTimeSelect *
*********************************/
class StepBasic_DateTimeSelect : public StepData_SelectType {
	public:
		/****************** StepBasic_DateTimeSelect ******************/
		%feature("compactdefaultargs") StepBasic_DateTimeSelect;
		%feature("autodoc", "Returns a datetimeselect selecttype.

Returns
-------
None
") StepBasic_DateTimeSelect;
		 StepBasic_DateTimeSelect();

		/****************** CaseNum ******************/
		%feature("compactdefaultargs") CaseNum;
		%feature("autodoc", "Recognizes a datetimeselect kind entity that is : 1 -> date 2 -> localtime 3 -> dateandtime 0 else.

Parameters
----------
ent: Standard_Transient

Returns
-------
int
") CaseNum;
		Standard_Integer CaseNum(const opencascade::handle<Standard_Transient> & ent);

		/****************** Date ******************/
		%feature("compactdefaultargs") Date;
		%feature("autodoc", "Returns value as a date (null if another type).

Returns
-------
opencascade::handle<StepBasic_Date>
") Date;
		opencascade::handle<StepBasic_Date> Date();

		/****************** DateAndTime ******************/
		%feature("compactdefaultargs") DateAndTime;
		%feature("autodoc", "Returns value as a dateandtime (null if another type).

Returns
-------
opencascade::handle<StepBasic_DateAndTime>
") DateAndTime;
		opencascade::handle<StepBasic_DateAndTime> DateAndTime();

		/****************** LocalTime ******************/
		%feature("compactdefaultargs") LocalTime;
		%feature("autodoc", "Returns value as a localtime (null if another type).

Returns
-------
opencascade::handle<StepBasic_LocalTime>
") LocalTime;
		opencascade::handle<StepBasic_LocalTime> LocalTime();

};


%extend StepBasic_DateTimeSelect {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************
* class StepBasic_DerivedUnit *
******************************/
class StepBasic_DerivedUnit : public Standard_Transient {
	public:
		/****************** StepBasic_DerivedUnit ******************/
		%feature("compactdefaultargs") StepBasic_DerivedUnit;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") StepBasic_DerivedUnit;
		 StepBasic_DerivedUnit();

		/****************** Elements ******************/
		%feature("compactdefaultargs") Elements;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepBasic_HArray1OfDerivedUnitElement>
") Elements;
		opencascade::handle<StepBasic_HArray1OfDerivedUnitElement> Elements();

		/****************** ElementsValue ******************/
		%feature("compactdefaultargs") ElementsValue;
		%feature("autodoc", "No available documentation.

Parameters
----------
num: int

Returns
-------
opencascade::handle<StepBasic_DerivedUnitElement>
") ElementsValue;
		opencascade::handle<StepBasic_DerivedUnitElement> ElementsValue(const Standard_Integer num);

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Parameters
----------
elements: StepBasic_HArray1OfDerivedUnitElement

Returns
-------
None
") Init;
		void Init(const opencascade::handle<StepBasic_HArray1OfDerivedUnitElement> & elements);

		/****************** NbElements ******************/
		%feature("compactdefaultargs") NbElements;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbElements;
		Standard_Integer NbElements();

		/****************** SetElements ******************/
		%feature("compactdefaultargs") SetElements;
		%feature("autodoc", "No available documentation.

Parameters
----------
elements: StepBasic_HArray1OfDerivedUnitElement

Returns
-------
None
") SetElements;
		void SetElements(const opencascade::handle<StepBasic_HArray1OfDerivedUnitElement> & elements);

};


%make_alias(StepBasic_DerivedUnit)

%extend StepBasic_DerivedUnit {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************************
* class StepBasic_DerivedUnitElement *
*************************************/
class StepBasic_DerivedUnitElement : public Standard_Transient {
	public:
		/****************** StepBasic_DerivedUnitElement ******************/
		%feature("compactdefaultargs") StepBasic_DerivedUnitElement;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") StepBasic_DerivedUnitElement;
		 StepBasic_DerivedUnitElement();

		/****************** Exponent ******************/
		%feature("compactdefaultargs") Exponent;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") Exponent;
		Standard_Real Exponent();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Parameters
----------
aUnit: StepBasic_NamedUnit
aExponent: float

Returns
-------
None
") Init;
		void Init(const opencascade::handle<StepBasic_NamedUnit> & aUnit, const Standard_Real aExponent);

		/****************** SetExponent ******************/
		%feature("compactdefaultargs") SetExponent;
		%feature("autodoc", "No available documentation.

Parameters
----------
aExponent: float

Returns
-------
None
") SetExponent;
		void SetExponent(const Standard_Real aExponent);

		/****************** SetUnit ******************/
		%feature("compactdefaultargs") SetUnit;
		%feature("autodoc", "No available documentation.

Parameters
----------
aUnit: StepBasic_NamedUnit

Returns
-------
None
") SetUnit;
		void SetUnit(const opencascade::handle<StepBasic_NamedUnit> & aUnit);

		/****************** Unit ******************/
		%feature("compactdefaultargs") Unit;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepBasic_NamedUnit>
") Unit;
		opencascade::handle<StepBasic_NamedUnit> Unit();

};


%make_alias(StepBasic_DerivedUnitElement)

%extend StepBasic_DerivedUnitElement {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************************
* class StepBasic_DimensionalExponents *
***************************************/
class StepBasic_DimensionalExponents : public Standard_Transient {
	public:
		/****************** StepBasic_DimensionalExponents ******************/
		%feature("compactdefaultargs") StepBasic_DimensionalExponents;
		%feature("autodoc", "Returns a dimensionalexponents.

Returns
-------
None
") StepBasic_DimensionalExponents;
		 StepBasic_DimensionalExponents();

		/****************** AmountOfSubstanceExponent ******************/
		%feature("compactdefaultargs") AmountOfSubstanceExponent;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") AmountOfSubstanceExponent;
		Standard_Real AmountOfSubstanceExponent();

		/****************** ElectricCurrentExponent ******************/
		%feature("compactdefaultargs") ElectricCurrentExponent;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") ElectricCurrentExponent;
		Standard_Real ElectricCurrentExponent();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Parameters
----------
aLengthExponent: float
aMassExponent: float
aTimeExponent: float
aElectricCurrentExponent: float
aThermodynamicTemperatureExponent: float
aAmountOfSubstanceExponent: float
aLuminousIntensityExponent: float

Returns
-------
None
") Init;
		void Init(const Standard_Real aLengthExponent, const Standard_Real aMassExponent, const Standard_Real aTimeExponent, const Standard_Real aElectricCurrentExponent, const Standard_Real aThermodynamicTemperatureExponent, const Standard_Real aAmountOfSubstanceExponent, const Standard_Real aLuminousIntensityExponent);

		/****************** LengthExponent ******************/
		%feature("compactdefaultargs") LengthExponent;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") LengthExponent;
		Standard_Real LengthExponent();

		/****************** LuminousIntensityExponent ******************/
		%feature("compactdefaultargs") LuminousIntensityExponent;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") LuminousIntensityExponent;
		Standard_Real LuminousIntensityExponent();

		/****************** MassExponent ******************/
		%feature("compactdefaultargs") MassExponent;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") MassExponent;
		Standard_Real MassExponent();

		/****************** SetAmountOfSubstanceExponent ******************/
		%feature("compactdefaultargs") SetAmountOfSubstanceExponent;
		%feature("autodoc", "No available documentation.

Parameters
----------
aAmountOfSubstanceExponent: float

Returns
-------
None
") SetAmountOfSubstanceExponent;
		void SetAmountOfSubstanceExponent(const Standard_Real aAmountOfSubstanceExponent);

		/****************** SetElectricCurrentExponent ******************/
		%feature("compactdefaultargs") SetElectricCurrentExponent;
		%feature("autodoc", "No available documentation.

Parameters
----------
aElectricCurrentExponent: float

Returns
-------
None
") SetElectricCurrentExponent;
		void SetElectricCurrentExponent(const Standard_Real aElectricCurrentExponent);

		/****************** SetLengthExponent ******************/
		%feature("compactdefaultargs") SetLengthExponent;
		%feature("autodoc", "No available documentation.

Parameters
----------
aLengthExponent: float

Returns
-------
None
") SetLengthExponent;
		void SetLengthExponent(const Standard_Real aLengthExponent);

		/****************** SetLuminousIntensityExponent ******************/
		%feature("compactdefaultargs") SetLuminousIntensityExponent;
		%feature("autodoc", "No available documentation.

Parameters
----------
aLuminousIntensityExponent: float

Returns
-------
None
") SetLuminousIntensityExponent;
		void SetLuminousIntensityExponent(const Standard_Real aLuminousIntensityExponent);

		/****************** SetMassExponent ******************/
		%feature("compactdefaultargs") SetMassExponent;
		%feature("autodoc", "No available documentation.

Parameters
----------
aMassExponent: float

Returns
-------
None
") SetMassExponent;
		void SetMassExponent(const Standard_Real aMassExponent);

		/****************** SetThermodynamicTemperatureExponent ******************/
		%feature("compactdefaultargs") SetThermodynamicTemperatureExponent;
		%feature("autodoc", "No available documentation.

Parameters
----------
aThermodynamicTemperatureExponent: float

Returns
-------
None
") SetThermodynamicTemperatureExponent;
		void SetThermodynamicTemperatureExponent(const Standard_Real aThermodynamicTemperatureExponent);

		/****************** SetTimeExponent ******************/
		%feature("compactdefaultargs") SetTimeExponent;
		%feature("autodoc", "No available documentation.

Parameters
----------
aTimeExponent: float

Returns
-------
None
") SetTimeExponent;
		void SetTimeExponent(const Standard_Real aTimeExponent);

		/****************** ThermodynamicTemperatureExponent ******************/
		%feature("compactdefaultargs") ThermodynamicTemperatureExponent;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") ThermodynamicTemperatureExponent;
		Standard_Real ThermodynamicTemperatureExponent();

		/****************** TimeExponent ******************/
		%feature("compactdefaultargs") TimeExponent;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") TimeExponent;
		Standard_Real TimeExponent();

};


%make_alias(StepBasic_DimensionalExponents)

%extend StepBasic_DimensionalExponents {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************
* class StepBasic_Document *
***************************/
class StepBasic_Document : public Standard_Transient {
	public:
		/****************** StepBasic_Document ******************/
		%feature("compactdefaultargs") StepBasic_Document;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") StepBasic_Document;
		 StepBasic_Document();

		/****************** Description ******************/
		%feature("compactdefaultargs") Description;
		%feature("autodoc", "Returns field description.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") Description;
		opencascade::handle<TCollection_HAsciiString> Description();

		/****************** HasDescription ******************/
		%feature("compactdefaultargs") HasDescription;
		%feature("autodoc", "Returns true if optional field description is defined.

Returns
-------
bool
") HasDescription;
		Standard_Boolean HasDescription();

		/****************** Id ******************/
		%feature("compactdefaultargs") Id;
		%feature("autodoc", "Returns field id.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") Id;
		opencascade::handle<TCollection_HAsciiString> Id();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Initialize all fields (own and inherited).

Parameters
----------
aId: TCollection_HAsciiString
aName: TCollection_HAsciiString
hasDescription: bool
aDescription: TCollection_HAsciiString
aKind: StepBasic_DocumentType

Returns
-------
None
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aId, const opencascade::handle<TCollection_HAsciiString> & aName, const Standard_Boolean hasDescription, const opencascade::handle<TCollection_HAsciiString> & aDescription, const opencascade::handle<StepBasic_DocumentType> & aKind);

		/****************** Kind ******************/
		%feature("compactdefaultargs") Kind;
		%feature("autodoc", "Returns field kind.

Returns
-------
opencascade::handle<StepBasic_DocumentType>
") Kind;
		opencascade::handle<StepBasic_DocumentType> Kind();

		/****************** Name ******************/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "Returns field name.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") Name;
		opencascade::handle<TCollection_HAsciiString> Name();

		/****************** SetDescription ******************/
		%feature("compactdefaultargs") SetDescription;
		%feature("autodoc", "Set field description.

Parameters
----------
Description: TCollection_HAsciiString

Returns
-------
None
") SetDescription;
		void SetDescription(const opencascade::handle<TCollection_HAsciiString> & Description);

		/****************** SetId ******************/
		%feature("compactdefaultargs") SetId;
		%feature("autodoc", "Set field id.

Parameters
----------
Id: TCollection_HAsciiString

Returns
-------
None
") SetId;
		void SetId(const opencascade::handle<TCollection_HAsciiString> & Id);

		/****************** SetKind ******************/
		%feature("compactdefaultargs") SetKind;
		%feature("autodoc", "Set field kind.

Parameters
----------
Kind: StepBasic_DocumentType

Returns
-------
None
") SetKind;
		void SetKind(const opencascade::handle<StepBasic_DocumentType> & Kind);

		/****************** SetName ******************/
		%feature("compactdefaultargs") SetName;
		%feature("autodoc", "Set field name.

Parameters
----------
Name: TCollection_HAsciiString

Returns
-------
None
") SetName;
		void SetName(const opencascade::handle<TCollection_HAsciiString> & Name);

};


%make_alias(StepBasic_Document)

%extend StepBasic_Document {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************************
* class StepBasic_DocumentProductAssociation *
*********************************************/
class StepBasic_DocumentProductAssociation : public Standard_Transient {
	public:
		/****************** StepBasic_DocumentProductAssociation ******************/
		%feature("compactdefaultargs") StepBasic_DocumentProductAssociation;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") StepBasic_DocumentProductAssociation;
		 StepBasic_DocumentProductAssociation();

		/****************** Description ******************/
		%feature("compactdefaultargs") Description;
		%feature("autodoc", "Returns field description.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") Description;
		opencascade::handle<TCollection_HAsciiString> Description();

		/****************** HasDescription ******************/
		%feature("compactdefaultargs") HasDescription;
		%feature("autodoc", "Returns true if optional field description is defined.

Returns
-------
bool
") HasDescription;
		Standard_Boolean HasDescription();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Initialize all fields (own and inherited).

Parameters
----------
aName: TCollection_HAsciiString
hasDescription: bool
aDescription: TCollection_HAsciiString
aRelatingDocument: StepBasic_Document
aRelatedProduct: StepBasic_ProductOrFormationOrDefinition

Returns
-------
None
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aName, const Standard_Boolean hasDescription, const opencascade::handle<TCollection_HAsciiString> & aDescription, const opencascade::handle<StepBasic_Document> & aRelatingDocument, const StepBasic_ProductOrFormationOrDefinition & aRelatedProduct);

		/****************** Name ******************/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "Returns field name.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") Name;
		opencascade::handle<TCollection_HAsciiString> Name();

		/****************** RelatedProduct ******************/
		%feature("compactdefaultargs") RelatedProduct;
		%feature("autodoc", "Returns field relatedproduct.

Returns
-------
StepBasic_ProductOrFormationOrDefinition
") RelatedProduct;
		StepBasic_ProductOrFormationOrDefinition RelatedProduct();

		/****************** RelatingDocument ******************/
		%feature("compactdefaultargs") RelatingDocument;
		%feature("autodoc", "Returns field relatingdocument.

Returns
-------
opencascade::handle<StepBasic_Document>
") RelatingDocument;
		opencascade::handle<StepBasic_Document> RelatingDocument();

		/****************** SetDescription ******************/
		%feature("compactdefaultargs") SetDescription;
		%feature("autodoc", "Set field description.

Parameters
----------
Description: TCollection_HAsciiString

Returns
-------
None
") SetDescription;
		void SetDescription(const opencascade::handle<TCollection_HAsciiString> & Description);

		/****************** SetName ******************/
		%feature("compactdefaultargs") SetName;
		%feature("autodoc", "Set field name.

Parameters
----------
Name: TCollection_HAsciiString

Returns
-------
None
") SetName;
		void SetName(const opencascade::handle<TCollection_HAsciiString> & Name);

		/****************** SetRelatedProduct ******************/
		%feature("compactdefaultargs") SetRelatedProduct;
		%feature("autodoc", "Set field relatedproduct.

Parameters
----------
RelatedProduct: StepBasic_ProductOrFormationOrDefinition

Returns
-------
None
") SetRelatedProduct;
		void SetRelatedProduct(const StepBasic_ProductOrFormationOrDefinition & RelatedProduct);

		/****************** SetRelatingDocument ******************/
		%feature("compactdefaultargs") SetRelatingDocument;
		%feature("autodoc", "Set field relatingdocument.

Parameters
----------
RelatingDocument: StepBasic_Document

Returns
-------
None
") SetRelatingDocument;
		void SetRelatingDocument(const opencascade::handle<StepBasic_Document> & RelatingDocument);

};


%make_alias(StepBasic_DocumentProductAssociation)

%extend StepBasic_DocumentProductAssociation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************************
* class StepBasic_DocumentReference *
************************************/
class StepBasic_DocumentReference : public Standard_Transient {
	public:
		/****************** AssignedDocument ******************/
		%feature("compactdefaultargs") AssignedDocument;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepBasic_Document>
") AssignedDocument;
		opencascade::handle<StepBasic_Document> AssignedDocument();

		/****************** Init0 ******************/
		%feature("compactdefaultargs") Init0;
		%feature("autodoc", "No available documentation.

Parameters
----------
aAssignedDocument: StepBasic_Document
aSource: TCollection_HAsciiString

Returns
-------
None
") Init0;
		void Init0(const opencascade::handle<StepBasic_Document> & aAssignedDocument, const opencascade::handle<TCollection_HAsciiString> & aSource);

		/****************** SetAssignedDocument ******************/
		%feature("compactdefaultargs") SetAssignedDocument;
		%feature("autodoc", "No available documentation.

Parameters
----------
aAssignedDocument: StepBasic_Document

Returns
-------
None
") SetAssignedDocument;
		void SetAssignedDocument(const opencascade::handle<StepBasic_Document> & aAssignedDocument);

		/****************** SetSource ******************/
		%feature("compactdefaultargs") SetSource;
		%feature("autodoc", "No available documentation.

Parameters
----------
aSource: TCollection_HAsciiString

Returns
-------
None
") SetSource;
		void SetSource(const opencascade::handle<TCollection_HAsciiString> & aSource);

		/****************** Source ******************/
		%feature("compactdefaultargs") Source;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") Source;
		opencascade::handle<TCollection_HAsciiString> Source();

};


%make_alias(StepBasic_DocumentReference)

%extend StepBasic_DocumentReference {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************************
* class StepBasic_DocumentRelationship *
***************************************/
class StepBasic_DocumentRelationship : public Standard_Transient {
	public:
		/****************** StepBasic_DocumentRelationship ******************/
		%feature("compactdefaultargs") StepBasic_DocumentRelationship;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") StepBasic_DocumentRelationship;
		 StepBasic_DocumentRelationship();

		/****************** Description ******************/
		%feature("compactdefaultargs") Description;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") Description;
		opencascade::handle<TCollection_HAsciiString> Description();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Parameters
----------
aName: TCollection_HAsciiString
aDescription: TCollection_HAsciiString
aRelating: StepBasic_Document
aRelated: StepBasic_Document

Returns
-------
None
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aName, const opencascade::handle<TCollection_HAsciiString> & aDescription, const opencascade::handle<StepBasic_Document> & aRelating, const opencascade::handle<StepBasic_Document> & aRelated);

		/****************** Name ******************/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") Name;
		opencascade::handle<TCollection_HAsciiString> Name();

		/****************** RelatedDocument ******************/
		%feature("compactdefaultargs") RelatedDocument;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepBasic_Document>
") RelatedDocument;
		opencascade::handle<StepBasic_Document> RelatedDocument();

		/****************** RelatingDocument ******************/
		%feature("compactdefaultargs") RelatingDocument;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepBasic_Document>
") RelatingDocument;
		opencascade::handle<StepBasic_Document> RelatingDocument();

		/****************** SetDescription ******************/
		%feature("compactdefaultargs") SetDescription;
		%feature("autodoc", "No available documentation.

Parameters
----------
aDescription: TCollection_HAsciiString

Returns
-------
None
") SetDescription;
		void SetDescription(const opencascade::handle<TCollection_HAsciiString> & aDescription);

		/****************** SetName ******************/
		%feature("compactdefaultargs") SetName;
		%feature("autodoc", "No available documentation.

Parameters
----------
aName: TCollection_HAsciiString

Returns
-------
None
") SetName;
		void SetName(const opencascade::handle<TCollection_HAsciiString> & aName);

		/****************** SetRelatedDocument ******************/
		%feature("compactdefaultargs") SetRelatedDocument;
		%feature("autodoc", "No available documentation.

Parameters
----------
aRelated: StepBasic_Document

Returns
-------
None
") SetRelatedDocument;
		void SetRelatedDocument(const opencascade::handle<StepBasic_Document> & aRelated);

		/****************** SetRelatingDocument ******************/
		%feature("compactdefaultargs") SetRelatingDocument;
		%feature("autodoc", "No available documentation.

Parameters
----------
aRelating: StepBasic_Document

Returns
-------
None
") SetRelatingDocument;
		void SetRelatingDocument(const opencascade::handle<StepBasic_Document> & aRelating);

};


%make_alias(StepBasic_DocumentRelationship)

%extend StepBasic_DocumentRelationship {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************************
* class StepBasic_DocumentRepresentationType *
*********************************************/
class StepBasic_DocumentRepresentationType : public Standard_Transient {
	public:
		/****************** StepBasic_DocumentRepresentationType ******************/
		%feature("compactdefaultargs") StepBasic_DocumentRepresentationType;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") StepBasic_DocumentRepresentationType;
		 StepBasic_DocumentRepresentationType();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Initialize all fields (own and inherited).

Parameters
----------
aName: TCollection_HAsciiString
aRepresentedDocument: StepBasic_Document

Returns
-------
None
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aName, const opencascade::handle<StepBasic_Document> & aRepresentedDocument);

		/****************** Name ******************/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "Returns field name.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") Name;
		opencascade::handle<TCollection_HAsciiString> Name();

		/****************** RepresentedDocument ******************/
		%feature("compactdefaultargs") RepresentedDocument;
		%feature("autodoc", "Returns field representeddocument.

Returns
-------
opencascade::handle<StepBasic_Document>
") RepresentedDocument;
		opencascade::handle<StepBasic_Document> RepresentedDocument();

		/****************** SetName ******************/
		%feature("compactdefaultargs") SetName;
		%feature("autodoc", "Set field name.

Parameters
----------
Name: TCollection_HAsciiString

Returns
-------
None
") SetName;
		void SetName(const opencascade::handle<TCollection_HAsciiString> & Name);

		/****************** SetRepresentedDocument ******************/
		%feature("compactdefaultargs") SetRepresentedDocument;
		%feature("autodoc", "Set field representeddocument.

Parameters
----------
RepresentedDocument: StepBasic_Document

Returns
-------
None
") SetRepresentedDocument;
		void SetRepresentedDocument(const opencascade::handle<StepBasic_Document> & RepresentedDocument);

};


%make_alias(StepBasic_DocumentRepresentationType)

%extend StepBasic_DocumentRepresentationType {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************
* class StepBasic_DocumentType *
*******************************/
class StepBasic_DocumentType : public Standard_Transient {
	public:
		/****************** StepBasic_DocumentType ******************/
		%feature("compactdefaultargs") StepBasic_DocumentType;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") StepBasic_DocumentType;
		 StepBasic_DocumentType();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Parameters
----------
apdt: TCollection_HAsciiString

Returns
-------
None
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & apdt);

		/****************** ProductDataType ******************/
		%feature("compactdefaultargs") ProductDataType;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") ProductDataType;
		opencascade::handle<TCollection_HAsciiString> ProductDataType();

		/****************** SetProductDataType ******************/
		%feature("compactdefaultargs") SetProductDataType;
		%feature("autodoc", "No available documentation.

Parameters
----------
apdt: TCollection_HAsciiString

Returns
-------
None
") SetProductDataType;
		void SetProductDataType(const opencascade::handle<TCollection_HAsciiString> & apdt);

};


%make_alias(StepBasic_DocumentType)

%extend StepBasic_DocumentType {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************************
* class StepBasic_DocumentUsageConstraint *
******************************************/
class StepBasic_DocumentUsageConstraint : public Standard_Transient {
	public:
		/****************** StepBasic_DocumentUsageConstraint ******************/
		%feature("compactdefaultargs") StepBasic_DocumentUsageConstraint;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") StepBasic_DocumentUsageConstraint;
		 StepBasic_DocumentUsageConstraint();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Parameters
----------
aSource: StepBasic_Document
ase: TCollection_HAsciiString
asev: TCollection_HAsciiString

Returns
-------
None
") Init;
		void Init(const opencascade::handle<StepBasic_Document> & aSource, const opencascade::handle<TCollection_HAsciiString> & ase, const opencascade::handle<TCollection_HAsciiString> & asev);

		/****************** SetSource ******************/
		%feature("compactdefaultargs") SetSource;
		%feature("autodoc", "No available documentation.

Parameters
----------
aSource: StepBasic_Document

Returns
-------
None
") SetSource;
		void SetSource(const opencascade::handle<StepBasic_Document> & aSource);

		/****************** SetSubjectElement ******************/
		%feature("compactdefaultargs") SetSubjectElement;
		%feature("autodoc", "No available documentation.

Parameters
----------
ase: TCollection_HAsciiString

Returns
-------
None
") SetSubjectElement;
		void SetSubjectElement(const opencascade::handle<TCollection_HAsciiString> & ase);

		/****************** SetSubjectElementValue ******************/
		%feature("compactdefaultargs") SetSubjectElementValue;
		%feature("autodoc", "No available documentation.

Parameters
----------
asev: TCollection_HAsciiString

Returns
-------
None
") SetSubjectElementValue;
		void SetSubjectElementValue(const opencascade::handle<TCollection_HAsciiString> & asev);

		/****************** Source ******************/
		%feature("compactdefaultargs") Source;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepBasic_Document>
") Source;
		opencascade::handle<StepBasic_Document> Source();

		/****************** SubjectElement ******************/
		%feature("compactdefaultargs") SubjectElement;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") SubjectElement;
		opencascade::handle<TCollection_HAsciiString> SubjectElement();

		/****************** SubjectElementValue ******************/
		%feature("compactdefaultargs") SubjectElementValue;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") SubjectElementValue;
		opencascade::handle<TCollection_HAsciiString> SubjectElementValue();

};


%make_alias(StepBasic_DocumentUsageConstraint)

%extend StepBasic_DocumentUsageConstraint {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************
* class StepBasic_Effectivity *
******************************/
class StepBasic_Effectivity : public Standard_Transient {
	public:
		/****************** StepBasic_Effectivity ******************/
		%feature("compactdefaultargs") StepBasic_Effectivity;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") StepBasic_Effectivity;
		 StepBasic_Effectivity();

		/****************** Id ******************/
		%feature("compactdefaultargs") Id;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") Id;
		opencascade::handle<TCollection_HAsciiString> Id();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Parameters
----------
aid: TCollection_HAsciiString

Returns
-------
None
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aid);

		/****************** SetId ******************/
		%feature("compactdefaultargs") SetId;
		%feature("autodoc", "No available documentation.

Parameters
----------
aid: TCollection_HAsciiString

Returns
-------
None
") SetId;
		void SetId(const opencascade::handle<TCollection_HAsciiString> & aid);

};


%make_alias(StepBasic_Effectivity)

%extend StepBasic_Effectivity {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************************
* class StepBasic_EffectivityAssignment *
****************************************/
class StepBasic_EffectivityAssignment : public Standard_Transient {
	public:
		/****************** StepBasic_EffectivityAssignment ******************/
		%feature("compactdefaultargs") StepBasic_EffectivityAssignment;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") StepBasic_EffectivityAssignment;
		 StepBasic_EffectivityAssignment();

		/****************** AssignedEffectivity ******************/
		%feature("compactdefaultargs") AssignedEffectivity;
		%feature("autodoc", "Returns field assignedeffectivity.

Returns
-------
opencascade::handle<StepBasic_Effectivity>
") AssignedEffectivity;
		opencascade::handle<StepBasic_Effectivity> AssignedEffectivity();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Initialize all fields (own and inherited).

Parameters
----------
aAssignedEffectivity: StepBasic_Effectivity

Returns
-------
None
") Init;
		void Init(const opencascade::handle<StepBasic_Effectivity> & aAssignedEffectivity);

		/****************** SetAssignedEffectivity ******************/
		%feature("compactdefaultargs") SetAssignedEffectivity;
		%feature("autodoc", "Set field assignedeffectivity.

Parameters
----------
AssignedEffectivity: StepBasic_Effectivity

Returns
-------
None
") SetAssignedEffectivity;
		void SetAssignedEffectivity(const opencascade::handle<StepBasic_Effectivity> & AssignedEffectivity);

};


%make_alias(StepBasic_EffectivityAssignment)

%extend StepBasic_EffectivityAssignment {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************
* class StepBasic_EulerAngles *
******************************/
class StepBasic_EulerAngles : public Standard_Transient {
	public:
		/****************** StepBasic_EulerAngles ******************/
		%feature("compactdefaultargs") StepBasic_EulerAngles;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") StepBasic_EulerAngles;
		 StepBasic_EulerAngles();

		/****************** Angles ******************/
		%feature("compactdefaultargs") Angles;
		%feature("autodoc", "Returns field angles.

Returns
-------
opencascade::handle<TColStd_HArray1OfReal>
") Angles;
		opencascade::handle<TColStd_HArray1OfReal> Angles();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Initialize all fields (own and inherited).

Parameters
----------
aAngles: TColStd_HArray1OfReal

Returns
-------
None
") Init;
		void Init(const opencascade::handle<TColStd_HArray1OfReal> & aAngles);

		/****************** SetAngles ******************/
		%feature("compactdefaultargs") SetAngles;
		%feature("autodoc", "Set field angles.

Parameters
----------
Angles: TColStd_HArray1OfReal

Returns
-------
None
") SetAngles;
		void SetAngles(const opencascade::handle<TColStd_HArray1OfReal> & Angles);

};


%make_alias(StepBasic_EulerAngles)

%extend StepBasic_EulerAngles {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************
* class StepBasic_ExternalSource *
*********************************/
class StepBasic_ExternalSource : public Standard_Transient {
	public:
		/****************** StepBasic_ExternalSource ******************/
		%feature("compactdefaultargs") StepBasic_ExternalSource;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") StepBasic_ExternalSource;
		 StepBasic_ExternalSource();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Initialize all fields (own and inherited).

Parameters
----------
aSourceId: StepBasic_SourceItem

Returns
-------
None
") Init;
		void Init(const StepBasic_SourceItem & aSourceId);

		/****************** SetSourceId ******************/
		%feature("compactdefaultargs") SetSourceId;
		%feature("autodoc", "Set field sourceid.

Parameters
----------
SourceId: StepBasic_SourceItem

Returns
-------
None
") SetSourceId;
		void SetSourceId(const StepBasic_SourceItem & SourceId);

		/****************** SourceId ******************/
		%feature("compactdefaultargs") SourceId;
		%feature("autodoc", "Returns field sourceid.

Returns
-------
StepBasic_SourceItem
") SourceId;
		StepBasic_SourceItem SourceId();

};


%make_alias(StepBasic_ExternalSource)

%extend StepBasic_ExternalSource {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************************
* class StepBasic_ExternallyDefinedItem *
****************************************/
class StepBasic_ExternallyDefinedItem : public Standard_Transient {
	public:
		/****************** StepBasic_ExternallyDefinedItem ******************/
		%feature("compactdefaultargs") StepBasic_ExternallyDefinedItem;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") StepBasic_ExternallyDefinedItem;
		 StepBasic_ExternallyDefinedItem();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Initialize all fields (own and inherited).

Parameters
----------
aItemId: StepBasic_SourceItem
aSource: StepBasic_ExternalSource

Returns
-------
None
") Init;
		void Init(const StepBasic_SourceItem & aItemId, const opencascade::handle<StepBasic_ExternalSource> & aSource);

		/****************** ItemId ******************/
		%feature("compactdefaultargs") ItemId;
		%feature("autodoc", "Returns field itemid.

Returns
-------
StepBasic_SourceItem
") ItemId;
		StepBasic_SourceItem ItemId();

		/****************** SetItemId ******************/
		%feature("compactdefaultargs") SetItemId;
		%feature("autodoc", "Set field itemid.

Parameters
----------
ItemId: StepBasic_SourceItem

Returns
-------
None
") SetItemId;
		void SetItemId(const StepBasic_SourceItem & ItemId);

		/****************** SetSource ******************/
		%feature("compactdefaultargs") SetSource;
		%feature("autodoc", "Set field source.

Parameters
----------
Source: StepBasic_ExternalSource

Returns
-------
None
") SetSource;
		void SetSource(const opencascade::handle<StepBasic_ExternalSource> & Source);

		/****************** Source ******************/
		%feature("compactdefaultargs") Source;
		%feature("autodoc", "Returns field source.

Returns
-------
opencascade::handle<StepBasic_ExternalSource>
") Source;
		opencascade::handle<StepBasic_ExternalSource> Source();

};


%make_alias(StepBasic_ExternallyDefinedItem)

%extend StepBasic_ExternallyDefinedItem {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************************
* class StepBasic_GeneralProperty *
**********************************/
class StepBasic_GeneralProperty : public Standard_Transient {
	public:
		/****************** StepBasic_GeneralProperty ******************/
		%feature("compactdefaultargs") StepBasic_GeneralProperty;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") StepBasic_GeneralProperty;
		 StepBasic_GeneralProperty();

		/****************** Description ******************/
		%feature("compactdefaultargs") Description;
		%feature("autodoc", "Returns field description.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") Description;
		opencascade::handle<TCollection_HAsciiString> Description();

		/****************** HasDescription ******************/
		%feature("compactdefaultargs") HasDescription;
		%feature("autodoc", "Returns true if optional field description is defined.

Returns
-------
bool
") HasDescription;
		Standard_Boolean HasDescription();

		/****************** Id ******************/
		%feature("compactdefaultargs") Id;
		%feature("autodoc", "Returns field id.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") Id;
		opencascade::handle<TCollection_HAsciiString> Id();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Initialize all fields (own and inherited).

Parameters
----------
aId: TCollection_HAsciiString
aName: TCollection_HAsciiString
hasDescription: bool
aDescription: TCollection_HAsciiString

Returns
-------
None
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aId, const opencascade::handle<TCollection_HAsciiString> & aName, const Standard_Boolean hasDescription, const opencascade::handle<TCollection_HAsciiString> & aDescription);

		/****************** Name ******************/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "Returns field name.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") Name;
		opencascade::handle<TCollection_HAsciiString> Name();

		/****************** SetDescription ******************/
		%feature("compactdefaultargs") SetDescription;
		%feature("autodoc", "Set field description.

Parameters
----------
Description: TCollection_HAsciiString

Returns
-------
None
") SetDescription;
		void SetDescription(const opencascade::handle<TCollection_HAsciiString> & Description);

		/****************** SetId ******************/
		%feature("compactdefaultargs") SetId;
		%feature("autodoc", "Set field id.

Parameters
----------
Id: TCollection_HAsciiString

Returns
-------
None
") SetId;
		void SetId(const opencascade::handle<TCollection_HAsciiString> & Id);

		/****************** SetName ******************/
		%feature("compactdefaultargs") SetName;
		%feature("autodoc", "Set field name.

Parameters
----------
Name: TCollection_HAsciiString

Returns
-------
None
") SetName;
		void SetName(const opencascade::handle<TCollection_HAsciiString> & Name);

};


%make_alias(StepBasic_GeneralProperty)

%extend StepBasic_GeneralProperty {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************
* class StepBasic_Group *
************************/
class StepBasic_Group : public Standard_Transient {
	public:
		/****************** StepBasic_Group ******************/
		%feature("compactdefaultargs") StepBasic_Group;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") StepBasic_Group;
		 StepBasic_Group();

		/****************** Description ******************/
		%feature("compactdefaultargs") Description;
		%feature("autodoc", "Returns field description.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") Description;
		opencascade::handle<TCollection_HAsciiString> Description();

		/****************** HasDescription ******************/
		%feature("compactdefaultargs") HasDescription;
		%feature("autodoc", "Returns true if optional field description is defined.

Returns
-------
bool
") HasDescription;
		Standard_Boolean HasDescription();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Initialize all fields (own and inherited).

Parameters
----------
aName: TCollection_HAsciiString
hasDescription: bool
aDescription: TCollection_HAsciiString

Returns
-------
None
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aName, const Standard_Boolean hasDescription, const opencascade::handle<TCollection_HAsciiString> & aDescription);

		/****************** Name ******************/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "Returns field name.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") Name;
		opencascade::handle<TCollection_HAsciiString> Name();

		/****************** SetDescription ******************/
		%feature("compactdefaultargs") SetDescription;
		%feature("autodoc", "Set field description.

Parameters
----------
Description: TCollection_HAsciiString

Returns
-------
None
") SetDescription;
		void SetDescription(const opencascade::handle<TCollection_HAsciiString> & Description);

		/****************** SetName ******************/
		%feature("compactdefaultargs") SetName;
		%feature("autodoc", "Set field name.

Parameters
----------
Name: TCollection_HAsciiString

Returns
-------
None
") SetName;
		void SetName(const opencascade::handle<TCollection_HAsciiString> & Name);

};


%make_alias(StepBasic_Group)

%extend StepBasic_Group {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************************
* class StepBasic_GroupAssignment *
**********************************/
class StepBasic_GroupAssignment : public Standard_Transient {
	public:
		/****************** StepBasic_GroupAssignment ******************/
		%feature("compactdefaultargs") StepBasic_GroupAssignment;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") StepBasic_GroupAssignment;
		 StepBasic_GroupAssignment();

		/****************** AssignedGroup ******************/
		%feature("compactdefaultargs") AssignedGroup;
		%feature("autodoc", "Returns field assignedgroup.

Returns
-------
opencascade::handle<StepBasic_Group>
") AssignedGroup;
		opencascade::handle<StepBasic_Group> AssignedGroup();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Initialize all fields (own and inherited).

Parameters
----------
aAssignedGroup: StepBasic_Group

Returns
-------
None
") Init;
		void Init(const opencascade::handle<StepBasic_Group> & aAssignedGroup);

		/****************** SetAssignedGroup ******************/
		%feature("compactdefaultargs") SetAssignedGroup;
		%feature("autodoc", "Set field assignedgroup.

Parameters
----------
AssignedGroup: StepBasic_Group

Returns
-------
None
") SetAssignedGroup;
		void SetAssignedGroup(const opencascade::handle<StepBasic_Group> & AssignedGroup);

};


%make_alias(StepBasic_GroupAssignment)

%extend StepBasic_GroupAssignment {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************************
* class StepBasic_GroupRelationship *
************************************/
class StepBasic_GroupRelationship : public Standard_Transient {
	public:
		/****************** StepBasic_GroupRelationship ******************/
		%feature("compactdefaultargs") StepBasic_GroupRelationship;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") StepBasic_GroupRelationship;
		 StepBasic_GroupRelationship();

		/****************** Description ******************/
		%feature("compactdefaultargs") Description;
		%feature("autodoc", "Returns field description.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") Description;
		opencascade::handle<TCollection_HAsciiString> Description();

		/****************** HasDescription ******************/
		%feature("compactdefaultargs") HasDescription;
		%feature("autodoc", "Returns true if optional field description is defined.

Returns
-------
bool
") HasDescription;
		Standard_Boolean HasDescription();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Initialize all fields (own and inherited).

Parameters
----------
aName: TCollection_HAsciiString
hasDescription: bool
aDescription: TCollection_HAsciiString
aRelatingGroup: StepBasic_Group
aRelatedGroup: StepBasic_Group

Returns
-------
None
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aName, const Standard_Boolean hasDescription, const opencascade::handle<TCollection_HAsciiString> & aDescription, const opencascade::handle<StepBasic_Group> & aRelatingGroup, const opencascade::handle<StepBasic_Group> & aRelatedGroup);

		/****************** Name ******************/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "Returns field name.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") Name;
		opencascade::handle<TCollection_HAsciiString> Name();

		/****************** RelatedGroup ******************/
		%feature("compactdefaultargs") RelatedGroup;
		%feature("autodoc", "Returns field relatedgroup.

Returns
-------
opencascade::handle<StepBasic_Group>
") RelatedGroup;
		opencascade::handle<StepBasic_Group> RelatedGroup();

		/****************** RelatingGroup ******************/
		%feature("compactdefaultargs") RelatingGroup;
		%feature("autodoc", "Returns field relatinggroup.

Returns
-------
opencascade::handle<StepBasic_Group>
") RelatingGroup;
		opencascade::handle<StepBasic_Group> RelatingGroup();

		/****************** SetDescription ******************/
		%feature("compactdefaultargs") SetDescription;
		%feature("autodoc", "Set field description.

Parameters
----------
Description: TCollection_HAsciiString

Returns
-------
None
") SetDescription;
		void SetDescription(const opencascade::handle<TCollection_HAsciiString> & Description);

		/****************** SetName ******************/
		%feature("compactdefaultargs") SetName;
		%feature("autodoc", "Set field name.

Parameters
----------
Name: TCollection_HAsciiString

Returns
-------
None
") SetName;
		void SetName(const opencascade::handle<TCollection_HAsciiString> & Name);

		/****************** SetRelatedGroup ******************/
		%feature("compactdefaultargs") SetRelatedGroup;
		%feature("autodoc", "Set field relatedgroup.

Parameters
----------
RelatedGroup: StepBasic_Group

Returns
-------
None
") SetRelatedGroup;
		void SetRelatedGroup(const opencascade::handle<StepBasic_Group> & RelatedGroup);

		/****************** SetRelatingGroup ******************/
		%feature("compactdefaultargs") SetRelatingGroup;
		%feature("autodoc", "Set field relatinggroup.

Parameters
----------
RelatingGroup: StepBasic_Group

Returns
-------
None
") SetRelatingGroup;
		void SetRelatingGroup(const opencascade::handle<StepBasic_Group> & RelatingGroup);

};


%make_alias(StepBasic_GroupRelationship)

%extend StepBasic_GroupRelationship {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************************
* class StepBasic_IdentificationAssignment *
*******************************************/
class StepBasic_IdentificationAssignment : public Standard_Transient {
	public:
		/****************** StepBasic_IdentificationAssignment ******************/
		%feature("compactdefaultargs") StepBasic_IdentificationAssignment;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") StepBasic_IdentificationAssignment;
		 StepBasic_IdentificationAssignment();

		/****************** AssignedId ******************/
		%feature("compactdefaultargs") AssignedId;
		%feature("autodoc", "Returns field assignedid.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") AssignedId;
		opencascade::handle<TCollection_HAsciiString> AssignedId();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Initialize all fields (own and inherited).

Parameters
----------
aAssignedId: TCollection_HAsciiString
aRole: StepBasic_IdentificationRole

Returns
-------
None
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aAssignedId, const opencascade::handle<StepBasic_IdentificationRole> & aRole);

		/****************** Role ******************/
		%feature("compactdefaultargs") Role;
		%feature("autodoc", "Returns field role.

Returns
-------
opencascade::handle<StepBasic_IdentificationRole>
") Role;
		opencascade::handle<StepBasic_IdentificationRole> Role();

		/****************** SetAssignedId ******************/
		%feature("compactdefaultargs") SetAssignedId;
		%feature("autodoc", "Set field assignedid.

Parameters
----------
AssignedId: TCollection_HAsciiString

Returns
-------
None
") SetAssignedId;
		void SetAssignedId(const opencascade::handle<TCollection_HAsciiString> & AssignedId);

		/****************** SetRole ******************/
		%feature("compactdefaultargs") SetRole;
		%feature("autodoc", "Set field role.

Parameters
----------
Role: StepBasic_IdentificationRole

Returns
-------
None
") SetRole;
		void SetRole(const opencascade::handle<StepBasic_IdentificationRole> & Role);

};


%make_alias(StepBasic_IdentificationAssignment)

%extend StepBasic_IdentificationAssignment {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************************
* class StepBasic_IdentificationRole *
*************************************/
class StepBasic_IdentificationRole : public Standard_Transient {
	public:
		/****************** StepBasic_IdentificationRole ******************/
		%feature("compactdefaultargs") StepBasic_IdentificationRole;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") StepBasic_IdentificationRole;
		 StepBasic_IdentificationRole();

		/****************** Description ******************/
		%feature("compactdefaultargs") Description;
		%feature("autodoc", "Returns field description.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") Description;
		opencascade::handle<TCollection_HAsciiString> Description();

		/****************** HasDescription ******************/
		%feature("compactdefaultargs") HasDescription;
		%feature("autodoc", "Returns true if optional field description is defined.

Returns
-------
bool
") HasDescription;
		Standard_Boolean HasDescription();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Initialize all fields (own and inherited).

Parameters
----------
aName: TCollection_HAsciiString
hasDescription: bool
aDescription: TCollection_HAsciiString

Returns
-------
None
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aName, const Standard_Boolean hasDescription, const opencascade::handle<TCollection_HAsciiString> & aDescription);

		/****************** Name ******************/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "Returns field name.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") Name;
		opencascade::handle<TCollection_HAsciiString> Name();

		/****************** SetDescription ******************/
		%feature("compactdefaultargs") SetDescription;
		%feature("autodoc", "Set field description.

Parameters
----------
Description: TCollection_HAsciiString

Returns
-------
None
") SetDescription;
		void SetDescription(const opencascade::handle<TCollection_HAsciiString> & Description);

		/****************** SetName ******************/
		%feature("compactdefaultargs") SetName;
		%feature("autodoc", "Set field name.

Parameters
----------
Name: TCollection_HAsciiString

Returns
-------
None
") SetName;
		void SetName(const opencascade::handle<TCollection_HAsciiString> & Name);

};


%make_alias(StepBasic_IdentificationRole)

%extend StepBasic_IdentificationRole {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************
* class StepBasic_LocalTime *
****************************/
class StepBasic_LocalTime : public Standard_Transient {
	public:
		/****************** StepBasic_LocalTime ******************/
		%feature("compactdefaultargs") StepBasic_LocalTime;
		%feature("autodoc", "Returns a localtime.

Returns
-------
None
") StepBasic_LocalTime;
		 StepBasic_LocalTime();

		/****************** HasMinuteComponent ******************/
		%feature("compactdefaultargs") HasMinuteComponent;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") HasMinuteComponent;
		Standard_Boolean HasMinuteComponent();

		/****************** HasSecondComponent ******************/
		%feature("compactdefaultargs") HasSecondComponent;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") HasSecondComponent;
		Standard_Boolean HasSecondComponent();

		/****************** HourComponent ******************/
		%feature("compactdefaultargs") HourComponent;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") HourComponent;
		Standard_Integer HourComponent();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Parameters
----------
aHourComponent: int
hasAminuteComponent: bool
aMinuteComponent: int
hasAsecondComponent: bool
aSecondComponent: float
aZone: StepBasic_CoordinatedUniversalTimeOffset

Returns
-------
None
") Init;
		void Init(const Standard_Integer aHourComponent, const Standard_Boolean hasAminuteComponent, const Standard_Integer aMinuteComponent, const Standard_Boolean hasAsecondComponent, const Standard_Real aSecondComponent, const opencascade::handle<StepBasic_CoordinatedUniversalTimeOffset> & aZone);

		/****************** MinuteComponent ******************/
		%feature("compactdefaultargs") MinuteComponent;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") MinuteComponent;
		Standard_Integer MinuteComponent();

		/****************** SecondComponent ******************/
		%feature("compactdefaultargs") SecondComponent;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") SecondComponent;
		Standard_Real SecondComponent();

		/****************** SetHourComponent ******************/
		%feature("compactdefaultargs") SetHourComponent;
		%feature("autodoc", "No available documentation.

Parameters
----------
aHourComponent: int

Returns
-------
None
") SetHourComponent;
		void SetHourComponent(const Standard_Integer aHourComponent);

		/****************** SetMinuteComponent ******************/
		%feature("compactdefaultargs") SetMinuteComponent;
		%feature("autodoc", "No available documentation.

Parameters
----------
aMinuteComponent: int

Returns
-------
None
") SetMinuteComponent;
		void SetMinuteComponent(const Standard_Integer aMinuteComponent);

		/****************** SetSecondComponent ******************/
		%feature("compactdefaultargs") SetSecondComponent;
		%feature("autodoc", "No available documentation.

Parameters
----------
aSecondComponent: float

Returns
-------
None
") SetSecondComponent;
		void SetSecondComponent(const Standard_Real aSecondComponent);

		/****************** SetZone ******************/
		%feature("compactdefaultargs") SetZone;
		%feature("autodoc", "No available documentation.

Parameters
----------
aZone: StepBasic_CoordinatedUniversalTimeOffset

Returns
-------
None
") SetZone;
		void SetZone(const opencascade::handle<StepBasic_CoordinatedUniversalTimeOffset> & aZone);

		/****************** UnSetMinuteComponent ******************/
		%feature("compactdefaultargs") UnSetMinuteComponent;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") UnSetMinuteComponent;
		void UnSetMinuteComponent();

		/****************** UnSetSecondComponent ******************/
		%feature("compactdefaultargs") UnSetSecondComponent;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") UnSetSecondComponent;
		void UnSetSecondComponent();

		/****************** Zone ******************/
		%feature("compactdefaultargs") Zone;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepBasic_CoordinatedUniversalTimeOffset>
") Zone;
		opencascade::handle<StepBasic_CoordinatedUniversalTimeOffset> Zone();

};


%make_alias(StepBasic_LocalTime)

%extend StepBasic_LocalTime {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************************
* class StepBasic_MeasureValueMember *
*************************************/
class StepBasic_MeasureValueMember : public StepData_SelectReal {
	public:
		/****************** StepBasic_MeasureValueMember ******************/
		%feature("compactdefaultargs") StepBasic_MeasureValueMember;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") StepBasic_MeasureValueMember;
		 StepBasic_MeasureValueMember();

		/****************** HasName ******************/
		%feature("compactdefaultargs") HasName;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") HasName;
		virtual Standard_Boolean HasName();

		/****************** Name ******************/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "No available documentation.

Returns
-------
char *
") Name;
		virtual const char * Name();

		/****************** SetName ******************/
		%feature("compactdefaultargs") SetName;
		%feature("autodoc", "No available documentation.

Parameters
----------
name: char *

Returns
-------
bool
") SetName;
		virtual Standard_Boolean SetName(const char * name);

};


%make_alias(StepBasic_MeasureValueMember)

%extend StepBasic_MeasureValueMember {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************************
* class StepBasic_MeasureWithUnit *
**********************************/
class StepBasic_MeasureWithUnit : public Standard_Transient {
	public:
		/****************** StepBasic_MeasureWithUnit ******************/
		%feature("compactdefaultargs") StepBasic_MeasureWithUnit;
		%feature("autodoc", "Returns a measurewithunit.

Returns
-------
None
") StepBasic_MeasureWithUnit;
		 StepBasic_MeasureWithUnit();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Parameters
----------
aValueComponent: StepBasic_MeasureValueMember
aUnitComponent: StepBasic_Unit

Returns
-------
None
") Init;
		void Init(const opencascade::handle<StepBasic_MeasureValueMember> & aValueComponent, const StepBasic_Unit & aUnitComponent);

		/****************** SetUnitComponent ******************/
		%feature("compactdefaultargs") SetUnitComponent;
		%feature("autodoc", "No available documentation.

Parameters
----------
aUnitComponent: StepBasic_Unit

Returns
-------
None
") SetUnitComponent;
		void SetUnitComponent(const StepBasic_Unit & aUnitComponent);

		/****************** SetValueComponent ******************/
		%feature("compactdefaultargs") SetValueComponent;
		%feature("autodoc", "No available documentation.

Parameters
----------
aValueComponent: float

Returns
-------
None
") SetValueComponent;
		void SetValueComponent(const Standard_Real aValueComponent);

		/****************** SetValueComponentMember ******************/
		%feature("compactdefaultargs") SetValueComponentMember;
		%feature("autodoc", "No available documentation.

Parameters
----------
val: StepBasic_MeasureValueMember

Returns
-------
None
") SetValueComponentMember;
		void SetValueComponentMember(const opencascade::handle<StepBasic_MeasureValueMember> & val);

		/****************** UnitComponent ******************/
		%feature("compactdefaultargs") UnitComponent;
		%feature("autodoc", "No available documentation.

Returns
-------
StepBasic_Unit
") UnitComponent;
		StepBasic_Unit UnitComponent();

		/****************** ValueComponent ******************/
		%feature("compactdefaultargs") ValueComponent;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") ValueComponent;
		Standard_Real ValueComponent();

		/****************** ValueComponentMember ******************/
		%feature("compactdefaultargs") ValueComponentMember;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepBasic_MeasureValueMember>
") ValueComponentMember;
		opencascade::handle<StepBasic_MeasureValueMember> ValueComponentMember();

};


%make_alias(StepBasic_MeasureWithUnit)

%extend StepBasic_MeasureWithUnit {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************
* class StepBasic_NameAssignment *
*********************************/
class StepBasic_NameAssignment : public Standard_Transient {
	public:
		/****************** StepBasic_NameAssignment ******************/
		%feature("compactdefaultargs") StepBasic_NameAssignment;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") StepBasic_NameAssignment;
		 StepBasic_NameAssignment();

		/****************** AssignedName ******************/
		%feature("compactdefaultargs") AssignedName;
		%feature("autodoc", "Returns field assignedname.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") AssignedName;
		opencascade::handle<TCollection_HAsciiString> AssignedName();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Initialize all fields (own and inherited).

Parameters
----------
aAssignedName: TCollection_HAsciiString

Returns
-------
None
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aAssignedName);

		/****************** SetAssignedName ******************/
		%feature("compactdefaultargs") SetAssignedName;
		%feature("autodoc", "Set field assignedname.

Parameters
----------
AssignedName: TCollection_HAsciiString

Returns
-------
None
") SetAssignedName;
		void SetAssignedName(const opencascade::handle<TCollection_HAsciiString> & AssignedName);

};


%make_alias(StepBasic_NameAssignment)

%extend StepBasic_NameAssignment {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************
* class StepBasic_NamedUnit *
****************************/
class StepBasic_NamedUnit : public Standard_Transient {
	public:
		/****************** StepBasic_NamedUnit ******************/
		%feature("compactdefaultargs") StepBasic_NamedUnit;
		%feature("autodoc", "Returns a namedunit.

Returns
-------
None
") StepBasic_NamedUnit;
		 StepBasic_NamedUnit();

		/****************** Dimensions ******************/
		%feature("compactdefaultargs") Dimensions;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepBasic_DimensionalExponents>
") Dimensions;
		virtual opencascade::handle<StepBasic_DimensionalExponents> Dimensions();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Parameters
----------
aDimensions: StepBasic_DimensionalExponents

Returns
-------
None
") Init;
		void Init(const opencascade::handle<StepBasic_DimensionalExponents> & aDimensions);

		/****************** SetDimensions ******************/
		%feature("compactdefaultargs") SetDimensions;
		%feature("autodoc", "No available documentation.

Parameters
----------
aDimensions: StepBasic_DimensionalExponents

Returns
-------
None
") SetDimensions;
		virtual void SetDimensions(const opencascade::handle<StepBasic_DimensionalExponents> & aDimensions);

};


%make_alias(StepBasic_NamedUnit)

%extend StepBasic_NamedUnit {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************
* class StepBasic_ObjectRole *
*****************************/
class StepBasic_ObjectRole : public Standard_Transient {
	public:
		/****************** StepBasic_ObjectRole ******************/
		%feature("compactdefaultargs") StepBasic_ObjectRole;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") StepBasic_ObjectRole;
		 StepBasic_ObjectRole();

		/****************** Description ******************/
		%feature("compactdefaultargs") Description;
		%feature("autodoc", "Returns field description.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") Description;
		opencascade::handle<TCollection_HAsciiString> Description();

		/****************** HasDescription ******************/
		%feature("compactdefaultargs") HasDescription;
		%feature("autodoc", "Returns true if optional field description is defined.

Returns
-------
bool
") HasDescription;
		Standard_Boolean HasDescription();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Initialize all fields (own and inherited).

Parameters
----------
aName: TCollection_HAsciiString
hasDescription: bool
aDescription: TCollection_HAsciiString

Returns
-------
None
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aName, const Standard_Boolean hasDescription, const opencascade::handle<TCollection_HAsciiString> & aDescription);

		/****************** Name ******************/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "Returns field name.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") Name;
		opencascade::handle<TCollection_HAsciiString> Name();

		/****************** SetDescription ******************/
		%feature("compactdefaultargs") SetDescription;
		%feature("autodoc", "Set field description.

Parameters
----------
Description: TCollection_HAsciiString

Returns
-------
None
") SetDescription;
		void SetDescription(const opencascade::handle<TCollection_HAsciiString> & Description);

		/****************** SetName ******************/
		%feature("compactdefaultargs") SetName;
		%feature("autodoc", "Set field name.

Parameters
----------
Name: TCollection_HAsciiString

Returns
-------
None
") SetName;
		void SetName(const opencascade::handle<TCollection_HAsciiString> & Name);

};


%make_alias(StepBasic_ObjectRole)

%extend StepBasic_ObjectRole {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************
* class StepBasic_Organization *
*******************************/
class StepBasic_Organization : public Standard_Transient {
	public:
		/****************** StepBasic_Organization ******************/
		%feature("compactdefaultargs") StepBasic_Organization;
		%feature("autodoc", "Returns a organization.

Returns
-------
None
") StepBasic_Organization;
		 StepBasic_Organization();

		/****************** Description ******************/
		%feature("compactdefaultargs") Description;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") Description;
		opencascade::handle<TCollection_HAsciiString> Description();

		/****************** HasId ******************/
		%feature("compactdefaultargs") HasId;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") HasId;
		Standard_Boolean HasId();

		/****************** Id ******************/
		%feature("compactdefaultargs") Id;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") Id;
		opencascade::handle<TCollection_HAsciiString> Id();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Parameters
----------
hasAid: bool
aId: TCollection_HAsciiString
aName: TCollection_HAsciiString
aDescription: TCollection_HAsciiString

Returns
-------
None
") Init;
		void Init(const Standard_Boolean hasAid, const opencascade::handle<TCollection_HAsciiString> & aId, const opencascade::handle<TCollection_HAsciiString> & aName, const opencascade::handle<TCollection_HAsciiString> & aDescription);

		/****************** Name ******************/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") Name;
		opencascade::handle<TCollection_HAsciiString> Name();

		/****************** SetDescription ******************/
		%feature("compactdefaultargs") SetDescription;
		%feature("autodoc", "No available documentation.

Parameters
----------
aDescription: TCollection_HAsciiString

Returns
-------
None
") SetDescription;
		void SetDescription(const opencascade::handle<TCollection_HAsciiString> & aDescription);

		/****************** SetId ******************/
		%feature("compactdefaultargs") SetId;
		%feature("autodoc", "No available documentation.

Parameters
----------
aId: TCollection_HAsciiString

Returns
-------
None
") SetId;
		void SetId(const opencascade::handle<TCollection_HAsciiString> & aId);

		/****************** SetName ******************/
		%feature("compactdefaultargs") SetName;
		%feature("autodoc", "No available documentation.

Parameters
----------
aName: TCollection_HAsciiString

Returns
-------
None
") SetName;
		void SetName(const opencascade::handle<TCollection_HAsciiString> & aName);

		/****************** UnSetId ******************/
		%feature("compactdefaultargs") UnSetId;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") UnSetId;
		void UnSetId();

};


%make_alias(StepBasic_Organization)

%extend StepBasic_Organization {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************************
* class StepBasic_OrganizationAssignment *
*****************************************/
class StepBasic_OrganizationAssignment : public Standard_Transient {
	public:
		/****************** AssignedOrganization ******************/
		%feature("compactdefaultargs") AssignedOrganization;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepBasic_Organization>
") AssignedOrganization;
		opencascade::handle<StepBasic_Organization> AssignedOrganization();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Parameters
----------
aAssignedOrganization: StepBasic_Organization
aRole: StepBasic_OrganizationRole

Returns
-------
None
") Init;
		void Init(const opencascade::handle<StepBasic_Organization> & aAssignedOrganization, const opencascade::handle<StepBasic_OrganizationRole> & aRole);

		/****************** Role ******************/
		%feature("compactdefaultargs") Role;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepBasic_OrganizationRole>
") Role;
		opencascade::handle<StepBasic_OrganizationRole> Role();

		/****************** SetAssignedOrganization ******************/
		%feature("compactdefaultargs") SetAssignedOrganization;
		%feature("autodoc", "No available documentation.

Parameters
----------
aAssignedOrganization: StepBasic_Organization

Returns
-------
None
") SetAssignedOrganization;
		void SetAssignedOrganization(const opencascade::handle<StepBasic_Organization> & aAssignedOrganization);

		/****************** SetRole ******************/
		%feature("compactdefaultargs") SetRole;
		%feature("autodoc", "No available documentation.

Parameters
----------
aRole: StepBasic_OrganizationRole

Returns
-------
None
") SetRole;
		void SetRole(const opencascade::handle<StepBasic_OrganizationRole> & aRole);

};


%make_alias(StepBasic_OrganizationAssignment)

%extend StepBasic_OrganizationAssignment {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************************
* class StepBasic_OrganizationRole *
***********************************/
class StepBasic_OrganizationRole : public Standard_Transient {
	public:
		/****************** StepBasic_OrganizationRole ******************/
		%feature("compactdefaultargs") StepBasic_OrganizationRole;
		%feature("autodoc", "Returns a organizationrole.

Returns
-------
None
") StepBasic_OrganizationRole;
		 StepBasic_OrganizationRole();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Parameters
----------
aName: TCollection_HAsciiString

Returns
-------
None
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aName);

		/****************** Name ******************/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") Name;
		opencascade::handle<TCollection_HAsciiString> Name();

		/****************** SetName ******************/
		%feature("compactdefaultargs") SetName;
		%feature("autodoc", "No available documentation.

Parameters
----------
aName: TCollection_HAsciiString

Returns
-------
None
") SetName;
		void SetName(const opencascade::handle<TCollection_HAsciiString> & aName);

};


%make_alias(StepBasic_OrganizationRole)

%extend StepBasic_OrganizationRole {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************
* class StepBasic_Person *
*************************/
class StepBasic_Person : public Standard_Transient {
	public:
		/****************** StepBasic_Person ******************/
		%feature("compactdefaultargs") StepBasic_Person;
		%feature("autodoc", "Returns a person.

Returns
-------
None
") StepBasic_Person;
		 StepBasic_Person();

		/****************** FirstName ******************/
		%feature("compactdefaultargs") FirstName;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") FirstName;
		opencascade::handle<TCollection_HAsciiString> FirstName();

		/****************** HasFirstName ******************/
		%feature("compactdefaultargs") HasFirstName;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") HasFirstName;
		Standard_Boolean HasFirstName();

		/****************** HasLastName ******************/
		%feature("compactdefaultargs") HasLastName;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") HasLastName;
		Standard_Boolean HasLastName();

		/****************** HasMiddleNames ******************/
		%feature("compactdefaultargs") HasMiddleNames;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") HasMiddleNames;
		Standard_Boolean HasMiddleNames();

		/****************** HasPrefixTitles ******************/
		%feature("compactdefaultargs") HasPrefixTitles;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") HasPrefixTitles;
		Standard_Boolean HasPrefixTitles();

		/****************** HasSuffixTitles ******************/
		%feature("compactdefaultargs") HasSuffixTitles;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") HasSuffixTitles;
		Standard_Boolean HasSuffixTitles();

		/****************** Id ******************/
		%feature("compactdefaultargs") Id;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") Id;
		opencascade::handle<TCollection_HAsciiString> Id();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Parameters
----------
aId: TCollection_HAsciiString
hasAlastName: bool
aLastName: TCollection_HAsciiString
hasAfirstName: bool
aFirstName: TCollection_HAsciiString
hasAmiddleNames: bool
aMiddleNames: Interface_HArray1OfHAsciiString
hasAprefixTitles: bool
aPrefixTitles: Interface_HArray1OfHAsciiString
hasAsuffixTitles: bool
aSuffixTitles: Interface_HArray1OfHAsciiString

Returns
-------
None
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aId, const Standard_Boolean hasAlastName, const opencascade::handle<TCollection_HAsciiString> & aLastName, const Standard_Boolean hasAfirstName, const opencascade::handle<TCollection_HAsciiString> & aFirstName, const Standard_Boolean hasAmiddleNames, const opencascade::handle<Interface_HArray1OfHAsciiString> & aMiddleNames, const Standard_Boolean hasAprefixTitles, const opencascade::handle<Interface_HArray1OfHAsciiString> & aPrefixTitles, const Standard_Boolean hasAsuffixTitles, const opencascade::handle<Interface_HArray1OfHAsciiString> & aSuffixTitles);

		/****************** LastName ******************/
		%feature("compactdefaultargs") LastName;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") LastName;
		opencascade::handle<TCollection_HAsciiString> LastName();

		/****************** MiddleNames ******************/
		%feature("compactdefaultargs") MiddleNames;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<Interface_HArray1OfHAsciiString>
") MiddleNames;
		opencascade::handle<Interface_HArray1OfHAsciiString> MiddleNames();

		/****************** MiddleNamesValue ******************/
		%feature("compactdefaultargs") MiddleNamesValue;
		%feature("autodoc", "No available documentation.

Parameters
----------
num: int

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") MiddleNamesValue;
		opencascade::handle<TCollection_HAsciiString> MiddleNamesValue(const Standard_Integer num);

		/****************** NbMiddleNames ******************/
		%feature("compactdefaultargs") NbMiddleNames;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbMiddleNames;
		Standard_Integer NbMiddleNames();

		/****************** NbPrefixTitles ******************/
		%feature("compactdefaultargs") NbPrefixTitles;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbPrefixTitles;
		Standard_Integer NbPrefixTitles();

		/****************** NbSuffixTitles ******************/
		%feature("compactdefaultargs") NbSuffixTitles;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbSuffixTitles;
		Standard_Integer NbSuffixTitles();

		/****************** PrefixTitles ******************/
		%feature("compactdefaultargs") PrefixTitles;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<Interface_HArray1OfHAsciiString>
") PrefixTitles;
		opencascade::handle<Interface_HArray1OfHAsciiString> PrefixTitles();

		/****************** PrefixTitlesValue ******************/
		%feature("compactdefaultargs") PrefixTitlesValue;
		%feature("autodoc", "No available documentation.

Parameters
----------
num: int

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") PrefixTitlesValue;
		opencascade::handle<TCollection_HAsciiString> PrefixTitlesValue(const Standard_Integer num);

		/****************** SetFirstName ******************/
		%feature("compactdefaultargs") SetFirstName;
		%feature("autodoc", "No available documentation.

Parameters
----------
aFirstName: TCollection_HAsciiString

Returns
-------
None
") SetFirstName;
		void SetFirstName(const opencascade::handle<TCollection_HAsciiString> & aFirstName);

		/****************** SetId ******************/
		%feature("compactdefaultargs") SetId;
		%feature("autodoc", "No available documentation.

Parameters
----------
aId: TCollection_HAsciiString

Returns
-------
None
") SetId;
		void SetId(const opencascade::handle<TCollection_HAsciiString> & aId);

		/****************** SetLastName ******************/
		%feature("compactdefaultargs") SetLastName;
		%feature("autodoc", "No available documentation.

Parameters
----------
aLastName: TCollection_HAsciiString

Returns
-------
None
") SetLastName;
		void SetLastName(const opencascade::handle<TCollection_HAsciiString> & aLastName);

		/****************** SetMiddleNames ******************/
		%feature("compactdefaultargs") SetMiddleNames;
		%feature("autodoc", "No available documentation.

Parameters
----------
aMiddleNames: Interface_HArray1OfHAsciiString

Returns
-------
None
") SetMiddleNames;
		void SetMiddleNames(const opencascade::handle<Interface_HArray1OfHAsciiString> & aMiddleNames);

		/****************** SetPrefixTitles ******************/
		%feature("compactdefaultargs") SetPrefixTitles;
		%feature("autodoc", "No available documentation.

Parameters
----------
aPrefixTitles: Interface_HArray1OfHAsciiString

Returns
-------
None
") SetPrefixTitles;
		void SetPrefixTitles(const opencascade::handle<Interface_HArray1OfHAsciiString> & aPrefixTitles);

		/****************** SetSuffixTitles ******************/
		%feature("compactdefaultargs") SetSuffixTitles;
		%feature("autodoc", "No available documentation.

Parameters
----------
aSuffixTitles: Interface_HArray1OfHAsciiString

Returns
-------
None
") SetSuffixTitles;
		void SetSuffixTitles(const opencascade::handle<Interface_HArray1OfHAsciiString> & aSuffixTitles);

		/****************** SuffixTitles ******************/
		%feature("compactdefaultargs") SuffixTitles;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<Interface_HArray1OfHAsciiString>
") SuffixTitles;
		opencascade::handle<Interface_HArray1OfHAsciiString> SuffixTitles();

		/****************** SuffixTitlesValue ******************/
		%feature("compactdefaultargs") SuffixTitlesValue;
		%feature("autodoc", "No available documentation.

Parameters
----------
num: int

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") SuffixTitlesValue;
		opencascade::handle<TCollection_HAsciiString> SuffixTitlesValue(const Standard_Integer num);

		/****************** UnSetFirstName ******************/
		%feature("compactdefaultargs") UnSetFirstName;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") UnSetFirstName;
		void UnSetFirstName();

		/****************** UnSetLastName ******************/
		%feature("compactdefaultargs") UnSetLastName;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") UnSetLastName;
		void UnSetLastName();

		/****************** UnSetMiddleNames ******************/
		%feature("compactdefaultargs") UnSetMiddleNames;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") UnSetMiddleNames;
		void UnSetMiddleNames();

		/****************** UnSetPrefixTitles ******************/
		%feature("compactdefaultargs") UnSetPrefixTitles;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") UnSetPrefixTitles;
		void UnSetPrefixTitles();

		/****************** UnSetSuffixTitles ******************/
		%feature("compactdefaultargs") UnSetSuffixTitles;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") UnSetSuffixTitles;
		void UnSetSuffixTitles();

};


%make_alias(StepBasic_Person)

%extend StepBasic_Person {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************************
* class StepBasic_PersonAndOrganization *
****************************************/
class StepBasic_PersonAndOrganization : public Standard_Transient {
	public:
		/****************** StepBasic_PersonAndOrganization ******************/
		%feature("compactdefaultargs") StepBasic_PersonAndOrganization;
		%feature("autodoc", "Returns a personandorganization.

Returns
-------
None
") StepBasic_PersonAndOrganization;
		 StepBasic_PersonAndOrganization();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Parameters
----------
aThePerson: StepBasic_Person
aTheOrganization: StepBasic_Organization

Returns
-------
None
") Init;
		void Init(const opencascade::handle<StepBasic_Person> & aThePerson, const opencascade::handle<StepBasic_Organization> & aTheOrganization);

		/****************** SetTheOrganization ******************/
		%feature("compactdefaultargs") SetTheOrganization;
		%feature("autodoc", "No available documentation.

Parameters
----------
aTheOrganization: StepBasic_Organization

Returns
-------
None
") SetTheOrganization;
		void SetTheOrganization(const opencascade::handle<StepBasic_Organization> & aTheOrganization);

		/****************** SetThePerson ******************/
		%feature("compactdefaultargs") SetThePerson;
		%feature("autodoc", "No available documentation.

Parameters
----------
aThePerson: StepBasic_Person

Returns
-------
None
") SetThePerson;
		void SetThePerson(const opencascade::handle<StepBasic_Person> & aThePerson);

		/****************** TheOrganization ******************/
		%feature("compactdefaultargs") TheOrganization;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepBasic_Organization>
") TheOrganization;
		opencascade::handle<StepBasic_Organization> TheOrganization();

		/****************** ThePerson ******************/
		%feature("compactdefaultargs") ThePerson;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepBasic_Person>
") ThePerson;
		opencascade::handle<StepBasic_Person> ThePerson();

};


%make_alias(StepBasic_PersonAndOrganization)

%extend StepBasic_PersonAndOrganization {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************************************
* class StepBasic_PersonAndOrganizationAssignment *
**************************************************/
class StepBasic_PersonAndOrganizationAssignment : public Standard_Transient {
	public:
		/****************** AssignedPersonAndOrganization ******************/
		%feature("compactdefaultargs") AssignedPersonAndOrganization;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepBasic_PersonAndOrganization>
") AssignedPersonAndOrganization;
		opencascade::handle<StepBasic_PersonAndOrganization> AssignedPersonAndOrganization();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Parameters
----------
aAssignedPersonAndOrganization: StepBasic_PersonAndOrganization
aRole: StepBasic_PersonAndOrganizationRole

Returns
-------
None
") Init;
		void Init(const opencascade::handle<StepBasic_PersonAndOrganization> & aAssignedPersonAndOrganization, const opencascade::handle<StepBasic_PersonAndOrganizationRole> & aRole);

		/****************** Role ******************/
		%feature("compactdefaultargs") Role;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepBasic_PersonAndOrganizationRole>
") Role;
		opencascade::handle<StepBasic_PersonAndOrganizationRole> Role();

		/****************** SetAssignedPersonAndOrganization ******************/
		%feature("compactdefaultargs") SetAssignedPersonAndOrganization;
		%feature("autodoc", "No available documentation.

Parameters
----------
aAssignedPersonAndOrganization: StepBasic_PersonAndOrganization

Returns
-------
None
") SetAssignedPersonAndOrganization;
		void SetAssignedPersonAndOrganization(const opencascade::handle<StepBasic_PersonAndOrganization> & aAssignedPersonAndOrganization);

		/****************** SetRole ******************/
		%feature("compactdefaultargs") SetRole;
		%feature("autodoc", "No available documentation.

Parameters
----------
aRole: StepBasic_PersonAndOrganizationRole

Returns
-------
None
") SetRole;
		void SetRole(const opencascade::handle<StepBasic_PersonAndOrganizationRole> & aRole);

};


%make_alias(StepBasic_PersonAndOrganizationAssignment)

%extend StepBasic_PersonAndOrganizationAssignment {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************************
* class StepBasic_PersonAndOrganizationRole *
********************************************/
class StepBasic_PersonAndOrganizationRole : public Standard_Transient {
	public:
		/****************** StepBasic_PersonAndOrganizationRole ******************/
		%feature("compactdefaultargs") StepBasic_PersonAndOrganizationRole;
		%feature("autodoc", "Returns a personandorganizationrole.

Returns
-------
None
") StepBasic_PersonAndOrganizationRole;
		 StepBasic_PersonAndOrganizationRole();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Parameters
----------
aName: TCollection_HAsciiString

Returns
-------
None
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aName);

		/****************** Name ******************/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") Name;
		opencascade::handle<TCollection_HAsciiString> Name();

		/****************** SetName ******************/
		%feature("compactdefaultargs") SetName;
		%feature("autodoc", "No available documentation.

Parameters
----------
aName: TCollection_HAsciiString

Returns
-------
None
") SetName;
		void SetName(const opencascade::handle<TCollection_HAsciiString> & aName);

};


%make_alias(StepBasic_PersonAndOrganizationRole)

%extend StepBasic_PersonAndOrganizationRole {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************************
* class StepBasic_PersonOrganizationSelect *
*******************************************/
class StepBasic_PersonOrganizationSelect : public StepData_SelectType {
	public:
		/****************** StepBasic_PersonOrganizationSelect ******************/
		%feature("compactdefaultargs") StepBasic_PersonOrganizationSelect;
		%feature("autodoc", "Returns a personorganizationselect selecttype.

Returns
-------
None
") StepBasic_PersonOrganizationSelect;
		 StepBasic_PersonOrganizationSelect();

		/****************** CaseNum ******************/
		%feature("compactdefaultargs") CaseNum;
		%feature("autodoc", "Recognizes a personorganizationselect kind entity that is : 1 -> person 2 -> organization 3 -> personandorganization 0 else.

Parameters
----------
ent: Standard_Transient

Returns
-------
int
") CaseNum;
		Standard_Integer CaseNum(const opencascade::handle<Standard_Transient> & ent);

		/****************** Organization ******************/
		%feature("compactdefaultargs") Organization;
		%feature("autodoc", "Returns value as a organization (null if another type).

Returns
-------
opencascade::handle<StepBasic_Organization>
") Organization;
		opencascade::handle<StepBasic_Organization> Organization();

		/****************** Person ******************/
		%feature("compactdefaultargs") Person;
		%feature("autodoc", "Returns value as a person (null if another type).

Returns
-------
opencascade::handle<StepBasic_Person>
") Person;
		opencascade::handle<StepBasic_Person> Person();

		/****************** PersonAndOrganization ******************/
		%feature("compactdefaultargs") PersonAndOrganization;
		%feature("autodoc", "Returns value as a personandorganization (null if another type).

Returns
-------
opencascade::handle<StepBasic_PersonAndOrganization>
") PersonAndOrganization;
		opencascade::handle<StepBasic_PersonAndOrganization> PersonAndOrganization();

};


%extend StepBasic_PersonOrganizationSelect {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************
* class StepBasic_Product *
**************************/
class StepBasic_Product : public Standard_Transient {
	public:
		/****************** StepBasic_Product ******************/
		%feature("compactdefaultargs") StepBasic_Product;
		%feature("autodoc", "Returns a product.

Returns
-------
None
") StepBasic_Product;
		 StepBasic_Product();

		/****************** Description ******************/
		%feature("compactdefaultargs") Description;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") Description;
		opencascade::handle<TCollection_HAsciiString> Description();

		/****************** FrameOfReference ******************/
		%feature("compactdefaultargs") FrameOfReference;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepBasic_HArray1OfProductContext>
") FrameOfReference;
		opencascade::handle<StepBasic_HArray1OfProductContext> FrameOfReference();

		/****************** FrameOfReferenceValue ******************/
		%feature("compactdefaultargs") FrameOfReferenceValue;
		%feature("autodoc", "No available documentation.

Parameters
----------
num: int

Returns
-------
opencascade::handle<StepBasic_ProductContext>
") FrameOfReferenceValue;
		opencascade::handle<StepBasic_ProductContext> FrameOfReferenceValue(const Standard_Integer num);

		/****************** Id ******************/
		%feature("compactdefaultargs") Id;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") Id;
		opencascade::handle<TCollection_HAsciiString> Id();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Parameters
----------
aId: TCollection_HAsciiString
aName: TCollection_HAsciiString
aDescription: TCollection_HAsciiString
aFrameOfReference: StepBasic_HArray1OfProductContext

Returns
-------
None
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aId, const opencascade::handle<TCollection_HAsciiString> & aName, const opencascade::handle<TCollection_HAsciiString> & aDescription, const opencascade::handle<StepBasic_HArray1OfProductContext> & aFrameOfReference);

		/****************** Name ******************/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") Name;
		opencascade::handle<TCollection_HAsciiString> Name();

		/****************** NbFrameOfReference ******************/
		%feature("compactdefaultargs") NbFrameOfReference;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbFrameOfReference;
		Standard_Integer NbFrameOfReference();

		/****************** SetDescription ******************/
		%feature("compactdefaultargs") SetDescription;
		%feature("autodoc", "No available documentation.

Parameters
----------
aDescription: TCollection_HAsciiString

Returns
-------
None
") SetDescription;
		void SetDescription(const opencascade::handle<TCollection_HAsciiString> & aDescription);

		/****************** SetFrameOfReference ******************/
		%feature("compactdefaultargs") SetFrameOfReference;
		%feature("autodoc", "No available documentation.

Parameters
----------
aFrameOfReference: StepBasic_HArray1OfProductContext

Returns
-------
None
") SetFrameOfReference;
		void SetFrameOfReference(const opencascade::handle<StepBasic_HArray1OfProductContext> & aFrameOfReference);

		/****************** SetId ******************/
		%feature("compactdefaultargs") SetId;
		%feature("autodoc", "No available documentation.

Parameters
----------
aId: TCollection_HAsciiString

Returns
-------
None
") SetId;
		void SetId(const opencascade::handle<TCollection_HAsciiString> & aId);

		/****************** SetName ******************/
		%feature("compactdefaultargs") SetName;
		%feature("autodoc", "No available documentation.

Parameters
----------
aName: TCollection_HAsciiString

Returns
-------
None
") SetName;
		void SetName(const opencascade::handle<TCollection_HAsciiString> & aName);

};


%make_alias(StepBasic_Product)

%extend StepBasic_Product {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************************
* class StepBasic_ProductCategory *
**********************************/
class StepBasic_ProductCategory : public Standard_Transient {
	public:
		/****************** StepBasic_ProductCategory ******************/
		%feature("compactdefaultargs") StepBasic_ProductCategory;
		%feature("autodoc", "Returns a productcategory.

Returns
-------
None
") StepBasic_ProductCategory;
		 StepBasic_ProductCategory();

		/****************** Description ******************/
		%feature("compactdefaultargs") Description;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") Description;
		opencascade::handle<TCollection_HAsciiString> Description();

		/****************** HasDescription ******************/
		%feature("compactdefaultargs") HasDescription;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") HasDescription;
		Standard_Boolean HasDescription();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Parameters
----------
aName: TCollection_HAsciiString
hasAdescription: bool
aDescription: TCollection_HAsciiString

Returns
-------
None
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aName, const Standard_Boolean hasAdescription, const opencascade::handle<TCollection_HAsciiString> & aDescription);

		/****************** Name ******************/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") Name;
		opencascade::handle<TCollection_HAsciiString> Name();

		/****************** SetDescription ******************/
		%feature("compactdefaultargs") SetDescription;
		%feature("autodoc", "No available documentation.

Parameters
----------
aDescription: TCollection_HAsciiString

Returns
-------
None
") SetDescription;
		void SetDescription(const opencascade::handle<TCollection_HAsciiString> & aDescription);

		/****************** SetName ******************/
		%feature("compactdefaultargs") SetName;
		%feature("autodoc", "No available documentation.

Parameters
----------
aName: TCollection_HAsciiString

Returns
-------
None
") SetName;
		void SetName(const opencascade::handle<TCollection_HAsciiString> & aName);

		/****************** UnSetDescription ******************/
		%feature("compactdefaultargs") UnSetDescription;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") UnSetDescription;
		void UnSetDescription();

};


%make_alias(StepBasic_ProductCategory)

%extend StepBasic_ProductCategory {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************************************
* class StepBasic_ProductCategoryRelationship *
**********************************************/
class StepBasic_ProductCategoryRelationship : public Standard_Transient {
	public:
		/****************** StepBasic_ProductCategoryRelationship ******************/
		%feature("compactdefaultargs") StepBasic_ProductCategoryRelationship;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") StepBasic_ProductCategoryRelationship;
		 StepBasic_ProductCategoryRelationship();

		/****************** Category ******************/
		%feature("compactdefaultargs") Category;
		%feature("autodoc", "Returns field category.

Returns
-------
opencascade::handle<StepBasic_ProductCategory>
") Category;
		opencascade::handle<StepBasic_ProductCategory> Category();

		/****************** Description ******************/
		%feature("compactdefaultargs") Description;
		%feature("autodoc", "Returns field description.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") Description;
		opencascade::handle<TCollection_HAsciiString> Description();

		/****************** HasDescription ******************/
		%feature("compactdefaultargs") HasDescription;
		%feature("autodoc", "Returns true if optional field description is defined.

Returns
-------
bool
") HasDescription;
		Standard_Boolean HasDescription();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Initialize all fields (own and inherited).

Parameters
----------
aName: TCollection_HAsciiString
hasDescription: bool
aDescription: TCollection_HAsciiString
aCategory: StepBasic_ProductCategory
aSubCategory: StepBasic_ProductCategory

Returns
-------
None
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aName, const Standard_Boolean hasDescription, const opencascade::handle<TCollection_HAsciiString> & aDescription, const opencascade::handle<StepBasic_ProductCategory> & aCategory, const opencascade::handle<StepBasic_ProductCategory> & aSubCategory);

		/****************** Name ******************/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "Returns field name.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") Name;
		opencascade::handle<TCollection_HAsciiString> Name();

		/****************** SetCategory ******************/
		%feature("compactdefaultargs") SetCategory;
		%feature("autodoc", "Set field category.

Parameters
----------
Category: StepBasic_ProductCategory

Returns
-------
None
") SetCategory;
		void SetCategory(const opencascade::handle<StepBasic_ProductCategory> & Category);

		/****************** SetDescription ******************/
		%feature("compactdefaultargs") SetDescription;
		%feature("autodoc", "Set field description.

Parameters
----------
Description: TCollection_HAsciiString

Returns
-------
None
") SetDescription;
		void SetDescription(const opencascade::handle<TCollection_HAsciiString> & Description);

		/****************** SetName ******************/
		%feature("compactdefaultargs") SetName;
		%feature("autodoc", "Set field name.

Parameters
----------
Name: TCollection_HAsciiString

Returns
-------
None
") SetName;
		void SetName(const opencascade::handle<TCollection_HAsciiString> & Name);

		/****************** SetSubCategory ******************/
		%feature("compactdefaultargs") SetSubCategory;
		%feature("autodoc", "Set field subcategory.

Parameters
----------
SubCategory: StepBasic_ProductCategory

Returns
-------
None
") SetSubCategory;
		void SetSubCategory(const opencascade::handle<StepBasic_ProductCategory> & SubCategory);

		/****************** SubCategory ******************/
		%feature("compactdefaultargs") SubCategory;
		%feature("autodoc", "Returns field subcategory.

Returns
-------
opencascade::handle<StepBasic_ProductCategory>
") SubCategory;
		opencascade::handle<StepBasic_ProductCategory> SubCategory();

};


%make_alias(StepBasic_ProductCategoryRelationship)

%extend StepBasic_ProductCategoryRelationship {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************************
* class StepBasic_ProductDefinition *
************************************/
class StepBasic_ProductDefinition : public Standard_Transient {
	public:
		/****************** StepBasic_ProductDefinition ******************/
		%feature("compactdefaultargs") StepBasic_ProductDefinition;
		%feature("autodoc", "Returns a productdefinition.

Returns
-------
None
") StepBasic_ProductDefinition;
		 StepBasic_ProductDefinition();

		/****************** Description ******************/
		%feature("compactdefaultargs") Description;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") Description;
		opencascade::handle<TCollection_HAsciiString> Description();

		/****************** Formation ******************/
		%feature("compactdefaultargs") Formation;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepBasic_ProductDefinitionFormation>
") Formation;
		opencascade::handle<StepBasic_ProductDefinitionFormation> Formation();

		/****************** FrameOfReference ******************/
		%feature("compactdefaultargs") FrameOfReference;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepBasic_ProductDefinitionContext>
") FrameOfReference;
		opencascade::handle<StepBasic_ProductDefinitionContext> FrameOfReference();

		/****************** Id ******************/
		%feature("compactdefaultargs") Id;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") Id;
		opencascade::handle<TCollection_HAsciiString> Id();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Parameters
----------
aId: TCollection_HAsciiString
aDescription: TCollection_HAsciiString
aFormation: StepBasic_ProductDefinitionFormation
aFrameOfReference: StepBasic_ProductDefinitionContext

Returns
-------
None
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aId, const opencascade::handle<TCollection_HAsciiString> & aDescription, const opencascade::handle<StepBasic_ProductDefinitionFormation> & aFormation, const opencascade::handle<StepBasic_ProductDefinitionContext> & aFrameOfReference);

		/****************** SetDescription ******************/
		%feature("compactdefaultargs") SetDescription;
		%feature("autodoc", "No available documentation.

Parameters
----------
aDescription: TCollection_HAsciiString

Returns
-------
None
") SetDescription;
		void SetDescription(const opencascade::handle<TCollection_HAsciiString> & aDescription);

		/****************** SetFormation ******************/
		%feature("compactdefaultargs") SetFormation;
		%feature("autodoc", "No available documentation.

Parameters
----------
aFormation: StepBasic_ProductDefinitionFormation

Returns
-------
None
") SetFormation;
		void SetFormation(const opencascade::handle<StepBasic_ProductDefinitionFormation> & aFormation);

		/****************** SetFrameOfReference ******************/
		%feature("compactdefaultargs") SetFrameOfReference;
		%feature("autodoc", "No available documentation.

Parameters
----------
aFrameOfReference: StepBasic_ProductDefinitionContext

Returns
-------
None
") SetFrameOfReference;
		void SetFrameOfReference(const opencascade::handle<StepBasic_ProductDefinitionContext> & aFrameOfReference);

		/****************** SetId ******************/
		%feature("compactdefaultargs") SetId;
		%feature("autodoc", "No available documentation.

Parameters
----------
aId: TCollection_HAsciiString

Returns
-------
None
") SetId;
		void SetId(const opencascade::handle<TCollection_HAsciiString> & aId);

};


%make_alias(StepBasic_ProductDefinition)

%extend StepBasic_ProductDefinition {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************************
* class StepBasic_ProductDefinitionFormation *
*********************************************/
class StepBasic_ProductDefinitionFormation : public Standard_Transient {
	public:
		/****************** StepBasic_ProductDefinitionFormation ******************/
		%feature("compactdefaultargs") StepBasic_ProductDefinitionFormation;
		%feature("autodoc", "Returns a productdefinitionformation.

Returns
-------
None
") StepBasic_ProductDefinitionFormation;
		 StepBasic_ProductDefinitionFormation();

		/****************** Description ******************/
		%feature("compactdefaultargs") Description;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") Description;
		opencascade::handle<TCollection_HAsciiString> Description();

		/****************** Id ******************/
		%feature("compactdefaultargs") Id;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") Id;
		opencascade::handle<TCollection_HAsciiString> Id();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Parameters
----------
aId: TCollection_HAsciiString
aDescription: TCollection_HAsciiString
aOfProduct: StepBasic_Product

Returns
-------
None
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aId, const opencascade::handle<TCollection_HAsciiString> & aDescription, const opencascade::handle<StepBasic_Product> & aOfProduct);

		/****************** OfProduct ******************/
		%feature("compactdefaultargs") OfProduct;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepBasic_Product>
") OfProduct;
		opencascade::handle<StepBasic_Product> OfProduct();

		/****************** SetDescription ******************/
		%feature("compactdefaultargs") SetDescription;
		%feature("autodoc", "No available documentation.

Parameters
----------
aDescription: TCollection_HAsciiString

Returns
-------
None
") SetDescription;
		void SetDescription(const opencascade::handle<TCollection_HAsciiString> & aDescription);

		/****************** SetId ******************/
		%feature("compactdefaultargs") SetId;
		%feature("autodoc", "No available documentation.

Parameters
----------
aId: TCollection_HAsciiString

Returns
-------
None
") SetId;
		void SetId(const opencascade::handle<TCollection_HAsciiString> & aId);

		/****************** SetOfProduct ******************/
		%feature("compactdefaultargs") SetOfProduct;
		%feature("autodoc", "No available documentation.

Parameters
----------
aOfProduct: StepBasic_Product

Returns
-------
None
") SetOfProduct;
		void SetOfProduct(const opencascade::handle<StepBasic_Product> & aOfProduct);

};


%make_alias(StepBasic_ProductDefinitionFormation)

%extend StepBasic_ProductDefinitionFormation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************************************
* class StepBasic_ProductDefinitionFormationRelationship *
*********************************************************/
class StepBasic_ProductDefinitionFormationRelationship : public Standard_Transient {
	public:
		/****************** StepBasic_ProductDefinitionFormationRelationship ******************/
		%feature("compactdefaultargs") StepBasic_ProductDefinitionFormationRelationship;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") StepBasic_ProductDefinitionFormationRelationship;
		 StepBasic_ProductDefinitionFormationRelationship();

		/****************** Description ******************/
		%feature("compactdefaultargs") Description;
		%feature("autodoc", "Returns field description.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") Description;
		opencascade::handle<TCollection_HAsciiString> Description();

		/****************** Id ******************/
		%feature("compactdefaultargs") Id;
		%feature("autodoc", "Returns field id.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") Id;
		opencascade::handle<TCollection_HAsciiString> Id();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Initialize all fields (own and inherited).

Parameters
----------
aId: TCollection_HAsciiString
aName: TCollection_HAsciiString
aDescription: TCollection_HAsciiString
aRelatingProductDefinitionFormation: StepBasic_ProductDefinitionFormation
aRelatedProductDefinitionFormation: StepBasic_ProductDefinitionFormation

Returns
-------
None
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aId, const opencascade::handle<TCollection_HAsciiString> & aName, const opencascade::handle<TCollection_HAsciiString> & aDescription, const opencascade::handle<StepBasic_ProductDefinitionFormation> & aRelatingProductDefinitionFormation, const opencascade::handle<StepBasic_ProductDefinitionFormation> & aRelatedProductDefinitionFormation);

		/****************** Name ******************/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "Returns field name.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") Name;
		opencascade::handle<TCollection_HAsciiString> Name();

		/****************** RelatedProductDefinitionFormation ******************/
		%feature("compactdefaultargs") RelatedProductDefinitionFormation;
		%feature("autodoc", "Returns field relatedproductdefinitionformation.

Returns
-------
opencascade::handle<StepBasic_ProductDefinitionFormation>
") RelatedProductDefinitionFormation;
		opencascade::handle<StepBasic_ProductDefinitionFormation> RelatedProductDefinitionFormation();

		/****************** RelatingProductDefinitionFormation ******************/
		%feature("compactdefaultargs") RelatingProductDefinitionFormation;
		%feature("autodoc", "Returns field relatingproductdefinitionformation.

Returns
-------
opencascade::handle<StepBasic_ProductDefinitionFormation>
") RelatingProductDefinitionFormation;
		opencascade::handle<StepBasic_ProductDefinitionFormation> RelatingProductDefinitionFormation();

		/****************** SetDescription ******************/
		%feature("compactdefaultargs") SetDescription;
		%feature("autodoc", "Set field description.

Parameters
----------
Description: TCollection_HAsciiString

Returns
-------
None
") SetDescription;
		void SetDescription(const opencascade::handle<TCollection_HAsciiString> & Description);

		/****************** SetId ******************/
		%feature("compactdefaultargs") SetId;
		%feature("autodoc", "Set field id.

Parameters
----------
Id: TCollection_HAsciiString

Returns
-------
None
") SetId;
		void SetId(const opencascade::handle<TCollection_HAsciiString> & Id);

		/****************** SetName ******************/
		%feature("compactdefaultargs") SetName;
		%feature("autodoc", "Set field name.

Parameters
----------
Name: TCollection_HAsciiString

Returns
-------
None
") SetName;
		void SetName(const opencascade::handle<TCollection_HAsciiString> & Name);

		/****************** SetRelatedProductDefinitionFormation ******************/
		%feature("compactdefaultargs") SetRelatedProductDefinitionFormation;
		%feature("autodoc", "Set field relatedproductdefinitionformation.

Parameters
----------
RelatedProductDefinitionFormation: StepBasic_ProductDefinitionFormation

Returns
-------
None
") SetRelatedProductDefinitionFormation;
		void SetRelatedProductDefinitionFormation(const opencascade::handle<StepBasic_ProductDefinitionFormation> & RelatedProductDefinitionFormation);

		/****************** SetRelatingProductDefinitionFormation ******************/
		%feature("compactdefaultargs") SetRelatingProductDefinitionFormation;
		%feature("autodoc", "Set field relatingproductdefinitionformation.

Parameters
----------
RelatingProductDefinitionFormation: StepBasic_ProductDefinitionFormation

Returns
-------
None
") SetRelatingProductDefinitionFormation;
		void SetRelatingProductDefinitionFormation(const opencascade::handle<StepBasic_ProductDefinitionFormation> & RelatingProductDefinitionFormation);

};


%make_alias(StepBasic_ProductDefinitionFormationRelationship)

%extend StepBasic_ProductDefinitionFormationRelationship {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************************************
* class StepBasic_ProductDefinitionOrReference *
***********************************************/
class StepBasic_ProductDefinitionOrReference : public StepData_SelectType {
	public:
		/****************** StepBasic_ProductDefinitionOrReference ******************/
		%feature("compactdefaultargs") StepBasic_ProductDefinitionOrReference;
		%feature("autodoc", "Returns a productdefinitionorreference selecttype.

Returns
-------
None
") StepBasic_ProductDefinitionOrReference;
		 StepBasic_ProductDefinitionOrReference();

		/****************** CaseNum ******************/
		%feature("compactdefaultargs") CaseNum;
		%feature("autodoc", "Recognizes a productdefinitionorreference kind entity that is : 1 -> productdefinition 2 -> productdefinitionreference 3 -> productdefinitionreferencewithlocalpresentation 0 else.

Parameters
----------
ent: Standard_Transient

Returns
-------
int
") CaseNum;
		Standard_Integer CaseNum(const opencascade::handle<Standard_Transient> & ent);

		/****************** ProductDefinition ******************/
		%feature("compactdefaultargs") ProductDefinition;
		%feature("autodoc", "Returns value as a productdefinition (null if another type).

Returns
-------
opencascade::handle<StepBasic_ProductDefinition>
") ProductDefinition;
		opencascade::handle<StepBasic_ProductDefinition> ProductDefinition();

		/****************** ProductDefinitionReference ******************/
		%feature("compactdefaultargs") ProductDefinitionReference;
		%feature("autodoc", "Returns value as a productdefinitionreference (null if another type).

Returns
-------
opencascade::handle<StepBasic_ProductDefinitionReference>
") ProductDefinitionReference;
		opencascade::handle<StepBasic_ProductDefinitionReference> ProductDefinitionReference();

		/****************** ProductDefinitionReferenceWithLocalRepresentation ******************/
		%feature("compactdefaultargs") ProductDefinitionReferenceWithLocalRepresentation;
		%feature("autodoc", "Returns value as a productdefinitionreferencewithlocalrepresentation (null if another type).

Returns
-------
opencascade::handle<StepBasic_ProductDefinitionReferenceWithLocalRepresentation>
") ProductDefinitionReferenceWithLocalRepresentation;
		opencascade::handle<StepBasic_ProductDefinitionReferenceWithLocalRepresentation> ProductDefinitionReferenceWithLocalRepresentation();

};


%extend StepBasic_ProductDefinitionOrReference {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************************
* class StepBasic_ProductDefinitionReference *
*********************************************/
class StepBasic_ProductDefinitionReference : public Standard_Transient {
	public:
		/****************** StepBasic_ProductDefinitionReference ******************/
		%feature("compactdefaultargs") StepBasic_ProductDefinitionReference;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") StepBasic_ProductDefinitionReference;
		 StepBasic_ProductDefinitionReference();

		/****************** HasIdOwningOrganizationName ******************/
		%feature("compactdefaultargs") HasIdOwningOrganizationName;
		%feature("autodoc", "Returns true if idowningorganizationname exists.

Returns
-------
bool
") HasIdOwningOrganizationName;
		Standard_Boolean HasIdOwningOrganizationName();

		/****************** IdOwningOrganizationName ******************/
		%feature("compactdefaultargs") IdOwningOrganizationName;
		%feature("autodoc", "Returns field idowningorganizationname.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") IdOwningOrganizationName;
		opencascade::handle<TCollection_HAsciiString> IdOwningOrganizationName();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Initialize all fields (own and inherited).

Parameters
----------
theSource: StepBasic_ExternalSource
theProductId: TCollection_HAsciiString
theProductDefinitionFormationId: TCollection_HAsciiString
theProductDefinitionId: TCollection_HAsciiString
theIdOwningOrganizationName: TCollection_HAsciiString

Returns
-------
None
") Init;
		void Init(const opencascade::handle<StepBasic_ExternalSource> & theSource, const opencascade::handle<TCollection_HAsciiString> & theProductId, const opencascade::handle<TCollection_HAsciiString> & theProductDefinitionFormationId, const opencascade::handle<TCollection_HAsciiString> & theProductDefinitionId, const opencascade::handle<TCollection_HAsciiString> & theIdOwningOrganizationName);

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Initialize all fields (own and inherited).

Parameters
----------
theSource: StepBasic_ExternalSource
theProductId: TCollection_HAsciiString
theProductDefinitionFormationId: TCollection_HAsciiString
theProductDefinitionId: TCollection_HAsciiString

Returns
-------
None
") Init;
		void Init(const opencascade::handle<StepBasic_ExternalSource> & theSource, const opencascade::handle<TCollection_HAsciiString> & theProductId, const opencascade::handle<TCollection_HAsciiString> & theProductDefinitionFormationId, const opencascade::handle<TCollection_HAsciiString> & theProductDefinitionId);

		/****************** ProductDefinitionFormationId ******************/
		%feature("compactdefaultargs") ProductDefinitionFormationId;
		%feature("autodoc", "Returns field productdefinitionformationid.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") ProductDefinitionFormationId;
		opencascade::handle<TCollection_HAsciiString> ProductDefinitionFormationId();

		/****************** ProductDefinitionId ******************/
		%feature("compactdefaultargs") ProductDefinitionId;
		%feature("autodoc", "Returns field productdefinitionid.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") ProductDefinitionId;
		opencascade::handle<TCollection_HAsciiString> ProductDefinitionId();

		/****************** ProductId ******************/
		%feature("compactdefaultargs") ProductId;
		%feature("autodoc", "Returns field productid.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") ProductId;
		opencascade::handle<TCollection_HAsciiString> ProductId();

		/****************** SetIdOwningOrganizationName ******************/
		%feature("compactdefaultargs") SetIdOwningOrganizationName;
		%feature("autodoc", "Set field idowningorganizationname.

Parameters
----------
theIdOwningOrganizationName: TCollection_HAsciiString

Returns
-------
None
") SetIdOwningOrganizationName;
		void SetIdOwningOrganizationName(const opencascade::handle<TCollection_HAsciiString> & theIdOwningOrganizationName);

		/****************** SetProductDefinitionFormationId ******************/
		%feature("compactdefaultargs") SetProductDefinitionFormationId;
		%feature("autodoc", "Set field productdefinitionformationid.

Parameters
----------
theProductDefinitionFormationId: TCollection_HAsciiString

Returns
-------
None
") SetProductDefinitionFormationId;
		void SetProductDefinitionFormationId(const opencascade::handle<TCollection_HAsciiString> & theProductDefinitionFormationId);

		/****************** SetProductDefinitionId ******************/
		%feature("compactdefaultargs") SetProductDefinitionId;
		%feature("autodoc", "Set field productdefinitionid.

Parameters
----------
theProductDefinitionId: TCollection_HAsciiString

Returns
-------
None
") SetProductDefinitionId;
		void SetProductDefinitionId(const opencascade::handle<TCollection_HAsciiString> & theProductDefinitionId);

		/****************** SetProductId ******************/
		%feature("compactdefaultargs") SetProductId;
		%feature("autodoc", "Set field productid.

Parameters
----------
theProductId: TCollection_HAsciiString

Returns
-------
None
") SetProductId;
		void SetProductId(const opencascade::handle<TCollection_HAsciiString> & theProductId);

		/****************** SetSource ******************/
		%feature("compactdefaultargs") SetSource;
		%feature("autodoc", "Set field source.

Parameters
----------
theSource: StepBasic_ExternalSource

Returns
-------
None
") SetSource;
		void SetSource(const opencascade::handle<StepBasic_ExternalSource> & theSource);

		/****************** Source ******************/
		%feature("compactdefaultargs") Source;
		%feature("autodoc", "Returns field source.

Returns
-------
opencascade::handle<StepBasic_ExternalSource>
") Source;
		opencascade::handle<StepBasic_ExternalSource> Source();

};


%make_alias(StepBasic_ProductDefinitionReference)

%extend StepBasic_ProductDefinitionReference {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************************************
* class StepBasic_ProductDefinitionRelationship *
************************************************/
class StepBasic_ProductDefinitionRelationship : public Standard_Transient {
	public:
		/****************** StepBasic_ProductDefinitionRelationship ******************/
		%feature("compactdefaultargs") StepBasic_ProductDefinitionRelationship;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") StepBasic_ProductDefinitionRelationship;
		 StepBasic_ProductDefinitionRelationship();

		/****************** Description ******************/
		%feature("compactdefaultargs") Description;
		%feature("autodoc", "Returns field description.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") Description;
		opencascade::handle<TCollection_HAsciiString> Description();

		/****************** HasDescription ******************/
		%feature("compactdefaultargs") HasDescription;
		%feature("autodoc", "Returns true if optional field description is defined.

Returns
-------
bool
") HasDescription;
		Standard_Boolean HasDescription();

		/****************** Id ******************/
		%feature("compactdefaultargs") Id;
		%feature("autodoc", "Returns field id.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") Id;
		opencascade::handle<TCollection_HAsciiString> Id();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Initialize all fields (own and inherited).

Parameters
----------
aId: TCollection_HAsciiString
aName: TCollection_HAsciiString
hasDescription: bool
aDescription: TCollection_HAsciiString
aRelatingProductDefinition: StepBasic_ProductDefinition
aRelatedProductDefinition: StepBasic_ProductDefinition

Returns
-------
None
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aId, const opencascade::handle<TCollection_HAsciiString> & aName, const Standard_Boolean hasDescription, const opencascade::handle<TCollection_HAsciiString> & aDescription, const opencascade::handle<StepBasic_ProductDefinition> & aRelatingProductDefinition, const opencascade::handle<StepBasic_ProductDefinition> & aRelatedProductDefinition);

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Initialize all fields (own and inherited).

Parameters
----------
aId: TCollection_HAsciiString
aName: TCollection_HAsciiString
hasDescription: bool
aDescription: TCollection_HAsciiString
aRelatingProductDefinition: StepBasic_ProductDefinitionOrReference
aRelatedProductDefinition: StepBasic_ProductDefinitionOrReference

Returns
-------
None
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aId, const opencascade::handle<TCollection_HAsciiString> & aName, const Standard_Boolean hasDescription, const opencascade::handle<TCollection_HAsciiString> & aDescription, const StepBasic_ProductDefinitionOrReference & aRelatingProductDefinition, const StepBasic_ProductDefinitionOrReference & aRelatedProductDefinition);

		/****************** Name ******************/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "Returns field name.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") Name;
		opencascade::handle<TCollection_HAsciiString> Name();

		/****************** RelatedProductDefinition ******************/
		%feature("compactdefaultargs") RelatedProductDefinition;
		%feature("autodoc", "Returns field relatedproductdefinition.

Returns
-------
opencascade::handle<StepBasic_ProductDefinition>
") RelatedProductDefinition;
		opencascade::handle<StepBasic_ProductDefinition> RelatedProductDefinition();

		/****************** RelatedProductDefinitionAP242 ******************/
		%feature("compactdefaultargs") RelatedProductDefinitionAP242;
		%feature("autodoc", "Returns field relatedproductdefinition in ap242.

Returns
-------
StepBasic_ProductDefinitionOrReference
") RelatedProductDefinitionAP242;
		StepBasic_ProductDefinitionOrReference RelatedProductDefinitionAP242();

		/****************** RelatingProductDefinition ******************/
		%feature("compactdefaultargs") RelatingProductDefinition;
		%feature("autodoc", "Returns field relatingproductdefinition.

Returns
-------
opencascade::handle<StepBasic_ProductDefinition>
") RelatingProductDefinition;
		opencascade::handle<StepBasic_ProductDefinition> RelatingProductDefinition();

		/****************** RelatingProductDefinitionAP242 ******************/
		%feature("compactdefaultargs") RelatingProductDefinitionAP242;
		%feature("autodoc", "Returns field relatingproductdefinition in ap242.

Returns
-------
StepBasic_ProductDefinitionOrReference
") RelatingProductDefinitionAP242;
		StepBasic_ProductDefinitionOrReference RelatingProductDefinitionAP242();

		/****************** SetDescription ******************/
		%feature("compactdefaultargs") SetDescription;
		%feature("autodoc", "Set field description.

Parameters
----------
Description: TCollection_HAsciiString

Returns
-------
None
") SetDescription;
		void SetDescription(const opencascade::handle<TCollection_HAsciiString> & Description);

		/****************** SetId ******************/
		%feature("compactdefaultargs") SetId;
		%feature("autodoc", "Set field id.

Parameters
----------
Id: TCollection_HAsciiString

Returns
-------
None
") SetId;
		void SetId(const opencascade::handle<TCollection_HAsciiString> & Id);

		/****************** SetName ******************/
		%feature("compactdefaultargs") SetName;
		%feature("autodoc", "Set field name.

Parameters
----------
Name: TCollection_HAsciiString

Returns
-------
None
") SetName;
		void SetName(const opencascade::handle<TCollection_HAsciiString> & Name);

		/****************** SetRelatedProductDefinition ******************/
		%feature("compactdefaultargs") SetRelatedProductDefinition;
		%feature("autodoc", "Set field relatedproductdefinition.

Parameters
----------
RelatedProductDefinition: StepBasic_ProductDefinition

Returns
-------
None
") SetRelatedProductDefinition;
		void SetRelatedProductDefinition(const opencascade::handle<StepBasic_ProductDefinition> & RelatedProductDefinition);

		/****************** SetRelatedProductDefinition ******************/
		%feature("compactdefaultargs") SetRelatedProductDefinition;
		%feature("autodoc", "Set field relatedproductdefinition in ap242.

Parameters
----------
RelatedProductDefinition: StepBasic_ProductDefinitionOrReference

Returns
-------
None
") SetRelatedProductDefinition;
		void SetRelatedProductDefinition(const StepBasic_ProductDefinitionOrReference & RelatedProductDefinition);

		/****************** SetRelatingProductDefinition ******************/
		%feature("compactdefaultargs") SetRelatingProductDefinition;
		%feature("autodoc", "Set field relatingproductdefinition.

Parameters
----------
RelatingProductDefinition: StepBasic_ProductDefinition

Returns
-------
None
") SetRelatingProductDefinition;
		void SetRelatingProductDefinition(const opencascade::handle<StepBasic_ProductDefinition> & RelatingProductDefinition);

		/****************** SetRelatingProductDefinition ******************/
		%feature("compactdefaultargs") SetRelatingProductDefinition;
		%feature("autodoc", "Set field relatingproductdefinition in ap242.

Parameters
----------
RelatingProductDefinition: StepBasic_ProductDefinitionOrReference

Returns
-------
None
") SetRelatingProductDefinition;
		void SetRelatingProductDefinition(const StepBasic_ProductDefinitionOrReference & RelatingProductDefinition);

};


%make_alias(StepBasic_ProductDefinitionRelationship)

%extend StepBasic_ProductDefinitionRelationship {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************************************
* class StepBasic_ProductOrFormationOrDefinition *
*************************************************/
class StepBasic_ProductOrFormationOrDefinition : public StepData_SelectType {
	public:
		/****************** StepBasic_ProductOrFormationOrDefinition ******************/
		%feature("compactdefaultargs") StepBasic_ProductOrFormationOrDefinition;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") StepBasic_ProductOrFormationOrDefinition;
		 StepBasic_ProductOrFormationOrDefinition();

		/****************** CaseNum ******************/
		%feature("compactdefaultargs") CaseNum;
		%feature("autodoc", "Recognizes a kind of productorformationordefinition select type 1 -> product from stepbasic 2 -> productdefinitionformation from stepbasic 3 -> productdefinition from stepbasic 0 else.

Parameters
----------
ent: Standard_Transient

Returns
-------
int
") CaseNum;
		Standard_Integer CaseNum(const opencascade::handle<Standard_Transient> & ent);

		/****************** Product ******************/
		%feature("compactdefaultargs") Product;
		%feature("autodoc", "Returns value as product (or null if another type).

Returns
-------
opencascade::handle<StepBasic_Product>
") Product;
		opencascade::handle<StepBasic_Product> Product();

		/****************** ProductDefinition ******************/
		%feature("compactdefaultargs") ProductDefinition;
		%feature("autodoc", "Returns value as productdefinition (or null if another type).

Returns
-------
opencascade::handle<StepBasic_ProductDefinition>
") ProductDefinition;
		opencascade::handle<StepBasic_ProductDefinition> ProductDefinition();

		/****************** ProductDefinitionFormation ******************/
		%feature("compactdefaultargs") ProductDefinitionFormation;
		%feature("autodoc", "Returns value as productdefinitionformation (or null if another type).

Returns
-------
opencascade::handle<StepBasic_ProductDefinitionFormation>
") ProductDefinitionFormation;
		opencascade::handle<StepBasic_ProductDefinitionFormation> ProductDefinitionFormation();

};


%extend StepBasic_ProductOrFormationOrDefinition {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************************
* class StepBasic_RoleAssociation *
**********************************/
class StepBasic_RoleAssociation : public Standard_Transient {
	public:
		/****************** StepBasic_RoleAssociation ******************/
		%feature("compactdefaultargs") StepBasic_RoleAssociation;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") StepBasic_RoleAssociation;
		 StepBasic_RoleAssociation();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Initialize all fields (own and inherited).

Parameters
----------
aRole: StepBasic_ObjectRole
aItemWithRole: StepBasic_RoleSelect

Returns
-------
None
") Init;
		void Init(const opencascade::handle<StepBasic_ObjectRole> & aRole, const StepBasic_RoleSelect & aItemWithRole);

		/****************** ItemWithRole ******************/
		%feature("compactdefaultargs") ItemWithRole;
		%feature("autodoc", "Returns field itemwithrole.

Returns
-------
StepBasic_RoleSelect
") ItemWithRole;
		StepBasic_RoleSelect ItemWithRole();

		/****************** Role ******************/
		%feature("compactdefaultargs") Role;
		%feature("autodoc", "Returns field role.

Returns
-------
opencascade::handle<StepBasic_ObjectRole>
") Role;
		opencascade::handle<StepBasic_ObjectRole> Role();

		/****************** SetItemWithRole ******************/
		%feature("compactdefaultargs") SetItemWithRole;
		%feature("autodoc", "Set field itemwithrole.

Parameters
----------
ItemWithRole: StepBasic_RoleSelect

Returns
-------
None
") SetItemWithRole;
		void SetItemWithRole(const StepBasic_RoleSelect & ItemWithRole);

		/****************** SetRole ******************/
		%feature("compactdefaultargs") SetRole;
		%feature("autodoc", "Set field role.

Parameters
----------
Role: StepBasic_ObjectRole

Returns
-------
None
") SetRole;
		void SetRole(const opencascade::handle<StepBasic_ObjectRole> & Role);

};


%make_alias(StepBasic_RoleAssociation)

%extend StepBasic_RoleAssociation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************
* class StepBasic_RoleSelect *
*****************************/
class StepBasic_RoleSelect : public StepData_SelectType {
	public:
		/****************** StepBasic_RoleSelect ******************/
		%feature("compactdefaultargs") StepBasic_RoleSelect;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") StepBasic_RoleSelect;
		 StepBasic_RoleSelect();

		/****************** ActionAssignment ******************/
		%feature("compactdefaultargs") ActionAssignment;
		%feature("autodoc", "Returns value as actionassignment (or null if another type).

Returns
-------
opencascade::handle<StepBasic_ActionAssignment>
") ActionAssignment;
		opencascade::handle<StepBasic_ActionAssignment> ActionAssignment();

		/****************** ActionRequestAssignment ******************/
		%feature("compactdefaultargs") ActionRequestAssignment;
		%feature("autodoc", "Returns value as actionrequestassignment (or null if another type).

Returns
-------
opencascade::handle<StepBasic_ActionRequestAssignment>
") ActionRequestAssignment;
		opencascade::handle<StepBasic_ActionRequestAssignment> ActionRequestAssignment();

		/****************** ApprovalAssignment ******************/
		%feature("compactdefaultargs") ApprovalAssignment;
		%feature("autodoc", "Returns value as approvalassignment (or null if another type).

Returns
-------
opencascade::handle<StepBasic_ApprovalAssignment>
") ApprovalAssignment;
		opencascade::handle<StepBasic_ApprovalAssignment> ApprovalAssignment();

		/****************** ApprovalDateTime ******************/
		%feature("compactdefaultargs") ApprovalDateTime;
		%feature("autodoc", "Returns value as approvaldatetime (or null if another type).

Returns
-------
opencascade::handle<StepBasic_ApprovalDateTime>
") ApprovalDateTime;
		opencascade::handle<StepBasic_ApprovalDateTime> ApprovalDateTime();

		/****************** CaseNum ******************/
		%feature("compactdefaultargs") CaseNum;
		%feature("autodoc", "Recognizes a kind of roleselect select type 1 -> actionassignment from stepbasic 2 -> actionrequestassignment from stepbasic 3 -> approvalassignment from stepbasic 4 -> approvaldatetime from stepbasic 5 -> certificationassignment from stepbasic 6 -> contractassignment from stepbasic 7 -> documentreference from stepbasic 8 -> effectivityassignment from stepbasic 9 -> groupassignment from stepbasic 10 -> nameassignment from stepbasic 11 -> securityclassificationassignment from stepbasic 0 else.

Parameters
----------
ent: Standard_Transient

Returns
-------
int
") CaseNum;
		Standard_Integer CaseNum(const opencascade::handle<Standard_Transient> & ent);

		/****************** CertificationAssignment ******************/
		%feature("compactdefaultargs") CertificationAssignment;
		%feature("autodoc", "Returns value as certificationassignment (or null if another type).

Returns
-------
opencascade::handle<StepBasic_CertificationAssignment>
") CertificationAssignment;
		opencascade::handle<StepBasic_CertificationAssignment> CertificationAssignment();

		/****************** ContractAssignment ******************/
		%feature("compactdefaultargs") ContractAssignment;
		%feature("autodoc", "Returns value as contractassignment (or null if another type).

Returns
-------
opencascade::handle<StepBasic_ContractAssignment>
") ContractAssignment;
		opencascade::handle<StepBasic_ContractAssignment> ContractAssignment();

		/****************** DocumentReference ******************/
		%feature("compactdefaultargs") DocumentReference;
		%feature("autodoc", "Returns value as documentreference (or null if another type).

Returns
-------
opencascade::handle<StepBasic_DocumentReference>
") DocumentReference;
		opencascade::handle<StepBasic_DocumentReference> DocumentReference();

		/****************** EffectivityAssignment ******************/
		%feature("compactdefaultargs") EffectivityAssignment;
		%feature("autodoc", "Returns value as effectivityassignment (or null if another type).

Returns
-------
opencascade::handle<StepBasic_EffectivityAssignment>
") EffectivityAssignment;
		opencascade::handle<StepBasic_EffectivityAssignment> EffectivityAssignment();

		/****************** GroupAssignment ******************/
		%feature("compactdefaultargs") GroupAssignment;
		%feature("autodoc", "Returns value as groupassignment (or null if another type).

Returns
-------
opencascade::handle<StepBasic_GroupAssignment>
") GroupAssignment;
		opencascade::handle<StepBasic_GroupAssignment> GroupAssignment();

		/****************** NameAssignment ******************/
		%feature("compactdefaultargs") NameAssignment;
		%feature("autodoc", "Returns value as nameassignment (or null if another type).

Returns
-------
opencascade::handle<StepBasic_NameAssignment>
") NameAssignment;
		opencascade::handle<StepBasic_NameAssignment> NameAssignment();

		/****************** SecurityClassificationAssignment ******************/
		%feature("compactdefaultargs") SecurityClassificationAssignment;
		%feature("autodoc", "Returns value as securityclassificationassignment (or null if another type).

Returns
-------
opencascade::handle<StepBasic_SecurityClassificationAssignment>
") SecurityClassificationAssignment;
		opencascade::handle<StepBasic_SecurityClassificationAssignment> SecurityClassificationAssignment();

};


%extend StepBasic_RoleSelect {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************************
* class StepBasic_SecurityClassification *
*****************************************/
class StepBasic_SecurityClassification : public Standard_Transient {
	public:
		/****************** StepBasic_SecurityClassification ******************/
		%feature("compactdefaultargs") StepBasic_SecurityClassification;
		%feature("autodoc", "Returns a securityclassification.

Returns
-------
None
") StepBasic_SecurityClassification;
		 StepBasic_SecurityClassification();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Parameters
----------
aName: TCollection_HAsciiString
aPurpose: TCollection_HAsciiString
aSecurityLevel: StepBasic_SecurityClassificationLevel

Returns
-------
None
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aName, const opencascade::handle<TCollection_HAsciiString> & aPurpose, const opencascade::handle<StepBasic_SecurityClassificationLevel> & aSecurityLevel);

		/****************** Name ******************/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") Name;
		opencascade::handle<TCollection_HAsciiString> Name();

		/****************** Purpose ******************/
		%feature("compactdefaultargs") Purpose;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") Purpose;
		opencascade::handle<TCollection_HAsciiString> Purpose();

		/****************** SecurityLevel ******************/
		%feature("compactdefaultargs") SecurityLevel;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepBasic_SecurityClassificationLevel>
") SecurityLevel;
		opencascade::handle<StepBasic_SecurityClassificationLevel> SecurityLevel();

		/****************** SetName ******************/
		%feature("compactdefaultargs") SetName;
		%feature("autodoc", "No available documentation.

Parameters
----------
aName: TCollection_HAsciiString

Returns
-------
None
") SetName;
		void SetName(const opencascade::handle<TCollection_HAsciiString> & aName);

		/****************** SetPurpose ******************/
		%feature("compactdefaultargs") SetPurpose;
		%feature("autodoc", "No available documentation.

Parameters
----------
aPurpose: TCollection_HAsciiString

Returns
-------
None
") SetPurpose;
		void SetPurpose(const opencascade::handle<TCollection_HAsciiString> & aPurpose);

		/****************** SetSecurityLevel ******************/
		%feature("compactdefaultargs") SetSecurityLevel;
		%feature("autodoc", "No available documentation.

Parameters
----------
aSecurityLevel: StepBasic_SecurityClassificationLevel

Returns
-------
None
") SetSecurityLevel;
		void SetSecurityLevel(const opencascade::handle<StepBasic_SecurityClassificationLevel> & aSecurityLevel);

};


%make_alias(StepBasic_SecurityClassification)

%extend StepBasic_SecurityClassification {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************************************
* class StepBasic_SecurityClassificationAssignment *
***************************************************/
class StepBasic_SecurityClassificationAssignment : public Standard_Transient {
	public:
		/****************** AssignedSecurityClassification ******************/
		%feature("compactdefaultargs") AssignedSecurityClassification;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepBasic_SecurityClassification>
") AssignedSecurityClassification;
		opencascade::handle<StepBasic_SecurityClassification> AssignedSecurityClassification();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Parameters
----------
aAssignedSecurityClassification: StepBasic_SecurityClassification

Returns
-------
None
") Init;
		void Init(const opencascade::handle<StepBasic_SecurityClassification> & aAssignedSecurityClassification);

		/****************** SetAssignedSecurityClassification ******************/
		%feature("compactdefaultargs") SetAssignedSecurityClassification;
		%feature("autodoc", "No available documentation.

Parameters
----------
aAssignedSecurityClassification: StepBasic_SecurityClassification

Returns
-------
None
") SetAssignedSecurityClassification;
		void SetAssignedSecurityClassification(const opencascade::handle<StepBasic_SecurityClassification> & aAssignedSecurityClassification);

};


%make_alias(StepBasic_SecurityClassificationAssignment)

%extend StepBasic_SecurityClassificationAssignment {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************************************
* class StepBasic_SecurityClassificationLevel *
**********************************************/
class StepBasic_SecurityClassificationLevel : public Standard_Transient {
	public:
		/****************** StepBasic_SecurityClassificationLevel ******************/
		%feature("compactdefaultargs") StepBasic_SecurityClassificationLevel;
		%feature("autodoc", "Returns a securityclassificationlevel.

Returns
-------
None
") StepBasic_SecurityClassificationLevel;
		 StepBasic_SecurityClassificationLevel();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Parameters
----------
aName: TCollection_HAsciiString

Returns
-------
None
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aName);

		/****************** Name ******************/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") Name;
		opencascade::handle<TCollection_HAsciiString> Name();

		/****************** SetName ******************/
		%feature("compactdefaultargs") SetName;
		%feature("autodoc", "No available documentation.

Parameters
----------
aName: TCollection_HAsciiString

Returns
-------
None
") SetName;
		void SetName(const opencascade::handle<TCollection_HAsciiString> & aName);

};


%make_alias(StepBasic_SecurityClassificationLevel)

%extend StepBasic_SecurityClassificationLevel {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************
* class StepBasic_SizeMember *
*****************************/
class StepBasic_SizeMember : public StepData_SelectReal {
	public:
		/****************** StepBasic_SizeMember ******************/
		%feature("compactdefaultargs") StepBasic_SizeMember;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") StepBasic_SizeMember;
		 StepBasic_SizeMember();

		/****************** HasName ******************/
		%feature("compactdefaultargs") HasName;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") HasName;
		virtual Standard_Boolean HasName();

		/****************** Name ******************/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "No available documentation.

Returns
-------
char *
") Name;
		virtual const char * Name();

		/****************** SetName ******************/
		%feature("compactdefaultargs") SetName;
		%feature("autodoc", "No available documentation.

Parameters
----------
name: char *

Returns
-------
bool
") SetName;
		virtual Standard_Boolean SetName(const char * name);

};


%make_alias(StepBasic_SizeMember)

%extend StepBasic_SizeMember {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************
* class StepBasic_SizeSelect *
*****************************/
class StepBasic_SizeSelect : public StepData_SelectType {
	public:
		/****************** StepBasic_SizeSelect ******************/
		%feature("compactdefaultargs") StepBasic_SizeSelect;
		%feature("autodoc", "Returns a sizeselect selecttype.

Returns
-------
None
") StepBasic_SizeSelect;
		 StepBasic_SizeSelect();

		/****************** CaseMem ******************/
		%feature("compactdefaultargs") CaseMem;
		%feature("autodoc", "Recognizes a selectmember as real, named as parameter_value 1 -> positivelengthmeasure i.e. real 0 else (i.e. entity).

Parameters
----------
ent: StepData_SelectMember

Returns
-------
int
") CaseMem;
		virtual Standard_Integer CaseMem(const opencascade::handle<StepData_SelectMember> & ent);

		/****************** CaseNum ******************/
		%feature("compactdefaultargs") CaseNum;
		%feature("autodoc", "Recognizes a trimmingselect kind entity that is : 1 -> sizemember 0 else (i.e. real).

Parameters
----------
ent: Standard_Transient

Returns
-------
int
") CaseNum;
		Standard_Integer CaseNum(const opencascade::handle<Standard_Transient> & ent);

		/****************** NewMember ******************/
		%feature("compactdefaultargs") NewMember;
		%feature("autodoc", "Returns a sizemember (positive_length_measure) as preferred.

Returns
-------
opencascade::handle<StepData_SelectMember>
") NewMember;
		virtual opencascade::handle<StepData_SelectMember> NewMember();

		/****************** RealValue ******************/
		%feature("compactdefaultargs") RealValue;
		%feature("autodoc", "Returns value as a real (null if another type).

Returns
-------
float
") RealValue;
		Standard_Real RealValue();

		/****************** SetRealValue ******************/
		%feature("compactdefaultargs") SetRealValue;
		%feature("autodoc", "No available documentation.

Parameters
----------
aReal: float

Returns
-------
None
") SetRealValue;
		void SetRealValue(const Standard_Real aReal);

};


%extend StepBasic_SizeSelect {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************
* class StepBasic_SourceItem *
*****************************/
class StepBasic_SourceItem : public StepData_SelectType {
	public:
		/****************** StepBasic_SourceItem ******************/
		%feature("compactdefaultargs") StepBasic_SourceItem;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") StepBasic_SourceItem;
		 StepBasic_SourceItem();

		/****************** CaseNum ******************/
		%feature("compactdefaultargs") CaseNum;
		%feature("autodoc", "Recognizes a kind of sourceitem select type 1 -> hasciistring from tcollection 0 else.

Parameters
----------
ent: Standard_Transient

Returns
-------
int
") CaseNum;
		Standard_Integer CaseNum(const opencascade::handle<Standard_Transient> & ent);

		/****************** Identifier ******************/
		%feature("compactdefaultargs") Identifier;
		%feature("autodoc", "Returns value as identifier (or null if another type).

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") Identifier;
		opencascade::handle<TCollection_HAsciiString> Identifier();

		/****************** NewMember ******************/
		%feature("compactdefaultargs") NewMember;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepData_SelectMember>
") NewMember;
		virtual opencascade::handle<StepData_SelectMember> NewMember();

};


%extend StepBasic_SourceItem {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************
* class StepBasic_Unit *
***********************/
class StepBasic_Unit : public StepData_SelectType {
	public:
		/****************** StepBasic_Unit ******************/
		%feature("compactdefaultargs") StepBasic_Unit;
		%feature("autodoc", "Creates empty object.

Returns
-------
None
") StepBasic_Unit;
		 StepBasic_Unit();

		/****************** CaseNum ******************/
		%feature("compactdefaultargs") CaseNum;
		%feature("autodoc", "Recognizes a type of unit entity 1 -> namedunit 2 -> derivedunit.

Parameters
----------
ent: Standard_Transient

Returns
-------
int
") CaseNum;
		Standard_Integer CaseNum(const opencascade::handle<Standard_Transient> & ent);

		/****************** DerivedUnit ******************/
		%feature("compactdefaultargs") DerivedUnit;
		%feature("autodoc", "Returns value as a derivedunit (null if another type).

Returns
-------
opencascade::handle<StepBasic_DerivedUnit>
") DerivedUnit;
		opencascade::handle<StepBasic_DerivedUnit> DerivedUnit();

		/****************** NamedUnit ******************/
		%feature("compactdefaultargs") NamedUnit;
		%feature("autodoc", "Returns value as a namedunit (null if another type).

Returns
-------
opencascade::handle<StepBasic_NamedUnit>
") NamedUnit;
		opencascade::handle<StepBasic_NamedUnit> NamedUnit();

};


%extend StepBasic_Unit {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************************
* class StepBasic_VersionedActionRequest *
*****************************************/
class StepBasic_VersionedActionRequest : public Standard_Transient {
	public:
		/****************** StepBasic_VersionedActionRequest ******************/
		%feature("compactdefaultargs") StepBasic_VersionedActionRequest;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") StepBasic_VersionedActionRequest;
		 StepBasic_VersionedActionRequest();

		/****************** Description ******************/
		%feature("compactdefaultargs") Description;
		%feature("autodoc", "Returns field description.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") Description;
		opencascade::handle<TCollection_HAsciiString> Description();

		/****************** HasDescription ******************/
		%feature("compactdefaultargs") HasDescription;
		%feature("autodoc", "Returns true if optional field description is defined.

Returns
-------
bool
") HasDescription;
		Standard_Boolean HasDescription();

		/****************** Id ******************/
		%feature("compactdefaultargs") Id;
		%feature("autodoc", "Returns field id.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") Id;
		opencascade::handle<TCollection_HAsciiString> Id();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Initialize all fields (own and inherited).

Parameters
----------
aId: TCollection_HAsciiString
aVersion: TCollection_HAsciiString
aPurpose: TCollection_HAsciiString
hasDescription: bool
aDescription: TCollection_HAsciiString

Returns
-------
None
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aId, const opencascade::handle<TCollection_HAsciiString> & aVersion, const opencascade::handle<TCollection_HAsciiString> & aPurpose, const Standard_Boolean hasDescription, const opencascade::handle<TCollection_HAsciiString> & aDescription);

		/****************** Purpose ******************/
		%feature("compactdefaultargs") Purpose;
		%feature("autodoc", "Returns field purpose.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") Purpose;
		opencascade::handle<TCollection_HAsciiString> Purpose();

		/****************** SetDescription ******************/
		%feature("compactdefaultargs") SetDescription;
		%feature("autodoc", "Set field description.

Parameters
----------
Description: TCollection_HAsciiString

Returns
-------
None
") SetDescription;
		void SetDescription(const opencascade::handle<TCollection_HAsciiString> & Description);

		/****************** SetId ******************/
		%feature("compactdefaultargs") SetId;
		%feature("autodoc", "Set field id.

Parameters
----------
Id: TCollection_HAsciiString

Returns
-------
None
") SetId;
		void SetId(const opencascade::handle<TCollection_HAsciiString> & Id);

		/****************** SetPurpose ******************/
		%feature("compactdefaultargs") SetPurpose;
		%feature("autodoc", "Set field purpose.

Parameters
----------
Purpose: TCollection_HAsciiString

Returns
-------
None
") SetPurpose;
		void SetPurpose(const opencascade::handle<TCollection_HAsciiString> & Purpose);

		/****************** SetVersion ******************/
		%feature("compactdefaultargs") SetVersion;
		%feature("autodoc", "Set field version.

Parameters
----------
Version: TCollection_HAsciiString

Returns
-------
None
") SetVersion;
		void SetVersion(const opencascade::handle<TCollection_HAsciiString> & Version);

		/****************** Version ******************/
		%feature("compactdefaultargs") Version;
		%feature("autodoc", "Returns field version.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") Version;
		opencascade::handle<TCollection_HAsciiString> Version();

};


%make_alias(StepBasic_VersionedActionRequest)

%extend StepBasic_VersionedActionRequest {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************
* class StepBasic_AreaUnit *
***************************/
class StepBasic_AreaUnit : public StepBasic_NamedUnit {
	public:
		/****************** StepBasic_AreaUnit ******************/
		%feature("compactdefaultargs") StepBasic_AreaUnit;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") StepBasic_AreaUnit;
		 StepBasic_AreaUnit();

};


%make_alias(StepBasic_AreaUnit)

%extend StepBasic_AreaUnit {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************
* class StepBasic_CalendarDate *
*******************************/
class StepBasic_CalendarDate : public StepBasic_Date {
	public:
		/****************** StepBasic_CalendarDate ******************/
		%feature("compactdefaultargs") StepBasic_CalendarDate;
		%feature("autodoc", "Returns a calendardate.

Returns
-------
None
") StepBasic_CalendarDate;
		 StepBasic_CalendarDate();

		/****************** DayComponent ******************/
		%feature("compactdefaultargs") DayComponent;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") DayComponent;
		Standard_Integer DayComponent();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Parameters
----------
aYearComponent: int
aDayComponent: int
aMonthComponent: int

Returns
-------
None
") Init;
		void Init(const Standard_Integer aYearComponent, const Standard_Integer aDayComponent, const Standard_Integer aMonthComponent);

		/****************** MonthComponent ******************/
		%feature("compactdefaultargs") MonthComponent;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") MonthComponent;
		Standard_Integer MonthComponent();

		/****************** SetDayComponent ******************/
		%feature("compactdefaultargs") SetDayComponent;
		%feature("autodoc", "No available documentation.

Parameters
----------
aDayComponent: int

Returns
-------
None
") SetDayComponent;
		void SetDayComponent(const Standard_Integer aDayComponent);

		/****************** SetMonthComponent ******************/
		%feature("compactdefaultargs") SetMonthComponent;
		%feature("autodoc", "No available documentation.

Parameters
----------
aMonthComponent: int

Returns
-------
None
") SetMonthComponent;
		void SetMonthComponent(const Standard_Integer aMonthComponent);

};


%make_alias(StepBasic_CalendarDate)

%extend StepBasic_CalendarDate {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************************
* class StepBasic_ConversionBasedUnit *
**************************************/
class StepBasic_ConversionBasedUnit : public StepBasic_NamedUnit {
	public:
		/****************** StepBasic_ConversionBasedUnit ******************/
		%feature("compactdefaultargs") StepBasic_ConversionBasedUnit;
		%feature("autodoc", "Returns a conversionbasedunit.

Returns
-------
None
") StepBasic_ConversionBasedUnit;
		 StepBasic_ConversionBasedUnit();

		/****************** ConversionFactor ******************/
		%feature("compactdefaultargs") ConversionFactor;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepBasic_MeasureWithUnit>
") ConversionFactor;
		opencascade::handle<StepBasic_MeasureWithUnit> ConversionFactor();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Parameters
----------
aDimensions: StepBasic_DimensionalExponents
aName: TCollection_HAsciiString
aConversionFactor: StepBasic_MeasureWithUnit

Returns
-------
None
") Init;
		void Init(const opencascade::handle<StepBasic_DimensionalExponents> & aDimensions, const opencascade::handle<TCollection_HAsciiString> & aName, const opencascade::handle<StepBasic_MeasureWithUnit> & aConversionFactor);

		/****************** Name ******************/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") Name;
		opencascade::handle<TCollection_HAsciiString> Name();

		/****************** SetConversionFactor ******************/
		%feature("compactdefaultargs") SetConversionFactor;
		%feature("autodoc", "No available documentation.

Parameters
----------
aConversionFactor: StepBasic_MeasureWithUnit

Returns
-------
None
") SetConversionFactor;
		void SetConversionFactor(const opencascade::handle<StepBasic_MeasureWithUnit> & aConversionFactor);

		/****************** SetName ******************/
		%feature("compactdefaultargs") SetName;
		%feature("autodoc", "No available documentation.

Parameters
----------
aName: TCollection_HAsciiString

Returns
-------
None
") SetName;
		void SetName(const opencascade::handle<TCollection_HAsciiString> & aName);

};


%make_alias(StepBasic_ConversionBasedUnit)

%extend StepBasic_ConversionBasedUnit {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************************
* class StepBasic_DigitalDocument *
**********************************/
class StepBasic_DigitalDocument : public StepBasic_Document {
	public:
		/****************** StepBasic_DigitalDocument ******************/
		%feature("compactdefaultargs") StepBasic_DigitalDocument;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") StepBasic_DigitalDocument;
		 StepBasic_DigitalDocument();

};


%make_alias(StepBasic_DigitalDocument)

%extend StepBasic_DigitalDocument {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************
* class StepBasic_DocumentFile *
*******************************/
class StepBasic_DocumentFile : public StepBasic_Document {
	public:
		/****************** StepBasic_DocumentFile ******************/
		%feature("compactdefaultargs") StepBasic_DocumentFile;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") StepBasic_DocumentFile;
		 StepBasic_DocumentFile();

		/****************** CharacterizedObject ******************/
		%feature("compactdefaultargs") CharacterizedObject;
		%feature("autodoc", "Returns data for supertype characterizedobject.

Returns
-------
opencascade::handle<StepBasic_CharacterizedObject>
") CharacterizedObject;
		opencascade::handle<StepBasic_CharacterizedObject> CharacterizedObject();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Initialize all fields (own and inherited).

Parameters
----------
aDocument_Id: TCollection_HAsciiString
aDocument_Name: TCollection_HAsciiString
hasDocument_Description: bool
aDocument_Description: TCollection_HAsciiString
aDocument_Kind: StepBasic_DocumentType
aCharacterizedObject_Name: TCollection_HAsciiString
hasCharacterizedObject_Description: bool
aCharacterizedObject_Description: TCollection_HAsciiString

Returns
-------
None
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aDocument_Id, const opencascade::handle<TCollection_HAsciiString> & aDocument_Name, const Standard_Boolean hasDocument_Description, const opencascade::handle<TCollection_HAsciiString> & aDocument_Description, const opencascade::handle<StepBasic_DocumentType> & aDocument_Kind, const opencascade::handle<TCollection_HAsciiString> & aCharacterizedObject_Name, const Standard_Boolean hasCharacterizedObject_Description, const opencascade::handle<TCollection_HAsciiString> & aCharacterizedObject_Description);

		/****************** SetCharacterizedObject ******************/
		%feature("compactdefaultargs") SetCharacterizedObject;
		%feature("autodoc", "Set data for supertype characterizedobject.

Parameters
----------
CharacterizedObject: StepBasic_CharacterizedObject

Returns
-------
None
") SetCharacterizedObject;
		void SetCharacterizedObject(const opencascade::handle<StepBasic_CharacterizedObject> & CharacterizedObject);

};


%make_alias(StepBasic_DocumentFile)

%extend StepBasic_DocumentFile {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************************
* class StepBasic_DocumentProductEquivalence *
*********************************************/
class StepBasic_DocumentProductEquivalence : public StepBasic_DocumentProductAssociation {
	public:
		/****************** StepBasic_DocumentProductEquivalence ******************/
		%feature("compactdefaultargs") StepBasic_DocumentProductEquivalence;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") StepBasic_DocumentProductEquivalence;
		 StepBasic_DocumentProductEquivalence();

};


%make_alias(StepBasic_DocumentProductEquivalence)

%extend StepBasic_DocumentProductEquivalence {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************************************
* class StepBasic_ExternalIdentificationAssignment *
***************************************************/
class StepBasic_ExternalIdentificationAssignment : public StepBasic_IdentificationAssignment {
	public:
		/****************** StepBasic_ExternalIdentificationAssignment ******************/
		%feature("compactdefaultargs") StepBasic_ExternalIdentificationAssignment;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") StepBasic_ExternalIdentificationAssignment;
		 StepBasic_ExternalIdentificationAssignment();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Initialize all fields (own and inherited).

Parameters
----------
aIdentificationAssignment_AssignedId: TCollection_HAsciiString
aIdentificationAssignment_Role: StepBasic_IdentificationRole
aSource: StepBasic_ExternalSource

Returns
-------
None
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aIdentificationAssignment_AssignedId, const opencascade::handle<StepBasic_IdentificationRole> & aIdentificationAssignment_Role, const opencascade::handle<StepBasic_ExternalSource> & aSource);

		/****************** SetSource ******************/
		%feature("compactdefaultargs") SetSource;
		%feature("autodoc", "Set field source.

Parameters
----------
Source: StepBasic_ExternalSource

Returns
-------
None
") SetSource;
		void SetSource(const opencascade::handle<StepBasic_ExternalSource> & Source);

		/****************** Source ******************/
		%feature("compactdefaultargs") Source;
		%feature("autodoc", "Returns field source.

Returns
-------
opencascade::handle<StepBasic_ExternalSource>
") Source;
		opencascade::handle<StepBasic_ExternalSource> Source();

};


%make_alias(StepBasic_ExternalIdentificationAssignment)

%extend StepBasic_ExternalIdentificationAssignment {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************************
* class StepBasic_LengthMeasureWithUnit *
****************************************/
class StepBasic_LengthMeasureWithUnit : public StepBasic_MeasureWithUnit {
	public:
		/****************** StepBasic_LengthMeasureWithUnit ******************/
		%feature("compactdefaultargs") StepBasic_LengthMeasureWithUnit;
		%feature("autodoc", "Returns a lengthmeasurewithunit.

Returns
-------
None
") StepBasic_LengthMeasureWithUnit;
		 StepBasic_LengthMeasureWithUnit();

};


%make_alias(StepBasic_LengthMeasureWithUnit)

%extend StepBasic_LengthMeasureWithUnit {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************
* class StepBasic_LengthUnit *
*****************************/
class StepBasic_LengthUnit : public StepBasic_NamedUnit {
	public:
		/****************** StepBasic_LengthUnit ******************/
		%feature("compactdefaultargs") StepBasic_LengthUnit;
		%feature("autodoc", "Returns a lengthunit.

Returns
-------
None
") StepBasic_LengthUnit;
		 StepBasic_LengthUnit();

};


%make_alias(StepBasic_LengthUnit)

%extend StepBasic_LengthUnit {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************************
* class StepBasic_MassMeasureWithUnit *
**************************************/
class StepBasic_MassMeasureWithUnit : public StepBasic_MeasureWithUnit {
	public:
		/****************** StepBasic_MassMeasureWithUnit ******************/
		%feature("compactdefaultargs") StepBasic_MassMeasureWithUnit;
		%feature("autodoc", "Returns a massmeasurewithunit.

Returns
-------
None
") StepBasic_MassMeasureWithUnit;
		 StepBasic_MassMeasureWithUnit();

};


%make_alias(StepBasic_MassMeasureWithUnit)

%extend StepBasic_MassMeasureWithUnit {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************
* class StepBasic_MassUnit *
***************************/
class StepBasic_MassUnit : public StepBasic_NamedUnit {
	public:
		/****************** StepBasic_MassUnit ******************/
		%feature("compactdefaultargs") StepBasic_MassUnit;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") StepBasic_MassUnit;
		 StepBasic_MassUnit();

};


%make_alias(StepBasic_MassUnit)

%extend StepBasic_MassUnit {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************
* class StepBasic_OrdinalDate *
******************************/
class StepBasic_OrdinalDate : public StepBasic_Date {
	public:
		/****************** StepBasic_OrdinalDate ******************/
		%feature("compactdefaultargs") StepBasic_OrdinalDate;
		%feature("autodoc", "Returns a ordinaldate.

Returns
-------
None
") StepBasic_OrdinalDate;
		 StepBasic_OrdinalDate();

		/****************** DayComponent ******************/
		%feature("compactdefaultargs") DayComponent;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") DayComponent;
		Standard_Integer DayComponent();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Parameters
----------
aYearComponent: int
aDayComponent: int

Returns
-------
None
") Init;
		void Init(const Standard_Integer aYearComponent, const Standard_Integer aDayComponent);

		/****************** SetDayComponent ******************/
		%feature("compactdefaultargs") SetDayComponent;
		%feature("autodoc", "No available documentation.

Parameters
----------
aDayComponent: int

Returns
-------
None
") SetDayComponent;
		void SetDayComponent(const Standard_Integer aDayComponent);

};


%make_alias(StepBasic_OrdinalDate)

%extend StepBasic_OrdinalDate {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************************
* class StepBasic_OrganizationalAddress *
****************************************/
class StepBasic_OrganizationalAddress : public StepBasic_Address {
	public:
		/****************** StepBasic_OrganizationalAddress ******************/
		%feature("compactdefaultargs") StepBasic_OrganizationalAddress;
		%feature("autodoc", "Returns a organizationaladdress.

Returns
-------
None
") StepBasic_OrganizationalAddress;
		 StepBasic_OrganizationalAddress();

		/****************** Description ******************/
		%feature("compactdefaultargs") Description;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") Description;
		opencascade::handle<TCollection_HAsciiString> Description();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Parameters
----------
hasAinternalLocation: bool
aInternalLocation: TCollection_HAsciiString
hasAstreetNumber: bool
aStreetNumber: TCollection_HAsciiString
hasAstreet: bool
aStreet: TCollection_HAsciiString
hasApostalBox: bool
aPostalBox: TCollection_HAsciiString
hasAtown: bool
aTown: TCollection_HAsciiString
hasAregion: bool
aRegion: TCollection_HAsciiString
hasApostalCode: bool
aPostalCode: TCollection_HAsciiString
hasAcountry: bool
aCountry: TCollection_HAsciiString
hasAfacsimileNumber: bool
aFacsimileNumber: TCollection_HAsciiString
hasAtelephoneNumber: bool
aTelephoneNumber: TCollection_HAsciiString
hasAelectronicMailAddress: bool
aElectronicMailAddress: TCollection_HAsciiString
hasAtelexNumber: bool
aTelexNumber: TCollection_HAsciiString
aOrganizations: StepBasic_HArray1OfOrganization
aDescription: TCollection_HAsciiString

Returns
-------
None
") Init;
		void Init(const Standard_Boolean hasAinternalLocation, const opencascade::handle<TCollection_HAsciiString> & aInternalLocation, const Standard_Boolean hasAstreetNumber, const opencascade::handle<TCollection_HAsciiString> & aStreetNumber, const Standard_Boolean hasAstreet, const opencascade::handle<TCollection_HAsciiString> & aStreet, const Standard_Boolean hasApostalBox, const opencascade::handle<TCollection_HAsciiString> & aPostalBox, const Standard_Boolean hasAtown, const opencascade::handle<TCollection_HAsciiString> & aTown, const Standard_Boolean hasAregion, const opencascade::handle<TCollection_HAsciiString> & aRegion, const Standard_Boolean hasApostalCode, const opencascade::handle<TCollection_HAsciiString> & aPostalCode, const Standard_Boolean hasAcountry, const opencascade::handle<TCollection_HAsciiString> & aCountry, const Standard_Boolean hasAfacsimileNumber, const opencascade::handle<TCollection_HAsciiString> & aFacsimileNumber, const Standard_Boolean hasAtelephoneNumber, const opencascade::handle<TCollection_HAsciiString> & aTelephoneNumber, const Standard_Boolean hasAelectronicMailAddress, const opencascade::handle<TCollection_HAsciiString> & aElectronicMailAddress, const Standard_Boolean hasAtelexNumber, const opencascade::handle<TCollection_HAsciiString> & aTelexNumber, const opencascade::handle<StepBasic_HArray1OfOrganization> & aOrganizations, const opencascade::handle<TCollection_HAsciiString> & aDescription);

		/****************** NbOrganizations ******************/
		%feature("compactdefaultargs") NbOrganizations;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbOrganizations;
		Standard_Integer NbOrganizations();

		/****************** Organizations ******************/
		%feature("compactdefaultargs") Organizations;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepBasic_HArray1OfOrganization>
") Organizations;
		opencascade::handle<StepBasic_HArray1OfOrganization> Organizations();

		/****************** OrganizationsValue ******************/
		%feature("compactdefaultargs") OrganizationsValue;
		%feature("autodoc", "No available documentation.

Parameters
----------
num: int

Returns
-------
opencascade::handle<StepBasic_Organization>
") OrganizationsValue;
		opencascade::handle<StepBasic_Organization> OrganizationsValue(const Standard_Integer num);

		/****************** SetDescription ******************/
		%feature("compactdefaultargs") SetDescription;
		%feature("autodoc", "No available documentation.

Parameters
----------
aDescription: TCollection_HAsciiString

Returns
-------
None
") SetDescription;
		void SetDescription(const opencascade::handle<TCollection_HAsciiString> & aDescription);

		/****************** SetOrganizations ******************/
		%feature("compactdefaultargs") SetOrganizations;
		%feature("autodoc", "No available documentation.

Parameters
----------
aOrganizations: StepBasic_HArray1OfOrganization

Returns
-------
None
") SetOrganizations;
		void SetOrganizations(const opencascade::handle<StepBasic_HArray1OfOrganization> & aOrganizations);

};


%make_alias(StepBasic_OrganizationalAddress)

%extend StepBasic_OrganizationalAddress {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************************
* class StepBasic_PersonalAddress *
**********************************/
class StepBasic_PersonalAddress : public StepBasic_Address {
	public:
		/****************** StepBasic_PersonalAddress ******************/
		%feature("compactdefaultargs") StepBasic_PersonalAddress;
		%feature("autodoc", "Returns a personaladdress.

Returns
-------
None
") StepBasic_PersonalAddress;
		 StepBasic_PersonalAddress();

		/****************** Description ******************/
		%feature("compactdefaultargs") Description;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") Description;
		opencascade::handle<TCollection_HAsciiString> Description();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Parameters
----------
hasAinternalLocation: bool
aInternalLocation: TCollection_HAsciiString
hasAstreetNumber: bool
aStreetNumber: TCollection_HAsciiString
hasAstreet: bool
aStreet: TCollection_HAsciiString
hasApostalBox: bool
aPostalBox: TCollection_HAsciiString
hasAtown: bool
aTown: TCollection_HAsciiString
hasAregion: bool
aRegion: TCollection_HAsciiString
hasApostalCode: bool
aPostalCode: TCollection_HAsciiString
hasAcountry: bool
aCountry: TCollection_HAsciiString
hasAfacsimileNumber: bool
aFacsimileNumber: TCollection_HAsciiString
hasAtelephoneNumber: bool
aTelephoneNumber: TCollection_HAsciiString
hasAelectronicMailAddress: bool
aElectronicMailAddress: TCollection_HAsciiString
hasAtelexNumber: bool
aTelexNumber: TCollection_HAsciiString
aPeople: StepBasic_HArray1OfPerson
aDescription: TCollection_HAsciiString

Returns
-------
None
") Init;
		void Init(const Standard_Boolean hasAinternalLocation, const opencascade::handle<TCollection_HAsciiString> & aInternalLocation, const Standard_Boolean hasAstreetNumber, const opencascade::handle<TCollection_HAsciiString> & aStreetNumber, const Standard_Boolean hasAstreet, const opencascade::handle<TCollection_HAsciiString> & aStreet, const Standard_Boolean hasApostalBox, const opencascade::handle<TCollection_HAsciiString> & aPostalBox, const Standard_Boolean hasAtown, const opencascade::handle<TCollection_HAsciiString> & aTown, const Standard_Boolean hasAregion, const opencascade::handle<TCollection_HAsciiString> & aRegion, const Standard_Boolean hasApostalCode, const opencascade::handle<TCollection_HAsciiString> & aPostalCode, const Standard_Boolean hasAcountry, const opencascade::handle<TCollection_HAsciiString> & aCountry, const Standard_Boolean hasAfacsimileNumber, const opencascade::handle<TCollection_HAsciiString> & aFacsimileNumber, const Standard_Boolean hasAtelephoneNumber, const opencascade::handle<TCollection_HAsciiString> & aTelephoneNumber, const Standard_Boolean hasAelectronicMailAddress, const opencascade::handle<TCollection_HAsciiString> & aElectronicMailAddress, const Standard_Boolean hasAtelexNumber, const opencascade::handle<TCollection_HAsciiString> & aTelexNumber, const opencascade::handle<StepBasic_HArray1OfPerson> & aPeople, const opencascade::handle<TCollection_HAsciiString> & aDescription);

		/****************** NbPeople ******************/
		%feature("compactdefaultargs") NbPeople;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbPeople;
		Standard_Integer NbPeople();

		/****************** People ******************/
		%feature("compactdefaultargs") People;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepBasic_HArray1OfPerson>
") People;
		opencascade::handle<StepBasic_HArray1OfPerson> People();

		/****************** PeopleValue ******************/
		%feature("compactdefaultargs") PeopleValue;
		%feature("autodoc", "No available documentation.

Parameters
----------
num: int

Returns
-------
opencascade::handle<StepBasic_Person>
") PeopleValue;
		opencascade::handle<StepBasic_Person> PeopleValue(const Standard_Integer num);

		/****************** SetDescription ******************/
		%feature("compactdefaultargs") SetDescription;
		%feature("autodoc", "No available documentation.

Parameters
----------
aDescription: TCollection_HAsciiString

Returns
-------
None
") SetDescription;
		void SetDescription(const opencascade::handle<TCollection_HAsciiString> & aDescription);

		/****************** SetPeople ******************/
		%feature("compactdefaultargs") SetPeople;
		%feature("autodoc", "No available documentation.

Parameters
----------
aPeople: StepBasic_HArray1OfPerson

Returns
-------
None
") SetPeople;
		void SetPeople(const opencascade::handle<StepBasic_HArray1OfPerson> & aPeople);

};


%make_alias(StepBasic_PersonalAddress)

%extend StepBasic_PersonalAddress {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************************************
* class StepBasic_PhysicallyModeledProductDefinition *
*****************************************************/
class StepBasic_PhysicallyModeledProductDefinition : public StepBasic_ProductDefinition {
	public:
		/****************** StepBasic_PhysicallyModeledProductDefinition ******************/
		%feature("compactdefaultargs") StepBasic_PhysicallyModeledProductDefinition;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") StepBasic_PhysicallyModeledProductDefinition;
		 StepBasic_PhysicallyModeledProductDefinition();

};


%make_alias(StepBasic_PhysicallyModeledProductDefinition)

%extend StepBasic_PhysicallyModeledProductDefinition {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************************
* class StepBasic_PlaneAngleMeasureWithUnit *
********************************************/
class StepBasic_PlaneAngleMeasureWithUnit : public StepBasic_MeasureWithUnit {
	public:
		/****************** StepBasic_PlaneAngleMeasureWithUnit ******************/
		%feature("compactdefaultargs") StepBasic_PlaneAngleMeasureWithUnit;
		%feature("autodoc", "Returns a planeanglemeasurewithunit.

Returns
-------
None
") StepBasic_PlaneAngleMeasureWithUnit;
		 StepBasic_PlaneAngleMeasureWithUnit();

};


%make_alias(StepBasic_PlaneAngleMeasureWithUnit)

%extend StepBasic_PlaneAngleMeasureWithUnit {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************
* class StepBasic_PlaneAngleUnit *
*********************************/
class StepBasic_PlaneAngleUnit : public StepBasic_NamedUnit {
	public:
		/****************** StepBasic_PlaneAngleUnit ******************/
		%feature("compactdefaultargs") StepBasic_PlaneAngleUnit;
		%feature("autodoc", "Returns a planeangleunit.

Returns
-------
None
") StepBasic_PlaneAngleUnit;
		 StepBasic_PlaneAngleUnit();

};


%make_alias(StepBasic_PlaneAngleUnit)

%extend StepBasic_PlaneAngleUnit {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************************
* class StepBasic_ProductConceptContext *
****************************************/
class StepBasic_ProductConceptContext : public StepBasic_ApplicationContextElement {
	public:
		/****************** StepBasic_ProductConceptContext ******************/
		%feature("compactdefaultargs") StepBasic_ProductConceptContext;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") StepBasic_ProductConceptContext;
		 StepBasic_ProductConceptContext();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Initialize all fields (own and inherited).

Parameters
----------
aApplicationContextElement_Name: TCollection_HAsciiString
aApplicationContextElement_FrameOfReference: StepBasic_ApplicationContext
aMarketSegmentType: TCollection_HAsciiString

Returns
-------
None
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aApplicationContextElement_Name, const opencascade::handle<StepBasic_ApplicationContext> & aApplicationContextElement_FrameOfReference, const opencascade::handle<TCollection_HAsciiString> & aMarketSegmentType);

		/****************** MarketSegmentType ******************/
		%feature("compactdefaultargs") MarketSegmentType;
		%feature("autodoc", "Returns field marketsegmenttype.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") MarketSegmentType;
		opencascade::handle<TCollection_HAsciiString> MarketSegmentType();

		/****************** SetMarketSegmentType ******************/
		%feature("compactdefaultargs") SetMarketSegmentType;
		%feature("autodoc", "Set field marketsegmenttype.

Parameters
----------
MarketSegmentType: TCollection_HAsciiString

Returns
-------
None
") SetMarketSegmentType;
		void SetMarketSegmentType(const opencascade::handle<TCollection_HAsciiString> & MarketSegmentType);

};


%make_alias(StepBasic_ProductConceptContext)

%extend StepBasic_ProductConceptContext {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************
* class StepBasic_ProductContext *
*********************************/
class StepBasic_ProductContext : public StepBasic_ApplicationContextElement {
	public:
		/****************** StepBasic_ProductContext ******************/
		%feature("compactdefaultargs") StepBasic_ProductContext;
		%feature("autodoc", "Returns a productcontext.

Returns
-------
None
") StepBasic_ProductContext;
		 StepBasic_ProductContext();

		/****************** DisciplineType ******************/
		%feature("compactdefaultargs") DisciplineType;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") DisciplineType;
		opencascade::handle<TCollection_HAsciiString> DisciplineType();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Parameters
----------
aName: TCollection_HAsciiString
aFrameOfReference: StepBasic_ApplicationContext
aDisciplineType: TCollection_HAsciiString

Returns
-------
None
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aName, const opencascade::handle<StepBasic_ApplicationContext> & aFrameOfReference, const opencascade::handle<TCollection_HAsciiString> & aDisciplineType);

		/****************** SetDisciplineType ******************/
		%feature("compactdefaultargs") SetDisciplineType;
		%feature("autodoc", "No available documentation.

Parameters
----------
aDisciplineType: TCollection_HAsciiString

Returns
-------
None
") SetDisciplineType;
		void SetDisciplineType(const opencascade::handle<TCollection_HAsciiString> & aDisciplineType);

};


%make_alias(StepBasic_ProductContext)

%extend StepBasic_ProductContext {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************************
* class StepBasic_ProductDefinitionContext *
*******************************************/
class StepBasic_ProductDefinitionContext : public StepBasic_ApplicationContextElement {
	public:
		/****************** StepBasic_ProductDefinitionContext ******************/
		%feature("compactdefaultargs") StepBasic_ProductDefinitionContext;
		%feature("autodoc", "Returns a productdefinitioncontext.

Returns
-------
None
") StepBasic_ProductDefinitionContext;
		 StepBasic_ProductDefinitionContext();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Parameters
----------
aName: TCollection_HAsciiString
aFrameOfReference: StepBasic_ApplicationContext
aLifeCycleStage: TCollection_HAsciiString

Returns
-------
None
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aName, const opencascade::handle<StepBasic_ApplicationContext> & aFrameOfReference, const opencascade::handle<TCollection_HAsciiString> & aLifeCycleStage);

		/****************** LifeCycleStage ******************/
		%feature("compactdefaultargs") LifeCycleStage;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") LifeCycleStage;
		opencascade::handle<TCollection_HAsciiString> LifeCycleStage();

		/****************** SetLifeCycleStage ******************/
		%feature("compactdefaultargs") SetLifeCycleStage;
		%feature("autodoc", "No available documentation.

Parameters
----------
aLifeCycleStage: TCollection_HAsciiString

Returns
-------
None
") SetLifeCycleStage;
		void SetLifeCycleStage(const opencascade::handle<TCollection_HAsciiString> & aLifeCycleStage);

};


%make_alias(StepBasic_ProductDefinitionContext)

%extend StepBasic_ProductDefinitionContext {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************************************
* class StepBasic_ProductDefinitionEffectivity *
***********************************************/
class StepBasic_ProductDefinitionEffectivity : public StepBasic_Effectivity {
	public:
		/****************** StepBasic_ProductDefinitionEffectivity ******************/
		%feature("compactdefaultargs") StepBasic_ProductDefinitionEffectivity;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") StepBasic_ProductDefinitionEffectivity;
		 StepBasic_ProductDefinitionEffectivity();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Parameters
----------
aId: TCollection_HAsciiString
aUsage: StepBasic_ProductDefinitionRelationship

Returns
-------
None
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aId, const opencascade::handle<StepBasic_ProductDefinitionRelationship> & aUsage);

		/****************** SetUsage ******************/
		%feature("compactdefaultargs") SetUsage;
		%feature("autodoc", "No available documentation.

Parameters
----------
aUsage: StepBasic_ProductDefinitionRelationship

Returns
-------
None
") SetUsage;
		void SetUsage(const opencascade::handle<StepBasic_ProductDefinitionRelationship> & aUsage);

		/****************** Usage ******************/
		%feature("compactdefaultargs") Usage;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepBasic_ProductDefinitionRelationship>
") Usage;
		opencascade::handle<StepBasic_ProductDefinitionRelationship> Usage();

};


%make_alias(StepBasic_ProductDefinitionEffectivity)

%extend StepBasic_ProductDefinitionEffectivity {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************************************************
* class StepBasic_ProductDefinitionFormationWithSpecifiedSource *
****************************************************************/
class StepBasic_ProductDefinitionFormationWithSpecifiedSource : public StepBasic_ProductDefinitionFormation {
	public:
		/****************** StepBasic_ProductDefinitionFormationWithSpecifiedSource ******************/
		%feature("compactdefaultargs") StepBasic_ProductDefinitionFormationWithSpecifiedSource;
		%feature("autodoc", "Returns a productdefinitionformationwithspecifiedsource.

Returns
-------
None
") StepBasic_ProductDefinitionFormationWithSpecifiedSource;
		 StepBasic_ProductDefinitionFormationWithSpecifiedSource();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Parameters
----------
aId: TCollection_HAsciiString
aDescription: TCollection_HAsciiString
aOfProduct: StepBasic_Product
aMakeOrBuy: StepBasic_Source

Returns
-------
None
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aId, const opencascade::handle<TCollection_HAsciiString> & aDescription, const opencascade::handle<StepBasic_Product> & aOfProduct, const StepBasic_Source aMakeOrBuy);

		/****************** MakeOrBuy ******************/
		%feature("compactdefaultargs") MakeOrBuy;
		%feature("autodoc", "No available documentation.

Returns
-------
StepBasic_Source
") MakeOrBuy;
		StepBasic_Source MakeOrBuy();

		/****************** SetMakeOrBuy ******************/
		%feature("compactdefaultargs") SetMakeOrBuy;
		%feature("autodoc", "No available documentation.

Parameters
----------
aMakeOrBuy: StepBasic_Source

Returns
-------
None
") SetMakeOrBuy;
		void SetMakeOrBuy(const StepBasic_Source aMakeOrBuy);

};


%make_alias(StepBasic_ProductDefinitionFormationWithSpecifiedSource)

%extend StepBasic_ProductDefinitionFormationWithSpecifiedSource {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************************************************
* class StepBasic_ProductDefinitionReferenceWithLocalRepresentation *
********************************************************************/
class StepBasic_ProductDefinitionReferenceWithLocalRepresentation : public StepBasic_ProductDefinition {
	public:
		/****************** StepBasic_ProductDefinitionReferenceWithLocalRepresentation ******************/
		%feature("compactdefaultargs") StepBasic_ProductDefinitionReferenceWithLocalRepresentation;
		%feature("autodoc", "Returns a productdefinitionreferencewithlocalrepresentation.

Returns
-------
None
") StepBasic_ProductDefinitionReferenceWithLocalRepresentation;
		 StepBasic_ProductDefinitionReferenceWithLocalRepresentation();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Parameters
----------
theSource: StepBasic_ExternalSource
theId: TCollection_HAsciiString
theDescription: TCollection_HAsciiString
theFormation: StepBasic_ProductDefinitionFormation
theFrameOfReference: StepBasic_ProductDefinitionContext

Returns
-------
None
") Init;
		void Init(const opencascade::handle<StepBasic_ExternalSource> & theSource, const opencascade::handle<TCollection_HAsciiString> & theId, const opencascade::handle<TCollection_HAsciiString> & theDescription, const opencascade::handle<StepBasic_ProductDefinitionFormation> & theFormation, const opencascade::handle<StepBasic_ProductDefinitionContext> & theFrameOfReference);

		/****************** SetSource ******************/
		%feature("compactdefaultargs") SetSource;
		%feature("autodoc", "Set field source.

Parameters
----------
theSource: StepBasic_ExternalSource

Returns
-------
None
") SetSource;
		void SetSource(const opencascade::handle<StepBasic_ExternalSource> & theSource);

		/****************** Source ******************/
		%feature("compactdefaultargs") Source;
		%feature("autodoc", "Returns field source.

Returns
-------
opencascade::handle<StepBasic_ExternalSource>
") Source;
		opencascade::handle<StepBasic_ExternalSource> Source();

};


%make_alias(StepBasic_ProductDefinitionReferenceWithLocalRepresentation)

%extend StepBasic_ProductDefinitionReferenceWithLocalRepresentation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************************************************
* class StepBasic_ProductDefinitionWithAssociatedDocuments *
***********************************************************/
class StepBasic_ProductDefinitionWithAssociatedDocuments : public StepBasic_ProductDefinition {
	public:
		/****************** StepBasic_ProductDefinitionWithAssociatedDocuments ******************/
		%feature("compactdefaultargs") StepBasic_ProductDefinitionWithAssociatedDocuments;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") StepBasic_ProductDefinitionWithAssociatedDocuments;
		 StepBasic_ProductDefinitionWithAssociatedDocuments();

		/****************** DocIds ******************/
		%feature("compactdefaultargs") DocIds;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepBasic_HArray1OfDocument>
") DocIds;
		opencascade::handle<StepBasic_HArray1OfDocument> DocIds();

		/****************** DocIdsValue ******************/
		%feature("compactdefaultargs") DocIdsValue;
		%feature("autodoc", "No available documentation.

Parameters
----------
num: int

Returns
-------
opencascade::handle<StepBasic_Document>
") DocIdsValue;
		opencascade::handle<StepBasic_Document> DocIdsValue(const Standard_Integer num);

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Parameters
----------
aId: TCollection_HAsciiString
aDescription: TCollection_HAsciiString
aFormation: StepBasic_ProductDefinitionFormation
aFrame: StepBasic_ProductDefinitionContext
aDocIds: StepBasic_HArray1OfDocument

Returns
-------
None
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aId, const opencascade::handle<TCollection_HAsciiString> & aDescription, const opencascade::handle<StepBasic_ProductDefinitionFormation> & aFormation, const opencascade::handle<StepBasic_ProductDefinitionContext> & aFrame, const opencascade::handle<StepBasic_HArray1OfDocument> & aDocIds);

		/****************** NbDocIds ******************/
		%feature("compactdefaultargs") NbDocIds;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbDocIds;
		Standard_Integer NbDocIds();

		/****************** SetDocIds ******************/
		%feature("compactdefaultargs") SetDocIds;
		%feature("autodoc", "No available documentation.

Parameters
----------
DocIds: StepBasic_HArray1OfDocument

Returns
-------
None
") SetDocIds;
		void SetDocIds(const opencascade::handle<StepBasic_HArray1OfDocument> & DocIds);

		/****************** SetDocIdsValue ******************/
		%feature("compactdefaultargs") SetDocIdsValue;
		%feature("autodoc", "No available documentation.

Parameters
----------
num: int
adoc: StepBasic_Document

Returns
-------
None
") SetDocIdsValue;
		void SetDocIdsValue(const Standard_Integer num, const opencascade::handle<StepBasic_Document> & adoc);

};


%make_alias(StepBasic_ProductDefinitionWithAssociatedDocuments)

%extend StepBasic_ProductDefinitionWithAssociatedDocuments {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************************************
* class StepBasic_ProductRelatedProductCategory *
************************************************/
class StepBasic_ProductRelatedProductCategory : public StepBasic_ProductCategory {
	public:
		/****************** StepBasic_ProductRelatedProductCategory ******************/
		%feature("compactdefaultargs") StepBasic_ProductRelatedProductCategory;
		%feature("autodoc", "Returns a productrelatedproductcategory.

Returns
-------
None
") StepBasic_ProductRelatedProductCategory;
		 StepBasic_ProductRelatedProductCategory();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Parameters
----------
aName: TCollection_HAsciiString
hasAdescription: bool
aDescription: TCollection_HAsciiString
aProducts: StepBasic_HArray1OfProduct

Returns
-------
None
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aName, const Standard_Boolean hasAdescription, const opencascade::handle<TCollection_HAsciiString> & aDescription, const opencascade::handle<StepBasic_HArray1OfProduct> & aProducts);

		/****************** NbProducts ******************/
		%feature("compactdefaultargs") NbProducts;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbProducts;
		Standard_Integer NbProducts();

		/****************** Products ******************/
		%feature("compactdefaultargs") Products;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepBasic_HArray1OfProduct>
") Products;
		opencascade::handle<StepBasic_HArray1OfProduct> Products();

		/****************** ProductsValue ******************/
		%feature("compactdefaultargs") ProductsValue;
		%feature("autodoc", "No available documentation.

Parameters
----------
num: int

Returns
-------
opencascade::handle<StepBasic_Product>
") ProductsValue;
		opencascade::handle<StepBasic_Product> ProductsValue(const Standard_Integer num);

		/****************** SetProducts ******************/
		%feature("compactdefaultargs") SetProducts;
		%feature("autodoc", "No available documentation.

Parameters
----------
aProducts: StepBasic_HArray1OfProduct

Returns
-------
None
") SetProducts;
		void SetProducts(const opencascade::handle<StepBasic_HArray1OfProduct> & aProducts);

};


%make_alias(StepBasic_ProductRelatedProductCategory)

%extend StepBasic_ProductRelatedProductCategory {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************************
* class StepBasic_RatioMeasureWithUnit *
***************************************/
class StepBasic_RatioMeasureWithUnit : public StepBasic_MeasureWithUnit {
	public:
		/****************** StepBasic_RatioMeasureWithUnit ******************/
		%feature("compactdefaultargs") StepBasic_RatioMeasureWithUnit;
		%feature("autodoc", "Returns a ratiomeasurewithunit.

Returns
-------
None
") StepBasic_RatioMeasureWithUnit;
		 StepBasic_RatioMeasureWithUnit();

};


%make_alias(StepBasic_RatioMeasureWithUnit)

%extend StepBasic_RatioMeasureWithUnit {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************
* class StepBasic_RatioUnit *
****************************/
class StepBasic_RatioUnit : public StepBasic_NamedUnit {
	public:
		/****************** StepBasic_RatioUnit ******************/
		%feature("compactdefaultargs") StepBasic_RatioUnit;
		%feature("autodoc", "Returns a ratiounit.

Returns
-------
None
") StepBasic_RatioUnit;
		 StepBasic_RatioUnit();

};


%make_alias(StepBasic_RatioUnit)

%extend StepBasic_RatioUnit {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************
* class StepBasic_SiUnit *
*************************/
class StepBasic_SiUnit : public StepBasic_NamedUnit {
	public:
		/****************** StepBasic_SiUnit ******************/
		%feature("compactdefaultargs") StepBasic_SiUnit;
		%feature("autodoc", "Returns a siunit.

Returns
-------
None
") StepBasic_SiUnit;
		 StepBasic_SiUnit();

		/****************** Dimensions ******************/
		%feature("compactdefaultargs") Dimensions;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepBasic_DimensionalExponents>
") Dimensions;
		virtual opencascade::handle<StepBasic_DimensionalExponents> Dimensions();

		/****************** HasPrefix ******************/
		%feature("compactdefaultargs") HasPrefix;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") HasPrefix;
		Standard_Boolean HasPrefix();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Parameters
----------
hasAprefix: bool
aPrefix: StepBasic_SiPrefix
aName: StepBasic_SiUnitName

Returns
-------
None
") Init;
		void Init(const Standard_Boolean hasAprefix, const StepBasic_SiPrefix aPrefix, const StepBasic_SiUnitName aName);

		/****************** Name ******************/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "No available documentation.

Returns
-------
StepBasic_SiUnitName
") Name;
		StepBasic_SiUnitName Name();

		/****************** Prefix ******************/
		%feature("compactdefaultargs") Prefix;
		%feature("autodoc", "No available documentation.

Returns
-------
StepBasic_SiPrefix
") Prefix;
		StepBasic_SiPrefix Prefix();

		/****************** SetDimensions ******************/
		%feature("compactdefaultargs") SetDimensions;
		%feature("autodoc", "No available documentation.

Parameters
----------
aDimensions: StepBasic_DimensionalExponents

Returns
-------
None
") SetDimensions;
		virtual void SetDimensions(const opencascade::handle<StepBasic_DimensionalExponents> & aDimensions);

		/****************** SetName ******************/
		%feature("compactdefaultargs") SetName;
		%feature("autodoc", "No available documentation.

Parameters
----------
aName: StepBasic_SiUnitName

Returns
-------
None
") SetName;
		void SetName(const StepBasic_SiUnitName aName);

		/****************** SetPrefix ******************/
		%feature("compactdefaultargs") SetPrefix;
		%feature("autodoc", "No available documentation.

Parameters
----------
aPrefix: StepBasic_SiPrefix

Returns
-------
None
") SetPrefix;
		void SetPrefix(const StepBasic_SiPrefix aPrefix);

		/****************** UnSetPrefix ******************/
		%feature("compactdefaultargs") UnSetPrefix;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") UnSetPrefix;
		void UnSetPrefix();

};


%make_alias(StepBasic_SiUnit)

%extend StepBasic_SiUnit {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************************
* class StepBasic_SolidAngleMeasureWithUnit *
********************************************/
class StepBasic_SolidAngleMeasureWithUnit : public StepBasic_MeasureWithUnit {
	public:
		/****************** StepBasic_SolidAngleMeasureWithUnit ******************/
		%feature("compactdefaultargs") StepBasic_SolidAngleMeasureWithUnit;
		%feature("autodoc", "Returns a solidanglemeasurewithunit.

Returns
-------
None
") StepBasic_SolidAngleMeasureWithUnit;
		 StepBasic_SolidAngleMeasureWithUnit();

};


%make_alias(StepBasic_SolidAngleMeasureWithUnit)

%extend StepBasic_SolidAngleMeasureWithUnit {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************
* class StepBasic_SolidAngleUnit *
*********************************/
class StepBasic_SolidAngleUnit : public StepBasic_NamedUnit {
	public:
		/****************** StepBasic_SolidAngleUnit ******************/
		%feature("compactdefaultargs") StepBasic_SolidAngleUnit;
		%feature("autodoc", "Returns a solidangleunit.

Returns
-------
None
") StepBasic_SolidAngleUnit;
		 StepBasic_SolidAngleUnit();

};


%make_alias(StepBasic_SolidAngleUnit)

%extend StepBasic_SolidAngleUnit {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************************************
* class StepBasic_ThermodynamicTemperatureUnit *
***********************************************/
class StepBasic_ThermodynamicTemperatureUnit : public StepBasic_NamedUnit {
	public:
		/****************** StepBasic_ThermodynamicTemperatureUnit ******************/
		%feature("compactdefaultargs") StepBasic_ThermodynamicTemperatureUnit;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") StepBasic_ThermodynamicTemperatureUnit;
		 StepBasic_ThermodynamicTemperatureUnit();

};


%make_alias(StepBasic_ThermodynamicTemperatureUnit)

%extend StepBasic_ThermodynamicTemperatureUnit {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************************
* class StepBasic_TimeMeasureWithUnit *
**************************************/
class StepBasic_TimeMeasureWithUnit : public StepBasic_MeasureWithUnit {
	public:
		/****************** StepBasic_TimeMeasureWithUnit ******************/
		%feature("compactdefaultargs") StepBasic_TimeMeasureWithUnit;
		%feature("autodoc", "Returns a timemeasurewithunit.

Returns
-------
None
") StepBasic_TimeMeasureWithUnit;
		 StepBasic_TimeMeasureWithUnit();

};


%make_alias(StepBasic_TimeMeasureWithUnit)

%extend StepBasic_TimeMeasureWithUnit {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************
* class StepBasic_TimeUnit *
***************************/
class StepBasic_TimeUnit : public StepBasic_NamedUnit {
	public:
		/****************** StepBasic_TimeUnit ******************/
		%feature("compactdefaultargs") StepBasic_TimeUnit;
		%feature("autodoc", "Returns a timeunit.

Returns
-------
None
") StepBasic_TimeUnit;
		 StepBasic_TimeUnit();

};


%make_alias(StepBasic_TimeUnit)

%extend StepBasic_TimeUnit {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************************
* class StepBasic_UncertaintyMeasureWithUnit *
*********************************************/
class StepBasic_UncertaintyMeasureWithUnit : public StepBasic_MeasureWithUnit {
	public:
		/****************** StepBasic_UncertaintyMeasureWithUnit ******************/
		%feature("compactdefaultargs") StepBasic_UncertaintyMeasureWithUnit;
		%feature("autodoc", "Returns a uncertaintymeasurewithunit.

Returns
-------
None
") StepBasic_UncertaintyMeasureWithUnit;
		 StepBasic_UncertaintyMeasureWithUnit();

		/****************** Description ******************/
		%feature("compactdefaultargs") Description;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") Description;
		opencascade::handle<TCollection_HAsciiString> Description();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Parameters
----------
aValueComponent: StepBasic_MeasureValueMember
aUnitComponent: StepBasic_Unit
aName: TCollection_HAsciiString
aDescription: TCollection_HAsciiString

Returns
-------
None
") Init;
		void Init(const opencascade::handle<StepBasic_MeasureValueMember> & aValueComponent, const StepBasic_Unit & aUnitComponent, const opencascade::handle<TCollection_HAsciiString> & aName, const opencascade::handle<TCollection_HAsciiString> & aDescription);

		/****************** Name ******************/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") Name;
		opencascade::handle<TCollection_HAsciiString> Name();

		/****************** SetDescription ******************/
		%feature("compactdefaultargs") SetDescription;
		%feature("autodoc", "No available documentation.

Parameters
----------
aDescription: TCollection_HAsciiString

Returns
-------
None
") SetDescription;
		void SetDescription(const opencascade::handle<TCollection_HAsciiString> & aDescription);

		/****************** SetName ******************/
		%feature("compactdefaultargs") SetName;
		%feature("autodoc", "No available documentation.

Parameters
----------
aName: TCollection_HAsciiString

Returns
-------
None
") SetName;
		void SetName(const opencascade::handle<TCollection_HAsciiString> & aName);

};


%make_alias(StepBasic_UncertaintyMeasureWithUnit)

%extend StepBasic_UncertaintyMeasureWithUnit {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************
* class StepBasic_VolumeUnit *
*****************************/
class StepBasic_VolumeUnit : public StepBasic_NamedUnit {
	public:
		/****************** StepBasic_VolumeUnit ******************/
		%feature("compactdefaultargs") StepBasic_VolumeUnit;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") StepBasic_VolumeUnit;
		 StepBasic_VolumeUnit();

};


%make_alias(StepBasic_VolumeUnit)

%extend StepBasic_VolumeUnit {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************************
* class StepBasic_WeekOfYearAndDayDate *
***************************************/
class StepBasic_WeekOfYearAndDayDate : public StepBasic_Date {
	public:
		/****************** StepBasic_WeekOfYearAndDayDate ******************/
		%feature("compactdefaultargs") StepBasic_WeekOfYearAndDayDate;
		%feature("autodoc", "Returns a weekofyearanddaydate.

Returns
-------
None
") StepBasic_WeekOfYearAndDayDate;
		 StepBasic_WeekOfYearAndDayDate();

		/****************** DayComponent ******************/
		%feature("compactdefaultargs") DayComponent;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") DayComponent;
		Standard_Integer DayComponent();

		/****************** HasDayComponent ******************/
		%feature("compactdefaultargs") HasDayComponent;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") HasDayComponent;
		Standard_Boolean HasDayComponent();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Parameters
----------
aYearComponent: int
aWeekComponent: int
hasAdayComponent: bool
aDayComponent: int

Returns
-------
None
") Init;
		void Init(const Standard_Integer aYearComponent, const Standard_Integer aWeekComponent, const Standard_Boolean hasAdayComponent, const Standard_Integer aDayComponent);

		/****************** SetDayComponent ******************/
		%feature("compactdefaultargs") SetDayComponent;
		%feature("autodoc", "No available documentation.

Parameters
----------
aDayComponent: int

Returns
-------
None
") SetDayComponent;
		void SetDayComponent(const Standard_Integer aDayComponent);

		/****************** SetWeekComponent ******************/
		%feature("compactdefaultargs") SetWeekComponent;
		%feature("autodoc", "No available documentation.

Parameters
----------
aWeekComponent: int

Returns
-------
None
") SetWeekComponent;
		void SetWeekComponent(const Standard_Integer aWeekComponent);

		/****************** UnSetDayComponent ******************/
		%feature("compactdefaultargs") UnSetDayComponent;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") UnSetDayComponent;
		void UnSetDayComponent();

		/****************** WeekComponent ******************/
		%feature("compactdefaultargs") WeekComponent;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") WeekComponent;
		Standard_Integer WeekComponent();

};


%make_alias(StepBasic_WeekOfYearAndDayDate)

%extend StepBasic_WeekOfYearAndDayDate {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************************************
* class StepBasic_ConversionBasedUnitAndAreaUnit *
*************************************************/
class StepBasic_ConversionBasedUnitAndAreaUnit : public StepBasic_ConversionBasedUnit {
	public:
		/****************** StepBasic_ConversionBasedUnitAndAreaUnit ******************/
		%feature("compactdefaultargs") StepBasic_ConversionBasedUnitAndAreaUnit;
		%feature("autodoc", "Returns a conversionbasedunitandareaunit.

Returns
-------
None
") StepBasic_ConversionBasedUnitAndAreaUnit;
		 StepBasic_ConversionBasedUnitAndAreaUnit();

		/****************** AreaUnit ******************/
		%feature("compactdefaultargs") AreaUnit;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepBasic_AreaUnit>
") AreaUnit;
		opencascade::handle<StepBasic_AreaUnit> AreaUnit();

		/****************** SetAreaUnit ******************/
		%feature("compactdefaultargs") SetAreaUnit;
		%feature("autodoc", "No available documentation.

Parameters
----------
anAreaUnit: StepBasic_AreaUnit

Returns
-------
None
") SetAreaUnit;
		void SetAreaUnit(const opencascade::handle<StepBasic_AreaUnit> & anAreaUnit);

};


%make_alias(StepBasic_ConversionBasedUnitAndAreaUnit)

%extend StepBasic_ConversionBasedUnitAndAreaUnit {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************************************
* class StepBasic_ConversionBasedUnitAndLengthUnit *
***************************************************/
class StepBasic_ConversionBasedUnitAndLengthUnit : public StepBasic_ConversionBasedUnit {
	public:
		/****************** StepBasic_ConversionBasedUnitAndLengthUnit ******************/
		%feature("compactdefaultargs") StepBasic_ConversionBasedUnitAndLengthUnit;
		%feature("autodoc", "Returns a conversionbasedunitandlengthunit.

Returns
-------
None
") StepBasic_ConversionBasedUnitAndLengthUnit;
		 StepBasic_ConversionBasedUnitAndLengthUnit();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Parameters
----------
aDimensions: StepBasic_DimensionalExponents
aName: TCollection_HAsciiString
aConversionFactor: StepBasic_MeasureWithUnit

Returns
-------
None
") Init;
		void Init(const opencascade::handle<StepBasic_DimensionalExponents> & aDimensions, const opencascade::handle<TCollection_HAsciiString> & aName, const opencascade::handle<StepBasic_MeasureWithUnit> & aConversionFactor);

		/****************** LengthUnit ******************/
		%feature("compactdefaultargs") LengthUnit;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepBasic_LengthUnit>
") LengthUnit;
		opencascade::handle<StepBasic_LengthUnit> LengthUnit();

		/****************** SetLengthUnit ******************/
		%feature("compactdefaultargs") SetLengthUnit;
		%feature("autodoc", "No available documentation.

Parameters
----------
aLengthUnit: StepBasic_LengthUnit

Returns
-------
None
") SetLengthUnit;
		void SetLengthUnit(const opencascade::handle<StepBasic_LengthUnit> & aLengthUnit);

};


%make_alias(StepBasic_ConversionBasedUnitAndLengthUnit)

%extend StepBasic_ConversionBasedUnitAndLengthUnit {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************************************
* class StepBasic_ConversionBasedUnitAndMassUnit *
*************************************************/
class StepBasic_ConversionBasedUnitAndMassUnit : public StepBasic_ConversionBasedUnit {
	public:
		/****************** StepBasic_ConversionBasedUnitAndMassUnit ******************/
		%feature("compactdefaultargs") StepBasic_ConversionBasedUnitAndMassUnit;
		%feature("autodoc", "Returns a conversionbasedunitandlengthunit.

Returns
-------
None
") StepBasic_ConversionBasedUnitAndMassUnit;
		 StepBasic_ConversionBasedUnitAndMassUnit();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Parameters
----------
aDimensions: StepBasic_DimensionalExponents
aName: TCollection_HAsciiString
aConversionFactor: StepBasic_MeasureWithUnit

Returns
-------
None
") Init;
		void Init(const opencascade::handle<StepBasic_DimensionalExponents> & aDimensions, const opencascade::handle<TCollection_HAsciiString> & aName, const opencascade::handle<StepBasic_MeasureWithUnit> & aConversionFactor);

		/****************** MassUnit ******************/
		%feature("compactdefaultargs") MassUnit;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepBasic_MassUnit>
") MassUnit;
		opencascade::handle<StepBasic_MassUnit> MassUnit();

		/****************** SetMassUnit ******************/
		%feature("compactdefaultargs") SetMassUnit;
		%feature("autodoc", "No available documentation.

Parameters
----------
aMassUnit: StepBasic_MassUnit

Returns
-------
None
") SetMassUnit;
		void SetMassUnit(const opencascade::handle<StepBasic_MassUnit> & aMassUnit);

};


%make_alias(StepBasic_ConversionBasedUnitAndMassUnit)

%extend StepBasic_ConversionBasedUnitAndMassUnit {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************************************
* class StepBasic_ConversionBasedUnitAndPlaneAngleUnit *
*******************************************************/
class StepBasic_ConversionBasedUnitAndPlaneAngleUnit : public StepBasic_ConversionBasedUnit {
	public:
		/****************** StepBasic_ConversionBasedUnitAndPlaneAngleUnit ******************/
		%feature("compactdefaultargs") StepBasic_ConversionBasedUnitAndPlaneAngleUnit;
		%feature("autodoc", "Returns a conversionbasedunitandplaneangleunit.

Returns
-------
None
") StepBasic_ConversionBasedUnitAndPlaneAngleUnit;
		 StepBasic_ConversionBasedUnitAndPlaneAngleUnit();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Parameters
----------
aDimensions: StepBasic_DimensionalExponents
aName: TCollection_HAsciiString
aConversionFactor: StepBasic_MeasureWithUnit

Returns
-------
None
") Init;
		void Init(const opencascade::handle<StepBasic_DimensionalExponents> & aDimensions, const opencascade::handle<TCollection_HAsciiString> & aName, const opencascade::handle<StepBasic_MeasureWithUnit> & aConversionFactor);

		/****************** PlaneAngleUnit ******************/
		%feature("compactdefaultargs") PlaneAngleUnit;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepBasic_PlaneAngleUnit>
") PlaneAngleUnit;
		opencascade::handle<StepBasic_PlaneAngleUnit> PlaneAngleUnit();

		/****************** SetPlaneAngleUnit ******************/
		%feature("compactdefaultargs") SetPlaneAngleUnit;
		%feature("autodoc", "No available documentation.

Parameters
----------
aPlaneAngleUnit: StepBasic_PlaneAngleUnit

Returns
-------
None
") SetPlaneAngleUnit;
		void SetPlaneAngleUnit(const opencascade::handle<StepBasic_PlaneAngleUnit> & aPlaneAngleUnit);

};


%make_alias(StepBasic_ConversionBasedUnitAndPlaneAngleUnit)

%extend StepBasic_ConversionBasedUnitAndPlaneAngleUnit {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************************************
* class StepBasic_ConversionBasedUnitAndRatioUnit *
**************************************************/
class StepBasic_ConversionBasedUnitAndRatioUnit : public StepBasic_ConversionBasedUnit {
	public:
		/****************** StepBasic_ConversionBasedUnitAndRatioUnit ******************/
		%feature("compactdefaultargs") StepBasic_ConversionBasedUnitAndRatioUnit;
		%feature("autodoc", "Returns a conversionbasedunitandratiounit.

Returns
-------
None
") StepBasic_ConversionBasedUnitAndRatioUnit;
		 StepBasic_ConversionBasedUnitAndRatioUnit();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Parameters
----------
aDimensions: StepBasic_DimensionalExponents
aName: TCollection_HAsciiString
aConversionFactor: StepBasic_MeasureWithUnit

Returns
-------
None
") Init;
		void Init(const opencascade::handle<StepBasic_DimensionalExponents> & aDimensions, const opencascade::handle<TCollection_HAsciiString> & aName, const opencascade::handle<StepBasic_MeasureWithUnit> & aConversionFactor);

		/****************** RatioUnit ******************/
		%feature("compactdefaultargs") RatioUnit;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepBasic_RatioUnit>
") RatioUnit;
		opencascade::handle<StepBasic_RatioUnit> RatioUnit();

		/****************** SetRatioUnit ******************/
		%feature("compactdefaultargs") SetRatioUnit;
		%feature("autodoc", "No available documentation.

Parameters
----------
aRatioUnit: StepBasic_RatioUnit

Returns
-------
None
") SetRatioUnit;
		void SetRatioUnit(const opencascade::handle<StepBasic_RatioUnit> & aRatioUnit);

};


%make_alias(StepBasic_ConversionBasedUnitAndRatioUnit)

%extend StepBasic_ConversionBasedUnitAndRatioUnit {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************************************
* class StepBasic_ConversionBasedUnitAndSolidAngleUnit *
*******************************************************/
class StepBasic_ConversionBasedUnitAndSolidAngleUnit : public StepBasic_ConversionBasedUnit {
	public:
		/****************** StepBasic_ConversionBasedUnitAndSolidAngleUnit ******************/
		%feature("compactdefaultargs") StepBasic_ConversionBasedUnitAndSolidAngleUnit;
		%feature("autodoc", "Returns a conversionbasedunitandsolidangleunit.

Returns
-------
None
") StepBasic_ConversionBasedUnitAndSolidAngleUnit;
		 StepBasic_ConversionBasedUnitAndSolidAngleUnit();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Parameters
----------
aDimensions: StepBasic_DimensionalExponents
aName: TCollection_HAsciiString
aConversionFactor: StepBasic_MeasureWithUnit

Returns
-------
None
") Init;
		void Init(const opencascade::handle<StepBasic_DimensionalExponents> & aDimensions, const opencascade::handle<TCollection_HAsciiString> & aName, const opencascade::handle<StepBasic_MeasureWithUnit> & aConversionFactor);

		/****************** SetSolidAngleUnit ******************/
		%feature("compactdefaultargs") SetSolidAngleUnit;
		%feature("autodoc", "No available documentation.

Parameters
----------
aSolidAngleUnit: StepBasic_SolidAngleUnit

Returns
-------
None
") SetSolidAngleUnit;
		void SetSolidAngleUnit(const opencascade::handle<StepBasic_SolidAngleUnit> & aSolidAngleUnit);

		/****************** SolidAngleUnit ******************/
		%feature("compactdefaultargs") SolidAngleUnit;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepBasic_SolidAngleUnit>
") SolidAngleUnit;
		opencascade::handle<StepBasic_SolidAngleUnit> SolidAngleUnit();

};


%make_alias(StepBasic_ConversionBasedUnitAndSolidAngleUnit)

%extend StepBasic_ConversionBasedUnitAndSolidAngleUnit {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************************************
* class StepBasic_ConversionBasedUnitAndTimeUnit *
*************************************************/
class StepBasic_ConversionBasedUnitAndTimeUnit : public StepBasic_ConversionBasedUnit {
	public:
		/****************** StepBasic_ConversionBasedUnitAndTimeUnit ******************/
		%feature("compactdefaultargs") StepBasic_ConversionBasedUnitAndTimeUnit;
		%feature("autodoc", "Returns a conversionbasedunitandtimeunit.

Returns
-------
None
") StepBasic_ConversionBasedUnitAndTimeUnit;
		 StepBasic_ConversionBasedUnitAndTimeUnit();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Parameters
----------
aDimensions: StepBasic_DimensionalExponents
aName: TCollection_HAsciiString
aConversionFactor: StepBasic_MeasureWithUnit

Returns
-------
None
") Init;
		void Init(const opencascade::handle<StepBasic_DimensionalExponents> & aDimensions, const opencascade::handle<TCollection_HAsciiString> & aName, const opencascade::handle<StepBasic_MeasureWithUnit> & aConversionFactor);

		/****************** SetTimeUnit ******************/
		%feature("compactdefaultargs") SetTimeUnit;
		%feature("autodoc", "No available documentation.

Parameters
----------
aTimeUnit: StepBasic_TimeUnit

Returns
-------
None
") SetTimeUnit;
		void SetTimeUnit(const opencascade::handle<StepBasic_TimeUnit> & aTimeUnit);

		/****************** TimeUnit ******************/
		%feature("compactdefaultargs") TimeUnit;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepBasic_TimeUnit>
") TimeUnit;
		opencascade::handle<StepBasic_TimeUnit> TimeUnit();

};


%make_alias(StepBasic_ConversionBasedUnitAndTimeUnit)

%extend StepBasic_ConversionBasedUnitAndTimeUnit {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************************************
* class StepBasic_ConversionBasedUnitAndVolumeUnit *
***************************************************/
class StepBasic_ConversionBasedUnitAndVolumeUnit : public StepBasic_ConversionBasedUnit {
	public:
		/****************** StepBasic_ConversionBasedUnitAndVolumeUnit ******************/
		%feature("compactdefaultargs") StepBasic_ConversionBasedUnitAndVolumeUnit;
		%feature("autodoc", "Returns a conversionbasedunitandvolumeunit.

Returns
-------
None
") StepBasic_ConversionBasedUnitAndVolumeUnit;
		 StepBasic_ConversionBasedUnitAndVolumeUnit();

		/****************** SetVolumeUnit ******************/
		%feature("compactdefaultargs") SetVolumeUnit;
		%feature("autodoc", "No available documentation.

Parameters
----------
aVolumeUnit: StepBasic_VolumeUnit

Returns
-------
None
") SetVolumeUnit;
		void SetVolumeUnit(const opencascade::handle<StepBasic_VolumeUnit> & aVolumeUnit);

		/****************** VolumeUnit ******************/
		%feature("compactdefaultargs") VolumeUnit;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepBasic_VolumeUnit>
") VolumeUnit;
		opencascade::handle<StepBasic_VolumeUnit> VolumeUnit();

};


%make_alias(StepBasic_ConversionBasedUnitAndVolumeUnit)

%extend StepBasic_ConversionBasedUnitAndVolumeUnit {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************
* class StepBasic_DesignContext *
********************************/
class StepBasic_DesignContext : public StepBasic_ProductDefinitionContext {
	public:
		/****************** StepBasic_DesignContext ******************/
		%feature("compactdefaultargs") StepBasic_DesignContext;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") StepBasic_DesignContext;
		 StepBasic_DesignContext();

};


%make_alias(StepBasic_DesignContext)

%extend StepBasic_DesignContext {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************************
* class StepBasic_MechanicalContext *
************************************/
class StepBasic_MechanicalContext : public StepBasic_ProductContext {
	public:
		/****************** StepBasic_MechanicalContext ******************/
		%feature("compactdefaultargs") StepBasic_MechanicalContext;
		%feature("autodoc", "Returns a mechanicalcontext.

Returns
-------
None
") StepBasic_MechanicalContext;
		 StepBasic_MechanicalContext();

};


%make_alias(StepBasic_MechanicalContext)

%extend StepBasic_MechanicalContext {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************
* class StepBasic_ProductType *
******************************/
class StepBasic_ProductType : public StepBasic_ProductRelatedProductCategory {
	public:
		/****************** StepBasic_ProductType ******************/
		%feature("compactdefaultargs") StepBasic_ProductType;
		%feature("autodoc", "Returns a producttype.

Returns
-------
None
") StepBasic_ProductType;
		 StepBasic_ProductType();

};


%make_alias(StepBasic_ProductType)

%extend StepBasic_ProductType {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************************
* class StepBasic_SiUnitAndAreaUnit *
************************************/
class StepBasic_SiUnitAndAreaUnit : public StepBasic_SiUnit {
	public:
		/****************** StepBasic_SiUnitAndAreaUnit ******************/
		%feature("compactdefaultargs") StepBasic_SiUnitAndAreaUnit;
		%feature("autodoc", "Returns a siunitandareaunit.

Returns
-------
None
") StepBasic_SiUnitAndAreaUnit;
		 StepBasic_SiUnitAndAreaUnit();

		/****************** AreaUnit ******************/
		%feature("compactdefaultargs") AreaUnit;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepBasic_AreaUnit>
") AreaUnit;
		opencascade::handle<StepBasic_AreaUnit> AreaUnit();

		/****************** SetAreaUnit ******************/
		%feature("compactdefaultargs") SetAreaUnit;
		%feature("autodoc", "No available documentation.

Parameters
----------
anAreaUnit: StepBasic_AreaUnit

Returns
-------
None
") SetAreaUnit;
		void SetAreaUnit(const opencascade::handle<StepBasic_AreaUnit> & anAreaUnit);

};


%make_alias(StepBasic_SiUnitAndAreaUnit)

%extend StepBasic_SiUnitAndAreaUnit {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************************
* class StepBasic_SiUnitAndLengthUnit *
**************************************/
class StepBasic_SiUnitAndLengthUnit : public StepBasic_SiUnit {
	public:
		/****************** StepBasic_SiUnitAndLengthUnit ******************/
		%feature("compactdefaultargs") StepBasic_SiUnitAndLengthUnit;
		%feature("autodoc", "Returns a siunitandlengthunit.

Returns
-------
None
") StepBasic_SiUnitAndLengthUnit;
		 StepBasic_SiUnitAndLengthUnit();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Parameters
----------
hasAprefix: bool
aPrefix: StepBasic_SiPrefix
aName: StepBasic_SiUnitName

Returns
-------
None
") Init;
		void Init(const Standard_Boolean hasAprefix, const StepBasic_SiPrefix aPrefix, const StepBasic_SiUnitName aName);

		/****************** LengthUnit ******************/
		%feature("compactdefaultargs") LengthUnit;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepBasic_LengthUnit>
") LengthUnit;
		opencascade::handle<StepBasic_LengthUnit> LengthUnit();

		/****************** SetLengthUnit ******************/
		%feature("compactdefaultargs") SetLengthUnit;
		%feature("autodoc", "No available documentation.

Parameters
----------
aLengthUnit: StepBasic_LengthUnit

Returns
-------
None
") SetLengthUnit;
		void SetLengthUnit(const opencascade::handle<StepBasic_LengthUnit> & aLengthUnit);

};


%make_alias(StepBasic_SiUnitAndLengthUnit)

%extend StepBasic_SiUnitAndLengthUnit {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************************
* class StepBasic_SiUnitAndMassUnit *
************************************/
class StepBasic_SiUnitAndMassUnit : public StepBasic_SiUnit {
	public:
		/****************** StepBasic_SiUnitAndMassUnit ******************/
		%feature("compactdefaultargs") StepBasic_SiUnitAndMassUnit;
		%feature("autodoc", "Returns a siunitandmassunit.

Returns
-------
None
") StepBasic_SiUnitAndMassUnit;
		 StepBasic_SiUnitAndMassUnit();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Parameters
----------
hasAprefix: bool
aPrefix: StepBasic_SiPrefix
aName: StepBasic_SiUnitName

Returns
-------
None
") Init;
		void Init(const Standard_Boolean hasAprefix, const StepBasic_SiPrefix aPrefix, const StepBasic_SiUnitName aName);

		/****************** MassUnit ******************/
		%feature("compactdefaultargs") MassUnit;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepBasic_MassUnit>
") MassUnit;
		opencascade::handle<StepBasic_MassUnit> MassUnit();

		/****************** SetMassUnit ******************/
		%feature("compactdefaultargs") SetMassUnit;
		%feature("autodoc", "No available documentation.

Parameters
----------
aMassUnit: StepBasic_MassUnit

Returns
-------
None
") SetMassUnit;
		void SetMassUnit(const opencascade::handle<StepBasic_MassUnit> & aMassUnit);

};


%make_alias(StepBasic_SiUnitAndMassUnit)

%extend StepBasic_SiUnitAndMassUnit {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************************
* class StepBasic_SiUnitAndPlaneAngleUnit *
******************************************/
class StepBasic_SiUnitAndPlaneAngleUnit : public StepBasic_SiUnit {
	public:
		/****************** StepBasic_SiUnitAndPlaneAngleUnit ******************/
		%feature("compactdefaultargs") StepBasic_SiUnitAndPlaneAngleUnit;
		%feature("autodoc", "Returns a siunitandplaneangleunit.

Returns
-------
None
") StepBasic_SiUnitAndPlaneAngleUnit;
		 StepBasic_SiUnitAndPlaneAngleUnit();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Parameters
----------
hasAprefix: bool
aPrefix: StepBasic_SiPrefix
aName: StepBasic_SiUnitName

Returns
-------
None
") Init;
		void Init(const Standard_Boolean hasAprefix, const StepBasic_SiPrefix aPrefix, const StepBasic_SiUnitName aName);

		/****************** PlaneAngleUnit ******************/
		%feature("compactdefaultargs") PlaneAngleUnit;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepBasic_PlaneAngleUnit>
") PlaneAngleUnit;
		opencascade::handle<StepBasic_PlaneAngleUnit> PlaneAngleUnit();

		/****************** SetPlaneAngleUnit ******************/
		%feature("compactdefaultargs") SetPlaneAngleUnit;
		%feature("autodoc", "No available documentation.

Parameters
----------
aPlaneAngleUnit: StepBasic_PlaneAngleUnit

Returns
-------
None
") SetPlaneAngleUnit;
		void SetPlaneAngleUnit(const opencascade::handle<StepBasic_PlaneAngleUnit> & aPlaneAngleUnit);

};


%make_alias(StepBasic_SiUnitAndPlaneAngleUnit)

%extend StepBasic_SiUnitAndPlaneAngleUnit {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************************
* class StepBasic_SiUnitAndRatioUnit *
*************************************/
class StepBasic_SiUnitAndRatioUnit : public StepBasic_SiUnit {
	public:
		/****************** StepBasic_SiUnitAndRatioUnit ******************/
		%feature("compactdefaultargs") StepBasic_SiUnitAndRatioUnit;
		%feature("autodoc", "Returns a siunitandratiounit.

Returns
-------
None
") StepBasic_SiUnitAndRatioUnit;
		 StepBasic_SiUnitAndRatioUnit();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Parameters
----------
hasAprefix: bool
aPrefix: StepBasic_SiPrefix
aName: StepBasic_SiUnitName

Returns
-------
None
") Init;
		void Init(const Standard_Boolean hasAprefix, const StepBasic_SiPrefix aPrefix, const StepBasic_SiUnitName aName);

		/****************** RatioUnit ******************/
		%feature("compactdefaultargs") RatioUnit;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepBasic_RatioUnit>
") RatioUnit;
		opencascade::handle<StepBasic_RatioUnit> RatioUnit();

		/****************** SetRatioUnit ******************/
		%feature("compactdefaultargs") SetRatioUnit;
		%feature("autodoc", "No available documentation.

Parameters
----------
aRatioUnit: StepBasic_RatioUnit

Returns
-------
None
") SetRatioUnit;
		void SetRatioUnit(const opencascade::handle<StepBasic_RatioUnit> & aRatioUnit);

};


%make_alias(StepBasic_SiUnitAndRatioUnit)

%extend StepBasic_SiUnitAndRatioUnit {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************************
* class StepBasic_SiUnitAndSolidAngleUnit *
******************************************/
class StepBasic_SiUnitAndSolidAngleUnit : public StepBasic_SiUnit {
	public:
		/****************** StepBasic_SiUnitAndSolidAngleUnit ******************/
		%feature("compactdefaultargs") StepBasic_SiUnitAndSolidAngleUnit;
		%feature("autodoc", "Returns a siunitandsolidangleunit.

Returns
-------
None
") StepBasic_SiUnitAndSolidAngleUnit;
		 StepBasic_SiUnitAndSolidAngleUnit();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Parameters
----------
hasAprefix: bool
aPrefix: StepBasic_SiPrefix
aName: StepBasic_SiUnitName

Returns
-------
None
") Init;
		void Init(const Standard_Boolean hasAprefix, const StepBasic_SiPrefix aPrefix, const StepBasic_SiUnitName aName);

		/****************** SetSolidAngleUnit ******************/
		%feature("compactdefaultargs") SetSolidAngleUnit;
		%feature("autodoc", "No available documentation.

Parameters
----------
aSolidAngleUnit: StepBasic_SolidAngleUnit

Returns
-------
None
") SetSolidAngleUnit;
		void SetSolidAngleUnit(const opencascade::handle<StepBasic_SolidAngleUnit> & aSolidAngleUnit);

		/****************** SolidAngleUnit ******************/
		%feature("compactdefaultargs") SolidAngleUnit;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepBasic_SolidAngleUnit>
") SolidAngleUnit;
		opencascade::handle<StepBasic_SolidAngleUnit> SolidAngleUnit();

};


%make_alias(StepBasic_SiUnitAndSolidAngleUnit)

%extend StepBasic_SiUnitAndSolidAngleUnit {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************************************
* class StepBasic_SiUnitAndThermodynamicTemperatureUnit *
********************************************************/
class StepBasic_SiUnitAndThermodynamicTemperatureUnit : public StepBasic_SiUnit {
	public:
		/****************** StepBasic_SiUnitAndThermodynamicTemperatureUnit ******************/
		%feature("compactdefaultargs") StepBasic_SiUnitAndThermodynamicTemperatureUnit;
		%feature("autodoc", "Returns a siunitandthermodynamictemperatureunit.

Returns
-------
None
") StepBasic_SiUnitAndThermodynamicTemperatureUnit;
		 StepBasic_SiUnitAndThermodynamicTemperatureUnit();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Parameters
----------
hasAprefix: bool
aPrefix: StepBasic_SiPrefix
aName: StepBasic_SiUnitName

Returns
-------
None
") Init;
		void Init(const Standard_Boolean hasAprefix, const StepBasic_SiPrefix aPrefix, const StepBasic_SiUnitName aName);

		/****************** SetThermodynamicTemperatureUnit ******************/
		%feature("compactdefaultargs") SetThermodynamicTemperatureUnit;
		%feature("autodoc", "No available documentation.

Parameters
----------
aThermodynamicTemperatureUnit: StepBasic_ThermodynamicTemperatureUnit

Returns
-------
None
") SetThermodynamicTemperatureUnit;
		void SetThermodynamicTemperatureUnit(const opencascade::handle<StepBasic_ThermodynamicTemperatureUnit> & aThermodynamicTemperatureUnit);

		/****************** ThermodynamicTemperatureUnit ******************/
		%feature("compactdefaultargs") ThermodynamicTemperatureUnit;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepBasic_ThermodynamicTemperatureUnit>
") ThermodynamicTemperatureUnit;
		opencascade::handle<StepBasic_ThermodynamicTemperatureUnit> ThermodynamicTemperatureUnit();

};


%make_alias(StepBasic_SiUnitAndThermodynamicTemperatureUnit)

%extend StepBasic_SiUnitAndThermodynamicTemperatureUnit {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************************
* class StepBasic_SiUnitAndTimeUnit *
************************************/
class StepBasic_SiUnitAndTimeUnit : public StepBasic_SiUnit {
	public:
		/****************** StepBasic_SiUnitAndTimeUnit ******************/
		%feature("compactdefaultargs") StepBasic_SiUnitAndTimeUnit;
		%feature("autodoc", "Returns a siunitandtimeunit.

Returns
-------
None
") StepBasic_SiUnitAndTimeUnit;
		 StepBasic_SiUnitAndTimeUnit();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Parameters
----------
hasAprefix: bool
aPrefix: StepBasic_SiPrefix
aName: StepBasic_SiUnitName

Returns
-------
None
") Init;
		void Init(const Standard_Boolean hasAprefix, const StepBasic_SiPrefix aPrefix, const StepBasic_SiUnitName aName);

		/****************** SetTimeUnit ******************/
		%feature("compactdefaultargs") SetTimeUnit;
		%feature("autodoc", "No available documentation.

Parameters
----------
aTimeUnit: StepBasic_TimeUnit

Returns
-------
None
") SetTimeUnit;
		void SetTimeUnit(const opencascade::handle<StepBasic_TimeUnit> & aTimeUnit);

		/****************** TimeUnit ******************/
		%feature("compactdefaultargs") TimeUnit;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepBasic_TimeUnit>
") TimeUnit;
		opencascade::handle<StepBasic_TimeUnit> TimeUnit();

};


%make_alias(StepBasic_SiUnitAndTimeUnit)

%extend StepBasic_SiUnitAndTimeUnit {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************************
* class StepBasic_SiUnitAndVolumeUnit *
**************************************/
class StepBasic_SiUnitAndVolumeUnit : public StepBasic_SiUnit {
	public:
		/****************** StepBasic_SiUnitAndVolumeUnit ******************/
		%feature("compactdefaultargs") StepBasic_SiUnitAndVolumeUnit;
		%feature("autodoc", "Returns a siunitandvolumeunit.

Returns
-------
None
") StepBasic_SiUnitAndVolumeUnit;
		 StepBasic_SiUnitAndVolumeUnit();

		/****************** SetVolumeUnit ******************/
		%feature("compactdefaultargs") SetVolumeUnit;
		%feature("autodoc", "No available documentation.

Parameters
----------
aVolumeUnit: StepBasic_VolumeUnit

Returns
-------
None
") SetVolumeUnit;
		void SetVolumeUnit(const opencascade::handle<StepBasic_VolumeUnit> & aVolumeUnit);

		/****************** VolumeUnit ******************/
		%feature("compactdefaultargs") VolumeUnit;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepBasic_VolumeUnit>
") VolumeUnit;
		opencascade::handle<StepBasic_VolumeUnit> VolumeUnit();

};


%make_alias(StepBasic_SiUnitAndVolumeUnit)

%extend StepBasic_SiUnitAndVolumeUnit {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/* harray1 classes */
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


/* harray2 classes */
/* hsequence classes */
