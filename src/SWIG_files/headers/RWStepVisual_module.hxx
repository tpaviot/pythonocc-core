/*
Copyright 2008-2022 Thomas Paviot (tpaviot@gmail.com)

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
#ifndef RWSTEPVISUAL_HXX
#define RWSTEPVISUAL_HXX


#include<RWStepVisual_RWAnnotationCurveOccurrence.hxx>
#include<RWStepVisual_RWAnnotationCurveOccurrenceAndGeomReprItem.hxx>
#include<RWStepVisual_RWAnnotationFillArea.hxx>
#include<RWStepVisual_RWAnnotationFillAreaOccurrence.hxx>
#include<RWStepVisual_RWAnnotationOccurrence.hxx>
#include<RWStepVisual_RWAnnotationPlane.hxx>
#include<RWStepVisual_RWAreaInSet.hxx>
#include<RWStepVisual_RWBackgroundColour.hxx>
#include<RWStepVisual_RWCameraImage.hxx>
#include<RWStepVisual_RWCameraModel.hxx>
#include<RWStepVisual_RWCameraModelD2.hxx>
#include<RWStepVisual_RWCameraModelD3.hxx>
#include<RWStepVisual_RWCameraModelD3MultiClipping.hxx>
#include<RWStepVisual_RWCameraModelD3MultiClippingIntersection.hxx>
#include<RWStepVisual_RWCameraModelD3MultiClippingUnion.hxx>
#include<RWStepVisual_RWCameraUsage.hxx>
#include<RWStepVisual_RWCharacterizedObjAndRepresentationAndDraughtingModel.hxx>
#include<RWStepVisual_RWColour.hxx>
#include<RWStepVisual_RWColourRgb.hxx>
#include<RWStepVisual_RWColourSpecification.hxx>
#include<RWStepVisual_RWComplexTriangulatedFace.hxx>
#include<RWStepVisual_RWComplexTriangulatedSurfaceSet.hxx>
#include<RWStepVisual_RWCompositeText.hxx>
#include<RWStepVisual_RWCompositeTextWithExtent.hxx>
#include<RWStepVisual_RWContextDependentInvisibility.hxx>
#include<RWStepVisual_RWContextDependentOverRidingStyledItem.hxx>
#include<RWStepVisual_RWCoordinatesList.hxx>
#include<RWStepVisual_RWCubicBezierTessellatedEdge.hxx>
#include<RWStepVisual_RWCubicBezierTriangulatedFace.hxx>
#include<RWStepVisual_RWCurveStyle.hxx>
#include<RWStepVisual_RWCurveStyleFont.hxx>
#include<RWStepVisual_RWCurveStyleFontPattern.hxx>
#include<RWStepVisual_RWDraughtingCallout.hxx>
#include<RWStepVisual_RWDraughtingModel.hxx>
#include<RWStepVisual_RWDraughtingPreDefinedColour.hxx>
#include<RWStepVisual_RWDraughtingPreDefinedCurveFont.hxx>
#include<RWStepVisual_RWExternallyDefinedCurveFont.hxx>
#include<RWStepVisual_RWFillAreaStyle.hxx>
#include<RWStepVisual_RWFillAreaStyleColour.hxx>
#include<RWStepVisual_RWInvisibility.hxx>
#include<RWStepVisual_RWMechanicalDesignGeometricPresentationArea.hxx>
#include<RWStepVisual_RWMechanicalDesignGeometricPresentationRepresentation.hxx>
#include<RWStepVisual_RWOverRidingStyledItem.hxx>
#include<RWStepVisual_RWPlanarBox.hxx>
#include<RWStepVisual_RWPlanarExtent.hxx>
#include<RWStepVisual_RWPointStyle.hxx>
#include<RWStepVisual_RWPreDefinedColour.hxx>
#include<RWStepVisual_RWPreDefinedCurveFont.hxx>
#include<RWStepVisual_RWPreDefinedItem.hxx>
#include<RWStepVisual_RWPresentationArea.hxx>
#include<RWStepVisual_RWPresentationLayerAssignment.hxx>
#include<RWStepVisual_RWPresentationLayerUsage.hxx>
#include<RWStepVisual_RWPresentationRepresentation.hxx>
#include<RWStepVisual_RWPresentationSet.hxx>
#include<RWStepVisual_RWPresentationSize.hxx>
#include<RWStepVisual_RWPresentationStyleAssignment.hxx>
#include<RWStepVisual_RWPresentationStyleByContext.hxx>
#include<RWStepVisual_RWPresentationView.hxx>
#include<RWStepVisual_RWPresentedItemRepresentation.hxx>
#include<RWStepVisual_RWRepositionedTessellatedGeometricSet.hxx>
#include<RWStepVisual_RWRepositionedTessellatedItem.hxx>
#include<RWStepVisual_RWStyledItem.hxx>
#include<RWStepVisual_RWSurfaceSideStyle.hxx>
#include<RWStepVisual_RWSurfaceStyleBoundary.hxx>
#include<RWStepVisual_RWSurfaceStyleControlGrid.hxx>
#include<RWStepVisual_RWSurfaceStyleFillArea.hxx>
#include<RWStepVisual_RWSurfaceStyleParameterLine.hxx>
#include<RWStepVisual_RWSurfaceStyleReflectanceAmbient.hxx>
#include<RWStepVisual_RWSurfaceStyleRendering.hxx>
#include<RWStepVisual_RWSurfaceStyleRenderingWithProperties.hxx>
#include<RWStepVisual_RWSurfaceStyleSegmentationCurve.hxx>
#include<RWStepVisual_RWSurfaceStyleSilhouette.hxx>
#include<RWStepVisual_RWSurfaceStyleTransparent.hxx>
#include<RWStepVisual_RWSurfaceStyleUsage.hxx>
#include<RWStepVisual_RWTemplate.hxx>
#include<RWStepVisual_RWTemplateInstance.hxx>
#include<RWStepVisual_RWTessellatedAnnotationOccurrence.hxx>
#include<RWStepVisual_RWTessellatedConnectingEdge.hxx>
#include<RWStepVisual_RWTessellatedCurveSet.hxx>
#include<RWStepVisual_RWTessellatedEdge.hxx>
#include<RWStepVisual_RWTessellatedGeometricSet.hxx>
#include<RWStepVisual_RWTessellatedItem.hxx>
#include<RWStepVisual_RWTessellatedPointSet.hxx>
#include<RWStepVisual_RWTessellatedShapeRepresentation.hxx>
#include<RWStepVisual_RWTessellatedShapeRepresentationWithAccuracyParameters.hxx>
#include<RWStepVisual_RWTessellatedShell.hxx>
#include<RWStepVisual_RWTessellatedSolid.hxx>
#include<RWStepVisual_RWTessellatedStructuredItem.hxx>
#include<RWStepVisual_RWTessellatedVertex.hxx>
#include<RWStepVisual_RWTessellatedWire.hxx>
#include<RWStepVisual_RWTextLiteral.hxx>
#include<RWStepVisual_RWTextStyle.hxx>
#include<RWStepVisual_RWTextStyleForDefinedFont.hxx>
#include<RWStepVisual_RWTextStyleWithBoxCharacteristics.hxx>
#include<RWStepVisual_RWTriangulatedFace.hxx>
#include<RWStepVisual_RWViewVolume.hxx>

#endif // RWSTEPVISUAL_HXX
