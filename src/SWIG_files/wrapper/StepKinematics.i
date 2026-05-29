/*
Copyright 2008-2026 Thomas Paviot (tpaviot@gmail.com)

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
%define STEPKINEMATICSDOCSTRING
"StepKinematics module, see official documentation at
https://dev.opencascade.org/doc/occt-7.9.0/refman/html/package_stepkinematics.html"
%enddef
%module (package="OCC.Core", docstring=STEPKINEMATICSDOCSTRING) StepKinematics


%{
#ifdef WNT
#pragma warning(disable : 4716)
#endif
%}

%include ../common/CommonIncludes.i
%include ../common/ExceptionCatcher.i
%include ../common/FunctionTransformers.i
%include ../common/EnumTemplates.i
%include ../common/Operators.i
%include ../common/OccHandle.i
%include ../common/IOStream.i
%include ../common/ArrayMacros.i


%{
#include<StepKinematics_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<StepShape_module.hxx>
#include<StepRepr_module.hxx>
#include<TCollection_module.hxx>
#include<StepGeom_module.hxx>
#include<StepData_module.hxx>
#include<TColStd_module.hxx>
#include<Message_module.hxx>
#include<Interface_module.hxx>
#include<StepGeom_module.hxx>
#include<StepData_module.hxx>
#include<StepBasic_module.hxx>
#include<MoniTool_module.hxx>
#include<TopoDS_module.hxx>
#include<Resource_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import StepShape.i
%import StepRepr.i
%import TCollection.i
%import StepGeom.i
%import StepData.i
%import TColStd.i

%pythoncode {
from enum import IntEnum
from OCC.Core.Exception import *
};

/* public enums */
enum StepKinematics_ActuatedDirection {
	StepKinematics_adBidirectional = 0,
	StepKinematics_adPositiveOnly = 1,
	StepKinematics_adNegativeOnly = 2,
	StepKinematics_adNotActuated = 3,
};

/* end public enums declaration */

/* python proxy classes for enums */
%pythoncode {

class StepKinematics_ActuatedDirection(IntEnum):
	StepKinematics_adBidirectional = 0
	StepKinematics_adPositiveOnly = 1
	StepKinematics_adNegativeOnly = 2
	StepKinematics_adNotActuated = 3
StepKinematics_adBidirectional = StepKinematics_ActuatedDirection.StepKinematics_adBidirectional
StepKinematics_adPositiveOnly = StepKinematics_ActuatedDirection.StepKinematics_adPositiveOnly
StepKinematics_adNegativeOnly = StepKinematics_ActuatedDirection.StepKinematics_adNegativeOnly
StepKinematics_adNotActuated = StepKinematics_ActuatedDirection.StepKinematics_adNotActuated
};
/* end python proxy for enums */

/* handles */
%wrap_handle(StepKinematics_ContextDependentKinematicLinkRepresentation)
%wrap_handle(StepKinematics_KinematicJoint)
%wrap_handle(StepKinematics_KinematicLink)
%wrap_handle(StepKinematics_KinematicLinkRepresentation)
%wrap_handle(StepKinematics_KinematicLinkRepresentationAssociation)
%wrap_handle(StepKinematics_KinematicPair)
%wrap_handle(StepKinematics_KinematicPropertyDefinitionRepresentation)
%wrap_handle(StepKinematics_KinematicTopologyDirectedStructure)
%wrap_handle(StepKinematics_KinematicTopologyNetworkStructure)
%wrap_handle(StepKinematics_KinematicTopologyStructure)
%wrap_handle(StepKinematics_MechanismRepresentation)
%wrap_handle(StepKinematics_MechanismStateRepresentation)
%wrap_handle(StepKinematics_OrientedJoint)
%wrap_handle(StepKinematics_PairRepresentationRelationship)
%wrap_handle(StepKinematics_PairValue)
%wrap_handle(StepKinematics_ProductDefinitionKinematics)
%wrap_handle(StepKinematics_ProductDefinitionRelationshipKinematics)
%wrap_handle(StepKinematics_RotationAboutDirection)
%wrap_handle(StepKinematics_ActuatedKinPairAndOrderKinPair)
%wrap_handle(StepKinematics_ActuatedKinematicPair)
%wrap_handle(StepKinematics_CylindricalPairValue)
%wrap_handle(StepKinematics_GearPairValue)
%wrap_handle(StepKinematics_HighOrderKinematicPair)
%wrap_handle(StepKinematics_KinematicPropertyMechanismRepresentation)
%wrap_handle(StepKinematics_LinearFlexibleLinkRepresentation)
%wrap_handle(StepKinematics_LowOrderKinematicPair)
%wrap_handle(StepKinematics_LowOrderKinematicPairValue)
%wrap_handle(StepKinematics_LowOrderKinematicPairWithMotionCoupling)
%wrap_handle(StepKinematics_PlanarPairValue)
%wrap_handle(StepKinematics_PointOnPlanarCurvePairValue)
%wrap_handle(StepKinematics_PointOnSurfacePairValue)
%wrap_handle(StepKinematics_PrismaticPairValue)
%wrap_handle(StepKinematics_RackAndPinionPairValue)
%wrap_handle(StepKinematics_RevolutePairValue)
%wrap_handle(StepKinematics_RigidLinkRepresentation)
%wrap_handle(StepKinematics_RollingCurvePairValue)
%wrap_handle(StepKinematics_RollingSurfacePairValue)
%wrap_handle(StepKinematics_ScrewPairValue)
%wrap_handle(StepKinematics_SlidingCurvePairValue)
%wrap_handle(StepKinematics_SlidingSurfacePairValue)
%wrap_handle(StepKinematics_SphericalPairValue)
%wrap_handle(StepKinematics_UnconstrainedPairValue)
%wrap_handle(StepKinematics_UniversalPairValue)
%wrap_handle(StepKinematics_CylindricalPair)
%wrap_handle(StepKinematics_FullyConstrainedPair)
%wrap_handle(StepKinematics_GearPair)
%wrap_handle(StepKinematics_LinearFlexibleAndPinionPair)
%wrap_handle(StepKinematics_LinearFlexibleAndPlanarCurvePair)
%wrap_handle(StepKinematics_LowOrderKinematicPairWithRange)
%wrap_handle(StepKinematics_PlanarCurvePair)
%wrap_handle(StepKinematics_PlanarPair)
%wrap_handle(StepKinematics_PointOnPlanarCurvePair)
%wrap_handle(StepKinematics_PointOnSurfacePair)
%wrap_handle(StepKinematics_PrismaticPair)
%wrap_handle(StepKinematics_RackAndPinionPair)
%wrap_handle(StepKinematics_RevolutePair)
%wrap_handle(StepKinematics_ScrewPair)
%wrap_handle(StepKinematics_SphericalPair)
%wrap_handle(StepKinematics_SphericalPairWithPin)
%wrap_handle(StepKinematics_SurfacePair)
%wrap_handle(StepKinematics_UnconstrainedPair)
%wrap_handle(StepKinematics_UniversalPair)
%wrap_handle(StepKinematics_CylindricalPairWithRange)
%wrap_handle(StepKinematics_GearPairWithRange)
%wrap_handle(StepKinematics_HomokineticPair)
%wrap_handle(StepKinematics_PlanarCurvePairRange)
%wrap_handle(StepKinematics_PlanarPairWithRange)
%wrap_handle(StepKinematics_PointOnPlanarCurvePairWithRange)
%wrap_handle(StepKinematics_PointOnSurfacePairWithRange)
%wrap_handle(StepKinematics_PrismaticPairWithRange)
%wrap_handle(StepKinematics_RackAndPinionPairWithRange)
%wrap_handle(StepKinematics_RevolutePairWithRange)
%wrap_handle(StepKinematics_RollingCurvePair)
%wrap_handle(StepKinematics_RollingSurfacePair)
%wrap_handle(StepKinematics_ScrewPairWithRange)
%wrap_handle(StepKinematics_SlidingCurvePair)
%wrap_handle(StepKinematics_SlidingSurfacePair)
%wrap_handle(StepKinematics_SphericalPairWithPinAndRange)
%wrap_handle(StepKinematics_SphericalPairWithRange)
%wrap_handle(StepKinematics_SurfacePairWithRange)
%wrap_handle(StepKinematics_UniversalPairWithRange)
/* end handles declaration */

/* templates */
/* end templates declaration */

/* typedefs */
/* end typedefs declaration */

/*******************************************************************
* class StepKinematics_ContextDependentKinematicLinkRepresentation *
*******************************************************************/
class StepKinematics_ContextDependentKinematicLinkRepresentation : public Standard_Transient {
	public:
		/****** StepKinematics_ContextDependentKinematicLinkRepresentation::StepKinematics_ContextDependentKinematicLinkRepresentation ******/
		/****** md5 signature: 92fd4868cbb3efd7da3ca7a0d6e2f92d ******/
		%feature("compactdefaultargs") StepKinematics_ContextDependentKinematicLinkRepresentation;
		%feature("autodoc", "Return
-------
None

Description
-----------
default constructor.
") StepKinematics_ContextDependentKinematicLinkRepresentation;
		 StepKinematics_ContextDependentKinematicLinkRepresentation();

		/****** StepKinematics_ContextDependentKinematicLinkRepresentation::Init ******/
		/****** md5 signature: 95c0b211c65c5c7c222623c010b65242 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
theRepresentationRelation: StepKinematics_KinematicLinkRepresentationAssociation
theRepresentedProductRelation: StepKinematics_ProductDefinitionRelationshipKinematics

Return
-------
None

Description
-----------
Initialize all fields (own and inherited).
") Init;
		void Init(const opencascade::handle<StepKinematics_KinematicLinkRepresentationAssociation> & theRepresentationRelation, const opencascade::handle<StepKinematics_ProductDefinitionRelationshipKinematics> & theRepresentedProductRelation);

		/****** StepKinematics_ContextDependentKinematicLinkRepresentation::RepresentationRelation ******/
		/****** md5 signature: 6425d79fca67984922e06816d68741f0 ******/
		%feature("compactdefaultargs") RepresentationRelation;
		%feature("autodoc", "Return
-------
opencascade::handle<StepKinematics_KinematicLinkRepresentationAssociation>

Description
-----------
Returns field RepresentationRelation.
") RepresentationRelation;
		opencascade::handle<StepKinematics_KinematicLinkRepresentationAssociation> RepresentationRelation();

		/****** StepKinematics_ContextDependentKinematicLinkRepresentation::RepresentedProductRelation ******/
		/****** md5 signature: 11fb34b6e103b32e2141fd003591655a ******/
		%feature("compactdefaultargs") RepresentedProductRelation;
		%feature("autodoc", "Return
-------
opencascade::handle<StepKinematics_ProductDefinitionRelationshipKinematics>

Description
-----------
Returns field RepresentedProductRelation.
") RepresentedProductRelation;
		opencascade::handle<StepKinematics_ProductDefinitionRelationshipKinematics> RepresentedProductRelation();

		/****** StepKinematics_ContextDependentKinematicLinkRepresentation::SetRepresentationRelation ******/
		/****** md5 signature: b13fa332347bac3a14690fef4ee07997 ******/
		%feature("compactdefaultargs") SetRepresentationRelation;
		%feature("autodoc", "
Parameters
----------
theRepresentationRelation: StepKinematics_KinematicLinkRepresentationAssociation

Return
-------
None

Description
-----------
Sets field RepresentationRelation.
") SetRepresentationRelation;
		void SetRepresentationRelation(const opencascade::handle<StepKinematics_KinematicLinkRepresentationAssociation> & theRepresentationRelation);

		/****** StepKinematics_ContextDependentKinematicLinkRepresentation::SetRepresentedProductRelation ******/
		/****** md5 signature: 0e8e4cdcaee73443967d920d4eb7cd31 ******/
		%feature("compactdefaultargs") SetRepresentedProductRelation;
		%feature("autodoc", "
Parameters
----------
theRepresentedProductRelation: StepKinematics_ProductDefinitionRelationshipKinematics

Return
-------
None

Description
-----------
Sets field RepresentedProductRelation.
") SetRepresentedProductRelation;
		void SetRepresentedProductRelation(const opencascade::handle<StepKinematics_ProductDefinitionRelationshipKinematics> & theRepresentedProductRelation);

};


%make_alias(StepKinematics_ContextDependentKinematicLinkRepresentation)

%extend StepKinematics_ContextDependentKinematicLinkRepresentation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************************
* class StepKinematics_KinematicJoint *
**************************************/
class StepKinematics_KinematicJoint : public StepShape_Edge {
	public:
		/****** StepKinematics_KinematicJoint::StepKinematics_KinematicJoint ******/
		/****** md5 signature: 499e0bdc6099b307892187ba4ec4dc9e ******/
		%feature("compactdefaultargs") StepKinematics_KinematicJoint;
		%feature("autodoc", "Return
-------
None

Description
-----------
default constructor.
") StepKinematics_KinematicJoint;
		 StepKinematics_KinematicJoint();

};


%make_alias(StepKinematics_KinematicJoint)

%extend StepKinematics_KinematicJoint {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************************
* class StepKinematics_KinematicLink *
*************************************/
class StepKinematics_KinematicLink : public StepShape_Vertex {
	public:
		/****** StepKinematics_KinematicLink::StepKinematics_KinematicLink ******/
		/****** md5 signature: 5be2cd18b69c5e4ba1de0dbf9e7e61f2 ******/
		%feature("compactdefaultargs") StepKinematics_KinematicLink;
		%feature("autodoc", "Return
-------
None

Description
-----------
default constructor.
") StepKinematics_KinematicLink;
		 StepKinematics_KinematicLink();

};


%make_alias(StepKinematics_KinematicLink)

%extend StepKinematics_KinematicLink {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************************************
* class StepKinematics_KinematicLinkRepresentation *
***************************************************/
class StepKinematics_KinematicLinkRepresentation : public StepRepr_Representation {
	public:
		/****** StepKinematics_KinematicLinkRepresentation::StepKinematics_KinematicLinkRepresentation ******/
		/****** md5 signature: 7371208c3f06377e718de0c3477c6a29 ******/
		%feature("compactdefaultargs") StepKinematics_KinematicLinkRepresentation;
		%feature("autodoc", "Return
-------
None

Description
-----------
default constructor.
") StepKinematics_KinematicLinkRepresentation;
		 StepKinematics_KinematicLinkRepresentation();

		/****** StepKinematics_KinematicLinkRepresentation::Init ******/
		/****** md5 signature: 7f99115a47d2dbf3f43d075ccdcd156b ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
theRepresentation_Name: TCollection_HAsciiString
theRepresentation_Items: NCollection_HArray1<
theRepresentation_ContextOfItems: StepRepr_RepresentationContext
theRepresentedLink: StepKinematics_KinematicLink

Return
-------
None

Description
-----------
Initialize all fields (own and inherited).
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & theRepresentation_Name, const opencascade::handle<NCollection_HArray1<opencascade::handle<StepRepr_RepresentationItem>> > & theRepresentation_Items, const opencascade::handle<StepRepr_RepresentationContext> & theRepresentation_ContextOfItems, const opencascade::handle<StepKinematics_KinematicLink> & theRepresentedLink);

		/****** StepKinematics_KinematicLinkRepresentation::RepresentedLink ******/
		/****** md5 signature: de6c35595b3640206535a9be7e9d6835 ******/
		%feature("compactdefaultargs") RepresentedLink;
		%feature("autodoc", "Return
-------
opencascade::handle<StepKinematics_KinematicLink>

Description
-----------
Returns field RepresentedLink.
") RepresentedLink;
		opencascade::handle<StepKinematics_KinematicLink> RepresentedLink();

		/****** StepKinematics_KinematicLinkRepresentation::SetRepresentedLink ******/
		/****** md5 signature: a27d50a0ef8df6e5b6bf36485a62ba75 ******/
		%feature("compactdefaultargs") SetRepresentedLink;
		%feature("autodoc", "
Parameters
----------
theRepresentedLink: StepKinematics_KinematicLink

Return
-------
None

Description
-----------
Sets field RepresentedLink.
") SetRepresentedLink;
		void SetRepresentedLink(const opencascade::handle<StepKinematics_KinematicLink> & theRepresentedLink);

};


%make_alias(StepKinematics_KinematicLinkRepresentation)

%extend StepKinematics_KinematicLinkRepresentation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************************************************
* class StepKinematics_KinematicLinkRepresentationAssociation *
**************************************************************/
class StepKinematics_KinematicLinkRepresentationAssociation : public StepRepr_RepresentationRelationship {
	public:
		/****** StepKinematics_KinematicLinkRepresentationAssociation::StepKinematics_KinematicLinkRepresentationAssociation ******/
		/****** md5 signature: 91d1d0d548f27fc708b76801c26efd31 ******/
		%feature("compactdefaultargs") StepKinematics_KinematicLinkRepresentationAssociation;
		%feature("autodoc", "Return
-------
None

Description
-----------
default constructor.
") StepKinematics_KinematicLinkRepresentationAssociation;
		 StepKinematics_KinematicLinkRepresentationAssociation();

};


%make_alias(StepKinematics_KinematicLinkRepresentationAssociation)

%extend StepKinematics_KinematicLinkRepresentationAssociation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************************
* class StepKinematics_KinematicPair *
*************************************/
class StepKinematics_KinematicPair : public StepGeom_GeometricRepresentationItem {
	public:
		/****** StepKinematics_KinematicPair::StepKinematics_KinematicPair ******/
		/****** md5 signature: a922f5ee6bcec27e24cca298094ce171 ******/
		%feature("compactdefaultargs") StepKinematics_KinematicPair;
		%feature("autodoc", "Return
-------
None

Description
-----------
default constructor.
") StepKinematics_KinematicPair;
		 StepKinematics_KinematicPair();

		/****** StepKinematics_KinematicPair::Init ******/
		/****** md5 signature: c36ba177ec575d4cdbf0429ad43b1ca5 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
theRepresentationItem_Name: TCollection_HAsciiString
theItemDefinedTransformation_Name: TCollection_HAsciiString
hasItemDefinedTransformation_Description: bool
theItemDefinedTransformation_Description: TCollection_HAsciiString
theItemDefinedTransformation_TransformItem1: StepRepr_RepresentationItem
theItemDefinedTransformation_TransformItem2: StepRepr_RepresentationItem
theJoint: StepKinematics_KinematicJoint

Return
-------
None

Description
-----------
Initialize all fields (own and inherited).
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & theRepresentationItem_Name, const opencascade::handle<TCollection_HAsciiString> & theItemDefinedTransformation_Name, const bool hasItemDefinedTransformation_Description, const opencascade::handle<TCollection_HAsciiString> & theItemDefinedTransformation_Description, const opencascade::handle<StepRepr_RepresentationItem> & theItemDefinedTransformation_TransformItem1, const opencascade::handle<StepRepr_RepresentationItem> & theItemDefinedTransformation_TransformItem2, const opencascade::handle<StepKinematics_KinematicJoint> & theJoint);

		/****** StepKinematics_KinematicPair::ItemDefinedTransformation ******/
		/****** md5 signature: 1ecfef967c45a22eea8d75f88475bd67 ******/
		%feature("compactdefaultargs") ItemDefinedTransformation;
		%feature("autodoc", "Return
-------
opencascade::handle<StepRepr_ItemDefinedTransformation>

Description
-----------
Returns data for supertype ItemDefinedTransformation.
") ItemDefinedTransformation;
		opencascade::handle<StepRepr_ItemDefinedTransformation> ItemDefinedTransformation();

		/****** StepKinematics_KinematicPair::Joint ******/
		/****** md5 signature: d37d3cceaa15fd4dc3d26b0dcd4bd3c4 ******/
		%feature("compactdefaultargs") Joint;
		%feature("autodoc", "Return
-------
opencascade::handle<StepKinematics_KinematicJoint>

Description
-----------
Returns field Joint.
") Joint;
		opencascade::handle<StepKinematics_KinematicJoint> Joint();

		/****** StepKinematics_KinematicPair::SetItemDefinedTransformation ******/
		/****** md5 signature: e1075034b28e5f8412a47c465b8ce1fe ******/
		%feature("compactdefaultargs") SetItemDefinedTransformation;
		%feature("autodoc", "
Parameters
----------
theItemDefinedTransformation: StepRepr_ItemDefinedTransformation

Return
-------
None

Description
-----------
Sets data for supertype ItemDefinedTransformation.
") SetItemDefinedTransformation;
		void SetItemDefinedTransformation(const opencascade::handle<StepRepr_ItemDefinedTransformation> & theItemDefinedTransformation);

		/****** StepKinematics_KinematicPair::SetJoint ******/
		/****** md5 signature: cc96eaa7f2470dab20578cada8a550aa ******/
		%feature("compactdefaultargs") SetJoint;
		%feature("autodoc", "
Parameters
----------
theJoint: StepKinematics_KinematicJoint

Return
-------
None

Description
-----------
Sets field Joint.
") SetJoint;
		void SetJoint(const opencascade::handle<StepKinematics_KinematicJoint> & theJoint);

};


%make_alias(StepKinematics_KinematicPair)

%extend StepKinematics_KinematicPair {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************************************************
* class StepKinematics_KinematicPropertyDefinitionRepresentation *
*****************************************************************/
class StepKinematics_KinematicPropertyDefinitionRepresentation : public StepRepr_PropertyDefinitionRepresentation {
	public:
		/****** StepKinematics_KinematicPropertyDefinitionRepresentation::StepKinematics_KinematicPropertyDefinitionRepresentation ******/
		/****** md5 signature: e762629674bb86a4d8ed2a053e818548 ******/
		%feature("compactdefaultargs") StepKinematics_KinematicPropertyDefinitionRepresentation;
		%feature("autodoc", "Return
-------
None

Description
-----------
default constructor.
") StepKinematics_KinematicPropertyDefinitionRepresentation;
		 StepKinematics_KinematicPropertyDefinitionRepresentation();

};


%make_alias(StepKinematics_KinematicPropertyDefinitionRepresentation)

%extend StepKinematics_KinematicPropertyDefinitionRepresentation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************************************************
* class StepKinematics_KinematicTopologyDirectedStructure *
**********************************************************/
class StepKinematics_KinematicTopologyDirectedStructure : public StepRepr_Representation {
	public:
		/****** StepKinematics_KinematicTopologyDirectedStructure::StepKinematics_KinematicTopologyDirectedStructure ******/
		/****** md5 signature: ab26c69007457dea0f7f32a541993915 ******/
		%feature("compactdefaultargs") StepKinematics_KinematicTopologyDirectedStructure;
		%feature("autodoc", "Return
-------
None

Description
-----------
default constructor.
") StepKinematics_KinematicTopologyDirectedStructure;
		 StepKinematics_KinematicTopologyDirectedStructure();

		/****** StepKinematics_KinematicTopologyDirectedStructure::Init ******/
		/****** md5 signature: 8bd9ea0e8c764f3ef7127877cfe49785 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
theRepresentation_Name: TCollection_HAsciiString
theRepresentation_Items: NCollection_HArray1<
theRepresentation_ContextOfItems: StepRepr_RepresentationContext
theParent: StepKinematics_KinematicTopologyStructure

Return
-------
None

Description
-----------
Initialize all fields (own and inherited).
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & theRepresentation_Name, const opencascade::handle<NCollection_HArray1<opencascade::handle<StepRepr_RepresentationItem>> > & theRepresentation_Items, const opencascade::handle<StepRepr_RepresentationContext> & theRepresentation_ContextOfItems, const opencascade::handle<StepKinematics_KinematicTopologyStructure> & theParent);

		/****** StepKinematics_KinematicTopologyDirectedStructure::Parent ******/
		/****** md5 signature: 7e9d5155e4e641596ce641fe8a5914e1 ******/
		%feature("compactdefaultargs") Parent;
		%feature("autodoc", "Return
-------
opencascade::handle<StepKinematics_KinematicTopologyStructure>

Description
-----------
Returns field Parent.
") Parent;
		opencascade::handle<StepKinematics_KinematicTopologyStructure> Parent();

		/****** StepKinematics_KinematicTopologyDirectedStructure::SetParent ******/
		/****** md5 signature: da015f5ff8af460f0b7d1b10fdad4e8f ******/
		%feature("compactdefaultargs") SetParent;
		%feature("autodoc", "
Parameters
----------
theParent: StepKinematics_KinematicTopologyStructure

Return
-------
None

Description
-----------
Sets field Parent.
") SetParent;
		void SetParent(const opencascade::handle<StepKinematics_KinematicTopologyStructure> & theParent);

};


%make_alias(StepKinematics_KinematicTopologyDirectedStructure)

%extend StepKinematics_KinematicTopologyDirectedStructure {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************************************
* class StepKinematics_KinematicTopologyNetworkStructure *
*********************************************************/
class StepKinematics_KinematicTopologyNetworkStructure : public StepRepr_Representation {
	public:
		/****** StepKinematics_KinematicTopologyNetworkStructure::StepKinematics_KinematicTopologyNetworkStructure ******/
		/****** md5 signature: e454e3edf4fd3182990aab7658846662 ******/
		%feature("compactdefaultargs") StepKinematics_KinematicTopologyNetworkStructure;
		%feature("autodoc", "Return
-------
None

Description
-----------
default constructor.
") StepKinematics_KinematicTopologyNetworkStructure;
		 StepKinematics_KinematicTopologyNetworkStructure();

		/****** StepKinematics_KinematicTopologyNetworkStructure::Init ******/
		/****** md5 signature: 8bd9ea0e8c764f3ef7127877cfe49785 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
theRepresentation_Name: TCollection_HAsciiString
theRepresentation_Items: NCollection_HArray1<
theRepresentation_ContextOfItems: StepRepr_RepresentationContext
theParent: StepKinematics_KinematicTopologyStructure

Return
-------
None

Description
-----------
Initialize all fields (own and inherited).
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & theRepresentation_Name, const opencascade::handle<NCollection_HArray1<opencascade::handle<StepRepr_RepresentationItem>> > & theRepresentation_Items, const opencascade::handle<StepRepr_RepresentationContext> & theRepresentation_ContextOfItems, const opencascade::handle<StepKinematics_KinematicTopologyStructure> & theParent);

		/****** StepKinematics_KinematicTopologyNetworkStructure::Parent ******/
		/****** md5 signature: 7e9d5155e4e641596ce641fe8a5914e1 ******/
		%feature("compactdefaultargs") Parent;
		%feature("autodoc", "Return
-------
opencascade::handle<StepKinematics_KinematicTopologyStructure>

Description
-----------
Returns field Parent.
") Parent;
		opencascade::handle<StepKinematics_KinematicTopologyStructure> Parent();

		/****** StepKinematics_KinematicTopologyNetworkStructure::SetParent ******/
		/****** md5 signature: da015f5ff8af460f0b7d1b10fdad4e8f ******/
		%feature("compactdefaultargs") SetParent;
		%feature("autodoc", "
Parameters
----------
theParent: StepKinematics_KinematicTopologyStructure

Return
-------
None

Description
-----------
Sets field Parent.
") SetParent;
		void SetParent(const opencascade::handle<StepKinematics_KinematicTopologyStructure> & theParent);

};


%make_alias(StepKinematics_KinematicTopologyNetworkStructure)

%extend StepKinematics_KinematicTopologyNetworkStructure {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************************************************
* class StepKinematics_KinematicTopologyRepresentationSelect *
*************************************************************/
class StepKinematics_KinematicTopologyRepresentationSelect : public StepData_SelectType {
	public:
		/****** StepKinematics_KinematicTopologyRepresentationSelect::StepKinematics_KinematicTopologyRepresentationSelect ******/
		/****** md5 signature: 653595080e7ee77739798fa9ee9e1c75 ******/
		%feature("compactdefaultargs") StepKinematics_KinematicTopologyRepresentationSelect;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") StepKinematics_KinematicTopologyRepresentationSelect;
		 StepKinematics_KinematicTopologyRepresentationSelect();

		/****** StepKinematics_KinematicTopologyRepresentationSelect::CaseNum ******/
		/****** md5 signature: ef153e98615228b7740a3c1765b8d82b ******/
		%feature("compactdefaultargs") CaseNum;
		%feature("autodoc", "
Parameters
----------
ent: Standard_Transient

Return
-------
int

Description
-----------
Recognizes a kind of KinematicTopologyRepresentationSelect select type -- 1 -> KinematicTopologyDirectedStructure -- 2 -> KinematicTopologyNetworkStructure -- 3 -> KinematicTopologyStructure.
") CaseNum;
		int CaseNum(const opencascade::handle<Standard_Transient> & ent);

		/****** StepKinematics_KinematicTopologyRepresentationSelect::KinematicTopologyDirectedStructure ******/
		/****** md5 signature: f059e783c310dfcd8744f89b9c69c043 ******/
		%feature("compactdefaultargs") KinematicTopologyDirectedStructure;
		%feature("autodoc", "Return
-------
opencascade::handle<StepKinematics_KinematicTopologyDirectedStructure>

Description
-----------
Returns Value as KinematicTopologyDirectedStructure (or Null if another type).
") KinematicTopologyDirectedStructure;
		opencascade::handle<StepKinematics_KinematicTopologyDirectedStructure> KinematicTopologyDirectedStructure();

		/****** StepKinematics_KinematicTopologyRepresentationSelect::KinematicTopologyNetworkStructure ******/
		/****** md5 signature: 255849e166768c473dd1574d756dda0a ******/
		%feature("compactdefaultargs") KinematicTopologyNetworkStructure;
		%feature("autodoc", "Return
-------
opencascade::handle<StepKinematics_KinematicTopologyNetworkStructure>

Description
-----------
Returns Value as KinematicTopologyNetworkStructure (or Null if another type).
") KinematicTopologyNetworkStructure;
		opencascade::handle<StepKinematics_KinematicTopologyNetworkStructure> KinematicTopologyNetworkStructure();

		/****** StepKinematics_KinematicTopologyRepresentationSelect::KinematicTopologyStructure ******/
		/****** md5 signature: 5b7acea2edd5fe944ba9d02a0f8d9e7b ******/
		%feature("compactdefaultargs") KinematicTopologyStructure;
		%feature("autodoc", "Return
-------
opencascade::handle<StepKinematics_KinematicTopologyStructure>

Description
-----------
Returns Value as KinematicTopologyStructure (or Null if another type).
") KinematicTopologyStructure;
		opencascade::handle<StepKinematics_KinematicTopologyStructure> KinematicTopologyStructure();

};


%extend StepKinematics_KinematicTopologyRepresentationSelect {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************************************
* class StepKinematics_KinematicTopologyStructure *
**************************************************/
class StepKinematics_KinematicTopologyStructure : public StepRepr_Representation {
	public:
		/****** StepKinematics_KinematicTopologyStructure::StepKinematics_KinematicTopologyStructure ******/
		/****** md5 signature: 413cf69f4c44535d86507320cf08d013 ******/
		%feature("compactdefaultargs") StepKinematics_KinematicTopologyStructure;
		%feature("autodoc", "Return
-------
None

Description
-----------
default constructor.
") StepKinematics_KinematicTopologyStructure;
		 StepKinematics_KinematicTopologyStructure();

};


%make_alias(StepKinematics_KinematicTopologyStructure)

%extend StepKinematics_KinematicTopologyStructure {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************************************
* class StepKinematics_MechanismRepresentation *
***********************************************/
class StepKinematics_MechanismRepresentation : public StepRepr_Representation {
	public:
		/****** StepKinematics_MechanismRepresentation::StepKinematics_MechanismRepresentation ******/
		/****** md5 signature: 99eeecffa393901a39b11105e16f5e25 ******/
		%feature("compactdefaultargs") StepKinematics_MechanismRepresentation;
		%feature("autodoc", "Return
-------
None

Description
-----------
default constructor.
") StepKinematics_MechanismRepresentation;
		 StepKinematics_MechanismRepresentation();

		/****** StepKinematics_MechanismRepresentation::Init ******/
		/****** md5 signature: 1d122354753496ade34cfd3d9dd82382 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
theRepresentation_Name: TCollection_HAsciiString
theRepresentation_Items: NCollection_HArray1<
theRepresentation_ContextOfItems: StepRepr_RepresentationContext
theRepresentedTopology: StepKinematics_KinematicTopologyRepresentationSelect

Return
-------
None

Description
-----------
Initialize all fields (own and inherited).
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & theRepresentation_Name, const opencascade::handle<NCollection_HArray1<opencascade::handle<StepRepr_RepresentationItem>> > & theRepresentation_Items, const opencascade::handle<StepRepr_RepresentationContext> & theRepresentation_ContextOfItems, const StepKinematics_KinematicTopologyRepresentationSelect & theRepresentedTopology);

		/****** StepKinematics_MechanismRepresentation::RepresentedTopology ******/
		/****** md5 signature: d7649991f36b2e011cd22c8a30ed3fea ******/
		%feature("compactdefaultargs") RepresentedTopology;
		%feature("autodoc", "Return
-------
StepKinematics_KinematicTopologyRepresentationSelect

Description
-----------
Returns field RepresentedTopology.
") RepresentedTopology;
		StepKinematics_KinematicTopologyRepresentationSelect RepresentedTopology();

		/****** StepKinematics_MechanismRepresentation::SetRepresentedTopology ******/
		/****** md5 signature: a9404fefc732a5249ee00bc77e49b952 ******/
		%feature("compactdefaultargs") SetRepresentedTopology;
		%feature("autodoc", "
Parameters
----------
theRepresentedTopology: StepKinematics_KinematicTopologyRepresentationSelect

Return
-------
None

Description
-----------
Sets field RepresentedTopology.
") SetRepresentedTopology;
		void SetRepresentedTopology(const StepKinematics_KinematicTopologyRepresentationSelect & theRepresentedTopology);

};


%make_alias(StepKinematics_MechanismRepresentation)

%extend StepKinematics_MechanismRepresentation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************************************
* class StepKinematics_MechanismStateRepresentation *
****************************************************/
class StepKinematics_MechanismStateRepresentation : public StepRepr_Representation {
	public:
		/****** StepKinematics_MechanismStateRepresentation::StepKinematics_MechanismStateRepresentation ******/
		/****** md5 signature: 3c85998159e10e47c40c6502ef414bc7 ******/
		%feature("compactdefaultargs") StepKinematics_MechanismStateRepresentation;
		%feature("autodoc", "Return
-------
None

Description
-----------
Returns a MechanismStateRepresentation.
") StepKinematics_MechanismStateRepresentation;
		 StepKinematics_MechanismStateRepresentation();

		/****** StepKinematics_MechanismStateRepresentation::Init ******/
		/****** md5 signature: a7bc94f9d7287f7c2c735e5965133548 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
theName: TCollection_HAsciiString
theItems: NCollection_HArray1<
theContextOfItems: StepRepr_RepresentationContext
theMechanism: StepKinematics_MechanismRepresentation

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & theName, const opencascade::handle<NCollection_HArray1<opencascade::handle<StepRepr_RepresentationItem>> > & theItems, const opencascade::handle<StepRepr_RepresentationContext> & theContextOfItems, const opencascade::handle<StepKinematics_MechanismRepresentation> & theMechanism);

		/****** StepKinematics_MechanismStateRepresentation::Mechanism ******/
		/****** md5 signature: 08cdf7021078a7d81a012290f38d9d95 ******/
		%feature("compactdefaultargs") Mechanism;
		%feature("autodoc", "Return
-------
opencascade::handle<StepKinematics_MechanismRepresentation>

Description
-----------
No available documentation.
") Mechanism;
		opencascade::handle<StepKinematics_MechanismRepresentation> Mechanism();

		/****** StepKinematics_MechanismStateRepresentation::SetMechanism ******/
		/****** md5 signature: b744534a154c6936cd7675bc52c850b1 ******/
		%feature("compactdefaultargs") SetMechanism;
		%feature("autodoc", "
Parameters
----------
theMechanism: StepKinematics_MechanismRepresentation

Return
-------
None

Description
-----------
No available documentation.
") SetMechanism;
		void SetMechanism(const opencascade::handle<StepKinematics_MechanismRepresentation> & theMechanism);

};


%make_alias(StepKinematics_MechanismStateRepresentation)

%extend StepKinematics_MechanismStateRepresentation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************************
* class StepKinematics_OrientedJoint *
*************************************/
class StepKinematics_OrientedJoint : public StepShape_OrientedEdge {
	public:
		/****** StepKinematics_OrientedJoint::StepKinematics_OrientedJoint ******/
		/****** md5 signature: dbd54e0d1a64f4d399a75ebdbe7edd11 ******/
		%feature("compactdefaultargs") StepKinematics_OrientedJoint;
		%feature("autodoc", "Return
-------
None

Description
-----------
default constructor.
") StepKinematics_OrientedJoint;
		 StepKinematics_OrientedJoint();

};


%make_alias(StepKinematics_OrientedJoint)

%extend StepKinematics_OrientedJoint {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************************************
* class StepKinematics_PairRepresentationRelationship *
******************************************************/
class StepKinematics_PairRepresentationRelationship : public StepGeom_GeometricRepresentationItem {
	public:
		/****** StepKinematics_PairRepresentationRelationship::StepKinematics_PairRepresentationRelationship ******/
		/****** md5 signature: 8dddd91eb2df2219e5179d7f5aa5c599 ******/
		%feature("compactdefaultargs") StepKinematics_PairRepresentationRelationship;
		%feature("autodoc", "Return
-------
None

Description
-----------
default constructor.
") StepKinematics_PairRepresentationRelationship;
		 StepKinematics_PairRepresentationRelationship();

		/****** StepKinematics_PairRepresentationRelationship::Init ******/
		/****** md5 signature: 2ff56cc54016a353c0753e4fbbed329c ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
theRepresentationItem_Name: TCollection_HAsciiString
theRepresentationRelationship_Name: TCollection_HAsciiString
hasRepresentationRelationship_Description: bool
theRepresentationRelationship_Description: TCollection_HAsciiString
theRepresentationRelationship_Rep1: StepRepr_RepresentationOrRepresentationReference
theRepresentationRelationship_Rep2: StepRepr_RepresentationOrRepresentationReference
theRepresentationRelationshipWithTransformation_TransformationOperator: StepRepr_Transformation

Return
-------
None

Description
-----------
Initialize all fields (own and inherited).
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & theRepresentationItem_Name, const opencascade::handle<TCollection_HAsciiString> & theRepresentationRelationship_Name, const bool hasRepresentationRelationship_Description, const opencascade::handle<TCollection_HAsciiString> & theRepresentationRelationship_Description, const StepRepr_RepresentationOrRepresentationReference & theRepresentationRelationship_Rep1, const StepRepr_RepresentationOrRepresentationReference & theRepresentationRelationship_Rep2, const StepRepr_Transformation & theRepresentationRelationshipWithTransformation_TransformationOperator);

		/****** StepKinematics_PairRepresentationRelationship::RepresentationRelationshipWithTransformation ******/
		/****** md5 signature: 1dd95ee62d38b1f54c88a5987d608621 ******/
		%feature("compactdefaultargs") RepresentationRelationshipWithTransformation;
		%feature("autodoc", "Return
-------
opencascade::handle<StepRepr_RepresentationRelationshipWithTransformation>

Description
-----------
Returns data for supertype RepresentationRelationshipWithTransformation.
") RepresentationRelationshipWithTransformation;
		opencascade::handle<StepRepr_RepresentationRelationshipWithTransformation> RepresentationRelationshipWithTransformation();

		/****** StepKinematics_PairRepresentationRelationship::SetRepresentationRelationshipWithTransformation ******/
		/****** md5 signature: 6e403389fd1e11df4117ef69b3aeb548 ******/
		%feature("compactdefaultargs") SetRepresentationRelationshipWithTransformation;
		%feature("autodoc", "
Parameters
----------
theRepresentationRelationshipWithTransformation: StepRepr_RepresentationRelationshipWithTransformation

Return
-------
None

Description
-----------
Sets data for supertype RepresentationRelationshipWithTransformation.
") SetRepresentationRelationshipWithTransformation;
		void SetRepresentationRelationshipWithTransformation(const opencascade::handle<StepRepr_RepresentationRelationshipWithTransformation> & theRepresentationRelationshipWithTransformation);

};


%make_alias(StepKinematics_PairRepresentationRelationship)

%extend StepKinematics_PairRepresentationRelationship {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************
* class StepKinematics_PairValue *
*********************************/
class StepKinematics_PairValue : public StepGeom_GeometricRepresentationItem {
	public:
		/****** StepKinematics_PairValue::StepKinematics_PairValue ******/
		/****** md5 signature: 3f6aededbed1d15db27959ee3e6bd0f2 ******/
		%feature("compactdefaultargs") StepKinematics_PairValue;
		%feature("autodoc", "Return
-------
None

Description
-----------
default constructor.
") StepKinematics_PairValue;
		 StepKinematics_PairValue();

		/****** StepKinematics_PairValue::AppliesToPair ******/
		/****** md5 signature: 9b37dec41d548cc22b0d30df0a280568 ******/
		%feature("compactdefaultargs") AppliesToPair;
		%feature("autodoc", "Return
-------
opencascade::handle<StepKinematics_KinematicPair>

Description
-----------
Returns field AppliesToPair.
") AppliesToPair;
		opencascade::handle<StepKinematics_KinematicPair> AppliesToPair();

		/****** StepKinematics_PairValue::Init ******/
		/****** md5 signature: bf4f047709cf9164e02406b50d4a3f02 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
theRepresentationItem_Name: TCollection_HAsciiString
theAppliesToPair: StepKinematics_KinematicPair

Return
-------
None

Description
-----------
Initialize all fields (own and inherited).
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & theRepresentationItem_Name, const opencascade::handle<StepKinematics_KinematicPair> & theAppliesToPair);

		/****** StepKinematics_PairValue::SetAppliesToPair ******/
		/****** md5 signature: f153a486ba6e521c43f9fdacda905263 ******/
		%feature("compactdefaultargs") SetAppliesToPair;
		%feature("autodoc", "
Parameters
----------
theAppliesToPair: StepKinematics_KinematicPair

Return
-------
None

Description
-----------
Sets field AppliesToPair.
") SetAppliesToPair;
		void SetAppliesToPair(const opencascade::handle<StepKinematics_KinematicPair> & theAppliesToPair);

};


%make_alias(StepKinematics_PairValue)

%extend StepKinematics_PairValue {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************************************
* class StepKinematics_ProductDefinitionKinematics *
***************************************************/
class StepKinematics_ProductDefinitionKinematics : public StepRepr_PropertyDefinition {
	public:
		/****** StepKinematics_ProductDefinitionKinematics::StepKinematics_ProductDefinitionKinematics ******/
		/****** md5 signature: 01ee779fcbcb53dd77d075d2e58b8731 ******/
		%feature("compactdefaultargs") StepKinematics_ProductDefinitionKinematics;
		%feature("autodoc", "Return
-------
None

Description
-----------
default constructor.
") StepKinematics_ProductDefinitionKinematics;
		 StepKinematics_ProductDefinitionKinematics();

};


%make_alias(StepKinematics_ProductDefinitionKinematics)

%extend StepKinematics_ProductDefinitionKinematics {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************************************************
* class StepKinematics_ProductDefinitionRelationshipKinematics *
***************************************************************/
class StepKinematics_ProductDefinitionRelationshipKinematics : public StepRepr_PropertyDefinition {
	public:
		/****** StepKinematics_ProductDefinitionRelationshipKinematics::StepKinematics_ProductDefinitionRelationshipKinematics ******/
		/****** md5 signature: dfd87b63a52589340e3d28532238f0bc ******/
		%feature("compactdefaultargs") StepKinematics_ProductDefinitionRelationshipKinematics;
		%feature("autodoc", "Return
-------
None

Description
-----------
default constructor.
") StepKinematics_ProductDefinitionRelationshipKinematics;
		 StepKinematics_ProductDefinitionRelationshipKinematics();

};


%make_alias(StepKinematics_ProductDefinitionRelationshipKinematics)

%extend StepKinematics_ProductDefinitionRelationshipKinematics {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************************
* class StepKinematics_RigidPlacement *
**************************************/
class StepKinematics_RigidPlacement : public StepData_SelectType {
	public:
		/****** StepKinematics_RigidPlacement::StepKinematics_RigidPlacement ******/
		/****** md5 signature: 2e22fab37510f7e536239f31187393e4 ******/
		%feature("compactdefaultargs") StepKinematics_RigidPlacement;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") StepKinematics_RigidPlacement;
		 StepKinematics_RigidPlacement();

		/****** StepKinematics_RigidPlacement::Axis2Placement3d ******/
		/****** md5 signature: c9e96f5e4c0b7eb079fbe3bc135a46fe ******/
		%feature("compactdefaultargs") Axis2Placement3d;
		%feature("autodoc", "Return
-------
opencascade::handle<StepGeom_Axis2Placement3d>

Description
-----------
Returns Value as Axis2Placement3d (or Null if another type).
") Axis2Placement3d;
		opencascade::handle<StepGeom_Axis2Placement3d> Axis2Placement3d();

		/****** StepKinematics_RigidPlacement::CaseNum ******/
		/****** md5 signature: ef153e98615228b7740a3c1765b8d82b ******/
		%feature("compactdefaultargs") CaseNum;
		%feature("autodoc", "
Parameters
----------
ent: Standard_Transient

Return
-------
int

Description
-----------
Recognizes a kind of RigidPlacement select type -- 1 -> Axis2Placement3d -- 2 -> SuParameters.
") CaseNum;
		int CaseNum(const opencascade::handle<Standard_Transient> & ent);

		/****** StepKinematics_RigidPlacement::SuParameters ******/
		/****** md5 signature: 16eca4dd904e95921e4ff048caeea8e3 ******/
		%feature("compactdefaultargs") SuParameters;
		%feature("autodoc", "Return
-------
opencascade::handle<StepGeom_SuParameters>

Description
-----------
Returns Value as SuParameters (or Null if another type).
") SuParameters;
		opencascade::handle<StepGeom_SuParameters> SuParameters();

};


%extend StepKinematics_RigidPlacement {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************************************
* class StepKinematics_RotationAboutDirection *
**********************************************/
class StepKinematics_RotationAboutDirection : public StepGeom_GeometricRepresentationItem {
	public:
		/****** StepKinematics_RotationAboutDirection::StepKinematics_RotationAboutDirection ******/
		/****** md5 signature: 5fc6b3f3e4293e597e001269f5275935 ******/
		%feature("compactdefaultargs") StepKinematics_RotationAboutDirection;
		%feature("autodoc", "Return
-------
None

Description
-----------
default constructor.
") StepKinematics_RotationAboutDirection;
		 StepKinematics_RotationAboutDirection();

		/****** StepKinematics_RotationAboutDirection::DirectionOfAxis ******/
		/****** md5 signature: 1fcefffa7ed96437c8f607f4d7fc7503 ******/
		%feature("compactdefaultargs") DirectionOfAxis;
		%feature("autodoc", "Return
-------
opencascade::handle<StepGeom_Direction>

Description
-----------
Returns field DirectionOfAxis.
") DirectionOfAxis;
		opencascade::handle<StepGeom_Direction> DirectionOfAxis();

		/****** StepKinematics_RotationAboutDirection::Init ******/
		/****** md5 signature: 7ccb8a82e158576480426ae4214302f5 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
theRepresentationItem_Name: TCollection_HAsciiString
theDirectionOfAxis: StepGeom_Direction
theRotationAngle: double

Return
-------
None

Description
-----------
Initialize all fields (own and inherited).
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & theRepresentationItem_Name, const opencascade::handle<StepGeom_Direction> & theDirectionOfAxis, const double theRotationAngle);

		/****** StepKinematics_RotationAboutDirection::RotationAngle ******/
		/****** md5 signature: 57b804377e9262f0b8d6ec720d870acc ******/
		%feature("compactdefaultargs") RotationAngle;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns field RotationAngle.
") RotationAngle;
		double RotationAngle();

		/****** StepKinematics_RotationAboutDirection::SetDirectionOfAxis ******/
		/****** md5 signature: 713071843d6d679a154e255dd944ce85 ******/
		%feature("compactdefaultargs") SetDirectionOfAxis;
		%feature("autodoc", "
Parameters
----------
theDirectionOfAxis: StepGeom_Direction

Return
-------
None

Description
-----------
Sets field DirectionOfAxis.
") SetDirectionOfAxis;
		void SetDirectionOfAxis(const opencascade::handle<StepGeom_Direction> & theDirectionOfAxis);

		/****** StepKinematics_RotationAboutDirection::SetRotationAngle ******/
		/****** md5 signature: 984fa9bc371aed8602522adfe87a00b9 ******/
		%feature("compactdefaultargs") SetRotationAngle;
		%feature("autodoc", "
Parameters
----------
theRotationAngle: double

Return
-------
None

Description
-----------
Sets field RotationAngle.
") SetRotationAngle;
		void SetRotationAngle(const double theRotationAngle);

};


%make_alias(StepKinematics_RotationAboutDirection)

%extend StepKinematics_RotationAboutDirection {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************************
* class StepKinematics_SpatialRotation *
***************************************/
class StepKinematics_SpatialRotation : public StepData_SelectType {
	public:
		/****** StepKinematics_SpatialRotation::StepKinematics_SpatialRotation ******/
		/****** md5 signature: 6c762d4adff8c130587266c20bd576a4 ******/
		%feature("compactdefaultargs") StepKinematics_SpatialRotation;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") StepKinematics_SpatialRotation;
		 StepKinematics_SpatialRotation();

		/****** StepKinematics_SpatialRotation::CaseNum ******/
		/****** md5 signature: ef153e98615228b7740a3c1765b8d82b ******/
		%feature("compactdefaultargs") CaseNum;
		%feature("autodoc", "
Parameters
----------
ent: Standard_Transient

Return
-------
int

Description
-----------
Recognizes a kind of SpatialRotation select type -- 1 -> RotationAboutDirection -- 2 -> YprRotation.
") CaseNum;
		int CaseNum(const opencascade::handle<Standard_Transient> & ent);

		/****** StepKinematics_SpatialRotation::RotationAboutDirection ******/
		/****** md5 signature: f3f49b0f97e36f341e3361f2759d4807 ******/
		%feature("compactdefaultargs") RotationAboutDirection;
		%feature("autodoc", "Return
-------
opencascade::handle<StepKinematics_RotationAboutDirection>

Description
-----------
Returns Value as RotationAboutDirection (or Null if another type).
") RotationAboutDirection;
		opencascade::handle<StepKinematics_RotationAboutDirection> RotationAboutDirection();

		/****** StepKinematics_SpatialRotation::YprRotation ******/
		/****** md5 signature: db68d36dae35ba5e29e95a961942b7fe ******/
		%feature("compactdefaultargs") YprRotation;
		%feature("autodoc", "Return
-------
opencascade::handle<TColStd_HArray1OfReal>

Description
-----------
Returns Value as YprRotation (or Null if another type).
") YprRotation;
		opencascade::handle<TColStd_HArray1OfReal> YprRotation();

};


%extend StepKinematics_SpatialRotation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************************
* class StepKinematics_SphericalPairSelect *
*******************************************/
class StepKinematics_SphericalPairSelect : public StepData_SelectType {
	public:
		/****** StepKinematics_SphericalPairSelect::StepKinematics_SphericalPairSelect ******/
		/****** md5 signature: 7750b12787faadafeb6277f32b54adc3 ******/
		%feature("compactdefaultargs") StepKinematics_SphericalPairSelect;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") StepKinematics_SphericalPairSelect;
		 StepKinematics_SphericalPairSelect();

		/****** StepKinematics_SphericalPairSelect::CaseNum ******/
		/****** md5 signature: ef153e98615228b7740a3c1765b8d82b ******/
		%feature("compactdefaultargs") CaseNum;
		%feature("autodoc", "
Parameters
----------
ent: Standard_Transient

Return
-------
int

Description
-----------
Recognizes a kind of SphericalPairSelect select type -- 1 -> SphericalPair -- 2 -> SphericalPairWithPin.
") CaseNum;
		int CaseNum(const opencascade::handle<Standard_Transient> & ent);

		/****** StepKinematics_SphericalPairSelect::SphericalPair ******/
		/****** md5 signature: 689bab421d51aa31efa7f49d52355ce5 ******/
		%feature("compactdefaultargs") SphericalPair;
		%feature("autodoc", "Return
-------
opencascade::handle<StepKinematics_SphericalPair>

Description
-----------
Returns Value as SphericalPair (or Null if another type).
") SphericalPair;
		opencascade::handle<StepKinematics_SphericalPair> SphericalPair();

		/****** StepKinematics_SphericalPairSelect::SphericalPairWithPin ******/
		/****** md5 signature: 81753de7e878a43270ccec93cca531e9 ******/
		%feature("compactdefaultargs") SphericalPairWithPin;
		%feature("autodoc", "Return
-------
opencascade::handle<StepKinematics_SphericalPairWithPin>

Description
-----------
Returns Value as SphericalPairWithPin (or Null if another type).
") SphericalPairWithPin;
		opencascade::handle<StepKinematics_SphericalPairWithPin> SphericalPairWithPin();

};


%extend StepKinematics_SphericalPairSelect {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************************************
* class StepKinematics_ActuatedKinPairAndOrderKinPair *
******************************************************/
class StepKinematics_ActuatedKinPairAndOrderKinPair : public StepKinematics_KinematicPair {
	public:
		/****** StepKinematics_ActuatedKinPairAndOrderKinPair::StepKinematics_ActuatedKinPairAndOrderKinPair ******/
		/****** md5 signature: 259ca20158a0794c2a7a33435ab81e26 ******/
		%feature("compactdefaultargs") StepKinematics_ActuatedKinPairAndOrderKinPair;
		%feature("autodoc", "Return
-------
None

Description
-----------
default constructor.
") StepKinematics_ActuatedKinPairAndOrderKinPair;
		 StepKinematics_ActuatedKinPairAndOrderKinPair();

		/****** StepKinematics_ActuatedKinPairAndOrderKinPair::GetActuatedKinematicPair ******/
		/****** md5 signature: 58f1ee52a48db61f0c245c9051669076 ******/
		%feature("compactdefaultargs") GetActuatedKinematicPair;
		%feature("autodoc", "Return
-------
opencascade::handle<StepKinematics_ActuatedKinematicPair>

Description
-----------
No available documentation.
") GetActuatedKinematicPair;
		opencascade::handle<StepKinematics_ActuatedKinematicPair> GetActuatedKinematicPair();

		/****** StepKinematics_ActuatedKinPairAndOrderKinPair::GetOrderKinematicPair ******/
		/****** md5 signature: 4d28c52d1a3bf519c398a25eb08bb0a0 ******/
		%feature("compactdefaultargs") GetOrderKinematicPair;
		%feature("autodoc", "Return
-------
opencascade::handle<StepKinematics_KinematicPair>

Description
-----------
No available documentation.
") GetOrderKinematicPair;
		opencascade::handle<StepKinematics_KinematicPair> GetOrderKinematicPair();

		/****** StepKinematics_ActuatedKinPairAndOrderKinPair::Init ******/
		/****** md5 signature: eb23f08988123684f75d5d02373b15f7 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
theRepresentationItem_Name: TCollection_HAsciiString
theItemDefinedTransformation_Name: TCollection_HAsciiString
hasItemDefinedTransformation_Description: bool
theItemDefinedTransformation_Description: TCollection_HAsciiString
theItemDefinedTransformation_TransformItem1: StepRepr_RepresentationItem
theItemDefinedTransformation_TransformItem2: StepRepr_RepresentationItem
theJoint: StepKinematics_KinematicJoint
theActuatedKinematicPair: StepKinematics_ActuatedKinematicPair
theOrderKinematicPair: StepKinematics_KinematicPair

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & theRepresentationItem_Name, const opencascade::handle<TCollection_HAsciiString> & theItemDefinedTransformation_Name, const bool hasItemDefinedTransformation_Description, const opencascade::handle<TCollection_HAsciiString> & theItemDefinedTransformation_Description, const opencascade::handle<StepRepr_RepresentationItem> & theItemDefinedTransformation_TransformItem1, const opencascade::handle<StepRepr_RepresentationItem> & theItemDefinedTransformation_TransformItem2, const opencascade::handle<StepKinematics_KinematicJoint> & theJoint, const opencascade::handle<StepKinematics_ActuatedKinematicPair> & theActuatedKinematicPair, const opencascade::handle<StepKinematics_KinematicPair> & theOrderKinematicPair);

		/****** StepKinematics_ActuatedKinPairAndOrderKinPair::SetActuatedKinematicPair ******/
		/****** md5 signature: 7e1b5f8c414756af159227790993c3f1 ******/
		%feature("compactdefaultargs") SetActuatedKinematicPair;
		%feature("autodoc", "
Parameters
----------
aKP: StepKinematics_ActuatedKinematicPair

Return
-------
None

Description
-----------
No available documentation.
") SetActuatedKinematicPair;
		void SetActuatedKinematicPair(const opencascade::handle<StepKinematics_ActuatedKinematicPair> & aKP);

		/****** StepKinematics_ActuatedKinPairAndOrderKinPair::SetOrderKinematicPair ******/
		/****** md5 signature: 973f44f9d4167dd730d69b775d6e54f2 ******/
		%feature("compactdefaultargs") SetOrderKinematicPair;
		%feature("autodoc", "
Parameters
----------
aKP: StepKinematics_KinematicPair

Return
-------
None

Description
-----------
No available documentation.
") SetOrderKinematicPair;
		void SetOrderKinematicPair(const opencascade::handle<StepKinematics_KinematicPair> & aKP);

};


%make_alias(StepKinematics_ActuatedKinPairAndOrderKinPair)

%extend StepKinematics_ActuatedKinPairAndOrderKinPair {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************************
* class StepKinematics_ActuatedKinematicPair *
*********************************************/
class StepKinematics_ActuatedKinematicPair : public StepKinematics_KinematicPair {
	public:
		/****** StepKinematics_ActuatedKinematicPair::StepKinematics_ActuatedKinematicPair ******/
		/****** md5 signature: df8c9300e14098a4bd0830d70270036d ******/
		%feature("compactdefaultargs") StepKinematics_ActuatedKinematicPair;
		%feature("autodoc", "Return
-------
None

Description
-----------
default constructor.
") StepKinematics_ActuatedKinematicPair;
		 StepKinematics_ActuatedKinematicPair();

		/****** StepKinematics_ActuatedKinematicPair::HasRX ******/
		/****** md5 signature: 8da31ce8b7e857a9fa2f5986031eb5ea ******/
		%feature("compactdefaultargs") HasRX;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if optional field RX is defined.
") HasRX;
		bool HasRX();

		/****** StepKinematics_ActuatedKinematicPair::HasRY ******/
		/****** md5 signature: 585ed0a25d300a2eee5bd26b461d0b46 ******/
		%feature("compactdefaultargs") HasRY;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if optional field RY is defined.
") HasRY;
		bool HasRY();

		/****** StepKinematics_ActuatedKinematicPair::HasRZ ******/
		/****** md5 signature: 27bb43ebb06254c61c63998f0b8c7b18 ******/
		%feature("compactdefaultargs") HasRZ;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if optional field RZ is defined.
") HasRZ;
		bool HasRZ();

		/****** StepKinematics_ActuatedKinematicPair::HasTX ******/
		/****** md5 signature: 0ca1b6537e6f9039133e0b4f11b61c1e ******/
		%feature("compactdefaultargs") HasTX;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if optional field TX is defined.
") HasTX;
		bool HasTX();

		/****** StepKinematics_ActuatedKinematicPair::HasTY ******/
		/****** md5 signature: dd37f30fa17787a7de2b078153706d2b ******/
		%feature("compactdefaultargs") HasTY;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if optional field TY is defined.
") HasTY;
		bool HasTY();

		/****** StepKinematics_ActuatedKinematicPair::HasTZ ******/
		/****** md5 signature: 74767d266c5f08e42c764582b5ebadc0 ******/
		%feature("compactdefaultargs") HasTZ;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if optional field TZ is defined.
") HasTZ;
		bool HasTZ();

		/****** StepKinematics_ActuatedKinematicPair::Init ******/
		/****** md5 signature: 3d168b1de2551142cb7b9b4dd84a365f ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
theRepresentationItem_Name: TCollection_HAsciiString
theItemDefinedTransformation_Name: TCollection_HAsciiString
hasItemDefinedTransformation_Description: bool
theItemDefinedTransformation_Description: TCollection_HAsciiString
theItemDefinedTransformation_TransformItem1: StepRepr_RepresentationItem
theItemDefinedTransformation_TransformItem2: StepRepr_RepresentationItem
theKinematicPair_Joint: StepKinematics_KinematicJoint
hasTX: bool
theTX: StepKinematics_ActuatedDirection
hasTY: bool
theTY: StepKinematics_ActuatedDirection
hasTZ: bool
theTZ: StepKinematics_ActuatedDirection
hasRX: bool
theRX: StepKinematics_ActuatedDirection
hasRY: bool
theRY: StepKinematics_ActuatedDirection
hasRZ: bool
theRZ: StepKinematics_ActuatedDirection

Return
-------
None

Description
-----------
Initialize all fields (own and inherited).
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & theRepresentationItem_Name, const opencascade::handle<TCollection_HAsciiString> & theItemDefinedTransformation_Name, const bool hasItemDefinedTransformation_Description, const opencascade::handle<TCollection_HAsciiString> & theItemDefinedTransformation_Description, const opencascade::handle<StepRepr_RepresentationItem> & theItemDefinedTransformation_TransformItem1, const opencascade::handle<StepRepr_RepresentationItem> & theItemDefinedTransformation_TransformItem2, const opencascade::handle<StepKinematics_KinematicJoint> & theKinematicPair_Joint, const bool hasTX, const StepKinematics_ActuatedDirection theTX, const bool hasTY, const StepKinematics_ActuatedDirection theTY, const bool hasTZ, const StepKinematics_ActuatedDirection theTZ, const bool hasRX, const StepKinematics_ActuatedDirection theRX, const bool hasRY, const StepKinematics_ActuatedDirection theRY, const bool hasRZ, const StepKinematics_ActuatedDirection theRZ);

		/****** StepKinematics_ActuatedKinematicPair::RX ******/
		/****** md5 signature: d5c65d32604d8aee61311cd5f83ae0d6 ******/
		%feature("compactdefaultargs") RX;
		%feature("autodoc", "Return
-------
StepKinematics_ActuatedDirection

Description
-----------
Returns field RX.
") RX;
		StepKinematics_ActuatedDirection RX();

		/****** StepKinematics_ActuatedKinematicPair::RY ******/
		/****** md5 signature: 95c2155915ca8b3c459248cc23c8d46a ******/
		%feature("compactdefaultargs") RY;
		%feature("autodoc", "Return
-------
StepKinematics_ActuatedDirection

Description
-----------
Returns field RY.
") RY;
		StepKinematics_ActuatedDirection RY();

		/****** StepKinematics_ActuatedKinematicPair::RZ ******/
		/****** md5 signature: 291684bf4db882e12767f75178054665 ******/
		%feature("compactdefaultargs") RZ;
		%feature("autodoc", "Return
-------
StepKinematics_ActuatedDirection

Description
-----------
Returns field RZ.
") RZ;
		StepKinematics_ActuatedDirection RZ();

		/****** StepKinematics_ActuatedKinematicPair::SetRX ******/
		/****** md5 signature: 23735aafc76216dcfa96b0865c08b10c ******/
		%feature("compactdefaultargs") SetRX;
		%feature("autodoc", "
Parameters
----------
theRX: StepKinematics_ActuatedDirection

Return
-------
None

Description
-----------
Sets field RX.
") SetRX;
		void SetRX(const StepKinematics_ActuatedDirection theRX);

		/****** StepKinematics_ActuatedKinematicPair::SetRY ******/
		/****** md5 signature: f14e7443f3f9b08effe1ecea4ce01099 ******/
		%feature("compactdefaultargs") SetRY;
		%feature("autodoc", "
Parameters
----------
theRY: StepKinematics_ActuatedDirection

Return
-------
None

Description
-----------
Sets field RY.
") SetRY;
		void SetRY(const StepKinematics_ActuatedDirection theRY);

		/****** StepKinematics_ActuatedKinematicPair::SetRZ ******/
		/****** md5 signature: f494930f8391a3e129a791deb387ba66 ******/
		%feature("compactdefaultargs") SetRZ;
		%feature("autodoc", "
Parameters
----------
theRZ: StepKinematics_ActuatedDirection

Return
-------
None

Description
-----------
Sets field RZ.
") SetRZ;
		void SetRZ(const StepKinematics_ActuatedDirection theRZ);

		/****** StepKinematics_ActuatedKinematicPair::SetTX ******/
		/****** md5 signature: b186e64c36cae548e9e7b096c8cb263d ******/
		%feature("compactdefaultargs") SetTX;
		%feature("autodoc", "
Parameters
----------
theTX: StepKinematics_ActuatedDirection

Return
-------
None

Description
-----------
Sets field TX.
") SetTX;
		void SetTX(const StepKinematics_ActuatedDirection theTX);

		/****** StepKinematics_ActuatedKinematicPair::SetTY ******/
		/****** md5 signature: 6c809809e2e841f3ace10f4330200217 ******/
		%feature("compactdefaultargs") SetTY;
		%feature("autodoc", "
Parameters
----------
theTY: StepKinematics_ActuatedDirection

Return
-------
None

Description
-----------
Sets field TY.
") SetTY;
		void SetTY(const StepKinematics_ActuatedDirection theTY);

		/****** StepKinematics_ActuatedKinematicPair::SetTZ ******/
		/****** md5 signature: 84e2c466269970e085d114ccf7d3a2ca ******/
		%feature("compactdefaultargs") SetTZ;
		%feature("autodoc", "
Parameters
----------
theTZ: StepKinematics_ActuatedDirection

Return
-------
None

Description
-----------
Sets field TZ.
") SetTZ;
		void SetTZ(const StepKinematics_ActuatedDirection theTZ);

		/****** StepKinematics_ActuatedKinematicPair::TX ******/
		/****** md5 signature: 2b12477f457438dc50c8be0cc8e3e710 ******/
		%feature("compactdefaultargs") TX;
		%feature("autodoc", "Return
-------
StepKinematics_ActuatedDirection

Description
-----------
Returns field TX.
") TX;
		StepKinematics_ActuatedDirection TX();

		/****** StepKinematics_ActuatedKinematicPair::TY ******/
		/****** md5 signature: 0d1593a64cbc6ad87813f50fcce5bd99 ******/
		%feature("compactdefaultargs") TY;
		%feature("autodoc", "Return
-------
StepKinematics_ActuatedDirection

Description
-----------
Returns field TY.
") TY;
		StepKinematics_ActuatedDirection TY();

		/****** StepKinematics_ActuatedKinematicPair::TZ ******/
		/****** md5 signature: 9611986abcb127dc7fbbf0d266522914 ******/
		%feature("compactdefaultargs") TZ;
		%feature("autodoc", "Return
-------
StepKinematics_ActuatedDirection

Description
-----------
Returns field TZ.
") TZ;
		StepKinematics_ActuatedDirection TZ();

};


%make_alias(StepKinematics_ActuatedKinematicPair)

%extend StepKinematics_ActuatedKinematicPair {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************************
* class StepKinematics_CylindricalPairValue *
********************************************/
class StepKinematics_CylindricalPairValue : public StepKinematics_PairValue {
	public:
		/****** StepKinematics_CylindricalPairValue::StepKinematics_CylindricalPairValue ******/
		/****** md5 signature: 616cf41577612d3d0b65db3a9d5d3674 ******/
		%feature("compactdefaultargs") StepKinematics_CylindricalPairValue;
		%feature("autodoc", "Return
-------
None

Description
-----------
default constructor.
") StepKinematics_CylindricalPairValue;
		 StepKinematics_CylindricalPairValue();

		/****** StepKinematics_CylindricalPairValue::ActualRotation ******/
		/****** md5 signature: f25f5770219b708a8eeac3d18093537f ******/
		%feature("compactdefaultargs") ActualRotation;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns field ActualRotation.
") ActualRotation;
		double ActualRotation();

		/****** StepKinematics_CylindricalPairValue::ActualTranslation ******/
		/****** md5 signature: baea39c02c08d532acc85ec0457d567c ******/
		%feature("compactdefaultargs") ActualTranslation;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns field ActualTranslation.
") ActualTranslation;
		double ActualTranslation();

		/****** StepKinematics_CylindricalPairValue::Init ******/
		/****** md5 signature: f98def3f97f04363d43b386ad3c4090d ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
theRepresentationItem_Name: TCollection_HAsciiString
thePairValue_AppliesToPair: StepKinematics_KinematicPair
theActualTranslation: double
theActualRotation: double

Return
-------
None

Description
-----------
Initialize all fields (own and inherited).
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & theRepresentationItem_Name, const opencascade::handle<StepKinematics_KinematicPair> & thePairValue_AppliesToPair, const double theActualTranslation, const double theActualRotation);

		/****** StepKinematics_CylindricalPairValue::SetActualRotation ******/
		/****** md5 signature: 88469d64f7595872fdaf5549069d8641 ******/
		%feature("compactdefaultargs") SetActualRotation;
		%feature("autodoc", "
Parameters
----------
theActualRotation: double

Return
-------
None

Description
-----------
Sets field ActualRotation.
") SetActualRotation;
		void SetActualRotation(const double theActualRotation);

		/****** StepKinematics_CylindricalPairValue::SetActualTranslation ******/
		/****** md5 signature: 61a492eaa835762cc1601d7b472171a0 ******/
		%feature("compactdefaultargs") SetActualTranslation;
		%feature("autodoc", "
Parameters
----------
theActualTranslation: double

Return
-------
None

Description
-----------
Sets field ActualTranslation.
") SetActualTranslation;
		void SetActualTranslation(const double theActualTranslation);

};


%make_alias(StepKinematics_CylindricalPairValue)

%extend StepKinematics_CylindricalPairValue {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************************
* class StepKinematics_GearPairValue *
*************************************/
class StepKinematics_GearPairValue : public StepKinematics_PairValue {
	public:
		/****** StepKinematics_GearPairValue::StepKinematics_GearPairValue ******/
		/****** md5 signature: 3332e1815a69ad183ba2775b37e05ff4 ******/
		%feature("compactdefaultargs") StepKinematics_GearPairValue;
		%feature("autodoc", "Return
-------
None

Description
-----------
default constructor.
") StepKinematics_GearPairValue;
		 StepKinematics_GearPairValue();

		/****** StepKinematics_GearPairValue::ActualRotation1 ******/
		/****** md5 signature: 6ad3cb1cc1ed30fc2fee4ff338a0ea47 ******/
		%feature("compactdefaultargs") ActualRotation1;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns field ActualRotation1.
") ActualRotation1;
		double ActualRotation1();

		/****** StepKinematics_GearPairValue::Init ******/
		/****** md5 signature: 260c90bdfd93fafe9a64f2ab2dcc7b36 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
theRepresentationItem_Name: TCollection_HAsciiString
thePairValue_AppliesToPair: StepKinematics_KinematicPair
theActualRotation1: double

Return
-------
None

Description
-----------
Initialize all fields (own and inherited).
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & theRepresentationItem_Name, const opencascade::handle<StepKinematics_KinematicPair> & thePairValue_AppliesToPair, const double theActualRotation1);

		/****** StepKinematics_GearPairValue::SetActualRotation1 ******/
		/****** md5 signature: b727e04ddbca9f4ac18a211e972b0208 ******/
		%feature("compactdefaultargs") SetActualRotation1;
		%feature("autodoc", "
Parameters
----------
theActualRotation1: double

Return
-------
None

Description
-----------
Sets field ActualRotation1.
") SetActualRotation1;
		void SetActualRotation1(const double theActualRotation1);

};


%make_alias(StepKinematics_GearPairValue)

%extend StepKinematics_GearPairValue {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************************************
* class StepKinematics_HighOrderKinematicPair *
**********************************************/
class StepKinematics_HighOrderKinematicPair : public StepKinematics_KinematicPair {
	public:
		/****** StepKinematics_HighOrderKinematicPair::StepKinematics_HighOrderKinematicPair ******/
		/****** md5 signature: 3f86ba2564ade23271e520a9502670dd ******/
		%feature("compactdefaultargs") StepKinematics_HighOrderKinematicPair;
		%feature("autodoc", "Return
-------
None

Description
-----------
default constructor.
") StepKinematics_HighOrderKinematicPair;
		 StepKinematics_HighOrderKinematicPair();

};


%make_alias(StepKinematics_HighOrderKinematicPair)

%extend StepKinematics_HighOrderKinematicPair {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************************************************
* class StepKinematics_KinematicPropertyMechanismRepresentation *
****************************************************************/
class StepKinematics_KinematicPropertyMechanismRepresentation : public StepKinematics_KinematicPropertyDefinitionRepresentation {
	public:
		/****** StepKinematics_KinematicPropertyMechanismRepresentation::StepKinematics_KinematicPropertyMechanismRepresentation ******/
		/****** md5 signature: 7ed81e7f0c490d21b1872e32449aa598 ******/
		%feature("compactdefaultargs") StepKinematics_KinematicPropertyMechanismRepresentation;
		%feature("autodoc", "Return
-------
None

Description
-----------
default constructor.
") StepKinematics_KinematicPropertyMechanismRepresentation;
		 StepKinematics_KinematicPropertyMechanismRepresentation();

		/****** StepKinematics_KinematicPropertyMechanismRepresentation::Base ******/
		/****** md5 signature: 4434703b79f70aa6afb619fe613b31ab ******/
		%feature("compactdefaultargs") Base;
		%feature("autodoc", "Return
-------
opencascade::handle<StepKinematics_KinematicLinkRepresentation>

Description
-----------
Returns field Base.
") Base;
		opencascade::handle<StepKinematics_KinematicLinkRepresentation> Base();

		/****** StepKinematics_KinematicPropertyMechanismRepresentation::Init ******/
		/****** md5 signature: f19ec84935d9fd089e461a5304711514 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
thePropertyDefinitionRepresentation_Definition: StepRepr_RepresentedDefinition
thePropertyDefinitionRepresentation_UsedRepresentation: StepRepr_Representation
theBase: StepKinematics_KinematicLinkRepresentation

Return
-------
None

Description
-----------
Initialize all fields (own and inherited).
") Init;
		void Init(const StepRepr_RepresentedDefinition & thePropertyDefinitionRepresentation_Definition, const opencascade::handle<StepRepr_Representation> & thePropertyDefinitionRepresentation_UsedRepresentation, const opencascade::handle<StepKinematics_KinematicLinkRepresentation> & theBase);

		/****** StepKinematics_KinematicPropertyMechanismRepresentation::SetBase ******/
		/****** md5 signature: 805789d992cf682b28d697afb4a52dc1 ******/
		%feature("compactdefaultargs") SetBase;
		%feature("autodoc", "
Parameters
----------
theBase: StepKinematics_KinematicLinkRepresentation

Return
-------
None

Description
-----------
Sets field Base.
") SetBase;
		void SetBase(const opencascade::handle<StepKinematics_KinematicLinkRepresentation> & theBase);

};


%make_alias(StepKinematics_KinematicPropertyMechanismRepresentation)

%extend StepKinematics_KinematicPropertyMechanismRepresentation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************************************
* class StepKinematics_LinearFlexibleLinkRepresentation *
********************************************************/
class StepKinematics_LinearFlexibleLinkRepresentation : public StepKinematics_KinematicLinkRepresentation {
	public:
		/****** StepKinematics_LinearFlexibleLinkRepresentation::StepKinematics_LinearFlexibleLinkRepresentation ******/
		/****** md5 signature: d7726e0a4cba9eeff450f459cea3825a ******/
		%feature("compactdefaultargs") StepKinematics_LinearFlexibleLinkRepresentation;
		%feature("autodoc", "Return
-------
None

Description
-----------
default constructor.
") StepKinematics_LinearFlexibleLinkRepresentation;
		 StepKinematics_LinearFlexibleLinkRepresentation();

};


%make_alias(StepKinematics_LinearFlexibleLinkRepresentation)

%extend StepKinematics_LinearFlexibleLinkRepresentation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************************
* class StepKinematics_LowOrderKinematicPair *
*********************************************/
class StepKinematics_LowOrderKinematicPair : public StepKinematics_KinematicPair {
	public:
		/****** StepKinematics_LowOrderKinematicPair::StepKinematics_LowOrderKinematicPair ******/
		/****** md5 signature: cc923bd873c2e1c723460afd978df237 ******/
		%feature("compactdefaultargs") StepKinematics_LowOrderKinematicPair;
		%feature("autodoc", "Return
-------
None

Description
-----------
default constructor.
") StepKinematics_LowOrderKinematicPair;
		 StepKinematics_LowOrderKinematicPair();

		/****** StepKinematics_LowOrderKinematicPair::Init ******/
		/****** md5 signature: 574022940b5b5634adc6bcdcf7eeb0e3 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
theRepresentationItem_Name: TCollection_HAsciiString
theItemDefinedTransformation_Name: TCollection_HAsciiString
hasItemDefinedTransformation_Description: bool
theItemDefinedTransformation_Description: TCollection_HAsciiString
theItemDefinedTransformation_TransformItem1: StepRepr_RepresentationItem
theItemDefinedTransformation_TransformItem2: StepRepr_RepresentationItem
theKinematicPair_Joint: StepKinematics_KinematicJoint
theTX: bool
theTY: bool
theTZ: bool
theRX: bool
theRY: bool
theRZ: bool

Return
-------
None

Description
-----------
Initialize all fields (own and inherited).
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & theRepresentationItem_Name, const opencascade::handle<TCollection_HAsciiString> & theItemDefinedTransformation_Name, const bool hasItemDefinedTransformation_Description, const opencascade::handle<TCollection_HAsciiString> & theItemDefinedTransformation_Description, const opencascade::handle<StepRepr_RepresentationItem> & theItemDefinedTransformation_TransformItem1, const opencascade::handle<StepRepr_RepresentationItem> & theItemDefinedTransformation_TransformItem2, const opencascade::handle<StepKinematics_KinematicJoint> & theKinematicPair_Joint, const bool theTX, const bool theTY, const bool theTZ, const bool theRX, const bool theRY, const bool theRZ);

		/****** StepKinematics_LowOrderKinematicPair::RX ******/
		/****** md5 signature: 0f1faeeb909d16219219fda39a1eeb68 ******/
		%feature("compactdefaultargs") RX;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns field RX.
") RX;
		bool RX();

		/****** StepKinematics_LowOrderKinematicPair::RY ******/
		/****** md5 signature: 128eccc06c59044b1c6f9fb162c83f94 ******/
		%feature("compactdefaultargs") RY;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns field RY.
") RY;
		bool RY();

		/****** StepKinematics_LowOrderKinematicPair::RZ ******/
		/****** md5 signature: 9973ebd7554137c25a54b8973a5d0fa5 ******/
		%feature("compactdefaultargs") RZ;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns field RZ.
") RZ;
		bool RZ();

		/****** StepKinematics_LowOrderKinematicPair::SetRX ******/
		/****** md5 signature: 1cbd8149234e213fe0f8d271dde24f20 ******/
		%feature("compactdefaultargs") SetRX;
		%feature("autodoc", "
Parameters
----------
theRX: bool

Return
-------
None

Description
-----------
Sets field RX.
") SetRX;
		void SetRX(const bool theRX);

		/****** StepKinematics_LowOrderKinematicPair::SetRY ******/
		/****** md5 signature: fbe4573f7b8b53cadfbab9d9a462d3cc ******/
		%feature("compactdefaultargs") SetRY;
		%feature("autodoc", "
Parameters
----------
theRY: bool

Return
-------
None

Description
-----------
Sets field RY.
") SetRY;
		void SetRY(const bool theRY);

		/****** StepKinematics_LowOrderKinematicPair::SetRZ ******/
		/****** md5 signature: 9c5c34823e4bea4bae1263ad089c05ff ******/
		%feature("compactdefaultargs") SetRZ;
		%feature("autodoc", "
Parameters
----------
theRZ: bool

Return
-------
None

Description
-----------
Sets field RZ.
") SetRZ;
		void SetRZ(const bool theRZ);

		/****** StepKinematics_LowOrderKinematicPair::SetTX ******/
		/****** md5 signature: d904492544a92394221c79ad537f5848 ******/
		%feature("compactdefaultargs") SetTX;
		%feature("autodoc", "
Parameters
----------
theTX: bool

Return
-------
None

Description
-----------
Sets field TX.
") SetTX;
		void SetTX(const bool theTX);

		/****** StepKinematics_LowOrderKinematicPair::SetTY ******/
		/****** md5 signature: 00524b110eda93b4dc8709d9b56e81f3 ******/
		%feature("compactdefaultargs") SetTY;
		%feature("autodoc", "
Parameters
----------
theTY: bool

Return
-------
None

Description
-----------
Sets field TY.
") SetTY;
		void SetTY(const bool theTY);

		/****** StepKinematics_LowOrderKinematicPair::SetTZ ******/
		/****** md5 signature: 295c4804c56a87f1f5e662f0e6e2ecbb ******/
		%feature("compactdefaultargs") SetTZ;
		%feature("autodoc", "
Parameters
----------
theTZ: bool

Return
-------
None

Description
-----------
Sets field TZ.
") SetTZ;
		void SetTZ(const bool theTZ);

		/****** StepKinematics_LowOrderKinematicPair::TX ******/
		/****** md5 signature: a63456af5e978ba78537c7e1cc728419 ******/
		%feature("compactdefaultargs") TX;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns field TX.
") TX;
		bool TX();

		/****** StepKinematics_LowOrderKinematicPair::TY ******/
		/****** md5 signature: 287fb3aba9fb316fc841e2190cc570ce ******/
		%feature("compactdefaultargs") TY;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns field TY.
") TY;
		bool TY();

		/****** StepKinematics_LowOrderKinematicPair::TZ ******/
		/****** md5 signature: d619894b9f9ecce8520b257b8ce955d8 ******/
		%feature("compactdefaultargs") TZ;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns field TZ.
") TZ;
		bool TZ();

};


%make_alias(StepKinematics_LowOrderKinematicPair)

%extend StepKinematics_LowOrderKinematicPair {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************************************
* class StepKinematics_LowOrderKinematicPairValue *
**************************************************/
class StepKinematics_LowOrderKinematicPairValue : public StepKinematics_PairValue {
	public:
		/****** StepKinematics_LowOrderKinematicPairValue::StepKinematics_LowOrderKinematicPairValue ******/
		/****** md5 signature: 140fba40c9866444576835280755aaa7 ******/
		%feature("compactdefaultargs") StepKinematics_LowOrderKinematicPairValue;
		%feature("autodoc", "Return
-------
None

Description
-----------
default constructor.
") StepKinematics_LowOrderKinematicPairValue;
		 StepKinematics_LowOrderKinematicPairValue();

		/****** StepKinematics_LowOrderKinematicPairValue::ActualRotationX ******/
		/****** md5 signature: 09b7ecaf1723b5f3e8bccf90a3f17077 ******/
		%feature("compactdefaultargs") ActualRotationX;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns field ActualRotationX.
") ActualRotationX;
		double ActualRotationX();

		/****** StepKinematics_LowOrderKinematicPairValue::ActualRotationY ******/
		/****** md5 signature: 42ac839154211788d39a59d461c23b10 ******/
		%feature("compactdefaultargs") ActualRotationY;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns field ActualRotationY.
") ActualRotationY;
		double ActualRotationY();

		/****** StepKinematics_LowOrderKinematicPairValue::ActualRotationZ ******/
		/****** md5 signature: d30ba3a4112ebc6ce863349e86aebbc2 ******/
		%feature("compactdefaultargs") ActualRotationZ;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns field ActualRotationZ.
") ActualRotationZ;
		double ActualRotationZ();

		/****** StepKinematics_LowOrderKinematicPairValue::ActualTranslationX ******/
		/****** md5 signature: 7d1557aec88c53a19a215161278b0b36 ******/
		%feature("compactdefaultargs") ActualTranslationX;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns field ActualTranslationX.
") ActualTranslationX;
		double ActualTranslationX();

		/****** StepKinematics_LowOrderKinematicPairValue::ActualTranslationY ******/
		/****** md5 signature: c2e977c9e58ec7ae4929642c6fe1c44c ******/
		%feature("compactdefaultargs") ActualTranslationY;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns field ActualTranslationY.
") ActualTranslationY;
		double ActualTranslationY();

		/****** StepKinematics_LowOrderKinematicPairValue::ActualTranslationZ ******/
		/****** md5 signature: bc4110a02aed142c03bf79f946b8f764 ******/
		%feature("compactdefaultargs") ActualTranslationZ;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns field ActualTranslationZ.
") ActualTranslationZ;
		double ActualTranslationZ();

		/****** StepKinematics_LowOrderKinematicPairValue::Init ******/
		/****** md5 signature: b86b0aed3a965bc37027a840b487ae03 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
theRepresentationItem_Name: TCollection_HAsciiString
thePairValue_AppliesToPair: StepKinematics_KinematicPair
theActualTranslationX: double
theActualTranslationY: double
theActualTranslationZ: double
theActualRotationX: double
theActualRotationY: double
theActualRotationZ: double

Return
-------
None

Description
-----------
Initialize all fields (own and inherited).
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & theRepresentationItem_Name, const opencascade::handle<StepKinematics_KinematicPair> & thePairValue_AppliesToPair, const double theActualTranslationX, const double theActualTranslationY, const double theActualTranslationZ, const double theActualRotationX, const double theActualRotationY, const double theActualRotationZ);

		/****** StepKinematics_LowOrderKinematicPairValue::SetActualRotationX ******/
		/****** md5 signature: 42b3e92a744db83420019f9b1c9178e2 ******/
		%feature("compactdefaultargs") SetActualRotationX;
		%feature("autodoc", "
Parameters
----------
theActualRotationX: double

Return
-------
None

Description
-----------
Sets field ActualRotationX.
") SetActualRotationX;
		void SetActualRotationX(const double theActualRotationX);

		/****** StepKinematics_LowOrderKinematicPairValue::SetActualRotationY ******/
		/****** md5 signature: d39525ce2e4509fea199002902c6f2c9 ******/
		%feature("compactdefaultargs") SetActualRotationY;
		%feature("autodoc", "
Parameters
----------
theActualRotationY: double

Return
-------
None

Description
-----------
Sets field ActualRotationY.
") SetActualRotationY;
		void SetActualRotationY(const double theActualRotationY);

		/****** StepKinematics_LowOrderKinematicPairValue::SetActualRotationZ ******/
		/****** md5 signature: d2a9739c54c7acefeb5e2d4bae344a77 ******/
		%feature("compactdefaultargs") SetActualRotationZ;
		%feature("autodoc", "
Parameters
----------
theActualRotationZ: double

Return
-------
None

Description
-----------
Sets field ActualRotationZ.
") SetActualRotationZ;
		void SetActualRotationZ(const double theActualRotationZ);

		/****** StepKinematics_LowOrderKinematicPairValue::SetActualTranslationX ******/
		/****** md5 signature: 800aa87976ca048f7ea474095656b01c ******/
		%feature("compactdefaultargs") SetActualTranslationX;
		%feature("autodoc", "
Parameters
----------
theActualTranslationX: double

Return
-------
None

Description
-----------
Sets field ActualTranslationX.
") SetActualTranslationX;
		void SetActualTranslationX(const double theActualTranslationX);

		/****** StepKinematics_LowOrderKinematicPairValue::SetActualTranslationY ******/
		/****** md5 signature: b83adb59c46fe6ace52d5a24614745d0 ******/
		%feature("compactdefaultargs") SetActualTranslationY;
		%feature("autodoc", "
Parameters
----------
theActualTranslationY: double

Return
-------
None

Description
-----------
Sets field ActualTranslationY.
") SetActualTranslationY;
		void SetActualTranslationY(const double theActualTranslationY);

		/****** StepKinematics_LowOrderKinematicPairValue::SetActualTranslationZ ******/
		/****** md5 signature: 9c9ab23d50dbfa10997df0b8d015aaea ******/
		%feature("compactdefaultargs") SetActualTranslationZ;
		%feature("autodoc", "
Parameters
----------
theActualTranslationZ: double

Return
-------
None

Description
-----------
Sets field ActualTranslationZ.
") SetActualTranslationZ;
		void SetActualTranslationZ(const double theActualTranslationZ);

};


%make_alias(StepKinematics_LowOrderKinematicPairValue)

%extend StepKinematics_LowOrderKinematicPairValue {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************************************************
* class StepKinematics_LowOrderKinematicPairWithMotionCoupling *
***************************************************************/
class StepKinematics_LowOrderKinematicPairWithMotionCoupling : public StepKinematics_KinematicPair {
	public:
		/****** StepKinematics_LowOrderKinematicPairWithMotionCoupling::StepKinematics_LowOrderKinematicPairWithMotionCoupling ******/
		/****** md5 signature: de2593e262e0ee6a59a7b8a06aad47c0 ******/
		%feature("compactdefaultargs") StepKinematics_LowOrderKinematicPairWithMotionCoupling;
		%feature("autodoc", "Return
-------
None

Description
-----------
default constructor.
") StepKinematics_LowOrderKinematicPairWithMotionCoupling;
		 StepKinematics_LowOrderKinematicPairWithMotionCoupling();

};


%make_alias(StepKinematics_LowOrderKinematicPairWithMotionCoupling)

%extend StepKinematics_LowOrderKinematicPairWithMotionCoupling {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************************
* class StepKinematics_PlanarPairValue *
***************************************/
class StepKinematics_PlanarPairValue : public StepKinematics_PairValue {
	public:
		/****** StepKinematics_PlanarPairValue::StepKinematics_PlanarPairValue ******/
		/****** md5 signature: a5e4d854701bdf62d4239c3c00656d98 ******/
		%feature("compactdefaultargs") StepKinematics_PlanarPairValue;
		%feature("autodoc", "Return
-------
None

Description
-----------
default constructor.
") StepKinematics_PlanarPairValue;
		 StepKinematics_PlanarPairValue();

		/****** StepKinematics_PlanarPairValue::ActualRotation ******/
		/****** md5 signature: f25f5770219b708a8eeac3d18093537f ******/
		%feature("compactdefaultargs") ActualRotation;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns field ActualRotation.
") ActualRotation;
		double ActualRotation();

		/****** StepKinematics_PlanarPairValue::ActualTranslationX ******/
		/****** md5 signature: 7d1557aec88c53a19a215161278b0b36 ******/
		%feature("compactdefaultargs") ActualTranslationX;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns field ActualTranslationX.
") ActualTranslationX;
		double ActualTranslationX();

		/****** StepKinematics_PlanarPairValue::ActualTranslationY ******/
		/****** md5 signature: c2e977c9e58ec7ae4929642c6fe1c44c ******/
		%feature("compactdefaultargs") ActualTranslationY;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns field ActualTranslationY.
") ActualTranslationY;
		double ActualTranslationY();

		/****** StepKinematics_PlanarPairValue::Init ******/
		/****** md5 signature: de31a63a1aac52703694b155f73b3bec ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
theRepresentationItem_Name: TCollection_HAsciiString
thePairValue_AppliesToPair: StepKinematics_KinematicPair
theActualRotation: double
theActualTranslationX: double
theActualTranslationY: double

Return
-------
None

Description
-----------
Initialize all fields (own and inherited).
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & theRepresentationItem_Name, const opencascade::handle<StepKinematics_KinematicPair> & thePairValue_AppliesToPair, const double theActualRotation, const double theActualTranslationX, const double theActualTranslationY);

		/****** StepKinematics_PlanarPairValue::SetActualRotation ******/
		/****** md5 signature: 88469d64f7595872fdaf5549069d8641 ******/
		%feature("compactdefaultargs") SetActualRotation;
		%feature("autodoc", "
Parameters
----------
theActualRotation: double

Return
-------
None

Description
-----------
Sets field ActualRotation.
") SetActualRotation;
		void SetActualRotation(const double theActualRotation);

		/****** StepKinematics_PlanarPairValue::SetActualTranslationX ******/
		/****** md5 signature: 800aa87976ca048f7ea474095656b01c ******/
		%feature("compactdefaultargs") SetActualTranslationX;
		%feature("autodoc", "
Parameters
----------
theActualTranslationX: double

Return
-------
None

Description
-----------
Sets field ActualTranslationX.
") SetActualTranslationX;
		void SetActualTranslationX(const double theActualTranslationX);

		/****** StepKinematics_PlanarPairValue::SetActualTranslationY ******/
		/****** md5 signature: b83adb59c46fe6ace52d5a24614745d0 ******/
		%feature("compactdefaultargs") SetActualTranslationY;
		%feature("autodoc", "
Parameters
----------
theActualTranslationY: double

Return
-------
None

Description
-----------
Sets field ActualTranslationY.
") SetActualTranslationY;
		void SetActualTranslationY(const double theActualTranslationY);

};


%make_alias(StepKinematics_PlanarPairValue)

%extend StepKinematics_PlanarPairValue {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************************************
* class StepKinematics_PointOnPlanarCurvePairValue *
***************************************************/
class StepKinematics_PointOnPlanarCurvePairValue : public StepKinematics_PairValue {
	public:
		/****** StepKinematics_PointOnPlanarCurvePairValue::StepKinematics_PointOnPlanarCurvePairValue ******/
		/****** md5 signature: e06585f79655c2e3b8690bf0fdf66f09 ******/
		%feature("compactdefaultargs") StepKinematics_PointOnPlanarCurvePairValue;
		%feature("autodoc", "Return
-------
None

Description
-----------
default constructor.
") StepKinematics_PointOnPlanarCurvePairValue;
		 StepKinematics_PointOnPlanarCurvePairValue();

		/****** StepKinematics_PointOnPlanarCurvePairValue::ActualPointOnCurve ******/
		/****** md5 signature: ed4a7e555947ac679dd1e1468f27502b ******/
		%feature("compactdefaultargs") ActualPointOnCurve;
		%feature("autodoc", "Return
-------
opencascade::handle<StepGeom_PointOnCurve>

Description
-----------
Returns field ActualPointOnCurve.
") ActualPointOnCurve;
		opencascade::handle<StepGeom_PointOnCurve> ActualPointOnCurve();

		/****** StepKinematics_PointOnPlanarCurvePairValue::Init ******/
		/****** md5 signature: 9649f04655f4e6c549e71506307ab44d ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
theRepresentationItem_Name: TCollection_HAsciiString
thePairValue_AppliesToPair: StepKinematics_KinematicPair
theActualPointOnCurve: StepGeom_PointOnCurve
theInputOrientation: StepKinematics_SpatialRotation

Return
-------
None

Description
-----------
Initialize all fields (own and inherited).
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & theRepresentationItem_Name, const opencascade::handle<StepKinematics_KinematicPair> & thePairValue_AppliesToPair, const opencascade::handle<StepGeom_PointOnCurve> & theActualPointOnCurve, const StepKinematics_SpatialRotation & theInputOrientation);

		/****** StepKinematics_PointOnPlanarCurvePairValue::InputOrientation ******/
		/****** md5 signature: 9b03c85e2d0e574b3f079e8cfbfcff68 ******/
		%feature("compactdefaultargs") InputOrientation;
		%feature("autodoc", "Return
-------
StepKinematics_SpatialRotation

Description
-----------
Returns field InputOrientation.
") InputOrientation;
		StepKinematics_SpatialRotation InputOrientation();

		/****** StepKinematics_PointOnPlanarCurvePairValue::SetActualPointOnCurve ******/
		/****** md5 signature: 98311a14395d84eda1d563dc54f13c2e ******/
		%feature("compactdefaultargs") SetActualPointOnCurve;
		%feature("autodoc", "
Parameters
----------
theActualPointOnCurve: StepGeom_PointOnCurve

Return
-------
None

Description
-----------
Sets field ActualPointOnCurve.
") SetActualPointOnCurve;
		void SetActualPointOnCurve(const opencascade::handle<StepGeom_PointOnCurve> & theActualPointOnCurve);

		/****** StepKinematics_PointOnPlanarCurvePairValue::SetInputOrientation ******/
		/****** md5 signature: 0efe0641aff13b56d8fb1cc049d53623 ******/
		%feature("compactdefaultargs") SetInputOrientation;
		%feature("autodoc", "
Parameters
----------
theInputOrientation: StepKinematics_SpatialRotation

Return
-------
None

Description
-----------
Sets field InputOrientation.
") SetInputOrientation;
		void SetInputOrientation(const StepKinematics_SpatialRotation & theInputOrientation);

};


%make_alias(StepKinematics_PointOnPlanarCurvePairValue)

%extend StepKinematics_PointOnPlanarCurvePairValue {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************************************
* class StepKinematics_PointOnSurfacePairValue *
***********************************************/
class StepKinematics_PointOnSurfacePairValue : public StepKinematics_PairValue {
	public:
		/****** StepKinematics_PointOnSurfacePairValue::StepKinematics_PointOnSurfacePairValue ******/
		/****** md5 signature: 66bf3d290f62fe87d8464e73c588a2c4 ******/
		%feature("compactdefaultargs") StepKinematics_PointOnSurfacePairValue;
		%feature("autodoc", "Return
-------
None

Description
-----------
default constructor.
") StepKinematics_PointOnSurfacePairValue;
		 StepKinematics_PointOnSurfacePairValue();

		/****** StepKinematics_PointOnSurfacePairValue::ActualPointOnSurface ******/
		/****** md5 signature: fa6d88116287e3fc164513fbb7583b2d ******/
		%feature("compactdefaultargs") ActualPointOnSurface;
		%feature("autodoc", "Return
-------
opencascade::handle<StepGeom_PointOnSurface>

Description
-----------
Returns field ActualPointOnSurface.
") ActualPointOnSurface;
		opencascade::handle<StepGeom_PointOnSurface> ActualPointOnSurface();

		/****** StepKinematics_PointOnSurfacePairValue::Init ******/
		/****** md5 signature: e73e29d78d3466bba8d321e5aa1d6aae ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
theRepresentationItem_Name: TCollection_HAsciiString
thePairValue_AppliesToPair: StepKinematics_KinematicPair
theActualPointOnSurface: StepGeom_PointOnSurface
theInputOrientation: StepKinematics_SpatialRotation

Return
-------
None

Description
-----------
Initialize all fields (own and inherited).
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & theRepresentationItem_Name, const opencascade::handle<StepKinematics_KinematicPair> & thePairValue_AppliesToPair, const opencascade::handle<StepGeom_PointOnSurface> & theActualPointOnSurface, const StepKinematics_SpatialRotation & theInputOrientation);

		/****** StepKinematics_PointOnSurfacePairValue::InputOrientation ******/
		/****** md5 signature: 9b03c85e2d0e574b3f079e8cfbfcff68 ******/
		%feature("compactdefaultargs") InputOrientation;
		%feature("autodoc", "Return
-------
StepKinematics_SpatialRotation

Description
-----------
Returns field InputOrientation.
") InputOrientation;
		StepKinematics_SpatialRotation InputOrientation();

		/****** StepKinematics_PointOnSurfacePairValue::SetActualPointOnSurface ******/
		/****** md5 signature: c7bd90fa0259485bb69c5208032b8176 ******/
		%feature("compactdefaultargs") SetActualPointOnSurface;
		%feature("autodoc", "
Parameters
----------
theActualPointOnSurface: StepGeom_PointOnSurface

Return
-------
None

Description
-----------
Sets field ActualPointOnSurface.
") SetActualPointOnSurface;
		void SetActualPointOnSurface(const opencascade::handle<StepGeom_PointOnSurface> & theActualPointOnSurface);

		/****** StepKinematics_PointOnSurfacePairValue::SetInputOrientation ******/
		/****** md5 signature: 0efe0641aff13b56d8fb1cc049d53623 ******/
		%feature("compactdefaultargs") SetInputOrientation;
		%feature("autodoc", "
Parameters
----------
theInputOrientation: StepKinematics_SpatialRotation

Return
-------
None

Description
-----------
Sets field InputOrientation.
") SetInputOrientation;
		void SetInputOrientation(const StepKinematics_SpatialRotation & theInputOrientation);

};


%make_alias(StepKinematics_PointOnSurfacePairValue)

%extend StepKinematics_PointOnSurfacePairValue {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************************
* class StepKinematics_PrismaticPairValue *
******************************************/
class StepKinematics_PrismaticPairValue : public StepKinematics_PairValue {
	public:
		/****** StepKinematics_PrismaticPairValue::StepKinematics_PrismaticPairValue ******/
		/****** md5 signature: 083fe6baebe7fa92369737913905c438 ******/
		%feature("compactdefaultargs") StepKinematics_PrismaticPairValue;
		%feature("autodoc", "Return
-------
None

Description
-----------
default constructor.
") StepKinematics_PrismaticPairValue;
		 StepKinematics_PrismaticPairValue();

		/****** StepKinematics_PrismaticPairValue::ActualTranslation ******/
		/****** md5 signature: baea39c02c08d532acc85ec0457d567c ******/
		%feature("compactdefaultargs") ActualTranslation;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns field ActualTranslation.
") ActualTranslation;
		double ActualTranslation();

		/****** StepKinematics_PrismaticPairValue::Init ******/
		/****** md5 signature: 45df7be3c169eac7280680fec2c14536 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
theRepresentationItem_Name: TCollection_HAsciiString
thePairValue_AppliesToPair: StepKinematics_KinematicPair
theActualTranslation: double

Return
-------
None

Description
-----------
Initialize all fields (own and inherited).
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & theRepresentationItem_Name, const opencascade::handle<StepKinematics_KinematicPair> & thePairValue_AppliesToPair, const double theActualTranslation);

		/****** StepKinematics_PrismaticPairValue::SetActualTranslation ******/
		/****** md5 signature: 61a492eaa835762cc1601d7b472171a0 ******/
		%feature("compactdefaultargs") SetActualTranslation;
		%feature("autodoc", "
Parameters
----------
theActualTranslation: double

Return
-------
None

Description
-----------
Sets field ActualTranslation.
") SetActualTranslation;
		void SetActualTranslation(const double theActualTranslation);

};


%make_alias(StepKinematics_PrismaticPairValue)

%extend StepKinematics_PrismaticPairValue {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************************************
* class StepKinematics_RackAndPinionPairValue *
**********************************************/
class StepKinematics_RackAndPinionPairValue : public StepKinematics_PairValue {
	public:
		/****** StepKinematics_RackAndPinionPairValue::StepKinematics_RackAndPinionPairValue ******/
		/****** md5 signature: 76d9ca4aa471a33f8be946330323c96a ******/
		%feature("compactdefaultargs") StepKinematics_RackAndPinionPairValue;
		%feature("autodoc", "Return
-------
None

Description
-----------
default constructor.
") StepKinematics_RackAndPinionPairValue;
		 StepKinematics_RackAndPinionPairValue();

		/****** StepKinematics_RackAndPinionPairValue::ActualDisplacement ******/
		/****** md5 signature: da977c049addae50a8d9538b822af00a ******/
		%feature("compactdefaultargs") ActualDisplacement;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns field ActualDisplacement.
") ActualDisplacement;
		double ActualDisplacement();

		/****** StepKinematics_RackAndPinionPairValue::Init ******/
		/****** md5 signature: c453eb764648defa152340a487a38158 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
theRepresentationItem_Name: TCollection_HAsciiString
thePairValue_AppliesToPair: StepKinematics_KinematicPair
theActualDisplacement: double

Return
-------
None

Description
-----------
Initialize all fields (own and inherited).
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & theRepresentationItem_Name, const opencascade::handle<StepKinematics_KinematicPair> & thePairValue_AppliesToPair, const double theActualDisplacement);

		/****** StepKinematics_RackAndPinionPairValue::SetActualDisplacement ******/
		/****** md5 signature: b06c912db5fbdc15fbeed229bd5d3be1 ******/
		%feature("compactdefaultargs") SetActualDisplacement;
		%feature("autodoc", "
Parameters
----------
theActualDisplacement: double

Return
-------
None

Description
-----------
Sets field ActualDisplacement.
") SetActualDisplacement;
		void SetActualDisplacement(const double theActualDisplacement);

};


%make_alias(StepKinematics_RackAndPinionPairValue)

%extend StepKinematics_RackAndPinionPairValue {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************************
* class StepKinematics_RevolutePairValue *
*****************************************/
class StepKinematics_RevolutePairValue : public StepKinematics_PairValue {
	public:
		/****** StepKinematics_RevolutePairValue::StepKinematics_RevolutePairValue ******/
		/****** md5 signature: ec929316dad4acdac195b4f4c087ab68 ******/
		%feature("compactdefaultargs") StepKinematics_RevolutePairValue;
		%feature("autodoc", "Return
-------
None

Description
-----------
default constructor.
") StepKinematics_RevolutePairValue;
		 StepKinematics_RevolutePairValue();

		/****** StepKinematics_RevolutePairValue::ActualRotation ******/
		/****** md5 signature: f25f5770219b708a8eeac3d18093537f ******/
		%feature("compactdefaultargs") ActualRotation;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns field ActualRotation.
") ActualRotation;
		double ActualRotation();

		/****** StepKinematics_RevolutePairValue::Init ******/
		/****** md5 signature: 2d0d9db6f07e3125a6b8524b1ba7de25 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
theRepresentationItem_Name: TCollection_HAsciiString
thePairValue_AppliesToPair: StepKinematics_KinematicPair
theActualRotation: double

Return
-------
None

Description
-----------
Initialize all fields (own and inherited).
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & theRepresentationItem_Name, const opencascade::handle<StepKinematics_KinematicPair> & thePairValue_AppliesToPair, const double theActualRotation);

		/****** StepKinematics_RevolutePairValue::SetActualRotation ******/
		/****** md5 signature: 88469d64f7595872fdaf5549069d8641 ******/
		%feature("compactdefaultargs") SetActualRotation;
		%feature("autodoc", "
Parameters
----------
theActualRotation: double

Return
-------
None

Description
-----------
Sets field ActualRotation.
") SetActualRotation;
		void SetActualRotation(const double theActualRotation);

};


%make_alias(StepKinematics_RevolutePairValue)

%extend StepKinematics_RevolutePairValue {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************************************
* class StepKinematics_RigidLinkRepresentation *
***********************************************/
class StepKinematics_RigidLinkRepresentation : public StepKinematics_KinematicLinkRepresentation {
	public:
		/****** StepKinematics_RigidLinkRepresentation::StepKinematics_RigidLinkRepresentation ******/
		/****** md5 signature: a608df37d8412a2b8d80594ac0866966 ******/
		%feature("compactdefaultargs") StepKinematics_RigidLinkRepresentation;
		%feature("autodoc", "Return
-------
None

Description
-----------
default constructor.
") StepKinematics_RigidLinkRepresentation;
		 StepKinematics_RigidLinkRepresentation();

};


%make_alias(StepKinematics_RigidLinkRepresentation)

%extend StepKinematics_RigidLinkRepresentation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************************
* class StepKinematics_RollingCurvePairValue *
*********************************************/
class StepKinematics_RollingCurvePairValue : public StepKinematics_PairValue {
	public:
		/****** StepKinematics_RollingCurvePairValue::StepKinematics_RollingCurvePairValue ******/
		/****** md5 signature: c6c868e4ba6000f1befc145bafd1cdeb ******/
		%feature("compactdefaultargs") StepKinematics_RollingCurvePairValue;
		%feature("autodoc", "Return
-------
None

Description
-----------
default constructor.
") StepKinematics_RollingCurvePairValue;
		 StepKinematics_RollingCurvePairValue();

		/****** StepKinematics_RollingCurvePairValue::ActualPointOnCurve1 ******/
		/****** md5 signature: 74ec7cdb97e0bb8eacdeda0d6dd7bfe9 ******/
		%feature("compactdefaultargs") ActualPointOnCurve1;
		%feature("autodoc", "Return
-------
opencascade::handle<StepGeom_PointOnCurve>

Description
-----------
Returns field ActualPointOnCurve1.
") ActualPointOnCurve1;
		opencascade::handle<StepGeom_PointOnCurve> ActualPointOnCurve1();

		/****** StepKinematics_RollingCurvePairValue::Init ******/
		/****** md5 signature: 196669a499120f042b3becce7f34225d ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
theRepresentationItem_Name: TCollection_HAsciiString
thePairValue_AppliesToPair: StepKinematics_KinematicPair
theActualPointOnCurve1: StepGeom_PointOnCurve

Return
-------
None

Description
-----------
Initialize all fields (own and inherited).
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & theRepresentationItem_Name, const opencascade::handle<StepKinematics_KinematicPair> & thePairValue_AppliesToPair, const opencascade::handle<StepGeom_PointOnCurve> & theActualPointOnCurve1);

		/****** StepKinematics_RollingCurvePairValue::SetActualPointOnCurve1 ******/
		/****** md5 signature: 5951372fe4c11a57858c04c47f987211 ******/
		%feature("compactdefaultargs") SetActualPointOnCurve1;
		%feature("autodoc", "
Parameters
----------
theActualPointOnCurve1: StepGeom_PointOnCurve

Return
-------
None

Description
-----------
Sets field ActualPointOnCurve1.
") SetActualPointOnCurve1;
		void SetActualPointOnCurve1(const opencascade::handle<StepGeom_PointOnCurve> & theActualPointOnCurve1);

};


%make_alias(StepKinematics_RollingCurvePairValue)

%extend StepKinematics_RollingCurvePairValue {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************************************
* class StepKinematics_RollingSurfacePairValue *
***********************************************/
class StepKinematics_RollingSurfacePairValue : public StepKinematics_PairValue {
	public:
		/****** StepKinematics_RollingSurfacePairValue::StepKinematics_RollingSurfacePairValue ******/
		/****** md5 signature: 854b57e4737009a2fa6fc94d315db6d3 ******/
		%feature("compactdefaultargs") StepKinematics_RollingSurfacePairValue;
		%feature("autodoc", "Return
-------
None

Description
-----------
default constructor.
") StepKinematics_RollingSurfacePairValue;
		 StepKinematics_RollingSurfacePairValue();

		/****** StepKinematics_RollingSurfacePairValue::ActualPointOnSurface ******/
		/****** md5 signature: fa6d88116287e3fc164513fbb7583b2d ******/
		%feature("compactdefaultargs") ActualPointOnSurface;
		%feature("autodoc", "Return
-------
opencascade::handle<StepGeom_PointOnSurface>

Description
-----------
Returns field ActualPointOnSurface.
") ActualPointOnSurface;
		opencascade::handle<StepGeom_PointOnSurface> ActualPointOnSurface();

		/****** StepKinematics_RollingSurfacePairValue::ActualRotation ******/
		/****** md5 signature: f25f5770219b708a8eeac3d18093537f ******/
		%feature("compactdefaultargs") ActualRotation;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns field ActualRotation.
") ActualRotation;
		double ActualRotation();

		/****** StepKinematics_RollingSurfacePairValue::Init ******/
		/****** md5 signature: 2fc92bf3f1b8c9bdebb92cba3a769442 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
theRepresentationItem_Name: TCollection_HAsciiString
thePairValue_AppliesToPair: StepKinematics_KinematicPair
theActualPointOnSurface: StepGeom_PointOnSurface
theActualRotation: double

Return
-------
None

Description
-----------
Initialize all fields (own and inherited).
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & theRepresentationItem_Name, const opencascade::handle<StepKinematics_KinematicPair> & thePairValue_AppliesToPair, const opencascade::handle<StepGeom_PointOnSurface> & theActualPointOnSurface, const double theActualRotation);

		/****** StepKinematics_RollingSurfacePairValue::SetActualPointOnSurface ******/
		/****** md5 signature: c7bd90fa0259485bb69c5208032b8176 ******/
		%feature("compactdefaultargs") SetActualPointOnSurface;
		%feature("autodoc", "
Parameters
----------
theActualPointOnSurface: StepGeom_PointOnSurface

Return
-------
None

Description
-----------
Sets field ActualPointOnSurface.
") SetActualPointOnSurface;
		void SetActualPointOnSurface(const opencascade::handle<StepGeom_PointOnSurface> & theActualPointOnSurface);

		/****** StepKinematics_RollingSurfacePairValue::SetActualRotation ******/
		/****** md5 signature: 88469d64f7595872fdaf5549069d8641 ******/
		%feature("compactdefaultargs") SetActualRotation;
		%feature("autodoc", "
Parameters
----------
theActualRotation: double

Return
-------
None

Description
-----------
Sets field ActualRotation.
") SetActualRotation;
		void SetActualRotation(const double theActualRotation);

};


%make_alias(StepKinematics_RollingSurfacePairValue)

%extend StepKinematics_RollingSurfacePairValue {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************************
* class StepKinematics_ScrewPairValue *
**************************************/
class StepKinematics_ScrewPairValue : public StepKinematics_PairValue {
	public:
		/****** StepKinematics_ScrewPairValue::StepKinematics_ScrewPairValue ******/
		/****** md5 signature: d9039615094ffcce7c7485575eb721ba ******/
		%feature("compactdefaultargs") StepKinematics_ScrewPairValue;
		%feature("autodoc", "Return
-------
None

Description
-----------
default constructor.
") StepKinematics_ScrewPairValue;
		 StepKinematics_ScrewPairValue();

		/****** StepKinematics_ScrewPairValue::ActualRotation ******/
		/****** md5 signature: f25f5770219b708a8eeac3d18093537f ******/
		%feature("compactdefaultargs") ActualRotation;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns field ActualRotation.
") ActualRotation;
		double ActualRotation();

		/****** StepKinematics_ScrewPairValue::Init ******/
		/****** md5 signature: 2d0d9db6f07e3125a6b8524b1ba7de25 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
theRepresentationItem_Name: TCollection_HAsciiString
thePairValue_AppliesToPair: StepKinematics_KinematicPair
theActualRotation: double

Return
-------
None

Description
-----------
Initialize all fields (own and inherited).
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & theRepresentationItem_Name, const opencascade::handle<StepKinematics_KinematicPair> & thePairValue_AppliesToPair, const double theActualRotation);

		/****** StepKinematics_ScrewPairValue::SetActualRotation ******/
		/****** md5 signature: 88469d64f7595872fdaf5549069d8641 ******/
		%feature("compactdefaultargs") SetActualRotation;
		%feature("autodoc", "
Parameters
----------
theActualRotation: double

Return
-------
None

Description
-----------
Sets field ActualRotation.
") SetActualRotation;
		void SetActualRotation(const double theActualRotation);

};


%make_alias(StepKinematics_ScrewPairValue)

%extend StepKinematics_ScrewPairValue {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************************
* class StepKinematics_SlidingCurvePairValue *
*********************************************/
class StepKinematics_SlidingCurvePairValue : public StepKinematics_PairValue {
	public:
		/****** StepKinematics_SlidingCurvePairValue::StepKinematics_SlidingCurvePairValue ******/
		/****** md5 signature: a34f25a13dfbc29c483e530258cbd526 ******/
		%feature("compactdefaultargs") StepKinematics_SlidingCurvePairValue;
		%feature("autodoc", "Return
-------
None

Description
-----------
default constructor.
") StepKinematics_SlidingCurvePairValue;
		 StepKinematics_SlidingCurvePairValue();

		/****** StepKinematics_SlidingCurvePairValue::ActualPointOnCurve1 ******/
		/****** md5 signature: 74ec7cdb97e0bb8eacdeda0d6dd7bfe9 ******/
		%feature("compactdefaultargs") ActualPointOnCurve1;
		%feature("autodoc", "Return
-------
opencascade::handle<StepGeom_PointOnCurve>

Description
-----------
Returns field ActualPointOnCurve1.
") ActualPointOnCurve1;
		opencascade::handle<StepGeom_PointOnCurve> ActualPointOnCurve1();

		/****** StepKinematics_SlidingCurvePairValue::ActualPointOnCurve2 ******/
		/****** md5 signature: 294013b24fc22e1782ff8dc3687deed0 ******/
		%feature("compactdefaultargs") ActualPointOnCurve2;
		%feature("autodoc", "Return
-------
opencascade::handle<StepGeom_PointOnCurve>

Description
-----------
Returns field ActualPointOnCurve2.
") ActualPointOnCurve2;
		opencascade::handle<StepGeom_PointOnCurve> ActualPointOnCurve2();

		/****** StepKinematics_SlidingCurvePairValue::Init ******/
		/****** md5 signature: 009635465c17772e1157d491dad9cce3 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
theRepresentationItem_Name: TCollection_HAsciiString
thePairValue_AppliesToPair: StepKinematics_KinematicPair
theActualPointOnCurve1: StepGeom_PointOnCurve
theActualPointOnCurve2: StepGeom_PointOnCurve

Return
-------
None

Description
-----------
Initialize all fields (own and inherited).
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & theRepresentationItem_Name, const opencascade::handle<StepKinematics_KinematicPair> & thePairValue_AppliesToPair, const opencascade::handle<StepGeom_PointOnCurve> & theActualPointOnCurve1, const opencascade::handle<StepGeom_PointOnCurve> & theActualPointOnCurve2);

		/****** StepKinematics_SlidingCurvePairValue::SetActualPointOnCurve1 ******/
		/****** md5 signature: 5951372fe4c11a57858c04c47f987211 ******/
		%feature("compactdefaultargs") SetActualPointOnCurve1;
		%feature("autodoc", "
Parameters
----------
theActualPointOnCurve1: StepGeom_PointOnCurve

Return
-------
None

Description
-----------
Sets field ActualPointOnCurve1.
") SetActualPointOnCurve1;
		void SetActualPointOnCurve1(const opencascade::handle<StepGeom_PointOnCurve> & theActualPointOnCurve1);

		/****** StepKinematics_SlidingCurvePairValue::SetActualPointOnCurve2 ******/
		/****** md5 signature: 14ed1c3f88f68d86cdf34bc6bd0859ff ******/
		%feature("compactdefaultargs") SetActualPointOnCurve2;
		%feature("autodoc", "
Parameters
----------
theActualPointOnCurve2: StepGeom_PointOnCurve

Return
-------
None

Description
-----------
Sets field ActualPointOnCurve2.
") SetActualPointOnCurve2;
		void SetActualPointOnCurve2(const opencascade::handle<StepGeom_PointOnCurve> & theActualPointOnCurve2);

};


%make_alias(StepKinematics_SlidingCurvePairValue)

%extend StepKinematics_SlidingCurvePairValue {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************************************
* class StepKinematics_SlidingSurfacePairValue *
***********************************************/
class StepKinematics_SlidingSurfacePairValue : public StepKinematics_PairValue {
	public:
		/****** StepKinematics_SlidingSurfacePairValue::StepKinematics_SlidingSurfacePairValue ******/
		/****** md5 signature: dec289ca874807be2f477610b4283681 ******/
		%feature("compactdefaultargs") StepKinematics_SlidingSurfacePairValue;
		%feature("autodoc", "Return
-------
None

Description
-----------
default constructor.
") StepKinematics_SlidingSurfacePairValue;
		 StepKinematics_SlidingSurfacePairValue();

		/****** StepKinematics_SlidingSurfacePairValue::ActualPointOnSurface1 ******/
		/****** md5 signature: 78d72fff5ce2897164342a95e36e88b1 ******/
		%feature("compactdefaultargs") ActualPointOnSurface1;
		%feature("autodoc", "Return
-------
opencascade::handle<StepGeom_PointOnSurface>

Description
-----------
Returns field ActualPointOnSurface1.
") ActualPointOnSurface1;
		opencascade::handle<StepGeom_PointOnSurface> ActualPointOnSurface1();

		/****** StepKinematics_SlidingSurfacePairValue::ActualPointOnSurface2 ******/
		/****** md5 signature: 2f16b8cb0434b48d68551b7cff2936af ******/
		%feature("compactdefaultargs") ActualPointOnSurface2;
		%feature("autodoc", "Return
-------
opencascade::handle<StepGeom_PointOnSurface>

Description
-----------
Returns field ActualPointOnSurface2.
") ActualPointOnSurface2;
		opencascade::handle<StepGeom_PointOnSurface> ActualPointOnSurface2();

		/****** StepKinematics_SlidingSurfacePairValue::ActualRotation ******/
		/****** md5 signature: f25f5770219b708a8eeac3d18093537f ******/
		%feature("compactdefaultargs") ActualRotation;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns field ActualRotation.
") ActualRotation;
		double ActualRotation();

		/****** StepKinematics_SlidingSurfacePairValue::Init ******/
		/****** md5 signature: f10087d44780338de7a92f10ac7daae0 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
theRepresentationItem_Name: TCollection_HAsciiString
thePairValue_AppliesToPair: StepKinematics_KinematicPair
theActualPointOnSurface1: StepGeom_PointOnSurface
theActualPointOnSurface2: StepGeom_PointOnSurface
theActualRotation: double

Return
-------
None

Description
-----------
Initialize all fields (own and inherited).
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & theRepresentationItem_Name, const opencascade::handle<StepKinematics_KinematicPair> & thePairValue_AppliesToPair, const opencascade::handle<StepGeom_PointOnSurface> & theActualPointOnSurface1, const opencascade::handle<StepGeom_PointOnSurface> & theActualPointOnSurface2, const double theActualRotation);

		/****** StepKinematics_SlidingSurfacePairValue::SetActualPointOnSurface1 ******/
		/****** md5 signature: c1c1a93da181bfcc383953b12aae5097 ******/
		%feature("compactdefaultargs") SetActualPointOnSurface1;
		%feature("autodoc", "
Parameters
----------
theActualPointOnSurface1: StepGeom_PointOnSurface

Return
-------
None

Description
-----------
Sets field ActualPointOnSurface1.
") SetActualPointOnSurface1;
		void SetActualPointOnSurface1(const opencascade::handle<StepGeom_PointOnSurface> & theActualPointOnSurface1);

		/****** StepKinematics_SlidingSurfacePairValue::SetActualPointOnSurface2 ******/
		/****** md5 signature: f4d2dbf68560b803672b1e2f428b2a4c ******/
		%feature("compactdefaultargs") SetActualPointOnSurface2;
		%feature("autodoc", "
Parameters
----------
theActualPointOnSurface2: StepGeom_PointOnSurface

Return
-------
None

Description
-----------
Sets field ActualPointOnSurface2.
") SetActualPointOnSurface2;
		void SetActualPointOnSurface2(const opencascade::handle<StepGeom_PointOnSurface> & theActualPointOnSurface2);

		/****** StepKinematics_SlidingSurfacePairValue::SetActualRotation ******/
		/****** md5 signature: 88469d64f7595872fdaf5549069d8641 ******/
		%feature("compactdefaultargs") SetActualRotation;
		%feature("autodoc", "
Parameters
----------
theActualRotation: double

Return
-------
None

Description
-----------
Sets field ActualRotation.
") SetActualRotation;
		void SetActualRotation(const double theActualRotation);

};


%make_alias(StepKinematics_SlidingSurfacePairValue)

%extend StepKinematics_SlidingSurfacePairValue {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************************
* class StepKinematics_SphericalPairValue *
******************************************/
class StepKinematics_SphericalPairValue : public StepKinematics_PairValue {
	public:
		/****** StepKinematics_SphericalPairValue::StepKinematics_SphericalPairValue ******/
		/****** md5 signature: cb2964f7a23dd9320611e2fe84943831 ******/
		%feature("compactdefaultargs") StepKinematics_SphericalPairValue;
		%feature("autodoc", "Return
-------
None

Description
-----------
default constructor.
") StepKinematics_SphericalPairValue;
		 StepKinematics_SphericalPairValue();

		/****** StepKinematics_SphericalPairValue::Init ******/
		/****** md5 signature: f0a7b6e420e1e592424af0309a4dd8dd ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
theRepresentationItem_Name: TCollection_HAsciiString
thePairValue_AppliesToPair: StepKinematics_KinematicPair
theInputOrientation: StepKinematics_SpatialRotation

Return
-------
None

Description
-----------
Initialize all fields (own and inherited).
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & theRepresentationItem_Name, const opencascade::handle<StepKinematics_KinematicPair> & thePairValue_AppliesToPair, const StepKinematics_SpatialRotation & theInputOrientation);

		/****** StepKinematics_SphericalPairValue::InputOrientation ******/
		/****** md5 signature: 9b03c85e2d0e574b3f079e8cfbfcff68 ******/
		%feature("compactdefaultargs") InputOrientation;
		%feature("autodoc", "Return
-------
StepKinematics_SpatialRotation

Description
-----------
Returns field InputOrientation.
") InputOrientation;
		StepKinematics_SpatialRotation InputOrientation();

		/****** StepKinematics_SphericalPairValue::SetInputOrientation ******/
		/****** md5 signature: 0efe0641aff13b56d8fb1cc049d53623 ******/
		%feature("compactdefaultargs") SetInputOrientation;
		%feature("autodoc", "
Parameters
----------
theInputOrientation: StepKinematics_SpatialRotation

Return
-------
None

Description
-----------
Sets field InputOrientation.
") SetInputOrientation;
		void SetInputOrientation(const StepKinematics_SpatialRotation & theInputOrientation);

};


%make_alias(StepKinematics_SphericalPairValue)

%extend StepKinematics_SphericalPairValue {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************************************
* class StepKinematics_UnconstrainedPairValue *
**********************************************/
class StepKinematics_UnconstrainedPairValue : public StepKinematics_PairValue {
	public:
		/****** StepKinematics_UnconstrainedPairValue::StepKinematics_UnconstrainedPairValue ******/
		/****** md5 signature: 643a65c893c7ceb262e8c36e57736410 ******/
		%feature("compactdefaultargs") StepKinematics_UnconstrainedPairValue;
		%feature("autodoc", "Return
-------
None

Description
-----------
default constructor.
") StepKinematics_UnconstrainedPairValue;
		 StepKinematics_UnconstrainedPairValue();

		/****** StepKinematics_UnconstrainedPairValue::ActualPlacement ******/
		/****** md5 signature: 8cb67f0da2cba4bf65e344cf4a319c7f ******/
		%feature("compactdefaultargs") ActualPlacement;
		%feature("autodoc", "Return
-------
opencascade::handle<StepGeom_Axis2Placement3d>

Description
-----------
Returns field ActualPlacement.
") ActualPlacement;
		opencascade::handle<StepGeom_Axis2Placement3d> ActualPlacement();

		/****** StepKinematics_UnconstrainedPairValue::Init ******/
		/****** md5 signature: d447b8d02f6a9f8cda858a2b58d851f9 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
theRepresentationItem_Name: TCollection_HAsciiString
thePairValue_AppliesToPair: StepKinematics_KinematicPair
theActualPlacement: StepGeom_Axis2Placement3d

Return
-------
None

Description
-----------
Initialize all fields (own and inherited).
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & theRepresentationItem_Name, const opencascade::handle<StepKinematics_KinematicPair> & thePairValue_AppliesToPair, const opencascade::handle<StepGeom_Axis2Placement3d> & theActualPlacement);

		/****** StepKinematics_UnconstrainedPairValue::SetActualPlacement ******/
		/****** md5 signature: c0afec7db03a6f8fa2909ab78c4517ce ******/
		%feature("compactdefaultargs") SetActualPlacement;
		%feature("autodoc", "
Parameters
----------
theActualPlacement: StepGeom_Axis2Placement3d

Return
-------
None

Description
-----------
Sets field ActualPlacement.
") SetActualPlacement;
		void SetActualPlacement(const opencascade::handle<StepGeom_Axis2Placement3d> & theActualPlacement);

};


%make_alias(StepKinematics_UnconstrainedPairValue)

%extend StepKinematics_UnconstrainedPairValue {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************************
* class StepKinematics_UniversalPairValue *
******************************************/
class StepKinematics_UniversalPairValue : public StepKinematics_PairValue {
	public:
		/****** StepKinematics_UniversalPairValue::StepKinematics_UniversalPairValue ******/
		/****** md5 signature: 72783e9f515ad4793421ba46840d8641 ******/
		%feature("compactdefaultargs") StepKinematics_UniversalPairValue;
		%feature("autodoc", "Return
-------
None

Description
-----------
default constructor.
") StepKinematics_UniversalPairValue;
		 StepKinematics_UniversalPairValue();

		/****** StepKinematics_UniversalPairValue::FirstRotationAngle ******/
		/****** md5 signature: 2d9ded356d1ba25b282516f00deddb47 ******/
		%feature("compactdefaultargs") FirstRotationAngle;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns field FirstRotationAngle.
") FirstRotationAngle;
		double FirstRotationAngle();

		/****** StepKinematics_UniversalPairValue::Init ******/
		/****** md5 signature: e47194e0f75fc9a2f3ee0f1b52a76f9f ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
theRepresentationItem_Name: TCollection_HAsciiString
thePairValue_AppliesToPair: StepKinematics_KinematicPair
theFirstRotationAngle: double
theSecondRotationAngle: double

Return
-------
None

Description
-----------
Initialize all fields (own and inherited).
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & theRepresentationItem_Name, const opencascade::handle<StepKinematics_KinematicPair> & thePairValue_AppliesToPair, const double theFirstRotationAngle, const double theSecondRotationAngle);

		/****** StepKinematics_UniversalPairValue::SecondRotationAngle ******/
		/****** md5 signature: 6ac70e46139c461dbc040d688ad72122 ******/
		%feature("compactdefaultargs") SecondRotationAngle;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns field SecondRotationAngle.
") SecondRotationAngle;
		double SecondRotationAngle();

		/****** StepKinematics_UniversalPairValue::SetFirstRotationAngle ******/
		/****** md5 signature: 1fcc5f789925d2e5d262eb2e16d13da4 ******/
		%feature("compactdefaultargs") SetFirstRotationAngle;
		%feature("autodoc", "
Parameters
----------
theFirstRotationAngle: double

Return
-------
None

Description
-----------
Sets field FirstRotationAngle.
") SetFirstRotationAngle;
		void SetFirstRotationAngle(const double theFirstRotationAngle);

		/****** StepKinematics_UniversalPairValue::SetSecondRotationAngle ******/
		/****** md5 signature: ecd3d14850da1702395f664dfdd97621 ******/
		%feature("compactdefaultargs") SetSecondRotationAngle;
		%feature("autodoc", "
Parameters
----------
theSecondRotationAngle: double

Return
-------
None

Description
-----------
Sets field SecondRotationAngle.
") SetSecondRotationAngle;
		void SetSecondRotationAngle(const double theSecondRotationAngle);

};


%make_alias(StepKinematics_UniversalPairValue)

%extend StepKinematics_UniversalPairValue {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************************
* class StepKinematics_CylindricalPair *
***************************************/
class StepKinematics_CylindricalPair : public StepKinematics_LowOrderKinematicPair {
	public:
		/****** StepKinematics_CylindricalPair::StepKinematics_CylindricalPair ******/
		/****** md5 signature: 8fe73e1faba5e327ef318e3f62cb1df7 ******/
		%feature("compactdefaultargs") StepKinematics_CylindricalPair;
		%feature("autodoc", "Return
-------
None

Description
-----------
default constructor.
") StepKinematics_CylindricalPair;
		 StepKinematics_CylindricalPair();

};


%make_alias(StepKinematics_CylindricalPair)

%extend StepKinematics_CylindricalPair {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************************
* class StepKinematics_FullyConstrainedPair *
********************************************/
class StepKinematics_FullyConstrainedPair : public StepKinematics_LowOrderKinematicPair {
	public:
		/****** StepKinematics_FullyConstrainedPair::StepKinematics_FullyConstrainedPair ******/
		/****** md5 signature: 034391b488f13c0514207d31488c774c ******/
		%feature("compactdefaultargs") StepKinematics_FullyConstrainedPair;
		%feature("autodoc", "Return
-------
None

Description
-----------
default constructor.
") StepKinematics_FullyConstrainedPair;
		 StepKinematics_FullyConstrainedPair();

};


%make_alias(StepKinematics_FullyConstrainedPair)

%extend StepKinematics_FullyConstrainedPair {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************
* class StepKinematics_GearPair *
********************************/
class StepKinematics_GearPair : public StepKinematics_LowOrderKinematicPairWithMotionCoupling {
	public:
		/****** StepKinematics_GearPair::StepKinematics_GearPair ******/
		/****** md5 signature: f453d6f19f588f5305c827bb588f0533 ******/
		%feature("compactdefaultargs") StepKinematics_GearPair;
		%feature("autodoc", "Return
-------
None

Description
-----------
default constructor.
") StepKinematics_GearPair;
		 StepKinematics_GearPair();

		/****** StepKinematics_GearPair::Bevel ******/
		/****** md5 signature: 69dd9fd309dce89974b435b3a35c92eb ******/
		%feature("compactdefaultargs") Bevel;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns field Bevel.
") Bevel;
		double Bevel();

		/****** StepKinematics_GearPair::GearRatio ******/
		/****** md5 signature: 94f498957c3d9edb78bbd07ebe5a746c ******/
		%feature("compactdefaultargs") GearRatio;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns field GearRatio.
") GearRatio;
		double GearRatio();

		/****** StepKinematics_GearPair::HelicalAngle ******/
		/****** md5 signature: ccd2e9334a0ee7a8ff0124c65a5b5a56 ******/
		%feature("compactdefaultargs") HelicalAngle;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns field HelicalAngle.
") HelicalAngle;
		double HelicalAngle();

		/****** StepKinematics_GearPair::Init ******/
		/****** md5 signature: 74fd0e237da728cd10bb8f4e08be9d40 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
theRepresentationItem_Name: TCollection_HAsciiString
theItemDefinedTransformation_Name: TCollection_HAsciiString
hasItemDefinedTransformation_Description: bool
theItemDefinedTransformation_Description: TCollection_HAsciiString
theItemDefinedTransformation_TransformItem1: StepRepr_RepresentationItem
theItemDefinedTransformation_TransformItem2: StepRepr_RepresentationItem
theKinematicPair_Joint: StepKinematics_KinematicJoint
theRadiusFirstLink: double
theRadiusSecondLink: double
theBevel: double
theHelicalAngle: double
theGearRatio: double

Return
-------
None

Description
-----------
Initialize all fields (own and inherited).
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & theRepresentationItem_Name, const opencascade::handle<TCollection_HAsciiString> & theItemDefinedTransformation_Name, const bool hasItemDefinedTransformation_Description, const opencascade::handle<TCollection_HAsciiString> & theItemDefinedTransformation_Description, const opencascade::handle<StepRepr_RepresentationItem> & theItemDefinedTransformation_TransformItem1, const opencascade::handle<StepRepr_RepresentationItem> & theItemDefinedTransformation_TransformItem2, const opencascade::handle<StepKinematics_KinematicJoint> & theKinematicPair_Joint, const double theRadiusFirstLink, const double theRadiusSecondLink, const double theBevel, const double theHelicalAngle, const double theGearRatio);

		/****** StepKinematics_GearPair::RadiusFirstLink ******/
		/****** md5 signature: 4bfc730a854f8775901edc68fa37ef22 ******/
		%feature("compactdefaultargs") RadiusFirstLink;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns field RadiusFirstLink.
") RadiusFirstLink;
		double RadiusFirstLink();

		/****** StepKinematics_GearPair::RadiusSecondLink ******/
		/****** md5 signature: 499e381837a2a0bba2f89f24d6f21d71 ******/
		%feature("compactdefaultargs") RadiusSecondLink;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns field RadiusSecondLink.
") RadiusSecondLink;
		double RadiusSecondLink();

		/****** StepKinematics_GearPair::SetBevel ******/
		/****** md5 signature: 8326b50c5633f17cdcfa2ae5410bfabd ******/
		%feature("compactdefaultargs") SetBevel;
		%feature("autodoc", "
Parameters
----------
theBevel: double

Return
-------
None

Description
-----------
Sets field Bevel.
") SetBevel;
		void SetBevel(const double theBevel);

		/****** StepKinematics_GearPair::SetGearRatio ******/
		/****** md5 signature: 2cb61c2f6c745fd47ce06e91c662ecae ******/
		%feature("compactdefaultargs") SetGearRatio;
		%feature("autodoc", "
Parameters
----------
theGearRatio: double

Return
-------
None

Description
-----------
Sets field GearRatio.
") SetGearRatio;
		void SetGearRatio(const double theGearRatio);

		/****** StepKinematics_GearPair::SetHelicalAngle ******/
		/****** md5 signature: b2b972bd023053b250bdd57f4d6a11a9 ******/
		%feature("compactdefaultargs") SetHelicalAngle;
		%feature("autodoc", "
Parameters
----------
theHelicalAngle: double

Return
-------
None

Description
-----------
Sets field HelicalAngle.
") SetHelicalAngle;
		void SetHelicalAngle(const double theHelicalAngle);

		/****** StepKinematics_GearPair::SetRadiusFirstLink ******/
		/****** md5 signature: f548d942777892c323b36f1683a20cb1 ******/
		%feature("compactdefaultargs") SetRadiusFirstLink;
		%feature("autodoc", "
Parameters
----------
theRadiusFirstLink: double

Return
-------
None

Description
-----------
Sets field RadiusFirstLink.
") SetRadiusFirstLink;
		void SetRadiusFirstLink(const double theRadiusFirstLink);

		/****** StepKinematics_GearPair::SetRadiusSecondLink ******/
		/****** md5 signature: b46624c8ebb84c16b2869ca11490500c ******/
		%feature("compactdefaultargs") SetRadiusSecondLink;
		%feature("autodoc", "
Parameters
----------
theRadiusSecondLink: double

Return
-------
None

Description
-----------
Sets field RadiusSecondLink.
") SetRadiusSecondLink;
		void SetRadiusSecondLink(const double theRadiusSecondLink);

};


%make_alias(StepKinematics_GearPair)

%extend StepKinematics_GearPair {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************************************
* class StepKinematics_LinearFlexibleAndPinionPair *
***************************************************/
class StepKinematics_LinearFlexibleAndPinionPair : public StepKinematics_LowOrderKinematicPairWithMotionCoupling {
	public:
		/****** StepKinematics_LinearFlexibleAndPinionPair::StepKinematics_LinearFlexibleAndPinionPair ******/
		/****** md5 signature: 1099fcbbea711b531d88da059dc05c20 ******/
		%feature("compactdefaultargs") StepKinematics_LinearFlexibleAndPinionPair;
		%feature("autodoc", "Return
-------
None

Description
-----------
default constructor.
") StepKinematics_LinearFlexibleAndPinionPair;
		 StepKinematics_LinearFlexibleAndPinionPair();

		/****** StepKinematics_LinearFlexibleAndPinionPair::Init ******/
		/****** md5 signature: 5a236383dfad252820be39274b56345a ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
theRepresentationItem_Name: TCollection_HAsciiString
theItemDefinedTransformation_Name: TCollection_HAsciiString
hasItemDefinedTransformation_Description: bool
theItemDefinedTransformation_Description: TCollection_HAsciiString
theItemDefinedTransformation_TransformItem1: StepRepr_RepresentationItem
theItemDefinedTransformation_TransformItem2: StepRepr_RepresentationItem
theKinematicPair_Joint: StepKinematics_KinematicJoint
thePinionRadius: double

Return
-------
None

Description
-----------
Initialize all fields (own and inherited).
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & theRepresentationItem_Name, const opencascade::handle<TCollection_HAsciiString> & theItemDefinedTransformation_Name, const bool hasItemDefinedTransformation_Description, const opencascade::handle<TCollection_HAsciiString> & theItemDefinedTransformation_Description, const opencascade::handle<StepRepr_RepresentationItem> & theItemDefinedTransformation_TransformItem1, const opencascade::handle<StepRepr_RepresentationItem> & theItemDefinedTransformation_TransformItem2, const opencascade::handle<StepKinematics_KinematicJoint> & theKinematicPair_Joint, const double thePinionRadius);

		/****** StepKinematics_LinearFlexibleAndPinionPair::PinionRadius ******/
		/****** md5 signature: 550106a6ab8d49ed8d6b5ff01b66cfe9 ******/
		%feature("compactdefaultargs") PinionRadius;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns field PinionRadius.
") PinionRadius;
		double PinionRadius();

		/****** StepKinematics_LinearFlexibleAndPinionPair::SetPinionRadius ******/
		/****** md5 signature: f3285a9eca1831b7581379fa7163d6a5 ******/
		%feature("compactdefaultargs") SetPinionRadius;
		%feature("autodoc", "
Parameters
----------
thePinionRadius: double

Return
-------
None

Description
-----------
Sets field PinionRadius.
") SetPinionRadius;
		void SetPinionRadius(const double thePinionRadius);

};


%make_alias(StepKinematics_LinearFlexibleAndPinionPair)

%extend StepKinematics_LinearFlexibleAndPinionPair {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************************************
* class StepKinematics_LinearFlexibleAndPlanarCurvePair *
********************************************************/
class StepKinematics_LinearFlexibleAndPlanarCurvePair : public StepKinematics_HighOrderKinematicPair {
	public:
		/****** StepKinematics_LinearFlexibleAndPlanarCurvePair::StepKinematics_LinearFlexibleAndPlanarCurvePair ******/
		/****** md5 signature: b69a80332d6d7c80110c0417d7383ad0 ******/
		%feature("compactdefaultargs") StepKinematics_LinearFlexibleAndPlanarCurvePair;
		%feature("autodoc", "Return
-------
None

Description
-----------
default constructor.
") StepKinematics_LinearFlexibleAndPlanarCurvePair;
		 StepKinematics_LinearFlexibleAndPlanarCurvePair();

		/****** StepKinematics_LinearFlexibleAndPlanarCurvePair::Init ******/
		/****** md5 signature: a04b1638460698d82d804670114a14c0 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
theRepresentationItem_Name: TCollection_HAsciiString
theItemDefinedTransformation_Name: TCollection_HAsciiString
hasItemDefinedTransformation_Description: bool
theItemDefinedTransformation_Description: TCollection_HAsciiString
theItemDefinedTransformation_TransformItem1: StepRepr_RepresentationItem
theItemDefinedTransformation_TransformItem2: StepRepr_RepresentationItem
theKinematicPair_Joint: StepKinematics_KinematicJoint
thePairCurve: StepGeom_Curve
theOrientation: bool

Return
-------
None

Description
-----------
Initialize all fields (own and inherited).
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & theRepresentationItem_Name, const opencascade::handle<TCollection_HAsciiString> & theItemDefinedTransformation_Name, const bool hasItemDefinedTransformation_Description, const opencascade::handle<TCollection_HAsciiString> & theItemDefinedTransformation_Description, const opencascade::handle<StepRepr_RepresentationItem> & theItemDefinedTransformation_TransformItem1, const opencascade::handle<StepRepr_RepresentationItem> & theItemDefinedTransformation_TransformItem2, const opencascade::handle<StepKinematics_KinematicJoint> & theKinematicPair_Joint, const opencascade::handle<StepGeom_Curve> & thePairCurve, const bool theOrientation);

		/****** StepKinematics_LinearFlexibleAndPlanarCurvePair::Orientation ******/
		/****** md5 signature: f7c8bc405e9c9ac9fe1f41805829040c ******/
		%feature("compactdefaultargs") Orientation;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns field Orientation.
") Orientation;
		bool Orientation();

		/****** StepKinematics_LinearFlexibleAndPlanarCurvePair::PairCurve ******/
		/****** md5 signature: 134d93ea7dbcb6acd77121e5a0c370cb ******/
		%feature("compactdefaultargs") PairCurve;
		%feature("autodoc", "Return
-------
opencascade::handle<StepGeom_Curve>

Description
-----------
Returns field PairCurve.
") PairCurve;
		opencascade::handle<StepGeom_Curve> PairCurve();

		/****** StepKinematics_LinearFlexibleAndPlanarCurvePair::SetOrientation ******/
		/****** md5 signature: 83f173e1b21848cd0edd6e25cd60b62e ******/
		%feature("compactdefaultargs") SetOrientation;
		%feature("autodoc", "
Parameters
----------
theOrientation: bool

Return
-------
None

Description
-----------
Sets field Orientation.
") SetOrientation;
		void SetOrientation(const bool theOrientation);

		/****** StepKinematics_LinearFlexibleAndPlanarCurvePair::SetPairCurve ******/
		/****** md5 signature: c7703b05cf8a69dded5fc125ad8540a1 ******/
		%feature("compactdefaultargs") SetPairCurve;
		%feature("autodoc", "
Parameters
----------
thePairCurve: StepGeom_Curve

Return
-------
None

Description
-----------
Sets field PairCurve.
") SetPairCurve;
		void SetPairCurve(const opencascade::handle<StepGeom_Curve> & thePairCurve);

};


%make_alias(StepKinematics_LinearFlexibleAndPlanarCurvePair)

%extend StepKinematics_LinearFlexibleAndPlanarCurvePair {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************************************
* class StepKinematics_LowOrderKinematicPairWithRange *
******************************************************/
class StepKinematics_LowOrderKinematicPairWithRange : public StepKinematics_LowOrderKinematicPair {
	public:
		/****** StepKinematics_LowOrderKinematicPairWithRange::StepKinematics_LowOrderKinematicPairWithRange ******/
		/****** md5 signature: 0013f8dc8c45bfa17614515c84cb10d2 ******/
		%feature("compactdefaultargs") StepKinematics_LowOrderKinematicPairWithRange;
		%feature("autodoc", "Return
-------
None

Description
-----------
default constructor.
") StepKinematics_LowOrderKinematicPairWithRange;
		 StepKinematics_LowOrderKinematicPairWithRange();

		/****** StepKinematics_LowOrderKinematicPairWithRange::HasLowerLimitActualRotationX ******/
		/****** md5 signature: b09915520f4721e787047cef6f217290 ******/
		%feature("compactdefaultargs") HasLowerLimitActualRotationX;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if optional field LowerLimitActualRotationX is defined.
") HasLowerLimitActualRotationX;
		bool HasLowerLimitActualRotationX();

		/****** StepKinematics_LowOrderKinematicPairWithRange::HasLowerLimitActualRotationY ******/
		/****** md5 signature: cfc2ea28d32241fc6bf23dca1cb99653 ******/
		%feature("compactdefaultargs") HasLowerLimitActualRotationY;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if optional field LowerLimitActualRotationY is defined.
") HasLowerLimitActualRotationY;
		bool HasLowerLimitActualRotationY();

		/****** StepKinematics_LowOrderKinematicPairWithRange::HasLowerLimitActualRotationZ ******/
		/****** md5 signature: f07ddb20bde96ea84a79d26aff1e112b ******/
		%feature("compactdefaultargs") HasLowerLimitActualRotationZ;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if optional field LowerLimitActualRotationZ is defined.
") HasLowerLimitActualRotationZ;
		bool HasLowerLimitActualRotationZ();

		/****** StepKinematics_LowOrderKinematicPairWithRange::HasLowerLimitActualTranslationX ******/
		/****** md5 signature: 44c6a2431c8b0e6f7c4cc167a839e8f5 ******/
		%feature("compactdefaultargs") HasLowerLimitActualTranslationX;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if optional field LowerLimitActualTranslationX is defined.
") HasLowerLimitActualTranslationX;
		bool HasLowerLimitActualTranslationX();

		/****** StepKinematics_LowOrderKinematicPairWithRange::HasLowerLimitActualTranslationY ******/
		/****** md5 signature: 40ee3e7fe931c67d64787db7e7eca2c6 ******/
		%feature("compactdefaultargs") HasLowerLimitActualTranslationY;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if optional field LowerLimitActualTranslationY is defined.
") HasLowerLimitActualTranslationY;
		bool HasLowerLimitActualTranslationY();

		/****** StepKinematics_LowOrderKinematicPairWithRange::HasLowerLimitActualTranslationZ ******/
		/****** md5 signature: 26f4c618e9e2deadccce363c2cddd4c5 ******/
		%feature("compactdefaultargs") HasLowerLimitActualTranslationZ;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if optional field LowerLimitActualTranslationZ is defined.
") HasLowerLimitActualTranslationZ;
		bool HasLowerLimitActualTranslationZ();

		/****** StepKinematics_LowOrderKinematicPairWithRange::HasUpperLimitActualRotationX ******/
		/****** md5 signature: 4ac9c42645ab9530bf313c9c1bcc1330 ******/
		%feature("compactdefaultargs") HasUpperLimitActualRotationX;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if optional field UpperLimitActualRotationX is defined.
") HasUpperLimitActualRotationX;
		bool HasUpperLimitActualRotationX();

		/****** StepKinematics_LowOrderKinematicPairWithRange::HasUpperLimitActualRotationY ******/
		/****** md5 signature: 6ac87288fec3a985779723949cd49b87 ******/
		%feature("compactdefaultargs") HasUpperLimitActualRotationY;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if optional field UpperLimitActualRotationY is defined.
") HasUpperLimitActualRotationY;
		bool HasUpperLimitActualRotationY();

		/****** StepKinematics_LowOrderKinematicPairWithRange::HasUpperLimitActualRotationZ ******/
		/****** md5 signature: a3d9bb466958e8584bb058cdeff5efb5 ******/
		%feature("compactdefaultargs") HasUpperLimitActualRotationZ;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if optional field UpperLimitActualRotationZ is defined.
") HasUpperLimitActualRotationZ;
		bool HasUpperLimitActualRotationZ();

		/****** StepKinematics_LowOrderKinematicPairWithRange::HasUpperLimitActualTranslationX ******/
		/****** md5 signature: 35fbb83566ac6691f70d253066866aa8 ******/
		%feature("compactdefaultargs") HasUpperLimitActualTranslationX;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if optional field UpperLimitActualTranslationX is defined.
") HasUpperLimitActualTranslationX;
		bool HasUpperLimitActualTranslationX();

		/****** StepKinematics_LowOrderKinematicPairWithRange::HasUpperLimitActualTranslationY ******/
		/****** md5 signature: 4acb9f7eff10d5533fc354a1ab9b31f5 ******/
		%feature("compactdefaultargs") HasUpperLimitActualTranslationY;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if optional field UpperLimitActualTranslationY is defined.
") HasUpperLimitActualTranslationY;
		bool HasUpperLimitActualTranslationY();

		/****** StepKinematics_LowOrderKinematicPairWithRange::HasUpperLimitActualTranslationZ ******/
		/****** md5 signature: e32f390789f72ecfc2159685bd1c58e9 ******/
		%feature("compactdefaultargs") HasUpperLimitActualTranslationZ;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if optional field UpperLimitActualTranslationZ is defined.
") HasUpperLimitActualTranslationZ;
		bool HasUpperLimitActualTranslationZ();

		/****** StepKinematics_LowOrderKinematicPairWithRange::Init ******/
		/****** md5 signature: 5bd089ecc82d3541c01921ecd6a8f725 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
theRepresentationItem_Name: TCollection_HAsciiString
theItemDefinedTransformation_Name: TCollection_HAsciiString
hasItemDefinedTransformation_Description: bool
theItemDefinedTransformation_Description: TCollection_HAsciiString
theItemDefinedTransformation_TransformItem1: StepRepr_RepresentationItem
theItemDefinedTransformation_TransformItem2: StepRepr_RepresentationItem
theKinematicPair_Joint: StepKinematics_KinematicJoint
theLowOrderKinematicPair_TX: bool
theLowOrderKinematicPair_TY: bool
theLowOrderKinematicPair_TZ: bool
theLowOrderKinematicPair_RX: bool
theLowOrderKinematicPair_RY: bool
theLowOrderKinematicPair_RZ: bool
hasLowerLimitActualRotationX: bool
theLowerLimitActualRotationX: double
hasUpperLimitActualRotationX: bool
theUpperLimitActualRotationX: double
hasLowerLimitActualRotationY: bool
theLowerLimitActualRotationY: double
hasUpperLimitActualRotationY: bool
theUpperLimitActualRotationY: double
hasLowerLimitActualRotationZ: bool
theLowerLimitActualRotationZ: double
hasUpperLimitActualRotationZ: bool
theUpperLimitActualRotationZ: double
hasLowerLimitActualTranslationX: bool
theLowerLimitActualTranslationX: double
hasUpperLimitActualTranslationX: bool
theUpperLimitActualTranslationX: double
hasLowerLimitActualTranslationY: bool
theLowerLimitActualTranslationY: double
hasUpperLimitActualTranslationY: bool
theUpperLimitActualTranslationY: double
hasLowerLimitActualTranslationZ: bool
theLowerLimitActualTranslationZ: double
hasUpperLimitActualTranslationZ: bool
theUpperLimitActualTranslationZ: double

Return
-------
None

Description
-----------
Initialize all fields (own and inherited).
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & theRepresentationItem_Name, const opencascade::handle<TCollection_HAsciiString> & theItemDefinedTransformation_Name, const bool hasItemDefinedTransformation_Description, const opencascade::handle<TCollection_HAsciiString> & theItemDefinedTransformation_Description, const opencascade::handle<StepRepr_RepresentationItem> & theItemDefinedTransformation_TransformItem1, const opencascade::handle<StepRepr_RepresentationItem> & theItemDefinedTransformation_TransformItem2, const opencascade::handle<StepKinematics_KinematicJoint> & theKinematicPair_Joint, const bool theLowOrderKinematicPair_TX, const bool theLowOrderKinematicPair_TY, const bool theLowOrderKinematicPair_TZ, const bool theLowOrderKinematicPair_RX, const bool theLowOrderKinematicPair_RY, const bool theLowOrderKinematicPair_RZ, const bool hasLowerLimitActualRotationX, const double theLowerLimitActualRotationX, const bool hasUpperLimitActualRotationX, const double theUpperLimitActualRotationX, const bool hasLowerLimitActualRotationY, const double theLowerLimitActualRotationY, const bool hasUpperLimitActualRotationY, const double theUpperLimitActualRotationY, const bool hasLowerLimitActualRotationZ, const double theLowerLimitActualRotationZ, const bool hasUpperLimitActualRotationZ, const double theUpperLimitActualRotationZ, const bool hasLowerLimitActualTranslationX, const double theLowerLimitActualTranslationX, const bool hasUpperLimitActualTranslationX, const double theUpperLimitActualTranslationX, const bool hasLowerLimitActualTranslationY, const double theLowerLimitActualTranslationY, const bool hasUpperLimitActualTranslationY, const double theUpperLimitActualTranslationY, const bool hasLowerLimitActualTranslationZ, const double theLowerLimitActualTranslationZ, const bool hasUpperLimitActualTranslationZ, const double theUpperLimitActualTranslationZ);

		/****** StepKinematics_LowOrderKinematicPairWithRange::LowerLimitActualRotationX ******/
		/****** md5 signature: fd22d0ca6414bd032fa6e20240cb36da ******/
		%feature("compactdefaultargs") LowerLimitActualRotationX;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns field LowerLimitActualRotationX.
") LowerLimitActualRotationX;
		double LowerLimitActualRotationX();

		/****** StepKinematics_LowOrderKinematicPairWithRange::LowerLimitActualRotationY ******/
		/****** md5 signature: b16b1a42a59a56949d2e558d12f0f2ed ******/
		%feature("compactdefaultargs") LowerLimitActualRotationY;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns field LowerLimitActualRotationY.
") LowerLimitActualRotationY;
		double LowerLimitActualRotationY();

		/****** StepKinematics_LowOrderKinematicPairWithRange::LowerLimitActualRotationZ ******/
		/****** md5 signature: 3bd1909259f0a9d17843714ee6b519ea ******/
		%feature("compactdefaultargs") LowerLimitActualRotationZ;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns field LowerLimitActualRotationZ.
") LowerLimitActualRotationZ;
		double LowerLimitActualRotationZ();

		/****** StepKinematics_LowOrderKinematicPairWithRange::LowerLimitActualTranslationX ******/
		/****** md5 signature: eb3ad8d32d878ee38dbcfea09147b4cd ******/
		%feature("compactdefaultargs") LowerLimitActualTranslationX;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns field LowerLimitActualTranslationX.
") LowerLimitActualTranslationX;
		double LowerLimitActualTranslationX();

		/****** StepKinematics_LowOrderKinematicPairWithRange::LowerLimitActualTranslationY ******/
		/****** md5 signature: 33720fa3c7554285fde0b08a9d724a3f ******/
		%feature("compactdefaultargs") LowerLimitActualTranslationY;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns field LowerLimitActualTranslationY.
") LowerLimitActualTranslationY;
		double LowerLimitActualTranslationY();

		/****** StepKinematics_LowOrderKinematicPairWithRange::LowerLimitActualTranslationZ ******/
		/****** md5 signature: 75542c55601c1fcb971ec03d2e5443d5 ******/
		%feature("compactdefaultargs") LowerLimitActualTranslationZ;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns field LowerLimitActualTranslationZ.
") LowerLimitActualTranslationZ;
		double LowerLimitActualTranslationZ();

		/****** StepKinematics_LowOrderKinematicPairWithRange::SetLowerLimitActualRotationX ******/
		/****** md5 signature: e6fd5c8fe8546356e4733042375b38d4 ******/
		%feature("compactdefaultargs") SetLowerLimitActualRotationX;
		%feature("autodoc", "
Parameters
----------
theLowerLimitActualRotationX: double

Return
-------
None

Description
-----------
Sets field LowerLimitActualRotationX.
") SetLowerLimitActualRotationX;
		void SetLowerLimitActualRotationX(const double theLowerLimitActualRotationX);

		/****** StepKinematics_LowOrderKinematicPairWithRange::SetLowerLimitActualRotationY ******/
		/****** md5 signature: 417603baf644664604a075fd5ece59aa ******/
		%feature("compactdefaultargs") SetLowerLimitActualRotationY;
		%feature("autodoc", "
Parameters
----------
theLowerLimitActualRotationY: double

Return
-------
None

Description
-----------
Sets field LowerLimitActualRotationY.
") SetLowerLimitActualRotationY;
		void SetLowerLimitActualRotationY(const double theLowerLimitActualRotationY);

		/****** StepKinematics_LowOrderKinematicPairWithRange::SetLowerLimitActualRotationZ ******/
		/****** md5 signature: 673c8113a39a01b4417695e34d973578 ******/
		%feature("compactdefaultargs") SetLowerLimitActualRotationZ;
		%feature("autodoc", "
Parameters
----------
theLowerLimitActualRotationZ: double

Return
-------
None

Description
-----------
Sets field LowerLimitActualRotationZ.
") SetLowerLimitActualRotationZ;
		void SetLowerLimitActualRotationZ(const double theLowerLimitActualRotationZ);

		/****** StepKinematics_LowOrderKinematicPairWithRange::SetLowerLimitActualTranslationX ******/
		/****** md5 signature: 8a0c13504786bc731fef6f9c5480fc21 ******/
		%feature("compactdefaultargs") SetLowerLimitActualTranslationX;
		%feature("autodoc", "
Parameters
----------
theLowerLimitActualTranslationX: double

Return
-------
None

Description
-----------
Sets field LowerLimitActualTranslationX.
") SetLowerLimitActualTranslationX;
		void SetLowerLimitActualTranslationX(const double theLowerLimitActualTranslationX);

		/****** StepKinematics_LowOrderKinematicPairWithRange::SetLowerLimitActualTranslationY ******/
		/****** md5 signature: 0691fd67fd3f365501a664e48d0d255c ******/
		%feature("compactdefaultargs") SetLowerLimitActualTranslationY;
		%feature("autodoc", "
Parameters
----------
theLowerLimitActualTranslationY: double

Return
-------
None

Description
-----------
Sets field LowerLimitActualTranslationY.
") SetLowerLimitActualTranslationY;
		void SetLowerLimitActualTranslationY(const double theLowerLimitActualTranslationY);

		/****** StepKinematics_LowOrderKinematicPairWithRange::SetLowerLimitActualTranslationZ ******/
		/****** md5 signature: 4fa59d6496da8fbb334ec3da340bdb87 ******/
		%feature("compactdefaultargs") SetLowerLimitActualTranslationZ;
		%feature("autodoc", "
Parameters
----------
theLowerLimitActualTranslationZ: double

Return
-------
None

Description
-----------
Sets field LowerLimitActualTranslationZ.
") SetLowerLimitActualTranslationZ;
		void SetLowerLimitActualTranslationZ(const double theLowerLimitActualTranslationZ);

		/****** StepKinematics_LowOrderKinematicPairWithRange::SetUpperLimitActualRotationX ******/
		/****** md5 signature: eca7a3b862cc7412b3109e16658e1f02 ******/
		%feature("compactdefaultargs") SetUpperLimitActualRotationX;
		%feature("autodoc", "
Parameters
----------
theUpperLimitActualRotationX: double

Return
-------
None

Description
-----------
Sets field UpperLimitActualRotationX.
") SetUpperLimitActualRotationX;
		void SetUpperLimitActualRotationX(const double theUpperLimitActualRotationX);

		/****** StepKinematics_LowOrderKinematicPairWithRange::SetUpperLimitActualRotationY ******/
		/****** md5 signature: 210cbaab82e717f5628b7cad261ba4ab ******/
		%feature("compactdefaultargs") SetUpperLimitActualRotationY;
		%feature("autodoc", "
Parameters
----------
theUpperLimitActualRotationY: double

Return
-------
None

Description
-----------
Sets field UpperLimitActualRotationY.
") SetUpperLimitActualRotationY;
		void SetUpperLimitActualRotationY(const double theUpperLimitActualRotationY);

		/****** StepKinematics_LowOrderKinematicPairWithRange::SetUpperLimitActualRotationZ ******/
		/****** md5 signature: 52c874efef7b3b89c528da380a10898c ******/
		%feature("compactdefaultargs") SetUpperLimitActualRotationZ;
		%feature("autodoc", "
Parameters
----------
theUpperLimitActualRotationZ: double

Return
-------
None

Description
-----------
Sets field UpperLimitActualRotationZ.
") SetUpperLimitActualRotationZ;
		void SetUpperLimitActualRotationZ(const double theUpperLimitActualRotationZ);

		/****** StepKinematics_LowOrderKinematicPairWithRange::SetUpperLimitActualTranslationX ******/
		/****** md5 signature: efa9028eccc6ecaf8ecbe3166cf0bce0 ******/
		%feature("compactdefaultargs") SetUpperLimitActualTranslationX;
		%feature("autodoc", "
Parameters
----------
theUpperLimitActualTranslationX: double

Return
-------
None

Description
-----------
Sets field UpperLimitActualTranslationX.
") SetUpperLimitActualTranslationX;
		void SetUpperLimitActualTranslationX(const double theUpperLimitActualTranslationX);

		/****** StepKinematics_LowOrderKinematicPairWithRange::SetUpperLimitActualTranslationY ******/
		/****** md5 signature: 2de31ff4c54c58df9674ae443507758a ******/
		%feature("compactdefaultargs") SetUpperLimitActualTranslationY;
		%feature("autodoc", "
Parameters
----------
theUpperLimitActualTranslationY: double

Return
-------
None

Description
-----------
Sets field UpperLimitActualTranslationY.
") SetUpperLimitActualTranslationY;
		void SetUpperLimitActualTranslationY(const double theUpperLimitActualTranslationY);

		/****** StepKinematics_LowOrderKinematicPairWithRange::SetUpperLimitActualTranslationZ ******/
		/****** md5 signature: d1580846697522e467c9ca26bf138cb3 ******/
		%feature("compactdefaultargs") SetUpperLimitActualTranslationZ;
		%feature("autodoc", "
Parameters
----------
theUpperLimitActualTranslationZ: double

Return
-------
None

Description
-----------
Sets field UpperLimitActualTranslationZ.
") SetUpperLimitActualTranslationZ;
		void SetUpperLimitActualTranslationZ(const double theUpperLimitActualTranslationZ);

		/****** StepKinematics_LowOrderKinematicPairWithRange::UpperLimitActualRotationX ******/
		/****** md5 signature: 05115b9eeee3660b018b3726e74f187f ******/
		%feature("compactdefaultargs") UpperLimitActualRotationX;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns field UpperLimitActualRotationX.
") UpperLimitActualRotationX;
		double UpperLimitActualRotationX();

		/****** StepKinematics_LowOrderKinematicPairWithRange::UpperLimitActualRotationY ******/
		/****** md5 signature: e33a788c5acfb0b0227029e9f7bbb77f ******/
		%feature("compactdefaultargs") UpperLimitActualRotationY;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns field UpperLimitActualRotationY.
") UpperLimitActualRotationY;
		double UpperLimitActualRotationY();

		/****** StepKinematics_LowOrderKinematicPairWithRange::UpperLimitActualRotationZ ******/
		/****** md5 signature: 40483d1efd04b662b9070f0cb530db97 ******/
		%feature("compactdefaultargs") UpperLimitActualRotationZ;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns field UpperLimitActualRotationZ.
") UpperLimitActualRotationZ;
		double UpperLimitActualRotationZ();

		/****** StepKinematics_LowOrderKinematicPairWithRange::UpperLimitActualTranslationX ******/
		/****** md5 signature: 2ff564f20c26a3d66364dffc3aa9da01 ******/
		%feature("compactdefaultargs") UpperLimitActualTranslationX;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns field UpperLimitActualTranslationX.
") UpperLimitActualTranslationX;
		double UpperLimitActualTranslationX();

		/****** StepKinematics_LowOrderKinematicPairWithRange::UpperLimitActualTranslationY ******/
		/****** md5 signature: 3efb048838cc6591530c486b4fc396c5 ******/
		%feature("compactdefaultargs") UpperLimitActualTranslationY;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns field UpperLimitActualTranslationY.
") UpperLimitActualTranslationY;
		double UpperLimitActualTranslationY();

		/****** StepKinematics_LowOrderKinematicPairWithRange::UpperLimitActualTranslationZ ******/
		/****** md5 signature: e4e31dc404f03e7bf1b64f8e3c164ebe ******/
		%feature("compactdefaultargs") UpperLimitActualTranslationZ;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns field UpperLimitActualTranslationZ.
") UpperLimitActualTranslationZ;
		double UpperLimitActualTranslationZ();

};


%make_alias(StepKinematics_LowOrderKinematicPairWithRange)

%extend StepKinematics_LowOrderKinematicPairWithRange {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************************
* class StepKinematics_PlanarCurvePair *
***************************************/
class StepKinematics_PlanarCurvePair : public StepKinematics_HighOrderKinematicPair {
	public:
		/****** StepKinematics_PlanarCurvePair::StepKinematics_PlanarCurvePair ******/
		/****** md5 signature: 65145978ad7bd08813095a0177bd47fc ******/
		%feature("compactdefaultargs") StepKinematics_PlanarCurvePair;
		%feature("autodoc", "Return
-------
None

Description
-----------
default constructor.
") StepKinematics_PlanarCurvePair;
		 StepKinematics_PlanarCurvePair();

		/****** StepKinematics_PlanarCurvePair::Curve1 ******/
		/****** md5 signature: 38d9e1830c41d81eb1e78ef0b7b3e832 ******/
		%feature("compactdefaultargs") Curve1;
		%feature("autodoc", "Return
-------
opencascade::handle<StepGeom_Curve>

Description
-----------
Returns field Curve1.
") Curve1;
		opencascade::handle<StepGeom_Curve> Curve1();

		/****** StepKinematics_PlanarCurvePair::Curve2 ******/
		/****** md5 signature: a8948e4ddb10287787277a8a9f46ef89 ******/
		%feature("compactdefaultargs") Curve2;
		%feature("autodoc", "Return
-------
opencascade::handle<StepGeom_Curve>

Description
-----------
Returns field Curve2.
") Curve2;
		opencascade::handle<StepGeom_Curve> Curve2();

		/****** StepKinematics_PlanarCurvePair::Init ******/
		/****** md5 signature: 24ad54e890bab6977c61c16fcce1b123 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
theRepresentationItem_Name: TCollection_HAsciiString
theItemDefinedTransformation_Name: TCollection_HAsciiString
hasItemDefinedTransformation_Description: bool
theItemDefinedTransformation_Description: TCollection_HAsciiString
theItemDefinedTransformation_TransformItem1: StepRepr_RepresentationItem
theItemDefinedTransformation_TransformItem2: StepRepr_RepresentationItem
theKinematicPair_Joint: StepKinematics_KinematicJoint
theCurve1: StepGeom_Curve
theCurve2: StepGeom_Curve
theOrientation: bool

Return
-------
None

Description
-----------
Initialize all fields (own and inherited).
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & theRepresentationItem_Name, const opencascade::handle<TCollection_HAsciiString> & theItemDefinedTransformation_Name, const bool hasItemDefinedTransformation_Description, const opencascade::handle<TCollection_HAsciiString> & theItemDefinedTransformation_Description, const opencascade::handle<StepRepr_RepresentationItem> & theItemDefinedTransformation_TransformItem1, const opencascade::handle<StepRepr_RepresentationItem> & theItemDefinedTransformation_TransformItem2, const opencascade::handle<StepKinematics_KinematicJoint> & theKinematicPair_Joint, const opencascade::handle<StepGeom_Curve> & theCurve1, const opencascade::handle<StepGeom_Curve> & theCurve2, const bool theOrientation);

		/****** StepKinematics_PlanarCurvePair::Orientation ******/
		/****** md5 signature: f7c8bc405e9c9ac9fe1f41805829040c ******/
		%feature("compactdefaultargs") Orientation;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns field Orientation.
") Orientation;
		bool Orientation();

		/****** StepKinematics_PlanarCurvePair::SetCurve1 ******/
		/****** md5 signature: d6f88e0f5ff12b588810345845fa51af ******/
		%feature("compactdefaultargs") SetCurve1;
		%feature("autodoc", "
Parameters
----------
theCurve1: StepGeom_Curve

Return
-------
None

Description
-----------
Sets field Curve1.
") SetCurve1;
		void SetCurve1(const opencascade::handle<StepGeom_Curve> & theCurve1);

		/****** StepKinematics_PlanarCurvePair::SetCurve2 ******/
		/****** md5 signature: 0ff1d3b9924949ecae6fa78678a4a818 ******/
		%feature("compactdefaultargs") SetCurve2;
		%feature("autodoc", "
Parameters
----------
theCurve2: StepGeom_Curve

Return
-------
None

Description
-----------
Sets field Curve2.
") SetCurve2;
		void SetCurve2(const opencascade::handle<StepGeom_Curve> & theCurve2);

		/****** StepKinematics_PlanarCurvePair::SetOrientation ******/
		/****** md5 signature: 83f173e1b21848cd0edd6e25cd60b62e ******/
		%feature("compactdefaultargs") SetOrientation;
		%feature("autodoc", "
Parameters
----------
theOrientation: bool

Return
-------
None

Description
-----------
Sets field Orientation.
") SetOrientation;
		void SetOrientation(const bool theOrientation);

};


%make_alias(StepKinematics_PlanarCurvePair)

%extend StepKinematics_PlanarCurvePair {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************************
* class StepKinematics_PlanarPair *
**********************************/
class StepKinematics_PlanarPair : public StepKinematics_LowOrderKinematicPair {
	public:
		/****** StepKinematics_PlanarPair::StepKinematics_PlanarPair ******/
		/****** md5 signature: c89bac17977c7332317d3635065db327 ******/
		%feature("compactdefaultargs") StepKinematics_PlanarPair;
		%feature("autodoc", "Return
-------
None

Description
-----------
default constructor.
") StepKinematics_PlanarPair;
		 StepKinematics_PlanarPair();

};


%make_alias(StepKinematics_PlanarPair)

%extend StepKinematics_PlanarPair {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************************************
* class StepKinematics_PointOnPlanarCurvePair *
**********************************************/
class StepKinematics_PointOnPlanarCurvePair : public StepKinematics_HighOrderKinematicPair {
	public:
		/****** StepKinematics_PointOnPlanarCurvePair::StepKinematics_PointOnPlanarCurvePair ******/
		/****** md5 signature: 648b3de945568de4382386b002dbb5d4 ******/
		%feature("compactdefaultargs") StepKinematics_PointOnPlanarCurvePair;
		%feature("autodoc", "Return
-------
None

Description
-----------
default constructor.
") StepKinematics_PointOnPlanarCurvePair;
		 StepKinematics_PointOnPlanarCurvePair();

		/****** StepKinematics_PointOnPlanarCurvePair::Init ******/
		/****** md5 signature: a04b1638460698d82d804670114a14c0 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
theRepresentationItem_Name: TCollection_HAsciiString
theItemDefinedTransformation_Name: TCollection_HAsciiString
hasItemDefinedTransformation_Description: bool
theItemDefinedTransformation_Description: TCollection_HAsciiString
theItemDefinedTransformation_TransformItem1: StepRepr_RepresentationItem
theItemDefinedTransformation_TransformItem2: StepRepr_RepresentationItem
theKinematicPair_Joint: StepKinematics_KinematicJoint
thePairCurve: StepGeom_Curve
theOrientation: bool

Return
-------
None

Description
-----------
Initialize all fields (own and inherited).
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & theRepresentationItem_Name, const opencascade::handle<TCollection_HAsciiString> & theItemDefinedTransformation_Name, const bool hasItemDefinedTransformation_Description, const opencascade::handle<TCollection_HAsciiString> & theItemDefinedTransformation_Description, const opencascade::handle<StepRepr_RepresentationItem> & theItemDefinedTransformation_TransformItem1, const opencascade::handle<StepRepr_RepresentationItem> & theItemDefinedTransformation_TransformItem2, const opencascade::handle<StepKinematics_KinematicJoint> & theKinematicPair_Joint, const opencascade::handle<StepGeom_Curve> & thePairCurve, const bool theOrientation);

		/****** StepKinematics_PointOnPlanarCurvePair::Orientation ******/
		/****** md5 signature: f7c8bc405e9c9ac9fe1f41805829040c ******/
		%feature("compactdefaultargs") Orientation;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns field Orientation.
") Orientation;
		bool Orientation();

		/****** StepKinematics_PointOnPlanarCurvePair::PairCurve ******/
		/****** md5 signature: 134d93ea7dbcb6acd77121e5a0c370cb ******/
		%feature("compactdefaultargs") PairCurve;
		%feature("autodoc", "Return
-------
opencascade::handle<StepGeom_Curve>

Description
-----------
Returns field PairCurve.
") PairCurve;
		opencascade::handle<StepGeom_Curve> PairCurve();

		/****** StepKinematics_PointOnPlanarCurvePair::SetOrientation ******/
		/****** md5 signature: 83f173e1b21848cd0edd6e25cd60b62e ******/
		%feature("compactdefaultargs") SetOrientation;
		%feature("autodoc", "
Parameters
----------
theOrientation: bool

Return
-------
None

Description
-----------
Sets field Orientation.
") SetOrientation;
		void SetOrientation(const bool theOrientation);

		/****** StepKinematics_PointOnPlanarCurvePair::SetPairCurve ******/
		/****** md5 signature: c7703b05cf8a69dded5fc125ad8540a1 ******/
		%feature("compactdefaultargs") SetPairCurve;
		%feature("autodoc", "
Parameters
----------
thePairCurve: StepGeom_Curve

Return
-------
None

Description
-----------
Sets field PairCurve.
") SetPairCurve;
		void SetPairCurve(const opencascade::handle<StepGeom_Curve> & thePairCurve);

};


%make_alias(StepKinematics_PointOnPlanarCurvePair)

%extend StepKinematics_PointOnPlanarCurvePair {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************************
* class StepKinematics_PointOnSurfacePair *
******************************************/
class StepKinematics_PointOnSurfacePair : public StepKinematics_HighOrderKinematicPair {
	public:
		/****** StepKinematics_PointOnSurfacePair::StepKinematics_PointOnSurfacePair ******/
		/****** md5 signature: c2937cab5e43c64b73ec2715c09bff1f ******/
		%feature("compactdefaultargs") StepKinematics_PointOnSurfacePair;
		%feature("autodoc", "Return
-------
None

Description
-----------
default constructor.
") StepKinematics_PointOnSurfacePair;
		 StepKinematics_PointOnSurfacePair();

		/****** StepKinematics_PointOnSurfacePair::Init ******/
		/****** md5 signature: f7f25e003e484e8b9973f2259f44599f ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
theRepresentationItem_Name: TCollection_HAsciiString
theItemDefinedTransformation_Name: TCollection_HAsciiString
hasItemDefinedTransformation_Description: bool
theItemDefinedTransformation_Description: TCollection_HAsciiString
theItemDefinedTransformation_TransformItem1: StepRepr_RepresentationItem
theItemDefinedTransformation_TransformItem2: StepRepr_RepresentationItem
theKinematicPair_Joint: StepKinematics_KinematicJoint
thePairSurface: StepGeom_Surface

Return
-------
None

Description
-----------
Initialize all fields (own and inherited).
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & theRepresentationItem_Name, const opencascade::handle<TCollection_HAsciiString> & theItemDefinedTransformation_Name, const bool hasItemDefinedTransformation_Description, const opencascade::handle<TCollection_HAsciiString> & theItemDefinedTransformation_Description, const opencascade::handle<StepRepr_RepresentationItem> & theItemDefinedTransformation_TransformItem1, const opencascade::handle<StepRepr_RepresentationItem> & theItemDefinedTransformation_TransformItem2, const opencascade::handle<StepKinematics_KinematicJoint> & theKinematicPair_Joint, const opencascade::handle<StepGeom_Surface> & thePairSurface);

		/****** StepKinematics_PointOnSurfacePair::PairSurface ******/
		/****** md5 signature: d5f228320e13c1711af3fa6469cac537 ******/
		%feature("compactdefaultargs") PairSurface;
		%feature("autodoc", "Return
-------
opencascade::handle<StepGeom_Surface>

Description
-----------
Returns field PairSurface.
") PairSurface;
		opencascade::handle<StepGeom_Surface> PairSurface();

		/****** StepKinematics_PointOnSurfacePair::SetPairSurface ******/
		/****** md5 signature: a47817da0349e71e900a7e489de4bff0 ******/
		%feature("compactdefaultargs") SetPairSurface;
		%feature("autodoc", "
Parameters
----------
thePairSurface: StepGeom_Surface

Return
-------
None

Description
-----------
Sets field PairSurface.
") SetPairSurface;
		void SetPairSurface(const opencascade::handle<StepGeom_Surface> & thePairSurface);

};


%make_alias(StepKinematics_PointOnSurfacePair)

%extend StepKinematics_PointOnSurfacePair {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************************
* class StepKinematics_PrismaticPair *
*************************************/
class StepKinematics_PrismaticPair : public StepKinematics_LowOrderKinematicPair {
	public:
		/****** StepKinematics_PrismaticPair::StepKinematics_PrismaticPair ******/
		/****** md5 signature: bf49b0edde21b1d4b256c388fd35fdc2 ******/
		%feature("compactdefaultargs") StepKinematics_PrismaticPair;
		%feature("autodoc", "Return
-------
None

Description
-----------
default constructor.
") StepKinematics_PrismaticPair;
		 StepKinematics_PrismaticPair();

};


%make_alias(StepKinematics_PrismaticPair)

%extend StepKinematics_PrismaticPair {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************************
* class StepKinematics_RackAndPinionPair *
*****************************************/
class StepKinematics_RackAndPinionPair : public StepKinematics_LowOrderKinematicPairWithMotionCoupling {
	public:
		/****** StepKinematics_RackAndPinionPair::StepKinematics_RackAndPinionPair ******/
		/****** md5 signature: 96dff766a20efed782c526def0a9406a ******/
		%feature("compactdefaultargs") StepKinematics_RackAndPinionPair;
		%feature("autodoc", "Return
-------
None

Description
-----------
default constructor.
") StepKinematics_RackAndPinionPair;
		 StepKinematics_RackAndPinionPair();

		/****** StepKinematics_RackAndPinionPair::Init ******/
		/****** md5 signature: 5a236383dfad252820be39274b56345a ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
theRepresentationItem_Name: TCollection_HAsciiString
theItemDefinedTransformation_Name: TCollection_HAsciiString
hasItemDefinedTransformation_Description: bool
theItemDefinedTransformation_Description: TCollection_HAsciiString
theItemDefinedTransformation_TransformItem1: StepRepr_RepresentationItem
theItemDefinedTransformation_TransformItem2: StepRepr_RepresentationItem
theKinematicPair_Joint: StepKinematics_KinematicJoint
thePinionRadius: double

Return
-------
None

Description
-----------
Initialize all fields (own and inherited).
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & theRepresentationItem_Name, const opencascade::handle<TCollection_HAsciiString> & theItemDefinedTransformation_Name, const bool hasItemDefinedTransformation_Description, const opencascade::handle<TCollection_HAsciiString> & theItemDefinedTransformation_Description, const opencascade::handle<StepRepr_RepresentationItem> & theItemDefinedTransformation_TransformItem1, const opencascade::handle<StepRepr_RepresentationItem> & theItemDefinedTransformation_TransformItem2, const opencascade::handle<StepKinematics_KinematicJoint> & theKinematicPair_Joint, const double thePinionRadius);

		/****** StepKinematics_RackAndPinionPair::PinionRadius ******/
		/****** md5 signature: 550106a6ab8d49ed8d6b5ff01b66cfe9 ******/
		%feature("compactdefaultargs") PinionRadius;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns field PinionRadius.
") PinionRadius;
		double PinionRadius();

		/****** StepKinematics_RackAndPinionPair::SetPinionRadius ******/
		/****** md5 signature: f3285a9eca1831b7581379fa7163d6a5 ******/
		%feature("compactdefaultargs") SetPinionRadius;
		%feature("autodoc", "
Parameters
----------
thePinionRadius: double

Return
-------
None

Description
-----------
Sets field PinionRadius.
") SetPinionRadius;
		void SetPinionRadius(const double thePinionRadius);

};


%make_alias(StepKinematics_RackAndPinionPair)

%extend StepKinematics_RackAndPinionPair {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************************
* class StepKinematics_RevolutePair *
************************************/
class StepKinematics_RevolutePair : public StepKinematics_LowOrderKinematicPair {
	public:
		/****** StepKinematics_RevolutePair::StepKinematics_RevolutePair ******/
		/****** md5 signature: d2043baef719d258a078cf388dc06c41 ******/
		%feature("compactdefaultargs") StepKinematics_RevolutePair;
		%feature("autodoc", "Return
-------
None

Description
-----------
default constructor.
") StepKinematics_RevolutePair;
		 StepKinematics_RevolutePair();

};


%make_alias(StepKinematics_RevolutePair)

%extend StepKinematics_RevolutePair {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************
* class StepKinematics_ScrewPair *
*********************************/
class StepKinematics_ScrewPair : public StepKinematics_LowOrderKinematicPairWithMotionCoupling {
	public:
		/****** StepKinematics_ScrewPair::StepKinematics_ScrewPair ******/
		/****** md5 signature: 5eca29bef2446692fe681b02a5ac762b ******/
		%feature("compactdefaultargs") StepKinematics_ScrewPair;
		%feature("autodoc", "Return
-------
None

Description
-----------
default constructor.
") StepKinematics_ScrewPair;
		 StepKinematics_ScrewPair();

		/****** StepKinematics_ScrewPair::Init ******/
		/****** md5 signature: e6c60d242b628ae3f25f56cc1c52438d ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
theRepresentationItem_Name: TCollection_HAsciiString
theItemDefinedTransformation_Name: TCollection_HAsciiString
hasItemDefinedTransformation_Description: bool
theItemDefinedTransformation_Description: TCollection_HAsciiString
theItemDefinedTransformation_TransformItem1: StepRepr_RepresentationItem
theItemDefinedTransformation_TransformItem2: StepRepr_RepresentationItem
theKinematicPair_Joint: StepKinematics_KinematicJoint
thePitch: double

Return
-------
None

Description
-----------
Initialize all fields (own and inherited).
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & theRepresentationItem_Name, const opencascade::handle<TCollection_HAsciiString> & theItemDefinedTransformation_Name, const bool hasItemDefinedTransformation_Description, const opencascade::handle<TCollection_HAsciiString> & theItemDefinedTransformation_Description, const opencascade::handle<StepRepr_RepresentationItem> & theItemDefinedTransformation_TransformItem1, const opencascade::handle<StepRepr_RepresentationItem> & theItemDefinedTransformation_TransformItem2, const opencascade::handle<StepKinematics_KinematicJoint> & theKinematicPair_Joint, const double thePitch);

		/****** StepKinematics_ScrewPair::Pitch ******/
		/****** md5 signature: 0021de1ddd2f36404cc1bc602e8a1d97 ******/
		%feature("compactdefaultargs") Pitch;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns field Pitch.
") Pitch;
		double Pitch();

		/****** StepKinematics_ScrewPair::SetPitch ******/
		/****** md5 signature: 7b4b8742dbd8b6a7c2ca6f02224634a7 ******/
		%feature("compactdefaultargs") SetPitch;
		%feature("autodoc", "
Parameters
----------
thePitch: double

Return
-------
None

Description
-----------
Sets field Pitch.
") SetPitch;
		void SetPitch(const double thePitch);

};


%make_alias(StepKinematics_ScrewPair)

%extend StepKinematics_ScrewPair {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************************
* class StepKinematics_SphericalPair *
*************************************/
class StepKinematics_SphericalPair : public StepKinematics_LowOrderKinematicPair {
	public:
		/****** StepKinematics_SphericalPair::StepKinematics_SphericalPair ******/
		/****** md5 signature: 7ca2dd35ff5d5622fa9ef3b067b329e2 ******/
		%feature("compactdefaultargs") StepKinematics_SphericalPair;
		%feature("autodoc", "Return
-------
None

Description
-----------
default constructor.
") StepKinematics_SphericalPair;
		 StepKinematics_SphericalPair();

};


%make_alias(StepKinematics_SphericalPair)

%extend StepKinematics_SphericalPair {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************************
* class StepKinematics_SphericalPairWithPin *
********************************************/
class StepKinematics_SphericalPairWithPin : public StepKinematics_LowOrderKinematicPair {
	public:
		/****** StepKinematics_SphericalPairWithPin::StepKinematics_SphericalPairWithPin ******/
		/****** md5 signature: a7cab104c4c699ef08a600b83df8ec5b ******/
		%feature("compactdefaultargs") StepKinematics_SphericalPairWithPin;
		%feature("autodoc", "Return
-------
None

Description
-----------
default constructor.
") StepKinematics_SphericalPairWithPin;
		 StepKinematics_SphericalPairWithPin();

};


%make_alias(StepKinematics_SphericalPairWithPin)

%extend StepKinematics_SphericalPairWithPin {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************************
* class StepKinematics_SurfacePair *
***********************************/
class StepKinematics_SurfacePair : public StepKinematics_HighOrderKinematicPair {
	public:
		/****** StepKinematics_SurfacePair::StepKinematics_SurfacePair ******/
		/****** md5 signature: dda2d032217f558e69d8e27125ec65dd ******/
		%feature("compactdefaultargs") StepKinematics_SurfacePair;
		%feature("autodoc", "Return
-------
None

Description
-----------
default constructor.
") StepKinematics_SurfacePair;
		 StepKinematics_SurfacePair();

		/****** StepKinematics_SurfacePair::Init ******/
		/****** md5 signature: 8052c38fae76b1d1dee0b3c2982d90d8 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
theRepresentationItem_Name: TCollection_HAsciiString
theItemDefinedTransformation_Name: TCollection_HAsciiString
hasItemDefinedTransformation_Description: bool
theItemDefinedTransformation_Description: TCollection_HAsciiString
theItemDefinedTransformation_TransformItem1: StepRepr_RepresentationItem
theItemDefinedTransformation_TransformItem2: StepRepr_RepresentationItem
theKinematicPair_Joint: StepKinematics_KinematicJoint
theSurface1: StepGeom_Surface
theSurface2: StepGeom_Surface
theOrientation: bool

Return
-------
None

Description
-----------
Initialize all fields (own and inherited).
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & theRepresentationItem_Name, const opencascade::handle<TCollection_HAsciiString> & theItemDefinedTransformation_Name, const bool hasItemDefinedTransformation_Description, const opencascade::handle<TCollection_HAsciiString> & theItemDefinedTransformation_Description, const opencascade::handle<StepRepr_RepresentationItem> & theItemDefinedTransformation_TransformItem1, const opencascade::handle<StepRepr_RepresentationItem> & theItemDefinedTransformation_TransformItem2, const opencascade::handle<StepKinematics_KinematicJoint> & theKinematicPair_Joint, const opencascade::handle<StepGeom_Surface> & theSurface1, const opencascade::handle<StepGeom_Surface> & theSurface2, const bool theOrientation);

		/****** StepKinematics_SurfacePair::Orientation ******/
		/****** md5 signature: f7c8bc405e9c9ac9fe1f41805829040c ******/
		%feature("compactdefaultargs") Orientation;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns field Orientation.
") Orientation;
		bool Orientation();

		/****** StepKinematics_SurfacePair::SetOrientation ******/
		/****** md5 signature: 83f173e1b21848cd0edd6e25cd60b62e ******/
		%feature("compactdefaultargs") SetOrientation;
		%feature("autodoc", "
Parameters
----------
theOrientation: bool

Return
-------
None

Description
-----------
Sets field Orientation.
") SetOrientation;
		void SetOrientation(const bool theOrientation);

		/****** StepKinematics_SurfacePair::SetSurface1 ******/
		/****** md5 signature: 4b6ea8ec750c5606e715c278eba6e37a ******/
		%feature("compactdefaultargs") SetSurface1;
		%feature("autodoc", "
Parameters
----------
theSurface1: StepGeom_Surface

Return
-------
None

Description
-----------
Sets field Surface1.
") SetSurface1;
		void SetSurface1(const opencascade::handle<StepGeom_Surface> & theSurface1);

		/****** StepKinematics_SurfacePair::SetSurface2 ******/
		/****** md5 signature: 9c0cdbddaf7a105c3735365a67eaeb60 ******/
		%feature("compactdefaultargs") SetSurface2;
		%feature("autodoc", "
Parameters
----------
theSurface2: StepGeom_Surface

Return
-------
None

Description
-----------
Sets field Surface2.
") SetSurface2;
		void SetSurface2(const opencascade::handle<StepGeom_Surface> & theSurface2);

		/****** StepKinematics_SurfacePair::Surface1 ******/
		/****** md5 signature: 085bcd9d9bf7a7859676d97c8c5f5b7e ******/
		%feature("compactdefaultargs") Surface1;
		%feature("autodoc", "Return
-------
opencascade::handle<StepGeom_Surface>

Description
-----------
Returns field Surface1.
") Surface1;
		opencascade::handle<StepGeom_Surface> Surface1();

		/****** StepKinematics_SurfacePair::Surface2 ******/
		/****** md5 signature: 8e4a486e06cfb534e305ffc1363fd037 ******/
		%feature("compactdefaultargs") Surface2;
		%feature("autodoc", "Return
-------
opencascade::handle<StepGeom_Surface>

Description
-----------
Returns field Surface2.
") Surface2;
		opencascade::handle<StepGeom_Surface> Surface2();

};


%make_alias(StepKinematics_SurfacePair)

%extend StepKinematics_SurfacePair {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************************
* class StepKinematics_UnconstrainedPair *
*****************************************/
class StepKinematics_UnconstrainedPair : public StepKinematics_LowOrderKinematicPair {
	public:
		/****** StepKinematics_UnconstrainedPair::StepKinematics_UnconstrainedPair ******/
		/****** md5 signature: 6250ea5aca856722814d63563eac80d9 ******/
		%feature("compactdefaultargs") StepKinematics_UnconstrainedPair;
		%feature("autodoc", "Return
-------
None

Description
-----------
default constructor.
") StepKinematics_UnconstrainedPair;
		 StepKinematics_UnconstrainedPair();

};


%make_alias(StepKinematics_UnconstrainedPair)

%extend StepKinematics_UnconstrainedPair {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************************
* class StepKinematics_UniversalPair *
*************************************/
class StepKinematics_UniversalPair : public StepKinematics_LowOrderKinematicPair {
	public:
		/****** StepKinematics_UniversalPair::StepKinematics_UniversalPair ******/
		/****** md5 signature: b721b521bfabf5952406119285b2cbab ******/
		%feature("compactdefaultargs") StepKinematics_UniversalPair;
		%feature("autodoc", "Return
-------
None

Description
-----------
default constructor.
") StepKinematics_UniversalPair;
		 StepKinematics_UniversalPair();

		/****** StepKinematics_UniversalPair::HasInputSkewAngle ******/
		/****** md5 signature: d77a00b847fcd886be1c882fbf220b86 ******/
		%feature("compactdefaultargs") HasInputSkewAngle;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if optional field InputSkewAngle is defined.
") HasInputSkewAngle;
		bool HasInputSkewAngle();

		/****** StepKinematics_UniversalPair::Init ******/
		/****** md5 signature: 980909d253847c0d8a8969569351bba1 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
theRepresentationItem_Name: TCollection_HAsciiString
theItemDefinedTransformation_Name: TCollection_HAsciiString
hasItemDefinedTransformation_Description: bool
theItemDefinedTransformation_Description: TCollection_HAsciiString
theItemDefinedTransformation_TransformItem1: StepRepr_RepresentationItem
theItemDefinedTransformation_TransformItem2: StepRepr_RepresentationItem
theKinematicPair_Joint: StepKinematics_KinematicJoint
theLowOrderKinematicPair_TX: bool
theLowOrderKinematicPair_TY: bool
theLowOrderKinematicPair_TZ: bool
theLowOrderKinematicPair_RX: bool
theLowOrderKinematicPair_RY: bool
theLowOrderKinematicPair_RZ: bool
hasInputSkewAngle: bool
theInputSkewAngle: double

Return
-------
None

Description
-----------
Initialize all fields (own and inherited).
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & theRepresentationItem_Name, const opencascade::handle<TCollection_HAsciiString> & theItemDefinedTransformation_Name, const bool hasItemDefinedTransformation_Description, const opencascade::handle<TCollection_HAsciiString> & theItemDefinedTransformation_Description, const opencascade::handle<StepRepr_RepresentationItem> & theItemDefinedTransformation_TransformItem1, const opencascade::handle<StepRepr_RepresentationItem> & theItemDefinedTransformation_TransformItem2, const opencascade::handle<StepKinematics_KinematicJoint> & theKinematicPair_Joint, const bool theLowOrderKinematicPair_TX, const bool theLowOrderKinematicPair_TY, const bool theLowOrderKinematicPair_TZ, const bool theLowOrderKinematicPair_RX, const bool theLowOrderKinematicPair_RY, const bool theLowOrderKinematicPair_RZ, const bool hasInputSkewAngle, const double theInputSkewAngle);

		/****** StepKinematics_UniversalPair::InputSkewAngle ******/
		/****** md5 signature: 5feab4f21d07d6c9c24f05c3b7d7a618 ******/
		%feature("compactdefaultargs") InputSkewAngle;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns field InputSkewAngle.
") InputSkewAngle;
		double InputSkewAngle();

		/****** StepKinematics_UniversalPair::SetInputSkewAngle ******/
		/****** md5 signature: 1ac8f67c28a5a4fac712baa249e9567c ******/
		%feature("compactdefaultargs") SetInputSkewAngle;
		%feature("autodoc", "
Parameters
----------
theInputSkewAngle: double

Return
-------
None

Description
-----------
Sets field InputSkewAngle.
") SetInputSkewAngle;
		void SetInputSkewAngle(const double theInputSkewAngle);

};


%make_alias(StepKinematics_UniversalPair)

%extend StepKinematics_UniversalPair {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************************************
* class StepKinematics_CylindricalPairWithRange *
************************************************/
class StepKinematics_CylindricalPairWithRange : public StepKinematics_CylindricalPair {
	public:
		/****** StepKinematics_CylindricalPairWithRange::StepKinematics_CylindricalPairWithRange ******/
		/****** md5 signature: b2072c411b39e12c44bfab0020806b6e ******/
		%feature("compactdefaultargs") StepKinematics_CylindricalPairWithRange;
		%feature("autodoc", "Return
-------
None

Description
-----------
default constructor.
") StepKinematics_CylindricalPairWithRange;
		 StepKinematics_CylindricalPairWithRange();

		/****** StepKinematics_CylindricalPairWithRange::HasLowerLimitActualRotation ******/
		/****** md5 signature: 9b40ef4d811e858876d345f940d9308d ******/
		%feature("compactdefaultargs") HasLowerLimitActualRotation;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if optional field LowerLimitActualRotation is defined.
") HasLowerLimitActualRotation;
		bool HasLowerLimitActualRotation();

		/****** StepKinematics_CylindricalPairWithRange::HasLowerLimitActualTranslation ******/
		/****** md5 signature: f8ce097e57b4016e1150c788d801a65e ******/
		%feature("compactdefaultargs") HasLowerLimitActualTranslation;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if optional field LowerLimitActualTranslation is defined.
") HasLowerLimitActualTranslation;
		bool HasLowerLimitActualTranslation();

		/****** StepKinematics_CylindricalPairWithRange::HasUpperLimitActualRotation ******/
		/****** md5 signature: 7517dce8b477eb9f38355f00b58abdf5 ******/
		%feature("compactdefaultargs") HasUpperLimitActualRotation;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if optional field UpperLimitActualRotation is defined.
") HasUpperLimitActualRotation;
		bool HasUpperLimitActualRotation();

		/****** StepKinematics_CylindricalPairWithRange::HasUpperLimitActualTranslation ******/
		/****** md5 signature: 1b551d1aa1bd40ba65c81d394c0f63a3 ******/
		%feature("compactdefaultargs") HasUpperLimitActualTranslation;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if optional field UpperLimitActualTranslation is defined.
") HasUpperLimitActualTranslation;
		bool HasUpperLimitActualTranslation();

		/****** StepKinematics_CylindricalPairWithRange::Init ******/
		/****** md5 signature: 5f04ace48f4ace62b2f7432f2ae337fc ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
theRepresentationItem_Name: TCollection_HAsciiString
theItemDefinedTransformation_Name: TCollection_HAsciiString
hasItemDefinedTransformation_Description: bool
theItemDefinedTransformation_Description: TCollection_HAsciiString
theItemDefinedTransformation_TransformItem1: StepRepr_RepresentationItem
theItemDefinedTransformation_TransformItem2: StepRepr_RepresentationItem
theKinematicPair_Joint: StepKinematics_KinematicJoint
theLowOrderKinematicPair_TX: bool
theLowOrderKinematicPair_TY: bool
theLowOrderKinematicPair_TZ: bool
theLowOrderKinematicPair_RX: bool
theLowOrderKinematicPair_RY: bool
theLowOrderKinematicPair_RZ: bool
hasLowerLimitActualTranslation: bool
theLowerLimitActualTranslation: double
hasUpperLimitActualTranslation: bool
theUpperLimitActualTranslation: double
hasLowerLimitActualRotation: bool
theLowerLimitActualRotation: double
hasUpperLimitActualRotation: bool
theUpperLimitActualRotation: double

Return
-------
None

Description
-----------
Initialize all fields (own and inherited).
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & theRepresentationItem_Name, const opencascade::handle<TCollection_HAsciiString> & theItemDefinedTransformation_Name, const bool hasItemDefinedTransformation_Description, const opencascade::handle<TCollection_HAsciiString> & theItemDefinedTransformation_Description, const opencascade::handle<StepRepr_RepresentationItem> & theItemDefinedTransformation_TransformItem1, const opencascade::handle<StepRepr_RepresentationItem> & theItemDefinedTransformation_TransformItem2, const opencascade::handle<StepKinematics_KinematicJoint> & theKinematicPair_Joint, const bool theLowOrderKinematicPair_TX, const bool theLowOrderKinematicPair_TY, const bool theLowOrderKinematicPair_TZ, const bool theLowOrderKinematicPair_RX, const bool theLowOrderKinematicPair_RY, const bool theLowOrderKinematicPair_RZ, const bool hasLowerLimitActualTranslation, const double theLowerLimitActualTranslation, const bool hasUpperLimitActualTranslation, const double theUpperLimitActualTranslation, const bool hasLowerLimitActualRotation, const double theLowerLimitActualRotation, const bool hasUpperLimitActualRotation, const double theUpperLimitActualRotation);

		/****** StepKinematics_CylindricalPairWithRange::LowerLimitActualRotation ******/
		/****** md5 signature: 750f030b56d0246174629d8de2795657 ******/
		%feature("compactdefaultargs") LowerLimitActualRotation;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns field LowerLimitActualRotation.
") LowerLimitActualRotation;
		double LowerLimitActualRotation();

		/****** StepKinematics_CylindricalPairWithRange::LowerLimitActualTranslation ******/
		/****** md5 signature: 861526b9c684a27676c3aa72c1fd4e90 ******/
		%feature("compactdefaultargs") LowerLimitActualTranslation;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns field LowerLimitActualTranslation.
") LowerLimitActualTranslation;
		double LowerLimitActualTranslation();

		/****** StepKinematics_CylindricalPairWithRange::SetLowerLimitActualRotation ******/
		/****** md5 signature: 70f1515555184a7396c24823a25ea752 ******/
		%feature("compactdefaultargs") SetLowerLimitActualRotation;
		%feature("autodoc", "
Parameters
----------
theLowerLimitActualRotation: double

Return
-------
None

Description
-----------
Sets field LowerLimitActualRotation.
") SetLowerLimitActualRotation;
		void SetLowerLimitActualRotation(const double theLowerLimitActualRotation);

		/****** StepKinematics_CylindricalPairWithRange::SetLowerLimitActualTranslation ******/
		/****** md5 signature: 829940fae49f1c2a1df6726c6259fd5c ******/
		%feature("compactdefaultargs") SetLowerLimitActualTranslation;
		%feature("autodoc", "
Parameters
----------
theLowerLimitActualTranslation: double

Return
-------
None

Description
-----------
Sets field LowerLimitActualTranslation.
") SetLowerLimitActualTranslation;
		void SetLowerLimitActualTranslation(const double theLowerLimitActualTranslation);

		/****** StepKinematics_CylindricalPairWithRange::SetUpperLimitActualRotation ******/
		/****** md5 signature: 14bfde518bb812ed770905cb2005aba3 ******/
		%feature("compactdefaultargs") SetUpperLimitActualRotation;
		%feature("autodoc", "
Parameters
----------
theUpperLimitActualRotation: double

Return
-------
None

Description
-----------
Sets field UpperLimitActualRotation.
") SetUpperLimitActualRotation;
		void SetUpperLimitActualRotation(const double theUpperLimitActualRotation);

		/****** StepKinematics_CylindricalPairWithRange::SetUpperLimitActualTranslation ******/
		/****** md5 signature: ccff13f29abf96c5b9d3b62c0b5a42a4 ******/
		%feature("compactdefaultargs") SetUpperLimitActualTranslation;
		%feature("autodoc", "
Parameters
----------
theUpperLimitActualTranslation: double

Return
-------
None

Description
-----------
Sets field UpperLimitActualTranslation.
") SetUpperLimitActualTranslation;
		void SetUpperLimitActualTranslation(const double theUpperLimitActualTranslation);

		/****** StepKinematics_CylindricalPairWithRange::UpperLimitActualRotation ******/
		/****** md5 signature: 0110541df2ed6cb73390dbd871578ac5 ******/
		%feature("compactdefaultargs") UpperLimitActualRotation;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns field UpperLimitActualRotation.
") UpperLimitActualRotation;
		double UpperLimitActualRotation();

		/****** StepKinematics_CylindricalPairWithRange::UpperLimitActualTranslation ******/
		/****** md5 signature: 6cf51e7de416661f4cbd1795b697f8c1 ******/
		%feature("compactdefaultargs") UpperLimitActualTranslation;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns field UpperLimitActualTranslation.
") UpperLimitActualTranslation;
		double UpperLimitActualTranslation();

};


%make_alias(StepKinematics_CylindricalPairWithRange)

%extend StepKinematics_CylindricalPairWithRange {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************************
* class StepKinematics_GearPairWithRange *
*****************************************/
class StepKinematics_GearPairWithRange : public StepKinematics_GearPair {
	public:
		/****** StepKinematics_GearPairWithRange::StepKinematics_GearPairWithRange ******/
		/****** md5 signature: b8ca85501e50200b044abe88208b3e6e ******/
		%feature("compactdefaultargs") StepKinematics_GearPairWithRange;
		%feature("autodoc", "Return
-------
None

Description
-----------
default constructor.
") StepKinematics_GearPairWithRange;
		 StepKinematics_GearPairWithRange();

		/****** StepKinematics_GearPairWithRange::HasLowerLimitActualRotation1 ******/
		/****** md5 signature: 308f2c1f6fee93a420c404a27634e1e9 ******/
		%feature("compactdefaultargs") HasLowerLimitActualRotation1;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if optional field LowerLimitActualRotation1 is defined.
") HasLowerLimitActualRotation1;
		bool HasLowerLimitActualRotation1();

		/****** StepKinematics_GearPairWithRange::HasUpperLimitActualRotation1 ******/
		/****** md5 signature: 6c1dcd707f898e249230c30de8066399 ******/
		%feature("compactdefaultargs") HasUpperLimitActualRotation1;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if optional field UpperLimitActualRotation1 is defined.
") HasUpperLimitActualRotation1;
		bool HasUpperLimitActualRotation1();

		/****** StepKinematics_GearPairWithRange::Init ******/
		/****** md5 signature: b32706342c9029270e478d7a3451e08d ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
theRepresentationItem_Name: TCollection_HAsciiString
theItemDefinedTransformation_Name: TCollection_HAsciiString
hasItemDefinedTransformation_Description: bool
theItemDefinedTransformation_Description: TCollection_HAsciiString
theItemDefinedTransformation_TransformItem1: StepRepr_RepresentationItem
theItemDefinedTransformation_TransformItem2: StepRepr_RepresentationItem
theKinematicPair_Joint: StepKinematics_KinematicJoint
theGearPair_RadiusFirstLink: double
theGearPair_RadiusSecondLink: double
theGearPair_Bevel: double
theGearPair_HelicalAngle: double
theGearPair_GearRatio: double
hasLowerLimitActualRotation1: bool
theLowerLimitActualRotation1: double
hasUpperLimitActualRotation1: bool
theUpperLimitActualRotation1: double

Return
-------
None

Description
-----------
Initialize all fields (own and inherited).
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & theRepresentationItem_Name, const opencascade::handle<TCollection_HAsciiString> & theItemDefinedTransformation_Name, const bool hasItemDefinedTransformation_Description, const opencascade::handle<TCollection_HAsciiString> & theItemDefinedTransformation_Description, const opencascade::handle<StepRepr_RepresentationItem> & theItemDefinedTransformation_TransformItem1, const opencascade::handle<StepRepr_RepresentationItem> & theItemDefinedTransformation_TransformItem2, const opencascade::handle<StepKinematics_KinematicJoint> & theKinematicPair_Joint, const double theGearPair_RadiusFirstLink, const double theGearPair_RadiusSecondLink, const double theGearPair_Bevel, const double theGearPair_HelicalAngle, const double theGearPair_GearRatio, const bool hasLowerLimitActualRotation1, const double theLowerLimitActualRotation1, const bool hasUpperLimitActualRotation1, const double theUpperLimitActualRotation1);

		/****** StepKinematics_GearPairWithRange::LowerLimitActualRotation1 ******/
		/****** md5 signature: a7fc26c6efdcfcb384cf442824fcd1c9 ******/
		%feature("compactdefaultargs") LowerLimitActualRotation1;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns field LowerLimitActualRotation1.
") LowerLimitActualRotation1;
		double LowerLimitActualRotation1();

		/****** StepKinematics_GearPairWithRange::SetLowerLimitActualRotation1 ******/
		/****** md5 signature: a58a2ddf6c08776e8d253fea5d8f7eb5 ******/
		%feature("compactdefaultargs") SetLowerLimitActualRotation1;
		%feature("autodoc", "
Parameters
----------
theLowerLimitActualRotation1: double

Return
-------
None

Description
-----------
Sets field LowerLimitActualRotation1.
") SetLowerLimitActualRotation1;
		void SetLowerLimitActualRotation1(const double theLowerLimitActualRotation1);

		/****** StepKinematics_GearPairWithRange::SetUpperLimitActualRotation1 ******/
		/****** md5 signature: 9d39988985e750913c6ef7f7a3251846 ******/
		%feature("compactdefaultargs") SetUpperLimitActualRotation1;
		%feature("autodoc", "
Parameters
----------
theUpperLimitActualRotation1: double

Return
-------
None

Description
-----------
Sets field UpperLimitActualRotation1.
") SetUpperLimitActualRotation1;
		void SetUpperLimitActualRotation1(const double theUpperLimitActualRotation1);

		/****** StepKinematics_GearPairWithRange::UpperLimitActualRotation1 ******/
		/****** md5 signature: 99f7d8694ed82f8faacd14d87b3be4f6 ******/
		%feature("compactdefaultargs") UpperLimitActualRotation1;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns field UpperLimitActualRotation1.
") UpperLimitActualRotation1;
		double UpperLimitActualRotation1();

};


%make_alias(StepKinematics_GearPairWithRange)

%extend StepKinematics_GearPairWithRange {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************************
* class StepKinematics_HomokineticPair *
***************************************/
class StepKinematics_HomokineticPair : public StepKinematics_UniversalPair {
	public:
		/****** StepKinematics_HomokineticPair::StepKinematics_HomokineticPair ******/
		/****** md5 signature: de886b3e3c83e2a375f571b3bb4b740d ******/
		%feature("compactdefaultargs") StepKinematics_HomokineticPair;
		%feature("autodoc", "Return
-------
None

Description
-----------
default constructor.
") StepKinematics_HomokineticPair;
		 StepKinematics_HomokineticPair();

};


%make_alias(StepKinematics_HomokineticPair)

%extend StepKinematics_HomokineticPair {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************************
* class StepKinematics_PlanarCurvePairRange *
********************************************/
class StepKinematics_PlanarCurvePairRange : public StepKinematics_PlanarCurvePair {
	public:
		/****** StepKinematics_PlanarCurvePairRange::StepKinematics_PlanarCurvePairRange ******/
		/****** md5 signature: 9ed28cbd153b2b6cac384fc946944650 ******/
		%feature("compactdefaultargs") StepKinematics_PlanarCurvePairRange;
		%feature("autodoc", "Return
-------
None

Description
-----------
default constructor.
") StepKinematics_PlanarCurvePairRange;
		 StepKinematics_PlanarCurvePairRange();

		/****** StepKinematics_PlanarCurvePairRange::Init ******/
		/****** md5 signature: e4d252c6da6d6bea557acc5cb772bec6 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
theRepresentationItem_Name: TCollection_HAsciiString
theItemDefinedTransformation_Name: TCollection_HAsciiString
hasItemDefinedTransformation_Description: bool
theItemDefinedTransformation_Description: TCollection_HAsciiString
theItemDefinedTransformation_TransformItem1: StepRepr_RepresentationItem
theItemDefinedTransformation_TransformItem2: StepRepr_RepresentationItem
theKinematicPair_Joint: StepKinematics_KinematicJoint
thePlanarCurvePair_Curve1: StepGeom_Curve
thePlanarCurvePair_Curve2: StepGeom_Curve
thePlanarCurvePair_Orientation: bool
theRangeOnCurve1: StepGeom_TrimmedCurve
theRangeOnCurve2: StepGeom_TrimmedCurve

Return
-------
None

Description
-----------
Initialize all fields (own and inherited).
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & theRepresentationItem_Name, const opencascade::handle<TCollection_HAsciiString> & theItemDefinedTransformation_Name, const bool hasItemDefinedTransformation_Description, const opencascade::handle<TCollection_HAsciiString> & theItemDefinedTransformation_Description, const opencascade::handle<StepRepr_RepresentationItem> & theItemDefinedTransformation_TransformItem1, const opencascade::handle<StepRepr_RepresentationItem> & theItemDefinedTransformation_TransformItem2, const opencascade::handle<StepKinematics_KinematicJoint> & theKinematicPair_Joint, const opencascade::handle<StepGeom_Curve> & thePlanarCurvePair_Curve1, const opencascade::handle<StepGeom_Curve> & thePlanarCurvePair_Curve2, const bool thePlanarCurvePair_Orientation, const opencascade::handle<StepGeom_TrimmedCurve> & theRangeOnCurve1, const opencascade::handle<StepGeom_TrimmedCurve> & theRangeOnCurve2);

		/****** StepKinematics_PlanarCurvePairRange::RangeOnCurve1 ******/
		/****** md5 signature: 9792fa718ce95e0bfd0ea2b5210c43b1 ******/
		%feature("compactdefaultargs") RangeOnCurve1;
		%feature("autodoc", "Return
-------
opencascade::handle<StepGeom_TrimmedCurve>

Description
-----------
Returns field RangeOnCurve1.
") RangeOnCurve1;
		opencascade::handle<StepGeom_TrimmedCurve> RangeOnCurve1();

		/****** StepKinematics_PlanarCurvePairRange::RangeOnCurve2 ******/
		/****** md5 signature: e149e336fe5e988f4a81cb242edbfe56 ******/
		%feature("compactdefaultargs") RangeOnCurve2;
		%feature("autodoc", "Return
-------
opencascade::handle<StepGeom_TrimmedCurve>

Description
-----------
Returns field RangeOnCurve2.
") RangeOnCurve2;
		opencascade::handle<StepGeom_TrimmedCurve> RangeOnCurve2();

		/****** StepKinematics_PlanarCurvePairRange::SetRangeOnCurve1 ******/
		/****** md5 signature: 7032e25a0beee288af676a0f95b9cb76 ******/
		%feature("compactdefaultargs") SetRangeOnCurve1;
		%feature("autodoc", "
Parameters
----------
theRangeOnCurve1: StepGeom_TrimmedCurve

Return
-------
None

Description
-----------
Sets field RangeOnCurve1.
") SetRangeOnCurve1;
		void SetRangeOnCurve1(const opencascade::handle<StepGeom_TrimmedCurve> & theRangeOnCurve1);

		/****** StepKinematics_PlanarCurvePairRange::SetRangeOnCurve2 ******/
		/****** md5 signature: 1b017ea1339dbe6dce07b308b47d7135 ******/
		%feature("compactdefaultargs") SetRangeOnCurve2;
		%feature("autodoc", "
Parameters
----------
theRangeOnCurve2: StepGeom_TrimmedCurve

Return
-------
None

Description
-----------
Sets field RangeOnCurve2.
") SetRangeOnCurve2;
		void SetRangeOnCurve2(const opencascade::handle<StepGeom_TrimmedCurve> & theRangeOnCurve2);

};


%make_alias(StepKinematics_PlanarCurvePairRange)

%extend StepKinematics_PlanarCurvePairRange {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************************
* class StepKinematics_PlanarPairWithRange *
*******************************************/
class StepKinematics_PlanarPairWithRange : public StepKinematics_PlanarPair {
	public:
		/****** StepKinematics_PlanarPairWithRange::StepKinematics_PlanarPairWithRange ******/
		/****** md5 signature: f0d9be447b07d79266de32589079c79d ******/
		%feature("compactdefaultargs") StepKinematics_PlanarPairWithRange;
		%feature("autodoc", "Return
-------
None

Description
-----------
default constructor.
") StepKinematics_PlanarPairWithRange;
		 StepKinematics_PlanarPairWithRange();

		/****** StepKinematics_PlanarPairWithRange::HasLowerLimitActualRotation ******/
		/****** md5 signature: 9b40ef4d811e858876d345f940d9308d ******/
		%feature("compactdefaultargs") HasLowerLimitActualRotation;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if optional field LowerLimitActualRotation is defined.
") HasLowerLimitActualRotation;
		bool HasLowerLimitActualRotation();

		/****** StepKinematics_PlanarPairWithRange::HasLowerLimitActualTranslationX ******/
		/****** md5 signature: 44c6a2431c8b0e6f7c4cc167a839e8f5 ******/
		%feature("compactdefaultargs") HasLowerLimitActualTranslationX;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if optional field LowerLimitActualTranslationX is defined.
") HasLowerLimitActualTranslationX;
		bool HasLowerLimitActualTranslationX();

		/****** StepKinematics_PlanarPairWithRange::HasLowerLimitActualTranslationY ******/
		/****** md5 signature: 40ee3e7fe931c67d64787db7e7eca2c6 ******/
		%feature("compactdefaultargs") HasLowerLimitActualTranslationY;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if optional field LowerLimitActualTranslationY is defined.
") HasLowerLimitActualTranslationY;
		bool HasLowerLimitActualTranslationY();

		/****** StepKinematics_PlanarPairWithRange::HasUpperLimitActualRotation ******/
		/****** md5 signature: 7517dce8b477eb9f38355f00b58abdf5 ******/
		%feature("compactdefaultargs") HasUpperLimitActualRotation;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if optional field UpperLimitActualRotation is defined.
") HasUpperLimitActualRotation;
		bool HasUpperLimitActualRotation();

		/****** StepKinematics_PlanarPairWithRange::HasUpperLimitActualTranslationX ******/
		/****** md5 signature: 35fbb83566ac6691f70d253066866aa8 ******/
		%feature("compactdefaultargs") HasUpperLimitActualTranslationX;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if optional field UpperLimitActualTranslationX is defined.
") HasUpperLimitActualTranslationX;
		bool HasUpperLimitActualTranslationX();

		/****** StepKinematics_PlanarPairWithRange::HasUpperLimitActualTranslationY ******/
		/****** md5 signature: 4acb9f7eff10d5533fc354a1ab9b31f5 ******/
		%feature("compactdefaultargs") HasUpperLimitActualTranslationY;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if optional field UpperLimitActualTranslationY is defined.
") HasUpperLimitActualTranslationY;
		bool HasUpperLimitActualTranslationY();

		/****** StepKinematics_PlanarPairWithRange::Init ******/
		/****** md5 signature: 8f92190da3b7461460d6de0ffab3805e ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
theRepresentationItem_Name: TCollection_HAsciiString
theItemDefinedTransformation_Name: TCollection_HAsciiString
hasItemDefinedTransformation_Description: bool
theItemDefinedTransformation_Description: TCollection_HAsciiString
theItemDefinedTransformation_TransformItem1: StepRepr_RepresentationItem
theItemDefinedTransformation_TransformItem2: StepRepr_RepresentationItem
theKinematicPair_Joint: StepKinematics_KinematicJoint
theLowOrderKinematicPair_TX: bool
theLowOrderKinematicPair_TY: bool
theLowOrderKinematicPair_TZ: bool
theLowOrderKinematicPair_RX: bool
theLowOrderKinematicPair_RY: bool
theLowOrderKinematicPair_RZ: bool
hasLowerLimitActualRotation: bool
theLowerLimitActualRotation: double
hasUpperLimitActualRotation: bool
theUpperLimitActualRotation: double
hasLowerLimitActualTranslationX: bool
theLowerLimitActualTranslationX: double
hasUpperLimitActualTranslationX: bool
theUpperLimitActualTranslationX: double
hasLowerLimitActualTranslationY: bool
theLowerLimitActualTranslationY: double
hasUpperLimitActualTranslationY: bool
theUpperLimitActualTranslationY: double

Return
-------
None

Description
-----------
Initialize all fields (own and inherited).
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & theRepresentationItem_Name, const opencascade::handle<TCollection_HAsciiString> & theItemDefinedTransformation_Name, const bool hasItemDefinedTransformation_Description, const opencascade::handle<TCollection_HAsciiString> & theItemDefinedTransformation_Description, const opencascade::handle<StepRepr_RepresentationItem> & theItemDefinedTransformation_TransformItem1, const opencascade::handle<StepRepr_RepresentationItem> & theItemDefinedTransformation_TransformItem2, const opencascade::handle<StepKinematics_KinematicJoint> & theKinematicPair_Joint, const bool theLowOrderKinematicPair_TX, const bool theLowOrderKinematicPair_TY, const bool theLowOrderKinematicPair_TZ, const bool theLowOrderKinematicPair_RX, const bool theLowOrderKinematicPair_RY, const bool theLowOrderKinematicPair_RZ, const bool hasLowerLimitActualRotation, const double theLowerLimitActualRotation, const bool hasUpperLimitActualRotation, const double theUpperLimitActualRotation, const bool hasLowerLimitActualTranslationX, const double theLowerLimitActualTranslationX, const bool hasUpperLimitActualTranslationX, const double theUpperLimitActualTranslationX, const bool hasLowerLimitActualTranslationY, const double theLowerLimitActualTranslationY, const bool hasUpperLimitActualTranslationY, const double theUpperLimitActualTranslationY);

		/****** StepKinematics_PlanarPairWithRange::LowerLimitActualRotation ******/
		/****** md5 signature: 750f030b56d0246174629d8de2795657 ******/
		%feature("compactdefaultargs") LowerLimitActualRotation;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns field LowerLimitActualRotation.
") LowerLimitActualRotation;
		double LowerLimitActualRotation();

		/****** StepKinematics_PlanarPairWithRange::LowerLimitActualTranslationX ******/
		/****** md5 signature: eb3ad8d32d878ee38dbcfea09147b4cd ******/
		%feature("compactdefaultargs") LowerLimitActualTranslationX;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns field LowerLimitActualTranslationX.
") LowerLimitActualTranslationX;
		double LowerLimitActualTranslationX();

		/****** StepKinematics_PlanarPairWithRange::LowerLimitActualTranslationY ******/
		/****** md5 signature: 33720fa3c7554285fde0b08a9d724a3f ******/
		%feature("compactdefaultargs") LowerLimitActualTranslationY;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns field LowerLimitActualTranslationY.
") LowerLimitActualTranslationY;
		double LowerLimitActualTranslationY();

		/****** StepKinematics_PlanarPairWithRange::SetLowerLimitActualRotation ******/
		/****** md5 signature: 70f1515555184a7396c24823a25ea752 ******/
		%feature("compactdefaultargs") SetLowerLimitActualRotation;
		%feature("autodoc", "
Parameters
----------
theLowerLimitActualRotation: double

Return
-------
None

Description
-----------
Sets field LowerLimitActualRotation.
") SetLowerLimitActualRotation;
		void SetLowerLimitActualRotation(const double theLowerLimitActualRotation);

		/****** StepKinematics_PlanarPairWithRange::SetLowerLimitActualTranslationX ******/
		/****** md5 signature: 8a0c13504786bc731fef6f9c5480fc21 ******/
		%feature("compactdefaultargs") SetLowerLimitActualTranslationX;
		%feature("autodoc", "
Parameters
----------
theLowerLimitActualTranslationX: double

Return
-------
None

Description
-----------
Sets field LowerLimitActualTranslationX.
") SetLowerLimitActualTranslationX;
		void SetLowerLimitActualTranslationX(const double theLowerLimitActualTranslationX);

		/****** StepKinematics_PlanarPairWithRange::SetLowerLimitActualTranslationY ******/
		/****** md5 signature: 0691fd67fd3f365501a664e48d0d255c ******/
		%feature("compactdefaultargs") SetLowerLimitActualTranslationY;
		%feature("autodoc", "
Parameters
----------
theLowerLimitActualTranslationY: double

Return
-------
None

Description
-----------
Sets field LowerLimitActualTranslationY.
") SetLowerLimitActualTranslationY;
		void SetLowerLimitActualTranslationY(const double theLowerLimitActualTranslationY);

		/****** StepKinematics_PlanarPairWithRange::SetUpperLimitActualRotation ******/
		/****** md5 signature: 14bfde518bb812ed770905cb2005aba3 ******/
		%feature("compactdefaultargs") SetUpperLimitActualRotation;
		%feature("autodoc", "
Parameters
----------
theUpperLimitActualRotation: double

Return
-------
None

Description
-----------
Sets field UpperLimitActualRotation.
") SetUpperLimitActualRotation;
		void SetUpperLimitActualRotation(const double theUpperLimitActualRotation);

		/****** StepKinematics_PlanarPairWithRange::SetUpperLimitActualTranslationX ******/
		/****** md5 signature: efa9028eccc6ecaf8ecbe3166cf0bce0 ******/
		%feature("compactdefaultargs") SetUpperLimitActualTranslationX;
		%feature("autodoc", "
Parameters
----------
theUpperLimitActualTranslationX: double

Return
-------
None

Description
-----------
Sets field UpperLimitActualTranslationX.
") SetUpperLimitActualTranslationX;
		void SetUpperLimitActualTranslationX(const double theUpperLimitActualTranslationX);

		/****** StepKinematics_PlanarPairWithRange::SetUpperLimitActualTranslationY ******/
		/****** md5 signature: 2de31ff4c54c58df9674ae443507758a ******/
		%feature("compactdefaultargs") SetUpperLimitActualTranslationY;
		%feature("autodoc", "
Parameters
----------
theUpperLimitActualTranslationY: double

Return
-------
None

Description
-----------
Sets field UpperLimitActualTranslationY.
") SetUpperLimitActualTranslationY;
		void SetUpperLimitActualTranslationY(const double theUpperLimitActualTranslationY);

		/****** StepKinematics_PlanarPairWithRange::UpperLimitActualRotation ******/
		/****** md5 signature: 0110541df2ed6cb73390dbd871578ac5 ******/
		%feature("compactdefaultargs") UpperLimitActualRotation;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns field UpperLimitActualRotation.
") UpperLimitActualRotation;
		double UpperLimitActualRotation();

		/****** StepKinematics_PlanarPairWithRange::UpperLimitActualTranslationX ******/
		/****** md5 signature: 2ff564f20c26a3d66364dffc3aa9da01 ******/
		%feature("compactdefaultargs") UpperLimitActualTranslationX;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns field UpperLimitActualTranslationX.
") UpperLimitActualTranslationX;
		double UpperLimitActualTranslationX();

		/****** StepKinematics_PlanarPairWithRange::UpperLimitActualTranslationY ******/
		/****** md5 signature: 3efb048838cc6591530c486b4fc396c5 ******/
		%feature("compactdefaultargs") UpperLimitActualTranslationY;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns field UpperLimitActualTranslationY.
") UpperLimitActualTranslationY;
		double UpperLimitActualTranslationY();

};


%make_alias(StepKinematics_PlanarPairWithRange)

%extend StepKinematics_PlanarPairWithRange {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************************************
* class StepKinematics_PointOnPlanarCurvePairWithRange *
*******************************************************/
class StepKinematics_PointOnPlanarCurvePairWithRange : public StepKinematics_PointOnPlanarCurvePair {
	public:
		/****** StepKinematics_PointOnPlanarCurvePairWithRange::StepKinematics_PointOnPlanarCurvePairWithRange ******/
		/****** md5 signature: 5ae469bca06f4020a795d2eccc768e87 ******/
		%feature("compactdefaultargs") StepKinematics_PointOnPlanarCurvePairWithRange;
		%feature("autodoc", "Return
-------
None

Description
-----------
default constructor.
") StepKinematics_PointOnPlanarCurvePairWithRange;
		 StepKinematics_PointOnPlanarCurvePairWithRange();

		/****** StepKinematics_PointOnPlanarCurvePairWithRange::HasLowerLimitPitch ******/
		/****** md5 signature: 6d43ed7cbc282f1f36e1abcceac8b9a3 ******/
		%feature("compactdefaultargs") HasLowerLimitPitch;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if optional field LowerLimitPitch is defined.
") HasLowerLimitPitch;
		bool HasLowerLimitPitch();

		/****** StepKinematics_PointOnPlanarCurvePairWithRange::HasLowerLimitRoll ******/
		/****** md5 signature: ca5faa9822f310a70436e725fc12a0f3 ******/
		%feature("compactdefaultargs") HasLowerLimitRoll;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if optional field LowerLimitRoll is defined.
") HasLowerLimitRoll;
		bool HasLowerLimitRoll();

		/****** StepKinematics_PointOnPlanarCurvePairWithRange::HasLowerLimitYaw ******/
		/****** md5 signature: 219463b70b798e1f47adba6ad95d9904 ******/
		%feature("compactdefaultargs") HasLowerLimitYaw;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if optional field LowerLimitYaw is defined.
") HasLowerLimitYaw;
		bool HasLowerLimitYaw();

		/****** StepKinematics_PointOnPlanarCurvePairWithRange::HasUpperLimitPitch ******/
		/****** md5 signature: 2118ce82483ae961ae68af18c65cd53f ******/
		%feature("compactdefaultargs") HasUpperLimitPitch;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if optional field UpperLimitPitch is defined.
") HasUpperLimitPitch;
		bool HasUpperLimitPitch();

		/****** StepKinematics_PointOnPlanarCurvePairWithRange::HasUpperLimitRoll ******/
		/****** md5 signature: a8c65abdf50e8071fcc7aea0b5d64804 ******/
		%feature("compactdefaultargs") HasUpperLimitRoll;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if optional field UpperLimitRoll is defined.
") HasUpperLimitRoll;
		bool HasUpperLimitRoll();

		/****** StepKinematics_PointOnPlanarCurvePairWithRange::HasUpperLimitYaw ******/
		/****** md5 signature: 42f8a46fe93adc270a7151e696fd787a ******/
		%feature("compactdefaultargs") HasUpperLimitYaw;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if optional field UpperLimitYaw is defined.
") HasUpperLimitYaw;
		bool HasUpperLimitYaw();

		/****** StepKinematics_PointOnPlanarCurvePairWithRange::Init ******/
		/****** md5 signature: 886d508d736723989326784f2ae5df0f ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
theRepresentationItem_Name: TCollection_HAsciiString
theItemDefinedTransformation_Name: TCollection_HAsciiString
hasItemDefinedTransformation_Description: bool
theItemDefinedTransformation_Description: TCollection_HAsciiString
theItemDefinedTransformation_TransformItem1: StepRepr_RepresentationItem
theItemDefinedTransformation_TransformItem2: StepRepr_RepresentationItem
theKinematicPair_Joint: StepKinematics_KinematicJoint
thePointOnPlanarCurvePair_PairCurve: StepGeom_Curve
thePointOnPlanarCurvePair_Orientation: bool
theRangeOnPairCurve: StepGeom_TrimmedCurve
hasLowerLimitYaw: bool
theLowerLimitYaw: double
hasUpperLimitYaw: bool
theUpperLimitYaw: double
hasLowerLimitPitch: bool
theLowerLimitPitch: double
hasUpperLimitPitch: bool
theUpperLimitPitch: double
hasLowerLimitRoll: bool
theLowerLimitRoll: double
hasUpperLimitRoll: bool
theUpperLimitRoll: double

Return
-------
None

Description
-----------
Initialize all fields (own and inherited).
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & theRepresentationItem_Name, const opencascade::handle<TCollection_HAsciiString> & theItemDefinedTransformation_Name, const bool hasItemDefinedTransformation_Description, const opencascade::handle<TCollection_HAsciiString> & theItemDefinedTransformation_Description, const opencascade::handle<StepRepr_RepresentationItem> & theItemDefinedTransformation_TransformItem1, const opencascade::handle<StepRepr_RepresentationItem> & theItemDefinedTransformation_TransformItem2, const opencascade::handle<StepKinematics_KinematicJoint> & theKinematicPair_Joint, const opencascade::handle<StepGeom_Curve> & thePointOnPlanarCurvePair_PairCurve, const bool thePointOnPlanarCurvePair_Orientation, const opencascade::handle<StepGeom_TrimmedCurve> & theRangeOnPairCurve, const bool hasLowerLimitYaw, const double theLowerLimitYaw, const bool hasUpperLimitYaw, const double theUpperLimitYaw, const bool hasLowerLimitPitch, const double theLowerLimitPitch, const bool hasUpperLimitPitch, const double theUpperLimitPitch, const bool hasLowerLimitRoll, const double theLowerLimitRoll, const bool hasUpperLimitRoll, const double theUpperLimitRoll);

		/****** StepKinematics_PointOnPlanarCurvePairWithRange::LowerLimitPitch ******/
		/****** md5 signature: 9448d6046b8a72af2b4a0636bf0c069c ******/
		%feature("compactdefaultargs") LowerLimitPitch;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns field LowerLimitPitch.
") LowerLimitPitch;
		double LowerLimitPitch();

		/****** StepKinematics_PointOnPlanarCurvePairWithRange::LowerLimitRoll ******/
		/****** md5 signature: 71fbf50091a7bb49c13041b8ae9f2b0e ******/
		%feature("compactdefaultargs") LowerLimitRoll;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns field LowerLimitRoll.
") LowerLimitRoll;
		double LowerLimitRoll();

		/****** StepKinematics_PointOnPlanarCurvePairWithRange::LowerLimitYaw ******/
		/****** md5 signature: 7794d2f5c79683c2b16a6c397a4fe9e1 ******/
		%feature("compactdefaultargs") LowerLimitYaw;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns field LowerLimitYaw.
") LowerLimitYaw;
		double LowerLimitYaw();

		/****** StepKinematics_PointOnPlanarCurvePairWithRange::RangeOnPairCurve ******/
		/****** md5 signature: 872b6e35bb8da21a24f909cf5aa5efec ******/
		%feature("compactdefaultargs") RangeOnPairCurve;
		%feature("autodoc", "Return
-------
opencascade::handle<StepGeom_TrimmedCurve>

Description
-----------
Returns field RangeOnPairCurve.
") RangeOnPairCurve;
		opencascade::handle<StepGeom_TrimmedCurve> RangeOnPairCurve();

		/****** StepKinematics_PointOnPlanarCurvePairWithRange::SetLowerLimitPitch ******/
		/****** md5 signature: dc9c0ff5c77d05942a6cbe8a0467ee1f ******/
		%feature("compactdefaultargs") SetLowerLimitPitch;
		%feature("autodoc", "
Parameters
----------
theLowerLimitPitch: double

Return
-------
None

Description
-----------
Sets field LowerLimitPitch.
") SetLowerLimitPitch;
		void SetLowerLimitPitch(const double theLowerLimitPitch);

		/****** StepKinematics_PointOnPlanarCurvePairWithRange::SetLowerLimitRoll ******/
		/****** md5 signature: 2ef9f49685d52fffae39e5c5df9de000 ******/
		%feature("compactdefaultargs") SetLowerLimitRoll;
		%feature("autodoc", "
Parameters
----------
theLowerLimitRoll: double

Return
-------
None

Description
-----------
Sets field LowerLimitRoll.
") SetLowerLimitRoll;
		void SetLowerLimitRoll(const double theLowerLimitRoll);

		/****** StepKinematics_PointOnPlanarCurvePairWithRange::SetLowerLimitYaw ******/
		/****** md5 signature: 14e2ac5bd88b6ecd40ca06b6ec0a6d01 ******/
		%feature("compactdefaultargs") SetLowerLimitYaw;
		%feature("autodoc", "
Parameters
----------
theLowerLimitYaw: double

Return
-------
None

Description
-----------
Sets field LowerLimitYaw.
") SetLowerLimitYaw;
		void SetLowerLimitYaw(const double theLowerLimitYaw);

		/****** StepKinematics_PointOnPlanarCurvePairWithRange::SetRangeOnPairCurve ******/
		/****** md5 signature: f42eb8247af6525f8a1a9f810c6a5443 ******/
		%feature("compactdefaultargs") SetRangeOnPairCurve;
		%feature("autodoc", "
Parameters
----------
theRangeOnPairCurve: StepGeom_TrimmedCurve

Return
-------
None

Description
-----------
Sets field RangeOnPairCurve.
") SetRangeOnPairCurve;
		void SetRangeOnPairCurve(const opencascade::handle<StepGeom_TrimmedCurve> & theRangeOnPairCurve);

		/****** StepKinematics_PointOnPlanarCurvePairWithRange::SetUpperLimitPitch ******/
		/****** md5 signature: 74b41ae2e5b5c82f55d6d466be6ad41e ******/
		%feature("compactdefaultargs") SetUpperLimitPitch;
		%feature("autodoc", "
Parameters
----------
theUpperLimitPitch: double

Return
-------
None

Description
-----------
Sets field UpperLimitPitch.
") SetUpperLimitPitch;
		void SetUpperLimitPitch(const double theUpperLimitPitch);

		/****** StepKinematics_PointOnPlanarCurvePairWithRange::SetUpperLimitRoll ******/
		/****** md5 signature: 3ce2b2db008923451005c1b6e1d9f2e8 ******/
		%feature("compactdefaultargs") SetUpperLimitRoll;
		%feature("autodoc", "
Parameters
----------
theUpperLimitRoll: double

Return
-------
None

Description
-----------
Sets field UpperLimitRoll.
") SetUpperLimitRoll;
		void SetUpperLimitRoll(const double theUpperLimitRoll);

		/****** StepKinematics_PointOnPlanarCurvePairWithRange::SetUpperLimitYaw ******/
		/****** md5 signature: ee3f15a0330535670700456654ca0ce1 ******/
		%feature("compactdefaultargs") SetUpperLimitYaw;
		%feature("autodoc", "
Parameters
----------
theUpperLimitYaw: double

Return
-------
None

Description
-----------
Sets field UpperLimitYaw.
") SetUpperLimitYaw;
		void SetUpperLimitYaw(const double theUpperLimitYaw);

		/****** StepKinematics_PointOnPlanarCurvePairWithRange::UpperLimitPitch ******/
		/****** md5 signature: 3c2d01afb0297abb175851be91c80d50 ******/
		%feature("compactdefaultargs") UpperLimitPitch;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns field UpperLimitPitch.
") UpperLimitPitch;
		double UpperLimitPitch();

		/****** StepKinematics_PointOnPlanarCurvePairWithRange::UpperLimitRoll ******/
		/****** md5 signature: 82141a03599bd38023d3aa8d1ebb76e3 ******/
		%feature("compactdefaultargs") UpperLimitRoll;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns field UpperLimitRoll.
") UpperLimitRoll;
		double UpperLimitRoll();

		/****** StepKinematics_PointOnPlanarCurvePairWithRange::UpperLimitYaw ******/
		/****** md5 signature: 12ad342e4668152baaf51178f6ceb979 ******/
		%feature("compactdefaultargs") UpperLimitYaw;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns field UpperLimitYaw.
") UpperLimitYaw;
		double UpperLimitYaw();

};


%make_alias(StepKinematics_PointOnPlanarCurvePairWithRange)

%extend StepKinematics_PointOnPlanarCurvePairWithRange {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************************************
* class StepKinematics_PointOnSurfacePairWithRange *
***************************************************/
class StepKinematics_PointOnSurfacePairWithRange : public StepKinematics_PointOnSurfacePair {
	public:
		/****** StepKinematics_PointOnSurfacePairWithRange::StepKinematics_PointOnSurfacePairWithRange ******/
		/****** md5 signature: a5589fff33c2e601d189518abfea9ba2 ******/
		%feature("compactdefaultargs") StepKinematics_PointOnSurfacePairWithRange;
		%feature("autodoc", "Return
-------
None

Description
-----------
default constructor.
") StepKinematics_PointOnSurfacePairWithRange;
		 StepKinematics_PointOnSurfacePairWithRange();

		/****** StepKinematics_PointOnSurfacePairWithRange::HasLowerLimitPitch ******/
		/****** md5 signature: 6d43ed7cbc282f1f36e1abcceac8b9a3 ******/
		%feature("compactdefaultargs") HasLowerLimitPitch;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if optional field LowerLimitPitch is defined.
") HasLowerLimitPitch;
		bool HasLowerLimitPitch();

		/****** StepKinematics_PointOnSurfacePairWithRange::HasLowerLimitRoll ******/
		/****** md5 signature: ca5faa9822f310a70436e725fc12a0f3 ******/
		%feature("compactdefaultargs") HasLowerLimitRoll;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if optional field LowerLimitRoll is defined.
") HasLowerLimitRoll;
		bool HasLowerLimitRoll();

		/****** StepKinematics_PointOnSurfacePairWithRange::HasLowerLimitYaw ******/
		/****** md5 signature: 219463b70b798e1f47adba6ad95d9904 ******/
		%feature("compactdefaultargs") HasLowerLimitYaw;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if optional field LowerLimitYaw is defined.
") HasLowerLimitYaw;
		bool HasLowerLimitYaw();

		/****** StepKinematics_PointOnSurfacePairWithRange::HasUpperLimitPitch ******/
		/****** md5 signature: 2118ce82483ae961ae68af18c65cd53f ******/
		%feature("compactdefaultargs") HasUpperLimitPitch;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if optional field UpperLimitPitch is defined.
") HasUpperLimitPitch;
		bool HasUpperLimitPitch();

		/****** StepKinematics_PointOnSurfacePairWithRange::HasUpperLimitRoll ******/
		/****** md5 signature: a8c65abdf50e8071fcc7aea0b5d64804 ******/
		%feature("compactdefaultargs") HasUpperLimitRoll;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if optional field UpperLimitRoll is defined.
") HasUpperLimitRoll;
		bool HasUpperLimitRoll();

		/****** StepKinematics_PointOnSurfacePairWithRange::HasUpperLimitYaw ******/
		/****** md5 signature: 42f8a46fe93adc270a7151e696fd787a ******/
		%feature("compactdefaultargs") HasUpperLimitYaw;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if optional field UpperLimitYaw is defined.
") HasUpperLimitYaw;
		bool HasUpperLimitYaw();

		/****** StepKinematics_PointOnSurfacePairWithRange::Init ******/
		/****** md5 signature: 5da361f5b8897b2c087ac65deb0463b7 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
theRepresentationItem_Name: TCollection_HAsciiString
theItemDefinedTransformation_Name: TCollection_HAsciiString
hasItemDefinedTransformation_Description: bool
theItemDefinedTransformation_Description: TCollection_HAsciiString
theItemDefinedTransformation_TransformItem1: StepRepr_RepresentationItem
theItemDefinedTransformation_TransformItem2: StepRepr_RepresentationItem
theKinematicPair_Joint: StepKinematics_KinematicJoint
thePointOnSurfacePair_PairSurface: StepGeom_Surface
theRangeOnPairSurface: StepGeom_RectangularTrimmedSurface
hasLowerLimitYaw: bool
theLowerLimitYaw: double
hasUpperLimitYaw: bool
theUpperLimitYaw: double
hasLowerLimitPitch: bool
theLowerLimitPitch: double
hasUpperLimitPitch: bool
theUpperLimitPitch: double
hasLowerLimitRoll: bool
theLowerLimitRoll: double
hasUpperLimitRoll: bool
theUpperLimitRoll: double

Return
-------
None

Description
-----------
Initialize all fields (own and inherited).
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & theRepresentationItem_Name, const opencascade::handle<TCollection_HAsciiString> & theItemDefinedTransformation_Name, const bool hasItemDefinedTransformation_Description, const opencascade::handle<TCollection_HAsciiString> & theItemDefinedTransformation_Description, const opencascade::handle<StepRepr_RepresentationItem> & theItemDefinedTransformation_TransformItem1, const opencascade::handle<StepRepr_RepresentationItem> & theItemDefinedTransformation_TransformItem2, const opencascade::handle<StepKinematics_KinematicJoint> & theKinematicPair_Joint, const opencascade::handle<StepGeom_Surface> & thePointOnSurfacePair_PairSurface, const opencascade::handle<StepGeom_RectangularTrimmedSurface> & theRangeOnPairSurface, const bool hasLowerLimitYaw, const double theLowerLimitYaw, const bool hasUpperLimitYaw, const double theUpperLimitYaw, const bool hasLowerLimitPitch, const double theLowerLimitPitch, const bool hasUpperLimitPitch, const double theUpperLimitPitch, const bool hasLowerLimitRoll, const double theLowerLimitRoll, const bool hasUpperLimitRoll, const double theUpperLimitRoll);

		/****** StepKinematics_PointOnSurfacePairWithRange::LowerLimitPitch ******/
		/****** md5 signature: 9448d6046b8a72af2b4a0636bf0c069c ******/
		%feature("compactdefaultargs") LowerLimitPitch;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns field LowerLimitPitch.
") LowerLimitPitch;
		double LowerLimitPitch();

		/****** StepKinematics_PointOnSurfacePairWithRange::LowerLimitRoll ******/
		/****** md5 signature: 71fbf50091a7bb49c13041b8ae9f2b0e ******/
		%feature("compactdefaultargs") LowerLimitRoll;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns field LowerLimitRoll.
") LowerLimitRoll;
		double LowerLimitRoll();

		/****** StepKinematics_PointOnSurfacePairWithRange::LowerLimitYaw ******/
		/****** md5 signature: 7794d2f5c79683c2b16a6c397a4fe9e1 ******/
		%feature("compactdefaultargs") LowerLimitYaw;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns field LowerLimitYaw.
") LowerLimitYaw;
		double LowerLimitYaw();

		/****** StepKinematics_PointOnSurfacePairWithRange::RangeOnPairSurface ******/
		/****** md5 signature: 844927162fe7aa8ee4ebaa90456fdc6c ******/
		%feature("compactdefaultargs") RangeOnPairSurface;
		%feature("autodoc", "Return
-------
opencascade::handle<StepGeom_RectangularTrimmedSurface>

Description
-----------
Returns field RangeOnPairSurface.
") RangeOnPairSurface;
		opencascade::handle<StepGeom_RectangularTrimmedSurface> RangeOnPairSurface();

		/****** StepKinematics_PointOnSurfacePairWithRange::SetLowerLimitPitch ******/
		/****** md5 signature: dc9c0ff5c77d05942a6cbe8a0467ee1f ******/
		%feature("compactdefaultargs") SetLowerLimitPitch;
		%feature("autodoc", "
Parameters
----------
theLowerLimitPitch: double

Return
-------
None

Description
-----------
Sets field LowerLimitPitch.
") SetLowerLimitPitch;
		void SetLowerLimitPitch(const double theLowerLimitPitch);

		/****** StepKinematics_PointOnSurfacePairWithRange::SetLowerLimitRoll ******/
		/****** md5 signature: 2ef9f49685d52fffae39e5c5df9de000 ******/
		%feature("compactdefaultargs") SetLowerLimitRoll;
		%feature("autodoc", "
Parameters
----------
theLowerLimitRoll: double

Return
-------
None

Description
-----------
Sets field LowerLimitRoll.
") SetLowerLimitRoll;
		void SetLowerLimitRoll(const double theLowerLimitRoll);

		/****** StepKinematics_PointOnSurfacePairWithRange::SetLowerLimitYaw ******/
		/****** md5 signature: 14e2ac5bd88b6ecd40ca06b6ec0a6d01 ******/
		%feature("compactdefaultargs") SetLowerLimitYaw;
		%feature("autodoc", "
Parameters
----------
theLowerLimitYaw: double

Return
-------
None

Description
-----------
Sets field LowerLimitYaw.
") SetLowerLimitYaw;
		void SetLowerLimitYaw(const double theLowerLimitYaw);

		/****** StepKinematics_PointOnSurfacePairWithRange::SetRangeOnPairSurface ******/
		/****** md5 signature: 529acc47b4019828d8590651f4e45ac9 ******/
		%feature("compactdefaultargs") SetRangeOnPairSurface;
		%feature("autodoc", "
Parameters
----------
theRangeOnPairSurface: StepGeom_RectangularTrimmedSurface

Return
-------
None

Description
-----------
Sets field RangeOnPairSurface.
") SetRangeOnPairSurface;
		void SetRangeOnPairSurface(const opencascade::handle<StepGeom_RectangularTrimmedSurface> & theRangeOnPairSurface);

		/****** StepKinematics_PointOnSurfacePairWithRange::SetUpperLimitPitch ******/
		/****** md5 signature: 74b41ae2e5b5c82f55d6d466be6ad41e ******/
		%feature("compactdefaultargs") SetUpperLimitPitch;
		%feature("autodoc", "
Parameters
----------
theUpperLimitPitch: double

Return
-------
None

Description
-----------
Sets field UpperLimitPitch.
") SetUpperLimitPitch;
		void SetUpperLimitPitch(const double theUpperLimitPitch);

		/****** StepKinematics_PointOnSurfacePairWithRange::SetUpperLimitRoll ******/
		/****** md5 signature: 3ce2b2db008923451005c1b6e1d9f2e8 ******/
		%feature("compactdefaultargs") SetUpperLimitRoll;
		%feature("autodoc", "
Parameters
----------
theUpperLimitRoll: double

Return
-------
None

Description
-----------
Sets field UpperLimitRoll.
") SetUpperLimitRoll;
		void SetUpperLimitRoll(const double theUpperLimitRoll);

		/****** StepKinematics_PointOnSurfacePairWithRange::SetUpperLimitYaw ******/
		/****** md5 signature: ee3f15a0330535670700456654ca0ce1 ******/
		%feature("compactdefaultargs") SetUpperLimitYaw;
		%feature("autodoc", "
Parameters
----------
theUpperLimitYaw: double

Return
-------
None

Description
-----------
Sets field UpperLimitYaw.
") SetUpperLimitYaw;
		void SetUpperLimitYaw(const double theUpperLimitYaw);

		/****** StepKinematics_PointOnSurfacePairWithRange::UpperLimitPitch ******/
		/****** md5 signature: 3c2d01afb0297abb175851be91c80d50 ******/
		%feature("compactdefaultargs") UpperLimitPitch;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns field UpperLimitPitch.
") UpperLimitPitch;
		double UpperLimitPitch();

		/****** StepKinematics_PointOnSurfacePairWithRange::UpperLimitRoll ******/
		/****** md5 signature: 82141a03599bd38023d3aa8d1ebb76e3 ******/
		%feature("compactdefaultargs") UpperLimitRoll;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns field UpperLimitRoll.
") UpperLimitRoll;
		double UpperLimitRoll();

		/****** StepKinematics_PointOnSurfacePairWithRange::UpperLimitYaw ******/
		/****** md5 signature: 12ad342e4668152baaf51178f6ceb979 ******/
		%feature("compactdefaultargs") UpperLimitYaw;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns field UpperLimitYaw.
") UpperLimitYaw;
		double UpperLimitYaw();

};


%make_alias(StepKinematics_PointOnSurfacePairWithRange)

%extend StepKinematics_PointOnSurfacePairWithRange {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************************************
* class StepKinematics_PrismaticPairWithRange *
**********************************************/
class StepKinematics_PrismaticPairWithRange : public StepKinematics_PrismaticPair {
	public:
		/****** StepKinematics_PrismaticPairWithRange::StepKinematics_PrismaticPairWithRange ******/
		/****** md5 signature: 80a80b3d15499237128873bc2b5ba63b ******/
		%feature("compactdefaultargs") StepKinematics_PrismaticPairWithRange;
		%feature("autodoc", "Return
-------
None

Description
-----------
default constructor.
") StepKinematics_PrismaticPairWithRange;
		 StepKinematics_PrismaticPairWithRange();

		/****** StepKinematics_PrismaticPairWithRange::HasLowerLimitActualTranslation ******/
		/****** md5 signature: f8ce097e57b4016e1150c788d801a65e ******/
		%feature("compactdefaultargs") HasLowerLimitActualTranslation;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if optional field LowerLimitActualTranslation is defined.
") HasLowerLimitActualTranslation;
		bool HasLowerLimitActualTranslation();

		/****** StepKinematics_PrismaticPairWithRange::HasUpperLimitActualTranslation ******/
		/****** md5 signature: 1b551d1aa1bd40ba65c81d394c0f63a3 ******/
		%feature("compactdefaultargs") HasUpperLimitActualTranslation;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if optional field UpperLimitActualTranslation is defined.
") HasUpperLimitActualTranslation;
		bool HasUpperLimitActualTranslation();

		/****** StepKinematics_PrismaticPairWithRange::Init ******/
		/****** md5 signature: 860e0a678073b4ecf6964d36ecc2ea37 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
theRepresentationItem_Name: TCollection_HAsciiString
theItemDefinedTransformation_Name: TCollection_HAsciiString
hasItemDefinedTransformation_Description: bool
theItemDefinedTransformation_Description: TCollection_HAsciiString
theItemDefinedTransformation_TransformItem1: StepRepr_RepresentationItem
theItemDefinedTransformation_TransformItem2: StepRepr_RepresentationItem
theKinematicPair_Joint: StepKinematics_KinematicJoint
theLowOrderKinematicPair_TX: bool
theLowOrderKinematicPair_TY: bool
theLowOrderKinematicPair_TZ: bool
theLowOrderKinematicPair_RX: bool
theLowOrderKinematicPair_RY: bool
theLowOrderKinematicPair_RZ: bool
hasLowerLimitActualTranslation: bool
theLowerLimitActualTranslation: double
hasUpperLimitActualTranslation: bool
theUpperLimitActualTranslation: double

Return
-------
None

Description
-----------
Initialize all fields (own and inherited).
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & theRepresentationItem_Name, const opencascade::handle<TCollection_HAsciiString> & theItemDefinedTransformation_Name, const bool hasItemDefinedTransformation_Description, const opencascade::handle<TCollection_HAsciiString> & theItemDefinedTransformation_Description, const opencascade::handle<StepRepr_RepresentationItem> & theItemDefinedTransformation_TransformItem1, const opencascade::handle<StepRepr_RepresentationItem> & theItemDefinedTransformation_TransformItem2, const opencascade::handle<StepKinematics_KinematicJoint> & theKinematicPair_Joint, const bool theLowOrderKinematicPair_TX, const bool theLowOrderKinematicPair_TY, const bool theLowOrderKinematicPair_TZ, const bool theLowOrderKinematicPair_RX, const bool theLowOrderKinematicPair_RY, const bool theLowOrderKinematicPair_RZ, const bool hasLowerLimitActualTranslation, const double theLowerLimitActualTranslation, const bool hasUpperLimitActualTranslation, const double theUpperLimitActualTranslation);

		/****** StepKinematics_PrismaticPairWithRange::LowerLimitActualTranslation ******/
		/****** md5 signature: 861526b9c684a27676c3aa72c1fd4e90 ******/
		%feature("compactdefaultargs") LowerLimitActualTranslation;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns field LowerLimitActualTranslation.
") LowerLimitActualTranslation;
		double LowerLimitActualTranslation();

		/****** StepKinematics_PrismaticPairWithRange::SetLowerLimitActualTranslation ******/
		/****** md5 signature: 829940fae49f1c2a1df6726c6259fd5c ******/
		%feature("compactdefaultargs") SetLowerLimitActualTranslation;
		%feature("autodoc", "
Parameters
----------
theLowerLimitActualTranslation: double

Return
-------
None

Description
-----------
Sets field LowerLimitActualTranslation.
") SetLowerLimitActualTranslation;
		void SetLowerLimitActualTranslation(const double theLowerLimitActualTranslation);

		/****** StepKinematics_PrismaticPairWithRange::SetUpperLimitActualTranslation ******/
		/****** md5 signature: ccff13f29abf96c5b9d3b62c0b5a42a4 ******/
		%feature("compactdefaultargs") SetUpperLimitActualTranslation;
		%feature("autodoc", "
Parameters
----------
theUpperLimitActualTranslation: double

Return
-------
None

Description
-----------
Sets field UpperLimitActualTranslation.
") SetUpperLimitActualTranslation;
		void SetUpperLimitActualTranslation(const double theUpperLimitActualTranslation);

		/****** StepKinematics_PrismaticPairWithRange::UpperLimitActualTranslation ******/
		/****** md5 signature: 6cf51e7de416661f4cbd1795b697f8c1 ******/
		%feature("compactdefaultargs") UpperLimitActualTranslation;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns field UpperLimitActualTranslation.
") UpperLimitActualTranslation;
		double UpperLimitActualTranslation();

};


%make_alias(StepKinematics_PrismaticPairWithRange)

%extend StepKinematics_PrismaticPairWithRange {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************************************
* class StepKinematics_RackAndPinionPairWithRange *
**************************************************/
class StepKinematics_RackAndPinionPairWithRange : public StepKinematics_RackAndPinionPair {
	public:
		/****** StepKinematics_RackAndPinionPairWithRange::StepKinematics_RackAndPinionPairWithRange ******/
		/****** md5 signature: 01d99be0ee373f982d0abcc4ddd30cfd ******/
		%feature("compactdefaultargs") StepKinematics_RackAndPinionPairWithRange;
		%feature("autodoc", "Return
-------
None

Description
-----------
default constructor.
") StepKinematics_RackAndPinionPairWithRange;
		 StepKinematics_RackAndPinionPairWithRange();

		/****** StepKinematics_RackAndPinionPairWithRange::HasLowerLimitRackDisplacement ******/
		/****** md5 signature: 7964ce6d8d96aea4ca6870d3c442a1de ******/
		%feature("compactdefaultargs") HasLowerLimitRackDisplacement;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if optional field LowerLimitRackDisplacement is defined.
") HasLowerLimitRackDisplacement;
		bool HasLowerLimitRackDisplacement();

		/****** StepKinematics_RackAndPinionPairWithRange::HasUpperLimitRackDisplacement ******/
		/****** md5 signature: d5c2f478f2ae88df11055c8469c15eeb ******/
		%feature("compactdefaultargs") HasUpperLimitRackDisplacement;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if optional field UpperLimitRackDisplacement is defined.
") HasUpperLimitRackDisplacement;
		bool HasUpperLimitRackDisplacement();

		/****** StepKinematics_RackAndPinionPairWithRange::Init ******/
		/****** md5 signature: f4eb032b8d510748f55b5f0ddf20447e ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
theRepresentationItem_Name: TCollection_HAsciiString
theItemDefinedTransformation_Name: TCollection_HAsciiString
hasItemDefinedTransformation_Description: bool
theItemDefinedTransformation_Description: TCollection_HAsciiString
theItemDefinedTransformation_TransformItem1: StepRepr_RepresentationItem
theItemDefinedTransformation_TransformItem2: StepRepr_RepresentationItem
theKinematicPair_Joint: StepKinematics_KinematicJoint
theRackAndPinionPair_PinionRadius: double
hasLowerLimitRackDisplacement: bool
theLowerLimitRackDisplacement: double
hasUpperLimitRackDisplacement: bool
theUpperLimitRackDisplacement: double

Return
-------
None

Description
-----------
Initialize all fields (own and inherited).
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & theRepresentationItem_Name, const opencascade::handle<TCollection_HAsciiString> & theItemDefinedTransformation_Name, const bool hasItemDefinedTransformation_Description, const opencascade::handle<TCollection_HAsciiString> & theItemDefinedTransformation_Description, const opencascade::handle<StepRepr_RepresentationItem> & theItemDefinedTransformation_TransformItem1, const opencascade::handle<StepRepr_RepresentationItem> & theItemDefinedTransformation_TransformItem2, const opencascade::handle<StepKinematics_KinematicJoint> & theKinematicPair_Joint, const double theRackAndPinionPair_PinionRadius, const bool hasLowerLimitRackDisplacement, const double theLowerLimitRackDisplacement, const bool hasUpperLimitRackDisplacement, const double theUpperLimitRackDisplacement);

		/****** StepKinematics_RackAndPinionPairWithRange::LowerLimitRackDisplacement ******/
		/****** md5 signature: 5368e2657af1df82fd9832554718d7fa ******/
		%feature("compactdefaultargs") LowerLimitRackDisplacement;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns field LowerLimitRackDisplacement.
") LowerLimitRackDisplacement;
		double LowerLimitRackDisplacement();

		/****** StepKinematics_RackAndPinionPairWithRange::SetLowerLimitRackDisplacement ******/
		/****** md5 signature: d4d7309e071a5e19443f04d626071ca8 ******/
		%feature("compactdefaultargs") SetLowerLimitRackDisplacement;
		%feature("autodoc", "
Parameters
----------
theLowerLimitRackDisplacement: double

Return
-------
None

Description
-----------
Sets field LowerLimitRackDisplacement.
") SetLowerLimitRackDisplacement;
		void SetLowerLimitRackDisplacement(const double theLowerLimitRackDisplacement);

		/****** StepKinematics_RackAndPinionPairWithRange::SetUpperLimitRackDisplacement ******/
		/****** md5 signature: f6a8e68a77ff624743d45838baad9298 ******/
		%feature("compactdefaultargs") SetUpperLimitRackDisplacement;
		%feature("autodoc", "
Parameters
----------
theUpperLimitRackDisplacement: double

Return
-------
None

Description
-----------
Sets field UpperLimitRackDisplacement.
") SetUpperLimitRackDisplacement;
		void SetUpperLimitRackDisplacement(const double theUpperLimitRackDisplacement);

		/****** StepKinematics_RackAndPinionPairWithRange::UpperLimitRackDisplacement ******/
		/****** md5 signature: 3af3aed0e0842537ce7226e658d97389 ******/
		%feature("compactdefaultargs") UpperLimitRackDisplacement;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns field UpperLimitRackDisplacement.
") UpperLimitRackDisplacement;
		double UpperLimitRackDisplacement();

};


%make_alias(StepKinematics_RackAndPinionPairWithRange)

%extend StepKinematics_RackAndPinionPairWithRange {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************************
* class StepKinematics_RevolutePairWithRange *
*********************************************/
class StepKinematics_RevolutePairWithRange : public StepKinematics_RevolutePair {
	public:
		/****** StepKinematics_RevolutePairWithRange::StepKinematics_RevolutePairWithRange ******/
		/****** md5 signature: 9c6f4a1ac59c7c3a39139ad387c851b5 ******/
		%feature("compactdefaultargs") StepKinematics_RevolutePairWithRange;
		%feature("autodoc", "Return
-------
None

Description
-----------
default constructor.
") StepKinematics_RevolutePairWithRange;
		 StepKinematics_RevolutePairWithRange();

		/****** StepKinematics_RevolutePairWithRange::HasLowerLimitActualRotation ******/
		/****** md5 signature: 9b40ef4d811e858876d345f940d9308d ******/
		%feature("compactdefaultargs") HasLowerLimitActualRotation;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if optional field LowerLimitActualRotation is defined.
") HasLowerLimitActualRotation;
		bool HasLowerLimitActualRotation();

		/****** StepKinematics_RevolutePairWithRange::HasUpperLimitActualRotation ******/
		/****** md5 signature: 7517dce8b477eb9f38355f00b58abdf5 ******/
		%feature("compactdefaultargs") HasUpperLimitActualRotation;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if optional field UpperLimitActualRotation is defined.
") HasUpperLimitActualRotation;
		bool HasUpperLimitActualRotation();

		/****** StepKinematics_RevolutePairWithRange::Init ******/
		/****** md5 signature: 97d3e395659d4aecc168a312d67cbb92 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
theRepresentationItem_Name: TCollection_HAsciiString
theItemDefinedTransformation_Name: TCollection_HAsciiString
hasItemDefinedTransformation_Description: bool
theItemDefinedTransformation_Description: TCollection_HAsciiString
theItemDefinedTransformation_TransformItem1: StepRepr_RepresentationItem
theItemDefinedTransformation_TransformItem2: StepRepr_RepresentationItem
theKinematicPair_Joint: StepKinematics_KinematicJoint
theLowOrderKinematicPair_TX: bool
theLowOrderKinematicPair_TY: bool
theLowOrderKinematicPair_TZ: bool
theLowOrderKinematicPair_RX: bool
theLowOrderKinematicPair_RY: bool
theLowOrderKinematicPair_RZ: bool
hasLowerLimitActualRotation: bool
theLowerLimitActualRotation: double
hasUpperLimitActualRotation: bool
theUpperLimitActualRotation: double

Return
-------
None

Description
-----------
Initialize all fields (own and inherited).
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & theRepresentationItem_Name, const opencascade::handle<TCollection_HAsciiString> & theItemDefinedTransformation_Name, const bool hasItemDefinedTransformation_Description, const opencascade::handle<TCollection_HAsciiString> & theItemDefinedTransformation_Description, const opencascade::handle<StepRepr_RepresentationItem> & theItemDefinedTransformation_TransformItem1, const opencascade::handle<StepRepr_RepresentationItem> & theItemDefinedTransformation_TransformItem2, const opencascade::handle<StepKinematics_KinematicJoint> & theKinematicPair_Joint, const bool theLowOrderKinematicPair_TX, const bool theLowOrderKinematicPair_TY, const bool theLowOrderKinematicPair_TZ, const bool theLowOrderKinematicPair_RX, const bool theLowOrderKinematicPair_RY, const bool theLowOrderKinematicPair_RZ, const bool hasLowerLimitActualRotation, const double theLowerLimitActualRotation, const bool hasUpperLimitActualRotation, const double theUpperLimitActualRotation);

		/****** StepKinematics_RevolutePairWithRange::LowerLimitActualRotation ******/
		/****** md5 signature: 750f030b56d0246174629d8de2795657 ******/
		%feature("compactdefaultargs") LowerLimitActualRotation;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns field LowerLimitActualRotation.
") LowerLimitActualRotation;
		double LowerLimitActualRotation();

		/****** StepKinematics_RevolutePairWithRange::SetLowerLimitActualRotation ******/
		/****** md5 signature: 70f1515555184a7396c24823a25ea752 ******/
		%feature("compactdefaultargs") SetLowerLimitActualRotation;
		%feature("autodoc", "
Parameters
----------
theLowerLimitActualRotation: double

Return
-------
None

Description
-----------
Sets field LowerLimitActualRotation.
") SetLowerLimitActualRotation;
		void SetLowerLimitActualRotation(const double theLowerLimitActualRotation);

		/****** StepKinematics_RevolutePairWithRange::SetUpperLimitActualRotation ******/
		/****** md5 signature: 14bfde518bb812ed770905cb2005aba3 ******/
		%feature("compactdefaultargs") SetUpperLimitActualRotation;
		%feature("autodoc", "
Parameters
----------
theUpperLimitActualRotation: double

Return
-------
None

Description
-----------
Sets field UpperLimitActualRotation.
") SetUpperLimitActualRotation;
		void SetUpperLimitActualRotation(const double theUpperLimitActualRotation);

		/****** StepKinematics_RevolutePairWithRange::UpperLimitActualRotation ******/
		/****** md5 signature: 0110541df2ed6cb73390dbd871578ac5 ******/
		%feature("compactdefaultargs") UpperLimitActualRotation;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns field UpperLimitActualRotation.
") UpperLimitActualRotation;
		double UpperLimitActualRotation();

};


%make_alias(StepKinematics_RevolutePairWithRange)

%extend StepKinematics_RevolutePairWithRange {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************************
* class StepKinematics_RollingCurvePair *
****************************************/
class StepKinematics_RollingCurvePair : public StepKinematics_PlanarCurvePair {
	public:
		/****** StepKinematics_RollingCurvePair::StepKinematics_RollingCurvePair ******/
		/****** md5 signature: d51b70230f0222ad1e6936bd3c400235 ******/
		%feature("compactdefaultargs") StepKinematics_RollingCurvePair;
		%feature("autodoc", "Return
-------
None

Description
-----------
default constructor.
") StepKinematics_RollingCurvePair;
		 StepKinematics_RollingCurvePair();

};


%make_alias(StepKinematics_RollingCurvePair)

%extend StepKinematics_RollingCurvePair {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************************
* class StepKinematics_RollingSurfacePair *
******************************************/
class StepKinematics_RollingSurfacePair : public StepKinematics_SurfacePair {
	public:
		/****** StepKinematics_RollingSurfacePair::StepKinematics_RollingSurfacePair ******/
		/****** md5 signature: ef9cf58df6d1b796037ff7bc21bec66d ******/
		%feature("compactdefaultargs") StepKinematics_RollingSurfacePair;
		%feature("autodoc", "Return
-------
None

Description
-----------
default constructor.
") StepKinematics_RollingSurfacePair;
		 StepKinematics_RollingSurfacePair();

};


%make_alias(StepKinematics_RollingSurfacePair)

%extend StepKinematics_RollingSurfacePair {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************************
* class StepKinematics_ScrewPairWithRange *
******************************************/
class StepKinematics_ScrewPairWithRange : public StepKinematics_ScrewPair {
	public:
		/****** StepKinematics_ScrewPairWithRange::StepKinematics_ScrewPairWithRange ******/
		/****** md5 signature: c02fc3d1f3aa95dddaccea7c55b6f642 ******/
		%feature("compactdefaultargs") StepKinematics_ScrewPairWithRange;
		%feature("autodoc", "Return
-------
None

Description
-----------
default constructor.
") StepKinematics_ScrewPairWithRange;
		 StepKinematics_ScrewPairWithRange();

		/****** StepKinematics_ScrewPairWithRange::HasLowerLimitActualRotation ******/
		/****** md5 signature: 9b40ef4d811e858876d345f940d9308d ******/
		%feature("compactdefaultargs") HasLowerLimitActualRotation;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if optional field LowerLimitActualRotation is defined.
") HasLowerLimitActualRotation;
		bool HasLowerLimitActualRotation();

		/****** StepKinematics_ScrewPairWithRange::HasUpperLimitActualRotation ******/
		/****** md5 signature: 7517dce8b477eb9f38355f00b58abdf5 ******/
		%feature("compactdefaultargs") HasUpperLimitActualRotation;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if optional field UpperLimitActualRotation is defined.
") HasUpperLimitActualRotation;
		bool HasUpperLimitActualRotation();

		/****** StepKinematics_ScrewPairWithRange::Init ******/
		/****** md5 signature: 331be4c4bd23de870679a3010fe7f114 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
theRepresentationItem_Name: TCollection_HAsciiString
theItemDefinedTransformation_Name: TCollection_HAsciiString
hasItemDefinedTransformation_Description: bool
theItemDefinedTransformation_Description: TCollection_HAsciiString
theItemDefinedTransformation_TransformItem1: StepRepr_RepresentationItem
theItemDefinedTransformation_TransformItem2: StepRepr_RepresentationItem
theKinematicPair_Joint: StepKinematics_KinematicJoint
theScrewPair_Pitch: double
hasLowerLimitActualRotation: bool
theLowerLimitActualRotation: double
hasUpperLimitActualRotation: bool
theUpperLimitActualRotation: double

Return
-------
None

Description
-----------
Initialize all fields (own and inherited).
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & theRepresentationItem_Name, const opencascade::handle<TCollection_HAsciiString> & theItemDefinedTransformation_Name, const bool hasItemDefinedTransformation_Description, const opencascade::handle<TCollection_HAsciiString> & theItemDefinedTransformation_Description, const opencascade::handle<StepRepr_RepresentationItem> & theItemDefinedTransformation_TransformItem1, const opencascade::handle<StepRepr_RepresentationItem> & theItemDefinedTransformation_TransformItem2, const opencascade::handle<StepKinematics_KinematicJoint> & theKinematicPair_Joint, const double theScrewPair_Pitch, const bool hasLowerLimitActualRotation, const double theLowerLimitActualRotation, const bool hasUpperLimitActualRotation, const double theUpperLimitActualRotation);

		/****** StepKinematics_ScrewPairWithRange::LowerLimitActualRotation ******/
		/****** md5 signature: 750f030b56d0246174629d8de2795657 ******/
		%feature("compactdefaultargs") LowerLimitActualRotation;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns field LowerLimitActualRotation.
") LowerLimitActualRotation;
		double LowerLimitActualRotation();

		/****** StepKinematics_ScrewPairWithRange::SetLowerLimitActualRotation ******/
		/****** md5 signature: 70f1515555184a7396c24823a25ea752 ******/
		%feature("compactdefaultargs") SetLowerLimitActualRotation;
		%feature("autodoc", "
Parameters
----------
theLowerLimitActualRotation: double

Return
-------
None

Description
-----------
Sets field LowerLimitActualRotation.
") SetLowerLimitActualRotation;
		void SetLowerLimitActualRotation(const double theLowerLimitActualRotation);

		/****** StepKinematics_ScrewPairWithRange::SetUpperLimitActualRotation ******/
		/****** md5 signature: 14bfde518bb812ed770905cb2005aba3 ******/
		%feature("compactdefaultargs") SetUpperLimitActualRotation;
		%feature("autodoc", "
Parameters
----------
theUpperLimitActualRotation: double

Return
-------
None

Description
-----------
Sets field UpperLimitActualRotation.
") SetUpperLimitActualRotation;
		void SetUpperLimitActualRotation(const double theUpperLimitActualRotation);

		/****** StepKinematics_ScrewPairWithRange::UpperLimitActualRotation ******/
		/****** md5 signature: 0110541df2ed6cb73390dbd871578ac5 ******/
		%feature("compactdefaultargs") UpperLimitActualRotation;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns field UpperLimitActualRotation.
") UpperLimitActualRotation;
		double UpperLimitActualRotation();

};


%make_alias(StepKinematics_ScrewPairWithRange)

%extend StepKinematics_ScrewPairWithRange {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************************
* class StepKinematics_SlidingCurvePair *
****************************************/
class StepKinematics_SlidingCurvePair : public StepKinematics_PlanarCurvePair {
	public:
		/****** StepKinematics_SlidingCurvePair::StepKinematics_SlidingCurvePair ******/
		/****** md5 signature: 5d0ded6d95aa77599df2328b15fee313 ******/
		%feature("compactdefaultargs") StepKinematics_SlidingCurvePair;
		%feature("autodoc", "Return
-------
None

Description
-----------
default constructor.
") StepKinematics_SlidingCurvePair;
		 StepKinematics_SlidingCurvePair();

};


%make_alias(StepKinematics_SlidingCurvePair)

%extend StepKinematics_SlidingCurvePair {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************************
* class StepKinematics_SlidingSurfacePair *
******************************************/
class StepKinematics_SlidingSurfacePair : public StepKinematics_SurfacePair {
	public:
		/****** StepKinematics_SlidingSurfacePair::StepKinematics_SlidingSurfacePair ******/
		/****** md5 signature: e77fb7efd5f36ce306d4fe2d9cd60309 ******/
		%feature("compactdefaultargs") StepKinematics_SlidingSurfacePair;
		%feature("autodoc", "Return
-------
None

Description
-----------
default constructor.
") StepKinematics_SlidingSurfacePair;
		 StepKinematics_SlidingSurfacePair();

};


%make_alias(StepKinematics_SlidingSurfacePair)

%extend StepKinematics_SlidingSurfacePair {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************************************
* class StepKinematics_SphericalPairWithPinAndRange *
****************************************************/
class StepKinematics_SphericalPairWithPinAndRange : public StepKinematics_SphericalPairWithPin {
	public:
		/****** StepKinematics_SphericalPairWithPinAndRange::StepKinematics_SphericalPairWithPinAndRange ******/
		/****** md5 signature: 9e43fdde69f9ffa61654b7e59abcd095 ******/
		%feature("compactdefaultargs") StepKinematics_SphericalPairWithPinAndRange;
		%feature("autodoc", "Return
-------
None

Description
-----------
default constructor.
") StepKinematics_SphericalPairWithPinAndRange;
		 StepKinematics_SphericalPairWithPinAndRange();

		/****** StepKinematics_SphericalPairWithPinAndRange::HasLowerLimitRoll ******/
		/****** md5 signature: ca5faa9822f310a70436e725fc12a0f3 ******/
		%feature("compactdefaultargs") HasLowerLimitRoll;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if optional field LowerLimitRoll is defined.
") HasLowerLimitRoll;
		bool HasLowerLimitRoll();

		/****** StepKinematics_SphericalPairWithPinAndRange::HasLowerLimitYaw ******/
		/****** md5 signature: 219463b70b798e1f47adba6ad95d9904 ******/
		%feature("compactdefaultargs") HasLowerLimitYaw;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if optional field LowerLimitYaw is defined.
") HasLowerLimitYaw;
		bool HasLowerLimitYaw();

		/****** StepKinematics_SphericalPairWithPinAndRange::HasUpperLimitRoll ******/
		/****** md5 signature: a8c65abdf50e8071fcc7aea0b5d64804 ******/
		%feature("compactdefaultargs") HasUpperLimitRoll;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if optional field UpperLimitRoll is defined.
") HasUpperLimitRoll;
		bool HasUpperLimitRoll();

		/****** StepKinematics_SphericalPairWithPinAndRange::HasUpperLimitYaw ******/
		/****** md5 signature: 42f8a46fe93adc270a7151e696fd787a ******/
		%feature("compactdefaultargs") HasUpperLimitYaw;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if optional field UpperLimitYaw is defined.
") HasUpperLimitYaw;
		bool HasUpperLimitYaw();

		/****** StepKinematics_SphericalPairWithPinAndRange::Init ******/
		/****** md5 signature: 27b657d8dc0bcbbada4ecb54f0b9a534 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
theRepresentationItem_Name: TCollection_HAsciiString
theItemDefinedTransformation_Name: TCollection_HAsciiString
hasItemDefinedTransformation_Description: bool
theItemDefinedTransformation_Description: TCollection_HAsciiString
theItemDefinedTransformation_TransformItem1: StepRepr_RepresentationItem
theItemDefinedTransformation_TransformItem2: StepRepr_RepresentationItem
theKinematicPair_Joint: StepKinematics_KinematicJoint
theLowOrderKinematicPair_TX: bool
theLowOrderKinematicPair_TY: bool
theLowOrderKinematicPair_TZ: bool
theLowOrderKinematicPair_RX: bool
theLowOrderKinematicPair_RY: bool
theLowOrderKinematicPair_RZ: bool
hasLowerLimitYaw: bool
theLowerLimitYaw: double
hasUpperLimitYaw: bool
theUpperLimitYaw: double
hasLowerLimitRoll: bool
theLowerLimitRoll: double
hasUpperLimitRoll: bool
theUpperLimitRoll: double

Return
-------
None

Description
-----------
Initialize all fields (own and inherited).
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & theRepresentationItem_Name, const opencascade::handle<TCollection_HAsciiString> & theItemDefinedTransformation_Name, const bool hasItemDefinedTransformation_Description, const opencascade::handle<TCollection_HAsciiString> & theItemDefinedTransformation_Description, const opencascade::handle<StepRepr_RepresentationItem> & theItemDefinedTransformation_TransformItem1, const opencascade::handle<StepRepr_RepresentationItem> & theItemDefinedTransformation_TransformItem2, const opencascade::handle<StepKinematics_KinematicJoint> & theKinematicPair_Joint, const bool theLowOrderKinematicPair_TX, const bool theLowOrderKinematicPair_TY, const bool theLowOrderKinematicPair_TZ, const bool theLowOrderKinematicPair_RX, const bool theLowOrderKinematicPair_RY, const bool theLowOrderKinematicPair_RZ, const bool hasLowerLimitYaw, const double theLowerLimitYaw, const bool hasUpperLimitYaw, const double theUpperLimitYaw, const bool hasLowerLimitRoll, const double theLowerLimitRoll, const bool hasUpperLimitRoll, const double theUpperLimitRoll);

		/****** StepKinematics_SphericalPairWithPinAndRange::LowerLimitRoll ******/
		/****** md5 signature: 71fbf50091a7bb49c13041b8ae9f2b0e ******/
		%feature("compactdefaultargs") LowerLimitRoll;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns field LowerLimitRoll.
") LowerLimitRoll;
		double LowerLimitRoll();

		/****** StepKinematics_SphericalPairWithPinAndRange::LowerLimitYaw ******/
		/****** md5 signature: 7794d2f5c79683c2b16a6c397a4fe9e1 ******/
		%feature("compactdefaultargs") LowerLimitYaw;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns field LowerLimitYaw.
") LowerLimitYaw;
		double LowerLimitYaw();

		/****** StepKinematics_SphericalPairWithPinAndRange::SetLowerLimitRoll ******/
		/****** md5 signature: 2ef9f49685d52fffae39e5c5df9de000 ******/
		%feature("compactdefaultargs") SetLowerLimitRoll;
		%feature("autodoc", "
Parameters
----------
theLowerLimitRoll: double

Return
-------
None

Description
-----------
Sets field LowerLimitRoll.
") SetLowerLimitRoll;
		void SetLowerLimitRoll(const double theLowerLimitRoll);

		/****** StepKinematics_SphericalPairWithPinAndRange::SetLowerLimitYaw ******/
		/****** md5 signature: 14e2ac5bd88b6ecd40ca06b6ec0a6d01 ******/
		%feature("compactdefaultargs") SetLowerLimitYaw;
		%feature("autodoc", "
Parameters
----------
theLowerLimitYaw: double

Return
-------
None

Description
-----------
Sets field LowerLimitYaw.
") SetLowerLimitYaw;
		void SetLowerLimitYaw(const double theLowerLimitYaw);

		/****** StepKinematics_SphericalPairWithPinAndRange::SetUpperLimitRoll ******/
		/****** md5 signature: 3ce2b2db008923451005c1b6e1d9f2e8 ******/
		%feature("compactdefaultargs") SetUpperLimitRoll;
		%feature("autodoc", "
Parameters
----------
theUpperLimitRoll: double

Return
-------
None

Description
-----------
Sets field UpperLimitRoll.
") SetUpperLimitRoll;
		void SetUpperLimitRoll(const double theUpperLimitRoll);

		/****** StepKinematics_SphericalPairWithPinAndRange::SetUpperLimitYaw ******/
		/****** md5 signature: ee3f15a0330535670700456654ca0ce1 ******/
		%feature("compactdefaultargs") SetUpperLimitYaw;
		%feature("autodoc", "
Parameters
----------
theUpperLimitYaw: double

Return
-------
None

Description
-----------
Sets field UpperLimitYaw.
") SetUpperLimitYaw;
		void SetUpperLimitYaw(const double theUpperLimitYaw);

		/****** StepKinematics_SphericalPairWithPinAndRange::UpperLimitRoll ******/
		/****** md5 signature: 82141a03599bd38023d3aa8d1ebb76e3 ******/
		%feature("compactdefaultargs") UpperLimitRoll;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns field UpperLimitRoll.
") UpperLimitRoll;
		double UpperLimitRoll();

		/****** StepKinematics_SphericalPairWithPinAndRange::UpperLimitYaw ******/
		/****** md5 signature: 12ad342e4668152baaf51178f6ceb979 ******/
		%feature("compactdefaultargs") UpperLimitYaw;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns field UpperLimitYaw.
") UpperLimitYaw;
		double UpperLimitYaw();

};


%make_alias(StepKinematics_SphericalPairWithPinAndRange)

%extend StepKinematics_SphericalPairWithPinAndRange {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************************************
* class StepKinematics_SphericalPairWithRange *
**********************************************/
class StepKinematics_SphericalPairWithRange : public StepKinematics_SphericalPair {
	public:
		/****** StepKinematics_SphericalPairWithRange::StepKinematics_SphericalPairWithRange ******/
		/****** md5 signature: 5e7015163fc67145e2afd7ccd534cf12 ******/
		%feature("compactdefaultargs") StepKinematics_SphericalPairWithRange;
		%feature("autodoc", "Return
-------
None

Description
-----------
default constructor.
") StepKinematics_SphericalPairWithRange;
		 StepKinematics_SphericalPairWithRange();

		/****** StepKinematics_SphericalPairWithRange::HasLowerLimitPitch ******/
		/****** md5 signature: 6d43ed7cbc282f1f36e1abcceac8b9a3 ******/
		%feature("compactdefaultargs") HasLowerLimitPitch;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if optional field LowerLimitPitch is defined.
") HasLowerLimitPitch;
		bool HasLowerLimitPitch();

		/****** StepKinematics_SphericalPairWithRange::HasLowerLimitRoll ******/
		/****** md5 signature: ca5faa9822f310a70436e725fc12a0f3 ******/
		%feature("compactdefaultargs") HasLowerLimitRoll;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if optional field LowerLimitRoll is defined.
") HasLowerLimitRoll;
		bool HasLowerLimitRoll();

		/****** StepKinematics_SphericalPairWithRange::HasLowerLimitYaw ******/
		/****** md5 signature: 219463b70b798e1f47adba6ad95d9904 ******/
		%feature("compactdefaultargs") HasLowerLimitYaw;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if optional field LowerLimitYaw is defined.
") HasLowerLimitYaw;
		bool HasLowerLimitYaw();

		/****** StepKinematics_SphericalPairWithRange::HasUpperLimitPitch ******/
		/****** md5 signature: 2118ce82483ae961ae68af18c65cd53f ******/
		%feature("compactdefaultargs") HasUpperLimitPitch;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if optional field UpperLimitPitch is defined.
") HasUpperLimitPitch;
		bool HasUpperLimitPitch();

		/****** StepKinematics_SphericalPairWithRange::HasUpperLimitRoll ******/
		/****** md5 signature: a8c65abdf50e8071fcc7aea0b5d64804 ******/
		%feature("compactdefaultargs") HasUpperLimitRoll;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if optional field UpperLimitRoll is defined.
") HasUpperLimitRoll;
		bool HasUpperLimitRoll();

		/****** StepKinematics_SphericalPairWithRange::HasUpperLimitYaw ******/
		/****** md5 signature: 42f8a46fe93adc270a7151e696fd787a ******/
		%feature("compactdefaultargs") HasUpperLimitYaw;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if optional field UpperLimitYaw is defined.
") HasUpperLimitYaw;
		bool HasUpperLimitYaw();

		/****** StepKinematics_SphericalPairWithRange::Init ******/
		/****** md5 signature: 6119829217443e027b7abd9d987575c8 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
theRepresentationItem_Name: TCollection_HAsciiString
theItemDefinedTransformation_Name: TCollection_HAsciiString
hasItemDefinedTransformation_Description: bool
theItemDefinedTransformation_Description: TCollection_HAsciiString
theItemDefinedTransformation_TransformItem1: StepRepr_RepresentationItem
theItemDefinedTransformation_TransformItem2: StepRepr_RepresentationItem
theKinematicPair_Joint: StepKinematics_KinematicJoint
theLowOrderKinematicPair_TX: bool
theLowOrderKinematicPair_TY: bool
theLowOrderKinematicPair_TZ: bool
theLowOrderKinematicPair_RX: bool
theLowOrderKinematicPair_RY: bool
theLowOrderKinematicPair_RZ: bool
hasLowerLimitYaw: bool
theLowerLimitYaw: double
hasUpperLimitYaw: bool
theUpperLimitYaw: double
hasLowerLimitPitch: bool
theLowerLimitPitch: double
hasUpperLimitPitch: bool
theUpperLimitPitch: double
hasLowerLimitRoll: bool
theLowerLimitRoll: double
hasUpperLimitRoll: bool
theUpperLimitRoll: double

Return
-------
None

Description
-----------
Initialize all fields (own and inherited).
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & theRepresentationItem_Name, const opencascade::handle<TCollection_HAsciiString> & theItemDefinedTransformation_Name, const bool hasItemDefinedTransformation_Description, const opencascade::handle<TCollection_HAsciiString> & theItemDefinedTransformation_Description, const opencascade::handle<StepRepr_RepresentationItem> & theItemDefinedTransformation_TransformItem1, const opencascade::handle<StepRepr_RepresentationItem> & theItemDefinedTransformation_TransformItem2, const opencascade::handle<StepKinematics_KinematicJoint> & theKinematicPair_Joint, const bool theLowOrderKinematicPair_TX, const bool theLowOrderKinematicPair_TY, const bool theLowOrderKinematicPair_TZ, const bool theLowOrderKinematicPair_RX, const bool theLowOrderKinematicPair_RY, const bool theLowOrderKinematicPair_RZ, const bool hasLowerLimitYaw, const double theLowerLimitYaw, const bool hasUpperLimitYaw, const double theUpperLimitYaw, const bool hasLowerLimitPitch, const double theLowerLimitPitch, const bool hasUpperLimitPitch, const double theUpperLimitPitch, const bool hasLowerLimitRoll, const double theLowerLimitRoll, const bool hasUpperLimitRoll, const double theUpperLimitRoll);

		/****** StepKinematics_SphericalPairWithRange::LowerLimitPitch ******/
		/****** md5 signature: 9448d6046b8a72af2b4a0636bf0c069c ******/
		%feature("compactdefaultargs") LowerLimitPitch;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns field LowerLimitPitch.
") LowerLimitPitch;
		double LowerLimitPitch();

		/****** StepKinematics_SphericalPairWithRange::LowerLimitRoll ******/
		/****** md5 signature: 71fbf50091a7bb49c13041b8ae9f2b0e ******/
		%feature("compactdefaultargs") LowerLimitRoll;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns field LowerLimitRoll.
") LowerLimitRoll;
		double LowerLimitRoll();

		/****** StepKinematics_SphericalPairWithRange::LowerLimitYaw ******/
		/****** md5 signature: 7794d2f5c79683c2b16a6c397a4fe9e1 ******/
		%feature("compactdefaultargs") LowerLimitYaw;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns field LowerLimitYaw.
") LowerLimitYaw;
		double LowerLimitYaw();

		/****** StepKinematics_SphericalPairWithRange::SetLowerLimitPitch ******/
		/****** md5 signature: dc9c0ff5c77d05942a6cbe8a0467ee1f ******/
		%feature("compactdefaultargs") SetLowerLimitPitch;
		%feature("autodoc", "
Parameters
----------
theLowerLimitPitch: double

Return
-------
None

Description
-----------
Sets field LowerLimitPitch.
") SetLowerLimitPitch;
		void SetLowerLimitPitch(const double theLowerLimitPitch);

		/****** StepKinematics_SphericalPairWithRange::SetLowerLimitRoll ******/
		/****** md5 signature: 2ef9f49685d52fffae39e5c5df9de000 ******/
		%feature("compactdefaultargs") SetLowerLimitRoll;
		%feature("autodoc", "
Parameters
----------
theLowerLimitRoll: double

Return
-------
None

Description
-----------
Sets field LowerLimitRoll.
") SetLowerLimitRoll;
		void SetLowerLimitRoll(const double theLowerLimitRoll);

		/****** StepKinematics_SphericalPairWithRange::SetLowerLimitYaw ******/
		/****** md5 signature: 14e2ac5bd88b6ecd40ca06b6ec0a6d01 ******/
		%feature("compactdefaultargs") SetLowerLimitYaw;
		%feature("autodoc", "
Parameters
----------
theLowerLimitYaw: double

Return
-------
None

Description
-----------
Sets field LowerLimitYaw.
") SetLowerLimitYaw;
		void SetLowerLimitYaw(const double theLowerLimitYaw);

		/****** StepKinematics_SphericalPairWithRange::SetUpperLimitPitch ******/
		/****** md5 signature: 74b41ae2e5b5c82f55d6d466be6ad41e ******/
		%feature("compactdefaultargs") SetUpperLimitPitch;
		%feature("autodoc", "
Parameters
----------
theUpperLimitPitch: double

Return
-------
None

Description
-----------
Sets field UpperLimitPitch.
") SetUpperLimitPitch;
		void SetUpperLimitPitch(const double theUpperLimitPitch);

		/****** StepKinematics_SphericalPairWithRange::SetUpperLimitRoll ******/
		/****** md5 signature: 3ce2b2db008923451005c1b6e1d9f2e8 ******/
		%feature("compactdefaultargs") SetUpperLimitRoll;
		%feature("autodoc", "
Parameters
----------
theUpperLimitRoll: double

Return
-------
None

Description
-----------
Sets field UpperLimitRoll.
") SetUpperLimitRoll;
		void SetUpperLimitRoll(const double theUpperLimitRoll);

		/****** StepKinematics_SphericalPairWithRange::SetUpperLimitYaw ******/
		/****** md5 signature: ee3f15a0330535670700456654ca0ce1 ******/
		%feature("compactdefaultargs") SetUpperLimitYaw;
		%feature("autodoc", "
Parameters
----------
theUpperLimitYaw: double

Return
-------
None

Description
-----------
Sets field UpperLimitYaw.
") SetUpperLimitYaw;
		void SetUpperLimitYaw(const double theUpperLimitYaw);

		/****** StepKinematics_SphericalPairWithRange::UpperLimitPitch ******/
		/****** md5 signature: 3c2d01afb0297abb175851be91c80d50 ******/
		%feature("compactdefaultargs") UpperLimitPitch;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns field UpperLimitPitch.
") UpperLimitPitch;
		double UpperLimitPitch();

		/****** StepKinematics_SphericalPairWithRange::UpperLimitRoll ******/
		/****** md5 signature: 82141a03599bd38023d3aa8d1ebb76e3 ******/
		%feature("compactdefaultargs") UpperLimitRoll;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns field UpperLimitRoll.
") UpperLimitRoll;
		double UpperLimitRoll();

		/****** StepKinematics_SphericalPairWithRange::UpperLimitYaw ******/
		/****** md5 signature: 12ad342e4668152baaf51178f6ceb979 ******/
		%feature("compactdefaultargs") UpperLimitYaw;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns field UpperLimitYaw.
") UpperLimitYaw;
		double UpperLimitYaw();

};


%make_alias(StepKinematics_SphericalPairWithRange)

%extend StepKinematics_SphericalPairWithRange {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************************
* class StepKinematics_SurfacePairWithRange *
********************************************/
class StepKinematics_SurfacePairWithRange : public StepKinematics_SurfacePair {
	public:
		/****** StepKinematics_SurfacePairWithRange::StepKinematics_SurfacePairWithRange ******/
		/****** md5 signature: 1ff85a30dac5393d7639a5530a9454ae ******/
		%feature("compactdefaultargs") StepKinematics_SurfacePairWithRange;
		%feature("autodoc", "Return
-------
None

Description
-----------
default constructor.
") StepKinematics_SurfacePairWithRange;
		 StepKinematics_SurfacePairWithRange();

		/****** StepKinematics_SurfacePairWithRange::HasLowerLimitActualRotation ******/
		/****** md5 signature: 9b40ef4d811e858876d345f940d9308d ******/
		%feature("compactdefaultargs") HasLowerLimitActualRotation;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if optional field LowerLimitActualRotation is defined.
") HasLowerLimitActualRotation;
		bool HasLowerLimitActualRotation();

		/****** StepKinematics_SurfacePairWithRange::HasUpperLimitActualRotation ******/
		/****** md5 signature: 7517dce8b477eb9f38355f00b58abdf5 ******/
		%feature("compactdefaultargs") HasUpperLimitActualRotation;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if optional field UpperLimitActualRotation is defined.
") HasUpperLimitActualRotation;
		bool HasUpperLimitActualRotation();

		/****** StepKinematics_SurfacePairWithRange::Init ******/
		/****** md5 signature: d7bac5b4193d8d558502f7e06d97c823 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
theRepresentationItem_Name: TCollection_HAsciiString
theItemDefinedTransformation_Name: TCollection_HAsciiString
hasItemDefinedTransformation_Description: bool
theItemDefinedTransformation_Description: TCollection_HAsciiString
theItemDefinedTransformation_TransformItem1: StepRepr_RepresentationItem
theItemDefinedTransformation_TransformItem2: StepRepr_RepresentationItem
theKinematicPair_Joint: StepKinematics_KinematicJoint
theSurfacePair_Surface1: StepGeom_Surface
theSurfacePair_Surface2: StepGeom_Surface
theSurfacePair_Orientation: bool
theRangeOnSurface1: StepGeom_RectangularTrimmedSurface
theRangeOnSurface2: StepGeom_RectangularTrimmedSurface
hasLowerLimitActualRotation: bool
theLowerLimitActualRotation: double
hasUpperLimitActualRotation: bool
theUpperLimitActualRotation: double

Return
-------
None

Description
-----------
Initialize all fields (own and inherited).
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & theRepresentationItem_Name, const opencascade::handle<TCollection_HAsciiString> & theItemDefinedTransformation_Name, const bool hasItemDefinedTransformation_Description, const opencascade::handle<TCollection_HAsciiString> & theItemDefinedTransformation_Description, const opencascade::handle<StepRepr_RepresentationItem> & theItemDefinedTransformation_TransformItem1, const opencascade::handle<StepRepr_RepresentationItem> & theItemDefinedTransformation_TransformItem2, const opencascade::handle<StepKinematics_KinematicJoint> & theKinematicPair_Joint, const opencascade::handle<StepGeom_Surface> & theSurfacePair_Surface1, const opencascade::handle<StepGeom_Surface> & theSurfacePair_Surface2, const bool theSurfacePair_Orientation, const opencascade::handle<StepGeom_RectangularTrimmedSurface> & theRangeOnSurface1, const opencascade::handle<StepGeom_RectangularTrimmedSurface> & theRangeOnSurface2, const bool hasLowerLimitActualRotation, const double theLowerLimitActualRotation, const bool hasUpperLimitActualRotation, const double theUpperLimitActualRotation);

		/****** StepKinematics_SurfacePairWithRange::LowerLimitActualRotation ******/
		/****** md5 signature: 750f030b56d0246174629d8de2795657 ******/
		%feature("compactdefaultargs") LowerLimitActualRotation;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns field LowerLimitActualRotation.
") LowerLimitActualRotation;
		double LowerLimitActualRotation();

		/****** StepKinematics_SurfacePairWithRange::RangeOnSurface1 ******/
		/****** md5 signature: 0ae008823cd38eac4d98f999364d53fa ******/
		%feature("compactdefaultargs") RangeOnSurface1;
		%feature("autodoc", "Return
-------
opencascade::handle<StepGeom_RectangularTrimmedSurface>

Description
-----------
Returns field RangeOnSurface1.
") RangeOnSurface1;
		opencascade::handle<StepGeom_RectangularTrimmedSurface> RangeOnSurface1();

		/****** StepKinematics_SurfacePairWithRange::RangeOnSurface2 ******/
		/****** md5 signature: bba27a74aac1eb0bac2f13703c5e962d ******/
		%feature("compactdefaultargs") RangeOnSurface2;
		%feature("autodoc", "Return
-------
opencascade::handle<StepGeom_RectangularTrimmedSurface>

Description
-----------
Returns field RangeOnSurface2.
") RangeOnSurface2;
		opencascade::handle<StepGeom_RectangularTrimmedSurface> RangeOnSurface2();

		/****** StepKinematics_SurfacePairWithRange::SetLowerLimitActualRotation ******/
		/****** md5 signature: 70f1515555184a7396c24823a25ea752 ******/
		%feature("compactdefaultargs") SetLowerLimitActualRotation;
		%feature("autodoc", "
Parameters
----------
theLowerLimitActualRotation: double

Return
-------
None

Description
-----------
Sets field LowerLimitActualRotation.
") SetLowerLimitActualRotation;
		void SetLowerLimitActualRotation(const double theLowerLimitActualRotation);

		/****** StepKinematics_SurfacePairWithRange::SetRangeOnSurface1 ******/
		/****** md5 signature: 7786edccd7ba32e1d2a177f5abb0584b ******/
		%feature("compactdefaultargs") SetRangeOnSurface1;
		%feature("autodoc", "
Parameters
----------
theRangeOnSurface1: StepGeom_RectangularTrimmedSurface

Return
-------
None

Description
-----------
Sets field RangeOnSurface1.
") SetRangeOnSurface1;
		void SetRangeOnSurface1(const opencascade::handle<StepGeom_RectangularTrimmedSurface> & theRangeOnSurface1);

		/****** StepKinematics_SurfacePairWithRange::SetRangeOnSurface2 ******/
		/****** md5 signature: d6e39b85fb1f72643a884513420cefbf ******/
		%feature("compactdefaultargs") SetRangeOnSurface2;
		%feature("autodoc", "
Parameters
----------
theRangeOnSurface2: StepGeom_RectangularTrimmedSurface

Return
-------
None

Description
-----------
Sets field RangeOnSurface2.
") SetRangeOnSurface2;
		void SetRangeOnSurface2(const opencascade::handle<StepGeom_RectangularTrimmedSurface> & theRangeOnSurface2);

		/****** StepKinematics_SurfacePairWithRange::SetUpperLimitActualRotation ******/
		/****** md5 signature: 14bfde518bb812ed770905cb2005aba3 ******/
		%feature("compactdefaultargs") SetUpperLimitActualRotation;
		%feature("autodoc", "
Parameters
----------
theUpperLimitActualRotation: double

Return
-------
None

Description
-----------
Sets field UpperLimitActualRotation.
") SetUpperLimitActualRotation;
		void SetUpperLimitActualRotation(const double theUpperLimitActualRotation);

		/****** StepKinematics_SurfacePairWithRange::UpperLimitActualRotation ******/
		/****** md5 signature: 0110541df2ed6cb73390dbd871578ac5 ******/
		%feature("compactdefaultargs") UpperLimitActualRotation;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns field UpperLimitActualRotation.
") UpperLimitActualRotation;
		double UpperLimitActualRotation();

};


%make_alias(StepKinematics_SurfacePairWithRange)

%extend StepKinematics_SurfacePairWithRange {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************************************
* class StepKinematics_UniversalPairWithRange *
**********************************************/
class StepKinematics_UniversalPairWithRange : public StepKinematics_UniversalPair {
	public:
		/****** StepKinematics_UniversalPairWithRange::StepKinematics_UniversalPairWithRange ******/
		/****** md5 signature: 4538b259330389e2da9670648e4f427f ******/
		%feature("compactdefaultargs") StepKinematics_UniversalPairWithRange;
		%feature("autodoc", "Return
-------
None

Description
-----------
default constructor.
") StepKinematics_UniversalPairWithRange;
		 StepKinematics_UniversalPairWithRange();

		/****** StepKinematics_UniversalPairWithRange::HasLowerLimitFirstRotation ******/
		/****** md5 signature: 29bebf52830b4ba69cee1be785490034 ******/
		%feature("compactdefaultargs") HasLowerLimitFirstRotation;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if optional field LowerLimitFirstRotation is defined.
") HasLowerLimitFirstRotation;
		bool HasLowerLimitFirstRotation();

		/****** StepKinematics_UniversalPairWithRange::HasLowerLimitSecondRotation ******/
		/****** md5 signature: fed71306b6298e457065fbac270c7eed ******/
		%feature("compactdefaultargs") HasLowerLimitSecondRotation;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if optional field LowerLimitSecondRotation is defined.
") HasLowerLimitSecondRotation;
		bool HasLowerLimitSecondRotation();

		/****** StepKinematics_UniversalPairWithRange::HasUpperLimitFirstRotation ******/
		/****** md5 signature: 561a4be62d9e6ee0f9f78d488548e017 ******/
		%feature("compactdefaultargs") HasUpperLimitFirstRotation;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if optional field UpperLimitFirstRotation is defined.
") HasUpperLimitFirstRotation;
		bool HasUpperLimitFirstRotation();

		/****** StepKinematics_UniversalPairWithRange::HasUpperLimitSecondRotation ******/
		/****** md5 signature: 74285667b35035c2d955297e69987a6f ******/
		%feature("compactdefaultargs") HasUpperLimitSecondRotation;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if optional field UpperLimitSecondRotation is defined.
") HasUpperLimitSecondRotation;
		bool HasUpperLimitSecondRotation();

		/****** StepKinematics_UniversalPairWithRange::Init ******/
		/****** md5 signature: 4626a7bf84cd41608bd876201088e540 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
theRepresentationItem_Name: TCollection_HAsciiString
theItemDefinedTransformation_Name: TCollection_HAsciiString
hasItemDefinedTransformation_Description: bool
theItemDefinedTransformation_Description: TCollection_HAsciiString
theItemDefinedTransformation_TransformItem1: StepRepr_RepresentationItem
theItemDefinedTransformation_TransformItem2: StepRepr_RepresentationItem
theKinematicPair_Joint: StepKinematics_KinematicJoint
theLowOrderKinematicPair_TX: bool
theLowOrderKinematicPair_TY: bool
theLowOrderKinematicPair_TZ: bool
theLowOrderKinematicPair_RX: bool
theLowOrderKinematicPair_RY: bool
theLowOrderKinematicPair_RZ: bool
hasUniversalPair_InputSkewAngle: bool
theUniversalPair_InputSkewAngle: double
hasLowerLimitFirstRotation: bool
theLowerLimitFirstRotation: double
hasUpperLimitFirstRotation: bool
theUpperLimitFirstRotation: double
hasLowerLimitSecondRotation: bool
theLowerLimitSecondRotation: double
hasUpperLimitSecondRotation: bool
theUpperLimitSecondRotation: double

Return
-------
None

Description
-----------
Initialize all fields (own and inherited).
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & theRepresentationItem_Name, const opencascade::handle<TCollection_HAsciiString> & theItemDefinedTransformation_Name, const bool hasItemDefinedTransformation_Description, const opencascade::handle<TCollection_HAsciiString> & theItemDefinedTransformation_Description, const opencascade::handle<StepRepr_RepresentationItem> & theItemDefinedTransformation_TransformItem1, const opencascade::handle<StepRepr_RepresentationItem> & theItemDefinedTransformation_TransformItem2, const opencascade::handle<StepKinematics_KinematicJoint> & theKinematicPair_Joint, const bool theLowOrderKinematicPair_TX, const bool theLowOrderKinematicPair_TY, const bool theLowOrderKinematicPair_TZ, const bool theLowOrderKinematicPair_RX, const bool theLowOrderKinematicPair_RY, const bool theLowOrderKinematicPair_RZ, const bool hasUniversalPair_InputSkewAngle, const double theUniversalPair_InputSkewAngle, const bool hasLowerLimitFirstRotation, const double theLowerLimitFirstRotation, const bool hasUpperLimitFirstRotation, const double theUpperLimitFirstRotation, const bool hasLowerLimitSecondRotation, const double theLowerLimitSecondRotation, const bool hasUpperLimitSecondRotation, const double theUpperLimitSecondRotation);

		/****** StepKinematics_UniversalPairWithRange::LowerLimitFirstRotation ******/
		/****** md5 signature: b6661ca8dafdd17b4b1711bdad24a166 ******/
		%feature("compactdefaultargs") LowerLimitFirstRotation;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns field LowerLimitFirstRotation.
") LowerLimitFirstRotation;
		double LowerLimitFirstRotation();

		/****** StepKinematics_UniversalPairWithRange::LowerLimitSecondRotation ******/
		/****** md5 signature: 4bcbeb801f0ffed407b2d17edcecd65a ******/
		%feature("compactdefaultargs") LowerLimitSecondRotation;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns field LowerLimitSecondRotation.
") LowerLimitSecondRotation;
		double LowerLimitSecondRotation();

		/****** StepKinematics_UniversalPairWithRange::SetLowerLimitFirstRotation ******/
		/****** md5 signature: 87e7d3d9c9eae1bc9fce073b9baf6c25 ******/
		%feature("compactdefaultargs") SetLowerLimitFirstRotation;
		%feature("autodoc", "
Parameters
----------
theLowerLimitFirstRotation: double

Return
-------
None

Description
-----------
Sets field LowerLimitFirstRotation.
") SetLowerLimitFirstRotation;
		void SetLowerLimitFirstRotation(const double theLowerLimitFirstRotation);

		/****** StepKinematics_UniversalPairWithRange::SetLowerLimitSecondRotation ******/
		/****** md5 signature: 5b254854bafd6bd0f8361ebe1a764409 ******/
		%feature("compactdefaultargs") SetLowerLimitSecondRotation;
		%feature("autodoc", "
Parameters
----------
theLowerLimitSecondRotation: double

Return
-------
None

Description
-----------
Sets field LowerLimitSecondRotation.
") SetLowerLimitSecondRotation;
		void SetLowerLimitSecondRotation(const double theLowerLimitSecondRotation);

		/****** StepKinematics_UniversalPairWithRange::SetUpperLimitFirstRotation ******/
		/****** md5 signature: 577102c1cd7b14aa434e4860fc92a39e ******/
		%feature("compactdefaultargs") SetUpperLimitFirstRotation;
		%feature("autodoc", "
Parameters
----------
theUpperLimitFirstRotation: double

Return
-------
None

Description
-----------
Sets field UpperLimitFirstRotation.
") SetUpperLimitFirstRotation;
		void SetUpperLimitFirstRotation(const double theUpperLimitFirstRotation);

		/****** StepKinematics_UniversalPairWithRange::SetUpperLimitSecondRotation ******/
		/****** md5 signature: 7218699bb7b39c77eb0f7f70879f9e79 ******/
		%feature("compactdefaultargs") SetUpperLimitSecondRotation;
		%feature("autodoc", "
Parameters
----------
theUpperLimitSecondRotation: double

Return
-------
None

Description
-----------
Sets field UpperLimitSecondRotation.
") SetUpperLimitSecondRotation;
		void SetUpperLimitSecondRotation(const double theUpperLimitSecondRotation);

		/****** StepKinematics_UniversalPairWithRange::UpperLimitFirstRotation ******/
		/****** md5 signature: 34259fddda317e4896114ded1bb32de4 ******/
		%feature("compactdefaultargs") UpperLimitFirstRotation;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns field UpperLimitFirstRotation.
") UpperLimitFirstRotation;
		double UpperLimitFirstRotation();

		/****** StepKinematics_UniversalPairWithRange::UpperLimitSecondRotation ******/
		/****** md5 signature: 1dde3687e65040c341b6b98f69aae8d2 ******/
		%feature("compactdefaultargs") UpperLimitSecondRotation;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns field UpperLimitSecondRotation.
") UpperLimitSecondRotation;
		double UpperLimitSecondRotation();

};


%make_alias(StepKinematics_UniversalPairWithRange)

%extend StepKinematics_UniversalPairWithRange {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/* harray1 classes */
/* harray2 classes */
/* hsequence classes */
/* class aliases */
%pythoncode {
}
