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
%define STEPAP242DOCSTRING
"StepAP242 module, see official documentation at
https://dev.opencascade.org/doc/occt-7.8.0/refman/html/package_stepap242.html"
%enddef
%module (package="OCC.Core", docstring=STEPAP242DOCSTRING) StepAP242


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
#include<StepAP242_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<TCollection_module.hxx>
#include<StepData_module.hxx>
#include<StepBasic_module.hxx>
#include<StepShape_module.hxx>
#include<StepDimTol_module.hxx>
#include<StepRepr_module.hxx>
#include<StepAP214_module.hxx>
#include<Message_module.hxx>
#include<StepBasic_module.hxx>
#include<Interface_module.hxx>
#include<StepShape_module.hxx>
#include<StepGeom_module.hxx>
#include<StepVisual_module.hxx>
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
%import TCollection.i
%import StepData.i
%import StepBasic.i
%import StepShape.i
%import StepDimTol.i
%import StepRepr.i
%import StepAP214.i

%pythoncode {
from enum import IntEnum
from OCC.Core.Exception import *
};

/* public enums */
/* end public enums declaration */

/* python proxy classes for enums */
%pythoncode {
};
/* end python proxy for enums */

/* handles */
%wrap_handle(StepAP242_IdAttribute)
%wrap_handle(StepAP242_ItemIdentifiedRepresentationUsage)
%wrap_handle(StepAP242_DraughtingModelItemAssociation)
%wrap_handle(StepAP242_GeometricItemSpecificUsage)
/* end handles declaration */

/* templates */
/* end templates declaration */

/* typedefs */
/* end typedefs declaration */

/******************************
* class StepAP242_IdAttribute *
******************************/
class StepAP242_IdAttribute : public Standard_Transient {
	public:
		/****** StepAP242_IdAttribute::StepAP242_IdAttribute ******/
		/****** md5 signature: 3f85dd7713df26a53591028dbd295481 ******/
		%feature("compactdefaultargs") StepAP242_IdAttribute;
		%feature("autodoc", "Return
-------
None

Description
-----------
Returns a IdAttribute.
") StepAP242_IdAttribute;
		 StepAP242_IdAttribute();

		/****** StepAP242_IdAttribute::AttributeValue ******/
		/****** md5 signature: b2166d5b240f01925e9f522a0c744e06 ******/
		%feature("compactdefaultargs") AttributeValue;
		%feature("autodoc", "Return
-------
opencascade::handle<TCollection_HAsciiString>

Description
-----------
Returns field AttributeValue.
") AttributeValue;
		opencascade::handle<TCollection_HAsciiString> AttributeValue();

		/****** StepAP242_IdAttribute::IdentifiedItem ******/
		/****** md5 signature: 22dbcc40152d04af05b3e34678d7fb4e ******/
		%feature("compactdefaultargs") IdentifiedItem;
		%feature("autodoc", "Return
-------
StepAP242_IdAttributeSelect

Description
-----------
Returns IdentifiedItem.
") IdentifiedItem;
		StepAP242_IdAttributeSelect IdentifiedItem();

		/****** StepAP242_IdAttribute::Init ******/
		/****** md5 signature: 08239daa2e0d431bf0c6be628d64a336 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
theAttributeValue: TCollection_HAsciiString
theIdentifiedItem: StepAP242_IdAttributeSelect

Return
-------
None

Description
-----------
Init all field own and inherited.
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & theAttributeValue, const StepAP242_IdAttributeSelect & theIdentifiedItem);

		/****** StepAP242_IdAttribute::SetAttributeValue ******/
		/****** md5 signature: ad1c6cea5240eabc1985dbab2d3519a9 ******/
		%feature("compactdefaultargs") SetAttributeValue;
		%feature("autodoc", "
Parameters
----------
theAttributeValue: TCollection_HAsciiString

Return
-------
None

Description
-----------
No available documentation.
") SetAttributeValue;
		void SetAttributeValue(const opencascade::handle<TCollection_HAsciiString> & theAttributeValue);

		/****** StepAP242_IdAttribute::SetIdentifiedItem ******/
		/****** md5 signature: a284a423df0c9582240124b9512fa1f9 ******/
		%feature("compactdefaultargs") SetIdentifiedItem;
		%feature("autodoc", "
Parameters
----------
theIdentifiedItem: StepAP242_IdAttributeSelect

Return
-------
None

Description
-----------
Set field IdentifiedItem.
") SetIdentifiedItem;
		void SetIdentifiedItem(const StepAP242_IdAttributeSelect & theIdentifiedItem);

};


%make_alias(StepAP242_IdAttribute)

%extend StepAP242_IdAttribute {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************************
* class StepAP242_IdAttributeSelect *
************************************/
class StepAP242_IdAttributeSelect : public StepData_SelectType {
	public:
		/****** StepAP242_IdAttributeSelect::StepAP242_IdAttributeSelect ******/
		/****** md5 signature: b49b8dbe373799ea3dc321abe8905809 ******/
		%feature("compactdefaultargs") StepAP242_IdAttributeSelect;
		%feature("autodoc", "Return
-------
None

Description
-----------
Returns a IdAttributeSelect select type.
") StepAP242_IdAttributeSelect;
		 StepAP242_IdAttributeSelect();

		/****** StepAP242_IdAttributeSelect::Action ******/
		/****** md5 signature: 4229fc384fff50d0489b9a9ab4a5487d ******/
		%feature("compactdefaultargs") Action;
		%feature("autodoc", "Return
-------
opencascade::handle<StepBasic_Action>

Description
-----------
returns Value as a Action (Null if another type).
") Action;
		opencascade::handle<StepBasic_Action> Action();

		/****** StepAP242_IdAttributeSelect::Address ******/
		/****** md5 signature: 0e4a9c20b4c65180ca616fd1ef4a7cd4 ******/
		%feature("compactdefaultargs") Address;
		%feature("autodoc", "Return
-------
opencascade::handle<StepBasic_Address>

Description
-----------
returns Value as a Address (Null if another type).
") Address;
		opencascade::handle<StepBasic_Address> Address();

		/****** StepAP242_IdAttributeSelect::ApplicationContext ******/
		/****** md5 signature: 6211e18e5d81dbd133c80107e0f32461 ******/
		%feature("compactdefaultargs") ApplicationContext;
		%feature("autodoc", "Return
-------
opencascade::handle<StepBasic_ApplicationContext>

Description
-----------
returns Value as a ApplicationContext (Null if another type).
") ApplicationContext;
		opencascade::handle<StepBasic_ApplicationContext> ApplicationContext();

		/****** StepAP242_IdAttributeSelect::CaseNum ******/
		/****** md5 signature: f0e39118a9846e44ccd59de148215261 ******/
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
Recognizes a IdAttributeSelect Kind Entity that is: 1 -> Action 2 -> Address 3 -> ApplicationContext 4 -> DimensionalSize 5 -> GeometricTolerance 6 -> Group 7 -> Reserved for OrganizatonalProject (not implemented in OCCT) 8 -> ProductCategory 9 -> PropertyDefinition 10 -> Representation 11 -> ShapeAspect 12 -> ShapeAspectRelationship 0 else.
") CaseNum;
		Standard_Integer CaseNum(const opencascade::handle<Standard_Transient> & ent);

		/****** StepAP242_IdAttributeSelect::DimensionalSize ******/
		/****** md5 signature: b3d1e5ecfb9af68552cff269c1a5a7db ******/
		%feature("compactdefaultargs") DimensionalSize;
		%feature("autodoc", "Return
-------
opencascade::handle<StepShape_DimensionalSize>

Description
-----------
returns Value as a DimensionalSize (Null if another type).
") DimensionalSize;
		opencascade::handle<StepShape_DimensionalSize> DimensionalSize();

		/****** StepAP242_IdAttributeSelect::GeometricTolerance ******/
		/****** md5 signature: e590dafae3b1364da15d0f21b2cf4d32 ******/
		%feature("compactdefaultargs") GeometricTolerance;
		%feature("autodoc", "Return
-------
opencascade::handle<StepDimTol_GeometricTolerance>

Description
-----------
returns Value as a GeometricTolerance (Null if another type).
") GeometricTolerance;
		opencascade::handle<StepDimTol_GeometricTolerance> GeometricTolerance();

		/****** StepAP242_IdAttributeSelect::Group ******/
		/****** md5 signature: 58a65f6494d2bc516fda4ce1650fbefd ******/
		%feature("compactdefaultargs") Group;
		%feature("autodoc", "Return
-------
opencascade::handle<StepBasic_Group>

Description
-----------
returns Value as a Group (Null if another type).
") Group;
		opencascade::handle<StepBasic_Group> Group();

		/****** StepAP242_IdAttributeSelect::ProductCategory ******/
		/****** md5 signature: c68a3acfc5b2c48065c10648b3c34e4b ******/
		%feature("compactdefaultargs") ProductCategory;
		%feature("autodoc", "Return
-------
opencascade::handle<StepBasic_ProductCategory>

Description
-----------
returns Value as a ProductCategory (Null if another type).
") ProductCategory;
		opencascade::handle<StepBasic_ProductCategory> ProductCategory();

		/****** StepAP242_IdAttributeSelect::PropertyDefinition ******/
		/****** md5 signature: 4b7b4910929a0e1832918f8266d39349 ******/
		%feature("compactdefaultargs") PropertyDefinition;
		%feature("autodoc", "Return
-------
opencascade::handle<StepRepr_PropertyDefinition>

Description
-----------
returns Value as a PropertyDefinition (Null if another type).
") PropertyDefinition;
		opencascade::handle<StepRepr_PropertyDefinition> PropertyDefinition();

		/****** StepAP242_IdAttributeSelect::Representation ******/
		/****** md5 signature: b68b8aa0615de130a54bdd2ee7c69058 ******/
		%feature("compactdefaultargs") Representation;
		%feature("autodoc", "Return
-------
opencascade::handle<StepRepr_Representation>

Description
-----------
returns Value as a Representation (Null if another type).
") Representation;
		opencascade::handle<StepRepr_Representation> Representation();

		/****** StepAP242_IdAttributeSelect::ShapeAspect ******/
		/****** md5 signature: 6c476d31e71221a87c411540ef5855cb ******/
		%feature("compactdefaultargs") ShapeAspect;
		%feature("autodoc", "Return
-------
opencascade::handle<StepRepr_ShapeAspect>

Description
-----------
returns Value as a ShapeAspect (Null if another type).
") ShapeAspect;
		opencascade::handle<StepRepr_ShapeAspect> ShapeAspect();

		/****** StepAP242_IdAttributeSelect::ShapeAspectRelationship ******/
		/****** md5 signature: 35bed4b7262e5cb161ba72768027d32c ******/
		%feature("compactdefaultargs") ShapeAspectRelationship;
		%feature("autodoc", "Return
-------
opencascade::handle<StepRepr_ShapeAspectRelationship>

Description
-----------
returns Value as a ShapeAspectRelationship (Null if another type).
") ShapeAspectRelationship;
		opencascade::handle<StepRepr_ShapeAspectRelationship> ShapeAspectRelationship();

};


%extend StepAP242_IdAttributeSelect {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************************************
* class StepAP242_ItemIdentifiedRepresentationUsage *
****************************************************/
class StepAP242_ItemIdentifiedRepresentationUsage : public Standard_Transient {
	public:
		/****** StepAP242_ItemIdentifiedRepresentationUsage::StepAP242_ItemIdentifiedRepresentationUsage ******/
		/****** md5 signature: 92918d10047985cffed6961135c446c7 ******/
		%feature("compactdefaultargs") StepAP242_ItemIdentifiedRepresentationUsage;
		%feature("autodoc", "Return
-------
None

Description
-----------
Returns a ItemIdentifiedRepresentationUsage.
") StepAP242_ItemIdentifiedRepresentationUsage;
		 StepAP242_ItemIdentifiedRepresentationUsage();

		/****** StepAP242_ItemIdentifiedRepresentationUsage::Definition ******/
		/****** md5 signature: 20daba1ca7b2d1871260b0f7c5ec8645 ******/
		%feature("compactdefaultargs") Definition;
		%feature("autodoc", "Return
-------
StepAP242_ItemIdentifiedRepresentationUsageDefinition

Description
-----------
Returns field Definition.
") Definition;
		StepAP242_ItemIdentifiedRepresentationUsageDefinition Definition();

		/****** StepAP242_ItemIdentifiedRepresentationUsage::Description ******/
		/****** md5 signature: 7afda2a98699b570b25a81c5acf9e043 ******/
		%feature("compactdefaultargs") Description;
		%feature("autodoc", "Return
-------
opencascade::handle<TCollection_HAsciiString>

Description
-----------
Returns field Description.
") Description;
		opencascade::handle<TCollection_HAsciiString> Description();

		/****** StepAP242_ItemIdentifiedRepresentationUsage::IdentifiedItem ******/
		/****** md5 signature: 2f7ebe1107954650bb508514bae23994 ******/
		%feature("compactdefaultargs") IdentifiedItem;
		%feature("autodoc", "Return
-------
opencascade::handle<StepRepr_HArray1OfRepresentationItem>

Description
-----------
Returns field IdentifiedItem.
") IdentifiedItem;
		opencascade::handle<StepRepr_HArray1OfRepresentationItem> IdentifiedItem();

		/****** StepAP242_ItemIdentifiedRepresentationUsage::IdentifiedItemValue ******/
		/****** md5 signature: d901fcdbe75f6f4819aea517aa0951ee ******/
		%feature("compactdefaultargs") IdentifiedItemValue;
		%feature("autodoc", "
Parameters
----------
num: int

Return
-------
opencascade::handle<StepRepr_RepresentationItem>

Description
-----------
Returns identified item with given number.
") IdentifiedItemValue;
		opencascade::handle<StepRepr_RepresentationItem> IdentifiedItemValue(const Standard_Integer num);

		/****** StepAP242_ItemIdentifiedRepresentationUsage::Init ******/
		/****** md5 signature: 6d1eb1c4fa0f31b992b8238c982be05a ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
theName: TCollection_HAsciiString
theDescription: TCollection_HAsciiString
theDefinition: StepAP242_ItemIdentifiedRepresentationUsageDefinition
theUsedRepresentation: StepRepr_Representation
theIdentifiedItem: StepRepr_HArray1OfRepresentationItem

Return
-------
None

Description
-----------
Init all fields own and inherited.
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & theName, const opencascade::handle<TCollection_HAsciiString> & theDescription, const StepAP242_ItemIdentifiedRepresentationUsageDefinition & theDefinition, const opencascade::handle<StepRepr_Representation> & theUsedRepresentation, const opencascade::handle<StepRepr_HArray1OfRepresentationItem> & theIdentifiedItem);

		/****** StepAP242_ItemIdentifiedRepresentationUsage::Name ******/
		/****** md5 signature: a48270f13ec87e0b7c4b0136a8804c98 ******/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "Return
-------
opencascade::handle<TCollection_HAsciiString>

Description
-----------
Returns field Name.
") Name;
		opencascade::handle<TCollection_HAsciiString> Name();

		/****** StepAP242_ItemIdentifiedRepresentationUsage::NbIdentifiedItem ******/
		/****** md5 signature: 60f8e4abc308ba7cd5d67e96c8cdb010 ******/
		%feature("compactdefaultargs") NbIdentifiedItem;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns number of identified items.
") NbIdentifiedItem;
		Standard_Integer NbIdentifiedItem();

		/****** StepAP242_ItemIdentifiedRepresentationUsage::SetDefinition ******/
		/****** md5 signature: cd39bedc7b00410c1ca91625b706751a ******/
		%feature("compactdefaultargs") SetDefinition;
		%feature("autodoc", "
Parameters
----------
theDefinition: StepAP242_ItemIdentifiedRepresentationUsageDefinition

Return
-------
None

Description
-----------
Set field Definition.
") SetDefinition;
		void SetDefinition(const StepAP242_ItemIdentifiedRepresentationUsageDefinition & theDefinition);

		/****** StepAP242_ItemIdentifiedRepresentationUsage::SetDescription ******/
		/****** md5 signature: 0bce0561a53455957ccc1e744344d445 ******/
		%feature("compactdefaultargs") SetDescription;
		%feature("autodoc", "
Parameters
----------
theDescription: TCollection_HAsciiString

Return
-------
None

Description
-----------
Set field Description.
") SetDescription;
		void SetDescription(const opencascade::handle<TCollection_HAsciiString> & theDescription);

		/****** StepAP242_ItemIdentifiedRepresentationUsage::SetIdentifiedItem ******/
		/****** md5 signature: c8c178c6a18f5eef57cf629ecf236a8b ******/
		%feature("compactdefaultargs") SetIdentifiedItem;
		%feature("autodoc", "
Parameters
----------
theIdentifiedItem: StepRepr_HArray1OfRepresentationItem

Return
-------
None

Description
-----------
Set field IdentifiedItem.
") SetIdentifiedItem;
		void SetIdentifiedItem(const opencascade::handle<StepRepr_HArray1OfRepresentationItem> & theIdentifiedItem);

		/****** StepAP242_ItemIdentifiedRepresentationUsage::SetIdentifiedItemValue ******/
		/****** md5 signature: 1785481ef39e08611f3beba3da47577e ******/
		%feature("compactdefaultargs") SetIdentifiedItemValue;
		%feature("autodoc", "
Parameters
----------
num: int
theItem: StepRepr_RepresentationItem

Return
-------
None

Description
-----------
Set identified item with given number.
") SetIdentifiedItemValue;
		void SetIdentifiedItemValue(const Standard_Integer num, const opencascade::handle<StepRepr_RepresentationItem> & theItem);

		/****** StepAP242_ItemIdentifiedRepresentationUsage::SetName ******/
		/****** md5 signature: e058c117d39fc45f2a180acd037ae283 ******/
		%feature("compactdefaultargs") SetName;
		%feature("autodoc", "
Parameters
----------
theName: TCollection_HAsciiString

Return
-------
None

Description
-----------
Set field Name.
") SetName;
		void SetName(const opencascade::handle<TCollection_HAsciiString> & theName);

		/****** StepAP242_ItemIdentifiedRepresentationUsage::SetUsedRepresentation ******/
		/****** md5 signature: 57f2b7bf4737b55bb8dc47cbb0799237 ******/
		%feature("compactdefaultargs") SetUsedRepresentation;
		%feature("autodoc", "
Parameters
----------
theUsedRepresentation: StepRepr_Representation

Return
-------
None

Description
-----------
Set field UsedRepresentation.
") SetUsedRepresentation;
		void SetUsedRepresentation(const opencascade::handle<StepRepr_Representation> & theUsedRepresentation);

		/****** StepAP242_ItemIdentifiedRepresentationUsage::UsedRepresentation ******/
		/****** md5 signature: 31fb83363cd632dfd92cd10a687caef9 ******/
		%feature("compactdefaultargs") UsedRepresentation;
		%feature("autodoc", "Return
-------
opencascade::handle<StepRepr_Representation>

Description
-----------
Returns field UsedRepresentation.
") UsedRepresentation;
		opencascade::handle<StepRepr_Representation> UsedRepresentation();

};


%make_alias(StepAP242_ItemIdentifiedRepresentationUsage)

%extend StepAP242_ItemIdentifiedRepresentationUsage {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************************************************
* class StepAP242_ItemIdentifiedRepresentationUsageDefinition *
**************************************************************/
class StepAP242_ItemIdentifiedRepresentationUsageDefinition : public StepData_SelectType {
	public:
		/****** StepAP242_ItemIdentifiedRepresentationUsageDefinition::StepAP242_ItemIdentifiedRepresentationUsageDefinition ******/
		/****** md5 signature: 76d0b93fbe843df7772692c72081603a ******/
		%feature("compactdefaultargs") StepAP242_ItemIdentifiedRepresentationUsageDefinition;
		%feature("autodoc", "Return
-------
None

Description
-----------
Returns a ItemIdentifiedRepresentationUsageDefinition select type.
") StepAP242_ItemIdentifiedRepresentationUsageDefinition;
		 StepAP242_ItemIdentifiedRepresentationUsageDefinition();

		/****** StepAP242_ItemIdentifiedRepresentationUsageDefinition::AppliedApprovalAssignment ******/
		/****** md5 signature: ca60e482f648328c5ae5e0ad7669f866 ******/
		%feature("compactdefaultargs") AppliedApprovalAssignment;
		%feature("autodoc", "Return
-------
opencascade::handle<StepAP214_AppliedApprovalAssignment>

Description
-----------
returns Value as a AppliedApprovalAssignment (Null if another type).
") AppliedApprovalAssignment;
		opencascade::handle<StepAP214_AppliedApprovalAssignment> AppliedApprovalAssignment();

		/****** StepAP242_ItemIdentifiedRepresentationUsageDefinition::AppliedDateAndTimeAssignment ******/
		/****** md5 signature: 16fc1abf50cc234009fe332637a9fedd ******/
		%feature("compactdefaultargs") AppliedDateAndTimeAssignment;
		%feature("autodoc", "Return
-------
opencascade::handle<StepAP214_AppliedDateAndTimeAssignment>

Description
-----------
returns Value as a AppliedDateAndTimeAssignment (Null if another type).
") AppliedDateAndTimeAssignment;
		opencascade::handle<StepAP214_AppliedDateAndTimeAssignment> AppliedDateAndTimeAssignment();

		/****** StepAP242_ItemIdentifiedRepresentationUsageDefinition::AppliedDateAssignment ******/
		/****** md5 signature: 95f02ff6ee5a06ff58ec9a3c847a5aa0 ******/
		%feature("compactdefaultargs") AppliedDateAssignment;
		%feature("autodoc", "Return
-------
opencascade::handle<StepAP214_AppliedDateAssignment>

Description
-----------
returns Value as a AppliedDateAssignment (Null if another type).
") AppliedDateAssignment;
		opencascade::handle<StepAP214_AppliedDateAssignment> AppliedDateAssignment();

		/****** StepAP242_ItemIdentifiedRepresentationUsageDefinition::AppliedDocumentReference ******/
		/****** md5 signature: 47ed92e96b7cd9b2fa1a10cd8fce5461 ******/
		%feature("compactdefaultargs") AppliedDocumentReference;
		%feature("autodoc", "Return
-------
opencascade::handle<StepAP214_AppliedDocumentReference>

Description
-----------
returns Value as a AppliedDocumentReference (Null if another type).
") AppliedDocumentReference;
		opencascade::handle<StepAP214_AppliedDocumentReference> AppliedDocumentReference();

		/****** StepAP242_ItemIdentifiedRepresentationUsageDefinition::AppliedExternalIdentificationAssignment ******/
		/****** md5 signature: c1e1ee7fb84978d2ab998a39c57f9501 ******/
		%feature("compactdefaultargs") AppliedExternalIdentificationAssignment;
		%feature("autodoc", "Return
-------
opencascade::handle<StepAP214_AppliedExternalIdentificationAssignment>

Description
-----------
returns Value as a AppliedExternalIdentificationAssignment (Null if another type).
") AppliedExternalIdentificationAssignment;
		opencascade::handle<StepAP214_AppliedExternalIdentificationAssignment> AppliedExternalIdentificationAssignment();

		/****** StepAP242_ItemIdentifiedRepresentationUsageDefinition::AppliedGroupAssignment ******/
		/****** md5 signature: 2541e6555b7cee7824b2581bd1cd3b7a ******/
		%feature("compactdefaultargs") AppliedGroupAssignment;
		%feature("autodoc", "Return
-------
opencascade::handle<StepAP214_AppliedGroupAssignment>

Description
-----------
returns Value as a AppliedGroupAssignment (Null if another type).
") AppliedGroupAssignment;
		opencascade::handle<StepAP214_AppliedGroupAssignment> AppliedGroupAssignment();

		/****** StepAP242_ItemIdentifiedRepresentationUsageDefinition::AppliedOrganizationAssignment ******/
		/****** md5 signature: 8446a365b6d2478aac8caed1d00e6d4a ******/
		%feature("compactdefaultargs") AppliedOrganizationAssignment;
		%feature("autodoc", "Return
-------
opencascade::handle<StepAP214_AppliedOrganizationAssignment>

Description
-----------
returns Value as a AppliedOrganizationAssignment (Null if another type).
") AppliedOrganizationAssignment;
		opencascade::handle<StepAP214_AppliedOrganizationAssignment> AppliedOrganizationAssignment();

		/****** StepAP242_ItemIdentifiedRepresentationUsageDefinition::AppliedPersonAndOrganizationAssignment ******/
		/****** md5 signature: 0e985ae04bc0555d92571f20c0a0b2d2 ******/
		%feature("compactdefaultargs") AppliedPersonAndOrganizationAssignment;
		%feature("autodoc", "Return
-------
opencascade::handle<StepAP214_AppliedPersonAndOrganizationAssignment>

Description
-----------
returns Value as a AppliedPersonAndOrganizationAssignment (Null if another type).
") AppliedPersonAndOrganizationAssignment;
		opencascade::handle<StepAP214_AppliedPersonAndOrganizationAssignment> AppliedPersonAndOrganizationAssignment();

		/****** StepAP242_ItemIdentifiedRepresentationUsageDefinition::AppliedSecurityClassificationAssignment ******/
		/****** md5 signature: d9f88a5651d62fb34d2cc5b63416bcfc ******/
		%feature("compactdefaultargs") AppliedSecurityClassificationAssignment;
		%feature("autodoc", "Return
-------
opencascade::handle<StepAP214_AppliedSecurityClassificationAssignment>

Description
-----------
returns Value as a AppliedSecurityClassificationAssignment (Null if another type).
") AppliedSecurityClassificationAssignment;
		opencascade::handle<StepAP214_AppliedSecurityClassificationAssignment> AppliedSecurityClassificationAssignment();

		/****** StepAP242_ItemIdentifiedRepresentationUsageDefinition::CaseNum ******/
		/****** md5 signature: f0e39118a9846e44ccd59de148215261 ******/
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
Recognizes a ItemIdentifiedRepresentationUsageDefinition Kind Entity that is: 1 -> AppliedApprovalAssignment 2 -> AppliedDateAndTimeAssignment 3 -> AppliedDateAssignment 4 -> AppliedDocumentReference 5 -> AppliedExternalIdentificationAssignment 6 -> AppliedGroupAssignment 7 -> AppliedOrganizationAssignment 8 -> AppliedPersonAndOrganizationAssignment 9 -> AppliedSecurityClassificationAssignment 10 -> DimensionalSize 11 -> GeneralProperty 12 -> GeometricTolerance 13 -> ProductDefinitionRelationship 14 -> PropertyDefinition 15 -> PropertyDefinitionRelationship 16 -> ShapeAspect 17 -> ShapeAspectRelationship 0 else.
") CaseNum;
		Standard_Integer CaseNum(const opencascade::handle<Standard_Transient> & ent);

		/****** StepAP242_ItemIdentifiedRepresentationUsageDefinition::DimensionalSize ******/
		/****** md5 signature: b3d1e5ecfb9af68552cff269c1a5a7db ******/
		%feature("compactdefaultargs") DimensionalSize;
		%feature("autodoc", "Return
-------
opencascade::handle<StepShape_DimensionalSize>

Description
-----------
returns Value as a DimensionalSize (Null if another type).
") DimensionalSize;
		opencascade::handle<StepShape_DimensionalSize> DimensionalSize();

		/****** StepAP242_ItemIdentifiedRepresentationUsageDefinition::GeneralProperty ******/
		/****** md5 signature: 644fc2281dcbe4ea457975f6595935d0 ******/
		%feature("compactdefaultargs") GeneralProperty;
		%feature("autodoc", "Return
-------
opencascade::handle<StepBasic_GeneralProperty>

Description
-----------
returns Value as a GeneralProperty (Null if another type).
") GeneralProperty;
		opencascade::handle<StepBasic_GeneralProperty> GeneralProperty();

		/****** StepAP242_ItemIdentifiedRepresentationUsageDefinition::GeometricTolerance ******/
		/****** md5 signature: e590dafae3b1364da15d0f21b2cf4d32 ******/
		%feature("compactdefaultargs") GeometricTolerance;
		%feature("autodoc", "Return
-------
opencascade::handle<StepDimTol_GeometricTolerance>

Description
-----------
returns Value as a GeometricTolerance (Null if another type).
") GeometricTolerance;
		opencascade::handle<StepDimTol_GeometricTolerance> GeometricTolerance();

		/****** StepAP242_ItemIdentifiedRepresentationUsageDefinition::ProductDefinitionRelationship ******/
		/****** md5 signature: 8884670d0de6dcec838b821592ead2d2 ******/
		%feature("compactdefaultargs") ProductDefinitionRelationship;
		%feature("autodoc", "Return
-------
opencascade::handle<StepBasic_ProductDefinitionRelationship>

Description
-----------
returns Value as a ProductDefinitionRelationship (Null if another type).
") ProductDefinitionRelationship;
		opencascade::handle<StepBasic_ProductDefinitionRelationship> ProductDefinitionRelationship();

		/****** StepAP242_ItemIdentifiedRepresentationUsageDefinition::PropertyDefinition ******/
		/****** md5 signature: 4b7b4910929a0e1832918f8266d39349 ******/
		%feature("compactdefaultargs") PropertyDefinition;
		%feature("autodoc", "Return
-------
opencascade::handle<StepRepr_PropertyDefinition>

Description
-----------
returns Value as a PropertyDefinition (Null if another type).
") PropertyDefinition;
		opencascade::handle<StepRepr_PropertyDefinition> PropertyDefinition();

		/****** StepAP242_ItemIdentifiedRepresentationUsageDefinition::PropertyDefinitionRelationship ******/
		/****** md5 signature: aaa132671e13ca417adc8ca962dee750 ******/
		%feature("compactdefaultargs") PropertyDefinitionRelationship;
		%feature("autodoc", "Return
-------
opencascade::handle<StepRepr_PropertyDefinitionRelationship>

Description
-----------
returns Value as a PropertyDefinitionRelationship (Null if another type).
") PropertyDefinitionRelationship;
		opencascade::handle<StepRepr_PropertyDefinitionRelationship> PropertyDefinitionRelationship();

		/****** StepAP242_ItemIdentifiedRepresentationUsageDefinition::ShapeAspect ******/
		/****** md5 signature: 6c476d31e71221a87c411540ef5855cb ******/
		%feature("compactdefaultargs") ShapeAspect;
		%feature("autodoc", "Return
-------
opencascade::handle<StepRepr_ShapeAspect>

Description
-----------
returns Value as a ShapeAspect (Null if another type).
") ShapeAspect;
		opencascade::handle<StepRepr_ShapeAspect> ShapeAspect();

		/****** StepAP242_ItemIdentifiedRepresentationUsageDefinition::ShapeAspectRelationship ******/
		/****** md5 signature: 35bed4b7262e5cb161ba72768027d32c ******/
		%feature("compactdefaultargs") ShapeAspectRelationship;
		%feature("autodoc", "Return
-------
opencascade::handle<StepRepr_ShapeAspectRelationship>

Description
-----------
returns Value as a ShapeAspectRelationship (Null if another type).
") ShapeAspectRelationship;
		opencascade::handle<StepRepr_ShapeAspectRelationship> ShapeAspectRelationship();

};


%extend StepAP242_ItemIdentifiedRepresentationUsageDefinition {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************************************
* class StepAP242_DraughtingModelItemAssociation *
*************************************************/
class StepAP242_DraughtingModelItemAssociation : public StepAP242_ItemIdentifiedRepresentationUsage {
	public:
		/****** StepAP242_DraughtingModelItemAssociation::StepAP242_DraughtingModelItemAssociation ******/
		/****** md5 signature: 7aac785b01feeb00ebc93a512548ff0d ******/
		%feature("compactdefaultargs") StepAP242_DraughtingModelItemAssociation;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") StepAP242_DraughtingModelItemAssociation;
		 StepAP242_DraughtingModelItemAssociation();

};


%make_alias(StepAP242_DraughtingModelItemAssociation)

%extend StepAP242_DraughtingModelItemAssociation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************************
* class StepAP242_GeometricItemSpecificUsage *
*********************************************/
class StepAP242_GeometricItemSpecificUsage : public StepAP242_ItemIdentifiedRepresentationUsage {
	public:
		/****** StepAP242_GeometricItemSpecificUsage::StepAP242_GeometricItemSpecificUsage ******/
		/****** md5 signature: 65caf3f6e29ff5f7fab4a515eeae6d42 ******/
		%feature("compactdefaultargs") StepAP242_GeometricItemSpecificUsage;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") StepAP242_GeometricItemSpecificUsage;
		 StepAP242_GeometricItemSpecificUsage();

};


%make_alias(StepAP242_GeometricItemSpecificUsage)

%extend StepAP242_GeometricItemSpecificUsage {
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
