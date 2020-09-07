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
from enum import IntEnum
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

class StepBasic_Source(IntEnum):
	StepBasic_sMade = 0
	StepBasic_sBought = 1
	StepBasic_sNotKnown = 2
StepBasic_sMade = StepBasic_Source.StepBasic_sMade
StepBasic_sBought = StepBasic_Source.StepBasic_sBought
StepBasic_sNotKnown = StepBasic_Source.StepBasic_sNotKnown

class StepBasic_AheadOrBehind(IntEnum):
	StepBasic_aobAhead = 0
	StepBasic_aobExact = 1
	StepBasic_aobBehind = 2
StepBasic_aobAhead = StepBasic_AheadOrBehind.StepBasic_aobAhead
StepBasic_aobExact = StepBasic_AheadOrBehind.StepBasic_aobExact
StepBasic_aobBehind = StepBasic_AheadOrBehind.StepBasic_aobBehind

class StepBasic_SiUnitName(IntEnum):
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
StepBasic_sunMetre = StepBasic_SiUnitName.StepBasic_sunMetre
StepBasic_sunGram = StepBasic_SiUnitName.StepBasic_sunGram
StepBasic_sunSecond = StepBasic_SiUnitName.StepBasic_sunSecond
StepBasic_sunAmpere = StepBasic_SiUnitName.StepBasic_sunAmpere
StepBasic_sunKelvin = StepBasic_SiUnitName.StepBasic_sunKelvin
StepBasic_sunMole = StepBasic_SiUnitName.StepBasic_sunMole
StepBasic_sunCandela = StepBasic_SiUnitName.StepBasic_sunCandela
StepBasic_sunRadian = StepBasic_SiUnitName.StepBasic_sunRadian
StepBasic_sunSteradian = StepBasic_SiUnitName.StepBasic_sunSteradian
StepBasic_sunHertz = StepBasic_SiUnitName.StepBasic_sunHertz
StepBasic_sunNewton = StepBasic_SiUnitName.StepBasic_sunNewton
StepBasic_sunPascal = StepBasic_SiUnitName.StepBasic_sunPascal
StepBasic_sunJoule = StepBasic_SiUnitName.StepBasic_sunJoule
StepBasic_sunWatt = StepBasic_SiUnitName.StepBasic_sunWatt
StepBasic_sunCoulomb = StepBasic_SiUnitName.StepBasic_sunCoulomb
StepBasic_sunVolt = StepBasic_SiUnitName.StepBasic_sunVolt
StepBasic_sunFarad = StepBasic_SiUnitName.StepBasic_sunFarad
StepBasic_sunOhm = StepBasic_SiUnitName.StepBasic_sunOhm
StepBasic_sunSiemens = StepBasic_SiUnitName.StepBasic_sunSiemens
StepBasic_sunWeber = StepBasic_SiUnitName.StepBasic_sunWeber
StepBasic_sunTesla = StepBasic_SiUnitName.StepBasic_sunTesla
StepBasic_sunHenry = StepBasic_SiUnitName.StepBasic_sunHenry
StepBasic_sunDegreeCelsius = StepBasic_SiUnitName.StepBasic_sunDegreeCelsius
StepBasic_sunLumen = StepBasic_SiUnitName.StepBasic_sunLumen
StepBasic_sunLux = StepBasic_SiUnitName.StepBasic_sunLux
StepBasic_sunBecquerel = StepBasic_SiUnitName.StepBasic_sunBecquerel
StepBasic_sunGray = StepBasic_SiUnitName.StepBasic_sunGray
StepBasic_sunSievert = StepBasic_SiUnitName.StepBasic_sunSievert

class StepBasic_SiPrefix(IntEnum):
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
StepBasic_spExa = StepBasic_SiPrefix.StepBasic_spExa
StepBasic_spPeta = StepBasic_SiPrefix.StepBasic_spPeta
StepBasic_spTera = StepBasic_SiPrefix.StepBasic_spTera
StepBasic_spGiga = StepBasic_SiPrefix.StepBasic_spGiga
StepBasic_spMega = StepBasic_SiPrefix.StepBasic_spMega
StepBasic_spKilo = StepBasic_SiPrefix.StepBasic_spKilo
StepBasic_spHecto = StepBasic_SiPrefix.StepBasic_spHecto
StepBasic_spDeca = StepBasic_SiPrefix.StepBasic_spDeca
StepBasic_spDeci = StepBasic_SiPrefix.StepBasic_spDeci
StepBasic_spCenti = StepBasic_SiPrefix.StepBasic_spCenti
StepBasic_spMilli = StepBasic_SiPrefix.StepBasic_spMilli
StepBasic_spMicro = StepBasic_SiPrefix.StepBasic_spMicro
StepBasic_spNano = StepBasic_SiPrefix.StepBasic_spNano
StepBasic_spPico = StepBasic_SiPrefix.StepBasic_spPico
StepBasic_spFemto = StepBasic_SiPrefix.StepBasic_spFemto
StepBasic_spAtto = StepBasic_SiPrefix.StepBasic_spAtto
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
		/**** md5 signature: a6fa99038cfaa6a13f76436708f7fab6 ****/
		%feature("compactdefaultargs") StepBasic_Action;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") StepBasic_Action;
		 StepBasic_Action();

		/****************** ChosenMethod ******************/
		/**** md5 signature: 155be94968ae17869801c63609f1decf ****/
		%feature("compactdefaultargs") ChosenMethod;
		%feature("autodoc", "Returns field chosenmethod.

Returns
-------
opencascade::handle<StepBasic_ActionMethod>
") ChosenMethod;
		opencascade::handle<StepBasic_ActionMethod> ChosenMethod();

		/****************** Description ******************/
		/**** md5 signature: 68309bdf9d57a000073490b39f8e7a41 ****/
		%feature("compactdefaultargs") Description;
		%feature("autodoc", "Returns field description.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") Description;
		opencascade::handle<TCollection_HAsciiString> Description();

		/****************** HasDescription ******************/
		/**** md5 signature: 819ef9a3dced474861e1980d901a2978 ****/
		%feature("compactdefaultargs") HasDescription;
		%feature("autodoc", "Returns true if optional field description is defined.

Returns
-------
bool
") HasDescription;
		Standard_Boolean HasDescription();

		/****************** Init ******************/
		/**** md5 signature: 68546e92c23e6139629752e8bf66c3ac ****/
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
		/**** md5 signature: 6bcb97f17b57cae0750fd29eac20499c ****/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "Returns field name.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") Name;
		opencascade::handle<TCollection_HAsciiString> Name();

		/****************** SetChosenMethod ******************/
		/**** md5 signature: 95e705fc4ea11d7bf456f8616af001c8 ****/
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
		/**** md5 signature: 11ff45bab13c9c85c44619d6c4501da8 ****/
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
		/**** md5 signature: 1a85c1f4dd446039f14efe98df7aeb03 ****/
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
		/**** md5 signature: 595e8e3eed1fe37f26659a551189200f ****/
		%feature("compactdefaultargs") StepBasic_ActionAssignment;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") StepBasic_ActionAssignment;
		 StepBasic_ActionAssignment();

		/****************** AssignedAction ******************/
		/**** md5 signature: 72eb1f16cf7fe739f0b11b05c4309b90 ****/
		%feature("compactdefaultargs") AssignedAction;
		%feature("autodoc", "Returns field assignedaction.

Returns
-------
opencascade::handle<StepBasic_Action>
") AssignedAction;
		opencascade::handle<StepBasic_Action> AssignedAction();

		/****************** Init ******************/
		/**** md5 signature: 8a6cde493e19417c3551b25b76345bd4 ****/
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
		/**** md5 signature: f6c15d4c52872e0ac595e8bf46f6252c ****/
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
		/**** md5 signature: 355712ef3afda592cfdf025a224c0210 ****/
		%feature("compactdefaultargs") StepBasic_ActionMethod;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") StepBasic_ActionMethod;
		 StepBasic_ActionMethod();

		/****************** Consequence ******************/
		/**** md5 signature: d72d441bf4f439e9582b1bc6a7254fd1 ****/
		%feature("compactdefaultargs") Consequence;
		%feature("autodoc", "Returns field consequence.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") Consequence;
		opencascade::handle<TCollection_HAsciiString> Consequence();

		/****************** Description ******************/
		/**** md5 signature: 68309bdf9d57a000073490b39f8e7a41 ****/
		%feature("compactdefaultargs") Description;
		%feature("autodoc", "Returns field description.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") Description;
		opencascade::handle<TCollection_HAsciiString> Description();

		/****************** HasDescription ******************/
		/**** md5 signature: 819ef9a3dced474861e1980d901a2978 ****/
		%feature("compactdefaultargs") HasDescription;
		%feature("autodoc", "Returns true if optional field description is defined.

Returns
-------
bool
") HasDescription;
		Standard_Boolean HasDescription();

		/****************** Init ******************/
		/**** md5 signature: 7826d0779e7b9c060c9d197517aa0fb8 ****/
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
		/**** md5 signature: 6bcb97f17b57cae0750fd29eac20499c ****/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "Returns field name.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") Name;
		opencascade::handle<TCollection_HAsciiString> Name();

		/****************** Purpose ******************/
		/**** md5 signature: f96745f44705150c3273c06fb78fc3cb ****/
		%feature("compactdefaultargs") Purpose;
		%feature("autodoc", "Returns field purpose.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") Purpose;
		opencascade::handle<TCollection_HAsciiString> Purpose();

		/****************** SetConsequence ******************/
		/**** md5 signature: 6b60b00980537550bdc592fd3cdb3ecc ****/
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
		/**** md5 signature: 11ff45bab13c9c85c44619d6c4501da8 ****/
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
		/**** md5 signature: 1a85c1f4dd446039f14efe98df7aeb03 ****/
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
		/**** md5 signature: e2e7302d9004f014ab43f84f266372e2 ****/
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
		/**** md5 signature: 4d0e9e705d50f0b078df6a6749c71eb3 ****/
		%feature("compactdefaultargs") StepBasic_ActionRequestAssignment;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") StepBasic_ActionRequestAssignment;
		 StepBasic_ActionRequestAssignment();

		/****************** AssignedActionRequest ******************/
		/**** md5 signature: 7a98df2fcee9e242c557417fc74f3ed5 ****/
		%feature("compactdefaultargs") AssignedActionRequest;
		%feature("autodoc", "Returns field assignedactionrequest.

Returns
-------
opencascade::handle<StepBasic_VersionedActionRequest>
") AssignedActionRequest;
		opencascade::handle<StepBasic_VersionedActionRequest> AssignedActionRequest();

		/****************** Init ******************/
		/**** md5 signature: 2248433b8597eca74031a1ddceb828f5 ****/
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
		/**** md5 signature: 402c2bf11a32953f71fb434542cc68f6 ****/
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
		/**** md5 signature: 940a84963d6508c2002230a7c949728a ****/
		%feature("compactdefaultargs") StepBasic_ActionRequestSolution;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") StepBasic_ActionRequestSolution;
		 StepBasic_ActionRequestSolution();

		/****************** Init ******************/
		/**** md5 signature: 40c37129d012c8ab45d38b82e1998325 ****/
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
		/**** md5 signature: b171ee101a8141c908f3f5f234a0e461 ****/
		%feature("compactdefaultargs") Method;
		%feature("autodoc", "Returns field method.

Returns
-------
opencascade::handle<StepBasic_ActionMethod>
") Method;
		opencascade::handle<StepBasic_ActionMethod> Method();

		/****************** Request ******************/
		/**** md5 signature: 0281fa806ec973483b8b5b4b5491cdd9 ****/
		%feature("compactdefaultargs") Request;
		%feature("autodoc", "Returns field request.

Returns
-------
opencascade::handle<StepBasic_VersionedActionRequest>
") Request;
		opencascade::handle<StepBasic_VersionedActionRequest> Request();

		/****************** SetMethod ******************/
		/**** md5 signature: ac9eff61369b7c9d8674bc4e3b4ed147 ****/
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
		/**** md5 signature: 24103c3dd4032cbc618121e77b6c61fc ****/
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
		/**** md5 signature: 51d7407411aa4447a8d265d903b0b908 ****/
		%feature("compactdefaultargs") StepBasic_Address;
		%feature("autodoc", "Returns a address.

Returns
-------
None
") StepBasic_Address;
		 StepBasic_Address();

		/****************** Country ******************/
		/**** md5 signature: 74f3334686d5221e43c0c5fc2555fadf ****/
		%feature("compactdefaultargs") Country;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") Country;
		opencascade::handle<TCollection_HAsciiString> Country();

		/****************** ElectronicMailAddress ******************/
		/**** md5 signature: e825d73ca4584ed5c3175af2c49e8618 ****/
		%feature("compactdefaultargs") ElectronicMailAddress;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") ElectronicMailAddress;
		opencascade::handle<TCollection_HAsciiString> ElectronicMailAddress();

		/****************** FacsimileNumber ******************/
		/**** md5 signature: 01f08ca5b0a5426df4a86ba3371dbfb3 ****/
		%feature("compactdefaultargs") FacsimileNumber;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") FacsimileNumber;
		opencascade::handle<TCollection_HAsciiString> FacsimileNumber();

		/****************** HasCountry ******************/
		/**** md5 signature: 1ce3e6bb4d08d96d27b0d819a8469d66 ****/
		%feature("compactdefaultargs") HasCountry;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") HasCountry;
		Standard_Boolean HasCountry();

		/****************** HasElectronicMailAddress ******************/
		/**** md5 signature: 81ea220ac941ef11b314f6dfc2d97e18 ****/
		%feature("compactdefaultargs") HasElectronicMailAddress;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") HasElectronicMailAddress;
		Standard_Boolean HasElectronicMailAddress();

		/****************** HasFacsimileNumber ******************/
		/**** md5 signature: 86526f58a0e19c0899c21bf1e300289c ****/
		%feature("compactdefaultargs") HasFacsimileNumber;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") HasFacsimileNumber;
		Standard_Boolean HasFacsimileNumber();

		/****************** HasInternalLocation ******************/
		/**** md5 signature: 4c456397b687eeae69e492d17beca559 ****/
		%feature("compactdefaultargs") HasInternalLocation;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") HasInternalLocation;
		Standard_Boolean HasInternalLocation();

		/****************** HasPostalBox ******************/
		/**** md5 signature: 95484921f02e1b869664c6a5535875a2 ****/
		%feature("compactdefaultargs") HasPostalBox;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") HasPostalBox;
		Standard_Boolean HasPostalBox();

		/****************** HasPostalCode ******************/
		/**** md5 signature: 2b47ef90632417adcacdc1e6ee31bd02 ****/
		%feature("compactdefaultargs") HasPostalCode;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") HasPostalCode;
		Standard_Boolean HasPostalCode();

		/****************** HasRegion ******************/
		/**** md5 signature: bc359b473bb445c68e51b7d204afcc83 ****/
		%feature("compactdefaultargs") HasRegion;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") HasRegion;
		Standard_Boolean HasRegion();

		/****************** HasStreet ******************/
		/**** md5 signature: 86201ab6da114dc71231f2edd1d5f9c1 ****/
		%feature("compactdefaultargs") HasStreet;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") HasStreet;
		Standard_Boolean HasStreet();

		/****************** HasStreetNumber ******************/
		/**** md5 signature: bb86e74296bea122870a329a33a78e89 ****/
		%feature("compactdefaultargs") HasStreetNumber;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") HasStreetNumber;
		Standard_Boolean HasStreetNumber();

		/****************** HasTelephoneNumber ******************/
		/**** md5 signature: 8fd0ee2efbd368a0317d7f779fe85e48 ****/
		%feature("compactdefaultargs") HasTelephoneNumber;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") HasTelephoneNumber;
		Standard_Boolean HasTelephoneNumber();

		/****************** HasTelexNumber ******************/
		/**** md5 signature: a844b4d42afc825f4de6ed3cf130da9f ****/
		%feature("compactdefaultargs") HasTelexNumber;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") HasTelexNumber;
		Standard_Boolean HasTelexNumber();

		/****************** HasTown ******************/
		/**** md5 signature: fec9b80f36baf27abe1b4b42b8232b0e ****/
		%feature("compactdefaultargs") HasTown;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") HasTown;
		Standard_Boolean HasTown();

		/****************** Init ******************/
		/**** md5 signature: d33d8382600d0bbb12af0e0a5e446d64 ****/
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
		/**** md5 signature: c116bb434e431f081d4736d9ccd73691 ****/
		%feature("compactdefaultargs") InternalLocation;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") InternalLocation;
		opencascade::handle<TCollection_HAsciiString> InternalLocation();

		/****************** PostalBox ******************/
		/**** md5 signature: dfb14924a26b4ab2c6742b29e4280615 ****/
		%feature("compactdefaultargs") PostalBox;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") PostalBox;
		opencascade::handle<TCollection_HAsciiString> PostalBox();

		/****************** PostalCode ******************/
		/**** md5 signature: ddbdc094a3805b9f644ddcc07b8276b1 ****/
		%feature("compactdefaultargs") PostalCode;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") PostalCode;
		opencascade::handle<TCollection_HAsciiString> PostalCode();

		/****************** Region ******************/
		/**** md5 signature: 7c2ce0abb5382d7f4da62d3fa7c66475 ****/
		%feature("compactdefaultargs") Region;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") Region;
		opencascade::handle<TCollection_HAsciiString> Region();

		/****************** SetCountry ******************/
		/**** md5 signature: 3bee1974196c276d04fff5458f468474 ****/
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
		/**** md5 signature: 04b1f781c6e3b5ca83c0a9b36cc305f5 ****/
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
		/**** md5 signature: af4f76a5a2d23193ed2d60d2d638f777 ****/
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
		/**** md5 signature: 5c23f4d07d84fe4789c7b9b53e265ca9 ****/
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
		/**** md5 signature: ead98c34473a1ab0d2b87fb5e3f9decf ****/
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
		/**** md5 signature: 41b5adf33440dd412b561e6d26efcd7d ****/
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
		/**** md5 signature: 6d4559dad6ba121a898d4cae062b6b31 ****/
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
		/**** md5 signature: 578e94c352d4c1e0b39847619bd90fd2 ****/
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
		/**** md5 signature: e624fe5d43c72289ccee6dedd82b2dcb ****/
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
		/**** md5 signature: 2e9c221fc629cd18cf76725afa5d8b67 ****/
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
		/**** md5 signature: b27bcbd63ea3e1bd55846d6b0eebcbf2 ****/
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
		/**** md5 signature: 07f3e94e8ee183c80bf7bbb9ff32273b ****/
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
		/**** md5 signature: ada82df0485e23f3178a9074792b5608 ****/
		%feature("compactdefaultargs") Street;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") Street;
		opencascade::handle<TCollection_HAsciiString> Street();

		/****************** StreetNumber ******************/
		/**** md5 signature: 050842ed4a185d49b5b129edf756751e ****/
		%feature("compactdefaultargs") StreetNumber;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") StreetNumber;
		opencascade::handle<TCollection_HAsciiString> StreetNumber();

		/****************** TelephoneNumber ******************/
		/**** md5 signature: e29e78bd63bc21c9fbd407127acb006e ****/
		%feature("compactdefaultargs") TelephoneNumber;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") TelephoneNumber;
		opencascade::handle<TCollection_HAsciiString> TelephoneNumber();

		/****************** TelexNumber ******************/
		/**** md5 signature: f177e3d3834da916021ff6b89757f141 ****/
		%feature("compactdefaultargs") TelexNumber;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") TelexNumber;
		opencascade::handle<TCollection_HAsciiString> TelexNumber();

		/****************** Town ******************/
		/**** md5 signature: b24d3dd05feec07ef2a0deef61a40ddb ****/
		%feature("compactdefaultargs") Town;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") Town;
		opencascade::handle<TCollection_HAsciiString> Town();

		/****************** UnSetCountry ******************/
		/**** md5 signature: 4637004448d2b13991d5c620b6a21b67 ****/
		%feature("compactdefaultargs") UnSetCountry;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") UnSetCountry;
		void UnSetCountry();

		/****************** UnSetElectronicMailAddress ******************/
		/**** md5 signature: 6dd381027ae63981781fe961238d93bc ****/
		%feature("compactdefaultargs") UnSetElectronicMailAddress;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") UnSetElectronicMailAddress;
		void UnSetElectronicMailAddress();

		/****************** UnSetFacsimileNumber ******************/
		/**** md5 signature: a34303fd719648c62183b2b228487ba6 ****/
		%feature("compactdefaultargs") UnSetFacsimileNumber;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") UnSetFacsimileNumber;
		void UnSetFacsimileNumber();

		/****************** UnSetInternalLocation ******************/
		/**** md5 signature: 8c93226f39013884cb45bb1172f25f05 ****/
		%feature("compactdefaultargs") UnSetInternalLocation;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") UnSetInternalLocation;
		void UnSetInternalLocation();

		/****************** UnSetPostalBox ******************/
		/**** md5 signature: 7a686273a96c46ea1d72700bca24588a ****/
		%feature("compactdefaultargs") UnSetPostalBox;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") UnSetPostalBox;
		void UnSetPostalBox();

		/****************** UnSetPostalCode ******************/
		/**** md5 signature: 37d0d075639d414bc789a9557ac83c3f ****/
		%feature("compactdefaultargs") UnSetPostalCode;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") UnSetPostalCode;
		void UnSetPostalCode();

		/****************** UnSetRegion ******************/
		/**** md5 signature: 39c51c1a7c3bf1e3025b1a4f675384a5 ****/
		%feature("compactdefaultargs") UnSetRegion;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") UnSetRegion;
		void UnSetRegion();

		/****************** UnSetStreet ******************/
		/**** md5 signature: 3a02da4a111cb62fb45a9919d63f1f71 ****/
		%feature("compactdefaultargs") UnSetStreet;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") UnSetStreet;
		void UnSetStreet();

		/****************** UnSetStreetNumber ******************/
		/**** md5 signature: c62baa1080603cd892efdce29c6084c9 ****/
		%feature("compactdefaultargs") UnSetStreetNumber;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") UnSetStreetNumber;
		void UnSetStreetNumber();

		/****************** UnSetTelephoneNumber ******************/
		/**** md5 signature: 20cbdcd4302c34a04d35ae293b2dff56 ****/
		%feature("compactdefaultargs") UnSetTelephoneNumber;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") UnSetTelephoneNumber;
		void UnSetTelephoneNumber();

		/****************** UnSetTelexNumber ******************/
		/**** md5 signature: 633cc1749aa94d405d715abf3869a736 ****/
		%feature("compactdefaultargs") UnSetTelexNumber;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") UnSetTelexNumber;
		void UnSetTelexNumber();

		/****************** UnSetTown ******************/
		/**** md5 signature: 449339d8dc4f354e9c6b5c1cfb40eda2 ****/
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
		/**** md5 signature: 8c2011472c55a3f52a4086702c6367f2 ****/
		%feature("compactdefaultargs") StepBasic_ApplicationContext;
		%feature("autodoc", "Returns a applicationcontext.

Returns
-------
None
") StepBasic_ApplicationContext;
		 StepBasic_ApplicationContext();

		/****************** Application ******************/
		/**** md5 signature: 308c1e5447c27ba915150f66327bf973 ****/
		%feature("compactdefaultargs") Application;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") Application;
		opencascade::handle<TCollection_HAsciiString> Application();

		/****************** Init ******************/
		/**** md5 signature: 16ac06cde8b7abcf10177cadc7638b7d ****/
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
		/**** md5 signature: 792ce361303a99f0b0d57a69d70a98c1 ****/
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
		/**** md5 signature: 61a489fa039f7bfa30be2893118cf999 ****/
		%feature("compactdefaultargs") StepBasic_ApplicationContextElement;
		%feature("autodoc", "Returns a applicationcontextelement.

Returns
-------
None
") StepBasic_ApplicationContextElement;
		 StepBasic_ApplicationContextElement();

		/****************** FrameOfReference ******************/
		/**** md5 signature: 9bbc03f05b4049fcb9a574d6b549107c ****/
		%feature("compactdefaultargs") FrameOfReference;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepBasic_ApplicationContext>
") FrameOfReference;
		opencascade::handle<StepBasic_ApplicationContext> FrameOfReference();

		/****************** Init ******************/
		/**** md5 signature: f00f181d444415175c1d8e60f9088cd8 ****/
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
		/**** md5 signature: 6bcb97f17b57cae0750fd29eac20499c ****/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") Name;
		opencascade::handle<TCollection_HAsciiString> Name();

		/****************** SetFrameOfReference ******************/
		/**** md5 signature: 24b7084f614d75d67a65e21887ef9abe ****/
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
		/**** md5 signature: 1e0b00d9eb163c8a0cdbb986e2ee24f6 ****/
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
		/**** md5 signature: 4dad7b491dcb378bdcf865cce8b6184c ****/
		%feature("compactdefaultargs") StepBasic_ApplicationProtocolDefinition;
		%feature("autodoc", "Returns a applicationprotocoldefinition.

Returns
-------
None
") StepBasic_ApplicationProtocolDefinition;
		 StepBasic_ApplicationProtocolDefinition();

		/****************** Application ******************/
		/**** md5 signature: 5e27994a34ed978581e895a467e7d1c2 ****/
		%feature("compactdefaultargs") Application;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepBasic_ApplicationContext>
") Application;
		opencascade::handle<StepBasic_ApplicationContext> Application();

		/****************** ApplicationInterpretedModelSchemaName ******************/
		/**** md5 signature: cb4a4c367ace373f437cf1c034c7f673 ****/
		%feature("compactdefaultargs") ApplicationInterpretedModelSchemaName;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") ApplicationInterpretedModelSchemaName;
		opencascade::handle<TCollection_HAsciiString> ApplicationInterpretedModelSchemaName();

		/****************** ApplicationProtocolYear ******************/
		/**** md5 signature: 5aa340807edd3920f16ae0d5bb27012c ****/
		%feature("compactdefaultargs") ApplicationProtocolYear;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") ApplicationProtocolYear;
		Standard_Integer ApplicationProtocolYear();

		/****************** Init ******************/
		/**** md5 signature: 89821f113658df0d9df911aec896a97e ****/
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
		/**** md5 signature: 5002ad95f5c2bb18905ea09de9225f67 ****/
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
		/**** md5 signature: 68114c9b1d7001f0a24df1b00ae6c5dc ****/
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
		/**** md5 signature: 35614b2e37b5d58c89914240af851aa9 ****/
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
		/**** md5 signature: 107f0744649d6d334a46d8ec5fd375ca ****/
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
		/**** md5 signature: a1a0a98ba849d35c84ed0eac04425f86 ****/
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
		/**** md5 signature: 338e251c98603c2fde32330241351f9e ****/
		%feature("compactdefaultargs") StepBasic_Approval;
		%feature("autodoc", "Returns a approval.

Returns
-------
None
") StepBasic_Approval;
		 StepBasic_Approval();

		/****************** Init ******************/
		/**** md5 signature: b9a03e8a50a0c41d74d28e301f315c6b ****/
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
		/**** md5 signature: df1b7fc124002555ebc008e37bdc0b3c ****/
		%feature("compactdefaultargs") Level;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") Level;
		opencascade::handle<TCollection_HAsciiString> Level();

		/****************** SetLevel ******************/
		/**** md5 signature: 49a4d8e957ff0b661b46bc4eaabf3534 ****/
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
		/**** md5 signature: f613940b2d9062629d9bbd81cd3ff795 ****/
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
		/**** md5 signature: a46775f93ee879534a32875ef9276ff2 ****/
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
		/**** md5 signature: 4d5ba76d9576cfeefff3d3da81f0177e ****/
		%feature("compactdefaultargs") AssignedApproval;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepBasic_Approval>
") AssignedApproval;
		opencascade::handle<StepBasic_Approval> AssignedApproval();

		/****************** Init ******************/
		/**** md5 signature: 7284ce83a20419d08cfcd0a39acfbe2e ****/
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
		/**** md5 signature: d1cff5fd070a34ae36fc5171cfe22fc0 ****/
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
		/**** md5 signature: 2b263300d6b80dca363758b0c36b3ede ****/
		%feature("compactdefaultargs") StepBasic_ApprovalDateTime;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") StepBasic_ApprovalDateTime;
		 StepBasic_ApprovalDateTime();

		/****************** DateTime ******************/
		/**** md5 signature: cb7a4fd82c6c6bfcddcf9eb7aafbef7c ****/
		%feature("compactdefaultargs") DateTime;
		%feature("autodoc", "No available documentation.

Returns
-------
StepBasic_DateTimeSelect
") DateTime;
		StepBasic_DateTimeSelect DateTime();

		/****************** DatedApproval ******************/
		/**** md5 signature: 74538e4875a9eb4c90281437db49d8b5 ****/
		%feature("compactdefaultargs") DatedApproval;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepBasic_Approval>
") DatedApproval;
		opencascade::handle<StepBasic_Approval> DatedApproval();

		/****************** Init ******************/
		/**** md5 signature: 13bc5025bb7f7f6eafebad5281f4f4fa ****/
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
		/**** md5 signature: 9a2e7ab3d1bfe0e384130695d0d474c3 ****/
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
		/**** md5 signature: 6bc036a89f04701efde7bc6e1cacb8ef ****/
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
		/**** md5 signature: 311039f441c0ba765d5dc412889b07a3 ****/
		%feature("compactdefaultargs") StepBasic_ApprovalPersonOrganization;
		%feature("autodoc", "Returns a approvalpersonorganization.

Returns
-------
None
") StepBasic_ApprovalPersonOrganization;
		 StepBasic_ApprovalPersonOrganization();

		/****************** AuthorizedApproval ******************/
		/**** md5 signature: 10d71240c4a602b68872ef4c528ba7b9 ****/
		%feature("compactdefaultargs") AuthorizedApproval;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepBasic_Approval>
") AuthorizedApproval;
		opencascade::handle<StepBasic_Approval> AuthorizedApproval();

		/****************** Init ******************/
		/**** md5 signature: dde89f718bb57e4e2ffb9e18a607120a ****/
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
		/**** md5 signature: 566d78faafafc12cbff4621526e74687 ****/
		%feature("compactdefaultargs") PersonOrganization;
		%feature("autodoc", "No available documentation.

Returns
-------
StepBasic_PersonOrganizationSelect
") PersonOrganization;
		StepBasic_PersonOrganizationSelect PersonOrganization();

		/****************** Role ******************/
		/**** md5 signature: 0333623beeef48df191fb18c0e4044f7 ****/
		%feature("compactdefaultargs") Role;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepBasic_ApprovalRole>
") Role;
		opencascade::handle<StepBasic_ApprovalRole> Role();

		/****************** SetAuthorizedApproval ******************/
		/**** md5 signature: ba113b8339ff294ba5f6d293830bde5a ****/
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
		/**** md5 signature: e1eea593a0a1be051e90dea770c18af5 ****/
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
		/**** md5 signature: 262e7135290c8daa4123ad515190da82 ****/
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
		/**** md5 signature: ab10b8a52935b341f201a8b6ff6ec1ff ****/
		%feature("compactdefaultargs") StepBasic_ApprovalRelationship;
		%feature("autodoc", "Returns a approvalrelationship.

Returns
-------
None
") StepBasic_ApprovalRelationship;
		 StepBasic_ApprovalRelationship();

		/****************** Description ******************/
		/**** md5 signature: 68309bdf9d57a000073490b39f8e7a41 ****/
		%feature("compactdefaultargs") Description;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") Description;
		opencascade::handle<TCollection_HAsciiString> Description();

		/****************** Init ******************/
		/**** md5 signature: e9ed07306b0401392332767fa9c5d584 ****/
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
		/**** md5 signature: 6bcb97f17b57cae0750fd29eac20499c ****/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") Name;
		opencascade::handle<TCollection_HAsciiString> Name();

		/****************** RelatedApproval ******************/
		/**** md5 signature: 65b8fb71e85ca73766df6c3d9186b919 ****/
		%feature("compactdefaultargs") RelatedApproval;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepBasic_Approval>
") RelatedApproval;
		opencascade::handle<StepBasic_Approval> RelatedApproval();

		/****************** RelatingApproval ******************/
		/**** md5 signature: 12b416ad101834081000708dbf4622f3 ****/
		%feature("compactdefaultargs") RelatingApproval;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepBasic_Approval>
") RelatingApproval;
		opencascade::handle<StepBasic_Approval> RelatingApproval();

		/****************** SetDescription ******************/
		/**** md5 signature: adddd13a906718df58a2eee683a382cf ****/
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
		/**** md5 signature: 1e0b00d9eb163c8a0cdbb986e2ee24f6 ****/
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
		/**** md5 signature: 0579da27be47e5283f35195058ae46ea ****/
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
		/**** md5 signature: 5a861557f09298a1c58d43c9bed5f4f0 ****/
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
		/**** md5 signature: 6cf0a3bfe00173c2878df431b782942f ****/
		%feature("compactdefaultargs") StepBasic_ApprovalRole;
		%feature("autodoc", "Returns a approvalrole.

Returns
-------
None
") StepBasic_ApprovalRole;
		 StepBasic_ApprovalRole();

		/****************** Init ******************/
		/**** md5 signature: 60b74fd80a966219dbfa0ba605d08186 ****/
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
		/**** md5 signature: 0ccc8f92b3a48f32feb6e452dff13748 ****/
		%feature("compactdefaultargs") Role;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") Role;
		opencascade::handle<TCollection_HAsciiString> Role();

		/****************** SetRole ******************/
		/**** md5 signature: ad28e5bfe58174606ce6905a40c064cc ****/
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
		/**** md5 signature: f93981b8b09b7d8720a3f53f603b731e ****/
		%feature("compactdefaultargs") StepBasic_ApprovalStatus;
		%feature("autodoc", "Returns a approvalstatus.

Returns
-------
None
") StepBasic_ApprovalStatus;
		 StepBasic_ApprovalStatus();

		/****************** Init ******************/
		/**** md5 signature: e10f4ffe4365262d2d9a5484d96325b8 ****/
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
		/**** md5 signature: 6bcb97f17b57cae0750fd29eac20499c ****/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") Name;
		opencascade::handle<TCollection_HAsciiString> Name();

		/****************** SetName ******************/
		/**** md5 signature: 1e0b00d9eb163c8a0cdbb986e2ee24f6 ****/
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
		/**** md5 signature: 256ff040a94a97cbc4ba0851c0ac034f ****/
		%feature("compactdefaultargs") StepBasic_Certification;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") StepBasic_Certification;
		 StepBasic_Certification();

		/****************** Init ******************/
		/**** md5 signature: 3a4abb16fc5d13b87c5a7d62bef7a548 ****/
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
		/**** md5 signature: 89e4cf9e9adf97026cb6e71a2269c995 ****/
		%feature("compactdefaultargs") Kind;
		%feature("autodoc", "Returns field kind.

Returns
-------
opencascade::handle<StepBasic_CertificationType>
") Kind;
		opencascade::handle<StepBasic_CertificationType> Kind();

		/****************** Name ******************/
		/**** md5 signature: 6bcb97f17b57cae0750fd29eac20499c ****/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "Returns field name.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") Name;
		opencascade::handle<TCollection_HAsciiString> Name();

		/****************** Purpose ******************/
		/**** md5 signature: f96745f44705150c3273c06fb78fc3cb ****/
		%feature("compactdefaultargs") Purpose;
		%feature("autodoc", "Returns field purpose.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") Purpose;
		opencascade::handle<TCollection_HAsciiString> Purpose();

		/****************** SetKind ******************/
		/**** md5 signature: 6fa88782eeab3b59dea7606b8f46132c ****/
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
		/**** md5 signature: 1a85c1f4dd446039f14efe98df7aeb03 ****/
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
		/**** md5 signature: e2e7302d9004f014ab43f84f266372e2 ****/
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
		/**** md5 signature: d02fab2841dc9f7a350b9cc7043ce02a ****/
		%feature("compactdefaultargs") StepBasic_CertificationAssignment;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") StepBasic_CertificationAssignment;
		 StepBasic_CertificationAssignment();

		/****************** AssignedCertification ******************/
		/**** md5 signature: 9da655bef7b5ff0ce2d0d2f948c84720 ****/
		%feature("compactdefaultargs") AssignedCertification;
		%feature("autodoc", "Returns field assignedcertification.

Returns
-------
opencascade::handle<StepBasic_Certification>
") AssignedCertification;
		opencascade::handle<StepBasic_Certification> AssignedCertification();

		/****************** Init ******************/
		/**** md5 signature: f89d801a12982dd21674f022694b7180 ****/
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
		/**** md5 signature: 40ada9a253c61bb2b154a06a8f7e1e8d ****/
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
		/**** md5 signature: dd6ab247b4abdc32b962f6763d2c1770 ****/
		%feature("compactdefaultargs") StepBasic_CertificationType;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") StepBasic_CertificationType;
		 StepBasic_CertificationType();

		/****************** Description ******************/
		/**** md5 signature: 68309bdf9d57a000073490b39f8e7a41 ****/
		%feature("compactdefaultargs") Description;
		%feature("autodoc", "Returns field description.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") Description;
		opencascade::handle<TCollection_HAsciiString> Description();

		/****************** Init ******************/
		/**** md5 signature: be36038110c32f83ea372f13d3703c13 ****/
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
		/**** md5 signature: 11ff45bab13c9c85c44619d6c4501da8 ****/
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
		/**** md5 signature: 15e0bac8d90dcca6ea304bff3ec9ec3c ****/
		%feature("compactdefaultargs") StepBasic_CharacterizedObject;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") StepBasic_CharacterizedObject;
		 StepBasic_CharacterizedObject();

		/****************** Description ******************/
		/**** md5 signature: 68309bdf9d57a000073490b39f8e7a41 ****/
		%feature("compactdefaultargs") Description;
		%feature("autodoc", "Returns field description.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") Description;
		opencascade::handle<TCollection_HAsciiString> Description();

		/****************** HasDescription ******************/
		/**** md5 signature: 819ef9a3dced474861e1980d901a2978 ****/
		%feature("compactdefaultargs") HasDescription;
		%feature("autodoc", "Returns true if optional field description is defined.

Returns
-------
bool
") HasDescription;
		Standard_Boolean HasDescription();

		/****************** Init ******************/
		/**** md5 signature: f1e00464b915b5c43dbfec20d469b99a ****/
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
		/**** md5 signature: 6bcb97f17b57cae0750fd29eac20499c ****/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "Returns field name.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") Name;
		opencascade::handle<TCollection_HAsciiString> Name();

		/****************** SetDescription ******************/
		/**** md5 signature: 11ff45bab13c9c85c44619d6c4501da8 ****/
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
		/**** md5 signature: 1a85c1f4dd446039f14efe98df7aeb03 ****/
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
		/**** md5 signature: 8adc4315b27fed9e9c1c31eea7c39858 ****/
		%feature("compactdefaultargs") StepBasic_Contract;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") StepBasic_Contract;
		 StepBasic_Contract();

		/****************** Init ******************/
		/**** md5 signature: 49cb3c5b27284e6c9b50c78a4b394207 ****/
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
		/**** md5 signature: 07196d8be1e0ee5573a0aa2cbb7ffb9b ****/
		%feature("compactdefaultargs") Kind;
		%feature("autodoc", "Returns field kind.

Returns
-------
opencascade::handle<StepBasic_ContractType>
") Kind;
		opencascade::handle<StepBasic_ContractType> Kind();

		/****************** Name ******************/
		/**** md5 signature: 6bcb97f17b57cae0750fd29eac20499c ****/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "Returns field name.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") Name;
		opencascade::handle<TCollection_HAsciiString> Name();

		/****************** Purpose ******************/
		/**** md5 signature: f96745f44705150c3273c06fb78fc3cb ****/
		%feature("compactdefaultargs") Purpose;
		%feature("autodoc", "Returns field purpose.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") Purpose;
		opencascade::handle<TCollection_HAsciiString> Purpose();

		/****************** SetKind ******************/
		/**** md5 signature: 8b4fd596f48ea232415b56e5d623934a ****/
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
		/**** md5 signature: 1a85c1f4dd446039f14efe98df7aeb03 ****/
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
		/**** md5 signature: e2e7302d9004f014ab43f84f266372e2 ****/
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
		/**** md5 signature: 68c771ced0c9093ea35470b44cd534a4 ****/
		%feature("compactdefaultargs") StepBasic_ContractAssignment;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") StepBasic_ContractAssignment;
		 StepBasic_ContractAssignment();

		/****************** AssignedContract ******************/
		/**** md5 signature: e3d05f6d7da7b92b04aebb3e3e037a61 ****/
		%feature("compactdefaultargs") AssignedContract;
		%feature("autodoc", "Returns field assignedcontract.

Returns
-------
opencascade::handle<StepBasic_Contract>
") AssignedContract;
		opencascade::handle<StepBasic_Contract> AssignedContract();

		/****************** Init ******************/
		/**** md5 signature: 5bd671f766387d4a424059b9e184068f ****/
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
		/**** md5 signature: ca4ee60b5b5b700b91efb142dc59b69f ****/
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
		/**** md5 signature: a8162f37f2922f84aebee777a9cc0697 ****/
		%feature("compactdefaultargs") StepBasic_ContractType;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") StepBasic_ContractType;
		 StepBasic_ContractType();

		/****************** Description ******************/
		/**** md5 signature: 68309bdf9d57a000073490b39f8e7a41 ****/
		%feature("compactdefaultargs") Description;
		%feature("autodoc", "Returns field description.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") Description;
		opencascade::handle<TCollection_HAsciiString> Description();

		/****************** Init ******************/
		/**** md5 signature: be36038110c32f83ea372f13d3703c13 ****/
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
		/**** md5 signature: 11ff45bab13c9c85c44619d6c4501da8 ****/
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
		/**** md5 signature: 395510ab669236fa311e220fde7ec4d8 ****/
		%feature("compactdefaultargs") StepBasic_CoordinatedUniversalTimeOffset;
		%feature("autodoc", "Returns a coordinateduniversaltimeoffset.

Returns
-------
None
") StepBasic_CoordinatedUniversalTimeOffset;
		 StepBasic_CoordinatedUniversalTimeOffset();

		/****************** HasMinuteOffset ******************/
		/**** md5 signature: af3122b9f8906b004c5daa252eea1422 ****/
		%feature("compactdefaultargs") HasMinuteOffset;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") HasMinuteOffset;
		Standard_Boolean HasMinuteOffset();

		/****************** HourOffset ******************/
		/**** md5 signature: 4c0dd37eb1ce532b818d36eb9dae7b81 ****/
		%feature("compactdefaultargs") HourOffset;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") HourOffset;
		Standard_Integer HourOffset();

		/****************** Init ******************/
		/**** md5 signature: 6b061cfd44045f0c8993f60df4c4b7f5 ****/
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
		/**** md5 signature: 30e1c95a127a1d0724954e859fbe2a43 ****/
		%feature("compactdefaultargs") MinuteOffset;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") MinuteOffset;
		Standard_Integer MinuteOffset();

		/****************** Sense ******************/
		/**** md5 signature: ad939b311acf5e83551d25181ed31d53 ****/
		%feature("compactdefaultargs") Sense;
		%feature("autodoc", "No available documentation.

Returns
-------
StepBasic_AheadOrBehind
") Sense;
		StepBasic_AheadOrBehind Sense();

		/****************** SetHourOffset ******************/
		/**** md5 signature: 0441a5b80d27db5caa172436733a436c ****/
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
		/**** md5 signature: 4c70cd859d0d800333fddf3708b34dde ****/
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
		/**** md5 signature: 45ba15dfd6ec7af96446c8dba03b8a25 ****/
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
		/**** md5 signature: 2a58e1a76d964dbf1bc0df5ddfed6e56 ****/
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
		/**** md5 signature: ecc9da05e024640a0770d7809933a8d0 ****/
		%feature("compactdefaultargs") StepBasic_Date;
		%feature("autodoc", "Returns a date.

Returns
-------
None
") StepBasic_Date;
		 StepBasic_Date();

		/****************** Init ******************/
		/**** md5 signature: ddbee21a52389de649c5017635aa5c9e ****/
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
		/**** md5 signature: 4959ea70854b0a273072b256155cbbde ****/
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
		/**** md5 signature: f48f5c06e36f7cd7e511889665e2e6aa ****/
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
		/**** md5 signature: 9cd582dbb46cbbe2114c91c543732014 ****/
		%feature("compactdefaultargs") StepBasic_DateAndTime;
		%feature("autodoc", "Returns a dateandtime.

Returns
-------
None
") StepBasic_DateAndTime;
		 StepBasic_DateAndTime();

		/****************** DateComponent ******************/
		/**** md5 signature: 489cfdb6f69d3d3a0c9ed0ea5d354235 ****/
		%feature("compactdefaultargs") DateComponent;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepBasic_Date>
") DateComponent;
		opencascade::handle<StepBasic_Date> DateComponent();

		/****************** Init ******************/
		/**** md5 signature: 17d5c51f80d0b96dbceb0dddd41a6612 ****/
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
		/**** md5 signature: 794aebfdcd573da425a925ec3d9857a4 ****/
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
		/**** md5 signature: ebaaac5ce5f28bdfc11d472d1cff9833 ****/
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
		/**** md5 signature: 03e89852edaa0e3dc86a7fc466be85bb ****/
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
		/**** md5 signature: d1b3cf813bbe0bff6bf61aa430f9d027 ****/
		%feature("compactdefaultargs") AssignedDateAndTime;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepBasic_DateAndTime>
") AssignedDateAndTime;
		opencascade::handle<StepBasic_DateAndTime> AssignedDateAndTime();

		/****************** Init ******************/
		/**** md5 signature: 47c4f936da2d70e0f3417adf86d63462 ****/
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
		/**** md5 signature: 92407bceb2cd675d2322f8260a9dfd28 ****/
		%feature("compactdefaultargs") Role;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepBasic_DateTimeRole>
") Role;
		opencascade::handle<StepBasic_DateTimeRole> Role();

		/****************** SetAssignedDateAndTime ******************/
		/**** md5 signature: 7b785578a6c5efa6004359bcf745425d ****/
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
		/**** md5 signature: e3853c13a8ba0a5e973059d4d50e6924 ****/
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
		/**** md5 signature: e22aa3d23eb544dd0c23a68148fe673a ****/
		%feature("compactdefaultargs") AssignedDate;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepBasic_Date>
") AssignedDate;
		opencascade::handle<StepBasic_Date> AssignedDate();

		/****************** Init ******************/
		/**** md5 signature: 8c38094c9d3624f9f159a3ceb779e28c ****/
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
		/**** md5 signature: cbb15dc80fb24bd4e944dd585c2e3409 ****/
		%feature("compactdefaultargs") Role;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepBasic_DateRole>
") Role;
		opencascade::handle<StepBasic_DateRole> Role();

		/****************** SetAssignedDate ******************/
		/**** md5 signature: 888717b26ec51d80c375cc1f191cc9da ****/
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
		/**** md5 signature: d2ee3b52f2dea3e8ef0bcd0f11e8246b ****/
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
		/**** md5 signature: f824bc9223892416b8000338429318c0 ****/
		%feature("compactdefaultargs") StepBasic_DateRole;
		%feature("autodoc", "Returns a daterole.

Returns
-------
None
") StepBasic_DateRole;
		 StepBasic_DateRole();

		/****************** Init ******************/
		/**** md5 signature: e10f4ffe4365262d2d9a5484d96325b8 ****/
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
		/**** md5 signature: 6bcb97f17b57cae0750fd29eac20499c ****/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") Name;
		opencascade::handle<TCollection_HAsciiString> Name();

		/****************** SetName ******************/
		/**** md5 signature: 1e0b00d9eb163c8a0cdbb986e2ee24f6 ****/
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
		/**** md5 signature: df49a6aec2c253830be79ab0f95152d0 ****/
		%feature("compactdefaultargs") StepBasic_DateTimeRole;
		%feature("autodoc", "Returns a datetimerole.

Returns
-------
None
") StepBasic_DateTimeRole;
		 StepBasic_DateTimeRole();

		/****************** Init ******************/
		/**** md5 signature: e10f4ffe4365262d2d9a5484d96325b8 ****/
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
		/**** md5 signature: 6bcb97f17b57cae0750fd29eac20499c ****/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") Name;
		opencascade::handle<TCollection_HAsciiString> Name();

		/****************** SetName ******************/
		/**** md5 signature: 1e0b00d9eb163c8a0cdbb986e2ee24f6 ****/
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
		/**** md5 signature: d1f32dd3fec1fa7373c6b7933c23777f ****/
		%feature("compactdefaultargs") StepBasic_DateTimeSelect;
		%feature("autodoc", "Returns a datetimeselect selecttype.

Returns
-------
None
") StepBasic_DateTimeSelect;
		 StepBasic_DateTimeSelect();

		/****************** CaseNum ******************/
		/**** md5 signature: f0e39118a9846e44ccd59de148215261 ****/
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
		/**** md5 signature: 532dbd3fde99bd0fbaabc8918d336136 ****/
		%feature("compactdefaultargs") Date;
		%feature("autodoc", "Returns value as a date (null if another type).

Returns
-------
opencascade::handle<StepBasic_Date>
") Date;
		opencascade::handle<StepBasic_Date> Date();

		/****************** DateAndTime ******************/
		/**** md5 signature: 7a7bd4d287039626bd3a9ff7e9fc4b33 ****/
		%feature("compactdefaultargs") DateAndTime;
		%feature("autodoc", "Returns value as a dateandtime (null if another type).

Returns
-------
opencascade::handle<StepBasic_DateAndTime>
") DateAndTime;
		opencascade::handle<StepBasic_DateAndTime> DateAndTime();

		/****************** LocalTime ******************/
		/**** md5 signature: 5c186aee9efdec35165319298e49ed34 ****/
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
		/**** md5 signature: f13a8125b166ae7f3826c70e222c813f ****/
		%feature("compactdefaultargs") StepBasic_DerivedUnit;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") StepBasic_DerivedUnit;
		 StepBasic_DerivedUnit();

		/****************** Elements ******************/
		/**** md5 signature: 55f1b3af218d1103682ddbeb236bfa38 ****/
		%feature("compactdefaultargs") Elements;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepBasic_HArray1OfDerivedUnitElement>
") Elements;
		opencascade::handle<StepBasic_HArray1OfDerivedUnitElement> Elements();

		/****************** ElementsValue ******************/
		/**** md5 signature: b7e8da591e76a59fef2fc5a006bc2a24 ****/
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
		/**** md5 signature: 69f11f12489d32b7c28195b96bd986da ****/
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
		/**** md5 signature: bda4abdd1e5bc28bcadae491494177fe ****/
		%feature("compactdefaultargs") NbElements;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbElements;
		Standard_Integer NbElements();

		/****************** SetElements ******************/
		/**** md5 signature: 45e6a42e6afa9ed62cef46b581148f03 ****/
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
		/**** md5 signature: f5178949f05b4588268af81816221694 ****/
		%feature("compactdefaultargs") StepBasic_DerivedUnitElement;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") StepBasic_DerivedUnitElement;
		 StepBasic_DerivedUnitElement();

		/****************** Exponent ******************/
		/**** md5 signature: 2f3e41715663d96bea8311915e30d22f ****/
		%feature("compactdefaultargs") Exponent;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") Exponent;
		Standard_Real Exponent();

		/****************** Init ******************/
		/**** md5 signature: 310fc4d94d29c6b471b2a5e8e6fdf327 ****/
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
		/**** md5 signature: ed29641a2d0f660cc634b523c1c08f8a ****/
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
		/**** md5 signature: 1e47c3fe49db6eeee227bdb3691a3780 ****/
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
		/**** md5 signature: a0b2c8c4de030fe9931b04c0d952856b ****/
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
		/**** md5 signature: 07e23bf820b0cd5719de9f20008abd87 ****/
		%feature("compactdefaultargs") StepBasic_DimensionalExponents;
		%feature("autodoc", "Returns a dimensionalexponents.

Returns
-------
None
") StepBasic_DimensionalExponents;
		 StepBasic_DimensionalExponents();

		/****************** AmountOfSubstanceExponent ******************/
		/**** md5 signature: 28129e275c9898ea1d5eced63ce51194 ****/
		%feature("compactdefaultargs") AmountOfSubstanceExponent;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") AmountOfSubstanceExponent;
		Standard_Real AmountOfSubstanceExponent();

		/****************** ElectricCurrentExponent ******************/
		/**** md5 signature: 5cc2807c213364906af271b5a7f1f0b6 ****/
		%feature("compactdefaultargs") ElectricCurrentExponent;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") ElectricCurrentExponent;
		Standard_Real ElectricCurrentExponent();

		/****************** Init ******************/
		/**** md5 signature: f15be97bfcd8d7ec54485ae5c85f31ea ****/
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
		/**** md5 signature: e7bb2081da7fc823e9d1e9e8bb41388f ****/
		%feature("compactdefaultargs") LengthExponent;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") LengthExponent;
		Standard_Real LengthExponent();

		/****************** LuminousIntensityExponent ******************/
		/**** md5 signature: 1bd1a9702b74543578154da0625b04d6 ****/
		%feature("compactdefaultargs") LuminousIntensityExponent;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") LuminousIntensityExponent;
		Standard_Real LuminousIntensityExponent();

		/****************** MassExponent ******************/
		/**** md5 signature: a2ebb474d42ec651db7c7e0d8b82c7de ****/
		%feature("compactdefaultargs") MassExponent;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") MassExponent;
		Standard_Real MassExponent();

		/****************** SetAmountOfSubstanceExponent ******************/
		/**** md5 signature: 54962f68e14c48dd98d33f4386f404f4 ****/
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
		/**** md5 signature: 0a0ed9cbeafadeb16af479f678ab5fbf ****/
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
		/**** md5 signature: 3573dcd1688ee50f71daff3126fe104f ****/
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
		/**** md5 signature: 0fd571315dc7a888e3cfa63f35606a73 ****/
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
		/**** md5 signature: 7a204f0ca2429266dad222f3dc3c6978 ****/
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
		/**** md5 signature: 23b264f5a3db45e02cd5ec35796c343a ****/
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
		/**** md5 signature: 573b6cf8a7162cc089b08fcb8a6fa31d ****/
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
		/**** md5 signature: 16ef32679b04270e12d44ee1dc1bb22a ****/
		%feature("compactdefaultargs") ThermodynamicTemperatureExponent;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") ThermodynamicTemperatureExponent;
		Standard_Real ThermodynamicTemperatureExponent();

		/****************** TimeExponent ******************/
		/**** md5 signature: 7b9cb1fec879252c26baa7131befa399 ****/
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
		/**** md5 signature: d90add5df367a3fadbdf9ab546f1df4f ****/
		%feature("compactdefaultargs") StepBasic_Document;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") StepBasic_Document;
		 StepBasic_Document();

		/****************** Description ******************/
		/**** md5 signature: 68309bdf9d57a000073490b39f8e7a41 ****/
		%feature("compactdefaultargs") Description;
		%feature("autodoc", "Returns field description.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") Description;
		opencascade::handle<TCollection_HAsciiString> Description();

		/****************** HasDescription ******************/
		/**** md5 signature: 819ef9a3dced474861e1980d901a2978 ****/
		%feature("compactdefaultargs") HasDescription;
		%feature("autodoc", "Returns true if optional field description is defined.

Returns
-------
bool
") HasDescription;
		Standard_Boolean HasDescription();

		/****************** Id ******************/
		/**** md5 signature: cad437aa1c6f9043742098c562124f9e ****/
		%feature("compactdefaultargs") Id;
		%feature("autodoc", "Returns field id.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") Id;
		opencascade::handle<TCollection_HAsciiString> Id();

		/****************** Init ******************/
		/**** md5 signature: 48a154076e286fe0eb54dfe10d25242b ****/
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
		/**** md5 signature: 968aa1c734b275b7a8fafad10cfc1d81 ****/
		%feature("compactdefaultargs") Kind;
		%feature("autodoc", "Returns field kind.

Returns
-------
opencascade::handle<StepBasic_DocumentType>
") Kind;
		opencascade::handle<StepBasic_DocumentType> Kind();

		/****************** Name ******************/
		/**** md5 signature: 6bcb97f17b57cae0750fd29eac20499c ****/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "Returns field name.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") Name;
		opencascade::handle<TCollection_HAsciiString> Name();

		/****************** SetDescription ******************/
		/**** md5 signature: 11ff45bab13c9c85c44619d6c4501da8 ****/
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
		/**** md5 signature: 779c5dce2dcbd218d648cf0dfb829a83 ****/
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
		/**** md5 signature: da21244b43074f7f4ffb84c5ab90ba2d ****/
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
		/**** md5 signature: 1a85c1f4dd446039f14efe98df7aeb03 ****/
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
		/**** md5 signature: 0f0e8895f4eddfe0d4f65d161157e5af ****/
		%feature("compactdefaultargs") StepBasic_DocumentProductAssociation;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") StepBasic_DocumentProductAssociation;
		 StepBasic_DocumentProductAssociation();

		/****************** Description ******************/
		/**** md5 signature: 68309bdf9d57a000073490b39f8e7a41 ****/
		%feature("compactdefaultargs") Description;
		%feature("autodoc", "Returns field description.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") Description;
		opencascade::handle<TCollection_HAsciiString> Description();

		/****************** HasDescription ******************/
		/**** md5 signature: 819ef9a3dced474861e1980d901a2978 ****/
		%feature("compactdefaultargs") HasDescription;
		%feature("autodoc", "Returns true if optional field description is defined.

Returns
-------
bool
") HasDescription;
		Standard_Boolean HasDescription();

		/****************** Init ******************/
		/**** md5 signature: a10cfec39ea27abec984b896951647d7 ****/
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
		/**** md5 signature: 6bcb97f17b57cae0750fd29eac20499c ****/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "Returns field name.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") Name;
		opencascade::handle<TCollection_HAsciiString> Name();

		/****************** RelatedProduct ******************/
		/**** md5 signature: db7bed8232672a8dbbe0cb8ad1022d96 ****/
		%feature("compactdefaultargs") RelatedProduct;
		%feature("autodoc", "Returns field relatedproduct.

Returns
-------
StepBasic_ProductOrFormationOrDefinition
") RelatedProduct;
		StepBasic_ProductOrFormationOrDefinition RelatedProduct();

		/****************** RelatingDocument ******************/
		/**** md5 signature: 6767e807abfcce942f62abbf626fc5af ****/
		%feature("compactdefaultargs") RelatingDocument;
		%feature("autodoc", "Returns field relatingdocument.

Returns
-------
opencascade::handle<StepBasic_Document>
") RelatingDocument;
		opencascade::handle<StepBasic_Document> RelatingDocument();

		/****************** SetDescription ******************/
		/**** md5 signature: 11ff45bab13c9c85c44619d6c4501da8 ****/
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
		/**** md5 signature: 1a85c1f4dd446039f14efe98df7aeb03 ****/
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
		/**** md5 signature: 24b5ef108a1623787230c8e1a7c7fd8f ****/
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
		/**** md5 signature: 32fd5cb531ec4d1dafc6377abadb2993 ****/
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
		/**** md5 signature: 19e768f9b9c2097e58011ba97322d8d8 ****/
		%feature("compactdefaultargs") AssignedDocument;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepBasic_Document>
") AssignedDocument;
		opencascade::handle<StepBasic_Document> AssignedDocument();

		/****************** Init0 ******************/
		/**** md5 signature: 8e9aeea6e3a67a9530ee4edb8f3bbab8 ****/
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
		/**** md5 signature: fa747b473c395d529db10b872c0070f5 ****/
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
		/**** md5 signature: 854c5b1decd2ea1be38e2882db573f43 ****/
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
		/**** md5 signature: 11761fc70ff0a5837bb4209ca964e007 ****/
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
		/**** md5 signature: 047289f41fda0437aa39e7a2810af1c7 ****/
		%feature("compactdefaultargs") StepBasic_DocumentRelationship;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") StepBasic_DocumentRelationship;
		 StepBasic_DocumentRelationship();

		/****************** Description ******************/
		/**** md5 signature: 68309bdf9d57a000073490b39f8e7a41 ****/
		%feature("compactdefaultargs") Description;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") Description;
		opencascade::handle<TCollection_HAsciiString> Description();

		/****************** Init ******************/
		/**** md5 signature: b6bdaec07100f7ae48cd7b05c10ff274 ****/
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
		/**** md5 signature: 6bcb97f17b57cae0750fd29eac20499c ****/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") Name;
		opencascade::handle<TCollection_HAsciiString> Name();

		/****************** RelatedDocument ******************/
		/**** md5 signature: 9133552c6c8cdaaedb68037c1827f5e1 ****/
		%feature("compactdefaultargs") RelatedDocument;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepBasic_Document>
") RelatedDocument;
		opencascade::handle<StepBasic_Document> RelatedDocument();

		/****************** RelatingDocument ******************/
		/**** md5 signature: 6767e807abfcce942f62abbf626fc5af ****/
		%feature("compactdefaultargs") RelatingDocument;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepBasic_Document>
") RelatingDocument;
		opencascade::handle<StepBasic_Document> RelatingDocument();

		/****************** SetDescription ******************/
		/**** md5 signature: adddd13a906718df58a2eee683a382cf ****/
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
		/**** md5 signature: 1e0b00d9eb163c8a0cdbb986e2ee24f6 ****/
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
		/**** md5 signature: 5558f56c7f4885b4032dbde1db22b94a ****/
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
		/**** md5 signature: 37c371d4cc984bf2fe31430491a6d403 ****/
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
		/**** md5 signature: 8038f0b3b5adb07c7e07756824ca77aa ****/
		%feature("compactdefaultargs") StepBasic_DocumentRepresentationType;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") StepBasic_DocumentRepresentationType;
		 StepBasic_DocumentRepresentationType();

		/****************** Init ******************/
		/**** md5 signature: b4a57dcc5ec3463798581c6d2b2e67fb ****/
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
		/**** md5 signature: 6bcb97f17b57cae0750fd29eac20499c ****/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "Returns field name.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") Name;
		opencascade::handle<TCollection_HAsciiString> Name();

		/****************** RepresentedDocument ******************/
		/**** md5 signature: 58883ae87a50da7eb1eeca3a16facedb ****/
		%feature("compactdefaultargs") RepresentedDocument;
		%feature("autodoc", "Returns field representeddocument.

Returns
-------
opencascade::handle<StepBasic_Document>
") RepresentedDocument;
		opencascade::handle<StepBasic_Document> RepresentedDocument();

		/****************** SetName ******************/
		/**** md5 signature: 1a85c1f4dd446039f14efe98df7aeb03 ****/
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
		/**** md5 signature: b2c000e33a12251742738bf7348e5d65 ****/
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
		/**** md5 signature: bc1aaa34504987f8755b2c1d9dc862fa ****/
		%feature("compactdefaultargs") StepBasic_DocumentType;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") StepBasic_DocumentType;
		 StepBasic_DocumentType();

		/****************** Init ******************/
		/**** md5 signature: 89dc25d8cc7aee782dc2dce254e35d59 ****/
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
		/**** md5 signature: a03a61e31092d986c0c55c4c51f7c1d2 ****/
		%feature("compactdefaultargs") ProductDataType;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") ProductDataType;
		opencascade::handle<TCollection_HAsciiString> ProductDataType();

		/****************** SetProductDataType ******************/
		/**** md5 signature: ff22ec573409e99d4e580eafbe3ac8c7 ****/
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
		/**** md5 signature: 5e2e866922c1305d107d47c375cca310 ****/
		%feature("compactdefaultargs") StepBasic_DocumentUsageConstraint;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") StepBasic_DocumentUsageConstraint;
		 StepBasic_DocumentUsageConstraint();

		/****************** Init ******************/
		/**** md5 signature: a05631b154d56a818b0defe00b9ff47a ****/
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
		/**** md5 signature: a76bb3227899561fda50fb9f91688c3b ****/
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
		/**** md5 signature: b2bd1f1c0e3e58c541e977fe1fe473a3 ****/
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
		/**** md5 signature: 52410b901503a6b5bdadf091ac482c4e ****/
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
		/**** md5 signature: 9b8d130e33e131c7de399e9d0934c03b ****/
		%feature("compactdefaultargs") Source;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepBasic_Document>
") Source;
		opencascade::handle<StepBasic_Document> Source();

		/****************** SubjectElement ******************/
		/**** md5 signature: 5a291b0a0e83af68a837f79bb0dfd03f ****/
		%feature("compactdefaultargs") SubjectElement;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") SubjectElement;
		opencascade::handle<TCollection_HAsciiString> SubjectElement();

		/****************** SubjectElementValue ******************/
		/**** md5 signature: c5108a4c0ae8f975d1e3abe221e35977 ****/
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
		/**** md5 signature: 10c6b255f38de8dc1fa137b8f9cd190d ****/
		%feature("compactdefaultargs") StepBasic_Effectivity;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") StepBasic_Effectivity;
		 StepBasic_Effectivity();

		/****************** Id ******************/
		/**** md5 signature: cad437aa1c6f9043742098c562124f9e ****/
		%feature("compactdefaultargs") Id;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") Id;
		opencascade::handle<TCollection_HAsciiString> Id();

		/****************** Init ******************/
		/**** md5 signature: e0d6d2e67bc329f61d48f1d86cf2affc ****/
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
		/**** md5 signature: a589ed4c1f87cc154c05276cfb60f4ea ****/
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
		/**** md5 signature: e83292fffb9e60c2eb34f7d74b403b2a ****/
		%feature("compactdefaultargs") StepBasic_EffectivityAssignment;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") StepBasic_EffectivityAssignment;
		 StepBasic_EffectivityAssignment();

		/****************** AssignedEffectivity ******************/
		/**** md5 signature: 9058e219238a60bae3a0eb078af6806c ****/
		%feature("compactdefaultargs") AssignedEffectivity;
		%feature("autodoc", "Returns field assignedeffectivity.

Returns
-------
opencascade::handle<StepBasic_Effectivity>
") AssignedEffectivity;
		opencascade::handle<StepBasic_Effectivity> AssignedEffectivity();

		/****************** Init ******************/
		/**** md5 signature: c49650da5d00cc7204cec0b038f8cc5c ****/
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
		/**** md5 signature: 4741ef3bef1a1321860173c7d6a96316 ****/
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
		/**** md5 signature: e6e41a24a70786186101fede26af22d3 ****/
		%feature("compactdefaultargs") StepBasic_EulerAngles;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") StepBasic_EulerAngles;
		 StepBasic_EulerAngles();

		/****************** Angles ******************/
		/**** md5 signature: 091a62348d572fb9656d813d6d85fa63 ****/
		%feature("compactdefaultargs") Angles;
		%feature("autodoc", "Returns field angles.

Returns
-------
opencascade::handle<TColStd_HArray1OfReal>
") Angles;
		opencascade::handle<TColStd_HArray1OfReal> Angles();

		/****************** Init ******************/
		/**** md5 signature: d7ced06dd4c063a5af85bb59ba9774d3 ****/
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
		/**** md5 signature: 616c94a3390c69199eef71371c873578 ****/
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
		/**** md5 signature: 62a10501aec290ce7990b08c61c61f1c ****/
		%feature("compactdefaultargs") StepBasic_ExternalSource;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") StepBasic_ExternalSource;
		 StepBasic_ExternalSource();

		/****************** Init ******************/
		/**** md5 signature: 5c045959f9577ce243f6dc05eb656c6f ****/
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
		/**** md5 signature: af9bbd623dcc3096e8ebbad88403428e ****/
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
		/**** md5 signature: 2aeea3fd499983d611d3d5c453142423 ****/
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
		/**** md5 signature: ea95510bfd88fcafebffa0082538eece ****/
		%feature("compactdefaultargs") StepBasic_ExternallyDefinedItem;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") StepBasic_ExternallyDefinedItem;
		 StepBasic_ExternallyDefinedItem();

		/****************** Init ******************/
		/**** md5 signature: 878741d640bf415ab8d714ce90c4fa2c ****/
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
		/**** md5 signature: 0a2718404430824b962e322453ce7e08 ****/
		%feature("compactdefaultargs") ItemId;
		%feature("autodoc", "Returns field itemid.

Returns
-------
StepBasic_SourceItem
") ItemId;
		StepBasic_SourceItem ItemId();

		/****************** SetItemId ******************/
		/**** md5 signature: d718eaee53490b503dc0a0940b8ca7b1 ****/
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
		/**** md5 signature: 2e83538f32b5b2a0a6a43a552fe31327 ****/
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
		/**** md5 signature: 8b90a9ea46f21d4e9d0fbb6449a05fa1 ****/
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
		/**** md5 signature: 12568db7edb60d7ac4a475b3bacc6b43 ****/
		%feature("compactdefaultargs") StepBasic_GeneralProperty;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") StepBasic_GeneralProperty;
		 StepBasic_GeneralProperty();

		/****************** Description ******************/
		/**** md5 signature: 68309bdf9d57a000073490b39f8e7a41 ****/
		%feature("compactdefaultargs") Description;
		%feature("autodoc", "Returns field description.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") Description;
		opencascade::handle<TCollection_HAsciiString> Description();

		/****************** HasDescription ******************/
		/**** md5 signature: 819ef9a3dced474861e1980d901a2978 ****/
		%feature("compactdefaultargs") HasDescription;
		%feature("autodoc", "Returns true if optional field description is defined.

Returns
-------
bool
") HasDescription;
		Standard_Boolean HasDescription();

		/****************** Id ******************/
		/**** md5 signature: cad437aa1c6f9043742098c562124f9e ****/
		%feature("compactdefaultargs") Id;
		%feature("autodoc", "Returns field id.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") Id;
		opencascade::handle<TCollection_HAsciiString> Id();

		/****************** Init ******************/
		/**** md5 signature: 3d1ce2e201e5b42400db6e78057f3e0f ****/
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
		/**** md5 signature: 6bcb97f17b57cae0750fd29eac20499c ****/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "Returns field name.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") Name;
		opencascade::handle<TCollection_HAsciiString> Name();

		/****************** SetDescription ******************/
		/**** md5 signature: 11ff45bab13c9c85c44619d6c4501da8 ****/
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
		/**** md5 signature: 779c5dce2dcbd218d648cf0dfb829a83 ****/
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
		/**** md5 signature: 1a85c1f4dd446039f14efe98df7aeb03 ****/
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
		/**** md5 signature: 300794a7c0fea762fb0a815420e468e9 ****/
		%feature("compactdefaultargs") StepBasic_Group;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") StepBasic_Group;
		 StepBasic_Group();

		/****************** Description ******************/
		/**** md5 signature: 68309bdf9d57a000073490b39f8e7a41 ****/
		%feature("compactdefaultargs") Description;
		%feature("autodoc", "Returns field description.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") Description;
		opencascade::handle<TCollection_HAsciiString> Description();

		/****************** HasDescription ******************/
		/**** md5 signature: 819ef9a3dced474861e1980d901a2978 ****/
		%feature("compactdefaultargs") HasDescription;
		%feature("autodoc", "Returns true if optional field description is defined.

Returns
-------
bool
") HasDescription;
		Standard_Boolean HasDescription();

		/****************** Init ******************/
		/**** md5 signature: f1e00464b915b5c43dbfec20d469b99a ****/
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
		/**** md5 signature: 6bcb97f17b57cae0750fd29eac20499c ****/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "Returns field name.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") Name;
		opencascade::handle<TCollection_HAsciiString> Name();

		/****************** SetDescription ******************/
		/**** md5 signature: 11ff45bab13c9c85c44619d6c4501da8 ****/
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
		/**** md5 signature: 1a85c1f4dd446039f14efe98df7aeb03 ****/
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
		/**** md5 signature: 280304ce6787db8480fe6e5bbe18008c ****/
		%feature("compactdefaultargs") StepBasic_GroupAssignment;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") StepBasic_GroupAssignment;
		 StepBasic_GroupAssignment();

		/****************** AssignedGroup ******************/
		/**** md5 signature: 6d6cb5846f6140833d4d87cdd7f8e062 ****/
		%feature("compactdefaultargs") AssignedGroup;
		%feature("autodoc", "Returns field assignedgroup.

Returns
-------
opencascade::handle<StepBasic_Group>
") AssignedGroup;
		opencascade::handle<StepBasic_Group> AssignedGroup();

		/****************** Init ******************/
		/**** md5 signature: e4cbff9dd4df06f1904f657e417480d2 ****/
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
		/**** md5 signature: 309fbbfbf7949a4f2be2a024526430cf ****/
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
		/**** md5 signature: 87be79f436e6eb139752b6e18ad26b9c ****/
		%feature("compactdefaultargs") StepBasic_GroupRelationship;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") StepBasic_GroupRelationship;
		 StepBasic_GroupRelationship();

		/****************** Description ******************/
		/**** md5 signature: 68309bdf9d57a000073490b39f8e7a41 ****/
		%feature("compactdefaultargs") Description;
		%feature("autodoc", "Returns field description.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") Description;
		opencascade::handle<TCollection_HAsciiString> Description();

		/****************** HasDescription ******************/
		/**** md5 signature: 819ef9a3dced474861e1980d901a2978 ****/
		%feature("compactdefaultargs") HasDescription;
		%feature("autodoc", "Returns true if optional field description is defined.

Returns
-------
bool
") HasDescription;
		Standard_Boolean HasDescription();

		/****************** Init ******************/
		/**** md5 signature: 895986aa020206d592bb0bc8af16ac69 ****/
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
		/**** md5 signature: 6bcb97f17b57cae0750fd29eac20499c ****/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "Returns field name.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") Name;
		opencascade::handle<TCollection_HAsciiString> Name();

		/****************** RelatedGroup ******************/
		/**** md5 signature: 9823add22ed82ec4f38c61d78bfd3710 ****/
		%feature("compactdefaultargs") RelatedGroup;
		%feature("autodoc", "Returns field relatedgroup.

Returns
-------
opencascade::handle<StepBasic_Group>
") RelatedGroup;
		opencascade::handle<StepBasic_Group> RelatedGroup();

		/****************** RelatingGroup ******************/
		/**** md5 signature: 0dfd46c777e836afd490ed100a0dceb8 ****/
		%feature("compactdefaultargs") RelatingGroup;
		%feature("autodoc", "Returns field relatinggroup.

Returns
-------
opencascade::handle<StepBasic_Group>
") RelatingGroup;
		opencascade::handle<StepBasic_Group> RelatingGroup();

		/****************** SetDescription ******************/
		/**** md5 signature: 11ff45bab13c9c85c44619d6c4501da8 ****/
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
		/**** md5 signature: 1a85c1f4dd446039f14efe98df7aeb03 ****/
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
		/**** md5 signature: aea7df1013f88266200792f28729e68d ****/
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
		/**** md5 signature: 38ba38a6d11ca6bcab5247baa10a8f80 ****/
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
		/**** md5 signature: 93f47581eb75f317fd63e62f80229d11 ****/
		%feature("compactdefaultargs") StepBasic_IdentificationAssignment;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") StepBasic_IdentificationAssignment;
		 StepBasic_IdentificationAssignment();

		/****************** AssignedId ******************/
		/**** md5 signature: f12bf17043dc737ac5f58fe4d6b68271 ****/
		%feature("compactdefaultargs") AssignedId;
		%feature("autodoc", "Returns field assignedid.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") AssignedId;
		opencascade::handle<TCollection_HAsciiString> AssignedId();

		/****************** Init ******************/
		/**** md5 signature: e8e886ab7a986781830f00d82917bb82 ****/
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
		/**** md5 signature: 757fadf1d918cbdebb66723d79293c34 ****/
		%feature("compactdefaultargs") Role;
		%feature("autodoc", "Returns field role.

Returns
-------
opencascade::handle<StepBasic_IdentificationRole>
") Role;
		opencascade::handle<StepBasic_IdentificationRole> Role();

		/****************** SetAssignedId ******************/
		/**** md5 signature: 67455e06952677db8ef3d659d9019549 ****/
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
		/**** md5 signature: 91eb38eb2f9519d4d7591735c1fbe4f2 ****/
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
		/**** md5 signature: 57a78d8804cba5e6278b0244b45f05fb ****/
		%feature("compactdefaultargs") StepBasic_IdentificationRole;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") StepBasic_IdentificationRole;
		 StepBasic_IdentificationRole();

		/****************** Description ******************/
		/**** md5 signature: 68309bdf9d57a000073490b39f8e7a41 ****/
		%feature("compactdefaultargs") Description;
		%feature("autodoc", "Returns field description.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") Description;
		opencascade::handle<TCollection_HAsciiString> Description();

		/****************** HasDescription ******************/
		/**** md5 signature: 819ef9a3dced474861e1980d901a2978 ****/
		%feature("compactdefaultargs") HasDescription;
		%feature("autodoc", "Returns true if optional field description is defined.

Returns
-------
bool
") HasDescription;
		Standard_Boolean HasDescription();

		/****************** Init ******************/
		/**** md5 signature: f1e00464b915b5c43dbfec20d469b99a ****/
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
		/**** md5 signature: 6bcb97f17b57cae0750fd29eac20499c ****/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "Returns field name.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") Name;
		opencascade::handle<TCollection_HAsciiString> Name();

		/****************** SetDescription ******************/
		/**** md5 signature: 11ff45bab13c9c85c44619d6c4501da8 ****/
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
		/**** md5 signature: 1a85c1f4dd446039f14efe98df7aeb03 ****/
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
		/**** md5 signature: 5ee6724eb85cc7fd17c8f814ec00f647 ****/
		%feature("compactdefaultargs") StepBasic_LocalTime;
		%feature("autodoc", "Returns a localtime.

Returns
-------
None
") StepBasic_LocalTime;
		 StepBasic_LocalTime();

		/****************** HasMinuteComponent ******************/
		/**** md5 signature: 0e1e485905a4775e8f40a8b3ef8dda33 ****/
		%feature("compactdefaultargs") HasMinuteComponent;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") HasMinuteComponent;
		Standard_Boolean HasMinuteComponent();

		/****************** HasSecondComponent ******************/
		/**** md5 signature: 16096abd13fd9c7f7be70feb495c99c7 ****/
		%feature("compactdefaultargs") HasSecondComponent;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") HasSecondComponent;
		Standard_Boolean HasSecondComponent();

		/****************** HourComponent ******************/
		/**** md5 signature: 0ae126454dff6778ff5a52ddbdf463a4 ****/
		%feature("compactdefaultargs") HourComponent;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") HourComponent;
		Standard_Integer HourComponent();

		/****************** Init ******************/
		/**** md5 signature: 17fc466df19e47c9603308465f7ea9a7 ****/
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
		/**** md5 signature: 50150043b4b796778bbfd29da1e492db ****/
		%feature("compactdefaultargs") MinuteComponent;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") MinuteComponent;
		Standard_Integer MinuteComponent();

		/****************** SecondComponent ******************/
		/**** md5 signature: 14301560202178f1c24ca347a9df229e ****/
		%feature("compactdefaultargs") SecondComponent;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") SecondComponent;
		Standard_Real SecondComponent();

		/****************** SetHourComponent ******************/
		/**** md5 signature: 91ab2443588ab322ae433551dea13666 ****/
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
		/**** md5 signature: 2fb0b71dc1a72ab36db26ded7c773946 ****/
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
		/**** md5 signature: 77bd2e16d930a7aba083d43b922b7508 ****/
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
		/**** md5 signature: 579c2bb84cfd392b8ed8780caf2f408c ****/
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
		/**** md5 signature: 4b476a90c7021728a930f69a7a11c869 ****/
		%feature("compactdefaultargs") UnSetMinuteComponent;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") UnSetMinuteComponent;
		void UnSetMinuteComponent();

		/****************** UnSetSecondComponent ******************/
		/**** md5 signature: 3db79fa6499d4eda842d785dc9c5c7a7 ****/
		%feature("compactdefaultargs") UnSetSecondComponent;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") UnSetSecondComponent;
		void UnSetSecondComponent();

		/****************** Zone ******************/
		/**** md5 signature: 0825816d63baf5ba11320fa46f123fb5 ****/
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
		/**** md5 signature: 83af7b86d292b1cdd3c0682b1cbb5993 ****/
		%feature("compactdefaultargs") StepBasic_MeasureValueMember;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") StepBasic_MeasureValueMember;
		 StepBasic_MeasureValueMember();

		/****************** HasName ******************/
		/**** md5 signature: c4b2dbd737f3c98314fdb7955ce91c2a ****/
		%feature("compactdefaultargs") HasName;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") HasName;
		virtual Standard_Boolean HasName();

		/****************** Name ******************/
		/**** md5 signature: d654a4ee9a75d24a9c3f33853f908999 ****/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "No available documentation.

Returns
-------
char *
") Name;
		virtual const char * Name();

		/****************** SetName ******************/
		/**** md5 signature: cb088c8a5caf9447945830483c3112e7 ****/
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
		/**** md5 signature: 29b118b5d7929d786614a8739bad74ce ****/
		%feature("compactdefaultargs") StepBasic_MeasureWithUnit;
		%feature("autodoc", "Returns a measurewithunit.

Returns
-------
None
") StepBasic_MeasureWithUnit;
		 StepBasic_MeasureWithUnit();

		/****************** Init ******************/
		/**** md5 signature: c6ce2f17d01d5ece1df60b75a19d21c2 ****/
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
		/**** md5 signature: b688bbcd1dc311f5aeac912af22b8f87 ****/
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
		/**** md5 signature: 013f0f5d58ef4ce8e8786002893dc682 ****/
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
		/**** md5 signature: d70df46730cda4eaec8067615ba01cdf ****/
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
		/**** md5 signature: c309e94f1a30356e372d0b70aaaa706b ****/
		%feature("compactdefaultargs") UnitComponent;
		%feature("autodoc", "No available documentation.

Returns
-------
StepBasic_Unit
") UnitComponent;
		StepBasic_Unit UnitComponent();

		/****************** ValueComponent ******************/
		/**** md5 signature: 416aa0800934d007f54f7d87fd170269 ****/
		%feature("compactdefaultargs") ValueComponent;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") ValueComponent;
		Standard_Real ValueComponent();

		/****************** ValueComponentMember ******************/
		/**** md5 signature: 017f07fb974a1b9678ec4ca8d2d8a914 ****/
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
		/**** md5 signature: 23a898252c93df1044f568ac6dfd66bd ****/
		%feature("compactdefaultargs") StepBasic_NameAssignment;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") StepBasic_NameAssignment;
		 StepBasic_NameAssignment();

		/****************** AssignedName ******************/
		/**** md5 signature: 46ae5fd1e8dbc39b25b2971bbc29c2fc ****/
		%feature("compactdefaultargs") AssignedName;
		%feature("autodoc", "Returns field assignedname.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") AssignedName;
		opencascade::handle<TCollection_HAsciiString> AssignedName();

		/****************** Init ******************/
		/**** md5 signature: 0927b0f7c1a80b7dc7d5e8a5cfacadd1 ****/
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
		/**** md5 signature: c4e5175134ec51ec71023702cfce9f8b ****/
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
		/**** md5 signature: e787903e71cbfee3b1009d9b320ac0b6 ****/
		%feature("compactdefaultargs") StepBasic_NamedUnit;
		%feature("autodoc", "Returns a namedunit.

Returns
-------
None
") StepBasic_NamedUnit;
		 StepBasic_NamedUnit();

		/****************** Dimensions ******************/
		/**** md5 signature: b06807ffcd27df6f8d30dd9bbc5b560e ****/
		%feature("compactdefaultargs") Dimensions;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepBasic_DimensionalExponents>
") Dimensions;
		virtual opencascade::handle<StepBasic_DimensionalExponents> Dimensions();

		/****************** Init ******************/
		/**** md5 signature: d74ccc372f0313d4c591c5e4b9e58d83 ****/
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
		/**** md5 signature: 92003abc2d339c52f73b33bd9a0db06d ****/
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
		/**** md5 signature: 3a767d4b0166e01bddc0f9adffd7c08b ****/
		%feature("compactdefaultargs") StepBasic_ObjectRole;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") StepBasic_ObjectRole;
		 StepBasic_ObjectRole();

		/****************** Description ******************/
		/**** md5 signature: 68309bdf9d57a000073490b39f8e7a41 ****/
		%feature("compactdefaultargs") Description;
		%feature("autodoc", "Returns field description.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") Description;
		opencascade::handle<TCollection_HAsciiString> Description();

		/****************** HasDescription ******************/
		/**** md5 signature: 819ef9a3dced474861e1980d901a2978 ****/
		%feature("compactdefaultargs") HasDescription;
		%feature("autodoc", "Returns true if optional field description is defined.

Returns
-------
bool
") HasDescription;
		Standard_Boolean HasDescription();

		/****************** Init ******************/
		/**** md5 signature: f1e00464b915b5c43dbfec20d469b99a ****/
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
		/**** md5 signature: 6bcb97f17b57cae0750fd29eac20499c ****/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "Returns field name.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") Name;
		opencascade::handle<TCollection_HAsciiString> Name();

		/****************** SetDescription ******************/
		/**** md5 signature: 11ff45bab13c9c85c44619d6c4501da8 ****/
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
		/**** md5 signature: 1a85c1f4dd446039f14efe98df7aeb03 ****/
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
		/**** md5 signature: 07c565605096bf9498d494129f3d056f ****/
		%feature("compactdefaultargs") StepBasic_Organization;
		%feature("autodoc", "Returns a organization.

Returns
-------
None
") StepBasic_Organization;
		 StepBasic_Organization();

		/****************** Description ******************/
		/**** md5 signature: 68309bdf9d57a000073490b39f8e7a41 ****/
		%feature("compactdefaultargs") Description;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") Description;
		opencascade::handle<TCollection_HAsciiString> Description();

		/****************** HasId ******************/
		/**** md5 signature: 301df1980d81870493903e6eee5538df ****/
		%feature("compactdefaultargs") HasId;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") HasId;
		Standard_Boolean HasId();

		/****************** Id ******************/
		/**** md5 signature: cad437aa1c6f9043742098c562124f9e ****/
		%feature("compactdefaultargs") Id;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") Id;
		opencascade::handle<TCollection_HAsciiString> Id();

		/****************** Init ******************/
		/**** md5 signature: b214cd7cc20055d3a8254b99a8885e29 ****/
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
		/**** md5 signature: 6bcb97f17b57cae0750fd29eac20499c ****/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") Name;
		opencascade::handle<TCollection_HAsciiString> Name();

		/****************** SetDescription ******************/
		/**** md5 signature: adddd13a906718df58a2eee683a382cf ****/
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
		/**** md5 signature: a589ed4c1f87cc154c05276cfb60f4ea ****/
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
		/**** md5 signature: 1e0b00d9eb163c8a0cdbb986e2ee24f6 ****/
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
		/**** md5 signature: 7b78a79bc983a53d1385ad44bee372f8 ****/
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
		/**** md5 signature: a9c513aa3cbac4d71235bf9ba89efdfc ****/
		%feature("compactdefaultargs") AssignedOrganization;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepBasic_Organization>
") AssignedOrganization;
		opencascade::handle<StepBasic_Organization> AssignedOrganization();

		/****************** Init ******************/
		/**** md5 signature: 4f7e31e93763c703c1e4c500478306dc ****/
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
		/**** md5 signature: fa1ef7886f1218721e08e8e6966da0c5 ****/
		%feature("compactdefaultargs") Role;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepBasic_OrganizationRole>
") Role;
		opencascade::handle<StepBasic_OrganizationRole> Role();

		/****************** SetAssignedOrganization ******************/
		/**** md5 signature: 3bd16050cb1be712d9550173a3fc8ebf ****/
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
		/**** md5 signature: 34e785836b3f210185349bed482e1e37 ****/
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
		/**** md5 signature: 5ba9d91dfa782ade765b7c4e6011b742 ****/
		%feature("compactdefaultargs") StepBasic_OrganizationRole;
		%feature("autodoc", "Returns a organizationrole.

Returns
-------
None
") StepBasic_OrganizationRole;
		 StepBasic_OrganizationRole();

		/****************** Init ******************/
		/**** md5 signature: e10f4ffe4365262d2d9a5484d96325b8 ****/
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
		/**** md5 signature: 6bcb97f17b57cae0750fd29eac20499c ****/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") Name;
		opencascade::handle<TCollection_HAsciiString> Name();

		/****************** SetName ******************/
		/**** md5 signature: 1e0b00d9eb163c8a0cdbb986e2ee24f6 ****/
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
		/**** md5 signature: e88e4e4683aeeaf6373f1d3d985dd5b7 ****/
		%feature("compactdefaultargs") StepBasic_Person;
		%feature("autodoc", "Returns a person.

Returns
-------
None
") StepBasic_Person;
		 StepBasic_Person();

		/****************** FirstName ******************/
		/**** md5 signature: fedebed151a60555bd73f524268af2c5 ****/
		%feature("compactdefaultargs") FirstName;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") FirstName;
		opencascade::handle<TCollection_HAsciiString> FirstName();

		/****************** HasFirstName ******************/
		/**** md5 signature: d24b85099a07ae9aee440490e7247415 ****/
		%feature("compactdefaultargs") HasFirstName;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") HasFirstName;
		Standard_Boolean HasFirstName();

		/****************** HasLastName ******************/
		/**** md5 signature: c6d88a30b099798c08786015f6c1910e ****/
		%feature("compactdefaultargs") HasLastName;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") HasLastName;
		Standard_Boolean HasLastName();

		/****************** HasMiddleNames ******************/
		/**** md5 signature: c58eec2a3d3246124bc2467cb64a40b8 ****/
		%feature("compactdefaultargs") HasMiddleNames;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") HasMiddleNames;
		Standard_Boolean HasMiddleNames();

		/****************** HasPrefixTitles ******************/
		/**** md5 signature: 84bd178645d256bb0058a0d05032eecb ****/
		%feature("compactdefaultargs") HasPrefixTitles;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") HasPrefixTitles;
		Standard_Boolean HasPrefixTitles();

		/****************** HasSuffixTitles ******************/
		/**** md5 signature: 80894eaf5201088accfea4bf987ae620 ****/
		%feature("compactdefaultargs") HasSuffixTitles;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") HasSuffixTitles;
		Standard_Boolean HasSuffixTitles();

		/****************** Id ******************/
		/**** md5 signature: cad437aa1c6f9043742098c562124f9e ****/
		%feature("compactdefaultargs") Id;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") Id;
		opencascade::handle<TCollection_HAsciiString> Id();

		/****************** Init ******************/
		/**** md5 signature: a3e0571f7f776a0d94a8640cec6b78d9 ****/
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
		/**** md5 signature: de2911d8bac319b53e48cc2cfb8e5982 ****/
		%feature("compactdefaultargs") LastName;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") LastName;
		opencascade::handle<TCollection_HAsciiString> LastName();

		/****************** MiddleNames ******************/
		/**** md5 signature: d48e76a66a76924158f7353a745f954d ****/
		%feature("compactdefaultargs") MiddleNames;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<Interface_HArray1OfHAsciiString>
") MiddleNames;
		opencascade::handle<Interface_HArray1OfHAsciiString> MiddleNames();

		/****************** MiddleNamesValue ******************/
		/**** md5 signature: 2ea74712db6746d8347888e5ad394fdc ****/
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
		/**** md5 signature: 16db45189f09a09589a79e0d5cb72d4a ****/
		%feature("compactdefaultargs") NbMiddleNames;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbMiddleNames;
		Standard_Integer NbMiddleNames();

		/****************** NbPrefixTitles ******************/
		/**** md5 signature: 291384cfaa66f835ccebb90c4852a2a2 ****/
		%feature("compactdefaultargs") NbPrefixTitles;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbPrefixTitles;
		Standard_Integer NbPrefixTitles();

		/****************** NbSuffixTitles ******************/
		/**** md5 signature: 3481c94a1965a1b7cd10c61ee9d35a97 ****/
		%feature("compactdefaultargs") NbSuffixTitles;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbSuffixTitles;
		Standard_Integer NbSuffixTitles();

		/****************** PrefixTitles ******************/
		/**** md5 signature: 0ffcd8609c0a378d697a858ffbdae503 ****/
		%feature("compactdefaultargs") PrefixTitles;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<Interface_HArray1OfHAsciiString>
") PrefixTitles;
		opencascade::handle<Interface_HArray1OfHAsciiString> PrefixTitles();

		/****************** PrefixTitlesValue ******************/
		/**** md5 signature: 9b740ba78d8f259655a6337095124dfc ****/
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
		/**** md5 signature: a8dd81e54774630044afa2058de7a789 ****/
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
		/**** md5 signature: a589ed4c1f87cc154c05276cfb60f4ea ****/
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
		/**** md5 signature: e9526b4f726a70adc624477a371f5d0f ****/
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
		/**** md5 signature: 36ecc716f6482798b54d3995ba849ed0 ****/
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
		/**** md5 signature: ac80e7de0933cd63067fecf643ed5a95 ****/
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
		/**** md5 signature: b12961f49b33ef8d310da452eefc1e45 ****/
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
		/**** md5 signature: 5dc2c8a1bb8f86e997596134d0b25cfe ****/
		%feature("compactdefaultargs") SuffixTitles;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<Interface_HArray1OfHAsciiString>
") SuffixTitles;
		opencascade::handle<Interface_HArray1OfHAsciiString> SuffixTitles();

		/****************** SuffixTitlesValue ******************/
		/**** md5 signature: 4484fd20864fa7a998e2dde3c6bf2521 ****/
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
		/**** md5 signature: 502887ddd0fd07cde6404487c4a930ef ****/
		%feature("compactdefaultargs") UnSetFirstName;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") UnSetFirstName;
		void UnSetFirstName();

		/****************** UnSetLastName ******************/
		/**** md5 signature: 8023766d838242b48c6d210f5637687b ****/
		%feature("compactdefaultargs") UnSetLastName;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") UnSetLastName;
		void UnSetLastName();

		/****************** UnSetMiddleNames ******************/
		/**** md5 signature: 71d7784f832c515f80a1f6221d63d798 ****/
		%feature("compactdefaultargs") UnSetMiddleNames;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") UnSetMiddleNames;
		void UnSetMiddleNames();

		/****************** UnSetPrefixTitles ******************/
		/**** md5 signature: 0e8c02d7dace980ec69fbc396c99e991 ****/
		%feature("compactdefaultargs") UnSetPrefixTitles;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") UnSetPrefixTitles;
		void UnSetPrefixTitles();

		/****************** UnSetSuffixTitles ******************/
		/**** md5 signature: 95fe5205132db94840b2a0c734789b1e ****/
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
		/**** md5 signature: c788b859e1756ce030b9af4c2f5eb544 ****/
		%feature("compactdefaultargs") StepBasic_PersonAndOrganization;
		%feature("autodoc", "Returns a personandorganization.

Returns
-------
None
") StepBasic_PersonAndOrganization;
		 StepBasic_PersonAndOrganization();

		/****************** Init ******************/
		/**** md5 signature: b09e43314a155ac05fd10eb59553dd0b ****/
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
		/**** md5 signature: ed6ecd08fe82ed16af95aa80cd7b4887 ****/
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
		/**** md5 signature: e1618aa9de19b80e82b07de21254d9a3 ****/
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
		/**** md5 signature: 88ef1ee565244dac5373566a016e971f ****/
		%feature("compactdefaultargs") TheOrganization;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepBasic_Organization>
") TheOrganization;
		opencascade::handle<StepBasic_Organization> TheOrganization();

		/****************** ThePerson ******************/
		/**** md5 signature: 447dff77998545a8b8359bcd2762ca3f ****/
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
		/**** md5 signature: 22a5f023211213aad8eb1f3d913aa34b ****/
		%feature("compactdefaultargs") AssignedPersonAndOrganization;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepBasic_PersonAndOrganization>
") AssignedPersonAndOrganization;
		opencascade::handle<StepBasic_PersonAndOrganization> AssignedPersonAndOrganization();

		/****************** Init ******************/
		/**** md5 signature: bae423e5da8af47deb5e4eb44fae14f4 ****/
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
		/**** md5 signature: 4deeef64ec09a06ac5538a1114e41d63 ****/
		%feature("compactdefaultargs") Role;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepBasic_PersonAndOrganizationRole>
") Role;
		opencascade::handle<StepBasic_PersonAndOrganizationRole> Role();

		/****************** SetAssignedPersonAndOrganization ******************/
		/**** md5 signature: 3a2602592eeb22c87b63c69a96152fea ****/
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
		/**** md5 signature: 66058b887b6c3eea253d368c5ea1c370 ****/
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
		/**** md5 signature: d34c620bd704e7b82efd1db4ee462715 ****/
		%feature("compactdefaultargs") StepBasic_PersonAndOrganizationRole;
		%feature("autodoc", "Returns a personandorganizationrole.

Returns
-------
None
") StepBasic_PersonAndOrganizationRole;
		 StepBasic_PersonAndOrganizationRole();

		/****************** Init ******************/
		/**** md5 signature: e10f4ffe4365262d2d9a5484d96325b8 ****/
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
		/**** md5 signature: 6bcb97f17b57cae0750fd29eac20499c ****/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") Name;
		opencascade::handle<TCollection_HAsciiString> Name();

		/****************** SetName ******************/
		/**** md5 signature: 1e0b00d9eb163c8a0cdbb986e2ee24f6 ****/
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
		/**** md5 signature: ef4feac3084f5ede269341f9d503fae7 ****/
		%feature("compactdefaultargs") StepBasic_PersonOrganizationSelect;
		%feature("autodoc", "Returns a personorganizationselect selecttype.

Returns
-------
None
") StepBasic_PersonOrganizationSelect;
		 StepBasic_PersonOrganizationSelect();

		/****************** CaseNum ******************/
		/**** md5 signature: f0e39118a9846e44ccd59de148215261 ****/
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
		/**** md5 signature: bc08f98b4bbc959f04b46794914bddbc ****/
		%feature("compactdefaultargs") Organization;
		%feature("autodoc", "Returns value as a organization (null if another type).

Returns
-------
opencascade::handle<StepBasic_Organization>
") Organization;
		opencascade::handle<StepBasic_Organization> Organization();

		/****************** Person ******************/
		/**** md5 signature: db1bca42c65d315013ded0034c6a2bd2 ****/
		%feature("compactdefaultargs") Person;
		%feature("autodoc", "Returns value as a person (null if another type).

Returns
-------
opencascade::handle<StepBasic_Person>
") Person;
		opencascade::handle<StepBasic_Person> Person();

		/****************** PersonAndOrganization ******************/
		/**** md5 signature: e5c5ce07cd61b93ed45ebeaf6fbce5f8 ****/
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
		/**** md5 signature: 7790fc362f2b6e308dd05e5f132357b9 ****/
		%feature("compactdefaultargs") StepBasic_Product;
		%feature("autodoc", "Returns a product.

Returns
-------
None
") StepBasic_Product;
		 StepBasic_Product();

		/****************** Description ******************/
		/**** md5 signature: 68309bdf9d57a000073490b39f8e7a41 ****/
		%feature("compactdefaultargs") Description;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") Description;
		opencascade::handle<TCollection_HAsciiString> Description();

		/****************** FrameOfReference ******************/
		/**** md5 signature: 64961dd3939a5e6959b59f076812ec6d ****/
		%feature("compactdefaultargs") FrameOfReference;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepBasic_HArray1OfProductContext>
") FrameOfReference;
		opencascade::handle<StepBasic_HArray1OfProductContext> FrameOfReference();

		/****************** FrameOfReferenceValue ******************/
		/**** md5 signature: 103a75a05d1aded825ec684fd082f3fa ****/
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
		/**** md5 signature: cad437aa1c6f9043742098c562124f9e ****/
		%feature("compactdefaultargs") Id;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") Id;
		opencascade::handle<TCollection_HAsciiString> Id();

		/****************** Init ******************/
		/**** md5 signature: 8a4b48b4c0d19bd9d5d62b5e2bdd1df1 ****/
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
		/**** md5 signature: 6bcb97f17b57cae0750fd29eac20499c ****/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") Name;
		opencascade::handle<TCollection_HAsciiString> Name();

		/****************** NbFrameOfReference ******************/
		/**** md5 signature: dabf8fc583d47eb3171cff76f427d413 ****/
		%feature("compactdefaultargs") NbFrameOfReference;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbFrameOfReference;
		Standard_Integer NbFrameOfReference();

		/****************** SetDescription ******************/
		/**** md5 signature: adddd13a906718df58a2eee683a382cf ****/
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
		/**** md5 signature: bdfbb9aebfb7db53ca9c85459ccb2e14 ****/
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
		/**** md5 signature: a589ed4c1f87cc154c05276cfb60f4ea ****/
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
		/**** md5 signature: 1e0b00d9eb163c8a0cdbb986e2ee24f6 ****/
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
		/**** md5 signature: 96dbaee693042385c8b9df767fb5fc0e ****/
		%feature("compactdefaultargs") StepBasic_ProductCategory;
		%feature("autodoc", "Returns a productcategory.

Returns
-------
None
") StepBasic_ProductCategory;
		 StepBasic_ProductCategory();

		/****************** Description ******************/
		/**** md5 signature: 68309bdf9d57a000073490b39f8e7a41 ****/
		%feature("compactdefaultargs") Description;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") Description;
		opencascade::handle<TCollection_HAsciiString> Description();

		/****************** HasDescription ******************/
		/**** md5 signature: 819ef9a3dced474861e1980d901a2978 ****/
		%feature("compactdefaultargs") HasDescription;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") HasDescription;
		Standard_Boolean HasDescription();

		/****************** Init ******************/
		/**** md5 signature: c348b8308ac15c9a349fa924f1645a3e ****/
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
		/**** md5 signature: 6bcb97f17b57cae0750fd29eac20499c ****/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") Name;
		opencascade::handle<TCollection_HAsciiString> Name();

		/****************** SetDescription ******************/
		/**** md5 signature: adddd13a906718df58a2eee683a382cf ****/
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
		/**** md5 signature: 1e0b00d9eb163c8a0cdbb986e2ee24f6 ****/
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
		/**** md5 signature: 30be31b794f5b69fcc1867431e79fbbe ****/
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
		/**** md5 signature: 6aa4e687780eb0cdcf23ee279160e110 ****/
		%feature("compactdefaultargs") StepBasic_ProductCategoryRelationship;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") StepBasic_ProductCategoryRelationship;
		 StepBasic_ProductCategoryRelationship();

		/****************** Category ******************/
		/**** md5 signature: 465a66e97f001c673af525caec1082d0 ****/
		%feature("compactdefaultargs") Category;
		%feature("autodoc", "Returns field category.

Returns
-------
opencascade::handle<StepBasic_ProductCategory>
") Category;
		opencascade::handle<StepBasic_ProductCategory> Category();

		/****************** Description ******************/
		/**** md5 signature: 68309bdf9d57a000073490b39f8e7a41 ****/
		%feature("compactdefaultargs") Description;
		%feature("autodoc", "Returns field description.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") Description;
		opencascade::handle<TCollection_HAsciiString> Description();

		/****************** HasDescription ******************/
		/**** md5 signature: 819ef9a3dced474861e1980d901a2978 ****/
		%feature("compactdefaultargs") HasDescription;
		%feature("autodoc", "Returns true if optional field description is defined.

Returns
-------
bool
") HasDescription;
		Standard_Boolean HasDescription();

		/****************** Init ******************/
		/**** md5 signature: 4faae5a600277d40cd473857a4db238d ****/
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
		/**** md5 signature: 6bcb97f17b57cae0750fd29eac20499c ****/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "Returns field name.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") Name;
		opencascade::handle<TCollection_HAsciiString> Name();

		/****************** SetCategory ******************/
		/**** md5 signature: 8036ec11e12da20fd64c27bc842cac9c ****/
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
		/**** md5 signature: 11ff45bab13c9c85c44619d6c4501da8 ****/
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
		/**** md5 signature: 1a85c1f4dd446039f14efe98df7aeb03 ****/
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
		/**** md5 signature: 0f4ce02f210be3dbdb5c8dd62c606f47 ****/
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
		/**** md5 signature: 2e38041dbe05070da406b4ca77574310 ****/
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
		/**** md5 signature: cb2da8f625d43b1e5c9026e6e79dc921 ****/
		%feature("compactdefaultargs") StepBasic_ProductDefinition;
		%feature("autodoc", "Returns a productdefinition.

Returns
-------
None
") StepBasic_ProductDefinition;
		 StepBasic_ProductDefinition();

		/****************** Description ******************/
		/**** md5 signature: 68309bdf9d57a000073490b39f8e7a41 ****/
		%feature("compactdefaultargs") Description;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") Description;
		opencascade::handle<TCollection_HAsciiString> Description();

		/****************** Formation ******************/
		/**** md5 signature: 94f885c6852d3b82159f586de46ddf88 ****/
		%feature("compactdefaultargs") Formation;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepBasic_ProductDefinitionFormation>
") Formation;
		opencascade::handle<StepBasic_ProductDefinitionFormation> Formation();

		/****************** FrameOfReference ******************/
		/**** md5 signature: e33148ea458cbc49744eebf19ce1015f ****/
		%feature("compactdefaultargs") FrameOfReference;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepBasic_ProductDefinitionContext>
") FrameOfReference;
		opencascade::handle<StepBasic_ProductDefinitionContext> FrameOfReference();

		/****************** Id ******************/
		/**** md5 signature: cad437aa1c6f9043742098c562124f9e ****/
		%feature("compactdefaultargs") Id;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") Id;
		opencascade::handle<TCollection_HAsciiString> Id();

		/****************** Init ******************/
		/**** md5 signature: 3402ab860a6def56b63102d13c67a93b ****/
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
		/**** md5 signature: adddd13a906718df58a2eee683a382cf ****/
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
		/**** md5 signature: 457246bc8801521565fcf1a1e2880677 ****/
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
		/**** md5 signature: 54e026fc02295c057acc6024c7f98e33 ****/
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
		/**** md5 signature: a589ed4c1f87cc154c05276cfb60f4ea ****/
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
		/**** md5 signature: bd5b521d38080a89f7f6c7451cb65b41 ****/
		%feature("compactdefaultargs") StepBasic_ProductDefinitionFormation;
		%feature("autodoc", "Returns a productdefinitionformation.

Returns
-------
None
") StepBasic_ProductDefinitionFormation;
		 StepBasic_ProductDefinitionFormation();

		/****************** Description ******************/
		/**** md5 signature: 68309bdf9d57a000073490b39f8e7a41 ****/
		%feature("compactdefaultargs") Description;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") Description;
		opencascade::handle<TCollection_HAsciiString> Description();

		/****************** Id ******************/
		/**** md5 signature: cad437aa1c6f9043742098c562124f9e ****/
		%feature("compactdefaultargs") Id;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") Id;
		opencascade::handle<TCollection_HAsciiString> Id();

		/****************** Init ******************/
		/**** md5 signature: 024816d46e92b16686e0d62b621622e1 ****/
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
		/**** md5 signature: 143e2db0361fa210057cbd055215da57 ****/
		%feature("compactdefaultargs") OfProduct;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepBasic_Product>
") OfProduct;
		opencascade::handle<StepBasic_Product> OfProduct();

		/****************** SetDescription ******************/
		/**** md5 signature: adddd13a906718df58a2eee683a382cf ****/
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
		/**** md5 signature: a589ed4c1f87cc154c05276cfb60f4ea ****/
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
		/**** md5 signature: 849d83e9a503dc13933bfd88a0a3f81f ****/
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
		/**** md5 signature: 5f8609c5dae46c8aac6844a71e58de5e ****/
		%feature("compactdefaultargs") StepBasic_ProductDefinitionFormationRelationship;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") StepBasic_ProductDefinitionFormationRelationship;
		 StepBasic_ProductDefinitionFormationRelationship();

		/****************** Description ******************/
		/**** md5 signature: 68309bdf9d57a000073490b39f8e7a41 ****/
		%feature("compactdefaultargs") Description;
		%feature("autodoc", "Returns field description.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") Description;
		opencascade::handle<TCollection_HAsciiString> Description();

		/****************** Id ******************/
		/**** md5 signature: cad437aa1c6f9043742098c562124f9e ****/
		%feature("compactdefaultargs") Id;
		%feature("autodoc", "Returns field id.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") Id;
		opencascade::handle<TCollection_HAsciiString> Id();

		/****************** Init ******************/
		/**** md5 signature: ee8441cd060422d5ca65efa5e9cd41da ****/
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
		/**** md5 signature: 6bcb97f17b57cae0750fd29eac20499c ****/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "Returns field name.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") Name;
		opencascade::handle<TCollection_HAsciiString> Name();

		/****************** RelatedProductDefinitionFormation ******************/
		/**** md5 signature: 5a83e0ab8bf222bff69aecf2f6bb7dc7 ****/
		%feature("compactdefaultargs") RelatedProductDefinitionFormation;
		%feature("autodoc", "Returns field relatedproductdefinitionformation.

Returns
-------
opencascade::handle<StepBasic_ProductDefinitionFormation>
") RelatedProductDefinitionFormation;
		opencascade::handle<StepBasic_ProductDefinitionFormation> RelatedProductDefinitionFormation();

		/****************** RelatingProductDefinitionFormation ******************/
		/**** md5 signature: fd41fb35afff5e59ba9d9e80b1be7b8b ****/
		%feature("compactdefaultargs") RelatingProductDefinitionFormation;
		%feature("autodoc", "Returns field relatingproductdefinitionformation.

Returns
-------
opencascade::handle<StepBasic_ProductDefinitionFormation>
") RelatingProductDefinitionFormation;
		opencascade::handle<StepBasic_ProductDefinitionFormation> RelatingProductDefinitionFormation();

		/****************** SetDescription ******************/
		/**** md5 signature: 11ff45bab13c9c85c44619d6c4501da8 ****/
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
		/**** md5 signature: 779c5dce2dcbd218d648cf0dfb829a83 ****/
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
		/**** md5 signature: 1a85c1f4dd446039f14efe98df7aeb03 ****/
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
		/**** md5 signature: ab61ba0bd318edec5e886647b21c4f43 ****/
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
		/**** md5 signature: 73adc113315a81e15ac03ae9b76fb9d6 ****/
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
		/**** md5 signature: 581d009558c1e3bfcf805c9cf55635de ****/
		%feature("compactdefaultargs") StepBasic_ProductDefinitionOrReference;
		%feature("autodoc", "Returns a productdefinitionorreference selecttype.

Returns
-------
None
") StepBasic_ProductDefinitionOrReference;
		 StepBasic_ProductDefinitionOrReference();

		/****************** CaseNum ******************/
		/**** md5 signature: f0e39118a9846e44ccd59de148215261 ****/
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
		/**** md5 signature: d43b5ca42d8380c05af7f64fb041e89b ****/
		%feature("compactdefaultargs") ProductDefinition;
		%feature("autodoc", "Returns value as a productdefinition (null if another type).

Returns
-------
opencascade::handle<StepBasic_ProductDefinition>
") ProductDefinition;
		opencascade::handle<StepBasic_ProductDefinition> ProductDefinition();

		/****************** ProductDefinitionReference ******************/
		/**** md5 signature: e0743e05c274f7f166efee9beb39073b ****/
		%feature("compactdefaultargs") ProductDefinitionReference;
		%feature("autodoc", "Returns value as a productdefinitionreference (null if another type).

Returns
-------
opencascade::handle<StepBasic_ProductDefinitionReference>
") ProductDefinitionReference;
		opencascade::handle<StepBasic_ProductDefinitionReference> ProductDefinitionReference();

		/****************** ProductDefinitionReferenceWithLocalRepresentation ******************/
		/**** md5 signature: 35937fd7fc1ca9917772ae01add65741 ****/
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
		/**** md5 signature: ad970a267707023c0ac5719c2701ab74 ****/
		%feature("compactdefaultargs") StepBasic_ProductDefinitionReference;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") StepBasic_ProductDefinitionReference;
		 StepBasic_ProductDefinitionReference();

		/****************** HasIdOwningOrganizationName ******************/
		/**** md5 signature: 66e52c77178fafbc4ad4e8a0bab1804c ****/
		%feature("compactdefaultargs") HasIdOwningOrganizationName;
		%feature("autodoc", "Returns true if idowningorganizationname exists.

Returns
-------
bool
") HasIdOwningOrganizationName;
		Standard_Boolean HasIdOwningOrganizationName();

		/****************** IdOwningOrganizationName ******************/
		/**** md5 signature: 7e5eed935bf1490b517cfdc2f860bc54 ****/
		%feature("compactdefaultargs") IdOwningOrganizationName;
		%feature("autodoc", "Returns field idowningorganizationname.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") IdOwningOrganizationName;
		opencascade::handle<TCollection_HAsciiString> IdOwningOrganizationName();

		/****************** Init ******************/
		/**** md5 signature: b95d2fa73196c76c045f2228228e7b28 ****/
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
		/**** md5 signature: 3b1781b5d320eb5b31b95f959456dba0 ****/
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
		/**** md5 signature: 4cec926d9143b0fc7d32bdfc5cc93b08 ****/
		%feature("compactdefaultargs") ProductDefinitionFormationId;
		%feature("autodoc", "Returns field productdefinitionformationid.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") ProductDefinitionFormationId;
		opencascade::handle<TCollection_HAsciiString> ProductDefinitionFormationId();

		/****************** ProductDefinitionId ******************/
		/**** md5 signature: e39c99c51b8f0bec44e4fa68def36a90 ****/
		%feature("compactdefaultargs") ProductDefinitionId;
		%feature("autodoc", "Returns field productdefinitionid.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") ProductDefinitionId;
		opencascade::handle<TCollection_HAsciiString> ProductDefinitionId();

		/****************** ProductId ******************/
		/**** md5 signature: d3be9527e4aa640af7c2ba08ce58e447 ****/
		%feature("compactdefaultargs") ProductId;
		%feature("autodoc", "Returns field productid.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") ProductId;
		opencascade::handle<TCollection_HAsciiString> ProductId();

		/****************** SetIdOwningOrganizationName ******************/
		/**** md5 signature: 00dd78746fa0d552d70d20fe18510c84 ****/
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
		/**** md5 signature: 92c57e8626d615970d4e29ca7f01c5cc ****/
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
		/**** md5 signature: 5b2545a2f62b554ed4d4ea8ab66bd364 ****/
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
		/**** md5 signature: bbe3a7a51f9a4b33100ae1bc672365c6 ****/
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
		/**** md5 signature: d656e905f131b35a69061b2a857e75e0 ****/
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
		/**** md5 signature: a13a47fce462914f8ac90f867f0370c7 ****/
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
		/**** md5 signature: cdbbeb999b5187dd5a45f8cf19bd2c44 ****/
		%feature("compactdefaultargs") StepBasic_ProductDefinitionRelationship;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") StepBasic_ProductDefinitionRelationship;
		 StepBasic_ProductDefinitionRelationship();

		/****************** Description ******************/
		/**** md5 signature: 68309bdf9d57a000073490b39f8e7a41 ****/
		%feature("compactdefaultargs") Description;
		%feature("autodoc", "Returns field description.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") Description;
		opencascade::handle<TCollection_HAsciiString> Description();

		/****************** HasDescription ******************/
		/**** md5 signature: 819ef9a3dced474861e1980d901a2978 ****/
		%feature("compactdefaultargs") HasDescription;
		%feature("autodoc", "Returns true if optional field description is defined.

Returns
-------
bool
") HasDescription;
		Standard_Boolean HasDescription();

		/****************** Id ******************/
		/**** md5 signature: cad437aa1c6f9043742098c562124f9e ****/
		%feature("compactdefaultargs") Id;
		%feature("autodoc", "Returns field id.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") Id;
		opencascade::handle<TCollection_HAsciiString> Id();

		/****************** Init ******************/
		/**** md5 signature: 48f236f89e0f9f1b7e60c4a445879fb8 ****/
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
		/**** md5 signature: 2db6e2142f3da60ff4ac94ddb7fa12d1 ****/
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
		/**** md5 signature: 6bcb97f17b57cae0750fd29eac20499c ****/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "Returns field name.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") Name;
		opencascade::handle<TCollection_HAsciiString> Name();

		/****************** RelatedProductDefinition ******************/
		/**** md5 signature: a7ab77a49160b81991d1bf914d11090c ****/
		%feature("compactdefaultargs") RelatedProductDefinition;
		%feature("autodoc", "Returns field relatedproductdefinition.

Returns
-------
opencascade::handle<StepBasic_ProductDefinition>
") RelatedProductDefinition;
		opencascade::handle<StepBasic_ProductDefinition> RelatedProductDefinition();

		/****************** RelatedProductDefinitionAP242 ******************/
		/**** md5 signature: a327752031849aab6cca65e27a4a89dc ****/
		%feature("compactdefaultargs") RelatedProductDefinitionAP242;
		%feature("autodoc", "Returns field relatedproductdefinition in ap242.

Returns
-------
StepBasic_ProductDefinitionOrReference
") RelatedProductDefinitionAP242;
		StepBasic_ProductDefinitionOrReference RelatedProductDefinitionAP242();

		/****************** RelatingProductDefinition ******************/
		/**** md5 signature: 7fcfccb1097faf74a4b0facb72a403ea ****/
		%feature("compactdefaultargs") RelatingProductDefinition;
		%feature("autodoc", "Returns field relatingproductdefinition.

Returns
-------
opencascade::handle<StepBasic_ProductDefinition>
") RelatingProductDefinition;
		opencascade::handle<StepBasic_ProductDefinition> RelatingProductDefinition();

		/****************** RelatingProductDefinitionAP242 ******************/
		/**** md5 signature: 054c4652f0a09168780ec93d2f2443b9 ****/
		%feature("compactdefaultargs") RelatingProductDefinitionAP242;
		%feature("autodoc", "Returns field relatingproductdefinition in ap242.

Returns
-------
StepBasic_ProductDefinitionOrReference
") RelatingProductDefinitionAP242;
		StepBasic_ProductDefinitionOrReference RelatingProductDefinitionAP242();

		/****************** SetDescription ******************/
		/**** md5 signature: 11ff45bab13c9c85c44619d6c4501da8 ****/
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
		/**** md5 signature: 779c5dce2dcbd218d648cf0dfb829a83 ****/
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
		/**** md5 signature: 1a85c1f4dd446039f14efe98df7aeb03 ****/
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
		/**** md5 signature: 938136c489259690ec4e83451f0de3ee ****/
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
		/**** md5 signature: 1e4b08b531a6bc9ef6eb61c7c4963655 ****/
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
		/**** md5 signature: 359affd56caf20b07f2d71b1bbdf3177 ****/
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
		/**** md5 signature: 91d7faf8cb692c0d2ce8aa698258ea04 ****/
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
		/**** md5 signature: 18c0f3da5115e635a4c7f980ca4013b4 ****/
		%feature("compactdefaultargs") StepBasic_ProductOrFormationOrDefinition;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") StepBasic_ProductOrFormationOrDefinition;
		 StepBasic_ProductOrFormationOrDefinition();

		/****************** CaseNum ******************/
		/**** md5 signature: f0e39118a9846e44ccd59de148215261 ****/
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
		/**** md5 signature: e8c7e89afa6b95e852c44498904e61e4 ****/
		%feature("compactdefaultargs") Product;
		%feature("autodoc", "Returns value as product (or null if another type).

Returns
-------
opencascade::handle<StepBasic_Product>
") Product;
		opencascade::handle<StepBasic_Product> Product();

		/****************** ProductDefinition ******************/
		/**** md5 signature: d43b5ca42d8380c05af7f64fb041e89b ****/
		%feature("compactdefaultargs") ProductDefinition;
		%feature("autodoc", "Returns value as productdefinition (or null if another type).

Returns
-------
opencascade::handle<StepBasic_ProductDefinition>
") ProductDefinition;
		opencascade::handle<StepBasic_ProductDefinition> ProductDefinition();

		/****************** ProductDefinitionFormation ******************/
		/**** md5 signature: 549b153d5236bb5dda717eed81e28565 ****/
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
		/**** md5 signature: c2fadb8653f6047d62a3702a02b47adb ****/
		%feature("compactdefaultargs") StepBasic_RoleAssociation;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") StepBasic_RoleAssociation;
		 StepBasic_RoleAssociation();

		/****************** Init ******************/
		/**** md5 signature: 446522e66562d956791603bb249d1349 ****/
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
		/**** md5 signature: 5eb119ca3cd46ce8bb2f7e9ae533564f ****/
		%feature("compactdefaultargs") ItemWithRole;
		%feature("autodoc", "Returns field itemwithrole.

Returns
-------
StepBasic_RoleSelect
") ItemWithRole;
		StepBasic_RoleSelect ItemWithRole();

		/****************** Role ******************/
		/**** md5 signature: a05332a66176fbfdad74249aa95775ca ****/
		%feature("compactdefaultargs") Role;
		%feature("autodoc", "Returns field role.

Returns
-------
opencascade::handle<StepBasic_ObjectRole>
") Role;
		opencascade::handle<StepBasic_ObjectRole> Role();

		/****************** SetItemWithRole ******************/
		/**** md5 signature: be266bf62f756ada2edb5854f2e9793d ****/
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
		/**** md5 signature: 46043cb8c399972a3234cb666a07bb55 ****/
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
		/**** md5 signature: c7b69b2896e10181702e8986eecba393 ****/
		%feature("compactdefaultargs") StepBasic_RoleSelect;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") StepBasic_RoleSelect;
		 StepBasic_RoleSelect();

		/****************** ActionAssignment ******************/
		/**** md5 signature: 713d0359a8f8ca85173ab0f6a34ee64a ****/
		%feature("compactdefaultargs") ActionAssignment;
		%feature("autodoc", "Returns value as actionassignment (or null if another type).

Returns
-------
opencascade::handle<StepBasic_ActionAssignment>
") ActionAssignment;
		opencascade::handle<StepBasic_ActionAssignment> ActionAssignment();

		/****************** ActionRequestAssignment ******************/
		/**** md5 signature: ae95133562e6384f39e98074053d1e6d ****/
		%feature("compactdefaultargs") ActionRequestAssignment;
		%feature("autodoc", "Returns value as actionrequestassignment (or null if another type).

Returns
-------
opencascade::handle<StepBasic_ActionRequestAssignment>
") ActionRequestAssignment;
		opencascade::handle<StepBasic_ActionRequestAssignment> ActionRequestAssignment();

		/****************** ApprovalAssignment ******************/
		/**** md5 signature: d8cec1bb364c41aa0c2de96320927ca3 ****/
		%feature("compactdefaultargs") ApprovalAssignment;
		%feature("autodoc", "Returns value as approvalassignment (or null if another type).

Returns
-------
opencascade::handle<StepBasic_ApprovalAssignment>
") ApprovalAssignment;
		opencascade::handle<StepBasic_ApprovalAssignment> ApprovalAssignment();

		/****************** ApprovalDateTime ******************/
		/**** md5 signature: e39b66926b3ddb0466965160ee71baa3 ****/
		%feature("compactdefaultargs") ApprovalDateTime;
		%feature("autodoc", "Returns value as approvaldatetime (or null if another type).

Returns
-------
opencascade::handle<StepBasic_ApprovalDateTime>
") ApprovalDateTime;
		opencascade::handle<StepBasic_ApprovalDateTime> ApprovalDateTime();

		/****************** CaseNum ******************/
		/**** md5 signature: f0e39118a9846e44ccd59de148215261 ****/
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
		/**** md5 signature: 831dbe663b31a28f1cfe11e06089ae51 ****/
		%feature("compactdefaultargs") CertificationAssignment;
		%feature("autodoc", "Returns value as certificationassignment (or null if another type).

Returns
-------
opencascade::handle<StepBasic_CertificationAssignment>
") CertificationAssignment;
		opencascade::handle<StepBasic_CertificationAssignment> CertificationAssignment();

		/****************** ContractAssignment ******************/
		/**** md5 signature: e94417efc77812189aa960eb1f882868 ****/
		%feature("compactdefaultargs") ContractAssignment;
		%feature("autodoc", "Returns value as contractassignment (or null if another type).

Returns
-------
opencascade::handle<StepBasic_ContractAssignment>
") ContractAssignment;
		opencascade::handle<StepBasic_ContractAssignment> ContractAssignment();

		/****************** DocumentReference ******************/
		/**** md5 signature: b1ae34bf25fd0f9c620478a4cf314343 ****/
		%feature("compactdefaultargs") DocumentReference;
		%feature("autodoc", "Returns value as documentreference (or null if another type).

Returns
-------
opencascade::handle<StepBasic_DocumentReference>
") DocumentReference;
		opencascade::handle<StepBasic_DocumentReference> DocumentReference();

		/****************** EffectivityAssignment ******************/
		/**** md5 signature: 4a3312d7b94a680d7029924c9582beb7 ****/
		%feature("compactdefaultargs") EffectivityAssignment;
		%feature("autodoc", "Returns value as effectivityassignment (or null if another type).

Returns
-------
opencascade::handle<StepBasic_EffectivityAssignment>
") EffectivityAssignment;
		opencascade::handle<StepBasic_EffectivityAssignment> EffectivityAssignment();

		/****************** GroupAssignment ******************/
		/**** md5 signature: df42ba1149841c0af5bb43580fab343e ****/
		%feature("compactdefaultargs") GroupAssignment;
		%feature("autodoc", "Returns value as groupassignment (or null if another type).

Returns
-------
opencascade::handle<StepBasic_GroupAssignment>
") GroupAssignment;
		opencascade::handle<StepBasic_GroupAssignment> GroupAssignment();

		/****************** NameAssignment ******************/
		/**** md5 signature: 59a0e3e46a9cec47911526c791d84cd9 ****/
		%feature("compactdefaultargs") NameAssignment;
		%feature("autodoc", "Returns value as nameassignment (or null if another type).

Returns
-------
opencascade::handle<StepBasic_NameAssignment>
") NameAssignment;
		opencascade::handle<StepBasic_NameAssignment> NameAssignment();

		/****************** SecurityClassificationAssignment ******************/
		/**** md5 signature: f66f0d15c08bf991994d084470f5365b ****/
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
		/**** md5 signature: ef04d69822ba87c6b008889d8d3551c5 ****/
		%feature("compactdefaultargs") StepBasic_SecurityClassification;
		%feature("autodoc", "Returns a securityclassification.

Returns
-------
None
") StepBasic_SecurityClassification;
		 StepBasic_SecurityClassification();

		/****************** Init ******************/
		/**** md5 signature: 4275099b27062c1b5474f561b5a1a265 ****/
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
		/**** md5 signature: 6bcb97f17b57cae0750fd29eac20499c ****/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") Name;
		opencascade::handle<TCollection_HAsciiString> Name();

		/****************** Purpose ******************/
		/**** md5 signature: f96745f44705150c3273c06fb78fc3cb ****/
		%feature("compactdefaultargs") Purpose;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") Purpose;
		opencascade::handle<TCollection_HAsciiString> Purpose();

		/****************** SecurityLevel ******************/
		/**** md5 signature: 34f7227567e92290153610b45c004df4 ****/
		%feature("compactdefaultargs") SecurityLevel;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepBasic_SecurityClassificationLevel>
") SecurityLevel;
		opencascade::handle<StepBasic_SecurityClassificationLevel> SecurityLevel();

		/****************** SetName ******************/
		/**** md5 signature: 1e0b00d9eb163c8a0cdbb986e2ee24f6 ****/
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
		/**** md5 signature: 29140a8e429bd79cd40a6a01de3754bd ****/
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
		/**** md5 signature: ccb8f06e3546290181602af07d013b89 ****/
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
		/**** md5 signature: 145b088765b5c30f7c8ce8eab3574f79 ****/
		%feature("compactdefaultargs") AssignedSecurityClassification;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepBasic_SecurityClassification>
") AssignedSecurityClassification;
		opencascade::handle<StepBasic_SecurityClassification> AssignedSecurityClassification();

		/****************** Init ******************/
		/**** md5 signature: 34e4b1087c18538fe2af4c71d1385488 ****/
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
		/**** md5 signature: fc9f6dc7c2033fdfa06110416d9678e8 ****/
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
		/**** md5 signature: f4f3a9f95b0a5ff8408950e1bde800d1 ****/
		%feature("compactdefaultargs") StepBasic_SecurityClassificationLevel;
		%feature("autodoc", "Returns a securityclassificationlevel.

Returns
-------
None
") StepBasic_SecurityClassificationLevel;
		 StepBasic_SecurityClassificationLevel();

		/****************** Init ******************/
		/**** md5 signature: e10f4ffe4365262d2d9a5484d96325b8 ****/
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
		/**** md5 signature: 6bcb97f17b57cae0750fd29eac20499c ****/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") Name;
		opencascade::handle<TCollection_HAsciiString> Name();

		/****************** SetName ******************/
		/**** md5 signature: 1e0b00d9eb163c8a0cdbb986e2ee24f6 ****/
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
		/**** md5 signature: 45664af80c08f3a14679a4b861c2dec9 ****/
		%feature("compactdefaultargs") StepBasic_SizeMember;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") StepBasic_SizeMember;
		 StepBasic_SizeMember();

		/****************** HasName ******************/
		/**** md5 signature: c4b2dbd737f3c98314fdb7955ce91c2a ****/
		%feature("compactdefaultargs") HasName;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") HasName;
		virtual Standard_Boolean HasName();

		/****************** Name ******************/
		/**** md5 signature: d654a4ee9a75d24a9c3f33853f908999 ****/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "No available documentation.

Returns
-------
char *
") Name;
		virtual const char * Name();

		/****************** SetName ******************/
		/**** md5 signature: cb088c8a5caf9447945830483c3112e7 ****/
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
		/**** md5 signature: 8a71af98685b37e168b4b864a4dfb3e8 ****/
		%feature("compactdefaultargs") StepBasic_SizeSelect;
		%feature("autodoc", "Returns a sizeselect selecttype.

Returns
-------
None
") StepBasic_SizeSelect;
		 StepBasic_SizeSelect();

		/****************** CaseMem ******************/
		/**** md5 signature: 26af6570a62efb94f2e4c31f1b319112 ****/
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
		/**** md5 signature: b9dbcdb5b972500c66bc8bc08f651d0a ****/
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
		/**** md5 signature: ae7a49ea52744ae449d83e823e9a6da7 ****/
		%feature("compactdefaultargs") NewMember;
		%feature("autodoc", "Returns a sizemember (positive_length_measure) as preferred.

Returns
-------
opencascade::handle<StepData_SelectMember>
") NewMember;
		virtual opencascade::handle<StepData_SelectMember> NewMember();

		/****************** RealValue ******************/
		/**** md5 signature: 8a0c7a2ab7b53f6fb68a06ec0dbc6aa7 ****/
		%feature("compactdefaultargs") RealValue;
		%feature("autodoc", "Returns value as a real (null if another type).

Returns
-------
float
") RealValue;
		Standard_Real RealValue();

		/****************** SetRealValue ******************/
		/**** md5 signature: 2180c43020b4c001ad1a46ce769cb31c ****/
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
		/**** md5 signature: f50c54aa98f03f5dd3dbdb623e6d956c ****/
		%feature("compactdefaultargs") StepBasic_SourceItem;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") StepBasic_SourceItem;
		 StepBasic_SourceItem();

		/****************** CaseNum ******************/
		/**** md5 signature: b9dbcdb5b972500c66bc8bc08f651d0a ****/
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
		/**** md5 signature: 386fefa275c40386efbae4b683607265 ****/
		%feature("compactdefaultargs") Identifier;
		%feature("autodoc", "Returns value as identifier (or null if another type).

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") Identifier;
		opencascade::handle<TCollection_HAsciiString> Identifier();

		/****************** NewMember ******************/
		/**** md5 signature: ae7a49ea52744ae449d83e823e9a6da7 ****/
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
		/**** md5 signature: fbb7dba986b23cf338a253729c4cbfa7 ****/
		%feature("compactdefaultargs") StepBasic_Unit;
		%feature("autodoc", "Creates empty object.

Returns
-------
None
") StepBasic_Unit;
		 StepBasic_Unit();

		/****************** CaseNum ******************/
		/**** md5 signature: f0e39118a9846e44ccd59de148215261 ****/
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
		/**** md5 signature: 26d48c35310c30ce58c9a7cb4905c600 ****/
		%feature("compactdefaultargs") DerivedUnit;
		%feature("autodoc", "Returns value as a derivedunit (null if another type).

Returns
-------
opencascade::handle<StepBasic_DerivedUnit>
") DerivedUnit;
		opencascade::handle<StepBasic_DerivedUnit> DerivedUnit();

		/****************** NamedUnit ******************/
		/**** md5 signature: 6d23dd3cde39897313e3330c02aacaad ****/
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
		/**** md5 signature: c6425c8d9e217cc1580eaf613cd2420e ****/
		%feature("compactdefaultargs") StepBasic_VersionedActionRequest;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") StepBasic_VersionedActionRequest;
		 StepBasic_VersionedActionRequest();

		/****************** Description ******************/
		/**** md5 signature: 68309bdf9d57a000073490b39f8e7a41 ****/
		%feature("compactdefaultargs") Description;
		%feature("autodoc", "Returns field description.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") Description;
		opencascade::handle<TCollection_HAsciiString> Description();

		/****************** HasDescription ******************/
		/**** md5 signature: 819ef9a3dced474861e1980d901a2978 ****/
		%feature("compactdefaultargs") HasDescription;
		%feature("autodoc", "Returns true if optional field description is defined.

Returns
-------
bool
") HasDescription;
		Standard_Boolean HasDescription();

		/****************** Id ******************/
		/**** md5 signature: cad437aa1c6f9043742098c562124f9e ****/
		%feature("compactdefaultargs") Id;
		%feature("autodoc", "Returns field id.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") Id;
		opencascade::handle<TCollection_HAsciiString> Id();

		/****************** Init ******************/
		/**** md5 signature: 6adb277f595c7fd98a3237570c0e8859 ****/
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
		/**** md5 signature: f96745f44705150c3273c06fb78fc3cb ****/
		%feature("compactdefaultargs") Purpose;
		%feature("autodoc", "Returns field purpose.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") Purpose;
		opencascade::handle<TCollection_HAsciiString> Purpose();

		/****************** SetDescription ******************/
		/**** md5 signature: 11ff45bab13c9c85c44619d6c4501da8 ****/
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
		/**** md5 signature: 779c5dce2dcbd218d648cf0dfb829a83 ****/
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
		/**** md5 signature: e2e7302d9004f014ab43f84f266372e2 ****/
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
		/**** md5 signature: a942932c2e95b52568fd9e21810ee6f7 ****/
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
		/**** md5 signature: 5c07c53ebf0b27daa5e97d0f9dc2a456 ****/
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
		/**** md5 signature: 73e57fc5ffe450c6d0e800530457acfe ****/
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
		/**** md5 signature: e1bf38ccd00745e5c572070895700d3c ****/
		%feature("compactdefaultargs") StepBasic_CalendarDate;
		%feature("autodoc", "Returns a calendardate.

Returns
-------
None
") StepBasic_CalendarDate;
		 StepBasic_CalendarDate();

		/****************** DayComponent ******************/
		/**** md5 signature: 3ca7721e5937e191f94c2f5ecee1c9a8 ****/
		%feature("compactdefaultargs") DayComponent;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") DayComponent;
		Standard_Integer DayComponent();

		/****************** Init ******************/
		/**** md5 signature: 9c21fad5af3cafe03c6603d271eff489 ****/
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
		/**** md5 signature: 84d95fc4a04da1f7f99166d277a9f9a1 ****/
		%feature("compactdefaultargs") MonthComponent;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") MonthComponent;
		Standard_Integer MonthComponent();

		/****************** SetDayComponent ******************/
		/**** md5 signature: 599666a06025a8440c3915e142f8559a ****/
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
		/**** md5 signature: 7bea07a1c9bd41350c031c723a522ac3 ****/
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
		/**** md5 signature: 62f7ef41692812fcca5a53f46e66bf72 ****/
		%feature("compactdefaultargs") StepBasic_ConversionBasedUnit;
		%feature("autodoc", "Returns a conversionbasedunit.

Returns
-------
None
") StepBasic_ConversionBasedUnit;
		 StepBasic_ConversionBasedUnit();

		/****************** ConversionFactor ******************/
		/**** md5 signature: 98733960524f2b12331326efed41b780 ****/
		%feature("compactdefaultargs") ConversionFactor;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepBasic_MeasureWithUnit>
") ConversionFactor;
		opencascade::handle<StepBasic_MeasureWithUnit> ConversionFactor();

		/****************** Init ******************/
		/**** md5 signature: 230b648890e9efa5eef6d2d214b37499 ****/
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
		/**** md5 signature: 6bcb97f17b57cae0750fd29eac20499c ****/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") Name;
		opencascade::handle<TCollection_HAsciiString> Name();

		/****************** SetConversionFactor ******************/
		/**** md5 signature: 69bcf62438994c98276236b10dc73ad7 ****/
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
		/**** md5 signature: 1e0b00d9eb163c8a0cdbb986e2ee24f6 ****/
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
		/**** md5 signature: b32671da828ea0011f4c0e8075874b22 ****/
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
		/**** md5 signature: f23c109498123fef2d64875336473344 ****/
		%feature("compactdefaultargs") StepBasic_DocumentFile;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") StepBasic_DocumentFile;
		 StepBasic_DocumentFile();

		/****************** CharacterizedObject ******************/
		/**** md5 signature: e518475515030a2f9db7a2227e2fe8f9 ****/
		%feature("compactdefaultargs") CharacterizedObject;
		%feature("autodoc", "Returns data for supertype characterizedobject.

Returns
-------
opencascade::handle<StepBasic_CharacterizedObject>
") CharacterizedObject;
		opencascade::handle<StepBasic_CharacterizedObject> CharacterizedObject();

		/****************** Init ******************/
		/**** md5 signature: e6130c458940e6c1bd73fd00044284ba ****/
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
		/**** md5 signature: c032a3a7a6c2c39e4d00bb4dc86d97ab ****/
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
		/**** md5 signature: 2d0a72a3b41329845833993bb249e53d ****/
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
		/**** md5 signature: 421364749dd02b04bf3798e0a8a8ce21 ****/
		%feature("compactdefaultargs") StepBasic_ExternalIdentificationAssignment;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") StepBasic_ExternalIdentificationAssignment;
		 StepBasic_ExternalIdentificationAssignment();

		/****************** Init ******************/
		/**** md5 signature: 13abcb3641ba0bb47f47dd775dd2b8ae ****/
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
		/**** md5 signature: 2e83538f32b5b2a0a6a43a552fe31327 ****/
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
		/**** md5 signature: 8b90a9ea46f21d4e9d0fbb6449a05fa1 ****/
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
		/**** md5 signature: 1fb76cc685df76d201af40e574e564a6 ****/
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
		/**** md5 signature: 570efd4fead2ffd8f6cebf51b01e7f12 ****/
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
		/**** md5 signature: 78c0c3b1a1758eea389406c5675332b8 ****/
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
		/**** md5 signature: 2f661b14c11ebb5c7b448f3dbecd3113 ****/
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
		/**** md5 signature: 4e3a71d43377a529db80c46c05bc50c8 ****/
		%feature("compactdefaultargs") StepBasic_OrdinalDate;
		%feature("autodoc", "Returns a ordinaldate.

Returns
-------
None
") StepBasic_OrdinalDate;
		 StepBasic_OrdinalDate();

		/****************** DayComponent ******************/
		/**** md5 signature: 3ca7721e5937e191f94c2f5ecee1c9a8 ****/
		%feature("compactdefaultargs") DayComponent;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") DayComponent;
		Standard_Integer DayComponent();

		/****************** Init ******************/
		/**** md5 signature: c5517f379a9ce8be968e2b61c9fbc851 ****/
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
		/**** md5 signature: 599666a06025a8440c3915e142f8559a ****/
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
		/**** md5 signature: 071669fde078fe82f1cfe1598a501f67 ****/
		%feature("compactdefaultargs") StepBasic_OrganizationalAddress;
		%feature("autodoc", "Returns a organizationaladdress.

Returns
-------
None
") StepBasic_OrganizationalAddress;
		 StepBasic_OrganizationalAddress();

		/****************** Description ******************/
		/**** md5 signature: 68309bdf9d57a000073490b39f8e7a41 ****/
		%feature("compactdefaultargs") Description;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") Description;
		opencascade::handle<TCollection_HAsciiString> Description();

		/****************** Init ******************/
		/**** md5 signature: ccaae03165ab1a12bdb7a1ace15ee396 ****/
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
		/**** md5 signature: 58cca92ad0d9a651a9d655d52a18c36a ****/
		%feature("compactdefaultargs") NbOrganizations;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbOrganizations;
		Standard_Integer NbOrganizations();

		/****************** Organizations ******************/
		/**** md5 signature: 924e32ad252cd9d50fdb6040bc54a79c ****/
		%feature("compactdefaultargs") Organizations;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepBasic_HArray1OfOrganization>
") Organizations;
		opencascade::handle<StepBasic_HArray1OfOrganization> Organizations();

		/****************** OrganizationsValue ******************/
		/**** md5 signature: 4adae1500f1d8d1283591a940c62c887 ****/
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
		/**** md5 signature: adddd13a906718df58a2eee683a382cf ****/
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
		/**** md5 signature: 18a3f0b32682ed1758b75b50c092ea7c ****/
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
		/**** md5 signature: f6670f5325d7692059c366e7ad2227b8 ****/
		%feature("compactdefaultargs") StepBasic_PersonalAddress;
		%feature("autodoc", "Returns a personaladdress.

Returns
-------
None
") StepBasic_PersonalAddress;
		 StepBasic_PersonalAddress();

		/****************** Description ******************/
		/**** md5 signature: 68309bdf9d57a000073490b39f8e7a41 ****/
		%feature("compactdefaultargs") Description;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") Description;
		opencascade::handle<TCollection_HAsciiString> Description();

		/****************** Init ******************/
		/**** md5 signature: 687c1ee4d41ddbfa8eac972407b6a00d ****/
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
		/**** md5 signature: 076af9501e66b6b44666d05e1da08dc9 ****/
		%feature("compactdefaultargs") NbPeople;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbPeople;
		Standard_Integer NbPeople();

		/****************** People ******************/
		/**** md5 signature: 61214df2a5fb1a2d6db2a91252f3990a ****/
		%feature("compactdefaultargs") People;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepBasic_HArray1OfPerson>
") People;
		opencascade::handle<StepBasic_HArray1OfPerson> People();

		/****************** PeopleValue ******************/
		/**** md5 signature: 93a18090eaba871d51c66c2a43c9e00e ****/
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
		/**** md5 signature: adddd13a906718df58a2eee683a382cf ****/
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
		/**** md5 signature: 83d80afa04bc7dde575b6846eed3d8dd ****/
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
		/**** md5 signature: e261597a738525c474df8e71f527b01e ****/
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
		/**** md5 signature: 6bc2a43e4be71fb0c166ed652f064743 ****/
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
		/**** md5 signature: 62df6d69e0fbb13c07e1dce33e456197 ****/
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
		/**** md5 signature: 44f94a9b8c2116ea44967bc2663b1c23 ****/
		%feature("compactdefaultargs") StepBasic_ProductConceptContext;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") StepBasic_ProductConceptContext;
		 StepBasic_ProductConceptContext();

		/****************** Init ******************/
		/**** md5 signature: c758a45d98a7b12c6572a1c72e386a1e ****/
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
		/**** md5 signature: c735ef347aa388846f1b3bbf46b80ab5 ****/
		%feature("compactdefaultargs") MarketSegmentType;
		%feature("autodoc", "Returns field marketsegmenttype.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") MarketSegmentType;
		opencascade::handle<TCollection_HAsciiString> MarketSegmentType();

		/****************** SetMarketSegmentType ******************/
		/**** md5 signature: 2b4486a4e81e71df45298bea8ec49017 ****/
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
		/**** md5 signature: 46e1fb19a02e6f17a2790b0adfed1148 ****/
		%feature("compactdefaultargs") StepBasic_ProductContext;
		%feature("autodoc", "Returns a productcontext.

Returns
-------
None
") StepBasic_ProductContext;
		 StepBasic_ProductContext();

		/****************** DisciplineType ******************/
		/**** md5 signature: 1178d05d94bcd211c9abfb5237b4dbb0 ****/
		%feature("compactdefaultargs") DisciplineType;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") DisciplineType;
		opencascade::handle<TCollection_HAsciiString> DisciplineType();

		/****************** Init ******************/
		/**** md5 signature: 34ae14a230273c724386f092d1029a8e ****/
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
		/**** md5 signature: 655a4fb2b54042482a1a89ddd1222504 ****/
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
		/**** md5 signature: 955214e1cb9ad4c7ce65bff6c9f9b73d ****/
		%feature("compactdefaultargs") StepBasic_ProductDefinitionContext;
		%feature("autodoc", "Returns a productdefinitioncontext.

Returns
-------
None
") StepBasic_ProductDefinitionContext;
		 StepBasic_ProductDefinitionContext();

		/****************** Init ******************/
		/**** md5 signature: a6be1554a1ba305e5b97d399a386e7d3 ****/
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
		/**** md5 signature: b8c37876bd64a99cd119b70539911212 ****/
		%feature("compactdefaultargs") LifeCycleStage;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") LifeCycleStage;
		opencascade::handle<TCollection_HAsciiString> LifeCycleStage();

		/****************** SetLifeCycleStage ******************/
		/**** md5 signature: aa0104861f00faf98b848d06abda2b00 ****/
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
		/**** md5 signature: e672cebe215ec0a19823ef00b79ace8c ****/
		%feature("compactdefaultargs") StepBasic_ProductDefinitionEffectivity;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") StepBasic_ProductDefinitionEffectivity;
		 StepBasic_ProductDefinitionEffectivity();

		/****************** Init ******************/
		/**** md5 signature: fcb6eca33aeeadff4403a24c50d4d7a0 ****/
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
		/**** md5 signature: 8aed11e8fe75f2c6fcd0b994bf0a656b ****/
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
		/**** md5 signature: 7196a3223aa89ae3216b57bf404c0ba5 ****/
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
		/**** md5 signature: 8db50b8ef90d083e8959ac89d6949777 ****/
		%feature("compactdefaultargs") StepBasic_ProductDefinitionFormationWithSpecifiedSource;
		%feature("autodoc", "Returns a productdefinitionformationwithspecifiedsource.

Returns
-------
None
") StepBasic_ProductDefinitionFormationWithSpecifiedSource;
		 StepBasic_ProductDefinitionFormationWithSpecifiedSource();

		/****************** Init ******************/
		/**** md5 signature: f3bb2a7c10e46ceec28cec390035abbd ****/
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
		/**** md5 signature: 522f46d1966445b0c122e677e62d37e8 ****/
		%feature("compactdefaultargs") MakeOrBuy;
		%feature("autodoc", "No available documentation.

Returns
-------
StepBasic_Source
") MakeOrBuy;
		StepBasic_Source MakeOrBuy();

		/****************** SetMakeOrBuy ******************/
		/**** md5 signature: 02bd86081f2102d67a5004c9efde7776 ****/
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
		/**** md5 signature: 38177af813d9c16e3a1e585e77a65e6c ****/
		%feature("compactdefaultargs") StepBasic_ProductDefinitionReferenceWithLocalRepresentation;
		%feature("autodoc", "Returns a productdefinitionreferencewithlocalrepresentation.

Returns
-------
None
") StepBasic_ProductDefinitionReferenceWithLocalRepresentation;
		 StepBasic_ProductDefinitionReferenceWithLocalRepresentation();

		/****************** Init ******************/
		/**** md5 signature: a17a9dc52f1b692ec8801c14668099c4 ****/
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
		/**** md5 signature: d656e905f131b35a69061b2a857e75e0 ****/
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
		/**** md5 signature: a13a47fce462914f8ac90f867f0370c7 ****/
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
		/**** md5 signature: 67547eb51a3aeb0534481234d07bd7e5 ****/
		%feature("compactdefaultargs") StepBasic_ProductDefinitionWithAssociatedDocuments;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") StepBasic_ProductDefinitionWithAssociatedDocuments;
		 StepBasic_ProductDefinitionWithAssociatedDocuments();

		/****************** DocIds ******************/
		/**** md5 signature: f99a89ab71d1f1345ebfac7db2976045 ****/
		%feature("compactdefaultargs") DocIds;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepBasic_HArray1OfDocument>
") DocIds;
		opencascade::handle<StepBasic_HArray1OfDocument> DocIds();

		/****************** DocIdsValue ******************/
		/**** md5 signature: 289bae0af42e7afb9eeddb56ee56c8f5 ****/
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
		/**** md5 signature: ab6a828211fe18264927c2f513d4fa62 ****/
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
		/**** md5 signature: 44309351a282aab6be59435a9a2d0d58 ****/
		%feature("compactdefaultargs") NbDocIds;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbDocIds;
		Standard_Integer NbDocIds();

		/****************** SetDocIds ******************/
		/**** md5 signature: 9d5a6ec9fd4dffb06f4867ff750cf34a ****/
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
		/**** md5 signature: 3f2cc15471c89394ba1fe90e381f98cc ****/
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
		/**** md5 signature: c207ddf61fee45c4ebcf3bb50b4310f2 ****/
		%feature("compactdefaultargs") StepBasic_ProductRelatedProductCategory;
		%feature("autodoc", "Returns a productrelatedproductcategory.

Returns
-------
None
") StepBasic_ProductRelatedProductCategory;
		 StepBasic_ProductRelatedProductCategory();

		/****************** Init ******************/
		/**** md5 signature: ef699e40c29669615c48c9d4d2308a69 ****/
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
		/**** md5 signature: d3fb3a11f25e6d22373886d209506c61 ****/
		%feature("compactdefaultargs") NbProducts;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbProducts;
		Standard_Integer NbProducts();

		/****************** Products ******************/
		/**** md5 signature: 9d0752ff7564c82fba7e6e8fcfc88dd3 ****/
		%feature("compactdefaultargs") Products;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepBasic_HArray1OfProduct>
") Products;
		opencascade::handle<StepBasic_HArray1OfProduct> Products();

		/****************** ProductsValue ******************/
		/**** md5 signature: 706ef44651e18050a8ef958e89f82f8e ****/
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
		/**** md5 signature: 46e0d45ba580b5cafb271a244155f877 ****/
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
		/**** md5 signature: f50bd87e1b3b633b2b033958ffbefa84 ****/
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
		/**** md5 signature: ee2a7f8aefd0db0114983015445e7266 ****/
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
		/**** md5 signature: 8fa2e52ce2fdd81d8f15bd353ac893a2 ****/
		%feature("compactdefaultargs") StepBasic_SiUnit;
		%feature("autodoc", "Returns a siunit.

Returns
-------
None
") StepBasic_SiUnit;
		 StepBasic_SiUnit();

		/****************** Dimensions ******************/
		/**** md5 signature: 4e66912481e9ff0b706e930a9ef87093 ****/
		%feature("compactdefaultargs") Dimensions;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepBasic_DimensionalExponents>
") Dimensions;
		virtual opencascade::handle<StepBasic_DimensionalExponents> Dimensions();

		/****************** HasPrefix ******************/
		/**** md5 signature: c9fe6eeb510ee5d2c641117ebbb79772 ****/
		%feature("compactdefaultargs") HasPrefix;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") HasPrefix;
		Standard_Boolean HasPrefix();

		/****************** Init ******************/
		/**** md5 signature: ac991672766c61474098b23b82448a53 ****/
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
		/**** md5 signature: 7d79c683219f60de29d625692ad93378 ****/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "No available documentation.

Returns
-------
StepBasic_SiUnitName
") Name;
		StepBasic_SiUnitName Name();

		/****************** Prefix ******************/
		/**** md5 signature: 43b309d7a089d15118b2f153de5a9ee4 ****/
		%feature("compactdefaultargs") Prefix;
		%feature("autodoc", "No available documentation.

Returns
-------
StepBasic_SiPrefix
") Prefix;
		StepBasic_SiPrefix Prefix();

		/****************** SetDimensions ******************/
		/**** md5 signature: cf40ab4ee06b6cf12d35c11b1ac9d18f ****/
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
		/**** md5 signature: fa7a6bc42d81880bdb6a51fbe91d8571 ****/
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
		/**** md5 signature: d5425849157ae005699d5412dbe72df6 ****/
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
		/**** md5 signature: 067d31f6c09e634a148693dd9a3af4db ****/
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
		/**** md5 signature: 183eeb3822911071c3160f6ccb6f0fa4 ****/
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
		/**** md5 signature: 34196cc23f91920ce2d2c7b14f2ff0cb ****/
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
		/**** md5 signature: 0832e99e11a3e856fec81c41ac353073 ****/
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
		/**** md5 signature: ea27f344d6994f6fb8740c5236184656 ****/
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
		/**** md5 signature: 7d2fc610496bdf32605235e173784eb5 ****/
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
		/**** md5 signature: 0c2173d45e6984b2ce6a6bd3245ae544 ****/
		%feature("compactdefaultargs") StepBasic_UncertaintyMeasureWithUnit;
		%feature("autodoc", "Returns a uncertaintymeasurewithunit.

Returns
-------
None
") StepBasic_UncertaintyMeasureWithUnit;
		 StepBasic_UncertaintyMeasureWithUnit();

		/****************** Description ******************/
		/**** md5 signature: 68309bdf9d57a000073490b39f8e7a41 ****/
		%feature("compactdefaultargs") Description;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") Description;
		opencascade::handle<TCollection_HAsciiString> Description();

		/****************** Init ******************/
		/**** md5 signature: c7b87454b746f7903790d96a011e7b8e ****/
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
		/**** md5 signature: 6bcb97f17b57cae0750fd29eac20499c ****/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") Name;
		opencascade::handle<TCollection_HAsciiString> Name();

		/****************** SetDescription ******************/
		/**** md5 signature: adddd13a906718df58a2eee683a382cf ****/
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
		/**** md5 signature: 1e0b00d9eb163c8a0cdbb986e2ee24f6 ****/
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
		/**** md5 signature: 492db89824fdf1ec433948c3274d510b ****/
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
		/**** md5 signature: bd7336b94f06d31a71ae92cb76f3c7a5 ****/
		%feature("compactdefaultargs") StepBasic_WeekOfYearAndDayDate;
		%feature("autodoc", "Returns a weekofyearanddaydate.

Returns
-------
None
") StepBasic_WeekOfYearAndDayDate;
		 StepBasic_WeekOfYearAndDayDate();

		/****************** DayComponent ******************/
		/**** md5 signature: 3ca7721e5937e191f94c2f5ecee1c9a8 ****/
		%feature("compactdefaultargs") DayComponent;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") DayComponent;
		Standard_Integer DayComponent();

		/****************** HasDayComponent ******************/
		/**** md5 signature: 533707411dd29de84b7bcec81e4200ca ****/
		%feature("compactdefaultargs") HasDayComponent;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") HasDayComponent;
		Standard_Boolean HasDayComponent();

		/****************** Init ******************/
		/**** md5 signature: d2eb3140c7e43ebfa84f6193d90beef8 ****/
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
		/**** md5 signature: 599666a06025a8440c3915e142f8559a ****/
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
		/**** md5 signature: 3bbdbe7ae3fa90362f414a9ecbed9ae2 ****/
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
		/**** md5 signature: 477eb6ed8099002592cc1ac15492f31f ****/
		%feature("compactdefaultargs") UnSetDayComponent;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") UnSetDayComponent;
		void UnSetDayComponent();

		/****************** WeekComponent ******************/
		/**** md5 signature: c2fc4618a34dee968234360833c574fc ****/
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
		/**** md5 signature: a91b85c737c77f77bc93d967ab74e91d ****/
		%feature("compactdefaultargs") StepBasic_ConversionBasedUnitAndAreaUnit;
		%feature("autodoc", "Returns a conversionbasedunitandareaunit.

Returns
-------
None
") StepBasic_ConversionBasedUnitAndAreaUnit;
		 StepBasic_ConversionBasedUnitAndAreaUnit();

		/****************** AreaUnit ******************/
		/**** md5 signature: d485061b37edb50280520994da0eb27a ****/
		%feature("compactdefaultargs") AreaUnit;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepBasic_AreaUnit>
") AreaUnit;
		opencascade::handle<StepBasic_AreaUnit> AreaUnit();

		/****************** SetAreaUnit ******************/
		/**** md5 signature: bcc9362838dbda4feab81b0202cb4b87 ****/
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
		/**** md5 signature: 8fa6c46a9b97b6cdfdc010a0bc71c55f ****/
		%feature("compactdefaultargs") StepBasic_ConversionBasedUnitAndLengthUnit;
		%feature("autodoc", "Returns a conversionbasedunitandlengthunit.

Returns
-------
None
") StepBasic_ConversionBasedUnitAndLengthUnit;
		 StepBasic_ConversionBasedUnitAndLengthUnit();

		/****************** Init ******************/
		/**** md5 signature: 230b648890e9efa5eef6d2d214b37499 ****/
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
		/**** md5 signature: 2db2c3654e5bf9a37de3c8d0f7db7897 ****/
		%feature("compactdefaultargs") LengthUnit;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepBasic_LengthUnit>
") LengthUnit;
		opencascade::handle<StepBasic_LengthUnit> LengthUnit();

		/****************** SetLengthUnit ******************/
		/**** md5 signature: e91cf8285eef4652d6b5fbfc71b7567a ****/
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
		/**** md5 signature: dad0a4a30f2bd3ab3fea56582a4f1e3d ****/
		%feature("compactdefaultargs") StepBasic_ConversionBasedUnitAndMassUnit;
		%feature("autodoc", "Returns a conversionbasedunitandlengthunit.

Returns
-------
None
") StepBasic_ConversionBasedUnitAndMassUnit;
		 StepBasic_ConversionBasedUnitAndMassUnit();

		/****************** Init ******************/
		/**** md5 signature: 230b648890e9efa5eef6d2d214b37499 ****/
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
		/**** md5 signature: 8f52f5dd4adce065cde920b4bac228d3 ****/
		%feature("compactdefaultargs") MassUnit;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepBasic_MassUnit>
") MassUnit;
		opencascade::handle<StepBasic_MassUnit> MassUnit();

		/****************** SetMassUnit ******************/
		/**** md5 signature: 8228b68efbc2a6d1036478c9742cd241 ****/
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
		/**** md5 signature: 4b2d263f8590ca3ceb698c615bdd0f78 ****/
		%feature("compactdefaultargs") StepBasic_ConversionBasedUnitAndPlaneAngleUnit;
		%feature("autodoc", "Returns a conversionbasedunitandplaneangleunit.

Returns
-------
None
") StepBasic_ConversionBasedUnitAndPlaneAngleUnit;
		 StepBasic_ConversionBasedUnitAndPlaneAngleUnit();

		/****************** Init ******************/
		/**** md5 signature: 230b648890e9efa5eef6d2d214b37499 ****/
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
		/**** md5 signature: c451c5e50d87ed7994edb7e363d54856 ****/
		%feature("compactdefaultargs") PlaneAngleUnit;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepBasic_PlaneAngleUnit>
") PlaneAngleUnit;
		opencascade::handle<StepBasic_PlaneAngleUnit> PlaneAngleUnit();

		/****************** SetPlaneAngleUnit ******************/
		/**** md5 signature: cfc527c916a6ffff2f8a17f53493f286 ****/
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
		/**** md5 signature: d8609a05d2ae804eed763fa9b047b7e5 ****/
		%feature("compactdefaultargs") StepBasic_ConversionBasedUnitAndRatioUnit;
		%feature("autodoc", "Returns a conversionbasedunitandratiounit.

Returns
-------
None
") StepBasic_ConversionBasedUnitAndRatioUnit;
		 StepBasic_ConversionBasedUnitAndRatioUnit();

		/****************** Init ******************/
		/**** md5 signature: 230b648890e9efa5eef6d2d214b37499 ****/
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
		/**** md5 signature: 65e9c38c2c1f03c50c41fb636fcbfb0d ****/
		%feature("compactdefaultargs") RatioUnit;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepBasic_RatioUnit>
") RatioUnit;
		opencascade::handle<StepBasic_RatioUnit> RatioUnit();

		/****************** SetRatioUnit ******************/
		/**** md5 signature: 23fd5e72198ee9c38126d80c90e47203 ****/
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
		/**** md5 signature: c2ca84dd5c37c3dbe0d0a8e0fada9204 ****/
		%feature("compactdefaultargs") StepBasic_ConversionBasedUnitAndSolidAngleUnit;
		%feature("autodoc", "Returns a conversionbasedunitandsolidangleunit.

Returns
-------
None
") StepBasic_ConversionBasedUnitAndSolidAngleUnit;
		 StepBasic_ConversionBasedUnitAndSolidAngleUnit();

		/****************** Init ******************/
		/**** md5 signature: 230b648890e9efa5eef6d2d214b37499 ****/
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
		/**** md5 signature: 94c3a931d88e3ee135dcba816533aced ****/
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
		/**** md5 signature: 52e7ccf5308a5448649dceb98d85ff8c ****/
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
		/**** md5 signature: 8b25fdf066619a39fdba971a9840a96b ****/
		%feature("compactdefaultargs") StepBasic_ConversionBasedUnitAndTimeUnit;
		%feature("autodoc", "Returns a conversionbasedunitandtimeunit.

Returns
-------
None
") StepBasic_ConversionBasedUnitAndTimeUnit;
		 StepBasic_ConversionBasedUnitAndTimeUnit();

		/****************** Init ******************/
		/**** md5 signature: 230b648890e9efa5eef6d2d214b37499 ****/
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
		/**** md5 signature: 41cd2c45dcbccffbdebbe64293606ffd ****/
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
		/**** md5 signature: f7cc1bca9ec2fbc662256c773469e3cc ****/
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
		/**** md5 signature: c4a2f1137307040b73a49cd18b358447 ****/
		%feature("compactdefaultargs") StepBasic_ConversionBasedUnitAndVolumeUnit;
		%feature("autodoc", "Returns a conversionbasedunitandvolumeunit.

Returns
-------
None
") StepBasic_ConversionBasedUnitAndVolumeUnit;
		 StepBasic_ConversionBasedUnitAndVolumeUnit();

		/****************** SetVolumeUnit ******************/
		/**** md5 signature: 4612612e1947e04cc0950fb433f9b842 ****/
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
		/**** md5 signature: 89d628c097da697d597a399ee0b08b7c ****/
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
		/**** md5 signature: 5cefd36ac71f2641a2fd3209d84a61bc ****/
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
		/**** md5 signature: 7e120c0ecc52172e18c780742796bbbb ****/
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
		/**** md5 signature: 6f10abed2030d802d257c80994c4e1cb ****/
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
		/**** md5 signature: 9a2b0b7c721758be6c6077db53a2e229 ****/
		%feature("compactdefaultargs") StepBasic_SiUnitAndAreaUnit;
		%feature("autodoc", "Returns a siunitandareaunit.

Returns
-------
None
") StepBasic_SiUnitAndAreaUnit;
		 StepBasic_SiUnitAndAreaUnit();

		/****************** AreaUnit ******************/
		/**** md5 signature: d485061b37edb50280520994da0eb27a ****/
		%feature("compactdefaultargs") AreaUnit;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepBasic_AreaUnit>
") AreaUnit;
		opencascade::handle<StepBasic_AreaUnit> AreaUnit();

		/****************** SetAreaUnit ******************/
		/**** md5 signature: bcc9362838dbda4feab81b0202cb4b87 ****/
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
		/**** md5 signature: 6b0075650602cbd65a22473fdd5d81a3 ****/
		%feature("compactdefaultargs") StepBasic_SiUnitAndLengthUnit;
		%feature("autodoc", "Returns a siunitandlengthunit.

Returns
-------
None
") StepBasic_SiUnitAndLengthUnit;
		 StepBasic_SiUnitAndLengthUnit();

		/****************** Init ******************/
		/**** md5 signature: ac991672766c61474098b23b82448a53 ****/
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
		/**** md5 signature: 2db2c3654e5bf9a37de3c8d0f7db7897 ****/
		%feature("compactdefaultargs") LengthUnit;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepBasic_LengthUnit>
") LengthUnit;
		opencascade::handle<StepBasic_LengthUnit> LengthUnit();

		/****************** SetLengthUnit ******************/
		/**** md5 signature: e91cf8285eef4652d6b5fbfc71b7567a ****/
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
		/**** md5 signature: ca1615bc9775ede91a951cf6babc8001 ****/
		%feature("compactdefaultargs") StepBasic_SiUnitAndMassUnit;
		%feature("autodoc", "Returns a siunitandmassunit.

Returns
-------
None
") StepBasic_SiUnitAndMassUnit;
		 StepBasic_SiUnitAndMassUnit();

		/****************** Init ******************/
		/**** md5 signature: ac991672766c61474098b23b82448a53 ****/
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
		/**** md5 signature: 8f52f5dd4adce065cde920b4bac228d3 ****/
		%feature("compactdefaultargs") MassUnit;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepBasic_MassUnit>
") MassUnit;
		opencascade::handle<StepBasic_MassUnit> MassUnit();

		/****************** SetMassUnit ******************/
		/**** md5 signature: 8228b68efbc2a6d1036478c9742cd241 ****/
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
		/**** md5 signature: 2cd0de9aa9ac0113ecbac3fbb63985e9 ****/
		%feature("compactdefaultargs") StepBasic_SiUnitAndPlaneAngleUnit;
		%feature("autodoc", "Returns a siunitandplaneangleunit.

Returns
-------
None
") StepBasic_SiUnitAndPlaneAngleUnit;
		 StepBasic_SiUnitAndPlaneAngleUnit();

		/****************** Init ******************/
		/**** md5 signature: ac991672766c61474098b23b82448a53 ****/
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
		/**** md5 signature: c451c5e50d87ed7994edb7e363d54856 ****/
		%feature("compactdefaultargs") PlaneAngleUnit;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepBasic_PlaneAngleUnit>
") PlaneAngleUnit;
		opencascade::handle<StepBasic_PlaneAngleUnit> PlaneAngleUnit();

		/****************** SetPlaneAngleUnit ******************/
		/**** md5 signature: cfc527c916a6ffff2f8a17f53493f286 ****/
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
		/**** md5 signature: a0dd49546670118e661cfb57451acf0c ****/
		%feature("compactdefaultargs") StepBasic_SiUnitAndRatioUnit;
		%feature("autodoc", "Returns a siunitandratiounit.

Returns
-------
None
") StepBasic_SiUnitAndRatioUnit;
		 StepBasic_SiUnitAndRatioUnit();

		/****************** Init ******************/
		/**** md5 signature: ac991672766c61474098b23b82448a53 ****/
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
		/**** md5 signature: 65e9c38c2c1f03c50c41fb636fcbfb0d ****/
		%feature("compactdefaultargs") RatioUnit;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepBasic_RatioUnit>
") RatioUnit;
		opencascade::handle<StepBasic_RatioUnit> RatioUnit();

		/****************** SetRatioUnit ******************/
		/**** md5 signature: 23fd5e72198ee9c38126d80c90e47203 ****/
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
		/**** md5 signature: 96deab0a7e230d3cee4f1e31c856da2e ****/
		%feature("compactdefaultargs") StepBasic_SiUnitAndSolidAngleUnit;
		%feature("autodoc", "Returns a siunitandsolidangleunit.

Returns
-------
None
") StepBasic_SiUnitAndSolidAngleUnit;
		 StepBasic_SiUnitAndSolidAngleUnit();

		/****************** Init ******************/
		/**** md5 signature: ac991672766c61474098b23b82448a53 ****/
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
		/**** md5 signature: 94c3a931d88e3ee135dcba816533aced ****/
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
		/**** md5 signature: 52e7ccf5308a5448649dceb98d85ff8c ****/
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
		/**** md5 signature: 3ebf871df4c080650f1dd451c1c3ccb6 ****/
		%feature("compactdefaultargs") StepBasic_SiUnitAndThermodynamicTemperatureUnit;
		%feature("autodoc", "Returns a siunitandthermodynamictemperatureunit.

Returns
-------
None
") StepBasic_SiUnitAndThermodynamicTemperatureUnit;
		 StepBasic_SiUnitAndThermodynamicTemperatureUnit();

		/****************** Init ******************/
		/**** md5 signature: ac991672766c61474098b23b82448a53 ****/
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
		/**** md5 signature: 51cb78d655946e860407f20bb0bf1376 ****/
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
		/**** md5 signature: 9d03ef1294a54a278f7a31aac36c39c8 ****/
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
		/**** md5 signature: 9e0b3b1855b611e5d28073567050e4a6 ****/
		%feature("compactdefaultargs") StepBasic_SiUnitAndTimeUnit;
		%feature("autodoc", "Returns a siunitandtimeunit.

Returns
-------
None
") StepBasic_SiUnitAndTimeUnit;
		 StepBasic_SiUnitAndTimeUnit();

		/****************** Init ******************/
		/**** md5 signature: ac991672766c61474098b23b82448a53 ****/
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
		/**** md5 signature: 41cd2c45dcbccffbdebbe64293606ffd ****/
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
		/**** md5 signature: f7cc1bca9ec2fbc662256c773469e3cc ****/
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
		/**** md5 signature: 1b773defcb4cb62c69c289209875dab4 ****/
		%feature("compactdefaultargs") StepBasic_SiUnitAndVolumeUnit;
		%feature("autodoc", "Returns a siunitandvolumeunit.

Returns
-------
None
") StepBasic_SiUnitAndVolumeUnit;
		 StepBasic_SiUnitAndVolumeUnit();

		/****************** SetVolumeUnit ******************/
		/**** md5 signature: 4612612e1947e04cc0950fb433f9b842 ****/
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
		/**** md5 signature: 89d628c097da697d597a399ee0b08b7c ****/
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

class StepBasic_HArray1OfOrganization : public StepBasic_Array1OfOrganization, public Standard_Transient {
  public:
    StepBasic_HArray1OfOrganization(const Standard_Integer theLower, const Standard_Integer theUpper);
    StepBasic_HArray1OfOrganization(const Standard_Integer theLower, const Standard_Integer theUpper, const StepBasic_Array1OfOrganization::value_type& theValue);
    StepBasic_HArray1OfOrganization(const StepBasic_Array1OfOrganization& theOther);
    const StepBasic_Array1OfOrganization& Array1();
    StepBasic_Array1OfOrganization& ChangeArray1();
};
%make_alias(StepBasic_HArray1OfOrganization)


class StepBasic_HArray1OfProductDefinition : public StepBasic_Array1OfProductDefinition, public Standard_Transient {
  public:
    StepBasic_HArray1OfProductDefinition(const Standard_Integer theLower, const Standard_Integer theUpper);
    StepBasic_HArray1OfProductDefinition(const Standard_Integer theLower, const Standard_Integer theUpper, const StepBasic_Array1OfProductDefinition::value_type& theValue);
    StepBasic_HArray1OfProductDefinition(const StepBasic_Array1OfProductDefinition& theOther);
    const StepBasic_Array1OfProductDefinition& Array1();
    StepBasic_Array1OfProductDefinition& ChangeArray1();
};
%make_alias(StepBasic_HArray1OfProductDefinition)


class StepBasic_HArray1OfDerivedUnitElement : public StepBasic_Array1OfDerivedUnitElement, public Standard_Transient {
  public:
    StepBasic_HArray1OfDerivedUnitElement(const Standard_Integer theLower, const Standard_Integer theUpper);
    StepBasic_HArray1OfDerivedUnitElement(const Standard_Integer theLower, const Standard_Integer theUpper, const StepBasic_Array1OfDerivedUnitElement::value_type& theValue);
    StepBasic_HArray1OfDerivedUnitElement(const StepBasic_Array1OfDerivedUnitElement& theOther);
    const StepBasic_Array1OfDerivedUnitElement& Array1();
    StepBasic_Array1OfDerivedUnitElement& ChangeArray1();
};
%make_alias(StepBasic_HArray1OfDerivedUnitElement)


class StepBasic_HArray1OfPerson : public StepBasic_Array1OfPerson, public Standard_Transient {
  public:
    StepBasic_HArray1OfPerson(const Standard_Integer theLower, const Standard_Integer theUpper);
    StepBasic_HArray1OfPerson(const Standard_Integer theLower, const Standard_Integer theUpper, const StepBasic_Array1OfPerson::value_type& theValue);
    StepBasic_HArray1OfPerson(const StepBasic_Array1OfPerson& theOther);
    const StepBasic_Array1OfPerson& Array1();
    StepBasic_Array1OfPerson& ChangeArray1();
};
%make_alias(StepBasic_HArray1OfPerson)


class StepBasic_HArray1OfUncertaintyMeasureWithUnit : public StepBasic_Array1OfUncertaintyMeasureWithUnit, public Standard_Transient {
  public:
    StepBasic_HArray1OfUncertaintyMeasureWithUnit(const Standard_Integer theLower, const Standard_Integer theUpper);
    StepBasic_HArray1OfUncertaintyMeasureWithUnit(const Standard_Integer theLower, const Standard_Integer theUpper, const StepBasic_Array1OfUncertaintyMeasureWithUnit::value_type& theValue);
    StepBasic_HArray1OfUncertaintyMeasureWithUnit(const StepBasic_Array1OfUncertaintyMeasureWithUnit& theOther);
    const StepBasic_Array1OfUncertaintyMeasureWithUnit& Array1();
    StepBasic_Array1OfUncertaintyMeasureWithUnit& ChangeArray1();
};
%make_alias(StepBasic_HArray1OfUncertaintyMeasureWithUnit)


class StepBasic_HArray1OfApproval : public StepBasic_Array1OfApproval, public Standard_Transient {
  public:
    StepBasic_HArray1OfApproval(const Standard_Integer theLower, const Standard_Integer theUpper);
    StepBasic_HArray1OfApproval(const Standard_Integer theLower, const Standard_Integer theUpper, const StepBasic_Array1OfApproval::value_type& theValue);
    StepBasic_HArray1OfApproval(const StepBasic_Array1OfApproval& theOther);
    const StepBasic_Array1OfApproval& Array1();
    StepBasic_Array1OfApproval& ChangeArray1();
};
%make_alias(StepBasic_HArray1OfApproval)


class StepBasic_HArray1OfNamedUnit : public StepBasic_Array1OfNamedUnit, public Standard_Transient {
  public:
    StepBasic_HArray1OfNamedUnit(const Standard_Integer theLower, const Standard_Integer theUpper);
    StepBasic_HArray1OfNamedUnit(const Standard_Integer theLower, const Standard_Integer theUpper, const StepBasic_Array1OfNamedUnit::value_type& theValue);
    StepBasic_HArray1OfNamedUnit(const StepBasic_Array1OfNamedUnit& theOther);
    const StepBasic_Array1OfNamedUnit& Array1();
    StepBasic_Array1OfNamedUnit& ChangeArray1();
};
%make_alias(StepBasic_HArray1OfNamedUnit)


class StepBasic_HArray1OfProductContext : public StepBasic_Array1OfProductContext, public Standard_Transient {
  public:
    StepBasic_HArray1OfProductContext(const Standard_Integer theLower, const Standard_Integer theUpper);
    StepBasic_HArray1OfProductContext(const Standard_Integer theLower, const Standard_Integer theUpper, const StepBasic_Array1OfProductContext::value_type& theValue);
    StepBasic_HArray1OfProductContext(const StepBasic_Array1OfProductContext& theOther);
    const StepBasic_Array1OfProductContext& Array1();
    StepBasic_Array1OfProductContext& ChangeArray1();
};
%make_alias(StepBasic_HArray1OfProductContext)


class StepBasic_HArray1OfDocument : public StepBasic_Array1OfDocument, public Standard_Transient {
  public:
    StepBasic_HArray1OfDocument(const Standard_Integer theLower, const Standard_Integer theUpper);
    StepBasic_HArray1OfDocument(const Standard_Integer theLower, const Standard_Integer theUpper, const StepBasic_Array1OfDocument::value_type& theValue);
    StepBasic_HArray1OfDocument(const StepBasic_Array1OfDocument& theOther);
    const StepBasic_Array1OfDocument& Array1();
    StepBasic_Array1OfDocument& ChangeArray1();
};
%make_alias(StepBasic_HArray1OfDocument)


class StepBasic_HArray1OfProduct : public StepBasic_Array1OfProduct, public Standard_Transient {
  public:
    StepBasic_HArray1OfProduct(const Standard_Integer theLower, const Standard_Integer theUpper);
    StepBasic_HArray1OfProduct(const Standard_Integer theLower, const Standard_Integer theUpper, const StepBasic_Array1OfProduct::value_type& theValue);
    StepBasic_HArray1OfProduct(const StepBasic_Array1OfProduct& theOther);
    const StepBasic_Array1OfProduct& Array1();
    StepBasic_Array1OfProduct& ChangeArray1();
};
%make_alias(StepBasic_HArray1OfProduct)

/* harray2 classes */
/* hsequence classes */
