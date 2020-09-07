/*
Copyright 2008-2020 Thomas Paviot (tpaviot@gmail.com)

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
https://www.opencascade.com/doc/occt-7.4.0/refman/html/package_stepap242.html"
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
%include ../common/Operators.i
%include ../common/OccHandle.i


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

/* python proy classes for enums */
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
		/****************** StepAP242_IdAttribute ******************/
		/**** md5 signature: 3f85dd7713df26a53591028dbd295481 ****/
		%feature("compactdefaultargs") StepAP242_IdAttribute;
		%feature("autodoc", "Returns a idattribute.

Returns
-------
None
") StepAP242_IdAttribute;
		 StepAP242_IdAttribute();

		/****************** AttributeValue ******************/
		/**** md5 signature: b2166d5b240f01925e9f522a0c744e06 ****/
		%feature("compactdefaultargs") AttributeValue;
		%feature("autodoc", "Returns field attributevalue.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") AttributeValue;
		opencascade::handle<TCollection_HAsciiString> AttributeValue();

		/****************** IdentifiedItem ******************/
		/**** md5 signature: 22dbcc40152d04af05b3e34678d7fb4e ****/
		%feature("compactdefaultargs") IdentifiedItem;
		%feature("autodoc", "Returns identifieditem.

Returns
-------
StepAP242_IdAttributeSelect
") IdentifiedItem;
		StepAP242_IdAttributeSelect IdentifiedItem();

		/****************** Init ******************/
		/**** md5 signature: 08239daa2e0d431bf0c6be628d64a336 ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Init all field own and inherited.

Parameters
----------
theAttributeValue: TCollection_HAsciiString
theIdentifiedItem: StepAP242_IdAttributeSelect

Returns
-------
None
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & theAttributeValue, const StepAP242_IdAttributeSelect & theIdentifiedItem);

		/****************** SetAttributeValue ******************/
		/**** md5 signature: ad1c6cea5240eabc1985dbab2d3519a9 ****/
		%feature("compactdefaultargs") SetAttributeValue;
		%feature("autodoc", "No available documentation.

Parameters
----------
theAttributeValue: TCollection_HAsciiString

Returns
-------
None
") SetAttributeValue;
		void SetAttributeValue(const opencascade::handle<TCollection_HAsciiString> & theAttributeValue);

		/****************** SetIdentifiedItem ******************/
		/**** md5 signature: a284a423df0c9582240124b9512fa1f9 ****/
		%feature("compactdefaultargs") SetIdentifiedItem;
		%feature("autodoc", "Set field identifieditem.

Parameters
----------
theIdentifiedItem: StepAP242_IdAttributeSelect

Returns
-------
None
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
		/****************** StepAP242_IdAttributeSelect ******************/
		/**** md5 signature: b49b8dbe373799ea3dc321abe8905809 ****/
		%feature("compactdefaultargs") StepAP242_IdAttributeSelect;
		%feature("autodoc", "Returns a idattributeselect select type.

Returns
-------
None
") StepAP242_IdAttributeSelect;
		 StepAP242_IdAttributeSelect();

		/****************** Action ******************/
		/**** md5 signature: 4229fc384fff50d0489b9a9ab4a5487d ****/
		%feature("compactdefaultargs") Action;
		%feature("autodoc", "Returns value as a action (null if another type).

Returns
-------
opencascade::handle<StepBasic_Action>
") Action;
		opencascade::handle<StepBasic_Action> Action();

		/****************** Address ******************/
		/**** md5 signature: 0e4a9c20b4c65180ca616fd1ef4a7cd4 ****/
		%feature("compactdefaultargs") Address;
		%feature("autodoc", "Returns value as a address (null if another type).

Returns
-------
opencascade::handle<StepBasic_Address>
") Address;
		opencascade::handle<StepBasic_Address> Address();

		/****************** ApplicationContext ******************/
		/**** md5 signature: 6211e18e5d81dbd133c80107e0f32461 ****/
		%feature("compactdefaultargs") ApplicationContext;
		%feature("autodoc", "Returns value as a applicationcontext (null if another type).

Returns
-------
opencascade::handle<StepBasic_ApplicationContext>
") ApplicationContext;
		opencascade::handle<StepBasic_ApplicationContext> ApplicationContext();

		/****************** CaseNum ******************/
		/**** md5 signature: f0e39118a9846e44ccd59de148215261 ****/
		%feature("compactdefaultargs") CaseNum;
		%feature("autodoc", "Recognizes a idattributeselect kind entity that is : 1 -> action 2 -> address 3 -> applicationcontext 4 -> dimensionalsize 5 -> geometrictolerance 6 -> group 7 -> reserved for organizatonalproject (not implemented in occt) 8 -> productcategory 9 -> propertydefinition 10 -> representation 11 -> shapeaspect 12 -> shapeaspectrelationship 0 else.

Parameters
----------
ent: Standard_Transient

Returns
-------
int
") CaseNum;
		Standard_Integer CaseNum(const opencascade::handle<Standard_Transient> & ent);

		/****************** DimensionalSize ******************/
		/**** md5 signature: b3d1e5ecfb9af68552cff269c1a5a7db ****/
		%feature("compactdefaultargs") DimensionalSize;
		%feature("autodoc", "Returns value as a dimensionalsize (null if another type).

Returns
-------
opencascade::handle<StepShape_DimensionalSize>
") DimensionalSize;
		opencascade::handle<StepShape_DimensionalSize> DimensionalSize();

		/****************** GeometricTolerance ******************/
		/**** md5 signature: e590dafae3b1364da15d0f21b2cf4d32 ****/
		%feature("compactdefaultargs") GeometricTolerance;
		%feature("autodoc", "Returns value as a geometrictolerance (null if another type).

Returns
-------
opencascade::handle<StepDimTol_GeometricTolerance>
") GeometricTolerance;
		opencascade::handle<StepDimTol_GeometricTolerance> GeometricTolerance();

		/****************** Group ******************/
		/**** md5 signature: 58a65f6494d2bc516fda4ce1650fbefd ****/
		%feature("compactdefaultargs") Group;
		%feature("autodoc", "Returns value as a group (null if another type).

Returns
-------
opencascade::handle<StepBasic_Group>
") Group;
		opencascade::handle<StepBasic_Group> Group();

		/****************** ProductCategory ******************/
		/**** md5 signature: c68a3acfc5b2c48065c10648b3c34e4b ****/
		%feature("compactdefaultargs") ProductCategory;
		%feature("autodoc", "Returns value as a productcategory (null if another type).

Returns
-------
opencascade::handle<StepBasic_ProductCategory>
") ProductCategory;
		opencascade::handle<StepBasic_ProductCategory> ProductCategory();

		/****************** PropertyDefinition ******************/
		/**** md5 signature: 4b7b4910929a0e1832918f8266d39349 ****/
		%feature("compactdefaultargs") PropertyDefinition;
		%feature("autodoc", "Returns value as a propertydefinition (null if another type).

Returns
-------
opencascade::handle<StepRepr_PropertyDefinition>
") PropertyDefinition;
		opencascade::handle<StepRepr_PropertyDefinition> PropertyDefinition();

		/****************** Representation ******************/
		/**** md5 signature: b68b8aa0615de130a54bdd2ee7c69058 ****/
		%feature("compactdefaultargs") Representation;
		%feature("autodoc", "Returns value as a representation (null if another type).

Returns
-------
opencascade::handle<StepRepr_Representation>
") Representation;
		opencascade::handle<StepRepr_Representation> Representation();

		/****************** ShapeAspect ******************/
		/**** md5 signature: 6c476d31e71221a87c411540ef5855cb ****/
		%feature("compactdefaultargs") ShapeAspect;
		%feature("autodoc", "Returns value as a shapeaspect (null if another type).

Returns
-------
opencascade::handle<StepRepr_ShapeAspect>
") ShapeAspect;
		opencascade::handle<StepRepr_ShapeAspect> ShapeAspect();

		/****************** ShapeAspectRelationship ******************/
		/**** md5 signature: 35bed4b7262e5cb161ba72768027d32c ****/
		%feature("compactdefaultargs") ShapeAspectRelationship;
		%feature("autodoc", "Returns value as a shapeaspectrelationship (null if another type).

Returns
-------
opencascade::handle<StepRepr_ShapeAspectRelationship>
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
		/****************** StepAP242_ItemIdentifiedRepresentationUsage ******************/
		/**** md5 signature: 92918d10047985cffed6961135c446c7 ****/
		%feature("compactdefaultargs") StepAP242_ItemIdentifiedRepresentationUsage;
		%feature("autodoc", "Returns a itemidentifiedrepresentationusage.

Returns
-------
None
") StepAP242_ItemIdentifiedRepresentationUsage;
		 StepAP242_ItemIdentifiedRepresentationUsage();

		/****************** Definition ******************/
		/**** md5 signature: 20daba1ca7b2d1871260b0f7c5ec8645 ****/
		%feature("compactdefaultargs") Definition;
		%feature("autodoc", "Returns field definition.

Returns
-------
StepAP242_ItemIdentifiedRepresentationUsageDefinition
") Definition;
		StepAP242_ItemIdentifiedRepresentationUsageDefinition Definition();

		/****************** Description ******************/
		/**** md5 signature: 7afda2a98699b570b25a81c5acf9e043 ****/
		%feature("compactdefaultargs") Description;
		%feature("autodoc", "Returns field description.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") Description;
		opencascade::handle<TCollection_HAsciiString> Description();

		/****************** IdentifiedItem ******************/
		/**** md5 signature: 2f7ebe1107954650bb508514bae23994 ****/
		%feature("compactdefaultargs") IdentifiedItem;
		%feature("autodoc", "Returns field identifieditem.

Returns
-------
opencascade::handle<StepRepr_HArray1OfRepresentationItem>
") IdentifiedItem;
		opencascade::handle<StepRepr_HArray1OfRepresentationItem> IdentifiedItem();

		/****************** IdentifiedItemValue ******************/
		/**** md5 signature: d901fcdbe75f6f4819aea517aa0951ee ****/
		%feature("compactdefaultargs") IdentifiedItemValue;
		%feature("autodoc", "Returns identified item with given number.

Parameters
----------
num: int

Returns
-------
opencascade::handle<StepRepr_RepresentationItem>
") IdentifiedItemValue;
		opencascade::handle<StepRepr_RepresentationItem> IdentifiedItemValue(const Standard_Integer num);

		/****************** Init ******************/
		/**** md5 signature: 6d1eb1c4fa0f31b992b8238c982be05a ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Init all fields own and inherited.

Parameters
----------
theName: TCollection_HAsciiString
theDescription: TCollection_HAsciiString
theDefinition: StepAP242_ItemIdentifiedRepresentationUsageDefinition
theUsedRepresentation: StepRepr_Representation
theIdentifiedItem: StepRepr_HArray1OfRepresentationItem

Returns
-------
None
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & theName, const opencascade::handle<TCollection_HAsciiString> & theDescription, const StepAP242_ItemIdentifiedRepresentationUsageDefinition & theDefinition, const opencascade::handle<StepRepr_Representation> & theUsedRepresentation, const opencascade::handle<StepRepr_HArray1OfRepresentationItem> & theIdentifiedItem);

		/****************** Name ******************/
		/**** md5 signature: a48270f13ec87e0b7c4b0136a8804c98 ****/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "Returns field name.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") Name;
		opencascade::handle<TCollection_HAsciiString> Name();

		/****************** NbIdentifiedItem ******************/
		/**** md5 signature: 60f8e4abc308ba7cd5d67e96c8cdb010 ****/
		%feature("compactdefaultargs") NbIdentifiedItem;
		%feature("autodoc", "Returns number of identified items.

Returns
-------
int
") NbIdentifiedItem;
		Standard_Integer NbIdentifiedItem();

		/****************** SetDefinition ******************/
		/**** md5 signature: cd39bedc7b00410c1ca91625b706751a ****/
		%feature("compactdefaultargs") SetDefinition;
		%feature("autodoc", "Set field definition.

Parameters
----------
theDefinition: StepAP242_ItemIdentifiedRepresentationUsageDefinition

Returns
-------
None
") SetDefinition;
		void SetDefinition(const StepAP242_ItemIdentifiedRepresentationUsageDefinition & theDefinition);

		/****************** SetDescription ******************/
		/**** md5 signature: 0bce0561a53455957ccc1e744344d445 ****/
		%feature("compactdefaultargs") SetDescription;
		%feature("autodoc", "Set field description.

Parameters
----------
theDescription: TCollection_HAsciiString

Returns
-------
None
") SetDescription;
		void SetDescription(const opencascade::handle<TCollection_HAsciiString> & theDescription);

		/****************** SetIdentifiedItem ******************/
		/**** md5 signature: c8c178c6a18f5eef57cf629ecf236a8b ****/
		%feature("compactdefaultargs") SetIdentifiedItem;
		%feature("autodoc", "Set fiels identifieditem.

Parameters
----------
theIdentifiedItem: StepRepr_HArray1OfRepresentationItem

Returns
-------
None
") SetIdentifiedItem;
		void SetIdentifiedItem(const opencascade::handle<StepRepr_HArray1OfRepresentationItem> & theIdentifiedItem);

		/****************** SetIdentifiedItemValue ******************/
		/**** md5 signature: 1785481ef39e08611f3beba3da47577e ****/
		%feature("compactdefaultargs") SetIdentifiedItemValue;
		%feature("autodoc", "Set identified item with given number.

Parameters
----------
num: int
theItem: StepRepr_RepresentationItem

Returns
-------
None
") SetIdentifiedItemValue;
		void SetIdentifiedItemValue(const Standard_Integer num, const opencascade::handle<StepRepr_RepresentationItem> & theItem);

		/****************** SetName ******************/
		/**** md5 signature: e058c117d39fc45f2a180acd037ae283 ****/
		%feature("compactdefaultargs") SetName;
		%feature("autodoc", "Set field name.

Parameters
----------
theName: TCollection_HAsciiString

Returns
-------
None
") SetName;
		void SetName(const opencascade::handle<TCollection_HAsciiString> & theName);

		/****************** SetUsedRepresentation ******************/
		/**** md5 signature: 57f2b7bf4737b55bb8dc47cbb0799237 ****/
		%feature("compactdefaultargs") SetUsedRepresentation;
		%feature("autodoc", "Set field usedrepresentation.

Parameters
----------
theUsedRepresentation: StepRepr_Representation

Returns
-------
None
") SetUsedRepresentation;
		void SetUsedRepresentation(const opencascade::handle<StepRepr_Representation> & theUsedRepresentation);

		/****************** UsedRepresentation ******************/
		/**** md5 signature: 31fb83363cd632dfd92cd10a687caef9 ****/
		%feature("compactdefaultargs") UsedRepresentation;
		%feature("autodoc", "Retuns field usedrepresentation.

Returns
-------
opencascade::handle<StepRepr_Representation>
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
		/****************** StepAP242_ItemIdentifiedRepresentationUsageDefinition ******************/
		/**** md5 signature: 76d0b93fbe843df7772692c72081603a ****/
		%feature("compactdefaultargs") StepAP242_ItemIdentifiedRepresentationUsageDefinition;
		%feature("autodoc", "Returns a itemidentifiedrepresentationusagedefinition select type.

Returns
-------
None
") StepAP242_ItemIdentifiedRepresentationUsageDefinition;
		 StepAP242_ItemIdentifiedRepresentationUsageDefinition();

		/****************** AppliedApprovalAssignment ******************/
		/**** md5 signature: ca60e482f648328c5ae5e0ad7669f866 ****/
		%feature("compactdefaultargs") AppliedApprovalAssignment;
		%feature("autodoc", "Returns value as a appliedapprovalassignment (null if another type).

Returns
-------
opencascade::handle<StepAP214_AppliedApprovalAssignment>
") AppliedApprovalAssignment;
		opencascade::handle<StepAP214_AppliedApprovalAssignment> AppliedApprovalAssignment();

		/****************** AppliedDateAndTimeAssignment ******************/
		/**** md5 signature: 16fc1abf50cc234009fe332637a9fedd ****/
		%feature("compactdefaultargs") AppliedDateAndTimeAssignment;
		%feature("autodoc", "Returns value as a applieddateandtimeassignment (null if another type).

Returns
-------
opencascade::handle<StepAP214_AppliedDateAndTimeAssignment>
") AppliedDateAndTimeAssignment;
		opencascade::handle<StepAP214_AppliedDateAndTimeAssignment> AppliedDateAndTimeAssignment();

		/****************** AppliedDateAssignment ******************/
		/**** md5 signature: 95f02ff6ee5a06ff58ec9a3c847a5aa0 ****/
		%feature("compactdefaultargs") AppliedDateAssignment;
		%feature("autodoc", "Returns value as a applieddateassignment (null if another type).

Returns
-------
opencascade::handle<StepAP214_AppliedDateAssignment>
") AppliedDateAssignment;
		opencascade::handle<StepAP214_AppliedDateAssignment> AppliedDateAssignment();

		/****************** AppliedDocumentReference ******************/
		/**** md5 signature: 47ed92e96b7cd9b2fa1a10cd8fce5461 ****/
		%feature("compactdefaultargs") AppliedDocumentReference;
		%feature("autodoc", "Returns value as a applieddocumentreference (null if another type).

Returns
-------
opencascade::handle<StepAP214_AppliedDocumentReference>
") AppliedDocumentReference;
		opencascade::handle<StepAP214_AppliedDocumentReference> AppliedDocumentReference();

		/****************** AppliedExternalIdentificationAssignment ******************/
		/**** md5 signature: c1e1ee7fb84978d2ab998a39c57f9501 ****/
		%feature("compactdefaultargs") AppliedExternalIdentificationAssignment;
		%feature("autodoc", "Returns value as a appliedexternalidentificationassignment (null if another type).

Returns
-------
opencascade::handle<StepAP214_AppliedExternalIdentificationAssignment>
") AppliedExternalIdentificationAssignment;
		opencascade::handle<StepAP214_AppliedExternalIdentificationAssignment> AppliedExternalIdentificationAssignment();

		/****************** AppliedGroupAssignment ******************/
		/**** md5 signature: 2541e6555b7cee7824b2581bd1cd3b7a ****/
		%feature("compactdefaultargs") AppliedGroupAssignment;
		%feature("autodoc", "Returns value as a appliedgroupassignment (null if another type).

Returns
-------
opencascade::handle<StepAP214_AppliedGroupAssignment>
") AppliedGroupAssignment;
		opencascade::handle<StepAP214_AppliedGroupAssignment> AppliedGroupAssignment();

		/****************** AppliedOrganizationAssignment ******************/
		/**** md5 signature: 8446a365b6d2478aac8caed1d00e6d4a ****/
		%feature("compactdefaultargs") AppliedOrganizationAssignment;
		%feature("autodoc", "Returns value as a appliedorganizationassignment (null if another type).

Returns
-------
opencascade::handle<StepAP214_AppliedOrganizationAssignment>
") AppliedOrganizationAssignment;
		opencascade::handle<StepAP214_AppliedOrganizationAssignment> AppliedOrganizationAssignment();

		/****************** AppliedPersonAndOrganizationAssignment ******************/
		/**** md5 signature: 0e985ae04bc0555d92571f20c0a0b2d2 ****/
		%feature("compactdefaultargs") AppliedPersonAndOrganizationAssignment;
		%feature("autodoc", "Returns value as a appliedpersonandorganizationassignment (null if another type).

Returns
-------
opencascade::handle<StepAP214_AppliedPersonAndOrganizationAssignment>
") AppliedPersonAndOrganizationAssignment;
		opencascade::handle<StepAP214_AppliedPersonAndOrganizationAssignment> AppliedPersonAndOrganizationAssignment();

		/****************** AppliedSecurityClassificationAssignment ******************/
		/**** md5 signature: d9f88a5651d62fb34d2cc5b63416bcfc ****/
		%feature("compactdefaultargs") AppliedSecurityClassificationAssignment;
		%feature("autodoc", "Returns value as a appliedsecurityclassificationassignment (null if another type).

Returns
-------
opencascade::handle<StepAP214_AppliedSecurityClassificationAssignment>
") AppliedSecurityClassificationAssignment;
		opencascade::handle<StepAP214_AppliedSecurityClassificationAssignment> AppliedSecurityClassificationAssignment();

		/****************** CaseNum ******************/
		/**** md5 signature: f0e39118a9846e44ccd59de148215261 ****/
		%feature("compactdefaultargs") CaseNum;
		%feature("autodoc", "Recognizes a itemidentifiedrepresentationusagedefinition kind entity that is : 1 -> appliedapprovalassignment 2 -> applieddateandtimeassignment 3 -> applieddateassignment 4 -> applieddocumentreference 5 -> appliedexternalidentificationassignment 6 -> appliedgroupassignment 7 -> appliedorganizationassignment 8 -> appliedpersonandorganizationassignment 9 -> appliedsecurityclassificationassignment 10 -> dimensionalsize 11 -> generalproperty 12 -> geometrictolerance 13 -> productdefinitionrelationship 14 -> propertydefinition 15 -> propertydefinitionrelationship 16 -> shapeaspect 17 -> shapeaspectrelationship 0 else.

Parameters
----------
ent: Standard_Transient

Returns
-------
int
") CaseNum;
		Standard_Integer CaseNum(const opencascade::handle<Standard_Transient> & ent);

		/****************** DimensionalSize ******************/
		/**** md5 signature: b3d1e5ecfb9af68552cff269c1a5a7db ****/
		%feature("compactdefaultargs") DimensionalSize;
		%feature("autodoc", "Returns value as a dimensionalsize (null if another type).

Returns
-------
opencascade::handle<StepShape_DimensionalSize>
") DimensionalSize;
		opencascade::handle<StepShape_DimensionalSize> DimensionalSize();

		/****************** GeneralProperty ******************/
		/**** md5 signature: 644fc2281dcbe4ea457975f6595935d0 ****/
		%feature("compactdefaultargs") GeneralProperty;
		%feature("autodoc", "Returns value as a generalproperty (null if another type).

Returns
-------
opencascade::handle<StepBasic_GeneralProperty>
") GeneralProperty;
		opencascade::handle<StepBasic_GeneralProperty> GeneralProperty();

		/****************** GeometricTolerance ******************/
		/**** md5 signature: e590dafae3b1364da15d0f21b2cf4d32 ****/
		%feature("compactdefaultargs") GeometricTolerance;
		%feature("autodoc", "Returns value as a geometrictolerance (null if another type).

Returns
-------
opencascade::handle<StepDimTol_GeometricTolerance>
") GeometricTolerance;
		opencascade::handle<StepDimTol_GeometricTolerance> GeometricTolerance();

		/****************** ProductDefinitionRelationship ******************/
		/**** md5 signature: 8884670d0de6dcec838b821592ead2d2 ****/
		%feature("compactdefaultargs") ProductDefinitionRelationship;
		%feature("autodoc", "Returns value as a productdefinitionrelationship (null if another type).

Returns
-------
opencascade::handle<StepBasic_ProductDefinitionRelationship>
") ProductDefinitionRelationship;
		opencascade::handle<StepBasic_ProductDefinitionRelationship> ProductDefinitionRelationship();

		/****************** PropertyDefinition ******************/
		/**** md5 signature: 4b7b4910929a0e1832918f8266d39349 ****/
		%feature("compactdefaultargs") PropertyDefinition;
		%feature("autodoc", "Returns value as a propertydefinition (null if another type).

Returns
-------
opencascade::handle<StepRepr_PropertyDefinition>
") PropertyDefinition;
		opencascade::handle<StepRepr_PropertyDefinition> PropertyDefinition();

		/****************** PropertyDefinitionRelationship ******************/
		/**** md5 signature: aaa132671e13ca417adc8ca962dee750 ****/
		%feature("compactdefaultargs") PropertyDefinitionRelationship;
		%feature("autodoc", "Returns value as a propertydefinitionrelationship (null if another type).

Returns
-------
opencascade::handle<StepRepr_PropertyDefinitionRelationship>
") PropertyDefinitionRelationship;
		opencascade::handle<StepRepr_PropertyDefinitionRelationship> PropertyDefinitionRelationship();

		/****************** ShapeAspect ******************/
		/**** md5 signature: 6c476d31e71221a87c411540ef5855cb ****/
		%feature("compactdefaultargs") ShapeAspect;
		%feature("autodoc", "Returns value as a shapeaspect (null if another type).

Returns
-------
opencascade::handle<StepRepr_ShapeAspect>
") ShapeAspect;
		opencascade::handle<StepRepr_ShapeAspect> ShapeAspect();

		/****************** ShapeAspectRelationship ******************/
		/**** md5 signature: 35bed4b7262e5cb161ba72768027d32c ****/
		%feature("compactdefaultargs") ShapeAspectRelationship;
		%feature("autodoc", "Returns value as a shapeaspectrelationship (null if another type).

Returns
-------
opencascade::handle<StepRepr_ShapeAspectRelationship>
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
		/****************** StepAP242_DraughtingModelItemAssociation ******************/
		/**** md5 signature: 7aac785b01feeb00ebc93a512548ff0d ****/
		%feature("compactdefaultargs") StepAP242_DraughtingModelItemAssociation;
		%feature("autodoc", "No available documentation.

Returns
-------
None
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
		/****************** StepAP242_GeometricItemSpecificUsage ******************/
		/**** md5 signature: 65caf3f6e29ff5f7fab4a515eeae6d42 ****/
		%feature("compactdefaultargs") StepAP242_GeometricItemSpecificUsage;
		%feature("autodoc", "No available documentation.

Returns
-------
None
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
