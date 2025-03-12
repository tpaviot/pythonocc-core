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
%define STEPBASICDOCSTRING
"StepBasic module, see official documentation at
https://dev.opencascade.org/doc/occt-7.8.0/refman/html/package_stepbasic.html"
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
%include ../common/EnumTemplates.i
%include ../common/Operators.i
%include ../common/OccHandle.i
%include ../common/IOStream.i
%include ../common/ArrayMacros.i


%{
#include<StepBasic_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<TCollection_module.hxx>
#include<StepData_module.hxx>
#include<TColStd_module.hxx>
#include<StepRepr_module.hxx>
#include<Interface_module.hxx>
#include<MoniTool_module.hxx>
#include<TCollection_module.hxx>
#include<StepBasic_module.hxx>
#include<Message_module.hxx>
#include<Interface_module.hxx>
#include<TopoDS_module.hxx>
#include<Resource_module.hxx>
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
%import StepRepr.i
%import Interface.i

%pythoncode {
from enum import IntEnum
from OCC.Core.Exception import *
};

/* public enums */
enum StepBasic_AheadOrBehind {
	StepBasic_aobAhead = 0,
	StepBasic_aobExact = 1,
	StepBasic_aobBehind = 2,
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

enum StepBasic_Source {
	StepBasic_sMade = 0,
	StepBasic_sBought = 1,
	StepBasic_sNotKnown = 2,
};

/* end public enums declaration */

/* python proxy classes for enums */
%pythoncode {

class StepBasic_AheadOrBehind(IntEnum):
	StepBasic_aobAhead = 0
	StepBasic_aobExact = 1
	StepBasic_aobBehind = 2
StepBasic_aobAhead = StepBasic_AheadOrBehind.StepBasic_aobAhead
StepBasic_aobExact = StepBasic_AheadOrBehind.StepBasic_aobExact
StepBasic_aobBehind = StepBasic_AheadOrBehind.StepBasic_aobBehind

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

class StepBasic_Source(IntEnum):
	StepBasic_sMade = 0
	StepBasic_sBought = 1
	StepBasic_sNotKnown = 2
StepBasic_sMade = StepBasic_Source.StepBasic_sMade
StepBasic_sBought = StepBasic_Source.StepBasic_sBought
StepBasic_sNotKnown = StepBasic_Source.StepBasic_sNotKnown
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
%wrap_handle(StepBasic_GeneralPropertyAssociation)
%wrap_handle(StepBasic_GeneralPropertyRelationship)
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
%wrap_handle(StepBasic_HArray1OfApproval)
%wrap_handle(StepBasic_HArray1OfDerivedUnitElement)
%wrap_handle(StepBasic_HArray1OfDocument)
%wrap_handle(StepBasic_HArray1OfNamedUnit)
%wrap_handle(StepBasic_HArray1OfOrganization)
%wrap_handle(StepBasic_HArray1OfPerson)
%wrap_handle(StepBasic_HArray1OfProduct)
%wrap_handle(StepBasic_HArray1OfProductContext)
%wrap_handle(StepBasic_HArray1OfProductDefinition)
%wrap_handle(StepBasic_HArray1OfUncertaintyMeasureWithUnit)
/* end handles declaration */

/* templates */
%template(StepBasic_Array1OfApproval) NCollection_Array1<opencascade::handle<StepBasic_Approval>>;
Array1ExtendIter(opencascade::handle<StepBasic_Approval>)

%template(StepBasic_Array1OfDerivedUnitElement) NCollection_Array1<opencascade::handle<StepBasic_DerivedUnitElement>>;
Array1ExtendIter(opencascade::handle<StepBasic_DerivedUnitElement>)

%template(StepBasic_Array1OfDocument) NCollection_Array1<opencascade::handle<StepBasic_Document>>;
Array1ExtendIter(opencascade::handle<StepBasic_Document>)

%template(StepBasic_Array1OfNamedUnit) NCollection_Array1<opencascade::handle<StepBasic_NamedUnit>>;
Array1ExtendIter(opencascade::handle<StepBasic_NamedUnit>)

%template(StepBasic_Array1OfOrganization) NCollection_Array1<opencascade::handle<StepBasic_Organization>>;
Array1ExtendIter(opencascade::handle<StepBasic_Organization>)

%template(StepBasic_Array1OfPerson) NCollection_Array1<opencascade::handle<StepBasic_Person>>;
Array1ExtendIter(opencascade::handle<StepBasic_Person>)

%template(StepBasic_Array1OfProduct) NCollection_Array1<opencascade::handle<StepBasic_Product>>;
Array1ExtendIter(opencascade::handle<StepBasic_Product>)

%template(StepBasic_Array1OfProductContext) NCollection_Array1<opencascade::handle<StepBasic_ProductContext>>;
Array1ExtendIter(opencascade::handle<StepBasic_ProductContext>)

%template(StepBasic_Array1OfProductDefinition) NCollection_Array1<opencascade::handle<StepBasic_ProductDefinition>>;
Array1ExtendIter(opencascade::handle<StepBasic_ProductDefinition>)

%template(StepBasic_Array1OfUncertaintyMeasureWithUnit) NCollection_Array1<opencascade::handle<StepBasic_UncertaintyMeasureWithUnit>>;
Array1ExtendIter(opencascade::handle<StepBasic_UncertaintyMeasureWithUnit>)

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
		/****** StepBasic_Action::StepBasic_Action ******/
		/****** md5 signature: a6fa99038cfaa6a13f76436708f7fab6 ******/
		%feature("compactdefaultargs") StepBasic_Action;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") StepBasic_Action;
		 StepBasic_Action();

		/****** StepBasic_Action::ChosenMethod ******/
		/****** md5 signature: 155be94968ae17869801c63609f1decf ******/
		%feature("compactdefaultargs") ChosenMethod;
		%feature("autodoc", "Return
-------
opencascade::handle<StepBasic_ActionMethod>

Description
-----------
Returns field ChosenMethod.
") ChosenMethod;
		opencascade::handle<StepBasic_ActionMethod> ChosenMethod();

		/****** StepBasic_Action::Description ******/
		/****** md5 signature: 68309bdf9d57a000073490b39f8e7a41 ******/
		%feature("compactdefaultargs") Description;
		%feature("autodoc", "Return
-------
opencascade::handle<TCollection_HAsciiString>

Description
-----------
Returns field Description.
") Description;
		opencascade::handle<TCollection_HAsciiString> Description();

		/****** StepBasic_Action::HasDescription ******/
		/****** md5 signature: 819ef9a3dced474861e1980d901a2978 ******/
		%feature("compactdefaultargs") HasDescription;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if optional field Description is defined.
") HasDescription;
		Standard_Boolean HasDescription();

		/****** StepBasic_Action::Init ******/
		/****** md5 signature: 68546e92c23e6139629752e8bf66c3ac ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
aName: TCollection_HAsciiString
hasDescription: bool
aDescription: TCollection_HAsciiString
aChosenMethod: StepBasic_ActionMethod

Return
-------
None

Description
-----------
Initialize all fields (own and inherited).
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aName, const Standard_Boolean hasDescription, const opencascade::handle<TCollection_HAsciiString> & aDescription, const opencascade::handle<StepBasic_ActionMethod> & aChosenMethod);

		/****** StepBasic_Action::Name ******/
		/****** md5 signature: 6bcb97f17b57cae0750fd29eac20499c ******/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "Return
-------
opencascade::handle<TCollection_HAsciiString>

Description
-----------
Returns field Name.
") Name;
		opencascade::handle<TCollection_HAsciiString> Name();

		/****** StepBasic_Action::SetChosenMethod ******/
		/****** md5 signature: 95e705fc4ea11d7bf456f8616af001c8 ******/
		%feature("compactdefaultargs") SetChosenMethod;
		%feature("autodoc", "
Parameters
----------
ChosenMethod: StepBasic_ActionMethod

Return
-------
None

Description
-----------
Set field ChosenMethod.
") SetChosenMethod;
		void SetChosenMethod(const opencascade::handle<StepBasic_ActionMethod> & ChosenMethod);

		/****** StepBasic_Action::SetDescription ******/
		/****** md5 signature: 11ff45bab13c9c85c44619d6c4501da8 ******/
		%feature("compactdefaultargs") SetDescription;
		%feature("autodoc", "
Parameters
----------
Description: TCollection_HAsciiString

Return
-------
None

Description
-----------
Set field Description.
") SetDescription;
		void SetDescription(const opencascade::handle<TCollection_HAsciiString> & Description);

		/****** StepBasic_Action::SetName ******/
		/****** md5 signature: 1a85c1f4dd446039f14efe98df7aeb03 ******/
		%feature("compactdefaultargs") SetName;
		%feature("autodoc", "
Parameters
----------
Name: TCollection_HAsciiString

Return
-------
None

Description
-----------
Set field Name.
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
		/****** StepBasic_ActionAssignment::StepBasic_ActionAssignment ******/
		/****** md5 signature: 595e8e3eed1fe37f26659a551189200f ******/
		%feature("compactdefaultargs") StepBasic_ActionAssignment;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") StepBasic_ActionAssignment;
		 StepBasic_ActionAssignment();

		/****** StepBasic_ActionAssignment::AssignedAction ******/
		/****** md5 signature: 72eb1f16cf7fe739f0b11b05c4309b90 ******/
		%feature("compactdefaultargs") AssignedAction;
		%feature("autodoc", "Return
-------
opencascade::handle<StepBasic_Action>

Description
-----------
Returns field AssignedAction.
") AssignedAction;
		opencascade::handle<StepBasic_Action> AssignedAction();

		/****** StepBasic_ActionAssignment::Init ******/
		/****** md5 signature: 8a6cde493e19417c3551b25b76345bd4 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
aAssignedAction: StepBasic_Action

Return
-------
None

Description
-----------
Initialize all fields (own and inherited).
") Init;
		void Init(const opencascade::handle<StepBasic_Action> & aAssignedAction);

		/****** StepBasic_ActionAssignment::SetAssignedAction ******/
		/****** md5 signature: f6c15d4c52872e0ac595e8bf46f6252c ******/
		%feature("compactdefaultargs") SetAssignedAction;
		%feature("autodoc", "
Parameters
----------
AssignedAction: StepBasic_Action

Return
-------
None

Description
-----------
Set field AssignedAction.
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
		/****** StepBasic_ActionMethod::StepBasic_ActionMethod ******/
		/****** md5 signature: 355712ef3afda592cfdf025a224c0210 ******/
		%feature("compactdefaultargs") StepBasic_ActionMethod;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") StepBasic_ActionMethod;
		 StepBasic_ActionMethod();

		/****** StepBasic_ActionMethod::Consequence ******/
		/****** md5 signature: d72d441bf4f439e9582b1bc6a7254fd1 ******/
		%feature("compactdefaultargs") Consequence;
		%feature("autodoc", "Return
-------
opencascade::handle<TCollection_HAsciiString>

Description
-----------
Returns field Consequence.
") Consequence;
		opencascade::handle<TCollection_HAsciiString> Consequence();

		/****** StepBasic_ActionMethod::Description ******/
		/****** md5 signature: 68309bdf9d57a000073490b39f8e7a41 ******/
		%feature("compactdefaultargs") Description;
		%feature("autodoc", "Return
-------
opencascade::handle<TCollection_HAsciiString>

Description
-----------
Returns field Description.
") Description;
		opencascade::handle<TCollection_HAsciiString> Description();

		/****** StepBasic_ActionMethod::HasDescription ******/
		/****** md5 signature: 819ef9a3dced474861e1980d901a2978 ******/
		%feature("compactdefaultargs") HasDescription;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if optional field Description is defined.
") HasDescription;
		Standard_Boolean HasDescription();

		/****** StepBasic_ActionMethod::Init ******/
		/****** md5 signature: 7826d0779e7b9c060c9d197517aa0fb8 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
aName: TCollection_HAsciiString
hasDescription: bool
aDescription: TCollection_HAsciiString
aConsequence: TCollection_HAsciiString
aPurpose: TCollection_HAsciiString

Return
-------
None

Description
-----------
Initialize all fields (own and inherited).
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aName, const Standard_Boolean hasDescription, const opencascade::handle<TCollection_HAsciiString> & aDescription, const opencascade::handle<TCollection_HAsciiString> & aConsequence, const opencascade::handle<TCollection_HAsciiString> & aPurpose);

		/****** StepBasic_ActionMethod::Name ******/
		/****** md5 signature: 6bcb97f17b57cae0750fd29eac20499c ******/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "Return
-------
opencascade::handle<TCollection_HAsciiString>

Description
-----------
Returns field Name.
") Name;
		opencascade::handle<TCollection_HAsciiString> Name();

		/****** StepBasic_ActionMethod::Purpose ******/
		/****** md5 signature: f96745f44705150c3273c06fb78fc3cb ******/
		%feature("compactdefaultargs") Purpose;
		%feature("autodoc", "Return
-------
opencascade::handle<TCollection_HAsciiString>

Description
-----------
Returns field Purpose.
") Purpose;
		opencascade::handle<TCollection_HAsciiString> Purpose();

		/****** StepBasic_ActionMethod::SetConsequence ******/
		/****** md5 signature: 6b60b00980537550bdc592fd3cdb3ecc ******/
		%feature("compactdefaultargs") SetConsequence;
		%feature("autodoc", "
Parameters
----------
Consequence: TCollection_HAsciiString

Return
-------
None

Description
-----------
Set field Consequence.
") SetConsequence;
		void SetConsequence(const opencascade::handle<TCollection_HAsciiString> & Consequence);

		/****** StepBasic_ActionMethod::SetDescription ******/
		/****** md5 signature: 11ff45bab13c9c85c44619d6c4501da8 ******/
		%feature("compactdefaultargs") SetDescription;
		%feature("autodoc", "
Parameters
----------
Description: TCollection_HAsciiString

Return
-------
None

Description
-----------
Set field Description.
") SetDescription;
		void SetDescription(const opencascade::handle<TCollection_HAsciiString> & Description);

		/****** StepBasic_ActionMethod::SetName ******/
		/****** md5 signature: 1a85c1f4dd446039f14efe98df7aeb03 ******/
		%feature("compactdefaultargs") SetName;
		%feature("autodoc", "
Parameters
----------
Name: TCollection_HAsciiString

Return
-------
None

Description
-----------
Set field Name.
") SetName;
		void SetName(const opencascade::handle<TCollection_HAsciiString> & Name);

		/****** StepBasic_ActionMethod::SetPurpose ******/
		/****** md5 signature: e2e7302d9004f014ab43f84f266372e2 ******/
		%feature("compactdefaultargs") SetPurpose;
		%feature("autodoc", "
Parameters
----------
Purpose: TCollection_HAsciiString

Return
-------
None

Description
-----------
Set field Purpose.
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
		/****** StepBasic_ActionRequestAssignment::StepBasic_ActionRequestAssignment ******/
		/****** md5 signature: 4d0e9e705d50f0b078df6a6749c71eb3 ******/
		%feature("compactdefaultargs") StepBasic_ActionRequestAssignment;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") StepBasic_ActionRequestAssignment;
		 StepBasic_ActionRequestAssignment();

		/****** StepBasic_ActionRequestAssignment::AssignedActionRequest ******/
		/****** md5 signature: 7a98df2fcee9e242c557417fc74f3ed5 ******/
		%feature("compactdefaultargs") AssignedActionRequest;
		%feature("autodoc", "Return
-------
opencascade::handle<StepBasic_VersionedActionRequest>

Description
-----------
Returns field AssignedActionRequest.
") AssignedActionRequest;
		opencascade::handle<StepBasic_VersionedActionRequest> AssignedActionRequest();

		/****** StepBasic_ActionRequestAssignment::Init ******/
		/****** md5 signature: 2248433b8597eca74031a1ddceb828f5 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
aAssignedActionRequest: StepBasic_VersionedActionRequest

Return
-------
None

Description
-----------
Initialize all fields (own and inherited).
") Init;
		void Init(const opencascade::handle<StepBasic_VersionedActionRequest> & aAssignedActionRequest);

		/****** StepBasic_ActionRequestAssignment::SetAssignedActionRequest ******/
		/****** md5 signature: 402c2bf11a32953f71fb434542cc68f6 ******/
		%feature("compactdefaultargs") SetAssignedActionRequest;
		%feature("autodoc", "
Parameters
----------
AssignedActionRequest: StepBasic_VersionedActionRequest

Return
-------
None

Description
-----------
Set field AssignedActionRequest.
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
		/****** StepBasic_ActionRequestSolution::StepBasic_ActionRequestSolution ******/
		/****** md5 signature: 940a84963d6508c2002230a7c949728a ******/
		%feature("compactdefaultargs") StepBasic_ActionRequestSolution;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") StepBasic_ActionRequestSolution;
		 StepBasic_ActionRequestSolution();

		/****** StepBasic_ActionRequestSolution::Init ******/
		/****** md5 signature: 40c37129d012c8ab45d38b82e1998325 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
aMethod: StepBasic_ActionMethod
aRequest: StepBasic_VersionedActionRequest

Return
-------
None

Description
-----------
Initialize all fields (own and inherited).
") Init;
		void Init(const opencascade::handle<StepBasic_ActionMethod> & aMethod, const opencascade::handle<StepBasic_VersionedActionRequest> & aRequest);

		/****** StepBasic_ActionRequestSolution::Method ******/
		/****** md5 signature: b171ee101a8141c908f3f5f234a0e461 ******/
		%feature("compactdefaultargs") Method;
		%feature("autodoc", "Return
-------
opencascade::handle<StepBasic_ActionMethod>

Description
-----------
Returns field Method.
") Method;
		opencascade::handle<StepBasic_ActionMethod> Method();

		/****** StepBasic_ActionRequestSolution::Request ******/
		/****** md5 signature: 0281fa806ec973483b8b5b4b5491cdd9 ******/
		%feature("compactdefaultargs") Request;
		%feature("autodoc", "Return
-------
opencascade::handle<StepBasic_VersionedActionRequest>

Description
-----------
Returns field Request.
") Request;
		opencascade::handle<StepBasic_VersionedActionRequest> Request();

		/****** StepBasic_ActionRequestSolution::SetMethod ******/
		/****** md5 signature: ac9eff61369b7c9d8674bc4e3b4ed147 ******/
		%feature("compactdefaultargs") SetMethod;
		%feature("autodoc", "
Parameters
----------
Method: StepBasic_ActionMethod

Return
-------
None

Description
-----------
Set field Method.
") SetMethod;
		void SetMethod(const opencascade::handle<StepBasic_ActionMethod> & Method);

		/****** StepBasic_ActionRequestSolution::SetRequest ******/
		/****** md5 signature: 24103c3dd4032cbc618121e77b6c61fc ******/
		%feature("compactdefaultargs") SetRequest;
		%feature("autodoc", "
Parameters
----------
Request: StepBasic_VersionedActionRequest

Return
-------
None

Description
-----------
Set field Request.
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
		/****** StepBasic_Address::StepBasic_Address ******/
		/****** md5 signature: 51d7407411aa4447a8d265d903b0b908 ******/
		%feature("compactdefaultargs") StepBasic_Address;
		%feature("autodoc", "Return
-------
None

Description
-----------
Returns a Address.
") StepBasic_Address;
		 StepBasic_Address();

		/****** StepBasic_Address::Country ******/
		/****** md5 signature: 74f3334686d5221e43c0c5fc2555fadf ******/
		%feature("compactdefaultargs") Country;
		%feature("autodoc", "Return
-------
opencascade::handle<TCollection_HAsciiString>

Description
-----------
No available documentation.
") Country;
		opencascade::handle<TCollection_HAsciiString> Country();

		/****** StepBasic_Address::ElectronicMailAddress ******/
		/****** md5 signature: e825d73ca4584ed5c3175af2c49e8618 ******/
		%feature("compactdefaultargs") ElectronicMailAddress;
		%feature("autodoc", "Return
-------
opencascade::handle<TCollection_HAsciiString>

Description
-----------
No available documentation.
") ElectronicMailAddress;
		opencascade::handle<TCollection_HAsciiString> ElectronicMailAddress();

		/****** StepBasic_Address::FacsimileNumber ******/
		/****** md5 signature: 01f08ca5b0a5426df4a86ba3371dbfb3 ******/
		%feature("compactdefaultargs") FacsimileNumber;
		%feature("autodoc", "Return
-------
opencascade::handle<TCollection_HAsciiString>

Description
-----------
No available documentation.
") FacsimileNumber;
		opencascade::handle<TCollection_HAsciiString> FacsimileNumber();

		/****** StepBasic_Address::HasCountry ******/
		/****** md5 signature: 1ce3e6bb4d08d96d27b0d819a8469d66 ******/
		%feature("compactdefaultargs") HasCountry;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") HasCountry;
		Standard_Boolean HasCountry();

		/****** StepBasic_Address::HasElectronicMailAddress ******/
		/****** md5 signature: 81ea220ac941ef11b314f6dfc2d97e18 ******/
		%feature("compactdefaultargs") HasElectronicMailAddress;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") HasElectronicMailAddress;
		Standard_Boolean HasElectronicMailAddress();

		/****** StepBasic_Address::HasFacsimileNumber ******/
		/****** md5 signature: 86526f58a0e19c0899c21bf1e300289c ******/
		%feature("compactdefaultargs") HasFacsimileNumber;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") HasFacsimileNumber;
		Standard_Boolean HasFacsimileNumber();

		/****** StepBasic_Address::HasInternalLocation ******/
		/****** md5 signature: 4c456397b687eeae69e492d17beca559 ******/
		%feature("compactdefaultargs") HasInternalLocation;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") HasInternalLocation;
		Standard_Boolean HasInternalLocation();

		/****** StepBasic_Address::HasPostalBox ******/
		/****** md5 signature: 95484921f02e1b869664c6a5535875a2 ******/
		%feature("compactdefaultargs") HasPostalBox;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") HasPostalBox;
		Standard_Boolean HasPostalBox();

		/****** StepBasic_Address::HasPostalCode ******/
		/****** md5 signature: 2b47ef90632417adcacdc1e6ee31bd02 ******/
		%feature("compactdefaultargs") HasPostalCode;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") HasPostalCode;
		Standard_Boolean HasPostalCode();

		/****** StepBasic_Address::HasRegion ******/
		/****** md5 signature: bc359b473bb445c68e51b7d204afcc83 ******/
		%feature("compactdefaultargs") HasRegion;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") HasRegion;
		Standard_Boolean HasRegion();

		/****** StepBasic_Address::HasStreet ******/
		/****** md5 signature: 86201ab6da114dc71231f2edd1d5f9c1 ******/
		%feature("compactdefaultargs") HasStreet;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") HasStreet;
		Standard_Boolean HasStreet();

		/****** StepBasic_Address::HasStreetNumber ******/
		/****** md5 signature: bb86e74296bea122870a329a33a78e89 ******/
		%feature("compactdefaultargs") HasStreetNumber;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") HasStreetNumber;
		Standard_Boolean HasStreetNumber();

		/****** StepBasic_Address::HasTelephoneNumber ******/
		/****** md5 signature: 8fd0ee2efbd368a0317d7f779fe85e48 ******/
		%feature("compactdefaultargs") HasTelephoneNumber;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") HasTelephoneNumber;
		Standard_Boolean HasTelephoneNumber();

		/****** StepBasic_Address::HasTelexNumber ******/
		/****** md5 signature: a844b4d42afc825f4de6ed3cf130da9f ******/
		%feature("compactdefaultargs") HasTelexNumber;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") HasTelexNumber;
		Standard_Boolean HasTelexNumber();

		/****** StepBasic_Address::HasTown ******/
		/****** md5 signature: fec9b80f36baf27abe1b4b42b8232b0e ******/
		%feature("compactdefaultargs") HasTown;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") HasTown;
		Standard_Boolean HasTown();

		/****** StepBasic_Address::Init ******/
		/****** md5 signature: d33d8382600d0bbb12af0e0a5e446d64 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
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

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const Standard_Boolean hasAinternalLocation, const opencascade::handle<TCollection_HAsciiString> & aInternalLocation, const Standard_Boolean hasAstreetNumber, const opencascade::handle<TCollection_HAsciiString> & aStreetNumber, const Standard_Boolean hasAstreet, const opencascade::handle<TCollection_HAsciiString> & aStreet, const Standard_Boolean hasApostalBox, const opencascade::handle<TCollection_HAsciiString> & aPostalBox, const Standard_Boolean hasAtown, const opencascade::handle<TCollection_HAsciiString> & aTown, const Standard_Boolean hasAregion, const opencascade::handle<TCollection_HAsciiString> & aRegion, const Standard_Boolean hasApostalCode, const opencascade::handle<TCollection_HAsciiString> & aPostalCode, const Standard_Boolean hasAcountry, const opencascade::handle<TCollection_HAsciiString> & aCountry, const Standard_Boolean hasAfacsimileNumber, const opencascade::handle<TCollection_HAsciiString> & aFacsimileNumber, const Standard_Boolean hasAtelephoneNumber, const opencascade::handle<TCollection_HAsciiString> & aTelephoneNumber, const Standard_Boolean hasAelectronicMailAddress, const opencascade::handle<TCollection_HAsciiString> & aElectronicMailAddress, const Standard_Boolean hasAtelexNumber, const opencascade::handle<TCollection_HAsciiString> & aTelexNumber);

		/****** StepBasic_Address::InternalLocation ******/
		/****** md5 signature: c116bb434e431f081d4736d9ccd73691 ******/
		%feature("compactdefaultargs") InternalLocation;
		%feature("autodoc", "Return
-------
opencascade::handle<TCollection_HAsciiString>

Description
-----------
No available documentation.
") InternalLocation;
		opencascade::handle<TCollection_HAsciiString> InternalLocation();

		/****** StepBasic_Address::PostalBox ******/
		/****** md5 signature: dfb14924a26b4ab2c6742b29e4280615 ******/
		%feature("compactdefaultargs") PostalBox;
		%feature("autodoc", "Return
-------
opencascade::handle<TCollection_HAsciiString>

Description
-----------
No available documentation.
") PostalBox;
		opencascade::handle<TCollection_HAsciiString> PostalBox();

		/****** StepBasic_Address::PostalCode ******/
		/****** md5 signature: ddbdc094a3805b9f644ddcc07b8276b1 ******/
		%feature("compactdefaultargs") PostalCode;
		%feature("autodoc", "Return
-------
opencascade::handle<TCollection_HAsciiString>

Description
-----------
No available documentation.
") PostalCode;
		opencascade::handle<TCollection_HAsciiString> PostalCode();

		/****** StepBasic_Address::Region ******/
		/****** md5 signature: 7c2ce0abb5382d7f4da62d3fa7c66475 ******/
		%feature("compactdefaultargs") Region;
		%feature("autodoc", "Return
-------
opencascade::handle<TCollection_HAsciiString>

Description
-----------
No available documentation.
") Region;
		opencascade::handle<TCollection_HAsciiString> Region();

		/****** StepBasic_Address::SetCountry ******/
		/****** md5 signature: 3bee1974196c276d04fff5458f468474 ******/
		%feature("compactdefaultargs") SetCountry;
		%feature("autodoc", "
Parameters
----------
aCountry: TCollection_HAsciiString

Return
-------
None

Description
-----------
No available documentation.
") SetCountry;
		void SetCountry(const opencascade::handle<TCollection_HAsciiString> & aCountry);

		/****** StepBasic_Address::SetElectronicMailAddress ******/
		/****** md5 signature: 04b1f781c6e3b5ca83c0a9b36cc305f5 ******/
		%feature("compactdefaultargs") SetElectronicMailAddress;
		%feature("autodoc", "
Parameters
----------
aElectronicMailAddress: TCollection_HAsciiString

Return
-------
None

Description
-----------
No available documentation.
") SetElectronicMailAddress;
		void SetElectronicMailAddress(const opencascade::handle<TCollection_HAsciiString> & aElectronicMailAddress);

		/****** StepBasic_Address::SetFacsimileNumber ******/
		/****** md5 signature: af4f76a5a2d23193ed2d60d2d638f777 ******/
		%feature("compactdefaultargs") SetFacsimileNumber;
		%feature("autodoc", "
Parameters
----------
aFacsimileNumber: TCollection_HAsciiString

Return
-------
None

Description
-----------
No available documentation.
") SetFacsimileNumber;
		void SetFacsimileNumber(const opencascade::handle<TCollection_HAsciiString> & aFacsimileNumber);

		/****** StepBasic_Address::SetInternalLocation ******/
		/****** md5 signature: 5c23f4d07d84fe4789c7b9b53e265ca9 ******/
		%feature("compactdefaultargs") SetInternalLocation;
		%feature("autodoc", "
Parameters
----------
aInternalLocation: TCollection_HAsciiString

Return
-------
None

Description
-----------
No available documentation.
") SetInternalLocation;
		void SetInternalLocation(const opencascade::handle<TCollection_HAsciiString> & aInternalLocation);

		/****** StepBasic_Address::SetPostalBox ******/
		/****** md5 signature: ead98c34473a1ab0d2b87fb5e3f9decf ******/
		%feature("compactdefaultargs") SetPostalBox;
		%feature("autodoc", "
Parameters
----------
aPostalBox: TCollection_HAsciiString

Return
-------
None

Description
-----------
No available documentation.
") SetPostalBox;
		void SetPostalBox(const opencascade::handle<TCollection_HAsciiString> & aPostalBox);

		/****** StepBasic_Address::SetPostalCode ******/
		/****** md5 signature: 41b5adf33440dd412b561e6d26efcd7d ******/
		%feature("compactdefaultargs") SetPostalCode;
		%feature("autodoc", "
Parameters
----------
aPostalCode: TCollection_HAsciiString

Return
-------
None

Description
-----------
No available documentation.
") SetPostalCode;
		void SetPostalCode(const opencascade::handle<TCollection_HAsciiString> & aPostalCode);

		/****** StepBasic_Address::SetRegion ******/
		/****** md5 signature: 6d4559dad6ba121a898d4cae062b6b31 ******/
		%feature("compactdefaultargs") SetRegion;
		%feature("autodoc", "
Parameters
----------
aRegion: TCollection_HAsciiString

Return
-------
None

Description
-----------
No available documentation.
") SetRegion;
		void SetRegion(const opencascade::handle<TCollection_HAsciiString> & aRegion);

		/****** StepBasic_Address::SetStreet ******/
		/****** md5 signature: 578e94c352d4c1e0b39847619bd90fd2 ******/
		%feature("compactdefaultargs") SetStreet;
		%feature("autodoc", "
Parameters
----------
aStreet: TCollection_HAsciiString

Return
-------
None

Description
-----------
No available documentation.
") SetStreet;
		void SetStreet(const opencascade::handle<TCollection_HAsciiString> & aStreet);

		/****** StepBasic_Address::SetStreetNumber ******/
		/****** md5 signature: e624fe5d43c72289ccee6dedd82b2dcb ******/
		%feature("compactdefaultargs") SetStreetNumber;
		%feature("autodoc", "
Parameters
----------
aStreetNumber: TCollection_HAsciiString

Return
-------
None

Description
-----------
No available documentation.
") SetStreetNumber;
		void SetStreetNumber(const opencascade::handle<TCollection_HAsciiString> & aStreetNumber);

		/****** StepBasic_Address::SetTelephoneNumber ******/
		/****** md5 signature: 2e9c221fc629cd18cf76725afa5d8b67 ******/
		%feature("compactdefaultargs") SetTelephoneNumber;
		%feature("autodoc", "
Parameters
----------
aTelephoneNumber: TCollection_HAsciiString

Return
-------
None

Description
-----------
No available documentation.
") SetTelephoneNumber;
		void SetTelephoneNumber(const opencascade::handle<TCollection_HAsciiString> & aTelephoneNumber);

		/****** StepBasic_Address::SetTelexNumber ******/
		/****** md5 signature: b27bcbd63ea3e1bd55846d6b0eebcbf2 ******/
		%feature("compactdefaultargs") SetTelexNumber;
		%feature("autodoc", "
Parameters
----------
aTelexNumber: TCollection_HAsciiString

Return
-------
None

Description
-----------
No available documentation.
") SetTelexNumber;
		void SetTelexNumber(const opencascade::handle<TCollection_HAsciiString> & aTelexNumber);

		/****** StepBasic_Address::SetTown ******/
		/****** md5 signature: 07f3e94e8ee183c80bf7bbb9ff32273b ******/
		%feature("compactdefaultargs") SetTown;
		%feature("autodoc", "
Parameters
----------
aTown: TCollection_HAsciiString

Return
-------
None

Description
-----------
No available documentation.
") SetTown;
		void SetTown(const opencascade::handle<TCollection_HAsciiString> & aTown);

		/****** StepBasic_Address::Street ******/
		/****** md5 signature: ada82df0485e23f3178a9074792b5608 ******/
		%feature("compactdefaultargs") Street;
		%feature("autodoc", "Return
-------
opencascade::handle<TCollection_HAsciiString>

Description
-----------
No available documentation.
") Street;
		opencascade::handle<TCollection_HAsciiString> Street();

		/****** StepBasic_Address::StreetNumber ******/
		/****** md5 signature: 050842ed4a185d49b5b129edf756751e ******/
		%feature("compactdefaultargs") StreetNumber;
		%feature("autodoc", "Return
-------
opencascade::handle<TCollection_HAsciiString>

Description
-----------
No available documentation.
") StreetNumber;
		opencascade::handle<TCollection_HAsciiString> StreetNumber();

		/****** StepBasic_Address::TelephoneNumber ******/
		/****** md5 signature: e29e78bd63bc21c9fbd407127acb006e ******/
		%feature("compactdefaultargs") TelephoneNumber;
		%feature("autodoc", "Return
-------
opencascade::handle<TCollection_HAsciiString>

Description
-----------
No available documentation.
") TelephoneNumber;
		opencascade::handle<TCollection_HAsciiString> TelephoneNumber();

		/****** StepBasic_Address::TelexNumber ******/
		/****** md5 signature: f177e3d3834da916021ff6b89757f141 ******/
		%feature("compactdefaultargs") TelexNumber;
		%feature("autodoc", "Return
-------
opencascade::handle<TCollection_HAsciiString>

Description
-----------
No available documentation.
") TelexNumber;
		opencascade::handle<TCollection_HAsciiString> TelexNumber();

		/****** StepBasic_Address::Town ******/
		/****** md5 signature: b24d3dd05feec07ef2a0deef61a40ddb ******/
		%feature("compactdefaultargs") Town;
		%feature("autodoc", "Return
-------
opencascade::handle<TCollection_HAsciiString>

Description
-----------
No available documentation.
") Town;
		opencascade::handle<TCollection_HAsciiString> Town();

		/****** StepBasic_Address::UnSetCountry ******/
		/****** md5 signature: 4637004448d2b13991d5c620b6a21b67 ******/
		%feature("compactdefaultargs") UnSetCountry;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") UnSetCountry;
		void UnSetCountry();

		/****** StepBasic_Address::UnSetElectronicMailAddress ******/
		/****** md5 signature: 6dd381027ae63981781fe961238d93bc ******/
		%feature("compactdefaultargs") UnSetElectronicMailAddress;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") UnSetElectronicMailAddress;
		void UnSetElectronicMailAddress();

		/****** StepBasic_Address::UnSetFacsimileNumber ******/
		/****** md5 signature: a34303fd719648c62183b2b228487ba6 ******/
		%feature("compactdefaultargs") UnSetFacsimileNumber;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") UnSetFacsimileNumber;
		void UnSetFacsimileNumber();

		/****** StepBasic_Address::UnSetInternalLocation ******/
		/****** md5 signature: 8c93226f39013884cb45bb1172f25f05 ******/
		%feature("compactdefaultargs") UnSetInternalLocation;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") UnSetInternalLocation;
		void UnSetInternalLocation();

		/****** StepBasic_Address::UnSetPostalBox ******/
		/****** md5 signature: 7a686273a96c46ea1d72700bca24588a ******/
		%feature("compactdefaultargs") UnSetPostalBox;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") UnSetPostalBox;
		void UnSetPostalBox();

		/****** StepBasic_Address::UnSetPostalCode ******/
		/****** md5 signature: 37d0d075639d414bc789a9557ac83c3f ******/
		%feature("compactdefaultargs") UnSetPostalCode;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") UnSetPostalCode;
		void UnSetPostalCode();

		/****** StepBasic_Address::UnSetRegion ******/
		/****** md5 signature: 39c51c1a7c3bf1e3025b1a4f675384a5 ******/
		%feature("compactdefaultargs") UnSetRegion;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") UnSetRegion;
		void UnSetRegion();

		/****** StepBasic_Address::UnSetStreet ******/
		/****** md5 signature: 3a02da4a111cb62fb45a9919d63f1f71 ******/
		%feature("compactdefaultargs") UnSetStreet;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") UnSetStreet;
		void UnSetStreet();

		/****** StepBasic_Address::UnSetStreetNumber ******/
		/****** md5 signature: c62baa1080603cd892efdce29c6084c9 ******/
		%feature("compactdefaultargs") UnSetStreetNumber;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") UnSetStreetNumber;
		void UnSetStreetNumber();

		/****** StepBasic_Address::UnSetTelephoneNumber ******/
		/****** md5 signature: 20cbdcd4302c34a04d35ae293b2dff56 ******/
		%feature("compactdefaultargs") UnSetTelephoneNumber;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") UnSetTelephoneNumber;
		void UnSetTelephoneNumber();

		/****** StepBasic_Address::UnSetTelexNumber ******/
		/****** md5 signature: 633cc1749aa94d405d715abf3869a736 ******/
		%feature("compactdefaultargs") UnSetTelexNumber;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") UnSetTelexNumber;
		void UnSetTelexNumber();

		/****** StepBasic_Address::UnSetTown ******/
		/****** md5 signature: 449339d8dc4f354e9c6b5c1cfb40eda2 ******/
		%feature("compactdefaultargs") UnSetTown;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
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
		/****** StepBasic_ApplicationContext::StepBasic_ApplicationContext ******/
		/****** md5 signature: 8c2011472c55a3f52a4086702c6367f2 ******/
		%feature("compactdefaultargs") StepBasic_ApplicationContext;
		%feature("autodoc", "Return
-------
None

Description
-----------
Returns a ApplicationContext.
") StepBasic_ApplicationContext;
		 StepBasic_ApplicationContext();

		/****** StepBasic_ApplicationContext::Application ******/
		/****** md5 signature: 308c1e5447c27ba915150f66327bf973 ******/
		%feature("compactdefaultargs") Application;
		%feature("autodoc", "Return
-------
opencascade::handle<TCollection_HAsciiString>

Description
-----------
No available documentation.
") Application;
		opencascade::handle<TCollection_HAsciiString> Application();

		/****** StepBasic_ApplicationContext::Init ******/
		/****** md5 signature: 16ac06cde8b7abcf10177cadc7638b7d ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
aApplication: TCollection_HAsciiString

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aApplication);

		/****** StepBasic_ApplicationContext::SetApplication ******/
		/****** md5 signature: 792ce361303a99f0b0d57a69d70a98c1 ******/
		%feature("compactdefaultargs") SetApplication;
		%feature("autodoc", "
Parameters
----------
aApplication: TCollection_HAsciiString

Return
-------
None

Description
-----------
No available documentation.
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
		/****** StepBasic_ApplicationContextElement::StepBasic_ApplicationContextElement ******/
		/****** md5 signature: 61a489fa039f7bfa30be2893118cf999 ******/
		%feature("compactdefaultargs") StepBasic_ApplicationContextElement;
		%feature("autodoc", "Return
-------
None

Description
-----------
Returns a ApplicationContextElement.
") StepBasic_ApplicationContextElement;
		 StepBasic_ApplicationContextElement();

		/****** StepBasic_ApplicationContextElement::FrameOfReference ******/
		/****** md5 signature: 9bbc03f05b4049fcb9a574d6b549107c ******/
		%feature("compactdefaultargs") FrameOfReference;
		%feature("autodoc", "Return
-------
opencascade::handle<StepBasic_ApplicationContext>

Description
-----------
No available documentation.
") FrameOfReference;
		opencascade::handle<StepBasic_ApplicationContext> FrameOfReference();

		/****** StepBasic_ApplicationContextElement::Init ******/
		/****** md5 signature: f00f181d444415175c1d8e60f9088cd8 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
aName: TCollection_HAsciiString
aFrameOfReference: StepBasic_ApplicationContext

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aName, const opencascade::handle<StepBasic_ApplicationContext> & aFrameOfReference);

		/****** StepBasic_ApplicationContextElement::Name ******/
		/****** md5 signature: 6bcb97f17b57cae0750fd29eac20499c ******/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "Return
-------
opencascade::handle<TCollection_HAsciiString>

Description
-----------
No available documentation.
") Name;
		opencascade::handle<TCollection_HAsciiString> Name();

		/****** StepBasic_ApplicationContextElement::SetFrameOfReference ******/
		/****** md5 signature: 24b7084f614d75d67a65e21887ef9abe ******/
		%feature("compactdefaultargs") SetFrameOfReference;
		%feature("autodoc", "
Parameters
----------
aFrameOfReference: StepBasic_ApplicationContext

Return
-------
None

Description
-----------
No available documentation.
") SetFrameOfReference;
		void SetFrameOfReference(const opencascade::handle<StepBasic_ApplicationContext> & aFrameOfReference);

		/****** StepBasic_ApplicationContextElement::SetName ******/
		/****** md5 signature: 1e0b00d9eb163c8a0cdbb986e2ee24f6 ******/
		%feature("compactdefaultargs") SetName;
		%feature("autodoc", "
Parameters
----------
aName: TCollection_HAsciiString

Return
-------
None

Description
-----------
No available documentation.
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
		/****** StepBasic_ApplicationProtocolDefinition::StepBasic_ApplicationProtocolDefinition ******/
		/****** md5 signature: 4dad7b491dcb378bdcf865cce8b6184c ******/
		%feature("compactdefaultargs") StepBasic_ApplicationProtocolDefinition;
		%feature("autodoc", "Return
-------
None

Description
-----------
Returns a ApplicationProtocolDefinition.
") StepBasic_ApplicationProtocolDefinition;
		 StepBasic_ApplicationProtocolDefinition();

		/****** StepBasic_ApplicationProtocolDefinition::Application ******/
		/****** md5 signature: 5e27994a34ed978581e895a467e7d1c2 ******/
		%feature("compactdefaultargs") Application;
		%feature("autodoc", "Return
-------
opencascade::handle<StepBasic_ApplicationContext>

Description
-----------
No available documentation.
") Application;
		opencascade::handle<StepBasic_ApplicationContext> Application();

		/****** StepBasic_ApplicationProtocolDefinition::ApplicationInterpretedModelSchemaName ******/
		/****** md5 signature: cb4a4c367ace373f437cf1c034c7f673 ******/
		%feature("compactdefaultargs") ApplicationInterpretedModelSchemaName;
		%feature("autodoc", "Return
-------
opencascade::handle<TCollection_HAsciiString>

Description
-----------
No available documentation.
") ApplicationInterpretedModelSchemaName;
		opencascade::handle<TCollection_HAsciiString> ApplicationInterpretedModelSchemaName();

		/****** StepBasic_ApplicationProtocolDefinition::ApplicationProtocolYear ******/
		/****** md5 signature: 5aa340807edd3920f16ae0d5bb27012c ******/
		%feature("compactdefaultargs") ApplicationProtocolYear;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") ApplicationProtocolYear;
		Standard_Integer ApplicationProtocolYear();

		/****** StepBasic_ApplicationProtocolDefinition::Init ******/
		/****** md5 signature: 89821f113658df0d9df911aec896a97e ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
aStatus: TCollection_HAsciiString
aApplicationInterpretedModelSchemaName: TCollection_HAsciiString
aApplicationProtocolYear: int
aApplication: StepBasic_ApplicationContext

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aStatus, const opencascade::handle<TCollection_HAsciiString> & aApplicationInterpretedModelSchemaName, const Standard_Integer aApplicationProtocolYear, const opencascade::handle<StepBasic_ApplicationContext> & aApplication);

		/****** StepBasic_ApplicationProtocolDefinition::SetApplication ******/
		/****** md5 signature: 5002ad95f5c2bb18905ea09de9225f67 ******/
		%feature("compactdefaultargs") SetApplication;
		%feature("autodoc", "
Parameters
----------
aApplication: StepBasic_ApplicationContext

Return
-------
None

Description
-----------
No available documentation.
") SetApplication;
		void SetApplication(const opencascade::handle<StepBasic_ApplicationContext> & aApplication);

		/****** StepBasic_ApplicationProtocolDefinition::SetApplicationInterpretedModelSchemaName ******/
		/****** md5 signature: 68114c9b1d7001f0a24df1b00ae6c5dc ******/
		%feature("compactdefaultargs") SetApplicationInterpretedModelSchemaName;
		%feature("autodoc", "
Parameters
----------
aApplicationInterpretedModelSchemaName: TCollection_HAsciiString

Return
-------
None

Description
-----------
No available documentation.
") SetApplicationInterpretedModelSchemaName;
		void SetApplicationInterpretedModelSchemaName(const opencascade::handle<TCollection_HAsciiString> & aApplicationInterpretedModelSchemaName);

		/****** StepBasic_ApplicationProtocolDefinition::SetApplicationProtocolYear ******/
		/****** md5 signature: 35614b2e37b5d58c89914240af851aa9 ******/
		%feature("compactdefaultargs") SetApplicationProtocolYear;
		%feature("autodoc", "
Parameters
----------
aApplicationProtocolYear: int

Return
-------
None

Description
-----------
No available documentation.
") SetApplicationProtocolYear;
		void SetApplicationProtocolYear(const Standard_Integer aApplicationProtocolYear);

		/****** StepBasic_ApplicationProtocolDefinition::SetStatus ******/
		/****** md5 signature: 107f0744649d6d334a46d8ec5fd375ca ******/
		%feature("compactdefaultargs") SetStatus;
		%feature("autodoc", "
Parameters
----------
aStatus: TCollection_HAsciiString

Return
-------
None

Description
-----------
No available documentation.
") SetStatus;
		void SetStatus(const opencascade::handle<TCollection_HAsciiString> & aStatus);

		/****** StepBasic_ApplicationProtocolDefinition::Status ******/
		/****** md5 signature: a1a0a98ba849d35c84ed0eac04425f86 ******/
		%feature("compactdefaultargs") Status;
		%feature("autodoc", "Return
-------
opencascade::handle<TCollection_HAsciiString>

Description
-----------
No available documentation.
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
		/****** StepBasic_Approval::StepBasic_Approval ******/
		/****** md5 signature: 338e251c98603c2fde32330241351f9e ******/
		%feature("compactdefaultargs") StepBasic_Approval;
		%feature("autodoc", "Return
-------
None

Description
-----------
Returns a Approval.
") StepBasic_Approval;
		 StepBasic_Approval();

		/****** StepBasic_Approval::Init ******/
		/****** md5 signature: b9a03e8a50a0c41d74d28e301f315c6b ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
aStatus: StepBasic_ApprovalStatus
aLevel: TCollection_HAsciiString

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const opencascade::handle<StepBasic_ApprovalStatus> & aStatus, const opencascade::handle<TCollection_HAsciiString> & aLevel);

		/****** StepBasic_Approval::Level ******/
		/****** md5 signature: df1b7fc124002555ebc008e37bdc0b3c ******/
		%feature("compactdefaultargs") Level;
		%feature("autodoc", "Return
-------
opencascade::handle<TCollection_HAsciiString>

Description
-----------
No available documentation.
") Level;
		opencascade::handle<TCollection_HAsciiString> Level();

		/****** StepBasic_Approval::SetLevel ******/
		/****** md5 signature: 49a4d8e957ff0b661b46bc4eaabf3534 ******/
		%feature("compactdefaultargs") SetLevel;
		%feature("autodoc", "
Parameters
----------
aLevel: TCollection_HAsciiString

Return
-------
None

Description
-----------
No available documentation.
") SetLevel;
		void SetLevel(const opencascade::handle<TCollection_HAsciiString> & aLevel);

		/****** StepBasic_Approval::SetStatus ******/
		/****** md5 signature: f613940b2d9062629d9bbd81cd3ff795 ******/
		%feature("compactdefaultargs") SetStatus;
		%feature("autodoc", "
Parameters
----------
aStatus: StepBasic_ApprovalStatus

Return
-------
None

Description
-----------
No available documentation.
") SetStatus;
		void SetStatus(const opencascade::handle<StepBasic_ApprovalStatus> & aStatus);

		/****** StepBasic_Approval::Status ******/
		/****** md5 signature: a46775f93ee879534a32875ef9276ff2 ******/
		%feature("compactdefaultargs") Status;
		%feature("autodoc", "Return
-------
opencascade::handle<StepBasic_ApprovalStatus>

Description
-----------
No available documentation.
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
		/****** StepBasic_ApprovalAssignment::AssignedApproval ******/
		/****** md5 signature: 4d5ba76d9576cfeefff3d3da81f0177e ******/
		%feature("compactdefaultargs") AssignedApproval;
		%feature("autodoc", "Return
-------
opencascade::handle<StepBasic_Approval>

Description
-----------
No available documentation.
") AssignedApproval;
		opencascade::handle<StepBasic_Approval> AssignedApproval();

		/****** StepBasic_ApprovalAssignment::Init ******/
		/****** md5 signature: 7284ce83a20419d08cfcd0a39acfbe2e ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
aAssignedApproval: StepBasic_Approval

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const opencascade::handle<StepBasic_Approval> & aAssignedApproval);

		/****** StepBasic_ApprovalAssignment::SetAssignedApproval ******/
		/****** md5 signature: d1cff5fd070a34ae36fc5171cfe22fc0 ******/
		%feature("compactdefaultargs") SetAssignedApproval;
		%feature("autodoc", "
Parameters
----------
aAssignedApproval: StepBasic_Approval

Return
-------
None

Description
-----------
No available documentation.
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
		/****** StepBasic_ApprovalDateTime::StepBasic_ApprovalDateTime ******/
		/****** md5 signature: 2b263300d6b80dca363758b0c36b3ede ******/
		%feature("compactdefaultargs") StepBasic_ApprovalDateTime;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") StepBasic_ApprovalDateTime;
		 StepBasic_ApprovalDateTime();

		/****** StepBasic_ApprovalDateTime::DateTime ******/
		/****** md5 signature: cb7a4fd82c6c6bfcddcf9eb7aafbef7c ******/
		%feature("compactdefaultargs") DateTime;
		%feature("autodoc", "Return
-------
StepBasic_DateTimeSelect

Description
-----------
No available documentation.
") DateTime;
		StepBasic_DateTimeSelect DateTime();

		/****** StepBasic_ApprovalDateTime::DatedApproval ******/
		/****** md5 signature: 74538e4875a9eb4c90281437db49d8b5 ******/
		%feature("compactdefaultargs") DatedApproval;
		%feature("autodoc", "Return
-------
opencascade::handle<StepBasic_Approval>

Description
-----------
No available documentation.
") DatedApproval;
		opencascade::handle<StepBasic_Approval> DatedApproval();

		/****** StepBasic_ApprovalDateTime::Init ******/
		/****** md5 signature: 13bc5025bb7f7f6eafebad5281f4f4fa ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
aDateTime: StepBasic_DateTimeSelect
aDatedApproval: StepBasic_Approval

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const StepBasic_DateTimeSelect & aDateTime, const opencascade::handle<StepBasic_Approval> & aDatedApproval);

		/****** StepBasic_ApprovalDateTime::SetDateTime ******/
		/****** md5 signature: 9a2e7ab3d1bfe0e384130695d0d474c3 ******/
		%feature("compactdefaultargs") SetDateTime;
		%feature("autodoc", "
Parameters
----------
aDateTime: StepBasic_DateTimeSelect

Return
-------
None

Description
-----------
No available documentation.
") SetDateTime;
		void SetDateTime(const StepBasic_DateTimeSelect & aDateTime);

		/****** StepBasic_ApprovalDateTime::SetDatedApproval ******/
		/****** md5 signature: 6bc036a89f04701efde7bc6e1cacb8ef ******/
		%feature("compactdefaultargs") SetDatedApproval;
		%feature("autodoc", "
Parameters
----------
aDatedApproval: StepBasic_Approval

Return
-------
None

Description
-----------
No available documentation.
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
		/****** StepBasic_ApprovalPersonOrganization::StepBasic_ApprovalPersonOrganization ******/
		/****** md5 signature: 311039f441c0ba765d5dc412889b07a3 ******/
		%feature("compactdefaultargs") StepBasic_ApprovalPersonOrganization;
		%feature("autodoc", "Return
-------
None

Description
-----------
Returns a ApprovalPersonOrganization.
") StepBasic_ApprovalPersonOrganization;
		 StepBasic_ApprovalPersonOrganization();

		/****** StepBasic_ApprovalPersonOrganization::AuthorizedApproval ******/
		/****** md5 signature: 10d71240c4a602b68872ef4c528ba7b9 ******/
		%feature("compactdefaultargs") AuthorizedApproval;
		%feature("autodoc", "Return
-------
opencascade::handle<StepBasic_Approval>

Description
-----------
No available documentation.
") AuthorizedApproval;
		opencascade::handle<StepBasic_Approval> AuthorizedApproval();

		/****** StepBasic_ApprovalPersonOrganization::Init ******/
		/****** md5 signature: dde89f718bb57e4e2ffb9e18a607120a ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
aPersonOrganization: StepBasic_PersonOrganizationSelect
aAuthorizedApproval: StepBasic_Approval
aRole: StepBasic_ApprovalRole

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const StepBasic_PersonOrganizationSelect & aPersonOrganization, const opencascade::handle<StepBasic_Approval> & aAuthorizedApproval, const opencascade::handle<StepBasic_ApprovalRole> & aRole);

		/****** StepBasic_ApprovalPersonOrganization::PersonOrganization ******/
		/****** md5 signature: 566d78faafafc12cbff4621526e74687 ******/
		%feature("compactdefaultargs") PersonOrganization;
		%feature("autodoc", "Return
-------
StepBasic_PersonOrganizationSelect

Description
-----------
No available documentation.
") PersonOrganization;
		StepBasic_PersonOrganizationSelect PersonOrganization();

		/****** StepBasic_ApprovalPersonOrganization::Role ******/
		/****** md5 signature: 0333623beeef48df191fb18c0e4044f7 ******/
		%feature("compactdefaultargs") Role;
		%feature("autodoc", "Return
-------
opencascade::handle<StepBasic_ApprovalRole>

Description
-----------
No available documentation.
") Role;
		opencascade::handle<StepBasic_ApprovalRole> Role();

		/****** StepBasic_ApprovalPersonOrganization::SetAuthorizedApproval ******/
		/****** md5 signature: ba113b8339ff294ba5f6d293830bde5a ******/
		%feature("compactdefaultargs") SetAuthorizedApproval;
		%feature("autodoc", "
Parameters
----------
aAuthorizedApproval: StepBasic_Approval

Return
-------
None

Description
-----------
No available documentation.
") SetAuthorizedApproval;
		void SetAuthorizedApproval(const opencascade::handle<StepBasic_Approval> & aAuthorizedApproval);

		/****** StepBasic_ApprovalPersonOrganization::SetPersonOrganization ******/
		/****** md5 signature: e1eea593a0a1be051e90dea770c18af5 ******/
		%feature("compactdefaultargs") SetPersonOrganization;
		%feature("autodoc", "
Parameters
----------
aPersonOrganization: StepBasic_PersonOrganizationSelect

Return
-------
None

Description
-----------
No available documentation.
") SetPersonOrganization;
		void SetPersonOrganization(const StepBasic_PersonOrganizationSelect & aPersonOrganization);

		/****** StepBasic_ApprovalPersonOrganization::SetRole ******/
		/****** md5 signature: 262e7135290c8daa4123ad515190da82 ******/
		%feature("compactdefaultargs") SetRole;
		%feature("autodoc", "
Parameters
----------
aRole: StepBasic_ApprovalRole

Return
-------
None

Description
-----------
No available documentation.
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
		/****** StepBasic_ApprovalRelationship::StepBasic_ApprovalRelationship ******/
		/****** md5 signature: ab10b8a52935b341f201a8b6ff6ec1ff ******/
		%feature("compactdefaultargs") StepBasic_ApprovalRelationship;
		%feature("autodoc", "Return
-------
None

Description
-----------
Returns a ApprovalRelationship.
") StepBasic_ApprovalRelationship;
		 StepBasic_ApprovalRelationship();

		/****** StepBasic_ApprovalRelationship::Description ******/
		/****** md5 signature: 68309bdf9d57a000073490b39f8e7a41 ******/
		%feature("compactdefaultargs") Description;
		%feature("autodoc", "Return
-------
opencascade::handle<TCollection_HAsciiString>

Description
-----------
No available documentation.
") Description;
		opencascade::handle<TCollection_HAsciiString> Description();

		/****** StepBasic_ApprovalRelationship::Init ******/
		/****** md5 signature: e9ed07306b0401392332767fa9c5d584 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
aName: TCollection_HAsciiString
aDescription: TCollection_HAsciiString
aRelatingApproval: StepBasic_Approval
aRelatedApproval: StepBasic_Approval

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aName, const opencascade::handle<TCollection_HAsciiString> & aDescription, const opencascade::handle<StepBasic_Approval> & aRelatingApproval, const opencascade::handle<StepBasic_Approval> & aRelatedApproval);

		/****** StepBasic_ApprovalRelationship::Name ******/
		/****** md5 signature: 6bcb97f17b57cae0750fd29eac20499c ******/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "Return
-------
opencascade::handle<TCollection_HAsciiString>

Description
-----------
No available documentation.
") Name;
		opencascade::handle<TCollection_HAsciiString> Name();

		/****** StepBasic_ApprovalRelationship::RelatedApproval ******/
		/****** md5 signature: 65b8fb71e85ca73766df6c3d9186b919 ******/
		%feature("compactdefaultargs") RelatedApproval;
		%feature("autodoc", "Return
-------
opencascade::handle<StepBasic_Approval>

Description
-----------
No available documentation.
") RelatedApproval;
		opencascade::handle<StepBasic_Approval> RelatedApproval();

		/****** StepBasic_ApprovalRelationship::RelatingApproval ******/
		/****** md5 signature: 12b416ad101834081000708dbf4622f3 ******/
		%feature("compactdefaultargs") RelatingApproval;
		%feature("autodoc", "Return
-------
opencascade::handle<StepBasic_Approval>

Description
-----------
No available documentation.
") RelatingApproval;
		opencascade::handle<StepBasic_Approval> RelatingApproval();

		/****** StepBasic_ApprovalRelationship::SetDescription ******/
		/****** md5 signature: adddd13a906718df58a2eee683a382cf ******/
		%feature("compactdefaultargs") SetDescription;
		%feature("autodoc", "
Parameters
----------
aDescription: TCollection_HAsciiString

Return
-------
None

Description
-----------
No available documentation.
") SetDescription;
		void SetDescription(const opencascade::handle<TCollection_HAsciiString> & aDescription);

		/****** StepBasic_ApprovalRelationship::SetName ******/
		/****** md5 signature: 1e0b00d9eb163c8a0cdbb986e2ee24f6 ******/
		%feature("compactdefaultargs") SetName;
		%feature("autodoc", "
Parameters
----------
aName: TCollection_HAsciiString

Return
-------
None

Description
-----------
No available documentation.
") SetName;
		void SetName(const opencascade::handle<TCollection_HAsciiString> & aName);

		/****** StepBasic_ApprovalRelationship::SetRelatedApproval ******/
		/****** md5 signature: 0579da27be47e5283f35195058ae46ea ******/
		%feature("compactdefaultargs") SetRelatedApproval;
		%feature("autodoc", "
Parameters
----------
aRelatedApproval: StepBasic_Approval

Return
-------
None

Description
-----------
No available documentation.
") SetRelatedApproval;
		void SetRelatedApproval(const opencascade::handle<StepBasic_Approval> & aRelatedApproval);

		/****** StepBasic_ApprovalRelationship::SetRelatingApproval ******/
		/****** md5 signature: 5a861557f09298a1c58d43c9bed5f4f0 ******/
		%feature("compactdefaultargs") SetRelatingApproval;
		%feature("autodoc", "
Parameters
----------
aRelatingApproval: StepBasic_Approval

Return
-------
None

Description
-----------
No available documentation.
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
		/****** StepBasic_ApprovalRole::StepBasic_ApprovalRole ******/
		/****** md5 signature: 6cf0a3bfe00173c2878df431b782942f ******/
		%feature("compactdefaultargs") StepBasic_ApprovalRole;
		%feature("autodoc", "Return
-------
None

Description
-----------
Returns a ApprovalRole.
") StepBasic_ApprovalRole;
		 StepBasic_ApprovalRole();

		/****** StepBasic_ApprovalRole::Init ******/
		/****** md5 signature: 60b74fd80a966219dbfa0ba605d08186 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
aRole: TCollection_HAsciiString

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aRole);

		/****** StepBasic_ApprovalRole::Role ******/
		/****** md5 signature: 0ccc8f92b3a48f32feb6e452dff13748 ******/
		%feature("compactdefaultargs") Role;
		%feature("autodoc", "Return
-------
opencascade::handle<TCollection_HAsciiString>

Description
-----------
No available documentation.
") Role;
		opencascade::handle<TCollection_HAsciiString> Role();

		/****** StepBasic_ApprovalRole::SetRole ******/
		/****** md5 signature: ad28e5bfe58174606ce6905a40c064cc ******/
		%feature("compactdefaultargs") SetRole;
		%feature("autodoc", "
Parameters
----------
aRole: TCollection_HAsciiString

Return
-------
None

Description
-----------
No available documentation.
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
		/****** StepBasic_ApprovalStatus::StepBasic_ApprovalStatus ******/
		/****** md5 signature: f93981b8b09b7d8720a3f53f603b731e ******/
		%feature("compactdefaultargs") StepBasic_ApprovalStatus;
		%feature("autodoc", "Return
-------
None

Description
-----------
Returns a ApprovalStatus.
") StepBasic_ApprovalStatus;
		 StepBasic_ApprovalStatus();

		/****** StepBasic_ApprovalStatus::Init ******/
		/****** md5 signature: e10f4ffe4365262d2d9a5484d96325b8 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
aName: TCollection_HAsciiString

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aName);

		/****** StepBasic_ApprovalStatus::Name ******/
		/****** md5 signature: 6bcb97f17b57cae0750fd29eac20499c ******/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "Return
-------
opencascade::handle<TCollection_HAsciiString>

Description
-----------
No available documentation.
") Name;
		opencascade::handle<TCollection_HAsciiString> Name();

		/****** StepBasic_ApprovalStatus::SetName ******/
		/****** md5 signature: 1e0b00d9eb163c8a0cdbb986e2ee24f6 ******/
		%feature("compactdefaultargs") SetName;
		%feature("autodoc", "
Parameters
----------
aName: TCollection_HAsciiString

Return
-------
None

Description
-----------
No available documentation.
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
		/****** StepBasic_Certification::StepBasic_Certification ******/
		/****** md5 signature: 256ff040a94a97cbc4ba0851c0ac034f ******/
		%feature("compactdefaultargs") StepBasic_Certification;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") StepBasic_Certification;
		 StepBasic_Certification();

		/****** StepBasic_Certification::Init ******/
		/****** md5 signature: 3a4abb16fc5d13b87c5a7d62bef7a548 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
aName: TCollection_HAsciiString
aPurpose: TCollection_HAsciiString
aKind: StepBasic_CertificationType

Return
-------
None

Description
-----------
Initialize all fields (own and inherited).
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aName, const opencascade::handle<TCollection_HAsciiString> & aPurpose, const opencascade::handle<StepBasic_CertificationType> & aKind);

		/****** StepBasic_Certification::Kind ******/
		/****** md5 signature: 89e4cf9e9adf97026cb6e71a2269c995 ******/
		%feature("compactdefaultargs") Kind;
		%feature("autodoc", "Return
-------
opencascade::handle<StepBasic_CertificationType>

Description
-----------
Returns field Kind.
") Kind;
		opencascade::handle<StepBasic_CertificationType> Kind();

		/****** StepBasic_Certification::Name ******/
		/****** md5 signature: 6bcb97f17b57cae0750fd29eac20499c ******/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "Return
-------
opencascade::handle<TCollection_HAsciiString>

Description
-----------
Returns field Name.
") Name;
		opencascade::handle<TCollection_HAsciiString> Name();

		/****** StepBasic_Certification::Purpose ******/
		/****** md5 signature: f96745f44705150c3273c06fb78fc3cb ******/
		%feature("compactdefaultargs") Purpose;
		%feature("autodoc", "Return
-------
opencascade::handle<TCollection_HAsciiString>

Description
-----------
Returns field Purpose.
") Purpose;
		opencascade::handle<TCollection_HAsciiString> Purpose();

		/****** StepBasic_Certification::SetKind ******/
		/****** md5 signature: 6fa88782eeab3b59dea7606b8f46132c ******/
		%feature("compactdefaultargs") SetKind;
		%feature("autodoc", "
Parameters
----------
Kind: StepBasic_CertificationType

Return
-------
None

Description
-----------
Set field Kind.
") SetKind;
		void SetKind(const opencascade::handle<StepBasic_CertificationType> & Kind);

		/****** StepBasic_Certification::SetName ******/
		/****** md5 signature: 1a85c1f4dd446039f14efe98df7aeb03 ******/
		%feature("compactdefaultargs") SetName;
		%feature("autodoc", "
Parameters
----------
Name: TCollection_HAsciiString

Return
-------
None

Description
-----------
Set field Name.
") SetName;
		void SetName(const opencascade::handle<TCollection_HAsciiString> & Name);

		/****** StepBasic_Certification::SetPurpose ******/
		/****** md5 signature: e2e7302d9004f014ab43f84f266372e2 ******/
		%feature("compactdefaultargs") SetPurpose;
		%feature("autodoc", "
Parameters
----------
Purpose: TCollection_HAsciiString

Return
-------
None

Description
-----------
Set field Purpose.
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
		/****** StepBasic_CertificationAssignment::StepBasic_CertificationAssignment ******/
		/****** md5 signature: d02fab2841dc9f7a350b9cc7043ce02a ******/
		%feature("compactdefaultargs") StepBasic_CertificationAssignment;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") StepBasic_CertificationAssignment;
		 StepBasic_CertificationAssignment();

		/****** StepBasic_CertificationAssignment::AssignedCertification ******/
		/****** md5 signature: 9da655bef7b5ff0ce2d0d2f948c84720 ******/
		%feature("compactdefaultargs") AssignedCertification;
		%feature("autodoc", "Return
-------
opencascade::handle<StepBasic_Certification>

Description
-----------
Returns field AssignedCertification.
") AssignedCertification;
		opencascade::handle<StepBasic_Certification> AssignedCertification();

		/****** StepBasic_CertificationAssignment::Init ******/
		/****** md5 signature: f89d801a12982dd21674f022694b7180 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
aAssignedCertification: StepBasic_Certification

Return
-------
None

Description
-----------
Initialize all fields (own and inherited).
") Init;
		void Init(const opencascade::handle<StepBasic_Certification> & aAssignedCertification);

		/****** StepBasic_CertificationAssignment::SetAssignedCertification ******/
		/****** md5 signature: 40ada9a253c61bb2b154a06a8f7e1e8d ******/
		%feature("compactdefaultargs") SetAssignedCertification;
		%feature("autodoc", "
Parameters
----------
AssignedCertification: StepBasic_Certification

Return
-------
None

Description
-----------
Set field AssignedCertification.
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
		/****** StepBasic_CertificationType::StepBasic_CertificationType ******/
		/****** md5 signature: dd6ab247b4abdc32b962f6763d2c1770 ******/
		%feature("compactdefaultargs") StepBasic_CertificationType;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") StepBasic_CertificationType;
		 StepBasic_CertificationType();

		/****** StepBasic_CertificationType::Description ******/
		/****** md5 signature: 68309bdf9d57a000073490b39f8e7a41 ******/
		%feature("compactdefaultargs") Description;
		%feature("autodoc", "Return
-------
opencascade::handle<TCollection_HAsciiString>

Description
-----------
Returns field Description.
") Description;
		opencascade::handle<TCollection_HAsciiString> Description();

		/****** StepBasic_CertificationType::Init ******/
		/****** md5 signature: be36038110c32f83ea372f13d3703c13 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
aDescription: TCollection_HAsciiString

Return
-------
None

Description
-----------
Initialize all fields (own and inherited).
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aDescription);

		/****** StepBasic_CertificationType::SetDescription ******/
		/****** md5 signature: 11ff45bab13c9c85c44619d6c4501da8 ******/
		%feature("compactdefaultargs") SetDescription;
		%feature("autodoc", "
Parameters
----------
Description: TCollection_HAsciiString

Return
-------
None

Description
-----------
Set field Description.
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
		/****** StepBasic_CharacterizedObject::StepBasic_CharacterizedObject ******/
		/****** md5 signature: 15e0bac8d90dcca6ea304bff3ec9ec3c ******/
		%feature("compactdefaultargs") StepBasic_CharacterizedObject;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") StepBasic_CharacterizedObject;
		 StepBasic_CharacterizedObject();

		/****** StepBasic_CharacterizedObject::Description ******/
		/****** md5 signature: 68309bdf9d57a000073490b39f8e7a41 ******/
		%feature("compactdefaultargs") Description;
		%feature("autodoc", "Return
-------
opencascade::handle<TCollection_HAsciiString>

Description
-----------
Returns field Description.
") Description;
		opencascade::handle<TCollection_HAsciiString> Description();

		/****** StepBasic_CharacterizedObject::HasDescription ******/
		/****** md5 signature: 819ef9a3dced474861e1980d901a2978 ******/
		%feature("compactdefaultargs") HasDescription;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if optional field Description is defined.
") HasDescription;
		Standard_Boolean HasDescription();

		/****** StepBasic_CharacterizedObject::Init ******/
		/****** md5 signature: f1e00464b915b5c43dbfec20d469b99a ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
aName: TCollection_HAsciiString
hasDescription: bool
aDescription: TCollection_HAsciiString

Return
-------
None

Description
-----------
Initialize all fields (own and inherited).
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aName, const Standard_Boolean hasDescription, const opencascade::handle<TCollection_HAsciiString> & aDescription);

		/****** StepBasic_CharacterizedObject::Name ******/
		/****** md5 signature: 6bcb97f17b57cae0750fd29eac20499c ******/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "Return
-------
opencascade::handle<TCollection_HAsciiString>

Description
-----------
Returns field Name.
") Name;
		opencascade::handle<TCollection_HAsciiString> Name();

		/****** StepBasic_CharacterizedObject::SetDescription ******/
		/****** md5 signature: 11ff45bab13c9c85c44619d6c4501da8 ******/
		%feature("compactdefaultargs") SetDescription;
		%feature("autodoc", "
Parameters
----------
Description: TCollection_HAsciiString

Return
-------
None

Description
-----------
Set field Description.
") SetDescription;
		void SetDescription(const opencascade::handle<TCollection_HAsciiString> & Description);

		/****** StepBasic_CharacterizedObject::SetName ******/
		/****** md5 signature: 1a85c1f4dd446039f14efe98df7aeb03 ******/
		%feature("compactdefaultargs") SetName;
		%feature("autodoc", "
Parameters
----------
Name: TCollection_HAsciiString

Return
-------
None

Description
-----------
Set field Name.
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
		/****** StepBasic_Contract::StepBasic_Contract ******/
		/****** md5 signature: 8adc4315b27fed9e9c1c31eea7c39858 ******/
		%feature("compactdefaultargs") StepBasic_Contract;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") StepBasic_Contract;
		 StepBasic_Contract();

		/****** StepBasic_Contract::Init ******/
		/****** md5 signature: 49cb3c5b27284e6c9b50c78a4b394207 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
aName: TCollection_HAsciiString
aPurpose: TCollection_HAsciiString
aKind: StepBasic_ContractType

Return
-------
None

Description
-----------
Initialize all fields (own and inherited).
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aName, const opencascade::handle<TCollection_HAsciiString> & aPurpose, const opencascade::handle<StepBasic_ContractType> & aKind);

		/****** StepBasic_Contract::Kind ******/
		/****** md5 signature: 07196d8be1e0ee5573a0aa2cbb7ffb9b ******/
		%feature("compactdefaultargs") Kind;
		%feature("autodoc", "Return
-------
opencascade::handle<StepBasic_ContractType>

Description
-----------
Returns field Kind.
") Kind;
		opencascade::handle<StepBasic_ContractType> Kind();

		/****** StepBasic_Contract::Name ******/
		/****** md5 signature: 6bcb97f17b57cae0750fd29eac20499c ******/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "Return
-------
opencascade::handle<TCollection_HAsciiString>

Description
-----------
Returns field Name.
") Name;
		opencascade::handle<TCollection_HAsciiString> Name();

		/****** StepBasic_Contract::Purpose ******/
		/****** md5 signature: f96745f44705150c3273c06fb78fc3cb ******/
		%feature("compactdefaultargs") Purpose;
		%feature("autodoc", "Return
-------
opencascade::handle<TCollection_HAsciiString>

Description
-----------
Returns field Purpose.
") Purpose;
		opencascade::handle<TCollection_HAsciiString> Purpose();

		/****** StepBasic_Contract::SetKind ******/
		/****** md5 signature: 8b4fd596f48ea232415b56e5d623934a ******/
		%feature("compactdefaultargs") SetKind;
		%feature("autodoc", "
Parameters
----------
Kind: StepBasic_ContractType

Return
-------
None

Description
-----------
Set field Kind.
") SetKind;
		void SetKind(const opencascade::handle<StepBasic_ContractType> & Kind);

		/****** StepBasic_Contract::SetName ******/
		/****** md5 signature: 1a85c1f4dd446039f14efe98df7aeb03 ******/
		%feature("compactdefaultargs") SetName;
		%feature("autodoc", "
Parameters
----------
Name: TCollection_HAsciiString

Return
-------
None

Description
-----------
Set field Name.
") SetName;
		void SetName(const opencascade::handle<TCollection_HAsciiString> & Name);

		/****** StepBasic_Contract::SetPurpose ******/
		/****** md5 signature: e2e7302d9004f014ab43f84f266372e2 ******/
		%feature("compactdefaultargs") SetPurpose;
		%feature("autodoc", "
Parameters
----------
Purpose: TCollection_HAsciiString

Return
-------
None

Description
-----------
Set field Purpose.
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
		/****** StepBasic_ContractAssignment::StepBasic_ContractAssignment ******/
		/****** md5 signature: 68c771ced0c9093ea35470b44cd534a4 ******/
		%feature("compactdefaultargs") StepBasic_ContractAssignment;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") StepBasic_ContractAssignment;
		 StepBasic_ContractAssignment();

		/****** StepBasic_ContractAssignment::AssignedContract ******/
		/****** md5 signature: e3d05f6d7da7b92b04aebb3e3e037a61 ******/
		%feature("compactdefaultargs") AssignedContract;
		%feature("autodoc", "Return
-------
opencascade::handle<StepBasic_Contract>

Description
-----------
Returns field AssignedContract.
") AssignedContract;
		opencascade::handle<StepBasic_Contract> AssignedContract();

		/****** StepBasic_ContractAssignment::Init ******/
		/****** md5 signature: 5bd671f766387d4a424059b9e184068f ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
aAssignedContract: StepBasic_Contract

Return
-------
None

Description
-----------
Initialize all fields (own and inherited).
") Init;
		void Init(const opencascade::handle<StepBasic_Contract> & aAssignedContract);

		/****** StepBasic_ContractAssignment::SetAssignedContract ******/
		/****** md5 signature: ca4ee60b5b5b700b91efb142dc59b69f ******/
		%feature("compactdefaultargs") SetAssignedContract;
		%feature("autodoc", "
Parameters
----------
AssignedContract: StepBasic_Contract

Return
-------
None

Description
-----------
Set field AssignedContract.
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
		/****** StepBasic_ContractType::StepBasic_ContractType ******/
		/****** md5 signature: a8162f37f2922f84aebee777a9cc0697 ******/
		%feature("compactdefaultargs") StepBasic_ContractType;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") StepBasic_ContractType;
		 StepBasic_ContractType();

		/****** StepBasic_ContractType::Description ******/
		/****** md5 signature: 68309bdf9d57a000073490b39f8e7a41 ******/
		%feature("compactdefaultargs") Description;
		%feature("autodoc", "Return
-------
opencascade::handle<TCollection_HAsciiString>

Description
-----------
Returns field Description.
") Description;
		opencascade::handle<TCollection_HAsciiString> Description();

		/****** StepBasic_ContractType::Init ******/
		/****** md5 signature: be36038110c32f83ea372f13d3703c13 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
aDescription: TCollection_HAsciiString

Return
-------
None

Description
-----------
Initialize all fields (own and inherited).
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aDescription);

		/****** StepBasic_ContractType::SetDescription ******/
		/****** md5 signature: 11ff45bab13c9c85c44619d6c4501da8 ******/
		%feature("compactdefaultargs") SetDescription;
		%feature("autodoc", "
Parameters
----------
Description: TCollection_HAsciiString

Return
-------
None

Description
-----------
Set field Description.
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
		/****** StepBasic_CoordinatedUniversalTimeOffset::StepBasic_CoordinatedUniversalTimeOffset ******/
		/****** md5 signature: 395510ab669236fa311e220fde7ec4d8 ******/
		%feature("compactdefaultargs") StepBasic_CoordinatedUniversalTimeOffset;
		%feature("autodoc", "Return
-------
None

Description
-----------
Returns a CoordinatedUniversalTimeOffset.
") StepBasic_CoordinatedUniversalTimeOffset;
		 StepBasic_CoordinatedUniversalTimeOffset();

		/****** StepBasic_CoordinatedUniversalTimeOffset::HasMinuteOffset ******/
		/****** md5 signature: af3122b9f8906b004c5daa252eea1422 ******/
		%feature("compactdefaultargs") HasMinuteOffset;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") HasMinuteOffset;
		Standard_Boolean HasMinuteOffset();

		/****** StepBasic_CoordinatedUniversalTimeOffset::HourOffset ******/
		/****** md5 signature: 4c0dd37eb1ce532b818d36eb9dae7b81 ******/
		%feature("compactdefaultargs") HourOffset;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") HourOffset;
		Standard_Integer HourOffset();

		/****** StepBasic_CoordinatedUniversalTimeOffset::Init ******/
		/****** md5 signature: 6b061cfd44045f0c8993f60df4c4b7f5 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
aHourOffset: int
hasAminuteOffset: bool
aMinuteOffset: int
aSense: StepBasic_AheadOrBehind

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const Standard_Integer aHourOffset, const Standard_Boolean hasAminuteOffset, const Standard_Integer aMinuteOffset, const StepBasic_AheadOrBehind aSense);

		/****** StepBasic_CoordinatedUniversalTimeOffset::MinuteOffset ******/
		/****** md5 signature: 30e1c95a127a1d0724954e859fbe2a43 ******/
		%feature("compactdefaultargs") MinuteOffset;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") MinuteOffset;
		Standard_Integer MinuteOffset();

		/****** StepBasic_CoordinatedUniversalTimeOffset::Sense ******/
		/****** md5 signature: ad939b311acf5e83551d25181ed31d53 ******/
		%feature("compactdefaultargs") Sense;
		%feature("autodoc", "Return
-------
StepBasic_AheadOrBehind

Description
-----------
No available documentation.
") Sense;
		StepBasic_AheadOrBehind Sense();

		/****** StepBasic_CoordinatedUniversalTimeOffset::SetHourOffset ******/
		/****** md5 signature: 0441a5b80d27db5caa172436733a436c ******/
		%feature("compactdefaultargs") SetHourOffset;
		%feature("autodoc", "
Parameters
----------
aHourOffset: int

Return
-------
None

Description
-----------
No available documentation.
") SetHourOffset;
		void SetHourOffset(const Standard_Integer aHourOffset);

		/****** StepBasic_CoordinatedUniversalTimeOffset::SetMinuteOffset ******/
		/****** md5 signature: 4c70cd859d0d800333fddf3708b34dde ******/
		%feature("compactdefaultargs") SetMinuteOffset;
		%feature("autodoc", "
Parameters
----------
aMinuteOffset: int

Return
-------
None

Description
-----------
No available documentation.
") SetMinuteOffset;
		void SetMinuteOffset(const Standard_Integer aMinuteOffset);

		/****** StepBasic_CoordinatedUniversalTimeOffset::SetSense ******/
		/****** md5 signature: 45ba15dfd6ec7af96446c8dba03b8a25 ******/
		%feature("compactdefaultargs") SetSense;
		%feature("autodoc", "
Parameters
----------
aSense: StepBasic_AheadOrBehind

Return
-------
None

Description
-----------
No available documentation.
") SetSense;
		void SetSense(const StepBasic_AheadOrBehind aSense);

		/****** StepBasic_CoordinatedUniversalTimeOffset::UnSetMinuteOffset ******/
		/****** md5 signature: 2a58e1a76d964dbf1bc0df5ddfed6e56 ******/
		%feature("compactdefaultargs") UnSetMinuteOffset;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
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
		/****** StepBasic_Date::StepBasic_Date ******/
		/****** md5 signature: ecc9da05e024640a0770d7809933a8d0 ******/
		%feature("compactdefaultargs") StepBasic_Date;
		%feature("autodoc", "Return
-------
None

Description
-----------
Returns a Date.
") StepBasic_Date;
		 StepBasic_Date();

		/****** StepBasic_Date::Init ******/
		/****** md5 signature: ddbee21a52389de649c5017635aa5c9e ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
aYearComponent: int

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const Standard_Integer aYearComponent);

		/****** StepBasic_Date::SetYearComponent ******/
		/****** md5 signature: 4959ea70854b0a273072b256155cbbde ******/
		%feature("compactdefaultargs") SetYearComponent;
		%feature("autodoc", "
Parameters
----------
aYearComponent: int

Return
-------
None

Description
-----------
No available documentation.
") SetYearComponent;
		void SetYearComponent(const Standard_Integer aYearComponent);

		/****** StepBasic_Date::YearComponent ******/
		/****** md5 signature: f48f5c06e36f7cd7e511889665e2e6aa ******/
		%feature("compactdefaultargs") YearComponent;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
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
		/****** StepBasic_DateAndTime::StepBasic_DateAndTime ******/
		/****** md5 signature: 9cd582dbb46cbbe2114c91c543732014 ******/
		%feature("compactdefaultargs") StepBasic_DateAndTime;
		%feature("autodoc", "Return
-------
None

Description
-----------
Returns a DateAndTime.
") StepBasic_DateAndTime;
		 StepBasic_DateAndTime();

		/****** StepBasic_DateAndTime::DateComponent ******/
		/****** md5 signature: 489cfdb6f69d3d3a0c9ed0ea5d354235 ******/
		%feature("compactdefaultargs") DateComponent;
		%feature("autodoc", "Return
-------
opencascade::handle<StepBasic_Date>

Description
-----------
No available documentation.
") DateComponent;
		opencascade::handle<StepBasic_Date> DateComponent();

		/****** StepBasic_DateAndTime::Init ******/
		/****** md5 signature: 17d5c51f80d0b96dbceb0dddd41a6612 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
aDateComponent: StepBasic_Date
aTimeComponent: StepBasic_LocalTime

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const opencascade::handle<StepBasic_Date> & aDateComponent, const opencascade::handle<StepBasic_LocalTime> & aTimeComponent);

		/****** StepBasic_DateAndTime::SetDateComponent ******/
		/****** md5 signature: 794aebfdcd573da425a925ec3d9857a4 ******/
		%feature("compactdefaultargs") SetDateComponent;
		%feature("autodoc", "
Parameters
----------
aDateComponent: StepBasic_Date

Return
-------
None

Description
-----------
No available documentation.
") SetDateComponent;
		void SetDateComponent(const opencascade::handle<StepBasic_Date> & aDateComponent);

		/****** StepBasic_DateAndTime::SetTimeComponent ******/
		/****** md5 signature: ebaaac5ce5f28bdfc11d472d1cff9833 ******/
		%feature("compactdefaultargs") SetTimeComponent;
		%feature("autodoc", "
Parameters
----------
aTimeComponent: StepBasic_LocalTime

Return
-------
None

Description
-----------
No available documentation.
") SetTimeComponent;
		void SetTimeComponent(const opencascade::handle<StepBasic_LocalTime> & aTimeComponent);

		/****** StepBasic_DateAndTime::TimeComponent ******/
		/****** md5 signature: 03e89852edaa0e3dc86a7fc466be85bb ******/
		%feature("compactdefaultargs") TimeComponent;
		%feature("autodoc", "Return
-------
opencascade::handle<StepBasic_LocalTime>

Description
-----------
No available documentation.
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
		/****** StepBasic_DateAndTimeAssignment::AssignedDateAndTime ******/
		/****** md5 signature: d1b3cf813bbe0bff6bf61aa430f9d027 ******/
		%feature("compactdefaultargs") AssignedDateAndTime;
		%feature("autodoc", "Return
-------
opencascade::handle<StepBasic_DateAndTime>

Description
-----------
No available documentation.
") AssignedDateAndTime;
		opencascade::handle<StepBasic_DateAndTime> AssignedDateAndTime();

		/****** StepBasic_DateAndTimeAssignment::Init ******/
		/****** md5 signature: 47c4f936da2d70e0f3417adf86d63462 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
aAssignedDateAndTime: StepBasic_DateAndTime
aRole: StepBasic_DateTimeRole

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const opencascade::handle<StepBasic_DateAndTime> & aAssignedDateAndTime, const opencascade::handle<StepBasic_DateTimeRole> & aRole);

		/****** StepBasic_DateAndTimeAssignment::Role ******/
		/****** md5 signature: 92407bceb2cd675d2322f8260a9dfd28 ******/
		%feature("compactdefaultargs") Role;
		%feature("autodoc", "Return
-------
opencascade::handle<StepBasic_DateTimeRole>

Description
-----------
No available documentation.
") Role;
		opencascade::handle<StepBasic_DateTimeRole> Role();

		/****** StepBasic_DateAndTimeAssignment::SetAssignedDateAndTime ******/
		/****** md5 signature: 7b785578a6c5efa6004359bcf745425d ******/
		%feature("compactdefaultargs") SetAssignedDateAndTime;
		%feature("autodoc", "
Parameters
----------
aAssignedDateAndTime: StepBasic_DateAndTime

Return
-------
None

Description
-----------
No available documentation.
") SetAssignedDateAndTime;
		void SetAssignedDateAndTime(const opencascade::handle<StepBasic_DateAndTime> & aAssignedDateAndTime);

		/****** StepBasic_DateAndTimeAssignment::SetRole ******/
		/****** md5 signature: e3853c13a8ba0a5e973059d4d50e6924 ******/
		%feature("compactdefaultargs") SetRole;
		%feature("autodoc", "
Parameters
----------
aRole: StepBasic_DateTimeRole

Return
-------
None

Description
-----------
No available documentation.
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
		/****** StepBasic_DateAssignment::AssignedDate ******/
		/****** md5 signature: e22aa3d23eb544dd0c23a68148fe673a ******/
		%feature("compactdefaultargs") AssignedDate;
		%feature("autodoc", "Return
-------
opencascade::handle<StepBasic_Date>

Description
-----------
No available documentation.
") AssignedDate;
		opencascade::handle<StepBasic_Date> AssignedDate();

		/****** StepBasic_DateAssignment::Init ******/
		/****** md5 signature: 8c38094c9d3624f9f159a3ceb779e28c ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
aAssignedDate: StepBasic_Date
aRole: StepBasic_DateRole

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const opencascade::handle<StepBasic_Date> & aAssignedDate, const opencascade::handle<StepBasic_DateRole> & aRole);

		/****** StepBasic_DateAssignment::Role ******/
		/****** md5 signature: cbb15dc80fb24bd4e944dd585c2e3409 ******/
		%feature("compactdefaultargs") Role;
		%feature("autodoc", "Return
-------
opencascade::handle<StepBasic_DateRole>

Description
-----------
No available documentation.
") Role;
		opencascade::handle<StepBasic_DateRole> Role();

		/****** StepBasic_DateAssignment::SetAssignedDate ******/
		/****** md5 signature: 888717b26ec51d80c375cc1f191cc9da ******/
		%feature("compactdefaultargs") SetAssignedDate;
		%feature("autodoc", "
Parameters
----------
aAssignedDate: StepBasic_Date

Return
-------
None

Description
-----------
No available documentation.
") SetAssignedDate;
		void SetAssignedDate(const opencascade::handle<StepBasic_Date> & aAssignedDate);

		/****** StepBasic_DateAssignment::SetRole ******/
		/****** md5 signature: d2ee3b52f2dea3e8ef0bcd0f11e8246b ******/
		%feature("compactdefaultargs") SetRole;
		%feature("autodoc", "
Parameters
----------
aRole: StepBasic_DateRole

Return
-------
None

Description
-----------
No available documentation.
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
		/****** StepBasic_DateRole::StepBasic_DateRole ******/
		/****** md5 signature: f824bc9223892416b8000338429318c0 ******/
		%feature("compactdefaultargs") StepBasic_DateRole;
		%feature("autodoc", "Return
-------
None

Description
-----------
Returns a DateRole.
") StepBasic_DateRole;
		 StepBasic_DateRole();

		/****** StepBasic_DateRole::Init ******/
		/****** md5 signature: e10f4ffe4365262d2d9a5484d96325b8 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
aName: TCollection_HAsciiString

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aName);

		/****** StepBasic_DateRole::Name ******/
		/****** md5 signature: 6bcb97f17b57cae0750fd29eac20499c ******/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "Return
-------
opencascade::handle<TCollection_HAsciiString>

Description
-----------
No available documentation.
") Name;
		opencascade::handle<TCollection_HAsciiString> Name();

		/****** StepBasic_DateRole::SetName ******/
		/****** md5 signature: 1e0b00d9eb163c8a0cdbb986e2ee24f6 ******/
		%feature("compactdefaultargs") SetName;
		%feature("autodoc", "
Parameters
----------
aName: TCollection_HAsciiString

Return
-------
None

Description
-----------
No available documentation.
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
		/****** StepBasic_DateTimeRole::StepBasic_DateTimeRole ******/
		/****** md5 signature: df49a6aec2c253830be79ab0f95152d0 ******/
		%feature("compactdefaultargs") StepBasic_DateTimeRole;
		%feature("autodoc", "Return
-------
None

Description
-----------
Returns a DateTimeRole.
") StepBasic_DateTimeRole;
		 StepBasic_DateTimeRole();

		/****** StepBasic_DateTimeRole::Init ******/
		/****** md5 signature: e10f4ffe4365262d2d9a5484d96325b8 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
aName: TCollection_HAsciiString

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aName);

		/****** StepBasic_DateTimeRole::Name ******/
		/****** md5 signature: 6bcb97f17b57cae0750fd29eac20499c ******/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "Return
-------
opencascade::handle<TCollection_HAsciiString>

Description
-----------
No available documentation.
") Name;
		opencascade::handle<TCollection_HAsciiString> Name();

		/****** StepBasic_DateTimeRole::SetName ******/
		/****** md5 signature: 1e0b00d9eb163c8a0cdbb986e2ee24f6 ******/
		%feature("compactdefaultargs") SetName;
		%feature("autodoc", "
Parameters
----------
aName: TCollection_HAsciiString

Return
-------
None

Description
-----------
No available documentation.
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
		/****** StepBasic_DateTimeSelect::StepBasic_DateTimeSelect ******/
		/****** md5 signature: d1f32dd3fec1fa7373c6b7933c23777f ******/
		%feature("compactdefaultargs") StepBasic_DateTimeSelect;
		%feature("autodoc", "Return
-------
None

Description
-----------
Returns a DateTimeSelect SelectType.
") StepBasic_DateTimeSelect;
		 StepBasic_DateTimeSelect();

		/****** StepBasic_DateTimeSelect::CaseNum ******/
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
Recognizes a DateTimeSelect Kind Entity that is: 1 -> Date 2 -> LocalTime 3 -> DateAndTime 0 else.
") CaseNum;
		Standard_Integer CaseNum(const opencascade::handle<Standard_Transient> & ent);

		/****** StepBasic_DateTimeSelect::Date ******/
		/****** md5 signature: 532dbd3fde99bd0fbaabc8918d336136 ******/
		%feature("compactdefaultargs") Date;
		%feature("autodoc", "Return
-------
opencascade::handle<StepBasic_Date>

Description
-----------
returns Value as a Date (Null if another type).
") Date;
		opencascade::handle<StepBasic_Date> Date();

		/****** StepBasic_DateTimeSelect::DateAndTime ******/
		/****** md5 signature: 7a7bd4d287039626bd3a9ff7e9fc4b33 ******/
		%feature("compactdefaultargs") DateAndTime;
		%feature("autodoc", "Return
-------
opencascade::handle<StepBasic_DateAndTime>

Description
-----------
returns Value as a DateAndTime (Null if another type).
") DateAndTime;
		opencascade::handle<StepBasic_DateAndTime> DateAndTime();

		/****** StepBasic_DateTimeSelect::LocalTime ******/
		/****** md5 signature: 5c186aee9efdec35165319298e49ed34 ******/
		%feature("compactdefaultargs") LocalTime;
		%feature("autodoc", "Return
-------
opencascade::handle<StepBasic_LocalTime>

Description
-----------
returns Value as a LocalTime (Null if another type).
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
		/****** StepBasic_DerivedUnit::StepBasic_DerivedUnit ******/
		/****** md5 signature: f13a8125b166ae7f3826c70e222c813f ******/
		%feature("compactdefaultargs") StepBasic_DerivedUnit;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") StepBasic_DerivedUnit;
		 StepBasic_DerivedUnit();

		/****** StepBasic_DerivedUnit::Elements ******/
		/****** md5 signature: 55f1b3af218d1103682ddbeb236bfa38 ******/
		%feature("compactdefaultargs") Elements;
		%feature("autodoc", "Return
-------
opencascade::handle<StepBasic_HArray1OfDerivedUnitElement>

Description
-----------
No available documentation.
") Elements;
		opencascade::handle<StepBasic_HArray1OfDerivedUnitElement> Elements();

		/****** StepBasic_DerivedUnit::ElementsValue ******/
		/****** md5 signature: b7e8da591e76a59fef2fc5a006bc2a24 ******/
		%feature("compactdefaultargs") ElementsValue;
		%feature("autodoc", "
Parameters
----------
num: int

Return
-------
opencascade::handle<StepBasic_DerivedUnitElement>

Description
-----------
No available documentation.
") ElementsValue;
		opencascade::handle<StepBasic_DerivedUnitElement> ElementsValue(const Standard_Integer num);

		/****** StepBasic_DerivedUnit::Init ******/
		/****** md5 signature: 69f11f12489d32b7c28195b96bd986da ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
elements: StepBasic_HArray1OfDerivedUnitElement

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const opencascade::handle<StepBasic_HArray1OfDerivedUnitElement> & elements);

		/****** StepBasic_DerivedUnit::NbElements ******/
		/****** md5 signature: bda4abdd1e5bc28bcadae491494177fe ******/
		%feature("compactdefaultargs") NbElements;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbElements;
		Standard_Integer NbElements();

		/****** StepBasic_DerivedUnit::SetElements ******/
		/****** md5 signature: 45e6a42e6afa9ed62cef46b581148f03 ******/
		%feature("compactdefaultargs") SetElements;
		%feature("autodoc", "
Parameters
----------
elements: StepBasic_HArray1OfDerivedUnitElement

Return
-------
None

Description
-----------
No available documentation.
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
		/****** StepBasic_DerivedUnitElement::StepBasic_DerivedUnitElement ******/
		/****** md5 signature: f5178949f05b4588268af81816221694 ******/
		%feature("compactdefaultargs") StepBasic_DerivedUnitElement;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") StepBasic_DerivedUnitElement;
		 StepBasic_DerivedUnitElement();

		/****** StepBasic_DerivedUnitElement::Exponent ******/
		/****** md5 signature: 2f3e41715663d96bea8311915e30d22f ******/
		%feature("compactdefaultargs") Exponent;
		%feature("autodoc", "Return
-------
float

Description
-----------
No available documentation.
") Exponent;
		Standard_Real Exponent();

		/****** StepBasic_DerivedUnitElement::Init ******/
		/****** md5 signature: 310fc4d94d29c6b471b2a5e8e6fdf327 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
aUnit: StepBasic_NamedUnit
aExponent: float

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const opencascade::handle<StepBasic_NamedUnit> & aUnit, const Standard_Real aExponent);

		/****** StepBasic_DerivedUnitElement::SetExponent ******/
		/****** md5 signature: ed29641a2d0f660cc634b523c1c08f8a ******/
		%feature("compactdefaultargs") SetExponent;
		%feature("autodoc", "
Parameters
----------
aExponent: float

Return
-------
None

Description
-----------
No available documentation.
") SetExponent;
		void SetExponent(const Standard_Real aExponent);

		/****** StepBasic_DerivedUnitElement::SetUnit ******/
		/****** md5 signature: 1e47c3fe49db6eeee227bdb3691a3780 ******/
		%feature("compactdefaultargs") SetUnit;
		%feature("autodoc", "
Parameters
----------
aUnit: StepBasic_NamedUnit

Return
-------
None

Description
-----------
No available documentation.
") SetUnit;
		void SetUnit(const opencascade::handle<StepBasic_NamedUnit> & aUnit);

		/****** StepBasic_DerivedUnitElement::Unit ******/
		/****** md5 signature: a0b2c8c4de030fe9931b04c0d952856b ******/
		%feature("compactdefaultargs") Unit;
		%feature("autodoc", "Return
-------
opencascade::handle<StepBasic_NamedUnit>

Description
-----------
No available documentation.
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
		/****** StepBasic_DimensionalExponents::StepBasic_DimensionalExponents ******/
		/****** md5 signature: 07e23bf820b0cd5719de9f20008abd87 ******/
		%feature("compactdefaultargs") StepBasic_DimensionalExponents;
		%feature("autodoc", "Return
-------
None

Description
-----------
Returns a DimensionalExponents.
") StepBasic_DimensionalExponents;
		 StepBasic_DimensionalExponents();

		/****** StepBasic_DimensionalExponents::AmountOfSubstanceExponent ******/
		/****** md5 signature: 28129e275c9898ea1d5eced63ce51194 ******/
		%feature("compactdefaultargs") AmountOfSubstanceExponent;
		%feature("autodoc", "Return
-------
float

Description
-----------
No available documentation.
") AmountOfSubstanceExponent;
		Standard_Real AmountOfSubstanceExponent();

		/****** StepBasic_DimensionalExponents::ElectricCurrentExponent ******/
		/****** md5 signature: 5cc2807c213364906af271b5a7f1f0b6 ******/
		%feature("compactdefaultargs") ElectricCurrentExponent;
		%feature("autodoc", "Return
-------
float

Description
-----------
No available documentation.
") ElectricCurrentExponent;
		Standard_Real ElectricCurrentExponent();

		/****** StepBasic_DimensionalExponents::Init ******/
		/****** md5 signature: f15be97bfcd8d7ec54485ae5c85f31ea ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
aLengthExponent: float
aMassExponent: float
aTimeExponent: float
aElectricCurrentExponent: float
aThermodynamicTemperatureExponent: float
aAmountOfSubstanceExponent: float
aLuminousIntensityExponent: float

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const Standard_Real aLengthExponent, const Standard_Real aMassExponent, const Standard_Real aTimeExponent, const Standard_Real aElectricCurrentExponent, const Standard_Real aThermodynamicTemperatureExponent, const Standard_Real aAmountOfSubstanceExponent, const Standard_Real aLuminousIntensityExponent);

		/****** StepBasic_DimensionalExponents::LengthExponent ******/
		/****** md5 signature: e7bb2081da7fc823e9d1e9e8bb41388f ******/
		%feature("compactdefaultargs") LengthExponent;
		%feature("autodoc", "Return
-------
float

Description
-----------
No available documentation.
") LengthExponent;
		Standard_Real LengthExponent();

		/****** StepBasic_DimensionalExponents::LuminousIntensityExponent ******/
		/****** md5 signature: 1bd1a9702b74543578154da0625b04d6 ******/
		%feature("compactdefaultargs") LuminousIntensityExponent;
		%feature("autodoc", "Return
-------
float

Description
-----------
No available documentation.
") LuminousIntensityExponent;
		Standard_Real LuminousIntensityExponent();

		/****** StepBasic_DimensionalExponents::MassExponent ******/
		/****** md5 signature: a2ebb474d42ec651db7c7e0d8b82c7de ******/
		%feature("compactdefaultargs") MassExponent;
		%feature("autodoc", "Return
-------
float

Description
-----------
No available documentation.
") MassExponent;
		Standard_Real MassExponent();

		/****** StepBasic_DimensionalExponents::SetAmountOfSubstanceExponent ******/
		/****** md5 signature: 54962f68e14c48dd98d33f4386f404f4 ******/
		%feature("compactdefaultargs") SetAmountOfSubstanceExponent;
		%feature("autodoc", "
Parameters
----------
aAmountOfSubstanceExponent: float

Return
-------
None

Description
-----------
No available documentation.
") SetAmountOfSubstanceExponent;
		void SetAmountOfSubstanceExponent(const Standard_Real aAmountOfSubstanceExponent);

		/****** StepBasic_DimensionalExponents::SetElectricCurrentExponent ******/
		/****** md5 signature: 0a0ed9cbeafadeb16af479f678ab5fbf ******/
		%feature("compactdefaultargs") SetElectricCurrentExponent;
		%feature("autodoc", "
Parameters
----------
aElectricCurrentExponent: float

Return
-------
None

Description
-----------
No available documentation.
") SetElectricCurrentExponent;
		void SetElectricCurrentExponent(const Standard_Real aElectricCurrentExponent);

		/****** StepBasic_DimensionalExponents::SetLengthExponent ******/
		/****** md5 signature: 3573dcd1688ee50f71daff3126fe104f ******/
		%feature("compactdefaultargs") SetLengthExponent;
		%feature("autodoc", "
Parameters
----------
aLengthExponent: float

Return
-------
None

Description
-----------
No available documentation.
") SetLengthExponent;
		void SetLengthExponent(const Standard_Real aLengthExponent);

		/****** StepBasic_DimensionalExponents::SetLuminousIntensityExponent ******/
		/****** md5 signature: 0fd571315dc7a888e3cfa63f35606a73 ******/
		%feature("compactdefaultargs") SetLuminousIntensityExponent;
		%feature("autodoc", "
Parameters
----------
aLuminousIntensityExponent: float

Return
-------
None

Description
-----------
No available documentation.
") SetLuminousIntensityExponent;
		void SetLuminousIntensityExponent(const Standard_Real aLuminousIntensityExponent);

		/****** StepBasic_DimensionalExponents::SetMassExponent ******/
		/****** md5 signature: 7a204f0ca2429266dad222f3dc3c6978 ******/
		%feature("compactdefaultargs") SetMassExponent;
		%feature("autodoc", "
Parameters
----------
aMassExponent: float

Return
-------
None

Description
-----------
No available documentation.
") SetMassExponent;
		void SetMassExponent(const Standard_Real aMassExponent);

		/****** StepBasic_DimensionalExponents::SetThermodynamicTemperatureExponent ******/
		/****** md5 signature: 23b264f5a3db45e02cd5ec35796c343a ******/
		%feature("compactdefaultargs") SetThermodynamicTemperatureExponent;
		%feature("autodoc", "
Parameters
----------
aThermodynamicTemperatureExponent: float

Return
-------
None

Description
-----------
No available documentation.
") SetThermodynamicTemperatureExponent;
		void SetThermodynamicTemperatureExponent(const Standard_Real aThermodynamicTemperatureExponent);

		/****** StepBasic_DimensionalExponents::SetTimeExponent ******/
		/****** md5 signature: 573b6cf8a7162cc089b08fcb8a6fa31d ******/
		%feature("compactdefaultargs") SetTimeExponent;
		%feature("autodoc", "
Parameters
----------
aTimeExponent: float

Return
-------
None

Description
-----------
No available documentation.
") SetTimeExponent;
		void SetTimeExponent(const Standard_Real aTimeExponent);

		/****** StepBasic_DimensionalExponents::ThermodynamicTemperatureExponent ******/
		/****** md5 signature: 16ef32679b04270e12d44ee1dc1bb22a ******/
		%feature("compactdefaultargs") ThermodynamicTemperatureExponent;
		%feature("autodoc", "Return
-------
float

Description
-----------
No available documentation.
") ThermodynamicTemperatureExponent;
		Standard_Real ThermodynamicTemperatureExponent();

		/****** StepBasic_DimensionalExponents::TimeExponent ******/
		/****** md5 signature: 7b9cb1fec879252c26baa7131befa399 ******/
		%feature("compactdefaultargs") TimeExponent;
		%feature("autodoc", "Return
-------
float

Description
-----------
No available documentation.
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
		/****** StepBasic_Document::StepBasic_Document ******/
		/****** md5 signature: d90add5df367a3fadbdf9ab546f1df4f ******/
		%feature("compactdefaultargs") StepBasic_Document;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") StepBasic_Document;
		 StepBasic_Document();

		/****** StepBasic_Document::Description ******/
		/****** md5 signature: 68309bdf9d57a000073490b39f8e7a41 ******/
		%feature("compactdefaultargs") Description;
		%feature("autodoc", "Return
-------
opencascade::handle<TCollection_HAsciiString>

Description
-----------
Returns field Description.
") Description;
		opencascade::handle<TCollection_HAsciiString> Description();

		/****** StepBasic_Document::HasDescription ******/
		/****** md5 signature: 819ef9a3dced474861e1980d901a2978 ******/
		%feature("compactdefaultargs") HasDescription;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if optional field Description is defined.
") HasDescription;
		Standard_Boolean HasDescription();

		/****** StepBasic_Document::Id ******/
		/****** md5 signature: cad437aa1c6f9043742098c562124f9e ******/
		%feature("compactdefaultargs") Id;
		%feature("autodoc", "Return
-------
opencascade::handle<TCollection_HAsciiString>

Description
-----------
Returns field Id.
") Id;
		opencascade::handle<TCollection_HAsciiString> Id();

		/****** StepBasic_Document::Init ******/
		/****** md5 signature: 48a154076e286fe0eb54dfe10d25242b ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
aId: TCollection_HAsciiString
aName: TCollection_HAsciiString
hasDescription: bool
aDescription: TCollection_HAsciiString
aKind: StepBasic_DocumentType

Return
-------
None

Description
-----------
Initialize all fields (own and inherited).
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aId, const opencascade::handle<TCollection_HAsciiString> & aName, const Standard_Boolean hasDescription, const opencascade::handle<TCollection_HAsciiString> & aDescription, const opencascade::handle<StepBasic_DocumentType> & aKind);

		/****** StepBasic_Document::Kind ******/
		/****** md5 signature: 968aa1c734b275b7a8fafad10cfc1d81 ******/
		%feature("compactdefaultargs") Kind;
		%feature("autodoc", "Return
-------
opencascade::handle<StepBasic_DocumentType>

Description
-----------
Returns field Kind.
") Kind;
		opencascade::handle<StepBasic_DocumentType> Kind();

		/****** StepBasic_Document::Name ******/
		/****** md5 signature: 6bcb97f17b57cae0750fd29eac20499c ******/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "Return
-------
opencascade::handle<TCollection_HAsciiString>

Description
-----------
Returns field Name.
") Name;
		opencascade::handle<TCollection_HAsciiString> Name();

		/****** StepBasic_Document::SetDescription ******/
		/****** md5 signature: 11ff45bab13c9c85c44619d6c4501da8 ******/
		%feature("compactdefaultargs") SetDescription;
		%feature("autodoc", "
Parameters
----------
Description: TCollection_HAsciiString

Return
-------
None

Description
-----------
Set field Description.
") SetDescription;
		void SetDescription(const opencascade::handle<TCollection_HAsciiString> & Description);

		/****** StepBasic_Document::SetId ******/
		/****** md5 signature: 779c5dce2dcbd218d648cf0dfb829a83 ******/
		%feature("compactdefaultargs") SetId;
		%feature("autodoc", "
Parameters
----------
Id: TCollection_HAsciiString

Return
-------
None

Description
-----------
Set field Id.
") SetId;
		void SetId(const opencascade::handle<TCollection_HAsciiString> & Id);

		/****** StepBasic_Document::SetKind ******/
		/****** md5 signature: da21244b43074f7f4ffb84c5ab90ba2d ******/
		%feature("compactdefaultargs") SetKind;
		%feature("autodoc", "
Parameters
----------
Kind: StepBasic_DocumentType

Return
-------
None

Description
-----------
Set field Kind.
") SetKind;
		void SetKind(const opencascade::handle<StepBasic_DocumentType> & Kind);

		/****** StepBasic_Document::SetName ******/
		/****** md5 signature: 1a85c1f4dd446039f14efe98df7aeb03 ******/
		%feature("compactdefaultargs") SetName;
		%feature("autodoc", "
Parameters
----------
Name: TCollection_HAsciiString

Return
-------
None

Description
-----------
Set field Name.
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
		/****** StepBasic_DocumentProductAssociation::StepBasic_DocumentProductAssociation ******/
		/****** md5 signature: 0f0e8895f4eddfe0d4f65d161157e5af ******/
		%feature("compactdefaultargs") StepBasic_DocumentProductAssociation;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") StepBasic_DocumentProductAssociation;
		 StepBasic_DocumentProductAssociation();

		/****** StepBasic_DocumentProductAssociation::Description ******/
		/****** md5 signature: 68309bdf9d57a000073490b39f8e7a41 ******/
		%feature("compactdefaultargs") Description;
		%feature("autodoc", "Return
-------
opencascade::handle<TCollection_HAsciiString>

Description
-----------
Returns field Description.
") Description;
		opencascade::handle<TCollection_HAsciiString> Description();

		/****** StepBasic_DocumentProductAssociation::HasDescription ******/
		/****** md5 signature: 819ef9a3dced474861e1980d901a2978 ******/
		%feature("compactdefaultargs") HasDescription;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if optional field Description is defined.
") HasDescription;
		Standard_Boolean HasDescription();

		/****** StepBasic_DocumentProductAssociation::Init ******/
		/****** md5 signature: a10cfec39ea27abec984b896951647d7 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
aName: TCollection_HAsciiString
hasDescription: bool
aDescription: TCollection_HAsciiString
aRelatingDocument: StepBasic_Document
aRelatedProduct: StepBasic_ProductOrFormationOrDefinition

Return
-------
None

Description
-----------
Initialize all fields (own and inherited).
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aName, const Standard_Boolean hasDescription, const opencascade::handle<TCollection_HAsciiString> & aDescription, const opencascade::handle<StepBasic_Document> & aRelatingDocument, const StepBasic_ProductOrFormationOrDefinition & aRelatedProduct);

		/****** StepBasic_DocumentProductAssociation::Name ******/
		/****** md5 signature: 6bcb97f17b57cae0750fd29eac20499c ******/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "Return
-------
opencascade::handle<TCollection_HAsciiString>

Description
-----------
Returns field Name.
") Name;
		opencascade::handle<TCollection_HAsciiString> Name();

		/****** StepBasic_DocumentProductAssociation::RelatedProduct ******/
		/****** md5 signature: db7bed8232672a8dbbe0cb8ad1022d96 ******/
		%feature("compactdefaultargs") RelatedProduct;
		%feature("autodoc", "Return
-------
StepBasic_ProductOrFormationOrDefinition

Description
-----------
Returns field RelatedProduct.
") RelatedProduct;
		StepBasic_ProductOrFormationOrDefinition RelatedProduct();

		/****** StepBasic_DocumentProductAssociation::RelatingDocument ******/
		/****** md5 signature: 6767e807abfcce942f62abbf626fc5af ******/
		%feature("compactdefaultargs") RelatingDocument;
		%feature("autodoc", "Return
-------
opencascade::handle<StepBasic_Document>

Description
-----------
Returns field RelatingDocument.
") RelatingDocument;
		opencascade::handle<StepBasic_Document> RelatingDocument();

		/****** StepBasic_DocumentProductAssociation::SetDescription ******/
		/****** md5 signature: 11ff45bab13c9c85c44619d6c4501da8 ******/
		%feature("compactdefaultargs") SetDescription;
		%feature("autodoc", "
Parameters
----------
Description: TCollection_HAsciiString

Return
-------
None

Description
-----------
Set field Description.
") SetDescription;
		void SetDescription(const opencascade::handle<TCollection_HAsciiString> & Description);

		/****** StepBasic_DocumentProductAssociation::SetName ******/
		/****** md5 signature: 1a85c1f4dd446039f14efe98df7aeb03 ******/
		%feature("compactdefaultargs") SetName;
		%feature("autodoc", "
Parameters
----------
Name: TCollection_HAsciiString

Return
-------
None

Description
-----------
Set field Name.
") SetName;
		void SetName(const opencascade::handle<TCollection_HAsciiString> & Name);

		/****** StepBasic_DocumentProductAssociation::SetRelatedProduct ******/
		/****** md5 signature: 24b5ef108a1623787230c8e1a7c7fd8f ******/
		%feature("compactdefaultargs") SetRelatedProduct;
		%feature("autodoc", "
Parameters
----------
RelatedProduct: StepBasic_ProductOrFormationOrDefinition

Return
-------
None

Description
-----------
Set field RelatedProduct.
") SetRelatedProduct;
		void SetRelatedProduct(const StepBasic_ProductOrFormationOrDefinition & RelatedProduct);

		/****** StepBasic_DocumentProductAssociation::SetRelatingDocument ******/
		/****** md5 signature: 32fd5cb531ec4d1dafc6377abadb2993 ******/
		%feature("compactdefaultargs") SetRelatingDocument;
		%feature("autodoc", "
Parameters
----------
RelatingDocument: StepBasic_Document

Return
-------
None

Description
-----------
Set field RelatingDocument.
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
		/****** StepBasic_DocumentReference::AssignedDocument ******/
		/****** md5 signature: 19e768f9b9c2097e58011ba97322d8d8 ******/
		%feature("compactdefaultargs") AssignedDocument;
		%feature("autodoc", "Return
-------
opencascade::handle<StepBasic_Document>

Description
-----------
No available documentation.
") AssignedDocument;
		opencascade::handle<StepBasic_Document> AssignedDocument();

		/****** StepBasic_DocumentReference::Init0 ******/
		/****** md5 signature: 8e9aeea6e3a67a9530ee4edb8f3bbab8 ******/
		%feature("compactdefaultargs") Init0;
		%feature("autodoc", "
Parameters
----------
aAssignedDocument: StepBasic_Document
aSource: TCollection_HAsciiString

Return
-------
None

Description
-----------
No available documentation.
") Init0;
		void Init0(const opencascade::handle<StepBasic_Document> & aAssignedDocument, const opencascade::handle<TCollection_HAsciiString> & aSource);

		/****** StepBasic_DocumentReference::SetAssignedDocument ******/
		/****** md5 signature: fa747b473c395d529db10b872c0070f5 ******/
		%feature("compactdefaultargs") SetAssignedDocument;
		%feature("autodoc", "
Parameters
----------
aAssignedDocument: StepBasic_Document

Return
-------
None

Description
-----------
No available documentation.
") SetAssignedDocument;
		void SetAssignedDocument(const opencascade::handle<StepBasic_Document> & aAssignedDocument);

		/****** StepBasic_DocumentReference::SetSource ******/
		/****** md5 signature: 854c5b1decd2ea1be38e2882db573f43 ******/
		%feature("compactdefaultargs") SetSource;
		%feature("autodoc", "
Parameters
----------
aSource: TCollection_HAsciiString

Return
-------
None

Description
-----------
No available documentation.
") SetSource;
		void SetSource(const opencascade::handle<TCollection_HAsciiString> & aSource);

		/****** StepBasic_DocumentReference::Source ******/
		/****** md5 signature: 11761fc70ff0a5837bb4209ca964e007 ******/
		%feature("compactdefaultargs") Source;
		%feature("autodoc", "Return
-------
opencascade::handle<TCollection_HAsciiString>

Description
-----------
No available documentation.
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
		/****** StepBasic_DocumentRelationship::StepBasic_DocumentRelationship ******/
		/****** md5 signature: 047289f41fda0437aa39e7a2810af1c7 ******/
		%feature("compactdefaultargs") StepBasic_DocumentRelationship;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") StepBasic_DocumentRelationship;
		 StepBasic_DocumentRelationship();

		/****** StepBasic_DocumentRelationship::Description ******/
		/****** md5 signature: 68309bdf9d57a000073490b39f8e7a41 ******/
		%feature("compactdefaultargs") Description;
		%feature("autodoc", "Return
-------
opencascade::handle<TCollection_HAsciiString>

Description
-----------
No available documentation.
") Description;
		opencascade::handle<TCollection_HAsciiString> Description();

		/****** StepBasic_DocumentRelationship::Init ******/
		/****** md5 signature: b6bdaec07100f7ae48cd7b05c10ff274 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
aName: TCollection_HAsciiString
aDescription: TCollection_HAsciiString
aRelating: StepBasic_Document
aRelated: StepBasic_Document

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aName, const opencascade::handle<TCollection_HAsciiString> & aDescription, const opencascade::handle<StepBasic_Document> & aRelating, const opencascade::handle<StepBasic_Document> & aRelated);

		/****** StepBasic_DocumentRelationship::Name ******/
		/****** md5 signature: 6bcb97f17b57cae0750fd29eac20499c ******/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "Return
-------
opencascade::handle<TCollection_HAsciiString>

Description
-----------
No available documentation.
") Name;
		opencascade::handle<TCollection_HAsciiString> Name();

		/****** StepBasic_DocumentRelationship::RelatedDocument ******/
		/****** md5 signature: 9133552c6c8cdaaedb68037c1827f5e1 ******/
		%feature("compactdefaultargs") RelatedDocument;
		%feature("autodoc", "Return
-------
opencascade::handle<StepBasic_Document>

Description
-----------
No available documentation.
") RelatedDocument;
		opencascade::handle<StepBasic_Document> RelatedDocument();

		/****** StepBasic_DocumentRelationship::RelatingDocument ******/
		/****** md5 signature: 6767e807abfcce942f62abbf626fc5af ******/
		%feature("compactdefaultargs") RelatingDocument;
		%feature("autodoc", "Return
-------
opencascade::handle<StepBasic_Document>

Description
-----------
No available documentation.
") RelatingDocument;
		opencascade::handle<StepBasic_Document> RelatingDocument();

		/****** StepBasic_DocumentRelationship::SetDescription ******/
		/****** md5 signature: adddd13a906718df58a2eee683a382cf ******/
		%feature("compactdefaultargs") SetDescription;
		%feature("autodoc", "
Parameters
----------
aDescription: TCollection_HAsciiString

Return
-------
None

Description
-----------
No available documentation.
") SetDescription;
		void SetDescription(const opencascade::handle<TCollection_HAsciiString> & aDescription);

		/****** StepBasic_DocumentRelationship::SetName ******/
		/****** md5 signature: 1e0b00d9eb163c8a0cdbb986e2ee24f6 ******/
		%feature("compactdefaultargs") SetName;
		%feature("autodoc", "
Parameters
----------
aName: TCollection_HAsciiString

Return
-------
None

Description
-----------
No available documentation.
") SetName;
		void SetName(const opencascade::handle<TCollection_HAsciiString> & aName);

		/****** StepBasic_DocumentRelationship::SetRelatedDocument ******/
		/****** md5 signature: 5558f56c7f4885b4032dbde1db22b94a ******/
		%feature("compactdefaultargs") SetRelatedDocument;
		%feature("autodoc", "
Parameters
----------
aRelated: StepBasic_Document

Return
-------
None

Description
-----------
No available documentation.
") SetRelatedDocument;
		void SetRelatedDocument(const opencascade::handle<StepBasic_Document> & aRelated);

		/****** StepBasic_DocumentRelationship::SetRelatingDocument ******/
		/****** md5 signature: 37c371d4cc984bf2fe31430491a6d403 ******/
		%feature("compactdefaultargs") SetRelatingDocument;
		%feature("autodoc", "
Parameters
----------
aRelating: StepBasic_Document

Return
-------
None

Description
-----------
No available documentation.
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
		/****** StepBasic_DocumentRepresentationType::StepBasic_DocumentRepresentationType ******/
		/****** md5 signature: 8038f0b3b5adb07c7e07756824ca77aa ******/
		%feature("compactdefaultargs") StepBasic_DocumentRepresentationType;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") StepBasic_DocumentRepresentationType;
		 StepBasic_DocumentRepresentationType();

		/****** StepBasic_DocumentRepresentationType::Init ******/
		/****** md5 signature: b4a57dcc5ec3463798581c6d2b2e67fb ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
aName: TCollection_HAsciiString
aRepresentedDocument: StepBasic_Document

Return
-------
None

Description
-----------
Initialize all fields (own and inherited).
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aName, const opencascade::handle<StepBasic_Document> & aRepresentedDocument);

		/****** StepBasic_DocumentRepresentationType::Name ******/
		/****** md5 signature: 6bcb97f17b57cae0750fd29eac20499c ******/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "Return
-------
opencascade::handle<TCollection_HAsciiString>

Description
-----------
Returns field Name.
") Name;
		opencascade::handle<TCollection_HAsciiString> Name();

		/****** StepBasic_DocumentRepresentationType::RepresentedDocument ******/
		/****** md5 signature: 58883ae87a50da7eb1eeca3a16facedb ******/
		%feature("compactdefaultargs") RepresentedDocument;
		%feature("autodoc", "Return
-------
opencascade::handle<StepBasic_Document>

Description
-----------
Returns field RepresentedDocument.
") RepresentedDocument;
		opencascade::handle<StepBasic_Document> RepresentedDocument();

		/****** StepBasic_DocumentRepresentationType::SetName ******/
		/****** md5 signature: 1a85c1f4dd446039f14efe98df7aeb03 ******/
		%feature("compactdefaultargs") SetName;
		%feature("autodoc", "
Parameters
----------
Name: TCollection_HAsciiString

Return
-------
None

Description
-----------
Set field Name.
") SetName;
		void SetName(const opencascade::handle<TCollection_HAsciiString> & Name);

		/****** StepBasic_DocumentRepresentationType::SetRepresentedDocument ******/
		/****** md5 signature: b2c000e33a12251742738bf7348e5d65 ******/
		%feature("compactdefaultargs") SetRepresentedDocument;
		%feature("autodoc", "
Parameters
----------
RepresentedDocument: StepBasic_Document

Return
-------
None

Description
-----------
Set field RepresentedDocument.
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
		/****** StepBasic_DocumentType::StepBasic_DocumentType ******/
		/****** md5 signature: bc1aaa34504987f8755b2c1d9dc862fa ******/
		%feature("compactdefaultargs") StepBasic_DocumentType;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") StepBasic_DocumentType;
		 StepBasic_DocumentType();

		/****** StepBasic_DocumentType::Init ******/
		/****** md5 signature: 89dc25d8cc7aee782dc2dce254e35d59 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
apdt: TCollection_HAsciiString

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & apdt);

		/****** StepBasic_DocumentType::ProductDataType ******/
		/****** md5 signature: a03a61e31092d986c0c55c4c51f7c1d2 ******/
		%feature("compactdefaultargs") ProductDataType;
		%feature("autodoc", "Return
-------
opencascade::handle<TCollection_HAsciiString>

Description
-----------
No available documentation.
") ProductDataType;
		opencascade::handle<TCollection_HAsciiString> ProductDataType();

		/****** StepBasic_DocumentType::SetProductDataType ******/
		/****** md5 signature: ff22ec573409e99d4e580eafbe3ac8c7 ******/
		%feature("compactdefaultargs") SetProductDataType;
		%feature("autodoc", "
Parameters
----------
apdt: TCollection_HAsciiString

Return
-------
None

Description
-----------
No available documentation.
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
		/****** StepBasic_DocumentUsageConstraint::StepBasic_DocumentUsageConstraint ******/
		/****** md5 signature: 5e2e866922c1305d107d47c375cca310 ******/
		%feature("compactdefaultargs") StepBasic_DocumentUsageConstraint;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") StepBasic_DocumentUsageConstraint;
		 StepBasic_DocumentUsageConstraint();

		/****** StepBasic_DocumentUsageConstraint::Init ******/
		/****** md5 signature: a05631b154d56a818b0defe00b9ff47a ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
aSource: StepBasic_Document
ase: TCollection_HAsciiString
asev: TCollection_HAsciiString

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const opencascade::handle<StepBasic_Document> & aSource, const opencascade::handle<TCollection_HAsciiString> & ase, const opencascade::handle<TCollection_HAsciiString> & asev);

		/****** StepBasic_DocumentUsageConstraint::SetSource ******/
		/****** md5 signature: a76bb3227899561fda50fb9f91688c3b ******/
		%feature("compactdefaultargs") SetSource;
		%feature("autodoc", "
Parameters
----------
aSource: StepBasic_Document

Return
-------
None

Description
-----------
No available documentation.
") SetSource;
		void SetSource(const opencascade::handle<StepBasic_Document> & aSource);

		/****** StepBasic_DocumentUsageConstraint::SetSubjectElement ******/
		/****** md5 signature: b2bd1f1c0e3e58c541e977fe1fe473a3 ******/
		%feature("compactdefaultargs") SetSubjectElement;
		%feature("autodoc", "
Parameters
----------
ase: TCollection_HAsciiString

Return
-------
None

Description
-----------
No available documentation.
") SetSubjectElement;
		void SetSubjectElement(const opencascade::handle<TCollection_HAsciiString> & ase);

		/****** StepBasic_DocumentUsageConstraint::SetSubjectElementValue ******/
		/****** md5 signature: 52410b901503a6b5bdadf091ac482c4e ******/
		%feature("compactdefaultargs") SetSubjectElementValue;
		%feature("autodoc", "
Parameters
----------
asev: TCollection_HAsciiString

Return
-------
None

Description
-----------
No available documentation.
") SetSubjectElementValue;
		void SetSubjectElementValue(const opencascade::handle<TCollection_HAsciiString> & asev);

		/****** StepBasic_DocumentUsageConstraint::Source ******/
		/****** md5 signature: 9b8d130e33e131c7de399e9d0934c03b ******/
		%feature("compactdefaultargs") Source;
		%feature("autodoc", "Return
-------
opencascade::handle<StepBasic_Document>

Description
-----------
No available documentation.
") Source;
		opencascade::handle<StepBasic_Document> Source();

		/****** StepBasic_DocumentUsageConstraint::SubjectElement ******/
		/****** md5 signature: 5a291b0a0e83af68a837f79bb0dfd03f ******/
		%feature("compactdefaultargs") SubjectElement;
		%feature("autodoc", "Return
-------
opencascade::handle<TCollection_HAsciiString>

Description
-----------
No available documentation.
") SubjectElement;
		opencascade::handle<TCollection_HAsciiString> SubjectElement();

		/****** StepBasic_DocumentUsageConstraint::SubjectElementValue ******/
		/****** md5 signature: c5108a4c0ae8f975d1e3abe221e35977 ******/
		%feature("compactdefaultargs") SubjectElementValue;
		%feature("autodoc", "Return
-------
opencascade::handle<TCollection_HAsciiString>

Description
-----------
No available documentation.
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
		/****** StepBasic_Effectivity::StepBasic_Effectivity ******/
		/****** md5 signature: 10c6b255f38de8dc1fa137b8f9cd190d ******/
		%feature("compactdefaultargs") StepBasic_Effectivity;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") StepBasic_Effectivity;
		 StepBasic_Effectivity();

		/****** StepBasic_Effectivity::Id ******/
		/****** md5 signature: cad437aa1c6f9043742098c562124f9e ******/
		%feature("compactdefaultargs") Id;
		%feature("autodoc", "Return
-------
opencascade::handle<TCollection_HAsciiString>

Description
-----------
No available documentation.
") Id;
		opencascade::handle<TCollection_HAsciiString> Id();

		/****** StepBasic_Effectivity::Init ******/
		/****** md5 signature: e0d6d2e67bc329f61d48f1d86cf2affc ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
aid: TCollection_HAsciiString

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aid);

		/****** StepBasic_Effectivity::SetId ******/
		/****** md5 signature: a589ed4c1f87cc154c05276cfb60f4ea ******/
		%feature("compactdefaultargs") SetId;
		%feature("autodoc", "
Parameters
----------
aid: TCollection_HAsciiString

Return
-------
None

Description
-----------
No available documentation.
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
		/****** StepBasic_EffectivityAssignment::StepBasic_EffectivityAssignment ******/
		/****** md5 signature: e83292fffb9e60c2eb34f7d74b403b2a ******/
		%feature("compactdefaultargs") StepBasic_EffectivityAssignment;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") StepBasic_EffectivityAssignment;
		 StepBasic_EffectivityAssignment();

		/****** StepBasic_EffectivityAssignment::AssignedEffectivity ******/
		/****** md5 signature: 9058e219238a60bae3a0eb078af6806c ******/
		%feature("compactdefaultargs") AssignedEffectivity;
		%feature("autodoc", "Return
-------
opencascade::handle<StepBasic_Effectivity>

Description
-----------
Returns field AssignedEffectivity.
") AssignedEffectivity;
		opencascade::handle<StepBasic_Effectivity> AssignedEffectivity();

		/****** StepBasic_EffectivityAssignment::Init ******/
		/****** md5 signature: c49650da5d00cc7204cec0b038f8cc5c ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
aAssignedEffectivity: StepBasic_Effectivity

Return
-------
None

Description
-----------
Initialize all fields (own and inherited).
") Init;
		void Init(const opencascade::handle<StepBasic_Effectivity> & aAssignedEffectivity);

		/****** StepBasic_EffectivityAssignment::SetAssignedEffectivity ******/
		/****** md5 signature: 4741ef3bef1a1321860173c7d6a96316 ******/
		%feature("compactdefaultargs") SetAssignedEffectivity;
		%feature("autodoc", "
Parameters
----------
AssignedEffectivity: StepBasic_Effectivity

Return
-------
None

Description
-----------
Set field AssignedEffectivity.
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
		/****** StepBasic_EulerAngles::StepBasic_EulerAngles ******/
		/****** md5 signature: e6e41a24a70786186101fede26af22d3 ******/
		%feature("compactdefaultargs") StepBasic_EulerAngles;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") StepBasic_EulerAngles;
		 StepBasic_EulerAngles();

		/****** StepBasic_EulerAngles::Angles ******/
		/****** md5 signature: 091a62348d572fb9656d813d6d85fa63 ******/
		%feature("compactdefaultargs") Angles;
		%feature("autodoc", "Return
-------
opencascade::handle<TColStd_HArray1OfReal>

Description
-----------
Returns field Angles.
") Angles;
		opencascade::handle<TColStd_HArray1OfReal> Angles();

		/****** StepBasic_EulerAngles::Init ******/
		/****** md5 signature: d7ced06dd4c063a5af85bb59ba9774d3 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
aAngles: TColStd_HArray1OfReal

Return
-------
None

Description
-----------
Initialize all fields (own and inherited).
") Init;
		void Init(const opencascade::handle<TColStd_HArray1OfReal> & aAngles);

		/****** StepBasic_EulerAngles::SetAngles ******/
		/****** md5 signature: 616c94a3390c69199eef71371c873578 ******/
		%feature("compactdefaultargs") SetAngles;
		%feature("autodoc", "
Parameters
----------
Angles: TColStd_HArray1OfReal

Return
-------
None

Description
-----------
Set field Angles.
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
		/****** StepBasic_ExternalSource::StepBasic_ExternalSource ******/
		/****** md5 signature: 62a10501aec290ce7990b08c61c61f1c ******/
		%feature("compactdefaultargs") StepBasic_ExternalSource;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") StepBasic_ExternalSource;
		 StepBasic_ExternalSource();

		/****** StepBasic_ExternalSource::Init ******/
		/****** md5 signature: 5c045959f9577ce243f6dc05eb656c6f ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
aSourceId: StepBasic_SourceItem

Return
-------
None

Description
-----------
Initialize all fields (own and inherited).
") Init;
		void Init(const StepBasic_SourceItem & aSourceId);

		/****** StepBasic_ExternalSource::SetSourceId ******/
		/****** md5 signature: af9bbd623dcc3096e8ebbad88403428e ******/
		%feature("compactdefaultargs") SetSourceId;
		%feature("autodoc", "
Parameters
----------
SourceId: StepBasic_SourceItem

Return
-------
None

Description
-----------
Set field SourceId.
") SetSourceId;
		void SetSourceId(const StepBasic_SourceItem & SourceId);

		/****** StepBasic_ExternalSource::SourceId ******/
		/****** md5 signature: 2aeea3fd499983d611d3d5c453142423 ******/
		%feature("compactdefaultargs") SourceId;
		%feature("autodoc", "Return
-------
StepBasic_SourceItem

Description
-----------
Returns field SourceId.
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
		/****** StepBasic_ExternallyDefinedItem::StepBasic_ExternallyDefinedItem ******/
		/****** md5 signature: ea95510bfd88fcafebffa0082538eece ******/
		%feature("compactdefaultargs") StepBasic_ExternallyDefinedItem;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") StepBasic_ExternallyDefinedItem;
		 StepBasic_ExternallyDefinedItem();

		/****** StepBasic_ExternallyDefinedItem::Init ******/
		/****** md5 signature: 878741d640bf415ab8d714ce90c4fa2c ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
aItemId: StepBasic_SourceItem
aSource: StepBasic_ExternalSource

Return
-------
None

Description
-----------
Initialize all fields (own and inherited).
") Init;
		void Init(const StepBasic_SourceItem & aItemId, const opencascade::handle<StepBasic_ExternalSource> & aSource);

		/****** StepBasic_ExternallyDefinedItem::ItemId ******/
		/****** md5 signature: 0a2718404430824b962e322453ce7e08 ******/
		%feature("compactdefaultargs") ItemId;
		%feature("autodoc", "Return
-------
StepBasic_SourceItem

Description
-----------
Returns field ItemId.
") ItemId;
		StepBasic_SourceItem ItemId();

		/****** StepBasic_ExternallyDefinedItem::SetItemId ******/
		/****** md5 signature: d718eaee53490b503dc0a0940b8ca7b1 ******/
		%feature("compactdefaultargs") SetItemId;
		%feature("autodoc", "
Parameters
----------
ItemId: StepBasic_SourceItem

Return
-------
None

Description
-----------
Set field ItemId.
") SetItemId;
		void SetItemId(const StepBasic_SourceItem & ItemId);

		/****** StepBasic_ExternallyDefinedItem::SetSource ******/
		/****** md5 signature: 2e83538f32b5b2a0a6a43a552fe31327 ******/
		%feature("compactdefaultargs") SetSource;
		%feature("autodoc", "
Parameters
----------
Source: StepBasic_ExternalSource

Return
-------
None

Description
-----------
Set field Source.
") SetSource;
		void SetSource(const opencascade::handle<StepBasic_ExternalSource> & Source);

		/****** StepBasic_ExternallyDefinedItem::Source ******/
		/****** md5 signature: 8b90a9ea46f21d4e9d0fbb6449a05fa1 ******/
		%feature("compactdefaultargs") Source;
		%feature("autodoc", "Return
-------
opencascade::handle<StepBasic_ExternalSource>

Description
-----------
Returns field Source.
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
		/****** StepBasic_GeneralProperty::StepBasic_GeneralProperty ******/
		/****** md5 signature: 12568db7edb60d7ac4a475b3bacc6b43 ******/
		%feature("compactdefaultargs") StepBasic_GeneralProperty;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") StepBasic_GeneralProperty;
		 StepBasic_GeneralProperty();

		/****** StepBasic_GeneralProperty::Description ******/
		/****** md5 signature: 68309bdf9d57a000073490b39f8e7a41 ******/
		%feature("compactdefaultargs") Description;
		%feature("autodoc", "Return
-------
opencascade::handle<TCollection_HAsciiString>

Description
-----------
Returns field Description.
") Description;
		opencascade::handle<TCollection_HAsciiString> Description();

		/****** StepBasic_GeneralProperty::HasDescription ******/
		/****** md5 signature: 819ef9a3dced474861e1980d901a2978 ******/
		%feature("compactdefaultargs") HasDescription;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if optional field Description is defined.
") HasDescription;
		Standard_Boolean HasDescription();

		/****** StepBasic_GeneralProperty::Id ******/
		/****** md5 signature: cad437aa1c6f9043742098c562124f9e ******/
		%feature("compactdefaultargs") Id;
		%feature("autodoc", "Return
-------
opencascade::handle<TCollection_HAsciiString>

Description
-----------
Returns field Id.
") Id;
		opencascade::handle<TCollection_HAsciiString> Id();

		/****** StepBasic_GeneralProperty::Init ******/
		/****** md5 signature: 3d1ce2e201e5b42400db6e78057f3e0f ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
aId: TCollection_HAsciiString
aName: TCollection_HAsciiString
hasDescription: bool
aDescription: TCollection_HAsciiString

Return
-------
None

Description
-----------
Initialize all fields (own and inherited).
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aId, const opencascade::handle<TCollection_HAsciiString> & aName, const Standard_Boolean hasDescription, const opencascade::handle<TCollection_HAsciiString> & aDescription);

		/****** StepBasic_GeneralProperty::Name ******/
		/****** md5 signature: 6bcb97f17b57cae0750fd29eac20499c ******/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "Return
-------
opencascade::handle<TCollection_HAsciiString>

Description
-----------
Returns field Name.
") Name;
		opencascade::handle<TCollection_HAsciiString> Name();

		/****** StepBasic_GeneralProperty::SetDescription ******/
		/****** md5 signature: 11ff45bab13c9c85c44619d6c4501da8 ******/
		%feature("compactdefaultargs") SetDescription;
		%feature("autodoc", "
Parameters
----------
Description: TCollection_HAsciiString

Return
-------
None

Description
-----------
Set field Description.
") SetDescription;
		void SetDescription(const opencascade::handle<TCollection_HAsciiString> & Description);

		/****** StepBasic_GeneralProperty::SetId ******/
		/****** md5 signature: 779c5dce2dcbd218d648cf0dfb829a83 ******/
		%feature("compactdefaultargs") SetId;
		%feature("autodoc", "
Parameters
----------
Id: TCollection_HAsciiString

Return
-------
None

Description
-----------
Set field Id.
") SetId;
		void SetId(const opencascade::handle<TCollection_HAsciiString> & Id);

		/****** StepBasic_GeneralProperty::SetName ******/
		/****** md5 signature: 1a85c1f4dd446039f14efe98df7aeb03 ******/
		%feature("compactdefaultargs") SetName;
		%feature("autodoc", "
Parameters
----------
Name: TCollection_HAsciiString

Return
-------
None

Description
-----------
Set field Name.
") SetName;
		void SetName(const opencascade::handle<TCollection_HAsciiString> & Name);

};


%make_alias(StepBasic_GeneralProperty)

%extend StepBasic_GeneralProperty {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************************
* class StepBasic_GeneralPropertyAssociation *
*********************************************/
class StepBasic_GeneralPropertyAssociation : public Standard_Transient {
	public:
		/****** StepBasic_GeneralPropertyAssociation::StepBasic_GeneralPropertyAssociation ******/
		/****** md5 signature: d92f9ce9a71752f932dfdb6ae43467b3 ******/
		%feature("compactdefaultargs") StepBasic_GeneralPropertyAssociation;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") StepBasic_GeneralPropertyAssociation;
		 StepBasic_GeneralPropertyAssociation();

		/****** StepBasic_GeneralPropertyAssociation::Description ******/
		/****** md5 signature: 68309bdf9d57a000073490b39f8e7a41 ******/
		%feature("compactdefaultargs") Description;
		%feature("autodoc", "Return
-------
opencascade::handle<TCollection_HAsciiString>

Description
-----------
Returns field Description.
") Description;
		opencascade::handle<TCollection_HAsciiString> Description();

		/****** StepBasic_GeneralPropertyAssociation::GeneralProperty ******/
		/****** md5 signature: 644fc2281dcbe4ea457975f6595935d0 ******/
		%feature("compactdefaultargs") GeneralProperty;
		%feature("autodoc", "Return
-------
opencascade::handle<StepBasic_GeneralProperty>

Description
-----------
Returns field GeneralProperty.
") GeneralProperty;
		opencascade::handle<StepBasic_GeneralProperty> GeneralProperty();

		/****** StepBasic_GeneralPropertyAssociation::Init ******/
		/****** md5 signature: aac707e1c729ad5d01c97d875d4a5127 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
aName: TCollection_HAsciiString
aDescription: TCollection_HAsciiString
aGeneralProperty: StepBasic_GeneralProperty
aPropertyDefinition: StepRepr_PropertyDefinition

Return
-------
None

Description
-----------
Initialize all fields (own and inherited).
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aName, const opencascade::handle<TCollection_HAsciiString> & aDescription, const opencascade::handle<StepBasic_GeneralProperty> & aGeneralProperty, const opencascade::handle<StepRepr_PropertyDefinition> & aPropertyDefinition);

		/****** StepBasic_GeneralPropertyAssociation::Name ******/
		/****** md5 signature: 6bcb97f17b57cae0750fd29eac20499c ******/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "Return
-------
opencascade::handle<TCollection_HAsciiString>

Description
-----------
Returns field Name.
") Name;
		opencascade::handle<TCollection_HAsciiString> Name();

		/****** StepBasic_GeneralPropertyAssociation::PropertyDefinition ******/
		/****** md5 signature: 4b7b4910929a0e1832918f8266d39349 ******/
		%feature("compactdefaultargs") PropertyDefinition;
		%feature("autodoc", "Return
-------
opencascade::handle<StepRepr_PropertyDefinition>

Description
-----------
Returns field PropertyDefinition.
") PropertyDefinition;
		opencascade::handle<StepRepr_PropertyDefinition> PropertyDefinition();

		/****** StepBasic_GeneralPropertyAssociation::SetDescription ******/
		/****** md5 signature: 11ff45bab13c9c85c44619d6c4501da8 ******/
		%feature("compactdefaultargs") SetDescription;
		%feature("autodoc", "
Parameters
----------
Description: TCollection_HAsciiString

Return
-------
None

Description
-----------
Set field Description.
") SetDescription;
		void SetDescription(const opencascade::handle<TCollection_HAsciiString> & Description);

		/****** StepBasic_GeneralPropertyAssociation::SetGeneralProperty ******/
		/****** md5 signature: c717be43fca41e8f95ceb826eb9c6f8e ******/
		%feature("compactdefaultargs") SetGeneralProperty;
		%feature("autodoc", "
Parameters
----------
GeneralProperty: StepBasic_GeneralProperty

Return
-------
None

Description
-----------
Set field GeneralProperty.
") SetGeneralProperty;
		void SetGeneralProperty(const opencascade::handle<StepBasic_GeneralProperty> & GeneralProperty);

		/****** StepBasic_GeneralPropertyAssociation::SetName ******/
		/****** md5 signature: 1a85c1f4dd446039f14efe98df7aeb03 ******/
		%feature("compactdefaultargs") SetName;
		%feature("autodoc", "
Parameters
----------
Name: TCollection_HAsciiString

Return
-------
None

Description
-----------
Set field Name.
") SetName;
		void SetName(const opencascade::handle<TCollection_HAsciiString> & Name);

		/****** StepBasic_GeneralPropertyAssociation::SetPropertyDefinition ******/
		/****** md5 signature: 2a184e5fd944a00733d8bb4e20c8aa04 ******/
		%feature("compactdefaultargs") SetPropertyDefinition;
		%feature("autodoc", "
Parameters
----------
PropertyDefinition: StepRepr_PropertyDefinition

Return
-------
None

Description
-----------
Set field PropertyDefinition.
") SetPropertyDefinition;
		void SetPropertyDefinition(const opencascade::handle<StepRepr_PropertyDefinition> & PropertyDefinition);

};


%make_alias(StepBasic_GeneralPropertyAssociation)

%extend StepBasic_GeneralPropertyAssociation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************************************
* class StepBasic_GeneralPropertyRelationship *
**********************************************/
class StepBasic_GeneralPropertyRelationship : public Standard_Transient {
	public:
		/****** StepBasic_GeneralPropertyRelationship::StepBasic_GeneralPropertyRelationship ******/
		/****** md5 signature: 634d6c07c1c914499fe5c3b40f803baa ******/
		%feature("compactdefaultargs") StepBasic_GeneralPropertyRelationship;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") StepBasic_GeneralPropertyRelationship;
		 StepBasic_GeneralPropertyRelationship();

		/****** StepBasic_GeneralPropertyRelationship::Description ******/
		/****** md5 signature: 68309bdf9d57a000073490b39f8e7a41 ******/
		%feature("compactdefaultargs") Description;
		%feature("autodoc", "Return
-------
opencascade::handle<TCollection_HAsciiString>

Description
-----------
Returns field Description.
") Description;
		opencascade::handle<TCollection_HAsciiString> Description();

		/****** StepBasic_GeneralPropertyRelationship::HasDescription ******/
		/****** md5 signature: 819ef9a3dced474861e1980d901a2978 ******/
		%feature("compactdefaultargs") HasDescription;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if optional field Description is defined.
") HasDescription;
		Standard_Boolean HasDescription();

		/****** StepBasic_GeneralPropertyRelationship::Init ******/
		/****** md5 signature: fdc1ee70eb7123ed6e55eaaf851d1d1b ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
aName: TCollection_HAsciiString
hasDescription: bool
aDescription: TCollection_HAsciiString
aRelatingGeneralProperty: StepBasic_GeneralProperty
aRelatedGeneralProperty: StepBasic_GeneralProperty

Return
-------
None

Description
-----------
Initialize all fields (own and inherited).
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aName, const Standard_Boolean hasDescription, const opencascade::handle<TCollection_HAsciiString> & aDescription, const opencascade::handle<StepBasic_GeneralProperty> & aRelatingGeneralProperty, const opencascade::handle<StepBasic_GeneralProperty> & aRelatedGeneralProperty);

		/****** StepBasic_GeneralPropertyRelationship::Name ******/
		/****** md5 signature: 6bcb97f17b57cae0750fd29eac20499c ******/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "Return
-------
opencascade::handle<TCollection_HAsciiString>

Description
-----------
Returns field Name.
") Name;
		opencascade::handle<TCollection_HAsciiString> Name();

		/****** StepBasic_GeneralPropertyRelationship::RelatedGeneralProperty ******/
		/****** md5 signature: 021176ea5d09f1dfcb1750ca16eef11d ******/
		%feature("compactdefaultargs") RelatedGeneralProperty;
		%feature("autodoc", "Return
-------
opencascade::handle<StepBasic_GeneralProperty>

Description
-----------
Returns field RelatedGeneralProperty.
") RelatedGeneralProperty;
		opencascade::handle<StepBasic_GeneralProperty> RelatedGeneralProperty();

		/****** StepBasic_GeneralPropertyRelationship::RelatingGeneralProperty ******/
		/****** md5 signature: a56dd4bdfca646aa65b1d7c84dba6e91 ******/
		%feature("compactdefaultargs") RelatingGeneralProperty;
		%feature("autodoc", "Return
-------
opencascade::handle<StepBasic_GeneralProperty>

Description
-----------
Returns field RelatingGeneralProperty.
") RelatingGeneralProperty;
		opencascade::handle<StepBasic_GeneralProperty> RelatingGeneralProperty();

		/****** StepBasic_GeneralPropertyRelationship::SetDescription ******/
		/****** md5 signature: 11ff45bab13c9c85c44619d6c4501da8 ******/
		%feature("compactdefaultargs") SetDescription;
		%feature("autodoc", "
Parameters
----------
Description: TCollection_HAsciiString

Return
-------
None

Description
-----------
Set field Description.
") SetDescription;
		void SetDescription(const opencascade::handle<TCollection_HAsciiString> & Description);

		/****** StepBasic_GeneralPropertyRelationship::SetName ******/
		/****** md5 signature: 1a85c1f4dd446039f14efe98df7aeb03 ******/
		%feature("compactdefaultargs") SetName;
		%feature("autodoc", "
Parameters
----------
Name: TCollection_HAsciiString

Return
-------
None

Description
-----------
Set field Name.
") SetName;
		void SetName(const opencascade::handle<TCollection_HAsciiString> & Name);

		/****** StepBasic_GeneralPropertyRelationship::SetRelatedGeneralProperty ******/
		/****** md5 signature: adda91d5a6d2c00cff734156e87e9048 ******/
		%feature("compactdefaultargs") SetRelatedGeneralProperty;
		%feature("autodoc", "
Parameters
----------
RelatedGeneralProperty: StepBasic_GeneralProperty

Return
-------
None

Description
-----------
Set field RelatedGeneralProperty.
") SetRelatedGeneralProperty;
		void SetRelatedGeneralProperty(const opencascade::handle<StepBasic_GeneralProperty> & RelatedGeneralProperty);

		/****** StepBasic_GeneralPropertyRelationship::SetRelatingGeneralProperty ******/
		/****** md5 signature: ae216cacb8c391ce335a5b8d8c868914 ******/
		%feature("compactdefaultargs") SetRelatingGeneralProperty;
		%feature("autodoc", "
Parameters
----------
RelatingGeneralProperty: StepBasic_GeneralProperty

Return
-------
None

Description
-----------
Set field RelatingGeneralProperty.
") SetRelatingGeneralProperty;
		void SetRelatingGeneralProperty(const opencascade::handle<StepBasic_GeneralProperty> & RelatingGeneralProperty);

};


%make_alias(StepBasic_GeneralPropertyRelationship)

%extend StepBasic_GeneralPropertyRelationship {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************
* class StepBasic_Group *
************************/
class StepBasic_Group : public Standard_Transient {
	public:
		/****** StepBasic_Group::StepBasic_Group ******/
		/****** md5 signature: 300794a7c0fea762fb0a815420e468e9 ******/
		%feature("compactdefaultargs") StepBasic_Group;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") StepBasic_Group;
		 StepBasic_Group();

		/****** StepBasic_Group::Description ******/
		/****** md5 signature: 68309bdf9d57a000073490b39f8e7a41 ******/
		%feature("compactdefaultargs") Description;
		%feature("autodoc", "Return
-------
opencascade::handle<TCollection_HAsciiString>

Description
-----------
Returns field Description.
") Description;
		opencascade::handle<TCollection_HAsciiString> Description();

		/****** StepBasic_Group::HasDescription ******/
		/****** md5 signature: 819ef9a3dced474861e1980d901a2978 ******/
		%feature("compactdefaultargs") HasDescription;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if optional field Description is defined.
") HasDescription;
		Standard_Boolean HasDescription();

		/****** StepBasic_Group::Init ******/
		/****** md5 signature: f1e00464b915b5c43dbfec20d469b99a ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
aName: TCollection_HAsciiString
hasDescription: bool
aDescription: TCollection_HAsciiString

Return
-------
None

Description
-----------
Initialize all fields (own and inherited).
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aName, const Standard_Boolean hasDescription, const opencascade::handle<TCollection_HAsciiString> & aDescription);

		/****** StepBasic_Group::Name ******/
		/****** md5 signature: 6bcb97f17b57cae0750fd29eac20499c ******/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "Return
-------
opencascade::handle<TCollection_HAsciiString>

Description
-----------
Returns field Name.
") Name;
		opencascade::handle<TCollection_HAsciiString> Name();

		/****** StepBasic_Group::SetDescription ******/
		/****** md5 signature: 11ff45bab13c9c85c44619d6c4501da8 ******/
		%feature("compactdefaultargs") SetDescription;
		%feature("autodoc", "
Parameters
----------
Description: TCollection_HAsciiString

Return
-------
None

Description
-----------
Set field Description.
") SetDescription;
		void SetDescription(const opencascade::handle<TCollection_HAsciiString> & Description);

		/****** StepBasic_Group::SetName ******/
		/****** md5 signature: 1a85c1f4dd446039f14efe98df7aeb03 ******/
		%feature("compactdefaultargs") SetName;
		%feature("autodoc", "
Parameters
----------
Name: TCollection_HAsciiString

Return
-------
None

Description
-----------
Set field Name.
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
		/****** StepBasic_GroupAssignment::StepBasic_GroupAssignment ******/
		/****** md5 signature: 280304ce6787db8480fe6e5bbe18008c ******/
		%feature("compactdefaultargs") StepBasic_GroupAssignment;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") StepBasic_GroupAssignment;
		 StepBasic_GroupAssignment();

		/****** StepBasic_GroupAssignment::AssignedGroup ******/
		/****** md5 signature: 6d6cb5846f6140833d4d87cdd7f8e062 ******/
		%feature("compactdefaultargs") AssignedGroup;
		%feature("autodoc", "Return
-------
opencascade::handle<StepBasic_Group>

Description
-----------
Returns field AssignedGroup.
") AssignedGroup;
		opencascade::handle<StepBasic_Group> AssignedGroup();

		/****** StepBasic_GroupAssignment::Init ******/
		/****** md5 signature: e4cbff9dd4df06f1904f657e417480d2 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
aAssignedGroup: StepBasic_Group

Return
-------
None

Description
-----------
Initialize all fields (own and inherited).
") Init;
		void Init(const opencascade::handle<StepBasic_Group> & aAssignedGroup);

		/****** StepBasic_GroupAssignment::SetAssignedGroup ******/
		/****** md5 signature: 309fbbfbf7949a4f2be2a024526430cf ******/
		%feature("compactdefaultargs") SetAssignedGroup;
		%feature("autodoc", "
Parameters
----------
AssignedGroup: StepBasic_Group

Return
-------
None

Description
-----------
Set field AssignedGroup.
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
		/****** StepBasic_GroupRelationship::StepBasic_GroupRelationship ******/
		/****** md5 signature: 87be79f436e6eb139752b6e18ad26b9c ******/
		%feature("compactdefaultargs") StepBasic_GroupRelationship;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") StepBasic_GroupRelationship;
		 StepBasic_GroupRelationship();

		/****** StepBasic_GroupRelationship::Description ******/
		/****** md5 signature: 68309bdf9d57a000073490b39f8e7a41 ******/
		%feature("compactdefaultargs") Description;
		%feature("autodoc", "Return
-------
opencascade::handle<TCollection_HAsciiString>

Description
-----------
Returns field Description.
") Description;
		opencascade::handle<TCollection_HAsciiString> Description();

		/****** StepBasic_GroupRelationship::HasDescription ******/
		/****** md5 signature: 819ef9a3dced474861e1980d901a2978 ******/
		%feature("compactdefaultargs") HasDescription;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if optional field Description is defined.
") HasDescription;
		Standard_Boolean HasDescription();

		/****** StepBasic_GroupRelationship::Init ******/
		/****** md5 signature: 895986aa020206d592bb0bc8af16ac69 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
aName: TCollection_HAsciiString
hasDescription: bool
aDescription: TCollection_HAsciiString
aRelatingGroup: StepBasic_Group
aRelatedGroup: StepBasic_Group

Return
-------
None

Description
-----------
Initialize all fields (own and inherited).
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aName, const Standard_Boolean hasDescription, const opencascade::handle<TCollection_HAsciiString> & aDescription, const opencascade::handle<StepBasic_Group> & aRelatingGroup, const opencascade::handle<StepBasic_Group> & aRelatedGroup);

		/****** StepBasic_GroupRelationship::Name ******/
		/****** md5 signature: 6bcb97f17b57cae0750fd29eac20499c ******/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "Return
-------
opencascade::handle<TCollection_HAsciiString>

Description
-----------
Returns field Name.
") Name;
		opencascade::handle<TCollection_HAsciiString> Name();

		/****** StepBasic_GroupRelationship::RelatedGroup ******/
		/****** md5 signature: 9823add22ed82ec4f38c61d78bfd3710 ******/
		%feature("compactdefaultargs") RelatedGroup;
		%feature("autodoc", "Return
-------
opencascade::handle<StepBasic_Group>

Description
-----------
Returns field RelatedGroup.
") RelatedGroup;
		opencascade::handle<StepBasic_Group> RelatedGroup();

		/****** StepBasic_GroupRelationship::RelatingGroup ******/
		/****** md5 signature: 0dfd46c777e836afd490ed100a0dceb8 ******/
		%feature("compactdefaultargs") RelatingGroup;
		%feature("autodoc", "Return
-------
opencascade::handle<StepBasic_Group>

Description
-----------
Returns field RelatingGroup.
") RelatingGroup;
		opencascade::handle<StepBasic_Group> RelatingGroup();

		/****** StepBasic_GroupRelationship::SetDescription ******/
		/****** md5 signature: 11ff45bab13c9c85c44619d6c4501da8 ******/
		%feature("compactdefaultargs") SetDescription;
		%feature("autodoc", "
Parameters
----------
Description: TCollection_HAsciiString

Return
-------
None

Description
-----------
Set field Description.
") SetDescription;
		void SetDescription(const opencascade::handle<TCollection_HAsciiString> & Description);

		/****** StepBasic_GroupRelationship::SetName ******/
		/****** md5 signature: 1a85c1f4dd446039f14efe98df7aeb03 ******/
		%feature("compactdefaultargs") SetName;
		%feature("autodoc", "
Parameters
----------
Name: TCollection_HAsciiString

Return
-------
None

Description
-----------
Set field Name.
") SetName;
		void SetName(const opencascade::handle<TCollection_HAsciiString> & Name);

		/****** StepBasic_GroupRelationship::SetRelatedGroup ******/
		/****** md5 signature: aea7df1013f88266200792f28729e68d ******/
		%feature("compactdefaultargs") SetRelatedGroup;
		%feature("autodoc", "
Parameters
----------
RelatedGroup: StepBasic_Group

Return
-------
None

Description
-----------
Set field RelatedGroup.
") SetRelatedGroup;
		void SetRelatedGroup(const opencascade::handle<StepBasic_Group> & RelatedGroup);

		/****** StepBasic_GroupRelationship::SetRelatingGroup ******/
		/****** md5 signature: 38ba38a6d11ca6bcab5247baa10a8f80 ******/
		%feature("compactdefaultargs") SetRelatingGroup;
		%feature("autodoc", "
Parameters
----------
RelatingGroup: StepBasic_Group

Return
-------
None

Description
-----------
Set field RelatingGroup.
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
		/****** StepBasic_IdentificationAssignment::StepBasic_IdentificationAssignment ******/
		/****** md5 signature: 93f47581eb75f317fd63e62f80229d11 ******/
		%feature("compactdefaultargs") StepBasic_IdentificationAssignment;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") StepBasic_IdentificationAssignment;
		 StepBasic_IdentificationAssignment();

		/****** StepBasic_IdentificationAssignment::AssignedId ******/
		/****** md5 signature: f12bf17043dc737ac5f58fe4d6b68271 ******/
		%feature("compactdefaultargs") AssignedId;
		%feature("autodoc", "Return
-------
opencascade::handle<TCollection_HAsciiString>

Description
-----------
Returns field AssignedId.
") AssignedId;
		opencascade::handle<TCollection_HAsciiString> AssignedId();

		/****** StepBasic_IdentificationAssignment::Init ******/
		/****** md5 signature: e8e886ab7a986781830f00d82917bb82 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
aAssignedId: TCollection_HAsciiString
aRole: StepBasic_IdentificationRole

Return
-------
None

Description
-----------
Initialize all fields (own and inherited).
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aAssignedId, const opencascade::handle<StepBasic_IdentificationRole> & aRole);

		/****** StepBasic_IdentificationAssignment::Role ******/
		/****** md5 signature: 757fadf1d918cbdebb66723d79293c34 ******/
		%feature("compactdefaultargs") Role;
		%feature("autodoc", "Return
-------
opencascade::handle<StepBasic_IdentificationRole>

Description
-----------
Returns field Role.
") Role;
		opencascade::handle<StepBasic_IdentificationRole> Role();

		/****** StepBasic_IdentificationAssignment::SetAssignedId ******/
		/****** md5 signature: 67455e06952677db8ef3d659d9019549 ******/
		%feature("compactdefaultargs") SetAssignedId;
		%feature("autodoc", "
Parameters
----------
AssignedId: TCollection_HAsciiString

Return
-------
None

Description
-----------
Set field AssignedId.
") SetAssignedId;
		void SetAssignedId(const opencascade::handle<TCollection_HAsciiString> & AssignedId);

		/****** StepBasic_IdentificationAssignment::SetRole ******/
		/****** md5 signature: 91eb38eb2f9519d4d7591735c1fbe4f2 ******/
		%feature("compactdefaultargs") SetRole;
		%feature("autodoc", "
Parameters
----------
Role: StepBasic_IdentificationRole

Return
-------
None

Description
-----------
Set field Role.
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
		/****** StepBasic_IdentificationRole::StepBasic_IdentificationRole ******/
		/****** md5 signature: 57a78d8804cba5e6278b0244b45f05fb ******/
		%feature("compactdefaultargs") StepBasic_IdentificationRole;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") StepBasic_IdentificationRole;
		 StepBasic_IdentificationRole();

		/****** StepBasic_IdentificationRole::Description ******/
		/****** md5 signature: 68309bdf9d57a000073490b39f8e7a41 ******/
		%feature("compactdefaultargs") Description;
		%feature("autodoc", "Return
-------
opencascade::handle<TCollection_HAsciiString>

Description
-----------
Returns field Description.
") Description;
		opencascade::handle<TCollection_HAsciiString> Description();

		/****** StepBasic_IdentificationRole::HasDescription ******/
		/****** md5 signature: 819ef9a3dced474861e1980d901a2978 ******/
		%feature("compactdefaultargs") HasDescription;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if optional field Description is defined.
") HasDescription;
		Standard_Boolean HasDescription();

		/****** StepBasic_IdentificationRole::Init ******/
		/****** md5 signature: f1e00464b915b5c43dbfec20d469b99a ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
aName: TCollection_HAsciiString
hasDescription: bool
aDescription: TCollection_HAsciiString

Return
-------
None

Description
-----------
Initialize all fields (own and inherited).
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aName, const Standard_Boolean hasDescription, const opencascade::handle<TCollection_HAsciiString> & aDescription);

		/****** StepBasic_IdentificationRole::Name ******/
		/****** md5 signature: 6bcb97f17b57cae0750fd29eac20499c ******/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "Return
-------
opencascade::handle<TCollection_HAsciiString>

Description
-----------
Returns field Name.
") Name;
		opencascade::handle<TCollection_HAsciiString> Name();

		/****** StepBasic_IdentificationRole::SetDescription ******/
		/****** md5 signature: 11ff45bab13c9c85c44619d6c4501da8 ******/
		%feature("compactdefaultargs") SetDescription;
		%feature("autodoc", "
Parameters
----------
Description: TCollection_HAsciiString

Return
-------
None

Description
-----------
Set field Description.
") SetDescription;
		void SetDescription(const opencascade::handle<TCollection_HAsciiString> & Description);

		/****** StepBasic_IdentificationRole::SetName ******/
		/****** md5 signature: 1a85c1f4dd446039f14efe98df7aeb03 ******/
		%feature("compactdefaultargs") SetName;
		%feature("autodoc", "
Parameters
----------
Name: TCollection_HAsciiString

Return
-------
None

Description
-----------
Set field Name.
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
		/****** StepBasic_LocalTime::StepBasic_LocalTime ******/
		/****** md5 signature: 5ee6724eb85cc7fd17c8f814ec00f647 ******/
		%feature("compactdefaultargs") StepBasic_LocalTime;
		%feature("autodoc", "Return
-------
None

Description
-----------
Returns a LocalTime.
") StepBasic_LocalTime;
		 StepBasic_LocalTime();

		/****** StepBasic_LocalTime::HasMinuteComponent ******/
		/****** md5 signature: 0e1e485905a4775e8f40a8b3ef8dda33 ******/
		%feature("compactdefaultargs") HasMinuteComponent;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") HasMinuteComponent;
		Standard_Boolean HasMinuteComponent();

		/****** StepBasic_LocalTime::HasSecondComponent ******/
		/****** md5 signature: 16096abd13fd9c7f7be70feb495c99c7 ******/
		%feature("compactdefaultargs") HasSecondComponent;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") HasSecondComponent;
		Standard_Boolean HasSecondComponent();

		/****** StepBasic_LocalTime::HourComponent ******/
		/****** md5 signature: 0ae126454dff6778ff5a52ddbdf463a4 ******/
		%feature("compactdefaultargs") HourComponent;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") HourComponent;
		Standard_Integer HourComponent();

		/****** StepBasic_LocalTime::Init ******/
		/****** md5 signature: 17fc466df19e47c9603308465f7ea9a7 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
aHourComponent: int
hasAminuteComponent: bool
aMinuteComponent: int
hasAsecondComponent: bool
aSecondComponent: float
aZone: StepBasic_CoordinatedUniversalTimeOffset

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const Standard_Integer aHourComponent, const Standard_Boolean hasAminuteComponent, const Standard_Integer aMinuteComponent, const Standard_Boolean hasAsecondComponent, const Standard_Real aSecondComponent, const opencascade::handle<StepBasic_CoordinatedUniversalTimeOffset> & aZone);

		/****** StepBasic_LocalTime::MinuteComponent ******/
		/****** md5 signature: 50150043b4b796778bbfd29da1e492db ******/
		%feature("compactdefaultargs") MinuteComponent;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") MinuteComponent;
		Standard_Integer MinuteComponent();

		/****** StepBasic_LocalTime::SecondComponent ******/
		/****** md5 signature: 14301560202178f1c24ca347a9df229e ******/
		%feature("compactdefaultargs") SecondComponent;
		%feature("autodoc", "Return
-------
float

Description
-----------
No available documentation.
") SecondComponent;
		Standard_Real SecondComponent();

		/****** StepBasic_LocalTime::SetHourComponent ******/
		/****** md5 signature: 91ab2443588ab322ae433551dea13666 ******/
		%feature("compactdefaultargs") SetHourComponent;
		%feature("autodoc", "
Parameters
----------
aHourComponent: int

Return
-------
None

Description
-----------
No available documentation.
") SetHourComponent;
		void SetHourComponent(const Standard_Integer aHourComponent);

		/****** StepBasic_LocalTime::SetMinuteComponent ******/
		/****** md5 signature: 2fb0b71dc1a72ab36db26ded7c773946 ******/
		%feature("compactdefaultargs") SetMinuteComponent;
		%feature("autodoc", "
Parameters
----------
aMinuteComponent: int

Return
-------
None

Description
-----------
No available documentation.
") SetMinuteComponent;
		void SetMinuteComponent(const Standard_Integer aMinuteComponent);

		/****** StepBasic_LocalTime::SetSecondComponent ******/
		/****** md5 signature: 77bd2e16d930a7aba083d43b922b7508 ******/
		%feature("compactdefaultargs") SetSecondComponent;
		%feature("autodoc", "
Parameters
----------
aSecondComponent: float

Return
-------
None

Description
-----------
No available documentation.
") SetSecondComponent;
		void SetSecondComponent(const Standard_Real aSecondComponent);

		/****** StepBasic_LocalTime::SetZone ******/
		/****** md5 signature: 579c2bb84cfd392b8ed8780caf2f408c ******/
		%feature("compactdefaultargs") SetZone;
		%feature("autodoc", "
Parameters
----------
aZone: StepBasic_CoordinatedUniversalTimeOffset

Return
-------
None

Description
-----------
No available documentation.
") SetZone;
		void SetZone(const opencascade::handle<StepBasic_CoordinatedUniversalTimeOffset> & aZone);

		/****** StepBasic_LocalTime::UnSetMinuteComponent ******/
		/****** md5 signature: 4b476a90c7021728a930f69a7a11c869 ******/
		%feature("compactdefaultargs") UnSetMinuteComponent;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") UnSetMinuteComponent;
		void UnSetMinuteComponent();

		/****** StepBasic_LocalTime::UnSetSecondComponent ******/
		/****** md5 signature: 3db79fa6499d4eda842d785dc9c5c7a7 ******/
		%feature("compactdefaultargs") UnSetSecondComponent;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") UnSetSecondComponent;
		void UnSetSecondComponent();

		/****** StepBasic_LocalTime::Zone ******/
		/****** md5 signature: 0825816d63baf5ba11320fa46f123fb5 ******/
		%feature("compactdefaultargs") Zone;
		%feature("autodoc", "Return
-------
opencascade::handle<StepBasic_CoordinatedUniversalTimeOffset>

Description
-----------
No available documentation.
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
		/****** StepBasic_MeasureValueMember::StepBasic_MeasureValueMember ******/
		/****** md5 signature: 83af7b86d292b1cdd3c0682b1cbb5993 ******/
		%feature("compactdefaultargs") StepBasic_MeasureValueMember;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") StepBasic_MeasureValueMember;
		 StepBasic_MeasureValueMember();

		/****** StepBasic_MeasureValueMember::HasName ******/
		/****** md5 signature: c4b2dbd737f3c98314fdb7955ce91c2a ******/
		%feature("compactdefaultargs") HasName;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") HasName;
		virtual Standard_Boolean HasName();

		/****** StepBasic_MeasureValueMember::Name ******/
		/****** md5 signature: d654a4ee9a75d24a9c3f33853f908999 ******/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "Return
-------
str

Description
-----------
No available documentation.
") Name;
		virtual Standard_CString Name();

		/****** StepBasic_MeasureValueMember::SetName ******/
		/****** md5 signature: cb088c8a5caf9447945830483c3112e7 ******/
		%feature("compactdefaultargs") SetName;
		%feature("autodoc", "
Parameters
----------
name: str

Return
-------
bool

Description
-----------
No available documentation.
") SetName;
		virtual Standard_Boolean SetName(Standard_CString name);

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
		/****** StepBasic_MeasureWithUnit::StepBasic_MeasureWithUnit ******/
		/****** md5 signature: 29b118b5d7929d786614a8739bad74ce ******/
		%feature("compactdefaultargs") StepBasic_MeasureWithUnit;
		%feature("autodoc", "Return
-------
None

Description
-----------
Returns a MeasureWithUnit.
") StepBasic_MeasureWithUnit;
		 StepBasic_MeasureWithUnit();

		/****** StepBasic_MeasureWithUnit::Init ******/
		/****** md5 signature: c6ce2f17d01d5ece1df60b75a19d21c2 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
aValueComponent: StepBasic_MeasureValueMember
aUnitComponent: StepBasic_Unit

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const opencascade::handle<StepBasic_MeasureValueMember> & aValueComponent, const StepBasic_Unit & aUnitComponent);

		/****** StepBasic_MeasureWithUnit::SetUnitComponent ******/
		/****** md5 signature: b688bbcd1dc311f5aeac912af22b8f87 ******/
		%feature("compactdefaultargs") SetUnitComponent;
		%feature("autodoc", "
Parameters
----------
aUnitComponent: StepBasic_Unit

Return
-------
None

Description
-----------
No available documentation.
") SetUnitComponent;
		void SetUnitComponent(const StepBasic_Unit & aUnitComponent);

		/****** StepBasic_MeasureWithUnit::SetValueComponent ******/
		/****** md5 signature: 013f0f5d58ef4ce8e8786002893dc682 ******/
		%feature("compactdefaultargs") SetValueComponent;
		%feature("autodoc", "
Parameters
----------
aValueComponent: float

Return
-------
None

Description
-----------
No available documentation.
") SetValueComponent;
		void SetValueComponent(const Standard_Real aValueComponent);

		/****** StepBasic_MeasureWithUnit::SetValueComponentMember ******/
		/****** md5 signature: d70df46730cda4eaec8067615ba01cdf ******/
		%feature("compactdefaultargs") SetValueComponentMember;
		%feature("autodoc", "
Parameters
----------
val: StepBasic_MeasureValueMember

Return
-------
None

Description
-----------
No available documentation.
") SetValueComponentMember;
		void SetValueComponentMember(const opencascade::handle<StepBasic_MeasureValueMember> & val);

		/****** StepBasic_MeasureWithUnit::UnitComponent ******/
		/****** md5 signature: c309e94f1a30356e372d0b70aaaa706b ******/
		%feature("compactdefaultargs") UnitComponent;
		%feature("autodoc", "Return
-------
StepBasic_Unit

Description
-----------
No available documentation.
") UnitComponent;
		StepBasic_Unit UnitComponent();

		/****** StepBasic_MeasureWithUnit::ValueComponent ******/
		/****** md5 signature: 416aa0800934d007f54f7d87fd170269 ******/
		%feature("compactdefaultargs") ValueComponent;
		%feature("autodoc", "Return
-------
float

Description
-----------
No available documentation.
") ValueComponent;
		Standard_Real ValueComponent();

		/****** StepBasic_MeasureWithUnit::ValueComponentMember ******/
		/****** md5 signature: 017f07fb974a1b9678ec4ca8d2d8a914 ******/
		%feature("compactdefaultargs") ValueComponentMember;
		%feature("autodoc", "Return
-------
opencascade::handle<StepBasic_MeasureValueMember>

Description
-----------
No available documentation.
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
		/****** StepBasic_NameAssignment::StepBasic_NameAssignment ******/
		/****** md5 signature: 23a898252c93df1044f568ac6dfd66bd ******/
		%feature("compactdefaultargs") StepBasic_NameAssignment;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") StepBasic_NameAssignment;
		 StepBasic_NameAssignment();

		/****** StepBasic_NameAssignment::AssignedName ******/
		/****** md5 signature: 46ae5fd1e8dbc39b25b2971bbc29c2fc ******/
		%feature("compactdefaultargs") AssignedName;
		%feature("autodoc", "Return
-------
opencascade::handle<TCollection_HAsciiString>

Description
-----------
Returns field AssignedName.
") AssignedName;
		opencascade::handle<TCollection_HAsciiString> AssignedName();

		/****** StepBasic_NameAssignment::Init ******/
		/****** md5 signature: 0927b0f7c1a80b7dc7d5e8a5cfacadd1 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
aAssignedName: TCollection_HAsciiString

Return
-------
None

Description
-----------
Initialize all fields (own and inherited).
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aAssignedName);

		/****** StepBasic_NameAssignment::SetAssignedName ******/
		/****** md5 signature: c4e5175134ec51ec71023702cfce9f8b ******/
		%feature("compactdefaultargs") SetAssignedName;
		%feature("autodoc", "
Parameters
----------
AssignedName: TCollection_HAsciiString

Return
-------
None

Description
-----------
Set field AssignedName.
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
		/****** StepBasic_NamedUnit::StepBasic_NamedUnit ******/
		/****** md5 signature: e787903e71cbfee3b1009d9b320ac0b6 ******/
		%feature("compactdefaultargs") StepBasic_NamedUnit;
		%feature("autodoc", "Return
-------
None

Description
-----------
Returns a NamedUnit.
") StepBasic_NamedUnit;
		 StepBasic_NamedUnit();

		/****** StepBasic_NamedUnit::Dimensions ******/
		/****** md5 signature: b06807ffcd27df6f8d30dd9bbc5b560e ******/
		%feature("compactdefaultargs") Dimensions;
		%feature("autodoc", "Return
-------
opencascade::handle<StepBasic_DimensionalExponents>

Description
-----------
No available documentation.
") Dimensions;
		virtual opencascade::handle<StepBasic_DimensionalExponents> Dimensions();

		/****** StepBasic_NamedUnit::Init ******/
		/****** md5 signature: d74ccc372f0313d4c591c5e4b9e58d83 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
aDimensions: StepBasic_DimensionalExponents

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const opencascade::handle<StepBasic_DimensionalExponents> & aDimensions);

		/****** StepBasic_NamedUnit::SetDimensions ******/
		/****** md5 signature: 92003abc2d339c52f73b33bd9a0db06d ******/
		%feature("compactdefaultargs") SetDimensions;
		%feature("autodoc", "
Parameters
----------
aDimensions: StepBasic_DimensionalExponents

Return
-------
None

Description
-----------
No available documentation.
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
		/****** StepBasic_ObjectRole::StepBasic_ObjectRole ******/
		/****** md5 signature: 3a767d4b0166e01bddc0f9adffd7c08b ******/
		%feature("compactdefaultargs") StepBasic_ObjectRole;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") StepBasic_ObjectRole;
		 StepBasic_ObjectRole();

		/****** StepBasic_ObjectRole::Description ******/
		/****** md5 signature: 68309bdf9d57a000073490b39f8e7a41 ******/
		%feature("compactdefaultargs") Description;
		%feature("autodoc", "Return
-------
opencascade::handle<TCollection_HAsciiString>

Description
-----------
Returns field Description.
") Description;
		opencascade::handle<TCollection_HAsciiString> Description();

		/****** StepBasic_ObjectRole::HasDescription ******/
		/****** md5 signature: 819ef9a3dced474861e1980d901a2978 ******/
		%feature("compactdefaultargs") HasDescription;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if optional field Description is defined.
") HasDescription;
		Standard_Boolean HasDescription();

		/****** StepBasic_ObjectRole::Init ******/
		/****** md5 signature: f1e00464b915b5c43dbfec20d469b99a ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
aName: TCollection_HAsciiString
hasDescription: bool
aDescription: TCollection_HAsciiString

Return
-------
None

Description
-----------
Initialize all fields (own and inherited).
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aName, const Standard_Boolean hasDescription, const opencascade::handle<TCollection_HAsciiString> & aDescription);

		/****** StepBasic_ObjectRole::Name ******/
		/****** md5 signature: 6bcb97f17b57cae0750fd29eac20499c ******/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "Return
-------
opencascade::handle<TCollection_HAsciiString>

Description
-----------
Returns field Name.
") Name;
		opencascade::handle<TCollection_HAsciiString> Name();

		/****** StepBasic_ObjectRole::SetDescription ******/
		/****** md5 signature: 11ff45bab13c9c85c44619d6c4501da8 ******/
		%feature("compactdefaultargs") SetDescription;
		%feature("autodoc", "
Parameters
----------
Description: TCollection_HAsciiString

Return
-------
None

Description
-----------
Set field Description.
") SetDescription;
		void SetDescription(const opencascade::handle<TCollection_HAsciiString> & Description);

		/****** StepBasic_ObjectRole::SetName ******/
		/****** md5 signature: 1a85c1f4dd446039f14efe98df7aeb03 ******/
		%feature("compactdefaultargs") SetName;
		%feature("autodoc", "
Parameters
----------
Name: TCollection_HAsciiString

Return
-------
None

Description
-----------
Set field Name.
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
		/****** StepBasic_Organization::StepBasic_Organization ******/
		/****** md5 signature: 07c565605096bf9498d494129f3d056f ******/
		%feature("compactdefaultargs") StepBasic_Organization;
		%feature("autodoc", "Return
-------
None

Description
-----------
Returns a Organization.
") StepBasic_Organization;
		 StepBasic_Organization();

		/****** StepBasic_Organization::Description ******/
		/****** md5 signature: 68309bdf9d57a000073490b39f8e7a41 ******/
		%feature("compactdefaultargs") Description;
		%feature("autodoc", "Return
-------
opencascade::handle<TCollection_HAsciiString>

Description
-----------
No available documentation.
") Description;
		opencascade::handle<TCollection_HAsciiString> Description();

		/****** StepBasic_Organization::HasId ******/
		/****** md5 signature: 301df1980d81870493903e6eee5538df ******/
		%feature("compactdefaultargs") HasId;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") HasId;
		Standard_Boolean HasId();

		/****** StepBasic_Organization::Id ******/
		/****** md5 signature: cad437aa1c6f9043742098c562124f9e ******/
		%feature("compactdefaultargs") Id;
		%feature("autodoc", "Return
-------
opencascade::handle<TCollection_HAsciiString>

Description
-----------
No available documentation.
") Id;
		opencascade::handle<TCollection_HAsciiString> Id();

		/****** StepBasic_Organization::Init ******/
		/****** md5 signature: b214cd7cc20055d3a8254b99a8885e29 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
hasAid: bool
aId: TCollection_HAsciiString
aName: TCollection_HAsciiString
aDescription: TCollection_HAsciiString

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const Standard_Boolean hasAid, const opencascade::handle<TCollection_HAsciiString> & aId, const opencascade::handle<TCollection_HAsciiString> & aName, const opencascade::handle<TCollection_HAsciiString> & aDescription);

		/****** StepBasic_Organization::Name ******/
		/****** md5 signature: 6bcb97f17b57cae0750fd29eac20499c ******/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "Return
-------
opencascade::handle<TCollection_HAsciiString>

Description
-----------
No available documentation.
") Name;
		opencascade::handle<TCollection_HAsciiString> Name();

		/****** StepBasic_Organization::SetDescription ******/
		/****** md5 signature: adddd13a906718df58a2eee683a382cf ******/
		%feature("compactdefaultargs") SetDescription;
		%feature("autodoc", "
Parameters
----------
aDescription: TCollection_HAsciiString

Return
-------
None

Description
-----------
No available documentation.
") SetDescription;
		void SetDescription(const opencascade::handle<TCollection_HAsciiString> & aDescription);

		/****** StepBasic_Organization::SetId ******/
		/****** md5 signature: a589ed4c1f87cc154c05276cfb60f4ea ******/
		%feature("compactdefaultargs") SetId;
		%feature("autodoc", "
Parameters
----------
aId: TCollection_HAsciiString

Return
-------
None

Description
-----------
No available documentation.
") SetId;
		void SetId(const opencascade::handle<TCollection_HAsciiString> & aId);

		/****** StepBasic_Organization::SetName ******/
		/****** md5 signature: 1e0b00d9eb163c8a0cdbb986e2ee24f6 ******/
		%feature("compactdefaultargs") SetName;
		%feature("autodoc", "
Parameters
----------
aName: TCollection_HAsciiString

Return
-------
None

Description
-----------
No available documentation.
") SetName;
		void SetName(const opencascade::handle<TCollection_HAsciiString> & aName);

		/****** StepBasic_Organization::UnSetId ******/
		/****** md5 signature: 7b78a79bc983a53d1385ad44bee372f8 ******/
		%feature("compactdefaultargs") UnSetId;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
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
		/****** StepBasic_OrganizationAssignment::AssignedOrganization ******/
		/****** md5 signature: a9c513aa3cbac4d71235bf9ba89efdfc ******/
		%feature("compactdefaultargs") AssignedOrganization;
		%feature("autodoc", "Return
-------
opencascade::handle<StepBasic_Organization>

Description
-----------
No available documentation.
") AssignedOrganization;
		opencascade::handle<StepBasic_Organization> AssignedOrganization();

		/****** StepBasic_OrganizationAssignment::Init ******/
		/****** md5 signature: 4f7e31e93763c703c1e4c500478306dc ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
aAssignedOrganization: StepBasic_Organization
aRole: StepBasic_OrganizationRole

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const opencascade::handle<StepBasic_Organization> & aAssignedOrganization, const opencascade::handle<StepBasic_OrganizationRole> & aRole);

		/****** StepBasic_OrganizationAssignment::Role ******/
		/****** md5 signature: fa1ef7886f1218721e08e8e6966da0c5 ******/
		%feature("compactdefaultargs") Role;
		%feature("autodoc", "Return
-------
opencascade::handle<StepBasic_OrganizationRole>

Description
-----------
No available documentation.
") Role;
		opencascade::handle<StepBasic_OrganizationRole> Role();

		/****** StepBasic_OrganizationAssignment::SetAssignedOrganization ******/
		/****** md5 signature: 3bd16050cb1be712d9550173a3fc8ebf ******/
		%feature("compactdefaultargs") SetAssignedOrganization;
		%feature("autodoc", "
Parameters
----------
aAssignedOrganization: StepBasic_Organization

Return
-------
None

Description
-----------
No available documentation.
") SetAssignedOrganization;
		void SetAssignedOrganization(const opencascade::handle<StepBasic_Organization> & aAssignedOrganization);

		/****** StepBasic_OrganizationAssignment::SetRole ******/
		/****** md5 signature: 34e785836b3f210185349bed482e1e37 ******/
		%feature("compactdefaultargs") SetRole;
		%feature("autodoc", "
Parameters
----------
aRole: StepBasic_OrganizationRole

Return
-------
None

Description
-----------
No available documentation.
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
		/****** StepBasic_OrganizationRole::StepBasic_OrganizationRole ******/
		/****** md5 signature: 5ba9d91dfa782ade765b7c4e6011b742 ******/
		%feature("compactdefaultargs") StepBasic_OrganizationRole;
		%feature("autodoc", "Return
-------
None

Description
-----------
Returns a OrganizationRole.
") StepBasic_OrganizationRole;
		 StepBasic_OrganizationRole();

		/****** StepBasic_OrganizationRole::Init ******/
		/****** md5 signature: e10f4ffe4365262d2d9a5484d96325b8 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
aName: TCollection_HAsciiString

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aName);

		/****** StepBasic_OrganizationRole::Name ******/
		/****** md5 signature: 6bcb97f17b57cae0750fd29eac20499c ******/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "Return
-------
opencascade::handle<TCollection_HAsciiString>

Description
-----------
No available documentation.
") Name;
		opencascade::handle<TCollection_HAsciiString> Name();

		/****** StepBasic_OrganizationRole::SetName ******/
		/****** md5 signature: 1e0b00d9eb163c8a0cdbb986e2ee24f6 ******/
		%feature("compactdefaultargs") SetName;
		%feature("autodoc", "
Parameters
----------
aName: TCollection_HAsciiString

Return
-------
None

Description
-----------
No available documentation.
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
		/****** StepBasic_Person::StepBasic_Person ******/
		/****** md5 signature: e88e4e4683aeeaf6373f1d3d985dd5b7 ******/
		%feature("compactdefaultargs") StepBasic_Person;
		%feature("autodoc", "Return
-------
None

Description
-----------
Returns a Person.
") StepBasic_Person;
		 StepBasic_Person();

		/****** StepBasic_Person::FirstName ******/
		/****** md5 signature: fedebed151a60555bd73f524268af2c5 ******/
		%feature("compactdefaultargs") FirstName;
		%feature("autodoc", "Return
-------
opencascade::handle<TCollection_HAsciiString>

Description
-----------
No available documentation.
") FirstName;
		opencascade::handle<TCollection_HAsciiString> FirstName();

		/****** StepBasic_Person::HasFirstName ******/
		/****** md5 signature: d24b85099a07ae9aee440490e7247415 ******/
		%feature("compactdefaultargs") HasFirstName;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") HasFirstName;
		Standard_Boolean HasFirstName();

		/****** StepBasic_Person::HasLastName ******/
		/****** md5 signature: c6d88a30b099798c08786015f6c1910e ******/
		%feature("compactdefaultargs") HasLastName;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") HasLastName;
		Standard_Boolean HasLastName();

		/****** StepBasic_Person::HasMiddleNames ******/
		/****** md5 signature: c58eec2a3d3246124bc2467cb64a40b8 ******/
		%feature("compactdefaultargs") HasMiddleNames;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") HasMiddleNames;
		Standard_Boolean HasMiddleNames();

		/****** StepBasic_Person::HasPrefixTitles ******/
		/****** md5 signature: 84bd178645d256bb0058a0d05032eecb ******/
		%feature("compactdefaultargs") HasPrefixTitles;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") HasPrefixTitles;
		Standard_Boolean HasPrefixTitles();

		/****** StepBasic_Person::HasSuffixTitles ******/
		/****** md5 signature: 80894eaf5201088accfea4bf987ae620 ******/
		%feature("compactdefaultargs") HasSuffixTitles;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") HasSuffixTitles;
		Standard_Boolean HasSuffixTitles();

		/****** StepBasic_Person::Id ******/
		/****** md5 signature: cad437aa1c6f9043742098c562124f9e ******/
		%feature("compactdefaultargs") Id;
		%feature("autodoc", "Return
-------
opencascade::handle<TCollection_HAsciiString>

Description
-----------
No available documentation.
") Id;
		opencascade::handle<TCollection_HAsciiString> Id();

		/****** StepBasic_Person::Init ******/
		/****** md5 signature: a3e0571f7f776a0d94a8640cec6b78d9 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
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

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aId, const Standard_Boolean hasAlastName, const opencascade::handle<TCollection_HAsciiString> & aLastName, const Standard_Boolean hasAfirstName, const opencascade::handle<TCollection_HAsciiString> & aFirstName, const Standard_Boolean hasAmiddleNames, const opencascade::handle<Interface_HArray1OfHAsciiString> & aMiddleNames, const Standard_Boolean hasAprefixTitles, const opencascade::handle<Interface_HArray1OfHAsciiString> & aPrefixTitles, const Standard_Boolean hasAsuffixTitles, const opencascade::handle<Interface_HArray1OfHAsciiString> & aSuffixTitles);

		/****** StepBasic_Person::LastName ******/
		/****** md5 signature: de2911d8bac319b53e48cc2cfb8e5982 ******/
		%feature("compactdefaultargs") LastName;
		%feature("autodoc", "Return
-------
opencascade::handle<TCollection_HAsciiString>

Description
-----------
No available documentation.
") LastName;
		opencascade::handle<TCollection_HAsciiString> LastName();

		/****** StepBasic_Person::MiddleNames ******/
		/****** md5 signature: d48e76a66a76924158f7353a745f954d ******/
		%feature("compactdefaultargs") MiddleNames;
		%feature("autodoc", "Return
-------
opencascade::handle<Interface_HArray1OfHAsciiString>

Description
-----------
No available documentation.
") MiddleNames;
		opencascade::handle<Interface_HArray1OfHAsciiString> MiddleNames();

		/****** StepBasic_Person::MiddleNamesValue ******/
		/****** md5 signature: 2ea74712db6746d8347888e5ad394fdc ******/
		%feature("compactdefaultargs") MiddleNamesValue;
		%feature("autodoc", "
Parameters
----------
num: int

Return
-------
opencascade::handle<TCollection_HAsciiString>

Description
-----------
No available documentation.
") MiddleNamesValue;
		opencascade::handle<TCollection_HAsciiString> MiddleNamesValue(const Standard_Integer num);

		/****** StepBasic_Person::NbMiddleNames ******/
		/****** md5 signature: 16db45189f09a09589a79e0d5cb72d4a ******/
		%feature("compactdefaultargs") NbMiddleNames;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbMiddleNames;
		Standard_Integer NbMiddleNames();

		/****** StepBasic_Person::NbPrefixTitles ******/
		/****** md5 signature: 291384cfaa66f835ccebb90c4852a2a2 ******/
		%feature("compactdefaultargs") NbPrefixTitles;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbPrefixTitles;
		Standard_Integer NbPrefixTitles();

		/****** StepBasic_Person::NbSuffixTitles ******/
		/****** md5 signature: 3481c94a1965a1b7cd10c61ee9d35a97 ******/
		%feature("compactdefaultargs") NbSuffixTitles;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbSuffixTitles;
		Standard_Integer NbSuffixTitles();

		/****** StepBasic_Person::PrefixTitles ******/
		/****** md5 signature: 0ffcd8609c0a378d697a858ffbdae503 ******/
		%feature("compactdefaultargs") PrefixTitles;
		%feature("autodoc", "Return
-------
opencascade::handle<Interface_HArray1OfHAsciiString>

Description
-----------
No available documentation.
") PrefixTitles;
		opencascade::handle<Interface_HArray1OfHAsciiString> PrefixTitles();

		/****** StepBasic_Person::PrefixTitlesValue ******/
		/****** md5 signature: 9b740ba78d8f259655a6337095124dfc ******/
		%feature("compactdefaultargs") PrefixTitlesValue;
		%feature("autodoc", "
Parameters
----------
num: int

Return
-------
opencascade::handle<TCollection_HAsciiString>

Description
-----------
No available documentation.
") PrefixTitlesValue;
		opencascade::handle<TCollection_HAsciiString> PrefixTitlesValue(const Standard_Integer num);

		/****** StepBasic_Person::SetFirstName ******/
		/****** md5 signature: a8dd81e54774630044afa2058de7a789 ******/
		%feature("compactdefaultargs") SetFirstName;
		%feature("autodoc", "
Parameters
----------
aFirstName: TCollection_HAsciiString

Return
-------
None

Description
-----------
No available documentation.
") SetFirstName;
		void SetFirstName(const opencascade::handle<TCollection_HAsciiString> & aFirstName);

		/****** StepBasic_Person::SetId ******/
		/****** md5 signature: a589ed4c1f87cc154c05276cfb60f4ea ******/
		%feature("compactdefaultargs") SetId;
		%feature("autodoc", "
Parameters
----------
aId: TCollection_HAsciiString

Return
-------
None

Description
-----------
No available documentation.
") SetId;
		void SetId(const opencascade::handle<TCollection_HAsciiString> & aId);

		/****** StepBasic_Person::SetLastName ******/
		/****** md5 signature: e9526b4f726a70adc624477a371f5d0f ******/
		%feature("compactdefaultargs") SetLastName;
		%feature("autodoc", "
Parameters
----------
aLastName: TCollection_HAsciiString

Return
-------
None

Description
-----------
No available documentation.
") SetLastName;
		void SetLastName(const opencascade::handle<TCollection_HAsciiString> & aLastName);

		/****** StepBasic_Person::SetMiddleNames ******/
		/****** md5 signature: 36ecc716f6482798b54d3995ba849ed0 ******/
		%feature("compactdefaultargs") SetMiddleNames;
		%feature("autodoc", "
Parameters
----------
aMiddleNames: Interface_HArray1OfHAsciiString

Return
-------
None

Description
-----------
No available documentation.
") SetMiddleNames;
		void SetMiddleNames(const opencascade::handle<Interface_HArray1OfHAsciiString> & aMiddleNames);

		/****** StepBasic_Person::SetPrefixTitles ******/
		/****** md5 signature: ac80e7de0933cd63067fecf643ed5a95 ******/
		%feature("compactdefaultargs") SetPrefixTitles;
		%feature("autodoc", "
Parameters
----------
aPrefixTitles: Interface_HArray1OfHAsciiString

Return
-------
None

Description
-----------
No available documentation.
") SetPrefixTitles;
		void SetPrefixTitles(const opencascade::handle<Interface_HArray1OfHAsciiString> & aPrefixTitles);

		/****** StepBasic_Person::SetSuffixTitles ******/
		/****** md5 signature: b12961f49b33ef8d310da452eefc1e45 ******/
		%feature("compactdefaultargs") SetSuffixTitles;
		%feature("autodoc", "
Parameters
----------
aSuffixTitles: Interface_HArray1OfHAsciiString

Return
-------
None

Description
-----------
No available documentation.
") SetSuffixTitles;
		void SetSuffixTitles(const opencascade::handle<Interface_HArray1OfHAsciiString> & aSuffixTitles);

		/****** StepBasic_Person::SuffixTitles ******/
		/****** md5 signature: 5dc2c8a1bb8f86e997596134d0b25cfe ******/
		%feature("compactdefaultargs") SuffixTitles;
		%feature("autodoc", "Return
-------
opencascade::handle<Interface_HArray1OfHAsciiString>

Description
-----------
No available documentation.
") SuffixTitles;
		opencascade::handle<Interface_HArray1OfHAsciiString> SuffixTitles();

		/****** StepBasic_Person::SuffixTitlesValue ******/
		/****** md5 signature: 4484fd20864fa7a998e2dde3c6bf2521 ******/
		%feature("compactdefaultargs") SuffixTitlesValue;
		%feature("autodoc", "
Parameters
----------
num: int

Return
-------
opencascade::handle<TCollection_HAsciiString>

Description
-----------
No available documentation.
") SuffixTitlesValue;
		opencascade::handle<TCollection_HAsciiString> SuffixTitlesValue(const Standard_Integer num);

		/****** StepBasic_Person::UnSetFirstName ******/
		/****** md5 signature: 502887ddd0fd07cde6404487c4a930ef ******/
		%feature("compactdefaultargs") UnSetFirstName;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") UnSetFirstName;
		void UnSetFirstName();

		/****** StepBasic_Person::UnSetLastName ******/
		/****** md5 signature: 8023766d838242b48c6d210f5637687b ******/
		%feature("compactdefaultargs") UnSetLastName;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") UnSetLastName;
		void UnSetLastName();

		/****** StepBasic_Person::UnSetMiddleNames ******/
		/****** md5 signature: 71d7784f832c515f80a1f6221d63d798 ******/
		%feature("compactdefaultargs") UnSetMiddleNames;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") UnSetMiddleNames;
		void UnSetMiddleNames();

		/****** StepBasic_Person::UnSetPrefixTitles ******/
		/****** md5 signature: 0e8c02d7dace980ec69fbc396c99e991 ******/
		%feature("compactdefaultargs") UnSetPrefixTitles;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") UnSetPrefixTitles;
		void UnSetPrefixTitles();

		/****** StepBasic_Person::UnSetSuffixTitles ******/
		/****** md5 signature: 95fe5205132db94840b2a0c734789b1e ******/
		%feature("compactdefaultargs") UnSetSuffixTitles;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
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
		/****** StepBasic_PersonAndOrganization::StepBasic_PersonAndOrganization ******/
		/****** md5 signature: c788b859e1756ce030b9af4c2f5eb544 ******/
		%feature("compactdefaultargs") StepBasic_PersonAndOrganization;
		%feature("autodoc", "Return
-------
None

Description
-----------
Returns a PersonAndOrganization.
") StepBasic_PersonAndOrganization;
		 StepBasic_PersonAndOrganization();

		/****** StepBasic_PersonAndOrganization::Init ******/
		/****** md5 signature: b09e43314a155ac05fd10eb59553dd0b ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
aThePerson: StepBasic_Person
aTheOrganization: StepBasic_Organization

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const opencascade::handle<StepBasic_Person> & aThePerson, const opencascade::handle<StepBasic_Organization> & aTheOrganization);

		/****** StepBasic_PersonAndOrganization::SetTheOrganization ******/
		/****** md5 signature: ed6ecd08fe82ed16af95aa80cd7b4887 ******/
		%feature("compactdefaultargs") SetTheOrganization;
		%feature("autodoc", "
Parameters
----------
aTheOrganization: StepBasic_Organization

Return
-------
None

Description
-----------
No available documentation.
") SetTheOrganization;
		void SetTheOrganization(const opencascade::handle<StepBasic_Organization> & aTheOrganization);

		/****** StepBasic_PersonAndOrganization::SetThePerson ******/
		/****** md5 signature: e1618aa9de19b80e82b07de21254d9a3 ******/
		%feature("compactdefaultargs") SetThePerson;
		%feature("autodoc", "
Parameters
----------
aThePerson: StepBasic_Person

Return
-------
None

Description
-----------
No available documentation.
") SetThePerson;
		void SetThePerson(const opencascade::handle<StepBasic_Person> & aThePerson);

		/****** StepBasic_PersonAndOrganization::TheOrganization ******/
		/****** md5 signature: 88ef1ee565244dac5373566a016e971f ******/
		%feature("compactdefaultargs") TheOrganization;
		%feature("autodoc", "Return
-------
opencascade::handle<StepBasic_Organization>

Description
-----------
No available documentation.
") TheOrganization;
		opencascade::handle<StepBasic_Organization> TheOrganization();

		/****** StepBasic_PersonAndOrganization::ThePerson ******/
		/****** md5 signature: 447dff77998545a8b8359bcd2762ca3f ******/
		%feature("compactdefaultargs") ThePerson;
		%feature("autodoc", "Return
-------
opencascade::handle<StepBasic_Person>

Description
-----------
No available documentation.
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
		/****** StepBasic_PersonAndOrganizationAssignment::AssignedPersonAndOrganization ******/
		/****** md5 signature: 22a5f023211213aad8eb1f3d913aa34b ******/
		%feature("compactdefaultargs") AssignedPersonAndOrganization;
		%feature("autodoc", "Return
-------
opencascade::handle<StepBasic_PersonAndOrganization>

Description
-----------
No available documentation.
") AssignedPersonAndOrganization;
		opencascade::handle<StepBasic_PersonAndOrganization> AssignedPersonAndOrganization();

		/****** StepBasic_PersonAndOrganizationAssignment::Init ******/
		/****** md5 signature: bae423e5da8af47deb5e4eb44fae14f4 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
aAssignedPersonAndOrganization: StepBasic_PersonAndOrganization
aRole: StepBasic_PersonAndOrganizationRole

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const opencascade::handle<StepBasic_PersonAndOrganization> & aAssignedPersonAndOrganization, const opencascade::handle<StepBasic_PersonAndOrganizationRole> & aRole);

		/****** StepBasic_PersonAndOrganizationAssignment::Role ******/
		/****** md5 signature: 4deeef64ec09a06ac5538a1114e41d63 ******/
		%feature("compactdefaultargs") Role;
		%feature("autodoc", "Return
-------
opencascade::handle<StepBasic_PersonAndOrganizationRole>

Description
-----------
No available documentation.
") Role;
		opencascade::handle<StepBasic_PersonAndOrganizationRole> Role();

		/****** StepBasic_PersonAndOrganizationAssignment::SetAssignedPersonAndOrganization ******/
		/****** md5 signature: 3a2602592eeb22c87b63c69a96152fea ******/
		%feature("compactdefaultargs") SetAssignedPersonAndOrganization;
		%feature("autodoc", "
Parameters
----------
aAssignedPersonAndOrganization: StepBasic_PersonAndOrganization

Return
-------
None

Description
-----------
No available documentation.
") SetAssignedPersonAndOrganization;
		void SetAssignedPersonAndOrganization(const opencascade::handle<StepBasic_PersonAndOrganization> & aAssignedPersonAndOrganization);

		/****** StepBasic_PersonAndOrganizationAssignment::SetRole ******/
		/****** md5 signature: 66058b887b6c3eea253d368c5ea1c370 ******/
		%feature("compactdefaultargs") SetRole;
		%feature("autodoc", "
Parameters
----------
aRole: StepBasic_PersonAndOrganizationRole

Return
-------
None

Description
-----------
No available documentation.
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
		/****** StepBasic_PersonAndOrganizationRole::StepBasic_PersonAndOrganizationRole ******/
		/****** md5 signature: d34c620bd704e7b82efd1db4ee462715 ******/
		%feature("compactdefaultargs") StepBasic_PersonAndOrganizationRole;
		%feature("autodoc", "Return
-------
None

Description
-----------
Returns a PersonAndOrganizationRole.
") StepBasic_PersonAndOrganizationRole;
		 StepBasic_PersonAndOrganizationRole();

		/****** StepBasic_PersonAndOrganizationRole::Init ******/
		/****** md5 signature: e10f4ffe4365262d2d9a5484d96325b8 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
aName: TCollection_HAsciiString

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aName);

		/****** StepBasic_PersonAndOrganizationRole::Name ******/
		/****** md5 signature: 6bcb97f17b57cae0750fd29eac20499c ******/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "Return
-------
opencascade::handle<TCollection_HAsciiString>

Description
-----------
No available documentation.
") Name;
		opencascade::handle<TCollection_HAsciiString> Name();

		/****** StepBasic_PersonAndOrganizationRole::SetName ******/
		/****** md5 signature: 1e0b00d9eb163c8a0cdbb986e2ee24f6 ******/
		%feature("compactdefaultargs") SetName;
		%feature("autodoc", "
Parameters
----------
aName: TCollection_HAsciiString

Return
-------
None

Description
-----------
No available documentation.
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
		/****** StepBasic_PersonOrganizationSelect::StepBasic_PersonOrganizationSelect ******/
		/****** md5 signature: ef4feac3084f5ede269341f9d503fae7 ******/
		%feature("compactdefaultargs") StepBasic_PersonOrganizationSelect;
		%feature("autodoc", "Return
-------
None

Description
-----------
Returns a PersonOrganizationSelect SelectType.
") StepBasic_PersonOrganizationSelect;
		 StepBasic_PersonOrganizationSelect();

		/****** StepBasic_PersonOrganizationSelect::CaseNum ******/
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
Recognizes a PersonOrganizationSelect Kind Entity that is: 1 -> Person 2 -> Organization 3 -> PersonAndOrganization 0 else.
") CaseNum;
		Standard_Integer CaseNum(const opencascade::handle<Standard_Transient> & ent);

		/****** StepBasic_PersonOrganizationSelect::Organization ******/
		/****** md5 signature: bc08f98b4bbc959f04b46794914bddbc ******/
		%feature("compactdefaultargs") Organization;
		%feature("autodoc", "Return
-------
opencascade::handle<StepBasic_Organization>

Description
-----------
returns Value as a Organization (Null if another type).
") Organization;
		opencascade::handle<StepBasic_Organization> Organization();

		/****** StepBasic_PersonOrganizationSelect::Person ******/
		/****** md5 signature: db1bca42c65d315013ded0034c6a2bd2 ******/
		%feature("compactdefaultargs") Person;
		%feature("autodoc", "Return
-------
opencascade::handle<StepBasic_Person>

Description
-----------
returns Value as a Person (Null if another type).
") Person;
		opencascade::handle<StepBasic_Person> Person();

		/****** StepBasic_PersonOrganizationSelect::PersonAndOrganization ******/
		/****** md5 signature: e5c5ce07cd61b93ed45ebeaf6fbce5f8 ******/
		%feature("compactdefaultargs") PersonAndOrganization;
		%feature("autodoc", "Return
-------
opencascade::handle<StepBasic_PersonAndOrganization>

Description
-----------
returns Value as a PersonAndOrganization (Null if another type).
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
		/****** StepBasic_Product::StepBasic_Product ******/
		/****** md5 signature: 7790fc362f2b6e308dd05e5f132357b9 ******/
		%feature("compactdefaultargs") StepBasic_Product;
		%feature("autodoc", "Return
-------
None

Description
-----------
Returns a Product.
") StepBasic_Product;
		 StepBasic_Product();

		/****** StepBasic_Product::Description ******/
		/****** md5 signature: 68309bdf9d57a000073490b39f8e7a41 ******/
		%feature("compactdefaultargs") Description;
		%feature("autodoc", "Return
-------
opencascade::handle<TCollection_HAsciiString>

Description
-----------
No available documentation.
") Description;
		opencascade::handle<TCollection_HAsciiString> Description();

		/****** StepBasic_Product::FrameOfReference ******/
		/****** md5 signature: 64961dd3939a5e6959b59f076812ec6d ******/
		%feature("compactdefaultargs") FrameOfReference;
		%feature("autodoc", "Return
-------
opencascade::handle<StepBasic_HArray1OfProductContext>

Description
-----------
No available documentation.
") FrameOfReference;
		opencascade::handle<StepBasic_HArray1OfProductContext> FrameOfReference();

		/****** StepBasic_Product::FrameOfReferenceValue ******/
		/****** md5 signature: 103a75a05d1aded825ec684fd082f3fa ******/
		%feature("compactdefaultargs") FrameOfReferenceValue;
		%feature("autodoc", "
Parameters
----------
num: int

Return
-------
opencascade::handle<StepBasic_ProductContext>

Description
-----------
No available documentation.
") FrameOfReferenceValue;
		opencascade::handle<StepBasic_ProductContext> FrameOfReferenceValue(const Standard_Integer num);

		/****** StepBasic_Product::Id ******/
		/****** md5 signature: cad437aa1c6f9043742098c562124f9e ******/
		%feature("compactdefaultargs") Id;
		%feature("autodoc", "Return
-------
opencascade::handle<TCollection_HAsciiString>

Description
-----------
No available documentation.
") Id;
		opencascade::handle<TCollection_HAsciiString> Id();

		/****** StepBasic_Product::Init ******/
		/****** md5 signature: 8a4b48b4c0d19bd9d5d62b5e2bdd1df1 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
aId: TCollection_HAsciiString
aName: TCollection_HAsciiString
aDescription: TCollection_HAsciiString
aFrameOfReference: StepBasic_HArray1OfProductContext

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aId, const opencascade::handle<TCollection_HAsciiString> & aName, const opencascade::handle<TCollection_HAsciiString> & aDescription, const opencascade::handle<StepBasic_HArray1OfProductContext> & aFrameOfReference);

		/****** StepBasic_Product::Name ******/
		/****** md5 signature: 6bcb97f17b57cae0750fd29eac20499c ******/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "Return
-------
opencascade::handle<TCollection_HAsciiString>

Description
-----------
No available documentation.
") Name;
		opencascade::handle<TCollection_HAsciiString> Name();

		/****** StepBasic_Product::NbFrameOfReference ******/
		/****** md5 signature: dabf8fc583d47eb3171cff76f427d413 ******/
		%feature("compactdefaultargs") NbFrameOfReference;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbFrameOfReference;
		Standard_Integer NbFrameOfReference();

		/****** StepBasic_Product::SetDescription ******/
		/****** md5 signature: adddd13a906718df58a2eee683a382cf ******/
		%feature("compactdefaultargs") SetDescription;
		%feature("autodoc", "
Parameters
----------
aDescription: TCollection_HAsciiString

Return
-------
None

Description
-----------
No available documentation.
") SetDescription;
		void SetDescription(const opencascade::handle<TCollection_HAsciiString> & aDescription);

		/****** StepBasic_Product::SetFrameOfReference ******/
		/****** md5 signature: bdfbb9aebfb7db53ca9c85459ccb2e14 ******/
		%feature("compactdefaultargs") SetFrameOfReference;
		%feature("autodoc", "
Parameters
----------
aFrameOfReference: StepBasic_HArray1OfProductContext

Return
-------
None

Description
-----------
No available documentation.
") SetFrameOfReference;
		void SetFrameOfReference(const opencascade::handle<StepBasic_HArray1OfProductContext> & aFrameOfReference);

		/****** StepBasic_Product::SetId ******/
		/****** md5 signature: a589ed4c1f87cc154c05276cfb60f4ea ******/
		%feature("compactdefaultargs") SetId;
		%feature("autodoc", "
Parameters
----------
aId: TCollection_HAsciiString

Return
-------
None

Description
-----------
No available documentation.
") SetId;
		void SetId(const opencascade::handle<TCollection_HAsciiString> & aId);

		/****** StepBasic_Product::SetName ******/
		/****** md5 signature: 1e0b00d9eb163c8a0cdbb986e2ee24f6 ******/
		%feature("compactdefaultargs") SetName;
		%feature("autodoc", "
Parameters
----------
aName: TCollection_HAsciiString

Return
-------
None

Description
-----------
No available documentation.
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
		/****** StepBasic_ProductCategory::StepBasic_ProductCategory ******/
		/****** md5 signature: 96dbaee693042385c8b9df767fb5fc0e ******/
		%feature("compactdefaultargs") StepBasic_ProductCategory;
		%feature("autodoc", "Return
-------
None

Description
-----------
Returns a ProductCategory.
") StepBasic_ProductCategory;
		 StepBasic_ProductCategory();

		/****** StepBasic_ProductCategory::Description ******/
		/****** md5 signature: 68309bdf9d57a000073490b39f8e7a41 ******/
		%feature("compactdefaultargs") Description;
		%feature("autodoc", "Return
-------
opencascade::handle<TCollection_HAsciiString>

Description
-----------
No available documentation.
") Description;
		opencascade::handle<TCollection_HAsciiString> Description();

		/****** StepBasic_ProductCategory::HasDescription ******/
		/****** md5 signature: 819ef9a3dced474861e1980d901a2978 ******/
		%feature("compactdefaultargs") HasDescription;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") HasDescription;
		Standard_Boolean HasDescription();

		/****** StepBasic_ProductCategory::Init ******/
		/****** md5 signature: c348b8308ac15c9a349fa924f1645a3e ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
aName: TCollection_HAsciiString
hasAdescription: bool
aDescription: TCollection_HAsciiString

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aName, const Standard_Boolean hasAdescription, const opencascade::handle<TCollection_HAsciiString> & aDescription);

		/****** StepBasic_ProductCategory::Name ******/
		/****** md5 signature: 6bcb97f17b57cae0750fd29eac20499c ******/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "Return
-------
opencascade::handle<TCollection_HAsciiString>

Description
-----------
No available documentation.
") Name;
		opencascade::handle<TCollection_HAsciiString> Name();

		/****** StepBasic_ProductCategory::SetDescription ******/
		/****** md5 signature: adddd13a906718df58a2eee683a382cf ******/
		%feature("compactdefaultargs") SetDescription;
		%feature("autodoc", "
Parameters
----------
aDescription: TCollection_HAsciiString

Return
-------
None

Description
-----------
No available documentation.
") SetDescription;
		void SetDescription(const opencascade::handle<TCollection_HAsciiString> & aDescription);

		/****** StepBasic_ProductCategory::SetName ******/
		/****** md5 signature: 1e0b00d9eb163c8a0cdbb986e2ee24f6 ******/
		%feature("compactdefaultargs") SetName;
		%feature("autodoc", "
Parameters
----------
aName: TCollection_HAsciiString

Return
-------
None

Description
-----------
No available documentation.
") SetName;
		void SetName(const opencascade::handle<TCollection_HAsciiString> & aName);

		/****** StepBasic_ProductCategory::UnSetDescription ******/
		/****** md5 signature: 30be31b794f5b69fcc1867431e79fbbe ******/
		%feature("compactdefaultargs") UnSetDescription;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
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
		/****** StepBasic_ProductCategoryRelationship::StepBasic_ProductCategoryRelationship ******/
		/****** md5 signature: 6aa4e687780eb0cdcf23ee279160e110 ******/
		%feature("compactdefaultargs") StepBasic_ProductCategoryRelationship;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") StepBasic_ProductCategoryRelationship;
		 StepBasic_ProductCategoryRelationship();

		/****** StepBasic_ProductCategoryRelationship::Category ******/
		/****** md5 signature: 465a66e97f001c673af525caec1082d0 ******/
		%feature("compactdefaultargs") Category;
		%feature("autodoc", "Return
-------
opencascade::handle<StepBasic_ProductCategory>

Description
-----------
Returns field Category.
") Category;
		opencascade::handle<StepBasic_ProductCategory> Category();

		/****** StepBasic_ProductCategoryRelationship::Description ******/
		/****** md5 signature: 68309bdf9d57a000073490b39f8e7a41 ******/
		%feature("compactdefaultargs") Description;
		%feature("autodoc", "Return
-------
opencascade::handle<TCollection_HAsciiString>

Description
-----------
Returns field Description.
") Description;
		opencascade::handle<TCollection_HAsciiString> Description();

		/****** StepBasic_ProductCategoryRelationship::HasDescription ******/
		/****** md5 signature: 819ef9a3dced474861e1980d901a2978 ******/
		%feature("compactdefaultargs") HasDescription;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if optional field Description is defined.
") HasDescription;
		Standard_Boolean HasDescription();

		/****** StepBasic_ProductCategoryRelationship::Init ******/
		/****** md5 signature: 4faae5a600277d40cd473857a4db238d ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
aName: TCollection_HAsciiString
hasDescription: bool
aDescription: TCollection_HAsciiString
aCategory: StepBasic_ProductCategory
aSubCategory: StepBasic_ProductCategory

Return
-------
None

Description
-----------
Initialize all fields (own and inherited).
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aName, const Standard_Boolean hasDescription, const opencascade::handle<TCollection_HAsciiString> & aDescription, const opencascade::handle<StepBasic_ProductCategory> & aCategory, const opencascade::handle<StepBasic_ProductCategory> & aSubCategory);

		/****** StepBasic_ProductCategoryRelationship::Name ******/
		/****** md5 signature: 6bcb97f17b57cae0750fd29eac20499c ******/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "Return
-------
opencascade::handle<TCollection_HAsciiString>

Description
-----------
Returns field Name.
") Name;
		opencascade::handle<TCollection_HAsciiString> Name();

		/****** StepBasic_ProductCategoryRelationship::SetCategory ******/
		/****** md5 signature: 8036ec11e12da20fd64c27bc842cac9c ******/
		%feature("compactdefaultargs") SetCategory;
		%feature("autodoc", "
Parameters
----------
Category: StepBasic_ProductCategory

Return
-------
None

Description
-----------
Set field Category.
") SetCategory;
		void SetCategory(const opencascade::handle<StepBasic_ProductCategory> & Category);

		/****** StepBasic_ProductCategoryRelationship::SetDescription ******/
		/****** md5 signature: 11ff45bab13c9c85c44619d6c4501da8 ******/
		%feature("compactdefaultargs") SetDescription;
		%feature("autodoc", "
Parameters
----------
Description: TCollection_HAsciiString

Return
-------
None

Description
-----------
Set field Description.
") SetDescription;
		void SetDescription(const opencascade::handle<TCollection_HAsciiString> & Description);

		/****** StepBasic_ProductCategoryRelationship::SetName ******/
		/****** md5 signature: 1a85c1f4dd446039f14efe98df7aeb03 ******/
		%feature("compactdefaultargs") SetName;
		%feature("autodoc", "
Parameters
----------
Name: TCollection_HAsciiString

Return
-------
None

Description
-----------
Set field Name.
") SetName;
		void SetName(const opencascade::handle<TCollection_HAsciiString> & Name);

		/****** StepBasic_ProductCategoryRelationship::SetSubCategory ******/
		/****** md5 signature: 0f4ce02f210be3dbdb5c8dd62c606f47 ******/
		%feature("compactdefaultargs") SetSubCategory;
		%feature("autodoc", "
Parameters
----------
SubCategory: StepBasic_ProductCategory

Return
-------
None

Description
-----------
Set field SubCategory.
") SetSubCategory;
		void SetSubCategory(const opencascade::handle<StepBasic_ProductCategory> & SubCategory);

		/****** StepBasic_ProductCategoryRelationship::SubCategory ******/
		/****** md5 signature: 2e38041dbe05070da406b4ca77574310 ******/
		%feature("compactdefaultargs") SubCategory;
		%feature("autodoc", "Return
-------
opencascade::handle<StepBasic_ProductCategory>

Description
-----------
Returns field SubCategory.
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
		/****** StepBasic_ProductDefinition::StepBasic_ProductDefinition ******/
		/****** md5 signature: cb2da8f625d43b1e5c9026e6e79dc921 ******/
		%feature("compactdefaultargs") StepBasic_ProductDefinition;
		%feature("autodoc", "Return
-------
None

Description
-----------
Returns a ProductDefinition.
") StepBasic_ProductDefinition;
		 StepBasic_ProductDefinition();

		/****** StepBasic_ProductDefinition::Description ******/
		/****** md5 signature: 68309bdf9d57a000073490b39f8e7a41 ******/
		%feature("compactdefaultargs") Description;
		%feature("autodoc", "Return
-------
opencascade::handle<TCollection_HAsciiString>

Description
-----------
No available documentation.
") Description;
		opencascade::handle<TCollection_HAsciiString> Description();

		/****** StepBasic_ProductDefinition::Formation ******/
		/****** md5 signature: 94f885c6852d3b82159f586de46ddf88 ******/
		%feature("compactdefaultargs") Formation;
		%feature("autodoc", "Return
-------
opencascade::handle<StepBasic_ProductDefinitionFormation>

Description
-----------
No available documentation.
") Formation;
		opencascade::handle<StepBasic_ProductDefinitionFormation> Formation();

		/****** StepBasic_ProductDefinition::FrameOfReference ******/
		/****** md5 signature: e33148ea458cbc49744eebf19ce1015f ******/
		%feature("compactdefaultargs") FrameOfReference;
		%feature("autodoc", "Return
-------
opencascade::handle<StepBasic_ProductDefinitionContext>

Description
-----------
No available documentation.
") FrameOfReference;
		opencascade::handle<StepBasic_ProductDefinitionContext> FrameOfReference();

		/****** StepBasic_ProductDefinition::Id ******/
		/****** md5 signature: cad437aa1c6f9043742098c562124f9e ******/
		%feature("compactdefaultargs") Id;
		%feature("autodoc", "Return
-------
opencascade::handle<TCollection_HAsciiString>

Description
-----------
No available documentation.
") Id;
		opencascade::handle<TCollection_HAsciiString> Id();

		/****** StepBasic_ProductDefinition::Init ******/
		/****** md5 signature: 3402ab860a6def56b63102d13c67a93b ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
aId: TCollection_HAsciiString
aDescription: TCollection_HAsciiString
aFormation: StepBasic_ProductDefinitionFormation
aFrameOfReference: StepBasic_ProductDefinitionContext

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aId, const opencascade::handle<TCollection_HAsciiString> & aDescription, const opencascade::handle<StepBasic_ProductDefinitionFormation> & aFormation, const opencascade::handle<StepBasic_ProductDefinitionContext> & aFrameOfReference);

		/****** StepBasic_ProductDefinition::SetDescription ******/
		/****** md5 signature: adddd13a906718df58a2eee683a382cf ******/
		%feature("compactdefaultargs") SetDescription;
		%feature("autodoc", "
Parameters
----------
aDescription: TCollection_HAsciiString

Return
-------
None

Description
-----------
No available documentation.
") SetDescription;
		void SetDescription(const opencascade::handle<TCollection_HAsciiString> & aDescription);

		/****** StepBasic_ProductDefinition::SetFormation ******/
		/****** md5 signature: 457246bc8801521565fcf1a1e2880677 ******/
		%feature("compactdefaultargs") SetFormation;
		%feature("autodoc", "
Parameters
----------
aFormation: StepBasic_ProductDefinitionFormation

Return
-------
None

Description
-----------
No available documentation.
") SetFormation;
		void SetFormation(const opencascade::handle<StepBasic_ProductDefinitionFormation> & aFormation);

		/****** StepBasic_ProductDefinition::SetFrameOfReference ******/
		/****** md5 signature: 54e026fc02295c057acc6024c7f98e33 ******/
		%feature("compactdefaultargs") SetFrameOfReference;
		%feature("autodoc", "
Parameters
----------
aFrameOfReference: StepBasic_ProductDefinitionContext

Return
-------
None

Description
-----------
No available documentation.
") SetFrameOfReference;
		void SetFrameOfReference(const opencascade::handle<StepBasic_ProductDefinitionContext> & aFrameOfReference);

		/****** StepBasic_ProductDefinition::SetId ******/
		/****** md5 signature: a589ed4c1f87cc154c05276cfb60f4ea ******/
		%feature("compactdefaultargs") SetId;
		%feature("autodoc", "
Parameters
----------
aId: TCollection_HAsciiString

Return
-------
None

Description
-----------
No available documentation.
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
		/****** StepBasic_ProductDefinitionFormation::StepBasic_ProductDefinitionFormation ******/
		/****** md5 signature: bd5b521d38080a89f7f6c7451cb65b41 ******/
		%feature("compactdefaultargs") StepBasic_ProductDefinitionFormation;
		%feature("autodoc", "Return
-------
None

Description
-----------
Returns a ProductDefinitionFormation.
") StepBasic_ProductDefinitionFormation;
		 StepBasic_ProductDefinitionFormation();

		/****** StepBasic_ProductDefinitionFormation::Description ******/
		/****** md5 signature: 68309bdf9d57a000073490b39f8e7a41 ******/
		%feature("compactdefaultargs") Description;
		%feature("autodoc", "Return
-------
opencascade::handle<TCollection_HAsciiString>

Description
-----------
No available documentation.
") Description;
		opencascade::handle<TCollection_HAsciiString> Description();

		/****** StepBasic_ProductDefinitionFormation::Id ******/
		/****** md5 signature: cad437aa1c6f9043742098c562124f9e ******/
		%feature("compactdefaultargs") Id;
		%feature("autodoc", "Return
-------
opencascade::handle<TCollection_HAsciiString>

Description
-----------
No available documentation.
") Id;
		opencascade::handle<TCollection_HAsciiString> Id();

		/****** StepBasic_ProductDefinitionFormation::Init ******/
		/****** md5 signature: 024816d46e92b16686e0d62b621622e1 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
aId: TCollection_HAsciiString
aDescription: TCollection_HAsciiString
aOfProduct: StepBasic_Product

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aId, const opencascade::handle<TCollection_HAsciiString> & aDescription, const opencascade::handle<StepBasic_Product> & aOfProduct);

		/****** StepBasic_ProductDefinitionFormation::OfProduct ******/
		/****** md5 signature: 143e2db0361fa210057cbd055215da57 ******/
		%feature("compactdefaultargs") OfProduct;
		%feature("autodoc", "Return
-------
opencascade::handle<StepBasic_Product>

Description
-----------
No available documentation.
") OfProduct;
		opencascade::handle<StepBasic_Product> OfProduct();

		/****** StepBasic_ProductDefinitionFormation::SetDescription ******/
		/****** md5 signature: adddd13a906718df58a2eee683a382cf ******/
		%feature("compactdefaultargs") SetDescription;
		%feature("autodoc", "
Parameters
----------
aDescription: TCollection_HAsciiString

Return
-------
None

Description
-----------
No available documentation.
") SetDescription;
		void SetDescription(const opencascade::handle<TCollection_HAsciiString> & aDescription);

		/****** StepBasic_ProductDefinitionFormation::SetId ******/
		/****** md5 signature: a589ed4c1f87cc154c05276cfb60f4ea ******/
		%feature("compactdefaultargs") SetId;
		%feature("autodoc", "
Parameters
----------
aId: TCollection_HAsciiString

Return
-------
None

Description
-----------
No available documentation.
") SetId;
		void SetId(const opencascade::handle<TCollection_HAsciiString> & aId);

		/****** StepBasic_ProductDefinitionFormation::SetOfProduct ******/
		/****** md5 signature: 849d83e9a503dc13933bfd88a0a3f81f ******/
		%feature("compactdefaultargs") SetOfProduct;
		%feature("autodoc", "
Parameters
----------
aOfProduct: StepBasic_Product

Return
-------
None

Description
-----------
No available documentation.
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
		/****** StepBasic_ProductDefinitionFormationRelationship::StepBasic_ProductDefinitionFormationRelationship ******/
		/****** md5 signature: 5f8609c5dae46c8aac6844a71e58de5e ******/
		%feature("compactdefaultargs") StepBasic_ProductDefinitionFormationRelationship;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") StepBasic_ProductDefinitionFormationRelationship;
		 StepBasic_ProductDefinitionFormationRelationship();

		/****** StepBasic_ProductDefinitionFormationRelationship::Description ******/
		/****** md5 signature: 68309bdf9d57a000073490b39f8e7a41 ******/
		%feature("compactdefaultargs") Description;
		%feature("autodoc", "Return
-------
opencascade::handle<TCollection_HAsciiString>

Description
-----------
Returns field Description.
") Description;
		opencascade::handle<TCollection_HAsciiString> Description();

		/****** StepBasic_ProductDefinitionFormationRelationship::Id ******/
		/****** md5 signature: cad437aa1c6f9043742098c562124f9e ******/
		%feature("compactdefaultargs") Id;
		%feature("autodoc", "Return
-------
opencascade::handle<TCollection_HAsciiString>

Description
-----------
Returns field Id.
") Id;
		opencascade::handle<TCollection_HAsciiString> Id();

		/****** StepBasic_ProductDefinitionFormationRelationship::Init ******/
		/****** md5 signature: ee8441cd060422d5ca65efa5e9cd41da ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
aId: TCollection_HAsciiString
aName: TCollection_HAsciiString
aDescription: TCollection_HAsciiString
aRelatingProductDefinitionFormation: StepBasic_ProductDefinitionFormation
aRelatedProductDefinitionFormation: StepBasic_ProductDefinitionFormation

Return
-------
None

Description
-----------
Initialize all fields (own and inherited).
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aId, const opencascade::handle<TCollection_HAsciiString> & aName, const opencascade::handle<TCollection_HAsciiString> & aDescription, const opencascade::handle<StepBasic_ProductDefinitionFormation> & aRelatingProductDefinitionFormation, const opencascade::handle<StepBasic_ProductDefinitionFormation> & aRelatedProductDefinitionFormation);

		/****** StepBasic_ProductDefinitionFormationRelationship::Name ******/
		/****** md5 signature: 6bcb97f17b57cae0750fd29eac20499c ******/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "Return
-------
opencascade::handle<TCollection_HAsciiString>

Description
-----------
Returns field Name.
") Name;
		opencascade::handle<TCollection_HAsciiString> Name();

		/****** StepBasic_ProductDefinitionFormationRelationship::RelatedProductDefinitionFormation ******/
		/****** md5 signature: 5a83e0ab8bf222bff69aecf2f6bb7dc7 ******/
		%feature("compactdefaultargs") RelatedProductDefinitionFormation;
		%feature("autodoc", "Return
-------
opencascade::handle<StepBasic_ProductDefinitionFormation>

Description
-----------
Returns field RelatedProductDefinitionFormation.
") RelatedProductDefinitionFormation;
		opencascade::handle<StepBasic_ProductDefinitionFormation> RelatedProductDefinitionFormation();

		/****** StepBasic_ProductDefinitionFormationRelationship::RelatingProductDefinitionFormation ******/
		/****** md5 signature: fd41fb35afff5e59ba9d9e80b1be7b8b ******/
		%feature("compactdefaultargs") RelatingProductDefinitionFormation;
		%feature("autodoc", "Return
-------
opencascade::handle<StepBasic_ProductDefinitionFormation>

Description
-----------
Returns field RelatingProductDefinitionFormation.
") RelatingProductDefinitionFormation;
		opencascade::handle<StepBasic_ProductDefinitionFormation> RelatingProductDefinitionFormation();

		/****** StepBasic_ProductDefinitionFormationRelationship::SetDescription ******/
		/****** md5 signature: 11ff45bab13c9c85c44619d6c4501da8 ******/
		%feature("compactdefaultargs") SetDescription;
		%feature("autodoc", "
Parameters
----------
Description: TCollection_HAsciiString

Return
-------
None

Description
-----------
Set field Description.
") SetDescription;
		void SetDescription(const opencascade::handle<TCollection_HAsciiString> & Description);

		/****** StepBasic_ProductDefinitionFormationRelationship::SetId ******/
		/****** md5 signature: 779c5dce2dcbd218d648cf0dfb829a83 ******/
		%feature("compactdefaultargs") SetId;
		%feature("autodoc", "
Parameters
----------
Id: TCollection_HAsciiString

Return
-------
None

Description
-----------
Set field Id.
") SetId;
		void SetId(const opencascade::handle<TCollection_HAsciiString> & Id);

		/****** StepBasic_ProductDefinitionFormationRelationship::SetName ******/
		/****** md5 signature: 1a85c1f4dd446039f14efe98df7aeb03 ******/
		%feature("compactdefaultargs") SetName;
		%feature("autodoc", "
Parameters
----------
Name: TCollection_HAsciiString

Return
-------
None

Description
-----------
Set field Name.
") SetName;
		void SetName(const opencascade::handle<TCollection_HAsciiString> & Name);

		/****** StepBasic_ProductDefinitionFormationRelationship::SetRelatedProductDefinitionFormation ******/
		/****** md5 signature: ab61ba0bd318edec5e886647b21c4f43 ******/
		%feature("compactdefaultargs") SetRelatedProductDefinitionFormation;
		%feature("autodoc", "
Parameters
----------
RelatedProductDefinitionFormation: StepBasic_ProductDefinitionFormation

Return
-------
None

Description
-----------
Set field RelatedProductDefinitionFormation.
") SetRelatedProductDefinitionFormation;
		void SetRelatedProductDefinitionFormation(const opencascade::handle<StepBasic_ProductDefinitionFormation> & RelatedProductDefinitionFormation);

		/****** StepBasic_ProductDefinitionFormationRelationship::SetRelatingProductDefinitionFormation ******/
		/****** md5 signature: 73adc113315a81e15ac03ae9b76fb9d6 ******/
		%feature("compactdefaultargs") SetRelatingProductDefinitionFormation;
		%feature("autodoc", "
Parameters
----------
RelatingProductDefinitionFormation: StepBasic_ProductDefinitionFormation

Return
-------
None

Description
-----------
Set field RelatingProductDefinitionFormation.
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
		/****** StepBasic_ProductDefinitionOrReference::StepBasic_ProductDefinitionOrReference ******/
		/****** md5 signature: 581d009558c1e3bfcf805c9cf55635de ******/
		%feature("compactdefaultargs") StepBasic_ProductDefinitionOrReference;
		%feature("autodoc", "Return
-------
None

Description
-----------
Returns a ProductDefinitionOrReference SelectType.
") StepBasic_ProductDefinitionOrReference;
		 StepBasic_ProductDefinitionOrReference();

		/****** StepBasic_ProductDefinitionOrReference::CaseNum ******/
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
Recognizes a ProductDefinitionOrReference Kind Entity that is: 1 -> ProductDefinition 2 -> ProductDefinitionReference 3 -> ProductDefinitionReferenceWithLocalPresentation 0 else.
") CaseNum;
		Standard_Integer CaseNum(const opencascade::handle<Standard_Transient> & ent);

		/****** StepBasic_ProductDefinitionOrReference::ProductDefinition ******/
		/****** md5 signature: d43b5ca42d8380c05af7f64fb041e89b ******/
		%feature("compactdefaultargs") ProductDefinition;
		%feature("autodoc", "Return
-------
opencascade::handle<StepBasic_ProductDefinition>

Description
-----------
returns Value as a ProductDefinition (Null if another type).
") ProductDefinition;
		opencascade::handle<StepBasic_ProductDefinition> ProductDefinition();

		/****** StepBasic_ProductDefinitionOrReference::ProductDefinitionReference ******/
		/****** md5 signature: e0743e05c274f7f166efee9beb39073b ******/
		%feature("compactdefaultargs") ProductDefinitionReference;
		%feature("autodoc", "Return
-------
opencascade::handle<StepBasic_ProductDefinitionReference>

Description
-----------
returns Value as a ProductDefinitionReference (Null if another type).
") ProductDefinitionReference;
		opencascade::handle<StepBasic_ProductDefinitionReference> ProductDefinitionReference();

		/****** StepBasic_ProductDefinitionOrReference::ProductDefinitionReferenceWithLocalRepresentation ******/
		/****** md5 signature: 35937fd7fc1ca9917772ae01add65741 ******/
		%feature("compactdefaultargs") ProductDefinitionReferenceWithLocalRepresentation;
		%feature("autodoc", "Return
-------
opencascade::handle<StepBasic_ProductDefinitionReferenceWithLocalRepresentation>

Description
-----------
returns Value as a ProductDefinitionReferenceWithLocalRepresentation (Null if another type).
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
		/****** StepBasic_ProductDefinitionReference::StepBasic_ProductDefinitionReference ******/
		/****** md5 signature: ad970a267707023c0ac5719c2701ab74 ******/
		%feature("compactdefaultargs") StepBasic_ProductDefinitionReference;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") StepBasic_ProductDefinitionReference;
		 StepBasic_ProductDefinitionReference();

		/****** StepBasic_ProductDefinitionReference::HasIdOwningOrganizationName ******/
		/****** md5 signature: 66e52c77178fafbc4ad4e8a0bab1804c ******/
		%feature("compactdefaultargs") HasIdOwningOrganizationName;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if IdOwningOrganizationName exists.
") HasIdOwningOrganizationName;
		Standard_Boolean HasIdOwningOrganizationName();

		/****** StepBasic_ProductDefinitionReference::IdOwningOrganizationName ******/
		/****** md5 signature: 7e5eed935bf1490b517cfdc2f860bc54 ******/
		%feature("compactdefaultargs") IdOwningOrganizationName;
		%feature("autodoc", "Return
-------
opencascade::handle<TCollection_HAsciiString>

Description
-----------
Returns field IdOwningOrganizationName.
") IdOwningOrganizationName;
		opencascade::handle<TCollection_HAsciiString> IdOwningOrganizationName();

		/****** StepBasic_ProductDefinitionReference::Init ******/
		/****** md5 signature: b95d2fa73196c76c045f2228228e7b28 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
theSource: StepBasic_ExternalSource
theProductId: TCollection_HAsciiString
theProductDefinitionFormationId: TCollection_HAsciiString
theProductDefinitionId: TCollection_HAsciiString
theIdOwningOrganizationName: TCollection_HAsciiString

Return
-------
None

Description
-----------
Initialize all fields (own and inherited).
") Init;
		void Init(const opencascade::handle<StepBasic_ExternalSource> & theSource, const opencascade::handle<TCollection_HAsciiString> & theProductId, const opencascade::handle<TCollection_HAsciiString> & theProductDefinitionFormationId, const opencascade::handle<TCollection_HAsciiString> & theProductDefinitionId, const opencascade::handle<TCollection_HAsciiString> & theIdOwningOrganizationName);

		/****** StepBasic_ProductDefinitionReference::Init ******/
		/****** md5 signature: 3b1781b5d320eb5b31b95f959456dba0 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
theSource: StepBasic_ExternalSource
theProductId: TCollection_HAsciiString
theProductDefinitionFormationId: TCollection_HAsciiString
theProductDefinitionId: TCollection_HAsciiString

Return
-------
None

Description
-----------
Initialize all fields (own and inherited).
") Init;
		void Init(const opencascade::handle<StepBasic_ExternalSource> & theSource, const opencascade::handle<TCollection_HAsciiString> & theProductId, const opencascade::handle<TCollection_HAsciiString> & theProductDefinitionFormationId, const opencascade::handle<TCollection_HAsciiString> & theProductDefinitionId);

		/****** StepBasic_ProductDefinitionReference::ProductDefinitionFormationId ******/
		/****** md5 signature: 4cec926d9143b0fc7d32bdfc5cc93b08 ******/
		%feature("compactdefaultargs") ProductDefinitionFormationId;
		%feature("autodoc", "Return
-------
opencascade::handle<TCollection_HAsciiString>

Description
-----------
Returns field ProductDefinitionFormationId.
") ProductDefinitionFormationId;
		opencascade::handle<TCollection_HAsciiString> ProductDefinitionFormationId();

		/****** StepBasic_ProductDefinitionReference::ProductDefinitionId ******/
		/****** md5 signature: e39c99c51b8f0bec44e4fa68def36a90 ******/
		%feature("compactdefaultargs") ProductDefinitionId;
		%feature("autodoc", "Return
-------
opencascade::handle<TCollection_HAsciiString>

Description
-----------
Returns field ProductDefinitionId.
") ProductDefinitionId;
		opencascade::handle<TCollection_HAsciiString> ProductDefinitionId();

		/****** StepBasic_ProductDefinitionReference::ProductId ******/
		/****** md5 signature: d3be9527e4aa640af7c2ba08ce58e447 ******/
		%feature("compactdefaultargs") ProductId;
		%feature("autodoc", "Return
-------
opencascade::handle<TCollection_HAsciiString>

Description
-----------
Returns field ProductId.
") ProductId;
		opencascade::handle<TCollection_HAsciiString> ProductId();

		/****** StepBasic_ProductDefinitionReference::SetIdOwningOrganizationName ******/
		/****** md5 signature: 00dd78746fa0d552d70d20fe18510c84 ******/
		%feature("compactdefaultargs") SetIdOwningOrganizationName;
		%feature("autodoc", "
Parameters
----------
theIdOwningOrganizationName: TCollection_HAsciiString

Return
-------
None

Description
-----------
Set field IdOwningOrganizationName.
") SetIdOwningOrganizationName;
		void SetIdOwningOrganizationName(const opencascade::handle<TCollection_HAsciiString> & theIdOwningOrganizationName);

		/****** StepBasic_ProductDefinitionReference::SetProductDefinitionFormationId ******/
		/****** md5 signature: 92c57e8626d615970d4e29ca7f01c5cc ******/
		%feature("compactdefaultargs") SetProductDefinitionFormationId;
		%feature("autodoc", "
Parameters
----------
theProductDefinitionFormationId: TCollection_HAsciiString

Return
-------
None

Description
-----------
Set field ProductDefinitionFormationId.
") SetProductDefinitionFormationId;
		void SetProductDefinitionFormationId(const opencascade::handle<TCollection_HAsciiString> & theProductDefinitionFormationId);

		/****** StepBasic_ProductDefinitionReference::SetProductDefinitionId ******/
		/****** md5 signature: 5b2545a2f62b554ed4d4ea8ab66bd364 ******/
		%feature("compactdefaultargs") SetProductDefinitionId;
		%feature("autodoc", "
Parameters
----------
theProductDefinitionId: TCollection_HAsciiString

Return
-------
None

Description
-----------
Set field ProductDefinitionId.
") SetProductDefinitionId;
		void SetProductDefinitionId(const opencascade::handle<TCollection_HAsciiString> & theProductDefinitionId);

		/****** StepBasic_ProductDefinitionReference::SetProductId ******/
		/****** md5 signature: bbe3a7a51f9a4b33100ae1bc672365c6 ******/
		%feature("compactdefaultargs") SetProductId;
		%feature("autodoc", "
Parameters
----------
theProductId: TCollection_HAsciiString

Return
-------
None

Description
-----------
Set field ProductId.
") SetProductId;
		void SetProductId(const opencascade::handle<TCollection_HAsciiString> & theProductId);

		/****** StepBasic_ProductDefinitionReference::SetSource ******/
		/****** md5 signature: d656e905f131b35a69061b2a857e75e0 ******/
		%feature("compactdefaultargs") SetSource;
		%feature("autodoc", "
Parameters
----------
theSource: StepBasic_ExternalSource

Return
-------
None

Description
-----------
Set field Source.
") SetSource;
		void SetSource(const opencascade::handle<StepBasic_ExternalSource> & theSource);

		/****** StepBasic_ProductDefinitionReference::Source ******/
		/****** md5 signature: a13a47fce462914f8ac90f867f0370c7 ******/
		%feature("compactdefaultargs") Source;
		%feature("autodoc", "Return
-------
opencascade::handle<StepBasic_ExternalSource>

Description
-----------
Returns field Source.
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
		/****** StepBasic_ProductDefinitionRelationship::StepBasic_ProductDefinitionRelationship ******/
		/****** md5 signature: cdbbeb999b5187dd5a45f8cf19bd2c44 ******/
		%feature("compactdefaultargs") StepBasic_ProductDefinitionRelationship;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") StepBasic_ProductDefinitionRelationship;
		 StepBasic_ProductDefinitionRelationship();

		/****** StepBasic_ProductDefinitionRelationship::Description ******/
		/****** md5 signature: 68309bdf9d57a000073490b39f8e7a41 ******/
		%feature("compactdefaultargs") Description;
		%feature("autodoc", "Return
-------
opencascade::handle<TCollection_HAsciiString>

Description
-----------
Returns field Description.
") Description;
		opencascade::handle<TCollection_HAsciiString> Description();

		/****** StepBasic_ProductDefinitionRelationship::HasDescription ******/
		/****** md5 signature: 819ef9a3dced474861e1980d901a2978 ******/
		%feature("compactdefaultargs") HasDescription;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if optional field Description is defined.
") HasDescription;
		Standard_Boolean HasDescription();

		/****** StepBasic_ProductDefinitionRelationship::Id ******/
		/****** md5 signature: cad437aa1c6f9043742098c562124f9e ******/
		%feature("compactdefaultargs") Id;
		%feature("autodoc", "Return
-------
opencascade::handle<TCollection_HAsciiString>

Description
-----------
Returns field Id.
") Id;
		opencascade::handle<TCollection_HAsciiString> Id();

		/****** StepBasic_ProductDefinitionRelationship::Init ******/
		/****** md5 signature: 48f236f89e0f9f1b7e60c4a445879fb8 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
aId: TCollection_HAsciiString
aName: TCollection_HAsciiString
hasDescription: bool
aDescription: TCollection_HAsciiString
aRelatingProductDefinition: StepBasic_ProductDefinition
aRelatedProductDefinition: StepBasic_ProductDefinition

Return
-------
None

Description
-----------
Initialize all fields (own and inherited).
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aId, const opencascade::handle<TCollection_HAsciiString> & aName, const Standard_Boolean hasDescription, const opencascade::handle<TCollection_HAsciiString> & aDescription, const opencascade::handle<StepBasic_ProductDefinition> & aRelatingProductDefinition, const opencascade::handle<StepBasic_ProductDefinition> & aRelatedProductDefinition);

		/****** StepBasic_ProductDefinitionRelationship::Init ******/
		/****** md5 signature: 2db6e2142f3da60ff4ac94ddb7fa12d1 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
aId: TCollection_HAsciiString
aName: TCollection_HAsciiString
hasDescription: bool
aDescription: TCollection_HAsciiString
aRelatingProductDefinition: StepBasic_ProductDefinitionOrReference
aRelatedProductDefinition: StepBasic_ProductDefinitionOrReference

Return
-------
None

Description
-----------
Initialize all fields (own and inherited).
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aId, const opencascade::handle<TCollection_HAsciiString> & aName, const Standard_Boolean hasDescription, const opencascade::handle<TCollection_HAsciiString> & aDescription, const StepBasic_ProductDefinitionOrReference & aRelatingProductDefinition, const StepBasic_ProductDefinitionOrReference & aRelatedProductDefinition);

		/****** StepBasic_ProductDefinitionRelationship::Name ******/
		/****** md5 signature: 6bcb97f17b57cae0750fd29eac20499c ******/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "Return
-------
opencascade::handle<TCollection_HAsciiString>

Description
-----------
Returns field Name.
") Name;
		opencascade::handle<TCollection_HAsciiString> Name();

		/****** StepBasic_ProductDefinitionRelationship::RelatedProductDefinition ******/
		/****** md5 signature: a7ab77a49160b81991d1bf914d11090c ******/
		%feature("compactdefaultargs") RelatedProductDefinition;
		%feature("autodoc", "Return
-------
opencascade::handle<StepBasic_ProductDefinition>

Description
-----------
Returns field RelatedProductDefinition.
") RelatedProductDefinition;
		opencascade::handle<StepBasic_ProductDefinition> RelatedProductDefinition();

		/****** StepBasic_ProductDefinitionRelationship::RelatedProductDefinitionAP242 ******/
		/****** md5 signature: a327752031849aab6cca65e27a4a89dc ******/
		%feature("compactdefaultargs") RelatedProductDefinitionAP242;
		%feature("autodoc", "Return
-------
StepBasic_ProductDefinitionOrReference

Description
-----------
Returns field RelatedProductDefinition in AP242.
") RelatedProductDefinitionAP242;
		StepBasic_ProductDefinitionOrReference RelatedProductDefinitionAP242();

		/****** StepBasic_ProductDefinitionRelationship::RelatingProductDefinition ******/
		/****** md5 signature: 7fcfccb1097faf74a4b0facb72a403ea ******/
		%feature("compactdefaultargs") RelatingProductDefinition;
		%feature("autodoc", "Return
-------
opencascade::handle<StepBasic_ProductDefinition>

Description
-----------
Returns field RelatingProductDefinition.
") RelatingProductDefinition;
		opencascade::handle<StepBasic_ProductDefinition> RelatingProductDefinition();

		/****** StepBasic_ProductDefinitionRelationship::RelatingProductDefinitionAP242 ******/
		/****** md5 signature: 054c4652f0a09168780ec93d2f2443b9 ******/
		%feature("compactdefaultargs") RelatingProductDefinitionAP242;
		%feature("autodoc", "Return
-------
StepBasic_ProductDefinitionOrReference

Description
-----------
Returns field RelatingProductDefinition in AP242.
") RelatingProductDefinitionAP242;
		StepBasic_ProductDefinitionOrReference RelatingProductDefinitionAP242();

		/****** StepBasic_ProductDefinitionRelationship::SetDescription ******/
		/****** md5 signature: 11ff45bab13c9c85c44619d6c4501da8 ******/
		%feature("compactdefaultargs") SetDescription;
		%feature("autodoc", "
Parameters
----------
Description: TCollection_HAsciiString

Return
-------
None

Description
-----------
Set field Description.
") SetDescription;
		void SetDescription(const opencascade::handle<TCollection_HAsciiString> & Description);

		/****** StepBasic_ProductDefinitionRelationship::SetId ******/
		/****** md5 signature: 779c5dce2dcbd218d648cf0dfb829a83 ******/
		%feature("compactdefaultargs") SetId;
		%feature("autodoc", "
Parameters
----------
Id: TCollection_HAsciiString

Return
-------
None

Description
-----------
Set field Id.
") SetId;
		void SetId(const opencascade::handle<TCollection_HAsciiString> & Id);

		/****** StepBasic_ProductDefinitionRelationship::SetName ******/
		/****** md5 signature: 1a85c1f4dd446039f14efe98df7aeb03 ******/
		%feature("compactdefaultargs") SetName;
		%feature("autodoc", "
Parameters
----------
Name: TCollection_HAsciiString

Return
-------
None

Description
-----------
Set field Name.
") SetName;
		void SetName(const opencascade::handle<TCollection_HAsciiString> & Name);

		/****** StepBasic_ProductDefinitionRelationship::SetRelatedProductDefinition ******/
		/****** md5 signature: 938136c489259690ec4e83451f0de3ee ******/
		%feature("compactdefaultargs") SetRelatedProductDefinition;
		%feature("autodoc", "
Parameters
----------
RelatedProductDefinition: StepBasic_ProductDefinition

Return
-------
None

Description
-----------
Set field RelatedProductDefinition.
") SetRelatedProductDefinition;
		void SetRelatedProductDefinition(const opencascade::handle<StepBasic_ProductDefinition> & RelatedProductDefinition);

		/****** StepBasic_ProductDefinitionRelationship::SetRelatedProductDefinition ******/
		/****** md5 signature: 1e4b08b531a6bc9ef6eb61c7c4963655 ******/
		%feature("compactdefaultargs") SetRelatedProductDefinition;
		%feature("autodoc", "
Parameters
----------
RelatedProductDefinition: StepBasic_ProductDefinitionOrReference

Return
-------
None

Description
-----------
Set field RelatedProductDefinition in AP242.
") SetRelatedProductDefinition;
		void SetRelatedProductDefinition(const StepBasic_ProductDefinitionOrReference & RelatedProductDefinition);

		/****** StepBasic_ProductDefinitionRelationship::SetRelatingProductDefinition ******/
		/****** md5 signature: 359affd56caf20b07f2d71b1bbdf3177 ******/
		%feature("compactdefaultargs") SetRelatingProductDefinition;
		%feature("autodoc", "
Parameters
----------
RelatingProductDefinition: StepBasic_ProductDefinition

Return
-------
None

Description
-----------
Set field RelatingProductDefinition.
") SetRelatingProductDefinition;
		void SetRelatingProductDefinition(const opencascade::handle<StepBasic_ProductDefinition> & RelatingProductDefinition);

		/****** StepBasic_ProductDefinitionRelationship::SetRelatingProductDefinition ******/
		/****** md5 signature: 91d7faf8cb692c0d2ce8aa698258ea04 ******/
		%feature("compactdefaultargs") SetRelatingProductDefinition;
		%feature("autodoc", "
Parameters
----------
RelatingProductDefinition: StepBasic_ProductDefinitionOrReference

Return
-------
None

Description
-----------
Set field RelatingProductDefinition in AP242.
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
		/****** StepBasic_ProductOrFormationOrDefinition::StepBasic_ProductOrFormationOrDefinition ******/
		/****** md5 signature: 18c0f3da5115e635a4c7f980ca4013b4 ******/
		%feature("compactdefaultargs") StepBasic_ProductOrFormationOrDefinition;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") StepBasic_ProductOrFormationOrDefinition;
		 StepBasic_ProductOrFormationOrDefinition();

		/****** StepBasic_ProductOrFormationOrDefinition::CaseNum ******/
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
Recognizes a kind of ProductOrFormationOrDefinition select type 1 -> Product from StepBasic 2 -> ProductDefinitionFormation from StepBasic 3 -> ProductDefinition from StepBasic 0 else.
") CaseNum;
		Standard_Integer CaseNum(const opencascade::handle<Standard_Transient> & ent);

		/****** StepBasic_ProductOrFormationOrDefinition::Product ******/
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

		/****** StepBasic_ProductOrFormationOrDefinition::ProductDefinition ******/
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

		/****** StepBasic_ProductOrFormationOrDefinition::ProductDefinitionFormation ******/
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
		/****** StepBasic_RoleAssociation::StepBasic_RoleAssociation ******/
		/****** md5 signature: c2fadb8653f6047d62a3702a02b47adb ******/
		%feature("compactdefaultargs") StepBasic_RoleAssociation;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") StepBasic_RoleAssociation;
		 StepBasic_RoleAssociation();

		/****** StepBasic_RoleAssociation::Init ******/
		/****** md5 signature: 446522e66562d956791603bb249d1349 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
aRole: StepBasic_ObjectRole
aItemWithRole: StepBasic_RoleSelect

Return
-------
None

Description
-----------
Initialize all fields (own and inherited).
") Init;
		void Init(const opencascade::handle<StepBasic_ObjectRole> & aRole, const StepBasic_RoleSelect & aItemWithRole);

		/****** StepBasic_RoleAssociation::ItemWithRole ******/
		/****** md5 signature: 5eb119ca3cd46ce8bb2f7e9ae533564f ******/
		%feature("compactdefaultargs") ItemWithRole;
		%feature("autodoc", "Return
-------
StepBasic_RoleSelect

Description
-----------
Returns field ItemWithRole.
") ItemWithRole;
		StepBasic_RoleSelect ItemWithRole();

		/****** StepBasic_RoleAssociation::Role ******/
		/****** md5 signature: a05332a66176fbfdad74249aa95775ca ******/
		%feature("compactdefaultargs") Role;
		%feature("autodoc", "Return
-------
opencascade::handle<StepBasic_ObjectRole>

Description
-----------
Returns field Role.
") Role;
		opencascade::handle<StepBasic_ObjectRole> Role();

		/****** StepBasic_RoleAssociation::SetItemWithRole ******/
		/****** md5 signature: be266bf62f756ada2edb5854f2e9793d ******/
		%feature("compactdefaultargs") SetItemWithRole;
		%feature("autodoc", "
Parameters
----------
ItemWithRole: StepBasic_RoleSelect

Return
-------
None

Description
-----------
Set field ItemWithRole.
") SetItemWithRole;
		void SetItemWithRole(const StepBasic_RoleSelect & ItemWithRole);

		/****** StepBasic_RoleAssociation::SetRole ******/
		/****** md5 signature: 46043cb8c399972a3234cb666a07bb55 ******/
		%feature("compactdefaultargs") SetRole;
		%feature("autodoc", "
Parameters
----------
Role: StepBasic_ObjectRole

Return
-------
None

Description
-----------
Set field Role.
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
		/****** StepBasic_RoleSelect::StepBasic_RoleSelect ******/
		/****** md5 signature: c7b69b2896e10181702e8986eecba393 ******/
		%feature("compactdefaultargs") StepBasic_RoleSelect;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") StepBasic_RoleSelect;
		 StepBasic_RoleSelect();

		/****** StepBasic_RoleSelect::ActionAssignment ******/
		/****** md5 signature: 713d0359a8f8ca85173ab0f6a34ee64a ******/
		%feature("compactdefaultargs") ActionAssignment;
		%feature("autodoc", "Return
-------
opencascade::handle<StepBasic_ActionAssignment>

Description
-----------
Returns Value as ActionAssignment (or Null if another type).
") ActionAssignment;
		opencascade::handle<StepBasic_ActionAssignment> ActionAssignment();

		/****** StepBasic_RoleSelect::ActionRequestAssignment ******/
		/****** md5 signature: ae95133562e6384f39e98074053d1e6d ******/
		%feature("compactdefaultargs") ActionRequestAssignment;
		%feature("autodoc", "Return
-------
opencascade::handle<StepBasic_ActionRequestAssignment>

Description
-----------
Returns Value as ActionRequestAssignment (or Null if another type).
") ActionRequestAssignment;
		opencascade::handle<StepBasic_ActionRequestAssignment> ActionRequestAssignment();

		/****** StepBasic_RoleSelect::ApprovalAssignment ******/
		/****** md5 signature: d8cec1bb364c41aa0c2de96320927ca3 ******/
		%feature("compactdefaultargs") ApprovalAssignment;
		%feature("autodoc", "Return
-------
opencascade::handle<StepBasic_ApprovalAssignment>

Description
-----------
Returns Value as ApprovalAssignment (or Null if another type).
") ApprovalAssignment;
		opencascade::handle<StepBasic_ApprovalAssignment> ApprovalAssignment();

		/****** StepBasic_RoleSelect::ApprovalDateTime ******/
		/****** md5 signature: e39b66926b3ddb0466965160ee71baa3 ******/
		%feature("compactdefaultargs") ApprovalDateTime;
		%feature("autodoc", "Return
-------
opencascade::handle<StepBasic_ApprovalDateTime>

Description
-----------
Returns Value as ApprovalDateTime (or Null if another type).
") ApprovalDateTime;
		opencascade::handle<StepBasic_ApprovalDateTime> ApprovalDateTime();

		/****** StepBasic_RoleSelect::CaseNum ******/
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
Recognizes a kind of RoleSelect select type 1 -> ActionAssignment from StepBasic 2 -> ActionRequestAssignment from StepBasic 3 -> ApprovalAssignment from StepBasic 4 -> ApprovalDateTime from StepBasic 5 -> CertificationAssignment from StepBasic 6 -> ContractAssignment from StepBasic 7 -> DocumentReference from StepBasic 8 -> EffectivityAssignment from StepBasic 9 -> GroupAssignment from StepBasic 10 -> NameAssignment from StepBasic 11 -> SecurityClassificationAssignment from StepBasic 0 else.
") CaseNum;
		Standard_Integer CaseNum(const opencascade::handle<Standard_Transient> & ent);

		/****** StepBasic_RoleSelect::CertificationAssignment ******/
		/****** md5 signature: 831dbe663b31a28f1cfe11e06089ae51 ******/
		%feature("compactdefaultargs") CertificationAssignment;
		%feature("autodoc", "Return
-------
opencascade::handle<StepBasic_CertificationAssignment>

Description
-----------
Returns Value as CertificationAssignment (or Null if another type).
") CertificationAssignment;
		opencascade::handle<StepBasic_CertificationAssignment> CertificationAssignment();

		/****** StepBasic_RoleSelect::ContractAssignment ******/
		/****** md5 signature: e94417efc77812189aa960eb1f882868 ******/
		%feature("compactdefaultargs") ContractAssignment;
		%feature("autodoc", "Return
-------
opencascade::handle<StepBasic_ContractAssignment>

Description
-----------
Returns Value as ContractAssignment (or Null if another type).
") ContractAssignment;
		opencascade::handle<StepBasic_ContractAssignment> ContractAssignment();

		/****** StepBasic_RoleSelect::DocumentReference ******/
		/****** md5 signature: b1ae34bf25fd0f9c620478a4cf314343 ******/
		%feature("compactdefaultargs") DocumentReference;
		%feature("autodoc", "Return
-------
opencascade::handle<StepBasic_DocumentReference>

Description
-----------
Returns Value as DocumentReference (or Null if another type).
") DocumentReference;
		opencascade::handle<StepBasic_DocumentReference> DocumentReference();

		/****** StepBasic_RoleSelect::EffectivityAssignment ******/
		/****** md5 signature: 4a3312d7b94a680d7029924c9582beb7 ******/
		%feature("compactdefaultargs") EffectivityAssignment;
		%feature("autodoc", "Return
-------
opencascade::handle<StepBasic_EffectivityAssignment>

Description
-----------
Returns Value as EffectivityAssignment (or Null if another type).
") EffectivityAssignment;
		opencascade::handle<StepBasic_EffectivityAssignment> EffectivityAssignment();

		/****** StepBasic_RoleSelect::GroupAssignment ******/
		/****** md5 signature: df42ba1149841c0af5bb43580fab343e ******/
		%feature("compactdefaultargs") GroupAssignment;
		%feature("autodoc", "Return
-------
opencascade::handle<StepBasic_GroupAssignment>

Description
-----------
Returns Value as GroupAssignment (or Null if another type).
") GroupAssignment;
		opencascade::handle<StepBasic_GroupAssignment> GroupAssignment();

		/****** StepBasic_RoleSelect::NameAssignment ******/
		/****** md5 signature: 59a0e3e46a9cec47911526c791d84cd9 ******/
		%feature("compactdefaultargs") NameAssignment;
		%feature("autodoc", "Return
-------
opencascade::handle<StepBasic_NameAssignment>

Description
-----------
Returns Value as NameAssignment (or Null if another type).
") NameAssignment;
		opencascade::handle<StepBasic_NameAssignment> NameAssignment();

		/****** StepBasic_RoleSelect::SecurityClassificationAssignment ******/
		/****** md5 signature: f66f0d15c08bf991994d084470f5365b ******/
		%feature("compactdefaultargs") SecurityClassificationAssignment;
		%feature("autodoc", "Return
-------
opencascade::handle<StepBasic_SecurityClassificationAssignment>

Description
-----------
Returns Value as SecurityClassificationAssignment (or Null if another type).
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
		/****** StepBasic_SecurityClassification::StepBasic_SecurityClassification ******/
		/****** md5 signature: ef04d69822ba87c6b008889d8d3551c5 ******/
		%feature("compactdefaultargs") StepBasic_SecurityClassification;
		%feature("autodoc", "Return
-------
None

Description
-----------
Returns a SecurityClassification.
") StepBasic_SecurityClassification;
		 StepBasic_SecurityClassification();

		/****** StepBasic_SecurityClassification::Init ******/
		/****** md5 signature: 4275099b27062c1b5474f561b5a1a265 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
aName: TCollection_HAsciiString
aPurpose: TCollection_HAsciiString
aSecurityLevel: StepBasic_SecurityClassificationLevel

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aName, const opencascade::handle<TCollection_HAsciiString> & aPurpose, const opencascade::handle<StepBasic_SecurityClassificationLevel> & aSecurityLevel);

		/****** StepBasic_SecurityClassification::Name ******/
		/****** md5 signature: 6bcb97f17b57cae0750fd29eac20499c ******/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "Return
-------
opencascade::handle<TCollection_HAsciiString>

Description
-----------
No available documentation.
") Name;
		opencascade::handle<TCollection_HAsciiString> Name();

		/****** StepBasic_SecurityClassification::Purpose ******/
		/****** md5 signature: f96745f44705150c3273c06fb78fc3cb ******/
		%feature("compactdefaultargs") Purpose;
		%feature("autodoc", "Return
-------
opencascade::handle<TCollection_HAsciiString>

Description
-----------
No available documentation.
") Purpose;
		opencascade::handle<TCollection_HAsciiString> Purpose();

		/****** StepBasic_SecurityClassification::SecurityLevel ******/
		/****** md5 signature: 34f7227567e92290153610b45c004df4 ******/
		%feature("compactdefaultargs") SecurityLevel;
		%feature("autodoc", "Return
-------
opencascade::handle<StepBasic_SecurityClassificationLevel>

Description
-----------
No available documentation.
") SecurityLevel;
		opencascade::handle<StepBasic_SecurityClassificationLevel> SecurityLevel();

		/****** StepBasic_SecurityClassification::SetName ******/
		/****** md5 signature: 1e0b00d9eb163c8a0cdbb986e2ee24f6 ******/
		%feature("compactdefaultargs") SetName;
		%feature("autodoc", "
Parameters
----------
aName: TCollection_HAsciiString

Return
-------
None

Description
-----------
No available documentation.
") SetName;
		void SetName(const opencascade::handle<TCollection_HAsciiString> & aName);

		/****** StepBasic_SecurityClassification::SetPurpose ******/
		/****** md5 signature: 29140a8e429bd79cd40a6a01de3754bd ******/
		%feature("compactdefaultargs") SetPurpose;
		%feature("autodoc", "
Parameters
----------
aPurpose: TCollection_HAsciiString

Return
-------
None

Description
-----------
No available documentation.
") SetPurpose;
		void SetPurpose(const opencascade::handle<TCollection_HAsciiString> & aPurpose);

		/****** StepBasic_SecurityClassification::SetSecurityLevel ******/
		/****** md5 signature: ccb8f06e3546290181602af07d013b89 ******/
		%feature("compactdefaultargs") SetSecurityLevel;
		%feature("autodoc", "
Parameters
----------
aSecurityLevel: StepBasic_SecurityClassificationLevel

Return
-------
None

Description
-----------
No available documentation.
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
		/****** StepBasic_SecurityClassificationAssignment::AssignedSecurityClassification ******/
		/****** md5 signature: 145b088765b5c30f7c8ce8eab3574f79 ******/
		%feature("compactdefaultargs") AssignedSecurityClassification;
		%feature("autodoc", "Return
-------
opencascade::handle<StepBasic_SecurityClassification>

Description
-----------
No available documentation.
") AssignedSecurityClassification;
		opencascade::handle<StepBasic_SecurityClassification> AssignedSecurityClassification();

		/****** StepBasic_SecurityClassificationAssignment::Init ******/
		/****** md5 signature: 34e4b1087c18538fe2af4c71d1385488 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
aAssignedSecurityClassification: StepBasic_SecurityClassification

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const opencascade::handle<StepBasic_SecurityClassification> & aAssignedSecurityClassification);

		/****** StepBasic_SecurityClassificationAssignment::SetAssignedSecurityClassification ******/
		/****** md5 signature: fc9f6dc7c2033fdfa06110416d9678e8 ******/
		%feature("compactdefaultargs") SetAssignedSecurityClassification;
		%feature("autodoc", "
Parameters
----------
aAssignedSecurityClassification: StepBasic_SecurityClassification

Return
-------
None

Description
-----------
No available documentation.
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
		/****** StepBasic_SecurityClassificationLevel::StepBasic_SecurityClassificationLevel ******/
		/****** md5 signature: f4f3a9f95b0a5ff8408950e1bde800d1 ******/
		%feature("compactdefaultargs") StepBasic_SecurityClassificationLevel;
		%feature("autodoc", "Return
-------
None

Description
-----------
Returns a SecurityClassificationLevel.
") StepBasic_SecurityClassificationLevel;
		 StepBasic_SecurityClassificationLevel();

		/****** StepBasic_SecurityClassificationLevel::Init ******/
		/****** md5 signature: e10f4ffe4365262d2d9a5484d96325b8 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
aName: TCollection_HAsciiString

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aName);

		/****** StepBasic_SecurityClassificationLevel::Name ******/
		/****** md5 signature: 6bcb97f17b57cae0750fd29eac20499c ******/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "Return
-------
opencascade::handle<TCollection_HAsciiString>

Description
-----------
No available documentation.
") Name;
		opencascade::handle<TCollection_HAsciiString> Name();

		/****** StepBasic_SecurityClassificationLevel::SetName ******/
		/****** md5 signature: 1e0b00d9eb163c8a0cdbb986e2ee24f6 ******/
		%feature("compactdefaultargs") SetName;
		%feature("autodoc", "
Parameters
----------
aName: TCollection_HAsciiString

Return
-------
None

Description
-----------
No available documentation.
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
		/****** StepBasic_SizeMember::StepBasic_SizeMember ******/
		/****** md5 signature: 45664af80c08f3a14679a4b861c2dec9 ******/
		%feature("compactdefaultargs") StepBasic_SizeMember;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") StepBasic_SizeMember;
		 StepBasic_SizeMember();

		/****** StepBasic_SizeMember::HasName ******/
		/****** md5 signature: c4b2dbd737f3c98314fdb7955ce91c2a ******/
		%feature("compactdefaultargs") HasName;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") HasName;
		virtual Standard_Boolean HasName();

		/****** StepBasic_SizeMember::Name ******/
		/****** md5 signature: d654a4ee9a75d24a9c3f33853f908999 ******/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "Return
-------
str

Description
-----------
No available documentation.
") Name;
		virtual Standard_CString Name();

		/****** StepBasic_SizeMember::SetName ******/
		/****** md5 signature: cb088c8a5caf9447945830483c3112e7 ******/
		%feature("compactdefaultargs") SetName;
		%feature("autodoc", "
Parameters
----------
name: str

Return
-------
bool

Description
-----------
No available documentation.
") SetName;
		virtual Standard_Boolean SetName(Standard_CString name);

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
		/****** StepBasic_SizeSelect::StepBasic_SizeSelect ******/
		/****** md5 signature: 8a71af98685b37e168b4b864a4dfb3e8 ******/
		%feature("compactdefaultargs") StepBasic_SizeSelect;
		%feature("autodoc", "Return
-------
None

Description
-----------
Returns a SizeSelect SelectType.
") StepBasic_SizeSelect;
		 StepBasic_SizeSelect();

		/****** StepBasic_SizeSelect::CaseMem ******/
		/****** md5 signature: 26af6570a62efb94f2e4c31f1b319112 ******/
		%feature("compactdefaultargs") CaseMem;
		%feature("autodoc", "
Parameters
----------
ent: StepData_SelectMember

Return
-------
int

Description
-----------
Recognizes a SelectMember as Real, named as PARAMETER_VALUE 1 -> PositiveLengthMeasure i.e. Real 0 else (i.e. Entity).
") CaseMem;
		virtual Standard_Integer CaseMem(const opencascade::handle<StepData_SelectMember> & ent);

		/****** StepBasic_SizeSelect::CaseNum ******/
		/****** md5 signature: b9dbcdb5b972500c66bc8bc08f651d0a ******/
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
Recognizes a TrimmingSelect Kind Entity that is: 1 -> SizeMember 0 else (i.e. Real).
") CaseNum;
		Standard_Integer CaseNum(const opencascade::handle<Standard_Transient> & ent);

		/****** StepBasic_SizeSelect::NewMember ******/
		/****** md5 signature: ae7a49ea52744ae449d83e823e9a6da7 ******/
		%feature("compactdefaultargs") NewMember;
		%feature("autodoc", "Return
-------
opencascade::handle<StepData_SelectMember>

Description
-----------
Returns a SizeMember (POSITIVE_LENGTH_MEASURE) as preferred.
") NewMember;
		virtual opencascade::handle<StepData_SelectMember> NewMember();

		/****** StepBasic_SizeSelect::RealValue ******/
		/****** md5 signature: 8a0c7a2ab7b53f6fb68a06ec0dbc6aa7 ******/
		%feature("compactdefaultargs") RealValue;
		%feature("autodoc", "Return
-------
float

Description
-----------
returns Value as a Real (Null if another type).
") RealValue;
		Standard_Real RealValue();

		/****** StepBasic_SizeSelect::SetRealValue ******/
		/****** md5 signature: 2180c43020b4c001ad1a46ce769cb31c ******/
		%feature("compactdefaultargs") SetRealValue;
		%feature("autodoc", "
Parameters
----------
aReal: float

Return
-------
None

Description
-----------
No available documentation.
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
		/****** StepBasic_SourceItem::StepBasic_SourceItem ******/
		/****** md5 signature: f50c54aa98f03f5dd3dbdb623e6d956c ******/
		%feature("compactdefaultargs") StepBasic_SourceItem;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") StepBasic_SourceItem;
		 StepBasic_SourceItem();

		/****** StepBasic_SourceItem::CaseNum ******/
		/****** md5 signature: b9dbcdb5b972500c66bc8bc08f651d0a ******/
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
Recognizes a kind of SourceItem select type 1 -> HAsciiString from TCollection 0 else.
") CaseNum;
		Standard_Integer CaseNum(const opencascade::handle<Standard_Transient> & ent);

		/****** StepBasic_SourceItem::Identifier ******/
		/****** md5 signature: 386fefa275c40386efbae4b683607265 ******/
		%feature("compactdefaultargs") Identifier;
		%feature("autodoc", "Return
-------
opencascade::handle<TCollection_HAsciiString>

Description
-----------
Returns Value as Identifier (or Null if another type).
") Identifier;
		opencascade::handle<TCollection_HAsciiString> Identifier();

		/****** StepBasic_SourceItem::NewMember ******/
		/****** md5 signature: ae7a49ea52744ae449d83e823e9a6da7 ******/
		%feature("compactdefaultargs") NewMember;
		%feature("autodoc", "Return
-------
opencascade::handle<StepData_SelectMember>

Description
-----------
No available documentation.
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
		/****** StepBasic_Unit::StepBasic_Unit ******/
		/****** md5 signature: fbb7dba986b23cf338a253729c4cbfa7 ******/
		%feature("compactdefaultargs") StepBasic_Unit;
		%feature("autodoc", "Return
-------
None

Description
-----------
Creates empty object.
") StepBasic_Unit;
		 StepBasic_Unit();

		/****** StepBasic_Unit::CaseNum ******/
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
Recognizes a type of Unit Entity 1 -> NamedUnit 2 -> DerivedUnit.
") CaseNum;
		Standard_Integer CaseNum(const opencascade::handle<Standard_Transient> & ent);

		/****** StepBasic_Unit::DerivedUnit ******/
		/****** md5 signature: 26d48c35310c30ce58c9a7cb4905c600 ******/
		%feature("compactdefaultargs") DerivedUnit;
		%feature("autodoc", "Return
-------
opencascade::handle<StepBasic_DerivedUnit>

Description
-----------
returns Value as a DerivedUnit (Null if another type).
") DerivedUnit;
		opencascade::handle<StepBasic_DerivedUnit> DerivedUnit();

		/****** StepBasic_Unit::NamedUnit ******/
		/****** md5 signature: 6d23dd3cde39897313e3330c02aacaad ******/
		%feature("compactdefaultargs") NamedUnit;
		%feature("autodoc", "Return
-------
opencascade::handle<StepBasic_NamedUnit>

Description
-----------
returns Value as a NamedUnit (Null if another type).
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
		/****** StepBasic_VersionedActionRequest::StepBasic_VersionedActionRequest ******/
		/****** md5 signature: c6425c8d9e217cc1580eaf613cd2420e ******/
		%feature("compactdefaultargs") StepBasic_VersionedActionRequest;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") StepBasic_VersionedActionRequest;
		 StepBasic_VersionedActionRequest();

		/****** StepBasic_VersionedActionRequest::Description ******/
		/****** md5 signature: 68309bdf9d57a000073490b39f8e7a41 ******/
		%feature("compactdefaultargs") Description;
		%feature("autodoc", "Return
-------
opencascade::handle<TCollection_HAsciiString>

Description
-----------
Returns field Description.
") Description;
		opencascade::handle<TCollection_HAsciiString> Description();

		/****** StepBasic_VersionedActionRequest::HasDescription ******/
		/****** md5 signature: 819ef9a3dced474861e1980d901a2978 ******/
		%feature("compactdefaultargs") HasDescription;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if optional field Description is defined.
") HasDescription;
		Standard_Boolean HasDescription();

		/****** StepBasic_VersionedActionRequest::Id ******/
		/****** md5 signature: cad437aa1c6f9043742098c562124f9e ******/
		%feature("compactdefaultargs") Id;
		%feature("autodoc", "Return
-------
opencascade::handle<TCollection_HAsciiString>

Description
-----------
Returns field Id.
") Id;
		opencascade::handle<TCollection_HAsciiString> Id();

		/****** StepBasic_VersionedActionRequest::Init ******/
		/****** md5 signature: 6adb277f595c7fd98a3237570c0e8859 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
aId: TCollection_HAsciiString
aVersion: TCollection_HAsciiString
aPurpose: TCollection_HAsciiString
hasDescription: bool
aDescription: TCollection_HAsciiString

Return
-------
None

Description
-----------
Initialize all fields (own and inherited).
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aId, const opencascade::handle<TCollection_HAsciiString> & aVersion, const opencascade::handle<TCollection_HAsciiString> & aPurpose, const Standard_Boolean hasDescription, const opencascade::handle<TCollection_HAsciiString> & aDescription);

		/****** StepBasic_VersionedActionRequest::Purpose ******/
		/****** md5 signature: f96745f44705150c3273c06fb78fc3cb ******/
		%feature("compactdefaultargs") Purpose;
		%feature("autodoc", "Return
-------
opencascade::handle<TCollection_HAsciiString>

Description
-----------
Returns field Purpose.
") Purpose;
		opencascade::handle<TCollection_HAsciiString> Purpose();

		/****** StepBasic_VersionedActionRequest::SetDescription ******/
		/****** md5 signature: 11ff45bab13c9c85c44619d6c4501da8 ******/
		%feature("compactdefaultargs") SetDescription;
		%feature("autodoc", "
Parameters
----------
Description: TCollection_HAsciiString

Return
-------
None

Description
-----------
Set field Description.
") SetDescription;
		void SetDescription(const opencascade::handle<TCollection_HAsciiString> & Description);

		/****** StepBasic_VersionedActionRequest::SetId ******/
		/****** md5 signature: 779c5dce2dcbd218d648cf0dfb829a83 ******/
		%feature("compactdefaultargs") SetId;
		%feature("autodoc", "
Parameters
----------
Id: TCollection_HAsciiString

Return
-------
None

Description
-----------
Set field Id.
") SetId;
		void SetId(const opencascade::handle<TCollection_HAsciiString> & Id);

		/****** StepBasic_VersionedActionRequest::SetPurpose ******/
		/****** md5 signature: e2e7302d9004f014ab43f84f266372e2 ******/
		%feature("compactdefaultargs") SetPurpose;
		%feature("autodoc", "
Parameters
----------
Purpose: TCollection_HAsciiString

Return
-------
None

Description
-----------
Set field Purpose.
") SetPurpose;
		void SetPurpose(const opencascade::handle<TCollection_HAsciiString> & Purpose);

		/****** StepBasic_VersionedActionRequest::SetVersion ******/
		/****** md5 signature: a942932c2e95b52568fd9e21810ee6f7 ******/
		%feature("compactdefaultargs") SetVersion;
		%feature("autodoc", "
Parameters
----------
Version: TCollection_HAsciiString

Return
-------
None

Description
-----------
Set field Version.
") SetVersion;
		void SetVersion(const opencascade::handle<TCollection_HAsciiString> & Version);

		/****** StepBasic_VersionedActionRequest::Version ******/
		/****** md5 signature: 5c07c53ebf0b27daa5e97d0f9dc2a456 ******/
		%feature("compactdefaultargs") Version;
		%feature("autodoc", "Return
-------
opencascade::handle<TCollection_HAsciiString>

Description
-----------
Returns field Version.
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
		/****** StepBasic_AreaUnit::StepBasic_AreaUnit ******/
		/****** md5 signature: 73e57fc5ffe450c6d0e800530457acfe ******/
		%feature("compactdefaultargs") StepBasic_AreaUnit;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
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
		/****** StepBasic_CalendarDate::StepBasic_CalendarDate ******/
		/****** md5 signature: e1bf38ccd00745e5c572070895700d3c ******/
		%feature("compactdefaultargs") StepBasic_CalendarDate;
		%feature("autodoc", "Return
-------
None

Description
-----------
Returns a CalendarDate.
") StepBasic_CalendarDate;
		 StepBasic_CalendarDate();

		/****** StepBasic_CalendarDate::DayComponent ******/
		/****** md5 signature: 3ca7721e5937e191f94c2f5ecee1c9a8 ******/
		%feature("compactdefaultargs") DayComponent;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") DayComponent;
		Standard_Integer DayComponent();

		/****** StepBasic_CalendarDate::Init ******/
		/****** md5 signature: 9c21fad5af3cafe03c6603d271eff489 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
aYearComponent: int
aDayComponent: int
aMonthComponent: int

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const Standard_Integer aYearComponent, const Standard_Integer aDayComponent, const Standard_Integer aMonthComponent);

		/****** StepBasic_CalendarDate::MonthComponent ******/
		/****** md5 signature: 84d95fc4a04da1f7f99166d277a9f9a1 ******/
		%feature("compactdefaultargs") MonthComponent;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") MonthComponent;
		Standard_Integer MonthComponent();

		/****** StepBasic_CalendarDate::SetDayComponent ******/
		/****** md5 signature: 599666a06025a8440c3915e142f8559a ******/
		%feature("compactdefaultargs") SetDayComponent;
		%feature("autodoc", "
Parameters
----------
aDayComponent: int

Return
-------
None

Description
-----------
No available documentation.
") SetDayComponent;
		void SetDayComponent(const Standard_Integer aDayComponent);

		/****** StepBasic_CalendarDate::SetMonthComponent ******/
		/****** md5 signature: 7bea07a1c9bd41350c031c723a522ac3 ******/
		%feature("compactdefaultargs") SetMonthComponent;
		%feature("autodoc", "
Parameters
----------
aMonthComponent: int

Return
-------
None

Description
-----------
No available documentation.
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
		/****** StepBasic_ConversionBasedUnit::StepBasic_ConversionBasedUnit ******/
		/****** md5 signature: 62f7ef41692812fcca5a53f46e66bf72 ******/
		%feature("compactdefaultargs") StepBasic_ConversionBasedUnit;
		%feature("autodoc", "Return
-------
None

Description
-----------
Returns a ConversionBasedUnit.
") StepBasic_ConversionBasedUnit;
		 StepBasic_ConversionBasedUnit();

		/****** StepBasic_ConversionBasedUnit::ConversionFactor ******/
		/****** md5 signature: 98733960524f2b12331326efed41b780 ******/
		%feature("compactdefaultargs") ConversionFactor;
		%feature("autodoc", "Return
-------
opencascade::handle<StepBasic_MeasureWithUnit>

Description
-----------
No available documentation.
") ConversionFactor;
		opencascade::handle<StepBasic_MeasureWithUnit> ConversionFactor();

		/****** StepBasic_ConversionBasedUnit::Init ******/
		/****** md5 signature: 230b648890e9efa5eef6d2d214b37499 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
aDimensions: StepBasic_DimensionalExponents
aName: TCollection_HAsciiString
aConversionFactor: StepBasic_MeasureWithUnit

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const opencascade::handle<StepBasic_DimensionalExponents> & aDimensions, const opencascade::handle<TCollection_HAsciiString> & aName, const opencascade::handle<StepBasic_MeasureWithUnit> & aConversionFactor);

		/****** StepBasic_ConversionBasedUnit::Name ******/
		/****** md5 signature: 6bcb97f17b57cae0750fd29eac20499c ******/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "Return
-------
opencascade::handle<TCollection_HAsciiString>

Description
-----------
No available documentation.
") Name;
		opencascade::handle<TCollection_HAsciiString> Name();

		/****** StepBasic_ConversionBasedUnit::SetConversionFactor ******/
		/****** md5 signature: 69bcf62438994c98276236b10dc73ad7 ******/
		%feature("compactdefaultargs") SetConversionFactor;
		%feature("autodoc", "
Parameters
----------
aConversionFactor: StepBasic_MeasureWithUnit

Return
-------
None

Description
-----------
No available documentation.
") SetConversionFactor;
		void SetConversionFactor(const opencascade::handle<StepBasic_MeasureWithUnit> & aConversionFactor);

		/****** StepBasic_ConversionBasedUnit::SetName ******/
		/****** md5 signature: 1e0b00d9eb163c8a0cdbb986e2ee24f6 ******/
		%feature("compactdefaultargs") SetName;
		%feature("autodoc", "
Parameters
----------
aName: TCollection_HAsciiString

Return
-------
None

Description
-----------
No available documentation.
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
		/****** StepBasic_DigitalDocument::StepBasic_DigitalDocument ******/
		/****** md5 signature: b32671da828ea0011f4c0e8075874b22 ******/
		%feature("compactdefaultargs") StepBasic_DigitalDocument;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
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
		/****** StepBasic_DocumentFile::StepBasic_DocumentFile ******/
		/****** md5 signature: f23c109498123fef2d64875336473344 ******/
		%feature("compactdefaultargs") StepBasic_DocumentFile;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") StepBasic_DocumentFile;
		 StepBasic_DocumentFile();

		/****** StepBasic_DocumentFile::CharacterizedObject ******/
		/****** md5 signature: e518475515030a2f9db7a2227e2fe8f9 ******/
		%feature("compactdefaultargs") CharacterizedObject;
		%feature("autodoc", "Return
-------
opencascade::handle<StepBasic_CharacterizedObject>

Description
-----------
Returns data for supertype CharacterizedObject.
") CharacterizedObject;
		opencascade::handle<StepBasic_CharacterizedObject> CharacterizedObject();

		/****** StepBasic_DocumentFile::Init ******/
		/****** md5 signature: e6130c458940e6c1bd73fd00044284ba ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
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

Return
-------
None

Description
-----------
Initialize all fields (own and inherited).
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aDocument_Id, const opencascade::handle<TCollection_HAsciiString> & aDocument_Name, const Standard_Boolean hasDocument_Description, const opencascade::handle<TCollection_HAsciiString> & aDocument_Description, const opencascade::handle<StepBasic_DocumentType> & aDocument_Kind, const opencascade::handle<TCollection_HAsciiString> & aCharacterizedObject_Name, const Standard_Boolean hasCharacterizedObject_Description, const opencascade::handle<TCollection_HAsciiString> & aCharacterizedObject_Description);

		/****** StepBasic_DocumentFile::SetCharacterizedObject ******/
		/****** md5 signature: c032a3a7a6c2c39e4d00bb4dc86d97ab ******/
		%feature("compactdefaultargs") SetCharacterizedObject;
		%feature("autodoc", "
Parameters
----------
CharacterizedObject: StepBasic_CharacterizedObject

Return
-------
None

Description
-----------
Set data for supertype CharacterizedObject.
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
		/****** StepBasic_DocumentProductEquivalence::StepBasic_DocumentProductEquivalence ******/
		/****** md5 signature: 2d0a72a3b41329845833993bb249e53d ******/
		%feature("compactdefaultargs") StepBasic_DocumentProductEquivalence;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
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
		/****** StepBasic_ExternalIdentificationAssignment::StepBasic_ExternalIdentificationAssignment ******/
		/****** md5 signature: 421364749dd02b04bf3798e0a8a8ce21 ******/
		%feature("compactdefaultargs") StepBasic_ExternalIdentificationAssignment;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") StepBasic_ExternalIdentificationAssignment;
		 StepBasic_ExternalIdentificationAssignment();

		/****** StepBasic_ExternalIdentificationAssignment::Init ******/
		/****** md5 signature: 13abcb3641ba0bb47f47dd775dd2b8ae ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
aIdentificationAssignment_AssignedId: TCollection_HAsciiString
aIdentificationAssignment_Role: StepBasic_IdentificationRole
aSource: StepBasic_ExternalSource

Return
-------
None

Description
-----------
Initialize all fields (own and inherited).
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aIdentificationAssignment_AssignedId, const opencascade::handle<StepBasic_IdentificationRole> & aIdentificationAssignment_Role, const opencascade::handle<StepBasic_ExternalSource> & aSource);

		/****** StepBasic_ExternalIdentificationAssignment::SetSource ******/
		/****** md5 signature: 2e83538f32b5b2a0a6a43a552fe31327 ******/
		%feature("compactdefaultargs") SetSource;
		%feature("autodoc", "
Parameters
----------
Source: StepBasic_ExternalSource

Return
-------
None

Description
-----------
Set field Source.
") SetSource;
		void SetSource(const opencascade::handle<StepBasic_ExternalSource> & Source);

		/****** StepBasic_ExternalIdentificationAssignment::Source ******/
		/****** md5 signature: 8b90a9ea46f21d4e9d0fbb6449a05fa1 ******/
		%feature("compactdefaultargs") Source;
		%feature("autodoc", "Return
-------
opencascade::handle<StepBasic_ExternalSource>

Description
-----------
Returns field Source.
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
		/****** StepBasic_LengthMeasureWithUnit::StepBasic_LengthMeasureWithUnit ******/
		/****** md5 signature: 1fb76cc685df76d201af40e574e564a6 ******/
		%feature("compactdefaultargs") StepBasic_LengthMeasureWithUnit;
		%feature("autodoc", "Return
-------
None

Description
-----------
Returns a LengthMeasureWithUnit.
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
		/****** StepBasic_LengthUnit::StepBasic_LengthUnit ******/
		/****** md5 signature: 570efd4fead2ffd8f6cebf51b01e7f12 ******/
		%feature("compactdefaultargs") StepBasic_LengthUnit;
		%feature("autodoc", "Return
-------
None

Description
-----------
Returns a LengthUnit.
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
		/****** StepBasic_MassMeasureWithUnit::StepBasic_MassMeasureWithUnit ******/
		/****** md5 signature: 78c0c3b1a1758eea389406c5675332b8 ******/
		%feature("compactdefaultargs") StepBasic_MassMeasureWithUnit;
		%feature("autodoc", "Return
-------
None

Description
-----------
Returns a MassMeasureWithUnit.
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
		/****** StepBasic_MassUnit::StepBasic_MassUnit ******/
		/****** md5 signature: 2f661b14c11ebb5c7b448f3dbecd3113 ******/
		%feature("compactdefaultargs") StepBasic_MassUnit;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
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
		/****** StepBasic_OrdinalDate::StepBasic_OrdinalDate ******/
		/****** md5 signature: 4e3a71d43377a529db80c46c05bc50c8 ******/
		%feature("compactdefaultargs") StepBasic_OrdinalDate;
		%feature("autodoc", "Return
-------
None

Description
-----------
Returns a OrdinalDate.
") StepBasic_OrdinalDate;
		 StepBasic_OrdinalDate();

		/****** StepBasic_OrdinalDate::DayComponent ******/
		/****** md5 signature: 3ca7721e5937e191f94c2f5ecee1c9a8 ******/
		%feature("compactdefaultargs") DayComponent;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") DayComponent;
		Standard_Integer DayComponent();

		/****** StepBasic_OrdinalDate::Init ******/
		/****** md5 signature: c5517f379a9ce8be968e2b61c9fbc851 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
aYearComponent: int
aDayComponent: int

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const Standard_Integer aYearComponent, const Standard_Integer aDayComponent);

		/****** StepBasic_OrdinalDate::SetDayComponent ******/
		/****** md5 signature: 599666a06025a8440c3915e142f8559a ******/
		%feature("compactdefaultargs") SetDayComponent;
		%feature("autodoc", "
Parameters
----------
aDayComponent: int

Return
-------
None

Description
-----------
No available documentation.
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
		/****** StepBasic_OrganizationalAddress::StepBasic_OrganizationalAddress ******/
		/****** md5 signature: 071669fde078fe82f1cfe1598a501f67 ******/
		%feature("compactdefaultargs") StepBasic_OrganizationalAddress;
		%feature("autodoc", "Return
-------
None

Description
-----------
Returns a OrganizationalAddress.
") StepBasic_OrganizationalAddress;
		 StepBasic_OrganizationalAddress();

		/****** StepBasic_OrganizationalAddress::Description ******/
		/****** md5 signature: 68309bdf9d57a000073490b39f8e7a41 ******/
		%feature("compactdefaultargs") Description;
		%feature("autodoc", "Return
-------
opencascade::handle<TCollection_HAsciiString>

Description
-----------
No available documentation.
") Description;
		opencascade::handle<TCollection_HAsciiString> Description();

		/****** StepBasic_OrganizationalAddress::Init ******/
		/****** md5 signature: ccaae03165ab1a12bdb7a1ace15ee396 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
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

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const Standard_Boolean hasAinternalLocation, const opencascade::handle<TCollection_HAsciiString> & aInternalLocation, const Standard_Boolean hasAstreetNumber, const opencascade::handle<TCollection_HAsciiString> & aStreetNumber, const Standard_Boolean hasAstreet, const opencascade::handle<TCollection_HAsciiString> & aStreet, const Standard_Boolean hasApostalBox, const opencascade::handle<TCollection_HAsciiString> & aPostalBox, const Standard_Boolean hasAtown, const opencascade::handle<TCollection_HAsciiString> & aTown, const Standard_Boolean hasAregion, const opencascade::handle<TCollection_HAsciiString> & aRegion, const Standard_Boolean hasApostalCode, const opencascade::handle<TCollection_HAsciiString> & aPostalCode, const Standard_Boolean hasAcountry, const opencascade::handle<TCollection_HAsciiString> & aCountry, const Standard_Boolean hasAfacsimileNumber, const opencascade::handle<TCollection_HAsciiString> & aFacsimileNumber, const Standard_Boolean hasAtelephoneNumber, const opencascade::handle<TCollection_HAsciiString> & aTelephoneNumber, const Standard_Boolean hasAelectronicMailAddress, const opencascade::handle<TCollection_HAsciiString> & aElectronicMailAddress, const Standard_Boolean hasAtelexNumber, const opencascade::handle<TCollection_HAsciiString> & aTelexNumber, const opencascade::handle<StepBasic_HArray1OfOrganization> & aOrganizations, const opencascade::handle<TCollection_HAsciiString> & aDescription);

		/****** StepBasic_OrganizationalAddress::NbOrganizations ******/
		/****** md5 signature: 58cca92ad0d9a651a9d655d52a18c36a ******/
		%feature("compactdefaultargs") NbOrganizations;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbOrganizations;
		Standard_Integer NbOrganizations();

		/****** StepBasic_OrganizationalAddress::Organizations ******/
		/****** md5 signature: 924e32ad252cd9d50fdb6040bc54a79c ******/
		%feature("compactdefaultargs") Organizations;
		%feature("autodoc", "Return
-------
opencascade::handle<StepBasic_HArray1OfOrganization>

Description
-----------
No available documentation.
") Organizations;
		opencascade::handle<StepBasic_HArray1OfOrganization> Organizations();

		/****** StepBasic_OrganizationalAddress::OrganizationsValue ******/
		/****** md5 signature: 4adae1500f1d8d1283591a940c62c887 ******/
		%feature("compactdefaultargs") OrganizationsValue;
		%feature("autodoc", "
Parameters
----------
num: int

Return
-------
opencascade::handle<StepBasic_Organization>

Description
-----------
No available documentation.
") OrganizationsValue;
		opencascade::handle<StepBasic_Organization> OrganizationsValue(const Standard_Integer num);

		/****** StepBasic_OrganizationalAddress::SetDescription ******/
		/****** md5 signature: adddd13a906718df58a2eee683a382cf ******/
		%feature("compactdefaultargs") SetDescription;
		%feature("autodoc", "
Parameters
----------
aDescription: TCollection_HAsciiString

Return
-------
None

Description
-----------
No available documentation.
") SetDescription;
		void SetDescription(const opencascade::handle<TCollection_HAsciiString> & aDescription);

		/****** StepBasic_OrganizationalAddress::SetOrganizations ******/
		/****** md5 signature: 18a3f0b32682ed1758b75b50c092ea7c ******/
		%feature("compactdefaultargs") SetOrganizations;
		%feature("autodoc", "
Parameters
----------
aOrganizations: StepBasic_HArray1OfOrganization

Return
-------
None

Description
-----------
No available documentation.
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
		/****** StepBasic_PersonalAddress::StepBasic_PersonalAddress ******/
		/****** md5 signature: f6670f5325d7692059c366e7ad2227b8 ******/
		%feature("compactdefaultargs") StepBasic_PersonalAddress;
		%feature("autodoc", "Return
-------
None

Description
-----------
Returns a PersonalAddress.
") StepBasic_PersonalAddress;
		 StepBasic_PersonalAddress();

		/****** StepBasic_PersonalAddress::Description ******/
		/****** md5 signature: 68309bdf9d57a000073490b39f8e7a41 ******/
		%feature("compactdefaultargs") Description;
		%feature("autodoc", "Return
-------
opencascade::handle<TCollection_HAsciiString>

Description
-----------
No available documentation.
") Description;
		opencascade::handle<TCollection_HAsciiString> Description();

		/****** StepBasic_PersonalAddress::Init ******/
		/****** md5 signature: 687c1ee4d41ddbfa8eac972407b6a00d ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
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

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const Standard_Boolean hasAinternalLocation, const opencascade::handle<TCollection_HAsciiString> & aInternalLocation, const Standard_Boolean hasAstreetNumber, const opencascade::handle<TCollection_HAsciiString> & aStreetNumber, const Standard_Boolean hasAstreet, const opencascade::handle<TCollection_HAsciiString> & aStreet, const Standard_Boolean hasApostalBox, const opencascade::handle<TCollection_HAsciiString> & aPostalBox, const Standard_Boolean hasAtown, const opencascade::handle<TCollection_HAsciiString> & aTown, const Standard_Boolean hasAregion, const opencascade::handle<TCollection_HAsciiString> & aRegion, const Standard_Boolean hasApostalCode, const opencascade::handle<TCollection_HAsciiString> & aPostalCode, const Standard_Boolean hasAcountry, const opencascade::handle<TCollection_HAsciiString> & aCountry, const Standard_Boolean hasAfacsimileNumber, const opencascade::handle<TCollection_HAsciiString> & aFacsimileNumber, const Standard_Boolean hasAtelephoneNumber, const opencascade::handle<TCollection_HAsciiString> & aTelephoneNumber, const Standard_Boolean hasAelectronicMailAddress, const opencascade::handle<TCollection_HAsciiString> & aElectronicMailAddress, const Standard_Boolean hasAtelexNumber, const opencascade::handle<TCollection_HAsciiString> & aTelexNumber, const opencascade::handle<StepBasic_HArray1OfPerson> & aPeople, const opencascade::handle<TCollection_HAsciiString> & aDescription);

		/****** StepBasic_PersonalAddress::NbPeople ******/
		/****** md5 signature: 076af9501e66b6b44666d05e1da08dc9 ******/
		%feature("compactdefaultargs") NbPeople;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbPeople;
		Standard_Integer NbPeople();

		/****** StepBasic_PersonalAddress::People ******/
		/****** md5 signature: 61214df2a5fb1a2d6db2a91252f3990a ******/
		%feature("compactdefaultargs") People;
		%feature("autodoc", "Return
-------
opencascade::handle<StepBasic_HArray1OfPerson>

Description
-----------
No available documentation.
") People;
		opencascade::handle<StepBasic_HArray1OfPerson> People();

		/****** StepBasic_PersonalAddress::PeopleValue ******/
		/****** md5 signature: 93a18090eaba871d51c66c2a43c9e00e ******/
		%feature("compactdefaultargs") PeopleValue;
		%feature("autodoc", "
Parameters
----------
num: int

Return
-------
opencascade::handle<StepBasic_Person>

Description
-----------
No available documentation.
") PeopleValue;
		opencascade::handle<StepBasic_Person> PeopleValue(const Standard_Integer num);

		/****** StepBasic_PersonalAddress::SetDescription ******/
		/****** md5 signature: adddd13a906718df58a2eee683a382cf ******/
		%feature("compactdefaultargs") SetDescription;
		%feature("autodoc", "
Parameters
----------
aDescription: TCollection_HAsciiString

Return
-------
None

Description
-----------
No available documentation.
") SetDescription;
		void SetDescription(const opencascade::handle<TCollection_HAsciiString> & aDescription);

		/****** StepBasic_PersonalAddress::SetPeople ******/
		/****** md5 signature: 83d80afa04bc7dde575b6846eed3d8dd ******/
		%feature("compactdefaultargs") SetPeople;
		%feature("autodoc", "
Parameters
----------
aPeople: StepBasic_HArray1OfPerson

Return
-------
None

Description
-----------
No available documentation.
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
		/****** StepBasic_PhysicallyModeledProductDefinition::StepBasic_PhysicallyModeledProductDefinition ******/
		/****** md5 signature: e261597a738525c474df8e71f527b01e ******/
		%feature("compactdefaultargs") StepBasic_PhysicallyModeledProductDefinition;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
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
		/****** StepBasic_PlaneAngleMeasureWithUnit::StepBasic_PlaneAngleMeasureWithUnit ******/
		/****** md5 signature: 6bc2a43e4be71fb0c166ed652f064743 ******/
		%feature("compactdefaultargs") StepBasic_PlaneAngleMeasureWithUnit;
		%feature("autodoc", "Return
-------
None

Description
-----------
Returns a PlaneAngleMeasureWithUnit.
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
		/****** StepBasic_PlaneAngleUnit::StepBasic_PlaneAngleUnit ******/
		/****** md5 signature: 62df6d69e0fbb13c07e1dce33e456197 ******/
		%feature("compactdefaultargs") StepBasic_PlaneAngleUnit;
		%feature("autodoc", "Return
-------
None

Description
-----------
Returns a PlaneAngleUnit.
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
		/****** StepBasic_ProductConceptContext::StepBasic_ProductConceptContext ******/
		/****** md5 signature: 44f94a9b8c2116ea44967bc2663b1c23 ******/
		%feature("compactdefaultargs") StepBasic_ProductConceptContext;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") StepBasic_ProductConceptContext;
		 StepBasic_ProductConceptContext();

		/****** StepBasic_ProductConceptContext::Init ******/
		/****** md5 signature: c758a45d98a7b12c6572a1c72e386a1e ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
aApplicationContextElement_Name: TCollection_HAsciiString
aApplicationContextElement_FrameOfReference: StepBasic_ApplicationContext
aMarketSegmentType: TCollection_HAsciiString

Return
-------
None

Description
-----------
Initialize all fields (own and inherited).
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aApplicationContextElement_Name, const opencascade::handle<StepBasic_ApplicationContext> & aApplicationContextElement_FrameOfReference, const opencascade::handle<TCollection_HAsciiString> & aMarketSegmentType);

		/****** StepBasic_ProductConceptContext::MarketSegmentType ******/
		/****** md5 signature: c735ef347aa388846f1b3bbf46b80ab5 ******/
		%feature("compactdefaultargs") MarketSegmentType;
		%feature("autodoc", "Return
-------
opencascade::handle<TCollection_HAsciiString>

Description
-----------
Returns field MarketSegmentType.
") MarketSegmentType;
		opencascade::handle<TCollection_HAsciiString> MarketSegmentType();

		/****** StepBasic_ProductConceptContext::SetMarketSegmentType ******/
		/****** md5 signature: 2b4486a4e81e71df45298bea8ec49017 ******/
		%feature("compactdefaultargs") SetMarketSegmentType;
		%feature("autodoc", "
Parameters
----------
MarketSegmentType: TCollection_HAsciiString

Return
-------
None

Description
-----------
Set field MarketSegmentType.
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
		/****** StepBasic_ProductContext::StepBasic_ProductContext ******/
		/****** md5 signature: 46e1fb19a02e6f17a2790b0adfed1148 ******/
		%feature("compactdefaultargs") StepBasic_ProductContext;
		%feature("autodoc", "Return
-------
None

Description
-----------
Returns a ProductContext.
") StepBasic_ProductContext;
		 StepBasic_ProductContext();

		/****** StepBasic_ProductContext::DisciplineType ******/
		/****** md5 signature: 1178d05d94bcd211c9abfb5237b4dbb0 ******/
		%feature("compactdefaultargs") DisciplineType;
		%feature("autodoc", "Return
-------
opencascade::handle<TCollection_HAsciiString>

Description
-----------
No available documentation.
") DisciplineType;
		opencascade::handle<TCollection_HAsciiString> DisciplineType();

		/****** StepBasic_ProductContext::Init ******/
		/****** md5 signature: 34ae14a230273c724386f092d1029a8e ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
aName: TCollection_HAsciiString
aFrameOfReference: StepBasic_ApplicationContext
aDisciplineType: TCollection_HAsciiString

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aName, const opencascade::handle<StepBasic_ApplicationContext> & aFrameOfReference, const opencascade::handle<TCollection_HAsciiString> & aDisciplineType);

		/****** StepBasic_ProductContext::SetDisciplineType ******/
		/****** md5 signature: 655a4fb2b54042482a1a89ddd1222504 ******/
		%feature("compactdefaultargs") SetDisciplineType;
		%feature("autodoc", "
Parameters
----------
aDisciplineType: TCollection_HAsciiString

Return
-------
None

Description
-----------
No available documentation.
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
		/****** StepBasic_ProductDefinitionContext::StepBasic_ProductDefinitionContext ******/
		/****** md5 signature: 955214e1cb9ad4c7ce65bff6c9f9b73d ******/
		%feature("compactdefaultargs") StepBasic_ProductDefinitionContext;
		%feature("autodoc", "Return
-------
None

Description
-----------
Returns a ProductDefinitionContext.
") StepBasic_ProductDefinitionContext;
		 StepBasic_ProductDefinitionContext();

		/****** StepBasic_ProductDefinitionContext::Init ******/
		/****** md5 signature: a6be1554a1ba305e5b97d399a386e7d3 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
aName: TCollection_HAsciiString
aFrameOfReference: StepBasic_ApplicationContext
aLifeCycleStage: TCollection_HAsciiString

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aName, const opencascade::handle<StepBasic_ApplicationContext> & aFrameOfReference, const opencascade::handle<TCollection_HAsciiString> & aLifeCycleStage);

		/****** StepBasic_ProductDefinitionContext::LifeCycleStage ******/
		/****** md5 signature: b8c37876bd64a99cd119b70539911212 ******/
		%feature("compactdefaultargs") LifeCycleStage;
		%feature("autodoc", "Return
-------
opencascade::handle<TCollection_HAsciiString>

Description
-----------
No available documentation.
") LifeCycleStage;
		opencascade::handle<TCollection_HAsciiString> LifeCycleStage();

		/****** StepBasic_ProductDefinitionContext::SetLifeCycleStage ******/
		/****** md5 signature: aa0104861f00faf98b848d06abda2b00 ******/
		%feature("compactdefaultargs") SetLifeCycleStage;
		%feature("autodoc", "
Parameters
----------
aLifeCycleStage: TCollection_HAsciiString

Return
-------
None

Description
-----------
No available documentation.
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
		/****** StepBasic_ProductDefinitionEffectivity::StepBasic_ProductDefinitionEffectivity ******/
		/****** md5 signature: e672cebe215ec0a19823ef00b79ace8c ******/
		%feature("compactdefaultargs") StepBasic_ProductDefinitionEffectivity;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") StepBasic_ProductDefinitionEffectivity;
		 StepBasic_ProductDefinitionEffectivity();

		/****** StepBasic_ProductDefinitionEffectivity::Init ******/
		/****** md5 signature: fcb6eca33aeeadff4403a24c50d4d7a0 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
aId: TCollection_HAsciiString
aUsage: StepBasic_ProductDefinitionRelationship

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aId, const opencascade::handle<StepBasic_ProductDefinitionRelationship> & aUsage);

		/****** StepBasic_ProductDefinitionEffectivity::SetUsage ******/
		/****** md5 signature: 8aed11e8fe75f2c6fcd0b994bf0a656b ******/
		%feature("compactdefaultargs") SetUsage;
		%feature("autodoc", "
Parameters
----------
aUsage: StepBasic_ProductDefinitionRelationship

Return
-------
None

Description
-----------
No available documentation.
") SetUsage;
		void SetUsage(const opencascade::handle<StepBasic_ProductDefinitionRelationship> & aUsage);

		/****** StepBasic_ProductDefinitionEffectivity::Usage ******/
		/****** md5 signature: 7196a3223aa89ae3216b57bf404c0ba5 ******/
		%feature("compactdefaultargs") Usage;
		%feature("autodoc", "Return
-------
opencascade::handle<StepBasic_ProductDefinitionRelationship>

Description
-----------
No available documentation.
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
		/****** StepBasic_ProductDefinitionFormationWithSpecifiedSource::StepBasic_ProductDefinitionFormationWithSpecifiedSource ******/
		/****** md5 signature: 8db50b8ef90d083e8959ac89d6949777 ******/
		%feature("compactdefaultargs") StepBasic_ProductDefinitionFormationWithSpecifiedSource;
		%feature("autodoc", "Return
-------
None

Description
-----------
Returns a ProductDefinitionFormationWithSpecifiedSource.
") StepBasic_ProductDefinitionFormationWithSpecifiedSource;
		 StepBasic_ProductDefinitionFormationWithSpecifiedSource();

		/****** StepBasic_ProductDefinitionFormationWithSpecifiedSource::Init ******/
		/****** md5 signature: f3bb2a7c10e46ceec28cec390035abbd ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
aId: TCollection_HAsciiString
aDescription: TCollection_HAsciiString
aOfProduct: StepBasic_Product
aMakeOrBuy: StepBasic_Source

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aId, const opencascade::handle<TCollection_HAsciiString> & aDescription, const opencascade::handle<StepBasic_Product> & aOfProduct, const StepBasic_Source aMakeOrBuy);

		/****** StepBasic_ProductDefinitionFormationWithSpecifiedSource::MakeOrBuy ******/
		/****** md5 signature: 522f46d1966445b0c122e677e62d37e8 ******/
		%feature("compactdefaultargs") MakeOrBuy;
		%feature("autodoc", "Return
-------
StepBasic_Source

Description
-----------
No available documentation.
") MakeOrBuy;
		StepBasic_Source MakeOrBuy();

		/****** StepBasic_ProductDefinitionFormationWithSpecifiedSource::SetMakeOrBuy ******/
		/****** md5 signature: 02bd86081f2102d67a5004c9efde7776 ******/
		%feature("compactdefaultargs") SetMakeOrBuy;
		%feature("autodoc", "
Parameters
----------
aMakeOrBuy: StepBasic_Source

Return
-------
None

Description
-----------
No available documentation.
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
		/****** StepBasic_ProductDefinitionReferenceWithLocalRepresentation::StepBasic_ProductDefinitionReferenceWithLocalRepresentation ******/
		/****** md5 signature: 38177af813d9c16e3a1e585e77a65e6c ******/
		%feature("compactdefaultargs") StepBasic_ProductDefinitionReferenceWithLocalRepresentation;
		%feature("autodoc", "Return
-------
None

Description
-----------
Returns a ProductDefinitionReferenceWithLocalRepresentation.
") StepBasic_ProductDefinitionReferenceWithLocalRepresentation;
		 StepBasic_ProductDefinitionReferenceWithLocalRepresentation();

		/****** StepBasic_ProductDefinitionReferenceWithLocalRepresentation::Init ******/
		/****** md5 signature: a17a9dc52f1b692ec8801c14668099c4 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
theSource: StepBasic_ExternalSource
theId: TCollection_HAsciiString
theDescription: TCollection_HAsciiString
theFormation: StepBasic_ProductDefinitionFormation
theFrameOfReference: StepBasic_ProductDefinitionContext

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const opencascade::handle<StepBasic_ExternalSource> & theSource, const opencascade::handle<TCollection_HAsciiString> & theId, const opencascade::handle<TCollection_HAsciiString> & theDescription, const opencascade::handle<StepBasic_ProductDefinitionFormation> & theFormation, const opencascade::handle<StepBasic_ProductDefinitionContext> & theFrameOfReference);

		/****** StepBasic_ProductDefinitionReferenceWithLocalRepresentation::SetSource ******/
		/****** md5 signature: d656e905f131b35a69061b2a857e75e0 ******/
		%feature("compactdefaultargs") SetSource;
		%feature("autodoc", "
Parameters
----------
theSource: StepBasic_ExternalSource

Return
-------
None

Description
-----------
Set field Source.
") SetSource;
		void SetSource(const opencascade::handle<StepBasic_ExternalSource> & theSource);

		/****** StepBasic_ProductDefinitionReferenceWithLocalRepresentation::Source ******/
		/****** md5 signature: a13a47fce462914f8ac90f867f0370c7 ******/
		%feature("compactdefaultargs") Source;
		%feature("autodoc", "Return
-------
opencascade::handle<StepBasic_ExternalSource>

Description
-----------
Returns field Source.
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
		/****** StepBasic_ProductDefinitionWithAssociatedDocuments::StepBasic_ProductDefinitionWithAssociatedDocuments ******/
		/****** md5 signature: 67547eb51a3aeb0534481234d07bd7e5 ******/
		%feature("compactdefaultargs") StepBasic_ProductDefinitionWithAssociatedDocuments;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") StepBasic_ProductDefinitionWithAssociatedDocuments;
		 StepBasic_ProductDefinitionWithAssociatedDocuments();

		/****** StepBasic_ProductDefinitionWithAssociatedDocuments::DocIds ******/
		/****** md5 signature: f99a89ab71d1f1345ebfac7db2976045 ******/
		%feature("compactdefaultargs") DocIds;
		%feature("autodoc", "Return
-------
opencascade::handle<StepBasic_HArray1OfDocument>

Description
-----------
No available documentation.
") DocIds;
		opencascade::handle<StepBasic_HArray1OfDocument> DocIds();

		/****** StepBasic_ProductDefinitionWithAssociatedDocuments::DocIdsValue ******/
		/****** md5 signature: 289bae0af42e7afb9eeddb56ee56c8f5 ******/
		%feature("compactdefaultargs") DocIdsValue;
		%feature("autodoc", "
Parameters
----------
num: int

Return
-------
opencascade::handle<StepBasic_Document>

Description
-----------
No available documentation.
") DocIdsValue;
		opencascade::handle<StepBasic_Document> DocIdsValue(const Standard_Integer num);

		/****** StepBasic_ProductDefinitionWithAssociatedDocuments::Init ******/
		/****** md5 signature: ab6a828211fe18264927c2f513d4fa62 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
aId: TCollection_HAsciiString
aDescription: TCollection_HAsciiString
aFormation: StepBasic_ProductDefinitionFormation
aFrame: StepBasic_ProductDefinitionContext
aDocIds: StepBasic_HArray1OfDocument

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aId, const opencascade::handle<TCollection_HAsciiString> & aDescription, const opencascade::handle<StepBasic_ProductDefinitionFormation> & aFormation, const opencascade::handle<StepBasic_ProductDefinitionContext> & aFrame, const opencascade::handle<StepBasic_HArray1OfDocument> & aDocIds);

		/****** StepBasic_ProductDefinitionWithAssociatedDocuments::NbDocIds ******/
		/****** md5 signature: 44309351a282aab6be59435a9a2d0d58 ******/
		%feature("compactdefaultargs") NbDocIds;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbDocIds;
		Standard_Integer NbDocIds();

		/****** StepBasic_ProductDefinitionWithAssociatedDocuments::SetDocIds ******/
		/****** md5 signature: 9d5a6ec9fd4dffb06f4867ff750cf34a ******/
		%feature("compactdefaultargs") SetDocIds;
		%feature("autodoc", "
Parameters
----------
DocIds: StepBasic_HArray1OfDocument

Return
-------
None

Description
-----------
No available documentation.
") SetDocIds;
		void SetDocIds(const opencascade::handle<StepBasic_HArray1OfDocument> & DocIds);

		/****** StepBasic_ProductDefinitionWithAssociatedDocuments::SetDocIdsValue ******/
		/****** md5 signature: 3f2cc15471c89394ba1fe90e381f98cc ******/
		%feature("compactdefaultargs") SetDocIdsValue;
		%feature("autodoc", "
Parameters
----------
num: int
adoc: StepBasic_Document

Return
-------
None

Description
-----------
No available documentation.
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
		/****** StepBasic_ProductRelatedProductCategory::StepBasic_ProductRelatedProductCategory ******/
		/****** md5 signature: c207ddf61fee45c4ebcf3bb50b4310f2 ******/
		%feature("compactdefaultargs") StepBasic_ProductRelatedProductCategory;
		%feature("autodoc", "Return
-------
None

Description
-----------
Returns a ProductRelatedProductCategory.
") StepBasic_ProductRelatedProductCategory;
		 StepBasic_ProductRelatedProductCategory();

		/****** StepBasic_ProductRelatedProductCategory::Init ******/
		/****** md5 signature: ef699e40c29669615c48c9d4d2308a69 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
aName: TCollection_HAsciiString
hasAdescription: bool
aDescription: TCollection_HAsciiString
aProducts: StepBasic_HArray1OfProduct

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aName, const Standard_Boolean hasAdescription, const opencascade::handle<TCollection_HAsciiString> & aDescription, const opencascade::handle<StepBasic_HArray1OfProduct> & aProducts);

		/****** StepBasic_ProductRelatedProductCategory::NbProducts ******/
		/****** md5 signature: d3fb3a11f25e6d22373886d209506c61 ******/
		%feature("compactdefaultargs") NbProducts;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbProducts;
		Standard_Integer NbProducts();

		/****** StepBasic_ProductRelatedProductCategory::Products ******/
		/****** md5 signature: 9d0752ff7564c82fba7e6e8fcfc88dd3 ******/
		%feature("compactdefaultargs") Products;
		%feature("autodoc", "Return
-------
opencascade::handle<StepBasic_HArray1OfProduct>

Description
-----------
No available documentation.
") Products;
		opencascade::handle<StepBasic_HArray1OfProduct> Products();

		/****** StepBasic_ProductRelatedProductCategory::ProductsValue ******/
		/****** md5 signature: 706ef44651e18050a8ef958e89f82f8e ******/
		%feature("compactdefaultargs") ProductsValue;
		%feature("autodoc", "
Parameters
----------
num: int

Return
-------
opencascade::handle<StepBasic_Product>

Description
-----------
No available documentation.
") ProductsValue;
		opencascade::handle<StepBasic_Product> ProductsValue(const Standard_Integer num);

		/****** StepBasic_ProductRelatedProductCategory::SetProducts ******/
		/****** md5 signature: 46e0d45ba580b5cafb271a244155f877 ******/
		%feature("compactdefaultargs") SetProducts;
		%feature("autodoc", "
Parameters
----------
aProducts: StepBasic_HArray1OfProduct

Return
-------
None

Description
-----------
No available documentation.
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
		/****** StepBasic_RatioMeasureWithUnit::StepBasic_RatioMeasureWithUnit ******/
		/****** md5 signature: f50bd87e1b3b633b2b033958ffbefa84 ******/
		%feature("compactdefaultargs") StepBasic_RatioMeasureWithUnit;
		%feature("autodoc", "Return
-------
None

Description
-----------
Returns a RatioMeasureWithUnit.
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
		/****** StepBasic_RatioUnit::StepBasic_RatioUnit ******/
		/****** md5 signature: ee2a7f8aefd0db0114983015445e7266 ******/
		%feature("compactdefaultargs") StepBasic_RatioUnit;
		%feature("autodoc", "Return
-------
None

Description
-----------
Returns a RatioUnit.
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
		/****** StepBasic_SiUnit::StepBasic_SiUnit ******/
		/****** md5 signature: 8fa2e52ce2fdd81d8f15bd353ac893a2 ******/
		%feature("compactdefaultargs") StepBasic_SiUnit;
		%feature("autodoc", "Return
-------
None

Description
-----------
Returns a SiUnit.
") StepBasic_SiUnit;
		 StepBasic_SiUnit();

		/****** StepBasic_SiUnit::Dimensions ******/
		/****** md5 signature: 4e66912481e9ff0b706e930a9ef87093 ******/
		%feature("compactdefaultargs") Dimensions;
		%feature("autodoc", "Return
-------
opencascade::handle<StepBasic_DimensionalExponents>

Description
-----------
No available documentation.
") Dimensions;
		virtual opencascade::handle<StepBasic_DimensionalExponents> Dimensions();

		/****** StepBasic_SiUnit::HasPrefix ******/
		/****** md5 signature: c9fe6eeb510ee5d2c641117ebbb79772 ******/
		%feature("compactdefaultargs") HasPrefix;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") HasPrefix;
		Standard_Boolean HasPrefix();

		/****** StepBasic_SiUnit::Init ******/
		/****** md5 signature: ac991672766c61474098b23b82448a53 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
hasAprefix: bool
aPrefix: StepBasic_SiPrefix
aName: StepBasic_SiUnitName

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const Standard_Boolean hasAprefix, const StepBasic_SiPrefix aPrefix, const StepBasic_SiUnitName aName);

		/****** StepBasic_SiUnit::Name ******/
		/****** md5 signature: 7d79c683219f60de29d625692ad93378 ******/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "Return
-------
StepBasic_SiUnitName

Description
-----------
No available documentation.
") Name;
		StepBasic_SiUnitName Name();

		/****** StepBasic_SiUnit::Prefix ******/
		/****** md5 signature: 43b309d7a089d15118b2f153de5a9ee4 ******/
		%feature("compactdefaultargs") Prefix;
		%feature("autodoc", "Return
-------
StepBasic_SiPrefix

Description
-----------
No available documentation.
") Prefix;
		StepBasic_SiPrefix Prefix();

		/****** StepBasic_SiUnit::SetDimensions ******/
		/****** md5 signature: cf40ab4ee06b6cf12d35c11b1ac9d18f ******/
		%feature("compactdefaultargs") SetDimensions;
		%feature("autodoc", "
Parameters
----------
aDimensions: StepBasic_DimensionalExponents

Return
-------
None

Description
-----------
No available documentation.
") SetDimensions;
		virtual void SetDimensions(const opencascade::handle<StepBasic_DimensionalExponents> & aDimensions);

		/****** StepBasic_SiUnit::SetName ******/
		/****** md5 signature: fa7a6bc42d81880bdb6a51fbe91d8571 ******/
		%feature("compactdefaultargs") SetName;
		%feature("autodoc", "
Parameters
----------
aName: StepBasic_SiUnitName

Return
-------
None

Description
-----------
No available documentation.
") SetName;
		void SetName(const StepBasic_SiUnitName aName);

		/****** StepBasic_SiUnit::SetPrefix ******/
		/****** md5 signature: d5425849157ae005699d5412dbe72df6 ******/
		%feature("compactdefaultargs") SetPrefix;
		%feature("autodoc", "
Parameters
----------
aPrefix: StepBasic_SiPrefix

Return
-------
None

Description
-----------
No available documentation.
") SetPrefix;
		void SetPrefix(const StepBasic_SiPrefix aPrefix);

		/****** StepBasic_SiUnit::UnSetPrefix ******/
		/****** md5 signature: 067d31f6c09e634a148693dd9a3af4db ******/
		%feature("compactdefaultargs") UnSetPrefix;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
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
		/****** StepBasic_SolidAngleMeasureWithUnit::StepBasic_SolidAngleMeasureWithUnit ******/
		/****** md5 signature: 183eeb3822911071c3160f6ccb6f0fa4 ******/
		%feature("compactdefaultargs") StepBasic_SolidAngleMeasureWithUnit;
		%feature("autodoc", "Return
-------
None

Description
-----------
Returns a SolidAngleMeasureWithUnit.
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
		/****** StepBasic_SolidAngleUnit::StepBasic_SolidAngleUnit ******/
		/****** md5 signature: 34196cc23f91920ce2d2c7b14f2ff0cb ******/
		%feature("compactdefaultargs") StepBasic_SolidAngleUnit;
		%feature("autodoc", "Return
-------
None

Description
-----------
Returns a SolidAngleUnit.
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
		/****** StepBasic_ThermodynamicTemperatureUnit::StepBasic_ThermodynamicTemperatureUnit ******/
		/****** md5 signature: 0832e99e11a3e856fec81c41ac353073 ******/
		%feature("compactdefaultargs") StepBasic_ThermodynamicTemperatureUnit;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
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
		/****** StepBasic_TimeMeasureWithUnit::StepBasic_TimeMeasureWithUnit ******/
		/****** md5 signature: ea27f344d6994f6fb8740c5236184656 ******/
		%feature("compactdefaultargs") StepBasic_TimeMeasureWithUnit;
		%feature("autodoc", "Return
-------
None

Description
-----------
Returns a TimeMeasureWithUnit.
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
		/****** StepBasic_TimeUnit::StepBasic_TimeUnit ******/
		/****** md5 signature: 7d2fc610496bdf32605235e173784eb5 ******/
		%feature("compactdefaultargs") StepBasic_TimeUnit;
		%feature("autodoc", "Return
-------
None

Description
-----------
Returns a TimeUnit.
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
		/****** StepBasic_UncertaintyMeasureWithUnit::StepBasic_UncertaintyMeasureWithUnit ******/
		/****** md5 signature: 0c2173d45e6984b2ce6a6bd3245ae544 ******/
		%feature("compactdefaultargs") StepBasic_UncertaintyMeasureWithUnit;
		%feature("autodoc", "Return
-------
None

Description
-----------
Returns a UncertaintyMeasureWithUnit.
") StepBasic_UncertaintyMeasureWithUnit;
		 StepBasic_UncertaintyMeasureWithUnit();

		/****** StepBasic_UncertaintyMeasureWithUnit::Description ******/
		/****** md5 signature: 68309bdf9d57a000073490b39f8e7a41 ******/
		%feature("compactdefaultargs") Description;
		%feature("autodoc", "Return
-------
opencascade::handle<TCollection_HAsciiString>

Description
-----------
No available documentation.
") Description;
		opencascade::handle<TCollection_HAsciiString> Description();

		/****** StepBasic_UncertaintyMeasureWithUnit::Init ******/
		/****** md5 signature: c7b87454b746f7903790d96a011e7b8e ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
aValueComponent: StepBasic_MeasureValueMember
aUnitComponent: StepBasic_Unit
aName: TCollection_HAsciiString
aDescription: TCollection_HAsciiString

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const opencascade::handle<StepBasic_MeasureValueMember> & aValueComponent, const StepBasic_Unit & aUnitComponent, const opencascade::handle<TCollection_HAsciiString> & aName, const opencascade::handle<TCollection_HAsciiString> & aDescription);

		/****** StepBasic_UncertaintyMeasureWithUnit::Name ******/
		/****** md5 signature: 6bcb97f17b57cae0750fd29eac20499c ******/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "Return
-------
opencascade::handle<TCollection_HAsciiString>

Description
-----------
No available documentation.
") Name;
		opencascade::handle<TCollection_HAsciiString> Name();

		/****** StepBasic_UncertaintyMeasureWithUnit::SetDescription ******/
		/****** md5 signature: adddd13a906718df58a2eee683a382cf ******/
		%feature("compactdefaultargs") SetDescription;
		%feature("autodoc", "
Parameters
----------
aDescription: TCollection_HAsciiString

Return
-------
None

Description
-----------
No available documentation.
") SetDescription;
		void SetDescription(const opencascade::handle<TCollection_HAsciiString> & aDescription);

		/****** StepBasic_UncertaintyMeasureWithUnit::SetName ******/
		/****** md5 signature: 1e0b00d9eb163c8a0cdbb986e2ee24f6 ******/
		%feature("compactdefaultargs") SetName;
		%feature("autodoc", "
Parameters
----------
aName: TCollection_HAsciiString

Return
-------
None

Description
-----------
No available documentation.
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
		/****** StepBasic_VolumeUnit::StepBasic_VolumeUnit ******/
		/****** md5 signature: 492db89824fdf1ec433948c3274d510b ******/
		%feature("compactdefaultargs") StepBasic_VolumeUnit;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
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
		/****** StepBasic_WeekOfYearAndDayDate::StepBasic_WeekOfYearAndDayDate ******/
		/****** md5 signature: bd7336b94f06d31a71ae92cb76f3c7a5 ******/
		%feature("compactdefaultargs") StepBasic_WeekOfYearAndDayDate;
		%feature("autodoc", "Return
-------
None

Description
-----------
Returns a WeekOfYearAndDayDate.
") StepBasic_WeekOfYearAndDayDate;
		 StepBasic_WeekOfYearAndDayDate();

		/****** StepBasic_WeekOfYearAndDayDate::DayComponent ******/
		/****** md5 signature: 3ca7721e5937e191f94c2f5ecee1c9a8 ******/
		%feature("compactdefaultargs") DayComponent;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") DayComponent;
		Standard_Integer DayComponent();

		/****** StepBasic_WeekOfYearAndDayDate::HasDayComponent ******/
		/****** md5 signature: 533707411dd29de84b7bcec81e4200ca ******/
		%feature("compactdefaultargs") HasDayComponent;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") HasDayComponent;
		Standard_Boolean HasDayComponent();

		/****** StepBasic_WeekOfYearAndDayDate::Init ******/
		/****** md5 signature: d2eb3140c7e43ebfa84f6193d90beef8 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
aYearComponent: int
aWeekComponent: int
hasAdayComponent: bool
aDayComponent: int

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const Standard_Integer aYearComponent, const Standard_Integer aWeekComponent, const Standard_Boolean hasAdayComponent, const Standard_Integer aDayComponent);

		/****** StepBasic_WeekOfYearAndDayDate::SetDayComponent ******/
		/****** md5 signature: 599666a06025a8440c3915e142f8559a ******/
		%feature("compactdefaultargs") SetDayComponent;
		%feature("autodoc", "
Parameters
----------
aDayComponent: int

Return
-------
None

Description
-----------
No available documentation.
") SetDayComponent;
		void SetDayComponent(const Standard_Integer aDayComponent);

		/****** StepBasic_WeekOfYearAndDayDate::SetWeekComponent ******/
		/****** md5 signature: 3bbdbe7ae3fa90362f414a9ecbed9ae2 ******/
		%feature("compactdefaultargs") SetWeekComponent;
		%feature("autodoc", "
Parameters
----------
aWeekComponent: int

Return
-------
None

Description
-----------
No available documentation.
") SetWeekComponent;
		void SetWeekComponent(const Standard_Integer aWeekComponent);

		/****** StepBasic_WeekOfYearAndDayDate::UnSetDayComponent ******/
		/****** md5 signature: 477eb6ed8099002592cc1ac15492f31f ******/
		%feature("compactdefaultargs") UnSetDayComponent;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") UnSetDayComponent;
		void UnSetDayComponent();

		/****** StepBasic_WeekOfYearAndDayDate::WeekComponent ******/
		/****** md5 signature: c2fc4618a34dee968234360833c574fc ******/
		%feature("compactdefaultargs") WeekComponent;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
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
		/****** StepBasic_ConversionBasedUnitAndAreaUnit::StepBasic_ConversionBasedUnitAndAreaUnit ******/
		/****** md5 signature: a91b85c737c77f77bc93d967ab74e91d ******/
		%feature("compactdefaultargs") StepBasic_ConversionBasedUnitAndAreaUnit;
		%feature("autodoc", "Return
-------
None

Description
-----------
Returns a ConversionBasedUnitAndAreaUnit.
") StepBasic_ConversionBasedUnitAndAreaUnit;
		 StepBasic_ConversionBasedUnitAndAreaUnit();

		/****** StepBasic_ConversionBasedUnitAndAreaUnit::AreaUnit ******/
		/****** md5 signature: d485061b37edb50280520994da0eb27a ******/
		%feature("compactdefaultargs") AreaUnit;
		%feature("autodoc", "Return
-------
opencascade::handle<StepBasic_AreaUnit>

Description
-----------
No available documentation.
") AreaUnit;
		opencascade::handle<StepBasic_AreaUnit> AreaUnit();

		/****** StepBasic_ConversionBasedUnitAndAreaUnit::SetAreaUnit ******/
		/****** md5 signature: bcc9362838dbda4feab81b0202cb4b87 ******/
		%feature("compactdefaultargs") SetAreaUnit;
		%feature("autodoc", "
Parameters
----------
anAreaUnit: StepBasic_AreaUnit

Return
-------
None

Description
-----------
No available documentation.
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
		/****** StepBasic_ConversionBasedUnitAndLengthUnit::StepBasic_ConversionBasedUnitAndLengthUnit ******/
		/****** md5 signature: 8fa6c46a9b97b6cdfdc010a0bc71c55f ******/
		%feature("compactdefaultargs") StepBasic_ConversionBasedUnitAndLengthUnit;
		%feature("autodoc", "Return
-------
None

Description
-----------
Returns a ConversionBasedUnitAndLengthUnit.
") StepBasic_ConversionBasedUnitAndLengthUnit;
		 StepBasic_ConversionBasedUnitAndLengthUnit();

		/****** StepBasic_ConversionBasedUnitAndLengthUnit::Init ******/
		/****** md5 signature: 230b648890e9efa5eef6d2d214b37499 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
aDimensions: StepBasic_DimensionalExponents
aName: TCollection_HAsciiString
aConversionFactor: StepBasic_MeasureWithUnit

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const opencascade::handle<StepBasic_DimensionalExponents> & aDimensions, const opencascade::handle<TCollection_HAsciiString> & aName, const opencascade::handle<StepBasic_MeasureWithUnit> & aConversionFactor);

		/****** StepBasic_ConversionBasedUnitAndLengthUnit::LengthUnit ******/
		/****** md5 signature: 2db2c3654e5bf9a37de3c8d0f7db7897 ******/
		%feature("compactdefaultargs") LengthUnit;
		%feature("autodoc", "Return
-------
opencascade::handle<StepBasic_LengthUnit>

Description
-----------
No available documentation.
") LengthUnit;
		opencascade::handle<StepBasic_LengthUnit> LengthUnit();

		/****** StepBasic_ConversionBasedUnitAndLengthUnit::SetLengthUnit ******/
		/****** md5 signature: e91cf8285eef4652d6b5fbfc71b7567a ******/
		%feature("compactdefaultargs") SetLengthUnit;
		%feature("autodoc", "
Parameters
----------
aLengthUnit: StepBasic_LengthUnit

Return
-------
None

Description
-----------
No available documentation.
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
		/****** StepBasic_ConversionBasedUnitAndMassUnit::StepBasic_ConversionBasedUnitAndMassUnit ******/
		/****** md5 signature: dad0a4a30f2bd3ab3fea56582a4f1e3d ******/
		%feature("compactdefaultargs") StepBasic_ConversionBasedUnitAndMassUnit;
		%feature("autodoc", "Return
-------
None

Description
-----------
Returns a ConversionBasedUnitAndLengthUnit.
") StepBasic_ConversionBasedUnitAndMassUnit;
		 StepBasic_ConversionBasedUnitAndMassUnit();

		/****** StepBasic_ConversionBasedUnitAndMassUnit::Init ******/
		/****** md5 signature: 230b648890e9efa5eef6d2d214b37499 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
aDimensions: StepBasic_DimensionalExponents
aName: TCollection_HAsciiString
aConversionFactor: StepBasic_MeasureWithUnit

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const opencascade::handle<StepBasic_DimensionalExponents> & aDimensions, const opencascade::handle<TCollection_HAsciiString> & aName, const opencascade::handle<StepBasic_MeasureWithUnit> & aConversionFactor);

		/****** StepBasic_ConversionBasedUnitAndMassUnit::MassUnit ******/
		/****** md5 signature: 8f52f5dd4adce065cde920b4bac228d3 ******/
		%feature("compactdefaultargs") MassUnit;
		%feature("autodoc", "Return
-------
opencascade::handle<StepBasic_MassUnit>

Description
-----------
No available documentation.
") MassUnit;
		opencascade::handle<StepBasic_MassUnit> MassUnit();

		/****** StepBasic_ConversionBasedUnitAndMassUnit::SetMassUnit ******/
		/****** md5 signature: 8228b68efbc2a6d1036478c9742cd241 ******/
		%feature("compactdefaultargs") SetMassUnit;
		%feature("autodoc", "
Parameters
----------
aMassUnit: StepBasic_MassUnit

Return
-------
None

Description
-----------
No available documentation.
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
		/****** StepBasic_ConversionBasedUnitAndPlaneAngleUnit::StepBasic_ConversionBasedUnitAndPlaneAngleUnit ******/
		/****** md5 signature: 4b2d263f8590ca3ceb698c615bdd0f78 ******/
		%feature("compactdefaultargs") StepBasic_ConversionBasedUnitAndPlaneAngleUnit;
		%feature("autodoc", "Return
-------
None

Description
-----------
Returns a ConversionBasedUnitAndPlaneAngleUnit.
") StepBasic_ConversionBasedUnitAndPlaneAngleUnit;
		 StepBasic_ConversionBasedUnitAndPlaneAngleUnit();

		/****** StepBasic_ConversionBasedUnitAndPlaneAngleUnit::Init ******/
		/****** md5 signature: 230b648890e9efa5eef6d2d214b37499 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
aDimensions: StepBasic_DimensionalExponents
aName: TCollection_HAsciiString
aConversionFactor: StepBasic_MeasureWithUnit

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const opencascade::handle<StepBasic_DimensionalExponents> & aDimensions, const opencascade::handle<TCollection_HAsciiString> & aName, const opencascade::handle<StepBasic_MeasureWithUnit> & aConversionFactor);

		/****** StepBasic_ConversionBasedUnitAndPlaneAngleUnit::PlaneAngleUnit ******/
		/****** md5 signature: c451c5e50d87ed7994edb7e363d54856 ******/
		%feature("compactdefaultargs") PlaneAngleUnit;
		%feature("autodoc", "Return
-------
opencascade::handle<StepBasic_PlaneAngleUnit>

Description
-----------
No available documentation.
") PlaneAngleUnit;
		opencascade::handle<StepBasic_PlaneAngleUnit> PlaneAngleUnit();

		/****** StepBasic_ConversionBasedUnitAndPlaneAngleUnit::SetPlaneAngleUnit ******/
		/****** md5 signature: cfc527c916a6ffff2f8a17f53493f286 ******/
		%feature("compactdefaultargs") SetPlaneAngleUnit;
		%feature("autodoc", "
Parameters
----------
aPlaneAngleUnit: StepBasic_PlaneAngleUnit

Return
-------
None

Description
-----------
No available documentation.
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
		/****** StepBasic_ConversionBasedUnitAndRatioUnit::StepBasic_ConversionBasedUnitAndRatioUnit ******/
		/****** md5 signature: d8609a05d2ae804eed763fa9b047b7e5 ******/
		%feature("compactdefaultargs") StepBasic_ConversionBasedUnitAndRatioUnit;
		%feature("autodoc", "Return
-------
None

Description
-----------
Returns a ConversionBasedUnitAndRatioUnit.
") StepBasic_ConversionBasedUnitAndRatioUnit;
		 StepBasic_ConversionBasedUnitAndRatioUnit();

		/****** StepBasic_ConversionBasedUnitAndRatioUnit::Init ******/
		/****** md5 signature: 230b648890e9efa5eef6d2d214b37499 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
aDimensions: StepBasic_DimensionalExponents
aName: TCollection_HAsciiString
aConversionFactor: StepBasic_MeasureWithUnit

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const opencascade::handle<StepBasic_DimensionalExponents> & aDimensions, const opencascade::handle<TCollection_HAsciiString> & aName, const opencascade::handle<StepBasic_MeasureWithUnit> & aConversionFactor);

		/****** StepBasic_ConversionBasedUnitAndRatioUnit::RatioUnit ******/
		/****** md5 signature: 65e9c38c2c1f03c50c41fb636fcbfb0d ******/
		%feature("compactdefaultargs") RatioUnit;
		%feature("autodoc", "Return
-------
opencascade::handle<StepBasic_RatioUnit>

Description
-----------
No available documentation.
") RatioUnit;
		opencascade::handle<StepBasic_RatioUnit> RatioUnit();

		/****** StepBasic_ConversionBasedUnitAndRatioUnit::SetRatioUnit ******/
		/****** md5 signature: 23fd5e72198ee9c38126d80c90e47203 ******/
		%feature("compactdefaultargs") SetRatioUnit;
		%feature("autodoc", "
Parameters
----------
aRatioUnit: StepBasic_RatioUnit

Return
-------
None

Description
-----------
No available documentation.
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
		/****** StepBasic_ConversionBasedUnitAndSolidAngleUnit::StepBasic_ConversionBasedUnitAndSolidAngleUnit ******/
		/****** md5 signature: c2ca84dd5c37c3dbe0d0a8e0fada9204 ******/
		%feature("compactdefaultargs") StepBasic_ConversionBasedUnitAndSolidAngleUnit;
		%feature("autodoc", "Return
-------
None

Description
-----------
Returns a ConversionBasedUnitAndSolidAngleUnit.
") StepBasic_ConversionBasedUnitAndSolidAngleUnit;
		 StepBasic_ConversionBasedUnitAndSolidAngleUnit();

		/****** StepBasic_ConversionBasedUnitAndSolidAngleUnit::Init ******/
		/****** md5 signature: 230b648890e9efa5eef6d2d214b37499 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
aDimensions: StepBasic_DimensionalExponents
aName: TCollection_HAsciiString
aConversionFactor: StepBasic_MeasureWithUnit

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const opencascade::handle<StepBasic_DimensionalExponents> & aDimensions, const opencascade::handle<TCollection_HAsciiString> & aName, const opencascade::handle<StepBasic_MeasureWithUnit> & aConversionFactor);

		/****** StepBasic_ConversionBasedUnitAndSolidAngleUnit::SetSolidAngleUnit ******/
		/****** md5 signature: 94c3a931d88e3ee135dcba816533aced ******/
		%feature("compactdefaultargs") SetSolidAngleUnit;
		%feature("autodoc", "
Parameters
----------
aSolidAngleUnit: StepBasic_SolidAngleUnit

Return
-------
None

Description
-----------
No available documentation.
") SetSolidAngleUnit;
		void SetSolidAngleUnit(const opencascade::handle<StepBasic_SolidAngleUnit> & aSolidAngleUnit);

		/****** StepBasic_ConversionBasedUnitAndSolidAngleUnit::SolidAngleUnit ******/
		/****** md5 signature: 52e7ccf5308a5448649dceb98d85ff8c ******/
		%feature("compactdefaultargs") SolidAngleUnit;
		%feature("autodoc", "Return
-------
opencascade::handle<StepBasic_SolidAngleUnit>

Description
-----------
No available documentation.
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
		/****** StepBasic_ConversionBasedUnitAndTimeUnit::StepBasic_ConversionBasedUnitAndTimeUnit ******/
		/****** md5 signature: 8b25fdf066619a39fdba971a9840a96b ******/
		%feature("compactdefaultargs") StepBasic_ConversionBasedUnitAndTimeUnit;
		%feature("autodoc", "Return
-------
None

Description
-----------
Returns a ConversionBasedUnitAndTimeUnit.
") StepBasic_ConversionBasedUnitAndTimeUnit;
		 StepBasic_ConversionBasedUnitAndTimeUnit();

		/****** StepBasic_ConversionBasedUnitAndTimeUnit::Init ******/
		/****** md5 signature: 230b648890e9efa5eef6d2d214b37499 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
aDimensions: StepBasic_DimensionalExponents
aName: TCollection_HAsciiString
aConversionFactor: StepBasic_MeasureWithUnit

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const opencascade::handle<StepBasic_DimensionalExponents> & aDimensions, const opencascade::handle<TCollection_HAsciiString> & aName, const opencascade::handle<StepBasic_MeasureWithUnit> & aConversionFactor);

		/****** StepBasic_ConversionBasedUnitAndTimeUnit::SetTimeUnit ******/
		/****** md5 signature: 41cd2c45dcbccffbdebbe64293606ffd ******/
		%feature("compactdefaultargs") SetTimeUnit;
		%feature("autodoc", "
Parameters
----------
aTimeUnit: StepBasic_TimeUnit

Return
-------
None

Description
-----------
No available documentation.
") SetTimeUnit;
		void SetTimeUnit(const opencascade::handle<StepBasic_TimeUnit> & aTimeUnit);

		/****** StepBasic_ConversionBasedUnitAndTimeUnit::TimeUnit ******/
		/****** md5 signature: f7cc1bca9ec2fbc662256c773469e3cc ******/
		%feature("compactdefaultargs") TimeUnit;
		%feature("autodoc", "Return
-------
opencascade::handle<StepBasic_TimeUnit>

Description
-----------
No available documentation.
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
		/****** StepBasic_ConversionBasedUnitAndVolumeUnit::StepBasic_ConversionBasedUnitAndVolumeUnit ******/
		/****** md5 signature: c4a2f1137307040b73a49cd18b358447 ******/
		%feature("compactdefaultargs") StepBasic_ConversionBasedUnitAndVolumeUnit;
		%feature("autodoc", "Return
-------
None

Description
-----------
Returns a ConversionBasedUnitAndVolumeUnit.
") StepBasic_ConversionBasedUnitAndVolumeUnit;
		 StepBasic_ConversionBasedUnitAndVolumeUnit();

		/****** StepBasic_ConversionBasedUnitAndVolumeUnit::SetVolumeUnit ******/
		/****** md5 signature: 4612612e1947e04cc0950fb433f9b842 ******/
		%feature("compactdefaultargs") SetVolumeUnit;
		%feature("autodoc", "
Parameters
----------
aVolumeUnit: StepBasic_VolumeUnit

Return
-------
None

Description
-----------
No available documentation.
") SetVolumeUnit;
		void SetVolumeUnit(const opencascade::handle<StepBasic_VolumeUnit> & aVolumeUnit);

		/****** StepBasic_ConversionBasedUnitAndVolumeUnit::VolumeUnit ******/
		/****** md5 signature: 89d628c097da697d597a399ee0b08b7c ******/
		%feature("compactdefaultargs") VolumeUnit;
		%feature("autodoc", "Return
-------
opencascade::handle<StepBasic_VolumeUnit>

Description
-----------
No available documentation.
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
		/****** StepBasic_DesignContext::StepBasic_DesignContext ******/
		/****** md5 signature: 5cefd36ac71f2641a2fd3209d84a61bc ******/
		%feature("compactdefaultargs") StepBasic_DesignContext;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
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
		/****** StepBasic_MechanicalContext::StepBasic_MechanicalContext ******/
		/****** md5 signature: 7e120c0ecc52172e18c780742796bbbb ******/
		%feature("compactdefaultargs") StepBasic_MechanicalContext;
		%feature("autodoc", "Return
-------
None

Description
-----------
Returns a MechanicalContext.
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
		/****** StepBasic_ProductType::StepBasic_ProductType ******/
		/****** md5 signature: 6f10abed2030d802d257c80994c4e1cb ******/
		%feature("compactdefaultargs") StepBasic_ProductType;
		%feature("autodoc", "Return
-------
None

Description
-----------
Returns a ProductType.
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
		/****** StepBasic_SiUnitAndAreaUnit::StepBasic_SiUnitAndAreaUnit ******/
		/****** md5 signature: 9a2b0b7c721758be6c6077db53a2e229 ******/
		%feature("compactdefaultargs") StepBasic_SiUnitAndAreaUnit;
		%feature("autodoc", "Return
-------
None

Description
-----------
Returns a SiUnitAndAreaUnit.
") StepBasic_SiUnitAndAreaUnit;
		 StepBasic_SiUnitAndAreaUnit();

		/****** StepBasic_SiUnitAndAreaUnit::AreaUnit ******/
		/****** md5 signature: d485061b37edb50280520994da0eb27a ******/
		%feature("compactdefaultargs") AreaUnit;
		%feature("autodoc", "Return
-------
opencascade::handle<StepBasic_AreaUnit>

Description
-----------
No available documentation.
") AreaUnit;
		opencascade::handle<StepBasic_AreaUnit> AreaUnit();

		/****** StepBasic_SiUnitAndAreaUnit::SetAreaUnit ******/
		/****** md5 signature: bcc9362838dbda4feab81b0202cb4b87 ******/
		%feature("compactdefaultargs") SetAreaUnit;
		%feature("autodoc", "
Parameters
----------
anAreaUnit: StepBasic_AreaUnit

Return
-------
None

Description
-----------
No available documentation.
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
		/****** StepBasic_SiUnitAndLengthUnit::StepBasic_SiUnitAndLengthUnit ******/
		/****** md5 signature: 6b0075650602cbd65a22473fdd5d81a3 ******/
		%feature("compactdefaultargs") StepBasic_SiUnitAndLengthUnit;
		%feature("autodoc", "Return
-------
None

Description
-----------
Returns a SiUnitAndLengthUnit.
") StepBasic_SiUnitAndLengthUnit;
		 StepBasic_SiUnitAndLengthUnit();

		/****** StepBasic_SiUnitAndLengthUnit::Init ******/
		/****** md5 signature: ac991672766c61474098b23b82448a53 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
hasAprefix: bool
aPrefix: StepBasic_SiPrefix
aName: StepBasic_SiUnitName

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const Standard_Boolean hasAprefix, const StepBasic_SiPrefix aPrefix, const StepBasic_SiUnitName aName);

		/****** StepBasic_SiUnitAndLengthUnit::LengthUnit ******/
		/****** md5 signature: 2db2c3654e5bf9a37de3c8d0f7db7897 ******/
		%feature("compactdefaultargs") LengthUnit;
		%feature("autodoc", "Return
-------
opencascade::handle<StepBasic_LengthUnit>

Description
-----------
No available documentation.
") LengthUnit;
		opencascade::handle<StepBasic_LengthUnit> LengthUnit();

		/****** StepBasic_SiUnitAndLengthUnit::SetLengthUnit ******/
		/****** md5 signature: e91cf8285eef4652d6b5fbfc71b7567a ******/
		%feature("compactdefaultargs") SetLengthUnit;
		%feature("autodoc", "
Parameters
----------
aLengthUnit: StepBasic_LengthUnit

Return
-------
None

Description
-----------
No available documentation.
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
		/****** StepBasic_SiUnitAndMassUnit::StepBasic_SiUnitAndMassUnit ******/
		/****** md5 signature: ca1615bc9775ede91a951cf6babc8001 ******/
		%feature("compactdefaultargs") StepBasic_SiUnitAndMassUnit;
		%feature("autodoc", "Return
-------
None

Description
-----------
Returns a SiUnitAndMassUnit.
") StepBasic_SiUnitAndMassUnit;
		 StepBasic_SiUnitAndMassUnit();

		/****** StepBasic_SiUnitAndMassUnit::Init ******/
		/****** md5 signature: ac991672766c61474098b23b82448a53 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
hasAprefix: bool
aPrefix: StepBasic_SiPrefix
aName: StepBasic_SiUnitName

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const Standard_Boolean hasAprefix, const StepBasic_SiPrefix aPrefix, const StepBasic_SiUnitName aName);

		/****** StepBasic_SiUnitAndMassUnit::MassUnit ******/
		/****** md5 signature: 8f52f5dd4adce065cde920b4bac228d3 ******/
		%feature("compactdefaultargs") MassUnit;
		%feature("autodoc", "Return
-------
opencascade::handle<StepBasic_MassUnit>

Description
-----------
No available documentation.
") MassUnit;
		opencascade::handle<StepBasic_MassUnit> MassUnit();

		/****** StepBasic_SiUnitAndMassUnit::SetMassUnit ******/
		/****** md5 signature: 8228b68efbc2a6d1036478c9742cd241 ******/
		%feature("compactdefaultargs") SetMassUnit;
		%feature("autodoc", "
Parameters
----------
aMassUnit: StepBasic_MassUnit

Return
-------
None

Description
-----------
No available documentation.
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
		/****** StepBasic_SiUnitAndPlaneAngleUnit::StepBasic_SiUnitAndPlaneAngleUnit ******/
		/****** md5 signature: 2cd0de9aa9ac0113ecbac3fbb63985e9 ******/
		%feature("compactdefaultargs") StepBasic_SiUnitAndPlaneAngleUnit;
		%feature("autodoc", "Return
-------
None

Description
-----------
Returns a SiUnitAndPlaneAngleUnit.
") StepBasic_SiUnitAndPlaneAngleUnit;
		 StepBasic_SiUnitAndPlaneAngleUnit();

		/****** StepBasic_SiUnitAndPlaneAngleUnit::Init ******/
		/****** md5 signature: ac991672766c61474098b23b82448a53 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
hasAprefix: bool
aPrefix: StepBasic_SiPrefix
aName: StepBasic_SiUnitName

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const Standard_Boolean hasAprefix, const StepBasic_SiPrefix aPrefix, const StepBasic_SiUnitName aName);

		/****** StepBasic_SiUnitAndPlaneAngleUnit::PlaneAngleUnit ******/
		/****** md5 signature: c451c5e50d87ed7994edb7e363d54856 ******/
		%feature("compactdefaultargs") PlaneAngleUnit;
		%feature("autodoc", "Return
-------
opencascade::handle<StepBasic_PlaneAngleUnit>

Description
-----------
No available documentation.
") PlaneAngleUnit;
		opencascade::handle<StepBasic_PlaneAngleUnit> PlaneAngleUnit();

		/****** StepBasic_SiUnitAndPlaneAngleUnit::SetPlaneAngleUnit ******/
		/****** md5 signature: cfc527c916a6ffff2f8a17f53493f286 ******/
		%feature("compactdefaultargs") SetPlaneAngleUnit;
		%feature("autodoc", "
Parameters
----------
aPlaneAngleUnit: StepBasic_PlaneAngleUnit

Return
-------
None

Description
-----------
No available documentation.
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
		/****** StepBasic_SiUnitAndRatioUnit::StepBasic_SiUnitAndRatioUnit ******/
		/****** md5 signature: a0dd49546670118e661cfb57451acf0c ******/
		%feature("compactdefaultargs") StepBasic_SiUnitAndRatioUnit;
		%feature("autodoc", "Return
-------
None

Description
-----------
Returns a SiUnitAndRatioUnit.
") StepBasic_SiUnitAndRatioUnit;
		 StepBasic_SiUnitAndRatioUnit();

		/****** StepBasic_SiUnitAndRatioUnit::Init ******/
		/****** md5 signature: ac991672766c61474098b23b82448a53 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
hasAprefix: bool
aPrefix: StepBasic_SiPrefix
aName: StepBasic_SiUnitName

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const Standard_Boolean hasAprefix, const StepBasic_SiPrefix aPrefix, const StepBasic_SiUnitName aName);

		/****** StepBasic_SiUnitAndRatioUnit::RatioUnit ******/
		/****** md5 signature: 65e9c38c2c1f03c50c41fb636fcbfb0d ******/
		%feature("compactdefaultargs") RatioUnit;
		%feature("autodoc", "Return
-------
opencascade::handle<StepBasic_RatioUnit>

Description
-----------
No available documentation.
") RatioUnit;
		opencascade::handle<StepBasic_RatioUnit> RatioUnit();

		/****** StepBasic_SiUnitAndRatioUnit::SetRatioUnit ******/
		/****** md5 signature: 23fd5e72198ee9c38126d80c90e47203 ******/
		%feature("compactdefaultargs") SetRatioUnit;
		%feature("autodoc", "
Parameters
----------
aRatioUnit: StepBasic_RatioUnit

Return
-------
None

Description
-----------
No available documentation.
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
		/****** StepBasic_SiUnitAndSolidAngleUnit::StepBasic_SiUnitAndSolidAngleUnit ******/
		/****** md5 signature: 96deab0a7e230d3cee4f1e31c856da2e ******/
		%feature("compactdefaultargs") StepBasic_SiUnitAndSolidAngleUnit;
		%feature("autodoc", "Return
-------
None

Description
-----------
Returns a SiUnitAndSolidAngleUnit.
") StepBasic_SiUnitAndSolidAngleUnit;
		 StepBasic_SiUnitAndSolidAngleUnit();

		/****** StepBasic_SiUnitAndSolidAngleUnit::Init ******/
		/****** md5 signature: ac991672766c61474098b23b82448a53 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
hasAprefix: bool
aPrefix: StepBasic_SiPrefix
aName: StepBasic_SiUnitName

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const Standard_Boolean hasAprefix, const StepBasic_SiPrefix aPrefix, const StepBasic_SiUnitName aName);

		/****** StepBasic_SiUnitAndSolidAngleUnit::SetSolidAngleUnit ******/
		/****** md5 signature: 94c3a931d88e3ee135dcba816533aced ******/
		%feature("compactdefaultargs") SetSolidAngleUnit;
		%feature("autodoc", "
Parameters
----------
aSolidAngleUnit: StepBasic_SolidAngleUnit

Return
-------
None

Description
-----------
No available documentation.
") SetSolidAngleUnit;
		void SetSolidAngleUnit(const opencascade::handle<StepBasic_SolidAngleUnit> & aSolidAngleUnit);

		/****** StepBasic_SiUnitAndSolidAngleUnit::SolidAngleUnit ******/
		/****** md5 signature: 52e7ccf5308a5448649dceb98d85ff8c ******/
		%feature("compactdefaultargs") SolidAngleUnit;
		%feature("autodoc", "Return
-------
opencascade::handle<StepBasic_SolidAngleUnit>

Description
-----------
No available documentation.
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
		/****** StepBasic_SiUnitAndThermodynamicTemperatureUnit::StepBasic_SiUnitAndThermodynamicTemperatureUnit ******/
		/****** md5 signature: 3ebf871df4c080650f1dd451c1c3ccb6 ******/
		%feature("compactdefaultargs") StepBasic_SiUnitAndThermodynamicTemperatureUnit;
		%feature("autodoc", "Return
-------
None

Description
-----------
Returns a SiUnitAndThermodynamicTemperatureUnit.
") StepBasic_SiUnitAndThermodynamicTemperatureUnit;
		 StepBasic_SiUnitAndThermodynamicTemperatureUnit();

		/****** StepBasic_SiUnitAndThermodynamicTemperatureUnit::Init ******/
		/****** md5 signature: ac991672766c61474098b23b82448a53 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
hasAprefix: bool
aPrefix: StepBasic_SiPrefix
aName: StepBasic_SiUnitName

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const Standard_Boolean hasAprefix, const StepBasic_SiPrefix aPrefix, const StepBasic_SiUnitName aName);

		/****** StepBasic_SiUnitAndThermodynamicTemperatureUnit::SetThermodynamicTemperatureUnit ******/
		/****** md5 signature: 51cb78d655946e860407f20bb0bf1376 ******/
		%feature("compactdefaultargs") SetThermodynamicTemperatureUnit;
		%feature("autodoc", "
Parameters
----------
aThermodynamicTemperatureUnit: StepBasic_ThermodynamicTemperatureUnit

Return
-------
None

Description
-----------
No available documentation.
") SetThermodynamicTemperatureUnit;
		void SetThermodynamicTemperatureUnit(const opencascade::handle<StepBasic_ThermodynamicTemperatureUnit> & aThermodynamicTemperatureUnit);

		/****** StepBasic_SiUnitAndThermodynamicTemperatureUnit::ThermodynamicTemperatureUnit ******/
		/****** md5 signature: 9d03ef1294a54a278f7a31aac36c39c8 ******/
		%feature("compactdefaultargs") ThermodynamicTemperatureUnit;
		%feature("autodoc", "Return
-------
opencascade::handle<StepBasic_ThermodynamicTemperatureUnit>

Description
-----------
No available documentation.
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
		/****** StepBasic_SiUnitAndTimeUnit::StepBasic_SiUnitAndTimeUnit ******/
		/****** md5 signature: 9e0b3b1855b611e5d28073567050e4a6 ******/
		%feature("compactdefaultargs") StepBasic_SiUnitAndTimeUnit;
		%feature("autodoc", "Return
-------
None

Description
-----------
Returns a SiUnitAndTimeUnit.
") StepBasic_SiUnitAndTimeUnit;
		 StepBasic_SiUnitAndTimeUnit();

		/****** StepBasic_SiUnitAndTimeUnit::Init ******/
		/****** md5 signature: ac991672766c61474098b23b82448a53 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
hasAprefix: bool
aPrefix: StepBasic_SiPrefix
aName: StepBasic_SiUnitName

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const Standard_Boolean hasAprefix, const StepBasic_SiPrefix aPrefix, const StepBasic_SiUnitName aName);

		/****** StepBasic_SiUnitAndTimeUnit::SetTimeUnit ******/
		/****** md5 signature: 41cd2c45dcbccffbdebbe64293606ffd ******/
		%feature("compactdefaultargs") SetTimeUnit;
		%feature("autodoc", "
Parameters
----------
aTimeUnit: StepBasic_TimeUnit

Return
-------
None

Description
-----------
No available documentation.
") SetTimeUnit;
		void SetTimeUnit(const opencascade::handle<StepBasic_TimeUnit> & aTimeUnit);

		/****** StepBasic_SiUnitAndTimeUnit::TimeUnit ******/
		/****** md5 signature: f7cc1bca9ec2fbc662256c773469e3cc ******/
		%feature("compactdefaultargs") TimeUnit;
		%feature("autodoc", "Return
-------
opencascade::handle<StepBasic_TimeUnit>

Description
-----------
No available documentation.
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
		/****** StepBasic_SiUnitAndVolumeUnit::StepBasic_SiUnitAndVolumeUnit ******/
		/****** md5 signature: 1b773defcb4cb62c69c289209875dab4 ******/
		%feature("compactdefaultargs") StepBasic_SiUnitAndVolumeUnit;
		%feature("autodoc", "Return
-------
None

Description
-----------
Returns a SiUnitAndVolumeUnit.
") StepBasic_SiUnitAndVolumeUnit;
		 StepBasic_SiUnitAndVolumeUnit();

		/****** StepBasic_SiUnitAndVolumeUnit::SetVolumeUnit ******/
		/****** md5 signature: 4612612e1947e04cc0950fb433f9b842 ******/
		%feature("compactdefaultargs") SetVolumeUnit;
		%feature("autodoc", "
Parameters
----------
aVolumeUnit: StepBasic_VolumeUnit

Return
-------
None

Description
-----------
No available documentation.
") SetVolumeUnit;
		void SetVolumeUnit(const opencascade::handle<StepBasic_VolumeUnit> & aVolumeUnit);

		/****** StepBasic_SiUnitAndVolumeUnit::VolumeUnit ******/
		/****** md5 signature: 89d628c097da697d597a399ee0b08b7c ******/
		%feature("compactdefaultargs") VolumeUnit;
		%feature("autodoc", "Return
-------
opencascade::handle<StepBasic_VolumeUnit>

Description
-----------
No available documentation.
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

class StepBasic_HArray1OfApproval : public StepBasic_Array1OfApproval, public Standard_Transient {
  public:
    StepBasic_HArray1OfApproval(const Standard_Integer theLower, const Standard_Integer theUpper);
    StepBasic_HArray1OfApproval(const Standard_Integer theLower, const Standard_Integer theUpper, const StepBasic_Array1OfApproval::value_type& theValue);
    StepBasic_HArray1OfApproval(const StepBasic_Array1OfApproval& theOther);
    const StepBasic_Array1OfApproval& Array1();
    StepBasic_Array1OfApproval& ChangeArray1();
};
%make_alias(StepBasic_HArray1OfApproval)


class StepBasic_HArray1OfDerivedUnitElement : public StepBasic_Array1OfDerivedUnitElement, public Standard_Transient {
  public:
    StepBasic_HArray1OfDerivedUnitElement(const Standard_Integer theLower, const Standard_Integer theUpper);
    StepBasic_HArray1OfDerivedUnitElement(const Standard_Integer theLower, const Standard_Integer theUpper, const StepBasic_Array1OfDerivedUnitElement::value_type& theValue);
    StepBasic_HArray1OfDerivedUnitElement(const StepBasic_Array1OfDerivedUnitElement& theOther);
    const StepBasic_Array1OfDerivedUnitElement& Array1();
    StepBasic_Array1OfDerivedUnitElement& ChangeArray1();
};
%make_alias(StepBasic_HArray1OfDerivedUnitElement)


class StepBasic_HArray1OfDocument : public StepBasic_Array1OfDocument, public Standard_Transient {
  public:
    StepBasic_HArray1OfDocument(const Standard_Integer theLower, const Standard_Integer theUpper);
    StepBasic_HArray1OfDocument(const Standard_Integer theLower, const Standard_Integer theUpper, const StepBasic_Array1OfDocument::value_type& theValue);
    StepBasic_HArray1OfDocument(const StepBasic_Array1OfDocument& theOther);
    const StepBasic_Array1OfDocument& Array1();
    StepBasic_Array1OfDocument& ChangeArray1();
};
%make_alias(StepBasic_HArray1OfDocument)


class StepBasic_HArray1OfNamedUnit : public StepBasic_Array1OfNamedUnit, public Standard_Transient {
  public:
    StepBasic_HArray1OfNamedUnit(const Standard_Integer theLower, const Standard_Integer theUpper);
    StepBasic_HArray1OfNamedUnit(const Standard_Integer theLower, const Standard_Integer theUpper, const StepBasic_Array1OfNamedUnit::value_type& theValue);
    StepBasic_HArray1OfNamedUnit(const StepBasic_Array1OfNamedUnit& theOther);
    const StepBasic_Array1OfNamedUnit& Array1();
    StepBasic_Array1OfNamedUnit& ChangeArray1();
};
%make_alias(StepBasic_HArray1OfNamedUnit)


class StepBasic_HArray1OfOrganization : public StepBasic_Array1OfOrganization, public Standard_Transient {
  public:
    StepBasic_HArray1OfOrganization(const Standard_Integer theLower, const Standard_Integer theUpper);
    StepBasic_HArray1OfOrganization(const Standard_Integer theLower, const Standard_Integer theUpper, const StepBasic_Array1OfOrganization::value_type& theValue);
    StepBasic_HArray1OfOrganization(const StepBasic_Array1OfOrganization& theOther);
    const StepBasic_Array1OfOrganization& Array1();
    StepBasic_Array1OfOrganization& ChangeArray1();
};
%make_alias(StepBasic_HArray1OfOrganization)


class StepBasic_HArray1OfPerson : public StepBasic_Array1OfPerson, public Standard_Transient {
  public:
    StepBasic_HArray1OfPerson(const Standard_Integer theLower, const Standard_Integer theUpper);
    StepBasic_HArray1OfPerson(const Standard_Integer theLower, const Standard_Integer theUpper, const StepBasic_Array1OfPerson::value_type& theValue);
    StepBasic_HArray1OfPerson(const StepBasic_Array1OfPerson& theOther);
    const StepBasic_Array1OfPerson& Array1();
    StepBasic_Array1OfPerson& ChangeArray1();
};
%make_alias(StepBasic_HArray1OfPerson)


class StepBasic_HArray1OfProduct : public StepBasic_Array1OfProduct, public Standard_Transient {
  public:
    StepBasic_HArray1OfProduct(const Standard_Integer theLower, const Standard_Integer theUpper);
    StepBasic_HArray1OfProduct(const Standard_Integer theLower, const Standard_Integer theUpper, const StepBasic_Array1OfProduct::value_type& theValue);
    StepBasic_HArray1OfProduct(const StepBasic_Array1OfProduct& theOther);
    const StepBasic_Array1OfProduct& Array1();
    StepBasic_Array1OfProduct& ChangeArray1();
};
%make_alias(StepBasic_HArray1OfProduct)


class StepBasic_HArray1OfProductContext : public StepBasic_Array1OfProductContext, public Standard_Transient {
  public:
    StepBasic_HArray1OfProductContext(const Standard_Integer theLower, const Standard_Integer theUpper);
    StepBasic_HArray1OfProductContext(const Standard_Integer theLower, const Standard_Integer theUpper, const StepBasic_Array1OfProductContext::value_type& theValue);
    StepBasic_HArray1OfProductContext(const StepBasic_Array1OfProductContext& theOther);
    const StepBasic_Array1OfProductContext& Array1();
    StepBasic_Array1OfProductContext& ChangeArray1();
};
%make_alias(StepBasic_HArray1OfProductContext)


class StepBasic_HArray1OfProductDefinition : public StepBasic_Array1OfProductDefinition, public Standard_Transient {
  public:
    StepBasic_HArray1OfProductDefinition(const Standard_Integer theLower, const Standard_Integer theUpper);
    StepBasic_HArray1OfProductDefinition(const Standard_Integer theLower, const Standard_Integer theUpper, const StepBasic_Array1OfProductDefinition::value_type& theValue);
    StepBasic_HArray1OfProductDefinition(const StepBasic_Array1OfProductDefinition& theOther);
    const StepBasic_Array1OfProductDefinition& Array1();
    StepBasic_Array1OfProductDefinition& ChangeArray1();
};
%make_alias(StepBasic_HArray1OfProductDefinition)


class StepBasic_HArray1OfUncertaintyMeasureWithUnit : public StepBasic_Array1OfUncertaintyMeasureWithUnit, public Standard_Transient {
  public:
    StepBasic_HArray1OfUncertaintyMeasureWithUnit(const Standard_Integer theLower, const Standard_Integer theUpper);
    StepBasic_HArray1OfUncertaintyMeasureWithUnit(const Standard_Integer theLower, const Standard_Integer theUpper, const StepBasic_Array1OfUncertaintyMeasureWithUnit::value_type& theValue);
    StepBasic_HArray1OfUncertaintyMeasureWithUnit(const StepBasic_Array1OfUncertaintyMeasureWithUnit& theOther);
    const StepBasic_Array1OfUncertaintyMeasureWithUnit& Array1();
    StepBasic_Array1OfUncertaintyMeasureWithUnit& ChangeArray1();
};
%make_alias(StepBasic_HArray1OfUncertaintyMeasureWithUnit)

/* harray2 classes */
/* hsequence classes */
/* class aliases */
%pythoncode {
}
