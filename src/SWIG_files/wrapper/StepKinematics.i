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
%define STEPKINEMATICSDOCSTRING
"StepKinematics module, see official documentation at
https://www.opencascade.com/doc/occt-7.6.0/refman/html/package_stepkinematics.html"
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
#include<TopoDS_module.hxx>
#include<StepBasic_module.hxx>
#include<Interface_module.hxx>
#include<MoniTool_module.hxx>
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
		/****************** StepKinematics_ContextDependentKinematicLinkRepresentation ******************/
		/**** md5 signature: 92fd4868cbb3efd7da3ca7a0d6e2f92d ****/
		%feature("compactdefaultargs") StepKinematics_ContextDependentKinematicLinkRepresentation;
		%feature("autodoc", "Default constructor.

Returns
-------
None
") StepKinematics_ContextDependentKinematicLinkRepresentation;
		 StepKinematics_ContextDependentKinematicLinkRepresentation();

		/****************** Init ******************/
		/**** md5 signature: 95c0b211c65c5c7c222623c010b65242 ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Initialize all fields (own and inherited).

Parameters
----------
theRepresentationRelation: StepKinematics_KinematicLinkRepresentationAssociation
theRepresentedProductRelation: StepKinematics_ProductDefinitionRelationshipKinematics

Returns
-------
None
") Init;
		void Init(const opencascade::handle<StepKinematics_KinematicLinkRepresentationAssociation> & theRepresentationRelation, const opencascade::handle<StepKinematics_ProductDefinitionRelationshipKinematics> & theRepresentedProductRelation);

		/****************** RepresentationRelation ******************/
		/**** md5 signature: 6425d79fca67984922e06816d68741f0 ****/
		%feature("compactdefaultargs") RepresentationRelation;
		%feature("autodoc", "Returns field representationrelation.

Returns
-------
opencascade::handle<StepKinematics_KinematicLinkRepresentationAssociation>
") RepresentationRelation;
		opencascade::handle<StepKinematics_KinematicLinkRepresentationAssociation> RepresentationRelation();

		/****************** RepresentedProductRelation ******************/
		/**** md5 signature: 11fb34b6e103b32e2141fd003591655a ****/
		%feature("compactdefaultargs") RepresentedProductRelation;
		%feature("autodoc", "Returns field representedproductrelation.

Returns
-------
opencascade::handle<StepKinematics_ProductDefinitionRelationshipKinematics>
") RepresentedProductRelation;
		opencascade::handle<StepKinematics_ProductDefinitionRelationshipKinematics> RepresentedProductRelation();

		/****************** SetRepresentationRelation ******************/
		/**** md5 signature: b13fa332347bac3a14690fef4ee07997 ****/
		%feature("compactdefaultargs") SetRepresentationRelation;
		%feature("autodoc", "Sets field representationrelation.

Parameters
----------
theRepresentationRelation: StepKinematics_KinematicLinkRepresentationAssociation

Returns
-------
None
") SetRepresentationRelation;
		void SetRepresentationRelation(const opencascade::handle<StepKinematics_KinematicLinkRepresentationAssociation> & theRepresentationRelation);

		/****************** SetRepresentedProductRelation ******************/
		/**** md5 signature: 0e8e4cdcaee73443967d920d4eb7cd31 ****/
		%feature("compactdefaultargs") SetRepresentedProductRelation;
		%feature("autodoc", "Sets field representedproductrelation.

Parameters
----------
theRepresentedProductRelation: StepKinematics_ProductDefinitionRelationshipKinematics

Returns
-------
None
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
		/****************** StepKinematics_KinematicJoint ******************/
		/**** md5 signature: 499e0bdc6099b307892187ba4ec4dc9e ****/
		%feature("compactdefaultargs") StepKinematics_KinematicJoint;
		%feature("autodoc", "Default constructor.

Returns
-------
None
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
		/****************** StepKinematics_KinematicLink ******************/
		/**** md5 signature: 5be2cd18b69c5e4ba1de0dbf9e7e61f2 ****/
		%feature("compactdefaultargs") StepKinematics_KinematicLink;
		%feature("autodoc", "Default constructor.

Returns
-------
None
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
		/****************** StepKinematics_KinematicLinkRepresentation ******************/
		/**** md5 signature: 7371208c3f06377e718de0c3477c6a29 ****/
		%feature("compactdefaultargs") StepKinematics_KinematicLinkRepresentation;
		%feature("autodoc", "Default constructor.

Returns
-------
None
") StepKinematics_KinematicLinkRepresentation;
		 StepKinematics_KinematicLinkRepresentation();

		/****************** Init ******************/
		/**** md5 signature: b306696f2f93c8b0084e8f60b447ff7d ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Initialize all fields (own and inherited).

Parameters
----------
theRepresentation_Name: TCollection_HAsciiString
theRepresentation_Items: StepRepr_HArray1OfRepresentationItem
theRepresentation_ContextOfItems: StepRepr_RepresentationContext
theRepresentedLink: StepKinematics_KinematicLink

Returns
-------
None
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & theRepresentation_Name, const opencascade::handle<StepRepr_HArray1OfRepresentationItem> & theRepresentation_Items, const opencascade::handle<StepRepr_RepresentationContext> & theRepresentation_ContextOfItems, const opencascade::handle<StepKinematics_KinematicLink> & theRepresentedLink);

		/****************** RepresentedLink ******************/
		/**** md5 signature: de6c35595b3640206535a9be7e9d6835 ****/
		%feature("compactdefaultargs") RepresentedLink;
		%feature("autodoc", "Returns field representedlink.

Returns
-------
opencascade::handle<StepKinematics_KinematicLink>
") RepresentedLink;
		opencascade::handle<StepKinematics_KinematicLink> RepresentedLink();

		/****************** SetRepresentedLink ******************/
		/**** md5 signature: a27d50a0ef8df6e5b6bf36485a62ba75 ****/
		%feature("compactdefaultargs") SetRepresentedLink;
		%feature("autodoc", "Sets field representedlink.

Parameters
----------
theRepresentedLink: StepKinematics_KinematicLink

Returns
-------
None
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
		/****************** StepKinematics_KinematicLinkRepresentationAssociation ******************/
		/**** md5 signature: 91d1d0d548f27fc708b76801c26efd31 ****/
		%feature("compactdefaultargs") StepKinematics_KinematicLinkRepresentationAssociation;
		%feature("autodoc", "Default constructor.

Returns
-------
None
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
		/****************** StepKinematics_KinematicPair ******************/
		/**** md5 signature: a922f5ee6bcec27e24cca298094ce171 ****/
		%feature("compactdefaultargs") StepKinematics_KinematicPair;
		%feature("autodoc", "Default constructor.

Returns
-------
None
") StepKinematics_KinematicPair;
		 StepKinematics_KinematicPair();

		/****************** Init ******************/
		/**** md5 signature: 6cb70cdc5c87dbaec236f1f1e1a6acbc ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Initialize all fields (own and inherited).

Parameters
----------
theRepresentationItem_Name: TCollection_HAsciiString
theItemDefinedTransformation_Name: TCollection_HAsciiString
hasItemDefinedTransformation_Description: bool
theItemDefinedTransformation_Description: TCollection_HAsciiString
theItemDefinedTransformation_TransformItem1: StepRepr_RepresentationItem
theItemDefinedTransformation_TransformItem2: StepRepr_RepresentationItem
theJoint: StepKinematics_KinematicJoint

Returns
-------
None
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & theRepresentationItem_Name, const opencascade::handle<TCollection_HAsciiString> & theItemDefinedTransformation_Name, const Standard_Boolean hasItemDefinedTransformation_Description, const opencascade::handle<TCollection_HAsciiString> & theItemDefinedTransformation_Description, const opencascade::handle<StepRepr_RepresentationItem> & theItemDefinedTransformation_TransformItem1, const opencascade::handle<StepRepr_RepresentationItem> & theItemDefinedTransformation_TransformItem2, const opencascade::handle<StepKinematics_KinematicJoint> & theJoint);

		/****************** ItemDefinedTransformation ******************/
		/**** md5 signature: 1ecfef967c45a22eea8d75f88475bd67 ****/
		%feature("compactdefaultargs") ItemDefinedTransformation;
		%feature("autodoc", "Returns data for supertype itemdefinedtransformation.

Returns
-------
opencascade::handle<StepRepr_ItemDefinedTransformation>
") ItemDefinedTransformation;
		opencascade::handle<StepRepr_ItemDefinedTransformation> ItemDefinedTransformation();

		/****************** Joint ******************/
		/**** md5 signature: d37d3cceaa15fd4dc3d26b0dcd4bd3c4 ****/
		%feature("compactdefaultargs") Joint;
		%feature("autodoc", "Returns field joint.

Returns
-------
opencascade::handle<StepKinematics_KinematicJoint>
") Joint;
		opencascade::handle<StepKinematics_KinematicJoint> Joint();

		/****************** SetItemDefinedTransformation ******************/
		/**** md5 signature: e1075034b28e5f8412a47c465b8ce1fe ****/
		%feature("compactdefaultargs") SetItemDefinedTransformation;
		%feature("autodoc", "Sets data for supertype itemdefinedtransformation.

Parameters
----------
theItemDefinedTransformation: StepRepr_ItemDefinedTransformation

Returns
-------
None
") SetItemDefinedTransformation;
		void SetItemDefinedTransformation(const opencascade::handle<StepRepr_ItemDefinedTransformation> & theItemDefinedTransformation);

		/****************** SetJoint ******************/
		/**** md5 signature: cc96eaa7f2470dab20578cada8a550aa ****/
		%feature("compactdefaultargs") SetJoint;
		%feature("autodoc", "Sets field joint.

Parameters
----------
theJoint: StepKinematics_KinematicJoint

Returns
-------
None
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
		/****************** StepKinematics_KinematicPropertyDefinitionRepresentation ******************/
		/**** md5 signature: e762629674bb86a4d8ed2a053e818548 ****/
		%feature("compactdefaultargs") StepKinematics_KinematicPropertyDefinitionRepresentation;
		%feature("autodoc", "Default constructor.

Returns
-------
None
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
		/****************** StepKinematics_KinematicTopologyDirectedStructure ******************/
		/**** md5 signature: ab26c69007457dea0f7f32a541993915 ****/
		%feature("compactdefaultargs") StepKinematics_KinematicTopologyDirectedStructure;
		%feature("autodoc", "Default constructor.

Returns
-------
None
") StepKinematics_KinematicTopologyDirectedStructure;
		 StepKinematics_KinematicTopologyDirectedStructure();

		/****************** Init ******************/
		/**** md5 signature: 4c96fcc935067c197b0a34649f803bbd ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Initialize all fields (own and inherited).

Parameters
----------
theRepresentation_Name: TCollection_HAsciiString
theRepresentation_Items: StepRepr_HArray1OfRepresentationItem
theRepresentation_ContextOfItems: StepRepr_RepresentationContext
theParent: StepKinematics_KinematicTopologyStructure

Returns
-------
None
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & theRepresentation_Name, const opencascade::handle<StepRepr_HArray1OfRepresentationItem> & theRepresentation_Items, const opencascade::handle<StepRepr_RepresentationContext> & theRepresentation_ContextOfItems, const opencascade::handle<StepKinematics_KinematicTopologyStructure> & theParent);

		/****************** Parent ******************/
		/**** md5 signature: 7e9d5155e4e641596ce641fe8a5914e1 ****/
		%feature("compactdefaultargs") Parent;
		%feature("autodoc", "Returns field parent.

Returns
-------
opencascade::handle<StepKinematics_KinematicTopologyStructure>
") Parent;
		opencascade::handle<StepKinematics_KinematicTopologyStructure> Parent();

		/****************** SetParent ******************/
		/**** md5 signature: da015f5ff8af460f0b7d1b10fdad4e8f ****/
		%feature("compactdefaultargs") SetParent;
		%feature("autodoc", "Sets field parent.

Parameters
----------
theParent: StepKinematics_KinematicTopologyStructure

Returns
-------
None
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
		/****************** StepKinematics_KinematicTopologyNetworkStructure ******************/
		/**** md5 signature: e454e3edf4fd3182990aab7658846662 ****/
		%feature("compactdefaultargs") StepKinematics_KinematicTopologyNetworkStructure;
		%feature("autodoc", "Default constructor.

Returns
-------
None
") StepKinematics_KinematicTopologyNetworkStructure;
		 StepKinematics_KinematicTopologyNetworkStructure();

		/****************** Init ******************/
		/**** md5 signature: 4c96fcc935067c197b0a34649f803bbd ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Initialize all fields (own and inherited).

Parameters
----------
theRepresentation_Name: TCollection_HAsciiString
theRepresentation_Items: StepRepr_HArray1OfRepresentationItem
theRepresentation_ContextOfItems: StepRepr_RepresentationContext
theParent: StepKinematics_KinematicTopologyStructure

Returns
-------
None
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & theRepresentation_Name, const opencascade::handle<StepRepr_HArray1OfRepresentationItem> & theRepresentation_Items, const opencascade::handle<StepRepr_RepresentationContext> & theRepresentation_ContextOfItems, const opencascade::handle<StepKinematics_KinematicTopologyStructure> & theParent);

		/****************** Parent ******************/
		/**** md5 signature: 7e9d5155e4e641596ce641fe8a5914e1 ****/
		%feature("compactdefaultargs") Parent;
		%feature("autodoc", "Returns field parent.

Returns
-------
opencascade::handle<StepKinematics_KinematicTopologyStructure>
") Parent;
		opencascade::handle<StepKinematics_KinematicTopologyStructure> Parent();

		/****************** SetParent ******************/
		/**** md5 signature: da015f5ff8af460f0b7d1b10fdad4e8f ****/
		%feature("compactdefaultargs") SetParent;
		%feature("autodoc", "Sets field parent.

Parameters
----------
theParent: StepKinematics_KinematicTopologyStructure

Returns
-------
None
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
		/****************** StepKinematics_KinematicTopologyRepresentationSelect ******************/
		/**** md5 signature: 653595080e7ee77739798fa9ee9e1c75 ****/
		%feature("compactdefaultargs") StepKinematics_KinematicTopologyRepresentationSelect;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") StepKinematics_KinematicTopologyRepresentationSelect;
		 StepKinematics_KinematicTopologyRepresentationSelect();

		/****************** CaseNum ******************/
		/**** md5 signature: b9dbcdb5b972500c66bc8bc08f651d0a ****/
		%feature("compactdefaultargs") CaseNum;
		%feature("autodoc", "Recognizes a kind of kinematictopologyrepresentationselect select type -- 1 -> kinematictopologydirectedstructure -- 2 -> kinematictopologynetworkstructure -- 3 -> kinematictopologystructure.

Parameters
----------
ent: Standard_Transient

Returns
-------
int
") CaseNum;
		Standard_Integer CaseNum(const opencascade::handle<Standard_Transient> & ent);

		/****************** KinematicTopologyDirectedStructure ******************/
		/**** md5 signature: f059e783c310dfcd8744f89b9c69c043 ****/
		%feature("compactdefaultargs") KinematicTopologyDirectedStructure;
		%feature("autodoc", "Returns value as kinematictopologydirectedstructure (or null if another type).

Returns
-------
opencascade::handle<StepKinematics_KinematicTopologyDirectedStructure>
") KinematicTopologyDirectedStructure;
		opencascade::handle<StepKinematics_KinematicTopologyDirectedStructure> KinematicTopologyDirectedStructure();

		/****************** KinematicTopologyNetworkStructure ******************/
		/**** md5 signature: 255849e166768c473dd1574d756dda0a ****/
		%feature("compactdefaultargs") KinematicTopologyNetworkStructure;
		%feature("autodoc", "Returns value as kinematictopologynetworkstructure (or null if another type).

Returns
-------
opencascade::handle<StepKinematics_KinematicTopologyNetworkStructure>
") KinematicTopologyNetworkStructure;
		opencascade::handle<StepKinematics_KinematicTopologyNetworkStructure> KinematicTopologyNetworkStructure();

		/****************** KinematicTopologyStructure ******************/
		/**** md5 signature: 5b7acea2edd5fe944ba9d02a0f8d9e7b ****/
		%feature("compactdefaultargs") KinematicTopologyStructure;
		%feature("autodoc", "Returns value as kinematictopologystructure (or null if another type).

Returns
-------
opencascade::handle<StepKinematics_KinematicTopologyStructure>
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
		/****************** StepKinematics_KinematicTopologyStructure ******************/
		/**** md5 signature: 413cf69f4c44535d86507320cf08d013 ****/
		%feature("compactdefaultargs") StepKinematics_KinematicTopologyStructure;
		%feature("autodoc", "Default constructor.

Returns
-------
None
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
		/****************** StepKinematics_MechanismRepresentation ******************/
		/**** md5 signature: 99eeecffa393901a39b11105e16f5e25 ****/
		%feature("compactdefaultargs") StepKinematics_MechanismRepresentation;
		%feature("autodoc", "Default constructor.

Returns
-------
None
") StepKinematics_MechanismRepresentation;
		 StepKinematics_MechanismRepresentation();

		/****************** Init ******************/
		/**** md5 signature: f17df17fa57b69052554ca5cae19e048 ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Initialize all fields (own and inherited).

Parameters
----------
theRepresentation_Name: TCollection_HAsciiString
theRepresentation_Items: StepRepr_HArray1OfRepresentationItem
theRepresentation_ContextOfItems: StepRepr_RepresentationContext
theRepresentedTopology: StepKinematics_KinematicTopologyRepresentationSelect

Returns
-------
None
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & theRepresentation_Name, const opencascade::handle<StepRepr_HArray1OfRepresentationItem> & theRepresentation_Items, const opencascade::handle<StepRepr_RepresentationContext> & theRepresentation_ContextOfItems, const StepKinematics_KinematicTopologyRepresentationSelect & theRepresentedTopology);

		/****************** RepresentedTopology ******************/
		/**** md5 signature: d7649991f36b2e011cd22c8a30ed3fea ****/
		%feature("compactdefaultargs") RepresentedTopology;
		%feature("autodoc", "Returns field representedtopology.

Returns
-------
StepKinematics_KinematicTopologyRepresentationSelect
") RepresentedTopology;
		StepKinematics_KinematicTopologyRepresentationSelect RepresentedTopology();

		/****************** SetRepresentedTopology ******************/
		/**** md5 signature: a9404fefc732a5249ee00bc77e49b952 ****/
		%feature("compactdefaultargs") SetRepresentedTopology;
		%feature("autodoc", "Sets field representedtopology.

Parameters
----------
theRepresentedTopology: StepKinematics_KinematicTopologyRepresentationSelect

Returns
-------
None
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
		/****************** StepKinematics_MechanismStateRepresentation ******************/
		/**** md5 signature: 3c85998159e10e47c40c6502ef414bc7 ****/
		%feature("compactdefaultargs") StepKinematics_MechanismStateRepresentation;
		%feature("autodoc", "Returns a mechanismstaterepresentation.

Returns
-------
None
") StepKinematics_MechanismStateRepresentation;
		 StepKinematics_MechanismStateRepresentation();

		/****************** Init ******************/
		/**** md5 signature: 1665ccd453dd3b65e3933e256349ae53 ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Parameters
----------
theName: TCollection_HAsciiString
theItems: StepRepr_HArray1OfRepresentationItem
theContextOfItems: StepRepr_RepresentationContext
theMechanism: StepKinematics_MechanismRepresentation

Returns
-------
None
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & theName, const opencascade::handle<StepRepr_HArray1OfRepresentationItem> & theItems, const opencascade::handle<StepRepr_RepresentationContext> & theContextOfItems, const opencascade::handle<StepKinematics_MechanismRepresentation> theMechanism);

		/****************** Mechanism ******************/
		/**** md5 signature: 08cdf7021078a7d81a012290f38d9d95 ****/
		%feature("compactdefaultargs") Mechanism;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepKinematics_MechanismRepresentation>
") Mechanism;
		opencascade::handle<StepKinematics_MechanismRepresentation> Mechanism();

		/****************** SetMechanism ******************/
		/**** md5 signature: b744534a154c6936cd7675bc52c850b1 ****/
		%feature("compactdefaultargs") SetMechanism;
		%feature("autodoc", "No available documentation.

Parameters
----------
theMechanism: StepKinematics_MechanismRepresentation

Returns
-------
None
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
		/****************** StepKinematics_OrientedJoint ******************/
		/**** md5 signature: dbd54e0d1a64f4d399a75ebdbe7edd11 ****/
		%feature("compactdefaultargs") StepKinematics_OrientedJoint;
		%feature("autodoc", "Default constructor.

Returns
-------
None
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
		/****************** StepKinematics_PairRepresentationRelationship ******************/
		/**** md5 signature: 8dddd91eb2df2219e5179d7f5aa5c599 ****/
		%feature("compactdefaultargs") StepKinematics_PairRepresentationRelationship;
		%feature("autodoc", "Default constructor.

Returns
-------
None
") StepKinematics_PairRepresentationRelationship;
		 StepKinematics_PairRepresentationRelationship();

		/****************** Init ******************/
		/**** md5 signature: 271c9f7c04dd398902a990f55fdc22ad ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Initialize all fields (own and inherited).

Parameters
----------
theRepresentationItem_Name: TCollection_HAsciiString
theRepresentationRelationship_Name: TCollection_HAsciiString
hasRepresentationRelationship_Description: bool
theRepresentationRelationship_Description: TCollection_HAsciiString
theRepresentationRelationship_Rep1: StepRepr_RepresentationOrRepresentationReference
theRepresentationRelationship_Rep2: StepRepr_RepresentationOrRepresentationReference
theRepresentationRelationshipWithTransformation_TransformationOperator: StepRepr_Transformation

Returns
-------
None
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & theRepresentationItem_Name, const opencascade::handle<TCollection_HAsciiString> & theRepresentationRelationship_Name, const Standard_Boolean hasRepresentationRelationship_Description, const opencascade::handle<TCollection_HAsciiString> & theRepresentationRelationship_Description, const StepRepr_RepresentationOrRepresentationReference & theRepresentationRelationship_Rep1, const StepRepr_RepresentationOrRepresentationReference & theRepresentationRelationship_Rep2, const StepRepr_Transformation & theRepresentationRelationshipWithTransformation_TransformationOperator);

		/****************** RepresentationRelationshipWithTransformation ******************/
		/**** md5 signature: 1dd95ee62d38b1f54c88a5987d608621 ****/
		%feature("compactdefaultargs") RepresentationRelationshipWithTransformation;
		%feature("autodoc", "Returns data for supertype representationrelationshipwithtransformation.

Returns
-------
opencascade::handle<StepRepr_RepresentationRelationshipWithTransformation>
") RepresentationRelationshipWithTransformation;
		opencascade::handle<StepRepr_RepresentationRelationshipWithTransformation> RepresentationRelationshipWithTransformation();

		/****************** SetRepresentationRelationshipWithTransformation ******************/
		/**** md5 signature: 6e403389fd1e11df4117ef69b3aeb548 ****/
		%feature("compactdefaultargs") SetRepresentationRelationshipWithTransformation;
		%feature("autodoc", "Sets data for supertype representationrelationshipwithtransformation.

Parameters
----------
theRepresentationRelationshipWithTransformation: StepRepr_RepresentationRelationshipWithTransformation

Returns
-------
None
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
		/****************** StepKinematics_PairValue ******************/
		/**** md5 signature: 3f6aededbed1d15db27959ee3e6bd0f2 ****/
		%feature("compactdefaultargs") StepKinematics_PairValue;
		%feature("autodoc", "Default constructor.

Returns
-------
None
") StepKinematics_PairValue;
		 StepKinematics_PairValue();

		/****************** AppliesToPair ******************/
		/**** md5 signature: 9b37dec41d548cc22b0d30df0a280568 ****/
		%feature("compactdefaultargs") AppliesToPair;
		%feature("autodoc", "Returns field appliestopair.

Returns
-------
opencascade::handle<StepKinematics_KinematicPair>
") AppliesToPair;
		opencascade::handle<StepKinematics_KinematicPair> AppliesToPair();

		/****************** Init ******************/
		/**** md5 signature: bf4f047709cf9164e02406b50d4a3f02 ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Initialize all fields (own and inherited).

Parameters
----------
theRepresentationItem_Name: TCollection_HAsciiString
theAppliesToPair: StepKinematics_KinematicPair

Returns
-------
None
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & theRepresentationItem_Name, const opencascade::handle<StepKinematics_KinematicPair> & theAppliesToPair);

		/****************** SetAppliesToPair ******************/
		/**** md5 signature: f153a486ba6e521c43f9fdacda905263 ****/
		%feature("compactdefaultargs") SetAppliesToPair;
		%feature("autodoc", "Sets field appliestopair.

Parameters
----------
theAppliesToPair: StepKinematics_KinematicPair

Returns
-------
None
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
		/****************** StepKinematics_ProductDefinitionKinematics ******************/
		/**** md5 signature: 01ee779fcbcb53dd77d075d2e58b8731 ****/
		%feature("compactdefaultargs") StepKinematics_ProductDefinitionKinematics;
		%feature("autodoc", "Default constructor.

Returns
-------
None
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
		/****************** StepKinematics_ProductDefinitionRelationshipKinematics ******************/
		/**** md5 signature: dfd87b63a52589340e3d28532238f0bc ****/
		%feature("compactdefaultargs") StepKinematics_ProductDefinitionRelationshipKinematics;
		%feature("autodoc", "Default constructor.

Returns
-------
None
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
		/****************** StepKinematics_RigidPlacement ******************/
		/**** md5 signature: 2e22fab37510f7e536239f31187393e4 ****/
		%feature("compactdefaultargs") StepKinematics_RigidPlacement;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") StepKinematics_RigidPlacement;
		 StepKinematics_RigidPlacement();

		/****************** Axis2Placement3d ******************/
		/**** md5 signature: c9e96f5e4c0b7eb079fbe3bc135a46fe ****/
		%feature("compactdefaultargs") Axis2Placement3d;
		%feature("autodoc", "Returns value as axis2placement3d (or null if another type).

Returns
-------
opencascade::handle<StepGeom_Axis2Placement3d>
") Axis2Placement3d;
		opencascade::handle<StepGeom_Axis2Placement3d> Axis2Placement3d();

		/****************** CaseNum ******************/
		/**** md5 signature: b9dbcdb5b972500c66bc8bc08f651d0a ****/
		%feature("compactdefaultargs") CaseNum;
		%feature("autodoc", "Recognizes a kind of rigidplacement select type -- 1 -> axis2placement3d -- 2 -> suparameters.

Parameters
----------
ent: Standard_Transient

Returns
-------
int
") CaseNum;
		Standard_Integer CaseNum(const opencascade::handle<Standard_Transient> & ent);

		/****************** SuParameters ******************/
		/**** md5 signature: 16eca4dd904e95921e4ff048caeea8e3 ****/
		%feature("compactdefaultargs") SuParameters;
		%feature("autodoc", "Returns value as suparameters (or null if another type).

Returns
-------
opencascade::handle<StepGeom_SuParameters>
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
		/****************** StepKinematics_RotationAboutDirection ******************/
		/**** md5 signature: 5fc6b3f3e4293e597e001269f5275935 ****/
		%feature("compactdefaultargs") StepKinematics_RotationAboutDirection;
		%feature("autodoc", "Default constructor.

Returns
-------
None
") StepKinematics_RotationAboutDirection;
		 StepKinematics_RotationAboutDirection();

		/****************** DirectionOfAxis ******************/
		/**** md5 signature: 1fcefffa7ed96437c8f607f4d7fc7503 ****/
		%feature("compactdefaultargs") DirectionOfAxis;
		%feature("autodoc", "Returns field directionofaxis.

Returns
-------
opencascade::handle<StepGeom_Direction>
") DirectionOfAxis;
		opencascade::handle<StepGeom_Direction> DirectionOfAxis();

		/****************** Init ******************/
		/**** md5 signature: 2522463ccf9fd6261ffef69ad4400ceb ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Initialize all fields (own and inherited).

Parameters
----------
theRepresentationItem_Name: TCollection_HAsciiString
theDirectionOfAxis: StepGeom_Direction
theRotationAngle: float

Returns
-------
None
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & theRepresentationItem_Name, const opencascade::handle<StepGeom_Direction> & theDirectionOfAxis, const Standard_Real theRotationAngle);

		/****************** RotationAngle ******************/
		/**** md5 signature: a0e05e147c18550a43c1eaae52b815fd ****/
		%feature("compactdefaultargs") RotationAngle;
		%feature("autodoc", "Returns field rotationangle.

Returns
-------
float
") RotationAngle;
		Standard_Real RotationAngle();

		/****************** SetDirectionOfAxis ******************/
		/**** md5 signature: 713071843d6d679a154e255dd944ce85 ****/
		%feature("compactdefaultargs") SetDirectionOfAxis;
		%feature("autodoc", "Sets field directionofaxis.

Parameters
----------
theDirectionOfAxis: StepGeom_Direction

Returns
-------
None
") SetDirectionOfAxis;
		void SetDirectionOfAxis(const opencascade::handle<StepGeom_Direction> & theDirectionOfAxis);

		/****************** SetRotationAngle ******************/
		/**** md5 signature: 0ad2cbf06a21fe8ac11f265f33c7f6c6 ****/
		%feature("compactdefaultargs") SetRotationAngle;
		%feature("autodoc", "Sets field rotationangle.

Parameters
----------
theRotationAngle: float

Returns
-------
None
") SetRotationAngle;
		void SetRotationAngle(const Standard_Real theRotationAngle);

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
		/****************** StepKinematics_SpatialRotation ******************/
		/**** md5 signature: 6c762d4adff8c130587266c20bd576a4 ****/
		%feature("compactdefaultargs") StepKinematics_SpatialRotation;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") StepKinematics_SpatialRotation;
		 StepKinematics_SpatialRotation();

		/****************** CaseNum ******************/
		/**** md5 signature: b9dbcdb5b972500c66bc8bc08f651d0a ****/
		%feature("compactdefaultargs") CaseNum;
		%feature("autodoc", "Recognizes a kind of spatialrotation select type -- 1 -> rotationaboutdirection -- 2 -> yprrotation.

Parameters
----------
ent: Standard_Transient

Returns
-------
int
") CaseNum;
		Standard_Integer CaseNum(const opencascade::handle<Standard_Transient> & ent);

		/****************** RotationAboutDirection ******************/
		/**** md5 signature: f3f49b0f97e36f341e3361f2759d4807 ****/
		%feature("compactdefaultargs") RotationAboutDirection;
		%feature("autodoc", "Returns value as rotationaboutdirection (or null if another type).

Returns
-------
opencascade::handle<StepKinematics_RotationAboutDirection>
") RotationAboutDirection;
		opencascade::handle<StepKinematics_RotationAboutDirection> RotationAboutDirection();

		/****************** YprRotation ******************/
		/**** md5 signature: 64920e51d6da69e569c2096eb7e6f9b4 ****/
		%feature("compactdefaultargs") YprRotation;
		%feature("autodoc", "Returns value as yprrotation (or null if another type).

Returns
-------
opencascade::handle<TColStd_HArray1OfReal>
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
		/****************** StepKinematics_SphericalPairSelect ******************/
		/**** md5 signature: 7750b12787faadafeb6277f32b54adc3 ****/
		%feature("compactdefaultargs") StepKinematics_SphericalPairSelect;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") StepKinematics_SphericalPairSelect;
		 StepKinematics_SphericalPairSelect();

		/****************** CaseNum ******************/
		/**** md5 signature: b9dbcdb5b972500c66bc8bc08f651d0a ****/
		%feature("compactdefaultargs") CaseNum;
		%feature("autodoc", "Recognizes a kind of sphericalpairselect select type -- 1 -> sphericalpair -- 2 -> sphericalpairwithpin.

Parameters
----------
ent: Standard_Transient

Returns
-------
int
") CaseNum;
		Standard_Integer CaseNum(const opencascade::handle<Standard_Transient> & ent);

		/****************** SphericalPair ******************/
		/**** md5 signature: 689bab421d51aa31efa7f49d52355ce5 ****/
		%feature("compactdefaultargs") SphericalPair;
		%feature("autodoc", "Returns value as sphericalpair (or null if another type).

Returns
-------
opencascade::handle<StepKinematics_SphericalPair>
") SphericalPair;
		opencascade::handle<StepKinematics_SphericalPair> SphericalPair();

		/****************** SphericalPairWithPin ******************/
		/**** md5 signature: 81753de7e878a43270ccec93cca531e9 ****/
		%feature("compactdefaultargs") SphericalPairWithPin;
		%feature("autodoc", "Returns value as sphericalpairwithpin (or null if another type).

Returns
-------
opencascade::handle<StepKinematics_SphericalPairWithPin>
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
		/****************** StepKinematics_ActuatedKinPairAndOrderKinPair ******************/
		/**** md5 signature: 259ca20158a0794c2a7a33435ab81e26 ****/
		%feature("compactdefaultargs") StepKinematics_ActuatedKinPairAndOrderKinPair;
		%feature("autodoc", "Default constructor.

Returns
-------
None
") StepKinematics_ActuatedKinPairAndOrderKinPair;
		 StepKinematics_ActuatedKinPairAndOrderKinPair();

		/****************** GetActuatedKinematicPair ******************/
		/**** md5 signature: 58f1ee52a48db61f0c245c9051669076 ****/
		%feature("compactdefaultargs") GetActuatedKinematicPair;
		%feature("autodoc", "No available documentation.

Returns
-------
inline opencascade::handle<StepKinematics_ActuatedKinematicPair>
") GetActuatedKinematicPair;
		inline opencascade::handle<StepKinematics_ActuatedKinematicPair> GetActuatedKinematicPair();

		/****************** GetOrderKinematicPair ******************/
		/**** md5 signature: 4d28c52d1a3bf519c398a25eb08bb0a0 ****/
		%feature("compactdefaultargs") GetOrderKinematicPair;
		%feature("autodoc", "No available documentation.

Returns
-------
inline opencascade::handle<StepKinematics_KinematicPair>
") GetOrderKinematicPair;
		inline opencascade::handle<StepKinematics_KinematicPair> GetOrderKinematicPair();

		/****************** Init ******************/
		/**** md5 signature: ad8e2fd2fa1db5508edfdab6995742f8 ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

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

Returns
-------
None
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & theRepresentationItem_Name, const opencascade::handle<TCollection_HAsciiString> & theItemDefinedTransformation_Name, const Standard_Boolean hasItemDefinedTransformation_Description, const opencascade::handle<TCollection_HAsciiString> & theItemDefinedTransformation_Description, const opencascade::handle<StepRepr_RepresentationItem> & theItemDefinedTransformation_TransformItem1, const opencascade::handle<StepRepr_RepresentationItem> & theItemDefinedTransformation_TransformItem2, const opencascade::handle<StepKinematics_KinematicJoint> & theJoint, const opencascade::handle<StepKinematics_ActuatedKinematicPair> & theActuatedKinematicPair, const opencascade::handle<StepKinematics_KinematicPair> & theOrderKinematicPair);

		/****************** SetActuatedKinematicPair ******************/
		/**** md5 signature: 7e1b5f8c414756af159227790993c3f1 ****/
		%feature("compactdefaultargs") SetActuatedKinematicPair;
		%feature("autodoc", "No available documentation.

Parameters
----------
aKP: StepKinematics_ActuatedKinematicPair

Returns
-------
inline void
") SetActuatedKinematicPair;
		inline void SetActuatedKinematicPair(const opencascade::handle<StepKinematics_ActuatedKinematicPair> & aKP);

		/****************** SetOrderKinematicPair ******************/
		/**** md5 signature: 973f44f9d4167dd730d69b775d6e54f2 ****/
		%feature("compactdefaultargs") SetOrderKinematicPair;
		%feature("autodoc", "No available documentation.

Parameters
----------
aKP: StepKinematics_KinematicPair

Returns
-------
inline void
") SetOrderKinematicPair;
		inline void SetOrderKinematicPair(const opencascade::handle<StepKinematics_KinematicPair> & aKP);

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
		/****************** StepKinematics_ActuatedKinematicPair ******************/
		/**** md5 signature: df8c9300e14098a4bd0830d70270036d ****/
		%feature("compactdefaultargs") StepKinematics_ActuatedKinematicPair;
		%feature("autodoc", "Default constructor.

Returns
-------
None
") StepKinematics_ActuatedKinematicPair;
		 StepKinematics_ActuatedKinematicPair();

		/****************** HasRX ******************/
		/**** md5 signature: 37f8f5981ed76330b1de17d219499786 ****/
		%feature("compactdefaultargs") HasRX;
		%feature("autodoc", "Returns true if optional field rx is defined.

Returns
-------
bool
") HasRX;
		Standard_Boolean HasRX();

		/****************** HasRY ******************/
		/**** md5 signature: 5aa7f8726187c7713dc67c424d832e5b ****/
		%feature("compactdefaultargs") HasRY;
		%feature("autodoc", "Returns true if optional field ry is defined.

Returns
-------
bool
") HasRY;
		Standard_Boolean HasRY();

		/****************** HasRZ ******************/
		/**** md5 signature: f3f9e8d2dd5c4ce4ac39887ca5af728d ****/
		%feature("compactdefaultargs") HasRZ;
		%feature("autodoc", "Returns true if optional field rz is defined.

Returns
-------
bool
") HasRZ;
		Standard_Boolean HasRZ();

		/****************** HasTX ******************/
		/**** md5 signature: 70819953aa268cc5d76d619cd3333036 ****/
		%feature("compactdefaultargs") HasTX;
		%feature("autodoc", "Returns true if optional field tx is defined.

Returns
-------
bool
") HasTX;
		Standard_Boolean HasTX();

		/****************** HasTY ******************/
		/**** md5 signature: bf66211635992dd512f875c78428685e ****/
		%feature("compactdefaultargs") HasTY;
		%feature("autodoc", "Returns true if optional field ty is defined.

Returns
-------
bool
") HasTY;
		Standard_Boolean HasTY();

		/****************** HasTZ ******************/
		/**** md5 signature: 2688a6a01f17fad374a175aa98ec6dee ****/
		%feature("compactdefaultargs") HasTZ;
		%feature("autodoc", "Returns true if optional field tz is defined.

Returns
-------
bool
") HasTZ;
		Standard_Boolean HasTZ();

		/****************** Init ******************/
		/**** md5 signature: c1604c3e83fe4994705c822c47353158 ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Initialize all fields (own and inherited).

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

Returns
-------
None
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & theRepresentationItem_Name, const opencascade::handle<TCollection_HAsciiString> & theItemDefinedTransformation_Name, const Standard_Boolean hasItemDefinedTransformation_Description, const opencascade::handle<TCollection_HAsciiString> & theItemDefinedTransformation_Description, const opencascade::handle<StepRepr_RepresentationItem> & theItemDefinedTransformation_TransformItem1, const opencascade::handle<StepRepr_RepresentationItem> & theItemDefinedTransformation_TransformItem2, const opencascade::handle<StepKinematics_KinematicJoint> & theKinematicPair_Joint, const Standard_Boolean hasTX, const StepKinematics_ActuatedDirection theTX, const Standard_Boolean hasTY, const StepKinematics_ActuatedDirection theTY, const Standard_Boolean hasTZ, const StepKinematics_ActuatedDirection theTZ, const Standard_Boolean hasRX, const StepKinematics_ActuatedDirection theRX, const Standard_Boolean hasRY, const StepKinematics_ActuatedDirection theRY, const Standard_Boolean hasRZ, const StepKinematics_ActuatedDirection theRZ);

		/****************** RX ******************/
		/**** md5 signature: d5c65d32604d8aee61311cd5f83ae0d6 ****/
		%feature("compactdefaultargs") RX;
		%feature("autodoc", "Returns field rx.

Returns
-------
StepKinematics_ActuatedDirection
") RX;
		StepKinematics_ActuatedDirection RX();

		/****************** RY ******************/
		/**** md5 signature: 95c2155915ca8b3c459248cc23c8d46a ****/
		%feature("compactdefaultargs") RY;
		%feature("autodoc", "Returns field ry.

Returns
-------
StepKinematics_ActuatedDirection
") RY;
		StepKinematics_ActuatedDirection RY();

		/****************** RZ ******************/
		/**** md5 signature: 291684bf4db882e12767f75178054665 ****/
		%feature("compactdefaultargs") RZ;
		%feature("autodoc", "Returns field rz.

Returns
-------
StepKinematics_ActuatedDirection
") RZ;
		StepKinematics_ActuatedDirection RZ();

		/****************** SetRX ******************/
		/**** md5 signature: 23735aafc76216dcfa96b0865c08b10c ****/
		%feature("compactdefaultargs") SetRX;
		%feature("autodoc", "Sets field rx.

Parameters
----------
theRX: StepKinematics_ActuatedDirection

Returns
-------
None
") SetRX;
		void SetRX(const StepKinematics_ActuatedDirection theRX);

		/****************** SetRY ******************/
		/**** md5 signature: f14e7443f3f9b08effe1ecea4ce01099 ****/
		%feature("compactdefaultargs") SetRY;
		%feature("autodoc", "Sets field ry.

Parameters
----------
theRY: StepKinematics_ActuatedDirection

Returns
-------
None
") SetRY;
		void SetRY(const StepKinematics_ActuatedDirection theRY);

		/****************** SetRZ ******************/
		/**** md5 signature: f494930f8391a3e129a791deb387ba66 ****/
		%feature("compactdefaultargs") SetRZ;
		%feature("autodoc", "Sets field rz.

Parameters
----------
theRZ: StepKinematics_ActuatedDirection

Returns
-------
None
") SetRZ;
		void SetRZ(const StepKinematics_ActuatedDirection theRZ);

		/****************** SetTX ******************/
		/**** md5 signature: b186e64c36cae548e9e7b096c8cb263d ****/
		%feature("compactdefaultargs") SetTX;
		%feature("autodoc", "Sets field tx.

Parameters
----------
theTX: StepKinematics_ActuatedDirection

Returns
-------
None
") SetTX;
		void SetTX(const StepKinematics_ActuatedDirection theTX);

		/****************** SetTY ******************/
		/**** md5 signature: 6c809809e2e841f3ace10f4330200217 ****/
		%feature("compactdefaultargs") SetTY;
		%feature("autodoc", "Sets field ty.

Parameters
----------
theTY: StepKinematics_ActuatedDirection

Returns
-------
None
") SetTY;
		void SetTY(const StepKinematics_ActuatedDirection theTY);

		/****************** SetTZ ******************/
		/**** md5 signature: 84e2c466269970e085d114ccf7d3a2ca ****/
		%feature("compactdefaultargs") SetTZ;
		%feature("autodoc", "Sets field tz.

Parameters
----------
theTZ: StepKinematics_ActuatedDirection

Returns
-------
None
") SetTZ;
		void SetTZ(const StepKinematics_ActuatedDirection theTZ);

		/****************** TX ******************/
		/**** md5 signature: 2b12477f457438dc50c8be0cc8e3e710 ****/
		%feature("compactdefaultargs") TX;
		%feature("autodoc", "Returns field tx.

Returns
-------
StepKinematics_ActuatedDirection
") TX;
		StepKinematics_ActuatedDirection TX();

		/****************** TY ******************/
		/**** md5 signature: 0d1593a64cbc6ad87813f50fcce5bd99 ****/
		%feature("compactdefaultargs") TY;
		%feature("autodoc", "Returns field ty.

Returns
-------
StepKinematics_ActuatedDirection
") TY;
		StepKinematics_ActuatedDirection TY();

		/****************** TZ ******************/
		/**** md5 signature: 9611986abcb127dc7fbbf0d266522914 ****/
		%feature("compactdefaultargs") TZ;
		%feature("autodoc", "Returns field tz.

Returns
-------
StepKinematics_ActuatedDirection
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
		/****************** StepKinematics_CylindricalPairValue ******************/
		/**** md5 signature: 616cf41577612d3d0b65db3a9d5d3674 ****/
		%feature("compactdefaultargs") StepKinematics_CylindricalPairValue;
		%feature("autodoc", "Default constructor.

Returns
-------
None
") StepKinematics_CylindricalPairValue;
		 StepKinematics_CylindricalPairValue();

		/****************** ActualRotation ******************/
		/**** md5 signature: 30e9003df2dadd466d63b6d544fb4f7d ****/
		%feature("compactdefaultargs") ActualRotation;
		%feature("autodoc", "Returns field actualrotation.

Returns
-------
float
") ActualRotation;
		Standard_Real ActualRotation();

		/****************** ActualTranslation ******************/
		/**** md5 signature: 6f06104e4052b692ebc9e4ea03ad6ac4 ****/
		%feature("compactdefaultargs") ActualTranslation;
		%feature("autodoc", "Returns field actualtranslation.

Returns
-------
float
") ActualTranslation;
		Standard_Real ActualTranslation();

		/****************** Init ******************/
		/**** md5 signature: 27da9948efcb34aabd26cb2e756805ce ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Initialize all fields (own and inherited).

Parameters
----------
theRepresentationItem_Name: TCollection_HAsciiString
thePairValue_AppliesToPair: StepKinematics_KinematicPair
theActualTranslation: float
theActualRotation: float

Returns
-------
None
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & theRepresentationItem_Name, const opencascade::handle<StepKinematics_KinematicPair> & thePairValue_AppliesToPair, const Standard_Real theActualTranslation, const Standard_Real theActualRotation);

		/****************** SetActualRotation ******************/
		/**** md5 signature: 770befc82d15c08b0b7b1dc4fb5e70e7 ****/
		%feature("compactdefaultargs") SetActualRotation;
		%feature("autodoc", "Sets field actualrotation.

Parameters
----------
theActualRotation: float

Returns
-------
None
") SetActualRotation;
		void SetActualRotation(const Standard_Real theActualRotation);

		/****************** SetActualTranslation ******************/
		/**** md5 signature: 42a58dfc1fc4c0d908fb057639c64055 ****/
		%feature("compactdefaultargs") SetActualTranslation;
		%feature("autodoc", "Sets field actualtranslation.

Parameters
----------
theActualTranslation: float

Returns
-------
None
") SetActualTranslation;
		void SetActualTranslation(const Standard_Real theActualTranslation);

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
		/****************** StepKinematics_GearPairValue ******************/
		/**** md5 signature: 3332e1815a69ad183ba2775b37e05ff4 ****/
		%feature("compactdefaultargs") StepKinematics_GearPairValue;
		%feature("autodoc", "Default constructor.

Returns
-------
None
") StepKinematics_GearPairValue;
		 StepKinematics_GearPairValue();

		/****************** ActualRotation1 ******************/
		/**** md5 signature: 6aea4bfc8c425b4ab7b6f0f7a6e60c57 ****/
		%feature("compactdefaultargs") ActualRotation1;
		%feature("autodoc", "Returns field actualrotation1.

Returns
-------
float
") ActualRotation1;
		Standard_Real ActualRotation1();

		/****************** Init ******************/
		/**** md5 signature: 7d97850c814f0195369c191809fa263d ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Initialize all fields (own and inherited).

Parameters
----------
theRepresentationItem_Name: TCollection_HAsciiString
thePairValue_AppliesToPair: StepKinematics_KinematicPair
theActualRotation1: float

Returns
-------
None
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & theRepresentationItem_Name, const opencascade::handle<StepKinematics_KinematicPair> & thePairValue_AppliesToPair, const Standard_Real theActualRotation1);

		/****************** SetActualRotation1 ******************/
		/**** md5 signature: 7713c601b6eb8f0dd4968f997f5daf3f ****/
		%feature("compactdefaultargs") SetActualRotation1;
		%feature("autodoc", "Sets field actualrotation1.

Parameters
----------
theActualRotation1: float

Returns
-------
None
") SetActualRotation1;
		void SetActualRotation1(const Standard_Real theActualRotation1);

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
		/****************** StepKinematics_HighOrderKinematicPair ******************/
		/**** md5 signature: 3f86ba2564ade23271e520a9502670dd ****/
		%feature("compactdefaultargs") StepKinematics_HighOrderKinematicPair;
		%feature("autodoc", "Default constructor.

Returns
-------
None
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
		/****************** StepKinematics_KinematicPropertyMechanismRepresentation ******************/
		/**** md5 signature: 7ed81e7f0c490d21b1872e32449aa598 ****/
		%feature("compactdefaultargs") StepKinematics_KinematicPropertyMechanismRepresentation;
		%feature("autodoc", "Default constructor.

Returns
-------
None
") StepKinematics_KinematicPropertyMechanismRepresentation;
		 StepKinematics_KinematicPropertyMechanismRepresentation();

		/****************** Base ******************/
		/**** md5 signature: 4434703b79f70aa6afb619fe613b31ab ****/
		%feature("compactdefaultargs") Base;
		%feature("autodoc", "Returns field base.

Returns
-------
opencascade::handle<StepKinematics_KinematicLinkRepresentation>
") Base;
		opencascade::handle<StepKinematics_KinematicLinkRepresentation> Base();

		/****************** Init ******************/
		/**** md5 signature: f19ec84935d9fd089e461a5304711514 ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Initialize all fields (own and inherited).

Parameters
----------
thePropertyDefinitionRepresentation_Definition: StepRepr_RepresentedDefinition
thePropertyDefinitionRepresentation_UsedRepresentation: StepRepr_Representation
theBase: StepKinematics_KinematicLinkRepresentation

Returns
-------
None
") Init;
		void Init(const StepRepr_RepresentedDefinition & thePropertyDefinitionRepresentation_Definition, const opencascade::handle<StepRepr_Representation> & thePropertyDefinitionRepresentation_UsedRepresentation, const opencascade::handle<StepKinematics_KinematicLinkRepresentation> & theBase);

		/****************** SetBase ******************/
		/**** md5 signature: 805789d992cf682b28d697afb4a52dc1 ****/
		%feature("compactdefaultargs") SetBase;
		%feature("autodoc", "Sets field base.

Parameters
----------
theBase: StepKinematics_KinematicLinkRepresentation

Returns
-------
None
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
		/****************** StepKinematics_LinearFlexibleLinkRepresentation ******************/
		/**** md5 signature: d7726e0a4cba9eeff450f459cea3825a ****/
		%feature("compactdefaultargs") StepKinematics_LinearFlexibleLinkRepresentation;
		%feature("autodoc", "Default constructor.

Returns
-------
None
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
		/****************** StepKinematics_LowOrderKinematicPair ******************/
		/**** md5 signature: cc923bd873c2e1c723460afd978df237 ****/
		%feature("compactdefaultargs") StepKinematics_LowOrderKinematicPair;
		%feature("autodoc", "Default constructor.

Returns
-------
None
") StepKinematics_LowOrderKinematicPair;
		 StepKinematics_LowOrderKinematicPair();

		/****************** Init ******************/
		/**** md5 signature: fe1b0cf24568071ce22f54951096397c ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Initialize all fields (own and inherited).

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

Returns
-------
None
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & theRepresentationItem_Name, const opencascade::handle<TCollection_HAsciiString> & theItemDefinedTransformation_Name, const Standard_Boolean hasItemDefinedTransformation_Description, const opencascade::handle<TCollection_HAsciiString> & theItemDefinedTransformation_Description, const opencascade::handle<StepRepr_RepresentationItem> & theItemDefinedTransformation_TransformItem1, const opencascade::handle<StepRepr_RepresentationItem> & theItemDefinedTransformation_TransformItem2, const opencascade::handle<StepKinematics_KinematicJoint> & theKinematicPair_Joint, const Standard_Boolean theTX, const Standard_Boolean theTY, const Standard_Boolean theTZ, const Standard_Boolean theRX, const Standard_Boolean theRY, const Standard_Boolean theRZ);

		/****************** RX ******************/
		/**** md5 signature: 78795f2ff190af3f1001538cd95406c9 ****/
		%feature("compactdefaultargs") RX;
		%feature("autodoc", "Returns field rx.

Returns
-------
bool
") RX;
		Standard_Boolean RX();

		/****************** RY ******************/
		/**** md5 signature: b82792a8284c6604d4ed223511744c06 ****/
		%feature("compactdefaultargs") RY;
		%feature("autodoc", "Returns field ry.

Returns
-------
bool
") RY;
		Standard_Boolean RY();

		/****************** RZ ******************/
		/**** md5 signature: 84f3f3be164a100854178b9f23f57aaf ****/
		%feature("compactdefaultargs") RZ;
		%feature("autodoc", "Returns field rz.

Returns
-------
bool
") RZ;
		Standard_Boolean RZ();

		/****************** SetRX ******************/
		/**** md5 signature: 6df7dff2db6c1664969e7d6740b45d45 ****/
		%feature("compactdefaultargs") SetRX;
		%feature("autodoc", "Sets field rx.

Parameters
----------
theRX: bool

Returns
-------
None
") SetRX;
		void SetRX(const Standard_Boolean theRX);

		/****************** SetRY ******************/
		/**** md5 signature: c78f829fe2f2657279f970ba91934f00 ****/
		%feature("compactdefaultargs") SetRY;
		%feature("autodoc", "Sets field ry.

Parameters
----------
theRY: bool

Returns
-------
None
") SetRY;
		void SetRY(const Standard_Boolean theRY);

		/****************** SetRZ ******************/
		/**** md5 signature: a22054b188a4d7b0c3ced39049b418d4 ****/
		%feature("compactdefaultargs") SetRZ;
		%feature("autodoc", "Sets field rz.

Parameters
----------
theRZ: bool

Returns
-------
None
") SetRZ;
		void SetRZ(const Standard_Boolean theRZ);

		/****************** SetTX ******************/
		/**** md5 signature: 454e3fcf39b6267a60d3dd8ce225e17e ****/
		%feature("compactdefaultargs") SetTX;
		%feature("autodoc", "Sets field tx.

Parameters
----------
theTX: bool

Returns
-------
None
") SetTX;
		void SetTX(const Standard_Boolean theTX);

		/****************** SetTY ******************/
		/**** md5 signature: 72c951a6495f5885e201c00d9f61df40 ****/
		%feature("compactdefaultargs") SetTY;
		%feature("autodoc", "Sets field ty.

Parameters
----------
theTY: bool

Returns
-------
None
") SetTY;
		void SetTY(const Standard_Boolean theTY);

		/****************** SetTZ ******************/
		/**** md5 signature: ee629e0d1a16d348e4e6a6d7cc8a9bbc ****/
		%feature("compactdefaultargs") SetTZ;
		%feature("autodoc", "Sets field tz.

Parameters
----------
theTZ: bool

Returns
-------
None
") SetTZ;
		void SetTZ(const Standard_Boolean theTZ);

		/****************** TX ******************/
		/**** md5 signature: 5a13c606a9a083343d8543c5bffc10d6 ****/
		%feature("compactdefaultargs") TX;
		%feature("autodoc", "Returns field tx.

Returns
-------
bool
") TX;
		Standard_Boolean TX();

		/****************** TY ******************/
		/**** md5 signature: c034f6b36d0071a2f4195e134c4547b0 ****/
		%feature("compactdefaultargs") TY;
		%feature("autodoc", "Returns field ty.

Returns
-------
bool
") TY;
		Standard_Boolean TY();

		/****************** TZ ******************/
		/**** md5 signature: 051384b4e6563d39c3d07bc8e3c87803 ****/
		%feature("compactdefaultargs") TZ;
		%feature("autodoc", "Returns field tz.

Returns
-------
bool
") TZ;
		Standard_Boolean TZ();

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
		/****************** StepKinematics_LowOrderKinematicPairValue ******************/
		/**** md5 signature: 140fba40c9866444576835280755aaa7 ****/
		%feature("compactdefaultargs") StepKinematics_LowOrderKinematicPairValue;
		%feature("autodoc", "Default constructor.

Returns
-------
None
") StepKinematics_LowOrderKinematicPairValue;
		 StepKinematics_LowOrderKinematicPairValue();

		/****************** ActualRotationX ******************/
		/**** md5 signature: 902965a56b51a7445534e15f594a2987 ****/
		%feature("compactdefaultargs") ActualRotationX;
		%feature("autodoc", "Returns field actualrotationx.

Returns
-------
float
") ActualRotationX;
		Standard_Real ActualRotationX();

		/****************** ActualRotationY ******************/
		/**** md5 signature: a70e5f2aa798acf10c0e28cacdc0c824 ****/
		%feature("compactdefaultargs") ActualRotationY;
		%feature("autodoc", "Returns field actualrotationy.

Returns
-------
float
") ActualRotationY;
		Standard_Real ActualRotationY();

		/****************** ActualRotationZ ******************/
		/**** md5 signature: 0cf88f1b323266fd161c63b70750ce63 ****/
		%feature("compactdefaultargs") ActualRotationZ;
		%feature("autodoc", "Returns field actualrotationz.

Returns
-------
float
") ActualRotationZ;
		Standard_Real ActualRotationZ();

		/****************** ActualTranslationX ******************/
		/**** md5 signature: 6ac9984f4666e90a828688cac483b950 ****/
		%feature("compactdefaultargs") ActualTranslationX;
		%feature("autodoc", "Returns field actualtranslationx.

Returns
-------
float
") ActualTranslationX;
		Standard_Real ActualTranslationX();

		/****************** ActualTranslationY ******************/
		/**** md5 signature: a071f4946a682a653d3b42397598abc2 ****/
		%feature("compactdefaultargs") ActualTranslationY;
		%feature("autodoc", "Returns field actualtranslationy.

Returns
-------
float
") ActualTranslationY;
		Standard_Real ActualTranslationY();

		/****************** ActualTranslationZ ******************/
		/**** md5 signature: 2c55336eca0a2d3e395bd45061dbbd11 ****/
		%feature("compactdefaultargs") ActualTranslationZ;
		%feature("autodoc", "Returns field actualtranslationz.

Returns
-------
float
") ActualTranslationZ;
		Standard_Real ActualTranslationZ();

		/****************** Init ******************/
		/**** md5 signature: c3a65772c76d50a0e5f554a4a9b8ddd1 ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Initialize all fields (own and inherited).

Parameters
----------
theRepresentationItem_Name: TCollection_HAsciiString
thePairValue_AppliesToPair: StepKinematics_KinematicPair
theActualTranslationX: float
theActualTranslationY: float
theActualTranslationZ: float
theActualRotationX: float
theActualRotationY: float
theActualRotationZ: float

Returns
-------
None
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & theRepresentationItem_Name, const opencascade::handle<StepKinematics_KinematicPair> & thePairValue_AppliesToPair, const Standard_Real theActualTranslationX, const Standard_Real theActualTranslationY, const Standard_Real theActualTranslationZ, const Standard_Real theActualRotationX, const Standard_Real theActualRotationY, const Standard_Real theActualRotationZ);

		/****************** SetActualRotationX ******************/
		/**** md5 signature: fe19439665932898af40ffd50275e3d4 ****/
		%feature("compactdefaultargs") SetActualRotationX;
		%feature("autodoc", "Sets field actualrotationx.

Parameters
----------
theActualRotationX: float

Returns
-------
None
") SetActualRotationX;
		void SetActualRotationX(const Standard_Real theActualRotationX);

		/****************** SetActualRotationY ******************/
		/**** md5 signature: a2b4b483fb15e283435ee9c0efef06dd ****/
		%feature("compactdefaultargs") SetActualRotationY;
		%feature("autodoc", "Sets field actualrotationy.

Parameters
----------
theActualRotationY: float

Returns
-------
None
") SetActualRotationY;
		void SetActualRotationY(const Standard_Real theActualRotationY);

		/****************** SetActualRotationZ ******************/
		/**** md5 signature: d54e6bc435e290d4cd8f545a3d0cfe25 ****/
		%feature("compactdefaultargs") SetActualRotationZ;
		%feature("autodoc", "Sets field actualrotationz.

Parameters
----------
theActualRotationZ: float

Returns
-------
None
") SetActualRotationZ;
		void SetActualRotationZ(const Standard_Real theActualRotationZ);

		/****************** SetActualTranslationX ******************/
		/**** md5 signature: c4647b7c5c64a94976fa395251c18bb5 ****/
		%feature("compactdefaultargs") SetActualTranslationX;
		%feature("autodoc", "Sets field actualtranslationx.

Parameters
----------
theActualTranslationX: float

Returns
-------
None
") SetActualTranslationX;
		void SetActualTranslationX(const Standard_Real theActualTranslationX);

		/****************** SetActualTranslationY ******************/
		/**** md5 signature: b7e97b62a34e6739a94ddb6b67f0dc03 ****/
		%feature("compactdefaultargs") SetActualTranslationY;
		%feature("autodoc", "Sets field actualtranslationy.

Parameters
----------
theActualTranslationY: float

Returns
-------
None
") SetActualTranslationY;
		void SetActualTranslationY(const Standard_Real theActualTranslationY);

		/****************** SetActualTranslationZ ******************/
		/**** md5 signature: 90504056d1a8aa333027c236050d69d0 ****/
		%feature("compactdefaultargs") SetActualTranslationZ;
		%feature("autodoc", "Sets field actualtranslationz.

Parameters
----------
theActualTranslationZ: float

Returns
-------
None
") SetActualTranslationZ;
		void SetActualTranslationZ(const Standard_Real theActualTranslationZ);

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
		/****************** StepKinematics_LowOrderKinematicPairWithMotionCoupling ******************/
		/**** md5 signature: de2593e262e0ee6a59a7b8a06aad47c0 ****/
		%feature("compactdefaultargs") StepKinematics_LowOrderKinematicPairWithMotionCoupling;
		%feature("autodoc", "Default constructor.

Returns
-------
None
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
		/****************** StepKinematics_PlanarPairValue ******************/
		/**** md5 signature: a5e4d854701bdf62d4239c3c00656d98 ****/
		%feature("compactdefaultargs") StepKinematics_PlanarPairValue;
		%feature("autodoc", "Default constructor.

Returns
-------
None
") StepKinematics_PlanarPairValue;
		 StepKinematics_PlanarPairValue();

		/****************** ActualRotation ******************/
		/**** md5 signature: 30e9003df2dadd466d63b6d544fb4f7d ****/
		%feature("compactdefaultargs") ActualRotation;
		%feature("autodoc", "Returns field actualrotation.

Returns
-------
float
") ActualRotation;
		Standard_Real ActualRotation();

		/****************** ActualTranslationX ******************/
		/**** md5 signature: 6ac9984f4666e90a828688cac483b950 ****/
		%feature("compactdefaultargs") ActualTranslationX;
		%feature("autodoc", "Returns field actualtranslationx.

Returns
-------
float
") ActualTranslationX;
		Standard_Real ActualTranslationX();

		/****************** ActualTranslationY ******************/
		/**** md5 signature: a071f4946a682a653d3b42397598abc2 ****/
		%feature("compactdefaultargs") ActualTranslationY;
		%feature("autodoc", "Returns field actualtranslationy.

Returns
-------
float
") ActualTranslationY;
		Standard_Real ActualTranslationY();

		/****************** Init ******************/
		/**** md5 signature: a51019251071569668080055c58a8bdb ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Initialize all fields (own and inherited).

Parameters
----------
theRepresentationItem_Name: TCollection_HAsciiString
thePairValue_AppliesToPair: StepKinematics_KinematicPair
theActualRotation: float
theActualTranslationX: float
theActualTranslationY: float

Returns
-------
None
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & theRepresentationItem_Name, const opencascade::handle<StepKinematics_KinematicPair> & thePairValue_AppliesToPair, const Standard_Real theActualRotation, const Standard_Real theActualTranslationX, const Standard_Real theActualTranslationY);

		/****************** SetActualRotation ******************/
		/**** md5 signature: 770befc82d15c08b0b7b1dc4fb5e70e7 ****/
		%feature("compactdefaultargs") SetActualRotation;
		%feature("autodoc", "Sets field actualrotation.

Parameters
----------
theActualRotation: float

Returns
-------
None
") SetActualRotation;
		void SetActualRotation(const Standard_Real theActualRotation);

		/****************** SetActualTranslationX ******************/
		/**** md5 signature: c4647b7c5c64a94976fa395251c18bb5 ****/
		%feature("compactdefaultargs") SetActualTranslationX;
		%feature("autodoc", "Sets field actualtranslationx.

Parameters
----------
theActualTranslationX: float

Returns
-------
None
") SetActualTranslationX;
		void SetActualTranslationX(const Standard_Real theActualTranslationX);

		/****************** SetActualTranslationY ******************/
		/**** md5 signature: b7e97b62a34e6739a94ddb6b67f0dc03 ****/
		%feature("compactdefaultargs") SetActualTranslationY;
		%feature("autodoc", "Sets field actualtranslationy.

Parameters
----------
theActualTranslationY: float

Returns
-------
None
") SetActualTranslationY;
		void SetActualTranslationY(const Standard_Real theActualTranslationY);

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
		/****************** StepKinematics_PointOnPlanarCurvePairValue ******************/
		/**** md5 signature: e06585f79655c2e3b8690bf0fdf66f09 ****/
		%feature("compactdefaultargs") StepKinematics_PointOnPlanarCurvePairValue;
		%feature("autodoc", "Default constructor.

Returns
-------
None
") StepKinematics_PointOnPlanarCurvePairValue;
		 StepKinematics_PointOnPlanarCurvePairValue();

		/****************** ActualPointOnCurve ******************/
		/**** md5 signature: ed4a7e555947ac679dd1e1468f27502b ****/
		%feature("compactdefaultargs") ActualPointOnCurve;
		%feature("autodoc", "Returns field actualpointoncurve.

Returns
-------
opencascade::handle<StepGeom_PointOnCurve>
") ActualPointOnCurve;
		opencascade::handle<StepGeom_PointOnCurve> ActualPointOnCurve();

		/****************** Init ******************/
		/**** md5 signature: 9649f04655f4e6c549e71506307ab44d ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Initialize all fields (own and inherited).

Parameters
----------
theRepresentationItem_Name: TCollection_HAsciiString
thePairValue_AppliesToPair: StepKinematics_KinematicPair
theActualPointOnCurve: StepGeom_PointOnCurve
theInputOrientation: StepKinematics_SpatialRotation

Returns
-------
None
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & theRepresentationItem_Name, const opencascade::handle<StepKinematics_KinematicPair> & thePairValue_AppliesToPair, const opencascade::handle<StepGeom_PointOnCurve> & theActualPointOnCurve, const StepKinematics_SpatialRotation & theInputOrientation);

		/****************** InputOrientation ******************/
		/**** md5 signature: 9b03c85e2d0e574b3f079e8cfbfcff68 ****/
		%feature("compactdefaultargs") InputOrientation;
		%feature("autodoc", "Returns field inputorientation.

Returns
-------
StepKinematics_SpatialRotation
") InputOrientation;
		StepKinematics_SpatialRotation InputOrientation();

		/****************** SetActualPointOnCurve ******************/
		/**** md5 signature: 98311a14395d84eda1d563dc54f13c2e ****/
		%feature("compactdefaultargs") SetActualPointOnCurve;
		%feature("autodoc", "Sets field actualpointoncurve.

Parameters
----------
theActualPointOnCurve: StepGeom_PointOnCurve

Returns
-------
None
") SetActualPointOnCurve;
		void SetActualPointOnCurve(const opencascade::handle<StepGeom_PointOnCurve> & theActualPointOnCurve);

		/****************** SetInputOrientation ******************/
		/**** md5 signature: 0efe0641aff13b56d8fb1cc049d53623 ****/
		%feature("compactdefaultargs") SetInputOrientation;
		%feature("autodoc", "Sets field inputorientation.

Parameters
----------
theInputOrientation: StepKinematics_SpatialRotation

Returns
-------
None
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
		/****************** StepKinematics_PointOnSurfacePairValue ******************/
		/**** md5 signature: 66bf3d290f62fe87d8464e73c588a2c4 ****/
		%feature("compactdefaultargs") StepKinematics_PointOnSurfacePairValue;
		%feature("autodoc", "Default constructor.

Returns
-------
None
") StepKinematics_PointOnSurfacePairValue;
		 StepKinematics_PointOnSurfacePairValue();

		/****************** ActualPointOnSurface ******************/
		/**** md5 signature: fa6d88116287e3fc164513fbb7583b2d ****/
		%feature("compactdefaultargs") ActualPointOnSurface;
		%feature("autodoc", "Returns field actualpointonsurface.

Returns
-------
opencascade::handle<StepGeom_PointOnSurface>
") ActualPointOnSurface;
		opencascade::handle<StepGeom_PointOnSurface> ActualPointOnSurface();

		/****************** Init ******************/
		/**** md5 signature: e73e29d78d3466bba8d321e5aa1d6aae ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Initialize all fields (own and inherited).

Parameters
----------
theRepresentationItem_Name: TCollection_HAsciiString
thePairValue_AppliesToPair: StepKinematics_KinematicPair
theActualPointOnSurface: StepGeom_PointOnSurface
theInputOrientation: StepKinematics_SpatialRotation

Returns
-------
None
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & theRepresentationItem_Name, const opencascade::handle<StepKinematics_KinematicPair> & thePairValue_AppliesToPair, const opencascade::handle<StepGeom_PointOnSurface> & theActualPointOnSurface, const StepKinematics_SpatialRotation & theInputOrientation);

		/****************** InputOrientation ******************/
		/**** md5 signature: 9b03c85e2d0e574b3f079e8cfbfcff68 ****/
		%feature("compactdefaultargs") InputOrientation;
		%feature("autodoc", "Returns field inputorientation.

Returns
-------
StepKinematics_SpatialRotation
") InputOrientation;
		StepKinematics_SpatialRotation InputOrientation();

		/****************** SetActualPointOnSurface ******************/
		/**** md5 signature: c7bd90fa0259485bb69c5208032b8176 ****/
		%feature("compactdefaultargs") SetActualPointOnSurface;
		%feature("autodoc", "Sets field actualpointonsurface.

Parameters
----------
theActualPointOnSurface: StepGeom_PointOnSurface

Returns
-------
None
") SetActualPointOnSurface;
		void SetActualPointOnSurface(const opencascade::handle<StepGeom_PointOnSurface> & theActualPointOnSurface);

		/****************** SetInputOrientation ******************/
		/**** md5 signature: 0efe0641aff13b56d8fb1cc049d53623 ****/
		%feature("compactdefaultargs") SetInputOrientation;
		%feature("autodoc", "Sets field inputorientation.

Parameters
----------
theInputOrientation: StepKinematics_SpatialRotation

Returns
-------
None
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
		/****************** StepKinematics_PrismaticPairValue ******************/
		/**** md5 signature: 083fe6baebe7fa92369737913905c438 ****/
		%feature("compactdefaultargs") StepKinematics_PrismaticPairValue;
		%feature("autodoc", "Default constructor.

Returns
-------
None
") StepKinematics_PrismaticPairValue;
		 StepKinematics_PrismaticPairValue();

		/****************** ActualTranslation ******************/
		/**** md5 signature: 6f06104e4052b692ebc9e4ea03ad6ac4 ****/
		%feature("compactdefaultargs") ActualTranslation;
		%feature("autodoc", "Returns field actualtranslation.

Returns
-------
float
") ActualTranslation;
		Standard_Real ActualTranslation();

		/****************** Init ******************/
		/**** md5 signature: 97d4bfc5c0cf49b9883d8d07b3611700 ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Initialize all fields (own and inherited).

Parameters
----------
theRepresentationItem_Name: TCollection_HAsciiString
thePairValue_AppliesToPair: StepKinematics_KinematicPair
theActualTranslation: float

Returns
-------
None
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & theRepresentationItem_Name, const opencascade::handle<StepKinematics_KinematicPair> & thePairValue_AppliesToPair, const Standard_Real theActualTranslation);

		/****************** SetActualTranslation ******************/
		/**** md5 signature: 42a58dfc1fc4c0d908fb057639c64055 ****/
		%feature("compactdefaultargs") SetActualTranslation;
		%feature("autodoc", "Sets field actualtranslation.

Parameters
----------
theActualTranslation: float

Returns
-------
None
") SetActualTranslation;
		void SetActualTranslation(const Standard_Real theActualTranslation);

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
		/****************** StepKinematics_RackAndPinionPairValue ******************/
		/**** md5 signature: 76d9ca4aa471a33f8be946330323c96a ****/
		%feature("compactdefaultargs") StepKinematics_RackAndPinionPairValue;
		%feature("autodoc", "Default constructor.

Returns
-------
None
") StepKinematics_RackAndPinionPairValue;
		 StepKinematics_RackAndPinionPairValue();

		/****************** ActualDisplacement ******************/
		/**** md5 signature: 9822afabcb0e1d043beecf96ce2c4160 ****/
		%feature("compactdefaultargs") ActualDisplacement;
		%feature("autodoc", "Returns field actualdisplacement.

Returns
-------
float
") ActualDisplacement;
		Standard_Real ActualDisplacement();

		/****************** Init ******************/
		/**** md5 signature: 5218a23a1ba3e5ea4ee6c331836238e1 ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Initialize all fields (own and inherited).

Parameters
----------
theRepresentationItem_Name: TCollection_HAsciiString
thePairValue_AppliesToPair: StepKinematics_KinematicPair
theActualDisplacement: float

Returns
-------
None
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & theRepresentationItem_Name, const opencascade::handle<StepKinematics_KinematicPair> & thePairValue_AppliesToPair, const Standard_Real theActualDisplacement);

		/****************** SetActualDisplacement ******************/
		/**** md5 signature: 901b2a5b592ec5950b42322d17c4b9c0 ****/
		%feature("compactdefaultargs") SetActualDisplacement;
		%feature("autodoc", "Sets field actualdisplacement.

Parameters
----------
theActualDisplacement: float

Returns
-------
None
") SetActualDisplacement;
		void SetActualDisplacement(const Standard_Real theActualDisplacement);

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
		/****************** StepKinematics_RevolutePairValue ******************/
		/**** md5 signature: ec929316dad4acdac195b4f4c087ab68 ****/
		%feature("compactdefaultargs") StepKinematics_RevolutePairValue;
		%feature("autodoc", "Default constructor.

Returns
-------
None
") StepKinematics_RevolutePairValue;
		 StepKinematics_RevolutePairValue();

		/****************** ActualRotation ******************/
		/**** md5 signature: 30e9003df2dadd466d63b6d544fb4f7d ****/
		%feature("compactdefaultargs") ActualRotation;
		%feature("autodoc", "Returns field actualrotation.

Returns
-------
float
") ActualRotation;
		Standard_Real ActualRotation();

		/****************** Init ******************/
		/**** md5 signature: 299e75865a1206ec88ce1960074d83ac ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Initialize all fields (own and inherited).

Parameters
----------
theRepresentationItem_Name: TCollection_HAsciiString
thePairValue_AppliesToPair: StepKinematics_KinematicPair
theActualRotation: float

Returns
-------
None
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & theRepresentationItem_Name, const opencascade::handle<StepKinematics_KinematicPair> & thePairValue_AppliesToPair, const Standard_Real theActualRotation);

		/****************** SetActualRotation ******************/
		/**** md5 signature: 770befc82d15c08b0b7b1dc4fb5e70e7 ****/
		%feature("compactdefaultargs") SetActualRotation;
		%feature("autodoc", "Sets field actualrotation.

Parameters
----------
theActualRotation: float

Returns
-------
None
") SetActualRotation;
		void SetActualRotation(const Standard_Real theActualRotation);

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
		/****************** StepKinematics_RigidLinkRepresentation ******************/
		/**** md5 signature: a608df37d8412a2b8d80594ac0866966 ****/
		%feature("compactdefaultargs") StepKinematics_RigidLinkRepresentation;
		%feature("autodoc", "Default constructor.

Returns
-------
None
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
		/****************** StepKinematics_RollingCurvePairValue ******************/
		/**** md5 signature: c6c868e4ba6000f1befc145bafd1cdeb ****/
		%feature("compactdefaultargs") StepKinematics_RollingCurvePairValue;
		%feature("autodoc", "Default constructor.

Returns
-------
None
") StepKinematics_RollingCurvePairValue;
		 StepKinematics_RollingCurvePairValue();

		/****************** ActualPointOnCurve1 ******************/
		/**** md5 signature: 74ec7cdb97e0bb8eacdeda0d6dd7bfe9 ****/
		%feature("compactdefaultargs") ActualPointOnCurve1;
		%feature("autodoc", "Returns field actualpointoncurve1.

Returns
-------
opencascade::handle<StepGeom_PointOnCurve>
") ActualPointOnCurve1;
		opencascade::handle<StepGeom_PointOnCurve> ActualPointOnCurve1();

		/****************** Init ******************/
		/**** md5 signature: 196669a499120f042b3becce7f34225d ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Initialize all fields (own and inherited).

Parameters
----------
theRepresentationItem_Name: TCollection_HAsciiString
thePairValue_AppliesToPair: StepKinematics_KinematicPair
theActualPointOnCurve1: StepGeom_PointOnCurve

Returns
-------
None
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & theRepresentationItem_Name, const opencascade::handle<StepKinematics_KinematicPair> & thePairValue_AppliesToPair, const opencascade::handle<StepGeom_PointOnCurve> & theActualPointOnCurve1);

		/****************** SetActualPointOnCurve1 ******************/
		/**** md5 signature: 5951372fe4c11a57858c04c47f987211 ****/
		%feature("compactdefaultargs") SetActualPointOnCurve1;
		%feature("autodoc", "Sets field actualpointoncurve1.

Parameters
----------
theActualPointOnCurve1: StepGeom_PointOnCurve

Returns
-------
None
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
		/****************** StepKinematics_RollingSurfacePairValue ******************/
		/**** md5 signature: 854b57e4737009a2fa6fc94d315db6d3 ****/
		%feature("compactdefaultargs") StepKinematics_RollingSurfacePairValue;
		%feature("autodoc", "Default constructor.

Returns
-------
None
") StepKinematics_RollingSurfacePairValue;
		 StepKinematics_RollingSurfacePairValue();

		/****************** ActualPointOnSurface ******************/
		/**** md5 signature: fa6d88116287e3fc164513fbb7583b2d ****/
		%feature("compactdefaultargs") ActualPointOnSurface;
		%feature("autodoc", "Returns field actualpointonsurface.

Returns
-------
opencascade::handle<StepGeom_PointOnSurface>
") ActualPointOnSurface;
		opencascade::handle<StepGeom_PointOnSurface> ActualPointOnSurface();

		/****************** ActualRotation ******************/
		/**** md5 signature: 30e9003df2dadd466d63b6d544fb4f7d ****/
		%feature("compactdefaultargs") ActualRotation;
		%feature("autodoc", "Returns field actualrotation.

Returns
-------
float
") ActualRotation;
		Standard_Real ActualRotation();

		/****************** Init ******************/
		/**** md5 signature: 1aaf353e6f00aa10d5345d308051aba7 ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Initialize all fields (own and inherited).

Parameters
----------
theRepresentationItem_Name: TCollection_HAsciiString
thePairValue_AppliesToPair: StepKinematics_KinematicPair
theActualPointOnSurface: StepGeom_PointOnSurface
theActualRotation: float

Returns
-------
None
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & theRepresentationItem_Name, const opencascade::handle<StepKinematics_KinematicPair> & thePairValue_AppliesToPair, const opencascade::handle<StepGeom_PointOnSurface> & theActualPointOnSurface, const Standard_Real theActualRotation);

		/****************** SetActualPointOnSurface ******************/
		/**** md5 signature: c7bd90fa0259485bb69c5208032b8176 ****/
		%feature("compactdefaultargs") SetActualPointOnSurface;
		%feature("autodoc", "Sets field actualpointonsurface.

Parameters
----------
theActualPointOnSurface: StepGeom_PointOnSurface

Returns
-------
None
") SetActualPointOnSurface;
		void SetActualPointOnSurface(const opencascade::handle<StepGeom_PointOnSurface> & theActualPointOnSurface);

		/****************** SetActualRotation ******************/
		/**** md5 signature: 770befc82d15c08b0b7b1dc4fb5e70e7 ****/
		%feature("compactdefaultargs") SetActualRotation;
		%feature("autodoc", "Sets field actualrotation.

Parameters
----------
theActualRotation: float

Returns
-------
None
") SetActualRotation;
		void SetActualRotation(const Standard_Real theActualRotation);

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
		/****************** StepKinematics_ScrewPairValue ******************/
		/**** md5 signature: d9039615094ffcce7c7485575eb721ba ****/
		%feature("compactdefaultargs") StepKinematics_ScrewPairValue;
		%feature("autodoc", "Default constructor.

Returns
-------
None
") StepKinematics_ScrewPairValue;
		 StepKinematics_ScrewPairValue();

		/****************** ActualRotation ******************/
		/**** md5 signature: 30e9003df2dadd466d63b6d544fb4f7d ****/
		%feature("compactdefaultargs") ActualRotation;
		%feature("autodoc", "Returns field actualrotation.

Returns
-------
float
") ActualRotation;
		Standard_Real ActualRotation();

		/****************** Init ******************/
		/**** md5 signature: 299e75865a1206ec88ce1960074d83ac ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Initialize all fields (own and inherited).

Parameters
----------
theRepresentationItem_Name: TCollection_HAsciiString
thePairValue_AppliesToPair: StepKinematics_KinematicPair
theActualRotation: float

Returns
-------
None
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & theRepresentationItem_Name, const opencascade::handle<StepKinematics_KinematicPair> & thePairValue_AppliesToPair, const Standard_Real theActualRotation);

		/****************** SetActualRotation ******************/
		/**** md5 signature: 770befc82d15c08b0b7b1dc4fb5e70e7 ****/
		%feature("compactdefaultargs") SetActualRotation;
		%feature("autodoc", "Sets field actualrotation.

Parameters
----------
theActualRotation: float

Returns
-------
None
") SetActualRotation;
		void SetActualRotation(const Standard_Real theActualRotation);

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
		/****************** StepKinematics_SlidingCurvePairValue ******************/
		/**** md5 signature: a34f25a13dfbc29c483e530258cbd526 ****/
		%feature("compactdefaultargs") StepKinematics_SlidingCurvePairValue;
		%feature("autodoc", "Default constructor.

Returns
-------
None
") StepKinematics_SlidingCurvePairValue;
		 StepKinematics_SlidingCurvePairValue();

		/****************** ActualPointOnCurve1 ******************/
		/**** md5 signature: 74ec7cdb97e0bb8eacdeda0d6dd7bfe9 ****/
		%feature("compactdefaultargs") ActualPointOnCurve1;
		%feature("autodoc", "Returns field actualpointoncurve1.

Returns
-------
opencascade::handle<StepGeom_PointOnCurve>
") ActualPointOnCurve1;
		opencascade::handle<StepGeom_PointOnCurve> ActualPointOnCurve1();

		/****************** ActualPointOnCurve2 ******************/
		/**** md5 signature: 294013b24fc22e1782ff8dc3687deed0 ****/
		%feature("compactdefaultargs") ActualPointOnCurve2;
		%feature("autodoc", "Returns field actualpointoncurve2.

Returns
-------
opencascade::handle<StepGeom_PointOnCurve>
") ActualPointOnCurve2;
		opencascade::handle<StepGeom_PointOnCurve> ActualPointOnCurve2();

		/****************** Init ******************/
		/**** md5 signature: 009635465c17772e1157d491dad9cce3 ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Initialize all fields (own and inherited).

Parameters
----------
theRepresentationItem_Name: TCollection_HAsciiString
thePairValue_AppliesToPair: StepKinematics_KinematicPair
theActualPointOnCurve1: StepGeom_PointOnCurve
theActualPointOnCurve2: StepGeom_PointOnCurve

Returns
-------
None
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & theRepresentationItem_Name, const opencascade::handle<StepKinematics_KinematicPair> & thePairValue_AppliesToPair, const opencascade::handle<StepGeom_PointOnCurve> & theActualPointOnCurve1, const opencascade::handle<StepGeom_PointOnCurve> & theActualPointOnCurve2);

		/****************** SetActualPointOnCurve1 ******************/
		/**** md5 signature: 5951372fe4c11a57858c04c47f987211 ****/
		%feature("compactdefaultargs") SetActualPointOnCurve1;
		%feature("autodoc", "Sets field actualpointoncurve1.

Parameters
----------
theActualPointOnCurve1: StepGeom_PointOnCurve

Returns
-------
None
") SetActualPointOnCurve1;
		void SetActualPointOnCurve1(const opencascade::handle<StepGeom_PointOnCurve> & theActualPointOnCurve1);

		/****************** SetActualPointOnCurve2 ******************/
		/**** md5 signature: 14ed1c3f88f68d86cdf34bc6bd0859ff ****/
		%feature("compactdefaultargs") SetActualPointOnCurve2;
		%feature("autodoc", "Sets field actualpointoncurve2.

Parameters
----------
theActualPointOnCurve2: StepGeom_PointOnCurve

Returns
-------
None
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
		/****************** StepKinematics_SlidingSurfacePairValue ******************/
		/**** md5 signature: dec289ca874807be2f477610b4283681 ****/
		%feature("compactdefaultargs") StepKinematics_SlidingSurfacePairValue;
		%feature("autodoc", "Default constructor.

Returns
-------
None
") StepKinematics_SlidingSurfacePairValue;
		 StepKinematics_SlidingSurfacePairValue();

		/****************** ActualPointOnSurface1 ******************/
		/**** md5 signature: 78d72fff5ce2897164342a95e36e88b1 ****/
		%feature("compactdefaultargs") ActualPointOnSurface1;
		%feature("autodoc", "Returns field actualpointonsurface1.

Returns
-------
opencascade::handle<StepGeom_PointOnSurface>
") ActualPointOnSurface1;
		opencascade::handle<StepGeom_PointOnSurface> ActualPointOnSurface1();

		/****************** ActualPointOnSurface2 ******************/
		/**** md5 signature: 2f16b8cb0434b48d68551b7cff2936af ****/
		%feature("compactdefaultargs") ActualPointOnSurface2;
		%feature("autodoc", "Returns field actualpointonsurface2.

Returns
-------
opencascade::handle<StepGeom_PointOnSurface>
") ActualPointOnSurface2;
		opencascade::handle<StepGeom_PointOnSurface> ActualPointOnSurface2();

		/****************** ActualRotation ******************/
		/**** md5 signature: 30e9003df2dadd466d63b6d544fb4f7d ****/
		%feature("compactdefaultargs") ActualRotation;
		%feature("autodoc", "Returns field actualrotation.

Returns
-------
float
") ActualRotation;
		Standard_Real ActualRotation();

		/****************** Init ******************/
		/**** md5 signature: 5f0fb1355cd1d84df755a9fd108d2dae ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Initialize all fields (own and inherited).

Parameters
----------
theRepresentationItem_Name: TCollection_HAsciiString
thePairValue_AppliesToPair: StepKinematics_KinematicPair
theActualPointOnSurface1: StepGeom_PointOnSurface
theActualPointOnSurface2: StepGeom_PointOnSurface
theActualRotation: float

Returns
-------
None
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & theRepresentationItem_Name, const opencascade::handle<StepKinematics_KinematicPair> & thePairValue_AppliesToPair, const opencascade::handle<StepGeom_PointOnSurface> & theActualPointOnSurface1, const opencascade::handle<StepGeom_PointOnSurface> & theActualPointOnSurface2, const Standard_Real theActualRotation);

		/****************** SetActualPointOnSurface1 ******************/
		/**** md5 signature: c1c1a93da181bfcc383953b12aae5097 ****/
		%feature("compactdefaultargs") SetActualPointOnSurface1;
		%feature("autodoc", "Sets field actualpointonsurface1.

Parameters
----------
theActualPointOnSurface1: StepGeom_PointOnSurface

Returns
-------
None
") SetActualPointOnSurface1;
		void SetActualPointOnSurface1(const opencascade::handle<StepGeom_PointOnSurface> & theActualPointOnSurface1);

		/****************** SetActualPointOnSurface2 ******************/
		/**** md5 signature: f4d2dbf68560b803672b1e2f428b2a4c ****/
		%feature("compactdefaultargs") SetActualPointOnSurface2;
		%feature("autodoc", "Sets field actualpointonsurface2.

Parameters
----------
theActualPointOnSurface2: StepGeom_PointOnSurface

Returns
-------
None
") SetActualPointOnSurface2;
		void SetActualPointOnSurface2(const opencascade::handle<StepGeom_PointOnSurface> & theActualPointOnSurface2);

		/****************** SetActualRotation ******************/
		/**** md5 signature: 770befc82d15c08b0b7b1dc4fb5e70e7 ****/
		%feature("compactdefaultargs") SetActualRotation;
		%feature("autodoc", "Sets field actualrotation.

Parameters
----------
theActualRotation: float

Returns
-------
None
") SetActualRotation;
		void SetActualRotation(const Standard_Real theActualRotation);

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
		/****************** StepKinematics_SphericalPairValue ******************/
		/**** md5 signature: cb2964f7a23dd9320611e2fe84943831 ****/
		%feature("compactdefaultargs") StepKinematics_SphericalPairValue;
		%feature("autodoc", "Default constructor.

Returns
-------
None
") StepKinematics_SphericalPairValue;
		 StepKinematics_SphericalPairValue();

		/****************** Init ******************/
		/**** md5 signature: f0a7b6e420e1e592424af0309a4dd8dd ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Initialize all fields (own and inherited).

Parameters
----------
theRepresentationItem_Name: TCollection_HAsciiString
thePairValue_AppliesToPair: StepKinematics_KinematicPair
theInputOrientation: StepKinematics_SpatialRotation

Returns
-------
None
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & theRepresentationItem_Name, const opencascade::handle<StepKinematics_KinematicPair> & thePairValue_AppliesToPair, const StepKinematics_SpatialRotation & theInputOrientation);

		/****************** InputOrientation ******************/
		/**** md5 signature: 9b03c85e2d0e574b3f079e8cfbfcff68 ****/
		%feature("compactdefaultargs") InputOrientation;
		%feature("autodoc", "Returns field inputorientation.

Returns
-------
StepKinematics_SpatialRotation
") InputOrientation;
		StepKinematics_SpatialRotation InputOrientation();

		/****************** SetInputOrientation ******************/
		/**** md5 signature: 0efe0641aff13b56d8fb1cc049d53623 ****/
		%feature("compactdefaultargs") SetInputOrientation;
		%feature("autodoc", "Sets field inputorientation.

Parameters
----------
theInputOrientation: StepKinematics_SpatialRotation

Returns
-------
None
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
		/****************** StepKinematics_UnconstrainedPairValue ******************/
		/**** md5 signature: 643a65c893c7ceb262e8c36e57736410 ****/
		%feature("compactdefaultargs") StepKinematics_UnconstrainedPairValue;
		%feature("autodoc", "Default constructor.

Returns
-------
None
") StepKinematics_UnconstrainedPairValue;
		 StepKinematics_UnconstrainedPairValue();

		/****************** ActualPlacement ******************/
		/**** md5 signature: 8cb67f0da2cba4bf65e344cf4a319c7f ****/
		%feature("compactdefaultargs") ActualPlacement;
		%feature("autodoc", "Returns field actualplacement.

Returns
-------
opencascade::handle<StepGeom_Axis2Placement3d>
") ActualPlacement;
		opencascade::handle<StepGeom_Axis2Placement3d> ActualPlacement();

		/****************** Init ******************/
		/**** md5 signature: d447b8d02f6a9f8cda858a2b58d851f9 ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Initialize all fields (own and inherited).

Parameters
----------
theRepresentationItem_Name: TCollection_HAsciiString
thePairValue_AppliesToPair: StepKinematics_KinematicPair
theActualPlacement: StepGeom_Axis2Placement3d

Returns
-------
None
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & theRepresentationItem_Name, const opencascade::handle<StepKinematics_KinematicPair> & thePairValue_AppliesToPair, const opencascade::handle<StepGeom_Axis2Placement3d> & theActualPlacement);

		/****************** SetActualPlacement ******************/
		/**** md5 signature: c0afec7db03a6f8fa2909ab78c4517ce ****/
		%feature("compactdefaultargs") SetActualPlacement;
		%feature("autodoc", "Sets field actualplacement.

Parameters
----------
theActualPlacement: StepGeom_Axis2Placement3d

Returns
-------
None
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
		/****************** StepKinematics_UniversalPairValue ******************/
		/**** md5 signature: 72783e9f515ad4793421ba46840d8641 ****/
		%feature("compactdefaultargs") StepKinematics_UniversalPairValue;
		%feature("autodoc", "Default constructor.

Returns
-------
None
") StepKinematics_UniversalPairValue;
		 StepKinematics_UniversalPairValue();

		/****************** FirstRotationAngle ******************/
		/**** md5 signature: 8a3b0ae88ec339540af2d7d84748efa7 ****/
		%feature("compactdefaultargs") FirstRotationAngle;
		%feature("autodoc", "Returns field firstrotationangle.

Returns
-------
float
") FirstRotationAngle;
		Standard_Real FirstRotationAngle();

		/****************** Init ******************/
		/**** md5 signature: bfcd3d912dd313776cc400e92493574f ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Initialize all fields (own and inherited).

Parameters
----------
theRepresentationItem_Name: TCollection_HAsciiString
thePairValue_AppliesToPair: StepKinematics_KinematicPair
theFirstRotationAngle: float
theSecondRotationAngle: float

Returns
-------
None
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & theRepresentationItem_Name, const opencascade::handle<StepKinematics_KinematicPair> & thePairValue_AppliesToPair, const Standard_Real theFirstRotationAngle, const Standard_Real theSecondRotationAngle);

		/****************** SecondRotationAngle ******************/
		/**** md5 signature: afb45d14b396702061a5f58c38024af6 ****/
		%feature("compactdefaultargs") SecondRotationAngle;
		%feature("autodoc", "Returns field secondrotationangle.

Returns
-------
float
") SecondRotationAngle;
		Standard_Real SecondRotationAngle();

		/****************** SetFirstRotationAngle ******************/
		/**** md5 signature: 13dfc914903578af9afe62b6d66d7a55 ****/
		%feature("compactdefaultargs") SetFirstRotationAngle;
		%feature("autodoc", "Sets field firstrotationangle.

Parameters
----------
theFirstRotationAngle: float

Returns
-------
None
") SetFirstRotationAngle;
		void SetFirstRotationAngle(const Standard_Real theFirstRotationAngle);

		/****************** SetSecondRotationAngle ******************/
		/**** md5 signature: 3a7d01f9da3ffd34848b493d19a187b4 ****/
		%feature("compactdefaultargs") SetSecondRotationAngle;
		%feature("autodoc", "Sets field secondrotationangle.

Parameters
----------
theSecondRotationAngle: float

Returns
-------
None
") SetSecondRotationAngle;
		void SetSecondRotationAngle(const Standard_Real theSecondRotationAngle);

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
		/****************** StepKinematics_CylindricalPair ******************/
		/**** md5 signature: 8fe73e1faba5e327ef318e3f62cb1df7 ****/
		%feature("compactdefaultargs") StepKinematics_CylindricalPair;
		%feature("autodoc", "Default constructor.

Returns
-------
None
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
		/****************** StepKinematics_FullyConstrainedPair ******************/
		/**** md5 signature: 034391b488f13c0514207d31488c774c ****/
		%feature("compactdefaultargs") StepKinematics_FullyConstrainedPair;
		%feature("autodoc", "Default constructor.

Returns
-------
None
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
		/****************** StepKinematics_GearPair ******************/
		/**** md5 signature: f453d6f19f588f5305c827bb588f0533 ****/
		%feature("compactdefaultargs") StepKinematics_GearPair;
		%feature("autodoc", "Default constructor.

Returns
-------
None
") StepKinematics_GearPair;
		 StepKinematics_GearPair();

		/****************** Bevel ******************/
		/**** md5 signature: 1ff31e0e37d1e4ea39bb4ed9c6beee27 ****/
		%feature("compactdefaultargs") Bevel;
		%feature("autodoc", "Returns field bevel.

Returns
-------
float
") Bevel;
		Standard_Real Bevel();

		/****************** GearRatio ******************/
		/**** md5 signature: 5759ee215f2e2d1f5b5d4c9d3122da8f ****/
		%feature("compactdefaultargs") GearRatio;
		%feature("autodoc", "Returns field gearratio.

Returns
-------
float
") GearRatio;
		Standard_Real GearRatio();

		/****************** HelicalAngle ******************/
		/**** md5 signature: 8ae31944750357cb6401503aab2f6343 ****/
		%feature("compactdefaultargs") HelicalAngle;
		%feature("autodoc", "Returns field helicalangle.

Returns
-------
float
") HelicalAngle;
		Standard_Real HelicalAngle();

		/****************** Init ******************/
		/**** md5 signature: 854f2c2bbcd43d30a3976b173428bf76 ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Initialize all fields (own and inherited).

Parameters
----------
theRepresentationItem_Name: TCollection_HAsciiString
theItemDefinedTransformation_Name: TCollection_HAsciiString
hasItemDefinedTransformation_Description: bool
theItemDefinedTransformation_Description: TCollection_HAsciiString
theItemDefinedTransformation_TransformItem1: StepRepr_RepresentationItem
theItemDefinedTransformation_TransformItem2: StepRepr_RepresentationItem
theKinematicPair_Joint: StepKinematics_KinematicJoint
theRadiusFirstLink: float
theRadiusSecondLink: float
theBevel: float
theHelicalAngle: float
theGearRatio: float

Returns
-------
None
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & theRepresentationItem_Name, const opencascade::handle<TCollection_HAsciiString> & theItemDefinedTransformation_Name, const Standard_Boolean hasItemDefinedTransformation_Description, const opencascade::handle<TCollection_HAsciiString> & theItemDefinedTransformation_Description, const opencascade::handle<StepRepr_RepresentationItem> & theItemDefinedTransformation_TransformItem1, const opencascade::handle<StepRepr_RepresentationItem> & theItemDefinedTransformation_TransformItem2, const opencascade::handle<StepKinematics_KinematicJoint> & theKinematicPair_Joint, const Standard_Real theRadiusFirstLink, const Standard_Real theRadiusSecondLink, const Standard_Real theBevel, const Standard_Real theHelicalAngle, const Standard_Real theGearRatio);

		/****************** RadiusFirstLink ******************/
		/**** md5 signature: b03c0d19f83a5da43ed4ee3c5cc39e78 ****/
		%feature("compactdefaultargs") RadiusFirstLink;
		%feature("autodoc", "Returns field radiusfirstlink.

Returns
-------
float
") RadiusFirstLink;
		Standard_Real RadiusFirstLink();

		/****************** RadiusSecondLink ******************/
		/**** md5 signature: 6fb8154978d19a8658333775cc96cbb1 ****/
		%feature("compactdefaultargs") RadiusSecondLink;
		%feature("autodoc", "Returns field radiussecondlink.

Returns
-------
float
") RadiusSecondLink;
		Standard_Real RadiusSecondLink();

		/****************** SetBevel ******************/
		/**** md5 signature: 7982385c4ff0b367cdc62b893322a344 ****/
		%feature("compactdefaultargs") SetBevel;
		%feature("autodoc", "Sets field bevel.

Parameters
----------
theBevel: float

Returns
-------
None
") SetBevel;
		void SetBevel(const Standard_Real theBevel);

		/****************** SetGearRatio ******************/
		/**** md5 signature: eb663fba64ffe82bbcf1f2a3d3a46059 ****/
		%feature("compactdefaultargs") SetGearRatio;
		%feature("autodoc", "Sets field gearratio.

Parameters
----------
theGearRatio: float

Returns
-------
None
") SetGearRatio;
		void SetGearRatio(const Standard_Real theGearRatio);

		/****************** SetHelicalAngle ******************/
		/**** md5 signature: aa2ee7a14a099eec065586836849e498 ****/
		%feature("compactdefaultargs") SetHelicalAngle;
		%feature("autodoc", "Sets field helicalangle.

Parameters
----------
theHelicalAngle: float

Returns
-------
None
") SetHelicalAngle;
		void SetHelicalAngle(const Standard_Real theHelicalAngle);

		/****************** SetRadiusFirstLink ******************/
		/**** md5 signature: 59fc9016ee1b5e70b3c2de518c7ecfe8 ****/
		%feature("compactdefaultargs") SetRadiusFirstLink;
		%feature("autodoc", "Sets field radiusfirstlink.

Parameters
----------
theRadiusFirstLink: float

Returns
-------
None
") SetRadiusFirstLink;
		void SetRadiusFirstLink(const Standard_Real theRadiusFirstLink);

		/****************** SetRadiusSecondLink ******************/
		/**** md5 signature: 272c98b0e105da7aa9071a79cd204a42 ****/
		%feature("compactdefaultargs") SetRadiusSecondLink;
		%feature("autodoc", "Sets field radiussecondlink.

Parameters
----------
theRadiusSecondLink: float

Returns
-------
None
") SetRadiusSecondLink;
		void SetRadiusSecondLink(const Standard_Real theRadiusSecondLink);

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
		/****************** StepKinematics_LinearFlexibleAndPinionPair ******************/
		/**** md5 signature: 1099fcbbea711b531d88da059dc05c20 ****/
		%feature("compactdefaultargs") StepKinematics_LinearFlexibleAndPinionPair;
		%feature("autodoc", "Default constructor.

Returns
-------
None
") StepKinematics_LinearFlexibleAndPinionPair;
		 StepKinematics_LinearFlexibleAndPinionPair();

		/****************** Init ******************/
		/**** md5 signature: e6f2a770b9795ae7e98cf88befcf1ed3 ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Initialize all fields (own and inherited).

Parameters
----------
theRepresentationItem_Name: TCollection_HAsciiString
theItemDefinedTransformation_Name: TCollection_HAsciiString
hasItemDefinedTransformation_Description: bool
theItemDefinedTransformation_Description: TCollection_HAsciiString
theItemDefinedTransformation_TransformItem1: StepRepr_RepresentationItem
theItemDefinedTransformation_TransformItem2: StepRepr_RepresentationItem
theKinematicPair_Joint: StepKinematics_KinematicJoint
thePinionRadius: float

Returns
-------
None
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & theRepresentationItem_Name, const opencascade::handle<TCollection_HAsciiString> & theItemDefinedTransformation_Name, const Standard_Boolean hasItemDefinedTransformation_Description, const opencascade::handle<TCollection_HAsciiString> & theItemDefinedTransformation_Description, const opencascade::handle<StepRepr_RepresentationItem> & theItemDefinedTransformation_TransformItem1, const opencascade::handle<StepRepr_RepresentationItem> & theItemDefinedTransformation_TransformItem2, const opencascade::handle<StepKinematics_KinematicJoint> & theKinematicPair_Joint, const Standard_Real thePinionRadius);

		/****************** PinionRadius ******************/
		/**** md5 signature: 2d1fcf7676fb9a4dbe2dd3a393133c16 ****/
		%feature("compactdefaultargs") PinionRadius;
		%feature("autodoc", "Returns field pinionradius.

Returns
-------
float
") PinionRadius;
		Standard_Real PinionRadius();

		/****************** SetPinionRadius ******************/
		/**** md5 signature: 63dc2cb6d56f5b5351e674090957bf1f ****/
		%feature("compactdefaultargs") SetPinionRadius;
		%feature("autodoc", "Sets field pinionradius.

Parameters
----------
thePinionRadius: float

Returns
-------
None
") SetPinionRadius;
		void SetPinionRadius(const Standard_Real thePinionRadius);

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
		/****************** StepKinematics_LinearFlexibleAndPlanarCurvePair ******************/
		/**** md5 signature: b69a80332d6d7c80110c0417d7383ad0 ****/
		%feature("compactdefaultargs") StepKinematics_LinearFlexibleAndPlanarCurvePair;
		%feature("autodoc", "Default constructor.

Returns
-------
None
") StepKinematics_LinearFlexibleAndPlanarCurvePair;
		 StepKinematics_LinearFlexibleAndPlanarCurvePair();

		/****************** Init ******************/
		/**** md5 signature: 7ee6eb9a88fd6ddfabbd67dbb1cd30fc ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Initialize all fields (own and inherited).

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

Returns
-------
None
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & theRepresentationItem_Name, const opencascade::handle<TCollection_HAsciiString> & theItemDefinedTransformation_Name, const Standard_Boolean hasItemDefinedTransformation_Description, const opencascade::handle<TCollection_HAsciiString> & theItemDefinedTransformation_Description, const opencascade::handle<StepRepr_RepresentationItem> & theItemDefinedTransformation_TransformItem1, const opencascade::handle<StepRepr_RepresentationItem> & theItemDefinedTransformation_TransformItem2, const opencascade::handle<StepKinematics_KinematicJoint> & theKinematicPair_Joint, const opencascade::handle<StepGeom_Curve> & thePairCurve, const Standard_Boolean theOrientation);

		/****************** Orientation ******************/
		/**** md5 signature: 52870aef84fd5af1a31fb4fa930c7f18 ****/
		%feature("compactdefaultargs") Orientation;
		%feature("autodoc", "Returns field orientation.

Returns
-------
bool
") Orientation;
		Standard_Boolean Orientation();

		/****************** PairCurve ******************/
		/**** md5 signature: 134d93ea7dbcb6acd77121e5a0c370cb ****/
		%feature("compactdefaultargs") PairCurve;
		%feature("autodoc", "Returns field paircurve.

Returns
-------
opencascade::handle<StepGeom_Curve>
") PairCurve;
		opencascade::handle<StepGeom_Curve> PairCurve();

		/****************** SetOrientation ******************/
		/**** md5 signature: 9610e39fc7ba754c602a10825afabd05 ****/
		%feature("compactdefaultargs") SetOrientation;
		%feature("autodoc", "Sets field orientation.

Parameters
----------
theOrientation: bool

Returns
-------
None
") SetOrientation;
		void SetOrientation(const Standard_Boolean theOrientation);

		/****************** SetPairCurve ******************/
		/**** md5 signature: c7703b05cf8a69dded5fc125ad8540a1 ****/
		%feature("compactdefaultargs") SetPairCurve;
		%feature("autodoc", "Sets field paircurve.

Parameters
----------
thePairCurve: StepGeom_Curve

Returns
-------
None
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
		/****************** StepKinematics_LowOrderKinematicPairWithRange ******************/
		/**** md5 signature: 0013f8dc8c45bfa17614515c84cb10d2 ****/
		%feature("compactdefaultargs") StepKinematics_LowOrderKinematicPairWithRange;
		%feature("autodoc", "Default constructor.

Returns
-------
None
") StepKinematics_LowOrderKinematicPairWithRange;
		 StepKinematics_LowOrderKinematicPairWithRange();

		/****************** HasLowerLimitActualRotationX ******************/
		/**** md5 signature: 35907d772d67c4d23a6eea14a706c61d ****/
		%feature("compactdefaultargs") HasLowerLimitActualRotationX;
		%feature("autodoc", "Returns true if optional field lowerlimitactualrotationx is defined.

Returns
-------
bool
") HasLowerLimitActualRotationX;
		Standard_Boolean HasLowerLimitActualRotationX();

		/****************** HasLowerLimitActualRotationY ******************/
		/**** md5 signature: 56a78634ce9a43b436f8e7df337ffba5 ****/
		%feature("compactdefaultargs") HasLowerLimitActualRotationY;
		%feature("autodoc", "Returns true if optional field lowerlimitactualrotationy is defined.

Returns
-------
bool
") HasLowerLimitActualRotationY;
		Standard_Boolean HasLowerLimitActualRotationY();

		/****************** HasLowerLimitActualRotationZ ******************/
		/**** md5 signature: 5a64c3517924ef91f47f9236c58be0e6 ****/
		%feature("compactdefaultargs") HasLowerLimitActualRotationZ;
		%feature("autodoc", "Returns true if optional field lowerlimitactualrotationz is defined.

Returns
-------
bool
") HasLowerLimitActualRotationZ;
		Standard_Boolean HasLowerLimitActualRotationZ();

		/****************** HasLowerLimitActualTranslationX ******************/
		/**** md5 signature: 84750c5a60573c63366b414bfb1ea469 ****/
		%feature("compactdefaultargs") HasLowerLimitActualTranslationX;
		%feature("autodoc", "Returns true if optional field lowerlimitactualtranslationx is defined.

Returns
-------
bool
") HasLowerLimitActualTranslationX;
		Standard_Boolean HasLowerLimitActualTranslationX();

		/****************** HasLowerLimitActualTranslationY ******************/
		/**** md5 signature: d48cec851c95860b788b6b9ccb5aee66 ****/
		%feature("compactdefaultargs") HasLowerLimitActualTranslationY;
		%feature("autodoc", "Returns true if optional field lowerlimitactualtranslationy is defined.

Returns
-------
bool
") HasLowerLimitActualTranslationY;
		Standard_Boolean HasLowerLimitActualTranslationY();

		/****************** HasLowerLimitActualTranslationZ ******************/
		/**** md5 signature: b6dcc1217f400c5f8a9755e463563adb ****/
		%feature("compactdefaultargs") HasLowerLimitActualTranslationZ;
		%feature("autodoc", "Returns true if optional field lowerlimitactualtranslationz is defined.

Returns
-------
bool
") HasLowerLimitActualTranslationZ;
		Standard_Boolean HasLowerLimitActualTranslationZ();

		/****************** HasUpperLimitActualRotationX ******************/
		/**** md5 signature: 7ab704748fa962c838059b8446b2445d ****/
		%feature("compactdefaultargs") HasUpperLimitActualRotationX;
		%feature("autodoc", "Returns true if optional field upperlimitactualrotationx is defined.

Returns
-------
bool
") HasUpperLimitActualRotationX;
		Standard_Boolean HasUpperLimitActualRotationX();

		/****************** HasUpperLimitActualRotationY ******************/
		/**** md5 signature: 5e69d16f3b402b17851c463efd455d76 ****/
		%feature("compactdefaultargs") HasUpperLimitActualRotationY;
		%feature("autodoc", "Returns true if optional field upperlimitactualrotationy is defined.

Returns
-------
bool
") HasUpperLimitActualRotationY;
		Standard_Boolean HasUpperLimitActualRotationY();

		/****************** HasUpperLimitActualRotationZ ******************/
		/**** md5 signature: 83e3bc44b3f2f017a2e2401e2d2867d2 ****/
		%feature("compactdefaultargs") HasUpperLimitActualRotationZ;
		%feature("autodoc", "Returns true if optional field upperlimitactualrotationz is defined.

Returns
-------
bool
") HasUpperLimitActualRotationZ;
		Standard_Boolean HasUpperLimitActualRotationZ();

		/****************** HasUpperLimitActualTranslationX ******************/
		/**** md5 signature: 06b365134561f1ac12bece58783cea2b ****/
		%feature("compactdefaultargs") HasUpperLimitActualTranslationX;
		%feature("autodoc", "Returns true if optional field upperlimitactualtranslationx is defined.

Returns
-------
bool
") HasUpperLimitActualTranslationX;
		Standard_Boolean HasUpperLimitActualTranslationX();

		/****************** HasUpperLimitActualTranslationY ******************/
		/**** md5 signature: d33d9f218a7ad05ca4e66cf7dee2feac ****/
		%feature("compactdefaultargs") HasUpperLimitActualTranslationY;
		%feature("autodoc", "Returns true if optional field upperlimitactualtranslationy is defined.

Returns
-------
bool
") HasUpperLimitActualTranslationY;
		Standard_Boolean HasUpperLimitActualTranslationY();

		/****************** HasUpperLimitActualTranslationZ ******************/
		/**** md5 signature: 186e9d07d94ed267a17621af50d559fb ****/
		%feature("compactdefaultargs") HasUpperLimitActualTranslationZ;
		%feature("autodoc", "Returns true if optional field upperlimitactualtranslationz is defined.

Returns
-------
bool
") HasUpperLimitActualTranslationZ;
		Standard_Boolean HasUpperLimitActualTranslationZ();

		/****************** Init ******************/
		/**** md5 signature: 0ea1465a58f571103a32cab2156e2787 ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Initialize all fields (own and inherited).

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
theLowerLimitActualRotationX: float
hasUpperLimitActualRotationX: bool
theUpperLimitActualRotationX: float
hasLowerLimitActualRotationY: bool
theLowerLimitActualRotationY: float
hasUpperLimitActualRotationY: bool
theUpperLimitActualRotationY: float
hasLowerLimitActualRotationZ: bool
theLowerLimitActualRotationZ: float
hasUpperLimitActualRotationZ: bool
theUpperLimitActualRotationZ: float
hasLowerLimitActualTranslationX: bool
theLowerLimitActualTranslationX: float
hasUpperLimitActualTranslationX: bool
theUpperLimitActualTranslationX: float
hasLowerLimitActualTranslationY: bool
theLowerLimitActualTranslationY: float
hasUpperLimitActualTranslationY: bool
theUpperLimitActualTranslationY: float
hasLowerLimitActualTranslationZ: bool
theLowerLimitActualTranslationZ: float
hasUpperLimitActualTranslationZ: bool
theUpperLimitActualTranslationZ: float

Returns
-------
None
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & theRepresentationItem_Name, const opencascade::handle<TCollection_HAsciiString> & theItemDefinedTransformation_Name, const Standard_Boolean hasItemDefinedTransformation_Description, const opencascade::handle<TCollection_HAsciiString> & theItemDefinedTransformation_Description, const opencascade::handle<StepRepr_RepresentationItem> & theItemDefinedTransformation_TransformItem1, const opencascade::handle<StepRepr_RepresentationItem> & theItemDefinedTransformation_TransformItem2, const opencascade::handle<StepKinematics_KinematicJoint> & theKinematicPair_Joint, const Standard_Boolean theLowOrderKinematicPair_TX, const Standard_Boolean theLowOrderKinematicPair_TY, const Standard_Boolean theLowOrderKinematicPair_TZ, const Standard_Boolean theLowOrderKinematicPair_RX, const Standard_Boolean theLowOrderKinematicPair_RY, const Standard_Boolean theLowOrderKinematicPair_RZ, const Standard_Boolean hasLowerLimitActualRotationX, const Standard_Real theLowerLimitActualRotationX, const Standard_Boolean hasUpperLimitActualRotationX, const Standard_Real theUpperLimitActualRotationX, const Standard_Boolean hasLowerLimitActualRotationY, const Standard_Real theLowerLimitActualRotationY, const Standard_Boolean hasUpperLimitActualRotationY, const Standard_Real theUpperLimitActualRotationY, const Standard_Boolean hasLowerLimitActualRotationZ, const Standard_Real theLowerLimitActualRotationZ, const Standard_Boolean hasUpperLimitActualRotationZ, const Standard_Real theUpperLimitActualRotationZ, const Standard_Boolean hasLowerLimitActualTranslationX, const Standard_Real theLowerLimitActualTranslationX, const Standard_Boolean hasUpperLimitActualTranslationX, const Standard_Real theUpperLimitActualTranslationX, const Standard_Boolean hasLowerLimitActualTranslationY, const Standard_Real theLowerLimitActualTranslationY, const Standard_Boolean hasUpperLimitActualTranslationY, const Standard_Real theUpperLimitActualTranslationY, const Standard_Boolean hasLowerLimitActualTranslationZ, const Standard_Real theLowerLimitActualTranslationZ, const Standard_Boolean hasUpperLimitActualTranslationZ, const Standard_Real theUpperLimitActualTranslationZ);

		/****************** LowerLimitActualRotationX ******************/
		/**** md5 signature: 8b97b5a9254d7ebd82f16d3e22b21cc7 ****/
		%feature("compactdefaultargs") LowerLimitActualRotationX;
		%feature("autodoc", "Returns field lowerlimitactualrotationx.

Returns
-------
float
") LowerLimitActualRotationX;
		Standard_Real LowerLimitActualRotationX();

		/****************** LowerLimitActualRotationY ******************/
		/**** md5 signature: 0103cc7c9948e44ec7ac6f89fca27d87 ****/
		%feature("compactdefaultargs") LowerLimitActualRotationY;
		%feature("autodoc", "Returns field lowerlimitactualrotationy.

Returns
-------
float
") LowerLimitActualRotationY;
		Standard_Real LowerLimitActualRotationY();

		/****************** LowerLimitActualRotationZ ******************/
		/**** md5 signature: 47944b6b97dc3fc9d94dda1ba631281e ****/
		%feature("compactdefaultargs") LowerLimitActualRotationZ;
		%feature("autodoc", "Returns field lowerlimitactualrotationz.

Returns
-------
float
") LowerLimitActualRotationZ;
		Standard_Real LowerLimitActualRotationZ();

		/****************** LowerLimitActualTranslationX ******************/
		/**** md5 signature: c6efa30a0704d2540db52de4d5c9d233 ****/
		%feature("compactdefaultargs") LowerLimitActualTranslationX;
		%feature("autodoc", "Returns field lowerlimitactualtranslationx.

Returns
-------
float
") LowerLimitActualTranslationX;
		Standard_Real LowerLimitActualTranslationX();

		/****************** LowerLimitActualTranslationY ******************/
		/**** md5 signature: 1df934faf95c599b869632babf805c13 ****/
		%feature("compactdefaultargs") LowerLimitActualTranslationY;
		%feature("autodoc", "Returns field lowerlimitactualtranslationy.

Returns
-------
float
") LowerLimitActualTranslationY;
		Standard_Real LowerLimitActualTranslationY();

		/****************** LowerLimitActualTranslationZ ******************/
		/**** md5 signature: 0bf6684e57c67a4031672c48ba39dbee ****/
		%feature("compactdefaultargs") LowerLimitActualTranslationZ;
		%feature("autodoc", "Returns field lowerlimitactualtranslationz.

Returns
-------
float
") LowerLimitActualTranslationZ;
		Standard_Real LowerLimitActualTranslationZ();

		/****************** SetLowerLimitActualRotationX ******************/
		/**** md5 signature: fa703f1415a142e3e5666de185585c78 ****/
		%feature("compactdefaultargs") SetLowerLimitActualRotationX;
		%feature("autodoc", "Sets field lowerlimitactualrotationx.

Parameters
----------
theLowerLimitActualRotationX: float

Returns
-------
None
") SetLowerLimitActualRotationX;
		void SetLowerLimitActualRotationX(const Standard_Real theLowerLimitActualRotationX);

		/****************** SetLowerLimitActualRotationY ******************/
		/**** md5 signature: 53dffe4e6a00f55ab531cf0f19b326a0 ****/
		%feature("compactdefaultargs") SetLowerLimitActualRotationY;
		%feature("autodoc", "Sets field lowerlimitactualrotationy.

Parameters
----------
theLowerLimitActualRotationY: float

Returns
-------
None
") SetLowerLimitActualRotationY;
		void SetLowerLimitActualRotationY(const Standard_Real theLowerLimitActualRotationY);

		/****************** SetLowerLimitActualRotationZ ******************/
		/**** md5 signature: c47644d4fe5b6b949709d344a3039443 ****/
		%feature("compactdefaultargs") SetLowerLimitActualRotationZ;
		%feature("autodoc", "Sets field lowerlimitactualrotationz.

Parameters
----------
theLowerLimitActualRotationZ: float

Returns
-------
None
") SetLowerLimitActualRotationZ;
		void SetLowerLimitActualRotationZ(const Standard_Real theLowerLimitActualRotationZ);

		/****************** SetLowerLimitActualTranslationX ******************/
		/**** md5 signature: fadf9b10ce37cb78cf5c01aece75d7e0 ****/
		%feature("compactdefaultargs") SetLowerLimitActualTranslationX;
		%feature("autodoc", "Sets field lowerlimitactualtranslationx.

Parameters
----------
theLowerLimitActualTranslationX: float

Returns
-------
None
") SetLowerLimitActualTranslationX;
		void SetLowerLimitActualTranslationX(const Standard_Real theLowerLimitActualTranslationX);

		/****************** SetLowerLimitActualTranslationY ******************/
		/**** md5 signature: b561083e96b17f20c1be6e3daebea5e3 ****/
		%feature("compactdefaultargs") SetLowerLimitActualTranslationY;
		%feature("autodoc", "Sets field lowerlimitactualtranslationy.

Parameters
----------
theLowerLimitActualTranslationY: float

Returns
-------
None
") SetLowerLimitActualTranslationY;
		void SetLowerLimitActualTranslationY(const Standard_Real theLowerLimitActualTranslationY);

		/****************** SetLowerLimitActualTranslationZ ******************/
		/**** md5 signature: 67bf7eb991d28413fd34829a119ac922 ****/
		%feature("compactdefaultargs") SetLowerLimitActualTranslationZ;
		%feature("autodoc", "Sets field lowerlimitactualtranslationz.

Parameters
----------
theLowerLimitActualTranslationZ: float

Returns
-------
None
") SetLowerLimitActualTranslationZ;
		void SetLowerLimitActualTranslationZ(const Standard_Real theLowerLimitActualTranslationZ);

		/****************** SetUpperLimitActualRotationX ******************/
		/**** md5 signature: 2be386c21c19487c4445e5ddbd753cfc ****/
		%feature("compactdefaultargs") SetUpperLimitActualRotationX;
		%feature("autodoc", "Sets field upperlimitactualrotationx.

Parameters
----------
theUpperLimitActualRotationX: float

Returns
-------
None
") SetUpperLimitActualRotationX;
		void SetUpperLimitActualRotationX(const Standard_Real theUpperLimitActualRotationX);

		/****************** SetUpperLimitActualRotationY ******************/
		/**** md5 signature: 0207e7f4d0a2d7b4c088c6816c9e0718 ****/
		%feature("compactdefaultargs") SetUpperLimitActualRotationY;
		%feature("autodoc", "Sets field upperlimitactualrotationy.

Parameters
----------
theUpperLimitActualRotationY: float

Returns
-------
None
") SetUpperLimitActualRotationY;
		void SetUpperLimitActualRotationY(const Standard_Real theUpperLimitActualRotationY);

		/****************** SetUpperLimitActualRotationZ ******************/
		/**** md5 signature: 6fb2a5805ae9504f74d02e3ebc8433b6 ****/
		%feature("compactdefaultargs") SetUpperLimitActualRotationZ;
		%feature("autodoc", "Sets field upperlimitactualrotationz.

Parameters
----------
theUpperLimitActualRotationZ: float

Returns
-------
None
") SetUpperLimitActualRotationZ;
		void SetUpperLimitActualRotationZ(const Standard_Real theUpperLimitActualRotationZ);

		/****************** SetUpperLimitActualTranslationX ******************/
		/**** md5 signature: ed987558115e6efffde9954562e07f6a ****/
		%feature("compactdefaultargs") SetUpperLimitActualTranslationX;
		%feature("autodoc", "Sets field upperlimitactualtranslationx.

Parameters
----------
theUpperLimitActualTranslationX: float

Returns
-------
None
") SetUpperLimitActualTranslationX;
		void SetUpperLimitActualTranslationX(const Standard_Real theUpperLimitActualTranslationX);

		/****************** SetUpperLimitActualTranslationY ******************/
		/**** md5 signature: 31b1518a07a02d6b35ee04f3612701c6 ****/
		%feature("compactdefaultargs") SetUpperLimitActualTranslationY;
		%feature("autodoc", "Sets field upperlimitactualtranslationy.

Parameters
----------
theUpperLimitActualTranslationY: float

Returns
-------
None
") SetUpperLimitActualTranslationY;
		void SetUpperLimitActualTranslationY(const Standard_Real theUpperLimitActualTranslationY);

		/****************** SetUpperLimitActualTranslationZ ******************/
		/**** md5 signature: 87ceaed892cfb91b51dbc48b13cb4430 ****/
		%feature("compactdefaultargs") SetUpperLimitActualTranslationZ;
		%feature("autodoc", "Sets field upperlimitactualtranslationz.

Parameters
----------
theUpperLimitActualTranslationZ: float

Returns
-------
None
") SetUpperLimitActualTranslationZ;
		void SetUpperLimitActualTranslationZ(const Standard_Real theUpperLimitActualTranslationZ);

		/****************** UpperLimitActualRotationX ******************/
		/**** md5 signature: 3363db57c2020a7dfcae6696efb56dfe ****/
		%feature("compactdefaultargs") UpperLimitActualRotationX;
		%feature("autodoc", "Returns field upperlimitactualrotationx.

Returns
-------
float
") UpperLimitActualRotationX;
		Standard_Real UpperLimitActualRotationX();

		/****************** UpperLimitActualRotationY ******************/
		/**** md5 signature: 464e865e00fcceb537326a95ab28dcce ****/
		%feature("compactdefaultargs") UpperLimitActualRotationY;
		%feature("autodoc", "Returns field upperlimitactualrotationy.

Returns
-------
float
") UpperLimitActualRotationY;
		Standard_Real UpperLimitActualRotationY();

		/****************** UpperLimitActualRotationZ ******************/
		/**** md5 signature: eccfe47eef21ce3734bb97688c94d011 ****/
		%feature("compactdefaultargs") UpperLimitActualRotationZ;
		%feature("autodoc", "Returns field upperlimitactualrotationz.

Returns
-------
float
") UpperLimitActualRotationZ;
		Standard_Real UpperLimitActualRotationZ();

		/****************** UpperLimitActualTranslationX ******************/
		/**** md5 signature: 61bb76275073270aef2851a409bef7d4 ****/
		%feature("compactdefaultargs") UpperLimitActualTranslationX;
		%feature("autodoc", "Returns field upperlimitactualtranslationx.

Returns
-------
float
") UpperLimitActualTranslationX;
		Standard_Real UpperLimitActualTranslationX();

		/****************** UpperLimitActualTranslationY ******************/
		/**** md5 signature: ab619622e872a6d4172114a8078d98bc ****/
		%feature("compactdefaultargs") UpperLimitActualTranslationY;
		%feature("autodoc", "Returns field upperlimitactualtranslationy.

Returns
-------
float
") UpperLimitActualTranslationY;
		Standard_Real UpperLimitActualTranslationY();

		/****************** UpperLimitActualTranslationZ ******************/
		/**** md5 signature: 3a0ecbf076227028ae15fad3c0baf6bf ****/
		%feature("compactdefaultargs") UpperLimitActualTranslationZ;
		%feature("autodoc", "Returns field upperlimitactualtranslationz.

Returns
-------
float
") UpperLimitActualTranslationZ;
		Standard_Real UpperLimitActualTranslationZ();

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
		/****************** StepKinematics_PlanarCurvePair ******************/
		/**** md5 signature: 65145978ad7bd08813095a0177bd47fc ****/
		%feature("compactdefaultargs") StepKinematics_PlanarCurvePair;
		%feature("autodoc", "Default constructor.

Returns
-------
None
") StepKinematics_PlanarCurvePair;
		 StepKinematics_PlanarCurvePair();

		/****************** Curve1 ******************/
		/**** md5 signature: 38d9e1830c41d81eb1e78ef0b7b3e832 ****/
		%feature("compactdefaultargs") Curve1;
		%feature("autodoc", "Returns field curve1.

Returns
-------
opencascade::handle<StepGeom_Curve>
") Curve1;
		opencascade::handle<StepGeom_Curve> Curve1();

		/****************** Curve2 ******************/
		/**** md5 signature: a8948e4ddb10287787277a8a9f46ef89 ****/
		%feature("compactdefaultargs") Curve2;
		%feature("autodoc", "Returns field curve2.

Returns
-------
opencascade::handle<StepGeom_Curve>
") Curve2;
		opencascade::handle<StepGeom_Curve> Curve2();

		/****************** Init ******************/
		/**** md5 signature: e78fbd760b4a911f9a650c536077a623 ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Initialize all fields (own and inherited).

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

Returns
-------
None
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & theRepresentationItem_Name, const opencascade::handle<TCollection_HAsciiString> & theItemDefinedTransformation_Name, const Standard_Boolean hasItemDefinedTransformation_Description, const opencascade::handle<TCollection_HAsciiString> & theItemDefinedTransformation_Description, const opencascade::handle<StepRepr_RepresentationItem> & theItemDefinedTransformation_TransformItem1, const opencascade::handle<StepRepr_RepresentationItem> & theItemDefinedTransformation_TransformItem2, const opencascade::handle<StepKinematics_KinematicJoint> & theKinematicPair_Joint, const opencascade::handle<StepGeom_Curve> & theCurve1, const opencascade::handle<StepGeom_Curve> & theCurve2, const Standard_Boolean theOrientation);

		/****************** Orientation ******************/
		/**** md5 signature: 52870aef84fd5af1a31fb4fa930c7f18 ****/
		%feature("compactdefaultargs") Orientation;
		%feature("autodoc", "Returns field orientation.

Returns
-------
bool
") Orientation;
		Standard_Boolean Orientation();

		/****************** SetCurve1 ******************/
		/**** md5 signature: d6f88e0f5ff12b588810345845fa51af ****/
		%feature("compactdefaultargs") SetCurve1;
		%feature("autodoc", "Sets field curve1.

Parameters
----------
theCurve1: StepGeom_Curve

Returns
-------
None
") SetCurve1;
		void SetCurve1(const opencascade::handle<StepGeom_Curve> & theCurve1);

		/****************** SetCurve2 ******************/
		/**** md5 signature: 0ff1d3b9924949ecae6fa78678a4a818 ****/
		%feature("compactdefaultargs") SetCurve2;
		%feature("autodoc", "Sets field curve2.

Parameters
----------
theCurve2: StepGeom_Curve

Returns
-------
None
") SetCurve2;
		void SetCurve2(const opencascade::handle<StepGeom_Curve> & theCurve2);

		/****************** SetOrientation ******************/
		/**** md5 signature: 9610e39fc7ba754c602a10825afabd05 ****/
		%feature("compactdefaultargs") SetOrientation;
		%feature("autodoc", "Sets field orientation.

Parameters
----------
theOrientation: bool

Returns
-------
None
") SetOrientation;
		void SetOrientation(const Standard_Boolean theOrientation);

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
		/****************** StepKinematics_PlanarPair ******************/
		/**** md5 signature: c89bac17977c7332317d3635065db327 ****/
		%feature("compactdefaultargs") StepKinematics_PlanarPair;
		%feature("autodoc", "Default constructor.

Returns
-------
None
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
		/****************** StepKinematics_PointOnPlanarCurvePair ******************/
		/**** md5 signature: 648b3de945568de4382386b002dbb5d4 ****/
		%feature("compactdefaultargs") StepKinematics_PointOnPlanarCurvePair;
		%feature("autodoc", "Default constructor.

Returns
-------
None
") StepKinematics_PointOnPlanarCurvePair;
		 StepKinematics_PointOnPlanarCurvePair();

		/****************** Init ******************/
		/**** md5 signature: 7ee6eb9a88fd6ddfabbd67dbb1cd30fc ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Initialize all fields (own and inherited).

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

Returns
-------
None
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & theRepresentationItem_Name, const opencascade::handle<TCollection_HAsciiString> & theItemDefinedTransformation_Name, const Standard_Boolean hasItemDefinedTransformation_Description, const opencascade::handle<TCollection_HAsciiString> & theItemDefinedTransformation_Description, const opencascade::handle<StepRepr_RepresentationItem> & theItemDefinedTransformation_TransformItem1, const opencascade::handle<StepRepr_RepresentationItem> & theItemDefinedTransformation_TransformItem2, const opencascade::handle<StepKinematics_KinematicJoint> & theKinematicPair_Joint, const opencascade::handle<StepGeom_Curve> & thePairCurve, const Standard_Boolean theOrientation);

		/****************** Orientation ******************/
		/**** md5 signature: 52870aef84fd5af1a31fb4fa930c7f18 ****/
		%feature("compactdefaultargs") Orientation;
		%feature("autodoc", "Returns field orientation.

Returns
-------
bool
") Orientation;
		Standard_Boolean Orientation();

		/****************** PairCurve ******************/
		/**** md5 signature: 134d93ea7dbcb6acd77121e5a0c370cb ****/
		%feature("compactdefaultargs") PairCurve;
		%feature("autodoc", "Returns field paircurve.

Returns
-------
opencascade::handle<StepGeom_Curve>
") PairCurve;
		opencascade::handle<StepGeom_Curve> PairCurve();

		/****************** SetOrientation ******************/
		/**** md5 signature: 9610e39fc7ba754c602a10825afabd05 ****/
		%feature("compactdefaultargs") SetOrientation;
		%feature("autodoc", "Sets field orientation.

Parameters
----------
theOrientation: bool

Returns
-------
None
") SetOrientation;
		void SetOrientation(const Standard_Boolean theOrientation);

		/****************** SetPairCurve ******************/
		/**** md5 signature: c7703b05cf8a69dded5fc125ad8540a1 ****/
		%feature("compactdefaultargs") SetPairCurve;
		%feature("autodoc", "Sets field paircurve.

Parameters
----------
thePairCurve: StepGeom_Curve

Returns
-------
None
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
		/****************** StepKinematics_PointOnSurfacePair ******************/
		/**** md5 signature: c2937cab5e43c64b73ec2715c09bff1f ****/
		%feature("compactdefaultargs") StepKinematics_PointOnSurfacePair;
		%feature("autodoc", "Default constructor.

Returns
-------
None
") StepKinematics_PointOnSurfacePair;
		 StepKinematics_PointOnSurfacePair();

		/****************** Init ******************/
		/**** md5 signature: 9add4a2d514254841a848b42ab070f54 ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Initialize all fields (own and inherited).

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

Returns
-------
None
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & theRepresentationItem_Name, const opencascade::handle<TCollection_HAsciiString> & theItemDefinedTransformation_Name, const Standard_Boolean hasItemDefinedTransformation_Description, const opencascade::handle<TCollection_HAsciiString> & theItemDefinedTransformation_Description, const opencascade::handle<StepRepr_RepresentationItem> & theItemDefinedTransformation_TransformItem1, const opencascade::handle<StepRepr_RepresentationItem> & theItemDefinedTransformation_TransformItem2, const opencascade::handle<StepKinematics_KinematicJoint> & theKinematicPair_Joint, const opencascade::handle<StepGeom_Surface> & thePairSurface);

		/****************** PairSurface ******************/
		/**** md5 signature: d5f228320e13c1711af3fa6469cac537 ****/
		%feature("compactdefaultargs") PairSurface;
		%feature("autodoc", "Returns field pairsurface.

Returns
-------
opencascade::handle<StepGeom_Surface>
") PairSurface;
		opencascade::handle<StepGeom_Surface> PairSurface();

		/****************** SetPairSurface ******************/
		/**** md5 signature: a47817da0349e71e900a7e489de4bff0 ****/
		%feature("compactdefaultargs") SetPairSurface;
		%feature("autodoc", "Sets field pairsurface.

Parameters
----------
thePairSurface: StepGeom_Surface

Returns
-------
None
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
		/****************** StepKinematics_PrismaticPair ******************/
		/**** md5 signature: bf49b0edde21b1d4b256c388fd35fdc2 ****/
		%feature("compactdefaultargs") StepKinematics_PrismaticPair;
		%feature("autodoc", "Default constructor.

Returns
-------
None
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
		/****************** StepKinematics_RackAndPinionPair ******************/
		/**** md5 signature: 96dff766a20efed782c526def0a9406a ****/
		%feature("compactdefaultargs") StepKinematics_RackAndPinionPair;
		%feature("autodoc", "Default constructor.

Returns
-------
None
") StepKinematics_RackAndPinionPair;
		 StepKinematics_RackAndPinionPair();

		/****************** Init ******************/
		/**** md5 signature: e6f2a770b9795ae7e98cf88befcf1ed3 ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Initialize all fields (own and inherited).

Parameters
----------
theRepresentationItem_Name: TCollection_HAsciiString
theItemDefinedTransformation_Name: TCollection_HAsciiString
hasItemDefinedTransformation_Description: bool
theItemDefinedTransformation_Description: TCollection_HAsciiString
theItemDefinedTransformation_TransformItem1: StepRepr_RepresentationItem
theItemDefinedTransformation_TransformItem2: StepRepr_RepresentationItem
theKinematicPair_Joint: StepKinematics_KinematicJoint
thePinionRadius: float

Returns
-------
None
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & theRepresentationItem_Name, const opencascade::handle<TCollection_HAsciiString> & theItemDefinedTransformation_Name, const Standard_Boolean hasItemDefinedTransformation_Description, const opencascade::handle<TCollection_HAsciiString> & theItemDefinedTransformation_Description, const opencascade::handle<StepRepr_RepresentationItem> & theItemDefinedTransformation_TransformItem1, const opencascade::handle<StepRepr_RepresentationItem> & theItemDefinedTransformation_TransformItem2, const opencascade::handle<StepKinematics_KinematicJoint> & theKinematicPair_Joint, const Standard_Real thePinionRadius);

		/****************** PinionRadius ******************/
		/**** md5 signature: 2d1fcf7676fb9a4dbe2dd3a393133c16 ****/
		%feature("compactdefaultargs") PinionRadius;
		%feature("autodoc", "Returns field pinionradius.

Returns
-------
float
") PinionRadius;
		Standard_Real PinionRadius();

		/****************** SetPinionRadius ******************/
		/**** md5 signature: 63dc2cb6d56f5b5351e674090957bf1f ****/
		%feature("compactdefaultargs") SetPinionRadius;
		%feature("autodoc", "Sets field pinionradius.

Parameters
----------
thePinionRadius: float

Returns
-------
None
") SetPinionRadius;
		void SetPinionRadius(const Standard_Real thePinionRadius);

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
		/****************** StepKinematics_RevolutePair ******************/
		/**** md5 signature: d2043baef719d258a078cf388dc06c41 ****/
		%feature("compactdefaultargs") StepKinematics_RevolutePair;
		%feature("autodoc", "Default constructor.

Returns
-------
None
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
		/****************** StepKinematics_ScrewPair ******************/
		/**** md5 signature: 5eca29bef2446692fe681b02a5ac762b ****/
		%feature("compactdefaultargs") StepKinematics_ScrewPair;
		%feature("autodoc", "Default constructor.

Returns
-------
None
") StepKinematics_ScrewPair;
		 StepKinematics_ScrewPair();

		/****************** Init ******************/
		/**** md5 signature: 0bf6b47185be3a2fc2f190df9cd47b8d ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Initialize all fields (own and inherited).

Parameters
----------
theRepresentationItem_Name: TCollection_HAsciiString
theItemDefinedTransformation_Name: TCollection_HAsciiString
hasItemDefinedTransformation_Description: bool
theItemDefinedTransformation_Description: TCollection_HAsciiString
theItemDefinedTransformation_TransformItem1: StepRepr_RepresentationItem
theItemDefinedTransformation_TransformItem2: StepRepr_RepresentationItem
theKinematicPair_Joint: StepKinematics_KinematicJoint
thePitch: float

Returns
-------
None
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & theRepresentationItem_Name, const opencascade::handle<TCollection_HAsciiString> & theItemDefinedTransformation_Name, const Standard_Boolean hasItemDefinedTransformation_Description, const opencascade::handle<TCollection_HAsciiString> & theItemDefinedTransformation_Description, const opencascade::handle<StepRepr_RepresentationItem> & theItemDefinedTransformation_TransformItem1, const opencascade::handle<StepRepr_RepresentationItem> & theItemDefinedTransformation_TransformItem2, const opencascade::handle<StepKinematics_KinematicJoint> & theKinematicPair_Joint, const Standard_Real thePitch);

		/****************** Pitch ******************/
		/**** md5 signature: 8ec062ae5f947c54018c0e68f0905096 ****/
		%feature("compactdefaultargs") Pitch;
		%feature("autodoc", "Returns field pitch.

Returns
-------
float
") Pitch;
		Standard_Real Pitch();

		/****************** SetPitch ******************/
		/**** md5 signature: 46ae8dd2c567d0891d54371bfe791c0f ****/
		%feature("compactdefaultargs") SetPitch;
		%feature("autodoc", "Sets field pitch.

Parameters
----------
thePitch: float

Returns
-------
None
") SetPitch;
		void SetPitch(const Standard_Real thePitch);

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
		/****************** StepKinematics_SphericalPair ******************/
		/**** md5 signature: 7ca2dd35ff5d5622fa9ef3b067b329e2 ****/
		%feature("compactdefaultargs") StepKinematics_SphericalPair;
		%feature("autodoc", "Default constructor.

Returns
-------
None
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
		/****************** StepKinematics_SphericalPairWithPin ******************/
		/**** md5 signature: a7cab104c4c699ef08a600b83df8ec5b ****/
		%feature("compactdefaultargs") StepKinematics_SphericalPairWithPin;
		%feature("autodoc", "Default constructor.

Returns
-------
None
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
		/****************** StepKinematics_SurfacePair ******************/
		/**** md5 signature: dda2d032217f558e69d8e27125ec65dd ****/
		%feature("compactdefaultargs") StepKinematics_SurfacePair;
		%feature("autodoc", "Default constructor.

Returns
-------
None
") StepKinematics_SurfacePair;
		 StepKinematics_SurfacePair();

		/****************** Init ******************/
		/**** md5 signature: 3051d7e4cbb649d74dbee2e04b2dd3c2 ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Initialize all fields (own and inherited).

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

Returns
-------
None
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & theRepresentationItem_Name, const opencascade::handle<TCollection_HAsciiString> & theItemDefinedTransformation_Name, const Standard_Boolean hasItemDefinedTransformation_Description, const opencascade::handle<TCollection_HAsciiString> & theItemDefinedTransformation_Description, const opencascade::handle<StepRepr_RepresentationItem> & theItemDefinedTransformation_TransformItem1, const opencascade::handle<StepRepr_RepresentationItem> & theItemDefinedTransformation_TransformItem2, const opencascade::handle<StepKinematics_KinematicJoint> & theKinematicPair_Joint, const opencascade::handle<StepGeom_Surface> & theSurface1, const opencascade::handle<StepGeom_Surface> & theSurface2, const Standard_Boolean theOrientation);

		/****************** Orientation ******************/
		/**** md5 signature: 52870aef84fd5af1a31fb4fa930c7f18 ****/
		%feature("compactdefaultargs") Orientation;
		%feature("autodoc", "Returns field orientation.

Returns
-------
bool
") Orientation;
		Standard_Boolean Orientation();

		/****************** SetOrientation ******************/
		/**** md5 signature: 9610e39fc7ba754c602a10825afabd05 ****/
		%feature("compactdefaultargs") SetOrientation;
		%feature("autodoc", "Sets field orientation.

Parameters
----------
theOrientation: bool

Returns
-------
None
") SetOrientation;
		void SetOrientation(const Standard_Boolean theOrientation);

		/****************** SetSurface1 ******************/
		/**** md5 signature: 4b6ea8ec750c5606e715c278eba6e37a ****/
		%feature("compactdefaultargs") SetSurface1;
		%feature("autodoc", "Sets field surface1.

Parameters
----------
theSurface1: StepGeom_Surface

Returns
-------
None
") SetSurface1;
		void SetSurface1(const opencascade::handle<StepGeom_Surface> & theSurface1);

		/****************** SetSurface2 ******************/
		/**** md5 signature: 9c0cdbddaf7a105c3735365a67eaeb60 ****/
		%feature("compactdefaultargs") SetSurface2;
		%feature("autodoc", "Sets field surface2.

Parameters
----------
theSurface2: StepGeom_Surface

Returns
-------
None
") SetSurface2;
		void SetSurface2(const opencascade::handle<StepGeom_Surface> & theSurface2);

		/****************** Surface1 ******************/
		/**** md5 signature: 085bcd9d9bf7a7859676d97c8c5f5b7e ****/
		%feature("compactdefaultargs") Surface1;
		%feature("autodoc", "Returns field surface1.

Returns
-------
opencascade::handle<StepGeom_Surface>
") Surface1;
		opencascade::handle<StepGeom_Surface> Surface1();

		/****************** Surface2 ******************/
		/**** md5 signature: 8e4a486e06cfb534e305ffc1363fd037 ****/
		%feature("compactdefaultargs") Surface2;
		%feature("autodoc", "Returns field surface2.

Returns
-------
opencascade::handle<StepGeom_Surface>
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
		/****************** StepKinematics_UnconstrainedPair ******************/
		/**** md5 signature: 6250ea5aca856722814d63563eac80d9 ****/
		%feature("compactdefaultargs") StepKinematics_UnconstrainedPair;
		%feature("autodoc", "Default constructor.

Returns
-------
None
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
		/****************** StepKinematics_UniversalPair ******************/
		/**** md5 signature: b721b521bfabf5952406119285b2cbab ****/
		%feature("compactdefaultargs") StepKinematics_UniversalPair;
		%feature("autodoc", "Default constructor.

Returns
-------
None
") StepKinematics_UniversalPair;
		 StepKinematics_UniversalPair();

		/****************** HasInputSkewAngle ******************/
		/**** md5 signature: 8022159ffa20aa2ddf1515695ee4e461 ****/
		%feature("compactdefaultargs") HasInputSkewAngle;
		%feature("autodoc", "Returns true if optional field inputskewangle is defined.

Returns
-------
bool
") HasInputSkewAngle;
		Standard_Boolean HasInputSkewAngle();

		/****************** Init ******************/
		/**** md5 signature: 6a375b329b2e8923fac6b9d069b26795 ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Initialize all fields (own and inherited).

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
theInputSkewAngle: float

Returns
-------
None
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & theRepresentationItem_Name, const opencascade::handle<TCollection_HAsciiString> & theItemDefinedTransformation_Name, const Standard_Boolean hasItemDefinedTransformation_Description, const opencascade::handle<TCollection_HAsciiString> & theItemDefinedTransformation_Description, const opencascade::handle<StepRepr_RepresentationItem> & theItemDefinedTransformation_TransformItem1, const opencascade::handle<StepRepr_RepresentationItem> & theItemDefinedTransformation_TransformItem2, const opencascade::handle<StepKinematics_KinematicJoint> & theKinematicPair_Joint, const Standard_Boolean theLowOrderKinematicPair_TX, const Standard_Boolean theLowOrderKinematicPair_TY, const Standard_Boolean theLowOrderKinematicPair_TZ, const Standard_Boolean theLowOrderKinematicPair_RX, const Standard_Boolean theLowOrderKinematicPair_RY, const Standard_Boolean theLowOrderKinematicPair_RZ, const Standard_Boolean hasInputSkewAngle, const Standard_Real theInputSkewAngle);

		/****************** InputSkewAngle ******************/
		/**** md5 signature: 88e7b17106f56d4b80dc1e9beccc7228 ****/
		%feature("compactdefaultargs") InputSkewAngle;
		%feature("autodoc", "Returns field inputskewangle.

Returns
-------
float
") InputSkewAngle;
		Standard_Real InputSkewAngle();

		/****************** SetInputSkewAngle ******************/
		/**** md5 signature: e248596be177cd936d007f22db56ea84 ****/
		%feature("compactdefaultargs") SetInputSkewAngle;
		%feature("autodoc", "Sets field inputskewangle.

Parameters
----------
theInputSkewAngle: float

Returns
-------
None
") SetInputSkewAngle;
		void SetInputSkewAngle(const Standard_Real theInputSkewAngle);

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
		/****************** StepKinematics_CylindricalPairWithRange ******************/
		/**** md5 signature: b2072c411b39e12c44bfab0020806b6e ****/
		%feature("compactdefaultargs") StepKinematics_CylindricalPairWithRange;
		%feature("autodoc", "Default constructor.

Returns
-------
None
") StepKinematics_CylindricalPairWithRange;
		 StepKinematics_CylindricalPairWithRange();

		/****************** HasLowerLimitActualRotation ******************/
		/**** md5 signature: e0eabf1d75b84dc61065385143e77e72 ****/
		%feature("compactdefaultargs") HasLowerLimitActualRotation;
		%feature("autodoc", "Returns true if optional field lowerlimitactualrotation is defined.

Returns
-------
bool
") HasLowerLimitActualRotation;
		Standard_Boolean HasLowerLimitActualRotation();

		/****************** HasLowerLimitActualTranslation ******************/
		/**** md5 signature: 1a289a26b8ae2f88cb1f123cde1aba54 ****/
		%feature("compactdefaultargs") HasLowerLimitActualTranslation;
		%feature("autodoc", "Returns true if optional field lowerlimitactualtranslation is defined.

Returns
-------
bool
") HasLowerLimitActualTranslation;
		Standard_Boolean HasLowerLimitActualTranslation();

		/****************** HasUpperLimitActualRotation ******************/
		/**** md5 signature: ee7a165ac58a511590471aeded6017a3 ****/
		%feature("compactdefaultargs") HasUpperLimitActualRotation;
		%feature("autodoc", "Returns true if optional field upperlimitactualrotation is defined.

Returns
-------
bool
") HasUpperLimitActualRotation;
		Standard_Boolean HasUpperLimitActualRotation();

		/****************** HasUpperLimitActualTranslation ******************/
		/**** md5 signature: cdf598668fd5fd5829ed3088c3d514f7 ****/
		%feature("compactdefaultargs") HasUpperLimitActualTranslation;
		%feature("autodoc", "Returns true if optional field upperlimitactualtranslation is defined.

Returns
-------
bool
") HasUpperLimitActualTranslation;
		Standard_Boolean HasUpperLimitActualTranslation();

		/****************** Init ******************/
		/**** md5 signature: a2f7fbe52a4e5f87689eb98240a18f80 ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Initialize all fields (own and inherited).

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
theLowerLimitActualTranslation: float
hasUpperLimitActualTranslation: bool
theUpperLimitActualTranslation: float
hasLowerLimitActualRotation: bool
theLowerLimitActualRotation: float
hasUpperLimitActualRotation: bool
theUpperLimitActualRotation: float

Returns
-------
None
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & theRepresentationItem_Name, const opencascade::handle<TCollection_HAsciiString> & theItemDefinedTransformation_Name, const Standard_Boolean hasItemDefinedTransformation_Description, const opencascade::handle<TCollection_HAsciiString> & theItemDefinedTransformation_Description, const opencascade::handle<StepRepr_RepresentationItem> & theItemDefinedTransformation_TransformItem1, const opencascade::handle<StepRepr_RepresentationItem> & theItemDefinedTransformation_TransformItem2, const opencascade::handle<StepKinematics_KinematicJoint> & theKinematicPair_Joint, const Standard_Boolean theLowOrderKinematicPair_TX, const Standard_Boolean theLowOrderKinematicPair_TY, const Standard_Boolean theLowOrderKinematicPair_TZ, const Standard_Boolean theLowOrderKinematicPair_RX, const Standard_Boolean theLowOrderKinematicPair_RY, const Standard_Boolean theLowOrderKinematicPair_RZ, const Standard_Boolean hasLowerLimitActualTranslation, const Standard_Real theLowerLimitActualTranslation, const Standard_Boolean hasUpperLimitActualTranslation, const Standard_Real theUpperLimitActualTranslation, const Standard_Boolean hasLowerLimitActualRotation, const Standard_Real theLowerLimitActualRotation, const Standard_Boolean hasUpperLimitActualRotation, const Standard_Real theUpperLimitActualRotation);

		/****************** LowerLimitActualRotation ******************/
		/**** md5 signature: 55bbdb3a328206d6d00815bb43b23ff8 ****/
		%feature("compactdefaultargs") LowerLimitActualRotation;
		%feature("autodoc", "Returns field lowerlimitactualrotation.

Returns
-------
float
") LowerLimitActualRotation;
		Standard_Real LowerLimitActualRotation();

		/****************** LowerLimitActualTranslation ******************/
		/**** md5 signature: 97ee57a369ca7daed593022f79b99ab2 ****/
		%feature("compactdefaultargs") LowerLimitActualTranslation;
		%feature("autodoc", "Returns field lowerlimitactualtranslation.

Returns
-------
float
") LowerLimitActualTranslation;
		Standard_Real LowerLimitActualTranslation();

		/****************** SetLowerLimitActualRotation ******************/
		/**** md5 signature: 73a00046a1364069734e82d7c22e794c ****/
		%feature("compactdefaultargs") SetLowerLimitActualRotation;
		%feature("autodoc", "Sets field lowerlimitactualrotation.

Parameters
----------
theLowerLimitActualRotation: float

Returns
-------
None
") SetLowerLimitActualRotation;
		void SetLowerLimitActualRotation(const Standard_Real theLowerLimitActualRotation);

		/****************** SetLowerLimitActualTranslation ******************/
		/**** md5 signature: a1716b6d6f0ea33b5c0faa34bc2f5a0e ****/
		%feature("compactdefaultargs") SetLowerLimitActualTranslation;
		%feature("autodoc", "Sets field lowerlimitactualtranslation.

Parameters
----------
theLowerLimitActualTranslation: float

Returns
-------
None
") SetLowerLimitActualTranslation;
		void SetLowerLimitActualTranslation(const Standard_Real theLowerLimitActualTranslation);

		/****************** SetUpperLimitActualRotation ******************/
		/**** md5 signature: 34c9a0a444827c9157f0a3f1f15a0cf1 ****/
		%feature("compactdefaultargs") SetUpperLimitActualRotation;
		%feature("autodoc", "Sets field upperlimitactualrotation.

Parameters
----------
theUpperLimitActualRotation: float

Returns
-------
None
") SetUpperLimitActualRotation;
		void SetUpperLimitActualRotation(const Standard_Real theUpperLimitActualRotation);

		/****************** SetUpperLimitActualTranslation ******************/
		/**** md5 signature: fc6e218ec907595a913caec2e23a014c ****/
		%feature("compactdefaultargs") SetUpperLimitActualTranslation;
		%feature("autodoc", "Sets field upperlimitactualtranslation.

Parameters
----------
theUpperLimitActualTranslation: float

Returns
-------
None
") SetUpperLimitActualTranslation;
		void SetUpperLimitActualTranslation(const Standard_Real theUpperLimitActualTranslation);

		/****************** UpperLimitActualRotation ******************/
		/**** md5 signature: e46843824e59bbabdebb3131db45b06a ****/
		%feature("compactdefaultargs") UpperLimitActualRotation;
		%feature("autodoc", "Returns field upperlimitactualrotation.

Returns
-------
float
") UpperLimitActualRotation;
		Standard_Real UpperLimitActualRotation();

		/****************** UpperLimitActualTranslation ******************/
		/**** md5 signature: 684275e4d7ba2daf91a796102cd97460 ****/
		%feature("compactdefaultargs") UpperLimitActualTranslation;
		%feature("autodoc", "Returns field upperlimitactualtranslation.

Returns
-------
float
") UpperLimitActualTranslation;
		Standard_Real UpperLimitActualTranslation();

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
		/****************** StepKinematics_GearPairWithRange ******************/
		/**** md5 signature: b8ca85501e50200b044abe88208b3e6e ****/
		%feature("compactdefaultargs") StepKinematics_GearPairWithRange;
		%feature("autodoc", "Default constructor.

Returns
-------
None
") StepKinematics_GearPairWithRange;
		 StepKinematics_GearPairWithRange();

		/****************** HasLowerLimitActualRotation1 ******************/
		/**** md5 signature: 796005112f85369ff64928393448c9e5 ****/
		%feature("compactdefaultargs") HasLowerLimitActualRotation1;
		%feature("autodoc", "Returns true if optional field lowerlimitactualrotation1 is defined.

Returns
-------
bool
") HasLowerLimitActualRotation1;
		Standard_Boolean HasLowerLimitActualRotation1();

		/****************** HasUpperLimitActualRotation1 ******************/
		/**** md5 signature: 506884180cf15076523e42475f80785c ****/
		%feature("compactdefaultargs") HasUpperLimitActualRotation1;
		%feature("autodoc", "Returns true if optional field upperlimitactualrotation1 is defined.

Returns
-------
bool
") HasUpperLimitActualRotation1;
		Standard_Boolean HasUpperLimitActualRotation1();

		/****************** Init ******************/
		/**** md5 signature: 9ef54c5935ca666cefadbd1c26219084 ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Initialize all fields (own and inherited).

Parameters
----------
theRepresentationItem_Name: TCollection_HAsciiString
theItemDefinedTransformation_Name: TCollection_HAsciiString
hasItemDefinedTransformation_Description: bool
theItemDefinedTransformation_Description: TCollection_HAsciiString
theItemDefinedTransformation_TransformItem1: StepRepr_RepresentationItem
theItemDefinedTransformation_TransformItem2: StepRepr_RepresentationItem
theKinematicPair_Joint: StepKinematics_KinematicJoint
theGearPair_RadiusFirstLink: float
theGearPair_RadiusSecondLink: float
theGearPair_Bevel: float
theGearPair_HelicalAngle: float
theGearPair_GearRatio: float
hasLowerLimitActualRotation1: bool
theLowerLimitActualRotation1: float
hasUpperLimitActualRotation1: bool
theUpperLimitActualRotation1: float

Returns
-------
None
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & theRepresentationItem_Name, const opencascade::handle<TCollection_HAsciiString> & theItemDefinedTransformation_Name, const Standard_Boolean hasItemDefinedTransformation_Description, const opencascade::handle<TCollection_HAsciiString> & theItemDefinedTransformation_Description, const opencascade::handle<StepRepr_RepresentationItem> & theItemDefinedTransformation_TransformItem1, const opencascade::handle<StepRepr_RepresentationItem> & theItemDefinedTransformation_TransformItem2, const opencascade::handle<StepKinematics_KinematicJoint> & theKinematicPair_Joint, const Standard_Real theGearPair_RadiusFirstLink, const Standard_Real theGearPair_RadiusSecondLink, const Standard_Real theGearPair_Bevel, const Standard_Real theGearPair_HelicalAngle, const Standard_Real theGearPair_GearRatio, const Standard_Boolean hasLowerLimitActualRotation1, const Standard_Real theLowerLimitActualRotation1, const Standard_Boolean hasUpperLimitActualRotation1, const Standard_Real theUpperLimitActualRotation1);

		/****************** LowerLimitActualRotation1 ******************/
		/**** md5 signature: 18fce592cc48e113045d23e470b8a2b8 ****/
		%feature("compactdefaultargs") LowerLimitActualRotation1;
		%feature("autodoc", "Returns field lowerlimitactualrotation1.

Returns
-------
float
") LowerLimitActualRotation1;
		Standard_Real LowerLimitActualRotation1();

		/****************** SetLowerLimitActualRotation1 ******************/
		/**** md5 signature: 0bc9ec161681dd997298e3015c69dc58 ****/
		%feature("compactdefaultargs") SetLowerLimitActualRotation1;
		%feature("autodoc", "Sets field lowerlimitactualrotation1.

Parameters
----------
theLowerLimitActualRotation1: float

Returns
-------
None
") SetLowerLimitActualRotation1;
		void SetLowerLimitActualRotation1(const Standard_Real theLowerLimitActualRotation1);

		/****************** SetUpperLimitActualRotation1 ******************/
		/**** md5 signature: 2a02df5aee5c611dbbacaa501012b049 ****/
		%feature("compactdefaultargs") SetUpperLimitActualRotation1;
		%feature("autodoc", "Sets field upperlimitactualrotation1.

Parameters
----------
theUpperLimitActualRotation1: float

Returns
-------
None
") SetUpperLimitActualRotation1;
		void SetUpperLimitActualRotation1(const Standard_Real theUpperLimitActualRotation1);

		/****************** UpperLimitActualRotation1 ******************/
		/**** md5 signature: 4364c320aa3d7c5740fb6532b95ef4a8 ****/
		%feature("compactdefaultargs") UpperLimitActualRotation1;
		%feature("autodoc", "Returns field upperlimitactualrotation1.

Returns
-------
float
") UpperLimitActualRotation1;
		Standard_Real UpperLimitActualRotation1();

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
		/****************** StepKinematics_HomokineticPair ******************/
		/**** md5 signature: de886b3e3c83e2a375f571b3bb4b740d ****/
		%feature("compactdefaultargs") StepKinematics_HomokineticPair;
		%feature("autodoc", "Default constructor.

Returns
-------
None
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
		/****************** StepKinematics_PlanarCurvePairRange ******************/
		/**** md5 signature: 9ed28cbd153b2b6cac384fc946944650 ****/
		%feature("compactdefaultargs") StepKinematics_PlanarCurvePairRange;
		%feature("autodoc", "Default constructor.

Returns
-------
None
") StepKinematics_PlanarCurvePairRange;
		 StepKinematics_PlanarCurvePairRange();

		/****************** Init ******************/
		/**** md5 signature: 5dc5dbe37acc034b7a304837ef9964f9 ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Initialize all fields (own and inherited).

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

Returns
-------
None
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & theRepresentationItem_Name, const opencascade::handle<TCollection_HAsciiString> & theItemDefinedTransformation_Name, const Standard_Boolean hasItemDefinedTransformation_Description, const opencascade::handle<TCollection_HAsciiString> & theItemDefinedTransformation_Description, const opencascade::handle<StepRepr_RepresentationItem> & theItemDefinedTransformation_TransformItem1, const opencascade::handle<StepRepr_RepresentationItem> & theItemDefinedTransformation_TransformItem2, const opencascade::handle<StepKinematics_KinematicJoint> & theKinematicPair_Joint, const opencascade::handle<StepGeom_Curve> & thePlanarCurvePair_Curve1, const opencascade::handle<StepGeom_Curve> & thePlanarCurvePair_Curve2, const Standard_Boolean thePlanarCurvePair_Orientation, const opencascade::handle<StepGeom_TrimmedCurve> & theRangeOnCurve1, const opencascade::handle<StepGeom_TrimmedCurve> & theRangeOnCurve2);

		/****************** RangeOnCurve1 ******************/
		/**** md5 signature: 9792fa718ce95e0bfd0ea2b5210c43b1 ****/
		%feature("compactdefaultargs") RangeOnCurve1;
		%feature("autodoc", "Returns field rangeoncurve1.

Returns
-------
opencascade::handle<StepGeom_TrimmedCurve>
") RangeOnCurve1;
		opencascade::handle<StepGeom_TrimmedCurve> RangeOnCurve1();

		/****************** RangeOnCurve2 ******************/
		/**** md5 signature: e149e336fe5e988f4a81cb242edbfe56 ****/
		%feature("compactdefaultargs") RangeOnCurve2;
		%feature("autodoc", "Returns field rangeoncurve2.

Returns
-------
opencascade::handle<StepGeom_TrimmedCurve>
") RangeOnCurve2;
		opencascade::handle<StepGeom_TrimmedCurve> RangeOnCurve2();

		/****************** SetRangeOnCurve1 ******************/
		/**** md5 signature: 7032e25a0beee288af676a0f95b9cb76 ****/
		%feature("compactdefaultargs") SetRangeOnCurve1;
		%feature("autodoc", "Sets field rangeoncurve1.

Parameters
----------
theRangeOnCurve1: StepGeom_TrimmedCurve

Returns
-------
None
") SetRangeOnCurve1;
		void SetRangeOnCurve1(const opencascade::handle<StepGeom_TrimmedCurve> & theRangeOnCurve1);

		/****************** SetRangeOnCurve2 ******************/
		/**** md5 signature: 1b017ea1339dbe6dce07b308b47d7135 ****/
		%feature("compactdefaultargs") SetRangeOnCurve2;
		%feature("autodoc", "Sets field rangeoncurve2.

Parameters
----------
theRangeOnCurve2: StepGeom_TrimmedCurve

Returns
-------
None
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
		/****************** StepKinematics_PlanarPairWithRange ******************/
		/**** md5 signature: f0d9be447b07d79266de32589079c79d ****/
		%feature("compactdefaultargs") StepKinematics_PlanarPairWithRange;
		%feature("autodoc", "Default constructor.

Returns
-------
None
") StepKinematics_PlanarPairWithRange;
		 StepKinematics_PlanarPairWithRange();

		/****************** HasLowerLimitActualRotation ******************/
		/**** md5 signature: e0eabf1d75b84dc61065385143e77e72 ****/
		%feature("compactdefaultargs") HasLowerLimitActualRotation;
		%feature("autodoc", "Returns true if optional field lowerlimitactualrotation is defined.

Returns
-------
bool
") HasLowerLimitActualRotation;
		Standard_Boolean HasLowerLimitActualRotation();

		/****************** HasLowerLimitActualTranslationX ******************/
		/**** md5 signature: 84750c5a60573c63366b414bfb1ea469 ****/
		%feature("compactdefaultargs") HasLowerLimitActualTranslationX;
		%feature("autodoc", "Returns true if optional field lowerlimitactualtranslationx is defined.

Returns
-------
bool
") HasLowerLimitActualTranslationX;
		Standard_Boolean HasLowerLimitActualTranslationX();

		/****************** HasLowerLimitActualTranslationY ******************/
		/**** md5 signature: d48cec851c95860b788b6b9ccb5aee66 ****/
		%feature("compactdefaultargs") HasLowerLimitActualTranslationY;
		%feature("autodoc", "Returns true if optional field lowerlimitactualtranslationy is defined.

Returns
-------
bool
") HasLowerLimitActualTranslationY;
		Standard_Boolean HasLowerLimitActualTranslationY();

		/****************** HasUpperLimitActualRotation ******************/
		/**** md5 signature: ee7a165ac58a511590471aeded6017a3 ****/
		%feature("compactdefaultargs") HasUpperLimitActualRotation;
		%feature("autodoc", "Returns true if optional field upperlimitactualrotation is defined.

Returns
-------
bool
") HasUpperLimitActualRotation;
		Standard_Boolean HasUpperLimitActualRotation();

		/****************** HasUpperLimitActualTranslationX ******************/
		/**** md5 signature: 06b365134561f1ac12bece58783cea2b ****/
		%feature("compactdefaultargs") HasUpperLimitActualTranslationX;
		%feature("autodoc", "Returns true if optional field upperlimitactualtranslationx is defined.

Returns
-------
bool
") HasUpperLimitActualTranslationX;
		Standard_Boolean HasUpperLimitActualTranslationX();

		/****************** HasUpperLimitActualTranslationY ******************/
		/**** md5 signature: d33d9f218a7ad05ca4e66cf7dee2feac ****/
		%feature("compactdefaultargs") HasUpperLimitActualTranslationY;
		%feature("autodoc", "Returns true if optional field upperlimitactualtranslationy is defined.

Returns
-------
bool
") HasUpperLimitActualTranslationY;
		Standard_Boolean HasUpperLimitActualTranslationY();

		/****************** Init ******************/
		/**** md5 signature: 502b10b1b240684b27823f68acc4e5cf ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Initialize all fields (own and inherited).

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
theLowerLimitActualRotation: float
hasUpperLimitActualRotation: bool
theUpperLimitActualRotation: float
hasLowerLimitActualTranslationX: bool
theLowerLimitActualTranslationX: float
hasUpperLimitActualTranslationX: bool
theUpperLimitActualTranslationX: float
hasLowerLimitActualTranslationY: bool
theLowerLimitActualTranslationY: float
hasUpperLimitActualTranslationY: bool
theUpperLimitActualTranslationY: float

Returns
-------
None
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & theRepresentationItem_Name, const opencascade::handle<TCollection_HAsciiString> & theItemDefinedTransformation_Name, const Standard_Boolean hasItemDefinedTransformation_Description, const opencascade::handle<TCollection_HAsciiString> & theItemDefinedTransformation_Description, const opencascade::handle<StepRepr_RepresentationItem> & theItemDefinedTransformation_TransformItem1, const opencascade::handle<StepRepr_RepresentationItem> & theItemDefinedTransformation_TransformItem2, const opencascade::handle<StepKinematics_KinematicJoint> & theKinematicPair_Joint, const Standard_Boolean theLowOrderKinematicPair_TX, const Standard_Boolean theLowOrderKinematicPair_TY, const Standard_Boolean theLowOrderKinematicPair_TZ, const Standard_Boolean theLowOrderKinematicPair_RX, const Standard_Boolean theLowOrderKinematicPair_RY, const Standard_Boolean theLowOrderKinematicPair_RZ, const Standard_Boolean hasLowerLimitActualRotation, const Standard_Real theLowerLimitActualRotation, const Standard_Boolean hasUpperLimitActualRotation, const Standard_Real theUpperLimitActualRotation, const Standard_Boolean hasLowerLimitActualTranslationX, const Standard_Real theLowerLimitActualTranslationX, const Standard_Boolean hasUpperLimitActualTranslationX, const Standard_Real theUpperLimitActualTranslationX, const Standard_Boolean hasLowerLimitActualTranslationY, const Standard_Real theLowerLimitActualTranslationY, const Standard_Boolean hasUpperLimitActualTranslationY, const Standard_Real theUpperLimitActualTranslationY);

		/****************** LowerLimitActualRotation ******************/
		/**** md5 signature: 55bbdb3a328206d6d00815bb43b23ff8 ****/
		%feature("compactdefaultargs") LowerLimitActualRotation;
		%feature("autodoc", "Returns field lowerlimitactualrotation.

Returns
-------
float
") LowerLimitActualRotation;
		Standard_Real LowerLimitActualRotation();

		/****************** LowerLimitActualTranslationX ******************/
		/**** md5 signature: c6efa30a0704d2540db52de4d5c9d233 ****/
		%feature("compactdefaultargs") LowerLimitActualTranslationX;
		%feature("autodoc", "Returns field lowerlimitactualtranslationx.

Returns
-------
float
") LowerLimitActualTranslationX;
		Standard_Real LowerLimitActualTranslationX();

		/****************** LowerLimitActualTranslationY ******************/
		/**** md5 signature: 1df934faf95c599b869632babf805c13 ****/
		%feature("compactdefaultargs") LowerLimitActualTranslationY;
		%feature("autodoc", "Returns field lowerlimitactualtranslationy.

Returns
-------
float
") LowerLimitActualTranslationY;
		Standard_Real LowerLimitActualTranslationY();

		/****************** SetLowerLimitActualRotation ******************/
		/**** md5 signature: 73a00046a1364069734e82d7c22e794c ****/
		%feature("compactdefaultargs") SetLowerLimitActualRotation;
		%feature("autodoc", "Sets field lowerlimitactualrotation.

Parameters
----------
theLowerLimitActualRotation: float

Returns
-------
None
") SetLowerLimitActualRotation;
		void SetLowerLimitActualRotation(const Standard_Real theLowerLimitActualRotation);

		/****************** SetLowerLimitActualTranslationX ******************/
		/**** md5 signature: fadf9b10ce37cb78cf5c01aece75d7e0 ****/
		%feature("compactdefaultargs") SetLowerLimitActualTranslationX;
		%feature("autodoc", "Sets field lowerlimitactualtranslationx.

Parameters
----------
theLowerLimitActualTranslationX: float

Returns
-------
None
") SetLowerLimitActualTranslationX;
		void SetLowerLimitActualTranslationX(const Standard_Real theLowerLimitActualTranslationX);

		/****************** SetLowerLimitActualTranslationY ******************/
		/**** md5 signature: b561083e96b17f20c1be6e3daebea5e3 ****/
		%feature("compactdefaultargs") SetLowerLimitActualTranslationY;
		%feature("autodoc", "Sets field lowerlimitactualtranslationy.

Parameters
----------
theLowerLimitActualTranslationY: float

Returns
-------
None
") SetLowerLimitActualTranslationY;
		void SetLowerLimitActualTranslationY(const Standard_Real theLowerLimitActualTranslationY);

		/****************** SetUpperLimitActualRotation ******************/
		/**** md5 signature: 34c9a0a444827c9157f0a3f1f15a0cf1 ****/
		%feature("compactdefaultargs") SetUpperLimitActualRotation;
		%feature("autodoc", "Sets field upperlimitactualrotation.

Parameters
----------
theUpperLimitActualRotation: float

Returns
-------
None
") SetUpperLimitActualRotation;
		void SetUpperLimitActualRotation(const Standard_Real theUpperLimitActualRotation);

		/****************** SetUpperLimitActualTranslationX ******************/
		/**** md5 signature: ed987558115e6efffde9954562e07f6a ****/
		%feature("compactdefaultargs") SetUpperLimitActualTranslationX;
		%feature("autodoc", "Sets field upperlimitactualtranslationx.

Parameters
----------
theUpperLimitActualTranslationX: float

Returns
-------
None
") SetUpperLimitActualTranslationX;
		void SetUpperLimitActualTranslationX(const Standard_Real theUpperLimitActualTranslationX);

		/****************** SetUpperLimitActualTranslationY ******************/
		/**** md5 signature: 31b1518a07a02d6b35ee04f3612701c6 ****/
		%feature("compactdefaultargs") SetUpperLimitActualTranslationY;
		%feature("autodoc", "Sets field upperlimitactualtranslationy.

Parameters
----------
theUpperLimitActualTranslationY: float

Returns
-------
None
") SetUpperLimitActualTranslationY;
		void SetUpperLimitActualTranslationY(const Standard_Real theUpperLimitActualTranslationY);

		/****************** UpperLimitActualRotation ******************/
		/**** md5 signature: e46843824e59bbabdebb3131db45b06a ****/
		%feature("compactdefaultargs") UpperLimitActualRotation;
		%feature("autodoc", "Returns field upperlimitactualrotation.

Returns
-------
float
") UpperLimitActualRotation;
		Standard_Real UpperLimitActualRotation();

		/****************** UpperLimitActualTranslationX ******************/
		/**** md5 signature: 61bb76275073270aef2851a409bef7d4 ****/
		%feature("compactdefaultargs") UpperLimitActualTranslationX;
		%feature("autodoc", "Returns field upperlimitactualtranslationx.

Returns
-------
float
") UpperLimitActualTranslationX;
		Standard_Real UpperLimitActualTranslationX();

		/****************** UpperLimitActualTranslationY ******************/
		/**** md5 signature: ab619622e872a6d4172114a8078d98bc ****/
		%feature("compactdefaultargs") UpperLimitActualTranslationY;
		%feature("autodoc", "Returns field upperlimitactualtranslationy.

Returns
-------
float
") UpperLimitActualTranslationY;
		Standard_Real UpperLimitActualTranslationY();

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
		/****************** StepKinematics_PointOnPlanarCurvePairWithRange ******************/
		/**** md5 signature: 5ae469bca06f4020a795d2eccc768e87 ****/
		%feature("compactdefaultargs") StepKinematics_PointOnPlanarCurvePairWithRange;
		%feature("autodoc", "Default constructor.

Returns
-------
None
") StepKinematics_PointOnPlanarCurvePairWithRange;
		 StepKinematics_PointOnPlanarCurvePairWithRange();

		/****************** HasLowerLimitPitch ******************/
		/**** md5 signature: 8b18659ce9678f62818eee7f06ee7a0a ****/
		%feature("compactdefaultargs") HasLowerLimitPitch;
		%feature("autodoc", "Returns true if optional field lowerlimitpitch is defined.

Returns
-------
bool
") HasLowerLimitPitch;
		Standard_Boolean HasLowerLimitPitch();

		/****************** HasLowerLimitRoll ******************/
		/**** md5 signature: 3d818a00c0f3a06f41717b1eac48086e ****/
		%feature("compactdefaultargs") HasLowerLimitRoll;
		%feature("autodoc", "Returns true if optional field lowerlimitroll is defined.

Returns
-------
bool
") HasLowerLimitRoll;
		Standard_Boolean HasLowerLimitRoll();

		/****************** HasLowerLimitYaw ******************/
		/**** md5 signature: 63c43ea96e633188eef51474a06f5060 ****/
		%feature("compactdefaultargs") HasLowerLimitYaw;
		%feature("autodoc", "Returns true if optional field lowerlimityaw is defined.

Returns
-------
bool
") HasLowerLimitYaw;
		Standard_Boolean HasLowerLimitYaw();

		/****************** HasUpperLimitPitch ******************/
		/**** md5 signature: 91d59bb3ebb845da29b7387b3f9cd51c ****/
		%feature("compactdefaultargs") HasUpperLimitPitch;
		%feature("autodoc", "Returns true if optional field upperlimitpitch is defined.

Returns
-------
bool
") HasUpperLimitPitch;
		Standard_Boolean HasUpperLimitPitch();

		/****************** HasUpperLimitRoll ******************/
		/**** md5 signature: 565197097405f036b4fe8eae784ed2ed ****/
		%feature("compactdefaultargs") HasUpperLimitRoll;
		%feature("autodoc", "Returns true if optional field upperlimitroll is defined.

Returns
-------
bool
") HasUpperLimitRoll;
		Standard_Boolean HasUpperLimitRoll();

		/****************** HasUpperLimitYaw ******************/
		/**** md5 signature: 151b5eee38c02004ecea0c616e1f2a4f ****/
		%feature("compactdefaultargs") HasUpperLimitYaw;
		%feature("autodoc", "Returns true if optional field upperlimityaw is defined.

Returns
-------
bool
") HasUpperLimitYaw;
		Standard_Boolean HasUpperLimitYaw();

		/****************** Init ******************/
		/**** md5 signature: 910f8d5abdcbf7aa1c32a00d51f0011a ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Initialize all fields (own and inherited).

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
theLowerLimitYaw: float
hasUpperLimitYaw: bool
theUpperLimitYaw: float
hasLowerLimitPitch: bool
theLowerLimitPitch: float
hasUpperLimitPitch: bool
theUpperLimitPitch: float
hasLowerLimitRoll: bool
theLowerLimitRoll: float
hasUpperLimitRoll: bool
theUpperLimitRoll: float

Returns
-------
None
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & theRepresentationItem_Name, const opencascade::handle<TCollection_HAsciiString> & theItemDefinedTransformation_Name, const Standard_Boolean hasItemDefinedTransformation_Description, const opencascade::handle<TCollection_HAsciiString> & theItemDefinedTransformation_Description, const opencascade::handle<StepRepr_RepresentationItem> & theItemDefinedTransformation_TransformItem1, const opencascade::handle<StepRepr_RepresentationItem> & theItemDefinedTransformation_TransformItem2, const opencascade::handle<StepKinematics_KinematicJoint> & theKinematicPair_Joint, const opencascade::handle<StepGeom_Curve> & thePointOnPlanarCurvePair_PairCurve, const Standard_Boolean thePointOnPlanarCurvePair_Orientation, const opencascade::handle<StepGeom_TrimmedCurve> & theRangeOnPairCurve, const Standard_Boolean hasLowerLimitYaw, const Standard_Real theLowerLimitYaw, const Standard_Boolean hasUpperLimitYaw, const Standard_Real theUpperLimitYaw, const Standard_Boolean hasLowerLimitPitch, const Standard_Real theLowerLimitPitch, const Standard_Boolean hasUpperLimitPitch, const Standard_Real theUpperLimitPitch, const Standard_Boolean hasLowerLimitRoll, const Standard_Real theLowerLimitRoll, const Standard_Boolean hasUpperLimitRoll, const Standard_Real theUpperLimitRoll);

		/****************** LowerLimitPitch ******************/
		/**** md5 signature: c4b1ede87f1f5e786a2a213f7a2b1771 ****/
		%feature("compactdefaultargs") LowerLimitPitch;
		%feature("autodoc", "Returns field lowerlimitpitch.

Returns
-------
float
") LowerLimitPitch;
		Standard_Real LowerLimitPitch();

		/****************** LowerLimitRoll ******************/
		/**** md5 signature: 56e926a470380b8e6c281787e1927e28 ****/
		%feature("compactdefaultargs") LowerLimitRoll;
		%feature("autodoc", "Returns field lowerlimitroll.

Returns
-------
float
") LowerLimitRoll;
		Standard_Real LowerLimitRoll();

		/****************** LowerLimitYaw ******************/
		/**** md5 signature: 1dce8bd2b95cff7711561282e141791a ****/
		%feature("compactdefaultargs") LowerLimitYaw;
		%feature("autodoc", "Returns field lowerlimityaw.

Returns
-------
float
") LowerLimitYaw;
		Standard_Real LowerLimitYaw();

		/****************** RangeOnPairCurve ******************/
		/**** md5 signature: 872b6e35bb8da21a24f909cf5aa5efec ****/
		%feature("compactdefaultargs") RangeOnPairCurve;
		%feature("autodoc", "Returns field rangeonpaircurve.

Returns
-------
opencascade::handle<StepGeom_TrimmedCurve>
") RangeOnPairCurve;
		opencascade::handle<StepGeom_TrimmedCurve> RangeOnPairCurve();

		/****************** SetLowerLimitPitch ******************/
		/**** md5 signature: 226af1b3d7113bfbf8a46883ed4ce8a7 ****/
		%feature("compactdefaultargs") SetLowerLimitPitch;
		%feature("autodoc", "Sets field lowerlimitpitch.

Parameters
----------
theLowerLimitPitch: float

Returns
-------
None
") SetLowerLimitPitch;
		void SetLowerLimitPitch(const Standard_Real theLowerLimitPitch);

		/****************** SetLowerLimitRoll ******************/
		/**** md5 signature: 48f497a897c25c671444584112ba1459 ****/
		%feature("compactdefaultargs") SetLowerLimitRoll;
		%feature("autodoc", "Sets field lowerlimitroll.

Parameters
----------
theLowerLimitRoll: float

Returns
-------
None
") SetLowerLimitRoll;
		void SetLowerLimitRoll(const Standard_Real theLowerLimitRoll);

		/****************** SetLowerLimitYaw ******************/
		/**** md5 signature: 8d53161ff89e24ffa2bd42e4d9ee936c ****/
		%feature("compactdefaultargs") SetLowerLimitYaw;
		%feature("autodoc", "Sets field lowerlimityaw.

Parameters
----------
theLowerLimitYaw: float

Returns
-------
None
") SetLowerLimitYaw;
		void SetLowerLimitYaw(const Standard_Real theLowerLimitYaw);

		/****************** SetRangeOnPairCurve ******************/
		/**** md5 signature: f42eb8247af6525f8a1a9f810c6a5443 ****/
		%feature("compactdefaultargs") SetRangeOnPairCurve;
		%feature("autodoc", "Sets field rangeonpaircurve.

Parameters
----------
theRangeOnPairCurve: StepGeom_TrimmedCurve

Returns
-------
None
") SetRangeOnPairCurve;
		void SetRangeOnPairCurve(const opencascade::handle<StepGeom_TrimmedCurve> & theRangeOnPairCurve);

		/****************** SetUpperLimitPitch ******************/
		/**** md5 signature: a654c41da7ce0f8115500636f4947de7 ****/
		%feature("compactdefaultargs") SetUpperLimitPitch;
		%feature("autodoc", "Sets field upperlimitpitch.

Parameters
----------
theUpperLimitPitch: float

Returns
-------
None
") SetUpperLimitPitch;
		void SetUpperLimitPitch(const Standard_Real theUpperLimitPitch);

		/****************** SetUpperLimitRoll ******************/
		/**** md5 signature: 0a060f3d676198d94d03a00d4262172e ****/
		%feature("compactdefaultargs") SetUpperLimitRoll;
		%feature("autodoc", "Sets field upperlimitroll.

Parameters
----------
theUpperLimitRoll: float

Returns
-------
None
") SetUpperLimitRoll;
		void SetUpperLimitRoll(const Standard_Real theUpperLimitRoll);

		/****************** SetUpperLimitYaw ******************/
		/**** md5 signature: 695c5ef505a77eeba54996a8d5c580ee ****/
		%feature("compactdefaultargs") SetUpperLimitYaw;
		%feature("autodoc", "Sets field upperlimityaw.

Parameters
----------
theUpperLimitYaw: float

Returns
-------
None
") SetUpperLimitYaw;
		void SetUpperLimitYaw(const Standard_Real theUpperLimitYaw);

		/****************** UpperLimitPitch ******************/
		/**** md5 signature: a2846ce39fee003441a2c466ea66a91c ****/
		%feature("compactdefaultargs") UpperLimitPitch;
		%feature("autodoc", "Returns field upperlimitpitch.

Returns
-------
float
") UpperLimitPitch;
		Standard_Real UpperLimitPitch();

		/****************** UpperLimitRoll ******************/
		/**** md5 signature: f71b7c98e0c4e906603284ef75b8ad54 ****/
		%feature("compactdefaultargs") UpperLimitRoll;
		%feature("autodoc", "Returns field upperlimitroll.

Returns
-------
float
") UpperLimitRoll;
		Standard_Real UpperLimitRoll();

		/****************** UpperLimitYaw ******************/
		/**** md5 signature: 6f932cabcf42e2ce982be3d873a6ba3d ****/
		%feature("compactdefaultargs") UpperLimitYaw;
		%feature("autodoc", "Returns field upperlimityaw.

Returns
-------
float
") UpperLimitYaw;
		Standard_Real UpperLimitYaw();

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
		/****************** StepKinematics_PointOnSurfacePairWithRange ******************/
		/**** md5 signature: a5589fff33c2e601d189518abfea9ba2 ****/
		%feature("compactdefaultargs") StepKinematics_PointOnSurfacePairWithRange;
		%feature("autodoc", "Default constructor.

Returns
-------
None
") StepKinematics_PointOnSurfacePairWithRange;
		 StepKinematics_PointOnSurfacePairWithRange();

		/****************** HasLowerLimitPitch ******************/
		/**** md5 signature: 8b18659ce9678f62818eee7f06ee7a0a ****/
		%feature("compactdefaultargs") HasLowerLimitPitch;
		%feature("autodoc", "Returns true if optional field lowerlimitpitch is defined.

Returns
-------
bool
") HasLowerLimitPitch;
		Standard_Boolean HasLowerLimitPitch();

		/****************** HasLowerLimitRoll ******************/
		/**** md5 signature: 3d818a00c0f3a06f41717b1eac48086e ****/
		%feature("compactdefaultargs") HasLowerLimitRoll;
		%feature("autodoc", "Returns true if optional field lowerlimitroll is defined.

Returns
-------
bool
") HasLowerLimitRoll;
		Standard_Boolean HasLowerLimitRoll();

		/****************** HasLowerLimitYaw ******************/
		/**** md5 signature: 63c43ea96e633188eef51474a06f5060 ****/
		%feature("compactdefaultargs") HasLowerLimitYaw;
		%feature("autodoc", "Returns true if optional field lowerlimityaw is defined.

Returns
-------
bool
") HasLowerLimitYaw;
		Standard_Boolean HasLowerLimitYaw();

		/****************** HasUpperLimitPitch ******************/
		/**** md5 signature: 91d59bb3ebb845da29b7387b3f9cd51c ****/
		%feature("compactdefaultargs") HasUpperLimitPitch;
		%feature("autodoc", "Returns true if optional field upperlimitpitch is defined.

Returns
-------
bool
") HasUpperLimitPitch;
		Standard_Boolean HasUpperLimitPitch();

		/****************** HasUpperLimitRoll ******************/
		/**** md5 signature: 565197097405f036b4fe8eae784ed2ed ****/
		%feature("compactdefaultargs") HasUpperLimitRoll;
		%feature("autodoc", "Returns true if optional field upperlimitroll is defined.

Returns
-------
bool
") HasUpperLimitRoll;
		Standard_Boolean HasUpperLimitRoll();

		/****************** HasUpperLimitYaw ******************/
		/**** md5 signature: 151b5eee38c02004ecea0c616e1f2a4f ****/
		%feature("compactdefaultargs") HasUpperLimitYaw;
		%feature("autodoc", "Returns true if optional field upperlimityaw is defined.

Returns
-------
bool
") HasUpperLimitYaw;
		Standard_Boolean HasUpperLimitYaw();

		/****************** Init ******************/
		/**** md5 signature: f8d3541b115a5142f31b6d6dc0ba7dca ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Initialize all fields (own and inherited).

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
theLowerLimitYaw: float
hasUpperLimitYaw: bool
theUpperLimitYaw: float
hasLowerLimitPitch: bool
theLowerLimitPitch: float
hasUpperLimitPitch: bool
theUpperLimitPitch: float
hasLowerLimitRoll: bool
theLowerLimitRoll: float
hasUpperLimitRoll: bool
theUpperLimitRoll: float

Returns
-------
None
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & theRepresentationItem_Name, const opencascade::handle<TCollection_HAsciiString> & theItemDefinedTransformation_Name, const Standard_Boolean hasItemDefinedTransformation_Description, const opencascade::handle<TCollection_HAsciiString> & theItemDefinedTransformation_Description, const opencascade::handle<StepRepr_RepresentationItem> & theItemDefinedTransformation_TransformItem1, const opencascade::handle<StepRepr_RepresentationItem> & theItemDefinedTransformation_TransformItem2, const opencascade::handle<StepKinematics_KinematicJoint> & theKinematicPair_Joint, const opencascade::handle<StepGeom_Surface> & thePointOnSurfacePair_PairSurface, const opencascade::handle<StepGeom_RectangularTrimmedSurface> & theRangeOnPairSurface, const Standard_Boolean hasLowerLimitYaw, const Standard_Real theLowerLimitYaw, const Standard_Boolean hasUpperLimitYaw, const Standard_Real theUpperLimitYaw, const Standard_Boolean hasLowerLimitPitch, const Standard_Real theLowerLimitPitch, const Standard_Boolean hasUpperLimitPitch, const Standard_Real theUpperLimitPitch, const Standard_Boolean hasLowerLimitRoll, const Standard_Real theLowerLimitRoll, const Standard_Boolean hasUpperLimitRoll, const Standard_Real theUpperLimitRoll);

		/****************** LowerLimitPitch ******************/
		/**** md5 signature: c4b1ede87f1f5e786a2a213f7a2b1771 ****/
		%feature("compactdefaultargs") LowerLimitPitch;
		%feature("autodoc", "Returns field lowerlimitpitch.

Returns
-------
float
") LowerLimitPitch;
		Standard_Real LowerLimitPitch();

		/****************** LowerLimitRoll ******************/
		/**** md5 signature: 56e926a470380b8e6c281787e1927e28 ****/
		%feature("compactdefaultargs") LowerLimitRoll;
		%feature("autodoc", "Returns field lowerlimitroll.

Returns
-------
float
") LowerLimitRoll;
		Standard_Real LowerLimitRoll();

		/****************** LowerLimitYaw ******************/
		/**** md5 signature: 1dce8bd2b95cff7711561282e141791a ****/
		%feature("compactdefaultargs") LowerLimitYaw;
		%feature("autodoc", "Returns field lowerlimityaw.

Returns
-------
float
") LowerLimitYaw;
		Standard_Real LowerLimitYaw();

		/****************** RangeOnPairSurface ******************/
		/**** md5 signature: 844927162fe7aa8ee4ebaa90456fdc6c ****/
		%feature("compactdefaultargs") RangeOnPairSurface;
		%feature("autodoc", "Returns field rangeonpairsurface.

Returns
-------
opencascade::handle<StepGeom_RectangularTrimmedSurface>
") RangeOnPairSurface;
		opencascade::handle<StepGeom_RectangularTrimmedSurface> RangeOnPairSurface();

		/****************** SetLowerLimitPitch ******************/
		/**** md5 signature: 226af1b3d7113bfbf8a46883ed4ce8a7 ****/
		%feature("compactdefaultargs") SetLowerLimitPitch;
		%feature("autodoc", "Sets field lowerlimitpitch.

Parameters
----------
theLowerLimitPitch: float

Returns
-------
None
") SetLowerLimitPitch;
		void SetLowerLimitPitch(const Standard_Real theLowerLimitPitch);

		/****************** SetLowerLimitRoll ******************/
		/**** md5 signature: 48f497a897c25c671444584112ba1459 ****/
		%feature("compactdefaultargs") SetLowerLimitRoll;
		%feature("autodoc", "Sets field lowerlimitroll.

Parameters
----------
theLowerLimitRoll: float

Returns
-------
None
") SetLowerLimitRoll;
		void SetLowerLimitRoll(const Standard_Real theLowerLimitRoll);

		/****************** SetLowerLimitYaw ******************/
		/**** md5 signature: 8d53161ff89e24ffa2bd42e4d9ee936c ****/
		%feature("compactdefaultargs") SetLowerLimitYaw;
		%feature("autodoc", "Sets field lowerlimityaw.

Parameters
----------
theLowerLimitYaw: float

Returns
-------
None
") SetLowerLimitYaw;
		void SetLowerLimitYaw(const Standard_Real theLowerLimitYaw);

		/****************** SetRangeOnPairSurface ******************/
		/**** md5 signature: 529acc47b4019828d8590651f4e45ac9 ****/
		%feature("compactdefaultargs") SetRangeOnPairSurface;
		%feature("autodoc", "Sets field rangeonpairsurface.

Parameters
----------
theRangeOnPairSurface: StepGeom_RectangularTrimmedSurface

Returns
-------
None
") SetRangeOnPairSurface;
		void SetRangeOnPairSurface(const opencascade::handle<StepGeom_RectangularTrimmedSurface> & theRangeOnPairSurface);

		/****************** SetUpperLimitPitch ******************/
		/**** md5 signature: a654c41da7ce0f8115500636f4947de7 ****/
		%feature("compactdefaultargs") SetUpperLimitPitch;
		%feature("autodoc", "Sets field upperlimitpitch.

Parameters
----------
theUpperLimitPitch: float

Returns
-------
None
") SetUpperLimitPitch;
		void SetUpperLimitPitch(const Standard_Real theUpperLimitPitch);

		/****************** SetUpperLimitRoll ******************/
		/**** md5 signature: 0a060f3d676198d94d03a00d4262172e ****/
		%feature("compactdefaultargs") SetUpperLimitRoll;
		%feature("autodoc", "Sets field upperlimitroll.

Parameters
----------
theUpperLimitRoll: float

Returns
-------
None
") SetUpperLimitRoll;
		void SetUpperLimitRoll(const Standard_Real theUpperLimitRoll);

		/****************** SetUpperLimitYaw ******************/
		/**** md5 signature: 695c5ef505a77eeba54996a8d5c580ee ****/
		%feature("compactdefaultargs") SetUpperLimitYaw;
		%feature("autodoc", "Sets field upperlimityaw.

Parameters
----------
theUpperLimitYaw: float

Returns
-------
None
") SetUpperLimitYaw;
		void SetUpperLimitYaw(const Standard_Real theUpperLimitYaw);

		/****************** UpperLimitPitch ******************/
		/**** md5 signature: a2846ce39fee003441a2c466ea66a91c ****/
		%feature("compactdefaultargs") UpperLimitPitch;
		%feature("autodoc", "Returns field upperlimitpitch.

Returns
-------
float
") UpperLimitPitch;
		Standard_Real UpperLimitPitch();

		/****************** UpperLimitRoll ******************/
		/**** md5 signature: f71b7c98e0c4e906603284ef75b8ad54 ****/
		%feature("compactdefaultargs") UpperLimitRoll;
		%feature("autodoc", "Returns field upperlimitroll.

Returns
-------
float
") UpperLimitRoll;
		Standard_Real UpperLimitRoll();

		/****************** UpperLimitYaw ******************/
		/**** md5 signature: 6f932cabcf42e2ce982be3d873a6ba3d ****/
		%feature("compactdefaultargs") UpperLimitYaw;
		%feature("autodoc", "Returns field upperlimityaw.

Returns
-------
float
") UpperLimitYaw;
		Standard_Real UpperLimitYaw();

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
		/****************** StepKinematics_PrismaticPairWithRange ******************/
		/**** md5 signature: 80a80b3d15499237128873bc2b5ba63b ****/
		%feature("compactdefaultargs") StepKinematics_PrismaticPairWithRange;
		%feature("autodoc", "Default constructor.

Returns
-------
None
") StepKinematics_PrismaticPairWithRange;
		 StepKinematics_PrismaticPairWithRange();

		/****************** HasLowerLimitActualTranslation ******************/
		/**** md5 signature: 1a289a26b8ae2f88cb1f123cde1aba54 ****/
		%feature("compactdefaultargs") HasLowerLimitActualTranslation;
		%feature("autodoc", "Returns true if optional field lowerlimitactualtranslation is defined.

Returns
-------
bool
") HasLowerLimitActualTranslation;
		Standard_Boolean HasLowerLimitActualTranslation();

		/****************** HasUpperLimitActualTranslation ******************/
		/**** md5 signature: cdf598668fd5fd5829ed3088c3d514f7 ****/
		%feature("compactdefaultargs") HasUpperLimitActualTranslation;
		%feature("autodoc", "Returns true if optional field upperlimitactualtranslation is defined.

Returns
-------
bool
") HasUpperLimitActualTranslation;
		Standard_Boolean HasUpperLimitActualTranslation();

		/****************** Init ******************/
		/**** md5 signature: f1544e2f94e58b4265a082b419364a96 ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Initialize all fields (own and inherited).

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
theLowerLimitActualTranslation: float
hasUpperLimitActualTranslation: bool
theUpperLimitActualTranslation: float

Returns
-------
None
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & theRepresentationItem_Name, const opencascade::handle<TCollection_HAsciiString> & theItemDefinedTransformation_Name, const Standard_Boolean hasItemDefinedTransformation_Description, const opencascade::handle<TCollection_HAsciiString> & theItemDefinedTransformation_Description, const opencascade::handle<StepRepr_RepresentationItem> & theItemDefinedTransformation_TransformItem1, const opencascade::handle<StepRepr_RepresentationItem> & theItemDefinedTransformation_TransformItem2, const opencascade::handle<StepKinematics_KinematicJoint> & theKinematicPair_Joint, const Standard_Boolean theLowOrderKinematicPair_TX, const Standard_Boolean theLowOrderKinematicPair_TY, const Standard_Boolean theLowOrderKinematicPair_TZ, const Standard_Boolean theLowOrderKinematicPair_RX, const Standard_Boolean theLowOrderKinematicPair_RY, const Standard_Boolean theLowOrderKinematicPair_RZ, const Standard_Boolean hasLowerLimitActualTranslation, const Standard_Real theLowerLimitActualTranslation, const Standard_Boolean hasUpperLimitActualTranslation, const Standard_Real theUpperLimitActualTranslation);

		/****************** LowerLimitActualTranslation ******************/
		/**** md5 signature: 97ee57a369ca7daed593022f79b99ab2 ****/
		%feature("compactdefaultargs") LowerLimitActualTranslation;
		%feature("autodoc", "Returns field lowerlimitactualtranslation.

Returns
-------
float
") LowerLimitActualTranslation;
		Standard_Real LowerLimitActualTranslation();

		/****************** SetLowerLimitActualTranslation ******************/
		/**** md5 signature: a1716b6d6f0ea33b5c0faa34bc2f5a0e ****/
		%feature("compactdefaultargs") SetLowerLimitActualTranslation;
		%feature("autodoc", "Sets field lowerlimitactualtranslation.

Parameters
----------
theLowerLimitActualTranslation: float

Returns
-------
None
") SetLowerLimitActualTranslation;
		void SetLowerLimitActualTranslation(const Standard_Real theLowerLimitActualTranslation);

		/****************** SetUpperLimitActualTranslation ******************/
		/**** md5 signature: fc6e218ec907595a913caec2e23a014c ****/
		%feature("compactdefaultargs") SetUpperLimitActualTranslation;
		%feature("autodoc", "Sets field upperlimitactualtranslation.

Parameters
----------
theUpperLimitActualTranslation: float

Returns
-------
None
") SetUpperLimitActualTranslation;
		void SetUpperLimitActualTranslation(const Standard_Real theUpperLimitActualTranslation);

		/****************** UpperLimitActualTranslation ******************/
		/**** md5 signature: 684275e4d7ba2daf91a796102cd97460 ****/
		%feature("compactdefaultargs") UpperLimitActualTranslation;
		%feature("autodoc", "Returns field upperlimitactualtranslation.

Returns
-------
float
") UpperLimitActualTranslation;
		Standard_Real UpperLimitActualTranslation();

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
		/****************** StepKinematics_RackAndPinionPairWithRange ******************/
		/**** md5 signature: 01d99be0ee373f982d0abcc4ddd30cfd ****/
		%feature("compactdefaultargs") StepKinematics_RackAndPinionPairWithRange;
		%feature("autodoc", "Default constructor.

Returns
-------
None
") StepKinematics_RackAndPinionPairWithRange;
		 StepKinematics_RackAndPinionPairWithRange();

		/****************** HasLowerLimitRackDisplacement ******************/
		/**** md5 signature: 27e164f6e7606c32d5c0835a24282386 ****/
		%feature("compactdefaultargs") HasLowerLimitRackDisplacement;
		%feature("autodoc", "Returns true if optional field lowerlimitrackdisplacement is defined.

Returns
-------
bool
") HasLowerLimitRackDisplacement;
		Standard_Boolean HasLowerLimitRackDisplacement();

		/****************** HasUpperLimitRackDisplacement ******************/
		/**** md5 signature: e8da229bff417dcee95c1872d8eb0da2 ****/
		%feature("compactdefaultargs") HasUpperLimitRackDisplacement;
		%feature("autodoc", "Returns true if optional field upperlimitrackdisplacement is defined.

Returns
-------
bool
") HasUpperLimitRackDisplacement;
		Standard_Boolean HasUpperLimitRackDisplacement();

		/****************** Init ******************/
		/**** md5 signature: d793dbc601663c69cb1bd46a584ee957 ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Initialize all fields (own and inherited).

Parameters
----------
theRepresentationItem_Name: TCollection_HAsciiString
theItemDefinedTransformation_Name: TCollection_HAsciiString
hasItemDefinedTransformation_Description: bool
theItemDefinedTransformation_Description: TCollection_HAsciiString
theItemDefinedTransformation_TransformItem1: StepRepr_RepresentationItem
theItemDefinedTransformation_TransformItem2: StepRepr_RepresentationItem
theKinematicPair_Joint: StepKinematics_KinematicJoint
theRackAndPinionPair_PinionRadius: float
hasLowerLimitRackDisplacement: bool
theLowerLimitRackDisplacement: float
hasUpperLimitRackDisplacement: bool
theUpperLimitRackDisplacement: float

Returns
-------
None
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & theRepresentationItem_Name, const opencascade::handle<TCollection_HAsciiString> & theItemDefinedTransformation_Name, const Standard_Boolean hasItemDefinedTransformation_Description, const opencascade::handle<TCollection_HAsciiString> & theItemDefinedTransformation_Description, const opencascade::handle<StepRepr_RepresentationItem> & theItemDefinedTransformation_TransformItem1, const opencascade::handle<StepRepr_RepresentationItem> & theItemDefinedTransformation_TransformItem2, const opencascade::handle<StepKinematics_KinematicJoint> & theKinematicPair_Joint, const Standard_Real theRackAndPinionPair_PinionRadius, const Standard_Boolean hasLowerLimitRackDisplacement, const Standard_Real theLowerLimitRackDisplacement, const Standard_Boolean hasUpperLimitRackDisplacement, const Standard_Real theUpperLimitRackDisplacement);

		/****************** LowerLimitRackDisplacement ******************/
		/**** md5 signature: 3c826a65a1ee76557d54ac1d15ca19dd ****/
		%feature("compactdefaultargs") LowerLimitRackDisplacement;
		%feature("autodoc", "Returns field lowerlimitrackdisplacement.

Returns
-------
float
") LowerLimitRackDisplacement;
		Standard_Real LowerLimitRackDisplacement();

		/****************** SetLowerLimitRackDisplacement ******************/
		/**** md5 signature: 70ff480f5f816cd823223b3988b1ba6b ****/
		%feature("compactdefaultargs") SetLowerLimitRackDisplacement;
		%feature("autodoc", "Sets field lowerlimitrackdisplacement.

Parameters
----------
theLowerLimitRackDisplacement: float

Returns
-------
None
") SetLowerLimitRackDisplacement;
		void SetLowerLimitRackDisplacement(const Standard_Real theLowerLimitRackDisplacement);

		/****************** SetUpperLimitRackDisplacement ******************/
		/**** md5 signature: 2a4adb3f00b6e6ac62e24a108e7f076b ****/
		%feature("compactdefaultargs") SetUpperLimitRackDisplacement;
		%feature("autodoc", "Sets field upperlimitrackdisplacement.

Parameters
----------
theUpperLimitRackDisplacement: float

Returns
-------
None
") SetUpperLimitRackDisplacement;
		void SetUpperLimitRackDisplacement(const Standard_Real theUpperLimitRackDisplacement);

		/****************** UpperLimitRackDisplacement ******************/
		/**** md5 signature: d8bf48dafb6a1a8d42ed6038dfd827af ****/
		%feature("compactdefaultargs") UpperLimitRackDisplacement;
		%feature("autodoc", "Returns field upperlimitrackdisplacement.

Returns
-------
float
") UpperLimitRackDisplacement;
		Standard_Real UpperLimitRackDisplacement();

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
		/****************** StepKinematics_RevolutePairWithRange ******************/
		/**** md5 signature: 9c6f4a1ac59c7c3a39139ad387c851b5 ****/
		%feature("compactdefaultargs") StepKinematics_RevolutePairWithRange;
		%feature("autodoc", "Default constructor.

Returns
-------
None
") StepKinematics_RevolutePairWithRange;
		 StepKinematics_RevolutePairWithRange();

		/****************** HasLowerLimitActualRotation ******************/
		/**** md5 signature: e0eabf1d75b84dc61065385143e77e72 ****/
		%feature("compactdefaultargs") HasLowerLimitActualRotation;
		%feature("autodoc", "Returns true if optional field lowerlimitactualrotation is defined.

Returns
-------
bool
") HasLowerLimitActualRotation;
		Standard_Boolean HasLowerLimitActualRotation();

		/****************** HasUpperLimitActualRotation ******************/
		/**** md5 signature: ee7a165ac58a511590471aeded6017a3 ****/
		%feature("compactdefaultargs") HasUpperLimitActualRotation;
		%feature("autodoc", "Returns true if optional field upperlimitactualrotation is defined.

Returns
-------
bool
") HasUpperLimitActualRotation;
		Standard_Boolean HasUpperLimitActualRotation();

		/****************** Init ******************/
		/**** md5 signature: 40c7150176c2a71a869f27184a1e3e54 ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Initialize all fields (own and inherited).

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
theLowerLimitActualRotation: float
hasUpperLimitActualRotation: bool
theUpperLimitActualRotation: float

Returns
-------
None
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & theRepresentationItem_Name, const opencascade::handle<TCollection_HAsciiString> & theItemDefinedTransformation_Name, const Standard_Boolean hasItemDefinedTransformation_Description, const opencascade::handle<TCollection_HAsciiString> & theItemDefinedTransformation_Description, const opencascade::handle<StepRepr_RepresentationItem> & theItemDefinedTransformation_TransformItem1, const opencascade::handle<StepRepr_RepresentationItem> & theItemDefinedTransformation_TransformItem2, const opencascade::handle<StepKinematics_KinematicJoint> & theKinematicPair_Joint, const Standard_Boolean theLowOrderKinematicPair_TX, const Standard_Boolean theLowOrderKinematicPair_TY, const Standard_Boolean theLowOrderKinematicPair_TZ, const Standard_Boolean theLowOrderKinematicPair_RX, const Standard_Boolean theLowOrderKinematicPair_RY, const Standard_Boolean theLowOrderKinematicPair_RZ, const Standard_Boolean hasLowerLimitActualRotation, const Standard_Real theLowerLimitActualRotation, const Standard_Boolean hasUpperLimitActualRotation, const Standard_Real theUpperLimitActualRotation);

		/****************** LowerLimitActualRotation ******************/
		/**** md5 signature: 55bbdb3a328206d6d00815bb43b23ff8 ****/
		%feature("compactdefaultargs") LowerLimitActualRotation;
		%feature("autodoc", "Returns field lowerlimitactualrotation.

Returns
-------
float
") LowerLimitActualRotation;
		Standard_Real LowerLimitActualRotation();

		/****************** SetLowerLimitActualRotation ******************/
		/**** md5 signature: 73a00046a1364069734e82d7c22e794c ****/
		%feature("compactdefaultargs") SetLowerLimitActualRotation;
		%feature("autodoc", "Sets field lowerlimitactualrotation.

Parameters
----------
theLowerLimitActualRotation: float

Returns
-------
None
") SetLowerLimitActualRotation;
		void SetLowerLimitActualRotation(const Standard_Real theLowerLimitActualRotation);

		/****************** SetUpperLimitActualRotation ******************/
		/**** md5 signature: 34c9a0a444827c9157f0a3f1f15a0cf1 ****/
		%feature("compactdefaultargs") SetUpperLimitActualRotation;
		%feature("autodoc", "Sets field upperlimitactualrotation.

Parameters
----------
theUpperLimitActualRotation: float

Returns
-------
None
") SetUpperLimitActualRotation;
		void SetUpperLimitActualRotation(const Standard_Real theUpperLimitActualRotation);

		/****************** UpperLimitActualRotation ******************/
		/**** md5 signature: e46843824e59bbabdebb3131db45b06a ****/
		%feature("compactdefaultargs") UpperLimitActualRotation;
		%feature("autodoc", "Returns field upperlimitactualrotation.

Returns
-------
float
") UpperLimitActualRotation;
		Standard_Real UpperLimitActualRotation();

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
		/****************** StepKinematics_RollingCurvePair ******************/
		/**** md5 signature: d51b70230f0222ad1e6936bd3c400235 ****/
		%feature("compactdefaultargs") StepKinematics_RollingCurvePair;
		%feature("autodoc", "Default constructor.

Returns
-------
None
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
		/****************** StepKinematics_RollingSurfacePair ******************/
		/**** md5 signature: ef9cf58df6d1b796037ff7bc21bec66d ****/
		%feature("compactdefaultargs") StepKinematics_RollingSurfacePair;
		%feature("autodoc", "Default constructor.

Returns
-------
None
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
		/****************** StepKinematics_ScrewPairWithRange ******************/
		/**** md5 signature: c02fc3d1f3aa95dddaccea7c55b6f642 ****/
		%feature("compactdefaultargs") StepKinematics_ScrewPairWithRange;
		%feature("autodoc", "Default constructor.

Returns
-------
None
") StepKinematics_ScrewPairWithRange;
		 StepKinematics_ScrewPairWithRange();

		/****************** HasLowerLimitActualRotation ******************/
		/**** md5 signature: e0eabf1d75b84dc61065385143e77e72 ****/
		%feature("compactdefaultargs") HasLowerLimitActualRotation;
		%feature("autodoc", "Returns true if optional field lowerlimitactualrotation is defined.

Returns
-------
bool
") HasLowerLimitActualRotation;
		Standard_Boolean HasLowerLimitActualRotation();

		/****************** HasUpperLimitActualRotation ******************/
		/**** md5 signature: ee7a165ac58a511590471aeded6017a3 ****/
		%feature("compactdefaultargs") HasUpperLimitActualRotation;
		%feature("autodoc", "Returns true if optional field upperlimitactualrotation is defined.

Returns
-------
bool
") HasUpperLimitActualRotation;
		Standard_Boolean HasUpperLimitActualRotation();

		/****************** Init ******************/
		/**** md5 signature: 70ae77781be5be30f5d0cf582820608d ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Initialize all fields (own and inherited).

Parameters
----------
theRepresentationItem_Name: TCollection_HAsciiString
theItemDefinedTransformation_Name: TCollection_HAsciiString
hasItemDefinedTransformation_Description: bool
theItemDefinedTransformation_Description: TCollection_HAsciiString
theItemDefinedTransformation_TransformItem1: StepRepr_RepresentationItem
theItemDefinedTransformation_TransformItem2: StepRepr_RepresentationItem
theKinematicPair_Joint: StepKinematics_KinematicJoint
theScrewPair_Pitch: float
hasLowerLimitActualRotation: bool
theLowerLimitActualRotation: float
hasUpperLimitActualRotation: bool
theUpperLimitActualRotation: float

Returns
-------
None
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & theRepresentationItem_Name, const opencascade::handle<TCollection_HAsciiString> & theItemDefinedTransformation_Name, const Standard_Boolean hasItemDefinedTransformation_Description, const opencascade::handle<TCollection_HAsciiString> & theItemDefinedTransformation_Description, const opencascade::handle<StepRepr_RepresentationItem> & theItemDefinedTransformation_TransformItem1, const opencascade::handle<StepRepr_RepresentationItem> & theItemDefinedTransformation_TransformItem2, const opencascade::handle<StepKinematics_KinematicJoint> & theKinematicPair_Joint, const Standard_Real theScrewPair_Pitch, const Standard_Boolean hasLowerLimitActualRotation, const Standard_Real theLowerLimitActualRotation, const Standard_Boolean hasUpperLimitActualRotation, const Standard_Real theUpperLimitActualRotation);

		/****************** LowerLimitActualRotation ******************/
		/**** md5 signature: 55bbdb3a328206d6d00815bb43b23ff8 ****/
		%feature("compactdefaultargs") LowerLimitActualRotation;
		%feature("autodoc", "Returns field lowerlimitactualrotation.

Returns
-------
float
") LowerLimitActualRotation;
		Standard_Real LowerLimitActualRotation();

		/****************** SetLowerLimitActualRotation ******************/
		/**** md5 signature: 73a00046a1364069734e82d7c22e794c ****/
		%feature("compactdefaultargs") SetLowerLimitActualRotation;
		%feature("autodoc", "Sets field lowerlimitactualrotation.

Parameters
----------
theLowerLimitActualRotation: float

Returns
-------
None
") SetLowerLimitActualRotation;
		void SetLowerLimitActualRotation(const Standard_Real theLowerLimitActualRotation);

		/****************** SetUpperLimitActualRotation ******************/
		/**** md5 signature: 34c9a0a444827c9157f0a3f1f15a0cf1 ****/
		%feature("compactdefaultargs") SetUpperLimitActualRotation;
		%feature("autodoc", "Sets field upperlimitactualrotation.

Parameters
----------
theUpperLimitActualRotation: float

Returns
-------
None
") SetUpperLimitActualRotation;
		void SetUpperLimitActualRotation(const Standard_Real theUpperLimitActualRotation);

		/****************** UpperLimitActualRotation ******************/
		/**** md5 signature: e46843824e59bbabdebb3131db45b06a ****/
		%feature("compactdefaultargs") UpperLimitActualRotation;
		%feature("autodoc", "Returns field upperlimitactualrotation.

Returns
-------
float
") UpperLimitActualRotation;
		Standard_Real UpperLimitActualRotation();

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
		/****************** StepKinematics_SlidingCurvePair ******************/
		/**** md5 signature: 5d0ded6d95aa77599df2328b15fee313 ****/
		%feature("compactdefaultargs") StepKinematics_SlidingCurvePair;
		%feature("autodoc", "Default constructor.

Returns
-------
None
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
		/****************** StepKinematics_SlidingSurfacePair ******************/
		/**** md5 signature: e77fb7efd5f36ce306d4fe2d9cd60309 ****/
		%feature("compactdefaultargs") StepKinematics_SlidingSurfacePair;
		%feature("autodoc", "Default constructor.

Returns
-------
None
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
		/****************** StepKinematics_SphericalPairWithPinAndRange ******************/
		/**** md5 signature: 9e43fdde69f9ffa61654b7e59abcd095 ****/
		%feature("compactdefaultargs") StepKinematics_SphericalPairWithPinAndRange;
		%feature("autodoc", "Default constructor.

Returns
-------
None
") StepKinematics_SphericalPairWithPinAndRange;
		 StepKinematics_SphericalPairWithPinAndRange();

		/****************** HasLowerLimitRoll ******************/
		/**** md5 signature: 3d818a00c0f3a06f41717b1eac48086e ****/
		%feature("compactdefaultargs") HasLowerLimitRoll;
		%feature("autodoc", "Returns true if optional field lowerlimitroll is defined.

Returns
-------
bool
") HasLowerLimitRoll;
		Standard_Boolean HasLowerLimitRoll();

		/****************** HasLowerLimitYaw ******************/
		/**** md5 signature: 63c43ea96e633188eef51474a06f5060 ****/
		%feature("compactdefaultargs") HasLowerLimitYaw;
		%feature("autodoc", "Returns true if optional field lowerlimityaw is defined.

Returns
-------
bool
") HasLowerLimitYaw;
		Standard_Boolean HasLowerLimitYaw();

		/****************** HasUpperLimitRoll ******************/
		/**** md5 signature: 565197097405f036b4fe8eae784ed2ed ****/
		%feature("compactdefaultargs") HasUpperLimitRoll;
		%feature("autodoc", "Returns true if optional field upperlimitroll is defined.

Returns
-------
bool
") HasUpperLimitRoll;
		Standard_Boolean HasUpperLimitRoll();

		/****************** HasUpperLimitYaw ******************/
		/**** md5 signature: 151b5eee38c02004ecea0c616e1f2a4f ****/
		%feature("compactdefaultargs") HasUpperLimitYaw;
		%feature("autodoc", "Returns true if optional field upperlimityaw is defined.

Returns
-------
bool
") HasUpperLimitYaw;
		Standard_Boolean HasUpperLimitYaw();

		/****************** Init ******************/
		/**** md5 signature: eb9bff52495ba6f471d4c4e00e5c878d ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Initialize all fields (own and inherited).

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
theLowerLimitYaw: float
hasUpperLimitYaw: bool
theUpperLimitYaw: float
hasLowerLimitRoll: bool
theLowerLimitRoll: float
hasUpperLimitRoll: bool
theUpperLimitRoll: float

Returns
-------
None
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & theRepresentationItem_Name, const opencascade::handle<TCollection_HAsciiString> & theItemDefinedTransformation_Name, const Standard_Boolean hasItemDefinedTransformation_Description, const opencascade::handle<TCollection_HAsciiString> & theItemDefinedTransformation_Description, const opencascade::handle<StepRepr_RepresentationItem> & theItemDefinedTransformation_TransformItem1, const opencascade::handle<StepRepr_RepresentationItem> & theItemDefinedTransformation_TransformItem2, const opencascade::handle<StepKinematics_KinematicJoint> & theKinematicPair_Joint, const Standard_Boolean theLowOrderKinematicPair_TX, const Standard_Boolean theLowOrderKinematicPair_TY, const Standard_Boolean theLowOrderKinematicPair_TZ, const Standard_Boolean theLowOrderKinematicPair_RX, const Standard_Boolean theLowOrderKinematicPair_RY, const Standard_Boolean theLowOrderKinematicPair_RZ, const Standard_Boolean hasLowerLimitYaw, const Standard_Real theLowerLimitYaw, const Standard_Boolean hasUpperLimitYaw, const Standard_Real theUpperLimitYaw, const Standard_Boolean hasLowerLimitRoll, const Standard_Real theLowerLimitRoll, const Standard_Boolean hasUpperLimitRoll, const Standard_Real theUpperLimitRoll);

		/****************** LowerLimitRoll ******************/
		/**** md5 signature: 56e926a470380b8e6c281787e1927e28 ****/
		%feature("compactdefaultargs") LowerLimitRoll;
		%feature("autodoc", "Returns field lowerlimitroll.

Returns
-------
float
") LowerLimitRoll;
		Standard_Real LowerLimitRoll();

		/****************** LowerLimitYaw ******************/
		/**** md5 signature: 1dce8bd2b95cff7711561282e141791a ****/
		%feature("compactdefaultargs") LowerLimitYaw;
		%feature("autodoc", "Returns field lowerlimityaw.

Returns
-------
float
") LowerLimitYaw;
		Standard_Real LowerLimitYaw();

		/****************** SetLowerLimitRoll ******************/
		/**** md5 signature: 48f497a897c25c671444584112ba1459 ****/
		%feature("compactdefaultargs") SetLowerLimitRoll;
		%feature("autodoc", "Sets field lowerlimitroll.

Parameters
----------
theLowerLimitRoll: float

Returns
-------
None
") SetLowerLimitRoll;
		void SetLowerLimitRoll(const Standard_Real theLowerLimitRoll);

		/****************** SetLowerLimitYaw ******************/
		/**** md5 signature: 8d53161ff89e24ffa2bd42e4d9ee936c ****/
		%feature("compactdefaultargs") SetLowerLimitYaw;
		%feature("autodoc", "Sets field lowerlimityaw.

Parameters
----------
theLowerLimitYaw: float

Returns
-------
None
") SetLowerLimitYaw;
		void SetLowerLimitYaw(const Standard_Real theLowerLimitYaw);

		/****************** SetUpperLimitRoll ******************/
		/**** md5 signature: 0a060f3d676198d94d03a00d4262172e ****/
		%feature("compactdefaultargs") SetUpperLimitRoll;
		%feature("autodoc", "Sets field upperlimitroll.

Parameters
----------
theUpperLimitRoll: float

Returns
-------
None
") SetUpperLimitRoll;
		void SetUpperLimitRoll(const Standard_Real theUpperLimitRoll);

		/****************** SetUpperLimitYaw ******************/
		/**** md5 signature: 695c5ef505a77eeba54996a8d5c580ee ****/
		%feature("compactdefaultargs") SetUpperLimitYaw;
		%feature("autodoc", "Sets field upperlimityaw.

Parameters
----------
theUpperLimitYaw: float

Returns
-------
None
") SetUpperLimitYaw;
		void SetUpperLimitYaw(const Standard_Real theUpperLimitYaw);

		/****************** UpperLimitRoll ******************/
		/**** md5 signature: f71b7c98e0c4e906603284ef75b8ad54 ****/
		%feature("compactdefaultargs") UpperLimitRoll;
		%feature("autodoc", "Returns field upperlimitroll.

Returns
-------
float
") UpperLimitRoll;
		Standard_Real UpperLimitRoll();

		/****************** UpperLimitYaw ******************/
		/**** md5 signature: 6f932cabcf42e2ce982be3d873a6ba3d ****/
		%feature("compactdefaultargs") UpperLimitYaw;
		%feature("autodoc", "Returns field upperlimityaw.

Returns
-------
float
") UpperLimitYaw;
		Standard_Real UpperLimitYaw();

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
		/****************** StepKinematics_SphericalPairWithRange ******************/
		/**** md5 signature: 5e7015163fc67145e2afd7ccd534cf12 ****/
		%feature("compactdefaultargs") StepKinematics_SphericalPairWithRange;
		%feature("autodoc", "Default constructor.

Returns
-------
None
") StepKinematics_SphericalPairWithRange;
		 StepKinematics_SphericalPairWithRange();

		/****************** HasLowerLimitPitch ******************/
		/**** md5 signature: 8b18659ce9678f62818eee7f06ee7a0a ****/
		%feature("compactdefaultargs") HasLowerLimitPitch;
		%feature("autodoc", "Returns true if optional field lowerlimitpitch is defined.

Returns
-------
bool
") HasLowerLimitPitch;
		Standard_Boolean HasLowerLimitPitch();

		/****************** HasLowerLimitRoll ******************/
		/**** md5 signature: 3d818a00c0f3a06f41717b1eac48086e ****/
		%feature("compactdefaultargs") HasLowerLimitRoll;
		%feature("autodoc", "Returns true if optional field lowerlimitroll is defined.

Returns
-------
bool
") HasLowerLimitRoll;
		Standard_Boolean HasLowerLimitRoll();

		/****************** HasLowerLimitYaw ******************/
		/**** md5 signature: 63c43ea96e633188eef51474a06f5060 ****/
		%feature("compactdefaultargs") HasLowerLimitYaw;
		%feature("autodoc", "Returns true if optional field lowerlimityaw is defined.

Returns
-------
bool
") HasLowerLimitYaw;
		Standard_Boolean HasLowerLimitYaw();

		/****************** HasUpperLimitPitch ******************/
		/**** md5 signature: 91d59bb3ebb845da29b7387b3f9cd51c ****/
		%feature("compactdefaultargs") HasUpperLimitPitch;
		%feature("autodoc", "Returns true if optional field upperlimitpitch is defined.

Returns
-------
bool
") HasUpperLimitPitch;
		Standard_Boolean HasUpperLimitPitch();

		/****************** HasUpperLimitRoll ******************/
		/**** md5 signature: 565197097405f036b4fe8eae784ed2ed ****/
		%feature("compactdefaultargs") HasUpperLimitRoll;
		%feature("autodoc", "Returns true if optional field upperlimitroll is defined.

Returns
-------
bool
") HasUpperLimitRoll;
		Standard_Boolean HasUpperLimitRoll();

		/****************** HasUpperLimitYaw ******************/
		/**** md5 signature: 151b5eee38c02004ecea0c616e1f2a4f ****/
		%feature("compactdefaultargs") HasUpperLimitYaw;
		%feature("autodoc", "Returns true if optional field upperlimityaw is defined.

Returns
-------
bool
") HasUpperLimitYaw;
		Standard_Boolean HasUpperLimitYaw();

		/****************** Init ******************/
		/**** md5 signature: 2db7d9ccaf828a10cd0cd9bd0140358f ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Initialize all fields (own and inherited).

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
theLowerLimitYaw: float
hasUpperLimitYaw: bool
theUpperLimitYaw: float
hasLowerLimitPitch: bool
theLowerLimitPitch: float
hasUpperLimitPitch: bool
theUpperLimitPitch: float
hasLowerLimitRoll: bool
theLowerLimitRoll: float
hasUpperLimitRoll: bool
theUpperLimitRoll: float

Returns
-------
None
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & theRepresentationItem_Name, const opencascade::handle<TCollection_HAsciiString> & theItemDefinedTransformation_Name, const Standard_Boolean hasItemDefinedTransformation_Description, const opencascade::handle<TCollection_HAsciiString> & theItemDefinedTransformation_Description, const opencascade::handle<StepRepr_RepresentationItem> & theItemDefinedTransformation_TransformItem1, const opencascade::handle<StepRepr_RepresentationItem> & theItemDefinedTransformation_TransformItem2, const opencascade::handle<StepKinematics_KinematicJoint> & theKinematicPair_Joint, const Standard_Boolean theLowOrderKinematicPair_TX, const Standard_Boolean theLowOrderKinematicPair_TY, const Standard_Boolean theLowOrderKinematicPair_TZ, const Standard_Boolean theLowOrderKinematicPair_RX, const Standard_Boolean theLowOrderKinematicPair_RY, const Standard_Boolean theLowOrderKinematicPair_RZ, const Standard_Boolean hasLowerLimitYaw, const Standard_Real theLowerLimitYaw, const Standard_Boolean hasUpperLimitYaw, const Standard_Real theUpperLimitYaw, const Standard_Boolean hasLowerLimitPitch, const Standard_Real theLowerLimitPitch, const Standard_Boolean hasUpperLimitPitch, const Standard_Real theUpperLimitPitch, const Standard_Boolean hasLowerLimitRoll, const Standard_Real theLowerLimitRoll, const Standard_Boolean hasUpperLimitRoll, const Standard_Real theUpperLimitRoll);

		/****************** LowerLimitPitch ******************/
		/**** md5 signature: c4b1ede87f1f5e786a2a213f7a2b1771 ****/
		%feature("compactdefaultargs") LowerLimitPitch;
		%feature("autodoc", "Returns field lowerlimitpitch.

Returns
-------
float
") LowerLimitPitch;
		Standard_Real LowerLimitPitch();

		/****************** LowerLimitRoll ******************/
		/**** md5 signature: 56e926a470380b8e6c281787e1927e28 ****/
		%feature("compactdefaultargs") LowerLimitRoll;
		%feature("autodoc", "Returns field lowerlimitroll.

Returns
-------
float
") LowerLimitRoll;
		Standard_Real LowerLimitRoll();

		/****************** LowerLimitYaw ******************/
		/**** md5 signature: 1dce8bd2b95cff7711561282e141791a ****/
		%feature("compactdefaultargs") LowerLimitYaw;
		%feature("autodoc", "Returns field lowerlimityaw.

Returns
-------
float
") LowerLimitYaw;
		Standard_Real LowerLimitYaw();

		/****************** SetLowerLimitPitch ******************/
		/**** md5 signature: 226af1b3d7113bfbf8a46883ed4ce8a7 ****/
		%feature("compactdefaultargs") SetLowerLimitPitch;
		%feature("autodoc", "Sets field lowerlimitpitch.

Parameters
----------
theLowerLimitPitch: float

Returns
-------
None
") SetLowerLimitPitch;
		void SetLowerLimitPitch(const Standard_Real theLowerLimitPitch);

		/****************** SetLowerLimitRoll ******************/
		/**** md5 signature: 48f497a897c25c671444584112ba1459 ****/
		%feature("compactdefaultargs") SetLowerLimitRoll;
		%feature("autodoc", "Sets field lowerlimitroll.

Parameters
----------
theLowerLimitRoll: float

Returns
-------
None
") SetLowerLimitRoll;
		void SetLowerLimitRoll(const Standard_Real theLowerLimitRoll);

		/****************** SetLowerLimitYaw ******************/
		/**** md5 signature: 8d53161ff89e24ffa2bd42e4d9ee936c ****/
		%feature("compactdefaultargs") SetLowerLimitYaw;
		%feature("autodoc", "Sets field lowerlimityaw.

Parameters
----------
theLowerLimitYaw: float

Returns
-------
None
") SetLowerLimitYaw;
		void SetLowerLimitYaw(const Standard_Real theLowerLimitYaw);

		/****************** SetUpperLimitPitch ******************/
		/**** md5 signature: a654c41da7ce0f8115500636f4947de7 ****/
		%feature("compactdefaultargs") SetUpperLimitPitch;
		%feature("autodoc", "Sets field upperlimitpitch.

Parameters
----------
theUpperLimitPitch: float

Returns
-------
None
") SetUpperLimitPitch;
		void SetUpperLimitPitch(const Standard_Real theUpperLimitPitch);

		/****************** SetUpperLimitRoll ******************/
		/**** md5 signature: 0a060f3d676198d94d03a00d4262172e ****/
		%feature("compactdefaultargs") SetUpperLimitRoll;
		%feature("autodoc", "Sets field upperlimitroll.

Parameters
----------
theUpperLimitRoll: float

Returns
-------
None
") SetUpperLimitRoll;
		void SetUpperLimitRoll(const Standard_Real theUpperLimitRoll);

		/****************** SetUpperLimitYaw ******************/
		/**** md5 signature: 695c5ef505a77eeba54996a8d5c580ee ****/
		%feature("compactdefaultargs") SetUpperLimitYaw;
		%feature("autodoc", "Sets field upperlimityaw.

Parameters
----------
theUpperLimitYaw: float

Returns
-------
None
") SetUpperLimitYaw;
		void SetUpperLimitYaw(const Standard_Real theUpperLimitYaw);

		/****************** UpperLimitPitch ******************/
		/**** md5 signature: a2846ce39fee003441a2c466ea66a91c ****/
		%feature("compactdefaultargs") UpperLimitPitch;
		%feature("autodoc", "Returns field upperlimitpitch.

Returns
-------
float
") UpperLimitPitch;
		Standard_Real UpperLimitPitch();

		/****************** UpperLimitRoll ******************/
		/**** md5 signature: f71b7c98e0c4e906603284ef75b8ad54 ****/
		%feature("compactdefaultargs") UpperLimitRoll;
		%feature("autodoc", "Returns field upperlimitroll.

Returns
-------
float
") UpperLimitRoll;
		Standard_Real UpperLimitRoll();

		/****************** UpperLimitYaw ******************/
		/**** md5 signature: 6f932cabcf42e2ce982be3d873a6ba3d ****/
		%feature("compactdefaultargs") UpperLimitYaw;
		%feature("autodoc", "Returns field upperlimityaw.

Returns
-------
float
") UpperLimitYaw;
		Standard_Real UpperLimitYaw();

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
		/****************** StepKinematics_SurfacePairWithRange ******************/
		/**** md5 signature: 1ff85a30dac5393d7639a5530a9454ae ****/
		%feature("compactdefaultargs") StepKinematics_SurfacePairWithRange;
		%feature("autodoc", "Default constructor.

Returns
-------
None
") StepKinematics_SurfacePairWithRange;
		 StepKinematics_SurfacePairWithRange();

		/****************** HasLowerLimitActualRotation ******************/
		/**** md5 signature: e0eabf1d75b84dc61065385143e77e72 ****/
		%feature("compactdefaultargs") HasLowerLimitActualRotation;
		%feature("autodoc", "Returns true if optional field lowerlimitactualrotation is defined.

Returns
-------
bool
") HasLowerLimitActualRotation;
		Standard_Boolean HasLowerLimitActualRotation();

		/****************** HasUpperLimitActualRotation ******************/
		/**** md5 signature: ee7a165ac58a511590471aeded6017a3 ****/
		%feature("compactdefaultargs") HasUpperLimitActualRotation;
		%feature("autodoc", "Returns true if optional field upperlimitactualrotation is defined.

Returns
-------
bool
") HasUpperLimitActualRotation;
		Standard_Boolean HasUpperLimitActualRotation();

		/****************** Init ******************/
		/**** md5 signature: ff23628e2a4a31992fb1fb562251e1de ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Initialize all fields (own and inherited).

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
theLowerLimitActualRotation: float
hasUpperLimitActualRotation: bool
theUpperLimitActualRotation: float

Returns
-------
None
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & theRepresentationItem_Name, const opencascade::handle<TCollection_HAsciiString> & theItemDefinedTransformation_Name, const Standard_Boolean hasItemDefinedTransformation_Description, const opencascade::handle<TCollection_HAsciiString> & theItemDefinedTransformation_Description, const opencascade::handle<StepRepr_RepresentationItem> & theItemDefinedTransformation_TransformItem1, const opencascade::handle<StepRepr_RepresentationItem> & theItemDefinedTransformation_TransformItem2, const opencascade::handle<StepKinematics_KinematicJoint> & theKinematicPair_Joint, const opencascade::handle<StepGeom_Surface> & theSurfacePair_Surface1, const opencascade::handle<StepGeom_Surface> & theSurfacePair_Surface2, const Standard_Boolean theSurfacePair_Orientation, const opencascade::handle<StepGeom_RectangularTrimmedSurface> & theRangeOnSurface1, const opencascade::handle<StepGeom_RectangularTrimmedSurface> & theRangeOnSurface2, const Standard_Boolean hasLowerLimitActualRotation, const Standard_Real theLowerLimitActualRotation, const Standard_Boolean hasUpperLimitActualRotation, const Standard_Real theUpperLimitActualRotation);

		/****************** LowerLimitActualRotation ******************/
		/**** md5 signature: 55bbdb3a328206d6d00815bb43b23ff8 ****/
		%feature("compactdefaultargs") LowerLimitActualRotation;
		%feature("autodoc", "Returns field lowerlimitactualrotation.

Returns
-------
float
") LowerLimitActualRotation;
		Standard_Real LowerLimitActualRotation();

		/****************** RangeOnSurface1 ******************/
		/**** md5 signature: 0ae008823cd38eac4d98f999364d53fa ****/
		%feature("compactdefaultargs") RangeOnSurface1;
		%feature("autodoc", "Returns field rangeonsurface1.

Returns
-------
opencascade::handle<StepGeom_RectangularTrimmedSurface>
") RangeOnSurface1;
		opencascade::handle<StepGeom_RectangularTrimmedSurface> RangeOnSurface1();

		/****************** RangeOnSurface2 ******************/
		/**** md5 signature: bba27a74aac1eb0bac2f13703c5e962d ****/
		%feature("compactdefaultargs") RangeOnSurface2;
		%feature("autodoc", "Returns field rangeonsurface2.

Returns
-------
opencascade::handle<StepGeom_RectangularTrimmedSurface>
") RangeOnSurface2;
		opencascade::handle<StepGeom_RectangularTrimmedSurface> RangeOnSurface2();

		/****************** SetLowerLimitActualRotation ******************/
		/**** md5 signature: 73a00046a1364069734e82d7c22e794c ****/
		%feature("compactdefaultargs") SetLowerLimitActualRotation;
		%feature("autodoc", "Sets field lowerlimitactualrotation.

Parameters
----------
theLowerLimitActualRotation: float

Returns
-------
None
") SetLowerLimitActualRotation;
		void SetLowerLimitActualRotation(const Standard_Real theLowerLimitActualRotation);

		/****************** SetRangeOnSurface1 ******************/
		/**** md5 signature: 7786edccd7ba32e1d2a177f5abb0584b ****/
		%feature("compactdefaultargs") SetRangeOnSurface1;
		%feature("autodoc", "Sets field rangeonsurface1.

Parameters
----------
theRangeOnSurface1: StepGeom_RectangularTrimmedSurface

Returns
-------
None
") SetRangeOnSurface1;
		void SetRangeOnSurface1(const opencascade::handle<StepGeom_RectangularTrimmedSurface> & theRangeOnSurface1);

		/****************** SetRangeOnSurface2 ******************/
		/**** md5 signature: d6e39b85fb1f72643a884513420cefbf ****/
		%feature("compactdefaultargs") SetRangeOnSurface2;
		%feature("autodoc", "Sets field rangeonsurface2.

Parameters
----------
theRangeOnSurface2: StepGeom_RectangularTrimmedSurface

Returns
-------
None
") SetRangeOnSurface2;
		void SetRangeOnSurface2(const opencascade::handle<StepGeom_RectangularTrimmedSurface> & theRangeOnSurface2);

		/****************** SetUpperLimitActualRotation ******************/
		/**** md5 signature: 34c9a0a444827c9157f0a3f1f15a0cf1 ****/
		%feature("compactdefaultargs") SetUpperLimitActualRotation;
		%feature("autodoc", "Sets field upperlimitactualrotation.

Parameters
----------
theUpperLimitActualRotation: float

Returns
-------
None
") SetUpperLimitActualRotation;
		void SetUpperLimitActualRotation(const Standard_Real theUpperLimitActualRotation);

		/****************** UpperLimitActualRotation ******************/
		/**** md5 signature: e46843824e59bbabdebb3131db45b06a ****/
		%feature("compactdefaultargs") UpperLimitActualRotation;
		%feature("autodoc", "Returns field upperlimitactualrotation.

Returns
-------
float
") UpperLimitActualRotation;
		Standard_Real UpperLimitActualRotation();

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
		/****************** StepKinematics_UniversalPairWithRange ******************/
		/**** md5 signature: 4538b259330389e2da9670648e4f427f ****/
		%feature("compactdefaultargs") StepKinematics_UniversalPairWithRange;
		%feature("autodoc", "Default constructor.

Returns
-------
None
") StepKinematics_UniversalPairWithRange;
		 StepKinematics_UniversalPairWithRange();

		/****************** HasLowerLimitFirstRotation ******************/
		/**** md5 signature: 0f18df23961bad47d7584d08b224842c ****/
		%feature("compactdefaultargs") HasLowerLimitFirstRotation;
		%feature("autodoc", "Returns true if optional field lowerlimitfirstrotation is defined.

Returns
-------
bool
") HasLowerLimitFirstRotation;
		Standard_Boolean HasLowerLimitFirstRotation();

		/****************** HasLowerLimitSecondRotation ******************/
		/**** md5 signature: c80fea2f65ec871445d2c5d79af0ddc4 ****/
		%feature("compactdefaultargs") HasLowerLimitSecondRotation;
		%feature("autodoc", "Returns true if optional field lowerlimitsecondrotation is defined.

Returns
-------
bool
") HasLowerLimitSecondRotation;
		Standard_Boolean HasLowerLimitSecondRotation();

		/****************** HasUpperLimitFirstRotation ******************/
		/**** md5 signature: cc8ad0034379613c4bf9e18e243590ac ****/
		%feature("compactdefaultargs") HasUpperLimitFirstRotation;
		%feature("autodoc", "Returns true if optional field upperlimitfirstrotation is defined.

Returns
-------
bool
") HasUpperLimitFirstRotation;
		Standard_Boolean HasUpperLimitFirstRotation();

		/****************** HasUpperLimitSecondRotation ******************/
		/**** md5 signature: f0c9eb4d75f97a564f19ab0db2bc26df ****/
		%feature("compactdefaultargs") HasUpperLimitSecondRotation;
		%feature("autodoc", "Returns true if optional field upperlimitsecondrotation is defined.

Returns
-------
bool
") HasUpperLimitSecondRotation;
		Standard_Boolean HasUpperLimitSecondRotation();

		/****************** Init ******************/
		/**** md5 signature: 9d17da45458cb3e21b560d6eb9581522 ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Initialize all fields (own and inherited).

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
theUniversalPair_InputSkewAngle: float
hasLowerLimitFirstRotation: bool
theLowerLimitFirstRotation: float
hasUpperLimitFirstRotation: bool
theUpperLimitFirstRotation: float
hasLowerLimitSecondRotation: bool
theLowerLimitSecondRotation: float
hasUpperLimitSecondRotation: bool
theUpperLimitSecondRotation: float

Returns
-------
None
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & theRepresentationItem_Name, const opencascade::handle<TCollection_HAsciiString> & theItemDefinedTransformation_Name, const Standard_Boolean hasItemDefinedTransformation_Description, const opencascade::handle<TCollection_HAsciiString> & theItemDefinedTransformation_Description, const opencascade::handle<StepRepr_RepresentationItem> & theItemDefinedTransformation_TransformItem1, const opencascade::handle<StepRepr_RepresentationItem> & theItemDefinedTransformation_TransformItem2, const opencascade::handle<StepKinematics_KinematicJoint> & theKinematicPair_Joint, const Standard_Boolean theLowOrderKinematicPair_TX, const Standard_Boolean theLowOrderKinematicPair_TY, const Standard_Boolean theLowOrderKinematicPair_TZ, const Standard_Boolean theLowOrderKinematicPair_RX, const Standard_Boolean theLowOrderKinematicPair_RY, const Standard_Boolean theLowOrderKinematicPair_RZ, const Standard_Boolean hasUniversalPair_InputSkewAngle, const Standard_Real theUniversalPair_InputSkewAngle, const Standard_Boolean hasLowerLimitFirstRotation, const Standard_Real theLowerLimitFirstRotation, const Standard_Boolean hasUpperLimitFirstRotation, const Standard_Real theUpperLimitFirstRotation, const Standard_Boolean hasLowerLimitSecondRotation, const Standard_Real theLowerLimitSecondRotation, const Standard_Boolean hasUpperLimitSecondRotation, const Standard_Real theUpperLimitSecondRotation);

		/****************** LowerLimitFirstRotation ******************/
		/**** md5 signature: 3fe590bff56b404a11d0a1738e825c6a ****/
		%feature("compactdefaultargs") LowerLimitFirstRotation;
		%feature("autodoc", "Returns field lowerlimitfirstrotation.

Returns
-------
float
") LowerLimitFirstRotation;
		Standard_Real LowerLimitFirstRotation();

		/****************** LowerLimitSecondRotation ******************/
		/**** md5 signature: 285514fa4414fae50173200e71d7bc2f ****/
		%feature("compactdefaultargs") LowerLimitSecondRotation;
		%feature("autodoc", "Returns field lowerlimitsecondrotation.

Returns
-------
float
") LowerLimitSecondRotation;
		Standard_Real LowerLimitSecondRotation();

		/****************** SetLowerLimitFirstRotation ******************/
		/**** md5 signature: 54866c1bb49a7a82ef96a46a2a08b570 ****/
		%feature("compactdefaultargs") SetLowerLimitFirstRotation;
		%feature("autodoc", "Sets field lowerlimitfirstrotation.

Parameters
----------
theLowerLimitFirstRotation: float

Returns
-------
None
") SetLowerLimitFirstRotation;
		void SetLowerLimitFirstRotation(const Standard_Real theLowerLimitFirstRotation);

		/****************** SetLowerLimitSecondRotation ******************/
		/**** md5 signature: 46654a79bed5be333918f21488883383 ****/
		%feature("compactdefaultargs") SetLowerLimitSecondRotation;
		%feature("autodoc", "Sets field lowerlimitsecondrotation.

Parameters
----------
theLowerLimitSecondRotation: float

Returns
-------
None
") SetLowerLimitSecondRotation;
		void SetLowerLimitSecondRotation(const Standard_Real theLowerLimitSecondRotation);

		/****************** SetUpperLimitFirstRotation ******************/
		/**** md5 signature: 183ff8b587748bbe0115e3447066c252 ****/
		%feature("compactdefaultargs") SetUpperLimitFirstRotation;
		%feature("autodoc", "Sets field upperlimitfirstrotation.

Parameters
----------
theUpperLimitFirstRotation: float

Returns
-------
None
") SetUpperLimitFirstRotation;
		void SetUpperLimitFirstRotation(const Standard_Real theUpperLimitFirstRotation);

		/****************** SetUpperLimitSecondRotation ******************/
		/**** md5 signature: 0e16eacb30addd6e490b2e7123f7a8d1 ****/
		%feature("compactdefaultargs") SetUpperLimitSecondRotation;
		%feature("autodoc", "Sets field upperlimitsecondrotation.

Parameters
----------
theUpperLimitSecondRotation: float

Returns
-------
None
") SetUpperLimitSecondRotation;
		void SetUpperLimitSecondRotation(const Standard_Real theUpperLimitSecondRotation);

		/****************** UpperLimitFirstRotation ******************/
		/**** md5 signature: a15c758fe0d7809f331d8176d92a3b04 ****/
		%feature("compactdefaultargs") UpperLimitFirstRotation;
		%feature("autodoc", "Returns field upperlimitfirstrotation.

Returns
-------
float
") UpperLimitFirstRotation;
		Standard_Real UpperLimitFirstRotation();

		/****************** UpperLimitSecondRotation ******************/
		/**** md5 signature: 01eb8650de930cd57e61d9b43b649e8c ****/
		%feature("compactdefaultargs") UpperLimitSecondRotation;
		%feature("autodoc", "Returns field upperlimitsecondrotation.

Returns
-------
float
") UpperLimitSecondRotation;
		Standard_Real UpperLimitSecondRotation();

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
