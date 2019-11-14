#ifndef STEPREPR_HXX
#define STEPREPR_HXX

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

#include<StepRepr_AllAroundShapeAspect.hxx>
#include<StepRepr_Apex.hxx>
#include<StepRepr_Array1OfMaterialPropertyRepresentation.hxx>
#include<StepRepr_Array1OfPropertyDefinitionRepresentation.hxx>
#include<StepRepr_Array1OfRepresentationItem.hxx>
#include<StepRepr_Array1OfShapeAspect.hxx>
#include<StepRepr_AssemblyComponentUsage.hxx>
#include<StepRepr_AssemblyComponentUsageSubstitute.hxx>
#include<StepRepr_BetweenShapeAspect.hxx>
#include<StepRepr_CentreOfSymmetry.hxx>
#include<StepRepr_CharacterizedDefinition.hxx>
#include<StepRepr_CharacterizedRepresentation.hxx>
#include<StepRepr_CompGroupShAspAndCompShAspAndDatumFeatAndShAsp.hxx>
#include<StepRepr_CompShAspAndDatumFeatAndShAsp.hxx>
#include<StepRepr_CompositeGroupShapeAspect.hxx>
#include<StepRepr_CompositeShapeAspect.hxx>
#include<StepRepr_CompoundRepresentationItem.hxx>
#include<StepRepr_ConfigurationDesign.hxx>
#include<StepRepr_ConfigurationDesignItem.hxx>
#include<StepRepr_ConfigurationEffectivity.hxx>
#include<StepRepr_ConfigurationItem.hxx>
#include<StepRepr_ConstructiveGeometryRepresentation.hxx>
#include<StepRepr_ConstructiveGeometryRepresentationRelationship.hxx>
#include<StepRepr_ContinuosShapeAspect.hxx>
#include<StepRepr_DataEnvironment.hxx>
#include<StepRepr_DefinitionalRepresentation.hxx>
#include<StepRepr_DerivedShapeAspect.hxx>
#include<StepRepr_DescriptiveRepresentationItem.hxx>
#include<StepRepr_Extension.hxx>
#include<StepRepr_ExternallyDefinedRepresentation.hxx>
#include<StepRepr_FeatureForDatumTargetRelationship.hxx>
#include<StepRepr_FunctionallyDefinedTransformation.hxx>
#include<StepRepr_GeometricAlignment.hxx>
#include<StepRepr_GlobalUncertaintyAssignedContext.hxx>
#include<StepRepr_GlobalUnitAssignedContext.hxx>
#include<StepRepr_HArray1OfMaterialPropertyRepresentation.hxx>
#include<StepRepr_HArray1OfPropertyDefinitionRepresentation.hxx>
#include<StepRepr_HArray1OfRepresentationItem.hxx>
#include<StepRepr_HArray1OfShapeAspect.hxx>
#include<StepRepr_HSequenceOfMaterialPropertyRepresentation.hxx>
#include<StepRepr_HSequenceOfRepresentationItem.hxx>
#include<StepRepr_IntegerRepresentationItem.hxx>
#include<StepRepr_ItemDefinedTransformation.hxx>
#include<StepRepr_MakeFromUsageOption.hxx>
#include<StepRepr_MappedItem.hxx>
#include<StepRepr_MaterialDesignation.hxx>
#include<StepRepr_MaterialProperty.hxx>
#include<StepRepr_MaterialPropertyRepresentation.hxx>
#include<StepRepr_MeasureRepresentationItem.hxx>
#include<StepRepr_NextAssemblyUsageOccurrence.hxx>
#include<StepRepr_ParallelOffset.hxx>
#include<StepRepr_ParametricRepresentationContext.hxx>
#include<StepRepr_PerpendicularTo.hxx>
#include<StepRepr_ProductConcept.hxx>
#include<StepRepr_ProductDefinitionShape.hxx>
#include<StepRepr_ProductDefinitionUsage.hxx>
#include<StepRepr_PromissoryUsageOccurrence.hxx>
#include<StepRepr_PropertyDefinition.hxx>
#include<StepRepr_PropertyDefinitionRelationship.hxx>
#include<StepRepr_PropertyDefinitionRepresentation.hxx>
#include<StepRepr_QuantifiedAssemblyComponentUsage.hxx>
#include<StepRepr_ReprItemAndLengthMeasureWithUnit.hxx>
#include<StepRepr_ReprItemAndLengthMeasureWithUnitAndQRI.hxx>
#include<StepRepr_ReprItemAndMeasureWithUnit.hxx>
#include<StepRepr_ReprItemAndMeasureWithUnitAndQRI.hxx>
#include<StepRepr_ReprItemAndPlaneAngleMeasureWithUnit.hxx>
#include<StepRepr_ReprItemAndPlaneAngleMeasureWithUnitAndQRI.hxx>
#include<StepRepr_Representation.hxx>
#include<StepRepr_RepresentationContext.hxx>
#include<StepRepr_RepresentationItem.hxx>
#include<StepRepr_RepresentationMap.hxx>
#include<StepRepr_RepresentationRelationship.hxx>
#include<StepRepr_RepresentationRelationshipWithTransformation.hxx>
#include<StepRepr_RepresentedDefinition.hxx>
#include<StepRepr_SequenceOfMaterialPropertyRepresentation.hxx>
#include<StepRepr_SequenceOfRepresentationItem.hxx>
#include<StepRepr_ShapeAspect.hxx>
#include<StepRepr_ShapeAspectDerivingRelationship.hxx>
#include<StepRepr_ShapeAspectRelationship.hxx>
#include<StepRepr_ShapeAspectTransition.hxx>
#include<StepRepr_ShapeDefinition.hxx>
#include<StepRepr_ShapeRepresentationRelationship.hxx>
#include<StepRepr_ShapeRepresentationRelationshipWithTransformation.hxx>
#include<StepRepr_SpecifiedHigherUsageOccurrence.hxx>
#include<StepRepr_StructuralResponseProperty.hxx>
#include<StepRepr_StructuralResponsePropertyDefinitionRepresentation.hxx>
#include<StepRepr_SuppliedPartRelationship.hxx>
#include<StepRepr_Tangent.hxx>
#include<StepRepr_Transformation.hxx>
#include<StepRepr_ValueRange.hxx>
#include<StepRepr_ValueRepresentationItem.hxx>

#endif // STEPREPR_HXX
