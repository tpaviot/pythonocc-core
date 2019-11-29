#ifndef RWSTEPBASIC_HXX
#define RWSTEPBASIC_HXX

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

#include<RWStepBasic_RWAction.hxx>
#include<RWStepBasic_RWActionAssignment.hxx>
#include<RWStepBasic_RWActionMethod.hxx>
#include<RWStepBasic_RWActionRequestAssignment.hxx>
#include<RWStepBasic_RWActionRequestSolution.hxx>
#include<RWStepBasic_RWAddress.hxx>
#include<RWStepBasic_RWApplicationContext.hxx>
#include<RWStepBasic_RWApplicationContextElement.hxx>
#include<RWStepBasic_RWApplicationProtocolDefinition.hxx>
#include<RWStepBasic_RWApproval.hxx>
#include<RWStepBasic_RWApprovalDateTime.hxx>
#include<RWStepBasic_RWApprovalPersonOrganization.hxx>
#include<RWStepBasic_RWApprovalRelationship.hxx>
#include<RWStepBasic_RWApprovalRole.hxx>
#include<RWStepBasic_RWApprovalStatus.hxx>
#include<RWStepBasic_RWCalendarDate.hxx>
#include<RWStepBasic_RWCertification.hxx>
#include<RWStepBasic_RWCertificationAssignment.hxx>
#include<RWStepBasic_RWCertificationType.hxx>
#include<RWStepBasic_RWCharacterizedObject.hxx>
#include<RWStepBasic_RWContract.hxx>
#include<RWStepBasic_RWContractAssignment.hxx>
#include<RWStepBasic_RWContractType.hxx>
#include<RWStepBasic_RWConversionBasedUnit.hxx>
#include<RWStepBasic_RWConversionBasedUnitAndAreaUnit.hxx>
#include<RWStepBasic_RWConversionBasedUnitAndLengthUnit.hxx>
#include<RWStepBasic_RWConversionBasedUnitAndMassUnit.hxx>
#include<RWStepBasic_RWConversionBasedUnitAndPlaneAngleUnit.hxx>
#include<RWStepBasic_RWConversionBasedUnitAndRatioUnit.hxx>
#include<RWStepBasic_RWConversionBasedUnitAndSolidAngleUnit.hxx>
#include<RWStepBasic_RWConversionBasedUnitAndTimeUnit.hxx>
#include<RWStepBasic_RWConversionBasedUnitAndVolumeUnit.hxx>
#include<RWStepBasic_RWCoordinatedUniversalTimeOffset.hxx>
#include<RWStepBasic_RWDate.hxx>
#include<RWStepBasic_RWDateAndTime.hxx>
#include<RWStepBasic_RWDateRole.hxx>
#include<RWStepBasic_RWDateTimeRole.hxx>
#include<RWStepBasic_RWDerivedUnit.hxx>
#include<RWStepBasic_RWDerivedUnitElement.hxx>
#include<RWStepBasic_RWDimensionalExponents.hxx>
#include<RWStepBasic_RWDocument.hxx>
#include<RWStepBasic_RWDocumentFile.hxx>
#include<RWStepBasic_RWDocumentProductAssociation.hxx>
#include<RWStepBasic_RWDocumentProductEquivalence.hxx>
#include<RWStepBasic_RWDocumentRelationship.hxx>
#include<RWStepBasic_RWDocumentRepresentationType.hxx>
#include<RWStepBasic_RWDocumentType.hxx>
#include<RWStepBasic_RWDocumentUsageConstraint.hxx>
#include<RWStepBasic_RWEffectivity.hxx>
#include<RWStepBasic_RWEffectivityAssignment.hxx>
#include<RWStepBasic_RWEulerAngles.hxx>
#include<RWStepBasic_RWExternalIdentificationAssignment.hxx>
#include<RWStepBasic_RWExternalSource.hxx>
#include<RWStepBasic_RWExternallyDefinedItem.hxx>
#include<RWStepBasic_RWGeneralProperty.hxx>
#include<RWStepBasic_RWGroup.hxx>
#include<RWStepBasic_RWGroupAssignment.hxx>
#include<RWStepBasic_RWGroupRelationship.hxx>
#include<RWStepBasic_RWIdentificationAssignment.hxx>
#include<RWStepBasic_RWIdentificationRole.hxx>
#include<RWStepBasic_RWLengthMeasureWithUnit.hxx>
#include<RWStepBasic_RWLengthUnit.hxx>
#include<RWStepBasic_RWLocalTime.hxx>
#include<RWStepBasic_RWMassMeasureWithUnit.hxx>
#include<RWStepBasic_RWMassUnit.hxx>
#include<RWStepBasic_RWMeasureWithUnit.hxx>
#include<RWStepBasic_RWMechanicalContext.hxx>
#include<RWStepBasic_RWNameAssignment.hxx>
#include<RWStepBasic_RWNamedUnit.hxx>
#include<RWStepBasic_RWObjectRole.hxx>
#include<RWStepBasic_RWOrdinalDate.hxx>
#include<RWStepBasic_RWOrganization.hxx>
#include<RWStepBasic_RWOrganizationRole.hxx>
#include<RWStepBasic_RWOrganizationalAddress.hxx>
#include<RWStepBasic_RWPerson.hxx>
#include<RWStepBasic_RWPersonAndOrganization.hxx>
#include<RWStepBasic_RWPersonAndOrganizationRole.hxx>
#include<RWStepBasic_RWPersonalAddress.hxx>
#include<RWStepBasic_RWPlaneAngleMeasureWithUnit.hxx>
#include<RWStepBasic_RWPlaneAngleUnit.hxx>
#include<RWStepBasic_RWProduct.hxx>
#include<RWStepBasic_RWProductCategory.hxx>
#include<RWStepBasic_RWProductCategoryRelationship.hxx>
#include<RWStepBasic_RWProductConceptContext.hxx>
#include<RWStepBasic_RWProductContext.hxx>
#include<RWStepBasic_RWProductDefinition.hxx>
#include<RWStepBasic_RWProductDefinitionContext.hxx>
#include<RWStepBasic_RWProductDefinitionEffectivity.hxx>
#include<RWStepBasic_RWProductDefinitionFormation.hxx>
#include<RWStepBasic_RWProductDefinitionFormationRelationship.hxx>
#include<RWStepBasic_RWProductDefinitionFormationWithSpecifiedSource.hxx>
#include<RWStepBasic_RWProductDefinitionReference.hxx>
#include<RWStepBasic_RWProductDefinitionReferenceWithLocalRepresentation.hxx>
#include<RWStepBasic_RWProductDefinitionRelationship.hxx>
#include<RWStepBasic_RWProductDefinitionWithAssociatedDocuments.hxx>
#include<RWStepBasic_RWProductRelatedProductCategory.hxx>
#include<RWStepBasic_RWProductType.hxx>
#include<RWStepBasic_RWRatioMeasureWithUnit.hxx>
#include<RWStepBasic_RWRoleAssociation.hxx>
#include<RWStepBasic_RWSecurityClassification.hxx>
#include<RWStepBasic_RWSecurityClassificationLevel.hxx>
#include<RWStepBasic_RWSiUnit.hxx>
#include<RWStepBasic_RWSiUnitAndAreaUnit.hxx>
#include<RWStepBasic_RWSiUnitAndLengthUnit.hxx>
#include<RWStepBasic_RWSiUnitAndMassUnit.hxx>
#include<RWStepBasic_RWSiUnitAndPlaneAngleUnit.hxx>
#include<RWStepBasic_RWSiUnitAndRatioUnit.hxx>
#include<RWStepBasic_RWSiUnitAndSolidAngleUnit.hxx>
#include<RWStepBasic_RWSiUnitAndThermodynamicTemperatureUnit.hxx>
#include<RWStepBasic_RWSiUnitAndTimeUnit.hxx>
#include<RWStepBasic_RWSiUnitAndVolumeUnit.hxx>
#include<RWStepBasic_RWSolidAngleMeasureWithUnit.hxx>
#include<RWStepBasic_RWSolidAngleUnit.hxx>
#include<RWStepBasic_RWThermodynamicTemperatureUnit.hxx>
#include<RWStepBasic_RWUncertaintyMeasureWithUnit.hxx>
#include<RWStepBasic_RWVersionedActionRequest.hxx>
#include<RWStepBasic_RWWeekOfYearAndDayDate.hxx>

#endif // RWSTEPBASIC_HXX
