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
#ifndef STEPKINEMATICS_HXX
#define STEPKINEMATICS_HXX


#include<StepKinematics_ActuatedDirection.hxx>
#include<StepKinematics_ActuatedKinPairAndOrderKinPair.hxx>
#include<StepKinematics_ActuatedKinematicPair.hxx>
#include<StepKinematics_ContextDependentKinematicLinkRepresentation.hxx>
#include<StepKinematics_CylindricalPair.hxx>
#include<StepKinematics_CylindricalPairValue.hxx>
#include<StepKinematics_CylindricalPairWithRange.hxx>
#include<StepKinematics_FullyConstrainedPair.hxx>
#include<StepKinematics_GearPair.hxx>
#include<StepKinematics_GearPairValue.hxx>
#include<StepKinematics_GearPairWithRange.hxx>
#include<StepKinematics_HighOrderKinematicPair.hxx>
#include<StepKinematics_HomokineticPair.hxx>
#include<StepKinematics_KinematicJoint.hxx>
#include<StepKinematics_KinematicLink.hxx>
#include<StepKinematics_KinematicLinkRepresentation.hxx>
#include<StepKinematics_KinematicLinkRepresentationAssociation.hxx>
#include<StepKinematics_KinematicPair.hxx>
#include<StepKinematics_KinematicPropertyDefinitionRepresentation.hxx>
#include<StepKinematics_KinematicPropertyMechanismRepresentation.hxx>
#include<StepKinematics_KinematicTopologyDirectedStructure.hxx>
#include<StepKinematics_KinematicTopologyNetworkStructure.hxx>
#include<StepKinematics_KinematicTopologyRepresentationSelect.hxx>
#include<StepKinematics_KinematicTopologyStructure.hxx>
#include<StepKinematics_LinearFlexibleAndPinionPair.hxx>
#include<StepKinematics_LinearFlexibleAndPlanarCurvePair.hxx>
#include<StepKinematics_LinearFlexibleLinkRepresentation.hxx>
#include<StepKinematics_LowOrderKinematicPair.hxx>
#include<StepKinematics_LowOrderKinematicPairValue.hxx>
#include<StepKinematics_LowOrderKinematicPairWithMotionCoupling.hxx>
#include<StepKinematics_LowOrderKinematicPairWithRange.hxx>
#include<StepKinematics_MechanismRepresentation.hxx>
#include<StepKinematics_MechanismStateRepresentation.hxx>
#include<StepKinematics_OrientedJoint.hxx>
#include<StepKinematics_PairRepresentationRelationship.hxx>
#include<StepKinematics_PairValue.hxx>
#include<StepKinematics_PlanarCurvePair.hxx>
#include<StepKinematics_PlanarCurvePairRange.hxx>
#include<StepKinematics_PlanarPair.hxx>
#include<StepKinematics_PlanarPairValue.hxx>
#include<StepKinematics_PlanarPairWithRange.hxx>
#include<StepKinematics_PointOnPlanarCurvePair.hxx>
#include<StepKinematics_PointOnPlanarCurvePairValue.hxx>
#include<StepKinematics_PointOnPlanarCurvePairWithRange.hxx>
#include<StepKinematics_PointOnSurfacePair.hxx>
#include<StepKinematics_PointOnSurfacePairValue.hxx>
#include<StepKinematics_PointOnSurfacePairWithRange.hxx>
#include<StepKinematics_PrismaticPair.hxx>
#include<StepKinematics_PrismaticPairValue.hxx>
#include<StepKinematics_PrismaticPairWithRange.hxx>
#include<StepKinematics_ProductDefinitionKinematics.hxx>
#include<StepKinematics_ProductDefinitionRelationshipKinematics.hxx>
#include<StepKinematics_RackAndPinionPair.hxx>
#include<StepKinematics_RackAndPinionPairValue.hxx>
#include<StepKinematics_RackAndPinionPairWithRange.hxx>
#include<StepKinematics_RevolutePair.hxx>
#include<StepKinematics_RevolutePairValue.hxx>
#include<StepKinematics_RevolutePairWithRange.hxx>
#include<StepKinematics_RigidLinkRepresentation.hxx>
#include<StepKinematics_RigidPlacement.hxx>
#include<StepKinematics_RollingCurvePair.hxx>
#include<StepKinematics_RollingCurvePairValue.hxx>
#include<StepKinematics_RollingSurfacePair.hxx>
#include<StepKinematics_RollingSurfacePairValue.hxx>
#include<StepKinematics_RotationAboutDirection.hxx>
#include<StepKinematics_ScrewPair.hxx>
#include<StepKinematics_ScrewPairValue.hxx>
#include<StepKinematics_ScrewPairWithRange.hxx>
#include<StepKinematics_SlidingCurvePair.hxx>
#include<StepKinematics_SlidingCurvePairValue.hxx>
#include<StepKinematics_SlidingSurfacePair.hxx>
#include<StepKinematics_SlidingSurfacePairValue.hxx>
#include<StepKinematics_SpatialRotation.hxx>
#include<StepKinematics_SphericalPair.hxx>
#include<StepKinematics_SphericalPairSelect.hxx>
#include<StepKinematics_SphericalPairValue.hxx>
#include<StepKinematics_SphericalPairWithPin.hxx>
#include<StepKinematics_SphericalPairWithPinAndRange.hxx>
#include<StepKinematics_SphericalPairWithRange.hxx>
#include<StepKinematics_SurfacePair.hxx>
#include<StepKinematics_SurfacePairWithRange.hxx>
#include<StepKinematics_UnconstrainedPair.hxx>
#include<StepKinematics_UnconstrainedPairValue.hxx>
#include<StepKinematics_UniversalPair.hxx>
#include<StepKinematics_UniversalPairValue.hxx>
#include<StepKinematics_UniversalPairWithRange.hxx>

#endif // STEPKINEMATICS_HXX
