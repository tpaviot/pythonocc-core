#ifndef STEPFEA_HXX
#define STEPFEA_HXX

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

#include<StepFEA_AlignedCurve3dElementCoordinateSystem.hxx>
#include<StepFEA_AlignedSurface3dElementCoordinateSystem.hxx>
#include<StepFEA_ArbitraryVolume3dElementCoordinateSystem.hxx>
#include<StepFEA_Array1OfCurveElementEndOffset.hxx>
#include<StepFEA_Array1OfCurveElementEndRelease.hxx>
#include<StepFEA_Array1OfCurveElementInterval.hxx>
#include<StepFEA_Array1OfDegreeOfFreedom.hxx>
#include<StepFEA_Array1OfElementRepresentation.hxx>
#include<StepFEA_Array1OfNodeRepresentation.hxx>
#include<StepFEA_ConstantSurface3dElementCoordinateSystem.hxx>
#include<StepFEA_CoordinateSystemType.hxx>
#include<StepFEA_Curve3dElementProperty.hxx>
#include<StepFEA_Curve3dElementRepresentation.hxx>
#include<StepFEA_CurveEdge.hxx>
#include<StepFEA_CurveElementEndCoordinateSystem.hxx>
#include<StepFEA_CurveElementEndOffset.hxx>
#include<StepFEA_CurveElementEndRelease.hxx>
#include<StepFEA_CurveElementInterval.hxx>
#include<StepFEA_CurveElementIntervalConstant.hxx>
#include<StepFEA_CurveElementIntervalLinearlyVarying.hxx>
#include<StepFEA_CurveElementLocation.hxx>
#include<StepFEA_DegreeOfFreedom.hxx>
#include<StepFEA_DegreeOfFreedomMember.hxx>
#include<StepFEA_DummyNode.hxx>
#include<StepFEA_ElementGeometricRelationship.hxx>
#include<StepFEA_ElementGroup.hxx>
#include<StepFEA_ElementOrElementGroup.hxx>
#include<StepFEA_ElementRepresentation.hxx>
#include<StepFEA_ElementVolume.hxx>
#include<StepFEA_EnumeratedDegreeOfFreedom.hxx>
#include<StepFEA_FeaAreaDensity.hxx>
#include<StepFEA_FeaAxis2Placement3d.hxx>
#include<StepFEA_FeaCurveSectionGeometricRelationship.hxx>
#include<StepFEA_FeaGroup.hxx>
#include<StepFEA_FeaLinearElasticity.hxx>
#include<StepFEA_FeaMassDensity.hxx>
#include<StepFEA_FeaMaterialPropertyRepresentation.hxx>
#include<StepFEA_FeaMaterialPropertyRepresentationItem.hxx>
#include<StepFEA_FeaModel.hxx>
#include<StepFEA_FeaModel3d.hxx>
#include<StepFEA_FeaModelDefinition.hxx>
#include<StepFEA_FeaMoistureAbsorption.hxx>
#include<StepFEA_FeaParametricPoint.hxx>
#include<StepFEA_FeaRepresentationItem.hxx>
#include<StepFEA_FeaSecantCoefficientOfLinearThermalExpansion.hxx>
#include<StepFEA_FeaShellBendingStiffness.hxx>
#include<StepFEA_FeaShellMembraneBendingCouplingStiffness.hxx>
#include<StepFEA_FeaShellMembraneStiffness.hxx>
#include<StepFEA_FeaShellShearStiffness.hxx>
#include<StepFEA_FeaSurfaceSectionGeometricRelationship.hxx>
#include<StepFEA_FeaTangentialCoefficientOfLinearThermalExpansion.hxx>
#include<StepFEA_FreedomAndCoefficient.hxx>
#include<StepFEA_FreedomsList.hxx>
#include<StepFEA_GeometricNode.hxx>
#include<StepFEA_HArray1OfCurveElementEndOffset.hxx>
#include<StepFEA_HArray1OfCurveElementEndRelease.hxx>
#include<StepFEA_HArray1OfCurveElementInterval.hxx>
#include<StepFEA_HArray1OfDegreeOfFreedom.hxx>
#include<StepFEA_HArray1OfElementRepresentation.hxx>
#include<StepFEA_HArray1OfNodeRepresentation.hxx>
#include<StepFEA_HSequenceOfCurve3dElementProperty.hxx>
#include<StepFEA_HSequenceOfElementGeometricRelationship.hxx>
#include<StepFEA_HSequenceOfElementRepresentation.hxx>
#include<StepFEA_HSequenceOfNodeRepresentation.hxx>
#include<StepFEA_Node.hxx>
#include<StepFEA_NodeDefinition.hxx>
#include<StepFEA_NodeGroup.hxx>
#include<StepFEA_NodeRepresentation.hxx>
#include<StepFEA_NodeSet.hxx>
#include<StepFEA_NodeWithSolutionCoordinateSystem.hxx>
#include<StepFEA_NodeWithVector.hxx>
#include<StepFEA_ParametricCurve3dElementCoordinateDirection.hxx>
#include<StepFEA_ParametricCurve3dElementCoordinateSystem.hxx>
#include<StepFEA_ParametricSurface3dElementCoordinateSystem.hxx>
#include<StepFEA_SequenceOfCurve3dElementProperty.hxx>
#include<StepFEA_SequenceOfElementGeometricRelationship.hxx>
#include<StepFEA_SequenceOfElementRepresentation.hxx>
#include<StepFEA_SequenceOfNodeRepresentation.hxx>
#include<StepFEA_Surface3dElementRepresentation.hxx>
#include<StepFEA_SymmetricTensor22d.hxx>
#include<StepFEA_SymmetricTensor23d.hxx>
#include<StepFEA_SymmetricTensor23dMember.hxx>
#include<StepFEA_SymmetricTensor42d.hxx>
#include<StepFEA_SymmetricTensor43d.hxx>
#include<StepFEA_SymmetricTensor43dMember.hxx>
#include<StepFEA_UnspecifiedValue.hxx>
#include<StepFEA_Volume3dElementRepresentation.hxx>

#endif // STEPFEA_HXX
