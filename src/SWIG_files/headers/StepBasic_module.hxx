#ifndef STEPBASIC_HXX
#define STEPBASIC_HXX

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

#include<StepBasic_Action.hxx>
#include<StepBasic_ActionAssignment.hxx>
#include<StepBasic_ActionMethod.hxx>
#include<StepBasic_ActionRequestAssignment.hxx>
#include<StepBasic_ActionRequestSolution.hxx>
#include<StepBasic_Address.hxx>
#include<StepBasic_AheadOrBehind.hxx>
#include<StepBasic_ApplicationContext.hxx>
#include<StepBasic_ApplicationContextElement.hxx>
#include<StepBasic_ApplicationProtocolDefinition.hxx>
#include<StepBasic_Approval.hxx>
#include<StepBasic_ApprovalAssignment.hxx>
#include<StepBasic_ApprovalDateTime.hxx>
#include<StepBasic_ApprovalPersonOrganization.hxx>
#include<StepBasic_ApprovalRelationship.hxx>
#include<StepBasic_ApprovalRole.hxx>
#include<StepBasic_ApprovalStatus.hxx>
#include<StepBasic_AreaUnit.hxx>
#include<StepBasic_Array1OfApproval.hxx>
#include<StepBasic_Array1OfDerivedUnitElement.hxx>
#include<StepBasic_Array1OfDocument.hxx>
#include<StepBasic_Array1OfNamedUnit.hxx>
#include<StepBasic_Array1OfOrganization.hxx>
#include<StepBasic_Array1OfPerson.hxx>
#include<StepBasic_Array1OfProduct.hxx>
#include<StepBasic_Array1OfProductContext.hxx>
#include<StepBasic_Array1OfProductDefinition.hxx>
#include<StepBasic_Array1OfUncertaintyMeasureWithUnit.hxx>
#include<StepBasic_CalendarDate.hxx>
#include<StepBasic_Certification.hxx>
#include<StepBasic_CertificationAssignment.hxx>
#include<StepBasic_CertificationType.hxx>
#include<StepBasic_CharacterizedObject.hxx>
#include<StepBasic_Contract.hxx>
#include<StepBasic_ContractAssignment.hxx>
#include<StepBasic_ContractType.hxx>
#include<StepBasic_ConversionBasedUnit.hxx>
#include<StepBasic_ConversionBasedUnitAndAreaUnit.hxx>
#include<StepBasic_ConversionBasedUnitAndLengthUnit.hxx>
#include<StepBasic_ConversionBasedUnitAndMassUnit.hxx>
#include<StepBasic_ConversionBasedUnitAndPlaneAngleUnit.hxx>
#include<StepBasic_ConversionBasedUnitAndRatioUnit.hxx>
#include<StepBasic_ConversionBasedUnitAndSolidAngleUnit.hxx>
#include<StepBasic_ConversionBasedUnitAndTimeUnit.hxx>
#include<StepBasic_ConversionBasedUnitAndVolumeUnit.hxx>
#include<StepBasic_CoordinatedUniversalTimeOffset.hxx>
#include<StepBasic_Date.hxx>
#include<StepBasic_DateAndTime.hxx>
#include<StepBasic_DateAndTimeAssignment.hxx>
#include<StepBasic_DateAssignment.hxx>
#include<StepBasic_DateRole.hxx>
#include<StepBasic_DateTimeRole.hxx>
#include<StepBasic_DateTimeSelect.hxx>
#include<StepBasic_DerivedUnit.hxx>
#include<StepBasic_DerivedUnitElement.hxx>
#include<StepBasic_DesignContext.hxx>
#include<StepBasic_DigitalDocument.hxx>
#include<StepBasic_DimensionalExponents.hxx>
#include<StepBasic_Document.hxx>
#include<StepBasic_DocumentFile.hxx>
#include<StepBasic_DocumentProductAssociation.hxx>
#include<StepBasic_DocumentProductEquivalence.hxx>
#include<StepBasic_DocumentReference.hxx>
#include<StepBasic_DocumentRelationship.hxx>
#include<StepBasic_DocumentRepresentationType.hxx>
#include<StepBasic_DocumentType.hxx>
#include<StepBasic_DocumentUsageConstraint.hxx>
#include<StepBasic_Effectivity.hxx>
#include<StepBasic_EffectivityAssignment.hxx>
#include<StepBasic_EulerAngles.hxx>
#include<StepBasic_ExternalIdentificationAssignment.hxx>
#include<StepBasic_ExternalSource.hxx>
#include<StepBasic_ExternallyDefinedItem.hxx>
#include<StepBasic_GeneralProperty.hxx>
#include<StepBasic_Group.hxx>
#include<StepBasic_GroupAssignment.hxx>
#include<StepBasic_GroupRelationship.hxx>
#include<StepBasic_HArray1OfApproval.hxx>
#include<StepBasic_HArray1OfDerivedUnitElement.hxx>
#include<StepBasic_HArray1OfDocument.hxx>
#include<StepBasic_HArray1OfNamedUnit.hxx>
#include<StepBasic_HArray1OfOrganization.hxx>
#include<StepBasic_HArray1OfPerson.hxx>
#include<StepBasic_HArray1OfProduct.hxx>
#include<StepBasic_HArray1OfProductContext.hxx>
#include<StepBasic_HArray1OfProductDefinition.hxx>
#include<StepBasic_HArray1OfUncertaintyMeasureWithUnit.hxx>
#include<StepBasic_IdentificationAssignment.hxx>
#include<StepBasic_IdentificationRole.hxx>
#include<StepBasic_LengthMeasureWithUnit.hxx>
#include<StepBasic_LengthUnit.hxx>
#include<StepBasic_LocalTime.hxx>
#include<StepBasic_MassMeasureWithUnit.hxx>
#include<StepBasic_MassUnit.hxx>
#include<StepBasic_MeasureValueMember.hxx>
#include<StepBasic_MeasureWithUnit.hxx>
#include<StepBasic_MechanicalContext.hxx>
#include<StepBasic_NameAssignment.hxx>
#include<StepBasic_NamedUnit.hxx>
#include<StepBasic_ObjectRole.hxx>
#include<StepBasic_OrdinalDate.hxx>
#include<StepBasic_Organization.hxx>
#include<StepBasic_OrganizationAssignment.hxx>
#include<StepBasic_OrganizationRole.hxx>
#include<StepBasic_OrganizationalAddress.hxx>
#include<StepBasic_Person.hxx>
#include<StepBasic_PersonAndOrganization.hxx>
#include<StepBasic_PersonAndOrganizationAssignment.hxx>
#include<StepBasic_PersonAndOrganizationRole.hxx>
#include<StepBasic_PersonOrganizationSelect.hxx>
#include<StepBasic_PersonalAddress.hxx>
#include<StepBasic_PhysicallyModeledProductDefinition.hxx>
#include<StepBasic_PlaneAngleMeasureWithUnit.hxx>
#include<StepBasic_PlaneAngleUnit.hxx>
#include<StepBasic_Product.hxx>
#include<StepBasic_ProductCategory.hxx>
#include<StepBasic_ProductCategoryRelationship.hxx>
#include<StepBasic_ProductConceptContext.hxx>
#include<StepBasic_ProductContext.hxx>
#include<StepBasic_ProductDefinition.hxx>
#include<StepBasic_ProductDefinitionContext.hxx>
#include<StepBasic_ProductDefinitionEffectivity.hxx>
#include<StepBasic_ProductDefinitionFormation.hxx>
#include<StepBasic_ProductDefinitionFormationRelationship.hxx>
#include<StepBasic_ProductDefinitionFormationWithSpecifiedSource.hxx>
#include<StepBasic_ProductDefinitionOrReference.hxx>
#include<StepBasic_ProductDefinitionReference.hxx>
#include<StepBasic_ProductDefinitionReferenceWithLocalRepresentation.hxx>
#include<StepBasic_ProductDefinitionRelationship.hxx>
#include<StepBasic_ProductDefinitionWithAssociatedDocuments.hxx>
#include<StepBasic_ProductOrFormationOrDefinition.hxx>
#include<StepBasic_ProductRelatedProductCategory.hxx>
#include<StepBasic_ProductType.hxx>
#include<StepBasic_RatioMeasureWithUnit.hxx>
#include<StepBasic_RatioUnit.hxx>
#include<StepBasic_RoleAssociation.hxx>
#include<StepBasic_RoleSelect.hxx>
#include<StepBasic_SecurityClassification.hxx>
#include<StepBasic_SecurityClassificationAssignment.hxx>
#include<StepBasic_SecurityClassificationLevel.hxx>
#include<StepBasic_SiPrefix.hxx>
#include<StepBasic_SiUnit.hxx>
#include<StepBasic_SiUnitAndAreaUnit.hxx>
#include<StepBasic_SiUnitAndLengthUnit.hxx>
#include<StepBasic_SiUnitAndMassUnit.hxx>
#include<StepBasic_SiUnitAndPlaneAngleUnit.hxx>
#include<StepBasic_SiUnitAndRatioUnit.hxx>
#include<StepBasic_SiUnitAndSolidAngleUnit.hxx>
#include<StepBasic_SiUnitAndThermodynamicTemperatureUnit.hxx>
#include<StepBasic_SiUnitAndTimeUnit.hxx>
#include<StepBasic_SiUnitAndVolumeUnit.hxx>
#include<StepBasic_SiUnitName.hxx>
#include<StepBasic_SizeMember.hxx>
#include<StepBasic_SizeSelect.hxx>
#include<StepBasic_SolidAngleMeasureWithUnit.hxx>
#include<StepBasic_SolidAngleUnit.hxx>
#include<StepBasic_Source.hxx>
#include<StepBasic_SourceItem.hxx>
#include<StepBasic_ThermodynamicTemperatureUnit.hxx>
#include<StepBasic_TimeMeasureWithUnit.hxx>
#include<StepBasic_TimeUnit.hxx>
#include<StepBasic_UncertaintyMeasureWithUnit.hxx>
#include<StepBasic_Unit.hxx>
#include<StepBasic_VersionedActionRequest.hxx>
#include<StepBasic_VolumeUnit.hxx>
#include<StepBasic_WeekOfYearAndDayDate.hxx>

#endif // STEPBASIC_HXX
