#ifndef RWSTEPSHAPE_HXX
#define RWSTEPSHAPE_HXX

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

#include<RWStepShape_RWAdvancedBrepShapeRepresentation.hxx>
#include<RWStepShape_RWAdvancedFace.hxx>
#include<RWStepShape_RWAngularLocation.hxx>
#include<RWStepShape_RWAngularSize.hxx>
#include<RWStepShape_RWBlock.hxx>
#include<RWStepShape_RWBooleanResult.hxx>
#include<RWStepShape_RWBoxDomain.hxx>
#include<RWStepShape_RWBoxedHalfSpace.hxx>
#include<RWStepShape_RWBrepWithVoids.hxx>
#include<RWStepShape_RWClosedShell.hxx>
#include<RWStepShape_RWCompoundShapeRepresentation.hxx>
#include<RWStepShape_RWConnectedEdgeSet.hxx>
#include<RWStepShape_RWConnectedFaceSet.hxx>
#include<RWStepShape_RWConnectedFaceShapeRepresentation.hxx>
#include<RWStepShape_RWConnectedFaceSubSet.hxx>
#include<RWStepShape_RWContextDependentShapeRepresentation.hxx>
#include<RWStepShape_RWCsgShapeRepresentation.hxx>
#include<RWStepShape_RWCsgSolid.hxx>
#include<RWStepShape_RWDefinitionalRepresentationAndShapeRepresentation.hxx>
#include<RWStepShape_RWDimensionalCharacteristicRepresentation.hxx>
#include<RWStepShape_RWDimensionalLocation.hxx>
#include<RWStepShape_RWDimensionalLocationWithPath.hxx>
#include<RWStepShape_RWDimensionalSize.hxx>
#include<RWStepShape_RWDimensionalSizeWithPath.hxx>
#include<RWStepShape_RWEdge.hxx>
#include<RWStepShape_RWEdgeBasedWireframeModel.hxx>
#include<RWStepShape_RWEdgeBasedWireframeShapeRepresentation.hxx>
#include<RWStepShape_RWEdgeCurve.hxx>
#include<RWStepShape_RWEdgeLoop.hxx>
#include<RWStepShape_RWExtrudedAreaSolid.hxx>
#include<RWStepShape_RWExtrudedFaceSolid.hxx>
#include<RWStepShape_RWFace.hxx>
#include<RWStepShape_RWFaceBasedSurfaceModel.hxx>
#include<RWStepShape_RWFaceBound.hxx>
#include<RWStepShape_RWFaceOuterBound.hxx>
#include<RWStepShape_RWFaceSurface.hxx>
#include<RWStepShape_RWFacetedBrep.hxx>
#include<RWStepShape_RWFacetedBrepAndBrepWithVoids.hxx>
#include<RWStepShape_RWFacetedBrepShapeRepresentation.hxx>
#include<RWStepShape_RWGeometricCurveSet.hxx>
#include<RWStepShape_RWGeometricSet.hxx>
#include<RWStepShape_RWGeometricallyBoundedSurfaceShapeRepresentation.hxx>
#include<RWStepShape_RWGeometricallyBoundedWireframeShapeRepresentation.hxx>
#include<RWStepShape_RWHalfSpaceSolid.hxx>
#include<RWStepShape_RWLimitsAndFits.hxx>
#include<RWStepShape_RWLoop.hxx>
#include<RWStepShape_RWLoopAndPath.hxx>
#include<RWStepShape_RWManifoldSolidBrep.hxx>
#include<RWStepShape_RWManifoldSurfaceShapeRepresentation.hxx>
#include<RWStepShape_RWMeasureQualification.hxx>
#include<RWStepShape_RWMeasureRepresentationItemAndQualifiedRepresentationItem.hxx>
#include<RWStepShape_RWNonManifoldSurfaceShapeRepresentation.hxx>
#include<RWStepShape_RWOpenShell.hxx>
#include<RWStepShape_RWOrientedClosedShell.hxx>
#include<RWStepShape_RWOrientedEdge.hxx>
#include<RWStepShape_RWOrientedFace.hxx>
#include<RWStepShape_RWOrientedOpenShell.hxx>
#include<RWStepShape_RWOrientedPath.hxx>
#include<RWStepShape_RWPath.hxx>
#include<RWStepShape_RWPlusMinusTolerance.hxx>
#include<RWStepShape_RWPointRepresentation.hxx>
#include<RWStepShape_RWPolyLoop.hxx>
#include<RWStepShape_RWPrecisionQualifier.hxx>
#include<RWStepShape_RWQualifiedRepresentationItem.hxx>
#include<RWStepShape_RWRevolvedAreaSolid.hxx>
#include<RWStepShape_RWRevolvedFaceSolid.hxx>
#include<RWStepShape_RWRightAngularWedge.hxx>
#include<RWStepShape_RWRightCircularCone.hxx>
#include<RWStepShape_RWRightCircularCylinder.hxx>
#include<RWStepShape_RWSeamEdge.hxx>
#include<RWStepShape_RWShapeDefinitionRepresentation.hxx>
#include<RWStepShape_RWShapeDimensionRepresentation.hxx>
#include<RWStepShape_RWShapeRepresentation.hxx>
#include<RWStepShape_RWShapeRepresentationWithParameters.hxx>
#include<RWStepShape_RWShellBasedSurfaceModel.hxx>
#include<RWStepShape_RWSolidModel.hxx>
#include<RWStepShape_RWSolidReplica.hxx>
#include<RWStepShape_RWSphere.hxx>
#include<RWStepShape_RWSubedge.hxx>
#include<RWStepShape_RWSubface.hxx>
#include<RWStepShape_RWSweptAreaSolid.hxx>
#include<RWStepShape_RWSweptFaceSolid.hxx>
#include<RWStepShape_RWToleranceValue.hxx>
#include<RWStepShape_RWTopologicalRepresentationItem.hxx>
#include<RWStepShape_RWTorus.hxx>
#include<RWStepShape_RWTransitionalShapeRepresentation.hxx>
#include<RWStepShape_RWTypeQualifier.hxx>
#include<RWStepShape_RWValueFormatTypeQualifier.hxx>
#include<RWStepShape_RWVertex.hxx>
#include<RWStepShape_RWVertexLoop.hxx>
#include<RWStepShape_RWVertexPoint.hxx>

#endif // RWSTEPSHAPE_HXX
