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
#ifndef RWSTEPKINEMATICS_HXX
#define RWSTEPKINEMATICS_HXX


#include<RWStepKinematics_RWActuatedKinPairAndOrderKinPair.hxx>
#include<RWStepKinematics_RWActuatedKinematicPair.hxx>
#include<RWStepKinematics_RWContextDependentKinematicLinkRepresentation.hxx>
#include<RWStepKinematics_RWCylindricalPair.hxx>
#include<RWStepKinematics_RWCylindricalPairValue.hxx>
#include<RWStepKinematics_RWCylindricalPairWithRange.hxx>
#include<RWStepKinematics_RWFullyConstrainedPair.hxx>
#include<RWStepKinematics_RWGearPair.hxx>
#include<RWStepKinematics_RWGearPairValue.hxx>
#include<RWStepKinematics_RWGearPairWithRange.hxx>
#include<RWStepKinematics_RWHomokineticPair.hxx>
#include<RWStepKinematics_RWKinematicJoint.hxx>
#include<RWStepKinematics_RWKinematicLink.hxx>
#include<RWStepKinematics_RWKinematicLinkRepresentationAssociation.hxx>
#include<RWStepKinematics_RWKinematicPropertyMechanismRepresentation.hxx>
#include<RWStepKinematics_RWKinematicTopologyDirectedStructure.hxx>
#include<RWStepKinematics_RWKinematicTopologyNetworkStructure.hxx>
#include<RWStepKinematics_RWKinematicTopologyStructure.hxx>
#include<RWStepKinematics_RWLinearFlexibleAndPinionPair.hxx>
#include<RWStepKinematics_RWLinearFlexibleAndPlanarCurvePair.hxx>
#include<RWStepKinematics_RWLinearFlexibleLinkRepresentation.hxx>
#include<RWStepKinematics_RWLowOrderKinematicPair.hxx>
#include<RWStepKinematics_RWLowOrderKinematicPairValue.hxx>
#include<RWStepKinematics_RWLowOrderKinematicPairWithRange.hxx>
#include<RWStepKinematics_RWMechanismRepresentation.hxx>
#include<RWStepKinematics_RWMechanismStateRepresentation.hxx>
#include<RWStepKinematics_RWOrientedJoint.hxx>
#include<RWStepKinematics_RWPairRepresentationRelationship.hxx>
#include<RWStepKinematics_RWPlanarCurvePair.hxx>
#include<RWStepKinematics_RWPlanarCurvePairRange.hxx>
#include<RWStepKinematics_RWPlanarPair.hxx>
#include<RWStepKinematics_RWPlanarPairValue.hxx>
#include<RWStepKinematics_RWPlanarPairWithRange.hxx>
#include<RWStepKinematics_RWPointOnPlanarCurvePair.hxx>
#include<RWStepKinematics_RWPointOnPlanarCurvePairValue.hxx>
#include<RWStepKinematics_RWPointOnPlanarCurvePairWithRange.hxx>
#include<RWStepKinematics_RWPointOnSurfacePair.hxx>
#include<RWStepKinematics_RWPointOnSurfacePairValue.hxx>
#include<RWStepKinematics_RWPointOnSurfacePairWithRange.hxx>
#include<RWStepKinematics_RWPrismaticPair.hxx>
#include<RWStepKinematics_RWPrismaticPairValue.hxx>
#include<RWStepKinematics_RWPrismaticPairWithRange.hxx>
#include<RWStepKinematics_RWProductDefinitionKinematics.hxx>
#include<RWStepKinematics_RWProductDefinitionRelationshipKinematics.hxx>
#include<RWStepKinematics_RWRackAndPinionPair.hxx>
#include<RWStepKinematics_RWRackAndPinionPairValue.hxx>
#include<RWStepKinematics_RWRackAndPinionPairWithRange.hxx>
#include<RWStepKinematics_RWRevolutePair.hxx>
#include<RWStepKinematics_RWRevolutePairValue.hxx>
#include<RWStepKinematics_RWRevolutePairWithRange.hxx>
#include<RWStepKinematics_RWRigidLinkRepresentation.hxx>
#include<RWStepKinematics_RWRollingCurvePair.hxx>
#include<RWStepKinematics_RWRollingCurvePairValue.hxx>
#include<RWStepKinematics_RWRollingSurfacePair.hxx>
#include<RWStepKinematics_RWRollingSurfacePairValue.hxx>
#include<RWStepKinematics_RWRotationAboutDirection.hxx>
#include<RWStepKinematics_RWScrewPair.hxx>
#include<RWStepKinematics_RWScrewPairValue.hxx>
#include<RWStepKinematics_RWScrewPairWithRange.hxx>
#include<RWStepKinematics_RWSlidingCurvePair.hxx>
#include<RWStepKinematics_RWSlidingCurvePairValue.hxx>
#include<RWStepKinematics_RWSlidingSurfacePair.hxx>
#include<RWStepKinematics_RWSlidingSurfacePairValue.hxx>
#include<RWStepKinematics_RWSphericalPair.hxx>
#include<RWStepKinematics_RWSphericalPairValue.hxx>
#include<RWStepKinematics_RWSphericalPairWithPin.hxx>
#include<RWStepKinematics_RWSphericalPairWithPinAndRange.hxx>
#include<RWStepKinematics_RWSphericalPairWithRange.hxx>
#include<RWStepKinematics_RWSurfacePairWithRange.hxx>
#include<RWStepKinematics_RWUnconstrainedPair.hxx>
#include<RWStepKinematics_RWUnconstrainedPairValue.hxx>
#include<RWStepKinematics_RWUniversalPair.hxx>
#include<RWStepKinematics_RWUniversalPairValue.hxx>
#include<RWStepKinematics_RWUniversalPairWithRange.hxx>

#endif // RWSTEPKINEMATICS_HXX
