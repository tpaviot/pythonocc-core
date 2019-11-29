#ifndef STEPSHAPE_HXX
#define STEPSHAPE_HXX

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

#include<StepShape_AdvancedBrepShapeRepresentation.hxx>
#include<StepShape_AdvancedFace.hxx>
#include<StepShape_AngleRelator.hxx>
#include<StepShape_AngularLocation.hxx>
#include<StepShape_AngularSize.hxx>
#include<StepShape_Array1OfConnectedEdgeSet.hxx>
#include<StepShape_Array1OfConnectedFaceSet.hxx>
#include<StepShape_Array1OfEdge.hxx>
#include<StepShape_Array1OfFace.hxx>
#include<StepShape_Array1OfFaceBound.hxx>
#include<StepShape_Array1OfGeometricSetSelect.hxx>
#include<StepShape_Array1OfOrientedClosedShell.hxx>
#include<StepShape_Array1OfOrientedEdge.hxx>
#include<StepShape_Array1OfShapeDimensionRepresentationItem.hxx>
#include<StepShape_Array1OfShell.hxx>
#include<StepShape_Array1OfValueQualifier.hxx>
#include<StepShape_Block.hxx>
#include<StepShape_BooleanOperand.hxx>
#include<StepShape_BooleanOperator.hxx>
#include<StepShape_BooleanResult.hxx>
#include<StepShape_BoxDomain.hxx>
#include<StepShape_BoxedHalfSpace.hxx>
#include<StepShape_BrepWithVoids.hxx>
#include<StepShape_ClosedShell.hxx>
#include<StepShape_CompoundShapeRepresentation.hxx>
#include<StepShape_ConnectedEdgeSet.hxx>
#include<StepShape_ConnectedFaceSet.hxx>
#include<StepShape_ConnectedFaceShapeRepresentation.hxx>
#include<StepShape_ConnectedFaceSubSet.hxx>
#include<StepShape_ContextDependentShapeRepresentation.hxx>
#include<StepShape_CsgPrimitive.hxx>
#include<StepShape_CsgSelect.hxx>
#include<StepShape_CsgShapeRepresentation.hxx>
#include<StepShape_CsgSolid.hxx>
#include<StepShape_DefinitionalRepresentationAndShapeRepresentation.hxx>
#include<StepShape_DimensionalCharacteristic.hxx>
#include<StepShape_DimensionalCharacteristicRepresentation.hxx>
#include<StepShape_DimensionalLocation.hxx>
#include<StepShape_DimensionalLocationWithPath.hxx>
#include<StepShape_DimensionalSize.hxx>
#include<StepShape_DimensionalSizeWithPath.hxx>
#include<StepShape_DirectedDimensionalLocation.hxx>
#include<StepShape_Edge.hxx>
#include<StepShape_EdgeBasedWireframeModel.hxx>
#include<StepShape_EdgeBasedWireframeShapeRepresentation.hxx>
#include<StepShape_EdgeCurve.hxx>
#include<StepShape_EdgeLoop.hxx>
#include<StepShape_ExtrudedAreaSolid.hxx>
#include<StepShape_ExtrudedFaceSolid.hxx>
#include<StepShape_Face.hxx>
#include<StepShape_FaceBasedSurfaceModel.hxx>
#include<StepShape_FaceBound.hxx>
#include<StepShape_FaceOuterBound.hxx>
#include<StepShape_FaceSurface.hxx>
#include<StepShape_FacetedBrep.hxx>
#include<StepShape_FacetedBrepAndBrepWithVoids.hxx>
#include<StepShape_FacetedBrepShapeRepresentation.hxx>
#include<StepShape_GeometricCurveSet.hxx>
#include<StepShape_GeometricSet.hxx>
#include<StepShape_GeometricSetSelect.hxx>
#include<StepShape_GeometricallyBoundedSurfaceShapeRepresentation.hxx>
#include<StepShape_GeometricallyBoundedWireframeShapeRepresentation.hxx>
#include<StepShape_HArray1OfConnectedEdgeSet.hxx>
#include<StepShape_HArray1OfConnectedFaceSet.hxx>
#include<StepShape_HArray1OfEdge.hxx>
#include<StepShape_HArray1OfFace.hxx>
#include<StepShape_HArray1OfFaceBound.hxx>
#include<StepShape_HArray1OfGeometricSetSelect.hxx>
#include<StepShape_HArray1OfOrientedClosedShell.hxx>
#include<StepShape_HArray1OfOrientedEdge.hxx>
#include<StepShape_HArray1OfShapeDimensionRepresentationItem.hxx>
#include<StepShape_HArray1OfShell.hxx>
#include<StepShape_HArray1OfValueQualifier.hxx>
#include<StepShape_HalfSpaceSolid.hxx>
#include<StepShape_LimitsAndFits.hxx>
#include<StepShape_Loop.hxx>
#include<StepShape_LoopAndPath.hxx>
#include<StepShape_ManifoldSolidBrep.hxx>
#include<StepShape_ManifoldSurfaceShapeRepresentation.hxx>
#include<StepShape_MeasureQualification.hxx>
#include<StepShape_MeasureRepresentationItemAndQualifiedRepresentationItem.hxx>
#include<StepShape_NonManifoldSurfaceShapeRepresentation.hxx>
#include<StepShape_OpenShell.hxx>
#include<StepShape_OrientedClosedShell.hxx>
#include<StepShape_OrientedEdge.hxx>
#include<StepShape_OrientedFace.hxx>
#include<StepShape_OrientedOpenShell.hxx>
#include<StepShape_OrientedPath.hxx>
#include<StepShape_Path.hxx>
#include<StepShape_PlusMinusTolerance.hxx>
#include<StepShape_PointRepresentation.hxx>
#include<StepShape_PolyLoop.hxx>
#include<StepShape_PrecisionQualifier.hxx>
#include<StepShape_QualifiedRepresentationItem.hxx>
#include<StepShape_ReversibleTopologyItem.hxx>
#include<StepShape_RevolvedAreaSolid.hxx>
#include<StepShape_RevolvedFaceSolid.hxx>
#include<StepShape_RightAngularWedge.hxx>
#include<StepShape_RightCircularCone.hxx>
#include<StepShape_RightCircularCylinder.hxx>
#include<StepShape_SeamEdge.hxx>
#include<StepShape_ShapeDefinitionRepresentation.hxx>
#include<StepShape_ShapeDimensionRepresentation.hxx>
#include<StepShape_ShapeDimensionRepresentationItem.hxx>
#include<StepShape_ShapeRepresentation.hxx>
#include<StepShape_ShapeRepresentationWithParameters.hxx>
#include<StepShape_Shell.hxx>
#include<StepShape_ShellBasedSurfaceModel.hxx>
#include<StepShape_SolidModel.hxx>
#include<StepShape_SolidReplica.hxx>
#include<StepShape_Sphere.hxx>
#include<StepShape_Subedge.hxx>
#include<StepShape_Subface.hxx>
#include<StepShape_SurfaceModel.hxx>
#include<StepShape_SweptAreaSolid.hxx>
#include<StepShape_SweptFaceSolid.hxx>
#include<StepShape_ToleranceMethodDefinition.hxx>
#include<StepShape_ToleranceValue.hxx>
#include<StepShape_TopologicalRepresentationItem.hxx>
#include<StepShape_Torus.hxx>
#include<StepShape_TransitionalShapeRepresentation.hxx>
#include<StepShape_TypeQualifier.hxx>
#include<StepShape_ValueFormatTypeQualifier.hxx>
#include<StepShape_ValueQualifier.hxx>
#include<StepShape_Vertex.hxx>
#include<StepShape_VertexLoop.hxx>
#include<StepShape_VertexPoint.hxx>

#endif // STEPSHAPE_HXX
