#ifndef STEPVISUAL_HXX
#define STEPVISUAL_HXX

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

#include<StepVisual_AnnotationCurveOccurrence.hxx>
#include<StepVisual_AnnotationCurveOccurrenceAndAnnotationOccurrenceAndGeomReprItemAndReprItemAndStyledItem.hxx>
#include<StepVisual_AnnotationFillArea.hxx>
#include<StepVisual_AnnotationFillAreaOccurrence.hxx>
#include<StepVisual_AnnotationOccurrence.hxx>
#include<StepVisual_AnnotationPlane.hxx>
#include<StepVisual_AnnotationPlaneElement.hxx>
#include<StepVisual_AnnotationText.hxx>
#include<StepVisual_AnnotationTextOccurrence.hxx>
#include<StepVisual_AreaInSet.hxx>
#include<StepVisual_AreaOrView.hxx>
#include<StepVisual_Array1OfAnnotationPlaneElement.hxx>
#include<StepVisual_Array1OfBoxCharacteristicSelect.hxx>
#include<StepVisual_Array1OfCameraModelD3MultiClippingInterectionSelect.hxx>
#include<StepVisual_Array1OfCameraModelD3MultiClippingUnionSelect.hxx>
#include<StepVisual_Array1OfCurveStyleFontPattern.hxx>
#include<StepVisual_Array1OfDirectionCountSelect.hxx>
#include<StepVisual_Array1OfDraughtingCalloutElement.hxx>
#include<StepVisual_Array1OfFillStyleSelect.hxx>
#include<StepVisual_Array1OfInvisibleItem.hxx>
#include<StepVisual_Array1OfLayeredItem.hxx>
#include<StepVisual_Array1OfPresentationStyleAssignment.hxx>
#include<StepVisual_Array1OfPresentationStyleSelect.hxx>
#include<StepVisual_Array1OfStyleContextSelect.hxx>
#include<StepVisual_Array1OfSurfaceStyleElementSelect.hxx>
#include<StepVisual_Array1OfTextOrCharacter.hxx>
#include<StepVisual_BackgroundColour.hxx>
#include<StepVisual_BoxCharacteristicSelect.hxx>
#include<StepVisual_CameraImage.hxx>
#include<StepVisual_CameraImage2dWithScale.hxx>
#include<StepVisual_CameraImage3dWithScale.hxx>
#include<StepVisual_CameraModel.hxx>
#include<StepVisual_CameraModelD2.hxx>
#include<StepVisual_CameraModelD3.hxx>
#include<StepVisual_CameraModelD3MultiClipping.hxx>
#include<StepVisual_CameraModelD3MultiClippingInterectionSelect.hxx>
#include<StepVisual_CameraModelD3MultiClippingIntersection.hxx>
#include<StepVisual_CameraModelD3MultiClippingUnion.hxx>
#include<StepVisual_CameraModelD3MultiClippingUnionSelect.hxx>
#include<StepVisual_CameraUsage.hxx>
#include<StepVisual_CentralOrParallel.hxx>
#include<StepVisual_CharacterizedObjectAndCharacterizedRepresentationAndDraughtingModelAndRepresentation.hxx>
#include<StepVisual_Colour.hxx>
#include<StepVisual_ColourRgb.hxx>
#include<StepVisual_ColourSpecification.hxx>
#include<StepVisual_CompositeText.hxx>
#include<StepVisual_CompositeTextWithExtent.hxx>
#include<StepVisual_ContextDependentInvisibility.hxx>
#include<StepVisual_ContextDependentOverRidingStyledItem.hxx>
#include<StepVisual_CoordinatesList.hxx>
#include<StepVisual_CurveStyle.hxx>
#include<StepVisual_CurveStyleFont.hxx>
#include<StepVisual_CurveStyleFontPattern.hxx>
#include<StepVisual_CurveStyleFontSelect.hxx>
#include<StepVisual_DirectionCountSelect.hxx>
#include<StepVisual_DraughtingAnnotationOccurrence.hxx>
#include<StepVisual_DraughtingCallout.hxx>
#include<StepVisual_DraughtingCalloutElement.hxx>
#include<StepVisual_DraughtingModel.hxx>
#include<StepVisual_DraughtingPreDefinedColour.hxx>
#include<StepVisual_DraughtingPreDefinedCurveFont.hxx>
#include<StepVisual_ExternallyDefinedCurveFont.hxx>
#include<StepVisual_ExternallyDefinedTextFont.hxx>
#include<StepVisual_FillAreaStyle.hxx>
#include<StepVisual_FillAreaStyleColour.hxx>
#include<StepVisual_FillStyleSelect.hxx>
#include<StepVisual_FontSelect.hxx>
#include<StepVisual_HArray1OfAnnotationPlaneElement.hxx>
#include<StepVisual_HArray1OfBoxCharacteristicSelect.hxx>
#include<StepVisual_HArray1OfCameraModelD3MultiClippingInterectionSelect.hxx>
#include<StepVisual_HArray1OfCameraModelD3MultiClippingUnionSelect.hxx>
#include<StepVisual_HArray1OfCurveStyleFontPattern.hxx>
#include<StepVisual_HArray1OfDirectionCountSelect.hxx>
#include<StepVisual_HArray1OfDraughtingCalloutElement.hxx>
#include<StepVisual_HArray1OfFillStyleSelect.hxx>
#include<StepVisual_HArray1OfInvisibleItem.hxx>
#include<StepVisual_HArray1OfLayeredItem.hxx>
#include<StepVisual_HArray1OfPresentationStyleAssignment.hxx>
#include<StepVisual_HArray1OfPresentationStyleSelect.hxx>
#include<StepVisual_HArray1OfStyleContextSelect.hxx>
#include<StepVisual_HArray1OfSurfaceStyleElementSelect.hxx>
#include<StepVisual_HArray1OfTextOrCharacter.hxx>
#include<StepVisual_Invisibility.hxx>
#include<StepVisual_InvisibilityContext.hxx>
#include<StepVisual_InvisibleItem.hxx>
#include<StepVisual_LayeredItem.hxx>
#include<StepVisual_MarkerMember.hxx>
#include<StepVisual_MarkerSelect.hxx>
#include<StepVisual_MarkerType.hxx>
#include<StepVisual_MechanicalDesignGeometricPresentationArea.hxx>
#include<StepVisual_MechanicalDesignGeometricPresentationRepresentation.hxx>
#include<StepVisual_NullStyle.hxx>
#include<StepVisual_NullStyleMember.hxx>
#include<StepVisual_OverRidingStyledItem.hxx>
#include<StepVisual_PlanarBox.hxx>
#include<StepVisual_PlanarExtent.hxx>
#include<StepVisual_PointStyle.hxx>
#include<StepVisual_PreDefinedColour.hxx>
#include<StepVisual_PreDefinedCurveFont.hxx>
#include<StepVisual_PreDefinedItem.hxx>
#include<StepVisual_PreDefinedTextFont.hxx>
#include<StepVisual_PresentationArea.hxx>
#include<StepVisual_PresentationLayerAssignment.hxx>
#include<StepVisual_PresentationLayerUsage.hxx>
#include<StepVisual_PresentationRepresentation.hxx>
#include<StepVisual_PresentationRepresentationSelect.hxx>
#include<StepVisual_PresentationSet.hxx>
#include<StepVisual_PresentationSize.hxx>
#include<StepVisual_PresentationSizeAssignmentSelect.hxx>
#include<StepVisual_PresentationStyleAssignment.hxx>
#include<StepVisual_PresentationStyleByContext.hxx>
#include<StepVisual_PresentationStyleSelect.hxx>
#include<StepVisual_PresentationView.hxx>
#include<StepVisual_PresentedItem.hxx>
#include<StepVisual_PresentedItemRepresentation.hxx>
#include<StepVisual_StyleContextSelect.hxx>
#include<StepVisual_StyledItem.hxx>
#include<StepVisual_StyledItemTarget.hxx>
#include<StepVisual_SurfaceSide.hxx>
#include<StepVisual_SurfaceSideStyle.hxx>
#include<StepVisual_SurfaceStyleBoundary.hxx>
#include<StepVisual_SurfaceStyleControlGrid.hxx>
#include<StepVisual_SurfaceStyleElementSelect.hxx>
#include<StepVisual_SurfaceStyleFillArea.hxx>
#include<StepVisual_SurfaceStyleParameterLine.hxx>
#include<StepVisual_SurfaceStyleSegmentationCurve.hxx>
#include<StepVisual_SurfaceStyleSilhouette.hxx>
#include<StepVisual_SurfaceStyleUsage.hxx>
#include<StepVisual_Template.hxx>
#include<StepVisual_TemplateInstance.hxx>
#include<StepVisual_TessellatedAnnotationOccurrence.hxx>
#include<StepVisual_TessellatedCurveSet.hxx>
#include<StepVisual_TessellatedGeometricSet.hxx>
#include<StepVisual_TessellatedItem.hxx>
#include<StepVisual_TextLiteral.hxx>
#include<StepVisual_TextOrCharacter.hxx>
#include<StepVisual_TextPath.hxx>
#include<StepVisual_TextStyle.hxx>
#include<StepVisual_TextStyleForDefinedFont.hxx>
#include<StepVisual_TextStyleWithBoxCharacteristics.hxx>
#include<StepVisual_ViewVolume.hxx>

#endif // STEPVISUAL_HXX
